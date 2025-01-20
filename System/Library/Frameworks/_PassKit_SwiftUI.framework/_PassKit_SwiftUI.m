id sub_23CA237FC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IdentityButton.Coordinator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for IdentityButton.Coordinator()
{
  return self;
}

void type metadata accessor for Style(uint64_t a1)
{
}

void type metadata accessor for Label(uint64_t a1)
{
}

void type metadata accessor for PKPaymentButtonStyle(uint64_t a1)
{
}

void type metadata accessor for PKPaymentButtonType(uint64_t a1)
{
}

void type metadata accessor for PKPayLaterDisplayStyle(uint64_t a1)
{
}

void type metadata accessor for PKPayLaterAction(uint64_t a1)
{
}

__n128 __swift_memcpy20_4(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u32[0] = a2[1].n128_u32[0];
  *a1 = result;
  return result;
}

uint64_t sub_23CA238F8(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 20)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_23CA23918(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_DWORD *)(result + 16) = 0;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 20) = v3;
  return result;
}

void type metadata accessor for Decimal(uint64_t a1)
{
}

void type metadata accessor for PKAddShareablePassConfigurationPrimaryAction(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for IdentityButton(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for IdentityButton()
{
  return swift_release();
}

uint64_t initializeWithCopy for IdentityButton(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  swift_retain();
  return a1;
}

void *assignWithCopy for IdentityButton(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v3 = a2[3];
  a1[2] = a2[2];
  a1[3] = v3;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_OWORD *assignWithTake for IdentityButton(_OWORD *a1, _OWORD *a2)
{
  long long v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for IdentityButton(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for IdentityButton(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IdentityButton()
{
  return &type metadata for IdentityButton;
}

unint64_t sub_23CA23B08()
{
  unint64_t result = qword_268BC2D98;
  if (!qword_268BC2D98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC2D98);
  }
  return result;
}

id sub_23CA23B5C()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F5C978]), sel_initWithLabel_style_, *v0, v0[1]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC2DA8);
  sub_23CA46B50();
  objc_msgSend(v1, sel_addTarget_action_forControlEvents_, v3, sel_callback, 0x2000);

  return v1;
}

id sub_23CA23C04@<X0>(void *a1@<X8>)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v3 = *(void *)(v1 + 24);
  v5 = (objc_class *)type metadata accessor for IdentityButton.Coordinator();
  v6 = (char *)objc_allocWithZone(v5);
  v7 = &v6[OBJC_IVAR____TtCV16_PassKit_SwiftUI14IdentityButton11Coordinator_action];
  *(void *)v7 = v4;
  *((void *)v7 + 1) = v3;
  v9.receiver = v6;
  v9.super_class = v5;
  swift_retain();
  id result = objc_msgSendSuper2(&v9, sel_init);
  *a1 = result;
  return result;
}

uint64_t sub_23CA23C7C()
{
  return sub_23CA46A80();
}

unint64_t sub_23CA23CC0(uint64_t a1)
{
  unint64_t result = sub_23CA23CE8();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23CA23CE8()
{
  unint64_t result = qword_268BC2DA0;
  if (!qword_268BC2DA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC2DA0);
  }
  return result;
}

uint64_t sub_23CA23D3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_23CA23CE8();

  return MEMORY[0x270F01780](a1, a2, a3, v6);
}

uint64_t sub_23CA23DA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_23CA23CE8();

  return MEMORY[0x270F01718](a1, a2, a3, v6);
}

uint64_t sub_23CA23E04()
{
  return sub_23CA46C30();
}

void sub_23CA23E20()
{
}

uint64_t sub_23CA23E48(uint64_t a1, uint64_t a2)
{
  return sub_23CA24248(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_23CA23E60(uint64_t a1, id *a2)
{
  uint64_t result = sub_23CA46DE0();
  *a2 = 0;
  return result;
}

uint64_t sub_23CA23ED8(uint64_t a1, id *a2)
{
  char v3 = sub_23CA46DF0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_23CA23F58@<X0>(uint64_t *a1@<X8>)
{
  sub_23CA46E00();
  uint64_t v2 = sub_23CA46DD0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

void *sub_23CA23F9C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_23CA23FAC(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_23CA23FB8()
{
  return MEMORY[0x263F1BB58];
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

void type metadata accessor for PKAddPassButtonStyle(uint64_t a1)
{
}

void type metadata accessor for PKPaymentNetwork(uint64_t a1)
{
}

void sub_23CA24030(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_23CA24078@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_23CA46DD0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_23CA240C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23CA46E00();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_23CA240EC(uint64_t a1)
{
  uint64_t v2 = sub_23CA241EC(&qword_268BC2DD8);
  uint64_t v3 = sub_23CA241EC((unint64_t *)&unk_268BC2DE0);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_23CA24184()
{
  return sub_23CA241EC(&qword_268BC2DC0);
}

uint64_t sub_23CA241B8()
{
  return sub_23CA241EC(&qword_268BC2DC8);
}

uint64_t sub_23CA241EC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for PKPaymentNetwork(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23CA24230(uint64_t a1, uint64_t a2)
{
  return sub_23CA24248(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_23CA24248(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_23CA46E00();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_23CA2428C()
{
  sub_23CA46E00();
  sub_23CA46E10();

  return swift_bridgeObjectRelease();
}

uint64_t sub_23CA242E0()
{
  sub_23CA46E00();
  sub_23CA47010();
  sub_23CA46E10();
  uint64_t v0 = sub_23CA47030();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_23CA24354()
{
  uint64_t v0 = sub_23CA46E00();
  uint64_t v2 = v1;
  if (v0 == sub_23CA46E00() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_23CA46FE0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_23CA243E0()
{
  return sub_23CA241EC(&qword_268BC2DD0);
}

void sub_23CA2441C()
{
  sub_23CA46E00();
  id v0 = objc_allocWithZone(MEMORY[0x263F087E8]);
  uint64_t v1 = (void *)sub_23CA46DD0();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, v1, 0, 0);

  qword_268BC5530 = (uint64_t)v2;
}

uint64_t AddPassToWalletButton.init(carKeyPassword:supportedRadioTechnologies:issuerIdentifier:onCompletion:fallback:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X4>, uint64_t a3@<X5>, uint64_t a4@<X6>, void (*a5)(uint64_t)@<X7>, _OWORD *a6@<X8>, uint64_t a7, uint64_t a8)
{
  uint64_t v16 = a3;
  uint64_t v17 = a4;
  v15[1] = a2;
  sub_23CA46F30();
  uint64_t v11 = MEMORY[0x270FA5388]();
  v13 = (char *)v15 - v12;
  a5(v11);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(a8 - 8) + 56))(v13, 0, 1, a8);
  return sub_23CA245CC(a1, (uint64_t)v13, v16, v17, a6);
}

uint64_t sub_23CA245CC@<X0>(uint64_t a1@<X2>, uint64_t a2@<X5>, uint64_t a3@<X6>, uint64_t a4@<X7>, _OWORD *a5@<X8>)
{
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F5BD00]), sel_init);
  v10 = (void *)sub_23CA46DD0();
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_setPassword_, v10);

  objc_msgSend(v9, sel_setSupportedRadioTechnologies_, a1);
  id v11 = v9;
  uint64_t v12 = (void *)sub_23CA46DD0();
  swift_bridgeObjectRelease();
  objc_msgSend(v11, sel_setIssuerIdentifier_, v12);

  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  *(void *)(v13 + 24) = a4;
  *(void *)&long long v16 = v11;
  *((void *)&v16 + 1) = sub_23CA25804;
  uint64_t v17 = v13;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  char v20 = 2;
  return sub_23CA29414(&v16, a2, a5);
}

uint64_t AddPassToWalletButton.init(_:onCompletion:fallback:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(uint64_t)@<X3>, uint64_t a5@<X5>, _OWORD *a6@<X8>)
{
  sub_23CA46F30();
  uint64_t v12 = MEMORY[0x270FA5388]();
  v14 = (char *)&v16 - v13;
  a4(v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(a5 - 8) + 56))(v14, 0, 1, a5);
  *(void *)&long long v16 = a1;
  *((void *)&v16 + 1) = a2;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v17 = a3;
  char v20 = 2;
  return sub_23CA29414(&v16, (uint64_t)v14, a6);
}

{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  long long v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;

  uint64_t v12 = sub_23CA46F30();
  MEMORY[0x270FA5388](v12 - 8);
  v14 = (char *)&v17 - v13;
  *(void *)&uint64_t v17 = a1;
  *((void *)&v17 + 1) = a2;
  uint64_t v19 = 0;
  char v20 = 0;
  uint64_t v18 = a3;
  v21 = 1;
  v15 = swift_retain();
  a4(v15);
  swift_release();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(a5 - 8) + 56))(v14, 0, 1, a5);
  return sub_23CA29414(&v17, (uint64_t)v14, a6);
}

void sub_23CA24844(id a1, char a2, void (*a3)(void *, uint64_t))
{
  if ((a2 & 1) == 0)
  {
    if ((unint64_t)a1 >> 62)
    {
      swift_bridgeObjectRetain();
      if (sub_23CA46FC0()) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v5 = *(void *)(((unint64_t)a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v5)
      {
LABEL_4:
        if (((unint64_t)a1 & 0xC000000000000001) != 0)
        {
          id v6 = (id)MEMORY[0x23ECEE680](0, a1);
          goto LABEL_7;
        }
        if (*(void *)(((unint64_t)a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          id v6 = *((id *)a1 + 4);
LABEL_7:
          v7 = v6;
          sub_23CA2555C(a1, 0);
          id v9 = v7;
          a3(v7, 0);

          return;
        }
        __break(1u);
        goto LABEL_18;
      }
    }
    sub_23CA2555C(a1, 0);
    if (qword_268BC2D20 == -1)
    {
LABEL_15:
      a3((void *)qword_268BC5530, 1);
      return;
    }
LABEL_18:
    swift_once();
    goto LABEL_15;
  }
  id v8 = a1;
  a3(a1, 1);

  sub_23CA2555C(a1, 1);
}

uint64_t AddPassToWalletButton<>.init(carKeyPassword:supportedRadioTechnologies:issuerIdentifier:onCompletion:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X5>, uint64_t a3@<X6>, uint64_t a4@<X8>)
{
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F5BD00]), sel_init);
  id v9 = (void *)sub_23CA46DD0();
  swift_bridgeObjectRelease();
  objc_msgSend(v8, sel_setPassword_, v9);

  objc_msgSend(v8, sel_setSupportedRadioTechnologies_, a1);
  id v10 = v8;
  id v11 = (void *)sub_23CA46DD0();
  swift_bridgeObjectRelease();
  objc_msgSend(v10, sel_setIssuerIdentifier_, v11);

  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a2;
  *(void *)(result + 24) = a3;
  *(void *)a4 = v10;
  *(void *)(a4 + 8) = sub_23CA24B50;
  *(void *)(a4 + 16) = result;
  *(void *)(a4 + 24) = 0;
  *(void *)(a4 + 32) = 0;
  *(_WORD *)(a4 + 40) = 258;
  return result;
}

uint64_t sub_23CA24B18()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_23CA24B50(void *a1, char a2)
{
  sub_23CA24844(a1, a2 & 1, *(void (**)(void *, uint64_t))(v2 + 16));
}

uint64_t AddPassToWalletButton<>.init(_:onCompletion:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  *(void *)a4 = result;
  *(void *)(a4 + 8) = a2;
  *(void *)(a4 + 24) = 0;
  *(void *)(a4 + 32) = 0;
  *(void *)(a4 + 16) = a3;
  *(_WORD *)(a4 + 40) = 258;
  return result;
}

{
  *(void *)a4 = result;
  *(void *)(a4 + 8) = a2;
  *(void *)(a4 + 24) = 0;
  *(void *)(a4 + 32) = 0;
  *(void *)(a4 + 16) = a3;
  *(_WORD *)(a4 + 40) = 257;
  return result;
}

id sub_23CA24B74(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *(void *)(a4 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](a1);
  id v10 = (char *)v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v12, v11);
  unint64_t v13 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v14 = (v9 + v13 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = *(_OWORD *)(a4 + 16);
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v15 + v13, v10, a4);
  long long v16 = (void *)(v15 + v14);
  *long long v16 = a2;
  v16[1] = a3;
  uint64_t v17 = (objc_class *)type metadata accessor for AddSecureElementPassViewControllerWrapper.Coordinator();
  uint64_t v18 = (char *)objc_allocWithZone(v17);
  uint64_t v19 = (uint64_t (**)(uint64_t, char))&v18[OBJC_IVAR____TtCV16_PassKit_SwiftUIP33_541E15F1A3504E1B411D8ADFDBE1A4E241AddSecureElementPassViewControllerWrapper11Coordinator_completion];
  *uint64_t v19 = sub_23CA2518C;
  v19[1] = (uint64_t (*)(uint64_t, char))v15;
  swift_retain_n();
  id v20 = a1;
  swift_retain();
  sub_23CA25258(0);
  v25.receiver = v18;
  v25.super_class = v17;
  id v21 = objc_msgSendSuper2(&v25, sel_init);
  swift_release();
  id v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F5C968]), sel_initWithConfiguration_delegate_, v20, v21);
  if (v22)
  {
    v24[1] = v20;
    v24[2] = sub_23CA2518C;
    v24[3] = v15;
    v24[4] = v22;
    v24[5] = v21;
    sub_23CA25268();
    return (id)sub_23CA46D60();
  }
  else
  {

    swift_release();
    if (qword_268BC2D20 != -1) {
      swift_once();
    }
    return (id)qword_268BC5530;
  }
}

id sub_23CA24EB4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AddSecureElementPassViewControllerWrapper.Coordinator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AddSecureElementPassViewControllerWrapper.Coordinator()
{
  return self;
}

uint64_t sub_23CA24F24()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = type metadata accessor for AddPassToWalletButton_iOS();
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(v2 - 8) + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = *(void *)(*(void *)(v2 - 8) + 64);
  sub_23CA250DC(*(void **)(v0 + v4), *(void *)(v0 + v4 + 8), *(void *)(v0 + v4 + 16), *(void *)(v0 + v4 + 24), *(void *)(v0 + v4 + 32), *(unsigned char *)(v0 + v4 + 40));
  uint64_t v6 = v0 + v4 + *(int *)(v2 + 36);
  uint64_t v7 = *(void *)(v1 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v6, 1, v1)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v1);
  }
  sub_23CA25180(*(void *)(v0 + v4 + *(int *)(v2 + 40)), *(unsigned char *)(v0 + v4 + *(int *)(v2 + 40) + 8));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, ((v5 + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16, v3 | 7);
}

void *sub_23CA250DC(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  switch(a6)
  {
    case 0:
      goto LABEL_5;
    case 1:
      swift_bridgeObjectRelease();
      goto LABEL_5;
    case 2:

      goto LABEL_5;
    case 3:

      swift_release();
LABEL_5:
      uint64_t result = (void *)swift_release();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_23CA25180(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t sub_23CA2518C(uint64_t a1, char a2)
{
  uint64_t v4 = a2 & 1;
  uint64_t v5 = *(void *)(type metadata accessor for AddPassToWalletButton_iOS() - 8);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v2
                                                  + ((*(void *)(v5 + 64)
                                                    + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
                                                    + 7) & 0xFFFFFFFFFFFFFFF8));
  sub_23CA258D0();
  return v6(a1, v4);
}

uint64_t sub_23CA25258(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

unint64_t sub_23CA25268()
{
  unint64_t result = qword_268BC2E60;
  if (!qword_268BC2E60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC2E60);
  }
  return result;
}

id sub_23CA252BC()
{
  return *(id *)(v0 + 24);
}

id sub_23CA252CC@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void **)(v1 + 32);
  *a1 = v2;
  return v2;
}

uint64_t sub_23CA252D8()
{
  return sub_23CA46B80();
}

uint64_t sub_23CA25314(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_23CA257AC();

  return MEMORY[0x270F02710](a1, a2, a3, v6);
}

uint64_t sub_23CA25378(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_23CA257AC();

  return MEMORY[0x270F026D8](a1, a2, a3, v6);
}

void sub_23CA253DC()
{
}

uint64_t sub_23CA25404(void *a1, void *a2)
{
  uint64_t v3 = (uint64_t *)(v2
                 + OBJC_IVAR____TtCV16_PassKit_SwiftUIP33_541E15F1A3504E1B411D8ADFDBE1A4E241AddSecureElementPassViewControllerWrapper11Coordinator_completion);
  uint64_t v4 = *(void (**)(id, uint64_t))(v2
                                          + OBJC_IVAR____TtCV16_PassKit_SwiftUIP33_541E15F1A3504E1B411D8ADFDBE1A4E241AddSecureElementPassViewControllerWrapper11Coordinator_completion);
  if (v4)
  {
    if (a1)
    {
      swift_retain();
      v4(a1, 0);
      sub_23CA25258((uint64_t)v4);
    }
    else
    {
      if (a2)
      {
        swift_retain();
        id v7 = a2;
      }
      else
      {
        uint64_t v8 = qword_268BC2D20;
        swift_retain();
        if (v8 != -1) {
          swift_once();
        }
        id v7 = (id)qword_268BC5530;
      }
      id v9 = a2;
      v4(v7, 1);
      sub_23CA25258((uint64_t)v4);
    }
  }
  uint64_t v10 = *v3;
  *uint64_t v3 = 0;
  v3[1] = 0;

  return sub_23CA25258(v10);
}

unint64_t sub_23CA2551C()
{
  unint64_t result = qword_268BC2E68;
  if (!qword_268BC2E68)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268BC2E68);
  }
  return result;
}

void sub_23CA2555C(id a1, char a2)
{
  if (a2) {

  }
  else {
    swift_bridgeObjectRelease();
  }
}

void destroy for AddSecureElementPassViewControllerWrapper(uint64_t a1)
{
  swift_release();
  uint64_t v2 = *(void **)(a1 + 32);
}

uint64_t initializeWithCopy for AddSecureElementPassViewControllerWrapper(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  *(_OWORD *)a1 = *a2;
  uint64_t v4 = (void *)*((void *)a2 + 3);
  *(void *)(a1 + 16) = *((void *)a2 + 2);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = (void *)*((void *)a2 + 4);
  *(void *)(a1 + 32) = v5;
  id v6 = (id)v3;
  swift_retain();
  id v7 = v4;
  id v8 = v5;
  return a1;
}

uint64_t assignWithCopy for AddSecureElementPassViewControllerWrapper(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  uint64_t v7 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v7;
  swift_retain();
  swift_release();
  id v8 = *(void **)(a2 + 24);
  id v9 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v8;
  id v10 = v8;

  uint64_t v11 = *(void **)(a2 + 32);
  uint64_t v12 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = v11;
  id v13 = v11;

  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for AddSecureElementPassViewControllerWrapper(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  uint64_t v4 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);

  uint64_t v5 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);

  return a1;
}

uint64_t getEnumTagSinglePayload for AddSecureElementPassViewControllerWrapper(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AddSecureElementPassViewControllerWrapper(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AddSecureElementPassViewControllerWrapper()
{
  return &type metadata for AddSecureElementPassViewControllerWrapper;
}

unint64_t sub_23CA257AC()
{
  unint64_t result = qword_268BC2E70;
  if (!qword_268BC2E70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC2E70);
  }
  return result;
}

uint64_t sub_23CA25808()
{
  type metadata accessor for PayWithApplePayButton.Configuration();
  sub_23CA46CF0();
  sub_23CA46CC0();
  return v1;
}

uint64_t sub_23CA25878()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3008);
  sub_23CA46CC0();
  return v1;
}

uint64_t sub_23CA258D0()
{
  return sub_23CA46CD0();
}

uint64_t sub_23CA2592C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 48);
  uint64_t v5 = *(void *)v4;
  char v6 = *(unsigned char *)(v4 + 8);
  sub_23CA279F8(*(void *)v4, v6);
  sub_23CA3C1AC(v5, v6, a2);

  return sub_23CA25180(v5, v6);
}

uint64_t sub_23CA25998(uint64_t a1)
{
  uint64_t v2 = v1 + *(int *)(a1 + 52);
  uint64_t v3 = *(void *)v2;
  char v4 = *(unsigned char *)(v2 + 8);
  sub_23CA27A04(*(void *)v2, v4);
  uint64_t v5 = sub_23CA3C1F0(v3, v4);
  sub_23CA2713C(v3, v4);
  return v5;
}

uint64_t sub_23CA259F8(uint64_t a1)
{
  uint64_t v2 = v1 + *(int *)(a1 + 56);
  uint64_t v3 = *(void *)v2;
  char v4 = *(unsigned char *)(v2 + 8);
  sub_23CA27A04(*(void *)v2, v4);
  uint64_t v5 = sub_23CA3C1FC(v3, v4);
  sub_23CA2713C(v3, v4);
  return v5;
}

uint64_t sub_23CA25A58(uint64_t a1)
{
  uint64_t v2 = v1 + *(int *)(a1 + 60);
  uint64_t v3 = *(void *)v2;
  char v4 = *(unsigned char *)(v2 + 8);
  sub_23CA27A04(*(void *)v2, v4);
  uint64_t v5 = sub_23CA3C400(v3, v4);
  sub_23CA2713C(v3, v4);
  return v5;
}

uint64_t sub_23CA25AB8(uint64_t a1)
{
  uint64_t v2 = v1 + *(int *)(a1 + 64);
  uint64_t v3 = *(void *)v2;
  char v4 = *(unsigned char *)(v2 + 8);
  sub_23CA27A04(*(void *)v2, v4);
  uint64_t v5 = sub_23CA3C40C(v3, v4);
  sub_23CA2713C(v3, v4);
  return v5;
}

uint64_t PayWithApplePayButton.init(_:action:fallback:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(uint64_t)@<X3>, uint64_t a5@<X5>, void *a6@<X8>)
{
  sub_23CA46F30();
  MEMORY[0x270FA5388]();
  id v13 = (char *)&v16 - v12;
  uint64_t v17 = *a1;
  uint64_t v14 = swift_retain();
  a4(v14);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(a5 - 8) + 56))(v13, 0, 1, a5);
  sub_23CA25DA4(&v17, a2, a3, 0, (uint64_t)v13, a6);
  return swift_release();
}

id sub_23CA25C40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, char a5@<W4>, uint64_t a6@<X8>)
{
  sub_23CA46CB0();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v10 = swift_getKeyPath();
  uint64_t v11 = swift_getKeyPath();
  uint64_t v12 = swift_getKeyPath();
  uint64_t v13 = swift_getKeyPath();
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
  *(void *)a6 = a1;
  *(unsigned char *)(a6 + 8) = a5 & 1;
  *(void *)(a6 + 16) = a2;
  *(void *)(a6 + 24) = a3;
  *(unsigned char *)(a6 + 32) = a4 & 1;
  *(void *)(a6 + 40) = 0;
  *(unsigned char *)(a6 + 48) = v18;
  *(void *)(a6 + 56) = v19;
  *(void *)(a6 + 64) = KeyPath;
  *(unsigned char *)(a6 + 72) = 0;
  *(void *)(a6 + 80) = v10;
  *(unsigned char *)(a6 + 88) = 0;
  *(void *)(a6 + 96) = v11;
  *(unsigned char *)(a6 + 104) = 0;
  *(void *)(a6 + 112) = v12;
  *(unsigned char *)(a6 + 120) = 0;
  *(void *)(a6 + 128) = v13;
  *(unsigned char *)(a6 + 136) = 0;
  *(void *)(a6 + 144) = result;
  return result;
}

uint64_t sub_23CA25DA4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  uint64_t v10 = *a1;
  uint64_t v11 = (int *)type metadata accessor for PayWithApplePayButton();
  uint64_t v12 = (char *)a6 + v11[11];
  LOBYTE(v29[0]) = 1;
  sub_23CA46CB0();
  uint64_t v13 = *((void *)&v31 + 1);
  *uint64_t v12 = v31;
  *((void *)v12 + 1) = v13;
  uint64_t v14 = (char *)a6 + v11[12];
  *(void *)uint64_t v14 = swift_getKeyPath();
  v14[8] = 0;
  uint64_t v15 = (char *)a6 + v11[13];
  *(void *)uint64_t v15 = swift_getKeyPath();
  v15[8] = 0;
  uint64_t v16 = (char *)a6 + v11[14];
  *(void *)uint64_t v16 = swift_getKeyPath();
  v16[8] = 0;
  uint64_t v17 = (char *)a6 + v11[15];
  *(void *)uint64_t v17 = swift_getKeyPath();
  v17[8] = 0;
  char v18 = (char *)a6 + v11[16];
  *(void *)char v18 = swift_getKeyPath();
  v18[8] = 0;
  *a6 = v10;
  uint64_t v19 = (char *)a6 + v11[9];
  uint64_t v20 = sub_23CA46F30();
  uint64_t v21 = *(void *)(v20 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v19, a5, v20);
  v29[0] = a2;
  v29[1] = a3;
  char v30 = a4 & 1;
  uint64_t v22 = type metadata accessor for PayWithApplePayButton.Configuration();
  *(void *)((char *)&v31 + *(int *)(sub_23CA46CF0() + 28)) = 0;
  (*(void (**)(long long *, void *, uint64_t))(*(void *)(v22 - 8) + 32))(&v31, v29, v22);
  char v23 = v32;
  uint64_t v24 = v33;
  objc_super v25 = (char *)a6 + v11[10];
  *(_OWORD *)objc_super v25 = v31;
  v25[16] = v23;
  *((void *)v25 + 3) = v24;
  id v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v21 + 8))(a5, v20);
  *(void *)((char *)a6 + v11[17]) = v26;
  return result;
}

uint64_t PayWithApplePayButton.body.getter@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v3 = v2;
  v42 = a2;
  uint64_t v5 = sub_23CA46EB0();
  uint64_t v40 = *(void *)(v5 - 8);
  uint64_t v41 = v5;
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  v39 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = *(void *)(a1 - 8);
  uint64_t v38 = *(void *)(v34 + 64);
  MEMORY[0x270FA5388](v6);
  v36 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC2EE0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC2EE8);
  uint64_t v32 = *(void *)(a1 + 16);
  uint64_t v9 = v32;
  sub_23CA46F30();
  sub_23CA46B40();
  swift_getTupleTypeMetadata2();
  sub_23CA46D80();
  swift_getWitnessTable();
  uint64_t v10 = sub_23CA46D50();
  uint64_t v37 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v31 - v11;
  sub_23CA46990();
  uint64_t v13 = sub_23CA469C0();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v33 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  v35 = (char *)&v31 - v17;
  uint64_t v18 = *(void *)(a1 + 24);
  uint64_t v43 = v9;
  uint64_t v44 = v18;
  uint64_t v45 = v3;
  sub_23CA46D70();
  sub_23CA46D40();
  uint64_t v19 = v34;
  uint64_t v20 = v36;
  (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v36, v3, a1);
  unint64_t v21 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v32;
  *(void *)(v22 + 24) = v18;
  (*(void (**)(unint64_t, char *, uint64_t))(v19 + 32))(v22 + v21, v20, a1);
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v24 = v39;
  sub_23CA46E90();
  objc_super v25 = v33;
  sub_23CA46C50();
  swift_release();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v24, v41);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v12, v10);
  unint64_t v26 = sub_23CA274B4();
  uint64_t v46 = WitnessTable;
  unint64_t v47 = v26;
  swift_getWitnessTable();
  v27 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  v28 = v35;
  v27(v35, v25, v13);
  v29 = *(void (**)(char *, uint64_t))(v14 + 8);
  v29(v25, v13);
  v27(v42, v28, v13);
  return ((uint64_t (*)(char *, uint64_t))v29)(v28, v13);
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

void sub_23CA26534(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v40 = a3;
  uint64_t v5 = sub_23CA46F30();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v9 = (char *)v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v30 - v10;
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC2EE8);
  uint64_t v12 = sub_23CA46B40();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v39 = (char *)v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)v30 - v16;
  uint64_t v41 = a2;
  uint64_t v18 = type metadata accessor for PayWithApplePayButton();
  id v38 = *(id *)(a1 + *(int *)(v18 + 68));
  sub_23CA46D70();
  sub_23CA46980();
  v36 = (void *)v55[3];
  int v35 = v56;
  uint64_t v34 = v57;
  int v33 = v58;
  uint64_t v32 = v59;
  uint64_t v31 = v60;
  if (sub_23CA25878())
  {
    sub_23CA26A60(v18, (uint64_t)v49);
    sub_23CA28FAC();
    uint64_t v42 = v41;
    swift_getWitnessTable();
    sub_23CA294B4((uint64_t)v49, v37);
    sub_23CA29144();
  }
  else
  {
    uint64_t v19 = a1 + *(int *)(v18 + 36);
    v55[2] = v41;
    v30[1] = swift_getWitnessTable();
    uint64_t v20 = v17;
    uint64_t v21 = v6;
    uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
    v22(v11, v19, v5);
    v22(v9, (uint64_t)v11, v5);
    sub_23CA28FAC();
    sub_23CA295AC((uint64_t)v9, v37, v5);
    char v23 = *(void (**)(char *, uint64_t))(v21 + 8);
    v23(v9, v5);
    v23(v11, v5);
    uint64_t v17 = v20;
  }
  uint64_t v24 = v38;
  v49[0] = v38;
  v49[1] = v36;
  LOBYTE(v50) = v35;
  uint64_t v51 = v34;
  char v52 = v33;
  uint64_t v53 = v32;
  uint64_t v54 = v31;
  v55[0] = (uint64_t)v49;
  uint64_t v25 = (uint64_t)v39;
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v39, v17, v12);
  v55[1] = v25;
  id v26 = v24;
  v48[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC2EE0);
  v48[1] = v12;
  unint64_t v46 = sub_23CA29074();
  unint64_t v27 = sub_23CA28FAC();
  uint64_t v45 = v41;
  uint64_t WitnessTable = swift_getWitnessTable();
  unint64_t v43 = v27;
  uint64_t v44 = WitnessTable;
  uint64_t v47 = swift_getWitnessTable();
  sub_23CA26C60(v55, 2uLL, (uint64_t)v48);
  v29 = *(void (**)(char *, uint64_t))(v13 + 8);
  v29(v17, v12);

  v29((char *)v25, v12);
}

void sub_23CA26A50(uint64_t a1@<X8>)
{
  sub_23CA26534(*(void *)(v1 + 32), *(void *)(v1 + 24), a1);
}

double sub_23CA26A60@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(a1 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388]();
  uint64_t v8 = sub_23CA25808();
  uint64_t v9 = *v2;
  if (v10)
  {
    sub_23CA2592C(a1, v24);
    uint64_t v12 = *(void *)&v24[0];
    (*(void (**)(char *, uint64_t *, uint64_t))(v5 + 16))((char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v2, a1);
    unint64_t v13 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = *(_OWORD *)(a1 + 16);
    (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v14 + v13, (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
    *(void *)(v14 + ((v6 + v13 + 7) & 0xFFFFFFFFFFFFFFF8)) = v8;
    uint64_t v19 = v9;
    uint64_t v20 = v12;
    uint64_t v21 = sub_23CA29334;
    uint64_t v22 = v14;
    char v23 = 1;
  }
  else
  {
    uint64_t v11 = v7;
    sub_23CA2592C(a1, &v20);
    uint64_t v19 = v9;
    uint64_t v21 = (void (*)())v8;
    uint64_t v22 = v11;
    char v23 = 0;
  }
  sub_23CA29020();
  sub_23CA46B30();
  double result = *(double *)v24;
  long long v16 = v24[1];
  char v17 = v25;
  *(_OWORD *)a2 = v24[0];
  *(_OWORD *)(a2 + 16) = v16;
  *(unsigned char *)(a2 + 32) = v17;
  return result;
}

uint64_t sub_23CA26C28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, a1, a2);
}

uint64_t sub_23CA26C60(uint64_t *a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5 = (uint64_t *)(a3 & 0xFFFFFFFFFFFFFFFELL);
  if (a2 == 1)
  {
    uint64_t TupleTypeMetadata = *v5;
  }
  else
  {
    MEMORY[0x270FA5388]();
    uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (a2)
    {
      unint64_t v9 = 0;
      if (a2 < 4) {
        goto LABEL_9;
      }
      if ((unint64_t)(v8 - (char *)v5) < 0x20) {
        goto LABEL_9;
      }
      unint64_t v9 = a2 & 0xFFFFFFFFFFFFFFFCLL;
      char v10 = (long long *)(v5 + 2);
      uint64_t v11 = v8 + 16;
      unint64_t v12 = a2 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        long long v13 = *v10;
        *(v11 - 1) = *(v10 - 1);
        *uint64_t v11 = v13;
        v10 += 2;
        v11 += 2;
        v12 -= 4;
      }
      while (v12);
      if (v9 != a2)
      {
LABEL_9:
        unint64_t v14 = a2 - v9;
        uint64_t v15 = v9;
        long long v16 = &v8[8 * v9];
        char v17 = &v5[v15];
        do
        {
          uint64_t v18 = *v17++;
          *(void *)long long v16 = v18;
          v16 += 8;
          --v14;
        }
        while (v14);
      }
    }
    uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
  }
  MEMORY[0x270FA5388]();
  uint64_t v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    uint64_t v21 = (int *)(TupleTypeMetadata + 32);
    unint64_t v22 = a2;
    do
    {
      if (a2 == 1) {
        int v23 = 0;
      }
      else {
        int v23 = *v21;
      }
      uint64_t v25 = *v5++;
      uint64_t v24 = v25;
      uint64_t v26 = *a1++;
      (*(void (**)(char *, uint64_t))(*(void *)(v24 - 8) + 16))(&v20[v23], v26);
      v21 += 4;
      --v22;
    }
    while (v22);
  }
  return sub_23CA46D90();
}

uint64_t sub_23CA26E24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_23CA46E80();
  v3[5] = sub_23CA46E70();
  uint64_t v5 = sub_23CA46E60();
  return MEMORY[0x270FA2498](sub_23CA26EC0, v5, v4);
}

uint64_t sub_23CA26EC0()
{
  swift_release();
  uint64_t v1 = type metadata accessor for PayWithApplePayButton();
  sub_23CA27324(v1);
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_23CA26F40()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = (int *)type metadata accessor for PayWithApplePayButton();
  uint64_t v3 = *(unsigned __int8 *)(*((void *)v2 - 1) + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = *(void *)(*((void *)v2 - 1) + 64);
  uint64_t v6 = v0 + v4;
  uint64_t v7 = v0 + v4 + v2[9];
  uint64_t v8 = *(void *)(v1 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v7, 1, v1)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v1);
  }
  sub_23CA2712C(*(void **)(v6 + v2[10]), *(void *)(v6 + v2[10] + 8), *(unsigned char *)(v6 + v2[10] + 16));
  swift_release();
  swift_release();
  sub_23CA25180(*(void *)(v6 + v2[12]), *(unsigned char *)(v6 + v2[12] + 8));
  sub_23CA2713C(*(void *)(v6 + v2[13]), *(unsigned char *)(v6 + v2[13] + 8));
  sub_23CA2713C(*(void *)(v6 + v2[14]), *(unsigned char *)(v6 + v2[14] + 8));
  sub_23CA2713C(*(void *)(v6 + v2[15]), *(unsigned char *)(v6 + v2[15] + 8));
  sub_23CA2713C(*(void *)(v6 + v2[16]), *(unsigned char *)(v6 + v2[16] + 8));

  return MEMORY[0x270FA0238](v0, v4 + v5, v3 | 7);
}

uint64_t type metadata accessor for PayWithApplePayButton()
{
  return __swift_instantiateGenericMetadata();
}

void sub_23CA2712C(void *a1, uint64_t a2, char a3)
{
  if (a3) {

  }
  else {
    swift_release();
  }
}

uint64_t sub_23CA2713C(uint64_t a1, char a2)
{
  if (a2) {
    return swift_bridgeObjectRelease();
  }
  else {
    return swift_release();
  }
}

uint64_t sub_23CA27148()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = *(void *)(type metadata accessor for PayWithApplePayButton() - 8);
  uint64_t v5 = v0 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  void *v6 = v1;
  v6[1] = sub_23CA27230;
  return sub_23CA26E24(v5, v2, v3);
}

uint64_t sub_23CA27230()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_23CA27324(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = sub_23CA46F30();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - v6;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v14 - v6, v1 + *(int *)(a1 + 36), v4);
  LODWORD(v3) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v3 - 8) + 48))(v7, 1, v3);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (v3 != 1)
  {
    uint64_t v8 = (void *)sub_23CA25808();
    uint64_t v10 = v9;
    char v12 = v11;
    if (v11) {
      sub_23CA33E44();
    }
    sub_23CA2712C(v8, v10, v12 & 1);
  }
  return sub_23CA258D0();
}

unint64_t sub_23CA274B4()
{
  unint64_t result = qword_268BC2F00[0];
  if (!qword_268BC2F00[0])
  {
    sub_23CA46990();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268BC2F00);
  }
  return result;
}

void sub_23CA2750C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for PayWithApplePayButton();
  sub_23CA28E88(a2, v3);
  sub_23CA33B4C();
}

double PayWithApplePayButton<>.init(_:action:)@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_23CA25C40(*a1, a2, a3, 0, 1, (uint64_t)v10);
  long long v5 = v10[7];
  *(_OWORD *)(a4 + 96) = v10[6];
  *(_OWORD *)(a4 + 112) = v5;
  *(_OWORD *)(a4 + 128) = v10[8];
  *(void *)(a4 + 144) = v11;
  long long v6 = v10[3];
  *(_OWORD *)(a4 + 32) = v10[2];
  *(_OWORD *)(a4 + 48) = v6;
  long long v7 = v10[5];
  *(_OWORD *)(a4 + 64) = v10[4];
  *(_OWORD *)(a4 + 80) = v7;
  double result = *(double *)v10;
  long long v9 = v10[1];
  *(_OWORD *)a4 = v10[0];
  *(_OWORD *)(a4 + 16) = v9;
  return result;
}

uint64_t sub_23CA275DC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23CA27620(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 56);
}

uint64_t sub_23CA27628()
{
  uint64_t result = sub_23CA46F30();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_23CA276FC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = v5;
  int v7 = *(_DWORD *)(v5 + 80);
  uint64_t v8 = v7;
  if (*(_DWORD *)(v5 + 84)) {
    size_t v9 = *(void *)(v5 + 64);
  }
  else {
    size_t v9 = *(void *)(v5 + 64) + 1;
  }
  size_t v10 = v9 + 7;
  unint64_t v11 = ((((((v9 + 7 + ((v7 + 8) & ~(unint64_t)v7)) & 0xFFFFFFFFFFFFFFF8)
          + 39) & 0xFFFFFFFFFFFFFFF8)
        + 103) & 0xFFFFFFFFFFFFFFF8)
      + 8;
  int v12 = v7 & 0x100000;
  if (v8 > 7 || v12 != 0 || v11 > 0x18)
  {
    uint64_t v15 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v15 + ((v8 & 0xF8 ^ 0x1F8) & (v8 + 16)));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    long long v16 = (void *)(((unint64_t)a1 + v8 + 8) & ~v8);
    char v17 = (const void *)(((unint64_t)a2 + v8 + 8) & ~v8);
    if ((*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v5 + 48))(((unint64_t)a2 + v8 + 8) & ~v8, 1, v4))
    {
      memcpy(v16, v17, v9);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(v16, v17, v4);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v16, 0, 1, v4);
    }
    unint64_t v18 = ((unint64_t)v16 + v10) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v19 = ((unint64_t)v17 + v10) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v20 = *(void **)v19;
    uint64_t v21 = *(void *)(v19 + 8);
    char v22 = *(unsigned char *)(v19 + 16);
    sub_23CA279E8(*(void **)v19, v21, v22);
    *(void *)unint64_t v18 = v20;
    *(void *)(v18 + 8) = v21;
    *(unsigned char *)(v18 + 16) = v22;
    *(void *)(v18 + 24) = *(void *)(v19 + 24);
    unint64_t v23 = (v18 + 39) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v24 = (v19 + 39) & 0xFFFFFFFFFFFFFFF8;
    *(unsigned char *)unint64_t v23 = *(unsigned char *)v24;
    *(void *)(v23 + 8) = *(void *)(v24 + 8);
    unint64_t v25 = (v23 + 23) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v26 = (v24 + 23) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v27 = *(void *)v26;
    char v28 = *(unsigned char *)(v26 + 8);
    swift_retain();
    swift_retain();
    sub_23CA279F8(v27, v28);
    *(void *)unint64_t v25 = v27;
    *(unsigned char *)(v25 + 8) = v28;
    unint64_t v29 = (v23 + 39) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v30 = (v24 + 39) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v31 = *(void *)v30;
    LOBYTE(v27) = *(unsigned char *)(v30 + 8);
    sub_23CA27A04(*(void *)v30, v27);
    *(void *)unint64_t v29 = v31;
    *(unsigned char *)(v29 + 8) = v27;
    unint64_t v32 = (v23 + 55) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v33 = (v24 + 55) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v34 = *(void *)v33;
    LOBYTE(v27) = *(unsigned char *)(v33 + 8);
    sub_23CA27A04(*(void *)v33, v27);
    *(void *)unint64_t v32 = v34;
    *(unsigned char *)(v32 + 8) = v27;
    unint64_t v35 = (v23 + 71) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v36 = (v24 + 71) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v37 = *(void *)v36;
    LOBYTE(v27) = *(unsigned char *)(v36 + 8);
    sub_23CA27A04(*(void *)v36, v27);
    *(void *)unint64_t v35 = v37;
    *(unsigned char *)(v35 + 8) = v27;
    unint64_t v38 = (v23 + 87) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v39 = (v24 + 87) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v40 = *(void *)v39;
    LOBYTE(v27) = *(unsigned char *)(v39 + 8);
    sub_23CA27A04(*(void *)v39, v27);
    *(void *)unint64_t v38 = v40;
    *(unsigned char *)(v38 + 8) = v27;
    uint64_t v41 = *(void **)((v24 + 103) & 0xFFFFFFFFFFFFFFF8);
    *(void *)((v23 + 103) & 0xFFFFFFFFFFFFFFF8) = v41;
    id v42 = v41;
  }
  return v3;
}

id sub_23CA279E8(void *a1, uint64_t a2, char a3)
{
  if (a3) {
    return a1;
  }
  else {
    return (id)swift_retain();
  }
}

uint64_t sub_23CA279F8(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_23CA27A04(uint64_t a1, char a2)
{
  if (a2) {
    return swift_bridgeObjectRetain();
  }
  else {
    return swift_retain();
  }
}

void sub_23CA27A10(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  uint64_t v3 = *(void *)(v2 - 8);
  unint64_t v4 = (a1 + *(unsigned __int8 *)(v3 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v3 + 48))(v4, 1, v2)) {
    (*(void (**)(unint64_t, uint64_t))(v3 + 8))(v4, v2);
  }
  unint64_t v5 = v4 + *(void *)(v3 + 64);
  if (!*(_DWORD *)(v3 + 84)) {
    ++v5;
  }
  unint64_t v6 = (v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_23CA2712C(*(void **)v6, *(void *)(v6 + 8), *(unsigned char *)(v6 + 16));
  swift_release();
  unint64_t v7 = (v6 + 39) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  sub_23CA25180(*(void *)((v7 + 23) & 0xFFFFFFFFFFFFFFF8), *(unsigned char *)(((v7 + 23) & 0xFFFFFFFFFFFFFFF8) + 8));
  sub_23CA2713C(*(void *)((v7 + 39) & 0xFFFFFFFFFFFFFFF8), *(unsigned char *)(((v7 + 39) & 0xFFFFFFFFFFFFFFF8) + 8));
  sub_23CA2713C(*(void *)((v7 + 55) & 0xFFFFFFFFFFFFFFF8), *(unsigned char *)(((v7 + 55) & 0xFFFFFFFFFFFFFFF8) + 8));
  sub_23CA2713C(*(void *)((v7 + 71) & 0xFFFFFFFFFFFFFFF8), *(unsigned char *)(((v7 + 71) & 0xFFFFFFFFFFFFFFF8) + 8));
  sub_23CA2713C(*(void *)((v7 + 87) & 0xFFFFFFFFFFFFFFF8), *(unsigned char *)(((v7 + 87) & 0xFFFFFFFFFFFFFFF8) + 8));
  uint64_t v8 = *(void **)((v7 + 103) & 0xFFFFFFFFFFFFFFF8);
}

void *sub_23CA27B88(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (void *)(((unint64_t)a1 + v6 + 8) & ~v6);
  uint64_t v8 = (const void *)(((unint64_t)a2 + v6 + 8) & ~v6);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(v8, 1, v4))
  {
    int v9 = *(_DWORD *)(v5 + 84);
    size_t v10 = *(void *)(v5 + 64);
    if (v9) {
      size_t v11 = v10;
    }
    else {
      size_t v11 = v10 + 1;
    }
    memcpy(v7, v8, v11);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 16))(v7, v8, v4);
    long long v13 = *(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56);
    uint64_t v12 = v5 + 56;
    v13(v7, 0, 1, v4);
    int v9 = *(_DWORD *)(v12 + 28);
    size_t v10 = *(void *)(v12 + 8);
  }
  if (v9) {
    size_t v14 = v10;
  }
  else {
    size_t v14 = v10 + 1;
  }
  unint64_t v15 = ((unint64_t)v7 + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v16 = ((unint64_t)v8 + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  char v17 = *(void **)v16;
  uint64_t v18 = *(void *)(v16 + 8);
  char v19 = *(unsigned char *)(v16 + 16);
  sub_23CA279E8(*(void **)v16, v18, v19);
  *(void *)unint64_t v15 = v17;
  *(void *)(v15 + 8) = v18;
  *(unsigned char *)(v15 + 16) = v19;
  *(void *)(v15 + 24) = *(void *)(v16 + 24);
  unint64_t v20 = (v15 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v21 = (v16 + 39) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v20 = *(unsigned char *)v21;
  *(void *)(v20 + 8) = *(void *)(v21 + 8);
  unint64_t v22 = (v20 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v23 = (v21 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v24 = *(void *)v23;
  char v25 = *(unsigned char *)(v23 + 8);
  swift_retain();
  swift_retain();
  sub_23CA279F8(v24, v25);
  *(void *)unint64_t v22 = v24;
  *(unsigned char *)(v22 + 8) = v25;
  unint64_t v26 = (v20 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v27 = (v21 + 39) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v28 = *(void *)v27;
  LOBYTE(v24) = *(unsigned char *)(v27 + 8);
  sub_23CA27A04(*(void *)v27, v24);
  *(void *)unint64_t v26 = v28;
  *(unsigned char *)(v26 + 8) = v24;
  unint64_t v29 = (v20 + 55) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v30 = (v21 + 55) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v31 = *(void *)v30;
  LOBYTE(v24) = *(unsigned char *)(v30 + 8);
  sub_23CA27A04(*(void *)v30, v24);
  *(void *)unint64_t v29 = v31;
  *(unsigned char *)(v29 + 8) = v24;
  unint64_t v32 = (v20 + 71) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v33 = (v21 + 71) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v34 = *(void *)v33;
  LOBYTE(v24) = *(unsigned char *)(v33 + 8);
  sub_23CA27A04(*(void *)v33, v24);
  *(void *)unint64_t v32 = v34;
  *(unsigned char *)(v32 + 8) = v24;
  unint64_t v35 = (v20 + 87) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v36 = (v21 + 87) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v37 = *(void *)v36;
  LOBYTE(v24) = *(unsigned char *)(v36 + 8);
  sub_23CA27A04(*(void *)v36, v24);
  *(void *)unint64_t v35 = v37;
  *(unsigned char *)(v35 + 8) = v24;
  unint64_t v38 = *(void **)((v21 + 103) & 0xFFFFFFFFFFFFFFF8);
  *(void *)((v20 + 103) & 0xFFFFFFFFFFFFFFF8) = v38;
  id v39 = v38;
  return a1;
}

void *sub_23CA27E20(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (void *)(((unint64_t)a1 + v6 + 8) & ~v6);
  uint64_t v8 = (void *)(((unint64_t)a2 + v6 + 8) & ~v6);
  int v9 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  int v10 = v9(v7, 1, v4);
  int v11 = v9(v8, 1, v4);
  if (v10)
  {
    if (!v11)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 16))(v7, v8, v4);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(v7, 0, 1, v4);
      goto LABEL_12;
    }
    int v12 = *(_DWORD *)(v5 + 84);
    size_t v13 = *(void *)(v5 + 64);
  }
  else
  {
    if (!v11)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 24))(v7, v8, v4);
      goto LABEL_12;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(v7, v4);
    int v12 = *(_DWORD *)(v5 + 84);
    size_t v13 = *(void *)(v5 + 64);
  }
  if (v12) {
    size_t v14 = v13;
  }
  else {
    size_t v14 = v13 + 1;
  }
  memcpy(v7, v8, v14);
LABEL_12:
  if (*(_DWORD *)(v5 + 84)) {
    uint64_t v15 = *(void *)(v5 + 64);
  }
  else {
    uint64_t v15 = *(void *)(v5 + 64) + 1;
  }
  unint64_t v16 = ((unint64_t)v7 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v17 = ((unint64_t)v8 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v18 = *(void **)v17;
  uint64_t v19 = *(void *)(v17 + 8);
  char v20 = *(unsigned char *)(v17 + 16);
  sub_23CA279E8(*(void **)v17, v19, v20);
  unint64_t v21 = *(void **)v16;
  uint64_t v22 = *(void *)(v16 + 8);
  char v23 = *(unsigned char *)(v16 + 16);
  *(void *)unint64_t v16 = v18;
  *(void *)(v16 + 8) = v19;
  *(unsigned char *)(v16 + 16) = v20;
  sub_23CA2712C(v21, v22, v23);
  *(void *)(v16 + 24) = *(void *)(v17 + 24);
  swift_retain();
  swift_release();
  unint64_t v24 = (v16 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v25 = (v17 + 39) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v24 = *(unsigned char *)v25;
  *(void *)(v24 + 8) = *(void *)(v25 + 8);
  swift_retain();
  swift_release();
  unint64_t v26 = (v24 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v27 = (v25 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v28 = *(void *)v27;
  LOBYTE(v19) = *(unsigned char *)(v27 + 8);
  sub_23CA279F8(*(void *)v27, v19);
  uint64_t v29 = *(void *)v26;
  char v30 = *(unsigned char *)(v26 + 8);
  *(void *)unint64_t v26 = v28;
  *(unsigned char *)(v26 + 8) = v19;
  sub_23CA25180(v29, v30);
  unint64_t v31 = (v24 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v32 = (v25 + 39) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v33 = *(void *)v32;
  LOBYTE(v19) = *(unsigned char *)(v32 + 8);
  sub_23CA27A04(*(void *)v32, v19);
  uint64_t v34 = *(void *)v31;
  char v35 = *(unsigned char *)(v31 + 8);
  *(void *)unint64_t v31 = v33;
  *(unsigned char *)(v31 + 8) = v19;
  sub_23CA2713C(v34, v35);
  unint64_t v36 = (v24 + 55) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v37 = (v25 + 55) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v38 = *(void *)v37;
  LOBYTE(v19) = *(unsigned char *)(v37 + 8);
  sub_23CA27A04(*(void *)v37, v19);
  uint64_t v39 = *(void *)v36;
  char v40 = *(unsigned char *)(v36 + 8);
  *(void *)unint64_t v36 = v38;
  *(unsigned char *)(v36 + 8) = v19;
  sub_23CA2713C(v39, v40);
  unint64_t v41 = (v24 + 71) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v42 = (v25 + 71) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v43 = *(void *)v42;
  LOBYTE(v19) = *(unsigned char *)(v42 + 8);
  sub_23CA27A04(*(void *)v42, v19);
  uint64_t v44 = *(void *)v41;
  char v45 = *(unsigned char *)(v41 + 8);
  *(void *)unint64_t v41 = v43;
  *(unsigned char *)(v41 + 8) = v19;
  sub_23CA2713C(v44, v45);
  unint64_t v46 = (v24 + 87) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v47 = (v25 + 87) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v48 = *(void *)v47;
  LOBYTE(v19) = *(unsigned char *)(v47 + 8);
  sub_23CA27A04(*(void *)v47, v19);
  uint64_t v49 = *(void *)v46;
  char v50 = *(unsigned char *)(v46 + 8);
  *(void *)unint64_t v46 = v48;
  *(unsigned char *)(v46 + 8) = v19;
  sub_23CA2713C(v49, v50);
  uint64_t v51 = (void **)((v24 + 103) & 0xFFFFFFFFFFFFFFF8);
  char v52 = *(void **)((v25 + 103) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v53 = *v51;
  *uint64_t v51 = v52;
  id v54 = v52;

  return a1;
}

void *sub_23CA28190(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (void *)(((unint64_t)a1 + v6 + 8) & ~v6);
  uint64_t v8 = (const void *)(((unint64_t)a2 + v6 + 8) & ~v6);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(v8, 1, v4))
  {
    int v9 = *(_DWORD *)(v5 + 84);
    size_t v10 = *(void *)(v5 + 64);
    if (v9) {
      size_t v11 = v10;
    }
    else {
      size_t v11 = v10 + 1;
    }
    memcpy(v7, v8, v11);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 32))(v7, v8, v4);
    size_t v13 = *(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56);
    uint64_t v12 = v5 + 56;
    v13(v7, 0, 1, v4);
    int v9 = *(_DWORD *)(v12 + 28);
    size_t v10 = *(void *)(v12 + 8);
  }
  if (v9) {
    size_t v14 = v10;
  }
  else {
    size_t v14 = v10 + 1;
  }
  uint64_t v15 = (_OWORD *)(((unint64_t)v7 + v14 + 7) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v16 = (_OWORD *)(((unint64_t)v8 + v14 + 7) & 0xFFFFFFFFFFFFFFF8);
  long long v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  uint64_t v18 = (_OWORD *)(((unint64_t)v15 + 39) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v19 = (_OWORD *)(((unint64_t)v16 + 39) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v18 = *v19;
  unint64_t v20 = ((unint64_t)v18 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v21 = ((unint64_t)v19 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v22 = *(void *)v21;
  *(unsigned char *)(v20 + 8) = *(unsigned char *)(v21 + 8);
  *(void *)unint64_t v20 = v22;
  unint64_t v23 = ((unint64_t)v18 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v24 = ((unint64_t)v19 + 39) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v25 = *(void *)v24;
  *(unsigned char *)(v23 + 8) = *(unsigned char *)(v24 + 8);
  *(void *)unint64_t v23 = v25;
  unint64_t v26 = ((unint64_t)v18 + 55) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v27 = ((unint64_t)v19 + 55) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v28 = *(void *)v27;
  *(unsigned char *)(v26 + 8) = *(unsigned char *)(v27 + 8);
  *(void *)unint64_t v26 = v28;
  unint64_t v29 = ((unint64_t)v18 + 71) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v30 = ((unint64_t)v19 + 71) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v31 = *(void *)v30;
  *(unsigned char *)(v29 + 8) = *(unsigned char *)(v30 + 8);
  *(void *)unint64_t v29 = v31;
  unint64_t v32 = ((unint64_t)v18 + 87) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v33 = ((unint64_t)v19 + 87) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v34 = *(void *)v33;
  *(unsigned char *)(v32 + 8) = *(unsigned char *)(v33 + 8);
  *(void *)unint64_t v32 = v34;
  *(void *)(((unint64_t)v18 + 103) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v19 + 103) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

void *sub_23CA283AC(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (void *)(((unint64_t)a1 + v6 + 8) & ~v6);
  uint64_t v8 = (void *)(((unint64_t)a2 + v6 + 8) & ~v6);
  int v9 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  int v10 = v9(v7, 1, v4);
  int v11 = v9(v8, 1, v4);
  if (v10)
  {
    if (!v11)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 32))(v7, v8, v4);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(v7, 0, 1, v4);
      goto LABEL_12;
    }
    int v12 = *(_DWORD *)(v5 + 84);
    size_t v13 = *(void *)(v5 + 64);
  }
  else
  {
    if (!v11)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 40))(v7, v8, v4);
      goto LABEL_12;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(v7, v4);
    int v12 = *(_DWORD *)(v5 + 84);
    size_t v13 = *(void *)(v5 + 64);
  }
  if (v12) {
    size_t v14 = v13;
  }
  else {
    size_t v14 = v13 + 1;
  }
  memcpy(v7, v8, v14);
LABEL_12:
  if (*(_DWORD *)(v5 + 84)) {
    uint64_t v15 = *(void *)(v5 + 64);
  }
  else {
    uint64_t v15 = *(void *)(v5 + 64) + 1;
  }
  unint64_t v16 = ((unint64_t)v7 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v17 = ((unint64_t)v8 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  char v18 = *(unsigned char *)(v17 + 16);
  uint64_t v19 = *(void **)v16;
  uint64_t v20 = *(void *)(v16 + 8);
  char v21 = *(unsigned char *)(v16 + 16);
  *(_OWORD *)unint64_t v16 = *(_OWORD *)v17;
  *(unsigned char *)(v16 + 16) = v18;
  sub_23CA2712C(v19, v20, v21);
  *(void *)(v16 + 24) = *(void *)(v17 + 24);
  swift_release();
  unint64_t v22 = (v16 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v23 = (v17 + 39) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v22 = *(unsigned char *)v23;
  *(void *)(v22 + 8) = *(void *)(v23 + 8);
  swift_release();
  unint64_t v24 = (v22 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v25 = (v23 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v26 = *(void *)v25;
  LOBYTE(v25) = *(unsigned char *)(v25 + 8);
  uint64_t v27 = *(void *)v24;
  char v28 = *(unsigned char *)(v24 + 8);
  *(void *)unint64_t v24 = v26;
  *(unsigned char *)(v24 + 8) = v25;
  sub_23CA25180(v27, v28);
  unint64_t v29 = (v22 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v30 = (v23 + 39) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v31 = *(void *)v30;
  LOBYTE(v30) = *(unsigned char *)(v30 + 8);
  uint64_t v32 = *(void *)v29;
  char v33 = *(unsigned char *)(v29 + 8);
  *(void *)unint64_t v29 = v31;
  *(unsigned char *)(v29 + 8) = v30;
  sub_23CA2713C(v32, v33);
  unint64_t v34 = (v22 + 55) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v35 = (v23 + 55) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v36 = *(void *)v35;
  LOBYTE(v35) = *(unsigned char *)(v35 + 8);
  uint64_t v37 = *(void *)v34;
  char v38 = *(unsigned char *)(v34 + 8);
  *(void *)unint64_t v34 = v36;
  *(unsigned char *)(v34 + 8) = v35;
  sub_23CA2713C(v37, v38);
  unint64_t v39 = (v22 + 71) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v40 = (v23 + 71) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v41 = *(void *)v40;
  LOBYTE(v40) = *(unsigned char *)(v40 + 8);
  uint64_t v42 = *(void *)v39;
  char v43 = *(unsigned char *)(v39 + 8);
  *(void *)unint64_t v39 = v41;
  *(unsigned char *)(v39 + 8) = v40;
  sub_23CA2713C(v42, v43);
  unint64_t v44 = (v22 + 87) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v45 = (v23 + 87) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v46 = *(void *)v45;
  LOBYTE(v45) = *(unsigned char *)(v45 + 8);
  uint64_t v47 = *(void *)v44;
  char v48 = *(unsigned char *)(v44 + 8);
  *(void *)unint64_t v44 = v46;
  *(unsigned char *)(v44 + 8) = v45;
  sub_23CA2713C(v47, v48);
  uint64_t v49 = (void **)((v22 + 103) & 0xFFFFFFFFFFFFFFF8);
  char v50 = *v49;
  *uint64_t v49 = *(void **)((v23 + 103) & 0xFFFFFFFFFFFFFFF8);

  return a1;
}

uint64_t sub_23CA286BC(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = v4;
  int v6 = *(_DWORD *)(v4 + 84);
  if (v6) {
    unsigned int v7 = v6 - 1;
  }
  else {
    unsigned int v7 = 0;
  }
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = v7;
  }
  uint64_t v9 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v10 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  if (!v6) {
    ++v10;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v11 = v10 + 7;
  if (v8 < a2)
  {
    unint64_t v12 = ((((((v11 + ((v9 + 8) & ~v9)) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 103) & 0xFFFFFFFFFFFFFFF8)
        + 8;
    unsigned int v13 = a2 - v8;
    uint64_t v14 = v12 & 0xFFFFFFF8;
    if ((v12 & 0xFFFFFFF8) != 0) {
      unsigned int v15 = 2;
    }
    else {
      unsigned int v15 = v13 + 1;
    }
    if (v15 >= 0x10000) {
      LODWORD(v16) = 4;
    }
    else {
      LODWORD(v16) = 2;
    }
    if (v15 < 0x100) {
      LODWORD(v16) = 1;
    }
    if (v15 >= 2) {
      uint64_t v16 = v16;
    }
    else {
      uint64_t v16 = 0;
    }
    switch(v16)
    {
      case 1:
        int v17 = *((unsigned __int8 *)a1 + v12);
        if (!v17) {
          break;
        }
        goto LABEL_27;
      case 2:
        int v17 = *(unsigned __int16 *)((char *)a1 + v12);
        if (v17) {
          goto LABEL_27;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x23CA28880);
      case 4:
        int v17 = *(_DWORD *)((char *)a1 + v12);
        if (!v17) {
          break;
        }
LABEL_27:
        int v19 = v17 - 1;
        if (v14)
        {
          int v19 = 0;
          LODWORD(v14) = *a1;
        }
        return v8 + (v14 | v19) + 1;
      default:
        break;
    }
  }
  uint64_t v20 = ((unint64_t)a1 + v9 + 8) & ~v9;
  if (v7 < 0x7FFFFFFF)
  {
    unint64_t v22 = *(void *)((((((v11 + v20) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 103) & 0xFFFFFFFFFFFFFFF8);
    if (v22 >= 0xFFFFFFFF) {
      LODWORD(v22) = -1;
    }
    return (v22 + 1);
  }
  else
  {
    unsigned int v21 = (*(uint64_t (**)(uint64_t))(v5 + 48))(v20);
    if (v21 >= 2) {
      return v21 - 1;
    }
    else {
      return 0;
    }
  }
}

void sub_23CA28894(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6 = 0;
  uint64_t v7 = *(void *)(*(void *)(a4 + 16) - 8);
  int v8 = *(_DWORD *)(v7 + 84);
  unsigned int v9 = v8 - 1;
  if (!v8) {
    unsigned int v9 = 0;
  }
  if (v9 <= 0x7FFFFFFF) {
    unsigned int v10 = 0x7FFFFFFF;
  }
  else {
    unsigned int v10 = v9;
  }
  uint64_t v11 = *(unsigned __int8 *)(v7 + 80);
  size_t v12 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  if (!v8) {
    ++v12;
  }
  size_t v13 = ((((((v12 + 7 + ((v11 + 8) & ~v11)) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 103) & 0xFFFFFFFFFFFFFFF8)
      + 8;
  if (v10 < a3)
  {
    unsigned int v14 = a3 - v10;
    if (((((((v12 + 7 + ((v11 + 8) & ~v11)) & 0xFFFFFFF8) + 39) & 0xFFFFFFF8) + 103) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      unsigned int v15 = v14 + 1;
    }
    else {
      unsigned int v15 = 2;
    }
    if (v15 >= 0x10000) {
      int v16 = 4;
    }
    else {
      int v16 = 2;
    }
    if (v15 < 0x100) {
      int v16 = 1;
    }
    if (v15 >= 2) {
      int v6 = v16;
    }
    else {
      int v6 = 0;
    }
  }
  if (a2 > v10)
  {
    if (((((((v12 + 7 + ((v11 + 8) & ~v11)) & 0xFFFFFFF8) + 39) & 0xFFFFFFF8) + 103) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      int v17 = a2 - v10;
    }
    else {
      int v17 = 1;
    }
    if (((((((v12 + 7 + ((v11 + 8) & ~v11)) & 0xFFFFFFF8) + 39) & 0xFFFFFFF8) + 103) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      int v18 = ~v10 + a2;
      bzero(a1, v13);
      *(_DWORD *)a1 = v18;
    }
    switch(v6)
    {
      case 1:
        a1[v13] = v17;
        return;
      case 2:
        *(_WORD *)&a1[v13] = v17;
        return;
      case 3:
        goto LABEL_59;
      case 4:
        *(_DWORD *)&a1[v13] = v17;
        return;
      default:
        return;
    }
  }
  switch(v6)
  {
    case 1:
      a1[v13] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_35;
    case 2:
      *(_WORD *)&a1[v13] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_35;
    case 3:
LABEL_59:
      __break(1u);
      JUMPOUT(0x23CA28B54);
    case 4:
      *(_DWORD *)&a1[v13] = 0;
      goto LABEL_34;
    default:
LABEL_34:
      if (a2)
      {
LABEL_35:
        unint64_t v19 = (unint64_t)&a1[v11 + 8] & ~v11;
        if (v9 < 0x7FFFFFFF)
        {
          if ((a2 & 0x80000000) != 0) {
            uint64_t v23 = a2 ^ 0x80000000;
          }
          else {
            uint64_t v23 = a2 - 1;
          }
          *(void *)((((((v12 + 7 + v19) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 103) & 0xFFFFFFFFFFFFFFF8) = v23;
        }
        else if (v9 >= a2)
        {
          uint64_t v24 = a2 + 1;
          unint64_t v25 = *(void (**)(unint64_t, uint64_t))(v7 + 56);
          unint64_t v26 = (unint64_t)&a1[v11 + 8] & ~v11;
          v25(v26, v24);
        }
        else
        {
          if (v12 <= 3) {
            int v20 = ~(-1 << (8 * v12));
          }
          else {
            int v20 = -1;
          }
          if (v12)
          {
            int v21 = v20 & (~v9 + a2);
            if (v12 <= 3) {
              int v22 = v12;
            }
            else {
              int v22 = 4;
            }
            bzero((void *)((unint64_t)&a1[v11 + 8] & ~v11), v12);
            switch(v22)
            {
              case 2:
                *(_WORD *)unint64_t v19 = v21;
                break;
              case 3:
                *(_WORD *)unint64_t v19 = v21;
                *(unsigned char *)(v19 + 2) = BYTE2(v21);
                break;
              case 4:
                *(_DWORD *)unint64_t v19 = v21;
                break;
              default:
                *(unsigned char *)unint64_t v19 = v21;
                break;
            }
          }
        }
      }
      return;
  }
}

uint64_t sub_23CA28B8C()
{
  return swift_getWitnessTable();
}

uint64_t sub_23CA28CB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

void sub_23CA28CC0(uint64_t a1)
{
}

uint64_t sub_23CA28CD0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_23CA279E8(*(void **)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t sub_23CA28D1C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_23CA279E8(*(void **)a2, v4, v5);
  int v6 = *(void **)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  char v8 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_23CA2712C(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t sub_23CA28D88(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  char v6 = *(unsigned char *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_23CA2712C(v4, v5, v6);
  return a1;
}

uint64_t sub_23CA28DD0(uint64_t a1, unsigned int a2)
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

uint64_t sub_23CA28E18(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_23CA28E5C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_23CA28E64(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

uint64_t type metadata accessor for PayWithApplePayButton.Configuration()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_23CA28E88(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onPaymentMethodChange) = sub_23CA25998(a2);
  swift_bridgeObjectRelease();
  *(void *)(a1 + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onShippingContactChange) = sub_23CA259F8(a2);
  swift_bridgeObjectRelease();
  *(void *)(a1 + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onShippingChange) = sub_23CA25A58(a2);
  swift_bridgeObjectRelease();
  *(void *)(a1 + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onCouponCodeChange) = sub_23CA25AB8(a2);
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(*(id *)(v2 + *(int *)(a2 + 68)), sel_window);
  *(void *)(a1 + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_activeWindow) = v5;

  return MEMORY[0x270F9A758]();
}

unint64_t sub_23CA28FAC()
{
  unint64_t result = qword_268BC3010;
  if (!qword_268BC3010)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC2EE8);
    sub_23CA29020();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC3010);
  }
  return result;
}

unint64_t sub_23CA29020()
{
  unint64_t result = qword_268BC3018;
  if (!qword_268BC3018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC3018);
  }
  return result;
}

unint64_t sub_23CA29074()
{
  unint64_t result = qword_268BC3020;
  if (!qword_268BC3020)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC2EE0);
    sub_23CA290F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC3020);
  }
  return result;
}

unint64_t sub_23CA290F0()
{
  unint64_t result = qword_268BC3028[0];
  if (!qword_268BC3028[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268BC3028);
  }
  return result;
}

uint64_t sub_23CA29144()
{
  return swift_release();
}

uint64_t sub_23CA2914C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = (int *)type metadata accessor for PayWithApplePayButton();
  uint64_t v3 = *(unsigned __int8 *)(*((void *)v2 - 1) + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = *(void *)(*((void *)v2 - 1) + 64);
  uint64_t v6 = v0 + v4;
  uint64_t v7 = v0 + v4 + v2[9];
  uint64_t v8 = *(void *)(v1 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v7, 1, v1)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v1);
  }
  unint64_t v9 = (v5 + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_23CA2712C(*(void **)(v6 + v2[10]), *(void *)(v6 + v2[10] + 8), *(unsigned char *)(v6 + v2[10] + 16));
  swift_release();
  swift_release();
  sub_23CA25180(*(void *)(v6 + v2[12]), *(unsigned char *)(v6 + v2[12] + 8));
  sub_23CA2713C(*(void *)(v6 + v2[13]), *(unsigned char *)(v6 + v2[13] + 8));
  sub_23CA2713C(*(void *)(v6 + v2[14]), *(unsigned char *)(v6 + v2[14] + 8));
  sub_23CA2713C(*(void *)(v6 + v2[15]), *(unsigned char *)(v6 + v2[15] + 8));
  sub_23CA2713C(*(void *)(v6 + v2[16]), *(unsigned char *)(v6 + v2[16] + 8));

  return MEMORY[0x270FA0238](v0, v9 + 8, v3 | 7);
}

void sub_23CA29334()
{
  uint64_t v1 = *(void *)(type metadata accessor for PayWithApplePayButton() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));

  sub_23CA2750C(v0 + v2, v3);
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_23CA29414@<X0>(long long *a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  sub_23CA298EC(a1, a3);
  uint64_t v5 = (char *)a3 + *(int *)(type metadata accessor for AddPassToWalletButton() + 36);
  uint64_t v6 = sub_23CA46F30();
  uint64_t v7 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);

  return v7(v5, a2, v6);
}

uint64_t sub_23CA294B4(uint64_t a1, uint64_t a2)
{
  sub_23CA46B20();
  MEMORY[0x270FA5388]();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))((char *)&v6 - v4, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_23CA46B30();
}

uint64_t sub_23CA295AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23CA46B20();
  MEMORY[0x270FA5388]();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))((char *)&v7 - v5, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_23CA46B30();
}

uint64_t AddPassToWalletButton.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v18 = a2;
  uint64_t v17 = sub_23CA46F30();
  uint64_t v5 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v7 = (char *)&v17 - v6;
  uint64_t v8 = type metadata accessor for AddPassToWalletButton_iOS();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  size_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  unsigned int v14 = (char *)&v17 - v13;
  sub_23CA298EC(v3, v19);
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, (char *)v3 + *(int *)(a1 + 36), v17);
  sub_23CA29A90((uint64_t)v19);
  sub_23CA29904(v19, (uint64_t)v7, v12);
  swift_getWitnessTable();
  sub_23CA26A5C((uint64_t)v12, v8, (uint64_t)v14);
  unsigned int v15 = *(uint64_t (**)(char *, uint64_t))(v9 + 8);
  v15(v12, v8);
  sub_23CA26A5C((uint64_t)v14, v8, v18);
  return v15(v14, v8);
}

uint64_t type metadata accessor for AddPassToWalletButton_iOS()
{
  return __swift_instantiateGenericMetadata();
}

_OWORD *sub_23CA298EC(long long *a1, _OWORD *a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(_OWORD *)((char *)a2 + 25) = *(long long *)((char *)a1 + 25);
  *a2 = v2;
  a2[1] = v3;
  return a2;
}

uint64_t sub_23CA29904@<X0>(long long *a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v6 = (int *)type metadata accessor for AddPassToWalletButton_iOS();
  uint64_t v7 = (char *)a3 + v6[10];
  *(void *)uint64_t v7 = swift_getKeyPath();
  v7[8] = 0;
  uint64_t v8 = (char *)a3 + v6[11];
  sub_23CA46CB0();
  *uint64_t v8 = v15;
  *((void *)v8 + 1) = v16;
  uint64_t v9 = (char *)a3 + v6[12];
  sub_23CA46CB0();
  *uint64_t v9 = v15;
  *((void *)v9 + 1) = v16;
  uint64_t v10 = (char *)a3 + v6[13];
  sub_23CA46CB0();
  char *v10 = v15;
  *((void *)v10 + 1) = v16;
  uint64_t v11 = (char *)a3 + v6[14];
  sub_23CA46CB0();
  *uint64_t v11 = v15;
  *((void *)v11 + 1) = v16;
  sub_23CA298EC(a1, a3);
  size_t v12 = (char *)a3 + v6[9];
  uint64_t v13 = sub_23CA46F30();
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 32))(v12, a2, v13);
}

uint64_t sub_23CA29A90(uint64_t a1)
{
  return a1;
}

void *sub_23CA29AC8(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  switch(a6)
  {
    case 0:
      goto LABEL_5;
    case 1:
      swift_bridgeObjectRetain();
      goto LABEL_5;
    case 2:
      id v7 = result;
      goto LABEL_5;
    case 3:
      id v8 = result;
      swift_retain();
LABEL_5:
      unint64_t result = (void *)swift_retain();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_23CA29B70()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3008);
  sub_23CA46CE0();
  return v1;
}

uint64_t sub_23CA29BCC()
{
  return sub_23CA46CD0();
}

uint64_t sub_23CA29C28()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3008);
  sub_23CA46CE0();
  return v1;
}

uint64_t sub_23CA29C84()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3008);
  sub_23CA46CC0();
  return v1;
}

uint64_t sub_23CA29CDC()
{
  return sub_23CA46CD0();
}

uint64_t sub_23CA29D38()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3008);
  sub_23CA46CC0();
  return v1;
}

uint64_t sub_23CA29D90()
{
  return sub_23CA46CD0();
}

uint64_t sub_23CA29DEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v42 = a2;
  uint64_t v4 = sub_23CA46EB0();
  uint64_t v40 = *(void *)(v4 - 8);
  uint64_t v41 = v4;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  unint64_t v39 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(a1 - 8);
  uint64_t v35 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v5);
  unint64_t v34 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC3130);
  uint64_t v32 = *(void *)(a1 + 16);
  uint64_t v9 = v32;
  sub_23CA46F30();
  sub_23CA46B40();
  uint64_t v10 = sub_23CA46CA0();
  uint64_t v37 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v31 = (char *)&v31 - v11;
  sub_23CA46990();
  uint64_t v12 = sub_23CA469C0();
  uint64_t v38 = *(void *)(v12 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  char v33 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v36 = (uint64_t)&v31 - v15;
  uint64_t v16 = *(void *)(a1 + 24);
  uint64_t v43 = v9;
  uint64_t v44 = v16;
  uint64_t v45 = v2;
  unint64_t v17 = sub_23CA2E0F4();
  uint64_t v51 = v16;
  uint64_t WitnessTable = swift_getWitnessTable();
  unint64_t v49 = v17;
  uint64_t v50 = WitnessTable;
  uint64_t v19 = swift_getWitnessTable();
  sub_23CA46C90();
  int v20 = v34;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v34, v2, a1);
  unint64_t v21 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v32;
  *(void *)(v22 + 24) = v16;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v22 + v21, v20, a1);
  uint64_t v48 = v19;
  uint64_t v23 = swift_getWitnessTable();
  uint64_t v24 = v39;
  sub_23CA274B0();
  uint64_t v25 = (uint64_t)v33;
  unint64_t v26 = v31;
  sub_23CA46C50();
  swift_release();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v24, v41);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v26, v10);
  unint64_t v27 = sub_23CA274B4();
  uint64_t v46 = v23;
  unint64_t v47 = v27;
  swift_getWitnessTable();
  uint64_t v28 = v36;
  sub_23CA26A5C(v25, v12, v36);
  unint64_t v29 = *(void (**)(uint64_t, uint64_t))(v38 + 8);
  v29(v25, v12);
  sub_23CA26A5C(v28, v12, v42);
  return ((uint64_t (*)(uint64_t, uint64_t))v29)(v28, v12);
}

uint64_t sub_23CA2A2C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v82 = a4;
  uint64_t v7 = sub_23CA46F30();
  uint64_t v78 = *(void *)(v7 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  v77 = (char *)&v66 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  v76 = (uint64_t *)((char *)&v66 - v10);
  uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3158);
  MEMORY[0x270FA5388](v74);
  uint64_t v70 = (uint64_t)&v66 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC31C8);
  uint64_t v72 = *(void *)(v79 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v79);
  v69 = (char *)&v66 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  v71 = (char *)&v66 - v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC31D0);
  MEMORY[0x270FA5388](v15);
  unint64_t v17 = (char *)&v66 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = a2;
  uint64_t v83 = a3;
  uint64_t v18 = type metadata accessor for AddPassToWalletButton_iOS();
  uint64_t v73 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  int v20 = (char *)&v66 - v19;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3130);
  MEMORY[0x270FA5388](v21);
  uint64_t v23 = (char *)&v66 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_23CA46B40();
  uint64_t v80 = *(void *)(v24 - 8);
  uint64_t v81 = v24;
  MEMORY[0x270FA5388](v24);
  unint64_t v26 = (char *)&v66 - v25;
  if (sub_23CA29C84())
  {
    uint64_t v68 = v15;
    v76 = v17;
    v77 = v23;
    uint64_t v78 = v21;
    uint64_t v66 = v7;
    v67 = v26;
    char v27 = sub_23CA29D38();
    uint64_t v29 = v74;
    uint64_t v28 = v75;
    uint64_t v30 = v73;
    uint64_t v31 = v20;
    if (v27)
    {
      uint64_t v32 = a1 + *(int *)(v18 + 40);
      uint64_t v33 = v74;
      uint64_t v34 = *(void *)v32;
      char v35 = *(unsigned char *)(v32 + 8);
      sub_23CA279F8(*(void *)v32, v35);
      sub_23CA3C418(v34, v35, &v85);
      sub_23CA25180(v34, v35);
      uint64_t v36 = v85;
      (*(void (**)(char *, uint64_t, uint64_t))(v30 + 16))(v31, a1, v18);
      unint64_t v37 = (*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
      uint64_t v38 = swift_allocObject();
      uint64_t v39 = v83;
      *(void *)(v38 + 16) = v28;
      *(void *)(v38 + 24) = v39;
      (*(void (**)(unint64_t, char *, uint64_t))(v30 + 32))(v38 + v37, v31, v18);
      uint64_t v40 = v76;
      void *v76 = v36;
      v40[1] = nullsub_1;
      v40[2] = 0;
      v40[3] = sub_23CA2E744;
      v40[4] = v38;
      v40[5] = 0;
      v40[6] = 0;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3148);
      sub_23CA2E1C0();
      unint64_t v41 = sub_23CA2E290();
      uint64_t v85 = v33;
      uint64_t v86 = MEMORY[0x263F8D4F8];
      unint64_t v87 = v41;
      uint64_t v88 = MEMORY[0x263F8D510];
      swift_getOpaqueTypeConformance2();
      uint64_t v42 = (uint64_t)v77;
      sub_23CA46B30();
    }
    else
    {
      uint64_t v47 = v70;
      sub_23CA2ABA4(v18, v70);
      LOBYTE(v85) = sub_23CA25878() & 1;
      (*(void (**)(char *, uint64_t, uint64_t))(v30 + 16))(v20, a1, v18);
      unint64_t v48 = (*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
      uint64_t v49 = swift_allocObject();
      uint64_t v39 = v83;
      *(void *)(v49 + 16) = v28;
      *(void *)(v49 + 24) = v39;
      (*(void (**)(unint64_t, char *, uint64_t))(v30 + 32))(v49 + v48, v20, v18);
      unint64_t v50 = sub_23CA2E290();
      uint64_t v51 = MEMORY[0x263F8D4F8];
      char v52 = v69;
      sub_23CA46C80();
      swift_release();
      sub_23CA2EA7C(v47, &qword_268BC3158);
      uint64_t v53 = v72;
      uint64_t v54 = v29;
      v55 = v71;
      unsigned __int8 v56 = v52;
      uint64_t v57 = v54;
      uint64_t v58 = v79;
      (*(void (**)(char *, char *, uint64_t))(v72 + 32))(v71, v56, v79);
      (*(void (**)(void *, char *, uint64_t))(v53 + 16))(v76, v55, v58);
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3148);
      sub_23CA2E1C0();
      uint64_t v85 = v57;
      uint64_t v86 = v51;
      unint64_t v87 = v50;
      uint64_t v88 = MEMORY[0x263F8D510];
      swift_getOpaqueTypeConformance2();
      uint64_t v42 = (uint64_t)v77;
      sub_23CA46B30();
      (*(void (**)(char *, uint64_t))(v53 + 8))(v55, v58);
    }
    uint64_t v59 = v78;
    sub_23CA2E0F4();
    uint64_t v84 = v39;
    swift_getWitnessTable();
    unint64_t v26 = v67;
    sub_23CA294B4(v42, v59);
    sub_23CA2EA7C(v42, &qword_268BC3130);
  }
  else
  {
    uint64_t v43 = a1 + *(int *)(v18 + 36);
    uint64_t v39 = v83;
    uint64_t v92 = v83;
    swift_getWitnessTable();
    uint64_t v44 = v76;
    sub_23CA26A5C(v43, v7, (uint64_t)v76);
    uint64_t v45 = (uint64_t)v77;
    sub_23CA26A5C((uint64_t)v44, v7, (uint64_t)v77);
    sub_23CA2E0F4();
    sub_23CA295AC(v45, v21, v7);
    uint64_t v46 = *(void (**)(uint64_t, uint64_t))(v78 + 8);
    v46(v45, v7);
    v46((uint64_t)v44, v7);
  }
  uint64_t v61 = v81;
  uint64_t v60 = v82;
  uint64_t v62 = v80;
  unint64_t v63 = sub_23CA2E0F4();
  uint64_t v91 = v39;
  uint64_t WitnessTable = swift_getWitnessTable();
  unint64_t v89 = v63;
  uint64_t v90 = WitnessTable;
  swift_getWitnessTable();
  sub_23CA26A5C((uint64_t)v26, v61, v60);
  return (*(uint64_t (**)(char *, uint64_t))(v62 + 8))(v26, v61);
}

uint64_t sub_23CA2ABA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v85 = a2;
  uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC31D8);
  uint64_t v5 = MEMORY[0x270FA5388](v81);
  uint64_t v7 = (char *)v68 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(a1 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v5);
  uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3178);
  uint64_t v78 = *(void *)(v82 - 8);
  MEMORY[0x270FA5388](v82);
  uint64_t v11 = (char *)v68 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC31E0);
  uint64_t v80 = *(void *)(v83 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v83);
  v77 = (char *)v68 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v79 = (char *)v68 - v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3170);
  MEMORY[0x270FA5388](v15);
  uint64_t v84 = (char *)v68 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC31E8);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (void *)((char *)v68 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (*(unsigned char *)(v3 + 40))
  {
    uint64_t v73 = (uint64_t)v68 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v74 = v17;
    uint64_t v75 = v7;
    uint64_t v76 = v15;
    int v20 = (void *)sub_23CA2B9AC(a1);
    uint64_t v22 = v3 + *(int *)(a1 + 40);
    if (v21)
    {
      uint64_t v54 = *(void *)v22;
      char v55 = *(unsigned char *)(v22 + 8);
      sub_23CA279F8(*(void *)v22, v55);
      sub_23CA3C418(v54, v55, &v88);
      sub_23CA25180(v54, v55);
      uint64_t v56 = v88;
      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)v68 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v3, a1);
      unint64_t v57 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      uint64_t v58 = swift_allocObject();
      *(_OWORD *)(v58 + 16) = *(_OWORD *)(a1 + 16);
      (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v58 + v57, (char *)v68 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
      *(void *)(v58 + ((v9 + v57 + 7) & 0xFFFFFFFFFFFFFFF8)) = v20;
      uint64_t v59 = v75;
      *uint64_t v75 = v56;
      v59[1] = sub_23CA2E964;
      v59[2] = v58;
      swift_storeEnumTagMultiPayload();
      uint64_t v60 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC3180);
      uint64_t v61 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC3188);
      unint64_t v62 = sub_23CA2E23C();
      unint64_t v63 = sub_23CA2E47C();
      uint64_t v88 = &type metadata for AddPassButtonView;
      unint64_t v89 = (uint64_t (*)())v61;
      unint64_t v90 = v62;
      unint64_t v91 = v63;
      uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
      unint64_t v65 = sub_23CA2E51C();
      uint64_t v66 = sub_23CA2E570(&qword_268BC31B0, &qword_268BC3180);
      uint64_t v88 = (ValueMetadata *)v82;
      unint64_t v89 = (uint64_t (*)())MEMORY[0x263F8D310];
      unint64_t v90 = v60;
      unint64_t v91 = MEMORY[0x263F1A830];
      uint64_t v92 = OpaqueTypeConformance2;
      unint64_t v93 = v65;
      uint64_t v94 = v66;
      uint64_t v95 = MEMORY[0x263F1A820];
      swift_getOpaqueTypeConformance2();
      uint64_t v47 = (uint64_t)v84;
      sub_23CA46B30();
    }
    else
    {
      uint64_t v23 = *(void *)v22;
      char v24 = *(unsigned char *)(v22 + 8);
      sub_23CA279F8(*(void *)v22, v24);
      sub_23CA3C418(v23, v24, &v88);
      sub_23CA25180(v23, v24);
      uint64_t v25 = (ValueMetadata *)v88;
      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)v68 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v3, a1);
      unint64_t v26 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      uint64_t v27 = swift_allocObject();
      *(_OWORD *)(v27 + 16) = *(_OWORD *)(a1 + 16);
      (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v27 + v26, (char *)v68 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
      uint64_t v88 = v25;
      unint64_t v89 = sub_23CA2EC7C;
      unint64_t v90 = v27;
      sub_23CA29B70();
      swift_retain();
      uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3188);
      unint64_t v29 = sub_23CA2E23C();
      id v70 = (id)sub_23CA2E47C();
      unint64_t v71 = v29;
      sub_23CA46C40();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      sub_23CA29C28();
      uint64_t v72 = v30;
      int v69 = v31;
      uint64_t v32 = self;
      uint64_t v33 = (void *)sub_23CA46DD0();
      id v34 = objc_msgSend(v32, sel_localizedDeletableWalletStringFor_, v33);

      uint64_t v35 = sub_23CA46E00();
      uint64_t v37 = v36;

      v68[1] = v68;
      uint64_t v86 = v35;
      uint64_t v87 = v37;
      uint64_t v39 = MEMORY[0x270FA5388](v38);
      MEMORY[0x270FA5388](v39);
      v68[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3180);
      uint64_t v88 = &type metadata for AddPassButtonView;
      unint64_t v89 = (uint64_t (*)())v28;
      unint64_t v90 = v29;
      unint64_t v91 = (unint64_t)v70;
      uint64_t v40 = swift_getOpaqueTypeConformance2();
      unint64_t v41 = sub_23CA2E51C();
      uint64_t v67 = sub_23CA2E570(&qword_268BC31B0, &qword_268BC3180);
      id v70 = v20;
      uint64_t v42 = (ValueMetadata *)v82;
      uint64_t v43 = v77;
      sub_23CA46C60();
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      (*(void (**)(char *, ValueMetadata *))(v78 + 8))(v11, v42);
      uint64_t v45 = v79;
      uint64_t v44 = v80;
      uint64_t v46 = v83;
      (*(void (**)(char *, char *, uint64_t))(v80 + 32))(v79, v43, v83);
      (*(void (**)(void *, char *, uint64_t))(v44 + 16))(v75, v45, v46);
      swift_storeEnumTagMultiPayload();
      uint64_t v88 = v42;
      unint64_t v89 = (uint64_t (*)())MEMORY[0x263F8D310];
      unint64_t v90 = v68[0];
      unint64_t v91 = MEMORY[0x263F1A830];
      uint64_t v92 = v40;
      unint64_t v93 = v41;
      uint64_t v94 = v67;
      uint64_t v95 = MEMORY[0x263F1A820];
      swift_getOpaqueTypeConformance2();
      uint64_t v47 = (uint64_t)v84;
      sub_23CA46B30();
      sub_23CA2F1D8(v70, 0);
      (*(void (**)(char *, uint64_t))(v44 + 8))(v45, v46);
    }
    sub_23CA2EA14(v47, v73);
    swift_storeEnumTagMultiPayload();
    sub_23CA2E23C();
    sub_23CA2E30C();
    sub_23CA46B30();
    return sub_23CA2EA7C(v47, &qword_268BC3170);
  }
  else
  {
    uint64_t v48 = *(void *)(v3 + 8);
    uint64_t v49 = *(void **)v3;
    uint64_t v50 = v3 + *(int *)(a1 + 40);
    uint64_t v51 = *(void *)v50;
    char v52 = *(unsigned char *)(v50 + 8);
    sub_23CA29AC8(*(void **)v3, v48, *(void *)(v3 + 16), *(void *)(v3 + 24), *(void *)(v3 + 32), 0);
    sub_23CA279F8(v51, v52);
    sub_23CA3C418(v51, v52, &v88);
    sub_23CA25180(v51, v52);
    *uint64_t v19 = v88;
    v19[1] = v49;
    v19[2] = v48;
    swift_storeEnumTagMultiPayload();
    sub_23CA2E23C();
    sub_23CA2E30C();
    return sub_23CA46B30();
  }
}

unsigned char *sub_23CA2B644(unsigned char *result, unsigned char *a2)
{
  if (*result == 1 && (*a2 & 1) == 0)
  {
    type metadata accessor for AddPassToWalletButton_iOS();
    return (unsigned char *)sub_23CA29D90();
  }
  return result;
}

uint64_t sub_23CA2B694(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_23CA46E80();
  v3[5] = sub_23CA46E70();
  uint64_t v5 = sub_23CA46E60();
  return MEMORY[0x270FA2498](sub_23CA2B730, v5, v4);
}

uint64_t sub_23CA2B730()
{
  swift_release();
  uint64_t v1 = type metadata accessor for AddPassToWalletButton_iOS();
  sub_23CA2B7B0(v1);
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_23CA2B7B0(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = sub_23CA46F30();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v10 - v6;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v10 - v6, v1 + *(int *)(a1 + 36), v4);
  LODWORD(v3) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v3 - 8) + 48))(v7, 1, v3);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (v3 != 1)
  {
    switch(*(unsigned char *)(v1 + 40))
    {
      case 1:
        objc_msgSend(self, sel_canAddPasses);
        break;
      case 2:
        id v8 = *(id *)v1;
        self;
        if (!swift_dynamicCastObjCClass()) {
          objc_msgSend(self, sel_canAddSecureElementPassWithConfiguration_, v8);
        }

        break;
      case 3:
        objc_msgSend(self, sel_canAddPaymentPass);
        break;
      default:
        return sub_23CA29CDC();
    }
  }
  return sub_23CA29CDC();
}

uint64_t sub_23CA2B9AC(uint64_t a1)
{
  uint64_t v3 = *(void **)v1;
  uint64_t v2 = *(void *)(v1 + 8);
  uint64_t v4 = *(void *)(v1 + 16);
  switch(*(unsigned char *)(v1 + 40))
  {
    case 1:
      swift_bridgeObjectRetain();
      swift_retain();
      uint64_t v6 = sub_23CA39BF4((uint64_t)v3, v2, v4, a1);
      swift_bridgeObjectRelease();
      break;
    case 2:
      id v7 = v3;
      swift_retain();
      uint64_t v6 = (uint64_t)sub_23CA24B74(v7, v2, v4, a1);

      break;
    case 3:
      uint64_t v9 = *(void *)(v1 + 24);
      uint64_t v8 = *(void *)(v1 + 32);
      id v10 = v3;
      swift_retain();
      swift_retain();
      uint64_t v6 = (uint64_t)sub_23CA42C6C(v10, v2, v4, v9, v8, a1);

      swift_release();
      break;
    default:
      sub_23CA46FB0();
      __break(1u);
      JUMPOUT(0x23CA2BB20);
  }
  swift_release();
  return v6;
}

uint64_t sub_23CA2BB30()
{
  unsigned int v0 = objc_msgSend(self, sel_passbookHasBeenDeleted);
  type metadata accessor for AddPassToWalletButton_iOS();
  if (v0) {
    return sub_23CA29BCC();
  }
  else {
    return sub_23CA258D0();
  }
}

uint64_t sub_23CA2BBA4(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(result + 8);
  switch(*(unsigned char *)(result + 40))
  {
    case 1:
      swift_retain();
      ((void (*)(void))v2)(0);
      goto LABEL_5;
    case 2:
      goto LABEL_3;
    case 3:
      uint64_t v2 = *(void (**)(uint64_t, uint64_t))(result + 24);
LABEL_3:
      swift_retain();
      v2(a2, 1);
LABEL_5:
      unint64_t result = swift_release();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t AddPassToWalletButton<>.init(action:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = result;
  *(void *)(a3 + 8) = a2;
  *(void *)(a3 + 24) = 0;
  *(void *)(a3 + 32) = 0;
  *(void *)(a3 + 16) = 0;
  *(_WORD *)(a3 + 40) = 256;
  return result;
}

uint64_t sub_23CA2BC78()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23CA2BCBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_23CA2BCC4()
{
  uint64_t result = sub_23CA46F30();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

char *sub_23CA2BD60(char *a1, char **a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = v5;
  int v7 = *(_DWORD *)(v5 + 80);
  uint64_t v8 = v7;
  if (*(_DWORD *)(v5 + 84)) {
    uint64_t v9 = *(void *)(v5 + 64);
  }
  else {
    uint64_t v9 = *(void *)(v5 + 64) + 1;
  }
  unint64_t v10 = ((v7 + 41) & ~(unint64_t)v7) + v9;
  int v11 = v7 & 0x100000;
  if (v8 > 7 || v11 != 0 || v10 > 0x18)
  {
    uint64_t v14 = *a2;
    *(void *)a1 = *a2;
    a1 = &v14[(v8 & 0xF8 ^ 0x1F8) & (v8 + 16)];
    swift_retain();
  }
  else
  {
    size_t __n = v9;
    uint64_t v15 = *a2;
    uint64_t v16 = (uint64_t)a2[1];
    uint64_t v26 = *(void *)(a3 + 16);
    uint64_t v17 = (uint64_t)a2[2];
    uint64_t v18 = (uint64_t)a2[3];
    uint64_t v19 = (uint64_t)a2[4];
    char v20 = *((unsigned char *)a2 + 40);
    sub_23CA29AC8(*a2, v16, v17, v18, v19, v20);
    *(void *)a1 = v15;
    *((void *)a1 + 1) = v16;
    *((void *)a1 + 2) = v17;
    *((void *)a1 + 3) = v18;
    uint64_t v21 = (uint64_t)a2 + v8;
    *((void *)a1 + 4) = v19;
    a1[40] = v20;
    uint64_t v22 = (void *)((unint64_t)&a1[v8 + 41] & ~v8);
    uint64_t v23 = (const void *)((v21 + 41) & ~v8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(v23, 1, v26))
    {
      memcpy(v22, v23, __n);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(v22, v23, v26);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v22, 0, 1, v26);
    }
  }
  return a1;
}

uint64_t sub_23CA2BF28(uint64_t a1, uint64_t a2)
{
  sub_23CA250DC(*(void **)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t v6 = (a1 + *(unsigned __int8 *)(v5 + 80) + 41) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = v5;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v5 + 48))(v6, 1, v4);
  if (!result)
  {
    uint64_t v8 = *(uint64_t (**)(unint64_t, uint64_t))(v9 + 8);
    return v8(v6, v4);
  }
  return result;
}

uint64_t sub_23CA2C004(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = *(void **)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  uint64_t v8 = *(void *)(a2 + 16);
  uint64_t v9 = *(void *)(a2 + 24);
  uint64_t v10 = *(void *)(a2 + 32);
  char v11 = *(unsigned char *)(a2 + 40);
  sub_23CA29AC8(*(void **)a2, v7, v8, v9, v10, v11);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(void *)(a1 + 16) = v8;
  *(void *)(a1 + 24) = v9;
  *(void *)(a1 + 32) = v10;
  *(unsigned char *)(a1 + 40) = v11;
  uint64_t v12 = *(void *)(a3 + 16);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v15 = (void *)((v14 + 41 + a1) & ~v14);
  uint64_t v16 = (const void *)((v14 + 41 + a2) & ~v14);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48))(v16, 1, v12))
  {
    if (*(_DWORD *)(v13 + 84)) {
      size_t v17 = *(void *)(v13 + 64);
    }
    else {
      size_t v17 = *(void *)(v13 + 64) + 1;
    }
    memcpy(v15, v16, v17);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v13 + 16))(v15, v16, v12);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v15, 0, 1, v12);
  }
  return a1;
}

uint64_t sub_23CA2C158(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = *(void **)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  uint64_t v8 = *(void *)(a2 + 16);
  uint64_t v9 = *(void *)(a2 + 24);
  uint64_t v10 = *(void *)(a2 + 32);
  char v11 = *(unsigned char *)(a2 + 40);
  sub_23CA29AC8(*(void **)a2, v7, v8, v9, v10, v11);
  uint64_t v12 = *(void **)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(void *)(a1 + 16) = v8;
  *(void *)(a1 + 24) = v9;
  *(void *)(a1 + 32) = v10;
  char v17 = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(a1 + 40) = v11;
  sub_23CA250DC(v12, v13, v14, v15, v16, v17);
  uint64_t v18 = *(void *)(a3 + 16);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = (void *)((v20 + 41 + a1) & ~v20);
  uint64_t v22 = (void *)((v20 + 41 + a2) & ~v20);
  uint64_t v23 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v19 + 48);
  LODWORD(v7) = v23(v21, 1, v18);
  int v24 = v23(v22, 1, v18);
  if (v7)
  {
    if (!v24)
    {
      (*(void (**)(void *, void *, uint64_t))(v19 + 16))(v21, v22, v18);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56))(v21, 0, 1, v18);
      return a1;
    }
    int v25 = *(_DWORD *)(v19 + 84);
    size_t v26 = *(void *)(v19 + 64);
  }
  else
  {
    if (!v24)
    {
      (*(void (**)(void *, void *, uint64_t))(v19 + 24))(v21, v22, v18);
      return a1;
    }
    uint64_t v28 = *(void (**)(void *, uint64_t))(v19 + 8);
    uint64_t v27 = v19 + 8;
    v28(v21, v18);
    int v25 = *(_DWORD *)(v27 + 76);
    size_t v26 = *(void *)(v27 + 56);
  }
  if (v25) {
    size_t v29 = v26;
  }
  else {
    size_t v29 = v26 + 1;
  }
  memcpy(v21, v22, v29);
  return a1;
}

_OWORD *sub_23CA2C328(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  *(_OWORD *)((char *)a1 + 25) = *(_OWORD *)((char *)a2 + 25);
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (void *)(((unint64_t)a1 + v7 + 41) & ~v7);
  uint64_t v9 = (const void *)(((unint64_t)a2 + v7 + 41) & ~v7);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(v9, 1, v5))
  {
    if (*(_DWORD *)(v6 + 84)) {
      size_t v10 = *(void *)(v6 + 64);
    }
    else {
      size_t v10 = *(void *)(v6 + 64) + 1;
    }
    memcpy(v8, v9, v10);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(v8, v9, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v8, 0, 1, v5);
  }
  return a1;
}

uint64_t sub_23CA2C44C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 32);
  char v7 = *(unsigned char *)(a2 + 40);
  uint64_t v8 = *(void **)a1;
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  uint64_t v12 = *(void *)(a1 + 32);
  long long v13 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v13;
  *(void *)(a1 + 32) = v6;
  char v14 = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(a1 + 40) = v7;
  sub_23CA250DC(v8, v9, v10, v11, v12, v14);
  uint64_t v15 = *(void *)(a3 + 16);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (void *)((v17 + 41 + a1) & ~v17);
  uint64_t v19 = (void *)((v17 + 41 + a2) & ~v17);
  uint64_t v20 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v16 + 48);
  int v21 = v20(v18, 1, v15);
  int v22 = v20(v19, 1, v15);
  if (v21)
  {
    if (!v22)
    {
      (*(void (**)(void *, void *, uint64_t))(v16 + 32))(v18, v19, v15);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v18, 0, 1, v15);
      return a1;
    }
    int v23 = *(_DWORD *)(v16 + 84);
    size_t v24 = *(void *)(v16 + 64);
  }
  else
  {
    if (!v22)
    {
      (*(void (**)(void *, void *, uint64_t))(v16 + 40))(v18, v19, v15);
      return a1;
    }
    size_t v26 = *(void (**)(void *, uint64_t))(v16 + 8);
    uint64_t v25 = v16 + 8;
    v26(v18, v15);
    int v23 = *(_DWORD *)(v25 + 76);
    size_t v24 = *(void *)(v25 + 56);
  }
  if (v23) {
    size_t v27 = v24;
  }
  else {
    size_t v27 = v24 + 1;
  }
  memcpy(v18, v19, v27);
  return a1;
}

uint64_t sub_23CA2C5F0(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  int v5 = *(_DWORD *)(v4 + 84);
  if (v5) {
    unsigned int v6 = v5 - 1;
  }
  else {
    unsigned int v6 = 0;
  }
  if (v6 <= 0xFC) {
    unsigned int v7 = 252;
  }
  else {
    unsigned int v7 = v6;
  }
  uint64_t v8 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  if (!v5) {
    ++v9;
  }
  if (!a2) {
    return 0;
  }
  int v10 = a2 - v7;
  if (a2 <= v7) {
    goto LABEL_28;
  }
  uint64_t v11 = v9 + ((v8 + 41) & ~v8);
  char v12 = 8 * v11;
  if (v11 <= 3)
  {
    unsigned int v15 = ((v10 + ~(-1 << v12)) >> v12) + 1;
    if (HIWORD(v15))
    {
      int v13 = *(_DWORD *)((char *)a1 + v11);
      if (!v13) {
        goto LABEL_28;
      }
      goto LABEL_20;
    }
    if (v15 > 0xFF)
    {
      int v13 = *(unsigned __int16 *)((char *)a1 + v11);
      if (!*(unsigned __int16 *)((char *)a1 + v11)) {
        goto LABEL_28;
      }
      goto LABEL_20;
    }
    if (v15 < 2)
    {
LABEL_28:
      if (v6 > 0xFC)
      {
        unsigned int v18 = (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)a1 + v8 + 41) & ~v8);
        if (v18 >= 2) {
          return v18 - 1;
        }
        else {
          return 0;
        }
      }
      else
      {
        unsigned int v17 = *((unsigned __int8 *)a1 + 40);
        if (v17 > 3) {
          return (v17 ^ 0xFF) + 1;
        }
        else {
          return 0;
        }
      }
    }
  }
  int v13 = *((unsigned __int8 *)a1 + v11);
  if (!*((unsigned char *)a1 + v11)) {
    goto LABEL_28;
  }
LABEL_20:
  int v16 = (v13 - 1) << v12;
  if (v11 > 3) {
    int v16 = 0;
  }
  if (v11)
  {
    if (v11 > 3) {
      LODWORD(v11) = 4;
    }
    switch((int)v11)
    {
      case 2:
        LODWORD(v11) = *a1;
        break;
      case 3:
        LODWORD(v11) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v11) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v11) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v7 + (v11 | v16) + 1;
}

void sub_23CA2C7CC(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6 = 0;
  uint64_t v7 = *(void *)(*(void *)(a4 + 16) - 8);
  int v8 = *(_DWORD *)(v7 + 84);
  unsigned int v9 = v8 - 1;
  if (!v8) {
    unsigned int v9 = 0;
  }
  if (v9 <= 0xFC) {
    unsigned int v10 = 252;
  }
  else {
    unsigned int v10 = v9;
  }
  uint64_t v11 = *(unsigned __int8 *)(v7 + 80);
  size_t v12 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  if (!v8) {
    ++v12;
  }
  size_t v13 = ((v11 + 41) & ~v11) + v12;
  BOOL v14 = a3 >= v10;
  unsigned int v15 = a3 - v10;
  if (v15 == 0 || !v14)
  {
LABEL_17:
    if (v10 < a2) {
      goto LABEL_18;
    }
    goto LABEL_25;
  }
  if (v13 > 3)
  {
    int v6 = 1;
    if (v10 < a2) {
      goto LABEL_18;
    }
    goto LABEL_25;
  }
  unsigned int v16 = ((v15 + ~(-1 << (8 * v13))) >> (8 * v13)) + 1;
  if (!HIWORD(v16))
  {
    if (v16 >= 0x100) {
      int v6 = 2;
    }
    else {
      int v6 = v16 > 1;
    }
    goto LABEL_17;
  }
  int v6 = 4;
  if (v10 < a2)
  {
LABEL_18:
    unsigned int v17 = ~v10 + a2;
    if (v13 < 4)
    {
      int v18 = (v17 >> (8 * v13)) + 1;
      if (v13)
      {
        int v19 = v17 & ~(-1 << (8 * v13));
        bzero(a1, v13);
        if (v13 == 3)
        {
          *(_WORD *)a1 = v19;
          a1[2] = BYTE2(v19);
        }
        else if (v13 == 2)
        {
          *(_WORD *)a1 = v19;
        }
        else
        {
          *a1 = v19;
        }
      }
    }
    else
    {
      bzero(a1, v13);
      *(_DWORD *)a1 = v17;
      int v18 = 1;
    }
    switch(v6)
    {
      case 1:
        a1[v13] = v18;
        return;
      case 2:
        *(_WORD *)&a1[v13] = v18;
        return;
      case 3:
        goto LABEL_59;
      case 4:
        *(_DWORD *)&a1[v13] = v18;
        return;
      default:
        return;
    }
  }
LABEL_25:
  switch(v6)
  {
    case 1:
      a1[v13] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_30;
    case 2:
      *(_WORD *)&a1[v13] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_30;
    case 3:
LABEL_59:
      __break(1u);
      JUMPOUT(0x23CA2CAF4);
    case 4:
      *(_DWORD *)&a1[v13] = 0;
      goto LABEL_29;
    default:
LABEL_29:
      if (a2)
      {
LABEL_30:
        if (v9 > 0xFC)
        {
          uint64_t v20 = (unsigned char *)((unint64_t)&a1[v11 + 41] & ~v11);
          if (v9 >= a2)
          {
            uint64_t v24 = a2 + 1;
            uint64_t v25 = *(void (**)(unint64_t, uint64_t))(v7 + 56);
            unint64_t v26 = (unint64_t)&a1[v11 + 41] & ~v11;
            v25(v26, v24);
          }
          else
          {
            if (v12 <= 3) {
              int v21 = ~(-1 << (8 * v12));
            }
            else {
              int v21 = -1;
            }
            if (v12)
            {
              int v22 = v21 & (~v9 + a2);
              if (v12 <= 3) {
                int v23 = v12;
              }
              else {
                int v23 = 4;
              }
              bzero(v20, v12);
              switch(v23)
              {
                case 2:
                  *(_WORD *)uint64_t v20 = v22;
                  break;
                case 3:
                  *(_WORD *)uint64_t v20 = v22;
                  v20[2] = BYTE2(v22);
                  break;
                case 4:
                  *(_DWORD *)uint64_t v20 = v22;
                  break;
                default:
                  *uint64_t v20 = v22;
                  break;
              }
            }
          }
        }
        else if (a2 > 0xFC)
        {
          *(_OWORD *)(a1 + 24) = 0u;
          *(_OWORD *)(a1 + 8) = 0u;
          a1[40] = 0;
          *(void *)a1 = a2 - 253;
        }
        else
        {
          a1[40] = -(char)a2;
        }
      }
      return;
  }
}

uint64_t type metadata accessor for AddPassToWalletButton()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_23CA2CB44()
{
  type metadata accessor for AddPassToWalletButton_iOS();

  return swift_getWitnessTable();
}

void *destroy for AddPassToWalletSheet(uint64_t a1)
{
  return sub_23CA250DC(*(void **)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
}

uint64_t initializeWithCopy for AddPassToWalletSheet(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  char v8 = *(unsigned char *)(a2 + 40);
  sub_23CA29AC8(*(void **)a2, v4, v5, v6, v7, v8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = v8;
  return a1;
}

uint64_t assignWithCopy for AddPassToWalletSheet(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  char v8 = *(unsigned char *)(a2 + 40);
  sub_23CA29AC8(*(void **)a2, v4, v5, v6, v7, v8);
  unsigned int v9 = *(void **)a1;
  uint64_t v10 = *(void *)(a1 + 8);
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v12 = *(void *)(a1 + 24);
  uint64_t v13 = *(void *)(a1 + 32);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  char v14 = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(a1 + 40) = v8;
  sub_23CA250DC(v9, v10, v11, v12, v13, v14);
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for AddPassToWalletSheet(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 32);
  char v4 = *(unsigned char *)(a2 + 40);
  uint64_t v5 = *(void **)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  long long v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  *(void *)(a1 + 32) = v3;
  char v11 = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(a1 + 40) = v4;
  sub_23CA250DC(v5, v7, v6, v8, v9, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for AddPassToWalletSheet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AddPassToWalletSheet(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 - 253;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 40) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_23CA2CDA8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 40);
}

uint64_t sub_23CA2CDB0(uint64_t result, char a2)
{
  *(unsigned char *)(result + 40) = a2;
  return result;
}

ValueMetadata *type metadata accessor for AddPassToWalletSheet()
{
  return &type metadata for AddPassToWalletSheet;
}

uint64_t sub_23CA2CDC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 48);
}

uint64_t sub_23CA2CDD0()
{
  uint64_t result = sub_23CA46F30();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

char *sub_23CA2CE84(char *a1, char **a2, uint64_t a3)
{
  int v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = v5;
  int v7 = *(_DWORD *)(v5 + 80);
  uint64_t v8 = v7;
  if (*(_DWORD *)(v5 + 84)) {
    uint64_t v9 = *(void *)(v5 + 64);
  }
  else {
    uint64_t v9 = *(void *)(v5 + 64) + 1;
  }
  unint64_t v10 = ((((((((v9 + ((v7 + 41) & ~(unint64_t)v7) + 23) & 0xFFFFFFFFFFFFFFF8)
            + 23) & 0xFFFFFFFFFFFFFFF8)
          + 23) & 0xFFFFFFFFFFFFFFF8)
        + 23) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  int v11 = v7 & 0x100000;
  if (v8 > 7 || v11 != 0 || v10 > 0x18)
  {
    char v14 = *a2;
    *(void *)a1 = *a2;
    int v4 = &v14[(v8 & 0xF8 ^ 0x1F8) & (v8 + 16)];
  }
  else
  {
    size_t __n = v9;
    unsigned int v15 = *a2;
    uint64_t v16 = (uint64_t)a2[1];
    uint64_t v41 = *(void *)(a3 + 16);
    uint64_t v17 = (uint64_t)a2[2];
    uint64_t v18 = (uint64_t)a2[3];
    uint64_t v19 = (uint64_t)a2[4];
    char v20 = *((unsigned char *)a2 + 40);
    sub_23CA29AC8(*a2, v16, v17, v18, v19, v20);
    *(void *)int v4 = v15;
    *((void *)v4 + 1) = v16;
    *((void *)v4 + 2) = v17;
    *((void *)v4 + 3) = v18;
    uint64_t v21 = (uint64_t)a2 + v8;
    *((void *)v4 + 4) = v19;
    v4[40] = v20;
    int v22 = (char *)((unint64_t)&v4[v8 + 41] & ~v8);
    int v23 = (char *)((v21 + 41) & ~v8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v23, 1, v41))
    {
      size_t v24 = __n;
      memcpy(v22, v23, __n);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v22, v23, v41);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v22, 0, 1, v41);
      size_t v24 = __n;
    }
    uint64_t v25 = &v22[v24];
    unint64_t v26 = &v23[v24];
    unint64_t v27 = (unint64_t)(v25 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v28 = (unint64_t)(v26 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v29 = *(void *)v28;
    char v30 = *(unsigned char *)(v28 + 8);
    sub_23CA279F8(*(void *)v28, v30);
    *(void *)unint64_t v27 = v29;
    *(unsigned char *)(v27 + 8) = v30;
    unint64_t v31 = (unint64_t)(v25 + 23) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v32 = (unint64_t)(v26 + 23) & 0xFFFFFFFFFFFFFFF8;
    *(unsigned char *)unint64_t v31 = *(unsigned char *)v32;
    *(void *)(v31 + 8) = *(void *)(v32 + 8);
    unint64_t v33 = (v31 + 23) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v34 = (v32 + 23) & 0xFFFFFFFFFFFFFFF8;
    *(unsigned char *)unint64_t v33 = *(unsigned char *)v34;
    *(void *)(v33 + 8) = *(void *)(v34 + 8);
    unint64_t v35 = (v33 + 23) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v36 = (v34 + 23) & 0xFFFFFFFFFFFFFFF8;
    *(unsigned char *)unint64_t v35 = *(unsigned char *)v36;
    *(void *)(v35 + 8) = *(void *)(v36 + 8);
    unint64_t v37 = (v35 + 23) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v38 = (v36 + 23) & 0xFFFFFFFFFFFFFFF8;
    *(unsigned char *)unint64_t v37 = *(unsigned char *)v38;
    *(void *)(v37 + 8) = *(void *)(v38 + 8);
    swift_retain();
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_23CA2D148(uint64_t a1, uint64_t a2)
{
  sub_23CA250DC(*(void **)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t v6 = (a1 + *(unsigned __int8 *)(v5 + 80) + 41) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v5 + 48))(v6, 1, v4)) {
    (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v6, v4);
  }
  uint64_t v7 = *(void *)(v5 + 64);
  if (*(_DWORD *)(v5 + 84)) {
    uint64_t v8 = v7 + v6;
  }
  else {
    uint64_t v8 = v7 + v6 + 1;
  }
  sub_23CA25180(*(void *)((v8 + 7) & 0xFFFFFFFFFFFFFFF8), *(unsigned char *)(((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 8));
  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t sub_23CA2D27C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = *(void **)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  uint64_t v8 = *(void *)(a2 + 16);
  uint64_t v9 = *(void *)(a2 + 24);
  uint64_t v10 = *(void *)(a2 + 32);
  char v11 = *(unsigned char *)(a2 + 40);
  sub_23CA29AC8(*(void **)a2, v7, v8, v9, v10, v11);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(void *)(a1 + 16) = v8;
  *(void *)(a1 + 24) = v9;
  *(void *)(a1 + 32) = v10;
  *(unsigned char *)(a1 + 40) = v11;
  uint64_t v12 = *(void *)(a3 + 16);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(unsigned __int8 *)(v13 + 80);
  unsigned int v15 = (char *)((v14 + 41 + a1) & ~v14);
  uint64_t v16 = (char *)((v14 + 41 + a2) & ~v14);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v16, 1, v12))
  {
    int v17 = *(_DWORD *)(v13 + 84);
    size_t v18 = *(void *)(v13 + 64);
    if (v17) {
      size_t v19 = v18;
    }
    else {
      size_t v19 = v18 + 1;
    }
    memcpy(v15, v16, v19);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v15, v16, v12);
    uint64_t v21 = *(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56);
    uint64_t v20 = v13 + 56;
    v21(v15, 0, 1, v12);
    int v17 = *(_DWORD *)(v20 + 28);
    size_t v18 = *(void *)(v20 + 8);
  }
  if (v17) {
    size_t v22 = v18;
  }
  else {
    size_t v22 = v18 + 1;
  }
  int v23 = &v15[v22];
  size_t v24 = &v16[v22];
  unint64_t v25 = (unint64_t)&v15[v22 + 7] & 0xFFFFFFFFFFFFFFF8;
  unint64_t v26 = (unint64_t)&v16[v22 + 7] & 0xFFFFFFFFFFFFFFF8;
  uint64_t v27 = *(void *)v26;
  char v28 = *(unsigned char *)(v26 + 8);
  sub_23CA279F8(*(void *)v26, v28);
  *(void *)unint64_t v25 = v27;
  *(unsigned char *)(v25 + 8) = v28;
  unint64_t v29 = (unint64_t)(v23 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v30 = (unint64_t)(v24 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v29 = *(unsigned char *)v30;
  *(void *)(v29 + 8) = *(void *)(v30 + 8);
  unint64_t v31 = (v29 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v32 = (v30 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v31 = *(unsigned char *)v32;
  *(void *)(v31 + 8) = *(void *)(v32 + 8);
  unint64_t v33 = (v31 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v34 = (v32 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v33 = *(unsigned char *)v34;
  *(void *)(v33 + 8) = *(void *)(v34 + 8);
  unint64_t v35 = (v33 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v36 = (v34 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v35 = *(unsigned char *)v36;
  *(void *)(v35 + 8) = *(void *)(v36 + 8);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_23CA2D4B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = *(void **)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  uint64_t v8 = *(void *)(a2 + 16);
  uint64_t v9 = *(void *)(a2 + 24);
  uint64_t v10 = *(void *)(a2 + 32);
  char v11 = *(unsigned char *)(a2 + 40);
  sub_23CA29AC8(*(void **)a2, v7, v8, v9, v10, v11);
  uint64_t v12 = *(void **)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(void *)(a1 + 16) = v8;
  *(void *)(a1 + 24) = v9;
  *(void *)(a1 + 32) = v10;
  char v17 = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(a1 + 40) = v11;
  sub_23CA250DC(v12, v13, v14, v15, v16, v17);
  uint64_t v18 = *(void *)(a3 + 16);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = (char *)((v20 + 41 + a1) & ~v20);
  size_t v22 = (char *)((v20 + 41 + a2) & ~v20);
  int v23 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48);
  LODWORD(v8) = v23(v21, 1, v18);
  int v24 = v23(v22, 1, v18);
  if (v8)
  {
    if (!v24)
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v21, v22, v18);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v21, 0, 1, v18);
      goto LABEL_12;
    }
    int v25 = *(_DWORD *)(v19 + 84);
    size_t v26 = *(void *)(v19 + 64);
  }
  else
  {
    if (!v24)
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 24))(v21, v22, v18);
      goto LABEL_12;
    }
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
    int v25 = *(_DWORD *)(v19 + 84);
    size_t v26 = *(void *)(v19 + 64);
  }
  if (v25) {
    size_t v27 = v26;
  }
  else {
    size_t v27 = v26 + 1;
  }
  memcpy(v21, v22, v27);
LABEL_12:
  if (*(_DWORD *)(v19 + 84)) {
    uint64_t v28 = *(void *)(v19 + 64);
  }
  else {
    uint64_t v28 = *(void *)(v19 + 64) + 1;
  }
  unint64_t v29 = &v21[v28];
  unint64_t v30 = &v22[v28];
  unint64_t v31 = (unint64_t)&v21[v28 + 7] & 0xFFFFFFFFFFFFFFF8;
  unint64_t v32 = (unint64_t)(v30 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v33 = *(void *)v32;
  char v34 = *(unsigned char *)(v32 + 8);
  sub_23CA279F8(*(void *)v32, v34);
  uint64_t v35 = *(void *)v31;
  char v36 = *(unsigned char *)(v31 + 8);
  *(void *)unint64_t v31 = v33;
  *(unsigned char *)(v31 + 8) = v34;
  sub_23CA25180(v35, v36);
  unint64_t v37 = (unint64_t)(v29 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v38 = (unint64_t)(v30 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v37 = *(unsigned char *)v38;
  *(void *)(v37 + 8) = *(void *)(v38 + 8);
  swift_retain();
  swift_release();
  unint64_t v39 = (v37 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v40 = (v38 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v39 = *(unsigned char *)v40;
  *(void *)(v39 + 8) = *(void *)(v40 + 8);
  swift_retain();
  swift_release();
  unint64_t v41 = (v39 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v42 = (v40 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v41 = *(unsigned char *)v42;
  *(void *)(v41 + 8) = *(void *)(v42 + 8);
  swift_retain();
  swift_release();
  unint64_t v43 = (v41 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v44 = (v42 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v43 = *(unsigned char *)v44;
  *(void *)(v43 + 8) = *(void *)(v44 + 8);
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_23CA2D79C(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  *(_OWORD *)((char *)a1 + 25) = *(_OWORD *)((char *)a2 + 25);
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (char *)(((unint64_t)a1 + v7 + 41) & ~v7);
  uint64_t v9 = (char *)(((unint64_t)a2 + v7 + 41) & ~v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v9, 1, v5))
  {
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
    if (v10) {
      size_t v12 = v11;
    }
    else {
      size_t v12 = v11 + 1;
    }
    memcpy(v8, v9, v12);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v9, v5);
    uint64_t v14 = *(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56);
    uint64_t v13 = v6 + 56;
    v14(v8, 0, 1, v5);
    int v10 = *(_DWORD *)(v13 + 28);
    size_t v11 = *(void *)(v13 + 8);
  }
  if (v10) {
    size_t v15 = v11;
  }
  else {
    size_t v15 = v11 + 1;
  }
  uint64_t v16 = &v8[v15];
  char v17 = &v9[v15];
  unint64_t v18 = (unint64_t)(v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v19 = (unint64_t)(v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v20 = *(void *)v19;
  *(unsigned char *)(v18 + 8) = *(unsigned char *)(v19 + 8);
  *(void *)unint64_t v18 = v20;
  uint64_t v21 = (_OWORD *)((unint64_t)(v16 + 23) & 0xFFFFFFFFFFFFFFF8);
  size_t v22 = (_OWORD *)((unint64_t)(v17 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v21 = *v22;
  int v23 = (_OWORD *)(((unint64_t)v21 + 23) & 0xFFFFFFFFFFFFFFF8);
  int v24 = (_OWORD *)(((unint64_t)v22 + 23) & 0xFFFFFFFFFFFFFFF8);
  *int v23 = *v24;
  int v25 = (_OWORD *)(((unint64_t)v23 + 23) & 0xFFFFFFFFFFFFFFF8);
  size_t v26 = (_OWORD *)(((unint64_t)v24 + 23) & 0xFFFFFFFFFFFFFFF8);
  *int v25 = *v26;
  *(_OWORD *)(((unint64_t)v25 + 23) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v26 + 23) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_23CA2D940(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 32);
  char v7 = *(unsigned char *)(a2 + 40);
  uint64_t v8 = *(void **)a1;
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  uint64_t v12 = *(void *)(a1 + 32);
  long long v13 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v13;
  *(void *)(a1 + 32) = v6;
  char v14 = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(a1 + 40) = v7;
  sub_23CA250DC(v8, v9, v10, v11, v12, v14);
  uint64_t v15 = *(void *)(a3 + 16);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (char *)((v17 + 41 + a1) & ~v17);
  unint64_t v19 = (char *)((v17 + 41 + a2) & ~v17);
  uint64_t v20 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  int v21 = v20(v18, 1, v15);
  int v22 = v20(v19, 1, v15);
  if (v21)
  {
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v18, v19, v15);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v18, 0, 1, v15);
      goto LABEL_12;
    }
    int v23 = *(_DWORD *)(v16 + 84);
    size_t v24 = *(void *)(v16 + 64);
  }
  else
  {
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v18, v19, v15);
      goto LABEL_12;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
    int v23 = *(_DWORD *)(v16 + 84);
    size_t v24 = *(void *)(v16 + 64);
  }
  if (v23) {
    size_t v25 = v24;
  }
  else {
    size_t v25 = v24 + 1;
  }
  memcpy(v18, v19, v25);
LABEL_12:
  if (*(_DWORD *)(v16 + 84)) {
    uint64_t v26 = *(void *)(v16 + 64);
  }
  else {
    uint64_t v26 = *(void *)(v16 + 64) + 1;
  }
  size_t v27 = &v18[v26];
  uint64_t v28 = &v19[v26];
  unint64_t v29 = (unint64_t)(v27 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v30 = (unint64_t)(v28 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v31 = *(void *)v30;
  LOBYTE(v30) = *(unsigned char *)(v30 + 8);
  uint64_t v32 = *(void *)v29;
  char v33 = *(unsigned char *)(v29 + 8);
  *(void *)unint64_t v29 = v31;
  *(unsigned char *)(v29 + 8) = v30;
  sub_23CA25180(v32, v33);
  unint64_t v34 = (unint64_t)(v27 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v35 = (unint64_t)(v28 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v34 = *(unsigned char *)v35;
  *(void *)(v34 + 8) = *(void *)(v35 + 8);
  swift_release();
  unint64_t v36 = (v34 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v37 = (v35 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v36 = *(unsigned char *)v37;
  *(void *)(v36 + 8) = *(void *)(v37 + 8);
  swift_release();
  unint64_t v38 = (v36 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v39 = (v37 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v38 = *(unsigned char *)v39;
  *(void *)(v38 + 8) = *(void *)(v39 + 8);
  swift_release();
  unint64_t v40 = (v38 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v41 = (v39 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v40 = *(unsigned char *)v41;
  *(void *)(v40 + 8) = *(void *)(v41 + 8);
  swift_release();
  return a1;
}

uint64_t sub_23CA2DBD4(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = v4;
  int v6 = *(_DWORD *)(v4 + 84);
  if (v6) {
    unsigned int v7 = v6 - 1;
  }
  else {
    unsigned int v7 = 0;
  }
  if (v7 <= 0x7FFFFFFE) {
    unsigned int v8 = 2147483646;
  }
  else {
    unsigned int v8 = v7;
  }
  uint64_t v9 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v10 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  if (!v6) {
    ++v10;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v11 = v10 + 23;
  if (v8 < a2)
  {
    unint64_t v12 = ((((((((v11 + ((v9 + 41) & ~v9)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
          + 23) & 0xFFFFFFFFFFFFFFF8)
        + 16;
    unsigned int v13 = a2 - v8;
    uint64_t v14 = v12 & 0xFFFFFFF8;
    if ((v12 & 0xFFFFFFF8) != 0) {
      unsigned int v15 = 2;
    }
    else {
      unsigned int v15 = v13 + 1;
    }
    if (v15 >= 0x10000) {
      LODWORD(v16) = 4;
    }
    else {
      LODWORD(v16) = 2;
    }
    if (v15 < 0x100) {
      LODWORD(v16) = 1;
    }
    if (v15 >= 2) {
      uint64_t v16 = v16;
    }
    else {
      uint64_t v16 = 0;
    }
    switch(v16)
    {
      case 1:
        int v17 = *((unsigned __int8 *)a1 + v12);
        if (!v17) {
          break;
        }
        goto LABEL_27;
      case 2:
        int v17 = *(unsigned __int16 *)((char *)a1 + v12);
        if (v17) {
          goto LABEL_27;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x23CA2DD94);
      case 4:
        int v17 = *(_DWORD *)((char *)a1 + v12);
        if (!v17) {
          break;
        }
LABEL_27:
        int v19 = v17 - 1;
        if (v14)
        {
          int v19 = 0;
          LODWORD(v14) = *a1;
        }
        int v20 = v8 + (v14 | v19);
        return (v20 + 1);
      default:
        break;
    }
  }
  uint64_t v21 = ((unint64_t)a1 + v9 + 41) & ~v9;
  if (v7 < 0x7FFFFFFE)
  {
    unint64_t v23 = *(void *)(((v11 + v21) & 0xFFFFFFFFFFFFFFF8) + 8);
    if (v23 >= 0xFFFFFFFF) {
      LODWORD(v23) = -1;
    }
    int v20 = v23 - 1;
    if (v20 < 0) {
      int v20 = -1;
    }
    return (v20 + 1);
  }
  else
  {
    unsigned int v22 = (*(uint64_t (**)(uint64_t))(v5 + 48))(v21);
    if (v22 >= 2) {
      return v22 - 1;
    }
    else {
      return 0;
    }
  }
}

void sub_23CA2DDA8(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6 = 0;
  uint64_t v7 = *(void *)(*(void *)(a4 + 16) - 8);
  int v8 = *(_DWORD *)(v7 + 84);
  unsigned int v9 = v8 - 1;
  if (!v8) {
    unsigned int v9 = 0;
  }
  if (v9 <= 0x7FFFFFFE) {
    unsigned int v10 = 2147483646;
  }
  else {
    unsigned int v10 = v9;
  }
  uint64_t v11 = *(unsigned __int8 *)(v7 + 80);
  size_t v12 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  if (!v8) {
    ++v12;
  }
  size_t v13 = ((((((((v12 + 23 + ((v11 + 41) & ~v11)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
        + 23) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  if (v10 < a3)
  {
    unsigned int v14 = a3 - v10;
    if (((((((((v12 + 23 + ((v11 + 41) & ~v11)) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8)
         + 23) & 0xFFFFFFF8) == 0xFFFFFFF0)
      unsigned int v15 = v14 + 1;
    else {
      unsigned int v15 = 2;
    }
    if (v15 >= 0x10000) {
      int v16 = 4;
    }
    else {
      int v16 = 2;
    }
    if (v15 < 0x100) {
      int v16 = 1;
    }
    if (v15 >= 2) {
      int v6 = v16;
    }
    else {
      int v6 = 0;
    }
  }
  if (a2 > v10)
  {
    if (((((((((v12 + 23 + ((v11 + 41) & ~v11)) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8)
         + 23) & 0xFFFFFFF8) == 0xFFFFFFF0)
      int v17 = a2 - v10;
    else {
      int v17 = 1;
    }
    if (((((((((v12 + 23 + ((v11 + 41) & ~v11)) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8)
         + 23) & 0xFFFFFFF8) != 0xFFFFFFF0)
    {
      unsigned int v18 = ~v10 + a2;
      bzero(a1, v13);
      *(_DWORD *)a1 = v18;
    }
    switch(v6)
    {
      case 1:
        a1[v13] = v17;
        return;
      case 2:
        *(_WORD *)&a1[v13] = v17;
        return;
      case 3:
        goto LABEL_58;
      case 4:
        *(_DWORD *)&a1[v13] = v17;
        return;
      default:
        return;
    }
  }
  switch(v6)
  {
    case 1:
      a1[v13] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_35;
    case 2:
      *(_WORD *)&a1[v13] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_35;
    case 3:
LABEL_58:
      __break(1u);
      JUMPOUT(0x23CA2E06CLL);
    case 4:
      *(_DWORD *)&a1[v13] = 0;
      goto LABEL_34;
    default:
LABEL_34:
      if (a2)
      {
LABEL_35:
        unint64_t v19 = (unint64_t)&a1[v11 + 41] & ~v11;
        if (v9 < 0x7FFFFFFE)
        {
          unint64_t v23 = (void *)((v12 + 23 + v19) & 0xFFFFFFFFFFFFFFF8);
          if (a2 > 0x7FFFFFFE)
          {
            *unint64_t v23 = a2 - 0x7FFFFFFF;
            v23[1] = 0;
          }
          else
          {
            v23[1] = a2;
          }
        }
        else if (v9 >= a2)
        {
          uint64_t v24 = a2 + 1;
          size_t v25 = *(void (**)(unint64_t, uint64_t))(v7 + 56);
          unint64_t v26 = (unint64_t)&a1[v11 + 41] & ~v11;
          v25(v26, v24);
        }
        else
        {
          if (v12 <= 3) {
            int v20 = ~(-1 << (8 * v12));
          }
          else {
            int v20 = -1;
          }
          if (v12)
          {
            int v21 = v20 & (~v9 + a2);
            if (v12 <= 3) {
              int v22 = v12;
            }
            else {
              int v22 = 4;
            }
            bzero((void *)((unint64_t)&a1[v11 + 41] & ~v11), v12);
            switch(v22)
            {
              case 2:
                *(_WORD *)unint64_t v19 = v21;
                break;
              case 3:
                *(_WORD *)unint64_t v19 = v21;
                *(unsigned char *)(v19 + 2) = BYTE2(v21);
                break;
              case 4:
                *(_DWORD *)unint64_t v19 = v21;
                break;
              default:
                *(unsigned char *)unint64_t v19 = v21;
                break;
            }
          }
        }
      }
      return;
  }
}

uint64_t sub_23CA2E0A4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23CA2E0E8@<X0>(uint64_t a1@<X8>)
{
  return sub_23CA2A2C8(v1[4], v1[2], v1[3], a1);
}

unint64_t sub_23CA2E0F4()
{
  unint64_t result = qword_268BC3138;
  if (!qword_268BC3138)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC3130);
    sub_23CA2E1C0();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC3158);
    sub_23CA2E290();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC3138);
  }
  return result;
}

unint64_t sub_23CA2E1C0()
{
  unint64_t result = qword_268BC3140;
  if (!qword_268BC3140)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC3148);
    sub_23CA2E23C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC3140);
  }
  return result;
}

unint64_t sub_23CA2E23C()
{
  unint64_t result = qword_268BC3150;
  if (!qword_268BC3150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC3150);
  }
  return result;
}

unint64_t sub_23CA2E290()
{
  unint64_t result = qword_268BC3160;
  if (!qword_268BC3160)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC3158);
    sub_23CA2E23C();
    sub_23CA2E30C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC3160);
  }
  return result;
}

unint64_t sub_23CA2E30C()
{
  unint64_t result = qword_268BC3168;
  if (!qword_268BC3168)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC3170);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC3178);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC3180);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC3188);
    sub_23CA2E23C();
    sub_23CA2E47C();
    swift_getOpaqueTypeConformance2();
    sub_23CA2E51C();
    sub_23CA2E570(&qword_268BC31B0, &qword_268BC3180);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC3168);
  }
  return result;
}

unint64_t sub_23CA2E47C()
{
  unint64_t result = qword_268BC3190;
  if (!qword_268BC3190)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC3188);
    sub_23CA2E570(&qword_268BC3198, &qword_268BC31A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC3190);
  }
  return result;
}

unint64_t sub_23CA2E51C()
{
  unint64_t result = qword_268BC31A8;
  if (!qword_268BC31A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC31A8);
  }
  return result;
}

uint64_t sub_23CA2E570(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23CA2E5B8()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = *(void *)(type metadata accessor for AddPassToWalletButton_iOS() - 8);
  uint64_t v5 = v0 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  int v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  void *v6 = v1;
  v6[1] = sub_23CA27230;
  return sub_23CA2B694(v5, v2, v3);
}

unsigned char *sub_23CA2E6A4(unsigned char *a1, unsigned char *a2)
{
  type metadata accessor for AddPassToWalletButton_iOS();

  return sub_23CA2B644(a1, a2);
}

uint64_t sub_23CA2E744()
{
  return sub_23CA29D90();
}

uint64_t sub_23CA2E7B0()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = type metadata accessor for AddPassToWalletButton_iOS();
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(v2 - 8) + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = *(void *)(*(void *)(v2 - 8) + 64);
  uint64_t v6 = v0 + v4;
  sub_23CA250DC(*(void **)(v0 + v4), *(void *)(v0 + v4 + 8), *(void *)(v0 + v4 + 16), *(void *)(v0 + v4 + 24), *(void *)(v0 + v4 + 32), *(unsigned char *)(v0 + v4 + 40));
  uint64_t v7 = v0 + v4 + *(int *)(v2 + 36);
  uint64_t v8 = *(void *)(v1 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v7, 1, v1)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v1);
  }
  unint64_t v9 = (v5 + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_23CA25180(*(void *)(v6 + *(int *)(v2 + 40)), *(unsigned char *)(v6 + *(int *)(v2 + 40) + 8));
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, v9 + 8, v3 | 7);
}

uint64_t sub_23CA2E964()
{
  uint64_t v1 = *(void *)(type metadata accessor for AddPassToWalletButton_iOS() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_23CA2BBA4(v0 + v2, v3);
}

uint64_t sub_23CA2EA14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3170);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23CA2EA7C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = type metadata accessor for AddPassToWalletButton_iOS();
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(v2 - 8) + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = *(void *)(*(void *)(v2 - 8) + 64);
  sub_23CA250DC(*(void **)(v0 + v4), *(void *)(v0 + v4 + 8), *(void *)(v0 + v4 + 16), *(void *)(v0 + v4 + 24), *(void *)(v0 + v4 + 32), *(unsigned char *)(v0 + v4 + 40));
  uint64_t v6 = v0 + v4 + *(int *)(v2 + 36);
  uint64_t v7 = *(void *)(v1 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v6, 1, v1)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v1);
  }
  sub_23CA25180(*(void *)(v0 + v4 + *(int *)(v2 + 40)), *(unsigned char *)(v0 + v4 + *(int *)(v2 + 40) + 8));
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, v4 + v5, v3 | 7);
}

uint64_t sub_23CA2EC7C()
{
  type metadata accessor for AddPassToWalletButton_iOS();

  return sub_23CA2BB30();
}

uint64_t sub_23CA2ED00@<X0>(void *a1@<X8>)
{
  uint64_t v3 = sub_23CA46D70();
  *a1 = v1;
  a1[1] = v3;
  a1[2] = v4;

  return swift_retain();
}

uint64_t sub_23CA2ED40@<X0>(char *a1@<X8>)
{
  unint64_t v35 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC31F0);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC31F8);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  unint64_t v34 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  unsigned int v10 = (char *)&v34 - v9;
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  size_t v13 = (char *)&v34 - v12;
  MEMORY[0x270FA5388](v11);
  unsigned int v15 = (char *)&v34 - v14;
  int v16 = self;
  int v17 = (void *)sub_23CA46DD0();
  id v18 = objc_msgSend(v16, sel_localizedDeletableWalletStringFor_, v17);

  uint64_t v19 = sub_23CA46E00();
  uint64_t v21 = v20;

  uint64_t v36 = v19;
  uint64_t v37 = v21;
  sub_23CA2E51C();
  sub_23CA46D10();
  int v22 = (void *)sub_23CA46DD0();
  id v23 = objc_msgSend(v16, sel_localizedDeletableWalletStringFor_, v22);

  uint64_t v24 = sub_23CA46E00();
  uint64_t v26 = v25;

  uint64_t v36 = v24;
  uint64_t v37 = v26;
  sub_23CA46940();
  uint64_t v27 = sub_23CA46950();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v3, 0, 1, v27);
  sub_23CA46D00();
  uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  v28(v10, v15, v4);
  unint64_t v29 = v34;
  v28(v34, v13, v4);
  unint64_t v30 = v35;
  v28(v35, v10, v4);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3200);
  v28(&v30[*(int *)(v31 + 48)], v29, v4);
  uint64_t v32 = *(void (**)(char *, uint64_t))(v5 + 8);
  v32(v13, v4);
  v32(v15, v4);
  v32(v29, v4);
  return ((uint64_t (*)(char *, uint64_t))v32)(v10, v4);
}

uint64_t sub_23CA2F104@<X0>(char *a1@<X8>)
{
  return sub_23CA2ED40(a1);
}

uint64_t sub_23CA2F10C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = self;
  uint64_t v3 = (void *)sub_23CA46DD0();
  id v4 = objc_msgSend(v2, sel_localizedDeletableWalletStringFor_, v3);

  sub_23CA46E00();
  sub_23CA2E51C();
  uint64_t result = sub_23CA46BF0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = v7 & 1;
  *(void *)(a1 + 24) = v8;
  return result;
}

uint64_t sub_23CA2F1D0@<X0>(uint64_t a1@<X8>)
{
  return sub_23CA2F10C(a1);
}

void sub_23CA2F1D8(id a1, char a2)
{
  if (a2) {

  }
  else {
    swift_release();
  }
}

uint64_t sub_23CA2F1EC()
{
  return swift_getWitnessTable();
}

uint64_t sub_23CA2F374()
{
  swift_release();

  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t type metadata accessor for PaymentButtonView.Coordinator()
{
  return self;
}

ValueMetadata *type metadata accessor for PaymentButtonView()
{
  return &type metadata for PaymentButtonView;
}

id sub_23CA2F3E0()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F5C9A0]), sel_initWithPaymentButtonType_paymentButtonStyle_, *v0, v0[1]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3210);
  sub_23CA46B50();
  objc_msgSend(v1, sel_addTarget_action_forControlEvents_, v3, sel_callback, 0x2000);
  swift_release();
  objc_msgSend(v1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  return v1;
}

uint64_t sub_23CA2F494@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v3 = *(void *)(v1 + 24);
  type metadata accessor for PaymentButtonView.Coordinator();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  *a1 = v5;

  return swift_retain();
}

uint64_t sub_23CA2F4EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_23CA2F608();

  return MEMORY[0x270F01780](a1, a2, a3, v6);
}

uint64_t sub_23CA2F550(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_23CA2F608();

  return MEMORY[0x270F01718](a1, a2, a3, v6);
}

void sub_23CA2F5B4()
{
}

unint64_t sub_23CA2F5E0(uint64_t a1)
{
  unint64_t result = sub_23CA2F608();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23CA2F608()
{
  unint64_t result = qword_268BC3208;
  if (!qword_268BC3208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC3208);
  }
  return result;
}

uint64_t sub_23CA2F65C()
{
  uint64_t v0 = self;
  uint64_t v1 = (void *)sub_23CA46DD0();
  id v2 = objc_msgSend(v0, sel_localizedDeletableWalletStringFor_, v1);

  sub_23CA46E00();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3180);
  sub_23CA23B08();
  sub_23CA2E51C();
  sub_23CA303A4();
  sub_23CA46C60();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23CA2F7D0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3008);
  sub_23CA46CC0();
  return v1;
}

uint64_t sub_23CA2F828()
{
  return sub_23CA46CD0();
}

uint64_t sub_23CA2F884@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 56);
  uint64_t v5 = *(void *)v4;
  char v6 = *(unsigned char *)(v4 + 8);
  sub_23CA279F8(*(void *)v4, v6);
  sub_23CA3C60C(v5, v6, a2);

  return sub_23CA25180(v5, v6);
}

uint64_t sub_23CA2F8F0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v12 = *a1;
  size_t v13 = (int *)type metadata accessor for VerifyIdentityWithWalletButton();
  uint64_t v14 = a7 + v13[10];
  sub_23CA46CB0();
  *(unsigned char *)uint64_t v14 = v22;
  *(void *)(v14 + 8) = v23;
  uint64_t v15 = a7 + v13[11];
  sub_23CA46CB0();
  *(unsigned char *)uint64_t v15 = v22;
  *(void *)(v15 + 8) = v23;
  uint64_t v16 = v13[12];
  *(void *)(a7 + v16) = objc_msgSend(objc_allocWithZone(MEMORY[0x263F5BEB8]), sel_init);
  uint64_t v17 = a7 + v13[14];
  *(void *)uint64_t v17 = swift_getKeyPath();
  *(unsigned char *)(v17 + 8) = 0;
  *(void *)(a7 + v13[13]) = v12;
  *(void *)a7 = a2;
  *(void *)(a7 + 8) = a3;
  *(void *)(a7 + 16) = a4;
  *(unsigned char *)(a7 + 24) = a5 & 1;
  uint64_t v18 = a7 + v13[9];
  uint64_t v19 = sub_23CA46F30();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32))(v18, a6, v19);
}

uint64_t VerifyIdentityWithWalletButton.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v42 = a2;
  uint64_t v4 = sub_23CA46EB0();
  uint64_t v40 = *(void *)(v4 - 8);
  uint64_t v41 = v4;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  unint64_t v39 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(a1 - 8);
  uint64_t v35 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v5);
  unint64_t v34 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC3218);
  uint64_t v32 = *(void *)(a1 + 16);
  uint64_t v9 = v32;
  sub_23CA46F30();
  sub_23CA46B40();
  uint64_t v10 = sub_23CA46CA0();
  uint64_t v37 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v31 = (char *)&v31 - v11;
  sub_23CA46990();
  uint64_t v12 = sub_23CA469C0();
  uint64_t v38 = *(void *)(v12 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  char v33 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v36 = (uint64_t)&v31 - v15;
  uint64_t v16 = *(void *)(a1 + 24);
  uint64_t v43 = v9;
  uint64_t v44 = v16;
  uint64_t v45 = v2;
  unint64_t v17 = sub_23CA302B8();
  uint64_t v51 = v16;
  uint64_t WitnessTable = swift_getWitnessTable();
  unint64_t v49 = v17;
  uint64_t v50 = WitnessTable;
  uint64_t v19 = swift_getWitnessTable();
  sub_23CA46C90();
  uint64_t v20 = v34;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v34, v2, a1);
  unint64_t v21 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v32;
  *(void *)(v22 + 24) = v16;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v22 + v21, v20, a1);
  uint64_t v48 = v19;
  uint64_t v23 = swift_getWitnessTable();
  uint64_t v24 = v39;
  sub_23CA274B0();
  uint64_t v25 = (uint64_t)v33;
  uint64_t v26 = v31;
  sub_23CA46C50();
  swift_release();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v24, v41);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v26, v10);
  unint64_t v27 = sub_23CA274B4();
  uint64_t v46 = v23;
  unint64_t v47 = v27;
  swift_getWitnessTable();
  uint64_t v28 = v36;
  sub_23CA26A5C(v25, v12, v36);
  unint64_t v29 = *(void (**)(uint64_t, uint64_t))(v38 + 8);
  v29(v25, v12);
  sub_23CA26A5C(v28, v12, v42);
  return ((uint64_t (*)(uint64_t, uint64_t))v29)(v28, v12);
}

uint64_t sub_23CA2FF44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v28 = a3;
  uint64_t v5 = sub_23CA46F30();
  uint64_t v26 = *(void *)(v5 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v25 = (uint64_t)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v24 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3218);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_23CA46B40();
  uint64_t v27 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v24 - v14;
  uint64_t v16 = a2;
  uint64_t v17 = type metadata accessor for VerifyIdentityWithWalletButton();
  if (sub_23CA2F7D0())
  {
    sub_23CA30400(v17, (uint64_t)v12);
    sub_23CA302B8();
    uint64_t v29 = a2;
    swift_getWitnessTable();
    sub_23CA294B4((uint64_t)v12, v10);
    sub_23CA32C28((uint64_t)v12);
  }
  else
  {
    uint64_t v18 = a1 + *(int *)(v17 + 36);
    uint64_t v33 = a2;
    swift_getWitnessTable();
    sub_23CA26A5C(v18, v5, (uint64_t)v9);
    uint64_t v19 = v25;
    sub_23CA26A5C((uint64_t)v9, v5, v25);
    sub_23CA302B8();
    sub_23CA295AC(v19, v10, v5);
    uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
    v20(v19, v5);
    v20((uint64_t)v9, v5);
  }
  unint64_t v21 = sub_23CA302B8();
  uint64_t v32 = v16;
  uint64_t WitnessTable = swift_getWitnessTable();
  unint64_t v30 = v21;
  uint64_t v31 = WitnessTable;
  swift_getWitnessTable();
  sub_23CA26A5C((uint64_t)v15, v13, v28);
  return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v15, v13);
}

uint64_t sub_23CA302AC@<X0>(uint64_t a1@<X8>)
{
  return sub_23CA2FF44(*(void *)(v1 + 32), *(void *)(v1 + 24), a1);
}

unint64_t sub_23CA302B8()
{
  unint64_t result = qword_268BC3220;
  if (!qword_268BC3220)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC3218);
    sub_23CA23B08();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC3180);
    sub_23CA2E51C();
    sub_23CA303A4();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_268BC3220);
  }
  return result;
}

unint64_t sub_23CA303A4()
{
  unint64_t result = qword_268BC31B0;
  if (!qword_268BC31B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC3180);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_268BC31B0);
  }
  return result;
}

uint64_t sub_23CA30400@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v43 = a2;
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](a1);
  uint64_t v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3340);
  uint64_t v40 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v41 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3348);
  MEMORY[0x270FA5388](v42);
  uint64_t v10 = (uint64_t *)((char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = *(void **)v2;
  uint64_t v12 = *(void *)(v2 + 8);
  if (*(unsigned char *)(v2 + 24))
  {
    uint64_t v36 = *(void *)(v2 + 16);
    uint64_t v39 = *(void *)(v2 + *(int *)(a1 + 52));
    id v35 = v11;
    swift_retain();
    sub_23CA2F884(a1, &v44);
    uint64_t v37 = v44;
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v2, a1);
    unint64_t v13 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
    uint64_t v38 = v7;
    unint64_t v14 = (v5 + v13 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = *(_OWORD *)(a1 + 16);
    (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v15 + v13, v6, a1);
    uint64_t v16 = v35;
    uint64_t v17 = v36;
    *(void *)(v15 + v14) = v35;
    uint64_t v18 = (void *)(v15 + ((v14 + 15) & 0xFFFFFFFFFFFFFFF8));
    *uint64_t v18 = v12;
    v18[1] = v17;
    id v19 = v16;
    swift_retain();
    sub_23CA29B70();
    uint64_t v20 = v41;
    sub_23CA2F65C();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v21 = v40;
    uint64_t v22 = v38;
    (*(void (**)(void *, char *, uint64_t))(v40 + 16))(v10, v20, v38);
    swift_storeEnumTagMultiPayload();
    unint64_t v23 = sub_23CA23B08();
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC3180);
    unint64_t v25 = sub_23CA2E51C();
    unint64_t v26 = sub_23CA303A4();
    uint64_t v44 = &type metadata for IdentityButton;
    uint64_t v45 = MEMORY[0x263F8D310];
    uint64_t v46 = v24;
    uint64_t v47 = MEMORY[0x263F1A830];
    unint64_t v48 = v23;
    unint64_t v49 = v25;
    unint64_t v50 = v26;
    uint64_t v51 = MEMORY[0x263F1A820];
    swift_getOpaqueTypeConformance2();
    sub_23CA46B30();

    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v20, v22);
  }
  else
  {
    uint64_t v28 = *(void *)(v2 + *(int *)(a1 + 52));
    swift_retain();
    sub_23CA2F884(a1, &v44);
    uint64_t v29 = v44;
    void *v10 = v28;
    v10[1] = v29;
    v10[2] = v11;
    v10[3] = v12;
    swift_storeEnumTagMultiPayload();
    unint64_t v30 = sub_23CA23B08();
    uint64_t v31 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC3180);
    unint64_t v32 = sub_23CA2E51C();
    unint64_t v33 = sub_23CA303A4();
    uint64_t v44 = &type metadata for IdentityButton;
    uint64_t v45 = MEMORY[0x263F8D310];
    uint64_t v46 = v31;
    uint64_t v47 = MEMORY[0x263F1A830];
    unint64_t v48 = v30;
    unint64_t v49 = v32;
    unint64_t v50 = v33;
    uint64_t v51 = MEMORY[0x263F1A820];
    swift_getOpaqueTypeConformance2();
    return sub_23CA46B30();
  }
}

uint64_t sub_23CA30880()
{
  v0[2] = sub_23CA46E80();
  v0[3] = sub_23CA46E70();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  uint64_t v2 = type metadata accessor for VerifyIdentityWithWalletButton();
  *uint64_t v1 = v0;
  v1[1] = sub_23CA30950;
  return sub_23CA30DF8(v2);
}

uint64_t sub_23CA30950()
{
  swift_task_dealloc();
  uint64_t v1 = sub_23CA46E60();
  return MEMORY[0x270FA2498](sub_23CA30A8C, v1, v0);
}

uint64_t sub_23CA30A8C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_23CA30AEC()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = (int *)type metadata accessor for VerifyIdentityWithWalletButton();
  uint64_t v3 = *(unsigned __int8 *)(*((void *)v2 - 1) + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = *(void *)(*((void *)v2 - 1) + 64);
  uint64_t v6 = v0 + v4;
  sub_23CA30C8C(*(void **)(v0 + v4), *(void *)(v0 + v4 + 8), *(void *)(v0 + v4 + 16), *(unsigned char *)(v0 + v4 + 24));
  uint64_t v7 = v0 + v4 + v2[9];
  uint64_t v8 = *(void *)(v1 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v7, 1, v1)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v1);
  }
  swift_release();
  swift_release();

  sub_23CA25180(*(void *)(v6 + v2[14]), *(unsigned char *)(v6 + v2[14] + 8));

  return MEMORY[0x270FA0238](v0, v4 + v5, v3 | 7);
}

uint64_t type metadata accessor for VerifyIdentityWithWalletButton()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_23CA30C8C(void *a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a4)
  {

    uint64_t v4 = vars8;
  }
  return swift_release();
}

uint64_t sub_23CA30CCC()
{
  type metadata accessor for VerifyIdentityWithWalletButton();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_23CA27230;
  return sub_23CA30880();
}

uint64_t sub_23CA30DB4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23CA30DF8(uint64_t a1)
{
  v2[15] = a1;
  v2[16] = v1;
  v2[17] = *(void *)(a1 + 16);
  uint64_t v3 = sub_23CA46F30();
  v2[18] = v3;
  v2[19] = *(void *)(v3 - 8);
  v2[20] = swift_task_alloc();
  sub_23CA46E80();
  v2[21] = sub_23CA46E70();
  uint64_t v5 = sub_23CA46E60();
  v2[22] = v5;
  v2[23] = v4;
  return MEMORY[0x270FA2498](sub_23CA30EF4, v5, v4);
}

uint64_t sub_23CA30EF4()
{
  uint64_t v1 = v0[20];
  uint64_t v2 = v0[17];
  (*(void (**)(uint64_t, void, void))(v0[19] + 16))(v1, v0[16] + *(int *)(v0[15] + 36), v0[18]);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(v1, 1, v2) == 1)
  {
    uint64_t v3 = v0[20];
    uint64_t v4 = v0[18];
    uint64_t v5 = v0[19];
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
LABEL_10:
    sub_23CA2F828();
    swift_task_dealloc();
    unint64_t v13 = (uint64_t (*)(void))v0[1];
    return v13();
  }
  uint64_t v6 = v0[16];
  (*(void (**)(void, void))(v0[19] + 8))(v0[20], v0[18]);
  if ((*(unsigned char *)(v6 + 24) & 1) == 0)
  {
    swift_release();
    goto LABEL_10;
  }
  uint64_t v7 = *(void **)v0[16];
  v0[24] = v7;
  id v8 = v7;
  id v9 = objc_msgSend(v8, sel_descriptor);
  v0[25] = v9;
  if (!v9)
  {

    swift_release();
    goto LABEL_10;
  }
  id v10 = v9;
  uint64_t v11 = *(void **)(v0[16] + *(int *)(v0[15] + 48));
  v0[2] = v0;
  v0[7] = v0 + 26;
  v0[3] = sub_23CA31154;
  uint64_t v12 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_23CA3147C;
  v0[13] = &block_descriptor;
  v0[14] = v12;
  objc_msgSend(v11, sel_checkCanRequestDocument_completion_, v10, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_23CA31154()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 184);
  uint64_t v2 = *(void *)(*(void *)v0 + 176);
  return MEMORY[0x270FA2498](sub_23CA3125C, v2, v1);
}

uint64_t sub_23CA3125C()
{
  uint64_t v1 = *(void **)(v0 + 192);
  swift_unknownObjectRelease();
  swift_release();

  sub_23CA2F828();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

void sub_23CA312E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned int v7 = objc_msgSend(self, sel_passbookHasBeenDeleted);
  uint64_t v8 = type metadata accessor for VerifyIdentityWithWalletButton();
  if (v7) {
    sub_23CA258D0();
  }
  else {
    sub_23CA31384(a2, a3, a4, v8);
  }
}

void sub_23CA31384(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *(void **)(v4 + *(int *)(a4 + 48));
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a2;
  *(void *)(v9 + 24) = a3;
  v11[4] = sub_23CA32F40;
  v11[5] = v9;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 1107296256;
  v11[2] = sub_23CA315E4;
  v11[3] = &block_descriptor_12;
  id v10 = _Block_copy(v11);
  swift_retain();
  swift_release();
  objc_msgSend(v8, sel_requestDocument_completion_, a1, v10);
  _Block_release(v10);
}

uint64_t sub_23CA3147C(uint64_t a1, char a2)
{
  **(unsigned char **)(*(void *)(*(void *)(a1 + 32) + 64) + 40) = a2;
  return MEMORY[0x270FA2400]();
}

void sub_23CA314A0(void *a1, id a2, void (*a3)(void *, uint64_t))
{
  if (a1)
  {
    id v12 = a1;
    a3(a1, 0);
    uint64_t v5 = v12;
  }
  else
  {
    if (a2)
    {
      id v7 = a2;
    }
    else
    {
      sub_23CA46E00();
      id v8 = objc_allocWithZone(MEMORY[0x263F087E8]);
      uint64_t v9 = (void *)sub_23CA46DD0();
      swift_bridgeObjectRelease();
      id v7 = objc_msgSend(v8, sel_initWithDomain_code_userInfo_, v9, 0, 0);
    }
    id v10 = a2;
    id v11 = v7;
    a3(v7, 1);

    uint64_t v5 = v7;
  }
}

void sub_23CA315E4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_23CA31674()
{
  uint64_t result = sub_23CA46F30();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

char *sub_23CA31740(char *a1, char **a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = v6;
  int v8 = *(_DWORD *)(v6 + 80);
  uint64_t v9 = v8;
  if (*(_DWORD *)(v6 + 84)) {
    uint64_t v10 = *(void *)(v6 + 64);
  }
  else {
    uint64_t v10 = *(void *)(v6 + 64) + 1;
  }
  unint64_t v11 = ((((((((((v10 + 7 + ((v8 + 25) & ~(unint64_t)v8)) & 0xFFFFFFFFFFFFFFF8)
              + 23) & 0xFFFFFFFFFFFFFFF8)
            + 23) & 0xFFFFFFFFFFFFFFF8)
          + 15) & 0xFFFFFFFFFFFFFFF8)
        + 15) & 0xFFFFFFFFFFFFFFF8)
      + 9;
  int v12 = v8 & 0x100000;
  if (v9 > 7 || v12 != 0 || v11 > 0x18)
  {
    uint64_t v15 = *a2;
    *(void *)a1 = *a2;
    a1 = &v15[(v9 & 0xF8 ^ 0x1F8) & (v9 + 16)];
    swift_retain();
  }
  else
  {
    size_t __n = v10;
    uint64_t v37 = v10 + 7;
    uint64_t v16 = ~v9;
    uint64_t v17 = *a2;
    uint64_t v18 = (uint64_t)a2[1];
    uint64_t v19 = (uint64_t)a2[2];
    char v20 = *((unsigned char *)a2 + 24);
    sub_23CA319BC(*a2, v18, v19, v20);
    *(void *)a1 = v17;
    *((void *)a1 + 1) = v18;
    *((void *)a1 + 2) = v19;
    a1[24] = v20;
    if ((*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v7 + 48))(((unint64_t)a2 + v9 + 25) & ~v9, 1, v5))
    {
      memcpy((void *)((unint64_t)&a1[v9 + 25] & v16), (const void *)(((unint64_t)a2 + v9 + 25) & v16), __n);
    }
    else
    {
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v7 + 16))((unint64_t)&a1[v9 + 25] & v16, ((unint64_t)a2 + v9 + 25) & v16, v5);
      (*(void (**)(unint64_t, void, uint64_t, uint64_t))(v7 + 56))((unint64_t)&a1[v9 + 25] & v16, 0, 1, v5);
    }
    unint64_t v21 = (v37 + ((unint64_t)&a1[v9 + 25] & v16)) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v22 = (v37 + (((unint64_t)a2 + v9 + 25) & v16)) & 0xFFFFFFFFFFFFFFF8;
    *(unsigned char *)unint64_t v21 = *(unsigned char *)v22;
    *(void *)(v21 + 8) = *(void *)(v22 + 8);
    unint64_t v23 = (v21 + 23) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v24 = (v22 + 23) & 0xFFFFFFFFFFFFFFF8;
    *(unsigned char *)unint64_t v23 = *(unsigned char *)v24;
    *(void *)(v23 + 8) = *(void *)(v24 + 8);
    unint64_t v25 = (void *)((v23 + 23) & 0xFFFFFFFFFFFFFFF8);
    unint64_t v26 = (void **)((v24 + 23) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v27 = *v26;
    *unint64_t v25 = *v26;
    uint64_t v28 = (void *)(((unint64_t)v25 + 15) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v29 = (void *)(((unint64_t)v26 + 15) & 0xFFFFFFFFFFFFFFF8);
    void *v28 = *v29;
    unint64_t v30 = ((unint64_t)v28 + 15) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v31 = ((unint64_t)v29 + 15) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v32 = *(void *)v31;
    char v33 = *(unsigned char *)(v31 + 8);
    swift_retain();
    swift_retain();
    id v34 = v27;
    sub_23CA279F8(v32, v33);
    *(void *)unint64_t v30 = v32;
    *(unsigned char *)(v30 + 8) = v33;
  }
  return a1;
}

uint64_t sub_23CA319BC(void *a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a4)
  {
    id v5 = a1;
    uint64_t v4 = vars8;
  }
  return swift_retain();
}

uint64_t sub_23CA319FC(uint64_t a1, uint64_t a2)
{
  sub_23CA30C8C(*(void **)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(unsigned char *)(a1 + 24));
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t v6 = (a1 + *(unsigned __int8 *)(v5 + 80) + 25) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v5 + 48))(v6, 1, v4)) {
    (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v6, v4);
  }
  unint64_t v7 = v6 + *(void *)(v5 + 64);
  if (!*(_DWORD *)(v5 + 84)) {
    ++v7;
  }
  unint64_t v8 = (v7 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  swift_release();
  uint64_t v9 = (id *)((((v8 + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8);

  unint64_t v10 = ((((unint64_t)v9 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v11 = *(void *)v10;
  char v12 = *(unsigned char *)(v10 + 8);

  return sub_23CA25180(v11, v12);
}

uint64_t sub_23CA31B20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = *(void **)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  uint64_t v8 = *(void *)(a2 + 16);
  char v9 = *(unsigned char *)(a2 + 24);
  sub_23CA319BC(*(void **)a2, v7, v8, v9);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(void *)(a1 + 16) = v8;
  *(unsigned char *)(a1 + 24) = v9;
  uint64_t v10 = *(void *)(a3 + 16);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned __int8 *)(v11 + 80);
  unint64_t v13 = (void *)((v12 + 25 + a1) & ~v12);
  unint64_t v14 = (const void *)((v12 + 25 + a2) & ~v12);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v14, 1, v10))
  {
    int v15 = *(_DWORD *)(v11 + 84);
    size_t v16 = *(void *)(v11 + 64);
    if (v15) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v16 + 1;
    }
    memcpy(v13, v14, v17);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v13, v14, v10);
    uint64_t v19 = *(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56);
    uint64_t v18 = v11 + 56;
    v19(v13, 0, 1, v10);
    int v15 = *(_DWORD *)(v18 + 28);
    size_t v16 = *(void *)(v18 + 8);
  }
  if (v15) {
    size_t v20 = v16;
  }
  else {
    size_t v20 = v16 + 1;
  }
  unint64_t v21 = ((unint64_t)v13 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v22 = ((unint64_t)v14 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v21 = *(unsigned char *)v22;
  *(void *)(v21 + 8) = *(void *)(v22 + 8);
  unint64_t v23 = (v21 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v24 = (v22 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v23 = *(unsigned char *)v24;
  *(void *)(v23 + 8) = *(void *)(v24 + 8);
  unint64_t v25 = (void *)((v23 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v26 = (void **)((v24 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v27 = *v26;
  *unint64_t v25 = *v26;
  uint64_t v28 = (void *)(((unint64_t)v25 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v29 = (void *)(((unint64_t)v26 + 15) & 0xFFFFFFFFFFFFFFF8);
  void *v28 = *v29;
  unint64_t v30 = ((unint64_t)v28 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v31 = ((unint64_t)v29 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v32 = *(void *)v31;
  char v33 = *(unsigned char *)(v31 + 8);
  swift_retain();
  swift_retain();
  id v34 = v27;
  sub_23CA279F8(v32, v33);
  *(void *)unint64_t v30 = v32;
  *(unsigned char *)(v30 + 8) = v33;
  return a1;
}

uint64_t sub_23CA31D10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = *(void **)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  uint64_t v8 = *(void *)(a2 + 16);
  char v9 = *(unsigned char *)(a2 + 24);
  sub_23CA319BC(*(void **)a2, v7, v8, v9);
  uint64_t v10 = *(void **)a1;
  uint64_t v11 = *(void *)(a1 + 8);
  uint64_t v12 = *(void *)(a1 + 16);
  char v13 = *(unsigned char *)(a1 + 24);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(void *)(a1 + 16) = v8;
  *(unsigned char *)(a1 + 24) = v9;
  sub_23CA30C8C(v10, v11, v12, v13);
  uint64_t v14 = *(void *)(a3 + 16);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(unsigned __int8 *)(v15 + 80);
  size_t v17 = (void *)((v16 + 25 + a1) & ~v16);
  uint64_t v18 = (void *)((v16 + 25 + a2) & ~v16);
  uint64_t v19 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v15 + 48);
  LODWORD(v8) = v19(v17, 1, v14);
  int v20 = v19(v18, 1, v14);
  if (v8)
  {
    if (!v20)
    {
      (*(void (**)(void *, void *, uint64_t))(v15 + 16))(v17, v18, v14);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v17, 0, 1, v14);
      goto LABEL_12;
    }
    int v21 = *(_DWORD *)(v15 + 84);
    size_t v22 = *(void *)(v15 + 64);
  }
  else
  {
    if (!v20)
    {
      (*(void (**)(void *, void *, uint64_t))(v15 + 24))(v17, v18, v14);
      goto LABEL_12;
    }
    (*(void (**)(void *, uint64_t))(v15 + 8))(v17, v14);
    int v21 = *(_DWORD *)(v15 + 84);
    size_t v22 = *(void *)(v15 + 64);
  }
  if (v21) {
    size_t v23 = v22;
  }
  else {
    size_t v23 = v22 + 1;
  }
  memcpy(v17, v18, v23);
LABEL_12:
  if (*(_DWORD *)(v15 + 84)) {
    uint64_t v24 = *(void *)(v15 + 64);
  }
  else {
    uint64_t v24 = *(void *)(v15 + 64) + 1;
  }
  unint64_t v25 = ((unint64_t)v17 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v26 = ((unint64_t)v18 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v25 = *(unsigned char *)v26;
  *(void *)(v25 + 8) = *(void *)(v26 + 8);
  swift_retain();
  swift_release();
  unint64_t v27 = (v25 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v28 = (v26 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v27 = *(unsigned char *)v28;
  *(void *)(v27 + 8) = *(void *)(v28 + 8);
  swift_retain();
  swift_release();
  unint64_t v29 = (v27 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v30 = (v28 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v31 = *(void **)v30;
  v30 += 15;
  uint64_t v32 = *(void **)v29;
  *(void *)unint64_t v29 = v31;
  v29 += 15;
  id v33 = v31;

  unint64_t v34 = (v30 & 0xFFFFFFFFFFFFFFF8) + 15;
  *(void *)(v29 & 0xFFFFFFFFFFFFFFF8) = *(void *)(v30 & 0xFFFFFFFFFFFFFFF8);
  unint64_t v35 = ((v29 & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v36 = *(void *)(v34 & 0xFFFFFFFFFFFFFFF8);
  LOBYTE(v30) = *(unsigned char *)((v34 & 0xFFFFFFFFFFFFFFF8) + 8);
  sub_23CA279F8(v36, v30);
  uint64_t v37 = *(void *)v35;
  char v38 = *(unsigned char *)(v35 + 8);
  *(void *)unint64_t v35 = v36;
  *(unsigned char *)(v35 + 8) = v30;
  sub_23CA25180(v37, v38);
  return a1;
}

_OWORD *sub_23CA31FAC(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  *(_OWORD *)((char *)a1 + 9) = *(_OWORD *)((char *)a2 + 9);
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = (void *)(((unint64_t)a1 + v6 + 25) & ~v6);
  uint64_t v8 = (const void *)(((unint64_t)a2 + v6 + 25) & ~v6);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(v8, 1, v4))
  {
    int v9 = *(_DWORD *)(v5 + 84);
    size_t v10 = *(void *)(v5 + 64);
    if (v9) {
      size_t v11 = v10;
    }
    else {
      size_t v11 = v10 + 1;
    }
    memcpy(v7, v8, v11);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 32))(v7, v8, v4);
    char v13 = *(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56);
    uint64_t v12 = v5 + 56;
    v13(v7, 0, 1, v4);
    int v9 = *(_DWORD *)(v12 + 28);
    size_t v10 = *(void *)(v12 + 8);
  }
  if (v9) {
    size_t v14 = v10;
  }
  else {
    size_t v14 = v10 + 1;
  }
  uint64_t v15 = (_OWORD *)(((unint64_t)v7 + v14 + 7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v16 = (_OWORD *)(((unint64_t)v8 + v14 + 7) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v15 = *v16;
  size_t v17 = (_OWORD *)(((unint64_t)v15 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v18 = (_OWORD *)(((unint64_t)v16 + 23) & 0xFFFFFFFFFFFFFFF8);
  *size_t v17 = *v18;
  uint64_t v19 = (void *)(((unint64_t)v17 + 23) & 0xFFFFFFFFFFFFFFF8);
  int v20 = (void *)(((unint64_t)v18 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v19 = *v20;
  int v21 = (void *)(((unint64_t)v19 + 15) & 0xFFFFFFFFFFFFFFF8);
  size_t v22 = (void *)(((unint64_t)v20 + 15) & 0xFFFFFFFFFFFFFFF8);
  *int v21 = *v22;
  unint64_t v23 = ((unint64_t)v22 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v24 = *(void *)v23;
  unint64_t v25 = ((unint64_t)v21 + 15) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)(v25 + 8) = *(unsigned char *)(v23 + 8);
  *(void *)unint64_t v25 = v24;
  return a1;
}

uint64_t sub_23CA32148(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 16);
  char v7 = *(unsigned char *)(a2 + 24);
  uint64_t v8 = *(void **)a1;
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 16);
  char v11 = *(unsigned char *)(a1 + 24);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v6;
  *(unsigned char *)(a1 + 24) = v7;
  sub_23CA30C8C(v8, v9, v10, v11);
  uint64_t v12 = *(void *)(a3 + 16);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v15 = (void *)((v14 + 25 + a1) & ~v14);
  uint64_t v16 = (void *)((v14 + 25 + a2) & ~v14);
  size_t v17 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v13 + 48);
  int v18 = v17(v15, 1, v12);
  int v19 = v17(v16, 1, v12);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(void *, void *, uint64_t))(v13 + 32))(v15, v16, v12);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v15, 0, 1, v12);
      goto LABEL_12;
    }
    int v20 = *(_DWORD *)(v13 + 84);
    size_t v21 = *(void *)(v13 + 64);
  }
  else
  {
    if (!v19)
    {
      (*(void (**)(void *, void *, uint64_t))(v13 + 40))(v15, v16, v12);
      goto LABEL_12;
    }
    (*(void (**)(void *, uint64_t))(v13 + 8))(v15, v12);
    int v20 = *(_DWORD *)(v13 + 84);
    size_t v21 = *(void *)(v13 + 64);
  }
  if (v20) {
    size_t v22 = v21;
  }
  else {
    size_t v22 = v21 + 1;
  }
  memcpy(v15, v16, v22);
LABEL_12:
  if (*(_DWORD *)(v13 + 84)) {
    uint64_t v23 = *(void *)(v13 + 64);
  }
  else {
    uint64_t v23 = *(void *)(v13 + 64) + 1;
  }
  unint64_t v24 = ((unint64_t)v15 + v23 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v25 = ((unint64_t)v16 + v23 + 7) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v24 = *(unsigned char *)v25;
  *(void *)(v24 + 8) = *(void *)(v25 + 8);
  swift_release();
  unint64_t v26 = (v24 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v27 = (v25 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v26 = *(unsigned char *)v27;
  *(void *)(v26 + 8) = *(void *)(v27 + 8);
  swift_release();
  unint64_t v28 = (v26 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v29 = (v27 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v30 = *(void *)v29;
  v29 += 15;
  unint64_t v31 = *(void **)v28;
  *(void *)unint64_t v28 = v30;
  v28 += 15;

  *(void *)(v28 & 0xFFFFFFFFFFFFFFF8) = *(void *)(v29 & 0xFFFFFFFFFFFFFFF8);
  unint64_t v32 = ((v28 & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v33 = ((v29 & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v34 = *(void *)v33;
  LOBYTE(v33) = *(unsigned char *)(v33 + 8);
  uint64_t v35 = *(void *)v32;
  char v36 = *(unsigned char *)(v32 + 8);
  *(void *)unint64_t v32 = v34;
  *(unsigned char *)(v32 + 8) = v33;
  sub_23CA25180(v35, v36);
  return a1;
}

uint64_t sub_23CA323B0(unsigned __int8 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = v4;
  int v6 = *(_DWORD *)(v4 + 84);
  if (v6) {
    unsigned int v7 = v6 - 1;
  }
  else {
    unsigned int v7 = 0;
  }
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = v7;
  }
  uint64_t v9 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v10 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  if (!v6) {
    ++v10;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v11 = v10 + 7;
  if (v8 < a2)
  {
    unint64_t v12 = ((((((((((v11 + ((v9 + 25) & ~v9)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
            + 15) & 0xFFFFFFFFFFFFFFF8)
          + 15) & 0xFFFFFFFFFFFFFFF8)
        + 9;
    unsigned int v13 = (a2 - v8 + 255) >> (8 * v12);
    if (v12 < 4) {
      unsigned int v14 = v13 + 1;
    }
    else {
      unsigned int v14 = 2;
    }
    if (v14 >= 0x10000) {
      LODWORD(v15) = 4;
    }
    else {
      LODWORD(v15) = 2;
    }
    if (v14 < 0x100) {
      LODWORD(v15) = 1;
    }
    if (v14 >= 2) {
      uint64_t v15 = v15;
    }
    else {
      uint64_t v15 = 0;
    }
    switch(v15)
    {
      case 1:
        int v16 = a1[v12];
        if (!a1[v12]) {
          break;
        }
        goto LABEL_27;
      case 2:
        int v16 = *(unsigned __int16 *)&a1[v12];
        if (*(_WORD *)&a1[v12]) {
          goto LABEL_27;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x23CA325A0);
      case 4:
        int v16 = *(_DWORD *)&a1[v12];
        if (!v16) {
          break;
        }
LABEL_27:
        int v18 = (v16 - 1) << (8 * v12);
        if (v12 >= 4) {
          int v18 = 0;
        }
        if (((((((((((v11 + ((v9 + 25) & ~v9)) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8)
               + 15) & 0xFFFFFFF8)
             + 15) & 0xFFFFFFF8) == 0xFFFFFFF8)
          int v19 = *a1;
        else {
          int v19 = *(_DWORD *)a1;
        }
        return v8 + (v19 | v18) + 1;
      default:
        break;
    }
  }
  uint64_t v20 = (unint64_t)&a1[v9 + 25] & ~v9;
  if (v7 < 0x7FFFFFFF)
  {
    unint64_t v22 = *(void *)((((((v11 + v20) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8);
    if (v22 >= 0xFFFFFFFF) {
      LODWORD(v22) = -1;
    }
    return (v22 + 1);
  }
  else
  {
    unsigned int v21 = (*(uint64_t (**)(uint64_t))(v5 + 48))(v20);
    if (v21 >= 2) {
      return v21 - 1;
    }
    else {
      return 0;
    }
  }
}

void sub_23CA325B4(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6 = 0;
  uint64_t v7 = *(void *)(*(void *)(a4 + 16) - 8);
  int v8 = *(_DWORD *)(v7 + 84);
  unsigned int v9 = v8 - 1;
  if (!v8) {
    unsigned int v9 = 0;
  }
  if (v9 <= 0x7FFFFFFF) {
    unsigned int v10 = 0x7FFFFFFF;
  }
  else {
    unsigned int v10 = v9;
  }
  uint64_t v11 = *(unsigned __int8 *)(v7 + 80);
  size_t v12 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  if (!v8) {
    ++v12;
  }
  size_t v13 = ((((((((((v12 + 7 + ((v11 + 25) & ~v11)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
          + 15) & 0xFFFFFFFFFFFFFFF8)
        + 15) & 0xFFFFFFFFFFFFFFF8)
      + 9;
  char v14 = 8 * v13;
  if (v10 < a3)
  {
    unsigned int v15 = (a3 - v10 + 255) >> v14;
    if (v13 <= 3) {
      unsigned int v16 = v15 + 1;
    }
    else {
      unsigned int v16 = 2;
    }
    if (v16 >= 0x10000) {
      int v17 = 4;
    }
    else {
      int v17 = 2;
    }
    if (v16 < 0x100) {
      int v17 = 1;
    }
    if (v16 >= 2) {
      int v6 = v17;
    }
    else {
      int v6 = 0;
    }
  }
  if (v10 < a2)
  {
    if (v13 < 4) {
      unsigned int v18 = ((~v10 + a2) >> v14) + 1;
    }
    else {
      unsigned int v18 = 1;
    }
    if (v13 >= 4) {
      int v19 = ~v10 + a2;
    }
    else {
      int v19 = (~(_BYTE)v10 + a2);
    }
    bzero(a1, v13);
    if (v13 == 1) {
      *a1 = v19;
    }
    else {
      *(_DWORD *)a1 = v19;
    }
    switch(v6)
    {
      case 1:
        a1[v13] = v18;
        return;
      case 2:
        *(_WORD *)&a1[v13] = v18;
        return;
      case 3:
        goto LABEL_63;
      case 4:
        *(_DWORD *)&a1[v13] = v18;
        return;
      default:
        return;
    }
  }
  switch(v6)
  {
    case 1:
      a1[v13] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_37;
    case 2:
      *(_WORD *)&a1[v13] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_37;
    case 3:
LABEL_63:
      __break(1u);
      JUMPOUT(0x23CA328ACLL);
    case 4:
      *(_DWORD *)&a1[v13] = 0;
      goto LABEL_36;
    default:
LABEL_36:
      if (a2)
      {
LABEL_37:
        unint64_t v20 = (unint64_t)&a1[v11 + 25] & ~v11;
        if (v9 < 0x7FFFFFFF)
        {
          if ((a2 & 0x80000000) != 0) {
            uint64_t v24 = a2 ^ 0x80000000;
          }
          else {
            uint64_t v24 = a2 - 1;
          }
          *(void *)((((((v12 + 7 + v20) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) = v24;
        }
        else if (v9 >= a2)
        {
          uint64_t v25 = a2 + 1;
          unint64_t v26 = *(void (**)(unint64_t, uint64_t))(v7 + 56);
          unint64_t v27 = (unint64_t)&a1[v11 + 25] & ~v11;
          v26(v27, v25);
        }
        else
        {
          if (v12 <= 3) {
            int v21 = ~(-1 << (8 * v12));
          }
          else {
            int v21 = -1;
          }
          if (v12)
          {
            int v22 = v21 & (~v9 + a2);
            if (v12 <= 3) {
              int v23 = v12;
            }
            else {
              int v23 = 4;
            }
            bzero((void *)((unint64_t)&a1[v11 + 25] & ~v11), v12);
            switch(v23)
            {
              case 2:
                *(_WORD *)unint64_t v20 = v22;
                break;
              case 3:
                *(_WORD *)unint64_t v20 = v22;
                *(unsigned char *)(v20 + 2) = BYTE2(v22);
                break;
              case 4:
                *(_DWORD *)unint64_t v20 = v22;
                break;
              default:
                *(unsigned char *)unint64_t v20 = v22;
                break;
            }
          }
        }
      }
      return;
  }
}

uint64_t sub_23CA328E4()
{
  return swift_getWitnessTable();
}

uint64_t sub_23CA32A1C(uint64_t a1)
{
  return sub_23CA30C8C(*(void **)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(unsigned char *)(a1 + 24));
}

uint64_t sub_23CA32A30(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_23CA319BC(*(void **)a2, v4, v5, v6);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  return a1;
}

uint64_t sub_23CA32A90(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_23CA319BC(*(void **)a2, v4, v5, v6);
  uint64_t v7 = *(void **)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  char v10 = *(unsigned char *)(a1 + 24);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  sub_23CA30C8C(v7, v8, v9, v10);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_23CA32B14(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  char v4 = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void **)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  char v8 = *(unsigned char *)(a1 + 24);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  *(unsigned char *)(a1 + 24) = v4;
  sub_23CA30C8C(v5, v7, v6, v8);
  return a1;
}

uint64_t sub_23CA32B64(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t sub_23CA32BAC(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 24) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_23CA32BF4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 24);
}

uint64_t sub_23CA32BFC(uint64_t result, char a2)
{
  *(unsigned char *)(result + 24) = a2 & 1;
  return result;
}

uint64_t type metadata accessor for VerifyIdentityWithWalletButton.Configuration()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_23CA32C28(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3218);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23CA32C88()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = (int *)type metadata accessor for VerifyIdentityWithWalletButton();
  uint64_t v3 = *(unsigned __int8 *)(*((void *)v2 - 1) + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = *(void *)(*((void *)v2 - 1) + 64);
  uint64_t v6 = v0 + v4;
  sub_23CA30C8C(*(void **)(v0 + v4), *(void *)(v0 + v4 + 8), *(void *)(v0 + v4 + 16), *(unsigned char *)(v0 + v4 + 24));
  uint64_t v7 = v0 + v4 + v2[9];
  uint64_t v8 = *(void *)(v1 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v7, 1, v1)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v1);
  }
  unint64_t v9 = (v5 + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  swift_release();

  sub_23CA25180(*(void *)(v6 + v2[14]), *(unsigned char *)(v6 + v2[14] + 8));
  swift_release();

  return MEMORY[0x270FA0238](v0, ((v9 + 15) & 0xFFFFFFFFFFFFFFF8) + 16, v3 | 7);
}

void sub_23CA32E38()
{
  uint64_t v1 = *(void *)(type metadata accessor for VerifyIdentityWithWalletButton() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v4 = v0 + v2;
  uint64_t v5 = *(void *)(v0 + v3);
  uint64_t v6 = (uint64_t *)(v0 + ((v3 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v7 = *v6;
  uint64_t v8 = v6[1];

  sub_23CA312E4(v4, v5, v7, v8);
}

uint64_t sub_23CA32EF8@<X0>(char *a1@<X8>)
{
  return sub_23CA2ED40(a1);
}

uint64_t sub_23CA32F08()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_23CA32F40(void *a1, void *a2)
{
  sub_23CA314A0(a1, a2, *(void (**)(void *, uint64_t))(v2 + 16));
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

id sub_23CA32FE8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AddPassButtonView.Coordinator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AddPassButtonView.Coordinator()
{
  return self;
}

uint64_t destroy for AddPassButtonView()
{
  return swift_release();
}

void *_s16_PassKit_SwiftUI17AddPassButtonViewVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  uint64_t v4 = a2[2];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = v4;
  swift_retain();
  return a1;
}

void *assignWithCopy for AddPassButtonView(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[2];
  a1[1] = a2[1];
  a1[2] = v3;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for AddPassButtonView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AddPassButtonView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AddPassButtonView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AddPassButtonView()
{
  return &type metadata for AddPassButtonView;
}

id sub_23CA331C8()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F5C948]), sel_initWithAddPassButtonStyle_, *v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3360);
  sub_23CA46B50();
  objc_msgSend(v1, sel_addTarget_action_forControlEvents_, v3, sel_callback, 0x2000);

  objc_msgSend(v1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  return v1;
}

id sub_23CA33274@<X0>(void *a1@<X8>)
{
  uint64_t v4 = *(void *)(v1 + 8);
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v5 = (objc_class *)type metadata accessor for AddPassButtonView.Coordinator();
  uint64_t v6 = (char *)objc_allocWithZone(v5);
  uint64_t v7 = &v6[OBJC_IVAR____TtCV16_PassKit_SwiftUI17AddPassButtonView11Coordinator_action];
  *(void *)uint64_t v7 = v4;
  *((void *)v7 + 1) = v3;
  v9.receiver = v6;
  v9.super_class = v5;
  swift_retain();
  id result = objc_msgSendSuper2(&v9, sel_init);
  *a1 = result;
  return result;
}

unint64_t sub_23CA332E8(uint64_t a1)
{
  unint64_t result = sub_23CA33310();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23CA33310()
{
  unint64_t result = qword_268BC3358;
  if (!qword_268BC3358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC3358);
  }
  return result;
}

uint64_t sub_23CA33364(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_23CA33310();

  return MEMORY[0x270F01780](a1, a2, a3, v6);
}

uint64_t sub_23CA333C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_23CA33310();

  return MEMORY[0x270F01718](a1, a2, a3, v6);
}

void sub_23CA3342C()
{
}

void static AddPassToWalletButtonStyle.black.getter(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

void static AddPassToWalletButtonStyle.blackOutline.getter(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

BOOL sub_23CA33468(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23CA33480()
{
  return sub_23CA47030();
}

uint64_t sub_23CA334C8()
{
  return sub_23CA47020();
}

uint64_t sub_23CA334F4()
{
  return sub_23CA47030();
}

uint64_t View.addPassToWalletButtonStyle(_:)()
{
  return swift_release();
}

uint64_t sub_23CA335AC()
{
  sub_23CA33A1C();

  return sub_23CA46A30();
}

uint64_t sub_23CA335F4@<X0>(unsigned char *a1@<X8>)
{
  sub_23CA33A1C();
  uint64_t result = sub_23CA46A30();
  *a1 = v3;
  return result;
}

uint64_t sub_23CA33644@<X0>(unsigned char *a1@<X8>)
{
  sub_23CA33A1C();
  uint64_t result = sub_23CA46A30();
  *a1 = v3;
  return result;
}

uint64_t sub_23CA33694()
{
  return sub_23CA46A40();
}

uint64_t sub_23CA336E0()
{
  return sub_23CA46A40();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for AddPassToWalletButtonStyle()
{
  return &type metadata for AddPassToWalletButtonStyle;
}

uint64_t sub_23CA33750()
{
  return swift_getWitnessTable();
}

unint64_t sub_23CA337C0()
{
  unint64_t result = qword_268BC3370;
  if (!qword_268BC3370)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC3368);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC3370);
  }
  return result;
}

uint64_t _s16_PassKit_SwiftUI26AddPassToWalletButtonStyleV18AddPassButtonStyleOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s16_PassKit_SwiftUI26AddPassToWalletButtonStyleV18AddPassButtonStyleOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x23CA33978);
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

uint64_t sub_23CA339A0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_23CA339A8(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AddPassToWalletButtonStyle.AddPassButtonStyle()
{
  return &type metadata for AddPassToWalletButtonStyle.AddPassButtonStyle;
}

unint64_t sub_23CA339C8()
{
  unint64_t result = qword_268BC3378;
  if (!qword_268BC3378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC3378);
  }
  return result;
}

unint64_t sub_23CA33A1C()
{
  unint64_t result = qword_268BC3380;
  if (!qword_268BC3380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC3380);
  }
  return result;
}

ValueMetadata *type metadata accessor for AddPassToWalletButtonStyleKey()
{
  return &type metadata for AddPassToWalletButtonStyleKey;
}

void sub_23CA33A80(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

id sub_23CA33A8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4 = &v3[OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onMerchantSessionRequested];
  *(void *)unsigned int v4 = 0;
  *((void *)v4 + 1) = 0;
  uint64_t v5 = &v3[OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onPaymentAuthorizationCompletion];
  *(void *)uint64_t v5 = 0;
  *((void *)v5 + 1) = 0;
  uint64_t v6 = MEMORY[0x263F8EE78];
  *(void *)&v3[OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onPaymentMethodChange] = MEMORY[0x263F8EE78];
  *(void *)&v3[OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onShippingContactChange] = v6;
  *(void *)&v3[OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onShippingChange] = v6;
  *(void *)&v3[OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onCouponCodeChange] = v6;
  *(void *)&v3[OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_activeWindow] = 0;
  *(void *)&v3[OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_underlyingCoordinator] = 0;
  *(void *)&v3[OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_request] = a1;
  BOOL v7 = &v3[OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onPaymentAuthorizationChange];
  *(void *)BOOL v7 = a2;
  *((void *)v7 + 1) = a3;
  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for PaymentAuthorizationCoordinator();
  return objc_msgSendSuper2(&v9, sel_init);
}

void sub_23CA33B4C()
{
  uint64_t v1 = OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_underlyingCoordinator;
  if (!*(void *)(v0 + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_underlyingCoordinator))
  {
    if (*(void *)(v0 + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_activeWindow))
    {
      id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F5C998]), sel_initWithPaymentRequest_, *(void *)(v0 + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_request));
      int v3 = *(void **)(v0 + v1);
      *(void *)(v0 + v1) = v2;

      unsigned int v4 = *(void **)(v0 + v1);
      if (v4)
      {
        objc_msgSend(v4, sel_setDelegate_, v0);
        uint64_t v5 = *(void **)(v0 + v1);
        if (v5)
        {
          uint64_t v6 = swift_allocObject();
          swift_unknownObjectWeakInit();
          v9[4] = sub_23CA38B98;
          v9[5] = v6;
          v9[0] = MEMORY[0x263EF8330];
          v9[1] = 1107296256;
          v9[2] = sub_23CA33DF0;
          v9[3] = &block_descriptor_0;
          BOOL v7 = _Block_copy(v9);
          id v8 = v5;
          swift_release();
          objc_msgSend(v8, sel_presentWithCompletion_, v7);
          _Block_release(v7);
        }
      }
    }
    else
    {
      sub_23CA33CD0();
    }
  }
}

void sub_23CA33CD0()
{
  uint64_t v1 = v0;
  id v2 = *(void (**)(void *))(v0
                                       + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onPaymentAuthorizationChange);
  v7[1] = 0;
  v7[2] = 0;
  v7[0] = 1;
  v2(v7);
  int v3 = *(void (**)(uint64_t))(v0
                                      + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onPaymentAuthorizationCompletion);
  if (v3)
  {
    uint64_t v4 = swift_retain();
    v3(v4);
    sub_23CA25258((uint64_t)v3);
  }
  uint64_t v5 = OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_underlyingCoordinator;
  uint64_t v6 = *(void **)(v1 + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_underlyingCoordinator);
  if (v6)
  {
    objc_msgSend(v6, sel_dismissWithCompletion_, 0);
    uint64_t v6 = *(void **)(v1 + v5);
  }
  *(void *)(v1 + v5) = 0;
}

void sub_23CA33D94(char a1, uint64_t a2)
{
  if ((a1 & 1) == 0)
  {
    uint64_t v2 = a2 + 16;
    swift_beginAccess();
    uint64_t v3 = MEMORY[0x23ECEEDF0](v2);
    if (v3)
    {
      uint64_t v4 = (void *)v3;
      sub_23CA33CD0();
    }
  }
}

uint64_t sub_23CA33DF0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

id sub_23CA33E44()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_request);
  id v2 = objc_msgSend(v1, sel_supportedNetworks);
  type metadata accessor for PKPaymentNetwork(0);
  uint64_t v3 = sub_23CA46E40();

  uint64_t v4 = *(void *)(v3 + 16);
  swift_bridgeObjectRelease();
  if (!v4 && !objc_msgSend(v1, sel_merchantCapabilities)) {
    return objc_msgSend(self, sel_canMakePayments);
  }
  id v5 = objc_msgSend(v1, sel_supportedNetworks);
  if (!v5)
  {
    sub_23CA46E40();
    id v5 = (id)sub_23CA46E30();
    swift_bridgeObjectRelease();
  }
  id v6 = objc_msgSend(self, sel_canMakePaymentsUsingNetworks_capabilities_, v5, objc_msgSend(v1, sel_merchantCapabilities));

  return v6;
}

id sub_23CA33FA8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PaymentAuthorizationCoordinator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for PaymentAuthorizationCoordinator()
{
  return self;
}

uint64_t sub_23CA340D8(uint64_t a1)
{
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = v1;
  return MEMORY[0x270FA2498](sub_23CA340F8, 0, 0);
}

uint64_t sub_23CA340F8()
{
  uint64_t v1 = *(void **)(v0[6] + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onPaymentMethodChange);
  v0[7] = v1;
  uint64_t v2 = v1[2];
  v0[8] = v2;
  if (v2)
  {
    v0[2] = MEMORY[0x263F8EE78];
    v0[9] = 0;
    uint64_t v3 = v0[5];
    v0[10] = v1[5];
    uint64_t v4 = (int *)v1[4];
    swift_bridgeObjectRetain();
    v0[3] = v3;
    uint64_t v11 = (int *)((char *)v4 + *v4);
    swift_retain();
    id v5 = (void *)swift_task_alloc();
    v0[11] = v5;
    void *v5 = v0;
    v5[1] = sub_23CA342D4;
    return ((uint64_t (*)(void *, void *))v11)(v0 + 4, v0 + 3);
  }
  else
  {
    id v7 = objc_allocWithZone(MEMORY[0x263F5C088]);
    sub_23CA37D1C(0, &qword_268BC34A0);
    id v8 = (void *)sub_23CA46E30();
    id v9 = objc_msgSend(v7, sel_initWithErrors_paymentSummaryItems_, 0, v8);

    char v10 = (uint64_t (*)(id))v0[1];
    return v10(v9);
  }
}

uint64_t sub_23CA342D4()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  *(void *)(v1 + 96) = *(void *)(v1 + 32);
  return MEMORY[0x270FA2498](sub_23CA3440C, 0, 0);
}

id sub_23CA3440C()
{
  id result = objc_msgSend(*(id *)(v0 + 96), sel_errors);
  if (!result)
  {
    __break(1u);
    return result;
  }
  uint64_t v2 = result;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3498);
  uint64_t v3 = sub_23CA46E40();

  uint64_t v4 = *(void *)(v3 + 16);
  swift_bridgeObjectRelease();
  if (v4 || objc_msgSend(*(id *)(v0 + 96), sel_status))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v5 = *(id *)(v0 + 96);
LABEL_5:
    id v6 = *(uint64_t (**)(id))(v0 + 8);
    return (id)v6(v5);
  }
  id v7 = *(void **)(v0 + 96);
  uint64_t v8 = *(void *)(v0 + 64);
  uint64_t v9 = *(void *)(v0 + 72) + 1;
  id v10 = objc_msgSend(v7, sel_paymentSummaryItems);
  sub_23CA37D1C(0, &qword_268BC34A0);
  unint64_t v11 = sub_23CA46E40();

  sub_23CA346CC(v11, sub_23CA37F7C);
  if (v9 == v8)
  {
    swift_bridgeObjectRelease();
    id v12 = objc_allocWithZone(MEMORY[0x263F5C088]);
    size_t v13 = (void *)sub_23CA46E30();
    swift_bridgeObjectRelease();
    id v5 = objc_msgSend(v12, sel_initWithErrors_paymentSummaryItems_, 0, v13);

    goto LABEL_5;
  }
  uint64_t v14 = *(void *)(v0 + 72) + 1;
  *(void *)(v0 + 72) = v14;
  uint64_t v15 = *(void *)(v0 + 40);
  uint64_t v16 = *(void *)(v0 + 56) + 16 * v14;
  *(void *)(v0 + 80) = *(void *)(v16 + 40);
  int v17 = *(int **)(v16 + 32);
  *(void *)(v0 + 24) = v15;
  int v19 = (uint64_t (*)(uint64_t, uint64_t))((char *)v17 + *v17);
  swift_retain();
  unsigned int v18 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v18;
  *unsigned int v18 = v0;
  v18[1] = sub_23CA342D4;
  return (id)v19(v0 + 32, v0 + 24);
}

uint64_t sub_23CA346CC(unint64_t a1, uint64_t (*a2)(uint64_t, void, unint64_t))
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_23CA46FC0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v6 = *v2;
  if (*v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_23CA46FC0();
    swift_bridgeObjectRelease();
    uint64_t v8 = v7 + v5;
    if (!__OFADD__(v7, v5)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v8 = v7 + v5;
  if (__OFADD__(v7, v5)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v6 = *v2;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v2 = v6;
  uint64_t v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
  {
    uint64_t v10 = v6 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v7 = 1;
  }
  if (v6 >> 62) {
    goto LABEL_27;
  }
  uint64_t v11 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v11 <= v8) {
      uint64_t v11 = v8;
    }
    swift_bridgeObjectRetain();
    unint64_t v6 = MEMORY[0x23ECEE690](v7, v11, 1, v6);
    swift_bridgeObjectRelease();
    *uint64_t v2 = v6;
    uint64_t v10 = v6 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t v12 = a2(v10 + 8 * *(void *)(v10 + 16) + 32, (*(void *)(v10 + 24) >> 1) - *(void *)(v10 + 16), a1);
    if (v13 >= v5) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_23CA46FC0();
    swift_bridgeObjectRelease();
  }
  if (v13 >= 1)
  {
    uint64_t v14 = *(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v15 = __OFADD__(v14, v13);
    uint64_t v16 = v14 + v13;
    if (v15)
    {
      __break(1u);
      return MEMORY[0x270F9DBB8](v12);
    }
    *(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10) = v16;
  }
  uint64_t v12 = swift_bridgeObjectRelease();

  return MEMORY[0x270F9DBB8](v12);
}

void *sub_23CA348A0(void *result)
{
  uint64_t v2 = result[2];
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  unint64_t v6 = result;
  id result = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (result && v5 <= v3[3] >> 1)
  {
    if (v6[2]) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
  if (v4 <= v5) {
    int64_t v10 = v4 + v2;
  }
  else {
    int64_t v10 = v4;
  }
  id result = sub_23CA3DDF0(result, v10, 1, v3);
  uint64_t v3 = result;
  if (!v6[2])
  {
LABEL_13:
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
LABEL_5:
  if ((v3[3] >> 1) - v3[2] < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_268BC3570);
  id result = (void *)swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    id result = (void *)swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v7 = v3[2];
  BOOL v8 = __OFADD__(v7, v2);
  uint64_t v9 = v7 + v2;
  if (!v8)
  {
    v3[2] = v9;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_23CA3499C(uint64_t a1)
{
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = v1;
  return MEMORY[0x270FA2498](sub_23CA349BC, 0, 0);
}

uint64_t sub_23CA349BC()
{
  uint64_t v1 = *(void **)(v0[7] + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onShippingContactChange);
  v0[8] = v1;
  uint64_t v2 = v1[2];
  v0[9] = v2;
  if (v2)
  {
    uint64_t v3 = MEMORY[0x263F8EE78];
    v0[2] = MEMORY[0x263F8EE78];
    v0[3] = v3;
    v0[10] = 0;
    uint64_t v4 = v0[6];
    v0[11] = v1[5];
    int64_t v5 = (int *)v1[4];
    swift_bridgeObjectRetain();
    v0[4] = v4;
    uint64_t v13 = (int *)((char *)v5 + *v5);
    swift_retain();
    unint64_t v6 = (void *)swift_task_alloc();
    v0[12] = v6;
    void *v6 = v0;
    v6[1] = sub_23CA34BCC;
    return ((uint64_t (*)(void *, void *))v13)(v0 + 5, v0 + 4);
  }
  else
  {
    id v8 = objc_allocWithZone(MEMORY[0x263F5C090]);
    sub_23CA37D1C(0, &qword_268BC34A0);
    uint64_t v9 = (void *)sub_23CA46E30();
    sub_23CA37D1C(0, &qword_268BC34A8);
    int64_t v10 = (void *)sub_23CA46E30();
    id v11 = objc_msgSend(v8, sel_initWithErrors_paymentSummaryItems_shippingMethods_, 0, v9, v10);

    uint64_t v12 = (uint64_t (*)(id))v0[1];
    return v12(v11);
  }
}

uint64_t sub_23CA34BCC()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  *(void *)(v1 + 104) = *(void *)(v1 + 40);
  return MEMORY[0x270FA2498](sub_23CA34D04, 0, 0);
}

id sub_23CA34D04()
{
  id result = objc_msgSend(*(id *)(v0 + 104), sel_errors);
  if (!result)
  {
    __break(1u);
    return result;
  }
  uint64_t v2 = result;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3498);
  uint64_t v3 = sub_23CA46E40();

  uint64_t v4 = *(void *)(v3 + 16);
  swift_bridgeObjectRelease();
  if (v4 || objc_msgSend(*(id *)(v0 + 104), sel_status))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v5 = *(id *)(v0 + 104);
LABEL_5:
    unint64_t v6 = *(uint64_t (**)(id))(v0 + 8);
    return (id)v6(v5);
  }
  uint64_t v7 = *(void **)(v0 + 104);
  uint64_t v8 = *(void *)(v0 + 72);
  uint64_t v9 = *(void *)(v0 + 80) + 1;
  id v10 = objc_msgSend(v7, sel_paymentSummaryItems);
  sub_23CA37D1C(0, &qword_268BC34A0);
  unint64_t v11 = sub_23CA46E40();

  sub_23CA346CC(v11, sub_23CA37F7C);
  id v12 = objc_msgSend(v7, sel_shippingMethods);
  sub_23CA37D1C(0, &qword_268BC34A8);
  unint64_t v13 = sub_23CA46E40();

  sub_23CA346CC(v13, sub_23CA38138);
  if (v9 == v8)
  {
    swift_bridgeObjectRelease();
    id v14 = objc_allocWithZone(MEMORY[0x263F5C090]);
    BOOL v15 = (void *)sub_23CA46E30();
    swift_bridgeObjectRelease();
    uint64_t v16 = (void *)sub_23CA46E30();
    swift_bridgeObjectRelease();
    id v5 = objc_msgSend(v14, sel_initWithErrors_paymentSummaryItems_shippingMethods_, 0, v15, v16);

    goto LABEL_5;
  }
  uint64_t v17 = *(void *)(v0 + 80) + 1;
  *(void *)(v0 + 80) = v17;
  uint64_t v18 = *(void *)(v0 + 48);
  uint64_t v19 = *(void *)(v0 + 64) + 16 * v17;
  *(void *)(v0 + 88) = *(void *)(v19 + 40);
  uint64_t v20 = *(int **)(v19 + 32);
  *(void *)(v0 + 32) = v18;
  int v22 = (uint64_t (*)(uint64_t, uint64_t))((char *)v20 + *v20);
  swift_retain();
  int v21 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v21;
  *int v21 = v0;
  v21[1] = sub_23CA34BCC;
  return (id)v22(v0 + 40, v0 + 32);
}

uint64_t sub_23CA35064(uint64_t a1)
{
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = v1;
  return MEMORY[0x270FA2498](sub_23CA35084, 0, 0);
}

uint64_t sub_23CA35084()
{
  uint64_t v1 = *(void **)(v0[6] + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onShippingChange);
  v0[7] = v1;
  uint64_t v2 = v1[2];
  v0[8] = v2;
  if (v2)
  {
    v0[2] = MEMORY[0x263F8EE78];
    v0[9] = 0;
    uint64_t v3 = v0[5];
    v0[10] = v1[5];
    uint64_t v4 = (int *)v1[4];
    swift_bridgeObjectRetain();
    v0[3] = v3;
    unint64_t v11 = (int *)((char *)v4 + *v4);
    swift_retain();
    id v5 = (void *)swift_task_alloc();
    v0[11] = v5;
    void *v5 = v0;
    v5[1] = sub_23CA3525C;
    return ((uint64_t (*)(void *, void *))v11)(v0 + 4, v0 + 3);
  }
  else
  {
    id v7 = objc_allocWithZone(MEMORY[0x263F5C098]);
    sub_23CA37D1C(0, &qword_268BC34A0);
    uint64_t v8 = (void *)sub_23CA46E30();
    id v9 = objc_msgSend(v7, sel_initWithPaymentSummaryItems_, v8);

    id v10 = (uint64_t (*)(id))v0[1];
    return v10(v9);
  }
}

uint64_t sub_23CA3525C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  *(void *)(v1 + 96) = *(void *)(v1 + 32);
  return MEMORY[0x270FA2498](sub_23CA35394, 0, 0);
}

uint64_t sub_23CA35394()
{
  if (objc_msgSend(*(id *)(v0 + 96), sel_status))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v1 = *(id *)(v0 + 96);
LABEL_5:
    id v9 = *(uint64_t (**)(id))(v0 + 8);
    return v9(v1);
  }
  uint64_t v2 = *(void **)(v0 + 96);
  uint64_t v3 = *(void *)(v0 + 64);
  uint64_t v4 = *(void *)(v0 + 72) + 1;
  id v5 = objc_msgSend(v2, sel_paymentSummaryItems);
  sub_23CA37D1C(0, &qword_268BC34A0);
  unint64_t v6 = sub_23CA46E40();

  sub_23CA346CC(v6, sub_23CA37F7C);
  if (v4 == v3)
  {
    swift_bridgeObjectRelease();
    id v7 = objc_allocWithZone(MEMORY[0x263F5C098]);
    uint64_t v8 = (void *)sub_23CA46E30();
    swift_bridgeObjectRelease();
    id v1 = objc_msgSend(v7, sel_initWithPaymentSummaryItems_, v8);

    goto LABEL_5;
  }
  *(void *)(v0 + 72) = v4;
  uint64_t v11 = *(void *)(v0 + 40);
  uint64_t v12 = *(void *)(v0 + 56) + 16 * v4;
  *(void *)(v0 + 80) = *(void *)(v12 + 40);
  unint64_t v13 = *(int **)(v12 + 32);
  *(void *)(v0 + 24) = v11;
  BOOL v15 = (uint64_t (*)(uint64_t, uint64_t))((char *)v13 + *v13);
  swift_retain();
  id v14 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v14;
  void *v14 = v0;
  v14[1] = sub_23CA3525C;
  return v15(v0 + 32, v0 + 24);
}

uint64_t sub_23CA355F4(uint64_t a1, uint64_t a2)
{
  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  return MEMORY[0x270FA2498](sub_23CA35618, 0, 0);
}

uint64_t sub_23CA35618()
{
  id v1 = *(void **)(v0[9] + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onCouponCodeChange);
  v0[10] = v1;
  uint64_t v2 = v1[2];
  v0[11] = v2;
  if (v2)
  {
    uint64_t v3 = MEMORY[0x263F8EE78];
    v0[4] = MEMORY[0x263F8EE78];
    v0[5] = v3;
    v0[12] = 0;
    uint64_t v5 = v0[7];
    uint64_t v4 = v0[8];
    v0[13] = v1[5];
    unint64_t v6 = (int *)v1[4];
    swift_bridgeObjectRetain();
    v0[2] = v5;
    v0[3] = v4;
    id v14 = (int *)((char *)v6 + *v6);
    swift_retain();
    id v7 = (void *)swift_task_alloc();
    v0[14] = v7;
    void *v7 = v0;
    v7[1] = sub_23CA35834;
    return ((uint64_t (*)(void *, void *))v14)(v0 + 6, v0 + 2);
  }
  else
  {
    id v9 = objc_allocWithZone(MEMORY[0x263F5C078]);
    sub_23CA37D1C(0, &qword_268BC34A0);
    id v10 = (void *)sub_23CA46E30();
    sub_23CA37D1C(0, &qword_268BC34A8);
    uint64_t v11 = (void *)sub_23CA46E30();
    id v12 = objc_msgSend(v9, sel_initWithErrors_paymentSummaryItems_shippingMethods_, 0, v10, v11);

    unint64_t v13 = (uint64_t (*)(id))v0[1];
    return v13(v12);
  }
}

uint64_t sub_23CA35834()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  *(void *)(v1 + 120) = *(void *)(v1 + 48);
  return MEMORY[0x270FA2498](sub_23CA3596C, 0, 0);
}

id sub_23CA3596C()
{
  id result = objc_msgSend(*(id *)(v0 + 120), sel_errors);
  if (!result)
  {
    __break(1u);
    return result;
  }
  uint64_t v2 = result;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3498);
  uint64_t v3 = sub_23CA46E40();

  uint64_t v4 = *(void *)(v3 + 16);
  swift_bridgeObjectRelease();
  if (v4 || objc_msgSend(*(id *)(v0 + 120), sel_status))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v5 = *(id *)(v0 + 120);
LABEL_5:
    unint64_t v6 = *(uint64_t (**)(id))(v0 + 8);
    return (id)v6(v5);
  }
  id v7 = *(void **)(v0 + 120);
  uint64_t v8 = *(void *)(v0 + 88);
  uint64_t v9 = *(void *)(v0 + 96) + 1;
  id v10 = objc_msgSend(v7, sel_paymentSummaryItems);
  sub_23CA37D1C(0, &qword_268BC34A0);
  unint64_t v11 = sub_23CA46E40();

  sub_23CA346CC(v11, sub_23CA37F7C);
  id v12 = objc_msgSend(v7, sel_shippingMethods);
  sub_23CA37D1C(0, &qword_268BC34A8);
  unint64_t v13 = sub_23CA46E40();

  sub_23CA346CC(v13, sub_23CA38138);
  if (v9 == v8)
  {
    swift_bridgeObjectRelease();
    id v14 = objc_allocWithZone(MEMORY[0x263F5C078]);
    uint64_t v15 = (void *)sub_23CA46E30();
    swift_bridgeObjectRelease();
    uint64_t v16 = (void *)sub_23CA46E30();
    swift_bridgeObjectRelease();
    id v5 = objc_msgSend(v14, sel_initWithErrors_paymentSummaryItems_shippingMethods_, 0, v15, v16);

    goto LABEL_5;
  }
  uint64_t v17 = *(void *)(v0 + 96) + 1;
  *(void *)(v0 + 96) = v17;
  uint64_t v19 = *(void *)(v0 + 56);
  uint64_t v18 = *(void *)(v0 + 64);
  uint64_t v20 = *(void *)(v0 + 80) + 16 * v17;
  *(void *)(v0 + 104) = *(void *)(v20 + 40);
  int v21 = *(int **)(v20 + 32);
  *(void *)(v0 + 16) = v19;
  *(void *)(v0 + 24) = v18;
  uint64_t v23 = (uint64_t (*)(uint64_t, uint64_t))((char *)v21 + *v21);
  swift_retain();
  int v22 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v22;
  *int v22 = v0;
  v22[1] = sub_23CA35834;
  return (id)v23(v0 + 48, v0 + 16);
}

uint64_t sub_23CA36000(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_23CA46E80();
  v3[5] = sub_23CA46E70();
  uint64_t v5 = sub_23CA46E60();
  return MEMORY[0x270FA2498](sub_23CA3609C, v5, v4);
}

uint64_t sub_23CA3609C()
{
  uint64_t v1 = (void *)v0[4];
  uint64_t v3 = (void *)v0[2];
  uint64_t v2 = (const void *)v0[3];
  swift_release();
  v0[6] = _Block_copy(v2);
  uint64_t v8 = (uint64_t (__cdecl *)())((char *)&dword_268BC3568 + dword_268BC3568);
  id v4 = v3;
  id v5 = v1;
  unint64_t v6 = (void *)swift_task_alloc();
  v0[7] = v6;
  void *v6 = v0;
  v6[1] = sub_23CA3616C;
  return v8();
}

uint64_t sub_23CA3616C(void *a1)
{
  uint64_t v3 = *(void (***)(void, void))(*v1 + 48);
  id v4 = *(void **)(*v1 + 32);
  id v5 = *(void **)(*v1 + 16);
  uint64_t v8 = *v1;
  swift_task_dealloc();

  ((void (**)(void, void *))v3)[2](v3, a1);
  _Block_release(v3);

  unint64_t v6 = *(uint64_t (**)(void))(v8 + 8);
  return v6();
}

uint64_t sub_23CA36454(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  v4[6] = sub_23CA46E80();
  v4[7] = sub_23CA46E70();
  uint64_t v6 = sub_23CA46E60();
  return MEMORY[0x270FA2498](sub_23CA364F4, v6, v5);
}

uint64_t sub_23CA364F4()
{
  uint64_t v1 = (const void *)v0[4];
  uint64_t v2 = (void *)v0[5];
  id v4 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  swift_release();
  v0[8] = _Block_copy(v1);
  id v5 = v4;
  id v6 = v3;
  id v7 = v2;
  v0[9] = sub_23CA46E70();
  uint64_t v8 = (void *)swift_task_alloc();
  v0[10] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_23CA365E4;
  uint64_t v9 = v0[5];
  v8[5] = v0[3];
  v8[6] = v9;
  return MEMORY[0x270FA2498](sub_23CA340F8, 0, 0);
}

uint64_t sub_23CA365E4(uint64_t a1)
{
  *(void *)(*(void *)v1 + 88) = a1;
  swift_task_dealloc();
  uint64_t v3 = sub_23CA46E60();
  return MEMORY[0x270FA2498](sub_23CA36728, v3, v2);
}

uint64_t sub_23CA36728()
{
  uint64_t v1 = (void *)v0[11];
  uint64_t v2 = (void (**)(void, void))v0[8];
  uint64_t v3 = (void *)v0[5];
  uint64_t v5 = (void *)v0[2];
  id v4 = (void *)v0[3];
  swift_release();

  ((void (**)(void, void *))v2)[2](v2, v1);
  _Block_release(v2);

  id v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_23CA36954(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  v4[6] = sub_23CA46E80();
  v4[7] = sub_23CA46E70();
  uint64_t v6 = sub_23CA46E60();
  return MEMORY[0x270FA2498](sub_23CA369F4, v6, v5);
}

uint64_t sub_23CA369F4()
{
  uint64_t v1 = (const void *)v0[4];
  uint64_t v2 = (void *)v0[5];
  id v4 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  swift_release();
  v0[8] = _Block_copy(v1);
  id v5 = v4;
  id v6 = v3;
  id v7 = v2;
  v0[9] = sub_23CA46E70();
  uint64_t v8 = (void *)swift_task_alloc();
  v0[10] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_23CA36AE4;
  uint64_t v9 = v0[5];
  v8[6] = v0[3];
  v8[7] = v9;
  return MEMORY[0x270FA2498](sub_23CA349BC, 0, 0);
}

uint64_t sub_23CA36AE4(uint64_t a1)
{
  *(void *)(*(void *)v1 + 88) = a1;
  swift_task_dealloc();
  uint64_t v3 = sub_23CA46E60();
  return MEMORY[0x270FA2498](sub_23CA38BB8, v3, v2);
}

uint64_t sub_23CA36DAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  v4[6] = sub_23CA46E80();
  v4[7] = sub_23CA46E70();
  uint64_t v6 = sub_23CA46E60();
  return MEMORY[0x270FA2498](sub_23CA36E4C, v6, v5);
}

uint64_t sub_23CA36E4C()
{
  uint64_t v1 = (const void *)v0[4];
  uint64_t v2 = (void *)v0[5];
  id v4 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  swift_release();
  v0[8] = _Block_copy(v1);
  id v5 = v4;
  id v6 = v3;
  id v7 = v2;
  v0[9] = sub_23CA46E70();
  uint64_t v8 = (void *)swift_task_alloc();
  v0[10] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_23CA36AE4;
  uint64_t v9 = v0[5];
  v8[5] = v0[3];
  v8[6] = v9;
  return MEMORY[0x270FA2498](sub_23CA35084, 0, 0);
}

uint64_t sub_23CA370C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  v4[6] = sub_23CA46E80();
  v4[7] = sub_23CA46E70();
  uint64_t v6 = sub_23CA46E60();
  return MEMORY[0x270FA2498](sub_23CA37160, v6, v5);
}

uint64_t sub_23CA37160()
{
  uint64_t v1 = (const void *)v0[4];
  uint64_t v2 = (void *)v0[5];
  uint64_t v3 = (void *)v0[2];
  swift_release();
  v0[8] = _Block_copy(v1);
  uint64_t v4 = sub_23CA46E00();
  uint64_t v6 = v5;
  v0[9] = v5;
  id v7 = v3;
  id v8 = v2;
  v0[10] = sub_23CA46E70();
  uint64_t v9 = (void *)swift_task_alloc();
  v0[11] = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_23CA37260;
  uint64_t v10 = v0[5];
  v9[8] = v6;
  v9[9] = v10;
  v9[7] = v4;
  return MEMORY[0x270FA2498](sub_23CA35618, 0, 0);
}

uint64_t sub_23CA37260(uint64_t a1)
{
  *(void *)(*(void *)v1 + 96) = a1;
  swift_task_dealloc();
  uint64_t v3 = sub_23CA46E60();
  return MEMORY[0x270FA2498](sub_23CA373A4, v3, v2);
}

uint64_t sub_23CA373A4()
{
  uint64_t v1 = (void *)v0[12];
  uint64_t v2 = (void (**)(void, void))v0[8];
  uint64_t v3 = (void *)v0[5];
  uint64_t v4 = (void *)v0[2];
  swift_release();
  swift_bridgeObjectRelease();

  ((void (**)(void, void *))v2)[2](v2, v1);
  _Block_release(v2);

  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_23CA37468()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v5 = v0[4];
  uint64_t v4 = v0[5];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  void *v6 = v1;
  v6[1] = sub_23CA38BC0;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_268BC3450 + dword_268BC3450);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_23CA37528(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_23CA38BC0;
  return v6();
}

uint64_t sub_23CA375F8()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_23CA38BC0;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_268BC3460 + dword_268BC3460);
  return v6(v2, v3, v4);
}

uint64_t sub_23CA376B8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_23CA38BC0;
  return v7();
}

uint64_t sub_23CA37788(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_23CA38BC0;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_268BC3470 + dword_268BC3470);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_23CA37854(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23CA46EB0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_23CA46EA0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_23CA379F8(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23CA46E60();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_23CA379F8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3448);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23CA37A58(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_23CA37B34;
  return v6(a1);
}

uint64_t sub_23CA37B34()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_23CA37C2C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23CA37C64(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_23CA27230;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268BC3480 + dword_268BC3480);
  return v6(a1, v4);
}

uint64_t sub_23CA37D1C(uint64_t a1, unint64_t *a2)
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

uint64_t (*sub_23CA37D58(uint64_t (**a1)(), unint64_t a2, uint64_t a3))()
{
  uint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_23CA37E74(v6, a2, a3);
  return sub_23CA37DC0;
}

uint64_t (*sub_23CA37DC4(void (**a1)(id *a1), unint64_t a2, uint64_t a3))()
{
  uint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_23CA37EF4(v6, a2, a3);
  return sub_23CA37DC0;
}

void sub_23CA37E2C(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t (*sub_23CA37E74(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x23ECEE680](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_23CA38BBC;
  }
  __break(1u);
  return result;
}

void (*sub_23CA37EF4(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x23ECEE680](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_23CA37F74;
  }
  __break(1u);
  return result;
}

void sub_23CA37F74(id *a1)
{
}

uint64_t sub_23CA37F7C(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_23CA46FC0();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_23CA46FC0();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_23CA382F4(&qword_268BC34C8, &qword_268BC34C0);
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_268BC34C0);
            uint64_t v10 = sub_23CA37D58(v13, i, a3);
            id v12 = *v11;
            ((void (*)(uint64_t (**)(), void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_23CA37D1C(0, &qword_268BC34A0);
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_23CA38138(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_23CA46FC0();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_23CA46FC0();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_23CA382F4(&qword_268BC34B8, &qword_268BC34B0);
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_268BC34B0);
            uint64_t v10 = sub_23CA37DC4(v13, i, a3);
            id v12 = *v11;
            ((void (*)(void (**)(id *), void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_23CA37D1C(0, &qword_268BC34A8);
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_23CA382F4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23CA38348()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v5 = v0[4];
  uint64_t v4 = v0[5];
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  void *v6 = v1;
  v6[1] = sub_23CA38BC0;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_268BC34D0 + dword_268BC34D0);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_23CA38414()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v5 = v0[4];
  uint64_t v4 = v0[5];
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  void *v6 = v1;
  v6[1] = sub_23CA38BC0;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_268BC34F8 + dword_268BC34F8);
  return v7(v2, v3, v5, v4);
}

uint64_t objectdestroyTm_0()
{
  _Block_release(*(const void **)(v0 + 32));

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_23CA38530()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v5 = v0[4];
  uint64_t v4 = v0[5];
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  void *v6 = v1;
  v6[1] = sub_23CA27230;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_268BC3520 + dword_268BC3520);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_23CA385F8()
{
  _Block_release(*(const void **)(v0 + 24));

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_23CA38640()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_23CA38BC0;
  unint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_268BC3548 + dword_268BC3548);
  return v6(v2, v3, v4);
}

uint64_t objectdestroy_29Tm()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_23CA3873C()
{
  v1[2] = v0;
  v1[3] = sub_23CA46E80();
  v1[4] = sub_23CA46E70();
  return MEMORY[0x270FA2498](sub_23CA387B8, 0, 0);
}

uint64_t sub_23CA387B8()
{
  uint64_t v1 = v0[2] + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onMerchantSessionRequested;
  uint64_t v2 = *(int **)v1;
  v0[5] = *(void *)v1;
  if (v2)
  {
    v0[6] = *(void *)(v1 + 8);
    uint64_t v7 = (uint64_t (*)(void))((char *)v2 + *v2);
    swift_retain();
    uint64_t v3 = (void *)swift_task_alloc();
    v0[7] = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_23CA38928;
    return v7();
  }
  else
  {
    v0[9] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F5C080]), sel_initWithStatus_merchantSession_, 0, 0);
    uint64_t v6 = sub_23CA46E60();
    return MEMORY[0x270FA2498](sub_23CA38AB0, v6, v5);
  }
}

uint64_t sub_23CA38928(uint64_t a1)
{
  *(void *)(*(void *)v1 + 64) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_23CA38A28, 0, 0);
}

uint64_t sub_23CA38A28()
{
  sub_23CA25258(v0[5]);
  v0[9] = v0[8];
  uint64_t v2 = sub_23CA46E60();
  return MEMORY[0x270FA2498](sub_23CA38AB0, v2, v1);
}

uint64_t sub_23CA38AB0()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 72);
  return v1(v2);
}

uint64_t sub_23CA38B14()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_23CA38B4C()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_23CA38B60()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_23CA38B98(char a1)
{
  sub_23CA33D94(a1, v1);
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_23CA38BC4()
{
  return sub_23CA46CC0();
}

uint64_t sub_23CA38C28()
{
  return sub_23CA46CD0();
}

uint64_t AsyncShareablePassConfiguration.init(metadata:action:content:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  sub_23CA46CB0();
  type metadata accessor for AsyncShareablePassConfiguration.Result();
  uint64_t result = sub_23CA46CB0();
  *(void *)a5 = a1;
  *(void *)(a5 + 8) = a2;
  *(unsigned char *)(a5 + 16) = v11;
  *(void *)(a5 + 24) = v12;
  *(void *)(a5 + 32) = v11;
  *(unsigned char *)(a5 + 40) = v12;
  *(void *)(a5 + 48) = v13;
  *(void *)(a5 + 56) = a3;
  *(void *)(a5 + 64) = a4;
  return result;
}

uint64_t AsyncShareablePassConfiguration.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v29 = a2;
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v27 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_23CA469C0();
  uint64_t v28 = *(void *)(v7 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v26 = (uint64_t)&v26 - v11;
  long long v12 = v2[1];
  long long v13 = v2[3];
  long long v38 = v2[2];
  long long v39 = v13;
  long long v14 = v2[1];
  long long v36 = *v2;
  long long v37 = v14;
  long long v15 = v2[3];
  v32[2] = v38;
  v32[3] = v15;
  uint64_t v40 = *((void *)v2 + 8);
  uint64_t v16 = (void (*)(_OWORD *))*((void *)&v39 + 1);
  uint64_t v33 = *((void *)v2 + 8);
  v32[0] = v36;
  v32[1] = v12;
  sub_23CA38BC4();
  uint64_t v17 = v34;
  unsigned __int8 v18 = v35;
  *(void *)&v32[0] = v34;
  BYTE8(v32[0]) = v35;
  v16(v32);
  sub_23CA39094(v17, v18);
  uint64_t v19 = swift_allocObject();
  uint64_t v20 = *(void *)(a1 + 24);
  *(void *)(v19 + 16) = v4;
  *(void *)(v19 + 24) = v20;
  long long v21 = v39;
  *(_OWORD *)(v19 + 64) = v38;
  *(_OWORD *)(v19 + 80) = v21;
  *(void *)(v19 + 96) = v40;
  long long v22 = v37;
  *(_OWORD *)(v19 + 32) = v36;
  *(_OWORD *)(v19 + 48) = v22;
  sub_23CA39104((uint64_t)&v36);
  sub_23CA46C70();
  swift_release();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v6, v4);
  uint64_t v30 = v20;
  uint64_t v31 = MEMORY[0x263F1A240];
  swift_getWitnessTable();
  uint64_t v23 = v26;
  sub_23CA26A5C((uint64_t)v10, v7, v26);
  uint64_t v24 = *(void (**)(char *, uint64_t))(v28 + 8);
  v24(v10, v7);
  sub_23CA26A5C(v23, v7, v29);
  return ((uint64_t (*)(uint64_t, uint64_t))v24)(v23, v7);
}

void sub_23CA39094(id a1, unsigned __int8 a2)
{
  if (a2 <= 1u) {
}
  }

void sub_23CA390B4()
{
  uint64_t v0 = type metadata accessor for AsyncShareablePassConfiguration();
  sub_23CA391D8(v0);
}

uint64_t sub_23CA39104(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  unsigned __int8 v3 = *(unsigned char *)(a1 + 40);
  swift_retain();
  swift_bridgeObjectRetain();
  sub_23CA39178(v2, v3);
  swift_retain();
  swift_retain();
  return a1;
}

id sub_23CA39178(id result, unsigned __int8 a2)
{
  if (a2 <= 1u) {
    return result;
  }
  return result;
}

uint64_t sub_23CA39194()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_23CA391D8(uint64_t a1)
{
  long long v3 = v1[1];
  long long v4 = v1[3];
  long long v26 = v1[2];
  long long v27 = v4;
  long long v5 = v1[1];
  long long v24 = *v1;
  long long v25 = v5;
  long long v6 = v1[3];
  long long v19 = v26;
  long long v20 = v6;
  uint64_t v28 = *((void *)v1 + 8);
  uint64_t v21 = *((void *)v1 + 8);
  long long v17 = v24;
  long long v18 = v3;
  sub_23CA38BC4();
  if (v23 != 2 || v22)
  {
    sub_23CA39094(v22, v23);
  }
  else
  {
    LOBYTE(v17) = v25 & 1;
    *((void *)&v17 + 1) = *((void *)&v25 + 1);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3008);
    sub_23CA46CC0();
    LOBYTE(v17) = v25 & 1;
    *((void *)&v17 + 1) = *((void *)&v25 + 1);
    LOBYTE(v22) = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3008);
    sub_23CA46CD0();
    uint64_t v7 = self;
    sub_23CA39ABC();
    uint64_t v8 = (void *)sub_23CA46E30();
    uint64_t v9 = (void *)sub_23CA46DD0();
    uint64_t v10 = *((void *)&v24 + 1);
    uint64_t v11 = swift_allocObject();
    long long v12 = v26;
    long long v13 = v27;
    long long v14 = v24;
    *(_OWORD *)(v11 + 48) = v25;
    *(_OWORD *)(v11 + 64) = v12;
    *(_OWORD *)(v11 + 80) = v13;
    long long v15 = *(_OWORD *)(a1 + 16);
    *(void *)(v11 + 96) = v28;
    *(_OWORD *)(v11 + 16) = v15;
    *(_OWORD *)(v11 + 32) = v14;
    *(void *)&long long v19 = sub_23CA39B5C;
    *((void *)&v19 + 1) = v11;
    *(void *)&long long v17 = MEMORY[0x263EF8330];
    *((void *)&v17 + 1) = 1107296256;
    *(void *)&long long v18 = sub_23CA315E4;
    *((void *)&v18 + 1) = &block_descriptor_1;
    uint64_t v16 = _Block_copy(&v17);
    sub_23CA39104((uint64_t)&v24);
    swift_release();
    objc_msgSend(v7, sel_configurationForPassMetadata_provisioningPolicyIdentifier_primaryAction_completion_, v8, v9, v10, v16);
    _Block_release(v16);
  }
}

uint64_t sub_23CA393E8(void *a1, id a2, uint64_t a3)
{
  if (a1)
  {
    type metadata accessor for AsyncShareablePassConfiguration();
    id v5 = a1;
    return sub_23CA38C28();
  }
  else if (a2)
  {
    id v7 = a2;
    type metadata accessor for AsyncShareablePassConfiguration();
    return sub_23CA38C28();
  }
  else
  {
    sub_23CA39104(a3);
    if (qword_268BC2D20 != -1) {
      swift_once();
    }
    uint64_t v8 = (void *)qword_268BC5530;
    type metadata accessor for AsyncShareablePassConfiguration();
    id v9 = v8;
    sub_23CA38C28();
    return sub_23CA39B80(a3);
  }
}

uint64_t sub_23CA39560(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 40);
}

uint64_t sub_23CA39568(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_release();
  sub_23CA39094(*(id *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_release();

  return swift_release();
}

uint64_t sub_23CA395C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  id v5 = *(void **)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  unsigned __int8 v6 = *(unsigned char *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_23CA39178(v5, v6);
  *(void *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 40) = v6;
  uint64_t v7 = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = v7;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_23CA39654(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  uint64_t v4 = *(void **)(a2 + 32);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 40);
  sub_23CA39178(v4, v5);
  unsigned __int8 v6 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = v4;
  unsigned __int8 v7 = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(a1 + 40) = v5;
  sub_23CA39094(v6, v7);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  uint64_t v8 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v8;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy72_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t sub_23CA39740(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  char v4 = *(unsigned char *)(a2 + 40);
  unsigned __int8 v5 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  unsigned __int8 v6 = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(a1 + 40) = v4;
  sub_23CA39094(v5, v6);
  swift_release();
  uint64_t v7 = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = v7;
  swift_release();
  return a1;
}

uint64_t sub_23CA397D4(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 72)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_23CA3981C(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 72) = 1;
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
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for AsyncShareablePassConfiguration()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_23CA39884(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  unsigned __int8 v4 = *(unsigned char *)(a2 + 8);
  sub_23CA39178(*(id *)a2, v4);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return a1;
}

void sub_23CA398CC(uint64_t a1)
{
}

uint64_t sub_23CA398DC(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  unsigned __int8 v4 = *(unsigned char *)(a2 + 8);
  sub_23CA39178(*(id *)a2, v4);
  unsigned __int8 v5 = *(void **)a1;
  *(void *)a1 = v3;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v4;
  sub_23CA39094(v5, v6);
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)__n128 result = v2;
  return result;
}

uint64_t sub_23CA39944(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  unsigned __int8 v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  unsigned __int8 v5 = *(unsigned char *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v3;
  sub_23CA39094(v4, v5);
  return a1;
}

uint64_t sub_23CA39984(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t sub_23CA399CC(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)__n128 result = a2 - 254;
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

uint64_t sub_23CA39A10(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 1u) {
    return *(unsigned __int8 *)(a1 + 8);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_23CA39A28(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)__n128 result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 8) = a2;
  return result;
}

uint64_t type metadata accessor for AsyncShareablePassConfiguration.Result()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_23CA39A58()
{
  return swift_getWitnessTable();
}

unint64_t sub_23CA39ABC()
{
  unint64_t result = qword_268BC3680;
  if (!qword_268BC3680)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268BC3680);
  }
  return result;
}

uint64_t objectdestroyTm_1()
{
  swift_bridgeObjectRelease();
  swift_release();
  sub_23CA39094(*(id *)(v0 + 64), *(unsigned char *)(v0 + 72));
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 104, 7);
}

uint64_t sub_23CA39B5C(void *a1, void *a2)
{
  return sub_23CA393E8(a1, a2, v2 + 32);
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_23CA39B80(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  unsigned __int8 v3 = *(unsigned char *)(a1 + 40);
  swift_bridgeObjectRelease();
  swift_release();
  sub_23CA39094(v2, v3);
  swift_release();
  swift_release();
  return a1;
}

uint64_t sub_23CA39BF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *(void *)(a4 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](a1);
  uint64_t v10 = (char *)v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v12, v11);
  unint64_t v13 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v14 = (v9 + v13 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = *(_OWORD *)(a4 + 16);
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v15 + v13, v10, a4);
  uint64_t v16 = (void *)(v15 + v14);
  *uint64_t v16 = a2;
  v16[1] = a3;
  id v17 = objc_allocWithZone(MEMORY[0x263F5C958]);
  sub_23CA3A4F8();
  swift_bridgeObjectRetain();
  swift_retain();
  long long v18 = (void *)sub_23CA46E30();
  id v19 = objc_msgSend(v17, sel_initWithPasses_, v18);

  if (v19)
  {
    long long v20 = (objc_class *)type metadata accessor for AddPassesViewControllerWrapper.AddPassCoordinator();
    uint64_t v21 = (char *)objc_allocWithZone(v20);
    id v22 = (uint64_t (**)(uint64_t))&v21[OBJC_IVAR____TtCV16_PassKit_SwiftUIP33_CEF41C66ABDFF5E01A9463BEC59EB36F30AddPassesViewControllerWrapper18AddPassCoordinator_completion];
    *id v22 = sub_23CA3A43C;
    v22[1] = (uint64_t (*)(uint64_t))v15;
    swift_retain();
    sub_23CA25258(0);
    v29.receiver = v21;
    v29.super_class = v20;
    id v23 = objc_msgSendSuper2(&v29, sel_init);
    swift_release();
    v28[1] = a1;
    v28[2] = v23;
    v28[3] = v19;
    sub_23CA3A538();
    return sub_23CA46D60();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_release();
    sub_23CA46E00();
    id v25 = objc_allocWithZone(MEMORY[0x263F087E8]);
    long long v26 = (void *)sub_23CA46DD0();
    swift_bridgeObjectRelease();
    id v24 = objc_msgSend(v25, sel_initWithDomain_code_userInfo_, v26, 1, 0);
  }
  return (uint64_t)v24;
}

id sub_23CA39FE0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3710);
  uint64_t v1 = swift_allocObject();
  uint64_t v2 = MEMORY[0x263F8D310];
  *(_OWORD *)(v1 + 16) = xmmword_23CA48830;
  *(void *)(v1 + 56) = v2;
  *(void *)(v1 + 32) = 0x74696E696564;
  *(void *)(v1 + 40) = 0xE600000000000000;
  sub_23CA47000();
  swift_bridgeObjectRelease();
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for AddPassesViewControllerWrapper.AddPassCoordinator();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t type metadata accessor for AddPassesViewControllerWrapper.AddPassCoordinator()
{
  return self;
}

uint64_t sub_23CA3A284()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = type metadata accessor for AddPassToWalletButton_iOS();
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(v2 - 8) + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = *(void *)(*(void *)(v2 - 8) + 64);
  sub_23CA250DC(*(void **)(v0 + v4), *(void *)(v0 + v4 + 8), *(void *)(v0 + v4 + 16), *(void *)(v0 + v4 + 24), *(void *)(v0 + v4 + 32), *(unsigned char *)(v0 + v4 + 40));
  uint64_t v6 = v0 + v4 + *(int *)(v2 + 36);
  uint64_t v7 = *(void *)(v1 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v6, 1, v1)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v1);
  }
  sub_23CA25180(*(void *)(v0 + v4 + *(int *)(v2 + 40)), *(unsigned char *)(v0 + v4 + *(int *)(v2 + 40) + 8));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, ((v5 + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16, v3 | 7);
}

uint64_t sub_23CA3A43C(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for AddPassToWalletButton_iOS() - 8);
  uint64_t v4 = *(uint64_t (**)(uint64_t))(v1
                                         + ((*(void *)(v3 + 64)
                                           + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))
                                           + 7) & 0xFFFFFFFFFFFFFFF8));
  sub_23CA258D0();
  return v4(a1);
}

unint64_t sub_23CA3A4F8()
{
  unint64_t result = qword_268BC3700;
  if (!qword_268BC3700)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268BC3700);
  }
  return result;
}

unint64_t sub_23CA3A538()
{
  unint64_t result = qword_268BC3708;
  if (!qword_268BC3708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC3708);
  }
  return result;
}

uint64_t sub_23CA3A58C(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

void destroy for AddPassesViewControllerWrapper(uint64_t a1)
{
  swift_bridgeObjectRelease();

  uint64_t v2 = *(void **)(a1 + 16);
}

void *_s16_PassKit_SwiftUI30AddPassesViewControllerWrapperVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = (void *)a2[2];
  a1[2] = v4;
  swift_bridgeObjectRetain();
  id v5 = v3;
  id v6 = v4;
  return a1;
}

void *assignWithCopy for AddPassesViewControllerWrapper(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a2[1];
  id v5 = (void *)a1[1];
  a1[1] = v4;
  id v6 = v4;

  uint64_t v7 = (void *)a2[2];
  uint64_t v8 = (void *)a1[2];
  a1[2] = v7;
  id v9 = v7;

  return a1;
}

uint64_t assignWithTake for AddPassesViewControllerWrapper(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  id v5 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  return a1;
}

uint64_t getEnumTagSinglePayload for AddPassesViewControllerWrapper(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AddPassesViewControllerWrapper(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AddPassesViewControllerWrapper()
{
  return &type metadata for AddPassesViewControllerWrapper;
}

id sub_23CA3A788()
{
  id v2 = *(id *)(v0 + 16);
  objc_msgSend(v2, sel_setDelegate_, *(void *)(v0 + 8));

  return v2;
}

id sub_23CA3A7CC@<X0>(void *a1@<X8>)
{
  id v2 = *(void **)(v1 + 8);
  *a1 = v2;
  return v2;
}

unint64_t sub_23CA3A7D8(uint64_t a1)
{
  unint64_t result = sub_23CA3A800();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23CA3A800()
{
  unint64_t result = qword_268BC3718;
  if (!qword_268BC3718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC3718);
  }
  return result;
}

uint64_t sub_23CA3A854(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_23CA3A800();

  return MEMORY[0x270F02710](a1, a2, a3, v6);
}

uint64_t sub_23CA3A8B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_23CA3A800();

  return MEMORY[0x270F026D8](a1, a2, a3, v6);
}

void sub_23CA3A91C()
{
}

ValueMetadata *type metadata accessor for ClearBackgroundView()
{
  return &type metadata for ClearBackgroundView;
}

void sub_23CA3A954(void *a1)
{
  id v1 = objc_msgSend(a1, sel_superview);
  if (v1)
  {
    id v2 = v1;
    id v3 = objc_msgSend(v1, sel_superview);

    if (v3)
    {
      id v4 = objc_msgSend(self, sel_clearColor);
      objc_msgSend(v3, sel_setBackgroundColor_, v4);
    }
  }
}

uint64_t sub_23CA3AA10(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_23CA3AA5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_23CA3AF8C();

  return MEMORY[0x270F01780](a1, a2, a3, v6);
}

uint64_t sub_23CA3AAC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_23CA3AF8C();

  return MEMORY[0x270F01718](a1, a2, a3, v6);
}

void sub_23CA3AB24()
{
}

unint64_t sub_23CA3AB50()
{
  unint64_t result = qword_268BC3720;
  if (!qword_268BC3720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC3720);
  }
  return result;
}

id sub_23CA3ABA4()
{
  uint64_t v0 = sub_23CA46DA0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  id v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_23CA46DC0();
  uint64_t v4 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  unint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
  sub_23CA3AE40();
  uint64_t v8 = (void *)sub_23CA46F10();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  aBlock[4] = sub_23CA3AEB8;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23CA3AA10;
  aBlock[3] = &block_descriptor_2;
  uint64_t v10 = _Block_copy(aBlock);
  id v11 = v7;
  swift_release();
  sub_23CA46DB0();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_23CA3AED8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3738);
  sub_23CA3AF30();
  sub_23CA46F40();
  MEMORY[0x23ECEE620](0, v6, v3, v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v14);
  return v11;
}

unint64_t sub_23CA3AE40()
{
  unint64_t result = qword_268BC3728;
  if (!qword_268BC3728)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268BC3728);
  }
  return result;
}

uint64_t sub_23CA3AE80()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_23CA3AEB8()
{
  sub_23CA3A954(*(void **)(v0 + 16));
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

unint64_t sub_23CA3AED8()
{
  unint64_t result = qword_268BC3730;
  if (!qword_268BC3730)
  {
    sub_23CA46DA0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC3730);
  }
  return result;
}

unint64_t sub_23CA3AF30()
{
  unint64_t result = qword_268BC3740;
  if (!qword_268BC3740)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC3738);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC3740);
  }
  return result;
}

unint64_t sub_23CA3AF8C()
{
  unint64_t result = qword_268BC3748;
  if (!qword_268BC3748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC3748);
  }
  return result;
}

uint64_t PayWithApplePayButton.init(_:request:onPaymentAuthorizationChange:fallback:)@<X0>(uint64_t *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void (*a5)(id, uint64_t)@<X4>, uint64_t a6@<X6>, uint64_t a7@<X7>, void *a8@<X8>)
{
  uint64_t v24 = a7;
  uint64_t v15 = sub_23CA46F30();
  MEMORY[0x270FA5388](v15 - 8);
  id v17 = (char *)&v24 - v16;
  uint64_t v18 = *a1;
  id v19 = objc_allocWithZone((Class)type metadata accessor for PaymentAuthorizationCoordinator());
  id v20 = a2;
  swift_retain();
  id v21 = sub_23CA33A8C((uint64_t)v20, a3, a4);
  uint64_t v25 = v18;
  a5(v21, v22);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(a6 - 8) + 56))(v17, 0, 1, a6);
  sub_23CA3B13C(&v25, (uint64_t)v21, (uint64_t)v17, a8);

  return swift_release();
}

uint64_t sub_23CA3B13C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v8 = sub_23CA46F30();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = (char *)&v13 - v10;
  uint64_t v14 = *a1;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v13 - v10, a3, v8);
  sub_23CA25DA4(&v14, a2, 0, 1, (uint64_t)v11, a4);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(a3, v8);
}

uint64_t PayWithApplePayButton.init(_:request:onPaymentAuthorizationChange:onMerchantSessionRequested:fallback:)@<X0>(uint64_t *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void (*a7)(uint64_t)@<X6>, uint64_t a8@<X7>, void *a9@<X8>, uint64_t a10, uint64_t a11)
{
  v28[1] = a8;
  objc_super v29 = a7;
  uint64_t v30 = a9;
  uint64_t v31 = a11;
  uint64_t v17 = sub_23CA46F30();
  MEMORY[0x270FA5388](v17 - 8);
  id v19 = (char *)v28 - v18;
  uint64_t v20 = *a1;
  id v21 = objc_allocWithZone((Class)type metadata accessor for PaymentAuthorizationCoordinator());
  id v22 = a2;
  swift_retain();
  id v23 = (char *)sub_23CA33A8C((uint64_t)v22, a3, a4);
  uint64_t v24 = &v23[OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onMerchantSessionRequested];
  uint64_t v25 = *(void *)&v23[OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onMerchantSessionRequested];
  *(void *)uint64_t v24 = a5;
  *((void *)v24 + 1) = a6;
  swift_retain();
  uint64_t v26 = sub_23CA25258(v25);
  uint64_t v32 = v20;
  v29(v26);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(a10 - 8) + 56))(v19, 0, 1, a10);
  sub_23CA3B13C(&v32, (uint64_t)v23, (uint64_t)v19, v30);

  swift_release();
  return swift_release();
}

double PayWithApplePayButton<>.init(_:request:onPaymentAuthorizationChange:)@<D0>(uint64_t *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9 = *a1;
  objc_allocWithZone((Class)type metadata accessor for PaymentAuthorizationCoordinator());
  id v10 = a2;
  swift_retain();
  id v11 = sub_23CA33A8C((uint64_t)v10, a3, a4);
  sub_23CA25C40(v9, (uint64_t)v11, 0, 1, 1, (uint64_t)v17);

  swift_release();
  long long v12 = v17[7];
  *(_OWORD *)(a5 + 96) = v17[6];
  *(_OWORD *)(a5 + 112) = v12;
  *(_OWORD *)(a5 + 128) = v17[8];
  *(void *)(a5 + 144) = v18;
  long long v13 = v17[3];
  *(_OWORD *)(a5 + 32) = v17[2];
  *(_OWORD *)(a5 + 48) = v13;
  long long v14 = v17[5];
  *(_OWORD *)(a5 + 64) = v17[4];
  *(_OWORD *)(a5 + 80) = v14;
  double result = *(double *)v17;
  long long v16 = v17[1];
  *(_OWORD *)a5 = v17[0];
  *(_OWORD *)(a5 + 16) = v16;
  return result;
}

double PayWithApplePayButton<>.init(_:request:onPaymentAuthorizationChange:onMerchantSessionRequested:)@<D0>(uint64_t *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v13 = *a1;
  id v14 = objc_allocWithZone((Class)type metadata accessor for PaymentAuthorizationCoordinator());
  id v15 = a2;
  swift_retain();
  long long v16 = (char *)sub_23CA33A8C((uint64_t)v15, a3, a4);
  uint64_t v17 = &v16[OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onMerchantSessionRequested];
  uint64_t v18 = *(void *)&v16[OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onMerchantSessionRequested];
  *(void *)uint64_t v17 = a5;
  *((void *)v17 + 1) = a6;
  swift_retain();
  sub_23CA25258(v18);
  sub_23CA25C40(v13, (uint64_t)v16, 0, 1, 1, (uint64_t)v24);

  swift_release();
  swift_release();
  long long v19 = v24[7];
  *(_OWORD *)(a7 + 96) = v24[6];
  *(_OWORD *)(a7 + 112) = v19;
  *(_OWORD *)(a7 + 128) = v24[8];
  *(void *)(a7 + 144) = v25;
  long long v20 = v24[3];
  *(_OWORD *)(a7 + 32) = v24[2];
  *(_OWORD *)(a7 + 48) = v20;
  long long v21 = v24[5];
  *(_OWORD *)(a7 + 64) = v24[4];
  *(_OWORD *)(a7 + 80) = v21;
  double result = *(double *)v24;
  long long v23 = v24[1];
  *(_OWORD *)a7 = v24[0];
  *(_OWORD *)(a7 + 16) = v23;
  return result;
}

id *destroy for PayWithApplePayButtonPaymentAuthorizationPhase(id *result)
{
  if ((unint64_t)*result >= 0xFFFFFFFF)
  {

    return (id *)swift_release();
  }
  return result;
}

uint64_t _s16_PassKit_SwiftUI46PayWithApplePayButtonPaymentAuthorizationPhaseOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)a2;
  if (*(void *)a2 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
  }
  else
  {
    uint64_t v4 = *(void *)(a2 + 8);
    uint64_t v5 = *(void *)(a2 + 16);
    *(void *)a1 = v3;
    *(void *)(a1 + 8) = v4;
    *(void *)(a1 + 16) = v5;
    id v6 = v3;
    swift_retain();
  }
  return a1;
}

uint64_t assignWithCopy for PayWithApplePayButtonPaymentAuthorizationPhase(uint64_t a1, long long *a2)
{
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void **)a2;
  if (*(void *)a1 < 0xFFFFFFFFuLL)
  {
    if ((unint64_t)v5 >= 0xFFFFFFFF)
    {
      *(void *)a1 = v5;
      uint64_t v8 = *((void *)a2 + 2);
      *(void *)(a1 + 8) = *((void *)a2 + 1);
      *(void *)(a1 + 16) = v8;
      id v9 = v5;
      swift_retain();
      return a1;
    }
LABEL_7:
    long long v10 = *a2;
    *(void *)(a1 + 16) = *((void *)a2 + 2);
    *(_OWORD *)a1 = v10;
    return a1;
  }
  if ((unint64_t)v5 < 0xFFFFFFFF)
  {

    swift_release();
    goto LABEL_7;
  }
  *(void *)a1 = v5;
  id v6 = v5;

  uint64_t v7 = *((void *)a2 + 2);
  *(void *)(a1 + 8) = *((void *)a2 + 1);
  *(void *)(a1 + 16) = v7;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for PayWithApplePayButtonPaymentAuthorizationPhase(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  if (*(void *)a1 < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  if (*(void *)a2 < 0xFFFFFFFFuLL)
  {

    swift_release();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    return a1;
  }
  *(void *)a1 = *(void *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PayWithApplePayButtonPaymentAuthorizationPhase(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *((unsigned char *)a1 + 24)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for PayWithApplePayButtonPaymentAuthorizationPhase(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)double result = 0;
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(_DWORD *)double result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(void *)double result = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_23CA3B8C4(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_23CA3B8DC(void *result, int a2)
{
  if (a2 < 0)
  {
    uint64_t v2 = a2 ^ 0x80000000;
    result[1] = 0;
    result[2] = 0;
  }
  else
  {
    if (!a2) {
      return result;
    }
    uint64_t v2 = (a2 - 1);
  }
  *double result = v2;
  return result;
}

ValueMetadata *type metadata accessor for PayWithApplePayButtonPaymentAuthorizationPhase()
{
  return &type metadata for PayWithApplePayButtonPaymentAuthorizationPhase;
}

uint64_t sub_23CA3B90C()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for WindowFinder.Coordinator()
{
  return self;
}

ValueMetadata *type metadata accessor for WindowFinder()
{
  return &type metadata for WindowFinder;
}

id sub_23CA3B950()
{
  return *v0;
}

uint64_t sub_23CA3B958@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for WindowFinder.Coordinator();
  uint64_t result = swift_allocObject();
  *a1 = result;
  return result;
}

uint64_t sub_23CA3B98C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_23CA3BAA8();

  return MEMORY[0x270F01780](a1, a2, a3, v6);
}

uint64_t sub_23CA3B9F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_23CA3BAA8();

  return MEMORY[0x270F01718](a1, a2, a3, v6);
}

void sub_23CA3BA54()
{
}

unint64_t sub_23CA3BA80(uint64_t a1)
{
  unint64_t result = sub_23CA3BAA8();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23CA3BAA8()
{
  unint64_t result = qword_268BC3750;
  if (!qword_268BC3750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC3750);
  }
  return result;
}

uint64_t VerifyIdentityWithWalletButton.init(_:request:onCompletion:fallback:)@<X0>(uint64_t *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void (*a5)(uint64_t)@<X4>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  uint64_t v14 = sub_23CA46F30();
  MEMORY[0x270FA5388](v14 - 8);
  long long v16 = (char *)&v20 - v15;
  uint64_t v21 = *a1;
  id v17 = a2;
  uint64_t v18 = swift_retain();
  a5(v18);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(a6 - 8) + 56))(v16, 0, 1, a6);
  sub_23CA2F8F0(&v21, (uint64_t)a2, a3, a4, 1, (uint64_t)v16, a7);

  return swift_release();
}

uint64_t VerifyIdentityWithWalletButton<>.init(_:action:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = *a1;
  sub_23CA46CB0();
  sub_23CA46CB0();
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F5BEB8]), sel_init);
  uint64_t result = swift_getKeyPath();
  *(void *)a4 = a2;
  *(void *)(a4 + 8) = a3;
  *(void *)(a4 + 16) = 0;
  *(_WORD *)(a4 + 24) = 256;
  *(unsigned char *)(a4 + 32) = v10;
  *(void *)(a4 + 40) = v11;
  *(unsigned char *)(a4 + 48) = v10;
  *(void *)(a4 + 56) = v11;
  *(void *)(a4 + 64) = v8;
  *(void *)(a4 + 72) = v7;
  *(void *)(a4 + 80) = result;
  *(unsigned char *)(a4 + 88) = 0;
  return result;
}

uint64_t VerifyIdentityWithWalletButton<>.init(_:request:onCompletion:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9 = *a1;
  sub_23CA46CB0();
  sub_23CA46CB0();
  id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F5BEB8]), sel_init);
  uint64_t result = swift_getKeyPath();
  *(void *)a5 = a2;
  *(void *)(a5 + 8) = a3;
  *(void *)(a5 + 16) = a4;
  *(_WORD *)(a5 + 24) = 257;
  *(unsigned char *)(a5 + 32) = v12;
  *(void *)(a5 + 40) = v13;
  *(unsigned char *)(a5 + 48) = v12;
  *(void *)(a5 + 56) = v13;
  *(void *)(a5 + 64) = v10;
  *(void *)(a5 + 72) = v9;
  *(void *)(a5 + 80) = result;
  *(unsigned char *)(a5 + 88) = 0;
  return result;
}

uint64_t sub_23CA3BE0C@<X0>(void *a1@<X8>)
{
  sub_23CA3BF44();
  uint64_t result = sub_23CA46A30();
  *a1 = v3;
  return result;
}

uint64_t sub_23CA3BE5C@<X0>(void *a1@<X8>)
{
  sub_23CA3BF44();
  uint64_t result = sub_23CA46A30();
  *a1 = v3;
  return result;
}

uint64_t sub_23CA3BEAC()
{
  return sub_23CA46A40();
}

uint64_t sub_23CA3BEF8()
{
  return sub_23CA46A40();
}

unint64_t sub_23CA3BF44()
{
  unint64_t result = qword_268BC3758;
  if (!qword_268BC3758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC3758);
  }
  return result;
}

uint64_t View.onApplePayPaymentMethodChange(perform:)(uint64_t a1, uint64_t a2)
{
  uint64_t KeyPath = swift_getKeyPath();
  unsigned int v5 = (void *)sub_23CA3C208(KeyPath, 0, &qword_268BC3830);
  swift_release();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  swift_retain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unsigned int v5 = sub_23CA3DDFC(0, v5[2] + 1, 1, v5, &qword_268BC3828);
  }
  unint64_t v8 = v5[2];
  unint64_t v7 = v5[3];
  if (v8 >= v7 >> 1) {
    unsigned int v5 = sub_23CA3DDFC((void *)(v7 > 1), v8 + 1, 1, v5, &qword_268BC3828);
  }
  v5[2] = v8 + 1;
  uint64_t v9 = &v5[2 * v8];
  v9[4] = &unk_268BC3768;
  v9[5] = v6;
  swift_getKeyPath();
  sub_23CA46C20();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_23CA3C0F8()
{
  return sub_23CA3CFA4((void (*)(void))sub_23CA3DFC4);
}

uint64_t sub_23CA3C118@<X0>(void *a1@<X8>)
{
  return keypath_getTm((void (*)(void))sub_23CA3DFC4, a1);
}

uint64_t sub_23CA3C138@<X0>(void *a1@<X8>)
{
  return keypath_getTm((void (*)(void))sub_23CA3DFC4, a1);
}

uint64_t sub_23CA3C158(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23CA3CE38(a1, a2, a3, a4, (void (*)(void))sub_23CA3DFC4);
}

uint64_t sub_23CA3C178(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23CA3CE38(a1, a2, a3, a4, (void (*)(void))sub_23CA3DFC4);
}

uint64_t sub_23CA3C1AC@<X0>(uint64_t a1@<X0>, char a2@<W1>, void *a3@<X8>)
{
  return sub_23CA3C6D8(a1, a2, (void (*)(uint64_t, void))sub_23CA279F8, 0xD00000000000001ALL, 0x800000023CA49E50, (void (*)(void, void))sub_23CA25180, a3);
}

uint64_t sub_23CA3C1F0(uint64_t a1, char a2)
{
  return sub_23CA3C208(a1, a2, &qword_268BC3830);
}

uint64_t sub_23CA3C1FC(uint64_t a1, char a2)
{
  return sub_23CA3C208(a1, a2, &qword_268BC3818);
}

uint64_t sub_23CA3C208(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v6 = sub_23CA46A10();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    swift_retain();
    os_log_type_t v10 = sub_23CA46ED0();
    uint64_t v11 = sub_23CA46BE0();
    os_log_type_t v12 = v10;
    if (os_log_type_enabled(v11, v10))
    {
      uint64_t v13 = swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      uint64_t v19 = v14;
      *(_DWORD *)uint64_t v13 = 136315138;
      __swift_instantiateConcreteTypeFromMangledName(a3);
      uint64_t v15 = sub_23CA47040();
      *(void *)(v13 + 4) = sub_23CA3D448(v15, v16, &v19);
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23CA21000, v11, v12, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23ECEED40](v14, -1, -1);
      MEMORY[0x23ECEED40](v13, -1, -1);
    }

    sub_23CA46A00();
    swift_getAtKeyPath();
    sub_23CA2713C(a1, 0);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return v19;
  }
  return a1;
}

uint64_t sub_23CA3C400(uint64_t a1, char a2)
{
  return sub_23CA3C208(a1, a2, &qword_268BC3800);
}

uint64_t sub_23CA3C40C(uint64_t a1, char a2)
{
  return sub_23CA3C208(a1, a2, &qword_268BC3840);
}

uint64_t sub_23CA3C418@<X0>(uint64_t a1@<X0>, char a2@<W1>, unsigned char *a3@<X8>)
{
  uint64_t v6 = sub_23CA46A10();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t result = MEMORY[0x270FA5388](v6);
  os_log_type_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    *a3 = a1 & 1;
  }
  else
  {
    sub_23CA279F8(a1, 0);
    os_log_type_t v11 = sub_23CA46ED0();
    os_log_type_t v12 = sub_23CA46BE0();
    if (os_log_type_enabled(v12, v11))
    {
      uint64_t v13 = swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      uint64_t v16 = v14;
      *(_DWORD *)uint64_t v13 = 136315138;
      *(void *)(v13 + 4) = sub_23CA3D448(0xD00000000000001ALL, 0x800000023CA49DC0, &v16);
      _os_log_impl(&dword_23CA21000, v12, v11, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23ECEED40](v14, -1, -1);
      MEMORY[0x23ECEED40](v13, -1, -1);
    }

    sub_23CA46A00();
    swift_getAtKeyPath();
    sub_23CA25180(a1, 0);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  return result;
}

uint64_t sub_23CA3C60C@<X0>(uint64_t a1@<X0>, char a2@<W1>, void *a3@<X8>)
{
  return sub_23CA3C6D8(a1, a2, (void (*)(uint64_t, void))sub_23CA279F8, 0xD000000000000023, 0x800000023CA49E20, (void (*)(void, void))sub_23CA25180, a3);
}

uint64_t sub_23CA3C650@<X0>(uint64_t a1@<X0>, char a2@<W1>, void *a3@<X8>)
{
  return sub_23CA3C6D8(a1, a2, (void (*)(uint64_t, void))sub_23CA3E068, 0xD000000000000012, 0x800000023CA49DE0, (void (*)(void, void))sub_23CA3E06C, a3);
}

uint64_t sub_23CA3C694@<X0>(uint64_t a1@<X0>, char a2@<W1>, void *a3@<X8>)
{
  return sub_23CA3C6D8(a1, a2, (void (*)(uint64_t, void))sub_23CA3E068, 0xD000000000000018, 0x800000023CA49E00, (void (*)(void, void))sub_23CA3E06C, a3);
}

uint64_t sub_23CA3C6D8@<X0>(uint64_t a1@<X0>, char a2@<W1>, void (*a3)(uint64_t, void)@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, void (*a6)(void, void)@<X5>, void *a7@<X8>)
{
  uint64_t v14 = sub_23CA46A10();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t result = MEMORY[0x270FA5388]();
  uint64_t v18 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    *a7 = a1;
  }
  else
  {
    a3(a1, 0);
    os_log_type_t v19 = sub_23CA46ED0();
    uint64_t v20 = sub_23CA46BE0();
    if (os_log_type_enabled(v20, v19))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v28 = a4;
      unint64_t v22 = a5;
      uint64_t v23 = v21;
      uint64_t v24 = swift_slowAlloc();
      objc_super v29 = a6;
      uint64_t v30 = v24;
      uint64_t v25 = v24;
      *(_DWORD *)uint64_t v23 = 136315138;
      *(void *)(v23 + 4) = sub_23CA3D448(v28, v22, &v30);
      _os_log_impl(&dword_23CA21000, v20, v19, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v23, 0xCu);
      swift_arrayDestroy();
      uint64_t v26 = v25;
      a6 = v29;
      MEMORY[0x23ECEED40](v26, -1, -1);
      MEMORY[0x23ECEED40](v23, -1, -1);
    }

    sub_23CA46A00();
    swift_getAtKeyPath();
    a6(a1, 0);
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v18, v14);
  }
  return result;
}

uint64_t sub_23CA3C8DC(uint64_t a1, uint64_t *a2, int *a3)
{
  *(void *)(v3 + 16) = a1;
  uint64_t v4 = *a2;
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)a3 + *a3);
  unsigned int v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v5;
  void *v5 = v3;
  v5[1] = sub_23CA3E058;
  return v7(v4);
}

uint64_t sub_23CA3C9B8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23CA3C9F0(uint64_t a1, uint64_t *a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_23CA38BC0;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t *, int *))((char *)&dword_268BC3760 + dword_268BC3760);
  return v8(a1, a2, v6);
}

uint64_t View.onApplePayShippingContactChange(perform:)(uint64_t a1, uint64_t a2)
{
  uint64_t KeyPath = swift_getKeyPath();
  unsigned int v5 = (void *)sub_23CA3C208(KeyPath, 0, &qword_268BC3818);
  swift_release();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  swift_retain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unsigned int v5 = sub_23CA3DDFC(0, v5[2] + 1, 1, v5, &qword_268BC3810);
  }
  unint64_t v8 = v5[2];
  unint64_t v7 = v5[3];
  if (v8 >= v7 >> 1) {
    unsigned int v5 = sub_23CA3DDFC((void *)(v7 > 1), v8 + 1, 1, v5, &qword_268BC3810);
  }
  v5[2] = v8 + 1;
  uint64_t v9 = &v5[2 * v8];
  v9[4] = &unk_268BC3778;
  v9[5] = v6;
  swift_getKeyPath();
  sub_23CA46C20();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_23CA3CC18()
{
  return sub_23CA3CFA4((void (*)(void))sub_23CA3DF70);
}

uint64_t sub_23CA3CC38@<X0>(void *a1@<X8>)
{
  return keypath_getTm((void (*)(void))sub_23CA3DF70, a1);
}

uint64_t sub_23CA3CC58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23CA3CE38(a1, a2, a3, a4, (void (*)(void))sub_23CA3DF70);
}

uint64_t View.onApplePayShippingMethodChange(perform:)(uint64_t a1, uint64_t a2)
{
  uint64_t KeyPath = swift_getKeyPath();
  unsigned int v5 = (void *)sub_23CA3C208(KeyPath, 0, &qword_268BC3800);
  swift_release();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  swift_retain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unsigned int v5 = sub_23CA3DDFC(0, v5[2] + 1, 1, v5, &qword_268BC37F8);
  }
  unint64_t v8 = v5[2];
  unint64_t v7 = v5[3];
  if (v8 >= v7 >> 1) {
    unsigned int v5 = sub_23CA3DDFC((void *)(v7 > 1), v8 + 1, 1, v5, &qword_268BC37F8);
  }
  v5[2] = v8 + 1;
  uint64_t v9 = &v5[2 * v8];
  v9[4] = &unk_268BC3788;
  v9[5] = v6;
  swift_getKeyPath();
  sub_23CA46C20();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_23CA3CDD8()
{
  return sub_23CA3CFA4((void (*)(void))sub_23CA3DF1C);
}

uint64_t sub_23CA3CDF8@<X0>(void *a1@<X8>)
{
  return keypath_getTm((void (*)(void))sub_23CA3DF1C, a1);
}

uint64_t sub_23CA3CE18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23CA3CE38(a1, a2, a3, a4, (void (*)(void))sub_23CA3DF1C);
}

uint64_t sub_23CA3CE38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void))
{
  return sub_23CA46A40();
}

uint64_t View.onApplePayCouponCodeChange(perform:)(uint64_t a1, uint64_t a2)
{
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3790);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_23CA48830;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  *(void *)(v4 + 32) = &unk_268BC37A0;
  *(void *)(v4 + 40) = v5;
  swift_retain();
  sub_23CA46C20();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_23CA3CF84()
{
  return sub_23CA3CFA4((void (*)(void))sub_23CA3DD9C);
}

uint64_t sub_23CA3CFA4(void (*a1)(void))
{
  a1();
  sub_23CA46A30();
  return v2;
}

uint64_t sub_23CA3CFEC@<X0>(void *a1@<X8>)
{
  return keypath_getTm((void (*)(void))sub_23CA3DD9C, a1);
}

uint64_t keypath_getTm@<X0>(void (*a1)(void)@<X3>, void *a2@<X8>)
{
  a1();
  uint64_t result = sub_23CA46A30();
  *a2 = v4;
  return result;
}

uint64_t sub_23CA3D068(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  if (*(void *)(*(void *)a1 + 16))
  {
    swift_bridgeObjectRetain();
    sub_23CA3DD9C();
    uint64_t v2 = (uint64_t (*)(void *, void))sub_23CA46A20();
    sub_23CA348A0(v1);
    return v2(v4, 0);
  }
  else
  {
    sub_23CA3DD9C();
    return sub_23CA46A40();
  }
}

uint64_t sub_23CA3D11C(uint64_t a1, uint64_t *a2, int *a3)
{
  *(void *)(v3 + 16) = a1;
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  unint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)a3 + *a3);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v6;
  void *v6 = v3;
  v6[1] = sub_23CA3D200;
  return v8(v4, v5);
}

uint64_t sub_23CA3D200(uint64_t a1)
{
  uint64_t v3 = *(void **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();
  *uint64_t v3 = a1;
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

void sub_23CA3D310()
{
  qword_268BC5538 = MEMORY[0x263F8EE78];
}

uint64_t sub_23CA3D324@<X0>(void *a1@<X8>)
{
  return sub_23CA3D3F0(&qword_268BC2D28, &qword_268BC5538, a1);
}

void sub_23CA3D348()
{
  qword_268BC5540 = MEMORY[0x263F8EE78];
}

uint64_t sub_23CA3D35C@<X0>(void *a1@<X8>)
{
  return sub_23CA3D3F0(&qword_268BC2D30, &qword_268BC5540, a1);
}

void sub_23CA3D380()
{
  qword_268BC5548 = MEMORY[0x263F8EE78];
}

uint64_t sub_23CA3D394@<X0>(void *a1@<X8>)
{
  return sub_23CA3D3F0(&qword_268BC2D38, &qword_268BC5548, a1);
}

void sub_23CA3D3B8()
{
  qword_268BC5550 = MEMORY[0x263F8EE78];
}

uint64_t sub_23CA3D3CC@<X0>(void *a1@<X8>)
{
  return sub_23CA3D3F0(&qword_268BC2D40, &qword_268BC5550, a1);
}

uint64_t sub_23CA3D3F0@<X0>(void *a1@<X2>, void *a2@<X3>, void *a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  *a3 = *a2;

  return swift_bridgeObjectRetain();
}

unint64_t sub_23CA3D448(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_23CA3D51C(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_23CA3DD3C((uint64_t)v12, *a3);
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
      sub_23CA3DD3C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_23CA3D51C(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          unint64_t result = 0;
          *((unsigned char *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    unint64_t result = sub_23CA3D61C(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = sub_23CA46FA0();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_23CA3D61C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_23CA3D6B4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_23CA3D7B8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_23CA3D7B8((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23CA3D6B4(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_9;
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
      unint64_t v3 = sub_23CA3D750(v2, 0);
      uint64_t result = sub_23CA46F70();
      if (v5) {
        break;
      }
      if (result == v2) {
        return (uint64_t)v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_23CA46E20();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_23CA3D750(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC37E8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_23CA3D7B8(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BC37E8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  os_log_type_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_23CA3D8A4@<X0>(void *a1@<X8>)
{
  return keypath_getTm((void (*)(void))sub_23CA3DF70, a1);
}

uint64_t sub_23CA3D8C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23CA3CE38(a1, a2, a3, a4, (void (*)(void))sub_23CA3DF70);
}

uint64_t sub_23CA3D8F8(uint64_t a1, uint64_t *a2)
{
  unint64_t v6 = *(int **)(v2 + 16);
  int64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_23CA38BC0;
  int64_t v8 = (uint64_t (*)(uint64_t, uint64_t *, int *))((char *)&dword_268BC3770 + dword_268BC3770);
  return v8(a1, a2, v6);
}

uint64_t sub_23CA3D9C0@<X0>(void *a1@<X8>)
{
  return keypath_getTm((void (*)(void))sub_23CA3DF1C, a1);
}

uint64_t sub_23CA3D9E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23CA3CE38(a1, a2, a3, a4, (void (*)(void))sub_23CA3DF1C);
}

uint64_t sub_23CA3DA14(uint64_t a1, uint64_t *a2)
{
  unint64_t v6 = *(int **)(v2 + 16);
  int64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_23CA38BC0;
  int64_t v8 = (uint64_t (*)(uint64_t, uint64_t *, int *))((char *)&dword_268BC3780 + dword_268BC3780);
  return v8(a1, a2, v6);
}

uint64_t sub_23CA3DADC@<X0>(void *a1@<X8>)
{
  return keypath_getTm((void (*)(void))sub_23CA3DD9C, a1);
}

uint64_t sub_23CA3DB00(uint64_t a1, uint64_t *a2)
{
  unint64_t v6 = *(int **)(v2 + 16);
  int64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_23CA27230;
  int64_t v8 = (uint64_t (*)(uint64_t, uint64_t *, int *))((char *)&dword_268BC3798 + dword_268BC3798);
  return v8(a1, a2, v6);
}

uint64_t sub_23CA3DBC8(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA30_EnvironmentKeyWritingModifierVySaySo35PKPaymentRequestPaymentMethodUpdateCSo0jM0CYacGGGAaBHPxAaBHD1__AlA0cI0HPyHCHCTm(a1, &qword_268BC37A8, &qword_268BC37B0);
}

uint64_t sub_23CA3DBDC(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA30_EnvironmentKeyWritingModifierVySaySo35PKPaymentRequestPaymentMethodUpdateCSo0jM0CYacGGGAaBHPxAaBHD1__AlA0cI0HPyHCHCTm(a1, &qword_268BC37B8, &qword_268BC37C0);
}

uint64_t get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA30_EnvironmentKeyWritingModifierVySaySo35PKPaymentRequestPaymentMethodUpdateCSo0jM0CYacGGGAaBHPxAaBHD1__AlA0cI0HPyHCHCTm(uint64_t a1, uint64_t *a2, unint64_t *a3)
{
  return swift_getWitnessTable();
}

uint64_t sub_23CA3DC74(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA30_EnvironmentKeyWritingModifierVySaySo35PKPaymentRequestPaymentMethodUpdateCSo0jM0CYacGGGAaBHPxAaBHD1__AlA0cI0HPyHCHCTm(a1, &qword_268BC37C8, &qword_268BC37D0);
}

uint64_t sub_23CA3DC88(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA30_EnvironmentKeyWritingModifierVySaySo35PKPaymentRequestPaymentMethodUpdateCSo0jM0CYacGGGAaBHPxAaBHD1__AlA0cI0HPyHCHCTm(a1, &qword_268BC37D8, &qword_268BC37E0);
}

uint64_t sub_23CA3DC9C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_23CA3DD3C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_23CA3DD9C()
{
  unint64_t result = qword_268BC37F0;
  if (!qword_268BC37F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC37F0);
  }
  return result;
}

void *sub_23CA3DDF0(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_23CA3DDFC(a1, a2, a3, a4, &qword_268BC3790);
}

void *sub_23CA3DDFC(void *result, int64_t a2, char a3, void *a4, uint64_t *a5)
{
  char v6 = (char)result;
  if (a3)
  {
    unint64_t v7 = a4[3];
    int64_t v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v8 = a2;
      }
    }
  }
  else
  {
    int64_t v8 = a2;
  }
  uint64_t v9 = a4[2];
  if (v8 <= v9) {
    uint64_t v10 = a4[2];
  }
  else {
    uint64_t v10 = v8;
  }
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    size_t v11 = (void *)swift_allocObject();
    int64_t v12 = _swift_stdlib_malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 17;
    }
    v11[2] = v9;
    v11[3] = 2 * (v13 >> 4);
  }
  else
  {
    size_t v11 = (void *)MEMORY[0x263F8EE78];
  }
  if (v6)
  {
    if (v11 != a4 || v11 + 4 >= &a4[2 * v9 + 4]) {
      memmove(v11 + 4, a4 + 4, 16 * v9);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_268BC3570);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v11;
}

unint64_t sub_23CA3DF1C()
{
  unint64_t result = qword_268BC3808;
  if (!qword_268BC3808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC3808);
  }
  return result;
}

unint64_t sub_23CA3DF70()
{
  unint64_t result = qword_268BC3820;
  if (!qword_268BC3820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC3820);
  }
  return result;
}

unint64_t sub_23CA3DFC4()
{
  unint64_t result = qword_268BC3838;
  if (!qword_268BC3838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC3838);
  }
  return result;
}

ValueMetadata *type metadata accessor for PayWithApplePayButtonPaymentMethodChangeKey()
{
  return &type metadata for PayWithApplePayButtonPaymentMethodChangeKey;
}

ValueMetadata *type metadata accessor for PayWithApplePayButtonShippingContactChangeKey()
{
  return &type metadata for PayWithApplePayButtonShippingContactChangeKey;
}

ValueMetadata *type metadata accessor for PayWithApplePayButtonShippingChangeKey()
{
  return &type metadata for PayWithApplePayButtonShippingChangeKey;
}

ValueMetadata *type metadata accessor for PayWithApplePayButtonCouponCodeChangeKey()
{
  return &type metadata for PayWithApplePayButtonCouponCodeChangeKey;
}

id sub_23CA3E070()
{
  uint64_t v0 = self;

  return objc_msgSend(v0, sel_openInstallWallet);
}

uint64_t sub_23CA3E0A8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3008);
  sub_23CA46CC0();
  return v1;
}

uint64_t sub_23CA3E100@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 52);
  uint64_t v5 = *(void *)v4;
  char v6 = *(unsigned char *)(v4 + 8);
  sub_23CA3E068(*(void *)v4, v6);
  sub_23CA3C650(v5, v6, a2);

  return sub_23CA3E06C(v5, v6);
}

uint64_t sub_23CA3E16C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 56);
  uint64_t v5 = *(void *)v4;
  char v6 = *(unsigned char *)(v4 + 8);
  sub_23CA3E068(*(void *)v4, v6);
  sub_23CA3C694(v5, v6, a2);

  return sub_23CA3E06C(v5, v6);
}

uint64_t PayLaterView.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v45 = a2;
  uint64_t v3 = sub_23CA46EB0();
  uint64_t v43 = *(void *)(v3 - 8);
  uint64_t v44 = v3;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v42 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(a1 - 8);
  uint64_t v40 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v4);
  long long v37 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC3848);
  uint64_t v34 = *(void *)(a1 + 16);
  uint64_t v35 = a1;
  sub_23CA46F30();
  sub_23CA46B40();
  unint64_t v8 = sub_23CA3E6FC();
  uint64_t v53 = *(void *)(a1 + 24);
  uint64_t v9 = v53;
  uint64_t WitnessTable = swift_getWitnessTable();
  unint64_t v51 = v8;
  uint64_t v52 = WitnessTable;
  swift_getWitnessTable();
  uint64_t v11 = sub_23CA46D30();
  uint64_t v38 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v32 - v12;
  sub_23CA46990();
  uint64_t v14 = sub_23CA469C0();
  uint64_t v41 = *(void *)(v14 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v33 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v36 = (uint64_t)&v32 - v17;
  uint64_t v18 = v34;
  uint64_t v46 = v34;
  uint64_t v47 = v9;
  uint64_t v19 = v39;
  uint64_t v48 = v39;
  sub_23CA46A50();
  sub_23CA46D20();
  uint64_t v20 = v37;
  uint64_t v21 = v19;
  uint64_t v22 = v35;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v37, v21, v35);
  unint64_t v23 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = v18;
  *(void *)(v24 + 24) = v9;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v24 + v23, v20, v22);
  uint64_t v25 = swift_getWitnessTable();
  uint64_t v26 = v42;
  sub_23CA274B0();
  uint64_t v27 = (uint64_t)v33;
  sub_23CA46C50();
  swift_release();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v26, v44);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v13, v11);
  uint64_t v28 = sub_23CA4264C(qword_268BC2F00, MEMORY[0x263F189F8]);
  uint64_t v49 = v25;
  uint64_t v50 = v28;
  swift_getWitnessTable();
  uint64_t v29 = v36;
  sub_23CA26A5C(v27, v14, v36);
  uint64_t v30 = *(void (**)(uint64_t, uint64_t))(v41 + 8);
  v30(v27, v14);
  sub_23CA26A5C(v29, v14, v45);
  return ((uint64_t (*)(uint64_t, uint64_t))v30)(v29, v14);
}

unint64_t sub_23CA3E6FC()
{
  unint64_t result = qword_268BC3850;
  if (!qword_268BC3850)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC3848);
    sub_23CA4264C(&qword_268BC3858, (void (*)(uint64_t))type metadata accessor for PayLaterViewWrapper);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC3850);
  }
  return result;
}

uint64_t type metadata accessor for PayLaterViewWrapper()
{
  uint64_t result = qword_268BC3908;
  if (!qword_268BC3908) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_23CA3E7F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v28 = a3;
  uint64_t v5 = sub_23CA46F30();
  uint64_t v26 = *(void *)(v5 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v25 = (uint64_t)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v24 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3848);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_23CA46B40();
  uint64_t v27 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v24 - v14;
  uint64_t v16 = a2;
  uint64_t v17 = type metadata accessor for PayLaterView();
  if (sub_23CA3E0A8())
  {
    sub_23CA3EB68(v17, (uint64_t)v12);
    sub_23CA3E6FC();
    uint64_t v29 = a2;
    swift_getWitnessTable();
    sub_23CA294B4((uint64_t)v12, v10);
    sub_23CA4277C((uint64_t)v12);
  }
  else
  {
    uint64_t v18 = a1 + *(int *)(v17 + 40);
    uint64_t v33 = a2;
    swift_getWitnessTable();
    sub_23CA26A5C(v18, v5, (uint64_t)v9);
    uint64_t v19 = v25;
    sub_23CA26A5C((uint64_t)v9, v5, v25);
    sub_23CA3E6FC();
    sub_23CA295AC(v19, v10, v5);
    uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
    v20(v19, v5);
    v20((uint64_t)v9, v5);
  }
  unint64_t v21 = sub_23CA3E6FC();
  uint64_t v32 = v16;
  uint64_t WitnessTable = swift_getWitnessTable();
  unint64_t v30 = v21;
  uint64_t v31 = WitnessTable;
  swift_getWitnessTable();
  sub_23CA26A5C((uint64_t)v15, v13, v28);
  return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v15, v13);
}

uint64_t sub_23CA3EB5C@<X0>(uint64_t a1@<X8>)
{
  return sub_23CA3E7F4(*(void *)(v1 + 32), *(void *)(v1 + 24), a1);
}

uint64_t sub_23CA3EB68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = type metadata accessor for PayLaterViewWrapper();
  uint64_t v6 = (int *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3848);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v12 = *v2;
  uint64_t v13 = (uint64_t)v2 + *(int *)(a1 + 36);
  uint64_t v14 = &v8[v6[7]];
  uint64_t v15 = sub_23CA46910();
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16);
  long long v24 = *(_OWORD *)(v2 + 1);
  v16(v14, v13, v15);
  sub_23CA3E16C(a1, v26);
  uint64_t v17 = *(void *)&v26[0];
  sub_23CA3E100(a1, &v25);
  uint64_t v18 = v25;
  *(_DWORD *)uint64_t v8 = v12;
  *(_OWORD *)(v8 + 4) = v24;
  *(void *)&v8[v6[8]] = v17;
  *(void *)&v8[v6[9]] = v18;
  sub_23CA46D70();
  sub_23CA469D0();
  sub_23CA427DC((uint64_t)v8, (uint64_t)v11);
  uint64_t v19 = &v11[*(int *)(v9 + 36)];
  long long v20 = v26[5];
  *((_OWORD *)v19 + 4) = v26[4];
  *((_OWORD *)v19 + 5) = v20;
  *((_OWORD *)v19 + 6) = v26[6];
  long long v21 = v26[1];
  *(_OWORD *)uint64_t v19 = v26[0];
  *((_OWORD *)v19 + 1) = v21;
  long long v22 = v26[3];
  *((_OWORD *)v19 + 2) = v26[2];
  *((_OWORD *)v19 + 3) = v22;
  sub_23CA42840((uint64_t)v8);
  return sub_23CA4289C((uint64_t)v11, a2, &qword_268BC3848);
}

uint64_t sub_23CA3EDEC()
{
  v0[2] = sub_23CA46E80();
  v0[3] = sub_23CA46E70();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  uint64_t v2 = type metadata accessor for PayLaterView();
  *uint64_t v1 = v0;
  v1[1] = sub_23CA30950;
  return sub_23CA3F1D0(v2);
}

uint64_t sub_23CA3EEBC()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = (int *)type metadata accessor for PayLaterView();
  uint64_t v3 = *(unsigned __int8 *)(*((void *)v2 - 1) + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = *(void *)(*((void *)v2 - 1) + 64);
  uint64_t v6 = v0 + v4;
  uint64_t v7 = v0 + v4 + v2[9];
  uint64_t v8 = sub_23CA46910();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = v0 + v4 + v2[10];
  uint64_t v10 = *(void *)(v1 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v9, 1, v1)) {
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v1);
  }
  swift_release();
  sub_23CA3E06C(*(void *)(v6 + v2[13]), *(unsigned char *)(v6 + v2[13] + 8));
  sub_23CA3E06C(*(void *)(v6 + v2[14]), *(unsigned char *)(v6 + v2[14] + 8));
  uint64_t v11 = v6 + v2[15];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3868);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_23CA46960();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  }
  else
  {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, v4 + v5, v3 | 7);
}

uint64_t type metadata accessor for PayLaterView()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_23CA3F0E8()
{
  type metadata accessor for PayLaterView();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_23CA27230;
  return sub_23CA3EDEC();
}

uint64_t sub_23CA3F1D0(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  sub_23CA46E80();
  v2[4] = sub_23CA46E70();
  uint64_t v4 = sub_23CA46E60();
  v2[5] = v4;
  v2[6] = v3;
  return MEMORY[0x270FA2498](sub_23CA3F268, v4, v3);
}

uint64_t sub_23CA3F268()
{
  uint64_t v1 = (uint64_t *)v0[3];
  uint64_t v2 = *((unsigned int *)v1 + 4);
  uint64_t v3 = (uint64_t)v1 + *(int *)(v0[2] + 36);
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  v0[7] = v6;
  void *v6 = v0;
  v6[1] = sub_23CA3F324;
  return MEMORY[0x270FA1258](v5, v4, v2, v3);
}

uint64_t sub_23CA3F324(char a1)
{
  uint64_t v2 = *v1;
  *(unsigned char *)(*v1 + 64) = a1;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 48);
  uint64_t v4 = *(void *)(v2 + 40);
  return MEMORY[0x270FA2498](sub_23CA3F44C, v4, v3);
}

uint64_t sub_23CA3F44C()
{
  swift_release();
  sub_23CA29BCC();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t PayLaterView<>.init(amount:currency:)@<X0>(unint64_t a1@<X0>, unint64_t a2@<X1>, unsigned int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  unsigned int v31 = a3;
  __int16 v6 = a2;
  int v7 = a1;
  uint64_t v34 = a5;
  uint64_t v26 = a4;
  unint64_t v27 = HIDWORD(a1);
  unint64_t v28 = HIWORD(a1);
  unint64_t v29 = a2 >> 16;
  unint64_t v30 = HIDWORD(a2);
  unint64_t v32 = HIWORD(a2);
  unsigned int v33 = HIWORD(a3);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(qword_268BC3878);
  uint64_t v9 = (int *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_23CA46910();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  v16(v15, a4, v12);
  uint64_t v25 = v9[12];
  v11[v25] = 1;
  *(void *)&v11[v9[13]] = 0x4041800000000000;
  uint64_t v17 = &v11[v9[14]];
  char v35 = 0;
  sub_23CA46CB0();
  uint64_t v18 = v37;
  *uint64_t v17 = v36;
  *((void *)v17 + 1) = v18;
  uint64_t v19 = &v11[v9[15]];
  *(void *)uint64_t v19 = swift_getKeyPath();
  v19[8] = 0;
  long long v20 = &v11[v9[16]];
  *(void *)long long v20 = swift_getKeyPath();
  v20[8] = 0;
  long long v21 = (uint64_t *)&v11[v9[17]];
  *long long v21 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3868);
  swift_storeEnumTagMultiPayload();
  *(_DWORD *)uint64_t v11 = v7;
  *((_WORD *)v11 + 2) = v27;
  *((_WORD *)v11 + 3) = v28;
  *((_WORD *)v11 + 4) = v6;
  *((_WORD *)v11 + 5) = v29;
  *((_WORD *)v11 + 6) = v30;
  *((_WORD *)v11 + 7) = v32;
  *((_WORD *)v11 + 8) = v31;
  *((_WORD *)v11 + 9) = v33;
  v16(&v11[v9[11]], (uint64_t)v15, v12);
  long long v22 = *(void (**)(char *, uint64_t))(v13 + 8);
  v22(v15, v12);
  v11[v25] = 0;
  sub_23CA4289C((uint64_t)v11, v34, qword_268BC3878);
  return ((uint64_t (*)(uint64_t, uint64_t))v22)(v26, v12);
}

void *sub_23CA3F794(uint64_t a1, int *a2)
{
  uint64_t v4 = v2;
  uint64_t v5 = sub_23CA46910();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23CA42694();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v4 + a2[5], v5);
  uint64_t v9 = (void *)sub_23CA46EE0();
  objc_msgSend(v9, sel_setDisplayStyle_, *(void *)(v4 + a2[6]));
  objc_msgSend(v9, sel_setAction_, *(void *)(v4 + a2[7]));
  return v9;
}

id sub_23CA3F8D4(void *a1, uint64_t a2, int *a3)
{
  uint64_t v5 = v3;
  uint64_t v7 = sub_23CA46910();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23CA46EF0();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v5 + a3[5], v7);
  sub_23CA46F00();
  objc_msgSend(a1, sel_setDisplayStyle_, *(void *)(v5 + a3[6]));
  return objc_msgSend(a1, sel_setAction_, *(void *)(v5 + a3[7]));
}

uint64_t sub_23CA3F9EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23CA4264C(&qword_268BC3918, (void (*)(uint64_t))type metadata accessor for PayLaterViewWrapper);

  return MEMORY[0x270F01780](a1, a2, a3, v6);
}

uint64_t sub_23CA3FA80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23CA4264C(&qword_268BC3918, (void (*)(uint64_t))type metadata accessor for PayLaterViewWrapper);

  return MEMORY[0x270F01718](a1, a2, a3, v6);
}

void sub_23CA3FB14()
{
}

uint64_t sub_23CA3FB6C@<X0>(void *a1@<X8>)
{
  return keypath_getTm_0((void (*)(void))sub_23CA42728, a1);
}

uint64_t sub_23CA3FB8C@<X0>(void *a1@<X8>)
{
  return keypath_getTm_0((void (*)(void))sub_23CA42728, a1);
}

uint64_t sub_23CA3FBAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, (void (*)(void))sub_23CA42728);
}

uint64_t sub_23CA3FBCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, (void (*)(void))sub_23CA42728);
}

uint64_t sub_23CA3FBEC@<X0>(void *a1@<X8>)
{
  return keypath_getTm_0((void (*)(void))sub_23CA426D4, a1);
}

uint64_t keypath_getTm_0@<X0>(void (*a1)(void)@<X3>, void *a2@<X8>)
{
  a1();
  uint64_t result = sub_23CA46A30();
  *a2 = v4;
  return result;
}

uint64_t sub_23CA3FC68@<X0>(void *a1@<X8>)
{
  return keypath_getTm_0((void (*)(void))sub_23CA426D4, a1);
}

uint64_t sub_23CA3FC88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, (void (*)(void))sub_23CA426D4);
}

uint64_t keypath_setTm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void))
{
  return sub_23CA46A40();
}

uint64_t sub_23CA3FCF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, (void (*)(void))sub_23CA426D4);
}

uint64_t sub_23CA3FD18()
{
  return sub_23CA469E0();
}

uint64_t sub_23CA3FD3C(uint64_t a1)
{
  uint64_t v2 = sub_23CA46960();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_23CA469F0();
}

uint64_t sub_23CA3FE08()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_23CA3FE4C()
{
  sub_23CA46910();
  if (v0 <= 0x3F)
  {
    sub_23CA46F30();
    if (v1 <= 0x3F)
    {
      sub_23CA41E60();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

uint64_t sub_23CA3FF84(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v56 = sub_23CA46910();
  uint64_t v5 = *(void *)(v56 - 8);
  int v6 = *(_DWORD *)(v5 + 80);
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(v5 + 64);
  uint64_t v57 = *(void *)(a3 + 16);
  uint64_t v9 = *(void *)(v57 - 8);
  int v10 = *(_DWORD *)(v9 + 80);
  uint64_t v11 = v10;
  size_t v12 = *(void *)(v9 + 64);
  if (!*(_DWORD *)(v9 + 84)) {
    ++v12;
  }
  size_t __n = v12;
  size_t v13 = v12 + 7;
  unint64_t v14 = (((((v12
           + 7
           + ((v8 + ((v6 + 20) & ~(unint64_t)v6) + v10) & ~(unint64_t)v10)) & 0xFFFFFFFFFFFFFFF8)
         + 15) & 0xFFFFFFFFFFFFFFF8)
       + 39) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v15 = *(void *)(sub_23CA46960() - 8);
  int v16 = *(_DWORD *)(v15 + 80);
  uint64_t v17 = v16 & 0xF8 | 7;
  uint64_t v18 = (v16 & 0xF8) + 16;
  uint64_t v19 = 8;
  if (*(void *)(v15 + 64) > 8uLL) {
    uint64_t v19 = *(void *)(v15 + 64);
  }
  unint64_t v20 = v10 | v6 | (unint64_t)v17;
  int v21 = (v10 | v6 | v16) & 0x100000;
  if (v20 != 7 || v21 != 0 || v19 + ((v18 + v14) & ~v17) + 1 > 0x18)
  {
    uint64_t v24 = *a2;
    *(void *)a1 = *a2;
    uint64_t v26 = v24 + ((v20 + 16) & ~v20);
LABEL_31:
    swift_retain();
    return v26;
  }
  uint64_t v53 = v18;
  uint64_t v54 = v19;
  uint64_t v51 = v15;
  unint64_t v25 = ~(unint64_t)v10;
  uint64_t v52 = ~v17;
  uint64_t v26 = a1;
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_DWORD *)(a1 + 16) = *((_DWORD *)a2 + 4);
  uint64_t v27 = (uint64_t)a2 + v7;
  uint64_t v28 = (a1 + v7 + 20) & ~v7;
  uint64_t v29 = (v27 + 20) & ~v7;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v28, v29, v56);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))((v29 + v8 + v11) & ~v11, 1, v57))
  {
    memcpy((void *)((v28 + v8 + v11) & v25), (const void *)((v29 + v8 + v11) & v25), __n);
  }
  else
  {
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16))((v28 + v8 + v11) & v25, (v29 + v8 + v11) & v25, v57);
    (*(void (**)(unint64_t, void, uint64_t, uint64_t))(v9 + 56))((v28 + v8 + v11) & v25, 0, 1, v57);
  }
  unsigned int v31 = (void *)((v13 + ((v28 + v8 + v11) & v25)) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v32 = (void *)((v13 + ((v29 + v8 + v11) & v25)) & 0xFFFFFFFFFFFFFFF8);
  *unsigned int v31 = *v32;
  unint64_t v33 = ((unint64_t)v31 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v34 = ((unint64_t)v32 + 15) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v33 = *(unsigned char *)v34;
  *(void *)(v33 + 8) = *(void *)(v34 + 8);
  unint64_t v35 = (v33 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v36 = (v34 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v37 = *(void *)v36;
  char v38 = *(unsigned char *)(v36 + 8);
  swift_retain();
  sub_23CA3E068(v37, v38);
  *(void *)unint64_t v35 = v37;
  *(unsigned char *)(v35 + 8) = v38;
  unint64_t v39 = (v33 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v40 = (v34 + 39) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v41 = *(void *)v40;
  char v42 = *(unsigned char *)(v40 + 8);
  sub_23CA3E068(*(void *)v40, v42);
  *(void *)unint64_t v39 = v41;
  *(unsigned char *)(v39 + 8) = v42;
  uint64_t v43 = (void *)((v53 + v39) & v52);
  uint64_t v44 = (unsigned __int8 *)((v53 + v40) & v52);
  unsigned int v45 = v44[v54];
  unsigned int v46 = v45 - 2;
  if (v45 >= 2)
  {
    if (v54 <= 3) {
      uint64_t v47 = v54;
    }
    else {
      uint64_t v47 = 4;
    }
    switch(v47)
    {
      case 1:
        int v48 = *v44;
        goto LABEL_26;
      case 2:
        int v48 = *(unsigned __int16 *)v44;
        goto LABEL_26;
      case 3:
        int v48 = *(unsigned __int16 *)v44 | (*(unsigned __int8 *)(((v53 + v40) & v52) + 2) << 16);
        goto LABEL_26;
      case 4:
        int v48 = *(_DWORD *)v44;
LABEL_26:
        int v49 = (v48 | (v46 << (8 * v54))) + 2;
        unsigned int v45 = v48 + 2;
        if (v54 < 4) {
          unsigned int v45 = v49;
        }
        break;
      default:
        break;
    }
  }
  if (v45 != 1)
  {
    *uint64_t v43 = *(void *)v44;
    *((unsigned char *)v43 + v54) = 0;
    goto LABEL_31;
  }
  (*(void (**)(void *))(v51 + 16))(v43);
  *((unsigned char *)v43 + v54) = 1;
  return v26;
}

uint64_t sub_23CA403D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23CA46910();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = v5 + 8;
  unint64_t v7 = (a1 + *(unsigned __int8 *)(v5 + 80) + 20) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v8 = *(void *)(a2 + 16);
  uint64_t v9 = *(void *)(v8 - 8);
  unint64_t v10 = (v7 + *(void *)(v6 + 56) + *(unsigned __int8 *)(v9 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v9 + 48))(v10, 1, v8)) {
    (*(void (**)(unint64_t, uint64_t))(v9 + 8))(v10, v8);
  }
  unint64_t v11 = v10 + *(void *)(v9 + 64);
  if (!*(_DWORD *)(v9 + 84)) {
    ++v11;
  }
  unint64_t v12 = (((v11 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  sub_23CA3E06C(*(void *)((v12 + 23) & 0xFFFFFFFFFFFFFFF8), *(unsigned char *)(((v12 + 23) & 0xFFFFFFFFFFFFFFF8) + 8));
  unint64_t v13 = (v12 + 39) & 0xFFFFFFFFFFFFFFF8;
  sub_23CA3E06C(*(void *)v13, *(unsigned char *)(v13 + 8));
  uint64_t v14 = *(void *)(sub_23CA46960() - 8);
  uint64_t v15 = *(_DWORD *)(v14 + 80) & 0xF8 | 7;
  int v16 = (unsigned __int8 *)((v13 + v15 + 9) & ~v15);
  unint64_t v17 = *(void *)(v14 + 64);
  if (v17 <= 8) {
    unint64_t v17 = 8;
  }
  unsigned int v18 = v16[v17];
  unsigned int v19 = v18 - 2;
  if (v18 >= 2)
  {
    if (v17 <= 3) {
      uint64_t v20 = v17;
    }
    else {
      uint64_t v20 = 4;
    }
    switch(v20)
    {
      case 1:
        int v21 = *v16;
        goto LABEL_16;
      case 2:
        int v21 = *(unsigned __int16 *)v16;
        goto LABEL_16;
      case 3:
        int v21 = *(unsigned __int16 *)v16 | (v16[2] << 16);
        goto LABEL_16;
      case 4:
        int v21 = *(_DWORD *)v16;
LABEL_16:
        int v22 = (v21 | (v19 << (8 * v17))) + 2;
        unsigned int v18 = v21 + 2;
        if (v17 < 4) {
          unsigned int v18 = v22;
        }
        break;
      default:
        break;
    }
  }
  if (v18 == 1)
  {
    unint64_t v23 = *(uint64_t (**)(void))(v14 + 8);
    return v23();
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_23CA40668(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  uint64_t v6 = sub_23CA46910();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v7 + 16;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = (v9 + 20 + a1) & ~v9;
  uint64_t v11 = (v9 + 20 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v10, v11, v6);
  uint64_t v12 = *(void *)(v8 + 48);
  uint64_t v13 = *(void *)(a3 + 16);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v16 = v12 + v15;
  unint64_t v17 = (void *)((v16 + v10) & ~v15);
  unsigned int v18 = (const void *)((v16 + v11) & ~v15);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v14 + 48))(v18, 1, v13))
  {
    int v19 = *(_DWORD *)(v14 + 84);
    uint64_t v20 = *(void *)(v14 + 64);
    if (v19) {
      size_t v21 = *(void *)(v14 + 64);
    }
    else {
      size_t v21 = v20 + 1;
    }
    memcpy(v17, v18, v21);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v14 + 16))(v17, v18, v13);
    unint64_t v23 = *(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56);
    uint64_t v22 = v14 + 56;
    v23(v17, 0, 1, v13);
    int v19 = *(_DWORD *)(v22 + 28);
    uint64_t v20 = *(void *)(v22 + 8);
  }
  if (v19) {
    uint64_t v24 = v20;
  }
  else {
    uint64_t v24 = v20 + 1;
  }
  unint64_t v25 = (void *)(((unint64_t)v17 + v24 + 7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v26 = (void *)(((unint64_t)v18 + v24 + 7) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v25 = *v26;
  unint64_t v27 = ((unint64_t)v25 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v28 = ((unint64_t)v26 + 15) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v27 = *(unsigned char *)v28;
  *(void *)(v27 + 8) = *(void *)(v28 + 8);
  unint64_t v29 = (v27 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v30 = (v28 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v31 = *(void *)v30;
  char v32 = *(unsigned char *)(v30 + 8);
  swift_retain();
  sub_23CA3E068(v31, v32);
  *(void *)unint64_t v29 = v31;
  *(unsigned char *)(v29 + 8) = v32;
  unint64_t v33 = (v27 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v34 = (v28 + 39) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v35 = *(void *)v34;
  char v36 = *(unsigned char *)(v34 + 8);
  sub_23CA3E068(*(void *)v34, v36);
  *(void *)unint64_t v33 = v35;
  *(unsigned char *)(v33 + 8) = v36;
  uint64_t v37 = *(void *)(sub_23CA46960() - 8);
  uint64_t v38 = *(_DWORD *)(v37 + 80) & 0xF8;
  uint64_t v39 = v38 + 16;
  unint64_t v40 = v38 + 16 + v33;
  unint64_t v41 = ~v38 & 0xFFFFFFFFFFFFFFF8;
  char v42 = (void *)(v40 & v41);
  uint64_t v43 = (unsigned __int8 *)((v39 + v34) & v41);
  if (*(void *)(v37 + 64) <= 8uLL) {
    uint64_t v44 = 8;
  }
  else {
    uint64_t v44 = *(void *)(v37 + 64);
  }
  unsigned int v45 = v43[v44];
  unsigned int v46 = v45 - 2;
  if (v45 >= 2)
  {
    if (v44 <= 3) {
      uint64_t v47 = v44;
    }
    else {
      uint64_t v47 = 4;
    }
    switch(v47)
    {
      case 1:
        int v48 = *v43;
        goto LABEL_22;
      case 2:
        int v48 = *(unsigned __int16 *)v43;
        goto LABEL_22;
      case 3:
        int v48 = *(unsigned __int16 *)((v39 + v34) & v41) | (*(unsigned __int8 *)(((v39 + v34) & v41) + 2) << 16);
        goto LABEL_22;
      case 4:
        int v48 = *(_DWORD *)v43;
LABEL_22:
        int v49 = (v48 | (v46 << (8 * v44))) + 2;
        unsigned int v45 = v48 + 2;
        if (v44 < 4) {
          unsigned int v45 = v49;
        }
        break;
      default:
        break;
    }
  }
  if (v45 == 1)
  {
    (*(void (**)(void *))(v37 + 16))(v42);
    char v50 = 1;
  }
  else
  {
    void *v42 = *(void *)v43;
    swift_retain();
    char v50 = 0;
  }
  *((unsigned char *)v42 + v44) = v50;
  return a1;
}

uint64_t sub_23CA409C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_WORD *)(a1 + 4) = *(_WORD *)(a2 + 4);
  *(_WORD *)(a1 + 6) = *(_WORD *)(a2 + 6);
  *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
  *(_WORD *)(a1 + 10) = *(_WORD *)(a2 + 10);
  *(_WORD *)(a1 + 12) = *(_WORD *)(a2 + 12);
  *(_WORD *)(a1 + 14) = *(_WORD *)(a2 + 14);
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(_WORD *)(a1 + 18) = *(_WORD *)(a2 + 18);
  uint64_t v6 = sub_23CA46910();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v7 + 24;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = (v9 + 20 + a1) & ~v9;
  uint64_t v11 = (v9 + 20 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24))(v10, v11, v6);
  uint64_t v12 = *(void *)(v8 + 40);
  uint64_t v13 = *(void *)(a3 + 16);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v16 = v12 + v15;
  unint64_t v17 = (void *)((v16 + v10) & ~v15);
  unsigned int v18 = (void *)((v16 + v11) & ~v15);
  int v19 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v14 + 48);
  LODWORD(v11) = v19(v17, 1, v13);
  int v20 = v19(v18, 1, v13);
  if (v11)
  {
    if (!v20)
    {
      (*(void (**)(void *, void *, uint64_t))(v14 + 16))(v17, v18, v13);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v17, 0, 1, v13);
      goto LABEL_12;
    }
    int v21 = *(_DWORD *)(v14 + 84);
    size_t v22 = *(void *)(v14 + 64);
  }
  else
  {
    if (!v20)
    {
      (*(void (**)(void *, void *, uint64_t))(v14 + 24))(v17, v18, v13);
      goto LABEL_12;
    }
    (*(void (**)(void *, uint64_t))(v14 + 8))(v17, v13);
    int v21 = *(_DWORD *)(v14 + 84);
    size_t v22 = *(void *)(v14 + 64);
  }
  if (v21) {
    size_t v23 = v22;
  }
  else {
    size_t v23 = v22 + 1;
  }
  memcpy(v17, v18, v23);
LABEL_12:
  if (*(_DWORD *)(v14 + 84)) {
    uint64_t v24 = *(void *)(v14 + 64);
  }
  else {
    uint64_t v24 = *(void *)(v14 + 64) + 1;
  }
  unint64_t v25 = (void *)(((unint64_t)v17 + v24 + 7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v26 = (void *)(((unint64_t)v18 + v24 + 7) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v25 = *v26;
  unint64_t v27 = ((unint64_t)v25 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v28 = ((unint64_t)v26 + 15) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v27 = *(unsigned char *)v28;
  *(void *)(v27 + 8) = *(void *)(v28 + 8);
  swift_retain();
  swift_release();
  unint64_t v29 = (v27 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v30 = (v28 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v31 = *(void *)v30;
  char v32 = *(unsigned char *)(v30 + 8);
  sub_23CA3E068(*(void *)v30, v32);
  uint64_t v33 = *(void *)v29;
  char v34 = *(unsigned char *)(v29 + 8);
  *(void *)unint64_t v29 = v31;
  *(unsigned char *)(v29 + 8) = v32;
  sub_23CA3E06C(v33, v34);
  unint64_t v35 = (v27 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v36 = (v28 + 39) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v37 = *(void *)v36;
  char v38 = *(unsigned char *)(v36 + 8);
  sub_23CA3E068(*(void *)v36, v38);
  uint64_t v39 = *(void *)v35;
  char v40 = *(unsigned char *)(v35 + 8);
  *(void *)unint64_t v35 = v37;
  *(unsigned char *)(v35 + 8) = v38;
  sub_23CA3E06C(v39, v40);
  uint64_t v41 = sub_23CA46960();
  uint64_t v42 = *(void *)(v41 - 8);
  uint64_t v43 = *(_DWORD *)(v42 + 80) & 0xF8;
  uint64_t v44 = v43 + 16;
  unint64_t v45 = v43 + 16 + v35;
  unint64_t v46 = ~v43 & 0xFFFFFFFFFFFFFFF8;
  uint64_t v47 = (unsigned __int8 *)(v45 & v46);
  uint64_t v48 = v44 + v36;
  int v49 = (unsigned __int8 *)(v48 & v46);
  if ((v45 & v46) != (v48 & v46))
  {
    uint64_t v50 = v41;
    uint64_t v51 = *(void *)(v41 - 8);
    if (*(void *)(v42 + 64) <= 8uLL) {
      uint64_t v52 = 8;
    }
    else {
      uint64_t v52 = *(void *)(v42 + 64);
    }
    unsigned int v53 = v47[v52];
    unsigned int v54 = v53 - 2;
    if (v53 >= 2)
    {
      if (v52 <= 3) {
        uint64_t v55 = v52;
      }
      else {
        uint64_t v55 = 4;
      }
      switch(v55)
      {
        case 1:
          int v56 = *v47;
          goto LABEL_28;
        case 2:
          int v56 = *(unsigned __int16 *)v47;
          goto LABEL_28;
        case 3:
          int v56 = *(unsigned __int16 *)v47 | (v47[2] << 16);
          goto LABEL_28;
        case 4:
          int v56 = *(_DWORD *)v47;
LABEL_28:
          int v57 = (v56 | (v54 << (8 * v52))) + 2;
          unsigned int v53 = v56 + 2;
          if (v52 < 4) {
            unsigned int v53 = v57;
          }
          break;
        default:
          break;
      }
    }
    if (v53 == 1) {
      (*(void (**)(unsigned __int8 *, uint64_t))(v51 + 8))(v47, v41);
    }
    else {
      swift_release();
    }
    unsigned int v58 = v49[v52];
    unsigned int v59 = v58 - 2;
    if (v58 >= 2)
    {
      if (v52 <= 3) {
        uint64_t v60 = v52;
      }
      else {
        uint64_t v60 = 4;
      }
      switch(v60)
      {
        case 1:
          int v61 = *v49;
          goto LABEL_42;
        case 2:
          int v61 = *(unsigned __int16 *)v49;
          goto LABEL_42;
        case 3:
          int v61 = *(unsigned __int16 *)v49 | (v49[2] << 16);
          goto LABEL_42;
        case 4:
          int v61 = *(_DWORD *)v49;
LABEL_42:
          int v62 = (v61 | (v59 << (8 * v52))) + 2;
          unsigned int v58 = v61 + 2;
          if (v52 < 4) {
            unsigned int v58 = v62;
          }
          break;
        default:
          break;
      }
    }
    if (v58 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v51 + 16))(v47, v49, v50);
      v47[v52] = 1;
    }
    else
    {
      *(void *)uint64_t v47 = *(void *)v49;
      v47[v52] = 0;
      swift_retain();
    }
  }
  return a1;
}

uint64_t sub_23CA40EA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  uint64_t v6 = sub_23CA46910();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v7 + 32;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = (v9 + 20 + a1) & ~v9;
  uint64_t v11 = (v9 + 20 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v10, v11, v6);
  uint64_t v12 = *(void *)(v8 + 32);
  uint64_t v13 = *(void *)(a3 + 16);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v16 = v12 + v15;
  unint64_t v17 = (void *)((v16 + v10) & ~v15);
  unsigned int v18 = (const void *)((v16 + v11) & ~v15);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v14 + 48))(v18, 1, v13))
  {
    int v19 = *(_DWORD *)(v14 + 84);
    uint64_t v20 = *(void *)(v14 + 64);
    if (v19) {
      size_t v21 = *(void *)(v14 + 64);
    }
    else {
      size_t v21 = v20 + 1;
    }
    memcpy(v17, v18, v21);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v14 + 32))(v17, v18, v13);
    size_t v23 = *(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56);
    uint64_t v22 = v14 + 56;
    v23(v17, 0, 1, v13);
    int v19 = *(_DWORD *)(v22 + 28);
    uint64_t v20 = *(void *)(v22 + 8);
  }
  if (v19) {
    uint64_t v24 = v20;
  }
  else {
    uint64_t v24 = v20 + 1;
  }
  unint64_t v25 = (void *)(((unint64_t)v17 + v24 + 7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v26 = (void *)(((unint64_t)v18 + v24 + 7) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v25 = *v26;
  unint64_t v27 = (_OWORD *)(((unint64_t)v25 + 15) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v28 = (_OWORD *)(((unint64_t)v26 + 15) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v27 = *v28;
  unint64_t v29 = ((unint64_t)v27 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v30 = ((unint64_t)v28 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v31 = *(void *)v30;
  *(unsigned char *)(v29 + 8) = *(unsigned char *)(v30 + 8);
  *(void *)unint64_t v29 = v31;
  unint64_t v32 = ((unint64_t)v28 + 39) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v33 = *(void *)v32;
  unint64_t v34 = ((unint64_t)v27 + 39) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)(v34 + 8) = *(unsigned char *)(v32 + 8);
  *(void *)unint64_t v34 = v33;
  uint64_t v35 = *(void *)(sub_23CA46960() - 8);
  uint64_t v36 = *(_DWORD *)(v35 + 80) & 0xF8;
  uint64_t v37 = v36 + 16;
  unint64_t v38 = v36 + 16 + v34;
  unint64_t v39 = ~v36 & 0xFFFFFFFFFFFFFFF8;
  char v40 = (void *)(v38 & v39);
  uint64_t v41 = (unsigned __int8 *)((v37 + v32) & v39);
  if (*(void *)(v35 + 64) <= 8uLL) {
    uint64_t v42 = 8;
  }
  else {
    uint64_t v42 = *(void *)(v35 + 64);
  }
  unsigned int v43 = v41[v42];
  unsigned int v44 = v43 - 2;
  if (v43 >= 2)
  {
    if (v42 <= 3) {
      uint64_t v45 = v42;
    }
    else {
      uint64_t v45 = 4;
    }
    switch(v45)
    {
      case 1:
        int v46 = *v41;
        goto LABEL_22;
      case 2:
        int v46 = *(unsigned __int16 *)v41;
        goto LABEL_22;
      case 3:
        int v46 = *(unsigned __int16 *)v41 | (v41[2] << 16);
        goto LABEL_22;
      case 4:
        int v46 = *(_DWORD *)v41;
LABEL_22:
        int v47 = (v46 | (v44 << (8 * v42))) + 2;
        unsigned int v43 = v46 + 2;
        if (v42 < 4) {
          unsigned int v43 = v47;
        }
        break;
      default:
        break;
    }
  }
  if (v43 == 1)
  {
    (*(void (**)(void *))(v35 + 32))(v40);
    char v48 = 1;
  }
  else
  {
    char v48 = 0;
    *char v40 = *(void *)v41;
  }
  *((unsigned char *)v40 + v42) = v48;
  return a1;
}

uint64_t sub_23CA411D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 4) = *(_OWORD *)(a2 + 4);
  uint64_t v6 = sub_23CA46910();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v7 + 40;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = (v9 + 20 + a1) & ~v9;
  uint64_t v11 = (v9 + 20 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40))(v10, v11, v6);
  uint64_t v12 = *(void *)(v8 + 24);
  uint64_t v13 = *(void *)(a3 + 16);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v16 = v12 + v15;
  unint64_t v17 = (void *)((v16 + v10) & ~v15);
  unsigned int v18 = (void *)((v16 + v11) & ~v15);
  int v19 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v14 + 48);
  LODWORD(v11) = v19(v17, 1, v13);
  int v20 = v19(v18, 1, v13);
  if (v11)
  {
    if (!v20)
    {
      (*(void (**)(void *, void *, uint64_t))(v14 + 32))(v17, v18, v13);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v17, 0, 1, v13);
      goto LABEL_12;
    }
    int v21 = *(_DWORD *)(v14 + 84);
    size_t v22 = *(void *)(v14 + 64);
  }
  else
  {
    if (!v20)
    {
      (*(void (**)(void *, void *, uint64_t))(v14 + 40))(v17, v18, v13);
      goto LABEL_12;
    }
    (*(void (**)(void *, uint64_t))(v14 + 8))(v17, v13);
    int v21 = *(_DWORD *)(v14 + 84);
    size_t v22 = *(void *)(v14 + 64);
  }
  if (v21) {
    size_t v23 = v22;
  }
  else {
    size_t v23 = v22 + 1;
  }
  memcpy(v17, v18, v23);
LABEL_12:
  if (*(_DWORD *)(v14 + 84)) {
    uint64_t v24 = *(void *)(v14 + 64);
  }
  else {
    uint64_t v24 = *(void *)(v14 + 64) + 1;
  }
  unint64_t v25 = (void *)(((unint64_t)v17 + v24 + 7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v26 = (void *)(((unint64_t)v18 + v24 + 7) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v25 = *v26;
  unint64_t v27 = ((unint64_t)v25 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v28 = ((unint64_t)v26 + 15) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v27 = *(unsigned char *)v28;
  *(void *)(v27 + 8) = *(void *)(v28 + 8);
  swift_release();
  unint64_t v29 = (v27 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v30 = (v28 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v31 = *(void *)v30;
  LOBYTE(v30) = *(unsigned char *)(v30 + 8);
  uint64_t v32 = *(void *)v29;
  char v33 = *(unsigned char *)(v29 + 8);
  *(void *)unint64_t v29 = v31;
  *(unsigned char *)(v29 + 8) = v30;
  sub_23CA3E06C(v32, v33);
  unint64_t v34 = (v27 + 39) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v35 = (v28 + 39) & 0xFFFFFFFFFFFFFFF8;
  char v36 = *(unsigned char *)(v35 + 8);
  uint64_t v37 = *(void *)v34;
  char v38 = *(unsigned char *)(v34 + 8);
  *(void *)unint64_t v34 = *(void *)v35;
  *(unsigned char *)(v34 + 8) = v36;
  sub_23CA3E06C(v37, v38);
  uint64_t v39 = sub_23CA46960();
  uint64_t v40 = *(void *)(v39 - 8);
  uint64_t v41 = *(_DWORD *)(v40 + 80) & 0xF8;
  uint64_t v42 = v41 + 16;
  unint64_t v43 = v41 + 16 + v34;
  unint64_t v44 = ~v41 & 0xFFFFFFFFFFFFFFF8;
  uint64_t v45 = (unsigned __int8 *)(v43 & v44);
  uint64_t v46 = v42 + v35;
  int v47 = (unsigned __int8 *)(v46 & v44);
  if ((v43 & v44) != (v46 & v44))
  {
    uint64_t v48 = v39;
    uint64_t v49 = *(void *)(v39 - 8);
    if (*(void *)(v40 + 64) <= 8uLL) {
      uint64_t v50 = 8;
    }
    else {
      uint64_t v50 = *(void *)(v40 + 64);
    }
    unsigned int v51 = v45[v50];
    unsigned int v52 = v51 - 2;
    if (v51 >= 2)
    {
      if (v50 <= 3) {
        uint64_t v53 = v50;
      }
      else {
        uint64_t v53 = 4;
      }
      switch(v53)
      {
        case 1:
          int v54 = *v45;
          goto LABEL_28;
        case 2:
          int v54 = *(unsigned __int16 *)v45;
          goto LABEL_28;
        case 3:
          int v54 = *(unsigned __int16 *)v45 | (v45[2] << 16);
          goto LABEL_28;
        case 4:
          int v54 = *(_DWORD *)v45;
LABEL_28:
          int v55 = (v54 | (v52 << (8 * v50))) + 2;
          unsigned int v51 = v54 + 2;
          if (v50 < 4) {
            unsigned int v51 = v55;
          }
          break;
        default:
          break;
      }
    }
    if (v51 == 1) {
      (*(void (**)(unsigned __int8 *, uint64_t))(v49 + 8))(v45, v39);
    }
    else {
      swift_release();
    }
    unsigned int v56 = v47[v50];
    unsigned int v57 = v56 - 2;
    if (v56 >= 2)
    {
      if (v50 <= 3) {
        uint64_t v58 = v50;
      }
      else {
        uint64_t v58 = 4;
      }
      switch(v58)
      {
        case 1:
          int v59 = *v47;
          goto LABEL_42;
        case 2:
          int v59 = *(unsigned __int16 *)v47;
          goto LABEL_42;
        case 3:
          int v59 = *(unsigned __int16 *)v47 | (v47[2] << 16);
          goto LABEL_42;
        case 4:
          int v59 = *(_DWORD *)v47;
LABEL_42:
          int v60 = (v59 | (v57 << (8 * v50))) + 2;
          unsigned int v56 = v59 + 2;
          if (v50 < 4) {
            unsigned int v56 = v60;
          }
          break;
        default:
          break;
      }
    }
    if (v56 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v49 + 32))(v45, v47, v48);
      char v61 = 1;
    }
    else
    {
      char v61 = 0;
      *(void *)uint64_t v45 = *(void *)v47;
    }
    v45[v50] = v61;
  }
  return a1;
}

uint64_t sub_23CA41664(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = sub_23CA46910();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v33 = *(void *)(a3 + 16);
  uint64_t v34 = v5;
  uint64_t v7 = *(void *)(v33 - 8);
  uint64_t v8 = *(unsigned int *)(v6 + 84);
  uint64_t v9 = *(unsigned int *)(v7 + 84);
  if (v9) {
    unsigned int v10 = v9 - 1;
  }
  else {
    unsigned int v10 = 0;
  }
  if (v10 <= v8) {
    unsigned int v11 = *(_DWORD *)(v6 + 84);
  }
  else {
    unsigned int v11 = v10;
  }
  if (v11 <= 0x7FFFFFFE) {
    unsigned int v12 = 2147483646;
  }
  else {
    unsigned int v12 = v11;
  }
  uint64_t v13 = *(void *)(sub_23CA46960() - 8);
  if (*(void *)(v13 + 64) <= 8uLL) {
    uint64_t v14 = 8;
  }
  else {
    uint64_t v14 = *(void *)(v13 + 64);
  }
  uint64_t v15 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v16 = *(void *)(v6 + 64);
  uint64_t v17 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v18 = *(void *)(v7 + 64);
  if (!v9) {
    ++v18;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v19 = v18 + 7;
  if (a2 > v12)
  {
    uint64_t v20 = *(_DWORD *)(v13 + 80) & 0xF8 | 7;
    unint64_t v21 = v14
        + ((v20
          + ((((((v19 + ((v16 + ((v15 + 20) & ~v15) + v17) & ~v17)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
            + 39) & 0xFFFFFFFFFFFFFFF8)
          + 9) & ~v20)
        + 1;
    char v22 = 8 * v21;
    if (v21 > 3) {
      goto LABEL_18;
    }
    unsigned int v24 = ((a2 - v12 + ~(-1 << v22)) >> v22) + 1;
    if (HIWORD(v24))
    {
      int v23 = *(_DWORD *)((char *)a1 + v21);
      if (!v23) {
        goto LABEL_33;
      }
      goto LABEL_25;
    }
    if (v24 > 0xFF)
    {
      int v23 = *(unsigned __int16 *)((char *)a1 + v21);
      if (!*(unsigned __int16 *)((char *)a1 + v21)) {
        goto LABEL_33;
      }
      goto LABEL_25;
    }
    if (v24 >= 2)
    {
LABEL_18:
      int v23 = *((unsigned __int8 *)a1 + v21);
      if (!*((unsigned char *)a1 + v21)) {
        goto LABEL_33;
      }
LABEL_25:
      int v25 = (v23 - 1) << v22;
      if (v21 > 3) {
        int v25 = 0;
      }
      if (v21)
      {
        if (v21 > 3) {
          LODWORD(v21) = 4;
        }
        switch((int)v21)
        {
          case 2:
            LODWORD(v21) = *a1;
            break;
          case 3:
            LODWORD(v21) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
            break;
          case 4:
            LODWORD(v21) = *(_DWORD *)a1;
            break;
          default:
            LODWORD(v21) = *(unsigned __int8 *)a1;
            break;
        }
      }
      int v31 = v12 + (v21 | v25);
      return (v31 + 1);
    }
  }
LABEL_33:
  uint64_t v26 = ((unint64_t)a1 + v15 + 20) & ~v15;
  if (v8 != v12)
  {
    uint64_t v29 = (v26 + v16 + v17) & ~v17;
    if (v10 == v12)
    {
      if (v9 >= 2)
      {
        unsigned int v32 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v29, v9, v33);
        if (v32 >= 2) {
          return v32 - 1;
        }
        else {
          return 0;
        }
      }
      return 0;
    }
    unint64_t v30 = *(void *)(((((v19 + v29) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8);
    if (v30 >= 0xFFFFFFFF) {
      LODWORD(v30) = -1;
    }
    int v31 = v30 - 1;
    if (v31 < 0) {
      int v31 = -1;
    }
    return (v31 + 1);
  }
  unint64_t v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);

  return v27(v26, v8, v34);
}

void sub_23CA419F4(unsigned char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7 = sub_23CA46910();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v40 = v8;
  uint64_t v38 = *(void *)(a4 + 16);
  uint64_t v39 = v7;
  uint64_t v9 = *(void *)(v38 - 8);
  uint64_t v10 = *(unsigned int *)(v8 + 84);
  uint64_t v11 = *(unsigned int *)(v9 + 84);
  if (v11) {
    unsigned int v12 = v11 - 1;
  }
  else {
    unsigned int v12 = 0;
  }
  if (v12 <= v10) {
    unsigned int v13 = *(_DWORD *)(v8 + 84);
  }
  else {
    unsigned int v13 = v12;
  }
  if (v13 <= 0x7FFFFFFE) {
    unsigned int v14 = 2147483646;
  }
  else {
    unsigned int v14 = v13;
  }
  uint64_t v15 = sub_23CA46960();
  int v16 = 0;
  uint64_t v17 = *(void *)(v15 - 8);
  if (*(void *)(v17 + 64) <= 8uLL) {
    uint64_t v18 = 8;
  }
  else {
    uint64_t v18 = *(void *)(v17 + 64);
  }
  uint64_t v19 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v20 = *(void *)(v8 + 64);
  uint64_t v21 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v22 = *(void *)(v9 + 64);
  if (!v11) {
    ++v22;
  }
  uint64_t v23 = v22 + 7;
  uint64_t v24 = *(_DWORD *)(v17 + 80) & 0xF8 | 7;
  size_t v25 = v18
      + ((v24
        + ((((((v23 + ((v20 + ((v19 + 20) & ~v19) + v21) & ~v21)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
          + 39) & 0xFFFFFFFFFFFFFFF8)
        + 9) & ~v24)
      + 1;
  if (a3 <= v14) {
    goto LABEL_23;
  }
  if (v25 <= 3)
  {
    unsigned int v26 = ((a3 - v14 + ~(-1 << (8 * v25))) >> (8 * v25)) + 1;
    if (HIWORD(v26))
    {
      int v16 = 4;
      if (v14 >= a2) {
        goto LABEL_31;
      }
LABEL_24:
      unsigned int v27 = ~v14 + a2;
      if (v25 < 4)
      {
        int v29 = (v27 >> (8 * v25)) + 1;
        if (v25)
        {
          int v30 = v16;
          int v31 = v27 & ~(-1 << (8 * v25));
          bzero(a1, v25);
          if (v25 == 3)
          {
            *(_WORD *)a1 = v31;
            a1[2] = BYTE2(v31);
            int v16 = v30;
          }
          else
          {
            int v16 = v30;
            if (v25 == 2) {
              *(_WORD *)a1 = v31;
            }
            else {
              *a1 = v31;
            }
          }
        }
      }
      else
      {
        int v28 = v16;
        bzero(a1, v25);
        int v16 = v28;
        *(_DWORD *)a1 = v27;
        int v29 = 1;
      }
      switch(v16)
      {
        case 1:
          a1[v25] = v29;
          break;
        case 2:
          *(_WORD *)&a1[v25] = v29;
          break;
        case 3:
LABEL_56:
          __break(1u);
          JUMPOUT(0x23CA41E38);
        case 4:
          *(_DWORD *)&a1[v25] = v29;
          break;
        default:
          return;
      }
      return;
    }
    if (v26 >= 0x100) {
      int v16 = 2;
    }
    else {
      int v16 = v26 > 1;
    }
LABEL_23:
    if (v14 >= a2) {
      goto LABEL_31;
    }
    goto LABEL_24;
  }
  int v16 = 1;
  if (v14 < a2) {
    goto LABEL_24;
  }
LABEL_31:
  switch(v16)
  {
    case 1:
      a1[v25] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_36;
    case 2:
      *(_WORD *)&a1[v25] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_36;
    case 3:
      goto LABEL_56;
    case 4:
      *(_DWORD *)&a1[v25] = 0;
      goto LABEL_35;
    default:
LABEL_35:
      if (!a2) {
        return;
      }
LABEL_36:
      uint64_t v32 = (unint64_t)&a1[v19 + 20] & ~v19;
      if (v10 == v14)
      {
        uint64_t v33 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v40 + 56);
        uint64_t v34 = a2;
        uint64_t v35 = v10;
        uint64_t v36 = v39;
LABEL_39:
        v33(v32, v34, v35, v36);
        return;
      }
      uint64_t v32 = (v32 + v20 + v21) & ~v21;
      if (v12 == v14)
      {
        uint64_t v34 = (a2 + 1);
        uint64_t v33 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
        uint64_t v35 = v11;
        uint64_t v36 = v38;
        goto LABEL_39;
      }
      uint64_t v37 = (void *)((((v23 + v32) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8);
      if (a2 > 0x7FFFFFFE)
      {
        *uint64_t v37 = (a2 - 0x7FFFFFFF);
        v37[1] = 0;
      }
      else
      {
        v37[1] = a2;
      }
      break;
  }
}

void sub_23CA41E60()
{
  if (!qword_268BC3900)
  {
    sub_23CA46960();
    unint64_t v0 = sub_23CA46970();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268BC3900);
    }
  }
}

uint64_t sub_23CA41EB8()
{
  return swift_getWitnessTable();
}

void *sub_23CA42014(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_DWORD *)(a1 + 16) = *((_DWORD *)a2 + 4);
    uint64_t v7 = a3[5];
    uint64_t v8 = a1 + v7;
    uint64_t v9 = (uint64_t)a2 + v7;
    uint64_t v10 = sub_23CA46910();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    uint64_t v11 = a3[7];
    *(void *)((char *)v4 + a3[6]) = *(uint64_t *)((char *)a2 + a3[6]);
    *(void *)((char *)v4 + v11) = *(uint64_t *)((char *)a2 + v11);
  }
  return v4;
}

uint64_t sub_23CA4210C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_23CA46910();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);

  return v4(v2, v3);
}

uint64_t sub_23CA42174(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  uint64_t v6 = a3[5];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_23CA46910();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(void *)(a1 + v10) = *(void *)(a2 + v10);
  return a1;
}

uint64_t sub_23CA4221C(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_WORD *)(a1 + 4) = *(_WORD *)(a2 + 4);
  *(_WORD *)(a1 + 6) = *(_WORD *)(a2 + 6);
  *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
  *(_WORD *)(a1 + 10) = *(_WORD *)(a2 + 10);
  *(_WORD *)(a1 + 12) = *(_WORD *)(a2 + 12);
  *(_WORD *)(a1 + 14) = *(_WORD *)(a2 + 14);
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(_WORD *)(a1 + 18) = *(_WORD *)(a2 + 18);
  uint64_t v6 = a3[5];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_23CA46910();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_23CA42300(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  uint64_t v6 = a3[5];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_23CA46910();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(void *)(a1 + v10) = *(void *)(a2 + v10);
  return a1;
}

uint64_t sub_23CA423A8(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 4) = *(_OWORD *)(a2 + 4);
  uint64_t v6 = a3[5];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_23CA46910();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(void *)(a1 + v10) = *(void *)(a2 + v10);
  return a1;
}

uint64_t sub_23CA42450(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_23CA42464);
}

uint64_t sub_23CA42464(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1 + *(int *)(a3 + 20);
  uint64_t v5 = sub_23CA46910();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48);

  return v6(v4, a2, v5);
}

uint64_t sub_23CA424D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_23CA424E8);
}

uint64_t sub_23CA424E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a1 + *(int *)(a4 + 20);
  uint64_t v6 = sub_23CA46910();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);

  return v7(v5, a2, a2, v6);
}

uint64_t sub_23CA4255C()
{
  uint64_t result = sub_23CA46910();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23CA42604()
{
  return sub_23CA4264C(&qword_268BC3858, (void (*)(uint64_t))type metadata accessor for PayLaterViewWrapper);
}

uint64_t sub_23CA4264C(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_23CA42694()
{
  unint64_t result = qword_268BC3920;
  if (!qword_268BC3920)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268BC3920);
  }
  return result;
}

unint64_t sub_23CA426D4()
{
  unint64_t result = qword_268BC3928;
  if (!qword_268BC3928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC3928);
  }
  return result;
}

unint64_t sub_23CA42728()
{
  unint64_t result = qword_268BC3930;
  if (!qword_268BC3930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_268BC3930);
  }
  return result;
}

uint64_t sub_23CA4277C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3848);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23CA427DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PayLaterViewWrapper();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23CA42840(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PayLaterViewWrapper();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23CA4289C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void static PayLaterViewAction.learnMore.getter(void *a1@<X8>)
{
  *a1 = 0;
}

void static PayLaterViewAction.calculator.getter(void *a1@<X8>)
{
  *a1 = 1;
}

BOOL static PayLaterViewAction.== infix(_:_:)(void *a1, void *a2)
{
  return *a1 == *a2;
}

BOOL sub_23CA42928(void *a1, void *a2)
{
  return *a1 == *a2;
}

void static PayLaterViewDisplayStyle.checkout.getter(void *a1@<X8>)
{
  *a1 = 2;
}

void static PayLaterViewDisplayStyle.price.getter(void *a1@<X8>)
{
  *a1 = 3;
}

uint64_t View.payLaterViewAction(_:)()
{
  return sub_23CA429B4();
}

uint64_t sub_23CA42960()
{
  sub_23CA42728();

  return sub_23CA46A30();
}

uint64_t View.payLaterViewDisplayStyle(_:)()
{
  return sub_23CA429B4();
}

uint64_t sub_23CA429B4()
{
  return swift_release();
}

uint64_t sub_23CA42A24()
{
  sub_23CA426D4();

  return sub_23CA46A30();
}

void sub_23CA42A6C(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_23CA42A74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_23CA42C08();

  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

uint64_t sub_23CA42AD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_23CA42BB4();

  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

ValueMetadata *type metadata accessor for PayLaterViewAction()
{
  return &type metadata for PayLaterViewAction;
}

ValueMetadata *type metadata accessor for PayLaterViewDisplayStyle()
{
  return &type metadata for PayLaterViewDisplayStyle;
}

uint64_t sub_23CA42B6C(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA30_EnvironmentKeyWritingModifierVySaySo35PKPaymentRequestPaymentMethodUpdateCSo0jM0CYacGGGAaBHPxAaBHD1__AlA0cI0HPyHCHCTm(a1, &qword_268BC3940, &qword_268BC3948);
}

uint64_t sub_23CA42B80(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA30_EnvironmentKeyWritingModifierVySaySo35PKPaymentRequestPaymentMethodUpdateCSo0jM0CYacGGGAaBHPxAaBHD1__AlA0cI0HPyHCHCTm(a1, &qword_268BC3950, &qword_268BC3958);
}

ValueMetadata *type metadata accessor for PayLaterViewActionKey()
{
  return &type metadata for PayLaterViewActionKey;
}

ValueMetadata *type metadata accessor for PayLaterViewDisplayStyleKey()
{
  return &type metadata for PayLaterViewDisplayStyleKey;
}

unint64_t sub_23CA42BB4()
{
  unint64_t result = qword_268BC3960;
  if (!qword_268BC3960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC3960);
  }
  return result;
}

unint64_t sub_23CA42C08()
{
  unint64_t result = qword_268BC3968;
  if (!qword_268BC3968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC3968);
  }
  return result;
}

id sub_23CA42C6C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v23 = a4;
  uint64_t v25 = a2;
  id v24 = a1;
  uint64_t v9 = *(void *)(a6 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](a1);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v13, v12);
  unint64_t v14 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v15 = (v10 + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v16 = swift_allocObject();
  uint64_t v17 = *(void *)(a6 + 24);
  *(void *)(v16 + 16) = *(void *)(a6 + 16);
  *(void *)(v16 + 24) = v17;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v16 + v14, v11, a6);
  uint64_t v18 = (void *)(v16 + v15);
  *uint64_t v18 = v23;
  v18[1] = a5;
  id v19 = v24;
  swift_retain();
  swift_retain();
  sub_23CA43518(v19, v25, a3, (uint64_t)sub_23CA2518C, v16, v30);
  _s35AddPaymentPassViewControllerWrapperVMa();
  uint64_t v20 = sub_23CA46F30();
  (*(void (**)(_OWORD *, void *, uint64_t))(*(void *)(v20 - 8) + 32))(v31, v30, v20);
  if (*(void *)&v31[0])
  {
    long long v26 = v31[0];
    long long v27 = v31[1];
    long long v28 = v31[2];
    uint64_t v29 = v32;
    swift_getWitnessTable();
    return (id)sub_23CA46D60();
  }
  else
  {
    if (qword_268BC2D48 != -1) {
      swift_once();
    }
    return (id)qword_268BC5558;
  }
}

void sub_23CA42F10()
{
  sub_23CA46E00();
  id v0 = objc_allocWithZone(MEMORY[0x263F087E8]);
  unint64_t v1 = (void *)sub_23CA46DD0();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, v1, 2, 0);

  qword_268BC5558 = (uint64_t)v2;
}

uint64_t AddPassToWalletButton.init(_:onRequest:onCompletion:fallback:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void (*a6)(uint64_t)@<X5>, uint64_t a7@<X7>, _OWORD *a8@<X8>, uint64_t a9)
{
  v23[1] = a9;
  uint64_t v17 = sub_23CA46F30();
  MEMORY[0x270FA5388](v17 - 8);
  id v19 = (char *)v23 - v18;
  *(void *)&long long v24 = a1;
  *((void *)&v24 + 1) = a2;
  uint64_t v25 = a3;
  uint64_t v26 = a4;
  uint64_t v27 = a5;
  char v28 = 3;
  id v20 = a1;
  swift_retain();
  uint64_t v21 = swift_retain();
  a6(v21);

  swift_release();
  swift_release();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(a7 - 8) + 56))(v19, 0, 1, a7);
  return sub_23CA29414(&v24, (uint64_t)v19, a8);
}

uint64_t AddPassToWalletButtonResponse.certificates.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t AddPassToWalletButtonResponse.certificates.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *unint64_t v1 = a1;
  return result;
}

uint64_t (*AddPassToWalletButtonResponse.certificates.modify())()
{
  return nullsub_1;
}

uint64_t AddPassToWalletButtonResponse.nonce.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  sub_23CA43178(v1, *(void *)(v0 + 16));
  return v1;
}

uint64_t sub_23CA43178(uint64_t a1, unint64_t a2)
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

uint64_t AddPassToWalletButtonResponse.nonce.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_23CA43208(*(void *)(v2 + 8), *(void *)(v2 + 16));
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t sub_23CA43208(uint64_t a1, unint64_t a2)
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

uint64_t (*AddPassToWalletButtonResponse.nonce.modify())()
{
  return nullsub_1;
}

uint64_t AddPassToWalletButtonResponse.nonceSignature.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  sub_23CA43178(v1, *(void *)(v0 + 32));
  return v1;
}

uint64_t AddPassToWalletButtonResponse.nonceSignature.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_23CA43208(*(void *)(v2 + 24), *(void *)(v2 + 32));
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return result;
}

uint64_t (*AddPassToWalletButtonResponse.nonceSignature.modify())()
{
  return nullsub_1;
}

uint64_t AddPassToWalletButton<>.init(_:onRequest:onCompletion:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  *(void *)a6 = result;
  *(void *)(a6 + 8) = a2;
  *(void *)(a6 + 16) = a3;
  *(void *)(a6 + 24) = a4;
  *(void *)(a6 + 32) = a5;
  *(_WORD *)(a6 + 40) = 259;
  return result;
}

uint64_t destroy for AddPassToWalletButtonResponse(void *a1)
{
  swift_bridgeObjectRelease();
  sub_23CA43208(a1[1], a1[2]);
  uint64_t v2 = a1[3];
  unint64_t v3 = a1[4];

  return sub_23CA43208(v2, v3);
}

void *initializeWithCopy for AddPassToWalletButtonResponse(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  unint64_t v5 = a2[2];
  swift_bridgeObjectRetain();
  sub_23CA43178(v4, v5);
  a1[1] = v4;
  a1[2] = v5;
  uint64_t v7 = a2[3];
  unint64_t v6 = a2[4];
  sub_23CA43178(v7, v6);
  a1[3] = v7;
  a1[4] = v6;
  return a1;
}

void *assignWithCopy for AddPassToWalletButtonResponse(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[1];
  unint64_t v5 = a2[2];
  sub_23CA43178(v4, v5);
  uint64_t v6 = a1[1];
  unint64_t v7 = a1[2];
  a1[1] = v4;
  a1[2] = v5;
  sub_23CA43208(v6, v7);
  uint64_t v9 = a2[3];
  unint64_t v8 = a2[4];
  sub_23CA43178(v9, v8);
  uint64_t v10 = a1[3];
  unint64_t v11 = a1[4];
  a1[3] = v9;
  a1[4] = v8;
  sub_23CA43208(v10, v11);
  return a1;
}

void *assignWithTake for AddPassToWalletButtonResponse(void *a1, uint64_t a2)
{
  *a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = a1[1];
  unint64_t v5 = a1[2];
  *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 8);
  sub_23CA43208(v4, v5);
  uint64_t v6 = a1[3];
  unint64_t v7 = a1[4];
  *(_OWORD *)(a1 + 3) = *(_OWORD *)(a2 + 24);
  sub_23CA43208(v6, v7);
  return a1;
}

ValueMetadata *type metadata accessor for AddPassToWalletButtonResponse()
{
  return &type metadata for AddPassToWalletButtonResponse;
}

uint64_t sub_23CA434B8()
{
  return swift_initClassMetadata2();
}

id sub_23CA43518@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  _s35AddPaymentPassViewControllerWrapperV11CoordinatorCMa();
  id v12 = a1;
  swift_retain();
  swift_retain();
  id v13 = sub_23CA44220(v12, a2, a3, a4, a5);

  swift_release();
  swift_release();
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F5C960]), sel_initWithRequestConfiguration_delegate_, v12, v13);
  if (!result)
  {

    swift_release();
    swift_release();
    id v12 = 0;
    a2 = 0;
    a3 = 0;
    a4 = 0;
    a5 = 0;
    id result = 0;
    id v13 = 0;
  }
  *a6 = v12;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  a6[4] = a5;
  a6[5] = result;
  a6[6] = v13;
  return result;
}

uint64_t sub_23CA4362C(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = (void *)(v2 + qword_268BC3980);
  uint64_t v4 = *(void *)(v2 + qword_268BC3980);
  *unint64_t v3 = a1;
  v3[1] = a2;
  return sub_23CA25258(v4);
}

uint64_t sub_23CA4364C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[9] = a6;
  v7[10] = a7;
  v7[7] = a4;
  v7[8] = a5;
  return MEMORY[0x270FA2498](sub_23CA43670, 0, 0);
}

uint64_t sub_23CA43670()
{
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v2 = *(int **)(*(void *)(v0 + 56) + qword_268BC3978);
  uint64_t v3 = *(void *)(v1 + 32);
  long long v4 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v0 + 32) = v4;
  *(void *)(v0 + 48) = v3;
  unint64_t v7 = (uint64_t (*)(uint64_t))((char *)v2 + *v2);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v5;
  void *v5 = v0;
  v5[1] = sub_23CA43764;
  return v7(v0 + 16);
}

uint64_t sub_23CA43764(uint64_t a1)
{
  *(void *)(*(void *)v1 + 96) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_23CA43864, 0, 0);
}

uint64_t sub_23CA43864()
{
  uint64_t v1 = *(void **)(v0 + 96);
  (*(void (**)(void *))(v0 + 72))(v1);

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_23CA438D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23CA46EB0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_23CA46EA0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_23CA379F8(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23CA46E60();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_23CA43A78(void *a1, int a2, void *a3, int a4, void *a5, void *a6, void *aBlock)
{
  unint64_t v11 = _Block_copy(aBlock);
  uint64_t v12 = sub_23CA46E40();
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a1;
  uint64_t v17 = sub_23CA46900();
  unint64_t v19 = v18;

  uint64_t v20 = sub_23CA46900();
  unint64_t v22 = v21;

  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v11;
  sub_23CA4429C(v12, v17, v19, v20, v22, (uint64_t)sub_23CA38B4C, v23);
  swift_release();
  sub_23CA43208(v20, v22);
  sub_23CA43208(v17, v19);

  return swift_bridgeObjectRelease();
}

void sub_23CA43BB8(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a1;
  id v11 = a5;
  sub_23CA443FC(a4, a5);
}

void sub_23CA43C48()
{
}

id sub_23CA43C8C()
{
  v2.receiver = v0;
  v2.super_class = (Class)_s35AddPaymentPassViewControllerWrapperV11CoordinatorCMa();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23CA43D00(uint64_t a1)
{
  swift_release();
  uint64_t v2 = *(void *)(a1 + qword_268BC3980);

  return sub_23CA25258(v2);
}

uint64_t _s35AddPaymentPassViewControllerWrapperV11CoordinatorCMa()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_23CA43D7C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = type metadata accessor for AddPassToWalletButton_iOS();
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(v2 - 8) + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = *(void *)(*(void *)(v2 - 8) + 64);
  sub_23CA250DC(*(void **)(v0 + v4), *(void *)(v0 + v4 + 8), *(void *)(v0 + v4 + 16), *(void *)(v0 + v4 + 24), *(void *)(v0 + v4 + 32), *(unsigned char *)(v0 + v4 + 40));
  uint64_t v6 = v0 + v4 + *(int *)(v2 + 36);
  uint64_t v7 = *(void *)(v1 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v6, 1, v1)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v1);
  }
  sub_23CA25180(*(void *)(v0 + v4 + *(int *)(v2 + 40)), *(unsigned char *)(v0 + v4 + *(int *)(v2 + 40) + 8));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, ((v5 + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16, v3 | 7);
}

uint64_t _s35AddPaymentPassViewControllerWrapperVMa()
{
  return __swift_instantiateGenericMetadata();
}

id sub_23CA43F4C()
{
  uint64_t v0 = (void *)sub_23CA44294();

  return v0;
}

id sub_23CA43FA4@<X0>(void *a1@<X8>)
{
  uint64_t v2 = (void *)sub_23CA4428C();
  *a1 = v2;

  return v2;
}

uint64_t sub_23CA44000(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270F02710](a1, a2, a3, WitnessTable);
}

uint64_t sub_23CA4407C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270F026D8](a1, a2, a3, WitnessTable);
}

void sub_23CA440F8()
{
}

id sub_23CA44138(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = (uint64_t *)&v5[qword_268BC3980];
  uint64_t *v6 = 0;
  v6[1] = 0;
  *(void *)&v5[qword_268BC3970] = a1;
  uint64_t v7 = &v5[qword_268BC3978];
  *(void *)uint64_t v7 = a2;
  *((void *)v7 + 1) = a3;
  uint64_t v8 = *v6;
  uint64_t *v6 = a4;
  v6[1] = a5;
  id v9 = a1;
  swift_retain();
  swift_retain();
  sub_23CA25258(v8);
  v11.receiver = v5;
  v11.super_class = (Class)_s35AddPaymentPassViewControllerWrapperV11CoordinatorCMa();
  return objc_msgSendSuper2(&v11, sel_init);
}

id sub_23CA44220(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v10 = objc_allocWithZone((Class)_s35AddPaymentPassViewControllerWrapperV11CoordinatorCMa());
  return sub_23CA44138(a1, a2, a3, a4, a5);
}

uint64_t sub_23CA4428C()
{
  return *(void *)(v0 + 48);
}

uint64_t sub_23CA44294()
{
  return *(void *)(v0 + 40);
}

uint64_t sub_23CA4429C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3448);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_23CA46EB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 1, 1, v18);
  unint64_t v19 = (void *)swift_allocObject();
  v19[2] = 0;
  long long v19[3] = 0;
  v19[4] = v7;
  v19[5] = a1;
  v19[6] = a2;
  v19[7] = a3;
  v19[8] = a4;
  v19[9] = a5;
  v19[10] = a6;
  v19[11] = a7;
  swift_bridgeObjectRetain();
  sub_23CA43178(a2, a3);
  sub_23CA43178(a4, a5);
  id v20 = v7;
  swift_retain();
  sub_23CA438D4((uint64_t)v17, (uint64_t)&unk_268BC3A78, (uint64_t)v19);
  return swift_release();
}

uint64_t sub_23CA443FC(void *a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *, uint64_t))(v2 + qword_268BC3980);
  if (v3)
  {
    if (a1)
    {
      sub_23CA3A58C((uint64_t)v3);
      id v5 = a1;
      v3(a1, 0);
      sub_23CA25258((uint64_t)v3);
    }
    else
    {
      if (a2)
      {
        swift_retain();
        id v7 = a2;
      }
      else
      {
        uint64_t v8 = qword_268BC2D48;
        swift_retain();
        if (v8 != -1) {
          swift_once();
        }
        id v7 = (id)qword_268BC5558;
      }
      id v9 = a2;
      v3(v7, 1);
      sub_23CA25258((uint64_t)v3);
    }
  }
  id v10 = (void *)(v2 + qword_268BC3980);
  uint64_t v11 = *(void *)(v2 + qword_268BC3980);
  void *v10 = 0;
  v10[1] = 0;

  return sub_23CA25258(v11);
}

void sub_23CA44530()
{
}

uint64_t sub_23CA44560()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_23CA44598()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  sub_23CA43208(*(void *)(v0 + 48), *(void *)(v0 + 56));
  sub_23CA43208(*(void *)(v0 + 64), *(void *)(v0 + 72));
  swift_release();

  return MEMORY[0x270FA0238](v0, 96, 7);
}

uint64_t sub_23CA445F8()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = swift_task_alloc();
  long long v4 = *(_OWORD *)(v0 + 80);
  *(void *)(v1 + 16) = v3;
  *(void *)uint64_t v3 = v1;
  *(void *)(v3 + 8) = sub_23CA27230;
  *(_OWORD *)(v3 + 72) = v4;
  *(void *)(v3 + 56) = v2;
  *(void *)(v3 + 64) = v0 + 40;
  return MEMORY[0x270FA2498](sub_23CA43670, 0, 0);
}

uint64_t sub_23CA446B8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23CA446F0(uint64_t a1)
{
  long long v4 = *(int **)(v1 + 16);
  id v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_23CA27230;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268BC3A80 + dword_268BC3A80);
  return v6(a1, v4);
}

void sub_23CA447A8(uint64_t a1)
{
  swift_release();
  swift_release();

  uint64_t v2 = *(void **)(a1 + 48);
}

uint64_t sub_23CA447FC(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  long long v4 = a2[1];
  *(_OWORD *)a1 = *a2;
  *(_OWORD *)(a1 + 16) = v4;
  id v5 = (void *)*((void *)a2 + 5);
  *(void *)(a1 + 32) = *((void *)a2 + 4);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = (void *)*((void *)a2 + 6);
  *(void *)(a1 + 48) = v6;
  id v7 = (id)v3;
  swift_retain();
  swift_retain();
  id v8 = v5;
  id v9 = v6;
  return a1;
}

uint64_t sub_23CA44870(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  uint64_t v7 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v7;
  swift_retain();
  swift_release();
  uint64_t v8 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v8;
  swift_retain();
  swift_release();
  id v9 = *(void **)(a2 + 40);
  id v10 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = v9;
  id v11 = v9;

  uint64_t v12 = *(void **)(a2 + 48);
  id v13 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = v12;
  id v14 = v12;

  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_23CA44928(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  long long v4 = *(void **)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);

  id v5 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);

  return a1;
}

uint64_t sub_23CA44998(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_23CA449E0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_23CA44A2C()
{
  return swift_getWitnessTable();
}

void static PayWithApplePayButtonLabel.plain.getter(void *a1@<X8>)
{
  *a1 = 0;
}

void static PayWithApplePayButtonLabel.buy.getter(void *a1@<X8>)
{
  *a1 = 1;
}

void static PayWithApplePayButtonLabel.addMoney.getter(void *a1@<X8>)
{
  *a1 = 9;
}

void static PayWithApplePayButtonLabel.book.getter(void *a1@<X8>)
{
  *a1 = 6;
}

void static PayWithApplePayButtonLabel.checkout.getter(void *a1@<X8>)
{
  *a1 = 5;
}

void static PayWithApplePayButtonLabel.continue.getter(void *a1@<X8>)
{
  *a1 = 16;
}

void static PayWithApplePayButtonLabel.contribute.getter(void *a1@<X8>)
{
  *a1 = 14;
}

void static PayWithApplePayButtonLabel.donate.getter(void *a1@<X8>)
{
  *a1 = 4;
}

void static PayWithApplePayButtonLabel.inStore.getter(void *a1@<X8>)
{
  *a1 = 3;
}

void static PayWithApplePayButtonLabel.order.getter(void *a1@<X8>)
{
  *a1 = 11;
}

void static PayWithApplePayButtonLabel.reload.getter(void *a1@<X8>)
{
  *a1 = 8;
}

void static PayWithApplePayButtonLabel.rent.getter(void *a1@<X8>)
{
  *a1 = 12;
}

void static PayWithApplePayButtonLabel.setUp.getter(void *a1@<X8>)
{
  *a1 = 2;
}

void static PayWithApplePayButtonLabel.subscribe.getter(void *a1@<X8>)
{
  *a1 = 7;
}

void static PayWithApplePayButtonLabel.support.getter(void *a1@<X8>)
{
  *a1 = 13;
}

void static PayWithApplePayButtonLabel.tip.getter(void *a1@<X8>)
{
  *a1 = 15;
}

void static PayWithApplePayButtonLabel.topUp.getter(void *a1@<X8>)
{
  *a1 = 10;
}

uint64_t View.payWithApplePayButtonStyle(_:)()
{
  return swift_release();
}

uint64_t sub_23CA44B88()
{
  sub_23CA44DF4();

  return sub_23CA46A30();
}

uint64_t sub_23CA44BD0@<X0>(void *a1@<X8>)
{
  sub_23CA44DF4();
  uint64_t result = sub_23CA46A30();
  *a1 = v3;
  return result;
}

uint64_t sub_23CA44C20@<X0>(void *a1@<X8>)
{
  sub_23CA44DF4();
  uint64_t result = sub_23CA46A30();
  *a1 = v3;
  return result;
}

uint64_t sub_23CA44C70()
{
  return sub_23CA46A40();
}

uint64_t sub_23CA44CBC()
{
  return sub_23CA46A40();
}

ValueMetadata *type metadata accessor for PayWithApplePayButtonLabel()
{
  return &type metadata for PayWithApplePayButtonLabel;
}

ValueMetadata *type metadata accessor for PayWithApplePayButtonStyle()
{
  return &type metadata for PayWithApplePayButtonStyle;
}

uint64_t sub_23CA44D28()
{
  return swift_getWitnessTable();
}

unint64_t sub_23CA44D98()
{
  unint64_t result = qword_268BC3B18;
  if (!qword_268BC3B18)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC3B10);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC3B18);
  }
  return result;
}

unint64_t sub_23CA44DF4()
{
  unint64_t result = qword_268BC3B20;
  if (!qword_268BC3B20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC3B20);
  }
  return result;
}

ValueMetadata *type metadata accessor for PayWithApplePayButtonStyleKey()
{
  return &type metadata for PayWithApplePayButtonStyleKey;
}

void sub_23CA44E58(void *a1@<X8>)
{
  *a1 = 3;
}

void static VerifyIdentityWithWalletButtonLabel.verifyIdentity.getter(void *a1@<X8>)
{
  *a1 = 0;
}

void static VerifyIdentityWithWalletButtonLabel.continue.getter(void *a1@<X8>)
{
  *a1 = 3;
}

void static VerifyIdentityWithWalletButtonLabel.verify.getter(void *a1@<X8>)
{
  *a1 = 1;
}

void static VerifyIdentityWithWalletButtonLabel.verifyAge.getter(void *a1@<X8>)
{
  *a1 = 2;
}

uint64_t static VerifyIdentityWithWalletButtonStyle.blackOutline.getter@<X0>(void *a1@<X8>)
{
  uint64_t result = swift_beginAccess();
  *a1 = qword_268BC3B28;
  return result;
}

uint64_t static VerifyIdentityWithWalletButtonStyle.blackOutline.setter(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t result = swift_beginAccess();
  qword_268BC3B28 = v1;
  return result;
}

uint64_t (*static VerifyIdentityWithWalletButtonStyle.blackOutline.modify())()
{
  return j__swift_endAccess;
}

uint64_t View.verifyIdentityWithWalletButtonStyle(_:)()
{
  return swift_release();
}

uint64_t sub_23CA45004()
{
  sub_23CA3BF44();

  return sub_23CA46A30();
}

ValueMetadata *type metadata accessor for VerifyIdentityWithWalletButtonLabel()
{
  return &type metadata for VerifyIdentityWithWalletButtonLabel;
}

ValueMetadata *type metadata accessor for VerifyIdentityWithWalletButtonStyle()
{
  return &type metadata for VerifyIdentityWithWalletButtonStyle;
}

uint64_t sub_23CA45074()
{
  return swift_getWitnessTable();
}

unint64_t sub_23CA450E4()
{
  unint64_t result = qword_268BC3B38;
  if (!qword_268BC3B38)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC3B30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC3B38);
  }
  return result;
}

ValueMetadata *type metadata accessor for VerifyIdentityWithWalletButtonStyleKey()
{
  return &type metadata for VerifyIdentityWithWalletButtonStyleKey;
}

id static AddPassToWalletButtonFilter.paymentNetwork(_:)@<X0>(id a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = a1;
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 0;
  return a1;
}

uint64_t static AddPassToWalletButtonFilter.productIdentifier(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_23CA45170(a1, a2, 1, a3);
}

uint64_t static AddPassToWalletButtonFilter.primaryAccountIdentifier(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_23CA45170(a1, a2, 2, a3);
}

uint64_t sub_23CA45170@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  *(void *)a4 = a1;
  *(void *)(a4 + 8) = a2;
  *(unsigned char *)(a4 + 16) = a3;
  return swift_bridgeObjectRetain();
}

uint64_t AddPassToWalletButton.init(_:cardholderName:passStyle:primaryAccountSuffix:cardDetails:description:filters:onRequest:onCompletion:fallback:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X6>, uint64_t a6@<X7>, _OWORD *a7@<X8>, uint64_t a8, uint64_t a9, long long a10, uint64_t a11, uint64_t a12, void (*a13)(uint64_t), uint64_t a14, uint64_t a15)
{
  uint64_t v26 = a5;
  uint64_t v27 = a6;
  uint64_t v24 = a3;
  uint64_t v25 = a4;
  uint64_t v22 = a1;
  uint64_t v23 = a2;
  unint64_t v21 = a7;
  long long v20 = a10;
  uint64_t v15 = sub_23CA46F30();
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v20 - v16;
  uint64_t v18 = swift_bridgeObjectRelease();
  a13(v18);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(a15 - 8) + 56))(v17, 0, 1, a15);
  return sub_23CA4560C(v22, v24, 0, v25, v26, v21, a8, a9, (uint64_t)v17, v20, *((uint64_t *)&v20 + 1), a11, a12);
}

void sub_23CA452BC(void *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X6>, uint64_t a6@<X8>, uint64_t a7, uint64_t a8, char a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F5BD20]), sel_initWithEncryptionScheme_, a1);
  if (v19)
  {
    long long v20 = v19;
    if (a2)
    {
      unint64_t v21 = (void *)sub_23CA46DD0();
      swift_bridgeObjectRelease();
    }
    else
    {
      unint64_t v21 = 0;
    }
    objc_msgSend(v20, sel_setCardholderName_, v21);

    if (a3)
    {
      uint64_t v22 = (void *)sub_23CA46DD0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v22 = 0;
    }
    objc_msgSend(v20, sel_setPrimaryAccountSuffix_, v22);

    objc_msgSend(v20, sel_setStyle_, a4);
    if (a5)
    {
      sub_23CA45FDC();
      uint64_t v23 = (void *)sub_23CA46E30();
      swift_bridgeObjectRelease();
      objc_msgSend(v20, sel_setCardDetails_, v23);
    }
    if (a7)
    {
      uint64_t v24 = (void *)sub_23CA46DD0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v24 = 0;
    }
    uint64_t v26 = a12;
    uint64_t v25 = a13;
    uint64_t v27 = a10;
    objc_msgSend(v20, sel_setLocalizedDescription_, v24);

    v35[2] = MEMORY[0x263F8EE88];
    uint64_t v28 = *(void *)(a8 + 16);
    if (v28)
    {
      uint64_t v29 = (unsigned char *)(a8 + 48);
      do
      {
        int v30 = (void *)*((void *)v29 - 2);
        if (*v29)
        {
          uint64_t v31 = *((void *)v29 - 1);
          uint64_t v32 = (void *)*((void *)v29 - 2);
          if (*v29 == 1)
          {
            sub_23CA45C1C(v32, v31, 1);
            sub_23CA45E2C(v35, (uint64_t)v30, v31);
            swift_bridgeObjectRelease();
          }
          else
          {
            sub_23CA45C1C(v32, v31, 2);
            uint64_t v33 = (void *)sub_23CA46DD0();
            objc_msgSend(v20, sel_setPrimaryAccountIdentifier_, v33);
            sub_23CA45C44(v30, v31, 2);
          }
        }
        else
        {
          objc_msgSend(v20, sel_setPaymentNetwork_, *((void *)v29 - 2));
        }
        v29 += 24;
        --v28;
      }
      while (v28);
      swift_bridgeObjectRelease();
      uint64_t v25 = a13;
      uint64_t v26 = a12;
      uint64_t v27 = a10;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    uint64_t v34 = (void *)sub_23CA46EC0();
    swift_bridgeObjectRelease();
    objc_msgSend(v20, sel_setProductIdentifiers_, v34);

    *(unsigned char *)(a6 + 41) = a9 & 1;
    *(void *)a6 = v20;
    *(void *)(a6 + 8) = v27;
    *(void *)(a6 + 16) = a11;
    *(void *)(a6 + 24) = v26;
    *(void *)(a6 + 32) = v25;
    *(unsigned char *)(a6 + 40) = 3;
  }
  else
  {
    sub_23CA46FB0();
    __break(1u);
  }
}

uint64_t sub_23CA4560C@<X0>(void *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X6>, _OWORD *a6@<X8>, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F5BD20]), sel_initWithEncryptionScheme_, a1);
  if (v19)
  {
    long long v20 = v19;
    if (a2)
    {
      unint64_t v21 = (void *)sub_23CA46DD0();
      swift_bridgeObjectRelease();
    }
    else
    {
      unint64_t v21 = 0;
    }
    objc_msgSend(v20, sel_setCardholderName_, v21);

    if (a3)
    {
      uint64_t v22 = (void *)sub_23CA46DD0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v22 = 0;
    }
    objc_msgSend(v20, sel_setPrimaryAccountSuffix_, v22);

    objc_msgSend(v20, sel_setStyle_, a4);
    if (a5)
    {
      sub_23CA45FDC();
      uint64_t v23 = (void *)sub_23CA46E30();
      swift_bridgeObjectRelease();
      objc_msgSend(v20, sel_setCardDetails_, v23);
    }
    if (a7)
    {
      uint64_t v24 = (void *)sub_23CA46DD0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v24 = 0;
    }
    uint64_t v25 = a13;
    objc_msgSend(v20, sel_setLocalizedDescription_, v24);

    uint64_t v26 = *(void *)(a8 + 16);
    if (v26)
    {
      uint64_t v34 = a6;
      uint64_t v27 = (unsigned char *)(a8 + 48);
      do
      {
        uint64_t v28 = (void *)*((void *)v27 - 2);
        if (*v27)
        {
          uint64_t v29 = *((void *)v27 - 1);
          int v30 = (void *)*((void *)v27 - 2);
          if (*v27 == 1)
          {
            sub_23CA45C1C(v30, v29, 1);
            sub_23CA45E2C((uint64_t *)&v35, (uint64_t)v28, v29);
            swift_bridgeObjectRelease();
          }
          else
          {
            sub_23CA45C1C(v30, v29, 2);
            uint64_t v31 = (void *)sub_23CA46DD0();
            objc_msgSend(v20, sel_setPrimaryAccountIdentifier_, v31);
            sub_23CA45C44(v28, v29, 2);
          }
        }
        else
        {
          objc_msgSend(v20, sel_setPaymentNetwork_, *((void *)v27 - 2));
        }
        v27 += 24;
        --v26;
      }
      while (v26);
      swift_bridgeObjectRelease();
      a6 = v34;
      uint64_t v25 = a13;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    uint64_t v32 = (void *)sub_23CA46EC0();
    swift_bridgeObjectRelease();
    objc_msgSend(v20, sel_setProductIdentifiers_, v32);

    *(void *)&long long v35 = v20;
    *((void *)&v35 + 1) = a10;
    uint64_t v36 = a11;
    uint64_t v37 = a12;
    uint64_t v38 = v25;
    char v39 = 3;
    return sub_23CA29414(&v35, a9, a6);
  }
  else
  {
    uint64_t result = sub_23CA46FB0();
    __break(1u);
  }
  return result;
}

uint64_t AddPassToWalletButton.init(_:primaryAccountSuffix:passStyle:cardDetails:description:filters:onRequest:onCompletion:fallback:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _OWORD *a9@<X8>, long long a10, uint64_t a11, uint64_t a12, void (*a13)(uint64_t), uint64_t a14, uint64_t a15)
{
  uint64_t v24 = a7;
  uint64_t v25 = a2;
  uint64_t v28 = a5;
  uint64_t v29 = a6;
  uint64_t v26 = a3;
  uint64_t v27 = a4;
  long long v23 = a10;
  uint64_t v18 = sub_23CA46F30();
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  unint64_t v21 = (char *)&v23 - v20;
  a13(v19);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(a15 - 8) + 56))(v21, 0, 1, a15);
  return sub_23CA4560C(a1, 0, v26, v27, v28, a9, v24, a8, (uint64_t)v21, v23, *((uint64_t *)&v23 + 1), a11, a12);
}

double AddPassToWalletButton<>.init(_:cardholderName:passStyle:primaryAccountSuffix:cardDetails:description:filters:onRequest:onCompletion:)@<D0>(void *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X6>, uint64_t a5@<X8>, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  swift_bridgeObjectRelease();
  sub_23CA452BC(a1, a2, 0, a3, a4, (uint64_t)v21, a6, a7, 1, a8, a9, a10, a11);
  uint64_t v16 = v22;
  char v17 = v23;
  char v18 = v24;
  double result = *(double *)v21;
  long long v20 = v21[1];
  *(_OWORD *)a5 = v21[0];
  *(_OWORD *)(a5 + 16) = v20;
  *(void *)(a5 + 32) = v16;
  *(unsigned char *)(a5 + 40) = v17;
  *(unsigned char *)(a5 + 41) = v18;
  return result;
}

double AddPassToWalletButton<>.init(_:primaryAccountSuffix:passStyle:cardDetails:description:filters:onRequest:onCompletion:)@<D0>(void *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X7>, uint64_t a7@<X8>, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  sub_23CA452BC(a1, 0, a2, a3, a4, (uint64_t)v17, a5, a6, 1, a8, a9, a10, a11);
  uint64_t v12 = v18;
  char v13 = v19;
  char v14 = v20;
  double result = *(double *)v17;
  long long v16 = v17[1];
  *(_OWORD *)a7 = v17[0];
  *(_OWORD *)(a7 + 16) = v16;
  *(void *)(a7 + 32) = v12;
  *(unsigned char *)(a7 + 40) = v13;
  *(unsigned char *)(a7 + 41) = v14;
  return result;
}

id sub_23CA45C1C(id result, uint64_t a2, char a3)
{
  if (a3 == 2 || a3 == 1) {
    return (id)swift_bridgeObjectRetain();
  }
  if (!a3) {
    return result;
  }
  return result;
}

void sub_23CA45C44(void *a1, uint64_t a2, char a3)
{
  if (a3 == 2 || a3 == 1)
  {
    swift_bridgeObjectRelease();
  }
  else if (!a3)
  {
  }
}

ValueMetadata *type metadata accessor for AddPassToWalletButtonFilter()
{
  return &type metadata for AddPassToWalletButtonFilter;
}

void destroy for AddPassToWalletButtonFilter.FilterType(uint64_t a1)
{
}

uint64_t _s16_PassKit_SwiftUI27AddPassToWalletButtonFilterV10FilterTypeOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_23CA45C1C(*(id *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s16_PassKit_SwiftUI27AddPassToWalletButtonFilterV10FilterTypeOwca_0(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_23CA45C1C(*(id *)a2, v4, v5);
  id v6 = *(void **)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_23CA45C44(v6, v7, v8);
  return a1;
}

uint64_t _s16_PassKit_SwiftUI27AddPassToWalletButtonFilterV10FilterTypeOwta_0(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_23CA45C44(v4, v5, v6);
  return a1;
}

uint64_t _s16_PassKit_SwiftUI27AddPassToWalletButtonFilterV10FilterTypeOwet_0(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t _s16_PassKit_SwiftUI27AddPassToWalletButtonFilterV10FilterTypeOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)double result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_23CA45E14(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for AddPassToWalletButtonFilter.FilterType()
{
  return &type metadata for AddPassToWalletButtonFilter.FilterType;
}

uint64_t sub_23CA45E2C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_23CA47010();
  swift_bridgeObjectRetain();
  sub_23CA46E10();
  uint64_t v8 = sub_23CA47030();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_23CA46FE0() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      char v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_23CA46FE0() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *unsigned int v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_23CA462FC(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *unsigned int v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

unint64_t sub_23CA45FDC()
{
  unint64_t result = qword_268BC3B40;
  if (!qword_268BC3B40)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268BC3B40);
  }
  return result;
}

uint64_t sub_23CA4601C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3B48);
  uint64_t v3 = sub_23CA46F60();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    int v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *int v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_23CA47010();
      sub_23CA46E10();
      uint64_t result = sub_23CA47030();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      void *v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_23CA462FC(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_23CA4601C();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_23CA46498();
      goto LABEL_22;
    }
    sub_23CA4664C();
  }
  uint64_t v11 = *v4;
  sub_23CA47010();
  sub_23CA46E10();
  uint64_t result = sub_23CA47030();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_23CA46FE0(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_23CA46FF0();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_23CA46FE0();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void *sub_23CA46498()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3B48);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_23CA46F50();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_23CA4664C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC3B48);
  uint64_t v3 = sub_23CA46F60();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_23CA47010();
    swift_bridgeObjectRetain();
    sub_23CA46E10();
    uint64_t result = sub_23CA47030();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    void *v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_23CA46900()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_23CA46910()
{
  return MEMORY[0x270EF0FC8]();
}

uint64_t sub_23CA46920()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_23CA46940()
{
  return MEMORY[0x270EFEC70]();
}

uint64_t sub_23CA46950()
{
  return MEMORY[0x270EFEC88]();
}

uint64_t sub_23CA46960()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_23CA46970()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_23CA46980()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_23CA46990()
{
  return MEMORY[0x270EFF908]();
}

uint64_t sub_23CA469A0()
{
  return MEMORY[0x270EFF9A0]();
}

uint64_t sub_23CA469C0()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_23CA469D0()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_23CA469E0()
{
  return MEMORY[0x270F008D0]();
}

uint64_t sub_23CA469F0()
{
  return MEMORY[0x270F008D8]();
}

uint64_t sub_23CA46A00()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_23CA46A10()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_23CA46A20()
{
  return MEMORY[0x270F00F00]();
}

uint64_t sub_23CA46A30()
{
  return MEMORY[0x270F00F10]();
}

uint64_t sub_23CA46A40()
{
  return MEMORY[0x270F00F20]();
}

uint64_t sub_23CA46A50()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_23CA46A60()
{
  return MEMORY[0x270F016E0]();
}

uint64_t sub_23CA46A70()
{
  return MEMORY[0x270F016F8]();
}

uint64_t sub_23CA46A80()
{
  return MEMORY[0x270F01708]();
}

uint64_t sub_23CA46AA0()
{
  return MEMORY[0x270F01728]();
}

uint64_t sub_23CA46AB0()
{
  return MEMORY[0x270F01738]();
}

uint64_t sub_23CA46AC0()
{
  return MEMORY[0x270F01748]();
}

uint64_t sub_23CA46AD0()
{
  return MEMORY[0x270F01758]();
}

uint64_t sub_23CA46AE0()
{
  return MEMORY[0x270F01768]();
}

uint64_t sub_23CA46AF0()
{
  return MEMORY[0x270F01778]();
}

uint64_t sub_23CA46B10()
{
  return MEMORY[0x270F01790]();
}

uint64_t sub_23CA46B20()
{
  return MEMORY[0x270F017F8]();
}

uint64_t sub_23CA46B30()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_23CA46B40()
{
  return MEMORY[0x270F01818]();
}

uint64_t sub_23CA46B50()
{
  return MEMORY[0x270F02418]();
}

uint64_t sub_23CA46B60()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_23CA46B70()
{
  return MEMORY[0x270F026B0]();
}

uint64_t sub_23CA46B80()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_23CA46BA0()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_23CA46BB0()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_23CA46BC0()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_23CA46BE0()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_23CA46BF0()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_23CA46C00()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_23CA46C10()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_23CA46C20()
{
  return MEMORY[0x270F034A0]();
}

uint64_t sub_23CA46C30()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_23CA46C40()
{
  return MEMORY[0x270F037C0]();
}

uint64_t sub_23CA46C50()
{
  return MEMORY[0x270F03F30]();
}

uint64_t sub_23CA46C60()
{
  return MEMORY[0x270F03FB0]();
}

uint64_t sub_23CA46C70()
{
  return MEMORY[0x270F04178]();
}

uint64_t sub_23CA46C80()
{
  return MEMORY[0x270F04188]();
}

uint64_t sub_23CA46C90()
{
  return MEMORY[0x270F04608]();
}

uint64_t sub_23CA46CA0()
{
  return MEMORY[0x270F04620]();
}

uint64_t sub_23CA46CB0()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_23CA46CC0()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_23CA46CD0()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_23CA46CE0()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_23CA46CF0()
{
  return MEMORY[0x270F04850]();
}

uint64_t sub_23CA46D00()
{
  return MEMORY[0x270F048D0]();
}

uint64_t sub_23CA46D10()
{
  return MEMORY[0x270F048E8]();
}

uint64_t sub_23CA46D20()
{
  return MEMORY[0x270F04AF0]();
}

uint64_t sub_23CA46D30()
{
  return MEMORY[0x270F04AF8]();
}

uint64_t sub_23CA46D40()
{
  return MEMORY[0x270F04B08]();
}

uint64_t sub_23CA46D50()
{
  return MEMORY[0x270F04B10]();
}

uint64_t sub_23CA46D60()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_23CA46D70()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_23CA46D80()
{
  return MEMORY[0x270F05320]();
}

uint64_t sub_23CA46D90()
{
  return MEMORY[0x270F05330]();
}

uint64_t sub_23CA46DA0()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_23CA46DB0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_23CA46DC0()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_23CA46DD0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_23CA46DE0()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_23CA46DF0()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_23CA46E00()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_23CA46E10()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_23CA46E20()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_23CA46E30()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_23CA46E40()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_23CA46E60()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_23CA46E70()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_23CA46E80()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_23CA46E90()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_23CA46EA0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_23CA46EB0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_23CA46EC0()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_23CA46ED0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_23CA46EE0()
{
  return MEMORY[0x270FA1260]();
}

uint64_t sub_23CA46EF0()
{
  return MEMORY[0x270FA1268]();
}

uint64_t sub_23CA46F00()
{
  return MEMORY[0x270FA1270]();
}

uint64_t sub_23CA46F10()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_23CA46F20()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_23CA46F30()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_23CA46F40()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_23CA46F50()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_23CA46F60()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_23CA46F70()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_23CA46F80()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_23CA46F90()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_23CA46FA0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_23CA46FB0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_23CA46FC0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_23CA46FE0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_23CA46FF0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_23CA47000()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_23CA47010()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_23CA47020()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_23CA47030()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_23CA47040()
{
  return MEMORY[0x270FA0128]();
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
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

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x270FA0420]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
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