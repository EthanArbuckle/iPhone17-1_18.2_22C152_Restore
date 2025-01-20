uint64_t sub_1AF7813A8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void aBlock[6];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACFB80);
  v3 = *(void *)(v2 - 8);
  v4 = *(void *)(v3 + 64);
  MEMORY[0x1F4188790](v2);
  v5 = objc_msgSend(self, sel_proxyForLocalPlayer);
  v6 = objc_msgSend(v5, sel_profileServicePrivate);

  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  v7 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v8 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v8 + v7, (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  aBlock[4] = sub_1AF781AB4;
  aBlock[5] = v8;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1AF3D3880;
  aBlock[3] = &block_descriptor_26_2;
  v9 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v6, sel_getProfilePrivacyWithHandler_, v9);
  _Block_release(v9);
  return swift_unknownObjectRelease();
}

uint64_t sub_1AF781594()
{
  return sub_1AF7AE3D0();
}

id OnboardingProfileCreationViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_1AF7AE0A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

id OnboardingProfileCreationViewController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v3[OBJC_IVAR___GKOnboardingProfileCreationViewController_hostingController] = 0;
  if (a2)
  {
    id v7 = (void *)sub_1AF7AE0A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v7 = 0;
  }
  v10.receiver = v3;
  v10.super_class = ObjectType;
  id v8 = objc_msgSendSuper2(&v10, sel_initWithNibName_bundle_, v7, a3);

  return v8;
}

id OnboardingProfileCreationViewController.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id OnboardingProfileCreationViewController.init(coder:)(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v1[OBJC_IVAR___GKOnboardingProfileCreationViewController_hostingController] = 0;
  v6.receiver = v1;
  v6.super_class = ObjectType;
  id v4 = objc_msgSendSuper2(&v6, sel_initWithCoder_, a1);

  return v4;
}

id OnboardingProfileCreationViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for OnboardingProfileCreationViewController()
{
  return self;
}

uint64_t sub_1AF781890()
{
  swift_unknownObjectRelease();

  swift_release();

  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_1AF7818D8()
{
  int v2 = *(_DWORD *)(v0 + 32);
  char v3 = *(unsigned char *)(v0 + 36);
  int v4 = *(_DWORD *)(v0 + 40);
  uint64_t v6 = *(void *)(v0 + 48);
  v5 = *(void **)(v0 + 56);
  id v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *id v7 = v1;
  v7[1] = sub_1AF781C60;
  uint64_t v8 = OUTLINED_FUNCTION_14_14();
  return sub_1AF780484(v8, v9, v10, v2, v3, v4, v6, v5);
}

uint64_t sub_1AF7819AC()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1AF7819E4()
{
  sub_1AF780908(v0);
}

uint64_t sub_1AF781A04(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1AF781A4C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ProfileCreationOnboardingView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1AF781AA8()
{
  return objectdestroy_24Tm_0(&qword_1E9ACFB80);
}

uint64_t sub_1AF781AB4()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACFB80);
  OUTLINED_FUNCTION_1_23(v0);

  return sub_1AF781594();
}

uint64_t block_copy_helper_96(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_96()
{
  return swift_release();
}

uint64_t sub_1AF781B20()
{
  return objectdestroy_24Tm_0(&qword_1E9ACFB88);
}

void sub_1AF781B2C(uint64_t a1, uint64_t a2, void *a3)
{
}

uint64_t sub_1AF781B38()
{
  return objectdestroy_24Tm_0(&qword_1E9ACFB88);
}

uint64_t objectdestroy_24Tm_0(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v5 + *(void *)(v3 + 64);
  uint64_t v7 = v4 | 7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);

  return MEMORY[0x1F4186498](v1, v6, v7);
}

void sub_1AF781BD0(uint64_t a1, uint64_t a2, void *a3)
{
}

void sub_1AF781BDC(uint64_t a1, uint64_t a2, void *a3, const char *a4)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACFB88);
  OUTLINED_FUNCTION_1_23(v9);
  sub_1AF781164(a1, a2, a3, v4 + ((*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80)), a4);
}

unint64_t AppStoreContentLookupSource.rawValue.getter()
{
  unint64_t result = 0x796C746E65636572;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD000000000000011;
      break;
    case 2:
      unint64_t result = 0x646163724177656ELL;
      break;
    case 3:
      unint64_t result = 0x756F59726F66;
      break;
    default:
      return result;
  }
  return result;
}

GameCenterUI::AppStoreContentLookupSource_optional __swiftcall AppStoreContentLookupSource.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_1AF7AEF50();
  result.value = swift_bridgeObjectRelease();
  char v5 = 4;
  if (v3 < 4) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t sub_1AF781D88(unsigned __int8 *a1, char *a2)
{
  return sub_1AF3C1C3C(*a1, *a2);
}

unint64_t sub_1AF781D98()
{
  unint64_t result = qword_1E9ACFB90;
  if (!qword_1E9ACFB90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9ACFB90);
  }
  return result;
}

uint64_t sub_1AF781DE4()
{
  return sub_1AF790C74(*v0);
}

uint64_t sub_1AF781DEC(uint64_t a1)
{
  return sub_1AF72ACEC(a1, *v1);
}

uint64_t sub_1AF781DF4(uint64_t a1)
{
  return sub_1AF46A7F0(a1, *v1);
}

GameCenterUI::AppStoreContentLookupSource_optional sub_1AF781DFC(Swift::String *a1)
{
  return AppStoreContentLookupSource.init(rawValue:)(*a1);
}

unint64_t sub_1AF781E08@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = AppStoreContentLookupSource.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unsigned char *storeEnumTagSinglePayload for AppStoreContentLookupSource(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1AF781EFCLL);
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

ValueMetadata *type metadata accessor for AppStoreContentLookupSource()
{
  return &type metadata for AppStoreContentLookupSource;
}

char *sub_1AF781F34(double a1, double a2, double a3, double a4)
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v10 = objc_allocWithZone((Class)type metadata accessor for TitledAppIconView());
  v11 = v4;
  id v12 = objc_msgSend(v10, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  *(void *)&v11[OBJC_IVAR____TtC12GameCenterUI26FocusableTitledAppIconView_embeddedView] = v12;

  v17.receiver = v11;
  v17.super_class = ObjectType;
  v13 = (char *)objc_msgSendSuper2(&v17, sel_initWithFrame_, a1, a2, a3, a4);
  objc_msgSend(v13, sel_set_gkFocusHighlightInsets_, -6.0, -6.0, -6.0, -6.0);
  objc_msgSend(v13, sel_set_gkFocusHighlightCornerRadius_, 6.0);
  id v14 = objc_msgSend(v13, sel_contentView);
  id v15 = *(id *)&v13[OBJC_IVAR____TtC12GameCenterUI26FocusableTitledAppIconView_embeddedView];
  objc_msgSend(v14, sel_addSubview_, v15);

  return v13;
}

void sub_1AF7820A0()
{
}

id sub_1AF78210C()
{
  v3.receiver = v0;
  v3.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v3, sel_layoutSubviews);
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC12GameCenterUI26FocusableTitledAppIconView_embeddedView];
  objc_msgSend(v0, sel_bounds);
  return objc_msgSend(v1, sel_setFrame_);
}

double sub_1AF7821C8(void *a1)
{
  objc_super v3 = *(void **)(v1 + OBJC_IVAR____TtC12GameCenterUI26FocusableTitledAppIconView_embeddedView);
  swift_getObjectType();

  return sub_1AF74A3AC(a1, v3);
}

uint64_t type metadata accessor for FocusableTitledAppIconView()
{
  return self;
}

uint64_t sub_1AF7822E8()
{
  type metadata accessor for AchievementsLinkProfileSection();
  uint64_t result = swift_allocObject();
  *(_WORD *)(result + 16) = 2829;
  return result;
}

uint64_t sub_1AF782314(uint64_t a1)
{
  sub_1AF36EF54(a1, (uint64_t)v54);
  sub_1AF36EF54((uint64_t)v54, (uint64_t)v56);
  uint64_t v2 = sub_1AF7A98F0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v38 - v7;
  sub_1AF36EF54(a1, (uint64_t)v55);
  uint64_t v9 = 0;
  if (sub_1AF36EFBC(v55) != 1)
  {
    id v10 = (void *)v55[0];
    id v43 = (id)v55[0];
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AC3708);
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_1AF7CB2D0;
    v48 = (uint64_t *)(v9 + 32);
    sub_1AF36EF54((uint64_t)v56, (uint64_t)v53);
    sub_1AF36EFD4((uint64_t)v53);
    uint64_t v11 = sub_1AF7AE0A0();
    v44 = v5;
    id v12 = (void *)v11;
    id v13 = (id)GKGameCenterUIFrameworkBundle();
    id v14 = (id)GKGetLocalizedStringFromTableInBundle();

    uint64_t v15 = sub_1AF7AE0E0();
    uint64_t v46 = v16;
    uint64_t v47 = v15;

    id v17 = objc_msgSend(v10, sel_playerID);
    uint64_t v18 = sub_1AF7AE0E0();
    uint64_t v41 = v19;
    uint64_t v42 = v18;

    uint64_t v20 = sub_1AF7AE0E0();
    uint64_t v39 = v21;
    uint64_t v40 = v20;
    uint64_t v45 = a1;
    uint64_t v22 = sub_1AF7AE0E0();
    uint64_t v24 = v23;
    v52[3] = type metadata accessor for AchievementsByGameAction();
    v52[4] = sub_1AF782744((unint64_t *)&qword_1E9AC6EF0, (void (*)(uint64_t))type metadata accessor for AchievementsByGameAction);
    v25 = v8;
    uint64_t v26 = v2;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v52);
    uint64_t v28 = (uint64_t)v43;
    id v29 = v43;
    ActionMetrics.init(domain:eventType:)(v40, v39, v22, v24);
    uint64_t v30 = v41;
    uint64_t *boxed_opaque_existential_1 = v42;
    boxed_opaque_existential_1[1] = v30;
    boxed_opaque_existential_1[2] = v28;
    sub_1AF7A98E0();
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v44, v25, v26);
    sub_1AF782744((unint64_t *)&qword_1E9AC2A40, MEMORY[0x1E4F27990]);
    sub_1AF7AECC0();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v25, v26);
    uint64_t v31 = type metadata accessor for AchievementsLinkData();
    *(void *)(v9 + 56) = v31;
    *(void *)(v9 + 64) = sub_1AF782744(&qword_1E9AC47F8, (void (*)(uint64_t))type metadata accessor for AchievementsLinkData);
    v32 = __swift_allocate_boxed_opaque_existential_1(v48);
    *(_OWORD *)(v32 + 13) = 0u;
    v32[15] = 0;
    *(_OWORD *)(v32 + 11) = 0u;
    uint64_t v33 = (uint64_t)v32 + *(int *)(v31 + 40);
    uint64_t v34 = sub_1AF7AD8A0();
    __swift_storeEnumTagSinglePayload(v33, 1, 1, v34);
    long long v35 = v50;
    *(_OWORD *)v32 = v49;
    *((_OWORD *)v32 + 1) = v35;
    uint64_t v36 = v47;
    v32[4] = v51;
    v32[5] = v36;
    v32[6] = v46;
    v32[7] = 0;
    v32[8] = 0;
    v32[9] = 0;
    *((unsigned char *)v32 + 80) = 0;
    sub_1AF53F4BC((uint64_t)v52, (uint64_t)(v32 + 11));
    sub_1AF36F09C(v45);
  }
  return v9;
}

uint64_t type metadata accessor for AchievementsLinkProfileSection()
{
  return self;
}

uint64_t sub_1AF782744(unint64_t *a1, void (*a2)(uint64_t))
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

char *sub_1AF78278C()
{
  uint64_t v1 = OBJC_IVAR___GKContactsIntegrationConsentViewController____lazy_storage___contactsView;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR___GKContactsIntegrationConsentViewController____lazy_storage___contactsView];
  if (v2)
  {
    uint64_t v3 = *(char **)&v0[OBJC_IVAR___GKContactsIntegrationConsentViewController____lazy_storage___contactsView];
  }
  else
  {
    uint64_t v4 = (char *)objc_allocWithZone((Class)type metadata accessor for ContactsIntegrationConsentView());
    uint64_t v5 = sub_1AF784090(v0, v4);
    uint64_t v6 = *(void **)&v0[v1];
    *(void *)&v0[v1] = v5;
    uint64_t v3 = v5;

    uint64_t v2 = 0;
  }
  id v7 = v2;
  return v3;
}

Swift::Void __swiftcall ContactsIntegrationConsentViewController.viewDidLoad()()
{
  v8.receiver = v0;
  v8.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v8, sel_viewDidLoad);
  uint64_t v1 = sub_1AF78278C();
  objc_msgSend(v1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  id v2 = objc_msgSend(v0, sel_view);
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = sub_1AF78278C();
    objc_msgSend(v3, sel_addSubview_, v4);

    uint64_t v5 = self;
    uint64_t v6 = sub_1AF78278C();
    id v7 = objc_msgSend(v0, sel_view);
    objc_msgSend(v5, sel__gkInstallEdgeConstraintsForView_containedWithinParentView_, v6, v7);
  }
  else
  {
    __break(1u);
  }
}

Swift::Void __swiftcall ContactsIntegrationConsentViewController.viewWillAppear(_:)(Swift::Bool a1)
{
  id v2 = v1;
  v7.receiver = v2;
  v7.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v7, sel_viewWillAppear_, a1);
  uint64_t v4 = sub_1AF78278C();
  sub_1AF48C1AC();

  id v5 = objc_msgSend(v2, sel_navigationController);
  if (v5)
  {
    uint64_t v6 = v5;
    objc_msgSend(v5, sel_setNavigationBarHidden_, 0);
  }
}

Swift::Void __swiftcall ContactsIntegrationConsentViewController.viewIsAppearing(_:)(Swift::Bool a1)
{
  v3.receiver = v1;
  v3.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v3, sel_viewIsAppearing_, a1);
}

Swift::Void __swiftcall ContactsIntegrationConsentViewController.viewDidAppear(_:)(Swift::Bool a1)
{
  v3.receiver = v1;
  v3.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v3, sel_viewDidAppear_, a1);
  sub_1AF782B18();
}

uint64_t sub_1AF782B18()
{
  uint64_t v0 = sub_1AF7ADA20();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  objc_super v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1E9AC2788 != -1) {
    swift_once();
  }
  sub_1AF7839BC();
  sub_1AF792DE4(6, 6, 3u, 0, (uint64_t)v3, 0);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

Swift::Void __swiftcall ContactsIntegrationConsentViewController.viewWillDisappear(_:)(Swift::Bool a1)
{
  v3.receiver = v1;
  v3.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v3, sel_viewWillDisappear_, a1);
  if (objc_msgSend(v1, sel_isMovingFromParentViewController)) {
    sub_1AF78314C(9, 2);
  }
}

void sub_1AF782D48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 == 1)
  {
    char v7 = 10;
  }
  else
  {
    if (a1) {
      goto LABEL_6;
    }
    char v7 = 13;
  }
  sub_1AF78314C(v7, 0);
LABEL_6:
  id v8 = objc_msgSend(self, sel__gkReachabilityForInternetConnection);
  if (v8)
  {
    uint64_t v9 = v8;
    unsigned int v10 = objc_msgSend(v8, sel__gkCurrentReachabilityStatus);

    if (v10)
    {
      id v11 = objc_msgSend(self, sel_proxyForLocalPlayer);
      id v12 = objc_msgSend(v11, sel_profileServicePrivate);

      uint64_t v13 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v14 = swift_allocObject();
      *(void *)(v14 + 16) = v13;
      *(void *)(v14 + 24) = a2;
      *(void *)(v14 + 32) = a3;
      *(_DWORD *)(v14 + 40) = a1;
      uint64_t v40 = sub_1AF783EF0;
      uint64_t v41 = v14;
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v37 = 1107296256;
      uint64_t v38 = sub_1AF439A4C;
      uint64_t v39 = &block_descriptor_104;
      uint64_t v15 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      objc_msgSend(v12, sel_setContactsIntegrationConsent_withCompletionHandler_, a1, v15);
      _Block_release(v15);
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v16 = (void *)sub_1AF7AE0A0();
      id v17 = (id)GKGameCenterUIFrameworkBundle();
      id v18 = (id)GKGetLocalizedStringFromTableInBundle();

      uint64_t v35 = sub_1AF7AE0E0();
      uint64_t v20 = v19;

      uint64_t v21 = (void *)sub_1AF7AE0A0();
      id v22 = (id)GKGameCenterUIFrameworkBundle();
      id v23 = (id)GKGetLocalizedStringFromTableInBundle();

      uint64_t v24 = sub_1AF7AE0E0();
      uint64_t v26 = v25;

      v27 = (void *)sub_1AF7AE0A0();
      id v28 = (id)GKGameCenterUIFrameworkBundle();
      id v29 = (id)GKGetLocalizedStringFromTableInBundle();

      sub_1AF7AE0E0();
      uint64_t v30 = (void *)sub_1AF7AE0A0();
      swift_bridgeObjectRelease();
      uint64_t v31 = swift_allocObject();
      *(void *)(v31 + 16) = v3;
      *(_DWORD *)(v31 + 24) = a1;
      *(void *)(v31 + 32) = a2;
      *(void *)(v31 + 40) = a3;
      uint64_t v40 = sub_1AF783F58;
      uint64_t v41 = v31;
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v37 = 1107296256;
      uint64_t v38 = sub_1AF3F8B2C;
      uint64_t v39 = &block_descriptor_10_4;
      v32 = _Block_copy(&aBlock);
      swift_retain();
      id v33 = v3;
      swift_release();
      id v34 = sub_1AF783F98(v35, v20, v24, v26, (uint64_t)v30, (uint64_t)v32, v33);
      _Block_release(v32);
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1AF78314C(char a1, char a2)
{
  uint64_t v4 = sub_1AF7ADA20();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  char v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1E9AC2788 != -1) {
    swift_once();
  }
  sub_1AF7839BC();
  sub_1AF792F84(6, 6, 1, a1, a2);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_1AF78327C(uint64_t a1, int a2, uint64_t (*a3)(void))
{
  return a3();
}

void sub_1AF7832C0(char a1, int a2)
{
  if (a1)
  {
    id v3 = objc_msgSend(self, sel_shared);
    id v4 = objc_msgSend(v3, sel_delegate);

    if (!v4) {
      return;
    }
    objc_msgSend(v4, sel_onboardingFlowFinishedWithAction_, 9);
    goto LABEL_10;
  }
  id v6 = objc_msgSend(v2, sel_navigationController);
  if (!v6) {
    return;
  }
  id v10 = v6;
  id v7 = objc_msgSend(self, sel_shared);
  id v8 = objc_msgSend(v7, sel_delegate);

  if (v8)
  {
    if (a2 == 1) {
      uint64_t v9 = 7;
    }
    else {
      uint64_t v9 = 8;
    }
    objc_msgSend(v8, sel_onboardingFlowFinishedWithAction_, v9);

LABEL_10:
    swift_unknownObjectRelease();
    return;
  }
}

void sub_1AF78342C(void *a1, uint64_t a2, void (*a3)(void), uint64_t a4, int a5)
{
  uint64_t v10 = sub_1AF7AA420();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v50 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v14 = MEMORY[0x1B3E84570](a2 + 16);
  if (v14)
  {
    uint64_t v15 = (void *)v14;
    if (a1)
    {
      v52 = (void *)v14;
      v53 = a3;
      uint64_t v54 = a4;
      sub_1AF7AA130();
      id v16 = a1;
      id v17 = a1;
      id v18 = sub_1AF7AA410();
      os_log_type_t v19 = sub_1AF7AE600();
      if (os_log_type_enabled(v18, v19))
      {
        uint64_t v20 = (uint8_t *)swift_slowAlloc();
        uint64_t v51 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v20 = 138412290;
        id v21 = a1;
        uint64_t v22 = _swift_stdlib_bridgeErrorToNSError();
        aBlock[0] = v22;
        sub_1AF7AEA70();
        id v23 = v51;
        *uint64_t v51 = v22;

        _os_log_impl(&dword_1AF250000, v18, v19, "Contacts Integration Consent error: %@", v20, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AC3F80);
        swift_arrayDestroy();
        MEMORY[0x1B3E84460](v23, -1, -1);
        MEMORY[0x1B3E84460](v20, -1, -1);
      }
      else
      {
      }
      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
      id v29 = (void *)sub_1AF7AE0A0();
      id v30 = (id)GKGameCenterUIFrameworkBundle();
      id v31 = (id)GKGetLocalizedStringFromTableInBundle();

      uint64_t v32 = sub_1AF7AE0E0();
      uint64_t v34 = v33;

      uint64_t v35 = (void *)sub_1AF7AE0A0();
      id v36 = (id)GKGameCenterUIFrameworkBundle();
      id v37 = (id)GKGetLocalizedStringFromTableInBundle();

      uint64_t v38 = sub_1AF7AE0E0();
      uint64_t v40 = v39;

      uint64_t v41 = (void *)sub_1AF7AE0A0();
      id v42 = (id)GKGameCenterUIFrameworkBundle();
      id v43 = (id)GKGetLocalizedStringFromTableInBundle();

      sub_1AF7AE0E0();
      uint64_t v15 = (void *)sub_1AF7AE0A0();
      swift_bridgeObjectRelease();
      v44 = (void *)swift_allocObject();
      uint64_t v46 = v52;
      uint64_t v45 = v53;
      v44[2] = v52;
      v44[3] = v45;
      v44[4] = v54;
      aBlock[4] = sub_1AF784084;
      aBlock[5] = v44;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1AF3F8B2C;
      aBlock[3] = &block_descriptor_16_3;
      uint64_t v47 = _Block_copy(aBlock);
      id v48 = v46;
      swift_retain();
      swift_release();
      id v49 = sub_1AF783F98(v32, v34, v38, v40, (uint64_t)v15, (uint64_t)v47, v48);
      _Block_release(v47);
    }
    else
    {
      id v24 = objc_msgSend(self, sel_proxyForLocalPlayer);
      id v25 = objc_msgSend(v24, sel_accountService);

      id v26 = objc_msgSend(self, sel_currentDevice);
      if (!v26)
      {
        __break(1u);
        return;
      }
      sub_1AF5C8F08(v26);
      if (v27)
      {
        id v28 = (void *)sub_1AF7AE0A0();
        swift_bridgeObjectRelease();
      }
      else
      {
        id v28 = 0;
      }
      objc_msgSend(v25, sel_setLastContactsIntegrationConsentVersionDisplayedForSignedInPlayer_, v28);
      swift_unknownObjectRelease();

      sub_1AF7832C0(0, a5);
      a3();
    }
  }
}

uint64_t sub_1AF783974(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_1AF7839BC()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9AC4560);
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  id v3 = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1AF7ADA20();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  id v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AF7ADA10();
  sub_1AF7ADBC0();
  if (qword_1E9AC2788 != -1) {
    swift_once();
  }
  sub_1AF79308C();
  v9[0] = sub_1AF7ADBB0();
  v9[1] = MEMORY[0x1E4F71520];
  sub_1AF7AD9C0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACB5D0);
  sub_1AF7AD9A0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

id ContactsIntegrationConsentViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_1AF7AE0A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

id ContactsIntegrationConsentViewController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v3[OBJC_IVAR___GKContactsIntegrationConsentViewController____lazy_storage___contactsView] = 0;
  if (a2)
  {
    id v7 = (void *)sub_1AF7AE0A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v7 = 0;
  }
  v10.receiver = v3;
  v10.super_class = ObjectType;
  id v8 = objc_msgSendSuper2(&v10, sel_initWithNibName_bundle_, v7, a3);

  return v8;
}

id ContactsIntegrationConsentViewController.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id ContactsIntegrationConsentViewController.init(coder:)(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v1[OBJC_IVAR___GKContactsIntegrationConsentViewController____lazy_storage___contactsView] = 0;
  v6.receiver = v1;
  v6.super_class = ObjectType;
  id v4 = objc_msgSendSuper2(&v6, sel_initWithCoder_, a1);

  return v4;
}

id ContactsIntegrationConsentViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ContactsIntegrationConsentViewController()
{
  return self;
}

uint64_t sub_1AF783E78()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1AF783EB0()
{
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 44, 7);
}

void sub_1AF783EF0(void *a1)
{
  sub_1AF78342C(a1, *(void *)(v1 + 16), *(void (**)(void))(v1 + 24), *(void *)(v1 + 32), *(_DWORD *)(v1 + 40));
}

uint64_t block_copy_helper_97(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_97()
{
  return swift_release();
}

uint64_t sub_1AF783F18()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1AF783F58()
{
  return sub_1AF78327C(*(void *)(v0 + 16), *(_DWORD *)(v0 + 24), *(uint64_t (**)(void))(v0 + 32));
}

uint64_t sub_1AF783F68(uint64_t (*a1)(void))
{
  uint64_t result = a1();
  if (result) {
    return _swift_stdlib_bridgeErrorToNSError();
  }
  return result;
}

id sub_1AF783F98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  objc_super v10 = (void *)sub_1AF7AE0A0();
  swift_bridgeObjectRelease();
  uint64_t v11 = (void *)sub_1AF7AE0A0();
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(a7, sel__gkPresentAlertWithTitle_message_buttonTitle_dismissHandler_, v10, v11, a5, a6);

  return v12;
}

uint64_t sub_1AF784044()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1AF784084()
{
  return sub_1AF783974(*(void *)(v0 + 16), *(uint64_t (**)(void))(v0 + 24));
}

char *sub_1AF784090(void *a1, char *a2)
{
  id v3 = &a2[OBJC_IVAR____TtC12GameCenterUI30ContactsIntegrationConsentView_delegate];
  *(void *)&a2[OBJC_IVAR____TtC12GameCenterUI30ContactsIntegrationConsentView_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v4 = OBJC_IVAR____TtC12GameCenterUI30ContactsIntegrationConsentView_iconImage;
  uint64_t v5 = a2;
  *(void *)&a2[v4] = sub_1AF48BBD4();
  uint64_t v6 = OBJC_IVAR____TtC12GameCenterUI30ContactsIntegrationConsentView_detailView;
  *(void *)&v5[v6] = sub_1AF48BD14();
  uint64_t v7 = OBJC_IVAR____TtC12GameCenterUI30ContactsIntegrationConsentView_primaryTrayButton;
  *(void *)&v5[v7] = sub_1AF48BE68();
  uint64_t v8 = OBJC_IVAR____TtC12GameCenterUI30ContactsIntegrationConsentView_secondaryTrayButton;
  *(void *)&v5[v8] = sub_1AF48BF9C();
  *((void *)v3 + 1) = &off_1F07B15B0;
  swift_unknownObjectWeakAssign();

  char v31 = sub_1AF787928(1, 0, 0, 0) & 1;
  sub_1AF7A9FE0();
  uint64_t v9 = sub_1AF7A9DE0();
  uint64_t v11 = v10;
  id v12 = *(void **)&a2[v4];
  uint64_t v13 = *(void **)&v5[v6];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AC47B0);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_1AF7CE9E0;
  uint64_t v15 = *(void **)&v5[v7];
  *(void *)(v14 + 32) = v15;
  id v16 = *(void **)&v5[v8];
  *(void *)(v14 + 40) = v16;
  uint64_t v33 = v14;
  sub_1AF7AE2E0();
  uint64_t v17 = v33;
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_1AF7CE9E0;
  *(void *)(v18 + 32) = v16;
  *(void *)(v18 + 40) = v15;
  uint64_t v34 = v18;
  sub_1AF7AE2E0();
  id v19 = v12;
  id v20 = v13;
  id v21 = v15;
  id v22 = v16;
  id v23 = v21;
  id v24 = (char *)sub_1AF787D80(v9, v11, 0, 0, v12, 0, v13, v17, v34, v31);
  id v25 = *(void **)&v24[OBJC_IVAR____TtC12GameCenterUI30ContactsIntegrationConsentView_primaryTrayButton];
  id v26 = v24;
  objc_msgSend(v25, sel_addTarget_action_forControlEvents_, v26, sel_primaryAction, 0x2000);
  uint64_t v27 = *(void **)&v26[OBJC_IVAR____TtC12GameCenterUI30ContactsIntegrationConsentView_secondaryTrayButton];
  id v28 = v26;
  id v29 = v27;
  objc_msgSend(v29, sel_addTarget_action_forControlEvents_, v28, sel_secondaryAction, 0x2000);

  return v28;
}

uint64_t getEnumTagSinglePayload for GKMultiplayerLayout(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFE && *(unsigned char *)(a1 + 41))
    {
      int v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
      if (v3 <= 2) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GKMultiplayerLayout(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)uint64_t result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 40) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1AF784390(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 40);
}

uint64_t sub_1AF784398(uint64_t result, char a2)
{
  *(unsigned char *)(result + 40) = a2;
  return result;
}

ValueMetadata *type metadata accessor for GKMultiplayerLayout()
{
  return &type metadata for GKMultiplayerLayout;
}

uint64_t sub_1AF7843B0(uint64_t a1)
{
  uint64_t result = sub_1AF462AB8(v1, (uint64_t)&v4);
  if (v5)
  {
    if (v5 != 1) {
      return sub_1AF7844AC(a1);
    }
  }
  return result;
}

uint64_t sub_1AF7844AC(uint64_t a1)
{
  uint64_t result = sub_1AF462AB8(v1, (uint64_t)&v4);
  if (!v5)
  {
    if (!__OFSUB__(a1, 1)) {
      return result;
    }
    __break(1u);
LABEL_9:
    __break(1u);
    return result;
  }
  if (v5 != 1 && __OFSUB__(a1, 1)) {
    goto LABEL_9;
  }
  return result;
}

double sub_1AF784584()
{
  return 8.0;
}

double sub_1AF78460C()
{
  id v1 = objc_msgSend(self, sel_currentTraitCollection);
  id v2 = objc_msgSend(v1, sel_preferredContentSizeCategory);

  sub_1AF7AE0E0();
  if (v0 == OUTLINED_FUNCTION_4_81() && v1 == v3)
  {
    OUTLINED_FUNCTION_16_29();
    goto LABEL_44;
  }
  OUTLINED_FUNCTION_1_115();
  OUTLINED_FUNCTION_15_33();
  swift_bridgeObjectRelease();
  if (v0)
  {
LABEL_44:

    return 324.0;
  }
  sub_1AF7AE0E0();
  if (v0 == OUTLINED_FUNCTION_4_81() && v1 == v5)
  {
    OUTLINED_FUNCTION_16_29();
    goto LABEL_46;
  }
  OUTLINED_FUNCTION_1_115();
  OUTLINED_FUNCTION_15_33();
  swift_bridgeObjectRelease();
  if (v0)
  {
LABEL_46:

    return 292.0;
  }
  sub_1AF7AE0E0();
  if (v0 == OUTLINED_FUNCTION_4_81() && v1 == v7)
  {
    OUTLINED_FUNCTION_16_29();
    goto LABEL_48;
  }
  OUTLINED_FUNCTION_1_115();
  OUTLINED_FUNCTION_15_33();
  swift_bridgeObjectRelease();
  if (v0)
  {
LABEL_48:

    return 264.0;
  }
  sub_1AF7AE0E0();
  if (v0 == OUTLINED_FUNCTION_4_81() && v1 == v9)
  {
    OUTLINED_FUNCTION_16_29();
    goto LABEL_50;
  }
  OUTLINED_FUNCTION_1_115();
  OUTLINED_FUNCTION_15_33();
  swift_bridgeObjectRelease();
  if (v0)
  {
LABEL_50:

    return 224.0;
  }
  sub_1AF7AE0E0();
  if (v0 == OUTLINED_FUNCTION_4_81() && v1 == v11)
  {
    OUTLINED_FUNCTION_16_29();
    goto LABEL_53;
  }
  OUTLINED_FUNCTION_1_115();
  OUTLINED_FUNCTION_15_33();
  swift_bridgeObjectRelease();
  if (v0)
  {
LABEL_53:

    return 184.0;
  }
  sub_1AF7AE0E0();
  if (v0 == OUTLINED_FUNCTION_4_81() && v1 == v13)
  {
    OUTLINED_FUNCTION_16_29();
    goto LABEL_55;
  }
  OUTLINED_FUNCTION_1_115();
  OUTLINED_FUNCTION_15_33();
  swift_bridgeObjectRelease();
  if (v0)
  {
LABEL_55:

    return 114.0;
  }
  sub_1AF7AE0E0();
  if (v0 == OUTLINED_FUNCTION_4_81() && v1 == v15)
  {
    OUTLINED_FUNCTION_16_29();
    goto LABEL_57;
  }
  OUTLINED_FUNCTION_1_115();
  OUTLINED_FUNCTION_15_33();
  swift_bridgeObjectRelease();
  if (v0)
  {
LABEL_57:

    return 104.0;
  }
  sub_1AF7AE0E0();
  if (v0 == OUTLINED_FUNCTION_4_81() && v1 == v17)
  {
    double v23 = 96.0;
  }
  else
  {
    char v19 = sub_1AF7AEFE0();
    double v20 = 88.0;
    if (v19) {
      double v20 = 96.0;
    }
    double v23 = v20;
  }

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v23;
}

uint64_t sub_1AF7848E4()
{
  uint64_t result = GKIsXRUIIdiomShouldUsePadUI();
  double v1 = 262.0;
  if (result) {
    double v1 = 392.0;
  }
  qword_1E9ACFBA8 = *(void *)&v1;
  return result;
}

void sub_1AF78491C(double a1)
{
  if ((GKIsXRUIIdiomShouldUsePadUI() & 1) != 0 || a1 <= 374.0) {
    return;
  }
  id v3 = objc_msgSend(self, sel_currentTraitCollection);
  id v4 = objc_msgSend(v3, sel_preferredContentSizeCategory);

  sub_1AF7AE0E0();
  if (v1 == OUTLINED_FUNCTION_4_81() && v3 == v5)
  {
    OUTLINED_FUNCTION_16_29();
    goto LABEL_15;
  }
  OUTLINED_FUNCTION_1_115();
  OUTLINED_FUNCTION_15_33();
  swift_bridgeObjectRelease();
  if (v1)
  {
LABEL_15:

    return;
  }
  sub_1AF7AE0E0();
  if (v1 == OUTLINED_FUNCTION_4_81() && v3 == v7)
  {

    OUTLINED_FUNCTION_16_29();
  }
  else
  {
    OUTLINED_FUNCTION_1_115();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

double sub_1AF784A64(double a1)
{
  double v2 = 24.0;
  if ((GKIsXRUIIdiomShouldUsePadUI() & 1) == 0)
  {
    double v2 = 8.0;
    if (a1 > 374.0)
    {
      double v3 = 24.0;
      if (a1 <= 1024.0) {
        double v3 = 16.0;
      }
      if (a1 > 736.0) {
        return v3;
      }
      else {
        return 10.0;
      }
    }
  }
  return v2;
}

void sub_1AF784AD4(void *a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACFBC8);
  MEMORY[0x1F4188790](v3);
  id v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v1;
  unint64_t v6 = v1[1];
  unint64_t v8 = *(void *)(*v1 + 16);
  if (v6 == v8)
  {
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 1, 1, v3);
  }
  else
  {
    if (v6 >= v8)
    {
      __break(1u);
    }
    else
    {
      uint64_t v9 = *(void *)(type metadata accessor for ActivityFeedRelationshipAchievement() - 8);
      uint64_t v10 = v7
          + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))
          + *(void *)(v9 + 72) * v6;
      v1[1] = v6 + 1;
      uint64_t v11 = (uint64_t)&v5[*(int *)(v3 + 48)];
      uint64_t v12 = v1[2];
      sub_1AF785BCC(v10, v11, (void (*)(void))type metadata accessor for ActivityFeedRelationshipAchievement);
      if (!__OFADD__(v12, 1))
      {
        v1[2] = v12 + 1;
        uint64_t v13 = (uint64_t)a1 + *(int *)(v3 + 48);
        *a1 = v12;
        sub_1AF3FDAF4(v11, v13);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v3);
        return;
      }
    }
    __break(1u);
  }
}

BOOL sub_1AF784C68()
{
  return *(void *)(v0 + OBJC_IVAR____TtC12GameCenterUI20ActivityFeedBaseData_brickType) == 4
      && *(void *)(v0 + OBJC_IVAR____TtC12GameCenterUI20ActivityFeedBaseData_layoutType) == 2;
}

uint64_t sub_1AF784CA4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _OWORD *a5, int a6, uint64_t a7)
{
  LODWORD(v161) = a6;
  double v160 = *(double *)&a5;
  uint64_t v159 = a4;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACD290);
  MEMORY[0x1F4188790](v12 - 8);
  OUTLINED_FUNCTION_3_3();
  uint64_t v140 = v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AC4D60);
  MEMORY[0x1F4188790](v14 - 8);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_7_27(v15);
  uint64_t v16 = type metadata accessor for Achievement();
  uint64_t v17 = OUTLINED_FUNCTION_0_23(v16, (uint64_t)v172);
  uint64_t v151 = v18;
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_7_27(v19);
  uint64_t v20 = sub_1AF7A9970();
  uint64_t v21 = OUTLINED_FUNCTION_0_23(v20, (uint64_t)v171);
  uint64_t v158 = v22;
  MEMORY[0x1F4188790](v21);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_7_27(v23);
  uint64_t v150 = type metadata accessor for ActivityFeedRelationshipAchievement();
  OUTLINED_FUNCTION_1_14();
  MEMORY[0x1F4188790](v24);
  id v26 = (char *)&v138 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACFBC0);
  MEMORY[0x1F4188790](v27 - 8);
  id v29 = (id *)((char *)&v138 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1F4188790](v30);
  uint64_t v32 = (uint64_t *)((char *)&v138 - v31);
  uint64_t v33 = MEMORY[0x1E4FBC860];
  *(void *)(v7 + OBJC_IVAR____TtC12GameCenterUI27ActivityFeedAchievementData_achievementCardViewModels) = MEMORY[0x1E4FBC860];
  *(void *)(v7 + OBJC_IVAR____TtC12GameCenterUI27ActivityFeedAchievementData_achievementCardLinks) = v33;
  sub_1AF3836EC(a1, (uint64_t)v170);
  sub_1AF3BC458(a7, (uint64_t)&v168);
  id v34 = a2;
  sub_1AF4E21D0((uint64_t)v170, v34, a3, v159, *(_OWORD **)&v160, v161, (uint64_t)&v168);
  uint64_t v36 = v35;
  if (!v35)
  {

    sub_1AF395058(a7, &qword_1E9AC38B8);
    sub_1AF3795E4(a1);
    return v36;
  }
  id v138 = v34;
  v149 = (uint64_t *)(v35 + OBJC_IVAR____TtC12GameCenterUI20ActivityFeedBaseData_relationships);
  uint64_t v37 = *(void *)(v35 + OBJC_IVAR____TtC12GameCenterUI20ActivityFeedBaseData_relationships + 24);
  uint64_t v166 = 0;
  uint64_t v167 = 0;
  uint64_t v165 = v37;
  uint64_t v38 = OBJC_IVAR____TtC12GameCenterUI27ActivityFeedAchievementData_achievementCardViewModels;
  uint64_t v39 = OBJC_IVAR____TtC12GameCenterUI27ActivityFeedAchievementData_achievementCardLinks;
  uint64_t v40 = OBJC_IVAR____TtC12GameCenterUI20ActivityFeedBaseData_mainActionLink;
  uint64_t v141 = v35;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1AF784AD4(v29);
  sub_1AF3A1DC4((uint64_t)v29, (uint64_t)v32, &qword_1E9ACFBC0);
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACFBC8);
  if (__swift_getEnumTagSinglePayload((uint64_t)v32, 1, v41) != 1)
  {
    uint64_t v148 = v141 + v38;
    uint64_t v147 = v141 + v39;
    v139 = (uint64_t *)(v141 + v40);
    uint64_t v146 = v158 + 8;
    uint64_t v143 = a1;
    uint64_t v145 = a7;
    v154 = v29;
    v144 = v32;
    v142 = v26;
    do
    {
      uint64_t v159 = *v32;
      sub_1AF3FDAF4((uint64_t)v32 + *(int *)(v41 + 48), (uint64_t)v26);
      id v43 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28C10]), sel_init);
      sub_1AF7A9960();
      v44 = (void *)sub_1AF7A9910();
      OUTLINED_FUNCTION_1_9();
      v45();
      objc_msgSend(v43, sel_setLocale_, v44);

      objc_msgSend(v43, sel_setDateStyle_, 3);
      uint64_t v46 = v150;
      uint64_t v47 = &v26[*(int *)(v150 + 32)];
      id v48 = (void *)sub_1AF7A9830();
      id v155 = v43;
      id v49 = objc_msgSend(v43, sel_stringFromDate_, v48);

      uint64_t v50 = sub_1AF7AE0E0();
      uint64_t v52 = v51;

      uint64_t v168 = v50;
      uint64_t v169 = v52;
      sub_1AF374298();
      double v53 = COERCE_DOUBLE(sub_1AF7AEAC0());
      uint64_t v55 = v54;
      swift_bridgeObjectRelease();
      uint64_t v56 = *(void *)&v26[*(int *)(v46 + 36)];
      if (v56 >= 100)
      {
        uint64_t v57 = v55;
        type metadata accessor for Artwork();
        uint64_t v58 = *((void *)v26 + 5);
        uint64_t v168 = *((void *)v26 + 4);
        uint64_t v169 = v58;
        uint64_t v59 = qword_1E9AC1FF0;
        swift_bridgeObjectRetain();
        if (v59 != -1) {
          swift_once();
        }
        uint64_t v163 = 25186;
        unint64_t v164 = 0xE200000000000000;
        a7 = Artwork.__allocating_init(template:size:backgroundColor:crop:variants:)(&v168, 0, &v163, MEMORY[0x1E4FBC860], *(double *)&xmmword_1E9AEF160, *((double *)&xmmword_1E9AEF160 + 1)) | 0x4000000000000000;
        uint64_t v161 = v57;
        double v160 = v53;
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v161 = 0;
        a7 = 0;
        double v160 = (double)v56;
      }
      unint64_t v60 = *((void *)v26 + 1);
      uint64_t v163 = *(void *)v26;
      unint64_t v164 = v60;
      swift_bridgeObjectRetain();
      sub_1AF7AECC0();
      uint64_t v61 = *((void *)v26 + 3);
      uint64_t v158 = *((void *)v26 + 2);
      uint64_t v156 = v61;
      uint64_t v62 = *((void *)v26 + 7);
      uint64_t v157 = *((void *)v26 + 6);
      uint64_t v63 = sub_1AF7A98B0();
      OUTLINED_FUNCTION_1_14();
      uint64_t v65 = v153;
      (*(void (**)(uint64_t, char *, uint64_t))(v64 + 16))(v153, v47, v63);
      __swift_storeEnumTagSinglePayload(v65, 0, 1, v63);
      sub_1AF3836EC((uint64_t)&v168, (uint64_t)&v163);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      double v66 = v160;
      uint64_t v67 = v161;
      sub_1AF3EB540(*(uint64_t *)&v160, v161, a7);
      sub_1AF3795E4((uint64_t)&v168);
      id v26 = v152;
      uint64_t v68 = v162;
      uint64_t v69 = v162 + *((int *)v152 + 9);
      *(void *)(v69 + 32) = 0;
      *(_OWORD *)uint64_t v69 = 0u;
      *(_OWORD *)(v69 + 16) = 0u;
      uint64_t v70 = *((int *)v26 + 10);
      *(unsigned char *)(v68 + *((int *)v26 + 11)) = 0;
      v71 = (void *)(v68 + v70);
      uint64_t v72 = *((int *)v26 + 13);
      OUTLINED_FUNCTION_11_72();
      v75 = (_OWORD *)(v74 + v73);
      OUTLINED_FUNCTION_11_72();
      uint64_t v78 = v77 + v76;
      uint64_t v79 = sub_1AF7AD8A0();
      __swift_storeEnumTagSinglePayload(v78, 1, 1, v79);
      OUTLINED_FUNCTION_25_31();
      _OWORD *v80 = v81;
      OUTLINED_FUNCTION_25_31();
      *(_OWORD *)(v82 + 16) = v83;
      OUTLINED_FUNCTION_11_72();
      *(void *)(v85 + 32) = v84;
      OUTLINED_FUNCTION_25_31();
      *(void *)(v86 + 40) = v158;
      OUTLINED_FUNCTION_25_31();
      *(void *)(v87 + 48) = v156;
      OUTLINED_FUNCTION_25_31();
      *(void *)(v88 + 56) = v157;
      OUTLINED_FUNCTION_25_31();
      *(void *)(v89 + 64) = v62;
      OUTLINED_FUNCTION_25_31();
      *(double *)(v90 + 72) = v66;
      OUTLINED_FUNCTION_25_31();
      *(void *)(v91 + 80) = v67;
      OUTLINED_FUNCTION_25_31();
      *(void *)(v92 + 88) = a7;
      _OWORD *v75 = 0u;
      v75[1] = 0u;
      OUTLINED_FUNCTION_11_72();
      sub_1AF3A1DC4(v65, v94 + v93, &qword_1E9AC4D60);
      v71[1] = 0;
      v71[2] = 0;
      void *v71 = 0;
      OUTLINED_FUNCTION_25_31();
      *(void *)(v95 + v72) = MEMORY[0x1E4FBC860];
      uint64_t v96 = v162;
      OUTLINED_FUNCTION_8_83();
      sub_1AF44CD18();
      uint64_t v97 = *(void *)(**(void **)&v66 + 16);
      sub_1AF52ECA8(v97);
      uint64_t v98 = **(void **)&v66;
      *(void *)(v98 + 16) = v97 + 1;
      sub_1AF785BCC(v96, v98+ ((*(unsigned __int8 *)(v151 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v151 + 80))+ *(void *)(v151 + 72) * v97, (void (*)(void))type metadata accessor for Achievement);
      swift_endAccess();
      v99 = v149;
      uint64_t v100 = *v149;
      uint64_t v101 = v149[1];
      uint64_t v102 = v149[2];
      uint64_t v103 = v149[3];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      a1 = sub_1AF55D1C0(v100, v101, v102, v103);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v104 = type metadata accessor for ActivityFeedSharedView();
      uint64_t v105 = sub_1AF3FC2C8(a1, v159);
      uint64_t v107 = v106;
      OUTLINED_FUNCTION_8_83();
      sub_1AF44CD00();
      uint64_t v108 = *(void *)(*(void *)v104 + 16);
      sub_1AF52EC8C(v108);
      uint64_t v109 = *(void *)v104;
      *(void *)(v109 + 16) = v108 + 1;
      uint64_t v110 = v109 + 16 * v108;
      *(void *)(v110 + 32) = v105;
      *(void *)(v110 + 40) = v107;
      swift_endAccess();
      v111 = (void *)v99[1];
      if (v111[2])
      {
        uint64_t v159 = a7;
        uint64_t v112 = v111[5];
        uint64_t v113 = v111[7];
        id v26 = (char *)v111[9];
        uint64_t v114 = v111[11];
        a7 = v111[12];
        v115 = (void *)*v99;
        uint64_t v116 = *(void *)(*v99 + 16);
        v117 = v154;
        if (v116)
        {
          uint64_t v118 = v111[10];
          uint64_t v119 = v111[4];
          uint64_t v120 = v115[4];
          uint64_t v121 = v115[5];
          uint64_t v122 = v115[6];
          uint64_t v123 = v115[7];
          uint64_t v125 = v115[9];
          v124 = (void *)v115[10];
          v170[0] = a1;
          v170[1] = v118;
          v170[2] = v114;
          v170[3] = v119;
          v170[4] = v112;
          v170[5] = v120;
          v171[0] = v121;
          v171[1] = v122;
          v172[0] = v123;
          v172[1] = 0;
          char v173 = 2;
          swift_retain();
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain_n();
          uint64_t v157 = v125;
          swift_bridgeObjectRetain();
          id v126 = v124;
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain_n();
          swift_retain();
          uint64_t v158 = v113;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v127 = v140;
          sub_1AF5B0C38((uint64_t)v170, v140);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v128 = sub_1AF7A97D0();
          if (__swift_getEnumTagSinglePayload(v127, 1, v128) == 1)
          {
            OUTLINED_FUNCTION_2_145();
            swift_release();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();

            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            OUTLINED_FUNCTION_7_75();
            uint64_t v129 = sub_1AF785B78(v162, (void (*)(void))type metadata accessor for Achievement);
            OUTLINED_FUNCTION_5_94(v129, (void (*)(void))type metadata accessor for ActivityFeedRelationshipAchievement);
            sub_1AF395058(v127, &qword_1E9ACD290);
            uint64_t v130 = 0;
            uint64_t v131 = 0;
          }
          else
          {
            uint64_t v156 = sub_1AF7A9760();
            uint64_t v131 = v134;
            swift_release();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();

            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            OUTLINED_FUNCTION_7_75();
            OUTLINED_FUNCTION_2_145();
            uint64_t v135 = sub_1AF785B78(v162, (void (*)(void))type metadata accessor for Achievement);
            OUTLINED_FUNCTION_5_94(v135, (void (*)(void))type metadata accessor for ActivityFeedRelationshipAchievement);
            OUTLINED_FUNCTION_1_9();
            v136();
            uint64_t v130 = v156;
          }
          a1 = v143;
          v137 = v139;
          uint64_t *v139 = v130;
          v137[1] = v131;
          swift_release();
          swift_bridgeObjectRelease();
          a7 = v145;
          uint64_t v32 = v144;
          v117 = v154;
          goto LABEL_21;
        }
        swift_retain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_2_145();
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_7_75();
        uint64_t v133 = sub_1AF785B78(v96, (void (*)(void))type metadata accessor for Achievement);
        OUTLINED_FUNCTION_5_94(v133, (void (*)(void))type metadata accessor for ActivityFeedRelationshipAchievement);
        OUTLINED_FUNCTION_10_67();
      }
      else
      {
        sub_1AF3EB814(*(uint64_t *)&v160, v161, a7);
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_7_75();
        uint64_t v132 = sub_1AF785B78(v96, (void (*)(void))type metadata accessor for Achievement);
        OUTLINED_FUNCTION_5_94(v132, (void (*)(void))type metadata accessor for ActivityFeedRelationshipAchievement);
        OUTLINED_FUNCTION_10_67();
        v117 = v154;
      }
      uint64_t v32 = v144;
LABEL_21:
      sub_1AF784AD4(v117);
      sub_1AF3A1DC4((uint64_t)v117, (uint64_t)v32, &qword_1E9ACFBC0);
      uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACFBC8);
    }
    while (__swift_getEnumTagSinglePayload((uint64_t)v32, 1, v41) != 1);
  }

  uint64_t v36 = v141;
  swift_release();
  sub_1AF395058(a7, &qword_1E9AC38B8);
  sub_1AF3795E4(a1);
  swift_bridgeObjectRelease();
  return v36;
}

uint64_t sub_1AF785A4C()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1AF785A8C()
{
  uint64_t v0 = sub_1AF4E6058();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1AF785AD4()
{
  uint64_t v0 = sub_1AF785A8C();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1AF785B28()
{
  return type metadata accessor for ActivityFeedAchievementData();
}

uint64_t type metadata accessor for ActivityFeedAchievementData()
{
  uint64_t result = qword_1E9ACFBB0;
  if (!qword_1E9ACFBB0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1AF785B78(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_1_14();
  OUTLINED_FUNCTION_1_9();
  v3();
  return a1;
}

uint64_t sub_1AF785BCC(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1_14();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t OUTLINED_FUNCTION_2_145()
{
  uint64_t v2 = *(void *)(v0 - 304);
  uint64_t v3 = *(void *)(v0 - 296);
  unint64_t v4 = *(void *)(v0 - 312);
  return sub_1AF3EB814(v2, v3, v4);
}

uint64_t OUTLINED_FUNCTION_5_94(uint64_t a1, void (*a2)(void))
{
  uint64_t v4 = *(void *)(v2 - 464);
  return sub_1AF785B78(v4, a2);
}

void OUTLINED_FUNCTION_7_75()
{
  uint64_t v2 = *(void **)(v0 - 344);
}

uint64_t OUTLINED_FUNCTION_8_83()
{
  return swift_beginAccess();
}

id sub_1AF785CC8()
{
  OUTLINED_FUNCTION_7_2();
  uint64_t v10 = type metadata accessor for ActivityFeedAchievementCollectionViewCell();
  double v1 = OUTLINED_FUNCTION_10();
  id v4 = objc_msgSendSuper2(v2, v3, v1, v0, v10);
  if (GKIsXRUIIdiomShouldUsePadUI()) {
    double v5 = 0.0;
  }
  else {
    double v5 = 16.0;
  }
  objc_msgSend(v4, sel_set_gkFocusHighlightInsets_, 0.0, 0.0, v5, 0.0);
  if (qword_1E9AC2980 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for PlayerCardTheme();
  __swift_project_value_buffer(v6, (uint64_t)qword_1E9AF04C0);
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1E20]), sel_init);
  double v8 = sub_1AF79BF78();

  objc_msgSend(v4, sel_set_gkFocusHighlightCornerRadius_, v8);
  return v4;
}

id sub_1AF785DE8()
{
  return sub_1AF785CC8();
}

void sub_1AF785E0C()
{
}

void sub_1AF785E68()
{
}

double sub_1AF785E78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1AF785E90(a1, a2, a3, a4, (double (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1AF59926C);
}

double sub_1AF785E90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double (*a5)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AC4368);
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_1_29();
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_0_25(v15, v16, v17, v18, v19, v20, v21, v22, v25);
  sub_1AF3B2F24(a3, v7);
  type metadata accessor for ActivityFeedBaseCollectionViewCell();
  OUTLINED_FUNCTION_2_24();
  sub_1AF3B2F24(v7, a2);
  double v23 = a5(a1, v5, a2, a4);
  sub_1AF3A4630(v6, &qword_1E9AC4368);
  sub_1AF3A4630(a2, (uint64_t *)&unk_1E9ACB5E0);
  sub_1AF3A4630(v5, (uint64_t *)&unk_1E9ACB5E0);
  return v23;
}

double sub_1AF785FB4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AC4368);
  uint64_t v9 = v8 - 8;
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  uint64_t v14 = (char *)&v19 - v13;
  uint64_t v15 = (char *)&v19 + *(int *)(v9 + 56) - v13;
  sub_1AF3B2F24(a2, (uint64_t)&v19 - v13);
  sub_1AF3B2F24(a3, (uint64_t)v15);
  type metadata accessor for ActivityFeedBaseCollectionViewCell();
  uint64_t v16 = (uint64_t)&v11[*(int *)(v9 + 56)];
  sub_1AF3B2F24((uint64_t)v14, (uint64_t)v11);
  sub_1AF3B2F24((uint64_t)v15, v16);
  double v17 = sub_1AF59930C(a1, (uint64_t)v11, v16, a4);
  sub_1AF3A4630((uint64_t)v14, &qword_1E9AC4368);
  sub_1AF3A4630(v16, (uint64_t *)&unk_1E9ACB5E0);
  sub_1AF3A4630((uint64_t)v11, (uint64_t *)&unk_1E9ACB5E0);
  return v17;
}

uint64_t sub_1AF786134@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AC4368);
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_1_29();
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_0_25(v11, v12, v13, v14, v15, v16, v17, v18, v20);
  sub_1AF3B2F24(a2, v5);
  type metadata accessor for ActivityFeedBaseCollectionViewCell();
  OUTLINED_FUNCTION_2_24();
  sub_1AF3B2F24(v5, a1);
  sub_1AF59943C(v3, a1, a3);
  sub_1AF3A4630(v4, &qword_1E9AC4368);
  sub_1AF3A4630(a1, (uint64_t *)&unk_1E9ACB5E0);
  return sub_1AF3A4630(v3, (uint64_t *)&unk_1E9ACB5E0);
}

uint64_t sub_1AF786248()
{
  return 1;
}

uint64_t sub_1AF786290()
{
  return swift_release();
}

uint64_t sub_1AF7862D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACAA98);
  sub_1AF7AD530();
  type metadata accessor for ActivityFeedBaseCollectionViewCell();
  sub_1AF599518(v13, a6);
  sub_1AF7483C4(a1, a2, a3, a4, a5, a6);
  return swift_release();
}

id sub_1AF78639C(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACAA98);
  sub_1AF7AD530();
  type metadata accessor for ActivityFeedBaseCollectionViewCell();
  id v3 = sub_1AF599600(v5, a2);
  swift_release();
  return v3;
}

uint64_t sub_1AF786418()
{
  return 1;
}

id sub_1AF786420()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityFeedAchievementCollectionViewCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ActivityFeedAchievementCollectionViewCell()
{
  uint64_t result = qword_1E9ACFBD0;
  if (!qword_1E9ACFBD0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1AF7864A0()
{
  return type metadata accessor for ActivityFeedAchievementCollectionViewCell();
}

uint64_t sub_1AF7864AC()
{
  return 1;
}

uint64_t sub_1AF7864C8()
{
  return sub_1AF786290();
}

id sub_1AF7864E0(uint64_t a1, uint64_t a2)
{
  return sub_1AF78639C(a1, a2);
}

double sub_1AF7864F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1AF785E90(a1, a2, a3, a4, (double (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1AF59926C);
}

double sub_1AF786524(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return sub_1AF785FB4(a1, a2, a3, a4);
}

uint64_t sub_1AF78653C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_1AF786134(a1, a2, a3);
}

uint64_t sub_1AF786554(uint64_t a1)
{
  uint64_t result = sub_1AF786694(&qword_1E9ACFBE0, (void (*)(uint64_t))type metadata accessor for ActivityFeedAchievementCollectionViewCell);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_1AF7865AC()
{
  return sub_1AF786694(&qword_1E9ACAAA0, (void (*)(uint64_t))type metadata accessor for ActivityFeedAchievementData);
}

uint64_t sub_1AF7865F4()
{
  return sub_1AF786694(&qword_1E9ACA6C0, MEMORY[0x1E4F71798]);
}

uint64_t sub_1AF78663C(uint64_t a1)
{
  uint64_t result = sub_1AF786694(&qword_1E9ACAE38, (void (*)(uint64_t))type metadata accessor for ActivityFeedAchievementCollectionViewCell);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_1AF786694(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1AF7866DC(char a1)
{
  unint64_t result = 1802398060;
  switch(a1)
  {
    case 1:
      unint64_t result = OUTLINED_FUNCTION_1_159();
      break;
    case 2:
      unint64_t result = OUTLINED_FUNCTION_0_130();
      break;
    case 3:
      unint64_t result = 0x6F50737365636361;
      break;
    case 4:
      unint64_t result = OUTLINED_FUNCTION_4_123(20);
      break;
    case 5:
      unint64_t result = 0x42656D6F636C6577;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1AF78678C(char a1)
{
  uint64_t result = 0x657461676976616ELL;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x7373696D736964;
      break;
    case 2:
      uint64_t result = OUTLINED_FUNCTION_3_130();
      break;
    case 3:
      uint64_t result = 1852141679;
      break;
    case 4:
      uint64_t result = 0x74726F706572;
      break;
    case 5:
      uint64_t result = 0x65766F6D6572;
      break;
    case 6:
      uint64_t result = OUTLINED_FUNCTION_2_146();
      break;
    case 7:
      uint64_t result = 1953064037;
      break;
    case 8:
      uint64_t result = 6579297;
      break;
    case 9:
      uint64_t result = 0x7463656C6573;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_1AF78687C(char a1)
{
  unint64_t result = 0x614E726579616C70;
  switch(a1)
  {
    case 1:
    case 19:
      unint64_t result = OUTLINED_FUNCTION_4_123(22);
      break;
    case 2:
      unint64_t result = 0x6F6272656461656CLL;
      break;
    case 3:
      unint64_t result = 0x49656C69666F7270;
      break;
    case 4:
      unint64_t result = 0x6D65766569686361;
      break;
    case 5:
      unint64_t result = 0x656C69666F7270;
      break;
    case 6:
      unint64_t result = 0x7250646E65697266;
      break;
    case 7:
      unint64_t result = 0x73646E65697266;
      break;
    case 8:
      unint64_t result = 0x72616F6268736164;
      break;
    case 9:
      unint64_t result = OUTLINED_FUNCTION_3_130();
      break;
    case 10:
      unint64_t result = 0x65756E69746E6F63;
      break;
    case 11:
      unint64_t result = 1701736292;
      break;
    case 12:
      unint64_t result = 0x7472617453746567;
      break;
    case 13:
      unint64_t result = 0x74614C7075746573;
      break;
    case 14:
      unint64_t result = 0x74754F6E676973;
      break;
    case 15:
      unint64_t result = 0x6E65697246646461;
      break;
    case 16:
      unint64_t result = 0x657469766E69;
      break;
    case 17:
      unint64_t result = 0x7246657469766E49;
      break;
    case 18:
      uint64_t v3 = 0x65766F6D6572;
      goto LABEL_34;
    case 20:
      unint64_t result = 0x464174726F706572;
      break;
    case 21:
      unint64_t result = 0x6C6C41656573;
      break;
    case 22:
      unint64_t result = 0x744F657469766E69;
      break;
    case 23:
      unint64_t result = 0x65726F4D776F6873;
      break;
    case 24:
      unint64_t result = 0x7373654C776F6873;
      break;
    case 25:
      unint64_t result = OUTLINED_FUNCTION_2_146();
      break;
    case 26:
      unint64_t result = 0xD000000000000010;
      break;
    case 27:
      unint64_t result = 0x776F4E746F4ELL;
      break;
    case 28:
      unint64_t result = 0x666F725074696445;
      break;
    case 29:
      unint64_t result = 0x6B63694E74696445;
      break;
    case 30:
      unint64_t result = 0x656E6F7972657645;
      break;
    case 31:
      unint64_t result = 0x4F73646E65697246;
      break;
    case 32:
      unint64_t result = 0x756F59796C6E4FLL;
      break;
    case 33:
      uint64_t v3 = 0x747065636341;
LABEL_34:
      unint64_t result = v3 & 0xFFFFFFFFFFFFLL | 0x7246000000000000;
      break;
    case 34:
      unint64_t result = 0x65697246796E6544;
      break;
    case 35:
      unint64_t result = 0x65736F6C43;
      break;
    case 36:
      unint64_t result = 0x6E6F6349656D6167;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1AF786CD8(char a1)
{
  uint64_t result = 0x707954746E657665;
  switch(a1)
  {
    case 1:
      uint64_t v3 = 0x6E6F69746361;
      goto LABEL_4;
    case 2:
      uint64_t v3 = 0x746567726174;
LABEL_4:
      uint64_t result = v3 & 0xFFFFFFFFFFFFLL | 0x7954000000000000;
      break;
    case 3:
      uint64_t result = 0x6449746567726174;
      break;
    case 4:
      uint64_t result = 0x6E6F697461636F6CLL;
      break;
    case 5:
      uint64_t result = 0x6973736572706D69;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1AF786DAC()
{
  double v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AC7390);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1AF7D4110;
  *(void *)(inited + 32) = 25705;
  *(void *)(inited + 40) = 0xE200000000000000;
  uint64_t v3 = *v0;
  uint64_t v4 = v0[1];
  uint64_t v5 = MEMORY[0x1E4FBB1A0];
  *(void *)(inited + 48) = v3;
  *(void *)(inited + 56) = v4;
  *(void *)(inited + 72) = v5;
  *(void *)(inited + 80) = 0x657079546469;
  *(void *)(inited + 88) = 0xE600000000000000;
  *(void *)(inited + 96) = 0x636974617473;
  *(void *)(inited + 104) = 0xE600000000000000;
  *(void *)(inited + 120) = v5;
  *(void *)(inited + 128) = 0xD000000000000010;
  *(void *)(inited + 136) = 0x80000001AF80D2C0;
  unint64_t v6 = sub_1AF37BB7C();
  swift_bridgeObjectRetain();
  *(void *)(inited + 144) = sub_1AF7AE9A0();
  *(void *)(inited + 168) = v6;
  strcpy((char *)(inited + 176), "locationType");
  *(unsigned char *)(inited + 189) = 0;
  *(_WORD *)(inited + 190) = -5120;
  uint64_t v7 = sub_1AF787008(*((unsigned char *)v1 + 40));
  *(void *)(inited + 216) = v5;
  *(void *)(inited + 192) = v7;
  *(void *)(inited + 200) = v8;
  uint64_t result = sub_1AF7AE000();
  uint64_t v13 = result;
  uint64_t v10 = v1[3];
  if (v10)
  {
    uint64_t v11 = v1[2];
    v12[3] = v5;
    v12[0] = v11;
    v12[1] = v10;
    swift_bridgeObjectRetain();
    sub_1AF4E1554((uint64_t)v12, 1701667182, 0xE400000000000000);
    return v13;
  }
  return result;
}

uint64_t sub_1AF786F2C(char a1)
{
  uint64_t result = 0x6B63696C63;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x686372616573;
      break;
    case 2:
      uint64_t result = 0x676F6C616964;
      break;
    case 3:
      uint64_t result = 0x6973736572706D69;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1AF786FBC()
{
  unint64_t v0 = sub_1AF7AEF50();
  swift_bridgeObjectRelease();
  if (v0 >= 6) {
    return 6;
  }
  else {
    return v0;
  }
}

uint64_t sub_1AF787008(char a1)
{
  uint64_t result = 1802398060;
  switch(a1)
  {
    case 1:
      uint64_t result = OUTLINED_FUNCTION_0_130();
      break;
    case 2:
      uint64_t result = 0x666C656873;
      break;
    case 3:
      uint64_t result = OUTLINED_FUNCTION_1_159();
      break;
    case 4:
      uint64_t result = 0x6143646E65697266;
      break;
    case 5:
      uint64_t result = 0x70756B636F6CLL;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_1AF7870A0(char a1)
{
  unint64_t result = 25705;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x657079546469;
      break;
    case 2:
      unint64_t result = 1701667182;
      break;
    case 3:
      unint64_t result = OUTLINED_FUNCTION_4_123(16);
      break;
    case 4:
      unint64_t result = 0x6E6F697461636F6CLL;
      break;
    default:
      return result;
  }
  return result;
}

BOOL sub_1AF787140()
{
  uint64_t v0 = sub_1AF7AEF50();
  swift_bridgeObjectRelease();
  return v0 != 0;
}

uint64_t sub_1AF787188()
{
  return 0x636974617473;
}

unint64_t sub_1AF78719C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_1AF7866DC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1AF7871C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1AF787218(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

uint64_t sub_1AF787298(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

uint64_t sub_1AF7872F0(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 41))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_1AF787330(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 41) = 1;
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
    *(unsigned char *)(result + 41) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void _s13LocationEntryVMa()
{
}

unsigned char *sub_1AF787388(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *unint64_t result = a2 + 5;
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
        JUMPOUT(0x1AF787454);
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
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

void _s13LocationEntryV12LocationTypeOMa()
{
}

unsigned char *sub_1AF787488(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1AF787524);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

void _s13LocationEntryV6IdTypeOMa()
{
}

uint64_t sub_1AF787558()
{
  return sub_1AF3C0EF4();
}

uint64_t sub_1AF787564()
{
  return sub_1AF790DA8(*v0);
}

uint64_t sub_1AF78756C()
{
  return sub_1AF72A5C8();
}

uint64_t sub_1AF787574(uint64_t a1)
{
  return sub_1AF46AB40(a1, *v1);
}

uint64_t sub_1AF78757C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1AF786FBC();
  *a1 = result;
  return result;
}

uint64_t sub_1AF7875AC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1AF787008(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

BOOL sub_1AF7875E4@<W0>(unsigned char *a1@<X8>)
{
  BOOL result = sub_1AF787140();
  *a1 = result;
  return result;
}

void sub_1AF78761C(void *a1@<X8>)
{
  *a1 = 0x636974617473;
  a1[1] = 0xE600000000000000;
}

unint64_t sub_1AF787638()
{
  unint64_t result = qword_1E9ACFBE8;
  if (!qword_1E9ACFBE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9ACFBE8);
  }
  return result;
}

unint64_t sub_1AF787688()
{
  unint64_t result = qword_1E9ACFBF0;
  if (!qword_1E9ACFBF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9ACFBF0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_130()
{
  return 0x74656C63696863;
}

uint64_t OUTLINED_FUNCTION_1_159()
{
  return 0x6E6F74747562;
}

uint64_t OUTLINED_FUNCTION_2_146()
{
  return 0x6C65636E6163;
}

uint64_t OUTLINED_FUNCTION_3_130()
{
  return 1801675106;
}

unint64_t OUTLINED_FUNCTION_4_123(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000;
}

uint64_t sub_1AF78772C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (GKIsXRUIIdiomShouldUsePadUI()) {
    return a1;
  }
  uint64_t v11 = self;
  id v12 = objc_msgSend(v11, sel_currentTraitCollection);
  id v13 = objc_msgSend(v12, sel_verticalSizeClass);

  if (v13 != (id)2
    || (id v14 = objc_msgSend(v11, sel_currentTraitCollection),
        id v15 = objc_msgSend(v14, sel_horizontalSizeClass),
        v14,
        v15 != (id)2))
  {
    id v16 = objc_msgSend(v11, sel_currentTraitCollection);
    id v17 = objc_msgSend(v16, sel_verticalSizeClass);

    if (v17 == (id)2) {
      return a5;
    }
    else {
      return a7;
    }
  }
  return a3;
}

double sub_1AF787858()
{
  OUTLINED_FUNCTION_7_2();
  if ((GKIsXRUIIdiomShouldUsePadUI() & 1) == 0)
  {
    unsigned int v6 = self;
    id v7 = OUTLINED_FUNCTION_10_68(v6);
    id v8 = OUTLINED_FUNCTION_8_84(v7);

    if (v8 != (id)2
      || (id v9 = OUTLINED_FUNCTION_5_95(),
          id v10 = objc_msgSend(v9, sel_horizontalSizeClass),
          v9,
          double v5 = v4,
          v10 != (id)2))
    {
      id v11 = OUTLINED_FUNCTION_5_95();
      id v12 = [v11 (SEL)(v1 + 1192)];

      if (v12 == (id)2) {
        return v3;
      }
      else {
        return v2;
      }
    }
  }
  return v5;
}

uint64_t sub_1AF787928(char a1, char a2, char a3, char a4)
{
  if (GKIsXRUIIdiomShouldUsePadUI())
  {
    a2 = a1;
  }
  else
  {
    id v8 = self;
    id v9 = objc_msgSend(v8, sel_currentTraitCollection);
    id v10 = objc_msgSend(v9, sel_verticalSizeClass);

    if (v10 != (id)2
      || (id v11 = objc_msgSend(v8, sel_currentTraitCollection),
          id v12 = objc_msgSend(v11, sel_horizontalSizeClass),
          v11,
          v12 != (id)2))
    {
      id v13 = objc_msgSend(v8, sel_currentTraitCollection);
      id v14 = objc_msgSend(v13, sel_verticalSizeClass);

      if (v14 == (id)2) {
        a2 = a3;
      }
      else {
        a2 = a4;
      }
    }
  }
  return a2 & 1;
}

void *sub_1AF787A28@<X0>(const void *a1@<X0>, const void *a2@<X1>, const void *a3@<X2>, const void *a4@<X3>, void *a5@<X8>)
{
  if ((GKIsXRUIIdiomShouldUsePadUI() & 1) == 0)
  {
    id v10 = self;
    id v11 = objc_msgSend(v10, sel_currentTraitCollection);
    id v12 = objc_msgSend(v11, sel_verticalSizeClass);

    if (v12 != (id)2
      || (id v13 = objc_msgSend(v10, sel_currentTraitCollection),
          id v14 = objc_msgSend(v13, sel_horizontalSizeClass),
          v13,
          a1 = a2,
          v14 != (id)2))
    {
      id v15 = objc_msgSend(v10, sel_currentTraitCollection);
      id v16 = objc_msgSend(v15, sel_verticalSizeClass);

      if (v16 == (id)2) {
        a1 = a3;
      }
      else {
        a1 = a4;
      }
    }
  }

  return memcpy(a5, a1, 0xB0uLL);
}

double static OnboardingTemplateView.horizontalLayoutHorizontalMargin.getter()
{
  if (GKIsXRUIIdiomShouldUsePadUI()) {
    return 32.0;
  }
  double v3 = self;
  id v4 = OUTLINED_FUNCTION_10_68(v3);
  id v5 = OUTLINED_FUNCTION_8_84(v4);

  if (v5 != (id)2
    || (id v6 = OUTLINED_FUNCTION_5_95(),
        id v7 = objc_msgSend(v6, sel_horizontalSizeClass),
        v6,
        double result = 16.0,
        v7 != (id)2))
  {
    id v8 = OUTLINED_FUNCTION_5_95();
    [v8 (SEL)(v1 + 1192)];

    return 16.0;
  }
  return result;
}

uint64_t sub_1AF787C04(unint64_t a1, void *a2)
{
  if (a1 >> 62) {
    goto LABEL_11;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; uint64_t v4 = sub_1AF7AEEF0())
  {
    uint64_t v5 = 4;
    while (1)
    {
      id v6 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1B3E82BD0](v5 - 4, a1) : *(id *)(a1 + 8 * v5);
      id v7 = v6;
      uint64_t v8 = v5 - 3;
      if (__OFADD__(v5 - 4, 1)) {
        break;
      }
      id v9 = sub_1AF78991C();
      objc_msgSend(v9, sel_addArrangedSubview_, v7);

      ++v5;
      if (v8 == v4) {
        goto LABEL_9;
      }
    }
    __break(1u);
LABEL_11:
    swift_bridgeObjectRetain();
  }
LABEL_9:

  return swift_bridgeObjectRelease();
}

uint64_t sub_1AF787D04()
{
  id v0 = objc_msgSend(self, sel_currentTraitCollection);
  id v1 = objc_msgSend(v0, sel_preferredContentSizeCategory);

  LOBYTE(v0) = sub_1AF7AE820();
  return v0 & 1;
}

id sub_1AF787D80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, uint64_t a9, char a10)
{
  *(void *)&v10[OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_contentTopConstraint] = 0;
  *(void *)&v10[OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_contentTopOffset] = 0;
  uint64_t v18 = OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_contentStack;
  uint64_t v19 = v10;
  *(void *)&v10[v18] = sub_1AF789BA0();
  uint64_t v20 = OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_contentScrollView;
  *(void *)&v19[v20] = sub_1AF789C20();
  *(void *)&v19[OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView____lazy_storage___headerContainer] = 0;
  *(void *)&v19[OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView____lazy_storage___bottomTrayBlurView] = 0;
  *(void *)&v19[OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView____lazy_storage___headerView] = 0;
  *(void *)&v19[OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView____lazy_storage___verticalBottomTray] = 0;
  v19[OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_bottomTrayHidden] = 0;
  *(void *)&v19[OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView____lazy_storage___horizontalBottomTray] = 0;
  *(void *)&v19[OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_headerTopMargin] = 0;
  uint64_t v21 = &v19[OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_headerTitle];
  *(void *)uint64_t v21 = a1;
  *((void *)v21 + 1) = a2;
  uint64_t v22 = &v19[OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_headerDetailText];
  *(void *)uint64_t v22 = a3;
  *((void *)v22 + 1) = a4;
  *(void *)&v19[OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_headerIcon] = a5;
  *(void *)&v19[OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_viewBeforeHeader] = a6;
  *(void *)&v19[OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_viewAfterHeader] = a7;
  *(void *)&v19[OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_viewsInVerticalBottomTray] = a8;
  *(void *)&v19[OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_viewsInHorizontalBottomTray] = a9;
  v19[OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_overrideBottomTrayAxis] = a10 & 1;
  id v23 = a7;
  id v24 = a5;
  id v25 = a6;

  v33.receiver = v19;
  v33.super_class = (Class)type metadata accessor for OnboardingTemplateView();
  id v26 = objc_msgSendSuper2(&v33, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_1AF788F0C();
  sub_1AF78919C();
  LODWORD(a4) = GKIsXRUIIdiom();
  uint64_t v27 = self;
  id v28 = v26;
  if (a4)
  {
    id v29 = objc_msgSend(v27, sel_clearColor);
    objc_msgSend(v28, sel_setBackgroundColor_, v29);

    objc_msgSend(v28, sel_setOverrideUserInterfaceStyle_, 2);
  }
  else
  {
    id v30 = objc_msgSend(v27, sel_systemBackgroundColor);
    objc_msgSend(v28, sel_setBackgroundColor_, v30);
  }
  return v28;
}

void sub_1AF788014()
{
  double v2 = v0;
  swift_getObjectType();
  double v3 = *(void **)&v0[OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_contentStack];
  objc_msgSend(v3, sel_setAxis_, 1);
  objc_msgSend(v3, sel_setAlignment_, 0);
  objc_msgSend(v3, sel_setDistribution_, 0);
  objc_msgSend(v3, sel_setSpacing_, sub_1AF787858());
  OUTLINED_FUNCTION_1_90();
  double v5 = (*(double (**)(void))(v4 + 536))();
  double v6 = sub_1AF789E74();
  id v7 = (SEL *)&selRef_setContentView_;
  objc_msgSend(v3, sel_setLayoutMargins_, v5, v6, 0.0, sub_1AF789E74());
  id v8 = sub_1AF7894C4();
  objc_msgSend(v8, sel_setLayoutMargins_, *(double *)&v2[OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_headerTopMargin], 0.0, 0.0, 0.0);

  id v9 = sub_1AF7894C4();
  id v10 = sub_1AF789564();
  objc_msgSend(v9, sel_addArrangedSubview_, v10);

  if (v2[OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_overrideBottomTrayAxis])
  {
    sub_1AF78993C();
    id v11 = sub_1AF78991C();
    unint64_t v12 = *(void *)&v2[OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_viewsInHorizontalBottomTray];
    id v50 = v11;
    if (v12 >> 62) {
      goto LABEL_28;
    }
    uint64_t v13 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
    id v14 = v11;
    OUTLINED_FUNCTION_4_124();
    for (i = v1; v13; uint64_t v13 = sub_1AF7AEEF0())
    {
      uint64_t v16 = 4;
      while (1)
      {
        id v11 = (v12 & 0xC000000000000001) != 0
            ? (id)MEMORY[0x1B3E82BD0](v16 - 4, v12)
            : *(id *)(v12 + 8 * v16);
        id v7 = (SEL *)v11;
        id v1 = (void *)(v16 - 3);
        if (__OFADD__(v16 - 4, 1)) {
          break;
        }
        objc_msgSend(v50, sel_addArrangedSubview_, v11);

        ++v16;
        if (v1 == (void *)v13) {
          goto LABEL_19;
        }
      }
      __break(1u);
LABEL_27:
      __break(1u);
LABEL_28:
      id v46 = v11;
      OUTLINED_FUNCTION_4_124();
      id v47 = v1;
    }
  }
  else
  {
    sub_1AF7896A8();
    id v17 = sub_1AF789688();
    unint64_t v12 = *(void *)&v2[OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_viewsInVerticalBottomTray];
    id v50 = v17;
    if (v12 >> 62)
    {
      id v48 = v17;
      OUTLINED_FUNCTION_4_124();
      id v49 = v1;
      uint64_t v18 = sub_1AF7AEEF0();
      if (!v18) {
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v18 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
      id v19 = v17;
      OUTLINED_FUNCTION_4_124();
      id v20 = v1;
      if (!v18) {
        goto LABEL_20;
      }
    }
    uint64_t v21 = 4;
    do
    {
      if ((v12 & 0xC000000000000001) != 0) {
        id v11 = (id)MEMORY[0x1B3E82BD0](v21 - 4, v12);
      }
      else {
        id v11 = *(id *)(v12 + 8 * v21);
      }
      id v7 = (SEL *)v11;
      id v1 = (void *)(v21 - 3);
      if (__OFADD__(v21 - 4, 1)) {
        goto LABEL_27;
      }
      objc_msgSend(v50, sel_addArrangedSubview_, v11);

      ++v21;
    }
    while (v1 != (void *)v18);
LABEL_19:
    id v7 = (SEL *)&selRef_setContentView_;
  }
LABEL_20:

  swift_bridgeObjectRelease_n();
  if (sub_1AF787D04())
  {
    objc_msgSend(v3, sel_addArrangedSubview_, v50);
    id v22 = v50;
    double v23 = sub_1AF789F5C();
    objc_msgSend(v22, v7[292], v23, 0.0, sub_1AF78A040(), 0.0);

    objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_contentScrollView], sel_setContentInset_, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24), v50, v52);
  }
  else
  {
    id v24 = sub_1AF7894E4();
    OUTLINED_FUNCTION_6_80();

    objc_msgSend(v2, sel_addSubview_, v50);
    id v25 = self;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AC47B0);
    uint64_t v26 = swift_allocObject();
    *(_OWORD *)(v26 + 16) = xmmword_1AF7E15C0;
    id v27 = objc_msgSend(v50, sel_leadingAnchor);
    id v28 = objc_msgSend(v2, sel_leadingAnchor);
    id v29 = OUTLINED_FUNCTION_9_78();

    *(void *)(v26 + 32) = v29;
    id v30 = objc_msgSend(v50, sel_trailingAnchor);
    id v31 = objc_msgSend(v2, sel_trailingAnchor);
    id v32 = OUTLINED_FUNCTION_9_78();

    *(void *)(v26 + 40) = v32;
    id v33 = objc_msgSend(v50, sel_bottomAnchor);
    id v34 = objc_msgSend(v2, sel_bottomAnchor);
    id v35 = OUTLINED_FUNCTION_9_78();

    *(void *)(v26 + 48) = v35;
    id v36 = objc_msgSend(OUTLINED_FUNCTION_2_147(), sel_leadingAnchor);

    id v37 = OUTLINED_FUNCTION_0_131((uint64_t)objc_msgSend(v2, sel_leadingAnchor));
    *(void *)(v26 + 56) = v37;
    id v38 = objc_msgSend(OUTLINED_FUNCTION_2_147(), sel_trailingAnchor);

    id v39 = OUTLINED_FUNCTION_0_131((uint64_t)objc_msgSend(v2, sel_trailingAnchor));
    *(void *)(v26 + 64) = v39;
    id v40 = objc_msgSend(OUTLINED_FUNCTION_2_147(), sel_bottomAnchor);

    id v41 = OUTLINED_FUNCTION_0_131((uint64_t)objc_msgSend(v2, sel_bottomAnchor));
    *(void *)(v26 + 72) = v41;
    id v42 = objc_msgSend(OUTLINED_FUNCTION_2_147(), sel_topAnchor);

    id v43 = OUTLINED_FUNCTION_0_131((uint64_t)objc_msgSend(v50, sel_topAnchor));
    *(void *)(v26 + 80) = v43;
    sub_1AF7AE2E0();
    sub_1AF36A648(0, (unint64_t *)&qword_1E9AC47B8);
    v44 = (void *)OUTLINED_FUNCTION_12_62();
    swift_bridgeObjectRelease();
    objc_msgSend(v25, sel_activateConstraints_, v44);

    uint64_t v45 = *(void **)&v2[OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_contentScrollView];
    objc_msgSend(v50, sel_bounds);
    objc_msgSend(v45, sel_setContentInset_, 0.0, 0.0, CGRectGetHeight(v54), 0.0, v50, v26);
  }
}

id sub_1AF7886FC()
{
  double v2 = v0;
  swift_getObjectType();
  double v3 = *(void **)&v0[OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_contentStack];
  objc_msgSend(v3, sel_setAxis_, 0);
  objc_msgSend(v3, sel_setAlignment_, 1);
  objc_msgSend(v3, sel_setDistribution_, 1);
  id v4 = objc_msgSend(v3, sel_setSpacing_, sub_1AF789E74());
  double v5 = (*(double (**)(id))((*MEMORY[0x1E4FBC8C8] & *(void *)v0) + 0x218))(v4);
  double v6 = static OnboardingTemplateView.horizontalLayoutHorizontalMargin.getter();
  objc_msgSend(v3, sel_setLayoutMargins_, v5, v6, 0.0, static OnboardingTemplateView.horizontalLayoutHorizontalMargin.getter());
  id v7 = sub_1AF7894C4();
  objc_msgSend(v7, sel_setLayoutMargins_, *(double *)&v2[OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_headerTopMargin], 0.0, 0.0, 0.0);

  id v8 = sub_1AF7894C4();
  id v9 = sub_1AF789564();
  objc_msgSend(v8, sel_addArrangedSubview_, v9);

  sub_1AF78993C();
  id v10 = sub_1AF78991C();
  id v11 = objc_msgSend(v10, sel_subviews);

  sub_1AF36A648(0, (unint64_t *)&qword_1E9AC3658);
  unint64_t v12 = sub_1AF7AE2B0();

  if (v12 >> 62)
  {
    OUTLINED_FUNCTION_1_102();
    uint64_t v13 = sub_1AF7AEEF0();
    swift_bridgeObjectRelease();
    if (!v13) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v13 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v13) {
      goto LABEL_9;
    }
  }
  if (v13 < 1)
  {
    __break(1u);
    goto LABEL_23;
  }
  for (uint64_t i = 0; i != v13; ++i)
  {
    if ((v12 & 0xC000000000000001) != 0) {
      id v15 = (id)MEMORY[0x1B3E82BD0](i, v12);
    }
    else {
      id v15 = *(id *)(v12 + 8 * i + 32);
    }
    uint64_t v16 = v15;
    objc_msgSend(v15, sel_removeFromSuperview);
  }
LABEL_9:
  swift_bridgeObjectRelease();
  unint64_t v12 = *(void *)&v2[OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_viewsInHorizontalBottomTray];
  if (v12 >> 62)
  {
    OUTLINED_FUNCTION_1_102();
    uint64_t v17 = sub_1AF7AEEF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v17 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v1 = &selRef_startAuthenticationForExistingPrimaryPlayer;
  if (v17 == 1)
  {
    sub_1AF3E30C8(0, (v12 & 0xC000000000000001) == 0, v12);
    if ((v12 & 0xC000000000000001) == 0)
    {
      id v18 = *(id *)(v12 + 32);
LABEL_14:
      id v19 = v18;
      id v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1C60]), sel_init);
      objc_msgSend(v20, sel_setAxis_, 1);
      objc_msgSend(v20, sel_setAlignment_, 3);
      objc_msgSend(OUTLINED_FUNCTION_1_160(), sel_addArrangedSubview_, v20);

      objc_msgSend(v20, sel_addArrangedSubview_, v19);
      uint64_t v21 = self;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AC47B0);
      uint64_t v22 = swift_allocObject();
      *(_OWORD *)(v22 + 16) = xmmword_1AF7CCDB0;
      id v23 = [v19 v1[369]];
      id v24 = [v20 v1[369]];
      id v25 = objc_msgSend(v23, sel_constraintEqualToAnchor_multiplier_, v24, 0.5);

      *(void *)(v22 + 32) = v25;
      sub_1AF7AE2E0();
      sub_1AF36A648(0, (unint64_t *)&qword_1E9AC47B8);
      uint64_t v26 = (void *)OUTLINED_FUNCTION_12_62();
      swift_bridgeObjectRelease();
      objc_msgSend(v21, sel_activateConstraints_, v26);

      goto LABEL_16;
    }
LABEL_23:
    id v18 = (id)MEMORY[0x1B3E82BD0](0, v12);
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  sub_1AF787C04(v12, v2);
  swift_bridgeObjectRelease();
LABEL_16:
  id v27 = sub_1AF7894E4();
  OUTLINED_FUNCTION_6_80();

  OUTLINED_FUNCTION_1_160();
  OUTLINED_FUNCTION_6_80();

  id v53 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AC47B0);
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_1AF7E15C0;
  id v29 = objc_msgSend(OUTLINED_FUNCTION_1_160(), sel_centerXAnchor);

  id v30 = objc_msgSend(v2, sel_centerXAnchor);
  id v31 = objc_msgSend(v29, sel_constraintEqualToAnchor_, v30);

  *(void *)(v28 + 32) = v31;
  id v32 = objc_msgSend(OUTLINED_FUNCTION_1_160(), sel_bottomAnchor);

  id v33 = objc_msgSend(v2, sel_safeAreaLayoutGuide);
  id v34 = objc_msgSend(v33, sel_bottomAnchor);

  id v35 = objc_msgSend(v32, sel_constraintEqualToAnchor_, v34);
  *(void *)(v28 + 40) = v35;
  id v36 = [OUTLINED_FUNCTION_1_160() v1[369]];

  id v37 = OUTLINED_FUNCTION_0_131((uint64_t)[v2 v1[369]]);
  *(void *)(v28 + 48) = v37;
  id v38 = objc_msgSend(OUTLINED_FUNCTION_2_147(), sel_centerXAnchor);

  id v39 = OUTLINED_FUNCTION_0_131((uint64_t)objc_msgSend(v2, sel_centerXAnchor));
  *(void *)(v28 + 56) = v39;
  id v40 = objc_msgSend(OUTLINED_FUNCTION_2_147(), sel_bottomAnchor);

  id v41 = OUTLINED_FUNCTION_0_131((uint64_t)objc_msgSend(v2, sel_bottomAnchor));
  *(void *)(v28 + 64) = v41;
  id v42 = [OUTLINED_FUNCTION_2_147() v1[369]];

  id v43 = OUTLINED_FUNCTION_0_131((uint64_t)[v2 v1[369]]);
  *(void *)(v28 + 72) = v43;
  id v44 = objc_msgSend(OUTLINED_FUNCTION_2_147(), sel_topAnchor);

  id v45 = objc_msgSend(OUTLINED_FUNCTION_1_160(), sel_topAnchor);
  id v46 = objc_msgSend(v44, sel_constraintEqualToAnchor_, v45);

  *(void *)(v28 + 80) = v46;
  sub_1AF7AE2E0();
  sub_1AF36A648(0, (unint64_t *)&qword_1E9AC47B8);
  id v47 = (void *)OUTLINED_FUNCTION_12_62();
  swift_bridgeObjectRelease();
  objc_msgSend(v53, sel_activateConstraints_, v47);

  objc_msgSend(OUTLINED_FUNCTION_1_160(), sel_frame);
  id v48 = (void *)OUTLINED_FUNCTION_15_59();
  [v48 v49];
  objc_msgSend(OUTLINED_FUNCTION_1_160(), sel_frame);

  objc_msgSend(v2, sel_safeAreaInsets);
  id v50 = (void *)OUTLINED_FUNCTION_15_59();

  return [v50 v51];
}

void sub_1AF788F0C()
{
  objc_msgSend(v0, sel_addSubview_, *(void *)&v0[OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_contentScrollView]);
  id v1 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AC47B0);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1AF7CF860;
  id v3 = OUTLINED_FUNCTION_14_51();
  id v4 = objc_msgSend(v3, sel_topAnchor);

  id v5 = objc_msgSend(v0, sel_topAnchor);
  id v6 = OUTLINED_FUNCTION_7_76();

  *(void *)(v2 + 32) = v6;
  id v7 = OUTLINED_FUNCTION_14_51();
  id v8 = objc_msgSend(v7, sel_bottomAnchor);

  id v9 = objc_msgSend(v0, sel_bottomAnchor);
  id v10 = OUTLINED_FUNCTION_7_76();

  *(void *)(v2 + 40) = v10;
  id v11 = OUTLINED_FUNCTION_14_51();
  id v12 = objc_msgSend(v11, sel_leadingAnchor);

  id v13 = objc_msgSend(v0, sel_leadingAnchor);
  id v14 = OUTLINED_FUNCTION_7_76();

  *(void *)(v2 + 48) = v14;
  id v15 = OUTLINED_FUNCTION_14_51();
  id v16 = objc_msgSend(v15, sel_trailingAnchor);

  id v17 = objc_msgSend(v0, sel_trailingAnchor);
  id v18 = objc_msgSend(v16, sel_constraintEqualToAnchor_, v17);

  *(void *)(v2 + 56) = v18;
  sub_1AF7AE2E0();
  sub_1AF36A648(0, (unint64_t *)&qword_1E9AC47B8);
  id v19 = (id)OUTLINED_FUNCTION_12_62();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_activateConstraints_, v19);
}

void sub_1AF78919C()
{
  id v1 = *(void **)(v0 + OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_contentScrollView);
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_contentStack);
  objc_msgSend(v1, sel_addSubview_, v2);
  id v3 = objc_msgSend(v2, sel_topAnchor);
  id v4 = objc_msgSend(v1, sel_contentLayoutGuide);
  id v5 = objc_msgSend(v4, sel_topAnchor);

  id v6 = objc_msgSend(v3, sel_constraintEqualToAnchor_constant_, v5, 0.0);
  id v7 = v6;
  sub_1AF7894B0((uint64_t)v6);
  id v8 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AC47B0);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_1AF7CF860;
  *(void *)(v9 + 32) = v7;
  id v10 = v7;
  id v11 = objc_msgSend(v2, sel_bottomAnchor);
  id v12 = objc_msgSend(v1, sel_contentLayoutGuide);
  id v13 = objc_msgSend(v12, sel_bottomAnchor);

  id v14 = objc_msgSend(v11, sel_constraintEqualToAnchor_, v13);
  *(void *)(v9 + 40) = v14;
  id v15 = objc_msgSend(v2, sel_leadingAnchor);
  id v16 = objc_msgSend(v1, sel_safeAreaLayoutGuide);
  id v17 = objc_msgSend(v16, sel_leadingAnchor);

  id v18 = objc_msgSend(v15, sel_constraintEqualToAnchor_, v17);
  *(void *)(v9 + 48) = v18;
  id v19 = objc_msgSend(v2, sel_trailingAnchor);
  id v20 = objc_msgSend(v1, sel_safeAreaLayoutGuide);
  id v21 = objc_msgSend(v20, sel_trailingAnchor);

  id v22 = objc_msgSend(v19, sel_constraintEqualToAnchor_, v21);
  *(void *)(v9 + 56) = v22;
  sub_1AF7AE2E0();
  sub_1AF36A648(0, (unint64_t *)&qword_1E9AC47B8);
  id v23 = (id)sub_1AF7AE2A0();
  swift_bridgeObjectRelease();
  objc_msgSend(v8, sel_activateConstraints_, v23);
}

uint64_t sub_1AF7894B0(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_contentTopConstraint) = a1;
  return MEMORY[0x1F41817F8]();
}

id sub_1AF7894C4()
{
  return sub_1AF789504(&OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView____lazy_storage___headerContainer, (uint64_t (*)(void))sub_1AF789C8C);
}

id sub_1AF7894E4()
{
  return sub_1AF789504(&OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView____lazy_storage___bottomTrayBlurView, (uint64_t (*)(void))sub_1AF789D34);
}

id sub_1AF789504(uint64_t *a1, uint64_t (*a2)(void))
{
  uint64_t v3 = *a1;
  id v4 = *(void **)(v2 + *a1);
  if (v4)
  {
    id v5 = *(id *)(v2 + *a1);
  }
  else
  {
    id v6 = (void *)a2();
    id v7 = *(void **)(v2 + v3);
    *(void *)(v2 + v3) = v6;
    id v5 = v6;

    id v4 = 0;
  }
  id v8 = v4;
  return v5;
}

id sub_1AF789564()
{
  uint64_t v1 = OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView____lazy_storage___headerView;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView____lazy_storage___headerView);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView____lazy_storage___headerView);
  }
  else
  {
    id v4 = sub_1AF789DB4(v0);
    id v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

double sub_1AF7895C8()
{
  double v2 = 16.0;
  if ((GKIsXRUIIdiomShouldUsePadUI() & 1) == 0)
  {
    id v3 = self;
    id v4 = OUTLINED_FUNCTION_10_68(v3);
    id v5 = OUTLINED_FUNCTION_8_84(v4);

    if (v5 != (id)2
      || (id v6 = OUTLINED_FUNCTION_5_95(),
          id v7 = objc_msgSend(v6, sel_horizontalSizeClass),
          v6,
          double v2 = 5.0,
          v7 != (id)2))
    {
      id v8 = OUTLINED_FUNCTION_5_95();
      [v8 (SEL)(v1 + 1192)];

      return 5.0;
    }
  }
  return v2;
}

id sub_1AF789688()
{
  return sub_1AF789504(&OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView____lazy_storage___verticalBottomTray, (uint64_t (*)(void))sub_1AF78A124);
}

void sub_1AF7896A8()
{
  swift_getObjectType();
  id v1 = sub_1AF789688();
  OUTLINED_FUNCTION_1_90();
  (*(void (**)(void))(v2 + 440))();
  objc_msgSend(v1, sel_setSpacing_);

  double v3 = sub_1AF78A040();
  if ((GKIsXRUIIdiomShouldUsePadUI() & 1) == 0)
  {
    unint64_t v4 = *(void *)(v0 + OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_viewsInVerticalBottomTray);
    uint64_t v13 = MEMORY[0x1E4FBC860];
    if (v4 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_1AF7AEEF0();
      if (v5)
      {
LABEL_4:
        if (v5 < 1)
        {
          __break(1u);
          return;
        }
        for (uint64_t i = 0; i != v5; ++i)
        {
          if ((v4 & 0xC000000000000001) != 0) {
            id v7 = (id)MEMORY[0x1B3E82BD0](i, v4);
          }
          else {
            id v7 = *(id *)(v4 + 8 * i + 32);
          }
          id v8 = v7;
          self;
          if (swift_dynamicCastObjCClass())
          {
            sub_1AF7AEE00();
            sub_1AF7AEE30();
            sub_1AF7AEE40();
            sub_1AF7AEE10();
          }
          else
          {
          }
        }
        swift_bridgeObjectRelease();
        uint64_t v9 = v13;
        if (v13 < 0) {
          goto LABEL_24;
        }
LABEL_17:
        if ((v9 & 0x4000000000000000) == 0)
        {
          uint64_t v10 = *(void *)(v9 + 16);
          goto LABEL_19;
        }
LABEL_24:
        swift_bridgeObjectRetain();
        uint64_t v10 = sub_1AF7AEEF0();
        swift_release();
LABEL_19:
        swift_release();
        if (v10 == 1) {
          double v3 = v3 + 55.0;
        }
        goto LABEL_21;
      }
    }
    else
    {
      uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v5) {
        goto LABEL_4;
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v9 = MEMORY[0x1E4FBC860];
    if ((MEMORY[0x1E4FBC860] & 0x8000000000000000) != 0) {
      goto LABEL_24;
    }
    goto LABEL_17;
  }
LABEL_21:
  double v11 = sub_1AF787858();
  id v12 = sub_1AF789688();
  objc_msgSend(v12, sel_setLayoutMargins_, sub_1AF789F5C(), v11, v3, v11);
}

id sub_1AF78991C()
{
  return sub_1AF789504(&OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView____lazy_storage___horizontalBottomTray, (uint64_t (*)(void))sub_1AF78A230);
}

void sub_1AF78993C()
{
  swift_getObjectType();
  double v0 = sub_1AF787858();
  id v1 = sub_1AF78991C();
  double v2 = sub_1AF789F5C();
  objc_msgSend(v1, sel_setLayoutMargins_, v2, v0, sub_1AF78A040(), v0);

  id v3 = sub_1AF78991C();
  objc_msgSend(v3, sel_setSpacing_, sub_1AF787858());
}

uint64_t sub_1AF789A28()
{
  id v0 = objc_msgSend(self, sel_currentTraitCollection);
  id v1 = objc_msgSend(v0, sel_verticalSizeClass);

  if (v1 == (id)2) {
    return 1;
  }
  else {
    return sub_1AF787D04() & 1;
  }
}

void sub_1AF789A94()
{
  *(void *)&v0[OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_contentTopConstraint] = 0;
  *(void *)&v0[OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_contentTopOffset] = 0;
  uint64_t v1 = OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_contentStack;
  *(void *)&v0[v1] = sub_1AF789BA0();
  uint64_t v2 = OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_contentScrollView;
  *(void *)&v0[v2] = sub_1AF789C20();
  *(void *)&v0[OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView____lazy_storage___headerContainer] = 0;
  *(void *)&v0[OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView____lazy_storage___bottomTrayBlurView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView____lazy_storage___headerView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView____lazy_storage___verticalBottomTray] = 0;
  v0[OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_bottomTrayHidden] = 0;
  *(void *)&v0[OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView____lazy_storage___horizontalBottomTray] = 0;
  *(void *)&v0[OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_headerTopMargin] = 0;

  sub_1AF7AEEB0();
  __break(1u);
}

id sub_1AF789BA0()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1C60]), sel_init);
  objc_msgSend(v0, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v0, sel_setLayoutMarginsRelativeArrangement_, 1);
  sub_1AF3C6444(0xD000000000000026, 0x80000001AF80D600, v0);
  return v0;
}

id sub_1AF789C20()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1BE0]), sel_init);
  objc_msgSend(v0, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  sub_1AF3C6444(0xD00000000000002BLL, 0x80000001AF80D5D0, v0);
  return v0;
}

id sub_1AF789C8C()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1C60]), sel_init);
  objc_msgSend(v0, sel_setAxis_, 1);
  objc_msgSend(v0, sel_setDistribution_, 0);
  objc_msgSend(v0, sel_setAlignment_, 0);
  objc_msgSend(v0, sel_setLayoutMarginsRelativeArrangement_, 1);
  sub_1AF3C6444(0xD000000000000029, 0x80000001AF80D6C0, v0);
  return v0;
}

id sub_1AF789D34()
{
  id v0 = objc_msgSend(self, sel_effectWithStyle_, 4);
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1F00]), sel_initWithEffect_, v0);

  objc_msgSend(v1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  return v1;
}

id sub_1AF789DB4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_headerTitle);
  uint64_t v2 = *(void *)(a1 + OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_headerTitle + 8);
  uint64_t v3 = *(void *)(a1 + OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_headerDetailText);
  uint64_t v4 = *(void *)(a1 + OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_headerDetailText + 8);
  uint64_t v5 = *(void **)(a1 + OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_headerIcon);
  id v6 = objc_allocWithZone(MEMORY[0x1E4F83AA0]);
  id v7 = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v8 = sub_1AF78A6B8(v1, v2, v3, v4, v5);
  sub_1AF3C6444(0xD000000000000024, 0x80000001AF80D690, v8);
  return v8;
}

double sub_1AF789E74()
{
  if (GKIsXRUIIdiomShouldUsePadUI()) {
    return 80.0;
  }
  uint64_t v1 = self;
  id v2 = objc_msgSend(v1, sel_currentTraitCollection);
  id v3 = objc_msgSend(v2, sel_verticalSizeClass);

  if (v3 == (id)2)
  {
    id v4 = objc_msgSend(v1, sel_currentTraitCollection);
    id v5 = objc_msgSend(v4, sel_horizontalSizeClass);

    if (v5 == (id)2) {
      return 88.0;
    }
  }
  id v7 = objc_msgSend(v1, sel_currentTraitCollection);
  objc_msgSend(v7, sel_verticalSizeClass);

  return 24.0;
}

double sub_1AF789F5C()
{
  if (GKIsXRUIIdiomShouldUsePadUI()) {
    return 32.0;
  }
  uint64_t v1 = self;
  id v2 = objc_msgSend(v1, sel_currentTraitCollection);
  id v3 = objc_msgSend(v2, sel_verticalSizeClass);

  if (v3 != (id)2
    || (id v4 = objc_msgSend(v1, sel_currentTraitCollection),
        id v5 = objc_msgSend(v4, sel_horizontalSizeClass),
        v4,
        double result = 12.0,
        v5 != (id)2))
  {
    id v6 = objc_msgSend(v1, sel_currentTraitCollection);
    objc_msgSend(v6, sel_verticalSizeClass);

    return 12.0;
  }
  return result;
}

double sub_1AF78A040()
{
  if (GKIsXRUIIdiomShouldUsePadUI()) {
    return 32.0;
  }
  uint64_t v1 = self;
  id v2 = objc_msgSend(v1, sel_currentTraitCollection);
  id v3 = objc_msgSend(v2, sel_verticalSizeClass);

  if (v3 != (id)2
    || (id v4 = objc_msgSend(v1, sel_currentTraitCollection),
        id v5 = objc_msgSend(v4, sel_horizontalSizeClass),
        v4,
        double result = 5.0,
        v5 != (id)2))
  {
    id v6 = objc_msgSend(v1, sel_currentTraitCollection);
    objc_msgSend(v6, sel_verticalSizeClass);

    return 0.0;
  }
  return result;
}

id sub_1AF78A124()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1C60]), sel_init);
  objc_msgSend(v0, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v0, sel_setAxis_, 1);
  objc_msgSend(v0, sel_setAlignment_, 3);
  objc_msgSend(v0, sel_setDistribution_, 0);
  uint64_t v1 = self;
  id v2 = v0;
  id v3 = objc_msgSend(v1, sel_clearColor);
  objc_msgSend(v2, sel_setBackgroundColor_, v3);

  sub_1AF3C6444(0xD00000000000002CLL, 0x80000001AF80D660, v2);
  objc_msgSend(v2, sel_setLayoutMarginsRelativeArrangement_, 1);
  return v2;
}

id sub_1AF78A230()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1C60]), sel_init);
  objc_msgSend(v0, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v0, sel_setAxis_, 0);
  objc_msgSend(v0, sel_setDistribution_, 1);
  objc_msgSend(v0, sel_setAlignment_, 3);
  uint64_t v1 = self;
  id v2 = v0;
  id v3 = objc_msgSend(v1, sel_clearColor);
  objc_msgSend(v2, sel_setBackgroundColor_, v3);

  sub_1AF3C6444(0xD00000000000002ELL, 0x80000001AF80D630, v2);
  objc_msgSend(v2, sel_setLayoutMarginsRelativeArrangement_, 1);
  return v2;
}

uint64_t sub_1AF78A33C()
{
  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for OnboardingTemplateView();
  objc_msgSendSuper2(&v5, sel_layoutSubviews);
  if (*(void *)((char *)v0 + OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_viewBeforeHeader)) {
    objc_msgSend(*(id *)((char *)v0 + OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_contentStack), sel_addArrangedSubview_);
  }
  id v1 = sub_1AF7894C4();
  objc_msgSend(v1, sel_setSpacing_, sub_1AF787858());

  id v2 = *(void **)((char *)v0 + OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_contentStack);
  id v3 = sub_1AF7894C4();
  objc_msgSend(v2, sel_addArrangedSubview_, v3);

  if (*(void *)((char *)v0 + OBJC_IVAR____TtC12GameCenterUI22OnboardingTemplateView_viewAfterHeader)) {
    objc_msgSend(v2, sel_addArrangedSubview_);
  }
  if (sub_1AF789A28()) {
    return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x238))();
  }
  else {
    return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x240))();
  }
}

id OnboardingTemplateView.__allocating_init(frame:)()
{
  OUTLINED_FUNCTION_7_2();
  id v5 = objc_allocWithZone(v4);

  return objc_msgSend(v5, sel_initWithFrame_, v3, v2, v1, v0);
}

void OnboardingTemplateView.init(frame:)()
{
}

id OnboardingTemplateView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for OnboardingTemplateView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_1AF78A6B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8 = (void *)sub_1AF7AE0A0();
  swift_bridgeObjectRelease();
  if (a4)
  {
    uint64_t v9 = (void *)sub_1AF7AE0A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = objc_msgSend(v5, sel_initWithTitle_detailText_icon_, v8, v9, a5);

  return v10;
}

uint64_t type metadata accessor for OnboardingTemplateView()
{
  return self;
}

uint64_t method lookup function for OnboardingTemplateView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for OnboardingTemplateView);
}

unsigned char *storeEnumTagSinglePayload for OnboardingTemplateView.BottomTrayAxis(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *double result = a2 + 1;
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
        JUMPOUT(0x1AF78A860);
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
          *double result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for OnboardingTemplateView.BottomTrayAxis()
{
  return &type metadata for OnboardingTemplateView.BottomTrayAxis;
}

unint64_t sub_1AF78A89C()
{
  unint64_t result = qword_1E9ACFC90;
  if (!qword_1E9ACFC90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9ACFC90);
  }
  return result;
}

id OUTLINED_FUNCTION_0_131(uint64_t a1)
{
  return objc_msgSend(v1, (SEL)(v2 + 750), a1);
}

id OUTLINED_FUNCTION_1_160()
{
  return sub_1AF78991C();
}

id OUTLINED_FUNCTION_2_147()
{
  return sub_1AF7894E4();
}

uint64_t OUTLINED_FUNCTION_4_124()
{
  return swift_bridgeObjectRetain_n();
}

id OUTLINED_FUNCTION_5_95()
{
  return [v0 (SEL)(v1 + 3201)];
}

id OUTLINED_FUNCTION_6_80()
{
  return objc_msgSend(v0, (SEL)(v2 + 664), v1);
}

id OUTLINED_FUNCTION_7_76()
{
  return objc_msgSend(v1, (SEL)(v2 + 750), v0);
}

id OUTLINED_FUNCTION_8_84(void *a1)
{
  return objc_msgSend(a1, sel_verticalSizeClass);
}

id OUTLINED_FUNCTION_9_78()
{
  return objc_msgSend(v0, (SEL)(v2 + 750), v1);
}

id OUTLINED_FUNCTION_10_68(void *a1)
{
  return objc_msgSend(a1, sel_currentTraitCollection);
}

uint64_t OUTLINED_FUNCTION_12_62()
{
  return sub_1AF7AE2A0();
}

id OUTLINED_FUNCTION_14_51()
{
  return [v0 (SEL)(v1 + 1708)];
}

uint64_t OUTLINED_FUNCTION_15_59()
{
  return v0;
}

char *sub_1AF78AA44()
{
  OUTLINED_FUNCTION_0_51();
  id v1 = objc_allocWithZone(v0);
  OUTLINED_FUNCTION_1_55();
  return sub_1AF78AA94();
}

char *sub_1AF78AA94()
{
  OUTLINED_FUNCTION_0_51();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9ACA6D0);
  MEMORY[0x1F4188790](v2 - 8);
  unsigned int v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = (void *)(v0 + OBJC_IVAR____TtC12GameCenterUI15EmphasizedLabel_fullText);
  void *v5 = 0;
  v5[1] = 0;
  *(void *)(v0 + OBJC_IVAR____TtC12GameCenterUI15EmphasizedLabel_emphasizedLabelSegments) = 0;
  sub_1AF4A5B0C(v1, (uint64_t)v4);
  OUTLINED_FUNCTION_1_55();
  id v12 = sub_1AF4A4968(v6, v7, v8, v9, v10, v11);
  sub_1AF720364(v1);
  return v12;
}

id sub_1AF78AB5C(void *a1)
{
  uint64_t v3 = &v1[OBJC_IVAR____TtC12GameCenterUI15EmphasizedLabel_fullText];
  *(void *)uint64_t v3 = 0;
  *((void *)v3 + 1) = 0;
  *(void *)&v1[OBJC_IVAR____TtC12GameCenterUI15EmphasizedLabel_emphasizedLabelSegments] = 0;
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for EmphasizedLabel(0);
  id v4 = objc_msgSendSuper2(&v6, sel_initWithCoder_, a1);

  return v4;
}

uint64_t sub_1AF78ABF4()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

id sub_1AF78AC38()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EmphasizedLabel(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1AF78ACC0()
{
  return type metadata accessor for EmphasizedLabel(0);
}

uint64_t type metadata accessor for EmphasizedLabel(uint64_t a1)
{
  return sub_1AF3931F4(a1, (uint64_t *)&unk_1E9ACFCA8);
}

uint64_t sub_1AF78ACE8()
{
  return swift_updateClassMetadata2();
}

uint64_t *sub_1AF78AD34(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  id v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    uint64_t *v4 = *a2;
    id v4 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    char v10 = (char *)a2 + v8;
    uint64_t v11 = sub_1AF7AA5F0();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9ACA6D0);
      memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
    }
    uint64_t v14 = *(int *)(a3 + 24);
    id v15 = *(void **)((char *)a2 + v14);
    *(uint64_t *)((char *)v4 + v14) = (uint64_t)v15;
    id v16 = v15;
  }
  return v4;
}

void sub_1AF78AE8C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_1AF7AA5F0();
  if (!__swift_getEnumTagSinglePayload(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  objc_super v6 = *(void **)(a1 + *(int *)(a2 + 24));
}

void *sub_1AF78AF30(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1AF7AA5F0();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9ACA6D0);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  }
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = *(void **)((char *)a2 + v12);
  *(void *)((char *)a1 + v12) = v13;
  id v14 = v13;
  return a1;
}

void *sub_1AF78B038(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1AF7AA5F0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  int v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (!EnumTagSinglePayload)
  {
    uint64_t v12 = *(void *)(v9 - 8);
    if (!v11)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9ACA6D0);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
LABEL_7:
  uint64_t v14 = *(int *)(a3 + 24);
  id v15 = *(void **)((char *)a1 + v14);
  id v16 = *(void **)((char *)a2 + v14);
  *(void *)((char *)a1 + v14) = v16;
  id v17 = v16;

  return a1;
}

_OWORD *sub_1AF78B1D8(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1AF7AA5F0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9ACA6D0);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  }
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *sub_1AF78B2CC(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1AF7AA5F0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  int v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (!EnumTagSinglePayload)
  {
    uint64_t v13 = *(void *)(v10 - 8);
    if (!v12)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9ACA6D0);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
LABEL_7:
  uint64_t v15 = *(int *)(a3 + 24);
  id v16 = *(void **)((char *)a1 + v15);
  *(void *)((char *)a1 + v15) = *(void *)((char *)a2 + v15);

  return a1;
}

uint64_t sub_1AF78B458(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1AF78B46C);
}

uint64_t sub_1AF78B46C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9ACA6D0);
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t sub_1AF78B4F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1AF78B50C);
}

uint64_t sub_1AF78B50C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9ACA6D0);
    uint64_t v8 = v5 + *(int *)(a4 + 20);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for EmphasizedLabelSegment(uint64_t a1)
{
  return sub_1AF3931F4(a1, (uint64_t *)&unk_1E9ACFCB8);
}

void sub_1AF78B5B0()
{
  sub_1AF4A5C44();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t ObjectGraph.__allocating_init(name:dependencies:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ObjectGraph.init(name:dependencies:)(a1, a2, a3);
}

uint64_t ObjectGraph.init(name:dependencies:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1AF7AD970();
  uint64_t v6 = *(void *)(v5 - 8);
  __n128 v7 = MEMORY[0x1F4188790](v5);
  *(void *)(v3 + qword_1E9ACFCC8) = 0;
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v6 + 16))((char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a3, v5, v7);
  uint64_t v9 = sub_1AF7AD6E0();
  type metadata accessor for ArtworkLoader();
  swift_retain();
  sub_1AF7AD710();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a3, v5);
  *(void *)(v9 + qword_1E9ACFCC8) = v11[1];
  swift_release();
  return v9;
}

uint64_t sub_1AF78B800()
{
  return swift_release();
}

uint64_t ObjectGraph.deinit()
{
  uint64_t v0 = sub_1AF7AD720();
  swift_release();
  return v0;
}

uint64_t ObjectGraph.__deallocating_deinit()
{
  uint64_t v0 = sub_1AF7AD720();
  swift_release();

  return MEMORY[0x1F4186488](v0, 24, 7);
}

uint64_t type metadata accessor for ObjectGraph()
{
  uint64_t result = qword_1E9ACFCD0;
  if (!qword_1E9ACFCD0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1AF78B8E0()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1AF78B92C()
{
  return type metadata accessor for ObjectGraph();
}

char *sub_1AF78B934(double a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v9 = sub_1AF7AA5F0();
  OUTLINED_FUNCTION_1_6();
  uint64_t v11 = v10;
  __n128 v13 = MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v11 + 16))(v15, a5, v9, v13);
  id v16 = (char *)sub_1AF6E4CB8((uint64_t)v15);
  *(double *)&v16[OBJC_IVAR____TtC12GameCenterUI12HeaderButton_trailingImageSpacer] = a1;
  id v17 = v16;
  sub_1AF78BB28();
  id v18 = v17;
  if (a3)
  {
    id v19 = (void *)sub_1AF7AE0A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v19 = 0;
  }
  objc_msgSend(v17, sel_setTitle_forState_, v19, 0);

  objc_msgSend(v17, sel_setImage_forState_, a4, 0);
  OUTLINED_FUNCTION_2_148();
  objc_msgSend(v17, sel_setTransform_, &v25);
  id v20 = objc_msgSend(v17, sel_titleLabel);
  if (v20)
  {
    id v21 = v20;
    OUTLINED_FUNCTION_2_148();
    OUTLINED_FUNCTION_1_161();
  }
  id v22 = objc_msgSend(v17, sel_imageView);
  if (v22)
  {
    id v23 = v22;
    OUTLINED_FUNCTION_2_148();
    OUTLINED_FUNCTION_1_161();

    a4 = v23;
  }

  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a5, v9);
  return v17;
}

id sub_1AF78BB28()
{
  uint64_t v1 = v0;
  double v2 = *(double *)&v0[OBJC_IVAR____TtC12GameCenterUI12HeaderButton_trailingImageSpacer];
  id v3 = objc_msgSend(v0, sel_traitCollection);
  char v4 = sub_1AF7AE760();

  if (v4) {
    double v5 = v2;
  }
  else {
    double v5 = 0.0;
  }
  if (v4) {
    double v6 = 0.0;
  }
  else {
    double v6 = v2;
  }
  if (v4) {
    double v7 = -v2;
  }
  else {
    double v7 = v2;
  }
  if ((v4 & 1) == 0) {
    double v2 = -v2;
  }
  objc_msgSend(v1, sel_setContentEdgeInsets_, 0.0, v6, 0.0, v5);

  return objc_msgSend(v1, sel_setImageEdgeInsets_, 0.0, v2, 0.0, v7);
}

id sub_1AF78BBF0()
{
  uint64_t v0 = sub_1AF7AA5F0();
  OUTLINED_FUNCTION_1_6();
  uint64_t v2 = v1;
  MEMORY[0x1F4188790](v3);
  double v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getObjectType();
  if (qword_1E9AC2828 != -1) {
    swift_once();
  }
  uint64_t v6 = __swift_project_value_buffer(v0, (uint64_t)&unk_1E9AF0100);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v6, v0);
  id v7 = sub_1AF6E4CB8((uint64_t)v5);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v7;
}

id sub_1AF78BD64(void *a1)
{
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for HeaderButton();
  objc_msgSendSuper2(&v6, sel_traitCollectionDidChange_, a1);
  id v3 = objc_msgSend(v1, sel_traitCollection);
  id v4 = objc_msgSend(v3, sel_layoutDirection);

  if (!a1) {
    return sub_1AF78BB28();
  }
  id result = objc_msgSend(a1, sel_layoutDirection);
  if (v4 != result) {
    return sub_1AF78BB28();
  }
  return result;
}

uint64_t type metadata accessor for HeaderButton()
{
  uint64_t result = qword_1EB78C6C8;
  if (!qword_1EB78C6C8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id sub_1AF78BEBC(double a1, double a2, double a3, double a4)
{
  *(void *)&v4[OBJC_IVAR____TtC12GameCenterUI12HeaderButton_trailingImageSpacer] = 0;
  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for HeaderButton();
  return objc_msgSendSuper2(&v10, sel_initWithFrame_, a1, a2, a3, a4);
}

id HeaderButton.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HeaderButton();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1AF78BF90()
{
  return type metadata accessor for HeaderButton();
}

uint64_t sub_1AF78BF98()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for HeaderButton(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for HeaderButton);
}

id OUTLINED_FUNCTION_1_161()
{
  long long v4 = *(_OWORD *)(v2 - 112);
  long long v5 = *(_OWORD *)(v2 - 96);
  *(_OWORD *)(v2 - 128) = *(_OWORD *)(v2 - 128);
  *(_OWORD *)(v2 - 112) = v4;
  *(_OWORD *)(v2 - 96) = v5;
  return objc_msgSend(v0, (SEL)(v1 + 3736), v2 - 128);
}

CGAffineTransform *OUTLINED_FUNCTION_2_148()
{
  return CGAffineTransformMakeScale((CGAffineTransform *)(v0 - 128), -1.0, 1.0);
}

unint64_t sub_1AF78C040(uint64_t a1)
{
  unint64_t result = sub_1AF78CFB8(a1);
  uint64_t v18 = qword_1F0797800;
  if (!qword_1F0797800)
  {
LABEL_20:
    swift_bridgeObjectRelease();
    return 0;
  }
  unint64_t v2 = 0;
  uint64_t v3 = *(void *)(result + 16);
  id v16 = (char *)(result + 48);
  uint64_t v17 = v3;
  while (1)
  {
    if (v2 >= qword_1F0797800)
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v3)
    {
      int v4 = *((unsigned __int8 *)&unk_1F07977F0 + v2 + 32);
      swift_bridgeObjectRetain();
      long long v5 = v16;
      uint64_t v6 = MEMORY[0x1E4FBC860];
      while (1)
      {
        uint64_t v7 = *((void *)v5 - 2);
        uint64_t v8 = *((void *)v5 - 1);
        int v9 = *v5;
        if (v9 == 2)
        {
          if (!v4) {
            goto LABEL_10;
          }
        }
        else if (v4 == 1)
        {
LABEL_10:
          sub_1AF78D374(*((id *)v5 - 2), *((void **)v5 - 1), *v5);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            sub_1AF4E8844(0, *(void *)(v6 + 16) + 1, 1);
          }
          unint64_t v11 = *(void *)(v6 + 16);
          unint64_t v10 = *(void *)(v6 + 24);
          if (v11 >= v10 >> 1) {
            sub_1AF4E8844(v10 > 1, v11 + 1, 1);
          }
          *(void *)(v6 + 16) = v11 + 1;
          uint64_t v12 = v6 + 24 * v11;
          *(void *)(v12 + 32) = v7;
          *(void *)(v12 + 40) = v8;
          *(unsigned char *)(v12 + 48) = v9;
        }
        v5 += 24;
        if (!--v3)
        {
          swift_bridgeObjectRelease();
          uint64_t v3 = v17;
          goto LABEL_18;
        }
      }
    }
    uint64_t v6 = MEMORY[0x1E4FBC860];
LABEL_18:
    unint64_t v13 = *(void *)(v6 + 16);
    if (v13) {
      break;
    }
    ++v2;
    unint64_t result = swift_release();
    if (v2 == v18) {
      goto LABEL_20;
    }
  }
  unint64_t result = sub_1AF6044B4(*(void *)(v6 + 16));
  if (result >= v13)
  {
LABEL_25:
    __break(1u);
    return result;
  }
  uint64_t v15 = v6 + 24 * result;
  uint64_t v14 = *(void **)(v15 + 32);
  sub_1AF78D374(v14, *(void **)(v15 + 40), *(unsigned char *)(v15 + 48));
  swift_bridgeObjectRelease();
  swift_release();
  return (unint64_t)v14;
}

void sub_1AF78C240(char *a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  switch(a3)
  {
    case 1:
      uint64_t v59 = a1;
      unint64_t v60 = (void *)OUTLINED_FUNCTION_1_17();
      id v61 = (id)GKGameCenterUIFrameworkBundle();
      id v62 = (id)OUTLINED_FUNCTION_1_39();

      id v31 = (id)sub_1AF7AE0E0();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9ACC9B0);
      uint64_t v63 = OUTLINED_FUNCTION_16_1();
      *(_OWORD *)(v63 + 16) = xmmword_1AF7CB2D0;
      uint64_t v64 = sub_1AF78D310(v59);
      if (!v65) {
        goto LABEL_36;
      }
      uint64_t v4 = v64;
      uint64_t v66 = v65;
      *(void *)(v63 + 56) = MEMORY[0x1E4FBB1A0];
      *(void *)(v63 + 64) = sub_1AF379654();
      *(void *)(v63 + 32) = v4;
      *(void *)(v63 + 40) = v66;
      sub_1AF7AE100();
      OUTLINED_FUNCTION_12_63();
      swift_bridgeObjectRelease();
      uint64_t v67 = (void *)OUTLINED_FUNCTION_2_149();
      id v68 = (id)GKGameCenterUIFrameworkBundle();
      id v69 = (id)GKGetLocalizedStringFromTableInBundle();

      uint64_t v146 = sub_1AF7AE0E0();
      uint64_t v71 = v70;

      uint64_t v72 = (void *)OUTLINED_FUNCTION_1_17();
      id v73 = (id)GKGameCenterUIFrameworkBundle();
      id v74 = (id)OUTLINED_FUNCTION_1_162();
      OUTLINED_FUNCTION_11_73();
      uint64_t v76 = v75;

      uint64_t v77 = sub_1AF7AE0E0();
      uint64_t v79 = v78;

      v80 = (void *)OUTLINED_FUNCTION_1_17();
      id v81 = (id)GKGameCenterUIFrameworkBundle();
      id v20 = (id)GKGetLocalizedStringFromTableInBundle();

      uint64_t v35 = sub_1AF7AE0E0();
      uint64_t v37 = v82;

      sub_1AF605BD8(a1, (void *)a2, 1);
      id v38 = 0;
      LOBYTE(v20) = 0;
      *(void *)a4 = v146;
      *(void *)(a4 + 8) = v71;
      *(void *)(a4 + 16) = v77;
      *(void *)(a4 + 24) = v79;
LABEL_15:
      *(void *)(a4 + 32) = 0;
      unint64_t v58 = 0xE000000000000000;
      *(unsigned char *)(a4 + 40) = 0;
      goto LABEL_30;
    case 2:
      id v39 = objc_allocWithZone((Class)GKDashboardPlayerPhotoView);
      id v40 = a1;
      id v41 = (id)a2;
      objc_msgSend(v39, sel_init);
      id v42 = OUTLINED_FUNCTION_9_79();
      objc_msgSend((id)a2, sel_setPlayer_, v42);

      id v43 = objc_msgSend(self, sel_formattedDifferenceBetweenFirstScore_secondScore_, v41, v40);
      v149 = v40;
      if (v43)
      {
        id v44 = v43;
        sub_1AF7AE0E0();
        OUTLINED_FUNCTION_12_63();
LABEL_22:

        OUTLINED_FUNCTION_11_73();
        uint64_t v102 = (void *)OUTLINED_FUNCTION_1_17();
        id v103 = (id)GKGameCenterUIFrameworkBundle();
        id v104 = (id)OUTLINED_FUNCTION_24_0();

        sub_1AF7AE0E0();
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9ACC9B0);
        uint64_t v105 = swift_allocObject();
        *(_OWORD *)(v105 + 16) = xmmword_1AF7CD470;
        v142 = v41;
        id v106 = [v41 a1 + 536];
        id v107 = objc_msgSend(v106, sel_alias);

        sub_1AF7AE0E0();
        uint64_t v109 = v108;

        *(void *)(v105 + 56) = MEMORY[0x1E4FBB1A0];
        unint64_t v110 = sub_1AF379654();
        uint64_t v4 = OUTLINED_FUNCTION_7_77(v110);
        v139 = v111;
        swift_bridgeObjectRelease();
        uint64_t v112 = (void *)OUTLINED_FUNCTION_2_149();
        id v113 = (id)GKGameCenterUIFrameworkBundle();
        id v114 = (id)OUTLINED_FUNCTION_1_10();

        sub_1AF7AE0E0();
        id v38 = (id)a2;
        v115 = (void *)OUTLINED_FUNCTION_1_17();
        id v116 = (id)GKGameCenterUIFrameworkBundle();
        id v20 = (id)OUTLINED_FUNCTION_1_162();

        uint64_t v35 = sub_1AF7AE0E0();
        uint64_t v37 = v117;

        OUTLINED_FUNCTION_10_69();
        *(void *)(a4 + 16) = a2;
        id v31 = v139;
        goto LABEL_28;
      }
      uint64_t v98 = objc_msgSend(v41, sel_score);
      v99 = objc_msgSend(v40, sel_score);
      BOOL v100 = __OFSUB__(v98, v99);
      int64_t v101 = v98 - v99;
      if (!v100)
      {
        if ((v101 & 0x8000000000000000) == 0 || (BOOL v100 = __OFSUB__(0, v101), v101 = -v101, !v100))
        {
          id v5 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v101);
          id v44 = objc_msgSend(self, sel_localizedStringFromNumber_numberStyle_, v5, 1);
          sub_1AF7AE0E0();

          goto LABEL_22;
        }
        goto LABEL_34;
      }
      __break(1u);
      goto LABEL_33;
    case 3:
      id v45 = objc_allocWithZone((Class)GKDashboardPlayerPhotoView);
      id v46 = a1;
      id v47 = (id)a2;
      objc_msgSend(v45, sel_init);
      id v48 = OUTLINED_FUNCTION_9_79();
      objc_msgSend((id)a2, sel_setPlayer_, v48);

      id v49 = objc_msgSend(self, sel_formattedDifferenceBetweenFirstScore_secondScore_, v46, v47);
      uint64_t v145 = (void *)a2;
      uint64_t v150 = v46;
      if (v49)
      {
        id v50 = v49;
        sub_1AF7AE0E0();
        OUTLINED_FUNCTION_12_63();
      }
      else
      {
        uint64_t v118 = objc_msgSend(v46, sel_score);
        uint64_t v119 = objc_msgSend(v47, sel_score);
        BOOL v100 = __OFSUB__(v118, v119);
        int64_t v120 = v118 - v119;
        if (v100)
        {
LABEL_33:
          __break(1u);
LABEL_34:
          __break(1u);
LABEL_35:
          __break(1u);
LABEL_36:
          __break(1u);
          JUMPOUT(0x1AF78CF90);
        }
        if (v120 < 0)
        {
          BOOL v100 = __OFSUB__(0, v120);
          int64_t v120 = -v120;
          if (v100) {
            goto LABEL_35;
          }
        }
        id v5 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v120);
        id v50 = objc_msgSend(self, sel_localizedStringFromNumber_numberStyle_, v5, 1);
        sub_1AF7AE0E0();
      }
      OUTLINED_FUNCTION_11_73();
      uint64_t v121 = (void *)OUTLINED_FUNCTION_1_17();
      id v122 = (id)GKGameCenterUIFrameworkBundle();
      id v123 = (id)OUTLINED_FUNCTION_24_0();

      sub_1AF7AE0E0();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9ACC9B0);
      uint64_t v124 = swift_allocObject();
      *(_OWORD *)(v124 + 16) = xmmword_1AF7CD470;
      uint64_t v143 = v47;
      id v125 = [v47 a1 + 536];
      id v126 = objc_msgSend(v125, sel_alias);

      sub_1AF7AE0E0();
      uint64_t v128 = v127;

      *(void *)(v124 + 56) = MEMORY[0x1E4FBB1A0];
      unint64_t v129 = sub_1AF379654();
      uint64_t v140 = OUTLINED_FUNCTION_7_77(v129);
      id v31 = v130;
      swift_bridgeObjectRelease();
      uint64_t v131 = (void *)OUTLINED_FUNCTION_2_149();
      id v132 = (id)GKGameCenterUIFrameworkBundle();
      id v133 = (id)OUTLINED_FUNCTION_1_10();

      sub_1AF7AE0E0();
      id v38 = v145;
      uint64_t v134 = (void *)OUTLINED_FUNCTION_1_17();
      id v135 = (id)GKGameCenterUIFrameworkBundle();
      id v20 = (id)OUTLINED_FUNCTION_1_162();

      uint64_t v35 = sub_1AF7AE0E0();
      uint64_t v37 = v136;

      OUTLINED_FUNCTION_10_69();
      *(void *)(a4 + 16) = v145;
      uint64_t v4 = v140;
LABEL_28:
      *(void *)(a4 + 24) = 0;
      unint64_t v58 = 0xE000000000000000;
LABEL_29:
      *(unsigned char *)(a4 + 40) = 5;
LABEL_30:
      *(void *)(a4 + 48) = v4;
      *(void *)(a4 + 56) = v31;
      *(void *)(a4 + 64) = v38;
      *(void *)(a4 + 72) = v58;
      *(unsigned char *)(a4 + 80) = (_BYTE)v20;
      *(void *)(a4 + 88) = v35;
      *(void *)(a4 + 96) = v37;
      *(void *)(a4 + 104) = 0;
      return;
    case 4:
      type metadata accessor for OverlappingPlayersPhotoView();
      id v20 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
      if ((unint64_t)a1 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v51 = sub_1AF7AEEF0();
        sub_1AF605BD8(a1, (void *)a2, 4);
      }
      else
      {
        uint64_t v51 = *(void *)(((unint64_t)a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      if (v51 >= 1) {
        sub_1AF57C21C();
      }
      uint64_t v52 = MEMORY[0x1E4FBB550];
      uint64_t v53 = MEMORY[0x1E4FBB5C8];
      if (a2 < 4)
      {
        id v38 = 0;
        unint64_t v58 = 0xE000000000000000;
      }
      else
      {
        CGRect v54 = (void *)OUTLINED_FUNCTION_1_17();
        id v55 = (id)GKGameCenterUIFrameworkBundle();
        id v56 = (id)OUTLINED_FUNCTION_1_10();

        sub_1AF7AE0E0();
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9ACC9B0);
        uint64_t v4 = OUTLINED_FUNCTION_16_1();
        *(_OWORD *)(v4 + 16) = xmmword_1AF7CB2D0;
        *(void *)(v4 + 56) = v52;
        *(void *)(v4 + 64) = v53;
        *(void *)(v4 + 32) = a2 - 3;
        id v38 = (id)sub_1AF7AE0B0();
        unint64_t v58 = v57;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      uint64_t v83 = a2;
      uint64_t v84 = (void *)OUTLINED_FUNCTION_2_149();
      id v85 = (id)GKGameCenterUIFrameworkBundle();
      id v86 = (id)OUTLINED_FUNCTION_3_28();

      uint64_t v87 = sub_1AF7AE0E0();
      uint64_t v147 = v88;
      uint64_t v152 = v87;

      id v138 = v20;
      uint64_t v89 = (void *)OUTLINED_FUNCTION_1_17();
      id v90 = (id)GKGameCenterUIFrameworkBundle();
      id v31 = (id)OUTLINED_FUNCTION_3_28();

      sub_1AF7AE0E0();
      OUTLINED_FUNCTION_11_73();
      uint64_t v92 = v91;

      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9ACC9B0);
      uint64_t v93 = OUTLINED_FUNCTION_16_1();
      *(_OWORD *)(v93 + 16) = xmmword_1AF7CB2D0;
      *(void *)(v93 + 56) = MEMORY[0x1E4FBB550];
      *(void *)(v93 + 64) = MEMORY[0x1E4FBB5C8];
      *(void *)(v93 + 32) = v83;
      sub_1AF7AE100();
      OUTLINED_FUNCTION_12_63();
      swift_bridgeObjectRelease();
      uint64_t v94 = (void *)OUTLINED_FUNCTION_1_17();
      id v95 = (id)GKGameCenterUIFrameworkBundle();
      id v96 = (id)OUTLINED_FUNCTION_1_162();

      uint64_t v35 = sub_1AF7AE0E0();
      uint64_t v37 = v97;

      *(void *)a4 = v152;
      *(void *)(a4 + 8) = v147;
      *(void *)(a4 + 24) = 0;
      *(void *)(a4 + 32) = 0;
      *(void *)(a4 + 16) = v20;
      LOBYTE(v20) = 1;
      goto LABEL_29;
    default:
      int v9 = a1;
      unint64_t v10 = (void *)sub_1AF7AE0A0();
      id v11 = (id)GKGameCenterUIFrameworkBundle();
      uint64_t v148 = (void *)a2;
      id v20 = (id)OUTLINED_FUNCTION_1_39();

      uint64_t v12 = sub_1AF7AE0E0();
      uint64_t v141 = v13;
      uint64_t v144 = v12;

      uint64_t v14 = (void *)OUTLINED_FUNCTION_1_17();
      id v15 = (id)GKGameCenterUIFrameworkBundle();
      id v16 = (id)OUTLINED_FUNCTION_1_39();

      sub_1AF7AE0E0();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9ACC9B0);
      uint64_t v17 = OUTLINED_FUNCTION_16_1();
      *(_OWORD *)(v17 + 16) = xmmword_1AF7CB2D0;
      id v18 = objc_msgSend(v9, sel_rank);
      id v19 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v18);
      LOBYTE(v20) = 1;
      id v21 = objc_msgSend(self, sel_localizedStringFromNumber_numberStyle_, v19, 1);
      uint64_t v22 = sub_1AF7AE0E0();
      uint64_t v24 = v23;

      *(void *)(v17 + 56) = MEMORY[0x1E4FBB1A0];
      *(void *)(v17 + 64) = sub_1AF379654();
      *(void *)(v17 + 32) = v22;
      *(void *)(v17 + 40) = v24;
      uint64_t v25 = sub_1AF7AE100();
      uint64_t v137 = v26;
      swift_bridgeObjectRelease();
      id v27 = (void *)OUTLINED_FUNCTION_1_17();
      id v28 = (id)GKGameCenterUIFrameworkBundle();
      id v29 = (id)OUTLINED_FUNCTION_3_28();

      uint64_t v4 = sub_1AF7AE0E0();
      id v31 = v30;

      id v32 = (void *)OUTLINED_FUNCTION_1_17();
      id v33 = (id)GKGameCenterUIFrameworkBundle();
      id v34 = (id)OUTLINED_FUNCTION_1_162();

      uint64_t v35 = sub_1AF7AE0E0();
      uint64_t v37 = v36;

      sub_1AF605BD8(a1, v148, 0);
      id v38 = 0;
      *(void *)a4 = v144;
      *(void *)(a4 + 8) = v141;
      *(void *)(a4 + 16) = v25;
      *(void *)(a4 + 24) = v137;
      goto LABEL_15;
  }
}

unint64_t sub_1AF78CFB8(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  if (*(void *)a1)
  {
    uint64_t v3 = *(void **)(a1 + 8);
    if (v3)
    {
      id v4 = v1;
      id v5 = v3;
      if ((uint64_t)objc_msgSend(v5, sel_rank) > 0)
      {
        if (*(uint64_t *)(a1 + 40) < 1)
        {
          unint64_t v8 = MEMORY[0x1E4FBC860];
        }
        else
        {
          id v6 = v5;
          sub_1AF46574C();
          unint64_t v8 = v7;
          unint64_t v9 = *(void *)(v7 + 16);
          unint64_t v10 = v9 + 1;
          if (v9 >= *(void *)(v7 + 24) >> 1)
          {
            sub_1AF46574C();
            unint64_t v10 = v9 + 1;
            unint64_t v8 = v32;
          }
          *(void *)(v8 + 16) = v10;
          unint64_t v11 = v8 + 24 * v9;
          *(void *)(v11 + 32) = v3;
          *(void *)(v11 + 40) = 0;
          *(unsigned char *)(v11 + 48) = 0;
        }
        sub_1AF78D418(a1 + 24, (uint64_t)&v40);
        sub_1AF78D418((uint64_t)&v40, (uint64_t)&v41);
        if (v41)
        {
          sub_1AF5596EC(&v40);
          id v18 = v5;
          sub_1AF5596EC(&v40);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            OUTLINED_FUNCTION_3_131();
            unint64_t v8 = v35;
          }
          unint64_t v19 = *(void *)(v8 + 16);
          if (v19 >= *(void *)(v8 + 24) >> 1)
          {
            OUTLINED_FUNCTION_8_85();
            unint64_t v19 = v8;
            unint64_t v8 = v36;
          }
          OUTLINED_FUNCTION_13_59(v19);
          *(unsigned char *)(v20 + 48) = 2;
          sub_1AF393A8C(&v40);
        }
        sub_1AF78D418(a1 + 32, (uint64_t)&v39);
        sub_1AF78D418((uint64_t)&v39, (uint64_t)&v42);
        if (v42)
        {
          sub_1AF5596EC(&v39);
          id v21 = v5;
          sub_1AF5596EC(&v39);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            OUTLINED_FUNCTION_3_131();
            unint64_t v8 = v37;
          }
          unint64_t v22 = *(void *)(v8 + 16);
          if (v22 >= *(void *)(v8 + 24) >> 1)
          {
            OUTLINED_FUNCTION_8_85();
            unint64_t v22 = v8;
            unint64_t v8 = v38;
          }
          OUTLINED_FUNCTION_13_59(v22);
          *(unsigned char *)(v23 + 48) = 3;

          sub_1AF393A8C(&v39);
        }
        else
        {
        }
        goto LABEL_30;
      }
    }
    else
    {
      id v12 = v1;
    }
    if (*(void *)(a1 + 40))
    {
      unint64_t v8 = MEMORY[0x1E4FBC860];
    }
    else
    {
      id v13 = v1;
      sub_1AF46574C();
      unint64_t v8 = v14;
      unint64_t v15 = *(void *)(v14 + 16);
      unint64_t v16 = v15 + 1;
      if (v15 >= *(void *)(v14 + 24) >> 1)
      {
        unint64_t v33 = *(void *)(v14 + 16);
        sub_1AF46574C();
        unint64_t v15 = v33;
        unint64_t v8 = v34;
      }
      *(void *)(v8 + 16) = v16;
      unint64_t v17 = v8 + 24 * v15;
      *(void *)(v17 + 32) = v1;
      *(void *)(v17 + 40) = 0;
      *(unsigned char *)(v17 + 48) = 1;
    }
LABEL_30:
    if (*(uint64_t *)(a1 + 48) < 1)
    {
LABEL_42:

      return v8;
    }
    if (v3 && (uint64_t)objc_msgSend(v3, sel_rank) >= 1)
    {
      uint64_t v24 = *(void *)(a1 + 40);
      uint64_t v25 = v24 - 1;
      if (!__OFSUB__(v24, 1)) {
        goto LABEL_37;
      }
      __break(1u);
    }
    uint64_t v25 = *(void *)(a1 + 40);
LABEL_37:
    uint64_t v26 = *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      OUTLINED_FUNCTION_3_131();
      unint64_t v8 = v30;
    }
    unint64_t v27 = *(void *)(v8 + 16);
    if (v27 >= *(void *)(v8 + 24) >> 1)
    {
      sub_1AF46574C();
      unint64_t v8 = v31;
    }
    *(void *)(v8 + 16) = v27 + 1;
    unint64_t v28 = v8 + 24 * v27;
    *(void *)(v28 + 32) = v26;
    *(void *)(v28 + 40) = v25;
    *(unsigned char *)(v28 + 48) = 4;
    goto LABEL_42;
  }
  return MEMORY[0x1E4FBC860];
}

uint64_t sub_1AF78D310(void *a1)
{
  id v1 = objc_msgSend(a1, sel_localizedTitle);
  if (!v1) {
    return 0;
  }
  unint64_t v2 = v1;
  uint64_t v3 = sub_1AF7AE0E0();

  return v3;
}

id sub_1AF78D374(id result, void *a2, char a3)
{
  switch(a3)
  {
    case 0:
    case 1:
      goto LABEL_3;
    case 2:
    case 3:
      id v3 = result;
      unint64_t result = a2;
LABEL_3:
      unint64_t result = result;
      break;
    case 4:
      unint64_t result = (id)swift_bridgeObjectRetain();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1AF78D418(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACFCE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void destroy for LeaderboardsHighlight(uint64_t a1)
{
}

uint64_t _s12GameCenterUI21LeaderboardsHighlightOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_1AF78D374(*(id *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for LeaderboardsHighlight(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_1AF78D374(*(id *)a2, v4, v5);
  id v6 = *(void **)a1;
  unint64_t v7 = *(void **)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_1AF605BD8(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for LeaderboardsHighlight(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void **)a1;
  char v5 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_1AF605BD8(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for LeaderboardsHighlight(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFC && *(unsigned char *)(a1 + 17))
    {
      int v2 = *(_DWORD *)a1 + 251;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 4) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LeaderboardsHighlight(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)unint64_t result = a2 - 252;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1AF78D604(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for LeaderboardsHighlight()
{
  return &type metadata for LeaderboardsHighlight;
}

uint64_t destroy for LeaderboardsHighlight.Input(id *a1)
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for LeaderboardsHighlight.Input(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  char v5 = *(void **)(a2 + 16);
  char v6 = *(void **)(a2 + 24);
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  unint64_t v7 = *(void **)(a2 + 32);
  *(void *)(a1 + 32) = v7;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  id v8 = v3;
  id v9 = v4;
  id v10 = v5;
  id v11 = v6;
  id v12 = v7;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for LeaderboardsHighlight.Input(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  char v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  unint64_t v7 = *(void **)(a1 + 8);
  id v8 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v8;
  id v9 = v8;

  id v10 = *(void **)(a1 + 16);
  id v11 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v11;
  id v12 = v11;

  id v13 = *(void **)(a1 + 24);
  unint64_t v14 = *(void **)(a2 + 24);
  *(void *)(a1 + 24) = v14;
  id v15 = v14;

  unint64_t v16 = *(void **)(a1 + 32);
  unint64_t v17 = *(void **)(a2 + 32);
  *(void *)(a1 + 32) = v17;
  id v18 = v17;

  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for LeaderboardsHighlight.Input(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  char v5 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);

  id v6 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);

  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LeaderboardsHighlight.Input(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 64))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 56);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LeaderboardsHighlight.Input(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 56) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LeaderboardsHighlight.Input()
{
  return &type metadata for LeaderboardsHighlight.Input;
}

uint64_t OUTLINED_FUNCTION_1_162()
{
  return GKGetLocalizedStringFromTableInBundle();
}

uint64_t OUTLINED_FUNCTION_2_149()
{
  return sub_1AF7AE0A0();
}

void OUTLINED_FUNCTION_3_131()
{
  sub_1AF46574C();
}

uint64_t OUTLINED_FUNCTION_7_77(uint64_t a1)
{
  v5[4] = v6;
  v5[5] = v2;
  v5[12] = v1;
  v5[13] = a1;
  v5[8] = a1;
  v5[9] = v3;
  v5[10] = v4;
  return sub_1AF7AE100();
}

void OUTLINED_FUNCTION_8_85()
{
  sub_1AF46574C();
}

id OUTLINED_FUNCTION_9_79()
{
  return objc_msgSend(v0, sel_player);
}

void OUTLINED_FUNCTION_10_69()
{
  void *v0 = v1;
  v0[1] = v2;
  v0[4] = 0;
}

void OUTLINED_FUNCTION_13_59(uint64_t a1@<X8>)
{
  *(void *)(v2 + 16) = v1;
  uint64_t v5 = v2 + 24 * a1;
  *(void *)(v5 + 32) = v3;
  *(void *)(v5 + 40) = v4;
}

uint64_t destroy for SignedOutView()
{
  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for SignedOutView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for SignedOutView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for SignedOutView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SignedOutView(uint64_t *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 64))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      uint64_t v3 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SignedOutView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 64) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 64) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SignedOutView()
{
  return &type metadata for SignedOutView;
}

uint64_t sub_1AF78DCB4()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_1AF78DCD0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    int v2 = (void *)sub_1AF7AE0A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    int v2 = 0;
  }
  id v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_presenterForPrivacySplashWithIdentifier_, v2);

  return v3;
}

uint64_t sub_1AF78DD40@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for GameCenterSettings();
  sub_1AF78FE48((unint64_t *)&qword_1E9AC6290, (void (*)(uint64_t))type metadata accessor for GameCenterSettings);
  uint64_t v2 = sub_1AF7ABC70();
  uint64_t v4 = v3;
  OUTLINED_FUNCTION_4_125();
  OUTLINED_FUNCTION_4_125();
  uint64_t result = OUTLINED_FUNCTION_4_125();
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(unsigned char *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v7;
  *(unsigned char *)(a1 + 48) = v6;
  *(void *)(a1 + 56) = v7;
  return result;
}

void sub_1AF78DE28(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_1AF78DEA0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v54 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACFCE8);
  MEMORY[0x1F4188790](v3);
  uint64_t v5 = (char *)v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACFCF0);
  OUTLINED_FUNCTION_0_11();
  MEMORY[0x1F4188790](v7);
  id v9 = (char *)v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACFCF8);
  OUTLINED_FUNCTION_0_11();
  uint64_t v51 = v10;
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_3_3();
  unint64_t v58 = v12;
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACFD00);
  OUTLINED_FUNCTION_0_11();
  uint64_t v53 = v13;
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_3_3();
  v49[2] = v15;
  id v62 = v1;
  *(void *)uint64_t v5 = sub_1AF7AC0F0();
  *((void *)v5 + 1) = 0x4028000000000000;
  v5[16] = 0;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACFD08);
  sub_1AF78EE54(v1, &v5[*(int *)(v16 + 44)]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACFD10);
  sub_1AF78FA68();
  sub_1AF3A2084(&qword_1E9ACFD58, &qword_1E9ACFCE8);
  sub_1AF7AD110();
  unint64_t v17 = (void *)sub_1AF7AE0A0();
  id v18 = (id)GKGameCenterUIFrameworkBundle();
  id v19 = (id)OUTLINED_FUNCTION_8_40();

  uint64_t v20 = sub_1AF7AE0E0();
  uint64_t v22 = v21;

  uint64_t v72 = v20;
  uint64_t v73 = v22;
  id v56 = v2;
  __n128 v71 = v2[3];
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AC3CC0);
  sub_1AF7ACF70();
  id v61 = v2;
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AC4090);
  unint64_t v23 = sub_1AF78FD38();
  unint64_t v24 = sub_1AF374298();
  uint64_t v25 = sub_1AF3A2084((unint64_t *)&qword_1E9AC40C0, &qword_1E9AC4090);
  uint64_t v26 = v9;
  sub_1AF7ACC20();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_1_9();
  v27();
  unint64_t v28 = (void *)sub_1AF7AE0A0();
  id v29 = (id)GKGameCenterUIFrameworkBundle();
  id v30 = (id)OUTLINED_FUNCTION_8_40();

  uint64_t v31 = sub_1AF7AE0E0();
  uint64_t v33 = v32;

  uint64_t v72 = v31;
  uint64_t v73 = v33;
  unint64_t v34 = v56;
  OUTLINED_FUNCTION_3_132(v56[1]);
  unint64_t v60 = v34;
  uint64_t v63 = v6;
  uint64_t v35 = MEMORY[0x1E4FBB1A0];
  uint64_t v64 = MEMORY[0x1E4FBB1A0];
  uint64_t v65 = v55;
  uint64_t v66 = MEMORY[0x1E4F3E2F8];
  unint64_t v67 = v23;
  unint64_t v68 = v24;
  uint64_t v69 = v25;
  uint64_t v70 = MEMORY[0x1E4F3E2E8];
  v49[1] = MEMORY[0x1E4F3E980];
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v37 = v50;
  OUTLINED_FUNCTION_6_81();
  unint64_t v38 = v58;
  sub_1AF7ACC20();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_1_9();
  v39();
  id v40 = (void *)sub_1AF7AE0A0();
  id v41 = (id)GKGameCenterUIFrameworkBundle();
  id v42 = (id)OUTLINED_FUNCTION_8_40();

  uint64_t v43 = sub_1AF7AE0E0();
  uint64_t v45 = v44;

  uint64_t v72 = v43;
  uint64_t v73 = v45;
  id v46 = v56;
  OUTLINED_FUNCTION_3_132(v56[2]);
  uint64_t v59 = v46;
  uint64_t v63 = v37;
  uint64_t v64 = v35;
  uint64_t v65 = v55;
  uint64_t v66 = MEMORY[0x1E4F3E2F8];
  unint64_t v67 = OpaqueTypeConformance2;
  unint64_t v68 = v24;
  uint64_t v69 = v25;
  uint64_t v70 = MEMORY[0x1E4F3E2E8];
  swift_getOpaqueTypeConformance2();
  OUTLINED_FUNCTION_6_81();
  sub_1AF7ACC20();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_1_9();
  return v47();
}

uint64_t sub_1AF78E574@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v29 = a2;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AC43D8);
  uint64_t v3 = *(void *)(v26 - 8);
  MEMORY[0x1F4188790](v26);
  uint64_t v5 = (char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACFD38);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACFD28);
  MEMORY[0x1F4188790](v28);
  uint64_t v10 = (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACFD10);
  MEMORY[0x1F4188790](v11 - 8);
  unint64_t v27 = (char *)v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AF7A9FE0();
  uint64_t v30 = sub_1AF7A9B90();
  uint64_t v31 = v13;
  uint64_t v15 = *(void *)a1;
  uint64_t v14 = *(void *)(a1 + 8);
  uint64_t v16 = type metadata accessor for GameCenterSettings();
  sub_1AF78FE48((unint64_t *)&qword_1E9AC6290, (void (*)(uint64_t))type metadata accessor for GameCenterSettings);
  v25[1] = v16;
  v25[2] = v14;
  sub_1AF7ABC40();
  swift_getKeyPath();
  sub_1AF7ABC60();
  swift_release();
  swift_release();
  sub_1AF374298();
  sub_1AF7AD000();
  uint64_t v17 = v26;
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v8, v5, v26);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v17);
  if (v15)
  {
    swift_retain();
    char v18 = sub_1AF3DB690();
    swift_release();
    id v19 = (_OWORD *)swift_allocObject();
    long long v20 = *(_OWORD *)(a1 + 16);
    v19[1] = *(_OWORD *)a1;
    v19[2] = v20;
    long long v21 = *(_OWORD *)(a1 + 48);
    v19[3] = *(_OWORD *)(a1 + 32);
    v19[4] = v21;
    sub_1AF7900F0((uint64_t)v8, (uint64_t)v10);
    uint64_t v22 = &v10[*(int *)(v28 + 36)];
    *uint64_t v22 = v18 & 1;
    *((void *)v22 + 1) = sub_1AF7900E8;
    *((void *)v22 + 2) = v19;
    sub_1AF78FDF0(a1);
    sub_1AF3BAF18((uint64_t)v8, &qword_1E9ACFD38);
    sub_1AF78FB14();
    uint64_t v23 = (uint64_t)v27;
    sub_1AF7ACA30();
    sub_1AF3BAF18((uint64_t)v10, &qword_1E9ACFD28);
    return sub_1AF790158(v23, v29);
  }
  else
  {
    uint64_t result = sub_1AF7ABC50();
    __break(1u);
  }
  return result;
}

uint64_t sub_1AF78E920@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1AF3DB690();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1AF78E950()
{
  return sub_1AF3DB6A4();
}

void sub_1AF78E978(unsigned __int8 *a1, void *a2)
{
  if (*a2)
  {
    int v2 = *a1;
    swift_retain();
    uint64_t v3 = (void *)sub_1AF3DB894();
    swift_release();
    char v4 = sub_1AF68F088();

    if ((v4 & 1) == 0 && v2)
    {
      id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F637F8]), sel_init);
      uint64_t v6 = sub_1AF7AE0E0();
      uint64_t v8 = v7;
      uint64_t v9 = sub_1AF7AE0E0();
      uint64_t v11 = v10;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AC47D8);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_1AF7CB2D0;
      uint64_t v13 = MEMORY[0x1E4FBB1A0];
      sub_1AF7AECC0();
      if (qword_1E9AC1EE0 != -1) {
        swift_once();
      }
      if (byte_1E9AC6470)
      {
        unint64_t v14 = 0xE900000000000072;
        uint64_t v15 = 0x6579614C656D6167;
      }
      else
      {
        if (qword_1E9AC1EE8 != -1) {
          swift_once();
        }
        uint64_t v15 = 0x73676E6974746573;
        if (!byte_1E9AC6471) {
          uint64_t v15 = 0x65726F7453707061;
        }
        unint64_t v14 = 0xE800000000000000;
      }
      *(void *)(inited + 96) = v13;
      *(void *)(inited + 72) = v15;
      *(void *)(inited + 80) = v14;
      uint64_t v16 = sub_1AF7AE000();
      sub_1AF7901C0(v6, v8, v9, v11, v16, v5);

      sub_1AF78EC00();
    }
  }
  else
  {
    type metadata accessor for GameCenterSettings();
    sub_1AF78FE48((unint64_t *)&qword_1E9AC6290, (void (*)(uint64_t))type metadata accessor for GameCenterSettings);
    sub_1AF7ABC50();
    __break(1u);
  }
}

void sub_1AF78EC00()
{
  uint64_t v1 = v0;
  type metadata accessor for GameCenterSettings();
  if (sub_1AF3DE33C())
  {
    long long v2 = v0[3];
LABEL_6:
    long long v12 = v2;
    char v17 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AC3CC0);
    sub_1AF7ACF60();
    return;
  }
  if (sub_1AF3DE39C() & 1) == 0 || (sub_1AF3DE2DC())
  {
    long long v2 = v0[1];
    goto LABEL_6;
  }
  if (!objc_msgSend(self, sel__gkIsOnline))
  {
    long long v2 = v0[2];
    goto LABEL_6;
  }
  if (*(void *)v0)
  {
    uint64_t v3 = MEMORY[0x1B3E84570](*(void *)v0 + 16);
    if (v3)
    {
      char v4 = (void *)v3;
      id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F4C070]), sel_init);
      objc_msgSend(v5, sel_setDelegate_, v4);
      objc_msgSend(v5, sel_setServiceType_, *MEMORY[0x1E4F4D8F8]);
      objc_msgSend(v5, sel__setShouldForceOperation_, 1);
      uint64_t v6 = swift_allocObject();
      *(void *)(v6 + 16) = v4;
      *(void *)(v6 + 24) = v5;
      long long v7 = v1[1];
      *(_OWORD *)(v6 + 32) = *v1;
      *(_OWORD *)(v6 + 48) = v7;
      long long v8 = v1[3];
      *(_OWORD *)(v6 + 64) = v1[2];
      *(_OWORD *)(v6 + 80) = v8;
      uint64_t v15 = sub_1AF7902F8;
      uint64_t v16 = v6;
      *(void *)&long long v12 = MEMORY[0x1E4F143A8];
      *((void *)&v12 + 1) = 1107296256;
      uint64_t v13 = sub_1AF78DE28;
      unint64_t v14 = &block_descriptor_105;
      uint64_t v9 = _Block_copy(&v12);
      id v10 = v4;
      id v11 = v5;
      sub_1AF78FDF0((uint64_t)v1);
      swift_release();
      objc_msgSend(v11, sel_prepareInViewController_completion_, v10, v9);
      _Block_release(v9);
    }
  }
  else
  {
    sub_1AF78FE48((unint64_t *)&qword_1E9AC6290, (void (*)(uint64_t))type metadata accessor for GameCenterSettings);
    sub_1AF7ABC50();
    __break(1u);
  }
}

id sub_1AF78EE54@<X0>(_OWORD *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACFD68);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  long long v7 = (char *)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  id v10 = (char *)&v58 - v9;
  id result = objc_msgSend(self, sel_shared);
  if (result)
  {
    long long v12 = result;
    unsigned int v13 = objc_msgSend(result, sel_lockedDown);

    uint64_t v63 = v7;
    uint64_t v64 = v4;
    id v61 = a2;
    uint64_t v62 = v5;
    if (v13)
    {
      unint64_t v14 = (void *)sub_1AF7AE0A0();
      id v15 = (id)GKGameCenterUIFrameworkBundle();
      id v16 = (id)GKGetLocalizedStringFromTableInBundle();

      uint64_t v17 = sub_1AF7AE0E0();
      uint64_t v19 = v18;

      uint64_t v74 = v17;
      uint64_t v75 = v19;
      sub_1AF374298();
      uint64_t v20 = sub_1AF7AC8C0();
      uint64_t v66 = v22;
      uint64_t v67 = v21;
      uint64_t v68 = v23 & 1;
      uint64_t v69 = v20;
    }
    else
    {
      uint64_t v68 = 0;
      uint64_t v69 = 0;
      uint64_t v66 = 0;
      uint64_t v67 = 0;
    }
    unint64_t v24 = (void *)sub_1AF7AE0A0();
    id v25 = (id)GKGameCenterUIFrameworkBundle();
    id v26 = (id)GKGetLocalizedStringFromTableInBundle();

    uint64_t v27 = sub_1AF7AE0E0();
    uint64_t v29 = v28;

    uint64_t v74 = v27;
    uint64_t v75 = v29;
    uint64_t v72 = 1076169226;
    unint64_t v73 = 0xE400000000000000;
    uint64_t v70 = 0;
    unint64_t v71 = 0xE000000000000000;
    sub_1AF374298();
    uint64_t v30 = sub_1AF7AEAF0();
    uint64_t v32 = v31;
    swift_bridgeObjectRelease();
    uint64_t v74 = v30;
    uint64_t v75 = v32;
    uint64_t v33 = sub_1AF7AC8C0();
    uint64_t v58 = v33;
    uint64_t v60 = v34;
    uint64_t v65 = v35;
    char v37 = v36 & 1;
    unint64_t v38 = (_OWORD *)swift_allocObject();
    long long v39 = a1[1];
    v38[1] = *a1;
    v38[2] = v39;
    long long v40 = a1[3];
    v38[3] = a1[2];
    v38[4] = v40;
    MEMORY[0x1F4188790](v38);
    sub_1AF78FDF0((uint64_t)a1);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACFD70);
    sub_1AF78FEA4();
    uint64_t v59 = v10;
    sub_1AF7ACFA0();
    uint64_t v41 = v62;
    id v42 = v63;
    uint64_t v43 = *(void (**)(char *, char *, uint64_t))(v62 + 16);
    uint64_t v44 = v64;
    v43(v63, v10, v64);
    uint64_t v45 = v68;
    uint64_t v46 = v69;
    id v47 = v61;
    uint64_t v48 = v67;
    *id v61 = v69;
    v47[1] = v48;
    uint64_t v49 = v66;
    v47[2] = v45;
    v47[3] = v49;
    v47[4] = v33;
    uint64_t v50 = v60;
    v47[5] = v60;
    *((unsigned char *)v47 + 48) = v37;
    v47[7] = v65;
    uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACFD80);
    v43((char *)v47 + *(int *)(v51 + 64), v42, v44);
    uint64_t v52 = v46;
    uint64_t v53 = v67;
    char v54 = v45;
    uint64_t v55 = v66;
    sub_1AF3F89DC(v52, v67, v54, v66);
    uint64_t v56 = v58;
    sub_1AF394770(v58, v50, v37);
    uint64_t v57 = *(void (**)(char *, uint64_t))(v41 + 8);
    swift_bridgeObjectRetain();
    v57(v59, v44);
    v57(v42, v44);
    sub_1AF394780(v56, v50, v37);
    swift_bridgeObjectRelease();
    return (id)sub_1AF3F8A8C(v69, v53, v68, v55);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1AF78F2F4(void *a1)
{
  sub_1AF476AF4();
  uint64_t v2 = sub_1AF7AE0E0();
  id v4 = sub_1AF78DCD0(v2, v3);
  if (v4)
  {
    id v8 = v4;
    if (*a1)
    {
      uint64_t v5 = MEMORY[0x1B3E84570](*a1 + 16);
      if (v5)
      {
        uint64_t v6 = (void *)v5;
        objc_msgSend(v8, sel_setPresentingViewController_, v5);
        objc_msgSend(v8, sel_present);

        long long v7 = v6;
      }
      else
      {
        long long v7 = v8;
      }
    }
    else
    {
      type metadata accessor for GameCenterSettings();
      sub_1AF78FE48((unint64_t *)&qword_1E9AC6290, (void (*)(uint64_t))type metadata accessor for GameCenterSettings);
      sub_1AF7ABC50();
      __break(1u);
    }
  }
}

uint64_t sub_1AF78F410@<X0>(uint64_t a1@<X8>)
{
  id v2 = objc_msgSend(self, sel_linkWithBundleIdentifier_, *MEMORY[0x1E4F83B28]);
  if (!v2
    || (uint64_t v3 = v2,
        id v4 = objc_msgSend(v2, sel_flow),
        v3,
        sub_1AF78FFCC(v4),
        !v5))
  {
    swift_bridgeObjectRelease();
  }
  sub_1AF374298();
  uint64_t v6 = sub_1AF7AC8C0();
  uint64_t v8 = v7;
  char v10 = v9;
  uint64_t v12 = v11;
  uint64_t v13 = sub_1AF7AC750();
  uint64_t result = swift_getKeyPath();
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v8;
  *(unsigned char *)(a1 + 16) = v10 & 1;
  *(void *)(a1 + 24) = v12;
  *(void *)(a1 + 32) = result;
  *(void *)(a1 + 40) = v13;
  return result;
}

uint64_t sub_1AF78F508()
{
  uint64_t v1 = (void *)sub_1AF7AE0A0();
  id v2 = (id)GKGameCenterUIFrameworkBundle();
  id v3 = (id)GKGetLocalizedStringFromTableInBundle();

  sub_1AF7AE0E0();
  id v4 = (_OWORD *)swift_allocObject();
  long long v5 = v0[1];
  v4[1] = *v0;
  v4[2] = v5;
  long long v6 = v0[3];
  v4[3] = v0[2];
  v4[4] = v6;
  sub_1AF78FDF0((uint64_t)v0);
  sub_1AF374298();
  return sub_1AF7ACFD0();
}

uint64_t sub_1AF78F610@<X0>(uint64_t a1@<X8>)
{
  id v2 = (void *)sub_1AF7AE0A0();
  id v3 = (id)GKGameCenterUIFrameworkBundle();
  id v4 = (id)GKGetLocalizedStringFromTableInBundle();

  sub_1AF7AE0E0();
  sub_1AF374298();
  uint64_t result = sub_1AF7AC8C0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = v7 & 1;
  *(void *)(a1 + 24) = v8;
  return result;
}

uint64_t sub_1AF78F6D4@<X0>(uint64_t a1@<X8>)
{
  id v2 = (void *)sub_1AF7AE0A0();
  id v3 = (id)GKGameCenterUIFrameworkBundle();
  id v4 = (id)GKGetLocalizedStringFromTableInBundle();

  sub_1AF7AE0E0();
  sub_1AF374298();
  uint64_t result = sub_1AF7AC8C0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = v7 & 1;
  *(void *)(a1 + 24) = v8;
  return result;
}

uint64_t sub_1AF78F798@<X0>(uint64_t a1@<X8>)
{
  id v2 = (void *)sub_1AF7AE0A0();
  id v3 = (id)GKGameCenterUIFrameworkBundle();
  id v4 = (id)GKGetLocalizedStringFromTableInBundle();

  sub_1AF7AE0E0();
  sub_1AF374298();
  uint64_t result = sub_1AF7AC8C0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = v7 & 1;
  *(void *)(a1 + 24) = v8;
  return result;
}

uint64_t sub_1AF78F85C(void *a1)
{
  if (*a1)
  {
    swift_retain();
    sub_1AF3DB6A4();
    return swift_release();
  }
  else
  {
    type metadata accessor for GameCenterSettings();
    sub_1AF78FE48((unint64_t *)&qword_1E9AC6290, (void (*)(uint64_t))type metadata accessor for GameCenterSettings);
    uint64_t result = sub_1AF7ABC50();
    __break(1u);
  }
  return result;
}

id sub_1AF78F900(char a1, int a2, id a3, uint64_t a4, void *a5)
{
  if (a1)
  {
    return objc_msgSend(a3, sel_presentViewController_animated_completion_, a4, 1, 0);
  }
  else if (*a5)
  {
    uint64_t v6 = self;
    swift_retain();
    id v7 = objc_msgSend(v6, sel_local);
    sub_1AF68F088();

    sub_1AF3DB6A4();
    return (id)swift_release();
  }
  else
  {
    type metadata accessor for GameCenterSettings();
    sub_1AF78FE48((unint64_t *)&qword_1E9AC6290, (void (*)(uint64_t))type metadata accessor for GameCenterSettings);
    id result = (id)sub_1AF7ABC50();
    __break(1u);
  }
  return result;
}

uint64_t sub_1AF78FA24@<X0>(uint64_t a1@<X8>)
{
  return sub_1AF78DEA0(a1);
}

uint64_t sub_1AF78FA60@<X0>(uint64_t a1@<X8>)
{
  return sub_1AF78E574(*(void *)(v1 + 16), a1);
}

unint64_t sub_1AF78FA68()
{
  unint64_t result = qword_1E9ACFD18;
  if (!qword_1E9ACFD18)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9ACFD10);
    sub_1AF78FB14();
    sub_1AF78FE48((unint64_t *)&qword_1E9AC3D28, MEMORY[0x1E4F3DF60]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9ACFD18);
  }
  return result;
}

unint64_t sub_1AF78FB14()
{
  unint64_t result = qword_1E9ACFD20;
  if (!qword_1E9ACFD20)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9ACFD28);
    sub_1AF78FBB4();
    sub_1AF3A2084(&qword_1E9AC8F00, &qword_1E9AC8F08);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9ACFD20);
  }
  return result;
}

unint64_t sub_1AF78FBB4()
{
  unint64_t result = qword_1E9ACFD30;
  if (!qword_1E9ACFD30)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9ACFD38);
    sub_1AF78FC28();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9ACFD30);
  }
  return result;
}

unint64_t sub_1AF78FC28()
{
  unint64_t result = qword_1E9ACFD40;
  if (!qword_1E9ACFD40)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9ACFD48);
    sub_1AF3A2084(qword_1E9AC5B10, &qword_1E9AC43D8);
    sub_1AF78FCC8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9ACFD40);
  }
  return result;
}

unint64_t sub_1AF78FCC8()
{
  unint64_t result = qword_1E9ACFD50;
  if (!qword_1E9ACFD50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9ACFD50);
  }
  return result;
}

uint64_t sub_1AF78FD14()
{
  return sub_1AF78F508();
}

unint64_t sub_1AF78FD38()
{
  unint64_t result = qword_1E9ACFD60;
  if (!qword_1E9ACFD60)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9ACFCF0);
    sub_1AF78FA68();
    sub_1AF3A2084(&qword_1E9ACFD58, &qword_1E9ACFCE8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9ACFD60);
  }
  return result;
}

uint64_t sub_1AF78FDE8()
{
  return sub_1AF78F85C((void *)(v0 + 16));
}

uint64_t sub_1AF78FDF0(uint64_t a1)
{
  return a1;
}

uint64_t sub_1AF78FE48(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_1AF78FE94()
{
  sub_1AF78F2F4((void *)(v0 + 16));
}

uint64_t sub_1AF78FE9C@<X0>(uint64_t a1@<X8>)
{
  return sub_1AF78F410(a1);
}

unint64_t sub_1AF78FEA4()
{
  unint64_t result = qword_1E9ACFD78;
  if (!qword_1E9ACFD78)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9ACFD70);
    sub_1AF3A2084(&qword_1E9AC3E88, &qword_1E9AC3E90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9ACFD78);
  }
  return result;
}

uint64_t sub_1AF78FF44@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1AF7ABE40();
  *a1 = result;
  return result;
}

uint64_t sub_1AF78FF70@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1AF7ABE40();
  *a1 = result;
  return result;
}

uint64_t sub_1AF78FF9C()
{
  return sub_1AF7ABE50();
}

uint64_t sub_1AF78FFCC(void *a1)
{
  id v2 = objc_msgSend(a1, sel_localizedButtonTitle);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_1AF7AE0E0();

  return v3;
}

uint64_t sub_1AF79003C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1AF3DB690();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1AF79006C()
{
  return sub_1AF3DB6A4();
}

uint64_t objectdestroyTm_31()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 80, 7);
}

void sub_1AF7900E8(unsigned __int8 *a1)
{
  sub_1AF78E978(a1, (void *)(v1 + 16));
}

uint64_t sub_1AF7900F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACFD38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1AF790158(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACFD10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1AF7901C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v7 = (void *)sub_1AF7AE0A0();
  swift_bridgeObjectRelease();
  uint64_t v8 = (void *)sub_1AF7AE0A0();
  swift_bridgeObjectRelease();
  id v9 = (id)sub_1AF7ADFC0();
  swift_bridgeObjectRelease();
  objc_msgSend(a6, sel_reportEvent_type_payload_, v7, v8, v9);
}

uint64_t sub_1AF790298()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 96, 7);
}

id sub_1AF7902F8(char a1, int a2)
{
  return sub_1AF78F900(a1, a2, *(id *)(v2 + 16), *(void *)(v2 + 24), (void *)(v2 + 32));
}

uint64_t block_copy_helper_98(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_98()
{
  return swift_release();
}

uint64_t sub_1AF79031C()
{
  return OUTLINED_FUNCTION_2_150();
}

uint64_t OUTLINED_FUNCTION_2_150()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_3_132(__n128 a1)
{
  *(__n128 *)(v1 - 128) = a1;
  return sub_1AF7ACF70();
}

uint64_t OUTLINED_FUNCTION_4_125()
{
  return sub_1AF7ACF40();
}

id sub_1AF7904B8()
{
  uint64_t v0 = self;
  id v1 = objc_msgSend(v0, sel_localPlayers);
  sub_1AF3DDA64();
  unint64_t v2 = sub_1AF7AE2B0();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_1AF7AEEF0();
    swift_bridgeObjectRelease();
    if (v6) {
      goto LABEL_3;
    }
  }
  else if (*(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_3:
    sub_1AF3E30C8(0, (v2 & 0xC000000000000001) == 0, v2);
    if ((v2 & 0xC000000000000001) != 0) {
      id v3 = (id)MEMORY[0x1B3E82BD0](0, v2);
    }
    else {
      id v3 = *(id *)(v2 + 32);
    }
    id v4 = v3;
    swift_bridgeObjectRelease();
    return v4;
  }
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v0, sel_local);

  return v7;
}

uint64_t sub_1AF7905DC()
{
  return sub_1AF791448(&qword_1E9AC26C8, &unk_1E9AEFE74);
}

uint64_t sub_1AF790600@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v34 = a3;
  uint64_t v6 = type metadata accessor for Shelf(0);
  OUTLINED_FUNCTION_1_14();
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_8_1();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACA270);
  MEMORY[0x1F4188790](v11 - 8);
  OUTLINED_FUNCTION_8_1();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = type metadata accessor for Shelf.Presentation(0);
  OUTLINED_FUNCTION_1_14();
  uint64_t v17 = MEMORY[0x1F4188790](v16);
  uint64_t v19 = (char *)&v33 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v17);
  uint64_t v21 = (char *)&v33 - v20;
  uint64_t v22 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v3 + 112))(a1, a2);
  if (v22)
  {
    uint64_t v23 = v22;
    (*(void (**)(uint64_t, uint64_t))(*(void *)v3 + 120))(a1, a2);
    if (GKIsXRUIIdiomShouldUsePadUI())
    {
      unint64_t v24 = &v21[*(int *)(v15 + 44)];
      long long v25 = *(_OWORD *)(MEMORY[0x1E4FB12A8] + 16);
      *(_OWORD *)unint64_t v24 = *MEMORY[0x1E4FB12A8];
      *((_OWORD *)v24 + 1) = v25;
      v24[32] = 0;
    }
    char v35 = v3[16];
    sub_1AF698F88();
    sub_1AF7AECC0();
    char v26 = v3[17];
    sub_1AF779658((uint64_t)v21, (uint64_t)v19);
    uint64_t v27 = sub_1AF7AD8A0();
    __swift_storeEnumTagSinglePayload(v14, 1, 1, v27);
    uint64_t v28 = v10 + *(int *)(v6 + 32);
    __swift_storeEnumTagSinglePayload(v28, 1, 1, v27);
    *(void *)(v10 + 32) = v38;
    long long v29 = v37;
    *(_OWORD *)uint64_t v10 = v36;
    *(_OWORD *)(v10 + 16) = v29;
    *(unsigned char *)(v10 + 40) = v26;
    *(void *)(v10 + 48) = v23;
    sub_1AF41394C((uint64_t)v19, v10 + *(int *)(v6 + 28), (void (*)(void))type metadata accessor for Shelf.Presentation);
    sub_1AF4728D4(v14, v28);
    uint64_t v30 = v34;
    sub_1AF41394C(v10, v34, (void (*)(void))type metadata accessor for Shelf);
    sub_1AF3647A4((uint64_t)v21);
    return __swift_storeEnumTagSinglePayload(v30, 0, 1, v6);
  }
  else
  {
    uint64_t v32 = v34;
    return __swift_storeEnumTagSinglePayload(v32, 1, 1, v6);
  }
}

uint64_t sub_1AF7908F4()
{
  sub_1AF791058(*(unsigned char *)(v0 + 16));
  sub_1AF7AE190();
  swift_bridgeObjectRelease();
  sub_1AF598804(*(unsigned char *)(v0 + 17));
  sub_1AF7AE190();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1AF790978()
{
  return sub_1AF7AF140();
}

uint64_t sub_1AF7909B0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AC36F8);
  MEMORY[0x1F4188790](v2 - 8);
  OUTLINED_FUNCTION_8_1();
  uint64_t v5 = v4 - v3;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AC3700);
  MEMORY[0x1F4188790](v6 - 8);
  OUTLINED_FUNCTION_8_1();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = type metadata accessor for HeaderData();
  __swift_storeEnumTagSinglePayload(v9, 1, 1, v10);
  uint64_t v11 = type metadata accessor for FooterData(0);
  __swift_storeEnumTagSinglePayload(v5, 1, 1, v11);
  return sub_1AF598504(v9, v5, 1, 0, 0, 0, 0, 0, a1, 0, 1, 1, 1, 0);
}

uint64_t sub_1AF790ADC(char a1)
{
  return sub_1AF46A4F8(0, a1 & 1);
}

uint64_t sub_1AF790AE8()
{
  return sub_1AF46A84C();
}

uint64_t sub_1AF790AF4()
{
  return sub_1AF46A684();
}

uint64_t sub_1AF790B00(uint64_t a1)
{
  return sub_1AF790DC0(a1, (void (*)(uint64_t))sub_1AF45EE5C);
}

uint64_t sub_1AF790B18(uint64_t a1)
{
  return sub_1AF790DC0(a1, (void (*)(uint64_t))sub_1AF45F0FC);
}

uint64_t sub_1AF790B30()
{
  return sub_1AF46AA78();
}

uint64_t sub_1AF790B3C(uint64_t a1)
{
  return sub_1AF790D60(a1, (void (*)(unsigned char *, uint64_t))sub_1AF72AF88);
}

uint64_t sub_1AF790B54()
{
  return sub_1AF46A4FC();
}

uint64_t sub_1AF790B60()
{
  return sub_1AF46A580();
}

uint64_t sub_1AF790B6C(uint64_t a1)
{
  return sub_1AF790D60(a1, (void (*)(unsigned char *, uint64_t))sub_1AF72B42C);
}

uint64_t sub_1AF790B84(uint64_t a1)
{
  return sub_1AF790D60(a1, (void (*)(unsigned char *, uint64_t))sub_1AF72B350);
}

uint64_t sub_1AF790B9C(uint64_t a1)
{
  return sub_1AF790D60(a1, (void (*)(unsigned char *, uint64_t))sub_1AF72B1C4);
}

uint64_t sub_1AF790BB8(uint64_t a1)
{
  return sub_1AF790DC0(a1, (void (*)(uint64_t))sub_1AF778F7C);
}

uint64_t sub_1AF790BD0()
{
  return sub_1AF7AF140();
}

uint64_t sub_1AF790C10(uint64_t a1)
{
  return sub_1AF790DC0(a1, (void (*)(uint64_t))sub_1AF531D98);
}

uint64_t sub_1AF790C28()
{
  return sub_1AF46A764();
}

uint64_t sub_1AF790C34()
{
  return sub_1AF7AF140();
}

uint64_t sub_1AF790C74(uint64_t a1)
{
  return sub_1AF790D60(a1, (void (*)(unsigned char *, uint64_t))sub_1AF72ACEC);
}

uint64_t sub_1AF790C8C(uint64_t a1)
{
  return sub_1AF790DC0(a1, (void (*)(uint64_t))sub_1AF5B095C);
}

uint64_t sub_1AF790CA4(uint64_t a1)
{
  return sub_1AF790DC0(a1, (void (*)(uint64_t))sub_1AF598804);
}

uint64_t sub_1AF790CBC(uint64_t a1)
{
  return sub_1AF790D60(a1, (void (*)(unsigned char *, uint64_t))sub_1AF72AAC8);
}

uint64_t sub_1AF790CD8()
{
  return sub_1AF7AF140();
}

uint64_t sub_1AF790D30(uint64_t a1)
{
  return sub_1AF790D60(a1, (void (*)(unsigned char *, uint64_t))sub_1AF72A9D8);
}

uint64_t sub_1AF790D48(uint64_t a1)
{
  return sub_1AF790D60(a1, (void (*)(unsigned char *, uint64_t))sub_1AF72A934);
}

uint64_t sub_1AF790D60(uint64_t a1, void (*a2)(unsigned char *, uint64_t))
{
  OUTLINED_FUNCTION_0_132();
  a2(v5, a1);
  return sub_1AF7AF140();
}

uint64_t sub_1AF790DA8(uint64_t a1)
{
  return sub_1AF790DC0(a1, (void (*)(uint64_t))sub_1AF787008);
}

uint64_t sub_1AF790DC0(uint64_t a1, void (*a2)(uint64_t))
{
  return sub_1AF7AF140();
}

uint64_t sub_1AF790E24()
{
  return sub_1AF7AF140();
}

uint64_t sub_1AF790E6C()
{
  return sub_1AF46ABF8();
}

uint64_t sub_1AF790E78()
{
  return sub_1AF7AF140();
}

uint64_t sub_1AF790EB8()
{
  return sub_1AF7AF140();
}

id sub_1AF790EF8()
{
  if (qword_1E9AC26A8 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_2_151();
  if (!v0) {
    return 0;
  }
  if (qword_1E9AC26B8 != -1) {
    swift_once();
  }
  if (byte_1E9AEFE72 != 1) {
    return 0;
  }
  if (qword_1E9AC26C0 != -1) {
    swift_once();
  }
  if (byte_1E9AEFE73 == 1) {
    return objc_msgSend(self, sel__gkIsOnline);
  }
  else {
    return 0;
  }
}

uint64_t sub_1AF790FE4()
{
  uint64_t result = (uint64_t)objc_msgSend(self, sel_shared);
  if (result)
  {
    id v1 = (void *)result;
    unsigned int v2 = objc_msgSend((id)result, sel_isScreenTimeRestrictionsPasscodeSet);

    if (sub_1AF790EF8()) {
      return 1;
    }
    else {
      return v2 & ~sub_1AF790EF8();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_1AF791058(char a1)
{
  unint64_t result = 0x726564616568;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6D65766569686361;
      break;
    case 2:
      unint64_t result = 0x656D616E6B63696ELL;
      break;
    case 3:
      unint64_t result = 0x73646E65697266;
      break;
    case 4:
      unint64_t result = 0x646E656972466F6ELL;
      break;
    case 5:
      unint64_t result = 0xD000000000000019;
      break;
    case 6:
      unint64_t result = 0xD000000000000017;
      break;
    case 7:
      unint64_t result = 0x4C73646E65697266;
      break;
    case 8:
      unint64_t result = 0xD000000000000015;
      break;
    case 9:
      unint64_t result = 0xD000000000000016;
      break;
    case 10:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 11:
      unint64_t result = 0xD000000000000011;
      break;
    case 12:
      unint64_t result = 0x6E65697246646461;
      break;
    case 13:
    case 22:
    case 27:
    case 28:
      unint64_t result = 0xD000000000000010;
      break;
    case 14:
      unint64_t result = 0x50656C69666F7270;
      break;
    case 15:
      unint64_t result = 0x6C5079627261656ELL;
      break;
    case 16:
      unint64_t result = 0xD000000000000012;
      break;
    case 17:
      unint64_t result = 0xD000000000000019;
      break;
    case 18:
      unint64_t result = 0xD000000000000013;
      break;
    case 19:
      unint64_t result = 0xD000000000000019;
      break;
    case 20:
      unint64_t result = 0x735574726F706572;
      break;
    case 21:
      unint64_t result = 0x724665766F6D6572;
      break;
    case 23:
      unint64_t result = 0x53656C69666F7270;
      break;
    case 24:
      unint64_t result = 0x6E496E676973;
      break;
    case 25:
      unint64_t result = 0x74754F6E676973;
      break;
    case 26:
      unint64_t result = 0xD000000000000012;
      break;
    case 29:
      unint64_t result = 0x7974697669746361;
      break;
    case 30:
      unint64_t result = 0xD000000000000011;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1AF791424()
{
  return sub_1AF791448(&qword_1E9AC26D0, byte_1E9AEFE75);
}

uint64_t sub_1AF791448(void *a1, unsigned char *a2)
{
  if (qword_1E9AC26A8 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_2_151();
  if (v4)
  {
    if (*a1 != -1) {
      swift_once();
    }
    char v5 = *a2 ^ 1;
  }
  else
  {
    char v5 = 0;
  }
  return v5 & 1;
}

uint64_t sub_1AF7914E0(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 16);
  unint64_t v5 = sub_1AF791058(*(unsigned char *)(a1 + 16));
  uint64_t v7 = v6;
  if (v5 == sub_1AF791058(v4) && v7 == v8)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v10 = sub_1AF7AEFE0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v11 = 0;
    if ((v10 & 1) == 0) {
      return v11 & 1;
    }
  }
  char v12 = *(unsigned char *)(a1 + 17);
  char v13 = *(unsigned char *)(a2 + 17);
  unint64_t v14 = sub_1AF598804(v12);
  uint64_t v16 = v15;
  if (v14 == sub_1AF598804(v13) && v16 == v17) {
    char v11 = 1;
  }
  else {
    char v11 = sub_1AF7AEFE0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11 & 1;
}

uint64_t sub_1AF7915EC()
{
  if (qword_1E9AC26A8 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_2_151();
  if (!v0) {
    return 0;
  }
  if (qword_1E9AC26B0 != -1) {
    swift_once();
  }
  return byte_1E9AEFE71;
}

uint64_t sub_1AF791678()
{
  unint64_t v0 = sub_1AF7AF010();
  swift_bridgeObjectRelease();
  if (v0 >= 0x1F) {
    return 31;
  }
  else {
    return v0;
  }
}

uint64_t sub_1AF7916CC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1AF3C2104(*a1, *a2);
}

uint64_t sub_1AF7916D8()
{
  return sub_1AF790DC0(*v0, (void (*)(uint64_t))sub_1AF791058);
}

uint64_t sub_1AF791708(uint64_t a1)
{
  return sub_1AF72AF2C(a1, *v1);
}

uint64_t sub_1AF791710(uint64_t a1)
{
  return sub_1AF46A734(a1, *v1);
}

uint64_t sub_1AF791718@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1AF791678();
  *a1 = result;
  return result;
}

unint64_t sub_1AF791748@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_1AF791058(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_1AF791774(uint64_t a1)
{
}

void sub_1AF791788(uint64_t a1)
{
}

void sub_1AF79179C(uint64_t a1)
{
}

void sub_1AF7917B0(uint64_t a1)
{
}

void sub_1AF7917C4(uint64_t a1, SEL *a2, unsigned char *a3)
{
  id v5 = objc_msgSend(self, sel_shared);
  if (v5)
  {
    uint64_t v6 = v5;
    unsigned __int8 v7 = [v5 *a2];

    *a3 = v7 ^ 1;
  }
  else
  {
    __break(1u);
  }
}

void sub_1AF791834(uint64_t a1)
{
}

void sub_1AF791848(uint64_t a1)
{
}

void sub_1AF79185C(uint64_t a1, SEL *a2, unsigned __int8 *a3)
{
  id v5 = objc_msgSend(self, sel_shared);
  if (v5)
  {
    uint64_t v6 = v5;
    unsigned __int8 v7 = [v5 *a2];

    *a3 = v7;
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1AF7918C8()
{
  type metadata accessor for HeaderProfileSection();
  uint64_t result = sub_1AF715CF4();
  qword_1E9AEFE78 = result;
  return result;
}

uint64_t sub_1AF7918FC()
{
  type metadata accessor for AchievementsProfileSection();
  uint64_t result = sub_1AF79DB0C();
  qword_1E9AEFE80 = result;
  return result;
}

uint64_t sub_1AF791930()
{
  type metadata accessor for FriendsProfileSection();
  uint64_t result = sub_1AF4B49A8();
  qword_1E9AEFE88 = result;
  return result;
}

uint64_t sub_1AF791964()
{
  type metadata accessor for FriendsListProfileSection();
  uint64_t result = sub_1AF67BD64(0);
  qword_1E9AEFE90 = result;
  return result;
}

uint64_t sub_1AF79199C()
{
  type metadata accessor for SmallLockupFriendsListProfileSection();
  uint64_t result = sub_1AF6FD8AC();
  qword_1E9AEFE98 = result;
  return result;
}

uint64_t sub_1AF7919D0()
{
  type metadata accessor for FriendSuggestionsProfileSection();
  uint64_t result = sub_1AF3A4790();
  qword_1E9AEFEA0 = result;
  return result;
}

uint64_t sub_1AF791A04()
{
  type metadata accessor for SmallFriendsRequestsProfileSection();
  uint64_t result = sub_1AF7971F8();
  qword_1E9AEFEA8 = result;
  return result;
}

uint64_t sub_1AF791A38()
{
  type metadata accessor for AddFriendsProfileSection();
  uint64_t result = sub_1AF410060();
  qword_1E9AEFEB0 = result;
  return result;
}

uint64_t sub_1AF791A6C()
{
  type metadata accessor for AchievementsLinkProfileSection();
  uint64_t result = sub_1AF7822E8();
  qword_1E9AEFEB8 = result;
  return result;
}

uint64_t sub_1AF791AA0()
{
  type metadata accessor for ProfilePrivacyProfileSection();
  uint64_t result = sub_1AF36E35C();
  qword_1E9AEFEC0 = result;
  return result;
}

uint64_t sub_1AF791AD4()
{
  type metadata accessor for NearbyPlayersProfileSection();
  uint64_t result = sub_1AF44CFE8();
  qword_1E9AEFEC8 = result;
  return result;
}

uint64_t sub_1AF791B08()
{
  type metadata accessor for PrivateProfileDescriptionProfileSection();
  uint64_t result = sub_1AF57C940();
  qword_1E9AEFED0 = result;
  return result;
}

uint64_t sub_1AF791B3C()
{
  type metadata accessor for RecentlyPlayedGamesProfileSection();
  uint64_t result = sub_1AF399658();
  qword_1E9AEFED8 = result;
  return result;
}

uint64_t sub_1AF791B70()
{
  type metadata accessor for SeeAllRecentlyPlayedGamesProfileSection();
  uint64_t result = sub_1AF5CB4E8();
  qword_1E9AEFEE0 = result;
  return result;
}

uint64_t sub_1AF791BA4()
{
  type metadata accessor for RemoveReportUserProfileSection();
  uint64_t result = sub_1AF473090();
  qword_1E9AEFEE8 = result;
  return result;
}

uint64_t sub_1AF791BD8()
{
  type metadata accessor for ProfileSettingsProfileSection();
  uint64_t result = sub_1AF57F690();
  qword_1E9AEFEF0 = result;
  return result;
}

uint64_t sub_1AF791C0C()
{
  type metadata accessor for SignInProfileSection();
  uint64_t result = sub_1AF382080();
  qword_1E9AEFEF8 = result;
  return result;
}

uint64_t sub_1AF791C40()
{
  type metadata accessor for FriendListAccessProfileSection();
  uint64_t result = sub_1AF3FDD54();
  qword_1E9AEFF00 = result;
  return result;
}

uint64_t sub_1AF791C74()
{
  type metadata accessor for DeviceRestrictedProfileSection();
  uint64_t result = sub_1AF57F380();
  qword_1E9AEFF08 = result;
  return result;
}

uint64_t sub_1AF791CA8()
{
  type metadata accessor for ActivityFeedProfileSection();
  uint64_t result = sub_1AF416724();
  qword_1E9AEFF10 = result;
  return result;
}

uint64_t sub_1AF791CDC()
{
  type metadata accessor for ActivityFeedErrorProfileSection();
  uint64_t result = sub_1AF3BB570();
  qword_1E9AEFF18 = result;
  return result;
}

uint64_t type metadata accessor for PlayerProfileSection()
{
  return self;
}

uint64_t getEnumTagSinglePayload for PlayerProfileSection.Identifier(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xE2)
  {
    if (a2 + 30 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 30) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 31;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x1F;
  int v5 = v6 - 31;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for PlayerProfileSection.Identifier(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 30 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 30) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xE2) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xE1)
  {
    unsigned int v6 = ((a2 - 226) >> 8) + 1;
    *uint64_t result = a2 + 30;
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
        JUMPOUT(0x1AF791E88);
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
          *uint64_t result = a2 + 30;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PlayerProfileSection.Identifier()
{
  return &type metadata for PlayerProfileSection.Identifier;
}

unint64_t sub_1AF791EC4()
{
  unint64_t result = qword_1E9ACFD88;
  if (!qword_1E9ACFD88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9ACFD88);
  }
  return result;
}

uint64_t sub_1AF791F10()
{
  return sub_1AF790978();
}

uint64_t sub_1AF791F34()
{
  return sub_1AF7908F4();
}

uint64_t sub_1AF791F58()
{
  return sub_1AF7AF140();
}

uint64_t sub_1AF791F98(uint64_t *a1, uint64_t *a2)
{
  return sub_1AF7914E0(*a1, *a2) & 1;
}

unint64_t sub_1AF791FC0()
{
  unint64_t result = qword_1E9ACFD90;
  if (!qword_1E9ACFD90)
  {
    type metadata accessor for PlayerProfileSection();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9ACFD90);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_132()
{
  return sub_1AF7AF0F0();
}

uint64_t sub_1AF792034(uint64_t result, double a2, double a3, double a4)
{
  if (a2 <= a3) {
    a2 = a3;
  }
  if (a2 <= a4) {
    a2 = a4;
  }
  uint64_t v4 = *(void *)(result + 16);
  if (v4)
  {
    uint64_t v5 = (double *)(result + 32);
    do
    {
      double v6 = *v5++;
      double v7 = v6;
      if (a2 <= v6) {
        a2 = v7;
      }
      --v4;
    }
    while (v4);
  }
  return result;
}

void sub_1AF792068()
{
  qword_1E9ACFD98 = 0x4014000000000000;
}

char *sub_1AF792078(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  int v7 = a1 & 1;
  uint64_t v8 = type metadata accessor for PlayerCardTheme();
  MEMORY[0x1F4188790](v8);
  char v10 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9ACA6D0);
  MEMORY[0x1F4188790](v11 - 8);
  char v13 = (char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4[OBJC_IVAR____TtC12GameCenterUI14CountBadgeView_size] = v7;
  if (a1)
  {
    uint64_t v19 = qword_1E9AC2890;
    uint64_t v20 = v4;
    if (v19 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_1AF7AA5F0();
    uint64_t v17 = v16;
    uint64_t v18 = &unk_1E9AF0238;
  }
  else
  {
    uint64_t v14 = qword_1E9AC2888;
    uint64_t v15 = v4;
    if (v14 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_1AF7AA5F0();
    uint64_t v17 = v16;
    uint64_t v18 = &unk_1E9AF0220;
  }
  uint64_t v21 = __swift_project_value_buffer(v16, (uint64_t)v18);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(v13, v21, v17);
  sub_1AF7AA5F0();
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v17);
  id v22 = objc_allocWithZone((Class)type metadata accessor for DynamicTypeLabel());
  *(void *)&v4[OBJC_IVAR____TtC12GameCenterUI14CountBadgeView_countLabel] = sub_1AF4A4968((uint64_t)v13, 0, 1, 0, 1, 0);

  uint64_t v23 = (objc_class *)type metadata accessor for CountBadgeView();
  v47.receiver = v4;
  v47.super_class = v23;
  id v24 = objc_msgSendSuper2(&v47, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v25 = qword_1E9AC2980;
  char v26 = (char *)v24;
  if (v25 != -1) {
    swift_once();
  }
  uint64_t v27 = (unsigned __int8 *)__swift_project_value_buffer(v8, (uint64_t)qword_1E9AF04C0);
  int v28 = *v27;
  if (v28 != 1)
  {
    uint64_t v32 = self;
    uint64_t v33 = v26;
    id v31 = objc_msgSend(v32, sel_redColor);
    goto LABEL_18;
  }
  sub_1AF4397C4((uint64_t)v27, (uint64_t)v10);
  long long v29 = *(void **)&v10[*(int *)(v8 + 72)];
  if (!v29)
  {
    uint64_t v34 = v26;
LABEL_16:
    id v31 = objc_msgSend(self, sel_secondaryLabelColor);
    goto LABEL_17;
  }
  uint64_t v30 = v26;
  id v31 = objc_msgSend(v29, sel_subtitleTextColor);
  if (!v31) {
    goto LABEL_16;
  }
LABEL_17:
  sub_1AF439828((uint64_t)v10);
LABEL_18:
  objc_msgSend(v26, sel_setBackgroundColor_, v31);

  uint64_t v35 = OBJC_IVAR____TtC12GameCenterUI14CountBadgeView_countLabel;
  long long v36 = *(void **)&v26[OBJC_IVAR____TtC12GameCenterUI14CountBadgeView_countLabel];
  long long v37 = self;
  id v38 = v36;
  if (v28)
  {
    id v39 = objc_msgSend(v37, sel_blackColor);
    id v40 = objc_msgSend(v39, sel_colorWithAlphaComponent_, 0.65);
  }
  else
  {
    id v40 = objc_msgSend(v37, sel_whiteColor);
  }
  objc_msgSend(v38, sel_setTextColor_, v40);

  double v41 = 12.0;
  if (!v7) {
    double v41 = 9.0;
  }
  objc_msgSend(v26, sel__setContinuousCornerRadius_, v41);
  id v42 = *(void **)&v26[v35];
  id v43 = v42;
  if (a3)
  {
    uint64_t v44 = (void *)sub_1AF7AE0A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v44 = 0;
  }
  objc_msgSend(v42, sel_setText_, v44);

  uint64_t v45 = *(void **)&v26[v35];
  objc_msgSend(v45, sel_setAdjustsFontForContentSizeCategory_, 1);
  objc_msgSend(v45, sel_setTextAlignment_, 1);
  objc_msgSend(v26, sel_addSubview_, v45);
  objc_msgSend(v26, sel_setUserInteractionEnabled_, 0);

  return v26;
}

void sub_1AF792534()
{
  v0[OBJC_IVAR____TtC12GameCenterUI14CountBadgeView_size] = 1;

  sub_1AF7AEEB0();
  __break(1u);
}

double sub_1AF7925C0()
{
  uint64_t v1 = OBJC_IVAR____TtC12GameCenterUI14CountBadgeView_size;
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC12GameCenterUI14CountBadgeView_size)) {
    double v2 = 24.0;
  }
  else {
    double v2 = 18.0;
  }
  int v3 = *(void **)(v0 + OBJC_IVAR____TtC12GameCenterUI14CountBadgeView_countLabel);
  objc_msgSend(v3, sel_intrinsicContentSize);
  double v5 = v4;
  id v6 = objc_msgSend(v3, sel_font);
  if (!v6) {
    return v2;
  }
  int v7 = v6;
  objc_msgSend(v6, sel_pointSize);
  double v9 = 12.0;
  if (*(unsigned char *)(v0 + v1)) {
    double v9 = 15.0;
  }
  double v10 = v8 / v9;
  if (qword_1E9AC2780 != -1) {
    swift_once();
  }
  double v11 = v10 * *(double *)&qword_1E9ACFD98 + v10 * *(double *)&qword_1E9ACFD98;
  double v12 = v5 + v11;
  objc_msgSend(v7, sel_capHeight);
  double v14 = v13 + v11;
  uint64_t v15 = MEMORY[0x1E4FBC860];
  sub_1AF792034(MEMORY[0x1E4FBC860], v12, v14, 24.0);
  double v17 = v16;
  sub_1AF792034(v15, v14, v2, 24.0);

  return v17;
}

id sub_1AF79275C()
{
  v31.receiver = v0;
  v31.super_class = (Class)type metadata accessor for CountBadgeView();
  objc_msgSendSuper2(&v31, sel_layoutSubviews);
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v0, sel_sizeThatFits_, v1, v2);
  double v4 = v3;
  double v6 = v5;
  double v7 = v5 * 0.5;
  objc_msgSend(v0, sel__setContinuousCornerRadius_, v5 * 0.5);
  double v8 = *(void **)&v0[OBJC_IVAR____TtC12GameCenterUI14CountBadgeView_countLabel];
  objc_msgSend(v0, sel_bounds);
  double v10 = v9;
  double v12 = v11;
  objc_msgSend(v0, sel_layoutMargins);
  double v14 = v13;
  v32.origin.x = v15;
  CGFloat v17 = v10 - v15 - v16;
  v32.size.height = v12 - v14 - v18;
  v32.origin.y = v14;
  v32.size.width = v17;
  double v19 = floor(CGRectGetMidX(v32) - v4 * 0.5);
  objc_msgSend(v0, sel_bounds);
  double v21 = v20;
  double v23 = v22;
  objc_msgSend(v0, sel_layoutMargins);
  double v25 = v24;
  v33.origin.x = v26;
  CGFloat v28 = v21 - v26 - v27;
  v33.size.height = v23 - v25 - v29;
  v33.origin.y = v25;
  v33.size.width = v28;
  return objc_msgSend(v8, sel_setFrame_, v19, CGRectGetMidY(v33) - v7, v4, v6);
}

id sub_1AF792954()
{
  id v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC12GameCenterUI14CountBadgeView_countLabel), sel_firstBaselineAnchor);

  return v1;
}

id sub_1AF7929C8()
{
  return *(id *)(v0 + OBJC_IVAR____TtC12GameCenterUI14CountBadgeView_countLabel);
}

void sub_1AF7929D8()
{
}

id sub_1AF792A18()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CountBadgeView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for CountBadgeView()
{
  return self;
}

unsigned char *storeEnumTagSinglePayload for CountBadgeView.Size(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1AF792B4CLL);
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

ValueMetadata *type metadata accessor for CountBadgeView.Size()
{
  return &type metadata for CountBadgeView.Size;
}

unint64_t sub_1AF792B88()
{
  unint64_t result = qword_1E9ACFDB0;
  if (!qword_1E9ACFDB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9ACFDB0);
  }
  return result;
}

uint64_t static GKMetricsBridge.recordInviteFriendClickEvent(type:pageType:pageId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v27 = a4;
  uint64_t v28 = a5;
  uint64_t v25 = a2;
  uint64_t v26 = a3;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9AC4560);
  OUTLINED_FUNCTION_1_6();
  uint64_t v8 = v7;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_8_1();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = sub_1AF7ADA20();
  OUTLINED_FUNCTION_1_6();
  uint64_t v15 = v14;
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_22_0();
  double v19 = (char *)(v17 - v18);
  MEMORY[0x1F4188790](v20);
  double v22 = (char *)&v25 - v21;
  if (qword_1E9AC2788 != -1) {
    swift_once();
  }
  sub_1AF7ADA10();
  sub_1AF7ADBC0();
  uint64_t v29 = sub_1AF7ADBB0();
  uint64_t v30 = MEMORY[0x1E4F71520];
  sub_1AF7AD9C0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACB5D0);
  sub_1AF7AD9A0();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v12, v6);
  swift_unknownObjectRelease();
  double v23 = *(uint64_t (**)(char *, uint64_t))(v15 + 8);
  v23(v19, v13);
  sub_1AF793BB4(a1, v25, v26, v27, v28);
  return v23(v22, v13);
}

uint64_t sub_1AF792DE4(char a1, char a2, unsigned __int8 a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v8 = a4;
  if (a4)
  {
    id v12 = objc_msgSend(self, sel_stringForOrigin_, a4);
    uint64_t v13 = sub_1AF7AE0E0();
    uint64_t v8 = v14;
  }
  else
  {
    uint64_t v13 = 0;
  }
  sub_1AF45F0FC(a1);
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  sub_1AF45EE5C(a2);
  unint64_t v21 = 0xE900000000000064;
  uint64_t v22 = 0x72616F6268736164;
  uint64_t v23 = a3;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  switch(v23)
  {
    case 1:
      unint64_t v21 = 0xE700000000000000;
      uint64_t v22 = 0x656C69666F7270;
      goto LABEL_7;
    case 2:
      unint64_t v21 = 0xEA00000000007974;
      uint64_t v22 = 0x7261506472696874;
      goto LABEL_7;
    case 3:
      goto LABEL_8;
    default:
LABEL_7:
      uint64_t v24 = v22;
      uint64_t v25 = v21;
LABEL_8:
      sub_1AF793340(v16, v18, v19, v20, v24, v25, v13, v8, a5, a6 & 1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1AF792F84(char a1, char a2, char a3, char a4, char a5)
{
  sub_1AF45F0FC(a1);
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  sub_1AF45EE5C(a2);
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  unint64_t v17 = sub_1AF7866DC(a3);
  uint64_t v19 = v18;
  unint64_t v20 = sub_1AF78687C(a4);
  uint64_t v22 = v21;
  uint64_t v23 = sub_1AF78678C(a5);
  sub_1AF795314(v10, v12, v14, v16, v17, v19, v20, v22, v23, v24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

double sub_1AF79308C()
{
  double result = *(double *)(v0 + OBJC_IVAR____TtC12GameCenterUI9GKMetrics_loadedThreshold);
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC12GameCenterUI9GKMetrics_loadedThreshold + 8)) {
    return 1.0;
  }
  return result;
}

uint64_t sub_1AF7930B4(uint64_t a1, char a2)
{
  **(unsigned char **)(*(void *)(a1 + 64) + 40) = a2;
  return swift_continuation_resume();
}

uint64_t sub_1AF7930D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned int v4 = *(void **)(*(void *)(a1 + 64) + 40);
  void *v4 = a2;
  v4[1] = a3;
  v4[2] = a4;
  return swift_continuation_resume();
}

uint64_t sub_1AF7930FC(uint64_t a1, uint64_t a2)
{
  **(void **)(*(void *)(a1 + 64) + 40) = a2;
  return swift_continuation_resume();
}

uint64_t sub_1AF79311C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3 = *(void **)(*(void *)(a1 + 64) + 40);
  void *v3 = a2;
  v3[1] = a3;
  return swift_continuation_resume();
}

uint64_t sub_1AF79313C(uint64_t a1, int a2)
{
  **(_DWORD **)(*(void *)(a1 + 64) + 40) = a2;
  return swift_continuation_resume();
}

uint64_t sub_1AF79315C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  sub_1AF795808((uint64_t)&v3, *(void *)(*(void *)(a1 + 64) + 40));
  return swift_continuation_resume();
}

uint64_t sub_1AF7931B0(char a1, char a2, char a3, char a4)
{
  sub_1AF45F0FC(a1);
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  unint64_t v11 = sub_1AF7866DC(a2);
  uint64_t v13 = v12;
  unint64_t v14 = sub_1AF78687C(a3);
  uint64_t v16 = v15;
  uint64_t v17 = sub_1AF78678C(a4);
  sub_1AF795314(v8, v10, 0, 0, v11, v13, v14, v16, v17, v18);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t static GKMetricsBridge.sharedPipeline.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_1E9AC2788 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_1E9AEFF20 + OBJC_IVAR____TtC12GameCenterUI9GKMetrics_pipeline;
  uint64_t v3 = sub_1AF7AD770();
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v2, v3);
}

uint64_t sub_1AF793340(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  uint64_t v50 = a7;
  uint64_t v53 = a6;
  uint64_t v51 = a5;
  uint64_t v52 = a1;
  uint64_t v49 = sub_1AF7ADDC0();
  OUTLINED_FUNCTION_1_6();
  uint64_t v48 = v14;
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_22_0();
  uint64_t v47 = v16 - v17;
  MEMORY[0x1F4188790](v18);
  uint64_t v46 = (char *)&v45 - v19;
  uint64_t v20 = sub_1AF7AD470();
  OUTLINED_FUNCTION_1_6();
  uint64_t v22 = v21;
  MEMORY[0x1F4188790](v23);
  OUTLINED_FUNCTION_22_0();
  uint64_t v26 = v24 - v25;
  MEMORY[0x1F4188790](v27);
  uint64_t v29 = (char *)&v45 - v28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AC7390);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1AF7CD470;
  *(void *)(inited + 32) = sub_1AF7AE0E0();
  *(void *)(inited + 40) = v31;
  uint64_t v32 = MEMORY[0x1E4FBB1A0];
  *(void *)(inited + 72) = MEMORY[0x1E4FBB1A0];
  *(void *)(inited + 48) = a3;
  *(void *)(inited + 56) = a4;
  *(void *)(inited + 80) = sub_1AF7AE0E0();
  *(void *)(inited + 88) = v33;
  *(void *)(inited + 120) = v32;
  *(void *)(inited + 96) = v52;
  *(void *)(inited + 104) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v57 = sub_1AF7AE000();
  if (a8)
  {
    uint64_t v34 = sub_1AF7AE0E0();
    uint64_t v36 = v35;
    uint64_t v56 = v32;
    uint64_t v54 = v50;
    uint64_t v55 = a8;
    swift_bridgeObjectRetain();
    sub_1AF4E1554((uint64_t)&v54, v34, v36);
  }
  uint64_t v37 = v53;
  if (v53)
  {
    uint64_t v38 = sub_1AF7AE0E0();
    uint64_t v40 = v39;
    uint64_t v56 = v32;
    uint64_t v54 = v51;
    uint64_t v55 = v37;
    swift_bridgeObjectRetain();
    sub_1AF4E1554((uint64_t)&v54, v38, v40);
  }
  sub_1AF4992AC(v57);
  swift_bridgeObjectRelease();
  if (a10)
  {
    sub_1AF7ADDA0();
    double v41 = (void (*)(uint64_t *, void))sub_1AF7AD450();
    id v42 = v46;
    sub_1AF5EC7B4();
    (*(void (**)(char *, uint64_t))(v48 + 8))(v42, v49);
    v41(&v54, 0);
  }
  (*(void (**)(uint64_t, char *, uint64_t))(v22 + 16))(v26, v29, v20);
  sub_1AF7AD760();
  swift_release();
  id v43 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
  v43(v26, v20);
  return ((uint64_t (*)(char *, uint64_t))v43)(v29, v20);
}

unint64_t GKMetricsBridge.FriendingClickMetricsType.init(rawValue:)(unint64_t result)
{
  if (result > 2) {
    return 0;
  }
  return result;
}

unint64_t sub_1AF7936F8@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = GKMetricsBridge.FriendingClickMetricsType.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t static GKMetricsBridge.recordLeaderboardPageEvent(pageId:withReferrerData:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6 = sub_1AF7ADA20();
  OUTLINED_FUNCTION_1_6();
  uint64_t v8 = v7;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_8_1();
  uint64_t v12 = v11 - v10;
  if (qword_1E9AC2788 != -1) {
    swift_once();
  }
  sub_1AF7ADA10();
  sub_1AF793340(0x6F6272656461656CLL, 0xEB00000000647261, a1, a2, 0x72616F6268736164, 0xE900000000000064, 0, 0, v12, a3 & 1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v12, v6);
}

uint64_t static GKMetricsBridge.recordChallengePageEvent(withReferrerData:)(char a1)
{
  uint64_t v2 = sub_1AF7ADA20();
  OUTLINED_FUNCTION_1_6();
  uint64_t v4 = v3;
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_8_1();
  uint64_t v8 = v7 - v6;
  if (qword_1E9AC2788 != -1) {
    swift_once();
  }
  sub_1AF7ADA10();
  sub_1AF792DE4(11, 15, 0, 0, v8, a1 & 1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v8, v2);
}

uint64_t static GKMetricsBridge.recordCustomImpressionMetrics(impressionMetrics:context:)()
{
  if (qword_1E9AC2788 != -1) {
    swift_once();
  }
  return sub_1AF793A30();
}

uint64_t sub_1AF793A30()
{
  uint64_t v0 = sub_1AF7AD470();
  OUTLINED_FUNCTION_1_6();
  uint64_t v2 = v1;
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_8_1();
  uint64_t v6 = v5 - v4;
  sub_1AF7AD890();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AC7368);
  sub_1AF7ADDC0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1AF7CB2D0;
  sub_1AF7ADD90();
  sub_1AF49A408();
  sub_1AF7AD460();
  sub_1AF7AD760();
  swift_release();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v6, v0);
}

uint64_t sub_1AF793BB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = 6579297;
  unint64_t v7 = 0xEC00000073726568;
  uint64_t v8 = 0x744F657469766E69;
  if (a1 == 1)
  {
    uint64_t v8 = 0x657469766E69;
    unint64_t v7 = 0xE600000000000000;
  }
  if (a1)
  {
    uint64_t v6 = 0x657461676976616ELL;
    uint64_t v9 = 0xE800000000000000;
  }
  else
  {
    uint64_t v9 = 0xE300000000000000;
  }
  if (a1) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = 0x657469766E69;
  }
  if (a1) {
    uint64_t v11 = v7;
  }
  else {
    uint64_t v11 = 0xE600000000000000;
  }
  if (a1) {
    uint64_t v12 = 1802398060;
  }
  else {
    uint64_t v12 = 0x6E6F74747562;
  }
  if (a1) {
    uint64_t v13 = 0xE400000000000000;
  }
  else {
    uint64_t v13 = 0xE600000000000000;
  }
  sub_1AF795314(a2, a3, a4, a5, v12, v13, v10, v11, v6, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

id GKMetricsBridge.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id GKMetricsBridge.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id GKMetricsBridge.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1AF793E00()
{
  uint64_t v0 = sub_1AF7AD950();
  MEMORY[0x1F4188790](v0 - 8);
  OUTLINED_FUNCTION_8_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AC4538);
  swift_bridgeObjectRetain();
  sub_1AF7AD930();
  return sub_1AF7ADE90();
}

uint64_t sub_1AF793EA0()
{
  id v0 = objc_msgSend(self, sel_defaultCenter);
  type metadata accessor for GKMetrics();
  swift_allocObject();
  uint64_t result = sub_1AF793FEC(v0);
  qword_1E9AEFF20 = result;
  return result;
}

unint64_t sub_1AF793F0C()
{
  unint64_t result = qword_1E9ACFDB8;
  if (!qword_1E9ACFDB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9ACFDB8);
  }
  return result;
}

uint64_t type metadata accessor for GKMetricsBridge()
{
  return self;
}

ValueMetadata *type metadata accessor for GKMetricsBridge.FriendingClickMetricsType()
{
  return &type metadata for GKMetricsBridge.FriendingClickMetricsType;
}

id sub_1AF793F8C()
{
  id v0 = objc_msgSend(self, sel_proxyForLocalPlayer);
  id v1 = objc_msgSend(v0, sel_utilityService);

  return v1;
}

uint64_t sub_1AF793FEC(void *a1)
{
  uint64_t v2 = v1;
  id v79 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AC44E0);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v78 = (uint64_t)&v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1AF7AD770();
  uint64_t v76 = *(void *)(v5 - 8);
  uint64_t v77 = v5;
  MEMORY[0x1F4188790](v5);
  uint64_t v75 = (char *)&v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = sub_1AF7ADD70();
  uint64_t v72 = *(void *)(v73 - 8);
  MEMORY[0x1F4188790](v73);
  unint64_t v71 = (char *)&v61 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = sub_1AF7ADD00();
  uint64_t v66 = *(void (**)(char *))(v81 - 8);
  MEMORY[0x1F4188790](v81);
  uint64_t v64 = (char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = sub_1AF7ADDC0();
  uint64_t v9 = *(void *)(v82 - 8);
  MEMORY[0x1F4188790](v82);
  uint64_t v11 = (char *)&v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1AF7ADC00();
  uint64_t v83 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v14 = (char *)&v61 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  id v61 = (char *)&v61 - v16;
  MEMORY[0x1F4188790](v17);
  uint64_t v63 = (char *)&v61 - v18;
  MEMORY[0x1F4188790](v19);
  uint64_t v65 = (char *)&v61 - v20;
  MEMORY[0x1F4188790](v21);
  uint64_t v69 = (char *)&v61 - v22;
  MEMORY[0x1F4188790](v23);
  uint64_t v70 = (char *)&v61 - v24;
  MEMORY[0x1F4188790](v25);
  uint64_t v74 = (char *)&v61 - v26;
  uint64_t v27 = v2 + OBJC_IVAR____TtC12GameCenterUI9GKMetrics_loadedThreshold;
  *(void *)uint64_t v27 = 0;
  *(unsigned char *)(v27 + 8) = 1;
  uint64_t v28 = OBJC_IVAR____TtC12GameCenterUI9GKMetrics_refAppFieldProvider;
  uint64_t v67 = type metadata accessor for GKRefAppFieldsProvider();
  uint64_t v29 = swift_allocObject();
  uint64_t v30 = v29 + OBJC_IVAR____TtC12GameCenterUI22GKRefAppFieldsProvider_category;
  uint64_t v31 = *MEMORY[0x1E4F71678];
  uint64_t v32 = sub_1AF7ADDE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 104))(v30, v31, v32);
  uint64_t v33 = (void *)(v29 + OBJC_IVAR____TtC12GameCenterUI22GKRefAppFieldsProvider_refApp);
  *uint64_t v33 = 0;
  v33[1] = 0;
  uint64_t v80 = v2;
  uint64_t v68 = v28;
  *(void *)(v2 + v28) = v29;
  sub_1AF7ADBF0();
  uint64_t v87 = (ValueMetadata *)sub_1AF7ADD20();
  unint64_t v88 = MEMORY[0x1E4F715C0];
  __swift_allocate_boxed_opaque_existential_1(v86);
  sub_1AF7ADD10();
  sub_1AF7ADD80();
  sub_1AF7ADBD0();
  uint64_t v34 = *(void (**)(char *, uint64_t))(v9 + 8);
  uint64_t v35 = v82;
  v34(v11, v82);
  uint64_t v36 = *(void (**)(char *, uint64_t))(v83 + 8);
  uint64_t v37 = v12;
  v36(v14, v12);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v86);
  unsigned int v62 = *MEMORY[0x1E4F71590];
  uint64_t v66 = (void (*)(char *))*((void *)v66 + 13);
  v66(v64);
  uint64_t v87 = (ValueMetadata *)sub_1AF7ADE00();
  unint64_t v88 = MEMORY[0x1E4F71690];
  __swift_allocate_boxed_opaque_existential_1(v86);
  sub_1AF7ADDF0();
  sub_1AF7ADD90();
  uint64_t v38 = v63;
  uint64_t v39 = v61;
  sub_1AF7ADBD0();
  v34(v11, v35);
  v36(v39, v37);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v86);
  uint64_t v87 = (ValueMetadata *)type metadata accessor for GKImpressionsSnapshotMetricsFieldsProvider();
  unint64_t v88 = sub_1AF7958BC(&qword_1E9ACFDF8, (void (*)(uint64_t))type metadata accessor for GKImpressionsSnapshotMetricsFieldsProvider);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v86);
  ((void (*)(uint64_t *, void, uint64_t))v66)(boxed_opaque_existential_1, v62, v81);
  sub_1AF7ADDB0();
  double v41 = v65;
  sub_1AF7ADBD0();
  uint64_t v64 = v11;
  uint64_t v81 = v9 + 8;
  uint64_t v66 = (void (*)(char *))v34;
  v34(v11, v35);
  uint64_t v42 = v37;
  id v43 = v36;
  v36(v38, v37);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v86);
  uint64_t v87 = &type metadata for GKHostAppMetricsFieldsProvider;
  unint64_t v88 = sub_1AF795870();
  if (qword_1E9AC22A8 != -1) {
    swift_once();
  }
  uint64_t v44 = v73;
  __swift_project_value_buffer(v73, (uint64_t)qword_1E9AEF7A0);
  uint64_t v45 = v69;
  sub_1AF7ADBE0();
  v43(v41, v37);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v86);
  id v46 = objc_msgSend(self, sel_mainBundle);
  uint64_t v87 = (ValueMetadata *)sub_1AF7ADB70();
  unint64_t v88 = MEMORY[0x1E4F71510];
  __swift_allocate_boxed_opaque_existential_1(v86);
  sub_1AF7ADB60();
  uint64_t v47 = v71;
  sub_1AF7ADD50();
  uint64_t v48 = v70;
  sub_1AF7ADBE0();
  (*(void (**)(char *, uint64_t))(v72 + 8))(v47, v44);
  v43(v45, v37);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v86);
  uint64_t v49 = v80;
  uint64_t v50 = *(void *)(v80 + v68);
  uint64_t v87 = (ValueMetadata *)v67;
  unint64_t v88 = sub_1AF7958BC(&qword_1E9ACFE08, (void (*)(uint64_t))type metadata accessor for GKRefAppFieldsProvider);
  v86[0] = v50;
  swift_retain();
  uint64_t v51 = v64;
  sub_1AF7ADDA0();
  uint64_t v52 = v74;
  sub_1AF7ADBD0();
  ((void (*)(char *, uint64_t))v66)(v51, v82);
  v43(v48, v37);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v86);
  sub_1AF7ADDD0();
  (*(void (**)(char *, char *, uint64_t))(v83 + 16))(v48, v52, v37);
  uint64_t v87 = &type metadata for GKMetrics.PassthroughLinter;
  unint64_t v88 = sub_1AF795904();
  uint64_t v84 = &type metadata for GameCenterMetricsEventRecorder;
  unint64_t v85 = sub_1AF795950();
  uint64_t v53 = v75;
  sub_1AF7AD750();
  (*(void (**)(uint64_t, char *, uint64_t))(v76 + 32))(v49 + OBJC_IVAR____TtC12GameCenterUI9GKMetrics_pipeline, v53, v77);
  id v54 = v79;
  objc_msgSend(v79, sel_addObserver_selector_name_object_, v49, sel_handleNotification_, *MEMORY[0x1E4F63310], 0);
  uint64_t v55 = sub_1AF7AE450();
  uint64_t v56 = v78;
  __swift_storeEnumTagSinglePayload(v78, 1, 1, v55);
  sub_1AF7AE420();
  swift_retain();
  uint64_t v57 = sub_1AF7AE410();
  uint64_t v58 = (void *)swift_allocObject();
  uint64_t v59 = MEMORY[0x1E4FBCFD8];
  v58[2] = v57;
  v58[3] = v59;
  v58[4] = v49;
  sub_1AF3B5F00(v56, (uint64_t)&unk_1E9ACFE28, (uint64_t)v58);

  swift_release();
  v43(v52, v42);
  return v49;
}

uint64_t sub_1AF794A3C()
{
  v0[2] = sub_1AF7AE420();
  v0[3] = sub_1AF7AE410();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  void *v1 = v0;
  v1[1] = sub_1AF794AE8;
  return sub_1AF794BF4();
}

uint64_t sub_1AF794AE8()
{
  OUTLINED_FUNCTION_7_11();
  OUTLINED_FUNCTION_0_19();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_6_10();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v4 = sub_1AF7AE3B0();
  return MEMORY[0x1F4188298](sub_1AF3B73E4, v4, v3);
}

uint64_t sub_1AF794BF4()
{
  v1[16] = v0;
  sub_1AF7AE420();
  v1[17] = sub_1AF7AE410();
  uint64_t v3 = sub_1AF7AE3B0();
  v1[18] = v3;
  v1[19] = v2;
  return MEMORY[0x1F4188298](sub_1AF794C8C, v3, v2);
}

uint64_t sub_1AF794C8C()
{
  OUTLINED_FUNCTION_4_15();
  uint64_t v1 = v0[16];
  uint64_t v2 = OBJC_IVAR____TtC12GameCenterUI9GKMetrics_loadedThreshold;
  v0[20] = OBJC_IVAR____TtC12GameCenterUI9GKMetrics_loadedThreshold;
  if (*(unsigned char *)(v1 + v2 + 8))
  {
    id v3 = sub_1AF793F8C();
    v0[21] = v3;
    v0[2] = v0;
    v0[7] = v0 + 15;
    v0[3] = sub_1AF794DE0;
    uint64_t v4 = swift_continuation_init();
    v0[10] = MEMORY[0x1E4F143A8];
    v0[11] = 0x40000000;
    v0[12] = sub_1AF79557C;
    v0[13] = &block_descriptor_11;
    v0[14] = v4;
    objc_msgSend(v3, sel_viewableThresholdWithCompletion_, v0 + 10);
    return MEMORY[0x1F41881E8](v0 + 2);
  }
  else
  {
    swift_release();
    OUTLINED_FUNCTION_9_8();
    return v5();
  }
}

uint64_t sub_1AF794DE0()
{
  OUTLINED_FUNCTION_7_11();
  OUTLINED_FUNCTION_0_19();
  uint64_t v1 = *(void *)(v0 + 152);
  uint64_t v2 = *(void *)(v0 + 144);
  return MEMORY[0x1F4188298](sub_1AF794EC0, v2, v1);
}

uint64_t sub_1AF794EC0()
{
  OUTLINED_FUNCTION_4_15();
  swift_release();
  uint64_t v1 = *(void **)(v0 + 120);
  if (v1)
  {
    objc_msgSend(*(id *)(v0 + 120), sel_doubleValue);
    uint64_t v3 = v2;

    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
    uint64_t v3 = 0;
  }
  uint64_t v4 = *(void *)(v0 + 128) + *(void *)(v0 + 160);
  *(void *)uint64_t v4 = v3;
  *(unsigned char *)(v4 + 8) = v1 == 0;
  OUTLINED_FUNCTION_9_8();
  return v5();
}

uint64_t sub_1AF794F7C()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AC44E0);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1AF7AE450();
  __swift_storeEnumTagSinglePayload((uint64_t)v4, 1, 1, v5);
  sub_1AF7AE420();
  swift_retain();
  uint64_t v6 = sub_1AF7AE410();
  uint64_t v7 = (void *)swift_allocObject();
  uint64_t v8 = MEMORY[0x1E4FBCFD8];
  v7[2] = v6;
  v7[3] = v8;
  v7[4] = v1;
  sub_1AF3B5F00((uint64_t)v4, (uint64_t)&unk_1E9ACFDE0, (uint64_t)v7);
  return swift_release();
}

uint64_t sub_1AF795070()
{
  v0[2] = sub_1AF7AE420();
  v0[3] = sub_1AF7AE410();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  void *v1 = v0;
  v1[1] = sub_1AF79511C;
  return sub_1AF794BF4();
}

uint64_t sub_1AF79511C()
{
  OUTLINED_FUNCTION_7_11();
  OUTLINED_FUNCTION_0_19();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_6_10();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v4 = sub_1AF7AE3B0();
  return MEMORY[0x1F4188298](sub_1AF795A90, v4, v3);
}

uint64_t sub_1AF795314(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v33 = sub_1AF7AD470();
  OUTLINED_FUNCTION_1_6();
  uint64_t v15 = v14;
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_8_1();
  uint64_t v19 = v18 - v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AC7390);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1AF7CCEC0;
  *(void *)(inited + 32) = sub_1AF7AE0E0();
  *(void *)(inited + 40) = v21;
  uint64_t v22 = MEMORY[0x1E4FBB1A0];
  *(void *)(inited + 72) = MEMORY[0x1E4FBB1A0];
  *(void *)(inited + 48) = a1;
  *(void *)(inited + 56) = a2;
  *(void *)(inited + 80) = sub_1AF7AE0E0();
  *(void *)(inited + 88) = v23;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(qword_1EB78C030);
  *(void *)(inited + 96) = a3;
  *(void *)(inited + 104) = a4;
  *(void *)(inited + 120) = v24;
  *(void *)(inited + 128) = 0x79546E6F69746361;
  *(void *)(inited + 168) = v22;
  *(void *)(inited + 136) = 0xEA00000000006570;
  *(void *)(inited + 144) = a9;
  *(void *)(inited + 152) = a10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v25 = sub_1AF7AE000();
  if (qword_1E9AC1F70 != -1) {
    swift_once();
  }
  uint64_t v26 = sub_1AF7AD440();
  uint64_t v27 = __swift_project_value_buffer(v26, (uint64_t)qword_1E9AEF0D0);
  MEMORY[0x1B3E81240](a7, a8, a5, a6, v25, v27);
  swift_bridgeObjectRelease();
  sub_1AF7AD760();
  swift_release();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8))(v19, v33);
}

uint64_t sub_1AF79557C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;

  return sub_1AF79315C(v3, (uint64_t)a2);
}

uint64_t sub_1AF7955BC()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC12GameCenterUI9GKMetrics_pipeline;
  uint64_t v2 = sub_1AF7AD770();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x1F4186488](v0, v3, v4);
}

uint64_t sub_1AF79566C()
{
  return type metadata accessor for GKMetrics();
}

uint64_t type metadata accessor for GKMetrics()
{
  uint64_t result = qword_1E9ACFDC8;
  if (!qword_1E9ACFDC8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1AF7956BC()
{
  uint64_t result = sub_1AF7AD770();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1AF795768()
{
  OUTLINED_FUNCTION_4_15();
  unint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_1AF3A21A4;
  OUTLINED_FUNCTION_3_16();
  return sub_1AF795070();
}

uint64_t sub_1AF795808(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACFDF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1AF795870()
{
  unint64_t result = qword_1E9ACFE00;
  if (!qword_1E9ACFE00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9ACFE00);
  }
  return result;
}

uint64_t sub_1AF7958BC(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1AF795904()
{
  unint64_t result = qword_1E9ACFE10;
  if (!qword_1E9ACFE10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9ACFE10);
  }
  return result;
}

unint64_t sub_1AF795950()
{
  unint64_t result = qword_1E9ACFE18;
  if (!qword_1E9ACFE18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1E9ACFE18);
  }
  return result;
}

uint64_t objectdestroyTm_32()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1AF7959E0()
{
  OUTLINED_FUNCTION_4_15();
  unint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_1AF39FC08;
  OUTLINED_FUNCTION_3_16();
  return sub_1AF794A3C();
}

ValueMetadata *type metadata accessor for GKMetrics.PassthroughLinter()
{
  return &type metadata for GKMetrics.PassthroughLinter;
}

uint64_t destroy for PlayerAvatar(uint64_t a1)
{
  swift_release();

  return swift_release();
}

void *initializeWithCopy for PlayerAvatar(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = (void *)a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_retain();
  id v5 = v4;
  swift_retain();
  return a1;
}

void *assignWithCopy for PlayerAvatar(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  id v5 = (void *)a1[3];
  uint64_t v6 = (void *)a2[3];
  a1[3] = v6;
  id v7 = v6;

  a1[4] = a2[4];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for PlayerAvatar(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for PlayerAvatar()
{
  return &type metadata for PlayerAvatar;
}

uint64_t sub_1AF795C10()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_1AF795C2C(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1AF7AB9A0();
  uint64_t v4 = v3 - 8;
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1AF7AE450();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v18 = *(_OWORD *)(v1 + 24);
  sub_1AF41C8B8((uint64_t)&v18, (uint64_t)&v20, &qword_1E9AC5088);
  sub_1AF41C8B8((uint64_t)&v18 + 8, (uint64_t)v19, &qword_1E9ACFE30);
  long long v16 = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACFE38);
  sub_1AF7ACF50();
  uint64_t v11 = v17;
  uint64_t v12 = swift_allocObject();
  long long v13 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v12 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v12 + 32) = v13;
  *(void *)(v12 + 48) = *(void *)(v1 + 32);
  swift_retain();
  sub_1AF5596EC(&v20);
  sub_1AF4433D4((uint64_t)v19);
  sub_1AF7AE430();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(&v6[*(int *)(v4 + 28)], v10, v7);
  *(void *)uint64_t v6 = &unk_1E9ACFE48;
  *((void *)v6 + 1) = v12;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACFE50);
  sub_1AF7961F8((uint64_t)v6, a1 + *(int *)(v14 + 36));
  *(void *)a1 = v11;
  *(unsigned char *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0x3FF0000000000000;
  *(_WORD *)(a1 + 24) = 0;
  id v15 = v11;
  sub_1AF79625C((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_1AF795E70(void *a1)
{
  v1[5] = a1;
  v1[6] = sub_1AF7AE420();
  v1[7] = sub_1AF7AE410();
  uint64_t v5 = (uint64_t (*)(void))(*a1 + *(int *)*a1);
  uint64_t v3 = (void *)swift_task_alloc();
  v1[8] = v3;
  void *v3 = v1;
  v3[1] = sub_1AF795F5C;
  return v5();
}

uint64_t sub_1AF795F5C()
{
  OUTLINED_FUNCTION_0_19();
  *(void *)(v1 + 72) = v0;
  swift_task_dealloc();
  uint64_t v3 = sub_1AF7AE3B0();
  return MEMORY[0x1F4188298](sub_1AF79607C, v3, v2);
}

uint64_t sub_1AF79607C()
{
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t v2 = *(void *)(v0 + 40);
  swift_release();
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v2 + 24);
  *(void *)(v0 + 32) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACFE38);
  sub_1AF7ACF60();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_1AF79611C()
{
  swift_release();

  swift_release();

  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1AF796164()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_1AF4C6148;
  return sub_1AF795E70((void *)(v0 + 16));
}

uint64_t sub_1AF7961F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1AF7AB9A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1AF79625C(uint64_t a1)
{
  uint64_t v2 = sub_1AF7AB9A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1AF7962BC()
{
  unint64_t result = qword_1E9ACFE58;
  if (!qword_1E9ACFE58)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9ACFE50);
    sub_1AF796338();
    sub_1AF4C6560();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9ACFE58);
  }
  return result;
}

unint64_t sub_1AF796338()
{
  unint64_t result = qword_1E9ACFE60;
  if (!qword_1E9ACFE60)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9ACFE68);
    sub_1AF37A29C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9ACFE60);
  }
  return result;
}

id GKSuggestedPlayerGroup.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

unint64_t GKSuggestedPlayerGroupSource.init(rawValue:)(unint64_t result)
{
  if (result > 2) {
    return 0;
  }
  return result;
}

unint64_t sub_1AF7963FC@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = GKSuggestedPlayerGroupSource.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_1AF79648C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1AF796534(uint64_t a1)
{
  OUTLINED_FUNCTION_10_12();
  void *v1 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1AF796574()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return sub_1AF796534(v0);
}

uint64_t (*sub_1AF7965A0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1AF796600()
{
  return sub_1AF796958();
}

uint64_t sub_1AF796624(uint64_t a1, uint64_t a2)
{
  return sub_1AF7969BC(a1, a2);
}

uint64_t (*sub_1AF796630())()
{
  return j_j__swift_endAccess;
}

id sub_1AF796690(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();
  if (v3)
  {
    char v4 = (void *)sub_1AF7AE0A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

uint64_t sub_1AF7966EC()
{
  return sub_1AF796958();
}

void sub_1AF796710(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  if (a3)
  {
    uint64_t v6 = sub_1AF7AE0E0();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  id v9 = a1;
  a4(v6, v8);
}

uint64_t sub_1AF796798(uint64_t a1, uint64_t a2)
{
  return sub_1AF7969BC(a1, a2);
}

uint64_t sub_1AF7967A4(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v7 = *a1;
  uint64_t v6 = a1[1];
  swift_bridgeObjectRetain();
  return a5(v7, v6);
}

uint64_t (*sub_1AF7967EC())()
{
  return j__swift_endAccess;
}

uint64_t sub_1AF796858()
{
  OUTLINED_FUNCTION_9_1();
  return *(void *)v0;
}

uint64_t sub_1AF7968B4(uint64_t a1)
{
  uint64_t result = OUTLINED_FUNCTION_10_12();
  void *v1 = a1;
  return result;
}

uint64_t (*sub_1AF7968EC())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1AF79694C()
{
  return sub_1AF796958();
}

uint64_t sub_1AF796958()
{
  OUTLINED_FUNCTION_9_1();
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1AF7969B0(uint64_t a1, uint64_t a2)
{
  return sub_1AF7969BC(a1, a2);
}

uint64_t sub_1AF7969BC(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_10_12();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1AF796A04())()
{
  return j_j__swift_endAccess;
}

BOOL sub_1AF796A74()
{
  OUTLINED_FUNCTION_9_1();
  return *v0 == 1;
}

BOOL sub_1AF796AD8()
{
  OUTLINED_FUNCTION_9_1();
  return *v0 == 2;
}

id GKSuggestedPlayerGroup.init()()
{
  *(void *)&v0[OBJC_IVAR____TtC12GameCenterUI22GKSuggestedPlayerGroup_players] = MEMORY[0x1E4FBC860];
  uint64_t v1 = &v0[OBJC_IVAR____TtC12GameCenterUI22GKSuggestedPlayerGroup_groupName];
  *(void *)uint64_t v1 = 0;
  *((void *)v1 + 1) = 0;
  uint64_t v2 = &v0[OBJC_IVAR____TtC12GameCenterUI22GKSuggestedPlayerGroup_messagesGroupIdentifier];
  *(void *)uint64_t v2 = 0;
  *((void *)v2 + 1) = 0;
  *(void *)&v0[OBJC_IVAR____TtC12GameCenterUI22GKSuggestedPlayerGroup_source] = 0;
  uint64_t v3 = &v0[OBJC_IVAR____TtC12GameCenterUI22GKSuggestedPlayerGroup_conversationIdentifier];
  char v4 = (objc_class *)type metadata accessor for GKSuggestedPlayerGroup();
  *(void *)uint64_t v3 = 0;
  *((void *)v3 + 1) = 0;
  v6.receiver = v0;
  v6.super_class = v4;
  return objc_msgSendSuper2(&v6, sel_init);
}

uint64_t type metadata accessor for GKSuggestedPlayerGroup()
{
  return self;
}

id GKSuggestedPlayerGroup.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GKSuggestedPlayerGroup();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_1AF796C20()
{
  unint64_t result = qword_1E9ACFE98;
  if (!qword_1E9ACFE98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9ACFE98);
  }
  return result;
}

uint64_t sub_1AF796C6C()
{
  OUTLINED_FUNCTION_21_7();
  uint64_t result = sub_1AF79648C();
  uint64_t *v0 = result;
  return result;
}

uint64_t sub_1AF796C98()
{
  OUTLINED_FUNCTION_21_7();
  uint64_t result = sub_1AF796600();
  uint64_t *v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_1AF796CC0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1AF7967A4(a1, a2, a3, a4, sub_1AF796624);
}

uint64_t sub_1AF796CEC()
{
  OUTLINED_FUNCTION_21_7();
  uint64_t result = sub_1AF7966EC();
  uint64_t *v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_1AF796D14(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1AF7967A4(a1, a2, a3, a4, sub_1AF796798);
}

uint64_t sub_1AF796D40()
{
  OUTLINED_FUNCTION_21_7();
  uint64_t result = sub_1AF796858();
  uint64_t *v0 = result;
  return result;
}

uint64_t sub_1AF796D68(uint64_t *a1)
{
  return sub_1AF7968B4(*a1);
}

uint64_t sub_1AF796D90()
{
  OUTLINED_FUNCTION_21_7();
  uint64_t result = sub_1AF79694C();
  uint64_t *v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_1AF796DB8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1AF7967A4(a1, a2, a3, a4, sub_1AF7969B0);
}

ValueMetadata *type metadata accessor for GKSuggestedPlayerGroupSource()
{
  return &type metadata for GKSuggestedPlayerGroupSource;
}

uint64_t method lookup function for GKSuggestedPlayerGroup(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for GKSuggestedPlayerGroup);
}

uint64_t dispatch thunk of GKSuggestedPlayerGroup.players.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of GKSuggestedPlayerGroup.players.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of GKSuggestedPlayerGroup.players.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of GKSuggestedPlayerGroup.groupName.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of GKSuggestedPlayerGroup.groupName.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of GKSuggestedPlayerGroup.groupName.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of GKSuggestedPlayerGroup.messagesGroupIdentifier.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of GKSuggestedPlayerGroup.messagesGroupIdentifier.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of GKSuggestedPlayerGroup.messagesGroupIdentifier.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of GKSuggestedPlayerGroup.source.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of GKSuggestedPlayerGroup.source.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of GKSuggestedPlayerGroup.source.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of GKSuggestedPlayerGroup.conversationIdentifier.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of GKSuggestedPlayerGroup.conversationIdentifier.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of GKSuggestedPlayerGroup.conversationIdentifier.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of GKSuggestedPlayerGroup.fromPeopleSuggester.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of GKSuggestedPlayerGroup.isNearby.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xF8))();
}

uint64_t sub_1AF7971F8()
{
  type metadata accessor for SmallFriendsRequestsProfileSection();
  uint64_t result = swift_allocObject();
  *(_WORD *)(result + 16) = 262;
  return result;
}

id sub_1AF797224(void *a1, void *a2)
{
  sub_1AF36EF54((uint64_t)a1, (uint64_t)v77);
  sub_1AF36EF54((uint64_t)v77, (uint64_t)v81);
  uint64_t v4 = sub_1AF7A98F0();
  OUTLINED_FUNCTION_1_6();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  uint64_t v68 = (char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v61 - v10;
  sub_1AF7AD5F0();
  OUTLINED_FUNCTION_1_6();
  uint64_t v66 = v13;
  uint64_t v67 = v12;
  MEMORY[0x1F4188790](v12);
  id v15 = (char *)&v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1AF7A9970();
  OUTLINED_FUNCTION_1_6();
  uint64_t v18 = v17;
  MEMORY[0x1F4188790](v19);
  uint64_t v21 = (char *)&v61 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AF36EF54((uint64_t)a1, (uint64_t)v78);
  int v22 = sub_1AF36EFBC(v78);
  id result = 0;
  if (v22 != 1)
  {
    uint64_t v65 = v11;
    memcpy(v79, v78, sizeof(v79));
    uint64_t v80 = v79[6];
    if (v79[6] >> 62)
    {
      sub_1AF39A048(a1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_1AF39A0AC);
      sub_1AF5CB980((uint64_t)&v80);
      uint64_t v24 = sub_1AF7AEEF0();
      sub_1AF372638((uint64_t)&v80);
    }
    else
    {
      uint64_t v24 = *(void *)((v79[6] & 0xFFFFFFFFFFFFFF8) + 0x10);
      sub_1AF36EF54((uint64_t)v81, (uint64_t)v75);
      sub_1AF36EFD4((uint64_t)v75);
    }
    if (v24 <= 0)
    {
      sub_1AF39A048(a1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_1AF36F0F8);
      return 0;
    }
    else
    {
      unsigned int v62 = a2;
      uint64_t v63 = v6;
      uint64_t v64 = v4;
      uint64_t v74 = MEMORY[0x1E4FBC860];
      sub_1AF3D0AB4();
      id v25 = objc_msgSend(self, sel_currentLocale);
      sub_1AF7A9920();

      uint64_t v26 = (void *)sub_1AF7A9910();
      (*(void (**)(char *, uint64_t))(v18 + 8))(v21, v16);
      id v27 = (id)JECountFormatterMakeStringFromNumber();

      if (v27)
      {
        uint64_t v28 = (void *)sub_1AF7AE0E0();
        uint64_t v30 = v29;
      }
      else
      {
        uint64_t v28 = 0;
        uint64_t v30 = 0;
      }
      id result = sub_1AF3D0AB4();
      uint64_t v31 = v24 - (void)result;
      if (__OFSUB__(v24, result))
      {
        __break(1u);
      }
      else
      {
        id v61 = v28;
        if (v31 < 1)
        {
          uint64_t v39 = (void *)OUTLINED_FUNCTION_1_163();
          id v40 = (id)GKGameCenterUIFrameworkBundle();
        }
        else
        {
          uint64_t v32 = (void *)sub_1AF7AE0A0();
          id v33 = (id)GKGameCenterUIFrameworkBundle();
          id v34 = (id)OUTLINED_FUNCTION_7_52();

          sub_1AF7AE0E0();
          uint64_t v28 = v35;

          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9ACC9B0);
          uint64_t v36 = swift_allocObject();
          *(_OWORD *)(v36 + 16) = xmmword_1AF7CD470;
          uint64_t v37 = MEMORY[0x1E4FBB550];
          uint64_t v38 = MEMORY[0x1E4FBB5C8];
          *(void *)(v36 + 56) = MEMORY[0x1E4FBB550];
          *(void *)(v36 + 64) = v38;
          *(void *)(v36 + 32) = 0;
          *(void *)(v36 + 96) = v37;
          *(void *)(v36 + 104) = v38;
          *(void *)(v36 + 72) = v31;
          sub_1AF7AE100();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        uint64_t v41 = (uint64_t)v65;
        uint64_t v42 = (void *)OUTLINED_FUNCTION_1_163();
        id v43 = (id)GKGameCenterUIFrameworkBundle();
        id v44 = (id)OUTLINED_FUNCTION_7_52();

        uint64_t v65 = (char *)sub_1AF7AE0E0();
        uint64_t v46 = v45;

        if ((uint64_t)sub_1AF3D0AB4() <= 0 && v31)
        {
          swift_bridgeObjectRelease();
          memset(v75, 0, sizeof(v75));
          char v47 = -1;
        }
        else
        {
          v75[0] = v61;
          v75[1] = v30;
          char v47 = 3;
        }
        char v76 = v47;
        uint64_t v48 = sub_1AF7AE0E0();
        uint64_t v50 = v49;
        uint64_t v51 = sub_1AF7AE0E0();
        ActionMetrics.init(domain:eventType:)(v48, v50, v51, v52);
        uint64_t v53 = swift_allocObject();
        memcpy((void *)(v53 + 16), v79, 0x90uLL);
        id v54 = v62;
        *(void *)(v53 + 160) = v62;
        uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACD3B8);
        v70[3] = v55;
        v70[4] = sub_1AF797F6C();
        boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v70);
        (*(void (**)(char *, char *, uint64_t))(v66 + 32))((char *)boxed_opaque_existential_1 + *(int *)(v55 + 40), v15, v67);
        uint64_t *boxed_opaque_existential_1 = (uint64_t)sub_1AF797F60;
        boxed_opaque_existential_1[1] = v53;
        *((unsigned char *)boxed_opaque_existential_1 + 16) = 0;
        sub_1AF39A048(a1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_1AF39A0AC);
        id v57 = v54;
        sub_1AF7A98E0();
        uint64_t v59 = v63;
        uint64_t v58 = v64;
        (*(void (**)(char *, uint64_t, uint64_t))(v63 + 16))(v68, v41, v64);
        sub_1AF79805C((unint64_t *)&qword_1E9AC2A40, MEMORY[0x1E4F27990]);
        sub_1AF7AECC0();
        (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v41, v58);
        uint64_t v72 = type metadata accessor for DetailData();
        uint64_t v73 = sub_1AF79805C(&qword_1E9AC3710, (void (*)(uint64_t))type metadata accessor for DetailData);
        uint64_t v60 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v71);
        sub_1AF6ADE90((uint64_t)&v69, 1, (uint64_t)v65, v46, 0, 0, 0, (uint64_t)v75, (uint64_t)v60, 0, 0, 0, 1u, 0, 0, (uint64_t)v70);
        sub_1AF36A288(&v71, (uint64_t)v75);
        sub_1AF44651C();
        sub_1AF39A048(a1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_1AF36F0F8);
        return (id)v74;
      }
    }
  }
  return result;
}

uint64_t sub_1AF797918(void *a1, uint64_t a2)
{
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9ACF340);
  uint64_t v28 = *(void *)(v31 - 8);
  MEMORY[0x1F4188790](v31);
  uint64_t v30 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9ACF750);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for PlayerProfileAction();
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1AF7AD5F0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AF49907C();
  id v15 = objc_msgSend(a1, sel_playerID);
  uint64_t v16 = sub_1AF7AE0E0();
  uint64_t v18 = v17;

  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(&v10[*(int *)(v8 + 24)], v14, v11);
  *(void *)uint64_t v10 = v16;
  *((void *)v10 + 1) = v18;
  v10[16] = 0;
  v10[*(int *)(v8 + 28)] = 0;
  uint64_t v19 = OBJC_IVAR____TtC12GameCenterUI13BasePresenter_objectGraph;
  uint64_t v29 = a2;
  if (*(void *)(a2 + OBJC_IVAR____TtC12GameCenterUI13BasePresenter_objectGraph))
  {
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9ACF350);
    swift_retain();
    sub_1AF7AD710();
    swift_release();
    if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v20) == 1)
    {
      sub_1AF798000((uint64_t)v10);
      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
      return sub_1AF49D950((uint64_t)v7);
    }
    else
    {
      id v27 = v7;
      v32[3] = v8;
      v32[4] = sub_1AF79805C((unint64_t *)&qword_1E9AC7340, (void (*)(uint64_t))type metadata accessor for PlayerProfileAction);
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v32);
      sub_1AF7980A4((uint64_t)v10, (uint64_t)boxed_opaque_existential_1);
      uint64_t v23 = v28;
      uint64_t v24 = v30;
      uint64_t v25 = v31;
      uint64_t result = (*(uint64_t (**)(char *, void, uint64_t))(v28 + 104))(v30, *MEMORY[0x1E4F712D0], v31);
      if (*(void *)(v29 + v19))
      {
        swift_retain();
        uint64_t v26 = v27;
        sub_1AF7AD7A0();
        swift_release();
        swift_release();
        (*(void (**)(char *, uint64_t))(v23 + 8))(v24, v25);
        sub_1AF798000((uint64_t)v10);
        (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
        return (*(uint64_t (**)(char *, uint64_t))(*(void *)(v20 - 8) + 8))(v26, v20);
      }
      else
      {
        __break(1u);
      }
    }
  }
  else
  {
    sub_1AF798000((uint64_t)v10);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  return result;
}

id sub_1AF797D70@<X0>(void *a1@<X1>, void *a2@<X8>)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  uint64_t v5 = qword_1E9AC2980;
  swift_bridgeObjectRetain();
  id v6 = a1;
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for PlayerCardTheme();
  __swift_project_value_buffer(v7, (uint64_t)qword_1E9AF04C0);
  id result = objc_msgSend(self, sel_shared);
  if (result)
  {
    uint64_t v9 = result;
    objc_msgSend(result, sel_inboxContactsOnly);

    sub_1AF5E1288((uint64_t)sub_1AF797FF8, v4, (uint64_t)__src);
    return memcpy(a2, __src, 0x68uLL);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for SmallFriendsRequestsProfileSection()
{
  return self;
}

uint64_t sub_1AF797EC8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 168, 7);
}

id sub_1AF797F60@<X0>(void *a1@<X8>)
{
  return sub_1AF797D70(*(void **)(v1 + 160), a1);
}

unint64_t sub_1AF797F6C()
{
  unint64_t result = qword_1E9ACD3C0;
  if (!qword_1E9ACD3C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9ACD3B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9ACD3C0);
  }
  return result;
}

uint64_t sub_1AF797FC0()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1AF797FF8(void *a1)
{
  return sub_1AF797918(a1, *(void *)(v1 + 16));
}

uint64_t sub_1AF798000(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PlayerProfileAction();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1AF79805C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1AF7980A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PlayerProfileAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_1_163()
{
  return sub_1AF7AE0A0();
}

id sub_1AF798138(uint64_t a1)
{
  return OUTLINED_FUNCTION_1_164(a1, (uint64_t)&unk_1E9AEFF38, MEMORY[0x1E4FB28F0]);
}

id sub_1AF79814C(uint64_t a1)
{
  return OUTLINED_FUNCTION_3_133(a1, (uint64_t)&unk_1E9AEFF50, MEMORY[0x1E4FB2950]);
}

id sub_1AF798160(uint64_t a1)
{
  return sub_1AF798A50(a1, (uint64_t)&unk_1E9AEFF68, MEMORY[0x1E4FB2990], MEMORY[0x1E4FB09B8]);
}

uint64_t sub_1AF79817C(uint64_t a1)
{
  return sub_1AF7981A4(a1, (uint64_t)&unk_1E9AEFF80, MEMORY[0x1E4FB2928]);
}

uint64_t sub_1AF798190(uint64_t a1)
{
  return sub_1AF7981A4(a1, (uint64_t)&unk_1E9AEFF98, MEMORY[0x1E4FB2988]);
}

uint64_t sub_1AF7981A4(uint64_t a1, uint64_t a2, void **a3)
{
  uint64_t v5 = sub_1AF7AA5F0();
  __swift_allocate_value_buffer(v5, (uint64_t *)a2);
  int v6 = OUTLINED_FUNCTION_7_78(v5);
  if (v6) {
    int v7 = 0;
  }
  else {
    int v7 = 2;
  }
  uint64_t v8 = (void *)*MEMORY[0x1E4FB2990];
  if (!v6) {
    uint64_t v8 = *a3;
  }
  *(void *)a2 = v8;
  *(_DWORD *)(a2 + 8) = v7;
  OUTLINED_FUNCTION_28();
  uint64_t v10 = *(uint64_t (**)(uint64_t))(v9 + 104);

  return v10(a2);
}

uint64_t sub_1AF79825C(uint64_t a1)
{
  return OUTLINED_FUNCTION_2_152(a1, qword_1E9AEFFB0, MEMORY[0x1E4FB28C8], MEMORY[0x1E4FB2950]);
}

id sub_1AF798278(uint64_t a1)
{
  return OUTLINED_FUNCTION_3_133(a1, (uint64_t)&unk_1E9AEFFC8, MEMORY[0x1E4FB28C8]);
}

id sub_1AF79828C(uint64_t a1)
{
  return sub_1AF798B70(a1, (uint64_t)&unk_1E9AEFFE0, MEMORY[0x1E4FB28C8], 1);
}

id sub_1AF7982A4(uint64_t a1)
{
  return OUTLINED_FUNCTION_1_164(a1, (uint64_t)&unk_1E9AEFFF8, MEMORY[0x1E4FB28C8]);
}

id sub_1AF7982B8(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_133(a1, (uint64_t)&unk_1E9AF0010, MEMORY[0x1E4FB28F0]);
}

id sub_1AF7982CC(uint64_t a1)
{
  return sub_1AF798A50(a1, (uint64_t)&unk_1E9AF0028, MEMORY[0x1E4FB2990], MEMORY[0x1E4FB09B8]);
}

id sub_1AF7982E8(uint64_t a1)
{
  return sub_1AF798A50(a1, (uint64_t)&unk_1E9AF0040, MEMORY[0x1E4FB2990], MEMORY[0x1E4FB09E0]);
}

id sub_1AF798304(uint64_t a1)
{
  return sub_1AF798A50(a1, (uint64_t)&unk_1E9AF0058, MEMORY[0x1E4FB28F0], MEMORY[0x1E4FB09D8]);
}

id sub_1AF798320(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_133(a1, (uint64_t)&unk_1E9AF0070, MEMORY[0x1E4FB28C8]);
}

id sub_1AF798334(uint64_t a1)
{
  return OUTLINED_FUNCTION_1_164(a1, (uint64_t)&unk_1E9AF0088, MEMORY[0x1E4FB28C8]);
}

uint64_t sub_1AF798348(uint64_t a1)
{
  return OUTLINED_FUNCTION_2_152(a1, qword_1E9AF00A0, MEMORY[0x1E4FB2998], MEMORY[0x1E4FB28F0]);
}

uint64_t sub_1AF798364(uint64_t a1)
{
  return sub_1AF798884(a1, qword_1E9AF00B8, MEMORY[0x1E4FB2998], MEMORY[0x1E4FB28F0], 2);
}

id sub_1AF798384(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_133(a1, (uint64_t)&unk_1E9AF00D0, MEMORY[0x1E4FB28F0]);
}

id sub_1AF798398(uint64_t a1)
{
  return OUTLINED_FUNCTION_1_164(a1, (uint64_t)&unk_1E9AF00E8, MEMORY[0x1E4FB28F0]);
}

id sub_1AF7983AC(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_133(a1, (uint64_t)&unk_1E9AF0100, MEMORY[0x1E4FB28C8]);
}

id sub_1AF7983C0(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_133(a1, (uint64_t)&unk_1E9AF0118, MEMORY[0x1E4FB28C8]);
}

uint64_t sub_1AF7983D4(uint64_t a1)
{
  return sub_1AF798660(a1, (uint64_t)&unk_1E9AF0130, MEMORY[0x1E4FB28D8], MEMORY[0x1E4FB09D0]);
}

uint64_t sub_1AF7983F0()
{
  uint64_t v0 = sub_1AF7AA5F0();
  __swift_allocate_value_buffer(v0, &qword_1E9AF0148);
  int v1 = OUTLINED_FUNCTION_7_78(v0);
  id v2 = (id)*MEMORY[0x1E4FB28C8];
  if (v1) {
    int v3 = 32770;
  }
  else {
    int v3 = 0x8000;
  }
  qword_1E9AF0148 = (uint64_t)v2;
  dword_1E9AF0150 = v3;
  OUTLINED_FUNCTION_28();
  uint64_t v5 = *(uint64_t (**)(uint64_t *))(v4 + 104);

  return v5(&qword_1E9AF0148);
}

uint64_t sub_1AF7984A8()
{
  uint64_t v0 = sub_1AF7AA5F0();
  __swift_allocate_value_buffer(v0, &qword_1E9AF0160);
  OUTLINED_FUNCTION_7_78(v0);
  qword_1E9AF0160 = (uint64_t)(id)*MEMORY[0x1E4FB28F0];
  dword_1E9AF0168 = 0x8000;
  OUTLINED_FUNCTION_28();
  id v2 = *(uint64_t (**)(uint64_t *))(v1 + 104);

  return v2(&qword_1E9AF0160);
}

id sub_1AF798548(uint64_t a1)
{
  return sub_1AF798A50(a1, (uint64_t)&unk_1E9AF0178, MEMORY[0x1E4FB2950], MEMORY[0x1E4FB09D0]);
}

id sub_1AF798564(uint64_t a1)
{
  return OUTLINED_FUNCTION_5_96(a1, (uint64_t)&unk_1E9AF0190, MEMORY[0x1E4FB28C8]);
}

id sub_1AF798578(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_133(a1, (uint64_t)&unk_1E9AF01A8, MEMORY[0x1E4FB2950]);
}

id sub_1AF79858C(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_133(a1, (uint64_t)&unk_1E9AF01C0, MEMORY[0x1E4FB2950]);
}

id sub_1AF7985A0(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_133(a1, (uint64_t)&unk_1E9AF01D8, MEMORY[0x1E4FB28F0]);
}

id sub_1AF7985B4(uint64_t a1)
{
  return sub_1AF798A50(a1, (uint64_t)&unk_1E9AF01F0, MEMORY[0x1E4FB28E0], MEMORY[0x1E4FB09B8]);
}

id sub_1AF7985D0(uint64_t a1)
{
  return sub_1AF798A50(a1, (uint64_t)&unk_1E9AF0208, MEMORY[0x1E4FB2950], MEMORY[0x1E4FB09E0]);
}

id sub_1AF7985EC(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_133(a1, (uint64_t)&unk_1E9AF0220, MEMORY[0x1E4FB28D8]);
}

id sub_1AF798600(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_133(a1, (uint64_t)&unk_1E9AF0238, MEMORY[0x1E4FB2950]);
}

uint64_t sub_1AF798614(uint64_t a1)
{
  return sub_1AF7987A4(a1, qword_1E9AF0250, MEMORY[0x1E4FB2988]);
}

uint64_t sub_1AF798628(uint64_t a1)
{
  return OUTLINED_FUNCTION_2_152(a1, qword_1E9AF0268, MEMORY[0x1E4FB28C8], MEMORY[0x1E4FB28F0]);
}

uint64_t sub_1AF798644(uint64_t a1)
{
  return sub_1AF798660(a1, (uint64_t)&unk_1E9AF0280, MEMORY[0x1E4FB2998], MEMORY[0x1E4FB09E0]);
}

uint64_t sub_1AF798660(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7 = OUTLINED_FUNCTION_6_82();
  __swift_allocate_value_buffer(v7, v5);
  uint64_t v8 = (void *)__swift_project_value_buffer(v7, (uint64_t)v5);
  int ShouldUsePadUI = GKIsXRUIIdiomShouldUsePadUI();
  uint64_t v10 = *v4;
  if (ShouldUsePadUI)
  {
    uint64_t v11 = *MEMORY[0x1E4FB09D8];
  }
  else
  {
    uint64_t v10 = (void *)*MEMORY[0x1E4FB28F0];
    uint64_t v11 = *a4;
  }
  *uint64_t v8 = v10;
  v8[1] = v11;
  OUTLINED_FUNCTION_28();
  uint64_t v13 = *(uint64_t (**)(void *))(v12 + 104);

  return v13(v8);
}

uint64_t sub_1AF798730(uint64_t a1)
{
  return OUTLINED_FUNCTION_2_152(a1, qword_1E9AF0298, MEMORY[0x1E4FB28C8], MEMORY[0x1E4FB28F0]);
}

id sub_1AF79874C(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_133(a1, (uint64_t)&unk_1E9AF02B0, MEMORY[0x1E4FB28C8]);
}

id sub_1AF798760(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_133(a1, (uint64_t)&unk_1E9AF02C8, MEMORY[0x1E4FB28F0]);
}

id sub_1AF798774(uint64_t a1)
{
  return sub_1AF798A50(a1, (uint64_t)&unk_1E9AF02E0, MEMORY[0x1E4FB2990], MEMORY[0x1E4FB09B8]);
}

uint64_t sub_1AF798790(uint64_t a1)
{
  return sub_1AF7987A4(a1, qword_1E9AF02F8, MEMORY[0x1E4FB2908]);
}

uint64_t sub_1AF7987A4(uint64_t a1, uint64_t *a2, void **a3)
{
  uint64_t v5 = sub_1AF7AA5F0();
  __swift_allocate_value_buffer(v5, a2);
  int v6 = OUTLINED_FUNCTION_7_78(v5);
  uint64_t v7 = *MEMORY[0x1E4FB09E0];
  uint64_t v8 = *a3;
  if (!v6) {
    uint64_t v8 = (void *)*MEMORY[0x1E4FB28C8];
  }
  *a2 = (uint64_t)v8;
  a2[1] = v7;
  OUTLINED_FUNCTION_28();
  uint64_t v10 = *(uint64_t (**)(uint64_t *))(v9 + 104);

  return v10(a2);
}

uint64_t sub_1AF798868(uint64_t a1)
{
  return OUTLINED_FUNCTION_2_152(a1, qword_1E9AF0310, MEMORY[0x1E4FB28D0], MEMORY[0x1E4FB2950]);
}

uint64_t sub_1AF798884(uint64_t a1, uint64_t *a2, id *a3, id *a4, int a5)
{
  uint64_t v9 = sub_1AF7AA5F0();
  __swift_allocate_value_buffer(v9, a2);
  uint64_t v10 = __swift_project_value_buffer(v9, (uint64_t)a2);
  if (GKIsXRUIIdiomShouldUsePadUI()) {
    uint64_t v11 = a3;
  }
  else {
    uint64_t v11 = a4;
  }
  *(void *)uint64_t v10 = *v11;
  *(_DWORD *)(v10 + 8) = a5;
  OUTLINED_FUNCTION_28();
  uint64_t v13 = *(uint64_t (**)(uint64_t))(v12 + 104);

  return v13(v10);
}

id sub_1AF798944(uint64_t a1)
{
  return sub_1AF798A50(a1, (uint64_t)&unk_1E9AF0328, MEMORY[0x1E4FB28C8], MEMORY[0x1E4FB09E0]);
}

id sub_1AF798960(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_133(a1, (uint64_t)&unk_1E9AF0340, MEMORY[0x1E4FB28F0]);
}

id sub_1AF798974(uint64_t a1)
{
  return sub_1AF798A50(a1, (uint64_t)&unk_1E9AF0358, MEMORY[0x1E4FB28F0], MEMORY[0x1E4FB09E0]);
}

id sub_1AF798990(uint64_t a1)
{
  return sub_1AF798A50(a1, (uint64_t)&unk_1E9AF0370, MEMORY[0x1E4FB2998], MEMORY[0x1E4FB09B8]);
}

id sub_1AF7989AC(uint64_t a1)
{
  return sub_1AF798A50(a1, (uint64_t)&unk_1E9AF0388, MEMORY[0x1E4FB2950], MEMORY[0x1E4FB09D8]);
}

id sub_1AF7989C8(uint64_t a1)
{
  return OUTLINED_FUNCTION_1_164(a1, (uint64_t)&unk_1E9AF03A0, MEMORY[0x1E4FB28C8]);
}

id sub_1AF7989DC(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_133(a1, (uint64_t)&unk_1E9AF03B8, MEMORY[0x1E4FB28C8]);
}

id sub_1AF7989F0(uint64_t a1)
{
  return sub_1AF798A50(a1, (uint64_t)&unk_1E9AF03D0, MEMORY[0x1E4FB28C8], MEMORY[0x1E4FB09E0]);
}

id sub_1AF798A0C(uint64_t a1)
{
  return OUTLINED_FUNCTION_3_133(a1, (uint64_t)&unk_1E9AF03E8, MEMORY[0x1E4FB2908]);
}

id sub_1AF798A20(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_133(a1, (uint64_t)&unk_1E9AF0400, MEMORY[0x1E4FB28D8]);
}

id sub_1AF798A34(uint64_t a1)
{
  return sub_1AF798A50(a1, (uint64_t)&unk_1E9AF0418, MEMORY[0x1E4FB28D8], MEMORY[0x1E4FB09D0]);
}

id sub_1AF798A50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7 = OUTLINED_FUNCTION_6_82();
  __swift_allocate_value_buffer(v7, v5);
  uint64_t v8 = (void *)__swift_project_value_buffer(v7, (uint64_t)v5);
  id v12 = *v4;
  uint64_t v9 = *a4;
  *uint64_t v8 = *v4;
  v8[1] = v9;
  OUTLINED_FUNCTION_28();
  (*(void (**)(void))(v10 + 104))();

  return v12;
}

id sub_1AF798AF8(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_133(a1, (uint64_t)&unk_1E9AF0430, MEMORY[0x1E4FB28E0]);
}

id sub_1AF798B0C(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_133(a1, (uint64_t)&unk_1E9AF0448, MEMORY[0x1E4FB28D0]);
}

id sub_1AF798B20(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_133(a1, (uint64_t)&unk_1E9AF0460, MEMORY[0x1E4FB2988]);
}

id sub_1AF798B34(uint64_t a1)
{
  return OUTLINED_FUNCTION_1_164(a1, (uint64_t)&unk_1E9AF0478, MEMORY[0x1E4FB2998]);
}

id sub_1AF798B48(uint64_t a1)
{
  return OUTLINED_FUNCTION_1_164(a1, (uint64_t)&unk_1E9AF0490, MEMORY[0x1E4FB2950]);
}

id sub_1AF798B5C(uint64_t a1)
{
  return OUTLINED_FUNCTION_5_96(a1, (uint64_t)&unk_1E9AF04A8, MEMORY[0x1E4FB2928]);
}

id sub_1AF798B70(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v7 = OUTLINED_FUNCTION_6_82();
  __swift_allocate_value_buffer(v7, v5);
  uint64_t v8 = __swift_project_value_buffer(v7, (uint64_t)v5);
  id v11 = *v4;
  *(void *)uint64_t v8 = *v4;
  *(_DWORD *)(v8 + 8) = a4;
  OUTLINED_FUNCTION_28();
  (*(void (**)(void))(v9 + 104))();

  return v11;
}

id OUTLINED_FUNCTION_0_133(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1AF798B70(a1, a2, a3, 0);
}

id OUTLINED_FUNCTION_1_164(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1AF798B70(a1, a2, a3, 2);
}

uint64_t OUTLINED_FUNCTION_2_152(uint64_t a1, uint64_t *a2, id *a3, id *a4)
{
  return sub_1AF798884(a1, a2, a3, a4, 0);
}

id OUTLINED_FUNCTION_3_133(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1AF798B70(a1, a2, a3, 0x8000);
}

id OUTLINED_FUNCTION_5_96(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1AF798B70(a1, a2, a3, 32770);
}

uint64_t OUTLINED_FUNCTION_6_82()
{
  return sub_1AF7AA5F0();
}

uint64_t OUTLINED_FUNCTION_7_78(uint64_t a1)
{
  __swift_project_value_buffer(a1, v1);
  return GKIsXRUIIdiomShouldUsePadUI();
}

ValueMetadata *type metadata accessor for LaunchGameActionImplementation()
{
  return &type metadata for LaunchGameActionImplementation;
}

id sub_1AF798C98()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v1 = (void *)sub_1AF7AE0A0();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithStringValue_, v1);

  return v2;
}

uint64_t sub_1AF798D0C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LaunchGameAction();
  uint64_t v3 = OUTLINED_FUNCTION_0_26(v2);
  uint64_t v37 = v4;
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x1F4188790](v3);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AC44E0);
  MEMORY[0x1F4188790](v7 - 8);
  OUTLINED_FUNCTION_8_1();
  uint64_t v10 = v9 - v8;
  sub_1AF7AD600();
  OUTLINED_FUNCTION_1_6();
  uint64_t v35 = v12;
  uint64_t v36 = v11;
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_8_1();
  uint64_t v34 = v14 - v13;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9ACF340);
  OUTLINED_FUNCTION_1_6();
  uint64_t v33 = v16;
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_8_1();
  uint64_t v20 = v19 - v18;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9ACF750);
  MEMORY[0x1F4188790](v21 - 8);
  OUTLINED_FUNCTION_8_1();
  uint64_t v24 = v23 - v22;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9ACF770);
  sub_1AF7AD710();
  if (!v39)
  {
    sub_1AF64C230((uint64_t)v38, &qword_1E9AC5F00);
    long long v40 = 0u;
    long long v41 = 0u;
    unint64_t v42 = 0;
    goto LABEL_8;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACA3E0);
  if ((swift_dynamicCast() & 1) == 0)
  {
    unint64_t v42 = 0;
    long long v40 = 0u;
    long long v41 = 0u;
    goto LABEL_8;
  }
  if (!*((void *)&v41 + 1))
  {
LABEL_8:
    sub_1AF64C230((uint64_t)&v40, &qword_1E9ACA3D8);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9AC7FF0);
    uint64_t v27 = sub_1AF7ADEC0();
    uint64_t v28 = sub_1AF7AE450();
    __swift_storeEnumTagSinglePayload(v10, 1, 1, v28);
    sub_1AF6DFE0C(a1, (uint64_t)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
    unint64_t v29 = (*(unsigned __int8 *)(v37 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80);
    uint64_t v30 = swift_allocObject();
    *(void *)(v30 + 16) = 0;
    *(void *)(v30 + 24) = 0;
    sub_1AF799BA8((uint64_t)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v30 + v29);
    *(void *)(v30 + ((v6 + v29 + 7) & 0xFFFFFFFFFFFFFFF8)) = v27;
    swift_retain();
    sub_1AF3B5F00(v10, (uint64_t)&unk_1E9ACFEB0, v30);
    swift_release();
    return v27;
  }
  sub_1AF64C230((uint64_t)&v40, &qword_1E9ACA3D8);
  sub_1AF4A2730();
  swift_bridgeObjectRetain();
  id v25 = sub_1AF798C98();
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9ACF350);
  sub_1AF7AD710();
  if (__swift_getEnumTagSinglePayload(v24, 1, v26) == 1)
  {
    sub_1AF64C230(v24, (uint64_t *)&unk_1E9ACF750);
  }
  else
  {
    *((void *)&v41 + 1) = &type metadata for AppStoreProductAction;
    unint64_t v42 = sub_1AF5AD56C();
    long long v40 = (unint64_t)v25;
    (*(void (**)(uint64_t, void, uint64_t))(v33 + 104))(v20, *MEMORY[0x1E4F712D0], v15);
    id v32 = v25;
    sub_1AF7AD7A0();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v20, v15);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v40);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v26 - 8) + 8))(v24, v26);
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9AC7FF0);
  (*(void (**)(uint64_t, void, uint64_t))(v35 + 104))(v34, *MEMORY[0x1E4F711E8], v36);
  uint64_t v27 = sub_1AF7ADE90();

  return v27;
}

uint64_t sub_1AF799188(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[49] = a4;
  v5[50] = a5;
  uint64_t v6 = sub_1AF7AD600();
  v5[51] = v6;
  v5[52] = *(void *)(v6 - 8);
  v5[53] = swift_task_alloc();
  uint64_t v7 = sub_1AF7A97D0();
  v5[54] = v7;
  v5[55] = *(void *)(v7 - 8);
  v5[56] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1AF7992A4, 0, 0);
}

uint64_t sub_1AF7992A4()
{
  uint64_t v1 = v0[49];
  id v2 = objc_msgSend(self, sel_mainBundle);
  sub_1AF4CBCB0(v2);
  uint64_t v3 = 0xE000000000000000;
  if (*(unsigned char *)(v1 + 48) == 2)
  {
    uint64_t v4 = 0;
  }
  else
  {
    sub_1AF7AE1C0();
    swift_bridgeObjectRelease();
    uint64_t v4 = 46;
    uint64_t v3 = 0xE100000000000000;
  }
  uint64_t v32 = v4;
  uint64_t v5 = v0[49];
  swift_bridgeObjectRetain();
  sub_1AF7AE1C0();
  swift_bridgeObjectRelease();
  uint64_t v6 = self;
  uint64_t v7 = *(void *)(v5 + 32);
  uint64_t v31 = *(void *)(v5 + 40);
  uint64_t v8 = (void *)sub_1AF7AE0A0();
  uint64_t v9 = (void *)sub_1AF7AE0A0();
  uint64_t v10 = (void *)sub_1AF7AE0A0();
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(v6, sel_URLWithAdamId_bundleId_localizedName_sourceApplication_topic_, v8, v9, 0, v10, 0);

  sub_1AF7A9780();
  uint64_t v12 = MEMORY[0x1E4FBB1A0];
  uint64_t v13 = (void *)sub_1AF7AE000();
  type metadata accessor for LaunchGameAction();
  uint64_t v14 = *(void *)(sub_1AF7AD5D0() + 16);
  swift_bridgeObjectRelease();
  if (v14)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v15 = (void *)v0[49];
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AC7390);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1AF7D4110;
    *(void *)(inited + 32) = 0x707954746E657665;
    *(void *)(inited + 40) = 0xE900000000000065;
    *(void *)(inited + 48) = 0x6B63696C63;
    *(void *)(inited + 56) = 0xE500000000000000;
    *(void *)(inited + 72) = v12;
    *(void *)(inited + 80) = 0x79546E6F69746361;
    *(void *)(inited + 88) = 0xEA00000000006570;
    *(void *)(inited + 96) = 0x657461676976616ELL;
    *(void *)(inited + 104) = 0xE800000000000000;
    *(void *)(inited + 120) = v12;
    *(void *)(inited + 128) = 0x6449746567726174;
    *(void *)(inited + 136) = 0xE800000000000000;
    *(void *)(inited + 144) = v7;
    *(void *)(inited + 152) = v31;
    *(void *)(inited + 168) = v12;
    *(void *)(inited + 176) = 0x6E6F697461636F6CLL;
    *(void *)(inited + 184) = 0xE800000000000000;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACFEC0);
    uint64_t v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_1AF7CD470;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AC6BE8);
    uint64_t v18 = swift_initStackObject();
    *(_OWORD *)(v18 + 16) = xmmword_1AF7CB2D0;
    *(void *)(v18 + 32) = 1701667182;
    *(void *)(v18 + 40) = 0xE400000000000000;
    uint64_t v19 = v15[1];
    *(void *)(v18 + 48) = *v15;
    *(void *)(v18 + 56) = v19;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    *(void *)(v17 + 32) = sub_1AF7AE000();
    uint64_t v20 = swift_initStackObject();
    *(_OWORD *)(v20 + 16) = xmmword_1AF7CB2D0;
    *(void *)(v20 + 32) = 1701667182;
    *(void *)(v20 + 40) = 0xE400000000000000;
    if (qword_1E9AC2968 != -1) {
      swift_once();
    }
    swift_beginAccess();
    uint64_t v21 = qword_1E9ACFEA0;
    swift_bridgeObjectRetain();
    uint64_t v22 = v32;
    uint64_t v23 = sub_1AF5399F0(v32, v3, v21);
    uint64_t v25 = v24;
    swift_endAccess();
    swift_bridgeObjectRelease();
    if (v25)
    {
      swift_bridgeObjectRelease();
      uint64_t v22 = v23;
      uint64_t v3 = v25;
    }
    *(void *)(v20 + 48) = v22;
    *(void *)(v20 + 56) = v3;
    *(void *)(v17 + 40) = sub_1AF7AE000();
    *(void *)(inited + 216) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACFEC8);
    *(void *)(inited + 192) = v17;
    uint64_t v13 = (void *)sub_1AF7AE000();
  }
  type metadata accessor for GameCenter();
  swift_initStaticObject();
  sub_1AF79A478(v13);
  uint64_t v27 = v26;
  v0[57] = v26;
  swift_bridgeObjectRelease();
  uint64_t v28 = (void *)swift_task_alloc();
  v0[58] = v28;
  *uint64_t v28 = v0;
  v28[1] = sub_1AF79980C;
  uint64_t v29 = v0[56];
  return sub_1AF755144(v29, v27);
}

uint64_t sub_1AF79980C()
{
  OUTLINED_FUNCTION_0_19();
  *(void *)(v1 + 472) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4188298](sub_1AF799908, 0, 0);
}

uint64_t sub_1AF799908()
{
  uint64_t v1 = (void *)v0[59];
  if (v1)
  {
    sub_1AF799D0C();
    id v2 = (void *)swift_allocError();
    id v3 = v1;
    sub_1AF7ADEA0();

    uint64_t v4 = OUTLINED_FUNCTION_5_97();
    v5(v4);
  }
  else
  {
    uint64_t v7 = v0[52];
    uint64_t v6 = v0[53];
    uint64_t v8 = v0[51];
    (*(void (**)(uint64_t, void, uint64_t))(v7 + 104))(v6, *MEMORY[0x1E4F711E8], v8);
    sub_1AF7ADEB0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    uint64_t v9 = OUTLINED_FUNCTION_5_97();
    v10(v9);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  id v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_1AF799A54()
{
  uint64_t result = sub_1AF7AE000();
  qword_1E9ACFEA0 = result;
  return result;
}

uint64_t sub_1AF799A94()
{
  uint64_t v1 = (int *)(type metadata accessor for LaunchGameAction() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = ((*(void *)(*(void *)v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = v0 + v3 + v1[10];
  sub_1AF7AD5F0();
  OUTLINED_FUNCTION_2_29();
  (*(void (**)(uint64_t))(v7 + 8))(v6);
  swift_release();

  return MEMORY[0x1F4186498](v0, v5, v4);
}

uint64_t sub_1AF799BA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LaunchGameAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1AF799C0C(uint64_t a1)
{
  uint64_t v4 = type metadata accessor for LaunchGameAction();
  OUTLINED_FUNCTION_0_26(v4);
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  unint64_t v9 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = *(void *)(v1 + 16);
  uint64_t v11 = *(void *)(v1 + 24);
  uint64_t v12 = v1 + v9;
  uint64_t v13 = *(void *)(v1 + ((*(void *)(v8 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v14;
  *uint64_t v14 = v2;
  v14[1] = sub_1AF4C6148;
  return sub_1AF799188(a1, v10, v11, v12, v13);
}

unint64_t sub_1AF799D0C()
{
  unint64_t result = qword_1E9ACFEB8;
  if (!qword_1E9ACFEB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9ACFEB8);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for LaunchGameActionImplementation.LaunchGameActionImplementationError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1AF799DF4);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for LaunchGameActionImplementation.LaunchGameActionImplementationError()
{
  return &type metadata for LaunchGameActionImplementation.LaunchGameActionImplementationError;
}

unint64_t sub_1AF799E30()
{
  unint64_t result = qword_1E9ACFED0;
  if (!qword_1E9ACFED0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9ACFED0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_5_97()
{
  return v0;
}

void sub_1AF799E90(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACFEE0);
    uint64_t v1 = OUTLINED_FUNCTION_5_98();
  }
  else
  {
    uint64_t v1 = MEMORY[0x1E4FBC868];
  }
  OUTLINED_FUNCTION_1_165();
  uint64_t v4 = v3 & v2;
  OUTLINED_FUNCTION_10_70();
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v5 = 0;
  if (!v4) {
    goto LABEL_6;
  }
LABEL_5:
  v4 &= v4 - 1;
  while (1)
  {
    uint64_t v18 = OUTLINED_FUNCTION_7_79();
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    swift_dynamicCast();
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_1AF44026C(&v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_1AF44026C(v36, v37);
    sub_1AF44026C(v37, &v33);
    sub_1AF7AEC90();
    OUTLINED_FUNCTION_3_134();
    if (v20)
    {
      OUTLINED_FUNCTION_27_11();
      while (++v23 != v24 || (v22 & 1) == 0)
      {
        BOOL v25 = v23 == v24;
        if (v23 == v24) {
          uint64_t v23 = 0;
        }
        v22 |= v25;
        if (*(void *)(v1 + 64 + 8 * v23) != -1)
        {
          OUTLINED_FUNCTION_47_4();
          goto LABEL_36;
        }
      }
      __break(1u);
LABEL_40:
      __break(1u);
      goto LABEL_41;
    }
    OUTLINED_FUNCTION_31_11();
LABEL_36:
    OUTLINED_FUNCTION_0_134(v21);
    *(_OWORD *)uint64_t v26 = v29;
    *(_OWORD *)(v26 + 16) = v30;
    *(void *)(v26 + 32) = v31;
    sub_1AF44026C(&v33, (_OWORD *)(*(void *)(v1 + 56) + 32 * v27));
    ++*(void *)(v1 + 16);
    if (v4) {
      goto LABEL_5;
    }
LABEL_6:
    if (__OFADD__(v5, 1)) {
      goto LABEL_40;
    }
    OUTLINED_FUNCTION_15_60();
    if (v7 == v8) {
      goto LABEL_38;
    }
    if (!*(void *)(v28 + 8 * v6))
    {
      OUTLINED_FUNCTION_2_153();
      if (v7 == v8) {
        goto LABEL_38;
      }
      OUTLINED_FUNCTION_4_126();
      if (!v9)
      {
        OUTLINED_FUNCTION_2_153();
        if (v7 == v8) {
          goto LABEL_38;
        }
        OUTLINED_FUNCTION_4_126();
        if (!v10)
        {
          OUTLINED_FUNCTION_2_153();
          if (v7 == v8) {
            goto LABEL_38;
          }
          OUTLINED_FUNCTION_4_126();
          if (!v11)
          {
            OUTLINED_FUNCTION_15_60();
            if (v7 == v8)
            {
LABEL_38:
              swift_release();
              OUTLINED_FUNCTION_8_86();
              return;
            }
            if (!*(void *)(v28 + 8 * v12)) {
              break;
            }
          }
        }
      }
    }
LABEL_26:
    OUTLINED_FUNCTION_6_83();
    uint64_t v4 = v16 & v15;
    uint64_t v5 = v17;
  }
  while (!__OFADD__(v12, 1))
  {
    OUTLINED_FUNCTION_2_153();
    if (v7 == v8) {
      goto LABEL_38;
    }
    uint64_t v12 = v14 + 1;
    if (*(void *)(v28 + 8 * v13)) {
      goto LABEL_26;
    }
  }
LABEL_41:
  __break(1u);
}

void sub_1AF79A158(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AC7398);
    uint64_t v2 = (void *)OUTLINED_FUNCTION_5_98();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
  }
  uint64_t v40 = v1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  uint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v39 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = &v45;
  char v7 = &v47;
  swift_bridgeObjectRetain();
  uint64_t v8 = 0;
  uint64_t v9 = MEMORY[0x1E4FBC840] + 8;
  uint64_t v10 = MEMORY[0x1E4FBB1A0];
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        uint64_t v42 = (v5 - 1) & v5;
      }
      else
      {
        int64_t v11 = v8 + 1;
        if (__OFADD__(v8, 1)) {
          goto LABEL_37;
        }
        if (v11 >= v39)
        {
LABEL_34:
          sub_1AF3E5FE0();
          return;
        }
        if (!*(void *)(v40 + 8 * v11))
        {
          OUTLINED_FUNCTION_14_52();
          if (v12 == v13) {
            goto LABEL_34;
          }
          OUTLINED_FUNCTION_13_60();
          if (!v14)
          {
            OUTLINED_FUNCTION_14_52();
            if (v12 == v13) {
              goto LABEL_34;
            }
            OUTLINED_FUNCTION_13_60();
            if (!v15)
            {
              OUTLINED_FUNCTION_14_52();
              if (v12 == v13) {
                goto LABEL_34;
              }
              OUTLINED_FUNCTION_13_60();
              if (!v17)
              {
                int64_t v18 = v16 + 4;
                if (v18 >= v39) {
                  goto LABEL_34;
                }
                if (!*(void *)(v40 + 8 * v18))
                {
                  while (!__OFADD__(v18, 1))
                  {
                    OUTLINED_FUNCTION_14_52();
                    if (v12 == v13) {
                      goto LABEL_34;
                    }
                    OUTLINED_FUNCTION_13_60();
                    int64_t v18 = v19 + 1;
                    if (v20) {
                      goto LABEL_28;
                    }
                  }
                  goto LABEL_38;
                }
              }
            }
          }
        }
LABEL_28:
        OUTLINED_FUNCTION_6_83();
        uint64_t v42 = v22 & v21;
        uint64_t v8 = v23;
      }
      uint64_t v24 = OUTLINED_FUNCTION_7_79();
      uint64_t v43 = v25;
      uint64_t v44 = v24;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_dynamicCast();
      sub_1AF44026C(v6, v7);
      sub_1AF44026C(v7, v48);
      sub_1AF44026C(v48, &v46);
      unint64_t v26 = sub_1AF6B97F0(v43, v44);
      unint64_t v27 = v26;
      if ((v28 & 1) == 0) {
        break;
      }
      uint64_t v41 = v8;
      long long v29 = v7;
      long long v30 = v6;
      uint64_t v31 = v1;
      uint64_t v32 = v10;
      uint64_t v33 = v9;
      long long v34 = (uint64_t *)(v2[6] + 16 * v26);
      swift_bridgeObjectRelease();
      *long long v34 = v43;
      v34[1] = v44;
      uint64_t v9 = v33;
      uint64_t v10 = v32;
      uint64_t v1 = v31;
      uint64_t v6 = v30;
      char v7 = v29;
      uint64_t v8 = v41;
      uint64_t v35 = (_OWORD *)(v2[7] + 32 * v27);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
      sub_1AF44026C(&v46, v35);
      uint64_t v5 = v42;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((v26 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v26;
    uint64_t v36 = (uint64_t *)(v2[6] + 16 * v26);
    *uint64_t v36 = v43;
    v36[1] = v44;
    sub_1AF44026C(&v46, (_OWORD *)(v2[7] + 32 * v26));
    uint64_t v37 = v2[2];
    BOOL v13 = __OFADD__(v37, 1);
    uint64_t v38 = v37 + 1;
    if (v13) {
      goto LABEL_36;
    }
    v2[2] = v38;
    uint64_t v5 = v42;
  }
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
}

void sub_1AF79A478(void *a1)
{
  if (a1[2])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACFEE0);
    uint64_t v2 = OUTLINED_FUNCTION_5_98();
  }
  else
  {
    uint64_t v2 = MEMORY[0x1E4FBC868];
  }
  OUTLINED_FUNCTION_1_165();
  unint64_t v5 = v4 & v3;
  OUTLINED_FUNCTION_10_70();
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v6 = 0;
  if (!v5) {
    goto LABEL_6;
  }
LABEL_5:
  unint64_t v7 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  unint64_t v8 = v7 | (v6 << 6);
  while (1)
  {
    uint64_t v22 = (uint64_t *)(a1[6] + 16 * v8);
    uint64_t v24 = *v22;
    uint64_t v23 = v22[1];
    sub_1AF3F17CC(a1[7] + 32 * v8, (uint64_t)v45);
    *(void *)&long long v44 = v24;
    *((void *)&v44 + 1) = v23;
    v42[2] = v44;
    v43[0] = v45[0];
    v43[1] = v45[1];
    *(void *)&v42[0] = v24;
    *((void *)&v42[0] + 1) = v23;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_1AF44026C(v43, v37);
    long long v38 = v34;
    long long v39 = v35;
    uint64_t v40 = v36;
    sub_1AF44026C(v37, v41);
    long long v34 = v38;
    long long v35 = v39;
    uint64_t v36 = v40;
    sub_1AF44026C(v41, v42);
    sub_1AF44026C(v42, &v38);
    sub_1AF7AEC90();
    OUTLINED_FUNCTION_3_134();
    if (v25)
    {
      OUTLINED_FUNCTION_27_11();
      while (++v28 != v29 || (v27 & 1) == 0)
      {
        BOOL v30 = v28 == v29;
        if (v28 == v29) {
          uint64_t v28 = 0;
        }
        v27 |= v30;
        if (*(void *)(v2 + 64 + 8 * v28) != -1)
        {
          OUTLINED_FUNCTION_47_4();
          goto LABEL_36;
        }
      }
      __break(1u);
LABEL_40:
      __break(1u);
      goto LABEL_41;
    }
    OUTLINED_FUNCTION_31_11();
LABEL_36:
    OUTLINED_FUNCTION_0_134(v26);
    *(_OWORD *)uint64_t v31 = v34;
    *(_OWORD *)(v31 + 16) = v35;
    *(void *)(v31 + 32) = v36;
    sub_1AF44026C(&v38, (_OWORD *)(*(void *)(v2 + 56) + 32 * v32));
    ++*(void *)(v2 + 16);
    if (v5) {
      goto LABEL_5;
    }
LABEL_6:
    if (__OFADD__(v6, 1)) {
      goto LABEL_40;
    }
    OUTLINED_FUNCTION_15_60();
    if (v10 == v11) {
      goto LABEL_38;
    }
    if (!*(void *)(v33 + 8 * v9))
    {
      OUTLINED_FUNCTION_2_153();
      if (v10 == v11) {
        goto LABEL_38;
      }
      OUTLINED_FUNCTION_4_126();
      if (!v12)
      {
        OUTLINED_FUNCTION_2_153();
        if (v10 == v11) {
          goto LABEL_38;
        }
        OUTLINED_FUNCTION_4_126();
        if (!v13)
        {
          OUTLINED_FUNCTION_2_153();
          if (v10 == v11) {
            goto LABEL_38;
          }
          OUTLINED_FUNCTION_4_126();
          if (!v14)
          {
            OUTLINED_FUNCTION_15_60();
            if (v10 == v11)
            {
LABEL_38:
              swift_release();
              OUTLINED_FUNCTION_8_86();
              return;
            }
            if (!*(void *)(v33 + 8 * v15)) {
              break;
            }
          }
        }
      }
    }
LABEL_26:
    OUTLINED_FUNCTION_6_83();
    unint64_t v5 = v19 & v18;
    unint64_t v8 = v21 + (v20 << 6);
    uint64_t v6 = v20;
  }
  while (!__OFADD__(v15, 1))
  {
    OUTLINED_FUNCTION_2_153();
    if (v10 == v11) {
      goto LABEL_38;
    }
    uint64_t v15 = v17 + 1;
    if (*(void *)(v33 + 8 * v16)) {
      goto LABEL_26;
    }
  }
LABEL_41:
  __break(1u);
}

void GameCenterMetricsEventRecorder.record(_:on:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    sub_1AF7AE0E0();
  }
  uint64_t v3 = self;
  swift_bridgeObjectRetain();
  id v4 = objc_msgSend(v3, sel_daemonProxy);
  id v5 = objc_msgSend(v4, sel_utilityService);

  uint64_t v6 = (void *)sub_1AF7AE0A0();
  swift_bridgeObjectRelease();
  sub_1AF37BB7C();
  unint64_t v7 = (void *)sub_1AF7AE990();
  unint64_t v8 = (void *)sub_1AF7AD940();
  sub_1AF79A478(v8);
  swift_bridgeObjectRelease();
  id v9 = (id)sub_1AF7ADFC0();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_reportMetricsEventWithTopic_shouldFlush_metricsFields_, v6, v7, v9);
  swift_unknownObjectRelease();
}

uint64_t GameCenterMetricsEventRecorder.flush()()
{
  return sub_1AF7ADE90();
}

void sub_1AF79A90C(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_1AF79A928()
{
  return GameCenterMetricsEventRecorder.flush()();
}

ValueMetadata *type metadata accessor for GameCenterMetricsEventRecorder()
{
  return &type metadata for GameCenterMetricsEventRecorder;
}

void OUTLINED_FUNCTION_0_134(unint64_t a1@<X8>)
{
  *(void *)(v1 + ((a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << a1;
}

uint64_t OUTLINED_FUNCTION_5_98()
{
  return sub_1AF7AEF20();
}

uint64_t OUTLINED_FUNCTION_7_79()
{
  return *(void *)(*(void *)(v1 + 48) + 16 * v0 + 8);
}

uint64_t OUTLINED_FUNCTION_8_86()
{
  sub_1AF3E5FE0();
  return v0;
}

unsigned char *sub_1AF79AA88(unsigned char *a1, uint64_t *a2, int *a3)
{
  id v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v73 = *a2;
    *(void *)id v4 = *a2;
    id v4 = (unsigned char *)(v73 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *(unsigned char *)a2;
    unint64_t v7 = (void *)a2[1];
    unint64_t v8 = (void *)a2[2];
    uint64_t v9 = a2[3];
    uint64_t v10 = a2[4];
    uint64_t v11 = a2[5];
    uint64_t v12 = a2[6];
    char v13 = *((unsigned char *)a2 + 56);
    sub_1AF3C6300(v7, v8, v9, v10, v11, v12, v13);
    *((void *)v4 + 1) = v7;
    *((void *)v4 + 2) = v8;
    *((void *)v4 + 3) = v9;
    *((void *)v4 + 4) = v10;
    *((void *)v4 + 5) = v11;
    *((void *)v4 + 6) = v12;
    v4[56] = v13;
    uint64_t v14 = (void *)a2[8];
    *((void *)v4 + 8) = v14;
    uint64_t v15 = a3[7];
    uint64_t v16 = &v4[v15];
    uint64_t v17 = (uint64_t)a2 + v15;
    uint64_t v77 = sub_1AF7AA5F0();
    uint64_t v78 = *(void (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v77 - 8) + 16);
    id v18 = v14;
    v78(v16, v17, v77);
    v78(&v4[a3[8]], (uint64_t)a2 + a3[8], v77);
    uint64_t v19 = a3[9];
    uint64_t v20 = a3[10];
    uint64_t v21 = *(void **)((char *)a2 + v19);
    *(void *)&v4[v19] = v21;
    uint64_t v22 = *(void **)((char *)a2 + v20);
    *(void *)&v4[v20] = v22;
    uint64_t v23 = a3[11];
    uint64_t v24 = a3[12];
    char v25 = *(void **)((char *)a2 + v23);
    *(void *)&v4[v23] = v25;
    unint64_t v26 = &v4[v24];
    uint64_t v27 = *(uint64_t *)((char *)a2 + v24 + 16);
    uint64_t v75 = *(void **)((char *)a2 + v24 + 8);
    char v76 = *(void **)((char *)a2 + v24);
    uint64_t v28 = *(uint64_t *)((char *)a2 + v24 + 24);
    uint64_t v29 = *(uint64_t *)((char *)a2 + v24 + 32);
    BOOL v30 = a3;
    uint64_t v31 = *(uint64_t *)((char *)a2 + v24 + 40);
    char v80 = *((unsigned char *)a2 + v24 + 48);
    id v32 = v21;
    id v33 = v22;
    id v34 = v25;
    sub_1AF3C6300(v76, v75, v27, v28, v29, v31, v80);
    *(void *)unint64_t v26 = v76;
    *((void *)v26 + 1) = v75;
    *((void *)v26 + 2) = v27;
    *((void *)v26 + 3) = v28;
    *((void *)v26 + 4) = v29;
    *((void *)v26 + 5) = v31;
    v26[48] = v80;
    id v79 = v30;
    uint64_t v35 = v30[13];
    uint64_t v36 = v30[14];
    uint64_t v37 = *(void **)((char *)a2 + v35);
    *(void *)&v4[v35] = v37;
    long long v38 = &v4[v36];
    long long v39 = (uint64_t *)((char *)a2 + v36);
    uint64_t v40 = v39[1];
    *long long v38 = *v39;
    v38[1] = v40;
    uint64_t v41 = v30[15];
    uint64_t v42 = &v4[v41];
    uint64_t v43 = (uint64_t)a2 + v41;
    long long v44 = *(void **)v43;
    uint64_t v45 = *(void **)(v43 + 8);
    uint64_t v46 = *(void *)(v43 + 16);
    uint64_t v47 = *(void *)(v43 + 24);
    uint64_t v49 = *(void *)(v43 + 32);
    uint64_t v48 = *(void *)(v43 + 40);
    char v81 = *(unsigned char *)(v43 + 48);
    id v50 = v37;
    swift_bridgeObjectRetain();
    sub_1AF3C6300(v44, v45, v46, v47, v49, v48, v81);
    *(void *)uint64_t v42 = v44;
    *((void *)v42 + 1) = v45;
    *((void *)v42 + 2) = v46;
    *((void *)v42 + 3) = v47;
    *((void *)v42 + 4) = v49;
    *((void *)v42 + 5) = v48;
    uint64_t v51 = v79[16];
    uint64_t v52 = v79[17];
    uint64_t v53 = *(void **)((char *)a2 + v51);
    v42[48] = v81;
    *(void *)&v4[v51] = v53;
    id v54 = &v4[v52];
    uint64_t v55 = (uint64_t)a2 + v52;
    id v57 = *(void **)((char *)a2 + v52);
    uint64_t v56 = *(void **)((char *)a2 + v52 + 8);
    uint64_t v59 = *(uint64_t *)((char *)a2 + v52 + 16);
    uint64_t v58 = *(uint64_t *)((char *)a2 + v52 + 24);
    uint64_t v60 = *(uint64_t *)((char *)a2 + v52 + 32);
    uint64_t v61 = *(uint64_t *)((char *)a2 + v52 + 40);
    char v82 = *((unsigned char *)a2 + v52 + 48);
    id v62 = v53;
    sub_1AF3C6300(v57, v56, v59, v58, v60, v61, v82);
    *(void *)id v54 = v57;
    *((void *)v54 + 1) = v56;
    *((void *)v54 + 2) = v59;
    *((void *)v54 + 3) = v58;
    *((void *)v54 + 4) = v60;
    *((void *)v54 + 5) = v61;
    v54[48] = v82;
    *((void *)v54 + 7) = *(void *)(v55 + 56);
    long long v63 = *(_OWORD *)(v55 + 80);
    *((_OWORD *)v54 + 4) = *(_OWORD *)(v55 + 64);
    *((_OWORD *)v54 + 5) = v63;
    v54[96] = *(unsigned char *)(v55 + 96);
    v54[136] = *(unsigned char *)(v55 + 136);
    *(_OWORD *)(v54 + 120) = *(_OWORD *)(v55 + 120);
    *(_OWORD *)(v54 + 104) = *(_OWORD *)(v55 + 104);
    uint64_t v65 = v79[19];
    uint64_t v64 = v79[20];
    uint64_t v66 = &v4[v64];
    uint64_t v67 = (uint64_t)a2 + v64;
    uint64_t v68 = v79[18];
    uint64_t v69 = *(void **)((char *)a2 + v68);
    *(void *)&v4[v68] = v69;
    *(_OWORD *)&v4[v65] = *(_OWORD *)((char *)a2 + v65);
    id v70 = v69;
    v78(v66, v67, v77);
    v78(&v4[v79[21]], (uint64_t)a2 + v79[21], v77);
    uint64_t v71 = v79[23];
    *(void *)&v4[v79[22]] = *(uint64_t *)((char *)a2 + v79[22]);
    *(void *)&v4[v71] = *(uint64_t *)((char *)a2 + v71);
    uint64_t v72 = v79[25];
    *(void *)&v4[v79[24]] = *(uint64_t *)((char *)a2 + v79[24]);
    *(void *)&v4[v72] = *(uint64_t *)((char *)a2 + v72);
  }
  return v4;
}

uint64_t sub_1AF79AE28(uint64_t a1, int *a2)
{
  sub_1AF3DB200(*(void **)(a1 + 8), *(void **)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned char *)(a1 + 56));

  uint64_t v4 = a1 + a2[7];
  uint64_t v5 = sub_1AF7AA5F0();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v11)((void *)(v5 - 8), v4, v5);
  v11(a1 + a2[8], v5);

  uint64_t v6 = a1 + a2[12];
  sub_1AF3DB200(*(void **)v6, *(void **)(v6 + 8), *(void *)(v6 + 16), *(void *)(v6 + 24), *(void *)(v6 + 32), *(void *)(v6 + 40), *(unsigned char *)(v6 + 48));

  swift_bridgeObjectRelease();
  uint64_t v7 = a1 + a2[15];
  sub_1AF3DB200(*(void **)v7, *(void **)(v7 + 8), *(void *)(v7 + 16), *(void *)(v7 + 24), *(void *)(v7 + 32), *(void *)(v7 + 40), *(unsigned char *)(v7 + 48));

  uint64_t v8 = a1 + a2[17];
  sub_1AF3DB200(*(void **)v8, *(void **)(v8 + 8), *(void *)(v8 + 16), *(void *)(v8 + 24), *(void *)(v8 + 32), *(void *)(v8 + 40), *(unsigned char *)(v8 + 48));

  v11(a1 + a2[20], v5);
  uint64_t v9 = a1 + a2[21];

  return ((uint64_t (*)(uint64_t, uint64_t))v11)(v9, v5);
}

uint64_t sub_1AF79AFD4(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void **)(a2 + 8);
  uint64_t v7 = *(void **)(a2 + 16);
  uint64_t v8 = *(void *)(a2 + 24);
  uint64_t v9 = *(void *)(a2 + 32);
  uint64_t v10 = *(void *)(a2 + 40);
  uint64_t v11 = *(void *)(a2 + 48);
  char v12 = *(unsigned char *)(a2 + 56);
  sub_1AF3C6300(v6, v7, v8, v9, v10, v11, v12);
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = v7;
  *(void *)(a1 + 24) = v8;
  *(void *)(a1 + 32) = v9;
  *(void *)(a1 + 40) = v10;
  *(void *)(a1 + 48) = v11;
  *(unsigned char *)(a1 + 56) = v12;
  char v13 = *(void **)(a2 + 64);
  *(void *)(a1 + 64) = v13;
  uint64_t v14 = a3[7];
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  uint64_t v74 = sub_1AF7AA5F0();
  uint64_t v75 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v74 - 8) + 16);
  id v17 = v13;
  v75(v15, v16, v74);
  v75(a1 + a3[8], a2 + a3[8], v74);
  char v76 = a3;
  uint64_t v18 = a3[9];
  uint64_t v19 = a3[10];
  uint64_t v20 = *(void **)(a2 + v18);
  *(void *)(a1 + v18) = v20;
  uint64_t v21 = *(void **)(a2 + v19);
  *(void *)(a1 + v19) = v21;
  uint64_t v22 = a3[11];
  uint64_t v23 = a3[12];
  uint64_t v24 = *(void **)(a2 + v22);
  *(void *)(a1 + v22) = v24;
  uint64_t v25 = a1 + v23;
  uint64_t v26 = *(void *)(a2 + v23 + 16);
  uint64_t v72 = *(void **)(a2 + v23 + 8);
  uint64_t v73 = *(void **)(a2 + v23);
  uint64_t v27 = *(void *)(a2 + v23 + 24);
  uint64_t v28 = *(void *)(a2 + v23 + 32);
  uint64_t v29 = *(void *)(a2 + v23 + 40);
  LOBYTE(v9) = *(unsigned char *)(a2 + v23 + 48);
  id v30 = v20;
  id v31 = v21;
  id v32 = v24;
  sub_1AF3C6300(v73, v72, v26, v27, v28, v29, v9);
  *(void *)uint64_t v25 = v73;
  *(void *)(v25 + 8) = v72;
  *(void *)(v25 + 16) = v26;
  *(void *)(v25 + 24) = v27;
  *(void *)(v25 + 32) = v28;
  *(void *)(v25 + 40) = v29;
  *(unsigned char *)(v25 + 48) = v9;
  uint64_t v33 = v76[13];
  uint64_t v34 = v76[14];
  uint64_t v35 = *(void **)(a2 + v33);
  *(void *)(a1 + v33) = v35;
  uint64_t v36 = (void *)(a1 + v34);
  uint64_t v37 = (void *)(a2 + v34);
  uint64_t v38 = v37[1];
  *uint64_t v36 = *v37;
  v36[1] = v38;
  uint64_t v39 = v76[15];
  uint64_t v40 = a1 + v39;
  uint64_t v41 = a2 + v39;
  uint64_t v43 = *(void **)v41;
  uint64_t v42 = *(void **)(v41 + 8);
  uint64_t v44 = *(void *)(v41 + 16);
  uint64_t v45 = *(void *)(v41 + 24);
  uint64_t v46 = *(void *)(v41 + 32);
  uint64_t v47 = *(void *)(v41 + 40);
  LOBYTE(v73) = *(unsigned char *)(v41 + 48);
  id v48 = v35;
  swift_bridgeObjectRetain();
  sub_1AF3C6300(v43, v42, v44, v45, v46, v47, (char)v73);
  *(void *)uint64_t v40 = v43;
  *(void *)(v40 + 8) = v42;
  *(void *)(v40 + 16) = v44;
  *(void *)(v40 + 24) = v45;
  *(void *)(v40 + 32) = v46;
  *(void *)(v40 + 40) = v47;
  uint64_t v49 = v76[16];
  uint64_t v50 = v76[17];
  uint64_t v51 = *(void **)(a2 + v49);
  *(unsigned char *)(v40 + 48) = (_BYTE)v73;
  *(void *)(a1 + v49) = v51;
  uint64_t v52 = a1 + v50;
  uint64_t v53 = a2 + v50;
  id v54 = *(void **)(a2 + v50);
  uint64_t v55 = *(void **)(a2 + v50 + 8);
  uint64_t v56 = *(void *)(a2 + v50 + 16);
  uint64_t v57 = *(void *)(a2 + v50 + 24);
  uint64_t v58 = *(void *)(a2 + v50 + 32);
  uint64_t v59 = *(void *)(a2 + v50 + 40);
  LOBYTE(v73) = *(unsigned char *)(a2 + v50 + 48);
  id v60 = v51;
  sub_1AF3C6300(v54, v55, v56, v57, v58, v59, (char)v73);
  *(void *)uint64_t v52 = v54;
  *(void *)(v52 + 8) = v55;
  *(void *)(v52 + 16) = v56;
  *(void *)(v52 + 24) = v57;
  *(void *)(v52 + 32) = v58;
  *(void *)(v52 + 40) = v59;
  *(unsigned char *)(v52 + 48) = (_BYTE)v73;
  *(void *)(v52 + 56) = *(void *)(v53 + 56);
  long long v61 = *(_OWORD *)(v53 + 80);
  *(_OWORD *)(v52 + 64) = *(_OWORD *)(v53 + 64);
  *(_OWORD *)(v52 + 80) = v61;
  *(unsigned char *)(v52 + 96) = *(unsigned char *)(v53 + 96);
  *(unsigned char *)(v52 + 136) = *(unsigned char *)(v53 + 136);
  *(_OWORD *)(v52 + 120) = *(_OWORD *)(v53 + 120);
  *(_OWORD *)(v52 + 104) = *(_OWORD *)(v53 + 104);
  uint64_t v63 = v76[19];
  uint64_t v62 = v76[20];
  uint64_t v64 = a1 + v62;
  uint64_t v65 = a2 + v62;
  uint64_t v66 = v76[18];
  uint64_t v67 = *(void **)(a2 + v66);
  *(void *)(a1 + v66) = v67;
  *(_OWORD *)(a1 + v63) = *(_OWORD *)(a2 + v63);
  id v68 = v67;
  v75(v64, v65, v74);
  v75(a1 + v76[21], a2 + v76[21], v74);
  uint64_t v69 = v76[23];
  *(void *)(a1 + v76[22]) = *(void *)(a2 + v76[22]);
  *(void *)(a1 + v69) = *(void *)(a2 + v69);
  uint64_t v70 = v76[25];
  *(void *)(a1 + v76[24]) = *(void *)(a2 + v76[24]);
  *(void *)(a1 + v70) = *(void *)(a2 + v70);
  return a1;
}

uint64_t sub_1AF79B31C(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void **)(a2 + 8);
  uint64_t v7 = *(void **)(a2 + 16);
  uint64_t v8 = *(void *)(a2 + 24);
  uint64_t v9 = *(void *)(a2 + 32);
  uint64_t v10 = *(void *)(a2 + 40);
  uint64_t v11 = *(void *)(a2 + 48);
  char v12 = *(unsigned char *)(a2 + 56);
  sub_1AF3C6300(v6, v7, v8, v9, v10, v11, v12);
  char v13 = *(void **)(a1 + 8);
  uint64_t v14 = *(void **)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 48);
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = v7;
  *(void *)(a1 + 24) = v8;
  *(void *)(a1 + 32) = v9;
  *(void *)(a1 + 40) = v10;
  *(void *)(a1 + 48) = v11;
  char v19 = *(unsigned char *)(a1 + 56);
  *(unsigned char *)(a1 + 56) = v12;
  sub_1AF3DB200(v13, v14, v15, v16, v17, v18, v19);
  uint64_t v20 = *(void **)(a2 + 64);
  uint64_t v21 = *(void **)(a1 + 64);
  *(void *)(a1 + 64) = v20;
  id v22 = v20;

  uint64_t v23 = a3[7];
  uint64_t v24 = a1 + v23;
  uint64_t v25 = a2 + v23;
  uint64_t v26 = sub_1AF7AA5F0();
  id v114 = *(void (**)(uint64_t, uint64_t))(*(void *)(v26 - 8) + 24);
  uint64_t v27 = v24;
  uint64_t v28 = v26;
  uint64_t v113 = v26;
  v114(v27, v25);
  ((void (*)(uint64_t, uint64_t, uint64_t))v114)(a1 + a3[8], a2 + a3[8], v28);
  uint64_t v29 = a3[9];
  id v30 = *(void **)(a2 + v29);
  id v31 = *(void **)(a1 + v29);
  *(void *)(a1 + v29) = v30;
  id v32 = v30;

  uint64_t v33 = a3[10];
  uint64_t v34 = *(void **)(a2 + v33);
  uint64_t v35 = *(void **)(a1 + v33);
  *(void *)(a1 + v33) = v34;
  id v36 = v34;

  uint64_t v37 = a3[11];
  v115 = a3;
  uint64_t v38 = *(void **)(a2 + v37);
  uint64_t v39 = *(void **)(a1 + v37);
  *(void *)(a1 + v37) = v38;
  id v40 = v38;

  uint64_t v41 = a3[12];
  uint64_t v42 = a1 + v41;
  uint64_t v43 = a2 + v41;
  id v44 = *(id *)v43;
  uint64_t v45 = *(void **)(v43 + 8);
  uint64_t v46 = *(void *)(v43 + 16);
  uint64_t v47 = *(void *)(v43 + 24);
  uint64_t v48 = *(void *)(v43 + 32);
  uint64_t v49 = *(void *)(v43 + 40);
  LOBYTE(v39) = *(unsigned char *)(v43 + 48);
  sub_1AF3C6300(*(id *)v43, v45, v46, v47, v48, v49, (char)v39);
  uint64_t v50 = *(void **)v42;
  uint64_t v51 = *(void **)(v42 + 8);
  uint64_t v52 = *(void *)(v42 + 16);
  uint64_t v53 = *(void *)(v42 + 24);
  uint64_t v54 = *(void *)(v42 + 32);
  uint64_t v55 = *(void *)(v42 + 40);
  *(void *)uint64_t v42 = v44;
  *(void *)(v42 + 8) = v45;
  *(void *)(v42 + 16) = v46;
  *(void *)(v42 + 24) = v47;
  *(void *)(v42 + 32) = v48;
  *(void *)(v42 + 40) = v49;
  char v56 = *(unsigned char *)(v42 + 48);
  *(unsigned char *)(v42 + 48) = (_BYTE)v39;
  sub_1AF3DB200(v50, v51, v52, v53, v54, v55, v56);
  uint64_t v57 = v115[13];
  uint64_t v58 = *(void **)(a2 + v57);
  uint64_t v59 = *(void **)(a1 + v57);
  *(void *)(a1 + v57) = v58;
  id v60 = v58;

  uint64_t v61 = v115[14];
  uint64_t v62 = (void *)(a1 + v61);
  uint64_t v63 = (void *)(a2 + v61);
  *uint64_t v62 = *v63;
  v62[1] = v63[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v64 = v115[15];
  uint64_t v65 = a1 + v64;
  uint64_t v66 = a2 + v64;
  id v67 = *(id *)v66;
  id v68 = *(void **)(v66 + 8);
  uint64_t v69 = *(void *)(v66 + 16);
  uint64_t v70 = *(void *)(v66 + 24);
  uint64_t v71 = *(void *)(v66 + 32);
  uint64_t v72 = *(void *)(v66 + 40);
  LOBYTE(v49) = *(unsigned char *)(v66 + 48);
  sub_1AF3C6300(*(id *)v66, v68, v69, v70, v71, v72, v49);
  uint64_t v73 = *(void **)v65;
  uint64_t v74 = *(void **)(v65 + 8);
  uint64_t v75 = *(void *)(v65 + 16);
  uint64_t v76 = *(void *)(v65 + 24);
  uint64_t v77 = *(void *)(v65 + 32);
  uint64_t v78 = *(void *)(v65 + 40);
  *(void *)uint64_t v65 = v67;
  *(void *)(v65 + 8) = v68;
  *(void *)(v65 + 16) = v69;
  *(void *)(v65 + 24) = v70;
  *(void *)(v65 + 32) = v71;
  *(void *)(v65 + 40) = v72;
  char v79 = *(unsigned char *)(v65 + 48);
  *(unsigned char *)(v65 + 48) = v49;
  sub_1AF3DB200(v73, v74, v75, v76, v77, v78, v79);
  uint64_t v80 = v115[16];
  char v81 = *(void **)(a2 + v80);
  char v82 = *(void **)(a1 + v80);
  *(void *)(a1 + v80) = v81;
  id v83 = v81;

  uint64_t v84 = v115[17];
  uint64_t v85 = a1 + v84;
  uint64_t v86 = a2 + v84;
  uint64_t v87 = *(void **)(a2 + v84);
  unint64_t v88 = *(void **)(a2 + v84 + 8);
  uint64_t v89 = *(void *)(a2 + v84 + 16);
  uint64_t v90 = *(void *)(a2 + v84 + 24);
  uint64_t v91 = *(void *)(a2 + v84 + 32);
  uint64_t v92 = *(void *)(a2 + v84 + 40);
  char v112 = *(unsigned char *)(a2 + v84 + 48);
  sub_1AF3C6300(v87, v88, v89, v90, v91, v92, v112);
  uint64_t v93 = *(void **)v85;
  uint64_t v94 = *(void **)(v85 + 8);
  uint64_t v95 = *(void *)(v85 + 16);
  uint64_t v96 = *(void *)(v85 + 24);
  uint64_t v97 = *(void *)(v85 + 32);
  uint64_t v98 = *(void *)(v85 + 40);
  *(void *)uint64_t v85 = v87;
  *(void *)(v85 + 8) = v88;
  *(void *)(v85 + 16) = v89;
  *(void *)(v85 + 24) = v90;
  *(void *)(v85 + 32) = v91;
  *(void *)(v85 + 40) = v92;
  char v99 = *(unsigned char *)(v85 + 48);
  *(unsigned char *)(v85 + 48) = v112;
  sub_1AF3DB200(v93, v94, v95, v96, v97, v98, v99);
  *(void *)(v85 + 56) = *(void *)(v86 + 56);
  long long v100 = *(_OWORD *)(v86 + 64);
  long long v101 = *(_OWORD *)(v86 + 80);
  *(unsigned char *)(v85 + 96) = *(unsigned char *)(v86 + 96);
  *(_OWORD *)(v85 + 64) = v100;
  *(_OWORD *)(v85 + 80) = v101;
  long long v102 = *(_OWORD *)(v86 + 104);
  long long v103 = *(_OWORD *)(v86 + 120);
  *(unsigned char *)(v85 + 136) = *(unsigned char *)(v86 + 136);
  *(_OWORD *)(v85 + 120) = v103;
  *(_OWORD *)(v85 + 104) = v102;
  uint64_t v104 = v115[18];
  uint64_t v105 = *(void **)(a1 + v104);
  id v106 = *(void **)(a2 + v104);
  *(void *)(a1 + v104) = v106;
  id v107 = v106;

  uint64_t v108 = v115[19];
  uint64_t v109 = (void *)(a1 + v108);
  unint64_t v110 = (void *)(a2 + v108);
  *uint64_t v109 = *v110;
  v109[1] = v110[1];
  ((void (*)(uint64_t, uint64_t, uint64_t))v114)(a1 + v115[20], a2 + v115[20], v113);
  ((void (*)(uint64_t, uint64_t, uint64_t))v114)(a1 + v115[21], a2 + v115[21], v113);
  *(void *)(a1 + v115[22]) = *(void *)(a2 + v115[22]);
  *(void *)(a1 + v115[23]) = *(void *)(a2 + v115[23]);
  *(void *)(a1 + v115[24]) = *(void *)(a2 + v115[24]);
  *(void *)(a1 + v115[25]) = *(void *)(a2 + v115[25]);
  return a1;
}

uint64_t sub_1AF79B708(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  long long v6 = *(_OWORD *)(a2 + 40);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  uint64_t v7 = a3[7];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(_OWORD *)(a1 + 40) = v6;
  uint64_t v10 = sub_1AF7AA5F0();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  v11(a1 + a3[8], a2 + a3[8], v10);
  uint64_t v12 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(void *)(a1 + v12) = *(void *)(a2 + v12);
  uint64_t v13 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  long long v16 = *(_OWORD *)(v15 + 16);
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  *(_OWORD *)(v14 + 16) = v16;
  *(_OWORD *)(v14 + 32) = *(_OWORD *)(v15 + 32);
  *(unsigned char *)(v14 + 48) = *(unsigned char *)(v15 + 48);
  uint64_t v17 = a3[14];
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  *(_OWORD *)(a1 + v17) = *(_OWORD *)(a2 + v17);
  uint64_t v18 = a3[15];
  uint64_t v19 = a3[16];
  uint64_t v20 = a1 + v18;
  uint64_t v21 = a2 + v18;
  long long v22 = *(_OWORD *)(v21 + 16);
  *(_OWORD *)uint64_t v20 = *(_OWORD *)v21;
  *(_OWORD *)(v20 + 16) = v22;
  long long v23 = *(_OWORD *)(v21 + 32);
  *(unsigned char *)(v20 + 48) = *(unsigned char *)(v21 + 48);
  uint64_t v24 = *(void *)(a2 + v19);
  *(_OWORD *)(v20 + 32) = v23;
  *(void *)(a1 + v19) = v24;
  memcpy((void *)(a1 + a3[17]), (const void *)(a2 + a3[17]), 0x89uLL);
  uint64_t v25 = a3[19];
  *(void *)(a1 + a3[18]) = *(void *)(a2 + a3[18]);
  *(_OWORD *)(a1 + v25) = *(_OWORD *)(a2 + v25);
  v11(a1 + a3[20], a2 + a3[20], v10);
  v11(a1 + a3[21], a2 + a3[21], v10);
  uint64_t v26 = a3[23];
  *(void *)(a1 + a3[22]) = *(void *)(a2 + a3[22]);
  *(void *)(a1 + v26) = *(void *)(a2 + v26);
  uint64_t v27 = a3[25];
  *(void *)(a1 + a3[24]) = *(void *)(a2 + a3[24]);
  *(void *)(a1 + v27) = *(void *)(a2 + v27);
  return a1;
}

uint64_t sub_1AF79B8EC(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  char v6 = *(unsigned char *)(a2 + 56);
  uint64_t v7 = *(void **)(a1 + 8);
  uint64_t v8 = *(void **)(a1 + 16);
  uint64_t v9 = *(void *)(a1 + 24);
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 48);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  char v13 = *(unsigned char *)(a1 + 56);
  *(unsigned char *)(a1 + 56) = v6;
  sub_1AF3DB200(v7, v8, v9, v10, v11, v12, v13);
  uint64_t v14 = *(void **)(a1 + 64);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);

  uint64_t v15 = a3[7];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = sub_1AF7AA5F0();
  uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 40);
  v19(v16, v17, v18);
  v19(a1 + a3[8], a2 + a3[8], v18);
  uint64_t v20 = a3[9];
  uint64_t v21 = *(void **)(a1 + v20);
  *(void *)(a1 + v20) = *(void *)(a2 + v20);

  uint64_t v22 = a3[10];
  long long v23 = *(void **)(a1 + v22);
  *(void *)(a1 + v22) = *(void *)(a2 + v22);

  uint64_t v24 = a3[11];
  uint64_t v25 = *(void **)(a1 + v24);
  *(void *)(a1 + v24) = *(void *)(a2 + v24);

  uint64_t v26 = a3[12];
  uint64_t v27 = a1 + v26;
  uint64_t v28 = a2 + v26;
  char v29 = *(unsigned char *)(v28 + 48);
  id v30 = *(void **)v27;
  id v31 = *(void **)(v27 + 8);
  uint64_t v32 = *(void *)(v27 + 16);
  uint64_t v33 = *(void *)(v27 + 24);
  uint64_t v34 = *(void *)(v27 + 32);
  uint64_t v35 = *(void *)(v27 + 40);
  long long v36 = *(_OWORD *)(v28 + 16);
  *(_OWORD *)uint64_t v27 = *(_OWORD *)v28;
  *(_OWORD *)(v27 + 16) = v36;
  *(_OWORD *)(v27 + 32) = *(_OWORD *)(v28 + 32);
  char v37 = *(unsigned char *)(v27 + 48);
  *(unsigned char *)(v27 + 48) = v29;
  sub_1AF3DB200(v30, v31, v32, v33, v34, v35, v37);
  uint64_t v38 = a3[13];
  uint64_t v39 = *(void **)(a1 + v38);
  *(void *)(a1 + v38) = *(void *)(a2 + v38);

  uint64_t v40 = a3[14];
  uint64_t v41 = (void *)(a1 + v40);
  uint64_t v42 = (uint64_t *)(a2 + v40);
  uint64_t v44 = *v42;
  uint64_t v43 = v42[1];
  *uint64_t v41 = v44;
  v41[1] = v43;
  swift_bridgeObjectRelease();
  uint64_t v45 = a3[15];
  uint64_t v46 = a1 + v45;
  uint64_t v47 = a2 + v45;
  char v48 = *(unsigned char *)(v47 + 48);
  uint64_t v49 = *(void **)v46;
  uint64_t v50 = *(void **)(v46 + 8);
  uint64_t v51 = *(void *)(v46 + 16);
  uint64_t v52 = *(void *)(v46 + 24);
  uint64_t v53 = *(void *)(v46 + 32);
  uint64_t v54 = *(void *)(v46 + 40);
  long long v55 = *(_OWORD *)(v47 + 16);
  *(_OWORD *)uint64_t v46 = *(_OWORD *)v47;
  *(_OWORD *)(v46 + 16) = v55;
  *(_OWORD *)(v46 + 32) = *(_OWORD *)(v47 + 32);
  char v56 = *(unsigned char *)(v46 + 48);
  *(unsigned char *)(v46 + 48) = v48;
  sub_1AF3DB200(v49, v50, v51, v52, v53, v54, v56);
  uint64_t v57 = a3[16];
  uint64_t v58 = *(void **)(a1 + v57);
  *(void *)(a1 + v57) = *(void *)(a2 + v57);

  uint64_t v59 = a3[17];
  uint64_t v60 = a1 + v59;
  uint64_t v61 = a2 + v59;
  LOBYTE(v59) = *(unsigned char *)(a2 + v59 + 48);
  uint64_t v62 = *(void **)v60;
  uint64_t v63 = *(void **)(v60 + 8);
  uint64_t v64 = *(void *)(v60 + 16);
  uint64_t v65 = *(void *)(v60 + 24);
  uint64_t v66 = *(void *)(v60 + 32);
  uint64_t v67 = *(void *)(v60 + 40);
  long long v68 = *(_OWORD *)(v61 + 16);
  *(_OWORD *)uint64_t v60 = *(_OWORD *)v61;
  *(_OWORD *)(v60 + 16) = v68;
  *(_OWORD *)(v60 + 32) = *(_OWORD *)(v61 + 32);
  char v69 = *(unsigned char *)(v60 + 48);
  *(unsigned char *)(v60 + 48) = v59;
  sub_1AF3DB200(v62, v63, v64, v65, v66, v67, v69);
  *(void *)(v60 + 56) = *(void *)(v61 + 56);
  long long v70 = *(_OWORD *)(v61 + 80);
  *(_OWORD *)(v60 + 64) = *(_OWORD *)(v61 + 64);
  *(_OWORD *)(v60 + 80) = v70;
  *(unsigned char *)(v60 + 96) = *(unsigned char *)(v61 + 96);
  *(_OWORD *)(v60 + 104) = *(_OWORD *)(v61 + 104);
  *(_OWORD *)(v60 + 120) = *(_OWORD *)(v61 + 120);
  *(unsigned char *)(v60 + 136) = *(unsigned char *)(v61 + 136);
  uint64_t v71 = a3[18];
  uint64_t v72 = *(void **)(a1 + v71);
  *(void *)(a1 + v71) = *(void *)(a2 + v71);

  uint64_t v73 = a3[20];
  *(_OWORD *)(a1 + a3[19]) = *(_OWORD *)(a2 + a3[19]);
  v19(a1 + v73, a2 + v73, v18);
  v19(a1 + a3[21], a2 + a3[21], v18);
  uint64_t v74 = a3[23];
  *(void *)(a1 + a3[22]) = *(void *)(a2 + a3[22]);
  *(void *)(a1 + v74) = *(void *)(a2 + v74);
  uint64_t v75 = a3[25];
  *(void *)(a1 + a3[24]) = *(void *)(a2 + a3[24]);
  *(void *)(a1 + v75) = *(void *)(a2 + v75);
  return a1;
}

uint64_t sub_1AF79BBBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1AF79BBD0);
}

uint64_t sub_1AF79BBD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 64);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_1AF7AA5F0();
    uint64_t v9 = a1 + *(int *)(a3 + 28);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t sub_1AF79BC58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1AF79BC6C);
}

uint64_t sub_1AF79BC6C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 64) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_1AF7AA5F0();
    uint64_t v8 = v5 + *(int *)(a4 + 28);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for PlayerCardTheme()
{
  uint64_t result = qword_1E9ACFFF0;
  if (!qword_1E9ACFFF0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1AF79BD34()
{
  uint64_t result = sub_1AF7AA5F0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1AF79BE3C@<X0>(uint64_t a1@<X8>)
{
  if (*v1) {
    goto LABEL_7;
  }
  sub_1AF388300();
  uint64_t v3 = OUTLINED_FUNCTION_0_135();
  OUTLINED_FUNCTION_2_154(v3);
  if ((v1 & 1) == 0)
  {
    if (sub_1AF3855C4())
    {
      uint64_t v8 = (unsigned int *)MEMORY[0x1E4FB10D8];
LABEL_8:
      uint64_t v9 = *v8;
      sub_1AF7AB1B0();
      OUTLINED_FUNCTION_1_14();
      return (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 104))(a1, v9);
    }
LABEL_7:
    uint64_t v8 = (unsigned int *)MEMORY[0x1E4FB10C0];
    goto LABEL_8;
  }
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EC0]), sel_init);
  id v5 = objc_msgSend(v4, sel_view);

  LODWORD(v4) = PSShouldInsetListView();
  sub_1AF7AB1B0();
  OUTLINED_FUNCTION_1_14();
  if (v4) {
    uint64_t v7 = (unsigned int *)MEMORY[0x1E4FB10D8];
  }
  else {
    uint64_t v7 = (unsigned int *)MEMORY[0x1E4FB10C0];
  }
  return (*(uint64_t (**)(uint64_t, void))(v6 + 104))(a1, *v7);
}

double sub_1AF79BF78()
{
  if ((*v0 & 1) == 0)
  {
    sub_1AF388300();
    uint64_t v1 = OUTLINED_FUNCTION_0_135();
    OUTLINED_FUNCTION_2_154(v1);
    if (v0)
    {
      id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EC0]), sel_init);
      id v3 = objc_msgSend(v2, sel_view);

      LODWORD(v2) = PSShouldInsetListView();
      double v4 = 0.0;
      if (!v2) {
        return v4;
      }
    }
    else
    {
      double v4 = 0.0;
      if (sub_1AF3855C4()) {
        return v4;
      }
    }
  }
  double v4 = 16.0;
  if ((GKIsXRUIIdiomShouldUsePadUI() & 1) == 0)
  {
    if (GKIsRemoteUI()) {
      return 20.0;
    }
    else {
      return 10.0;
    }
  }
  return v4;
}

double sub_1AF79C054()
{
  if (*v0) {
    goto LABEL_6;
  }
  sub_1AF388300();
  uint64_t v1 = OUTLINED_FUNCTION_0_135();
  OUTLINED_FUNCTION_2_154(v1);
  if (v0)
  {
    id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EC0]), sel_init);
    id v3 = objc_msgSend(v2, sel_view);

    LODWORD(v2) = PSShouldInsetListView();
    if (!v2) {
      return 0.0;
    }
    goto LABEL_6;
  }
  if ((sub_1AF3855C4() & 1) == 0) {
LABEL_6:
  }
    GKIsXRUIIdiomShouldUsePadUI();
  return 0.0;
}

uint64_t sub_1AF79C124@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  if (*v2)
  {
    uint64_t v4 = 0;
  }
  else
  {
    sub_1AF388300();
    uint64_t v5 = OUTLINED_FUNCTION_0_135();
    OUTLINED_FUNCTION_2_154(v5);
    if (v2)
    {
      id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EC0]), sel_init);
      id v7 = objc_msgSend(v6, sel_view);

      LODWORD(v6) = PSShouldInsetListView();
      uint64_t result = v6 ^ 1;
    }
    else
    {
      uint64_t result = sub_1AF3855C4();
    }
    uint64_t v4 = result & 1;
  }
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(unsigned char *)(a2 + 32) = 1;
  return result;
}

void sub_1AF79C1F0()
{
  int v0 = GKIsRemoteUI();
  uint64_t v1 = self;
  id v2 = &selRef_whiteColor;
  if (!v0) {
    id v2 = &selRef_labelColor;
  }
  id v3 = [v1 *v2];

  JUMPOUT(0x1B3E80C10);
}

uint64_t sub_1AF79C258()
{
  if (*v0)
  {
    char v1 = 1;
  }
  else
  {
    sub_1AF388300();
    uint64_t v2 = OUTLINED_FUNCTION_0_135();
    OUTLINED_FUNCTION_2_154(v2);
    if (v0)
    {
      id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EC0]), sel_init);
      id v4 = objc_msgSend(v3, sel_view);

      char v1 = PSShouldInsetListView();
    }
    else
    {
      char v1 = sub_1AF3855C4() ^ 1;
    }
  }
  return v1 & 1;
}

uint64_t sub_1AF79C308()
{
  uint64_t v0 = sub_1AF7AA5F0();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x1F4188790](v0);
  id v4 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x1F4188790](v2);
  id v7 = (char *)&v32 - v6;
  uint64_t v8 = MEMORY[0x1F4188790](v5);
  uint64_t v10 = (char *)&v32 - v9;
  MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)&v32 - v11;
  uint64_t v13 = type metadata accessor for PlayerCardTheme();
  __swift_allocate_value_buffer(v13, qword_1E9ACFEE8);
  uint64_t v37 = __swift_project_value_buffer(v13, (uint64_t)qword_1E9ACFEE8);
  if (qword_1E9AC2988 != -1) {
    swift_once();
  }
  v55[0] = qword_1E9ACFF18;
  v55[1] = qword_1E9ACFF20;
  v55[2] = qword_1E9ACFF28;
  v55[3] = qword_1E9ACFF30;
  v55[4] = qword_1E9ACFF38;
  v55[5] = qword_1E9ACFF40;
  char v56 = byte_1E9ACFF48;
  sub_1AF3C6300((id)qword_1E9ACFF18, qword_1E9ACFF20, qword_1E9ACFF28, qword_1E9ACFF30, qword_1E9ACFF38, qword_1E9ACFF40, byte_1E9ACFF48);
  if (qword_1E9AC2990 != -1) {
    swift_once();
  }
  uint64_t v14 = qword_1E9AC2808;
  id v36 = (id)qword_1E9ACFF50;
  if (v14 != -1) {
    swift_once();
  }
  uint64_t v15 = __swift_project_value_buffer(v0, (uint64_t)qword_1E9AF00A0);
  uint64_t v16 = *(void (**)(void, void, void))(v1 + 16);
  v16(v12, v15, v0);
  uint64_t v39 = v10;
  v16(v10, v15, v0);
  uint64_t v17 = self;
  id v35 = objc_msgSend(v17, sel_systemBlueColor);
  if (qword_1E9AC2620 != -1) {
    swift_once();
  }
  uint64_t v18 = qword_1E9AC25F8;
  id v34 = (id)qword_1E9AEFDA8;
  if (v18 != -1) {
    swift_once();
  }
  uint64_t v19 = qword_1E9AC2648;
  id v33 = (id)qword_1E9AEFD80;
  if (v19 != -1) {
    swift_once();
  }
  uint64_t v38 = v12;
  uint64_t v20 = qword_1E9AC2650;
  id v21 = (id)qword_1E9AEFDD0;
  if (v20 != -1) {
    swift_once();
  }
  *(void *)&v53[0] = v21;
  *((void *)&v53[0] + 1) = qword_1E9AEFDD8;
  v53[1] = xmmword_1AF7E9950;
  v53[2] = xmmword_1AF7E9960;
  char v54 = 1;
  id v22 = (id)qword_1E9AEFDD8;
  id v23 = objc_msgSend(v17, sel_secondaryLabelColor);
  if (qword_1E9AC2998 != -1) {
    swift_once();
  }
  uint64_t v50 = qword_1E9ACFF58;
  long long v51 = 0u;
  memset(v52, 0, sizeof(v52));
  id v24 = (id)qword_1E9ACFF58;
  id v25 = objc_msgSend(v17, sel_systemBlueColor);
  char v59 = 1;
  char v57 = 1;
  memset(v40, 0, 48);
  v40[48] = 3;
  *(_DWORD *)uint64_t v41 = v60[0];
  *(_DWORD *)&v41[3] = *(_DWORD *)((char *)v60 + 3);
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v44 = 0;
  char v45 = 1;
  *(_DWORD *)uint64_t v46 = *(_DWORD *)v58;
  *(_DWORD *)&v46[3] = *(_DWORD *)&v58[3];
  long long v48 = 0u;
  long long v47 = 0u;
  char v49 = 1;
  id v26 = objc_msgSend(self, sel_secondaryTheme);
  if (qword_1E9AC29A0 != -1) {
    swift_once();
  }
  double v27 = *(double *)&qword_1E9ACFF60;
  double v28 = *(double *)algn_1E9ACFF68;
  if (qword_1E9AC27A8 != -1) {
    swift_once();
  }
  uint64_t v29 = __swift_project_value_buffer(v0, (uint64_t)&unk_1E9AEFF80);
  v16(v7, v29, v0);
  if (qword_1E9AC27C0 != -1) {
    swift_once();
  }
  uint64_t v30 = __swift_project_value_buffer(v0, (uint64_t)&unk_1E9AEFFC8);
  v16(v4, v30, v0);
  return sub_1AF79C918(0, (uint64_t)v55, (uint64_t)v36, (uint64_t)v35, (uint64_t)v34, (uint64_t)v33, v37, v27, v28, 44.0, 32.0, 27.0, 20.0, v53, (uint64_t)v23, 0, 0, (long long *)&v50, (uint64_t)v25,
           v40,
           (uint64_t)v26);
}

uint64_t sub_1AF79C918@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X5>, uint64_t a5@<X6>, uint64_t a6@<X7>, uint64_t a7@<X8>, double a8@<D0>, double a9@<D1>, double a10@<D2>, double a11@<D3>, double a12@<D4>, double a13@<D5>, long long *a14, uint64_t a15, uint64_t a16, uint64_t a17, long long *a18, uint64_t a19, const void *a20,uint64_t a21)
{
  char v31 = *(unsigned char *)(a2 + 48);
  long long v44 = a14[1];
  long long v45 = *a14;
  uint64_t v32 = *((void *)a14 + 4);
  uint64_t v33 = *((void *)a14 + 5);
  char v34 = *((unsigned char *)a14 + 48);
  long long v49 = a18[1];
  long long v50 = *a18;
  uint64_t v47 = *((void *)a18 + 5);
  uint64_t v48 = *((void *)a18 + 4);
  char v46 = *((unsigned char *)a18 + 48);
  memcpy(__dst, a20, sizeof(__dst));
  *(unsigned char *)a7 = a1;
  long long v35 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a7 + 8) = *(_OWORD *)a2;
  *(_OWORD *)(a7 + 24) = v35;
  *(_OWORD *)(a7 + 40) = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a7 + 56) = v31;
  *(void *)(a7 + 64) = a3;
  id v36 = (int *)type metadata accessor for PlayerCardTheme();
  sub_1AF7AA5F0();
  OUTLINED_FUNCTION_1_14();
  uint64_t v38 = *(void (**)(void))(v37 + 32);
  OUTLINED_FUNCTION_1_166();
  v38();
  OUTLINED_FUNCTION_1_166();
  v38();
  *(void *)(a7 + v36[9]) = a4;
  *(void *)(a7 + v36[10]) = a5;
  *(void *)(a7 + v36[11]) = a6;
  uint64_t v39 = a7 + v36[12];
  *(_OWORD *)uint64_t v39 = v45;
  *(_OWORD *)(v39 + 16) = v44;
  *(void *)(v39 + 32) = v32;
  *(void *)(v39 + 40) = v33;
  *(unsigned char *)(v39 + 48) = v34;
  *(void *)(a7 + v36[13]) = a15;
  uint64_t v40 = (void *)(a7 + v36[14]);
  *uint64_t v40 = a16;
  v40[1] = a17;
  uint64_t v41 = a7 + v36[15];
  *(_OWORD *)uint64_t v41 = v50;
  *(_OWORD *)(v41 + 16) = v49;
  *(void *)(v41 + 32) = v48;
  *(void *)(v41 + 40) = v47;
  *(unsigned char *)(v41 + 48) = v46;
  *(void *)(a7 + v36[16]) = a19;
  memcpy((void *)(a7 + v36[17]), __dst, 0x89uLL);
  *(void *)(a7 + v36[18]) = a21;
  long long v42 = (double *)(a7 + v36[19]);
  *long long v42 = a8;
  v42[1] = a9;
  OUTLINED_FUNCTION_1_166();
  v38();
  OUTLINED_FUNCTION_1_166();
  uint64_t result = ((uint64_t (*)(void))v38)();
  *(double *)(a7 + v36[22]) = a10;
  *(double *)(a7 + v36[23]) = a11;
  *(double *)(a7 + v36[24]) = a12;
  *(double *)(a7 + v36[25]) = a13;
  return result;
}

uint64_t sub_1AF79CBAC()
{
  uint64_t v0 = sub_1AF7AA5F0();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x1F4188790](v0);
  id v4 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x1F4188790](v2);
  id v7 = (char *)&v31 - v6;
  uint64_t v8 = MEMORY[0x1F4188790](v5);
  uint64_t v10 = (char *)&v31 - v9;
  MEMORY[0x1F4188790](v8);
  uint64_t v39 = (char *)&v31 - v11;
  uint64_t v12 = type metadata accessor for PlayerCardTheme();
  __swift_allocate_value_buffer(v12, qword_1E9ACFF00);
  uint64_t v37 = __swift_project_value_buffer(v12, (uint64_t)qword_1E9ACFF00);
  if (qword_1E9AC29A8 != -1) {
    swift_once();
  }
  v60[0] = qword_1E9ACFF70;
  v60[1] = *(void *)algn_1E9ACFF78;
  v60[2] = qword_1E9ACFF80;
  v60[3] = qword_1E9ACFF88;
  v60[4] = qword_1E9ACFF90;
  _DWORD v60[5] = qword_1E9ACFF98;
  char v61 = byte_1E9ACFFA0;
  sub_1AF3C6300((id)qword_1E9ACFF70, *(void **)algn_1E9ACFF78, qword_1E9ACFF80, qword_1E9ACFF88, qword_1E9ACFF90, qword_1E9ACFF98, byte_1E9ACFFA0);
  if (qword_1E9AC29B8 != -1) {
    swift_once();
  }
  uint64_t v13 = qword_1E9AC2810;
  id v36 = (id)qword_1E9ACFFE0;
  if (v13 != -1) {
    swift_once();
  }
  uint64_t v14 = __swift_project_value_buffer(v0, (uint64_t)qword_1E9AF00B8);
  uint64_t v15 = *(void (**)(void, void, void))(v1 + 16);
  v15(v39, v14, v0);
  if (qword_1E9AC2808 != -1) {
    swift_once();
  }
  uint64_t v16 = __swift_project_value_buffer(v0, (uint64_t)qword_1E9AF00A0);
  uint64_t v38 = v10;
  v15(v10, v16, v0);
  uint64_t v17 = self;
  id v35 = objc_msgSend(v17, sel_labelColor);
  id v34 = objc_msgSend(v17, sel_quaternaryLabelColor);
  id v33 = objc_msgSend(v17, sel_quaternaryLabelColor);
  memset(v58, 0, sizeof(v58));
  char v59 = 3;
  id v32 = objc_msgSend(v17, sel_whiteColor);
  uint64_t v31 = sub_1AF7AE0E0();
  uint64_t v19 = v18;
  if (qword_1E9AC29B0 != -1) {
    swift_once();
  }
  long long v52 = xmmword_1E9ACFFA8;
  uint64_t v53 = qword_1E9ACFFB8;
  uint64_t v54 = qword_1E9ACFFC0;
  uint64_t v55 = qword_1E9ACFFC8;
  uint64_t v56 = qword_1E9ACFFD0;
  char v57 = byte_1E9ACFFD8;
  sub_1AF3C6300((id)xmmword_1E9ACFFA8, *((void **)&xmmword_1E9ACFFA8 + 1), qword_1E9ACFFB8, qword_1E9ACFFC0, qword_1E9ACFFC8, qword_1E9ACFFD0, byte_1E9ACFFD8);
  id v20 = objc_msgSend(v17, sel_whiteColor);
  id v21 = objc_msgSend(v20, sel_colorWithAlphaComponent_, 0.15);

  char v64 = 1;
  char v62 = 1;
  uint64_t v40 = qword_1E9ACFFE0;
  long long v41 = 0u;
  memset(v42, 0, sizeof(v42));
  *(_DWORD *)long long v43 = v65[0];
  *(_DWORD *)&v43[3] = *(_DWORD *)((char *)v65 + 3);
  uint64_t v44 = -1;
  long long v45 = 0u;
  long long v46 = 0u;
  char v47 = 1;
  *(_DWORD *)&v48[3] = *(_DWORD *)&v63[3];
  *(_DWORD *)uint64_t v48 = *(_DWORD *)v63;
  long long v49 = 0u;
  long long v50 = 0u;
  char v51 = 1;
  uint64_t v22 = qword_1E9AC29C0;
  id v23 = (id)qword_1E9ACFFE0;
  if (v22 != -1) {
    swift_once();
  }
  uint64_t v24 = qword_1E9AC29A0;
  id v25 = (id)qword_1E9ACFFE8;
  if (v24 != -1) {
    swift_once();
  }
  double v26 = *(double *)&qword_1E9ACFF60;
  double v27 = *(double *)algn_1E9ACFF68;
  if (qword_1E9AC27B0 != -1) {
    swift_once();
  }
  uint64_t v28 = __swift_project_value_buffer(v0, (uint64_t)&unk_1E9AEFF98);
  v15(v7, v28, v0);
  if (qword_1E9AC27B8 != -1) {
    swift_once();
  }
  uint64_t v29 = __swift_project_value_buffer(v0, (uint64_t)qword_1E9AEFFB0);
  v15(v4, v29, v0);
  return sub_1AF79C918(1, (uint64_t)v60, (uint64_t)v36, (uint64_t)v35, (uint64_t)v34, (uint64_t)v33, v37, v26, v27, 40.0, 24.0, -45.0, 18.0, v58, (uint64_t)v32, v31, v19, &v52, (uint64_t)v21,
           &v40,
           (uint64_t)v25);
}

uint64_t sub_1AF79D19C()
{
  uint64_t v0 = type metadata accessor for PlayerCardTheme();
  __swift_allocate_value_buffer(v0, qword_1E9AF04C0);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1E9AF04C0);
  if (GKIsRemoteUI())
  {
    if (qword_1E9AC2978 != -1) {
      swift_once();
    }
    uint64_t v2 = qword_1E9ACFF00;
  }
  else
  {
    if (qword_1E9AC2970 != -1) {
      swift_once();
    }
    uint64_t v2 = qword_1E9ACFEE8;
  }
  uint64_t v3 = __swift_project_value_buffer(v0, (uint64_t)v2);

  return sub_1AF4397C4(v3, v1);
}

id sub_1AF79D27C()
{
  if (qword_1E9AC2648 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_1E9AEFDD0;
  qword_1E9ACFF18 = qword_1E9AEFDD0;
  unk_1E9ACFF20 = 0u;
  unk_1E9ACFF30 = 0u;
  *(_OWORD *)((char *)&qword_1E9ACFF38 + 1) = 0u;

  return v0;
}

id sub_1AF79D2F4()
{
  if (qword_1E9AC2650 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_1E9AEFDD8;
  qword_1E9ACFF50 = qword_1E9AEFDD8;

  return v0;
}

void sub_1AF79D358()
{
  if (qword_1E9AC25E8 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_1E9AC25F0;
  id v1 = (id)qword_1E9AEFD70;
  if (v0 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_1E9AEFD78;
  uint64_t v3 = self;
  id v4 = v2;
  id v5 = objc_msgSend(v3, sel_gk_dynamicColorWithLightColor_darkColor_, v1, v4);

  qword_1E9ACFF58 = (uint64_t)v5;
}

uint64_t sub_1AF79D440()
{
  uint64_t result = GKIsXRUIIdiomShouldUsePadUI();
  double v1 = 128.0;
  if (result) {
    double v1 = 70.0;
  }
  qword_1E9ACFF60 = *(void *)&v1;
  *(double *)algn_1E9ACFF68 = v1;
  return result;
}

double sub_1AF79D47C()
{
  id v0 = objc_msgSend(self, sel__gkGameLayerBackgroundVisualEffect);
  sub_1AF3DB274();
  uint64_t v1 = sub_1AF7AE2B0();

  qword_1E9ACFF70 = v1;
  double result = 0.0;
  *(_OWORD *)algn_1E9ACFF78 = 0u;
  unk_1E9ACFF88 = 0u;
  qword_1E9ACFF98 = 0;
  byte_1E9ACFFA0 = 2;
  return result;
}

void sub_1AF79D4FC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AC47B0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1AF7CCDB0;
  id v1 = objc_msgSend(self, sel_whiteColor);
  id v2 = objc_msgSend(v1, sel_colorWithAlphaComponent_, 0.1);

  id v3 = objc_msgSend(self, sel_effectCompositingColor_, v2);
  if (v3)
  {
    *(void *)(v0 + 32) = v3;
    sub_1AF7AE2E0();
    qword_1E9ACFFA8 = v0;
    unk_1E9ACFFB0 = 0u;
    unk_1E9ACFFC0 = 0u;
    qword_1E9ACFFD0 = 0;
    byte_1E9ACFFD8 = 2;
  }
  else
  {
    __break(1u);
  }
}

void sub_1AF79D604()
{
  id v0 = objc_msgSend(self, sel_whiteColor);
  id v1 = objc_msgSend(v0, sel_colorWithAlphaComponent_, 0.08);

  qword_1E9ACFFE0 = (uint64_t)v1;
}

id sub_1AF79D670()
{
  id v0 = self;
  id v1 = objc_msgSend(v0, sel_whiteColor);
  id v2 = objc_msgSend(v1, sel_colorWithAlphaComponent_, 0.08);

  id v3 = objc_msgSend(v0, sel_whiteColor);
  id v4 = objc_msgSend(v0, sel_secondaryLabelColor);
  id v5 = objc_msgSend(v0, sel_whiteColor);
  id v6 = objc_msgSend(v0, sel_whiteColor);
  id v7 = objc_msgSend(v6, sel_colorWithAlphaComponent_, 0.2);

  id v8 = objc_allocWithZone(MEMORY[0x1E4F4BB28]);
  id result = sub_1AF79D890(v2, v3, v4, v5, v7);
  qword_1E9ACFFE8 = (uint64_t)result;
  return result;
}

double sub_1AF79D7A4(double a1, uint64_t a2, uint64_t a3, char a4)
{
  char v6 = a4 & 1;
  id v7 = objc_allocWithZone((Class)type metadata accessor for PageGrid());

  return 0.0;
}

id sub_1AF79D890(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v11 = objc_msgSend(v5, sel_initWithTitleBackgroundColor_titleTextColor_subtitleTextColor_iconTintColor_progressColor_, a1, a2, a3, a4, a5);

  return v11;
}

void sub_1AF79D910(uint64_t a1, void *a2)
{
  if (!GKIsXRUIIdiomShouldUsePadUI())
  {
    id v3 = objc_msgSend(a2, sel_traitCollection);
    id v4 = objc_msgSend(v3, sel_userInterfaceIdiom);

    if (v4 != (id)1
      || (id v5 = objc_msgSend(a2, sel_traitCollection),
          id v6 = objc_msgSend(v5, sel_horizontalSizeClass),
          v5,
          v6 == (id)1))
    {
      if (sub_1AF79C258())
      {
        objc_msgSend(objc_msgSend(a2, sel_container), sel_contentSize);
        double v8 = v7;
        swift_unknownObjectRelease();
        objc_msgSend(objc_msgSend(a2, sel_container), sel_contentInsets);
        uint64_t v9 = swift_unknownObjectRelease();
        sub_1AF79D7A4(v8, v9, 4, 0);
      }
    }
  }
}

uint64_t OUTLINED_FUNCTION_0_135()
{
  return sub_1AF7A9AF0();
}

uint64_t OUTLINED_FUNCTION_2_154(uint64_t a1, ...)
{
  va_start(va, a1);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)va);
}

JUMeasurements __swiftcall GKTextView.measure(toFit:with:)(CGSize toFit, UITraitCollection with)
{
  objc_msgSend(v2, sel_sizeThatFits_, toFit.width, toFit.height);
  double v5 = 0.0;
  double v6 = v4;
  result.var3 = v5;
  result.var2 = v6;
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

double sub_1AF79DAE4(UITraitCollection a1, double a2, double a3)
{
  *(void *)&double result = (unint64_t)GKTextView.measure(toFit:with:)((CGSize)__PAIR128__(*(unint64_t *)&a3, *(unint64_t *)&a2), a1);
  return result;
}

uint64_t sub_1AF79DB0C()
{
  type metadata accessor for AchievementsProfileSection();
  uint64_t result = swift_allocObject();
  *(_WORD *)(result + 16) = 257;
  return result;
}

uint64_t sub_1AF79DB38(uint64_t a1)
{
  sub_1AF36EF54(a1, (uint64_t)v97);
  sub_1AF36EF54((uint64_t)v97, (uint64_t)v101);
  uint64_t v2 = sub_1AF7A98F0();
  OUTLINED_FUNCTION_1_6();
  uint64_t v83 = v3;
  MEMORY[0x1F4188790](v4);
  char v82 = (char *)&v71 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  double v8 = (char *)&v71 - v7;
  uint64_t v81 = type metadata accessor for DetailData();
  OUTLINED_FUNCTION_1_14();
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_8_1();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = type metadata accessor for AchievementsByGameAction();
  OUTLINED_FUNCTION_1_14();
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_8_1();
  uint64_t v17 = (uint64_t *)(v16 - v15);
  uint64_t v18 = sub_1AF7AD840();
  MEMORY[0x1F4188790](v18 - 8);
  OUTLINED_FUNCTION_8_1();
  uint64_t v84 = sub_1AF7AD5F0();
  OUTLINED_FUNCTION_1_6();
  uint64_t v20 = v19;
  MEMORY[0x1F4188790](v21);
  OUTLINED_FUNCTION_3_3();
  uint64_t v87 = v22;
  uint64_t v88 = sub_1AF7AD470();
  OUTLINED_FUNCTION_1_6();
  uint64_t v86 = v23;
  MEMORY[0x1F4188790](v24);
  OUTLINED_FUNCTION_3_3();
  uint64_t v85 = v25;
  sub_1AF36EF54(a1, (uint64_t)&v98);
  uint64_t v26 = 0;
  if (sub_1AF36EFBC((uint64_t *)&v98) != 1)
  {
    uint64_t v80 = v20;
    uint64_t v78 = v12;
    double v27 = v98;
    __int16 v28 = v99;
    uint64_t v77 = v100;
    sub_1AF36EF54((uint64_t)v101, (uint64_t)v96);
    sub_1AF36EFD4((uint64_t)v96);
    if ((objc_msgSend(v27, sel_isLocalPlayer) & 1) != 0
      || objc_msgSend(v27, sel_achievementsVisibility) != 2
      && (objc_msgSend(v27, sel_achievementsVisibility) != 1 || (v28 & 0x100) != 0))
    {
      uint64_t v76 = v2;
      uint64_t v71 = a1;
      id v29 = objc_msgSend(self, sel_configurationWithTextStyle_scale_, *MEMORY[0x1E4FB2988], -1);
      id v75 = sub_1AF400718(v29, 1);

      uint64_t v30 = (void *)sub_1AF7AE0A0();
      id v31 = (id)GKGameCenterUIFrameworkBundle();
      id v32 = (id)GKGetLocalizedStringFromTableInBundle();

      uint64_t v33 = sub_1AF7AE0E0();
      uint64_t v73 = v34;
      uint64_t v74 = v33;

      id v35 = (void *)sub_1AF7AE0A0();
      id v36 = (id)GKGameCenterUIFrameworkBundle();
      id v37 = (id)GKGetLocalizedStringFromTableInBundle();

      sub_1AF7AE0E0();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9ACC9B0);
      uint64_t v38 = swift_allocObject();
      long long v79 = xmmword_1AF7CB2D0;
      uint64_t v39 = MEMORY[0x1E4FBB550];
      *(_OWORD *)(v38 + 16) = xmmword_1AF7CB2D0;
      uint64_t v40 = MEMORY[0x1E4FBB5C8];
      *(void *)(v38 + 56) = v39;
      *(void *)(v38 + 64) = v40;
      *(void *)(v38 + 32) = v77;
      uint64_t v77 = sub_1AF7AE0B0();
      uint64_t v72 = v41;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AC7390);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = v79;
      uint64_t v43 = MEMORY[0x1E4FBB1A0];
      *(void *)(inited + 32) = 0x79546E6F69746361;
      *(void *)(inited + 40) = 0xEA00000000006570;
      *(void *)(inited + 72) = v43;
      *(void *)(inited + 48) = 0x657461676976616ELL;
      *(void *)(inited + 56) = 0xE800000000000000;
      uint64_t v44 = sub_1AF7AE000();
      if (qword_1E9AC1F70 != -1) {
        swift_once();
      }
      uint64_t v45 = sub_1AF7AD440();
      uint64_t v46 = __swift_project_value_buffer(v45, (uint64_t)qword_1E9AEF0D0);
      uint64_t v47 = v85;
      MEMORY[0x1B3E81240](0x6D65766569686361, 0xEB00000000746E65, 0x74656C63696863, 0xE700000000000000, v44, v46);
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AC7420);
      uint64_t v48 = v86;
      unint64_t v49 = (*(unsigned __int8 *)(v86 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v86 + 80);
      uint64_t v50 = swift_allocObject();
      *(_OWORD *)(v50 + 16) = v79;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v48 + 16))(v50 + v49, v47, v88);
      sub_1AF7AD830();
      uint64_t v51 = v87;
      sub_1AF7AD5C0();
      id v52 = objc_msgSend(v27, sel_playerID);
      uint64_t v53 = sub_1AF7AE0E0();
      uint64_t v55 = v54;

      uint64_t v56 = v51;
      uint64_t v57 = v84;
      (*(void (**)(char *, uint64_t, uint64_t))(v80 + 16))((char *)v17 + *(int *)(v13 + 24), v56, v84);
      *uint64_t v17 = v53;
      v17[1] = v55;
      v17[2] = (uint64_t)v27;
      long long v93 = 0u;
      long long v94 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      char v95 = -1;
      v90[3] = v13;
      v90[4] = sub_1AF79E42C((unint64_t *)&qword_1E9AC6EF0, (void (*)(uint64_t))type metadata accessor for AchievementsByGameAction);
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v90);
      sub_1AF79E474((uint64_t)v17, (uint64_t)boxed_opaque_existential_1, (void (*)(void))type metadata accessor for AchievementsByGameAction);
      uint64_t v59 = (uint64_t)v75;
      id v60 = v75;
      id v61 = v27;
      sub_1AF7A98E0();
      uint64_t v62 = v83;
      uint64_t v63 = v76;
      (*(void (**)(char *, char *, uint64_t))(v83 + 16))(v82, v8, v76);
      sub_1AF79E42C((unint64_t *)&qword_1E9AC2A40, MEMORY[0x1E4F27990]);
      sub_1AF7AECC0();
      (*(void (**)(char *, uint64_t))(v62 + 8))(v8, v63);
      uint64_t v64 = v78;
      sub_1AF6ADE90((uint64_t)&v89, 1, v74, v73, v77, v72, v59, (uint64_t)&v91, v78, 0, 0, 0, 1u, 0, 0, (uint64_t)v90);
      sub_1AF46499C();
      uint64_t v26 = v65;
      unint64_t v66 = *(void *)(v65 + 16);
      if (v66 >= *(void *)(v65 + 24) >> 1)
      {
        sub_1AF46499C();
        uint64_t v26 = v70;
      }
      uint64_t v67 = v71;
      *((void *)&v92 + 1) = v81;
      *(void *)&long long v93 = sub_1AF79E42C(&qword_1E9AC3710, (void (*)(uint64_t))type metadata accessor for DetailData);
      long long v68 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v91);
      sub_1AF79E474(v64, (uint64_t)v68, (void (*)(void))type metadata accessor for DetailData);
      *(void *)(v26 + 16) = v66 + 1;
      sub_1AF36A288(&v91, v26 + 40 * v66 + 32);
      sub_1AF79E4D4(v64, (void (*)(void))type metadata accessor for DetailData);
      sub_1AF36F09C(v67);

      sub_1AF79E4D4((uint64_t)v17, (void (*)(void))type metadata accessor for AchievementsByGameAction);
      (*(void (**)(uint64_t, uint64_t))(v80 + 8))(v87, v57);
      (*(void (**)(uint64_t, uint64_t))(v86 + 8))(v85, v88);
    }
    else
    {
      sub_1AF36F09C(a1);
      return 0;
    }
  }
  return v26;
}

uint64_t type metadata accessor for AchievementsProfileSection()
{
  return self;
}

uint64_t sub_1AF79E42C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1AF79E474(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1_14();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_1AF79E4D4(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_1_14();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t destroy for EmptyStateViewLayout.Metrics(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  __swift_destroy_boxed_opaque_existential_1(a1 + 120);
  __swift_destroy_boxed_opaque_existential_1(a1 + 160);
  __swift_destroy_boxed_opaque_existential_1(a1 + 200);
  __swift_destroy_boxed_opaque_existential_1(a1 + 240);
  __swift_destroy_boxed_opaque_existential_1(a1 + 280);

  return __swift_destroy_boxed_opaque_existential_1(a1 + 320);
}

uint64_t initializeWithCopy for EmptyStateViewLayout.Metrics(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  long long v6 = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 104) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 80, a2 + 80);
  long long v7 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 144) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 120, a2 + 120);
  long long v8 = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 184) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 160, a2 + 160);
  long long v9 = *(_OWORD *)(a2 + 224);
  *(_OWORD *)(a1 + 224) = v9;
  (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 200, a2 + 200);
  uint64_t v10 = *(void *)(a2 + 264);
  uint64_t v11 = *(void *)(a2 + 272);
  *(void *)(a1 + 264) = v10;
  *(void *)(a1 + 272) = v11;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 240, a2 + 240);
  long long v12 = *(_OWORD *)(a2 + 304);
  *(_OWORD *)(a1 + 304) = v12;
  (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1 + 280, a2 + 280);
  uint64_t v13 = *(void *)(a2 + 344);
  uint64_t v14 = *(void *)(a2 + 352);
  *(void *)(a1 + 344) = v13;
  *(void *)(a1 + 352) = v14;
  (**(void (***)(uint64_t, uint64_t))(v13 - 8))(a1 + 320, a2 + 320);
  return a1;
}

uint64_t *assignWithCopy for EmptyStateViewLayout.Metrics(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

uint64_t assignWithTake for EmptyStateViewLayout.Metrics(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  long long v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  __swift_destroy_boxed_opaque_existential_1(a1 + 120);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  __swift_destroy_boxed_opaque_existential_1(a1 + 160);
  long long v6 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v6;
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  __swift_destroy_boxed_opaque_existential_1(a1 + 200);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  __swift_destroy_boxed_opaque_existential_1(a1 + 240);
  long long v7 = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 240) = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 256) = v7;
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  __swift_destroy_boxed_opaque_existential_1(a1 + 280);
  long long v8 = *(_OWORD *)(a2 + 296);
  *(_OWORD *)(a1 + 280) = *(_OWORD *)(a2 + 280);
  *(_OWORD *)(a1 + 296) = v8;
  *(void *)(a1 + 312) = *(void *)(a2 + 312);
  __swift_destroy_boxed_opaque_existential_1(a1 + 320);
  long long v9 = *(_OWORD *)(a2 + 336);
  *(_OWORD *)(a1 + 320) = *(_OWORD *)(a2 + 320);
  *(_OWORD *)(a1 + 336) = v9;
  *(void *)(a1 + 352) = *(void *)(a2 + 352);
  return a1;
}

uint64_t getEnumTagSinglePayload for EmptyStateViewLayout.Metrics(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 360))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EmptyStateViewLayout.Metrics(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 360) = 1;
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
    *(unsigned char *)(result + 360) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EmptyStateViewLayout.Metrics()
{
  return &type metadata for EmptyStateViewLayout.Metrics;
}

uint64_t destroy for EmptyStateViewLayout(void *a1)
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 5));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 10));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 15));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 20));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 25));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 30));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 35));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 40));
  if (a1[48]) {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 45));
  }
  if (a1[53]) {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 50));
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 55));
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 60));
  if (a1[68])
  {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 65));
  }
  return result;
}

uint64_t initializeWithCopy for EmptyStateViewLayout(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  long long v6 = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 104) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 80, a2 + 80);
  long long v7 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 144) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 120, a2 + 120);
  long long v8 = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 184) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 160, a2 + 160);
  long long v9 = *(_OWORD *)(a2 + 224);
  *(_OWORD *)(a1 + 224) = v9;
  (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 200, a2 + 200);
  uint64_t v10 = *(void *)(a2 + 264);
  uint64_t v11 = *(void *)(a2 + 272);
  *(void *)(a1 + 264) = v10;
  *(void *)(a1 + 272) = v11;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 240, a2 + 240);
  long long v12 = *(_OWORD *)(a2 + 304);
  *(_OWORD *)(a1 + 304) = v12;
  (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1 + 280, a2 + 280);
  uint64_t v13 = *(void *)(a2 + 344);
  uint64_t v14 = *(void *)(a2 + 352);
  *(void *)(a1 + 344) = v13;
  *(void *)(a1 + 352) = v14;
  (**(void (***)(uint64_t, uint64_t))(v13 - 8))(a1 + 320, a2 + 320);
  uint64_t v15 = (_OWORD *)(a1 + 360);
  uint64_t v16 = (_OWORD *)(a2 + 360);
  uint64_t v17 = *(void *)(a2 + 384);
  if (v17)
  {
    uint64_t v18 = *(void *)(a2 + 392);
    *(void *)(a1 + 384) = v17;
    *(void *)(a1 + 392) = v18;
    (**(void (***)(_OWORD *, _OWORD *))(v17 - 8))(v15, v16);
  }
  else
  {
    long long v19 = *(_OWORD *)(a2 + 376);
    *uint64_t v15 = *v16;
    *(_OWORD *)(a1 + 376) = v19;
    *(void *)(a1 + 392) = *(void *)(a2 + 392);
  }
  uint64_t v20 = (_OWORD *)(a1 + 400);
  uint64_t v21 = (_OWORD *)(a2 + 400);
  uint64_t v22 = *(void *)(a2 + 424);
  if (v22)
  {
    uint64_t v23 = *(void *)(a2 + 432);
    *(void *)(a1 + 424) = v22;
    *(void *)(a1 + 432) = v23;
    (**(void (***)(_OWORD *, _OWORD *))(v22 - 8))(v20, v21);
  }
  else
  {
    long long v24 = *(_OWORD *)(a2 + 416);
    *uint64_t v20 = *v21;
    *(_OWORD *)(a1 + 416) = v24;
    *(void *)(a1 + 432) = *(void *)(a2 + 432);
  }
  long long v25 = *(_OWORD *)(a2 + 464);
  *(_OWORD *)(a1 + 464) = v25;
  (**(void (***)(uint64_t, uint64_t))(v25 - 8))(a1 + 440, a2 + 440);
  uint64_t v26 = *(void *)(a2 + 504);
  uint64_t v27 = *(void *)(a2 + 512);
  *(void *)(a1 + 504) = v26;
  *(void *)(a1 + 512) = v27;
  (**(void (***)(uint64_t, uint64_t))(v26 - 8))(a1 + 480, a2 + 480);
  __int16 v28 = (_OWORD *)(a1 + 520);
  id v29 = (_OWORD *)(a2 + 520);
  uint64_t v30 = *(void *)(a2 + 544);
  if (v30)
  {
    *(void *)(a1 + 544) = v30;
    *(void *)(a1 + 552) = *(void *)(a2 + 552);
    (**(void (***)(_OWORD *, _OWORD *))(v30 - 8))(v28, v29);
  }
  else
  {
    long long v31 = *(_OWORD *)(a2 + 536);
    *__int16 v28 = *v29;
    *(_OWORD *)(a1 + 536) = v31;
    *(void *)(a1 + 552) = *(void *)(a2 + 552);
  }
  return a1;
}

uint64_t assignWithCopy for EmptyStateViewLayout(uint64_t a1, uint64_t a2)
{
  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 40), (uint64_t *)(a2 + 40));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 80), (uint64_t *)(a2 + 80));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 120), (uint64_t *)(a2 + 120));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 160), (uint64_t *)(a2 + 160));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 200), (uint64_t *)(a2 + 200));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 240), (uint64_t *)(a2 + 240));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 280), (uint64_t *)(a2 + 280));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 320), (uint64_t *)(a2 + 320));
  uint64_t v4 = *(void *)(a2 + 384);
  if (*(void *)(a1 + 384))
  {
    if (v4)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 360), (uint64_t *)(a2 + 360));
      goto LABEL_8;
    }
    __swift_destroy_boxed_opaque_existential_1(a1 + 360);
  }
  else if (v4)
  {
    *(void *)(a1 + 384) = v4;
    *(void *)(a1 + 392) = *(void *)(a2 + 392);
    (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 360, a2 + 360);
    goto LABEL_8;
  }
  long long v5 = *(_OWORD *)(a2 + 360);
  long long v6 = *(_OWORD *)(a2 + 376);
  *(void *)(a1 + 392) = *(void *)(a2 + 392);
  *(_OWORD *)(a1 + 360) = v5;
  *(_OWORD *)(a1 + 376) = v6;
LABEL_8:
  uint64_t v7 = *(void *)(a2 + 424);
  if (*(void *)(a1 + 424))
  {
    if (v7)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 400), (uint64_t *)(a2 + 400));
      goto LABEL_15;
    }
    __swift_destroy_boxed_opaque_existential_1(a1 + 400);
  }
  else if (v7)
  {
    *(void *)(a1 + 424) = v7;
    *(void *)(a1 + 432) = *(void *)(a2 + 432);
    (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 400, a2 + 400);
    goto LABEL_15;
  }
  long long v8 = *(_OWORD *)(a2 + 400);
  long long v9 = *(_OWORD *)(a2 + 416);
  *(void *)(a1 + 432) = *(void *)(a2 + 432);
  *(_OWORD *)(a1 + 400) = v8;
  *(_OWORD *)(a1 + 416) = v9;
LABEL_15:
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 440), (uint64_t *)(a2 + 440));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 480), (uint64_t *)(a2 + 480));
  uint64_t v10 = *(void *)(a2 + 544);
  if (!*(void *)(a1 + 544))
  {
    if (v10)
    {
      *(void *)(a1 + 544) = v10;
      *(void *)(a1 + 552) = *(void *)(a2 + 552);
      (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 520, a2 + 520);
      return a1;
    }
LABEL_21:
    long long v11 = *(_OWORD *)(a2 + 520);
    long long v12 = *(_OWORD *)(a2 + 536);
    *(void *)(a1 + 552) = *(void *)(a2 + 552);
    *(_OWORD *)(a1 + 520) = v11;
    *(_OWORD *)(a1 + 536) = v12;
    return a1;
  }
  if (!v10)
  {
    __swift_destroy_boxed_opaque_existential_1(a1 + 520);
    goto LABEL_21;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 520), (uint64_t *)(a2 + 520));
  return a1;
}

void *__swift_memcpy560_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x230uLL);
}

uint64_t assignWithTake for EmptyStateViewLayout(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  long long v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  __swift_destroy_boxed_opaque_existential_1(a1 + 120);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  __swift_destroy_boxed_opaque_existential_1(a1 + 160);
  long long v6 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v6;
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  __swift_destroy_boxed_opaque_existential_1(a1 + 200);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  __swift_destroy_boxed_opaque_existential_1(a1 + 240);
  long long v7 = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 240) = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 256) = v7;
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  __swift_destroy_boxed_opaque_existential_1(a1 + 280);
  long long v8 = *(_OWORD *)(a2 + 296);
  *(_OWORD *)(a1 + 280) = *(_OWORD *)(a2 + 280);
  *(_OWORD *)(a1 + 296) = v8;
  *(void *)(a1 + 312) = *(void *)(a2 + 312);
  __swift_destroy_boxed_opaque_existential_1(a1 + 320);
  long long v9 = *(_OWORD *)(a2 + 336);
  *(_OWORD *)(a1 + 320) = *(_OWORD *)(a2 + 320);
  *(_OWORD *)(a1 + 336) = v9;
  *(void *)(a1 + 352) = *(void *)(a2 + 352);
  if (*(void *)(a1 + 384)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 360);
  }
  long long v10 = *(_OWORD *)(a2 + 376);
  *(_OWORD *)(a1 + 360) = *(_OWORD *)(a2 + 360);
  *(_OWORD *)(a1 + 376) = v10;
  *(void *)(a1 + 392) = *(void *)(a2 + 392);
  if (*(void *)(a1 + 424)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 400);
  }
  long long v11 = *(_OWORD *)(a2 + 416);
  *(_OWORD *)(a1 + 400) = *(_OWORD *)(a2 + 400);
  *(_OWORD *)(a1 + 416) = v11;
  *(void *)(a1 + 432) = *(void *)(a2 + 432);
  __swift_destroy_boxed_opaque_existential_1(a1 + 440);
  long long v12 = *(_OWORD *)(a2 + 456);
  *(_OWORD *)(a1 + 440) = *(_OWORD *)(a2 + 440);
  *(_OWORD *)(a1 + 456) = v12;
  *(void *)(a1 + 472) = *(void *)(a2 + 472);
  __swift_destroy_boxed_opaque_existential_1(a1 + 480);
  long long v13 = *(_OWORD *)(a2 + 496);
  *(_OWORD *)(a1 + 480) = *(_OWORD *)(a2 + 480);
  *(_OWORD *)(a1 + 496) = v13;
  *(void *)(a1 + 512) = *(void *)(a2 + 512);
  if (*(void *)(a1 + 544)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 520);
  }
  *(void *)(a1 + 552) = *(void *)(a2 + 552);
  long long v14 = *(_OWORD *)(a2 + 536);
  *(_OWORD *)(a1 + 520) = *(_OWORD *)(a2 + 520);
  *(_OWORD *)(a1 + 536) = v14;
  return a1;
}

uint64_t getEnumTagSinglePayload for EmptyStateViewLayout(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 560))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EmptyStateViewLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 552) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 536) = 0u;
    *(_OWORD *)(result + 520) = 0u;
    *(_OWORD *)(result + 504) = 0u;
    *(_OWORD *)(result + 488) = 0u;
    *(_OWORD *)(result + 472) = 0u;
    *(_OWORD *)(result + 456) = 0u;
    *(_OWORD *)(result + 440) = 0u;
    *(_OWORD *)(result + 424) = 0u;
    *(_OWORD *)(result + 408) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 560) = 1;
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
    *(unsigned char *)(result + 560) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EmptyStateViewLayout()
{
  return &type metadata for EmptyStateViewLayout;
}

uint64_t sub_1AF79F55C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>)
{
  long long v7 = v6;
  uint64_t v137 = a1;
  uint64_t v136 = sub_1AF7AEFA0();
  OUTLINED_FUNCTION_1_6();
  uint64_t v135 = v13;
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_7_27(v15);
  uint64_t v144 = sub_1AF7AAAE0();
  OUTLINED_FUNCTION_1_6();
  uint64_t v146 = v16;
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_7_27(v18);
  uint64_t v142 = sub_1AF7AAAF0();
  OUTLINED_FUNCTION_1_6();
  uint64_t v20 = v19;
  MEMORY[0x1F4188790](v21);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_7_27(v22);
  uint64_t v140 = sub_1AF7AAA80();
  OUTLINED_FUNCTION_1_6();
  uint64_t v149 = v23;
  MEMORY[0x1F4188790](v24);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_7_27(v25);
  uint64_t v139 = sub_1AF7AAB20();
  OUTLINED_FUNCTION_1_6();
  uint64_t v145 = v26;
  MEMORY[0x1F4188790](v27);
  char v112 = (char *)v111 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v29);
  OUTLINED_FUNCTION_7_27((uint64_t)v111 - v30);
  uint64_t v114 = sub_1AF7AAB40();
  OUTLINED_FUNCTION_1_6();
  uint64_t v113 = v31;
  MEMORY[0x1F4188790](v32);
  OUTLINED_FUNCTION_3_3();
  uint64_t v147 = v33;
  sub_1AF7AAB00();
  uint64_t v34 = (uint64_t)(v6 + 45);
  sub_1AF36BB0C((uint64_t)(v6 + 45), (uint64_t)&v156);
  uint64_t v35 = MEMORY[0x1E4F71B20];
  id v36 = (int *)MEMORY[0x1E4F71B38];
  uint64_t v148 = v20;
  uint64_t v115 = a2;
  if (*((void *)&v157 + 1))
  {
    if ((OUTLINED_FUNCTION_11_74() & 1) == 0)
    {
      uint64_t v158 = 0;
      long long v156 = 0u;
      long long v157 = 0u;
      uint64_t v37 = OUTLINED_FUNCTION_4_127();
      v38(v37);
      uint64_t v39 = OUTLINED_FUNCTION_6_84();
      v40(v39);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9ACA710);
      uint64_t v41 = OUTLINED_FUNCTION_12_64();
      *(_OWORD *)(v41 + 16) = xmmword_1AF7CB2D0;
      sub_1AF7AAAB0();
      *(void *)&long long v153 = v41;
      sub_1AF36CCD0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACA720);
      sub_1AF36CD20();
      OUTLINED_FUNCTION_8_87();
      sub_1AF7AAB10();
      uint64_t v34 = v35;
      OUTLINED_FUNCTION_18_0();
      v42();
      uint64_t v20 = v148;
      OUTLINED_FUNCTION_18_0();
      v43();
      uint64_t v35 = MEMORY[0x1E4F71B20];
      id v36 = (int *)MEMORY[0x1E4F71B38];
      OUTLINED_FUNCTION_18_0();
      v44();
      sub_1AF3A4630((uint64_t)&v156, (uint64_t *)&unk_1E9ACA700);
      OUTLINED_FUNCTION_21_47();
      uint64_t v45 = OUTLINED_FUNCTION_16_53();
      v46(v45);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v159);
  }
  else
  {
    sub_1AF3A4630((uint64_t)&v156, &qword_1E9AC47D0);
  }
  sub_1AF36BB0C((uint64_t)(v7 + 50), (uint64_t)&v156);
  if (*((void *)&v157 + 1))
  {
    if ((OUTLINED_FUNCTION_11_74() & 1) == 0)
    {
      *((void *)&v157 + 1) = MEMORY[0x1E4FBB3D0];
      uint64_t v158 = MEMORY[0x1E4F71D78];
      *(void *)&long long v156 = 0;
      sub_1AF36BAA8((uint64_t)(v7 + 5), (uint64_t)&v153);
      uint64_t v47 = OUTLINED_FUNCTION_4_127();
      v48(v47);
      uint64_t v49 = OUTLINED_FUNCTION_6_84();
      v50(v49);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9ACA710);
      uint64_t v51 = OUTLINED_FUNCTION_12_64();
      *(_OWORD *)(v51 + 16) = xmmword_1AF7CB2D0;
      sub_1AF7AAAB0();
      uint64_t v150 = v51;
      sub_1AF36CCD0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACA720);
      sub_1AF36CD20();
      OUTLINED_FUNCTION_8_87();
      sub_1AF7AAB10();
      uint64_t v34 = v35;
      OUTLINED_FUNCTION_18_0();
      v52();
      uint64_t v20 = v148;
      OUTLINED_FUNCTION_18_0();
      v53();
      id v36 = (int *)MEMORY[0x1E4F71B38];
      OUTLINED_FUNCTION_18_0();
      v54();
      sub_1AF3A4630((uint64_t)&v153, (uint64_t *)&unk_1E9ACA700);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v156);
      OUTLINED_FUNCTION_21_47();
      uint64_t v55 = OUTLINED_FUNCTION_16_53();
      v56(v55);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v159);
  }
  else
  {
    sub_1AF3A4630((uint64_t)&v156, &qword_1E9AC47D0);
  }
  sub_1AF36BB0C(v34, (uint64_t)&v159);
  if (v160)
  {
    __swift_project_boxed_opaque_existential_1(&v159, v160);
    char v57 = sub_1AF7AA530();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v159);
    if ((v57 & 1) == 0)
    {
      uint64_t v58 = (uint64_t)(v7 + 10);
      goto LABEL_16;
    }
  }
  else
  {
    sub_1AF3A4630((uint64_t)&v159, &qword_1E9AC47D0);
  }
  uint64_t v58 = (uint64_t)(v7 + 15);
LABEL_16:
  sub_1AF36BAA8(v58, (uint64_t)&v159);
  __swift_project_boxed_opaque_existential_1(v7 + 55, v7[58]);
  OUTLINED_FUNCTION_25_32();
  OUTLINED_FUNCTION_5_19();
  OUTLINED_FUNCTION_8_13();
  v59();
  uint64_t v155 = 0;
  long long v154 = 0u;
  long long v153 = 0u;
  uint64_t v60 = v149;
  uint64_t v61 = *(void *)(v149 + 104);
  v111[1] = *MEMORY[0x1E4F71B18];
  uint64_t v134 = v149 + 104;
  uint64_t v133 = v61;
  OUTLINED_FUNCTION_19_0();
  v62();
  uint64_t v63 = v20 + 104;
  uint64_t v64 = *(void *)(v20 + 104);
  uint64_t v65 = v141;
  int v132 = *v36;
  uint64_t v66 = v142;
  uint64_t v131 = v63;
  uint64_t v130 = v64;
  OUTLINED_FUNCTION_19_0();
  v67();
  uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9ACA710);
  uint64_t v69 = v146;
  uint64_t v70 = *(void *)(v146 + 72);
  uint64_t v71 = *(unsigned __int8 *)(v146 + 80);
  uint64_t v72 = (v71 + 32) & ~v71;
  uint64_t v127 = v68;
  uint64_t v126 = v72 + 3 * v70;
  uint64_t v125 = v71 | 7;
  uint64_t v73 = swift_allocObject();
  long long v123 = xmmword_1AF7CCEC0;
  *(_OWORD *)(v73 + 16) = xmmword_1AF7CCEC0;
  uint64_t v128 = v72;
  sub_1AF7AAAC0();
  sub_1AF7AAAB0();
  uint64_t v122 = 2 * v70;
  uint64_t v129 = v70;
  sub_1AF7AAAD0();
  uint64_t v150 = v73;
  unint64_t v74 = sub_1AF36CCD0();
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACA720);
  unint64_t v76 = sub_1AF36CD20();
  uint64_t v77 = v143;
  uint64_t v121 = v75;
  unint64_t v120 = v76;
  uint64_t v78 = v144;
  unint64_t v124 = v74;
  sub_1AF7AEBA0();
  uint64_t v79 = v138;
  sub_1AF7AAB10();
  uint64_t v80 = *(void (**)(void, void))(v69 + 8);
  uint64_t v146 = v69 + 8;
  uint64_t v119 = v80;
  v80(v77, v78);
  uint64_t v81 = *(void (**)(void, void))(v148 + 8);
  v148 += 8;
  uint64_t v118 = v81;
  v81(v65, v66);
  uint64_t v82 = *(void *)(v60 + 8);
  uint64_t v149 = v60 + 8;
  uint64_t v117 = v82;
  OUTLINED_FUNCTION_15_0();
  v83();
  sub_1AF3A4630((uint64_t)&v153, (uint64_t *)&unk_1E9ACA700);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v156);
  OUTLINED_FUNCTION_21_47();
  id v116 = *(void (**)(uint64_t, uint64_t))(v145 + 8);
  v145 += 8;
  v116(v79, v139);
  __swift_project_boxed_opaque_existential_1(v7 + 60, v7[63]);
  OUTLINED_FUNCTION_25_32();
  OUTLINED_FUNCTION_5_19();
  OUTLINED_FUNCTION_8_13();
  v84();
  sub_1AF36BAA8((uint64_t)(v7 + 20), (uint64_t)&v153);
  sub_1AF36BB0C((uint64_t)(v7 + 65), (uint64_t)&v150);
  uint64_t v85 = v151;
  sub_1AF3A4630((uint64_t)&v150, &qword_1E9AC47D0);
  if (v85)
  {
    uint64_t v151 = sub_1AF7AA790();
    uint64_t v152 = MEMORY[0x1E4F71A48];
    __swift_allocate_boxed_opaque_existential_1(&v150);
    sub_1AF7AA780();
  }
  else
  {
    sub_1AF36BAA8((uint64_t)(v7 + 35), (uint64_t)&v150);
  }
  OUTLINED_FUNCTION_19_0();
  v86();
  OUTLINED_FUNCTION_18_41();
  OUTLINED_FUNCTION_19_0();
  v87();
  uint64_t v88 = (__n128 *)OUTLINED_FUNCTION_19_37();
  OUTLINED_FUNCTION_17_52(v88);
  sub_1AF7AAAC0();
  sub_1AF7AAAB0();
  sub_1AF7AAAD0();
  OUTLINED_FUNCTION_24_30();
  OUTLINED_FUNCTION_9_80();
  sub_1AF7AAB10();
  OUTLINED_FUNCTION_18_0();
  v89();
  OUTLINED_FUNCTION_15_0();
  v90();
  OUTLINED_FUNCTION_18_0();
  v91();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v153);
  sub_1AF3A4630((uint64_t)&v150, (uint64_t *)&unk_1E9ACA700);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v156);
  OUTLINED_FUNCTION_21_47();
  OUTLINED_FUNCTION_15_61();
  v92();
  sub_1AF36BB0C((uint64_t)(v7 + 65), (uint64_t)&v153);
  if (*((void *)&v154 + 1))
  {
    sub_1AF36A288(&v153, (uint64_t)&v156);
    __swift_project_boxed_opaque_existential_1(&v156, *((uint64_t *)&v157 + 1));
    if ((sub_1AF7AA530() & 1) == 0)
    {
      __swift_project_boxed_opaque_existential_1(&v156, *((uint64_t *)&v157 + 1));
      sub_1AF7AA580();
      uint64_t v93 = v7[33];
      uint64_t v94 = v7[34];
      __swift_project_boxed_opaque_existential_1(v7 + 30, v93);
      sub_1AF6A1DAC(v93, v94);
      sub_1AF7AA630();
      OUTLINED_FUNCTION_18_0();
      v95();
      v161.origin.x = a3;
      v161.origin.y = a4;
      v161.size.width = a5;
      v161.size.height = a6;
      CGRectGetWidth(v161);
      __swift_project_boxed_opaque_existential_1(&v156, *((uint64_t *)&v157 + 1));
      sub_1AF7AA550();
      sub_1AF36BAA8((uint64_t)(v7 + 35), (uint64_t)&v150);
      OUTLINED_FUNCTION_19_0();
      v96();
      OUTLINED_FUNCTION_18_41();
      OUTLINED_FUNCTION_19_0();
      v97();
      uint64_t v98 = (__n128 *)OUTLINED_FUNCTION_19_37();
      OUTLINED_FUNCTION_17_52(v98);
      sub_1AF7AAAC0();
      sub_1AF7AAAB0();
      sub_1AF7AAAD0();
      OUTLINED_FUNCTION_24_30();
      OUTLINED_FUNCTION_9_80();
      sub_1AF7AAB10();
      OUTLINED_FUNCTION_18_0();
      v99();
      OUTLINED_FUNCTION_15_0();
      v100();
      OUTLINED_FUNCTION_18_0();
      v101();
      sub_1AF3A4630((uint64_t)&v150, (uint64_t *)&unk_1E9ACA700);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v153);
      OUTLINED_FUNCTION_21_47();
      OUTLINED_FUNCTION_15_61();
      v102();
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v156);
  }
  else
  {
    sub_1AF3A4630((uint64_t)&v153, &qword_1E9AC47D0);
  }
  if (qword_1E9AC2480 != -1) {
    swift_once();
  }
  uint64_t v103 = sub_1AF7AA990();
  __swift_project_value_buffer(v103, (uint64_t)qword_1E9AEFA48);
  sub_1AF7AA980();
  uint64_t v104 = v7[43];
  uint64_t v105 = v7[44];
  __swift_project_boxed_opaque_existential_1(v7 + 40, v104);
  sub_1AF6A1DAC(v104, v105);
  sub_1AF7AA630();
  id v106 = *(void (**)(void))(v135 + 8);
  OUTLINED_FUNCTION_15_0();
  v106();
  sub_1AF7AA980();
  uint64_t v107 = v7[43];
  uint64_t v108 = v7[44];
  __swift_project_boxed_opaque_existential_1(v7 + 40, v107);
  sub_1AF6A1DAC(v107, v108);
  sub_1AF7AA630();
  OUTLINED_FUNCTION_15_0();
  v106();
  sub_1AF7AE8A0();
  uint64_t v109 = v147;
  sub_1AF7AAAA0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v159);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v113 + 8))(v109, v114);
}

double sub_1AF7A04D0(uint64_t a1)
{
  swift_getObjectType();

  return sub_1AF7A0528(a1, v1);
}

double sub_1AF7A0528(uint64_t a1, void *a2)
{
  v35[1] = a1;
  uint64_t v3 = sub_1AF7AA910();
  OUTLINED_FUNCTION_1_6();
  uint64_t v5 = v4;
  MEMORY[0x1F4188790](v6);
  long long v8 = (char *)v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1AF7AA940();
  OUTLINED_FUNCTION_1_6();
  uint64_t v11 = v10;
  __n128 v13 = MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t, __n128))(v5 + 104))(v8, *MEMORY[0x1E4F71AD8], v3, v13);
  sub_1AF7AA920();
  sub_1AF36BAA8((uint64_t)a2, (uint64_t)&v39);
  uint64_t v16 = sub_1AF7AACD0();
  uint64_t v43 = v16;
  uint64_t v44 = MEMORY[0x1E4F71C30];
  __swift_allocate_boxed_opaque_existential_1(v42);
  sub_1AF7AACE0();
  sub_1AF7AA930();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
  sub_1AF36BB0C((uint64_t)(a2 + 45), (uint64_t)&v39);
  if (v40)
  {
    if ((OUTLINED_FUNCTION_5_83() & 1) == 0)
    {
      __swift_project_boxed_opaque_existential_1(v42, v43);
      OUTLINED_FUNCTION_6_73();
      OUTLINED_FUNCTION_5_19();
      OUTLINED_FUNCTION_8_13();
      v17();
      OUTLINED_FUNCTION_14_50();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v39);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
  }
  else
  {
    sub_1AF3A4630((uint64_t)&v39, &qword_1E9AC47D0);
  }
  sub_1AF36BB0C((uint64_t)(a2 + 50), (uint64_t)&v39);
  if (v40)
  {
    if ((OUTLINED_FUNCTION_5_83() & 1) == 0)
    {
      __swift_project_boxed_opaque_existential_1(v42, v43);
      OUTLINED_FUNCTION_6_73();
      OUTLINED_FUNCTION_5_19();
      OUTLINED_FUNCTION_8_13();
      v18();
      OUTLINED_FUNCTION_14_50();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v39);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
  }
  else
  {
    sub_1AF3A4630((uint64_t)&v39, &qword_1E9AC47D0);
  }
  __swift_project_boxed_opaque_existential_1(a2 + 55, a2[58]);
  char v19 = sub_1AF7AA4F0();
  uint64_t v20 = MEMORY[0x1E4F71A48];
  uint64_t v21 = MEMORY[0x1E4F71C50];
  if (v19)
  {
    sub_1AF36BB0C((uint64_t)(a2 + 45), (uint64_t)v42);
    if (v43)
    {
      __swift_project_boxed_opaque_existential_1(v42, v43);
      char v22 = sub_1AF7AA530();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
      if ((v22 & 1) == 0)
      {
        uint64_t v23 = (uint64_t)(a2 + 10);
LABEL_17:
        sub_1AF36BAA8(v23, (uint64_t)v42);
        uint64_t v24 = a2[58];
        uint64_t v25 = a2[59];
        __swift_project_boxed_opaque_existential_1(a2 + 55, v24);
        v38[3] = v24;
        v38[4] = *(void *)(*(void *)(v25 + 8) + 8);
        __swift_allocate_boxed_opaque_existential_1(v38);
        OUTLINED_FUNCTION_5_19();
        OUTLINED_FUNCTION_8_13();
        v26();
        sub_1AF36BAA8((uint64_t)v42, (uint64_t)v37);
        v36[3] = sub_1AF7AA790();
        v36[4] = v20;
        __swift_allocate_boxed_opaque_existential_1(v36);
        sub_1AF7AA780();
        uint64_t v40 = sub_1AF7AAD20();
        uint64_t v21 = MEMORY[0x1E4F71C50];
        uint64_t v41 = MEMORY[0x1E4F71C50];
        __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v39);
        sub_1AF7AAD10();
        OUTLINED_FUNCTION_14_50();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v39);
        goto LABEL_18;
      }
    }
    else
    {
      sub_1AF3A4630((uint64_t)v42, &qword_1E9AC47D0);
    }
    uint64_t v23 = (uint64_t)(a2 + 15);
    goto LABEL_17;
  }
LABEL_18:
  __swift_project_boxed_opaque_existential_1(a2 + 60, a2[63]);
  if (sub_1AF7AA4F0())
  {
    uint64_t v27 = a2[63];
    uint64_t v28 = a2[64];
    __swift_project_boxed_opaque_existential_1(a2 + 60, v27);
    uint64_t v40 = v27;
    uint64_t v41 = *(void *)(*(void *)(v28 + 8) + 8);
    __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v39);
    OUTLINED_FUNCTION_5_19();
    OUTLINED_FUNCTION_8_13();
    v29();
    sub_1AF36BAA8((uint64_t)(a2 + 20), (uint64_t)v38);
    v37[3] = sub_1AF7AA790();
    v37[4] = v20;
    __swift_allocate_boxed_opaque_existential_1(v37);
    sub_1AF7AA780();
    uint64_t v43 = sub_1AF7AAD20();
    uint64_t v44 = v21;
    __swift_allocate_boxed_opaque_existential_1(v42);
    sub_1AF7AAD10();
    sub_1AF7AA930();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
  }
  sub_1AF36BB0C((uint64_t)(a2 + 65), (uint64_t)&v39);
  if (!v40)
  {
    sub_1AF3A4630((uint64_t)&v39, &qword_1E9AC47D0);
    goto LABEL_26;
  }
  sub_1AF36A288(&v39, (uint64_t)v42);
  OUTLINED_FUNCTION_18_40();
  if ((sub_1AF7AA530() & 1) != 0 || (OUTLINED_FUNCTION_18_40(), (sub_1AF7AA4F0() & 1) == 0))
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
LABEL_26:
    uint64_t v30 = MEMORY[0x1E4F71C30];
    goto LABEL_27;
  }
  sub_1AF36BAA8((uint64_t)(a2 + 25), (uint64_t)v38);
  uint64_t v40 = v16;
  uint64_t v30 = MEMORY[0x1E4F71C30];
  uint64_t v41 = MEMORY[0x1E4F71C30];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v39);
  sub_1AF7AACE0();
  OUTLINED_FUNCTION_14_50();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v39);
  __swift_project_boxed_opaque_existential_1(v42, v43);
  OUTLINED_FUNCTION_6_73();
  OUTLINED_FUNCTION_5_19();
  OUTLINED_FUNCTION_8_13();
  v31();
  OUTLINED_FUNCTION_14_50();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v39);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
LABEL_27:
  sub_1AF36BAA8((uint64_t)(a2 + 35), (uint64_t)&v39);
  uint64_t v43 = v16;
  uint64_t v44 = v30;
  __swift_allocate_boxed_opaque_existential_1(v42);
  sub_1AF7AACE0();
  sub_1AF7AA930();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
  sub_1AF7AA900();
  double v33 = v32;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v15, v9);
  return v33;
}

uint64_t OUTLINED_FUNCTION_4_127()
{
  return *(void *)(v0 - 432);
}

uint64_t OUTLINED_FUNCTION_6_84()
{
  return *(void *)(v0 - 408);
}

uint64_t OUTLINED_FUNCTION_8_87()
{
  return sub_1AF7AEBA0();
}

uint64_t OUTLINED_FUNCTION_9_80()
{
  return sub_1AF7AEBA0();
}

uint64_t OUTLINED_FUNCTION_11_74()
{
  sub_1AF36A288((long long *)(v0 - 240), v0 - 192);
  __swift_project_boxed_opaque_existential_1((void *)(v0 - 192), *(void *)(v0 - 168));
  return sub_1AF7AA530();
}

uint64_t OUTLINED_FUNCTION_12_64()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_16_53()
{
  return v0;
}

__n128 OUTLINED_FUNCTION_17_52(__n128 *a1)
{
  __n128 result = *(__n128 *)(v1 - 576);
  a1[1] = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_18_41()
{
  return *(void *)(v0 - 408);
}

uint64_t OUTLINED_FUNCTION_19_37()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_21_47()
{
  return sub_1AF7AAB30();
}

uint64_t OUTLINED_FUNCTION_24_30()
{
  *(void *)(v1 - 336) = v0;
  return v1 - 336;
}

uint64_t *OUTLINED_FUNCTION_25_32()
{
  *(void *)(v2 - 216) = v0;
  *(void *)(v2 - 208) = *(void *)(v1 + 8);
  return __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v2 - 240));
}

uint64_t ActivityFeedLockupViewModel.init(avatarImages:avatarActionURL:body:bodyActionURL:accessibilityLabel:supplementaryViewImage:supplementaryViewActionURL:supplementaryViewArtworkStyle:adamID:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, __n128 *a8@<X7>, uint64_t a9@<X8>, uint64_t a10, char *a11, uint64_t a12, uint64_t a13)
{
  __n128 v29 = *a8;
  unint64_t v19 = a8[1].n128_u64[0];
  unint64_t v20 = a8[1].n128_u64[1];
  unsigned __int8 v21 = a8[2].n128_u8[0];
  char v31 = *a11;
  sub_1AF7A98E0();
  char v22 = (int *)type metadata accessor for ActivityFeedLockupViewModel();
  *(void *)(a9 + v22[5]) = a1;
  sub_1AF64BFE8(a2, a9 + v22[6]);
  uint64_t v23 = (void *)(a9 + v22[7]);
  *uint64_t v23 = a3;
  v23[1] = a4;
  sub_1AF64BFE8(a5, a9 + v22[8]);
  uint64_t v24 = (void *)(a9 + v22[9]);
  *uint64_t v24 = a6;
  v24[1] = a7;
  OUTLINED_FUNCTION_8_88((__n128 *)(a9 + v22[10]), v29);
  *(void *)(v25 + 16) = v19;
  *(void *)(v25 + 24) = v20;
  *(unsigned char *)(v25 + 32) = v21;
  uint64_t result = sub_1AF64BFE8(v26, a9 + v22[11]);
  *(unsigned char *)(a9 + v22[12]) = v31;
  uint64_t v28 = (void *)(a9 + v22[13]);
  *uint64_t v28 = a12;
  v28[1] = a13;
  *(unsigned char *)(a9 + v22[14]) = 0;
  return result;
}

uint64_t ActivityFeedLockupViewModel.hash(into:)()
{
  sub_1AF7A98F0();
  sub_1AF7A163C((unint64_t *)&qword_1E9AC2A40, MEMORY[0x1E4F27990]);

  return sub_1AF7AE030();
}

uint64_t ActivityFeedLockupViewModel.id.getter()
{
  sub_1AF7A98F0();
  uint64_t v0 = OUTLINED_FUNCTION_21_2();

  return v1(v0);
}

uint64_t ActivityFeedLockupViewModel.avatarImages.getter()
{
  type metadata accessor for ActivityFeedLockupViewModel();

  return swift_bridgeObjectRetain();
}

uint64_t ActivityFeedLockupViewModel.avatarActionURL.getter()
{
  uint64_t v2 = v1 + *(int *)(OUTLINED_FUNCTION_2_155() + 24);

  return sub_1AF3AE99C(v2, v0);
}

uint64_t ActivityFeedLockupViewModel.body.getter()
{
  return OUTLINED_FUNCTION_21_2();
}

uint64_t ActivityFeedLockupViewModel.bodyActionURL.getter()
{
  uint64_t v2 = v1 + *(int *)(OUTLINED_FUNCTION_2_155() + 32);

  return sub_1AF3AE99C(v2, v0);
}

uint64_t ActivityFeedLockupViewModel.accessibilityLabel.getter()
{
  return OUTLINED_FUNCTION_21_2();
}

id ActivityFeedLockupViewModel.supplementaryViewImage.getter()
{
  uint64_t v2 = v1 + *(int *)(OUTLINED_FUNCTION_2_155() + 40);
  uint64_t v3 = *(void **)v2;
  uint64_t v4 = *(void *)(v2 + 8);
  uint64_t v5 = *(void *)(v2 + 16);
  uint64_t v6 = *(void *)(v2 + 24);
  *(void *)uint64_t v0 = *(void *)v2;
  *(void *)(v0 + 8) = v4;
  *(void *)(v0 + 16) = v5;
  *(void *)(v0 + 24) = v6;
  char v7 = *(unsigned char *)(v2 + 32);
  *(unsigned char *)(v0 + 32) = v7;

  return sub_1AF776A50(v3, v4, v5, v6, v7);
}

uint64_t ActivityFeedLockupViewModel.supplementaryViewActionURL.getter()
{
  uint64_t v2 = v1 + *(int *)(OUTLINED_FUNCTION_2_155() + 44);

  return sub_1AF3AE99C(v2, v0);
}

uint64_t ActivityFeedLockupViewModel.supplementaryViewArtworkStyle.getter()
{
  uint64_t result = OUTLINED_FUNCTION_2_155();
  unsigned char *v0 = *(unsigned char *)(v1 + *(int *)(result + 48));
  return result;
}

uint64_t ActivityFeedLockupViewModel.adamID.getter()
{
  return OUTLINED_FUNCTION_21_2();
}

uint64_t ActivityFeedLockupViewModel.isArcade.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ActivityFeedLockupViewModel() + 56));
}

uint64_t ActivityFeedLockupViewModel.init(avatarImages:avatarActionURL:body:bodyActionURL:supplementaryViewImage:supplementaryViewActionURL:supplementaryViewArtworkStyle:adamID:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_9_81(a1, a2, a3, a4, a5, a6);
  uint64_t v18 = *(void *)(v16 + 16);
  uint64_t v17 = *(void *)(v16 + 24);
  char v19 = *(unsigned char *)(v16 + 32);
  char v28 = *v20;
  sub_1AF7A98E0();
  unsigned __int8 v21 = (int *)type metadata accessor for ActivityFeedLockupViewModel();
  *(void *)(a8 + v21[5]) = a1;
  sub_1AF64BFE8(a2, a8 + v21[6]);
  char v22 = (uint64_t *)(a8 + v21[7]);
  *char v22 = a3;
  v22[1] = a4;
  sub_1AF64BFE8(a5, a8 + v21[8]);
  uint64_t v23 = (uint64_t *)(a8 + v21[9]);
  *uint64_t v23 = a3;
  v23[1] = a4;
  OUTLINED_FUNCTION_8_88((__n128 *)(a8 + v21[10]), v27);
  *(void *)(v24 + 16) = v18;
  *(void *)(v24 + 24) = v17;
  *(unsigned char *)(v24 + 32) = v19;
  sub_1AF64BFE8(a7, a8 + v21[11]);
  *(unsigned char *)(a8 + v21[12]) = v28;
  uint64_t v25 = (void *)(a8 + v21[13]);
  void *v25 = v29;
  v25[1] = a10;
  *(unsigned char *)(a8 + v21[14]) = 0;

  return swift_bridgeObjectRetain();
}

uint64_t ActivityFeedLockupViewModel.init(avatarImages:avatarActionURL:body:bodyActionURL:supplementaryViewImage:supplementaryViewActionURL:adamID:isArcade:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  OUTLINED_FUNCTION_5_99();
  OUTLINED_FUNCTION_9_81(v15, v16, v17, v18, v19, v20);
  uint64_t v23 = *(void *)(v21 + 16);
  uint64_t v22 = *(void *)(v21 + 24);
  sub_1AF7A98E0();
  uint64_t v24 = type metadata accessor for ActivityFeedLockupViewModel();
  OUTLINED_FUNCTION_1_167(v24);
  uint64_t v25 = (void *)(v10 + v12[7]);
  void *v25 = v11;
  v25[1] = a4;
  sub_1AF64BFE8(a5, v10 + v12[8]);
  uint64_t v26 = (void *)(v10 + v12[9]);
  *uint64_t v26 = v11;
  v26[1] = a4;
  OUTLINED_FUNCTION_8_88((__n128 *)(v10 + v12[10]), v30);
  *(void *)(v27 + 16) = v23;
  *(void *)(v27 + 24) = v22;
  OUTLINED_FUNCTION_7_80(v27, v31, v32, a7);
  OUTLINED_FUNCTION_3_135();
  *char v28 = a8;
  v28[1] = v34;
  *(unsigned char *)(v10 + v12[14]) = a10;

  return swift_bridgeObjectRetain();
}

uint64_t ActivityFeedLockupViewModel.init(avatarImages:avatarActionURL:body:bodyActionURL:supplementaryViewImage:supplementaryViewActionURL:isArcade:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  OUTLINED_FUNCTION_5_99();
  __n128 v22 = *v13;
  unint64_t v15 = v13[1].n128_u64[0];
  unint64_t v14 = v13[1].n128_u64[1];
  sub_1AF7A98E0();
  uint64_t v16 = type metadata accessor for ActivityFeedLockupViewModel();
  OUTLINED_FUNCTION_1_167(v16);
  uint64_t v17 = (void *)(v8 + v10[7]);
  *uint64_t v17 = v9;
  v17[1] = a4;
  sub_1AF64BFE8(a5, v8 + v10[8]);
  uint64_t v18 = (void *)(v8 + v10[9]);
  *uint64_t v18 = v9;
  v18[1] = a4;
  OUTLINED_FUNCTION_8_88((__n128 *)(v8 + v10[10]), v22);
  *(void *)(v19 + 16) = v15;
  *(void *)(v19 + 24) = v14;
  OUTLINED_FUNCTION_7_80(v19, v23, v24, a7);
  OUTLINED_FUNCTION_3_135();
  *uint64_t v20 = 0;
  v20[1] = 0;
  *(unsigned char *)(v8 + v10[14]) = a8;

  return swift_bridgeObjectRetain();
}

uint64_t ActivityFeedLockupViewModel.hashValue.getter()
{
  return sub_1AF7AF140();
}

uint64_t sub_1AF7A1570()
{
  return sub_1AF7AF140();
}

uint64_t sub_1AF7A15F4()
{
  return sub_1AF7A163C(&qword_1E9AD0000, (void (*)(uint64_t))type metadata accessor for ActivityFeedLockupViewModel);
}

uint64_t sub_1AF7A163C(unint64_t *a1, void (*a2)(uint64_t))
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

void *initializeBufferWithCopyOfBuffer for ActivityFeedLockupViewModel(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    a1 = (void *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1AF7A98F0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_1AF7A97D0();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACD290);
      memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
    }
    uint64_t v14 = a3[7];
    uint64_t v15 = a3[8];
    uint64_t v16 = (void *)((char *)a1 + v14);
    uint64_t v17 = (void *)((char *)a2 + v14);
    uint64_t v18 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v18;
    uint64_t v19 = (char *)a1 + v15;
    uint64_t v20 = (char *)a2 + v15;
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v20, 1, v11))
    {
      uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACD290);
      memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v19, v20, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v19, 0, 1, v11);
    }
    uint64_t v22 = a3[9];
    uint64_t v23 = a3[10];
    uint64_t v24 = (void *)((char *)a1 + v22);
    uint64_t v25 = (void *)((char *)a2 + v22);
    uint64_t v26 = v25[1];
    *uint64_t v24 = *v25;
    v24[1] = v26;
    uint64_t v27 = (char *)a1 + v23;
    char v28 = (char *)a2 + v23;
    int v29 = *((unsigned __int8 *)a2 + v23 + 32);
    swift_bridgeObjectRetain();
    if (v29 == 255)
    {
      long long v34 = *((_OWORD *)v28 + 1);
      *(_OWORD *)uint64_t v27 = *(_OWORD *)v28;
      *((_OWORD *)v27 + 1) = v34;
      v27[32] = v28[32];
    }
    else
    {
      __n128 v30 = *(void **)v28;
      uint64_t v31 = *((void *)v28 + 1);
      uint64_t v32 = *((void *)v28 + 2);
      uint64_t v33 = *((void *)v28 + 3);
      sub_1AF4F0064(v30, v31, v32, v33, v29);
      *(void *)uint64_t v27 = v30;
      *((void *)v27 + 1) = v31;
      *((void *)v27 + 2) = v32;
      *((void *)v27 + 3) = v33;
      v27[32] = v29;
    }
    uint64_t v35 = a3[11];
    id v36 = (char *)a1 + v35;
    uint64_t v37 = (char *)a2 + v35;
    if (__swift_getEnumTagSinglePayload((uint64_t)a2 + v35, 1, v11))
    {
      uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACD290);
      memcpy(v36, v37, *(void *)(*(void *)(v38 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v36, v37, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v36, 0, 1, v11);
    }
    uint64_t v39 = a3[13];
    *((unsigned char *)a1 + a3[12]) = *((unsigned char *)a2 + a3[12]);
    uint64_t v40 = (void *)((char *)a1 + v39);
    uint64_t v41 = (void *)((char *)a2 + v39);
    uint64_t v42 = v41[1];
    *uint64_t v40 = *v41;
    v40[1] = v42;
    *((unsigned char *)a1 + a3[14]) = *((unsigned char *)a2 + a3[14]);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for ActivityFeedLockupViewModel(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_1AF7A98F0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease();
  uint64_t v5 = a1 + a2[6];
  uint64_t v6 = sub_1AF7A97D0();
  if (!__swift_getEnumTagSinglePayload(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  swift_bridgeObjectRelease();
  uint64_t v7 = a1 + a2[8];
  if (!__swift_getEnumTagSinglePayload(v7, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v7, v6);
  }
  swift_bridgeObjectRelease();
  uint64_t v8 = a1 + a2[10];
  int v9 = *(unsigned __int8 *)(v8 + 32);
  if (v9 != 255) {
    sub_1AF4B9168(*(void **)v8, *(void *)(v8 + 8), *(void *)(v8 + 16), *(void *)(v8 + 24), v9);
  }
  uint64_t v10 = a1 + a2[11];
  if (!__swift_getEnumTagSinglePayload(v10, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v10, v6);
  }

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ActivityFeedLockupViewModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1AF7A98F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v8 = (void *)(a1 + v7);
  int v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_1AF7A97D0();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACD290);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  }
  uint64_t v12 = a3[7];
  uint64_t v13 = a3[8];
  uint64_t v14 = (void *)(a1 + v12);
  uint64_t v15 = (void *)(a2 + v12);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  uint64_t v17 = (void *)(a1 + v13);
  uint64_t v18 = (const void *)(a2 + v13);
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, v10))
  {
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACD290);
    memcpy(v17, v18, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 16))(v17, v18, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v10);
  }
  uint64_t v20 = a3[9];
  uint64_t v21 = a3[10];
  uint64_t v22 = (void *)(a1 + v20);
  uint64_t v23 = (void *)(a2 + v20);
  uint64_t v24 = v23[1];
  *uint64_t v22 = *v23;
  v22[1] = v24;
  uint64_t v25 = a1 + v21;
  uint64_t v26 = a2 + v21;
  int v27 = *(unsigned __int8 *)(a2 + v21 + 32);
  swift_bridgeObjectRetain();
  if (v27 == 255)
  {
    long long v32 = *(_OWORD *)(v26 + 16);
    *(_OWORD *)uint64_t v25 = *(_OWORD *)v26;
    *(_OWORD *)(v25 + 16) = v32;
    *(unsigned char *)(v25 + 32) = *(unsigned char *)(v26 + 32);
  }
  else
  {
    char v28 = *(void **)v26;
    uint64_t v29 = *(void *)(v26 + 8);
    uint64_t v30 = *(void *)(v26 + 16);
    uint64_t v31 = *(void *)(v26 + 24);
    sub_1AF4F0064(v28, v29, v30, v31, v27);
    *(void *)uint64_t v25 = v28;
    *(void *)(v25 + 8) = v29;
    *(void *)(v25 + 16) = v30;
    *(void *)(v25 + 24) = v31;
    *(unsigned char *)(v25 + 32) = v27;
  }
  uint64_t v33 = a3[11];
  long long v34 = (void *)(a1 + v33);
  uint64_t v35 = (const void *)(a2 + v33);
  if (__swift_getEnumTagSinglePayload(a2 + v33, 1, v10))
  {
    uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACD290);
    memcpy(v34, v35, *(void *)(*(void *)(v36 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 16))(v34, v35, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v34, 0, 1, v10);
  }
  uint64_t v37 = a3[13];
  *(unsigned char *)(a1 + a3[12]) = *(unsigned char *)(a2 + a3[12]);
  uint64_t v38 = (void *)(a1 + v37);
  uint64_t v39 = (void *)(a2 + v37);
  uint64_t v40 = v39[1];
  *uint64_t v38 = *v39;
  v38[1] = v40;
  *(unsigned char *)(a1 + a3[14]) = *(unsigned char *)(a2 + a3[14]);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ActivityFeedLockupViewModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1AF7A98F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  int v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_1AF7A97D0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  int v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (EnumTagSinglePayload)
  {
    if (!v12)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
      __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v13 = *(void *)(v10 - 8);
  if (v12)
  {
    (*(void (**)(void *, uint64_t))(v13 + 8))(v8, v10);
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACD290);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(v13 + 24))(v8, v9, v10);
LABEL_7:
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (void *)(a2 + v15);
  *uint64_t v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[8];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (const void *)(a2 + v18);
  int v21 = __swift_getEnumTagSinglePayload(a1 + v18, 1, v10);
  int v22 = __swift_getEnumTagSinglePayload((uint64_t)v20, 1, v10);
  if (v21)
  {
    if (!v22)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 16))(v19, v20, v10);
      __swift_storeEnumTagSinglePayload((uint64_t)v19, 0, 1, v10);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  uint64_t v23 = *(void *)(v10 - 8);
  if (v22)
  {
    (*(void (**)(void *, uint64_t))(v23 + 8))(v19, v10);
LABEL_12:
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACD290);
    memcpy(v19, v20, *(void *)(*(void *)(v24 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, const void *, uint64_t))(v23 + 24))(v19, v20, v10);
LABEL_13:
  uint64_t v25 = a3[9];
  uint64_t v26 = (void *)(a1 + v25);
  int v27 = (void *)(a2 + v25);
  *uint64_t v26 = *v27;
  v26[1] = v27[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v28 = a3[10];
  uint64_t v29 = a1 + v28;
  uint64_t v30 = (long long *)(a2 + v28);
  int v31 = *(unsigned __int8 *)(a2 + v28 + 32);
  if (*(unsigned __int8 *)(a1 + v28 + 32) == 255)
  {
    if (v31 == 255)
    {
      long long v47 = *v30;
      long long v48 = v30[1];
      *(unsigned char *)(v29 + 32) = *((unsigned char *)v30 + 32);
      *(_OWORD *)uint64_t v29 = v47;
      *(_OWORD *)(v29 + 16) = v48;
    }
    else
    {
      uint64_t v41 = *(void **)v30;
      uint64_t v42 = *((void *)v30 + 1);
      uint64_t v43 = *((void *)v30 + 2);
      uint64_t v44 = *((void *)v30 + 3);
      sub_1AF4F0064(v41, v42, v43, v44, v31);
      *(void *)uint64_t v29 = v41;
      *(void *)(v29 + 8) = v42;
      *(void *)(v29 + 16) = v43;
      *(void *)(v29 + 24) = v44;
      *(unsigned char *)(v29 + 32) = v31;
    }
  }
  else if (v31 == 255)
  {
    sub_1AF6387F8(v29);
    char v45 = *((unsigned char *)v30 + 32);
    long long v46 = v30[1];
    *(_OWORD *)uint64_t v29 = *v30;
    *(_OWORD *)(v29 + 16) = v46;
    *(unsigned char *)(v29 + 32) = v45;
  }
  else
  {
    long long v32 = *(void **)v30;
    uint64_t v33 = *((void *)v30 + 1);
    uint64_t v34 = *((void *)v30 + 2);
    uint64_t v35 = *((void *)v30 + 3);
    sub_1AF4F0064(v32, v33, v34, v35, v31);
    uint64_t v36 = *(void **)v29;
    uint64_t v37 = *(void *)(v29 + 8);
    uint64_t v38 = *(void *)(v29 + 16);
    uint64_t v39 = *(void *)(v29 + 24);
    *(void *)uint64_t v29 = v32;
    *(void *)(v29 + 8) = v33;
    *(void *)(v29 + 16) = v34;
    *(void *)(v29 + 24) = v35;
    char v40 = *(unsigned char *)(v29 + 32);
    *(unsigned char *)(v29 + 32) = v31;
    sub_1AF4B9168(v36, v37, v38, v39, v40);
  }
  uint64_t v49 = a3[11];
  uint64_t v50 = (void *)(a1 + v49);
  uint64_t v51 = (const void *)(a2 + v49);
  int v52 = __swift_getEnumTagSinglePayload(a1 + v49, 1, v10);
  int v53 = __swift_getEnumTagSinglePayload((uint64_t)v51, 1, v10);
  if (!v52)
  {
    uint64_t v54 = *(void *)(v10 - 8);
    if (!v53)
    {
      (*(void (**)(void *, const void *, uint64_t))(v54 + 24))(v50, v51, v10);
      goto LABEL_28;
    }
    (*(void (**)(void *, uint64_t))(v54 + 8))(v50, v10);
    goto LABEL_27;
  }
  if (v53)
  {
LABEL_27:
    uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACD290);
    memcpy(v50, v51, *(void *)(*(void *)(v55 - 8) + 64));
    goto LABEL_28;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 16))(v50, v51, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v50, 0, 1, v10);
LABEL_28:
  *(unsigned char *)(a1 + a3[12]) = *(unsigned char *)(a2 + a3[12]);
  uint64_t v56 = a3[13];
  char v57 = (void *)(a1 + v56);
  uint64_t v58 = (void *)(a2 + v56);
  *char v57 = *v58;
  v57[1] = v58[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[14]) = *(unsigned char *)(a2 + a3[14]);
  return a1;
}

uint64_t initializeWithTake for ActivityFeedLockupViewModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1AF7A98F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v8 = (void *)(a1 + v7);
  int v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_1AF7A97D0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACD290);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  }
  uint64_t v12 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (const void *)(a2 + v12);
  if (__swift_getEnumTagSinglePayload(a2 + v12, 1, v10))
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACD290);
    memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v13, v14, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v10);
  }
  uint64_t v16 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  long long v19 = *(_OWORD *)(v18 + 16);
  *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
  *(_OWORD *)(v17 + 16) = v19;
  *(unsigned char *)(v17 + 32) = *(unsigned char *)(v18 + 32);
  uint64_t v20 = a3[11];
  int v21 = (void *)(a1 + v20);
  int v22 = (const void *)(a2 + v20);
  if (__swift_getEnumTagSinglePayload(a2 + v20, 1, v10))
  {
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACD290);
    memcpy(v21, v22, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v21, v22, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v21, 0, 1, v10);
  }
  uint64_t v24 = a3[13];
  *(unsigned char *)(a1 + a3[12]) = *(unsigned char *)(a2 + a3[12]);
  *(_OWORD *)(a1 + v24) = *(_OWORD *)(a2 + v24);
  *(unsigned char *)(a1 + a3[14]) = *(unsigned char *)(a2 + a3[14]);
  return a1;
}

uint64_t assignWithTake for ActivityFeedLockupViewModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1AF7A98F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  int v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_1AF7A97D0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  int v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (EnumTagSinglePayload)
  {
    if (!v12)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
      __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v13 = *(void *)(v10 - 8);
  if (v12)
  {
    (*(void (**)(void *, uint64_t))(v13 + 8))(v8, v10);
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACD290);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(v13 + 40))(v8, v9, v10);
LABEL_7:
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (uint64_t *)(a2 + v15);
  uint64_t v19 = *v17;
  uint64_t v18 = v17[1];
  *uint64_t v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[8];
  int v21 = (void *)(a1 + v20);
  int v22 = (const void *)(a2 + v20);
  int v23 = __swift_getEnumTagSinglePayload(a1 + v20, 1, v10);
  int v24 = __swift_getEnumTagSinglePayload((uint64_t)v22, 1, v10);
  if (v23)
  {
    if (!v24)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v21, v22, v10);
      __swift_storeEnumTagSinglePayload((uint64_t)v21, 0, 1, v10);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  uint64_t v25 = *(void *)(v10 - 8);
  if (v24)
  {
    (*(void (**)(void *, uint64_t))(v25 + 8))(v21, v10);
LABEL_12:
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACD290);
    memcpy(v21, v22, *(void *)(*(void *)(v26 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, const void *, uint64_t))(v25 + 40))(v21, v22, v10);
LABEL_13:
  uint64_t v27 = a3[9];
  uint64_t v28 = (void *)(a1 + v27);
  uint64_t v29 = (uint64_t *)(a2 + v27);
  uint64_t v31 = *v29;
  uint64_t v30 = v29[1];
  *uint64_t v28 = v31;
  v28[1] = v30;
  swift_bridgeObjectRelease();
  uint64_t v32 = a3[10];
  uint64_t v33 = a1 + v32;
  uint64_t v34 = a2 + v32;
  int v35 = *(unsigned __int8 *)(a1 + v32 + 32);
  if (v35 != 255)
  {
    int v36 = *(unsigned __int8 *)(v34 + 32);
    if (v36 != 255)
    {
      uint64_t v37 = *(void **)v33;
      uint64_t v38 = *(void *)(v33 + 8);
      uint64_t v39 = *(void *)(v33 + 16);
      uint64_t v40 = *(void *)(v33 + 24);
      long long v41 = *(_OWORD *)(v34 + 16);
      *(_OWORD *)uint64_t v33 = *(_OWORD *)v34;
      *(_OWORD *)(v33 + 16) = v41;
      *(unsigned char *)(v33 + 32) = v36;
      sub_1AF4B9168(v37, v38, v39, v40, v35);
      goto LABEL_18;
    }
    sub_1AF6387F8(v33);
  }
  long long v42 = *(_OWORD *)(v34 + 16);
  *(_OWORD *)uint64_t v33 = *(_OWORD *)v34;
  *(_OWORD *)(v33 + 16) = v42;
  *(unsigned char *)(v33 + 32) = *(unsigned char *)(v34 + 32);
LABEL_18:
  uint64_t v43 = a3[11];
  uint64_t v44 = (void *)(a1 + v43);
  char v45 = (const void *)(a2 + v43);
  int v46 = __swift_getEnumTagSinglePayload(a1 + v43, 1, v10);
  int v47 = __swift_getEnumTagSinglePayload((uint64_t)v45, 1, v10);
  if (!v46)
  {
    uint64_t v48 = *(void *)(v10 - 8);
    if (!v47)
    {
      (*(void (**)(void *, const void *, uint64_t))(v48 + 40))(v44, v45, v10);
      goto LABEL_24;
    }
    (*(void (**)(void *, uint64_t))(v48 + 8))(v44, v10);
    goto LABEL_23;
  }
  if (v47)
  {
LABEL_23:
    uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACD290);
    memcpy(v44, v45, *(void *)(*(void *)(v49 - 8) + 64));
    goto LABEL_24;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v44, v45, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v44, 0, 1, v10);
LABEL_24:
  uint64_t v50 = a3[13];
  *(unsigned char *)(a1 + a3[12]) = *(unsigned char *)(a2 + a3[12]);
  uint64_t v51 = (void *)(a1 + v50);
  int v52 = (uint64_t *)(a2 + v50);
  uint64_t v54 = *v52;
  uint64_t v53 = v52[1];
  *uint64_t v51 = v54;
  v51[1] = v53;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[14]) = *(unsigned char *)(a2 + a3[14]);
  return a1;
}

uint64_t getEnumTagSinglePayload for ActivityFeedLockupViewModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1AF7A2B7C);
}

uint64_t sub_1AF7A2B7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1AF7A98F0();
  OUTLINED_FUNCTION_0_17();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_8:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  if (a2 != 0x7FFFFFFF)
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACD290);
    uint64_t v9 = a1 + *(int *)(a3 + 24);
    goto LABEL_8;
  }
  unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
  if (v10 >= 0xFFFFFFFF) {
    LODWORD(v10) = -1;
  }
  return (v10 + 1);
}

uint64_t storeEnumTagSinglePayload for ActivityFeedLockupViewModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1AF7A2C44);
}

void sub_1AF7A2C44(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_1AF7A98F0();
  OUTLINED_FUNCTION_0_17();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
      return;
    }
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9ACD290);
    uint64_t v11 = a1 + *(int *)(a4 + 24);
  }

  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t OUTLINED_FUNCTION_1_167(uint64_t a1)
{
  *(void *)(v1 + *(int *)(a1 + 20)) = v3;
  uint64_t v5 = v1 + *(int *)(a1 + 24);
  return sub_1AF64BFE8(v2, v5);
}

uint64_t OUTLINED_FUNCTION_2_155()
{
  return type metadata accessor for ActivityFeedLockupViewModel();
}

void OUTLINED_FUNCTION_3_135()
{
  *(unsigned char *)(v0 + *(int *)(v1 + 48)) = 1;
}

uint64_t OUTLINED_FUNCTION_4_128()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_7_80@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)(a1 + 32) = v5;
  uint64_t v8 = v4 + *(int *)(v6 + 44);
  return sub_1AF64BFE8(a4, v8);
}

__n128 OUTLINED_FUNCTION_8_88@<Q0>(__n128 *a1@<X8>, __n128 a2)
{
  __n128 result = a2;
  *a1 = a2;
  return result;
}

__n128 OUTLINED_FUNCTION_9_81(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return *(__n128 *)a6;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

#error "1AF7A6C20: call analysis failed (funcsize=48)"

#error "1AF7A6DB4: call analysis failed (funcsize=48)"

#error "1AF7A6E88: call analysis failed (funcsize=48)"

#error "1AF7A6F5C: call analysis failed (funcsize=48)"

#error "1AF7A7030: call analysis failed (funcsize=48)"

#error "1AF7A7104: call analysis failed (funcsize=48)"

#error "1AF7A71D8: call analysis failed (funcsize=48)"

#error "1AF7A72EC: call analysis failed (funcsize=65)"

#error "1AF7A749C: call analysis failed (funcsize=48)"

#error "1AF7A7570: call analysis failed (funcsize=48)"

void __getRUILoaderClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *RemoteUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"GKRemoteUIController.m", 52, @"%s", *a1);

  __break(1u);
}

void __getRUILoaderClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getRUILoaderClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"GKRemoteUIController.m", 53, @"Unable to find class %s", "RUILoader");

  __break(1u);
}

uint64_t sub_1AF7A9320()
{
  return MEMORY[0x1F40E2E70]();
}

uint64_t sub_1AF7A9330()
{
  return MEMORY[0x1F40E2EA8]();
}

uint64_t sub_1AF7A9340()
{
  return MEMORY[0x1F40E2ED8]();
}

uint64_t sub_1AF7A9350()
{
  return MEMORY[0x1F40E2EE8]();
}

uint64_t sub_1AF7A9360()
{
  return MEMORY[0x1F40E2F00]();
}

uint64_t sub_1AF7A9370()
{
  return MEMORY[0x1F40E2F08]();
}

uint64_t sub_1AF7A9380()
{
  return MEMORY[0x1F40E2F60]();
}

uint64_t sub_1AF7A9390()
{
  return MEMORY[0x1F40E3298]();
}

uint64_t sub_1AF7A93A0()
{
  return MEMORY[0x1F40E32A8]();
}

uint64_t sub_1AF7A93B0()
{
  return MEMORY[0x1F40E32E8]();
}

uint64_t sub_1AF7A93C0()
{
  return MEMORY[0x1F40E3368]();
}

uint64_t sub_1AF7A93D0()
{
  return MEMORY[0x1F4129430]();
}

uint64_t sub_1AF7A93E0()
{
  return MEMORY[0x1F40E3420]();
}

uint64_t sub_1AF7A93F0()
{
  return MEMORY[0x1F40E3550]();
}

uint64_t sub_1AF7A9400()
{
  return MEMORY[0x1F40E3578]();
}

uint64_t sub_1AF7A9410()
{
  return MEMORY[0x1F40E3590]();
}

uint64_t sub_1AF7A9420()
{
  return MEMORY[0x1F40E35A8]();
}

uint64_t sub_1AF7A9430()
{
  return MEMORY[0x1F40E35B0]();
}

uint64_t sub_1AF7A9440()
{
  return MEMORY[0x1F40E35C0]();
}

uint64_t sub_1AF7A9450()
{
  return MEMORY[0x1F40E35C8]();
}

uint64_t sub_1AF7A9460()
{
  return MEMORY[0x1F40E35D8]();
}

uint64_t sub_1AF7A9470()
{
  return MEMORY[0x1F40E3668]();
}

uint64_t sub_1AF7A9480()
{
  return MEMORY[0x1F40E3670]();
}

uint64_t sub_1AF7A9490()
{
  return MEMORY[0x1F40E36C8]();
}

uint64_t sub_1AF7A94A0()
{
  return MEMORY[0x1F40E36D8]();
}

uint64_t sub_1AF7A94B0()
{
  return MEMORY[0x1F40E36E8]();
}

uint64_t sub_1AF7A94C0()
{
  return MEMORY[0x1F40E36F8]();
}

uint64_t sub_1AF7A94D0()
{
  return MEMORY[0x1F40E3718]();
}

uint64_t sub_1AF7A94E0()
{
  return MEMORY[0x1F40E3750]();
}

uint64_t sub_1AF7A94F0()
{
  return MEMORY[0x1F40E3760]();
}

uint64_t sub_1AF7A9500()
{
  return MEMORY[0x1F40E37A8]();
}

uint64_t sub_1AF7A9510()
{
  return MEMORY[0x1F40E37B8]();
}

uint64_t sub_1AF7A9520()
{
  return MEMORY[0x1F40E38B8]();
}

uint64_t sub_1AF7A9530()
{
  return MEMORY[0x1F40E3A58]();
}

uint64_t sub_1AF7A9540()
{
  return MEMORY[0x1F40E3A90]();
}

uint64_t sub_1AF7A9550()
{
  return MEMORY[0x1F40E3A98]();
}

uint64_t sub_1AF7A9560()
{
  return MEMORY[0x1F40E3AC0]();
}

uint64_t sub_1AF7A9570()
{
  return MEMORY[0x1F40E3B48]();
}

uint64_t sub_1AF7A9580()
{
  return MEMORY[0x1F411B8A8]();
}

uint64_t sub_1AF7A9590()
{
  return MEMORY[0x1F411B8B0]();
}

uint64_t sub_1AF7A95A0()
{
  return MEMORY[0x1F411B8B8]();
}

uint64_t sub_1AF7A95B0()
{
  return MEMORY[0x1F40F7D18]();
}

uint64_t sub_1AF7A95C0()
{
  return MEMORY[0x1F40E3C10]();
}

uint64_t sub_1AF7A95D0()
{
  return MEMORY[0x1F40E3C38]();
}

uint64_t sub_1AF7A95E0()
{
  return MEMORY[0x1F40E3CA0]();
}

uint64_t sub_1AF7A95F0()
{
  return MEMORY[0x1F40E3D80]();
}

uint64_t sub_1AF7A9600()
{
  return MEMORY[0x1F40E3D90]();
}

uint64_t sub_1AF7A9610()
{
  return MEMORY[0x1F40E3DA8]();
}

uint64_t sub_1AF7A9620()
{
  return MEMORY[0x1F40E3DC0]();
}

uint64_t sub_1AF7A9630()
{
  return MEMORY[0x1F40E3DC8]();
}

uint64_t sub_1AF7A9640()
{
  return MEMORY[0x1F40E3DF8]();
}

uint64_t sub_1AF7A9650()
{
  return MEMORY[0x1F40E3EA0]();
}

uint64_t sub_1AF7A9660()
{
  return MEMORY[0x1F40E3EB0]();
}

uint64_t sub_1AF7A9670()
{
  return MEMORY[0x1F40E3EF8]();
}

uint64_t sub_1AF7A9680()
{
  return MEMORY[0x1F40E4090]();
}

uint64_t sub_1AF7A9690()
{
  return MEMORY[0x1F40E40A0]();
}

uint64_t sub_1AF7A96A0()
{
  return MEMORY[0x1F40E4178]();
}

uint64_t sub_1AF7A96B0()
{
  return MEMORY[0x1F40E4460]();
}

uint64_t sub_1AF7A96C0()
{
  return MEMORY[0x1F40E4518]();
}

uint64_t sub_1AF7A96D0()
{
  return MEMORY[0x1F40F7D50]();
}

uint64_t sub_1AF7A96E0()
{
  return MEMORY[0x1F40E4530]();
}

uint64_t sub_1AF7A96F0()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1AF7A9700()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1AF7A9710()
{
  return MEMORY[0x1F40E46B8]();
}

uint64_t sub_1AF7A9720()
{
  return MEMORY[0x1F40E46D0]();
}

uint64_t sub_1AF7A9730()
{
  return MEMORY[0x1F40E4758]();
}

uint64_t sub_1AF7A9740()
{
  return MEMORY[0x1F40E4868]();
}

uint64_t sub_1AF7A9750()
{
  return MEMORY[0x1F40E48D8]();
}

uint64_t sub_1AF7A9760()
{
  return MEMORY[0x1F40E48F8]();
}

uint64_t sub_1AF7A9770()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1AF7A9780()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1AF7A9790()
{
  return MEMORY[0x1F40E4AF0]();
}

uint64_t sub_1AF7A97A0()
{
  return MEMORY[0x1F40E4B00]();
}

uint64_t sub_1AF7A97B0()
{
  return MEMORY[0x1F40E4B20]();
}

uint64_t sub_1AF7A97C0()
{
  return MEMORY[0x1F4127730]();
}

uint64_t sub_1AF7A97D0()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1AF7A97E0()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1AF7A97F0()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1AF7A9800()
{
  return MEMORY[0x1F40E5088]();
}

uint64_t sub_1AF7A9810()
{
  return MEMORY[0x1F40E50E0]();
}

uint64_t sub_1AF7A9820()
{
  return MEMORY[0x1F40E5158]();
}

uint64_t sub_1AF7A9830()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1AF7A9840()
{
  return MEMORY[0x1F40E5198]();
}

uint64_t sub_1AF7A9850()
{
  return MEMORY[0x1F40E51A8]();
}

uint64_t sub_1AF7A9860()
{
  return MEMORY[0x1F40E52B0]();
}

uint64_t sub_1AF7A9870()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_1AF7A9880()
{
  return MEMORY[0x1F40E52F0]();
}

uint64_t sub_1AF7A9890()
{
  return MEMORY[0x1F40E5320]();
}

uint64_t sub_1AF7A98A0()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1AF7A98B0()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1AF7A98C0()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t _s12GameCenterUI42FriendWhoHasEarnedThisAchievementViewModelV2eeoiySbAC_ACtFZ_0()
{
  return MEMORY[0x1F40E53E8]();
}

uint64_t sub_1AF7A98E0()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1AF7A98F0()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1AF7A9900()
{
  return MEMORY[0x1F40E5458]();
}

uint64_t sub_1AF7A9910()
{
  return MEMORY[0x1F40E5648]();
}

uint64_t sub_1AF7A9920()
{
  return MEMORY[0x1F40E5698]();
}

uint64_t sub_1AF7A9930()
{
  return MEMORY[0x1F40E56B0]();
}

uint64_t sub_1AF7A9940()
{
  return MEMORY[0x1F40E56C8]();
}

uint64_t sub_1AF7A9950()
{
  return MEMORY[0x1F40E5718]();
}

uint64_t sub_1AF7A9960()
{
  return MEMORY[0x1F40E5728]();
}

uint64_t sub_1AF7A9970()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1AF7A9980()
{
  return MEMORY[0x1F40E5960]();
}

uint64_t sub_1AF7A9990()
{
  return MEMORY[0x1F40E5A58]();
}

uint64_t sub_1AF7A99A0()
{
  return MEMORY[0x1F40E5AB8]();
}

uint64_t sub_1AF7A99B0()
{
  return MEMORY[0x1F40E5AF0]();
}

uint64_t sub_1AF7A99C0()
{
  return MEMORY[0x1F40E5B18]();
}

uint64_t sub_1AF7A99D0()
{
  return MEMORY[0x1F40E5E68]();
}

uint64_t sub_1AF7A99E0()
{
  return MEMORY[0x1F40E5EA0]();
}

uint64_t sub_1AF7A99F0()
{
  return MEMORY[0x1F4165718]();
}

uint64_t sub_1AF7A9A00()
{
  return MEMORY[0x1F4165730]();
}

uint64_t sub_1AF7A9A10()
{
  return MEMORY[0x1F4165748]();
}

uint64_t sub_1AF7A9A20()
{
  return MEMORY[0x1F4165760]();
}

uint64_t sub_1AF7A9A30()
{
  return MEMORY[0x1F40E5EA8]();
}

uint64_t sub_1AF7A9A40()
{
  return MEMORY[0x1F40E5EB8]();
}

uint64_t sub_1AF7A9A50()
{
  return MEMORY[0x1F40E5EE8]();
}

uint64_t sub_1AF7A9A60()
{
  return MEMORY[0x1F40E5EF0]();
}

uint64_t sub_1AF7A9A70()
{
  return MEMORY[0x1F4187538]();
}

uint64_t sub_1AF7A9A80()
{
  return MEMORY[0x1F4187540]();
}

uint64_t sub_1AF7A9A90()
{
  return MEMORY[0x1F4187550]();
}

uint64_t sub_1AF7A9AA0()
{
  return MEMORY[0x1F4187568]();
}

uint64_t sub_1AF7A9AB0()
{
  return MEMORY[0x1F4187578]();
}

uint64_t sub_1AF7A9AC0()
{
  return MEMORY[0x1F4187588]();
}

uint64_t sub_1AF7A9AD0()
{
  return MEMORY[0x1F40D9648]();
}

uint64_t sub_1AF7A9AE0()
{
  return MEMORY[0x1F4129450]();
}

uint64_t sub_1AF7A9AF0()
{
  return MEMORY[0x1F4119150]();
}

uint64_t sub_1AF7A9B00()
{
  return MEMORY[0x1F41875C8]();
}

uint64_t sub_1AF7A9B10()
{
  return MEMORY[0x1F41875D0]();
}

uint64_t sub_1AF7A9B20()
{
  return MEMORY[0x1F41875E8]();
}

uint64_t sub_1AF7A9B30()
{
  return MEMORY[0x1F41875F0]();
}

uint64_t sub_1AF7A9B40()
{
  return MEMORY[0x1F4187600]();
}

uint64_t sub_1AF7A9B50()
{
  return MEMORY[0x1F4187638]();
}

uint64_t sub_1AF7A9B60()
{
  return MEMORY[0x1F40D3130]();
}

uint64_t sub_1AF7A9B70()
{
  return MEMORY[0x1F40D3138]();
}

uint64_t sub_1AF7A9B80()
{
  return MEMORY[0x1F40D3148]();
}

uint64_t sub_1AF7A9B90()
{
  return MEMORY[0x1F411B8C0]();
}

uint64_t sub_1AF7A9BA0()
{
  return MEMORY[0x1F411B8C8]();
}

uint64_t sub_1AF7A9BB0()
{
  return MEMORY[0x1F411B8D0]();
}

uint64_t sub_1AF7A9BC0()
{
  return MEMORY[0x1F411B8D8]();
}

uint64_t sub_1AF7A9BD0()
{
  return MEMORY[0x1F411B8E0]();
}

uint64_t sub_1AF7A9BE0()
{
  return MEMORY[0x1F411B8E8]();
}

uint64_t sub_1AF7A9BF0()
{
  return MEMORY[0x1F411B8F0]();
}

uint64_t sub_1AF7A9C00()
{
  return MEMORY[0x1F411B8F8]();
}

uint64_t sub_1AF7A9C10()
{
  return MEMORY[0x1F411B900]();
}

uint64_t sub_1AF7A9C20()
{
  return MEMORY[0x1F411B908]();
}

uint64_t sub_1AF7A9C30()
{
  return MEMORY[0x1F411B910]();
}

uint64_t sub_1AF7A9C40()
{
  return MEMORY[0x1F411B918]();
}

uint64_t sub_1AF7A9C50()
{
  return MEMORY[0x1F411B920]();
}

uint64_t sub_1AF7A9C60()
{
  return MEMORY[0x1F411B928]();
}

uint64_t sub_1AF7A9C70()
{
  return MEMORY[0x1F411B930]();
}

uint64_t sub_1AF7A9C80()
{
  return MEMORY[0x1F411B938]();
}

uint64_t sub_1AF7A9C90()
{
  return MEMORY[0x1F411B940]();
}

uint64_t sub_1AF7A9CA0()
{
  return MEMORY[0x1F411B948]();
}

uint64_t sub_1AF7A9CB0()
{
  return MEMORY[0x1F411B950]();
}

uint64_t sub_1AF7A9CC0()
{
  return MEMORY[0x1F411B958]();
}

uint64_t sub_1AF7A9CD0()
{
  return MEMORY[0x1F411B960]();
}

uint64_t sub_1AF7A9CE0()
{
  return MEMORY[0x1F411B968]();
}

uint64_t sub_1AF7A9CF0()
{
  return MEMORY[0x1F411B970]();
}

uint64_t sub_1AF7A9D00()
{
  return MEMORY[0x1F411B978]();
}

uint64_t sub_1AF7A9D10()
{
  return MEMORY[0x1F411B980]();
}

uint64_t sub_1AF7A9D20()
{
  return MEMORY[0x1F411B988]();
}

uint64_t sub_1AF7A9D30()
{
  return MEMORY[0x1F411B990]();
}

uint64_t sub_1AF7A9D40()
{
  return MEMORY[0x1F411B998]();
}

uint64_t sub_1AF7A9D50()
{
  return MEMORY[0x1F411B9A0]();
}

uint64_t sub_1AF7A9D60()
{
  return MEMORY[0x1F411B9A8]();
}

uint64_t sub_1AF7A9D70()
{
  return MEMORY[0x1F411B9B0]();
}

uint64_t sub_1AF7A9D80()
{
  return MEMORY[0x1F411B9B8]();
}

uint64_t sub_1AF7A9D90()
{
  return MEMORY[0x1F411B9C0]();
}

uint64_t sub_1AF7A9DA0()
{
  return MEMORY[0x1F411B9C8]();
}

uint64_t sub_1AF7A9DB0()
{
  return MEMORY[0x1F411B9D0]();
}

uint64_t sub_1AF7A9DC0()
{
  return MEMORY[0x1F411B9D8]();
}

uint64_t sub_1AF7A9DD0()
{
  return MEMORY[0x1F411B9E0]();
}

uint64_t sub_1AF7A9DE0()
{
  return MEMORY[0x1F411B9E8]();
}

uint64_t sub_1AF7A9DF0()
{
  return MEMORY[0x1F411B9F0]();
}

uint64_t sub_1AF7A9E00()
{
  return MEMORY[0x1F411B9F8]();
}

uint64_t sub_1AF7A9E10()
{
  return MEMORY[0x1F411BA00]();
}

uint64_t sub_1AF7A9E20()
{
  return MEMORY[0x1F411BA08]();
}

uint64_t sub_1AF7A9E30()
{
  return MEMORY[0x1F411BA10]();
}

uint64_t sub_1AF7A9E40()
{
  return MEMORY[0x1F411BA18]();
}

uint64_t sub_1AF7A9E50()
{
  return MEMORY[0x1F411BA20]();
}

uint64_t sub_1AF7A9E60()
{
  return MEMORY[0x1F411BA28]();
}

uint64_t sub_1AF7A9E70()
{
  return MEMORY[0x1F411BA30]();
}

uint64_t sub_1AF7A9E80()
{
  return MEMORY[0x1F411BA38]();
}

uint64_t sub_1AF7A9E90()
{
  return MEMORY[0x1F411BA40]();
}

uint64_t sub_1AF7A9EA0()
{
  return MEMORY[0x1F411BA48]();
}

uint64_t sub_1AF7A9EB0()
{
  return MEMORY[0x1F411BA50]();
}

uint64_t sub_1AF7A9EC0()
{
  return MEMORY[0x1F411BA58]();
}

uint64_t sub_1AF7A9ED0()
{
  return MEMORY[0x1F411BA60]();
}

uint64_t sub_1AF7A9EE0()
{
  return MEMORY[0x1F411BA68]();
}

uint64_t sub_1AF7A9EF0()
{
  return MEMORY[0x1F411BA70]();
}

uint64_t sub_1AF7A9F00()
{
  return MEMORY[0x1F411BA78]();
}

uint64_t sub_1AF7A9F10()
{
  return MEMORY[0x1F411BA80]();
}

uint64_t sub_1AF7A9F20()
{
  return MEMORY[0x1F411BA88]();
}

uint64_t sub_1AF7A9F30()
{
  return MEMORY[0x1F411BA90]();
}

uint64_t sub_1AF7A9F40()
{
  return MEMORY[0x1F411BA98]();
}

uint64_t sub_1AF7A9F50()
{
  return MEMORY[0x1F411BAA0]();
}

uint64_t sub_1AF7A9F60()
{
  return MEMORY[0x1F411BAA8]();
}

uint64_t sub_1AF7A9F70()
{
  return MEMORY[0x1F411BAB0]();
}

uint64_t sub_1AF7A9F80()
{
  return MEMORY[0x1F411BAB8]();
}

uint64_t sub_1AF7A9F90()
{
  return MEMORY[0x1F411BAC0]();
}

uint64_t sub_1AF7A9FA0()
{
  return MEMORY[0x1F411BAC8]();
}

uint64_t sub_1AF7A9FB0()
{
  return MEMORY[0x1F411BAD0]();
}

uint64_t sub_1AF7A9FC0()
{
  return MEMORY[0x1F411BAD8]();
}

uint64_t sub_1AF7A9FD0()
{
  return MEMORY[0x1F411BAE0]();
}

uint64_t sub_1AF7A9FE0()
{
  return MEMORY[0x1F411BAE8]();
}

uint64_t sub_1AF7A9FF0()
{
  return MEMORY[0x1F41882A0]();
}

uint64_t sub_1AF7AA000()
{
  return MEMORY[0x1F41882A8]();
}

uint64_t sub_1AF7AA010()
{
  return MEMORY[0x1F41882C0]();
}

uint64_t sub_1AF7AA020()
{
  return MEMORY[0x1F41882C8]();
}

uint64_t sub_1AF7AA030()
{
  return MEMORY[0x1F41882F0]();
}

uint64_t sub_1AF7AA040()
{
  return MEMORY[0x1F4187670]();
}

uint64_t sub_1AF7AA050()
{
  return MEMORY[0x1F4188340]();
}

uint64_t sub_1AF7AA060()
{
  return MEMORY[0x1F4188348]();
}

uint64_t sub_1AF7AA070()
{
  return MEMORY[0x1F4187698]();
}

uint64_t sub_1AF7AA080()
{
  return MEMORY[0x1F4188378]();
}

uint64_t sub_1AF7AA090()
{
  return MEMORY[0x1F41883C0]();
}

uint64_t sub_1AF7AA0A0()
{
  return MEMORY[0x1F41883C8]();
}

uint64_t sub_1AF7AA0B0()
{
  return MEMORY[0x1F411B4C8]();
}

uint64_t sub_1AF7AA0C0()
{
  return MEMORY[0x1F411B4D0]();
}

uint64_t sub_1AF7AA0D0()
{
  return MEMORY[0x1F411B4D8]();
}

uint64_t sub_1AF7AA0E0()
{
  return MEMORY[0x1F411B4E0]();
}

uint64_t sub_1AF7AA0F0()
{
  return MEMORY[0x1F411B4E8]();
}

uint64_t sub_1AF7AA100()
{
  return MEMORY[0x1F411B4F0]();
}

uint64_t sub_1AF7AA110()
{
  return MEMORY[0x1F411B4F8]();
}

uint64_t sub_1AF7AA120()
{
  return MEMORY[0x1F411B500]();
}

uint64_t sub_1AF7AA130()
{
  return MEMORY[0x1F411B508]();
}

uint64_t sub_1AF7AA140()
{
  return MEMORY[0x1F411B510]();
}

uint64_t sub_1AF7AA150()
{
  return MEMORY[0x1F411B518]();
}

uint64_t sub_1AF7AA160()
{
  return MEMORY[0x1F411B520]();
}

uint64_t sub_1AF7AA170()
{
  return MEMORY[0x1F4104D00]();
}

uint64_t sub_1AF7AA180()
{
  return MEMORY[0x1F4104D08]();
}

uint64_t sub_1AF7AA190()
{
  return MEMORY[0x1F4104D10]();
}

uint64_t sub_1AF7AA1A0()
{
  return MEMORY[0x1F4104D18]();
}

uint64_t sub_1AF7AA1B0()
{
  return MEMORY[0x1F4104D20]();
}

uint64_t sub_1AF7AA1C0()
{
  return MEMORY[0x1F411B5E0]();
}

uint64_t sub_1AF7AA1D0()
{
  return MEMORY[0x1F411B5E8]();
}

uint64_t sub_1AF7AA1E0()
{
  return MEMORY[0x1F411B5F0]();
}

uint64_t sub_1AF7AA1F0()
{
  return MEMORY[0x1F411B5F8]();
}

uint64_t sub_1AF7AA200()
{
  return MEMORY[0x1F411B600]();
}

uint64_t sub_1AF7AA210()
{
  return MEMORY[0x1F411B608]();
}

uint64_t sub_1AF7AA220()
{
  return MEMORY[0x1F411B610]();
}

uint64_t sub_1AF7AA230()
{
  return MEMORY[0x1F411B618]();
}

uint64_t sub_1AF7AA240()
{
  return MEMORY[0x1F411B620]();
}

uint64_t sub_1AF7AA250()
{
  return MEMORY[0x1F411B628]();
}

uint64_t sub_1AF7AA260()
{
  return MEMORY[0x1F411B630]();
}

uint64_t sub_1AF7AA270()
{
  return MEMORY[0x1F411B638]();
}

uint64_t sub_1AF7AA280()
{
  return MEMORY[0x1F411B640]();
}

uint64_t sub_1AF7AA290()
{
  return MEMORY[0x1F411B648]();
}

uint64_t sub_1AF7AA2A0()
{
  return MEMORY[0x1F411B650]();
}

uint64_t sub_1AF7AA2B0()
{
  return MEMORY[0x1F411B658]();
}

uint64_t sub_1AF7AA2C0()
{
  return MEMORY[0x1F411B660]();
}

uint64_t sub_1AF7AA2D0()
{
  return MEMORY[0x1F411B668]();
}

uint64_t sub_1AF7AA2E0()
{
  return MEMORY[0x1F411B670]();
}

uint64_t sub_1AF7AA2F0()
{
  return MEMORY[0x1F411B678]();
}

uint64_t sub_1AF7AA300()
{
  return MEMORY[0x1F411B680]();
}

uint64_t sub_1AF7AA310()
{
  return MEMORY[0x1F411B688]();
}

uint64_t sub_1AF7AA320()
{
  return MEMORY[0x1F411B690]();
}

uint64_t sub_1AF7AA330()
{
  return MEMORY[0x1F411B698]();
}

uint64_t sub_1AF7AA340()
{
  return MEMORY[0x1F4188500]();
}

uint64_t sub_1AF7AA350()
{
  return MEMORY[0x1F4188568]();
}

uint64_t sub_1AF7AA360()
{
  return MEMORY[0x1F4188570]();
}

uint64_t sub_1AF7AA370()
{
  return MEMORY[0x1F4188578]();
}

uint64_t sub_1AF7AA380()
{
  return MEMORY[0x1F4188580]();
}

uint64_t sub_1AF7AA390()
{
  return MEMORY[0x1F41885B0]();
}

uint64_t sub_1AF7AA3A0()
{
  return MEMORY[0x1F41885B8]();
}

uint64_t sub_1AF7AA3B0()
{
  return MEMORY[0x1F41885D0]();
}

uint64_t sub_1AF7AA3C0()
{
  return MEMORY[0x1F41885E0]();
}

uint64_t sub_1AF7AA3D0()
{
  return MEMORY[0x1F4188650]();
}

uint64_t sub_1AF7AA3E0()
{
  return MEMORY[0x1F4188658]();
}

uint64_t sub_1AF7AA3F0()
{
  return MEMORY[0x1F4188660]();
}

uint64_t sub_1AF7AA400()
{
  return MEMORY[0x1F4188668]();
}

uint64_t sub_1AF7AA410()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1AF7AA420()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1AF7AA430()
{
  return MEMORY[0x1F4129458]();
}

uint64_t sub_1AF7AA440()
{
  return MEMORY[0x1F4129460]();
}

uint64_t sub_1AF7AA450()
{
  return MEMORY[0x1F4129468]();
}

uint64_t sub_1AF7AA460()
{
  return MEMORY[0x1F4129470]();
}

uint64_t sub_1AF7AA470()
{
  return MEMORY[0x1F4129478]();
}

uint64_t sub_1AF7AA480()
{
  return MEMORY[0x1F4129480]();
}

uint64_t sub_1AF7AA490()
{
  return MEMORY[0x1F4129488]();
}

uint64_t sub_1AF7AA4A0()
{
  return MEMORY[0x1F4129490]();
}

uint64_t sub_1AF7AA4B0()
{
  return MEMORY[0x1F41294A0]();
}

uint64_t sub_1AF7AA4C0()
{
  return MEMORY[0x1F41294B0]();
}

uint64_t sub_1AF7AA4D0()
{
  return MEMORY[0x1F41294C0]();
}

uint64_t sub_1AF7AA4E0()
{
  return MEMORY[0x1F41294D0]();
}

uint64_t sub_1AF7AA4F0()
{
  return MEMORY[0x1F41294D8]();
}

uint64_t sub_1AF7AA500()
{
  return MEMORY[0x1F41294E8]();
}

uint64_t sub_1AF7AA510()
{
  return MEMORY[0x1F41294F0]();
}

uint64_t sub_1AF7AA520()
{
  return MEMORY[0x1F41294F8]();
}

uint64_t sub_1AF7AA530()
{
  return MEMORY[0x1F4129500]();
}

uint64_t sub_1AF7AA540()
{
  return MEMORY[0x1F4129510]();
}

uint64_t sub_1AF7AA550()
{
  return MEMORY[0x1F4129518]();
}

uint64_t sub_1AF7AA560()
{
  return MEMORY[0x1F4129520]();
}

uint64_t sub_1AF7AA570()
{
  return MEMORY[0x1F4129528]();
}

uint64_t sub_1AF7AA580()
{
  return MEMORY[0x1F4129530]();
}

uint64_t sub_1AF7AA590()
{
  return MEMORY[0x1F4129540]();
}

uint64_t sub_1AF7AA5A0()
{
  return MEMORY[0x1F4129558]();
}

uint64_t sub_1AF7AA5B0()
{
  return MEMORY[0x1F4129560]();
}

uint64_t sub_1AF7AA5C0()
{
  return MEMORY[0x1F4129580]();
}

uint64_t sub_1AF7AA5D0()
{
  return MEMORY[0x1F4129588]();
}

uint64_t sub_1AF7AA5E0()
{
  return MEMORY[0x1F4129598]();
}

uint64_t sub_1AF7AA5F0()
{
  return MEMORY[0x1F41295A0]();
}

uint64_t sub_1AF7AA600()
{
  return MEMORY[0x1F41295A8]();
}

uint64_t sub_1AF7AA610()
{
  return MEMORY[0x1F41295B0]();
}

uint64_t sub_1AF7AA620()
{
  return MEMORY[0x1F41295B8]();
}

uint64_t sub_1AF7AA630()
{
  return MEMORY[0x1F41295C8]();
}

uint64_t sub_1AF7AA640()
{
  return MEMORY[0x1F41295D0]();
}

uint64_t sub_1AF7AA650()
{
  return MEMORY[0x1F41295D8]();
}

uint64_t sub_1AF7AA670()
{
  return MEMORY[0x1F4129600]();
}

uint64_t sub_1AF7AA680()
{
  return MEMORY[0x1F4129608]();
}

uint64_t sub_1AF7AA690()
{
  return MEMORY[0x1F4129610]();
}

uint64_t sub_1AF7AA6A0()
{
  return MEMORY[0x1F4129618]();
}

uint64_t sub_1AF7AA6B0()
{
  return MEMORY[0x1F4129620]();
}

uint64_t sub_1AF7AA6C0()
{
  return MEMORY[0x1F4129628]();
}

uint64_t sub_1AF7AA6D0()
{
  return MEMORY[0x1F4129630]();
}

uint64_t sub_1AF7AA6E0()
{
  return MEMORY[0x1F4129638]();
}

uint64_t sub_1AF7AA6F0()
{
  return MEMORY[0x1F4129640]();
}

uint64_t sub_1AF7AA700()
{
  return MEMORY[0x1F4129648]();
}

uint64_t sub_1AF7AA710()
{
  return MEMORY[0x1F4129650]();
}

uint64_t sub_1AF7AA720()
{
  return MEMORY[0x1F4129658]();
}

uint64_t sub_1AF7AA730()
{
  return MEMORY[0x1F4129660]();
}

uint64_t sub_1AF7AA740()
{
  return MEMORY[0x1F4129668]();
}

uint64_t sub_1AF7AA750()
{
  return MEMORY[0x1F4129680]();
}

uint64_t sub_1AF7AA760()
{
  return MEMORY[0x1F4129688]();
}

uint64_t sub_1AF7AA770()
{
  return MEMORY[0x1F4129690]();
}

uint64_t sub_1AF7AA780()
{
  return MEMORY[0x1F4129698]();
}

uint64_t sub_1AF7AA790()
{
  return MEMORY[0x1F41296A0]();
}

uint64_t sub_1AF7AA7A0()
{
  return MEMORY[0x1F41296D8]();
}

uint64_t sub_1AF7AA7B0()
{
  return MEMORY[0x1F41296E0]();
}

uint64_t sub_1AF7AA7C0()
{
  return MEMORY[0x1F41296F8]();
}

uint64_t sub_1AF7AA7D0()
{
  return MEMORY[0x1F4129700]();
}

uint64_t sub_1AF7AA7E0()
{
  return MEMORY[0x1F4129710]();
}

uint64_t sub_1AF7AA7F0()
{
  return MEMORY[0x1F4129718]();
}

uint64_t sub_1AF7AA800()
{
  return MEMORY[0x1F4129720]();
}

uint64_t sub_1AF7AA810()
{
  return MEMORY[0x1F4129728]();
}

uint64_t sub_1AF7AA820()
{
  return MEMORY[0x1F4129730]();
}

uint64_t sub_1AF7AA830()
{
  return MEMORY[0x1F4129748]();
}

uint64_t sub_1AF7AA840()
{
  return MEMORY[0x1F4129758]();
}

uint64_t sub_1AF7AA850()
{
  return MEMORY[0x1F4129788]();
}

uint64_t sub_1AF7AA860()
{
  return MEMORY[0x1F4129790]();
}

uint64_t sub_1AF7AA870()
{
  return MEMORY[0x1F4129798]();
}

uint64_t sub_1AF7AA880()
{
  return MEMORY[0x1F41297A0]();
}

uint64_t sub_1AF7AA890()
{
  return MEMORY[0x1F41297A8]();
}

uint64_t sub_1AF7AA8A0()
{
  return MEMORY[0x1F41297B0]();
}

uint64_t sub_1AF7AA8B0()
{
  return MEMORY[0x1F41297B8]();
}

uint64_t sub_1AF7AA8C0()
{
  return MEMORY[0x1F41297C0]();
}

uint64_t sub_1AF7AA8D0()
{
  return MEMORY[0x1F41297E0]();
}

uint64_t sub_1AF7AA8E0()
{
  return MEMORY[0x1F41297E8]();
}

uint64_t sub_1AF7AA8F0()
{
  return MEMORY[0x1F41297F0]();
}

uint64_t sub_1AF7AA900()
{
  return MEMORY[0x1F4129800]();
}

uint64_t sub_1AF7AA910()
{
  return MEMORY[0x1F4129808]();
}

uint64_t sub_1AF7AA920()
{
  return MEMORY[0x1F4129810]();
}

uint64_t sub_1AF7AA930()
{
  return MEMORY[0x1F4129818]();
}

uint64_t sub_1AF7AA940()
{
  return MEMORY[0x1F4129820]();
}

uint64_t sub_1AF7AA950()
{
  return MEMORY[0x1F4129828]();
}

uint64_t sub_1AF7AA960()
{
  return MEMORY[0x1F4129830]();
}

uint64_t sub_1AF7AA970()
{
  return MEMORY[0x1F4129838]();
}

uint64_t sub_1AF7AA980()
{
  return MEMORY[0x1F4129840]();
}

uint64_t sub_1AF7AA990()
{
  return MEMORY[0x1F4129848]();
}

uint64_t sub_1AF7AA9A0()
{
  return MEMORY[0x1F4129850]();
}

uint64_t sub_1AF7AA9B0()
{
  return MEMORY[0x1F4129858]();
}

uint64_t sub_1AF7AA9C0()
{
  return MEMORY[0x1F4129860]();
}

uint64_t sub_1AF7AA9D0()
{
  return MEMORY[0x1F4129868]();
}

uint64_t sub_1AF7AA9E0()
{
  return MEMORY[0x1F4129878]();
}

uint64_t sub_1AF7AA9F0()
{
  return MEMORY[0x1F4129880]();
}

uint64_t sub_1AF7AAA00()
{
  return MEMORY[0x1F4129888]();
}

uint64_t sub_1AF7AAA10()
{
  return MEMORY[0x1F4129890]();
}

uint64_t sub_1AF7AAA20()
{
  return MEMORY[0x1F41298C8]();
}

uint64_t sub_1AF7AAA30()
{
  return MEMORY[0x1F41298D0]();
}

uint64_t sub_1AF7AAA40()
{
  return MEMORY[0x1F41298D8]();
}

uint64_t sub_1AF7AAA50()
{
  return MEMORY[0x1F41298E0]();
}

uint64_t sub_1AF7AAA60()
{
  return MEMORY[0x1F41298E8]();
}

uint64_t sub_1AF7AAA70()
{
  return MEMORY[0x1F41298F8]();
}

uint64_t sub_1AF7AAA80()
{
  return MEMORY[0x1F4129900]();
}

uint64_t sub_1AF7AAA90()
{
  return MEMORY[0x1F4129908]();
}

uint64_t sub_1AF7AAAA0()
{
  return MEMORY[0x1F4129910]();
}

uint64_t sub_1AF7AAAB0()
{
  return MEMORY[0x1F4129918]();
}

uint64_t sub_1AF7AAAC0()
{
  return MEMORY[0x1F4129920]();
}

uint64_t sub_1AF7AAAD0()
{
  return MEMORY[0x1F4129928]();
}

uint64_t sub_1AF7AAAE0()
{
  return MEMORY[0x1F4129930]();
}

uint64_t sub_1AF7AAAF0()
{
  return MEMORY[0x1F4129938]();
}

uint64_t sub_1AF7AAB00()
{
  return MEMORY[0x1F4129940]();
}

uint64_t sub_1AF7AAB10()
{
  return MEMORY[0x1F4129948]();
}

uint64_t sub_1AF7AAB20()
{
  return MEMORY[0x1F4129950]();
}

uint64_t sub_1AF7AAB30()
{
  return MEMORY[0x1F4129958]();
}

uint64_t sub_1AF7AAB40()
{
  return MEMORY[0x1F4129960]();
}

uint64_t sub_1AF7AAB60()
{
  return MEMORY[0x1F4129980]();
}

uint64_t sub_1AF7AAB70()
{
  return MEMORY[0x1F4129988]();
}

uint64_t sub_1AF7AAB80()
{
  return MEMORY[0x1F4129990]();
}

uint64_t sub_1AF7AAB90()
{
  return MEMORY[0x1F4129998]();
}

uint64_t sub_1AF7AABA0()
{
  return MEMORY[0x1F4129A30]();
}

uint64_t sub_1AF7AABB0()
{
  return MEMORY[0x1F4129A68]();
}

uint64_t sub_1AF7AABC0()
{
  return MEMORY[0x1F4129A70]();
}

uint64_t sub_1AF7AABD0()
{
  return MEMORY[0x1F4129A78]();
}

uint64_t sub_1AF7AABE0()
{
  return MEMORY[0x1F4129A80]();
}

uint64_t sub_1AF7AABF0()
{
  return MEMORY[0x1F4129A88]();
}

uint64_t sub_1AF7AAC00()
{
  return MEMORY[0x1F4129A90]();
}

uint64_t sub_1AF7AAC10()
{
  return MEMORY[0x1F4129A98]();
}

uint64_t sub_1AF7AAC20()
{
  return MEMORY[0x1F4129AA0]();
}

uint64_t sub_1AF7AAC30()
{
  return MEMORY[0x1F4129AA8]();
}

uint64_t sub_1AF7AAC40()
{
  return MEMORY[0x1F4129AB0]();
}

uint64_t sub_1AF7AAC50()
{
  return MEMORY[0x1F4129AB8]();
}

uint64_t sub_1AF7AAC60()
{
  return MEMORY[0x1F4129AC0]();
}

uint64_t sub_1AF7AAC70()
{
  return MEMORY[0x1F4129AC8]();
}

uint64_t sub_1AF7AAC80()
{
  return MEMORY[0x1F4129AD0]();
}

uint64_t sub_1AF7AAC90()
{
  return MEMORY[0x1F4129AD8]();
}

uint64_t sub_1AF7AACA0()
{
  return MEMORY[0x1F4129AE0]();
}

uint64_t sub_1AF7AACB0()
{
  return MEMORY[0x1F4129AE8]();
}

uint64_t sub_1AF7AACC0()
{
  return MEMORY[0x1F4129AF0]();
}

uint64_t sub_1AF7AACD0()
{
  return MEMORY[0x1F4129B18]();
}

uint64_t sub_1AF7AACE0()
{
  return MEMORY[0x1F4129B20]();
}

uint64_t sub_1AF7AACF0()
{
  return MEMORY[0x1F4129B28]();
}

uint64_t sub_1AF7AAD00()
{
  return MEMORY[0x1F4129B30]();
}

uint64_t sub_1AF7AAD10()
{
  return MEMORY[0x1F4129B38]();
}

uint64_t sub_1AF7AAD20()
{
  return MEMORY[0x1F4129B40]();
}

uint64_t sub_1AF7AAD30()
{
  return MEMORY[0x1F4129B48]();
}

uint64_t sub_1AF7AAD40()
{
  return MEMORY[0x1F4129B50]();
}

uint64_t sub_1AF7AAD50()
{
  return MEMORY[0x1F4129B58]();
}

uint64_t sub_1AF7AAD60()
{
  return MEMORY[0x1F4129B60]();
}

uint64_t sub_1AF7AAD70()
{
  return MEMORY[0x1F4129B68]();
}

uint64_t sub_1AF7AAD80()
{
  return MEMORY[0x1F4129B70]();
}

uint64_t sub_1AF7AAD90()
{
  return MEMORY[0x1F4129B80]();
}

uint64_t sub_1AF7AADA0()
{
  return MEMORY[0x1F4129BB8]();
}

uint64_t sub_1AF7AADB0()
{
  return MEMORY[0x1F4129BC0]();
}

uint64_t sub_1AF7AADC0()
{
  return MEMORY[0x1F4129BC8]();
}

uint64_t sub_1AF7AADD0()
{
  return MEMORY[0x1F4129BD8]();
}

uint64_t sub_1AF7AADE0()
{
  return MEMORY[0x1F4129BE0]();
}

uint64_t sub_1AF7AADF0()
{
  return MEMORY[0x1F4129BE8]();
}

uint64_t sub_1AF7AAE00()
{
  return MEMORY[0x1F4129BF0]();
}

uint64_t sub_1AF7AAE10()
{
  return MEMORY[0x1F4129BF8]();
}

uint64_t sub_1AF7AAE20()
{
  return MEMORY[0x1F4129C08]();
}

uint64_t sub_1AF7AAE30()
{
  return MEMORY[0x1F4129C10]();
}

uint64_t sub_1AF7AAE40()
{
  return MEMORY[0x1F4129C18]();
}

uint64_t sub_1AF7AAE50()
{
  return MEMORY[0x1F4129C28]();
}

uint64_t sub_1AF7AAE60()
{
  return MEMORY[0x1F4129C30]();
}

uint64_t sub_1AF7AAE70()
{
  return MEMORY[0x1F4129C38]();
}

uint64_t sub_1AF7AAE80()
{
  return MEMORY[0x1F4129CB0]();
}

uint64_t sub_1AF7AAE90()
{
  return MEMORY[0x1F4129CC8]();
}

uint64_t sub_1AF7AAEA0()
{
  return MEMORY[0x1F4129D08]();
}

uint64_t sub_1AF7AAEB0()
{
  return MEMORY[0x1F4129D10]();
}

uint64_t sub_1AF7AAEC0()
{
  return MEMORY[0x1F4129D18]();
}

uint64_t sub_1AF7AAED0()
{
  return MEMORY[0x1F4129D20]();
}

uint64_t sub_1AF7AAEE0()
{
  return MEMORY[0x1F4129D28]();
}

uint64_t sub_1AF7AAEF0()
{
  return MEMORY[0x1F4129D30]();
}

uint64_t sub_1AF7AAF00()
{
  return MEMORY[0x1F4129D60]();
}

uint64_t sub_1AF7AAF10()
{
  return MEMORY[0x1F4129D68]();
}

uint64_t sub_1AF7AAF20()
{
  return MEMORY[0x1F4129D70]();
}

uint64_t sub_1AF7AAF30()
{
  return MEMORY[0x1F4129D78]();
}

uint64_t sub_1AF7AAF40()
{
  return MEMORY[0x1F4129D80]();
}

uint64_t sub_1AF7AAF50()
{
  return MEMORY[0x1F4165A48]();
}

uint64_t sub_1AF7AAF60()
{
  return MEMORY[0x1F4165AD8]();
}

uint64_t sub_1AF7AAF70()
{
  return MEMORY[0x1F4165F80]();
}

uint64_t sub_1AF7AAF80()
{
  return MEMORY[0x1F4165F88]();
}

uint64_t sub_1AF7AAF90()
{
  return MEMORY[0x1F4165F90]();
}

uint64_t sub_1AF7AAFA0()
{
  return MEMORY[0x1F4165FB8]();
}

uint64_t sub_1AF7AAFB0()
{
  return MEMORY[0x1F4165FD0]();
}

uint64_t sub_1AF7AAFC0()
{
  return MEMORY[0x1F4165FD8]();
}

uint64_t sub_1AF7AAFD0()
{
  return MEMORY[0x1F4165FE0]();
}

uint64_t sub_1AF7AAFE0()
{
  return MEMORY[0x1F4165FF8]();
}

uint64_t sub_1AF7AAFF0()
{
  return MEMORY[0x1F4166000]();
}

uint64_t sub_1AF7AB000()
{
  return MEMORY[0x1F4166008]();
}

uint64_t sub_1AF7AB010()
{
  return MEMORY[0x1F4166010]();
}

uint64_t sub_1AF7AB020()
{
  return MEMORY[0x1F4166028]();
}

uint64_t sub_1AF7AB030()
{
  return MEMORY[0x1F4166068]();
}

uint64_t sub_1AF7AB040()
{
  return MEMORY[0x1F4166070]();
}

uint64_t sub_1AF7AB050()
{
  return MEMORY[0x1F4166078]();
}

uint64_t sub_1AF7AB060()
{
  return MEMORY[0x1F4166090]();
}

uint64_t sub_1AF7AB070()
{
  return MEMORY[0x1F41660A8]();
}

uint64_t sub_1AF7AB080()
{
  return MEMORY[0x1F41660C0]();
}

uint64_t sub_1AF7AB090()
{
  return MEMORY[0x1F4166170]();
}

uint64_t sub_1AF7AB0A0()
{
  return MEMORY[0x1F41661A8]();
}

uint64_t sub_1AF7AB0B0()
{
  return MEMORY[0x1F41661B0]();
}

uint64_t sub_1AF7AB0C0()
{
  return MEMORY[0x1F41661B8]();
}

uint64_t sub_1AF7AB0D0()
{
  return MEMORY[0x1F41661C8]();
}

uint64_t sub_1AF7AB0E0()
{
  return MEMORY[0x1F41661D8]();
}

uint64_t sub_1AF7AB0F0()
{
  return MEMORY[0x1F41661E0]();
}

uint64_t sub_1AF7AB100()
{
  return MEMORY[0x1F41661E8]();
}

uint64_t sub_1AF7AB110()
{
  return MEMORY[0x1F41661F0]();
}

uint64_t sub_1AF7AB120()
{
  return MEMORY[0x1F4166200]();
}

uint64_t sub_1AF7AB130()
{
  return MEMORY[0x1F4166208]();
}

uint64_t sub_1AF7AB140()
{
  return MEMORY[0x1F4166210]();
}

uint64_t sub_1AF7AB150()
{
  return MEMORY[0x1F4166220]();
}

uint64_t sub_1AF7AB160()
{
  return MEMORY[0x1F4166230]();
}

uint64_t sub_1AF7AB170()
{
  return MEMORY[0x1F4166240]();
}

uint64_t sub_1AF7AB180()
{
  return MEMORY[0x1F4166288]();
}

uint64_t sub_1AF7AB190()
{
  return MEMORY[0x1F41662A8]();
}

uint64_t sub_1AF7AB1A0()
{
  return MEMORY[0x1F4166328]();
}

uint64_t sub_1AF7AB1B0()
{
  return MEMORY[0x1F4166340]();
}

uint64_t sub_1AF7AB1C0()
{
  return MEMORY[0x1F4166368]();
}

uint64_t sub_1AF7AB1D0()
{
  return MEMORY[0x1F41663B0]();
}

uint64_t sub_1AF7AB1E0()
{
  return MEMORY[0x1F41663E8]();
}

uint64_t sub_1AF7AB1F0()
{
  return MEMORY[0x1F41663F0]();
}

uint64_t sub_1AF7AB200()
{
  return MEMORY[0x1F40D66F8]();
}

uint64_t sub_1AF7AB210()
{
  return MEMORY[0x1F40D6848]();
}

uint64_t sub_1AF7AB220()
{
  return MEMORY[0x1F40D6880]();
}

uint64_t sub_1AF7AB230()
{
  return MEMORY[0x1F40D6908]();
}

uint64_t sub_1AF7AB240()
{
  return MEMORY[0x1F40D6940]();
}

uint64_t sub_1AF7AB250()
{
  return MEMORY[0x1F40D6950]();
}

uint64_t sub_1AF7AB260()
{
  return MEMORY[0x1F40F7D68]();
}

uint64_t sub_1AF7AB270()
{
  return MEMORY[0x1F40D69E0]();
}

uint64_t sub_1AF7AB280()
{
  return MEMORY[0x1F40D6A00]();
}

uint64_t sub_1AF7AB290()
{
  return MEMORY[0x1F40D6A08]();
}

uint64_t sub_1AF7AB2A0()
{
  return MEMORY[0x1F40D6A20]();
}

uint64_t sub_1AF7AB2B0()
{
  return MEMORY[0x1F40D6B48]();
}

uint64_t sub_1AF7AB2C0()
{
  return MEMORY[0x1F40D6B80]();
}

uint64_t sub_1AF7AB2D0()
{
  return MEMORY[0x1F40D6B88]();
}

uint64_t sub_1AF7AB2E0()
{
  return MEMORY[0x1F40D6B98]();
}

uint64_t sub_1AF7AB2F0()
{
  return MEMORY[0x1F40D6BA0]();
}

uint64_t sub_1AF7AB300()
{
  return MEMORY[0x1F40D6BA8]();
}

uint64_t sub_1AF7AB310()
{
  return MEMORY[0x1F40D6BB8]();
}

uint64_t sub_1AF7AB320()
{
  return MEMORY[0x1F40D6BD8]();
}

uint64_t sub_1AF7AB330()
{
  return MEMORY[0x1F40D6BE0]();
}

uint64_t sub_1AF7AB340()
{
  return MEMORY[0x1F40D6C08]();
}

uint64_t sub_1AF7AB350()
{
  return MEMORY[0x1F40D6C50]();
}

uint64_t sub_1AF7AB360()
{
  return MEMORY[0x1F40D6C98]();
}

uint64_t sub_1AF7AB370()
{
  return MEMORY[0x1F40D6CC0]();
}

uint64_t sub_1AF7AB380()
{
  return MEMORY[0x1F40D6CF8]();
}

uint64_t sub_1AF7AB390()
{
  return MEMORY[0x1F40D6D00]();
}

uint64_t sub_1AF7AB3A0()
{
  return MEMORY[0x1F40D6D40]();
}

uint64_t sub_1AF7AB3B0()
{
  return MEMORY[0x1F40D6D80]();
}

uint64_t sub_1AF7AB3C0()
{
  return MEMORY[0x1F40D6DF0]();
}

uint64_t sub_1AF7AB3D0()
{
  return MEMORY[0x1F40D6E18]();
}

uint64_t sub_1AF7AB3E0()
{
  return MEMORY[0x1F40D6E40]();
}

uint64_t sub_1AF7AB3F0()
{
  return MEMORY[0x1F414FFB8]();
}

uint64_t sub_1AF7AB400()
{
  return MEMORY[0x1F414FFC8]();
}

uint64_t sub_1AF7AB410()
{
  return MEMORY[0x1F414FFD0]();
}

uint64_t sub_1AF7AB420()
{
  return MEMORY[0x1F414FFD8]();
}

uint64_t sub_1AF7AB430()
{
  return MEMORY[0x1F414FFE0]();
}

uint64_t sub_1AF7AB440()
{
  return MEMORY[0x1F414FFE8]();
}

uint64_t sub_1AF7AB450()
{
  return MEMORY[0x1F414FFF0]();
}

uint64_t sub_1AF7AB460()
{
  return MEMORY[0x1F414FFF8]();
}

uint64_t sub_1AF7AB4C0()
{
  return MEMORY[0x1F4150030]();
}

uint64_t sub_1AF7AB4D0()
{
  return MEMORY[0x1F4150038]();
}

uint64_t sub_1AF7AB4F0()
{
  return MEMORY[0x1F4150068]();
}

uint64_t sub_1AF7AB510()
{
  return MEMORY[0x1F41500F8]();
}

uint64_t sub_1AF7AB520()
{
  return MEMORY[0x1F4150110]();
}

uint64_t sub_1AF7AB530()
{
  return MEMORY[0x1F4150128]();
}

uint64_t sub_1AF7AB540()
{
  return MEMORY[0x1F4150130]();
}

uint64_t sub_1AF7AB550()
{
  return MEMORY[0x1F4150140]();
}

uint64_t sub_1AF7AB560()
{
  return MEMORY[0x1F4150148]();
}

uint64_t sub_1AF7AB570()
{
  return MEMORY[0x1F4150150]();
}

uint64_t sub_1AF7AB580()
{
  return MEMORY[0x1F4150158]();
}

uint64_t sub_1AF7AB590()
{
  return MEMORY[0x1F4150160]();
}

uint64_t sub_1AF7AB5A0()
{
  return MEMORY[0x1F4150168]();
}

uint64_t sub_1AF7AB5B0()
{
  return MEMORY[0x1F4150170]();
}

uint64_t sub_1AF7AB5C0()
{
  return MEMORY[0x1F4150178]();
}

uint64_t sub_1AF7AB5D0()
{
  return MEMORY[0x1F4150180]();
}

uint64_t sub_1AF7AB5E0()
{
  return MEMORY[0x1F4150188]();
}

uint64_t sub_1AF7AB5F0()
{
  return MEMORY[0x1F40F7D88]();
}

uint64_t sub_1AF7AB600()
{
  return MEMORY[0x1F40F7DA0]();
}

uint64_t sub_1AF7AB610()
{
  return MEMORY[0x1F40F7E20]();
}

uint64_t sub_1AF7AB620()
{
  return MEMORY[0x1F40F7E30]();
}

uint64_t sub_1AF7AB630()
{
  return MEMORY[0x1F40F7E40]();
}

uint64_t sub_1AF7AB640()
{
  return MEMORY[0x1F40F7E70]();
}

uint64_t sub_1AF7AB650()
{
  return MEMORY[0x1F40F7E80]();
}

uint64_t sub_1AF7AB660()
{
  return MEMORY[0x1F40F7EC0]();
}

uint64_t sub_1AF7AB670()
{
  return MEMORY[0x1F40F7EC8]();
}

uint64_t sub_1AF7AB680()
{
  return MEMORY[0x1F40F7EE8]();
}

uint64_t sub_1AF7AB690()
{
  return MEMORY[0x1F40F7F20]();
}

uint64_t sub_1AF7AB6A0()
{
  return MEMORY[0x1F40F7F60]();
}

uint64_t sub_1AF7AB6B0()
{
  return MEMORY[0x1F40F8030]();
}

uint64_t sub_1AF7AB6C0()
{
  return MEMORY[0x1F40F8050]();
}

uint64_t sub_1AF7AB6D0()
{
  return MEMORY[0x1F40F8068]();
}

uint64_t sub_1AF7AB6E0()
{
  return MEMORY[0x1F40F8070]();
}

uint64_t sub_1AF7AB6F0()
{
  return MEMORY[0x1F40F8090]();
}

uint64_t sub_1AF7AB700()
{
  return MEMORY[0x1F40F80A0]();
}

uint64_t sub_1AF7AB710()
{
  return MEMORY[0x1F40F80D0]();
}

uint64_t sub_1AF7AB720()
{
  return MEMORY[0x1F40F80D8]();
}

uint64_t sub_1AF7AB730()
{
  return MEMORY[0x1F40F8108]();
}

uint64_t sub_1AF7AB740()
{
  return MEMORY[0x1F40F8118]();
}

uint64_t sub_1AF7AB750()
{
  return MEMORY[0x1F40F8148]();
}

uint64_t sub_1AF7AB760()
{
  return MEMORY[0x1F40F81E0]();
}

uint64_t sub_1AF7AB770()
{
  return MEMORY[0x1F40F81E8]();
}

uint64_t sub_1AF7AB780()
{
  return MEMORY[0x1F40F8208]();
}

uint64_t sub_1AF7AB790()
{
  return MEMORY[0x1F40F8210]();
}

uint64_t sub_1AF7AB7A0()
{
  return MEMORY[0x1F40F8218]();
}

uint64_t sub_1AF7AB7B0()
{
  return MEMORY[0x1F40F8288]();
}

uint64_t sub_1AF7AB7C0()
{
  return MEMORY[0x1F40F82B8]();
}

uint64_t sub_1AF7AB7D0()
{
  return MEMORY[0x1F40F82C8]();
}

uint64_t sub_1AF7AB7E0()
{
  return MEMORY[0x1F40F82D8]();
}

uint64_t sub_1AF7AB7F0()
{
  return MEMORY[0x1F40F8318]();
}

uint64_t sub_1AF7AB800()
{
  return MEMORY[0x1F40F8338]();
}

uint64_t sub_1AF7AB810()
{
  return MEMORY[0x1F40F8350]();
}

uint64_t sub_1AF7AB820()
{
  return MEMORY[0x1F40F8360]();
}

uint64_t sub_1AF7AB830()
{
  return MEMORY[0x1F40F8378]();
}

uint64_t sub_1AF7AB840()
{
  return MEMORY[0x1F40F83E0]();
}

uint64_t sub_1AF7AB850()
{
  return MEMORY[0x1F40F83F0]();
}

uint64_t sub_1AF7AB860()
{
  return MEMORY[0x1F40F8400]();
}

uint64_t sub_1AF7AB870()
{
  return MEMORY[0x1F40F8410]();
}

uint64_t sub_1AF7AB880()
{
  return MEMORY[0x1F40F8418]();
}

uint64_t sub_1AF7AB890()
{
  return MEMORY[0x1F40F8430]();
}

uint64_t sub_1AF7AB8A0()
{
  return MEMORY[0x1F40F8438]();
}

uint64_t sub_1AF7AB8B0()
{
  return MEMORY[0x1F40F8440]();
}

uint64_t sub_1AF7AB8C0()
{
  return MEMORY[0x1F40F8450]();
}

uint64_t sub_1AF7AB8D0()
{
  return MEMORY[0x1F40F8470]();
}

uint64_t sub_1AF7AB8E0()
{
  return MEMORY[0x1F40F8488]();
}

uint64_t sub_1AF7AB8F0()
{
  return MEMORY[0x1F40F84B8]();
}

uint64_t sub_1AF7AB900()
{
  return MEMORY[0x1F40F84C8]();
}

uint64_t sub_1AF7AB910()
{
  return MEMORY[0x1F40F84E8]();
}

uint64_t sub_1AF7AB920()
{
  return MEMORY[0x1F40F84F0]();
}

uint64_t sub_1AF7AB930()
{
  return MEMORY[0x1F40F8590]();
}

uint64_t sub_1AF7AB940()
{
  return MEMORY[0x1F40F8598]();
}

uint64_t sub_1AF7AB950()
{
  return MEMORY[0x1F40F85A0]();
}

uint64_t sub_1AF7AB960()
{
  return MEMORY[0x1F40F85A8]();
}

uint64_t sub_1AF7AB970()
{
  return MEMORY[0x1F40F85B8]();
}

uint64_t sub_1AF7AB980()
{
  return MEMORY[0x1F40F85C8]();
}

uint64_t sub_1AF7AB990()
{
  return MEMORY[0x1F40F85D8]();
}

uint64_t sub_1AF7AB9A0()
{
  return MEMORY[0x1F40F8618]();
}

uint64_t sub_1AF7AB9B0()
{
  return MEMORY[0x1F40F8630]();
}

uint64_t sub_1AF7AB9C0()
{
  return MEMORY[0x1F40F8638]();
}

uint64_t sub_1AF7AB9D0()
{
  return MEMORY[0x1F40F8650]();
}

uint64_t sub_1AF7AB9E0()
{
  return MEMORY[0x1F40F8658]();
}

uint64_t sub_1AF7ABA00()
{
  return MEMORY[0x1F40F8718]();
}

uint64_t sub_1AF7ABA10()
{
  return MEMORY[0x1F40F8748]();
}

uint64_t sub_1AF7ABA20()
{
  return MEMORY[0x1F40F8770]();
}

uint64_t sub_1AF7ABA30()
{
  return MEMORY[0x1F40F8798]();
}

uint64_t sub_1AF7ABA40()
{
  return MEMORY[0x1F40F87F0]();
}

uint64_t sub_1AF7ABA50()
{
  return MEMORY[0x1F40F8930]();
}

uint64_t sub_1AF7ABA60()
{
  return MEMORY[0x1F40F8950]();
}

uint64_t sub_1AF7ABA70()
{
  return MEMORY[0x1F40F8990]();
}

uint64_t sub_1AF7ABA80()
{
  return MEMORY[0x1F40F8A08]();
}

uint64_t sub_1AF7ABA90()
{
  return MEMORY[0x1F40F8A20]();
}

uint64_t sub_1AF7ABAA0()
{
  return MEMORY[0x1F40F8A28]();
}

uint64_t sub_1AF7ABAB0()
{
  return MEMORY[0x1F40F8B08]();
}

uint64_t sub_1AF7ABAC0()
{
  return MEMORY[0x1F40F8B10]();
}

uint64_t sub_1AF7ABAD0()
{
  return MEMORY[0x1F40F8B20]();
}

uint64_t sub_1AF7ABAE0()
{
  return MEMORY[0x1F40F8B48]();
}

uint64_t sub_1AF7ABAF0()
{
  return MEMORY[0x1F40F8BA0]();
}

uint64_t sub_1AF7ABB00()
{
  return MEMORY[0x1F40F8C00]();
}

uint64_t sub_1AF7ABB10()
{
  return MEMORY[0x1F40F8C18]();
}

uint64_t sub_1AF7ABB20()
{
  return MEMORY[0x1F40F8C28]();
}

uint64_t sub_1AF7ABB30()
{
  return MEMORY[0x1F40F8C58]();
}

uint64_t sub_1AF7ABB40()
{
  return MEMORY[0x1F40F8C60]();
}

uint64_t sub_1AF7ABB50()
{
  return MEMORY[0x1F40F8C70]();
}

uint64_t sub_1AF7ABB60()
{
  return MEMORY[0x1F40F8D50]();
}

uint64_t sub_1AF7ABB70()
{
  return MEMORY[0x1F40F8D68]();
}

uint64_t sub_1AF7ABB80()
{
  return MEMORY[0x1F40F8D70]();
}

uint64_t sub_1AF7ABB90()
{
  return MEMORY[0x1F40F8DE8]();
}

uint64_t sub_1AF7ABBA0()
{
  return MEMORY[0x1F40F8DF0]();
}

uint64_t sub_1AF7ABBB0()
{
  return MEMORY[0x1F40F8E08]();
}

uint64_t sub_1AF7ABBC0()
{
  return MEMORY[0x1F40F8E38]();
}

uint64_t sub_1AF7ABBD0()
{
  return MEMORY[0x1F40F8E70]();
}

uint64_t sub_1AF7ABBE0()
{
  return MEMORY[0x1F40F8E90]();
}

uint64_t sub_1AF7ABBF0()
{
  return MEMORY[0x1F40F8EA0]();
}

uint64_t sub_1AF7ABC00()
{
  return MEMORY[0x1F40F8ED8]();
}

uint64_t sub_1AF7ABC10()
{
  return MEMORY[0x1F40F8F40]();
}

uint64_t sub_1AF7ABC20()
{
  return MEMORY[0x1F40F8F50]();
}

uint64_t sub_1AF7ABC30()
{
  return MEMORY[0x1F40F90A8]();
}

uint64_t sub_1AF7ABC40()
{
  return MEMORY[0x1F40F90C0]();
}

uint64_t sub_1AF7ABC50()
{
  return MEMORY[0x1F40F90C8]();
}

uint64_t sub_1AF7ABC60()
{
  return MEMORY[0x1F40F90D8]();
}

uint64_t sub_1AF7ABC70()
{
  return MEMORY[0x1F40F90E0]();
}

uint64_t sub_1AF7ABC80()
{
  return MEMORY[0x1F40F9100]();
}

uint64_t sub_1AF7ABC90()
{
  return MEMORY[0x1F40F9110]();
}

uint64_t sub_1AF7ABCA0()
{
  return MEMORY[0x1F40F9138]();
}

uint64_t sub_1AF7ABCB0()
{
  return MEMORY[0x1F40F9150]();
}

uint64_t sub_1AF7ABCC0()
{
  return MEMORY[0x1F40F9160]();
}

uint64_t sub_1AF7ABCD0()
{
  return MEMORY[0x1F40F9168]();
}

uint64_t sub_1AF7ABCE0()
{
  return MEMORY[0x1F40F91E0]();
}

uint64_t sub_1AF7ABCF0()
{
  return MEMORY[0x1F40F91F8]();
}

uint64_t sub_1AF7ABD00()
{
  return MEMORY[0x1F40F9208]();
}

uint64_t sub_1AF7ABD10()
{
  return MEMORY[0x1F40F9210]();
}

uint64_t sub_1AF7ABD20()
{
  return MEMORY[0x1F40F9248]();
}

uint64_t sub_1AF7ABD30()
{
  return MEMORY[0x1F40F9250]();
}

uint64_t sub_1AF7ABD40()
{
  return MEMORY[0x1F40F9268]();
}

uint64_t sub_1AF7ABD50()
{
  return MEMORY[0x1F40F9278]();
}

uint64_t sub_1AF7ABD60()
{
  return MEMORY[0x1F40F9280]();
}

uint64_t sub_1AF7ABD70()
{
  return MEMORY[0x1F40F9298]();
}

uint64_t sub_1AF7ABD80()
{
  return MEMORY[0x1F40F9308]();
}

uint64_t sub_1AF7ABD90()
{
  return MEMORY[0x1F40F9320]();
}

uint64_t sub_1AF7ABDA0()
{
  return MEMORY[0x1F40F9360]();
}

uint64_t sub_1AF7ABDB0()
{
  return MEMORY[0x1F40F93A8]();
}

uint64_t sub_1AF7ABDC0()
{
  return MEMORY[0x1F40F93B0]();
}

uint64_t sub_1AF7ABDD0()
{
  return MEMORY[0x1F40F93C0]();
}

uint64_t sub_1AF7ABDE0()
{
  return MEMORY[0x1F40F93D0]();
}

uint64_t sub_1AF7ABDF0()
{
  return MEMORY[0x1F40F93E8]();
}

uint64_t sub_1AF7ABE00()
{
  return MEMORY[0x1F40F9400]();
}

uint64_t sub_1AF7ABE10()
{
  return MEMORY[0x1F40F9410]();
}

uint64_t sub_1AF7ABE20()
{
  return MEMORY[0x1F40F9470]();
}

uint64_t sub_1AF7ABE30()
{
  return MEMORY[0x1F40F9480]();
}

uint64_t sub_1AF7ABE40()
{
  return MEMORY[0x1F40F9550]();
}

uint64_t sub_1AF7ABE50()
{
  return MEMORY[0x1F40F9568]();
}

uint64_t sub_1AF7ABE60()
{
  return MEMORY[0x1F40F9570]();
}

uint64_t sub_1AF7ABE70()
{
  return MEMORY[0x1F40F9588]();
}

uint64_t sub_1AF7ABE80()
{
  return MEMORY[0x1F40F95B8]();
}

uint64_t sub_1AF7ABE90()
{
  return MEMORY[0x1F40F95C0]();
}

uint64_t sub_1AF7ABEA0()
{
  return MEMORY[0x1F40F9618]();
}

uint64_t sub_1AF7ABEB0()
{
  return MEMORY[0x1F40F9628]();
}

uint64_t sub_1AF7ABEC0()
{
  return MEMORY[0x1F4103FB0]();
}

uint64_t sub_1AF7ABED0()
{
  return MEMORY[0x1F4103FC0]();
}

uint64_t sub_1AF7ABEE0()
{
  return MEMORY[0x1F40F9648]();
}

uint64_t sub_1AF7ABEF0()
{
  return MEMORY[0x1F40F9658]();
}

uint64_t sub_1AF7ABF00()
{
  return MEMORY[0x1F40F9660]();
}

uint64_t sub_1AF7ABF10()
{
  return MEMORY[0x1F40F9670]();
}

uint64_t sub_1AF7ABF20()
{
  return MEMORY[0x1F40F9688]();
}

uint64_t sub_1AF7ABF30()
{
  return MEMORY[0x1F40F9690]();
}

uint64_t sub_1AF7ABF40()
{
  return MEMORY[0x1F40F96C8]();
}

uint64_t sub_1AF7ABF50()
{
  return MEMORY[0x1F40F96D8]();
}

uint64_t sub_1AF7ABF60()
{
  return MEMORY[0x1F40F96F8]();
}

uint64_t sub_1AF7ABF70()
{
  return MEMORY[0x1F40F9708]();
}

uint64_t sub_1AF7ABF80()
{
  return MEMORY[0x1F40F97B0]();
}

uint64_t sub_1AF7ABF90()
{
  return MEMORY[0x1F40F97C8]();
}

uint64_t sub_1AF7ABFA0()
{
  return MEMORY[0x1F40F97D8]();
}

uint64_t sub_1AF7ABFB0()
{
  return MEMORY[0x1F40F9838]();
}

uint64_t sub_1AF7ABFC0()
{
  return MEMORY[0x1F40F9848]();
}

uint64_t sub_1AF7ABFD0()
{
  return MEMORY[0x1F40F98A0]();
}

uint64_t sub_1AF7ABFE0()
{
  return MEMORY[0x1F40F98C0]();
}

uint64_t sub_1AF7ABFF0()
{
  return MEMORY[0x1F40F9A18]();
}

uint64_t sub_1AF7AC000()
{
  return MEMORY[0x1F40F9A20]();
}

uint64_t sub_1AF7AC010()
{
  return MEMORY[0x1F40F9A38]();
}

uint64_t sub_1AF7AC020()
{
  return MEMORY[0x1F40F9A50]();
}

uint64_t sub_1AF7AC030()
{
  return MEMORY[0x1F40F9AE8]();
}

uint64_t sub_1AF7AC040()
{
  return MEMORY[0x1F40F9B50]();
}

uint64_t sub_1AF7AC050()
{
  return MEMORY[0x1F40F9B68]();
}

uint64_t sub_1AF7AC060()
{
  return MEMORY[0x1F40F9C30]();
}

uint64_t sub_1AF7AC070()
{
  return MEMORY[0x1F40F9C58]();
}

uint64_t sub_1AF7AC080()
{
  return MEMORY[0x1F40F9C60]();
}

uint64_t sub_1AF7AC090()
{
  return MEMORY[0x1F40F9C68]();
}

uint64_t sub_1AF7AC0A0()
{
  return MEMORY[0x1F40F9C80]();
}

uint64_t sub_1AF7AC0B0()
{
  return MEMORY[0x1F40F9C98]();
}

uint64_t sub_1AF7AC0C0()
{
  return MEMORY[0x1F40F9CA8]();
}

uint64_t sub_1AF7AC0D0()
{
  return MEMORY[0x1F40F9CB8]();
}

uint64_t sub_1AF7AC0E0()
{
  return MEMORY[0x1F40F9CD8]();
}

uint64_t sub_1AF7AC0F0()
{
  return MEMORY[0x1F40F9CE8]();
}

uint64_t sub_1AF7AC100()
{
  return MEMORY[0x1F40F9D78]();
}

uint64_t sub_1AF7AC110()
{
  return MEMORY[0x1F40F9D98]();
}

uint64_t sub_1AF7AC120()
{
  return MEMORY[0x1F40F9E00]();
}

uint64_t sub_1AF7AC130()
{
  return MEMORY[0x1F40F9E08]();
}

uint64_t sub_1AF7AC140()
{
  return MEMORY[0x1F40F9E10]();
}

uint64_t sub_1AF7AC150()
{
  return MEMORY[0x1F40F9E40]();
}

uint64_t sub_1AF7AC160()
{
  return MEMORY[0x1F40F9E50]();
}

uint64_t sub_1AF7AC170()
{
  return MEMORY[0x1F40F9E60]();
}

uint64_t sub_1AF7AC180()
{
  return MEMORY[0x1F40F9E70]();
}

uint64_t sub_1AF7AC1A0()
{
  return MEMORY[0x1F40F9E90]();
}

uint64_t sub_1AF7AC1B0()
{
  return MEMORY[0x1F40F9E98]();
}

uint64_t sub_1AF7AC1C0()
{
  return MEMORY[0x1F40F9EB0]();
}

uint64_t sub_1AF7AC1D0()
{
  return MEMORY[0x1F40F9EC0]();
}

uint64_t sub_1AF7AC1E0()
{
  return MEMORY[0x1F40F9ED0]();
}

uint64_t sub_1AF7AC1F0()
{
  return MEMORY[0x1F40F9EE0]();
}

uint64_t sub_1AF7AC210()
{
  return MEMORY[0x1F40F9F00]();
}

uint64_t sub_1AF7AC220()
{
  return MEMORY[0x1F40F9FA8]();
}

uint64_t sub_1AF7AC230()
{
  return MEMORY[0x1F40F9FF8]();
}

uint64_t sub_1AF7AC240()
{
  return MEMORY[0x1F40FA080]();
}

uint64_t sub_1AF7AC250()
{
  return MEMORY[0x1F40FA0D0]();
}

uint64_t sub_1AF7AC260()
{
  return MEMORY[0x1F40FA0F0]();
}

uint64_t sub_1AF7AC270()
{
  return MEMORY[0x1F40FA150]();
}

uint64_t sub_1AF7AC280()
{
  return MEMORY[0x1F40FA188]();
}

uint64_t sub_1AF7AC290()
{
  return MEMORY[0x1F40FA1A8]();
}

uint64_t sub_1AF7AC2A0()
{
  return MEMORY[0x1F40FA278]();
}

uint64_t sub_1AF7AC2B0()
{
  return MEMORY[0x1F40FA288]();
}

uint64_t sub_1AF7AC2C0()
{
  return MEMORY[0x1F40FA298]();
}

uint64_t sub_1AF7AC2D0()
{
  return MEMORY[0x1F40FA2C0]();
}

uint64_t sub_1AF7AC2E0()
{
  return MEMORY[0x1F40FA2E0]();
}

uint64_t sub_1AF7AC2F0()
{
  return MEMORY[0x1F40FA378]();
}

uint64_t sub_1AF7AC300()
{
  return MEMORY[0x1F40FA390]();
}

uint64_t sub_1AF7AC310()
{
  return MEMORY[0x1F40FA3A0]();
}

uint64_t sub_1AF7AC320()
{
  return MEMORY[0x1F40FA3B8]();
}

uint64_t sub_1AF7AC330()
{
  return MEMORY[0x1F40FA470]();
}

uint64_t sub_1AF7AC340()
{
  return MEMORY[0x1F40FA558]();
}

uint64_t sub_1AF7AC350()
{
  return MEMORY[0x1F40FA580]();
}

uint64_t sub_1AF7AC360()
{
  return MEMORY[0x1F40FA650]();
}

uint64_t sub_1AF7AC370()
{
  return MEMORY[0x1F40FA690]();
}

uint64_t sub_1AF7AC380()
{
  return MEMORY[0x1F40FA6A0]();
}

uint64_t sub_1AF7AC390()
{
  return MEMORY[0x1F40FA6B8]();
}

uint64_t sub_1AF7AC3A0()
{
  return MEMORY[0x1F40FA6C0]();
}

uint64_t sub_1AF7AC3B0()
{
  return MEMORY[0x1F40FA6D8]();
}

uint64_t sub_1AF7AC3C0()
{
  return MEMORY[0x1F40FA7F8]();
}

uint64_t sub_1AF7AC3D0()
{
  return MEMORY[0x1F40FA810]();
}

uint64_t sub_1AF7AC3E0()
{
  return MEMORY[0x1F40FA868]();
}

uint64_t sub_1AF7AC3F0()
{
  return MEMORY[0x1F40FA880]();
}

uint64_t sub_1AF7AC400()
{
  return MEMORY[0x1F40FA8C0]();
}

uint64_t sub_1AF7AC410()
{
  return MEMORY[0x1F40FA8C8]();
}

uint64_t sub_1AF7AC420()
{
  return MEMORY[0x1F40FAAA8]();
}

uint64_t sub_1AF7AC430()
{
  return MEMORY[0x1F40FAAC0]();
}

uint64_t sub_1AF7AC440()
{
  return MEMORY[0x1F40FAAC8]();
}

uint64_t sub_1AF7AC450()
{
  return MEMORY[0x1F40FAAD8]();
}

uint64_t sub_1AF7AC460()
{
  return MEMORY[0x1F40FAB00]();
}

uint64_t sub_1AF7AC470()
{
  return MEMORY[0x1F40FAB08]();
}

uint64_t sub_1AF7AC480()
{
  return MEMORY[0x1F40FAB18]();
}

uint64_t sub_1AF7AC4A0()
{
  return MEMORY[0x1F40FAB38]();
}

uint64_t sub_1AF7AC4B0()
{
  return MEMORY[0x1F40FAB48]();
}

uint64_t sub_1AF7AC4C0()
{
  return MEMORY[0x1F40FAB58]();
}

uint64_t sub_1AF7AC4E0()
{
  return MEMORY[0x1F40FAB80]();
}

uint64_t sub_1AF7AC4F0()
{
  return MEMORY[0x1F40FABC8]();
}

uint64_t sub_1AF7AC500()
{
  return MEMORY[0x1F40FABD0]();
}

uint64_t sub_1AF7AC510()
{
  return MEMORY[0x1F40FABD8]();
}

uint64_t sub_1AF7AC520()
{
  return MEMORY[0x1F40FABE8]();
}

uint64_t sub_1AF7AC530()
{
  return MEMORY[0x1F40FAC98]();
}

uint64_t sub_1AF7AC540()
{
  return MEMORY[0x1F40FAD00]();
}

uint64_t sub_1AF7AC550()
{
  return MEMORY[0x1F40FAD48]();
}

uint64_t sub_1AF7AC560()
{
  return MEMORY[0x1F40FAD58]();
}

uint64_t sub_1AF7AC570()
{
  return MEMORY[0x1F40FAD68]();
}

uint64_t sub_1AF7AC580()
{
  return MEMORY[0x1F40FAD78]();
}

uint64_t sub_1AF7AC590()
{
  return MEMORY[0x1F40FAD88]();
}

uint64_t sub_1AF7AC5A0()
{
  return MEMORY[0x1F40FAD98]();
}

uint64_t sub_1AF7AC5B0()
{
  return MEMORY[0x1F40FADB8]();
}

uint64_t sub_1AF7AC5C0()
{
  return MEMORY[0x1F40FADC0]();
}

uint64_t sub_1AF7AC5D0()
{
  return MEMORY[0x1F40FADD8]();
}

uint64_t sub_1AF7AC5E0()
{
  return MEMORY[0x1F40FADE0]();
}

uint64_t sub_1AF7AC5F0()
{
  return MEMORY[0x1F40FADF8]();
}

uint64_t sub_1AF7AC600()
{
  return MEMORY[0x1F40FAE00]();
}

uint64_t sub_1AF7AC610()
{
  return MEMORY[0x1F40FAE18]();
}

uint64_t sub_1AF7AC620()
{
  return MEMORY[0x1F40FAE28]();
}

uint64_t sub_1AF7AC630()
{
  return MEMORY[0x1F40FAE30]();
}

uint64_t sub_1AF7AC640()
{
  return MEMORY[0x1F40FAE58]();
}

uint64_t sub_1AF7AC650()
{
  return MEMORY[0x1F40FAE68]();
}

uint64_t sub_1AF7AC660()
{
  return MEMORY[0x1F40FAF00]();
}

uint64_t sub_1AF7AC670()
{
  return MEMORY[0x1F40FAF48]();
}

uint64_t sub_1AF7AC680()
{
  return MEMORY[0x1F40FAF60]();
}

uint64_t sub_1AF7AC690()
{
  return MEMORY[0x1F40FAF80]();
}

uint64_t sub_1AF7AC6A0()
{
  return MEMORY[0x1F40FAFE0]();
}

uint64_t sub_1AF7AC6B0()
{
  return MEMORY[0x1F40FAFF0]();
}

uint64_t sub_1AF7AC6C0()
{
  return MEMORY[0x1F40FB000]();
}

uint64_t sub_1AF7AC6D0()
{
  return MEMORY[0x1F40FB018]();
}

uint64_t sub_1AF7AC6E0()
{
  return MEMORY[0x1F40FB038]();
}

uint64_t sub_1AF7AC6F0()
{
  return MEMORY[0x1F40FB068]();
}

uint64_t sub_1AF7AC700()
{
  return MEMORY[0x1F40FB078]();
}

uint64_t sub_1AF7AC710()
{
  return MEMORY[0x1F40FB088]();
}

uint64_t sub_1AF7AC720()
{
  return MEMORY[0x1F40FB0D0]();
}

uint64_t sub_1AF7AC730()
{
  return MEMORY[0x1F40FB0E8]();
}

uint64_t sub_1AF7AC740()
{
  return MEMORY[0x1F40FB108]();
}

uint64_t sub_1AF7AC750()
{
  return MEMORY[0x1F40FB120]();
}

uint64_t sub_1AF7AC760()
{
  return MEMORY[0x1F40FB130]();
}

uint64_t sub_1AF7AC770()
{
  return MEMORY[0x1F40FB198]();
}

uint64_t sub_1AF7AC780()
{
  return MEMORY[0x1F40FB1B0]();
}

uint64_t sub_1AF7AC790()
{
  return MEMORY[0x1F40FB1E0]();
}

uint64_t sub_1AF7AC7A0()
{
  return MEMORY[0x1F40FB1F0]();
}

uint64_t sub_1AF7AC7B0()
{
  return MEMORY[0x1F40FB1F8]();
}

uint64_t sub_1AF7AC7C0()
{
  return MEMORY[0x1F40FB268]();
}

uint64_t sub_1AF7AC7D0()
{
  return MEMORY[0x1F40FB280]();
}

uint64_t sub_1AF7AC7E0()
{
  return MEMORY[0x1F40FB290]();
}

uint64_t sub_1AF7AC7F0()
{
  return MEMORY[0x1F40FB2A0]();
}

uint64_t sub_1AF7AC800()
{
  return MEMORY[0x1F40FB2D0]();
}

uint64_t sub_1AF7AC810()
{
  return MEMORY[0x1F40FB2F0]();
}

uint64_t sub_1AF7AC820()
{
  return MEMORY[0x1F40FB310]();
}

uint64_t sub_1AF7AC830()
{
  return MEMORY[0x1F40FB3A0]();
}

uint64_t sub_1AF7AC840()
{
  return MEMORY[0x1F40FB3B0]();
}

uint64_t sub_1AF7AC850()
{
  return MEMORY[0x1F40FB3C0]();
}

uint64_t sub_1AF7AC860()
{
  return MEMORY[0x1F40FB438]();
}

uint64_t sub_1AF7AC870()
{
  return MEMORY[0x1F40FB440]();
}

uint64_t sub_1AF7AC880()
{
  return MEMORY[0x1F40FB450]();
}

uint64_t sub_1AF7AC890()
{
  return MEMORY[0x1F40FB460]();
}

uint64_t sub_1AF7AC8A0()
{
  return MEMORY[0x1F40FB558]();
}

uint64_t sub_1AF7AC8B0()
{
  return MEMORY[0x1F40FB568]();
}

uint64_t sub_1AF7AC8C0()
{
  return MEMORY[0x1F40FB580]();
}

uint64_t sub_1AF7AC8D0()
{
  return MEMORY[0x1F414B000]();
}

uint64_t sub_1AF7AC8E0()
{
  return MEMORY[0x1F41040E8]();
}

uint64_t sub_1AF7AC8F0()
{
  return MEMORY[0x1F40FB5D0]();
}

uint64_t sub_1AF7AC900()
{
  return MEMORY[0x1F40FB5D8]();
}

uint64_t sub_1AF7AC910()
{
  return MEMORY[0x1F40FB610]();
}

uint64_t sub_1AF7AC930()
{
  return MEMORY[0x1F40FB648]();
}

uint64_t sub_1AF7AC940()
{
  return MEMORY[0x1F40FB660]();
}

uint64_t sub_1AF7AC950()
{
  return MEMORY[0x1F40FB688]();
}

uint64_t sub_1AF7AC960()
{
  return MEMORY[0x1F40FB6C8]();
}

uint64_t sub_1AF7AC970()
{
  return MEMORY[0x1F40FB6E0]();
}

uint64_t sub_1AF7AC980()
{
  return MEMORY[0x1F40FB710]();
}

uint64_t sub_1AF7AC990()
{
  return MEMORY[0x1F40FB728]();
}

uint64_t sub_1AF7AC9A0()
{
  return MEMORY[0x1F40FB748]();
}

uint64_t sub_1AF7AC9B0()
{
  return MEMORY[0x1F40FB750]();
}

uint64_t sub_1AF7AC9C0()
{
  return MEMORY[0x1F40FB760]();
}

uint64_t sub_1AF7AC9D0()
{
  return MEMORY[0x1F40FB770]();
}

uint64_t sub_1AF7AC9E0()
{
  return MEMORY[0x1F40FB780]();
}

uint64_t sub_1AF7AC9F0()
{
  return MEMORY[0x1F40FB7C0]();
}

uint64_t sub_1AF7ACA00()
{
  return MEMORY[0x1F40FB840]();
}

uint64_t sub_1AF7ACA10()
{
  return MEMORY[0x1F40FB850]();
}

uint64_t sub_1AF7ACA20()
{
  return MEMORY[0x1F40FB870]();
}

uint64_t sub_1AF7ACA30()
{
  return MEMORY[0x1F40FB880]();
}

uint64_t sub_1AF7ACA40()
{
  return MEMORY[0x1F40FB8A0]();
}

uint64_t sub_1AF7ACA50()
{
  return MEMORY[0x1F40FB920]();
}

uint64_t sub_1AF7ACA60()
{
  return MEMORY[0x1F40FB9D8]();
}

uint64_t sub_1AF7ACA70()
{
  return MEMORY[0x1F40FB9F0]();
}

uint64_t sub_1AF7ACA80()
{
  return MEMORY[0x1F40FBA20]();
}

uint64_t sub_1AF7ACA90()
{
  return MEMORY[0x1F40FBA58]();
}

uint64_t sub_1AF7ACAA0()
{
  return MEMORY[0x1F40FBA60]();
}

uint64_t sub_1AF7ACAB0()
{
  return MEMORY[0x1F40FBAA8]();
}

uint64_t sub_1AF7ACAC0()
{
  return MEMORY[0x1F40FBAE0]();
}

uint64_t sub_1AF7ACAD0()
{
  return MEMORY[0x1F40FBB30]();
}

uint64_t sub_1AF7ACAE0()
{
  return MEMORY[0x1F40FBB38]();
}

uint64_t sub_1AF7ACAF0()
{
  return MEMORY[0x1F40FBB78]();
}

uint64_t sub_1AF7ACB00()
{
  return MEMORY[0x1F40FBB90]();
}

uint64_t sub_1AF7ACB10()
{
  return MEMORY[0x1F40FBBB0]();
}

uint64_t sub_1AF7ACB20()
{
  return MEMORY[0x1F40FBC40]();
}

uint64_t sub_1AF7ACB30()
{
  return MEMORY[0x1F40FBC78]();
}

uint64_t sub_1AF7ACB40()
{
  return MEMORY[0x1F40FBCB8]();
}

uint64_t sub_1AF7ACB50()
{
  return MEMORY[0x1F40FBCE8]();
}

uint64_t sub_1AF7ACB60()
{
  return MEMORY[0x1F40FBD60]();
}

uint64_t sub_1AF7ACB70()
{
  return MEMORY[0x1F40FBDB0]();
}

uint64_t sub_1AF7ACB80()
{
  return MEMORY[0x1F40FBDC0]();
}

uint64_t sub_1AF7ACB90()
{
  return MEMORY[0x1F40FBDD0]();
}

uint64_t sub_1AF7ACBA0()
{
  return MEMORY[0x1F40FBDD8]();
}

uint64_t sub_1AF7ACBB0()
{
  return MEMORY[0x1F40FBE68]();
}

uint64_t sub_1AF7ACBC0()
{
  return MEMORY[0x1F40FBE70]();
}

uint64_t sub_1AF7ACBD0()
{
  return MEMORY[0x1F40FBEE8]();
}

uint64_t sub_1AF7ACBE0()
{
  return MEMORY[0x1F40FBF20]();
}

uint64_t sub_1AF7ACBF0()
{
  return MEMORY[0x1F40FBF60]();
}

uint64_t sub_1AF7ACC00()
{
  return MEMORY[0x1F40FBF70]();
}

uint64_t sub_1AF7ACC10()
{
  return MEMORY[0x1F40FBFB8]();
}

uint64_t sub_1AF7ACC20()
{
  return MEMORY[0x1F40FBFE8]();
}

uint64_t sub_1AF7ACC30()
{
  return MEMORY[0x1F40FBFF0]();
}

uint64_t sub_1AF7ACC40()
{
  return MEMORY[0x1F40FC010]();
}

uint64_t sub_1AF7ACC50()
{
  return MEMORY[0x1F40FC018]();
}

uint64_t sub_1AF7ACC60()
{
  return MEMORY[0x1F40FC028]();
}

uint64_t sub_1AF7ACC70()
{
  return MEMORY[0x1F40FC088]();
}

uint64_t sub_1AF7ACC80()
{
  return MEMORY[0x1F40FC098]();
}

uint64_t sub_1AF7ACC90()
{
  return MEMORY[0x1F40FC0F0]();
}

uint64_t sub_1AF7ACCA0()
{
  return MEMORY[0x1F40FC108]();
}

uint64_t sub_1AF7ACCB0()
{
  return MEMORY[0x1F40FC158]();
}

uint64_t sub_1AF7ACCC0()
{
  return MEMORY[0x1F40FC190]();
}

uint64_t sub_1AF7ACCD0()
{
  return MEMORY[0x1F40FC1E8]();
}

uint64_t sub_1AF7ACCE0()
{
  return MEMORY[0x1F40FC240]();
}

uint64_t sub_1AF7ACCF0()
{
  return MEMORY[0x1F40FC260]();
}

uint64_t sub_1AF7ACD00()
{
  return MEMORY[0x1F40FC278]();
}

uint64_t sub_1AF7ACD10()
{
  return MEMORY[0x1F40FC2A8]();
}

uint64_t sub_1AF7ACD20()
{
  return MEMORY[0x1F40FC2E0]();
}

uint64_t sub_1AF7ACD30()
{
  return MEMORY[0x1F40FC2F0]();
}

uint64_t sub_1AF7ACD40()
{
  return MEMORY[0x1F40FC310]();
}

uint64_t sub_1AF7ACD50()
{
  return MEMORY[0x1F40FC350]();
}

uint64_t sub_1AF7ACD60()
{
  return MEMORY[0x1F40FC368]();
}

uint64_t sub_1AF7ACD70()
{
  return MEMORY[0x1F40FC3B8]();
}

uint64_t sub_1AF7ACD80()
{
  return MEMORY[0x1F40FC3D0]();
}

uint64_t sub_1AF7ACD90()
{
  return MEMORY[0x1F40FC3E8]();
}

uint64_t sub_1AF7ACDA0()
{
  return MEMORY[0x1F40FC438]();
}

uint64_t sub_1AF7ACDB0()
{
  return MEMORY[0x1F40FC450]();
}

uint64_t sub_1AF7ACDC0()
{
  return MEMORY[0x1F40FC498]();
}

uint64_t sub_1AF7ACDD0()
{
  return MEMORY[0x1F40FC4A8]();
}

uint64_t sub_1AF7ACDE0()
{
  return MEMORY[0x1F40FC4C0]();
}

uint64_t sub_1AF7ACDF0()
{
  return MEMORY[0x1F40FC4E8]();
}

uint64_t sub_1AF7ACE00()
{
  return MEMORY[0x1F40FC4F0]();
}

uint64_t sub_1AF7ACE10()
{
  return MEMORY[0x1F40FC530]();
}

uint64_t sub_1AF7ACE20()
{
  return MEMORY[0x1F40FC540]();
}

uint64_t sub_1AF7ACE30()
{
  return MEMORY[0x1F40FC550]();
}

uint64_t sub_1AF7ACE40()
{
  return MEMORY[0x1F40FC568]();
}

uint64_t sub_1AF7ACE50()
{
  return MEMORY[0x1F40FC580]();
}

uint64_t sub_1AF7ACE60()
{
  return MEMORY[0x1F40FC5A0]();
}

uint64_t sub_1AF7ACE70()
{
  return MEMORY[0x1F40FC5A8]();
}

uint64_t sub_1AF7ACE80()
{
  return MEMORY[0x1F40FC5B8]();
}

uint64_t sub_1AF7ACE90()
{
  return MEMORY[0x1F40FC5D0]();
}

uint64_t sub_1AF7ACEA0()
{
  return MEMORY[0x1F4104100]();
}

uint64_t sub_1AF7ACEB0()
{
  return MEMORY[0x1F40FC5E8]();
}

uint64_t sub_1AF7ACEC0()
{
  return MEMORY[0x1F40FC600]();
}

uint64_t sub_1AF7ACED0()
{
  return MEMORY[0x1F40FC638]();
}

uint64_t sub_1AF7ACF00()
{
  return MEMORY[0x1F40FC6A0]();
}

uint64_t sub_1AF7ACF20()
{
  return MEMORY[0x1F40FC6C8]();
}

uint64_t sub_1AF7ACF40()
{
  return MEMORY[0x1F40FC6F0]();
}

uint64_t sub_1AF7ACF50()
{
  return MEMORY[0x1F40FC700]();
}

uint64_t sub_1AF7ACF60()
{
  return MEMORY[0x1F40FC708]();
}

uint64_t sub_1AF7ACF70()
{
  return MEMORY[0x1F40FC718]();
}

uint64_t sub_1AF7ACF80()
{
  return MEMORY[0x1F40FC728]();
}

uint64_t sub_1AF7ACF90()
{
  return MEMORY[0x1F40FC738]();
}

uint64_t sub_1AF7ACFA0()
{
  return MEMORY[0x1F40FC760]();
}

uint64_t sub_1AF7ACFB0()
{
  return MEMORY[0x1F40FC768]();
}

uint64_t sub_1AF7ACFC0()
{
  return MEMORY[0x1F40FC778]();
}

uint64_t sub_1AF7ACFD0()
{
  return MEMORY[0x1F40FC790]();
}

uint64_t sub_1AF7ACFE0()
{
  return MEMORY[0x1F40FC838]();
}

uint64_t sub_1AF7ACFF0()
{
  return MEMORY[0x1F40FC888]();
}

uint64_t sub_1AF7AD000()
{
  return MEMORY[0x1F40FC8A8]();
}

uint64_t sub_1AF7AD010()
{
  return MEMORY[0x1F40FC8F8]();
}

uint64_t sub_1AF7AD020()
{
  return MEMORY[0x1F40FC910]();
}

uint64_t sub_1AF7AD030()
{
  return MEMORY[0x1F40FC920]();
}

uint64_t sub_1AF7AD040()
{
  return MEMORY[0x1F40FC930]();
}

uint64_t sub_1AF7AD050()
{
  return MEMORY[0x1F40FC940]();
}

uint64_t sub_1AF7AD060()
{
  return MEMORY[0x1F40FC950]();
}

uint64_t sub_1AF7AD070()
{
  return MEMORY[0x1F40FC980]();
}

uint64_t sub_1AF7AD080()
{
  return MEMORY[0x1F40FC998]();
}

uint64_t sub_1AF7AD090()
{
  return MEMORY[0x1F40FC9A0]();
}

uint64_t sub_1AF7AD0A0()
{
  return MEMORY[0x1F40FC9B8]();
}

uint64_t sub_1AF7AD0B0()
{
  return MEMORY[0x1F40FC9D0]();
}

uint64_t sub_1AF7AD0C0()
{
  return MEMORY[0x1F40FC9E8]();
}

uint64_t sub_1AF7AD0D0()
{
  return MEMORY[0x1F40FC9F0]();
}

uint64_t sub_1AF7AD0E0()
{
  return MEMORY[0x1F40FCA20]();
}

uint64_t sub_1AF7AD0F0()
{
  return MEMORY[0x1F40FCA30]();
}

uint64_t sub_1AF7AD100()
{
  return MEMORY[0x1F40FCA38]();
}

uint64_t sub_1AF7AD110()
{
  return MEMORY[0x1F40FCA48]();
}

uint64_t sub_1AF7AD120()
{
  return MEMORY[0x1F40FCA98]();
}

uint64_t sub_1AF7AD130()
{
  return MEMORY[0x1F40FCAB0]();
}

uint64_t sub_1AF7AD140()
{
  return MEMORY[0x1F40FCAB8]();
}

uint64_t sub_1AF7AD150()
{
  return MEMORY[0x1F40FCAD0]();
}

uint64_t sub_1AF7AD160()
{
  return MEMORY[0x1F40FCB30]();
}

uint64_t sub_1AF7AD170()
{
  return MEMORY[0x1F40FCB38]();
}

uint64_t sub_1AF7AD180()
{
  return MEMORY[0x1F40FCB40]();
}

uint64_t sub_1AF7AD190()
{
  return MEMORY[0x1F40FCB98]();
}

uint64_t sub_1AF7AD1A0()
{
  return MEMORY[0x1F40FCBD8]();
}

uint64_t sub_1AF7AD1B0()
{
  return MEMORY[0x1F40FCBE8]();
}

uint64_t sub_1AF7AD1C0()
{
  return MEMORY[0x1F40FCBF0]();
}

uint64_t sub_1AF7AD1D0()
{
  return MEMORY[0x1F40FCBF8]();
}

uint64_t sub_1AF7AD1E0()
{
  return MEMORY[0x1F40FCC08]();
}

uint64_t sub_1AF7AD1F0()
{
  return MEMORY[0x1F40FCC10]();
}

uint64_t sub_1AF7AD200()
{
  return MEMORY[0x1F40FCC20]();
}

uint64_t sub_1AF7AD210()
{
  return MEMORY[0x1F40FCC30]();
}

uint64_t sub_1AF7AD220()
{
  return MEMORY[0x1F40FCC40]();
}

uint64_t sub_1AF7AD230()
{
  return MEMORY[0x1F40FCC50]();
}

uint64_t sub_1AF7AD240()
{
  return MEMORY[0x1F40FCCE0]();
}

uint64_t sub_1AF7AD250()
{
  return MEMORY[0x1F40FCCF0]();
}

uint64_t sub_1AF7AD260()
{
  return MEMORY[0x1F40FCD20]();
}

uint64_t sub_1AF7AD270()
{
  return MEMORY[0x1F40FCD30]();
}

uint64_t sub_1AF7AD280()
{
  return MEMORY[0x1F40FCE58]();
}

uint64_t sub_1AF7AD290()
{
  return MEMORY[0x1F40FCE60]();
}

uint64_t sub_1AF7AD2A0()
{
  return MEMORY[0x1F40FCEB0]();
}

uint64_t sub_1AF7AD2B0()
{
  return MEMORY[0x1F40FCEC0]();
}

uint64_t sub_1AF7AD2C0()
{
  return MEMORY[0x1F40FCED8]();
}

uint64_t sub_1AF7AD2D0()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1AF7AD2E0()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1AF7AD2F0()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1AF7AD300()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t sub_1AF7AD310()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_1AF7AD320()
{
  return MEMORY[0x1F4186EF8]();
}

uint64_t sub_1AF7AD330()
{
  return MEMORY[0x1F4186F18]();
}

uint64_t sub_1AF7AD340()
{
  return MEMORY[0x1F4186F40]();
}

uint64_t sub_1AF7AD350()
{
  return MEMORY[0x1F41278D8]();
}

uint64_t sub_1AF7AD360()
{
  return MEMORY[0x1F41278E0]();
}

uint64_t sub_1AF7AD370()
{
  return MEMORY[0x1F41278F0]();
}

uint64_t sub_1AF7AD380()
{
  return MEMORY[0x1F4127918]();
}

uint64_t sub_1AF7AD390()
{
  return MEMORY[0x1F4127920]();
}

uint64_t sub_1AF7AD3A0()
{
  return MEMORY[0x1F4127A18]();
}

uint64_t sub_1AF7AD3B0()
{
  return MEMORY[0x1F4127A20]();
}

uint64_t sub_1AF7AD3C0()
{
  return MEMORY[0x1F4127A28]();
}

uint64_t sub_1AF7AD3D0()
{
  return MEMORY[0x1F4127A70]();
}

uint64_t sub_1AF7AD3E0()
{
  return MEMORY[0x1F4127A78]();
}

uint64_t sub_1AF7AD3F0()
{
  return MEMORY[0x1F4127A88]();
}

uint64_t sub_1AF7AD400()
{
  return MEMORY[0x1F4127A90]();
}

uint64_t sub_1AF7AD410()
{
  return MEMORY[0x1F4127B50]();
}

uint64_t sub_1AF7AD420()
{
  return MEMORY[0x1F4127B60]();
}

uint64_t sub_1AF7AD430()
{
  return MEMORY[0x1F4127B70]();
}

uint64_t sub_1AF7AD440()
{
  return MEMORY[0x1F4127B78]();
}

uint64_t sub_1AF7AD450()
{
  return MEMORY[0x1F4127B98]();
}

uint64_t sub_1AF7AD460()
{
  return MEMORY[0x1F4127BB0]();
}

uint64_t sub_1AF7AD470()
{
  return MEMORY[0x1F4127BD0]();
}

uint64_t sub_1AF7AD480()
{
  return MEMORY[0x1F4127BE8]();
}

uint64_t sub_1AF7AD490()
{
  return MEMORY[0x1F4127C00]();
}

uint64_t sub_1AF7AD4A0()
{
  return MEMORY[0x1F4127C20]();
}

uint64_t sub_1AF7AD4B0()
{
  return MEMORY[0x1F4127C28]();
}

uint64_t sub_1AF7AD4C0()
{
  return MEMORY[0x1F4127C58]();
}

uint64_t sub_1AF7AD4D0()
{
  return MEMORY[0x1F4127C68]();
}

uint64_t sub_1AF7AD4E0()
{
  return MEMORY[0x1F4127C78]();
}

uint64_t sub_1AF7AD4F0()
{
  return MEMORY[0x1F4127C80]();
}

uint64_t sub_1AF7AD500()
{
  return MEMORY[0x1F4127C90]();
}

uint64_t sub_1AF7AD510()
{
  return MEMORY[0x1F4127CD0]();
}

uint64_t sub_1AF7AD520()
{
  return MEMORY[0x1F4127CD8]();
}

uint64_t sub_1AF7AD530()
{
  return MEMORY[0x1F4127CE0]();
}

uint64_t sub_1AF7AD540()
{
  return MEMORY[0x1F4127CE8]();
}

uint64_t sub_1AF7AD550()
{
  return MEMORY[0x1F4127CF0]();
}

uint64_t sub_1AF7AD560()
{
  return MEMORY[0x1F4127CF8]();
}

uint64_t sub_1AF7AD570()
{
  return MEMORY[0x1F4127D00]();
}

uint64_t sub_1AF7AD580()
{
  return MEMORY[0x1F4127D10]();
}

uint64_t sub_1AF7AD590()
{
  return MEMORY[0x1F4127D18]();
}

uint64_t sub_1AF7AD5A0()
{
  return MEMORY[0x1F4127D20]();
}

uint64_t sub_1AF7AD5B0()
{
  return MEMORY[0x1F4127DA0]();
}

uint64_t sub_1AF7AD5C0()
{
  return MEMORY[0x1F4127DA8]();
}

uint64_t sub_1AF7AD5D0()
{
  return MEMORY[0x1F4127DB0]();
}

uint64_t sub_1AF7AD5E0()
{
  return MEMORY[0x1F4127DB8]();
}

uint64_t sub_1AF7AD5F0()
{
  return MEMORY[0x1F4127DC0]();
}

uint64_t sub_1AF7AD600()
{
  return MEMORY[0x1F4127DD0]();
}

uint64_t sub_1AF7AD610()
{
  return MEMORY[0x1F4127DF8]();
}

uint64_t sub_1AF7AD620()
{
  return MEMORY[0x1F4127E00]();
}

uint64_t sub_1AF7AD630()
{
  return MEMORY[0x1F4127EF0]();
}

uint64_t sub_1AF7AD640()
{
  return MEMORY[0x1F4127EF8]();
}

uint64_t sub_1AF7AD650()
{
  return MEMORY[0x1F4127F18]();
}

uint64_t sub_1AF7AD660()
{
  return MEMORY[0x1F4127F20]();
}

uint64_t sub_1AF7AD670()
{
  return MEMORY[0x1F4127F98]();
}

uint64_t sub_1AF7AD680()
{
  return MEMORY[0x1F4127FA0]();
}

uint64_t sub_1AF7AD690()
{
  return MEMORY[0x1F4127FA8]();
}

uint64_t sub_1AF7AD6A0()
{
  return MEMORY[0x1F4127FB0]();
}

uint64_t sub_1AF7AD6B0()
{
  return MEMORY[0x1F4127FB8]();
}

uint64_t sub_1AF7AD6D0()
{
  return MEMORY[0x1F4128020]();
}

uint64_t sub_1AF7AD6E0()
{
  return MEMORY[0x1F4128028]();
}

uint64_t sub_1AF7AD6F0()
{
  return MEMORY[0x1F4128038]();
}

uint64_t sub_1AF7AD700()
{
  return MEMORY[0x1F4128048]();
}

uint64_t sub_1AF7AD710()
{
  return MEMORY[0x1F4128070]();
}

uint64_t sub_1AF7AD720()
{
  return MEMORY[0x1F4128080]();
}

uint64_t sub_1AF7AD730()
{
  return MEMORY[0x1F41280D8]();
}

uint64_t sub_1AF7AD740()
{
  return MEMORY[0x1F41280E0]();
}

uint64_t sub_1AF7AD750()
{
  return MEMORY[0x1F4128108]();
}

uint64_t sub_1AF7AD760()
{
  return MEMORY[0x1F4128158]();
}

uint64_t sub_1AF7AD770()
{
  return MEMORY[0x1F4128168]();
}

uint64_t sub_1AF7AD780()
{
  return MEMORY[0x1F41281B8]();
}

uint64_t sub_1AF7AD7A0()
{
  return MEMORY[0x1F41281D0]();
}

uint64_t sub_1AF7AD7B0()
{
  return MEMORY[0x1F41281D8]();
}

uint64_t sub_1AF7AD7C0()
{
  return MEMORY[0x1F4128278]();
}

uint64_t sub_1AF7AD7D0()
{
  return MEMORY[0x1F4128298]();
}

uint64_t sub_1AF7AD7E0()
{
  return MEMORY[0x1F41282A0]();
}

uint64_t sub_1AF7AD7F0()
{
  return MEMORY[0x1F41282D8]();
}

uint64_t sub_1AF7AD800()
{
  return MEMORY[0x1F41282E0]();
}

uint64_t sub_1AF7AD810()
{
  return MEMORY[0x1F4128328]();
}

uint64_t sub_1AF7AD820()
{
  return MEMORY[0x1F4128330]();
}

uint64_t sub_1AF7AD830()
{
  return MEMORY[0x1F4128338]();
}

uint64_t sub_1AF7AD840()
{
  return MEMORY[0x1F4128340]();
}

uint64_t sub_1AF7AD850()
{
  return MEMORY[0x1F4128398]();
}

uint64_t sub_1AF7AD860()
{
  return MEMORY[0x1F41283C0]();
}

uint64_t sub_1AF7AD870()
{
  return MEMORY[0x1F41283C8]();
}

uint64_t sub_1AF7AD880()
{
  return MEMORY[0x1F41283D0]();
}

uint64_t sub_1AF7AD890()
{
  return MEMORY[0x1F41283F0]();
}

uint64_t sub_1AF7AD8A0()
{
  return MEMORY[0x1F41283F8]();
}

uint64_t sub_1AF7AD8B0()
{
  return MEMORY[0x1F4128410]();
}

uint64_t sub_1AF7AD8C0()
{
  return MEMORY[0x1F4128418]();
}

uint64_t sub_1AF7AD8D0()
{
  return MEMORY[0x1F4128428]();
}

uint64_t sub_1AF7AD8E0()
{
  return MEMORY[0x1F4128430]();
}

uint64_t sub_1AF7AD8F0()
{
  return MEMORY[0x1F4128440]();
}

uint64_t sub_1AF7AD900()
{
  return MEMORY[0x1F4128448]();
}

uint64_t sub_1AF7AD910()
{
  return MEMORY[0x1F4128450]();
}

uint64_t sub_1AF7AD920()
{
  return MEMORY[0x1F4128458]();
}

uint64_t sub_1AF7AD930()
{
  return MEMORY[0x1F4128490]();
}

uint64_t sub_1AF7AD940()
{
  return MEMORY[0x1F4128498]();
}

uint64_t sub_1AF7AD950()
{
  return MEMORY[0x1F41284A8]();
}

uint64_t sub_1AF7AD960()
{
  return MEMORY[0x1F4128578]();
}

uint64_t sub_1AF7AD970()
{
  return MEMORY[0x1F41285D8]();
}

uint64_t sub_1AF7AD980()
{
  return MEMORY[0x1F4128618]();
}

uint64_t sub_1AF7AD990()
{
  return MEMORY[0x1F4128628]();
}

uint64_t sub_1AF7AD9A0()
{
  return MEMORY[0x1F4128640]();
}

uint64_t sub_1AF7AD9B0()
{
  return MEMORY[0x1F4128650]();
}

uint64_t sub_1AF7AD9C0()
{
  return MEMORY[0x1F4128658]();
}

uint64_t sub_1AF7AD9D0()
{
  return MEMORY[0x1F4128668]();
}

uint64_t sub_1AF7AD9E0()
{
  return MEMORY[0x1F4128670]();
}

uint64_t sub_1AF7AD9F0()
{
  return MEMORY[0x1F4128678]();
}

uint64_t sub_1AF7ADA00()
{
  return MEMORY[0x1F4128680]();
}

uint64_t sub_1AF7ADA10()
{
  return MEMORY[0x1F4128688]();
}

uint64_t sub_1AF7ADA20()
{
  return MEMORY[0x1F4128690]();
}

uint64_t sub_1AF7ADA30()
{
  return MEMORY[0x1F41286A0]();
}

uint64_t sub_1AF7ADA40()
{
  return MEMORY[0x1F41286A8]();
}

uint64_t sub_1AF7ADA50()
{
  return MEMORY[0x1F41286B0]();
}

uint64_t sub_1AF7ADA60()
{
  return MEMORY[0x1F41286B8]();
}

uint64_t sub_1AF7ADA70()
{
  return MEMORY[0x1F41286C0]();
}

uint64_t sub_1AF7ADA80()
{
  return MEMORY[0x1F41286C8]();
}

uint64_t sub_1AF7ADA90()
{
  return MEMORY[0x1F41286D0]();
}

uint64_t sub_1AF7ADAA0()
{
  return MEMORY[0x1F41286D8]();
}

uint64_t sub_1AF7ADAB0()
{
  return MEMORY[0x1F41286E8]();
}

uint64_t sub_1AF7ADAC0()
{
  return MEMORY[0x1F4128700]();
}

uint64_t sub_1AF7ADAD0()
{
  return MEMORY[0x1F4128718]();
}

uint64_t sub_1AF7ADAE0()
{
  return MEMORY[0x1F4128720]();
}

uint64_t sub_1AF7ADAF0()
{
  return MEMORY[0x1F4128728]();
}

uint64_t sub_1AF7ADB00()
{
  return MEMORY[0x1F4128730]();
}

uint64_t sub_1AF7ADB10()
{
  return MEMORY[0x1F4128748]();
}

uint64_t sub_1AF7ADB20()
{
  return MEMORY[0x1F4128760]();
}

uint64_t sub_1AF7ADB30()
{
  return MEMORY[0x1F4128768]();
}

uint64_t sub_1AF7ADB50()
{
  return MEMORY[0x1F41287C8]();
}

uint64_t sub_1AF7ADB60()
{
  return MEMORY[0x1F41288B8]();
}

uint64_t sub_1AF7ADB70()
{
  return MEMORY[0x1F41288C0]();
}

uint64_t sub_1AF7ADB80()
{
  return MEMORY[0x1F4128920]();
}

uint64_t sub_1AF7ADB90()
{
  return MEMORY[0x1F4128930]();
}

uint64_t sub_1AF7ADBA0()
{
  return MEMORY[0x1F4128940]();
}

uint64_t sub_1AF7ADBB0()
{
  return MEMORY[0x1F4128958]();
}

uint64_t sub_1AF7ADBC0()
{
  return MEMORY[0x1F4128960]();
}

uint64_t sub_1AF7ADBD0()
{
  return MEMORY[0x1F4128990]();
}

uint64_t sub_1AF7ADBE0()
{
  return MEMORY[0x1F4128998]();
}

uint64_t sub_1AF7ADBF0()
{
  return MEMORY[0x1F41289A8]();
}

uint64_t sub_1AF7ADC00()
{
  return MEMORY[0x1F41289B0]();
}

uint64_t sub_1AF7ADC10()
{
  return MEMORY[0x1F41289D0]();
}

uint64_t sub_1AF7ADC20()
{
  return MEMORY[0x1F41289D8]();
}

uint64_t sub_1AF7ADC30()
{
  return MEMORY[0x1F41289E0]();
}

uint64_t sub_1AF7ADC40()
{
  return MEMORY[0x1F41289E8]();
}

uint64_t sub_1AF7ADC50()
{
  return MEMORY[0x1F41289F0]();
}

uint64_t sub_1AF7ADC60()
{
  return MEMORY[0x1F41289F8]();
}

uint64_t sub_1AF7ADC70()
{
  return MEMORY[0x1F4128A00]();
}

uint64_t sub_1AF7ADC90()
{
  return MEMORY[0x1F4128A10]();
}

uint64_t sub_1AF7ADCA0()
{
  return MEMORY[0x1F4128A18]();
}

uint64_t sub_1AF7ADCC0()
{
  return MEMORY[0x1F4128A28]();
}

uint64_t sub_1AF7ADCD0()
{
  return MEMORY[0x1F4129D88]();
}

uint64_t sub_1AF7ADCE0()
{
  return MEMORY[0x1F4128A30]();
}

uint64_t sub_1AF7ADCF0()
{
  return MEMORY[0x1F4128A48]();
}

uint64_t sub_1AF7ADD00()
{
  return MEMORY[0x1F4128A80]();
}

uint64_t sub_1AF7ADD10()
{
  return MEMORY[0x1F4128B18]();
}

uint64_t sub_1AF7ADD20()
{
  return MEMORY[0x1F4128B20]();
}

uint64_t sub_1AF7ADD30()
{
  return MEMORY[0x1F4128B98]();
}

uint64_t sub_1AF7ADD40()
{
  return MEMORY[0x1F4128C00]();
}

uint64_t sub_1AF7ADD50()
{
  return MEMORY[0x1F4128C58]();
}

uint64_t sub_1AF7ADD60()
{
  return MEMORY[0x1F4128C78]();
}

uint64_t sub_1AF7ADD70()
{
  return MEMORY[0x1F4128C90]();
}

uint64_t sub_1AF7ADD80()
{
  return MEMORY[0x1F4128C98]();
}

uint64_t sub_1AF7ADD90()
{
  return MEMORY[0x1F4128CA0]();
}

uint64_t sub_1AF7ADDA0()
{
  return MEMORY[0x1F4128CA8]();
}

uint64_t sub_1AF7ADDB0()
{
  return MEMORY[0x1F4128CC0]();
}

uint64_t sub_1AF7ADDC0()
{
  return MEMORY[0x1F4128CE0]();
}

uint64_t sub_1AF7ADDD0()
{
  return MEMORY[0x1F4128CF0]();
}

uint64_t sub_1AF7ADDE0()
{
  return MEMORY[0x1F4128CF8]();
}

uint64_t sub_1AF7ADDF0()
{
  return MEMORY[0x1F4128D10]();
}

uint64_t sub_1AF7ADE00()
{
  return MEMORY[0x1F4128D18]();
}

uint64_t sub_1AF7ADE10()
{
  return MEMORY[0x1F4128DF8]();
}

uint64_t sub_1AF7ADE30()
{
  return MEMORY[0x1F4129098]();
}

uint64_t sub_1AF7ADE40()
{
  return MEMORY[0x1F41290B0]();
}

uint64_t sub_1AF7ADE50()
{
  return MEMORY[0x1F41290B8]();
}

uint64_t sub_1AF7ADE60()
{
  return MEMORY[0x1F41290C0]();
}

uint64_t sub_1AF7ADE80()
{
  return MEMORY[0x1F41290D0]();
}

uint64_t sub_1AF7ADE90()
{
  return MEMORY[0x1F41290D8]();
}

uint64_t sub_1AF7ADEA0()
{
  return MEMORY[0x1F41290E8]();
}

uint64_t sub_1AF7ADEB0()
{
  return MEMORY[0x1F41290F8]();
}

uint64_t sub_1AF7ADEC0()
{
  return MEMORY[0x1F4129120]();
}

uint64_t sub_1AF7ADED0()
{
  return MEMORY[0x1F4129160]();
}

uint64_t sub_1AF7ADEE0()
{
  return MEMORY[0x1F41292F0]();
}

uint64_t sub_1AF7ADEF0()
{
  return MEMORY[0x1F41292F8]();
}

uint64_t sub_1AF7ADF00()
{
  return MEMORY[0x1F4129300]();
}

uint64_t sub_1AF7ADF10()
{
  return MEMORY[0x1F4129318]();
}

uint64_t sub_1AF7ADF20()
{
  return MEMORY[0x1F4129328]();
}

uint64_t sub_1AF7ADF30()
{
  return MEMORY[0x1F4129338]();
}

uint64_t sub_1AF7ADF40()
{
  return MEMORY[0x1F4129348]();
}

uint64_t sub_1AF7ADF50()
{
  return MEMORY[0x1F4104270]();
}

uint64_t sub_1AF7ADF60()
{
  return MEMORY[0x1F4104298]();
}

uint64_t sub_1AF7ADF70()
{
  return MEMORY[0x1F41042B0]();
}

uint64_t sub_1AF7ADF80()
{
  return MEMORY[0x1F4104308]();
}

uint64_t sub_1AF7ADF90()
{
  return MEMORY[0x1F4104310]();
}

uint64_t sub_1AF7ADFA0()
{
  return MEMORY[0x1F4104318]();
}

uint64_t sub_1AF7ADFB0()
{
  return MEMORY[0x1F41043D8]();
}

uint64_t sub_1AF7ADFC0()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1AF7ADFD0()
{
  return MEMORY[0x1F40E6018]();
}

uint64_t sub_1AF7ADFE0()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1AF7ADFF0()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_1AF7AE000()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1AF7AE010()
{
  return MEMORY[0x1F4183460]();
}

uint64_t sub_1AF7AE020()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1AF7AE030()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1AF7AE040()
{
  return MEMORY[0x1F41835D0]();
}

uint64_t sub_1AF7AE050()
{
  return MEMORY[0x1F4188428]();
}

uint64_t sub_1AF7AE060()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1AF7AE070()
{
  return MEMORY[0x1F4183740]();
}

uint64_t sub_1AF7AE080()
{
  return MEMORY[0x1F4183820]();
}

uint64_t sub_1AF7AE090()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1AF7AE0A0()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1AF7AE0B0()
{
  return MEMORY[0x1F40E61A0]();
}

uint64_t sub_1AF7AE0C0()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1AF7AE0D0()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1AF7AE0E0()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1AF7AE0F0()
{
  return MEMORY[0x1F40E6228]();
}

uint64_t sub_1AF7AE100()
{
  return MEMORY[0x1F40E6238]();
}

uint64_t sub_1AF7AE110()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1AF7AE120()
{
  return MEMORY[0x1F41838A0]();
}

uint64_t sub_1AF7AE130()
{
  return MEMORY[0x1F41838D8]();
}

uint64_t sub_1AF7AE140()
{
  return MEMORY[0x1F4183900]();
}

uint64_t sub_1AF7AE150()
{
  return MEMORY[0x1F4183908]();
}

uint64_t sub_1AF7AE160()
{
  return MEMORY[0x1F4183920]();
}

uint64_t sub_1AF7AE170()
{
  return MEMORY[0x1F4183928]();
}

uint64_t sub_1AF7AE180()
{
  return MEMORY[0x1F4183958]();
}

uint64_t sub_1AF7AE190()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1AF7AE1A0()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1AF7AE1B0()
{
  return MEMORY[0x1F4183A28]();
}

uint64_t sub_1AF7AE1C0()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1AF7AE1D0()
{
  return MEMORY[0x1F4183A78]();
}

uint64_t sub_1AF7AE1E0()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1AF7AE1F0()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t sub_1AF7AE200()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_1AF7AE210()
{
  return MEMORY[0x1F4183AA8]();
}

uint64_t sub_1AF7AE220()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t sub_1AF7AE230()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_1AF7AE240()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_1AF7AE250()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_1AF7AE260()
{
  return MEMORY[0x1F4183BA8]();
}

uint64_t sub_1AF7AE270()
{
  return MEMORY[0x1F40D6E68]();
}

uint64_t sub_1AF7AE280()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t sub_1AF7AE290()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1AF7AE2A0()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1AF7AE2B0()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1AF7AE2C0()
{
  return MEMORY[0x1F4183E88]();
}

uint64_t sub_1AF7AE2D0()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1AF7AE2E0()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1AF7AE2F0()
{
  return MEMORY[0x1F4183EA8]();
}

uint64_t sub_1AF7AE300()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1AF7AE310()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1AF7AE320()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1AF7AE330()
{
  return MEMORY[0x1F4183F18]();
}

uint64_t sub_1AF7AE340()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1AF7AE350()
{
  return MEMORY[0x1F4183F40]();
}

uint64_t sub_1AF7AE360()
{
  return MEMORY[0x1F4183F78]();
}

uint64_t sub_1AF7AE370()
{
  return MEMORY[0x1F4183F88]();
}

uint64_t sub_1AF7AE380()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1AF7AE390()
{
  return MEMORY[0x1F4183FC0]();
}

uint64_t sub_1AF7AE3A0()
{
  return MEMORY[0x1F4183FF0]();
}

uint64_t sub_1AF7AE3B0()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1AF7AE3C0()
{
  return MEMORY[0x1F4187C00]();
}

uint64_t sub_1AF7AE3D0()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1AF7AE3E0()
{
  return MEMORY[0x1F4187C38]();
}

uint64_t sub_1AF7AE410()
{
  return MEMORY[0x1F4187C98]();
}

uint64_t sub_1AF7AE420()
{
  return MEMORY[0x1F4187CA0]();
}

uint64_t sub_1AF7AE430()
{
  return MEMORY[0x1F4187CB0]();
}

uint64_t sub_1AF7AE440()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1AF7AE450()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1AF7AE460()
{
  return MEMORY[0x1F4187D98]();
}

uint64_t sub_1AF7AE470()
{
  return MEMORY[0x1F4187DD8]();
}

uint64_t sub_1AF7AE490()
{
  return MEMORY[0x1F40E63C8]();
}

uint64_t sub_1AF7AE4A0()
{
  return MEMORY[0x1F4184008]();
}

uint64_t sub_1AF7AE4B0()
{
  return MEMORY[0x1F4184018]();
}

uint64_t sub_1AF7AE4C0()
{
  return MEMORY[0x1F4184048]();
}

uint64_t sub_1AF7AE4D0()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_1AF7AE4E0()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t sub_1AF7AE4F0()
{
  return MEMORY[0x1F4184100]();
}

uint64_t sub_1AF7AE500()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1AF7AE510()
{
  return MEMORY[0x1F41841D0]();
}

uint64_t sub_1AF7AE520()
{
  return MEMORY[0x1F40E6478]();
}

uint64_t sub_1AF7AE530()
{
  return MEMORY[0x1F4184278]();
}

uint64_t sub_1AF7AE540()
{
  return MEMORY[0x1F41842C0]();
}

uint64_t sub_1AF7AE550()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1AF7AE560()
{
  return MEMORY[0x1F4184330]();
}

uint64_t sub_1AF7AE570()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_1AF7AE580()
{
  return MEMORY[0x1F4184348]();
}

uint64_t sub_1AF7AE590()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1AF7AE5A0()
{
  return MEMORY[0x1F40E64D8]();
}

uint64_t sub_1AF7AE5B0()
{
  return MEMORY[0x1F41845A0]();
}

uint64_t sub_1AF7AE5C0()
{
  return MEMORY[0x1F40D9680]();
}

uint64_t sub_1AF7AE5D0()
{
  return MEMORY[0x1F40D96C0]();
}

uint64_t sub_1AF7AE5E0()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1AF7AE5F0()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1AF7AE600()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1AF7AE610()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1AF7AE620()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1AF7AE640()
{
  return MEMORY[0x1F411B528]();
}

uint64_t sub_1AF7AE650()
{
  return MEMORY[0x1F40D96F8]();
}

uint64_t sub_1AF7AE660()
{
  return MEMORY[0x1F4166570]();
}

uint64_t sub_1AF7AE670()
{
  return MEMORY[0x1F4166578]();
}

uint64_t sub_1AF7AE680()
{
  return MEMORY[0x1F4166580]();
}

uint64_t sub_1AF7AE690()
{
  return MEMORY[0x1F4166588]();
}

uint64_t sub_1AF7AE6A0()
{
  return MEMORY[0x1F41665A0]();
}

uint64_t sub_1AF7AE6B0()
{
  return MEMORY[0x1F40E66C8]();
}

uint64_t sub_1AF7AE6C0()
{
  return MEMORY[0x1F4186FB0]();
}

uint64_t sub_1AF7AE6D0()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1AF7AE6E0()
{
  return MEMORY[0x1F4186FF0]();
}

uint64_t sub_1AF7AE6F0()
{
  return MEMORY[0x1F4187040]();
}

uint64_t sub_1AF7AE700()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1AF7AE710()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_1AF7AE720()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1AF7AE730()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1AF7AE740()
{
  return MEMORY[0x1F4129DA0]();
}

uint64_t sub_1AF7AE750()
{
  return MEMORY[0x1F4129DA8]();
}

uint64_t sub_1AF7AE760()
{
  return MEMORY[0x1F4129DB0]();
}

uint64_t sub_1AF7AE770()
{
  return MEMORY[0x1F4129DB8]();
}

uint64_t sub_1AF7AE780()
{
  return MEMORY[0x1F4129DC8]();
}

uint64_t sub_1AF7AE790()
{
  return MEMORY[0x1F4188708]();
}

uint64_t sub_1AF7AE7A0()
{
  return MEMORY[0x1F4188710]();
}

uint64_t sub_1AF7AE7B0()
{
  return MEMORY[0x1F4188718]();
}

uint64_t sub_1AF7AE7C0()
{
  return MEMORY[0x1F40E6798]();
}

uint64_t sub_1AF7AE7D0()
{
  return MEMORY[0x1F40E67A0]();
}

uint64_t sub_1AF7AE7E0()
{
  return MEMORY[0x1F4187278]();
}

uint64_t sub_1AF7AE7F0()
{
  return MEMORY[0x1F4187288]();
}

uint64_t sub_1AF7AE800()
{
  return MEMORY[0x1F4166688]();
}

uint64_t sub_1AF7AE810()
{
  return MEMORY[0x1F4166690]();
}

uint64_t sub_1AF7AE820()
{
  return MEMORY[0x1F41666A0]();
}

uint64_t sub_1AF7AE830()
{
  return MEMORY[0x1F40FCF10]();
}

uint64_t sub_1AF7AE840()
{
  return MEMORY[0x1F41666D8]();
}

uint64_t sub_1AF7AE850()
{
  return MEMORY[0x1F41666E0]();
}

uint64_t sub_1AF7AE860()
{
  return MEMORY[0x1F41666E8]();
}

uint64_t sub_1AF7AE870()
{
  return MEMORY[0x1F41666F8]();
}

uint64_t sub_1AF7AE880()
{
  return MEMORY[0x1F4166728]();
}

uint64_t sub_1AF7AE890()
{
  return MEMORY[0x1F4166740]();
}

uint64_t sub_1AF7AE8A0()
{
  return MEMORY[0x1F4129DD8]();
}

uint64_t sub_1AF7AE8B0()
{
  return MEMORY[0x1F4129DE0]();
}

uint64_t sub_1AF7AE8C0()
{
  return MEMORY[0x1F4129DE8]();
}

uint64_t sub_1AF7AE8D0()
{
  return MEMORY[0x1F40D9730]();
}

uint64_t sub_1AF7AE8E0()
{
  return MEMORY[0x1F4129DF8]();
}

uint64_t sub_1AF7AE8F0()
{
  return MEMORY[0x1F4129E00]();
}

uint64_t sub_1AF7AE900()
{
  return MEMORY[0x1F4129E08]();
}

uint64_t sub_1AF7AE910()
{
  return MEMORY[0x1F4129E10]();
}

uint64_t sub_1AF7AE920()
{
  return MEMORY[0x1F4129E18]();
}

uint64_t sub_1AF7AE930()
{
  return MEMORY[0x1F4166780]();
}

uint64_t sub_1AF7AE940()
{
  return MEMORY[0x1F40D9738]();
}

uint64_t sub_1AF7AE950()
{
  return MEMORY[0x1F40E6840]();
}

uint64_t sub_1AF7AE960()
{
  return MEMORY[0x1F4166800]();
}

uint64_t sub_1AF7AE970()
{
  return MEMORY[0x1F4166818]();
}

uint64_t sub_1AF7AE980()
{
  return MEMORY[0x1F40E68E8]();
}

uint64_t sub_1AF7AE990()
{
  return MEMORY[0x1F40E68F8]();
}

uint64_t sub_1AF7AE9A0()
{
  return MEMORY[0x1F40E6910]();
}

uint64_t sub_1AF7AE9B0()
{
  return MEMORY[0x1F40E6918]();
}

uint64_t sub_1AF7AE9C0()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_1AF7AE9D0()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1AF7AE9E0()
{
  return MEMORY[0x1F41874D0]();
}

uint64_t sub_1AF7AE9F0()
{
  return MEMORY[0x1F40E6928]();
}

uint64_t sub_1AF7AEA00()
{
  return MEMORY[0x1F4166838]();
}

uint64_t sub_1AF7AEA10()
{
  return MEMORY[0x1F41669D8]();
}

uint64_t sub_1AF7AEA20()
{
  return MEMORY[0x1F40E6978]();
}

uint64_t sub_1AF7AEA30()
{
  return MEMORY[0x1F4188720]();
}

uint64_t sub_1AF7AEA40()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1AF7AEA50()
{
  return MEMORY[0x1F4184798]();
}

uint64_t sub_1AF7AEA60()
{
  return MEMORY[0x1F41847A0]();
}

uint64_t sub_1AF7AEA70()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1AF7AEA80()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1AF7AEA90()
{
  return MEMORY[0x1F40E6BB0]();
}

uint64_t sub_1AF7AEAA0()
{
  return MEMORY[0x1F40E6C30]();
}

uint64_t sub_1AF7AEAB0()
{
  return MEMORY[0x1F40E6C40]();
}

uint64_t sub_1AF7AEAC0()
{
  return MEMORY[0x1F40E6C50]();
}

uint64_t sub_1AF7AEAD0()
{
  return MEMORY[0x1F40E6C68]();
}

uint64_t sub_1AF7AEAE0()
{
  return MEMORY[0x1F40E6C78]();
}

uint64_t sub_1AF7AEAF0()
{
  return MEMORY[0x1F40E6C80]();
}

uint64_t sub_1AF7AEB00()
{
  return MEMORY[0x1F40E6C98]();
}

uint64_t sub_1AF7AEB10()
{
  return MEMORY[0x1F40E6CA0]();
}

uint64_t sub_1AF7AEB20()
{
  return MEMORY[0x1F40E6D38]();
}

uint64_t sub_1AF7AEB30()
{
  return MEMORY[0x1F40E6D58]();
}

uint64_t sub_1AF7AEB40()
{
  return MEMORY[0x1F40E6D88]();
}

uint64_t sub_1AF7AEB50()
{
  return MEMORY[0x1F41876A8]();
}

uint64_t sub_1AF7AEB60()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1AF7AEB70()
{
  return MEMORY[0x1F4184988]();
}

uint64_t sub_1AF7AEB90()
{
  return MEMORY[0x1F4184B10]();
}

uint64_t sub_1AF7AEBA0()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1AF7AEBB0()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1AF7AEBC0()
{
  return MEMORY[0x1F4184B30]();
}

uint64_t sub_1AF7AEBD0()
{
  return MEMORY[0x1F4184B58]();
}

uint64_t sub_1AF7AEBE0()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_1AF7AEBF0()
{
  return MEMORY[0x1F4184B78]();
}

uint64_t sub_1AF7AEC00()
{
  return MEMORY[0x1F4184B80]();
}

uint64_t sub_1AF7AEC10()
{
  return MEMORY[0x1F4184B88]();
}

uint64_t sub_1AF7AEC20()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_1AF7AEC30()
{
  return MEMORY[0x1F4184BA8]();
}

uint64_t sub_1AF7AEC40()
{
  return MEMORY[0x1F4184BB0]();
}

uint64_t sub_1AF7AEC50()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_1AF7AEC60()
{
  return MEMORY[0x1F4184BC8]();
}

uint64_t sub_1AF7AEC70()
{
  return MEMORY[0x1F4184BD0]();
}

uint64_t sub_1AF7AEC80()
{
  return MEMORY[0x1F4184C10]();
}

uint64_t sub_1AF7AEC90()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1AF7AECA0()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1AF7AECB0()
{
  return MEMORY[0x1F4184C30]();
}

uint64_t sub_1AF7AECC0()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1AF7AECD0()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1AF7AECE0()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1AF7AECF0()
{
  return MEMORY[0x1F4184CA0]();
}

uint64_t sub_1AF7AED00()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1AF7AED20()
{
  return MEMORY[0x1F4184CE0]();
}

uint64_t sub_1AF7AED30()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1AF7AED40()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1AF7AED50()
{
  return MEMORY[0x1F4184D28]();
}

uint64_t sub_1AF7AED60()
{
  return MEMORY[0x1F4184D30]();
}

uint64_t sub_1AF7AED70()
{
  return MEMORY[0x1F4184D38]();
}

uint64_t sub_1AF7AED80()
{
  return MEMORY[0x1F4184D40]();
}

uint64_t sub_1AF7AED90()
{
  return MEMORY[0x1F4184D70]();
}

uint64_t sub_1AF7AEDA0()
{
  return MEMORY[0x1F4184D78]();
}

uint64_t sub_1AF7AEDB0()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1AF7AEDC0()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1AF7AEDD0()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1AF7AEDE0()
{
  return MEMORY[0x1F4184E70]();
}

uint64_t sub_1AF7AEE00()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1AF7AEE10()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1AF7AEE20()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1AF7AEE30()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1AF7AEE40()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1AF7AEE50()
{
  return MEMORY[0x1F4185048]();
}

uint64_t sub_1AF7AEE60()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1AF7AEE70()
{
  return MEMORY[0x1F41851A0]();
}

uint64_t sub_1AF7AEE80()
{
  return MEMORY[0x1F41851B8]();
}

uint64_t sub_1AF7AEE90()
{
  return MEMORY[0x1F41851C0]();
}

uint64_t sub_1AF7AEEA0()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1AF7AEEB0()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1AF7AEEC0()
{
  return MEMORY[0x1F41852B0]();
}

uint64_t sub_1AF7AEED0()
{
  return MEMORY[0x1F41852C0]();
}

uint64_t sub_1AF7AEEE0()
{
  return MEMORY[0x1F41852C8]();
}

uint64_t sub_1AF7AEEF0()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1AF7AEF00()
{
  return MEMORY[0x1F4185358]();
}

uint64_t sub_1AF7AEF10()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1AF7AEF20()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1AF7AEF30()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1AF7AEF50()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1AF7AEF60()
{
  return MEMORY[0x1F4185730]();
}

uint64_t sub_1AF7AEF70()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_1AF7AEF80()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1AF7AEFA0()
{
  return MEMORY[0x1F41859C8]();
}

uint64_t sub_1AF7AEFB0()
{
  return MEMORY[0x1F4185A20]();
}

uint64_t sub_1AF7AEFC0()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1AF7AEFD0()
{
  return MEMORY[0x1F4185A38]();
}

uint64_t sub_1AF7AEFE0()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1AF7AEFF0()
{
  return MEMORY[0x1F4185B90]();
}

uint64_t sub_1AF7AF000()
{
  return MEMORY[0x1F4185B98]();
}

uint64_t sub_1AF7AF010()
{
  return MEMORY[0x1F4185D10]();
}

uint64_t sub_1AF7AF030()
{
  return MEMORY[0x1F4185D40]();
}

uint64_t sub_1AF7AF040()
{
  return MEMORY[0x1F4185D58]();
}

uint64_t sub_1AF7AF050()
{
  return MEMORY[0x1F4185DA0]();
}

uint64_t sub_1AF7AF060()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1AF7AF070()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1AF7AF080()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_1AF7AF090()
{
  return MEMORY[0x1F4185DE8]();
}

uint64_t sub_1AF7AF0A0()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1AF7AF0B0()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1AF7AF0C0()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1AF7AF0D0()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1AF7AF0F0()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1AF7AF100()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1AF7AF110()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_1AF7AF120()
{
  return MEMORY[0x1F4185EE0]();
}

uint64_t sub_1AF7AF130()
{
  return MEMORY[0x1F4185EE8]();
}

uint64_t sub_1AF7AF140()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1AF7AF150()
{
  return MEMORY[0x1F4186098]();
}

uint64_t sub_1AF7AF160()
{
  return MEMORY[0x1F41860B8]();
}

uint64_t sub_1AF7AF170()
{
  return MEMORY[0x1F41860C8]();
}

uint64_t sub_1AF7AF180()
{
  return MEMORY[0x1F41860E8]();
}

uint64_t sub_1AF7AF190()
{
  return MEMORY[0x1F41860F0]();
}

uint64_t sub_1AF7AF1A0()
{
  return MEMORY[0x1F41862B8]();
}

uint64_t sub_1AF7AF1B0()
{
  return MEMORY[0x1F4186318]();
}

uint64_t ASCLockupViewSizeGetEstimatedSize()
{
  return MEMORY[0x1F4109228]();
}

uint64_t ASCLockupViewSizeGetIconSize()
{
  return MEMORY[0x1F4109230]();
}

uint64_t CAColorMatrixMakeSaturation()
{
  return MEMORY[0x1F40F4A80]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x1F40F4A90]();
  return result;
}

BOOL CATransform3DIsIdentity(CATransform3D *t)
{
  return MEMORY[0x1F40F4D08](t);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D20](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D30](retstr, tx, ty, tz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

void CFRelease(CFTypeRef cf)
{
}

SInt32 CFUserNotificationDisplayAlert(CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle, CFStringRef alternateButtonTitle, CFStringRef otherButtonTitle, CFOptionFlags *responseFlags)
{
  return MEMORY[0x1F40D8A48](flags, iconURL, soundURL, localizationURL, alertHeader, alertMessage, defaultButtonTitle, alternateButtonTitle, timeout);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97C8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97E8](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F0](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F8](retstr, t, tx, ty);
}

CGColorRef CGColorCreateGenericRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1F40D99A8](red, green, blue, alpha);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  MEMORY[0x1F40D99F0](color);
  return result;
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1F40D9A18](color);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextBeginTransparencyLayer(CGContextRef c, CFDictionaryRef auxiliaryInfo)
{
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextEndTransparencyLayer(CGContextRef c)
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

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1F40DA890](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x1F40DA8D8](image);
}

void CGImageRelease(CGImageRef image)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB068]();
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x1F40DB220](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
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

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB2D0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGRect CTFontGetBoundingRectsForGlyphs(CTFontRef font, CTFontOrientation orientation, const CGGlyph *glyphs, CGRect *boundingRects, CFIndex count)
{
  MEMORY[0x1F40DF4C0](font, *(void *)&orientation, glyphs, boundingRects, count);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x1F40DF790](attrString);
}

CGRect CTLineGetImageBounds(CTLineRef line, CGContextRef context)
{
  MEMORY[0x1F40DF7E8](line, context);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

double CTLineGetTypographicBounds(CTLineRef line, CGFloat *ascent, CGFloat *descent, CGFloat *leading)
{
  MEMORY[0x1F40DF820](line, ascent, descent, leading);
  return result;
}

uint64_t GKAbsoluteTimeAsWhenString()
{
  return MEMORY[0x1F411B530]();
}

uint64_t GKApplicationLinkedOnOrAfter()
{
  return MEMORY[0x1F411B538]();
}

uint64_t GKAtomicCompareAndSwap32()
{
  return MEMORY[0x1F411B540]();
}

uint64_t GKAtomicDecrement32()
{
  return MEMORY[0x1F411B548]();
}

uint64_t GKAtomicIncrement32()
{
  return MEMORY[0x1F411B550]();
}

uint64_t GKAvatarSubdirectoryNameForPlayerID()
{
  return MEMORY[0x1F411B558]();
}

uint64_t GKFormattedStringFromInteger()
{
  return MEMORY[0x1F411B560]();
}

uint64_t GKFormattedStringWithGroupingFromInteger()
{
  return MEMORY[0x1F411B568]();
}

uint64_t GKGameCenterUICoreFrameworkBundle()
{
  return MEMORY[0x1F411B570]();
}

uint64_t GKGameCenterUIFrameworkBundle()
{
  return MEMORY[0x1F411B578]();
}

uint64_t GKGetLocalizedStringFromTableInBundle()
{
  return MEMORY[0x1F411B580]();
}

uint64_t GKHostUsesXRUIIdiom()
{
  return MEMORY[0x1F411BAF0]();
}

uint64_t GKImageURLKeyForSize()
{
  return MEMORY[0x1F411B588]();
}

uint64_t GKIsAvatarEditingSupported()
{
  return MEMORY[0x1F411BAF8]();
}

uint64_t GKIsXRUIIdiom()
{
  return MEMORY[0x1F411BB00]();
}

uint64_t GKIsXRUIIdiomShouldUsePadUI()
{
  return MEMORY[0x1F411BB08]();
}

uint64_t GKIsXRUIIdiomShouldUsePhoneUI()
{
  return MEMORY[0x1F411BB10]();
}

uint64_t GKOSLoggers()
{
  return MEMORY[0x1F411B590]();
}

uint64_t GKRefreshDataTypeAsString()
{
  return MEMORY[0x1F411B598]();
}

uint64_t GKSetHostUserInterfaceIdiom()
{
  return MEMORY[0x1F411BB18]();
}

uint64_t GKShouldLayoutRTL()
{
  return MEMORY[0x1F411BB20]();
}

uint64_t GKUISetRemote()
{
  return MEMORY[0x1F411B5A0]();
}

uint64_t IDSIDAliasHashUInt64()
{
  return MEMORY[0x1F4122CD0]();
}

uint64_t IMSPIGetGroupPhotosForChatsWithGroupIDs()
{
  return MEMORY[0x1F4122F78]();
}

uint64_t IMSPISendMessageWithAttachments()
{
  return MEMORY[0x1F4122FB0]();
}

uint64_t IMSPISendMessageWithAttachmentsToMany()
{
  return MEMORY[0x1F4122FC0]();
}

uint64_t IMSPISendRichLink()
{
  return MEMORY[0x1F4122FC8]();
}

uint64_t IMSPISendRichLinkToMany()
{
  return MEMORY[0x1F4122FD0]();
}

uint64_t IMStringIsEmail()
{
  return MEMORY[0x1F4123A48]();
}

uint64_t IMStringIsPhoneNumber()
{
  return MEMORY[0x1F4123A70]();
}

uint64_t JECountFormatterMakeStringFromNumber()
{
  return MEMORY[0x1F4129428]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetFloat32Answer()
{
  return MEMORY[0x1F417CE10]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1F417CE38]();
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1F4166AA8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *__cdecl NSStringFromUIEdgeInsets(UIEdgeInsets insets)
{
  return (NSString *)MEMORY[0x1F4166AC0](*(__n128 *)&insets.top, *(__n128 *)&insets.left, *(__n128 *)&insets.bottom, *(__n128 *)&insets.right);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E72E0](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

uint64_t PSShouldInsetListView()
{
  return MEMORY[0x1F4145EB0]();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1F4166BA0](category);
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

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1F4166CC0](image);
}

uint64_t UIRectCenteredXInRect()
{
  return MEMORY[0x1F4166E30]();
}

uint64_t UIRectCenteredYInRect()
{
  return MEMORY[0x1F4166E40]();
}

void UIRectFillUsingBlendMode(CGRect rect, CGBlendMode blendMode)
{
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

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x1F40E7328](commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x1F40C9C80](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _gkBeautifyVariableName()
{
  return MEMORY[0x1F411B5A8]();
}

uint64_t _gkTabStringForTabLevel()
{
  return MEMORY[0x1F411B5B0]();
}

uint64_t _gkUnicodifyDescription()
{
  return MEMORY[0x1F411B5B8]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
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

BOOL class_respondsToSelector(Class cls, SEL sel)
{
  return MEMORY[0x1F4181580](cls, sel);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

uint64_t gk_dispatch_as_group()
{
  return MEMORY[0x1F411B5C0]();
}

uint64_t gk_dispatch_async_do()
{
  return MEMORY[0x1F411B5C8]();
}

uint64_t gk_dispatch_debounce()
{
  return MEMORY[0x1F411B5D0]();
}

uint64_t gk_dispatch_group_do()
{
  return MEMORY[0x1F411B5D8]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
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

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
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

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
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

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x1F4181AE8](p, isRequiredMethod, isInstanceMethod, outCount);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  double v4 = (const char *)MEMORY[0x1F4181B08](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1F40CDDF8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1F40CDE50]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1F4181B28](sel);
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

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1F4188200]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_deallocUninitializedObject()
{
  return MEMORY[0x1F41864A8]();
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

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x1F41864E8]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x1F4186508]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
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

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
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

uint64_t swift_readAtKeyPath()
{
  return MEMORY[0x1F4186738]();
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

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1F41867B0]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x1F41868A0]();
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

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1F41868E8]();
}

vImage_Error vImageBoxConvolve_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, uint32_t kernel_height, uint32_t kernel_width, const Pixel_8888 backgroundColor, vImage_Flags flags)
{
  return MEMORY[0x1F40D2258](src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, *(void *)&kernel_height, *(void *)&kernel_width, backgroundColor);
}

vImage_Error vImageBuffer_Init(vImage_Buffer *buf, vImagePixelCount height, vImagePixelCount width, uint32_t pixelBits, vImage_Flags flags)
{
  return MEMORY[0x1F40D22A0](buf, height, width, *(void *)&pixelBits, *(void *)&flags);
}

vImage_Error vImageBuffer_InitWithCGImage(vImage_Buffer *buf, vImage_CGImageFormat *format, const CGFloat *backgroundColor, CGImageRef image, vImage_Flags flags)
{
  return MEMORY[0x1F40D22B8](buf, format, backgroundColor, image, *(void *)&flags);
}

CGImageRef vImageCreateCGImageFromBuffer(const vImage_Buffer *buf, const vImage_CGImageFormat *format, void (__cdecl *callback)(void *, void *), void *userData, vImage_Flags flags, vImage_Error *error)
{
  return (CGImageRef)MEMORY[0x1F40D2860](buf, format, callback, userData, *(void *)&flags, error);
}

vImage_Error vImageMatrixMultiply_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, const int16_t matrix[16], int32_t divisor, const int16_t *pre_bias, const int32_t *post_bias, vImage_Flags flags)
{
  return MEMORY[0x1F40D2A58](src, dest, matrix, *(void *)&divisor, pre_bias, post_bias, *(void *)&flags);
}