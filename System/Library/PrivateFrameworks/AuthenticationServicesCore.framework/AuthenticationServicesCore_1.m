uint64_t type metadata accessor for ASCRelatedOriginFetcher()
{
  return self;
}

uint64_t method lookup function for ASCRelatedOriginFetcher(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ASCRelatedOriginFetcher);
}

uint64_t dispatch thunk of ASCRelatedOriginFetcher.isOrigin(_:relatedToRelyingPartyIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v10 = *(int **)((*MEMORY[0x263F8EED0] & *v4) + 0x50);
  v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)v10 + *v10);
  v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  void *v11 = v5;
  v11[1] = sub_2193D5538;
  return v13(a1, a2, a3, a4);
}

uint64_t sub_2193D5538(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

ValueMetadata *type metadata accessor for ASCRelatedOriginFetcher.WebAuthnOrigins()
{
  return &type metadata for ASCRelatedOriginFetcher.WebAuthnOrigins;
}

void *sub_2193D5644(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C1A2C8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_2193D57BC();
  sub_2193E3240();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C194F8);
    sub_2193D5810();
    sub_2193E3010();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v7 = (void *)v9[1];
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  }
  return v7;
}

unint64_t sub_2193D57BC()
{
  unint64_t result = qword_267C1A2D0;
  if (!qword_267C1A2D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C1A2D0);
  }
  return result;
}

unint64_t sub_2193D5810()
{
  unint64_t result = qword_267C1A2E0;
  if (!qword_267C1A2E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267C194F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C1A2E0);
  }
  return result;
}

uint64_t sub_2193D587C()
{
  _Block_release(*(const void **)(v0 + 32));

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2193D58CC()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v5 = (void *)v0[4];
  uint64_t v4 = (void *)v0[5];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_219387504;
  v7 = (uint64_t (*)(int, int, void *, void *))((char *)&dword_267C1A2F0 + dword_267C1A2F0);
  return v7(v2, v3, v5, v4);
}

unint64_t sub_2193D5994()
{
  unint64_t result = qword_267C1A300;
  if (!qword_267C1A300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C1A300);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for ASCRelatedOriginFetcher.WebAuthnOrigins.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2193D5A84);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ASCRelatedOriginFetcher.WebAuthnOrigins.CodingKeys()
{
  return &type metadata for ASCRelatedOriginFetcher.WebAuthnOrigins.CodingKeys;
}

unint64_t sub_2193D5AC0()
{
  unint64_t result = qword_267C1A308;
  if (!qword_267C1A308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C1A308);
  }
  return result;
}

unint64_t sub_2193D5B18()
{
  unint64_t result = qword_267C1A310;
  if (!qword_267C1A310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C1A310);
  }
  return result;
}

unint64_t sub_2193D5B70()
{
  unint64_t result = qword_267C1A318;
  if (!qword_267C1A318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C1A318);
  }
  return result;
}

uint64_t sub_2193D5BC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a3 & 0x100000000) != 0)
  {
    uint64_t v3 = a1;
    swift_bridgeObjectRetain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AC27168);
    if (swift_dynamicCast())
    {
      swift_getErrorValue();
      uint64_t v3 = sub_2193E31B0();
    }
    else
    {
      sub_2193E2E60();
      return 0;
    }
  }
  return v3;
}

uint64_t sub_2193D5CAC@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_2193E2880();
  uint64_t v36 = *(void *)(v8 - 8);
  uint64_t v37 = v8;
  MEMORY[0x270FA5388](v8);
  v35 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2193E21F0();
  uint64_t v33 = *(void *)(v10 - 8);
  uint64_t v34 = v10;
  MEMORY[0x270FA5388](v10);
  v32 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for CableRequest.AllocationRequest(0);
  uint64_t v13 = v12 - 8;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  v18 = (char *)&v31 - v17;
  sub_2193E22F0();
  v19 = &v18[*(int *)(v13 + 28)];
  long long v31 = xmmword_2193E7220;
  *(_OWORD *)v19 = xmmword_2193E7220;
  uint64_t v20 = *(int *)(v13 + 32);
  *(void *)v19 = a1;
  *((void *)v19 + 1) = a2;
  v18[v20] = a3;
  uint64_t v21 = type metadata accessor for CableRequest.OneOf_Request(0);
  v22 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56);
  v22(a4, 1, 1, v21);
  uint64_t v23 = type metadata accessor for CableRequest(0);
  sub_21934CDF0(a1, a2);
  sub_2193E22F0();
  uint64_t v24 = a4 + *(int *)(v23 + 24);
  *(_OWORD *)uint64_t v24 = v31;
  sub_2193D6A98((uint64_t)v18, (uint64_t)v16, type metadata accessor for CableRequest.AllocationRequest);
  sub_219360620(a4, &qword_267C18E90);
  sub_2193D6B00((uint64_t)v16, a4, type metadata accessor for CableRequest.AllocationRequest);
  swift_storeEnumTagMultiPayload();
  v22(a4, 0, 1, v21);
  v25 = v32;
  sub_2193E21E0();
  sub_2193E21D0();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v25, v34);
  v26 = v35;
  sub_2193E2870();
  uint64_t v27 = sub_2193E2850();
  unint64_t v29 = v28;
  swift_bridgeObjectRelease();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v26, v37);
  if (v29 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    sub_21934CEB0(*(void *)v24, *(void *)(v24 + 8));
    *(void *)uint64_t v24 = v27;
    *(void *)(v24 + 8) = v29;
    return sub_2193D6B68((uint64_t)v18, type metadata accessor for CableRequest.AllocationRequest);
  }
  return result;
}

uint64_t sub_2193D6024@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for CableResponse.AllocationResponse(0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C1A0D0);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v17 - v12;
  sub_2193D6A30(v2, (uint64_t)&v17 - v12);
  uint64_t v14 = type metadata accessor for CableResponse.OneOf_Response(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48))(v13, 1, v14) == 1) {
    goto LABEL_4;
  }
  sub_2193D6A30((uint64_t)v13, (uint64_t)v11);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_2193D6B68((uint64_t)v11, type metadata accessor for CableResponse.OneOf_Response);
LABEL_4:
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a1, 1, 1, v4);
    return sub_219360620((uint64_t)v13, &qword_267C1A0D0);
  }
  sub_2193D6B00((uint64_t)v11, (uint64_t)v7, type metadata accessor for CableResponse.AllocationResponse);
  uint64_t v15 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56);
  if (sub_2193D62A0())
  {
    sub_2193D6B00((uint64_t)v7, a1, type metadata accessor for CableResponse.AllocationResponse);
    (*v15)(a1, 0, 1, v4);
  }
  else
  {
    sub_2193D6B68((uint64_t)v7, type metadata accessor for CableResponse.AllocationResponse);
    (*v15)(a1, 1, 1, v4);
  }
  return sub_219360620((uint64_t)v13, &qword_267C1A0D0);
}

uint64_t sub_2193D62A0()
{
  uint64_t v1 = type metadata accessor for CableResponse.AllocationResponse(0);
  uint64_t v2 = MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v2);
  v7 = (char *)&v23 - v6;
  if (*(void *)(v0 + *(int *)(v5 + 20) + 8) >> 60 == 15)
  {
    if (qword_26AC26F98 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_2193E24F0();
    __swift_project_value_buffer(v8, (uint64_t)qword_26AC29118);
    sub_2193D6A98(v0, (uint64_t)v4, type metadata accessor for CableResponse.AllocationResponse);
    uint64_t v9 = sub_2193E24D0();
    os_log_type_t v10 = sub_2193E2AE0();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v24 = v12;
      *(_DWORD *)uint64_t v11 = 136315138;
      uint64_t v13 = sub_2193D66B8();
      uint64_t v23 = sub_21934C764(v13, v14, &v24);
      sub_2193E2C00();
      swift_bridgeObjectRelease();
      sub_2193D6B68((uint64_t)v4, type metadata accessor for CableResponse.AllocationResponse);
      _os_log_impl(&dword_219326000, v9, v10, "Allocation response is missing routingID: %s", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D48A390](v12, -1, -1);
      MEMORY[0x21D48A390](v11, -1, -1);
    }
    else
    {
      sub_2193D6B68((uint64_t)v4, type metadata accessor for CableResponse.AllocationResponse);
    }
  }
  else
  {
    if (*(unsigned char *)(v0 + *(int *)(v5 + 24) + 4) != 1) {
      return 1;
    }
    if (qword_26AC26F98 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_2193E24F0();
    __swift_project_value_buffer(v15, (uint64_t)qword_26AC29118);
    sub_2193D6A98(v0, (uint64_t)v7, type metadata accessor for CableResponse.AllocationResponse);
    v16 = sub_2193E24D0();
    os_log_type_t v17 = sub_2193E2AE0();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      uint64_t v24 = v19;
      *(_DWORD *)v18 = 136315138;
      uint64_t v20 = sub_2193D66B8();
      uint64_t v23 = sub_21934C764(v20, v21, &v24);
      sub_2193E2C00();
      swift_bridgeObjectRelease();
      sub_2193D6B68((uint64_t)v7, type metadata accessor for CableResponse.AllocationResponse);
      _os_log_impl(&dword_219326000, v16, v17, "Allocation response is missing domain: %s", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D48A390](v19, -1, -1);
      MEMORY[0x21D48A390](v18, -1, -1);
    }
    else
    {
      sub_2193D6B68((uint64_t)v7, type metadata accessor for CableResponse.AllocationResponse);
    }
  }
  return 0;
}

uint64_t sub_2193D66B8()
{
  uint64_t v1 = (int *)type metadata accessor for CableResponse.AllocationResponse(0);
  uint64_t v2 = v1[6];
  uint64_t v3 = (uint64_t *)(v0 + v1[5]);
  uint64_t v5 = *v3;
  unint64_t v4 = v3[1];
  uint64_t v6 = *(unsigned int *)(v0 + v2);
  unsigned __int8 v7 = *(unsigned char *)(v0 + v2 + 4);
  uint64_t v8 = (uint64_t *)(v0 + v1[7]);
  uint64_t v9 = *v8;
  unint64_t v10 = v8[1];
  sub_21934CE48(v5, v4);
  sub_21934CE48(v9, v10);
  sub_2193E2D90();
  sub_2193E2920();
  if (v4 >> 60 != 15)
  {
    sub_21934CDF0(v5, v4);
    sub_21934CDF0(v5, v4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AC27168);
    if (swift_dynamicCast())
    {
      swift_getErrorValue();
      sub_2193E31B0();
    }
    else
    {
      uint64_t v12 = 0;
      sub_2193E2E60();
    }
    sub_21934CEB0(v5, v4);
    sub_219348A70(v5, v4);
  }
  sub_2193E2920();
  swift_bridgeObjectRelease();
  sub_2193E2920();
  sub_2193D5BC4(0x3E6C696E3CLL, 0xE500000000000000, v6 | ((unint64_t)v7 << 32));
  sub_2193E2920();
  swift_bridgeObjectRelease();
  sub_2193E2920();
  if (v10 >> 60 != 15)
  {
    sub_21934CDF0(v9, v10);
    sub_21934CDF0(v9, v10);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AC27168);
    if (swift_dynamicCast())
    {
      swift_getErrorValue();
      sub_2193E31B0();
    }
    else
    {
      sub_2193E2E60();
    }
    sub_21934CEB0(v9, v10);
    sub_219348A70(v9, v10);
  }
  sub_2193E2920();
  swift_bridgeObjectRelease();
  sub_2193E2920();
  sub_21934CEB0(v9, v10);
  sub_21934CEB0(v5, v4);
  return 0;
}

uint64_t sub_2193D6A30(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C1A0D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2193D6A98(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2193D6B00(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2193D6B68(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

BOOL static CodingUserInfoKey.CBOREncodingFormat.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t CodingUserInfoKey.CBOREncodingFormat.hash(into:)()
{
  return sub_2193E3220();
}

uint64_t CodingUserInfoKey.CBOREncodingFormat.hashValue.getter()
{
  return sub_2193E3230();
}

uint64_t sub_2193D6C54()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C1A340);
  MEMORY[0x270FA5388]();
  uint64_t v1 = (char *)&v6 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_2193E2E80();
  __swift_allocate_value_buffer(v2, qword_267C1A320);
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_267C1A320);
  sub_2193E2E70();
  uint64_t v4 = *(void *)(v2 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48))(v1, 1, v2);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v4 + 32))(v3, v1, v2);
  }
  __break(1u);
  return result;
}

uint64_t static CodingUserInfoKey.as_CBOREncodingFormat.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_267C18A18 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2193E2E80();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_267C1A320);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_2193D6E30()
{
  unint64_t result = qword_267C1A338;
  if (!qword_267C1A338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C1A338);
  }
  return result;
}

unsigned char *_s18CBOREncodingFormatOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2193D6F50);
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

ValueMetadata *type metadata accessor for CodingUserInfoKey.CBOREncodingFormat()
{
  return &type metadata for CodingUserInfoKey.CBOREncodingFormat;
}

id ASProgressiveBackoffManager.__allocating_init(numberOfOperationsBeforeTriggeringBackoff:minimumCooldownDurationSeconds:)(uint64_t a1, double a2)
{
  swift_allocObject();
  unsigned int v4 = (objc_class *)type metadata accessor for ASProgressiveBackoffManager();
  uint64_t v5 = swift_allocObject();
  swift_defaultActor_initialize();
  swift_retain();
  *(void *)(v5 + 128) = sub_219391BD4(MEMORY[0x263F8EE78]);
  *(void *)(v5 + 112) = a1;
  *(double *)(v5 + 120) = a2;
  swift_release();
  v8.receiver = (id)v5;
  v8.super_class = v4;
  id v6 = objc_msgSendSuper2(&v8, sel_init);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v6;
}

id ASProgressiveBackoffManager.init(numberOfOperationsBeforeTriggeringBackoff:minimumCooldownDurationSeconds:)(uint64_t a1, double a2)
{
  unsigned int v4 = (objc_class *)type metadata accessor for ASProgressiveBackoffManager();
  uint64_t v5 = swift_allocObject();
  swift_defaultActor_initialize();
  swift_retain();
  *(void *)(v5 + 128) = sub_219391BD4(MEMORY[0x263F8EE78]);
  *(void *)(v5 + 112) = a1;
  *(double *)(v5 + 120) = a2;
  swift_release();
  v8.receiver = (id)v5;
  v8.super_class = v4;
  id v6 = objc_msgSendSuper2(&v8, sel_init);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v6;
}

id ASProgressiveBackoffManager.__allocating_init(numberOfOperationsBeforeTriggeringBackoff:minimumCooldownDuration:)(uint64_t a1, double a2)
{
  uint64_t v5 = swift_allocObject();
  swift_defaultActor_initialize();
  swift_retain();
  *(void *)(v5 + 128) = sub_219391BD4(MEMORY[0x263F8EE78]);
  *(void *)(v5 + 112) = a1;
  *(double *)(v5 + 120) = a2;
  swift_release();
  v7.receiver = (id)v5;
  v7.super_class = v2;
  return objc_msgSendSuper2(&v7, sel_init);
}

uint64_t type metadata accessor for ASProgressiveBackoffManager()
{
  return self;
}

id ASProgressiveBackoffManager.init(numberOfOperationsBeforeTriggeringBackoff:minimumCooldownDuration:)(uint64_t a1, double a2)
{
  swift_defaultActor_initialize();
  swift_retain();
  *(void *)(v2 + 128) = sub_219391BD4(MEMORY[0x263F8EE78]);
  *(void *)(v2 + 112) = a1;
  *(double *)(v2 + 120) = a2;
  swift_release();
  v6.receiver = (id)v2;
  v6.super_class = (Class)type metadata accessor for ASProgressiveBackoffManager();
  return objc_msgSendSuper2(&v6, sel_init);
}

uint64_t sub_2193D72F8(uint64_t a1, uint64_t a2)
{
  v3[9] = a2;
  v3[10] = v2;
  v3[8] = a1;
  return MEMORY[0x270FA2498](sub_2193D731C, v2, 0);
}

uint64_t sub_2193D731C()
{
  uint64_t v1 = v0[10] + 128;
  swift_beginAccess();
  uint64_t v2 = *(void *)v1;
  if (*(void *)(*(void *)v1 + 16))
  {
    uint64_t v4 = v0[8];
    uint64_t v3 = v0[9];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_21938452C(v4, v3);
    if (v6)
    {
      objc_super v7 = *(void **)(*(void *)(v2 + 56) + 8 * v5);
      swift_retain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v9 = v0[9];
  uint64_t v8 = v0[10];
  uint64_t v10 = v0[8];
  uint64_t v11 = *(void *)(v8 + 112);
  uint64_t v12 = *(void *)(v8 + 120);
  type metadata accessor for ASProgressiveBackoffManager.Context();
  objc_super v7 = (void *)swift_allocObject();
  swift_bridgeObjectRetain();
  swift_defaultActor_initialize();
  v7[18] = 0;
  v7[19] = 0;
  v7[14] = v10;
  v7[15] = v9;
  v7[16] = v11;
  v7[17] = v12;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v16 = *(void *)v1;
  *(void *)uint64_t v1 = 0x8000000000000000;
  sub_2193A04F0((uint64_t)v7, v10, v9, isUniquelyReferenced_nonNull_native);
  *(void *)uint64_t v1 = v16;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
LABEL_6:
  v0[11] = v7;
  swift_retain();
  unint64_t v14 = (void *)swift_task_alloc();
  v0[12] = v14;
  *unint64_t v14 = v0;
  v14[1] = sub_2193D752C;
  v14[2] = v7;
  return MEMORY[0x270FA2498](sub_2193D7C18, v7, 0);
}

uint64_t sub_2193D752C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 80);
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_2193D7658, v1, 0);
}

uint64_t sub_2193D7658()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2193D7838(int a1, void *aBlock, uint64_t a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  uint64_t v5 = sub_2193E2840();
  uint64_t v7 = v6;
  v3[4] = v6;
  swift_retain();
  uint64_t v8 = (void *)swift_task_alloc();
  v3[5] = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_2193D7924;
  v8[9] = v7;
  v8[10] = a3;
  v8[8] = v5;
  return MEMORY[0x270FA2498](sub_2193D731C, a3, 0);
}

uint64_t sub_2193D7924()
{
  uint64_t v1 = *(void (***)(void))(*v0 + 24);
  uint64_t v4 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  v1[2](v1);
  _Block_release(v1);
  uint64_t v2 = *(uint64_t (**)(void))(v4 + 8);
  return v2();
}

void ASProgressiveBackoffManager.__allocating_init()()
{
}

void ASProgressiveBackoffManager.init()()
{
}

uint64_t ASProgressiveBackoffManager.deinit()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t ASProgressiveBackoffManager.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();

  return MEMORY[0x270FA2418](v0);
}

uint64_t ASProgressiveBackoffManager.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_2193D7BA0()
{
  uint64_t v1 = *(void *)(v0 + 144);
  uint64_t v2 = *(void *)(v0 + 128);
  if (v2 >= v1)
  {
    *(double *)&uint64_t result = 0.0;
    return result;
  }
  uint64_t v4 = v1 - v2;
  if (__OFSUB__(v1, v2))
  {
    __break(1u);
    goto LABEL_13;
  }
  BOOL v5 = __OFSUB__(v4, 1);
  unint64_t v6 = v4 - 1;
  if (v5)
  {
LABEL_13:
    __break(1u);
    return result;
  }
  BOOL v7 = v6 > 0x40;
  if (v6 >= 0x40) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = 1 << v6;
  }
  if (v7) {
    uint64_t v8 = 0;
  }
  *(double *)&uint64_t result = (double)v8;
  return result;
}

uint64_t sub_2193D7BF8()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_2193D7C18, v0, 0);
}

uint64_t sub_2193D7C18()
{
  uint64_t v1 = v0[2];
  double v2 = COERCE_DOUBLE(sub_2193D7BA0());
  uint64_t v4 = *(void *)(v1 + 144);
  BOOL v5 = __OFADD__(v4, 1);
  uint64_t v6 = v4 + 1;
  if (v5)
  {
    __break(1u);
    goto LABEL_13;
  }
  *(void *)(v1 + 144) = v6;
  if ((v3 & 1) == 0)
  {
    double v7 = v2 * 1000000000.0;
    if ((~COERCE__INT64(v2 * 1000000000.0) & 0x7FF0000000000000) != 0)
    {
      if (v7 > -1.0)
      {
        if (v7 < 1.84467441e19)
        {
          unint64_t v8 = (unint64_t)v7;
          uint64_t v9 = (void *)swift_task_alloc();
          v0[3] = v9;
          *uint64_t v9 = v0;
          v9[1] = sub_2193D7D54;
          double v2 = *(double *)&v8;
          return MEMORY[0x270FA1FF0](*(void *)&v2);
        }
LABEL_15:
        __break(1u);
        return MEMORY[0x270FA1FF0](*(void *)&v2);
      }
LABEL_14:
      __break(1u);
      goto LABEL_15;
    }
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  sub_2193D8008();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_2193D7D54()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 32) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 16);
  if (v0) {
    uint64_t v4 = sub_2193D7EE0;
  }
  else {
    uint64_t v4 = sub_2193D7E80;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_2193D7E80()
{
  sub_2193D8008();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2193D7EE0()
{
  if (qword_26AC26F98 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2193E24F0();
  __swift_project_value_buffer(v1, (uint64_t)qword_26AC29118);
  uint64_t v2 = sub_2193E24D0();
  os_log_type_t v3 = sub_2193E2B00();
  BOOL v4 = os_log_type_enabled(v2, v3);
  BOOL v5 = *(void **)(v0 + 32);
  if (v4)
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_219326000, v2, v3, "Task canceled before backoff timer finished.", v6, 2u);
    MEMORY[0x21D48A390](v6, -1, -1);
  }

  sub_2193D8008();
  double v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_2193D8008()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC27638);
  MEMORY[0x270FA5388](v1 - 8);
  os_log_type_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(v0 + 152))
  {
    swift_retain();
    sub_2193E2A70();
    swift_release();
  }
  double v4 = COERCE_DOUBLE(sub_2193D7BA0());
  if (v5)
  {
    double v6 = *(double *)(v0 + 136);
  }
  else if (*(double *)(v0 + 136) < v4)
  {
    double v6 = v4;
  }
  else
  {
    double v6 = *(double *)(v0 + 136);
  }
  uint64_t v7 = sub_2193E2A60();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v3, 1, 1, v7);
  unint64_t v8 = sub_2193D8BC0();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v0;
  *(void *)(v9 + 24) = v8;
  *(double *)(v9 + 32) = v6;
  *(void *)(v9 + 40) = v0;
  swift_retain_n();
  *(void *)(v0 + 152) = sub_219380F74((uint64_t)v3, (uint64_t)&unk_267C1A368, v9);
  return swift_release();
}

uint64_t sub_2193D8180(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 48) = a5;
  *(double *)(v5 + 40) = a1;
  return MEMORY[0x270FA2498](sub_2193D81A4, a5, 0);
}

uint64_t sub_2193D81A4()
{
  if (qword_26AC26F98 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2193E24F0();
  *((void *)v0 + 7) = __swift_project_value_buffer(v1, (uint64_t)qword_26AC29118);
  uint64_t v2 = sub_2193E24D0();
  os_log_type_t v3 = sub_2193E2AC0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = *((void *)v0 + 5);
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 134217984;
    *((void *)v0 + 4) = v4;
    sub_2193E2C00();
    _os_log_impl(&dword_219326000, v2, v3, "Scheduling cooldown for %f.", v5, 0xCu);
    MEMORY[0x21D48A390](v5, -1, -1);
  }

  double v7 = v0[5] * 1000000000.0;
  if ((~*(void *)&v7 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_12;
  }
  if (v7 <= -1.0)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (v7 >= 1.84467441e19)
  {
LABEL_13:
    __break(1u);
    return MEMORY[0x270FA1FF0](v6);
  }
  unint64_t v8 = (unint64_t)v7;
  uint64_t v9 = (void *)swift_task_alloc();
  *((void *)v0 + 8) = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_2193D8388;
  unint64_t v6 = v8;
  return MEMORY[0x270FA1FF0](v6);
}

uint64_t sub_2193D8388()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 72) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 48);
  if (v0) {
    uint64_t v4 = sub_2193D85C4;
  }
  else {
    uint64_t v4 = sub_2193D84B4;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_2193D84B4()
{
  uint64_t v1 = sub_2193E24D0();
  os_log_type_t v2 = sub_2193E2AC0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = v0[5];
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 134217984;
    v0[3] = v3;
    sub_2193E2C00();
    _os_log_impl(&dword_219326000, v1, v2, "Cooldown for %f completed.", v4, 0xCu);
    MEMORY[0x21D48A390](v4, -1, -1);
  }
  uint64_t v5 = v0[6];

  *(void *)(v5 + 144) = 0;
  *(void *)(v5 + 152) = 0;
  swift_release();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_2193D85C4()
{
  uint64_t v1 = sub_2193E24D0();
  os_log_type_t v2 = sub_2193E2AC0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (void *)v0[9];
    uint64_t v4 = v0[5];
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 134217984;
    v0[2] = v4;
    sub_2193E2C00();
    _os_log_impl(&dword_219326000, v1, v2, "Cooldown for %f aborted.", v5, 0xCu);
    MEMORY[0x21D48A390](v5, -1, -1);
  }
  else
  {
    uint64_t v3 = (void *)v0[9];
  }

  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_2193D86D8()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_defaultActor_destroy();

  return MEMORY[0x270FA2418](v0);
}

uint64_t type metadata accessor for ASProgressiveBackoffManager.Context()
{
  return self;
}

uint64_t sub_2193D873C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_219387958;
  return v6();
}

uint64_t sub_2193D8808(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_219387958;
  return v7();
}

uint64_t sub_2193D88D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2193E2A60();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2193E2A50();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_2193D8DD0(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2193E2A40();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t method lookup function for ASProgressiveBackoffManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ASProgressiveBackoffManager);
}

uint64_t dispatch thunk of ASProgressiveBackoffManager.__allocating_init(numberOfOperationsBeforeTriggeringBackoff:minimumCooldownDuration:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of ASProgressiveBackoffManager.performAfterBackoff(for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)((*MEMORY[0x263F8EED0] & *v2) + 0x90);
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)v6 + *v6);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_219387504;
  return v9(a1, a2);
}

unint64_t sub_2193D8BC0()
{
  unint64_t result = qword_26AC280E8;
  if (!qword_26AC280E8)
  {
    type metadata accessor for ASProgressiveBackoffManager.Context();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AC280E8);
  }
  return result;
}

uint64_t sub_2193D8C18()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_219387958;
  v4[6] = v3;
  v4[5] = v2;
  return MEMORY[0x270FA2498](sub_2193D81A4, v3, 0);
}

uint64_t sub_2193D8CCC()
{
  _Block_release(*(const void **)(v0 + 24));
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2193D8D14()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_219387958;
  uint64_t v6 = (uint64_t (*)(int, void *, uint64_t))((char *)&dword_267C1A370 + dword_267C1A370);
  return v6(v2, v3, v4);
}

uint64_t sub_2193D8DD0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC27638);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2193D8E30()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2193D8E68(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_219387504;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_267C1A390 + dword_267C1A390);
  return v6(a1, v4);
}

uint64_t ASCPublicKeyCredentialAssertionExtensionOutputs.PRF.init(secret1:secret2:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_2193E26A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a3, a1, v6);
  uint64_t v7 = a3 + *(int *)(type metadata accessor for ASCPublicKeyCredentialAssertionExtensionOutputs.PRF(0) + 20);

  return sub_21937EC68(a2, v7);
}

uint64_t type metadata accessor for ASCPublicKeyCredentialAssertionExtensionOutputs.PRF(uint64_t a1)
{
  return sub_21937EAB4(a1, (uint64_t *)&unk_267C1A4C0);
}

id ASCPublicKeyCredentialAssertionExtensionOutputs.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

__n128 ASCPublicKeyCredentialAssertionExtensionOutputs.LargeBlob.init(result:)@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  unsigned __int8 v2 = a1[1].n128_u8[0];
  __n128 result = *a1;
  *a2 = *a1;
  a2[1].n128_u8[0] = v2;
  return result;
}

uint64_t static ASCPublicKeyCredentialAssertionExtensionOutputs.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t sub_2193D902C(void *a1)
{
  sub_2193E1D60();
  swift_allocObject();
  sub_2193E1D50();
  type metadata accessor for ASCPublicKeyCredentialAssertionExtensionOutputs(0);
  sub_2193D9444((unint64_t *)&unk_267C1A3A8, (void (*)(uint64_t))type metadata accessor for ASCPublicKeyCredentialAssertionExtensionOutputs);
  uint64_t v2 = sub_2193E1D40();
  unint64_t v4 = v3;
  swift_release();
  uint64_t v5 = (void *)sub_2193E2110();
  uint64_t v6 = (void *)sub_2193E2830();
  objc_msgSend(a1, sel_encodeObject_forKey_, v5, v6);

  return sub_219348A70(v2, v4);
}

uint64_t type metadata accessor for ASCPublicKeyCredentialAssertionExtensionOutputs(uint64_t a1)
{
  return sub_21937EAB4(a1, (uint64_t *)&unk_267C1A4A0);
}

id ASCPublicKeyCredentialAssertionExtensionOutputs.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return ASCPublicKeyCredentialAssertionExtensionOutputs.init(coder:)(a1);
}

id ASCPublicKeyCredentialAssertionExtensionOutputs.init(coder:)(void *a1)
{
  swift_getObjectType();
  sub_219349168();
  id v3 = v1;
  uint64_t v4 = sub_2193E2B50();
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    uint64_t v6 = sub_2193E2130();
    unint64_t v8 = v7;

    sub_2193E1D30();
    swift_allocObject();
    sub_2193E1D20();
    sub_2193D9444(&qword_267C1A3B8, (void (*)(uint64_t))type metadata accessor for ASCPublicKeyCredentialAssertionExtensionOutputs);
    sub_2193E1D10();

    swift_release();
    id v9 = objc_allocWithZone((Class)type metadata accessor for ASCPublicKeyCredentialAssertionExtensionOutputs(0));
    id v10 = sub_2193DC924((uint64_t)v12);

    sub_219348A70(v6, v8);
    swift_getObjectType();
    swift_deallocPartialClassInstance();
  }
  else
  {

    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v10;
}

uint64_t sub_2193D9444(unint64_t *a1, void (*a2)(uint64_t))
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

id ASCPublicKeyCredentialAssertionExtensionOutputs.init()()
{
  id v1 = &v0[OBJC_IVAR____TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs_largeBlob];
  *(void *)id v1 = 0;
  *((void *)v1 + 1) = 0;
  v1[16] = -1;
  uint64_t v2 = &v0[OBJC_IVAR____TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs_prf];
  uint64_t v3 = type metadata accessor for ASCPublicKeyCredentialAssertionExtensionOutputs.PRF(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for ASCPublicKeyCredentialAssertionExtensionOutputs(0);
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t sub_2193D9668()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C19320);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C199B8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for ASCPublicKeyCredentialAssertionExtensionOutputs.PRF(0);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = 0x6F69736E65747845;
  unint64_t v26 = 0xEF0A207B203A736ELL;
  uint64_t v11 = v0 + OBJC_IVAR____TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs_largeBlob;
  swift_beginAccess();
  int v12 = *(unsigned __int8 *)(v11 + 16);
  if (v12 != 255)
  {
    uint64_t v18 = v0;
    uint64_t v15 = v11;
    uint64_t v14 = *(void *)v11;
    unint64_t v13 = *(void *)(v15 + 8);
    uint64_t v22 = v14;
    unint64_t v23 = v13;
    char v24 = v12 & 1;
    sub_2193DCBCC(v14, v13, v12 & 1);
    ASCPublicKeyCredentialAssertionExtensionOutputs.LargeBlob.description.getter();
    uint64_t v19 = v7;
    uint64_t v22 = 9;
    unint64_t v23 = 0xE100000000000000;
    sub_2193E2920();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_2193E2920();
    swift_bridgeObjectRelease();
    sub_2193E2920();
    uint64_t v7 = v19;
    swift_bridgeObjectRelease();
    uint64_t v0 = v18;
    sub_2193A8E2C(v14, v13, v12);
  }
  uint64_t v16 = v0 + OBJC_IVAR____TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs_prf;
  swift_beginAccess();
  sub_219360574(v16, (uint64_t)v6, &qword_267C199B8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_219360620((uint64_t)v6, &qword_267C199B8);
  }
  else
  {
    sub_2193DCB0C((uint64_t)v6, (uint64_t)v10);
    uint64_t v20 = 0;
    unint64_t v21 = 0xE000000000000000;
    sub_2193E2920();
    sub_2193E26A0();
    sub_2193E2E60();
    sub_2193E2920();
    sub_219360574((uint64_t)&v10[*(int *)(v7 + 20)], (uint64_t)v3, &qword_267C19320);
    sub_2193E2890();
    sub_2193E2920();
    swift_bridgeObjectRelease();
    uint64_t v20 = 9;
    unint64_t v21 = 0xE100000000000000;
    sub_2193E2920();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_2193E2920();
    swift_bridgeObjectRelease();
    sub_2193E2920();
    swift_bridgeObjectRelease();
    sub_2193DCB70((uint64_t)v10);
  }
  uint64_t v20 = v25;
  unint64_t v21 = v26;
  swift_bridgeObjectRetain();
  sub_2193E2920();
  swift_bridgeObjectRelease();
  return v20;
}

unint64_t ASCPublicKeyCredentialAssertionExtensionOutputs.LargeBlob.description.getter()
{
  uint64_t v1 = *(void *)v0;
  if (*(unsigned char *)(v0 + 16) == 1)
  {
    sub_2193E2D90();
    swift_bridgeObjectRelease();
    unint64_t v4 = 0xD000000000000011;
    sub_2193E2920();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = *(void *)(v0 + 8);
    if (v2 >> 60 == 15) {
      return 0xD000000000000013;
    }
    sub_21934CDF0(v1, v2);
    sub_21934CDF0(v1, v2);
    sub_2193E2D90();
    swift_bridgeObjectRelease();
    unint64_t v4 = 0xD000000000000010;
    switch(v2 >> 62)
    {
      case 1uLL:
        if (!__OFSUB__(HIDWORD(v1), v1)) {
          goto LABEL_9;
        }
        __break(1u);
LABEL_12:
        __break(1u);
        JUMPOUT(0x2193D9C48);
      case 2uLL:
        if (!__OFSUB__(*(void *)(v1 + 24), *(void *)(v1 + 16))) {
          goto LABEL_9;
        }
        goto LABEL_12;
      default:
LABEL_9:
        sub_2193E3100();
        sub_2193E2920();
        swift_bridgeObjectRelease();
        sub_2193E2920();
        sub_2193A8E44(v1, v2, 0);
        sub_2193A8E44(v1, v2, 0);
        break;
    }
  }
  return v4;
}

uint64_t ASCPublicKeyCredentialAssertionExtensionOutputs.PRF.description.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C19320);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6[0] = 0;
  v6[1] = 0xE000000000000000;
  sub_2193E2920();
  sub_2193E26A0();
  sub_2193E2E60();
  sub_2193E2920();
  uint64_t v4 = type metadata accessor for ASCPublicKeyCredentialAssertionExtensionOutputs.PRF(0);
  sub_219360574(v0 + *(int *)(v4 + 20), (uint64_t)v3, &qword_267C19320);
  sub_2193E2890();
  sub_2193E2920();
  swift_bridgeObjectRelease();
  return v6[0];
}

uint64_t sub_2193D9D74@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs_largeBlob;
  swift_beginAccess();
  uint64_t v4 = *(void *)v3;
  unint64_t v5 = *(void *)(v3 + 8);
  *(void *)a2 = *(void *)v3;
  *(void *)(a2 + 8) = v5;
  unsigned __int8 v6 = *(unsigned char *)(v3 + 16);
  *(unsigned char *)(a2 + 16) = v6;
  return sub_2193DCBD8(v4, v5, v6);
}

uint64_t sub_2193D9DD4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)a1;
  unint64_t v3 = *(void *)(a1 + 8);
  uint64_t v4 = *a2 + OBJC_IVAR____TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs_largeBlob;
  unsigned __int8 v5 = *(unsigned char *)(a1 + 16);
  swift_beginAccess();
  uint64_t v6 = *(void *)v4;
  unint64_t v7 = *(void *)(v4 + 8);
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = v3;
  unsigned __int8 v8 = *(unsigned char *)(v4 + 16);
  *(unsigned char *)(v4 + 16) = v5;
  sub_2193DCBD8(v2, v3, v5);
  return sub_2193A8E2C(v6, v7, v8);
}

uint64_t sub_2193D9E6C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs_largeBlob;
  swift_beginAccess();
  uint64_t v4 = *(void *)v3;
  unint64_t v5 = *(void *)(v3 + 8);
  *(void *)a1 = *(void *)v3;
  *(void *)(a1 + 8) = v5;
  unsigned __int8 v6 = *(unsigned char *)(v3 + 16);
  *(unsigned char *)(a1 + 16) = v6;
  return sub_2193DCBD8(v4, v5, v6);
}

uint64_t sub_2193D9EC8(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  char v4 = *((unsigned char *)a1 + 16);
  uint64_t v5 = v1 + OBJC_IVAR____TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs_largeBlob;
  swift_beginAccess();
  uint64_t v6 = *(void *)v5;
  unint64_t v7 = *(void *)(v5 + 8);
  *(void *)uint64_t v5 = v2;
  *(void *)(v5 + 8) = v3;
  unsigned __int8 v8 = *(unsigned char *)(v5 + 16);
  *(unsigned char *)(v5 + 16) = v4;
  return sub_2193A8E2C(v6, v7, v8);
}

uint64_t (*sub_2193D9F38())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2193D9F94(uint64_t a1, void *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C199B8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_219360574(a1, (uint64_t)v6, &qword_267C199B8);
  uint64_t v7 = *a2 + OBJC_IVAR____TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs_prf;
  swift_beginAccess();
  sub_2193DCBF0((uint64_t)v6, v7);
  return swift_endAccess();
}

uint64_t sub_2193DA05C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs_prf;
  swift_beginAccess();
  return sub_219360574(v3, a1, &qword_267C199B8);
}

uint64_t sub_2193DA0B8(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs_prf;
  swift_beginAccess();
  sub_2193DCBF0(a1, v3);
  return swift_endAccess();
}

uint64_t (*sub_2193DA114())()
{
  return j__swift_endAccess;
}

uint64_t sub_2193DA170@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C19320);
  MEMORY[0x270FA5388](v3 - 8);
  v32 = &v30[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C199B8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = &v30[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = type metadata accessor for ASCPublicKeyCredentialAssertionExtensionOutputs.PRF(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = &v30[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  *(void *)&long long v36 = v1;
  uint64_t v12 = v1 + OBJC_IVAR____TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs_largeBlob;
  swift_beginAccess();
  int v13 = *(unsigned __int8 *)(v12 + 16);
  if (v13 == 255)
  {
    unint64_t v34 = 0;
    uint64_t v35 = 0;
    unsigned int v18 = 0;
    uint64_t v33 = 0;
    char v19 = 0;
    uint64_t v17 = 3;
  }
  else
  {
    uint64_t v15 = *(void *)v12;
    unint64_t v14 = *(void *)(v12 + 8);
    uint64_t v16 = *(void *)v12;
    if (v13)
    {
      sub_2193A8E2C(v16, *(void *)(v12 + 8), *(unsigned char *)(v12 + 16));
      uint64_t v35 = 0;
      uint64_t v33 = 0;
      unsigned int v18 = v15 & 1;
      char v19 = 1;
      unint64_t v34 = 0xF000000000000000;
      uint64_t v17 = 2;
    }
    else
    {
      sub_2193DCBCC(v16, *(void *)(v12 + 8), 0);
      sub_2193DCBCC(v15, v14, 0);
      sub_219392628(2, v15, v14, 2, (uint64_t)v37);
      sub_2193A8E2C(v15, v14, v13);
      uint64_t v17 = LOBYTE(v37[0]);
      unint64_t v34 = v37[2];
      uint64_t v35 = v37[1];
      unsigned int v18 = v38;
      uint64_t v33 = v39;
      char v19 = v40;
    }
  }
  uint64_t v20 = v36 + OBJC_IVAR____TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs_prf;
  swift_beginAccess();
  sub_219360574(v20, (uint64_t)v7, &qword_267C199B8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    uint64_t result = sub_219360620((uint64_t)v7, &qword_267C199B8);
    long long v22 = 0uLL;
    uint64_t v23 = 3;
    long long v24 = 0uLL;
  }
  else
  {
    sub_2193DCB0C((uint64_t)v7, (uint64_t)v11);
    sub_2193E2670();
    long long v36 = v41;
    uint64_t v25 = v32;
    sub_219360574((uint64_t)&v11[*(int *)(v8 + 20)], (uint64_t)v32, &qword_267C19320);
    uint64_t v26 = sub_2193E26A0();
    uint64_t v27 = *(void *)(v26 - 8);
    if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26) == 1)
    {
      sub_2193DCB70((uint64_t)v11);
      uint64_t result = sub_219360620((uint64_t)v25, &qword_267C19320);
      long long v24 = xmmword_2193E7220;
    }
    else
    {
      sub_2193E2670();
      long long v31 = v41;
      sub_2193DCB70((uint64_t)v11);
      uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v27 + 8))(v25, v26);
      long long v24 = v31;
    }
    uint64_t v23 = 2;
    long long v22 = v36;
  }
  unint64_t v29 = v34;
  uint64_t v28 = v35;
  *(void *)a1 = v17;
  *(void *)(a1 + 8) = v28;
  *(void *)(a1 + 16) = v29;
  *(void *)(a1 + 24) = v18;
  *(void *)(a1 + 32) = v33;
  *(unsigned char *)(a1 + 40) = v19;
  *(void *)(a1 + 48) = v23;
  *(_OWORD *)(a1 + 56) = v22;
  *(_OWORD *)(a1 + 72) = v24;
  *(unsigned char *)(a1 + 88) = 2;
  return result;
}

uint64_t sub_2193DA7B4(uint64_t a1)
{
  unint64_t v2 = sub_2193DCC58();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2193DA7F0(uint64_t a1)
{
  unint64_t v2 = sub_2193DCC58();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2193DA82C()
{
  return 1635017060;
}

uint64_t sub_2193DA83C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 1635017060 && a2 == 0xE400000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_2193E3140();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_2193DA8C4(uint64_t a1)
{
  unint64_t v2 = sub_2193DCD00();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2193DA900(uint64_t a1)
{
  unint64_t v2 = sub_2193DCD00();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2193DA93C()
{
  return 0x73736563637573;
}

uint64_t sub_2193DA954@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x73736563637573 && a2 == 0xE700000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_2193E3140();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_2193DA9EC(uint64_t a1)
{
  unint64_t v2 = sub_2193DCCAC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2193DAA28(uint64_t a1)
{
  unint64_t v2 = sub_2193DCCAC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ASCPublicKeyCredentialAssertionExtensionOutputs.LargeBlob.OperationResult.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C1A3D0);
  uint64_t v24 = *(void *)(v3 - 8);
  uint64_t v25 = v3;
  MEMORY[0x270FA5388](v3);
  char v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C1A3D8);
  uint64_t v22 = *(void *)(v6 - 8);
  uint64_t v23 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C1A3E0);
  uint64_t v26 = *(void *)(v9 - 8);
  uint64_t v27 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void *)v1;
  unint64_t v21 = *(void *)(v1 + 8);
  int v13 = *(unsigned __int8 *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_2193DCC58();
  sub_2193E3260();
  if (v13 == 1)
  {
    LOBYTE(v28) = 1;
    sub_2193DCCAC();
    uint64_t v14 = v27;
    sub_2193E3050();
    uint64_t v15 = v25;
    sub_2193E30C0();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v5, v15);
    return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v11, v14);
  }
  else
  {
    LOBYTE(v28) = 0;
    unint64_t v17 = v21;
    sub_21934CE48(v12, v21);
    sub_2193DCD00();
    uint64_t v18 = v27;
    sub_2193E3050();
    uint64_t v28 = v12;
    unint64_t v29 = v17;
    sub_21934D644();
    uint64_t v19 = v23;
    sub_2193E30A0();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v8, v19);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v11, v18);
    return sub_2193A8E44(v12, v17, 0);
  }
}

uint64_t ASCPublicKeyCredentialAssertionExtensionOutputs.LargeBlob.OperationResult.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  unint64_t v29 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C1A408);
  uint64_t v31 = *(void *)(v3 - 8);
  uint64_t v32 = v3;
  MEMORY[0x270FA5388](v3);
  char v5 = (char *)v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C1A410);
  uint64_t v30 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C1A418);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = a1[3];
  uint64_t v33 = a1;
  __swift_project_boxed_opaque_existential_1Tm(a1, v13);
  sub_2193DCC58();
  uint64_t v14 = v35;
  sub_2193E3240();
  if (v14) {
    goto LABEL_6;
  }
  uint64_t v28 = v6;
  uint64_t v15 = v32;
  uint64_t v35 = v10;
  uint64_t v16 = sub_2193E3040();
  if (*(void *)(v16 + 16) != 1)
  {
    uint64_t v18 = sub_2193E2DD0();
    swift_allocError();
    uint64_t v20 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C18A90);
    *uint64_t v20 = &type metadata for ASCPublicKeyCredentialAssertionExtensionOutputs.LargeBlob.OperationResult;
    sub_2193E2F90();
    sub_2193E2DC0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v18 - 8) + 104))(v20, *MEMORY[0x263F8DCB0], v18);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v12, v9);
LABEL_6:
    uint64_t v23 = (uint64_t)v33;
    return __swift_destroy_boxed_opaque_existential_1Tm(v23);
  }
  v27[1] = v16;
  char v17 = *(unsigned char *)(v16 + 32);
  if (v17)
  {
    LOBYTE(v34) = 1;
    sub_2193DCCAC();
    sub_2193E2F80();
    char v22 = sub_2193E3000();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v5, v15);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v12, v9);
    uint64_t v23 = (uint64_t)v33;
    long long v24 = v22 & 1;
  }
  else
  {
    LOBYTE(v34) = 0;
    sub_2193DCD00();
    sub_2193E2F80();
    sub_21934D774();
    uint64_t v25 = v28;
    sub_2193E2FE0();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v8, v25);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v12, v9);
    long long v24 = v34;
    uint64_t v23 = (uint64_t)v33;
  }
  uint64_t v26 = v29;
  *unint64_t v29 = v24;
  *((unsigned char *)v26 + 16) = v17;
  return __swift_destroy_boxed_opaque_existential_1Tm(v23);
}

uint64_t sub_2193DB2A0@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return ASCPublicKeyCredentialAssertionExtensionOutputs.LargeBlob.OperationResult.init(from:)(a1, a2);
}

uint64_t sub_2193DB2B8(void *a1)
{
  return ASCPublicKeyCredentialAssertionExtensionOutputs.LargeBlob.OperationResult.encode(to:)(a1);
}

uint64_t ASCPublicKeyCredentialAssertionExtensionOutputs.LargeBlob.result.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)v1;
  unint64_t v3 = *(void *)(v1 + 8);
  char v4 = *(unsigned char *)(v1 + 16);
  *(void *)a1 = *(void *)v1;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4;
  return sub_2193DCBCC(v2, v3, v4);
}

uint64_t ASCPublicKeyCredentialAssertionExtensionOutputs.LargeBlob.result.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  char v4 = *((unsigned char *)a1 + 16);
  uint64_t result = sub_2193A8E44(*(void *)v1, *(void *)(v1 + 8), *(unsigned char *)(v1 + 16));
  *(void *)uint64_t v1 = v2;
  *(void *)(v1 + 8) = v3;
  *(unsigned char *)(v1 + 16) = v4;
  return result;
}

uint64_t (*ASCPublicKeyCredentialAssertionExtensionOutputs.LargeBlob.result.modify())()
{
  return nullsub_1;
}

uint64_t sub_2193DB344()
{
  return 0x746C75736572;
}

uint64_t sub_2193DB358@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x746C75736572 && a2 == 0xE600000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_2193E3140();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_2193DB3E8(uint64_t a1)
{
  unint64_t v2 = sub_2193DCD54();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2193DB424(uint64_t a1)
{
  unint64_t v2 = sub_2193DCD54();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ASCPublicKeyCredentialAssertionExtensionOutputs.LargeBlob.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C1A420);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  uint64_t v7 = v1[1];
  HIDWORD(v10) = *((unsigned __int8 *)v1 + 16);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_2193DCD54();
  sub_2193E3260();
  uint64_t v11 = v8;
  uint64_t v12 = v7;
  char v13 = BYTE4(v10);
  sub_2193DCDA8();
  sub_2193E30D0();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t ASCPublicKeyCredentialAssertionExtensionOutputs.LargeBlob.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C1A438);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_2193DCD54();
  sub_2193E3240();
  if (!v2)
  {
    sub_2193DCDFC();
    sub_2193E3010();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    char v9 = v12;
    *(_OWORD *)a2 = v11;
    *(unsigned char *)(a2 + 16) = v9;
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

uint64_t sub_2193DB730@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ASCPublicKeyCredentialAssertionExtensionOutputs.LargeBlob.init(from:)(a1, a2);
}

uint64_t sub_2193DB748(void *a1)
{
  return ASCPublicKeyCredentialAssertionExtensionOutputs.LargeBlob.encode(to:)(a1);
}

uint64_t sub_2193DB764()
{
  if (*v0) {
    return 0x32746572636573;
  }
  else {
    return 0x31746572636573;
  }
}

uint64_t sub_2193DB798@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2193DE8F4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2193DB7C0(uint64_t a1)
{
  unint64_t v2 = sub_2193DCE50();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2193DB7FC(uint64_t a1)
{
  unint64_t v2 = sub_2193DCE50();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ASCPublicKeyCredentialAssertionExtensionOutputs.PRF.secret1.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2193E26A0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t ASCPublicKeyCredentialAssertionExtensionOutputs.PRF.secret2.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for ASCPublicKeyCredentialAssertionExtensionOutputs.PRF(0);
  return sub_219360574(v1 + *(int *)(v3 + 20), a1, &qword_267C19320);
}

uint64_t ASCPublicKeyCredentialAssertionExtensionOutputs.PRF.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v32 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C19320);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2193E26A0();
  uint64_t v33 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C1A448);
  uint64_t v34 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  long long v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_2193DCE50();
  uint64_t v12 = v35;
  sub_2193E3240();
  if (!v12)
  {
    uint64_t v31 = v8;
    uint64_t v35 = v6;
    char v38 = 0;
    sub_21934D774();
    sub_2193E3010();
    uint64_t v14 = v36;
    unint64_t v13 = v37;
    char v38 = 1;
    sub_2193E2FE0();
    uint64_t v30 = v9;
    uint64_t v15 = v36;
    unint64_t v16 = v37;
    uint64_t v36 = v14;
    unint64_t v37 = v13;
    sub_21934CDF0(v14, v13);
    sub_2193E2680();
    unint64_t v28 = v13;
    unint64_t v29 = v11;
    uint64_t v27 = v14;
    if (v16 >> 60 == 15)
    {
      uint64_t v17 = 1;
      uint64_t v18 = v32;
      uint64_t v19 = v15;
      uint64_t v20 = (uint64_t)v5;
    }
    else
    {
      uint64_t v36 = v15;
      unint64_t v37 = v16;
      sub_21934CDF0(v15, v16);
      uint64_t v19 = v15;
      uint64_t v20 = (uint64_t)v5;
      sub_2193E2680();
      uint64_t v17 = 0;
      uint64_t v18 = v32;
    }
    uint64_t v22 = v34;
    uint64_t v21 = v35;
    uint64_t v23 = v33;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v33 + 56))(v20, v17, 1, v35);
    sub_219348A70(v27, v28);
    (*(void (**)(char *, uint64_t))(v22 + 8))(v29, v30);
    sub_21934CEB0(v19, v16);
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(v18, v31, v21);
    uint64_t v24 = type metadata accessor for ASCPublicKeyCredentialAssertionExtensionOutputs.PRF(0);
    sub_21937EC68(v20, v18 + *(int *)(v24 + 20));
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

uint64_t ASCPublicKeyCredentialAssertionExtensionOutputs.PRF.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C19320);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v23 = (uint64_t)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C1A458);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_2193DCE50();
  sub_2193E3260();
  uint64_t v22 = v3;
  sub_2193E2670();
  uint64_t v12 = v24;
  unint64_t v11 = v25;
  char v26 = 0;
  sub_21934D644();
  sub_2193E30D0();
  sub_219348A70(v12, v11);
  if (v2) {
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  uint64_t v21 = v8;
  uint64_t v14 = type metadata accessor for ASCPublicKeyCredentialAssertionExtensionOutputs.PRF(0);
  uint64_t v15 = v23;
  sub_219360574(v22 + *(int *)(v14 + 20), v23, &qword_267C19320);
  uint64_t v16 = sub_2193E26A0();
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) == 1)
  {
    sub_219360620(v15, &qword_267C19320);
    uint64_t v18 = 0;
    unint64_t v19 = 0xF000000000000000;
  }
  else
  {
    sub_2193E2670();
    uint64_t v18 = v24;
    unint64_t v19 = v25;
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v15, v16);
  }
  uint64_t v24 = v18;
  unint64_t v25 = v19;
  char v26 = 1;
  sub_2193E30A0();
  sub_21934CEB0(v18, v19);
  return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v10, v7);
}

uint64_t sub_2193DBFE4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ASCPublicKeyCredentialAssertionExtensionOutputs.PRF.init(from:)(a1, a2);
}

uint64_t sub_2193DBFFC(void *a1)
{
  return ASCPublicKeyCredentialAssertionExtensionOutputs.PRF.encode(to:)(a1);
}

uint64_t sub_2193DC014(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C19320);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7[0] = 0;
  v7[1] = 0xE000000000000000;
  sub_2193E2920();
  sub_2193E26A0();
  sub_2193E2E60();
  sub_2193E2920();
  sub_219360574(v1 + *(int *)(a1 + 20), (uint64_t)v5, &qword_267C19320);
  sub_2193E2890();
  sub_2193E2920();
  swift_bridgeObjectRelease();
  return v7[0];
}

uint64_t sub_2193DC12C(uint64_t a1)
{
  unint64_t v2 = sub_2193DCEA4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2193DC168(uint64_t a1)
{
  unint64_t v2 = sub_2193DCEA4();

  return MEMORY[0x270FA00B8](a1, v2);
}

id ASCPublicKeyCredentialAssertionExtensionOutputs.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ASCPublicKeyCredentialAssertionExtensionOutputs(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2193DC22C(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C199B8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C1A460);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_2193DCEA4();
  sub_2193E3260();
  uint64_t v12 = (long long *)(v3
                   + OBJC_IVAR____TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs_largeBlob);
  swift_beginAccess();
  char v13 = *((unsigned char *)v12 + 16);
  long long v16 = *v12;
  char v17 = v13;
  char v18 = 0;
  sub_2193DCEF8();
  sub_2193E30A0();
  if (!v2)
  {
    uint64_t v14 = v3 + OBJC_IVAR____TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs_prf;
    swift_beginAccess();
    sub_219360574(v14, (uint64_t)v7, &qword_267C199B8);
    char v18 = 1;
    type metadata accessor for ASCPublicKeyCredentialAssertionExtensionOutputs.PRF(0);
    sub_2193D9444(&qword_267C1A478, (void (*)(uint64_t))type metadata accessor for ASCPublicKeyCredentialAssertionExtensionOutputs.PRF);
    sub_2193E30A0();
    sub_219360620((uint64_t)v7, &qword_267C199B8);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

id ASCPublicKeyCredentialAssertionExtensionOutputs.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return ASCPublicKeyCredentialAssertionExtensionOutputs.init(from:)(a1);
}

id ASCPublicKeyCredentialAssertionExtensionOutputs.init(from:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C199B8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C1A480);
  uint64_t v29 = *(void *)(v7 - 8);
  uint64_t v30 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = &v1[OBJC_IVAR____TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs_largeBlob];
  *(void *)uint64_t v10 = 0;
  *((void *)v10 + 1) = 0;
  v10[16] = -1;
  unint64_t v11 = &v1[OBJC_IVAR____TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs_prf];
  uint64_t v12 = type metadata accessor for ASCPublicKeyCredentialAssertionExtensionOutputs.PRF(0);
  char v13 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
  uint64_t v33 = v11;
  v13(v11, 1, 1, v12);
  uint64_t v14 = a1[3];
  uint64_t v32 = a1;
  __swift_project_boxed_opaque_existential_1Tm(a1, v14);
  sub_2193DCEA4();
  id v15 = v2;
  uint64_t v31 = v9;
  uint64_t v16 = v39;
  sub_2193E3240();
  if (v16)
  {
    id v27 = v33;
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v32);
    sub_2193A8E2C(*(void *)v10, *((void *)v10 + 1), v10[16]);
    sub_219360620((uint64_t)v27, &qword_267C199B8);

    type metadata accessor for ASCPublicKeyCredentialAssertionExtensionOutputs(0);
    swift_deallocPartialClassInstance();
  }
  else
  {
    char v38 = 0;
    sub_2193DCF4C();
    sub_2193E2FE0();
    uint64_t v17 = v35;
    uint64_t v18 = v36;
    char v19 = v37;
    swift_beginAccess();
    uint64_t v20 = *(void *)v10;
    unint64_t v21 = *((void *)v10 + 1);
    *(void *)uint64_t v10 = v17;
    *((void *)v10 + 1) = v18;
    uint64_t v22 = v30;
    unsigned __int8 v23 = v10[16];
    v10[16] = v19;
    sub_2193A8E2C(v20, v21, v23);
    LOBYTE(v35) = 1;
    sub_2193D9444((unint64_t *)&unk_267C1A490, (void (*)(uint64_t))type metadata accessor for ASCPublicKeyCredentialAssertionExtensionOutputs.PRF);
    sub_2193E2FE0();
    uint64_t v25 = (uint64_t)v33;
    swift_beginAccess();
    sub_2193DCBF0((uint64_t)v6, v25);
    swift_endAccess();

    char v26 = (objc_class *)type metadata accessor for ASCPublicKeyCredentialAssertionExtensionOutputs(0);
    v34.receiver = v15;
    v34.super_class = v26;
    id v27 = objc_msgSendSuper2(&v34, sel_init);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v31, v22);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v32);
  }
  return v27;
}

id sub_2193DC8A8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v5 = objc_allocWithZone((Class)type metadata accessor for ASCPublicKeyCredentialAssertionExtensionOutputs(0));
  id result = ASCPublicKeyCredentialAssertionExtensionOutputs.init(from:)(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_2193DC900(void *a1)
{
  return sub_2193DC22C(a1);
}

id sub_2193DC924(uint64_t a1)
{
  uint64_t v2 = a1;
  uint64_t v19 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C199B8);
  MEMORY[0x270FA5388](v3 - 8);
  id v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = &v1[OBJC_IVAR____TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs_largeBlob];
  *(void *)uint64_t v6 = 0;
  *((void *)v6 + 1) = 0;
  v6[16] = -1;
  uint64_t v7 = (uint64_t)&v1[OBJC_IVAR____TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs_prf];
  uint64_t v8 = type metadata accessor for ASCPublicKeyCredentialAssertionExtensionOutputs.PRF(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  uint64_t v9 = v2 + OBJC_IVAR____TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs_largeBlob;
  swift_beginAccess();
  uint64_t v10 = *(void *)v9;
  unint64_t v11 = *(void *)(v9 + 8);
  LOBYTE(v9) = *(unsigned char *)(v9 + 16);
  swift_beginAccess();
  uint64_t v13 = *(void *)v6;
  unint64_t v12 = *((void *)v6 + 1);
  *(void *)uint64_t v6 = v10;
  *((void *)v6 + 1) = v11;
  LOBYTE(v2) = v6[16];
  v6[16] = v9;
  uint64_t v14 = v1;
  sub_2193DCBD8(v10, v11, v9);
  sub_2193A8E2C(v13, v12, v2);
  uint64_t v15 = v19 + OBJC_IVAR____TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs_prf;
  swift_beginAccess();
  sub_219360574(v15, (uint64_t)v5, &qword_267C199B8);
  swift_beginAccess();
  sub_2193DCBF0((uint64_t)v5, v7);
  swift_endAccess();

  uint64_t v16 = (objc_class *)type metadata accessor for ASCPublicKeyCredentialAssertionExtensionOutputs(0);
  v20.receiver = v14;
  v20.super_class = v16;
  return objc_msgSendSuper2(&v20, sel_init);
}

uint64_t sub_2193DCB0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ASCPublicKeyCredentialAssertionExtensionOutputs.PRF(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2193DCB70(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ASCPublicKeyCredentialAssertionExtensionOutputs.PRF(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2193DCBCC(uint64_t a1, unint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return sub_21934CE48(a1, a2);
  }
  return a1;
}

uint64_t sub_2193DCBD8(uint64_t result, unint64_t a2, unsigned __int8 a3)
{
  if (a3 != 255) {
    return sub_2193DCBCC(result, a2, a3 & 1);
  }
  return result;
}

uint64_t sub_2193DCBF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C199B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_2193DCC58()
{
  unint64_t result = qword_267C1A3E8;
  if (!qword_267C1A3E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C1A3E8);
  }
  return result;
}

unint64_t sub_2193DCCAC()
{
  unint64_t result = qword_267C1A3F0;
  if (!qword_267C1A3F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C1A3F0);
  }
  return result;
}

unint64_t sub_2193DCD00()
{
  unint64_t result = qword_267C1A3F8;
  if (!qword_267C1A3F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C1A3F8);
  }
  return result;
}

unint64_t sub_2193DCD54()
{
  unint64_t result = qword_267C1A428;
  if (!qword_267C1A428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C1A428);
  }
  return result;
}

unint64_t sub_2193DCDA8()
{
  unint64_t result = qword_267C1A430;
  if (!qword_267C1A430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C1A430);
  }
  return result;
}

unint64_t sub_2193DCDFC()
{
  unint64_t result = qword_267C1A440;
  if (!qword_267C1A440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C1A440);
  }
  return result;
}

unint64_t sub_2193DCE50()
{
  unint64_t result = qword_267C1A450;
  if (!qword_267C1A450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C1A450);
  }
  return result;
}

unint64_t sub_2193DCEA4()
{
  unint64_t result = qword_267C1A468;
  if (!qword_267C1A468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C1A468);
  }
  return result;
}

unint64_t sub_2193DCEF8()
{
  unint64_t result = qword_267C1A470;
  if (!qword_267C1A470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C1A470);
  }
  return result;
}

unint64_t sub_2193DCF4C()
{
  unint64_t result = qword_267C1A488;
  if (!qword_267C1A488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C1A488);
  }
  return result;
}

uint64_t sub_2193DCFA8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs_prf;
  swift_beginAccess();
  return sub_219360574(v3, a2, &qword_267C199B8);
}

uint64_t sub_2193DD00C()
{
  return type metadata accessor for ASCPublicKeyCredentialAssertionExtensionOutputs(0);
}

void sub_2193DD014()
{
  sub_2193DE050(319, (unint64_t *)&unk_267C1A4B0, (void (*)(uint64_t))type metadata accessor for ASCPublicKeyCredentialAssertionExtensionOutputs.PRF);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for ASCPublicKeyCredentialAssertionExtensionOutputs(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ASCPublicKeyCredentialAssertionExtensionOutputs);
}

uint64_t dispatch thunk of ASCPublicKeyCredentialAssertionExtensionOutputs.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of ASCPublicKeyCredentialAssertionExtensionOutputs.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of ASCPublicKeyCredentialAssertionExtensionOutputs.largeBlob.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of ASCPublicKeyCredentialAssertionExtensionOutputs.largeBlob.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of ASCPublicKeyCredentialAssertionExtensionOutputs.largeBlob.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of ASCPublicKeyCredentialAssertionExtensionOutputs.prf.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of ASCPublicKeyCredentialAssertionExtensionOutputs.prf.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of ASCPublicKeyCredentialAssertionExtensionOutputs.prf.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of ASCPublicKeyCredentialAssertionExtensionOutputs.encode(to:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of ASCPublicKeyCredentialAssertionExtensionOutputs.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 184))();
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for ASCPublicKeyCredentialAssertionExtensionOutputs.LargeBlob()
{
  return &type metadata for ASCPublicKeyCredentialAssertionExtensionOutputs.LargeBlob;
}

uint64_t destroy for ASCPublicKeyCredentialAssertionExtensionOutputs.LargeBlob.OperationResult(uint64_t a1)
{
  return sub_2193A8E44(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputsC9LargeBlobV15OperationResultOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_2193DCBCC(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputsC9LargeBlobV15OperationResultOwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_2193DCBCC(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  unint64_t v7 = *(void *)(a1 + 8);
  char v8 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_2193A8E44(v6, v7, v8);
  return a1;
}

uint64_t _s26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputsC9LargeBlobV15OperationResultOwta_0(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  unint64_t v5 = *(void *)(a1 + 8);
  char v6 = *(unsigned char *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_2193A8E44(v4, v5, v6);
  return a1;
}

uint64_t _s26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputsC9LargeBlobV15OperationResultOwet_0(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t _s26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputsC9LargeBlobV15OperationResultOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_2193DD494(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_2193DD49C(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ASCPublicKeyCredentialAssertionExtensionOutputs.LargeBlob.OperationResult()
{
  return &type metadata for ASCPublicKeyCredentialAssertionExtensionOutputs.LargeBlob.OperationResult;
}

uint64_t *initializeBufferWithCopyOfBuffer for ASCPublicKeyCredentialAssertionExtensionOutputs.PRF(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2193E26A0();
    uint64_t v8 = *(void *)(v7 - 8);
    uint64_t v9 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16);
    v9(a1, a2, v7);
    uint64_t v10 = *(int *)(a3 + 20);
    unint64_t v11 = (char *)a1 + v10;
    unint64_t v12 = (char *)a2 + v10;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v12, 1, v7))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C19320);
      memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      v9((uint64_t *)v11, (uint64_t *)v12, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v11, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t destroy for ASCPublicKeyCredentialAssertionExtensionOutputs.PRF(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2193E26A0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v8(a1, v4);
  uint64_t v6 = a1 + *(int *)(a2 + 20);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v6, 1, v4);
  if (!result)
  {
    return ((uint64_t (*)(uint64_t, uint64_t))v8)(v6, v4);
  }
  return result;
}

char *initializeWithCopy for ASCPublicKeyCredentialAssertionExtensionOutputs.PRF(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_2193E26A0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 16);
  v8(a1, a2, v6);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = &a1[v9];
  unint64_t v11 = &a2[v9];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v11, 1, v6))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C19320);
    memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    v8(v10, v11, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
  }
  return a1;
}

char *assignWithCopy for ASCPublicKeyCredentialAssertionExtensionOutputs.PRF(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_2193E26A0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = &a1[v9];
  unint64_t v11 = &a2[v9];
  uint64_t v12 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  int v13 = v12(&a1[v9], 1, v6);
  int v14 = v12(v11, 1, v6);
  if (!v13)
  {
    if (!v14)
    {
      v8(v10, v11, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C19320);
    memcpy(v10, v11, *(void *)(*(void *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v11, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
  return a1;
}

char *initializeWithTake for ASCPublicKeyCredentialAssertionExtensionOutputs.PRF(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_2193E26A0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 32);
  v8(a1, a2, v6);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = &a1[v9];
  unint64_t v11 = &a2[v9];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v11, 1, v6))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C19320);
    memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    v8(v10, v11, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
  }
  return a1;
}

char *assignWithTake for ASCPublicKeyCredentialAssertionExtensionOutputs.PRF(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_2193E26A0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = &a1[v9];
  unint64_t v11 = &a2[v9];
  uint64_t v12 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  int v13 = v12(&a1[v9], 1, v6);
  int v14 = v12(v11, 1, v6);
  if (!v13)
  {
    if (!v14)
    {
      v8(v10, v11, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C19320);
    memcpy(v10, v11, *(void *)(*(void *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v11, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ASCPublicKeyCredentialAssertionExtensionOutputs.PRF(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2193DDD54);
}

uint64_t sub_2193DDD54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2193E26A0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C19320);
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t storeEnumTagSinglePayload for ASCPublicKeyCredentialAssertionExtensionOutputs.PRF(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2193DDE64);
}

uint64_t sub_2193DDE64(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_2193E26A0();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C19320);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

void sub_2193DDF6C()
{
  sub_2193E26A0();
  if (v0 <= 0x3F)
  {
    sub_2193DE050(319, &qword_267C193C0, MEMORY[0x263F04620]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_2193DE050(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_2193E2BB0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

ValueMetadata *type metadata accessor for ASCPublicKeyCredentialAssertionExtensionOutputs.CodingKeys()
{
  return &type metadata for ASCPublicKeyCredentialAssertionExtensionOutputs.CodingKeys;
}

ValueMetadata *type metadata accessor for ASCPublicKeyCredentialAssertionExtensionOutputs.PRF.CodingKeys()
{
  return &type metadata for ASCPublicKeyCredentialAssertionExtensionOutputs.PRF.CodingKeys;
}

ValueMetadata *type metadata accessor for ASCPublicKeyCredentialAssertionExtensionOutputs.LargeBlob.CodingKeys()
{
  return &type metadata for ASCPublicKeyCredentialAssertionExtensionOutputs.LargeBlob.CodingKeys;
}

unsigned char *_s26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputsC10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x2193DE1A8);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ASCPublicKeyCredentialAssertionExtensionOutputs.LargeBlob.OperationResult.CodingKeys()
{
  return &type metadata for ASCPublicKeyCredentialAssertionExtensionOutputs.LargeBlob.OperationResult.CodingKeys;
}

ValueMetadata *type metadata accessor for ASCPublicKeyCredentialAssertionExtensionOutputs.LargeBlob.OperationResult.ReadCodingKeys()
{
  return &type metadata for ASCPublicKeyCredentialAssertionExtensionOutputs.LargeBlob.OperationResult.ReadCodingKeys;
}

unsigned char *_s26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputsC9LargeBlobV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2193DE28CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ASCPublicKeyCredentialAssertionExtensionOutputs.LargeBlob.OperationResult.WriteCodingKeys()
{
  return &type metadata for ASCPublicKeyCredentialAssertionExtensionOutputs.LargeBlob.OperationResult.WriteCodingKeys;
}

unint64_t sub_2193DE2C8()
{
  unint64_t result = qword_267C1A4D0;
  if (!qword_267C1A4D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C1A4D0);
  }
  return result;
}

unint64_t sub_2193DE320()
{
  unint64_t result = qword_267C1A4D8;
  if (!qword_267C1A4D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C1A4D8);
  }
  return result;
}

unint64_t sub_2193DE378()
{
  unint64_t result = qword_267C1A4E0;
  if (!qword_267C1A4E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C1A4E0);
  }
  return result;
}

unint64_t sub_2193DE3D0()
{
  unint64_t result = qword_267C1A4E8;
  if (!qword_267C1A4E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C1A4E8);
  }
  return result;
}

unint64_t sub_2193DE428()
{
  unint64_t result = qword_267C1A4F0;
  if (!qword_267C1A4F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C1A4F0);
  }
  return result;
}

unint64_t sub_2193DE480()
{
  unint64_t result = qword_267C1A4F8;
  if (!qword_267C1A4F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C1A4F8);
  }
  return result;
}

unint64_t sub_2193DE4D8()
{
  unint64_t result = qword_267C1A500;
  if (!qword_267C1A500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C1A500);
  }
  return result;
}

unint64_t sub_2193DE530()
{
  unint64_t result = qword_267C1A508;
  if (!qword_267C1A508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C1A508);
  }
  return result;
}

unint64_t sub_2193DE588()
{
  unint64_t result = qword_267C1A510;
  if (!qword_267C1A510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C1A510);
  }
  return result;
}

unint64_t sub_2193DE5E0()
{
  unint64_t result = qword_267C1A518;
  if (!qword_267C1A518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C1A518);
  }
  return result;
}

unint64_t sub_2193DE638()
{
  unint64_t result = qword_267C1A520;
  if (!qword_267C1A520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C1A520);
  }
  return result;
}

unint64_t sub_2193DE690()
{
  unint64_t result = qword_267C1A528;
  if (!qword_267C1A528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C1A528);
  }
  return result;
}

unint64_t sub_2193DE6E8()
{
  unint64_t result = qword_267C1A530;
  if (!qword_267C1A530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C1A530);
  }
  return result;
}

unint64_t sub_2193DE740()
{
  unint64_t result = qword_267C1A538;
  if (!qword_267C1A538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C1A538);
  }
  return result;
}

unint64_t sub_2193DE798()
{
  unint64_t result = qword_267C1A540;
  if (!qword_267C1A540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C1A540);
  }
  return result;
}

unint64_t sub_2193DE7F0()
{
  unint64_t result = qword_267C1A548;
  if (!qword_267C1A548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C1A548);
  }
  return result;
}

unint64_t sub_2193DE848()
{
  unint64_t result = qword_267C1A550;
  if (!qword_267C1A550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C1A550);
  }
  return result;
}

unint64_t sub_2193DE8A0()
{
  unint64_t result = qword_267C1A558;
  if (!qword_267C1A558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C1A558);
  }
  return result;
}

uint64_t sub_2193DE8F4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x31746572636573 && a2 == 0xE700000000000000;
  if (v2 || (sub_2193E3140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x32746572636573 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_2193E3140();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t SymmetricKey.rawData.getter()
{
  sub_2193E2670();
  return v1;
}

Swift::String __swiftcall SymmetricKey.hexString()()
{
  sub_2193E2670();
  uint64_t v0 = sub_2193E2050();
  BOOL v2 = v1;
  sub_219348A70(v6, v7);
  uint64_t v3 = v0;
  unsigned int v4 = v2;
  result._object = v4;
  result._countAndFlagsBits = v3;
  return result;
}

uint64_t sub_2193DEAC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  v14[3] = MEMORY[0x263F8D3E8];
  v14[4] = MEMORY[0x263F07B80];
  v14[0] = a1;
  v14[1] = a2;
  unsigned int v4 = __swift_project_boxed_opaque_existential_1Tm(v14, MEMORY[0x263F8D3E8]);
  uint64_t v5 = (unsigned char *)*v4;
  if (*v4 && (uint64_t v6 = (unsigned char *)v4[1], v7 = v6 - v5, v6 != v5))
  {
    if (v7 <= 14)
    {
      uint64_t v8 = sub_2193A2A18(v5, v6);
      unint64_t v9 = v12 & 0xFFFFFFFFFFFFFFLL;
    }
    else if ((unint64_t)v7 >= 0x7FFFFFFF)
    {
      uint64_t v8 = sub_2193A2ADC((uint64_t)v5, (uint64_t)v6);
      unint64_t v9 = v13 | 0x8000000000000000;
    }
    else
    {
      uint64_t v8 = sub_2193A2B58((uint64_t)v5, (uint64_t)v6);
      unint64_t v9 = v11 | 0x4000000000000000;
    }
  }
  else
  {
    uint64_t v8 = 0;
    unint64_t v9 = 0xC000000000000000;
  }
  uint64_t result = __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v14);
  *a3 = v8;
  a3[1] = v9;
  return result;
}

uint64_t UnsignedInteger<>.init<A>(littleEndianSequence:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X3>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v37 = a6;
  char v38 = a4;
  uint64_t v34 = a1;
  uint64_t v9 = *(void *)(a2 - 8);
  uint64_t v31 = a5;
  uint64_t v32 = v9;
  uint64_t v10 = MEMORY[0x270FA5388](a1);
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v27 - v14;
  uint64_t v33 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v29 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v28 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v19 = (char *)&v27 - v18;
  uint64_t v36 = *(void *)(*((void *)a4 + 1) + 24);
  uint64_t v20 = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](v20);
  swift_getAssociatedConformanceWitness();
  sub_2193E3160();
  sub_2193E3110();
  uint64_t v35 = sub_2193E2E90();
  (*(void (**)(char *, uint64_t, uint64_t))(v33 + 16))(v29, v34, a3);
  char v38 = v19;
  sub_2193E29D0();
  uint64_t v31 = a3;
  uint64_t v21 = AssociatedTypeWitness;
  swift_getAssociatedConformanceWitness();
  uint64_t v22 = 0;
  unsigned __int8 v23 = (void (**)(char *, uint64_t))(v32 + 8);
  while (1)
  {
    sub_2193E2BF0();
    if (v42)
    {
LABEL_5:
      (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v34, v31);
      return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v38, v21);
    }
    char v40 = v41;
    sub_2193DEFBC();
    sub_2193E2CA0();
    uint64_t v39 = v22;
    sub_2193DF010();
    sub_2193E2C50();
    uint64_t v24 = *v23;
    (*v23)(v12, a2);
    sub_2193E2F00();
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v24)(v15, a2);
    uint64_t v26 = v22 + 8;
    if (__OFADD__(v22, 8)) {
      break;
    }
    v22 += 8;
    if (v26 >= v35) {
      goto LABEL_5;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_2193DEFBC()
{
  unint64_t result = qword_267C1A560;
  if (!qword_267C1A560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C1A560);
  }
  return result;
}

unint64_t sub_2193DF010()
{
  unint64_t result = qword_267C1A568;
  if (!qword_267C1A568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C1A568);
  }
  return result;
}

uint64_t UnsignedInteger<>.littleEndianData(preservingWidth:)(int a1, uint64_t a2, uint64_t a3)
{
  int v53 = a1;
  uint64_t v67 = *MEMORY[0x263EF8340];
  uint64_t v52 = a3;
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 8) + 24) + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  v60 = (char *)&v52 - v7;
  uint64_t v8 = *(void *)(a2 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  v55 = (char *)&v52 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v56 = (char *)&v52 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v52 - v17;
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v21 = (char *)&v52 - v20;
  MEMORY[0x270FA5388](v19);
  long long v66 = xmmword_2193E7210;
  uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  v63 = (char *)&v52 - v23;
  v58 = v22;
  ((void (*)(char *))v22)((char *)&v52 - v23);
  uint64_t v61 = AssociatedTypeWitness;
  uint64_t v62 = v4;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v59 = v8 + 16;
  uint64_t v24 = (void (**)(char *, uint64_t))(v8 + 8);
  v54 = v11;
  do
  {
    while (1)
    {
      sub_2193E3160();
      sub_2193E3110();
      sub_2193E2C40();
      uint64_t v26 = *v24;
      (*v24)(v18, a2);
      if (sub_2193E2C90())
      {
        sub_2193E3160();
        sub_2193E3110();
        char v27 = sub_2193E2810();
        v26(v18, a2);
        if ((v27 & 1) == 0)
        {
LABEL_40:
          sub_2193E2EE0();
          __break(1u);
          JUMPOUT(0x2193DF90CLL);
        }
      }
      uint64_t v28 = sub_2193E2C80();
      uint64_t v29 = v55;
      if (v28 >= 8)
      {
        v58(v56, v21, a2);
        LOBYTE(v65[0]) = -1;
        char v30 = sub_2193E2C90();
        uint64_t v31 = sub_2193E2C80();
        if (v30)
        {
          if (v31 <= 8)
          {
            sub_2193E3160();
            sub_2193E3110();
            uint64_t v32 = v56;
            char v33 = sub_2193E27F0();
            v26(v18, a2);
            unsigned int v34 = LOBYTE(v65[0]);
            v58(v29, v32, a2);
            if (v33)
            {
              unsigned __int8 v35 = sub_2193E2C70();
              v26(v29, a2);
              BOOL v36 = v34 >= v35;
              uint64_t v37 = v56;
              uint64_t v11 = v54;
              if (!v36) {
                goto LABEL_40;
              }
              goto LABEL_17;
            }
            v26(v29, a2);
            uint64_t v37 = v56;
LABEL_16:
            uint64_t v11 = v54;
LABEL_17:
            v26(v37, a2);
            goto LABEL_18;
          }
        }
        else if (v31 < 9)
        {
          uint64_t v37 = v56;
          sub_2193E2C70();
          goto LABEL_16;
        }
        sub_2193DEFBC();
        sub_2193E2C30();
        uint64_t v37 = v56;
        char v38 = sub_2193E2800();
        v26(v18, a2);
        uint64_t v11 = v54;
        if (v38) {
          goto LABEL_40;
        }
        goto LABEL_17;
      }
LABEL_18:
      char v39 = sub_2193E2C70();
      v26(v21, a2);
      uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C199D8);
      v65[3] = v40;
      v65[4] = sub_2193DF92C();
      LOBYTE(v65[0]) = v39;
      char v64 = *(unsigned char *)__swift_project_boxed_opaque_existential_1Tm(v65, v40);
      sub_2193E20D0();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v65);
      v65[0] = 8;
      sub_2193DF010();
      char v41 = v63;
      sub_2193E2C60();
      v58(v11, v41, a2);
      LOBYTE(v41) = sub_2193E2C90();
      uint64_t v42 = sub_2193E2C80();
      if (v41) {
        break;
      }
      if (v42 > 63) {
        goto LABEL_22;
      }
LABEL_2:
      uint64_t v25 = sub_2193E2C70();
      v26(v11, a2);
      if (v25 <= 0) {
        goto LABEL_23;
      }
    }
    if (v42 <= 64) {
      goto LABEL_2;
    }
LABEL_22:
    v65[0] = 0;
    sub_2193E2C30();
    char v43 = sub_2193E2800();
    v26(v18, a2);
    v26(v11, a2);
  }
  while ((v43 & 1) != 0);
LABEL_23:
  if (v53)
  {
    uint64_t v44 = sub_2193E2E90();
    uint64_t v45 = v44 / 8;
    if (v44 >= 0 && (v44 & 0x8000000000000007) != 0) {
      ++v45;
    }
    uint64_t v46 = 0;
    switch(*((void *)&v66 + 1) >> 62)
    {
      case 1:
        LODWORD(v46) = DWORD1(v66) - v66;
        if (__OFSUB__(DWORD1(v66), v66)) {
          goto LABEL_38;
        }
        uint64_t v46 = (int)v46;
LABEL_31:
        int64_t v50 = v45 - v46;
        if (__OFSUB__(v45, v46))
        {
          __break(1u);
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
        }
        if (v50 >= 1)
        {
          if (*(void *)(sub_2193DF988(0, v50) + 16)) {
            sub_2193E20E0();
          }
          swift_bridgeObjectRelease();
        }
        break;
      case 2:
        uint64_t v48 = *(void *)(v66 + 16);
        uint64_t v47 = *(void *)(v66 + 24);
        BOOL v49 = __OFSUB__(v47, v48);
        uint64_t v46 = v47 - v48;
        if (!v49) {
          goto LABEL_31;
        }
        goto LABEL_39;
      case 3:
        goto LABEL_31;
      default:
        uint64_t v46 = BYTE14(v66);
        goto LABEL_31;
    }
  }
  v26(v63, a2);
  return v66;
}

unint64_t sub_2193DF92C()
{
  unint64_t result = qword_267C199E0;
  if (!qword_267C199E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267C199D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C199E0);
  }
  return result;
}

uint64_t sub_2193DF988(int a1, size_t a2)
{
  if ((a2 & 0x8000000000000000) != 0)
  {
    uint64_t result = sub_2193E2EE0();
    __break(1u);
  }
  else
  {
    if (!a2) {
      return MEMORY[0x263F8EE78];
    }
    uint64_t v4 = sub_2193E2A30();
    *(void *)(v4 + 16) = a2;
    memset((void *)(v4 + 32), a1, a2);
    return v4;
  }
  return result;
}

void isClientWithAuditTokenProperlyEntitled_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_219326000, log, OS_LOG_TYPE_FAULT, "Rejecting connection from unentitled process.", v1, 2u);
}

void __getWBUFeatureManagerClass_block_invoke_cold_1(void *a1)
{
  BOOL v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *WebUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"ASFeatureManager.m", 28, @"%s", *a1);

  __break(1u);
}

void __getWBUFeatureManagerClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getWBUFeatureManagerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"ASFeatureManager.m", 29, @"Unable to find class %s", "WBUFeatureManager");

  __break(1u);
}

uint64_t sub_2193E1CA0()
{
  return MEMORY[0x270EEDAD8]();
}

uint64_t sub_2193E1CB0()
{
  return MEMORY[0x270EEDB70]();
}

uint64_t sub_2193E1CC0()
{
  return MEMORY[0x270EEDBF8]();
}

uint64_t sub_2193E1CD0()
{
  return MEMORY[0x270EEDC50]();
}

uint64_t sub_2193E1CE0()
{
  return MEMORY[0x270EEDC80]();
}

uint64_t sub_2193E1CF0()
{
  return MEMORY[0x270EEDCA0]();
}

uint64_t sub_2193E1D00()
{
  return MEMORY[0x270EEDCB8]();
}

uint64_t sub_2193E1D10()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_2193E1D20()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_2193E1D30()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_2193E1D40()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_2193E1D50()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_2193E1D60()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_2193E1D70()
{
  return MEMORY[0x270EEE520]();
}

uint64_t sub_2193E1D80()
{
  return MEMORY[0x270EEE548]();
}

uint64_t sub_2193E1D90()
{
  return MEMORY[0x270EEE568]();
}

uint64_t sub_2193E1DA0()
{
  return MEMORY[0x270EEE5B8]();
}

uint64_t sub_2193E1DB0()
{
  return MEMORY[0x270EEE5F8]();
}

uint64_t sub_2193E1DC0()
{
  return MEMORY[0x270EEE610]();
}

uint64_t sub_2193E1DD0()
{
  return MEMORY[0x270EEE618]();
}

uint64_t sub_2193E1DE0()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_2193E1DF0()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_2193E1E00()
{
  return MEMORY[0x270EEE648]();
}

uint64_t sub_2193E1E10()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_2193E1E20()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_2193E1E30()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_2193E1E40()
{
  return MEMORY[0x270EEEA60]();
}

uint64_t sub_2193E1E90()
{
  return MEMORY[0x270EEF238]();
}

uint64_t sub_2193E1EA0()
{
  return MEMORY[0x270EEF250]();
}

uint64_t sub_2193E1EB0()
{
  return MEMORY[0x270EEF268]();
}

uint64_t sub_2193E1EC0()
{
  return MEMORY[0x270EEF288]();
}

uint64_t sub_2193E1ED0()
{
  return MEMORY[0x270EEF2A8]();
}

uint64_t sub_2193E1EE0()
{
  return MEMORY[0x270EEF2B8]();
}

uint64_t sub_2193E1F50()
{
  return MEMORY[0x270EEF800]();
}

uint64_t sub_2193E1F60()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_2193E1F70()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_2193E1F80()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_2193E1F90()
{
  return MEMORY[0x270EEFDF0]();
}

uint64_t sub_2193E1FA0()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_2193E1FB0()
{
  return MEMORY[0x270EEFE50]();
}

uint64_t sub_2193E1FC0()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_2193E1FD0()
{
  return MEMORY[0x270EEFEE0]();
}

uint64_t sub_2193E1FE0()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_2193E1FF0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2193E2000()
{
  return MEMORY[0x270EEFFB0]();
}

uint64_t sub_2193E2010()
{
  return MEMORY[0x270F5C260]();
}

uint64_t sub_2193E2020()
{
  return MEMORY[0x270F5C268]();
}

uint64_t sub_2193E2030()
{
  return MEMORY[0x270F5C270]();
}

uint64_t sub_2193E2040()
{
  return MEMORY[0x270F5C278]();
}

uint64_t sub_2193E2050()
{
  return MEMORY[0x270F5C280]();
}

uint64_t sub_2193E2060()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_2193E2070()
{
  return MEMORY[0x270F12B30]();
}

uint64_t sub_2193E2080()
{
  return MEMORY[0x270EF0000]();
}

uint64_t sub_2193E2090()
{
  return MEMORY[0x270EF0020]();
}

uint64_t sub_2193E20A0()
{
  return MEMORY[0x270EF0060]();
}

uint64_t sub_2193E20B0()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_2193E20C0()
{
  return MEMORY[0x270EF0078]();
}

uint64_t sub_2193E20D0()
{
  return MEMORY[0x270EF0090]();
}

uint64_t sub_2193E20E0()
{
  return MEMORY[0x270EF00B0]();
}

uint64_t sub_2193E20F0()
{
  return MEMORY[0x270EF00D0]();
}

uint64_t sub_2193E2100()
{
  return MEMORY[0x270EF00E8]();
}

uint64_t sub_2193E2110()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_2193E2120()
{
  return MEMORY[0x270EF0130]();
}

uint64_t sub_2193E2130()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_2193E2140()
{
  return MEMORY[0x270EF0190]();
}

uint64_t sub_2193E2150()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t sub_2193E2160()
{
  return MEMORY[0x270EF0238]();
}

uint64_t sub_2193E2170()
{
  return MEMORY[0x270EF0248]();
}

uint64_t sub_2193E2180()
{
  return MEMORY[0x270EF02A8]();
}

uint64_t sub_2193E2190()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_2193E21A0()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_2193E21B0()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_2193E21C0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_2193E21D0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_2193E21E0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_2193E21F0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_2193E2200()
{
  return MEMORY[0x270F12B68]();
}

uint64_t sub_2193E2210()
{
  return MEMORY[0x270F12B70]();
}

uint64_t sub_2193E2220()
{
  return MEMORY[0x270F12B78]();
}

uint64_t sub_2193E2230()
{
  return MEMORY[0x270F12B80]();
}

uint64_t sub_2193E2240()
{
  return MEMORY[0x270F12B88]();
}

uint64_t sub_2193E2250()
{
  return MEMORY[0x270F12B90]();
}

uint64_t sub_2193E2260()
{
  return MEMORY[0x270F12B98]();
}

uint64_t sub_2193E2270()
{
  return MEMORY[0x270F12BA0]();
}

uint64_t sub_2193E2280()
{
  return MEMORY[0x270F12BA8]();
}

uint64_t sub_2193E2290()
{
  return MEMORY[0x270F12BB0]();
}

uint64_t sub_2193E22A0()
{
  return MEMORY[0x270F12BB8]();
}

uint64_t sub_2193E22B0()
{
  return MEMORY[0x270F12BC0]();
}

uint64_t sub_2193E22C0()
{
  return MEMORY[0x270F12BC8]();
}

uint64_t sub_2193E22D0()
{
  return MEMORY[0x270F12BD0]();
}

uint64_t sub_2193E22E0()
{
  return MEMORY[0x270F44A18]();
}

uint64_t sub_2193E22F0()
{
  return MEMORY[0x270F44A20]();
}

uint64_t sub_2193E2300()
{
  return MEMORY[0x270F44A28]();
}

uint64_t sub_2193E2310()
{
  return MEMORY[0x270F44AA8]();
}

uint64_t sub_2193E2320()
{
  return MEMORY[0x270F44AB0]();
}

uint64_t sub_2193E2330()
{
  return MEMORY[0x270F44AD8]();
}

uint64_t sub_2193E2360()
{
  return MEMORY[0x270F44B10]();
}

uint64_t sub_2193E2370()
{
  return MEMORY[0x270F44B20]();
}

uint64_t sub_2193E2380()
{
  return MEMORY[0x270F44B38]();
}

uint64_t sub_2193E2390()
{
  return MEMORY[0x270F44B48]();
}

uint64_t sub_2193E23A0()
{
  return MEMORY[0x270F44B78]();
}

uint64_t sub_2193E23B0()
{
  return MEMORY[0x270F44BC0]();
}

uint64_t sub_2193E23C0()
{
  return MEMORY[0x270F44C00]();
}

uint64_t sub_2193E23D0()
{
  return MEMORY[0x270F44C38]();
}

uint64_t sub_2193E23E0()
{
  return MEMORY[0x270F44C98]();
}

uint64_t sub_2193E23F0()
{
  return MEMORY[0x270F44CA8]();
}

uint64_t sub_2193E2400()
{
  return MEMORY[0x270F44CB0]();
}

uint64_t sub_2193E2420()
{
  return MEMORY[0x270F44CD8]();
}

uint64_t sub_2193E2430()
{
  return MEMORY[0x270F44D60]();
}

uint64_t sub_2193E2440()
{
  return MEMORY[0x270F44D68]();
}

uint64_t sub_2193E2450()
{
  return MEMORY[0x270F44D88]();
}

uint64_t sub_2193E2460()
{
  return MEMORY[0x270F44DB0]();
}

uint64_t sub_2193E2470()
{
  return MEMORY[0x270F44DE0]();
}

uint64_t sub_2193E2480()
{
  return MEMORY[0x270F44E00]();
}

uint64_t sub_2193E2490()
{
  return MEMORY[0x270F44E10]();
}

uint64_t sub_2193E24A0()
{
  return MEMORY[0x270F44E18]();
}

uint64_t sub_2193E24B0()
{
  return MEMORY[0x270F44E20]();
}

uint64_t sub_2193E24C0()
{
  return MEMORY[0x270F44E28]();
}

uint64_t sub_2193E24D0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2193E24E0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2193E24F0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2193E2500()
{
  return MEMORY[0x270F15C10]();
}

uint64_t sub_2193E2510()
{
  return MEMORY[0x270F15C18]();
}

uint64_t sub_2193E2520()
{
  return MEMORY[0x270F15C20]();
}

uint64_t sub_2193E2530()
{
  return MEMORY[0x270F15C28]();
}

uint64_t sub_2193E2540()
{
  return MEMORY[0x270F15C30]();
}

uint64_t sub_2193E2550()
{
  return MEMORY[0x270F15C38]();
}

uint64_t sub_2193E2560()
{
  return MEMORY[0x270F15C40]();
}

uint64_t sub_2193E2570()
{
  return MEMORY[0x270F15C48]();
}

uint64_t sub_2193E2580()
{
  return MEMORY[0x270F15C50]();
}

uint64_t sub_2193E2590()
{
  return MEMORY[0x270FA2C20]();
}

uint64_t sub_2193E25A0()
{
  return MEMORY[0x270EF7128]();
}

uint64_t sub_2193E25B0()
{
  return MEMORY[0x270EF7130]();
}

uint64_t sub_2193E25C0()
{
  return MEMORY[0x270EF7570]();
}

uint64_t sub_2193E25D0()
{
  return MEMORY[0x270EF7590]();
}

uint64_t sub_2193E25E0()
{
  return MEMORY[0x270EF75A0]();
}

uint64_t sub_2193E25F0()
{
  return MEMORY[0x270EF75A8]();
}

uint64_t sub_2193E2600()
{
  return MEMORY[0x270EF7778]();
}

uint64_t sub_2193E2610()
{
  return MEMORY[0x270EF77D0]();
}

uint64_t sub_2193E2620()
{
  return MEMORY[0x270EEAA78]();
}

uint64_t sub_2193E2630()
{
  return MEMORY[0x270EEAA80]();
}

uint64_t sub_2193E2640()
{
  return MEMORY[0x270EEAA98]();
}

uint64_t sub_2193E2650()
{
  return MEMORY[0x270EEAAA0]();
}

uint64_t sub_2193E2660()
{
  return MEMORY[0x270EEAAA8]();
}

uint64_t sub_2193E2670()
{
  return MEMORY[0x270EEAAF0]();
}

uint64_t sub_2193E2680()
{
  return MEMORY[0x270EEAB00]();
}

uint64_t sub_2193E2690()
{
  return MEMORY[0x270EEAB10]();
}

uint64_t sub_2193E26A0()
{
  return MEMORY[0x270EEAB30]();
}

uint64_t sub_2193E26B0()
{
  return MEMORY[0x270EEABF8]();
}

uint64_t sub_2193E26C0()
{
  return MEMORY[0x270EEAC08]();
}

uint64_t sub_2193E26D0()
{
  return MEMORY[0x270EEACE8]();
}

uint64_t sub_2193E26E0()
{
  return MEMORY[0x270EEAD30]();
}

uint64_t sub_2193E26F0()
{
  return MEMORY[0x270EEAD40]();
}

uint64_t sub_2193E2700()
{
  return MEMORY[0x270EEAD48]();
}

uint64_t sub_2193E2710()
{
  return MEMORY[0x270EEAEC8]();
}

uint64_t sub_2193E2720()
{
  return MEMORY[0x270EEAED0]();
}

uint64_t sub_2193E2730()
{
  return MEMORY[0x270EEAED8]();
}

uint64_t sub_2193E2740()
{
  return MEMORY[0x270EEAEF8]();
}

uint64_t sub_2193E2750()
{
  return MEMORY[0x270EEAF40]();
}

uint64_t sub_2193E2760()
{
  return MEMORY[0x270EEAF50]();
}

uint64_t sub_2193E2770()
{
  return MEMORY[0x270EEB030]();
}

uint64_t sub_2193E2780()
{
  return MEMORY[0x270EEB090]();
}

uint64_t sub_2193E2790()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_2193E27A0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_2193E27B0()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_2193E27C0()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_2193E27D0()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_2193E27E0()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_2193E27F0()
{
  return MEMORY[0x270F9D480]();
}

uint64_t sub_2193E2800()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_2193E2810()
{
  return MEMORY[0x270F9D490]();
}

uint64_t sub_2193E2820()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2193E2830()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2193E2840()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2193E2850()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_2193E2860()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_2193E2870()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_2193E2880()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_2193E2890()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2193E28A0()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_2193E28B0()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_2193E28C0()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_2193E28D0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2193E28E0()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_2193E28F0()
{
  return MEMORY[0x270F9D750]();
}

uint64_t sub_2193E2900()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_2193E2910()
{
  return MEMORY[0x270F9D790]();
}

uint64_t sub_2193E2920()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2193E2940()
{
  return MEMORY[0x270F9D7D8]();
}

uint64_t sub_2193E2950()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2193E2960()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_2193E2970()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_2193E2980()
{
  return MEMORY[0x270F9D808]();
}

uint64_t sub_2193E2990()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_2193E29A0()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_2193E29B0()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_2193E29C0()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_2193E29D0()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_2193E29E0()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_2193E29F0()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_2193E2A00()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2193E2A10()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2193E2A20()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2193E2A30()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_2193E2A40()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2193E2A50()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2193E2A60()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2193E2A70()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_2193E2A90()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_2193E2AA0()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_2193E2AC0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_2193E2AD0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2193E2AE0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2193E2AF0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_2193E2B00()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2193E2B10()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_2193E2B20()
{
  return MEMORY[0x270EF2038]();
}

uint64_t sub_2193E2B30()
{
  return MEMORY[0x270EF2040]();
}

uint64_t sub_2193E2B40()
{
  return MEMORY[0x270EF2048]();
}

uint64_t sub_2193E2B50()
{
  return MEMORY[0x270EF20F8]();
}

uint64_t sub_2193E2B60()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_2193E2B70()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_2193E2B80()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_2193E2B90()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_2193E2BA0()
{
  return MEMORY[0x270FA11A0]();
}

uint64_t sub_2193E2BB0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2193E2BC0()
{
  return MEMORY[0x270F9E4B0]();
}

uint64_t sub_2193E2BD0()
{
  return MEMORY[0x270F9E4E8]();
}

uint64_t sub_2193E2BE0()
{
  return MEMORY[0x270F9E508]();
}

uint64_t sub_2193E2BF0()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_2193E2C00()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2193E2C10()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2193E2C20()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_2193E2C30()
{
  return MEMORY[0x270F9E5B8]();
}

uint64_t sub_2193E2C40()
{
  return MEMORY[0x270F9E5C0]();
}

uint64_t sub_2193E2C50()
{
  return MEMORY[0x270F9E608]();
}

uint64_t sub_2193E2C60()
{
  return MEMORY[0x270F9E620]();
}

uint64_t sub_2193E2C70()
{
  return MEMORY[0x270F9E640]();
}

uint64_t sub_2193E2C80()
{
  return MEMORY[0x270F9E648]();
}

uint64_t sub_2193E2C90()
{
  return MEMORY[0x270F9E650]();
}

uint64_t sub_2193E2CA0()
{
  return MEMORY[0x270F9E668]();
}

uint64_t sub_2193E2CC0()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_2193E2CD0()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_2193E2CE0()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_2193E2CF0()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_2193E2D00()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_2193E2D10()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_2193E2D20()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_2193E2D30()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_2193E2D40()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_2193E2D50()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_2193E2D60()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_2193E2D70()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_2193E2D80()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_2193E2D90()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2193E2DA0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2193E2DB0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2193E2DC0()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_2193E2DD0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_2193E2DE0()
{
  return MEMORY[0x270F9EAA0]();
}

uint64_t sub_2193E2DF0()
{
  return MEMORY[0x270F9EAB8]();
}

uint64_t sub_2193E2E00()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2193E2E10()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_2193E2E20()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_2193E2E30()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_2193E2E40()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_2193E2E50()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_2193E2E60()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_2193E2E70()
{
  return MEMORY[0x270F9EDE8]();
}

uint64_t sub_2193E2E80()
{
  return MEMORY[0x270F9EDF8]();
}

uint64_t sub_2193E2E90()
{
  return MEMORY[0x270F9EE10]();
}

uint64_t sub_2193E2EA0()
{
  return MEMORY[0x270F9EF50]();
}

uint64_t sub_2193E2EB0()
{
  return MEMORY[0x270F9EF88]();
}

uint64_t sub_2193E2EC0()
{
  return MEMORY[0x270F9EFB0]();
}

uint64_t sub_2193E2ED0()
{
  return MEMORY[0x270F9EFC0]();
}

uint64_t sub_2193E2EE0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2193E2EF0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2193E2F00()
{
  return MEMORY[0x270F9F020]();
}

uint64_t sub_2193E2F10()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2193E2F20()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_2193E2F30()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_2193E2F40()
{
  return MEMORY[0x270F9F0A8]();
}

uint64_t sub_2193E2F50()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2193E2F60()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2193E2F70()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_2193E2F80()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_2193E2F90()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_2193E2FA0()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_2193E2FB0()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_2193E2FC0()
{
  return MEMORY[0x270F9F290]();
}

uint64_t sub_2193E2FD0()
{
  return MEMORY[0x270F9F298]();
}

uint64_t sub_2193E2FE0()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_2193E2FF0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_2193E3000()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_2193E3010()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_2193E3020()
{
  return MEMORY[0x270F9F330]();
}

uint64_t sub_2193E3030()
{
  return MEMORY[0x270F9F340]();
}

uint64_t sub_2193E3040()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_2193E3050()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_2193E3060()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_2193E3070()
{
  return MEMORY[0x270F9F3B8]();
}

uint64_t sub_2193E3080()
{
  return MEMORY[0x270F9F3D0]();
}

uint64_t sub_2193E3090()
{
  return MEMORY[0x270F9F3D8]();
}

uint64_t sub_2193E30A0()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_2193E30B0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_2193E30C0()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_2193E30D0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_2193E30E0()
{
  return MEMORY[0x270F9F470]();
}

uint64_t sub_2193E30F0()
{
  return MEMORY[0x270F9F480]();
}

uint64_t sub_2193E3100()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2193E3110()
{
  return MEMORY[0x270F9F7B0]();
}

uint64_t sub_2193E3120()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_2193E3130()
{
  return MEMORY[0x270F9F7C8]();
}

uint64_t sub_2193E3140()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2193E3150()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_2193E3160()
{
  return MEMORY[0x270F9FA80]();
}

uint64_t sub_2193E3170()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_2193E3180()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2193E31B0()
{
  return MEMORY[0x270F5C2D8]();
}

uint64_t sub_2193E31C0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2193E31D0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2193E31E0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2193E31F0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2193E3200()
{
  return MEMORY[0x270EF26A8]();
}

uint64_t sub_2193E3210()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2193E3220()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2193E3230()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2193E3240()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_2193E3250()
{
  return MEMORY[0x270F9FD90]();
}

uint64_t sub_2193E3260()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_2193E3290()
{
  return MEMORY[0x270FA0128]();
}

CCCryptorStatus CCCrypt(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x270ED78A0](*(void *)&op, *(void *)&alg, *(void *)&options, key, keyLength, iv, dataIn, dataInLength);
}

void CFRelease(CFTypeRef cf)
{
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x270EE54C8](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationDisplayAlert(CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle, CFStringRef alternateButtonTitle, CFStringRef otherButtonTitle, CFOptionFlags *responseFlags)
{
  return MEMORY[0x270EE54D8](flags, iconURL, soundURL, localizationURL, alertHeader, alertMessage, defaultButtonTitle, alternateButtonTitle, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x270EE5500](userNotification, responseFlags, timeout);
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x270F4AE40]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x270F55148]();
}

uint64_t PLShouldLogRegisteredEvent()
{
  return MEMORY[0x270F55160]();
}

uint64_t TCCAccessCheckAuditToken()
{
  return MEMORY[0x270F795A0]();
}

uint64_t WBSApplicationIdentifierFromAuditToken()
{
  return MEMORY[0x270F5C2E0]();
}

uint64_t WBSAuditTokenHasEntitlement()
{
  return MEMORY[0x270F5C2E8]();
}

uint64_t WBSAuthenticationPolicyForPasswordManager()
{
  return MEMORY[0x270F5C2F0]();
}

uint64_t WBSAuthenticationServicesAgentAutoFillServiceName()
{
  return MEMORY[0x270F5C2F8]();
}

uint64_t WBSAuthenticationServicesAgentDelegateInterface()
{
  return MEMORY[0x270F5C308]();
}

uint64_t WBSAuthenticationServicesAgentInterface()
{
  return MEMORY[0x270F5C310]();
}

uint64_t WBSIsEqual()
{
  return MEMORY[0x270F5C320]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _WBSLocalizedString()
{
  return MEMORY[0x270F5C338]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x270ED9718]();
}

void free(void *a1)
{
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x270ED9D28](a1);
}

uid_t getuid(void)
{
  return MEMORY[0x270ED9DA0]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return (nw_endpoint_t)MEMORY[0x270EF7EB0](hostname, port);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

void os_activity_apply(os_activity_t activity, os_block_t block)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
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

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}