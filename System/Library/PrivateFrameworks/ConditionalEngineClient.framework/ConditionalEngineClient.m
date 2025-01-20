uint64_t default argument 0 of EventStreamClient.init(shoudSanitize:startDate:)()
{
  return 0;
}

uint64_t default argument 0 of EventStreamClient.fetchJasonEvents(shouldConsolidate:)()
{
  return 0;
}

unint64_t default argument 0 of OpenAIClient.init(systemPrompt:apiKey:model:temperature:maxTokens:apiURL:session:inferenceRunStore:)()
{
  return 0xD00000000000005FLL;
}

uint64_t default argument 2 of OpenAIClient.init(systemPrompt:apiKey:model:temperature:maxTokens:apiURL:session:inferenceRunStore:)()
{
  return sub_24A6F3350();
}

unint64_t sub_24A6E45A8()
{
  unint64_t result = qword_2697B18C0;
  if (!qword_2697B18C0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2697B18C0);
  }
  return result;
}

uint64_t default argument 3 of OpenAIClient.init(systemPrompt:apiKey:model:temperature:maxTokens:apiURL:session:inferenceRunStore:)()
{
  return sub_24A6F3330();
}

uint64_t default argument 4 of OpenAIClient.init(systemPrompt:apiKey:model:temperature:maxTokens:apiURL:session:inferenceRunStore:)()
{
  return sub_24A6F3360();
}

unint64_t default argument 5 of OpenAIClient.init(systemPrompt:apiKey:model:temperature:maxTokens:apiURL:session:inferenceRunStore:)()
{
  return 0xD00000000000002ALL;
}

id default argument 6 of OpenAIClient.init(systemPrompt:apiKey:model:temperature:maxTokens:apiURL:session:inferenceRunStore:)()
{
  id v0 = objc_msgSend(self, sel_sharedSession);

  return v0;
}

uint64_t ConditionalEvent.date.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ConditionalEvent.date.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*ConditionalEvent.date.modify())()
{
  return nullsub_1;
}

void ConditionalEvent.type.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 16);
}

unsigned char *ConditionalEvent.type.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 16) = *result;
  return result;
}

uint64_t (*ConditionalEvent.type.modify())()
{
  return nullsub_1;
}

uint64_t ConditionalEvent.identifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ConditionalEvent.identifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return result;
}

uint64_t (*ConditionalEvent.identifier.modify())()
{
  return nullsub_1;
}

uint64_t ConditionalEvent.category.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ConditionalEvent.category.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = a2;
  return result;
}

uint64_t (*ConditionalEvent.category.modify())()
{
  return nullsub_1;
}

void ConditionalEvent.motion.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 56);
}

unsigned char *ConditionalEvent.motion.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 56) = *result;
  return result;
}

uint64_t (*ConditionalEvent.motion.modify())()
{
  return nullsub_1;
}

uint64_t sub_24A6E48AC@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  char v9 = *a1;
  id v10 = objc_allocWithZone(MEMORY[0x263F08790]);
  swift_bridgeObjectRetain();
  id v11 = objc_msgSend(v10, sel_init);
  objc_msgSend(v11, sel_setDateStyle_, 2);
  objc_msgSend(v11, sel_setTimeStyle_, 1);
  v12 = (void *)sub_24A6F30C0();
  id v13 = objc_msgSend(v11, sel_stringFromDate_, v12);

  uint64_t v14 = sub_24A6F31F0();
  uint64_t v16 = v15;

  uint64_t v17 = sub_24A6F3110();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(a2, v17);
  swift_bridgeObjectRetain();
  *(void *)a5 = v14;
  *(void *)(a5 + 8) = v16;
  *(unsigned char *)(a5 + 16) = v9;
  *(void *)(a5 + 24) = 0;
  *(void *)(a5 + 32) = 0;
  *(void *)(a5 + 40) = a3;
  *(void *)(a5 + 48) = a4;
  *(unsigned char *)(a5 + 56) = 2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t ConditionalEvent.timestamp.getter@<X0>(uint64_t a1@<X8>)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
  objc_msgSend(v2, sel_setDateStyle_, 2);
  objc_msgSend(v2, sel_setTimeStyle_, 1);
  v3 = (void *)sub_24A6F31E0();
  id v4 = objc_msgSend(v2, sel_dateFromString_, v3);

  if (v4)
  {
    sub_24A6F30F0();

    uint64_t v5 = sub_24A6F3110();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
    uint64_t v7 = v5;
    uint64_t v8 = a1;
    uint64_t v9 = 0;
  }
  else
  {

    uint64_t v10 = sub_24A6F3110();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56);
    uint64_t v7 = v10;
    uint64_t v8 = a1;
    uint64_t v9 = 1;
  }

  return v6(v8, v9, 1, v7);
}

Swift::String __swiftcall ConditionalEvent.json()()
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  sub_24A6F31B0();
  MEMORY[0x270FA5388]();
  sub_24A6F2FA0();
  MEMORY[0x270FA5388]();
  uint64_t v1 = *(void **)(v0 + 8);
  uint64_t v22 = *(void *)v0;
  char v2 = *(unsigned char *)(v0 + 16);
  long long v21 = *(_OWORD *)(v0 + 24);
  uint64_t v20 = *(void *)(v0 + 40);
  uint64_t v19 = *(void *)(v0 + 48);
  char v18 = *(unsigned char *)(v0 + 56);
  sub_24A6F2FE0();
  swift_allocObject();
  sub_24A6F2FD0();
  sub_24A6E52D8((uint64_t *)&unk_2697B1A40);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_24A6F3C10;
  sub_24A6F2F80();
  sub_24A6F2F90();
  sub_24A6E6FB8((unint64_t *)&qword_2697B1930, MEMORY[0x263F06130]);
  sub_24A6E52D8((uint64_t *)&unk_2697B1A50);
  sub_24A6E531C();
  sub_24A6F33C0();
  sub_24A6F2FB0();
  uint64_t v27 = v22;
  v28 = v1;
  char v29 = v2;
  long long v30 = v21;
  uint64_t v31 = v20;
  uint64_t v32 = v19;
  char v33 = v18;
  sub_24A6E53C0();
  uint64_t v3 = sub_24A6F2FC0();
  unint64_t v5 = v4;
  uint64_t v6 = v3;
  switch(v4 >> 62)
  {
    case 1uLL:
      if (v3 >> 32 < (int)v3) {
        __break(1u);
      }
      sub_24A6E6940(v3, v4);
      swift_retain();
      uint64_t v7 = sub_24A6E669C((int)v6, v6 >> 32, v5 & 0x3FFFFFFFFFFFFFFFLL, (void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_24A6E6908);
      uint64_t v9 = v10;
      sub_24A6E6998(v6, v5);
      if (v9) {
        goto LABEL_14;
      }
      goto LABEL_7;
    case 2uLL:
      uint64_t v11 = *(void *)(v3 + 16);
      uint64_t v12 = *(void *)(v3 + 24);
      sub_24A6E6940(v3, v4);
      swift_retain();
      swift_retain();
      uint64_t v7 = sub_24A6E669C(v11, v12, v5 & 0x3FFFFFFFFFFFFFFFLL, (void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_24A6E6908);
      uint64_t v9 = v13;
      swift_release();
      swift_release();
      if (v9) {
        goto LABEL_14;
      }
LABEL_7:
      uint64_t v25 = v6;
      unint64_t v26 = v5;
      sub_24A6E6940(v6, v5);
      sub_24A6E52D8(&qword_2697B1948);
      if (swift_dynamicCast())
      {
        sub_24A6E69F0(v23, (uint64_t)&v27);
        sub_24A6E6A08(&v27, v30);
        if (sub_24A6F3480())
        {
          sub_24A6E6A08(&v27, v30);
          sub_24A6F3470();
          sub_24A6E6998(v6, v5);
          uint64_t v9 = (void *)*((void *)&v23[0] + 1);
          uint64_t v7 = *(void *)&v23[0];
          sub_24A6E6A4C((uint64_t)&v27);
          goto LABEL_15;
        }
        sub_24A6E6A4C((uint64_t)&v27);
      }
      else
      {
        uint64_t v24 = 0;
        memset(v23, 0, sizeof(v23));
        sub_24A6E6A9C((uint64_t)v23, &qword_2697B1A80);
      }
      uint64_t v7 = sub_24A6E65E8(v6, v5);
      uint64_t v9 = v14;
LABEL_14:
      sub_24A6E6998(v6, v5);
LABEL_15:
      sub_24A6E6998(v6, v5);
LABEL_16:
      swift_release();
LABEL_17:
      uint64_t v15 = v7;
      uint64_t v16 = v9;
      result._object = v16;
      result._countAndFlagsBits = v15;
      return result;
    case 3uLL:
      *(void *)((char *)v23 + 6) = 0;
      *(void *)&v23[0] = 0;
      sub_24A6E6908(&v27);
      sub_24A6E6998(v6, v5);
      sub_24A6E6998(v6, v5);
      swift_release();
      uint64_t v7 = v27;
      uint64_t v9 = v28;
      goto LABEL_17;
    default:
      uint64_t v27 = v3;
      LOWORD(v28) = v4;
      BYTE2(v28) = BYTE2(v4);
      BYTE3(v28) = BYTE3(v4);
      BYTE4(v28) = BYTE4(v4);
      BYTE5(v28) = BYTE5(v4);
      uint64_t v7 = sub_24A6F3240();
      uint64_t v9 = v8;
      sub_24A6E6998(v6, v5);
      sub_24A6E6998(v6, v5);
      goto LABEL_16;
  }
}

uint64_t sub_24A6E52D8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_24A6E531C()
{
  unint64_t result = qword_2697B1938;
  if (!qword_2697B1938)
  {
    sub_24A6E5378((uint64_t *)&unk_2697B1A50);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697B1938);
  }
  return result;
}

uint64_t sub_24A6E5378(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_24A6E53C0()
{
  unint64_t result = qword_2697B1A70;
  if (!qword_2697B1A70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697B1A70);
  }
  return result;
}

uint64_t ConditionalEvent.dayString.getter()
{
  return sub_24A6E542C(4, 0);
}

uint64_t ConditionalEvent.timeString.getter()
{
  return sub_24A6E542C(0, 2);
}

uint64_t sub_24A6E542C(uint64_t a1, uint64_t a2)
{
  sub_24A6E52D8(&qword_2697B1950);
  MEMORY[0x270FA5388]();
  unint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_24A6F3110();
  uint64_t v6 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388]();
  char v18 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
  objc_msgSend(v8, sel_setDateStyle_, a1);
  objc_msgSend(v8, sel_setTimeStyle_, a2);
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
  objc_msgSend(v9, sel_setDateStyle_, 2);
  objc_msgSend(v9, sel_setTimeStyle_, 1);
  uint64_t v10 = (void *)sub_24A6F31E0();
  id v11 = objc_msgSend(v9, sel_dateFromString_, v10);

  if (!v11)
  {

    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v5, 1, 1, v19);
    goto LABEL_5;
  }
  sub_24A6F30F0();

  uint64_t v12 = v19;
  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v5, 0, 1, v19);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v5, 1, v12) == 1)
  {
LABEL_5:

    sub_24A6E6A9C((uint64_t)v5, &qword_2697B1950);
    return 0;
  }
  id v13 = v18;
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v18, v5, v12);
  uint64_t v14 = (void *)sub_24A6F30C0();
  id v15 = objc_msgSend(v8, sel_stringFromDate_, v14);

  uint64_t v16 = sub_24A6F31F0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v13, v12);
  return v16;
}

uint64_t ConditionalEvent.hash(into:)()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 48);
  int v3 = *(unsigned __int8 *)(v0 + 56);
  swift_bridgeObjectRetain();
  sub_24A6F3250();
  swift_bridgeObjectRelease();
  sub_24A6F3250();
  swift_bridgeObjectRelease();
  if (v1)
  {
    sub_24A6F35C0();
    swift_bridgeObjectRetain();
    sub_24A6F3250();
    swift_bridgeObjectRelease();
    if (v2) {
      goto LABEL_3;
    }
LABEL_6:
    sub_24A6F35C0();
    if (v3 == 2) {
      return sub_24A6F35C0();
    }
    goto LABEL_7;
  }
  sub_24A6F35C0();
  if (!v2) {
    goto LABEL_6;
  }
LABEL_3:
  sub_24A6F35C0();
  swift_bridgeObjectRetain();
  sub_24A6F3250();
  swift_bridgeObjectRelease();
  if (v3 == 2) {
    return sub_24A6F35C0();
  }
LABEL_7:
  sub_24A6F35C0();
  sub_24A6F3250();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24A6E58E8(char a1)
{
  return *(void *)&aDate_0[8 * a1];
}

BOOL sub_24A6E5908(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24A6E591C()
{
  return sub_24A6F35E0();
}

uint64_t sub_24A6E5964()
{
  return sub_24A6F35B0();
}

uint64_t sub_24A6E5990()
{
  return sub_24A6F35E0();
}

uint64_t sub_24A6E59D4()
{
  return sub_24A6E58E8(*v0);
}

uint64_t sub_24A6E59DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24A6E77D0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24A6E5A04()
{
  return 0;
}

void sub_24A6E5A10(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_24A6E5A1C(uint64_t a1)
{
  unint64_t v2 = sub_24A6E6D74();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24A6E5A58(uint64_t a1)
{
  unint64_t v2 = sub_24A6E6D74();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ConditionalEvent.encode(to:)(void *a1)
{
  uint64_t v3 = sub_24A6E52D8(&qword_2697B1958);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v17 = *(unsigned __int8 *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v15 = *(void *)(v1 + 32);
  uint64_t v16 = v7;
  uint64_t v8 = *(void *)(v1 + 40);
  uint64_t v13 = *(void *)(v1 + 48);
  uint64_t v14 = v8;
  int v12 = *(unsigned __int8 *)(v1 + 56);
  sub_24A6E6A08(a1, a1[3]);
  sub_24A6E6D74();
  sub_24A6F3600();
  char v25 = 0;
  uint64_t v9 = v18;
  sub_24A6F3500();
  if (!v9)
  {
    char v24 = v17;
    char v23 = 1;
    sub_24A6E6DC8();
    sub_24A6F3510();
    char v22 = 2;
    sub_24A6F34E0();
    char v21 = 3;
    sub_24A6F34E0();
    char v20 = v12;
    char v19 = 4;
    sub_24A6E6E1C();
    sub_24A6F34F0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t ConditionalEvent.hashValue.getter()
{
  return sub_24A6F35E0();
}

uint64_t ConditionalEvent.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_24A6E52D8(&qword_2697B1978);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A6E6A08(a1, a1[3]);
  sub_24A6E6D74();
  sub_24A6F35F0();
  if (v2)
  {
    sub_24A6E6A4C((uint64_t)a1);
  }
  else
  {
    char v33 = 0;
    uint64_t v10 = sub_24A6F34C0();
    uint64_t v12 = v11;
    char v31 = 1;
    sub_24A6E6E70();
    swift_bridgeObjectRetain();
    sub_24A6F34D0();
    uint64_t v26 = v10;
    int v25 = v32;
    char v30 = 2;
    uint64_t v13 = sub_24A6F34A0();
    uint64_t v15 = v14;
    uint64_t v23 = v13;
    char v24 = a2;
    char v29 = 3;
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_24A6F34A0();
    uint64_t v18 = v17;
    uint64_t v22 = v16;
    char v27 = 4;
    sub_24A6E6EC4();
    swift_bridgeObjectRetain();
    sub_24A6F34B0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    char v19 = v28;
    char v20 = v24;
    *char v24 = v26;
    v20[1] = v12;
    *((unsigned char *)v20 + 16) = v25;
    v20[3] = v23;
    v20[4] = v15;
    v20[5] = v22;
    v20[6] = v18;
    *((unsigned char *)v20 + 56) = v19;
    sub_24A6E6A4C((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24A6E60BC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return ConditionalEvent.init(from:)(a1, a2);
}

uint64_t sub_24A6E60D4(void *a1)
{
  return ConditionalEvent.encode(to:)(a1);
}

uint64_t sub_24A6E60EC()
{
  return sub_24A6F35E0();
}

uint64_t sub_24A6E615C()
{
  return sub_24A6F35E0();
}

ConditionalEngineClient::EventType_optional __swiftcall EventType.init(rawValue:)(Swift::String rawValue)
{
  return (ConditionalEngineClient::EventType_optional)sub_24A6E6444(v1);
}

uint64_t EventType.rawValue.getter()
{
  if (*v0) {
    return 0x6369746E616D6553;
  }
  else {
    return 4804432;
  }
}

uint64_t sub_24A6E620C(char *a1, char *a2)
{
  return sub_24A6EF71C(*a1, *a2);
}

uint64_t sub_24A6E6218()
{
  return sub_24A6EF8E4();
}

uint64_t sub_24A6E6220()
{
  return sub_24A6E6228();
}

uint64_t sub_24A6E6228()
{
  sub_24A6F3250();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24A6E628C()
{
  sub_24A6F3250();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24A6E62F8()
{
  sub_24A6F3250();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24A6E634C()
{
  return sub_24A6EFB38();
}

ConditionalEngineClient::EventType_optional sub_24A6E6354(Swift::String *a1)
{
  return EventType.init(rawValue:)(*a1);
}

uint64_t sub_24A6E6360@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EventType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24A6E6388()
{
  return sub_24A6F32B0();
}

uint64_t sub_24A6E63E8()
{
  return sub_24A6F32A0();
}

ConditionalEngineClient::Motion_optional __swiftcall Motion.init(rawValue:)(Swift::String rawValue)
{
  return (ConditionalEngineClient::Motion_optional)sub_24A6E6444(v1);
}

uint64_t sub_24A6E6444@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_24A6F3490();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t Motion.rawValue.getter()
{
  if (*v0) {
    return 0x676E697661654CLL;
  }
  else {
    return 0x676E697669727241;
  }
}

uint64_t sub_24A6E64E0(char *a1, char *a2)
{
  return sub_24A6EF7B8(*a1, *a2);
}

uint64_t sub_24A6E64EC()
{
  return sub_24A6EF960();
}

uint64_t sub_24A6E64F4()
{
  return sub_24A6E628C();
}

uint64_t sub_24A6E64FC()
{
  return sub_24A6EFAB8();
}

ConditionalEngineClient::Motion_optional sub_24A6E6504(Swift::String *a1)
{
  return Motion.init(rawValue:)(*a1);
}

uint64_t sub_24A6E6510@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = Motion.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24A6E6538()
{
  return sub_24A6F32B0();
}

uint64_t sub_24A6E6598()
{
  return sub_24A6F32A0();
}

uint64_t sub_24A6E65E8(uint64_t a1, unint64_t a2)
{
  sub_24A6E6940(a1, a2);
  sub_24A6E674C(a1, a2);
  sub_24A6E6998(a1, a2);
  uint64_t v4 = sub_24A6F3240();
  swift_release();
  return v4;
}

uint64_t sub_24A6E6660@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24A6F3240();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24A6E669C(uint64_t a1, uint64_t a2, uint64_t a3, void *(*a4)(uint64_t *__return_ptr, uint64_t, uint64_t))
{
  uint64_t result = sub_24A6F2FF0();
  uint64_t v9 = result;
  if (result)
  {
    uint64_t result = sub_24A6F3010();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v9 += a1 - result;
  }
  BOOL v10 = __OFSUB__(a2, a1);
  uint64_t v11 = a2 - a1;
  if (v10)
  {
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v12 = sub_24A6F3000();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  uint64_t v14 = v9 + v13;
  if (v9) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t result = (uint64_t)sub_24A6EB110(v9, v15, a4);
  if (v4) {
    return v16;
  }
  return result;
}

void *sub_24A6E674C(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_24A6F30A0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (void *)MEMORY[0x263F8EE78];
  switch(a2 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_12;
      }
      uint64_t v9 = HIDWORD(a1) - (int)a1;
LABEL_6:
      if (v9)
      {
        if (v9 >= 1)
        {
          sub_24A6E52D8(&qword_2697B19D8);
          uint64_t v8 = (void *)swift_allocObject();
          size_t v12 = j__malloc_size(v8);
          v8[2] = v9;
          v8[3] = 2 * v12 - 64;
        }
        sub_24A6E6940(a1, a2);
        uint64_t v13 = sub_24A6F3070();
        sub_24A6E6998(a1, a2);
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        if (v13 != v9)
        {
          __break(1u);
LABEL_12:
          __break(1u);
LABEL_13:
          __break(1u);
          JUMPOUT(0x24A6E68F8);
        }
      }
      return v8;
    case 2uLL:
      uint64_t v11 = *(void *)(a1 + 16);
      uint64_t v10 = *(void *)(a1 + 24);
      uint64_t v9 = v10 - v11;
      if (!__OFSUB__(v10, v11)) {
        goto LABEL_6;
      }
      goto LABEL_13;
    case 3uLL:
      return v8;
    default:
      uint64_t v9 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_24A6E6908@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24A6F3240();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24A6E6940(uint64_t a1, unint64_t a2)
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

uint64_t sub_24A6E6998(uint64_t a1, unint64_t a2)
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

uint64_t sub_24A6E69F0(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void *sub_24A6E6A08(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_24A6E6A4C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_24A6E6A9C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_24A6E52D8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t _s23ConditionalEngineClient0A5EventV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v27 = *(void *)(a1 + 40);
  int v6 = *(unsigned __int8 *)(a2 + 16);
  uint64_t v8 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v10 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  int v25 = *(unsigned __int8 *)(a2 + 56);
  int v26 = *(unsigned __int8 *)(a1 + 56);
  if (*(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8)
    || (v11 = sub_24A6F3520(), uint64_t result = 0, (v11 & 1) != 0))
  {
    if (v2) {
      uint64_t v13 = 0x6369746E616D6553;
    }
    else {
      uint64_t v13 = 4804432;
    }
    if (v2) {
      unint64_t v14 = 0xE800000000000000;
    }
    else {
      unint64_t v14 = 0xE300000000000000;
    }
    if (v6) {
      uint64_t v15 = 0x6369746E616D6553;
    }
    else {
      uint64_t v15 = 4804432;
    }
    if (v6) {
      unint64_t v16 = 0xE800000000000000;
    }
    else {
      unint64_t v16 = 0xE300000000000000;
    }
    if (v13 == v15 && v14 == v16)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      char v17 = sub_24A6F3520();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t result = 0;
      if ((v17 & 1) == 0) {
        return result;
      }
    }
    if (v3)
    {
      if (!v7) {
        return 0;
      }
      if (v4 != v8 || v3 != v7)
      {
        char v18 = sub_24A6F3520();
        uint64_t result = 0;
        if ((v18 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v7)
    {
      return 0;
    }
    if (v5)
    {
      if (!v9) {
        return 0;
      }
      if (v27 != v10 || v5 != v9)
      {
        char v19 = sub_24A6F3520();
        uint64_t result = 0;
        if ((v19 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v9)
    {
      return 0;
    }
    if (v26 == 2)
    {
      if (v25 == 2) {
        return 1;
      }
    }
    else if (v25 != 2)
    {
      if (v26) {
        uint64_t v20 = 0x676E697661654CLL;
      }
      else {
        uint64_t v20 = 0x676E697669727241;
      }
      if (v26) {
        unint64_t v21 = 0xE700000000000000;
      }
      else {
        unint64_t v21 = 0xE800000000000000;
      }
      if (v25) {
        uint64_t v22 = 0x676E697661654CLL;
      }
      else {
        uint64_t v22 = 0x676E697669727241;
      }
      if (v25) {
        unint64_t v23 = 0xE700000000000000;
      }
      else {
        unint64_t v23 = 0xE800000000000000;
      }
      if (v20 == v22 && v21 == v23)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return 1;
      }
      char v24 = sub_24A6F3520();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v24) {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

unint64_t sub_24A6E6D74()
{
  unint64_t result = qword_2697B1960;
  if (!qword_2697B1960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697B1960);
  }
  return result;
}

unint64_t sub_24A6E6DC8()
{
  unint64_t result = qword_2697B1968;
  if (!qword_2697B1968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697B1968);
  }
  return result;
}

unint64_t sub_24A6E6E1C()
{
  unint64_t result = qword_2697B1970;
  if (!qword_2697B1970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697B1970);
  }
  return result;
}

unint64_t sub_24A6E6E70()
{
  unint64_t result = qword_2697B1980;
  if (!qword_2697B1980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697B1980);
  }
  return result;
}

unint64_t sub_24A6E6EC4()
{
  unint64_t result = qword_2697B1988;
  if (!qword_2697B1988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697B1988);
  }
  return result;
}

unint64_t sub_24A6E6F1C()
{
  unint64_t result = qword_2697B1990;
  if (!qword_2697B1990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697B1990);
  }
  return result;
}

uint64_t sub_24A6E6F70()
{
  return sub_24A6E6FB8(&qword_2697B1998, MEMORY[0x263F07508]);
}

uint64_t sub_24A6E6FB8(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_24A6E7004()
{
  unint64_t result = qword_2697B19A0;
  if (!qword_2697B19A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697B19A0);
  }
  return result;
}

unint64_t sub_24A6E705C()
{
  unint64_t result = qword_2697B19A8;
  if (!qword_2697B19A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697B19A8);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for ConditionalEvent(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ConditionalEvent()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ConditionalEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ConditionalEvent(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

__n128 initializeWithTake for ConditionalEvent(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ConditionalEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for ConditionalEvent(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 57)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ConditionalEvent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 56) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 57) = 1;
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
    *(unsigned char *)(result + 57) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ConditionalEvent()
{
  return &type metadata for ConditionalEvent;
}

unsigned char *initializeBufferWithCopyOfBuffer for EventType(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for EventType()
{
  return &type metadata for EventType;
}

uint64_t _s23ConditionalEngineClient9EventTypeOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s23ConditionalEngineClient9EventTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24A6E74E0);
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

uint64_t sub_24A6E7508(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24A6E7510(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Motion()
{
  return &type metadata for Motion;
}

uint64_t getEnumTagSinglePayload for ConditionalEvent.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ConditionalEvent.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 4;
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
        JUMPOUT(0x24A6E7688);
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
          *__n128 result = a2 + 4;
        break;
    }
  }
  return result;
}

unsigned char *sub_24A6E76B0(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ConditionalEvent.CodingKeys()
{
  return &type metadata for ConditionalEvent.CodingKeys;
}

unint64_t sub_24A6E76CC()
{
  unint64_t result = qword_2697B19B0;
  if (!qword_2697B19B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697B19B0);
  }
  return result;
}

unint64_t sub_24A6E7724()
{
  unint64_t result = qword_2697B19B8;
  if (!qword_2697B19B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697B19B8);
  }
  return result;
}

unint64_t sub_24A6E777C()
{
  unint64_t result = qword_2697B19C0;
  if (!qword_2697B19C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697B19C0);
  }
  return result;
}

uint64_t sub_24A6E77D0(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 1702125924 && a2 == 0xE400000000000000;
  if (v3 || (sub_24A6F3520() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701869940 && a2 == 0xE400000000000000 || (sub_24A6F3520() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x696669746E656469 && a2 == 0xEA00000000007265 || (sub_24A6F3520() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x79726F6765746163 && a2 == 0xE800000000000000 || (sub_24A6F3520() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6E6F69746F6DLL && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_24A6F3520();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

unint64_t sub_24A6E79B0()
{
  unint64_t result = qword_2697B19C8;
  if (!qword_2697B19C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697B19C8);
  }
  return result;
}

unint64_t sub_24A6E7A04()
{
  unint64_t result = qword_2697B19D0;
  if (!qword_2697B19D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697B19D0);
  }
  return result;
}

uint64_t EventStreamClient.init(shoudSanitize:startDate:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  char v6 = &a3[*(int *)(type metadata accessor for EventStreamClient() + 20)];
  sub_24A6F30E0();
  *a3 = a1;
  uint64_t v7 = sub_24A6F3110();
  int v8 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 40);

  return v8(v6, a2, v7);
}

uint64_t type metadata accessor for EventStreamClient()
{
  uint64_t result = qword_2697B1A18;
  if (!qword_2697B1A18) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t static EventStreamClient.minStartDate.getter()
{
  return sub_24A6F30E0();
}

uint64_t static EventStreamClient.aWeekAgo.getter()
{
  return sub_24A6F30E0();
}

uint64_t EventStreamClient.readStreams()()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for EventStreamClient();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend((id)BiomeLibrary(), sel_Location);
  swift_unknownObjectRelease();
  id v7 = objc_msgSend(v6, sel_PointOfInterest);
  swift_unknownObjectRelease();
  id v8 = objc_msgSend(v7, sel_Category);
  id v31 = v8;
  swift_unknownObjectRelease();
  uint64_t v9 = (void *)sub_24A6F31E0();
  id v10 = objc_msgSend(v8, sel_publisherWithUseCase_, v9);
  id v28 = v10;

  id v11 = objc_msgSend((id)BiomeLibrary(), sel_Location);
  swift_unknownObjectRelease();
  id v12 = objc_msgSend(v11, sel_Semantic);
  id v30 = v12;
  swift_unknownObjectRelease();
  uint64_t v13 = (void *)sub_24A6F31E0();
  id v14 = objc_msgSend(v12, sel_publisherWithUseCase_, v13);

  sub_24A6E52D8(&qword_2697B19E0);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_24A6F4110;
  *(void *)(v15 + 32) = v14;
  uint64_t aBlock = v15;
  sub_24A6F32D0();
  id v29 = v14;
  sub_24A6E52D8(&qword_2697B19E8);
  unint64_t v16 = (void *)sub_24A6F32C0();
  swift_bridgeObjectRelease();
  v36 = sub_24A6E8030;
  uint64_t v37 = 0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v33 = 1107296256;
  uint64_t v34 = sub_24A6E8108;
  v35 = &unk_26FE37C90;
  char v17 = _Block_copy(&aBlock);
  id v18 = objc_msgSend(v10, sel_orderedMergeWithOthers_comparator_, v16, v17);
  _Block_release(v17);

  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = MEMORY[0x263F8EE78];
  v36 = sub_24A6E81FC;
  uint64_t v37 = 0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v33 = 1107296256;
  uint64_t v34 = sub_24A6E8310;
  v35 = &unk_26FE37CE0;
  uint64_t v20 = _Block_copy(&aBlock);
  sub_24A6E8818(v1, (uint64_t)v5);
  unint64_t v21 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v22 = (v4 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v23 = swift_allocObject();
  sub_24A6E8978((uint64_t)v5, v23 + v21);
  *(void *)(v23 + v22) = v19;
  v36 = sub_24A6E89DC;
  uint64_t v37 = v23;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v33 = 1107296256;
  uint64_t v34 = sub_24A6E90C8;
  v35 = &unk_26FE37D30;
  char v24 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  id v25 = objc_msgSend(v18, sel_sinkWithCompletion_receiveInput_, v20, v24);

  _Block_release(v24);
  _Block_release(v20);

  swift_beginAccess();
  uint64_t v26 = *(void *)(v19 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  return v26;
}

uint64_t sub_24A6E8030(uint64_t a1, uint64_t a2)
{
  sub_24A6EB164(a1, (uint64_t)v9);
  sub_24A6E52D8((uint64_t *)&unk_2697B1AA0);
  swift_dynamicCast();
  sub_24A6EB164(a2, (uint64_t)v9);
  swift_dynamicCast();
  objc_msgSend(v8, sel_timestamp);
  double v4 = v3;
  objc_msgSend(v8, sel_timestamp);
  double v6 = v5;

  if (v4 >= v6) {
    return 1;
  }
  else {
    return -1;
  }
}

uint64_t sub_24A6E8108(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v5 = *(uint64_t (**)(void *, void *))(a1 + 32);
  v9[3] = swift_getObjectType();
  v9[0] = a2;
  v8[3] = swift_getObjectType();
  v8[0] = a3;
  swift_retain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  uint64_t v6 = v5(v9, v8);
  swift_release();
  sub_24A6E6A4C((uint64_t)v8);
  sub_24A6E6A4C((uint64_t)v9);
  return v6;
}

uint64_t sub_24A6E81AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_24A6E81BC()
{
  return swift_release();
}

uint64_t sub_24A6E81C4()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_24A6E81FC(void *a1)
{
  id result = objc_msgSend(a1, sel_error);
  if (result)
  {
    uint64_t v2 = result;
    sub_24A6E52D8(&qword_2697B1A90);
    uint64_t v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_24A6F4120;
    sub_24A6F33E0();
    sub_24A6F3260();
    sub_24A6E52D8(&qword_2697B1A98);
    sub_24A6F3410();
    *(void *)(v3 + 56) = MEMORY[0x263F8D310];
    *(void *)(v3 + 32) = 0;
    *(void *)(v3 + 40) = 0xE000000000000000;
    sub_24A6F3590();

    return (id)swift_bridgeObjectRelease();
  }
  return result;
}

void sub_24A6E8310(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_24A6E8378(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_24A6F3110();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectRetain();
  self;
  uint64_t v9 = (void *)swift_dynamicCastObjCClass();
  if (v9) {
    objc_msgSend(v9, sel_timestamp);
  }
  swift_unknownObjectRelease();
  swift_unknownObjectRetain();
  self;
  id v10 = (void *)swift_dynamicCastObjCClass();
  if (v10) {
    objc_msgSend(v10, sel_timestamp);
  }
  swift_unknownObjectRelease();
  sub_24A6F30B0();
  type metadata accessor for EventStreamClient();
  if ((sub_24A6F30D0() & 1) == 0) {
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  id v11 = (void **)(a3 + 16);
  self;
  id v12 = &selRef_stringFromDate_;
  if (swift_dynamicCastObjCClass()
    && (objc_msgSend(a1, sel_respondsToSelector_, sel_eventBody) & 1) != 0
    && objc_msgSend(a1, sel_eventBody))
  {
    self;
    uint64_t v13 = (void *)swift_dynamicCastObjCClass();
    if (v13 && (EventStreamClient.locationPOIEvent(body:date:)(v13, (uint64_t)v8, (uint64_t)&v42), v43))
    {
      *(void *)&long long v40 = v43;
      long long v38 = v46;
      long long v39 = v45;
      int v37 = v47;
      uint64_t v35 = v42;
      uint64_t v36 = v44;
      swift_beginAccess();
      id v14 = v11;
      uint64_t v15 = *v11;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v41 = v14;
      *id v14 = v15;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t v15 = sub_24A6EF05C(0, v15[2] + 1, 1, v15);
        void *v41 = v15;
      }
      unint64_t v18 = v15[2];
      unint64_t v17 = v15[3];
      unint64_t v19 = v18 + 1;
      if (v18 >= v17 >> 1)
      {
        unint64_t v34 = v18 + 1;
        uint64_t v33 = sub_24A6EF05C((void *)(v17 > 1), v18 + 1, 1, v15);
        unint64_t v19 = v34;
        uint64_t v15 = v33;
        void *v41 = v33;
      }
      v15[2] = v19;
      uint64_t v20 = &v15[8 * v18];
      uint64_t v21 = v40;
      v20[4] = v35;
      v20[5] = v21;
      *((unsigned char *)v20 + 48) = v36 & 1;
      *(_OWORD *)(v20 + 7) = v39;
      *(_OWORD *)(v20 + 9) = v38;
      *((unsigned char *)v20 + 88) = v37;
      swift_endAccess();
      swift_unknownObjectRelease();
      id v11 = (void **)v41;
      id v12 = &selRef_stringFromDate_;
    }
    else
    {
      swift_unknownObjectRelease();
    }
  }
  self;
  if (!swift_dynamicCastObjCClass()
    || (objc_msgSend(a1, v12[17], sel_eventBody) & 1) == 0
    || !objc_msgSend(a1, sel_eventBody))
  {
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  self;
  unint64_t v22 = (void *)swift_dynamicCastObjCClass();
  if (!v22)
  {
LABEL_27:
    swift_unknownObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  double v23 = EventStreamClient.semanticLocationEvent(body:date:)(v22, (uint64_t)v8, (uint64_t)&v42);
  uint64_t v24 = v43;
  if (v43)
  {
    long long v39 = v46;
    long long v40 = v45;
    LODWORD(v38) = v47;
    uint64_t v25 = v42;
    char v26 = v44;
    swift_beginAccess();
    uint64_t v27 = *v11;
    char v28 = swift_isUniquelyReferenced_nonNull_native();
    *id v11 = v27;
    v41 = v11;
    if ((v28 & 1) == 0)
    {
      uint64_t v27 = sub_24A6EF05C(0, v27[2] + 1, 1, v27);
      *id v11 = v27;
    }
    unint64_t v30 = v27[2];
    unint64_t v29 = v27[3];
    if (v30 >= v29 >> 1)
    {
      uint64_t v27 = sub_24A6EF05C((void *)(v29 > 1), v30 + 1, 1, v27);
      void *v41 = v27;
    }
    v27[2] = v30 + 1;
    id v31 = &v27[8 * v30];
    v31[4] = v25;
    v31[5] = v24;
    *((unsigned char *)v31 + 48) = v26 & 1;
    *(_OWORD *)(v31 + 7) = v40;
    *(_OWORD *)(v31 + 9) = v39;
    *((unsigned char *)v31 + 88) = v38;
    swift_endAccess();
    goto LABEL_27;
  }
  (*(void (**)(char *, uint64_t, double))(v6 + 8))(v8, v5, v23);
  return swift_unknownObjectRelease();
}

uint64_t sub_24A6E8818(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for EventStreamClient();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24A6E887C()
{
  uint64_t v1 = type metadata accessor for EventStreamClient();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = v0 + *(int *)(v1 + 20) + v4;
  uint64_t v8 = sub_24A6F3110();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_release();

  return MEMORY[0x270FA0238](v0, v6 + 8, v5);
}

uint64_t sub_24A6E8978(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for EventStreamClient();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24A6E89DC(void *a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for EventStreamClient() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_24A6E8378(a1, v1 + v4, v5);
}

id EventStreamClient.locationPOIEvent(body:date:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = sub_24A6F3110();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  id v10 = (char *)v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v11 = *v3;
  if (v11 == 1)
  {
    if (objc_msgSend(a1, sel_hasRank))
    {
      id result = objc_msgSend(a1, sel_rank);
      if (result) {
        goto LABEL_10;
      }
    }
  }
  id result = objc_msgSend(a1, sel_poiCategory);
  if (result)
  {
    uint64_t v13 = result;
    uint64_t v14 = sub_24A6F31F0();
    uint64_t v16 = v15;

    if (v11)
    {
      char v17 = sub_24A6E917C(v14, v16, qword_26FE379B8);
      swift_arrayDestroy();
      if (v17)
      {
        id result = (id)swift_bridgeObjectRelease();
LABEL_10:
        *(_OWORD *)(a3 + 41) = 0u;
        *(_OWORD *)(a3 + 16) = 0u;
        *(_OWORD *)(a3 + 32) = 0u;
        *(_OWORD *)a3 = 0u;
        return result;
      }
    }
    uint64_t v33 = v14;
    uint64_t v34 = v16;
    strcpy(v32, "GEOPOICategory");
    v32[15] = -18;
    v31[0] = 0;
    v31[1] = 0xE000000000000000;
    sub_24A6E9128();
    uint64_t v18 = sub_24A6F33A0();
    uint64_t v20 = v19;
    swift_bridgeObjectRelease();
    uint64_t v33 = v18;
    uint64_t v34 = v20;
    uint64_t v21 = sub_24A6F3390();
    uint64_t v23 = v22;
    swift_bridgeObjectRelease();
    v32[0] = 0;
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a2, v7);
    id result = (id)sub_24A6E48AC(v32, (uint64_t)v10, v21, v23, (uint64_t)&v33);
    uint64_t v24 = v34;
    uint64_t v25 = v35;
    char v26 = v38;
    long long v27 = v36;
    long long v28 = v37;
    *(void *)a3 = v33;
    *(void *)(a3 + 8) = v24;
    *(void *)(a3 + 16) = v25;
    *(_OWORD *)(a3 + 24) = v27;
    *(_OWORD *)(a3 + 40) = v28;
  }
  else
  {
    if (v11) {
      goto LABEL_10;
    }
    v32[0] = 0;
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a2, v7);
    id result = (id)sub_24A6E48AC(v32, (uint64_t)v10, 0, 0, (uint64_t)&v33);
    uint64_t v29 = v34;
    uint64_t v30 = v35;
    char v26 = v38;
    *(void *)a3 = v33;
    *(void *)(a3 + 8) = v29;
    *(void *)(a3 + 16) = v30;
    *(_OWORD *)(a3 + 24) = v36;
    *(_OWORD *)(a3 + 40) = v37;
  }
  *(unsigned char *)(a3 + 56) = v26;
  return result;
}

double EventStreamClient.semanticLocationEvent(body:date:)@<D0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_24A6E52D8(&qword_2697B19F8);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v8 = &v30[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  id v10 = &v30[-v9];
  uint64_t v11 = sub_24A6F3110();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = &v30[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = sub_24A6E9244((int)objc_msgSend(a1, sel_placeType), (int)objc_msgSend(a1, sel_userSpecificPlaceType));
  if (v16)
  {
    uint64_t v17 = v15;
    uint64_t v18 = v16;
    char v31 = 1;
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v12 + 16))(v14, a2, v11);
    sub_24A6E48AC(&v31, (uint64_t)v14, v17, v18, (uint64_t)v32);
    if (objc_msgSend(a1, sel_hasStarting)) {
      char v35 = objc_msgSend(a1, sel_starting) ^ 1;
    }
    id v19 = objc_msgSend(a1, sel_loiIdentifier);
    if (v19)
    {
      uint64_t v20 = v19;
      sub_24A6F3130();

      uint64_t v21 = sub_24A6F3150();
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v8, 0, 1, v21);
    }
    else
    {
      uint64_t v21 = sub_24A6F3150();
      (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v8, 1, 1, v21);
    }
    sub_24A6E9358((uint64_t)v8, (uint64_t)v10);
    sub_24A6F3150();
    uint64_t v23 = *(void *)(v21 - 8);
    if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v23 + 48))(v10, 1, v21) == 1)
    {
      sub_24A6E6A9C((uint64_t)v10, &qword_2697B19F8);
      uint64_t v24 = 0;
      uint64_t v25 = 0;
    }
    else
    {
      uint64_t v24 = sub_24A6F3120();
      uint64_t v25 = v26;
      (*(void (**)(unsigned char *, uint64_t))(v23 + 8))(v10, v21);
    }
    swift_bridgeObjectRelease();
    uint64_t v27 = v32[1];
    uint64_t v28 = v33;
    char v29 = v35;
    *(void *)a3 = v32[0];
    *(void *)(a3 + 8) = v27;
    *(void *)(a3 + 16) = v28;
    *(void *)(a3 + 24) = v24;
    *(void *)(a3 + 32) = v25;
    double result = *(double *)&v34;
    *(_OWORD *)(a3 + 40) = v34;
    *(unsigned char *)(a3 + 56) = v29;
  }
  else
  {
    double result = 0.0;
    *(_OWORD *)(a3 + 41) = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)a3 = 0u;
  }
  return result;
}

uint64_t sub_24A6E90C8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

unint64_t sub_24A6E9128()
{
  unint64_t result = qword_2697B19F0;
  if (!qword_2697B19F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697B19F0);
  }
  return result;
}

uint64_t sub_24A6E917C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_24A6F3520();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  uint64_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_24A6F3520() & 1) != 0) {
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

uint64_t sub_24A6E9244(int a1, int a2)
{
  id v5 = (id)BMLocationSemanticUserSpecificPlaceTypeAsString();
  uint64_t v6 = sub_24A6F31F0();

  id v7 = (id)BMLocationSemanticPlaceTypeAsString();
  uint64_t v8 = sub_24A6F31F0();

  if (a2)
  {
    if (a1 && a1 != 3)
    {
      sub_24A6F3260();
      sub_24A6F3260();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    if (*v2 == 1 && !a1)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  return v8;
}

uint64_t sub_24A6E9358(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24A6E52D8(&qword_2697B19F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t EventStreamClient.consolidate(events:)(void *a1)
{
  uint64_t v61 = sub_24A6F3150();
  uint64_t v2 = *(void *)(v61 - 8);
  MEMORY[0x270FA5388](v61);
  v60 = (char *)&v58 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_24A6E9A88(MEMORY[0x263F8EE78]);
  uint64_t v5 = a1[2];
  if (!v5)
  {
LABEL_65:
    swift_bridgeObjectRelease();
    return (uint64_t)a1;
  }
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  unint64_t v9 = 0;
  v59 = (void (**)(char *, uint64_t))(v2 + 8);
  id v10 = a1;
  *(void *)&long long v63 = a1;
  *(void *)&long long v62 = v5;
  do
  {
    if (LOBYTE(a1[v6 + 6]) == 1)
    {
      if (v9 >= v10[2]) {
        goto LABEL_68;
      }
      int v11 = LOBYTE(a1[v6 + 11]);
      if (v10[v6 + 8])
      {
        if (v11 == 2) {
          goto LABEL_4;
        }
LABEL_25:
        swift_bridgeObjectRelease();
        if (v11)
        {
          uint64_t v7 = 0;
          uint64_t v8 = 0;
        }
        else
        {
          if (a1[v6 + 8])
          {
            uint64_t v7 = a1[v6 + 7];
            uint64_t v8 = a1[v6 + 8];
          }
          else
          {
            unsigned __int8 v33 = v60;
            _s23ConditionalEngineClient0A5EventV2id10Foundation4UUIDVvg_0();
            uint64_t v7 = sub_24A6F3120();
            uint64_t v8 = v34;
            (*v59)(v33, v61);
          }
          swift_bridgeObjectRetain();
        }
        goto LABEL_4;
      }
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        id v10 = sub_24A6EAA80(v10);
      }
      if (v9 >= v10[2]) {
        goto LABEL_71;
      }
      uint64_t v26 = &v10[v6];
      v26[7] = v7;
      v26[8] = v8;
      swift_bridgeObjectRelease();
      if (v11 != 2) {
        goto LABEL_25;
      }
    }
    else
    {
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        id v10 = sub_24A6EAA80(v10);
      }
      if (v9 >= v10[2]) {
        goto LABEL_67;
      }
      BOOL v12 = &v10[v6];
      v12[7] = v7;
      v12[8] = v8;
      swift_bridgeObjectRelease();
      if (v8)
      {
        if (v9 >= v10[2]) {
          goto LABEL_69;
        }
        uint64_t v13 = v10[v6 + 10];
        if (v13)
        {
          *(void *)&long long v64 = v10[v6 + 9];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v65 = (void *)v4;
          uint64_t v15 = v7;
          unint64_t v17 = sub_24A6EA268(v7, v8);
          unint64_t v18 = v4;
          uint64_t v19 = *(void *)(v4 + 16);
          BOOL v20 = (v16 & 1) == 0;
          uint64_t v21 = v19 + v20;
          if (__OFADD__(v19, v20)) {
            goto LABEL_70;
          }
          char v22 = v16;
          if (*(void *)(v18 + 24) >= v21)
          {
            if (isUniquelyReferenced_nonNull_native)
            {
              uint64_t v25 = v65;
              if ((v16 & 1) == 0) {
                goto LABEL_39;
              }
            }
            else
            {
              sub_24A6EA8C4();
              uint64_t v25 = v65;
              if ((v22 & 1) == 0) {
                goto LABEL_39;
              }
            }
          }
          else
          {
            sub_24A6EA3C4(v21, isUniquelyReferenced_nonNull_native);
            unint64_t v23 = sub_24A6EA268(v15, v8);
            if ((v22 & 1) != (v24 & 1)) {
              goto LABEL_75;
            }
            unint64_t v17 = v23;
            uint64_t v25 = v65;
            if ((v22 & 1) == 0)
            {
LABEL_39:
              v25[(v17 >> 6) + 8] |= 1 << v17;
              char v35 = (uint64_t *)(v25[6] + 16 * v17);
              uint64_t *v35 = v15;
              v35[1] = v8;
              long long v36 = (void *)(v25[7] + 16 * v17);
              void *v36 = v64;
              v36[1] = v13;
              uint64_t v37 = v25[2];
              BOOL v38 = __OFADD__(v37, 1);
              uint64_t v39 = v37 + 1;
              if (v38) {
                goto LABEL_73;
              }
              uint64_t v7 = v15;
              unint64_t v4 = (unint64_t)v25;
              v25[2] = v39;
              swift_bridgeObjectRetain();
              goto LABEL_41;
            }
          }
          unsigned __int8 v32 = (void *)(v25[7] + 16 * v17);
          swift_bridgeObjectRelease();
          *unsigned __int8 v32 = v64;
          v32[1] = v13;
          unint64_t v4 = (unint64_t)v25;
          uint64_t v7 = v15;
LABEL_41:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          a1 = (void *)v63;
          uint64_t v5 = v62;
          goto LABEL_4;
        }
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v27 = v7;
        unint64_t v28 = sub_24A6EA268(v7, v8);
        char v30 = v29;
        swift_bridgeObjectRelease();
        if (v30)
        {
          char v31 = swift_isUniquelyReferenced_nonNull_native();
          v65 = (void *)v4;
          if ((v31 & 1) == 0)
          {
            sub_24A6EA8C4();
            unint64_t v4 = (unint64_t)v65;
          }
          swift_bridgeObjectRelease();
          sub_24A6EA6EC(v28, v4);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        swift_bridgeObjectRelease();
        uint64_t v7 = v27;
      }
    }
LABEL_4:
    ++v9;
    v6 += 8;
  }
  while (v5 != v9);
  swift_bridgeObjectRelease();
  uint64_t v40 = v10[2];
  if (!v40)
  {
LABEL_64:
    a1 = v10;
    goto LABEL_65;
  }
  uint64_t v41 = 0;
  unint64_t v42 = 0;
  long long v64 = xmmword_24A6F3C10;
  long long v63 = xmmword_24A6F4130;
  long long v62 = xmmword_24A6F4140;
  uint64_t v61 = v40;
  while (v42 < v10[2])
  {
    uint64_t v43 = v10[v41 + 8];
    if (v43 && *(void *)(v4 + 16))
    {
      uint64_t v44 = v10[v41 + 7];
      swift_bridgeObjectRetain();
      unint64_t v45 = sub_24A6EA268(v44, v43);
      if (v46)
      {
        unint64_t v47 = v4;
        v48 = (uint64_t *)(*(void *)(v4 + 56) + 16 * v45);
        uint64_t v50 = *v48;
        uint64_t v49 = v48[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        sub_24A6E52D8(&qword_2697B1A00);
        inited = (_OWORD *)swift_initStackObject();
        inited[1] = v64;
        inited[2] = v63;
        inited[3] = v62;
        if (v42 >= v10[2]) {
          goto LABEL_72;
        }
        v52 = inited;
        uint64_t v53 = v10[v41 + 10];
        if (v53
          && ((uint64_t v54 = v10[v41 + 9], v54 == 1701670728) && v53 == 0xE400000000000000
           || (sub_24A6F3520() & 1) != 0
           || (uint64_t v55 = *((void *)v52 + 7)) != 0
           && (*((void *)v52 + 6) == v54 && v55 == v53 || (sub_24A6F3520() & 1) != 0)))
        {
          swift_setDeallocating();
          sub_24A6E52D8((uint64_t *)&unk_2697B1A08);
          swift_arrayDestroy();
          swift_bridgeObjectRelease();
          unint64_t v4 = v47;
          uint64_t v40 = v61;
        }
        else
        {
          swift_setDeallocating();
          sub_24A6E52D8((uint64_t *)&unk_2697B1A08);
          swift_arrayDestroy();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            id v10 = sub_24A6EAA80(v10);
          }
          uint64_t v40 = v61;
          if (v42 >= v10[2]) {
            goto LABEL_74;
          }
          v56 = &v10[v41];
          v56[9] = v50;
          v56[10] = v49;
          swift_bridgeObjectRelease();
          unint64_t v4 = v47;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
    ++v42;
    v41 += 8;
    if (v40 == v42) {
      goto LABEL_64;
    }
  }
  __break(1u);
LABEL_67:
  __break(1u);
LABEL_68:
  __break(1u);
LABEL_69:
  __break(1u);
LABEL_70:
  __break(1u);
LABEL_71:
  __break(1u);
LABEL_72:
  __break(1u);
LABEL_73:
  __break(1u);
LABEL_74:
  __break(1u);
LABEL_75:
  uint64_t result = sub_24A6F3530();
  __break(1u);
  return result;
}

unint64_t sub_24A6E9A88(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_24A6E52D8(&qword_2697B1A88);
  uint64_t v2 = (void *)sub_24A6F3450();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  unint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_24A6EA268(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    int v11 = (uint64_t *)(v2[6] + 16 * result);
    *int v11 = v5;
    v11[1] = v6;
    BOOL v12 = (void *)(v2[7] + 16 * result);
    void *v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
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

unint64_t sub_24A6E9BAC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_24A6E52D8(&qword_2697B1A30);
  uint64_t v2 = sub_24A6F3450();
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
    sub_24A6EAFCC(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_24A6EA268(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    int v11 = (uint64_t *)(v3[6] + 16 * result);
    *int v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_24A6EB034(&v17, (_OWORD *)(v3[7] + 32 * result));
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

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> EventStreamClient.fetchJasonEvents(shouldConsolidate:)(Swift::Bool shouldConsolidate)
{
  uint64_t v2 = (void *)EventStreamClient.readStreams()();
  uint64_t v3 = (uint64_t)v2;
  if (shouldConsolidate)
  {
    uint64_t v4 = EventStreamClient.consolidate(events:)(v2);
    swift_bridgeObjectRelease();
    uint64_t v3 = v4;
  }
  uint64_t v5 = sub_24A6E9D54(v3);
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  uint64_t v8 = v5;
  unint64_t v9 = v7;
  result._object = v9;
  result._countAndFlagsBits = v8;
  return result;
}

uint64_t sub_24A6E9D54(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_24A6F2FA0();
  MEMORY[0x270FA5388](v3);
  sub_24A6F2FE0();
  swift_allocObject();
  uint64_t v4 = sub_24A6F2FD0();
  sub_24A6E52D8((uint64_t *)&unk_2697B1A40);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_24A6F3C10;
  sub_24A6F2F80();
  sub_24A6F2F90();
  sub_24A6EB044();
  sub_24A6E52D8((uint64_t *)&unk_2697B1A50);
  sub_24A6E531C();
  sub_24A6F33C0();
  sub_24A6F2FB0();
  v22[0] = a1;
  sub_24A6E52D8(&qword_2697B1A60);
  sub_24A6EB09C();
  uint64_t v5 = v4;
  uint64_t v6 = sub_24A6F2FC0();
  if (v1)
  {
    swift_release();
  }
  else
  {
    unint64_t v8 = v7;
    uint64_t v9 = v6;
    switch(v7 >> 62)
    {
      case 1uLL:
        if (v6 >> 32 < (int)v6) {
          __break(1u);
        }
        sub_24A6E6940(v6, v7);
        swift_retain();
        uint64_t v5 = sub_24A6E669C((int)v9, v9 >> 32, v8 & 0x3FFFFFFFFFFFFFFFLL, (void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_24A6E6908);
        uint64_t v16 = v15;
        sub_24A6E6998(v9, v8);
        if (v16) {
          goto LABEL_18;
        }
        goto LABEL_11;
      case 2uLL:
        uint64_t v10 = *(void *)(v6 + 16);
        uint64_t v11 = *(void *)(v6 + 24);
        sub_24A6E6940(v6, v7);
        swift_retain();
        swift_retain();
        uint64_t v5 = sub_24A6E669C(v10, v11, v8 & 0x3FFFFFFFFFFFFFFFLL, (void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_24A6E6908);
        uint64_t v13 = v12;
        swift_release();
        swift_release();
        if (v13) {
          goto LABEL_18;
        }
LABEL_11:
        uint64_t v20 = v9;
        unint64_t v21 = v8;
        sub_24A6E6940(v9, v8);
        sub_24A6E52D8(&qword_2697B1948);
        if (swift_dynamicCast())
        {
          sub_24A6E69F0(v18, (uint64_t)v22);
          sub_24A6E6A08(v22, v23);
          if (sub_24A6F3480())
          {
            sub_24A6E6A08(v22, v23);
            sub_24A6F3470();
            sub_24A6E6998(v9, v8);
            uint64_t v5 = *(void *)&v18[0];
            sub_24A6E6A4C((uint64_t)v22);
            goto LABEL_19;
          }
          sub_24A6E6A4C((uint64_t)v22);
        }
        else
        {
          uint64_t v19 = 0;
          memset(v18, 0, sizeof(v18));
          sub_24A6E6A9C((uint64_t)v18, &qword_2697B1A80);
        }
        uint64_t v14 = sub_24A6E65E8(v9, v8);
LABEL_17:
        uint64_t v5 = v14;
LABEL_18:
        sub_24A6E6998(v9, v8);
LABEL_19:
        sub_24A6E6998(v9, v8);
        swift_release();
        break;
      case 3uLL:
        memset(v22, 0, 14);
        goto LABEL_8;
      default:
        v22[0] = v6;
        LOWORD(v22[1]) = v7;
        BYTE2(v22[1]) = BYTE2(v7);
        BYTE3(v22[1]) = BYTE3(v7);
        BYTE4(v22[1]) = BYTE4(v7);
        BYTE5(v22[1]) = BYTE5(v7);
LABEL_8:
        uint64_t v14 = sub_24A6F3240();
        goto LABEL_17;
    }
  }
  return v5;
}

unint64_t sub_24A6EA268(uint64_t a1, uint64_t a2)
{
  sub_24A6F35A0();
  sub_24A6F3250();
  uint64_t v4 = sub_24A6F35E0();

  return sub_24A6EA2E0(a1, a2, v4);
}

unint64_t sub_24A6EA2E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24A6F3520() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_24A6F3520() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_24A6EA3C4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_24A6E52D8(&qword_2697B1A88);
  char v42 = a2;
  uint64_t v6 = sub_24A6F3440();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    uint64_t v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      int64_t v13 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v41 + 8 * v13);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v13 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v41 + 8 * v13);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    unsigned __int8 v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    char v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_24A6F35A0();
    sub_24A6F3250();
    uint64_t result = sub_24A6F35E0();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v16 == v28;
        if (v16 == v28) {
          unint64_t v16 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      unint64_t v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = 16 * v17;
    uint64_t v19 = (void *)(*(void *)(v7 + 48) + v18);
    *uint64_t v19 = v34;
    v19[1] = v33;
    uint64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    *uint64_t v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  uint64_t v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

unint64_t sub_24A6EA6EC(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_24A6F33D0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_24A6F35A0();
        swift_bridgeObjectRetain();
        sub_24A6F3250();
        uint64_t v9 = sub_24A6F35E0();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          int64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            _OWORD *v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          unint64_t v15 = (_OWORD *)(v14 + 16 * v3);
          unint64_t v16 = (_OWORD *)(v14 + 16 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *unint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *unint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void *sub_24A6EA8C4()
{
  uint64_t v1 = v0;
  sub_24A6E52D8(&qword_2697B1A88);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24A6F3430();
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
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    int64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v23 = v19;
    v23[1] = v18;
    uint64_t v24 = (void *)(*(void *)(v4 + 56) + v16);
    *uint64_t v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_24A6EAA80(void *a1)
{
  return sub_24A6EF05C(0, a1[2], 0, a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for EventStreamClient(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    uint64_t *v3 = *a2;
    uint64_t v3 = (uint64_t *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v5 = *(int *)(a3 + 20);
    uint64_t v6 = (char *)a1 + v5;
    unint64_t v7 = (char *)a2 + v5;
    uint64_t v8 = sub_24A6F3110();
    (*(void (**)(unsigned char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t destroy for EventStreamClient(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_24A6F3110();
  int v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);

  return v4(v2, v3);
}

unsigned char *initializeWithCopy for EventStreamClient(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_24A6F3110();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

unsigned char *assignWithCopy for EventStreamClient(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_24A6F3110();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

unsigned char *initializeWithTake for EventStreamClient(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_24A6F3110();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

unsigned char *assignWithTake for EventStreamClient(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_24A6F3110();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for EventStreamClient(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24A6EADCC);
}

uint64_t sub_24A6EADCC(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 254)
  {
    unsigned int v4 = *a1;
    BOOL v5 = v4 >= 2;
    int v6 = (v4 + 2147483646) & 0x7FFFFFFF;
    if (v5) {
      return (v6 + 1);
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v10 = sub_24A6F3110();
    uint64_t v11 = *(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    int64_t v13 = &a1[*(int *)(a3 + 20)];
    return v11(v13, a2, v12);
  }
}

uint64_t storeEnumTagSinglePayload for EventStreamClient(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24A6EAE90);
}

unsigned char *sub_24A6EAE90(unsigned char *result, uint64_t a2, int a3, uint64_t a4)
{
  BOOL v5 = result;
  if (a3 == 254)
  {
    *uint64_t result = a2 + 1;
  }
  else
  {
    uint64_t v7 = sub_24A6F3110();
    uint64_t v8 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = &v5[*(int *)(a4 + 20)];
    return (unsigned char *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_24A6EAF34()
{
  uint64_t result = sub_24A6F3110();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24A6EAFCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24A6E52D8(&qword_2697B1A38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_24A6EB034(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_24A6EB044()
{
  unint64_t result = qword_2697B1930;
  if (!qword_2697B1930)
  {
    sub_24A6F2FA0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697B1930);
  }
  return result;
}

unint64_t sub_24A6EB09C()
{
  unint64_t result = qword_2697B1A68;
  if (!qword_2697B1A68)
  {
    sub_24A6E5378(&qword_2697B1A60);
    sub_24A6E53C0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697B1A68);
  }
  return result;
}

void *sub_24A6EB110(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, uint64_t, uint64_t))
{
  if (a1) {
    uint64_t v4 = a2 - a1;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t result = a3(&v6, a1, v4);
  if (!v3) {
    return (void *)v6;
  }
  return result;
}

uint64_t sub_24A6EB164(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t InferenceRun.id.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InferenceRun.result.getter()
{
  return *(unsigned __int8 *)(v0 + 16);
}

double InferenceRun.confidence.getter()
{
  return *(double *)(v0 + 24);
}

uint64_t InferenceRun.response.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InferenceRun.promptTemplate.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InferenceRun.groupName.getter()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InferenceRun.timestamp.getter()
{
  uint64_t v1 = *(void *)(v0 + 80);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InferenceRun.description.getter()
{
  return 0;
}

uint64_t InferenceRun.hash(into:)()
{
  uint64_t v1 = *(void *)(v0 + 72);
  swift_bridgeObjectRetain();
  sub_24A6F3250();
  swift_bridgeObjectRelease();
  sub_24A6F35C0();
  sub_24A6F35D0();
  swift_bridgeObjectRetain();
  sub_24A6F3250();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24A6F3250();
  swift_bridgeObjectRelease();
  sub_24A6F35C0();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_24A6F3250();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  sub_24A6F3250();

  return swift_bridgeObjectRelease();
}

uint64_t InferenceRun.hashValue.getter()
{
  return sub_24A6F35E0();
}

uint64_t sub_24A6EB748@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24A6EB754()
{
  return sub_24A6F35E0();
}

uint64_t sub_24A6EB7D4()
{
  return sub_24A6F35E0();
}

uint64_t _s23ConditionalEngineClient12InferenceRunV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 16);
  double v3 = *(double *)(a1 + 24);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v29 = *(void *)(a1 + 72);
  uint64_t v10 = *(void *)(a1 + 80);
  uint64_t v9 = *(void *)(a1 + 88);
  int v11 = *(unsigned __int8 *)(a2 + 16);
  double v12 = *(double *)(a2 + 24);
  uint64_t v13 = *(void *)(a2 + 32);
  uint64_t v14 = *(void *)(a2 + 40);
  uint64_t v16 = *(void *)(a2 + 48);
  uint64_t v15 = *(void *)(a2 + 56);
  uint64_t v28 = *(void *)(a2 + 72);
  if (*(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8))
  {
    uint64_t result = 0;
    if (v2 != v11) {
      return result;
    }
    uint64_t v26 = *(void *)(a2 + 64);
    uint64_t v27 = v8;
    uint64_t v22 = *(void *)(a2 + 88);
    uint64_t v23 = *(void *)(a2 + 80);
    uint64_t v24 = v9;
    uint64_t v25 = v10;
  }
  else
  {
    uint64_t v26 = *(void *)(a2 + 64);
    uint64_t v27 = *(void *)(a1 + 64);
    uint64_t v22 = *(void *)(a2 + 88);
    uint64_t v23 = *(void *)(a2 + 80);
    uint64_t v24 = *(void *)(a1 + 88);
    uint64_t v25 = *(void *)(a1 + 80);
    char v18 = sub_24A6F3520();
    uint64_t result = 0;
    if ((v18 & 1) == 0 || v2 != v11) {
      return result;
    }
  }
  if (v3 == v12)
  {
    if (v5 == v13 && v4 == v14 || (v19 = sub_24A6F3520(), uint64_t result = 0, (v19 & 1) != 0))
    {
      if (v6 == v16 && v7 == v15 || (v20 = sub_24A6F3520(), uint64_t result = 0, (v20 & 1) != 0))
      {
        if (v29)
        {
          if (v28)
          {
            if (v27 != v26 || v29 != v28)
            {
              char v21 = sub_24A6F3520();
              uint64_t result = 0;
              if ((v21 & 1) == 0) {
                return result;
              }
            }
LABEL_22:
            if (v25 == v23 && v24 == v22) {
              return 1;
            }
            return sub_24A6F3520();
          }
        }
        else if (!v28)
        {
          goto LABEL_22;
        }
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_24A6EBA5C()
{
  return MEMORY[0x263F8D320];
}

unint64_t sub_24A6EBA6C()
{
  unint64_t result = qword_2697B1AB0;
  if (!qword_2697B1AB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697B1AB0);
  }
  return result;
}

uint64_t destroy for InferenceRun()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for InferenceRun(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v4;
  uint64_t v5 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v5;
  uint64_t v6 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v6;
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for InferenceRun(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for InferenceRun(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

uint64_t assignWithTake for InferenceRun(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for InferenceRun(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 96)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for InferenceRun(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 96) = 1;
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
    *(unsigned char *)(result + 96) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for InferenceRun()
{
  return &type metadata for InferenceRun;
}

uint64_t sub_24A6EBDD8()
{
  swift_beginAccess();
  return *(void *)(v0 + 16);
}

uint64_t sub_24A6EBE0C(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*sub_24A6EBE4C())()
{
  return j__swift_endAccess;
}

uint64_t InferenceRunStore.__allocating_init(fileManager:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = 0;
  uint64_t v3 = v2 + OBJC_IVAR____TtC23ConditionalEngineClient17InferenceRunStore_fileManager;
  uint64_t v4 = sub_24A6F3170();
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, a1, v4);
  uint64_t v6 = sub_24A6EC448();
  uint64_t v9 = v6;
  if ((v8 & 0x100) != 0)
  {
    uint64_t v10 = v7;
    char v11 = v8;
    sub_24A6EC10C(v6, v7, v8);
    sub_24A6ED140(v9, v10, v11, 1);
  }
  else
  {
    swift_beginAccess();
    *(void *)(v2 + 16) = v9;
    if (v9)
    {
      sub_24A6ED19C();
      sub_24A6EDBFC();
    }
  }
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  return v2;
}

uint64_t InferenceRunStore.init(fileManager:)(uint64_t a1)
{
  *(void *)(v1 + 16) = 0;
  uint64_t v3 = v1 + OBJC_IVAR____TtC23ConditionalEngineClient17InferenceRunStore_fileManager;
  uint64_t v4 = sub_24A6F3170();
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, a1, v4);
  uint64_t v6 = sub_24A6EC448();
  uint64_t v9 = v6;
  if ((v8 & 0x100) != 0)
  {
    uint64_t v10 = v7;
    char v11 = v8;
    sub_24A6EC10C(v6, v7, v8);
    sub_24A6ED140(v9, v10, v11, 1);
  }
  else
  {
    swift_beginAccess();
    *(void *)(v1 + 16) = v9;
    if (v9)
    {
      sub_24A6ED19C();
      sub_24A6EDBFC();
    }
  }
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  return v1;
}

void sub_24A6EC10C(void *a1, void *a2, char a3)
{
  switch(a3)
  {
    case 1:
      sub_24A6E52D8(&qword_2697B1A90);
      uint64_t v7 = swift_allocObject();
      *(_OWORD *)(v7 + 16) = xmmword_24A6F4120;
      sub_24A6F33E0();
      swift_bridgeObjectRelease();
      unint64_t v8 = 0xD00000000000001ALL;
      uint64_t v9 = "Directory does not exist: ";
      goto LABEL_6;
    case 2:
      sub_24A6E52D8(&qword_2697B1A90);
      uint64_t v7 = swift_allocObject();
      *(_OWORD *)(v7 + 16) = xmmword_24A6F4120;
      sub_24A6F33E0();
      swift_bridgeObjectRelease();
      unint64_t v8 = 0xD00000000000001BLL;
      uint64_t v9 = "Directory is not writable: ";
      goto LABEL_6;
    case 3:
      sub_24A6E52D8(&qword_2697B1A90);
      uint64_t v7 = swift_allocObject();
      *(_OWORD *)(v7 + 16) = xmmword_24A6F4120;
      sub_24A6F33E0();
      swift_bridgeObjectRelease();
      unint64_t v8 = 0xD000000000000020;
      uint64_t v9 = "Unable to open database. Error: ";
LABEL_6:
      unint64_t v11 = v8;
      unint64_t v12 = (unint64_t)(v9 - 32) | 0x8000000000000000;
      sub_24A6F3260();
      *(void *)(v7 + 56) = MEMORY[0x263F8D310];
      *(void *)(v7 + 32) = v11;
      *(void *)(v7 + 40) = v12;
      sub_24A6F3590();
      goto LABEL_8;
    case 4:
      sub_24A6E52D8(&qword_2697B1A90);
      uint64_t v10 = swift_allocObject();
      *(_OWORD *)(v10 + 16) = xmmword_24A6F4120;
      *(void *)(v10 + 56) = MEMORY[0x263F8D310];
      *(void *)(v10 + 32) = 0xD000000000000027;
      *(void *)(v10 + 40) = 0x800000024A6F4E40;
      sub_24A6F3590();
LABEL_8:
      swift_bridgeObjectRelease();
      break;
    default:
      sub_24A6E52D8(&qword_2697B1A90);
      uint64_t v5 = swift_allocObject();
      *(_OWORD *)(v5 + 16) = xmmword_24A6F4120;
      id v6 = a1;
      sub_24A6F33E0();
      sub_24A6F3260();
      sub_24A6E52D8(&qword_2697B1A98);
      sub_24A6F3410();
      *(void *)(v5 + 56) = MEMORY[0x263F8D310];
      *(void *)(v5 + 32) = 0;
      *(void *)(v5 + 40) = 0xE000000000000000;
      sub_24A6F3590();
      swift_bridgeObjectRelease();
      sub_24A6ED14C(a1, a2, 0);
      break;
  }
}

sqlite3 *sub_24A6EC448()
{
  ppDb[1] = *(sqlite3 **)MEMORY[0x263EF8340];
  uint64_t v0 = sub_24A6F31B0();
  uint64_t v81 = *(void *)(v0 - 8);
  uint64_t v82 = v0;
  uint64_t v1 = MEMORY[0x270FA5388](v0);
  v80 = (char *)&v73 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  v79 = (char *)&v73 - v4;
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  v78 = (char *)&v73 - v6;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v73 - v8;
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  unint64_t v12 = (char *)&v73 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (void (*)(char *, uint64_t))((char *)&v73 - v13);
  uint64_t v15 = sub_24A6F3060();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  char v19 = (char *)&v73 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  uint64_t v22 = (char *)&v73 - v21;
  MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v73 - v23;
  ppDb[0] = 0;
  sub_24A6F3160();
  v74 = v12;
  v75 = v14;
  v73 = v9;
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v24, v22, v15);
  char v83 = 0;
  v76 = v24;
  sub_24A6F3030();
  uint64_t v25 = sub_24A6F3040();
  unint64_t v27 = v26;
  uint64_t v28 = *(void (**)(char *, uint64_t))(v16 + 8);
  uint64_t v77 = v15;
  v80 = (char *)(v16 + 8);
  v28(v19, v15);
  uint64_t v29 = self;
  id v30 = objc_msgSend(v29, sel_defaultManager);
  uint64_t v31 = (void *)sub_24A6F31E0();
  LODWORD(v14) = objc_msgSend(v30, sel_fileExistsAtPath_isDirectory_, v31, &v83);

  if v14 && (v83)
  {
    v75 = v28;
    id v32 = objc_msgSend(v29, sel_defaultManager);
    uint64_t v33 = (void *)sub_24A6F31E0();
    unsigned __int8 v34 = objc_msgSend(v32, sel_isWritableFileAtPath_, v33);

    if (v34)
    {
      swift_bridgeObjectRelease();
      char v35 = v76;
      sub_24A6F3040();
      uint64_t v36 = sub_24A6F3230();
      swift_bridgeObjectRelease();
      int v37 = sqlite3_open_v2((const char *)(v36 + 32), ppDb, 6, 0);
      swift_release();
      uint64_t v38 = v82;
      uint64_t v39 = v77;
      if (v37)
      {
        if (sqlite3_errmsg(ppDb[0]))
        {
          uint64_t v25 = sub_24A6F3270();
          unint64_t v41 = v40;
          char v42 = v73;
          sub_24A6F3190();
          swift_bridgeObjectRetain_n();
          uint64_t v43 = sub_24A6F31A0();
          os_log_type_t v44 = sub_24A6F3310();
          if (os_log_type_enabled(v43, v44))
          {
            unint64_t v45 = (uint8_t *)swift_slowAlloc();
            uint64_t v46 = swift_slowAlloc();
            uint64_t v85 = v46;
            *(_DWORD *)unint64_t v45 = 136315138;
            swift_bridgeObjectRetain();
            uint64_t v84 = sub_24A6F1D40(v25, v41, &v85);
            sub_24A6F3370();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_24A6E2000, v43, v44, "Unable to open database: %s", v45, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x24C5CCF30](v46, -1, -1);
            MEMORY[0x24C5CCF30](v45, -1, -1);

            (*(void (**)(char *, uint64_t))(v81 + 8))(v73, v82);
            v75(v35, v77);
          }
          else
          {
            swift_bridgeObjectRelease_n();

            (*(void (**)(char *, uint64_t))(v81 + 8))(v42, v38);
            v75(v35, v39);
          }
        }
        else
        {
          v69 = v78;
          sub_24A6F3190();
          v70 = sub_24A6F31A0();
          os_log_type_t v71 = sub_24A6F3310();
          if (os_log_type_enabled(v70, v71))
          {
            v72 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v72 = 0;
            _os_log_impl(&dword_24A6E2000, v70, v71, "Unknown error occurred while opening the database", v72, 2u);
            MEMORY[0x24C5CCF30](v72, -1, -1);
          }

          (*(void (**)(char *, uint64_t))(v81 + 8))(v69, v38);
          v75(v35, v39);
          return 0;
        }
      }
      else
      {
        uint64_t v85 = 0;
        unint64_t v86 = 0xE000000000000000;
        sub_24A6F33E0();
        swift_bridgeObjectRelease();
        uint64_t v85 = 0xD00000000000002ELL;
        unint64_t v86 = 0x800000024A6F4F10;
        sub_24A6F3040();
        sub_24A6F3260();
        swift_bridgeObjectRelease();
        uint64_t v61 = v85;
        unint64_t v60 = v86;
        sub_24A6E52D8(&qword_2697B1A90);
        uint64_t v62 = swift_allocObject();
        *(_OWORD *)(v62 + 16) = xmmword_24A6F4120;
        *(void *)(v62 + 56) = MEMORY[0x263F8D310];
        *(void *)(v62 + 32) = v61;
        *(void *)(v62 + 40) = v60;
        swift_bridgeObjectRetain();
        sub_24A6F3590();
        swift_bridgeObjectRelease();
        long long v63 = v79;
        sub_24A6F3190();
        swift_bridgeObjectRetain();
        long long v64 = sub_24A6F31A0();
        os_log_type_t v65 = sub_24A6F3320();
        if (os_log_type_enabled(v64, v65))
        {
          v66 = (uint8_t *)swift_slowAlloc();
          uint64_t v67 = swift_slowAlloc();
          uint64_t v85 = v67;
          *(_DWORD *)v66 = 136315138;
          swift_bridgeObjectRetain();
          uint64_t v84 = sub_24A6F1D40(v61, v60, &v85);
          sub_24A6F3370();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_24A6E2000, v64, v65, "%s", v66, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24C5CCF30](v67, -1, -1);
          MEMORY[0x24C5CCF30](v66, -1, -1);

          (*(void (**)(char *, uint64_t))(v81 + 8))(v79, v82);
          v68 = v76;
        }
        else
        {
          swift_bridgeObjectRelease_n();

          (*(void (**)(char *, uint64_t))(v81 + 8))(v63, v82);
          v68 = v35;
        }
        v75(v68, v39);
        return ppDb[0];
      }
    }
    else
    {
      uint64_t v53 = v74;
      sub_24A6F3190();
      swift_bridgeObjectRetain_n();
      uint64_t v54 = sub_24A6F31A0();
      os_log_type_t v55 = sub_24A6F3310();
      BOOL v56 = os_log_type_enabled(v54, v55);
      uint64_t v57 = v77;
      if (v56)
      {
        uint64_t v58 = (uint8_t *)swift_slowAlloc();
        uint64_t v59 = swift_slowAlloc();
        uint64_t v85 = v59;
        *(_DWORD *)uint64_t v58 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v84 = sub_24A6F1D40(v25, v27, &v85);
        sub_24A6F3370();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_24A6E2000, v54, v55, "Directory is not writable: %s", v58, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C5CCF30](v59, -1, -1);
        MEMORY[0x24C5CCF30](v58, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      (*(void (**)(char *, uint64_t))(v81 + 8))(v53, v82);
      v75(v76, v57);
    }
  }
  else
  {
    unint64_t v47 = v75;
    sub_24A6F3190();
    swift_bridgeObjectRetain_n();
    v48 = sub_24A6F31A0();
    os_log_type_t v49 = sub_24A6F3310();
    if (os_log_type_enabled(v48, v49))
    {
      uint64_t v50 = (uint8_t *)swift_slowAlloc();
      uint64_t v51 = swift_slowAlloc();
      uint64_t v85 = v51;
      *(_DWORD *)uint64_t v50 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v84 = sub_24A6F1D40(v25, v27, &v85);
      sub_24A6F3370();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24A6E2000, v48, v49, "Directory does not exist: %s", v50, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5CCF30](v51, -1, -1);
      MEMORY[0x24C5CCF30](v50, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    (*(void (**)(void, uint64_t))(v81 + 8))(v47, v82);
    v28(v76, v77);
  }
  return (sqlite3 *)v25;
}

void sub_24A6ED140(void *a1, id a2, char a3, char a4)
{
  if (a4) {
    sub_24A6ED14C(a1, a2, a3);
  }
}

void sub_24A6ED14C(void *a1, id a2, char a3)
{
  switch(a3)
  {
    case 0:

      break;
    case 1:
    case 2:
    case 3:
      swift_bridgeObjectRelease();
      break;
    default:
      return;
  }
}

uint64_t sub_24A6ED19C()
{
  ppStmt[1] = *(sqlite3_stmt **)MEMORY[0x263EF8340];
  uint64_t v1 = sub_24A6F31B0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v3);
  uint64_t v8 = (char *)&v50 - v7;
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)&v50 - v10;
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v50 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v50 - v15;
  ppStmt[0] = 0;
  uint64_t v17 = (sqlite3 **)(v0 + 16);
  swift_beginAccess();
  if (!sqlite3_prepare_v2(*(sqlite3 **)(v0 + 16), "CREATE TABLE IF NOT EXISTS InferenceRun(\nId INTEGER PRIMARY KEY AUTOINCREMENT,\nUUID TEXT UNIQUE,\nResult INTEGER,\nConfidence REAL,\nResponse TEXT,\nPromptTemplate TEXT,\nGroupName TEXT,\nTimestamp DATETIME DEFAULT CURRENT_TIMESTAMP);",
          -1,
          ppStmt,
          0))
  {
    if (sqlite3_step(ppStmt[0]) == 101)
    {
      sub_24A6E52D8(&qword_2697B1A90);
      uint64_t v25 = swift_allocObject();
      *(_OWORD *)(v25 + 16) = xmmword_24A6F4120;
      *(void *)(v25 + 56) = MEMORY[0x263F8D310];
      *(void *)(v25 + 32) = 0xD00000000000001BLL;
      *(void *)(v25 + 40) = 0x800000024A6F4E20;
      sub_24A6F3590();
      swift_bridgeObjectRelease();
      sub_24A6F3190();
      unint64_t v26 = sub_24A6F31A0();
      os_log_type_t v27 = sub_24A6F3320();
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v28 = (uint8_t *)swift_slowAlloc();
        uint64_t v29 = swift_slowAlloc();
        uint64_t v53 = v29;
        *(_DWORD *)uint64_t v28 = 136315138;
        uint64_t v52 = sub_24A6F1D40(0xD00000000000001BLL, 0x800000024A6F4E20, &v53);
        sub_24A6F3370();
        _os_log_impl(&dword_24A6E2000, v26, v27, "%s", v28, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C5CCF30](v29, -1, -1);
        MEMORY[0x24C5CCF30](v28, -1, -1);
      }

      id v30 = *(void (**)(char *, uint64_t))(v2 + 8);
      uint64_t v31 = v16;
    }
    else if (sqlite3_errmsg(*v17))
    {
      sub_24A6F3270();
      uint64_t v53 = 0;
      unint64_t v54 = 0xE000000000000000;
      sub_24A6F33E0();
      swift_bridgeObjectRelease();
      uint64_t v53 = 0xD000000000000030;
      unint64_t v54 = 0x800000024A6F4DE0;
      sub_24A6F3260();
      swift_bridgeObjectRelease();
      uint64_t v38 = v53;
      unint64_t v37 = v54;
      sub_24A6E52D8(&qword_2697B1A90);
      uint64_t v39 = swift_allocObject();
      *(_OWORD *)(v39 + 16) = xmmword_24A6F4120;
      *(void *)(v39 + 56) = MEMORY[0x263F8D310];
      *(void *)(v39 + 32) = v38;
      *(void *)(v39 + 40) = v37;
      swift_bridgeObjectRetain();
      sub_24A6F3590();
      swift_bridgeObjectRelease();
      sub_24A6F3190();
      swift_bridgeObjectRetain();
      unint64_t v40 = sub_24A6F31A0();
      os_log_type_t v41 = sub_24A6F3310();
      if (os_log_type_enabled(v40, v41))
      {
        uint64_t v51 = v1;
        char v42 = (uint8_t *)swift_slowAlloc();
        uint64_t v43 = swift_slowAlloc();
        uint64_t v53 = v43;
        *(_DWORD *)char v42 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v52 = sub_24A6F1D40(v38, v37, &v53);
        sub_24A6F3370();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_24A6E2000, v40, v41, "%s", v42, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C5CCF30](v43, -1, -1);
        MEMORY[0x24C5CCF30](v42, -1, -1);

        (*(void (**)(char *, uint64_t))(v2 + 8))(v14, v51);
        return sqlite3_finalize(ppStmt[0]);
      }

      swift_bridgeObjectRelease_n();
      id v30 = *(void (**)(char *, uint64_t))(v2 + 8);
      uint64_t v31 = v14;
    }
    else
    {
      sub_24A6E52D8(&qword_2697B1A90);
      uint64_t v44 = swift_allocObject();
      *(_OWORD *)(v44 + 16) = xmmword_24A6F4120;
      *(void *)(v44 + 56) = MEMORY[0x263F8D310];
      *(void *)(v44 + 32) = 0xD000000000000037;
      *(void *)(v44 + 40) = 0x800000024A6F4DA0;
      sub_24A6F3590();
      swift_bridgeObjectRelease();
      sub_24A6F3190();
      unint64_t v45 = sub_24A6F31A0();
      os_log_type_t v46 = sub_24A6F3310();
      if (os_log_type_enabled(v45, v46))
      {
        uint64_t v51 = v1;
        unint64_t v47 = (uint8_t *)swift_slowAlloc();
        uint64_t v48 = swift_slowAlloc();
        uint64_t v53 = v48;
        *(_DWORD *)unint64_t v47 = 136315138;
        uint64_t v52 = sub_24A6F1D40(0xD000000000000037, 0x800000024A6F4DA0, &v53);
        sub_24A6F3370();
        _os_log_impl(&dword_24A6E2000, v45, v46, "%s", v47, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C5CCF30](v48, -1, -1);
        MEMORY[0x24C5CCF30](v47, -1, -1);

        (*(void (**)(char *, uint64_t))(v2 + 8))(v11, v51);
        return sqlite3_finalize(ppStmt[0]);
      }

      id v30 = *(void (**)(char *, uint64_t))(v2 + 8);
      uint64_t v31 = v11;
    }
    goto LABEL_20;
  }
  if (!sqlite3_errmsg(*v17))
  {
    sub_24A6E52D8(&qword_2697B1A90);
    uint64_t v32 = swift_allocObject();
    *(_OWORD *)(v32 + 16) = xmmword_24A6F4120;
    *(void *)(v32 + 56) = MEMORY[0x263F8D310];
    *(void *)(v32 + 32) = 0xD00000000000003CLL;
    *(void *)(v32 + 40) = 0x800000024A6F4D20;
    sub_24A6F3590();
    swift_bridgeObjectRelease();
    sub_24A6F3190();
    uint64_t v33 = sub_24A6F31A0();
    os_log_type_t v34 = sub_24A6F3310();
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v51 = v1;
      char v35 = (uint8_t *)swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      uint64_t v53 = v36;
      *(_DWORD *)char v35 = 136315138;
      uint64_t v52 = sub_24A6F1D40(0xD00000000000003CLL, 0x800000024A6F4D20, &v53);
      sub_24A6F3370();
      _os_log_impl(&dword_24A6E2000, v33, v34, "%s", v35, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5CCF30](v36, -1, -1);
      MEMORY[0x24C5CCF30](v35, -1, -1);

      (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v51);
      return sqlite3_finalize(ppStmt[0]);
    }

    id v30 = *(void (**)(char *, uint64_t))(v2 + 8);
    uint64_t v31 = v5;
LABEL_20:
    v30(v31, v1);
    return sqlite3_finalize(ppStmt[0]);
  }
  sub_24A6F3270();
  uint64_t v53 = 0;
  unint64_t v54 = 0xE000000000000000;
  sub_24A6F33E0();
  sub_24A6F3260();
  sub_24A6F3260();
  swift_bridgeObjectRelease();
  uint64_t v19 = v53;
  unint64_t v18 = v54;
  sub_24A6E52D8(&qword_2697B1A90);
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_24A6F4120;
  *(void *)(v20 + 56) = MEMORY[0x263F8D310];
  *(void *)(v20 + 32) = v19;
  *(void *)(v20 + 40) = v18;
  swift_bridgeObjectRetain();
  sub_24A6F3590();
  swift_bridgeObjectRelease();
  sub_24A6F3190();
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_24A6F31A0();
  os_log_type_t v22 = sub_24A6F3310();
  if (!os_log_type_enabled(v21, v22))
  {

    swift_bridgeObjectRelease_n();
    id v30 = *(void (**)(char *, uint64_t))(v2 + 8);
    uint64_t v31 = v8;
    goto LABEL_20;
  }
  uint64_t v51 = v1;
  uint64_t v23 = (uint8_t *)swift_slowAlloc();
  uint64_t v24 = swift_slowAlloc();
  uint64_t v53 = v24;
  *(_DWORD *)uint64_t v23 = 136315138;
  swift_bridgeObjectRetain();
  uint64_t v52 = sub_24A6F1D40(v19, v18, &v53);
  sub_24A6F3370();
  swift_bridgeObjectRelease_n();
  _os_log_impl(&dword_24A6E2000, v21, v22, "%s", v23, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x24C5CCF30](v24, -1, -1);
  MEMORY[0x24C5CCF30](v23, -1, -1);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v8, v51);
  return sqlite3_finalize(ppStmt[0]);
}

uint64_t sub_24A6EDBFC()
{
  return swift_arrayDestroy();
}

uint64_t sub_24A6EDE3C(uint64_t a1, uint64_t a2)
{
  ppStmt[1] = *(sqlite3_stmt **)MEMORY[0x263EF8340];
  ppStmt[0] = 0;
  uint64_t v5 = (sqlite3 **)(v2 + 16);
  swift_beginAccess();
  if (!sqlite3_prepare_v2(*(sqlite3 **)(v2 + 16), "PRAGMA table_info(InferenceRun);", -1, ppStmt, 0))
  {
    uint64_t v11 = ppStmt[0];
    while (sqlite3_step(v11) == 100)
    {
      if (sqlite3_column_text(v11, 1))
      {
        if (sub_24A6F3280() == a1 && v12 == a2)
        {
          swift_bridgeObjectRelease();
LABEL_39:
          uint64_t v16 = ppStmt[0];
          return sqlite3_finalize(v16);
        }
        char v14 = sub_24A6F3520();
        swift_bridgeObjectRelease();
        if (v14) {
          goto LABEL_39;
        }
      }
    }
  }
  sqlite3_finalize(ppStmt[0]);
  pStmt = 0;
  if (a1 == 1145656661 && a2 == 0xE400000000000000 || (sub_24A6F3520() & 1) != 0)
  {
LABEL_5:
    sub_24A6F33E0();
    sub_24A6F3260();
    sub_24A6F3260();
    goto LABEL_6;
  }
  if ((a1 != 0x746C75736552 || a2 != 0xE600000000000000)
    && (sub_24A6F3520() & 1) == 0
    && (a1 != 0x6E656469666E6F43 || a2 != 0xEA00000000006563)
    && (sub_24A6F3520() & 1) == 0
    && (a1 != 0x65736E6F70736552 || a2 != 0xE800000000000000)
    && (sub_24A6F3520() & 1) == 0
    && (a1 != 0x655474706D6F7250 || a2 != 0xEE006574616C706DLL)
    && (sub_24A6F3520() & 1) == 0
    && (a1 != 0x6D614E70756F7247 || a2 != 0xE900000000000065)
    && (sub_24A6F3520() & 1) == 0)
  {
    if (a1 != 0x6D617473656D6954 || a2 != 0xE900000000000070)
    {
      uint64_t result = sub_24A6F3520();
      if ((result & 1) == 0) {
        return result;
      }
    }
    goto LABEL_5;
  }
  sub_24A6F33E0();
  swift_bridgeObjectRelease();
  sub_24A6F3260();
LABEL_6:
  sub_24A6F3260();
  uint64_t v6 = *v5;
  uint64_t v7 = sub_24A6F3230();
  swift_bridgeObjectRelease();
  int v8 = sqlite3_prepare_v2(v6, (const char *)(v7 + 32), -1, &pStmt, 0);
  swift_release();
  if (v8)
  {
    uint64_t v9 = sqlite3_errmsg(*v5);
    sub_24A6E52D8(&qword_2697B1A90);
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_24A6F4120;
    if (v9)
    {
      unint64_t v18 = 0;
      unint64_t v19 = 0xE000000000000000;
      sub_24A6F33E0();
      sub_24A6F3260();
LABEL_27:
      sub_24A6F3260();
      sub_24A6F3260();
      sub_24A6F3270();
      sub_24A6F3260();
      swift_bridgeObjectRelease();
      goto LABEL_31;
    }
    unint64_t v18 = 0;
    unint64_t v19 = 0xE000000000000000;
    sub_24A6F33E0();
    sub_24A6F3260();
LABEL_29:
    sub_24A6F3260();
    goto LABEL_30;
  }
  if (sqlite3_step(pStmt) != 101)
  {
    uint64_t v15 = sqlite3_errmsg(*v5);
    sub_24A6E52D8(&qword_2697B1A90);
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_24A6F4120;
    if (v15)
    {
      sub_24A6F33E0();
      swift_bridgeObjectRelease();
      unint64_t v18 = 0xD000000000000015;
      unint64_t v19 = 0x800000024A6F4B50;
      goto LABEL_27;
    }
    sub_24A6F33E0();
    swift_bridgeObjectRelease();
    unint64_t v18 = 0xD000000000000015;
    unint64_t v19 = 0x800000024A6F4B50;
    goto LABEL_29;
  }
  sub_24A6E52D8(&qword_2697B1A90);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_24A6F4120;
  sub_24A6F33E0();
  swift_bridgeObjectRelease();
  unint64_t v18 = 0xD00000000000001ALL;
  unint64_t v19 = 0x800000024A6F4B70;
  sub_24A6F3260();
LABEL_30:
  sub_24A6F3260();
LABEL_31:
  *(void *)(v10 + 56) = MEMORY[0x263F8D310];
  *(void *)(v10 + 32) = v18;
  *(void *)(v10 + 40) = v19;
  sub_24A6F3590();
  swift_bridgeObjectRelease();
  uint64_t v16 = pStmt;
  return sqlite3_finalize(v16);
}

uint64_t sub_24A6EE650(char a1, double a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = v8;
  uint64_t v51 = a7;
  uint64_t v52 = a6;
  ppStmt[4] = *(sqlite3_stmt **)MEMORY[0x263EF8340];
  uint64_t v13 = sub_24A6F3150();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = (sqlite3 **)(v9 + 16);
  swift_beginAccess();
  if (*(void *)(v9 + 16))
  {
    uint64_t v50 = a8;
    _s23ConditionalEngineClient0A5EventV2id10Foundation4UUIDVvg_0();
    uint64_t v18 = sub_24A6F3120();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    ppStmt[0] = 0;
    if (sqlite3_prepare_v2(*v17, "INSERT INTO InferenceRun (UUID, Result, Confidence, Response, PromptTemplate, GroupName) VALUES (?, ?, ?, ?, ?, ?);",
           -1,
           ppStmt,
           0))
    {
      unint64_t v19 = sqlite3_errmsg(*v17);
      sub_24A6E52D8(&qword_2697B1A90);
      uint64_t v20 = swift_allocObject();
      uint64_t v21 = v20;
      *(_OWORD *)(v20 + 16) = xmmword_24A6F4120;
      if (v19)
      {
        unint64_t v53 = 0;
        unint64_t v54 = 0xE000000000000000;
        sub_24A6F33E0();
        swift_bridgeObjectRelease();
        unint64_t v22 = 0xD00000000000002FLL;
        uint64_t v23 = "INSERT statement could not be prepared. Error: ";
LABEL_14:
        unint64_t v53 = v22;
        unint64_t v54 = (unint64_t)(v23 - 32) | 0x8000000000000000;
        sub_24A6F3270();
        sub_24A6F3260();
        swift_bridgeObjectRelease();
        unint64_t v46 = v53;
        unint64_t v45 = v54;
        *(void *)(v21 + 56) = MEMORY[0x263F8D310];
        *(void *)(v21 + 32) = v46;
LABEL_17:
        *(void *)(v21 + 40) = v45;
        sub_24A6F3590();
        swift_bridgeObjectRelease();
        sqlite3_finalize(ppStmt[0]);
        return v18;
      }
      *(void *)(v20 + 56) = MEMORY[0x263F8D310];
      *(void *)(v20 + 32) = 0xD000000000000036;
      os_log_type_t v41 = "INSERT statement could not be prepared. Unknown error.";
    }
    else
    {
      uint64_t v25 = ppStmt[0];
      uint64_t v49 = v18;
      unint64_t v26 = (void *)sub_24A6F31E0();
      os_log_type_t v27 = (const char *)objc_msgSend(v26, sel_UTF8String);
      id v28 = v26;
      sqlite3_bind_text(v25, 1, v27, -1, 0);
      uint64_t v29 = ppStmt[0];
      sqlite3_bind_int(ppStmt[0], 2, a1 & 1);
      sqlite3_bind_double(v29, 3, a2);
      id v30 = (void *)sub_24A6F31E0();
      uint64_t v31 = (const char *)objc_msgSend(v30, sel_UTF8String);
      id v32 = v30;
      sqlite3_bind_text(v29, 4, v31, -1, 0);
      uint64_t v33 = ppStmt[0];
      os_log_type_t v34 = (void *)sub_24A6F31E0();
      char v35 = (const char *)objc_msgSend(v34, sel_UTF8String);
      id v36 = v34;
      sqlite3_bind_text(v33, 5, v35, -1, 0);
      if (v50)
      {
        unint64_t v37 = ppStmt[0];
        uint64_t v38 = (void *)sub_24A6F31E0();
        uint64_t v39 = (const char *)objc_msgSend(v38, sel_UTF8String);
        id v40 = v38;
        sqlite3_bind_text(v37, 6, v39, -1, 0);
      }
      else
      {
        sqlite3_bind_null(ppStmt[0], 6);
      }
      int v42 = sqlite3_step(ppStmt[0]);
      uint64_t v18 = v49;
      if (v42 == 101)
      {
        sub_24A6E52D8(&qword_2697B1A90);
        uint64_t v21 = swift_allocObject();
        *(_OWORD *)(v21 + 16) = xmmword_24A6F4120;
        *(void *)(v21 + 56) = MEMORY[0x263F8D310];
        *(void *)(v21 + 32) = 0xD00000000000001ALL;
        os_log_type_t v41 = "Successfully inserted row.";
      }
      else
      {
        uint64_t v43 = sqlite3_errmsg(*v17);
        sub_24A6E52D8(&qword_2697B1A90);
        uint64_t v44 = swift_allocObject();
        uint64_t v21 = v44;
        *(_OWORD *)(v44 + 16) = xmmword_24A6F4120;
        if (v43)
        {
          unint64_t v53 = 0;
          unint64_t v54 = 0xE000000000000000;
          sub_24A6F33E0();
          swift_bridgeObjectRelease();
          unint64_t v22 = 0xD00000000000001DLL;
          uint64_t v23 = "Could not insert row. Error: ";
          goto LABEL_14;
        }
        *(void *)(v44 + 56) = MEMORY[0x263F8D310];
        *(void *)(v44 + 32) = 0xD000000000000024;
        os_log_type_t v41 = "Could not insert row. Unknown error.";
      }
    }
    unint64_t v45 = (unint64_t)(v41 - 32) | 0x8000000000000000;
    goto LABEL_17;
  }
  sub_24A6E52D8(&qword_2697B1A90);
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_24A6F4120;
  *(void *)(v24 + 56) = MEMORY[0x263F8D310];
  *(void *)(v24 + 32) = 0xD000000000000014;
  *(void *)(v24 + 40) = 0x800000024A6F47A0;
  sub_24A6F3590();
  swift_bridgeObjectRelease();
  return 0;
}

void *sub_24A6EEB80()
{
  ppStmt[4] = *(sqlite3_stmt **)MEMORY[0x263EF8340];
  swift_beginAccess();
  uint64_t v1 = *(sqlite3 **)(v0 + 16);
  if (v1)
  {
    ppStmt[0] = 0;
    if (sqlite3_prepare_v2(v1, "SELECT UUID, Result, Confidence, Response, PromptTemplate, GroupName, Timestamp FROM InferenceRun;",
           -1,
           ppStmt,
           0))
    {
      uint64_t v2 = sqlite3_errmsg(*(sqlite3 **)(v0 + 16));
      sub_24A6E52D8(&qword_2697B1A90);
      uint64_t v3 = swift_allocObject();
      *(_OWORD *)(v3 + 16) = xmmword_24A6F4120;
      if (v2)
      {
        sub_24A6F33E0();
        swift_bridgeObjectRelease();
        sub_24A6F3270();
        sub_24A6F3260();
        swift_bridgeObjectRelease();
        unint64_t v4 = 0xD00000000000002FLL;
        unint64_t v5 = 0x800000024A6F49E0;
      }
      else
      {
        unint64_t v4 = 0xD000000000000036;
        unint64_t v5 = 0x800000024A6F49A0;
      }
      *(void *)(v3 + 56) = MEMORY[0x263F8D310];
      *(void *)(v3 + 32) = v4;
      *(void *)(v3 + 40) = v5;
      sub_24A6F3590();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v8 = ppStmt[0];
      if (sqlite3_step(ppStmt[0]) == 100)
      {
        uint64_t v7 = (void *)MEMORY[0x263F8EE78];
        while (sqlite3_column_text(v8, 0))
        {
          uint64_t v9 = sub_24A6F3280();
          uint64_t v11 = v10;
          int v12 = sqlite3_column_int(v8, 1);
          double v13 = sqlite3_column_double(v8, 2);
          if (!sqlite3_column_text(v8, 3)) {
            goto LABEL_28;
          }
          uint64_t v14 = sub_24A6F3280();
          uint64_t v16 = v15;
          if (!sqlite3_column_text(v8, 4)) {
            goto LABEL_29;
          }
          uint64_t v17 = sub_24A6F3280();
          uint64_t v19 = v18;
          if (sqlite3_column_text(v8, 5))
          {
            if (!sqlite3_column_text(v8, 5)) {
              goto LABEL_31;
            }
            uint64_t v20 = sub_24A6F3280();
            uint64_t v32 = v21;
          }
          else
          {
            uint64_t v20 = 0;
            uint64_t v32 = 0;
          }
          if (!sqlite3_column_text(v8, 6)) {
            goto LABEL_30;
          }
          uint64_t v31 = v9;
          uint64_t v22 = sub_24A6F3280();
          uint64_t v29 = v23;
          uint64_t v30 = v22;
          uint64_t v24 = v19;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v7 = sub_24A6EF16C(0, v7[2] + 1, 1, v7);
          }
          unint64_t v26 = v7[2];
          unint64_t v25 = v7[3];
          if (v26 >= v25 >> 1) {
            uint64_t v7 = sub_24A6EF16C((void *)(v25 > 1), v26 + 1, 1, v7);
          }
          v7[2] = v26 + 1;
          os_log_type_t v27 = &v7[12 * v26];
          v27[4] = v31;
          v27[5] = v11;
          *((unsigned char *)v27 + 48) = v12 == 1;
          *((double *)v27 + 7) = v13;
          v27[8] = v14;
          v27[9] = v16;
          v27[10] = v17;
          v27[11] = v24;
          v27[12] = v20;
          v27[13] = v32;
          v27[14] = v30;
          v27[15] = v29;
          if (sqlite3_step(v8) != 100) {
            goto LABEL_25;
          }
        }
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
LABEL_30:
        __break(1u);
LABEL_31:
        __break(1u);
      }
    }
    uint64_t v7 = (void *)MEMORY[0x263F8EE78];
LABEL_25:
    sqlite3_finalize(ppStmt[0]);
  }
  else
  {
    sub_24A6E52D8(&qword_2697B1A90);
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_24A6F4120;
    *(void *)(v6 + 56) = MEMORY[0x263F8D310];
    *(void *)(v6 + 32) = 0xD000000000000014;
    *(void *)(v6 + 40) = 0x800000024A6F47A0;
    sub_24A6F3590();
    swift_bridgeObjectRelease();
    return (void *)MEMORY[0x263F8EE78];
  }
  return v7;
}

uint64_t InferenceRunStore.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC23ConditionalEngineClient17InferenceRunStore_fileManager;
  uint64_t v2 = sub_24A6F3170();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t InferenceRunStore.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC23ConditionalEngineClient17InferenceRunStore_fileManager;
  uint64_t v2 = sub_24A6F3170();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

void *sub_24A6EF05C(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
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
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_24A6E52D8(&qword_2697B1AD8);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 + 31;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 6);
      double v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      double v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[8 * v8 + 4]) {
          memmove(v13, a4 + 4, v8 << 6);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_24A6EF4F4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_24A6EF16C(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
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
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_24A6E52D8(&qword_2697B1AD0);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 96);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[12 * v8 + 4]) {
          memmove(v12, a4 + 4, 96 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_24A6EF5E8(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_24A6EF294@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t result = swift_beginAccess();
  *a2 = *(void *)(v3 + 16);
  return result;
}

uint64_t sub_24A6EF2DC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t result = swift_beginAccess();
  *(void *)(v3 + 16) = v2;
  return result;
}

uint64_t sub_24A6EF320()
{
  return type metadata accessor for InferenceRunStore();
}

uint64_t type metadata accessor for InferenceRunStore()
{
  uint64_t result = qword_2697B1AC0;
  if (!qword_2697B1AC0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24A6EF374()
{
  uint64_t result = sub_24A6F3170();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for InferenceRunStore(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for InferenceRunStore);
}

uint64_t dispatch thunk of InferenceRunStore.db.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of InferenceRunStore.db.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of InferenceRunStore.db.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of InferenceRunStore.__allocating_init(fileManager:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of InferenceRunStore.insert(result:confidence:response:promptTemplate:group:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of InferenceRunStore.fetchAllInferenceRuns()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t sub_24A6EF4F4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + (a1 << 6) + 32;
    unint64_t v6 = a3 + (v4 << 6);
    if (v5 >= v6 || v5 + (v4 << 6) <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_24A6F3460();
  __break(1u);
  return result;
}

uint64_t sub_24A6EF5E8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 96 * a1 + 32;
    unint64_t v6 = a3 + 96 * v4;
    if (v5 >= v6 || v5 + 96 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_24A6F3460();
  __break(1u);
  return result;
}

unint64_t static InferenceURLs.OpenAI.apiURL.getter()
{
  return 0xD00000000000002ALL;
}

ValueMetadata *type metadata accessor for InferenceURLs()
{
  return &type metadata for InferenceURLs;
}

ValueMetadata *type metadata accessor for InferenceURLs.OpenAI()
{
  return &type metadata for InferenceURLs.OpenAI;
}

uint64_t sub_24A6EF71C(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x6369746E616D6553;
  }
  else {
    uint64_t v3 = 4804432;
  }
  if (v2) {
    unint64_t v4 = 0xE300000000000000;
  }
  else {
    unint64_t v4 = 0xE800000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x6369746E616D6553;
  }
  else {
    uint64_t v5 = 4804432;
  }
  if (a2) {
    unint64_t v6 = 0xE800000000000000;
  }
  else {
    unint64_t v6 = 0xE300000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_24A6F3520();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_24A6EF7B8(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x676E697661654CLL;
  }
  else {
    uint64_t v3 = 0x676E697669727241;
  }
  if (v2) {
    unint64_t v4 = 0xE800000000000000;
  }
  else {
    unint64_t v4 = 0xE700000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x676E697661654CLL;
  }
  else {
    uint64_t v5 = 0x676E697669727241;
  }
  if (a2) {
    unint64_t v6 = 0xE700000000000000;
  }
  else {
    unint64_t v6 = 0xE800000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_24A6F3520();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_24A6EF85C(char a1, char a2)
{
  if (*(void *)&aUserPrUserDaCu_0[8 * a1] == *(void *)&aUserPrUserDaCu_0[8 * a2]
    && *(void *)&aUserPrUserDaCu_0[8 * a1 + 24] == *(void *)&aUserPrUserDaCu_0[8 * a2 + 24])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_24A6F3520();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_24A6EF8E4()
{
  return sub_24A6F35E0();
}

uint64_t sub_24A6EF960()
{
  return sub_24A6F35E0();
}

uint64_t sub_24A6EF9E4()
{
  return sub_24A6F35E0();
}

uint64_t sub_24A6EFA50()
{
  return sub_24A6F35E0();
}

uint64_t sub_24A6EFAB8()
{
  return sub_24A6F35E0();
}

uint64_t sub_24A6EFB38()
{
  return sub_24A6F35E0();
}

uint64_t OpenAIClient.apiKey.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t OpenAIClient.model.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

double OpenAIClient.temperature.getter()
{
  return *(double *)(v0 + 32);
}

uint64_t OpenAIClient.maxTokens.getter()
{
  return *(void *)(v0 + 40);
}

uint64_t OpenAIClient.apiURL.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

id OpenAIClient.session.getter()
{
  return *(id *)(v0 + 64);
}

uint64_t OpenAIClient.inferenceRunStore.getter()
{
  return swift_retain();
}

uint64_t OpenAIClient.systemPrompt.getter()
{
  uint64_t v1 = *(void *)(v0 + 80);
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t static OpenAIClient.defaultSystemPrompt.getter()
{
  return 0xD00000000000005FLL;
}

uint64_t OpenAIClient.init(systemPrompt:apiKey:model:temperature:maxTokens:apiURL:session:inferenceRunStore:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, double a10@<D0>, long long a11, uint64_t a12)
{
  *(void *)a9 = a3;
  *(void *)(a9 + 8) = a4;
  *(void *)(a9 + 16) = a5;
  *(void *)(a9 + 24) = a6;
  *(double *)(a9 + 32) = a10;
  *(void *)(a9 + 40) = a7;
  *(void *)(a9 + 48) = a8;
  *(_OWORD *)(a9 + 56) = a11;
  *(void *)(a9 + 72) = a12;
  *(void *)(a9 + 80) = result;
  *(void *)(a9 + 88) = a2;
  return result;
}

uint64_t OpenAIClient.buildFullPrompt(injecting:into:)(uint64_t a1)
{
  return sub_24A6EFCF0(a1, 0x10000000000004F0);
}

uint64_t sub_24A6EFCF0(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = a1 + 64;
  uint64_t v3 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  uint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v6 = (unint64_t)(v3 + 63) >> 6;
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      v5 &= v5 - 1;
      goto LABEL_5;
    }
    int64_t v9 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_23;
    }
    if (v9 >= v6) {
      goto LABEL_21;
    }
    uint64_t v10 = *(void *)(v12 + 8 * v9);
    ++v8;
    if (!v10)
    {
      int64_t v8 = v9 + 1;
      if (v9 + 1 >= v6) {
        goto LABEL_21;
      }
      uint64_t v10 = *(void *)(v12 + 8 * v8);
      if (!v10)
      {
        int64_t v8 = v9 + 2;
        if (v9 + 2 >= v6) {
          goto LABEL_21;
        }
        uint64_t v10 = *(void *)(v12 + 8 * v8);
        if (!v10) {
          break;
        }
      }
    }
LABEL_20:
    uint64_t v5 = (v10 - 1) & v10;
LABEL_5:
    sub_24A6E9128();
    swift_bridgeObjectRetain();
    a2 = sub_24A6F33A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v11 = v9 + 3;
  if (v11 >= v6)
  {
LABEL_21:
    swift_release();
    return a2;
  }
  uint64_t v10 = *(void *)(v12 + 8 * v11);
  if (v10)
  {
    int64_t v8 = v11;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v8 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      break;
    }
    if (v8 >= v6) {
      goto LABEL_21;
    }
    uint64_t v10 = *(void *)(v12 + 8 * v8);
    ++v11;
    if (v10) {
      goto LABEL_20;
    }
  }
LABEL_23:
  __break(1u);
  return result;
}

uint64_t OpenAIClient.sendPrompt(injecting:into:group:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v5 + 760) = a4;
  *(void *)(v5 + 752) = a3;
  *(void *)(v5 + 744) = a1;
  uint64_t v6 = sub_24A6F3220();
  *(void *)(v5 + 768) = v6;
  *(void *)(v5 + 776) = *(void *)(v6 - 8);
  *(void *)(v5 + 784) = swift_task_alloc();
  uint64_t v7 = sub_24A6F31B0();
  *(void *)(v5 + 792) = v7;
  *(void *)(v5 + 800) = *(void *)(v7 - 8);
  *(void *)(v5 + 808) = swift_task_alloc();
  uint64_t v8 = sub_24A6F2F70();
  *(void *)(v5 + 816) = v8;
  *(void *)(v5 + 824) = *(void *)(v8 - 8);
  *(void *)(v5 + 832) = swift_task_alloc();
  sub_24A6E52D8(&qword_2697B1AE8);
  *(void *)(v5 + 840) = swift_task_alloc();
  uint64_t v9 = sub_24A6F3060();
  *(void *)(v5 + 848) = v9;
  *(void *)(v5 + 856) = *(void *)(v9 - 8);
  *(void *)(v5 + 864) = swift_task_alloc();
  *(void *)(v5 + 872) = swift_task_alloc();
  *(void *)(v5 + 880) = *(void *)v4;
  *(_OWORD *)(v5 + 888) = *(_OWORD *)(v4 + 8);
  *(void *)(v5 + 904) = *(void *)(v4 + 24);
  *(void *)(v5 + 912) = *(void *)(v4 + 32);
  *(void *)(v5 + 920) = *(void *)(v4 + 40);
  *(void *)(v5 + 928) = *(void *)(v4 + 64);
  *(_OWORD *)(v5 + 936) = *(_OWORD *)(v4 + 72);
  *(void *)(v5 + 952) = *(void *)(v4 + 88);
  return MEMORY[0x270FA2498](sub_24A6F01A0, 0, 0);
}

uint64_t sub_24A6F01A0()
{
  uint64_t v56 = v0;
  v55[2] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(v0 + 856);
  uint64_t v2 = *(void *)(v0 + 848);
  uint64_t v3 = *(void *)(v0 + 840);
  uint64_t v4 = sub_24A6EFCF0(*(void *)(v0 + 744), 0x10000000000004F0);
  uint64_t v6 = v5;
  *(void *)(v0 + 960) = v4;
  *(void *)(v0 + 968) = v5;
  sub_24A6F3050();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48))(v3, 1, v2) == 1)
  {
    uint64_t v7 = *(void *)(v0 + 840);
    swift_bridgeObjectRelease();
    sub_24A6E6A9C(v7, &qword_2697B1AE8);
    sub_24A6F17AC();
    swift_allocError();
    *uint64_t v8 = 0;
    swift_willThrow();
LABEL_11:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v47 = *(uint64_t (**)(void))(v0 + 8);
    return v47();
  }
  uint64_t v50 = *(void *)(v0 + 952);
  uint64_t v49 = *(void *)(v0 + 944);
  uint64_t v9 = *(void *)(v0 + 912);
  uint64_t v10 = *(void *)(v0 + 904);
  uint64_t v53 = *(void *)(v0 + 896);
  uint64_t v11 = *(void *)(v0 + 872);
  uint64_t v12 = *(void *)(v0 + 864);
  uint64_t v13 = *(void *)(v0 + 856);
  uint64_t v14 = *(void *)(v0 + 848);
  uint64_t v51 = *(void *)(v0 + 920);
  (*(void (**)(uint64_t, void, uint64_t))(v13 + 32))(v11, *(void *)(v0 + 840), v14);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v12, v11, v14);
  sub_24A6F2F40();
  sub_24A6F2F30();
  sub_24A6F2F60();
  v55[0] = 0x20726572616542;
  v55[1] = 0xE700000000000000;
  swift_bridgeObjectRetain();
  sub_24A6F3260();
  swift_bridgeObjectRelease();
  sub_24A6F2F60();
  swift_bridgeObjectRelease();
  sub_24A6E52D8(&qword_2697B1AF8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24A6F4310;
  *(void *)(inited + 32) = 0x6C65646F6DLL;
  *(void *)(inited + 40) = 0xE500000000000000;
  uint64_t v16 = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = v53;
  *(void *)(inited + 56) = v10;
  *(void *)(inited + 72) = v16;
  *(void *)(inited + 80) = 0x736567617373656DLL;
  *(void *)(inited + 88) = 0xE800000000000000;
  sub_24A6E52D8(&qword_2697B1B00);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_24A6F3C10;
  sub_24A6E52D8(&qword_2697B1B08);
  uint64_t v18 = swift_initStackObject();
  *(_OWORD *)(v18 + 16) = xmmword_24A6F3C10;
  *(void *)(v18 + 32) = 1701605234;
  *(void *)(v18 + 40) = 0xE400000000000000;
  *(void *)(v18 + 48) = 0x6D6574737973;
  *(void *)(v18 + 56) = 0xE600000000000000;
  *(void *)(v18 + 64) = 0x746E65746E6F63;
  *(void *)(v18 + 72) = 0xE700000000000000;
  *(void *)(v18 + 80) = v49;
  *(void *)(v18 + 88) = v50;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  *(void *)(v17 + 32) = sub_24A6E9A88(v18);
  uint64_t v19 = swift_initStackObject();
  *(_OWORD *)(v19 + 16) = xmmword_24A6F3C10;
  *(void *)(v19 + 32) = 1701605234;
  *(void *)(v19 + 40) = 0xE400000000000000;
  *(void *)(v19 + 48) = 1919251317;
  *(void *)(v19 + 56) = 0xE400000000000000;
  *(void *)(v19 + 64) = 0x746E65746E6F63;
  *(void *)(v19 + 72) = 0xE700000000000000;
  *(void *)(v19 + 80) = v4;
  *(void *)(v19 + 88) = v6;
  swift_bridgeObjectRetain();
  *(void *)(v17 + 40) = sub_24A6E9A88(v19);
  uint64_t v20 = sub_24A6E52D8(&qword_2697B1B10);
  *(void *)(inited + 96) = v17;
  *(void *)(inited + 120) = v20;
  *(void *)(inited + 128) = 0x656B6F745F78616DLL;
  uint64_t v21 = MEMORY[0x263F8D6C8];
  *(void *)(inited + 136) = 0xEA0000000000736ELL;
  *(void *)(inited + 144) = v51;
  *(void *)(inited + 168) = v21;
  *(void *)(inited + 176) = 0x74617265706D6574;
  *(void *)(inited + 184) = 0xEB00000000657275;
  *(void *)(inited + 216) = MEMORY[0x263F8D538];
  *(void *)(inited + 192) = v9;
  sub_24A6E9BAC(inited);
  sub_24A6F3190();
  swift_bridgeObjectRetain_n();
  uint64_t v22 = sub_24A6F31A0();
  os_log_type_t v23 = sub_24A6F3300();
  BOOL v24 = os_log_type_enabled(v22, v23);
  uint64_t v25 = *(void *)(v0 + 808);
  uint64_t v26 = *(void *)(v0 + 800);
  uint64_t v27 = *(void *)(v0 + 792);
  if (v24)
  {
    uint64_t v54 = *(void *)(v0 + 808);
    uint64_t v52 = *(void *)(v0 + 792);
    id v28 = (uint8_t *)swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    v55[0] = v29;
    *(_DWORD *)id v28 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v30 = sub_24A6F31D0();
    unint64_t v32 = v31;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 720) = sub_24A6F1D40(v30, v32, v55);
    uint64_t v33 = v0 + 728;
    sub_24A6F3370();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24A6E2000, v22, v23, "Body: %s", v28, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5CCF30](v29, -1, -1);
    MEMORY[0x24C5CCF30](v28, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v54, v52);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v25, v27);
    uint64_t v33 = v0 + 728;
  }
  os_log_type_t v34 = self;
  *(void *)(v0 + 976) = v34;
  char v35 = (void *)sub_24A6F31C0();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 728) = 0;
  id v36 = objc_msgSend(v34, sel_dataWithJSONObject_options_error_, v35, 0, v33);

  id v37 = *(id *)(v0 + 728);
  if (!v36)
  {
    id v40 = v37;
    uint64_t v41 = *(void *)(v0 + 872);
    uint64_t v42 = *(void *)(v0 + 856);
    uint64_t v43 = *(void *)(v0 + 848);
    uint64_t v44 = *(void *)(v0 + 832);
    uint64_t v45 = *(void *)(v0 + 824);
    uint64_t v46 = *(void *)(v0 + 816);
    swift_bridgeObjectRelease();
    sub_24A6F3020();

    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v44, v46);
    (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v41, v43);
    goto LABEL_11;
  }
  sub_24A6F3090();

  sub_24A6F2F50();
  uint64_t v38 = (void *)swift_task_alloc();
  *(void *)(v0 + 984) = v38;
  *uint64_t v38 = v0;
  v38[1] = sub_24A6F0A20;
  uint64_t v39 = *(void *)(v0 + 832);
  return MEMORY[0x270EF1EB0](v39, 0);
}

uint64_t sub_24A6F0A20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)*v4;
  v5[124] = a1;
  v5[125] = a2;
  v5[126] = a3;
  v5[127] = v3;
  swift_task_dealloc();
  if (v3)
  {
    swift_bridgeObjectRelease();
    uint64_t v6 = sub_24A6F1688;
  }
  else
  {
    uint64_t v6 = sub_24A6F0B7C;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_24A6F0B7C()
{
  self;
  uint64_t v1 = swift_dynamicCastObjCClass();
  if (!v1) {
    goto LABEL_9;
  }
  uint64_t v2 = (void *)v1;
  id v3 = *(id *)(v0 + 1008);
  if (objc_msgSend(v2, sel_statusCode) != (id)200)
  {

LABEL_9:
    uint64_t v13 = *(void **)(v0 + 1008);
    unint64_t v14 = *(void *)(v0 + 1000);
    uint64_t v15 = *(void *)(v0 + 992);
    uint64_t v88 = *(void *)(v0 + 872);
    uint64_t v16 = *(void *)(v0 + 856);
    uint64_t v17 = *(void *)(v0 + 848);
    uint64_t v18 = *(void *)(v0 + 832);
    uint64_t v19 = *(void *)(v0 + 824);
    uint64_t v20 = *(void *)(v0 + 816);
    swift_bridgeObjectRelease();
    sub_24A6F17AC();
    swift_allocError();
    *uint64_t v21 = 2;
    swift_willThrow();
    sub_24A6E6998(v15, v14);

    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v88, v17);
    goto LABEL_33;
  }
  uint64_t v4 = *(void **)(v0 + 976);
  uint64_t v5 = (void *)sub_24A6F3080();
  *(void *)(v0 + 712) = 0;
  id v6 = objc_msgSend(v4, sel_JSONObjectWithData_options_error_, v5, 0, v0 + 712);

  uint64_t v7 = *(void **)(v0 + 712);
  if (v6)
  {
    id v8 = v7;
    sub_24A6F33B0();
    swift_unknownObjectRelease();
    sub_24A6E52D8(&qword_2697B1B18);
    if (swift_dynamicCast())
    {
      uint64_t v9 = (_OWORD *)(v0 + 560);
      uint64_t v10 = *(void *)(v0 + 696);
      if (*(void *)(v10 + 16) && (unint64_t v11 = sub_24A6EA268(0x736563696F6863, 0xE700000000000000), (v12 & 1) != 0))
      {
        sub_24A6EB164(*(void *)(v10 + 56) + 32 * v11, v0 + 560);
      }
      else
      {
        *uint64_t v9 = 0u;
        *(_OWORD *)(v0 + 576) = 0u;
      }
      swift_bridgeObjectRelease();
      if (!*(void *)(v0 + 584)) {
        goto LABEL_25;
      }
      uint64_t v29 = v0 + 680;
      sub_24A6E52D8(&qword_2697B1B28);
      if (swift_dynamicCast())
      {
        uint64_t v9 = (_OWORD *)(v0 + 592);
        if (!*(void *)(*(void *)v29 + 16))
        {
          swift_bridgeObjectRelease();
          *uint64_t v9 = 0u;
          *(_OWORD *)(v0 + 608) = 0u;
          goto LABEL_25;
        }
        uint64_t v30 = *(void *)(*(void *)v29 + 32);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        if (*(void *)(v30 + 16) && (unint64_t v31 = sub_24A6EA268(0x6567617373656DLL, 0xE700000000000000), (v32 & 1) != 0))
        {
          sub_24A6EB164(*(void *)(v30 + 56) + 32 * v31, v0 + 592);
        }
        else
        {
          *uint64_t v9 = 0u;
          *(_OWORD *)(v0 + 608) = 0u;
        }
        swift_bridgeObjectRelease();
        if (!*(void *)(v0 + 616)) {
          goto LABEL_25;
        }
        if (swift_dynamicCast())
        {
          uint64_t v9 = (_OWORD *)(v0 + 624);
          uint64_t v33 = *(void *)(v0 + 672);
          if (*(void *)(v33 + 16) && (unint64_t v34 = sub_24A6EA268(0x746E65746E6F63, 0xE700000000000000), (v35 & 1) != 0))
          {
            sub_24A6EB164(*(void *)(v33 + 56) + 32 * v34, v0 + 624);
          }
          else
          {
            *uint64_t v9 = 0u;
            *(_OWORD *)(v0 + 640) = 0u;
          }
          swift_bridgeObjectRelease();
          if (*(void *)(v0 + 648))
          {
            if (swift_dynamicCast())
            {
              uint64_t v36 = *(void *)(v0 + 784);
              uint64_t v37 = *(void *)(v0 + 776);
              uint64_t v38 = *(void *)(v0 + 768);
              uint64_t v39 = *(void *)(v0 + 656);
              uint64_t v40 = *(void *)(v0 + 664);
              sub_24A6F3210();
              uint64_t v92 = v40;
              uint64_t v41 = sub_24A6F3200();
              unint64_t v43 = v42;
              (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v36, v38);
              if (v43 >> 60 == 15)
              {
LABEL_30:
                swift_bridgeObjectRelease();
LABEL_56:
                os_log_type_t v71 = *(void **)(v0 + 1008);
                unint64_t v72 = *(void *)(v0 + 1000);
                uint64_t v73 = *(void *)(v0 + 992);
                sub_24A6E52D8(&qword_2697B1A90);
                uint64_t v74 = swift_allocObject();
                *(_OWORD *)(v74 + 16) = xmmword_24A6F4120;
                *(void *)(v74 + 56) = MEMORY[0x263F8D310];
                *(void *)(v74 + 32) = 0xD000000000000036;
                *(void *)(v74 + 40) = 0x800000024A6F5460;
                sub_24A6F3590();
                sub_24A6E6998(v73, v72);

                swift_bridgeObjectRelease();
LABEL_57:
                uint64_t v75 = *(void *)(v0 + 872);
                uint64_t v76 = *(void *)(v0 + 856);
                uint64_t v77 = *(void *)(v0 + 848);
                (*(void (**)(void, void))(*(void *)(v0 + 824) + 8))(*(void *)(v0 + 832), *(void *)(v0 + 816));
                (*(void (**)(uint64_t, uint64_t))(v76 + 8))(v75, v77);
                swift_task_dealloc();
                swift_task_dealloc();
                swift_task_dealloc();
                swift_task_dealloc();
                swift_task_dealloc();
                swift_task_dealloc();
                v78 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
                return v78(v39, v92);
              }
              uint64_t v91 = v39;
              os_log_type_t v55 = *(void **)(v0 + 976);
              uint64_t v56 = (void *)sub_24A6F3080();
              *(void *)(v0 + 688) = 0;
              id v57 = objc_msgSend(v55, sel_JSONObjectWithData_options_error_, v56, 0, v0 + 688);

              uint64_t v58 = *(void **)(v0 + 688);
              if (!v57)
              {
                id v66 = v58;
                swift_bridgeObjectRelease();
                uint64_t v67 = (void *)sub_24A6F3020();

                swift_willThrow();
                sub_24A6F2398(v41, v43);

LABEL_55:
                uint64_t v39 = v91;
                goto LABEL_56;
              }
              id v59 = v58;
              sub_24A6F33B0();
              swift_unknownObjectRelease();
              if (swift_dynamicCast())
              {
                uint64_t v60 = *(void *)(v0 + 704);
                uint64_t v39 = v91;
                if (!*(void *)(v60 + 16)
                  || (unint64_t v61 = sub_24A6EA268(0x65736E6F70736572, 0xE800000000000000), (v62 & 1) == 0))
                {
                  sub_24A6F2398(v41, v43);
                  swift_bridgeObjectRelease();
                  goto LABEL_30;
                }
                sub_24A6EB164(*(void *)(v60 + 56) + 32 * v61, v0 + 464);
                if ((swift_dynamicCast() & 1) == 0)
                {
                  sub_24A6F2398(v41, v43);
                  swift_bridgeObjectRelease();
LABEL_54:
                  swift_bridgeObjectRelease();
                  goto LABEL_55;
                }
                char v63 = *(unsigned char *)(v0 + 1024);
                if (*(void *)(v60 + 16)
                  && (unint64_t v64 = sub_24A6EA268(0x6E656469666E6F63, 0xEA00000000006563), (v65 & 1) != 0))
                {
                  sub_24A6EB164(*(void *)(v60 + 56) + 32 * v64, v0 + 432);
                }
                else
                {
                  *(_OWORD *)(v0 + 432) = 0u;
                  *(_OWORD *)(v0 + 448) = 0u;
                }
                swift_bridgeObjectRelease();
                if (!*(void *)(v0 + 456))
                {
                  sub_24A6F2398(v41, v43);
                  swift_bridgeObjectRelease();
                  sub_24A6E6A9C(v0 + 432, &qword_2697B1B20);
                  goto LABEL_55;
                }
                if (swift_dynamicCast())
                {
                  if (*(void *)(v0 + 936))
                  {
                    double v68 = *(double *)(v0 + 736);
                    if (*(void *)(v0 + 760))
                    {
                      uint64_t v69 = *(void *)(v0 + 752);
                      uint64_t v70 = *(void *)(v0 + 760);
                    }
                    else
                    {
                      sub_24A6E45A8();
                      uint64_t v69 = sub_24A6F3340();
                      uint64_t v70 = v79;
                    }
                    uint64_t v80 = *(void *)(v0 + 968);
                    uint64_t v81 = *(void *)(v0 + 960);
                    swift_bridgeObjectRetain();
                    sub_24A6EE650(v63, v68, v91, v92, v81, v80, v69, v70);
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                  }
                  else
                  {
                    swift_bridgeObjectRelease();
                  }
                  uint64_t v82 = *(void **)(v0 + 1008);
                  unint64_t v83 = *(void *)(v0 + 1000);
                  uint64_t v84 = *(void *)(v0 + 992);
                  sub_24A6E52D8(&qword_2697B1A90);
                  uint64_t v85 = swift_allocObject();
                  *(_OWORD *)(v85 + 16) = xmmword_24A6F4120;
                  sub_24A6F3260();
                  swift_bridgeObjectRelease();
                  *(void *)(v85 + 56) = MEMORY[0x263F8D310];
                  *(void *)(v85 + 32) = 0x203A4449206E7552;
                  *(void *)(v85 + 40) = 0xE800000000000000;
                  sub_24A6F3590();
                  sub_24A6F2398(v41, v43);
                  sub_24A6E6998(v84, v83);
                  swift_bridgeObjectRelease();

                  uint64_t v39 = v91;
                  goto LABEL_57;
                }
              }
              sub_24A6F2398(v41, v43);
              goto LABEL_54;
            }
            goto LABEL_31;
          }
LABEL_25:
          swift_bridgeObjectRelease();
          sub_24A6E6A9C((uint64_t)v9, &qword_2697B1B20);
LABEL_32:
          uint64_t v44 = *(void **)(v0 + 1008);
          unint64_t v45 = *(void *)(v0 + 1000);
          uint64_t v46 = *(void *)(v0 + 992);
          uint64_t v47 = *(void *)(v0 + 872);
          uint64_t v48 = *(void *)(v0 + 856);
          uint64_t v90 = *(void *)(v0 + 848);
          uint64_t v49 = *(void *)(v0 + 832);
          uint64_t v50 = *(void *)(v0 + 824);
          uint64_t v51 = *(void *)(v0 + 816);
          sub_24A6F17AC();
          swift_allocError();
          unsigned char *v52 = 4;
          swift_willThrow();
          sub_24A6E6998(v46, v45);

          (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v49, v51);
          (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v47, v90);
          goto LABEL_33;
        }
      }
    }
LABEL_31:
    swift_bridgeObjectRelease();
    goto LABEL_32;
  }
  uint64_t v22 = *(void **)(v0 + 1008);
  unint64_t v23 = *(void *)(v0 + 1000);
  uint64_t v24 = *(void *)(v0 + 992);
  uint64_t v25 = *(void *)(v0 + 856);
  uint64_t v87 = *(void *)(v0 + 848);
  uint64_t v89 = *(void *)(v0 + 872);
  uint64_t v86 = *(void *)(v0 + 832);
  uint64_t v26 = *(void *)(v0 + 824);
  uint64_t v27 = *(void *)(v0 + 816);
  id v28 = v7;
  swift_bridgeObjectRelease();
  sub_24A6F3020();

  swift_willThrow();
  sub_24A6E6998(v24, v23);

  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v86, v27);
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v89, v87);
LABEL_33:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v53 = *(uint64_t (**)(void))(v0 + 8);
  return v53();
}

uint64_t sub_24A6F1688()
{
  uint64_t v1 = v0[109];
  uint64_t v2 = v0[107];
  uint64_t v3 = v0[106];
  (*(void (**)(void, void))(v0[103] + 8))(v0[104], v0[102]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

unint64_t sub_24A6F17AC()
{
  unint64_t result = qword_2697B1AF0;
  if (!qword_2697B1AF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697B1AF0);
  }
  return result;
}

BOOL static OpenAIClient.APIError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t OpenAIClient.APIError.hash(into:)()
{
  return sub_24A6F35B0();
}

uint64_t OpenAIClient.APIError.hashValue.getter()
{
  return sub_24A6F35E0();
}

uint64_t sub_24A6F1898(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  *id v8 = v4;
  v8[1] = sub_24A6F1944;
  return OpenAIClient.sendPrompt(injecting:into:group:)(a1, v9, a3, a4);
}

uint64_t sub_24A6F1944(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *v3;
  uint64_t v6 = swift_task_dealloc();
  id v8 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
  if (!v2)
  {
    uint64_t v6 = a1;
    uint64_t v7 = a2;
  }
  return v8(v6, v7);
}

Swift::String __swiftcall OpenAIClient.getCurrentDate()()
{
  uint64_t v0 = sub_24A6F3110();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A6F3100();
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
  uint64_t v5 = (void *)sub_24A6F31E0();
  objc_msgSend(v4, sel_setDateFormat_, v5);

  uint64_t v6 = (void *)sub_24A6F30C0();
  id v7 = objc_msgSend(v4, sel_stringFromDate_, v6);

  uint64_t v8 = sub_24A6F31F0();
  uint64_t v10 = v9;

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  uint64_t v11 = v8;
  char v12 = v10;
  result._object = v12;
  result._countAndFlagsBits = v11;
  return result;
}

uint64_t PromptReplacementKey.rawValue.getter()
{
  return *(void *)&aUserPrUserDaCu_0[8 * *v0];
}

uint64_t NoopClient.sendPrompt(injecting:into:group:)()
{
  return sub_24A6F23AC(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8), v0, 0xD000000000000026, 0x800000024A6F54C0);
}

uint64_t sub_24A6F1C3C()
{
  return sub_24A6F23AC(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8), v0, 0xD000000000000026, 0x800000024A6F54C0);
}

ConditionalEngineClient::PromptReplacementKey_optional __swiftcall PromptReplacementKey.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_24A6F3490();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

uint64_t sub_24A6F1CE8(char *a1, char *a2)
{
  return sub_24A6EF85C(*a1, *a2);
}

uint64_t sub_24A6F1CF4()
{
  return sub_24A6EF9E4();
}

uint64_t sub_24A6F1CFC()
{
  return sub_24A6E62F8();
}

uint64_t sub_24A6F1D04()
{
  return sub_24A6EFA50();
}

ConditionalEngineClient::PromptReplacementKey_optional sub_24A6F1D0C(Swift::String *a1)
{
  return PromptReplacementKey.init(rawValue:)(*a1);
}

uint64_t sub_24A6F1D18@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PromptReplacementKey.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24A6F1D40(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24A6F1E14(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24A6EB164((uint64_t)v12, *a3);
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
      sub_24A6EB164((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_24A6E6A4C((uint64_t)v12);
  return v7;
}

uint64_t sub_24A6F1E14(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24A6F3380();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24A6F1FD0(a5, a6);
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
  uint64_t v8 = sub_24A6F3400();
  if (!v8)
  {
    sub_24A6F3420();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24A6F3460();
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

uint64_t sub_24A6F1FD0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24A6F2068(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24A6F2248(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24A6F2248(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24A6F2068(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24A6F21E0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24A6F33F0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24A6F3420();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24A6F3290();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24A6F3460();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24A6F3420();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24A6F21E0(uint64_t a1, uint64_t a2)
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
  sub_24A6E52D8(&qword_2697B19D8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24A6F2248(char a1, int64_t a2, char a3, char *a4)
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
    sub_24A6E52D8(&qword_2697B19D8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
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
  uint64_t result = sub_24A6F3460();
  __break(1u);
  return result;
}

uint64_t sub_24A6F2398(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_24A6E6998(a1, a2);
  }
  return a1;
}

uint64_t sub_24A6F23AC(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

unint64_t sub_24A6F23C8()
{
  unint64_t result = qword_2697B1B38;
  if (!qword_2697B1B38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697B1B38);
  }
  return result;
}

unint64_t sub_24A6F2420()
{
  unint64_t result = qword_2697B1B50;
  if (!qword_2697B1B50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697B1B50);
  }
  return result;
}

uint64_t destroy for OpenAIClient(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for OpenAIClient(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  int64_t v7 = *(void **)(a2 + 64);
  uint64_t v6 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = v7;
  *(void *)(a1 + 72) = v6;
  uint64_t v8 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v9 = v7;
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for OpenAIClient(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a2[8];
  uint64_t v5 = (void *)a1[8];
  a1[8] = v4;
  id v6 = v4;

  a1[9] = a2[9];
  swift_retain();
  swift_release();
  a1[10] = a2[10];
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for OpenAIClient(uint64_t a1, uint64_t a2)
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
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  id v6 = *(void **)(a1 + 64);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);

  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_release();
  uint64_t v7 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v7;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for OpenAIClient()
{
  return &type metadata for OpenAIClient;
}

uint64_t getEnumTagSinglePayload for OpenAIClient.APIError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for OpenAIClient.APIError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24A6F2844);
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

ValueMetadata *type metadata accessor for OpenAIClient.APIError()
{
  return &type metadata for OpenAIClient.APIError;
}

uint64_t dispatch thunk of LLMClient.sendPrompt(injecting:into:group:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a6 + 8)
                                                                                     + **(int **)(a6 + 8));
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  *uint64_t v13 = v6;
  v13[1] = sub_24A6F29A0;
  return v15(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_24A6F29A0(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
  return v5(a1, a2);
}

ValueMetadata *type metadata accessor for NoopClient()
{
  return &type metadata for NoopClient;
}

uint64_t getEnumTagSinglePayload for PromptReplacementKey(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PromptReplacementKey(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24A6F2C18);
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

ValueMetadata *type metadata accessor for PromptReplacementKey()
{
  return &type metadata for PromptReplacementKey;
}

uint64_t static PromptTemplates.getTemplate(for:)()
{
  return 0x10000000000004F0;
}

uint64_t static PromptTemplates.TemplateType.== infix(_:_:)()
{
  return 1;
}

uint64_t PromptTemplates.TemplateType.hash(into:)()
{
  return sub_24A6F35B0();
}

uint64_t PromptTemplates.TemplateType.hashValue.getter()
{
  return sub_24A6F35E0();
}

uint64_t sub_24A6F2CE4()
{
  return 1;
}

uint64_t sub_24A6F2CEC()
{
  return sub_24A6F35E0();
}

uint64_t sub_24A6F2D30()
{
  return sub_24A6F35B0();
}

uint64_t sub_24A6F2D58()
{
  return sub_24A6F35E0();
}

unint64_t sub_24A6F2D9C()
{
  unint64_t result = qword_2697B1B60;
  if (!qword_2697B1B60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697B1B60);
  }
  return result;
}

ValueMetadata *type metadata accessor for PromptTemplates()
{
  return &type metadata for PromptTemplates;
}

uint64_t getEnumTagSinglePayload for PromptTemplates.TemplateType(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for PromptTemplates.TemplateType(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24A6F2EF0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24A6F2F18()
{
  return 0;
}

ValueMetadata *type metadata accessor for PromptTemplates.TemplateType()
{
  return &type metadata for PromptTemplates.TemplateType;
}

uint64_t sub_24A6F2F30()
{
  return MEMORY[0x270EEDBB0]();
}

uint64_t sub_24A6F2F40()
{
  return MEMORY[0x270EEDC50]();
}

uint64_t sub_24A6F2F50()
{
  return MEMORY[0x270EEDC90]();
}

uint64_t sub_24A6F2F60()
{
  return MEMORY[0x270EEDCA0]();
}

uint64_t sub_24A6F2F70()
{
  return MEMORY[0x270EEDCB8]();
}

uint64_t sub_24A6F2F80()
{
  return MEMORY[0x270EEDE28]();
}

uint64_t sub_24A6F2F90()
{
  return MEMORY[0x270EEDE38]();
}

uint64_t sub_24A6F2FA0()
{
  return MEMORY[0x270EEDE58]();
}

uint64_t sub_24A6F2FB0()
{
  return MEMORY[0x270EEDE70]();
}

uint64_t sub_24A6F2FC0()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_24A6F2FD0()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_24A6F2FE0()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_24A6F2FF0()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_24A6F3000()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_24A6F3010()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_24A6F3020()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_24A6F3030()
{
  return MEMORY[0x270EEFDC0]();
}

uint64_t sub_24A6F3040()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_24A6F3050()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_24A6F3060()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24A6F3070()
{
  return MEMORY[0x270EF0048]();
}

uint64_t sub_24A6F3080()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_24A6F3090()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_24A6F30A0()
{
  return MEMORY[0x270EF0238]();
}

uint64_t sub_24A6F30B0()
{
  return MEMORY[0x270EF02B0]();
}

uint64_t sub_24A6F30C0()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_24A6F30D0()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_24A6F30E0()
{
  return MEMORY[0x270EF09D8]();
}

uint64_t sub_24A6F30F0()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_24A6F3100()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_24A6F3110()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24A6F3120()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_24A6F3130()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t _s23ConditionalEngineClient0A5EventV2id10Foundation4UUIDVvg_0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_24A6F3150()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24A6F3160()
{
  return MEMORY[0x270F18540]();
}

uint64_t sub_24A6F3170()
{
  return MEMORY[0x270F18548]();
}

uint64_t sub_24A6F3180()
{
  return MEMORY[0x270F18568]();
}

uint64_t sub_24A6F3190()
{
  return MEMORY[0x270F18570]();
}

uint64_t sub_24A6F31A0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24A6F31B0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24A6F31C0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_24A6F31D0()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_24A6F31E0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24A6F31F0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24A6F3200()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_24A6F3210()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_24A6F3220()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_24A6F3230()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_24A6F3240()
{
  return MEMORY[0x270F9D6B0]();
}

uint64_t sub_24A6F3250()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24A6F3260()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24A6F3270()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_24A6F3280()
{
  return MEMORY[0x270F9D7C8]();
}

uint64_t sub_24A6F3290()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24A6F32A0()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_24A6F32B0()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_24A6F32C0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24A6F32D0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24A6F32E0()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_24A6F3300()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_24A6F3310()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24A6F3320()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24A6F3330()
{
  return MEMORY[0x270F18588]();
}

uint64_t sub_24A6F3340()
{
  return MEMORY[0x270F185A0]();
}

uint64_t sub_24A6F3350()
{
  return MEMORY[0x270F185A8]();
}

uint64_t sub_24A6F3360()
{
  return MEMORY[0x270F185B0]();
}

uint64_t sub_24A6F3370()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24A6F3380()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24A6F3390()
{
  return MEMORY[0x270EF2410]();
}

uint64_t sub_24A6F33A0()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_24A6F33B0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24A6F33C0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_24A6F33D0()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_24A6F33E0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24A6F33F0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24A6F3400()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24A6F3410()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_24A6F3420()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24A6F3430()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24A6F3440()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24A6F3450()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24A6F3460()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24A6F3470()
{
  return MEMORY[0x270F9F0D8]();
}

uint64_t sub_24A6F3480()
{
  return MEMORY[0x270F9F0E0]();
}

uint64_t sub_24A6F3490()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_24A6F34A0()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_24A6F34B0()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_24A6F34C0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_24A6F34D0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24A6F34E0()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_24A6F34F0()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_24A6F3500()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_24A6F3510()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24A6F3520()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24A6F3530()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24A6F3540()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_24A6F3550()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24A6F3560()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24A6F3570()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24A6F3580()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24A6F3590()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_24A6F35A0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24A6F35B0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24A6F35C0()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_24A6F35D0()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_24A6F35E0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24A6F35F0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24A6F3600()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t BMLocationSemanticPlaceTypeAsString()
{
  return MEMORY[0x270F10A78]();
}

uint64_t BMLocationSemanticUserSpecificPlaceTypeAsString()
{
  return MEMORY[0x270F10A80]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
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

void bzero(void *a1, size_t a2)
{
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x270F9B4A0](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x270F9B4A8](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x270F9B4B8](a1, *(void *)&a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B4E0](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  MEMORY[0x270F9B590](a1, *(void *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B598](a1, *(void *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x270F9B5C0](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x270F9B658](a1);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B690](pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x270F9B710](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x270F9B720](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B800](a1);
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
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

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}