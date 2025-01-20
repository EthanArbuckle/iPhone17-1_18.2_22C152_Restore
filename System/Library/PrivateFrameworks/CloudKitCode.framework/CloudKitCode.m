uint64_t Ckcode_Proto2Any.typeURL.getter()
{
  type metadata accessor for Ckcode_Proto2Any(0);
  swift_bridgeObjectRetain();
  return sub_20CB6A8B0();
}

uint64_t type metadata accessor for Ckcode_Proto2Any(uint64_t a1)
{
  return sub_20CB65B7C(a1, (uint64_t *)&unk_2676F0C48);
}

uint64_t sub_20CB64A3C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = Ckcode_Proto2Any.typeURL.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_20CB64A68(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  swift_bridgeObjectRetain();
  return Ckcode_Proto2Any.typeURL.setter(v1, v2);
}

uint64_t Ckcode_Proto2Any.typeURL.setter(uint64_t a1, uint64_t a2)
{
  v5 = (void *)(v2 + *(int *)(type metadata accessor for Ckcode_Proto2Any(0) + 20));
  uint64_t result = swift_bridgeObjectRelease();
  void *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t Ckcode_Proto2Any.typeURL.modify(uint64_t a1)
{
  *(void *)(a1 + 16) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for Ckcode_Proto2Any(0) + 20);
  *(_DWORD *)(a1 + 24) = v3;
  v4 = (uint64_t *)(v1 + v3);
  unint64_t v5 = v4[1];
  if (v5)
  {
    uint64_t v6 = *v4;
    unint64_t v7 = v5;
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0xE000000000000000;
  }
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  swift_bridgeObjectRetain();
  return sub_20CB6A898();
}

uint64_t sub_20CB64B68(uint64_t *a1, char a2)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = (void *)(a1[2] + *((int *)a1 + 6));
  uint64_t v4 = *a1;
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *uint64_t v3 = v4;
    v3[1] = v2;
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v3 = v4;
    v3[1] = v2;
  }
  return result;
}

BOOL Ckcode_Proto2Any.hasTypeURL.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for Ckcode_Proto2Any(0) + 20) + 8) != 0;
}

Swift::Void __swiftcall Ckcode_Proto2Any.clearTypeURL()()
{
  uint64_t v1 = (void *)(v0 + *(int *)(type metadata accessor for Ckcode_Proto2Any(0) + 20));
  swift_bridgeObjectRelease();
  *uint64_t v1 = 0;
  v1[1] = 0;
}

uint64_t Ckcode_Proto2Any.value.getter()
{
  uint64_t v0 = type metadata accessor for Ckcode_Proto2Any(0);
  uint64_t v1 = sub_20CB6AA60(*(int *)(v0 + 24));
  sub_20CB64C90(v1, v2);
  return sub_20CB6A8B0();
}

uint64_t sub_20CB64C90(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_20CB64CA4(a1, a2);
  }
  return a1;
}

uint64_t sub_20CB64CA4(uint64_t a1, unint64_t a2)
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

uint64_t sub_20CB64CFC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = Ckcode_Proto2Any.value.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_20CB64D28(uint64_t *a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = a1[1];
  sub_20CB64CA4(*a1, v2);
  return Ckcode_Proto2Any.value.setter(v1, v2);
}

uint64_t Ckcode_Proto2Any.value.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2 + *(int *)(type metadata accessor for Ckcode_Proto2Any(0) + 24);
  uint64_t result = sub_20CB64DB4(*(void *)v5, *(void *)(v5 + 8));
  *(void *)uint64_t v5 = a1;
  *(void *)(v5 + 8) = a2;
  return result;
}

uint64_t sub_20CB64DB4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_20CB64DC8(a1, a2);
  }
  return a1;
}

uint64_t sub_20CB64DC8(uint64_t a1, unint64_t a2)
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

uint64_t (*Ckcode_Proto2Any.value.modify(uint64_t a1))(uint64_t *a1, char a2)
{
  *(void *)(a1 + 16) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for Ckcode_Proto2Any(0) + 24);
  *(_DWORD *)(a1 + 24) = v3;
  uint64_t v6 = sub_20CB6AA60(v3);
  if (!v5 & v4) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = v6;
  }
  unint64_t v9 = 0xC000000000000000;
  if (!(!v5 & v4)) {
    unint64_t v9 = v7;
  }
  *(void *)a1 = v8;
  *(void *)(a1 + 8) = v9;
  sub_20CB64C90(v6, v7);
  return sub_20CB64E88;
}

uint64_t sub_20CB64E88(uint64_t *a1, char a2)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[2] + *((int *)a1 + 6);
  uint64_t v4 = *a1;
  uint64_t v5 = *(void *)v3;
  unint64_t v6 = *(void *)(v3 + 8);
  if (a2)
  {
    uint64_t v7 = sub_20CB6A898();
    sub_20CB64CA4(v7, v8);
    sub_20CB64DB4(v5, v6);
    *(void *)uint64_t v3 = v4;
    *(void *)(v3 + 8) = v2;
    uint64_t v9 = sub_20CB6A898();
    return sub_20CB64DC8(v9, v10);
  }
  else
  {
    uint64_t result = sub_20CB64DB4(*(void *)v3, *(void *)(v3 + 8));
    *(void *)uint64_t v3 = v4;
    *(void *)(v3 + 8) = v2;
  }
  return result;
}

BOOL Ckcode_Proto2Any.hasValue.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for Ckcode_Proto2Any(0) + 24) + 8) >> 60 != 15;
}

Swift::Void __swiftcall Ckcode_Proto2Any.clearValue()()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for Ckcode_Proto2Any(0) + 24);
  sub_20CB64DB4(*(void *)v1, *(void *)(v1 + 8));
  *(_OWORD *)uint64_t v1 = xmmword_20CB96470;
}

uint64_t Ckcode_Proto2Any.unknownFields.getter()
{
  type metadata accessor for UnknownStorage();
  sub_20CB6A86C();
  uint64_t v0 = sub_20CB6A8B0();
  return v1(v0);
}

uint64_t Ckcode_Proto2Any.unknownFields.setter()
{
  type metadata accessor for UnknownStorage();
  sub_20CB6A86C();
  uint64_t v0 = sub_20CB6A898();
  return v1(v0);
}

uint64_t (*Ckcode_Proto2Any.unknownFields.modify())()
{
  return nullsub_1;
}

double Ckcode_Proto2Any.init()@<D0>(uint64_t a1@<X8>)
{
  UnknownStorage.init()();
  uint64_t v2 = type metadata accessor for Ckcode_Proto2Any(0);
  sub_20CB6AA74(v2);
  double result = 0.0;
  *(_OWORD *)(a1 + v4) = xmmword_20CB96470;
  return result;
}

uint64_t Ckcode_Proto2ProtectedEnvelope.contents.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20CB6A418(v1, a1, &qword_2676F0BE8);
}

uint64_t sub_20CB650D0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t Ckcode_Proto2ProtectedEnvelope.contents.setter(uint64_t a1)
{
  return sub_20CB6511C(a1, v1);
}

uint64_t sub_20CB6511C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_20CB650D0(&qword_2676F0BE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*Ckcode_Proto2ProtectedEnvelope.contents.modify())()
{
  return nullsub_1;
}

uint64_t Ckcode_Proto2ProtectedEnvelope.encrypted.getter()
{
  uint64_t v1 = sub_20CB650D0(&qword_2676F0BE8);
  uint64_t v2 = sub_20CB6A8A4(v1);
  MEMORY[0x270FA5388](v2);
  sub_20CB6A924();
  uint64_t v3 = sub_20CB6A898();
  sub_20CB6A418(v3, v4, &qword_2676F0BE8);
  uint64_t v5 = type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(0);
  sub_20CB6AA88(v0, 1, v5);
  if (v6)
  {
    sub_20CB6A3C4(v0, &qword_2676F0BE8);
    return 0;
  }
  sub_20CB6A8B0();
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    sub_20CB65A98(v0, (void (*)(void))type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
    return 0;
  }
  return *(void *)v0;
}

uint64_t type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(uint64_t a1)
{
  return sub_20CB65B7C(a1, (uint64_t *)&unk_2676F0C70);
}

uint64_t _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_20CB652C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = Ckcode_Proto2ProtectedEnvelope.encrypted.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_20CB652F4(uint64_t *a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = a1[1];
  sub_20CB64CA4(*a1, v2);
  return Ckcode_Proto2ProtectedEnvelope.encrypted.setter(v1, v2);
}

uint64_t Ckcode_Proto2ProtectedEnvelope.encrypted.setter(uint64_t a1, uint64_t a2)
{
  sub_20CB6A3C4((uint64_t)v2, &qword_2676F0BE8);
  *unint64_t v2 = a1;
  v2[1] = a2;
  type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(0);
  sub_20CB6A898();
  swift_storeEnumTagMultiPayload();
  uint64_t v5 = sub_20CB6A984();
  return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v5, v6, v7, v8);
}

uint64_t _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

void (*Ckcode_Proto2ProtectedEnvelope.encrypted.modify(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v2 = v1;
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[2] = v2;
  uint64_t v5 = sub_20CB650D0(&qword_2676F0BE8);
  sub_20CB6A8A4(v5);
  uint64_t v7 = (long long *)malloc(*(void *)(v6 + 64));
  v4[3] = v7;
  sub_20CB6A418(v2, (uint64_t)v7, &qword_2676F0BE8);
  uint64_t v8 = type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(0);
  v4[4] = v8;
  sub_20CB6AA88((uint64_t)v7, 1, v8);
  if (v9)
  {
    sub_20CB6A3C4((uint64_t)v7, &qword_2676F0BE8);
  }
  else
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload != 1)
    {
      long long v11 = *v7;
      goto LABEL_8;
    }
    sub_20CB65A98((uint64_t)v7, (void (*)(void))type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
  }
  long long v11 = xmmword_20CB96480;
LABEL_8:
  *(_OWORD *)uint64_t v4 = v11;
  return sub_20CB654E8;
}

void sub_20CB654E8(uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a1)[3];
  uint64_t v4 = (*a1)[2];
  if (a2)
  {
    sub_20CB64CA4(**a1, (*a1)[1]);
    sub_20CB6A3C4(v4, &qword_2676F0BE8);
    sub_20CB6A9AC();
    sub_20CB6AA14();
    sub_20CB64DC8(*v2, v2[1]);
  }
  else
  {
    sub_20CB6A3C4((*a1)[2], &qword_2676F0BE8);
    sub_20CB6A9AC();
    sub_20CB6AA14();
  }
  free(v3);
  free(v2);
}

double Ckcode_Proto2ProtectedEnvelope.value.getter@<D0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_20CB650D0(&qword_2676F0BE8);
  uint64_t v4 = sub_20CB6A8A4(v3);
  MEMORY[0x270FA5388](v4);
  sub_20CB6A90C();
  uint64_t v5 = sub_20CB6AA40();
  sub_20CB6A418(v5, v6, &qword_2676F0BE8);
  uint64_t v7 = type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(0);
  sub_20CB6AA88(v1, 1, v7);
  if (v8)
  {
    sub_20CB6A3C4(v1, &qword_2676F0BE8);
  }
  else
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      sub_20CB6A898();
      sub_20CB68464();
      return result;
    }
    sub_20CB65A98(v1, (void (*)(void))type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
  }
  UnknownStorage.init()();
  uint64_t v11 = type metadata accessor for Ckcode_Proto2Any(0);
  sub_20CB6AA74(v11);
  double result = 0.0;
  *(_OWORD *)(a1 + v12) = xmmword_20CB96470;
  return result;
}

double sub_20CB656A4@<D0>(uint64_t a1@<X8>)
{
  return Ckcode_Proto2ProtectedEnvelope.value.getter(a1);
}

uint64_t sub_20CB656C8()
{
  uint64_t v0 = type metadata accessor for Ckcode_Proto2Any(0);
  MEMORY[0x270FA5388](v0 - 8);
  sub_20CB65F1C();
  return Ckcode_Proto2ProtectedEnvelope.value.setter();
}

uint64_t Ckcode_Proto2ProtectedEnvelope.value.setter()
{
  sub_20CB6A3C4(v0, &qword_2676F0BE8);
  sub_20CB6A8B0();
  sub_20CB68464();
  type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(0);
  sub_20CB6A898();
  swift_storeEnumTagMultiPayload();
  uint64_t v1 = sub_20CB6A984();
  return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v1, v2, v3, v4);
}

void (*Ckcode_Proto2ProtectedEnvelope.value.modify(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  *uint64_t v3 = v1;
  uint64_t v4 = sub_20CB650D0(&qword_2676F0BE8);
  sub_20CB6A8A4(v4);
  uint64_t v6 = malloc(*(void *)(v5 + 64));
  v3[1] = v6;
  uint64_t v7 = type metadata accessor for Ckcode_Proto2Any(0);
  sub_20CB6A86C();
  size_t v9 = *(void *)(v8 + 64);
  v3[2] = malloc(v9);
  unint64_t v10 = (char *)malloc(v9);
  v3[3] = v10;
  uint64_t v11 = sub_20CB6AA34();
  sub_20CB6A418(v11, v12, &qword_2676F0BE8);
  uint64_t v13 = type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(0);
  v3[4] = v13;
  sub_20CB6AA88((uint64_t)v6, 1, v13);
  if (v14)
  {
    sub_20CB6A3C4((uint64_t)v6, &qword_2676F0BE8);
LABEL_7:
    UnknownStorage.init()();
    v16 = &v10[*(int *)(v7 + 20)];
    *(void *)v16 = 0;
    *((void *)v16 + 1) = 0;
    *(_OWORD *)&v10[*(int *)(v7 + 24)] = xmmword_20CB96470;
    return sub_20CB65968;
  }
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload != 1)
  {
    sub_20CB65A98((uint64_t)v6, (void (*)(void))type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
    goto LABEL_7;
  }
  sub_20CB68464();
  return sub_20CB65968;
}

void sub_20CB65968(uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a1)[3];
  uint64_t v4 = (void *)(*a1)[1];
  uint64_t v5 = (void *)(*a1)[2];
  uint64_t v6 = **a1;
  if (a2)
  {
    sub_20CB65F1C();
    sub_20CB6A3C4(v6, &qword_2676F0BE8);
    sub_20CB68464();
    swift_storeEnumTagMultiPayload();
    sub_20CB6A9CC();
    sub_20CB65A98((uint64_t)v3, (void (*)(void))type metadata accessor for Ckcode_Proto2Any);
  }
  else
  {
    sub_20CB6A3C4(**a1, &qword_2676F0BE8);
    sub_20CB68464();
    swift_storeEnumTagMultiPayload();
    sub_20CB6A9CC();
  }
  free(v3);
  free(v5);
  free(v4);
  free(v2);
}

uint64_t sub_20CB65A98(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_20CB6A86C();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t Ckcode_Proto2ProtectedEnvelope.unknownFields.getter()
{
  type metadata accessor for Ckcode_Proto2ProtectedEnvelope(0);
  type metadata accessor for UnknownStorage();
  sub_20CB6A86C();
  uint64_t v0 = sub_20CB6A8B0();
  return v1(v0);
}

uint64_t type metadata accessor for Ckcode_Proto2ProtectedEnvelope(uint64_t a1)
{
  return sub_20CB65B7C(a1, (uint64_t *)&unk_2676F0C58);
}

uint64_t sub_20CB65B7C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t Ckcode_Proto2ProtectedEnvelope.unknownFields.setter()
{
  type metadata accessor for Ckcode_Proto2ProtectedEnvelope(0);
  type metadata accessor for UnknownStorage();
  sub_20CB6A86C();
  uint64_t v0 = sub_20CB6A898();
  return v1(v0);
}

uint64_t (*Ckcode_Proto2ProtectedEnvelope.unknownFields.modify())(void)
{
  return nullsub_1;
}

uint64_t static Ckcode_Proto2ProtectedEnvelope.OneOf_Contents.== infix(_:_:)()
{
  uint64_t v2 = type metadata accessor for Ckcode_Proto2Any(0);
  uint64_t v3 = sub_20CB6A8A4(v2);
  MEMORY[0x270FA5388](v3);
  sub_20CB6A90C();
  type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(0);
  sub_20CB6A86C();
  MEMORY[0x270FA5388](v4);
  sub_20CB6A8BC();
  uint64_t v7 = v5 - v6;
  MEMORY[0x270FA5388](v8);
  unint64_t v10 = (uint64_t *)((char *)&v23 - v9);
  uint64_t v11 = sub_20CB650D0(&qword_2676F0BF0);
  uint64_t v12 = sub_20CB6A8A4(v11);
  MEMORY[0x270FA5388](v12);
  sub_20CB6A924();
  char v14 = (uint64_t *)(v0 + *(int *)(v13 + 56));
  sub_20CB65F1C();
  sub_20CB65F1C();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_20CB65F1C();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_20CB68464();
      uint64_t v15 = sub_20CB6AA40();
      char v17 = static Ckcode_Proto2Any.== infix(_:_:)(v15, v16);
      sub_20CB65A98(v1, (void (*)(void))type metadata accessor for Ckcode_Proto2Any);
      sub_20CB65A98(v7, (void (*)(void))type metadata accessor for Ckcode_Proto2Any);
LABEL_9:
      sub_20CB65A98(v0, (void (*)(void))type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
      return v17 & 1;
    }
    sub_20CB65A98(v7, (void (*)(void))type metadata accessor for Ckcode_Proto2Any);
  }
  else
  {
    sub_20CB65F1C();
    uint64_t v18 = *v10;
    unint64_t v19 = v10[1];
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      uint64_t v20 = *v14;
      unint64_t v21 = v14[1];
      char v17 = MEMORY[0x210555120](v18, v19, v20, v21);
      sub_20CB64DC8(v20, v21);
      sub_20CB64DC8(v18, v19);
      goto LABEL_9;
    }
    sub_20CB64DC8(v18, v19);
  }
  sub_20CB6A3C4(v0, &qword_2676F0BF0);
  char v17 = 0;
  return v17 & 1;
}

uint64_t sub_20CB65F1C()
{
  uint64_t v1 = sub_20CB6AA00();
  v2(v1);
  sub_20CB6A86C();
  uint64_t v3 = sub_20CB6AA4C();
  v4(v3);
  return v0;
}

uint64_t static Ckcode_Proto2Any.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UnknownStorage();
  sub_20CB6A87C();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  sub_20CB6A8BC();
  unint64_t v10 = (char *)(v8 - v9);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v36 - v12;
  uint64_t v14 = type metadata accessor for Ckcode_Proto2Any(0);
  uint64_t v15 = *(int *)(v14 + 20);
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = *(void *)(a1 + v15 + 8);
  uint64_t v18 = (void *)(a2 + v15);
  uint64_t v19 = v18[1];
  if (!v17)
  {
    if (v19) {
      goto LABEL_17;
    }
    goto LABEL_10;
  }
  if (!v19) {
    goto LABEL_17;
  }
  BOOL v20 = *v16 == *v18 && v17 == v19;
  if (v20 || (char v21 = 0, (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0))
  {
LABEL_10:
    uint64_t v22 = *(int *)(v14 + 24);
    uint64_t v23 = *(void *)(a1 + v22);
    unint64_t v24 = *(void *)(a1 + v22 + 8);
    v25 = (uint64_t *)(a2 + v22);
    uint64_t v26 = *v25;
    unint64_t v27 = v25[1];
    if (v24 >> 60 == 15)
    {
      if (v27 >> 60 == 15) {
        goto LABEL_16;
      }
      goto LABEL_14;
    }
    if (v27 >> 60 == 15)
    {
LABEL_14:
      uint64_t v28 = sub_20CB6A93C();
      sub_20CB64DB4(v28, v29);
      sub_20CB64DB4(v26, v27);
      goto LABEL_17;
    }
    uint64_t v30 = sub_20CB6A93C();
    int v37 = MEMORY[0x210555120](v30);
    sub_20CB64DB4(v26, v27);
    sub_20CB64DB4(v23, v24);
    if (v37)
    {
LABEL_16:
      v31 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
      v31(v13, a1, v4);
      v31(v10, a2, v4);
      sub_20CB6841C(&qword_2676F0BF8, MEMORY[0x263F50560]);
      char v21 = dispatch thunk of static Equatable.== infix(_:_:)();
      v32 = *(void (**)(uint64_t))(v6 + 8);
      uint64_t v33 = sub_20CB6A8B0();
      v32(v33);
      uint64_t v34 = sub_20CB6AA40();
      v32(v34);
      return v21 & 1;
    }
LABEL_17:
    char v21 = 0;
  }
  return v21 & 1;
}

uint64_t Ckcode_Proto2ProtectedEnvelope.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(0);
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(a1, 1, 1, v2);
  type metadata accessor for Ckcode_Proto2ProtectedEnvelope(0);
  return UnknownStorage.init()();
}

void sub_20CB661FC()
{
  qword_2676F0B38 = 0x65646F636B63;
  unk_2676F0B40 = 0xE600000000000000;
}

uint64_t sub_20CB6621C(uint64_t a1)
{
  return sub_20CB6693C(a1, 0xD000000000000010, qword_2676F0B50, 0x800000020CB9A760, &qword_2676F0B50[1]);
}

uint64_t static Ckcode_Proto2Any.protoMessageName.getter()
{
  return sub_20CB669D0(&qword_2676F0B48);
}

uint64_t sub_20CB6626C()
{
  uint64_t v0 = type metadata accessor for _NameMap();
  sub_20CB6A468(v0, qword_2676F0B68);
  sub_20CB683E4(v0, (uint64_t)qword_2676F0B68);
  sub_20CB650D0(&qword_2676F0CA0);
  uint64_t v1 = (int *)(sub_20CB650D0(&qword_2676F0CA8) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_20CB96490;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  void *v5 = 1;
  *(void *)unint64_t v6 = "type_url";
  *(void *)(v6 + 8) = 8;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50728];
  uint64_t v8 = type metadata accessor for _NameMap.NameDescription();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)unint64_t v10 = "value";
  *((void *)v10 + 1) = 5;
  v10[16] = 2;
  v9();
  return _NameMap.init(dictionaryLiteral:)();
}

uint64_t static Ckcode_Proto2Any._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20CB66BFC(&qword_2676F0B60, (uint64_t)qword_2676F0B68, a1);
}

uint64_t Ckcode_Proto2Any.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2)
{
  sub_20CB6A8E0(a1, a2);
  while (1)
  {
    uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
    if (v2 || (v4 & 1) != 0) {
      break;
    }
    if (result == 2)
    {
      sub_20CB6A8CC();
      sub_20CB6651C();
    }
    else if (result == 1)
    {
      sub_20CB6A8CC();
      sub_20CB664B8();
    }
    sub_20CB6AA34();
  }
  return result;
}

uint64_t sub_20CB664B8()
{
  return dispatch thunk of Decoder.decodeSingularStringField(value:)();
}

uint64_t sub_20CB6651C()
{
  return dispatch thunk of Decoder.decodeSingularBytesField(value:)();
}

uint64_t Ckcode_Proto2Any.traverse<A>(visitor:)()
{
  uint64_t v1 = sub_20CB6A998();
  uint64_t result = sub_20CB665D4(v1);
  if (!v0)
  {
    uint64_t v3 = sub_20CB6A998();
    sub_20CB6664C(v3);
    sub_20CB6AA34();
    return UnknownStorage.traverse<A>(visitor:)();
  }
  return result;
}

uint64_t sub_20CB665D4(uint64_t a1)
{
  uint64_t result = type metadata accessor for Ckcode_Proto2Any(0);
  if (*(void *)(a1 + *(int *)(result + 20) + 8)) {
    return dispatch thunk of Visitor.visitSingularStringField(value:fieldNumber:)();
  }
  return result;
}

uint64_t sub_20CB6664C(uint64_t a1)
{
  uint64_t result = type metadata accessor for Ckcode_Proto2Any(0);
  uint64_t v3 = a1 + *(int *)(result + 24);
  unint64_t v4 = *(void *)(v3 + 8);
  if (v4 >> 60 != 15)
  {
    uint64_t v5 = *(void *)v3;
    sub_20CB64CA4(*(void *)v3, *(void *)(v3 + 8));
    dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)();
    return sub_20CB64DB4(v5, v4);
  }
  return result;
}

Swift::Int Ckcode_Proto2Any.hashValue.getter()
{
  return sub_20CB67C84((void (*)(void))type metadata accessor for Ckcode_Proto2Any, &qword_2676F0C00, (void (*)(uint64_t))type metadata accessor for Ckcode_Proto2Any);
}

uint64_t (*sub_20CB66748())()
{
  return nullsub_1;
}

uint64_t sub_20CB66768(uint64_t a1, uint64_t a2)
{
  return Ckcode_Proto2Any.decodeMessage<A>(decoder:)(a1, a2);
}

uint64_t sub_20CB66780()
{
  return Ckcode_Proto2Any.traverse<A>(visitor:)();
}

uint64_t sub_20CB6679C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_20CB6841C(&qword_2676F0C90, (void (*)(uint64_t))type metadata accessor for Ckcode_Proto2Any);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_20CB66820(uint64_t a1)
{
  uint64_t v2 = sub_20CB6841C(&qword_2676F0C20, (void (*)(uint64_t))type metadata accessor for Ckcode_Proto2Any);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_20CB66890()
{
  sub_20CB6841C(&qword_2676F0C20, (void (*)(uint64_t))type metadata accessor for Ckcode_Proto2Any);
  return Message.hash(into:)();
}

uint64_t sub_20CB66914(uint64_t a1)
{
  return sub_20CB6693C(a1, 0xD00000000000001ELL, qword_2676F0B88, 0x800000020CB9A730, &qword_2676F0B88[1]);
}

uint64_t sub_20CB6693C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  if (qword_2676F0B30 != -1) {
    uint64_t result = swift_once();
  }
  *a3 = a2;
  *a5 = a4;
  return result;
}

uint64_t static Ckcode_Proto2ProtectedEnvelope.protoMessageName.getter()
{
  return sub_20CB669D0(&qword_2676F0B80);
}

uint64_t sub_20CB669D0(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return sub_20CB6A898();
}

uint64_t sub_20CB66A20()
{
  uint64_t v0 = type metadata accessor for _NameMap();
  sub_20CB6A468(v0, qword_2676F0BA0);
  sub_20CB683E4(v0, (uint64_t)qword_2676F0BA0);
  sub_20CB650D0(&qword_2676F0CA0);
  uint64_t v1 = (int *)(sub_20CB650D0(&qword_2676F0CA8) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_20CB96490;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  void *v5 = 1;
  *(void *)unint64_t v6 = "encrypted";
  *(void *)(v6 + 8) = 9;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = type metadata accessor for _NameMap.NameDescription();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)unint64_t v10 = "value";
  *((void *)v10 + 1) = 5;
  v10[16] = 2;
  v9();
  return _NameMap.init(dictionaryLiteral:)();
}

uint64_t static Ckcode_Proto2ProtectedEnvelope._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20CB66BFC(&qword_2676F0B98, (uint64_t)qword_2676F0BA0, a1);
}

uint64_t sub_20CB66BFC@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for _NameMap();
  uint64_t v6 = sub_20CB683E4(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

uint64_t Ckcode_Proto2ProtectedEnvelope.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2)
{
  sub_20CB6A8E0(a1, a2);
  while (1)
  {
    uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
    if (v2 || (v6 & 1) != 0) {
      break;
    }
    if (result == 2)
    {
      uint64_t v9 = sub_20CB6A8B0();
      sub_20CB66EB8(v9, v10, v4, v3);
    }
    else if (result == 1)
    {
      uint64_t v7 = sub_20CB6A8CC();
      sub_20CB66D04(v7, v8);
    }
    sub_20CB6AA34();
  }
  return result;
}

uint64_t sub_20CB66D04(uint64_t a1, long long *a2)
{
  uint64_t v4 = sub_20CB650D0(&qword_2676F0BE8);
  MEMORY[0x270FA5388](v4 - 8);
  char v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v11 = xmmword_20CB96470;
  uint64_t result = dispatch thunk of Decoder.decodeSingularBytesField(value:)();
  long long v8 = v11;
  if (v2) {
    return sub_20CB64DB4(v11, *((unint64_t *)&v11 + 1));
  }
  if (*((void *)&v11 + 1) >> 60 != 15)
  {
    sub_20CB6A418((uint64_t)a2, (uint64_t)v6, &qword_2676F0BE8);
    uint64_t v12 = type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(0);
    int v9 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)v6, 1, v12);
    sub_20CB64CA4(v8, *((unint64_t *)&v8 + 1));
    sub_20CB6A3C4((uint64_t)v6, &qword_2676F0BE8);
    if (v9 != 1) {
      dispatch thunk of Decoder.handleConflictingOneOf()();
    }
    sub_20CB64DB4(v8, *((unint64_t *)&v8 + 1));
    sub_20CB6A3C4((uint64_t)a2, &qword_2676F0BE8);
    *a2 = v8;
    uint64_t v10 = v12;
    swift_storeEnumTagMultiPayload();
    return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)a2, 0, 1, v10);
  }
  return result;
}

uint64_t sub_20CB66EB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v30 = a2;
  uint64_t v32 = a4;
  uint64_t v31 = a3;
  uint64_t v5 = type metadata accessor for Ckcode_Proto2Any(0);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v28 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = sub_20CB650D0(&qword_2676F0BE8);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(0);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = sub_20CB650D0(&qword_2676F0C98);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v18 = (char *)&v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  BOOL v20 = (char *)&v26 - v19;
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)&v26 - v19, 1, 1, v5);
  uint64_t v26 = a1;
  sub_20CB6A418(a1, (uint64_t)v10, &qword_2676F0BE8);
  int v27 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)v10, 1, v11);
  if (v27 == 1)
  {
    sub_20CB6A3C4((uint64_t)v10, &qword_2676F0BE8);
    uint64_t v21 = v11;
  }
  else
  {
    sub_20CB68464();
    sub_20CB68464();
    uint64_t v21 = v11;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_20CB6A3C4((uint64_t)v20, &qword_2676F0C98);
      sub_20CB68464();
      sub_20CB68464();
      _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)v20, 0, 1, v5);
    }
    else
    {
      sub_20CB65A98((uint64_t)v14, (void (*)(void))type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
    }
  }
  uint64_t v22 = v29;
  sub_20CB6841C(&qword_2676F0C20, (void (*)(uint64_t))type metadata accessor for Ckcode_Proto2Any);
  dispatch thunk of Decoder.decodeSingularMessageField<A>(value:)();
  if (v22)
  {
    uint64_t v23 = (uint64_t)v20;
    return sub_20CB6A3C4(v23, &qword_2676F0C98);
  }
  sub_20CB6A418((uint64_t)v20, (uint64_t)v18, &qword_2676F0C98);
  if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)v18, 1, v5) == 1)
  {
    sub_20CB6A3C4((uint64_t)v20, &qword_2676F0C98);
    uint64_t v23 = (uint64_t)v18;
    return sub_20CB6A3C4(v23, &qword_2676F0C98);
  }
  sub_20CB68464();
  if (v27 != 1) {
    dispatch thunk of Decoder.handleConflictingOneOf()();
  }
  sub_20CB6A3C4((uint64_t)v20, &qword_2676F0C98);
  uint64_t v25 = v26;
  sub_20CB6A3C4(v26, &qword_2676F0BE8);
  sub_20CB68464();
  swift_storeEnumTagMultiPayload();
  return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v25, 0, 1, v21);
}

uint64_t Ckcode_Proto2ProtectedEnvelope.traverse<A>(visitor:)()
{
  uint64_t v2 = sub_20CB650D0(&qword_2676F0BE8);
  uint64_t v3 = sub_20CB6A8A4(v2);
  MEMORY[0x270FA5388](v3);
  sub_20CB6A8FC();
  uint64_t v6 = v5 - v4;
  sub_20CB6A418(v0, v5 - v4, &qword_2676F0BE8);
  uint64_t v7 = type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(0);
  if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(v6, 1, v7) == 1) {
    goto LABEL_2;
  }
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_20CB6A96C();
    sub_20CB67604(v9);
    uint64_t result = sub_20CB65A98(v6, (void (*)(void))type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
    if (!v1)
    {
LABEL_2:
      type metadata accessor for Ckcode_Proto2ProtectedEnvelope(0);
      return UnknownStorage.traverse<A>(visitor:)();
    }
  }
  else
  {
    sub_20CB65A98(v6, (void (*)(void))type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
    uint64_t v10 = sub_20CB6A96C();
    uint64_t result = sub_20CB674BC(v10);
    if (!v1) {
      goto LABEL_2;
    }
  }
  return result;
}

uint64_t sub_20CB674BC(uint64_t a1)
{
  uint64_t v2 = sub_20CB650D0(&qword_2676F0BE8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (uint64_t *)((char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_20CB6A418(a1, (uint64_t)v4, &qword_2676F0BE8);
  uint64_t v5 = type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(0);
  if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)v4, 1, v5) == 1)
  {
    uint64_t result = sub_20CB6A3C4((uint64_t)v4, &qword_2676F0BE8);
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      uint64_t v7 = *v4;
      unint64_t v6 = v4[1];
      dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)();
      return sub_20CB64DC8(v7, v6);
    }
    uint64_t result = sub_20CB65A98((uint64_t)v4, (void (*)(void))type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
  }
  __break(1u);
  return result;
}

uint64_t sub_20CB67604(uint64_t a1)
{
  uint64_t v2 = sub_20CB650D0(&qword_2676F0BE8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Ckcode_Proto2Any(0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20CB6A418(a1, (uint64_t)v4, &qword_2676F0BE8);
  uint64_t v8 = type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(0);
  if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)v4, 1, v8) == 1)
  {
    uint64_t result = sub_20CB6A3C4((uint64_t)v4, &qword_2676F0BE8);
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_20CB68464();
      sub_20CB6841C(&qword_2676F0C20, (void (*)(uint64_t))type metadata accessor for Ckcode_Proto2Any);
      dispatch thunk of Visitor.visitSingularMessageField<A>(value:fieldNumber:)();
      return sub_20CB65A98((uint64_t)v7, (void (*)(void))type metadata accessor for Ckcode_Proto2Any);
    }
    uint64_t result = sub_20CB65A98((uint64_t)v4, (void (*)(void))type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
  }
  __break(1u);
  return result;
}

uint64_t static Ckcode_Proto2ProtectedEnvelope.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v43 = type metadata accessor for UnknownStorage();
  sub_20CB6A87C();
  uint64_t v48 = v4;
  MEMORY[0x270FA5388](v5);
  sub_20CB6A8BC();
  v47 = (char *)(v6 - v7);
  MEMORY[0x270FA5388](v8);
  v45 = (char *)&v43 - v9;
  uint64_t v10 = type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(0);
  sub_20CB6A86C();
  MEMORY[0x270FA5388](v11);
  sub_20CB6A8FC();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = sub_20CB650D0(&qword_2676F0C08);
  uint64_t v16 = v15 - 8;
  MEMORY[0x270FA5388](v15);
  sub_20CB6A8FC();
  uint64_t v19 = v18 - v17;
  uint64_t v20 = sub_20CB650D0(&qword_2676F0BE8);
  uint64_t v21 = sub_20CB6A8A4(v20);
  MEMORY[0x270FA5388](v21);
  sub_20CB6A8BC();
  uint64_t v24 = v22 - v23;
  uint64_t v26 = MEMORY[0x270FA5388](v25);
  uint64_t v28 = (char *)&v43 - v27;
  MEMORY[0x270FA5388](v26);
  uint64_t v30 = (char *)&v43 - v29;
  uint64_t v44 = a1;
  sub_20CB6A418(a1, (uint64_t)&v43 - v29, &qword_2676F0BE8);
  uint64_t v46 = a2;
  sub_20CB6A418(a2, (uint64_t)v28, &qword_2676F0BE8);
  uint64_t v31 = v19 + *(int *)(v16 + 56);
  sub_20CB6A418((uint64_t)v30, v19, &qword_2676F0BE8);
  sub_20CB6A418((uint64_t)v28, v31, &qword_2676F0BE8);
  sub_20CB6AA88(v19, 1, v10);
  if (!v32)
  {
    sub_20CB6A418(v19, v24, &qword_2676F0BE8);
    sub_20CB6AA88(v31, 1, v10);
    if (!v32)
    {
      sub_20CB68464();
      char v33 = static Ckcode_Proto2ProtectedEnvelope.OneOf_Contents.== infix(_:_:)();
      sub_20CB65A98(v14, (void (*)(void))type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
      sub_20CB6A3C4((uint64_t)v28, &qword_2676F0BE8);
      sub_20CB6A3C4((uint64_t)v30, &qword_2676F0BE8);
      sub_20CB65A98(v24, (void (*)(void))type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
      sub_20CB6A3C4(v19, &qword_2676F0BE8);
      if (v33) {
        goto LABEL_11;
      }
LABEL_12:
      char v39 = 0;
      return v39 & 1;
    }
    sub_20CB6A3C4((uint64_t)v28, &qword_2676F0BE8);
    sub_20CB6A3C4((uint64_t)v30, &qword_2676F0BE8);
    sub_20CB65A98(v24, (void (*)(void))type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
LABEL_9:
    sub_20CB6A3C4(v19, &qword_2676F0C08);
    goto LABEL_12;
  }
  sub_20CB6A3C4((uint64_t)v28, &qword_2676F0BE8);
  sub_20CB6A3C4((uint64_t)v30, &qword_2676F0BE8);
  sub_20CB6AA88(v31, 1, v10);
  if (!v32) {
    goto LABEL_9;
  }
  sub_20CB6A3C4(v19, &qword_2676F0BE8);
LABEL_11:
  uint64_t v34 = type metadata accessor for Ckcode_Proto2ProtectedEnvelope(0);
  uint64_t v35 = v48;
  uint64_t v36 = *(void (**)(char *, uint64_t, uint64_t))(v48 + 16);
  uint64_t v37 = v43;
  v36(v45, v44 + *(int *)(v34 + 20), v43);
  v38 = v47;
  v36(v47, v46 + *(int *)(v34 + 20), v37);
  sub_20CB6841C(&qword_2676F0BF8, MEMORY[0x263F50560]);
  char v39 = dispatch thunk of static Equatable.== infix(_:_:)();
  v40 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
  v40((uint64_t)v38, v37);
  uint64_t v41 = sub_20CB6AA40();
  ((void (*)(uint64_t))v40)(v41);
  return v39 & 1;
}

Swift::Int Ckcode_Proto2ProtectedEnvelope.hashValue.getter()
{
  return sub_20CB67C84((void (*)(void))type metadata accessor for Ckcode_Proto2ProtectedEnvelope, &qword_2676F0C10, (void (*)(uint64_t))type metadata accessor for Ckcode_Proto2ProtectedEnvelope);
}

Swift::Int sub_20CB67C84(void (*a1)(void), unint64_t *a2, void (*a3)(uint64_t))
{
  return Hasher._finalize()();
}

uint64_t (*sub_20CB67D1C())()
{
  return nullsub_1;
}

uint64_t sub_20CB67D40(uint64_t a1, uint64_t a2)
{
  return Ckcode_Proto2ProtectedEnvelope.decodeMessage<A>(decoder:)(a1, a2);
}

uint64_t sub_20CB67D58()
{
  return Ckcode_Proto2ProtectedEnvelope.traverse<A>(visitor:)();
}

uint64_t sub_20CB67D70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_20CB6841C(&qword_2676F0C88, (void (*)(uint64_t))type metadata accessor for Ckcode_Proto2ProtectedEnvelope);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_20CB67DF0(uint64_t a1)
{
  uint64_t v2 = sub_20CB6841C(&qword_2676F0C38, (void (*)(uint64_t))type metadata accessor for Ckcode_Proto2ProtectedEnvelope);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_20CB67E60()
{
  sub_20CB6841C(&qword_2676F0C38, (void (*)(uint64_t))type metadata accessor for Ckcode_Proto2ProtectedEnvelope);
  return Message.hash(into:)();
}

Swift::Int sub_20CB67EDC()
{
  return Hasher._finalize()();
}

uint64_t sub_20CB67F34(uint64_t a1)
{
  uint64_t v2 = sub_20CB6841C(&qword_2676F0CC8, type metadata accessor for CKError);
  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t sub_20CB67FA0(uint64_t a1)
{
  uint64_t v2 = sub_20CB6841C(&qword_2676F0CC8, type metadata accessor for CKError);
  return MEMORY[0x270EF2668](a1, v2);
}

uint64_t sub_20CB68010(uint64_t a1)
{
  uint64_t v2 = sub_20CB6841C((unint64_t *)&unk_2676F11B0, type metadata accessor for CKError);
  return MEMORY[0x270EEF788](a1, v2);
}

id sub_20CB6807C()
{
  return *v0;
}

uint64_t sub_20CB68084@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_20CB68090()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_20CB680A0(uint64_t a1)
{
  uint64_t v2 = sub_20CB6841C((unint64_t *)&unk_2676F11B0, type metadata accessor for CKError);
  return MEMORY[0x270EEF7E8](a1, v2);
}

uint64_t sub_20CB6810C(uint64_t a1)
{
  uint64_t v2 = sub_20CB6841C((unint64_t *)&unk_2676F11B0, type metadata accessor for CKError);
  return MEMORY[0x270EEF7A0](a1, v2);
}

uint64_t sub_20CB68178(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_20CB6841C((unint64_t *)&unk_2676F11B0, type metadata accessor for CKError);
  id v5 = a1;
  return MEMORY[0x270EEF790](v5, a2, v4);
}

uint64_t sub_20CB68208()
{
  return sub_20CB6A820(*v0);
}

uint64_t sub_20CB68210(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_20CB6841C((unint64_t *)&unk_2676F11B0, type metadata accessor for CKError);
  return MEMORY[0x270EEF7D0](a1, a2, v4);
}

Swift::Int sub_20CB6828C()
{
  return Hasher._finalize()();
}

void sub_20CB682EC(uint64_t a1@<X8>)
{
  sub_20CB68320();
  *(void *)a1 = v2;
  *(unsigned char *)(a1 + 8) = v3 & 1;
}

uint64_t sub_20CB68328@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_20CB68354(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_20CB6841C((unint64_t *)&unk_2676F11B0, type metadata accessor for CKError);
  return MEMORY[0x270EEF7B8](a1, a2, a3, v6);
}

BOOL sub_20CB683D8(uint64_t *a1, uint64_t *a2)
{
  return sub_20CB6A814(*a1, *a2);
}

uint64_t sub_20CB683E4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_20CB6841C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_20CB68464()
{
  uint64_t v2 = sub_20CB6AA00();
  v3(v2);
  sub_20CB6A86C();
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v0, v1);
  return v0;
}

uint64_t sub_20CB684B8()
{
  return sub_20CB6841C(&qword_2676F0C18, (void (*)(uint64_t))type metadata accessor for Ckcode_Proto2Any);
}

uint64_t sub_20CB68500()
{
  return sub_20CB6841C(&qword_2676F0C20, (void (*)(uint64_t))type metadata accessor for Ckcode_Proto2Any);
}

uint64_t sub_20CB68548()
{
  return sub_20CB6841C(&qword_2676F0C00, (void (*)(uint64_t))type metadata accessor for Ckcode_Proto2Any);
}

uint64_t sub_20CB68590()
{
  return sub_20CB6841C(&qword_2676F0C28, (void (*)(uint64_t))type metadata accessor for Ckcode_Proto2Any);
}

uint64_t sub_20CB685D8()
{
  return sub_20CB6841C(&qword_2676F0C30, (void (*)(uint64_t))type metadata accessor for Ckcode_Proto2ProtectedEnvelope);
}

uint64_t sub_20CB68620()
{
  return sub_20CB6841C(&qword_2676F0C38, (void (*)(uint64_t))type metadata accessor for Ckcode_Proto2ProtectedEnvelope);
}

uint64_t sub_20CB68668()
{
  return sub_20CB6841C(&qword_2676F0C10, (void (*)(uint64_t))type metadata accessor for Ckcode_Proto2ProtectedEnvelope);
}

uint64_t sub_20CB686B0()
{
  return sub_20CB6841C(&qword_2676F0C40, (void (*)(uint64_t))type metadata accessor for Ckcode_Proto2ProtectedEnvelope);
}

uint64_t *initializeBufferWithCopyOfBuffer for Ckcode_Proto2Any(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for UnknownStorage();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (uint64_t *)((char *)a1 + v8);
    uint64_t v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = (char *)a1 + v9;
    uint64_t v14 = (_OWORD *)((char *)a2 + v9);
    unint64_t v15 = *(uint64_t *)((char *)a2 + v9 + 8);
    swift_bridgeObjectRetain();
    if (v15 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v13 = *v14;
    }
    else
    {
      uint64_t v17 = *(void *)v14;
      sub_20CB64CA4(v17, v15);
      *(void *)uint64_t v13 = v17;
      *((void *)v13 + 1) = v15;
    }
  }
  return a1;
}

uint64_t destroy for Ckcode_Proto2Any(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v6 = (uint64_t *)(a1 + *(int *)(a2 + 24));
  unint64_t v7 = v6[1];
  if (v7 >> 60 != 15)
  {
    uint64_t v8 = *v6;
    return sub_20CB64DC8(v8, v7);
  }
  return result;
}

uint64_t initializeWithCopy for Ckcode_Proto2Any(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = a1 + v8;
  uint64_t v13 = a2 + v8;
  unint64_t v14 = *(void *)(v13 + 8);
  swift_bridgeObjectRetain();
  if (v14 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  }
  else
  {
    uint64_t v15 = *(void *)v13;
    sub_20CB64CA4(v15, v14);
    *(void *)uint64_t v12 = v15;
    *(void *)(v12 + 8) = v14;
  }
  return a1;
}

uint64_t assignWithCopy for Ckcode_Proto2Any(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (uint64_t *)(a1 + v10);
  uint64_t v12 = (uint64_t *)(a2 + v10);
  unint64_t v13 = *(void *)(a2 + v10 + 8);
  if (*(void *)(a1 + v10 + 8) >> 60 != 15)
  {
    if (v13 >> 60 != 15)
    {
      uint64_t v15 = *v12;
      sub_20CB64CA4(v15, v13);
      uint64_t v16 = *v11;
      unint64_t v17 = v11[1];
      *uint64_t v11 = v15;
      v11[1] = v13;
      sub_20CB64DC8(v16, v17);
      return a1;
    }
    sub_20CB68A88((uint64_t)v11);
    goto LABEL_6;
  }
  if (v13 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
    return a1;
  }
  uint64_t v14 = *v12;
  sub_20CB64CA4(v14, v13);
  *uint64_t v11 = v14;
  v11[1] = v13;
  return a1;
}

uint64_t sub_20CB68A88(uint64_t a1)
{
  return a1;
}

uint64_t initializeWithTake for Ckcode_Proto2Any(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  return a1;
}

uint64_t assignWithTake for Ckcode_Proto2Any(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(int *)(a3 + 24);
  unint64_t v13 = (uint64_t *)(a1 + v12);
  uint64_t v14 = (uint64_t *)(a2 + v12);
  unint64_t v15 = *(void *)(a1 + v12 + 8);
  if (v15 >> 60 != 15)
  {
    unint64_t v16 = v14[1];
    if (v16 >> 60 != 15)
    {
      uint64_t v17 = *v13;
      *unint64_t v13 = *v14;
      v13[1] = v16;
      sub_20CB64DC8(v17, v15);
      return a1;
    }
    sub_20CB68A88((uint64_t)v13);
  }
  *(_OWORD *)unint64_t v13 = *(_OWORD *)v14;
  return a1;
}

uint64_t getEnumTagSinglePayload for Ckcode_Proto2Any(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20CB68C50);
}

uint64_t sub_20CB68C50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for UnknownStorage();
  sub_20CB6A854();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    int v10 = v9 - 1;
    if (v10 < 0) {
      int v10 = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for Ckcode_Proto2Any(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20CB68D00);
}

void sub_20CB68D00()
{
  sub_20CB6A9EC();
  type metadata accessor for UnknownStorage();
  sub_20CB6A854();
  if (*(_DWORD *)(v5 + 84) == v3)
  {
    _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v1, v0, v0, v4);
  }
  else
  {
    *(void *)(v1 + *(int *)(v2 + 20) + 8) = v0;
  }
}

uint64_t sub_20CB68D80()
{
  uint64_t result = type metadata accessor for UnknownStorage();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for Ckcode_Proto2ProtectedEnvelope(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(0);
    if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a2, 1, v7))
    {
      uint64_t v8 = sub_20CB650D0(&qword_2676F0BE8);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    }
    else
    {
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v10 = type metadata accessor for UnknownStorage();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
        uint64_t v11 = type metadata accessor for Ckcode_Proto2Any(0);
        uint64_t v12 = *(int *)(v11 + 20);
        unint64_t v13 = (uint64_t *)((char *)a1 + v12);
        uint64_t v14 = (uint64_t *)((char *)a2 + v12);
        uint64_t v16 = *v14;
        uint64_t v15 = v14[1];
        *unint64_t v13 = v16;
        v13[1] = v15;
        uint64_t v17 = *(int *)(v11 + 24);
        uint64_t v18 = (char *)a1 + v17;
        uint64_t v19 = (_OWORD *)((char *)a2 + v17);
        unint64_t v20 = *(uint64_t *)((char *)a2 + v17 + 8);
        swift_bridgeObjectRetain();
        if (v20 >> 60 == 15)
        {
          *(_OWORD *)uint64_t v18 = *v19;
        }
        else
        {
          uint64_t v23 = *(void *)v19;
          sub_20CB64CA4(v23, v20);
          *(void *)uint64_t v18 = v23;
          *((void *)v18 + 1) = v20;
        }
      }
      else
      {
        uint64_t v21 = *a2;
        unint64_t v22 = a2[1];
        sub_20CB64CA4(*a2, v22);
        *a1 = v21;
        a1[1] = v22;
      }
      swift_storeEnumTagMultiPayload();
      _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)a1, 0, 1, v7);
    }
    uint64_t v24 = *(int *)(a3 + 20);
    uint64_t v25 = (char *)a1 + v24;
    uint64_t v26 = (char *)a2 + v24;
    uint64_t v27 = type metadata accessor for UnknownStorage();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 16))(v25, v26, v27);
  }
  return a1;
}

uint64_t destroy for Ckcode_Proto2ProtectedEnvelope(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(0);
  if (!_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a1, 1, v4))
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v5 = type metadata accessor for UnknownStorage();
      (*(void (**)(uint64_t *, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
      uint64_t v6 = type metadata accessor for Ckcode_Proto2Any(0);
      swift_bridgeObjectRelease();
      uint64_t v7 = (uint64_t *)((char *)a1 + *(int *)(v6 + 24));
      unint64_t v8 = v7[1];
      if (v8 >> 60 == 15) {
        goto LABEL_7;
      }
      uint64_t v9 = *v7;
    }
    else
    {
      uint64_t v9 = *a1;
      unint64_t v8 = a1[1];
    }
    sub_20CB64DC8(v9, v8);
  }
LABEL_7:
  uint64_t v10 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v11 = type metadata accessor for UnknownStorage();
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8);
  return v12(v10, v11);
}

void *initializeWithCopy for Ckcode_Proto2ProtectedEnvelope(void *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(0);
  if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a2, 1, v6))
  {
    uint64_t v7 = sub_20CB650D0(&qword_2676F0BE8);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v8 = type metadata accessor for UnknownStorage();
      (*(void (**)(void *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
      uint64_t v9 = type metadata accessor for Ckcode_Proto2Any(0);
      uint64_t v10 = *(int *)(v9 + 20);
      uint64_t v11 = (void *)((char *)a1 + v10);
      uint64_t v12 = (uint64_t *)((char *)a2 + v10);
      uint64_t v14 = *v12;
      uint64_t v13 = v12[1];
      *uint64_t v11 = v14;
      v11[1] = v13;
      uint64_t v15 = *(int *)(v9 + 24);
      uint64_t v16 = (char *)a1 + v15;
      uint64_t v17 = (_OWORD *)((char *)a2 + v15);
      unint64_t v18 = *(uint64_t *)((char *)a2 + v15 + 8);
      swift_bridgeObjectRetain();
      if (v18 >> 60 == 15)
      {
        *(_OWORD *)uint64_t v16 = *v17;
      }
      else
      {
        uint64_t v21 = *(void *)v17;
        sub_20CB64CA4(v21, v18);
        *(void *)uint64_t v16 = v21;
        *((void *)v16 + 1) = v18;
      }
    }
    else
    {
      uint64_t v19 = *a2;
      unint64_t v20 = a2[1];
      sub_20CB64CA4(*a2, v20);
      *a1 = v19;
      a1[1] = v20;
    }
    swift_storeEnumTagMultiPayload();
    _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)a1, 0, 1, v6);
  }
  uint64_t v22 = *(int *)(a3 + 20);
  uint64_t v23 = (char *)a1 + v22;
  uint64_t v24 = (char *)a2 + v22;
  uint64_t v25 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16))(v23, v24, v25);
  return a1;
}

uint64_t *assignWithCopy for Ckcode_Proto2ProtectedEnvelope(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(0);
  int v7 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a1, 1, v6);
  int v8 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a2, 1, v6);
  if (v7)
  {
    if (!v8)
    {
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v9 = type metadata accessor for UnknownStorage();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
        uint64_t v10 = type metadata accessor for Ckcode_Proto2Any(0);
        uint64_t v11 = *(int *)(v10 + 20);
        uint64_t v12 = (uint64_t *)((char *)a1 + v11);
        uint64_t v13 = (uint64_t *)((char *)a2 + v11);
        *uint64_t v12 = *v13;
        v12[1] = v13[1];
        uint64_t v14 = *(int *)(v10 + 24);
        uint64_t v15 = (char *)a1 + v14;
        uint64_t v16 = (_OWORD *)((char *)a2 + v14);
        unint64_t v17 = *(uint64_t *)((char *)a2 + v14 + 8);
        swift_bridgeObjectRetain();
        if (v17 >> 60 == 15)
        {
          *(_OWORD *)uint64_t v15 = *v16;
        }
        else
        {
          uint64_t v30 = *(void *)v16;
          sub_20CB64CA4(v30, v17);
          *(void *)uint64_t v15 = v30;
          *((void *)v15 + 1) = v17;
        }
      }
      else
      {
        uint64_t v28 = *a2;
        unint64_t v29 = a2[1];
        sub_20CB64CA4(*a2, v29);
        *a1 = v28;
        a1[1] = v29;
      }
      swift_storeEnumTagMultiPayload();
      _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)a1, 0, 1, v6);
      goto LABEL_19;
    }
LABEL_8:
    uint64_t v18 = sub_20CB650D0(&qword_2676F0BE8);
    memcpy(a1, a2, *(void *)(*(void *)(v18 - 8) + 64));
    goto LABEL_19;
  }
  if (v8)
  {
    sub_20CB65A98((uint64_t)a1, (void (*)(void))type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
    goto LABEL_8;
  }
  if (a1 != a2)
  {
    sub_20CB65A98((uint64_t)a1, (void (*)(void))type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v19 = type metadata accessor for UnknownStorage();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v19 - 8) + 16))(a1, a2, v19);
      uint64_t v20 = type metadata accessor for Ckcode_Proto2Any(0);
      uint64_t v21 = *(int *)(v20 + 20);
      uint64_t v22 = (uint64_t *)((char *)a1 + v21);
      uint64_t v23 = (uint64_t *)((char *)a2 + v21);
      *uint64_t v22 = *v23;
      v22[1] = v23[1];
      uint64_t v24 = *(int *)(v20 + 24);
      uint64_t v25 = (char *)a1 + v24;
      uint64_t v26 = (_OWORD *)((char *)a2 + v24);
      unint64_t v27 = *(uint64_t *)((char *)a2 + v24 + 8);
      swift_bridgeObjectRetain();
      if (v27 >> 60 == 15)
      {
        *(_OWORD *)uint64_t v25 = *v26;
      }
      else
      {
        uint64_t v33 = *(void *)v26;
        sub_20CB64CA4(v33, v27);
        *(void *)uint64_t v25 = v33;
        *((void *)v25 + 1) = v27;
      }
    }
    else
    {
      uint64_t v31 = *a2;
      unint64_t v32 = a2[1];
      sub_20CB64CA4(*a2, v32);
      *a1 = v31;
      a1[1] = v32;
    }
    swift_storeEnumTagMultiPayload();
  }
LABEL_19:
  uint64_t v34 = *(int *)(a3 + 20);
  uint64_t v35 = (char *)a1 + v34;
  uint64_t v36 = (char *)a2 + v34;
  uint64_t v37 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 24))(v35, v36, v37);
  return a1;
}

char *initializeWithTake for Ckcode_Proto2ProtectedEnvelope(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(0);
  if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a2, 1, v6))
  {
    uint64_t v7 = sub_20CB650D0(&qword_2676F0BE8);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v8 = type metadata accessor for UnknownStorage();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
      uint64_t v9 = type metadata accessor for Ckcode_Proto2Any(0);
      *(_OWORD *)&a1[*(int *)(v9 + 20)] = *(_OWORD *)&a2[*(int *)(v9 + 20)];
      *(_OWORD *)&a1[*(int *)(v9 + 24)] = *(_OWORD *)&a2[*(int *)(v9 + 24)];
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)a1, 0, 1, v6);
  }
  uint64_t v10 = *(int *)(a3 + 20);
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  uint64_t v13 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  return a1;
}

char *assignWithTake for Ckcode_Proto2ProtectedEnvelope(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(0);
  int v7 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a1, 1, v6);
  int v8 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a2, 1, v6);
  if (!v7)
  {
    if (!v8)
    {
      if (a1 == a2) {
        goto LABEL_14;
      }
      sub_20CB65A98((uint64_t)a1, (void (*)(void))type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v12 = type metadata accessor for UnknownStorage();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(a1, a2, v12);
        uint64_t v13 = type metadata accessor for Ckcode_Proto2Any(0);
        *(_OWORD *)&a1[*(int *)(v13 + 20)] = *(_OWORD *)&a2[*(int *)(v13 + 20)];
        *(_OWORD *)&a1[*(int *)(v13 + 24)] = *(_OWORD *)&a2[*(int *)(v13 + 24)];
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      size_t v11 = *(void *)(*(void *)(v6 - 8) + 64);
      goto LABEL_8;
    }
    sub_20CB65A98((uint64_t)a1, (void (*)(void))type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
LABEL_7:
    size_t v11 = *(void *)(*(void *)(sub_20CB650D0(&qword_2676F0BE8) - 8) + 64);
LABEL_8:
    memcpy(a1, a2, v11);
    goto LABEL_14;
  }
  if (v8) {
    goto LABEL_7;
  }
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = type metadata accessor for UnknownStorage();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
    uint64_t v10 = type metadata accessor for Ckcode_Proto2Any(0);
    *(_OWORD *)&a1[*(int *)(v10 + 20)] = *(_OWORD *)&a2[*(int *)(v10 + 20)];
    *(_OWORD *)&a1[*(int *)(v10 + 24)] = *(_OWORD *)&a2[*(int *)(v10 + 24)];
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)a1, 0, 1, v6);
LABEL_14:
  uint64_t v14 = *(int *)(a3 + 20);
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  uint64_t v17 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 40))(v15, v16, v17);
  return a1;
}

uint64_t getEnumTagSinglePayload for Ckcode_Proto2ProtectedEnvelope(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20CB69A74);
}

uint64_t sub_20CB69A74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20CB650D0(&qword_2676F0BE8);
  sub_20CB6A854();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    uint64_t v8 = type metadata accessor for UnknownStorage();
    uint64_t v9 = a1 + *(int *)(a3 + 20);
  }
  return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(v9, a2, v8);
}

uint64_t storeEnumTagSinglePayload for Ckcode_Proto2ProtectedEnvelope(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20CB69B08);
}

uint64_t sub_20CB69B08()
{
  sub_20CB6A9EC();
  sub_20CB650D0(&qword_2676F0BE8);
  sub_20CB6A854();
  if (*(_DWORD *)(v5 + 84) == v3)
  {
    uint64_t v6 = v4;
    uint64_t v7 = v1;
  }
  else
  {
    uint64_t v6 = type metadata accessor for UnknownStorage();
    uint64_t v7 = v1 + *(int *)(v2 + 20);
  }
  return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v7, v0, v0, v6);
}

void sub_20CB69B84()
{
  sub_20CB69C4C();
  if (v0 <= 0x3F)
  {
    type metadata accessor for UnknownStorage();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_20CB69C4C()
{
  if (!qword_2676F0C68)
  {
    type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(255);
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2676F0C68);
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = type metadata accessor for UnknownStorage();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      uint64_t v7 = type metadata accessor for Ckcode_Proto2Any(0);
      uint64_t v8 = *(int *)(v7 + 20);
      uint64_t v9 = (uint64_t *)((char *)a1 + v8);
      uint64_t v10 = (uint64_t *)((char *)a2 + v8);
      uint64_t v12 = *v10;
      uint64_t v11 = v10[1];
      *uint64_t v9 = v12;
      v9[1] = v11;
      uint64_t v13 = *(int *)(v7 + 24);
      uint64_t v14 = (char *)a1 + v13;
      uint64_t v15 = (_OWORD *)((char *)a2 + v13);
      unint64_t v16 = *(uint64_t *)((char *)a2 + v13 + 8);
      swift_bridgeObjectRetain();
      if (v16 >> 60 == 15)
      {
        *(_OWORD *)uint64_t v14 = *v15;
      }
      else
      {
        uint64_t v20 = *(void *)v15;
        sub_20CB64CA4(v20, v16);
        *(void *)uint64_t v14 = v20;
        *((void *)v14 + 1) = v16;
      }
    }
    else
    {
      uint64_t v19 = *a2;
      unint64_t v18 = a2[1];
      sub_20CB64CA4(v19, v18);
      *a1 = v19;
      a1[1] = v18;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(uint64_t *a1)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = type metadata accessor for UnknownStorage();
    (*(void (**)(uint64_t *, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
    uint64_t v3 = type metadata accessor for Ckcode_Proto2Any(0);
    uint64_t result = swift_bridgeObjectRelease();
    a1 = (uint64_t *)((char *)a1 + *(int *)(v3 + 24));
    unint64_t v5 = a1[1];
    if (v5 >> 60 == 15) {
      return result;
    }
  }
  else
  {
    unint64_t v5 = a1[1];
  }
  uint64_t v6 = *a1;
  return sub_20CB64DC8(v6, v5);
}

uint64_t *initializeWithCopy for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(uint64_t *a1, uint64_t *a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = type metadata accessor for UnknownStorage();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
    uint64_t v5 = type metadata accessor for Ckcode_Proto2Any(0);
    uint64_t v6 = *(int *)(v5 + 20);
    uint64_t v7 = (uint64_t *)((char *)a1 + v6);
    uint64_t v8 = (uint64_t *)((char *)a2 + v6);
    uint64_t v10 = *v8;
    uint64_t v9 = v8[1];
    *uint64_t v7 = v10;
    v7[1] = v9;
    uint64_t v11 = *(int *)(v5 + 24);
    uint64_t v12 = (char *)a1 + v11;
    uint64_t v13 = (_OWORD *)((char *)a2 + v11);
    unint64_t v14 = *(uint64_t *)((char *)a2 + v11 + 8);
    swift_bridgeObjectRetain();
    if (v14 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v12 = *v13;
    }
    else
    {
      uint64_t v17 = *(void *)v13;
      sub_20CB64CA4(v17, v14);
      *(void *)uint64_t v12 = v17;
      *((void *)v12 + 1) = v14;
    }
  }
  else
  {
    uint64_t v16 = *a2;
    unint64_t v15 = a2[1];
    sub_20CB64CA4(v16, v15);
    *a1 = v16;
    a1[1] = v15;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t *assignWithCopy for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(uint64_t *a1, uint64_t *a2)
{
  if (a1 != a2)
  {
    sub_20CB65A98((uint64_t)a1, (void (*)(void))type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v4 = type metadata accessor for UnknownStorage();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
      uint64_t v5 = type metadata accessor for Ckcode_Proto2Any(0);
      uint64_t v6 = *(int *)(v5 + 20);
      uint64_t v7 = (uint64_t *)((char *)a1 + v6);
      uint64_t v8 = (uint64_t *)((char *)a2 + v6);
      *uint64_t v7 = *v8;
      v7[1] = v8[1];
      uint64_t v9 = *(int *)(v5 + 24);
      uint64_t v10 = (char *)a1 + v9;
      uint64_t v11 = (_OWORD *)((char *)a2 + v9);
      unint64_t v12 = *(uint64_t *)((char *)a2 + v9 + 8);
      swift_bridgeObjectRetain();
      if (v12 >> 60 == 15)
      {
        *(_OWORD *)uint64_t v10 = *v11;
      }
      else
      {
        uint64_t v15 = *(void *)v11;
        sub_20CB64CA4(v15, v12);
        *(void *)uint64_t v10 = v15;
        *((void *)v10 + 1) = v12;
      }
    }
    else
    {
      uint64_t v14 = *a2;
      unint64_t v13 = a2[1];
      sub_20CB64CA4(v14, v13);
      *a1 = v14;
      a1[1] = v13;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *initializeWithTake for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(char *a1, char *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for UnknownStorage();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    uint64_t v7 = type metadata accessor for Ckcode_Proto2Any(0);
    *(_OWORD *)&a1[*(int *)(v7 + 20)] = *(_OWORD *)&a2[*(int *)(v7 + 20)];
    *(_OWORD *)&a1[*(int *)(v7 + 24)] = *(_OWORD *)&a2[*(int *)(v7 + 24)];
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

char *assignWithTake for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_20CB65A98((uint64_t)a1, (void (*)(void))type metadata accessor for Ckcode_Proto2ProtectedEnvelope.OneOf_Contents);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = type metadata accessor for UnknownStorage();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      uint64_t v7 = type metadata accessor for Ckcode_Proto2Any(0);
      *(_OWORD *)&a1[*(int *)(v7 + 20)] = *(_OWORD *)&a2[*(int *)(v7 + 20)];
      *(_OWORD *)&a1[*(int *)(v7 + 24)] = *(_OWORD *)&a2[*(int *)(v7 + 24)];
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_20CB6A30C()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_20CB6A31C()
{
  uint64_t result = type metadata accessor for Ckcode_Proto2Any(319);
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

void type metadata accessor for Scope(uint64_t a1)
{
}

uint64_t sub_20CB6A3C4(uint64_t a1, uint64_t *a2)
{
  sub_20CB650D0(a2);
  sub_20CB6A86C();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_20CB6A418(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_20CB650D0(a3);
  sub_20CB6A86C();
  uint64_t v4 = sub_20CB6AA4C();
  v5(v4);
  return a2;
}

uint64_t *sub_20CB6A468(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void type metadata accessor for CKError(uint64_t a1)
{
}

uint64_t sub_20CB6A4E0()
{
  return sub_20CB6841C(&qword_2676F0CB8, type metadata accessor for CKError);
}

uint64_t sub_20CB6A528()
{
  return sub_20CB6841C(&qword_2676F0CC0, type metadata accessor for CKError);
}

uint64_t sub_20CB6A570()
{
  return sub_20CB6841C(&qword_2676F0CC8, type metadata accessor for CKError);
}

uint64_t sub_20CB6A5B8()
{
  return sub_20CB6841C(&qword_2676F0CD0, type metadata accessor for CKError);
}

uint64_t sub_20CB6A600()
{
  return sub_20CB6841C(&qword_2676F0CD8, type metadata accessor for CKError);
}

uint64_t sub_20CB6A648()
{
  return sub_20CB6841C(&qword_2676F0CE0, type metadata accessor for Code);
}

void type metadata accessor for Code(uint64_t a1)
{
}

void sub_20CB6A6A4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_20CB6A6EC()
{
  return sub_20CB6841C(&qword_2676F0CE8, type metadata accessor for Code);
}

unint64_t sub_20CB6A738()
{
  unint64_t result = qword_2676F0CF0;
  if (!qword_2676F0CF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2676F0CF0);
  }
  return result;
}

uint64_t sub_20CB6A784()
{
  return sub_20CB6841C(&qword_2676F0CF8, type metadata accessor for Code);
}

uint64_t sub_20CB6A7CC()
{
  return sub_20CB6841C((unint64_t *)&unk_2676F11B0, type metadata accessor for CKError);
}

BOOL sub_20CB6A814(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_20CB6A820(void *a1)
{
  id v1 = a1;
  uint64_t v2 = NSObject.hashValue.getter();

  return v2;
}

uint64_t sub_20CB6A898()
{
  return v0;
}

uint64_t sub_20CB6A8A4(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_20CB6A8B0()
{
  return v0;
}

uint64_t sub_20CB6A8CC()
{
  return v0;
}

uint64_t sub_20CB6A8E0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_20CB6A93C()
{
  sub_20CB64C90(v0, v1);
  sub_20CB64C90(v2, v3);
  return v0;
}

uint64_t sub_20CB6A96C()
{
  return v0;
}

uint64_t sub_20CB6A984()
{
  return v0;
}

uint64_t sub_20CB6A998()
{
  return v0;
}

uint64_t sub_20CB6A9AC()
{
  *uint64_t v0 = v2;
  v0[1] = v1;
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_20CB6A9CC()
{
  return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v1, 0, 1, v0);
}

uint64_t sub_20CB6AA00()
{
  return 0;
}

uint64_t sub_20CB6AA14()
{
  return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v1, 0, 1, v0);
}

uint64_t sub_20CB6AA34()
{
  return v0;
}

uint64_t sub_20CB6AA40()
{
  return v0;
}

uint64_t sub_20CB6AA4C()
{
  return v0;
}

uint64_t sub_20CB6AA60@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(v1 + a1);
}

uint64_t sub_20CB6AA74(uint64_t result)
{
  uint64_t v2 = (void *)(v1 + *(int *)(result + 20));
  *uint64_t v2 = 0;
  v2[1] = 0;
  return result;
}

uint64_t sub_20CB6AA88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(a1, a2, a3);
}

uint64_t sub_20CB6AAA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return Invocable.invoke<A>(function:request:completion:)(a1, a2, a3, a4, a5, a8, a6, a9, a7);
}

uint64_t Invocable.invoke<A>(function:request:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a4;
  *(void *)(v15 + 24) = a5;
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t (*)(uint64_t, uint64_t), uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(a8 + 8);
  uint64_t v17 = type metadata accessor for Google_Protobuf_Empty();
  unint64_t v18 = sub_20CB6AC20();
  swift_retain();
  v16(a1, a2, a3, sub_20CB6ABF4, v15, a7, v17, a9, v18, a6, a8);
  return swift_release();
}

uint64_t sub_20CB6ABBC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_20CB6ABF4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(v2 + 16))(a2);
}

unint64_t sub_20CB6AC20()
{
  unint64_t result = qword_2676F0D08;
  if (!qword_2676F0D08)
  {
    type metadata accessor for Google_Protobuf_Empty();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2676F0D08);
  }
  return result;
}

uint64_t dispatch thunk of Invocable.invoke<A, B>(function:request:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return (*(uint64_t (**)(void))(a11 + 8))();
}

uint64_t dispatch thunk of Invocable.invoke<A>(function:request:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return (*(uint64_t (**)(void))(a9 + 16))();
}

void (*CKDeclineSharesOperation.perShareResultBlock.getter())(uint64_t a1, void *a2, char a3)
{
  unint64_t result = (void (*)(uint64_t, void *, char))objc_msgSend(v0, sel_perShareCompletionBlock);
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v2;
    uint64_t v4 = sub_20CB6BAA0();
    *(void *)(v4 + 16) = sub_20CB6B064;
    *(void *)(v4 + 24) = v3;
    return sub_20CB6B0F4;
  }
  return result;
}

uint64_t sub_20CB6AD48@<X0>(void *a1@<X8>)
{
  uint64_t result = (uint64_t)CKDeclineSharesOperation.perShareResultBlock.getter();
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = v3;
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v4;
    *(void *)(result + 24) = v5;
    uint64_t v6 = sub_20CB6BA2C;
  }
  else
  {
    uint64_t v6 = 0;
  }
  *a1 = v6;
  a1[1] = result;
  return result;
}

id sub_20CB6ADB8(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  if (*a1)
  {
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v1;
    *(void *)(v3 + 24) = v2;
    uint64_t v4 = sub_20CB6BA20;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v3 = 0;
  }
  sub_20CB6B318(v1);
  return CKDeclineSharesOperation.perShareResultBlock.setter((uint64_t)v4, v3);
}

uint64_t sub_20CB6AE48(uint64_t a1, uint64_t a2, char a3, uint64_t (*a4)(uint64_t *, uint64_t *))
{
  uint64_t v7 = a1;
  uint64_t v5 = a2;
  char v6 = a3 & 1;
  return a4(&v7, &v5);
}

id CKDeclineSharesOperation.perShareResultBlock.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  if (a1)
  {
    uint64_t v6 = sub_20CB6BAA0();
    *(void *)(v6 + 16) = a1;
    *(void *)(v6 + 24) = a2;
    v9[4] = sub_20CB6B1D4;
    v9[5] = v6;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 1107296256;
    v9[2] = sub_20CB6B1DC;
    v9[3] = &unk_26C1C3658;
    uint64_t v7 = _Block_copy(v9);
    swift_retain();
    swift_release();
    objc_msgSend(v3, sel_setPerShareCompletionBlock_, v7);
    _Block_release(v7);
    return (id)sub_20CB6B280(a1);
  }
  else
  {
    return objc_msgSend(v2, sel_setPerShareCompletionBlock_, 0);
  }
}

void sub_20CB6AFBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = _convertErrorToNSError(_:)();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

uint64_t sub_20CB6B02C()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_20CB6B064(uint64_t a1, uint64_t a2)
{
  sub_20CB6AFBC(a1, a2, *(void *)(v2 + 16));
}

void sub_20CB6B06C(uint64_t a1, id a2, char a3, void (*a4)(uint64_t, id))
{
  if (a3)
  {
    id v7 = a2;
    a4(a1, a2);
    sub_20CB6BA64(a2, 1);
  }
  else
  {
    a4(a1, 0);
  }
}

void sub_20CB6B0F4(uint64_t a1, void *a2, char a3)
{
  sub_20CB6B06C(a1, a2, a3 & 1, *(void (**)(uint64_t, id))(v3 + 16));
}

void sub_20CB6B100(uint64_t a1, void *a2, void (*a3)(uint64_t, void *, uint64_t))
{
  if (!a2) {
    goto LABEL_4;
  }
  swift_getErrorValue();
  id v6 = a2;
  if (Error.ckIsPartialError.getter())
  {

LABEL_4:
    a3(a1, 0, 0);
    return;
  }
  id v7 = a2;
  a3(a1, a2, 1);
}

void sub_20CB6B1D4(uint64_t a1, void *a2)
{
  sub_20CB6B100(a1, a2, *(void (**)(uint64_t, void *, uint64_t))(v2 + 16));
}

void sub_20CB6B1DC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(id, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(v7, a3);
  swift_release();
}

uint64_t sub_20CB6B268(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_20CB6B278()
{
  return swift_release();
}

uint64_t sub_20CB6B280(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t (*CKDeclineSharesOperation.perShareResultBlock.modify(void (**a1)(uint64_t a1, void *a2, char a3)))(uint64_t *a1, char a2)
{
  a1[2] = v1;
  *a1 = CKDeclineSharesOperation.perShareResultBlock.getter();
  a1[1] = v3;
  return sub_20CB6B2D8;
}

uint64_t sub_20CB6B2D8(uint64_t *a1, char a2)
{
  return sub_20CB6B8F8(a1, a2, (uint64_t (*)(uint64_t, uint64_t))CKDeclineSharesOperation.perShareResultBlock.setter, (void (*)(uint64_t, uint64_t))sub_20CB6B318, (uint64_t (*)(uint64_t, uint64_t))sub_20CB6B280);
}

uint64_t sub_20CB6B318(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

void (*CKDeclineSharesOperation.declineSharesResultBlock.getter())(void *a1, char a2)
{
  uint64_t result = (void (*)(void *, char))objc_msgSend(v0, sel_declineSharesCompletionBlock);
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v2;
    uint64_t v4 = sub_20CB6BAA0();
    *(void *)(v4 + 16) = sub_20CB6B67C;
    *(void *)(v4 + 24) = v3;
    return sub_20CB6B734;
  }
  return result;
}

uint64_t sub_20CB6B3C0@<X0>(uint64_t (**a1)(uint64_t a1)@<X8>)
{
  uint64_t result = (uint64_t)CKDeclineSharesOperation.declineSharesResultBlock.getter();
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = v3;
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v4;
    *(void *)(result + 24) = v5;
    id v6 = sub_20CB6B9EC;
  }
  else
  {
    id v6 = 0;
  }
  *a1 = v6;
  a1[1] = (uint64_t (*)(uint64_t))result;
  return result;
}

id sub_20CB6B430(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  if (*a1)
  {
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v1;
    *(void *)(v3 + 24) = v2;
    uint64_t v4 = sub_20CB6B9AC;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v3 = 0;
  }
  sub_20CB6B318(v1);
  return CKDeclineSharesOperation.declineSharesResultBlock.setter((uint64_t)v4, v3);
}

id CKDeclineSharesOperation.declineSharesResultBlock.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  if (a1)
  {
    uint64_t v6 = sub_20CB6BAA0();
    *(void *)(v6 + 16) = a1;
    *(void *)(v6 + 24) = a2;
    v9[4] = sub_20CB6B7FC;
    v9[5] = v6;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 1107296256;
    v9[2] = sub_20CB6B804;
    v9[3] = &unk_26C1C3770;
    id v7 = _Block_copy(v9);
    sub_20CB6B318(a1);
    swift_retain();
    swift_release();
    objc_msgSend(v3, sel_setDeclineSharesCompletionBlock_, v7);
    _Block_release(v7);
    objc_msgSend(v3, sel_setCanDropItemResultsEarly_, 1);
    sub_20CB6B280(a1);
    return (id)sub_20CB6B280(a1);
  }
  else
  {
    return objc_msgSend(v2, sel_setDeclineSharesCompletionBlock_, 0);
  }
}

void sub_20CB6B618(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = _convertErrorToNSError(_:)();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

void sub_20CB6B67C(uint64_t a1)
{
  sub_20CB6B618(a1, *(void *)(v1 + 16));
}

void sub_20CB6B684(void *a1, char a2, void (*a3)(void *))
{
  if (a2)
  {
    id v5 = a1;
    a3(a1);
    sub_20CB6BA64(a1, 1);
  }
  else
  {
    a3(0);
  }
}

uint64_t sub_20CB6B6FC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_20CB6B734(void *a1, char a2)
{
  sub_20CB6B684(a1, a2 & 1, *(void (**)(void *))(v2 + 16));
}

void sub_20CB6B740(void *a1, void (*a2)(void *, uint64_t))
{
  if (!a1) {
    goto LABEL_4;
  }
  swift_getErrorValue();
  id v4 = a1;
  if (Error.ckIsPartialError.getter())
  {

LABEL_4:
    a2(0, 0);
    return;
  }
  id v5 = a1;
  a2(a1, 1);
}

void sub_20CB6B7FC(void *a1)
{
  sub_20CB6B740(a1, *(void (**)(void *, uint64_t))(v1 + 16));
}

void sub_20CB6B804(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t (*CKDeclineSharesOperation.declineSharesResultBlock.modify(void (**a1)(void *a1, char a2)))(uint64_t *a1, char a2)
{
  a1[2] = v1;
  *a1 = CKDeclineSharesOperation.declineSharesResultBlock.getter();
  a1[1] = v3;
  return sub_20CB6B8B8;
}

uint64_t sub_20CB6B8B8(uint64_t *a1, char a2)
{
  return sub_20CB6B8F8(a1, a2, (uint64_t (*)(uint64_t, uint64_t))CKDeclineSharesOperation.declineSharesResultBlock.setter, (void (*)(uint64_t, uint64_t))sub_20CB6BA70, (uint64_t (*)(uint64_t, uint64_t))sub_20CB6BA74);
}

uint64_t sub_20CB6B8F8(uint64_t *a1, char a2, uint64_t (*a3)(uint64_t, uint64_t), void (*a4)(uint64_t, uint64_t), uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v6 = *a1;
  uint64_t v7 = a1[1];
  if ((a2 & 1) == 0) {
    return a3(*a1, v7);
  }
  a4(*a1, v7);
  a3(v6, v7);
  return a5(v6, v7);
}

uint64_t sub_20CB6B9AC(uint64_t a1, char a2)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t *))(v2 + 16);
  uint64_t v5 = a1;
  char v6 = a2 & 1;
  return v3(&v5);
}

uint64_t sub_20CB6B9EC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(v1 + 16))(*(void *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t sub_20CB6BA20(uint64_t a1, uint64_t a2, char a3)
{
  return sub_20CB6AE48(a1, a2, a3 & 1, *(uint64_t (**)(uint64_t *, uint64_t *))(v3 + 16));
}

uint64_t sub_20CB6BA2C(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, void))(v2 + 16))(*a1, *(void *)a2, *(unsigned __int8 *)(a2 + 8));
}

void sub_20CB6BA64(id a1, char a2)
{
  if (a2) {
}
  }

uint64_t sub_20CB6BAA0()
{
  return swift_allocObject();
}

void Ckcode_RecordTransport.init(_:)(void *a1@<X0>, uint64_t *a2@<X8>)
{
  *(_OWORD *)a2 = xmmword_20CB96B40;
  uint64_t v4 = type metadata accessor for Ckcode_RecordTransport();
  UnknownStorage.init()();
  *(_OWORD *)((char *)a2 + *(int *)(v4 + 24)) = xmmword_20CB96470;
  id v5 = objc_msgSend(a1, sel_valueStore);
  sub_20CB650D0(&qword_26ACC68F8);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_20CB96B50;
  *(void *)(v6 + 32) = sub_20CB6BD44();
  sub_20CB650D0(qword_26ACC6900);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v18[4] = sub_20CB6BE08;
  v18[5] = 0;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 1107296256;
  v18[2] = sub_20CB6BE0C;
  v18[3] = &unk_26C1C3680;
  uint64_t v8 = _Block_copy(v18);
  swift_release();
  unsigned __int8 v9 = objc_msgSend(v5, sel_containsValueOfClasses_options_passingTest_, isa, 1, v8);

  _Block_release(v8);
  if (swift_isEscapingClosureAtFileLocation())
  {
    __break(1u);
  }
  else if (v9)
  {
    uint64_t v10 = (void *)*MEMORY[0x263EFF4A0];
    id v11 = objc_allocWithZone(MEMORY[0x263EFF940]);
    id v12 = sub_20CB6BFE8(v10, 0xD000000000000045, 0x800000020CB9A7F0, 0);
    objc_msgSend(v12, sel_raise);
  }
  else
  {
    id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08910]), sel_initRequiringSecureCoding_, 1);
    objc_msgSend(a1, sel_encodeWithCoder_, v13);
    id v14 = objc_msgSend(v13, sel_encodedData);
    uint64_t v15 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v17 = v16;

    sub_20CB6BEB4(*a2, a2[1]);
    *a2 = v15;
    a2[1] = v17;
  }
}

unint64_t sub_20CB6BD44()
{
  unint64_t result = qword_26ACC68D0;
  if (!qword_26ACC68D0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26ACC68D0);
  }
  return result;
}

id sub_20CB6BD84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20CB6C244(a3, (uint64_t)v6);
  sub_20CB6BD44();
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  id v3 = objc_msgSend(v5, sel_shouldReadAssetContentUsingClientProxy);

  return v3;
}

uint64_t sub_20CB6BE0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, void *))(a1 + 32);
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  v9[3] = swift_getObjectType();
  v9[0] = a3;
  swift_unknownObjectRetain();
  LOBYTE(a3) = v4(v5, v7, v9);
  swift_bridgeObjectRelease();
  sub_20CB6C1F4((uint64_t)v9);
  return a3 & 1;
}

uint64_t sub_20CB6BE9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_20CB6BEAC()
{
  return swift_release();
}

uint64_t sub_20CB6BEB4(uint64_t a1, uint64_t a2)
{
  if ((~a2 & 0x3000000000000000) != 0) {
    return sub_20CB6BEC8(a1, a2);
  }
  return a1;
}

uint64_t sub_20CB6BEC8(uint64_t a1, uint64_t a2)
{
  return sub_20CB64DC8(a1, a2 & 0xDFFFFFFFFFFFFFFFLL);
}

id CKRecord.init(_:)(uint64_t *a1)
{
  unint64_t v2 = a1[1];
  if ((~v2 & 0x3000000000000000) == 0 || (v2 & 0x2000000000000000) != 0) {
    goto LABEL_4;
  }
  uint64_t v3 = *a1;
  id v4 = objc_allocWithZone(MEMORY[0x263F08928]);
  sub_20CB6C1EC(v3, v2);
  sub_20CB6C1EC(v3, v2);
  id v5 = sub_20CB6C10C(v3, v2);
  uint64_t v8 = v5;
  if (!v5)
  {
    sub_20CB6BEB4(v3, v2);
LABEL_4:
    sub_20CB6C0B0((uint64_t)a1);
    return 0;
  }
  id v9 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCoder_, v5);

  id v6 = v9;
  sub_20CB6BEB4(v3, v2);
  sub_20CB6C0B0((uint64_t)a1);
  if (v6) {

  }
  return v6;
}

id sub_20CB6BFE8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3)
  {
    uint64_t v7 = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    v8.super.Class isa = 0;
    goto LABEL_6;
  }
  uint64_t v7 = (void *)MEMORY[0x210555430](a2, a3);
  swift_bridgeObjectRelease();
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  v8.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
LABEL_6:
  id v9 = objc_msgSend(v4, sel_initWithName_reason_userInfo_, a1, v7, v8.super.isa);

  return v9;
}

uint64_t sub_20CB6C0B0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Ckcode_RecordTransport();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_20CB6C10C(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  v11[1] = *(id *)MEMORY[0x263EF8340];
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  v11[0] = 0;
  id v7 = objc_msgSend(v3, sel_initForReadingFromData_error_, isa, v11);

  if (v7)
  {
    id v8 = v11[0];
  }
  else
  {
    id v9 = v11[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  sub_20CB64DC8(a1, a2);
  return v7;
}

uint64_t sub_20CB6C1EC(uint64_t a1, uint64_t a2)
{
  return sub_20CB64CA4(a1, a2 & 0xDFFFFFFFFFFFFFFFLL);
}

uint64_t sub_20CB6C1F4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_20CB6C244(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void CKContainer.decline(_:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = objc_msgSend(v3, sel_implementation);
  id v8 = objc_msgSend(v3, sel_convenienceConfiguration);
  sub_20CB6C34C(a1, (uint64_t)v3, (uint64_t)v8, a2, a3);
}

uint64_t sub_20CB6C34C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6 = v5;
  sub_20CB6CEE4(0, &qword_2676F0D30);
  swift_bridgeObjectRetain();
  id v11 = sub_20CB6C9A4();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = MEMORY[0x263F8EE80];
  swift_retain();
  CKDeclineSharesOperation.perShareResultBlock.setter((uint64_t)sub_20CB6CE70, v12);
  id v13 = (void *)swift_allocObject();
  v13[2] = v12;
  v13[3] = a4;
  v13[4] = a5;
  swift_retain();
  swift_retain();
  CKDeclineSharesOperation.declineSharesResultBlock.setter((uint64_t)sub_20CB6CEBC, (uint64_t)v13);
  objc_msgSend(v6, sel__scheduleConvenienceOperation_wrappingContainer_convenienceConfiguration_, v11, a2, a3);

  return swift_release();
}

uint64_t CKContainer.decline(_:)(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return sub_20CB6CF38((uint64_t)sub_20CB6C4A4);
}

uint64_t sub_20CB6C4A4()
{
  sub_20CB6CF44();
  uint64_t v1 = (void *)v0[3];
  v0[4] = objc_msgSend(v1, sel_implementation);
  id v2 = objc_msgSend(v1, sel_convenienceConfiguration);
  v0[5] = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[6] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_20CB6C580;
  uint64_t v5 = v0[2];
  uint64_t v4 = v0[3];
  return sub_20CB6C710(v5, v4, (uint64_t)v2);
}

uint64_t sub_20CB6C580(uint64_t a1)
{
  sub_20CB6CF20();
  uint64_t v5 = v4;
  sub_20CB6CF50();
  *id v6 = v5;
  uint64_t v7 = *v2;
  sub_20CB6CF50();
  *id v8 = v7;
  *(void *)(v5 + 56) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return MEMORY[0x270FA2498](sub_20CB6C6AC, 0, 0);
  }
  else
  {
    id v9 = *(void **)(v5 + 32);

    uint64_t v10 = *(uint64_t (**)(uint64_t))(v7 + 8);
    return v10(a1);
  }
}

uint64_t sub_20CB6C6AC()
{
  sub_20CB6CF44();
  uint64_t v1 = *(void **)(v0 + 32);

  id v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_20CB6C710(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  return sub_20CB6CF38((uint64_t)sub_20CB6C72C);
}

uint64_t sub_20CB6C72C()
{
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 56) = v3;
  long long v4 = *(_OWORD *)(v0 + 24);
  *(void *)(v3 + 16) = v1;
  *(_OWORD *)(v3 + 24) = v4;
  *(void *)(v3 + 40) = v2;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v5;
  uint64_t v6 = sub_20CB650D0(&qword_2676F0D20);
  void *v5 = v0;
  v5[1] = sub_20CB6C83C;
  return MEMORY[0x270FA2360](v0 + 16, 0, 0, 0xD000000000000036, 0x800000020CB9A840, sub_20CB6CCA4, v3, v6);
}

uint64_t sub_20CB6C83C()
{
  sub_20CB6CF44();
  sub_20CB6CF20();
  uint64_t v3 = v2;
  sub_20CB6CF50();
  void *v4 = v3;
  uint64_t v5 = *v1;
  sub_20CB6CF50();
  *uint64_t v6 = v5;
  *(void *)(v3 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v7 = sub_20CB6C944;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v7 = sub_20CB6C928;
  }
  return MEMORY[0x270FA2498](v7, 0, 0);
}

uint64_t sub_20CB6C928()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 16));
}

uint64_t sub_20CB6C944()
{
  sub_20CB6CF44();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

id sub_20CB6C9A4()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_20CB6CEE4(0, (unint64_t *)&unk_2676F1500);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithShareMetadatas_, isa);

  return v2;
}

void sub_20CB6CA2C(void *a1, void *a2, char a3)
{
  swift_beginAccess();
  id v6 = a1;
  a3 &= 1u;
  sub_20CB6CED8(a2, a3);
  sub_20CB8FD14((uint64_t)a2, a3, v6);
  swift_endAccess();
}

void sub_20CB6CAB4(void *a1, char a2, uint64_t a3, void (*a4)(void *, uint64_t))
{
  uint64_t v5 = a2 & 1;
  if (a2)
  {
    id v6 = a1;
    id v7 = a1;
  }
  else
  {
    swift_beginAccess();
    id v6 = *(void **)(a3 + 16);
    swift_bridgeObjectRetain();
  }
  a4(v6, v5);
  sub_20CB6CECC(v6, v5);
}

uint64_t sub_20CB6CB44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = sub_20CB650D0(&qword_2676F0D28);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v13 + v12, (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  sub_20CB6C34C(a3, a4, a5, (uint64_t)sub_20CB6CDB4, v13);
  return swift_release();
}

uint64_t sub_20CB6CCA4(uint64_t a1)
{
  return sub_20CB6CB44(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_20CB6CCB0(void *a1, char a2)
{
  if (a2)
  {
    id v3 = a1;
    sub_20CB650D0(&qword_2676F0D28);
    return CheckedContinuation.resume(throwing:)();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_20CB650D0(&qword_2676F0D28);
    return CheckedContinuation.resume(returning:)();
  }
}

uint64_t sub_20CB6CD20()
{
  uint64_t v1 = sub_20CB650D0(&qword_2676F0D28);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_20CB6CDB4(void *a1, char a2)
{
  char v3 = a2 & 1;
  sub_20CB650D0(&qword_2676F0D28);
  return sub_20CB6CCB0(a1, v3);
}

uint64_t sub_20CB6CE38()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_20CB6CE70(void *a1, void *a2, char a3)
{
}

uint64_t sub_20CB6CE7C()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_20CB6CEBC(void *a1, char a2)
{
  sub_20CB6CAB4(a1, a2 & 1, *(void *)(v2 + 16), *(void (**)(void *, uint64_t))(v2 + 24));
}

void sub_20CB6CECC(id a1, char a2)
{
  if (a2) {

  }
  else {
    swift_bridgeObjectRelease();
  }
}

id sub_20CB6CED8(id result, char a2)
{
  if (a2) {
    return result;
  }
  return result;
}

uint64_t sub_20CB6CEE4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_20CB6CF38(uint64_t a1)
{
  return MEMORY[0x270FA2498](a1, 0, 0);
}

uint64_t sub_20CB6CF5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v33 = a5;
  uint64_t v35 = a4;
  uint64_t v8 = type metadata accessor for Optional();
  sub_20CB6D4D0();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v33 - v12;
  sub_20CB6D4D0();
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20CB6D4D0();
  uint64_t v18 = v17;
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)&v33 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t))(v22 + 16);
  uint64_t v34 = v5;
  v23(v16, v5, a2);
  if (swift_dynamicCast())
  {
    _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)v13, 0, 1, a3);
    uint64_t v24 = *(void (**)(char *, char *, uint64_t))(v18 + 32);
    v24(v21, v13, a3);
    sub_20CB6D43C(a3, a3);
    swift_allocObject();
    uint64_t v25 = static Array._adoptStorage(_:count:)();
    v24(v26, v21, a3);
    type metadata accessor for Array();
  }
  else
  {
    _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)v13, 1, 1, a3);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v8);
    uint64_t v27 = swift_allocObject();
    *(void *)(v27 + 16) = static Array._allocateUninitialized(_:)();
    uint64_t v28 = (void *)swift_allocObject();
    v28[2] = a2;
    v28[3] = a3;
    uint64_t v29 = v33;
    v28[4] = v35;
    v28[5] = v29;
    v28[6] = v27;
    uint64_t v36 = nullsub_1(sub_20CB6D42C);
    uint64_t v37 = v30;
    type metadata accessor for ExtractingVisitor();
    swift_retain();
    swift_getWitnessTable();
    uint64_t v31 = v38;
    dispatch thunk of Message.traverse<A>(visitor:)();
    uint64_t v25 = v37;
    swift_release();
    if (!v31)
    {
      swift_beginAccess();
      uint64_t v25 = *(void *)(v27 + 16);
      swift_bridgeObjectRetain();
    }
    swift_release();
  }
  return v25;
}

uint64_t sub_20CB6D2C4()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_20CB6D2FC(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))((char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0), v4, v3);
  swift_beginAccess();
  type metadata accessor for Array();
  Array.append(_:)();
  return swift_endAccess();
}

uint64_t sub_20CB6D3F4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_20CB6D42C(uint64_t a1)
{
  return sub_20CB6D2FC(a1);
}

uint64_t sub_20CB6D43C(uint64_t a1, uint64_t a2)
{
  if (sub_20CB6D4A0(a2))
  {
    return sub_20CB650D0(&qword_2676F0D38);
  }
  else
  {
    return MEMORY[0x270F9F4F8]();
  }
}

uint64_t sub_20CB6D4A0(uint64_t a1)
{
  if (swift_isClassType()) {
    return a1;
  }
  else {
    return 0;
  }
}

uint64_t sub_20CB6D4E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v22[2] = a4;
  v22[0] = a2;
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = type metadata accessor for Optional();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v22 - v10;
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
  v22[1] = a1;
  v19(v14, a1, a3);
  if (swift_dynamicCast())
  {
    _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)v11, 0, 1, v6);
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v17, v11, v6);
    (*(void (**)(char *))v23)(v17);
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v6);
  }
  else
  {
    _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)v11, 1, 1, v6);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    uint64_t v21 = *(void *)(v23 + 8);
    uint64_t v24 = *(void (**)(char *))v23;
    uint64_t v25 = v21;
    swift_retain();
    swift_getWitnessTable();
    dispatch thunk of Message.traverse<A>(visitor:)();
    return swift_release();
  }
}

uint64_t sub_20CB6D7C0()
{
  return Sequence.forEach(_:)();
}

uint64_t sub_20CB6D85C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9 = type metadata accessor for ExtractingVisitor();
  return sub_20CB6D4E8(a1, v9, a4, a6);
}

uint64_t sub_20CB6D8C8()
{
  return Sequence.forEach(_:)();
}

uint64_t sub_20CB6D9EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v11 = type metadata accessor for ExtractingVisitor();
  return sub_20CB6D4E8(a2, v11, a6, a9);
}

uint64_t sub_20CB6DA58(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  swift_getAssociatedTypeWitness();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  return a2(a1, a1 + *(int *)(TupleTypeMetadata2 + 48));
}

uint64_t sub_20CB6DAF4()
{
  sub_20CB6DE70();
  return sub_20CB6D4E8(v0, v1, v2, v3);
}

uint64_t sub_20CB6DB10()
{
  return sub_20CB6D7C0();
}

uint64_t sub_20CB6DB2C()
{
  return sub_20CB6D8C8();
}

void sub_20CB6DB54()
{
}

uint64_t sub_20CB6DBB0()
{
  return sub_20CB6DAF4();
}

uint64_t sub_20CB6DBD8()
{
  return sub_20CB6DB10();
}

uint64_t sub_20CB6DC00()
{
  return sub_20CB6DB2C();
}

void sub_20CB6DC34()
{
}

uint64_t sub_20CB6DC44()
{
  return Visitor.visitExtensionFieldsAsMessageSet(fields:start:end:)();
}

uint64_t sub_20CB6DC5C(uint64_t a1, uint64_t a2)
{
  return sub_20CB6D9EC(a1, a2, v2[9], v2[2], v2[3], v2[4], v2[5], v2[6], v2[7]);
}

uint64_t sub_20CB6DC90(uint64_t a1)
{
  return sub_20CB6DA58(a1, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 72));
}

uint64_t type metadata accessor for ExtractingVisitor()
{
  return sub_20CB6DE3C();
}

uint64_t sub_20CB6DCE0(uint64_t a1)
{
  return sub_20CB6D85C(a1, v1[6], v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_20CB6DD04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

void *sub_20CB6DD0C(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t sub_20CB6DD3C()
{
  return swift_release();
}

void *sub_20CB6DD44(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for RemoteMeasurement(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *sub_20CB6DD8C(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t sub_20CB6DDC0(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
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

uint64_t sub_20CB6DE00(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_20CB6DE3C()
{
  return swift_getGenericMetadata();
}

uint64_t sub_20CB6DE80()
{
  return -1;
}

uint64_t CKVersionedMergeable.deltaDeliveryRequirements.getter()
{
  return -1;
}

void CKMergeable.merge(_:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v100 = a3;
  uint64_t v112 = *MEMORY[0x263EF8340];
  uint64_t v7 = type metadata accessor for Logger();
  sub_20CB6D4D0();
  uint64_t v9 = v8;
  uint64_t v104 = v8;
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = &v88[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  v95 = &v88[-v15];
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v96 = &v88[-v17];
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = &v88[-v19];
  sub_20CB6D4D0();
  MEMORY[0x270FA5388](v21);
  sub_20CB6A8FC();
  uint64_t v24 = v23 - v22;
  uint64_t v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16);
  uint64_t v98 = v3;
  v26(v24, v3, a2);
  sub_20CB650D0(&qword_2676F0D40);
  uint64_t v99 = a2;
  int v27 = swift_dynamicCast();
  uint64_t v102 = v9;
  uint64_t v103 = v7;
  v105 = v13;
  if (v27)
  {
    sub_20CB6FE18(v107, (uint64_t)v109);
    CKLogDistributedSync.getter();
    uint64_t v28 = a1;
    uint64_t v29 = Logger.logObject.getter();
    os_log_type_t v30 = static os_log_type_t.debug.getter();
    BOOL v31 = os_log_type_enabled(v29, v30);
    v101 = a1;
    if (v31)
    {
      unint64_t v32 = (uint8_t *)swift_slowAlloc();
      v97 = (void (*)(void))sub_20CB6FEDC();
      *(_DWORD *)unint64_t v32 = 138412290;
      *(void *)&v107[0] = v28;
      uint64_t v33 = v28;
      uint64_t v7 = v103;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(void *)v97 = v28;

      _os_log_impl(&dword_20CB63000, v29, v30, "Merging record value into versioned mergeable %@", v32, 0xCu);
      sub_20CB650D0(qword_26ACC70B0);
      swift_arrayDestroy();
      sub_20CB6FE30();
      sub_20CB6FE30();
    }
    else
    {

      uint64_t v29 = v28;
    }

    v40 = *(void (**)(void))(v104 + 8);
    ((void (*)(unsigned char *, uint64_t))v40)(v20, v7);
    uint64_t v41 = v110;
    uint64_t v42 = v111;
    uint64_t v43 = (void *)sub_20CB6FEF4();
    sub_20CB6F898(v43, v44);
    v45 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v42 + 16))(v41, v42);
    uint64_t v46 = v110;
    uint64_t v47 = v111;
    sub_20CB6F898(v109, v110);
    id v48 = [v28 deliverableDeltasWithCurrentStateVector:v45 usingDeliveryRequirements:(*(uint64_t (**)(uint64_t, uint64_t))(v47 + 24))(v46, v47)];

    if (!v48)
    {
      a1 = v101;
LABEL_39:
      uint64_t v13 = v105;
      sub_20CB6C1F4((uint64_t)v109);
      goto LABEL_42;
    }
    sub_20CB6F858();
    unint64_t v49 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    a1 = v101;
    if (v49 >> 62)
    {
      if (_CocoaArrayWrapper.endIndex.getter()) {
        goto LABEL_10;
      }
    }
    else if (*(void *)((v49 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_10:
      sub_20CB6FF14();
      v50();
      swift_bridgeObjectRelease();
      uint64_t v106 = v4;
      if (v4)
      {

        sub_20CB6C1F4((uint64_t)v109);
        return;
      }
      [v28 didMergeDeltas:v48];
      goto LABEL_38;
    }
    swift_bridgeObjectRelease();
LABEL_38:

    goto LABEL_39;
  }
  uint64_t v108 = 0;
  memset(v107, 0, sizeof(v107));
  sub_20CB6F7F8((uint64_t)v107);
  CKLogDistributedSync.getter();
  uint64_t v34 = a1;
  uint64_t v35 = Logger.logObject.getter();
  os_log_type_t v36 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v35, v36))
  {
    uint64_t v37 = (uint8_t *)swift_slowAlloc();
    v97 = (void (*)(void))sub_20CB6FEDC();
    *(_DWORD *)uint64_t v37 = 138412290;
    v101 = a1;
    v109[0] = v34;
    uint64_t v38 = v34;
    char v39 = v34;
    sub_20CB6FEF4();
    a1 = v101;
    uint64_t v7 = v103;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(void *)v97 = v38;

    _os_log_impl(&dword_20CB63000, v35, v36, "Merging record value into non-versioned mergeable %@", v37, 0xCu);
    sub_20CB650D0(qword_26ACC70B0);
    swift_arrayDestroy();
    sub_20CB6FE30();
    uint64_t v13 = v105;
    sub_20CB6FE30();
  }
  else
  {

    uint64_t v35 = v34;
    uint64_t v38 = v34;
  }
  uint64_t v51 = v104;

  v53 = *(void (**)(void))(v51 + 8);
  uint64_t v52 = v51 + 8;
  v40 = v53;
  sub_20CB6FE48();
  v53();
  id v54 = [v38 multiValueRegister];
  id v55 = objc_msgSend(v54, sel_stateVector);
  id v56 = objc_msgSend(v54, sel_deltaDeliveryRequirements);
  v94 = v38;
  id v57 = [v38 deliverableDeltasWithCurrentStateVector:v55 usingDeliveryRequirements:v56];

  if (v57)
  {
    v97 = v40;
    unint64_t v58 = sub_20CB6F858();
    unint64_t v59 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v60 = v59;
    unint64_t v61 = v59 >> 62;
    if (v59 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v81 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v81) {
        goto LABEL_16;
      }
    }
    else if (*(void *)((v59 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_16:
      v109[0] = 0;
      if (!objc_msgSend(v54, sel_mergeDeltas_error_, v57, v109))
      {
        id v68 = v109[0];
        swift_bridgeObjectRelease();

        uint64_t v69 = _convertNSErrorToError(_:)();
        uint64_t v106 = v69;
        swift_willThrow();

        return;
      }
      unint64_t v93 = v58;
      id v62 = v109[0];
      CKLogDistributedSync.getter();
      id v63 = v54;
      swift_bridgeObjectRetain();
      id v54 = v63;
      v64 = Logger.logObject.getter();
      int v65 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v64, (os_log_type_t)v65))
      {
        int v89 = v65;
        os_log_t v91 = v64;
        uint64_t v66 = swift_slowAlloc();
        v90 = (void *)sub_20CB6FEDC();
        *(_DWORD *)uint64_t v66 = 134218242;
        v101 = a1;
        uint64_t v104 = v52;
        id v92 = v54;
        if (v61)
        {
          if (v60 < 0) {
            id v63 = (id)v60;
          }
          else {
            id v63 = (id)(v60 & 0xFFFFFFFFFFFFFF8);
          }
          swift_bridgeObjectRetain();
          v67 = (void *)_CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
        }
        else
        {
          v67 = *(void **)((v60 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        swift_bridgeObjectRelease();
        v109[0] = v67;
        sub_20CB6FEF4();
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        *(_WORD *)(v66 + 12) = 2112;
        id v70 = v92;
        v109[0] = v92;
        id v71 = v92;
        sub_20CB6FEF4();
        id v54 = v70;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        void *v90 = v70;

        os_log_t v72 = v91;
        _os_log_impl(&dword_20CB63000, v91, (os_log_type_t)v89, "Merged %ld deltas into multi-value register %@", (uint8_t *)v66, 0x16u);
        sub_20CB650D0(qword_26ACC70B0);
        swift_arrayDestroy();
        sub_20CB6FE30();
        sub_20CB6FE30();

        uint64_t v7 = v103;
        a1 = v101;
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      v40 = v97;
      sub_20CB6FE48();
      v40();
      id v73 = objc_msgSend(v54, sel_contents);
      uint64_t v13 = v105;
      if (!v73)
      {

        __break(1u);
        return;
      }
      v74 = v73;
      static Array._unconditionallyBridgeFromObjectiveC(_:)();

      sub_20CB6FF14();
      v75();
      uint64_t v106 = (uint64_t)v63;
      if (v63)
      {

        swift_bridgeObjectRelease();
        return;
      }
      swift_bridgeObjectRelease();
      CKLogDistributedSync.getter();
      v76 = Logger.logObject.getter();
      os_log_type_t v77 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v76, v77))
      {
        v78 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v78 = 0;
        _os_log_impl(&dword_20CB63000, v76, v77, "Merged multi-value register changes into mergeable", v78, 2u);
        v40 = v97;
        sub_20CB6FE30();
      }

      sub_20CB6FE48();
      v40();
      id v79 = objc_msgSend(v54, sel_persistedState);
      v80 = v94;
      [v94 setMultiValueRegisterState:v79];

      [v80 didMergeDeltas:v57];
      goto LABEL_35;
    }
    swift_bridgeObjectRelease();

    uint64_t v13 = v105;
    v40 = v97;
    goto LABEL_42;
  }
LABEL_35:

LABEL_42:
  CKLogDistributedSync.getter();
  v82 = a1;
  v83 = Logger.logObject.getter();
  os_log_type_t v84 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v83, v84))
  {
    v97 = v40;
    v85 = (uint8_t *)swift_slowAlloc();
    v86 = (void *)sub_20CB6FEDC();
    *(_DWORD *)v85 = 138412290;
    v109[0] = v82;
    v87 = v82;
    v40 = v97;
    uint64_t v7 = v103;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v86 = v82;

    uint64_t v13 = v105;
    _os_log_impl(&dword_20CB63000, v83, v84, "Done merging record value %@", v85, 0xCu);
    sub_20CB650D0(qword_26ACC70B0);
    swift_arrayDestroy();
    sub_20CB6FE30();
    sub_20CB6FE30();
  }
  else
  {

    v83 = v82;
  }

  ((void (*)(unsigned char *, uint64_t))v40)(v13, v7);
}

id CKMergeable.merge(_:)(void *a1)
{
  v4[1] = *(id *)MEMORY[0x263EF8340];
  v4[0] = 0;
  if (objc_msgSend(a1, sel_mergeIntoMergeable_error_, v1, v4)) {
    return v4[0];
  }
  id v3 = v4[0];
  _convertNSErrorToError(_:)();

  return (id)swift_willThrow();
}

id CKMergeableRecordValue.addDeltasToSave(from:)(void *a1)
{
  uint64_t v2 = v1;
  v8[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[4];
  sub_20CB6F898(a1, v3);
  id v5 = CKMergeable.boxed.getter(v3, v4);
  v8[0] = 0;
  LODWORD(v2) = objc_msgSend(v2, sel_addDeltasToSaveFromMergeable_error_, v5, v8);

  if (v2) {
    return v8[0];
  }
  id v7 = v8[0];
  _convertNSErrorToError(_:)();

  return (id)swift_willThrow();
}

id CKMergeable.boxed.getter(uint64_t a1, uint64_t a2)
{
  sub_20CB6D4D0();
  uint64_t v5 = v4;
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = *(void (**)(void))(v5 + 16);
  sub_20CB6FEC8();
  v10();
  sub_20CB650D0(&qword_2676F0D40);
  if (swift_dynamicCast())
  {
    sub_20CB6FE18(v15, (uint64_t)v17);
    sub_20CB6FADC((uint64_t)v17, (uint64_t)v15);
    id v11 = objc_allocWithZone((Class)type metadata accessor for BoxedCKVersionedMergeable());
    id v12 = BoxedCKVersionedMergeable.init(_:)(v15);
    sub_20CB6C1F4((uint64_t)v17);
  }
  else
  {
    uint64_t v16 = 0;
    memset(v15, 0, sizeof(v15));
    sub_20CB6F7F8((uint64_t)v15);
    uint64_t v13 = type metadata accessor for BoxedCKMergeable();
    sub_20CB6FEC8();
    v10();
    return sub_20CB6F9B0((uint64_t)v9, v13, a1, a2);
  }
  return v12;
}

void *CKMergeableDelta.data.getter()
{
  v5[1] = *(id *)MEMORY[0x263EF8340];
  v5[0] = 0;
  id v1 = objc_msgSend(v0, sel_dataWithError_, v5);
  id v2 = v5[0];
  if (v1)
  {
    uint64_t v3 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v3 = v2;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return v3;
}

uint64_t sub_20CB6EDD4(uint64_t a1)
{
  sub_20CB6FADC(a1, (uint64_t)v2);
  return sub_20CB6EE64(v2);
}

uint64_t sub_20CB6EE10@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC12CloudKitCode16BoxedCKMergeable_mergeable;
  swift_beginAccess();
  return sub_20CB6FADC(v3, a1);
}

uint64_t sub_20CB6EE64(long long *a1)
{
  sub_20CB6FE74(OBJC_IVAR____TtC12CloudKitCode16BoxedCKMergeable_mergeable);
  swift_beginAccess();
  sub_20CB6C1F4(v1);
  sub_20CB6FE18(a1, v1);
  return swift_endAccess();
}

uint64_t BoxedCKMergeable.__allocating_init(_:)(uint64_t a1)
{
  return sub_20CB6EEE8(a1, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_20CB6F9B0);
}

uint64_t BoxedCKMergeable.init(_:)(uint64_t a1)
{
  return sub_20CB6EEE8(a1, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_20CB6F900);
}

uint64_t sub_20CB6EEE8(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5 = *(void *)(a1 + 24);
  uint64_t v6 = *(void *)(a1 + 32);
  sub_20CB6FB40(a1, v5);
  sub_20CB6D4D0();
  MEMORY[0x270FA5388](v7);
  sub_20CB6A8FC();
  uint64_t v10 = v9 - v8;
  (*(void (**)(uint64_t))(v11 + 16))(v9 - v8);
  uint64_t v12 = a2(v10, v2, v5, v6);
  sub_20CB6C1F4(a1);
  return v12;
}

uint64_t sub_20CB6EFB0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC12CloudKitCode16BoxedCKMergeable_mergeable;
  swift_beginAccess();
  sub_20CB6FADC(v1, (uint64_t)v6);
  sub_20CB6F898(v6, v6[3]);
  uint64_t v2 = sub_20CB6FE8C();
  uint64_t v4 = v3(v2);
  sub_20CB6C1F4((uint64_t)v6);
  return v4;
}

uint64_t sub_20CB6F138()
{
  sub_20CB6FE74(OBJC_IVAR____TtC12CloudKitCode16BoxedCKMergeable_mergeable);
  swift_beginAccess();
  sub_20CB6FB40(v0, *(void *)(v0 + 24));
  uint64_t v1 = sub_20CB6FE8C();
  v2(v1);
  return swift_endAccess();
}

uint64_t sub_20CB6F2CC()
{
  uint64_t v8 = 0x203A6465786F42;
  unint64_t v9 = 0xE700000000000000;
  uint64_t v1 = (void *)(v0 + OBJC_IVAR____TtC12CloudKitCode16BoxedCKMergeable_mergeable);
  sub_20CB6FE58();
  sub_20CB6F898(v1, v1[3]);
  sub_20CB6D4D0();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *))(v4 + 16))((char *)&v7 - v3);
  v5._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v5);
  swift_bridgeObjectRelease();
  return v8;
}

id BoxedCKMergeable.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void BoxedCKMergeable.init()()
{
}

id BoxedCKMergeable.__deallocating_deinit()
{
  return sub_20CB6F7C0(type metadata accessor for BoxedCKMergeable);
}

id BoxedCKVersionedMergeable.__allocating_init(_:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return BoxedCKVersionedMergeable.init(_:)(a1);
}

id BoxedCKVersionedMergeable.init(_:)(void *a1)
{
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[4];
  Swift::String v5 = sub_20CB6F898(a1, v3);
  v15[3] = v3;
  uint64_t v6 = *(void *)(v4 + 8);
  v15[4] = v6;
  uint64_t v7 = sub_20CB6FB90(v15);
  uint64_t v8 = *(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v3 - 8) + 16);
  uint64_t v9 = v8(v7, v5, v3);
  MEMORY[0x270FA5388](v9);
  sub_20CB6A8FC();
  uint64_t v12 = v11 - v10;
  v8((uint64_t *)(v11 - v10), v7, v3);
  id v13 = sub_20CB6F900(v12, v1, v3, v6);
  sub_20CB6C1F4((uint64_t)v15);
  sub_20CB6C1F4((uint64_t)a1);
  return v13;
}

uint64_t sub_20CB6F590()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC12CloudKitCode16BoxedCKMergeable_mergeable;
  sub_20CB6FE58();
  sub_20CB6FADC(v1, (uint64_t)v7);
  sub_20CB650D0((uint64_t *)&unk_2676F0D68);
  sub_20CB650D0(&qword_2676F0D40);
  sub_20CB6FEA4();
  sub_20CB6F898(v6, v6[3]);
  uint64_t v2 = sub_20CB6FF00();
  uint64_t v4 = v3(v2);
  sub_20CB6C1F4((uint64_t)v6);
  return v4;
}

uint64_t sub_20CB6F674()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC12CloudKitCode16BoxedCKMergeable_mergeable;
  sub_20CB6FE58();
  sub_20CB6FADC(v1, (uint64_t)v7);
  sub_20CB650D0((uint64_t *)&unk_2676F0D68);
  sub_20CB650D0(&qword_2676F0D40);
  sub_20CB6FEA4();
  sub_20CB6F898(v6, v6[3]);
  uint64_t v2 = sub_20CB6FF00();
  uint64_t v4 = v3(v2);
  sub_20CB6C1F4((uint64_t)v6);
  return v4;
}

void BoxedCKVersionedMergeable.__allocating_init(_:)()
{
}

void BoxedCKVersionedMergeable.init(_:)()
{
}

id BoxedCKVersionedMergeable.__deallocating_deinit()
{
  return sub_20CB6F7C0(type metadata accessor for BoxedCKVersionedMergeable);
}

id sub_20CB6F7C0(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_20CB6F7F8(uint64_t a1)
{
  uint64_t v2 = sub_20CB650D0((uint64_t *)&unk_2676F0D48);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_20CB6F858()
{
  unint64_t result = qword_2676F0D58;
  if (!qword_2676F0D58)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2676F0D58);
  }
  return result;
}

void *sub_20CB6F898(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t type metadata accessor for BoxedCKMergeable()
{
  return self;
}

id sub_20CB6F900(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v11[3] = a3;
  v11[4] = a4;
  uint64_t v7 = sub_20CB6FB90(v11);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 32))(v7, a1, a3);
  sub_20CB6FADC((uint64_t)v11, (uint64_t)a2 + OBJC_IVAR____TtC12CloudKitCode16BoxedCKMergeable_mergeable);
  v10.receiver = a2;
  v10.super_class = (Class)type metadata accessor for BoxedCKMergeable();
  id v8 = objc_msgSendSuper2(&v10, sel_init);
  sub_20CB6C1F4((uint64_t)v11);
  return v8;
}

id sub_20CB6F9B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = objc_allocWithZone((Class)type metadata accessor for BoxedCKMergeable());
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, a3);
  id v11 = sub_20CB6F900((uint64_t)v9, v10, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, a3);
  return v11;
}

uint64_t type metadata accessor for BoxedCKVersionedMergeable()
{
  return self;
}

uint64_t sub_20CB6FADC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_20CB6FB40(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t *sub_20CB6FB90(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_20CB6FBF4@<X0>(uint64_t a1@<X8>)
{
  return sub_20CB6EE10(a1);
}

uint64_t dispatch thunk of CKMergeable.mergeableDeltas(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of CKMergeable.merge(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of CKVersionedMergeable.stateVector.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of CKVersionedMergeable.deltaDeliveryRequirements.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t method lookup function for BoxedCKMergeable(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BoxedCKMergeable);
}

uint64_t dispatch thunk of BoxedCKMergeable.mergeable.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

uint64_t dispatch thunk of BoxedCKMergeable.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of BoxedCKMergeable.mergeableDeltas(for:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of BoxedCKMergeable.merge(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t method lookup function for BoxedCKVersionedMergeable(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BoxedCKVersionedMergeable);
}

uint64_t dispatch thunk of BoxedCKVersionedMergeable.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of BoxedCKVersionedMergeable.stateVector()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of BoxedCKVersionedMergeable.deltaDeliveryRequirements()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t sub_20CB6FE18(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void sub_20CB6FE30()
{
  JUMPOUT(0x210555EA0);
}

uint64_t sub_20CB6FE58()
{
  return swift_beginAccess();
}

uint64_t sub_20CB6FE74@<X0>(uint64_t a1@<X8>)
{
  return v1 + a1;
}

uint64_t sub_20CB6FE8C()
{
  return v0;
}

uint64_t sub_20CB6FEA4()
{
  return swift_dynamicCast();
}

uint64_t sub_20CB6FEDC()
{
  return swift_slowAlloc();
}

uint64_t sub_20CB6FEF4()
{
  return v0 - 136;
}

uint64_t sub_20CB6FF00()
{
  return v0;
}

void (*CKDeserializeRecordModificationsOperation.deserializeResultBlock.getter())(void *a1, uint64_t a2, char a3)
{
  uint64_t result = (void (*)(void *, uint64_t, char))objc_msgSend(v0, sel_deserializeCompletionBlock);
  if (result)
  {
    long long v2 = result;
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v2;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = sub_20CB70318;
    *(void *)(v4 + 24) = v3;
    return sub_20CB703B4;
  }
  return result;
}

uint64_t sub_20CB6FFC8@<X0>(uint64_t (**a1)(uint64_t a1)@<X8>)
{
  uint64_t result = (uint64_t)CKDeserializeRecordModificationsOperation.deserializeResultBlock.getter();
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = v3;
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v4;
    *(void *)(result + 24) = v5;
    uint64_t v6 = sub_20CB706DC;
  }
  else
  {
    uint64_t v6 = 0;
  }
  *a1 = v6;
  a1[1] = (uint64_t (*)(uint64_t))result;
  return result;
}

id sub_20CB70038(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  if (*a1)
  {
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v1;
    *(void *)(v3 + 24) = v2;
    uint64_t v4 = sub_20CB70664;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v3 = 0;
  }
  sub_20CB6B318(v1);
  return CKDeserializeRecordModificationsOperation.deserializeResultBlock.setter((uint64_t)v4, v3);
}

id CKDeserializeRecordModificationsOperation.deserializeResultBlock.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  if (a1)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = a1;
    *(void *)(v6 + 24) = a2;
    void v9[4] = sub_20CB70498;
    v9[5] = v6;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 1107296256;
    v9[2] = sub_20CB704A0;
    v9[3] = &unk_26C1C36A8;
    uint64_t v7 = _Block_copy(v9);
    swift_retain();
    swift_release();
    objc_msgSend(v3, sel_setDeserializeCompletionBlock_, v7);
    _Block_release(v7);
    return (id)sub_20CB6B280(a1);
  }
  else
  {
    return objc_msgSend(v2, sel_setDeserializeCompletionBlock_, 0);
  }
}

void sub_20CB701FC(objc_class *a1, Class a2, uint64_t a3, uint64_t a4)
{
  Class isa = a1;
  if (a1)
  {
    sub_20CB6CEE4(0, (unint64_t *)&unk_26ACC68E0);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
  }
  if (a2)
  {
    sub_20CB6CEE4(0, &qword_2676F14B0);
    a2 = Array._bridgeToObjectiveC()().super.isa;
  }
  if (a3) {
    uint64_t v8 = _convertErrorToNSError(_:)();
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = (id)v8;
  (*(void (**)(uint64_t, Class, Class))(a4 + 16))(a4, isa, a2);
}

uint64_t sub_20CB702E0()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_20CB70318(objc_class *a1, objc_class *a2, uint64_t a3)
{
  sub_20CB701FC(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_20CB70320(id a1, uint64_t a2, char a3, void (*a4)(id, uint64_t, id))
{
  if (a3)
  {
    id v7 = a1;
    a4(0, 0, a1);
    sub_20CB70710(a1, a2, 1);
  }
  else
  {
    a4(a1, a2, 0);
  }
}

void sub_20CB703B4(void *a1, uint64_t a2, char a3)
{
  sub_20CB70320(a1, a2, a3 & 1, *(void (**)(id, uint64_t, id))(v3 + 16));
}

void sub_20CB703C0(void *a1, uint64_t a2, id a3, void (*a4)(id, uint64_t, uint64_t))
{
  if (a3)
  {
    id v6 = a3;
    a4(a3, 0, 1);
  }
  else
  {
    if (a1) {
      id v7 = a1;
    }
    else {
      id v7 = (void *)MEMORY[0x263F8EE78];
    }
    if (a2) {
      uint64_t v8 = a2;
    }
    else {
      uint64_t v8 = MEMORY[0x263F8EE78];
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    a4(v7, v8, 0);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

void sub_20CB70498(void *a1, uint64_t a2, void *a3)
{
  sub_20CB703C0(a1, a2, a3, *(void (**)(id, uint64_t, uint64_t))(v3 + 16));
}

uint64_t sub_20CB704A0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = a2;
  id v7 = *(void (**)(uint64_t, uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_20CB6CEE4(0, (unint64_t *)&unk_26ACC68E0);
    uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  if (a3)
  {
    sub_20CB6CEE4(0, &qword_2676F14B0);
    a3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_retain();
  id v8 = a4;
  v7(v6, a3, a4);
  swift_release();

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20CB70580(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_20CB70590()
{
  return swift_release();
}

id (*CKDeserializeRecordModificationsOperation.deserializeResultBlock.modify(void (**a1)(void *a1, uint64_t a2, char a3)))(uint64_t *a1, char a2)
{
  a1[2] = v1;
  *a1 = CKDeserializeRecordModificationsOperation.deserializeResultBlock.getter();
  a1[1] = v3;
  return sub_20CB705E0;
}

id sub_20CB705E0(uint64_t *a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  if ((a2 & 1) == 0) {
    return CKDeserializeRecordModificationsOperation.deserializeResultBlock.setter(*a1, v3);
  }
  sub_20CB6B318(*a1);
  CKDeserializeRecordModificationsOperation.deserializeResultBlock.setter(v2, v3);
  return (id)sub_20CB6B280(v2);
}

uint64_t sub_20CB70664(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = *(uint64_t (**)(void *))(v3 + 16);
  v6[0] = a1;
  v6[1] = a2;
  char v7 = a3 & 1;
  return v4(v6);
}

uint64_t sub_20CB706A4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_20CB706DC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(v1 + 16))(*(void *)a1, *(void *)(a1 + 8), *(unsigned __int8 *)(a1 + 16));
}

void sub_20CB70710(void *a1, uint64_t a2, char a3)
{
  if (a3)
  {
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

uint64_t RemoteMeasurement.data.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_20CB64CA4(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t RemoteMeasurement.init(_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:)@<X0>(char a1@<W0>, char a2@<W1>, char a3@<W2>, char a4@<W3>, char a5@<W4>, char a6@<W5>, char a7@<W6>, char a8@<W7>, uint64_t *a9@<X8>, uint64_t a10, long long a11)
{
  sub_20CB650D0(&qword_26ACC68C8);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_20CB96E40;
  *(unsigned char *)(v17 + 32) = a1;
  *(unsigned char *)(v17 + 33) = a2;
  *(unsigned char *)(v17 + 34) = a3;
  *(unsigned char *)(v17 + 35) = a4;
  *(unsigned char *)(v17 + 36) = a5;
  *(unsigned char *)(v17 + 37) = a6;
  *(unsigned char *)(v17 + 38) = a7;
  *(unsigned char *)(v17 + 39) = a8;
  *(void *)(v17 + 40) = a10;
  *(_OWORD *)(v17 + 48) = a11;
  uint64_t result = sub_20CB70878(v17);
  *a9 = result;
  a9[1] = v19;
  return result;
}

uint64_t sub_20CB70878(uint64_t a1)
{
  uint64_t v9 = sub_20CB650D0(&qword_26ACC68B8);
  unint64_t v10 = sub_20CB70B30();
  v8[0] = a1;
  uint64_t v2 = sub_20CB6F898(v8, v9);
  uint64_t v3 = *v2 + 32;
  uint64_t v4 = v3 + *(void *)(*v2 + 16);
  swift_bridgeObjectRetain();
  sub_20CB70BCC(v3, v4, &v7);
  swift_bridgeObjectRelease();
  uint64_t v5 = v7;
  sub_20CB6C1F4((uint64_t)v8);
  return v5;
}

uint64_t RemoteMeasurement.init(data:)@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v4) = HIDWORD(result) - result;
      if (__OFSUB__(HIDWORD(result), result))
      {
        __break(1u);
LABEL_10:
        __break(1u);
        JUMPOUT(0x20CB709A8);
      }
      uint64_t v4 = (int)v4;
LABEL_6:
      if (v4 != 32)
      {
LABEL_7:
        sub_20CB64DC8(result, a2);
        uint64_t result = 0;
        a2 = 0xF000000000000000;
      }
      *a3 = result;
      a3[1] = a2;
      return result;
    case 2uLL:
      uint64_t v6 = *(void *)(result + 16);
      uint64_t v5 = *(void *)(result + 24);
      BOOL v7 = __OFSUB__(v5, v6);
      uint64_t v4 = v5 - v6;
      if (!v7) {
        goto LABEL_6;
      }
      goto LABEL_10;
    case 3uLL:
      goto LABEL_7;
    default:
      uint64_t v4 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for RemoteMeasurement(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  sub_20CB64CA4(*a2, v4);
  *a1 = v3;
  a1[1] = v4;
  return a1;
}

uint64_t destroy for RemoteMeasurement(uint64_t a1)
{
  return sub_20CB64DC8(*(void *)a1, *(void *)(a1 + 8));
}

uint64_t *assignWithCopy for RemoteMeasurement(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  sub_20CB64CA4(*a2, v4);
  uint64_t v5 = *a1;
  unint64_t v6 = a1[1];
  *a1 = v3;
  a1[1] = v4;
  sub_20CB64DC8(v5, v6);
  return a1;
}

uint64_t *assignWithTake for RemoteMeasurement(uint64_t *a1, _OWORD *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_20CB64DC8(v3, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for RemoteMeasurement(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xD && *(unsigned char *)(a1 + 16))
    {
      unsigned int v2 = *(_DWORD *)a1 + 12;
    }
    else
    {
      unsigned int v2 = (((*(void *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 8) >> 60) & 3))) ^ 0xF;
      if (v2 >= 0xC) {
        unsigned int v2 = -1;
      }
    }
  }
  else
  {
    unsigned int v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for RemoteMeasurement(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)uint64_t result = a2 - 13;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2)
    {
      *(void *)uint64_t result = 0;
      *(void *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RemoteMeasurement()
{
  return &type metadata for RemoteMeasurement;
}

unint64_t sub_20CB70B30()
{
  unint64_t result = qword_26ACC68C0;
  if (!qword_26ACC68C0)
  {
    sub_20CB70B84(&qword_26ACC68B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ACC68C0);
  }
  return result;
}

uint64_t sub_20CB70B84(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_20CB70BCC@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    uint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    uint64_t result = Data.InlineData.init(_:)();
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    uint64_t result = MEMORY[0x2105550F0]();
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    uint64_t result = MEMORY[0x210555100]();
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

id CKRecordChange.changeType.getter@<X0>(uint64_t a1@<X8>)
{
  id v3 = objc_msgSend(v1, sel_changeType);
  if (v3 == (id)3)
  {
    id result = 0;
    char v5 = 2;
    goto LABEL_9;
  }
  if (v3 == (id)2)
  {
    id result = objc_msgSend(v1, sel_record);
    if (result)
    {
      char v5 = 1;
LABEL_9:
      *(void *)a1 = result;
      *(unsigned char *)(a1 + 8) = v5;
      return result;
    }
  }
  else if (v3 == (id)1)
  {
    id result = objc_msgSend(v1, sel_record);
    if (result)
    {
      char v5 = 0;
      goto LABEL_9;
    }
  }
  id result = (id)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t CKRecordObserver.RecordChanges.Iterator.next()()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  uint64_t v2 = sub_20CB650D0(&qword_2676F0EA8);
  *uint64_t v1 = v0;
  v1[1] = sub_20CB70DF8;
  return MEMORY[0x270FA1F70](v0 + 16, v2);
}

uint64_t sub_20CB70DF8()
{
  sub_20CB6CF20();
  uint64_t v1 = *v0;
  sub_20CB722C0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_20CB72290, 0, 0);
}

uint64_t sub_20CB70EC8(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_20CB70F58;
  return CKRecordObserver.RecordChanges.Iterator.next()();
}

uint64_t sub_20CB70F58(uint64_t a1)
{
  sub_20CB6CF20();
  uint64_t v5 = v4;
  uint64_t v6 = *v2;
  sub_20CB722C0();
  *uint64_t v7 = v6;
  swift_task_dealloc();
  if (!v1) {
    **(void **)(v5 + 16) = a1;
  }
  uint64_t v8 = *(uint64_t (**)(void))(v6 + 8);
  return v8();
}

uint64_t sub_20CB7103C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v4[2] = a1;
  v4[3] = a4;
  uint64_t v7 = (uint64_t (__cdecl *)())((char *)&dword_2676F0F10 + dword_2676F0F10);
  uint64_t v5 = (void *)swift_task_alloc();
  v4[4] = v5;
  void *v5 = v4;
  v5[1] = sub_20CB710F8;
  return v7();
}

uint64_t sub_20CB710F8(uint64_t a1)
{
  sub_20CB6CF20();
  uint64_t v5 = v4;
  uint64_t v6 = *v2;
  sub_20CB722C0();
  *uint64_t v7 = v6;
  swift_task_dealloc();
  if (v1) {
    **(void **)(v5 + 24) = v1;
  }
  else {
    **(void **)(v5 + 16) = a1;
  }
  uint64_t v8 = *(uint64_t (**)(void))(v6 + 8);
  return v8();
}

uint64_t sub_20CB711F4()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  uint64_t v2 = sub_20CB650D0(&qword_2676F0EA8);
  *uint64_t v1 = v0;
  v1[1] = sub_20CB712A8;
  return MEMORY[0x270FA1F70](v0 + 16, v2);
}

uint64_t sub_20CB712A8()
{
  sub_20CB6CF20();
  uint64_t v1 = *v0;
  sub_20CB722C0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_20CB6C928, 0, 0);
}

uint64_t CKRecordObserver.RecordChanges.makeAsyncIterator()()
{
  uint64_t v0 = sub_20CB650D0(&qword_2676F0EB0);
  return MEMORY[0x270FA1F60](v0);
}

uint64_t sub_20CB713B8()
{
  CKRecordObserver.RecordChanges.makeAsyncIterator()();
  return sub_20CB71F74(v0);
}

id CKRecordObserver.init(container:recordType:)(void *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v6 = a1;
    uint64_t v7 = (void *)MEMORY[0x210555430](a2, a3);
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a1;
    uint64_t v7 = 0;
  }
  id v9 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithContainer_recordType_, a1, v7);

  return v9;
}

uint64_t CKRecordObserver.recordChanges.getter()
{
  uint64_t v1 = sub_20CB650D0(&qword_2676F0EB8);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v6[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = v0;
  sub_20CB6CEE4(0, qword_2676F0EC0);
  (*(void (**)(unsigned char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F8F580], v1);
  return AsyncStream.init(_:bufferingPolicy:_:)();
}

uint64_t sub_20CB71598(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_20CB650D0(&qword_2676F0F18);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&aBlock[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(a2, sel_copy);
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_20CB6CEE4(0, &qword_2676F0F20);
  swift_dynamicCast();
  id v8 = (void *)aBlock[6];
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  unint64_t v9 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v10 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v10 + v9, v7, v4);
  aBlock[4] = sub_20CB72150;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_20CB721C4;
  aBlock[3] = &unk_26C1C36D0;
  id v11 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v8, sel_registerWithBlock_, v11);
  _Block_release(v11);
  *(void *)(swift_allocObject() + 16) = v8;
  return AsyncStream.Continuation.onTermination.setter();
}

uint64_t sub_20CB717D8(uint64_t a1)
{
  return sub_20CB71598(a1, *(void **)(v1 + 16));
}

uint64_t sub_20CB717E0()
{
  return MEMORY[0x263F8E4E0];
}

unint64_t sub_20CB717F0()
{
  unint64_t result = qword_2676F0ED8;
  if (!qword_2676F0ED8)
  {
    type metadata accessor for CKRecordObserver.RecordChanges.Iterator(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2676F0ED8);
  }
  return result;
}

uint64_t type metadata accessor for CKRecordObserver.RecordChanges.Iterator(uint64_t a1)
{
  return sub_20CB65B7C(a1, (uint64_t *)&unk_2676F0EF8);
}

uint64_t _s10ChangeTypeOwCP(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  unsigned __int8 v4 = *(unsigned char *)(a2 + 8);
  sub_20CB718A8(*(id *)a2, v4);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return a1;
}

id sub_20CB718A8(id result, unsigned __int8 a2)
{
  if (a2 <= 1u) {
    return result;
  }
  return result;
}

void _s10ChangeTypeOwxx(uint64_t a1)
{
}

void sub_20CB718CC(id a1, unsigned __int8 a2)
{
  if (a2 <= 1u) {
}
  }

uint64_t _s10ChangeTypeOwca(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  unsigned __int8 v4 = *(unsigned char *)(a2 + 8);
  sub_20CB718A8(*(id *)a2, v4);
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = v3;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v4;
  sub_20CB718CC(v5, v6);
  return a1;
}

uint64_t _s10ChangeTypeOwtk(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t _s10ChangeTypeOwta(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  unsigned __int8 v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  unsigned __int8 v5 = *(unsigned char *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v3;
  sub_20CB718CC(v4, v5);
  return a1;
}

uint64_t _s10ChangeTypeOwet(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFE && *(unsigned char *)(a1 + 9))
    {
      int v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
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

uint64_t _s10ChangeTypeOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_20CB71A0C(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 1u) {
    return *(unsigned __int8 *)(a1 + 8);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_20CB71A24(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)unint64_t result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for CKRecordChange.ChangeType()
{
  return &type metadata for CKRecordChange.ChangeType;
}

uint64_t _s13RecordChangesVwCP(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20CB71B90(a1, a2, a3, &qword_2676F0EB0);
}

uint64_t _s13RecordChangesVwxx(uint64_t a1, uint64_t a2)
{
  return sub_20CB71BF4(a1, a2, &qword_2676F0EB0);
}

uint64_t _s13RecordChangesVwcp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20CB71C5C(a1, a2, a3, &qword_2676F0EB0);
}

uint64_t _s13RecordChangesVwca(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20CB71CB0(a1, a2, a3, &qword_2676F0EB0);
}

uint64_t _s13RecordChangesVwtk(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20CB71D04(a1, a2, a3, &qword_2676F0EB0);
}

uint64_t _s13RecordChangesVwta(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20CB71D58(a1, a2, a3, &qword_2676F0EB0);
}

uint64_t _s13RecordChangesVwet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20CB71AA8);
}

uint64_t sub_20CB71AA8()
{
  sub_20CB722E4();
  uint64_t v2 = sub_20CB650D0(&qword_2676F0EB0);
  return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(v1, v0, v2);
}

uint64_t _s13RecordChangesVwst(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20CB71B04);
}

uint64_t sub_20CB71B04()
{
  sub_20CB722E4();
  sub_20CB650D0(&qword_2676F0EB0);
  uint64_t v0 = sub_20CB722D0();
  return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v0, v1, v2, v3);
}

uint64_t type metadata accessor for CKRecordObserver.RecordChanges(uint64_t a1)
{
  return sub_20CB65B7C(a1, (uint64_t *)&unk_2676F0EE0);
}

void sub_20CB71B64(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t _s13RecordChangesV8IteratorVwCP(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20CB71B90(a1, a2, a3, &qword_2676F0EA8);
}

uint64_t sub_20CB71B90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  sub_20CB72294(a1, a2, a3, a4);
  sub_20CB6A86C();
  id v8 = *v7;
  return v8(v5, v4, v6);
}

uint64_t _s13RecordChangesV8IteratorVwxx(uint64_t a1, uint64_t a2)
{
  return sub_20CB71BF4(a1, a2, &qword_2676F0EA8);
}

uint64_t sub_20CB71BF4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_20CB650D0(a3);
  sub_20CB6A86C();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
  return v6(a1, v4);
}

uint64_t _s13RecordChangesV8IteratorVwcp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20CB71C5C(a1, a2, a3, &qword_2676F0EA8);
}

uint64_t sub_20CB71C5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  sub_20CB72294(a1, a2, a3, a4);
  sub_20CB6A86C();
  uint64_t v5 = sub_20CB722B0();
  v6(v5);
  return v4;
}

uint64_t _s13RecordChangesV8IteratorVwca(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20CB71CB0(a1, a2, a3, &qword_2676F0EA8);
}

uint64_t sub_20CB71CB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  sub_20CB72294(a1, a2, a3, a4);
  sub_20CB6A86C();
  uint64_t v5 = sub_20CB722B0();
  v6(v5);
  return v4;
}

uint64_t _s13RecordChangesV8IteratorVwtk(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20CB71D04(a1, a2, a3, &qword_2676F0EA8);
}

uint64_t sub_20CB71D04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  sub_20CB72294(a1, a2, a3, a4);
  sub_20CB6A86C();
  uint64_t v5 = sub_20CB722B0();
  v6(v5);
  return v4;
}

uint64_t _s13RecordChangesV8IteratorVwta(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20CB71D58(a1, a2, a3, &qword_2676F0EA8);
}

uint64_t sub_20CB71D58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  sub_20CB72294(a1, a2, a3, a4);
  sub_20CB6A86C();
  uint64_t v5 = sub_20CB722B0();
  v6(v5);
  return v4;
}

uint64_t _s13RecordChangesV8IteratorVwet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20CB71DB4);
}

uint64_t sub_20CB71DB4()
{
  sub_20CB722E4();
  uint64_t v2 = sub_20CB650D0(&qword_2676F0EA8);
  return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(v1, v0, v2);
}

uint64_t _s13RecordChangesV8IteratorVwst(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20CB71E10);
}

uint64_t sub_20CB71E10()
{
  sub_20CB722E4();
  sub_20CB650D0(&qword_2676F0EA8);
  uint64_t v0 = sub_20CB722D0();
  return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v0, v1, v2, v3);
}

void sub_20CB71E50(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_20CB71E70(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  sub_20CB71F04(319, a4, a5);
  if (v5 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_20CB71F04(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v6 = sub_20CB6CEE4(255, qword_2676F0EC0);
    unint64_t v7 = a3(a1, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_20CB71F74(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CKRecordObserver.RecordChanges(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20CB71FD0(void *a1)
{
  uint64_t v2 = sub_20CB650D0(&qword_2676F0F28);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unint64_t v5 = (char *)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8[1] = a1;
  id v6 = a1;
  sub_20CB650D0(&qword_2676F0F18);
  AsyncStream.Continuation.yield(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_20CB720C4()
{
  sub_20CB650D0(&qword_2676F0F18);
  sub_20CB6A86C();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_20CB72150(void *a1)
{
  sub_20CB650D0(&qword_2676F0F18);
  return sub_20CB71FD0(a1);
}

void sub_20CB721C4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_20CB7222C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_20CB7223C()
{
  return swift_release();
}

uint64_t sub_20CB72244()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_20CB7227C()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_invalidate);
}

uint64_t sub_20CB72294(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  return sub_20CB650D0(a4);
}

uint64_t sub_20CB722B0()
{
  return v0;
}

uint64_t sub_20CB722D0()
{
  return v0;
}

void CKDatabase.serialize(recordsToSave:recordIDsToDelete:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_20CB72308()
{
  sub_20CB733DC();
  sub_20CB6CEE4(0, &qword_2676F0F70);
  swift_bridgeObjectRetain();
  uint64_t v3 = swift_bridgeObjectRetain();
  id v12 = CKSerializeRecordModificationsOperation.init(recordsToSave:recordIDsToDelete:)(v3, v0);
  swift_retain();
  int v4 = CKSerializeRecordModificationsOperation.serializeResultBlock.setter(v2, v1);
  sub_20CB73438(v4, sel__scheduleConvenienceOperation_wrappingDatabase_convenienceConfiguration_, v5, v6, v7, v8, v9, v10, v11, (uint64_t)v12);
}

uint64_t CKDatabase.serializedModifications(recordsToSave:recordIDsToDelete:)(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return sub_20CB6CF38((uint64_t)sub_20CB723D8);
}

uint64_t sub_20CB723D8()
{
  sub_20CB73458();
  uint64_t v1 = (void *)v0[4];
  v0[5] = objc_msgSend(v1, sel_implementation);
  id v2 = objc_msgSend(v1, sel_container);
  v0[6] = objc_msgSend(v2, sel_convenienceConfiguration);

  uint64_t v3 = (void *)swift_task_alloc();
  v0[7] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_20CB724C8;
  uint64_t v4 = sub_20CB73408();
  return sub_20CB72648(v4, v5, v6, v7);
}

uint64_t sub_20CB724C8()
{
  sub_20CB73458();
  sub_20CB6CF20();
  uint64_t v3 = v2;
  sub_20CB6CF50();
  void *v4 = v3;
  uint64_t v5 = *v1;
  sub_20CB6CF50();
  *uint64_t v6 = v5;
  *(void *)(v3 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    sub_20CB733FC();
    return MEMORY[0x270FA2498](v7, v8, v9);
  }
  else
  {
    int v10 = *(void **)(v3 + 40);

    uint64_t v11 = sub_20CB73420();
    return v12(v11);
  }
}

uint64_t sub_20CB725E4()
{
  sub_20CB6CF44();
  uint64_t v1 = *(void **)(v0 + 40);

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_20CB72648(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[7] = a4;
  v5[8] = v4;
  v5[5] = a2;
  v5[6] = a3;
  v5[4] = a1;
  return sub_20CB6CF38((uint64_t)sub_20CB72668);
}

uint64_t sub_20CB72668()
{
  uint64_t v2 = *(void *)(v0 + 56);
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v4 = swift_task_alloc();
  *(void *)(v0 + 72) = v4;
  long long v5 = *(_OWORD *)(v0 + 32);
  *(void *)(v4 + 16) = v1;
  *(_OWORD *)(v4 + 24) = v5;
  *(void *)(v4 + 40) = v3;
  *(void *)(v4 + 48) = v2;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_20CB72778;
  sub_20CB733FC();
  return MEMORY[0x270FA2360](v7, v8, v9, 0xD000000000000055, v10, v11, v4, v12);
}

uint64_t sub_20CB72778()
{
  sub_20CB6CF44();
  sub_20CB6CF20();
  uint64_t v3 = v2;
  sub_20CB6CF50();
  void *v4 = v3;
  uint64_t v5 = *v1;
  sub_20CB6CF50();
  *uint64_t v6 = v5;
  *(void *)(v3 + 88) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_task_dealloc();
  }
  sub_20CB733FC();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

void CKDatabase.deserialize(serializedModifications:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_20CB7287C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, void *, id, uint64_t, uint64_t))
{
  id v11 = objc_msgSend(v5, sel_implementation);
  id v12 = objc_msgSend(v5, sel_container);
  id v13 = objc_msgSend(v12, sel_convenienceConfiguration);

  a5(a1, a2, v5, v13, a3, a4);
}

void sub_20CB7295C()
{
  sub_20CB733DC();
  sub_20CB6CEE4(0, &qword_2676F0F60);
  sub_20CB64CA4(v3, v0);
  id v12 = sub_20CB72F30(v3, v0);
  swift_retain();
  int v4 = CKDeserializeRecordModificationsOperation.deserializeResultBlock.setter(v2, v1);
  sub_20CB73438(v4, sel__scheduleConvenienceOperation_wrappingDatabase_convenienceConfiguration_, v5, v6, v7, v8, v9, v10, v11, (uint64_t)v12);
}

uint64_t CKDatabase.deserializedModifications(from:)(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return sub_20CB6CF38((uint64_t)sub_20CB72A2C);
}

uint64_t sub_20CB72A2C()
{
  sub_20CB73458();
  uint64_t v1 = (void *)v0[4];
  v0[5] = objc_msgSend(v1, sel_implementation);
  id v2 = objc_msgSend(v1, sel_container);
  v0[6] = objc_msgSend(v2, sel_convenienceConfiguration);

  uint64_t v3 = (void *)swift_task_alloc();
  v0[7] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_20CB72B1C;
  uint64_t v4 = sub_20CB73408();
  return sub_20CB72C38(v4, v5, v6, v7);
}

uint64_t sub_20CB72B1C()
{
  sub_20CB73458();
  sub_20CB6CF20();
  uint64_t v3 = v2;
  sub_20CB6CF50();
  void *v4 = v3;
  uint64_t v5 = *v1;
  sub_20CB6CF50();
  *uint64_t v6 = v5;
  *(void *)(v3 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    sub_20CB733FC();
    return MEMORY[0x270FA2498](v7, v8, v9);
  }
  else
  {
    int v10 = *(void **)(v3 + 40);

    uint64_t v11 = sub_20CB73420();
    return v12(v11);
  }
}

uint64_t sub_20CB72C38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[7] = a4;
  v5[8] = v4;
  v5[5] = a2;
  v5[6] = a3;
  v5[4] = a1;
  return sub_20CB6CF38((uint64_t)sub_20CB72C58);
}

uint64_t sub_20CB72C58()
{
  uint64_t v2 = *(void *)(v0 + 56);
  uint64_t v1 = *(void *)(v0 + 64);
  long long v13 = *(_OWORD *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v4 = swift_task_alloc();
  *(void *)(v0 + 72) = v4;
  *(void *)(v4 + 16) = v1;
  *(void *)(v4 + 24) = v3;
  *(_OWORD *)(v4 + 32) = v13;
  *(void *)(v4 + 48) = v2;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v5;
  sub_20CB650D0(&qword_2676F0F50);
  void *v5 = v0;
  v5[1] = sub_20CB72D78;
  sub_20CB733FC();
  return MEMORY[0x270FA2360](v6, v7, v8, 0xD00000000000004FLL, v9, v10, v4, v11);
}

uint64_t sub_20CB72D78()
{
  sub_20CB6CF44();
  sub_20CB6CF20();
  uint64_t v3 = v2;
  sub_20CB6CF50();
  void *v4 = v3;
  uint64_t v5 = *v1;
  sub_20CB6CF50();
  *uint64_t v6 = v5;
  *(void *)(v3 + 88) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_task_dealloc();
  }
  sub_20CB733FC();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_20CB72E60()
{
  sub_20CB6CF44();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_20CB72EC0(void *a1, unint64_t a2, char a3)
{
  if (a3)
  {
    id v4 = a1;
    sub_20CB650D0(&qword_2676F0F68);
    return CheckedContinuation.resume(throwing:)();
  }
  else
  {
    sub_20CB64CA4((uint64_t)a1, a2);
    sub_20CB650D0(&qword_2676F0F68);
    return CheckedContinuation.resume(returning:)();
  }
}

id sub_20CB72F30(uint64_t a1, unint64_t a2)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  id v6 = objc_msgSend(v4, sel_initWithSerializedModifications_, isa);
  sub_20CB64DC8(a1, a2);

  return v6;
}

uint64_t sub_20CB72FA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t *a7, uint64_t a8, uint64_t a9, void (*a10)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v21 = a2;
  uint64_t v22 = a6;
  uint64_t v20 = a5;
  uint64_t v13 = sub_20CB650D0(a7);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  MEMORY[0x270FA5388](v13);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))((char *)&v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v13);
  unint64_t v16 = (*(unsigned __int8 *)(v14 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v17 + v16, (char *)&v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v13);
  a10(a3, a4, v20, v22, a9, v17);
  return swift_release();
}

uint64_t sub_20CB73104(uint64_t a1)
{
  return sub_20CB73224(a1, &qword_2676F0F58, (uint64_t)&unk_26C1C3B40, (uint64_t)sub_20CB731C8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_20CB7295C);
}

uint64_t sub_20CB73140(void *a1, uint64_t a2, char a3)
{
  if (a3)
  {
    id v4 = a1;
    sub_20CB650D0(&qword_2676F0F58);
    return CheckedContinuation.resume(throwing:)();
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_20CB650D0(&qword_2676F0F58);
    return CheckedContinuation.resume(returning:)();
  }
}

uint64_t sub_20CB731BC()
{
  return sub_20CB73270(&qword_2676F0F58);
}

uint64_t sub_20CB731C8(uint64_t a1, uint64_t a2, char a3)
{
  return sub_20CB7331C(a1, a2, a3, &qword_2676F0F58, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_20CB73140);
}

uint64_t sub_20CB731E8(uint64_t a1)
{
  return sub_20CB73224(a1, &qword_2676F0F68, (uint64_t)&unk_26C1C3B68, (uint64_t)sub_20CB732FC, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_20CB72308);
}

uint64_t sub_20CB73224(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  return sub_20CB72FA8(a1, v5[2], v5[3], v5[4], v5[5], v5[6], a2, a3, a4, a5);
}

uint64_t sub_20CB73264()
{
  return sub_20CB73270(&qword_2676F0F68);
}

uint64_t sub_20CB73270(uint64_t *a1)
{
  uint64_t v2 = sub_20CB650D0(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v5 + *(void *)(v3 + 64);
  uint64_t v7 = v4 | 7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);
  return MEMORY[0x270FA0238](v1, v6, v7);
}

uint64_t sub_20CB732FC(uint64_t a1, uint64_t a2, char a3)
{
  return sub_20CB7331C(a1, a2, a3, &qword_2676F0F68, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_20CB72EC0);
}

uint64_t sub_20CB7331C(uint64_t a1, uint64_t a2, char a3, uint64_t *a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v8 = a3 & 1;
  uint64_t v9 = *(void *)(sub_20CB650D0(a4) - 8);
  uint64_t v10 = v5 + ((*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
  return a5(a1, a2, v8, v10);
}

uint64_t sub_20CB733C0()
{
  return (*(uint64_t (**)(void, void))(v0 + 8))(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_20CB73408()
{
  return *(void *)(v0 + 16);
}

uint64_t sub_20CB73420()
{
  return v0;
}

id sub_20CB73438(int a1, const char *a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  return objc_msgSend(v10, a2, a10, v12, v11);
}

id CKCodeService.databaseScope.getter()
{
  id v1 = objc_msgSend(v0, sel_implementation);
  id v2 = objc_msgSend(v1, sel_boxedDatabaseScope);

  if (!v2) {
    return 0;
  }
  id v3 = objc_msgSend(v2, sel_integerValue);

  return v3;
}

void CKCodeService.add<A, B>(_:)(void *a1)
{
  id v3 = objc_msgSend(v1, sel_implementation);
  id v4 = objc_msgSend(v1, sel_container);
  id v5 = objc_msgSend(v4, sel_convenienceConfiguration);

  sub_20CB73598(a1, v1, (uint64_t)v5);
}

id sub_20CB73598(void *a1, void *a2, uint64_t a3)
{
  id v4 = v3;
  id v8 = a2;
  sub_20CB866F8(a2);
  objc_msgSend(a1, sel_applyConvenienceConfiguration_, a3);
  return objc_msgSend(v4, sel__addPreparedOperation_, a1);
}

void *CKSerializeRecordModificationsOperation.init(recordsToSave:recordIDsToDelete:)(uint64_t a1, uint64_t a2)
{
  id v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  id v5 = v4;
  if (a1)
  {
    sub_20CB6CEE4(0, (unint64_t *)&unk_26ACC68E0);
    id v6 = v5;
    v7.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = v4;
    v7.super.Class isa = 0;
  }
  objc_msgSend(v5, sel_setRecordsToSave_, v7.super.isa);

  if (a2)
  {
    sub_20CB6CEE4(0, &qword_2676F14B0);
    v9.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.Class isa = 0;
  }
  objc_msgSend(v5, sel_setRecordIDsToDelete_, v9.super.isa);

  return v5;
}

id CKSerializeRecordModificationsOperation.serializeResultBlock.setter(uint64_t a1, uint64_t a2)
{
  id v3 = v2;
  if (a1)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = a1;
    *(void *)(v6 + 24) = a2;
    void v9[4] = sub_20CB73C04;
    v9[5] = v6;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 1107296256;
    v9[2] = sub_20CB73C0C;
    v9[3] = &unk_26C1C36F8;
    NSArray v7 = _Block_copy(v9);
    swift_retain();
    swift_release();
    objc_msgSend(v3, sel_setSerializeCompletionBlock_, v7);
    _Block_release(v7);
    return (id)sub_20CB6B280(a1);
  }
  else
  {
    return objc_msgSend(v2, sel_setSerializeCompletionBlock_, 0);
  }
}

void (*CKSerializeRecordModificationsOperation.serializeResultBlock.getter())(void *a1, unint64_t a2, char a3)
{
  unint64_t result = (void (*)(void *, unint64_t, char))objc_msgSend(v0, sel_serializeCompletionBlock);
  if (result)
  {
    id v2 = result;
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v2;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = sub_20CB73D08;
    *(void *)(v4 + 24) = v3;
    return sub_20CB73D10;
  }
  return result;
}

uint64_t sub_20CB738EC@<X0>(uint64_t (**a1)(uint64_t a1)@<X8>)
{
  uint64_t result = (uint64_t)CKSerializeRecordModificationsOperation.serializeResultBlock.getter();
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = v3;
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v4;
    *(void *)(result + 24) = v5;
    uint64_t v6 = sub_20CB706DC;
  }
  else
  {
    uint64_t v6 = 0;
  }
  *a1 = v6;
  a1[1] = (uint64_t (*)(uint64_t))result;
  return result;
}

id sub_20CB7395C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  if (*a1)
  {
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v1;
    *(void *)(v3 + 24) = v2;
    uint64_t v4 = sub_20CB70664;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v3 = 0;
  }
  sub_20CB6B318(v1);
  return CKSerializeRecordModificationsOperation.serializeResultBlock.setter((uint64_t)v4, v3);
}

void sub_20CB739EC(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 >> 60 == 15)
  {
    Class isa = 0;
    if (a3)
    {
LABEL_3:
      uint64_t v7 = _convertErrorToNSError(_:)();
      goto LABEL_6;
    }
  }
  else
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    if (a3) {
      goto LABEL_3;
    }
  }
  uint64_t v7 = 0;
LABEL_6:
  id v8 = (id)v7;
  (*(void (**)(uint64_t, Class))(a4 + 16))(a4, isa);
}

void sub_20CB73A84(void *a1, unint64_t a2, char a3, void (*a4)(void *, unint64_t, void *))
{
  if (a3)
  {
    id v8 = a1;
    NSArray v9 = 0;
    unint64_t v10 = 0xF000000000000000;
    uint64_t v11 = a1;
  }
  else
  {
    sub_20CB64CA4((uint64_t)a1, a2);
    NSArray v9 = a1;
    unint64_t v10 = a2;
    uint64_t v11 = 0;
  }
  a4(v9, v10, v11);
  sub_20CB73DE8(a1, a2, a3 & 1);
}

void sub_20CB73B14(uint64_t a1, unint64_t a2, id a3, void (*a4)(id, unint64_t, uint64_t))
{
  if (a3)
  {
    id v6 = a3;
    a4(a3, 0, 1);
  }
  else
  {
    if (a2 >> 60 == 15) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = a1;
    }
    if (a2 >> 60 == 15) {
      unint64_t v8 = 0xC000000000000000;
    }
    else {
      unint64_t v8 = a2;
    }
    sub_20CB64C90(a1, a2);
    a4((id)v7, v8, 0);
    sub_20CB64DC8(v7, v8);
  }
}

uint64_t sub_20CB73BCC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_20CB73C04(uint64_t a1, unint64_t a2, void *a3)
{
  sub_20CB73B14(a1, a2, a3, *(void (**)(id, unint64_t, uint64_t))(v3 + 16));
}

uint64_t sub_20CB73C0C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = *(void (**)(void *, unint64_t, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    id v6 = v4;
    uint64_t v4 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v8 = v7;
  }
  else
  {
    swift_retain();
    unint64_t v8 = 0xF000000000000000;
  }
  id v9 = a3;
  v5(v4, v8, a3);

  sub_20CB64DB4((uint64_t)v4, v8);
  return swift_release();
}

uint64_t sub_20CB73CB8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_20CB73CC8()
{
  return swift_release();
}

uint64_t sub_20CB73CD0()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_20CB73D08(uint64_t a1, unint64_t a2, uint64_t a3)
{
  sub_20CB739EC(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_20CB73D10(void *a1, unint64_t a2, char a3)
{
  sub_20CB73A84(a1, a2, a3 & 1, *(void (**)(void *, unint64_t, void *))(v3 + 16));
}

id (*CKSerializeRecordModificationsOperation.serializeResultBlock.modify(void (**a1)(void *a1, unint64_t a2, char a3)))(uint64_t *a1, char a2)
{
  a1[2] = v1;
  *a1 = CKSerializeRecordModificationsOperation.serializeResultBlock.getter();
  a1[1] = v3;
  return sub_20CB73D64;
}

id sub_20CB73D64(uint64_t *a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  if ((a2 & 1) == 0) {
    return CKSerializeRecordModificationsOperation.serializeResultBlock.setter(*a1, v3);
  }
  sub_20CB6B318(*a1);
  CKSerializeRecordModificationsOperation.serializeResultBlock.setter(v2, v3);
  return (id)sub_20CB6B280(v2);
}

void sub_20CB73DE8(id a1, unint64_t a2, char a3)
{
  if (a3) {

  }
  else {
    sub_20CB64DC8((uint64_t)a1, a2);
  }
}

uint64_t Message.substituteMessages<A>(substitutionType:substitutions:)@<X0>(void *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, char *a6@<X8>)
{
  uint64_t v84 = a2;
  uint64_t v7 = v6;
  uint64_t v81 = a1;
  v74 = a6;
  uint64_t v75 = a5;
  uint64_t v85 = a3;
  uint64_t v86 = a4;
  uint64_t v77 = a4;
  uint64_t v87 = a5;
  type metadata accessor for SubstitutingVisitor();
  sub_20CB6D4D0();
  uint64_t v78 = v11;
  uint64_t v79 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v82 = (uint64_t)&v67 - v12;
  type metadata accessor for Optional();
  sub_20CB6D4D0();
  uint64_t v72 = v14;
  uint64_t v73 = v13;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  id v71 = (char *)&v67 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  id v70 = (char *)&v67 - v17;
  sub_20CB6D4D0();
  uint64_t v19 = v18;
  uint64_t v21 = *(void *)(v20 + 64);
  uint64_t v23 = MEMORY[0x270FA5388](v22);
  id v68 = (char *)&v67 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x270FA5388](v23);
  uint64_t v69 = (char *)&v67 - v25;
  MEMORY[0x270FA5388](v24);
  int v27 = (char *)&v67 - v26;
  sub_20CB6D4D0();
  uint64_t v29 = v28;
  uint64_t v31 = MEMORY[0x270FA5388](v30);
  uint64_t v33 = (char *)&v67 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v31);
  uint64_t v35 = *(void (**)(char *, uint64_t, uint64_t))(v29 + 16);
  uint64_t v34 = v29 + 16;
  uint64_t v76 = v7;
  v80 = v35;
  v35((char *)&v67 - v36, v7, a2);
  if (!swift_dynamicCast())
  {
    uint64_t v67 = v19;
    uint64_t v40 = swift_allocObject();
    uint64_t v41 = v81;
    swift_bridgeObjectRetain();
    uint64_t v42 = Array.startIndex.getter();
    *(void *)(v40 + 16) = v41;
    id v70 = (char *)(v40 + 16);
    *(void *)(v40 + 24) = v42;
    uint64_t v81 = (void *)(v40 + 24);
    v80(v33, v76, a2);
    uint64_t v43 = (void *)swift_allocObject();
    v43[2] = a2;
    v43[3] = a3;
    uint64_t v44 = v75;
    v43[4] = v77;
    v43[5] = v44;
    v43[6] = v40;
    uint64_t v69 = (char *)a3;
    sub_20CB936BC((uint64_t)v33, (uint64_t)sub_20CB74744, (uint64_t)v43, a2, v82);
    swift_retain();
    uint64_t v45 = v79;
    swift_getWitnessTable();
    uint64_t v46 = v83;
    dispatch thunk of Message.traverse<A>(visitor:)();
    if (v46)
    {
      (*(void (**)(uint64_t, uint64_t))(v78 + 8))(v82, v45);
    }
    else
    {
      uint64_t v76 = a2;
      uint64_t v77 = v34;
      uint64_t v47 = (uint64_t *)v70;
      swift_beginAccess();
      id v48 = v81;
      uint64_t v49 = *v81;
      uint64_t v50 = (uint64_t)v69;
      if (v49 == MEMORY[0x210555540](*v47, v69))
      {
        uint64_t v51 = 1;
        uint64_t v52 = (uint64_t)v71;
      }
      else
      {
        uint64_t v83 = 0;
        uint64_t v56 = *v48;
        id v57 = v47;
        uint64_t v58 = *v47;
        Swift::Bool IsNativeType = Array._hoistableIsNativeTypeChecked()();
        Array._checkSubscript(_:wasNativeTypeChecked:)();
        if (IsNativeType)
        {
          uint64_t v60 = v67;
          unint64_t v61 = v68;
          (*(void (**)(char *, unint64_t, uint64_t))(v67 + 16))(v68, v58+ ((*(unsigned __int8 *)(v67 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v67 + 80))+ *(void *)(v67 + 72) * v56, v50);
        }
        else
        {
          uint64_t result = _ArrayBuffer._getElementSlowPath(_:)();
          if (v21 != 8)
          {
LABEL_25:
            __break(1u);
            return result;
          }
          uint64_t v88 = result;
          uint64_t v60 = v67;
          unint64_t v61 = v68;
          (*(void (**)(char *, uint64_t *, uint64_t))(v67 + 16))(v68, &v88, v50);
          swift_unknownObjectRelease();
        }
        uint64_t v52 = (uint64_t)v71;
        (*(void (**)(char *, char *, uint64_t))(v60 + 32))(v71, v61, v50);
        uint64_t v62 = *v57;
        swift_bridgeObjectRetain();
        MEMORY[0x210555550](v48, v62, v50);
        swift_bridgeObjectRelease();
        uint64_t v51 = 0;
        uint64_t v45 = v79;
      }
      _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v52, v51, 1, v50);
      swift_endAccess();
      int v63 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(v52, 1, v50);
      (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v52, v73);
      BOOL v64 = v63 == 1;
      uint64_t v65 = v82;
      if (v64)
      {
        v80(v74, v82, v76);
      }
      else
      {
        sub_20CB74754();
        swift_allocError();
        *uint64_t v66 = 1;
        swift_willThrow();
      }
      (*(void (**)(uint64_t, uint64_t))(v78 + 8))(v65, v45);
    }
    return swift_release();
  }
  (*(void (**)(char *, uint64_t))(v19 + 8))(v27, a3);
  uint64_t v37 = v81;
  uint64_t v38 = MEMORY[0x210555520](v81, a3);
  if (v38 == 1)
  {
    uint64_t v84 = (uint64_t)v37;
    type metadata accessor for Array();
    swift_getWitnessTable();
    uint64_t v53 = (uint64_t)v70;
    Collection.first.getter();
    uint64_t result = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(v53, 1, a3);
    if (result != 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v19 + 32))(v69, v53, a3);
      return swift_dynamicCast();
    }
    __break(1u);
    goto LABEL_25;
  }
  if (v38)
  {
    sub_20CB74754();
    swift_allocError();
    *id v55 = 1;
  }
  else
  {
    sub_20CB74754();
    swift_allocError();
    *char v39 = 0;
  }
  return swift_willThrow();
}

uint64_t sub_20CB74504()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_20CB7453C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6 = (uint64_t *)(a1 + 16);
  swift_beginAccess();
  uint64_t v7 = (uint64_t *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 24);
  if (v8 == MEMORY[0x210555540](*(void *)(a1 + 16), a2))
  {
    uint64_t v9 = a3;
    uint64_t v10 = 1;
LABEL_6:
    _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v9, v10, 1, a2);
    return swift_endAccess();
  }
  uint64_t v11 = *v7;
  uint64_t v12 = *v6;
  Swift::Bool IsNativeType = Array._hoistableIsNativeTypeChecked()();
  Array._checkSubscript(_:wasNativeTypeChecked:)();
  if (IsNativeType)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, v12+ ((*(unsigned __int8 *)(*(void *)(a2 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(a2 - 8) + 80))+ *(void *)(*(void *)(a2 - 8) + 72) * v11, a2);
LABEL_5:
    uint64_t v14 = *v6;
    swift_bridgeObjectRetain();
    MEMORY[0x210555550](v7, v14, a2);
    swift_bridgeObjectRelease();
    uint64_t v9 = a3;
    uint64_t v10 = 0;
    goto LABEL_6;
  }
  uint64_t result = _ArrayBuffer._getElementSlowPath(_:)();
  uint64_t v16 = *(void *)(a2 - 8);
  if (*(void *)(v16 + 64) == 8)
  {
    uint64_t v17 = result;
    (*(void (**)(uint64_t, uint64_t *, uint64_t))(v16 + 16))(a3, &v17, a2);
    swift_unknownObjectRelease();
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t sub_20CB7470C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_20CB74744@<X0>(uint64_t a1@<X8>)
{
  return sub_20CB7453C(*(void *)(v1 + 48), *(void *)(v1 + 24), a1);
}

unint64_t sub_20CB74754()
{
  unint64_t result = qword_2676F0F78;
  if (!qword_2676F0F78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2676F0F78);
  }
  return result;
}

uint64_t Ckcode_ProtectedEnvelope.contents.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20CB77DA4(v1, a1, (uint64_t *)&unk_26ACC7170);
}

uint64_t Ckcode_ProtectedEnvelope.contents.setter(uint64_t a1)
{
  return sub_20CB747D0(a1, v1);
}

uint64_t sub_20CB747D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_20CB650D0((uint64_t *)&unk_26ACC7170);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*Ckcode_ProtectedEnvelope.contents.modify())(void)
{
  return nullsub_1;
}

uint64_t Ckcode_ProtectedEnvelope.encrypted.getter()
{
  uint64_t v1 = sub_20CB650D0((uint64_t *)&unk_26ACC7170);
  uint64_t v2 = sub_20CB6A8A4(v1);
  MEMORY[0x270FA5388](v2);
  sub_20CB6A924();
  uint64_t v3 = sub_20CB6A898();
  sub_20CB77DA4(v3, v4, (uint64_t *)&unk_26ACC7170);
  uint64_t v5 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
  sub_20CB6AA88(v0, 1, v5);
  if (v6)
  {
    sub_20CB6A3C4(v0, (uint64_t *)&unk_26ACC7170);
    return 0;
  }
  sub_20CB6A8B0();
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    sub_20CB74940(v0);
    return 0;
  }
  return *(void *)v0;
}

uint64_t type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(uint64_t a1)
{
  return sub_20CB65B7C(a1, qword_26ACC7158);
}

uint64_t sub_20CB74940(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20CB7499C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = a1[1];
  sub_20CB64CA4(*a1, v2);
  return Ckcode_ProtectedEnvelope.encrypted.setter(v1, v2);
}

uint64_t Ckcode_ProtectedEnvelope.encrypted.setter(uint64_t a1, uint64_t a2)
{
  sub_20CB6A3C4((uint64_t)v2, (uint64_t *)&unk_26ACC7170);
  *unint64_t v2 = a1;
  v2[1] = a2;
  type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
  sub_20CB6A898();
  swift_storeEnumTagMultiPayload();
  uint64_t v5 = sub_20CB6A984();
  return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v5, v6, v7, v8);
}

void (*Ckcode_ProtectedEnvelope.encrypted.modify(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v2 = v1;
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  id v4[2] = v2;
  uint64_t v5 = sub_20CB650D0((uint64_t *)&unk_26ACC7170);
  sub_20CB6A8A4(v5);
  uint64_t v7 = (long long *)malloc(*(void *)(v6 + 64));
  v4[3] = v7;
  sub_20CB77DA4(v2, (uint64_t)v7, (uint64_t *)&unk_26ACC7170);
  uint64_t v8 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
  v4[4] = v8;
  sub_20CB6AA88((uint64_t)v7, 1, v8);
  if (v9)
  {
    sub_20CB6A3C4((uint64_t)v7, (uint64_t *)&unk_26ACC7170);
  }
  else
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload != 1)
    {
      long long v11 = *v7;
      goto LABEL_8;
    }
    sub_20CB74940((uint64_t)v7);
  }
  long long v11 = xmmword_20CB96480;
LABEL_8:
  *(_OWORD *)uint64_t v4 = v11;
  return sub_20CB74B54;
}

void sub_20CB74B54(uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a1)[3];
  uint64_t v4 = (*a1)[2];
  if (a2)
  {
    sub_20CB64CA4(**a1, (*a1)[1]);
    sub_20CB6A3C4(v4, (uint64_t *)&unk_26ACC7170);
    sub_20CB6A9AC();
    sub_20CB6AA14();
    sub_20CB64DC8(*v2, v2[1]);
  }
  else
  {
    sub_20CB6A3C4((*a1)[2], (uint64_t *)&unk_26ACC7170);
    sub_20CB6A9AC();
    sub_20CB6AA14();
  }
  free(v3);
  free(v2);
}

uint64_t Ckcode_ProtectedEnvelope.value.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_20CB650D0((uint64_t *)&unk_26ACC7170);
  uint64_t v5 = sub_20CB6A8A4(v4);
  MEMORY[0x270FA5388](v5);
  sub_20CB6A8FC();
  uint64_t v8 = v7 - v6;
  sub_20CB77DA4(v2, v7 - v6, (uint64_t *)&unk_26ACC7170);
  uint64_t v9 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
  sub_20CB6AA88(v8, 1, v9);
  if (v10)
  {
    sub_20CB6A3C4(v8, (uint64_t *)&unk_26ACC7170);
  }
  else
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      type metadata accessor for Google_Protobuf_Any();
      sub_20CB6A86C();
      return (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 32))(a1, v8);
    }
    sub_20CB74940(v8);
  }
  return Google_Protobuf_Any.init()();
}

uint64_t sub_20CB74D08(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Google_Protobuf_Any();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return Ckcode_ProtectedEnvelope.value.setter();
}

uint64_t Ckcode_ProtectedEnvelope.value.setter()
{
  sub_20CB6A3C4(v0, (uint64_t *)&unk_26ACC7170);
  type metadata accessor for Google_Protobuf_Any();
  sub_20CB6A86C();
  uint64_t v1 = sub_20CB6A898();
  v2(v1);
  type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
  sub_20CB6A898();
  swift_storeEnumTagMultiPayload();
  uint64_t v3 = sub_20CB6A984();
  return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v3, v4, v5, v6);
}

void (*Ckcode_ProtectedEnvelope.value.modify(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v2 = v1;
  uint64_t v4 = malloc(0x38uLL);
  *a1 = v4;
  void *v4 = v1;
  uint64_t v5 = sub_20CB650D0((uint64_t *)&unk_26ACC7170);
  sub_20CB6A8A4(v5);
  uint64_t v7 = malloc(*(void *)(v6 + 64));
  v4[1] = v7;
  uint64_t v8 = type metadata accessor for Google_Protobuf_Any();
  id v4[2] = v8;
  sub_20CB6A87C();
  uint64_t v10 = v9;
  v4[3] = v9;
  size_t v12 = *(void *)(v11 + 64);
  v4[4] = malloc(v12);
  uint64_t v13 = malloc(v12);
  v4[5] = v13;
  sub_20CB77DA4(v2, (uint64_t)v7, (uint64_t *)&unk_26ACC7170);
  uint64_t v14 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
  v4[6] = v14;
  sub_20CB6AA88((uint64_t)v7, 1, v14);
  if (v15)
  {
    sub_20CB6A3C4((uint64_t)v7, (uint64_t *)&unk_26ACC7170);
LABEL_7:
    Google_Protobuf_Any.init()();
    return sub_20CB74FCC;
  }
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload != 1)
  {
    sub_20CB74940((uint64_t)v7);
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 32))(v13, v7, v8);
  return sub_20CB74FCC;
}

void sub_20CB74FCC(uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a1)[5];
  uint64_t v5 = (*a1)[3];
  uint64_t v4 = (void *)(*a1)[4];
  uint64_t v6 = (void *)(*a1)[1];
  uint64_t v7 = (*a1)[2];
  uint64_t v8 = **a1;
  if (a2)
  {
    (*(void (**)(uint64_t, void *, uint64_t))(v5 + 16))((*a1)[4], v3, v7);
    sub_20CB6A3C4(v8, (uint64_t *)&unk_26ACC7170);
    (*(void (**)(uint64_t, void *, uint64_t))(v5 + 32))(v8, v4, v7);
    swift_storeEnumTagMultiPayload();
    sub_20CB77E00();
    (*(void (**)(void *, uint64_t))(v5 + 8))(v3, v7);
  }
  else
  {
    sub_20CB6A3C4(**a1, (uint64_t *)&unk_26ACC7170);
    (*(void (**)(uint64_t, void *, uint64_t))(v5 + 32))(v8, v3, v7);
    swift_storeEnumTagMultiPayload();
    sub_20CB77E00();
  }
  free(v3);
  free(v4);
  free(v6);
  free(v2);
}

uint64_t Ckcode_ProtectedEnvelope.unknownFields.getter()
{
  type metadata accessor for Ckcode_ProtectedEnvelope(0);
  type metadata accessor for UnknownStorage();
  sub_20CB6A86C();
  uint64_t v0 = sub_20CB6A8B0();
  return v1(v0);
}

uint64_t type metadata accessor for Ckcode_ProtectedEnvelope(uint64_t a1)
{
  return sub_20CB65B7C(a1, (uint64_t *)&unk_26ACC7190);
}

uint64_t Ckcode_ProtectedEnvelope.unknownFields.setter()
{
  type metadata accessor for Ckcode_ProtectedEnvelope(0);
  type metadata accessor for UnknownStorage();
  sub_20CB6A86C();
  uint64_t v0 = sub_20CB6A898();
  return v1(v0);
}

uint64_t (*Ckcode_ProtectedEnvelope.unknownFields.modify())(void)
{
  return nullsub_1;
}

uint64_t static Ckcode_ProtectedEnvelope.OneOf_Contents.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for Google_Protobuf_Any();
  sub_20CB6A87C();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  sub_20CB6A8FC();
  uint64_t v11 = v10 - v9;
  type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
  sub_20CB6A86C();
  MEMORY[0x270FA5388](v12);
  sub_20CB6A8BC();
  uint64_t v15 = v13 - v14;
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (uint64_t *)((char *)&v30 - v17);
  uint64_t v19 = sub_20CB650D0(&qword_2676F0FB8);
  uint64_t v20 = sub_20CB6A8A4(v19);
  MEMORY[0x270FA5388](v20);
  sub_20CB6A924();
  uint64_t v22 = (uint64_t *)(v2 + *(int *)(v21 + 56));
  sub_20CB754BC(a1, v2);
  sub_20CB754BC(a2, (uint64_t)v22);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_20CB754BC(v2, v15);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      (*(void (**)(uint64_t, uint64_t *, uint64_t))(v7 + 32))(v11, v22, v5);
      char v23 = static Google_Protobuf_Any.== infix(_:_:)();
      uint64_t v24 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
      v24(v11, v5);
      v24(v15, v5);
LABEL_9:
      sub_20CB74940(v2);
      return v23 & 1;
    }
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v15, v5);
  }
  else
  {
    sub_20CB754BC(v2, (uint64_t)v18);
    uint64_t v25 = *v18;
    unint64_t v26 = v18[1];
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      uint64_t v27 = *v22;
      unint64_t v28 = v22[1];
      char v23 = MEMORY[0x210555120](v25, v26, *v22, v28);
      sub_20CB64DC8(v27, v28);
      sub_20CB64DC8(v25, v26);
      goto LABEL_9;
    }
    sub_20CB64DC8(v25, v26);
  }
  sub_20CB6A3C4(v2, &qword_2676F0FB8);
  char v23 = 0;
  return v23 & 1;
}

uint64_t sub_20CB754BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t Ckcode_ProtectedEnvelope.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(a1, 1, 1, v2);
  type metadata accessor for Ckcode_ProtectedEnvelope(0);
  return UnknownStorage.init()();
}

void sub_20CB75574()
{
  qword_2676F0F80 = 0x65646F636B63;
  *(void *)algn_2676F0F88 = 0xE600000000000000;
}

uint64_t sub_20CB75594()
{
  if (qword_2676F0BB8 != -1) {
    uint64_t result = swift_once();
  }
  qword_2676F0F90 = 0xD000000000000018;
  *(void *)algn_2676F0F98 = 0x800000020CB9AB80;
  return result;
}

uint64_t static Ckcode_ProtectedEnvelope.protoMessageName.getter()
{
  if (qword_2676F0BC0 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return sub_20CB6A8B0();
}

uint64_t sub_20CB75660()
{
  uint64_t v0 = type metadata accessor for _NameMap();
  sub_20CB6A468(v0, qword_2676F0FA0);
  sub_20CB683E4(v0, (uint64_t)qword_2676F0FA0);
  sub_20CB650D0(&qword_2676F0CA0);
  uint64_t v1 = (int *)(sub_20CB650D0(&qword_2676F0CA8) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_20CB96490;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  void *v5 = 1;
  *(void *)unint64_t v6 = "encrypted";
  *(void *)(v6 + 8) = 9;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = type metadata accessor for _NameMap.NameDescription();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)uint64_t v10 = "value";
  *((void *)v10 + 1) = 5;
  v10[16] = 2;
  v9();
  return _NameMap.init(dictionaryLiteral:)();
}

uint64_t static Ckcode_ProtectedEnvelope._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_2676F0BC8 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for _NameMap();
  uint64_t v3 = sub_20CB683E4(v2, (uint64_t)qword_2676F0FA0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t Ckcode_ProtectedEnvelope.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  while (1)
  {
    uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
    if (v3 || (v7 & 1) != 0) {
      break;
    }
    if (result == 2)
    {
      uint64_t v10 = sub_20CB6A8B0();
      sub_20CB75B04(v10, v11, a2, a3);
    }
    else if (result == 1)
    {
      uint64_t v8 = sub_20CB6A898();
      sub_20CB75950(v8, v9);
    }
  }
  return result;
}

uint64_t sub_20CB75950(uint64_t a1, long long *a2)
{
  uint64_t v4 = sub_20CB650D0((uint64_t *)&unk_26ACC7170);
  MEMORY[0x270FA5388](v4 - 8);
  unint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v11 = xmmword_20CB96470;
  uint64_t result = dispatch thunk of Decoder.decodeSingularBytesField(value:)();
  long long v8 = v11;
  if (v2) {
    return sub_20CB64DB4(v11, *((unint64_t *)&v11 + 1));
  }
  if (*((void *)&v11 + 1) >> 60 != 15)
  {
    sub_20CB77DA4((uint64_t)a2, (uint64_t)v6, (uint64_t *)&unk_26ACC7170);
    uint64_t v12 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
    int v9 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)v6, 1, v12);
    sub_20CB64CA4(v8, *((unint64_t *)&v8 + 1));
    sub_20CB6A3C4((uint64_t)v6, (uint64_t *)&unk_26ACC7170);
    if (v9 != 1) {
      dispatch thunk of Decoder.handleConflictingOneOf()();
    }
    sub_20CB64DB4(v8, *((unint64_t *)&v8 + 1));
    sub_20CB6A3C4((uint64_t)a2, (uint64_t *)&unk_26ACC7170);
    *a2 = v8;
    uint64_t v10 = v12;
    swift_storeEnumTagMultiPayload();
    return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)a2, 0, 1, v10);
  }
  return result;
}

uint64_t sub_20CB75B04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v39 = a4;
  uint64_t v41 = a3;
  uint64_t v40 = a2;
  uint64_t v5 = type metadata accessor for Google_Protobuf_Any();
  uint64_t v37 = *(void *)(v5 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v36 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  int v9 = (char *)&v33 - v8;
  uint64_t v10 = sub_20CB650D0((uint64_t *)&unk_26ACC7170);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v33 - v17;
  uint64_t v19 = sub_20CB650D0(&qword_2676F0FE0);
  uint64_t v20 = MEMORY[0x270FA5388](v19 - 8);
  uint64_t v22 = (char *)&v33 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v33 - v23;
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)&v33 - v23, 1, 1, v5);
  uint64_t v35 = a1;
  sub_20CB77DA4(a1, (uint64_t)v12, (uint64_t *)&unk_26ACC7170);
  int v25 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)v12, 1, v13);
  uint64_t v34 = v13;
  if (v25 == 1)
  {
    sub_20CB6A3C4((uint64_t)v12, (uint64_t *)&unk_26ACC7170);
  }
  else
  {
    sub_20CB76804((uint64_t)v12, (uint64_t)v18);
    sub_20CB76804((uint64_t)v18, (uint64_t)v16);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_20CB6A3C4((uint64_t)v24, &qword_2676F0FE0);
      unint64_t v26 = *(void (**)(char *, char *, uint64_t))(v37 + 32);
      v26(v9, v16, v5);
      v26(v24, v9, v5);
      _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)v24, 0, 1, v5);
    }
    else
    {
      sub_20CB74940((uint64_t)v16);
    }
  }
  uint64_t v27 = v38;
  sub_20CB76A9C(&qword_26ACC68B0, MEMORY[0x263F50478]);
  dispatch thunk of Decoder.decodeSingularMessageField<A>(value:)();
  if (v27)
  {
    uint64_t v28 = (uint64_t)v24;
    return sub_20CB6A3C4(v28, &qword_2676F0FE0);
  }
  sub_20CB77DA4((uint64_t)v24, (uint64_t)v22, &qword_2676F0FE0);
  if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)v22, 1, v5) == 1)
  {
    sub_20CB6A3C4((uint64_t)v24, &qword_2676F0FE0);
    uint64_t v28 = (uint64_t)v22;
    return sub_20CB6A3C4(v28, &qword_2676F0FE0);
  }
  uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v37 + 32);
  v30(v36, v22, v5);
  if (v25 != 1) {
    dispatch thunk of Decoder.handleConflictingOneOf()();
  }
  sub_20CB6A3C4((uint64_t)v24, &qword_2676F0FE0);
  uint64_t v31 = v35;
  sub_20CB6A3C4(v35, (uint64_t *)&unk_26ACC7170);
  v30((char *)v31, v36, v5);
  uint64_t v32 = v34;
  swift_storeEnumTagMultiPayload();
  return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v31, 0, 1, v32);
}

uint64_t Ckcode_ProtectedEnvelope.traverse<A>(visitor:)()
{
  uint64_t v2 = sub_20CB650D0((uint64_t *)&unk_26ACC7170);
  uint64_t v3 = sub_20CB6A8A4(v2);
  MEMORY[0x270FA5388](v3);
  sub_20CB6A8FC();
  uint64_t v6 = v5 - v4;
  sub_20CB77DA4(v0, v5 - v4, (uint64_t *)&unk_26ACC7170);
  uint64_t v7 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
  if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(v6, 1, v7) == 1) {
    goto LABEL_2;
  }
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_20CB6A96C();
    sub_20CB761F8(v9, v10, v11, v12);
    uint64_t result = sub_20CB74940(v6);
    if (!v1)
    {
LABEL_2:
      type metadata accessor for Ckcode_ProtectedEnvelope(0);
      return UnknownStorage.traverse<A>(visitor:)();
    }
  }
  else
  {
    sub_20CB74940(v6);
    uint64_t v13 = sub_20CB6A96C();
    uint64_t result = sub_20CB760C4(v13);
    if (!v1) {
      goto LABEL_2;
    }
  }
  return result;
}

uint64_t sub_20CB760C4(uint64_t a1)
{
  uint64_t v2 = sub_20CB650D0((uint64_t *)&unk_26ACC7170);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (uint64_t *)((char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_20CB77DA4(a1, (uint64_t)v4, (uint64_t *)&unk_26ACC7170);
  uint64_t v5 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
  if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)v4, 1, v5) == 1)
  {
    uint64_t result = sub_20CB6A3C4((uint64_t)v4, (uint64_t *)&unk_26ACC7170);
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      uint64_t v7 = *v4;
      unint64_t v6 = v4[1];
      dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)();
      return sub_20CB64DC8(v7, v6);
    }
    uint64_t result = sub_20CB74940((uint64_t)v4);
  }
  __break(1u);
  return result;
}

uint64_t sub_20CB761F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v14[1] = a4;
  uint64_t v5 = sub_20CB650D0((uint64_t *)&unk_26ACC7170);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Google_Protobuf_Any();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20CB77DA4(a1, (uint64_t)v7, (uint64_t *)&unk_26ACC7170);
  uint64_t v12 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
  if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)v7, 1, v12) == 1)
  {
    uint64_t result = sub_20CB6A3C4((uint64_t)v7, (uint64_t *)&unk_26ACC7170);
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
      sub_20CB76A9C(&qword_26ACC68B0, MEMORY[0x263F50478]);
      dispatch thunk of Visitor.visitSingularMessageField<A>(value:fieldNumber:)();
      return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    }
    uint64_t result = sub_20CB74940((uint64_t)v7);
  }
  __break(1u);
  return result;
}

uint64_t static Ckcode_ProtectedEnvelope.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v43 = type metadata accessor for UnknownStorage();
  sub_20CB6A87C();
  uint64_t v48 = v4;
  MEMORY[0x270FA5388](v5);
  sub_20CB6A8BC();
  uint64_t v47 = (char *)(v6 - v7);
  MEMORY[0x270FA5388](v8);
  uint64_t v45 = (char *)&v43 - v9;
  uint64_t v10 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
  sub_20CB6A86C();
  MEMORY[0x270FA5388](v11);
  sub_20CB6A8FC();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = sub_20CB650D0(&qword_2676F0FC0);
  uint64_t v16 = v15 - 8;
  MEMORY[0x270FA5388](v15);
  sub_20CB6A8FC();
  uint64_t v19 = v18 - v17;
  uint64_t v20 = sub_20CB650D0((uint64_t *)&unk_26ACC7170);
  uint64_t v21 = sub_20CB6A8A4(v20);
  MEMORY[0x270FA5388](v21);
  sub_20CB6A8BC();
  uint64_t v24 = v22 - v23;
  uint64_t v26 = MEMORY[0x270FA5388](v25);
  uint64_t v28 = (char *)&v43 - v27;
  MEMORY[0x270FA5388](v26);
  uint64_t v30 = (char *)&v43 - v29;
  uint64_t v44 = a1;
  sub_20CB77DA4(a1, (uint64_t)&v43 - v29, (uint64_t *)&unk_26ACC7170);
  uint64_t v46 = a2;
  sub_20CB77DA4(a2, (uint64_t)v28, (uint64_t *)&unk_26ACC7170);
  uint64_t v31 = v19 + *(int *)(v16 + 56);
  sub_20CB77DA4((uint64_t)v30, v19, (uint64_t *)&unk_26ACC7170);
  sub_20CB77DA4((uint64_t)v28, v31, (uint64_t *)&unk_26ACC7170);
  sub_20CB6AA88(v19, 1, v10);
  if (!v32)
  {
    sub_20CB77DA4(v19, v24, (uint64_t *)&unk_26ACC7170);
    sub_20CB6AA88(v31, 1, v10);
    if (!v32)
    {
      sub_20CB76804(v31, v14);
      char v33 = static Ckcode_ProtectedEnvelope.OneOf_Contents.== infix(_:_:)(v24, v14);
      sub_20CB74940(v14);
      sub_20CB6A3C4((uint64_t)v28, (uint64_t *)&unk_26ACC7170);
      sub_20CB6A3C4((uint64_t)v30, (uint64_t *)&unk_26ACC7170);
      sub_20CB74940(v24);
      sub_20CB6A3C4(v19, (uint64_t *)&unk_26ACC7170);
      if (v33) {
        goto LABEL_11;
      }
LABEL_12:
      char v40 = 0;
      return v40 & 1;
    }
    sub_20CB6A3C4((uint64_t)v28, (uint64_t *)&unk_26ACC7170);
    sub_20CB6A3C4((uint64_t)v30, (uint64_t *)&unk_26ACC7170);
    sub_20CB74940(v24);
LABEL_9:
    sub_20CB6A3C4(v19, &qword_2676F0FC0);
    goto LABEL_12;
  }
  sub_20CB6A3C4((uint64_t)v28, (uint64_t *)&unk_26ACC7170);
  sub_20CB6A3C4((uint64_t)v30, (uint64_t *)&unk_26ACC7170);
  sub_20CB6AA88(v31, 1, v10);
  if (!v32) {
    goto LABEL_9;
  }
  sub_20CB6A3C4(v19, (uint64_t *)&unk_26ACC7170);
LABEL_11:
  uint64_t v34 = type metadata accessor for Ckcode_ProtectedEnvelope(0);
  uint64_t v35 = v45;
  uint64_t v36 = v48;
  uint64_t v37 = *(void (**)(char *, uint64_t, uint64_t))(v48 + 16);
  uint64_t v38 = v43;
  v37(v45, v44 + *(int *)(v34 + 20), v43);
  uint64_t v39 = v47;
  v37(v47, v46 + *(int *)(v34 + 20), v38);
  sub_20CB76A9C(&qword_2676F0BF8, MEMORY[0x263F50560]);
  char v40 = dispatch thunk of static Equatable.== infix(_:_:)();
  uint64_t v41 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
  v41((uint64_t)v39, v38);
  v41((uint64_t)v35, v38);
  return v40 & 1;
}

uint64_t sub_20CB76804(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

Swift::Int Ckcode_ProtectedEnvelope.hashValue.getter()
{
  return Hasher._finalize()();
}

uint64_t sub_20CB76900(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Ckcode_ProtectedEnvelope.decodeMessage<A>(decoder:)(a1, a2, a3);
}

uint64_t sub_20CB76918()
{
  return Ckcode_ProtectedEnvelope.traverse<A>(visitor:)();
}

uint64_t sub_20CB76930(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_20CB76A9C(&qword_2676F0FD8, (void (*)(uint64_t))type metadata accessor for Ckcode_ProtectedEnvelope);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_20CB769B0(uint64_t a1)
{
  uint64_t v2 = sub_20CB76A9C(&qword_26ACC7180, (void (*)(uint64_t))type metadata accessor for Ckcode_ProtectedEnvelope);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_20CB76A20()
{
  sub_20CB76A9C(&qword_26ACC7180, (void (*)(uint64_t))type metadata accessor for Ckcode_ProtectedEnvelope);
  return Message.hash(into:)();
}

uint64_t sub_20CB76A9C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_20CB76AE4()
{
  return sub_20CB76A9C(&qword_26ACC7188, (void (*)(uint64_t))type metadata accessor for Ckcode_ProtectedEnvelope);
}

uint64_t sub_20CB76B2C()
{
  return sub_20CB76A9C(&qword_26ACC7180, (void (*)(uint64_t))type metadata accessor for Ckcode_ProtectedEnvelope);
}

uint64_t sub_20CB76B74()
{
  return sub_20CB76A9C(&qword_2676F0FC8, (void (*)(uint64_t))type metadata accessor for Ckcode_ProtectedEnvelope);
}

uint64_t sub_20CB76BBC()
{
  return sub_20CB76A9C(&qword_2676F0FD0, (void (*)(uint64_t))type metadata accessor for Ckcode_ProtectedEnvelope);
}

uint64_t sub_20CB76C08@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = Ckcode_ProtectedEnvelope.encrypted.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_20CB76C38@<X0>(uint64_t a1@<X8>)
{
  return Ckcode_ProtectedEnvelope.value.getter(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for Ckcode_ProtectedEnvelope(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
    if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a2, 1, v7))
    {
      uint64_t v8 = sub_20CB650D0((uint64_t *)&unk_26ACC7170);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    }
    else
    {
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v10 = type metadata accessor for Google_Protobuf_Any();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
      }
      else
      {
        uint64_t v11 = *a2;
        unint64_t v12 = a2[1];
        sub_20CB64CA4(*a2, v12);
        *a1 = v11;
        a1[1] = v12;
      }
      swift_storeEnumTagMultiPayload();
      _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)a1, 0, 1, v7);
    }
    uint64_t v13 = *(int *)(a3 + 20);
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = type metadata accessor for UnknownStorage();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  }
  return a1;
}

uint64_t destroy for Ckcode_ProtectedEnvelope(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
  if (!_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(a1, 1, v4))
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v5 = type metadata accessor for Google_Protobuf_Any();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
    }
    else
    {
      sub_20CB64DC8(*(void *)a1, *(void *)(a1 + 8));
    }
  }
  uint64_t v6 = a1 + *(int *)(a2 + 20);
  uint64_t v7 = type metadata accessor for UnknownStorage();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
  return v8(v6, v7);
}

void *initializeWithCopy for Ckcode_ProtectedEnvelope(void *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
  if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a2, 1, v6))
  {
    uint64_t v7 = sub_20CB650D0((uint64_t *)&unk_26ACC7170);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v8 = type metadata accessor for Google_Protobuf_Any();
      (*(void (**)(void *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
    }
    else
    {
      uint64_t v9 = *a2;
      unint64_t v10 = a2[1];
      sub_20CB64CA4(*a2, v10);
      *a1 = v9;
      a1[1] = v10;
    }
    swift_storeEnumTagMultiPayload();
    _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)a1, 0, 1, v6);
  }
  uint64_t v11 = *(int *)(a3 + 20);
  unint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  return a1;
}

uint64_t *assignWithCopy for Ckcode_ProtectedEnvelope(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
  int v7 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a1, 1, v6);
  int v8 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a2, 1, v6);
  if (v7)
  {
    if (!v8)
    {
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v9 = type metadata accessor for Google_Protobuf_Any();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
      }
      else
      {
        uint64_t v12 = *a2;
        unint64_t v13 = a2[1];
        sub_20CB64CA4(*a2, v13);
        *a1 = v12;
        a1[1] = v13;
      }
      swift_storeEnumTagMultiPayload();
      _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)a1, 0, 1, v6);
      goto LABEL_15;
    }
LABEL_7:
    uint64_t v10 = sub_20CB650D0((uint64_t *)&unk_26ACC7170);
    memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    goto LABEL_15;
  }
  if (v8)
  {
    sub_20CB74940((uint64_t)a1);
    goto LABEL_7;
  }
  if (a1 != a2)
  {
    sub_20CB74940((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = type metadata accessor for Google_Protobuf_Any();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
    }
    else
    {
      uint64_t v14 = *a2;
      unint64_t v15 = a2[1];
      sub_20CB64CA4(*a2, v15);
      *a1 = v14;
      a1[1] = v15;
    }
    swift_storeEnumTagMultiPayload();
  }
LABEL_15:
  uint64_t v16 = *(int *)(a3 + 20);
  uint64_t v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  uint64_t v19 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 24))(v17, v18, v19);
  return a1;
}

char *initializeWithTake for Ckcode_ProtectedEnvelope(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
  if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a2, 1, v6))
  {
    uint64_t v7 = sub_20CB650D0((uint64_t *)&unk_26ACC7170);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v8 = type metadata accessor for Google_Protobuf_Any();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)a1, 0, 1, v6);
  }
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  return a1;
}

char *assignWithTake for Ckcode_ProtectedEnvelope(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
  int v7 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a1, 1, v6);
  int v8 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a2, 1, v6);
  if (!v7)
  {
    if (!v8)
    {
      if (a1 == a2) {
        goto LABEL_14;
      }
      sub_20CB74940((uint64_t)a1);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v11 = type metadata accessor for Google_Protobuf_Any();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, a2, v11);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      size_t v10 = *(void *)(*(void *)(v6 - 8) + 64);
      goto LABEL_8;
    }
    sub_20CB74940((uint64_t)a1);
LABEL_7:
    size_t v10 = *(void *)(*(void *)(sub_20CB650D0((uint64_t *)&unk_26ACC7170) - 8) + 64);
LABEL_8:
    memcpy(a1, a2, v10);
    goto LABEL_14;
  }
  if (v8) {
    goto LABEL_7;
  }
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = type metadata accessor for Google_Protobuf_Any();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)a1, 0, 1, v6);
LABEL_14:
  uint64_t v12 = *(int *)(a3 + 20);
  unint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  return a1;
}

uint64_t getEnumTagSinglePayload for Ckcode_ProtectedEnvelope(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20CB7763C);
}

uint64_t sub_20CB7763C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20CB650D0((uint64_t *)&unk_26ACC7170);
  sub_20CB6A854();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    uint64_t v8 = type metadata accessor for UnknownStorage();
    uint64_t v9 = a1 + *(int *)(a3 + 20);
  }
  return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(v9, a2, v8);
}

uint64_t storeEnumTagSinglePayload for Ckcode_ProtectedEnvelope(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20CB776D0);
}

uint64_t sub_20CB776D0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_20CB650D0((uint64_t *)&unk_26ACC7170);
  sub_20CB6A854();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    uint64_t v10 = type metadata accessor for UnknownStorage();
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }
  return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v11, a2, a2, v10);
}

void sub_20CB77758()
{
  sub_20CB77820();
  if (v0 <= 0x3F)
  {
    type metadata accessor for UnknownStorage();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_20CB77820()
{
  if (!qword_26ACC71A8)
  {
    type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(255);
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26ACC71A8);
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for Ckcode_ProtectedEnvelope.OneOf_Contents(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = type metadata accessor for Google_Protobuf_Any();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      uint64_t v9 = *a2;
      unint64_t v8 = a2[1];
      sub_20CB64CA4(v9, v8);
      *a1 = v9;
      a1[1] = v8;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for Ckcode_ProtectedEnvelope.OneOf_Contents(uint64_t *a1)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = type metadata accessor for Google_Protobuf_Any();
    uint64_t v3 = *(uint64_t (**)(uint64_t *, uint64_t))(*(void *)(v2 - 8) + 8);
    return v3(a1, v2);
  }
  else
  {
    uint64_t v5 = *a1;
    unint64_t v6 = a1[1];
    return sub_20CB64DC8(v5, v6);
  }
}

uint64_t *initializeWithCopy for Ckcode_ProtectedEnvelope.OneOf_Contents(uint64_t *a1, uint64_t *a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = type metadata accessor for Google_Protobuf_Any();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  }
  else
  {
    uint64_t v6 = *a2;
    unint64_t v5 = a2[1];
    sub_20CB64CA4(v6, v5);
    *a1 = v6;
    a1[1] = v5;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t *assignWithCopy for Ckcode_ProtectedEnvelope.OneOf_Contents(uint64_t *a1, uint64_t *a2)
{
  if (a1 != a2)
  {
    sub_20CB74940((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v4 = type metadata accessor for Google_Protobuf_Any();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
    }
    else
    {
      uint64_t v6 = *a2;
      unint64_t v5 = a2[1];
      sub_20CB64CA4(v6, v5);
      *a1 = v6;
      a1[1] = v5;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *initializeWithTake for Ckcode_ProtectedEnvelope.OneOf_Contents(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for Google_Protobuf_Any();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for Ckcode_ProtectedEnvelope.OneOf_Contents(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_20CB74940((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = type metadata accessor for Google_Protobuf_Any();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_20CB77D10()
{
  uint64_t result = type metadata accessor for Google_Protobuf_Any();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_20CB77DA4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_20CB650D0(a3);
  sub_20CB6A86C();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_20CB77E00()
{
  return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v1, 0, 1, v0);
}

uint64_t sub_20CB77E20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  *(void *)(v5 + 32) = a3;
  *(void *)(v5 + 40) = a4;
  *(unsigned char *)(v5 + 48) = a5;
  return v5;
}

void sub_20CB77E34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10 = v9;
  uint64_t v32 = a5;
  uint64_t v33 = a4;
  uint64_t v30 = a2;
  uint64_t v31 = a1;
  uint64_t v34 = a6;
  uint64_t v35 = a7;
  uint64_t v36 = a8;
  uint64_t v37 = a9;
  uint64_t v15 = type metadata accessor for CodeOperation.DestinationServer();
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v28 - v16;
  uint64_t v18 = type metadata accessor for Optional();
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v20 = (char *)&v28 - v19;
  uint64_t v21 = *(void *)(v9 + 24);
  uint64_t v29 = *(void *)(v9 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a6 - 8) + 16))((char *)&v28 - v19, a3, a6);
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)v20, 0, 1, a6);
  int v22 = *(unsigned __int8 *)(v9 + 48);
  uint64_t v23 = type metadata accessor for URL();
  if (v22) {
    uint64_t v24 = 2;
  }
  else {
    uint64_t v24 = 1;
  }
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)v17, v24, 2, v23);
  uint64_t v34 = a6;
  uint64_t v35 = a7;
  uint64_t v36 = a8;
  uint64_t v37 = a9;
  type metadata accessor for CodeOperation();
  swift_bridgeObjectRetain();
  uint64_t v25 = v30;
  swift_bridgeObjectRetain();
  uint64_t v26 = CodeOperation.__allocating_init(service:functionName:request:destinationServer:)(v29, v21, v31, v25, (uint64_t)v20, (uint64_t)v17);
  swift_retain();
  sub_20CB7A3EC();
  objc_msgSend(v26, sel_configureConvenience_, 0);
  id v27 = objc_msgSend(*(id *)(v10 + 32), sel_databaseWithDatabaseScope_, *(void *)(v10 + 40));
  objc_msgSend(v27, sel_addOperation_, v26);
}

uint64_t CodeConnection.deinit()
{
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t CodeConnection.__deallocating_deinit()
{
  CodeConnection.deinit();
  return MEMORY[0x270FA0228](v0, 49, 7);
}

void sub_20CB780AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t type metadata accessor for CodeConnection()
{
  return self;
}

uint64_t method lookup function for CodeConnection(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CodeConnection);
}

uint64_t dispatch thunk of CodeConnection.invoke<A, B>(function:request:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

void *CodeOperation.__allocating_init(service:functionName:request:destinationServer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  sub_20CB8337C();
  uint64_t v7 = sub_20CB83360();
  return CodeOperation.init(service:functionName:request:destinationServer:)(v7, v8, v9, v10, v11, a6);
}

uint64_t sub_20CB78190(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Optional();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - v3, a1);
  return sub_20CB78304();
}

uint64_t sub_20CB78260()
{
  sub_20CB832E8();
  sub_20CB83278();
  sub_20CB832E8();
  type metadata accessor for Optional();
  sub_20CB6A86C();
  sub_20CB83550();
  return v0();
}

uint64_t sub_20CB78304()
{
  sub_20CB832E8();
  sub_20CB83208();
  sub_20CB832E8();
  type metadata accessor for Optional();
  sub_20CB6A86C();
  uint64_t v0 = sub_20CB8355C();
  v1(v0);
  return swift_endAccess();
}

uint64_t (*sub_20CB783A8())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_20CB78408()
{
  sub_20CB832E8();
  sub_20CB83278();
  sub_20CB832E8();
  type metadata accessor for Optional();
  sub_20CB6A86C();
  sub_20CB83550();
  return v0();
}

uint64_t sub_20CB784AC()
{
  sub_20CB832E8();
  sub_20CB83208();
  sub_20CB832E8();
  type metadata accessor for Optional();
  sub_20CB6A86C();
  uint64_t v0 = sub_20CB8355C();
  v1(v0);
  return swift_endAccess();
}

uint64_t sub_20CB78550()
{
  return sub_20CB6A8B0();
}

uint64_t sub_20CB785A4()
{
  return sub_20CB6A8B0();
}

uint64_t sub_20CB785F8()
{
  sub_20CB83194();
  sub_20CB83304();
  type metadata accessor for CodeOperation.DestinationServer();
  sub_20CB6A86C();
  sub_20CB83550();
  return v0();
}

uint64_t sub_20CB78688()
{
  return sub_20CB83324();
}

uint64_t sub_20CB786B0(uint64_t a1)
{
  return sub_20CB832D8(a1);
}

uint64_t sub_20CB786D8()
{
  return sub_20CB83324();
}

uint64_t sub_20CB78700(uint64_t a1)
{
  return sub_20CB832D8(a1);
}

void *sub_20CB78728()
{
  uint64_t v1 = *(void **)((char *)v0 + *(void *)((*MEMORY[0x263F8EED0] & *v0) + 0xA8));
  id v2 = v1;
  return v1;
}

void sub_20CB78778(uint64_t a1)
{
  uint64_t v2 = *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0xA8);
  uint64_t v3 = *(void **)((char *)v1 + v2);
  *(void *)((char *)v1 + v2) = a1;
}

double sub_20CB787AC@<D0>(uint64_t a1@<X8>)
{
  sub_20CB78844((uint64_t)v5);
  char v2 = v6;
  double result = *(double *)v5;
  long long v4 = v5[1];
  *(_OWORD *)a1 = v5[0];
  *(_OWORD *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 32) = v2;
  return result;
}

uint64_t sub_20CB787F0(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  char v4 = *(unsigned char *)(a1 + 32);
  v6[0] = *(void *)a1;
  v6[1] = v1;
  void v6[2] = v2;
  v6[3] = v3;
  char v7 = v4;
  sub_20CB79854(v6[0], v1, v2, v3, v4);
  return sub_20CB788B8(v6);
}

uint64_t sub_20CB78844@<X0>(uint64_t a1@<X8>)
{
  sub_20CB831A8();
  uint64_t v4 = v1 + *(void *)(v3 + 176);
  sub_20CB83278();
  uint64_t v5 = *(void *)v4;
  unint64_t v6 = *(void *)(v4 + 8);
  uint64_t v7 = *(void *)(v4 + 16);
  uint64_t v8 = *(void *)(v4 + 24);
  *(void *)a1 = *(void *)v4;
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = v7;
  *(void *)(a1 + 24) = v8;
  char v9 = *(unsigned char *)(v4 + 32);
  *(unsigned char *)(a1 + 32) = v9;
  return sub_20CB79854(v5, v6, v7, v8, v9);
}

uint64_t sub_20CB788B8(uint64_t *a1)
{
  uint64_t v2 = *a1;
  long long v12 = *(_OWORD *)(a1 + 1);
  uint64_t v3 = a1[3];
  char v4 = *((unsigned char *)a1 + 32);
  uint64_t v5 = (char *)v1 + *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0xB0);
  swift_beginAccess();
  uint64_t v6 = *(void *)v5;
  unint64_t v7 = *((void *)v5 + 1);
  uint64_t v8 = *((void *)v5 + 2);
  uint64_t v9 = *((void *)v5 + 3);
  *(void *)uint64_t v5 = v2;
  *(_OWORD *)(v5 + 8) = v12;
  *((void *)v5 + 3) = v3;
  char v10 = v5[32];
  v5[32] = v4;
  return sub_20CB798B4(v6, v7, v8, v9, v10);
}

uint64_t (*sub_20CB78960())()
{
  return j_j__swift_endAccess;
}

double sub_20CB789C0@<D0>(_OWORD *a1@<X8>)
{
  sub_20CB78A40((uint64_t *)&v3);
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_20CB789FC(uint64_t *a1)
{
  unint64_t v1 = a1[1];
  v3[0] = *a1;
  v3[1] = v1;
  sub_20CB64C90(v3[0], v1);
  return sub_20CB78A90(v3);
}

uint64_t sub_20CB78A40@<X0>(uint64_t *a1@<X8>)
{
  sub_20CB78844((uint64_t)&v4);
  uint64_t result = v4;
  unint64_t v3 = v5;
  if (v8)
  {
    sub_20CB798B4(v4, v5, v6, v7, v8);
    uint64_t result = 0;
    unint64_t v3 = 0xF000000000000000;
  }
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_20CB78A90(void *a1)
{
  unint64_t v1 = a1[1];
  if (v1 >> 60 == 15)
  {
    long long v7 = 0u;
    long long v8 = 0u;
    char v9 = 2;
    return sub_20CB788B8((uint64_t *)&v7);
  }
  else
  {
    *(void *)&long long v7 = *a1;
    *((void *)&v7 + 1) = v1;
    long long v8 = 0uLL;
    char v9 = 0;
    uint64_t v3 = sub_20CB8350C();
    sub_20CB64CA4(v3, v4);
    sub_20CB788B8((uint64_t *)&v7);
    uint64_t v5 = sub_20CB8350C();
    return sub_20CB64DB4(v5, v6);
  }
}

uint64_t (*sub_20CB78B10(uint64_t *a1))(uint64_t *a1, char a2)
{
  a1[2] = v1;
  sub_20CB78A40(a1);
  return sub_20CB78B58;
}

uint64_t sub_20CB78B58(uint64_t *a1, char a2)
{
  uint64_t v2 = a1[1];
  if (a2)
  {
    uint64_t v8 = *a1;
    uint64_t v9 = v2;
    uint64_t v3 = sub_20CB8350C();
    sub_20CB64C90(v3, v4);
    sub_20CB78A90(&v8);
    uint64_t v5 = sub_20CB8350C();
    return sub_20CB64DB4(v5, v6);
  }
  else
  {
    uint64_t v8 = *a1;
    uint64_t v9 = v2;
    return sub_20CB78A90(&v8);
  }
}

uint64_t sub_20CB78BD8()
{
  sub_20CB831A8();
  sub_20CB83118();
  return *v0;
}

uint64_t sub_20CB78C24(char a1)
{
  uint64_t result = sub_20CB83170();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*sub_20CB78C78())()
{
  return j_j__swift_endAccess;
}

void *sub_20CB78CD8()
{
  uint64_t v1 = *(void **)((char *)v0 + *(void *)((*MEMORY[0x263F8EED0] & *v0) + 0xC0));
  id v2 = v1;
  return v1;
}

void sub_20CB78D24(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *v4;
  id v9 = a1;
  uint64_t v10 = sub_20CB859D8((uint64_t)v9, v8);

  if (v10)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_20CB83570();
    uint64_t v13 = sub_20CB85A1C(v11, v12, v10);
    swift_bridgeObjectRelease();
    if (v13)
    {
      uint64_t v14 = sub_20CB85A74(a4, v13);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v14) {
        goto LABEL_7;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  id v15 = objc_allocWithZone(MEMORY[0x263EFD788]);
  id v16 = v9;
  swift_bridgeObjectRetain();
  sub_20CB78EA0(objc_msgSend(v15, sel_init), v16, a2, a3, a4);
  uint64_t v14 = 0;
LABEL_7:
  uint64_t v17 = *v4;
  id v18 = v9;
  swift_bridgeObjectRetain();
  uint64_t v19 = sub_20CB859D8((uint64_t)v18, v17);

  if (!v19)
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v20 = sub_20CB83570();
  uint64_t v22 = sub_20CB85A1C(v20, v21, v19);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v22)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v23 = sub_20CB85A74(a4, v22);
  swift_bridgeObjectRelease();
  if (v23)
  {

    return;
  }
LABEL_13:
  __break(1u);
}

void sub_20CB78EA0(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v6 = v5;
  uint64_t v11 = sub_20CB859D8((uint64_t)a2, *v5);
  swift_bridgeObjectRelease();
  if (!v11)
  {
    id v12 = a2;
    sub_20CB8FDA4();
  }
  uint64_t v13 = *v6;
  id v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_20CB859D8((uint64_t)v14, v13);

  if (!v15) {
    goto LABEL_30;
  }
  uint64_t v16 = sub_20CB85A1C(a3, a4, v15);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v16)
  {
    id v55 = a1;
    id v17 = v14;
    swift_bridgeObjectRetain();
    swift_isUniquelyReferenced_nonNull_native();
    id v18 = sub_20CB833A4();
    sub_20CB8FF44((uint64_t)v18);
    sub_20CB834AC();
    Swift::Int v23 = v21 + v22;
    if (__OFADD__(v21, v22))
    {
LABEL_28:
      __break(1u);
      goto LABEL_29;
    }
    unint64_t v24 = v19;
    char v25 = v20;
    sub_20CB650D0((uint64_t *)&unk_2676F14A0);
    if (_NativeDictionary.ensureUnique(isUnique:capacity:)(0, v23))
    {
      sub_20CB8FF44((uint64_t)v18);
      if ((v25 & 1) != (v27 & 1)) {
        goto LABEL_31;
      }
      unint64_t v24 = v26;
    }
    if ((v25 & 1) == 0)
    {
LABEL_29:
      __break(1u);
LABEL_30:
      __break(1u);
      goto LABEL_31;
    }
    uint64_t v28 = *(void **)(v59[7] + 8 * v24);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    id v57 = v28;
    sub_20CB901E0(MEMORY[0x263F8EE80], a3, a4, isUniquelyReferenced_nonNull_native);
    uint64_t v58 = v28;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_20CB9085C((uint64_t *)&v58, 1, &v59, v24, v18);

    swift_bridgeObjectRelease();
    *unint64_t v6 = (uint64_t)v59;

    a1 = v55;
  }
  id v30 = v14;
  swift_bridgeObjectRetain();
  id v56 = a1;
  swift_isUniquelyReferenced_nonNull_native();
  id v31 = sub_20CB833A4();
  sub_20CB8FF44((uint64_t)v31);
  sub_20CB834AC();
  Swift::Int v36 = v34 + v35;
  if (__OFADD__(v34, v35))
  {
    __break(1u);
    goto LABEL_25;
  }
  unint64_t v37 = v32;
  char v38 = v33;
  sub_20CB650D0((uint64_t *)&unk_2676F14A0);
  if (_NativeDictionary.ensureUnique(isUnique:capacity:)(v16, v36))
  {
    sub_20CB8FF44((uint64_t)v31);
    if ((v38 & 1) == (v40 & 1))
    {
      unint64_t v37 = v39;
      goto LABEL_15;
    }
LABEL_31:
    sub_20CB6CEE4(0, &qword_2676F14B0);
    goto LABEL_32;
  }
LABEL_15:
  if ((v38 & 1) == 0)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v41 = *(void **)(v59[7] + 8 * v37);
  swift_bridgeObjectRetain();
  char v42 = swift_isUniquelyReferenced_nonNull_native();
  id v57 = v41;
  swift_bridgeObjectRetain();
  sub_20CB8FEB0(a3, a4);
  sub_20CB834AC();
  Swift::Int v47 = v45 + v46;
  if (__OFADD__(v45, v46))
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  unint64_t v48 = v43;
  char v49 = v44;
  sub_20CB650D0((uint64_t *)&unk_2676F11A0);
  if (_NativeDictionary.ensureUnique(isUnique:capacity:)(v42, v47))
  {
    uint64_t v50 = sub_20CB8FEB0(a3, a4);
    if ((v49 & 1) != (v51 & 1))
    {
LABEL_32:
      KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
      return;
    }
    unint64_t v48 = v50;
  }
  if ((v49 & 1) == 0) {
    goto LABEL_27;
  }
  uint64_t v52 = *(void *)(v57[7] + 8 * v48);
  char v53 = swift_isUniquelyReferenced_nonNull_native();
  sub_20CB900E4((uint64_t)v56, a5, v53);
  uint64_t v58 = (void *)v52;
  swift_bridgeObjectRelease();
  sub_20CB90788((uint64_t *)&v58, 1, &v57, v48, a3, a4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v58 = v57;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_20CB9085C((uint64_t *)&v58, 1, &v59, v37, v31);

  swift_bridgeObjectRelease();
  *unint64_t v6 = (uint64_t)v59;

  swift_bridgeObjectRelease();
}

uint64_t sub_20CB792DC(void *a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return 0;
  }
  id v3 = a1;
  sub_20CB8FF44((uint64_t)v3);
  if (v5)
  {
    uint64_t v6 = *(void *)(*(void *)(a2 + 56) + 8 * v4);
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void sub_20CB7933C(uint64_t a1, void *a2)
{
  if (a1)
  {
    sub_20CB8FDA4();
  }
  else
  {
    sub_20CB8FBF4((uint64_t)a2);

    swift_bridgeObjectRelease();
  }
}

uint64_t sub_20CB793B8()
{
  return swift_bridgeObjectRetain();
}

void *CodeOperation.init(service:functionName:request:destinationServer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8 = (void *)MEMORY[0x263F8EED0];
  uint64_t v9 = *MEMORY[0x263F8EED0] & *v6;
  uint64_t v10 = (char *)v6 + *(void *)(v9 + 0x70);
  sub_20CB8357C();
  uint64_t v12 = v11;
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v13, v14, v15, v11);
  sub_20CB83160();
  uint64_t v56 = *(void *)(v9 + 88);
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)v6 + *(void *)(v16 + 120), 1, 1, v56);
  uint64_t v17 = MEMORY[0x263F8EE78];
  *(void *)((char *)v6 + *(void *)((*v8 & *v6) + 0x98)) = MEMORY[0x263F8EE78];
  *(void *)((char *)v6 + *(void *)((*v8 & *v6) + 0xA0)) = v17;
  sub_20CB83160();
  *(void *)((char *)v6 + *(void *)(v18 + 168)) = 0;
  sub_20CB83160();
  char v20 = (char *)v6 + *(void *)(v19 + 176);
  *(_OWORD *)char v20 = 0u;
  *((_OWORD *)v20 + 1) = 0u;
  v20[32] = 2;
  sub_20CB83160();
  *((unsigned char *)v6 + *(void *)(v21 + 184)) = 0;
  sub_20CB83160();
  *(void *)((char *)v6 + *(void *)(v22 + 192)) = 0;
  sub_20CB83160();
  *(void *)((char *)v6 + *(void *)(v23 + 200)) = MEMORY[0x263F8EE80];
  sub_20CB83160();
  char v25 = (void *)((char *)v6 + *(void *)(v24 + 208));
  void *v25 = 0;
  v25[1] = 0;
  sub_20CB83160();
  char v27 = (void *)((char *)v6 + *(void *)(v26 + 216));
  *char v27 = 0;
  v27[1] = 0;
  sub_20CB83160();
  uint64_t v29 = (void *)((char *)v6 + *(void *)(v28 + 224));
  *uint64_t v29 = 0;
  v29[1] = 0;
  sub_20CB83160();
  id v31 = (void *)((char *)v6 + *(void *)(v30 + 248));
  *id v31 = 0;
  v31[1] = 0;
  sub_20CB83160();
  char v33 = (void *)((char *)v6 + *(void *)(v32 + 256));
  *char v33 = 0;
  v33[1] = 0;
  sub_20CB83208();
  uint64_t v55 = type metadata accessor for Optional();
  sub_20CB831F4();
  uint64_t v35 = *(void (**)(char *, uint64_t, uint64_t))(v34 + 24);
  Swift::Int v36 = v6;
  v35(v10, a5, v55);
  swift_endAccess();
  sub_20CB83160();
  char v38 = (void *)((char *)v36 + *(void *)(v37 + 128));
  void *v38 = a1;
  v38[1] = a2;
  sub_20CB83160();
  char v40 = (void *)((char *)v36 + *(void *)(v39 + 136));
  *char v40 = a3;
  v40[1] = a4;
  sub_20CB83160();
  char v42 = (char *)v36 + *(void *)(v41 + 144);
  uint64_t v63 = v12;
  uint64_t v64 = v56;
  sub_20CB83438();
  uint64_t v43 = type metadata accessor for CodeOperation.DestinationServer();
  sub_20CB831F4();
  uint64_t v45 = v44;
  (*(void (**)(char *, uint64_t, uint64_t))(v44 + 16))(v42, a6, v43);
  sub_20CB83160();
  *((unsigned char *)v36 + *(void *)(v46 + 240)) = 0;
  sub_20CB83160();
  *((unsigned char *)v36 + *(void *)(v47 + 232)) = 1;

  uint64_t v63 = v12;
  uint64_t v64 = v56;
  sub_20CB83438();
  v62.receiver = v36;
  v62.super_class = (Class)type metadata accessor for CodeOperation();
  id v48 = objc_msgSendSuper2(&v62, sel_init);
  uint64_t v63 = v12;
  uint64_t v64 = v56;
  sub_20CB83438();
  type metadata accessor for CodeOperation.CallbackRelay();
  char v49 = v48;
  id v50 = sub_20CB7995C(v49);
  (*(void (**)(uint64_t, uint64_t))(v45 + 8))(a6, v43);
  sub_20CB832A0();
  v51();
  uint64_t v52 = *(void *)((*v8 & *v49) + 0xC0);
  char v53 = *(void **)((char *)v49 + v52);
  *(void *)((char *)v49 + v52) = v50;

  return v49;
}

uint64_t sub_20CB79854(uint64_t result, unint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5 == 1)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  else if (!a5)
  {
    return sub_20CB64CA4(result, a2);
  }
  return result;
}

uint64_t sub_20CB798B4(uint64_t result, unint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5 == 1)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else if (!a5)
  {
    return sub_20CB64DC8(result, a2);
  }
  return result;
}

uint64_t type metadata accessor for CodeOperation.DestinationServer()
{
  return swift_getGenericMetadata();
}

uint64_t type metadata accessor for CodeOperation()
{
  return swift_getGenericMetadata();
}

uint64_t type metadata accessor for CodeOperation.CallbackRelay()
{
  return swift_getGenericMetadata();
}

id sub_20CB7995C(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return sub_20CB7E9D4(a1);
}

void CodeOperation.__allocating_init(serviceName:functionName:request:local:)()
{
}

void CodeOperation.init(serviceName:functionName:request:local:)()
{
  sub_20CB83248();
  int v81 = v1;
  uint64_t v73 = v2;
  uint64_t v79 = v3;
  uint64_t v80 = v4;
  uint64_t v77 = v5;
  uint64_t v75 = v6;
  long long v7 = (void *)MEMORY[0x263F8EED0];
  sub_20CB833F0();
  uint64_t v9 = *(void *)(v8 + 80);
  sub_20CB833F0();
  uint64_t v11 = *(void *)(v10 + 88);
  sub_20CB833F0();
  uint64_t v83 = *(void *)(v12 + 96);
  sub_20CB833F0();
  uint64_t v82 = *(void *)(v13 + 104);
  uint64_t v85 = v9;
  uint64_t v86 = v11;
  uint64_t v74 = v11;
  uint64_t v87 = v14;
  uint64_t v88 = v82;
  uint64_t v78 = type metadata accessor for CodeOperation.DestinationServer();
  sub_20CB6D4D0();
  uint64_t v76 = v15;
  sub_20CB832AC();
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v72 - v17;
  sub_20CB833F0();
  char v20 = (char *)v0 + *(void *)(v19 + 112);
  sub_20CB8357C();
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v21, v22, v23, v9);
  sub_20CB830F4();
  sub_20CB8357C();
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v24, v25, v26, v11);
  sub_20CB830F4();
  uint64_t v28 = MEMORY[0x263F8EE78];
  *(void *)((char *)v0 + *(void *)(v27 + 152)) = MEMORY[0x263F8EE78];
  *(void *)((char *)v0 + *(void *)((*v7 & *v0) + 0xA0)) = v28;
  sub_20CB830F4();
  *(void *)((char *)v0 + *(void *)(v29 + 168)) = 0;
  sub_20CB830F4();
  id v31 = (char *)v0 + *(void *)(v30 + 176);
  *(_OWORD *)id v31 = 0u;
  *((_OWORD *)v31 + 1) = 0u;
  v31[32] = 2;
  sub_20CB830F4();
  *((unsigned char *)v0 + *(void *)(v32 + 184)) = 0;
  sub_20CB830F4();
  *(void *)((char *)v0 + *(void *)(v33 + 192)) = 0;
  sub_20CB830F4();
  *(void *)((char *)v0 + *(void *)(v34 + 200)) = MEMORY[0x263F8EE80];
  sub_20CB830F4();
  Swift::Int v36 = (void *)((char *)v0 + *(void *)(v35 + 208));
  *Swift::Int v36 = 0;
  v36[1] = 0;
  sub_20CB830F4();
  char v38 = (void *)((char *)v0 + *(void *)(v37 + 216));
  void *v38 = 0;
  v38[1] = 0;
  sub_20CB830F4();
  char v40 = (void *)((char *)v0 + *(void *)(v39 + 224));
  *char v40 = 0;
  v40[1] = 0;
  sub_20CB830F4();
  char v42 = (void *)((char *)v0 + *(void *)(v41 + 248));
  *char v42 = 0;
  v42[1] = 0;
  sub_20CB830F4();
  uint64_t v44 = (void *)((char *)v0 + *(void *)(v43 + 256));
  *uint64_t v44 = 0;
  v44[1] = 0;
  sub_20CB83208();
  uint64_t v45 = type metadata accessor for Optional();
  sub_20CB831F4();
  uint64_t v47 = v46;
  id v48 = *(void (**)(char *, uint64_t, uint64_t))(v46 + 24);
  char v49 = v0;
  id v50 = v20;
  uint64_t v51 = v73;
  v48(v50, v73, v45);
  swift_endAccess();
  sub_20CB83108();
  char v53 = &v49[*(void *)(v52 + 128)];
  uint64_t v54 = v77;
  *(void *)char v53 = v75;
  *((void *)v53 + 1) = v54;
  sub_20CB83108();
  uint64_t v56 = &v49[*(void *)(v55 + 136)];
  uint64_t v57 = v80;
  *(void *)uint64_t v56 = v79;
  *((void *)v56 + 1) = v57;
  uint64_t v58 = type metadata accessor for URL();
  if (v81) {
    uint64_t v59 = 2;
  }
  else {
    uint64_t v59 = 1;
  }
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)v18, v59, 2, v58);
  sub_20CB83108();
  (*(void (**)(char *, char *, uint64_t))(v76 + 32))(&v49[*(void *)(v60 + 144)], v18, v78);
  sub_20CB83108();
  v49[*(void *)(v61 + 240)] = 0;
  sub_20CB83108();
  v49[*(void *)(v62 + 232)] = 1;

  uint64_t v63 = v74;
  uint64_t v85 = v9;
  uint64_t v86 = v74;
  uint64_t v65 = v82;
  uint64_t v64 = v83;
  uint64_t v87 = v83;
  uint64_t v88 = v82;
  uint64_t v66 = (objc_class *)type metadata accessor for CodeOperation();
  v84.receiver = v49;
  v84.super_class = v66;
  id v67 = objc_msgSendSuper2(&v84, sel_init);
  uint64_t v85 = v9;
  uint64_t v86 = v63;
  uint64_t v87 = v64;
  uint64_t v88 = v65;
  type metadata accessor for CodeOperation.CallbackRelay();
  id v68 = v67;
  id v69 = sub_20CB7995C(v68);
  (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v51, v45);
  uint64_t v70 = *(void *)((*v7 & *v68) + 0xC0);
  id v71 = *(void **)((char *)v68 + v70);
  *(void *)((char *)v68 + v70) = v69;

  sub_20CB83260();
}

uint64_t sub_20CB79E24@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_20CB79F68();
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = v3;
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v4;
    *(void *)(result + 24) = v5;
    uint64_t v6 = sub_20CB83034;
  }
  else
  {
    uint64_t v6 = 0;
  }
  *a1 = v6;
  a1[1] = result;
  return result;
}

uint64_t sub_20CB79E94(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  if (*a1)
  {
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v1;
    *(void *)(v3 + 24) = v2;
  }
  sub_20CB6B318(v1);
  return sub_20CB79FB4();
}

uint64_t sub_20CB79F24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t *, uint64_t *, uint64_t *))
{
  uint64_t v6 = a2;
  uint64_t v7 = a1;
  uint64_t v5 = a3;
  return a4(&v7, &v6, &v5);
}

uint64_t sub_20CB79F68()
{
  return sub_20CB831CC();
}

uint64_t sub_20CB79FB4()
{
  return sub_20CB83484();
}

uint64_t (*sub_20CB7A00C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_20CB7A06C@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_20CB7A16C();
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = v3;
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v4;
    *(void *)(result + 24) = v5;
    uint64_t v6 = sub_20CB83024;
  }
  else
  {
    uint64_t v6 = 0;
  }
  *a1 = v6;
  a1[1] = result;
  return result;
}

uint64_t sub_20CB7A0DC(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  if (*a1)
  {
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v1;
    *(void *)(v3 + 24) = v2;
  }
  sub_20CB6B318(v1);
  return sub_20CB7A1B8();
}

uint64_t sub_20CB7A16C()
{
  return sub_20CB831CC();
}

uint64_t sub_20CB7A1B8()
{
  return sub_20CB83484();
}

uint64_t (*sub_20CB7A210())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_20CB7A270@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, void *a3@<X8>)
{
  long long v9 = *(_OWORD *)(a2 + a1 - 16);
  long long v10 = *(_OWORD *)(a2 + a1 - 32);
  uint64_t result = sub_20CB7A3A0();
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = v5;
    uint64_t result = swift_allocObject();
    *(_OWORD *)(result + 16) = v10;
    *(_OWORD *)(result + 32) = v9;
    *(void *)(result + 48) = v6;
    *(void *)(result + 56) = v7;
    uint64_t v8 = sub_20CB82FC0;
  }
  else
  {
    uint64_t v8 = 0;
  }
  *a3 = v8;
  a3[1] = result;
  return result;
}

uint64_t sub_20CB7A304(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  if (*a1)
  {
    uint64_t v6 = a4 + a3;
    uint64_t v7 = swift_allocObject();
    long long v8 = *(_OWORD *)(v6 - 16);
    *(_OWORD *)(v7 + 16) = *(_OWORD *)(v6 - 32);
    *(_OWORD *)(v7 + 32) = v8;
    *(void *)(v7 + 48) = v4;
    *(void *)(v7 + 56) = v5;
  }
  sub_20CB6B318(v4);
  return sub_20CB7A3EC();
}

uint64_t sub_20CB7A3A0()
{
  return sub_20CB831CC();
}

uint64_t sub_20CB7A3EC()
{
  return sub_20CB83484();
}

uint64_t (*sub_20CB7A444())()
{
  return j__swift_endAccess;
}

uint64_t sub_20CB7A4A8()
{
  sub_20CB831A8();
  sub_20CB83118();
  return *v0;
}

uint64_t sub_20CB7A4F4(char a1)
{
  uint64_t result = sub_20CB83170();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*sub_20CB7A548())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_20CB7A5A8()
{
  sub_20CB831A8();
  sub_20CB83118();
  return *v0;
}

uint64_t sub_20CB7A5F4(char a1)
{
  uint64_t result = sub_20CB83170();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*sub_20CB7A648())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_20CB7A6A8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t (**a3)(uint64_t a1)@<X8>)
{
  long long v9 = *(_OWORD *)(a2 + a1 - 16);
  long long v10 = *(_OWORD *)(a2 + a1 - 32);
  uint64_t result = sub_20CB7A7D8();
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = v5;
    uint64_t result = swift_allocObject();
    *(_OWORD *)(result + 16) = v10;
    *(_OWORD *)(result + 32) = v9;
    *(void *)(result + 48) = v6;
    *(void *)(result + 56) = v7;
    long long v8 = sub_20CB82F08;
  }
  else
  {
    long long v8 = 0;
  }
  *a3 = v8;
  a3[1] = (uint64_t (*)(uint64_t))result;
  return result;
}

uint64_t sub_20CB7A73C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  if (*a1)
  {
    uint64_t v6 = a4 + a3;
    uint64_t v7 = swift_allocObject();
    long long v8 = *(_OWORD *)(v6 - 16);
    *(_OWORD *)(v7 + 16) = *(_OWORD *)(v6 - 32);
    *(_OWORD *)(v7 + 32) = v8;
    *(void *)(v7 + 48) = v4;
    *(void *)(v7 + 56) = v5;
  }
  sub_20CB6B318(v4);
  return sub_20CB7A824();
}

uint64_t sub_20CB7A7D8()
{
  return sub_20CB831CC();
}

uint64_t sub_20CB7A824()
{
  return sub_20CB83484();
}

uint64_t (*sub_20CB7A87C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_20CB7A8DC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t (**a3)(uint64_t a1)@<X8>)
{
  long long v9 = *(_OWORD *)(a2 + a1 - 16);
  long long v10 = *(_OWORD *)(a2 + a1 - 32);
  uint64_t result = sub_20CB7AA0C();
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = v5;
    uint64_t result = swift_allocObject();
    *(_OWORD *)(result + 16) = v10;
    *(_OWORD *)(result + 32) = v9;
    *(void *)(result + 48) = v6;
    *(void *)(result + 56) = v7;
    long long v8 = sub_20CB82F08;
  }
  else
  {
    long long v8 = 0;
  }
  *a3 = v8;
  a3[1] = (uint64_t (*)(uint64_t))result;
  return result;
}

void sub_20CB7A970(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  if (*a1)
  {
    uint64_t v6 = a4 + a3;
    uint64_t v7 = swift_allocObject();
    long long v8 = *(_OWORD *)(v6 - 16);
    *(_OWORD *)(v7 + 16) = *(_OWORD *)(v6 - 32);
    *(_OWORD *)(v7 + 32) = v8;
    *(void *)(v7 + 48) = v4;
    *(void *)(v7 + 56) = v5;
  }
  sub_20CB6B318(v4);
  sub_20CB7AA58();
}

uint64_t sub_20CB7AA0C()
{
  return sub_20CB831CC();
}

void sub_20CB7AA58()
{
  sub_20CB83354();
  if (v0 && !*MEMORY[0x263EFD8A0])
  {
    __break(1u);
  }
  else
  {
    sub_20CB831A8();
    sub_20CB83170();
    sub_20CB83484();
  }
}

void (*sub_20CB7AAC8(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  sub_20CB831A8();
  uint64_t v5 = (uint64_t *)(v1 + *(void *)(v4 + 256));
  sub_20CB83278();
  uint64_t v6 = *v5;
  uint64_t v7 = v5[1];
  v3[3] = *v5;
  v3[4] = v7;
  sub_20CB6B318(v6);
  return sub_20CB7AB5C;
}

void sub_20CB7AB5C(uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  if (a2)
  {
    uint64_t v3 = sub_20CB83570();
    sub_20CB6B318(v3);
    sub_20CB7AA58();
    sub_20CB6B280(v2[3]);
  }
  else
  {
    sub_20CB7AA58();
  }
  free(v2);
}

uint64_t sub_20CB7ABD4()
{
  sub_20CB832B8();
  long long v3 = *(_OWORD *)(v1 + 80);
  long long v4 = *(_OWORD *)(v1 + 96);
  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for CodeOperation();
  if (objc_msgSendSuper2(&v5, sel_hasCKOperationCallbacksSet, v3, v4)) {
    return 1;
  }
  uint64_t result = sub_20CB79F68();
  if (result || (uint64_t result = sub_20CB7A3A0()) != 0 || (uint64_t result = sub_20CB7A16C()) != 0 || (uint64_t result = sub_20CB7A7D8()) != 0)
  {
    sub_20CB6B280(result);
    return 1;
  }
  return result;
}

uint64_t sub_20CB7AC58(void *a1)
{
  id v1 = a1;
  char v2 = sub_20CB7ABD4();

  return v2 & 1;
}

id sub_20CB7AC8C()
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  sub_20CB83194();
  uint64_t v3 = v2;
  objc_super v5 = *(void **)(v4 + 80);
  uint64_t v6 = type metadata accessor for Optional();
  sub_20CB6D4D0();
  uint64_t v8 = v7;
  sub_20CB832AC();
  MEMORY[0x270FA5388](v9);
  sub_20CB833C8();
  sub_20CB78260();
  int v10 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(v1, 1, (uint64_t)v5);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v1, v6);
  if (v10 == 1
    || (id v11 = objc_msgSend(v0, sel_resolvedConfiguration),
        unsigned __int8 v12 = objc_msgSend(v11, sel_isLongLived),
        v11,
        (v12 & 1) != 0))
  {
    sub_20CB83314();
    related decl 'e' for CKErrorCode.init(_:description:)();
    return (id)swift_willThrow();
  }
  v17[0] = 0;
  v17[1] = v5;
  uint64_t v14 = *(void *)(v3 + 104);
  long long v18 = *(_OWORD *)(v3 + 88);
  uint64_t v19 = v14;
  v16.receiver = v0;
  v16.super_class = (Class)type metadata accessor for CodeOperation();
  if ((objc_msgSendSuper2(&v16, sel_CKOperationShouldRun_, v17) & 1) == 0)
  {
    id v15 = v17[0];
    _convertNSErrorToError(_:)();

    return (id)swift_willThrow();
  }
  return v17[0];
}

uint64_t sub_20CB7AE88(void *a1)
{
  id v1 = a1;
  sub_20CB7AC8C();

  return 1;
}

char *sub_20CB7AF04()
{
  return sel_performCodeOperation_withBlock_;
}

char *sub_20CB7AF10()
{
  return sub_20CB7AF04();
}

void sub_20CB7AF28()
{
  sub_20CB83248();
  uint64_t v86 = (void *)(*MEMORY[0x263F8EED0] & *v0);
  uint64_t v3 = v86;
  uint64_t v92 = type metadata accessor for Google_Protobuf_Any();
  sub_20CB6D4D0();
  uint64_t v87 = v4;
  MEMORY[0x270FA5388](v5);
  sub_20CB6A8FC();
  uint64_t v91 = v7 - v6;
  uint64_t v8 = sub_20CB650D0((uint64_t *)&unk_26ACC7170);
  uint64_t v9 = sub_20CB6A8A4(v8);
  MEMORY[0x270FA5388](v9);
  sub_20CB83220();
  uint64_t v89 = v10;
  sub_20CB832CC();
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)v82 - v12;
  uint64_t v93 = type metadata accessor for Ckcode_ProtectedEnvelope(0);
  sub_20CB6D4D0();
  v82[1] = v14;
  MEMORY[0x270FA5388](v15);
  sub_20CB6A8FC();
  uint64_t v18 = v17 - v16;
  uint64_t v19 = type metadata accessor for Ckcode_RecordTransport();
  sub_20CB6D4D0();
  uint64_t v21 = v20;
  MEMORY[0x270FA5388](v22);
  sub_20CB833D8();
  uint64_t v23 = v3[10];
  uint64_t v24 = type metadata accessor for Optional();
  sub_20CB6A8A4(v24);
  sub_20CB832AC();
  MEMORY[0x270FA5388](v25);
  uint64_t v27 = (char *)v82 - v26;
  sub_20CB6D4D0();
  uint64_t v29 = v28;
  sub_20CB832AC();
  MEMORY[0x270FA5388](v30);
  sub_20CB833C8();
  sub_20CB78260();
  if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)v27, 1, v23) == 1)
  {
    __break(1u);
  }
  else
  {
    id v90 = v0;
    v82[2] = v29;
    sub_20CB83348();
    v31();
    uint64_t v32 = v86[12];
    uint64_t v33 = sub_20CB82E10(&qword_26ACC7138, (void (*)(uint64_t))type metadata accessor for Ckcode_RecordTransport);
    uint64_t v83 = v32;
    uint64_t v85 = v2;
    uint64_t v94 = sub_20CB6CF5C(v19, v23, v19, v32, v33);
    uint64_t v88 = 0;
    uint64_t v34 = *(void *)(v94 + 16);
    uint64_t v84 = v23;
    if (v34)
    {
      uint64_t v35 = v94 + ((*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80));
      uint64_t v95 = *(void *)(v21 + 72);
      Swift::Int v36 = (char *)MEMORY[0x263F8EE78];
      while (1)
      {
        sub_20CB80CE8();
        uint64_t v37 = *v1;
        uint64_t v38 = v1[1];
        sub_20CB7B72C(*v1, v38);
        sub_20CB80E00((uint64_t)v1, (void (*)(void))type metadata accessor for Ckcode_RecordTransport);
        if ((~v38 & 0x3000000000000000) == 0) {
          goto LABEL_14;
        }
        if ((v38 & 0x2000000000000000) != 0) {
          break;
        }
        sub_20CB6C1EC(v37, v38);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          char v42 = (char *)sub_20CB832F4();
          Swift::Int v36 = sub_20CB80BF8(v42, v43, v44, (uint64_t)v36);
        }
        unint64_t v40 = *((void *)v36 + 2);
        unint64_t v39 = *((void *)v36 + 3);
        if (v40 >= v39 >> 1) {
          Swift::Int v36 = sub_20CB80BF8((char *)(v39 > 1), v40 + 1, 1, (uint64_t)v36);
        }
        *((void *)v36 + 2) = v40 + 1;
        uint64_t v41 = &v36[16 * v40];
        *((void *)v41 + 4) = v37;
        *((void *)v41 + 5) = v38;
        sub_20CB6BEB4(v37, v38);
        v35 += v95;
        if (!--v34)
        {
          swift_bridgeObjectRelease();
          uint64_t v23 = v84;
          goto LABEL_15;
        }
      }
      sub_20CB6BEB4(v37, v38);
LABEL_14:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_20CB83314();
      uint64_t v45 = (void *)related decl 'e' for CKErrorCode.init(_:description:)();
      uint64_t v46 = (void *)_convertErrorToNSError(_:)();

      objc_msgSend(v90, sel_finishWithError_, v46);
      goto LABEL_31;
    }
    swift_bridgeObjectRelease();
    Swift::Int v36 = (char *)MEMORY[0x263F8EE78];
LABEL_15:
    uint64_t v47 = sub_20CB82E10(&qword_26ACC7180, (void (*)(uint64_t))type metadata accessor for Ckcode_ProtectedEnvelope);
    id v48 = v88;
    uint64_t v49 = sub_20CB6CF5C(v93, v23, v93, v83, v47);
    uint64_t v51 = v89;
    id v50 = v90;
    if (!v48)
    {
      uint64_t v52 = *(void *)(v49 + 16);
      if (!v52)
      {
        swift_bridgeObjectRelease();
        uint64_t v77 = MEMORY[0x263F8EE78];
LABEL_30:
        sub_20CB786B0((uint64_t)v36);
        sub_20CB78700(v77);
        uint64_t v78 = v86[11];
        uint64_t v79 = v86[13];
        uint64_t v96 = v84;
        uint64_t v97 = v78;
        uint64_t v98 = v83;
        uint64_t v99 = v79;
        uint64_t v80 = (objc_class *)type metadata accessor for CodeOperation();
        v100.receiver = v50;
        v100.super_class = v80;
        objc_msgSendSuper2(&v100, sel_performCKOperation);
LABEL_31:
        sub_20CB832A0();
        v81();
        sub_20CB83260();
        return;
      }
      sub_20CB8342C();
      v82[0] = v53;
      uint64_t v55 = v53 + v54;
      uint64_t v95 = *(void *)(v56 + 72);
      uint64_t v88 = (void (**)(uint64_t, uint64_t, uint64_t))(v87 + 32);
      v87 += 8;
      uint64_t v93 = 0x800000020CB9ACC0;
      uint64_t v94 = MEMORY[0x263F8EE78];
      while (1)
      {
        sub_20CB80CE8();
        sub_20CB80D38(v18, (uint64_t)v13);
        sub_20CB80E00(v18, (void (*)(void))type metadata accessor for Ckcode_ProtectedEnvelope);
        uint64_t v57 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
        if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)v13, 1, v57) != 1)
        {
          uint64_t v58 = sub_20CB83544();
          sub_20CB80D38(v58, v59);
          if (swift_getEnumCaseMultiPayload() == 1)
          {
            (*v88)(v91, v51, v92);
            sub_20CB82E10(&qword_26ACC68B0, MEMORY[0x263F50478]);
            uint64_t v60 = Message.serializedData(partial:)();
            uint64_t v62 = v61;
            uint64_t v63 = (char *)v94;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              id v71 = (char *)sub_20CB832F4();
              uint64_t v63 = sub_20CB80BF8(v71, v72, v73, (uint64_t)v63);
            }
            unint64_t v65 = *((void *)v63 + 2);
            unint64_t v64 = *((void *)v63 + 3);
            uint64_t v94 = (uint64_t)v63;
            if (v65 >= v64 >> 1)
            {
              BOOL v74 = sub_20CB834F8(v64);
              uint64_t v94 = (uint64_t)sub_20CB80BF8((char *)v74, v75, v76, v94);
            }
            uint64_t v66 = v94;
            *(void *)(v94 + 16) = v65 + 1;
            uint64_t v67 = v66 + 16 * v65;
            *(void *)(v67 + 32) = v60;
            *(void *)(v67 + 40) = v62;
            sub_20CB832A0();
            v68();
            uint64_t v51 = v89;
            id v50 = v90;
            goto LABEL_27;
          }
          sub_20CB80E00(v51, (void (*)(void))type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents);
        }
        id v69 = (void *)related decl 'e' for CKErrorCode.init(_:description:)();
        uint64_t v70 = (void *)_convertErrorToNSError(_:)();

        objc_msgSend(v50, sel_finishWithError_, v70, v82[0]);
LABEL_27:
        sub_20CB80DA0((uint64_t)v13);
        v55 += v95;
        if (!--v52)
        {
          swift_bridgeObjectRelease();
          uint64_t v77 = v94;
          goto LABEL_30;
        }
      }
    }
  }
  sub_20CB83290();
  swift_unexpectedError();
  __break(1u);
}

uint64_t sub_20CB7B72C(uint64_t a1, uint64_t a2)
{
  if ((~a2 & 0x3000000000000000) != 0) {
    return sub_20CB6C1EC(a1, a2);
  }
  return a1;
}

void sub_20CB7B740(void *a1)
{
  id v1 = a1;
  sub_20CB7AF28();
}

uint64_t sub_20CB7B788()
{
  return sub_20CB6CEE4(0, &qword_26ACC71A0);
}

uint64_t sub_20CB7B7B4()
{
  sub_20CB7B788();
  return swift_getObjCClassFromMetadata();
}

void *sub_20CB7B7DC()
{
  return &unk_26C1C86E0;
}

id sub_20CB7B7E8()
{
  uint64_t v0 = sub_20CB7B7DC();
  return v0;
}

uint64_t sub_20CB7B810()
{
  return MEMORY[0x270EE3510](v0, "CodeOperation", 13, 2);
}

void sub_20CB7B828(void *a1)
{
  id v1 = a1;
  sub_20CB7B810();
}

uint64_t sub_20CB7B870(uint64_t a1)
{
  return MEMORY[0x270EE3508](v1, "CodeOperation", 13, 2, a1);
}

void sub_20CB7B88C(void *a1, uint64_t a2, void *a3)
{
  id v4 = a1;
  id v5 = a3;
  sub_20CB7B870((uint64_t)a3);
}

uint64_t sub_20CB7B8E4()
{
  return MEMORY[0x270EE34E0]("client/code-operation", 21, 2, &dword_20CB63000);
}

id sub_20CB7B900(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)sub_20CB7B8E4();

  return v2;
}

void sub_20CB7B944()
{
  sub_20CB83248();
  uint64_t v2 = v0;
  id v4 = v3;
  id v5 = (void *)(*MEMORY[0x263F8EED0] & *v0);
  uint64_t v6 = type metadata accessor for URL();
  sub_20CB6D4D0();
  MEMORY[0x270FA5388](v7);
  sub_20CB833D8();
  uint64_t v8 = v5[12];
  uint64_t v9 = v5[13];
  uint64_t v40 = v5[11];
  uint64_t v41 = v5[10];
  uint64_t v43 = v41;
  uint64_t v44 = v40;
  uint64_t v38 = v9;
  uint64_t v39 = v8;
  uint64_t v45 = v8;
  uint64_t v46 = v9;
  uint64_t v10 = type metadata accessor for CodeOperation.DestinationServer();
  sub_20CB6A8A4(v10);
  sub_20CB832AC();
  MEMORY[0x270FA5388](v11);
  sub_20CB833C8();
  self;
  uint64_t v12 = (void *)swift_dynamicCastObjCClassUnconditional();
  uint64_t v13 = sub_20CB78550();
  uint64_t v15 = v14;
  id v16 = v4;
  uint64_t v17 = (void *)MEMORY[0x210555430](v13, v15);
  swift_bridgeObjectRelease();
  objc_msgSend(v12, sel_setServiceName_, v17);

  uint64_t v18 = sub_20CB785A4();
  uint64_t v19 = (void *)MEMORY[0x210555430](v18);
  swift_bridgeObjectRelease();
  objc_msgSend(v12, sel_setFunctionName_, v19);

  sub_20CB78688();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  objc_msgSend(v12, sel_setRequestLocalSerializations_, isa);

  sub_20CB786D8();
  Class v21 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  objc_msgSend(v12, sel_setRequestLocalEnvelopes_, v21);

  sub_20CB78844((uint64_t)&v43);
  uint64_t v23 = v45;
  uint64_t v22 = v46;
  if (v47)
  {
    if (v47 == 1)
    {
      objc_msgSend(v12, sel_setDataProtectionType_, 2);
      uint64_t v24 = sub_20CB83544();
      uint64_t v25 = (void *)MEMORY[0x210555430](v24);
      swift_bridgeObjectRelease();
      objc_msgSend(v12, sel_setTrustedTargetDomain_, v25);

      uint64_t v26 = (void *)MEMORY[0x210555430](v23, v22);
      swift_bridgeObjectRelease();
      objc_msgSend(v12, sel_setTrustedTargetOID_, v26);
    }
    else
    {
      objc_msgSend(v12, sel_setDataProtectionType_, 0);
    }
  }
  else
  {
    uint64_t v27 = sub_20CB83544();
    sub_20CB64CA4(v27, v28);
    sub_20CB83544();
    id v29 = v16;
    Class v30 = Data._bridgeToObjectiveC()().super.isa;
    sub_20CB83448();
    objc_msgSend(v12, sel_setPermittedRemoteMeasurement_, v30);

    id v16 = v29;
    objc_msgSend(v12, sel_setDataProtectionType_, 1);
    sub_20CB83448();
  }
  objc_msgSend(v12, sel_setShouldSendRecordPCSKeys_, sub_20CB78BD8() & 1);
  sub_20CB785F8();
  int v31 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(v1, 2, v6);
  if (v31)
  {
    if (v31 == 1) {
      objc_msgSend(v12, sel_setLegacyIsLocalBit_, 0);
    }
    else {
      objc_msgSend(v12, sel_setLegacyIsLocalBit_, 1);
    }
  }
  else
  {
    sub_20CB83348();
    v32();
    objc_msgSend(v12, sel_setLegacyIsLocalBit_, 1);
    URL._bridgeToObjectiveC()(v33);
    uint64_t v35 = v34;
    objc_msgSend(v12, sel_setClientRuntimeProvidedServiceURL_, v34);

    uint64_t v36 = sub_20CB8346C();
    v37(v36);
  }
  objc_msgSend(v12, sel_setShouldFetchAssetContentInMemory_, sub_20CB7A5A8() & 1);
  uint64_t v43 = v41;
  uint64_t v44 = v40;
  uint64_t v45 = v39;
  uint64_t v46 = v38;
  v42.receiver = v2;
  v42.super_class = (Class)type metadata accessor for CodeOperation();
  objc_msgSendSuper2(&v42, sel_fillOutOperationInfo_, v16);

  sub_20CB83260();
}

void sub_20CB7BDCC(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  sub_20CB7B944();
}

void sub_20CB7BE34()
{
}

void sub_20CB7BE94()
{
}

id sub_20CB7BEA4(uint64_t a1)
{
  sub_20CB6CEE4(0, (unint64_t *)&unk_26ACC7090);
  objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_applyDaemonCallbackInterfaceTweaks_, a1);
  sub_20CB6CEE4(0, (unint64_t *)&unk_26ACC70A0);
  objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_applyDaemonCallbackInterfaceTweaks_, a1);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  long long v6 = *(_OWORD *)(v1 + 80);
  long long v7 = *(_OWORD *)(v1 + 96);
  id v4 = (objc_class *)(*MEMORY[0x263F8EED0] & *(void *)type metadata accessor for CodeOperation());
  v8.receiver = ObjCClassFromMetadata;
  v8.super_class = v4;
  return objc_msgSendSuper2(&v8, sel_applyDaemonCallbackInterfaceTweaks_, a1, v6, v7);
}

void sub_20CB7BF90(uint64_t a1, uint64_t a2, void *a3)
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  sub_20CB7BEA4((uint64_t)v4);
}

void sub_20CB7BFE0()
{
  sub_20CB83248();
  uint64_t v63 = v1;
  unint64_t v65 = v2;
  uint64_t v60 = v3;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v8 = *MEMORY[0x263F8EED0] & *v0;
  uint64_t v9 = v8;
  uint64_t v10 = type metadata accessor for Ckcode_ProtectedEnvelope(0);
  sub_20CB6D4D0();
  uint64_t v66 = v11;
  MEMORY[0x270FA5388](v12);
  sub_20CB6A924();
  uint64_t v13 = *(char **)(v8 + 80);
  uint64_t v14 = type metadata accessor for Optional();
  sub_20CB6A8A4(v14);
  sub_20CB832AC();
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)v58 - v16;
  sub_20CB6D4D0();
  uint64_t v19 = v18;
  MEMORY[0x270FA5388](v20);
  sub_20CB83220();
  uint64_t v59 = v21;
  sub_20CB832CC();
  MEMORY[0x270FA5388](v22);
  uint64_t v61 = (char *)v58 - v23;
  sub_20CB832CC();
  MEMORY[0x270FA5388](v24);
  uint64_t v26 = (char *)v58 - v25;
  uint64_t v62 = v0;
  sub_20CB78260();
  if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)v17, 1, (uint64_t)v13) == 1)
  {
    __break(1u);
  }
  else
  {
    v58[3] = *(void *)(v19 + 32);
    v58[4] = v19 + 32;
    sub_20CB83348();
    uint64_t v28 = v27();
    uint64_t v29 = *(void *)(v7 + 16);
    uint64_t v64 = v9;
    if (v29)
    {
      MEMORY[0x270FA5388](v28);
      v58[-2] = v5;
      uint64_t v30 = swift_bridgeObjectRetain();
      int v31 = (void *)sub_20CB85B7C(v30, (void (*)(uint64_t, uint64_t, unint64_t))sub_20CB82E58);
      swift_bridgeObjectRelease();
      uint64_t v32 = type metadata accessor for Ckcode_RecordTransport();
      uint64_t v33 = *(void *)(v64 + 96);
      uint64_t v34 = sub_20CB82E10(&qword_26ACC7138, (void (*)(uint64_t))type metadata accessor for Ckcode_RecordTransport);
      Message.substituteMessages<A>(substitutionType:substitutions:)(v31, (uint64_t)v13, v32, v33, v34, v61);
      uint64_t v35 = sub_20CB833FC();
      v36(v35);
      swift_bridgeObjectRelease();
      uint64_t v37 = v65;
      sub_20CB83348();
      v38();
      if (*MEMORY[0x263EFD8A0])
      {
        uint64_t v39 = (void (*)(char *))sub_20CB7AA0C();
        if (v39)
        {
          uint64_t v40 = (uint64_t)v39;
          v39(v26);
          sub_20CB6B280(v40);
        }
      }
    }
    else
    {
      uint64_t v37 = v65;
    }
    uint64_t v41 = *(void *)(v60 + 16);
    if (v41)
    {
      v58[1] = v26;
      v58[2] = v19;
      uint64_t v61 = v13;
      uint64_t v67 = (void *)MEMORY[0x263F8EE78];
      uint64_t v42 = v60;
      sub_20CB90A14();
      uint64_t v44 = (unint64_t *)(v42 + 40);
      do
      {
        uint64_t v45 = *(v44 - 1);
        unint64_t v46 = *v44;
        MEMORY[0x270FA5388](v43);
        v58[-2] = v45;
        v58[-1] = v46;
        sub_20CB64CA4(v45, v46);
        uint64_t v47 = sub_20CB82E10(&qword_26ACC7180, (void (*)(uint64_t))type metadata accessor for Ckcode_ProtectedEnvelope);
        static Message.with(_:)();
        sub_20CB64DC8(v45, v46);
        id v48 = v67;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_20CB90A14();
          id v48 = v67;
        }
        unint64_t v49 = v48[2];
        if (v49 >= v48[3] >> 1)
        {
          sub_20CB90A14();
          id v48 = v67;
        }
        v44 += 2;
        v48[2] = v49 + 1;
        sub_20CB8342C();
        uint64_t v43 = sub_20CB82E7C();
        --v41;
      }
      while (v41);
      Message.substituteMessages<A>(substitutionType:substitutions:)(v48, (uint64_t)v61, v10, *(void *)(v64 + 96), v47, v59);
      uint64_t v50 = sub_20CB833FC();
      v51(v50);
      swift_release();
      sub_20CB83348();
      v52();
      uint64_t v37 = v65;
    }
    sub_20CB85B74();
    uint64_t v53 = Message.serializedData(partial:)();
    unint64_t v55 = v54;
    sub_20CB64CA4(v53, v54);
    v37(v53, v55, 0);
    sub_20CB64DC8(v53, v55);
    sub_20CB64DC8(v53, v55);
    uint64_t v56 = sub_20CB834D0();
    v57(v56);
    sub_20CB83260();
  }
}

uint64_t sub_20CB7C640()
{
  return static Message.with(_:)();
}

uint64_t sub_20CB7C700(uint64_t *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = a3 | 0x2000000000000000;
  uint64_t v10 = *a1;
  uint64_t v11 = a1[1];
  sub_20CB64CA4(a2, a3);
  uint64_t result = sub_20CB6BEB4(v10, v11);
  *a1 = a2;
  a1[1] = v9;
  if (*(void *)(a5 + 16) > a4)
  {
    if (a4 < 0)
    {
      __break(1u);
    }
    else
    {
      sub_20CB6C244(a5 + 32 * a4 + 32, (uint64_t)v16);
      uint64_t result = swift_dynamicCast();
      if (result)
      {
        uint64_t v13 = (char *)a1 + *(int *)(type metadata accessor for Ckcode_RecordTransport() + 24);
        uint64_t result = sub_20CB64DB4(*(void *)v13, *((void *)v13 + 1));
        *(void *)uint64_t v13 = v14;
        *((void *)v13 + 1) = v15;
      }
    }
  }
  return result;
}

uint64_t sub_20CB7C7E4(uint64_t *a1, uint64_t a2, unint64_t a3)
{
  sub_20CB80DA0((uint64_t)a1);
  *a1 = a2;
  a1[1] = a3;
  uint64_t v6 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
  swift_storeEnumTagMultiPayload();
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)a1, 0, 1, v6);
  return sub_20CB64CA4(a2, a3);
}

void sub_20CB7C868()
{
  sub_20CB83248();
  uint64_t v83 = v2;
  uint64_t v84 = v1;
  unint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v7 = *MEMORY[0x263F8EED0] & *v0;
  uint64_t v81 = type metadata accessor for Ckcode_RecordTransport();
  sub_20CB6D4D0();
  uint64_t v79 = v8;
  MEMORY[0x270FA5388](v9);
  sub_20CB83220();
  uint64_t v78 = v10;
  sub_20CB832CC();
  MEMORY[0x270FA5388](v11);
  uint64_t v86 = (_OWORD *)((char *)&v69 - v12);
  sub_20CB832CC();
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (uint64_t *)((char *)&v69 - v14);
  uint64_t v16 = *(void *)(v7 + 88);
  type metadata accessor for Optional();
  sub_20CB6D4D0();
  uint64_t v76 = v18;
  uint64_t v77 = v17;
  sub_20CB832AC();
  MEMORY[0x270FA5388](v19);
  uint64_t v80 = (char *)&v69 - v20;
  uint64_t v21 = type metadata accessor for BinaryDecodingOptions();
  uint64_t v22 = sub_20CB6A8A4(v21);
  MEMORY[0x270FA5388](v22);
  sub_20CB6A924();
  sub_20CB6D4D0();
  uint64_t v82 = v23;
  MEMORY[0x270FA5388](v24);
  sub_20CB83220();
  uint64_t v87 = v25;
  sub_20CB832CC();
  MEMORY[0x270FA5388](v26);
  uint64_t v28 = (char *)&v69 - v27;
  uint64_t v91 = v6;
  unint64_t v92 = v4;
  uint64_t v90 = 0;
  long long v88 = 0u;
  long long v89 = 0u;
  id v85 = v0;
  uint64_t v29 = *(void *)(v7 + 104);
  sub_20CB834E4();
  sub_20CB85B74();
  sub_20CB64CA4(v6, v4);
  sub_20CB834E4();
  j___s21InternalSwiftProtobuf21BinaryDecodingOptionsVACycfC();
  uint64_t v30 = v28;
  Message.init<A>(serializedBytes:extensions:partial:options:)();
  uint64_t v32 = v79;
  uint64_t v31 = (uint64_t)v80;
  uint64_t v33 = v82;
  uint64_t v34 = v82 + 16;
  uint64_t v70 = *(void (**)(char *, char *, uint64_t))(v82 + 16);
  v70(v80, v30, v16);
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v31, 0, 1, v16);
  sub_20CB784AC();
  uint64_t v35 = v16;
  uint64_t v73 = sub_20CB82E10(&qword_26ACC7138, (void (*)(uint64_t))type metadata accessor for Ckcode_RecordTransport);
  uint64_t v36 = sub_20CB6CF5C(v81, v16, v81, v29, v73);
  uint64_t v72 = 0;
  uint64_t v74 = v29;
  uint64_t v37 = *(void *)(v36 + 16);
  uint64_t v75 = v35;
  uint64_t v38 = v86;
  uint64_t v39 = v87;
  if (v37)
  {
    uint64_t v69 = v34;
    id v71 = v30;
    sub_20CB8342C();
    uint64_t v42 = v40 + v41;
    uint64_t v43 = *(void *)(v32 + 72);
    uint64_t v44 = (char *)MEMORY[0x263F8EE78];
    while (1)
    {
      sub_20CB80CE8();
      uint64_t v45 = *v15;
      uint64_t v46 = v15[1];
      sub_20CB7B72C(*v15, v46);
      sub_20CB80E00((uint64_t)v15, (void (*)(void))type metadata accessor for Ckcode_RecordTransport);
      if ((~v46 & 0x3000000000000000) == 0) {
        break;
      }
      if ((v46 & 0x2000000000000000) == 0)
      {
        sub_20CB6BEB4(v45, v46);
        break;
      }
      sub_20CB6C1EC(v45, v46);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        uint64_t v50 = (char *)sub_20CB832F4();
        uint64_t v44 = sub_20CB80BF8(v50, v51, v52, (uint64_t)v44);
      }
      unint64_t v48 = *((void *)v44 + 2);
      unint64_t v47 = *((void *)v44 + 3);
      if (v48 >= v47 >> 1) {
        uint64_t v44 = sub_20CB80BF8((char *)(v47 > 1), v48 + 1, 1, (uint64_t)v44);
      }
      *((void *)v44 + 2) = v48 + 1;
      unint64_t v49 = &v44[16 * v48];
      *((void *)v49 + 4) = v45;
      *((void *)v49 + 5) = v46 & 0xDFFFFFFFFFFFFFFFLL;
      sub_20CB6BEB4(v45, v46);
      v42 += v43;
      --v37;
      uint64_t v38 = v86;
      uint64_t v39 = v87;
      if (!v37)
      {
        swift_bridgeObjectRelease();
        uint64_t v33 = v82;
        uint64_t v30 = v71;
        goto LABEL_14;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_20CB83314();
    id v53 = (id)related decl 'e' for CKErrorCode.init(_:description:)();
    unint64_t v54 = (void *)_convertErrorToNSError(_:)();

    objc_msgSend(v85, sel_finishWithError_, v54);
    id v55 = v53;
    v84(0, v53);

    sub_20CB832A0();
    v56();
    goto LABEL_19;
  }
  swift_bridgeObjectRelease();
  uint64_t v44 = (char *)MEMORY[0x263F8EE78];
LABEL_14:
  _OWORD *v38 = xmmword_20CB96B40;
  uint64_t v57 = v81;
  UnknownStorage.init()();
  *(_OWORD *)((char *)v38 + *(int *)(v57 + 24)) = xmmword_20CB96470;
  uint64_t v58 = v78;
  sub_20CB80CE8();
  uint64_t v59 = (void *)sub_20CB85D14(v58, *((void *)v44 + 2));
  uint64_t v60 = v39;
  uint64_t v61 = v75;
  uint64_t v62 = v72;
  Message.substituteMessages<A>(substitutionType:substitutions:)(v59, v75, v57, v74, v73, v60);
  swift_bridgeObjectRelease();
  uint64_t v63 = v84;
  if (!v62)
  {
    if (*((void *)v44 + 2))
    {
      uint64_t v64 = sub_20CB7A7D8();
      if (v64)
      {
        unint64_t v65 = (void (*)(uint64_t))v64;
        uint64_t v66 = (uint64_t)v80;
        v70(v80, v87, v61);
        _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v66, 0, 1, v61);
        v65(v66);
        uint64_t v67 = sub_20CB6A8B0();
        sub_20CB6B280(v67);
        (*(void (**)(uint64_t, uint64_t))(v76 + 8))(v66, v77);
      }
    }
    v63(v44, 0);
    swift_bridgeObjectRelease();
    id v68 = *(void (**)(char *, uint64_t))(v33 + 8);
    v68(v87, v61);
    sub_20CB80E00((uint64_t)v86, (void (*)(void))type metadata accessor for Ckcode_RecordTransport);
    v68(v30, v61);
LABEL_19:
    sub_20CB83260();
    return;
  }
  sub_20CB83290();
  swift_unexpectedError();
  __break(1u);
}

void sub_20CB7CF90()
{
  sub_20CB83248();
  sub_20CB83194();
  uint64_t v53 = v1;
  uint64_t v62 = v0;
  unint64_t v3 = *(void *)(v2 + 88);
  sub_20CB6D4D0();
  uint64_t v5 = v4;
  sub_20CB832AC();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v48 - v7;
  uint64_t v9 = type metadata accessor for Optional();
  sub_20CB6D4D0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  sub_20CB6A8BC();
  uint64_t v15 = (void *)(v13 - v14);
  MEMORY[0x270FA5388](v16);
  uint64_t v58 = (char *)&v48 - v17;
  sub_20CB832CC();
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v48 - v19;
  type metadata accessor for Ckcode_RecordTransport();
  sub_20CB6D4D0();
  MEMORY[0x270FA5388](v21);
  sub_20CB6A8BC();
  uint64_t v23 = (char *)MEMORY[0x270FA5388](v22);
  uint64_t v26 = (uint64_t *)((char *)&v48 - v25);
  if (v24 >> 62)
  {
LABEL_19:
    uint64_t v50 = v23;
    int64_t v51 = v8;
    unint64_t v61 = v24;
    swift_bridgeObjectRetain();
    uint64_t v8 = v51;
    uint64_t v59 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    uint64_t v27 = v59;
    uint64_t v23 = v50;
    unint64_t v24 = v61;
    if (!v59) {
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v27 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v27) {
      goto LABEL_17;
    }
  }
  uint64_t v50 = v23;
  int64_t v51 = v8;
  uint64_t v49 = v5;
  unint64_t v54 = v20;
  uint64_t v55 = v11;
  char v52 = v15;
  uint64_t v56 = v9;
  unint64_t v57 = v3;
  unint64_t v60 = v24 & 0xC000000000000001;
  unint64_t v61 = v24;
  uint64_t v59 = v27;
  swift_bridgeObjectRetain();
  uint64_t v9 = 0;
  uint64_t v15 = (void *)MEMORY[0x263F8EE78];
  uint64_t v5 = 4;
  do
  {
    uint64_t v8 = (char *)(v5 - 4);
    if (v60) {
      uint64_t v23 = (char *)MEMORY[0x2105556F0](v5 - 4, v61);
    }
    else {
      uint64_t v23 = (char *)*(id *)(v61 + 8 * v5);
    }
    uint64_t v20 = v23;
    uint64_t v11 = v5 - 3;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_19;
    }
    sub_20CB7D4E0(v23);
    uint64_t v28 = v20;
    Ckcode_RecordTransport.init(_:)(v28, v26);
    sub_20CB80CE8();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      char v30 = sub_20CB832F4();
      uint64_t v15 = (void *)sub_20CB80E54(v30, v31, v32, (uint64_t)v15);
    }
    unint64_t v3 = v15[2];
    unint64_t v29 = v15[3];
    if (v3 >= v29 >> 1)
    {
      char v33 = sub_20CB834F8(v29);
      uint64_t v15 = (void *)sub_20CB80E54(v33, v34, v35, (uint64_t)v15);
    }
    long long v15[2] = v3 + 1;
    sub_20CB8342C();
    sub_20CB82E7C();

    sub_20CB80E00((uint64_t)v26, (void (*)(void))type metadata accessor for Ckcode_RecordTransport);
    ++v5;
  }
  while (v11 != v59);
  swift_bridgeObjectRelease();
  uint64_t v36 = (uint64_t)v58;
  sub_20CB78408();
  uint64_t v37 = v57;
  if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(v36, 1, v57))
  {
    swift_bridgeObjectRelease();
    uint64_t v38 = v55;
    uint64_t v39 = *(void (**)(uint64_t, uint64_t))(v55 + 8);
    uint64_t v40 = v36;
    uint64_t v41 = v56;
    v39(v40, v56);
    uint64_t v42 = 1;
    uint64_t v43 = v54;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v49 + 16))(v51, v36, v37);
    uint64_t v38 = v55;
    uint64_t v39 = *(void (**)(uint64_t, uint64_t))(v55 + 8);
    uint64_t v44 = v36;
    uint64_t v41 = v56;
    v39(v44, v56);
    unint64_t v61 = *(void *)(v53 + 104);
    uint64_t v45 = sub_20CB82E10(&qword_26ACC7138, (void (*)(uint64_t))type metadata accessor for Ckcode_RecordTransport);
    uint64_t v43 = v54;
    Message.substituteMessages<A>(substitutionType:substitutions:)(v15, v37, (uint64_t)v50, v61, v45, v54);
    uint64_t v46 = sub_20CB83414();
    v47(v46);
    swift_bridgeObjectRelease();
    uint64_t v42 = 0;
  }
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)v43, v42, 1, v37);
  (*(void (**)(void *, char *, uint64_t))(v38 + 16))(v52, v43, v41);
  sub_20CB784AC();
  v39((uint64_t)v43, v41);
LABEL_17:
  sub_20CB83260();
}

void sub_20CB7D4E0(void *a1)
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend(a1, sel_recordID);
  id v64 = v1;
  sub_20CB793B8();
  uint64_t v5 = (void *)sub_20CB6A8B0();
  uint64_t v7 = sub_20CB792DC(v5, v6);

  swift_bridgeObjectRelease();
  if (!v7) {
    return;
  }
  int64_t v8 = 0;
  uint64_t v9 = v7 + 64;
  uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  else {
    uint64_t v11 = -1;
  }
  unint64_t v12 = v11 & *(void *)(v7 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v58 = a1;
  uint64_t v59 = v2;
  uint64_t v63 = v7;
  int64_t v56 = v13;
  uint64_t v57 = v7 + 64;
  if (!v12) {
    goto LABEL_7;
  }
LABEL_6:
  uint64_t v60 = (v12 - 1) & v12;
  int64_t v61 = v8;
  for (unint64_t i = __clz(__rbit64(v12)) | (v8 << 6); ; unint64_t i = __clz(__rbit64(v16)) + (v17 << 6))
  {
    uint64_t v19 = (uint64_t *)(*(void *)(v7 + 48) + 16 * i);
    uint64_t v20 = *v19;
    uint64_t v21 = (void *)v19[1];
    uint64_t v22 = *(void *)(*(void *)(v7 + 56) + 8 * i);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v62 = v20;
    uint64_t v23 = CKRecord.subscript.getter();
    int64_t v24 = 0;
    uint64_t v25 = *(void *)(v22 + 64);
    uint64_t v65 = v22 + 64;
    uint64_t v26 = 1 << *(unsigned char *)(v22 + 32);
    if (v26 < 64) {
      uint64_t v27 = ~(-1 << v26);
    }
    else {
      uint64_t v27 = -1;
    }
    unint64_t v28 = v27 & v25;
    int64_t v66 = (unint64_t)(v26 + 63) >> 6;
    if ((v27 & v25) != 0)
    {
LABEL_25:
      unint64_t v29 = __clz(__rbit64(v28));
      v28 &= v28 - 1;
      unint64_t v30 = v29 | (v24 << 6);
      goto LABEL_40;
    }
LABEL_26:
    int64_t v31 = v24 + 1;
    if (__OFADD__(v24, 1))
    {
      __break(1u);
      goto LABEL_67;
    }
    if (v31 < v66)
    {
      unint64_t v32 = *(void *)(v65 + 8 * v31);
      ++v24;
      if (v32) {
        goto LABEL_39;
      }
      int64_t v24 = v31 + 1;
      if (v31 + 1 < v66)
      {
        unint64_t v32 = *(void *)(v65 + 8 * v24);
        if (v32) {
          goto LABEL_39;
        }
        int64_t v24 = v31 + 2;
        if (v31 + 2 < v66)
        {
          unint64_t v32 = *(void *)(v65 + 8 * v24);
          if (v32) {
            goto LABEL_39;
          }
          int64_t v33 = v31 + 3;
          if (v33 < v66) {
            break;
          }
        }
      }
    }
LABEL_57:
    swift_unknownObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v7 = v63;
    int64_t v13 = v56;
    uint64_t v9 = v57;
    unint64_t v12 = v60;
    int64_t v8 = v61;
    if (v60) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v15 = v8 + 1;
    if (__OFADD__(v8, 1)) {
      goto LABEL_68;
    }
    if (v15 >= v13)
    {
LABEL_65:
      swift_release();
      return;
    }
    unint64_t v16 = *(void *)(v9 + 8 * v15);
    int64_t v17 = v8 + 1;
    if (!v16)
    {
      int64_t v17 = v8 + 2;
      if (v8 + 2 >= v13) {
        goto LABEL_65;
      }
      unint64_t v16 = *(void *)(v9 + 8 * v17);
      if (!v16)
      {
        int64_t v17 = v8 + 3;
        if (v8 + 3 >= v13) {
          goto LABEL_65;
        }
        unint64_t v16 = *(void *)(v9 + 8 * v17);
        if (!v16)
        {
          uint64_t v18 = v8 + 4;
          if (v8 + 4 >= v13) {
            goto LABEL_65;
          }
          unint64_t v16 = *(void *)(v9 + 8 * v18);
          if (!v16)
          {
            while (1)
            {
              int64_t v17 = v18 + 1;
              if (__OFADD__(v18, 1)) {
                goto LABEL_69;
              }
              if (v17 >= v13) {
                goto LABEL_65;
              }
              unint64_t v16 = *(void *)(v9 + 8 * v17);
              ++v18;
              if (v16) {
                goto LABEL_20;
              }
            }
          }
          int64_t v17 = v8 + 4;
        }
      }
    }
LABEL_20:
    uint64_t v60 = (v16 - 1) & v16;
    int64_t v61 = v17;
  }
  unint64_t v32 = *(void *)(v65 + 8 * v33);
  if (!v32)
  {
    while (1)
    {
      int64_t v24 = v33 + 1;
      if (__OFADD__(v33, 1)) {
        break;
      }
      if (v24 >= v66) {
        goto LABEL_57;
      }
      unint64_t v32 = *(void *)(v65 + 8 * v24);
      ++v33;
      if (v32) {
        goto LABEL_39;
      }
    }
LABEL_67:
    __break(1u);
LABEL_68:
    __break(1u);
LABEL_69:
    __break(1u);
LABEL_70:
    __break(1u);
  }
  int64_t v24 = v33;
LABEL_39:
  unint64_t v28 = (v32 - 1) & v32;
  unint64_t v30 = __clz(__rbit64(v32)) + (v24 << 6);
LABEL_40:
  int64_t v34 = *(void **)(*(void *)(v22 + 56) + 8 * v30);
  if (!v23) {
    goto LABEL_59;
  }
  uint64_t v35 = *(void *)(*(void *)(v22 + 48) + 8 * v30);
  self;
  uint64_t v36 = swift_dynamicCastObjCClass();
  if (!v36)
  {
    self;
    uint64_t v41 = swift_dynamicCastObjCClass();
    if (v41)
    {
      id v40 = (id)v41;
      swift_unknownObjectRetain_n();
      id v42 = v34;
      goto LABEL_47;
    }
LABEL_59:
    id v68 = 0;
    unint64_t v69 = 0xE000000000000000;
    id v53 = v34;
    _StringGuts.grow(_:)(46);
    swift_bridgeObjectRelease();
    id v68 = (id)0xD00000000000002CLL;
    unint64_t v69 = 0x800000020CB9B370;
    v54._countAndFlagsBits = v62;
    v54._object = v21;
    String.append(_:)(v54);
    swift_bridgeObjectRelease();
    related decl 'e' for CKErrorCode.init(_:description:)();
    swift_willThrow();
    swift_release();
    swift_release();
    swift_unknownObjectRelease();

    return;
  }
  uint64_t v37 = (void *)v36;
  id v38 = v34;
  swift_unknownObjectRetain();
  if (v35 < 0 || v35 >= (uint64_t)objc_msgSend(v37, sel_count))
  {
    swift_bridgeObjectRelease();
    related decl 'e' for CKErrorCode.init(_:description:)();
    swift_willThrow();
    swift_release();
    swift_release();

    swift_unknownObjectRelease_n();
    return;
  }
  id v39 = objc_msgSend(v37, sel_objectAtIndexedSubscript_, v35);
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_20CB6CEE4(0, (unint64_t *)&qword_26ACC68D0);
  swift_dynamicCast();
  id v40 = v67;
LABEL_47:
  if (*MEMORY[0x263EFD8A0]
    && (uint64_t v43 = (void *)MEMORY[0x210555430](0xD000000000000018, 0x800000020CB9B3A0),
        unsigned int v44 = objc_msgSend(v64, sel__BOOLForUnitTestOverride_defaultValue_, v43, 0),
        v43,
        v44))
  {
    swift_bridgeObjectRelease();
    objc_msgSend(v40, sel_setAssetContent_, 0);
    type metadata accessor for CKError(0);
    sub_20CB8E2CC(MEMORY[0x263F8EE78]);
    sub_20CB82E10((unint64_t *)&unk_2676F11B0, type metadata accessor for CKError);
    _BridgedStoredNSError.init(_:userInfo:)();
  }
  else
  {
    id v68 = 0;
    id v45 = objc_msgSend(v34, sel_assetContentWithExpectedSignature_verificationKey_error_, 0, 0, &v68, v56, v57, v58, v59);
    id v46 = v68;
    if (v45)
    {
      uint64_t v47 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v49 = v48;

      switch(v49 >> 62)
      {
        case 1uLL:
          uint64_t v50 = (int)v47;
          uint64_t v51 = v47 >> 32;
          goto LABEL_54;
        case 2uLL:
          uint64_t v50 = *(void *)(v47 + 16);
          uint64_t v51 = *(void *)(v47 + 24);
          goto LABEL_54;
        case 3uLL:
          goto LABEL_70;
        default:
          uint64_t v50 = 0;
          uint64_t v51 = BYTE6(v49);
LABEL_54:
          if (v50 == v51) {
            goto LABEL_70;
          }
          Class isa = Data._bridgeToObjectiveC()().super.isa;
          objc_msgSend(v40, sel_setAssetContent_, isa);

          sub_20CB64DC8(v47, v49);
          if (!v28) {
            goto LABEL_26;
          }
          goto LABEL_25;
      }
    }
    uint64_t v55 = v46;
    swift_bridgeObjectRelease();
    _convertNSErrorToError(_:)();
  }
  swift_willThrow();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
}

void sub_20CB7DC58()
{
  sub_20CB83248();
  uint64_t v1 = v0;
  unint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  sub_20CB832B8();
  uint64_t v8 = type metadata accessor for Logger();
  sub_20CB6D4D0();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  sub_20CB6A8FC();
  uint64_t v14 = v13 - v12;
  if (v7)
  {
    uint64_t v15 = sub_20CB79F68();
    if (v15)
    {
      unint64_t v16 = (void (*)(void *, id, void *))v15;
      id v17 = v7;
      if (v5)
      {
        id v18 = v5;
        sub_20CB7D4E0(v18);
      }
      id v26 = v3;
      v16(v5, v17, v3);
      sub_20CB6B280((uint64_t)v16);
    }
    else
    {
      id v24 = v7;
      id v25 = v3;
    }
    if (sub_20CB7A5A8() & 1) != 0 && (sub_20CB7A4A8())
    {
      sub_20CB83208();
      id v27 = v7;
      type metadata accessor for CodeOperation.AssetInfo();
      sub_20CB7933C(0, v27);
      swift_endAccess();
    }
    if (v3) {
      sub_20CB78778((uint64_t)v3);
    }
  }
  else
  {
    CKLog.getter();
    uint64_t v19 = v1;
    uint64_t v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      unint64_t v28 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 138412290;
      uint64_t v23 = v19;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *unint64_t v28 = v1;

      _os_log_impl(&dword_20CB63000, v20, v21, "Ignoring handleFetch with nil recordID %@", v22, 0xCu);
      sub_20CB650D0(qword_26ACC70B0);
      swift_arrayDestroy();
      sub_20CB6FE30();
      sub_20CB6FE30();
    }
    else
    {

      uint64_t v20 = v19;
    }

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v14, v8);
  }
  sub_20CB83260();
}

void (*sub_20CB7DF58(uint64_t a1, double a2))(uint64_t, double)
{
  uint64_t result = (void (*)(uint64_t, double))sub_20CB7A16C();
  if (result)
  {
    result(a1, a2);
    uint64_t v5 = sub_20CB6A8B0();
    return (void (*)(uint64_t, double))sub_20CB6B280(v5);
  }
  return result;
}

void sub_20CB7DFD4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  sub_20CB83194();
  sub_20CB83208();
  sub_20CB83304();
  type metadata accessor for CodeOperation.AssetInfo();
  sub_20CB78D24(a1, a2, a3, a4);
  uint64_t v13 = v12;
  swift_endAccess();
  sub_20CB83570();
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v13, sel_writeData_atOffset_, isa, a7);
}

void sub_20CB7E0D0()
{
  sub_20CB83248();
  uint64_t v1 = v0;
  id v69 = v2;
  uint64_t v3 = *(void *)((*MEMORY[0x263F8EED0] & *v0) + 0x58);
  type metadata accessor for Optional();
  sub_20CB6D4D0();
  uint64_t v64 = v5;
  uint64_t v65 = v4;
  MEMORY[0x270FA5388](v4);
  sub_20CB6A8BC();
  uint64_t v8 = v6 - v7;
  MEMORY[0x270FA5388](v9);
  uint64_t v60 = (char *)&v57 - v10;
  uint64_t v62 = v3;
  uint64_t v59 = *(void *)(v3 - 8);
  sub_20CB832AC();
  MEMORY[0x270FA5388](v11);
  uint64_t v58 = (char *)&v57 - v12;
  type metadata accessor for Logger();
  sub_20CB6D4D0();
  uint64_t v67 = v14;
  uint64_t v68 = v13;
  MEMORY[0x270FA5388](v13);
  sub_20CB83220();
  int64_t v66 = v15;
  sub_20CB832CC();
  MEMORY[0x270FA5388](v16);
  id v18 = (char *)&v57 - v17;
  CKLog.getter();
  uint64_t v19 = v1;
  uint64_t v20 = Logger.logObject.getter();
  os_log_type_t v21 = static os_log_type_t.info.getter();
  BOOL v22 = os_log_type_enabled(v20, v21);
  uint64_t v63 = v8;
  if (v22)
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    id v24 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v23 = 138412290;
    uint64_t v57 = v23 + 4;
    uint64_t v70 = v19;
    int64_t v61 = v1;
    id v25 = v19;
    uint64_t v1 = v61;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *id v24 = v1;

    _os_log_impl(&dword_20CB63000, v20, v21, "In CodeOperation._finishOnCallbackQueueWithError() for %@", v23, 0xCu);
    sub_20CB650D0(qword_26ACC70B0);
    swift_arrayDestroy();
    sub_20CB6FE30();
    sub_20CB6FE30();
  }
  else
  {

    uint64_t v20 = v19;
  }

  id v26 = (void (*)(char *, uint64_t))v67[1];
  v26(v18, v68);
  uint64_t v27 = sub_20CB7A3A0();
  if (v27)
  {
    unint64_t v28 = (void (*)(uint64_t, id))v27;
    id v29 = v69;
    if (v69 || (id v29 = sub_20CB78728()) != 0)
    {
      id v30 = v69;
      id v31 = v29;
      unint64_t v32 = (void *)_convertErrorToNSError(_:)();

      uint64_t v33 = v63;
      _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v63, 1, 1, v62);
      id v34 = objc_msgSend(v32, sel_CKClientSuitableError);
      v28(v33, v34);
      sub_20CB6B280((uint64_t)v28);

      sub_20CB832A0();
      v35();
    }
    else
    {
      uint64_t v41 = (uint64_t)v60;
      sub_20CB78408();
      uint64_t v42 = v62;
      int v43 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(v41, 1, v62);
      uint64_t v44 = v63;
      if (v43 == 1)
      {
        uint64_t v45 = v65;
        id v46 = *(void (**)(uint64_t, uint64_t))(v64 + 8);
        v46(v41, v65);
        sub_20CB8357C();
        _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v47, v48, v49, v42);
        uint64_t v50 = (void *)related decl 'e' for CKErrorCode.init(_:description:)();
        v28(v44, v50);
        sub_20CB6B280((uint64_t)v28);

        v46(v44, v45);
        id v69 = 0;
      }
      else
      {
        char v52 = v58;
        uint64_t v51 = v59;
        sub_20CB83348();
        v53();
        (*(void (**)(uint64_t, char *, uint64_t))(v51 + 16))(v44, v52, v42);
        _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v44, 0, 1, v42);
        v28(v44, 0);
        sub_20CB6B280((uint64_t)v28);
        sub_20CB832A0();
        v54();
        uint64_t v55 = sub_20CB8346C();
        v56(v55);
      }
    }
  }
  else
  {
    CKLog.getter();
    uint64_t v36 = v19;
    uint64_t v37 = Logger.logObject.getter();
    os_log_type_t v38 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v37, v38))
    {
      int64_t v61 = v1;
      id v39 = (uint8_t *)swift_slowAlloc();
      uint64_t v67 = (void *)swift_slowAlloc();
      *(_DWORD *)id v39 = 138412290;
      uint64_t v70 = v36;
      id v40 = v36;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v67 = v61;

      _os_log_impl(&dword_20CB63000, v37, v38, "In CodeOperation._finishOnCallbackQueueWithError(), no completion block set for %@", v39, 0xCu);
      sub_20CB650D0(qword_26ACC70B0);
      swift_arrayDestroy();
      sub_20CB6FE30();
      sub_20CB6FE30();
    }
    else
    {

      uint64_t v37 = v36;
    }

    v26(v66, v68);
  }
  sub_20CB7E6F4(v19, (uint64_t)v69);
  sub_20CB83260();
}

void sub_20CB7E6F4(void *a1, uint64_t a2)
{
  uint64_t v3 = *MEMORY[0x263F8EED0] & *a1;
  if (a2) {
    uint64_t v4 = (void *)_convertErrorToNSError(_:)();
  }
  else {
    uint64_t v4 = 0;
  }
  long long v5 = *(_OWORD *)(v3 + 80);
  long long v6 = *(_OWORD *)(v3 + 96);
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for CodeOperation();
  objc_msgSendSuper2(&v7, sel__finishOnCallbackQueueWithError_, v4, v5, v6);
}

void sub_20CB7E7A4(void *a1, uint64_t a2, void *a3)
{
  id v4 = a1;
  id v5 = a3;
  sub_20CB7E0D0();
}

double sub_20CB7E7FC@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_20CB78CD8();
  if (v2)
  {
    uint64_t v3 = v2;
    sub_20CB83304();
    *(void *)(a1 + 24) = type metadata accessor for CodeOperation.CallbackRelay();
    *(void *)a1 = v3;
  }
  else
  {
    double result = 0.0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  return result;
}

id sub_20CB7E890()
{
  sub_20CB7E7FC((uint64_t)v7);
  uint64_t v0 = v8;
  if (v8)
  {
    uint64_t v1 = sub_20CB6F898(v7, v8);
    uint64_t v2 = *(void *)(v0 - 8);
    MEMORY[0x270FA5388](v1);
    id v4 = (char *)v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v2 + 16))(v4);
    id v5 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v0);
    sub_20CB6C1F4((uint64_t)v7);
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

void sub_20CB7E9C4()
{
}

id sub_20CB7E9D4(void *a1)
{
  uint64_t v3 = *MEMORY[0x263F8EED0] & *v1;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  long long v6 = *(_OWORD *)(v3 + 80);
  long long v7 = *(_OWORD *)(v3 + 96);
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for CodeOperation.CallbackRelay();
  id v4 = objc_msgSendSuper2(&v8, sel_init, v6, v7);

  return v4;
}

uint64_t sub_20CB7EA8C()
{
  v1[18] = v0;
  uint64_t v2 = sub_20CB650D0(&qword_2676F1170);
  v1[19] = v2;
  v1[20] = *(void *)(v2 - 8);
  v1[21] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_20CB7EB50, 0, 0);
}

void sub_20CB7EB50()
{
}

uint64_t sub_20CB7EB8C(void *a1)
{
  v1[22] = a1;
  if (a1)
  {
    uint64_t v2 = a1;
    uint64_t v3 = v1[19];
    v1[2] = v1;
    v1[3] = sub_20CB7ECC0;
    swift_continuation_init();
    v1[17] = v3;
    sub_20CB6FB90(v1 + 14);
    sub_20CB650D0(qword_26ACC6BD0);
    sub_20CB83518();
    uint64_t v4 = sub_20CB8332C();
    v5(v4);
    v1[10] = MEMORY[0x263EF8330];
    v1[11] = 1107296256;
    v1[12] = sub_20CB85E80;
    v1[13] = &unk_26C1C3CC0;
    objc_msgSend(v2, sel_handleWillStart_, v1 + 10);
    a1 = v1 + 2;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA23F0](a1);
}

uint64_t sub_20CB7ECC0()
{
  sub_20CB6CF44();
  sub_20CB6CF20();
  sub_20CB6CF50();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  uint64_t v4 = *(void *)(v3 + 48);
  *(void *)(v1 + 184) = v4;
  if (v4) {
    id v5 = sub_20CB830D4;
  }
  else {
    id v5 = sub_20CB830DC;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_20CB7EDA4(void *a1, int a2, void *aBlock)
{
  return sub_20CB7F288(a1, a2, aBlock);
}

uint64_t sub_20CB7EDC4(const void *a1, void *a2)
{
  long long v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  uint64_t v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  void *v4 = v2;
  v4[1] = sub_20CB83068;
  return sub_20CB7EA8C();
}

uint64_t sub_20CB7EE6C()
{
  v1[18] = v0;
  uint64_t v2 = sub_20CB650D0(&qword_2676F1170);
  v1[19] = v2;
  v1[20] = *(void *)(v2 - 8);
  v1[21] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_20CB7EF30, 0, 0);
}

void sub_20CB7EF30()
{
}

uint64_t sub_20CB7EF6C(void *a1)
{
  v1[22] = a1;
  if (a1)
  {
    uint64_t v2 = a1;
    uint64_t v3 = v1[19];
    v1[2] = v1;
    v1[3] = sub_20CB7F0A0;
    swift_continuation_init();
    v1[17] = v3;
    sub_20CB6FB90(v1 + 14);
    sub_20CB650D0(qword_26ACC6BD0);
    sub_20CB83518();
    uint64_t v4 = sub_20CB8332C();
    v5(v4);
    v1[10] = MEMORY[0x263EF8330];
    v1[11] = 1107296256;
    v1[12] = sub_20CB85E80;
    v1[13] = &unk_26C1C3C98;
    objc_msgSend(v2, sel_handleDidStart_, v1 + 10);
    a1 = v1 + 2;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA23F0](a1);
}

uint64_t sub_20CB7F0A0()
{
  sub_20CB6CF44();
  sub_20CB6CF20();
  sub_20CB6CF50();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  uint64_t v4 = *(void *)(v3 + 48);
  *(void *)(v1 + 184) = v4;
  if (v4) {
    id v5 = sub_20CB7F1EC;
  }
  else {
    id v5 = sub_20CB7F184;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_20CB7F184()
{
  sub_20CB6CF44();

  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_20CB7F1EC()
{
  uint64_t v1 = *(void **)(v0 + 176);
  swift_willThrow();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_20CB7F268(void *a1, int a2, void *aBlock)
{
  return sub_20CB7F288(a1, a2, aBlock);
}

uint64_t sub_20CB7F288(void *a1, int a2, void *aBlock)
{
  uint64_t v4 = _Block_copy(aBlock);
  sub_20CB8349C();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = a1;
  id v6 = a1;
  uint64_t v7 = sub_20CB6A8B0();
  return sub_20CB85F88(v7, v8);
}

uint64_t sub_20CB7F2EC(const void *a1, void *a2)
{
  long long v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  uint64_t v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  void *v4 = v2;
  v4[1] = sub_20CB7F394;
  return sub_20CB7EE6C();
}

uint64_t sub_20CB7F394()
{
  uint64_t v2 = v0;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1;
  sub_20CB6CF50();
  uint64_t *v5 = v4;
  uint64_t v6 = *(void **)(v3 + 16);
  uint64_t v7 = *v1;
  uint64_t *v5 = *v1;
  swift_task_dealloc();

  uint64_t v8 = *(void *)(v3 + 24);
  if (v2)
  {
    uint64_t v9 = (void *)_convertErrorToNSError(_:)();

    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
  }
  _Block_release(*(const void **)(v4 + 24));
  uint64_t v10 = *(uint64_t (**)(void))(v7 + 8);
  return v10();
}

void sub_20CB7F514()
{
}

void sub_20CB7F520(void *a1)
{
}

void sub_20CB7F544()
{
}

void sub_20CB7F568()
{
}

void sub_20CB7F574(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  a1;
  sub_20CB7F568();
}

void sub_20CB7F5B0()
{
}

void sub_20CB7F5DC()
{
}

void sub_20CB7F5E8()
{
}

void sub_20CB7F60C(void *a1)
{
  if (a1)
  {
    objc_msgSend(a1, *v2, v1);
  }
  else
  {
    __break(1u);
  }
}

void sub_20CB7F64C(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  a1;
  sub_20CB7F5DC();
}

void sub_20CB7F688()
{
}

void sub_20CB7F6B4()
{
}

void sub_20CB7F6E0(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  if (a1)
  {
    v27[4] = v24;
    v27[5] = v23;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 1107296256;
    v27[2] = sub_20CB86078;
    v27[3] = &unk_26C1C2D90;
    id v26 = _Block_copy(v27);
    swift_retain();
    swift_release();
    objc_msgSend(a1, sel_openFileWithOpenInfo_reply_, v22, v26);
    _Block_release(v26);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_20CB7F790(void *a1, int a2, void *a3, void *a4)
{
  return sub_20CB7F8D4(a1, a2, a3, a4, (uint64_t)&unk_26C1C3DE8, (uint64_t)sub_20CB82BB0, (void (*)(id, uint64_t, uint64_t))sub_20CB7F6B4);
}

void sub_20CB7F7C4()
{
}

void sub_20CB7F7F0(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  if (a1)
  {
    v27[4] = v24;
    v27[5] = v23;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 1107296256;
    v27[2] = sub_20CB86154;
    v27[3] = &unk_26C1C2D68;
    id v26 = _Block_copy(v27);
    swift_retain();
    swift_release();
    objc_msgSend(a1, sel_handleFinishWithAssetDownloadStagingInfo_reply_, v22, v26);
    _Block_release(v26);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_20CB7F8A0(void *a1, int a2, void *a3, void *a4)
{
  return sub_20CB7F8D4(a1, a2, a3, a4, (uint64_t)&unk_26C1C3DC0, (uint64_t)sub_20CB82BA8, (void (*)(id, uint64_t, uint64_t))sub_20CB7F7C4);
}

uint64_t sub_20CB7F8D4(void *a1, int a2, void *a3, void *aBlock, uint64_t a5, uint64_t a6, void (*a7)(id, uint64_t, uint64_t))
{
  uint64_t v11 = _Block_copy(aBlock);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  id v13 = a3;
  id v14 = a1;
  a7(v13, a6, v12);

  return swift_release();
}

void sub_20CB7F97C()
{
}

void sub_20CB7F9A0(void *a1)
{
  if (a1)
  {
    if (v2) {
      uint64_t v4 = _convertErrorToNSError(_:)();
    }
    else {
      uint64_t v4 = 0;
    }
    uint64_t v5 = (void *)v4;
    objc_msgSend(a1, sel_handleOperationDidCompleteWithMetrics_error_, v1);
  }
  else
  {
    __break(1u);
  }
}

void sub_20CB7FA08(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  a1;
  a4;
  sub_20CB7F97C();
}

void sub_20CB7FA54()
{
}

void sub_20CB7FA84()
{
}

void sub_20CB7FAB0(void *a1)
{
  if (a1)
  {
    if (v3) {
      uint64_t v5 = _convertErrorToNSError(_:)();
    }
    else {
      uint64_t v5 = 0;
    }
    id v6 = (void *)v5;
    objc_msgSend(a1, sel_handleDiscretionaryOperationShouldStart_nonDiscretionary_error_, v2 & 1, v1 & 1);
  }
  else
  {
    __break(1u);
  }
}

void sub_20CB7FB20(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
}

void sub_20CB7FB68()
{
}

void sub_20CB7FB94()
{
}

void sub_20CB7FBA0()
{
}

void sub_20CB7FBBC(void *a1)
{
  if (a1)
  {
    [a1 *v1];
  }
  else
  {
    __break(1u);
  }
}

void sub_20CB7FBF4(void *a1)
{
}

void sub_20CB7FC18()
{
}

void sub_20CB7FC3C()
{
}

void sub_20CB7FC74(void *a1)
{
  if (a1)
  {
    uint64_t v7 = (void *)MEMORY[0x210555430](v5, v4);
    void v9[4] = v3;
    v9[5] = v2;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 1107296256;
    v9[2] = sub_20CB86378;
    v9[3] = &unk_26C1C2D40;
    uint64_t v8 = _Block_copy(v9);
    swift_retain();
    swift_release();
    objc_msgSend(a1, sel_handleDaemonOperationWillStartWithClassName_isTopLevelDaemonOperation_replyBlock_, v7, v1 & 1, v8);
    _Block_release(v8);
  }
  else
  {
    __break(1u);
  }
}

void sub_20CB7FD40(void *a1, int a2, int a3, int a4, void *aBlock)
{
  id v6 = _Block_copy(aBlock);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(swift_allocObject() + 16) = v6;
  id v7 = a1;
  sub_20CB7FC3C();
}

uint64_t sub_20CB7FDD0()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

void sub_20CB7FE04()
{
}

uint64_t sub_20CB7FE18(void *a1, int a2, int a3, void *a4, void *a5)
{
  return sub_20CB7FF9C(a1, a2, a3, a4, a5, (uint64_t)&unk_26C1C3D70, (uint64_t)sub_20CB8306C, (void (*)(uint64_t, uint64_t, id, uint64_t, uint64_t))sub_20CB7FE04);
}

void sub_20CB7FE4C()
{
}

void sub_20CB7FE60()
{
}

void sub_20CB7FEA4(void *a1)
{
  if (a1)
  {
    uint64_t v9 = (void *)MEMORY[0x210555430](v7, v6);
    v11[4] = v5;
    uint64_t v11[5] = v3;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 1107296256;
    id v11[2] = sub_20CB86378;
    v11[3] = v4;
    uint64_t v10 = _Block_copy(v11);
    swift_retain();
    swift_release();
    objc_msgSend(a1, *v2, v9, v1, v10);
    _Block_release(v10);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_20CB7FF68(void *a1, int a2, int a3, void *a4, void *a5)
{
  return sub_20CB7FF9C(a1, a2, a3, a4, a5, (uint64_t)&unk_26C1C3D48, (uint64_t)sub_20CB82BA0, (void (*)(uint64_t, uint64_t, id, uint64_t, uint64_t))sub_20CB7FE4C);
}

uint64_t sub_20CB7FF9C(void *a1, int a2, int a3, void *a4, void *aBlock, uint64_t a6, uint64_t a7, void (*a8)(uint64_t, uint64_t, id, uint64_t, uint64_t))
{
  uint64_t v12 = _Block_copy(aBlock);
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v15 = v14;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v12;
  id v17 = a4;
  id v18 = a1;
  a8(v13, v15, v17, a7, v16);

  swift_bridgeObjectRelease();
  return swift_release();
}

void sub_20CB80070()
{
}

void sub_20CB800A4(void *a1)
{
  if (a1)
  {
    sub_20CB7BFE0();
  }
  else
  {
    __break(1u);
  }
}

void sub_20CB800FC(void *a1, int a2, int a3, int a4, int a5, void *aBlock)
{
  uint64_t v7 = _Block_copy(aBlock);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(swift_allocObject() + 16) = v7;
  id v8 = a1;
  sub_20CB80070();
}

uint64_t sub_20CB801C0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

void sub_20CB80208()
{
}

void sub_20CB80238(void *a1)
{
  if (a1)
  {
    sub_20CB7C868();
  }
  else
  {
    __break(1u);
  }
}

void sub_20CB8028C(void *a1, int a2, void *a3, void *aBlock)
{
  uint64_t v6 = _Block_copy(aBlock);
  id v7 = a3;
  a1;
  static Data._unconditionallyBridgeFromObjectiveC(_:)();

  *(void *)(swift_allocObject() + 16) = v6;
  sub_20CB80208();
}

void sub_20CB80324()
{
  swift_release();
  sub_20CB64DC8(v0, v1);
}

void sub_20CB80364()
{
}

void sub_20CB80380(void *a1)
{
  if (a1)
  {
    sub_20CB7CF90();
  }
  else
  {
    __break(1u);
  }
}

void sub_20CB803C0(void *a1)
{
  sub_20CB6CEE4(0, (unint64_t *)&unk_26ACC68E0);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v2 = a1;
  sub_20CB80364();
}

uint64_t sub_20CB80410()
{
  return swift_bridgeObjectRelease();
}

void sub_20CB80434()
{
}

void sub_20CB8045C(void *a1)
{
  if (a1)
  {
    sub_20CB7DC58();
  }
  else
  {
    __break(1u);
  }
}

void sub_20CB804A8(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8 = a3;
  id v9 = a4;
  a1;
  a5;
  sub_20CB80434();
}

void sub_20CB80508()
{
}

void sub_20CB80540()
{
}

void sub_20CB80564(void *a1)
{
  if (a1)
  {
    sub_20CB7DF58(v1, v2);
  }
  else
  {
    __break(1u);
  }
}

void sub_20CB805AC(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  a1;
  sub_20CB80540();
}

void sub_20CB805F4()
{
}

void sub_20CB80624()
{
}

void sub_20CB80664(void *a1)
{
  if (a1)
  {
    sub_20CB7DFD4(v7, v6, v5, v4, v3, v2, v1);
  }
  else
  {
    __break(1u);
  }
}

void sub_20CB806C8(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v9 = a3;
  id v10 = a6;
  a1;
  static Data._unconditionallyBridgeFromObjectiveC(_:)();

  sub_20CB80624();
}

uint64_t sub_20CB8075C()
{
  sub_20CB64DC8(v2, v3);

  return swift_bridgeObjectRelease();
}

void sub_20CB807A0()
{
}

void sub_20CB807D0()
{
}

id sub_20CB807F4()
{
  return sub_20CB808A8();
}

uint64_t sub_20CB8080C(uint64_t a1)
{
  return MEMORY[0x270FA05E8](a1 + qword_2676F10D0);
}

id CodeOperation.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void CodeOperation.init()()
{
}

void sub_20CB80880()
{
}

id CodeOperation.__deallocating_deinit()
{
  return sub_20CB808A8();
}

id sub_20CB808A8()
{
  uint64_t v1 = sub_20CB83304();
  v4.receiver = v0;
  v4.super_class = (Class)v2(v1);
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t sub_20CB80920(uint64_t a1)
{
  type metadata accessor for Optional();
  sub_20CB6A86C();
  sub_20CB832A0();
  v2();
  sub_20CB830E0();
  type metadata accessor for Optional();
  sub_20CB6A86C();
  sub_20CB832A0();
  v3();
  sub_20CB830E0();
  swift_bridgeObjectRelease();
  sub_20CB830E0();
  swift_bridgeObjectRelease();
  sub_20CB830E0();
  type metadata accessor for CodeOperation.DestinationServer();
  sub_20CB6A86C();
  sub_20CB832A0();
  v8(v4, v5, v6, v7);
  sub_20CB830E0();
  swift_bridgeObjectRelease();
  sub_20CB830E0();
  swift_bridgeObjectRelease();
  sub_20CB830E0();

  sub_20CB830E0();
  sub_20CB798B4(*(void *)(a1 + *(void *)(v10 + 176)), *(void *)(a1 + *(void *)(v10 + 176) + 8), *(void *)(a1 + *(void *)(v10 + 176) + 16), *(void *)(a1 + *(void *)(v10 + 176) + 24), *(unsigned char *)(a1 + *(void *)(v10 + 176) + 32));
  sub_20CB830E0();

  sub_20CB830E0();
  swift_bridgeObjectRelease();
  sub_20CB830E0();
  sub_20CB6B280(*(void *)(a1 + *(void *)(v12 + 208)));
  sub_20CB830E0();
  sub_20CB6B280(*(void *)(a1 + *(void *)(v13 + 216)));
  sub_20CB830E0();
  sub_20CB6B280(*(void *)(a1 + *(void *)(v14 + 224)));
  sub_20CB830E0();
  sub_20CB6B280(*(void *)(a1 + *(void *)(v15 + 248)));
  sub_20CB830E0();
  return sub_20CB6B280(*(void *)(a1 + *(void *)(v16 + 256)));
}

char *sub_20CB80BF8(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  if (v9)
  {
    sub_20CB650D0((uint64_t *)&unk_26ACC6A90);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  if (v5)
  {
    sub_20CB812C8((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_20CB81070(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_20CB80CE8()
{
  uint64_t v1 = sub_20CB83588();
  v2(v1);
  sub_20CB6A86C();
  sub_20CB83550();
  v3();
  return v0;
}

uint64_t sub_20CB80D38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_20CB650D0((uint64_t *)&unk_26ACC7170);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20CB80DA0(uint64_t a1)
{
  uint64_t v2 = sub_20CB650D0((uint64_t *)&unk_26ACC7170);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20CB80E00(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_20CB6A86C();
  sub_20CB832A0();
  v3();
  return a1;
}

uint64_t sub_20CB80E54(char a1, int64_t a2, char a3, uint64_t a4)
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
        goto LABEL_24;
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
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  sub_20CB650D0(&qword_26ACC68F0);
  uint64_t v10 = *(void *)(type metadata accessor for Ckcode_RecordTransport() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_24:
    sub_20CB83234();
    sub_20CB83538();
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  type metadata accessor for Ckcode_RecordTransport();
  sub_20CB8342C();
  unint64_t v17 = (unint64_t)v13 + v16;
  if (a1)
  {
    sub_20CB8138C(a4 + v16, v8, v17, (void (*)(void))type metadata accessor for Ckcode_RecordTransport);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_20CB81168(0, v8, v17, a4);
  }
  return (uint64_t)v13;
}

uint64_t sub_20CB81070(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_20CB81168(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(type metadata accessor for Ckcode_RecordTransport() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v12;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *sub_20CB812C8(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

void sub_20CB8135C(unint64_t a1, uint64_t a2, unint64_t a3)
{
}

void sub_20CB81374(unint64_t a1, uint64_t a2, unint64_t a3)
{
}

void sub_20CB8138C(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(void))
{
  if (a2 < 0)
  {
    sub_20CB83234();
    sub_20CB83538();
    uint64_t v9 = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
_swift_arrayInitWithTakeBackToFront:
    MEMORY[0x270FA01D0](v9);
    return;
  }
  if (a3 < a1 || (a4(0), sub_20CB6A86C(), a1 + *(void *)(v8 + 72) * a2 <= a3))
  {
    a4(0);
    uint64_t v10 = sub_20CB834BC();
    MEMORY[0x270FA01D8](v10);
  }
  else if (a3 != a1)
  {
    uint64_t v9 = sub_20CB834BC();
    goto _swift_arrayInitWithTakeBackToFront;
  }
}

uint64_t sub_20CB81498(uint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_20CB814C8(a1, a2, a3);
}

uint64_t sub_20CB814B0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_20CB814C8(a1, a2, a3);
}

uint64_t sub_20CB814C8(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0
    || ((sub_20CB83354(), v6(0), sub_20CB6A86C(), uint64_t v8 = *(void *)(v7 + 72) * v3, v9 = a3 + v8, v10 = v4 + v8, v9 > v4)
      ? (BOOL v11 = v10 > a3)
      : (BOOL v11 = 0),
        v11))
  {
    sub_20CB83234();
    sub_20CB83538();
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_20CB815B8()
{
  return sub_20CB78260();
}

uint64_t sub_20CB81608@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_20CB78BD8();
  *a1 = result & 1;
  return result;
}

uint64_t sub_20CB81638(char *a1)
{
  return sub_20CB78C24(*a1);
}

uint64_t sub_20CB81698@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_20CB7A4A8();
  *a1 = result & 1;
  return result;
}

uint64_t sub_20CB816C8(char *a1)
{
  return sub_20CB7A4F4(*a1);
}

uint64_t sub_20CB816F8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_20CB7A5A8();
  *a1 = result & 1;
  return result;
}

uint64_t sub_20CB81728(char *a1)
{
  return sub_20CB7A5F4(*a1);
}

uint64_t sub_20CB8177C()
{
  uint64_t result = type metadata accessor for Optional();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for Optional();
    if (v2 <= 0x3F)
    {
      uint64_t result = type metadata accessor for CodeOperation.DestinationServer();
      if (v3 <= 0x3F) {
        return swift_initClassMetadata2();
      }
    }
  }
  return result;
}

uint64_t method lookup function for CodeOperation(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CodeOperation);
}

uint64_t dispatch thunk of CodeOperation.request.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of CodeOperation.request.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of CodeOperation.request.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of CodeOperation.dataProtectionType.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of CodeOperation.dataProtectionType.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of CodeOperation.dataProtectionType.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of CodeOperation.permittedRemoteMeasurement.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of CodeOperation.permittedRemoteMeasurement.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of CodeOperation.permittedRemoteMeasurement.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1F0))();
}

uint64_t dispatch thunk of CodeOperation.shouldSendRecordPCSKeys.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1F8))();
}

uint64_t dispatch thunk of CodeOperation.shouldSendRecordPCSKeys.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x200))();
}

uint64_t dispatch thunk of CodeOperation.shouldSendRecordPCSKeys.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x208))();
}

uint64_t dispatch thunk of CodeOperation.__allocating_init(service:functionName:request:destinationServer:)()
{
  return (*(uint64_t (**)(void))(v0 + 576))();
}

uint64_t dispatch thunk of CodeOperation.__allocating_init(serviceName:functionName:request:local:)()
{
  return (*(uint64_t (**)(void))(v0 + 584))();
}

uint64_t dispatch thunk of CodeOperation.perRecordCompletionBlock.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x250))();
}

uint64_t dispatch thunk of CodeOperation.perRecordCompletionBlock.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x258))();
}

uint64_t dispatch thunk of CodeOperation.perRecordCompletionBlock.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x260))();
}

uint64_t dispatch thunk of CodeOperation.perRecordProgressBlock.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x268))();
}

uint64_t dispatch thunk of CodeOperation.perRecordProgressBlock.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x270))();
}

uint64_t dispatch thunk of CodeOperation.perRecordProgressBlock.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x278))();
}

uint64_t dispatch thunk of CodeOperation.codeOperationCompletionBlock.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x280))();
}

uint64_t dispatch thunk of CodeOperation.codeOperationCompletionBlock.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x288))();
}

uint64_t dispatch thunk of CodeOperation.codeOperationCompletionBlock.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x290))();
}

uint64_t dispatch thunk of CodeOperation.dropInMemoryAssetContentASAP.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x298))();
}

uint64_t dispatch thunk of CodeOperation.dropInMemoryAssetContentASAP.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2A0))();
}

uint64_t dispatch thunk of CodeOperation.dropInMemoryAssetContentASAP.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2A8))();
}

uint64_t dispatch thunk of CodeOperation.shouldFetchAssetContentInMemory.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2B0))();
}

uint64_t dispatch thunk of CodeOperation.shouldFetchAssetContentInMemory.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2B8))();
}

uint64_t dispatch thunk of CodeOperation.shouldFetchAssetContentInMemory.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2C0))();
}

uint64_t dispatch thunk of CodeOperation.incompleteResponsePreviewBlock.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2C8))();
}

uint64_t dispatch thunk of CodeOperation.incompleteResponsePreviewBlock.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2D0))();
}

uint64_t dispatch thunk of CodeOperation.incompleteResponsePreviewBlock.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2D8))();
}

uint64_t dispatch thunk of CodeOperation.didSubstituteRequestRecordTransportsBlock.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2E0))();
}

uint64_t dispatch thunk of CodeOperation.didSubstituteRequestRecordTransportsBlock.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2E8))();
}

uint64_t dispatch thunk of CodeOperation.didSubstituteRequestRecordTransportsBlock.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2F0))();
}

uint64_t sub_20CB820F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t initializeBufferWithCopyOfBuffer for OneFieldDecoder(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_20CB82134(uint64_t a1)
{
  return sub_20CB798B4(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
}

uint64_t sub_20CB82148(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  sub_20CB79854(*(void *)a2, v4, v5, v6, v7);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  return a1;
}

uint64_t sub_20CB821AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  sub_20CB79854(*(void *)a2, v4, v5, v6, v7);
  uint64_t v8 = *(void *)a1;
  unint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  char v12 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v7;
  sub_20CB798B4(v8, v9, v10, v11, v12);
  return a1;
}

__n128 sub_20CB82220(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_20CB82234(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void *)a1;
  unint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  char v9 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v3;
  sub_20CB798B4(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t sub_20CB82280(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFE && *(unsigned char *)(a1 + 33))
    {
      int v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
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

uint64_t sub_20CB822C0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_20CB82308(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 32) <= 1u) {
    return *(unsigned __int8 *)(a1 + 32);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_20CB82320(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
  }
  *(unsigned char *)(result + 32) = a2;
  return result;
}

uint64_t type metadata accessor for CodeOperation.DataProtectionType()
{
  return swift_getGenericMetadata();
}

uint64_t sub_20CB82354()
{
  uint64_t result = type metadata accessor for URL();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t *sub_20CB823CC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    uint64_t v7 = type metadata accessor for URL();
    if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a2, 2, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)a1, 0, 2, v7);
    }
  }
  return a1;
}

uint64_t sub_20CB824C8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for URL();
  uint64_t result = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(a1, 2, v2);
  if (!result)
  {
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
    return v4(a1, v2);
  }
  return result;
}

void *sub_20CB82550(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
  if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a2, 2, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)a1, 0, 2, v6);
  }
  return a1;
}

void *sub_20CB82610(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
  int v7 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a1, 2, v6);
  int v8 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a2, 2, v6);
  if (!v7)
  {
    uint64_t v9 = *(void *)(v6 - 8);
    if (!v8)
    {
      (*(void (**)(void *, const void *, uint64_t))(v9 + 24))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v9 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)a1, 0, 2, v6);
  return a1;
}

void *sub_20CB82758(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
  if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a2, 2, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)a1, 0, 2, v6);
  }
  return a1;
}

void *sub_20CB82818(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
  int v7 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a1, 2, v6);
  int v8 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a2, 2, v6);
  if (!v7)
  {
    uint64_t v9 = *(void *)(v6 - 8);
    if (!v8)
    {
      (*(void (**)(void *, const void *, uint64_t))(v9 + 40))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v9 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)a1, 0, 2, v6);
  return a1;
}

uint64_t sub_20CB82960(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20CB82974);
}

uint64_t sub_20CB82974(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for URL();
  unsigned int v5 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(a1, a2, v4);
  if (v5 >= 3) {
    return v5 - 2;
  }
  else {
    return 0;
  }
}

uint64_t sub_20CB829BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20CB829D0);
}

uint64_t sub_20CB829D0(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 2);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = type metadata accessor for URL();
  return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(a1, v5, a3, v6);
}

uint64_t sub_20CB82A30(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for URL();
  return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(a1, 2, v2);
}

uint64_t sub_20CB82A74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for URL();
  return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(a1, a2, 2, v4);
}

uint64_t sub_20CB82AC0()
{
  return swift_initClassMetadata2();
}

uint64_t sub_20CB82B04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 40);
}

uint64_t type metadata accessor for CodeOperation.AssetInfo()
{
  return swift_getGenericMetadata();
}

uint64_t sub_20CB82B28(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_20CB82B38()
{
  return swift_release();
}

uint64_t sub_20CB82B40(uint64_t a1, uint64_t a2)
{
  return sub_20CB6C244(a2 + 32, a1 + 32);
}

uint64_t sub_20CB82B50(uint64_t a1)
{
  return sub_20CB6C1F4(a1 + 32);
}

uint64_t sub_20CB82B58()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_20CB82B90(uint64_t a1, uint64_t a2)
{
}

void sub_20CB82B98(uint64_t a1, unint64_t a2, uint64_t a3)
{
}

uint64_t sub_20CB82BA0(uint64_t a1, uint64_t a2)
{
  return sub_20CB8637C(a1, a2, *(void *)(v2 + 16));
}

void sub_20CB82BA8(uint64_t a1, uint64_t a2, void *a3)
{
}

void sub_20CB82BB0(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_20CB82BBC()
{
  unint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *unint64_t v1 = v0;
  v1[1] = sub_20CB82C64;
  uint64_t v2 = sub_20CB6A8B0();
  return v3(v2);
}

uint64_t sub_20CB82C64()
{
  sub_20CB6CF44();
  sub_20CB6CF20();
  uint64_t v1 = *v0;
  sub_20CB6CF50();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  unsigned int v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_20CB82D30()
{
  _Block_release(*(const void **)(v0 + 16));

  uint64_t v1 = sub_20CB8349C();
  return MEMORY[0x270FA0238](v1, v2, v3);
}

uint64_t sub_20CB82D68()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_20CB830D8;
  uint64_t v2 = sub_20CB6A8B0();
  return v3(v2);
}

uint64_t sub_20CB82E10(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_20CB82E58()
{
  return sub_20CB7C640();
}

uint64_t sub_20CB82E60(uint64_t *a1)
{
  return sub_20CB7C7E4(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_20CB82E7C()
{
  uint64_t v2 = sub_20CB83588();
  v3(v2);
  sub_20CB6A86C();
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v0, v1);
  return v0;
}

uint64_t sub_20CB82ED0(uint64_t *a1)
{
  return sub_20CB7C700(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_20CB82EF0(uint64_t a1)
{
  return sub_20CB82F58(a1, (uint64_t (*)(uint64_t, void, void, void, void, void, void))sub_20CB85B4C);
}

uint64_t sub_20CB82F08(uint64_t a1)
{
  return sub_20CB82F70(a1, (uint64_t (*)(uint64_t, void, void, void, void, void, void))sub_20CB85B24);
}

uint64_t sub_20CB82F20()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_20CB82F58(uint64_t a1, uint64_t (*a2)(uint64_t, void, void, void, void, void, void))
{
  return a2(a1, v2[6], v2[7], v2[2], v2[3], v2[4], v2[5]);
}

uint64_t sub_20CB82F70(uint64_t a1, uint64_t (*a2)(uint64_t, void, void, void, void, void, void))
{
  return a2(a1, v2[6], v2[7], v2[2], v2[3], v2[4], v2[5]);
}

uint64_t sub_20CB82F88(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t *))(v2 + 48);
  uint64_t v5 = a2;
  return v3(a1, &v5);
}

uint64_t sub_20CB82FC0(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(uint64_t, void))(v2 + 48))(a1, *a2);
}

uint64_t sub_20CB82FEC()
{
  swift_release();
  uint64_t v0 = sub_20CB8349C();
  return MEMORY[0x270FA0238](v0, v1, v2);
}

uint64_t sub_20CB8301C()
{
  return sub_20CB85AEC();
}

uint64_t sub_20CB83024(void *a1, double *a2)
{
  return sub_20CB85ABC(a1, a2, *(uint64_t (**)(void, double))(v2 + 16));
}

uint64_t sub_20CB8302C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20CB79F24(a1, a2, a3, *(uint64_t (**)(uint64_t *, uint64_t *, uint64_t *))(v3 + 16));
}

uint64_t sub_20CB83034(void *a1, void *a2, void *a3)
{
  return (*(uint64_t (**)(void, void, void))(v3 + 16))(*a1, *a2, *a3);
}

uint64_t sub_20CB83118()
{
  return swift_beginAccess();
}

uint64_t sub_20CB8313C()
{
  return swift_beginAccess();
}

uint64_t sub_20CB83170()
{
  return swift_beginAccess();
}

uint64_t sub_20CB831B4()
{
  return 32;
}

__n128 sub_20CB831C0(uint64_t a1, _OWORD *a2)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t sub_20CB831CC()
{
  uint64_t v1 = *v0;
  sub_20CB6B318(*v0);
  return v1;
}

uint64_t sub_20CB83208()
{
  return swift_beginAccess();
}

uint64_t sub_20CB83278()
{
  return swift_beginAccess();
}

uint64_t sub_20CB83290()
{
  return v0;
}

uint64_t sub_20CB832D8(uint64_t a1)
{
  *(void *)(v2 + v1) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_20CB832F4()
{
  return 0;
}

uint64_t sub_20CB83304()
{
  return 0;
}

uint64_t sub_20CB83314()
{
  return 12;
}

uint64_t sub_20CB83324()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_20CB8332C()
{
  return v0;
}

uint64_t sub_20CB83360()
{
  return v0;
}

id sub_20CB8337C()
{
  return objc_allocWithZone(v0);
}

id sub_20CB833A4()
{
  *uint64_t v0 = 0x8000000000000000;
  return v1;
}

uint64_t sub_20CB833FC()
{
  return v0;
}

uint64_t sub_20CB83414()
{
  return v0;
}

uint64_t sub_20CB83438()
{
  return 0;
}

uint64_t sub_20CB83448()
{
  return sub_20CB798B4(v3, v2, v1, v0, 0);
}

uint64_t sub_20CB8346C()
{
  return v0;
}

uint64_t sub_20CB83484()
{
  uint64_t v4 = *v1;
  *uint64_t v1 = v2;
  v1[1] = v0;
  return sub_20CB6B280(v4);
}

uint64_t sub_20CB8349C()
{
  return v0;
}

uint64_t sub_20CB834BC()
{
  return v0;
}

uint64_t sub_20CB834D0()
{
  return v0;
}

uint64_t sub_20CB834E4()
{
  return v0;
}

BOOL sub_20CB834F8@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t sub_20CB8350C()
{
  return v0;
}

uint64_t sub_20CB83518()
{
  return MEMORY[0x270FA1E10](v0, 0xD000000000000026);
}

uint64_t sub_20CB83544()
{
  return v0;
}

uint64_t sub_20CB8355C()
{
  return v0;
}

uint64_t sub_20CB83570()
{
  return v0;
}

uint64_t sub_20CB83588()
{
  return 0;
}

id CKDatabase.codeConnection(toService:local:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  id result = objc_msgSend(v4, sel_container);
  if (result)
  {
    uint64_t v9 = (uint64_t)result;
    id v10 = objc_msgSend(v4, sel_databaseScope);
    type metadata accessor for CodeConnection();
    swift_allocObject();
    uint64_t v11 = sub_20CB77E20(a1, a2, v9, (uint64_t)v10, a3 & 1);
    swift_bridgeObjectRetain();
    return (id)v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t Ckcode_RecordTransport.localSerialization.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_20CB6BEB4(*v2, v2[1]);
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t Ckcode_RecordTransport.encryptedMasterKey.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2 + *(int *)(type metadata accessor for Ckcode_RecordTransport() + 24);
  uint64_t result = sub_20CB64DB4(*(void *)v5, *(void *)(v5 + 8));
  *(void *)uint64_t v5 = a1;
  *(void *)(v5 + 8) = a2;
  return result;
}

uint64_t type metadata accessor for Ckcode_RecordTransport()
{
  uint64_t result = qword_26ACC7148;
  if (!qword_26ACC7148) {
    return swift_getSingletonMetadata();
  }
  return result;
}

double Ckcode_RecordTransport.init()@<D0>(_OWORD *a1@<X8>)
{
  *a1 = xmmword_20CB96B40;
  uint64_t v2 = type metadata accessor for Ckcode_RecordTransport();
  UnknownStorage.init()();
  double result = 0.0;
  *(_OWORD *)((char *)a1 + *(int *)(v2 + 24)) = xmmword_20CB96470;
  return result;
}

uint64_t Ckcode_RecordTransport.contents.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *v1;
  uint64_t v3 = v1[1];
  *a1 = *v1;
  a1[1] = v3;
  return sub_20CB7B72C(v2, v3);
}

uint64_t Ckcode_RecordTransport.contents.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t result = sub_20CB6BEB4(*v1, v1[1]);
  *uint64_t v1 = v2;
  v1[1] = v3;
  return result;
}

uint64_t (*Ckcode_RecordTransport.contents.modify())(void)
{
  return nullsub_1;
}

uint64_t Ckcode_RecordTransport.localSerialization.getter()
{
  if ((*(void *)(v0 + 8) & 0x2000000000000000) == 0)
  {
    uint64_t v1 = sub_20CB6A898();
    sub_20CB6C1EC(v1, v2);
  }
  return sub_20CB6A898();
}

uint64_t sub_20CB83810(uint64_t *a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = a1[1];
  sub_20CB64CA4(*a1, v2);
  return Ckcode_RecordTransport.localSerialization.setter(v1, v2);
}

uint64_t (*Ckcode_RecordTransport.localSerialization.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  a1[2] = (uint64_t)v1;
  unint64_t v3 = v1[1];
  if ((v3 & 0x2000000000000000) != 0)
  {
    uint64_t v4 = 0;
    unint64_t v3 = 0xC000000000000000;
  }
  else
  {
    uint64_t v4 = *v1;
    sub_20CB6C1EC(*v1, v1[1]);
  }
  *a1 = v4;
  a1[1] = v3;
  return sub_20CB838C4;
}

uint64_t sub_20CB838C4(uint64_t *a1, char a2)
{
  unint64_t v2 = a1[1];
  unint64_t v3 = (uint64_t *)a1[2];
  uint64_t v4 = *a1;
  uint64_t v5 = *v3;
  uint64_t v6 = v3[1];
  if (a2)
  {
    sub_20CB64CA4(*a1, v2);
    sub_20CB6BEB4(v5, v6);
    *unint64_t v3 = v4;
    v3[1] = v2;
    uint64_t v7 = sub_20CB6A898();
    return sub_20CB64DC8(v7, v8);
  }
  else
  {
    uint64_t result = sub_20CB6BEB4(*v3, v3[1]);
    *unint64_t v3 = v4;
    v3[1] = v2;
  }
  return result;
}

uint64_t Ckcode_RecordTransport.wireSerialization.getter()
{
  uint64_t v1 = 0;
  uint64_t v2 = v0[1];
  if ((~v2 & 0x3000000000000000) != 0 && (v2 & 0x2000000000000000) != 0)
  {
    uint64_t v1 = *v0;
    sub_20CB6C1EC(*v0, v2);
  }
  return v1;
}

uint64_t sub_20CB839AC(uint64_t *a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = a1[1];
  sub_20CB64CA4(*a1, v2);
  return Ckcode_RecordTransport.wireSerialization.setter(v1, v2);
}

uint64_t Ckcode_RecordTransport.wireSerialization.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2 | 0x2000000000000000;
  uint64_t result = sub_20CB6BEB4(*v2, v2[1]);
  *unint64_t v2 = a1;
  v2[1] = v4;
  return result;
}

uint64_t (*Ckcode_RecordTransport.wireSerialization.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = 0;
  a1[2] = (uint64_t)v1;
  uint64_t v4 = v1[1];
  unint64_t v5 = 0xC000000000000000;
  if ((~v4 & 0x3000000000000000) != 0 && (v4 & 0x2000000000000000) != 0)
  {
    uint64_t v3 = *v1;
    unint64_t v5 = v4 & 0xDFFFFFFFFFFFFFFFLL;
    sub_20CB6C1EC(*v1, v4);
  }
  *a1 = v3;
  a1[1] = v5;
  return sub_20CB83AA0;
}

uint64_t sub_20CB83AA0(uint64_t *a1, char a2)
{
  unint64_t v2 = (uint64_t *)a1[2];
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1] | 0x2000000000000000;
  uint64_t v5 = *v2;
  uint64_t v6 = v2[1];
  if (a2)
  {
    uint64_t v7 = sub_20CB6A8B0();
    sub_20CB64CA4(v7, v8);
    sub_20CB6BEB4(v5, v6);
    *unint64_t v2 = v3;
    v2[1] = v4;
    uint64_t v9 = sub_20CB6A8B0();
    return sub_20CB64DC8(v9, v10);
  }
  else
  {
    uint64_t result = sub_20CB6BEB4(*v2, v2[1]);
    *unint64_t v2 = v3;
    v2[1] = v4;
  }
  return result;
}

uint64_t Ckcode_RecordTransport.encryptedMasterKey.getter()
{
  uint64_t v0 = type metadata accessor for Ckcode_RecordTransport();
  uint64_t v1 = sub_20CB6AA60(*(int *)(v0 + 24));
  sub_20CB64C90(v1, v2);
  return sub_20CB6A8B0();
}

uint64_t sub_20CB83B70(uint64_t *a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = a1[1];
  sub_20CB64CA4(*a1, v2);
  return Ckcode_RecordTransport.encryptedMasterKey.setter(v1, v2);
}

uint64_t (*Ckcode_RecordTransport.encryptedMasterKey.modify(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 16) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for Ckcode_RecordTransport() + 24);
  *(_DWORD *)(a1 + 24) = v3;
  uint64_t v6 = sub_20CB6AA60(v3);
  if (!v5 & v4) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = v6;
  }
  unint64_t v9 = 0xC000000000000000;
  if (!(!v5 & v4)) {
    unint64_t v9 = v7;
  }
  *(void *)a1 = v8;
  *(void *)(a1 + 8) = v9;
  sub_20CB64C90(v6, v7);
  return sub_20CB83C1C;
}

uint64_t sub_20CB83C1C(uint64_t a1, char a2)
{
  unint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16) + *(int *)(a1 + 24);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)v3;
  unint64_t v6 = *(void *)(v3 + 8);
  if (a2)
  {
    sub_20CB64CA4(*(void *)a1, v2);
    sub_20CB64DB4(v5, v6);
    *(void *)uint64_t v3 = v4;
    *(void *)(v3 + 8) = v2;
    uint64_t v7 = sub_20CB6A898();
    return sub_20CB64DC8(v7, v8);
  }
  else
  {
    uint64_t result = sub_20CB64DB4(*(void *)v3, *(void *)(v3 + 8));
    *(void *)uint64_t v3 = v4;
    *(void *)(v3 + 8) = v2;
  }
  return result;
}

BOOL Ckcode_RecordTransport.hasEncryptedMasterKey.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for Ckcode_RecordTransport() + 24) + 8) >> 60 != 15;
}

Swift::Void __swiftcall Ckcode_RecordTransport.clearEncryptedMasterKey()()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for Ckcode_RecordTransport() + 24);
  sub_20CB64DB4(*(void *)v1, *(void *)(v1 + 8));
  *(_OWORD *)uint64_t v1 = xmmword_20CB96470;
}

uint64_t Ckcode_RecordTransport.unknownFields.getter()
{
  type metadata accessor for Ckcode_RecordTransport();
  type metadata accessor for UnknownStorage();
  uint64_t v0 = sub_20CB6A8B0();
  return v1(v0);
}

uint64_t Ckcode_RecordTransport.unknownFields.setter()
{
  type metadata accessor for Ckcode_RecordTransport();
  type metadata accessor for UnknownStorage();
  uint64_t v0 = sub_20CB6A898();
  return v1(v0);
}

uint64_t (*Ckcode_RecordTransport.unknownFields.modify())(void)
{
  return nullsub_1;
}

uint64_t static Ckcode_RecordTransport.OneOf_Contents.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  if ((v3 & 0x2000000000000000) != 0)
  {
    if ((v5 & 0x2000000000000000) != 0)
    {
      uint64_t v6 = sub_20CB859AC();
      unint64_t v7 = v3 & 0xDFFFFFFFFFFFFFFFLL;
      uint64_t v8 = v4;
      unint64_t v9 = v5 & 0xDFFFFFFFFFFFFFFFLL;
      goto LABEL_7;
    }
  }
  else if ((v5 & 0x2000000000000000) == 0)
  {
    uint64_t v6 = sub_20CB859AC();
    unint64_t v7 = v3;
    uint64_t v8 = v4;
    unint64_t v9 = v5;
LABEL_7:
    char v10 = MEMORY[0x210555120](v6, v7, v8, v9);
    goto LABEL_8;
  }
  sub_20CB6C1EC(*a2, a2[1]);
  sub_20CB6C1EC(v2, v3);
  char v10 = 0;
LABEL_8:
  sub_20CB6BEC8(v2, v3);
  sub_20CB6BEC8(v4, v5);
  return v10 & 1;
}

void sub_20CB83F0C()
{
  qword_2676F12E0 = 0x65646F636B63;
  *(void *)algn_2676F12E8 = 0xE600000000000000;
}

uint64_t sub_20CB83F2C()
{
  if (qword_2676F0BD0 != -1) {
    uint64_t result = swift_once();
  }
  qword_2676F12F0 = 0xD000000000000016;
  *(void *)algn_2676F12F8 = 0x800000020CB9B480;
  return result;
}

uint64_t static Ckcode_RecordTransport.protoMessageName.getter()
{
  if (qword_2676F0BD8 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return sub_20CB6A8B0();
}

uint64_t sub_20CB83FF8()
{
  uint64_t v0 = type metadata accessor for _NameMap();
  sub_20CB6A468(v0, qword_2676F1300);
  sub_20CB683E4(v0, (uint64_t)qword_2676F1300);
  sub_20CB650D0(&qword_2676F0CA0);
  uint64_t v1 = (int *)(sub_20CB650D0(&qword_2676F0CA8) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_20CB97330;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  void *v5 = 1;
  *(void *)unint64_t v6 = "localSerialization";
  *(void *)(v6 + 8) = 18;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = type metadata accessor for _NameMap.NameDescription();
  unint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  char v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)char v10 = "wireSerialization";
  *((void *)v10 + 1) = 17;
  v10[16] = 2;
  v9();
  uint64_t v11 = (void *)((char *)v5 + 2 * v2);
  char v12 = (char *)v11 + v1[14];
  *uint64_t v11 = 3;
  *(void *)char v12 = "encryptedMasterKey";
  *((void *)v12 + 1) = 18;
  v12[16] = 2;
  v9();
  return _NameMap.init(dictionaryLiteral:)();
}

uint64_t static Ckcode_RecordTransport._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_2676F0BE0 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for _NameMap();
  uint64_t v3 = sub_20CB683E4(v2, (uint64_t)qword_2676F1300);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t Ckcode_RecordTransport.decodeMessage<A>(decoder:)()
{
  while (1)
  {
    uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
    if (v0 || (v2 & 1) != 0) {
      break;
    }
    switch(result)
    {
      case 3:
        sub_20CB6A8CC();
        sub_20CB844CC();
        break;
      case 2:
        sub_20CB6A8CC();
        sub_20CB843FC();
        break;
      case 1:
        sub_20CB6A8CC();
        sub_20CB84330();
        break;
    }
  }
  return result;
}

uint64_t sub_20CB84330()
{
  uint64_t result = dispatch thunk of Decoder.decodeSingularBytesField(value:)();
  if (v0) {
    return sub_20CB64DB4(0, 0xF000000000000000);
  }
  return result;
}

uint64_t sub_20CB843FC()
{
  uint64_t result = dispatch thunk of Decoder.decodeSingularBytesField(value:)();
  if (v0) {
    return sub_20CB64DB4(0, 0xF000000000000000);
  }
  return result;
}

uint64_t sub_20CB844CC()
{
  return dispatch thunk of Decoder.decodeSingularBytesField(value:)();
}

uint64_t Ckcode_RecordTransport.traverse<A>(visitor:)()
{
  if ((~*(void *)(v0 + 8) & 0x3000000000000000) == 0
    || ((char v2 = (uint64_t *)sub_20CB85994(), (v3 & 0x2000000000000000) != 0)
      ? (uint64_t result = (uint64_t)sub_20CB84660(v2))
      : (uint64_t result = (uint64_t)sub_20CB845D8(v2)),
        !v1))
  {
    uint64_t v5 = sub_20CB85994();
    uint64_t result = sub_20CB84700(v5);
    if (!v1)
    {
      type metadata accessor for Ckcode_RecordTransport();
      return UnknownStorage.traverse<A>(visitor:)();
    }
  }
  return result;
}

uint64_t *sub_20CB845D8(uint64_t *result)
{
  uint64_t v1 = result[1];
  if ((v1 & 0x2000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v2 = *result;
    sub_20CB6C1EC(*result, v1);
    dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)();
    return (uint64_t *)sub_20CB6BEB4(v2, v1);
  }
  return result;
}

uint64_t *sub_20CB84660(uint64_t *result)
{
  uint64_t v1 = result[1];
  if ((~v1 & 0x3000000000000000) != 0 && (v1 & 0x2000000000000000) != 0)
  {
    uint64_t v2 = *result;
    sub_20CB6C1EC(*result, v1);
    dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)();
    return (uint64_t *)sub_20CB6BEB4(v2, v1);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_20CB84700(uint64_t a1)
{
  uint64_t result = type metadata accessor for Ckcode_RecordTransport();
  uint64_t v3 = a1 + *(int *)(result + 24);
  unint64_t v4 = *(void *)(v3 + 8);
  if (v4 >> 60 != 15)
  {
    uint64_t v5 = *(void *)v3;
    sub_20CB64CA4(*(void *)v3, *(void *)(v3 + 8));
    dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)();
    return sub_20CB64DB4(v5, v4);
  }
  return result;
}

uint64_t static Ckcode_RecordTransport.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = type metadata accessor for UnknownStorage();
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  char v10 = (char *)&v42 - v9;
  uint64_t v12 = *a1;
  uint64_t v11 = a1[1];
  uint64_t v14 = *a2;
  uint64_t v13 = a2[1];
  uint64_t v15 = v13 & 0x3000000000000000;
  if ((~v11 & 0x3000000000000000) != 0)
  {
    if (v15 == 0x3000000000000000) {
      goto LABEL_5;
    }
    if ((v11 & 0x2000000000000000) != 0)
    {
      if ((v13 & 0x2000000000000000) != 0)
      {
        unint64_t v42 = v13 & 0xDFFFFFFFFFFFFFFFLL;
        uint64_t v43 = v8;
        uint64_t v19 = sub_20CB858E8(v12);
        unint64_t v20 = v11 & 0xDFFFFFFFFFFFFFFFLL;
        uint64_t v21 = v14;
        unint64_t v22 = v42;
LABEL_12:
        char v25 = MEMORY[0x210555120](v19, v20, v21, v22);
        sub_20CB6BEC8(v12, v11);
        sub_20CB6BEC8(v14, v13);
        sub_20CB6BEB4(v14, v13);
        sub_20CB6BEB4(v12, v11);
        sub_20CB6BEB4(v12, v11);
        uint64_t v8 = v43;
        if ((v25 & 1) == 0) {
          goto LABEL_18;
        }
        goto LABEL_13;
      }
    }
    else if ((v13 & 0x2000000000000000) == 0)
    {
      uint64_t v18 = *a1;
      uint64_t v43 = v8;
      uint64_t v19 = sub_20CB858E8(v18);
      unint64_t v20 = v11;
      uint64_t v21 = v14;
      unint64_t v22 = v13;
      goto LABEL_12;
    }
    uint64_t v23 = sub_20CB85934();
    sub_20CB6BEC8(v23, v24);
    sub_20CB6BEC8(v14, v13);
    goto LABEL_18;
  }
  if (v15 != 0x3000000000000000)
  {
LABEL_5:
    uint64_t v16 = sub_20CB85934();
    sub_20CB6BEB4(v16, v17);
    sub_20CB6BEB4(v14, v13);
    goto LABEL_18;
  }
LABEL_13:
  uint64_t v43 = v8;
  uint64_t v26 = type metadata accessor for Ckcode_RecordTransport();
  uint64_t v27 = *(int *)(v26 + 24);
  uint64_t v28 = *(uint64_t *)((char *)a1 + v27);
  unint64_t v29 = *(uint64_t *)((char *)a1 + v27 + 8);
  id v30 = (uint64_t *)((char *)a2 + v27);
  uint64_t v31 = *v30;
  unint64_t v32 = v30[1];
  if (v29 >> 60 == 15)
  {
    if (v32 >> 60 == 15) {
      goto LABEL_21;
    }
    goto LABEL_17;
  }
  if (v32 >> 60 == 15)
  {
LABEL_17:
    uint64_t v33 = sub_20CB85964();
    sub_20CB64DB4(v33, v34);
    sub_20CB64DB4(v31, v32);
    goto LABEL_18;
  }
  uint64_t v37 = sub_20CB85964();
  LODWORD(v42) = MEMORY[0x210555120](v37);
  sub_20CB64DB4(v31, v32);
  sub_20CB64DB4(v28, v29);
  if (v42)
  {
LABEL_21:
    uint64_t v38 = v43;
    id v39 = *(void (**)(char *, char *, uint64_t))(v43 + 16);
    v39(v10, (char *)a1 + *(int *)(v26 + 20), v4);
    v39(v7, (char *)a2 + *(int *)(v26 + 20), v4);
    sub_20CB8589C(&qword_2676F0BF8, MEMORY[0x263F50560]);
    char v35 = dispatch thunk of static Equatable.== infix(_:_:)();
    id v40 = *(void (**)(uint64_t))(v38 + 8);
    uint64_t v41 = sub_20CB6A8B0();
    v40(v41);
    ((void (*)(char *, uint64_t))v40)(v10, v4);
    return v35 & 1;
  }
LABEL_18:
  char v35 = 0;
  return v35 & 1;
}

Swift::Int Ckcode_RecordTransport.hashValue.getter()
{
  return Hasher._finalize()();
}

uint64_t sub_20CB84B64()
{
  return Ckcode_RecordTransport.decodeMessage<A>(decoder:)();
}

uint64_t sub_20CB84B7C()
{
  return Ckcode_RecordTransport.traverse<A>(visitor:)();
}

uint64_t sub_20CB84B94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_20CB8589C(qword_2676F1328, (void (*)(uint64_t))type metadata accessor for Ckcode_RecordTransport);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_20CB84C14(uint64_t a1)
{
  uint64_t v2 = sub_20CB8589C(&qword_26ACC7138, (void (*)(uint64_t))type metadata accessor for Ckcode_RecordTransport);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_20CB84C84()
{
  sub_20CB8589C(&qword_26ACC7138, (void (*)(uint64_t))type metadata accessor for Ckcode_RecordTransport);
  return Message.hash(into:)();
}

uint64_t sub_20CB84D00()
{
  return sub_20CB8589C(&qword_26ACC7140, (void (*)(uint64_t))type metadata accessor for Ckcode_RecordTransport);
}

uint64_t sub_20CB84D48()
{
  return sub_20CB8589C(&qword_26ACC7138, (void (*)(uint64_t))type metadata accessor for Ckcode_RecordTransport);
}

uint64_t sub_20CB84D90()
{
  return sub_20CB8589C(&qword_2676F1318, (void (*)(uint64_t))type metadata accessor for Ckcode_RecordTransport);
}

uint64_t sub_20CB84DD8()
{
  return sub_20CB8589C(&qword_2676F1320, (void (*)(uint64_t))type metadata accessor for Ckcode_RecordTransport);
}

uint64_t sub_20CB84E24@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = Ckcode_RecordTransport.localSerialization.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_20CB84E54@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = Ckcode_RecordTransport.wireSerialization.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_20CB84E84@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = Ckcode_RecordTransport.encryptedMasterKey.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for Ckcode_RecordTransport(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    uint64_t *v4 = *a2;
    uint64_t v4 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    if ((~v7 & 0x3000000000000000) != 0)
    {
      uint64_t v9 = *a2;
      sub_20CB6C1EC(*a2, a2[1]);
      uint64_t *v4 = v9;
      v4[1] = v7;
    }
    else
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
    }
    uint64_t v10 = *(int *)(a3 + 20);
    uint64_t v11 = (char *)v4 + v10;
    uint64_t v12 = (char *)a2 + v10;
    uint64_t v13 = type metadata accessor for UnknownStorage();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    uint64_t v14 = *(int *)(a3 + 24);
    uint64_t v15 = (char *)v4 + v14;
    uint64_t v16 = (char *)a2 + v14;
    unint64_t v17 = *((void *)v16 + 1);
    if (v17 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
    }
    else
    {
      uint64_t v18 = *(void *)v16;
      sub_20CB64CA4(*(void *)v16, *((void *)v16 + 1));
      *(void *)uint64_t v15 = v18;
      *((void *)v15 + 1) = v17;
    }
  }
  return v4;
}

uint64_t destroy for Ckcode_RecordTransport(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = a1[1];
  if ((~v4 & 0x3000000000000000) != 0) {
    sub_20CB6BEC8(*a1, v4);
  }
  int v5 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v6 = type metadata accessor for UnknownStorage();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v8 = (uint64_t *)((char *)a1 + *(int *)(a2 + 24));
  unint64_t v9 = v8[1];
  if (v9 >> 60 != 15)
  {
    uint64_t v10 = *v8;
    return sub_20CB64DC8(v10, v9);
  }
  return result;
}

uint64_t *initializeWithCopy for Ckcode_RecordTransport(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  if ((~v6 & 0x3000000000000000) != 0)
  {
    uint64_t v7 = *a2;
    sub_20CB6C1EC(*a2, a2[1]);
    *a1 = v7;
    a1[1] = v6;
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  uint64_t v8 = *(int *)(a3 + 20);
  unint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  unint64_t v15 = *((void *)v14 + 1);
  if (v15 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
  }
  else
  {
    uint64_t v16 = *(void *)v14;
    sub_20CB64CA4(*(void *)v14, *((void *)v14 + 1));
    *(void *)uint64_t v13 = v16;
    *((void *)v13 + 1) = v15;
  }
  return a1;
}

uint64_t *assignWithCopy for Ckcode_RecordTransport(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  uint64_t v7 = v6 & 0x3000000000000000;
  if ((~a1[1] & 0x3000000000000000) == 0)
  {
    if (v7 != 0x3000000000000000)
    {
      uint64_t v8 = *a2;
      sub_20CB6C1EC(*a2, a2[1]);
      *a1 = v8;
      a1[1] = v6;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v7 == 0x3000000000000000)
  {
    sub_20CB85318(a1);
LABEL_6:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }
  uint64_t v9 = *a2;
  sub_20CB6C1EC(*a2, a2[1]);
  uint64_t v10 = *a1;
  uint64_t v11 = a1[1];
  *a1 = v9;
  a1[1] = v6;
  sub_20CB6BEC8(v10, v11);
LABEL_8:
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  uint64_t v16 = *(int *)(a3 + 24);
  unint64_t v17 = (uint64_t *)((char *)a1 + v16);
  uint64_t v18 = (uint64_t *)((char *)a2 + v16);
  unint64_t v19 = *(uint64_t *)((char *)a2 + v16 + 8);
  if (*(unint64_t *)((char *)a1 + v16 + 8) >> 60 != 15)
  {
    if (v19 >> 60 != 15)
    {
      uint64_t v21 = *v18;
      sub_20CB64CA4(v21, v19);
      uint64_t v22 = *v17;
      unint64_t v23 = v17[1];
      *unint64_t v17 = v21;
      v17[1] = v19;
      sub_20CB64DC8(v22, v23);
      return a1;
    }
    sub_20CB68A88((uint64_t)v17);
    goto LABEL_13;
  }
  if (v19 >> 60 == 15)
  {
LABEL_13:
    *(_OWORD *)unint64_t v17 = *(_OWORD *)v18;
    return a1;
  }
  uint64_t v20 = *v18;
  sub_20CB64CA4(v20, v19);
  *unint64_t v17 = v20;
  v17[1] = v19;
  return a1;
}

uint64_t *sub_20CB85318(uint64_t *a1)
{
  return a1;
}

_OWORD *initializeWithTake for Ckcode_RecordTransport(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t *assignWithTake for Ckcode_RecordTransport(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = a1[1];
  if ((~v6 & 0x3000000000000000) == 0) {
    goto LABEL_4;
  }
  uint64_t v7 = a2[1];
  if ((~v7 & 0x3000000000000000) == 0)
  {
    sub_20CB85318(a1);
LABEL_4:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_6;
  }
  uint64_t v8 = *a1;
  *a1 = *a2;
  a1[1] = v7;
  sub_20CB6BEC8(v8, v6);
LABEL_6:
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = (uint64_t *)((char *)a1 + v13);
  uint64_t v15 = (uint64_t *)((char *)a2 + v13);
  unint64_t v16 = *(uint64_t *)((char *)a1 + v13 + 8);
  if (v16 >> 60 != 15)
  {
    unint64_t v17 = v15[1];
    if (v17 >> 60 != 15)
    {
      uint64_t v18 = *v14;
      *uint64_t v14 = *v15;
      v14[1] = v17;
      sub_20CB64DC8(v18, v16);
      return a1;
    }
    sub_20CB68A88((uint64_t)v14);
  }
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  return a1;
}

uint64_t getEnumTagSinglePayload for Ckcode_RecordTransport(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20CB85508);
}

uint64_t sub_20CB85508(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for UnknownStorage();
  sub_20CB6A854();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(v9, a2, v8);
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + *(int *)(a3 + 24) + 8) >> 60;
    BOOL v12 = ((4 * v11) & 0xC) == 0;
    unsigned int v13 = ((4 * v11) & 0xC | (v11 >> 2)) ^ 0xF;
    if (v12) {
      return 0;
    }
    else {
      return v13;
    }
  }
}

uint64_t storeEnumTagSinglePayload for Ckcode_RecordTransport(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20CB855B8);
}

void sub_20CB855B8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  type metadata accessor for UnknownStorage();
  sub_20CB6A854();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v11, a2, a2, v10);
  }
  else
  {
    BOOL v12 = (void *)(a1 + *(int *)(a4 + 24));
    *BOOL v12 = 0;
    v12[1] = (unint64_t)((~a2 >> 2) & 3 | (4 * ~a2)) << 60;
  }
}

uint64_t sub_20CB85654()
{
  uint64_t result = type metadata accessor for UnknownStorage();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for Ckcode_RecordTransport.OneOf_Contents(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  sub_20CB6C1EC(*a2, v4);
  *a1 = v3;
  a1[1] = v4;
  return a1;
}

uint64_t destroy for Ckcode_RecordTransport.OneOf_Contents(uint64_t *a1)
{
  return sub_20CB6BEC8(*a1, a1[1]);
}

uint64_t *assignWithCopy for Ckcode_RecordTransport.OneOf_Contents(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  sub_20CB6C1EC(*a2, v4);
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  *a1 = v3;
  a1[1] = v4;
  sub_20CB6BEC8(v5, v6);
  return a1;
}

uint64_t *assignWithTake for Ckcode_RecordTransport.OneOf_Contents(uint64_t *a1, _OWORD *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_20CB6BEC8(v3, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for Ckcode_RecordTransport.OneOf_Contents(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 3 && *(unsigned char *)(a1 + 16))
    {
      unsigned int v2 = *(_DWORD *)a1 + 2;
    }
    else
    {
      unsigned int v2 = ((2 * ((*(void *)(a1 + 8) & 0x1000000000000000) != 0)) | ((*(void *)(a1 + 8) >> 60) >> 1) & 1) ^ 3;
      if (v2 >= 2) {
        unsigned int v2 = -1;
      }
    }
  }
  else
  {
    unsigned int v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for Ckcode_RecordTransport.OneOf_Contents(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 2)
  {
    *(void *)uint64_t result = a2 - 3;
    *(void *)(result + 8) = 0;
    if (a3 >= 3) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 3) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2)
    {
      *(void *)uint64_t result = 0;
      *(void *)(result + 8) = (unint64_t)((2 * (a2 & 1)) | 1) << 60;
    }
  }
  return result;
}

uint64_t sub_20CB85858(uint64_t a1)
{
  return (*(void *)(a1 + 8) >> 61) & 1;
}

uint64_t sub_20CB85864(uint64_t result)
{
  *(void *)(result + 8) &= ~0x2000000000000000uLL;
  return result;
}

uint64_t sub_20CB85874(uint64_t result, char a2)
{
  *(void *)(result + 8) = *(void *)(result + 8) & 0xCFFFFFFFFFFFFFFFLL | ((unint64_t)(a2 & 1) << 61);
  return result;
}

ValueMetadata *type metadata accessor for Ckcode_RecordTransport.OneOf_Contents()
{
  return &type metadata for Ckcode_RecordTransport.OneOf_Contents;
}

uint64_t sub_20CB8589C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_20CB858E8(uint64_t a1)
{
  sub_20CB7B72C(a1, v1);
  sub_20CB7B72C(v2, v1);
  sub_20CB7B72C(v4, v3);
  sub_20CB7B72C(v2, v1);
  sub_20CB7B72C(v4, v3);
  return v2;
}

uint64_t sub_20CB85934()
{
  sub_20CB7B72C(v1, v0);
  sub_20CB7B72C(v3, v2);
  return v1;
}

uint64_t sub_20CB85964()
{
  sub_20CB64C90(v0, v1);
  sub_20CB64C90(v2, v3);
  return v0;
}

uint64_t sub_20CB85994()
{
  return v0;
}

uint64_t sub_20CB859AC()
{
  sub_20CB6C1EC(v0, v2);
  sub_20CB6C1EC(v1, v3);
  return v1;
}

uint64_t sub_20CB859D8(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 16) && (sub_20CB8FF44(a1), (v2 & 1) != 0)) {
    return swift_bridgeObjectRetain();
  }
  else {
    return 0;
  }
}

uint64_t sub_20CB85A1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (sub_20CB8FEC8(a1, a2, (uint64_t (*)(uint64_t))sub_20CB905B8), (v3 & 1) != 0)) {
    return swift_bridgeObjectRetain();
  }
  else {
    return 0;
  }
}

void *sub_20CB85A74(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return 0;
  }
  unint64_t v3 = sub_20CB8FE6C(a1);
  if ((v4 & 1) == 0) {
    return 0;
  }
  uint64_t v5 = *(void **)(*(void *)(a2 + 56) + 8 * v3);
  id v6 = v5;
  return v5;
}

uint64_t sub_20CB85ABC(void *a1, double *a2, uint64_t (*a3)(void, double))
{
  return a3(*a1, *a2);
}

uint64_t sub_20CB85AEC()
{
  sub_20CB90FCC();
  return v0();
}

uint64_t sub_20CB85B24(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_20CB85B4C(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_20CB85B74()
{
  return 0;
}

uint64_t sub_20CB85B7C(uint64_t a1, void (*a2)(uint64_t, uint64_t, unint64_t))
{
  uint64_t v3 = type metadata accessor for Ckcode_RecordTransport();
  uint64_t v4 = sub_20CB90E24(v3);
  MEMORY[0x270FA5388](v4);
  sub_20CB90F10();
  uint64_t v13 = MEMORY[0x263F8EE78];
  sub_20CB90A94();
  uint64_t v5 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v5)
  {
    uint64_t v6 = 0;
    uint64_t v7 = (unint64_t *)(a1 + 40);
    do
    {
      uint64_t v9 = *(v7 - 1);
      unint64_t v8 = *v7;
      sub_20CB64CA4(v9, *v7);
      a2(v6, v9, v8);
      sub_20CB64DC8(v9, v8);
      unint64_t v10 = *(void *)(v13 + 16);
      if (v10 >= *(void *)(v13 + 24) >> 1) {
        sub_20CB90A94();
      }
      ++v6;
      v7 += 2;
      *(void *)(v13 + 16) = v10 + 1;
      sub_20CB82E7C();
    }
    while (v5 != v6);
  }
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t sub_20CB85D14(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    if (a2)
    {
      uint64_t v4 = type metadata accessor for Ckcode_RecordTransport();
      uint64_t v5 = static Array._allocateBufferUninitialized(minimumCapacity:)();
      *(void *)(v5 + 16) = a2;
      uint64_t v6 = *(void *)(v4 - 8);
      unint64_t v7 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
      sub_20CB80CE8();
      uint64_t v8 = a2 - 1;
      if (a2 != 1)
      {
        uint64_t v9 = *(void *)(v6 + 72);
        unint64_t v10 = v5 + v9 + v7;
        do
        {
          sub_20CB80CE8();
          v10 += v9;
          --v8;
        }
        while (v8);
      }
    }
    else
    {
      uint64_t v5 = MEMORY[0x263F8EE78];
    }
    sub_20CB80E00(a1, (void (*)(void))type metadata accessor for Ckcode_RecordTransport);
    return v5;
  }
  return result;
}

void sub_20CB85E80(uint64_t a1, void *a2)
{
  sub_20CB6F898((void *)(a1 + 32), *(void *)(a1 + 56));
  if (a2)
  {
    id v3 = a2;
    sub_20CB85F10();
  }
  else
  {
    sub_20CB85F54();
  }
}

uint64_t sub_20CB85F10()
{
  return CheckedContinuation.resume(throwing:)();
}

uint64_t sub_20CB85F54()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_20CB85F88(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_20CB650D0(&qword_2676F1458);
  uint64_t v6 = sub_20CB6A8A4(v5);
  MEMORY[0x270FA5388](v6);
  sub_20CB90EF8();
  uint64_t v7 = type metadata accessor for TaskPriority();
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v2, 1, 1, v7);
  uint64_t v8 = (void *)swift_allocObject();
  void v8[2] = 0;
  void v8[3] = 0;
  v8[4] = a1;
  v8[5] = a2;
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  void v9[4] = &unk_2676F1468;
  v9[5] = v8;
  sub_20CB8E6F8(v2, (uint64_t)&unk_2676F1478, (uint64_t)v9);
  return swift_release();
}

void sub_20CB86078()
{
  sub_20CB90F28();
  id v4 = v1;
  id v3 = v0;
  v2(v1, v0);
  swift_release();
}

void sub_20CB860F4(uint64_t a1, uint64_t a2)
{
  if (a2) {
    _convertErrorToNSError(_:)();
  }
  uint64_t v2 = sub_20CB90DFC();
  v3(v2);
}

void sub_20CB86154(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v9 = sub_20CB650D0(qword_26ACC6B38);
  uint64_t v10 = sub_20CB6A8A4(v9);
  MEMORY[0x270FA5388](v10);
  sub_20CB90EF8();
  uint64_t v11 = *(void (**)(uint64_t, void *, void *))(a1 + 32);
  if (a2)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v12 = type metadata accessor for URL();
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v12 = type metadata accessor for URL();
    uint64_t v13 = 1;
  }
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v4, v13, 1, v12);
  swift_retain();
  id v14 = a3;
  id v15 = a4;
  v11(v4, a3, a4);

  swift_release();
  sub_20CB8FA20(v4, qword_26ACC6B38);
  sub_20CB90E80();
}

void sub_20CB86260(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = sub_20CB650D0(qword_26ACC6B38);
  uint64_t v8 = sub_20CB6A8A4(v7);
  MEMORY[0x270FA5388](v8);
  sub_20CB833D8();
  sub_20CB909A4(a1, v3, qword_26ACC6B38);
  uint64_t v9 = type metadata accessor for URL();
  uint64_t v11 = 0;
  if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(v3, 1, v9) != 1)
  {
    URL._bridgeToObjectiveC()(v10);
    uint64_t v11 = v12;
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v3, v9);
  }
  if (a3) {
    a3 = (void *)_convertErrorToNSError(_:)();
  }
  uint64_t v13 = sub_20CB90E64();
  v14(v13, v11, a2, a3);
}

void sub_20CB86380()
{
  sub_20CB90F28();
  id v4 = v1;
  id v3 = v0;
  v2(v4, v0);
  swift_release();
}

void sub_20CB863FC(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (a2 >> 60 == 15)
  {
    Class isa = 0;
    if (!a3) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  if (a3) {
LABEL_3:
  }
    _convertErrorToNSError(_:)();
LABEL_5:
  uint64_t v5 = sub_20CB90DFC();
  v6(v5);
}

void sub_20CB86484(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    v3.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
    if (!a2) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  v3.super.Class isa = 0;
  if (a2) {
LABEL_3:
  }
    _convertErrorToNSError(_:)();
LABEL_5:
  uint64_t v4 = sub_20CB90DFC();
  v5(v4);
}

uint64_t sub_20CB8650C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Optional();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - v3, a1);
  return sub_20CB78304();
}

void sub_20CB865DC(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  sub_20CB866F8(v1);
}

void sub_20CB8660C(void *a1)
{
  id v2 = v1;
  id v4 = objc_msgSend(v2, sel_configuration);
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = objc_msgSend(a1, sel_container);
    objc_msgSend(v5, sel_setContainer_, v6);
  }
  else
  {
    __break(1u);
  }
}

void *sub_20CB866A4()
{
  sub_20CB831A8();
  sub_20CB83118();
  id v1 = *v0;
  id v2 = v1;
  return v1;
}

void sub_20CB866F8(void *a1)
{
  sub_20CB8660C(a1);
  sub_20CB831A8();
  sub_20CB83170();
  uint64_t v3 = *v1;
  *id v1 = a1;
}

void (*sub_20CB86754(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  sub_20CB831A8();
  uint64_t v5 = (void **)(v1 + *(void *)(v4 + 136));
  sub_20CB83278();
  id v6 = *v5;
  v3[3] = *v5;
  id v7 = v6;
  return sub_20CB867EC;
}

void sub_20CB867EC(uint64_t a1, char a2)
{
  id v2 = *(void **)a1;
  uint64_t v4 = (id *)(*(void *)a1 + 24);
  id v3 = *v4;
  if (a2)
  {
    id v5 = v3;
    sub_20CB866F8(v3);
  }
  else
  {
    sub_20CB866F8(*(void **)(*(void *)a1 + 24));
  }
  free(v2);
}

uint64_t sub_20CB86858()
{
  return sub_20CB83324();
}

uint64_t sub_20CB86880(uint64_t a1)
{
  return sub_20CB832D8(a1);
}

void *sub_20CB868A8()
{
  uint64_t v1 = *(void **)((char *)v0 + *(void *)((*MEMORY[0x263F8EED0] & *v0) + 0xA0));
  id v2 = v1;
  return v1;
}

void sub_20CB868F8(uint64_t a1)
{
  uint64_t v2 = *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0xA0);
  id v3 = *(void **)((char *)v1 + v2);
  *(void *)((char *)v1 + v2) = a1;
}

double sub_20CB8692C@<D0>(uint64_t a1@<X8>)
{
  sub_20CB869C4((uint64_t)v5);
  char v2 = v6;
  double result = *(double *)v5;
  long long v4 = v5[1];
  *(_OWORD *)a1 = v5[0];
  *(_OWORD *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 32) = v2;
  return result;
}

uint64_t sub_20CB86970(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  char v4 = *(unsigned char *)(a1 + 32);
  v6[0] = *(void *)a1;
  v6[1] = v1;
  void v6[2] = v2;
  v6[3] = v3;
  char v7 = v4;
  sub_20CB79854(v6[0], v1, v2, v3, v4);
  return sub_20CB86A38(v6);
}

uint64_t sub_20CB869C4@<X0>(uint64_t a1@<X8>)
{
  sub_20CB831A8();
  uint64_t v4 = v1 + *(void *)(v3 + 168);
  sub_20CB83278();
  uint64_t v5 = *(void *)v4;
  unint64_t v6 = *(void *)(v4 + 8);
  uint64_t v7 = *(void *)(v4 + 16);
  uint64_t v8 = *(void *)(v4 + 24);
  *(void *)a1 = *(void *)v4;
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = v7;
  *(void *)(a1 + 24) = v8;
  char v9 = *(unsigned char *)(v4 + 32);
  *(unsigned char *)(a1 + 32) = v9;
  return sub_20CB79854(v5, v6, v7, v8, v9);
}

uint64_t sub_20CB86A38(uint64_t *a1)
{
  uint64_t v2 = *a1;
  long long v12 = *(_OWORD *)(a1 + 1);
  uint64_t v3 = a1[3];
  char v4 = *((unsigned char *)a1 + 32);
  uint64_t v5 = (char *)v1 + *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0xA8);
  swift_beginAccess();
  uint64_t v6 = *(void *)v5;
  unint64_t v7 = *((void *)v5 + 1);
  uint64_t v8 = *((void *)v5 + 2);
  uint64_t v9 = *((void *)v5 + 3);
  *(void *)uint64_t v5 = v2;
  *(_OWORD *)(v5 + 8) = v12;
  *((void *)v5 + 3) = v3;
  char v10 = v5[32];
  v5[32] = v4;
  return sub_20CB798B4(v6, v7, v8, v9, v10);
}

uint64_t (*sub_20CB86AE0())()
{
  return j_j__swift_endAccess;
}

double sub_20CB86B40@<D0>(_OWORD *a1@<X8>)
{
  sub_20CB86BC0((uint64_t *)&v3);
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_20CB86B7C(uint64_t *a1)
{
  unint64_t v1 = a1[1];
  v3[0] = *a1;
  v3[1] = v1;
  sub_20CB64C90(v3[0], v1);
  return sub_20CB86C10(v3);
}

uint64_t sub_20CB86BC0@<X0>(uint64_t *a1@<X8>)
{
  sub_20CB869C4((uint64_t)&v4);
  uint64_t result = v4;
  unint64_t v3 = v5;
  if (v8)
  {
    sub_20CB798B4(v4, v5, v6, v7, v8);
    uint64_t result = 0;
    unint64_t v3 = 0xF000000000000000;
  }
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_20CB86C10(void *a1)
{
  unint64_t v1 = a1[1];
  if (v1 >> 60 == 15)
  {
    long long v7 = 0u;
    long long v8 = 0u;
    char v9 = 2;
    return sub_20CB86A38((uint64_t *)&v7);
  }
  else
  {
    *(void *)&long long v7 = *a1;
    *((void *)&v7 + 1) = v1;
    long long v8 = 0uLL;
    char v9 = 0;
    uint64_t v3 = sub_20CB8350C();
    sub_20CB64CA4(v3, v4);
    sub_20CB86A38((uint64_t *)&v7);
    uint64_t v5 = sub_20CB8350C();
    return sub_20CB64DB4(v5, v6);
  }
}

uint64_t (*sub_20CB86C90(uint64_t *a1))(uint64_t *a1, char a2)
{
  a1[2] = v1;
  sub_20CB86BC0(a1);
  return sub_20CB86CD8;
}

uint64_t sub_20CB86CD8(uint64_t *a1, char a2)
{
  uint64_t v2 = a1[1];
  if (a2)
  {
    uint64_t v8 = *a1;
    uint64_t v9 = v2;
    uint64_t v3 = sub_20CB8350C();
    sub_20CB64C90(v3, v4);
    sub_20CB86C10(&v8);
    uint64_t v5 = sub_20CB8350C();
    return sub_20CB64DB4(v5, v6);
  }
  else
  {
    uint64_t v8 = *a1;
    uint64_t v9 = v2;
    return sub_20CB86C10(&v8);
  }
}

uint64_t sub_20CB86D58()
{
  sub_20CB831A8();
  sub_20CB83118();
  return *v0;
}

uint64_t sub_20CB86DA4(char a1)
{
  uint64_t result = sub_20CB83170();
  *uint64_t v1 = a1;
  return result;
}

void *sub_20CB86DF8()
{
  uint64_t v1 = *(void **)((char *)v0 + *(void *)((*MEMORY[0x263F8EED0] & *v0) + 0xB8));
  id v2 = v1;
  return v1;
}

void sub_20CB86E44(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *v4;
  id v9 = a1;
  uint64_t v10 = sub_20CB859D8((uint64_t)v9, v8);

  if (v10)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_20CB85A1C(a2, a3, v10);
    swift_bridgeObjectRelease();
    if (v11)
    {
      long long v12 = sub_20CB85A74(a4, v11);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v12) {
        goto LABEL_7;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  id v13 = objc_allocWithZone(MEMORY[0x263EFD788]);
  id v14 = v9;
  swift_bridgeObjectRetain();
  sub_20CB86FD8(objc_msgSend(v13, sel_init), v14, a2, a3, a4);
  long long v12 = 0;
LABEL_7:
  uint64_t v15 = *v4;
  id v16 = v9;
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_20CB859D8((uint64_t)v16, v15);

  if (!v17)
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v18 = sub_20CB85A1C(a2, a3, v17);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v18)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v19 = sub_20CB85A74(a4, v18);
  swift_bridgeObjectRelease();
  if (v19)
  {

    return;
  }
LABEL_13:
  __break(1u);
}

void sub_20CB86FD8(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v6 = v5;
  uint64_t v11 = sub_20CB859D8((uint64_t)a2, *v5);
  swift_bridgeObjectRelease();
  if (!v11)
  {
    id v12 = a2;
    sub_20CB8FDA4();
  }
  id v13 = (void *)*v6;
  id v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_20CB859D8((uint64_t)v14, (uint64_t)v13);

  if (!v15) {
    goto LABEL_30;
  }
  uint64_t v16 = sub_20CB85A1C(a3, a4, v15);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v16)
  {
    id v59 = a1;
    id v17 = v14;
    swift_bridgeObjectRetain();
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v63 = (void *)*v6;
    unint64_t v19 = v63;
    *unint64_t v6 = 0x8000000000000000;
    id v20 = v17;
    sub_20CB8FF44((uint64_t)v20);
    uint64_t v23 = v19[2];
    BOOL v24 = (v22 & 1) == 0;
    Swift::Int v25 = v23 + v24;
    if (__OFADD__(v23, v24))
    {
LABEL_28:
      __break(1u);
      goto LABEL_29;
    }
    unint64_t v26 = v21;
    char v27 = v22;
    sub_20CB650D0((uint64_t *)&unk_2676F14A0);
    if (_NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v25))
    {
      sub_20CB8FF44((uint64_t)v20);
      if ((v27 & 1) != (v29 & 1)) {
        goto LABEL_31;
      }
      unint64_t v26 = v28;
    }
    if ((v27 & 1) == 0)
    {
LABEL_29:
      __break(1u);
LABEL_30:
      __break(1u);
      goto LABEL_31;
    }
    id v30 = *(void **)(v63[7] + 8 * v26);
    char v31 = swift_isUniquelyReferenced_nonNull_native();
    int64_t v61 = v30;
    sub_20CB901E0(MEMORY[0x263F8EE80], a3, a4, v31);
    uint64_t v62 = v30;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_20CB9085C((uint64_t *)&v62, 1, &v63, v26, v20);

    swift_bridgeObjectRelease();
    *unint64_t v6 = (uint64_t)v63;

    a1 = v59;
  }
  id v32 = v14;
  swift_bridgeObjectRetain();
  id v60 = a1;
  char v33 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v63 = (void *)*v6;
  unint64_t v34 = v63;
  *unint64_t v6 = 0x8000000000000000;
  id v35 = v32;
  sub_20CB8FF44((uint64_t)v35);
  uint64_t v38 = v34[2];
  BOOL v39 = (v37 & 1) == 0;
  Swift::Int v40 = v38 + v39;
  if (__OFADD__(v38, v39))
  {
    __break(1u);
    goto LABEL_25;
  }
  unint64_t v41 = v36;
  char v42 = v37;
  sub_20CB650D0((uint64_t *)&unk_2676F14A0);
  if (_NativeDictionary.ensureUnique(isUnique:capacity:)(v33, v40))
  {
    sub_20CB8FF44((uint64_t)v35);
    if ((v42 & 1) == (v44 & 1))
    {
      unint64_t v41 = v43;
      goto LABEL_15;
    }
LABEL_31:
    sub_20CB6CEE4(0, &qword_2676F14B0);
    goto LABEL_32;
  }
LABEL_15:
  if ((v42 & 1) == 0)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v45 = *(void **)(v63[7] + 8 * v41);
  swift_bridgeObjectRetain();
  char v46 = swift_isUniquelyReferenced_nonNull_native();
  int64_t v61 = v45;
  swift_bridgeObjectRetain();
  uint64_t v47 = sub_20CB8FEC8(a3, a4, (uint64_t (*)(uint64_t))sub_20CB905B8);
  uint64_t v49 = v45[2];
  BOOL v50 = (v48 & 1) == 0;
  Swift::Int v51 = v49 + v50;
  if (__OFADD__(v49, v50))
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  unint64_t v52 = v47;
  char v53 = v48;
  sub_20CB650D0((uint64_t *)&unk_2676F11A0);
  if (_NativeDictionary.ensureUnique(isUnique:capacity:)(v46, v51))
  {
    uint64_t v54 = sub_20CB8FEC8(a3, a4, (uint64_t (*)(uint64_t))sub_20CB905B8);
    if ((v53 & 1) != (v55 & 1))
    {
LABEL_32:
      KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
      return;
    }
    unint64_t v52 = v54;
  }
  if ((v53 & 1) == 0) {
    goto LABEL_27;
  }
  uint64_t v56 = *(void *)(v61[7] + 8 * v52);
  char v57 = swift_isUniquelyReferenced_nonNull_native();
  sub_20CB900E4((uint64_t)v60, a5, v57);
  uint64_t v62 = (void *)v56;
  swift_bridgeObjectRelease();
  sub_20CB90788((uint64_t *)&v62, 1, &v61, v52, a3, a4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v62 = v61;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_20CB9085C((uint64_t *)&v62, 1, &v63, v41, v35);

  swift_bridgeObjectRelease();
  *unint64_t v6 = (uint64_t)v63;

  swift_bridgeObjectRelease();
}

uint64_t sub_20CB8747C()
{
  return swift_bridgeObjectRetain();
}

void *CKCodeOperation.__allocating_init(functionName:request:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20CB90F94();
  id v5 = objc_allocWithZone(v3);
  uint64_t v6 = sub_20CB83570();
  return CKCodeOperation.init(functionName:request:)(v6, v7, a3);
}

void *CKCodeOperation.init(functionName:request:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4 = (void *)MEMORY[0x263F8EED0];
  sub_20CB90F54();
  uint64_t v6 = (uint64_t)v3 + *(void *)(v5 + 112);
  sub_20CB90F54();
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v6, 1, 1, *(void *)(v7 + 80));
  sub_20CB830F4();
  sub_20CB90F54();
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v9, 1, 1, *(void *)(v8 + 88));
  sub_20CB830F4();
  *(void *)((char *)v3 + *(void *)(v10 + 136)) = 0;
  uint64_t v11 = MEMORY[0x263F8EE78];
  *(void *)((char *)v3 + *(void *)((*v4 & *v3) + 0x90)) = MEMORY[0x263F8EE78];
  *(void *)((char *)v3 + *(void *)((*v4 & *v3) + 0x98)) = v11;
  sub_20CB830F4();
  *(void *)((char *)v3 + *(void *)(v12 + 160)) = 0;
  sub_20CB830F4();
  id v14 = (char *)v3 + *(void *)(v13 + 168);
  *(_OWORD *)id v14 = 0u;
  *((_OWORD *)v14 + 1) = 0u;
  v14[32] = 2;
  sub_20CB830F4();
  *((unsigned char *)v3 + *(void *)(v15 + 176)) = 0;
  sub_20CB830F4();
  *(void *)((char *)v3 + *(void *)(v16 + 184)) = 0;
  sub_20CB830F4();
  sub_20CB90F54();
  *(void *)((char *)v3 + v17) = MEMORY[0x263F8EE80];
  sub_20CB830F4();
  unint64_t v19 = (void *)((char *)v3 + *(void *)(v18 + 200));
  *unint64_t v19 = 0;
  v19[1] = 0;
  sub_20CB830F4();
  unint64_t v21 = (void *)((char *)v3 + *(void *)(v20 + 208));
  *unint64_t v21 = 0;
  v21[1] = 0;
  sub_20CB830F4();
  uint64_t v23 = (void *)((char *)v3 + *(void *)(v22 + 216));
  *uint64_t v23 = 0;
  v23[1] = 0;
  sub_20CB830F4();
  Swift::Int v25 = (void *)((char *)v3 + *(void *)(v24 + 240));
  void *v25 = 0;
  v25[1] = 0;
  sub_20CB830F4();
  char v27 = (void *)((char *)v3 + *(void *)(v26 + 248));
  *char v27 = 0;
  v27[1] = 0;
  sub_20CB83208();
  uint64_t v28 = type metadata accessor for Optional();
  uint64_t v29 = *(void *)(v28 - 8);
  id v30 = *(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 24);
  char v31 = v3;
  v30(v6, a3, v28);
  swift_endAccess();
  sub_20CB83108();
  char v33 = (void *)((char *)v31 + *(void *)(v32 + 128));
  *char v33 = a1;
  v33[1] = a2;
  sub_20CB83108();
  *((unsigned char *)v31 + *(void *)(v34 + 232)) = 0;
  sub_20CB83108();
  *((unsigned char *)v31 + *(void *)(v35 + 224)) = 1;

  v45.receiver = v31;
  v45.super_class = (Class)type metadata accessor for CKCodeOperation();
  id v36 = objc_msgSendSuper2(&v45, sel_init);
  type metadata accessor for CKCodeOperation.CallbackRelay();
  char v37 = v36;
  id v38 = sub_20CB87900(v37);
  (*(void (**)(uint64_t, uint64_t))(v29 + 8))(a3, v28);
  uint64_t v39 = *(void *)((*v4 & *v37) + 0xB8);
  Swift::Int v40 = *(void **)((char *)v37 + v39);
  *(void *)((char *)v37 + v39) = v38;

  return v37;
}

uint64_t type metadata accessor for CKCodeOperation()
{
  return swift_getGenericMetadata();
}

uint64_t type metadata accessor for CKCodeOperation.CallbackRelay()
{
  return swift_getGenericMetadata();
}

id sub_20CB87900(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return sub_20CB8C240(a1);
}

uint64_t sub_20CB87934@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_20CB87A34();
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = v3;
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v4;
    *(void *)(result + 24) = v5;
    uint64_t v6 = sub_20CB6BA2C;
  }
  else
  {
    uint64_t v6 = 0;
  }
  *a1 = v6;
  a1[1] = result;
  return result;
}

uint64_t sub_20CB879A4(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  if (*a1)
  {
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v1;
    *(void *)(v3 + 24) = v2;
  }
  sub_20CB6B318(v1);
  return sub_20CB87A80();
}

uint64_t sub_20CB87A34()
{
  return sub_20CB831CC();
}

uint64_t sub_20CB87A80()
{
  return sub_20CB83484();
}

uint64_t (*sub_20CB87AD8())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_20CB87B38@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_20CB79F68();
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = v3;
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v4;
    *(void *)(result + 24) = v5;
    uint64_t v6 = sub_20CB90D3C;
  }
  else
  {
    uint64_t v6 = 0;
  }
  *a1 = v6;
  a1[1] = result;
  return result;
}

uint64_t sub_20CB87BA8(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  if (*a1)
  {
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v1;
    *(void *)(v3 + 24) = v2;
  }
  sub_20CB6B318(v1);
  return sub_20CB79FB4();
}

uint64_t sub_20CB87C38@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t (**a3)()@<X8>)
{
  long long v9 = *(_OWORD *)(a2 + a1 - 16);
  long long v10 = *(_OWORD *)(a2 + a1 - 32);
  uint64_t result = sub_20CB7A16C();
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = v5;
    uint64_t result = swift_allocObject();
    *(_OWORD *)(result + 16) = v10;
    *(_OWORD *)(result + 32) = v9;
    *(void *)(result + 48) = v6;
    *(void *)(result + 56) = v7;
    uint64_t v8 = sub_20CB90DD4;
  }
  else
  {
    uint64_t v8 = 0;
  }
  *a3 = v8;
  a3[1] = (uint64_t (*)())result;
  return result;
}

uint64_t sub_20CB87CCC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  if (*a1)
  {
    uint64_t v6 = a4 + a3;
    uint64_t v7 = swift_allocObject();
    long long v8 = *(_OWORD *)(v6 - 16);
    *(_OWORD *)(v7 + 16) = *(_OWORD *)(v6 - 32);
    *(_OWORD *)(v7 + 32) = v8;
    *(void *)(v7 + 48) = v4;
    *(void *)(v7 + 56) = v5;
  }
  sub_20CB6B318(v4);
  return sub_20CB7A1B8();
}

uint64_t (*sub_20CB87D68())()
{
  return j__swift_endAccess;
}

uint64_t sub_20CB87DC8()
{
  sub_20CB831A8();
  sub_20CB83118();
  return *v0;
}

uint64_t sub_20CB87E14(char a1)
{
  uint64_t result = sub_20CB83170();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*sub_20CB87E68())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_20CB87EC8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t (**a3)()@<X8>)
{
  long long v9 = *(_OWORD *)(a2 + a1 - 16);
  long long v10 = *(_OWORD *)(a2 + a1 - 32);
  uint64_t result = sub_20CB87FF8();
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = v5;
    uint64_t result = swift_allocObject();
    *(_OWORD *)(result + 16) = v10;
    *(_OWORD *)(result + 32) = v9;
    *(void *)(result + 48) = v6;
    *(void *)(result + 56) = v7;
    long long v8 = sub_20CB90CE0;
  }
  else
  {
    long long v8 = 0;
  }
  *a3 = v8;
  a3[1] = (uint64_t (*)())result;
  return result;
}

uint64_t sub_20CB87F5C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  if (*a1)
  {
    uint64_t v6 = a4 + a3;
    uint64_t v7 = swift_allocObject();
    long long v8 = *(_OWORD *)(v6 - 16);
    *(_OWORD *)(v7 + 16) = *(_OWORD *)(v6 - 32);
    *(_OWORD *)(v7 + 32) = v8;
    *(void *)(v7 + 48) = v4;
    *(void *)(v7 + 56) = v5;
  }
  sub_20CB6B318(v4);
  return sub_20CB88044();
}

uint64_t sub_20CB87FF8()
{
  return sub_20CB831CC();
}

uint64_t sub_20CB88044()
{
  return sub_20CB83484();
}

uint64_t sub_20CB8809C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t (**a3)()@<X8>)
{
  long long v9 = *(_OWORD *)(a2 + a1 - 16);
  long long v10 = *(_OWORD *)(a2 + a1 - 32);
  uint64_t result = sub_20CB7A7D8();
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = v5;
    uint64_t result = swift_allocObject();
    *(_OWORD *)(result + 16) = v10;
    *(_OWORD *)(result + 32) = v9;
    *(void *)(result + 48) = v6;
    *(void *)(result + 56) = v7;
    long long v8 = sub_20CB90DD4;
  }
  else
  {
    long long v8 = 0;
  }
  *a3 = v8;
  a3[1] = (uint64_t (*)())result;
  return result;
}

void sub_20CB88130(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  if (*a1)
  {
    uint64_t v6 = a4 + a3;
    uint64_t v7 = swift_allocObject();
    long long v8 = *(_OWORD *)(v6 - 16);
    *(_OWORD *)(v7 + 16) = *(_OWORD *)(v6 - 32);
    *(_OWORD *)(v7 + 32) = v8;
    *(void *)(v7 + 48) = v4;
    *(void *)(v7 + 56) = v5;
  }
  sub_20CB6B318(v4);
  sub_20CB881CC();
}

void sub_20CB881CC()
{
  sub_20CB83354();
  if (v0 && !*MEMORY[0x263EFD8A0])
  {
    __break(1u);
  }
  else
  {
    sub_20CB831A8();
    sub_20CB83170();
    sub_20CB83484();
  }
}

void (*sub_20CB8823C(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  sub_20CB831A8();
  uint64_t v5 = (uint64_t *)(v1 + *(void *)(v4 + 248));
  sub_20CB83278();
  uint64_t v6 = *v5;
  uint64_t v7 = v5[1];
  v3[3] = *v5;
  v3[4] = v7;
  sub_20CB6B318(v6);
  return sub_20CB882D0;
}

void sub_20CB882D0(uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  if (a2)
  {
    uint64_t v3 = sub_20CB83570();
    sub_20CB6B318(v3);
    sub_20CB881CC();
    sub_20CB6B280(v2[3]);
  }
  else
  {
    sub_20CB881CC();
  }
  free(v2);
}

uint64_t sub_20CB88348()
{
  sub_20CB832B8();
  long long v3 = *(_OWORD *)(v1 + 80);
  long long v4 = *(_OWORD *)(v1 + 96);
  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for CKCodeOperation();
  if (objc_msgSendSuper2(&v5, sel_hasCKOperationCallbacksSet, v3, v4)) {
    return 1;
  }
  uint64_t result = sub_20CB87A34();
  if (result || (uint64_t result = sub_20CB7A16C()) != 0 || (uint64_t result = sub_20CB79F68()) != 0 || (uint64_t result = sub_20CB87FF8()) != 0)
  {
    sub_20CB6B280(result);
    return 1;
  }
  return result;
}

uint64_t sub_20CB883CC(void *a1)
{
  id v1 = a1;
  char v2 = sub_20CB88348();

  return v2 & 1;
}

id sub_20CB88400()
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  sub_20CB83194();
  uint64_t v2 = v1;
  long long v4 = *(void **)(v3 + 80);
  uint64_t v5 = type metadata accessor for Optional();
  sub_20CB6D4D0();
  uint64_t v7 = v6;
  sub_20CB832AC();
  MEMORY[0x270FA5388](v8);
  long long v10 = (char *)&v21 - v9;
  uint64_t v11 = sub_20CB866A4();

  if (!v11
    || (sub_20CB78260(),
        uint64_t v12 = sub_20CB90F48(),
        int v14 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(v12, v13, (uint64_t)v4),
        (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v5),
        v14 == 1)
    || (id v15 = objc_msgSend(v0, sel_resolvedConfiguration),
        unsigned __int8 v16 = objc_msgSend(v15, sel_isLongLived),
        v15,
        (v16 & 1) != 0))
  {
    sub_20CB83314();
    related decl 'e' for CKErrorCode.init(_:description:)();
    return (id)swift_willThrow();
  }
  v22[0] = 0;
  v22[1] = v4;
  uint64_t v18 = *(void *)(v2 + 104);
  long long v23 = *(_OWORD *)(v2 + 88);
  uint64_t v24 = v18;
  unint64_t v19 = (objc_class *)type metadata accessor for CKCodeOperation();
  v21.receiver = v0;
  v21.super_class = v19;
  if ((objc_msgSendSuper2(&v21, sel_CKOperationShouldRun_, v22) & 1) == 0)
  {
    id v20 = v22[0];
    _convertNSErrorToError(_:)();

    return (id)swift_willThrow();
  }
  return v22[0];
}

uint64_t sub_20CB8862C(void *a1)
{
  id v1 = a1;
  sub_20CB88400();

  return 1;
}

char *sub_20CB886A8()
{
  return sub_20CB7AF04();
}

void sub_20CB886C0()
{
  sub_20CB83248();
  uint64_t v93 = (void *)(*MEMORY[0x263F8EED0] & *v0);
  uint64_t v98 = type metadata accessor for Google_Protobuf_Any();
  sub_20CB6D4D0();
  uint64_t v94 = v2;
  MEMORY[0x270FA5388](v3);
  sub_20CB6A8FC();
  uint64_t v97 = v5 - v4;
  uint64_t v6 = sub_20CB650D0((uint64_t *)&unk_26ACC7170);
  uint64_t v7 = sub_20CB6A8A4(v6);
  MEMORY[0x270FA5388](v7);
  v101 = (char *)&v87 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20CB832CC();
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v87 - v10;
  objc_super v100 = (char *)type metadata accessor for Ckcode_ProtectedEnvelope(0);
  sub_20CB6D4D0();
  uint64_t v95 = v12;
  MEMORY[0x270FA5388](v13);
  sub_20CB6A8FC();
  uint64_t v16 = v15 - v14;
  uint64_t v17 = type metadata accessor for Ckcode_RecordTransport();
  sub_20CB6D4D0();
  uint64_t v19 = v18;
  MEMORY[0x270FA5388](v20);
  sub_20CB833D8();
  sub_20CB832E8();
  uint64_t v22 = *(void *)(v21 + 80);
  uint64_t v23 = type metadata accessor for Optional();
  sub_20CB6A8A4(v23);
  sub_20CB832AC();
  MEMORY[0x270FA5388](v24);
  uint64_t v26 = (char *)&v87 - v25;
  sub_20CB6D4D0();
  uint64_t v28 = v27;
  sub_20CB832AC();
  MEMORY[0x270FA5388](v29);
  char v31 = (char *)&v87 - v30;
  id v96 = v0;
  sub_20CB78260();
  if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)v26, 1, v22) == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v89 = v28;
    sub_20CB83348();
    v32();
    uint64_t v33 = v93[12];
    uint64_t v34 = sub_20CB8EA0C(&qword_26ACC7138, (void (*)(uint64_t))type metadata accessor for Ckcode_RecordTransport);
    uint64_t v90 = v33;
    unint64_t v92 = v31;
    uint64_t v35 = sub_20CB6CF5C(v17, v22, v17, v33, v34);
    unint64_t v99 = 0;
    uint64_t v36 = *(void *)(v35 + 16);
    uint64_t v37 = (uint64_t)v101;
    uint64_t v91 = v22;
    if (v36)
    {
      unint64_t v38 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
      uint64_t v88 = v35;
      unint64_t v39 = v35 + v38;
      uint64_t v102 = *(void *)(v19 + 72);
      Swift::Int v40 = (char *)MEMORY[0x263F8EE78];
      while (1)
      {
        sub_20CB80CE8();
        uint64_t v42 = *v1;
        uint64_t v41 = v1[1];
        sub_20CB7B72C(*v1, v41);
        sub_20CB80E00((uint64_t)v1, (void (*)(void))type metadata accessor for Ckcode_RecordTransport);
        if ((~v41 & 0x3000000000000000) == 0) {
          goto LABEL_14;
        }
        if ((v41 & 0x2000000000000000) != 0) {
          break;
        }
        sub_20CB6C1EC(v42, v41);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          char v46 = (char *)sub_20CB832F4();
          Swift::Int v40 = sub_20CB80BF8(v46, v47, v48, (uint64_t)v40);
        }
        unint64_t v44 = *((void *)v40 + 2);
        unint64_t v43 = *((void *)v40 + 3);
        if (v44 >= v43 >> 1)
        {
          BOOL v49 = sub_20CB834F8(v43);
          Swift::Int v40 = sub_20CB80BF8((char *)v49, v50, v51, (uint64_t)v40);
        }
        *((void *)v40 + 2) = v44 + 1;
        objc_super v45 = &v40[16 * v44];
        *((void *)v45 + 4) = v42;
        *((void *)v45 + 5) = v41;
        sub_20CB6BEB4(v42, v41);
        uint64_t v37 = (uint64_t)v101;
        v39 += v102;
        if (!--v36)
        {
          swift_bridgeObjectRelease();
          uint64_t v22 = v91;
          goto LABEL_15;
        }
      }
      sub_20CB6BEB4(v42, v41);
LABEL_14:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_20CB83314();
      unint64_t v52 = (void *)related decl 'e' for CKErrorCode.init(_:description:)();
      char v53 = (void *)_convertErrorToNSError(_:)();

      objc_msgSend(v96, sel_finishWithError_, v53);
      goto LABEL_32;
    }
    swift_bridgeObjectRelease();
    Swift::Int v40 = (char *)MEMORY[0x263F8EE78];
LABEL_15:
    uint64_t v54 = sub_20CB8EA0C(&qword_26ACC7180, (void (*)(uint64_t))type metadata accessor for Ckcode_ProtectedEnvelope);
    unint64_t v55 = v99;
    uint64_t v56 = sub_20CB6CF5C((uint64_t)v100, v22, (uint64_t)v100, v90, v54);
    id v57 = v96;
    if (!v55)
    {
      uint64_t v58 = *(void *)(v56 + 16);
      if (!v58)
      {
        swift_bridgeObjectRelease();
        uint64_t v82 = MEMORY[0x263F8EE78];
LABEL_31:
        sub_20CB86880((uint64_t)v40);
        sub_20CB786B0(v82);
        uint64_t v83 = v93[11];
        uint64_t v84 = v93[13];
        uint64_t v103 = v91;
        uint64_t v104 = v83;
        uint64_t v105 = v90;
        uint64_t v106 = v84;
        id v85 = (objc_class *)type metadata accessor for CKCodeOperation();
        v107.receiver = v57;
        v107.super_class = v85;
        objc_msgSendSuper2(&v107, sel_performCKOperation);
LABEL_32:
        sub_20CB832A0();
        v86();
        sub_20CB83260();
        return;
      }
      sub_20CB90E94();
      uint64_t v88 = v59;
      uint64_t v61 = v59 + v60;
      uint64_t v102 = *(void *)(v62 + 72);
      uint64_t v95 = (void (**)(uint64_t, uint64_t, uint64_t))(v94 + 32);
      v94 += 8;
      unint64_t v99 = 0x800000020CB9ACC0;
      objc_super v100 = (char *)MEMORY[0x263F8EE78];
      while (1)
      {
        sub_20CB80CE8();
        sub_20CB909A4(v16, (uint64_t)v11, (uint64_t *)&unk_26ACC7170);
        sub_20CB80E00(v16, (void (*)(void))type metadata accessor for Ckcode_ProtectedEnvelope);
        uint64_t v63 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
        if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)v11, 1, v63) != 1)
        {
          sub_20CB909A4((uint64_t)v11, v37, (uint64_t *)&unk_26ACC7170);
          if (swift_getEnumCaseMultiPayload() == 1)
          {
            (*v95)(v97, v37, v98);
            sub_20CB8EA0C(&qword_26ACC68B0, MEMORY[0x263F50478]);
            uint64_t v64 = Message.serializedData(partial:)();
            uint64_t v66 = v65;
            if (swift_isUniquelyReferenced_nonNull_native())
            {
              uint64_t v67 = v100;
            }
            else
            {
              uint64_t v74 = (char *)sub_20CB832F4();
              uint64_t v67 = sub_20CB80BF8(v74, v75, v76, v77);
            }
            unint64_t v69 = *((void *)v67 + 2);
            unint64_t v68 = *((void *)v67 + 3);
            if (v69 >= v68 >> 1)
            {
              BOOL v78 = sub_20CB90F60(v68);
              uint64_t v67 = sub_20CB80BF8((char *)v78, v79, v80, v81);
            }
            *((void *)v67 + 2) = v69 + 1;
            objc_super v100 = v67;
            uint64_t v70 = &v67[16 * v69];
            *((void *)v70 + 4) = v64;
            *((void *)v70 + 5) = v66;
            sub_20CB832A0();
            v71();
            id v57 = v96;
            uint64_t v37 = (uint64_t)v101;
            goto LABEL_27;
          }
          sub_20CB80E00(v37, (void (*)(void))type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents);
        }
        uint64_t v72 = (void *)related decl 'e' for CKErrorCode.init(_:description:)();
        uint64_t v73 = (void *)_convertErrorToNSError(_:)();

        objc_msgSend(v57, sel_finishWithError_, v73);
LABEL_27:
        sub_20CB8FA20((uint64_t)v11, (uint64_t *)&unk_26ACC7170);
        v61 += v102;
        if (!--v58)
        {
          swift_bridgeObjectRelease();
          uint64_t v82 = (uint64_t)v100;
          goto LABEL_31;
        }
      }
    }
  }
  sub_20CB90E14();
  swift_unexpectedError();
  __break(1u);
}

void sub_20CB88ED8(void *a1)
{
  id v1 = a1;
  sub_20CB886C0();
}

uint64_t sub_20CB88F20()
{
  sub_20CB7B788();
  return swift_getObjCClassFromMetadata();
}

id sub_20CB88F48()
{
  uint64_t v0 = sub_20CB7B7DC();
  return v0;
}

uint64_t sub_20CB88F70()
{
  return MEMORY[0x270EE3510](v0, "CKCodeOperation", 15, 2);
}

void sub_20CB88F88(void *a1)
{
  id v1 = a1;
  sub_20CB88F70();
}

uint64_t sub_20CB88FD0(uint64_t a1)
{
  return MEMORY[0x270EE3508](v1, "CKCodeOperation", 15, 2, a1);
}

void sub_20CB88FEC(void *a1, uint64_t a2, void *a3)
{
  id v4 = a1;
  id v5 = a3;
  sub_20CB88FD0((uint64_t)a3);
}

id sub_20CB89044(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)sub_20CB7B8E4();

  return v2;
}

void sub_20CB89088()
{
  sub_20CB83248();
  id v1 = v0;
  uint64_t v3 = v2;
  sub_20CB90E3C();
  uint64_t v5 = v4;
  uint64_t v6 = type metadata accessor for URL();
  sub_20CB6D4D0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  sub_20CB90F10();
  uint64_t v10 = sub_20CB650D0(qword_26ACC6B38);
  uint64_t v11 = sub_20CB6A8A4(v10);
  MEMORY[0x270FA5388](v11);
  sub_20CB6A8FC();
  uint64_t v14 = v13 - v12;
  self;
  uint64_t v15 = (void *)swift_dynamicCastObjCClassUnconditional();
  uint64_t v16 = sub_20CB866A4();
  if (!v16)
  {
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v17 = v16;
  id v18 = v3;
  id v19 = objc_msgSend(v17, sel_serviceName);

  if (!v19)
  {
    uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v19 = (id)MEMORY[0x210555430](v20);
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v15, sel_setServiceName_, v19);

  uint64_t v21 = sub_20CB866A4();
  if (!v21) {
    goto LABEL_22;
  }
  uint64_t v22 = v21;
  id v23 = objc_msgSend(v21, sel_serviceInstanceURL);

  if (v23)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    sub_20CB83348();
    v24();
    _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v14, 0, 1, v6);
    uint64_t v25 = sub_20CB90F48();
    if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(v25, v26, v6) != 1)
    {
      URL._bridgeToObjectiveC()(v27);
      uint64_t v29 = v28;
      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v14, v6);
      goto LABEL_10;
    }
  }
  else
  {
    _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v14, 1, 1, v6);
  }
  uint64_t v29 = 0;
LABEL_10:
  objc_msgSend(v15, sel_setClientRuntimeProvidedServiceURL_, v29);

  uint64_t v30 = sub_20CB866A4();
  if (!v30)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  char v31 = v30;
  CKCodeService.databaseScope.getter();
  char v33 = v32;

  objc_msgSend(v15, sel_setEnqueuedOnContainerService_, v33 & 1);
  uint64_t v34 = sub_20CB866A4();
  if (!v34)
  {
LABEL_24:
    __break(1u);
    return;
  }
  uint64_t v35 = v34;
  id v36 = v18;
  id v37 = CKCodeService.databaseScope.getter();
  char v39 = v38;

  if (v39) {
    uint64_t v40 = 1;
  }
  else {
    uint64_t v40 = (uint64_t)v37;
  }
  objc_msgSend(v15, sel_setDatabaseScope_, v40);

  uint64_t v41 = sub_20CB78550();
  uint64_t v42 = (void *)MEMORY[0x210555430](v41);
  swift_bridgeObjectRelease();
  objc_msgSend(v15, sel_setFunctionName_, v42);

  sub_20CB86858();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  objc_msgSend(v15, sel_setRequestLocalSerializations_, isa);

  sub_20CB78688();
  Class v44 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  objc_msgSend(v15, sel_setRequestLocalEnvelopes_, v44);

  sub_20CB869C4((uint64_t)&v52);
  long long v45 = v52;
  long long v46 = v53;
  if (v54)
  {
    if (v54 == 1)
    {
      objc_msgSend(v15, sel_setDataProtectionType_, 2);
      int64_t v47 = (void *)MEMORY[0x210555430](v45, *((void *)&v45 + 1));
      swift_bridgeObjectRelease();
      objc_msgSend(v15, sel_setTrustedTargetDomain_, v47);

      char v48 = (void *)MEMORY[0x210555430](v46, *((void *)&v46 + 1));
      swift_bridgeObjectRelease();
      objc_msgSend(v15, sel_setTrustedTargetOID_, v48);
    }
    else
    {
      objc_msgSend(v15, sel_setDataProtectionType_, 0);
    }
  }
  else
  {
    sub_20CB64CA4(v52, *((unint64_t *)&v52 + 1));
    Class v49 = Data._bridgeToObjectiveC()().super.isa;
    sub_20CB90EA4();
    objc_msgSend(v15, sel_setPermittedRemoteMeasurement_, v49);

    objc_msgSend(v15, sel_setDataProtectionType_, 1);
    sub_20CB90EA4();
  }
  objc_msgSend(v15, sel_setShouldSendRecordPCSKeys_, sub_20CB86D58() & 1);
  objc_msgSend(v15, sel_setShouldFetchAssetContentInMemory_, sub_20CB7A4A8() & 1);
  long long v50 = *(_OWORD *)(v5 + 96);
  long long v52 = *(_OWORD *)(v5 + 80);
  long long v53 = v50;
  v51.receiver = v1;
  v51.super_class = (Class)type metadata accessor for CKCodeOperation();
  objc_msgSendSuper2(&v51, sel_fillOutOperationInfo_, v36);

  sub_20CB83260();
}

void sub_20CB89564(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  sub_20CB89088();
}

void sub_20CB895CC()
{
}

void sub_20CB89628()
{
}

id sub_20CB89638(uint64_t a1)
{
  sub_20CB6CEE4(0, (unint64_t *)&unk_26ACC7090);
  objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_applyDaemonCallbackInterfaceTweaks_, a1);
  sub_20CB6CEE4(0, (unint64_t *)&unk_26ACC70A0);
  objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_applyDaemonCallbackInterfaceTweaks_, a1);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  long long v6 = *(_OWORD *)(v1 + 80);
  long long v7 = *(_OWORD *)(v1 + 96);
  id v4 = (objc_class *)(*MEMORY[0x263F8EED0] & *(void *)type metadata accessor for CKCodeOperation());
  v8.receiver = ObjCClassFromMetadata;
  v8.super_class = v4;
  return objc_msgSendSuper2(&v8, sel_applyDaemonCallbackInterfaceTweaks_, a1, v6, v7);
}

void sub_20CB89724(uint64_t a1, uint64_t a2, void *a3)
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  sub_20CB89638((uint64_t)v4);
}

void sub_20CB89774()
{
  sub_20CB83248();
  uint64_t v61 = v3;
  uint64_t v63 = v4;
  uint64_t v58 = v5;
  sub_20CB90F94();
  uint64_t v6 = *MEMORY[0x263F8EED0] & *v0;
  uint64_t v7 = v6;
  uint64_t v8 = type metadata accessor for Ckcode_ProtectedEnvelope(0);
  sub_20CB6D4D0();
  uint64_t v64 = v9;
  MEMORY[0x270FA5388](v10);
  sub_20CB6A924();
  uint64_t v11 = *(char **)(v6 + 80);
  uint64_t v12 = type metadata accessor for Optional();
  sub_20CB6A8A4(v12);
  sub_20CB832AC();
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)v56 - v14;
  sub_20CB6D4D0();
  uint64_t v17 = v16;
  MEMORY[0x270FA5388](v18);
  sub_20CB83220();
  id v57 = v19;
  sub_20CB832CC();
  MEMORY[0x270FA5388](v20);
  uint64_t v59 = (char *)v56 - v21;
  sub_20CB832CC();
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (char *)v56 - v23;
  uint64_t v60 = v0;
  sub_20CB78260();
  if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)v15, 1, (uint64_t)v11) == 1)
  {
    __break(1u);
  }
  else
  {
    v56[3] = *(void *)(v17 + 32);
    v56[4] = v17 + 32;
    sub_20CB83348();
    uint64_t v26 = v25();
    uint64_t v27 = *(void *)(v2 + 16);
    uint64_t v62 = v7;
    if (v27)
    {
      MEMORY[0x270FA5388](v26);
      v56[-2] = v1;
      uint64_t v28 = swift_bridgeObjectRetain();
      uint64_t v29 = (void *)sub_20CB85B7C(v28, (void (*)(uint64_t, uint64_t, unint64_t))sub_20CB90A0C);
      swift_bridgeObjectRelease();
      uint64_t v30 = type metadata accessor for Ckcode_RecordTransport();
      uint64_t v31 = *(void *)(v62 + 96);
      uint64_t v32 = sub_20CB8EA0C(&qword_26ACC7138, (void (*)(uint64_t))type metadata accessor for Ckcode_RecordTransport);
      Message.substituteMessages<A>(substitutionType:substitutions:)(v29, (uint64_t)v11, v30, v31, v32, v59);
      uint64_t v33 = sub_20CB833FC();
      v34(v33);
      swift_bridgeObjectRelease();
      uint64_t v35 = v63;
      sub_20CB83348();
      v36();
      if (*MEMORY[0x263EFD8A0])
      {
        id v37 = (void (*)(char *))sub_20CB7A7D8();
        if (v37)
        {
          uint64_t v38 = (uint64_t)v37;
          v37(v24);
          sub_20CB6B280(v38);
        }
      }
    }
    else
    {
      uint64_t v35 = v63;
    }
    uint64_t v39 = *(void *)(v58 + 16);
    if (v39)
    {
      v56[1] = v24;
      v56[2] = v17;
      uint64_t v59 = v11;
      uint64_t v65 = (void *)MEMORY[0x263F8EE78];
      uint64_t v40 = v58;
      sub_20CB90A14();
      uint64_t v42 = (unint64_t *)(v40 + 40);
      do
      {
        uint64_t v43 = *(v42 - 1);
        unint64_t v44 = *v42;
        MEMORY[0x270FA5388](v41);
        v56[-2] = v43;
        v56[-1] = v44;
        sub_20CB64CA4(v43, v44);
        uint64_t v45 = sub_20CB8EA0C(&qword_26ACC7180, (void (*)(uint64_t))type metadata accessor for Ckcode_ProtectedEnvelope);
        static Message.with(_:)();
        sub_20CB64DC8(v43, v44);
        long long v46 = v65;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_20CB90A14();
          long long v46 = v65;
        }
        unint64_t v47 = v46[2];
        if (v47 >= v46[3] >> 1)
        {
          sub_20CB90A14();
          long long v46 = v65;
        }
        v42 += 2;
        v46[2] = v47 + 1;
        sub_20CB90E94();
        uint64_t v41 = sub_20CB82E7C();
        --v39;
      }
      while (v39);
      Message.substituteMessages<A>(substitutionType:substitutions:)(v46, (uint64_t)v59, v8, *(void *)(v62 + 96), v45, v57);
      uint64_t v48 = sub_20CB833FC();
      v49(v48);
      swift_release();
      sub_20CB83348();
      v50();
      uint64_t v35 = v63;
    }
    uint64_t v51 = Message.serializedData(partial:)();
    unint64_t v53 = v52;
    sub_20CB64CA4(v51, v52);
    v35(v51, v53, 0);
    sub_20CB64DC8(v51, v53);
    sub_20CB64DC8(v51, v53);
    uint64_t v54 = sub_20CB834D0();
    v55(v54);
    sub_20CB83260();
  }
}

uint64_t sub_20CB89DC0()
{
  return static Message.with(_:)();
}

uint64_t sub_20CB89E80(uint64_t *a1, uint64_t a2, unint64_t a3)
{
  sub_20CB8FA20((uint64_t)a1, (uint64_t *)&unk_26ACC7170);
  *a1 = a2;
  a1[1] = a3;
  uint64_t v6 = type metadata accessor for Ckcode_ProtectedEnvelope.OneOf_Contents(0);
  swift_storeEnumTagMultiPayload();
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)a1, 0, 1, v6);
  return sub_20CB64CA4(a2, a3);
}

void sub_20CB89F0C()
{
  sub_20CB83248();
  uint64_t v93 = v2;
  uint64_t v94 = v1;
  unint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v7 = *MEMORY[0x263F8EED0] & *v0;
  type metadata accessor for Ckcode_RecordTransport();
  sub_20CB6D4D0();
  uint64_t v90 = v9;
  uint64_t v91 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v95 = (char *)v78 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20CB832CC();
  MEMORY[0x270FA5388](v11);
  uint64_t v89 = (_OWORD *)((char *)v78 - v12);
  sub_20CB832CC();
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (void *)((char *)v78 - v14);
  uint64_t v16 = *(void *)(v7 + 88);
  uint64_t v17 = type metadata accessor for Optional();
  sub_20CB6D4D0();
  uint64_t v88 = v18;
  sub_20CB832AC();
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)v78 - v20;
  uint64_t v22 = type metadata accessor for BinaryDecodingOptions();
  uint64_t v23 = sub_20CB6A8A4(v22);
  MEMORY[0x270FA5388](v23);
  sub_20CB6A924();
  sub_20CB6D4D0();
  uint64_t v92 = v24;
  MEMORY[0x270FA5388](v25);
  sub_20CB6A8BC();
  uint64_t v28 = (char *)(v26 - v27);
  MEMORY[0x270FA5388](v29);
  uint64_t v99 = v6;
  unint64_t v100 = v4;
  uint64_t v98 = 0;
  long long v96 = 0u;
  long long v97 = 0u;
  uint64_t v30 = v7;
  uint64_t v31 = v0;
  uint64_t v32 = *(void *)(v30 + 104);
  unint64_t v33 = v4;
  uint64_t v35 = (char *)v78 - v34;
  sub_20CB64CA4(v6, v33);
  BinaryDecodingOptions.init()();
  Message.init<A>(serializedBytes:extensions:partial:options:)();
  uint64_t v85 = v17;
  uint64_t v86 = v28;
  uint64_t v36 = v92 + 16;
  id v37 = *(void (**)(char *, char *, uint64_t))(v92 + 16);
  v37(v21, v35, v16);
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)v21, 0, 1, v16);
  sub_20CB784AC();
  uint64_t v83 = sub_20CB8EA0C(&qword_26ACC7138, (void (*)(uint64_t))type metadata accessor for Ckcode_RecordTransport);
  uint64_t v84 = v32;
  uint64_t v38 = sub_20CB6CF5C(v91, v16, v91, v32, v83);
  uint64_t v82 = 0;
  v78[0] = v37;
  v78[1] = v36;
  int64_t v79 = v21;
  uint64_t v39 = *(void *)(v38 + 16);
  uint64_t v40 = (uint64_t)v95;
  uint64_t v87 = v16;
  if (v39)
  {
    char v80 = v35;
    id v81 = v31;
    sub_20CB90E94();
    uint64_t v43 = v41 + v42;
    uint64_t v45 = *(void *)(v44 + 72);
    long long v46 = (char *)MEMORY[0x263F8EE78];
    while (1)
    {
      sub_20CB80CE8();
      uint64_t v47 = *v15;
      uint64_t v48 = v15[1];
      sub_20CB7B72C(*v15, v48);
      sub_20CB80E00((uint64_t)v15, (void (*)(void))type metadata accessor for Ckcode_RecordTransport);
      if ((~v48 & 0x3000000000000000) == 0) {
        break;
      }
      if ((v48 & 0x2000000000000000) == 0)
      {
        sub_20CB6BEB4(v47, v48);
        break;
      }
      sub_20CB6C1EC(v47, v48);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        unint64_t v52 = (char *)sub_20CB832F4();
        long long v46 = sub_20CB80BF8(v52, v53, v54, (uint64_t)v46);
      }
      unint64_t v50 = *((void *)v46 + 2);
      unint64_t v49 = *((void *)v46 + 3);
      if (v50 >= v49 >> 1)
      {
        BOOL v55 = sub_20CB90F60(v49);
        long long v46 = sub_20CB80BF8((char *)v55, v56, v57, (uint64_t)v46);
      }
      *((void *)v46 + 2) = v50 + 1;
      uint64_t v51 = &v46[16 * v50];
      *((void *)v51 + 4) = v47;
      *((void *)v51 + 5) = v48 & 0xDFFFFFFFFFFFFFFFLL;
      sub_20CB6BEB4(v47, v48);
      v43 += v45;
      --v39;
      uint64_t v40 = (uint64_t)v95;
      if (!v39)
      {
        swift_bridgeObjectRelease();
        uint64_t v35 = v80;
        uint64_t v16 = v87;
        goto LABEL_14;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_20CB83314();
    id v58 = (id)related decl 'e' for CKErrorCode.init(_:description:)();
    uint64_t v59 = (void *)_convertErrorToNSError(_:)();

    objc_msgSend(v81, sel_finishWithError_, v59);
    id v60 = v58;
    v94(0, v58);

    sub_20CB832A0();
    v61();
    goto LABEL_19;
  }
  swift_bridgeObjectRelease();
  long long v46 = (char *)MEMORY[0x263F8EE78];
LABEL_14:
  uint64_t v62 = (uint64_t)v89;
  *uint64_t v89 = xmmword_20CB96B40;
  uint64_t v63 = v91;
  UnknownStorage.init()();
  *(_OWORD *)(v62 + *(int *)(v63 + 24)) = xmmword_20CB96470;
  sub_20CB80CE8();
  uint64_t v64 = (void *)sub_20CB85D14(v40, *((void *)v46 + 2));
  uint64_t v65 = v86;
  uint64_t v66 = v82;
  Message.substituteMessages<A>(substitutionType:substitutions:)(v64, v16, v63, v84, v83, v86);
  swift_bridgeObjectRelease();
  uint64_t v67 = v92;
  uint64_t v68 = v85;
  if (!v66)
  {
    if (*((void *)v46 + 2))
    {
      uint64_t v69 = sub_20CB87FF8();
      if (v69)
      {
        uint64_t v70 = (void (*)(uint64_t))v69;
        uint64_t v71 = (uint64_t)v79;
        uint64_t v72 = v65;
        uint64_t v73 = v87;
        ((void (*)(char *, char *, uint64_t))v78[0])(v79, v72, v87);
        uint64_t v74 = v73;
        uint64_t v65 = v86;
        _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v71, 0, 1, v74);
        v70(v71);
        uint64_t v75 = sub_20CB6A8B0();
        sub_20CB6B280(v75);
        (*(void (**)(uint64_t, uint64_t))(v88 + 8))(v71, v68);
      }
    }
    v94(v46, 0);
    swift_bridgeObjectRelease();
    char v76 = *(void (**)(char *, uint64_t))(v67 + 8);
    uint64_t v77 = v87;
    v76(v65, v87);
    sub_20CB80E00(v62, (void (*)(void))type metadata accessor for Ckcode_RecordTransport);
    v76(v35, v77);
LABEL_19:
    sub_20CB83260();
    return;
  }
  sub_20CB90E14();
  swift_unexpectedError();
  __break(1u);
}

void sub_20CB8A62C()
{
  sub_20CB83248();
  sub_20CB83194();
  uint64_t v55 = v1;
  uint64_t v64 = v0;
  unint64_t v3 = *(void *)(v2 + 88);
  sub_20CB6D4D0();
  uint64_t v5 = v4;
  sub_20CB832AC();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v50 - v7;
  uint64_t v9 = type metadata accessor for Optional();
  sub_20CB6D4D0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  sub_20CB6A8BC();
  uint64_t v15 = (void *)(v13 - v14);
  MEMORY[0x270FA5388](v16);
  id v60 = (char *)&v50 - v17;
  sub_20CB832CC();
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v50 - v19;
  type metadata accessor for Ckcode_RecordTransport();
  sub_20CB6D4D0();
  MEMORY[0x270FA5388](v21);
  sub_20CB6A8BC();
  uint64_t v23 = (char *)MEMORY[0x270FA5388](v22);
  uint64_t v26 = (uint64_t *)((char *)&v50 - v25);
  if (v24 >> 62)
  {
LABEL_19:
    unint64_t v52 = v23;
    int64_t v53 = v8;
    unint64_t v63 = v24;
    swift_bridgeObjectRetain();
    uint64_t v8 = v53;
    uint64_t v61 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    uint64_t v27 = v61;
    uint64_t v23 = v52;
    unint64_t v24 = v63;
    if (!v61) {
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v27 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v27) {
      goto LABEL_17;
    }
  }
  unint64_t v52 = v23;
  int64_t v53 = v8;
  uint64_t v51 = v5;
  int64_t v56 = v20;
  uint64_t v57 = v11;
  char v54 = v15;
  uint64_t v58 = v9;
  unint64_t v59 = v3;
  unint64_t v62 = v24 & 0xC000000000000001;
  unint64_t v63 = v24;
  uint64_t v61 = v27;
  swift_bridgeObjectRetain();
  uint64_t v9 = 0;
  uint64_t v15 = (void *)MEMORY[0x263F8EE78];
  uint64_t v5 = 4;
  do
  {
    uint64_t v8 = (char *)(v5 - 4);
    if (v62) {
      uint64_t v23 = (char *)MEMORY[0x2105556F0](v5 - 4, v63);
    }
    else {
      uint64_t v23 = (char *)*(id *)(v63 + 8 * v5);
    }
    uint64_t v20 = v23;
    uint64_t v11 = v5 - 3;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_19;
    }
    sub_20CB8AB7C(v23);
    uint64_t v28 = v20;
    Ckcode_RecordTransport.init(_:)(v28, v26);
    sub_20CB80CE8();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      char v30 = sub_20CB832F4();
      uint64_t v15 = (void *)sub_20CB80E54(v30, v31, v32, (uint64_t)v15);
    }
    unint64_t v3 = v15[2];
    unint64_t v29 = v15[3];
    if (v3 >= v29 >> 1)
    {
      char v33 = sub_20CB834F8(v29);
      uint64_t v15 = (void *)sub_20CB80E54(v33, v34, v35, (uint64_t)v15);
    }
    long long v15[2] = v3 + 1;
    sub_20CB82E7C();

    sub_20CB80E00((uint64_t)v26, (void (*)(void))type metadata accessor for Ckcode_RecordTransport);
    ++v5;
  }
  while (v11 != v61);
  swift_bridgeObjectRelease();
  uint64_t v36 = v60;
  sub_20CB78408();
  uint64_t v37 = sub_20CB90F48();
  uint64_t v38 = v59;
  if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(v37, v39, v59))
  {
    swift_bridgeObjectRelease();
    uint64_t v40 = v57;
    uint64_t v41 = *(void (**)(char *, uint64_t))(v57 + 8);
    uint64_t v42 = v36;
    uint64_t v43 = v58;
    v41(v42, v58);
    uint64_t v44 = 1;
    uint64_t v45 = v56;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v51 + 16))(v53, v36, v38);
    uint64_t v40 = v57;
    uint64_t v41 = *(void (**)(char *, uint64_t))(v57 + 8);
    long long v46 = v36;
    uint64_t v43 = v58;
    v41(v46, v58);
    unint64_t v63 = *(void *)(v55 + 104);
    uint64_t v47 = sub_20CB8EA0C(&qword_26ACC7138, (void (*)(uint64_t))type metadata accessor for Ckcode_RecordTransport);
    uint64_t v45 = v56;
    Message.substituteMessages<A>(substitutionType:substitutions:)(v15, v38, (uint64_t)v52, v63, v47, v56);
    uint64_t v48 = sub_20CB83414();
    v49(v48);
    swift_bridgeObjectRelease();
    uint64_t v44 = 0;
  }
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)v45, v44, 1, v38);
  (*(void (**)(void *, char *, uint64_t))(v40 + 16))(v54, v45, v43);
  sub_20CB784AC();
  v41(v45, v43);
LABEL_17:
  sub_20CB83260();
}

void sub_20CB8AB7C(void *a1)
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend(a1, sel_recordID);
  uint64_t v5 = sub_20CB8747C();
  id v64 = v1;
  uint64_t v6 = sub_20CB792DC(v4, v5);

  swift_bridgeObjectRelease();
  if (!v6) {
    return;
  }
  int64_t v7 = 0;
  uint64_t v8 = v6 + 64;
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  int64_t v12 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v58 = a1;
  uint64_t v59 = v2;
  uint64_t v63 = v6;
  int64_t v56 = v12;
  uint64_t v57 = v6 + 64;
  if (!v11) {
    goto LABEL_7;
  }
LABEL_6:
  uint64_t v60 = (v11 - 1) & v11;
  int64_t v61 = v7;
  for (unint64_t i = __clz(__rbit64(v11)) | (v7 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v16 << 6))
  {
    uint64_t v18 = *(void *)(v6 + 56);
    uint64_t v19 = (uint64_t *)(*(void *)(v6 + 48) + 16 * i);
    uint64_t v20 = *v19;
    uint64_t v21 = (void *)v19[1];
    uint64_t v22 = *(void *)(v18 + 8 * i);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v62 = v20;
    uint64_t v23 = CKRecord.subscript.getter();
    int64_t v24 = 0;
    uint64_t v25 = *(void *)(v22 + 64);
    uint64_t v65 = v22 + 64;
    uint64_t v26 = 1 << *(unsigned char *)(v22 + 32);
    if (v26 < 64) {
      uint64_t v27 = ~(-1 << v26);
    }
    else {
      uint64_t v27 = -1;
    }
    unint64_t v28 = v27 & v25;
    int64_t v66 = (unint64_t)(v26 + 63) >> 6;
    if ((v27 & v25) != 0)
    {
LABEL_25:
      unint64_t v29 = __clz(__rbit64(v28));
      v28 &= v28 - 1;
      unint64_t v30 = v29 | (v24 << 6);
      goto LABEL_40;
    }
LABEL_26:
    int64_t v31 = v24 + 1;
    if (__OFADD__(v24, 1))
    {
      __break(1u);
      goto LABEL_67;
    }
    if (v31 < v66)
    {
      unint64_t v32 = *(void *)(v65 + 8 * v31);
      ++v24;
      if (v32) {
        goto LABEL_39;
      }
      int64_t v24 = v31 + 1;
      if (v31 + 1 < v66)
      {
        unint64_t v32 = *(void *)(v65 + 8 * v24);
        if (v32) {
          goto LABEL_39;
        }
        int64_t v24 = v31 + 2;
        if (v31 + 2 < v66)
        {
          unint64_t v32 = *(void *)(v65 + 8 * v24);
          if (v32) {
            goto LABEL_39;
          }
          int64_t v33 = v31 + 3;
          if (v33 < v66) {
            break;
          }
        }
      }
    }
LABEL_57:
    swift_unknownObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v6 = v63;
    int64_t v12 = v56;
    uint64_t v8 = v57;
    unint64_t v11 = v60;
    int64_t v7 = v61;
    if (v60) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v14 = v7 + 1;
    if (__OFADD__(v7, 1)) {
      goto LABEL_68;
    }
    if (v14 >= v12)
    {
LABEL_65:
      swift_release();
      return;
    }
    unint64_t v15 = *(void *)(v8 + 8 * v14);
    int64_t v16 = v7 + 1;
    if (!v15)
    {
      int64_t v16 = v7 + 2;
      if (v7 + 2 >= v12) {
        goto LABEL_65;
      }
      unint64_t v15 = *(void *)(v8 + 8 * v16);
      if (!v15)
      {
        int64_t v16 = v7 + 3;
        if (v7 + 3 >= v12) {
          goto LABEL_65;
        }
        unint64_t v15 = *(void *)(v8 + 8 * v16);
        if (!v15)
        {
          uint64_t v17 = v7 + 4;
          if (v7 + 4 >= v12) {
            goto LABEL_65;
          }
          unint64_t v15 = *(void *)(v8 + 8 * v17);
          if (!v15)
          {
            while (1)
            {
              int64_t v16 = v17 + 1;
              if (__OFADD__(v17, 1)) {
                goto LABEL_69;
              }
              if (v16 >= v12) {
                goto LABEL_65;
              }
              unint64_t v15 = *(void *)(v8 + 8 * v16);
              ++v17;
              if (v15) {
                goto LABEL_20;
              }
            }
          }
          int64_t v16 = v7 + 4;
        }
      }
    }
LABEL_20:
    uint64_t v60 = (v15 - 1) & v15;
    int64_t v61 = v16;
  }
  unint64_t v32 = *(void *)(v65 + 8 * v33);
  if (!v32)
  {
    while (1)
    {
      int64_t v24 = v33 + 1;
      if (__OFADD__(v33, 1)) {
        break;
      }
      if (v24 >= v66) {
        goto LABEL_57;
      }
      unint64_t v32 = *(void *)(v65 + 8 * v24);
      ++v33;
      if (v32) {
        goto LABEL_39;
      }
    }
LABEL_67:
    __break(1u);
LABEL_68:
    __break(1u);
LABEL_69:
    __break(1u);
LABEL_70:
    __break(1u);
  }
  int64_t v24 = v33;
LABEL_39:
  unint64_t v28 = (v32 - 1) & v32;
  unint64_t v30 = __clz(__rbit64(v32)) + (v24 << 6);
LABEL_40:
  int64_t v34 = *(void **)(*(void *)(v22 + 56) + 8 * v30);
  if (!v23) {
    goto LABEL_59;
  }
  uint64_t v35 = *(void *)(*(void *)(v22 + 48) + 8 * v30);
  self;
  uint64_t v36 = swift_dynamicCastObjCClass();
  if (!v36)
  {
    self;
    uint64_t v41 = swift_dynamicCastObjCClass();
    if (v41)
    {
      id v40 = (id)v41;
      swift_unknownObjectRetain_n();
      id v42 = v34;
      goto LABEL_47;
    }
LABEL_59:
    id v68 = 0;
    unint64_t v69 = 0xE000000000000000;
    id v53 = v34;
    _StringGuts.grow(_:)(46);
    swift_bridgeObjectRelease();
    id v68 = (id)0xD00000000000002CLL;
    unint64_t v69 = 0x800000020CB9B370;
    v54._countAndFlagsBits = v62;
    v54._object = v21;
    String.append(_:)(v54);
    swift_bridgeObjectRelease();
    related decl 'e' for CKErrorCode.init(_:description:)();
    swift_willThrow();
    swift_release();
    swift_release();
    swift_unknownObjectRelease();

    return;
  }
  uint64_t v37 = (void *)v36;
  id v38 = v34;
  swift_unknownObjectRetain();
  if (v35 < 0 || v35 >= (uint64_t)objc_msgSend(v37, sel_count))
  {
    swift_bridgeObjectRelease();
    related decl 'e' for CKErrorCode.init(_:description:)();
    swift_willThrow();
    swift_release();
    swift_release();

    swift_unknownObjectRelease_n();
    return;
  }
  id v39 = objc_msgSend(v37, sel_objectAtIndexedSubscript_, v35);
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_20CB6CEE4(0, (unint64_t *)&qword_26ACC68D0);
  swift_dynamicCast();
  id v40 = v67;
LABEL_47:
  if (*MEMORY[0x263EFD8A0]
    && (uint64_t v43 = (void *)MEMORY[0x210555430](0xD000000000000018, 0x800000020CB9B3A0),
        unsigned int v44 = objc_msgSend(v64, sel__BOOLForUnitTestOverride_defaultValue_, v43, 0),
        v43,
        v44))
  {
    swift_bridgeObjectRelease();
    objc_msgSend(v40, sel_setAssetContent_, 0);
    type metadata accessor for CKError(0);
    sub_20CB8E2CC(MEMORY[0x263F8EE78]);
    sub_20CB8EA0C((unint64_t *)&unk_2676F11B0, type metadata accessor for CKError);
    _BridgedStoredNSError.init(_:userInfo:)();
  }
  else
  {
    id v68 = 0;
    id v45 = objc_msgSend(v34, sel_assetContentWithExpectedSignature_verificationKey_error_, 0, 0, &v68, v56, v57, v58, v59);
    id v46 = v68;
    if (v45)
    {
      uint64_t v47 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v49 = v48;

      switch(v49 >> 62)
      {
        case 1uLL:
          uint64_t v50 = (int)v47;
          uint64_t v51 = v47 >> 32;
          goto LABEL_54;
        case 2uLL:
          uint64_t v50 = *(void *)(v47 + 16);
          uint64_t v51 = *(void *)(v47 + 24);
          goto LABEL_54;
        case 3uLL:
          goto LABEL_70;
        default:
          uint64_t v50 = 0;
          uint64_t v51 = BYTE6(v49);
LABEL_54:
          if (v50 == v51) {
            goto LABEL_70;
          }
          Class isa = Data._bridgeToObjectiveC()().super.isa;
          objc_msgSend(v40, sel_setAssetContent_, isa);

          sub_20CB64DC8(v47, v49);
          if (!v28) {
            goto LABEL_26;
          }
          goto LABEL_25;
      }
    }
    uint64_t v55 = v46;
    swift_bridgeObjectRelease();
    _convertNSErrorToError(_:)();
  }
  swift_willThrow();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
}

void sub_20CB8B368()
{
  sub_20CB83248();
  uint64_t v1 = v0;
  unint64_t v3 = v2;
  uint64_t v5 = v4;
  int64_t v7 = v6;
  sub_20CB832B8();
  uint64_t v8 = type metadata accessor for Logger();
  sub_20CB6D4D0();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  sub_20CB6A8FC();
  uint64_t v14 = v13 - v12;
  if (!v7)
  {
    CKLog.getter();
    uint64_t v19 = v1;
    uint64_t v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      id v40 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 138412290;
      uint64_t v23 = v19;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *id v40 = v1;

      _os_log_impl(&dword_20CB63000, v20, v21, "Ignoring handleFetch with nil recordID %@", v22, 0xCu);
      sub_20CB650D0(qword_26ACC70B0);
      swift_arrayDestroy();
      sub_20CB6FE30();
      sub_20CB6FE30();
    }
    else
    {

      uint64_t v20 = v19;
    }

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v14, v8);
    goto LABEL_21;
  }
  uint64_t v15 = sub_20CB87A34();
  if (!v15)
  {
    id v24 = v7;
    id v25 = v3;
    goto LABEL_15;
  }
  int64_t v16 = (void (*)(id, void *, uint64_t))v15;
  id v17 = v7;
  if (v5)
  {
    id v18 = v5;
    sub_20CB8AB7C(v18);

    if (!v3)
    {
      id v36 = v18;
      v16(v17, v5, 0);
      goto LABEL_14;
    }
  }
  else if (!v3)
  {
    _StringGuts.grow(_:)(67);
    v26._object = (void *)0x800000020CB9B640;
    v26._countAndFlagsBits = 0xD00000000000003DLL;
    String.append(_:)(v26);
    sub_20CB90FA0();
    type metadata accessor for CKCodeOperation();
    swift_getWitnessTable();
    DefaultStringInterpolation.appendInterpolation<A>(_:)();
    v27._countAndFlagsBits = 8250;
    v27._object = (void *)0xE200000000000000;
    String.append(_:)(v27);
    id v28 = objc_msgSend(v17, sel_description);
    uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    int64_t v31 = v30;

    v32._countAndFlagsBits = v29;
    v32._object = v31;
    String.append(_:)(v32);
    swift_bridgeObjectRelease();
    unint64_t v3 = (void *)related decl 'e' for CKErrorCode.init(_:description:)();
    id v33 = v3;
    v16(v17, v3, 1);

    sub_20CB6B280((uint64_t)v16);
    goto LABEL_15;
  }
  id v34 = v3;
  id v35 = v3;
  id v36 = (id)_convertErrorToNSError(_:)();

  id v37 = objc_msgSend(v36, sel_CKClientSuitableError);
  v16(v17, v37, 1);

LABEL_14:
  sub_20CB6B280((uint64_t)v16);

LABEL_15:
  if (sub_20CB7A4A8() & 1) != 0 && (sub_20CB87DC8())
  {
    sub_20CB83208();
    v7;
    sub_20CB90FA0();
    type metadata accessor for CKCodeOperation.AssetInfo();
    uint64_t v38 = sub_20CB90FB4();
    sub_20CB7933C(v38, v39);
    swift_endAccess();
  }
  if (v3) {
    sub_20CB868F8((uint64_t)v3);
  }

LABEL_21:
  sub_20CB83260();
}

void (*sub_20CB8B7D0(uint64_t a1, double a2))(uint64_t, double)
{
  uint64_t result = (void (*)(uint64_t, double))sub_20CB79F68();
  if (result)
  {
    result(a1, a2);
    uint64_t v5 = sub_20CB6A8B0();
    return (void (*)(uint64_t, double))sub_20CB6B280(v5);
  }
  return result;
}

void sub_20CB8B84C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  sub_20CB83194();
  sub_20CB83208();
  sub_20CB83304();
  type metadata accessor for CKCodeOperation.AssetInfo();
  sub_20CB86E44(a1, a2, a3, a4);
  uint64_t v13 = v12;
  swift_endAccess();
  sub_20CB83570();
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v13, sel_writeData_atOffset_, isa, a7);
}

void sub_20CB8B948()
{
  sub_20CB83248();
  uint64_t v1 = v0;
  id v76 = v2;
  uint64_t v3 = *(void *)((*MEMORY[0x263F8EED0] & *v0) + 0x58);
  sub_20CB70B84(qword_26ACC6BD0);
  sub_20CB90FB4();
  uint64_t v4 = type metadata accessor for Result();
  sub_20CB6D4D0();
  uint64_t v6 = v5;
  sub_20CB832AC();
  MEMORY[0x270FA5388](v7);
  uint64_t v71 = (uint64_t *)((char *)&v62 - v8);
  sub_20CB90FB4();
  type metadata accessor for Optional();
  sub_20CB6D4D0();
  uint64_t v64 = v10;
  uint64_t v65 = v9;
  sub_20CB832AC();
  MEMORY[0x270FA5388](v11);
  id v68 = (char *)&v62 - v12;
  sub_20CB6D4D0();
  uint64_t v67 = v13;
  sub_20CB832AC();
  MEMORY[0x270FA5388](v14);
  int64_t v66 = (char *)&v62 - v15;
  uint64_t v16 = type metadata accessor for Logger();
  sub_20CB6D4D0();
  uint64_t v75 = v17;
  MEMORY[0x270FA5388](v18);
  sub_20CB83220();
  uint64_t v72 = v19;
  sub_20CB832CC();
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v62 - v21;
  CKLog.getter();
  uint64_t v23 = v1;
  id v24 = Logger.logObject.getter();
  os_log_type_t v25 = static os_log_type_t.info.getter();
  BOOL v26 = os_log_type_enabled(v24, v25);
  uint64_t v69 = v3;
  if (v26)
  {
    uint64_t v27 = swift_slowAlloc();
    uint64_t v74 = v23;
    id v28 = (uint8_t *)v27;
    uint64_t v29 = swift_slowAlloc();
    uint64_t v63 = v6;
    unint64_t v30 = (void *)v29;
    uint64_t v73 = v16;
    *(_DWORD *)id v28 = 138412290;
    uint64_t v70 = v1;
    uint64_t v77 = v74;
    int64_t v31 = v74;
    sub_20CB90F88();
    uint64_t v1 = v70;
    uint64_t v16 = v73;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *unint64_t v30 = v1;

    _os_log_impl(&dword_20CB63000, v24, v25, "In CKCodeOperation._finishOnCallbackQueueWithError() for %@", v28, 0xCu);
    sub_20CB650D0(qword_26ACC70B0);
    swift_arrayDestroy();
    uint64_t v6 = v63;
    sub_20CB6FE30();
    uint64_t v23 = v74;
    sub_20CB6FE30();
  }
  else
  {

    id v24 = v23;
  }

  uint64_t v32 = v75 + 8;
  id v33 = *(void (**)(char *, uint64_t))(v75 + 8);
  v33(v22, v16);
  uint64_t v34 = sub_20CB7A16C();
  if (v34)
  {
    id v35 = (void (*)(uint64_t *))v34;
    id v36 = v76;
    if (v76 || (id v36 = sub_20CB868A8()) != 0)
    {
      id v37 = v76;
      id v38 = v36;
      id v39 = (void *)_convertErrorToNSError(_:)();

      id v40 = objc_msgSend(v39, sel_CKClientSuitableError);
      uint64_t v41 = v71;
      *uint64_t v71 = (uint64_t)v40;
      swift_storeEnumTagMultiPayload();
      v35(v41);
      sub_20CB6B280((uint64_t)v35);

      (*(void (**)(uint64_t *, uint64_t))(v6 + 8))(v41, v4);
    }
    else
    {
      sub_20CB78408();
      uint64_t v49 = sub_20CB90F48();
      uint64_t v50 = v69;
      int v52 = _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(v49, v51, v69);
      id v53 = v71;
      if (v52 == 1)
      {
        sub_20CB832A0();
        v54();
        *id v53 = related decl 'e' for CKErrorCode.init(_:description:)();
        swift_storeEnumTagMultiPayload();
        v35(v53);
        uint64_t v55 = sub_20CB90EC8();
        v56(v55);
        id v76 = 0;
      }
      else
      {
        uint64_t v57 = v66;
        uint64_t v58 = v67;
        sub_20CB83348();
        v59();
        (*(void (**)(uint64_t *, char *, uint64_t))(v58 + 16))(v53, v57, v50);
        swift_storeEnumTagMultiPayload();
        v35(v53);
        uint64_t v60 = sub_20CB90EC8();
        v61(v60);
        (*(void (**)(char *, uint64_t))(v58 + 8))(v57, v50);
      }
    }
  }
  else
  {
    uint64_t v75 = v32;
    uint64_t v73 = v16;
    CKLog.getter();
    id v42 = v23;
    uint64_t v43 = Logger.logObject.getter();
    os_log_type_t v44 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v43, v44))
    {
      uint64_t v70 = v1;
      id v45 = (uint8_t *)swift_slowAlloc();
      id v46 = (void *)swift_slowAlloc();
      *(_DWORD *)id v45 = 138412290;
      uint64_t v77 = v42;
      uint64_t v47 = v42;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *id v46 = v70;

      _os_log_impl(&dword_20CB63000, v43, v44, "In CKCodeOperation._finishOnCallbackQueueWithError(), no result block set for %@", v45, 0xCu);
      sub_20CB650D0(qword_26ACC70B0);
      swift_arrayDestroy();
      sub_20CB6FE30();
      sub_20CB6FE30();
    }
    else
    {

      uint64_t v43 = v42;
    }
    uint64_t v48 = v73;

    v33(v72, v48);
  }
  sub_20CB8BF80(v23, (uint64_t)v76);
  sub_20CB83260();
}

void sub_20CB8BF80(void *a1, uint64_t a2)
{
  uint64_t v3 = *MEMORY[0x263F8EED0] & *a1;
  if (a2) {
    uint64_t v4 = (void *)_convertErrorToNSError(_:)();
  }
  else {
    uint64_t v4 = 0;
  }
  long long v5 = *(_OWORD *)(v3 + 80);
  long long v6 = *(_OWORD *)(v3 + 96);
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for CKCodeOperation();
  objc_msgSendSuper2(&v7, sel__finishOnCallbackQueueWithError_, v4, v5, v6);
}

void sub_20CB8C030(void *a1, uint64_t a2, void *a3)
{
  id v4 = a1;
  id v5 = a3;
  sub_20CB8B948();
}

double sub_20CB8C088@<D0>(uint64_t a1@<X8>)
{
  sub_20CB90E3C();
  uint64_t v2 = sub_20CB86DF8();
  if (v2)
  {
    uint64_t v3 = v2;
    sub_20CB83304();
    *(void *)(a1 + 24) = type metadata accessor for CKCodeOperation.CallbackRelay();
    *(void *)a1 = v3;
  }
  else
  {
    double result = 0.0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  return result;
}

id sub_20CB8C0FC()
{
  sub_20CB8C088((uint64_t)v7);
  uint64_t v0 = v8;
  if (v8)
  {
    uint64_t v1 = sub_20CB6F898(v7, v8);
    uint64_t v2 = *(void *)(v0 - 8);
    MEMORY[0x270FA5388](v1);
    id v4 = (char *)v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v2 + 16))(v4);
    id v5 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v0);
    sub_20CB6C1F4((uint64_t)v7);
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

void sub_20CB8C230()
{
}

id sub_20CB8C240(void *a1)
{
  uint64_t v3 = *MEMORY[0x263F8EED0] & *v1;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  long long v6 = *(_OWORD *)(v3 + 80);
  long long v7 = *(_OWORD *)(v3 + 96);
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for CKCodeOperation.CallbackRelay();
  id v4 = objc_msgSendSuper2(&v8, sel_init, v6, v7);

  return v4;
}

uint64_t sub_20CB8C2F8()
{
  v1[18] = v0;
  uint64_t v2 = sub_20CB650D0(&qword_2676F1170);
  v1[19] = v2;
  v1[20] = *(void *)(v2 - 8);
  v1[21] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_20CB8C3BC, 0, 0);
}

void sub_20CB8C3BC()
{
}

uint64_t sub_20CB8C3F8(void *a1)
{
  v1[22] = a1;
  if (a1)
  {
    uint64_t v2 = a1;
    uint64_t v3 = v1[19];
    v1[2] = v1;
    v1[3] = sub_20CB8C52C;
    swift_continuation_init();
    v1[17] = v3;
    sub_20CB6FB90(v1 + 14);
    sub_20CB650D0(qword_26ACC6BD0);
    sub_20CB83518();
    uint64_t v4 = sub_20CB8332C();
    v5(v4);
    v1[10] = MEMORY[0x263EF8330];
    v1[11] = 1107296256;
    v1[12] = sub_20CB85E80;
    v1[13] = &unk_26C1C4008;
    objc_msgSend(v2, sel_handleWillStart_, v1 + 10);
    a1 = v1 + 2;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA23F0](a1);
}

uint64_t sub_20CB8C52C()
{
  sub_20CB6CF44();
  sub_20CB6CF20();
  uint64_t v1 = *(void *)(v0 + 48);
  *(void *)(v2 + 184) = v1;
  if (v1) {
    uint64_t v3 = sub_20CB90DDC;
  }
  else {
    uint64_t v3 = sub_20CB830DC;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_20CB8C614(void *a1, int a2, void *aBlock)
{
  return sub_20CB7F288(a1, a2, aBlock);
}

uint64_t sub_20CB8C634(const void *a1, void *a2)
{
  long long v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  uint64_t v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  void *v4 = v2;
  v4[1] = sub_20CB90D6C;
  return sub_20CB8C2F8();
}

uint64_t sub_20CB8C6DC()
{
  v1[18] = v0;
  uint64_t v2 = sub_20CB650D0(&qword_2676F1170);
  v1[19] = v2;
  v1[20] = *(void *)(v2 - 8);
  v1[21] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_20CB8C7A0, 0, 0);
}

void sub_20CB8C7A0()
{
}

uint64_t sub_20CB8C7DC(void *a1)
{
  v1[22] = a1;
  if (a1)
  {
    uint64_t v2 = a1;
    uint64_t v3 = v1[19];
    v1[2] = v1;
    v1[3] = sub_20CB8C910;
    swift_continuation_init();
    v1[17] = v3;
    sub_20CB6FB90(v1 + 14);
    sub_20CB650D0(qword_26ACC6BD0);
    sub_20CB83518();
    uint64_t v4 = sub_20CB8332C();
    v5(v4);
    v1[10] = MEMORY[0x263EF8330];
    v1[11] = 1107296256;
    v1[12] = sub_20CB85E80;
    v1[13] = &unk_26C1C3FE0;
    objc_msgSend(v2, sel_handleDidStart_, v1 + 10);
    a1 = v1 + 2;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA23F0](a1);
}

uint64_t sub_20CB8C910()
{
  sub_20CB6CF44();
  sub_20CB6CF20();
  uint64_t v1 = *(void *)(v0 + 48);
  *(void *)(v2 + 184) = v1;
  if (v1) {
    uint64_t v3 = sub_20CB8C9F8;
  }
  else {
    uint64_t v3 = sub_20CB7F184;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_20CB8C9F8()
{
  sub_20CB73458();
  uint64_t v1 = *(void **)(v0 + 176);
  swift_willThrow();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_20CB8CA70(void *a1, int a2, void *aBlock)
{
  return sub_20CB7F288(a1, a2, aBlock);
}

uint64_t sub_20CB8CA90(const void *a1, void *a2)
{
  long long v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  uint64_t v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  void *v4 = v2;
  v4[1] = sub_20CB8CB38;
  return sub_20CB8C6DC();
}

uint64_t sub_20CB8CB38()
{
  uint64_t v2 = v0;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1;
  sub_20CB722C0();
  uint64_t *v5 = v4;
  uint64_t v6 = *(void **)(v3 + 16);
  uint64_t v7 = *v1;
  uint64_t *v5 = *v1;
  swift_task_dealloc();

  if (v2)
  {
    objc_super v8 = (void *)_convertErrorToNSError(_:)();

    uint64_t v9 = sub_20CB90E64();
    v10(v9, v8);
  }
  else
  {
    uint64_t v11 = sub_20CB90E64();
    v12(v11, 0);
  }
  _Block_release(*(const void **)(v4 + 24));
  uint64_t v13 = *(uint64_t (**)(void))(v7 + 8);
  return v13();
}

void sub_20CB8CCA4()
{
}

void sub_20CB8CCB0(void *a1)
{
}

void sub_20CB8CCD4()
{
}

void sub_20CB8CCF8()
{
}

void sub_20CB8CD04(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  a1;
  sub_20CB8CCF8();
}

void sub_20CB8CD40()
{
}

void sub_20CB8CD6C()
{
}

void sub_20CB8CD78()
{
}

void sub_20CB8CD9C(void *a1)
{
  if (a1)
  {
    objc_msgSend(a1, *v2, v1);
  }
  else
  {
    __break(1u);
  }
}

void sub_20CB8CDDC(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  a1;
  sub_20CB8CD6C();
}

void sub_20CB8CE18()
{
}

void sub_20CB8CE44()
{
}

void sub_20CB8CE70(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  if (a1)
  {
    v27[4] = v24;
    v27[5] = v23;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 1107296256;
    v27[2] = sub_20CB86078;
    v27[3] = &unk_26C1C2CF0;
    BOOL v26 = _Block_copy(v27);
    swift_retain();
    swift_release();
    objc_msgSend(a1, sel_openFileWithOpenInfo_reply_, v22, v26);
    _Block_release(v26);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_20CB8CF20(void *a1, int a2, void *a3, void *a4)
{
  return sub_20CB8D064(a1, a2, a3, a4, (uint64_t)&unk_26C1C4130, (uint64_t)sub_20CB82BB0, (void (*)(id, uint64_t, uint64_t))sub_20CB8CE44);
}

void sub_20CB8CF54()
{
}

void sub_20CB8CF80(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  if (a1)
  {
    v27[4] = v24;
    v27[5] = v23;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 1107296256;
    v27[2] = sub_20CB86154;
    v27[3] = &unk_26C1C2CC8;
    BOOL v26 = _Block_copy(v27);
    swift_retain();
    swift_release();
    objc_msgSend(a1, sel_handleFinishWithAssetDownloadStagingInfo_reply_, v22, v26);
    _Block_release(v26);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_20CB8D030(void *a1, int a2, void *a3, void *a4)
{
  return sub_20CB8D064(a1, a2, a3, a4, (uint64_t)&unk_26C1C4108, (uint64_t)sub_20CB82BA8, (void (*)(id, uint64_t, uint64_t))sub_20CB8CF54);
}

uint64_t sub_20CB8D064(void *a1, int a2, void *a3, void *aBlock, uint64_t a5, uint64_t a6, void (*a7)(id, uint64_t, uint64_t))
{
  uint64_t v11 = _Block_copy(aBlock);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  id v13 = a3;
  id v14 = a1;
  a7(v13, a6, v12);

  return swift_release();
}

void sub_20CB8D10C()
{
}

void sub_20CB8D130(void *a1)
{
  if (a1)
  {
    if (v2) {
      uint64_t v4 = _convertErrorToNSError(_:)();
    }
    else {
      uint64_t v4 = 0;
    }
    uint64_t v5 = (void *)v4;
    objc_msgSend(a1, sel_handleOperationDidCompleteWithMetrics_error_, v1);
  }
  else
  {
    __break(1u);
  }
}

void sub_20CB8D198(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  a1;
  a4;
  sub_20CB8D10C();
}

void sub_20CB8D1E4()
{
}

void sub_20CB8D214()
{
}

void sub_20CB8D240(void *a1)
{
  if (a1)
  {
    if (v3) {
      uint64_t v5 = _convertErrorToNSError(_:)();
    }
    else {
      uint64_t v5 = 0;
    }
    id v6 = (void *)v5;
    objc_msgSend(a1, sel_handleDiscretionaryOperationShouldStart_nonDiscretionary_error_, v2 & 1, v1 & 1);
  }
  else
  {
    __break(1u);
  }
}

void sub_20CB8D2B0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
}

void sub_20CB8D2F8()
{
}

void sub_20CB8D324()
{
}

void sub_20CB8D330()
{
}

void sub_20CB8D34C(void *a1)
{
  if (a1)
  {
    [a1 *v1];
  }
  else
  {
    __break(1u);
  }
}

void sub_20CB8D384(void *a1)
{
}

void sub_20CB8D3A8()
{
}

void sub_20CB8D3CC()
{
}

void sub_20CB8D404(void *a1)
{
  if (a1)
  {
    uint64_t v7 = (void *)MEMORY[0x210555430](v5, v4);
    void v9[4] = v3;
    v9[5] = v2;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 1107296256;
    v9[2] = sub_20CB86378;
    v9[3] = &unk_26C1C2CA0;
    objc_super v8 = _Block_copy(v9);
    swift_retain();
    swift_release();
    objc_msgSend(a1, sel_handleDaemonOperationWillStartWithClassName_isTopLevelDaemonOperation_replyBlock_, v7, v1 & 1, v8);
    _Block_release(v8);
  }
  else
  {
    __break(1u);
  }
}

void sub_20CB8D4D0(void *a1, int a2, int a3, int a4, void *aBlock)
{
  id v6 = _Block_copy(aBlock);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(swift_allocObject() + 16) = v6;
  id v7 = a1;
  sub_20CB8D3CC();
}

uint64_t sub_20CB8D560()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

void sub_20CB8D594()
{
}

uint64_t sub_20CB8D5A8(void *a1, int a2, int a3, void *a4, void *a5)
{
  return sub_20CB8D72C(a1, a2, a3, a4, a5, (uint64_t)&unk_26C1C40B8, (uint64_t)sub_20CB90D70, (void (*)(uint64_t, uint64_t, id, uint64_t, uint64_t))sub_20CB8D594);
}

void sub_20CB8D5DC()
{
}

void sub_20CB8D5F0()
{
}

void sub_20CB8D634(void *a1)
{
  if (a1)
  {
    uint64_t v9 = (void *)MEMORY[0x210555430](v7, v6);
    v11[4] = v5;
    uint64_t v11[5] = v3;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 1107296256;
    id v11[2] = sub_20CB86378;
    v11[3] = v4;
    uint64_t v10 = _Block_copy(v11);
    swift_retain();
    swift_release();
    objc_msgSend(a1, *v2, v9, v1, v10);
    _Block_release(v10);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_20CB8D6F8(void *a1, int a2, int a3, void *a4, void *a5)
{
  return sub_20CB8D72C(a1, a2, a3, a4, a5, (uint64_t)&unk_26C1C4090, (uint64_t)sub_20CB90D70, (void (*)(uint64_t, uint64_t, id, uint64_t, uint64_t))sub_20CB8D5DC);
}

uint64_t sub_20CB8D72C(void *a1, int a2, int a3, void *a4, void *aBlock, uint64_t a6, uint64_t a7, void (*a8)(uint64_t, uint64_t, id, uint64_t, uint64_t))
{
  uint64_t v12 = _Block_copy(aBlock);
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v15 = v14;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v12;
  id v17 = a4;
  id v18 = a1;
  a8(v13, v15, v17, a7, v16);

  swift_bridgeObjectRelease();
  sub_20CB90E80();
  return swift_release();
}

void sub_20CB8D7FC()
{
}

void sub_20CB8D830(void *a1)
{
  if (a1)
  {
    sub_20CB89774();
  }
  else
  {
    __break(1u);
  }
}

void sub_20CB8D888(void *a1, int a2, int a3, int a4, int a5, void *aBlock)
{
  uint64_t v7 = _Block_copy(aBlock);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(swift_allocObject() + 16) = v7;
  id v8 = a1;
  sub_20CB8D7FC();
}

uint64_t sub_20CB8D94C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

void sub_20CB8D994()
{
}

void sub_20CB8D9C4(void *a1)
{
  if (a1)
  {
    sub_20CB89F0C();
  }
  else
  {
    __break(1u);
  }
}

void sub_20CB8DA18(void *a1, int a2, void *a3, void *aBlock)
{
  uint64_t v6 = _Block_copy(aBlock);
  id v7 = a3;
  a1;
  static Data._unconditionallyBridgeFromObjectiveC(_:)();

  *(void *)(swift_allocObject() + 16) = v6;
  sub_20CB8D994();
}

void sub_20CB8DAB0()
{
  swift_release();
  sub_20CB64DC8(v0, v1);
}

void sub_20CB8DAF0()
{
}

void sub_20CB8DB0C(void *a1)
{
  if (a1)
  {
    sub_20CB8A62C();
  }
  else
  {
    __break(1u);
  }
}

void sub_20CB8DB4C(void *a1)
{
  sub_20CB6CEE4(0, (unint64_t *)&unk_26ACC68E0);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v2 = a1;
  sub_20CB8DAF0();
}

uint64_t sub_20CB8DB9C()
{
  return swift_bridgeObjectRelease();
}

void sub_20CB8DBC0()
{
}

void sub_20CB8DBE8(void *a1)
{
  if (a1)
  {
    sub_20CB8B368();
  }
  else
  {
    __break(1u);
  }
}

void sub_20CB8DC34(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8 = a3;
  id v9 = a4;
  a1;
  a5;
  sub_20CB8DBC0();
}

void sub_20CB8DC94()
{
}

void sub_20CB8DCCC()
{
}

void sub_20CB8DCF0(void *a1)
{
  if (a1)
  {
    sub_20CB8B7D0(v1, v2);
  }
  else
  {
    __break(1u);
  }
}

void sub_20CB8DD38(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  a1;
  sub_20CB8DCCC();
}

void sub_20CB8DD80()
{
}

void sub_20CB8DDB0()
{
}

void sub_20CB8DDF0(void *a1)
{
  if (a1)
  {
    sub_20CB8B84C(v7, v6, v5, v4, v3, v2, v1);
  }
  else
  {
    __break(1u);
  }
}

void sub_20CB8DE54(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v9 = a3;
  id v10 = a6;
  a1;
  static Data._unconditionallyBridgeFromObjectiveC(_:)();

  sub_20CB8DDB0();
}

uint64_t sub_20CB8DEE8()
{
  sub_20CB64DC8(v2, v3);

  return swift_bridgeObjectRelease();
}

void sub_20CB8DF2C()
{
}

id sub_20CB8DF50()
{
  return sub_20CB8E004();
}

uint64_t sub_20CB8DF68(uint64_t a1)
{
  return MEMORY[0x270FA05E8](a1 + qword_2676F13B0);
}

id CKCodeOperation.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void CKCodeOperation.init()()
{
}

void sub_20CB8DFDC()
{
}

id CKCodeOperation.__deallocating_deinit()
{
  return sub_20CB8E004();
}

id sub_20CB8E004()
{
  uint64_t v1 = sub_20CB83304();
  v4.receiver = v0;
  v4.super_class = (Class)v2(v1);
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t sub_20CB8E07C(uint64_t a1)
{
  type metadata accessor for Optional();
  sub_20CB6A86C();
  sub_20CB832A0();
  v2();
  sub_20CB90DE8();
  type metadata accessor for Optional();
  sub_20CB6A86C();
  sub_20CB832A0();
  v3();
  sub_20CB90DE8();
  swift_bridgeObjectRelease();
  sub_20CB90DE8();

  sub_20CB90DE8();
  swift_bridgeObjectRelease();
  sub_20CB90DE8();
  swift_bridgeObjectRelease();
  sub_20CB90DE8();

  sub_20CB90DE8();
  sub_20CB798B4(*(void *)(a1 + *(void *)(v6 + 168)), *(void *)(a1 + *(void *)(v6 + 168) + 8), *(void *)(a1 + *(void *)(v6 + 168) + 16), *(void *)(a1 + *(void *)(v6 + 168) + 24), *(unsigned char *)(a1 + *(void *)(v6 + 168) + 32));
  sub_20CB90DE8();

  sub_20CB90DE8();
  swift_bridgeObjectRelease();
  sub_20CB90DE8();
  sub_20CB6B280(*(void *)(a1 + *(void *)(v8 + 200)));
  sub_20CB90DE8();
  sub_20CB6B280(*(void *)(a1 + *(void *)(v9 + 208)));
  sub_20CB90DE8();
  sub_20CB6B280(*(void *)(a1 + *(void *)(v10 + 216)));
  sub_20CB90DE8();
  sub_20CB6B280(*(void *)(a1 + *(void *)(v11 + 240)));
  sub_20CB90DE8();
  uint64_t v13 = *(void *)(a1 + *(void *)(v12 + 248));
  return sub_20CB6B280(v13);
}

unint64_t sub_20CB8E2CC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_20CB650D0(&qword_2676F14D8);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  unint64_t v3 = (void *)v2;
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
    sub_20CB909A4(v6, (uint64_t)&v15, &qword_2676F14E0);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_20CB8FEC8(v15, v16, (uint64_t (*)(uint64_t))sub_20CB8E418);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_20CB909FC(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    uint64_t v3[2] = v14;
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

unint64_t sub_20CB8E418(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        BOOL v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (_stringCompareWithSmolCheck(_:_:expecting:)()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_20CB8E560(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_20CB90DE4;
  return v6();
}

uint64_t sub_20CB8E62C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_20CB90DE4;
  return v7();
}

uint64_t sub_20CB8E6F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0(a1, 1, v6) == 1)
  {
    sub_20CB8FA20(a1, &qword_2676F1458);
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_20CB8E868(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_20CB8E944;
  return v6(a1);
}

uint64_t sub_20CB8E944()
{
  sub_20CB6CF44();
  sub_20CB6CF20();
  uint64_t v1 = *v0;
  sub_20CB722C0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_20CB8EA0C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_20CB8EA54()
{
  return sub_20CB78260();
}

void *sub_20CB8EA84()
{
  sub_20CB90FC0();
  uint64_t result = sub_20CB866A4();
  *uint64_t v0 = result;
  return result;
}

uint64_t sub_20CB8EAD8()
{
  sub_20CB90FC0();
  uint64_t result = sub_20CB86D58();
  *uint64_t v0 = result & 1;
  return result;
}

uint64_t sub_20CB8EB04(char *a1)
{
  return sub_20CB86DA4(*a1);
}

uint64_t sub_20CB8EB64()
{
  sub_20CB90FC0();
  uint64_t result = sub_20CB87DC8();
  *uint64_t v0 = result & 1;
  return result;
}

uint64_t sub_20CB8EB90(char *a1)
{
  return sub_20CB87E14(*a1);
}

uint64_t sub_20CB8EBC0()
{
  sub_20CB90FC0();
  uint64_t result = sub_20CB7A4A8();
  *uint64_t v0 = result & 1;
  return result;
}

uint64_t sub_20CB8EBEC(char *a1)
{
  return sub_20CB7A4F4(*a1);
}

uint64_t sub_20CB8EC3C()
{
  uint64_t result = type metadata accessor for Optional();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for Optional();
    if (v2 <= 0x3F) {
      return swift_initClassMetadata2();
    }
  }
  return result;
}

uint64_t method lookup function for CKCodeOperation(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CKCodeOperation);
}

uint64_t dispatch thunk of CKCodeOperation.request.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of CKCodeOperation.request.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of CKCodeOperation.request.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of CKCodeOperation.codeService.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of CKCodeOperation.codeService.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of CKCodeOperation.codeService.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of CKCodeOperation.dataProtectionType.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of CKCodeOperation.dataProtectionType.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of CKCodeOperation.dataProtectionType.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of CKCodeOperation.permittedRemoteMeasurement.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of CKCodeOperation.permittedRemoteMeasurement.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of CKCodeOperation.permittedRemoteMeasurement.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of CKCodeOperation.shouldSendRecordPCSKeys.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of CKCodeOperation.shouldSendRecordPCSKeys.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of CKCodeOperation.shouldSendRecordPCSKeys.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of CKCodeOperation.__allocating_init(functionName:request:)()
{
  return (*(uint64_t (**)(void))(v0 + 544))();
}

uint64_t dispatch thunk of CKCodeOperation.perRecordResultBlock.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x228))();
}

uint64_t dispatch thunk of CKCodeOperation.perRecordResultBlock.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x230))();
}

uint64_t dispatch thunk of CKCodeOperation.perRecordResultBlock.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x238))();
}

uint64_t dispatch thunk of CKCodeOperation.perRecordProgressBlock.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x240))();
}

uint64_t dispatch thunk of CKCodeOperation.perRecordProgressBlock.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x248))();
}

uint64_t dispatch thunk of CKCodeOperation.perRecordProgressBlock.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x250))();
}

uint64_t dispatch thunk of CKCodeOperation.codeOperationResultBlock.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x258))();
}

uint64_t dispatch thunk of CKCodeOperation.codeOperationResultBlock.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x260))();
}

uint64_t dispatch thunk of CKCodeOperation.codeOperationResultBlock.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x268))();
}

uint64_t dispatch thunk of CKCodeOperation.dropInMemoryAssetContentASAP.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x270))();
}

uint64_t dispatch thunk of CKCodeOperation.dropInMemoryAssetContentASAP.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x278))();
}

uint64_t dispatch thunk of CKCodeOperation.dropInMemoryAssetContentASAP.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x280))();
}

uint64_t dispatch thunk of CKCodeOperation.shouldFetchAssetContentInMemory.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x288))();
}

uint64_t dispatch thunk of CKCodeOperation.shouldFetchAssetContentInMemory.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x290))();
}

uint64_t dispatch thunk of CKCodeOperation.shouldFetchAssetContentInMemory.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x298))();
}

uint64_t dispatch thunk of CKCodeOperation.incompleteResponsePreviewBlock.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2A0))();
}

uint64_t dispatch thunk of CKCodeOperation.incompleteResponsePreviewBlock.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2A8))();
}

uint64_t dispatch thunk of CKCodeOperation.incompleteResponsePreviewBlock.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2B0))();
}

uint64_t dispatch thunk of CKCodeOperation.didSubstituteRequestRecordTransportsBlock.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2B8))();
}

uint64_t dispatch thunk of CKCodeOperation.didSubstituteRequestRecordTransportsBlock.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2C0))();
}

uint64_t dispatch thunk of CKCodeOperation.didSubstituteRequestRecordTransportsBlock.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2C8))();
}

uint64_t type metadata accessor for CKCodeOperation.DataProtectionType()
{
  return swift_getGenericMetadata();
}

uint64_t sub_20CB8F614()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for CKCodeOperation.AssetInfo()
{
  return swift_getGenericMetadata();
}

uint64_t sub_20CB8F670(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_20CB8F680()
{
  return swift_release();
}

uint64_t sub_20CB8F688(uint64_t a1, uint64_t a2)
{
  return sub_20CB6C244(a2 + 32, a1 + 32);
}

uint64_t sub_20CB8F698(uint64_t a1)
{
  return sub_20CB6C1F4(a1 + 32);
}

uint64_t sub_20CB8F6A0()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_20CB8F6D8(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_20CB8F6F8()
{
  sub_20CB73458();
  uint64_t v0 = swift_task_alloc();
  unint64_t v1 = (void *)sub_20CB90E74(v0);
  *unint64_t v1 = v2;
  v1[1] = sub_20CB8F798;
  uint64_t v3 = sub_20CB6A8B0();
  return v4(v3);
}

uint64_t sub_20CB8F798()
{
  sub_20CB6CF44();
  sub_20CB6CF20();
  uint64_t v1 = *v0;
  sub_20CB722C0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_20CB8F860()
{
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_20CB90E74(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_20CB90DE4;
  sub_20CB90F88();
  return v3();
}

uint64_t sub_20CB8F91C()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_20CB8F95C()
{
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_20CB90E74(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_20CB90DE4;
  sub_20CB90F88();
  return v3();
}

uint64_t sub_20CB8FA20(uint64_t a1, uint64_t *a2)
{
  sub_20CB650D0(a2);
  sub_20CB6A86C();
  sub_20CB832A0();
  v3();
  return a1;
}

uint64_t sub_20CB8FA70()
{
  swift_release();
  uint64_t v0 = sub_20CB8349C();
  return MEMORY[0x270FA0238](v0, v1, v2);
}

uint64_t sub_20CB8FAA0()
{
  sub_20CB73458();
  uint64_t v2 = v1;
  uint64_t v3 = *(int **)(v0 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)sub_20CB90E74(v4);
  void *v5 = v6;
  v5[1] = sub_20CB8F798;
  uint64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2676F1480 + dword_2676F1480);
  return v7(v2, v3);
}

uint64_t sub_20CB8FB54()
{
  sub_20CB73458();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_20CB90E74(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_20CB90DE4;
  uint64_t v3 = sub_20CB6A8B0();
  return v4(v3);
}

uint64_t sub_20CB8FBF4(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  sub_20CB8FF44(a1);
  uint64_t v5 = v4;
  LOBYTE(a1) = v6;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v12 = *v2;
  uint64_t v8 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  Swift::Int v9 = *(void *)(v8 + 24);
  sub_20CB650D0((uint64_t *)&unk_2676F14A0);
  _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v9);

  uint64_t v10 = *(void *)(*(void *)(v12 + 56) + 8 * v5);
  sub_20CB6CEE4(0, &qword_2676F14B0);
  sub_20CB650D0(&qword_2676F14B8);
  sub_20CB90944();
  _NativeDictionary._delete(at:)();
  *uint64_t v2 = v12;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_20CB8FD14(uint64_t a1, char a2, void *a3)
{
  char v6 = a2 & 1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_20CB8FF94(a1, v6, a3, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v9;
  return swift_bridgeObjectRelease();
}

uint64_t sub_20CB8FDA4()
{
  sub_20CB90F94();
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v5 = *v0;
  *uint64_t v0 = 0x8000000000000000;
  uint64_t v1 = sub_20CB83570();
  sub_20CB90318(v1, v2, v3);
  *uint64_t v0 = v5;
  return swift_bridgeObjectRelease();
}

void sub_20CB8FE1C(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = NSObject._rawHashValue(seed:)(*(void *)(v2 + 40));
  sub_20CB9069C(a1, v4);
}

unint64_t sub_20CB8FE6C(uint64_t a1)
{
  uint64_t v2 = static Hasher._hash(seed:_:)();
  return sub_20CB9051C(a1, v2);
}

uint64_t sub_20CB8FEB0(uint64_t a1, uint64_t a2)
{
  return sub_20CB8FEC8(a1, a2, (uint64_t (*)(uint64_t))sub_20CB905B8);
}

uint64_t sub_20CB8FEC8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  sub_20CB90F94();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Hasher._finalize()();
  uint64_t v3 = sub_20CB83570();
  return a3(v3);
}

void sub_20CB8FF44(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = NSObject._rawHashValue(seed:)(*(void *)(v2 + 40));
  sub_20CB9069C(a1, v4);
}

void sub_20CB8FF94(uint64_t a1, char a2, void *a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v9 = (void *)*v4;
  sub_20CB8FE1C((uint64_t)a3);
  uint64_t v12 = v9[2];
  BOOL v13 = (v11 & 1) == 0;
  Swift::Int v14 = v12 + v13;
  if (__OFADD__(v12, v13))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v15 = v10;
  char v16 = v11;
  sub_20CB650D0(&qword_2676F14F8);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a4 & 1, v14)) {
    goto LABEL_5;
  }
  sub_20CB8FE1C((uint64_t)a3);
  if ((v16 & 1) != (v18 & 1))
  {
LABEL_11:
    sub_20CB6CEE4(0, (unint64_t *)&unk_2676F1500);
    KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return;
  }
  unint64_t v15 = v17;
LABEL_5:
  int v19 = a2 & 1;
  uint64_t v20 = *v5;
  if (v16)
  {
    BOOL v21 = v19 != 0;
    uint64_t v22 = v20[7] + 16 * v15;
    sub_20CB6BA64(*(id *)v22, *(unsigned char *)(v22 + 8));
    *(void *)uint64_t v22 = a1;
    *(unsigned char *)(v22 + 8) = v21;
  }
  else
  {
    sub_20CB90440(v15, (uint64_t)a3, a1, v19, v20);
    id v23 = a3;
  }
}

void sub_20CB900E4(uint64_t a1, uint64_t a2, char a3)
{
  Swift::Int v4 = v3;
  Swift::Int v8 = *v3;
  sub_20CB8FE6C(a2);
  sub_20CB90F74();
  if (v11)
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v12 = v9;
  char v13 = v10;
  sub_20CB650D0(&qword_2676F14D0);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a3 & 1, v8)) {
    goto LABEL_5;
  }
  unint64_t v14 = sub_20CB8FE6C(a2);
  if ((v13 & 1) != (v15 & 1))
  {
LABEL_11:
    KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return;
  }
  unint64_t v12 = v14;
LABEL_5:
  if (v13)
  {
    uint64_t v16 = *(void *)(*v4 + 56);

    *(void *)(v16 + 8 * v12) = a1;
    sub_20CB90E80();
  }
  else
  {
    sub_20CB90E80();
    sub_20CB90490(v17, v18, v19, v20);
  }
}

void sub_20CB901E0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v10 = *v4;
  sub_20CB8FEC8(a2, a3, (uint64_t (*)(uint64_t))sub_20CB905B8);
  sub_20CB90F74();
  if (v13)
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v14 = v11;
  char v15 = v12;
  sub_20CB650D0((uint64_t *)&unk_2676F11A0);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a4 & 1, v10)) {
    goto LABEL_5;
  }
  uint64_t v16 = sub_20CB83570();
  uint64_t v19 = sub_20CB8FEC8(v16, v17, v18);
  if ((v15 & 1) != (v20 & 1))
  {
LABEL_11:
    KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return;
  }
  unint64_t v14 = v19;
LABEL_5:
  uint64_t v21 = (void *)*v5;
  if (v15)
  {
    uint64_t v22 = v21[7];
    swift_bridgeObjectRelease();
    *(void *)(v22 + 8 * v14) = a1;
    sub_20CB90E80();
  }
  else
  {
    sub_20CB904D4(v14, a2, a3, a1, v21);
    sub_20CB90E80();
    swift_bridgeObjectRetain();
  }
}

id sub_20CB90318(uint64_t a1, void *a2, char a3)
{
  Swift::Int v4 = (void **)v3;
  uint64_t v7 = (void *)*v3;
  sub_20CB8FF44((uint64_t)a2);
  uint64_t v10 = v7[2];
  BOOL v11 = (v9 & 1) == 0;
  Swift::Int v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v13 = v8;
  char v14 = v9;
  sub_20CB650D0((uint64_t *)&unk_2676F14A0);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a3 & 1, v12)) {
    goto LABEL_5;
  }
  sub_20CB8FF44((uint64_t)a2);
  if ((v14 & 1) != (v16 & 1))
  {
LABEL_11:
    sub_20CB6CEE4(0, &qword_2676F14B0);
    id result = (id)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v13 = v15;
LABEL_5:
  uint64_t v17 = *v4;
  if (v14)
  {
    uint64_t v18 = v17[7];
    id result = (id)swift_bridgeObjectRelease();
    *(void *)(v18 + 8 * v13) = a1;
  }
  else
  {
    sub_20CB90490(v13, (uint64_t)a2, a1, v17);
    return a2;
  }
  return result;
}

unint64_t sub_20CB90440(unint64_t result, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  *(void *)(a5[6] + 8 * result) = a2;
  uint64_t v5 = a5[7] + 16 * result;
  *(void *)uint64_t v5 = a3;
  *(unsigned char *)(v5 + 8) = a4 & 1;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

unint64_t sub_20CB90490(unint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(result >> 6) + 8] |= 1 << result;
  *(void *)(a4[6] + 8 * result) = a2;
  *(void *)(a4[7] + 8 * result) = a3;
  uint64_t v4 = a4[2];
  BOOL v5 = __OFADD__(v4, 1);
  uint64_t v6 = v4 + 1;
  if (v5) {
    __break(1u);
  }
  else {
    a4[2] = v6;
  }
  return result;
}

unint64_t sub_20CB904D4(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  BOOL v5 = (void *)(a5[6] + 16 * result);
  void *v5 = a2;
  v5[1] = a3;
  *(void *)(a5[7] + 8 * result) = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

unint64_t sub_20CB9051C(uint64_t a1, uint64_t a2)
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

unint64_t sub_20CB905B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        unint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

void sub_20CB9069C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  uint64_t v4 = a2 & ~v3;
  sub_20CB90E50();
  if (v6)
  {
    sub_20CB6CEE4(0, v5);
    id v7 = *(id *)(*(void *)(v2 + 48) + 8 * v4);
    char v8 = static NSObject.== infix(_:_:)();

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = ~v3;
      uint64_t v10 = (v4 + 1) & v9;
      sub_20CB90E50();
      if (v11)
      {
        do
        {
          id v12 = *(id *)(*(void *)(v2 + 48) + 8 * v10);
          char v13 = static NSObject.== infix(_:_:)();

          if (v13) {
            break;
          }
          uint64_t v10 = (v10 + 1) & v9;
          sub_20CB90E50();
        }
        while ((v14 & 1) != 0);
      }
    }
  }
  sub_20CB90E80();
}

uint64_t sub_20CB90788(uint64_t *a1, char a2, void **a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *a1;
  if (*a1)
  {
    if (a2)
    {
      *(void *)((*a3)[7] + 8 * a4) = v6;
    }
    else
    {
      sub_20CB904D4(a4, a5, a6, v6, *a3);
      swift_bridgeObjectRetain();
    }
  }
  else if (a2)
  {
    swift_arrayDestroy();
    sub_20CB650D0(&qword_2676F14C8);
    _NativeDictionary._delete(at:)();
  }
  return swift_bridgeObjectRetain();
}

uint64_t sub_20CB9085C(uint64_t *a1, char a2, void **a3, unint64_t a4, void *a5)
{
  uint64_t v6 = *a1;
  if (*a1)
  {
    id v7 = *a3;
    if (a2)
    {
      *(void *)(v7[7] + 8 * a4) = v6;
    }
    else
    {
      sub_20CB90490(a4, (uint64_t)a5, v6, v7);
      id v9 = a5;
    }
  }
  else if (a2)
  {
    sub_20CB6CEE4(0, &qword_2676F14B0);
    swift_arrayDestroy();
    sub_20CB650D0(&qword_2676F14B8);
    sub_20CB90944();
    sub_20CB90F88();
    _NativeDictionary._delete(at:)();
  }
  return swift_bridgeObjectRetain();
}

unint64_t sub_20CB90944()
{
  unint64_t result = qword_2676F14C0;
  if (!qword_2676F14C0)
  {
    sub_20CB6CEE4(255, &qword_2676F14B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2676F14C0);
  }
  return result;
}

uint64_t sub_20CB909A4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_20CB650D0(a3);
  sub_20CB6A86C();
  sub_20CB83550();
  v4();
  return a2;
}

_OWORD *sub_20CB909FC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_20CB90A0C()
{
  return sub_20CB89DC0();
}

void sub_20CB90A14()
{
  sub_20CB90AF8();
  *uint64_t v0 = v1;
}

uint64_t sub_20CB90A78(uint64_t *a1)
{
  return sub_20CB89E80(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

void sub_20CB90A94()
{
  sub_20CB90AF8();
  *uint64_t v0 = v1;
}

void sub_20CB90AF8()
{
  sub_20CB83248();
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  char v8 = v7;
  uint64_t v9 = v1;
  char v11 = v10;
  if (v12)
  {
    unint64_t v13 = *(void *)(v1 + 24);
    int64_t v14 = v13 >> 1;
    if ((uint64_t)(v13 >> 1) < v0)
    {
      if (v14 + 0x4000000000000000 < 0)
      {
LABEL_25:
        __break(1u);
        return;
      }
      int64_t v14 = v13 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v13 & 0xFFFFFFFFFFFFFFFELL) <= v0) {
        int64_t v14 = v0;
      }
    }
  }
  else
  {
    int64_t v14 = v0;
  }
  uint64_t v15 = *(void *)(v1 + 16);
  if (v14 <= v15) {
    uint64_t v16 = *(void *)(v1 + 16);
  }
  else {
    uint64_t v16 = v14;
  }
  if (!v16)
  {
    uint64_t v22 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  sub_20CB650D0(v2);
  uint64_t v17 = v8(0);
  sub_20CB90E24(v17);
  uint64_t v19 = *(void *)(v18 + 72);
  unint64_t v21 = (*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  uint64_t v22 = (void *)swift_allocObject();
  size_t v23 = j__malloc_size(v22);
  if (!v19)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (v23 - v21 == 0x8000000000000000 && v19 == -1) {
    goto LABEL_24;
  }
  id v22[2] = v15;
  void v22[3] = 2 * ((uint64_t)(v23 - v21) / v19);
LABEL_19:
  uint64_t v25 = *(void *)(v8(0) - 8);
  unint64_t v26 = (*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
  uint64_t v27 = (char *)v22 + v26;
  uint64_t v28 = v9 + v26;
  if (v11)
  {
    v6(v28, v15, v27);
    *(void *)(v9 + 16) = 0;
  }
  else
  {
    v4(v28, v15, v27);
  }
  swift_release();
  sub_20CB83260();
}

uint64_t sub_20CB90C80()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_20CB90CB8()
{
  return (*(uint64_t (**)(void))(v0 + 48))();
}

uint64_t sub_20CB90CE0()
{
  return (*(uint64_t (**)(void))(v0 + 48))();
}

uint64_t sub_20CB90D08()
{
  sub_20CB90FCC();
  return v0();
}

uint64_t sub_20CB90D3C(void *a1, double *a2)
{
  return (*(uint64_t (**)(void, double))(v2 + 16))(*a1, *a2);
}

uint64_t sub_20CB90DFC()
{
  return v0;
}

uint64_t sub_20CB90E14()
{
  return v0;
}

uint64_t sub_20CB90E24(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_20CB90E64()
{
  return v0;
}

uint64_t sub_20CB90E74(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t sub_20CB90EA4()
{
  return sub_20CB798B4(v3, v2, v1, v0, 0);
}

uint64_t sub_20CB90EC8()
{
  sub_20CB6B280(v1);
  return v0;
}

uint64_t sub_20CB90F28()
{
  return swift_retain();
}

uint64_t sub_20CB90F48()
{
  return v0;
}

BOOL sub_20CB90F60@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t sub_20CB90FA0()
{
  long long v2 = *(_OWORD *)(v0 + 96);
  *(_OWORD *)(v1 - 144) = *(_OWORD *)(v0 + 80);
  *(_OWORD *)(v1 - 128) = v2;
  return 0;
}

uint64_t sub_20CB90FB4()
{
  return 0;
}

uint64_t sub_20CB90FE0(void *a1)
{
  sub_20CB924AC((uint64_t)(v1 + 2), (uint64_t)v11);
  if (!v12) {
    goto LABEL_5;
  }
  sub_20CB924AC((uint64_t)v11, (uint64_t)v10);
  if ((swift_dynamicCast() & 1) == 0)
  {
    sub_20CB6C1F4((uint64_t)v10);
LABEL_5:
    uint64_t v3 = MEMORY[0x263F8D310];
    uint64_t v4 = *v1;
    char v5 = *((unsigned char *)v1 + 8);
    sub_20CB92514();
    swift_allocError();
    *(void *)uint64_t v6 = v3;
    *(void *)(v6 + 8) = v4;
    *(unsigned char *)(v6 + 16) = v5;
    swift_willThrow();
    return sub_20CB92560((uint64_t)v11);
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  a1[1] = v9;
  sub_20CB6C1F4((uint64_t)v10);
  return sub_20CB92560((uint64_t)v11);
}

uint64_t sub_20CB910CC(uint64_t a1)
{
  sub_20CB924AC((uint64_t)(v1 + 2), (uint64_t)v10);
  if (!v11) {
    goto LABEL_5;
  }
  sub_20CB924AC((uint64_t)v10, (uint64_t)v9);
  if ((swift_dynamicCast() & 1) == 0)
  {
    sub_20CB6C1F4((uint64_t)v9);
LABEL_5:
    uint64_t v3 = MEMORY[0x263F06F78];
    uint64_t v4 = *v1;
    char v5 = *((unsigned char *)v1 + 8);
    sub_20CB92514();
    swift_allocError();
    *(void *)uint64_t v6 = v3;
    *(void *)(v6 + 8) = v4;
    *(unsigned char *)(v6 + 16) = v5;
    swift_willThrow();
    return sub_20CB92560((uint64_t)v10);
  }
  sub_20CB64DC8(*(void *)a1, *(void *)(a1 + 8));
  *(_OWORD *)a1 = v8;
  sub_20CB6C1F4((uint64_t)v9);
  return sub_20CB92560((uint64_t)v10);
}

uint64_t sub_20CB911B8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  id v7 = &v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_20CB924AC((uint64_t)(v2 + 2), (uint64_t)v13);
  if (!v14) {
    goto LABEL_5;
  }
  sub_20CB924AC((uint64_t)v13, (uint64_t)v12);
  if ((swift_dynamicCast() & 1) == 0)
  {
    sub_20CB6C1F4((uint64_t)v12);
LABEL_5:
    uint64_t v8 = *v2;
    char v9 = *((unsigned char *)v2 + 8);
    sub_20CB92514();
    swift_allocError();
    *(void *)uint64_t v10 = a2;
    *(void *)(v10 + 8) = v8;
    *(unsigned char *)(v10 + 16) = v9;
    swift_willThrow();
    return sub_20CB92560((uint64_t)v13);
  }
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, a2);
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v5 + 32))(a1, v7, a2);
  sub_20CB6C1F4((uint64_t)v12);
  return sub_20CB92560((uint64_t)v13);
}

uint64_t sub_20CB91338(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for Optional();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v13[-v7];
  sub_20CB924AC((uint64_t)(v2 + 2), (uint64_t)v13);
  sub_20CB650D0(qword_26ACC6AA8);
  if (swift_dynamicCast())
  {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    (*(void (**)(uint64_t, unsigned char *, uint64_t))(v6 + 32))(a1, v8, v5);
  }
  else
  {
    uint64_t v9 = *v2;
    char v10 = *((unsigned char *)v2 + 8) | 0x40;
    sub_20CB92514();
    swift_allocError();
    *(void *)uint64_t v11 = a2;
    *(void *)(v11 + 8) = v9;
    *(unsigned char *)(v11 + 16) = v10;
    swift_willThrow();
  }
  return sub_20CB92560((uint64_t)v13);
}

uint64_t sub_20CB914AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_20CB92BD8(a1, a2, a3, a4);
  if (!v11) {
    goto LABEL_5;
  }
  sub_20CB924AC((uint64_t)v10, (uint64_t)v9);
  sub_20CB650D0(v5);
  if ((swift_dynamicCast() & 1) == 0)
  {
    sub_20CB6C1F4((uint64_t)v9);
LABEL_5:
    sub_20CB92514();
    uint64_t v6 = sub_20CB92BC0();
    sub_20CB92BA0(v6, v7);
    return sub_20CB92560((uint64_t)v10);
  }
  swift_bridgeObjectRelease();
  void *v4 = v12;
  sub_20CB6C1F4((uint64_t)v9);
  return sub_20CB92560((uint64_t)v10);
}

uint64_t sub_20CB91578(void *a1, uint64_t a2)
{
  sub_20CB924AC((uint64_t)(v2 + 2), (uint64_t)v11);
  if (!v12) {
    goto LABEL_5;
  }
  sub_20CB924AC((uint64_t)v11, (uint64_t)v10);
  type metadata accessor for Array();
  if ((swift_dynamicCast() & 1) == 0)
  {
    sub_20CB6C1F4((uint64_t)v10);
LABEL_5:
    uint64_t v5 = *v2;
    char v6 = *((unsigned char *)v2 + 8) | 0x80;
    sub_20CB92514();
    swift_allocError();
    *(void *)uint64_t v7 = a2;
    *(void *)(v7 + 8) = v5;
    *(unsigned char *)(v7 + 16) = v6;
    swift_willThrow();
    return sub_20CB92560((uint64_t)v11);
  }
  swift_bridgeObjectRelease();
  *a1 = v9;
  sub_20CB6C1F4((uint64_t)v10);
  return sub_20CB92560((uint64_t)v11);
}

uint64_t sub_20CB91678()
{
  uint64_t result = *v0;
  if ((v0[1] & 1) == 0)
  {
    *uint64_t v0 = 0;
    *((unsigned char *)v0 + 8) = 1;
  }
  return result;
}

uint64_t sub_20CB91694(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  sub_20CB92C00(a1, a2, a3, a4, a5, a6);
  if (!v13) {
    goto LABEL_5;
  }
  sub_20CB924AC((uint64_t)v12, (uint64_t)v11);
  if ((swift_dynamicCast() & 1) == 0)
  {
    sub_20CB6C1F4((uint64_t)v11);
LABEL_5:
    sub_20CB92CBC();
    uint64_t v7 = sub_20CB92BC0();
    sub_20CB92BA0(v7, v8);
    return sub_20CB92560((uint64_t)v12);
  }
  *char v6 = v10;
  sub_20CB6C1F4((uint64_t)v11);
  return sub_20CB92560((uint64_t)v12);
}

uint64_t sub_20CB91748(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20CB914AC(a1, (uint64_t)&unk_2676F1598, MEMORY[0x263F8D5C8], a4);
}

uint64_t sub_20CB91770(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  sub_20CB92C00(a1, a2, a3, a4, a5, a6);
  if (!v13) {
    goto LABEL_5;
  }
  sub_20CB924AC((uint64_t)v12, (uint64_t)v11);
  if ((swift_dynamicCast() & 1) == 0)
  {
    sub_20CB6C1F4((uint64_t)v11);
LABEL_5:
    sub_20CB92CBC();
    uint64_t v7 = sub_20CB92BC0();
    sub_20CB92BA0(v7, v8);
    return sub_20CB92560((uint64_t)v12);
  }
  *char v6 = v10;
  sub_20CB6C1F4((uint64_t)v11);
  return sub_20CB92560((uint64_t)v12);
}

uint64_t sub_20CB91824(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20CB914AC(a1, (uint64_t)&unk_2676F1588, MEMORY[0x263F8D538], a4);
}

uint64_t sub_20CB9184C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20CB914AC(a1, (uint64_t)&unk_2676F1558, MEMORY[0x263F8E548], a4);
}

uint64_t sub_20CB91874(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20CB914AC(a1, (uint64_t)&unk_2676F1548, MEMORY[0x263F8E5C0], a4);
}

uint64_t sub_20CB9189C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20CB914AC(a1, (uint64_t)&unk_2676F1578, MEMORY[0x263F8E8F8], a4);
}

uint64_t sub_20CB918C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20CB914AC(a1, (uint64_t)&unk_2676F1568, MEMORY[0x263F8E970], a4);
}

uint64_t sub_20CB918EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_20CB92BD8(a1, a2, a3, a4);
  if (!v10) {
    goto LABEL_5;
  }
  sub_20CB924AC((uint64_t)v9, (uint64_t)v8);
  if ((swift_dynamicCast() & 1) == 0)
  {
    sub_20CB6C1F4((uint64_t)v8);
LABEL_5:
    sub_20CB92CBC();
    uint64_t v5 = sub_20CB92BC0();
    sub_20CB92BA0(v5, v6);
    return sub_20CB92560((uint64_t)v9);
  }
  _DWORD *v4 = v11;
  sub_20CB6C1F4((uint64_t)v8);
  return sub_20CB92560((uint64_t)v9);
}

uint64_t sub_20CB9199C(uint64_t a1, uint64_t a2)
{
  sub_20CB92C40(a1, a2);
  sub_20CB650D0(qword_26ACC6AA8);
  sub_20CB650D0(v3);
  if (swift_dynamicCast())
  {
    *(_DWORD *)uint64_t v2 = v7;
    *(unsigned char *)(v2 + 4) = v8;
  }
  else
  {
    sub_20CB92CA4();
    uint64_t v4 = sub_20CB92BC0();
    sub_20CB92BA0(v4, v5);
  }
  return sub_20CB92560((uint64_t)v9);
}

uint64_t sub_20CB91A44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_20CB92BD8(a1, a2, a3, a4);
  if (!v10) {
    goto LABEL_5;
  }
  sub_20CB924AC((uint64_t)v9, (uint64_t)v8);
  if ((swift_dynamicCast() & 1) == 0)
  {
    sub_20CB6C1F4((uint64_t)v8);
LABEL_5:
    sub_20CB92CBC();
    uint64_t v5 = sub_20CB92BC0();
    sub_20CB92BA0(v5, v6);
    return sub_20CB92560((uint64_t)v9);
  }
  void *v4 = v11;
  sub_20CB6C1F4((uint64_t)v8);
  return sub_20CB92560((uint64_t)v9);
}

uint64_t sub_20CB91AF4(uint64_t a1, uint64_t a2)
{
  sub_20CB92C40(a1, a2);
  sub_20CB650D0(qword_26ACC6AA8);
  sub_20CB650D0(v3);
  if (swift_dynamicCast())
  {
    *(void *)uint64_t v2 = v7;
    *(unsigned char *)(v2 + 8) = v8;
  }
  else
  {
    sub_20CB92CA4();
    uint64_t v4 = sub_20CB92BC0();
    sub_20CB92BA0(v4, v5);
  }
  return sub_20CB92560((uint64_t)v9);
}

uint64_t sub_20CB91B9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  sub_20CB92C00(a1, a2, a3, a4, a5, a6);
  if (!v13) {
    goto LABEL_5;
  }
  sub_20CB924AC((uint64_t)v12, (uint64_t)v11);
  if ((swift_dynamicCast() & 1) == 0)
  {
    sub_20CB6C1F4((uint64_t)v11);
LABEL_5:
    sub_20CB92CBC();
    uint64_t v7 = sub_20CB92BC0();
    sub_20CB92BA0(v7, v8);
    return sub_20CB92560((uint64_t)v12);
  }
  *uint64_t v6 = v10;
  sub_20CB6C1F4((uint64_t)v11);
  return sub_20CB92560((uint64_t)v12);
}

uint64_t sub_20CB91C50(uint64_t a1, uint64_t a2)
{
  sub_20CB92C20(a1, a2);
  sub_20CB650D0(qword_26ACC6AA8);
  sub_20CB650D0(&qword_2676F1540);
  if (swift_dynamicCast())
  {
    *uint64_t v2 = v5;
  }
  else
  {
    sub_20CB92CA4();
    sub_20CB92BC0();
    sub_20CB92CD4(v3, MEMORY[0x263F8D4F8]);
  }
  return sub_20CB92560((uint64_t)v6);
}

uint64_t sub_20CB91CF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20CB914AC(a1, (uint64_t)&unk_2676F1538, MEMORY[0x263F8D4F8], a4);
}

uint64_t sub_20CB91D20(void *a1)
{
  return sub_20CB90FE0(a1);
}

uint64_t sub_20CB91D38(uint64_t a1, uint64_t a2)
{
  sub_20CB92C20(a1, a2);
  sub_20CB650D0(qword_26ACC6AA8);
  sub_20CB650D0(&qword_2676F1530);
  if (sub_20CB92C68())
  {
    swift_bridgeObjectRelease();
    *uint64_t v2 = v5;
  }
  else
  {
    sub_20CB92CA4();
    sub_20CB92BC0();
    sub_20CB92CD4(v3, MEMORY[0x263F8D310]);
  }
  return sub_20CB92560((uint64_t)v6);
}

uint64_t sub_20CB91DD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20CB914AC(a1, (uint64_t)&unk_2676F1528, MEMORY[0x263F8D310], a4);
}

uint64_t sub_20CB91DFC(uint64_t a1)
{
  return sub_20CB910CC(a1);
}

uint64_t sub_20CB91E14(uint64_t a1, uint64_t a2)
{
  sub_20CB92C20(a1, a2);
  sub_20CB650D0(qword_26ACC6AA8);
  sub_20CB650D0(&qword_2676F1520);
  if (sub_20CB92C68())
  {
    sub_20CB64DB4(*(void *)v2, *(void *)(v2 + 8));
    *(_OWORD *)uint64_t v2 = v5;
  }
  else
  {
    sub_20CB92CA4();
    sub_20CB92BC0();
    sub_20CB92CD4(v3, MEMORY[0x263F06F78]);
  }
  return sub_20CB92560((uint64_t)v6);
}

uint64_t sub_20CB91EB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20CB914AC(a1, (uint64_t)&unk_2676F1518, MEMORY[0x263F06F78], a4);
}

uint64_t sub_20CB91ED8(uint64_t a1, uint64_t a2)
{
  return sub_20CB911B8(a1, a2);
}

uint64_t sub_20CB91EF0(uint64_t a1, uint64_t a2)
{
  return sub_20CB91338(a1, a2);
}

uint64_t sub_20CB91F08(void *a1, uint64_t a2)
{
  return sub_20CB91578(a1, a2);
}

uint64_t sub_20CB91F20(uint64_t a1)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v2 = type metadata accessor for Dictionary();
  return sub_20CB911B8(a1, v2);
}

uint64_t sub_20CB91FFC()
{
  sub_20CB92C8C();
  sub_20CB92CF0();
  sub_20CB92D30();
  uint64_t v1 = sub_20CB92D10();
  return sub_20CB911B8(v0, v1);
}

void sub_20CB9206C()
{
}

uint64_t sub_20CB920C8()
{
  return sub_20CB91678();
}

uint64_t sub_20CB920F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_20CB91694(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_20CB9210C(uint64_t a1)
{
  return sub_20CB9199C(a1, (uint64_t)&unk_2676F15A0);
}

uint64_t sub_20CB92134(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20CB91748(a1, a2, a3, a4);
}

uint64_t sub_20CB9214C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_20CB91770(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_20CB92164(uint64_t a1)
{
  return sub_20CB91AF4(a1, (uint64_t)&unk_2676F1590);
}

uint64_t sub_20CB9218C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20CB91824(a1, a2, a3, a4);
}

uint64_t sub_20CB921A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20CB918EC(a1, MEMORY[0x263F8E548], MEMORY[0x263F8E548], a4);
}

uint64_t sub_20CB921C8(uint64_t a1)
{
  return sub_20CB9199C(a1, (uint64_t)&unk_2676F1560);
}

uint64_t sub_20CB921F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20CB9184C(a1, a2, a3, a4);
}

uint64_t sub_20CB92208(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20CB91A44(a1, MEMORY[0x263F8E5C0], MEMORY[0x263F8E5C0], a4);
}

uint64_t sub_20CB9222C(uint64_t a1)
{
  return sub_20CB91AF4(a1, (uint64_t)&unk_2676F1550);
}

uint64_t sub_20CB92254(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20CB91874(a1, a2, a3, a4);
}

uint64_t sub_20CB9226C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20CB918EC(a1, MEMORY[0x263F8E8F8], MEMORY[0x263F8E8F8], a4);
}

uint64_t sub_20CB92290(uint64_t a1)
{
  return sub_20CB9199C(a1, (uint64_t)&unk_2676F1580);
}

uint64_t sub_20CB922B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20CB9189C(a1, a2, a3, a4);
}

uint64_t sub_20CB922D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20CB91A44(a1, MEMORY[0x263F8E970], MEMORY[0x263F8E970], a4);
}

uint64_t sub_20CB922F4(uint64_t a1)
{
  return sub_20CB91AF4(a1, (uint64_t)&unk_2676F1570);
}

uint64_t sub_20CB9231C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20CB918C4(a1, a2, a3, a4);
}

uint64_t sub_20CB92334(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_20CB91B9C(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_20CB9234C(uint64_t a1, uint64_t a2)
{
  return sub_20CB91C50(a1, a2);
}

uint64_t sub_20CB92364(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20CB91CF8(a1, a2, a3, a4);
}

uint64_t sub_20CB9237C(void *a1)
{
  return sub_20CB91D20(a1);
}

uint64_t sub_20CB92394(uint64_t a1, uint64_t a2)
{
  return sub_20CB91D38(a1, a2);
}

uint64_t sub_20CB923AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20CB91DD4(a1, a2, a3, a4);
}

uint64_t sub_20CB923C4(uint64_t a1)
{
  return sub_20CB91DFC(a1);
}

uint64_t sub_20CB923DC(uint64_t a1, uint64_t a2)
{
  return sub_20CB91E14(a1, a2);
}

uint64_t sub_20CB923F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20CB91EB0(a1, a2, a3, a4);
}

uint64_t sub_20CB9240C(uint64_t a1, uint64_t a2)
{
  return sub_20CB91ED8(a1, a2);
}

uint64_t sub_20CB92424(uint64_t a1, uint64_t a2)
{
  return sub_20CB91EF0(a1, a2);
}

uint64_t sub_20CB9243C(void *a1, uint64_t a2)
{
  return sub_20CB91F08(a1, a2);
}

uint64_t sub_20CB92454(uint64_t a1)
{
  return sub_20CB91F20(a1);
}

uint64_t sub_20CB9246C()
{
  return sub_20CB91FFC();
}

void sub_20CB92484()
{
}

uint64_t sub_20CB92494()
{
  return Decoder.decodeExtensionFieldsAsMessageSet(values:messageType:)();
}

uint64_t sub_20CB924AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_20CB650D0(qword_26ACC6AA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_20CB92514()
{
  unint64_t result = qword_2676F1510;
  if (!qword_2676F1510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2676F1510);
  }
  return result;
}

uint64_t sub_20CB92560(uint64_t a1)
{
  uint64_t v2 = sub_20CB650D0(qword_26ACC6AA8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

__n128 initializeBufferWithCopyOfBuffer for OneFieldDecoderError(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for OneFieldDecoderError(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x3FFE && *(unsigned char *)(a1 + 17))
    {
      unsigned int v2 = *(_DWORD *)a1 + 16381;
    }
    else
    {
      unsigned int v2 = ((*(unsigned __int8 *)(a1 + 16) >> 6) | (4
                                                  * ((*(void *)a1 >> 57) & 0x78 | *(void *)a1 & 7 | (((*(unsigned __int8 *)(a1 + 16) >> 1) & 0x1F) << 7)))) ^ 0x3FFF;
      if (v2 >= 0x3FFD) {
        unsigned int v2 = -1;
      }
    }
  }
  else
  {
    unsigned int v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for OneFieldDecoderError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x3FFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 16382;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x3FFE) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0x3FFE) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 2) & 0xFFF | ((-a2 & 0x3FFF) << 12);
      *(void *)__n128 result = (v3 | (v3 << 57)) & 0xF000000000000007;
      *(void *)(result + 8) = 0;
      *(unsigned char *)(result + 16) = (v3 >> 6) & 0xFE;
    }
  }
  return result;
}

uint64_t sub_20CB926B4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16) >> 6;
}

uint64_t sub_20CB926C0(uint64_t result)
{
  *(unsigned char *)(result + 16) &= 0x3Fu;
  return result;
}

uint64_t sub_20CB926D0(uint64_t result, char a2)
{
  char v2 = *(unsigned char *)(result + 16) & 1 | (a2 << 6);
  *(void *)result &= 0xFFFFFFFFFFFFFF8uLL;
  *(unsigned char *)(result + 16) = v2;
  return result;
}

ValueMetadata *type metadata accessor for OneFieldDecoderError()
{
  return &type metadata for OneFieldDecoderError;
}

uint64_t destroy for OneFieldDecoder(uint64_t result)
{
  if (*(void *)(result + 40)) {
    return sub_20CB6C1F4(result + 16);
  }
  return result;
}

uint64_t initializeWithCopy for OneFieldDecoder(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = (_OWORD *)(a1 + 16);
  long long v5 = (_OWORD *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 40);
  if (v6)
  {
    *(void *)(a1 + 40) = v6;
    (**(void (***)(_OWORD *, _OWORD *))(v6 - 8))(v4, v5);
  }
  else
  {
    long long v7 = v5[1];
    _OWORD *v4 = *v5;
    v4[1] = v7;
  }
  return a1;
}

uint64_t assignWithCopy for OneFieldDecoder(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v3;
  uint64_t v4 = (_OWORD *)(a1 + 16);
  long long v5 = a2 + 2;
  uint64_t v6 = a2[5];
  if (!*(void *)(a1 + 40))
  {
    if (v6)
    {
      *(void *)(a1 + 40) = v6;
      (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 16, (uint64_t)(a2 + 2));
      return a1;
    }
LABEL_7:
    long long v7 = v5[1];
    _OWORD *v4 = *v5;
    v4[1] = v7;
    return a1;
  }
  if (!v6)
  {
    sub_20CB6C1F4(a1 + 16);
    goto LABEL_7;
  }
  sub_20CB92844((uint64_t *)(a1 + 16), a2 + 2);
  return a1;
}

uint64_t *sub_20CB92844(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        __n128 result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *__n128 result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

__n128 initializeWithTake for OneFieldDecoder(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for OneFieldDecoder(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = (_OWORD *)(a1 + 16);
  if (*(void *)(a1 + 40)) {
    sub_20CB6C1F4(a1 + 16);
  }
  long long v5 = *(_OWORD *)(a2 + 32);
  _OWORD *v4 = *(_OWORD *)(a2 + 16);
  v4[1] = v5;
  return a1;
}

uint64_t getEnumTagSinglePayload for OneFieldDecoder(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 48))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 40);
      if (v3 >= 0xFFFFFFFF) {
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

uint64_t storeEnumTagSinglePayload for OneFieldDecoder(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 48) = 0;
    }
    if (a2) {
      *(void *)(result + 40) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for OneFieldDecoder()
{
  return &type metadata for OneFieldDecoder;
}

uint64_t sub_20CB92BA0(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = v3;
  *(void *)(a2 + 8) = v4;
  *(unsigned char *)(a2 + 16) = v2;
  return swift_willThrow();
}

uint64_t sub_20CB92BC0()
{
  return swift_allocError();
}

uint64_t sub_20CB92BD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  return sub_20CB924AC(v4 + 16, (uint64_t)va);
}

uint64_t sub_20CB92C00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  return sub_20CB924AC(v6 + 16, (uint64_t)va);
}

uint64_t sub_20CB92C20(uint64_t a1, uint64_t a2, ...)
{
  va_start(va, a2);
  return sub_20CB924AC(v2 + 16, (uint64_t)va);
}

uint64_t sub_20CB92C40(uint64_t a1, uint64_t a2, ...)
{
  va_start(va, a2);
  return sub_20CB924AC(v2 + 16, (uint64_t)va);
}

uint64_t sub_20CB92C68()
{
  return swift_dynamicCast();
}

unint64_t sub_20CB92CA4()
{
  return sub_20CB92514();
}

unint64_t sub_20CB92CBC()
{
  return sub_20CB92514();
}

uint64_t sub_20CB92CD4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v2;
  return swift_willThrow();
}

uint64_t sub_20CB92CF0()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t sub_20CB92D10()
{
  return type metadata accessor for Dictionary();
}

uint64_t sub_20CB92D30()
{
  return swift_getAssociatedConformanceWitness();
}

unsigned char *initializeBufferWithCopyOfBuffer for SubstitutingVisitorError(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SubstitutingVisitorError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v5 = v6 - 2;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for SubstitutingVisitorError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x20CB92EB0);
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

uint64_t sub_20CB92ED8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_20CB92EE0(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SubstitutingVisitorError()
{
  return &type metadata for SubstitutingVisitorError;
}

uint64_t sub_20CB92EFC()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_20CB92F98(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unsigned int v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    uint64_t v9 = *a2;
    uint64_t *v4 = *a2;
    unsigned int v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    uint64_t v10 = (void *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v11 = v10[1];
    uint64_t v12 = (void *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v12 = *v10;
    v12[1] = v11;
  }
  swift_retain();
  return v4;
}

uint64_t sub_20CB93090(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
  return swift_release();
}

uint64_t sub_20CB93100(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v9 = v8[1];
  *int v7 = *v8;
  v7[1] = v9;
  swift_retain();
  return a1;
}

uint64_t sub_20CB93180(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v9 = v8[1];
  *int v7 = *v8;
  v7[1] = v9;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_20CB9320C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  *(_OWORD *)((*(void *)(v5 + 32) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((*(void *)(v5 + 32) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_20CB93288(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  *(_OWORD *)((*(void *)(v5 + 24) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((*(void *)(v5 + 24) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_20CB9330C(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(unsigned int *)(*(void *)(v4 - 8) + 84);
  uint64_t v6 = *(void *)(*(void *)(v4 - 8) + 64);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(*(void *)(v4 - 8) + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
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
        JUMPOUT(0x20CB93448);
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
  if (v5 >= 0x7FFFFFFF) {
    return _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)a1, v5, v4);
  }
  unint64_t v17 = *(void *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
  if (v17 >= 0xFFFFFFFF) {
    LODWORD(v17) = -1;
  }
  return (v17 + 1);
}

void sub_20CB9345C(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 16);
  uint64_t v7 = *(unsigned int *)(*(void *)(v6 - 8) + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(*(void *)(v6 - 8) + 84);
  }
  uint64_t v9 = *(void *)(*(void *)(v6 - 8) + 64);
  unint64_t v10 = ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (((v9 + 7) & 0xFFFFFFF8) == 0xFFFFFFF0) {
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
    if (((v9 + 7) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      int v15 = a2 - v8;
    }
    else {
      int v15 = 1;
    }
    if (((v9 + 7) & 0xFFFFFFF8) != 0xFFFFFFF0)
    {
      int v16 = ~v8 + a2;
      bzero(a1, ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 16);
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
        goto LABEL_44;
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
LABEL_44:
      __break(1u);
      JUMPOUT(0x20CB9362CLL);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_32;
    default:
LABEL_32:
      if (a2)
      {
LABEL_33:
        if (v7 < 0x7FFFFFFF)
        {
          unint64_t v17 = (void *)((unint64_t)&a1[v9 + 7] & 0xFFFFFFFFFFFFFFF8);
          if ((a2 & 0x80000000) != 0)
          {
            uint64_t v18 = a2 ^ 0x80000000;
            v17[1] = 0;
          }
          else
          {
            uint64_t v18 = (a2 - 1);
          }
          *unint64_t v17 = v18;
        }
        else
        {
          _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)a1, a2, v7, v6);
        }
      }
      return;
  }
}

uint64_t type metadata accessor for SubstitutingVisitor()
{
  return swift_getGenericMetadata();
}

unint64_t sub_20CB93670()
{
  unint64_t result = qword_2676F15A8;
  if (!qword_2676F15A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2676F15A8);
  }
  return result;
}

uint64_t sub_20CB936BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(a5, a1, a4);
  uint64_t result = type metadata accessor for SubstitutingVisitor();
  uint64_t v9 = (void *)(a5 + *(int *)(result + 52));
  *uint64_t v9 = a2;
  v9[1] = a3;
  return result;
}

uint64_t sub_20CB93768@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(a1 + 24);
  uint64_t v6 = type metadata accessor for Optional();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  unint64_t v10 = (char *)&v13 - v9;
  (*(void (**)(uint64_t))(v2 + *(int *)(a1 + 52)))(v8);
  if (_s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwet_0((uint64_t)v10, 1, v5) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v5 - 8) + 32))(a2, v10, v5);
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  sub_20CB74754();
  swift_allocError();
  *unsigned int v11 = 0;
  return swift_willThrow();
}

uint64_t sub_20CB938D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v28 = a1;
  uint64_t v27 = a2;
  uint64_t v32 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(v9 + 24);
  uint64_t v11 = *(void *)(v9 + 40);
  v30[0] = v12;
  v30[1] = v10;
  v30[2] = v13;
  uint64_t v31 = v11;
  uint64_t v14 = type metadata accessor for SubstitutingVisitor();
  MEMORY[0x270FA5388](v14);
  unint64_t v17 = (char *)v25 - v16;
  if (v10 == a4)
  {
    uint64_t v31 = a4;
    uint64_t v22 = sub_20CB6FB90(v30);
    uint64_t v23 = v29;
    sub_20CB93768(a3, (uint64_t)v22);
    if (v23) {
      return sub_20CB94E84((uint64_t)v30);
    }
    sub_20CB94F10(v27, (uint64_t)v30);
  }
  else
  {
    uint64_t v18 = (uint64_t)v17;
    v25[3] = v11;
    uint64_t v26 = v15;
    uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v32 + 16);
    v32 += 16;
    v25[0] = v19;
    v19(v8, v28, a4);
    v25[1] = a3;
    v25[2] = v4;
    sub_20CB936BC((uint64_t)v8, *(void *)(v4 + *(int *)(a3 + 52)), *(void *)(v4 + *(int *)(a3 + 52) + 8), a4, v18);
    swift_retain();
    swift_getWitnessTable();
    uint64_t v20 = v29;
    dispatch thunk of Message.traverse<A>(visitor:)();
    if (v20) {
      return (*(uint64_t (**)(uint64_t, uint64_t))(v26 + 8))(v18, v14);
    }
    uint64_t v31 = a4;
    uint64_t v24 = sub_20CB6FB90(v30);
    ((void (*)(uint64_t *, uint64_t, uint64_t))v25[0])(v24, v18, a4);
    sub_20CB94F10(v27, (uint64_t)v30);
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v18, v14);
  }
  return sub_20CB92560((uint64_t)v30);
}

uint64_t sub_20CB93BC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v14 = a2;
  uint64_t v16 = static Array._allocateUninitialized(_:)();
  Swift::Int v8 = MEMORY[0x210555520](a1, a4);
  uint64_t v9 = type metadata accessor for Array();
  Array.reserveCapacity(_:)(v8);
  uint64_t v13 = &v12;
  v15[0] = a1;
  MEMORY[0x270FA5388](v10);
  long long v12 = *(_OWORD *)(a3 + 32);
  swift_getWitnessTable();
  Sequence.forEach(_:)();
  if (!v4)
  {
    v15[3] = v9;
    v15[0] = v16;
    swift_bridgeObjectRetain();
    sub_20CB94F10(v14, (uint64_t)v15);
    sub_20CB92560((uint64_t)v15);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_20CB93DE8(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x270FA5388](a1);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11[0] = v5;
  v11[1] = v6;
  id v11[2] = v7;
  v11[3] = v8;
  uint64_t v9 = type metadata accessor for SubstitutingVisitor();
  uint64_t result = sub_20CB93768(v9, (uint64_t)v4);
  if (!v1)
  {
    swift_dynamicCast();
    type metadata accessor for Array();
    return Array.append(_:)();
  }
  return result;
}

uint64_t sub_20CB93F18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v31 = a2;
  uint64_t v29 = a4;
  uint64_t v30 = a7;
  uint64_t v28 = a3;
  uint64_t v13 = *(void *)(a6 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = v17;
  uint64_t v34 = v16;
  uint64_t v35 = a9;
  uint64_t v36 = v18;
  uint64_t v19 = type metadata accessor for SubstitutingVisitor();
  uint64_t v37 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  unint64_t v21 = (char *)&v25 - v20;
  uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  uint64_t v27 = v13 + 16;
  v26(v15, a1, a6);
  uint64_t v33 = v29;
  uint64_t v34 = a5;
  uint64_t v35 = v30;
  uint64_t v36 = a8;
  uint64_t v22 = type metadata accessor for SubstitutingVisitor();
  sub_20CB936BC((uint64_t)v15, *(void *)(v31 + *(int *)(v22 + 52)), *(void *)(v31 + *(int *)(v22 + 52) + 8), a6, (uint64_t)v21);
  swift_retain();
  swift_getWitnessTable();
  uint64_t v23 = v32;
  dispatch thunk of Message.traverse<A>(visitor:)();
  if (!v23)
  {
    v26(v15, (uint64_t)v21, a6);
    type metadata accessor for Array();
    Array.append(_:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v21, v19);
}

uint64_t sub_20CB94174(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v18 = a2;
  uint64_t v19 = a8;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  MEMORY[0x2105553E0](a1, AssociatedTypeWitness, a5, AssociatedConformanceWitness);
  uint64_t v22 = Dictionary.init(minimumCapacity:)();
  v17[1] = v17;
  v21[0] = a1;
  uint64_t v12 = MEMORY[0x270FA5388](v22);
  MEMORY[0x270FA5388](v12);
  uint64_t v13 = type metadata accessor for Dictionary();
  swift_getWitnessTable();
  uint64_t v14 = v20;
  Sequence.forEach(_:)();
  if (!v14)
  {
    uint64_t v15 = v22;
    type metadata accessor for Dictionary();
    v21[3] = v13;
    v21[0] = v15;
    swift_bridgeObjectRetain();
    sub_20CB94F10(v18, (uint64_t)v21);
    sub_20CB92560((uint64_t)v21);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_20CB944C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v31 = a5;
  uint64_t v32 = a4;
  uint64_t v29 = a3;
  uint64_t v30 = a10;
  MEMORY[0x270FA5388](a1);
  uint64_t v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = v15;
  uint64_t v16 = type metadata accessor for Optional();
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = (char *)&v27 - v17;
  uint64_t v27 = a7;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v20 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v22 = (char *)&v27 - v21;
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))((char *)&v27 - v21, a1, AssociatedTypeWitness);
  uint64_t v33 = v31;
  uint64_t v34 = a6;
  uint64_t v35 = a9;
  uint64_t v36 = v30;
  uint64_t v23 = type metadata accessor for SubstitutingVisitor();
  uint64_t v24 = v37;
  sub_20CB93768(v23, (uint64_t)v14);
  if (v24) {
    return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v22, AssociatedTypeWitness);
  }
  uint64_t v26 = v28;
  swift_dynamicCast();
  _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0((uint64_t)v18, 0, 1, v26);
  swift_getAssociatedConformanceWitness();
  type metadata accessor for Dictionary();
  return Dictionary.subscript.setter();
}

uint64_t sub_20CB94730(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  swift_getAssociatedTypeWitness();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  return a2(a1, a1 + *(int *)(TupleTypeMetadata2 + 48));
}

uint64_t sub_20CB947CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v42 = a5;
  uint64_t v43 = a3;
  uint64_t v36 = a1;
  uint64_t v41 = a9;
  uint64_t v39 = a4;
  uint64_t v40 = a12;
  uint64_t v16 = type metadata accessor for Optional();
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v37 = (char *)&v30 - v17;
  uint64_t v35 = *(void *)(a11 + 8);
  uint64_t v38 = a7;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v32 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v18 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v33 = (char *)&v30 - v19;
  uint64_t v20 = *(void *)(a8 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v30 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = a8;
  uint64_t v46 = a6;
  uint64_t v47 = a12;
  uint64_t v48 = a10;
  uint64_t v23 = type metadata accessor for SubstitutingVisitor();
  uint64_t v44 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = (char *)&v30 - v24;
  uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t))(v20 + 16);
  v31(v22, a2, a8);
  uint64_t v45 = v42;
  uint64_t v46 = a6;
  uint64_t v47 = v41;
  uint64_t v48 = a10;
  uint64_t v26 = type metadata accessor for SubstitutingVisitor();
  sub_20CB936BC((uint64_t)v22, *(void *)(v43 + *(int *)(v26 + 52)), *(void *)(v43 + *(int *)(v26 + 52) + 8), a8, (uint64_t)v25);
  swift_retain();
  swift_getWitnessTable();
  uint64_t v27 = v49;
  dispatch thunk of Message.traverse<A>(visitor:)();
  if (!v27)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v33, v36, AssociatedTypeWitness);
    uint64_t v28 = (uint64_t)v37;
    v31(v37, (uint64_t)v25, a8);
    _s12CloudKitCode30Ckcode_Proto2ProtectedEnvelopeV14OneOf_ContentsOwst_0(v28, 0, 1, a8);
    swift_getAssociatedConformanceWitness();
    type metadata accessor for Dictionary();
    Dictionary.subscript.setter();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v25, v23);
}

BOOL sub_20CB94B84(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void sub_20CB94B94(uint64_t a1, char a2)
{
}

Swift::Int sub_20CB94BBC(char a1)
{
  return Hasher._finalize()();
}

BOOL sub_20CB94C04(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_20CB94B84(*a1, *a2);
}

Swift::Int sub_20CB94C10()
{
  return sub_20CB94BBC(*v0);
}

void sub_20CB94C18(uint64_t a1)
{
  sub_20CB94B94(a1, *v1);
}

Swift::Int sub_20CB94C20()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t sub_20CB94C64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20CB938D8(a1, a2, a3, a4);
}

uint64_t sub_20CB94C7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20CB93BC4(a1, a2, a3, a4);
}

uint64_t sub_20CB94C94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_20CB94174(a1, a2, a3, a4, a5, a6, a7, a8);
}

void sub_20CB94CAC()
{
}

uint64_t sub_20CB94D08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_20CB94C64(a1, a2, a5, a3);
}

uint64_t sub_20CB94D30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_20CB94C7C(a1, a2, a5, a3);
}

uint64_t sub_20CB94D58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_20CB94C94(a1, a2, a8, a3, a4, a5, a6, a7);
}

void sub_20CB94D8C()
{
}

uint64_t sub_20CB94D9C()
{
  sub_20CB94ED8();
  return sub_20CB947CC(v0, v1, v2, v3, v4, v5, v6, v7, v9, v10, v11, v12);
}

uint64_t sub_20CB94DC0(uint64_t a1)
{
  return sub_20CB94DFC(a1);
}

uint64_t sub_20CB94DD8()
{
  sub_20CB94ED8();
  return sub_20CB944C4(v0, v1, v2, v3, v4, v5, v6, v7, v9, v10);
}

uint64_t sub_20CB94DFC(uint64_t a1)
{
  return sub_20CB94730(a1, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 88));
}

uint64_t sub_20CB94E3C()
{
  sub_20CB94EF8();
  return sub_20CB93F18(v0, v1, v2, v3, v4, v5, v6, v7, v9);
}

uint64_t sub_20CB94E60()
{
  sub_20CB94EF8();
  return sub_20CB93DE8(v0);
}

uint64_t sub_20CB94E84(uint64_t result)
{
  if ((*(_DWORD *)(*(void *)(*(void *)(result + 24) - 8) + 80) & 0x20000) != 0) {
    JUMPOUT(0x210555EA0);
  }
  return result;
}

__n128 sub_20CB94ED8()
{
  return v0[3];
}

uint64_t sub_20CB94F10(uint64_t a1, uint64_t a2)
{
  sub_20CB924AC(a2, (uint64_t)v7);
  long long v5 = 0u;
  long long v6 = 0u;
  *(void *)&long long v4 = a1;
  BYTE8(v4) = 0;
  sub_20CB94FC0((uint64_t)v7, (uint64_t)&v5);
  v8[0] = v4;
  v8[1] = v5;
  void v8[2] = v6;
  sub_20CB95028();
  dispatch thunk of Message.decodeMessage<A>(decoder:)();
  return sub_20CB95074((uint64_t)v8);
}

uint64_t sub_20CB94FC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_20CB650D0(qword_26ACC6AA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_20CB95028()
{
  unint64_t result = qword_26ACC6AA0;
  if (!qword_26ACC6AA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ACC6AA0);
  }
  return result;
}

uint64_t sub_20CB95074(uint64_t a1)
{
  return a1;
}

uint64_t _BridgedStoredNSError.init(_:userInfo:)()
{
  return MEMORY[0x270EEF800]();
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x270EEF830]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x270EEF840]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t Data.InlineData.init(_:)()
{
  return MEMORY[0x270EEFF98]();
}

uint64_t Data.LargeSlice.init(_:)()
{
  return MEMORY[0x270EEFFB8]();
}

uint64_t Data.InlineSlice.init(_:)()
{
  return MEMORY[0x270EF0008]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x270EF0120]();
}

uint64_t static Data.== infix(_:_:)()
{
  return MEMORY[0x270EF0158]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0178]();
}

uint64_t static Google_Protobuf_Any.== infix(_:_:)()
{
  return MEMORY[0x270F44988]();
}

uint64_t Google_Protobuf_Any.init()()
{
  return MEMORY[0x270F44998]();
}

uint64_t type metadata accessor for Google_Protobuf_Any()
{
  return MEMORY[0x270F449A0]();
}

uint64_t type metadata accessor for Google_Protobuf_Empty()
{
  return MEMORY[0x270F449A8]();
}

uint64_t UnknownStorage.traverse<A>(visitor:)()
{
  return MEMORY[0x270F44A18]();
}

uint64_t UnknownStorage.init()()
{
  return MEMORY[0x270F44A20]();
}

uint64_t type metadata accessor for UnknownStorage()
{
  return MEMORY[0x270F44A28]();
}

uint64_t BinaryDecodingOptions.init()()
{
  return MEMORY[0x270F44AA8]();
}

uint64_t type metadata accessor for BinaryDecodingOptions()
{
  return MEMORY[0x270F44AB0]();
}

uint64_t _MessageImplementationBase._protobuf_generated_isEqualTo(other:)()
{
  return MEMORY[0x270F44AD8]();
}

uint64_t dispatch thunk of Decoder.nextFieldNumber()()
{
  return MEMORY[0x270F44B10]();
}

uint64_t dispatch thunk of Decoder.handleConflictingOneOf()()
{
  return MEMORY[0x270F44B20]();
}

uint64_t dispatch thunk of Decoder.decodeSingularBytesField(value:)()
{
  return MEMORY[0x270F44B78]();
}

uint64_t dispatch thunk of Decoder.decodeSingularStringField(value:)()
{
  return MEMORY[0x270F44BF0]();
}

uint64_t dispatch thunk of Decoder.decodeSingularMessageField<A>(value:)()
{
  return MEMORY[0x270F44C38]();
}

uint64_t Decoder.decodeExtensionFieldsAsMessageSet(values:messageType:)()
{
  return MEMORY[0x270F44C40]();
}

uint64_t dispatch thunk of Message.decodeMessage<A>(decoder:)()
{
  return MEMORY[0x270F44C48]();
}

uint64_t dispatch thunk of Message.traverse<A>(visitor:)()
{
  return MEMORY[0x270F44C60]();
}

uint64_t Message.isInitialized.getter()
{
  return MEMORY[0x270F44C98]();
}

uint64_t Message.serializedData(partial:)()
{
  return MEMORY[0x270F44CA8]();
}

uint64_t Message.init<A>(serializedBytes:extensions:partial:options:)()
{
  return MEMORY[0x270F44CB8]();
}

uint64_t Message.hash(into:)()
{
  return MEMORY[0x270F44CD8]();
}

uint64_t static Message.with(_:)()
{
  return MEMORY[0x270F44CE0]();
}

uint64_t dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)()
{
  return MEMORY[0x270F44D88]();
}

uint64_t dispatch thunk of Visitor.visitSingularStringField(value:fieldNumber:)()
{
  return MEMORY[0x270F44DD8]();
}

uint64_t dispatch thunk of Visitor.visitSingularMessageField<A>(value:fieldNumber:)()
{
  return MEMORY[0x270F44E00]();
}

uint64_t Visitor.visitExtensionFieldsAsMessageSet(fields:start:end:)()
{
  return MEMORY[0x270F44E08]();
}

uint64_t type metadata accessor for _NameMap.NameDescription()
{
  return MEMORY[0x270F44E10]();
}

uint64_t _NameMap.init(dictionaryLiteral:)()
{
  return MEMORY[0x270F44E18]();
}

uint64_t type metadata accessor for _NameMap()
{
  return MEMORY[0x270F44E28]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t CKLogDistributedSync.getter()
{
  return MEMORY[0x270EE34E8]();
}

uint64_t CKLog.getter()
{
  return MEMORY[0x270EE3530]();
}

uint64_t related decl 'e' for CKErrorCode.init(_:description:)()
{
  return MEMORY[0x270EE3550]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x270EF1818]();
}

uint64_t Dictionary.init(minimumCapacity:)()
{
  return MEMORY[0x270F9D088]();
}

uint64_t Dictionary.count.getter()
{
  return MEMORY[0x270F9D120]();
}

uint64_t type metadata accessor for Dictionary()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t Dictionary.subscript.setter()
{
  return MEMORY[0x270F9D210]();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return MEMORY[0x270F9D320]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x270F9D598]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x270EF19B0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x270F9D708]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t Sequence.forEach(_:)()
{
  return MEMORY[0x270F9D9D0]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x270EF1B88]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t Array.startIndex.getter()
{
  return MEMORY[0x270F9DBA8]();
}

uint64_t static Array._adoptStorage(_:count:)()
{
  return MEMORY[0x270F9DBC8]();
}

uint64_t Array._checkSubscript(_:wasNativeTypeChecked:)()
{
  return MEMORY[0x270F9DBD0]();
}

Swift::Void __swiftcall Array.reserveCapacity(_:)(Swift::Int a1)
{
}

uint64_t static Array._allocateUninitialized(_:)()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x270F9DC20]();
}

Swift::Bool __swiftcall Array._hoistableIsNativeTypeChecked()()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t Array.count.getter()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t Array.append(_:)()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t Array.endIndex.getter()
{
  return MEMORY[0x270F9DCA8]();
}

Swift::Void __swiftcall Array.formIndex(after:)(Swift::Int *after)
{
}

uint64_t type metadata accessor for Array()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t CheckedContinuation.resume(throwing:)()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t AsyncStream.Continuation.onTermination.setter()
{
  return MEMORY[0x270FA1F30]();
}

uint64_t AsyncStream.Continuation.yield(_:)()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t AsyncStream.init(_:bufferingPolicy:_:)()
{
  return MEMORY[0x270FA1F90]();
}

uint64_t Collection.first.getter()
{
  return MEMORY[0x270F9E140]();
}

uint64_t static os_log_type_t.info.getter()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t CKRecord.subscript.getter()
{
  return MEMORY[0x270EE3758]();
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x270FA1170](seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return MEMORY[0x270FA1180]();
}

uint64_t NSObject.hashValue.getter()
{
  return MEMORY[0x270FA11A0]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x270F9E530]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x270F9E670]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x270F9EA40]();
}

Swift::Bool __swiftcall _NativeDictionary.ensureUnique(isUnique:capacity:)(Swift::Bool isUnique, Swift::Int capacity)
{
  return MEMORY[0x270F9EF08](isUnique, capacity);
}

uint64_t _NativeDictionary._delete(at:)()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFE8]();
}

{
  return MEMORY[0x270F9EFF0]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x270F9F080]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)()
{
  return MEMORY[0x270F9F778]();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t Error.ckIsPartialError.getter()
{
  return MEMORY[0x270EE3768]();
}

uint64_t Error._getEmbeddedNSError()()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t Error._code.getter()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t Error._domain.getter()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t Error._userInfo.getter()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x270F9FC48]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t type metadata accessor for Result()
{
  return MEMORY[0x270F9FCF8]();
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

void bzero(void *a1, size_t a2)
{
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x270FA0290]();
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

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
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

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x270FA0490]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
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

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}