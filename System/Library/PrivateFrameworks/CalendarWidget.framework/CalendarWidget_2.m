id EKUICalendarsIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v5;
  id v6;
  objc_super v8;

  if (a2)
  {
    v5 = (void *)sub_1DAF997C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for EKUICalendarsIntent();
  v6 = objc_msgSendSuper2(&v8, sel_initWithIdentifier_backingStore_, v5, a3);

  return v6;
}

id EKUICalendarsIntent.__allocating_init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v7 = (void *)sub_1DAF997C0();
  swift_bridgeObjectRelease();
  v8 = (void *)sub_1DAF997C0();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9 = (void *)sub_1DAF996A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  id v10 = objc_msgSend(objc_allocWithZone(v5), sel_initWithDomain_verb_parametersByName_, v7, v8, v9);

  return v10;
}

id EKUICalendarsIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v7 = (void *)sub_1DAF997C0();
  swift_bridgeObjectRelease();
  v8 = (void *)sub_1DAF997C0();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9 = (void *)sub_1DAF996A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  v12.receiver = v5;
  v12.super_class = (Class)type metadata accessor for EKUICalendarsIntent();
  id v10 = objc_msgSendSuper2(&v12, sel_initWithDomain_verb_parametersByName_, v7, v8, v9);

  return v10;
}

id EKUICalendarsIntent.__deallocating_deinit()
{
  return sub_1DAF94FE0(type metadata accessor for EKUICalendarsIntent);
}

unint64_t EKUICalendarsIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_1DAF95018(a1);
}

unint64_t sub_1DAF94888@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_1DAF95018(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_1DAF948BC(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_calendars);
  if (v3)
  {
    char v4 = v3;
    type metadata accessor for EKUICalendar();
    uint64_t v5 = sub_1DAF998C0();
  }
  else
  {
    uint64_t v5 = 0;
  }
  *a2 = v5;
}

void sub_1DAF9492C(void *a1, void **a2)
{
  v2 = *a2;
  if (*a1)
  {
    type metadata accessor for EKUICalendar();
    uint64_t v3 = sub_1DAF998B0();
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  objc_msgSend(v2, sel_setCalendars_);
}

uint64_t sub_1DAF949EC()
{
  uint64_t v1 = v0 + OBJC_IVAR___EKUICalendarsIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

char *EKUICalendarsIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  uint64_t v5 = (char *)objc_msgSend(objc_allocWithZone(v2), sel_init);
  v6 = &v5[OBJC_IVAR___EKUICalendarsIntentResponse_code];
  swift_beginAccess();
  *(void *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

char *EKUICalendarsIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  uint64_t v5 = (char *)objc_msgSend(v2, sel_init);
  v6 = &v5[OBJC_IVAR___EKUICalendarsIntentResponse_code];
  swift_beginAccess();
  *(void *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id EKUICalendarsIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___EKUICalendarsIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EKUICalendarsIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

id EKUICalendarsIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___EKUICalendarsIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for EKUICalendarsIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id EKUICalendarsIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithBackingStore_, a1);

  return v3;
}

id EKUICalendarsIntentResponse.init(backingStore:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___EKUICalendarsIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for EKUICalendarsIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithBackingStore_, a1);

  return v3;
}

id sub_1DAF94DE4(char *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  *(void *)&a1[OBJC_IVAR___EKUICalendarsIntentResponse_code] = 0;
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for EKUICalendarsIntentResponse();
  return objc_msgSendSuper2(&v7, *a4, a3);
}

id EKUICalendarsIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  if (a1)
  {
    objc_super v2 = (void *)sub_1DAF996A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v2 = 0;
  }
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithPropertiesByName_, v2);

  return v3;
}

id EKUICalendarsIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___EKUICalendarsIntentResponse_code] = 0;
  if (a1)
  {
    objc_super v2 = (void *)sub_1DAF996A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v2 = 0;
  }
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for EKUICalendarsIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithPropertiesByName_, v2);

  if (v3) {
  return v3;
  }
}

id EKUICalendarsIntentResponse.__deallocating_deinit()
{
  return sub_1DAF94FE0(type metadata accessor for EKUICalendarsIntentResponse);
}

id sub_1DAF94FE0(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

unint64_t sub_1DAF95018(unint64_t result)
{
  if (result > 6) {
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for EKUICalendarsIntentResponse()
{
  return self;
}

unint64_t sub_1DAF95050()
{
  unint64_t result = qword_1EA8FB690;
  if (!qword_1EA8FB690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8FB690);
  }
  return result;
}

char *keypath_get_selector_mirrorCalendarApp()
{
  return sel_mirrorCalendarApp;
}

id sub_1DAF950B0@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_mirrorCalendarApp);
  *a2 = result;
  return result;
}

id sub_1DAF950EC(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setMirrorCalendarApp_, *a1);
}

char *keypath_get_selector_calendars()
{
  return sel_calendars;
}

void sub_1DAF9510C(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_1DAF95124(void *a1, void **a2)
{
}

char *keypath_get_selector_hideAllDayEvents()
{
  return sel_hideAllDayEvents;
}

id sub_1DAF95148@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_hideAllDayEvents);
  *a2 = result;
  return result;
}

id sub_1DAF95184(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHideAllDayEvents_, *a1);
}

void sub_1DAF95198(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_1DAF951B0(void *a1, void **a2)
{
}

uint64_t sub_1DAF951C8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v3 = (void *)(*a1 + OBJC_IVAR___EKUICalendarsIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_1DAF9521C(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  objc_super v3 = (void *)(*a2 + OBJC_IVAR___EKUICalendarsIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *objc_super v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for EKUICalendarsIntentResponseCode()
{
  return &type metadata for EKUICalendarsIntentResponseCode;
}

uint64_t method lookup function for EKUICalendarsIntentResponse(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for EKUICalendarsIntentResponse);
}

uint64_t dispatch thunk of EKUICalendarsIntentResponse.code.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x58))();
}

id NextEventComplicationConfigurationIntent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id NextEventComplicationConfigurationIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NextEventComplicationConfigurationIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for NextEventComplicationConfigurationIntent()
{
  return self;
}

id NextEventComplicationConfigurationIntent.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id NextEventComplicationConfigurationIntent.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for NextEventComplicationConfigurationIntent();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id NextEventComplicationConfigurationIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_1DAF997C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithIdentifier_backingStore_, v6, a3);

  return v7;
}

id NextEventComplicationConfigurationIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    objc_super v5 = (void *)sub_1DAF997C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for NextEventComplicationConfigurationIntent();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithIdentifier_backingStore_, v5, a3);

  return v6;
}

id NextEventComplicationConfigurationIntent.__allocating_init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7 = (void *)sub_1DAF997C0();
  swift_bridgeObjectRelease();
  objc_super v8 = (void *)sub_1DAF997C0();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9 = (void *)sub_1DAF996A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  id v10 = objc_msgSend(objc_allocWithZone(v5), sel_initWithDomain_verb_parametersByName_, v7, v8, v9);

  return v10;
}

id NextEventComplicationConfigurationIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7 = (void *)sub_1DAF997C0();
  swift_bridgeObjectRelease();
  objc_super v8 = (void *)sub_1DAF997C0();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9 = (void *)sub_1DAF996A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  v12.receiver = v5;
  v12.super_class = (Class)type metadata accessor for NextEventComplicationConfigurationIntent();
  id v10 = objc_msgSendSuper2(&v12, sel_initWithDomain_verb_parametersByName_, v7, v8, v9);

  return v10;
}

id NextEventComplicationConfigurationIntent.__deallocating_deinit()
{
  return sub_1DAF95F68(type metadata accessor for NextEventComplicationConfigurationIntent);
}

unint64_t NextEventComplicationConfigurationIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_1DAF95018(a1);
}

uint64_t sub_1DAF95974()
{
  uint64_t v1 = v0 + OBJC_IVAR___NextEventComplicationConfigurationIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

char *NextEventComplicationConfigurationIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_super v5 = (char *)objc_msgSend(objc_allocWithZone(v2), sel_init);
  id v6 = &v5[OBJC_IVAR___NextEventComplicationConfigurationIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  id v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

char *NextEventComplicationConfigurationIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_super v5 = (char *)objc_msgSend(v2, sel_init);
  id v6 = &v5[OBJC_IVAR___NextEventComplicationConfigurationIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  id v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id NextEventComplicationConfigurationIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___NextEventComplicationConfigurationIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NextEventComplicationConfigurationIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

id NextEventComplicationConfigurationIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___NextEventComplicationConfigurationIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for NextEventComplicationConfigurationIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id NextEventComplicationConfigurationIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithBackingStore_, a1);

  return v3;
}

id NextEventComplicationConfigurationIntentResponse.init(backingStore:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___NextEventComplicationConfigurationIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for NextEventComplicationConfigurationIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithBackingStore_, a1);

  return v3;
}

id sub_1DAF95D6C(char *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  *(void *)&a1[OBJC_IVAR___NextEventComplicationConfigurationIntentResponse_code] = 0;
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for NextEventComplicationConfigurationIntentResponse();
  return objc_msgSendSuper2(&v7, *a4, a3);
}

id NextEventComplicationConfigurationIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  if (a1)
  {
    objc_super v2 = (void *)sub_1DAF996A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v2 = 0;
  }
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithPropertiesByName_, v2);

  return v3;
}

id NextEventComplicationConfigurationIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___NextEventComplicationConfigurationIntentResponse_code] = 0;
  if (a1)
  {
    objc_super v2 = (void *)sub_1DAF996A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v2 = 0;
  }
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for NextEventComplicationConfigurationIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithPropertiesByName_, v2);

  if (v3) {
  return v3;
  }
}

id NextEventComplicationConfigurationIntentResponse.__deallocating_deinit()
{
  return sub_1DAF95F68(type metadata accessor for NextEventComplicationConfigurationIntentResponse);
}

id sub_1DAF95F68(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for NextEventComplicationConfigurationIntentResponse()
{
  return self;
}

unint64_t sub_1DAF95FC8()
{
  unint64_t result = qword_1EA8FB6A0;
  if (!qword_1EA8FB6A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8FB6A0);
  }
  return result;
}

id sub_1DAF9601C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_mirrorCalendarApp);
  *a2 = result;
  return result;
}

id sub_1DAF96058(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setMirrorCalendarApp_, *a1);
}

void sub_1DAF9606C(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_1DAF96084(void *a1, void **a2)
{
}

void sub_1DAF9609C(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_1DAF960B4(void *a1, void **a2)
{
}

uint64_t sub_1DAF960CC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v3 = (void *)(*a1 + OBJC_IVAR___NextEventComplicationConfigurationIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_1DAF96120(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  objc_super v3 = (void *)(*a2 + OBJC_IVAR___NextEventComplicationConfigurationIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *objc_super v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for NextEventComplicationConfigurationIntentResponseCode()
{
  return &type metadata for NextEventComplicationConfigurationIntentResponseCode;
}

uint64_t method lookup function for NextEventComplicationConfigurationIntentResponse(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for NextEventComplicationConfigurationIntentResponse);
}

uint64_t dispatch thunk of NextEventComplicationConfigurationIntentResponse.code.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x58))();
}

id LunarDateComplicationConfigurationIntent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void sub_1DAF96208(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_overlayCalendarID);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = sub_1DAF99800();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_1DAF96270(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  if (*(void *)(a1 + 8)) {
    uint64_t v3 = sub_1DAF997C0();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  objc_msgSend(v2, sel_setOverlayCalendarID_);
}

id LunarDateComplicationConfigurationIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LunarDateComplicationConfigurationIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for LunarDateComplicationConfigurationIntent()
{
  return self;
}

id LunarDateComplicationConfigurationIntent.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id LunarDateComplicationConfigurationIntent.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for LunarDateComplicationConfigurationIntent();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id LunarDateComplicationConfigurationIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_1DAF997C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithIdentifier_backingStore_, v6, a3);

  return v7;
}

id LunarDateComplicationConfigurationIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    objc_super v5 = (void *)sub_1DAF997C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for LunarDateComplicationConfigurationIntent();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithIdentifier_backingStore_, v5, a3);

  return v6;
}

id LunarDateComplicationConfigurationIntent.__allocating_init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7 = (void *)sub_1DAF997C0();
  swift_bridgeObjectRelease();
  objc_super v8 = (void *)sub_1DAF997C0();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9 = (void *)sub_1DAF996A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  id v10 = objc_msgSend(objc_allocWithZone(v5), sel_initWithDomain_verb_parametersByName_, v7, v8, v9);

  return v10;
}

id LunarDateComplicationConfigurationIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7 = (void *)sub_1DAF997C0();
  swift_bridgeObjectRelease();
  objc_super v8 = (void *)sub_1DAF997C0();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9 = (void *)sub_1DAF996A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  v12.receiver = v5;
  v12.super_class = (Class)type metadata accessor for LunarDateComplicationConfigurationIntent();
  id v10 = objc_msgSendSuper2(&v12, sel_initWithDomain_verb_parametersByName_, v7, v8, v9);

  return v10;
}

id LunarDateComplicationConfigurationIntent.__deallocating_deinit()
{
  return sub_1DAF96F44(type metadata accessor for LunarDateComplicationConfigurationIntent);
}

unint64_t LunarDateComplicationConfigurationIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_1DAF95018(a1);
}

uint64_t sub_1DAF96950()
{
  uint64_t v1 = v0 + OBJC_IVAR___LunarDateComplicationConfigurationIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

char *LunarDateComplicationConfigurationIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_super v5 = (char *)objc_msgSend(objc_allocWithZone(v2), sel_init);
  id v6 = &v5[OBJC_IVAR___LunarDateComplicationConfigurationIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  id v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

char *LunarDateComplicationConfigurationIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_super v5 = (char *)objc_msgSend(v2, sel_init);
  id v6 = &v5[OBJC_IVAR___LunarDateComplicationConfigurationIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  id v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id LunarDateComplicationConfigurationIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___LunarDateComplicationConfigurationIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LunarDateComplicationConfigurationIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

id LunarDateComplicationConfigurationIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___LunarDateComplicationConfigurationIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for LunarDateComplicationConfigurationIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id LunarDateComplicationConfigurationIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithBackingStore_, a1);

  return v3;
}

id LunarDateComplicationConfigurationIntentResponse.init(backingStore:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___LunarDateComplicationConfigurationIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for LunarDateComplicationConfigurationIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithBackingStore_, a1);

  return v3;
}

id sub_1DAF96D48(char *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  *(void *)&a1[OBJC_IVAR___LunarDateComplicationConfigurationIntentResponse_code] = 0;
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for LunarDateComplicationConfigurationIntentResponse();
  return objc_msgSendSuper2(&v7, *a4, a3);
}

id LunarDateComplicationConfigurationIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  if (a1)
  {
    objc_super v2 = (void *)sub_1DAF996A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v2 = 0;
  }
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithPropertiesByName_, v2);

  return v3;
}

id LunarDateComplicationConfigurationIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___LunarDateComplicationConfigurationIntentResponse_code] = 0;
  if (a1)
  {
    objc_super v2 = (void *)sub_1DAF996A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v2 = 0;
  }
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for LunarDateComplicationConfigurationIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithPropertiesByName_, v2);

  if (v3) {
  return v3;
  }
}

id LunarDateComplicationConfigurationIntentResponse.__deallocating_deinit()
{
  return sub_1DAF96F44(type metadata accessor for LunarDateComplicationConfigurationIntentResponse);
}

id sub_1DAF96F44(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for LunarDateComplicationConfigurationIntentResponse()
{
  return self;
}

unint64_t sub_1DAF96FA4()
{
  unint64_t result = qword_1EA8FB6B0;
  if (!qword_1EA8FB6B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8FB6B0);
  }
  return result;
}

char *keypath_get_selector_overlayCalendarID()
{
  return sel_overlayCalendarID;
}

uint64_t sub_1DAF9700C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v3 = (void *)(*a1 + OBJC_IVAR___LunarDateComplicationConfigurationIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_1DAF97060(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  objc_super v3 = (void *)(*a2 + OBJC_IVAR___LunarDateComplicationConfigurationIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *objc_super v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for LunarDateComplicationConfigurationIntentResponseCode()
{
  return &type metadata for LunarDateComplicationConfigurationIntentResponseCode;
}

uint64_t method lookup function for LunarDateComplicationConfigurationIntentResponse(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for LunarDateComplicationConfigurationIntentResponse);
}

uint64_t dispatch thunk of LunarDateComplicationConfigurationIntentResponse.code.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x58))();
}

void sub_1DAF97114(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_acAccountIdentifier);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = sub_1DAF99800();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_1DAF9717C(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  if (*(void *)(a1 + 8)) {
    uint64_t v3 = sub_1DAF997C0();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  objc_msgSend(v2, sel_setAcAccountIdentifier_);
}

id EKUICalendar.__allocating_init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    objc_super v8 = (void *)sub_1DAF997C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v8 = 0;
  }
  v9 = (void *)sub_1DAF997C0();
  swift_bridgeObjectRelease();
  if (a6)
  {
    id v10 = (void *)sub_1DAF997C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v10 = 0;
  }
  id v11 = objc_msgSend(objc_allocWithZone(v6), sel_initWithIdentifier_displayString_pronunciationHint_, v8, v9, v10);

  return v11;
}

id EKUICalendar.init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    objc_super v8 = (void *)sub_1DAF997C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v8 = 0;
  }
  v9 = (void *)sub_1DAF997C0();
  swift_bridgeObjectRelease();
  if (a6)
  {
    id v10 = (void *)sub_1DAF997C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v10 = 0;
  }
  v13.receiver = v6;
  v13.super_class = (Class)type metadata accessor for EKUICalendar();
  id v11 = objc_msgSendSuper2(&v13, sel_initWithIdentifier_displayString_pronunciationHint_, v8, v9, v10);

  return v11;
}

uint64_t type metadata accessor for EKUICalendar()
{
  return self;
}

id EKUICalendar.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id EKUICalendar.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for EKUICalendar();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id EKUICalendar.__deallocating_deinit()
{
  return sub_1DAF97B9C(type metadata accessor for EKUICalendar);
}

id sub_1DAF9755C(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___EKUICalendarResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_successWithResolvedObject_, a1);
  return v2;
}

id sub_1DAF97610(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_1DAF97708();
    swift_bridgeObjectRetain();
    sub_1DAF99C70();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_1DAF99D30();
    sub_1DAF97708();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_1DAF97708();
  id v2 = (void *)sub_1DAF998B0();
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___EKUICalendarResolutionResult;
  id v3 = objc_msgSendSuper2(&v5, sel_disambiguationWithObjectsToDisambiguate_, v2);

  return v3;
}

unint64_t sub_1DAF97708()
{
  unint64_t result = qword_1EA8FB6B8;
  if (!qword_1EA8FB6B8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA8FB6B8);
  }
  return result;
}

id sub_1DAF977B4(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___EKUICalendarResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_confirmationRequiredWithObjectToConfirm_, a1);
  return v2;
}

id EKUICalendarResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  objc_super v5 = (void *)sub_1DAF996A0();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id EKUICalendarResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_1DAF996A0();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for EKUICalendarResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for EKUICalendarResolutionResult()
{
  return self;
}

id EKUICalendarResolutionResult.__deallocating_deinit()
{
  return sub_1DAF97B9C(type metadata accessor for EKUICalendarResolutionResult);
}

id sub_1DAF97B9C(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

char *keypath_get_selector_acAccountIdentifier()
{
  return sel_acAccountIdentifier;
}

uint64_t method lookup function for EKUICalendarResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for EKUICalendarResolutionResult);
}

uint64_t dispatch thunk of static EKUICalendarResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static EKUICalendarResolutionResult.disambiguation(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of static EKUICalendarResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_1DAF97C60()
{
  return MEMORY[0x1F40E32D8]();
}

uint64_t sub_1DAF97C70()
{
  return MEMORY[0x1F40E33F0]();
}

uint64_t sub_1DAF97C80()
{
  return MEMORY[0x1F40E3420]();
}

uint64_t sub_1DAF97C90()
{
  return MEMORY[0x1F40E3480]();
}

uint64_t sub_1DAF97CA0()
{
  return MEMORY[0x1F40E34D0]();
}

uint64_t sub_1DAF97CB0()
{
  return MEMORY[0x1F40E34E8]();
}

uint64_t sub_1DAF97CC0()
{
  return MEMORY[0x1F40E34F0]();
}

uint64_t sub_1DAF97CD0()
{
  return MEMORY[0x1F40E34F8]();
}

uint64_t sub_1DAF97CE0()
{
  return MEMORY[0x1F40E3508]();
}

uint64_t sub_1DAF97CF0()
{
  return MEMORY[0x1F40E3530]();
}

uint64_t sub_1DAF97D00()
{
  return MEMORY[0x1F40E3858]();
}

uint64_t sub_1DAF97D10()
{
  return MEMORY[0x1F40E38F8]();
}

uint64_t sub_1DAF97D20()
{
  return MEMORY[0x1F40E3908]();
}

uint64_t sub_1DAF97D30()
{
  return MEMORY[0x1F40E3948]();
}

uint64_t sub_1DAF97D40()
{
  return MEMORY[0x1F40E3958]();
}

uint64_t sub_1DAF97D50()
{
  return MEMORY[0x1F40E39B0]();
}

uint64_t sub_1DAF97D60()
{
  return MEMORY[0x1F40E39C8]();
}

uint64_t sub_1DAF97D70()
{
  return MEMORY[0x1F40E3A10]();
}

uint64_t sub_1DAF97D80()
{
  return MEMORY[0x1F40E3A58]();
}

uint64_t sub_1DAF97D90()
{
  return MEMORY[0x1F40F7D28]();
}

uint64_t sub_1DAF97DA0()
{
  return MEMORY[0x1F40E3BC0]();
}

uint64_t sub_1DAF97DB0()
{
  return MEMORY[0x1F40E3BF0]();
}

uint64_t sub_1DAF97DC0()
{
  return MEMORY[0x1F40E3C10]();
}

uint64_t sub_1DAF97DD0()
{
  return MEMORY[0x1F40E3C38]();
}

uint64_t sub_1DAF97DE0()
{
  return MEMORY[0x1F40E3C68]();
}

uint64_t sub_1DAF97DF0()
{
  return MEMORY[0x1F40E3CB8]();
}

uint64_t sub_1DAF97E00()
{
  return MEMORY[0x1F40E3D30]();
}

uint64_t sub_1DAF97E10()
{
  return MEMORY[0x1F40E3E20]();
}

uint64_t sub_1DAF97E20()
{
  return MEMORY[0x1F40E3E60]();
}

uint64_t sub_1DAF97E30()
{
  return MEMORY[0x1F40E3E98]();
}

uint64_t sub_1DAF97E40()
{
  return MEMORY[0x1F40E3EA0]();
}

uint64_t sub_1DAF97E50()
{
  return MEMORY[0x1F40E3EB0]();
}

uint64_t sub_1DAF97E60()
{
  return MEMORY[0x1F40E3EF8]();
}

uint64_t sub_1DAF97E70()
{
  return MEMORY[0x1F40E3F10]();
}

uint64_t sub_1DAF97E80()
{
  return MEMORY[0x1F40E3F58]();
}

uint64_t sub_1DAF97E90()
{
  return MEMORY[0x1F40E4090]();
}

uint64_t sub_1DAF97EA0()
{
  return MEMORY[0x1F40E40A0]();
}

uint64_t sub_1DAF97EB0()
{
  return MEMORY[0x1F40E4178]();
}

uint64_t sub_1DAF97EC0()
{
  return MEMORY[0x1F40F7D48]();
}

uint64_t sub_1DAF97ED0()
{
  return MEMORY[0x1F40E46D0]();
}

uint64_t sub_1DAF97EE0()
{
  return MEMORY[0x1F40E48F8]();
}

uint64_t sub_1DAF97EF0()
{
  return MEMORY[0x1F40E4B20]();
}

uint64_t sub_1DAF97F00()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1DAF97F10()
{
  return MEMORY[0x1F40E4ED0]();
}

uint64_t sub_1DAF97F20()
{
  return MEMORY[0x1F40E4EE0]();
}

uint64_t sub_1DAF97F30()
{
  return MEMORY[0x1F40E5098]();
}

uint64_t sub_1DAF97F40()
{
  return MEMORY[0x1F40E5158]();
}

uint64_t sub_1DAF97F50()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1DAF97F60()
{
  return MEMORY[0x1F40E5198]();
}

uint64_t sub_1DAF97F70()
{
  return MEMORY[0x1F40E51A8]();
}

uint64_t sub_1DAF97F80()
{
  return MEMORY[0x1F40E52C0]();
}

uint64_t sub_1DAF97F90()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_1DAF97FA0()
{
  return MEMORY[0x1F40E52F0]();
}

uint64_t sub_1DAF97FB0()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1DAF97FC0()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1DAF97FD0()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1DAF97FE0()
{
  return MEMORY[0x1F40E53E8]();
}

uint64_t sub_1DAF97FF0()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1DAF98000()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1DAF98010()
{
  return MEMORY[0x1F40E5500]();
}

uint64_t sub_1DAF98020()
{
  return MEMORY[0x1F40E5568]();
}

uint64_t sub_1DAF98030()
{
  return MEMORY[0x1F40E5578]();
}

uint64_t sub_1DAF98040()
{
  return MEMORY[0x1F40E55B0]();
}

uint64_t sub_1DAF98050()
{
  return MEMORY[0x1F40E55C0]();
}

uint64_t sub_1DAF98060()
{
  return MEMORY[0x1F40E55E0]();
}

uint64_t sub_1DAF98070()
{
  return MEMORY[0x1F40E5648]();
}

uint64_t sub_1DAF98080()
{
  return MEMORY[0x1F40E5728]();
}

uint64_t sub_1DAF98090()
{
  return MEMORY[0x1F40E57F8]();
}

uint64_t sub_1DAF980A0()
{
  return MEMORY[0x1F40E5840]();
}

uint64_t sub_1DAF980B0()
{
  return MEMORY[0x1F40E5868]();
}

uint64_t sub_1DAF980C0()
{
  return MEMORY[0x1F40E5878]();
}

uint64_t sub_1DAF980D0()
{
  return MEMORY[0x1F40E5880]();
}

uint64_t sub_1DAF980E0()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1DAF980F0()
{
  return MEMORY[0x1F40E58D0]();
}

uint64_t sub_1DAF98100()
{
  return MEMORY[0x1F40E5960]();
}

uint64_t sub_1DAF98110()
{
  return MEMORY[0x1F40E5978]();
}

uint64_t sub_1DAF98120()
{
  return MEMORY[0x1F40E59E0]();
}

uint64_t sub_1DAF98130()
{
  return MEMORY[0x1F40E5A18]();
}

uint64_t sub_1DAF98140()
{
  return MEMORY[0x1F40E5A40]();
}

uint64_t sub_1DAF98150()
{
  return MEMORY[0x1F40E5A58]();
}

uint64_t sub_1DAF98160()
{
  return MEMORY[0x1F40E5A80]();
}

uint64_t sub_1DAF98170()
{
  return MEMORY[0x1F40E5A90]();
}

uint64_t sub_1DAF98180()
{
  return MEMORY[0x1F40E5A98]();
}

uint64_t sub_1DAF98190()
{
  return MEMORY[0x1F40E5AB8]();
}

uint64_t sub_1DAF981A0()
{
  return MEMORY[0x1F40E5AC8]();
}

uint64_t sub_1DAF981B0()
{
  return MEMORY[0x1F40E5AF0]();
}

uint64_t sub_1DAF981C0()
{
  return MEMORY[0x1F40E5B00]();
}

uint64_t sub_1DAF981D0()
{
  return MEMORY[0x1F40E5B18]();
}

uint64_t sub_1DAF981E0()
{
  return MEMORY[0x1F40E5D08]();
}

uint64_t sub_1DAF981F0()
{
  return MEMORY[0x1F40E5D20]();
}

uint64_t sub_1DAF98200()
{
  return MEMORY[0x1F40E5D28]();
}

uint64_t sub_1DAF98210()
{
  return MEMORY[0x1F40E5D70]();
}

uint64_t sub_1DAF98220()
{
  return MEMORY[0x1F4187538]();
}

uint64_t sub_1DAF98230()
{
  return MEMORY[0x1F4187540]();
}

uint64_t sub_1DAF98240()
{
  return MEMORY[0x1F4187550]();
}

uint64_t sub_1DAF98250()
{
  return MEMORY[0x1F4187568]();
}

uint64_t sub_1DAF98260()
{
  return MEMORY[0x1F4187578]();
}

uint64_t sub_1DAF98270()
{
  return MEMORY[0x1F4187588]();
}

uint64_t sub_1DAF98280()
{
  return MEMORY[0x1F410F438]();
}

uint64_t sub_1DAF98290()
{
  return MEMORY[0x1F410F440]();
}

uint64_t sub_1DAF982A0()
{
  return MEMORY[0x1F410F448]();
}

uint64_t sub_1DAF982B0()
{
  return MEMORY[0x1F410F450]();
}

uint64_t sub_1DAF982C0()
{
  return MEMORY[0x1F410F458]();
}

uint64_t sub_1DAF982D0()
{
  return MEMORY[0x1F410F460]();
}

uint64_t sub_1DAF982E0()
{
  return MEMORY[0x1F410F468]();
}

uint64_t sub_1DAF982F0()
{
  return MEMORY[0x1F410F470]();
}

uint64_t sub_1DAF98300()
{
  return MEMORY[0x1F410F478]();
}

uint64_t sub_1DAF98310()
{
  return MEMORY[0x1F410F480]();
}

uint64_t sub_1DAF98320()
{
  return MEMORY[0x1F410F488]();
}

uint64_t sub_1DAF98330()
{
  return MEMORY[0x1F410F490]();
}

uint64_t sub_1DAF98340()
{
  return MEMORY[0x1F410F498]();
}

uint64_t sub_1DAF98350()
{
  return MEMORY[0x1F410F4A0]();
}

uint64_t sub_1DAF98360()
{
  return MEMORY[0x1F410F4A8]();
}

uint64_t sub_1DAF98370()
{
  return MEMORY[0x1F410F4B0]();
}

uint64_t sub_1DAF98380()
{
  return MEMORY[0x1F410F4B8]();
}

uint64_t sub_1DAF98390()
{
  return MEMORY[0x1F410F4C0]();
}

uint64_t sub_1DAF983A0()
{
  return MEMORY[0x1F410F4C8]();
}

uint64_t sub_1DAF983B0()
{
  return MEMORY[0x1F410F4D0]();
}

uint64_t sub_1DAF983C0()
{
  return MEMORY[0x1F410F4D8]();
}

uint64_t sub_1DAF983D0()
{
  return MEMORY[0x1F410F4E0]();
}

uint64_t sub_1DAF983E0()
{
  return MEMORY[0x1F410F4E8]();
}

uint64_t sub_1DAF983F0()
{
  return MEMORY[0x1F410F4F0]();
}

uint64_t sub_1DAF98400()
{
  return MEMORY[0x1F410F4F8]();
}

uint64_t sub_1DAF98410()
{
  return MEMORY[0x1F410F500]();
}

uint64_t sub_1DAF98420()
{
  return MEMORY[0x1F410F508]();
}

uint64_t sub_1DAF98430()
{
  return MEMORY[0x1F410F510]();
}

uint64_t sub_1DAF98440()
{
  return MEMORY[0x1F410F518]();
}

uint64_t sub_1DAF98450()
{
  return MEMORY[0x1F410F520]();
}

uint64_t sub_1DAF98460()
{
  return MEMORY[0x1F410F528]();
}

uint64_t sub_1DAF98470()
{
  return MEMORY[0x1F410F530]();
}

uint64_t sub_1DAF98480()
{
  return MEMORY[0x1F410F538]();
}

uint64_t sub_1DAF98490()
{
  return MEMORY[0x1F410F540]();
}

uint64_t sub_1DAF984A0()
{
  return MEMORY[0x1F410F548]();
}

uint64_t sub_1DAF984B0()
{
  return MEMORY[0x1F410F550]();
}

uint64_t sub_1DAF984C0()
{
  return MEMORY[0x1F410F558]();
}

uint64_t sub_1DAF984D0()
{
  return MEMORY[0x1F410F560]();
}

uint64_t sub_1DAF984E0()
{
  return MEMORY[0x1F410F568]();
}

uint64_t sub_1DAF984F0()
{
  return MEMORY[0x1F410F570]();
}

uint64_t sub_1DAF98500()
{
  return MEMORY[0x1F410F578]();
}

uint64_t sub_1DAF98510()
{
  return MEMORY[0x1F410F580]();
}

uint64_t sub_1DAF98520()
{
  return MEMORY[0x1F410F588]();
}

uint64_t sub_1DAF98530()
{
  return MEMORY[0x1F410F590]();
}

uint64_t sub_1DAF98540()
{
  return MEMORY[0x1F410F598]();
}

uint64_t sub_1DAF98550()
{
  return MEMORY[0x1F410F5A0]();
}

uint64_t sub_1DAF98560()
{
  return MEMORY[0x1F410F5A8]();
}

uint64_t sub_1DAF98570()
{
  return MEMORY[0x1F410F5B0]();
}

uint64_t sub_1DAF98580()
{
  return MEMORY[0x1F410F5B8]();
}

uint64_t sub_1DAF98590()
{
  return MEMORY[0x1F410F5C0]();
}

uint64_t sub_1DAF985A0()
{
  return MEMORY[0x1F410F5C8]();
}

uint64_t sub_1DAF985B0()
{
  return MEMORY[0x1F410F5D0]();
}

uint64_t sub_1DAF985C0()
{
  return MEMORY[0x1F410F5D8]();
}

uint64_t sub_1DAF985D0()
{
  return MEMORY[0x1F410F5E0]();
}

uint64_t sub_1DAF985E0()
{
  return MEMORY[0x1F410F5E8]();
}

uint64_t sub_1DAF985F0()
{
  return MEMORY[0x1F410F5F0]();
}

uint64_t sub_1DAF98600()
{
  return MEMORY[0x1F410F5F8]();
}

uint64_t sub_1DAF98610()
{
  return MEMORY[0x1F410F600]();
}

uint64_t sub_1DAF98620()
{
  return MEMORY[0x1F410F608]();
}

uint64_t sub_1DAF98630()
{
  return MEMORY[0x1F410F610]();
}

uint64_t sub_1DAF98640()
{
  return MEMORY[0x1F410F618]();
}

uint64_t sub_1DAF98650()
{
  return MEMORY[0x1F410F620]();
}

uint64_t sub_1DAF98660()
{
  return MEMORY[0x1F410F628]();
}

uint64_t sub_1DAF98670()
{
  return MEMORY[0x1F410F630]();
}

uint64_t sub_1DAF98680()
{
  return MEMORY[0x1F410F638]();
}

uint64_t sub_1DAF98690()
{
  return MEMORY[0x1F410F640]();
}

uint64_t sub_1DAF986A0()
{
  return MEMORY[0x1F410F648]();
}

uint64_t sub_1DAF986B0()
{
  return MEMORY[0x1F410F650]();
}

uint64_t sub_1DAF986C0()
{
  return MEMORY[0x1F410F658]();
}

uint64_t sub_1DAF986D0()
{
  return MEMORY[0x1F410F660]();
}

uint64_t sub_1DAF986E0()
{
  return MEMORY[0x1F410F668]();
}

uint64_t sub_1DAF986F0()
{
  return MEMORY[0x1F410F670]();
}

uint64_t sub_1DAF98700()
{
  return MEMORY[0x1F410F678]();
}

uint64_t sub_1DAF98710()
{
  return MEMORY[0x1F410F680]();
}

uint64_t sub_1DAF98720()
{
  return MEMORY[0x1F410F688]();
}

uint64_t sub_1DAF98730()
{
  return MEMORY[0x1F410F690]();
}

uint64_t sub_1DAF98740()
{
  return MEMORY[0x1F410F698]();
}

uint64_t sub_1DAF98750()
{
  return MEMORY[0x1F410F6A0]();
}

uint64_t sub_1DAF98760()
{
  return MEMORY[0x1F4188500]();
}

uint64_t sub_1DAF98770()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1DAF98780()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1DAF98790()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1DAF987A0()
{
  return MEMORY[0x1F40F7D90]();
}

uint64_t sub_1DAF987B0()
{
  return MEMORY[0x1F40F7D98]();
}

uint64_t sub_1DAF987C0()
{
  return MEMORY[0x1F40F7E78]();
}

uint64_t sub_1DAF987D0()
{
  return MEMORY[0x1F40F8010]();
}

uint64_t sub_1DAF987E0()
{
  return MEMORY[0x1F40F8038]();
}

uint64_t sub_1DAF987F0()
{
  return MEMORY[0x1F40F8048]();
}

uint64_t sub_1DAF98800()
{
  return MEMORY[0x1F40F80A8]();
}

uint64_t sub_1DAF98810()
{
  return MEMORY[0x1F40F8120]();
}

uint64_t sub_1DAF98820()
{
  return MEMORY[0x1F40F82B0]();
}

uint64_t sub_1DAF98830()
{
  return MEMORY[0x1F40F82C0]();
}

uint64_t sub_1DAF98840()
{
  return MEMORY[0x1F40F82D0]();
}

uint64_t sub_1DAF98850()
{
  return MEMORY[0x1F40F8358]();
}

uint64_t sub_1DAF98860()
{
  return MEMORY[0x1F40F8368]();
}

uint64_t sub_1DAF98870()
{
  return MEMORY[0x1F40F8370]();
}

uint64_t sub_1DAF98880()
{
  return MEMORY[0x1F40F83E8]();
}

uint64_t sub_1DAF98890()
{
  return MEMORY[0x1F40F8458]();
}

uint64_t sub_1DAF988A0()
{
  return MEMORY[0x1F40F84B0]();
}

uint64_t sub_1DAF988B0()
{
  return MEMORY[0x1F40F84D0]();
}

uint64_t sub_1DAF988C0()
{
  return MEMORY[0x1F40F85C0]();
}

uint64_t sub_1DAF988D0()
{
  return MEMORY[0x1F40F85D0]();
}

uint64_t sub_1DAF988E0()
{
  return MEMORY[0x1F40F8660]();
}

uint64_t sub_1DAF98900()
{
  return MEMORY[0x1F40F8848]();
}

uint64_t sub_1DAF98910()
{
  return MEMORY[0x1F40F8850]();
}

uint64_t sub_1DAF98920()
{
  return MEMORY[0x1F40F8928]();
}

uint64_t sub_1DAF98930()
{
  return MEMORY[0x1F40F8BB0]();
}

uint64_t sub_1DAF98940()
{
  return MEMORY[0x1F40F8BE8]();
}

uint64_t sub_1DAF98950()
{
  return MEMORY[0x1F40F8BF8]();
}

uint64_t sub_1DAF98960()
{
  return MEMORY[0x1F40F8E40]();
}

uint64_t sub_1DAF98970()
{
  return MEMORY[0x1F40F8E48]();
}

uint64_t sub_1DAF98980()
{
  return MEMORY[0x1F40F8E68]();
}

uint64_t sub_1DAF98990()
{
  return MEMORY[0x1F40F8E98]();
}

uint64_t sub_1DAF989A0()
{
  return MEMORY[0x1F40F8F58]();
}

uint64_t sub_1DAF989B0()
{
  return MEMORY[0x1F40F9000]();
}

uint64_t sub_1DAF989C0()
{
  return MEMORY[0x1F40F9090]();
}

uint64_t sub_1DAF989D0()
{
  return MEMORY[0x1F40F9108]();
}

uint64_t sub_1DAF989E0()
{
  return MEMORY[0x1F40F9118]();
}

uint64_t sub_1DAF989F0()
{
  return MEMORY[0x1F40F9140]();
}

uint64_t sub_1DAF98A00()
{
  return MEMORY[0x1F40F9190]();
}

uint64_t sub_1DAF98A10()
{
  return MEMORY[0x1F40F9198]();
}

uint64_t sub_1DAF98A20()
{
  return MEMORY[0x1F40F91B0]();
}

uint64_t sub_1DAF98A30()
{
  return MEMORY[0x1F40F91E8]();
}

uint64_t sub_1DAF98A40()
{
  return MEMORY[0x1F40F91F0]();
}

uint64_t sub_1DAF98A50()
{
  return MEMORY[0x1F40F9200]();
}

uint64_t sub_1DAF98A60()
{
  return MEMORY[0x1F40F9218]();
}

uint64_t sub_1DAF98A70()
{
  return MEMORY[0x1F40F9288]();
}

uint64_t sub_1DAF98A80()
{
  return MEMORY[0x1F40F9290]();
}

uint64_t sub_1DAF98A90()
{
  return MEMORY[0x1F40F9318]();
}

uint64_t sub_1DAF98AA0()
{
  return MEMORY[0x1F40F9348]();
}

uint64_t sub_1DAF98AB0()
{
  return MEMORY[0x1F40F9358]();
}

uint64_t sub_1DAF98AC0()
{
  return MEMORY[0x1F40F9478]();
}

uint64_t sub_1DAF98AD0()
{
  return MEMORY[0x1F40F9488]();
}

uint64_t sub_1DAF98AE0()
{
  return MEMORY[0x1F40F9558]();
}

uint64_t sub_1DAF98AF0()
{
  return MEMORY[0x1F40F9560]();
}

uint64_t sub_1DAF98B00()
{
  return MEMORY[0x1F40F9590]();
}

uint64_t sub_1DAF98B10()
{
  return MEMORY[0x1F40F95A0]();
}

uint64_t sub_1DAF98B20()
{
  return MEMORY[0x1F40F95E0]();
}

uint64_t sub_1DAF98B30()
{
  return MEMORY[0x1F4103EF0]();
}

uint64_t sub_1DAF98B40()
{
  return MEMORY[0x1F4103EF8]();
}

uint64_t sub_1DAF98B50()
{
  return MEMORY[0x1F4103F10]();
}

uint64_t sub_1DAF98B60()
{
  return MEMORY[0x1F4103F28]();
}

uint64_t sub_1DAF98B70()
{
  return MEMORY[0x1F4103FB8]();
}

uint64_t sub_1DAF98B80()
{
  return MEMORY[0x1F40F9668]();
}

uint64_t sub_1DAF98B90()
{
  return MEMORY[0x1F40F9678]();
}

uint64_t sub_1DAF98BA0()
{
  return MEMORY[0x1F40F96C0]();
}

uint64_t sub_1DAF98BB0()
{
  return MEMORY[0x1F40F96D0]();
}

uint64_t sub_1DAF98BC0()
{
  return MEMORY[0x1F40F96F0]();
}

uint64_t sub_1DAF98BD0()
{
  return MEMORY[0x1F40F9700]();
}

uint64_t sub_1DAF98BE0()
{
  return MEMORY[0x1F40F9880]();
}

uint64_t sub_1DAF98BF0()
{
  return MEMORY[0x1F40F98A8]();
}

uint64_t sub_1DAF98C00()
{
  return MEMORY[0x1F40F98C8]();
}

uint64_t sub_1DAF98C10()
{
  return MEMORY[0x1F40F9B60]();
}

uint64_t sub_1DAF98C20()
{
  return MEMORY[0x1F40F9C90]();
}

uint64_t sub_1DAF98C30()
{
  return MEMORY[0x1F40F9CA0]();
}

uint64_t sub_1DAF98C40()
{
  return MEMORY[0x1F40F9CD0]();
}

uint64_t sub_1DAF98C50()
{
  return MEMORY[0x1F40F9CE0]();
}

uint64_t sub_1DAF98C60()
{
  return MEMORY[0x1F40F9CF8]();
}

uint64_t sub_1DAF98C70()
{
  return MEMORY[0x1F40F9D08]();
}

uint64_t sub_1DAF98C80()
{
  return MEMORY[0x1F4104090]();
}

uint64_t sub_1DAF98C90()
{
  return MEMORY[0x1F4104098]();
}

uint64_t sub_1DAF98CA0()
{
  return MEMORY[0x1F41040A0]();
}

uint64_t sub_1DAF98CB0()
{
  return MEMORY[0x1F40F9F98]();
}

uint64_t sub_1DAF98CC0()
{
  return MEMORY[0x1F40F9FA0]();
}

uint64_t sub_1DAF98CD0()
{
  return MEMORY[0x1F40F9FB0]();
}

uint64_t sub_1DAF98CE0()
{
  return MEMORY[0x1F40FA088]();
}

uint64_t sub_1DAF98CF0()
{
  return MEMORY[0x1F40FA0A0]();
}

uint64_t sub_1DAF98D00()
{
  return MEMORY[0x1F40FA3B0]();
}

uint64_t sub_1DAF98D10()
{
  return MEMORY[0x1F40FA570]();
}

uint64_t sub_1DAF98D20()
{
  return MEMORY[0x1F40FA858]();
}

uint64_t sub_1DAF98D30()
{
  return MEMORY[0x1F40FA870]();
}

uint64_t sub_1DAF98D40()
{
  return MEMORY[0x1F40FA888]();
}

uint64_t sub_1DAF98D50()
{
  return MEMORY[0x1F41040D0]();
}

uint64_t sub_1DAF98D60()
{
  return MEMORY[0x1F40FAAE0]();
}

uint64_t sub_1DAF98D70()
{
  return MEMORY[0x1F40FABF0]();
}

uint64_t sub_1DAF98D80()
{
  return MEMORY[0x1F40FAD70]();
}

uint64_t sub_1DAF98D90()
{
  return MEMORY[0x1F40FAD80]();
}

uint64_t sub_1DAF98DA0()
{
  return MEMORY[0x1F40FAD90]();
}

uint64_t sub_1DAF98DB0()
{
  return MEMORY[0x1F40FADA0]();
}

uint64_t sub_1DAF98DC0()
{
  return MEMORY[0x1F40FADB0]();
}

uint64_t sub_1DAF98DD0()
{
  return MEMORY[0x1F40FADC8]();
}

uint64_t sub_1DAF98DE0()
{
  return MEMORY[0x1F40FADD0]();
}

uint64_t sub_1DAF98DF0()
{
  return MEMORY[0x1F40FADE8]();
}

uint64_t sub_1DAF98E00()
{
  return MEMORY[0x1F40FADF0]();
}

uint64_t sub_1DAF98E10()
{
  return MEMORY[0x1F40FAE10]();
}

uint64_t sub_1DAF98E20()
{
  return MEMORY[0x1F40FAE20]();
}

uint64_t sub_1DAF98E30()
{
  return MEMORY[0x1F40FAE50]();
}

uint64_t sub_1DAF98E40()
{
  return MEMORY[0x1F40FAE70]();
}

uint64_t sub_1DAF98E50()
{
  return MEMORY[0x1F40FAEA8]();
}

uint64_t sub_1DAF98E60()
{
  return MEMORY[0x1F40FAEF0]();
}

uint64_t sub_1DAF98E70()
{
  return MEMORY[0x1F40FAEF8]();
}

uint64_t sub_1DAF98E80()
{
  return MEMORY[0x1F40FAF10]();
}

uint64_t sub_1DAF98E90()
{
  return MEMORY[0x1F40FAF20]();
}

uint64_t sub_1DAF98EA0()
{
  return MEMORY[0x1F40FAF68]();
}

uint64_t sub_1DAF98EB0()
{
  return MEMORY[0x1F40FAF88]();
}

uint64_t sub_1DAF98EC0()
{
  return MEMORY[0x1F40FAFA8]();
}

uint64_t sub_1DAF98ED0()
{
  return MEMORY[0x1F40FAFB8]();
}

uint64_t sub_1DAF98EE0()
{
  return MEMORY[0x1F40FAFC8]();
}

uint64_t sub_1DAF98EF0()
{
  return MEMORY[0x1F40FAFD8]();
}

uint64_t sub_1DAF98F00()
{
  return MEMORY[0x1F40FAFF8]();
}

uint64_t sub_1DAF98F10()
{
  return MEMORY[0x1F40FB030]();
}

uint64_t sub_1DAF98F20()
{
  return MEMORY[0x1F40FB080]();
}

uint64_t sub_1DAF98F30()
{
  return MEMORY[0x1F40FB0C0]();
}

uint64_t sub_1DAF98F40()
{
  return MEMORY[0x1F40FB0E0]();
}

uint64_t sub_1DAF98F50()
{
  return MEMORY[0x1F40FB100]();
}

uint64_t sub_1DAF98F60()
{
  return MEMORY[0x1F40FB110]();
}

uint64_t sub_1DAF98F70()
{
  return MEMORY[0x1F40FB128]();
}

uint64_t sub_1DAF98F80()
{
  return MEMORY[0x1F40FB138]();
}

uint64_t sub_1DAF98F90()
{
  return MEMORY[0x1F40FB160]();
}

uint64_t sub_1DAF98FA0()
{
  return MEMORY[0x1F40FB1B8]();
}

uint64_t sub_1DAF98FB0()
{
  return MEMORY[0x1F40FB250]();
}

uint64_t sub_1DAF98FC0()
{
  return MEMORY[0x1F40FB278]();
}

uint64_t sub_1DAF98FD0()
{
  return MEMORY[0x1F40FB298]();
}

uint64_t sub_1DAF98FE0()
{
  return MEMORY[0x1F40FB2C8]();
}

uint64_t sub_1DAF98FF0()
{
  return MEMORY[0x1F40FB328]();
}

uint64_t sub_1DAF99000()
{
  return MEMORY[0x1F40FB338]();
}

uint64_t sub_1DAF99010()
{
  return MEMORY[0x1F40FB358]();
}

uint64_t sub_1DAF99020()
{
  return MEMORY[0x1F40FB360]();
}

uint64_t sub_1DAF99030()
{
  return MEMORY[0x1F40FB378]();
}

uint64_t sub_1DAF99040()
{
  return MEMORY[0x1F40FB388]();
}

uint64_t sub_1DAF99050()
{
  return MEMORY[0x1F40FB398]();
}

uint64_t sub_1DAF99060()
{
  return MEMORY[0x1F40FB3A8]();
}

uint64_t sub_1DAF99070()
{
  return MEMORY[0x1F40FB3B8]();
}

uint64_t sub_1DAF99080()
{
  return MEMORY[0x1F40FB400]();
}

uint64_t sub_1DAF99090()
{
  return MEMORY[0x1F40FB458]();
}

uint64_t sub_1DAF990A0()
{
  return MEMORY[0x1F40FB4F0]();
}

uint64_t sub_1DAF990B0()
{
  return MEMORY[0x1F40FB508]();
}

uint64_t sub_1DAF990C0()
{
  return MEMORY[0x1F40FB570]();
}

uint64_t sub_1DAF990D0()
{
  return MEMORY[0x1F40FB588]();
}

uint64_t sub_1DAF990E0()
{
  return MEMORY[0x1F40FB590]();
}

uint64_t sub_1DAF990F0()
{
  return MEMORY[0x1F41040E0]();
}

uint64_t sub_1DAF99100()
{
  return MEMORY[0x1F41040F8]();
}

uint64_t sub_1DAF99110()
{
  return MEMORY[0x1F40FB5C8]();
}

uint64_t sub_1DAF99120()
{
  return MEMORY[0x1F40FB5E0]();
}

uint64_t sub_1DAF99130()
{
  return MEMORY[0x1F40FB640]();
}

uint64_t sub_1DAF99140()
{
  return MEMORY[0x1F40FB6A8]();
}

uint64_t sub_1DAF99150()
{
  return MEMORY[0x1F40FB718]();
}

uint64_t sub_1DAF99160()
{
  return MEMORY[0x1F40FB7F0]();
}

uint64_t sub_1DAF99170()
{
  return MEMORY[0x1F40FB8B8]();
}

uint64_t sub_1DAF99180()
{
  return MEMORY[0x1F40FB908]();
}

uint64_t sub_1DAF99190()
{
  return MEMORY[0x1F40FB928]();
}

uint64_t sub_1DAF991A0()
{
  return MEMORY[0x1F40FBAD0]();
}

uint64_t sub_1DAF991B0()
{
  return MEMORY[0x1F40FBB88]();
}

uint64_t sub_1DAF991C0()
{
  return MEMORY[0x1F40FBBA0]();
}

uint64_t sub_1DAF991D0()
{
  return MEMORY[0x1F40FBCC0]();
}

uint64_t sub_1DAF991E0()
{
  return MEMORY[0x1F40FBCD8]();
}

uint64_t sub_1DAF991F0()
{
  return MEMORY[0x1F40FBD58]();
}

uint64_t sub_1DAF99200()
{
  return MEMORY[0x1F40FBEC8]();
}

uint64_t sub_1DAF99210()
{
  return MEMORY[0x1F40FBF68]();
}

uint64_t sub_1DAF99220()
{
  return MEMORY[0x1F40FC1A8]();
}

uint64_t sub_1DAF99230()
{
  return MEMORY[0x1F40FC218]();
}

uint64_t sub_1DAF99240()
{
  return MEMORY[0x1F40FC2E8]();
}

uint64_t sub_1DAF99250()
{
  return MEMORY[0x1F40FC300]();
}

uint64_t sub_1DAF99260()
{
  return MEMORY[0x1F40FC308]();
}

uint64_t sub_1DAF99270()
{
  return MEMORY[0x1F40FC330]();
}

uint64_t sub_1DAF99280()
{
  return MEMORY[0x1F40FC358]();
}

uint64_t sub_1DAF99290()
{
  return MEMORY[0x1F40FC360]();
}

uint64_t sub_1DAF992A0()
{
  return MEMORY[0x1F40FC378]();
}

uint64_t sub_1DAF992B0()
{
  return MEMORY[0x1F40FC3B0]();
}

uint64_t sub_1DAF992C0()
{
  return MEMORY[0x1F40FC3C8]();
}

uint64_t sub_1DAF992D0()
{
  return MEMORY[0x1F40FC3D8]();
}

uint64_t sub_1DAF992E0()
{
  return MEMORY[0x1F40FC3F0]();
}

uint64_t sub_1DAF992F0()
{
  return MEMORY[0x1F40FC410]();
}

uint64_t sub_1DAF99300()
{
  return MEMORY[0x1F40FC418]();
}

uint64_t sub_1DAF99310()
{
  return MEMORY[0x1F40FC430]();
}

uint64_t sub_1DAF99320()
{
  return MEMORY[0x1F40FC440]();
}

uint64_t sub_1DAF99330()
{
  return MEMORY[0x1F40FC448]();
}

uint64_t sub_1DAF99340()
{
  return MEMORY[0x1F40FC4A0]();
}

uint64_t sub_1DAF99350()
{
  return MEMORY[0x1F40FC4B0]();
}

uint64_t sub_1DAF99360()
{
  return MEMORY[0x1F40FC4B8]();
}

uint64_t sub_1DAF99370()
{
  return MEMORY[0x1F40FC4E0]();
}

uint64_t sub_1DAF99380()
{
  return MEMORY[0x1F40FC538]();
}

uint64_t sub_1DAF99390()
{
  return MEMORY[0x1F40FC558]();
}

uint64_t sub_1DAF993A0()
{
  return MEMORY[0x1F40FC560]();
}

uint64_t sub_1DAF993B0()
{
  return MEMORY[0x1F40FC598]();
}

uint64_t sub_1DAF993C0()
{
  return MEMORY[0x1F40FC5D8]();
}

uint64_t sub_1DAF993D0()
{
  return MEMORY[0x1F40FC5E0]();
}

uint64_t sub_1DAF99400()
{
  return MEMORY[0x1F40FC6A8]();
}

uint64_t sub_1DAF99420()
{
  return MEMORY[0x1F40FC6C0]();
}

uint64_t sub_1DAF99440()
{
  return MEMORY[0x1F40FC6E8]();
}

uint64_t sub_1DAF99450()
{
  return MEMORY[0x1F40FC6F8]();
}

uint64_t sub_1DAF99460()
{
  return MEMORY[0x1F40FC710]();
}

uint64_t sub_1DAF99470()
{
  return MEMORY[0x1F40FC988]();
}

uint64_t sub_1DAF99480()
{
  return MEMORY[0x1F40FC990]();
}

uint64_t sub_1DAF99490()
{
  return MEMORY[0x1F40FC9A8]();
}

uint64_t sub_1DAF994A0()
{
  return MEMORY[0x1F40FC9C0]();
}

uint64_t sub_1DAF994B0()
{
  return MEMORY[0x1F40FC9C8]();
}

uint64_t sub_1DAF994C0()
{
  return MEMORY[0x1F40FCBE0]();
}

uint64_t sub_1DAF994D0()
{
  return MEMORY[0x1F40FCC28]();
}

uint64_t sub_1DAF994E0()
{
  return MEMORY[0x1F40FCC38]();
}

uint64_t sub_1DAF994F0()
{
  return MEMORY[0x1F40FCED0]();
}

uint64_t sub_1DAF99500()
{
  return MEMORY[0x1F4104138]();
}

uint64_t sub_1DAF99510()
{
  return MEMORY[0x1F4104150]();
}

uint64_t sub_1DAF99520()
{
  return MEMORY[0x1F4104278]();
}

uint64_t sub_1DAF99530()
{
  return MEMORY[0x1F4104288]();
}

uint64_t sub_1DAF99540()
{
  return MEMORY[0x1F4104290]();
}

uint64_t sub_1DAF99550()
{
  return MEMORY[0x1F41042A8]();
}

uint64_t sub_1DAF99560()
{
  return MEMORY[0x1F41042B8]();
}

uint64_t sub_1DAF99570()
{
  return MEMORY[0x1F41043D0]();
}

uint64_t sub_1DAF99580()
{
  return MEMORY[0x1F41044C8]();
}

uint64_t sub_1DAF995B0()
{
  return MEMORY[0x1F4104670]();
}

uint64_t sub_1DAF995C0()
{
  return MEMORY[0x1F41046A8]();
}

uint64_t sub_1DAF995D0()
{
  return MEMORY[0x1F41046C8]();
}

uint64_t sub_1DAF995E0()
{
  return MEMORY[0x1F41046D0]();
}

uint64_t sub_1DAF995F0()
{
  return MEMORY[0x1F41046E0]();
}

uint64_t sub_1DAF99610()
{
  return MEMORY[0x1F41048F8]();
}

uint64_t sub_1DAF99630()
{
  return MEMORY[0x1F41049D8]();
}

uint64_t sub_1DAF99640()
{
  return MEMORY[0x1F41049E0]();
}

uint64_t sub_1DAF99650()
{
  return MEMORY[0x1F41049E8]();
}

uint64_t sub_1DAF99660()
{
  return MEMORY[0x1F41049F0]();
}

uint64_t sub_1DAF99670()
{
  return MEMORY[0x1F41049F8]();
}

uint64_t sub_1DAF99680()
{
  return MEMORY[0x1F4104BD0]();
}

uint64_t sub_1DAF99690()
{
  return MEMORY[0x1F4183288]();
}

uint64_t sub_1DAF996A0()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1DAF996B0()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1DAF996C0()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1DAF996D0()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1DAF996E0()
{
  return MEMORY[0x1F41835D0]();
}

uint64_t sub_1DAF996F0()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1DAF99700()
{
  return MEMORY[0x1F4183740]();
}

uint64_t sub_1DAF99710()
{
  return MEMORY[0x1F4183748]();
}

uint64_t sub_1DAF99720()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1DAF99730()
{
  return MEMORY[0x1F40E60A8]();
}

uint64_t sub_1DAF99740()
{
  return MEMORY[0x1F40E60C8]();
}

uint64_t sub_1DAF99750()
{
  return MEMORY[0x1F40E60D8]();
}

uint64_t sub_1DAF99760()
{
  return MEMORY[0x1F40E60F0]();
}

uint64_t sub_1DAF99770()
{
  return MEMORY[0x1F40E6110]();
}

uint64_t sub_1DAF99780()
{
  return MEMORY[0x1F40E6128]();
}

uint64_t sub_1DAF99790()
{
  return MEMORY[0x1F40E6130]();
}

uint64_t sub_1DAF997A0()
{
  return MEMORY[0x1F40E6148]();
}

uint64_t sub_1DAF997B0()
{
  return MEMORY[0x1F40E6158]();
}

uint64_t sub_1DAF997C0()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1DAF997D0()
{
  return MEMORY[0x1F40E61A0]();
}

uint64_t sub_1DAF997E0()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1DAF997F0()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1DAF99800()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1DAF99810()
{
  return MEMORY[0x1F40E62C8]();
}

uint64_t sub_1DAF99820()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1DAF99830()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1DAF99840()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1DAF99850()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1DAF99860()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1DAF99870()
{
  return MEMORY[0x1F4183B88]();
}

uint64_t sub_1DAF99880()
{
  return MEMORY[0x1F4183C48]();
}

uint64_t sub_1DAF99890()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t sub_1DAF998A0()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1DAF998B0()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1DAF998C0()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1DAF998D0()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1DAF998E0()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1DAF998F0()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1DAF99900()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1DAF99910()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1DAF99920()
{
  return MEMORY[0x1F4184008]();
}

uint64_t sub_1DAF99930()
{
  return MEMORY[0x1F4184048]();
}

uint64_t sub_1DAF99940()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t sub_1DAF99950()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1DAF99960()
{
  return MEMORY[0x1F41841A8]();
}

uint64_t sub_1DAF99970()
{
  return MEMORY[0x1F41841D0]();
}

uint64_t sub_1DAF99980()
{
  return MEMORY[0x1F4184230]();
}

uint64_t sub_1DAF99990()
{
  return MEMORY[0x1F40E64C0]();
}

uint64_t sub_1DAF999A0()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1DAF999B0()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1DAF999C0()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1DAF999D0()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1DAF999E0()
{
  return MEMORY[0x1F40E67E8]();
}

uint64_t sub_1DAF999F0()
{
  return MEMORY[0x1F40FCF30]();
}

uint64_t sub_1DAF99A00()
{
  return MEMORY[0x1F40E68F8]();
}

uint64_t sub_1DAF99A10()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_1DAF99A20()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1DAF99A30()
{
  return MEMORY[0x1F4188728]();
}

uint64_t sub_1DAF99A40()
{
  return MEMORY[0x1F4188758]();
}

uint64_t sub_1DAF99A50()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1DAF99A60()
{
  return MEMORY[0x1F41847A0]();
}

uint64_t sub_1DAF99A70()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1DAF99A80()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1DAF99A90()
{
  return MEMORY[0x1F40E6BA8]();
}

uint64_t sub_1DAF99AA0()
{
  return MEMORY[0x1F40E6C50]();
}

uint64_t sub_1DAF99AB0()
{
  return MEMORY[0x1F41849C0]();
}

uint64_t sub_1DAF99AC0()
{
  return MEMORY[0x1F4184A78]();
}

uint64_t sub_1DAF99AE0()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1DAF99AF0()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1DAF99B00()
{
  return MEMORY[0x1F4184B30]();
}

uint64_t sub_1DAF99B10()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_1DAF99B20()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_1DAF99B30()
{
  return MEMORY[0x1F4184BA8]();
}

uint64_t sub_1DAF99B40()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_1DAF99B50()
{
  return MEMORY[0x1F4184BC8]();
}

uint64_t sub_1DAF99B60()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1DAF99B70()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1DAF99B80()
{
  return MEMORY[0x1F4184CA0]();
}

uint64_t sub_1DAF99B90()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1DAF99BA0()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1DAF99BB0()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1DAF99BC0()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1DAF99BD0()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1DAF99BE0()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1DAF99BF0()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1DAF99C00()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1DAF99C10()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1DAF99C20()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1DAF99C30()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1DAF99C40()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1DAF99C50()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1DAF99C60()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1DAF99C70()
{
  return MEMORY[0x1F41852B0]();
}

uint64_t sub_1DAF99C80()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1DAF99C90()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1DAF99CA0()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1DAF99CB0()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1DAF99CC0()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1DAF99CE0()
{
  return MEMORY[0x1F4185730]();
}

uint64_t sub_1DAF99CF0()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_1DAF99D00()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1DAF99D10()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1DAF99D20()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1DAF99D30()
{
  return MEMORY[0x1F4185B90]();
}

uint64_t sub_1DAF99D40()
{
  return MEMORY[0x1F4185B98]();
}

uint64_t sub_1DAF99D50()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1DAF99D60()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1DAF99D70()
{
  return MEMORY[0x1F4185EA8]();
}

uint64_t sub_1DAF99D80()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1DAF99D90()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1DAF99DA0()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_1DAF99DB0()
{
  return MEMORY[0x1F4185EF8]();
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

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CUIKAdjustedColorForColor()
{
  return MEMORY[0x1F410F6B8]();
}

uint64_t CUIKBackgroundColorForCalendarColorWithOpaqueForStyle()
{
  return MEMORY[0x1F410F6D0]();
}

uint64_t CUIKColorDarkenedToPercentageWithFinalAlpha()
{
  return MEMORY[0x1F410F6F8]();
}

uint64_t CUIKCreateStripedImage()
{
  return MEMORY[0x1F410F718]();
}

uint64_t CUIKDeclinedEventBackgroundColor()
{
  return MEMORY[0x1F410F738]();
}

uint64_t CUIKLightStripeColorForColor()
{
  return MEMORY[0x1F410F800]();
}

uint64_t CUIKOccurrenceLeadingIconAlphaScale()
{
  return MEMORY[0x1F410F8A8]();
}

uint64_t CUIKOccurrenceSecondaryTextColor()
{
  return MEMORY[0x1F410F8B0]();
}

uint64_t CUIKOccurrenceTextColor()
{
  return MEMORY[0x1F410F8B8]();
}

uint64_t _AXSPrefersHorizontalTextLayout()
{
  return MEMORY[0x1F4178E10]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

{
  return MEMORY[0x1F41813D0]();
}

{
  return MEMORY[0x1F41813F0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1F4186638]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x1F4186640]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
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

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}