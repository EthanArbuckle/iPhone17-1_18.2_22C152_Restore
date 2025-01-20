__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_2465AC610(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_2465AC630(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)result = (a2 - 1);
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

void type metadata accessor for CGSize()
{
  if (!qword_268F8EE00)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_268F8EE00);
    }
  }
}

_MarketplaceKit_UIKit::ActionButton::ButtonImagePlacement_optional __swiftcall ActionButton.ButtonImagePlacement.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 4;
  if ((unint64_t)rawValue < 4) {
    char v2 = rawValue;
  }
  *uint64_t v1 = v2;
  return (_MarketplaceKit_UIKit::ActionButton::ButtonImagePlacement_optional)rawValue;
}

uint64_t ActionButton.ButtonImagePlacement.rawValue.getter()
{
  return *v0;
}

BOOL sub_2465AC6CC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2465AC6E0()
{
  return sub_2465BE228();
}

uint64_t sub_2465AC728()
{
  return sub_2465BE218();
}

uint64_t sub_2465AC754()
{
  return sub_2465BE228();
}

_MarketplaceKit_UIKit::ActionButton::ButtonImagePlacement_optional sub_2465AC798(Swift::Int *a1)
{
  return ActionButton.ButtonImagePlacement.init(rawValue:)(*a1);
}

void sub_2465AC7A0(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t ActionButton.action.getter@<X0>(uint64_t a1@<X8>)
{
  sub_2465BDF98();
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_2465B6C38(v1 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_action, a1, type metadata accessor for ActionButton.Action);

  return swift_release();
}

uint64_t type metadata accessor for ActionButton.Action(uint64_t a1)
{
  return sub_2465ACCF0(a1, (uint64_t *)&unk_268F8EEF0);
}

id ActionButton.__allocating_init(action:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return ActionButton.init(action:)(a1);
}

id ActionButton.init(action:)(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8EE70);
  MEMORY[0x270FA5388]();
  v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = &v1[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__label];
  *(void *)v5 = 32;
  *((void *)v5 + 1) = 0xE100000000000000;
  v6 = &v1[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__imageName];
  *(void *)v6 = 0;
  *((void *)v6 + 1) = 0;
  uint64_t v7 = OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__backgroundColor;
  v8 = self;
  v9 = v1;
  *(void *)&v1[v7] = objc_msgSend(v8, sel_whiteColor);
  *(void *)&v9[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__borderWidth] = 0;
  uint64_t v10 = OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__borderColor;
  *(void *)&v9[v10] = objc_msgSend(v8, sel_clearColor);
  v9[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__imagePlacement] = 1;
  v11 = &v9[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__size];
  *(void *)v11 = 0;
  *((void *)v11 + 1) = 0;
  *(void *)&v9[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__fontSize] = 0x4028000000000000;
  uint64_t v12 = OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_slotView;
  *(void *)&v9[v12] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F830E0]), sel_init);
  v9[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_performingAction] = 0;
  sub_2465B6C38(a1, (uint64_t)&v9[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_action], type metadata accessor for ActionButton.Action);
  uint64_t v13 = *MEMORY[0x263F10AF8];
  uint64_t v14 = sub_2465BDDA8();
  uint64_t v15 = *(void *)(v14 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 104))(v4, v13, v14);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v4, 0, 1, v14);
  id v16 = objc_msgSend(v8, sel_whiteColor);
  id v17 = objc_msgSend(v16, sel_CGColor);

  id v18 = objc_msgSend(v8, sel_blueColor);
  id v19 = objc_msgSend(v18, sel_CGColor);

  id v20 = objc_msgSend(v8, sel_clearColor);
  id v21 = objc_msgSend(v20, sel_CGColor);

  id v22 = objc_allocWithZone((Class)sub_2465BDDC8());
  v23 = (void *)sub_2465BDDB8();
  v24 = (objc_class *)type metadata accessor for SecureButtonContentDelegate();
  v25 = (char *)objc_allocWithZone(v24);
  *(void *)&v25[OBJC_IVAR____TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate_templateTag] = v23;
  v31.receiver = v25;
  v31.super_class = v24;
  id v26 = v23;
  *(void *)&v9[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_contentDelegate] = objc_msgSendSuper2(&v31, sel_init);

  v27 = (objc_class *)type metadata accessor for ActionButton(0);
  v30.receiver = v9;
  v30.super_class = v27;
  id v28 = objc_msgSendSuper2(&v30, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_2465AFC1C();

  sub_2465B6A6C(a1, type metadata accessor for ActionButton.Action);
  return v28;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for ActionButton(uint64_t a1)
{
  return sub_2465ACCF0(a1, (uint64_t *)&unk_268F8EED8);
}

uint64_t sub_2465ACCF0(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id sub_2465ACE04(void *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  sub_2465BDF98();
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v6 = a1;
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for ActionButton(0);
  id v7 = objc_msgSendSuper2(&v9, *a4);
  swift_release();

  swift_release();
  return v7;
}

uint64_t sub_2465ACF40(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  sub_2465BDF98();
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v8 = a1;
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v10.receiver = v8;
  v10.super_class = (Class)type metadata accessor for ActionButton(0);
  objc_msgSendSuper2(&v10, *a5, a3);
  sub_2465AFAE0();
  swift_release();

  return swift_release();
}

id sub_2465AD130()
{
  sub_2465BDF98();
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v1 = *(id *)(v0 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__backgroundColor);
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2465AD300(void *a1)
{
  sub_2465BDF98();
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (a1)
  {
    id v3 = a1;
  }
  else
  {
    sub_2465BDF88();
    sub_2465BDF78();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    id v3 = objc_msgSend(self, sel_whiteColor);
    swift_release();
  }
  id v4 = a1;
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v5 = *(void **)&v1[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__backgroundColor];
  *(void *)&v1[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__backgroundColor] = v3;
  swift_release();

  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_2465AFAE0();
  uint64_t v6 = *(void *)&v1[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_contentDelegate];
  id v7 = sub_2465B0154();
  id v8 = *(void **)(v6 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate_templateTag);
  *(void *)(v6 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate_templateTag) = v7;

  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_slotView], sel__updateContent);
  objc_msgSend(v1, sel_setNeedsLayout);
  swift_release();

  return swift_release();
}

uint64_t sub_2465AD74C(void *a1)
{
  sub_2465BDF98();
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for ActionButton(0);
  objc_msgSendSuper2(&v7, sel_setTintColor_, a1);
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_2465AFAE0();
  uint64_t v3 = *(void *)&v1[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_contentDelegate];
  id v4 = sub_2465B0154();
  v5 = *(void **)(v3 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate_templateTag);
  *(void *)(v3 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate_templateTag) = v4;

  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_slotView], sel__updateContent);
  objc_msgSend(v1, sel_setNeedsLayout);
  swift_release();

  return swift_release();
}

uint64_t sub_2465AD8C4()
{
  sub_2465BDF98();
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__label);
  swift_bridgeObjectRetain();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2465AD9CC(uint64_t a1, uint64_t a2)
{
  sub_2465BDF98();
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v5 = &v2[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__label];
  *(void *)v5 = a1;
  *((void *)v5 + 1) = a2;
  swift_release();
  swift_bridgeObjectRelease();
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_2465AFAE0();
  uint64_t v6 = *(void *)&v2[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_contentDelegate];
  id v7 = sub_2465B0154();
  id v8 = *(void **)(v6 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate_templateTag);
  *(void *)(v6 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate_templateTag) = v7;

  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_slotView], sel__updateContent);
  objc_msgSend(v2, sel_setNeedsLayout);
  swift_release();

  return swift_release();
}

uint64_t (*sub_2465ADBA0(void *a1))(uint64_t *a1, char a2)
{
  a1[2] = v1;
  sub_2465BDF98();
  a1[3] = sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__label);
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__label + 8);
  swift_bridgeObjectRetain();
  swift_release();
  swift_release();
  *a1 = v4;
  a1[1] = v3;
  return sub_2465ADD18;
}

uint64_t sub_2465ADD18(uint64_t *a1, char a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  if (a2)
  {
    swift_bridgeObjectRetain();
    sub_2465AD9CC(v3, v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2465AD9CC(*a1, v2);
  }

  return swift_release();
}

uint64_t sub_2465ADD88()
{
  sub_2465BDF98();
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__imageName);
  swift_bridgeObjectRetain();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2465ADE90(uint64_t a1, uint64_t a2)
{
  sub_2465BDF98();
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v5 = &v2[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__imageName];
  *(void *)v5 = a1;
  *((void *)v5 + 1) = a2;
  swift_release();
  swift_bridgeObjectRelease();
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_2465AFAE0();
  uint64_t v6 = *(void *)&v2[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_contentDelegate];
  id v7 = sub_2465B0154();
  id v8 = *(void **)(v6 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate_templateTag);
  *(void *)(v6 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate_templateTag) = v7;

  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_slotView], sel__updateContent);
  objc_msgSend(v2, sel_setNeedsLayout);
  swift_release();

  return swift_release();
}

uint64_t (*sub_2465AE064(void *a1))(uint64_t *a1, char a2)
{
  a1[2] = v1;
  sub_2465BDF98();
  a1[3] = sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__imageName);
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__imageName + 8);
  swift_bridgeObjectRetain();
  swift_release();
  swift_release();
  *a1 = v4;
  a1[1] = v3;
  return sub_2465AE1DC;
}

uint64_t sub_2465AE1DC(uint64_t *a1, char a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  if (a2)
  {
    swift_bridgeObjectRetain();
    sub_2465ADE90(v3, v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2465ADE90(*a1, v2);
  }

  return swift_release();
}

uint64_t sub_2465AE24C@<X0>(unsigned char *a1@<X8>)
{
  sub_2465BDF98();
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  char v3 = *(unsigned char *)(v1 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__imagePlacement);
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2465AE348(char *a1)
{
  char v2 = *a1;
  sub_2465BDF98();
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v1[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__imagePlacement] = v2;
  swift_release();
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_2465AFAE0();
  uint64_t v3 = *(void *)&v1[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_contentDelegate];
  id v4 = sub_2465B0154();
  v5 = *(void **)(v3 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate_templateTag);
  *(void *)(v3 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate_templateTag) = v4;

  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_slotView], sel__updateContent);
  objc_msgSend(v1, sel_setNeedsLayout);
  swift_release();

  return swift_release();
}

uint64_t (*sub_2465AE508(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)a1 = v1;
  sub_2465BDF98();
  *(void *)(a1 + 8) = sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  char v3 = *(unsigned char *)(v1 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__imagePlacement);
  swift_release();
  swift_release();
  *(unsigned char *)(a1 + 16) = v3;
  return sub_2465AE680;
}

uint64_t sub_2465AE680(uint64_t a1, char a2)
{
  if (a2)
  {
    char v4 = *(unsigned char *)(a1 + 16);
    char v2 = &v4;
  }
  else
  {
    char v5 = *(unsigned char *)(a1 + 16);
    char v2 = &v5;
  }
  sub_2465AE348(v2);
  return swift_release();
}

double sub_2465AE6D0()
{
  sub_2465BDF98();
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  double v1 = *(double *)(v0 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__size);
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2465AE7D8(double a1, double a2)
{
  sub_2465BDF98();
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  char v5 = (double *)&v2[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__size];
  double *v5 = a1;
  v5[1] = a2;
  swift_release();
  objc_msgSend(v2, sel_frame);
  objc_msgSend(v2, sel_setFrame_);
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_2465AFAE0();
  uint64_t v6 = *(void *)&v2[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_contentDelegate];
  id v7 = sub_2465B0154();
  id v8 = *(void **)(v6 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate_templateTag);
  *(void *)(v6 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate_templateTag) = v7;

  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_slotView], sel__updateContent);
  objc_msgSend(v2, sel_setNeedsLayout);
  swift_release();

  return swift_release();
}

uint64_t (*sub_2465AE9C8(void *a1))(double *a1)
{
  a1[2] = v1;
  sub_2465BDF98();
  a1[3] = sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__size);
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__size + 8);
  swift_release();
  swift_release();
  *a1 = v3;
  a1[1] = v4;
  return sub_2465AEB40;
}

uint64_t sub_2465AEB40(double *a1)
{
  sub_2465AE7D8(*a1, a1[1]);

  return swift_release();
}

double sub_2465AEB7C()
{
  return sub_2465AF174(143, 42, &OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__fontSize);
}

uint64_t sub_2465AEB90(double a1)
{
  return sub_2465AF298(a1, 146, 42, &OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__fontSize);
}

uint64_t (*sub_2465AEBA4(void *a1))(double *a1, uint64_t a2)
{
  a1[1] = v1;
  sub_2465BDF98();
  a1[2] = sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__fontSize);
  swift_release();
  swift_release();
  *a1 = v3;
  return sub_2465AED18;
}

uint64_t sub_2465AED18(double *a1, uint64_t a2)
{
  return sub_2465AF5F4(a1, a2, (void (*)(double))sub_2465AEB90);
}

uint64_t sub_2465AED30@<X0>(void **a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  sub_2465BDF98();
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  objc_msgSend(v3, sel__cornerRadius);
  uint64_t v5 = v4;
  uint64_t result = swift_release();
  *a2 = v5;
  return result;
}

double sub_2465AEDE4()
{
  sub_2465BDF98();
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  objc_msgSend(v0, sel__cornerRadius);
  double v2 = v1;
  swift_release();
  return v2;
}

uint64_t sub_2465AEE8C(double a1)
{
  sub_2465BDF98();
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  objc_msgSend(v1, sel__setCornerRadius_, a1);
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_2465AFAE0();
  uint64_t v3 = *(void *)&v1[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_contentDelegate];
  id v4 = sub_2465B0154();
  uint64_t v5 = *(void **)(v3 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate_templateTag);
  *(void *)(v3 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate_templateTag) = v4;

  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_slotView], sel__updateContent);
  objc_msgSend(v1, sel_setNeedsLayout);
  swift_release();

  return swift_release();
}

uint64_t (*sub_2465AF000(void *a1))(double *a1)
{
  a1[1] = v1;
  sub_2465BDF98();
  a1[2] = sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  objc_msgSend(v1, sel__cornerRadius);
  uint64_t v4 = v3;
  swift_release();
  *a1 = v4;
  return sub_2465AF124;
}

uint64_t sub_2465AF124(double *a1)
{
  sub_2465AEE8C(*a1);

  return swift_release();
}

double sub_2465AF160()
{
  return sub_2465AF174(163, 38, &OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__borderWidth);
}

double sub_2465AF174(uint64_t a1, uint64_t a2, void *a3)
{
  sub_2465BDF98();
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  double v5 = *(double *)(v3 + *a3);
  swift_release();
  swift_release();
  return v5;
}

uint64_t sub_2465AF284(double a1)
{
  return sub_2465AF298(a1, 166, 38, &OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__borderWidth);
}

uint64_t sub_2465AF298(double a1, uint64_t a2, uint64_t a3, void *a4)
{
  sub_2465BDF98();
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(double *)&v4[*a4] = a1;
  swift_release();
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_2465AFAE0();
  uint64_t v7 = *(void *)&v4[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_contentDelegate];
  id v8 = sub_2465B0154();
  objc_super v9 = *(void **)(v7 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate_templateTag);
  *(void *)(v7 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate_templateTag) = v8;

  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_slotView], sel__updateContent);
  objc_msgSend(v4, sel_setNeedsLayout);
  swift_release();

  return swift_release();
}

uint64_t (*sub_2465AF468(void *a1))(double *a1, uint64_t a2)
{
  a1[1] = v1;
  sub_2465BDF98();
  a1[2] = sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__borderWidth);
  swift_release();
  swift_release();
  *a1 = v3;
  return sub_2465AF5DC;
}

uint64_t sub_2465AF5DC(double *a1, uint64_t a2)
{
  return sub_2465AF5F4(a1, a2, (void (*)(double))sub_2465AF284);
}

uint64_t sub_2465AF5F4(double *a1, uint64_t a2, void (*a3)(double))
{
  a3(*a1);

  return swift_release();
}

id sub_2465AF634()
{
  sub_2465BDF98();
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v1 = *(id *)(v0 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__borderColor);
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2465AF734(void *a1)
{
  sub_2465BDF98();
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v3 = a1;
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = *(void **)&v1[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__borderColor];
  *(void *)&v1[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__borderColor] = v3;
  swift_release();

  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_2465AFAE0();
  uint64_t v5 = *(void *)&v1[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_contentDelegate];
  id v6 = sub_2465B0154();
  uint64_t v7 = *(void **)(v5 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate_templateTag);
  *(void *)(v5 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate_templateTag) = v6;

  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_slotView], sel__updateContent);
  objc_msgSend(v1, sel_setNeedsLayout);
  swift_release();

  return swift_release();
}

uint64_t (*sub_2465AF908(void *a1))(void **a1, char a2)
{
  a1[1] = v1;
  sub_2465BDF98();
  a1[2] = sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v3 = *(id *)(v1 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__borderColor);
  swift_release();
  swift_release();
  *a1 = v3;
  return sub_2465AFA7C;
}

uint64_t sub_2465AFA7C(void **a1, char a2)
{
  double v2 = *a1;
  if (a2)
  {
    id v3 = v2;
    sub_2465AF734(v3);
  }
  else
  {
    sub_2465AF734(v2);
  }

  return swift_release();
}

uint64_t sub_2465AFAE0()
{
  sub_2465BDF98();
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (objc_msgSend(v0, sel_isEnabled))
  {
    id v1 = objc_msgSend(v0, sel_traitCollection);
    BOOL v2 = objc_msgSend(v1, sel_userInterfaceStyle) == (id)2;

    id v3 = *(void **)&v0[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_slotView];
    unsigned int v4 = objc_msgSend(v0, sel_isHighlighted);
    double v5 = dbl_2465BE920[v2];
    if (!v4) {
      double v5 = 1.0;
    }
    objc_msgSend(v3, sel_setAlpha_, v5);
  }
  else
  {
    objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_slotView], sel_setAlpha_, 0.25);
  }

  return swift_release();
}

uint64_t sub_2465AFC1C()
{
  id v1 = v0;
  type metadata accessor for ActionButton.Action(0);
  MEMORY[0x270FA5388]();
  id v3 = (void *)((char *)v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2465BDF98();
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  unsigned int v4 = *(void **)&v0[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_slotView];
  objc_msgSend(v4, sel__setContentDelegate_, *(void *)&v0[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_contentDelegate]);
  objc_msgSend(v0, sel_addTarget_action_forControlEvents_, v0, sel_defaultAction_event_, 64);
  id v5 = objc_msgSend(self, sel_whiteColor);
  objc_msgSend(v4, sel_setTintColor_, v5);

  objc_msgSend(v1, sel_setIsAccessibilityElement_, 1);
  sub_2465B6C38((uint64_t)&v1[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_action], (uint64_t)v3, type metadata accessor for ActionButton.Action);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v6 = *v3;
      uint64_t v22 = 0;
      unint64_t v23 = 0xE000000000000000;
      sub_2465BE038();
      swift_bridgeObjectRelease();
      uint64_t v7 = 0x6574656C6544;
      goto LABEL_11;
    case 2u:
      sub_2465B6A6C((uint64_t)v3, type metadata accessor for ActionButton.Action);
      goto LABEL_6;
    case 3u:
      uint64_t v6 = *v3;
      uint64_t v22 = 0;
      unint64_t v23 = 0xE000000000000000;
      sub_2465BE038();
      swift_bridgeObjectRelease();
      uint64_t v7 = 0x68636E75614CLL;
LABEL_11:
      uint64_t v22 = v7 & 0xFFFFFFFFFFFFLL | 0x20000000000000;
      unint64_t v23 = 0xE700000000000000;
      v21[1] = v6;
      sub_2465BE1D8();
      sub_2465BDF08();
      swift_bridgeObjectRelease();
      sub_2465BDF08();
      goto LABEL_12;
    default:
      swift_bridgeObjectRelease();
      swift_release();
LABEL_6:
      sub_2465BDF88();
      sub_2465BDF78();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_bridgeObjectRetain();
      swift_release();
LABEL_12:
      id v8 = (void *)sub_2465BDEE8();
      swift_bridgeObjectRelease();
      objc_msgSend(v1, sel_setAccessibilityIdentifier_, v8);

      objc_msgSend(v4, sel_setUserInteractionEnabled_, 0);
      objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
      objc_msgSend(v1, sel_addSubview_, v4);
      objc_super v9 = self;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268F8EF50);
      uint64_t v10 = swift_allocObject();
      *(_OWORD *)(v10 + 16) = xmmword_2465BE930;
      id v11 = objc_msgSend(v4, sel_centerXAnchor);
      id v12 = objc_msgSend(v1, sel_centerXAnchor);
      id v13 = objc_msgSend(v11, sel_constraintEqualToAnchor_, v12);

      *(void *)(v10 + 32) = v13;
      id v14 = objc_msgSend(v4, sel_centerYAnchor);
      id v15 = objc_msgSend(v1, sel_centerYAnchor);
      id v16 = objc_msgSend(v14, sel_constraintEqualToAnchor_, v15);

      *(void *)(v10 + 40) = v16;
      uint64_t v22 = v10;
      sub_2465BDF48();
      sub_2465B6E74();
      id v17 = (void *)sub_2465BDF38();
      swift_bridgeObjectRelease();
      objc_msgSend(v9, sel_activateConstraints_, v17);

      LODWORD(v18) = 1144750080;
      objc_msgSend(v1, sel_setContentHuggingPriority_forAxis_, 1, v18);
      LODWORD(v19) = 1144750080;
      objc_msgSend(v1, sel_setContentHuggingPriority_forAxis_, 0, v19);
      return swift_release();
  }
}

id sub_2465B0154()
{
  id v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8EE70);
  MEMORY[0x270FA5388]();
  sub_2465BDF98();
  uint64_t v14 = sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v12 = *(void *)&v0[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__label + 8];
  uint64_t v13 = *(void *)&v0[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__label];
  swift_bridgeObjectRetain();
  swift_release();
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v11 = *(void *)&v0[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__imageName];
  swift_bridgeObjectRetain();
  swift_release();
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  sub_2465BDD98();
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v2 = *(id *)&v0[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__backgroundColor];
  swift_release();
  id v3 = objc_msgSend(v2, sel_CGColor, v11, v12, v13, v14);

  id result = objc_msgSend(v0, sel_tintColor);
  if (result)
  {
    id v5 = result;
    id v6 = objc_msgSend(result, sel_CGColor);

    objc_msgSend(v1, sel__cornerRadius);
    sub_2465BDF88();
    sub_2465BDF78();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    sub_2465BDF88();
    sub_2465BDF78();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    sub_2465BDF88();
    sub_2465BDF78();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    sub_2465BDF88();
    sub_2465BDF78();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    id v7 = *(id *)&v1[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__borderColor];
    swift_release();
    id v8 = objc_msgSend(v7, sel_CGColor);

    id v9 = objc_allocWithZone((Class)sub_2465BDDC8());
    uint64_t v10 = sub_2465BDDB8();
    swift_release();
    return (id)v10;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2465B0678(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[14] = a6;
  v7[15] = a7;
  v7[12] = a4;
  v7[13] = a5;
  uint64_t v8 = sub_2465BDEB8();
  v7[16] = v8;
  v7[17] = *(void *)(v8 - 8);
  v7[18] = swift_task_alloc();
  uint64_t v9 = sub_2465BDE08();
  v7[19] = v9;
  v7[20] = *(void *)(v9 - 8);
  v7[21] = swift_task_alloc();
  v7[22] = swift_task_alloc();
  uint64_t v10 = sub_2465BDDD8();
  v7[23] = v10;
  v7[24] = *(void *)(v10 - 8);
  v7[25] = swift_task_alloc();
  v7[26] = swift_task_alloc();
  v7[27] = swift_task_alloc();
  v7[28] = type metadata accessor for ActionButton.Action(0);
  v7[29] = swift_task_alloc();
  v7[30] = swift_task_alloc();
  v7[31] = swift_task_alloc();
  v7[32] = type metadata accessor for InstallConfiguration(0);
  v7[33] = swift_task_alloc();
  uint64_t v11 = sub_2465BDD28();
  v7[34] = v11;
  v7[35] = *(void *)(v11 - 8);
  v7[36] = swift_task_alloc();
  v7[37] = swift_task_alloc();
  uint64_t v12 = sub_2465BDE58();
  v7[38] = v12;
  v7[39] = *(void *)(v12 - 8);
  v7[40] = swift_task_alloc();
  uint64_t v13 = sub_2465BDE78();
  v7[41] = v13;
  v7[42] = *(void *)(v13 - 8);
  v7[43] = swift_task_alloc();
  uint64_t v14 = sub_2465BDE18();
  v7[44] = v14;
  v7[45] = *(void *)(v14 - 8);
  v7[46] = swift_task_alloc();
  uint64_t v15 = sub_2465BDE48();
  v7[47] = v15;
  v7[48] = *(void *)(v15 - 8);
  v7[49] = swift_task_alloc();
  v7[50] = sub_2465BDF98();
  v7[51] = sub_2465BDF88();
  uint64_t v17 = sub_2465BDF78();
  v7[52] = v17;
  v7[53] = v16;
  return MEMORY[0x270FA2498](sub_2465B0AB0, v17, v16);
}

uint64_t sub_2465B0AB0()
{
  id v1 = (void *)v0[13];
  (*(void (**)(void, void, void))(v0[45] + 16))(v0[46], v0[12], v0[44]);
  id v2 = v1;
  sub_2465BDE38();
  id v3 = (void *)swift_task_alloc();
  v0[54] = v3;
  *id v3 = v0;
  v3[1] = sub_2465B0B8C;
  uint64_t v4 = v0[43];
  return MEMORY[0x270EF5A58](v4);
}

uint64_t sub_2465B0B8C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 440) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 424);
  uint64_t v4 = *(void *)(v2 + 416);
  if (v0) {
    id v5 = sub_2465B1318;
  }
  else {
    id v5 = sub_2465B0CC8;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_2465B0CC8()
{
  uint64_t v2 = v0[39];
  uint64_t v1 = v0[40];
  uint64_t v3 = v0[38];
  sub_2465BDE68();
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 88))(v1, v3);
  if (v4 == *MEMORY[0x263F10B50])
  {
    uint64_t v5 = v0[40];
    uint64_t v6 = v0[37];
    uint64_t v7 = v0[34];
    uint64_t v8 = v0[35];
    uint64_t v9 = v0[31];
    uint64_t v10 = v0[14];
    (*(void (**)(uint64_t, void))(v0[39] + 96))(v5, v0[38]);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v6, v5, v7);
    sub_2465B6C38(v10 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_action, v9, type metadata accessor for ActionButton.Action);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      uint64_t v12 = v0[32];
      uint64_t v11 = v0[33];
      sub_2465B69B0(v0[31], v11);
      uint64_t v13 = (int **)(v11 + *(int *)(v12 + 20));
      uint64_t v14 = *v13;
      v0[56] = v13[1];
      v43 = (uint64_t (*)(void))((char *)v14 + *v14);
      swift_retain();
      uint64_t v15 = (void *)swift_task_alloc();
      v0[57] = v15;
      *uint64_t v15 = v0;
      v15[1] = sub_2465B1908;
      uint64_t v16 = v0 + 5;
LABEL_20:
      return v43(v16);
    }
    uint64_t v23 = v0[48];
    uint64_t v44 = v0[49];
    uint64_t v24 = v0[47];
    uint64_t v26 = v0[42];
    uint64_t v25 = v0[43];
    uint64_t v27 = v0[41];
    uint64_t v29 = v0[37];
    uint64_t v30 = v0[34];
    uint64_t v28 = v0[35];
    uint64_t v31 = v0[31];
LABEL_8:
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v29, v30);
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v25, v27);
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v44, v24);
    sub_2465B6A6C(v31, type metadata accessor for ActionButton.Action);
LABEL_13:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v38 = (uint64_t (*)(void))v0[1];
    return v38();
  }
  if (v4 == *MEMORY[0x263F10B58])
  {
    uint64_t v17 = v0[40];
    uint64_t v19 = v0[35];
    uint64_t v18 = v0[36];
    uint64_t v20 = v0[34];
    uint64_t v21 = v0[30];
    uint64_t v22 = v0[14];
    (*(void (**)(uint64_t, void))(v0[39] + 96))(v17, v0[38]);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 32))(v18, v17, v20);
    sub_2465B6C38(v22 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_action, v21, type metadata accessor for ActionButton.Action);
    if (!swift_getEnumCaseMultiPayload())
    {
      v40 = (void *)v0[30];
      v0[63] = *v40;
      v41 = (int *)v40[1];
      v0[64] = v40[2];
      v43 = (uint64_t (*)(void))((char *)v41 + *v41);
      v42 = (void *)swift_task_alloc();
      v0[65] = v42;
      void *v42 = v0;
      v42[1] = sub_2465B26C0;
      uint64_t v16 = v0 + 8;
      goto LABEL_20;
    }
    uint64_t v23 = v0[48];
    uint64_t v44 = v0[49];
    uint64_t v24 = v0[47];
    uint64_t v26 = v0[42];
    uint64_t v25 = v0[43];
    uint64_t v27 = v0[41];
    uint64_t v28 = v0[35];
    uint64_t v29 = v0[36];
    uint64_t v30 = v0[34];
    uint64_t v31 = v0[30];
    goto LABEL_8;
  }
  if (v4 == *MEMORY[0x263F10B60])
  {
    uint64_t v33 = v0[48];
    uint64_t v32 = v0[49];
    uint64_t v34 = v0[47];
    uint64_t v36 = v0[42];
    uint64_t v35 = v0[43];
    uint64_t v37 = v0[41];
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v35, v37);
    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v32, v34);
    sub_2465BDF88();
    sub_2465BDF78();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    *(unsigned char *)(v0[14] + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_performingAction) = 0;
    swift_release();
    goto LABEL_13;
  }
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  return sub_2465BE0A8();
}

uint64_t sub_2465B1318()
{
  uint64_t v28 = v0;
  uint64_t v2 = v0[48];
  uint64_t v1 = v0[49];
  uint64_t v3 = v0[47];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  int v4 = (void *)v0[55];
  sub_2465BDE88();
  id v5 = v4;
  id v6 = v4;
  uint64_t v7 = sub_2465BDEA8();
  os_log_type_t v8 = sub_2465BDFC8();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    uint64_t v27 = v26;
    *(_DWORD *)uint64_t v9 = 136446210;
    sub_2465BDF88();
    sub_2465BDF78();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v10 = v0[17];
    uint64_t v24 = v0[16];
    uint64_t v25 = v0[18];
    swift_getErrorValue();
    uint64_t v11 = *(void *)(v0[3] - 8);
    swift_task_alloc();
    (*(void (**)(void))(v11 + 16))();
    uint64_t v12 = sub_2465BDEF8();
    unint64_t v14 = v13;
    swift_release();
    swift_task_dealloc();
    v0[11] = sub_2465B9C88(v12, v14, &v27);
    sub_2465BE008();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2465AA000, v7, v8, "[ActionButton] Error performing action: %{public}s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C530970](v26, -1, -1);
    MEMORY[0x24C530970](v9, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v25, v24);
  }
  else
  {
    uint64_t v16 = v0[17];
    uint64_t v15 = v0[18];
    uint64_t v17 = v0[16];

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
  }
  sub_2465B6C38(v0[14] + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_action, v0[29], type metadata accessor for ActionButton.Action);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
    case 3u:
      goto LABEL_19;
    case 2u:
      sub_2465B6A6C(v0[29], type metadata accessor for ActionButton.Action);
      goto LABEL_9;
    default:
      swift_release();
      swift_bridgeObjectRelease();
LABEL_9:
      unint64_t v18 = v0[15];
      if (v18 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v19 = sub_2465BE0B8();
        if (!v19) {
          goto LABEL_18;
        }
      }
      else
      {
        uint64_t v19 = *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (!v19) {
          goto LABEL_18;
        }
      }
      sub_2465BDD88();
      if (v19 < 1)
      {
        __break(1u);
        JUMPOUT(0x2465B18F8);
      }
      if ((v18 & 0xC000000000000001) != 0)
      {
        uint64_t v20 = 0;
        do
        {
          MEMORY[0x24C530330](v20++, v0[15]);
          sub_2465BDD78();
          sub_2465BDD48();
          swift_unknownObjectRelease();
          swift_release();
        }
        while (v19 != v20);
      }
      else
      {
        uint64_t v21 = v0[15] + 32;
        do
        {
          v21 += 8;
          swift_retain();
          sub_2465BDD78();
          sub_2465BDD48();
          swift_release();
          swift_release();
          --v19;
        }
        while (v19);
      }
LABEL_18:
      swift_bridgeObjectRelease();
LABEL_19:

      sub_2465BDF88();
      sub_2465BDF78();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      *(unsigned char *)(v0[14] + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_performingAction) = 0;
      swift_release();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v22 = (uint64_t (*)(void))v0[1];
      return v22();
  }
}

uint64_t sub_2465B1908()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 424);
  uint64_t v3 = *(void *)(v1 + 416);
  return MEMORY[0x270FA2498](sub_2465B1A4C, v3, v2);
}

uint64_t sub_2465B1A4C()
{
  uint64_t v2 = v0[5];
  uint64_t v1 = v0[6];
  v0[58] = v2;
  v0[59] = v1;
  uint64_t v3 = (void *)v0[7];
  v0[60] = v3;
  if (!v1)
  {
    (*(void (**)(void, void, void))(v0[35] + 16))(v0[27], v0[37], v0[34]);
    uint64_t v9 = (unsigned int *)MEMORY[0x263F10B00];
    goto LABEL_10;
  }
  if (!v3)
  {
    swift_bridgeObjectRetain();
LABEL_8:
    uint64_t v23 = 0;
    unint64_t v8 = 0xF000000000000000;
    goto LABEL_9;
  }
  swift_bridgeObjectRetain();
  id v4 = v3;
  id v5 = objc_msgSend(v4, sel_externalizedContext);
  if (!v5)
  {

    goto LABEL_8;
  }
  id v6 = v5;
  uint64_t v23 = sub_2465BDD18();
  unint64_t v8 = v7;

LABEL_9:
  uint64_t v10 = v0[37];
  uint64_t v11 = v0[34];
  uint64_t v12 = v0[35];
  uint64_t v13 = v0[27];
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8EF48);
  uint64_t v15 = (void *)(v13 + *(int *)(v14 + 48));
  uint64_t v16 = (uint64_t *)(v13 + *(int *)(v14 + 64));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v13, v10, v11);
  *uint64_t v15 = v2;
  v15[1] = v1;
  *uint64_t v16 = v23;
  v16[1] = v8;
  uint64_t v9 = (unsigned int *)MEMORY[0x263F10B08];
LABEL_10:
  uint64_t v17 = v0[26];
  uint64_t v18 = v0[27];
  uint64_t v19 = v0[23];
  uint64_t v20 = v0[24];
  (*(void (**)(uint64_t, void, uint64_t))(v20 + 104))(v18, *v9, v19);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v17, v18, v19);
  sub_2465BDDF8();
  uint64_t v21 = (void *)swift_task_alloc();
  v0[61] = v21;
  *uint64_t v21 = v0;
  v21[1] = sub_2465B1C44;
  return MEMORY[0x270EF5A38]();
}

uint64_t sub_2465B1C44()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 496) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 424);
  uint64_t v4 = *(void *)(v2 + 416);
  if (v0) {
    id v5 = sub_2465B200C;
  }
  else {
    id v5 = sub_2465B1D80;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_2465B1D80()
{
  uint64_t v14 = (void *)v0[60];
  uint64_t v1 = v0[58];
  uint64_t v2 = v0[48];
  uint64_t v20 = v0[47];
  uint64_t v21 = v0[49];
  uint64_t v3 = v0[42];
  uint64_t v18 = v0[41];
  uint64_t v19 = v0[43];
  uint64_t v4 = v0[35];
  uint64_t v16 = v0[34];
  uint64_t v17 = v0[37];
  uint64_t v15 = v0[33];
  uint64_t v12 = v0[59];
  uint64_t v13 = v0[27];
  uint64_t v6 = v0[23];
  uint64_t v5 = v0[24];
  uint64_t v7 = v0[22];
  uint64_t v9 = v0[19];
  uint64_t v8 = v0[20];
  swift_release();
  sub_2465B6E30(v1, v12, v14);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v13, v6);
  sub_2465B6A6C(v15, type metadata accessor for InstallConfiguration);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v17, v16);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v19, v18);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v21, v20);
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(unsigned char *)(v0[14] + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_performingAction) = 0;
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_2465B200C()
{
  uint64_t v44 = v0;
  uint64_t v32 = (void *)v0[60];
  uint64_t v1 = v0[58];
  uint64_t v2 = v0[48];
  uint64_t v40 = v0[47];
  uint64_t v42 = v0[49];
  uint64_t v3 = v0[42];
  uint64_t v37 = v0[41];
  uint64_t v39 = v0[43];
  uint64_t v4 = v0[35];
  uint64_t v34 = v0[34];
  uint64_t v35 = v0[37];
  uint64_t v33 = v0[33];
  uint64_t v30 = v0[59];
  uint64_t v31 = v0[27];
  uint64_t v6 = v0[23];
  uint64_t v5 = v0[24];
  uint64_t v7 = v0[22];
  uint64_t v9 = v0[19];
  uint64_t v8 = v0[20];
  swift_release();
  sub_2465B6E30(v1, v30, v32);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v31, v6);
  sub_2465B6A6C(v33, type metadata accessor for InstallConfiguration);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v35, v34);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v39, v37);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v42, v40);
  uint64_t v10 = (void *)v0[62];
  sub_2465BDE88();
  id v11 = v10;
  id v12 = v10;
  uint64_t v13 = sub_2465BDEA8();
  os_log_type_t v14 = sub_2465BDFC8();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v41 = swift_slowAlloc();
    uint64_t v43 = v41;
    *(_DWORD *)uint64_t v15 = 136446210;
    sub_2465BDF88();
    sub_2465BDF78();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v16 = v0[17];
    uint64_t v36 = v0[16];
    uint64_t v38 = v0[18];
    swift_getErrorValue();
    uint64_t v17 = *(void *)(v0[3] - 8);
    swift_task_alloc();
    (*(void (**)(void))(v17 + 16))();
    uint64_t v18 = sub_2465BDEF8();
    unint64_t v20 = v19;
    swift_release();
    swift_task_dealloc();
    v0[11] = sub_2465B9C88(v18, v20, &v43);
    sub_2465BE008();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2465AA000, v13, v14, "[ActionButton] Error performing action: %{public}s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C530970](v41, -1, -1);
    MEMORY[0x24C530970](v15, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v38, v36);
  }
  else
  {
    uint64_t v22 = v0[17];
    uint64_t v21 = v0[18];
    uint64_t v23 = v0[16];

    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
  }
  sub_2465B6C38(v0[14] + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_action, v0[29], type metadata accessor for ActionButton.Action);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
    case 3u:
      goto LABEL_19;
    case 2u:
      sub_2465B6A6C(v0[29], type metadata accessor for ActionButton.Action);
      goto LABEL_9;
    default:
      swift_release();
      swift_bridgeObjectRelease();
LABEL_9:
      unint64_t v24 = v0[15];
      if (v24 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v25 = sub_2465BE0B8();
        if (!v25) {
          goto LABEL_18;
        }
      }
      else
      {
        uint64_t v25 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (!v25) {
          goto LABEL_18;
        }
      }
      sub_2465BDD88();
      if (v25 < 1)
      {
        __break(1u);
        JUMPOUT(0x2465B26B0);
      }
      if ((v24 & 0xC000000000000001) != 0)
      {
        uint64_t v26 = 0;
        do
        {
          MEMORY[0x24C530330](v26++, v0[15]);
          sub_2465BDD78();
          sub_2465BDD48();
          swift_unknownObjectRelease();
          swift_release();
        }
        while (v25 != v26);
      }
      else
      {
        uint64_t v27 = v0[15] + 32;
        do
        {
          v27 += 8;
          swift_retain();
          sub_2465BDD78();
          sub_2465BDD48();
          swift_release();
          swift_release();
          --v25;
        }
        while (v25);
      }
LABEL_18:
      swift_bridgeObjectRelease();
LABEL_19:

      sub_2465BDF88();
      sub_2465BDF78();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      *(unsigned char *)(v0[14] + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_performingAction) = 0;
      swift_release();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v28 = (uint64_t (*)(void))v0[1];
      return v28();
  }
}

uint64_t sub_2465B26C0()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 424);
  uint64_t v3 = *(void *)(v1 + 416);
  return MEMORY[0x270FA2498](sub_2465B27E0, v3, v2);
}

uint64_t sub_2465B27E0()
{
  uint64_t v2 = v0[8];
  uint64_t v1 = (void *)v0[9];
  v0[66] = v2;
  v0[67] = v1;
  if (!v2)
  {
    (*(void (**)(void, void, void))(v0[35] + 16))(v0[25], v0[36], v0[34]);
    uint64_t v8 = (unsigned int *)MEMORY[0x263F10B10];
    goto LABEL_10;
  }
  if (!v1)
  {
    swift_bridgeObjectRetain();
LABEL_8:
    unint64_t v7 = 0xF000000000000000;
    goto LABEL_9;
  }
  swift_bridgeObjectRetain();
  id v3 = v1;
  id v4 = objc_msgSend(v3, sel_externalizedContext);
  if (!v4)
  {

    uint64_t v1 = 0;
    goto LABEL_8;
  }
  uint64_t v5 = v4;
  uint64_t v1 = (void *)sub_2465BDD18();
  unint64_t v7 = v6;

LABEL_9:
  uint64_t v10 = v0[35];
  uint64_t v9 = v0[36];
  uint64_t v11 = v0[34];
  uint64_t v12 = v0[25];
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8EF40);
  uint64_t v14 = *(int *)(v13 + 48);
  uint64_t v15 = (void *)(v12 + *(int *)(v13 + 64));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v12, v9, v11);
  *(void *)(v12 + v14) = v2;
  *uint64_t v15 = v1;
  v15[1] = v7;
  uint64_t v8 = (unsigned int *)MEMORY[0x263F10B18];
LABEL_10:
  uint64_t v16 = v0[25];
  uint64_t v17 = v0[26];
  uint64_t v18 = v0[23];
  uint64_t v19 = v0[24];
  (*(void (**)(uint64_t, void, uint64_t))(v19 + 104))(v16, *v8, v18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v17, v16, v18);
  sub_2465BDDF8();
  unint64_t v20 = (void *)swift_task_alloc();
  v0[68] = v20;
  *unint64_t v20 = v0;
  v20[1] = sub_2465B29CC;
  return MEMORY[0x270EF5A38]();
}

uint64_t sub_2465B29CC()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 552) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 424);
  uint64_t v4 = *(void *)(v2 + 416);
  if (v0) {
    uint64_t v5 = sub_2465B2D88;
  }
  else {
    uint64_t v5 = sub_2465B2B08;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_2465B2B08()
{
  uint64_t v1 = (void *)v0[67];
  uint64_t v2 = v0[66];
  uint64_t v3 = v0[48];
  uint64_t v18 = v0[47];
  uint64_t v19 = v0[49];
  uint64_t v4 = v0[42];
  uint64_t v16 = v0[41];
  uint64_t v17 = v0[43];
  uint64_t v5 = v0[35];
  uint64_t v14 = v0[34];
  uint64_t v15 = v0[36];
  uint64_t v6 = v0[24];
  uint64_t v13 = v0[25];
  uint64_t v12 = v0[23];
  uint64_t v7 = v0[20];
  uint64_t v8 = v0[21];
  uint64_t v9 = v0[19];
  swift_release();
  sub_2465B6DF0(v2, v1);
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v13, v12);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v15, v14);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v17, v16);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v19, v18);
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(unsigned char *)(v0[14] + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_performingAction) = 0;
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_2465B2D88()
{
  uint64_t v42 = v0;
  uint64_t v1 = (void *)v0[67];
  uint64_t v2 = v0[66];
  uint64_t v3 = v0[48];
  uint64_t v38 = v0[47];
  uint64_t v40 = v0[49];
  uint64_t v4 = v0[42];
  uint64_t v35 = v0[41];
  uint64_t v37 = v0[43];
  uint64_t v5 = v0[35];
  uint64_t v32 = v0[34];
  uint64_t v33 = v0[36];
  uint64_t v6 = v0[24];
  uint64_t v30 = v0[23];
  uint64_t v31 = v0[25];
  uint64_t v7 = v0[20];
  uint64_t v8 = v0[21];
  uint64_t v9 = v0[19];
  swift_release();
  sub_2465B6DF0(v2, v1);
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v31, v30);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v33, v32);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v37, v35);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v40, v38);
  uint64_t v10 = (void *)v0[69];
  sub_2465BDE88();
  id v11 = v10;
  id v12 = v10;
  uint64_t v13 = sub_2465BDEA8();
  os_log_type_t v14 = sub_2465BDFC8();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    uint64_t v41 = v39;
    *(_DWORD *)uint64_t v15 = 136446210;
    sub_2465BDF88();
    sub_2465BDF78();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v16 = v0[17];
    uint64_t v34 = v0[16];
    uint64_t v36 = v0[18];
    swift_getErrorValue();
    uint64_t v17 = *(void *)(v0[3] - 8);
    swift_task_alloc();
    (*(void (**)(void))(v17 + 16))();
    uint64_t v18 = sub_2465BDEF8();
    unint64_t v20 = v19;
    swift_release();
    swift_task_dealloc();
    v0[11] = sub_2465B9C88(v18, v20, &v41);
    sub_2465BE008();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2465AA000, v13, v14, "[ActionButton] Error performing action: %{public}s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C530970](v39, -1, -1);
    MEMORY[0x24C530970](v15, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v36, v34);
  }
  else
  {
    uint64_t v22 = v0[17];
    uint64_t v21 = v0[18];
    uint64_t v23 = v0[16];

    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
  }
  sub_2465B6C38(v0[14] + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_action, v0[29], type metadata accessor for ActionButton.Action);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
    case 3u:
      goto LABEL_19;
    case 2u:
      sub_2465B6A6C(v0[29], type metadata accessor for ActionButton.Action);
      goto LABEL_9;
    default:
      swift_release();
      swift_bridgeObjectRelease();
LABEL_9:
      unint64_t v24 = v0[15];
      if (v24 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v25 = sub_2465BE0B8();
        if (!v25) {
          goto LABEL_18;
        }
      }
      else
      {
        uint64_t v25 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (!v25) {
          goto LABEL_18;
        }
      }
      sub_2465BDD88();
      if (v25 < 1)
      {
        __break(1u);
        JUMPOUT(0x2465B3418);
      }
      if ((v24 & 0xC000000000000001) != 0)
      {
        uint64_t v26 = 0;
        do
        {
          MEMORY[0x24C530330](v26++, v0[15]);
          sub_2465BDD78();
          sub_2465BDD48();
          swift_unknownObjectRelease();
          swift_release();
        }
        while (v25 != v26);
      }
      else
      {
        uint64_t v27 = v0[15] + 32;
        do
        {
          v27 += 8;
          swift_retain();
          sub_2465BDD78();
          sub_2465BDD48();
          swift_release();
          swift_release();
          --v25;
        }
        while (v25);
      }
LABEL_18:
      swift_bridgeObjectRelease();
LABEL_19:

      sub_2465BDF88();
      sub_2465BDF78();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      *(unsigned char *)(v0[14] + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_performingAction) = 0;
      swift_release();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v28 = (uint64_t (*)(void))v0[1];
      return v28();
  }
}

uint64_t sub_2465B3428(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2465BDFB8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2465BDFA8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_2465B6CA0(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2465BDF78();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

id ActionButton.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);

  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

void ActionButton.init(frame:)()
{
}

id ActionButton.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActionButton(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_2465B37FC()
{
  unint64_t result = qword_268F8EED0;
  if (!qword_268F8EED0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8EED0);
  }
  return result;
}

uint64_t sub_2465B3850@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2465AD8C4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2465B387C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  swift_bridgeObjectRetain();
  return sub_2465AD9CC(v1, v2);
}

uint64_t sub_2465B38BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2465ADD88();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2465B38E8(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  swift_bridgeObjectRetain();
  return sub_2465ADE90(v1, v2);
}

uint64_t sub_2465B3928@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2465AE24C(&v3);
  *a1 = v3;
  return result;
}

uint64_t sub_2465B3964(char *a1)
{
  char v2 = *a1;
  return sub_2465AE348(&v2);
}

void sub_2465B399C(uint64_t a1@<X8>)
{
  *(double *)a1 = sub_2465AE6D0();
  *(void *)(a1 + 8) = v2;
}

uint64_t sub_2465B39C8(double *a1)
{
  return sub_2465AE7D8(*a1, a1[1]);
}

void sub_2465B39F0(double *a1@<X8>)
{
  *a1 = sub_2465AEB7C();
}

uint64_t sub_2465B3A1C(double *a1)
{
  return sub_2465AEB90(*a1);
}

uint64_t sub_2465B3A48(double *a1)
{
  return sub_2465AEE8C(*a1);
}

void sub_2465B3A70(double *a1@<X8>)
{
  *a1 = sub_2465AF160();
}

uint64_t sub_2465B3A9C(double *a1)
{
  return sub_2465AF284(*a1);
}

id sub_2465B3AC4@<X0>(void *a1@<X8>)
{
  id result = sub_2465AF634();
  *a1 = result;
  return result;
}

uint64_t sub_2465B3AF0(id *a1)
{
  return sub_2465AF734(*a1);
}

uint64_t sub_2465B3BD4()
{
  return type metadata accessor for ActionButton(0);
}

uint64_t sub_2465B3BDC()
{
  uint64_t result = type metadata accessor for ActionButton.Action(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for ActionButton(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ActionButton);
}

uint64_t dispatch thunk of ActionButton.__allocating_init(action:)()
{
  return (*(uint64_t (**)(void))(v0 + 392))();
}

uint64_t dispatch thunk of ActionButton.label.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of ActionButton.label.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x198))();
}

uint64_t dispatch thunk of ActionButton.label.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of ActionButton.imageName.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of ActionButton.imageName.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of ActionButton.imageName.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of ActionButton.imagePlacement.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of ActionButton.imagePlacement.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of ActionButton.imagePlacement.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of ActionButton.size.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of ActionButton.size.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of ActionButton.size.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of ActionButton.fontSize.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1F0))();
}

uint64_t dispatch thunk of ActionButton.fontSize.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1F8))();
}

uint64_t dispatch thunk of ActionButton.fontSize.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x200))();
}

uint64_t dispatch thunk of ActionButton.cornerRadius.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x208))();
}

uint64_t dispatch thunk of ActionButton.cornerRadius.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x210))();
}

uint64_t dispatch thunk of ActionButton.cornerRadius.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x218))();
}

uint64_t dispatch thunk of ActionButton.borderWidth.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x220))();
}

uint64_t dispatch thunk of ActionButton.borderWidth.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x228))();
}

uint64_t dispatch thunk of ActionButton.borderWidth.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x230))();
}

uint64_t dispatch thunk of ActionButton.borderColor.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x238))();
}

uint64_t dispatch thunk of ActionButton.borderColor.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x240))();
}

uint64_t dispatch thunk of ActionButton.borderColor.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x248))();
}

void *initializeBufferWithCopyOfBuffer for ActionButton.Action(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (void *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v10 = a2[1];
      *a1 = *a2;
      a1[1] = v10;
      a1[2] = a2[2];
      id v11 = (int *)type metadata accessor for InstallMetadata(0);
      uint64_t v12 = v11[6];
      uint64_t v26 = (char *)a1 + v12;
      uint64_t v13 = (char *)a2 + v12;
      uint64_t v14 = sub_2465BDD08();
      uint64_t v15 = *(void *)(v14 - 8);
      uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
      swift_bridgeObjectRetain();
      v16(v26, v13, v14);
      *((unsigned char *)a1 + v11[7]) = *((unsigned char *)a2 + v11[7]);
      uint64_t v17 = v11[8];
      uint64_t v18 = (char *)a1 + v17;
      unint64_t v19 = (char *)a2 + v17;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))((char *)a2 + v17, 1, v14))
      {
        uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8EEE8);
        memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64));
      }
      else
      {
        v16(v18, v19, v14);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v18, 0, 1, v14);
      }
      uint64_t v21 = *(int *)(type metadata accessor for InstallConfiguration(0) + 20);
      uint64_t v22 = (void *)((char *)a1 + v21);
      uint64_t v23 = (void *)((char *)a2 + v21);
      uint64_t v24 = v23[1];
      *uint64_t v22 = *v23;
      v22[1] = v24;
      swift_retain();
      goto LABEL_11;
    }
    if (!EnumCaseMultiPayload)
    {
      uint64_t v8 = a2[2];
      *(_OWORD *)a1 = *(_OWORD *)a2;
      a1[2] = v8;
      swift_bridgeObjectRetain();
      swift_retain();
LABEL_11:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    memcpy(a1, a2, *(void *)(v6 + 64));
  }
  return a1;
}

uint64_t destroy for ActionButton.Action(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 2)
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = type metadata accessor for InstallMetadata(0);
    uint64_t v4 = a1 + *(int *)(v3 + 24);
    uint64_t v5 = sub_2465BDD08();
    uint64_t v6 = *(void *)(v5 - 8);
    uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    v7(v4, v5);
    uint64_t v8 = a1 + *(int *)(v3 + 32);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v8, 1, v5)) {
      v7(v8, v5);
    }
    type metadata accessor for InstallConfiguration(0);
  }
  else
  {
    if (result) {
      return result;
    }
    swift_bridgeObjectRelease();
  }

  return swift_release();
}

void *initializeWithCopy for ActionButton.Action(void *a1, void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    uint64_t v8 = a2[1];
    *a1 = *a2;
    a1[1] = v8;
    a1[2] = a2[2];
    uint64_t v9 = (int *)type metadata accessor for InstallMetadata(0);
    uint64_t v10 = v9[6];
    uint64_t v24 = (char *)a1 + v10;
    id v11 = (char *)a2 + v10;
    uint64_t v12 = sub_2465BDD08();
    uint64_t v13 = *(void *)(v12 - 8);
    uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
    swift_bridgeObjectRetain();
    v14(v24, v11, v12);
    *((unsigned char *)a1 + v9[7]) = *((unsigned char *)a2 + v9[7]);
    uint64_t v15 = v9[8];
    uint64_t v16 = (char *)a1 + v15;
    uint64_t v17 = (char *)a2 + v15;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))((char *)a2 + v15, 1, v12))
    {
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8EEE8);
      memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      v14(v16, v17, v12);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v16, 0, 1, v12);
    }
    uint64_t v19 = *(int *)(type metadata accessor for InstallConfiguration(0) + 20);
    uint64_t v20 = (void *)((char *)a1 + v19);
    uint64_t v21 = (void *)((char *)a2 + v19);
    uint64_t v22 = v21[1];
    *uint64_t v20 = *v21;
    v20[1] = v22;
    swift_retain();
    goto LABEL_9;
  }
  if (!EnumCaseMultiPayload)
  {
    uint64_t v7 = a2[2];
    *(_OWORD *)a1 = *(_OWORD *)a2;
    a1[2] = v7;
    swift_bridgeObjectRetain();
    swift_retain();
LABEL_9:
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  return a1;
}

void *assignWithCopy for ActionButton.Action(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_2465B6A6C((uint64_t)a1, type metadata accessor for ActionButton.Action);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      a1[2] = a2[2];
      uint64_t v9 = (int *)type metadata accessor for InstallMetadata(0);
      uint64_t v10 = v9[6];
      uint64_t v24 = (char *)a1 + v10;
      id v11 = (char *)a2 + v10;
      uint64_t v12 = sub_2465BDD08();
      uint64_t v13 = *(void *)(v12 - 8);
      uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
      swift_bridgeObjectRetain();
      v14(v24, v11, v12);
      *((unsigned char *)a1 + v9[7]) = *((unsigned char *)a2 + v9[7]);
      uint64_t v15 = v9[8];
      uint64_t v16 = (char *)a1 + v15;
      uint64_t v17 = (char *)a2 + v15;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))((char *)a2 + v15, 1, v12))
      {
        uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8EEE8);
        memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64));
      }
      else
      {
        v14(v16, v17, v12);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v16, 0, 1, v12);
      }
      uint64_t v19 = *(int *)(type metadata accessor for InstallConfiguration(0) + 20);
      uint64_t v20 = (void *)((char *)a1 + v19);
      uint64_t v21 = (void *)((char *)a2 + v19);
      uint64_t v22 = v21[1];
      *uint64_t v20 = *v21;
      v20[1] = v22;
      swift_retain();
      goto LABEL_10;
    }
    if (!EnumCaseMultiPayload)
    {
      *a1 = *a2;
      uint64_t v7 = a2[1];
      uint64_t v8 = a2[2];
      a1[1] = v7;
      a1[2] = v8;
      swift_bridgeObjectRetain();
      swift_retain();
LABEL_10:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *initializeWithTake for ActionButton.Action(void *a1, void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    a1[2] = a2[2];
    uint64_t v6 = (int *)type metadata accessor for InstallMetadata(0);
    uint64_t v7 = v6[6];
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_2465BDD08();
    uint64_t v11 = *(void *)(v10 - 8);
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
    v12(v8, v9, v10);
    *((unsigned char *)a1 + v6[7]) = *((unsigned char *)a2 + v6[7]);
    uint64_t v13 = v6[8];
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))((char *)a2 + v13, 1, v10))
    {
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8EEE8);
      memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      v12(v14, v15, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v14, 0, 1, v10);
    }
    uint64_t v17 = type metadata accessor for InstallConfiguration(0);
    *(_OWORD *)((char *)a1 + *(int *)(v17 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(v17 + 20));
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for ActionButton.Action(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_2465B6A6C((uint64_t)a1, type metadata accessor for ActionButton.Action);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
      a1[2] = a2[2];
      uint64_t v6 = (int *)type metadata accessor for InstallMetadata(0);
      uint64_t v7 = v6[6];
      uint64_t v8 = (char *)a1 + v7;
      uint64_t v9 = (char *)a2 + v7;
      uint64_t v10 = sub_2465BDD08();
      uint64_t v11 = *(void *)(v10 - 8);
      uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
      v12(v8, v9, v10);
      *((unsigned char *)a1 + v6[7]) = *((unsigned char *)a2 + v6[7]);
      uint64_t v13 = v6[8];
      uint64_t v14 = (char *)a1 + v13;
      uint64_t v15 = (char *)a2 + v13;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))((char *)a2 + v13, 1, v10))
      {
        uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8EEE8);
        memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
      }
      else
      {
        v12(v14, v15, v10);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v14, 0, 1, v10);
      }
      uint64_t v17 = type metadata accessor for InstallConfiguration(0);
      *(_OWORD *)((char *)a1 + *(int *)(v17 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(v17 + 20));
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for ActionButton.Action(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for ActionButton.Action(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_2465B4EAC()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_2465B4EBC()
{
  uint64_t result = type metadata accessor for InstallConfiguration(319);
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ActionButton.ButtonImagePlacement(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ActionButton.ButtonImagePlacement(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x2465B50C4);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t sub_2465B50EC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2465B50F4(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ActionButton.ButtonImagePlacement()
{
  return &type metadata for ActionButton.ButtonImagePlacement;
}

uint64_t sub_2465B510C(uint64_t a1, int *a2)
{
  unsigned int v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  unsigned int v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_2465B51E8;
  return v6(a1);
}

uint64_t sub_2465B51E8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2465B52E0()
{
  unint64_t v1 = &v0[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__label];
  *unint64_t v1 = 32;
  v1[1] = 0xE100000000000000;
  uint64_t v2 = &v0[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__imageName];
  *uint64_t v2 = 0;
  v2[1] = 0;
  uint64_t v3 = OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__backgroundColor;
  uint64_t v4 = self;
  *(void *)&v0[v3] = objc_msgSend(v4, sel_whiteColor);
  *(void *)&v0[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__borderWidth] = 0;
  uint64_t v5 = OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__borderColor;
  *(void *)&v0[v5] = objc_msgSend(v4, sel_clearColor);
  v0[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__imagePlacement] = 1;
  unsigned int v6 = &v0[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__size];
  void *v6 = 0;
  v6[1] = 0;
  *(void *)&v0[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__fontSize] = 0x4028000000000000;
  uint64_t v7 = OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_slotView;
  *(void *)&v0[v7] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F830E0]), sel_init);
  v0[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_performingAction] = 0;

  sub_2465BDF98();
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  uint64_t result = sub_2465BE0A8();
  __break(1u);
  return result;
}

uint64_t sub_2465B5490(void *a1)
{
  id v84 = a1;
  uint64_t v1 = sub_2465BDEB8();
  uint64_t v2 = *(void *)(v1 - 8);
  unint64_t v86 = v1;
  uint64_t v87 = v2;
  uint64_t v4 = MEMORY[0x270FA5388](v1, v3);
  v77[1] = (char *)v77 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4, v6);
  v77[2] = (char *)v77 - v8;
  uint64_t v10 = MEMORY[0x270FA5388](v7, v9);
  uint64_t v12 = (char *)v77 - v11;
  MEMORY[0x270FA5388](v10, v13);
  uint64_t v15 = (char *)v77 - v14;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8EF00);
  MEMORY[0x270FA5388](v16 - 8, v17);
  uint64_t v82 = (uint64_t)v77 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for InstallConfiguration(0);
  MEMORY[0x270FA5388](v19 - 8, v20);
  uint64_t v78 = (uint64_t)v77 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = type metadata accessor for InstallMetadata(0);
  v77[0] = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22, v23);
  uint64_t v25 = (char *)v77 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = type metadata accessor for ActionButton.Action(0);
  MEMORY[0x270FA5388](v26, v27);
  uint64_t v29 = (void *)((char *)v77 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v80 = sub_2465BDE18();
  uint64_t v81 = *(void *)(v80 - 8);
  uint64_t v30 = *(void *)(v81 + 64);
  uint64_t v32 = MEMORY[0x270FA5388](v80, v31);
  v79 = (char *)v77 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v32, v33);
  v83 = (void *)((char *)v77 - v34);
  uint64_t v35 = sub_2465BDF98();
  uint64_t v88 = sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_2465BDF88();
  uint64_t v85 = v35;
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v36 = OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_performingAction;
  char v37 = v89[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_performingAction];
  swift_release();
  if (v37)
  {
    sub_2465BDE88();
    uint64_t v38 = sub_2465BDEA8();
    os_log_type_t v39 = sub_2465BDFC8();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v40 = 0;
      _os_log_impl(&dword_2465AA000, v38, v39, "[ActionButton] Ignoring press for ongoing action", v40, 2u);
      MEMORY[0x24C530970](v40, -1, -1);
    }

    (*(void (**)(char *, unint64_t))(v87 + 8))(v12, v86);
  }
  else
  {
    id v41 = objc_msgSend(v84, sel__authenticationMessage);
    if (v41)
    {
      uint64_t v42 = v41;
      sub_2465BDF88();
      sub_2465BDF78();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v43 = v89;
      v89[v36] = 1;
      swift_release();
      uint64_t v91 = MEMORY[0x263F8EE78];
      sub_2465B6C38((uint64_t)&v43[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_action], (uint64_t)v29, type metadata accessor for ActionButton.Action);
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
          id v49 = v42;
          v63 = v83;
          uint64_t *v83 = *v29;
          v50 = (unsigned int *)MEMORY[0x263F10B30];
          goto LABEL_20;
        case 2u:
          sub_2465B69B0((uint64_t)v29, v78);
          sub_2465BDCF8();
          swift_allocObject();
          sub_2465BDCE8();
          sub_2465B6A14();
          uint64_t v71 = sub_2465BDCD8();
          unint64_t v73 = v72;
          id v49 = v42;
          swift_release();
          v74 = v83;
          uint64_t *v83 = v71;
          v74[1] = v73;
          uint64_t v75 = v81;
          uint64_t v64 = v80;
          (*(void (**)(void))(v81 + 104))();
          sub_2465BDD88();
          sub_2465B6ACC(v71, v73);
          sub_2465BDD78();
          sub_2465BDD58();
          swift_release();
          sub_2465BDD78();
          sub_2465BDD68();
          uint64_t v76 = swift_release();
          MEMORY[0x24C530200](v76);
          if (*(void *)((v91 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v91 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_2465BDF58();
          }
          sub_2465BDF68();
          sub_2465BDF48();
          sub_2465B6B24(v71, v73);
          sub_2465B6A6C(v78, type metadata accessor for InstallConfiguration);
          v63 = v83;
          break;
        case 3u:
          id v49 = v42;
          v63 = v83;
          uint64_t *v83 = *v29;
          v50 = (unsigned int *)MEMORY[0x263F10B38];
LABEL_20:
          uint64_t v75 = v81;
          uint64_t v64 = v80;
          (*(void (**)(uint64_t *, void, uint64_t))(v81 + 104))(v63, *v50, v80);
          break;
        default:
          id v84 = v42;
          uint64_t v44 = *v29;
          uint64_t v45 = v29[2];
          sub_2465BDCF8();
          swift_allocObject();
          sub_2465BDCE8();
          uint64_t v90 = v44;
          swift_bridgeObjectRetain();
          __swift_instantiateConcreteTypeFromMangledName(&qword_268F8EF20);
          sub_2465B6B7C();
          uint64_t v60 = sub_2465BDCD8();
          unint64_t v62 = v61;
          uint64_t v78 = v45;
          swift_release();
          swift_bridgeObjectRelease();
          v63 = v83;
          uint64_t *v83 = v60;
          v63[1] = v62;
          uint64_t v64 = v80;
          (*(void (**)(uint64_t *, void, uint64_t))(v81 + 104))(v63, *MEMORY[0x263F10B28], v80);
          unint64_t v65 = v62;
          uint64_t v66 = *(void *)(v44 + 16);
          if (v66)
          {
            sub_2465BDD88();
            uint64_t v67 = v77[0];
            uint64_t v68 = v44
                + ((*(unsigned __int8 *)(v77[0] + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v77[0] + 80));
            swift_bridgeObjectRetain();
            unint64_t v86 = v65;
            uint64_t v87 = v60;
            sub_2465B6ACC(v60, v65);
            uint64_t v69 = *(void *)(v67 + 72);
            do
            {
              sub_2465B6C38(v68, (uint64_t)v25, type metadata accessor for InstallMetadata);
              sub_2465BDD78();
              sub_2465BDD58();
              swift_release();
              sub_2465BDD78();
              sub_2465BDD68();
              uint64_t v70 = swift_release();
              MEMORY[0x24C530200](v70);
              if (*(void *)((v91 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v91 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                sub_2465BDF58();
              }
              sub_2465BDF68();
              sub_2465BDF48();
              sub_2465B6A6C((uint64_t)v25, type metadata accessor for InstallMetadata);
              v68 += v69;
              --v66;
            }
            while (v66);
            swift_bridgeObjectRelease();
            sub_2465B6B24(v87, v86);
            swift_bridgeObjectRelease();
            swift_release();
            v63 = v83;
            id v49 = v84;
            uint64_t v64 = v80;
            uint64_t v75 = v81;
          }
          else
          {
            swift_bridgeObjectRelease();
            swift_release();
            id v49 = v84;
            uint64_t v75 = v81;
          }
          break;
      }
      uint64_t v51 = sub_2465BDFB8();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56))(v82, 1, 1, v51);
      v52 = v79;
      (*(void (**)(char *, uint64_t *, uint64_t))(v75 + 16))(v79, v63, v64);
      id v53 = v49;
      v89 = v89;
      uint64_t v54 = sub_2465BDF88();
      uint64_t v87 = v91;
      unint64_t v55 = (*(unsigned __int8 *)(v75 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v75 + 80);
      unint64_t v56 = (v30 + v55 + 7) & 0xFFFFFFFFFFFFFFF8;
      unint64_t v57 = (v56 + 15) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v58 = swift_allocObject();
      *(void *)(v58 + 16) = v54;
      *(void *)(v58 + 24) = MEMORY[0x263F8F500];
      (*(void (**)(unint64_t, char *, uint64_t))(v75 + 32))(v58 + v55, v52, v64);
      *(void *)(v58 + v56) = v53;
      *(void *)(v58 + v57) = v89;
      *(void *)(v58 + ((v57 + 15) & 0xFFFFFFFFFFFFFFF8)) = v87;
      sub_2465B3428(v82, (uint64_t)&unk_268F8EF10, v58);
      swift_release();

      (*(void (**)(uint64_t *, uint64_t))(v75 + 8))(v83, v64);
    }
    else
    {
      sub_2465BDE88();
      v46 = sub_2465BDEA8();
      os_log_type_t v47 = sub_2465BDFC8();
      if (os_log_type_enabled(v46, v47))
      {
        v48 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v48 = 0;
        _os_log_impl(&dword_2465AA000, v46, v47, "[ActionButton] Unable to authenticate button press", v48, 2u);
        MEMORY[0x24C530970](v48, -1, -1);
      }

      (*(void (**)(char *, unint64_t))(v87 + 8))(v15, v86);
    }
  }
  return swift_release();
}

uint64_t sub_2465B6660()
{
  uint64_t v1 = sub_2465BDE18();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, ((v7 + 15) & 0xFFFFFFFFFFFFFFF8) + 8, v5);
}

uint64_t sub_2465B6770(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_2465BDE18() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = *(void *)(v1 + 16);
  uint64_t v9 = *(void *)(v1 + 24);
  uint64_t v10 = v1 + v5;
  uint64_t v11 = *(void *)(v1 + v6);
  uint64_t v12 = *(void *)(v1 + v7);
  uint64_t v13 = *(void *)(v1 + ((v7 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v14;
  *uint64_t v14 = v2;
  v14[1] = sub_2465B68BC;
  return sub_2465B0678(a1, v8, v9, v10, v11, v12, v13);
}

uint64_t sub_2465B68BC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2465B69B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for InstallConfiguration(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_2465B6A14()
{
  unint64_t result = qword_268F8EF18;
  if (!qword_268F8EF18)
  {
    type metadata accessor for InstallMetadata(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8EF18);
  }
  return result;
}

uint64_t sub_2465B6A6C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2465B6ACC(uint64_t a1, unint64_t a2)
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

uint64_t sub_2465B6B24(uint64_t a1, unint64_t a2)
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

unint64_t sub_2465B6B7C()
{
  unint64_t result = qword_268F8EF28;
  if (!qword_268F8EF28)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F8EF20);
    sub_2465B6A14();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8EF28);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_2465B6C38(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2465B6CA0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8EF00);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2465B6D00()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2465B6D38(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_2465B68BC;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268F8EF30 + dword_268F8EF30);
  return v6(a1, v4);
}

void sub_2465B6DF0(uint64_t a1, void *a2)
{
  if (a1)
  {
    swift_bridgeObjectRelease();
  }
}

void sub_2465B6E30(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
  }
}

unint64_t sub_2465B6E74()
{
  unint64_t result = qword_268F8EF58;
  if (!qword_268F8EF58)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268F8EF58);
  }
  return result;
}

uint64_t sub_2465B6EB4()
{
  return 1;
}

uint64_t sub_2465B6EC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2465B8EB4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_2465B6EF4()
{
  return 0;
}

void sub_2465B6F00(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_2465B6F0C(uint64_t a1)
{
  unint64_t v2 = sub_2465B7768();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2465B6F48(uint64_t a1)
{
  unint64_t v2 = sub_2465B7768();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2465B6F84(char a1)
{
  return *(void *)&aProductpsearch[8 * a1];
}

uint64_t sub_2465B6FA4(char a1)
{
  if (a1) {
    return 0x726556656C707061;
  }
  else {
    return 0x657449656C707061;
  }
}

uint64_t sub_2465B6FF0()
{
  return sub_2465B6F84(*v0);
}

uint64_t sub_2465B6FF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2465B8F54(a1, a2);
  *a3 = result;
  return result;
}

void sub_2465B7020(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_2465B702C(uint64_t a1)
{
  unint64_t v2 = sub_2465B7714();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2465B7068(uint64_t a1)
{
  unint64_t v2 = sub_2465B7714();

  return MEMORY[0x270FA00B8](a1, v2);
}

BOOL sub_2465B70A4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2465B70BC()
{
  return sub_2465B6FA4(*v0);
}

uint64_t sub_2465B70C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2465B90DC(a1, a2);
  *a3 = result;
  return result;
}

void sub_2465B70EC(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_2465B70F8(uint64_t a1)
{
  unint64_t v2 = sub_2465B7810();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2465B7134(uint64_t a1)
{
  unint64_t v2 = sub_2465B7810();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2465B7170()
{
  return sub_2465BE228();
}

uint64_t sub_2465B71B4()
{
  return sub_2465BE218();
}

uint64_t sub_2465B71DC()
{
  return sub_2465BE228();
}

uint64_t sub_2465B7220@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2465B91F0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_2465B724C(uint64_t a1)
{
  unint64_t v2 = sub_2465B77BC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2465B7288(uint64_t a1)
{
  unint64_t v2 = sub_2465B77BC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t MarketplaceDisplayOption.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8EF60);
  uint64_t v32 = *(void *)(v3 - 8);
  uint64_t v33 = v3;
  MEMORY[0x270FA5388](v3, v4);
  unint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8EF68);
  uint64_t v29 = *(void *)(v7 - 8);
  uint64_t v30 = v7;
  MEMORY[0x270FA5388](v7, v8);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8EF70);
  uint64_t v28 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388](v31, v11);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8EF78);
  uint64_t v37 = *(void *)(v14 - 8);
  uint64_t v38 = v14;
  MEMORY[0x270FA5388](v14, v15);
  uint64_t v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = *v1;
  uint64_t v34 = v1[1];
  uint64_t v35 = v18;
  unsigned int v19 = *((unsigned __int8 *)v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2465B7714();
  sub_2465BE248();
  if (v19 >> 6)
  {
    if (v19 >> 6 == 1)
    {
      char v42 = 1;
      sub_2465B77BC();
      uint64_t v20 = v38;
      sub_2465BE168();
      uint64_t v21 = v30;
      sub_2465BE198();
      (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v21);
    }
    else
    {
      char v43 = 2;
      sub_2465B7768();
      uint64_t v20 = v38;
      sub_2465BE168();
      uint64_t v25 = v33;
      sub_2465BE198();
      (*(void (**)(char *, uint64_t))(v32 + 8))(v6, v25);
    }
  }
  else
  {
    uint64_t v22 = v28;
    char v41 = 0;
    sub_2465B7810();
    uint64_t v20 = v38;
    sub_2465BE168();
    char v40 = 0;
    uint64_t v23 = v36;
    uint64_t v24 = v31;
    sub_2465BE1C8();
    if (!v23)
    {
      char v39 = 1;
      sub_2465BE188();
    }
    (*(void (**)(char *, uint64_t))(v22 + 8))(v13, v24);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v17, v20);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_2465B7714()
{
  unint64_t result = qword_268F8EF80;
  if (!qword_268F8EF80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8EF80);
  }
  return result;
}

unint64_t sub_2465B7768()
{
  unint64_t result = qword_268F8EF88;
  if (!qword_268F8EF88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8EF88);
  }
  return result;
}

unint64_t sub_2465B77BC()
{
  unint64_t result = qword_268F8EF90;
  if (!qword_268F8EF90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8EF90);
  }
  return result;
}

unint64_t sub_2465B7810()
{
  unint64_t result = qword_268F8EF98;
  if (!qword_268F8EF98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8EF98);
  }
  return result;
}

uint64_t MarketplaceDisplayOption.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v49 = a2;
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8EFA0);
  uint64_t v52 = *(void *)(v55 - 8);
  MEMORY[0x270FA5388](v55, v3);
  uint64_t v54 = (char *)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8EFA8);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v50 = v5;
  uint64_t v51 = v6;
  MEMORY[0x270FA5388](v5, v7);
  uint64_t v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8EFB0);
  uint64_t v53 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10, v11);
  uint64_t v13 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8EFB8);
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14, v16);
  uint64_t v18 = (char *)&v46 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = a1[3];
  unint64_t v56 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v19);
  sub_2465B7714();
  uint64_t v20 = v57;
  sub_2465BE238();
  if (v20) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v56);
  }
  uint64_t v21 = v9;
  uint64_t v48 = v10;
  uint64_t v22 = v54;
  uint64_t v23 = v55;
  uint64_t v57 = v15;
  uint64_t v24 = sub_2465BE158();
  if (*(void *)(v24 + 16) != 1)
  {
    uint64_t v27 = sub_2465BE078();
    swift_allocError();
    uint64_t v29 = v28;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F8EFC0);
    *uint64_t v29 = &type metadata for MarketplaceDisplayOption;
    sub_2465BE0E8();
    sub_2465BE068();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v27 - 8) + 104))(v29, *MEMORY[0x263F8DCB0], v27);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v57 + 8))(v18, v14);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v56);
  }
  if (*(unsigned char *)(v24 + 32))
  {
    if (*(unsigned char *)(v24 + 32) == 1)
    {
      char v61 = 1;
      sub_2465B77BC();
      sub_2465BE0D8();
      uint64_t v25 = v50;
      uint64_t v26 = sub_2465BE118();
      uint64_t v35 = v34;
      uint64_t v47 = 0;
      uint64_t v36 = v26;
      (*(void (**)(char *, uint64_t))(v51 + 8))(v21, v25);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v57 + 8))(v18, v14);
      uint64_t v37 = v36;
      char v38 = 64;
    }
    else
    {
      char v62 = 2;
      sub_2465B7768();
      sub_2465BE0D8();
      uint64_t v32 = sub_2465BE118();
      uint64_t v33 = v22;
      uint64_t v47 = 0;
      uint64_t v35 = v41;
      uint64_t v42 = v32;
      (*(void (**)(char *, uint64_t))(v52 + 8))(v33, v23);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v57 + 8))(v18, v14);
      uint64_t v37 = v42;
      char v38 = 0x80;
    }
    uint64_t v45 = (uint64_t)v56;
  }
  else
  {
    char v60 = 0;
    sub_2465B7810();
    sub_2465BE0D8();
    char v59 = 0;
    uint64_t v31 = v48;
    uint64_t v55 = sub_2465BE148();
    char v58 = 1;
    uint64_t v39 = sub_2465BE108();
    uint64_t v40 = v57;
    uint64_t v35 = v39;
    uint64_t v47 = 0;
    char v38 = v44 & 1;
    (*(void (**)(char *, uint64_t))(v53 + 8))(v13, v31);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v18, v14);
    uint64_t v37 = v55;
    uint64_t v45 = (uint64_t)v56;
  }
  char v43 = v49;
  *id v49 = v37;
  v43[1] = v35;
  *((unsigned char *)v43 + 16) = v38;
  return __swift_destroy_boxed_opaque_existential_1(v45);
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_2465B7F5C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return MarketplaceDisplayOption.init(from:)(a1, a2);
}

uint64_t sub_2465B7F74(void *a1)
{
  return MarketplaceDisplayOption.encode(to:)(a1);
}

uint64_t UISceneConnectionOptions.marketplaceDisplayOption.getter()
{
  sub_2465BDF98();
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_2465BDD38();
  sub_2465B8060();
  sub_2465BDFD8();

  return swift_release();
}

unint64_t sub_2465B8060()
{
  unint64_t result = qword_268F8EFC8;
  if (!qword_268F8EFC8)
  {
    sub_2465BDD38();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8EFC8);
  }
  return result;
}

uint64_t (*(*static MarketplaceSceneConnectionOptionDefinition.sceneDelegateMethod.getter())(uint64_t a1))()
{
  return sub_2465B815C;
}

uint64_t sub_2465B80D4(uint64_t a1, uint64_t *a2, void *a3)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  char v6 = *((unsigned char *)a2 + 16);
  uint64_t v7 = a3[3];
  uint64_t v8 = a3[4];
  __swift_project_boxed_opaque_existential_1(a3, v7);
  v10[0] = v4;
  v10[1] = v5;
  char v11 = v6;
  return (*(uint64_t (**)(uint64_t, void *, uint64_t, uint64_t))(v8 + 8))(a1, v10, v7, v8);
}

uint64_t (*sub_2465B815C(uint64_t a1))()
{
  sub_2465B92F4(a1, (uint64_t)v3);
  uint64_t v1 = swift_allocObject();
  sub_2465B9390(v3, v1 + 16);
  return sub_2465B93E8;
}

unint64_t sub_2465B81C8()
{
  unint64_t result = qword_268F8EFD0;
  if (!qword_268F8EFD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8EFD0);
  }
  return result;
}

unint64_t sub_2465B8220()
{
  unint64_t result = qword_268F8EFD8;
  if (!qword_268F8EFD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8EFD8);
  }
  return result;
}

uint64_t (*sub_2465B8274())@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_2465B8290;
}

uint64_t sub_2465B8290@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  sub_2465B92F4(a1, (uint64_t)v5);
  uint64_t v3 = swift_allocObject();
  sub_2465B9390(v5, v3 + 16);
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = sub_2465B93A8;
  *(void *)(result + 24) = v3;
  *a2 = sub_2465B93B0;
  a2[1] = result;
  return result;
}

uint64_t sub_2465B8320(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  swift_retain();
  sub_2465BDED8();

  return swift_release();
}

uint64_t sub_2465B83D4(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if ((a3 >> 6) - 1 <= 1) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for MarketplaceDisplayOption(uint64_t a1)
{
  return sub_2465B8400(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_2465B8400(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if ((a3 >> 6) - 1 <= 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s21_MarketplaceKit_UIKit24MarketplaceDisplayOptionOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_2465B83D4(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for MarketplaceDisplayOption(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_2465B83D4(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_2465B8400(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for MarketplaceDisplayOption(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_2465B8400(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for MarketplaceDisplayOption(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7E && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 126);
  }
  unsigned int v3 = ((*(unsigned __int8 *)(a1 + 16) >> 6) & 0xFFFFFF83 | (4 * ((*(unsigned __int8 *)(a1 + 16) >> 1) & 0x1F))) ^ 0x7F;
  if (v3 >= 0x7D) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for MarketplaceDisplayOption(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7D)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 126;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7E) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7E) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2)
    {
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = 0;
      *(unsigned char *)(result + 16) = 2 * (((-a2 >> 2) & 0x1F) - 32 * a2);
    }
  }
  return result;
}

uint64_t sub_2465B85C4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16) >> 6;
}

uint64_t sub_2465B85D0(uint64_t result)
{
  *(unsigned char *)(result + 16) &= 0x3Fu;
  return result;
}

uint64_t sub_2465B85E0(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = *(unsigned char *)(result + 16) & 1 | (a2 << 6);
  return result;
}

ValueMetadata *type metadata accessor for MarketplaceDisplayOption()
{
  return &type metadata for MarketplaceDisplayOption;
}

uint64_t dispatch thunk of MarketplaceSceneDelegate.scene(_:askedToDisplay:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t getEnumTagSinglePayload for MarketplaceDisplayOption.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for MarketplaceDisplayOption.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 2;
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
        JUMPOUT(0x2465B8774);
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
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MarketplaceDisplayOption.CodingKeys()
{
  return &type metadata for MarketplaceDisplayOption.CodingKeys;
}

uint64_t getEnumTagSinglePayload for MarketplaceDisplayOption.ProductPageCodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for MarketplaceDisplayOption.ProductPageCodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x2465B8908);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_2465B8930(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for MarketplaceDisplayOption.ProductPageCodingKeys()
{
  return &type metadata for MarketplaceDisplayOption.ProductPageCodingKeys;
}

uint64_t sub_2465B8958()
{
  return 0;
}

ValueMetadata *type metadata accessor for MarketplaceDisplayOption.SearchResultsCodingKeys()
{
  return &type metadata for MarketplaceDisplayOption.SearchResultsCodingKeys;
}

uint64_t _s21_MarketplaceKit_UIKit24MarketplaceDisplayOptionO23SearchResultsCodingKeysOwet_0(unsigned int *a1, int a2)
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

unsigned char *_s21_MarketplaceKit_UIKit24MarketplaceDisplayOptionO23SearchResultsCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x2465B8A5CLL);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for MarketplaceDisplayOption.AuthenticationCodingKeys()
{
  return &type metadata for MarketplaceDisplayOption.AuthenticationCodingKeys;
}

unint64_t sub_2465B8A98()
{
  unint64_t result = qword_268F8EFE0;
  if (!qword_268F8EFE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8EFE0);
  }
  return result;
}

unint64_t sub_2465B8AF0()
{
  unint64_t result = qword_268F8EFE8;
  if (!qword_268F8EFE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8EFE8);
  }
  return result;
}

unint64_t sub_2465B8B48()
{
  unint64_t result = qword_268F8EFF0;
  if (!qword_268F8EFF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8EFF0);
  }
  return result;
}

unint64_t sub_2465B8BA0()
{
  unint64_t result = qword_268F8EFF8;
  if (!qword_268F8EFF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8EFF8);
  }
  return result;
}

unint64_t sub_2465B8BF8()
{
  unint64_t result = qword_268F8F000;
  if (!qword_268F8F000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8F000);
  }
  return result;
}

unint64_t sub_2465B8C50()
{
  unint64_t result = qword_268F8F008;
  if (!qword_268F8F008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8F008);
  }
  return result;
}

unint64_t sub_2465B8CA8()
{
  unint64_t result = qword_268F8F010;
  if (!qword_268F8F010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8F010);
  }
  return result;
}

unint64_t sub_2465B8D00()
{
  unint64_t result = qword_268F8F018;
  if (!qword_268F8F018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8F018);
  }
  return result;
}

unint64_t sub_2465B8D58()
{
  unint64_t result = qword_268F8F020;
  if (!qword_268F8F020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8F020);
  }
  return result;
}

unint64_t sub_2465B8DB0()
{
  unint64_t result = qword_268F8F028;
  if (!qword_268F8F028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8F028);
  }
  return result;
}

unint64_t sub_2465B8E08()
{
  unint64_t result = qword_268F8F030;
  if (!qword_268F8F030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8F030);
  }
  return result;
}

unint64_t sub_2465B8E60()
{
  unint64_t result = qword_268F8F038;
  if (!qword_268F8F038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8F038);
  }
  return result;
}

uint64_t sub_2465B8EB4(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x746E756F636361 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_2465BE1E8();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_2465B8F3C()
{
  return 0x746E756F636361;
}

uint64_t sub_2465B8F54(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x50746375646F7270 && a2 == 0xEB00000000656761;
  if (v3 || (sub_2465BE1E8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6552686372616573 && a2 == 0xED000073746C7573 || (sub_2465BE1E8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x69746E6568747561 && a2 == 0xEE006E6F69746163)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_2465BE1E8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_2465B90DC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x657449656C707061 && a2 == 0xEB0000000044496DLL;
  if (v3 || (sub_2465BE1E8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x726556656C707061 && a2 == 0xEE0044496E6F6973)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_2465BE1E8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_2465B91F0(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x7972657571 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_2465BE1E8();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_2465B9270()
{
  return 0x7972657571;
}

uint64_t sub_2465B9284()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2465B92BC(uint64_t a1)
{
  int v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  uint64_t v4 = a1;
  return v2(&v4);
}

uint64_t sub_2465B92F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2465B9358()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_2465B9390(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_2465B93A8(uint64_t a1, uint64_t *a2)
{
  return sub_2465B80D4(a1, a2, (void *)(v2 + 16));
}

uint64_t sub_2465B93B0(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

id sub_2465B94A8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SecureButtonContentDelegate();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SecureButtonContentDelegate()
{
  return self;
}

void sub_2465B9510(uint64_t a1, void *a2)
{
  long long v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_2465B9578()
{
  if (qword_268F8EDF8 != -1) {
    swift_once();
  }
  uint64_t v0 = *(void **)(qword_268F8F1A8 + 16);
  aBlock[4] = sub_2465B9964;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2465B9510;
  aBlock[3] = &block_descriptor;
  uint64_t v1 = _Block_copy(aBlock);
  id v2 = objc_msgSend(v0, sel_synchronousRemoteObjectProxyWithErrorHandler_, v1);
  _Block_release(v1);
  sub_2465BE028();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268F8F110);
  swift_dynamicCast();
  return v4;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

id sub_2465B96C0()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for XPCClient()), sel_init);
  qword_268F8F1A0 = (uint64_t)result;
  return result;
}

id sub_2465B97A8()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for XPCClient()
{
  return self;
}

id sub_2465B9808()
{
  type metadata accessor for RenderingService();
  uint64_t v0 = swift_allocObject();
  id v1 = objc_allocWithZone(MEMORY[0x263F08D68]);
  objc_super v2 = (void *)sub_2465BDEE8();
  id v3 = objc_msgSend(v1, sel_initWithMachServiceName_options_, v2, 0);

  id v4 = objc_msgSend(self, sel_interfaceWithProtocol_, &unk_26FAD4390);
  objc_msgSend(v3, sel_setExportedInterface_, v4);

  if (qword_268F8EDF0 != -1) {
    swift_once();
  }
  objc_msgSend(v3, sel_setExportedObject_, qword_268F8F1A0);
  id v5 = (id)UISSlotMachineInterface();
  objc_msgSend(v3, sel_setRemoteObjectInterface_, v5);

  id result = objc_msgSend(v3, sel_resume);
  *(void *)(v0 + 16) = v3;
  qword_268F8F1A8 = v0;
  return result;
}

uint64_t sub_2465B9964(void *a1)
{
  uint64_t v2 = sub_2465BDEB8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  char v6 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2465BDE98();
  id v7 = a1;
  id v8 = a1;
  uint64_t v9 = sub_2465BDEA8();
  os_log_type_t v10 = sub_2465BDFC8();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v22 = v2;
    uint64_t v12 = (uint8_t *)v11;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v25 = v21;
    *(_DWORD *)uint64_t v12 = 136315138;
    v20[1] = v12 + 4;
    uint64_t ErrorValue = swift_getErrorValue();
    MEMORY[0x270FA5388](ErrorValue, v24);
    (*(void (**)(char *))(v15 + 16))((char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
    uint64_t v16 = sub_2465BDEF8();
    uint64_t v23 = sub_2465B9C88(v16, v17, &v25);
    sub_2465BE008();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2465AA000, v9, v10, "Error fetching remote proxy: %s", v12, 0xCu);
    uint64_t v18 = v21;
    swift_arrayDestroy();
    MEMORY[0x24C530970](v18, -1, -1);
    MEMORY[0x24C530970](v12, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v22);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
}

uint64_t sub_2465B9C2C()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for RenderingService()
{
  return self;
}

uint64_t sub_2465B9C88(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2465B9D5C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2465BA2E0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_2465BA2E0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_2465B9D5C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2465BE018();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_2465B9F18(a5, a6);
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
  uint64_t v8 = sub_2465BE088();
  if (!v8)
  {
    sub_2465BE098();
    __break(1u);
LABEL_17:
    uint64_t result = sub_2465BE0C8();
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

uint64_t sub_2465B9F18(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2465B9FB0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2465BA190(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2465BA190(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2465B9FB0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_2465BA128(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_2465BE048();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_2465BE098();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2465BDF18();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_2465BE0C8();
    __break(1u);
LABEL_14:
    uint64_t result = sub_2465BE098();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_2465BA128(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8F120);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2465BA190(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F8F120);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
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
  uint64_t result = sub_2465BE0C8();
  __break(1u);
  return result;
}

uint64_t sub_2465BA2E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t InstallConfiguration.install.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2465BA34C(v1, a1);
}

uint64_t sub_2465BA34C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for InstallMetadata(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for InstallMetadata(uint64_t a1)
{
  return sub_2465ACCF0(a1, (uint64_t *)&unk_268F8F160);
}

uint64_t InstallConfiguration.confirmInstall.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for InstallConfiguration(0) + 20));
  swift_retain();
  return v1;
}

uint64_t type metadata accessor for InstallConfiguration(uint64_t a1)
{
  return sub_2465ACCF0(a1, (uint64_t *)&unk_268F8F150);
}

uint64_t InstallConfiguration.init(install:confirmInstall:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_2465BA47C(a1, a4);
  uint64_t result = type metadata accessor for InstallConfiguration(0);
  int64_t v8 = (void *)(a4 + *(int *)(result + 20));
  void *v8 = a2;
  v8[1] = a3;
  return result;
}

uint64_t sub_2465BA47C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for InstallMetadata(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t InstallMetadata.account.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InstallMetadata.appleItemID.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t InstallMetadata.alternativeDistributionPackage.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for InstallMetadata(0) + 24);
  uint64_t v4 = sub_2465BDD08();
  size_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t InstallMetadata.isUpdate.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for InstallMetadata(0) + 28));
}

uint64_t InstallMetadata.appShareURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for InstallMetadata(0) + 32);

  return sub_2465BA5F8(v3, a1);
}

uint64_t sub_2465BA5F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8EEE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t InstallMetadata.appShareURL.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for InstallMetadata(0) + 32);

  return sub_2465BA6A4(a1, v3);
}

uint64_t sub_2465BA6A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8EEE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*InstallMetadata.appShareURL.modify())()
{
  return nullsub_1;
}

uint64_t InstallMetadata.init(account:appleItemID:alternativeDistributionPackage:isUpdate:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, char *a6@<X8>)
{
  uint64_t v12 = (int *)type metadata accessor for InstallMetadata(0);
  uint64_t v13 = (uint64_t)&a6[v12[8]];
  uint64_t v14 = sub_2465BDD08();
  uint64_t v15 = *(void *)(v14 - 8);
  unint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v17(v13, 1, 1, v14);
  *(void *)a6 = a1;
  *((void *)a6 + 1) = a2;
  *((void *)a6 + 2) = a3;
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 32))(&a6[v12[6]], a4, v14);
  a6[v12[7]] = a5;
  sub_2465BA88C(v13);

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v17)(v13, 1, 1, v14);
}

uint64_t sub_2465BA88C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8EEE8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2465BA8EC(char a1)
{
  unint64_t result = 0xD00000000000001ELL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x657449656C707061;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0x6574616470557369;
      break;
    case 4:
      unint64_t result = 0x6572616853707061;
      break;
    default:
      unint64_t result = 0x746E756F636361;
      break;
  }
  return result;
}

unint64_t sub_2465BA9B0()
{
  return sub_2465BA8EC(*v0);
}

uint64_t sub_2465BA9B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2465BDA38(a1, a2);
  *a3 = result;
  return result;
}

void sub_2465BA9E0(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_2465BA9EC(uint64_t a1)
{
  unint64_t v2 = sub_2465BAC9C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2465BAA28(uint64_t a1)
{
  unint64_t v2 = sub_2465BAC9C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t InstallMetadata.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8F128);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  int64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2465BAC9C();
  sub_2465BE248();
  char v14 = 0;
  sub_2465BE198();
  if (!v1)
  {
    char v13 = 1;
    sub_2465BE1C8();
    type metadata accessor for InstallMetadata(0);
    char v12 = 2;
    sub_2465BDD08();
    sub_2465BB17C(&qword_268F8F138);
    sub_2465BE1B8();
    char v11 = 3;
    sub_2465BE1A8();
    char v10 = 4;
    sub_2465BE178();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

unint64_t sub_2465BAC9C()
{
  unint64_t result = qword_268F8F130;
  if (!qword_268F8F130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8F130);
  }
  return result;
}

uint64_t InstallMetadata.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v35 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8EEE8);
  MEMORY[0x270FA5388](v3 - 8, v4);
  uint64_t v36 = (char *)v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2465BDD08();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  char v10 = (char *)v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8F140);
  uint64_t v37 = *(void *)(v11 - 8);
  uint64_t v38 = v11;
  MEMORY[0x270FA5388](v11, v12);
  char v14 = (char *)v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for InstallMetadata(0);
  uint64_t v17 = MEMORY[0x270FA5388](v15, v16);
  uint64_t v19 = (void *)((char *)v34 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v20 = *(void (**)(void))(v7 + 56);
  uint64_t v41 = (char *)v19 + *(int *)(v17 + 32);
  v20();
  uint64_t v21 = a1[3];
  uint64_t v40 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v21);
  sub_2465BAC9C();
  uint64_t v39 = v14;
  uint64_t v22 = v42;
  sub_2465BE238();
  if (v22)
  {
    uint64_t v25 = (uint64_t)v41;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
    return sub_2465BA88C(v25);
  }
  else
  {
    uint64_t v42 = v10;
    uint64_t v23 = v37;
    uint64_t v24 = v6;
    char v47 = 0;
    uint64_t v26 = (uint64_t)v19;
    *uint64_t v19 = sub_2465BE118();
    v19[1] = v27;
    char v46 = 1;
    uint64_t v28 = v23;
    v19[2] = sub_2465BE148();
    char v45 = 2;
    uint64_t v29 = sub_2465BB17C(&qword_268F8F148);
    uint64_t v30 = v42;
    sub_2465BE138();
    v34[1] = v29;
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v26 + *(int *)(v15 + 24), v30, v24);
    char v44 = 3;
    *(unsigned char *)(v26 + *(int *)(v15 + 28)) = sub_2465BE128() & 1;
    char v43 = 4;
    uint64_t v31 = (uint64_t)v36;
    sub_2465BE0F8();
    uint64_t v32 = (uint64_t)v41;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v39, v38);
    sub_2465BA6A4(v31, v32);
    sub_2465BA34C(v26, v35);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
    return sub_2465BB1C0(v26);
  }
}

uint64_t sub_2465BB17C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_2465BDD08();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2465BB1C0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for InstallMetadata(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2465BB21C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return InstallMetadata.init(from:)(a1, a2);
}

uint64_t sub_2465BB234(void *a1)
{
  return InstallMetadata.encode(to:)(a1);
}

uint64_t sub_2465BB250(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  uint64_t v3 = result;
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v4 = 0;
  uint64_t v5 = result + 64;
  uint64_t v6 = 1 << *(unsigned char *)(result + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(result + 64);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      unint64_t v10 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v11 = v10 | (v4 << 6);
      goto LABEL_24;
    }
    int64_t v12 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_33;
    }
    if (v12 >= v9) {
      return 1;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v12);
    ++v4;
    if (!v13)
    {
      int64_t v4 = v12 + 1;
      if (v12 + 1 >= v9) {
        return 1;
      }
      unint64_t v13 = *(void *)(v5 + 8 * v4);
      if (!v13)
      {
        int64_t v4 = v12 + 2;
        if (v12 + 2 >= v9) {
          return 1;
        }
        unint64_t v13 = *(void *)(v5 + 8 * v4);
        if (!v13)
        {
          int64_t v4 = v12 + 3;
          if (v12 + 3 >= v9) {
            return 1;
          }
          unint64_t v13 = *(void *)(v5 + 8 * v4);
          if (!v13) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v4 << 6);
LABEL_24:
    uint64_t v15 = *(void *)(*(void *)(v3 + 48) + 8 * v11);
    uint64_t v16 = (uint64_t *)(*(void *)(v3 + 56) + 16 * v11);
    uint64_t v17 = *v16;
    uint64_t v18 = v16[1];
    unint64_t v19 = sub_2465BB438(v15);
    if (v20)
    {
      uint64_t v21 = (uint64_t *)(*(void *)(a2 + 56) + 16 * v19);
      uint64_t result = *v21;
      if (*v21 == v17 && v21[1] == v18) {
        continue;
      }
      uint64_t result = sub_2465BE1E8();
      if (result) {
        continue;
      }
    }
    return 0;
  }
  int64_t v14 = v12 + 4;
  if (v14 >= v9) {
    return 1;
  }
  unint64_t v13 = *(void *)(v5 + 8 * v14);
  if (v13)
  {
    int64_t v4 = v14;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v4 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v4 >= v9) {
      return 1;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v4);
    ++v14;
    if (v13) {
      goto LABEL_23;
    }
  }
LABEL_33:
  __break(1u);
  return result;
}

uint64_t BatchInstallConfiguration.installs.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t BatchInstallConfiguration.confirmInstall.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_retain();
  return v1;
}

uint64_t BatchInstallConfiguration.init(installs:confirmInstall:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

unint64_t sub_2465BB438(uint64_t a1)
{
  uint64_t v2 = sub_2465BE1F8();

  return sub_2465BB47C(a1, v2);
}

unint64_t sub_2465BB47C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

BOOL _s21_MarketplaceKit_UIKit30BatchInstallConfirmationResultO2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = (void *)a1[1];
  uint64_t v5 = *(void *)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  if (!*a1)
  {
    if (!v5)
    {
      sub_2465B6DF0(0, v2);
      sub_2465B6DF0(0, v4);
      return 1;
    }
    goto LABEL_9;
  }
  if (!v5)
  {
LABEL_9:
    sub_2465BDC58(*(void *)a2, *(void **)(a2 + 8));
    sub_2465BDC58(v3, v2);
LABEL_11:
    sub_2465B6DF0(v3, v2);
    sub_2465B6DF0(v5, v4);
    return 0;
  }
  sub_2465BDC58(*(void *)a2, *(void **)(a2 + 8));
  sub_2465BDC58(v3, v2);
  id v6 = v4;
  id v7 = v2;
  if ((sub_2465BB250(v3, v5) & 1) == 0)
  {

    goto LABEL_11;
  }
  if (v2)
  {
    if (v4)
    {
      sub_2465BDC98();
      id v8 = v7;
      id v9 = v6;
      char v10 = sub_2465BDFE8();

      sub_2465B6DF0(v3, v2);
      sub_2465B6DF0(v5, v4);

      return (v10 & 1) != 0;
    }
    sub_2465B6DF0(v3, v2);
    sub_2465B6DF0(v5, 0);
    id v6 = v7;
LABEL_17:

    return 0;
  }
  sub_2465B6DF0(v3, 0);
  sub_2465B6DF0(v5, v4);
  if (v4) {
    goto LABEL_17;
  }
  return 1;
}

void destroy for InstallConfirmationResult(uint64_t a1)
{
  if (*(void *)(a1 + 8) >= 0xFFFFFFFFuLL)
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = *(void **)(a1 + 16);
  }
}

uint64_t _s21_MarketplaceKit_UIKit25InstallConfirmationResultOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    uint64_t v4 = *(void **)(a2 + 16);
    *(void *)(a1 + 16) = v4;
    swift_bridgeObjectRetain();
    id v5 = v4;
  }
  return a1;
}

uint64_t assignWithCopy for InstallConfirmationResult(uint64_t a1, void *a2)
{
  unint64_t v4 = a2[1];
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *(void *)a1 = *a2;
      *(void *)(a1 + 8) = a2[1];
      id v8 = (void *)a2[2];
      *(void *)(a1 + 16) = v8;
      swift_bridgeObjectRetain();
      id v9 = v8;
      return a1;
    }
LABEL_7:
    long long v10 = *(_OWORD *)a2;
    *(void *)(a1 + 16) = a2[2];
    *(_OWORD *)a1 = v10;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();

    goto LABEL_7;
  }
  *(void *)a1 = *a2;
  *(void *)(a1 + 8) = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v5 = *(void **)(a1 + 16);
  id v6 = (void *)a2[2];
  *(void *)(a1 + 16) = v6;
  id v7 = v6;

  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for InstallConfirmationResult(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();

LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    return a1;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  id v5 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  return a1;
}

uint64_t getEnumTagSinglePayload for InstallConfirmationResult(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for InstallConfirmationResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(_DWORD *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

uint64_t sub_2465BB974(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_2465BB98C(void *result, int a2)
{
  if (a2 < 0)
  {
    result[1] = 0;
    result[2] = 0;
    *__n128 result = a2 ^ 0x80000000;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for InstallConfirmationResult()
{
  return &type metadata for InstallConfirmationResult;
}

void *initializeBufferWithCopyOfBuffer for InstallConfiguration(void *a1, void *a2, uint64_t a3)
{
  unint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    void *v4 = *a2;
    unint64_t v4 = (void *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    a1[2] = a2[2];
    id v7 = (int *)type metadata accessor for InstallMetadata(0);
    uint64_t v8 = v7[6];
    id v9 = (char *)v4 + v8;
    long long v10 = (char *)a2 + v8;
    uint64_t v11 = sub_2465BDD08();
    uint64_t v12 = *(void *)(v11 - 8);
    unint64_t v13 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
    swift_bridgeObjectRetain();
    v13(v9, v10, v11);
    *((unsigned char *)v4 + v7[7]) = *((unsigned char *)a2 + v7[7]);
    uint64_t v14 = v7[8];
    uint64_t v15 = (char *)v4 + v14;
    uint64_t v16 = (char *)a2 + v14;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))((char *)a2 + v14, 1, v11))
    {
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8EEE8);
      memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      v13(v15, v16, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v15, 0, 1, v11);
    }
    uint64_t v19 = *(int *)(a3 + 20);
    char v20 = (void *)((char *)v4 + v19);
    uint64_t v21 = (void *)((char *)a2 + v19);
    uint64_t v22 = v21[1];
    *char v20 = *v21;
    v20[1] = v22;
  }
  swift_retain();
  return v4;
}

uint64_t destroy for InstallConfiguration(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = type metadata accessor for InstallMetadata(0);
  uint64_t v3 = a1 + *(int *)(v2 + 24);
  uint64_t v4 = sub_2465BDD08();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v6(v3, v4);
  uint64_t v7 = a1 + *(int *)(v2 + 32);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v7, 1, v4)) {
    v6(v7, v4);
  }

  return swift_release();
}

void *initializeWithCopy for InstallConfiguration(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  a1[2] = a2[2];
  uint64_t v6 = (int *)type metadata accessor for InstallMetadata(0);
  uint64_t v7 = v6[6];
  uint64_t v8 = (char *)a1 + v7;
  id v9 = (char *)a2 + v7;
  uint64_t v10 = sub_2465BDD08();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  swift_bridgeObjectRetain();
  v12(v8, v9, v10);
  *((unsigned char *)a1 + v6[7]) = *((unsigned char *)a2 + v6[7]);
  uint64_t v13 = v6[8];
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))((char *)a2 + v13, 1, v10))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8EEE8);
    memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    v12(v14, v15, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v14, 0, 1, v10);
  }
  uint64_t v17 = *(int *)(a3 + 20);
  uint64_t v18 = (void *)((char *)a1 + v17);
  uint64_t v19 = (void *)((char *)a2 + v17);
  uint64_t v20 = v19[1];
  *uint64_t v18 = *v19;
  v18[1] = v20;
  swift_retain();
  return a1;
}

void *assignWithCopy for InstallConfiguration(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  uint64_t v5 = (int *)type metadata accessor for InstallMetadata(0);
  uint64_t v6 = v5[6];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2465BDD08();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v10 + 24);
  v22(v7, v8, v9);
  *((unsigned char *)a1 + v5[7]) = *((unsigned char *)a2 + v5[7]);
  uint64_t v11 = v5[8];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  LODWORD(v8) = v14((char *)a1 + v11, 1, v9);
  int v15 = v14(v13, 1, v9);
  if (!v8)
  {
    if (!v15)
    {
      v22(v12, v13, v9);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8EEE8);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v12, v13, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v12, 0, 1, v9);
LABEL_7:
  uint64_t v17 = *(int *)(a3 + 20);
  uint64_t v18 = (void *)((char *)a1 + v17);
  uint64_t v19 = (void *)((char *)a2 + v17);
  uint64_t v20 = v19[1];
  *uint64_t v18 = *v19;
  v18[1] = v20;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for InstallConfiguration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v6 = (int *)type metadata accessor for InstallMetadata(0);
  uint64_t v7 = v6[6];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_2465BDD08();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void (**)(void *, const void *, uint64_t))(v11 + 32);
  v12(v8, v9, v10);
  *(unsigned char *)(a1 + v6[7]) = *(unsigned char *)(a2 + v6[7]);
  uint64_t v13 = v6[8];
  uint64_t v14 = (void *)(a1 + v13);
  int v15 = (const void *)(a2 + v13);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(a2 + v13, 1, v10))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8EEE8);
    memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    v12(v14, v15, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v14, 0, 1, v10);
  }
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

void *assignWithTake for InstallConfiguration(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  uint64_t v6 = (int *)type metadata accessor for InstallMetadata(0);
  uint64_t v7 = v6[6];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_2465BDD08();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v11 + 40);
  v19(v8, v9, v10);
  *((unsigned char *)a1 + v6[7]) = *((unsigned char *)a2 + v6[7]);
  uint64_t v12 = v6[8];
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  int v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  LODWORD(v9) = v15((char *)a1 + v12, 1, v10);
  int v16 = v15(v14, 1, v10);
  if (!v9)
  {
    if (!v16)
    {
      v19(v13, v14, v10);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8EEE8);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v14, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v13, 0, 1, v10);
LABEL_7:
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 20));
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for InstallConfiguration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2465BC3FC);
}

uint64_t sub_2465BC3FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for InstallMetadata(0);
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

uint64_t storeEnumTagSinglePayload for InstallConfiguration(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2465BC4D0);
}

uint64_t sub_2465BC4D0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for InstallMetadata(0);
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

uint64_t sub_2465BC58C()
{
  uint64_t result = type metadata accessor for InstallMetadata(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for InstallMetadata(void *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    void *v4 = *a2;
    uint64_t v4 = (void *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    a1[2] = a2[2];
    uint64_t v8 = a3[6];
    uint64_t v9 = (char *)a1 + v8;
    unint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_2465BDD08();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
    swift_bridgeObjectRetain();
    v13(v9, v10, v11);
    uint64_t v14 = a3[8];
    *((unsigned char *)v4 + a3[7]) = *((unsigned char *)a2 + a3[7]);
    int v15 = (char *)v4 + v14;
    int v16 = (char *)a2 + v14;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v16, 1, v11))
    {
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8EEE8);
      memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      v13(v15, v16, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v15, 0, 1, v11);
    }
  }
  return v4;
}

uint64_t destroy for InstallMetadata(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_2465BDD08();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v9(v4, v5);
  uint64_t v7 = a1 + *(int *)(a2 + 32);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v7, 1, v5);
  if (!result)
  {
    return ((uint64_t (*)(uint64_t, uint64_t))v9)(v7, v5);
  }
  return result;
}

void *initializeWithCopy for InstallMetadata(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  uint64_t v7 = a3[6];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_2465BDD08();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  swift_bridgeObjectRetain();
  v12(v8, v9, v10);
  uint64_t v13 = a3[8];
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  uint64_t v14 = (char *)a1 + v13;
  int v15 = (char *)a2 + v13;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v15, 1, v10))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8EEE8);
    memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    v12(v14, v15, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v14, 0, 1, v10);
  }
  return a1;
}

void *assignWithCopy for InstallMetadata(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2465BDD08();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(v10 + 24);
  v11(v7, v8, v9);
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  uint64_t v12 = a3[8];
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  int v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  LODWORD(v7) = v15((char *)a1 + v12, 1, v9);
  int v16 = v15(v14, 1, v9);
  if (!v7)
  {
    if (!v16)
    {
      v11(v13, v14, v9);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8EEE8);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v14, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v13, 0, 1, v9);
  return a1;
}

uint64_t initializeWithTake for InstallMetadata(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_2465BDD08();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void (**)(void *, const void *, uint64_t))(v10 + 32);
  v11(v7, v8, v9);
  uint64_t v12 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (const void *)(a2 + v12);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v14, 1, v9))
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8EEE8);
    memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    v11(v13, v14, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v13, 0, 1, v9);
  }
  return a1;
}

void *assignWithTake for InstallMetadata(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  uint64_t v7 = a3[6];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_2465BDD08();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v11 + 40);
  v12(v8, v9, v10);
  uint64_t v13 = a3[8];
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  int v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  LODWORD(v8) = v16((char *)a1 + v13, 1, v10);
  int v17 = v16(v15, 1, v10);
  if (!v8)
  {
    if (!v17)
    {
      v12(v14, v15, v10);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8EEE8);
    memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v14, v15, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v14, 0, 1, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for InstallMetadata(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2465BCF64);
}

uint64_t sub_2465BCF64(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_2465BDD08();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 24);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8EEE8);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 32);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t storeEnumTagSinglePayload for InstallMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2465BD0A8);
}

uint64_t sub_2465BD0A8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = sub_2465BDD08();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 24);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8EEE8);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 32);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void sub_2465BD1D8()
{
  sub_2465BDD08();
  if (v0 <= 0x3F)
  {
    sub_2465BD2C0();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_2465BD2C0()
{
  if (!qword_268F8F170)
  {
    sub_2465BDD08();
    unint64_t v0 = sub_2465BDFF8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268F8F170);
    }
  }
}

void destroy for BatchInstallConfirmationResult(void *a1)
{
  if (*a1 >= 0xFFFFFFFFuLL)
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = (void *)a1[1];
  }
}

uint64_t _s21_MarketplaceKit_UIKit30BatchInstallConfirmationResultOwCP_0(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    uint64_t v3 = *(void **)(a2 + 8);
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
    id v4 = v3;
  }
  return a1;
}

uint64_t assignWithCopy for BatchInstallConfirmationResult(uint64_t a1, unint64_t *a2)
{
  unint64_t v4 = *(void *)a1;
  unint64_t v5 = *a2;
  if (v4 < 0xFFFFFFFF)
  {
    if (v5 >= 0xFFFFFFFF)
    {
      *(void *)a1 = v5;
      uint64_t v9 = (void *)a2[1];
      *(void *)(a1 + 8) = v9;
      swift_bridgeObjectRetain();
      id v10 = v9;
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v5 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();

    goto LABEL_7;
  }
  *(void *)a1 = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void **)(a1 + 8);
  uint64_t v7 = (void *)a2[1];
  *(void *)(a1 + 8) = v7;
  id v8 = v7;

  return a1;
}

uint64_t assignWithTake for BatchInstallConfirmationResult(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  if (*(void *)a2 < 0xFFFFFFFFuLL)
  {
    swift_bridgeObjectRelease();

LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  unint64_t v4 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);

  return a1;
}

uint64_t getEnumTagSinglePayload for BatchInstallConfirmationResult(uint64_t *a1, unsigned int a2)
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
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for BatchInstallConfirmationResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)uint64_t result = a2 - 0x7FFFFFFF;
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

uint64_t sub_2465BD590(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_2465BD5A8(void *result, int a2)
{
  if (a2 < 0)
  {
    uint64_t v2 = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else
  {
    if (!a2) {
      return result;
    }
    uint64_t v2 = (a2 - 1);
  }
  *uint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for BatchInstallConfirmationResult()
{
  return &type metadata for BatchInstallConfirmationResult;
}

uint64_t destroy for BatchInstallConfiguration()
{
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t _s21_MarketplaceKit_UIKit25BatchInstallConfigurationVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for BatchInstallConfiguration(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for BatchInstallConfiguration(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v4;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for BatchInstallConfiguration(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for BatchInstallConfiguration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BatchInstallConfiguration()
{
  return &type metadata for BatchInstallConfiguration;
}

uint64_t getEnumTagSinglePayload for InstallMetadata.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for InstallMetadata.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x2465BD8F8);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for InstallMetadata.CodingKeys()
{
  return &type metadata for InstallMetadata.CodingKeys;
}

unint64_t sub_2465BD934()
{
  unint64_t result = qword_268F8F178;
  if (!qword_268F8F178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8F178);
  }
  return result;
}

unint64_t sub_2465BD98C()
{
  unint64_t result = qword_268F8F180;
  if (!qword_268F8F180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8F180);
  }
  return result;
}

unint64_t sub_2465BD9E4()
{
  unint64_t result = qword_268F8F188;
  if (!qword_268F8F188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8F188);
  }
  return result;
}

uint64_t sub_2465BDA38(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x746E756F636361 && a2 == 0xE700000000000000;
  if (v3 || (sub_2465BE1E8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x657449656C707061 && a2 == 0xEB0000000044496DLL || (sub_2465BE1E8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD00000000000001ELL && a2 == 0x80000002465C09A0 || (sub_2465BE1E8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6574616470557369 && a2 == 0xE800000000000000 || (sub_2465BE1E8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6572616853707061 && a2 == 0xEB000000004C5255)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_2465BE1E8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_2465BDC58(uint64_t result, void *a2)
{
  if (result)
  {
    id v2 = a2;
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_2465BDC98()
{
  unint64_t result = qword_268F8F190;
  if (!qword_268F8F190)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268F8F190);
  }
  return result;
}

uint64_t sub_2465BDCD8()
{
  return MEMORY[0x270EEF288]();
}

uint64_t sub_2465BDCE8()
{
  return MEMORY[0x270EEF2A8]();
}

uint64_t sub_2465BDCF8()
{
  return MEMORY[0x270EEF2B8]();
}

uint64_t sub_2465BDD08()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2465BDD18()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_2465BDD28()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_2465BDD38()
{
  return MEMORY[0x270EF5958]();
}

uint64_t sub_2465BDD48()
{
  return MEMORY[0x270EF5960]();
}

uint64_t sub_2465BDD58()
{
  return MEMORY[0x270EF5988]();
}

uint64_t sub_2465BDD68()
{
  return MEMORY[0x270EF5990]();
}

uint64_t sub_2465BDD78()
{
  return MEMORY[0x270EF5998]();
}

uint64_t sub_2465BDD88()
{
  return MEMORY[0x270EF59A0]();
}

uint64_t sub_2465BDD98()
{
  return MEMORY[0x270EF5A10]();
}

uint64_t sub_2465BDDA8()
{
  return MEMORY[0x270EF5A18]();
}

uint64_t sub_2465BDDB8()
{
  return MEMORY[0x270EF5A20]();
}

uint64_t sub_2465BDDC8()
{
  return MEMORY[0x270EF5A28]();
}

uint64_t sub_2465BDDD8()
{
  return MEMORY[0x270EF5A30]();
}

uint64_t sub_2465BDDF8()
{
  return MEMORY[0x270EF5A40]();
}

uint64_t sub_2465BDE08()
{
  return MEMORY[0x270EF5A48]();
}

uint64_t sub_2465BDE18()
{
  return MEMORY[0x270EF5A50]();
}

uint64_t sub_2465BDE38()
{
  return MEMORY[0x270EF5A60]();
}

uint64_t sub_2465BDE48()
{
  return MEMORY[0x270EF5A68]();
}

uint64_t sub_2465BDE58()
{
  return MEMORY[0x270EF5A70]();
}

uint64_t sub_2465BDE68()
{
  return MEMORY[0x270EF5A78]();
}

uint64_t sub_2465BDE78()
{
  return MEMORY[0x270EF5A80]();
}

uint64_t sub_2465BDE88()
{
  return MEMORY[0x270EF5A88]();
}

uint64_t sub_2465BDE98()
{
  return MEMORY[0x270EF57F0]();
}

uint64_t sub_2465BDEA8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2465BDEB8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2465BDEC8()
{
  return MEMORY[0x270F82258]();
}

uint64_t sub_2465BDED8()
{
  return MEMORY[0x270F82260]();
}

uint64_t sub_2465BDEE8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2465BDEF8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2465BDF08()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2465BDF18()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2465BDF28()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_2465BDF38()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2465BDF48()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2465BDF58()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_2465BDF68()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_2465BDF78()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2465BDF88()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_2465BDF98()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_2465BDFA8()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2465BDFB8()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2465BDFC8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2465BDFD8()
{
  return MEMORY[0x270F82700]();
}

uint64_t sub_2465BDFE8()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_2465BDFF8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2465BE008()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2465BE018()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2465BE028()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_2465BE038()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2465BE048()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2465BE058()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2465BE068()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_2465BE078()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_2465BE088()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2465BE098()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2465BE0A8()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2465BE0B8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2465BE0C8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2465BE0D8()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_2465BE0E8()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_2465BE0F8()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_2465BE108()
{
  return MEMORY[0x270F9F2E0]();
}

uint64_t sub_2465BE118()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_2465BE128()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_2465BE138()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_2465BE148()
{
  return MEMORY[0x270F9F358]();
}

uint64_t sub_2465BE158()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_2465BE168()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_2465BE178()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_2465BE188()
{
  return MEMORY[0x270F9F418]();
}

uint64_t sub_2465BE198()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_2465BE1A8()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_2465BE1B8()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_2465BE1C8()
{
  return MEMORY[0x270F9F498]();
}

uint64_t sub_2465BE1D8()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2465BE1E8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2465BE1F8()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_2465BE208()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2465BE218()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2465BE228()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2465BE238()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_2465BE248()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t UISSlotMachineInterface()
{
  return MEMORY[0x270F83058]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x270FA2478]();
}

uint64_t swift_task_reportUnexpectedExecutor()
{
  return MEMORY[0x270FA2490]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}