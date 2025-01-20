uint64_t View.onCameraCaptureEvent(isEnabled:primaryAction:secondaryAction:)(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  unsigned char v19[8];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char v29;

  swift_retain();
  swift_retain();
  sub_23814B710();
  v13 = v19[0];
  v14 = v20;
  v29 = 0;
  sub_23814B710();
  v15 = v19[0];
  v16 = v20;
  v19[0] = a1;
  v20 = a2;
  v21 = a3;
  v22 = a4;
  v23 = a5;
  v24 = 1;
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  MEMORY[0x23EC87A50](v19, a6, &type metadata for OnCameraCaptureEventModifier, a7);
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t View.onCameraCaptureEvent(isEnabled:action:)(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  swift_retain();
  sub_23814B710();
  char v10 = v15[0];
  uint64_t v11 = v16;
  char v25 = 0;
  sub_23814B710();
  char v12 = v15[0];
  uint64_t v13 = v16;
  v15[0] = a1;
  uint64_t v16 = a2;
  uint64_t v17 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  char v20 = 0;
  char v21 = v10;
  uint64_t v22 = v11;
  char v23 = v12;
  uint64_t v24 = v13;
  MEMORY[0x23EC87A50](v15, a4, &type metadata for OnCameraCaptureEventModifier, a5);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_238146270()
{
  return swift_getWitnessTable();
}

unint64_t sub_2381462D4()
{
  unint64_t result = qword_268956618;
  if (!qword_268956618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268956618);
  }
  return result;
}

uint64_t sub_238146328(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5)
  {
    swift_retain();
    uint64_t v5 = vars8;
  }
  return swift_retain();
}

uint64_t destroy for OnCameraCaptureEventModifier(uint64_t a1)
{
  sub_2381463B8(*(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_release();

  return swift_release();
}

uint64_t sub_2381463B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t result = swift_release();
  if (a5)
  {
    return swift_release();
  }
  return result;
}

uint64_t initializeWithCopy for OnCameraCaptureEventModifier(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  char v8 = *(unsigned char *)(a2 + 40);
  sub_238146328(v4, v5, v6, v7, v8);
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = v8;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for OnCameraCaptureEventModifier(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  char v8 = *(unsigned char *)(a2 + 40);
  sub_238146328(v4, v5, v6, v7, v8);
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  uint64_t v12 = *(void *)(a1 + 32);
  char v13 = *(unsigned char *)(a1 + 40);
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = v8;
  sub_2381463B8(v9, v10, v11, v12, v13);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t assignWithTake for OnCameraCaptureEventModifier(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  char v4 = *(unsigned char *)(a2 + 40);
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  char v9 = *(unsigned char *)(a1 + 40);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = v4;
  sub_2381463B8(v5, v6, v7, v8, v9);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_release();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for OnCameraCaptureEventModifier(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 80)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 56);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for OnCameraCaptureEventModifier(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 80) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 80) = 0;
    }
    if (a2) {
      *(void *)(result + 56) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for OnCameraCaptureEventModifier()
{
  return &type metadata for OnCameraCaptureEventModifier;
}

uint64_t sub_2381466F0()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_23814670C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23814B600();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_238146DA4(a1);
  if ((v9 & 1) == 0)
  {
    uint64_t v10 = v8;
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
    int v11 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
    if (v11 == *MEMORY[0x263F1A320])
    {
      uint64_t v12 = 0;
    }
    else if (v11 == *MEMORY[0x263F1A328])
    {
      uint64_t v12 = 1;
    }
    else
    {
      if (v11 != *MEMORY[0x263F1A330])
      {
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        return;
      }
      uint64_t v12 = 2;
    }
    id v13 = objc_msgSend(self, sel_eventWithSource_phase_, v10, v12);
    sub_2381468AC(v13);
  }
}

id sub_2381468AC(void *a1)
{
  sub_238146BE8((long long *)(v1 + 8), (uint64_t)v8);
  sub_238146BE8(v8, (uint64_t)v9);
  if ((v9[32] & 1) == 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268956630);
    sub_23814B720();
    if (v7 == 1 && objc_msgSend(a1, sel_source))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_268956638);
      uint64_t v3 = swift_allocObject();
      *(_OWORD *)(v3 + 16) = xmmword_23814BB60;
      *(void *)(v3 + 56) = MEMORY[0x263F8D310];
      unint64_t v4 = 0xD00000000000004ELL;
      uint64_t v5 = "Ignoring capture event from non-primary source while primary source is active.";
LABEL_10:
      *(void *)(v3 + 32) = v4;
      *(void *)(v3 + 40) = (unint64_t)(v5 - 32) | 0x8000000000000000;
      sub_23814B7B0();
      return (id)swift_bridgeObjectRelease();
    }
    sub_23814B720();
    if (v7 == 1 && objc_msgSend(a1, sel_source) != (id)1)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_268956638);
      uint64_t v3 = swift_allocObject();
      *(_OWORD *)(v3 + 16) = xmmword_23814BB60;
      *(void *)(v3 + 56) = MEMORY[0x263F8D310];
      unint64_t v4 = 0xD000000000000052;
      uint64_t v5 = "Ignoring capture event from non-secondary source while secondary source is active.";
      goto LABEL_10;
    }
  }
  id result = objc_msgSend(a1, sel_source);
  if ((unint64_t)result <= 1)
  {
    objc_msgSend(a1, sel_phase);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268956630);
    sub_23814B730();
    return (id)sub_238146F50(a1, v8);
  }
  return result;
}

uint64_t sub_238146AC8()
{
  return sub_23814B580();
}

uint64_t sub_238146AE4()
{
  long long v1 = v0[1];
  long long v7 = *v0;
  long long v8 = v1;
  long long v2 = v0[3];
  long long v9 = v0[2];
  long long v10 = v2;
  long long v11 = v0[4];
  sub_238146BE8((long long *)((char *)&v7 + 8), (uint64_t)v12);
  long long v13 = v10;
  long long v14 = v11;
  uint64_t v3 = (_OWORD *)swift_allocObject();
  long long v4 = v10;
  v3[3] = v9;
  v3[4] = v4;
  v3[5] = v11;
  long long v5 = v8;
  v3[1] = v7;
  v3[2] = v5;
  sub_238146C58((uint64_t)v12);
  sub_238146C90((uint64_t)&v13);
  sub_238146C90((uint64_t)&v14);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268956620);
  sub_238146D00();
  sub_23814B6F0();
  return swift_release();
}

uint64_t sub_238146BE8(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(unsigned char *)(a2 + 32) = *((unsigned char *)a1 + 32);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_238146C00()
{
  sub_2381463B8(*(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(unsigned char *)(v0 + 56));
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 96, 7);
}

void sub_238146C50(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_238146C58(uint64_t a1)
{
  return a1;
}

uint64_t sub_238146C90(uint64_t a1)
{
  return a1;
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

unint64_t sub_238146D00()
{
  unint64_t result = qword_268956628;
  if (!qword_268956628)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268956620);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268956628);
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

uint64_t sub_238146DA4(uint64_t a1)
{
  uint64_t v2 = sub_23814B630();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  long long v8 = (char *)&v13 - v7;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v13 - v7, a1, v2);
  sub_23814B610();
  sub_238147040();
  char v9 = sub_23814B740();
  long long v10 = *(void (**)(char *, uint64_t))(v3 + 8);
  v10(v6, v2);
  if (v9)
  {
    v10(v8, v2);
    return 0;
  }
  else
  {
    sub_23814B620();
    char v12 = sub_23814B740();
    v10(v6, v2);
    v10(v8, v2);
    return v12 & 1;
  }
}

uint64_t sub_238146F50(void *a1, long long *a2)
{
  sub_238146BE8(a2, (uint64_t)&v8);
  sub_238146BE8(a2, (uint64_t)v9);
  uint64_t v4 = (void (*)(void *))v9[0];
  if (v10) {
    uint64_t v5 = (void (*)(void *))v9[2];
  }
  else {
    uint64_t v5 = (void (*)(void *))v9[0];
  }
  swift_retain();
  swift_retain();
  id v6 = objc_msgSend(a1, sel_source);
  if (v6 == (id)1)
  {
    v5(a1);
  }
  else if (!v6)
  {
    v4(a1);
  }
  swift_release();
  return swift_release();
}

unint64_t sub_238147040()
{
  unint64_t result = qword_268956640[0];
  if (!qword_268956640[0])
  {
    sub_23814B630();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268956640);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for OnCameraCaptureEventModifier.EventHandler(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for OnCameraCaptureEventModifier.EventHandler(uint64_t a1)
{
  return sub_2381463B8(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
}

uint64_t initializeWithCopy for OnCameraCaptureEventModifier.EventHandler(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  sub_238146328(*(void *)a2, v4, v5, v6, v7);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for OnCameraCaptureEventModifier.EventHandler(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  sub_238146328(*(void *)a2, v4, v5, v6, v7);
  uint64_t v8 = *(void *)a1;
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  char v12 = *(unsigned char *)(a1 + 32);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  sub_2381463B8(v8, v9, v10, v11, v12);
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for OnCameraCaptureEventModifier.EventHandler(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  char v8 = *(unsigned char *)(a1 + 32);
  long long v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v9;
  *(unsigned char *)(a1 + 32) = v3;
  sub_2381463B8(v4, v6, v5, v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for OnCameraCaptureEventModifier.EventHandler(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for OnCameraCaptureEventModifier.EventHandler(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_2381472A8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

uint64_t sub_2381472B4(uint64_t result, char a2)
{
  *(unsigned char *)(result + 32) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for OnCameraCaptureEventModifier.EventHandler()
{
  return &type metadata for OnCameraCaptureEventModifier.EventHandler;
}

uint64_t sub_2381472D0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t VideoPlayer.init(player:videoOverlay:)@<X0>(uint64_t a1@<X0>, void (*a2)(uint64_t)@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  MEMORY[0x270FA5388](a1);
  long long v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for VideoPlayerConfiguration();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  long long v14 = (char *)&v16 - v13;
  a2(v12);
  sub_23814B4B4((uint64_t)v9, a1, a3, (uint64_t)v14);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a4, v14, v10);
}

uint64_t VideoPlayer.body.getter(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  uint64_t v4 = type metadata accessor for VideoPlayerConfiguration();
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v9 - v5;
  (*(void (**)(char *, uint64_t))(v7 + 16))((char *)&v9 - v5, v1);
  return sub_238147E94(v6, v2, v3);
}

uint64_t sub_23814756C()
{
  return sub_23814B6E0();
}

uint64_t VideoPlayer<>.init(player:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_238147594()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2381475D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_2381475E0()
{
  uint64_t result = type metadata accessor for VideoPlayerConfiguration();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_238147670(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    uint64_t v9 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    uint64_t v10 = *(void **)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    *(void *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8) = v10;
    id v11 = v10;
  }
  return v4;
}

void sub_23814776C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 16) - 8) + 8;
  (*(void (**)(void))v3)();
  uint64_t v4 = *(void **)((a1 + *(void *)(v3 + 56) + 7) & 0xFFFFFFFFFFFFFFF8);
}

uint64_t sub_2381477DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = *(void **)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = v8;
  id v9 = v8;
  return a1;
}

uint64_t sub_23814785C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  int v7 = (void **)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = *(void **)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  id v9 = *v7;
  *int v7 = v8;
  id v10 = v8;

  return a1;
}

uint64_t sub_2381478E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  *(void *)((*(void *)(v5 + 32) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 32) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_238147960(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  int v7 = (void **)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = *v7;
  *int v7 = *(void **)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);

  return a1;
}

uint64_t sub_2381479E4(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (v5 <= 0x7FFFFFFE) {
    unsigned int v7 = 2147483646;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
    unsigned int v9 = a2 - v7;
    uint64_t v10 = v8 & 0xFFFFFFF8;
    if ((v8 & 0xFFFFFFF8) != 0) {
      unsigned int v11 = 2;
    }
    else {
      unsigned int v11 = v9 + 1;
    }
    if (v11 >= 0x10000) {
      unsigned int v12 = 4;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v11 < 0x100) {
      unsigned int v12 = 1;
    }
    if (v11 >= 2) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    switch(v13)
    {
      case 1:
        int v14 = *((unsigned __int8 *)a1 + v8);
        if (!v14) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v14 = *(unsigned __int16 *)((char *)a1 + v8);
        if (v14) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x238147B38);
      case 4:
        int v14 = *(_DWORD *)((char *)a1 + v8);
        if (!v14) {
          break;
        }
LABEL_22:
        int v16 = v14 - 1;
        if (v10)
        {
          int v16 = 0;
          LODWORD(v10) = *a1;
        }
        return v7 + (v10 | v16) + 1;
      default:
        break;
    }
  }
  if (v5 >= 0x7FFFFFFE) {
    return (*(uint64_t (**)(void))(v4 + 48))();
  }
  unint64_t v17 = *(void *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
  if (v17 >= 0xFFFFFFFF) {
    LODWORD(v17) = -1;
  }
  if ((v17 + 1) >= 2) {
    return v17;
  }
  else {
    return 0;
  }
}

void sub_238147B4C(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFE) {
    unsigned int v8 = 2147483646;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  unint64_t v10 = ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (((v9 + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
    unsigned int v11 = a3 - v8 + 1;
  }
  else {
    unsigned int v11 = 2;
  }
  if (v11 >= 0x10000) {
    int v12 = 4;
  }
  else {
    int v12 = 2;
  }
  if (v11 < 0x100) {
    int v12 = 1;
  }
  if (v11 >= 2) {
    unsigned int v13 = v12;
  }
  else {
    unsigned int v13 = 0;
  }
  if (v8 < a3) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  if (a2 > v8)
  {
    if (((v9 + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      int v15 = a2 - v8;
    }
    else {
      int v15 = 1;
    }
    if (((v9 + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      unsigned int v16 = ~v8 + a2;
      bzero(a1, ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 8);
      *(_DWORD *)a1 = v16;
    }
    switch(v14)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_43;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
  switch(v14)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 3:
LABEL_43:
      __break(1u);
      JUMPOUT(0x238147D38);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_32;
    default:
LABEL_32:
      if (a2)
      {
LABEL_33:
        if (v7 < 0x7FFFFFFE)
        {
          uint64_t v18 = (void *)((unint64_t)&a1[v9 + 7] & 0xFFFFFFFFFFFFFFF8);
          if (a2 > 0x7FFFFFFE)
          {
            *uint64_t v18 = 0;
            *(_DWORD *)uint64_t v18 = a2 - 0x7FFFFFFF;
          }
          else
          {
            *uint64_t v18 = a2;
          }
        }
        else
        {
          unint64_t v17 = *(void (**)(void))(v6 + 56);
          v17();
        }
      }
      return;
  }
}

uint64_t type metadata accessor for VideoPlayer()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_238147D78()
{
  type metadata accessor for VideoPlayerBody();

  return swift_getWitnessTable();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_238147DF4()
{
  uint64_t result = sub_23814B7A0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_238147E98()
{
  uint64_t v0 = sub_23814B550();
  __swift_allocate_value_buffer(v0, qword_2689566C8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2689566C8);
  return sub_23814B540();
}

uint64_t sub_238147F18@<X0>(uint64_t a1@<X8>)
{
  uint64_t v25 = a1;
  uint64_t v1 = type metadata accessor for VideoPlayerConfiguration();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v22 - v3;
  uint64_t v5 = type metadata accessor for AVPlayerViewControllerView_AVPVC_Subclass();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  unsigned int v11 = (char *)&v22 - v10;
  type metadata accessor for AVPlayerViewControllerView();
  uint64_t v12 = sub_23814B5F0();
  uint64_t v23 = *(void *)(v12 - 8);
  uint64_t v24 = v12;
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v22 - v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v22, v1);
  (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v9, v4, v1);
  uint64_t WitnessTable = swift_getWitnessTable();
  unsigned int v16 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  v16(v11, v9, v5);
  unint64_t v17 = *(void (**)(char *, uint64_t))(v6 + 8);
  v17(v9, v5);
  v16(v9, v11, v5);
  uint64_t v18 = swift_getWitnessTable();
  sub_2381482F0((uint64_t)v9, v5);
  v17(v9, v5);
  v17(v11, v5);
  uint64_t v26 = WitnessTable;
  uint64_t v27 = v18;
  uint64_t v19 = v24;
  swift_getWitnessTable();
  uint64_t v20 = v23;
  (*(void (**)(uint64_t, char *, uint64_t))(v23 + 16))(v25, v14, v19);
  return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v14, v19);
}

uint64_t sub_238148284@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for VideoPlayerConfiguration();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);

  return v5(a2, a1, v4);
}

uint64_t sub_2381482F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23814B5D0();
  MEMORY[0x270FA5388](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_23814B5E0();
}

id sub_2381483EC()
{
  return sub_23814A588();
}

uint64_t sub_2381483F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23814A5CC(a1, a3);
}

void sub_238148404()
{
}

uint64_t sub_23814843C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270F02710](a1, a2, a3, WitnessTable);
}

uint64_t sub_2381484B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270F026D8](a1, a2, a3, WitnessTable);
}

void sub_238148534()
{
}

void sub_23814857C(void *a1)
{
  id v1 = sub_2381485D4();
  objc_msgSend(v1, sel_setPlayer_, a1);
}

id sub_2381485D4()
{
  uint64_t v1 = *(void *)((*MEMORY[0x263F8EED0] & *v0) + 0x70);
  uint64_t v2 = *(void **)((char *)v0 + v1);
  if (v2)
  {
    id v3 = *(id *)((char *)v0 + v1);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFA9C8]), sel_init);
    objc_msgSend(v4, sel_setAllowsEnteringFullScreen_, 0);
    objc_msgSend(v4, sel_setAllowsPictureInPicturePlayback_, 0);
    uint64_t v5 = *(void **)((char *)v0 + v1);
    *(void *)((char *)v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

void sub_23814868C()
{
  uint64_t v1 = v0;
  v34.receiver = v0;
  v34.super_class = (Class)type metadata accessor for VideoPlayerViewController();
  objc_msgSendSuper2(&v34, sel_viewDidLoad);
  id v2 = sub_2381485D4();
  objc_msgSend(v1, sel_addChildViewController_, v2);

  id v3 = sub_2381485D4();
  id v4 = objc_msgSend(v3, sel_view);

  if (!v4)
  {
    if (qword_268956610 != -1) {
      swift_once();
    }
    uint64_t v31 = sub_23814B550();
    __swift_project_value_buffer(v31, (uint64_t)qword_2689566C8);
    id v4 = sub_23814B530();
    os_log_type_t v32 = sub_23814B790();
    if (os_log_type_enabled(v4, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v33 = 0;
      _os_log_impl(&dword_238144000, v4, v32, "AVPlayerViewController's view is missing!", v33, 2u);
      MEMORY[0x23EC87E10](v33, -1, -1);
    }
    goto LABEL_12;
  }
  id v5 = objc_msgSend(v1, sel_view);
  if (!v5)
  {
    __break(1u);
    goto LABEL_14;
  }
  id v6 = v5;
  objc_msgSend(v5, sel_addSubview_, v4);

  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268956860);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_23814BC80;
  id v8 = [v4 leadingAnchor];
  id v9 = objc_msgSend(v1, sel_view);
  if (!v9)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v10 = v9;
  id v11 = objc_msgSend(v9, sel_leadingAnchor);

  id v12 = objc_msgSend(v8, sel_constraintEqualToAnchor_, v11);
  *(void *)(v7 + 32) = v12;
  id v13 = [v4 topAnchor];
  id v14 = objc_msgSend(v1, sel_view);
  if (!v14)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  int v15 = v14;
  id v16 = objc_msgSend(v14, sel_topAnchor);

  id v17 = objc_msgSend(v13, sel_constraintEqualToAnchor_, v16);
  *(void *)(v7 + 40) = v17;
  id v18 = [v4 trailingAnchor];
  id v19 = objc_msgSend(v1, sel_view);
  if (!v19)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v20 = v19;
  id v21 = objc_msgSend(v19, sel_trailingAnchor);

  id v22 = objc_msgSend(v18, sel_constraintEqualToAnchor_, v21);
  *(void *)(v7 + 48) = v22;
  id v23 = [v4 bottomAnchor];
  id v24 = objc_msgSend(v1, sel_view);
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = self;
    id v27 = objc_msgSend(v25, sel_bottomAnchor);

    id v28 = objc_msgSend(v23, sel_constraintEqualToAnchor_, v27);
    *(void *)(v7 + 56) = v28;
    sub_23814B780();
    sub_23814AB54();
    v29 = (void *)sub_23814B770();
    swift_bridgeObjectRelease();
    objc_msgSend(v26, sel_activateConstraints_, v29);

    id v30 = sub_2381485D4();
    objc_msgSend(v30, sel_didMoveToParentViewController_, v1);

    sub_238148B60();
LABEL_12:

    return;
  }
LABEL_17:
  __break(1u);
}

void sub_238148B18(void *a1)
{
  id v1 = a1;
  sub_23814868C();
}

uint64_t sub_238148B60()
{
  id v1 = v0;
  uint64_t v2 = *MEMORY[0x263F8EED0] & *v0;
  uint64_t v3 = *(void *)(v2 + 80);
  uint64_t v4 = sub_23814B7A0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  id v8 = (char *)&v34 - v7;
  uint64_t v9 = *(void *)(v3 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v6);
  id v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v10);
  int v15 = (char *)&v34 - v14;
  if (!*(void *)((char *)v1 + *(void *)(v2 + 96)))
  {
    sub_238148578(result);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v8, 1, v3) == 1)
    {
      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v15, v8, v3);
      id v16 = sub_2381485D4();
      id v17 = objc_msgSend(v16, sel_contentOverlayView);

      if (v17)
      {
        sub_23814B5B0();
        (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v15, v3);
        id v18 = (void *)sub_23814B590();
        id v19 = objc_msgSend(self, sel_clearColor);
        objc_msgSend(v18, sel_setBackgroundColor_, v19);

        objc_msgSend(v17, sel_addSubview_, v18);
        objc_msgSend(v18, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
        id v20 = objc_msgSend(v18, sel_centerXAnchor);
        id v21 = objc_msgSend(v17, sel_centerXAnchor);
        id v22 = objc_msgSend(v20, sel_constraintEqualToAnchor_, v21);

        objc_msgSend(v22, sel_setActive_, 1);
        id v23 = objc_msgSend(v18, sel_centerYAnchor);
        id v24 = objc_msgSend(v17, sel_centerYAnchor);
        id v25 = objc_msgSend(v23, sel_constraintEqualToAnchor_, v24);

        objc_msgSend(v25, sel_setActive_, 1);
        id v26 = objc_msgSend(v18, sel_widthAnchor);
        id v27 = objc_msgSend(v17, sel_widthAnchor);
        id v28 = objc_msgSend(v26, sel_constraintEqualToAnchor_, v27);

        objc_msgSend(v28, sel_setActive_, 1);
        id v29 = objc_msgSend(v18, sel_heightAnchor);
        id v30 = objc_msgSend(v17, sel_heightAnchor);
        id v31 = objc_msgSend(v29, sel_constraintEqualToAnchor_, v30);

        objc_msgSend(v31, sel_setActive_, 1);
        uint64_t v32 = *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0x60);
        v33 = *(void **)((char *)v1 + v32);
        *(void *)((char *)v1 + v32) = v18;
      }
      return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v15, v3);
    }
  }
  return result;
}

id sub_238149064(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = (void *)MEMORY[0x263F8EED0];
  uint64_t v7 = *MEMORY[0x263F8EED0] & *(void *)v3;
  *(void *)&v3[*(void *)(v7 + 96)] = 0;
  (*(void (**)(char *, uint64_t, uint64_t, void))(*(void *)(*(void *)(v7 + 80) - 8) + 56))(&v3[*(void *)((*v6 & *(void *)v3) + 0x68)], 1, 1, *(void *)(v7 + 80));
  *(void *)&v3[*(void *)((*v6 & *(void *)v3) + 0x70)] = 0;
  if (a2)
  {
    id v8 = (void *)sub_23814B750();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = 0;
  }
  v11.receiver = v3;
  v11.super_class = (Class)type metadata accessor for VideoPlayerViewController();
  id v9 = objc_msgSendSuper2(&v11, sel_initWithNibName_bundle_, v8, a3);

  return v9;
}

uint64_t sub_2381491E8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return sub_23814A180(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, void *))sub_238149064);
}

id sub_238149200(void *a1)
{
  uint64_t v3 = (void *)MEMORY[0x263F8EED0];
  uint64_t v4 = *MEMORY[0x263F8EED0] & *(void *)v1;
  *(void *)&v1[*(void *)(v4 + 0x60)] = 0;
  (*(void (**)(char *, uint64_t, uint64_t, void))(*(void *)(*(void *)(v4 + 80) - 8) + 56))(&v1[*(void *)((*v3 & *(void *)v1) + 0x68)], 1, 1, *(void *)(v4 + 80));
  *(void *)&v1[*(void *)((*v3 & *(void *)v1) + 0x70)] = 0;
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for VideoPlayerViewController();
  id v5 = objc_msgSendSuper2(&v7, sel_initWithCoder_, a1);

  return v5;
}

id sub_238149330(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_238149200(a3);
}

id sub_238149358()
{
  return sub_23814A374((uint64_t (*)(void, void, void))type metadata accessor for VideoPlayerViewController);
}

void sub_238149370(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x263F8EED0];

  uint64_t v3 = (char *)a1 + *(void *)((*v2 & *a1) + 0x68);
  uint64_t v4 = sub_23814B7A0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  id v5 = *(void **)((char *)a1 + *(void *)((*v2 & *a1) + 0x70));
}

uint64_t type metadata accessor for VideoPlayerViewController()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_23814947C()
{
  uint64_t result = sub_23814B7A0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

id sub_23814951C()
{
  return sub_23814A750();
}

uint64_t sub_238149524(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_23814A898(a1, a3);
}

id sub_238149530(void *a1)
{
  return objc_msgSend(a1, sel_setPlayer_, 0);
}

uint64_t sub_238149540()
{
  return sub_23814B650();
}

uint64_t sub_238149574(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270F02710](a1, a2, a3, WitnessTable);
}

uint64_t sub_2381495F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270F026D8](a1, a2, a3, WitnessTable);
}

void sub_23814966C()
{
}

uint64_t sub_2381496AC(uint64_t a1)
{
  *(void *)((char *)v1 + *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0x60)) = a1;
  return MEMORY[0x270F9A758]();
}

uint64_t sub_2381496DC(void (*a1)(void))
{
  uint64_t v3 = *MEMORY[0x263F8EED0] & *v1;
  uint64_t v4 = *(void *)(v3 + 0x50);
  uint64_t v5 = sub_23814B7A0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  id v9 = (char *)&v20 - v8;
  uint64_t v10 = *(void *)(v4 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v7);
  id v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  int v15 = (char *)&v20 - v14;
  id v16 = (char *)v1 + *(void *)(v3 + 104);
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v16, v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v9, 1, v4) == 1) {
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v15, v9, v4);
  if (objc_msgSend(v1, sel_isViewLoaded)) {
    a1();
  }
  id v18 = *(void **)((char *)v1 + *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0x60));
  if (v18)
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v4);
    id v19 = v18;
    sub_23814B5A0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v4);
}

uint64_t sub_238149994@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = (char *)v1 + *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0x68);
  swift_beginAccess();
  uint64_t v4 = sub_23814B7A0();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_238149A54()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VideoPlayerViewController_AVPVC_Subclass();
  objc_msgSendSuper2(&v2, sel_viewDidLoad);
  return sub_238149B14();
}

void sub_238149ACC(void *a1)
{
  id v1 = a1;
  sub_238149A54();
}

uint64_t sub_238149B14()
{
  id v1 = v0;
  uint64_t v2 = *MEMORY[0x263F8EED0] & *v0;
  uint64_t v3 = *(void *)(v2 + 80);
  uint64_t v4 = sub_23814B7A0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v34 - v7;
  uint64_t v9 = *(void *)(v3 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v6);
  uint64_t v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v10);
  int v15 = (char *)&v34 - v14;
  if (!*(void *)((char *)v1 + *(void *)(v2 + 96)))
  {
    sub_238148578(result);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v8, 1, v3) == 1)
    {
      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v15, v8, v3);
      id v16 = objc_msgSend(v1, sel_contentOverlayView);
      if (v16)
      {
        id v17 = v16;
        sub_23814B5B0();
        (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v15, v3);
        id v18 = (void *)sub_23814B590();
        id v19 = objc_msgSend(self, sel_clearColor);
        objc_msgSend(v18, sel_setBackgroundColor_, v19);

        objc_msgSend(v17, sel_addSubview_, v18);
        objc_msgSend(v18, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
        id v20 = objc_msgSend(v18, sel_centerXAnchor);
        id v21 = objc_msgSend(v17, sel_centerXAnchor);
        id v22 = objc_msgSend(v20, sel_constraintEqualToAnchor_, v21);

        objc_msgSend(v22, sel_setActive_, 1);
        id v23 = objc_msgSend(v18, sel_centerYAnchor);
        id v24 = objc_msgSend(v17, sel_centerYAnchor);
        id v25 = objc_msgSend(v23, sel_constraintEqualToAnchor_, v24);

        objc_msgSend(v25, sel_setActive_, 1);
        id v26 = objc_msgSend(v18, sel_widthAnchor);
        id v27 = objc_msgSend(v17, sel_widthAnchor);
        id v28 = objc_msgSend(v26, sel_constraintEqualToAnchor_, v27);

        objc_msgSend(v28, sel_setActive_, 1);
        id v29 = objc_msgSend(v18, sel_heightAnchor);
        id v30 = objc_msgSend(v17, sel_heightAnchor);
        id v31 = objc_msgSend(v29, sel_constraintEqualToAnchor_, v30);

        objc_msgSend(v31, sel_setActive_, 1);
        uint64_t v32 = *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0x60);
        v33 = *(void **)((char *)v1 + v32);
        *(void *)((char *)v1 + v32) = v18;
      }
      return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v15, v3);
    }
  }
  return result;
}

id sub_23814A00C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = (void *)MEMORY[0x263F8EED0];
  uint64_t v7 = *MEMORY[0x263F8EED0] & *(void *)v3;
  *(void *)&v3[*(void *)(v7 + 96)] = 0;
  (*(void (**)(char *, uint64_t, uint64_t, void))(*(void *)(*(void *)(v7 + 80) - 8) + 56))(&v3[*(void *)((*v6 & *(void *)v3) + 0x68)], 1, 1, *(void *)(v7 + 80));
  if (a2)
  {
    uint64_t v8 = (void *)sub_23814B750();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = 0;
  }
  v11.receiver = v3;
  v11.super_class = (Class)type metadata accessor for VideoPlayerViewController_AVPVC_Subclass();
  id v9 = objc_msgSendSuper2(&v11, sel_initWithNibName_bundle_, v8, a3);

  return v9;
}

uint64_t sub_23814A168(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return sub_23814A180(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, void *))sub_23814A00C);
}

uint64_t sub_23814A180(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t (*a5)(uint64_t, uint64_t, void *))
{
  if (a3)
  {
    uint64_t v7 = sub_23814B760();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  id v10 = a4;
  return a5(v7, v9, a4);
}

id sub_23814A1F4(void *a1)
{
  uint64_t v3 = (void *)MEMORY[0x263F8EED0];
  uint64_t v4 = *MEMORY[0x263F8EED0] & *(void *)v1;
  *(void *)&v1[*(void *)(v4 + 0x60)] = 0;
  (*(void (**)(char *, uint64_t, uint64_t, void))(*(void *)(*(void *)(v4 + 80) - 8) + 56))(&v1[*(void *)((*v3 & *(void *)v1) + 0x68)], 1, 1, *(void *)(v4 + 80));
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for VideoPlayerViewController_AVPVC_Subclass();
  id v5 = objc_msgSendSuper2(&v7, sel_initWithCoder_, a1);

  return v5;
}

id sub_23814A2FC(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_23814A1F4(a3);
}

id sub_23814A324(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = sub_23814AA20((uint64_t)v3);

  return v4;
}

id sub_23814A35C()
{
  return sub_23814A374((uint64_t (*)(void, void, void))type metadata accessor for VideoPlayerViewController_AVPVC_Subclass);
}

id sub_23814A374(uint64_t (*a1)(void, void, void))
{
  uint64_t v2 = (objc_class *)a1(0, *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0x50), *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0x58));
  v4.receiver = v1;
  v4.super_class = v2;
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t sub_23814A3F0(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x263F8EED0];

  id v3 = (char *)a1 + *(void *)((*v2 & *a1) + 0x68);
  uint64_t v4 = sub_23814B7A0();
  id v5 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  return v5(v3, v4);
}

uint64_t type metadata accessor for VideoPlayerViewController_AVPVC_Subclass()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for VideoPlayerBody()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_23814A514()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t type metadata accessor for AVPlayerViewControllerView_AVPVC_Subclass()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for AVPlayerViewControllerView()
{
  return __swift_instantiateGenericMetadata();
}

id sub_23814A588()
{
  type metadata accessor for VideoPlayerViewController();
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());

  return objc_msgSend(v0, sel_init);
}

uint64_t sub_23814A5CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = sub_23814B7A0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  objc_super v7 = (char *)&v12 - v6;
  uint64_t v8 = *(void **)(v2 + *(int *)(type metadata accessor for VideoPlayerConfiguration() + 36));
  id v9 = v8;
  sub_23814857C(v8);
  uint64_t v10 = *(void *)(v3 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v7, v2, v3);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v3);
  sub_23814A7BC((uint64_t)v7, (void (*)(void))sub_238148B60);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

id sub_23814A750()
{
  type metadata accessor for VideoPlayerViewController_AVPVC_Subclass();
  id v0 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  objc_msgSend(v0, sel_setAllowsEnteringFullScreen_, 0);
  objc_msgSend(v0, sel_setAllowsPictureInPicturePlayback_, 0);
  return v0;
}

uint64_t sub_23814A7BC(uint64_t a1, void (*a2)(void))
{
  uint64_t v5 = (char *)v2 + *(void *)((*MEMORY[0x263F8EED0] & *v2) + 0x68);
  swift_beginAccess();
  uint64_t v6 = sub_23814B7A0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(v5, a1, v6);
  swift_endAccess();
  return sub_2381496DC(a2);
}

uint64_t sub_23814A898(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = sub_23814B7A0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v12 - v8;
  objc_msgSend(a1, sel_setPlayer_, *(void *)(v3 + *(int *)(type metadata accessor for VideoPlayerConfiguration() + 36)));
  uint64_t v10 = *(void *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v9, v3, v5);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v9, 0, 1, v5);
  sub_23814A7BC((uint64_t)v9, (void (*)(void))sub_238149B14);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

id sub_23814AA20(uint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x263F8EED0];
  uint64_t v4 = *MEMORY[0x263F8EED0] & *(void *)v1;
  *(void *)&v1[*(void *)(v4 + 0x60)] = 0;
  (*(void (**)(char *, uint64_t, uint64_t, void))(*(void *)(*(void *)(v4 + 80) - 8) + 56))(&v1[*(void *)((*v3 & *(void *)v1) + 0x68)], 1, 1, *(void *)(v4 + 80));
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for VideoPlayerViewController_AVPVC_Subclass();
  return objc_msgSendSuper2(&v6, sel_initWithPlayerLayerView_, a1);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_23814AB54()
{
  unint64_t result = qword_268956868[0];
  if (!qword_268956868[0])
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, qword_268956868);
  }
  return result;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_23814ABF8(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (v5 <= 0x7FFFFFFE) {
    unsigned int v7 = 2147483646;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
    unsigned int v9 = a2 - v7;
    uint64_t v10 = v8 & 0xFFFFFFF8;
    if ((v8 & 0xFFFFFFF8) != 0) {
      unsigned int v11 = 2;
    }
    else {
      unsigned int v11 = v9 + 1;
    }
    if (v11 >= 0x10000) {
      unsigned int v12 = 4;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v11 < 0x100) {
      unsigned int v12 = 1;
    }
    if (v11 >= 2) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    switch(v13)
    {
      case 1:
        int v14 = *((unsigned __int8 *)a1 + v8);
        if (!v14) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v14 = *(unsigned __int16 *)((char *)a1 + v8);
        if (v14) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x23814AD4CLL);
      case 4:
        int v14 = *(_DWORD *)((char *)a1 + v8);
        if (!v14) {
          break;
        }
LABEL_22:
        int v16 = v14 - 1;
        if (v10)
        {
          int v16 = 0;
          LODWORD(v10) = *a1;
        }
        return v7 + (v10 | v16) + 1;
      default:
        break;
    }
  }
  if (v5 >= 0x7FFFFFFE) {
    return (*(uint64_t (**)(void))(v4 + 48))();
  }
  unint64_t v17 = *(void *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
  if (v17 >= 0xFFFFFFFF) {
    LODWORD(v17) = -1;
  }
  if ((v17 + 1) >= 2) {
    return v17;
  }
  else {
    return 0;
  }
}

void sub_23814AD60(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFE) {
    unsigned int v8 = 2147483646;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  unint64_t v10 = ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (((v9 + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
    unsigned int v11 = a3 - v8 + 1;
  }
  else {
    unsigned int v11 = 2;
  }
  if (v11 >= 0x10000) {
    int v12 = 4;
  }
  else {
    int v12 = 2;
  }
  if (v11 < 0x100) {
    int v12 = 1;
  }
  if (v11 >= 2) {
    unsigned int v13 = v12;
  }
  else {
    unsigned int v13 = 0;
  }
  if (v8 < a3) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  if (a2 > v8)
  {
    if (((v9 + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      int v15 = a2 - v8;
    }
    else {
      int v15 = 1;
    }
    if (((v9 + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      unsigned int v16 = ~v8 + a2;
      bzero(a1, ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 8);
      *(_DWORD *)a1 = v16;
    }
    switch(v14)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_43;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
  switch(v14)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 3:
LABEL_43:
      __break(1u);
      JUMPOUT(0x23814AF4CLL);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_32;
    default:
LABEL_32:
      if (a2)
      {
LABEL_33:
        if (v7 < 0x7FFFFFFE)
        {
          id v18 = (void *)((unint64_t)&a1[v9 + 7] & 0xFFFFFFFFFFFFFFF8);
          if (a2 > 0x7FFFFFFE)
          {
            *id v18 = 0;
            *(_DWORD *)id v18 = a2 - 0x7FFFFFFF;
          }
          else
          {
            *id v18 = a2;
          }
        }
        else
        {
          unint64_t v17 = *(void (**)(void))(v6 + 56);
          v17();
        }
      }
      return;
  }
}

uint64_t sub_23814AF74()
{
  return swift_getWitnessTable();
}

uint64_t sub_23814B040()
{
  return swift_getWitnessTable();
}

uint64_t sub_23814B05C()
{
  return swift_getWitnessTable();
}

uint64_t sub_23814B078()
{
  return MEMORY[0x263F1BB58];
}

uint64_t sub_23814B088()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23814B120(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (v5 <= 0x7FFFFFFE) {
    unsigned int v7 = 2147483646;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
    unsigned int v9 = a2 - v7;
    uint64_t v10 = v8 & 0xFFFFFFF8;
    if ((v8 & 0xFFFFFFF8) != 0) {
      unsigned int v11 = 2;
    }
    else {
      unsigned int v11 = v9 + 1;
    }
    if (v11 >= 0x10000) {
      unsigned int v12 = 4;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v11 < 0x100) {
      unsigned int v12 = 1;
    }
    if (v11 >= 2) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    switch(v13)
    {
      case 1:
        int v14 = *((unsigned __int8 *)a1 + v8);
        if (!v14) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v14 = *(unsigned __int16 *)((char *)a1 + v8);
        if (v14) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x23814B274);
      case 4:
        int v14 = *(_DWORD *)((char *)a1 + v8);
        if (!v14) {
          break;
        }
LABEL_22:
        int v16 = v14 - 1;
        if (v10)
        {
          int v16 = 0;
          LODWORD(v10) = *a1;
        }
        return v7 + (v10 | v16) + 1;
      default:
        break;
    }
  }
  if (v5 >= 0x7FFFFFFE) {
    return (*(uint64_t (**)(void))(v4 + 48))();
  }
  unint64_t v17 = *(void *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
  if (v17 >= 0xFFFFFFFF) {
    LODWORD(v17) = -1;
  }
  if ((v17 + 1) >= 2) {
    return v17;
  }
  else {
    return 0;
  }
}

void sub_23814B288(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFE) {
    unsigned int v8 = 2147483646;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  unint64_t v10 = ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (((v9 + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
    unsigned int v11 = a3 - v8 + 1;
  }
  else {
    unsigned int v11 = 2;
  }
  if (v11 >= 0x10000) {
    int v12 = 4;
  }
  else {
    int v12 = 2;
  }
  if (v11 < 0x100) {
    int v12 = 1;
  }
  if (v11 >= 2) {
    unsigned int v13 = v12;
  }
  else {
    unsigned int v13 = 0;
  }
  if (v8 < a3) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  if (a2 > v8)
  {
    if (((v9 + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      int v15 = a2 - v8;
    }
    else {
      int v15 = 1;
    }
    if (((v9 + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      unsigned int v16 = ~v8 + a2;
      bzero(a1, ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 8);
      *(_DWORD *)a1 = v16;
    }
    switch(v14)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_43;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
  switch(v14)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 3:
LABEL_43:
      __break(1u);
      JUMPOUT(0x23814B474);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_32;
    default:
LABEL_32:
      if (a2)
      {
LABEL_33:
        if (v7 < 0x7FFFFFFE)
        {
          id v18 = (void *)((unint64_t)&a1[v9 + 7] & 0xFFFFFFFFFFFFFFF8);
          if (a2 > 0x7FFFFFFE)
          {
            *id v18 = 0;
            *(_DWORD *)id v18 = a2 - 0x7FFFFFFF;
          }
          else
          {
            *id v18 = a2;
          }
        }
        else
        {
          unint64_t v17 = *(void (**)(void))(v6 + 56);
          v17();
        }
      }
      return;
  }
}

uint64_t type metadata accessor for VideoPlayerConfiguration()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_23814B4B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 32))(a4, a1);
  uint64_t result = type metadata accessor for VideoPlayerConfiguration();
  *(void *)(a4 + *(int *)(result + 36)) = a2;
  return result;
}

uint64_t sub_23814B530()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_23814B540()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_23814B550()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_23814B560()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_23814B570()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_23814B580()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_23814B590()
{
  return MEMORY[0x270EFFD80]();
}

uint64_t sub_23814B5A0()
{
  return MEMORY[0x270EFFD98]();
}

uint64_t sub_23814B5B0()
{
  return MEMORY[0x270EFFDB0]();
}

uint64_t sub_23814B5C0()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_23814B5D0()
{
  return MEMORY[0x270F017F8]();
}

uint64_t sub_23814B5E0()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_23814B5F0()
{
  return MEMORY[0x270F01818]();
}

uint64_t sub_23814B600()
{
  return MEMORY[0x270F02468]();
}

uint64_t sub_23814B610()
{
  return MEMORY[0x270F02470]();
}

uint64_t sub_23814B620()
{
  return MEMORY[0x270F02478]();
}

uint64_t sub_23814B630()
{
  return MEMORY[0x270F02480]();
}

uint64_t sub_23814B640()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_23814B650()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_23814B670()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_23814B680()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_23814B690()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_23814B6B0()
{
  return MEMORY[0x270F02728]();
}

uint64_t sub_23814B6C0()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_23814B6D0()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_23814B6E0()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_23814B6F0()
{
  return MEMORY[0x270F03DD8]();
}

uint64_t sub_23814B700()
{
  return MEMORY[0x270F04170]();
}

uint64_t sub_23814B710()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_23814B720()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_23814B730()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_23814B740()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_23814B750()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_23814B760()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_23814B770()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_23814B780()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_23814B790()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_23814B7A0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_23814B7B0()
{
  return MEMORY[0x270F9FC28]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
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