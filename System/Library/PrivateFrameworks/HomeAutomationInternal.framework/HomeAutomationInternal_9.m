uint64_t sub_22E6B830C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void v6[5];
  void v7[5];

  v0 = sub_22E6CD010();
  swift_allocObject();
  v1 = sub_22E6CD000();
  v6[3] = v0;
  v6[4] = MEMORY[0x263F6FB30];
  v6[0] = v1;
  sub_22E6CD2E0();
  swift_allocObject();
  sub_22E6CD000();
  v2 = sub_22E6CC870();
  swift_allocObject();
  v3 = sub_22E6CC860();
  v7[3] = v2;
  v7[4] = MEMORY[0x263F6F600];
  v7[0] = v3;
  v4 = sub_22E171898(0);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  return v4;
}

id sub_22E6B841C(void *a1)
{
  id result = objc_msgSend(a1, sel_filters);
  if (result)
  {
    v3 = result;
    type metadata accessor for HomeFilter();
    unint64_t v4 = sub_22E6D0430();

    if (v4 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v6 = sub_22E6D0CE0();
      swift_bridgeObjectRelease();
      if (v6)
      {
LABEL_4:
        BOOL v5 = sub_22E6338F8(v4);
        swift_bridgeObjectRelease();
        if (v5) {
          return (id)(objc_msgSend(a1, sel_discoveryType) == (id)1);
        }
        return 0;
      }
    }
    else if (*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_4;
    }
    swift_bridgeObjectRelease();
    return 0;
  }
  return result;
}

uint64_t sub_22E6B84FC()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22E6B853C()
{
  return sub_22E6B7AC8(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t AutomateHomeTriggerUnsupportedReason.init(rawValue:)(uint64_t a1)
{
  return sub_22E6B98F8(a1);
}

uint64_t AutomateHomeAutomatableTaskUnsupportedReason.init(rawValue:)(uint64_t a1)
{
  return sub_22E6B990C(a1);
}

char *AutomateHomeIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  BOOL v5 = (char *)objc_msgSend(objc_allocWithZone(v2), sel_init);
  uint64_t v6 = &v5[OBJC_IVAR___AutomateHomeIntentResponse_code];
  swift_beginAccess();
  *(void *)uint64_t v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id AutomateHomeIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AutomateHomeIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

id AutomateHomeIntent.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for AutomateHomeIntent();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id AutomateHomeIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithIdentifier_backingStore_, v6, a3);

  return v7;
}

id AutomateHomeIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    objc_super v5 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for AutomateHomeIntent();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithIdentifier_backingStore_, v5, a3);

  return v6;
}

id AutomateHomeIntent.__allocating_init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  objc_super v8 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9 = (void *)sub_22E6D0030();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  id v10 = objc_msgSend(objc_allocWithZone(v5), sel_initWithDomain_verb_parametersByName_, v7, v8, v9);

  return v10;
}

id AutomateHomeIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  objc_super v8 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9 = (void *)sub_22E6D0030();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  v12.receiver = v5;
  v12.super_class = (Class)type metadata accessor for AutomateHomeIntent();
  id v10 = objc_msgSendSuper2(&v12, sel_initWithDomain_verb_parametersByName_, v7, v8, v9);

  return v10;
}

id AutomateHomeIntent.__deallocating_deinit()
{
  return sub_22E6B98C0(type metadata accessor for AutomateHomeIntent);
}

unint64_t AutomateHomeIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_22E6B9944(a1);
}

unint64_t sub_22E6B8BD8@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_22E6B9944(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_22E6B8C0C@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_automationIdentifier);
  if (v3)
  {
    char v4 = v3;
    sub_22E6CC210();

    uint64_t v5 = sub_22E6CC230();
    id v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
    uint64_t v7 = v5;
    uint64_t v8 = a2;
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = sub_22E6CC230();
    id v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56);
    uint64_t v7 = v10;
    uint64_t v8 = a2;
    uint64_t v9 = 1;
  }

  return v6(v8, v9, 1, v7);
}

void sub_22E6B8CD4(uint64_t a1, void **a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685DB490);
  MEMORY[0x270FA5388](v4 - 8, v5);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E4D6E44(a1, (uint64_t)v7);
  uint64_t v8 = *a2;
  uint64_t v9 = sub_22E6CC230();
  uint64_t v10 = *(void *)(v9 - 8);
  v11 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v7, 1, v9) != 1)
  {
    v11 = (void *)sub_22E6CC1F0();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
  }
  objc_msgSend(v8, sel_setAutomationIdentifier_, v11);
}

void sub_22E6B8E00(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_automatedEntityIdentifiers);
  if (v3)
  {
    uint64_t v4 = v3;
    sub_22E6CC230();
    uint64_t v5 = sub_22E6D0430();
  }
  else
  {
    uint64_t v5 = 0;
  }
  *a2 = v5;
}

void sub_22E6B8E70(void *a1, void **a2)
{
  objc_super v2 = *a2;
  if (*a1)
  {
    sub_22E6CC230();
    uint64_t v3 = sub_22E6D0420();
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  objc_msgSend(v2, sel_setAutomatedEntityIdentifiers_);
}

uint64_t sub_22E6B8F30()
{
  uint64_t v1 = v0 + OBJC_IVAR___AutomateHomeIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

char *AutomateHomeIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  uint64_t v5 = (char *)objc_msgSend(v2, sel_init);
  uint64_t v6 = &v5[OBJC_IVAR___AutomateHomeIntentResponse_code];
  swift_beginAccess();
  *(void *)uint64_t v6 = a1;
  uint64_t v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id AutomateHomeIntentResponse.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id AutomateHomeIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___AutomateHomeIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AutomateHomeIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

id AutomateHomeIntentResponse.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id AutomateHomeIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___AutomateHomeIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for AutomateHomeIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id AutomateHomeIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithBackingStore_, a1);

  return v3;
}

id AutomateHomeIntentResponse.init(backingStore:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___AutomateHomeIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for AutomateHomeIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithBackingStore_, a1);

  return v3;
}

id sub_22E6B9308(char *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  *(void *)&a1[OBJC_IVAR___AutomateHomeIntentResponse_code] = 0;
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for AutomateHomeIntentResponse();
  return objc_msgSendSuper2(&v7, *a4, a3);
}

id AutomateHomeIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  if (a1)
  {
    objc_super v2 = (void *)sub_22E6D0030();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v2 = 0;
  }
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithPropertiesByName_, v2);

  return v3;
}

id AutomateHomeIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___AutomateHomeIntentResponse_code] = 0;
  if (a1)
  {
    objc_super v2 = (void *)sub_22E6D0030();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v2 = 0;
  }
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for AutomateHomeIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithPropertiesByName_, v2);

  if (v3) {
  return v3;
  }
}

id AutomateHomeIntentResponse.__deallocating_deinit()
{
  return sub_22E6B98C0(type metadata accessor for AutomateHomeIntentResponse);
}

uint64_t sub_22E6B9508@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_22E6B98F8(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id AutomateHomeTriggerResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  return sub_22E6B96F8(a1, a2, (uint64_t (*)(uint64_t))type metadata accessor for AutomateHomeTriggerResolutionResult);
}

id AutomateHomeTriggerResolutionResult.__deallocating_deinit()
{
  return sub_22E6B98C0(type metadata accessor for AutomateHomeTriggerResolutionResult);
}

uint64_t sub_22E6B95CC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_22E6B990C(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id sub_22E6B9600(uint64_t a1)
{
  id v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupportedWithReason_, a1);

  return v1;
}

id _s22HomeAutomationInternal08AutomateA23TriggerResolutionResultC14JSONDictionary6intentACSgSDySSypG_So8INIntentCtcfC_0(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  objc_super v5 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id AutomateHomeAutomatableTaskResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  return sub_22E6B96F8(a1, a2, (uint64_t (*)(uint64_t))type metadata accessor for AutomateHomeAutomatableTaskResolutionResult);
}

id sub_22E6B96F8(uint64_t a1, void *a2, uint64_t (*a3)(uint64_t))
{
  id v6 = (void *)sub_22E6D0030();
  uint64_t v7 = swift_bridgeObjectRelease();
  v11.receiver = v3;
  v11.super_class = (Class)a3(v7);
  id v8 = objc_msgSendSuper2(&v11, sel_initWithJSONDictionary_forIntent_, v6, a2);

  id v9 = v8;
  if (v9) {

  }
  return v9;
}

id sub_22E6B97C0(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t (*a5)(uint64_t))
{
  sub_22E6D0050();
  id v8 = a4;
  id v9 = (void *)sub_22E6D0030();
  uint64_t v10 = swift_bridgeObjectRelease();
  v14.receiver = a1;
  v14.super_class = (Class)a5(v10);
  id v11 = objc_msgSendSuper2(&v14, sel_initWithJSONDictionary_forIntent_, v9, v8);

  id v12 = v11;
  if (v12) {

  }
  return v12;
}

id AutomateHomeAutomatableTaskResolutionResult.__deallocating_deinit()
{
  return sub_22E6B98C0(type metadata accessor for AutomateHomeAutomatableTaskResolutionResult);
}

id sub_22E6B98C0(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_22E6B98F8(uint64_t result)
{
  if ((unint64_t)(result - 7) < 0xFFFFFFFFFFFFFFFALL) {
    return 0;
  }
  return result;
}

uint64_t sub_22E6B990C(uint64_t result)
{
  if ((unint64_t)(result - 9) < 0xFFFFFFFFFFFFFFF8) {
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for AutomateHomeIntent()
{
  return self;
}

unint64_t sub_22E6B9944(unint64_t result)
{
  if (result - 100 >= 2) {
    unint64_t v1 = 0;
  }
  else {
    unint64_t v1 = result;
  }
  if (result >= 7) {
    return v1;
  }
  return result;
}

uint64_t type metadata accessor for AutomateHomeIntentResponse()
{
  return self;
}

uint64_t type metadata accessor for AutomateHomeTriggerResolutionResult()
{
  return self;
}

uint64_t type metadata accessor for AutomateHomeAutomatableTaskResolutionResult()
{
  return self;
}

unint64_t sub_22E6B99D8()
{
  unint64_t result = qword_2685E2148;
  if (!qword_2685E2148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2685E2148);
  }
  return result;
}

unint64_t sub_22E6B9A30()
{
  unint64_t result = qword_2685E2150;
  if (!qword_2685E2150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2685E2150);
  }
  return result;
}

unint64_t sub_22E6B9A88()
{
  unint64_t result = qword_2685E2158;
  if (!qword_2685E2158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2685E2158);
  }
  return result;
}

char *keypath_get_selector_trigger()
{
  return sel_trigger;
}

id sub_22E6B9AE8@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_trigger);
  *a2 = result;
  return result;
}

id sub_22E6B9B24(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTrigger_, *a1);
}

char *keypath_get_selector_automatableTask()
{
  return sel_automatableTask;
}

id sub_22E6B9B44@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_automatableTask);
  *a2 = result;
  return result;
}

id sub_22E6B9B80(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setAutomatableTask_, *a1);
}

char *keypath_get_selector_automationIdentifier()
{
  return sel_automationIdentifier;
}

char *keypath_get_selector_automatedEntityIdentifiers()
{
  return sel_automatedEntityIdentifiers;
}

uint64_t sub_22E6B9BBC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v3 = (void *)(*a1 + OBJC_IVAR___AutomateHomeIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_22E6B9C10(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  objc_super v3 = (void *)(*a2 + OBJC_IVAR___AutomateHomeIntentResponse_code);
  uint64_t result = swift_beginAccess();
  void *v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for AutomateHomeIntentResponseCode()
{
  return &type metadata for AutomateHomeIntentResponseCode;
}

uint64_t method lookup function for AutomateHomeIntentResponse(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AutomateHomeIntentResponse);
}

uint64_t dispatch thunk of AutomateHomeIntentResponse.code.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

ValueMetadata *type metadata accessor for AutomateHomeTriggerUnsupportedReason()
{
  return &type metadata for AutomateHomeTriggerUnsupportedReason;
}

uint64_t method lookup function for AutomateHomeTriggerResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AutomateHomeTriggerResolutionResult);
}

uint64_t dispatch thunk of static AutomateHomeTriggerResolutionResult.unsupported(forReason:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

ValueMetadata *type metadata accessor for AutomateHomeAutomatableTaskUnsupportedReason()
{
  return &type metadata for AutomateHomeAutomatableTaskUnsupportedReason;
}

uint64_t method lookup function for AutomateHomeAutomatableTaskResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AutomateHomeAutomatableTaskResolutionResult);
}

uint64_t dispatch thunk of static AutomateHomeAutomatableTaskResolutionResult.unsupported(forReason:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

char *DiscoverHomeIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_super v5 = (char *)objc_msgSend(objc_allocWithZone(v2), sel_init);
  id v6 = &v5[OBJC_IVAR___DiscoverHomeIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  uint64_t v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id DiscoverHomeIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DiscoverHomeIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

id DiscoverHomeIntent.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for DiscoverHomeIntent();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id DiscoverHomeIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = v3;
  if (a2)
  {
    id v6 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithIdentifier_backingStore_, v6, a3);

  return v7;
}

id DiscoverHomeIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    objc_super v5 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for DiscoverHomeIntent();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithIdentifier_backingStore_, v5, a3);

  return v6;
}

id DiscoverHomeIntent.__allocating_init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  objc_super v8 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  if (a5)
  {
    id v9 = (void *)sub_22E6D0030();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = 0;
  }
  id v10 = objc_msgSend(objc_allocWithZone(v5), sel_initWithDomain_verb_parametersByName_, v7, v8, v9);

  return v10;
}

id DiscoverHomeIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  objc_super v8 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  if (a5)
  {
    id v9 = (void *)sub_22E6D0030();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = 0;
  }
  v12.receiver = v5;
  v12.super_class = (Class)type metadata accessor for DiscoverHomeIntent();
  id v10 = objc_msgSendSuper2(&v12, sel_initWithDomain_verb_parametersByName_, v7, v8, v9);

  return v10;
}

id DiscoverHomeIntent.__deallocating_deinit()
{
  return sub_22E6BAD94(type metadata accessor for DiscoverHomeIntent);
}

unint64_t DiscoverHomeIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_22E6BADCC(a1);
}

unint64_t sub_22E6BA398@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_22E6BADCC(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_22E6BA3CC(id *a1@<X0>, SEL *a2@<X3>, void (*a3)(void)@<X4>, uint64_t *a4@<X8>)
{
  id v6 = [*a1 *a2];
  if (v6)
  {
    id v7 = v6;
    a3(0);
    uint64_t v8 = sub_22E6D0430();
  }
  else
  {
    uint64_t v8 = 0;
  }
  *a4 = v8;
}

void sub_22E6BA440(void *a1, void **a2, uint64_t a3, uint64_t a4, void (*a5)(void), SEL *a6)
{
  id v7 = *a2;
  if (*a1)
  {
    a5(0);
    uint64_t v8 = sub_22E6D0420();
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = (id)v8;
  [v7 *a6];
}

uint64_t sub_22E6BA50C()
{
  uint64_t v1 = v0 + OBJC_IVAR___DiscoverHomeIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

char *DiscoverHomeIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_super v5 = (char *)objc_msgSend(v2, sel_init);
  id v6 = &v5[OBJC_IVAR___DiscoverHomeIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  id v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

uint64_t type metadata accessor for DiscoverHomeIntent()
{
  return self;
}

id DiscoverHomeIntentResponse.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id DiscoverHomeIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___DiscoverHomeIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DiscoverHomeIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

id DiscoverHomeIntentResponse.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id DiscoverHomeIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___DiscoverHomeIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for DiscoverHomeIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id DiscoverHomeIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithBackingStore_, a1);

  return v3;
}

id DiscoverHomeIntentResponse.init(backingStore:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___DiscoverHomeIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for DiscoverHomeIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithBackingStore_, a1);

  return v3;
}

id sub_22E6BA908(char *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  *(void *)&a1[OBJC_IVAR___DiscoverHomeIntentResponse_code] = 0;
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for DiscoverHomeIntentResponse();
  return objc_msgSendSuper2(&v7, *a4, a3);
}

id DiscoverHomeIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  if (a1)
  {
    objc_super v2 = (void *)sub_22E6D0030();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v2 = 0;
  }
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithPropertiesByName_, v2);

  return v3;
}

id DiscoverHomeIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___DiscoverHomeIntentResponse_code] = 0;
  if (a1)
  {
    objc_super v2 = (void *)sub_22E6D0030();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v2 = 0;
  }
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for DiscoverHomeIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithPropertiesByName_, v2);

  if (v3) {
  return v3;
  }
}

id DiscoverHomeIntentResponse.__deallocating_deinit()
{
  return sub_22E6BAD94(type metadata accessor for DiscoverHomeIntentResponse);
}

BOOL DiscoverHomeFiltersUnsupportedReason.init(rawValue:)(uint64_t a1)
{
  return a1 == 1;
}

void *sub_22E6BAB18@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2 = *result != 1;
  *(void *)a2 = *result == 1;
  *(unsigned char *)(a2 + 8) = v2;
  return result;
}

id DiscoverHomeFiltersResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  objc_super v5 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id DiscoverHomeFiltersResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for DiscoverHomeFiltersResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

id DiscoverHomeFiltersResolutionResult.__deallocating_deinit()
{
  return sub_22E6BAD94(type metadata accessor for DiscoverHomeFiltersResolutionResult);
}

id sub_22E6BAD94(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

unint64_t sub_22E6BADCC(unint64_t result)
{
  if (result == 100) {
    uint64_t v1 = 100;
  }
  else {
    uint64_t v1 = 0;
  }
  if (result >= 7) {
    return v1;
  }
  return result;
}

uint64_t type metadata accessor for DiscoverHomeIntentResponse()
{
  return self;
}

uint64_t type metadata accessor for DiscoverHomeFiltersResolutionResult()
{
  return self;
}

unint64_t sub_22E6BAE38()
{
  unint64_t result = qword_2685E2168;
  if (!qword_2685E2168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2685E2168);
  }
  return result;
}

unint64_t sub_22E6BAE90()
{
  unint64_t result = qword_2685E2170;
  if (!qword_2685E2170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2685E2170);
  }
  return result;
}

char *keypath_get_selector_discoveryType()
{
  return sel_discoveryType;
}

id sub_22E6BAEF0@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_discoveryType);
  *a2 = result;
  return result;
}

id sub_22E6BAF24(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDiscoveryType_, *a1);
}

char *keypath_get_selector_filters()
{
  return sel_filters;
}

void sub_22E6BAF44(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_22E6BAF78(void *a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_matchedEntities()
{
  return sel_matchedEntities;
}

void sub_22E6BAFB8(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_22E6BAFEC(void *a1, void **a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_22E6BB020@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v3 = (void *)(*a1 + OBJC_IVAR___DiscoverHomeIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_22E6BB074(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  objc_super v3 = (void *)(*a2 + OBJC_IVAR___DiscoverHomeIntentResponse_code);
  uint64_t result = swift_beginAccess();
  void *v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for DiscoverHomeIntentResponseCode()
{
  return &type metadata for DiscoverHomeIntentResponseCode;
}

uint64_t method lookup function for DiscoverHomeIntentResponse(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DiscoverHomeIntentResponse);
}

uint64_t dispatch thunk of DiscoverHomeIntentResponse.code.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

ValueMetadata *type metadata accessor for DiscoverHomeFiltersUnsupportedReason()
{
  return &type metadata for DiscoverHomeFiltersUnsupportedReason;
}

uint64_t method lookup function for DiscoverHomeFiltersResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DiscoverHomeFiltersResolutionResult);
}

uint64_t dispatch thunk of static DiscoverHomeFiltersResolutionResult.unsupported(forReason:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

char *ShowHomeIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  id v5 = (char *)objc_msgSend(objc_allocWithZone(v2), sel_init);
  id v6 = &v5[OBJC_IVAR___ShowHomeIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  objc_super v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

void sub_22E6BB1FC(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_filters);
  if (v3)
  {
    id v4 = v3;
    type metadata accessor for HomeFilter();
    uint64_t v5 = sub_22E6D0430();
  }
  else
  {
    uint64_t v5 = 0;
  }
  *a2 = v5;
}

void sub_22E6BB26C(void *a1, void **a2)
{
  uint64_t v2 = *a2;
  if (*a1)
  {
    type metadata accessor for HomeFilter();
    uint64_t v3 = sub_22E6D0420();
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  objc_msgSend(v2, sel_setFilters_);
}

id ShowHomeIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ShowHomeIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

id ShowHomeIntent.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ShowHomeIntent();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id ShowHomeIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = v3;
  if (a2)
  {
    id v6 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithIdentifier_backingStore_, v6, a3);

  return v7;
}

id ShowHomeIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    objc_super v5 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for ShowHomeIntent();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithIdentifier_backingStore_, v5, a3);

  return v6;
}

id ShowHomeIntent.__allocating_init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  objc_super v8 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  if (a5)
  {
    id v9 = (void *)sub_22E6D0030();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = 0;
  }
  id v10 = objc_msgSend(objc_allocWithZone(v5), sel_initWithDomain_verb_parametersByName_, v7, v8, v9);

  return v10;
}

id ShowHomeIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  objc_super v8 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  if (a5)
  {
    id v9 = (void *)sub_22E6D0030();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = 0;
  }
  v12.receiver = v5;
  v12.super_class = (Class)type metadata accessor for ShowHomeIntent();
  id v10 = objc_msgSendSuper2(&v12, sel_initWithDomain_verb_parametersByName_, v7, v8, v9);

  return v10;
}

id ShowHomeIntent.__deallocating_deinit()
{
  return sub_22E6BC264(type metadata accessor for ShowHomeIntent);
}

unint64_t ShowHomeIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_22E6BC29C(a1);
}

unint64_t sub_22E6BB8A4@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_22E6BC29C(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_22E6BB8D8(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_punchOutURL);
  if (v3)
  {
    char v4 = v3;
    uint64_t v5 = sub_22E6D0140();
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

void sub_22E6BB940(uint64_t a1, void **a2)
{
  objc_super v2 = *a2;
  if (*(void *)(a1 + 8)) {
    uint64_t v3 = sub_22E6D0110();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  objc_msgSend(v2, sel_setPunchOutURL_);
}

uint64_t sub_22E6BB9F8()
{
  uint64_t v1 = v0 + OBJC_IVAR___ShowHomeIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

char *ShowHomeIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  uint64_t v5 = (char *)objc_msgSend(v2, sel_init);
  uint64_t v6 = &v5[OBJC_IVAR___ShowHomeIntentResponse_code];
  swift_beginAccess();
  *(void *)uint64_t v6 = a1;
  uint64_t v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

uint64_t type metadata accessor for ShowHomeIntent()
{
  return self;
}

id ShowHomeIntentResponse.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id ShowHomeIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___ShowHomeIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ShowHomeIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

id ShowHomeIntentResponse.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id ShowHomeIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___ShowHomeIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ShowHomeIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id ShowHomeIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithBackingStore_, a1);

  return v3;
}

id ShowHomeIntentResponse.init(backingStore:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___ShowHomeIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ShowHomeIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithBackingStore_, a1);

  return v3;
}

id sub_22E6BBDF4(char *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  *(void *)&a1[OBJC_IVAR___ShowHomeIntentResponse_code] = 0;
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for ShowHomeIntentResponse();
  return objc_msgSendSuper2(&v7, *a4, a3);
}

id ShowHomeIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  if (a1)
  {
    objc_super v2 = (void *)sub_22E6D0030();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v2 = 0;
  }
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithPropertiesByName_, v2);

  return v3;
}

id ShowHomeIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___ShowHomeIntentResponse_code] = 0;
  if (a1)
  {
    objc_super v2 = (void *)sub_22E6D0030();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v2 = 0;
  }
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ShowHomeIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithPropertiesByName_, v2);

  if (v3) {
  return v3;
  }
}

id ShowHomeIntentResponse.__deallocating_deinit()
{
  return sub_22E6BC264(type metadata accessor for ShowHomeIntentResponse);
}

BOOL ShowHomeFiltersUnsupportedReason.init(rawValue:)(uint64_t a1)
{
  return a1 == 1;
}

id ShowHomeFiltersResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  objc_super v5 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id ShowHomeFiltersResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for ShowHomeFiltersResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

id ShowHomeFiltersResolutionResult.__deallocating_deinit()
{
  return sub_22E6BC264(type metadata accessor for ShowHomeFiltersResolutionResult);
}

id sub_22E6BC264(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

unint64_t sub_22E6BC29C(unint64_t result)
{
  if (result - 100 >= 3) {
    unint64_t v1 = 0;
  }
  else {
    unint64_t v1 = result;
  }
  if (result >= 7) {
    return v1;
  }
  return result;
}

uint64_t type metadata accessor for ShowHomeIntentResponse()
{
  return self;
}

uint64_t type metadata accessor for ShowHomeFiltersResolutionResult()
{
  return self;
}

unint64_t sub_22E6BC30C()
{
  unint64_t result = qword_2685E2180;
  if (!qword_2685E2180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2685E2180);
  }
  return result;
}

unint64_t sub_22E6BC364()
{
  unint64_t result = qword_2685E2188;
  if (!qword_2685E2188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2685E2188);
  }
  return result;
}

char *keypath_get_selector_dateTimeRange()
{
  return sel_dateTimeRange;
}

id sub_22E6BC3CC@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_dateTimeRange);
  *a2 = result;
  return result;
}

id sub_22E6BC408(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDateTimeRange_, *a1);
}

char *keypath_get_selector_punchOutURL()
{
  return sel_punchOutURL;
}

uint64_t sub_22E6BC430@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v3 = (void *)(*a1 + OBJC_IVAR___ShowHomeIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_22E6BC484(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  objc_super v3 = (void *)(*a2 + OBJC_IVAR___ShowHomeIntentResponse_code);
  uint64_t result = swift_beginAccess();
  void *v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for ShowHomeIntentResponseCode()
{
  return &type metadata for ShowHomeIntentResponseCode;
}

uint64_t method lookup function for ShowHomeIntentResponse(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ShowHomeIntentResponse);
}

uint64_t dispatch thunk of ShowHomeIntentResponse.code.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

ValueMetadata *type metadata accessor for ShowHomeFiltersUnsupportedReason()
{
  return &type metadata for ShowHomeFiltersUnsupportedReason;
}

uint64_t method lookup function for ShowHomeFiltersResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ShowHomeFiltersResolutionResult);
}

uint64_t dispatch thunk of static ShowHomeFiltersResolutionResult.unsupported(forReason:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

id sub_22E6BC574()
{
  id v1 = objc_msgSend(*v0, sel_userTask);

  return v1;
}

char *ControlHomeIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  id v5 = (char *)objc_msgSend(objc_allocWithZone(v2), sel_init);
  id v6 = &v5[OBJC_IVAR___ControlHomeIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  objc_super v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

unint64_t ControlHomeIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_22E6BD65C(a1);
}

uint64_t ControlHomeFiltersUnsupportedReason.init(rawValue:)(uint64_t a1)
{
  return sub_22E6BD678(a1);
}

id ControlHomeIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ControlHomeIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

id ControlHomeIntent.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ControlHomeIntent();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id ControlHomeIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = v3;
  if (a2)
  {
    id v6 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithIdentifier_backingStore_, v6, a3);

  return v7;
}

id ControlHomeIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    objc_super v5 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for ControlHomeIntent();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithIdentifier_backingStore_, v5, a3);

  return v6;
}

id ControlHomeIntent.__allocating_init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  objc_super v8 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  if (a5)
  {
    id v9 = (void *)sub_22E6D0030();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = 0;
  }
  id v10 = objc_msgSend(objc_allocWithZone(v5), sel_initWithDomain_verb_parametersByName_, v7, v8, v9);

  return v10;
}

id ControlHomeIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  objc_super v8 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  if (a5)
  {
    id v9 = (void *)sub_22E6D0030();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = 0;
  }
  v12.receiver = v5;
  v12.super_class = (Class)type metadata accessor for ControlHomeIntent();
  id v10 = objc_msgSendSuper2(&v12, sel_initWithDomain_verb_parametersByName_, v7, v8, v9);

  return v10;
}

id ControlHomeIntent.__deallocating_deinit()
{
  return sub_22E6BD624(type metadata accessor for ControlHomeIntent);
}

unint64_t sub_22E6BCC28@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_22E6BD65C(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_22E6BCC5C(id *a1@<X0>, SEL *a2@<X3>, void (*a3)(void)@<X4>, uint64_t *a4@<X8>)
{
  id v6 = [*a1 *a2];
  if (v6)
  {
    id v7 = v6;
    a3(0);
    uint64_t v8 = sub_22E6D0430();
  }
  else
  {
    uint64_t v8 = 0;
  }
  *a4 = v8;
}

void sub_22E6BCCD0(void *a1, void **a2, uint64_t a3, uint64_t a4, void (*a5)(void), SEL *a6)
{
  id v7 = *a2;
  if (*a1)
  {
    a5(0);
    uint64_t v8 = sub_22E6D0420();
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = (id)v8;
  [v7 *a6];
}

uint64_t sub_22E6BCD9C()
{
  uint64_t v1 = v0 + OBJC_IVAR___ControlHomeIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

char *ControlHomeIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_super v5 = (char *)objc_msgSend(v2, sel_init);
  id v6 = &v5[OBJC_IVAR___ControlHomeIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  id v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id ControlHomeIntentResponse.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id ControlHomeIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___ControlHomeIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ControlHomeIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

id ControlHomeIntentResponse.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id ControlHomeIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___ControlHomeIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ControlHomeIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id ControlHomeIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithBackingStore_, a1);

  return v3;
}

id ControlHomeIntentResponse.init(backingStore:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___ControlHomeIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ControlHomeIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithBackingStore_, a1);

  return v3;
}

id sub_22E6BD174(char *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  *(void *)&a1[OBJC_IVAR___ControlHomeIntentResponse_code] = 0;
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for ControlHomeIntentResponse();
  return objc_msgSendSuper2(&v7, *a4, a3);
}

id ControlHomeIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  if (a1)
  {
    objc_super v2 = (void *)sub_22E6D0030();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v2 = 0;
  }
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithPropertiesByName_, v2);

  return v3;
}

id ControlHomeIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___ControlHomeIntentResponse_code] = 0;
  if (a1)
  {
    objc_super v2 = (void *)sub_22E6D0030();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v2 = 0;
  }
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ControlHomeIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithPropertiesByName_, v2);

  if (v3) {
  return v3;
  }
}

id ControlHomeIntentResponse.__deallocating_deinit()
{
  return sub_22E6BD624(type metadata accessor for ControlHomeIntentResponse);
}

BOOL ControlHomeUserTaskUnsupportedReason.init(rawValue:)(uint64_t a1)
{
  return a1 == 1;
}

id ControlHomeUserTaskResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  return sub_22E6BD45C(a1, a2, (uint64_t (*)(uint64_t))type metadata accessor for ControlHomeUserTaskResolutionResult);
}

id ControlHomeUserTaskResolutionResult.__deallocating_deinit()
{
  return sub_22E6BD624(type metadata accessor for ControlHomeUserTaskResolutionResult);
}

uint64_t sub_22E6BD3CC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_22E6BD678(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id ControlHomeFiltersResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  return sub_22E6BD45C(a1, a2, (uint64_t (*)(uint64_t))type metadata accessor for ControlHomeFiltersResolutionResult);
}

id sub_22E6BD45C(uint64_t a1, void *a2, uint64_t (*a3)(uint64_t))
{
  id v6 = (void *)sub_22E6D0030();
  uint64_t v7 = swift_bridgeObjectRelease();
  v11.receiver = v3;
  v11.super_class = (Class)a3(v7);
  id v8 = objc_msgSendSuper2(&v11, sel_initWithJSONDictionary_forIntent_, v6, a2);

  id v9 = v8;
  if (v9) {

  }
  return v9;
}

id sub_22E6BD524(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t (*a5)(uint64_t))
{
  sub_22E6D0050();
  id v8 = a4;
  id v9 = (void *)sub_22E6D0030();
  uint64_t v10 = swift_bridgeObjectRelease();
  v14.receiver = a1;
  v14.super_class = (Class)a5(v10);
  id v11 = objc_msgSendSuper2(&v14, sel_initWithJSONDictionary_forIntent_, v9, v8);

  id v12 = v11;
  if (v12) {

  }
  return v12;
}

id ControlHomeFiltersResolutionResult.__deallocating_deinit()
{
  return sub_22E6BD624(type metadata accessor for ControlHomeFiltersResolutionResult);
}

id sub_22E6BD624(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

unint64_t sub_22E6BD65C(unint64_t result)
{
  if (result - 100 >= 0xE && result >= 7) {
    return 0;
  }
  return result;
}

uint64_t sub_22E6BD678(uint64_t result)
{
  if ((unint64_t)(result - 5) < 0xFFFFFFFFFFFFFFFCLL) {
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for ControlHomeIntent()
{
  return self;
}

uint64_t type metadata accessor for ControlHomeIntentResponse()
{
  return self;
}

uint64_t type metadata accessor for ControlHomeUserTaskResolutionResult()
{
  return self;
}

uint64_t type metadata accessor for ControlHomeFiltersResolutionResult()
{
  return self;
}

unint64_t sub_22E6BD720()
{
  unint64_t result = qword_2685E2198;
  if (!qword_2685E2198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2685E2198);
  }
  return result;
}

unint64_t sub_22E6BD778()
{
  unint64_t result = qword_2685E21A0;
  if (!qword_2685E21A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2685E21A0);
  }
  return result;
}

unint64_t sub_22E6BD7D0()
{
  unint64_t result = qword_2685E21A8;
  if (!qword_2685E21A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2685E21A8);
  }
  return result;
}

char *keypath_get_selector_userTask()
{
  return sel_userTask;
}

id sub_22E6BD830@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_userTask);
  *a2 = result;
  return result;
}

id sub_22E6BD86C(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setUserTask_, *a1);
}

void sub_22E6BD880(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_22E6BD8B4(void *a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_time()
{
  return sel_time;
}

id sub_22E6BD8F4@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_time);
  *a2 = result;
  return result;
}

id sub_22E6BD930(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTime_, *a1);
}

char *keypath_get_selector_entityResponses()
{
  return sel_entityResponses;
}

void sub_22E6BD950(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_22E6BD984(void *a1, void **a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_22E6BD9B8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v3 = (void *)(*a1 + OBJC_IVAR___ControlHomeIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_22E6BDA0C(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  objc_super v3 = (void *)(*a2 + OBJC_IVAR___ControlHomeIntentResponse_code);
  uint64_t result = swift_beginAccess();
  void *v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for ControlHomeIntentResponseCode()
{
  return &type metadata for ControlHomeIntentResponseCode;
}

uint64_t method lookup function for ControlHomeIntentResponse(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ControlHomeIntentResponse);
}

uint64_t dispatch thunk of ControlHomeIntentResponse.code.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

ValueMetadata *type metadata accessor for ControlHomeUserTaskUnsupportedReason()
{
  return &type metadata for ControlHomeUserTaskUnsupportedReason;
}

uint64_t method lookup function for ControlHomeUserTaskResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ControlHomeUserTaskResolutionResult);
}

uint64_t dispatch thunk of static ControlHomeUserTaskResolutionResult.unsupported(forReason:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

ValueMetadata *type metadata accessor for ControlHomeFiltersUnsupportedReason()
{
  return &type metadata for ControlHomeFiltersUnsupportedReason;
}

uint64_t method lookup function for ControlHomeFiltersResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ControlHomeFiltersResolutionResult);
}

uint64_t dispatch thunk of static ControlHomeFiltersResolutionResult.unsupported(forReason:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

unint64_t TriggerEvent.init(rawValue:)(unint64_t a1)
{
  return sub_22E6BDEB8(a1);
}

unint64_t sub_22E6BDB5C@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_22E6BDEB8(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id sub_22E6BDB90(uint64_t a1)
{
  return sub_22E6BDBE8(a1, (SEL *)&selRef_successWithResolvedValue_);
}

id sub_22E6BDBDC(uint64_t a1)
{
  return sub_22E6BDBE8(a1, (SEL *)&selRef_confirmationRequiredWithValueToConfirm_);
}

id sub_22E6BDBE8(uint64_t a1, SEL *a2)
{
  id v2 = objc_msgSend((id)swift_getObjCClassFromMetadata(), *a2, a1);

  return v2;
}

id TriggerEventResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  objc_super v5 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id TriggerEventResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for TriggerEventResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

id TriggerEventResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TriggerEventResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_22E6BDEB8(unint64_t result)
{
  if (result > 4) {
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for TriggerEventResolutionResult()
{
  return self;
}

unint64_t sub_22E6BDEF0()
{
  unint64_t result = qword_2685E21B0;
  if (!qword_2685E21B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2685E21B0);
  }
  return result;
}

ValueMetadata *type metadata accessor for TriggerEvent()
{
  return &type metadata for TriggerEvent;
}

uint64_t method lookup function for TriggerEventResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TriggerEventResolutionResult);
}

uint64_t dispatch thunk of static TriggerEventResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static TriggerEventResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

unint64_t TriggerType.init(rawValue:)(unint64_t result)
{
  if (result > 2) {
    return 0;
  }
  return result;
}

uint64_t *sub_22E6BDFA8@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  BOOL v3 = (unint64_t)*result > 2;
  if ((unint64_t)*result > 2) {
    uint64_t v2 = 0;
  }
  *(void *)a2 = v2;
  *(unsigned char *)(a2 + 8) = v3;
  return result;
}

id TriggerTypeResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  id v5 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id TriggerTypeResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for TriggerTypeResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for TriggerTypeResolutionResult()
{
  return self;
}

id TriggerTypeResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TriggerTypeResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_22E6BE2A8()
{
  unint64_t result = qword_2685E21B8;
  if (!qword_2685E21B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2685E21B8);
  }
  return result;
}

ValueMetadata *type metadata accessor for TriggerType()
{
  return &type metadata for TriggerType;
}

uint64_t method lookup function for TriggerTypeResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TriggerTypeResolutionResult);
}

uint64_t dispatch thunk of static TriggerTypeResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static TriggerTypeResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

unint64_t HomeEntityType.init(rawValue:)(unint64_t a1)
{
  return sub_22E6BE65C(a1);
}

unint64_t sub_22E6BE36C@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_22E6BE65C(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id HomeEntityTypeResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  id v5 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id HomeEntityTypeResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for HomeEntityTypeResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

id HomeEntityTypeResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HomeEntityTypeResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_22E6BE65C(unint64_t result)
{
  if (result > 0xC) {
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for HomeEntityTypeResolutionResult()
{
  return self;
}

unint64_t sub_22E6BE694()
{
  unint64_t result = qword_2685E21C0;
  if (!qword_2685E21C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2685E21C0);
  }
  return result;
}

ValueMetadata *type metadata accessor for HomeEntityType()
{
  return &type metadata for HomeEntityType;
}

uint64_t method lookup function for HomeEntityTypeResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HomeEntityTypeResolutionResult);
}

uint64_t dispatch thunk of static HomeEntityTypeResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static HomeEntityTypeResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

unint64_t HomeDeviceType.init(rawValue:)(unint64_t a1)
{
  return sub_22E6BEA48(a1);
}

unint64_t sub_22E6BE758@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_22E6BEA48(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id HomeDeviceTypeResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  id v5 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id HomeDeviceTypeResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for HomeDeviceTypeResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

id HomeDeviceTypeResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HomeDeviceTypeResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_22E6BEA48(unint64_t result)
{
  if (result > 0x2F) {
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for HomeDeviceTypeResolutionResult()
{
  return self;
}

unint64_t sub_22E6BEA80()
{
  unint64_t result = qword_26AF50AA0;
  if (!qword_26AF50AA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF50AA0);
  }
  return result;
}

ValueMetadata *type metadata accessor for HomeDeviceType()
{
  return &type metadata for HomeDeviceType;
}

uint64_t method lookup function for HomeDeviceTypeResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HomeDeviceTypeResolutionResult);
}

uint64_t dispatch thunk of static HomeDeviceTypeResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static HomeDeviceTypeResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

unint64_t HomeSceneType.init(rawValue:)(unint64_t a1)
{
  return sub_22E6BEE34(a1);
}

unint64_t sub_22E6BEB44@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_22E6BEE34(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id HomeSceneTypeResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  id v5 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id HomeSceneTypeResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for HomeSceneTypeResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

id HomeSceneTypeResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HomeSceneTypeResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_22E6BEE34(unint64_t result)
{
  if (result > 5) {
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for HomeSceneTypeResolutionResult()
{
  return self;
}

unint64_t sub_22E6BEE6C()
{
  unint64_t result = qword_2685E21C8;
  if (!qword_2685E21C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2685E21C8);
  }
  return result;
}

ValueMetadata *type metadata accessor for HomeSceneType()
{
  return &type metadata for HomeSceneType;
}

uint64_t method lookup function for HomeSceneTypeResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HomeSceneTypeResolutionResult);
}

uint64_t dispatch thunk of static HomeSceneTypeResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static HomeSceneTypeResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

unint64_t DiscoveryType.init(rawValue:)(unint64_t a1)
{
  return sub_22E6BDEB8(a1);
}

id DiscoveryTypeResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  id v5 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id DiscoveryTypeResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for DiscoveryTypeResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

id DiscoveryTypeResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DiscoveryTypeResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for DiscoveryTypeResolutionResult()
{
  return self;
}

unint64_t sub_22E6BF214()
{
  unint64_t result = qword_2685E21D0;
  if (!qword_2685E21D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2685E21D0);
  }
  return result;
}

ValueMetadata *type metadata accessor for DiscoveryType()
{
  return &type metadata for DiscoveryType;
}

uint64_t method lookup function for DiscoveryTypeResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DiscoveryTypeResolutionResult);
}

uint64_t dispatch thunk of static DiscoveryTypeResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static DiscoveryTypeResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

unint64_t HomeUserTaskType.init(rawValue:)(unint64_t a1)
{
  return sub_22E6BF5C8(a1);
}

unint64_t sub_22E6BF2D8@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_22E6BF5C8(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id HomeUserTaskTypeResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  id v5 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id HomeUserTaskTypeResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for HomeUserTaskTypeResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

id HomeUserTaskTypeResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HomeUserTaskTypeResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_22E6BF5C8(unint64_t result)
{
  if (result > 6) {
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for HomeUserTaskTypeResolutionResult()
{
  return self;
}

unint64_t sub_22E6BF600()
{
  unint64_t result = qword_2685E21D8;
  if (!qword_2685E21D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2685E21D8);
  }
  return result;
}

ValueMetadata *type metadata accessor for HomeUserTaskType()
{
  return &type metadata for HomeUserTaskType;
}

uint64_t method lookup function for HomeUserTaskTypeResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HomeUserTaskTypeResolutionResult);
}

uint64_t dispatch thunk of static HomeUserTaskTypeResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static HomeUserTaskTypeResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

unint64_t HomeAttributeType.init(rawValue:)(unint64_t a1)
{
  return sub_22E6BF9B4(a1);
}

unint64_t sub_22E6BF6C4@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_22E6BF9B4(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id HomeAttributeTypeResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  id v5 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id HomeAttributeTypeResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for HomeAttributeTypeResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

id HomeAttributeTypeResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HomeAttributeTypeResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_22E6BF9B4(unint64_t result)
{
  if (result > 0x43) {
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for HomeAttributeTypeResolutionResult()
{
  return self;
}

unint64_t sub_22E6BF9EC()
{
  unint64_t result = qword_2685E21E0;
  if (!qword_2685E21E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2685E21E0);
  }
  return result;
}

ValueMetadata *type metadata accessor for HomeAttributeType()
{
  return &type metadata for HomeAttributeType;
}

uint64_t method lookup function for HomeAttributeTypeResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HomeAttributeTypeResolutionResult);
}

uint64_t dispatch thunk of static HomeAttributeTypeResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static HomeAttributeTypeResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

unint64_t HomeAttributeValueType.init(rawValue:)(unint64_t a1)
{
  return sub_22E6BFDA0(a1);
}

unint64_t sub_22E6BFAB0@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_22E6BFDA0(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id HomeAttributeValueTypeResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  id v5 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id HomeAttributeValueTypeResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for HomeAttributeValueTypeResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

id HomeAttributeValueTypeResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HomeAttributeValueTypeResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_22E6BFDA0(unint64_t result)
{
  if (result == 8) {
    uint64_t v1 = 8;
  }
  else {
    uint64_t v1 = 0;
  }
  if (result >= 7) {
    return v1;
  }
  return result;
}

uint64_t type metadata accessor for HomeAttributeValueTypeResolutionResult()
{
  return self;
}

unint64_t sub_22E6BFDE8()
{
  unint64_t result = qword_2685E21E8;
  if (!qword_2685E21E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2685E21E8);
  }
  return result;
}

ValueMetadata *type metadata accessor for HomeAttributeValueType()
{
  return &type metadata for HomeAttributeValueType;
}

uint64_t method lookup function for HomeAttributeValueTypeResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HomeAttributeValueTypeResolutionResult);
}

uint64_t dispatch thunk of static HomeAttributeValueTypeResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static HomeAttributeValueTypeResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

unint64_t HomeAttributeLimit.init(rawValue:)(unint64_t result)
{
  if (result > 2) {
    return 0;
  }
  return result;
}

id HomeAttributeLimitResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  id v5 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id HomeAttributeLimitResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for HomeAttributeLimitResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for HomeAttributeLimitResolutionResult()
{
  return self;
}

id HomeAttributeLimitResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HomeAttributeLimitResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_22E6C0184()
{
  unint64_t result = qword_2685E21F0;
  if (!qword_2685E21F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2685E21F0);
  }
  return result;
}

ValueMetadata *type metadata accessor for HomeAttributeLimit()
{
  return &type metadata for HomeAttributeLimit;
}

uint64_t method lookup function for HomeAttributeLimitResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HomeAttributeLimitResolutionResult);
}

uint64_t dispatch thunk of static HomeAttributeLimitResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static HomeAttributeLimitResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

unint64_t HomeAttributeUnit.init(rawValue:)(unint64_t a1)
{
  return sub_22E6BEE34(a1);
}

id HomeAttributeUnitResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  id v5 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id HomeAttributeUnitResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for HomeAttributeUnitResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

id HomeAttributeUnitResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HomeAttributeUnitResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for HomeAttributeUnitResolutionResult()
{
  return self;
}

unint64_t sub_22E6C052C()
{
  unint64_t result = qword_2685E21F8;
  if (!qword_2685E21F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2685E21F8);
  }
  return result;
}

ValueMetadata *type metadata accessor for HomeAttributeUnit()
{
  return &type metadata for HomeAttributeUnit;
}

uint64_t method lookup function for HomeAttributeUnitResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HomeAttributeUnitResolutionResult);
}

uint64_t dispatch thunk of static HomeAttributeUnitResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static HomeAttributeUnitResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

unint64_t RecurrenceFrequency.init(rawValue:)(unint64_t a1)
{
  return sub_22E6BF5C8(a1);
}

id RecurrenceFrequencyResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  id v5 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id RecurrenceFrequencyResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for RecurrenceFrequencyResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

id RecurrenceFrequencyResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RecurrenceFrequencyResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for RecurrenceFrequencyResolutionResult()
{
  return self;
}

unint64_t sub_22E6C08D4()
{
  unint64_t result = qword_2685E2200;
  if (!qword_2685E2200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2685E2200);
  }
  return result;
}

ValueMetadata *type metadata accessor for RecurrenceFrequency()
{
  return &type metadata for RecurrenceFrequency;
}

uint64_t method lookup function for RecurrenceFrequencyResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for RecurrenceFrequencyResolutionResult);
}

uint64_t dispatch thunk of static RecurrenceFrequencyResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static RecurrenceFrequencyResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

unint64_t DayOfWeekOptions.init(rawValue:)(unint64_t a1)
{
  return sub_22E6BF5C8(a1);
}

id DayOfWeekOptionsResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  id v5 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id DayOfWeekOptionsResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for DayOfWeekOptionsResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

id DayOfWeekOptionsResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DayOfWeekOptionsResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for DayOfWeekOptionsResolutionResult()
{
  return self;
}

unint64_t sub_22E6C0C7C()
{
  unint64_t result = qword_2685E2208;
  if (!qword_2685E2208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2685E2208);
  }
  return result;
}

ValueMetadata *type metadata accessor for DayOfWeekOptions()
{
  return &type metadata for DayOfWeekOptions;
}

uint64_t method lookup function for DayOfWeekOptionsResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DayOfWeekOptionsResolutionResult);
}

uint64_t dispatch thunk of static DayOfWeekOptionsResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static DayOfWeekOptionsResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

unint64_t HomeTaskOutcome.init(rawValue:)(unint64_t a1)
{
  return sub_22E6C1030(a1);
}

unint64_t sub_22E6C0D40@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_22E6C1030(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id HomeTaskOutcomeResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  id v5 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id HomeTaskOutcomeResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for HomeTaskOutcomeResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

id HomeTaskOutcomeResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HomeTaskOutcomeResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_22E6C1030(unint64_t result)
{
  if (result > 0x18) {
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for HomeTaskOutcomeResolutionResult()
{
  return self;
}

unint64_t sub_22E6C1068()
{
  unint64_t result = qword_2685E2210;
  if (!qword_2685E2210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2685E2210);
  }
  return result;
}

ValueMetadata *type metadata accessor for HomeTaskOutcome()
{
  return &type metadata for HomeTaskOutcome;
}

uint64_t method lookup function for HomeTaskOutcomeResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HomeTaskOutcomeResolutionResult);
}

uint64_t dispatch thunk of static HomeTaskOutcomeResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static HomeTaskOutcomeResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

unint64_t HomeAttributeModeType.init(rawValue:)(unint64_t a1)
{
  return sub_22E6C141C(a1);
}

unint64_t sub_22E6C112C@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_22E6C141C(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id HomeAttributeModeTypeResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  id v5 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id HomeAttributeModeTypeResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for HomeAttributeModeTypeResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

id HomeAttributeModeTypeResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HomeAttributeModeTypeResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_22E6C141C(unint64_t result)
{
  if (result > 0xF) {
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for HomeAttributeModeTypeResolutionResult()
{
  return self;
}

unint64_t sub_22E6C1454()
{
  unint64_t result = qword_2685E2218;
  if (!qword_2685E2218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2685E2218);
  }
  return result;
}

ValueMetadata *type metadata accessor for HomeAttributeModeType()
{
  return &type metadata for HomeAttributeModeType;
}

uint64_t method lookup function for HomeAttributeModeTypeResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HomeAttributeModeTypeResolutionResult);
}

uint64_t dispatch thunk of static HomeAttributeModeTypeResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static HomeAttributeModeTypeResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

unint64_t HomeAttributeStateType.init(rawValue:)(unint64_t a1)
{
  return sub_22E6C1808(a1);
}

unint64_t sub_22E6C1518@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_22E6C1808(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id HomeAttributeStateTypeResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  id v5 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id HomeAttributeStateTypeResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for HomeAttributeStateTypeResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

id HomeAttributeStateTypeResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HomeAttributeStateTypeResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_22E6C1808(unint64_t result)
{
  if (result > 0x10) {
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for HomeAttributeStateTypeResolutionResult()
{
  return self;
}

unint64_t sub_22E6C1840()
{
  unint64_t result = qword_2685E2220;
  if (!qword_2685E2220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2685E2220);
  }
  return result;
}

ValueMetadata *type metadata accessor for HomeAttributeStateType()
{
  return &type metadata for HomeAttributeStateType;
}

uint64_t method lookup function for HomeAttributeStateTypeResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HomeAttributeStateTypeResolutionResult);
}

uint64_t dispatch thunk of static HomeAttributeStateTypeResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static HomeAttributeStateTypeResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

id sub_22E6C18E4(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___AutomatableResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_successWithResolvedObject_, a1);

  return v2;
}

id sub_22E6C1948(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_22E6C1A40();
    swift_bridgeObjectRetain();
    sub_22E6D0CD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_22E6D0FB0();
    sub_22E6C1A40();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_22E6C1A40();
  id v2 = (void *)sub_22E6D0420();
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___AutomatableResolutionResult;
  id v3 = objc_msgSendSuper2(&v5, sel_disambiguationWithObjectsToDisambiguate_, v2);

  return v3;
}

unint64_t sub_22E6C1A40()
{
  unint64_t result = qword_2685E2228;
  if (!qword_2685E2228)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2685E2228);
  }
  return result;
}

id sub_22E6C1A80(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___AutomatableResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_confirmationRequiredWithObjectToConfirm_, a1);

  return v2;
}

id Automatable.__allocating_init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    objc_super v8 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v8 = 0;
  }
  id v9 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  if (a6)
  {
    uint64_t v10 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = objc_msgSend(objc_allocWithZone(v6), sel_initWithIdentifier_displayString_pronunciationHint_, v8, v9, v10);

  return v11;
}

id Automatable.init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    objc_super v8 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v8 = 0;
  }
  id v9 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  if (a6)
  {
    uint64_t v10 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  v13.receiver = v6;
  v13.super_class = (Class)type metadata accessor for Automatable();
  id v11 = objc_msgSendSuper2(&v13, sel_initWithIdentifier_displayString_pronunciationHint_, v8, v9, v10);

  return v11;
}

uint64_t type metadata accessor for Automatable()
{
  return self;
}

id Automatable.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id Automatable.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for Automatable();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id Automatable.__deallocating_deinit()
{
  return sub_22E6C2294(type metadata accessor for Automatable);
}

id AutomatableResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  objc_super v5 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id AutomatableResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for AutomatableResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for AutomatableResolutionResult()
{
  return self;
}

id AutomatableResolutionResult.__deallocating_deinit()
{
  return sub_22E6C2294(type metadata accessor for AutomatableResolutionResult);
}

id sub_22E6C2294(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t method lookup function for AutomatableResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AutomatableResolutionResult);
}

uint64_t dispatch thunk of static AutomatableResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static AutomatableResolutionResult.disambiguation(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of static AutomatableResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

id TriggerValue.__allocating_init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    objc_super v8 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v8 = 0;
  }
  id v9 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  if (a6)
  {
    uint64_t v10 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = objc_msgSend(objc_allocWithZone(v6), sel_initWithIdentifier_displayString_pronunciationHint_, v8, v9, v10);

  return v11;
}

id TriggerValue.init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    objc_super v8 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v8 = 0;
  }
  id v9 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  if (a6)
  {
    uint64_t v10 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  v13.receiver = v6;
  v13.super_class = (Class)type metadata accessor for TriggerValue();
  id v11 = objc_msgSendSuper2(&v13, sel_initWithIdentifier_displayString_pronunciationHint_, v8, v9, v10);

  return v11;
}

uint64_t type metadata accessor for TriggerValue()
{
  return self;
}

id TriggerValue.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id TriggerValue.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TriggerValue();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id TriggerValue.__deallocating_deinit()
{
  return sub_22E6C2C90(type metadata accessor for TriggerValue);
}

id sub_22E6C2690(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___TriggerValueResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_successWithResolvedObject_, a1);

  return v2;
}

id sub_22E6C2744(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_22E6C1A40();
    swift_bridgeObjectRetain();
    sub_22E6D0CD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_22E6D0FB0();
    sub_22E6C1A40();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_22E6C1A40();
  id v2 = (void *)sub_22E6D0420();
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___TriggerValueResolutionResult;
  id v3 = objc_msgSendSuper2(&v5, sel_disambiguationWithObjectsToDisambiguate_, v2);

  return v3;
}

id sub_22E6C28A8(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___TriggerValueResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_confirmationRequiredWithObjectToConfirm_, a1);

  return v2;
}

id TriggerValueResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  objc_super v5 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id TriggerValueResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for TriggerValueResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for TriggerValueResolutionResult()
{
  return self;
}

id TriggerValueResolutionResult.__deallocating_deinit()
{
  return sub_22E6C2C90(type metadata accessor for TriggerValueResolutionResult);
}

id sub_22E6C2C90(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t method lookup function for TriggerValueResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TriggerValueResolutionResult);
}

uint64_t dispatch thunk of static TriggerValueResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static TriggerValueResolutionResult.disambiguation(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of static TriggerValueResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

id sub_22E6C2D1C(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___TriggerConditionResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_successWithResolvedObject_, a1);

  return v2;
}

id sub_22E6C2D80(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_22E6C1A40();
    swift_bridgeObjectRetain();
    sub_22E6D0CD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_22E6D0FB0();
    sub_22E6C1A40();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_22E6C1A40();
  id v2 = (void *)sub_22E6D0420();
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___TriggerConditionResolutionResult;
  id v3 = objc_msgSendSuper2(&v5, sel_disambiguationWithObjectsToDisambiguate_, v2);

  return v3;
}

id sub_22E6C2E78(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___TriggerConditionResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_confirmationRequiredWithObjectToConfirm_, a1);

  return v2;
}

void sub_22E6C2EDC(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_recurrence);
  if (v3)
  {
    objc_super v4 = v3;
    sub_22E6CBF50();
    uint64_t v5 = sub_22E6D0430();
  }
  else
  {
    uint64_t v5 = 0;
  }
  *a2 = v5;
}

void sub_22E6C2F4C(void *a1, void **a2)
{
  id v2 = *a2;
  if (*a1)
  {
    sub_22E6CBF50();
    uint64_t v3 = sub_22E6D0420();
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  objc_msgSend(v2, sel_setRecurrence_);
}

id TriggerCondition.__allocating_init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    objc_super v8 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v8 = 0;
  }
  id v9 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  if (a6)
  {
    uint64_t v10 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = objc_msgSend(objc_allocWithZone(v6), sel_initWithIdentifier_displayString_pronunciationHint_, v8, v9, v10);

  return v11;
}

id TriggerCondition.init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    objc_super v8 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v8 = 0;
  }
  id v9 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  if (a6)
  {
    uint64_t v10 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  v13.receiver = v6;
  v13.super_class = (Class)type metadata accessor for TriggerCondition();
  id v11 = objc_msgSendSuper2(&v13, sel_initWithIdentifier_displayString_pronunciationHint_, v8, v9, v10);

  return v11;
}

uint64_t type metadata accessor for TriggerCondition()
{
  return self;
}

id TriggerCondition.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id TriggerCondition.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TriggerCondition();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id TriggerCondition.__deallocating_deinit()
{
  return sub_22E6C3774(type metadata accessor for TriggerCondition);
}

id TriggerConditionResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  objc_super v5 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id TriggerConditionResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for TriggerConditionResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for TriggerConditionResolutionResult()
{
  return self;
}

id TriggerConditionResolutionResult.__deallocating_deinit()
{
  return sub_22E6C3774(type metadata accessor for TriggerConditionResolutionResult);
}

id sub_22E6C3774(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

char *keypath_get_selector_type()
{
  return sel_type;
}

id sub_22E6C37B8@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_type);
  *a2 = result;
  return result;
}

id sub_22E6C37EC(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setType_, *a1);
}

char *keypath_get_selector_value()
{
  return sel_value;
}

id sub_22E6C380C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_value);
  *a2 = result;
  return result;
}

id sub_22E6C3848(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setValue_, *a1);
}

char *keypath_get_selector_recurrence()
{
  return sel_recurrence;
}

uint64_t method lookup function for TriggerConditionResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TriggerConditionResolutionResult);
}

uint64_t dispatch thunk of static TriggerConditionResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static TriggerConditionResolutionResult.disambiguation(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of static TriggerConditionResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

void sub_22E6C38C4(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_22E6C38D0(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

void sub_22E6C38DC(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_22E6C38E8(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

id sub_22E6C38F4@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_outerDeviceType);
  *a2 = result;
  return result;
}

id sub_22E6C3928(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setOuterDeviceType_, *a1);
}

void sub_22E6C393C(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_22E6C3948(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

void sub_22E6C3954(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_22E6C3960(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

void sub_22E6C396C(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_22E6C3978(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

id sub_22E6C3984@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_deviceType);
  *a2 = result;
  return result;
}

id sub_22E6C39B8(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDeviceType_, *a1);
}

id sub_22E6C39CC(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___HomeFilterResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_successWithResolvedObject_, a1);

  return v2;
}

id sub_22E6C3A30(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_22E6C1A40();
    swift_bridgeObjectRetain();
    sub_22E6D0CD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_22E6D0FB0();
    sub_22E6C1A40();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_22E6C1A40();
  id v2 = (void *)sub_22E6D0420();
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___HomeFilterResolutionResult;
  id v3 = objc_msgSendSuper2(&v5, sel_disambiguationWithObjectsToDisambiguate_, v2);

  return v3;
}

id sub_22E6C3B28(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___HomeFilterResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_confirmationRequiredWithObjectToConfirm_, a1);

  return v2;
}

void sub_22E6C3B8C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_entityIdentifiers);
  if (v3)
  {
    objc_super v4 = v3;
    uint64_t v5 = sub_22E6D0430();
  }
  else
  {
    uint64_t v5 = 0;
  }
  *a2 = v5;
}

void sub_22E6C3BF4(void *a1, void **a2)
{
  id v2 = *a2;
  if (*a1) {
    uint64_t v3 = sub_22E6D0420();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  objc_msgSend(v2, sel_setEntityIdentifiers_);
}

void sub_22E6C3C64(id *a1@<X0>, SEL *a2@<X3>, uint64_t *a3@<X8>)
{
  id v4 = [*a1 *a2];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = sub_22E6D0140();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  *a3 = v6;
  a3[1] = v8;
}

void sub_22E6C3CC8(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  uint64_t v6 = *a2;
  if (*(void *)(a1 + 8)) {
    uint64_t v7 = sub_22E6D0110();
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = (id)v7;
  [v6 *a5];
}

id HomeFilter.__allocating_init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    id v8 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = 0;
  }
  id v9 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  if (a6)
  {
    uint64_t v10 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = objc_msgSend(objc_allocWithZone(v6), sel_initWithIdentifier_displayString_pronunciationHint_, v8, v9, v10);

  return v11;
}

id HomeFilter.init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    id v8 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = 0;
  }
  id v9 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  if (a6)
  {
    uint64_t v10 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  v13.receiver = v6;
  v13.super_class = (Class)type metadata accessor for HomeFilter();
  id v11 = objc_msgSendSuper2(&v13, sel_initWithIdentifier_displayString_pronunciationHint_, v8, v9, v10);

  return v11;
}

uint64_t type metadata accessor for HomeFilter()
{
  return self;
}

id HomeFilter.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id HomeFilter.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for HomeFilter();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id HomeFilter.__deallocating_deinit()
{
  return sub_22E6C44E8(type metadata accessor for HomeFilter);
}

id HomeFilterResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  objc_super v5 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id HomeFilterResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for HomeFilterResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for HomeFilterResolutionResult()
{
  return self;
}

id HomeFilterResolutionResult.__deallocating_deinit()
{
  return sub_22E6C44E8(type metadata accessor for HomeFilterResolutionResult);
}

id sub_22E6C44E8(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

char *keypath_get_selector_entityIdentifiers()
{
  return sel_entityIdentifiers;
}

void sub_22E6C4534(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_22E6C4554(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_entityType()
{
  return sel_entityType;
}

id sub_22E6C4580@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_entityType);
  *a2 = result;
  return result;
}

id sub_22E6C45B4(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEntityType_, *a1);
}

id sub_22E6C45C8@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_outerDeviceType);
  *a2 = result;
  return result;
}

id sub_22E6C45FC(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setOuterDeviceType_, *a1);
}

void sub_22E6C4610(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_22E6C4630(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

id sub_22E6C4650@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_deviceType);
  *a2 = result;
  return result;
}

id sub_22E6C4684(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDeviceType_, *a1);
}

void sub_22E6C4698(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_22E6C46B8(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

void sub_22E6C46D8(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_22E6C46F8(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

void sub_22E6C4718(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_22E6C4738(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_zoneName()
{
  return sel_zoneName;
}

void sub_22E6C4764(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_22E6C4784(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_isExcludeFilter()
{
  return sel_isExcludeFilter;
}

id sub_22E6C47B0@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_isExcludeFilter);
  *a2 = result;
  return result;
}

id sub_22E6C47EC(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIsExcludeFilter_, *a1);
}

char *keypath_get_selector_hasAllQuantifier()
{
  return sel_hasAllQuantifier;
}

id sub_22E6C480C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_hasAllQuantifier);
  *a2 = result;
  return result;
}

id sub_22E6C4848(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasAllQuantifier_, *a1);
}

char *keypath_get_selector_targetArea()
{
  return sel_targetArea;
}

void sub_22E6C4868(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_22E6C4888(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_targetMap()
{
  return sel_targetMap;
}

void sub_22E6C48B4(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_22E6C48D4(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

uint64_t method lookup function for HomeFilterResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HomeFilterResolutionResult);
}

uint64_t dispatch thunk of static HomeFilterResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static HomeFilterResolutionResult.disambiguation(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of static HomeFilterResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

void sub_22E6C4948(id *a1@<X0>, SEL *a2@<X3>, uint64_t *a3@<X8>)
{
  id v4 = [*a1 *a2];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = sub_22E6D0430();
  }
  else
  {
    uint64_t v6 = 0;
  }
  *a3 = v6;
}

void sub_22E6C49AC(void *a1, void **a2, uint64_t a3, uint64_t a4, uint64_t a5, SEL *a6)
{
  uint64_t v7 = *a2;
  if (*a1) {
    uint64_t v8 = sub_22E6D0420();
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = (id)v8;
  [v7 *a6];
}

id HomeEntity.__allocating_init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    uint64_t v8 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  if (a6)
  {
    uint64_t v10 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = objc_msgSend(objc_allocWithZone(v6), sel_initWithIdentifier_displayString_pronunciationHint_, v8, v9, v10);

  return v11;
}

id HomeEntity.init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    uint64_t v8 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  if (a6)
  {
    uint64_t v10 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  v13.receiver = v6;
  v13.super_class = (Class)type metadata accessor for HomeEntity();
  id v11 = objc_msgSendSuper2(&v13, sel_initWithIdentifier_displayString_pronunciationHint_, v8, v9, v10);

  return v11;
}

uint64_t type metadata accessor for HomeEntity()
{
  return self;
}

id HomeEntity.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id HomeEntity.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for HomeEntity();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id HomeEntity.__deallocating_deinit()
{
  return sub_22E6C5388(type metadata accessor for HomeEntity);
}

id sub_22E6C4D88(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___HomeEntityResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_successWithResolvedObject_, a1);

  return v2;
}

id sub_22E6C4E3C(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_22E6C1A40();
    swift_bridgeObjectRetain();
    sub_22E6D0CD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_22E6D0FB0();
    sub_22E6C1A40();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_22E6C1A40();
  id v2 = (void *)sub_22E6D0420();
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___HomeEntityResolutionResult;
  id v3 = objc_msgSendSuper2(&v5, sel_disambiguationWithObjectsToDisambiguate_, v2);

  return v3;
}

id sub_22E6C4FA0(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___HomeEntityResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_confirmationRequiredWithObjectToConfirm_, a1);

  return v2;
}

id HomeEntityResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  objc_super v5 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id HomeEntityResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for HomeEntityResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for HomeEntityResolutionResult()
{
  return self;
}

id HomeEntityResolutionResult.__deallocating_deinit()
{
  return sub_22E6C5388(type metadata accessor for HomeEntityResolutionResult);
}

id sub_22E6C5388(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

void sub_22E6C53C0(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_22E6C53E0(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

id sub_22E6C5400@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_type);
  *a2 = result;
  return result;
}

id sub_22E6C5434(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setType_, *a1);
}

char *keypath_get_selector_entityIdentifier()
{
  return sel_entityIdentifier;
}

void sub_22E6C5454(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_22E6C5474(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_deviceTypes()
{
  return sel_deviceTypes;
}

void sub_22E6C54A0(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_22E6C54C8(void *a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_sceneType()
{
  return sel_sceneType;
}

id sub_22E6C54FC@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_sceneType);
  *a2 = result;
  return result;
}

id sub_22E6C5530(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSceneType_, *a1);
}

char *keypath_get_selector_room()
{
  return sel_room;
}

void sub_22E6C5550(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_22E6C5570(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_home()
{
  return sel_home;
}

void sub_22E6C559C(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_22E6C55BC(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_group()
{
  return sel_group;
}

void sub_22E6C55E8(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_22E6C5608(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_zones()
{
  return sel_zones;
}

void sub_22E6C5634(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_22E6C565C(void *a1, void **a2, uint64_t a3, uint64_t a4)
{
}

uint64_t method lookup function for HomeEntityResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HomeEntityResolutionResult);
}

uint64_t dispatch thunk of static HomeEntityResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static HomeEntityResolutionResult.disambiguation(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of static HomeEntityResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

id sub_22E6C56D8(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___HomeUserTaskResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_successWithResolvedObject_, a1);

  return v2;
}

id sub_22E6C573C(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_22E6C1A40();
    swift_bridgeObjectRetain();
    sub_22E6D0CD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_22E6D0FB0();
    sub_22E6C1A40();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_22E6C1A40();
  id v2 = (void *)sub_22E6D0420();
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___HomeUserTaskResolutionResult;
  id v3 = objc_msgSendSuper2(&v5, sel_disambiguationWithObjectsToDisambiguate_, v2);

  return v3;
}

id sub_22E6C5834(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___HomeUserTaskResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_confirmationRequiredWithObjectToConfirm_, a1);

  return v2;
}

id HomeUserTask.__allocating_init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    objc_super v8 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v8 = 0;
  }
  id v9 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  if (a6)
  {
    uint64_t v10 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = objc_msgSend(objc_allocWithZone(v6), sel_initWithIdentifier_displayString_pronunciationHint_, v8, v9, v10);

  return v11;
}

id HomeUserTask.init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    objc_super v8 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v8 = 0;
  }
  id v9 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  if (a6)
  {
    uint64_t v10 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  v13.receiver = v6;
  v13.super_class = (Class)type metadata accessor for HomeUserTask();
  id v11 = objc_msgSendSuper2(&v13, sel_initWithIdentifier_displayString_pronunciationHint_, v8, v9, v10);

  return v11;
}

uint64_t type metadata accessor for HomeUserTask()
{
  return self;
}

id HomeUserTask.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id HomeUserTask.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for HomeUserTask();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id HomeUserTask.__deallocating_deinit()
{
  return sub_22E6C6048(type metadata accessor for HomeUserTask);
}

id HomeUserTaskResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  objc_super v5 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id HomeUserTaskResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for HomeUserTaskResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for HomeUserTaskResolutionResult()
{
  return self;
}

id HomeUserTaskResolutionResult.__deallocating_deinit()
{
  return sub_22E6C6048(type metadata accessor for HomeUserTaskResolutionResult);
}

id sub_22E6C6048(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

char *keypath_get_selector_taskType()
{
  return sel_taskType;
}

id sub_22E6C608C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_taskType);
  *a2 = result;
  return result;
}

id sub_22E6C60C0(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTaskType_, *a1);
}

char *keypath_get_selector_attribute()
{
  return sel_attribute;
}

id sub_22E6C60E0@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_attribute);
  *a2 = result;
  return result;
}

id sub_22E6C6114(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setAttribute_, *a1);
}

id sub_22E6C6128@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_value);
  *a2 = result;
  return result;
}

id sub_22E6C6164(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setValue_, *a1);
}

uint64_t method lookup function for HomeUserTaskResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HomeUserTaskResolutionResult);
}

uint64_t dispatch thunk of static HomeUserTaskResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static HomeUserTaskResolutionResult.disambiguation(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of static HomeUserTaskResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

void sub_22E6C61CC(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_stringValue);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = sub_22E6D0140();
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

void sub_22E6C6234(uint64_t a1, void **a2)
{
  id v2 = *a2;
  if (*(void *)(a1 + 8)) {
    uint64_t v3 = sub_22E6D0110();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  objc_msgSend(v2, sel_setStringValue_);
}

id HomeAttributeValue.__allocating_init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    objc_super v8 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v8 = 0;
  }
  id v9 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  if (a6)
  {
    uint64_t v10 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = objc_msgSend(objc_allocWithZone(v6), sel_initWithIdentifier_displayString_pronunciationHint_, v8, v9, v10);

  return v11;
}

id HomeAttributeValue.init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    objc_super v8 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v8 = 0;
  }
  id v9 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  if (a6)
  {
    uint64_t v10 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  v13.receiver = v6;
  v13.super_class = (Class)type metadata accessor for HomeAttributeValue();
  id v11 = objc_msgSendSuper2(&v13, sel_initWithIdentifier_displayString_pronunciationHint_, v8, v9, v10);

  return v11;
}

uint64_t type metadata accessor for HomeAttributeValue()
{
  return self;
}

id HomeAttributeValue.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id HomeAttributeValue.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for HomeAttributeValue();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id HomeAttributeValue.__deallocating_deinit()
{
  return sub_22E6C6C14(type metadata accessor for HomeAttributeValue);
}

id sub_22E6C6614(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___HomeAttributeValueResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_successWithResolvedObject_, a1);

  return v2;
}

id sub_22E6C66C8(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_22E6C1A40();
    swift_bridgeObjectRetain();
    sub_22E6D0CD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_22E6D0FB0();
    sub_22E6C1A40();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_22E6C1A40();
  id v2 = (void *)sub_22E6D0420();
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___HomeAttributeValueResolutionResult;
  id v3 = objc_msgSendSuper2(&v5, sel_disambiguationWithObjectsToDisambiguate_, v2);

  return v3;
}

id sub_22E6C682C(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___HomeAttributeValueResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_confirmationRequiredWithObjectToConfirm_, a1);

  return v2;
}

id HomeAttributeValueResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  objc_super v5 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id HomeAttributeValueResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for HomeAttributeValueResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for HomeAttributeValueResolutionResult()
{
  return self;
}

id HomeAttributeValueResolutionResult.__deallocating_deinit()
{
  return sub_22E6C6C14(type metadata accessor for HomeAttributeValueResolutionResult);
}

id sub_22E6C6C14(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

char *keypath_get_selector_BOOLValue()
{
  return sel_BOOLValue;
}

id sub_22E6C6C58@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_BOOLValue);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22E6C6C8C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setBoolValue_, *a1);
}

char *keypath_get_selector_doubleValue()
{
  return sel_doubleValue;
}

id sub_22E6C6CAC@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_doubleValue);
  *a2 = v4;
  return result;
}

id sub_22E6C6CE0(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDoubleValue_, *a1);
}

char *keypath_get_selector_integerValue()
{
  return sel_integerValue;
}

id sub_22E6C6D00@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_integerValue);
  *a2 = result;
  return result;
}

id sub_22E6C6D34(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIntegerValue_, *a1);
}

char *keypath_get_selector_stringValue()
{
  return sel_stringValue;
}

char *keypath_get_selector_limitValue()
{
  return sel_limitValue;
}

id sub_22E6C6D68@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_limitValue);
  *a2 = result;
  return result;
}

id sub_22E6C6D9C(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLimitValue_, *a1);
}

char *keypath_get_selector_unit()
{
  return sel_unit;
}

id sub_22E6C6DBC@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_unit);
  *a2 = result;
  return result;
}

id sub_22E6C6DF0(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setUnit_, *a1);
}

char *keypath_get_selector_rangeValue()
{
  return sel_rangeValue;
}

id sub_22E6C6E10@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_rangeValue);
  *a2 = result;
  return result;
}

id sub_22E6C6E4C(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setRangeValue_, *a1);
}

id sub_22E6C6E60@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_type);
  *a2 = result;
  return result;
}

id sub_22E6C6E94(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setType_, *a1);
}

char *keypath_get_selector_cleaningJob()
{
  return sel_cleaningJob;
}

id sub_22E6C6EB4@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_cleaningJob);
  *a2 = result;
  return result;
}

id sub_22E6C6EF0(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setCleaningJob_, *a1);
}

uint64_t method lookup function for HomeAttributeValueResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HomeAttributeValueResolutionResult);
}

uint64_t dispatch thunk of static HomeAttributeValueResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static HomeAttributeValueResolutionResult.disambiguation(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of static HomeAttributeValueResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

id HomeAttributeRange.__allocating_init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    objc_super v8 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v8 = 0;
  }
  id v9 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  if (a6)
  {
    uint64_t v10 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = objc_msgSend(objc_allocWithZone(v6), sel_initWithIdentifier_displayString_pronunciationHint_, v8, v9, v10);

  return v11;
}

id HomeAttributeRange.init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    objc_super v8 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v8 = 0;
  }
  id v9 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  if (a6)
  {
    uint64_t v10 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  v13.receiver = v6;
  v13.super_class = (Class)type metadata accessor for HomeAttributeRange();
  id v11 = objc_msgSendSuper2(&v13, sel_initWithIdentifier_displayString_pronunciationHint_, v8, v9, v10);

  return v11;
}

uint64_t type metadata accessor for HomeAttributeRange()
{
  return self;
}

id HomeAttributeRange.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id HomeAttributeRange.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for HomeAttributeRange();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id HomeAttributeRange.__deallocating_deinit()
{
  return sub_22E6C78C8(type metadata accessor for HomeAttributeRange);
}

id sub_22E6C72C8(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___HomeAttributeRangeResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_successWithResolvedObject_, a1);

  return v2;
}

id sub_22E6C737C(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_22E6C1A40();
    swift_bridgeObjectRetain();
    sub_22E6D0CD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_22E6D0FB0();
    sub_22E6C1A40();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_22E6C1A40();
  id v2 = (void *)sub_22E6D0420();
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___HomeAttributeRangeResolutionResult;
  id v3 = objc_msgSendSuper2(&v5, sel_disambiguationWithObjectsToDisambiguate_, v2);

  return v3;
}

id sub_22E6C74E0(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___HomeAttributeRangeResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_confirmationRequiredWithObjectToConfirm_, a1);

  return v2;
}

id HomeAttributeRangeResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  objc_super v5 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id HomeAttributeRangeResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for HomeAttributeRangeResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for HomeAttributeRangeResolutionResult()
{
  return self;
}

id HomeAttributeRangeResolutionResult.__deallocating_deinit()
{
  return sub_22E6C78C8(type metadata accessor for HomeAttributeRangeResolutionResult);
}

id sub_22E6C78C8(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

char *keypath_get_selector_lowerValue()
{
  return sel_lowerValue;
}

id sub_22E6C790C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_lowerValue);
  *a2 = v4;
  return result;
}

id sub_22E6C7940(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLowerValue_, *a1);
}

char *keypath_get_selector_upperValue()
{
  return sel_upperValue;
}

id sub_22E6C7960@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_upperValue);
  *a2 = v4;
  return result;
}

id sub_22E6C7994(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setUpperValue_, *a1);
}

uint64_t method lookup function for HomeAttributeRangeResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HomeAttributeRangeResolutionResult);
}

uint64_t dispatch thunk of static HomeAttributeRangeResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static HomeAttributeRangeResolutionResult.disambiguation(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of static HomeAttributeRangeResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

id RecurrenceRule.__allocating_init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    objc_super v8 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v8 = 0;
  }
  id v9 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  if (a6)
  {
    uint64_t v10 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = objc_msgSend(objc_allocWithZone(v6), sel_initWithIdentifier_displayString_pronunciationHint_, v8, v9, v10);

  return v11;
}

id RecurrenceRule.init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    objc_super v8 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v8 = 0;
  }
  id v9 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  if (a6)
  {
    uint64_t v10 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  v13.receiver = v6;
  v13.super_class = (Class)type metadata accessor for RecurrenceRule();
  id v11 = objc_msgSendSuper2(&v13, sel_initWithIdentifier_displayString_pronunciationHint_, v8, v9, v10);

  return v11;
}

uint64_t type metadata accessor for RecurrenceRule()
{
  return self;
}

id RecurrenceRule.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id RecurrenceRule.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for RecurrenceRule();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id RecurrenceRule.__deallocating_deinit()
{
  return sub_22E6C836C(type metadata accessor for RecurrenceRule);
}

id sub_22E6C7D6C(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___RecurrenceRuleResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_successWithResolvedObject_, a1);

  return v2;
}

id sub_22E6C7E20(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_22E6C1A40();
    swift_bridgeObjectRetain();
    sub_22E6D0CD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_22E6D0FB0();
    sub_22E6C1A40();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_22E6C1A40();
  id v2 = (void *)sub_22E6D0420();
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___RecurrenceRuleResolutionResult;
  id v3 = objc_msgSendSuper2(&v5, sel_disambiguationWithObjectsToDisambiguate_, v2);

  return v3;
}

id sub_22E6C7F84(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___RecurrenceRuleResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_confirmationRequiredWithObjectToConfirm_, a1);

  return v2;
}

id RecurrenceRuleResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  objc_super v5 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id RecurrenceRuleResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for RecurrenceRuleResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for RecurrenceRuleResolutionResult()
{
  return self;
}

id RecurrenceRuleResolutionResult.__deallocating_deinit()
{
  return sub_22E6C836C(type metadata accessor for RecurrenceRuleResolutionResult);
}

id sub_22E6C836C(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

char *keypath_get_selector_interval()
{
  return sel_interval;
}

id sub_22E6C83B0@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_interval);
  *a2 = result;
  return result;
}

id sub_22E6C83E4(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setInterval_, *a1);
}

char *keypath_get_selector_frequency()
{
  return sel_frequency;
}

id sub_22E6C8404@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_frequency);
  *a2 = result;
  return result;
}

id sub_22E6C8438(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setFrequency_, *a1);
}

char *keypath_get_selector_weeklyRecurrenceDays()
{
  return sel_weeklyRecurrenceDays;
}

id sub_22E6C8458@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_weeklyRecurrenceDays);
  *a2 = result;
  return result;
}

id sub_22E6C848C(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setWeeklyRecurrenceDays_, *a1);
}

uint64_t method lookup function for RecurrenceRuleResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for RecurrenceRuleResolutionResult);
}

uint64_t dispatch thunk of static RecurrenceRuleResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static RecurrenceRuleResolutionResult.disambiguation(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of static RecurrenceRuleResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

id HomeUserTaskResponse.__allocating_init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    objc_super v8 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v8 = 0;
  }
  id v9 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  if (a6)
  {
    uint64_t v10 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = objc_msgSend(objc_allocWithZone(v6), sel_initWithIdentifier_displayString_pronunciationHint_, v8, v9, v10);

  return v11;
}

id HomeUserTaskResponse.init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    objc_super v8 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v8 = 0;
  }
  id v9 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  if (a6)
  {
    uint64_t v10 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  v13.receiver = v6;
  v13.super_class = (Class)type metadata accessor for HomeUserTaskResponse();
  id v11 = objc_msgSendSuper2(&v13, sel_initWithIdentifier_displayString_pronunciationHint_, v8, v9, v10);

  return v11;
}

uint64_t type metadata accessor for HomeUserTaskResponse()
{
  return self;
}

id HomeUserTaskResponse.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id HomeUserTaskResponse.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for HomeUserTaskResponse();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id HomeUserTaskResponse.__deallocating_deinit()
{
  return sub_22E6C8E64(type metadata accessor for HomeUserTaskResponse);
}

id sub_22E6C8864(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___HomeUserTaskResponseResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_successWithResolvedObject_, a1);

  return v2;
}

id sub_22E6C8918(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_22E6C1A40();
    swift_bridgeObjectRetain();
    sub_22E6D0CD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_22E6D0FB0();
    sub_22E6C1A40();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_22E6C1A40();
  id v2 = (void *)sub_22E6D0420();
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___HomeUserTaskResponseResolutionResult;
  id v3 = objc_msgSendSuper2(&v5, sel_disambiguationWithObjectsToDisambiguate_, v2);

  return v3;
}

id sub_22E6C8A7C(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___HomeUserTaskResponseResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_confirmationRequiredWithObjectToConfirm_, a1);

  return v2;
}

id HomeUserTaskResponseResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  objc_super v5 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id HomeUserTaskResponseResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for HomeUserTaskResponseResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for HomeUserTaskResponseResolutionResult()
{
  return self;
}

id HomeUserTaskResponseResolutionResult.__deallocating_deinit()
{
  return sub_22E6C8E64(type metadata accessor for HomeUserTaskResponseResolutionResult);
}

id sub_22E6C8E64(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

id sub_22E6C8E9C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_userTask);
  *a2 = result;
  return result;
}

id sub_22E6C8ED8(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setUserTask_, *a1);
}

char *keypath_get_selector_taskOutcome()
{
  return sel_taskOutcome;
}

id sub_22E6C8EF8@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_taskOutcome);
  *a2 = result;
  return result;
}

id sub_22E6C8F2C(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTaskOutcome_, *a1);
}

uint64_t method lookup function for HomeUserTaskResponseResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HomeUserTaskResponseResolutionResult);
}

uint64_t dispatch thunk of static HomeUserTaskResponseResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static HomeUserTaskResponseResolutionResult.disambiguation(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of static HomeUserTaskResponseResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

void sub_22E6C8F94(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_taskResponses);
  if (v3)
  {
    id v4 = v3;
    type metadata accessor for HomeUserTaskResponse();
    uint64_t v5 = sub_22E6D0430();
  }
  else
  {
    uint64_t v5 = 0;
  }
  *a2 = v5;
}

void sub_22E6C9004(void *a1, void **a2)
{
  id v2 = *a2;
  if (*a1)
  {
    type metadata accessor for HomeUserTaskResponse();
    uint64_t v3 = sub_22E6D0420();
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  objc_msgSend(v2, sel_setTaskResponses_);
}

id HomeEntityResponse.__allocating_init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    objc_super v8 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v8 = 0;
  }
  id v9 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  if (a6)
  {
    uint64_t v10 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = objc_msgSend(objc_allocWithZone(v6), sel_initWithIdentifier_displayString_pronunciationHint_, v8, v9, v10);

  return v11;
}

id HomeEntityResponse.init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    objc_super v8 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v8 = 0;
  }
  id v9 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  if (a6)
  {
    uint64_t v10 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  v13.receiver = v6;
  v13.super_class = (Class)type metadata accessor for HomeEntityResponse();
  id v11 = objc_msgSendSuper2(&v13, sel_initWithIdentifier_displayString_pronunciationHint_, v8, v9, v10);

  return v11;
}

uint64_t type metadata accessor for HomeEntityResponse()
{
  return self;
}

id HomeEntityResponse.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id HomeEntityResponse.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for HomeEntityResponse();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id HomeEntityResponse.__deallocating_deinit()
{
  return sub_22E6C99EC(type metadata accessor for HomeEntityResponse);
}

id sub_22E6C93EC(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___HomeEntityResponseResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_successWithResolvedObject_, a1);

  return v2;
}

id sub_22E6C94A0(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_22E6C1A40();
    swift_bridgeObjectRetain();
    sub_22E6D0CD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_22E6D0FB0();
    sub_22E6C1A40();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_22E6C1A40();
  id v2 = (void *)sub_22E6D0420();
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___HomeEntityResponseResolutionResult;
  id v3 = objc_msgSendSuper2(&v5, sel_disambiguationWithObjectsToDisambiguate_, v2);

  return v3;
}

id sub_22E6C9604(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___HomeEntityResponseResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_confirmationRequiredWithObjectToConfirm_, a1);

  return v2;
}

id HomeEntityResponseResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  objc_super v5 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id HomeEntityResponseResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for HomeEntityResponseResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for HomeEntityResponseResolutionResult()
{
  return self;
}

id HomeEntityResponseResolutionResult.__deallocating_deinit()
{
  return sub_22E6C99EC(type metadata accessor for HomeEntityResponseResolutionResult);
}

id sub_22E6C99EC(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

char *keypath_get_selector_entity()
{
  return sel_entity;
}

id sub_22E6C9A30@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_entity);
  *a2 = result;
  return result;
}

id sub_22E6C9A6C(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEntity_, *a1);
}

char *keypath_get_selector_taskResponses()
{
  return sel_taskResponses;
}

uint64_t method lookup function for HomeEntityResponseResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HomeEntityResponseResolutionResult);
}

uint64_t dispatch thunk of static HomeEntityResponseResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static HomeEntityResponseResolutionResult.disambiguation(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of static HomeEntityResponseResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

void sub_22E6C9AE8(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_cleanModes);
  uint64_t v4 = sub_22E6D0430();

  *a2 = v4;
}

void sub_22E6C9B44(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_targetAreas);
  if (v3)
  {
    uint64_t v4 = v3;
    type metadata accessor for HomeAttributeTargetArea();
    uint64_t v5 = sub_22E6D0430();
  }
  else
  {
    uint64_t v5 = 0;
  }
  *a2 = v5;
}

void sub_22E6C9BB4(void *a1, void **a2)
{
  id v2 = *a2;
  if (*a1)
  {
    type metadata accessor for HomeAttributeTargetArea();
    uint64_t v3 = sub_22E6D0420();
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  objc_msgSend(v2, sel_setTargetAreas_);
}

id HomeAttributeCleaningJob.__allocating_init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    objc_super v8 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v8 = 0;
  }
  id v9 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  if (a6)
  {
    uint64_t v10 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = objc_msgSend(objc_allocWithZone(v6), sel_initWithIdentifier_displayString_pronunciationHint_, v8, v9, v10);

  return v11;
}

id HomeAttributeCleaningJob.init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    objc_super v8 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v8 = 0;
  }
  id v9 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  if (a6)
  {
    uint64_t v10 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  v13.receiver = v6;
  v13.super_class = (Class)type metadata accessor for HomeAttributeCleaningJob();
  id v11 = objc_msgSendSuper2(&v13, sel_initWithIdentifier_displayString_pronunciationHint_, v8, v9, v10);

  return v11;
}

uint64_t type metadata accessor for HomeAttributeCleaningJob()
{
  return self;
}

id HomeAttributeCleaningJob.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id HomeAttributeCleaningJob.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for HomeAttributeCleaningJob();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id HomeAttributeCleaningJob.__deallocating_deinit()
{
  return sub_22E6CA59C(type metadata accessor for HomeAttributeCleaningJob);
}

id sub_22E6C9F9C(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___HomeAttributeCleaningJobResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_successWithResolvedObject_, a1);

  return v2;
}

id sub_22E6CA050(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_22E6C1A40();
    swift_bridgeObjectRetain();
    sub_22E6D0CD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_22E6D0FB0();
    sub_22E6C1A40();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_22E6C1A40();
  id v2 = (void *)sub_22E6D0420();
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___HomeAttributeCleaningJobResolutionResult;
  id v3 = objc_msgSendSuper2(&v5, sel_disambiguationWithObjectsToDisambiguate_, v2);

  return v3;
}

id sub_22E6CA1B4(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___HomeAttributeCleaningJobResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_confirmationRequiredWithObjectToConfirm_, a1);

  return v2;
}

id HomeAttributeCleaningJobResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  objc_super v5 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id HomeAttributeCleaningJobResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for HomeAttributeCleaningJobResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for HomeAttributeCleaningJobResolutionResult()
{
  return self;
}

id HomeAttributeCleaningJobResolutionResult.__deallocating_deinit()
{
  return sub_22E6CA59C(type metadata accessor for HomeAttributeCleaningJobResolutionResult);
}

id sub_22E6CA59C(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

char *keypath_get_selector_runState()
{
  return sel_runState;
}

id sub_22E6CA5E0@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_runState);
  *a2 = result;
  return result;
}

id sub_22E6CA614(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setRunState_, *a1);
}

char *keypath_get_selector_cleanModes()
{
  return sel_cleanModes;
}

void sub_22E6CA638(uint64_t a1, void **a2)
{
  id v2 = *a2;
  id v3 = (id)sub_22E6D0420();
  objc_msgSend(v2, sel_setCleanModes_, v3);
}

char *keypath_get_selector_targetAreas()
{
  return sel_targetAreas;
}

id sub_22E6CA6B0@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_targetMap);
  *a2 = result;
  return result;
}

id sub_22E6CA6EC(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTargetMap_, *a1);
}

uint64_t method lookup function for HomeAttributeCleaningJobResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HomeAttributeCleaningJobResolutionResult);
}

uint64_t dispatch thunk of static HomeAttributeCleaningJobResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static HomeAttributeCleaningJobResolutionResult.disambiguation(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of static HomeAttributeCleaningJobResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

void sub_22E6CA754(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_name);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = sub_22E6D0140();
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

void sub_22E6CA7BC(uint64_t a1, void **a2)
{
  id v2 = *a2;
  if (*(void *)(a1 + 8)) {
    uint64_t v3 = sub_22E6D0110();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  objc_msgSend(v2, sel_setName_);
}

id HomeAttributeTargetArea.__allocating_init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    objc_super v8 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v8 = 0;
  }
  id v9 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  if (a6)
  {
    uint64_t v10 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = objc_msgSend(objc_allocWithZone(v6), sel_initWithIdentifier_displayString_pronunciationHint_, v8, v9, v10);

  return v11;
}

id HomeAttributeTargetArea.init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    objc_super v8 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v8 = 0;
  }
  id v9 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  if (a6)
  {
    uint64_t v10 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  v13.receiver = v6;
  v13.super_class = (Class)type metadata accessor for HomeAttributeTargetArea();
  id v11 = objc_msgSendSuper2(&v13, sel_initWithIdentifier_displayString_pronunciationHint_, v8, v9, v10);

  return v11;
}

uint64_t type metadata accessor for HomeAttributeTargetArea()
{
  return self;
}

id HomeAttributeTargetArea.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id HomeAttributeTargetArea.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for HomeAttributeTargetArea();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id HomeAttributeTargetArea.__deallocating_deinit()
{
  return sub_22E6CB19C(type metadata accessor for HomeAttributeTargetArea);
}

id sub_22E6CAB9C(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___HomeAttributeTargetAreaResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_successWithResolvedObject_, a1);

  return v2;
}

id sub_22E6CAC50(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_22E6C1A40();
    swift_bridgeObjectRetain();
    sub_22E6D0CD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_22E6D0FB0();
    sub_22E6C1A40();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_22E6C1A40();
  id v2 = (void *)sub_22E6D0420();
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___HomeAttributeTargetAreaResolutionResult;
  id v3 = objc_msgSendSuper2(&v5, sel_disambiguationWithObjectsToDisambiguate_, v2);

  return v3;
}

id sub_22E6CADB4(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___HomeAttributeTargetAreaResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_confirmationRequiredWithObjectToConfirm_, a1);

  return v2;
}

id HomeAttributeTargetAreaResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  objc_super v5 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id HomeAttributeTargetAreaResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for HomeAttributeTargetAreaResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for HomeAttributeTargetAreaResolutionResult()
{
  return self;
}

id HomeAttributeTargetAreaResolutionResult.__deallocating_deinit()
{
  return sub_22E6CB19C(type metadata accessor for HomeAttributeTargetAreaResolutionResult);
}

id sub_22E6CB19C(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

char *keypath_get_selector_name()
{
  return sel_name;
}

char *keypath_get_selector_areaID()
{
  return sel_areaID;
}

id sub_22E6CB1F4@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_areaID);
  *a2 = result;
  return result;
}

id sub_22E6CB228(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setAreaID_, *a1);
}

char *keypath_get_selector_mapID()
{
  return sel_mapID;
}

id sub_22E6CB248@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_mapID);
  *a2 = result;
  return result;
}

id sub_22E6CB27C(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setMapID_, *a1);
}

uint64_t method lookup function for HomeAttributeTargetAreaResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HomeAttributeTargetAreaResolutionResult);
}

uint64_t dispatch thunk of static HomeAttributeTargetAreaResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static HomeAttributeTargetAreaResolutionResult.disambiguation(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of static HomeAttributeTargetAreaResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

id HomeAttributeTargetMap.__allocating_init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    objc_super v8 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v8 = 0;
  }
  id v9 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  if (a6)
  {
    uint64_t v10 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = objc_msgSend(objc_allocWithZone(v6), sel_initWithIdentifier_displayString_pronunciationHint_, v8, v9, v10);

  return v11;
}

id HomeAttributeTargetMap.init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    objc_super v8 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v8 = 0;
  }
  id v9 = (void *)sub_22E6D0110();
  swift_bridgeObjectRelease();
  if (a6)
  {
    uint64_t v10 = (void *)sub_22E6D0110();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  v13.receiver = v6;
  v13.super_class = (Class)type metadata accessor for HomeAttributeTargetMap();
  id v11 = objc_msgSendSuper2(&v13, sel_initWithIdentifier_displayString_pronunciationHint_, v8, v9, v10);

  return v11;
}

uint64_t type metadata accessor for HomeAttributeTargetMap()
{
  return self;
}

id HomeAttributeTargetMap.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id HomeAttributeTargetMap.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for HomeAttributeTargetMap();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id HomeAttributeTargetMap.__deallocating_deinit()
{
  return sub_22E6CBC54(type metadata accessor for HomeAttributeTargetMap);
}

id sub_22E6CB654(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___HomeAttributeTargetMapResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_successWithResolvedObject_, a1);

  return v2;
}

id sub_22E6CB708(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_22E6C1A40();
    swift_bridgeObjectRetain();
    sub_22E6D0CD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_22E6D0FB0();
    sub_22E6C1A40();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_22E6C1A40();
  id v2 = (void *)sub_22E6D0420();
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___HomeAttributeTargetMapResolutionResult;
  id v3 = objc_msgSendSuper2(&v5, sel_disambiguationWithObjectsToDisambiguate_, v2);

  return v3;
}

id sub_22E6CB86C(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___HomeAttributeTargetMapResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_confirmationRequiredWithObjectToConfirm_, a1);

  return v2;
}

id HomeAttributeTargetMapResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  objc_super v5 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id HomeAttributeTargetMapResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for HomeAttributeTargetMapResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for HomeAttributeTargetMapResolutionResult()
{
  return self;
}

id HomeAttributeTargetMapResolutionResult.__deallocating_deinit()
{
  return sub_22E6CBC54(type metadata accessor for HomeAttributeTargetMapResolutionResult);
}

id sub_22E6CBC54(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

id sub_22E6CBC94@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_mapID);
  *a2 = result;
  return result;
}

id sub_22E6CBCC8(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setMapID_, *a1);
}

uint64_t method lookup function for HomeAttributeTargetMapResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HomeAttributeTargetMapResolutionResult);
}

uint64_t dispatch thunk of static HomeAttributeTargetMapResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static HomeAttributeTargetMapResolutionResult.disambiguation(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of static HomeAttributeTargetMapResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_22E6CBD30()
{
  return MEMORY[0x270EEDDD8]();
}

uint64_t sub_22E6CBD40()
{
  return MEMORY[0x270EEDE08]();
}

uint64_t sub_22E6CBD50()
{
  return MEMORY[0x270EEDE20]();
}

uint64_t sub_22E6CBD60()
{
  return MEMORY[0x270EEDEF0]();
}

uint64_t sub_22E6CBD70()
{
  return MEMORY[0x270EEDF28]();
}

uint64_t sub_22E6CBD80()
{
  return MEMORY[0x270EEDF40]();
}

uint64_t sub_22E6CBD90()
{
  return MEMORY[0x270EEDF58]();
}

uint64_t sub_22E6CBDA0()
{
  return MEMORY[0x270EEDFB0]();
}

uint64_t sub_22E6CBDB0()
{
  return MEMORY[0x270EEE0B8]();
}

uint64_t sub_22E6CBDC0()
{
  return MEMORY[0x270EEE110]();
}

uint64_t sub_22E6CBDD0()
{
  return MEMORY[0x270EEE118]();
}

uint64_t sub_22E6CBDE0()
{
  return MEMORY[0x270EEE178]();
}

uint64_t sub_22E6CBDF0()
{
  return MEMORY[0x270EEE180]();
}

uint64_t sub_22E6CBE00()
{
  return MEMORY[0x270EEE1F8]();
}

uint64_t sub_22E6CBE10()
{
  return MEMORY[0x270EEE250]();
}

uint64_t sub_22E6CBE20()
{
  return MEMORY[0x270EEE2E0]();
}

uint64_t sub_22E6CBE30()
{
  return MEMORY[0x270EEE340]();
}

uint64_t sub_22E6CBE40()
{
  return MEMORY[0x270EEE620]();
}

uint64_t sub_22E6CBE50()
{
  return MEMORY[0x270EEE630]();
}

uint64_t sub_22E6CBE60()
{
  return MEMORY[0x270EEE640]();
}

uint64_t sub_22E6CBE70()
{
  return MEMORY[0x270EEE650]();
}

uint64_t sub_22E6CBE80()
{
  return MEMORY[0x270EEE660]();
}

uint64_t sub_22E6CBE90()
{
  return MEMORY[0x270EEE668]();
}

uint64_t sub_22E6CBEA0()
{
  return MEMORY[0x270EEE690]();
}

uint64_t sub_22E6CBEB0()
{
  return MEMORY[0x270EEE740]();
}

uint64_t sub_22E6CBEC0()
{
  return MEMORY[0x270EEE750]();
}

uint64_t sub_22E6CBED0()
{
  return MEMORY[0x270EEE758]();
}

uint64_t sub_22E6CBEE0()
{
  return MEMORY[0x270EEE770]();
}

uint64_t sub_22E6CBEF0()
{
  return MEMORY[0x270EEE7A8]();
}

uint64_t sub_22E6CBF00()
{
  return MEMORY[0x270EEE7C0]();
}

uint64_t sub_22E6CBF10()
{
  return MEMORY[0x270EEE820]();
}

uint64_t sub_22E6CBF20()
{
  return MEMORY[0x270EEE840]();
}

uint64_t sub_22E6CBF30()
{
  return MEMORY[0x270EEE878]();
}

uint64_t sub_22E6CBF40()
{
  return MEMORY[0x270EEE888]();
}

uint64_t sub_22E6CBF50()
{
  return MEMORY[0x270EEE8F0]();
}

uint64_t sub_22E6CBF60()
{
  return MEMORY[0x270EEEA58]();
}

uint64_t sub_22E6CBF70()
{
  return MEMORY[0x270EEF780]();
}

uint64_t sub_22E6CBF80()
{
  return MEMORY[0x270EEF798]();
}

uint64_t sub_22E6CBF90()
{
  return MEMORY[0x270EEF7A8]();
}

uint64_t sub_22E6CBFA0()
{
  return MEMORY[0x270EEF7B0]();
}

uint64_t sub_22E6CBFB0()
{
  return MEMORY[0x270EEF7C0]();
}

uint64_t sub_22E6CBFC0()
{
  return MEMORY[0x270EEF7D8]();
}

uint64_t sub_22E6CBFD0()
{
  return MEMORY[0x270EEF7F0]();
}

uint64_t sub_22E6CBFE0()
{
  return MEMORY[0x270EEF7F8]();
}

uint64_t sub_22E6CBFF0()
{
  return MEMORY[0x270EEF828]();
}

uint64_t sub_22E6CC000()
{
  return MEMORY[0x270EEF838]();
}

uint64_t sub_22E6CC010()
{
  return MEMORY[0x270EEFC60]();
}

uint64_t sub_22E6CC020()
{
  return MEMORY[0x270EEFD20]();
}

uint64_t sub_22E6CC030()
{
  return MEMORY[0x270EEFDC8]();
}

uint64_t sub_22E6CC040()
{
  return MEMORY[0x270EEFE28]();
}

uint64_t sub_22E6CC050()
{
  return MEMORY[0x270EEFF08]();
}

uint64_t sub_22E6CC060()
{
  return MEMORY[0x270EEFF70]();
}

uint64_t sub_22E6CC070()
{
  return MEMORY[0x270EEFFA8]();
}

uint64_t sub_22E6CC080()
{
  return MEMORY[0x270EF0028]();
}

uint64_t sub_22E6CC090()
{
  return MEMORY[0x270EF0068]();
}

uint64_t sub_22E6CC0A0()
{
  return MEMORY[0x270EF0088]();
}

uint64_t sub_22E6CC0B0()
{
  return MEMORY[0x270EF00B8]();
}

uint64_t sub_22E6CC0C0()
{
  return MEMORY[0x270EF0128]();
}

uint64_t sub_22E6CC0D0()
{
  return MEMORY[0x270EF0138]();
}

uint64_t sub_22E6CC0E0()
{
  return MEMORY[0x270EF0170]();
}

uint64_t sub_22E6CC0F0()
{
  return MEMORY[0x270EF02C0]();
}

uint64_t sub_22E6CC100()
{
  return MEMORY[0x270EF08A0]();
}

uint64_t sub_22E6CC110()
{
  return MEMORY[0x270EF0990]();
}

uint64_t sub_22E6CC120()
{
  return MEMORY[0x270EF09A0]();
}

uint64_t sub_22E6CC130()
{
  return MEMORY[0x270EF09B0]();
}

uint64_t sub_22E6CC140()
{
  return MEMORY[0x270EF0B00]();
}

uint64_t sub_22E6CC150()
{
  return MEMORY[0x270EF0B90]();
}

uint64_t sub_22E6CC160()
{
  return MEMORY[0x270EF0BB0]();
}

uint64_t sub_22E6CC170()
{
  return MEMORY[0x270EF0BC0]();
}

uint64_t sub_22E6CC180()
{
  return MEMORY[0x270EF0BC8]();
}

uint64_t sub_22E6CC190()
{
  return MEMORY[0x270EF0BE0]();
}

uint64_t sub_22E6CC1A0()
{
  return MEMORY[0x270EF0C28]();
}

uint64_t sub_22E6CC1B0()
{
  return MEMORY[0x270EF0C38]();
}

uint64_t sub_22E6CC1C0()
{
  return MEMORY[0x270EF0C50]();
}

uint64_t sub_22E6CC1D0()
{
  return MEMORY[0x270EF0C60]();
}

uint64_t sub_22E6CC1E0()
{
  return MEMORY[0x270EF0C78]();
}

uint64_t sub_22E6CC1F0()
{
  return MEMORY[0x270EF0C90]();
}

uint64_t sub_22E6CC200()
{
  return MEMORY[0x270EF0CA8]();
}

uint64_t sub_22E6CC210()
{
  return MEMORY[0x270EF0CC0]();
}

uint64_t sub_22E6CC220()
{
  return MEMORY[0x270EF0D00]();
}

uint64_t sub_22E6CC230()
{
  return MEMORY[0x270EF0D10]();
}

uint64_t sub_22E6CC240()
{
  return MEMORY[0x270EF0D88]();
}

uint64_t sub_22E6CC250()
{
  return MEMORY[0x270EF0F50]();
}

uint64_t sub_22E6CC260()
{
  return MEMORY[0x270EF0F68]();
}

uint64_t sub_22E6CC270()
{
  return MEMORY[0x270EF0FA8]();
}

uint64_t sub_22E6CC280()
{
  return MEMORY[0x270EF1048]();
}

uint64_t sub_22E6CC290()
{
  return MEMORY[0x270EF1068]();
}

uint64_t sub_22E6CC2A0()
{
  return MEMORY[0x270EF1088]();
}

uint64_t sub_22E6CC2B0()
{
  return MEMORY[0x270EF10B0]();
}

uint64_t sub_22E6CC2C0()
{
  return MEMORY[0x270EF1148]();
}

uint64_t sub_22E6CC2D0()
{
  return MEMORY[0x270EF1158]();
}

uint64_t sub_22E6CC2E0()
{
  return MEMORY[0x270EF1238]();
}

uint64_t sub_22E6CC2F0()
{
  return MEMORY[0x270EF1250]();
}

uint64_t sub_22E6CC300()
{
  return MEMORY[0x270EF1270]();
}

uint64_t sub_22E6CC310()
{
  return MEMORY[0x270EF1278]();
}

uint64_t sub_22E6CC320()
{
  return MEMORY[0x270EF12B8]();
}

uint64_t sub_22E6CC330()
{
  return MEMORY[0x270EF1348]();
}

uint64_t sub_22E6CC340()
{
  return MEMORY[0x270EF1360]();
}

uint64_t sub_22E6CC350()
{
  return MEMORY[0x270EF1370]();
}

uint64_t sub_22E6CC360()
{
  return MEMORY[0x270EF1390]();
}

uint64_t sub_22E6CC370()
{
  return MEMORY[0x270EF13E0]();
}

uint64_t sub_22E6CC380()
{
  return MEMORY[0x270EF13F8]();
}

uint64_t sub_22E6CC390()
{
  return MEMORY[0x270EF1420]();
}

uint64_t sub_22E6CC3A0()
{
  return MEMORY[0x270EF1448]();
}

uint64_t sub_22E6CC3B0()
{
  return MEMORY[0x270EF1598]();
}

uint64_t sub_22E6CC3C0()
{
  return MEMORY[0x270EF15C0]();
}

uint64_t sub_22E6CC3D0()
{
  return MEMORY[0x270EF15F0]();
}

uint64_t sub_22E6CC3E0()
{
  return MEMORY[0x270EF15F8]();
}

uint64_t sub_22E6CC3F0()
{
  return MEMORY[0x270EF1610]();
}

uint64_t sub_22E6CC400()
{
  return MEMORY[0x270F74438]();
}

uint64_t sub_22E6CC410()
{
  return MEMORY[0x270F74440]();
}

uint64_t sub_22E6CC420()
{
  return MEMORY[0x270F74448]();
}

uint64_t sub_22E6CC430()
{
  return MEMORY[0x270F74450]();
}

uint64_t sub_22E6CC440()
{
  return MEMORY[0x270F74458]();
}

uint64_t sub_22E6CC450()
{
  return MEMORY[0x270F74E00]();
}

uint64_t sub_22E6CC460()
{
  return MEMORY[0x270F74E08]();
}

uint64_t sub_22E6CC470()
{
  return MEMORY[0x270F756A0]();
}

uint64_t sub_22E6CC480()
{
  return MEMORY[0x270F756A8]();
}

uint64_t sub_22E6CC490()
{
  return MEMORY[0x270F756B0]();
}

uint64_t sub_22E6CC4A0()
{
  return MEMORY[0x270F756B8]();
}

uint64_t sub_22E6CC4B0()
{
  return MEMORY[0x270F756C0]();
}

uint64_t sub_22E6CC4C0()
{
  return MEMORY[0x270F756C8]();
}

uint64_t sub_22E6CC4F0()
{
  return MEMORY[0x270F66328]();
}

uint64_t sub_22E6CC510()
{
  return MEMORY[0x270F66360]();
}

uint64_t sub_22E6CC560()
{
  return MEMORY[0x270F663D8]();
}

uint64_t sub_22E6CC570()
{
  return MEMORY[0x270F663E0]();
}

uint64_t sub_22E6CC620()
{
  return MEMORY[0x270F66510]();
}

uint64_t sub_22E6CC670()
{
  return MEMORY[0x270F665D0]();
}

uint64_t sub_22E6CC680()
{
  return MEMORY[0x270F665D8]();
}

uint64_t sub_22E6CC690()
{
  return MEMORY[0x270F665E0]();
}

uint64_t sub_22E6CC6A0()
{
  return MEMORY[0x270F665F0]();
}

uint64_t sub_22E6CC6B0()
{
  return MEMORY[0x270F66618]();
}

uint64_t sub_22E6CC6C0()
{
  return MEMORY[0x270F66620]();
}

uint64_t sub_22E6CC770()
{
  return MEMORY[0x270F66710]();
}

uint64_t sub_22E6CC790()
{
  return MEMORY[0x270F66780]();
}

uint64_t sub_22E6CC7A0()
{
  return MEMORY[0x270F66788]();
}

uint64_t sub_22E6CC7C0()
{
  return MEMORY[0x270F667A0]();
}

uint64_t sub_22E6CC7D0()
{
  return MEMORY[0x270F667A8]();
}

uint64_t sub_22E6CC7F0()
{
  return MEMORY[0x270F66888]();
}

uint64_t sub_22E6CC800()
{
  return MEMORY[0x270F668B8]();
}

uint64_t sub_22E6CC810()
{
  return MEMORY[0x270F66960]();
}

uint64_t sub_22E6CC820()
{
  return MEMORY[0x270F66978]();
}

uint64_t sub_22E6CC830()
{
  return MEMORY[0x270F66980]();
}

uint64_t sub_22E6CC840()
{
  return MEMORY[0x270F66988]();
}

uint64_t sub_22E6CC850()
{
  return MEMORY[0x270F669B0]();
}

uint64_t sub_22E6CC860()
{
  return MEMORY[0x270F669D0]();
}

uint64_t sub_22E6CC870()
{
  return MEMORY[0x270F669D8]();
}

uint64_t sub_22E6CC880()
{
  return MEMORY[0x270F669E0]();
}

uint64_t sub_22E6CC890()
{
  return MEMORY[0x270F66A68]();
}

uint64_t sub_22E6CC8A0()
{
  return MEMORY[0x270F66A88]();
}

uint64_t sub_22E6CC8B0()
{
  return MEMORY[0x270F66A98]();
}

uint64_t sub_22E6CC8C0()
{
  return MEMORY[0x270F66AC8]();
}

uint64_t sub_22E6CC8D0()
{
  return MEMORY[0x270F66AE0]();
}

uint64_t sub_22E6CC8E0()
{
  return MEMORY[0x270F66AF8]();
}

uint64_t sub_22E6CC8F0()
{
  return MEMORY[0x270F66B10]();
}

uint64_t sub_22E6CC900()
{
  return MEMORY[0x270F66B40]();
}

uint64_t sub_22E6CC910()
{
  return MEMORY[0x270F66B48]();
}

uint64_t sub_22E6CC920()
{
  return MEMORY[0x270F66B50]();
}

uint64_t sub_22E6CC930()
{
  return MEMORY[0x270F66B58]();
}

uint64_t sub_22E6CC940()
{
  return MEMORY[0x270F66B68]();
}

uint64_t sub_22E6CC950()
{
  return MEMORY[0x270F66B70]();
}

uint64_t sub_22E6CC960()
{
  return MEMORY[0x270F66B78]();
}

uint64_t sub_22E6CC970()
{
  return MEMORY[0x270F66B90]();
}

uint64_t sub_22E6CC980()
{
  return MEMORY[0x270F66BA0]();
}

uint64_t sub_22E6CC990()
{
  return MEMORY[0x270F66C58]();
}

uint64_t sub_22E6CC9A0()
{
  return MEMORY[0x270F66C80]();
}

uint64_t sub_22E6CC9B0()
{
  return MEMORY[0x270F66CA8]();
}

uint64_t sub_22E6CC9C0()
{
  return MEMORY[0x270F66CC0]();
}

uint64_t sub_22E6CC9D0()
{
  return MEMORY[0x270F66CC8]();
}

uint64_t sub_22E6CC9F0()
{
  return MEMORY[0x270F66CE8]();
}

uint64_t sub_22E6CCA00()
{
  return MEMORY[0x270F66CF8]();
}

uint64_t sub_22E6CCA10()
{
  return MEMORY[0x270F66D18]();
}

uint64_t sub_22E6CCA20()
{
  return MEMORY[0x270F66D20]();
}

uint64_t sub_22E6CCA30()
{
  return MEMORY[0x270F66D28]();
}

uint64_t sub_22E6CCA40()
{
  return MEMORY[0x270F66D30]();
}

uint64_t sub_22E6CCA50()
{
  return MEMORY[0x270F66D38]();
}

uint64_t sub_22E6CCA60()
{
  return MEMORY[0x270F66D60]();
}

uint64_t sub_22E6CCA70()
{
  return MEMORY[0x270F66DA0]();
}

uint64_t sub_22E6CCA80()
{
  return MEMORY[0x270F66DB8]();
}

uint64_t sub_22E6CCA90()
{
  return MEMORY[0x270F66DC8]();
}

uint64_t sub_22E6CCAA0()
{
  return MEMORY[0x270F66DD0]();
}

uint64_t sub_22E6CCAB0()
{
  return MEMORY[0x270F66DD8]();
}

uint64_t sub_22E6CCAC0()
{
  return MEMORY[0x270F66E00]();
}

uint64_t sub_22E6CCAD0()
{
  return MEMORY[0x270F66E08]();
}

uint64_t sub_22E6CCAE0()
{
  return MEMORY[0x270F66E20]();
}

uint64_t sub_22E6CCAF0()
{
  return MEMORY[0x270F66E28]();
}

uint64_t sub_22E6CCB00()
{
  return MEMORY[0x270F66E30]();
}

uint64_t sub_22E6CCB10()
{
  return MEMORY[0x270F66E38]();
}

uint64_t sub_22E6CCB20()
{
  return MEMORY[0x270F66F18]();
}

uint64_t sub_22E6CCB30()
{
  return MEMORY[0x270F66F28]();
}

uint64_t sub_22E6CCB40()
{
  return MEMORY[0x270F67000]();
}

uint64_t sub_22E6CCB50()
{
  return MEMORY[0x270F67010]();
}

uint64_t sub_22E6CCB60()
{
  return MEMORY[0x270F67018]();
}

uint64_t sub_22E6CCB70()
{
  return MEMORY[0x270F67020]();
}

uint64_t sub_22E6CCB80()
{
  return MEMORY[0x270F67028]();
}

uint64_t sub_22E6CCB90()
{
  return MEMORY[0x270F67030]();
}

uint64_t sub_22E6CCBA0()
{
  return MEMORY[0x270F67050]();
}

uint64_t sub_22E6CCBB0()
{
  return MEMORY[0x270F67068]();
}

uint64_t sub_22E6CCBC0()
{
  return MEMORY[0x270F670A0]();
}

uint64_t sub_22E6CCBD0()
{
  return MEMORY[0x270F67180]();
}

uint64_t sub_22E6CCBE0()
{
  return MEMORY[0x270F67198]();
}

uint64_t sub_22E6CCBF0()
{
  return MEMORY[0x270F671A8]();
}

uint64_t sub_22E6CCC00()
{
  return MEMORY[0x270F671B8]();
}

uint64_t sub_22E6CCC10()
{
  return MEMORY[0x270F671D8]();
}

uint64_t sub_22E6CCC20()
{
  return MEMORY[0x270F671E8]();
}

uint64_t sub_22E6CCC30()
{
  return MEMORY[0x270F67208]();
}

uint64_t sub_22E6CCC40()
{
  return MEMORY[0x270F67210]();
}

uint64_t sub_22E6CCC50()
{
  return MEMORY[0x270F67218]();
}

uint64_t sub_22E6CCC60()
{
  return MEMORY[0x270F67220]();
}

uint64_t sub_22E6CCC70()
{
  return MEMORY[0x270F67228]();
}

uint64_t sub_22E6CCC80()
{
  return MEMORY[0x270F67230]();
}

uint64_t sub_22E6CCC90()
{
  return MEMORY[0x270F67238]();
}

uint64_t sub_22E6CCCA0()
{
  return MEMORY[0x270F67240]();
}

uint64_t sub_22E6CCCB0()
{
  return MEMORY[0x270F672B0]();
}

uint64_t sub_22E6CCCC0()
{
  return MEMORY[0x270F672D8]();
}

uint64_t sub_22E6CCCD0()
{
  return MEMORY[0x270F672E8]();
}

uint64_t sub_22E6CCCE0()
{
  return MEMORY[0x270F67300]();
}

uint64_t sub_22E6CCCF0()
{
  return MEMORY[0x270F67340]();
}

uint64_t sub_22E6CCD00()
{
  return MEMORY[0x270F67368]();
}

uint64_t sub_22E6CCD10()
{
  return MEMORY[0x270F67370]();
}

uint64_t sub_22E6CCD20()
{
  return MEMORY[0x270F67380]();
}

uint64_t sub_22E6CCD30()
{
  return MEMORY[0x270F67388]();
}

uint64_t sub_22E6CCD40()
{
  return MEMORY[0x270F67398]();
}

uint64_t sub_22E6CCD50()
{
  return MEMORY[0x270F673A8]();
}

uint64_t sub_22E6CCD60()
{
  return MEMORY[0x270F67418]();
}

uint64_t sub_22E6CCD70()
{
  return MEMORY[0x270F67420]();
}

uint64_t sub_22E6CCD80()
{
  return MEMORY[0x270F67430]();
}

uint64_t sub_22E6CCD90()
{
  return MEMORY[0x270F67500]();
}

uint64_t sub_22E6CCDA0()
{
  return MEMORY[0x270F67508]();
}

uint64_t sub_22E6CCDB0()
{
  return MEMORY[0x270F67510]();
}

uint64_t sub_22E6CCDC0()
{
  return MEMORY[0x270F675B0]();
}

uint64_t sub_22E6CCDD0()
{
  return MEMORY[0x270F675C8]();
}

uint64_t sub_22E6CCDE0()
{
  return MEMORY[0x270F67600]();
}

uint64_t sub_22E6CCDF0()
{
  return MEMORY[0x270F67608]();
}

uint64_t sub_22E6CCE00()
{
  return MEMORY[0x270F67640]();
}

uint64_t sub_22E6CCE10()
{
  return MEMORY[0x270F67650]();
}

uint64_t sub_22E6CCE20()
{
  return MEMORY[0x270F67658]();
}

uint64_t sub_22E6CCE30()
{
  return MEMORY[0x270F67678]();
}

uint64_t sub_22E6CCE40()
{
  return MEMORY[0x270F67688]();
}

uint64_t sub_22E6CCE50()
{
  return MEMORY[0x270F676B8]();
}

uint64_t sub_22E6CCE60()
{
  return MEMORY[0x270F676D8]();
}

uint64_t sub_22E6CCE70()
{
  return MEMORY[0x270F676E0]();
}

uint64_t sub_22E6CCE80()
{
  return MEMORY[0x270F67700]();
}

uint64_t sub_22E6CCE90()
{
  return MEMORY[0x270F67708]();
}

uint64_t sub_22E6CCEA0()
{
  return MEMORY[0x270F67718]();
}

uint64_t sub_22E6CCEB0()
{
  return MEMORY[0x270F67720]();
}

uint64_t sub_22E6CCEC0()
{
  return MEMORY[0x270F67728]();
}

uint64_t sub_22E6CCED0()
{
  return MEMORY[0x270F67730]();
}

uint64_t sub_22E6CCEE0()
{
  return MEMORY[0x270F67738]();
}

uint64_t sub_22E6CCEF0()
{
  return MEMORY[0x270F67740]();
}

uint64_t sub_22E6CCF00()
{
  return MEMORY[0x270F67750]();
}

uint64_t sub_22E6CCF10()
{
  return MEMORY[0x270F67758]();
}

uint64_t sub_22E6CCF20()
{
  return MEMORY[0x270F67760]();
}

uint64_t sub_22E6CCF30()
{
  return MEMORY[0x270F67768]();
}

uint64_t sub_22E6CCF40()
{
  return MEMORY[0x270F67770]();
}

uint64_t sub_22E6CCF50()
{
  return MEMORY[0x270F67798]();
}

uint64_t sub_22E6CCF60()
{
  return MEMORY[0x270F677A8]();
}

uint64_t sub_22E6CCF70()
{
  return MEMORY[0x270F677B0]();
}

uint64_t sub_22E6CCF80()
{
  return MEMORY[0x270F677C0]();
}

uint64_t sub_22E6CCF90()
{
  return MEMORY[0x270F677D8]();
}

uint64_t sub_22E6CCFA0()
{
  return MEMORY[0x270F677E8]();
}

uint64_t sub_22E6CCFB0()
{
  return MEMORY[0x270F677F0]();
}

uint64_t sub_22E6CCFC0()
{
  return MEMORY[0x270F67800]();
}

uint64_t sub_22E6CCFD0()
{
  return MEMORY[0x270F67810]();
}

uint64_t sub_22E6CCFE0()
{
  return MEMORY[0x270F67820]();
}

uint64_t sub_22E6CCFF0()
{
  return MEMORY[0x270F67828]();
}

uint64_t sub_22E6CD000()
{
  return MEMORY[0x270F67888]();
}

uint64_t sub_22E6CD010()
{
  return MEMORY[0x270F67890]();
}

uint64_t sub_22E6CD020()
{
  return MEMORY[0x270F67928]();
}

uint64_t sub_22E6CD030()
{
  return MEMORY[0x270F67930]();
}

uint64_t sub_22E6CD050()
{
  return MEMORY[0x270F67A58]();
}

uint64_t sub_22E6CD060()
{
  return MEMORY[0x270F67A60]();
}

uint64_t sub_22E6CD070()
{
  return MEMORY[0x270F67A78]();
}

uint64_t sub_22E6CD080()
{
  return MEMORY[0x270F67AB0]();
}

uint64_t sub_22E6CD0F0()
{
  return MEMORY[0x270F67B00]();
}

uint64_t sub_22E6CD100()
{
  return MEMORY[0x270F67B10]();
}

uint64_t sub_22E6CD110()
{
  return MEMORY[0x270F67B18]();
}

uint64_t sub_22E6CD120()
{
  return MEMORY[0x270F67B60]();
}

uint64_t sub_22E6CD130()
{
  return MEMORY[0x270F67B68]();
}

uint64_t sub_22E6CD140()
{
  return MEMORY[0x270F67B70]();
}

uint64_t sub_22E6CD150()
{
  return MEMORY[0x270F67B98]();
}

uint64_t sub_22E6CD160()
{
  return MEMORY[0x270F67BA0]();
}

uint64_t sub_22E6CD170()
{
  return MEMORY[0x270F67BA8]();
}

uint64_t sub_22E6CD180()
{
  return MEMORY[0x270F67BB8]();
}

uint64_t sub_22E6CD190()
{
  return MEMORY[0x270F67BC0]();
}

uint64_t sub_22E6CD1A0()
{
  return MEMORY[0x270F67BC8]();
}

uint64_t sub_22E6CD1B0()
{
  return MEMORY[0x270F67BD0]();
}

uint64_t sub_22E6CD1C0()
{
  return MEMORY[0x270F67BD8]();
}

uint64_t sub_22E6CD1D0()
{
  return MEMORY[0x270F67BE8]();
}

uint64_t sub_22E6CD210()
{
  return MEMORY[0x270F67C28]();
}

uint64_t sub_22E6CD220()
{
  return MEMORY[0x270F67C68]();
}

uint64_t sub_22E6CD230()
{
  return MEMORY[0x270F67C78]();
}

uint64_t sub_22E6CD240()
{
  return MEMORY[0x270F67C80]();
}

uint64_t sub_22E6CD260()
{
  return MEMORY[0x270F67CA0]();
}

uint64_t sub_22E6CD270()
{
  return MEMORY[0x270F67CD0]();
}

uint64_t sub_22E6CD290()
{
  return MEMORY[0x270F67CE8]();
}

uint64_t sub_22E6CD2A0()
{
  return MEMORY[0x270F67CF0]();
}

uint64_t sub_22E6CD2B0()
{
  return MEMORY[0x270F67D28]();
}

uint64_t sub_22E6CD2C0()
{
  return MEMORY[0x270F67D30]();
}

uint64_t sub_22E6CD2D0()
{
  return MEMORY[0x270F67D40]();
}

uint64_t sub_22E6CD2E0()
{
  return MEMORY[0x270F67D58]();
}

uint64_t sub_22E6CD2F0()
{
  return MEMORY[0x270F67DE8]();
}

uint64_t sub_22E6CD300()
{
  return MEMORY[0x270F67E40]();
}

uint64_t sub_22E6CD310()
{
  return MEMORY[0x270F67E50]();
}

uint64_t sub_22E6CD320()
{
  return MEMORY[0x270F67E58]();
}

uint64_t sub_22E6CD330()
{
  return MEMORY[0x270F67E68]();
}

uint64_t sub_22E6CD340()
{
  return MEMORY[0x270F67E78]();
}

uint64_t sub_22E6CD350()
{
  return MEMORY[0x270F67E80]();
}

uint64_t sub_22E6CD360()
{
  return MEMORY[0x270F67E90]();
}

uint64_t sub_22E6CD370()
{
  return MEMORY[0x270F67EA0]();
}

uint64_t sub_22E6CD380()
{
  return MEMORY[0x270F67EB0]();
}

uint64_t sub_22E6CD390()
{
  return MEMORY[0x270F67EB8]();
}

uint64_t sub_22E6CD3A0()
{
  return MEMORY[0x270F67EC0]();
}

uint64_t sub_22E6CD3B0()
{
  return MEMORY[0x270F67ED0]();
}

uint64_t sub_22E6CD3C0()
{
  return MEMORY[0x270F67F18]();
}

uint64_t sub_22E6CD3D0()
{
  return MEMORY[0x270F67F68]();
}

uint64_t sub_22E6CD3E0()
{
  return MEMORY[0x270F67F70]();
}

uint64_t sub_22E6CD3F0()
{
  return MEMORY[0x270F67F78]();
}

uint64_t sub_22E6CD400()
{
  return MEMORY[0x270F68110]();
}

uint64_t sub_22E6CD410()
{
  return MEMORY[0x270F68160]();
}

uint64_t sub_22E6CD440()
{
  return MEMORY[0x270F68210]();
}

uint64_t sub_22E6CD450()
{
  return MEMORY[0x270F68218]();
}

uint64_t sub_22E6CD460()
{
  return MEMORY[0x270F68220]();
}

uint64_t sub_22E6CD470()
{
  return MEMORY[0x270F68228]();
}

uint64_t sub_22E6CD480()
{
  return MEMORY[0x270F68230]();
}

uint64_t sub_22E6CD490()
{
  return MEMORY[0x270F68258]();
}

uint64_t sub_22E6CD4A0()
{
  return MEMORY[0x270F68260]();
}

uint64_t sub_22E6CD4B0()
{
  return MEMORY[0x270F68268]();
}

uint64_t sub_22E6CD4C0()
{
  return MEMORY[0x270F68278]();
}

uint64_t sub_22E6CD4D0()
{
  return MEMORY[0x270F68298]();
}

uint64_t sub_22E6CD4E0()
{
  return MEMORY[0x270F682A0]();
}

uint64_t sub_22E6CD4F0()
{
  return MEMORY[0x270F682B8]();
}

uint64_t sub_22E6CD500()
{
  return MEMORY[0x270F68378]();
}

uint64_t sub_22E6CD510()
{
  return MEMORY[0x270F68380]();
}

uint64_t sub_22E6CD520()
{
  return MEMORY[0x270F68388]();
}

uint64_t sub_22E6CD530()
{
  return MEMORY[0x270F68390]();
}

uint64_t sub_22E6CD540()
{
  return MEMORY[0x270F68398]();
}

uint64_t sub_22E6CD550()
{
  return MEMORY[0x270F683A0]();
}

uint64_t sub_22E6CD560()
{
  return MEMORY[0x270F683A8]();
}

uint64_t sub_22E6CD570()
{
  return MEMORY[0x270F683B0]();
}

uint64_t sub_22E6CD580()
{
  return MEMORY[0x270F683B8]();
}

uint64_t sub_22E6CD590()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_22E6CD5A0()
{
  return MEMORY[0x270F6A2D0]();
}

uint64_t sub_22E6CD5B0()
{
  return MEMORY[0x270F6A350]();
}

uint64_t sub_22E6CD5C0()
{
  return MEMORY[0x270F6A370]();
}

uint64_t sub_22E6CD5D0()
{
  return MEMORY[0x270F6A498]();
}

uint64_t sub_22E6CD5E0()
{
  return MEMORY[0x270F6A4A8]();
}

uint64_t sub_22E6CD5F0()
{
  return MEMORY[0x270F6A4E8]();
}

uint64_t sub_22E6CD600()
{
  return MEMORY[0x270F6A4F8]();
}

uint64_t sub_22E6CD610()
{
  return MEMORY[0x270F6A718]();
}

uint64_t sub_22E6CD620()
{
  return MEMORY[0x270F6A720]();
}

uint64_t sub_22E6CD630()
{
  return MEMORY[0x270F6A728]();
}

uint64_t sub_22E6CD640()
{
  return MEMORY[0x270F6A758]();
}

uint64_t sub_22E6CD650()
{
  return MEMORY[0x270F683C8]();
}

uint64_t sub_22E6CD660()
{
  return MEMORY[0x270F6A768]();
}

uint64_t sub_22E6CD670()
{
  return MEMORY[0x270F6A770]();
}

uint64_t sub_22E6CD680()
{
  return MEMORY[0x270F6A788]();
}

uint64_t sub_22E6CD690()
{
  return MEMORY[0x270F6A7B0]();
}

uint64_t sub_22E6CD6A0()
{
  return MEMORY[0x270F6A7B8]();
}

uint64_t sub_22E6CD6B0()
{
  return MEMORY[0x270F6A7E8]();
}

uint64_t sub_22E6CD6C0()
{
  return MEMORY[0x270F6A860]();
}

uint64_t sub_22E6CD6D0()
{
  return MEMORY[0x270F6A868]();
}

uint64_t sub_22E6CD6E0()
{
  return MEMORY[0x270F6AA80]();
}

uint64_t sub_22E6CD6F0()
{
  return MEMORY[0x270F6AA90]();
}

uint64_t sub_22E6CD700()
{
  return MEMORY[0x270F6AA98]();
}

uint64_t sub_22E6CD710()
{
  return MEMORY[0x270F6AAB0]();
}

uint64_t sub_22E6CD720()
{
  return MEMORY[0x270F6AAB8]();
}

uint64_t sub_22E6CD730()
{
  return MEMORY[0x270F6AAC0]();
}

uint64_t sub_22E6CD740()
{
  return MEMORY[0x270F6AAC8]();
}

uint64_t sub_22E6CD750()
{
  return MEMORY[0x270F6AC20]();
}

uint64_t sub_22E6CD760()
{
  return MEMORY[0x270F6AC88]();
}

uint64_t sub_22E6CD770()
{
  return MEMORY[0x270F6ACA0]();
}

uint64_t sub_22E6CD780()
{
  return MEMORY[0x270F6ACB0]();
}

uint64_t sub_22E6CD790()
{
  return MEMORY[0x270F6ACB8]();
}

uint64_t sub_22E6CD7A0()
{
  return MEMORY[0x270F6ADB0]();
}

uint64_t sub_22E6CD7B0()
{
  return MEMORY[0x270F6ADB8]();
}

uint64_t sub_22E6CD7C0()
{
  return MEMORY[0x270F6ADC0]();
}

uint64_t sub_22E6CD7D0()
{
  return MEMORY[0x270F6AF68]();
}

uint64_t sub_22E6CD7E0()
{
  return MEMORY[0x270F6AF70]();
}

uint64_t sub_22E6CD7F0()
{
  return MEMORY[0x270F6AF78]();
}

uint64_t sub_22E6CD800()
{
  return MEMORY[0x270F6AFB0]();
}

uint64_t sub_22E6CD810()
{
  return MEMORY[0x270F6AFC8]();
}

uint64_t sub_22E6CD820()
{
  return MEMORY[0x270F6BAF8]();
}

uint64_t sub_22E6CD830()
{
  return MEMORY[0x270F6BB00]();
}

uint64_t sub_22E6CD840()
{
  return MEMORY[0x270F6BB08]();
}

uint64_t sub_22E6CD850()
{
  return MEMORY[0x270F6BB28]();
}

uint64_t sub_22E6CD860()
{
  return MEMORY[0x270F6BB38]();
}

uint64_t sub_22E6CD870()
{
  return MEMORY[0x270F6BFC0]();
}

uint64_t sub_22E6CD880()
{
  return MEMORY[0x270F6BFC8]();
}

uint64_t sub_22E6CD890()
{
  return MEMORY[0x270F6BFD0]();
}

uint64_t sub_22E6CD8A0()
{
  return MEMORY[0x270F6BFD8]();
}

uint64_t sub_22E6CD8B0()
{
  return MEMORY[0x270F6BFE0]();
}

uint64_t sub_22E6CD8C0()
{
  return MEMORY[0x270F6BFF0]();
}

uint64_t sub_22E6CD8D0()
{
  return MEMORY[0x270F6C048]();
}

uint64_t sub_22E6CD8E0()
{
  return MEMORY[0x270F6C080]();
}

uint64_t sub_22E6CD8F0()
{
  return MEMORY[0x270F6C090]();
}

uint64_t sub_22E6CD900()
{
  return MEMORY[0x270F6C0A0]();
}

uint64_t sub_22E6CD910()
{
  return MEMORY[0x270F6C0A8]();
}

uint64_t sub_22E6CD920()
{
  return MEMORY[0x270F6C0B0]();
}

uint64_t sub_22E6CD930()
{
  return MEMORY[0x270F6C0B8]();
}

uint64_t sub_22E6CD940()
{
  return MEMORY[0x270F6C108]();
}

uint64_t sub_22E6CD950()
{
  return MEMORY[0x270F6C110]();
}

uint64_t sub_22E6CD960()
{
  return MEMORY[0x270F6C190]();
}

uint64_t sub_22E6CD970()
{
  return MEMORY[0x270F6C198]();
}

uint64_t sub_22E6CD980()
{
  return MEMORY[0x270F6C240]();
}

uint64_t sub_22E6CD990()
{
  return MEMORY[0x270F6C808]();
}

uint64_t sub_22E6CD9A0()
{
  return MEMORY[0x270F6C810]();
}

uint64_t sub_22E6CD9B0()
{
  return MEMORY[0x270F6C848]();
}

uint64_t sub_22E6CD9C0()
{
  return MEMORY[0x270F6C8A0]();
}

uint64_t sub_22E6CD9D0()
{
  return MEMORY[0x270F6C8B0]();
}

uint64_t sub_22E6CD9E0()
{
  return MEMORY[0x270F6C8C0]();
}

uint64_t sub_22E6CD9F0()
{
  return MEMORY[0x270F6C8C8]();
}

uint64_t sub_22E6CDA00()
{
  return MEMORY[0x270F6C8D0]();
}

uint64_t sub_22E6CDA10()
{
  return MEMORY[0x270F6C8D8]();
}

uint64_t sub_22E6CDA20()
{
  return MEMORY[0x270F6C8E0]();
}

uint64_t sub_22E6CDA30()
{
  return MEMORY[0x270F6C8E8]();
}

uint64_t sub_22E6CDA40()
{
  return MEMORY[0x270F6C8F8]();
}

uint64_t sub_22E6CDA50()
{
  return MEMORY[0x270F6C910]();
}

uint64_t sub_22E6CDA60()
{
  return MEMORY[0x270F6C920]();
}

uint64_t sub_22E6CDA70()
{
  return MEMORY[0x270F6C928]();
}

uint64_t sub_22E6CDA80()
{
  return MEMORY[0x270F6C938]();
}

uint64_t sub_22E6CDA90()
{
  return MEMORY[0x270F6C940]();
}

uint64_t sub_22E6CDAA0()
{
  return MEMORY[0x270F6C948]();
}

uint64_t sub_22E6CDAB0()
{
  return MEMORY[0x270F6C958]();
}

uint64_t sub_22E6CDAC0()
{
  return MEMORY[0x270F6C968]();
}

uint64_t sub_22E6CDAD0()
{
  return MEMORY[0x270F6C970]();
}

uint64_t sub_22E6CDAE0()
{
  return MEMORY[0x270F6C978]();
}

uint64_t sub_22E6CDAF0()
{
  return MEMORY[0x270F6C988]();
}

uint64_t sub_22E6CDB00()
{
  return MEMORY[0x270F6C990]();
}

uint64_t sub_22E6CDB10()
{
  return MEMORY[0x270F6C998]();
}

uint64_t sub_22E6CDB20()
{
  return MEMORY[0x270F6C9A8]();
}

uint64_t sub_22E6CDB30()
{
  return MEMORY[0x270F6C9B8]();
}

uint64_t sub_22E6CDB40()
{
  return MEMORY[0x270F6C9C0]();
}

uint64_t sub_22E6CDB50()
{
  return MEMORY[0x270F6C9C8]();
}

uint64_t sub_22E6CDB60()
{
  return MEMORY[0x270F6C9D0]();
}

uint64_t sub_22E6CDB70()
{
  return MEMORY[0x270F6C9D8]();
}

uint64_t sub_22E6CDB80()
{
  return MEMORY[0x270F6C9E0]();
}

uint64_t sub_22E6CDB90()
{
  return MEMORY[0x270F6CA18]();
}

uint64_t sub_22E6CDBA0()
{
  return MEMORY[0x270F6CA20]();
}

uint64_t sub_22E6CDBB0()
{
  return MEMORY[0x270F6CA30]();
}

uint64_t sub_22E6CDBC0()
{
  return MEMORY[0x270F6CA48]();
}

uint64_t sub_22E6CDBD0()
{
  return MEMORY[0x270F6CA50]();
}

uint64_t sub_22E6CDBE0()
{
  return MEMORY[0x270F6CA58]();
}

uint64_t sub_22E6CDC00()
{
  return MEMORY[0x270F6CA68]();
}

uint64_t sub_22E6CDC20()
{
  return MEMORY[0x270F6CA98]();
}

uint64_t sub_22E6CDC30()
{
  return MEMORY[0x270F6CAB8]();
}

uint64_t sub_22E6CDC40()
{
  return MEMORY[0x270F6CAC0]();
}

uint64_t sub_22E6CDC50()
{
  return MEMORY[0x270F6CAC8]();
}

uint64_t sub_22E6CDC60()
{
  return MEMORY[0x270F65408]();
}

uint64_t sub_22E6CDC70()
{
  return MEMORY[0x270F6CB28]();
}

uint64_t sub_22E6CDC80()
{
  return MEMORY[0x270F6CB50]();
}

uint64_t sub_22E6CDC90()
{
  return MEMORY[0x270F6CB68]();
}

uint64_t sub_22E6CDCA0()
{
  return MEMORY[0x270F6CB70]();
}

uint64_t sub_22E6CDCB0()
{
  return MEMORY[0x270F6CBF8]();
}

uint64_t sub_22E6CDCC0()
{
  return MEMORY[0x270F6CC00]();
}

uint64_t sub_22E6CDCD0()
{
  return MEMORY[0x270F6CC08]();
}

uint64_t sub_22E6CDCE0()
{
  return MEMORY[0x270F6CC18]();
}

uint64_t sub_22E6CDCF0()
{
  return MEMORY[0x270F6CC20]();
}

uint64_t sub_22E6CDD00()
{
  return MEMORY[0x270F6CC30]();
}

uint64_t sub_22E6CDD10()
{
  return MEMORY[0x270F6CC90]();
}

uint64_t sub_22E6CDD20()
{
  return MEMORY[0x270F6CCA0]();
}

uint64_t sub_22E6CDD30()
{
  return MEMORY[0x270F6CCA8]();
}

uint64_t sub_22E6CDD40()
{
  return MEMORY[0x270F6CCB0]();
}

uint64_t sub_22E6CDD50()
{
  return MEMORY[0x270F6CCE0]();
}

uint64_t sub_22E6CDD60()
{
  return MEMORY[0x270F6CD18]();
}

uint64_t sub_22E6CDD70()
{
  return MEMORY[0x270F6CD20]();
}

uint64_t sub_22E6CDD80()
{
  return MEMORY[0x270F6CD28]();
}

uint64_t sub_22E6CDD90()
{
  return MEMORY[0x270F6CD30]();
}

uint64_t sub_22E6CDDA0()
{
  return MEMORY[0x270F6CD40]();
}

uint64_t sub_22E6CDDB0()
{
  return MEMORY[0x270F6CD48]();
}

uint64_t sub_22E6CDDC0()
{
  return MEMORY[0x270F6CD60]();
}

uint64_t sub_22E6CDDD0()
{
  return MEMORY[0x270F6CD70]();
}

uint64_t sub_22E6CDDE0()
{
  return MEMORY[0x270F6CD78]();
}

uint64_t sub_22E6CDDF0()
{
  return MEMORY[0x270F6CD88]();
}

uint64_t sub_22E6CDE00()
{
  return MEMORY[0x270F6CD90]();
}

uint64_t sub_22E6CDE10()
{
  return MEMORY[0x270F6CD98]();
}

uint64_t sub_22E6CDE20()
{
  return MEMORY[0x270F6CDA0]();
}

uint64_t sub_22E6CDE30()
{
  return MEMORY[0x270F6CDA8]();
}

uint64_t sub_22E6CDE40()
{
  return MEMORY[0x270F6CDC0]();
}

uint64_t sub_22E6CDE50()
{
  return MEMORY[0x270F6CDC8]();
}

uint64_t sub_22E6CDE60()
{
  return MEMORY[0x270F6CDD0]();
}

uint64_t sub_22E6CDE70()
{
  return MEMORY[0x270F6CDD8]();
}

uint64_t sub_22E6CDE80()
{
  return MEMORY[0x270F6CDE0]();
}

uint64_t sub_22E6CDE90()
{
  return MEMORY[0x270F6CDE8]();
}

uint64_t sub_22E6CDEA0()
{
  return MEMORY[0x270F6CE00]();
}

uint64_t sub_22E6CDEB0()
{
  return MEMORY[0x270F6CE08]();
}

uint64_t sub_22E6CDEC0()
{
  return MEMORY[0x270F6CE10]();
}

uint64_t sub_22E6CDED0()
{
  return MEMORY[0x270F6CE18]();
}

uint64_t sub_22E6CDEE0()
{
  return MEMORY[0x270F6CE20]();
}

uint64_t sub_22E6CDEF0()
{
  return MEMORY[0x270F6CE28]();
}

uint64_t sub_22E6CDF00()
{
  return MEMORY[0x270F6CE70]();
}

uint64_t sub_22E6CDF10()
{
  return MEMORY[0x270F6CE78]();
}

uint64_t sub_22E6CDF20()
{
  return MEMORY[0x270F6CE80]();
}

uint64_t sub_22E6CDF30()
{
  return MEMORY[0x270F6CEB0]();
}

uint64_t sub_22E6CDF40()
{
  return MEMORY[0x270F6CEB8]();
}

uint64_t sub_22E6CDF50()
{
  return MEMORY[0x270F6CEC0]();
}

uint64_t sub_22E6CDF60()
{
  return MEMORY[0x270F6CEC8]();
}

uint64_t sub_22E6CDF70()
{
  return MEMORY[0x270F6CED0]();
}

uint64_t sub_22E6CDF80()
{
  return MEMORY[0x270F6CED8]();
}

uint64_t sub_22E6CDF90()
{
  return MEMORY[0x270F6CEE0]();
}

uint64_t sub_22E6CDFA0()
{
  return MEMORY[0x270F6CEF0]();
}

uint64_t sub_22E6CDFB0()
{
  return MEMORY[0x270F6CEF8]();
}

uint64_t sub_22E6CDFC0()
{
  return MEMORY[0x270F6CF00]();
}

uint64_t sub_22E6CDFD0()
{
  return MEMORY[0x270F6CF08]();
}

uint64_t sub_22E6CDFE0()
{
  return MEMORY[0x270F6CF88]();
}

uint64_t sub_22E6CDFF0()
{
  return MEMORY[0x270F6CF90]();
}

uint64_t sub_22E6CE000()
{
  return MEMORY[0x270F6D010]();
}

uint64_t sub_22E6CE010()
{
  return MEMORY[0x270F6D030]();
}

uint64_t sub_22E6CE020()
{
  return MEMORY[0x270F6D038]();
}

uint64_t sub_22E6CE030()
{
  return MEMORY[0x270F6D0E0]();
}

uint64_t sub_22E6CE040()
{
  return MEMORY[0x270F6D0F0]();
}

uint64_t sub_22E6CE050()
{
  return MEMORY[0x270F6D0F8]();
}

uint64_t sub_22E6CE060()
{
  return MEMORY[0x270F6D108]();
}

uint64_t sub_22E6CE070()
{
  return MEMORY[0x270F6D110]();
}

uint64_t sub_22E6CE080()
{
  return MEMORY[0x270F6D118]();
}

uint64_t sub_22E6CE090()
{
  return MEMORY[0x270F6D120]();
}

uint64_t sub_22E6CE0A0()
{
  return MEMORY[0x270F6D128]();
}

uint64_t sub_22E6CE0B0()
{
  return MEMORY[0x270F6D1C0]();
}

uint64_t sub_22E6CE0C0()
{
  return MEMORY[0x270F6D1C8]();
}

uint64_t sub_22E6CE0D0()
{
  return MEMORY[0x270F6D1D0]();
}

uint64_t sub_22E6CE0E0()
{
  return MEMORY[0x270F6D1D8]();
}

uint64_t sub_22E6CE0F0()
{
  return MEMORY[0x270F6D1E8]();
}

uint64_t sub_22E6CE100()
{
  return MEMORY[0x270F6D200]();
}

uint64_t sub_22E6CE110()
{
  return MEMORY[0x270F6D220]();
}

uint64_t sub_22E6CE120()
{
  return MEMORY[0x270F65440]();
}

uint64_t sub_22E6CE130()
{
  return MEMORY[0x270F6D270]();
}

uint64_t sub_22E6CE140()
{
  return MEMORY[0x270F6D328]();
}

uint64_t sub_22E6CE150()
{
  return MEMORY[0x270F6D338]();
}

uint64_t sub_22E6CE160()
{
  return MEMORY[0x270F6D3C8]();
}

uint64_t sub_22E6CE170()
{
  return MEMORY[0x270F6D3F8]();
}

uint64_t sub_22E6CE180()
{
  return MEMORY[0x270F6D4C0]();
}

uint64_t sub_22E6CE190()
{
  return MEMORY[0x270F6D4E8]();
}

uint64_t sub_22E6CE1A0()
{
  return MEMORY[0x270F6D508]();
}

uint64_t sub_22E6CE1B0()
{
  return MEMORY[0x270F6D510]();
}

uint64_t sub_22E6CE1C0()
{
  return MEMORY[0x270F6D5B8]();
}

uint64_t sub_22E6CE1D0()
{
  return MEMORY[0x270F6D5C0]();
}

uint64_t sub_22E6CE1E0()
{
  return MEMORY[0x270F6D630]();
}

uint64_t sub_22E6CE1F0()
{
  return MEMORY[0x270F6D660]();
}

uint64_t sub_22E6CE200()
{
  return MEMORY[0x270F6D748]();
}

uint64_t sub_22E6CE210()
{
  return MEMORY[0x270F6D910]();
}

uint64_t sub_22E6CE220()
{
  return MEMORY[0x270F6D928]();
}

uint64_t sub_22E6CE230()
{
  return MEMORY[0x270F6D940]();
}

uint64_t sub_22E6CE240()
{
  return MEMORY[0x270F6D948]();
}

uint64_t sub_22E6CE250()
{
  return MEMORY[0x270F6D968]();
}

uint64_t sub_22E6CE260()
{
  return MEMORY[0x270F6D970]();
}

uint64_t sub_22E6CE270()
{
  return MEMORY[0x270F6D9E0]();
}

uint64_t sub_22E6CE280()
{
  return MEMORY[0x270F6D9E8]();
}

uint64_t sub_22E6CE290()
{
  return MEMORY[0x270F6D9F0]();
}

uint64_t sub_22E6CE2A0()
{
  return MEMORY[0x270F6D9F8]();
}

uint64_t sub_22E6CE2B0()
{
  return MEMORY[0x270F6DA08]();
}

uint64_t sub_22E6CE2C0()
{
  return MEMORY[0x270F6DA18]();
}

uint64_t sub_22E6CE2D0()
{
  return MEMORY[0x270F6DA48]();
}

uint64_t sub_22E6CE2E0()
{
  return MEMORY[0x270F6DAB8]();
}

uint64_t sub_22E6CE2F0()
{
  return MEMORY[0x270F6DB20]();
}

uint64_t sub_22E6CE300()
{
  return MEMORY[0x270F6DB28]();
}

uint64_t sub_22E6CE310()
{
  return MEMORY[0x270F65448]();
}

uint64_t sub_22E6CE320()
{
  return MEMORY[0x270F6DC00]();
}

uint64_t sub_22E6CE330()
{
  return MEMORY[0x270F6DCF8]();
}

uint64_t sub_22E6CE340()
{
  return MEMORY[0x270F6DE08]();
}

uint64_t sub_22E6CE350()
{
  return MEMORY[0x270F6DE10]();
}

uint64_t sub_22E6CE360()
{
  return MEMORY[0x270F6DE28]();
}

uint64_t sub_22E6CE370()
{
  return MEMORY[0x270F6DE30]();
}

uint64_t sub_22E6CE390()
{
  return MEMORY[0x270F6DFB8]();
}

uint64_t sub_22E6CE3A0()
{
  return MEMORY[0x270F6DFC0]();
}

uint64_t sub_22E6CE3B0()
{
  return MEMORY[0x270F6E080]();
}

uint64_t sub_22E6CE3C0()
{
  return MEMORY[0x270F6E088]();
}

uint64_t sub_22E6CE3D0()
{
  return MEMORY[0x270F6E118]();
}

uint64_t sub_22E6CE3E0()
{
  return MEMORY[0x270F6E120]();
}

uint64_t sub_22E6CE3F0()
{
  return MEMORY[0x270F6E128]();
}

uint64_t sub_22E6CE400()
{
  return MEMORY[0x270F6E168]();
}

uint64_t sub_22E6CE410()
{
  return MEMORY[0x270F6E1A0]();
}

uint64_t sub_22E6CE420()
{
  return MEMORY[0x270F6E1D0]();
}

uint64_t sub_22E6CE430()
{
  return MEMORY[0x270F6E1E8]();
}

uint64_t sub_22E6CE440()
{
  return MEMORY[0x270F6E1F0]();
}

uint64_t sub_22E6CE450()
{
  return MEMORY[0x270F6E2E0]();
}

uint64_t sub_22E6CE460()
{
  return MEMORY[0x270F6E2E8]();
}

uint64_t sub_22E6CE470()
{
  return MEMORY[0x270F6E2F0]();
}

uint64_t sub_22E6CE480()
{
  return MEMORY[0x270F6E300]();
}

uint64_t sub_22E6CE490()
{
  return MEMORY[0x270F6E308]();
}

uint64_t sub_22E6CE4A0()
{
  return MEMORY[0x270F6E328]();
}

uint64_t sub_22E6CE4B0()
{
  return MEMORY[0x270F6E330]();
}

uint64_t sub_22E6CE4C0()
{
  return MEMORY[0x270F6E348]();
}

uint64_t sub_22E6CE4D0()
{
  return MEMORY[0x270F6E350]();
}

uint64_t sub_22E6CE4E0()
{
  return MEMORY[0x270F6E360]();
}

uint64_t sub_22E6CE4F0()
{
  return MEMORY[0x270F6E380]();
}

uint64_t sub_22E6CE500()
{
  return MEMORY[0x270F6E3B0]();
}

uint64_t sub_22E6CE510()
{
  return MEMORY[0x270F6E3E0]();
}

uint64_t sub_22E6CE520()
{
  return MEMORY[0x270F6E3E8]();
}

uint64_t sub_22E6CE530()
{
  return MEMORY[0x270F6E3F0]();
}

uint64_t sub_22E6CE540()
{
  return MEMORY[0x270F6E410]();
}

uint64_t sub_22E6CE550()
{
  return MEMORY[0x270F6E418]();
}

uint64_t sub_22E6CE560()
{
  return MEMORY[0x270F6E420]();
}

uint64_t sub_22E6CE570()
{
  return MEMORY[0x270F6E4A0]();
}

uint64_t sub_22E6CE580()
{
  return MEMORY[0x270F6E4A8]();
}

uint64_t sub_22E6CE590()
{
  return MEMORY[0x270F6E4B0]();
}

uint64_t sub_22E6CE5A0()
{
  return MEMORY[0x270F6E4F0]();
}

uint64_t sub_22E6CE5B0()
{
  return MEMORY[0x270F65468]();
}

uint64_t sub_22E6CE5C0()
{
  return MEMORY[0x270F6E518]();
}

uint64_t sub_22E6CE5D0()
{
  return MEMORY[0x270F6E520]();
}

uint64_t sub_22E6CE5E0()
{
  return MEMORY[0x270F6E5D0]();
}

uint64_t sub_22E6CE5F0()
{
  return MEMORY[0x270F6E5D8]();
}

uint64_t sub_22E6CE600()
{
  return MEMORY[0x270F6E768]();
}

uint64_t sub_22E6CE610()
{
  return MEMORY[0x270F6E7D0]();
}

uint64_t sub_22E6CE620()
{
  return MEMORY[0x270F6E7E0]();
}

uint64_t sub_22E6CE630()
{
  return MEMORY[0x270F6E7E8]();
}

uint64_t sub_22E6CE640()
{
  return MEMORY[0x270F6E910]();
}

uint64_t sub_22E6CE650()
{
  return MEMORY[0x270F6E918]();
}

uint64_t sub_22E6CE660()
{
  return MEMORY[0x270F6E960]();
}

uint64_t sub_22E6CE670()
{
  return MEMORY[0x270F6E968]();
}

uint64_t sub_22E6CE680()
{
  return MEMORY[0x270F6EB00]();
}

uint64_t sub_22E6CE690()
{
  return MEMORY[0x270F6EB08]();
}

uint64_t sub_22E6CE6A0()
{
  return MEMORY[0x270F6EB18]();
}

uint64_t sub_22E6CE6B0()
{
  return MEMORY[0x270F6EB20]();
}

uint64_t sub_22E6CE6C0()
{
  return MEMORY[0x270F6EB28]();
}

uint64_t sub_22E6CE6D0()
{
  return MEMORY[0x270F6EB40]();
}

uint64_t sub_22E6CE6E0()
{
  return MEMORY[0x270F6EB48]();
}

uint64_t sub_22E6CE6F0()
{
  return MEMORY[0x270F6EB88]();
}

uint64_t sub_22E6CE700()
{
  return MEMORY[0x270F6EB98]();
}

uint64_t sub_22E6CE710()
{
  return MEMORY[0x270F6EBB0]();
}

uint64_t sub_22E6CE720()
{
  return MEMORY[0x270F6EDB0]();
}

uint64_t sub_22E6CE730()
{
  return MEMORY[0x270F6EDB8]();
}

uint64_t sub_22E6CE740()
{
  return MEMORY[0x270F6EDD0]();
}

uint64_t sub_22E6CE750()
{
  return MEMORY[0x270F6EDD8]();
}

uint64_t sub_22E6CE760()
{
  return MEMORY[0x270F6EDF0]();
}

uint64_t sub_22E6CE770()
{
  return MEMORY[0x270F6EDF8]();
}

uint64_t sub_22E6CE780()
{
  return MEMORY[0x270F6EE18]();
}

uint64_t sub_22E6CE790()
{
  return MEMORY[0x270F6EE38]();
}

uint64_t sub_22E6CE7A0()
{
  return MEMORY[0x270F6EE40]();
}

uint64_t sub_22E6CE7B0()
{
  return MEMORY[0x270F6EE48]();
}

uint64_t sub_22E6CE7C0()
{
  return MEMORY[0x270F6EE50]();
}

uint64_t sub_22E6CE7D0()
{
  return MEMORY[0x270F6EE80]();
}

uint64_t sub_22E6CE7E0()
{
  return MEMORY[0x270F6EE88]();
}

uint64_t sub_22E6CE7F0()
{
  return MEMORY[0x270F6EEA0]();
}

uint64_t sub_22E6CE800()
{
  return MEMORY[0x270F6EEA8]();
}

uint64_t sub_22E6CE810()
{
  return MEMORY[0x270F6EEC0]();
}

uint64_t sub_22E6CE820()
{
  return MEMORY[0x270F6EEC8]();
}

uint64_t sub_22E6CE830()
{
  return MEMORY[0x270F6EEF8]();
}

uint64_t sub_22E6CE840()
{
  return MEMORY[0x270F6EF10]();
}

uint64_t sub_22E6CE850()
{
  return MEMORY[0x270F6EF18]();
}

uint64_t sub_22E6CE860()
{
  return MEMORY[0x270F6EF20]();
}

uint64_t sub_22E6CE870()
{
  return MEMORY[0x270F6EF48]();
}

uint64_t sub_22E6CE880()
{
  return MEMORY[0x270F6EF50]();
}

uint64_t sub_22E6CE890()
{
  return MEMORY[0x270F6EF58]();
}

uint64_t sub_22E6CE8A0()
{
  return MEMORY[0x270F6F008]();
}

uint64_t sub_22E6CE8B0()
{
  return MEMORY[0x270F6F010]();
}

uint64_t sub_22E6CE8C0()
{
  return MEMORY[0x270F6F080]();
}

uint64_t sub_22E6CE8D0()
{
  return MEMORY[0x270F6F088]();
}

uint64_t sub_22E6CE8E0()
{
  return MEMORY[0x270F6F090]();
}

uint64_t sub_22E6CE8F0()
{
  return MEMORY[0x270F6F098]();
}

uint64_t sub_22E6CE900()
{
  return MEMORY[0x270F6F0B0]();
}

uint64_t sub_22E6CE910()
{
  return MEMORY[0x270F6F0B8]();
}

uint64_t sub_22E6CE920()
{
  return MEMORY[0x270F6F0C0]();
}

uint64_t sub_22E6CE930()
{
  return MEMORY[0x270F6F0C8]();
}

uint64_t sub_22E6CE940()
{
  return MEMORY[0x270F6F0D0]();
}

uint64_t sub_22E6CE950()
{
  return MEMORY[0x270F6F0D8]();
}

uint64_t sub_22E6CE960()
{
  return MEMORY[0x270F6F0E0]();
}

uint64_t sub_22E6CE970()
{
  return MEMORY[0x270F6F0E8]();
}

uint64_t sub_22E6CE980()
{
  return MEMORY[0x270F6F110]();
}

uint64_t sub_22E6CE990()
{
  return MEMORY[0x270F6F118]();
}

uint64_t sub_22E6CE9A0()
{
  return MEMORY[0x270F6F120]();
}

uint64_t sub_22E6CE9B0()
{
  return MEMORY[0x270F6F128]();
}

uint64_t sub_22E6CE9C0()
{
  return MEMORY[0x270F6F130]();
}

uint64_t sub_22E6CE9D0()
{
  return MEMORY[0x270F6F1D0]();
}

uint64_t sub_22E6CE9E0()
{
  return MEMORY[0x270F6F1D8]();
}

uint64_t sub_22E6CE9F0()
{
  return MEMORY[0x270F6F1E0]();
}

uint64_t sub_22E6CEA00()
{
  return MEMORY[0x270F6F1E8]();
}

uint64_t sub_22E6CEA10()
{
  return MEMORY[0x270F6F1F0]();
}

uint64_t sub_22E6CEA20()
{
  return MEMORY[0x270F6F1F8]();
}

uint64_t sub_22E6CEA30()
{
  return MEMORY[0x270F6F200]();
}

uint64_t sub_22E6CEA40()
{
  return MEMORY[0x270F6F238]();
}

uint64_t sub_22E6CEA50()
{
  return MEMORY[0x270F6F280]();
}

uint64_t sub_22E6CEA60()
{
  return MEMORY[0x270F6F320]();
}

uint64_t sub_22E6CEA70()
{
  return MEMORY[0x270F6F328]();
}

uint64_t sub_22E6CEA80()
{
  return MEMORY[0x270F6F330]();
}

uint64_t sub_22E6CEA90()
{
  return MEMORY[0x270F6F338]();
}

uint64_t sub_22E6CEAA0()
{
  return MEMORY[0x270F6F350]();
}

uint64_t sub_22E6CEAB0()
{
  return MEMORY[0x270F6F368]();
}

uint64_t sub_22E6CEAC0()
{
  return MEMORY[0x270F6F388]();
}

uint64_t sub_22E6CEAD0()
{
  return MEMORY[0x270F6F390]();
}

uint64_t sub_22E6CEAE0()
{
  return MEMORY[0x270F6F398]();
}

uint64_t sub_22E6CEAF0()
{
  return MEMORY[0x270F6F3F0]();
}

uint64_t sub_22E6CEB00()
{
  return MEMORY[0x270F6F3F8]();
}

uint64_t sub_22E6CEB10()
{
  return MEMORY[0x270F6F400]();
}

uint64_t sub_22E6CEB20()
{
  return MEMORY[0x270F6F408]();
}

uint64_t sub_22E6CEB30()
{
  return MEMORY[0x270F6F410]();
}

uint64_t sub_22E6CEB40()
{
  return MEMORY[0x270F6F420]();
}

uint64_t sub_22E6CEB50()
{
  return MEMORY[0x270F6F428]();
}

uint64_t sub_22E6CEB60()
{
  return MEMORY[0x270F6F430]();
}

uint64_t sub_22E6CEB70()
{
  return MEMORY[0x270F6F438]();
}

uint64_t sub_22E6CEB80()
{
  return MEMORY[0x270F6F440]();
}

uint64_t sub_22E6CEB90()
{
  return MEMORY[0x270F6F458]();
}

uint64_t sub_22E6CEBA0()
{
  return MEMORY[0x270F6F460]();
}

uint64_t sub_22E6CEBB0()
{
  return MEMORY[0x270F6F468]();
}

uint64_t sub_22E6CEBC0()
{
  return MEMORY[0x270F6F470]();
}

uint64_t sub_22E6CEBD0()
{
  return MEMORY[0x270F6F480]();
}

uint64_t sub_22E6CEBE0()
{
  return MEMORY[0x270F6F488]();
}

uint64_t sub_22E6CEBF0()
{
  return MEMORY[0x270F6F490]();
}

uint64_t sub_22E6CEC00()
{
  return MEMORY[0x270F6F498]();
}

uint64_t sub_22E6CEC10()
{
  return MEMORY[0x270F6F4A0]();
}

uint64_t sub_22E6CEC20()
{
  return MEMORY[0x270F6F4A8]();
}

uint64_t sub_22E6CEC30()
{
  return MEMORY[0x270F70740]();
}

uint64_t sub_22E6CEC40()
{
  return MEMORY[0x270F6F4B0]();
}

uint64_t sub_22E6CEC50()
{
  return MEMORY[0x270F6F4C0]();
}

uint64_t sub_22E6CEC60()
{
  return MEMORY[0x270F6F4C8]();
}

uint64_t sub_22E6CEC70()
{
  return MEMORY[0x270F1A780]();
}

uint64_t sub_22E6CEC80()
{
  return MEMORY[0x270F1A788]();
}

uint64_t sub_22E6CEC90()
{
  return MEMORY[0x270F3A2C0]();
}

uint64_t sub_22E6CECA0()
{
  return MEMORY[0x270F3A618]();
}

uint64_t sub_22E6CECB0()
{
  return MEMORY[0x270F3A628]();
}

uint64_t sub_22E6CECC0()
{
  return MEMORY[0x270F3A630]();
}

uint64_t sub_22E6CECD0()
{
  return MEMORY[0x270F3A638]();
}

uint64_t sub_22E6CECE0()
{
  return MEMORY[0x270F3A660]();
}

uint64_t sub_22E6CECF0()
{
  return MEMORY[0x270F3B340]();
}

uint64_t sub_22E6CED00()
{
  return MEMORY[0x270F3B7F0]();
}

uint64_t sub_22E6CED10()
{
  return MEMORY[0x270F3BE10]();
}

uint64_t sub_22E6CED20()
{
  return MEMORY[0x270F3BE18]();
}

uint64_t sub_22E6CED30()
{
  return MEMORY[0x270F3BE20]();
}

uint64_t sub_22E6CED40()
{
  return MEMORY[0x270F3BE28]();
}

uint64_t sub_22E6CED50()
{
  return MEMORY[0x270F3BE38]();
}

uint64_t sub_22E6CED60()
{
  return MEMORY[0x270F3BE48]();
}

uint64_t sub_22E6CED70()
{
  return MEMORY[0x270F65858]();
}

uint64_t sub_22E6CED80()
{
  return MEMORY[0x270F65860]();
}

uint64_t sub_22E6CED90()
{
  return MEMORY[0x270F65868]();
}

uint64_t sub_22E6CEDA0()
{
  return MEMORY[0x270F65950]();
}

uint64_t sub_22E6CEDB0()
{
  return MEMORY[0x270F65958]();
}

uint64_t sub_22E6CEDC0()
{
  return MEMORY[0x270F65960]();
}

uint64_t sub_22E6CEDD0()
{
  return MEMORY[0x270F65978]();
}

uint64_t sub_22E6CEDE0()
{
  return MEMORY[0x270F659B8]();
}

uint64_t sub_22E6CEDF0()
{
  return MEMORY[0x270F659C8]();
}

uint64_t sub_22E6CEE00()
{
  return MEMORY[0x270F659D0]();
}

uint64_t sub_22E6CEE10()
{
  return MEMORY[0x270F659D8]();
}

uint64_t sub_22E6CEE20()
{
  return MEMORY[0x270F659E8]();
}

uint64_t sub_22E6CEE30()
{
  return MEMORY[0x270F659F0]();
}

uint64_t sub_22E6CEE40()
{
  return MEMORY[0x270F65C58]();
}

uint64_t sub_22E6CEE50()
{
  return MEMORY[0x270F65CB8]();
}

uint64_t sub_22E6CEE60()
{
  return MEMORY[0x270F65CC8]();
}

uint64_t sub_22E6CEE70()
{
  return MEMORY[0x270F65D40]();
}

uint64_t sub_22E6CEE80()
{
  return MEMORY[0x270F65D50]();
}

uint64_t sub_22E6CEE90()
{
  return MEMORY[0x270F65D68]();
}

uint64_t sub_22E6CEEA0()
{
  return MEMORY[0x270F65D70]();
}

uint64_t sub_22E6CEEB0()
{
  return MEMORY[0x270F65D78]();
}

uint64_t sub_22E6CEEC0()
{
  return MEMORY[0x270F65D80]();
}

uint64_t sub_22E6CEED0()
{
  return MEMORY[0x270F65D88]();
}

uint64_t sub_22E6CEEE0()
{
  return MEMORY[0x270F65D90]();
}

uint64_t sub_22E6CEEF0()
{
  return MEMORY[0x270F65DB0]();
}

uint64_t sub_22E6CEF00()
{
  return MEMORY[0x270F65DB8]();
}

uint64_t sub_22E6CEF10()
{
  return MEMORY[0x270F65DC8]();
}

uint64_t sub_22E6CEF20()
{
  return MEMORY[0x270F65DD8]();
}

uint64_t sub_22E6CEF30()
{
  return MEMORY[0x270F65DE0]();
}

uint64_t sub_22E6CEF40()
{
  return MEMORY[0x270F65DE8]();
}

uint64_t sub_22E6CEF50()
{
  return MEMORY[0x270F65DF0]();
}

uint64_t sub_22E6CEF60()
{
  return MEMORY[0x270F65E00]();
}

uint64_t sub_22E6CEF70()
{
  return MEMORY[0x270F65E08]();
}

uint64_t sub_22E6CEF80()
{
  return MEMORY[0x270F65E20]();
}

uint64_t sub_22E6CEF90()
{
  return MEMORY[0x270F65E30]();
}

uint64_t sub_22E6CEFA0()
{
  return MEMORY[0x270F65E38]();
}

uint64_t sub_22E6CEFB0()
{
  return MEMORY[0x270F70B20]();
}

uint64_t sub_22E6CEFC0()
{
  return MEMORY[0x270F70B38]();
}

uint64_t sub_22E6CEFD0()
{
  return MEMORY[0x270F70B40]();
}

uint64_t sub_22E6CEFE0()
{
  return MEMORY[0x270F70B50]();
}

uint64_t sub_22E6CEFF0()
{
  return MEMORY[0x270F70B58]();
}

uint64_t sub_22E6CF000()
{
  return MEMORY[0x270F70D08]();
}

uint64_t sub_22E6CF010()
{
  return MEMORY[0x270F70D10]();
}

uint64_t sub_22E6CF020()
{
  return MEMORY[0x270F70D48]();
}

uint64_t sub_22E6CF030()
{
  return MEMORY[0x270F70D50]();
}

uint64_t sub_22E6CF040()
{
  return MEMORY[0x270F70D58]();
}

uint64_t sub_22E6CF050()
{
  return MEMORY[0x270F70D70]();
}

uint64_t sub_22E6CF060()
{
  return MEMORY[0x270F70D78]();
}

uint64_t sub_22E6CF070()
{
  return MEMORY[0x270F70D80]();
}

uint64_t sub_22E6CF080()
{
  return MEMORY[0x270F70DB0]();
}

uint64_t sub_22E6CF090()
{
  return MEMORY[0x270F70DC0]();
}

uint64_t sub_22E6CF0A0()
{
  return MEMORY[0x270F70DC8]();
}

uint64_t sub_22E6CF0B0()
{
  return MEMORY[0x270F70DD0]();
}

uint64_t sub_22E6CF0C0()
{
  return MEMORY[0x270F70DF0]();
}

uint64_t sub_22E6CF0D0()
{
  return MEMORY[0x270F706A0]();
}

uint64_t sub_22E6CF0E0()
{
  return MEMORY[0x270F683D8]();
}

uint64_t sub_22E6CF0F0()
{
  return MEMORY[0x270F683E0]();
}

uint64_t sub_22E6CF100()
{
  return MEMORY[0x270F683F8]();
}

uint64_t sub_22E6CF110()
{
  return MEMORY[0x270F652C0]();
}

uint64_t sub_22E6CF120()
{
  return MEMORY[0x270F728F0]();
}

uint64_t sub_22E6CF130()
{
  return MEMORY[0x270F728F8]();
}

uint64_t sub_22E6CF140()
{
  return MEMORY[0x270F72900]();
}

uint64_t sub_22E6CF150()
{
  return MEMORY[0x270F72910]();
}

uint64_t sub_22E6CF160()
{
  return MEMORY[0x270F72918]();
}

uint64_t sub_22E6CF170()
{
  return MEMORY[0x270F72948]();
}

uint64_t sub_22E6CF180()
{
  return MEMORY[0x270F72950]();
}

uint64_t sub_22E6CF190()
{
  return MEMORY[0x270F72958]();
}

uint64_t sub_22E6CF1A0()
{
  return MEMORY[0x270F729D8]();
}

uint64_t sub_22E6CF1B0()
{
  return MEMORY[0x270F729E8]();
}

uint64_t sub_22E6CF1C0()
{
  return MEMORY[0x270F72A20]();
}

uint64_t sub_22E6CF1E0()
{
  return MEMORY[0x270F72A68]();
}

uint64_t sub_22E6CF1F0()
{
  return MEMORY[0x270F72A70]();
}

uint64_t sub_22E6CF200()
{
  return MEMORY[0x270F72A78]();
}

uint64_t sub_22E6CF210()
{
  return MEMORY[0x270F72A80]();
}

uint64_t sub_22E6CF220()
{
  return MEMORY[0x270F72C00]();
}

uint64_t sub_22E6CF230()
{
  return MEMORY[0x270F72C08]();
}

uint64_t sub_22E6CF240()
{
  return MEMORY[0x270F72C10]();
}

uint64_t sub_22E6CF250()
{
  return MEMORY[0x270F72C18]();
}

uint64_t sub_22E6CF260()
{
  return MEMORY[0x270F3A150]();
}

uint64_t sub_22E6CF270()
{
  return MEMORY[0x270F3A158]();
}

uint64_t sub_22E6CF280()
{
  return MEMORY[0x270F3A160]();
}

uint64_t sub_22E6CF290()
{
  return MEMORY[0x270F64A58]();
}

uint64_t sub_22E6CF2A0()
{
  return MEMORY[0x270F64A60]();
}

uint64_t sub_22E6CF2B0()
{
  return MEMORY[0x270F64A68]();
}

uint64_t sub_22E6CF2C0()
{
  return MEMORY[0x270F64A70]();
}

uint64_t sub_22E6CF2D0()
{
  return MEMORY[0x270F64A78]();
}

uint64_t sub_22E6CF2E0()
{
  return MEMORY[0x270F64A80]();
}

uint64_t sub_22E6CF2F0()
{
  return MEMORY[0x270F64A88]();
}

uint64_t sub_22E6CF300()
{
  return MEMORY[0x270F64A90]();
}

uint64_t sub_22E6CF310()
{
  return MEMORY[0x270F64AA8]();
}

uint64_t sub_22E6CF320()
{
  return MEMORY[0x270F64AB8]();
}

uint64_t sub_22E6CF330()
{
  return MEMORY[0x270F64AC0]();
}

uint64_t sub_22E6CF340()
{
  return MEMORY[0x270F64AC8]();
}

uint64_t sub_22E6CF350()
{
  return MEMORY[0x270F64AD0]();
}

uint64_t sub_22E6CF360()
{
  return MEMORY[0x270F64AD8]();
}

uint64_t sub_22E6CF370()
{
  return MEMORY[0x270F64AE0]();
}

uint64_t sub_22E6CF380()
{
  return MEMORY[0x270F64C68]();
}

uint64_t sub_22E6CF390()
{
  return MEMORY[0x270F64C70]();
}

uint64_t sub_22E6CF3A0()
{
  return MEMORY[0x270F64C78]();
}

uint64_t sub_22E6CF3B0()
{
  return MEMORY[0x270F64C80]();
}

uint64_t sub_22E6CF3C0()
{
  return MEMORY[0x270F64CF8]();
}

uint64_t sub_22E6CF3D0()
{
  return MEMORY[0x270F64D08]();
}

uint64_t sub_22E6CF3E0()
{
  return MEMORY[0x270F64D10]();
}

uint64_t sub_22E6CF3F0()
{
  return MEMORY[0x270F64D18]();
}

uint64_t sub_22E6CF400()
{
  return MEMORY[0x270F64D30]();
}

uint64_t sub_22E6CF410()
{
  return MEMORY[0x270F64D68]();
}

uint64_t sub_22E6CF420()
{
  return MEMORY[0x270F64DB8]();
}

uint64_t sub_22E6CF430()
{
  return MEMORY[0x270F64DC0]();
}

uint64_t sub_22E6CF440()
{
  return MEMORY[0x270F64DC8]();
}

uint64_t sub_22E6CF450()
{
  return MEMORY[0x270F64DD0]();
}

uint64_t sub_22E6CF460()
{
  return MEMORY[0x270F64DE8]();
}

uint64_t sub_22E6CF470()
{
  return MEMORY[0x270F64DF0]();
}

uint64_t sub_22E6CF480()
{
  return MEMORY[0x270F64EA8]();
}

uint64_t sub_22E6CF490()
{
  return MEMORY[0x270F64EB8]();
}

uint64_t sub_22E6CF4A0()
{
  return MEMORY[0x270F64EC0]();
}

uint64_t _s22HomeAutomationInternal0aB4CATsCfd_0()
{
  return MEMORY[0x270F64EC8]();
}

uint64_t sub_22E6CF4C0()
{
  return MEMORY[0x270F64F98]();
}

uint64_t sub_22E6CF4D0()
{
  return MEMORY[0x270F64FA0]();
}

uint64_t sub_22E6CF4E0()
{
  return MEMORY[0x270F64FA8]();
}

uint64_t sub_22E6CF4F0()
{
  return MEMORY[0x270F64FB0]();
}

uint64_t sub_22E6CF500()
{
  return MEMORY[0x270F64FC0]();
}

uint64_t sub_22E6CF510()
{
  return MEMORY[0x270F64FC8]();
}

uint64_t sub_22E6CF520()
{
  return MEMORY[0x270F64FD0]();
}

uint64_t sub_22E6CF530()
{
  return MEMORY[0x270F64FD8]();
}

uint64_t _s22HomeAutomationInternal0aB10CATsSimpleCfd_0()
{
  return MEMORY[0x270F64FE8]();
}

uint64_t sub_22E6CF550()
{
  return MEMORY[0x270F650D0]();
}

uint64_t sub_22E6CF560()
{
  return MEMORY[0x270F65128]();
}

uint64_t sub_22E6CF570()
{
  return MEMORY[0x270F65130]();
}

uint64_t sub_22E6CF580()
{
  return MEMORY[0x270F65158]();
}

uint64_t sub_22E6CF590()
{
  return MEMORY[0x270F65180]();
}

uint64_t sub_22E6CF5A0()
{
  return MEMORY[0x270F63AD8]();
}

uint64_t sub_22E6CF5B0()
{
  return MEMORY[0x270F63B10]();
}

uint64_t sub_22E6CF5C0()
{
  return MEMORY[0x270F0C7F8]();
}

uint64_t sub_22E6CF5D0()
{
  return MEMORY[0x270F0C808]();
}

uint64_t sub_22E6CF5E0()
{
  return MEMORY[0x270F0C818]();
}

uint64_t sub_22E6CF5F0()
{
  return MEMORY[0x270F0C820]();
}

uint64_t sub_22E6CF600()
{
  return MEMORY[0x270F0C830]();
}

uint64_t sub_22E6CF610()
{
  return MEMORY[0x270F0C840]();
}

uint64_t sub_22E6CF620()
{
  return MEMORY[0x270F0C858]();
}

uint64_t sub_22E6CF630()
{
  return MEMORY[0x270F0C868]();
}

uint64_t sub_22E6CF640()
{
  return MEMORY[0x270F0C870]();
}

uint64_t sub_22E6CF650()
{
  return MEMORY[0x270F0C888]();
}

uint64_t sub_22E6CF660()
{
  return MEMORY[0x270F0C898]();
}

uint64_t sub_22E6CF670()
{
  return MEMORY[0x270F0C8A8]();
}

uint64_t sub_22E6CF680()
{
  return MEMORY[0x270F0C8B0]();
}

uint64_t sub_22E6CF690()
{
  return MEMORY[0x270F0C8C0]();
}

uint64_t sub_22E6CF6A0()
{
  return MEMORY[0x270F0C8F0]();
}

uint64_t sub_22E6CF6B0()
{
  return MEMORY[0x270F0C8F8]();
}

uint64_t sub_22E6CF6F0()
{
  return MEMORY[0x270F0C920]();
}

uint64_t sub_22E6CF700()
{
  return MEMORY[0x270F0C928]();
}

uint64_t sub_22E6CF760()
{
  return MEMORY[0x270F0C980]();
}

uint64_t sub_22E6CF770()
{
  return MEMORY[0x270F0C988]();
}

uint64_t sub_22E6CF780()
{
  return MEMORY[0x270F0C990]();
}

uint64_t sub_22E6CF790()
{
  return MEMORY[0x270F0C998]();
}

uint64_t sub_22E6CF7A0()
{
  return MEMORY[0x270F0C9A0]();
}

uint64_t sub_22E6CF7B0()
{
  return MEMORY[0x270F0C9A8]();
}

uint64_t sub_22E6CF7C0()
{
  return MEMORY[0x270F0C9C0]();
}

uint64_t sub_22E6CF7D0()
{
  return MEMORY[0x270F0C9D0]();
}

uint64_t sub_22E6CF7E0()
{
  return MEMORY[0x270F0C9D8]();
}

uint64_t sub_22E6CF800()
{
  return MEMORY[0x270F0C9F8]();
}

uint64_t sub_22E6CF810()
{
  return MEMORY[0x270F0CA08]();
}

uint64_t sub_22E6CF820()
{
  return MEMORY[0x270F0CA10]();
}

uint64_t sub_22E6CF830()
{
  return MEMORY[0x270F0CA30]();
}

uint64_t sub_22E6CF840()
{
  return MEMORY[0x270F0CA40]();
}

uint64_t sub_22E6CF850()
{
  return MEMORY[0x270F0CA50]();
}

uint64_t sub_22E6CF860()
{
  return MEMORY[0x270F0CA58]();
}

uint64_t sub_22E6CF870()
{
  return MEMORY[0x270F0CA70]();
}

uint64_t sub_22E6CF880()
{
  return MEMORY[0x270F0CA78]();
}

uint64_t sub_22E6CF890()
{
  return MEMORY[0x270F0CA80]();
}

uint64_t sub_22E6CF8A0()
{
  return MEMORY[0x270F0CA88]();
}

uint64_t sub_22E6CF8B0()
{
  return MEMORY[0x270F0CA90]();
}

uint64_t sub_22E6CF8C0()
{
  return MEMORY[0x270F0CA98]();
}

uint64_t sub_22E6CF8D0()
{
  return MEMORY[0x270F0CAB0]();
}

uint64_t sub_22E6CF8E0()
{
  return MEMORY[0x270F0CAB8]();
}

uint64_t sub_22E6CF8F0()
{
  return MEMORY[0x270F0CAC8]();
}

uint64_t sub_22E6CF900()
{
  return MEMORY[0x270F0CAE8]();
}

uint64_t sub_22E6CF910()
{
  return MEMORY[0x270F0CB10]();
}

uint64_t sub_22E6CF920()
{
  return MEMORY[0x270F0CB68]();
}

uint64_t sub_22E6CF930()
{
  return MEMORY[0x270F0CB70]();
}

uint64_t sub_22E6CF960()
{
  return MEMORY[0x270F71678]();
}

uint64_t sub_22E6CF970()
{
  return MEMORY[0x270F71680]();
}

uint64_t sub_22E6CF9A0()
{
  return MEMORY[0x270F718D0]();
}

uint64_t sub_22E6CF9B0()
{
  return MEMORY[0x270F718D8]();
}

uint64_t sub_22E6CF9C0()
{
  return MEMORY[0x270F71CC8]();
}

uint64_t sub_22E6CF9D0()
{
  return MEMORY[0x270F71CE0]();
}

uint64_t sub_22E6CF9E0()
{
  return MEMORY[0x270F652D0]();
}

uint64_t sub_22E6CF9F0()
{
  return MEMORY[0x270F652D8]();
}

uint64_t sub_22E6CFA00()
{
  return MEMORY[0x270F65308]();
}

uint64_t sub_22E6CFA10()
{
  return MEMORY[0x270F65390]();
}

uint64_t sub_22E6CFA20()
{
  return MEMORY[0x270F65398]();
}

uint64_t sub_22E6CFA30()
{
  return MEMORY[0x270F653A0]();
}

uint64_t sub_22E6CFA40()
{
  return MEMORY[0x270F653A8]();
}

uint64_t sub_22E6CFA50()
{
  return MEMORY[0x270F653B0]();
}

uint64_t sub_22E6CFA60()
{
  return MEMORY[0x270F653B8]();
}

uint64_t sub_22E6CFA70()
{
  return MEMORY[0x270F653C0]();
}

uint64_t sub_22E6CFA80()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_22E6CFA90()
{
  return MEMORY[0x270F706A8]();
}

uint64_t sub_22E6CFAA0()
{
  return MEMORY[0x270F706C0]();
}

uint64_t sub_22E6CFAB0()
{
  return MEMORY[0x270F706C8]();
}

uint64_t sub_22E6CFAC0()
{
  return MEMORY[0x270F706E0]();
}

uint64_t sub_22E6CFAD0()
{
  return MEMORY[0x270F706F0]();
}

uint64_t sub_22E6CFAE0()
{
  return MEMORY[0x270F706F8]();
}

uint64_t sub_22E6CFAF0()
{
  return MEMORY[0x270F70730]();
}

uint64_t sub_22E6CFB00()
{
  return MEMORY[0x270F6FAE8]();
}

uint64_t sub_22E6CFB10()
{
  return MEMORY[0x270F6FAF0]();
}

uint64_t sub_22E6CFB20()
{
  return MEMORY[0x270F6FBD8]();
}

uint64_t sub_22E6CFB30()
{
  return MEMORY[0x270F6FC28]();
}

uint64_t sub_22E6CFB40()
{
  return MEMORY[0x270F70470]();
}

uint64_t sub_22E6CFB50()
{
  return MEMORY[0x270F70478]();
}

uint64_t sub_22E6CFB60()
{
  return MEMORY[0x270F70500]();
}

uint64_t sub_22E6CFB70()
{
  return MEMORY[0x270F70508]();
}

uint64_t sub_22E6CFB80()
{
  return MEMORY[0x270F70528]();
}

uint64_t sub_22E6CFB90()
{
  return MEMORY[0x270F70540]();
}

uint64_t sub_22E6CFBA0()
{
  return MEMORY[0x270F70570]();
}

uint64_t sub_22E6CFBB0()
{
  return MEMORY[0x270F70578]();
}

uint64_t sub_22E6CFBC0()
{
  return MEMORY[0x270F70580]();
}

uint64_t sub_22E6CFBD0()
{
  return MEMORY[0x270F70588]();
}

uint64_t sub_22E6CFBE0()
{
  return MEMORY[0x270F70590]();
}

uint64_t sub_22E6CFBF0()
{
  return MEMORY[0x270F70598]();
}

uint64_t sub_22E6CFC00()
{
  return MEMORY[0x270F705A0]();
}

uint64_t sub_22E6CFC10()
{
  return MEMORY[0x270F705A8]();
}

uint64_t sub_22E6CFC20()
{
  return MEMORY[0x270F705B0]();
}

uint64_t sub_22E6CFC30()
{
  return MEMORY[0x270F705B8]();
}

uint64_t sub_22E6CFC40()
{
  return MEMORY[0x270F705C0]();
}

uint64_t sub_22E6CFC50()
{
  return MEMORY[0x270F705C8]();
}

uint64_t sub_22E6CFC60()
{
  return MEMORY[0x270FA2C70]();
}

uint64_t sub_22E6CFC70()
{
  return MEMORY[0x270FA2C88]();
}

uint64_t sub_22E6CFC80()
{
  return MEMORY[0x270FA2CA0]();
}

uint64_t sub_22E6CFC90()
{
  return MEMORY[0x270FA2CC8]();
}

uint64_t sub_22E6CFCA0()
{
  return MEMORY[0x270FA2CF0]();
}

uint64_t sub_22E6CFCB0()
{
  return MEMORY[0x270FA2D08]();
}

uint64_t sub_22E6CFCC0()
{
  return MEMORY[0x270FA2DF8]();
}

uint64_t sub_22E6CFCD0()
{
  return MEMORY[0x270FA2E28]();
}

uint64_t sub_22E6CFCE0()
{
  return MEMORY[0x270FA2E38]();
}

uint64_t sub_22E6CFCF0()
{
  return MEMORY[0x270F70748]();
}

uint64_t sub_22E6CFD00()
{
  return MEMORY[0x270F70750]();
}

uint64_t sub_22E6CFD10()
{
  return MEMORY[0x270F70758]();
}

uint64_t sub_22E6CFD20()
{
  return MEMORY[0x270F70760]();
}

uint64_t sub_22E6CFD30()
{
  return MEMORY[0x270F70768]();
}

uint64_t sub_22E6CFD40()
{
  return MEMORY[0x270F707B8]();
}

uint64_t sub_22E6CFD50()
{
  return MEMORY[0x270F707E0]();
}

uint64_t sub_22E6CFD60()
{
  return MEMORY[0x270F70820]();
}

uint64_t sub_22E6CFD70()
{
  return MEMORY[0x270F709A0]();
}

uint64_t sub_22E6CFD80()
{
  return MEMORY[0x270F709A8]();
}

uint64_t sub_22E6CFD90()
{
  return MEMORY[0x270F709B0]();
}

uint64_t sub_22E6CFDA0()
{
  return MEMORY[0x270F709B8]();
}

uint64_t sub_22E6CFDB0()
{
  return MEMORY[0x270F709C0]();
}

uint64_t sub_22E6CFDC0()
{
  return MEMORY[0x270F70A18]();
}

uint64_t sub_22E6CFDD0()
{
  return MEMORY[0x270F70A20]();
}

uint64_t sub_22E6CFDE0()
{
  return MEMORY[0x270F70A30]();
}

uint64_t sub_22E6CFDF0()
{
  return MEMORY[0x270F70A58]();
}

uint64_t sub_22E6CFE00()
{
  return MEMORY[0x270F70A80]();
}

uint64_t sub_22E6CFE10()
{
  return MEMORY[0x270F70AA0]();
}

uint64_t sub_22E6CFE20()
{
  return MEMORY[0x270F70AA8]();
}

uint64_t sub_22E6CFE30()
{
  return MEMORY[0x270F70AB0]();
}

uint64_t sub_22E6CFE40()
{
  return MEMORY[0x270F70AC8]();
}

uint64_t sub_22E6CFE50()
{
  return MEMORY[0x270F70AD0]();
}

uint64_t sub_22E6CFE60()
{
  return MEMORY[0x270F04390]();
}

uint64_t sub_22E6CFE70()
{
  return MEMORY[0x270F04470]();
}

uint64_t sub_22E6CFE80()
{
  return MEMORY[0x270F044B8]();
}

uint64_t sub_22E6CFE90()
{
  return MEMORY[0x270FA0978]();
}

uint64_t sub_22E6CFEA0()
{
  return MEMORY[0x270FA0980]();
}

uint64_t sub_22E6CFEB0()
{
  return MEMORY[0x270FA09A0]();
}

uint64_t sub_22E6CFEC0()
{
  return MEMORY[0x270FA09C8]();
}

uint64_t sub_22E6CFED0()
{
  return MEMORY[0x270FA09E0]();
}

uint64_t sub_22E6CFEE0()
{
  return MEMORY[0x270FA09F0]();
}

uint64_t sub_22E6CFEF0()
{
  return MEMORY[0x270FA09F8]();
}

uint64_t sub_22E6CFF00()
{
  return MEMORY[0x270FA0A08]();
}

uint64_t sub_22E6CFF10()
{
  return MEMORY[0x270FA0A50]();
}

uint64_t sub_22E6CFF20()
{
  return MEMORY[0x270FA0AB8]();
}

uint64_t sub_22E6CFF30()
{
  return MEMORY[0x270FA0AC8]();
}

uint64_t sub_22E6CFF40()
{
  return MEMORY[0x270FA0AE0]();
}

uint64_t sub_22E6CFF50()
{
  return MEMORY[0x270FA0AF0]();
}

uint64_t sub_22E6CFF60()
{
  return MEMORY[0x270FA0AF8]();
}

uint64_t sub_22E6CFF70()
{
  return MEMORY[0x270FA0B40]();
}

uint64_t sub_22E6CFF80()
{
  return MEMORY[0x270FA0B58]();
}

uint64_t sub_22E6CFF90()
{
  return MEMORY[0x270FA0B68]();
}

uint64_t sub_22E6CFFA0()
{
  return MEMORY[0x270FA0B78]();
}

uint64_t sub_22E6CFFB0()
{
  return MEMORY[0x270FA0B90]();
}

uint64_t sub_22E6CFFC0()
{
  return MEMORY[0x270FA0BB8]();
}

uint64_t sub_22E6CFFD0()
{
  return MEMORY[0x270EEAA78]();
}

uint64_t sub_22E6CFFE0()
{
  return MEMORY[0x270EEAA80]();
}

uint64_t sub_22E6CFFF0()
{
  return MEMORY[0x270EEAA98]();
}

uint64_t sub_22E6D0000()
{
  return MEMORY[0x270EEB0D8]();
}

uint64_t sub_22E6D0010()
{
  return MEMORY[0x270EEB0F0]();
}

uint64_t sub_22E6D0020()
{
  return MEMORY[0x270F9CFC0]();
}

uint64_t sub_22E6D0030()
{
  return MEMORY[0x270EF1810]();
}

uint64_t sub_22E6D0040()
{
  return MEMORY[0x270EF1838]();
}

uint64_t sub_22E6D0050()
{
  return MEMORY[0x270EF1848]();
}

uint64_t sub_22E6D0060()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_22E6D0070()
{
  return MEMORY[0x270F70DF8]();
}

uint64_t sub_22E6D0080()
{
  return MEMORY[0x270F41EB8]();
}

uint64_t sub_22E6D0090()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_22E6D00A0()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_22E6D00B0()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_22E6D00C0()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_22E6D00D0()
{
  return MEMORY[0x270F9D4A0]();
}

uint64_t sub_22E6D00E0()
{
  return MEMORY[0x270F9D4A8]();
}

uint64_t sub_22E6D00F0()
{
  return MEMORY[0x270F9D4B0]();
}

uint64_t sub_22E6D0100()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_22E6D0110()
{
  return MEMORY[0x270EF19A8]();
}

uint64_t sub_22E6D0120()
{
  return MEMORY[0x270EF19D0]();
}

uint64_t sub_22E6D0130()
{
  return MEMORY[0x270EF19D8]();
}

uint64_t sub_22E6D0140()
{
  return MEMORY[0x270EF19F0]();
}

uint64_t sub_22E6D0150()
{
  return MEMORY[0x270EF1A00]();
}

uint64_t sub_22E6D0160()
{
  return MEMORY[0x270EF1A08]();
}

uint64_t sub_22E6D0170()
{
  return MEMORY[0x270EF1A48]();
}

uint64_t sub_22E6D0180()
{
  return MEMORY[0x270EF1AA0]();
}

uint64_t sub_22E6D0190()
{
  return MEMORY[0x270EF1AD8]();
}

uint64_t sub_22E6D01A0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_22E6D01B0()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_22E6D01C0()
{
  return MEMORY[0x270F9D600]();
}

uint64_t sub_22E6D01D0()
{
  return MEMORY[0x270F9D610]();
}

uint64_t sub_22E6D01E0()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_22E6D01F0()
{
  return MEMORY[0x270F3C080]();
}

uint64_t sub_22E6D0200()
{
  return MEMORY[0x270F70E00]();
}

uint64_t sub_22E6D0210()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_22E6D0220()
{
  return MEMORY[0x270F9D668]();
}

uint64_t sub_22E6D0230()
{
  return MEMORY[0x270F65190]();
}

uint64_t sub_22E6D0240()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_22E6D0250()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_22E6D0260()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_22E6D0270()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_22E6D0280()
{
  return MEMORY[0x270F9D750]();
}

uint64_t sub_22E6D0290()
{
  return MEMORY[0x270F9D760]();
}

uint64_t sub_22E6D02A0()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_22E6D02B0()
{
  return MEMORY[0x270F9D790]();
}

uint64_t sub_22E6D02C0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_22E6D02E0()
{
  return MEMORY[0x270F9D7D8]();
}

uint64_t sub_22E6D02F0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_22E6D0300()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_22E6D0310()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_22E6D0320()
{
  return MEMORY[0x270F9D808]();
}

uint64_t sub_22E6D0330()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_22E6D0340()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_22E6D0350()
{
  return MEMORY[0x270F9D880]();
}

uint64_t sub_22E6D0360()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_22E6D0370()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_22E6D0380()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_22E6D0390()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_22E6D03A0()
{
  return MEMORY[0x270F9D908]();
}

uint64_t sub_22E6D03B0()
{
  return MEMORY[0x270F9DA18]();
}

uint64_t sub_22E6D03C0()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_22E6D03D0()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_22E6D03E0()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_22E6D03F0()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_22E6D0400()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_22E6D0410()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_22E6D0420()
{
  return MEMORY[0x270EF1B90]();
}

uint64_t sub_22E6D0430()
{
  return MEMORY[0x270EF1BB0]();
}

uint64_t sub_22E6D0440()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_22E6D0450()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_22E6D0460()
{
  return MEMORY[0x270F70E08]();
}

uint64_t sub_22E6D0470()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t sub_22E6D0480()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_22E6D0490()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_22E6D04A0()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t sub_22E6D04B0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_22E6D04C0()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_22E6D04D0()
{
  return MEMORY[0x270F9DCA8]();
}

uint64_t sub_22E6D04E0()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_22E6D04F0()
{
  return MEMORY[0x270F9DCF0]();
}

uint64_t sub_22E6D0500()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_22E6D0510()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_22E6D0520()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_22E6D0530()
{
  return MEMORY[0x270EF1C30]();
}

uint64_t sub_22E6D0540()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_22E6D0550()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_22E6D0560()
{
  return MEMORY[0x270F9DE48]();
}

uint64_t sub_22E6D0570()
{
  return MEMORY[0x270EF1CA0]();
}

uint64_t sub_22E6D0580()
{
  return MEMORY[0x270EF1CC8]();
}

uint64_t sub_22E6D0590()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_22E6D05A0()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_22E6D05B0()
{
  return MEMORY[0x270F9DF28]();
}

uint64_t sub_22E6D05C0()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_22E6D05D0()
{
  return MEMORY[0x270EF1D18]();
}

uint64_t sub_22E6D05E0()
{
  return MEMORY[0x270F70E20]();
}

uint64_t sub_22E6D05F0()
{
  return MEMORY[0x270EF1D58]();
}

uint64_t sub_22E6D0600()
{
  return MEMORY[0x270F3C0F0]();
}

uint64_t sub_22E6D0610()
{
  return MEMORY[0x270F3C100]();
}

uint64_t sub_22E6D0620()
{
  return MEMORY[0x270F3C108]();
}

uint64_t sub_22E6D0630()
{
  return MEMORY[0x270F3C110]();
}

uint64_t sub_22E6D0640()
{
  return MEMORY[0x270F3C118]();
}

uint64_t sub_22E6D0650()
{
  return MEMORY[0x270EF1DE0]();
}

uint64_t sub_22E6D0660()
{
  return MEMORY[0x270F70E28]();
}

uint64_t sub_22E6D0670()
{
  return MEMORY[0x270FA2E48]();
}

uint64_t sub_22E6D0680()
{
  return MEMORY[0x270FA2E50]();
}

uint64_t sub_22E6D0690()
{
  return MEMORY[0x270FA2E68]();
}

uint64_t sub_22E6D06A0()
{
  return MEMORY[0x270FA2E88]();
}

uint64_t sub_22E6D06B0()
{
  return MEMORY[0x270EF1FA0]();
}

uint64_t sub_22E6D06C0()
{
  return MEMORY[0x270FA0C00]();
}

uint64_t sub_22E6D06D0()
{
  return MEMORY[0x270FA0C28]();
}

uint64_t sub_22E6D06E0()
{
  return MEMORY[0x270FA0C40]();
}

uint64_t sub_22E6D06F0()
{
  return MEMORY[0x270FA0C58]();
}

uint64_t sub_22E6D0700()
{
  return MEMORY[0x270FA0C80]();
}

uint64_t sub_22E6D0710()
{
  return MEMORY[0x270FA0C88]();
}

uint64_t sub_22E6D0720()
{
  return MEMORY[0x270FA0D48]();
}

uint64_t sub_22E6D0730()
{
  return MEMORY[0x270FA0D98]();
}

uint64_t sub_22E6D0740()
{
  return MEMORY[0x270FA0DA8]();
}

uint64_t sub_22E6D0750()
{
  return MEMORY[0x270FA0DC0]();
}

uint64_t sub_22E6D0760()
{
  return MEMORY[0x270FA0DD8]();
}

uint64_t sub_22E6D0770()
{
  return MEMORY[0x270F6F4E0]();
}

uint64_t sub_22E6D0780()
{
  return MEMORY[0x270FA2E98]();
}

uint64_t sub_22E6D0790()
{
  return MEMORY[0x270FA2EA0]();
}

uint64_t sub_22E6D07A0()
{
  return MEMORY[0x270FA2EB0]();
}

uint64_t sub_22E6D07B0()
{
  return MEMORY[0x270FA0F08]();
}

uint64_t sub_22E6D07C0()
{
  return MEMORY[0x270FA0F18]();
}

uint64_t sub_22E6D07D0()
{
  return MEMORY[0x270FA0F20]();
}

uint64_t sub_22E6D07E0()
{
  return MEMORY[0x270F66290]();
}

uint64_t sub_22E6D07F0()
{
  return MEMORY[0x270F662A0]();
}

uint64_t sub_22E6D0800()
{
  return MEMORY[0x270F662A8]();
}

uint64_t sub_22E6D0810()
{
  return MEMORY[0x270F662C0]();
}

uint64_t sub_22E6D0820()
{
  return MEMORY[0x270EF2188]();
}

uint64_t sub_22E6D0830()
{
  return MEMORY[0x270EF2190]();
}

uint64_t sub_22E6D0840()
{
  return MEMORY[0x270FA1178]();
}

uint64_t sub_22E6D0850()
{
  return MEMORY[0x270FA1188]();
}

uint64_t sub_22E6D0860()
{
  return MEMORY[0x270FA1198]();
}

uint64_t sub_22E6D0870()
{
  return MEMORY[0x270FA11A8]();
}

uint64_t sub_22E6D0880()
{
  return MEMORY[0x270EF2208]();
}

uint64_t sub_22E6D0890()
{
  return MEMORY[0x270F68448]();
}

uint64_t sub_22E6D08A0()
{
  return MEMORY[0x270F3C168]();
}

uint64_t sub_22E6D08B0()
{
  return MEMORY[0x270F3C178]();
}

uint64_t sub_22E6D08C0()
{
  return MEMORY[0x270FA2EF8]();
}

uint64_t sub_22E6D08D0()
{
  return MEMORY[0x270F9E3B0]();
}

uint64_t sub_22E6D08E0()
{
  return MEMORY[0x270F0CBD0]();
}

uint64_t sub_22E6D08F0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_22E6D0900()
{
  return MEMORY[0x270F9E3D8]();
}

uint64_t sub_22E6D0910()
{
  return MEMORY[0x270F9E510]();
}

uint64_t sub_22E6D0920()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_22E6D0930()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_22E6D0940()
{
  return MEMORY[0x270EF23D0]();
}

uint64_t sub_22E6D0950()
{
  return MEMORY[0x270EF23E0]();
}

uint64_t sub_22E6D0960()
{
  return MEMORY[0x270EF2480]();
}

uint64_t sub_22E6D0970()
{
  return MEMORY[0x270EF24A8]();
}

uint64_t sub_22E6D0980()
{
  return MEMORY[0x270EF25A8]();
}

uint64_t sub_22E6D0990()
{
  return MEMORY[0x270FA13A0]();
}

uint64_t sub_22E6D09A0()
{
  return MEMORY[0x270F9E658]();
}

uint64_t sub_22E6D09B0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_22E6D09D0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_22E6D09E0()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_22E6D09F0()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_22E6D0A00()
{
  return MEMORY[0x270F9E810]();
}

uint64_t sub_22E6D0A10()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_22E6D0A20()
{
  return MEMORY[0x270F9E820]();
}

uint64_t sub_22E6D0A30()
{
  return MEMORY[0x270F9E830]();
}

uint64_t sub_22E6D0A40()
{
  return MEMORY[0x270F9E838]();
}

uint64_t sub_22E6D0A50()
{
  return MEMORY[0x270F9E840]();
}

uint64_t sub_22E6D0A60()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_22E6D0A70()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_22E6D0A80()
{
  return MEMORY[0x270F9E860]();
}

uint64_t sub_22E6D0AA0()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_22E6D0AB0()
{
  return MEMORY[0x270F9E878]();
}

uint64_t sub_22E6D0AC0()
{
  return MEMORY[0x270F9E880]();
}

uint64_t sub_22E6D0AD0()
{
  return MEMORY[0x270F9E888]();
}

uint64_t sub_22E6D0AE0()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_22E6D0AF0()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_22E6D0B00()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_22E6D0B10()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_22E6D0B20()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_22E6D0B30()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_22E6D0B40()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_22E6D0B50()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_22E6D0B70()
{
  return MEMORY[0x270F9E9A0]();
}

uint64_t sub_22E6D0B80()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_22E6D0B90()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_22E6D0BA0()
{
  return MEMORY[0x270F9EA10]();
}

uint64_t sub_22E6D0BB0()
{
  return MEMORY[0x270F9EA18]();
}

uint64_t sub_22E6D0BC0()
{
  return MEMORY[0x270F9EA30]();
}

uint64_t sub_22E6D0BD0()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t sub_22E6D0BE0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_22E6D0BF0()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_22E6D0C00()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_22E6D0C10()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_22E6D0C20()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_22E6D0C30()
{
  return MEMORY[0x270F9EB30]();
}

uint64_t sub_22E6D0C40()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_22E6D0C50()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_22E6D0C60()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_22E6D0C70()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_22E6D0C80()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_22E6D0C90()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_22E6D0CA0()
{
  return MEMORY[0x270F9EEF8]();
}

uint64_t sub_22E6D0CB0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_22E6D0CC0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_22E6D0CD0()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_22E6D0CE0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_22E6D0CF0()
{
  return MEMORY[0x270F9F088]();
}

uint64_t sub_22E6D0D00()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_22E6D0D10()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_22E6D0D20()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_22E6D0D30()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_22E6D0D50()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_22E6D0D60()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_22E6D0D70()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_22E6D0D80()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_22E6D0D90()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_22E6D0DA0()
{
  return MEMORY[0x270F9F280]();
}

uint64_t sub_22E6D0DB0()
{
  return MEMORY[0x270F9F290]();
}

uint64_t sub_22E6D0DC0()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_22E6D0DD0()
{
  return MEMORY[0x270F9F2B8]();
}

uint64_t sub_22E6D0DE0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_22E6D0DF0()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_22E6D0E00()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_22E6D0E10()
{
  return MEMORY[0x270F9F300]();
}

uint64_t sub_22E6D0E20()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_22E6D0E30()
{
  return MEMORY[0x270F9F310]();
}

uint64_t sub_22E6D0E40()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_22E6D0E50()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_22E6D0E60()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_22E6D0E70()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_22E6D0E80()
{
  return MEMORY[0x270F9F3B8]();
}

uint64_t sub_22E6D0E90()
{
  return MEMORY[0x270F9F3C0]();
}

uint64_t sub_22E6D0EA0()
{
  return MEMORY[0x270F9F3D0]();
}

uint64_t sub_22E6D0EB0()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_22E6D0EC0()
{
  return MEMORY[0x270F9F3F0]();
}

uint64_t sub_22E6D0ED0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_22E6D0EE0()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_22E6D0EF0()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_22E6D0F00()
{
  return MEMORY[0x270F9F440]();
}

uint64_t sub_22E6D0F10()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_22E6D0F20()
{
  return MEMORY[0x270F9F450]();
}

uint64_t sub_22E6D0F30()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_22E6D0F40()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_22E6D0F50()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_22E6D0F60()
{
  return MEMORY[0x270F9F4D0]();
}

uint64_t sub_22E6D0F70()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_22E6D0F80()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_22E6D0F90()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_22E6D0FA0()
{
  return MEMORY[0x270F9F7D8]();
}

uint64_t sub_22E6D0FB0()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_22E6D0FC0()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_22E6D0FD0()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_22E6D0FE0()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_22E6D0FF0()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_22E6D1000()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_22E6D1010()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_22E6D1020()
{
  return MEMORY[0x270EF2660]();
}

uint64_t sub_22E6D1030()
{
  return MEMORY[0x270EF2678]();
}

uint64_t sub_22E6D1040()
{
  return MEMORY[0x270EF2688]();
}

uint64_t sub_22E6D1050()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_22E6D1060()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_22E6D1070()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_22E6D1080()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_22E6D1090()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_22E6D10A0()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_22E6D10B0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_22E6D10C0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_22E6D10D0()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_22E6D10E0()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_22E6D10F0()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_22E6D1100()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_22E6D1110()
{
  return MEMORY[0x270F9FCA8]();
}

uint64_t sub_22E6D1120()
{
  return MEMORY[0x270F9FCB0]();
}

uint64_t sub_22E6D1130()
{
  return MEMORY[0x270F9FCD0]();
}

uint64_t sub_22E6D1140()
{
  return MEMORY[0x270F9FCD8]();
}

uint64_t sub_22E6D1150()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_22E6D1160()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_22E6D1190()
{
  return MEMORY[0x270FA0128]();
}

uint64_t AFDeviceSupportsFullSiriUOD()
{
  return MEMORY[0x270F0ECB8]();
}

uint64_t AFDeviceSupportsHybridUOD()
{
  return MEMORY[0x270F0ECC0]();
}

uint64_t AFDeviceSupportsSiriMUX()
{
  return MEMORY[0x270F0ECE0]();
}

uint64_t AFIsInternalInstall()
{
  return MEMORY[0x270F0EDD0]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B80]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x270FA0170]();
}

void bzero(void *a1, size_t a2)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9338]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94C0](value);
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A640](object, key);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB38]();
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
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

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
}

uint64_t swift_asyncLet_begin()
{
  return MEMORY[0x270FA23D0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_deallocBox()
{
  return MEMORY[0x270FA0220]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x270FA0278]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x270FA0298]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
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

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
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

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x270FA0468]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}