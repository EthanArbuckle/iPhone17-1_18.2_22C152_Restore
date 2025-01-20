uint64_t initializeBufferWithCopyOfBuffer for ASAuthorizationResult(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  v5 = v3;
  return a1;
}

void destroy for ASAuthorizationResult(id *a1)
{
}

uint64_t assignWithCopy for ASAuthorizationResult(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  id v6 = v3;

  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)result = v2;
  return result;
}

uint64_t assignWithTake for ASAuthorizationResult(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  char v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;

  return a1;
}

uint64_t getEnumTagSinglePayload for ASAuthorizationResult(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFA && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 250);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 6) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ASAuthorizationResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF9)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)result = a2 - 250;
    if (a3 >= 0xFA) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFA) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_23454C110(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_23454C11C(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ASAuthorizationResult()
{
  return &type metadata for ASAuthorizationResult;
}

void type metadata accessor for ASWebAuthenticationSessionStorageMode(uint64_t a1)
{
}

void type metadata accessor for ASAuthorizationCustomMethod(uint64_t a1)
{
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

uint64_t sub_23454C170@<X0>(uint64_t a1@<X8>)
{
  self;
  uint64_t result = swift_dynamicCastObjCClass();
  if (result)
  {
    char v3 = 0;
LABEL_13:
    *(void *)a1 = result;
    *(unsigned char *)(a1 + 8) = v3;
    return result;
  }
  self;
  uint64_t result = swift_dynamicCastObjCClass();
  if (result)
  {
    char v3 = 1;
    goto LABEL_13;
  }
  self;
  uint64_t result = swift_dynamicCastObjCClass();
  if (result)
  {
    char v3 = 2;
    goto LABEL_13;
  }
  self;
  uint64_t result = swift_dynamicCastObjCClass();
  if (result)
  {
    char v3 = 3;
    goto LABEL_13;
  }
  self;
  uint64_t result = swift_dynamicCastObjCClass();
  if (result)
  {
    char v3 = 4;
    goto LABEL_13;
  }
  self;
  uint64_t result = swift_dynamicCastObjCClass();
  if (result)
  {
    char v3 = 5;
    goto LABEL_13;
  }
  sub_234559D40();
  sub_234559C30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687A69A0);
  sub_234559D70();
  uint64_t result = sub_234559D80();
  __break(1u);
  return result;
}

uint64_t sub_23454C324(uint64_t a1, uint64_t a2)
{
  return sub_23454D0C8(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_23454C33C(uint64_t a1, id *a2)
{
  uint64_t result = sub_234559BF0();
  *a2 = 0;
  return result;
}

uint64_t sub_23454C3B4(uint64_t a1, id *a2)
{
  char v3 = sub_234559C00();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_23454C434@<X0>(uint64_t *a1@<X8>)
{
  sub_234559C10();
  uint64_t v2 = sub_234559BE0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

void sub_23454C478(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_23454C480@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_23454C494@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_23454C4A8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_23454C4BC(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_23454C4EC@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_23454C518@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_23454C53C(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_23454C550(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_23454C564(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_23454C578@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_23454C58C(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_23454C5A0(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_23454C5B4(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_23454C5C8()
{
  return *v0 == 0;
}

uint64_t sub_23454C5D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

void *sub_23454C5F0(void *result)
{
  *v1 &= ~*result;
  return result;
}

uint64_t sub_23454C604(uint64_t a1)
{
  uint64_t v2 = sub_23454CF4C(&qword_2687A6A08, type metadata accessor for ASAuthorizationError);

  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t sub_23454C670(uint64_t a1)
{
  uint64_t v2 = sub_23454CF4C(&qword_2687A6A08, type metadata accessor for ASAuthorizationError);

  return MEMORY[0x270EF2668](a1, v2);
}

uint64_t sub_23454C6E0(uint64_t a1)
{
  uint64_t v2 = sub_23454CF4C(&qword_2687A6A40, type metadata accessor for ASAuthorizationError);

  return MEMORY[0x270EEF788](a1, v2);
}

id sub_23454C74C()
{
  return *v0;
}

uint64_t sub_23454C754@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_23454C75C(uint64_t a1)
{
  uint64_t v2 = sub_23454CF4C(&qword_2687A6A48, type metadata accessor for ASWebAuthenticationSessionError);

  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t sub_23454C7C8(uint64_t a1)
{
  uint64_t v2 = sub_23454CF4C(&qword_2687A6A48, type metadata accessor for ASWebAuthenticationSessionError);

  return MEMORY[0x270EF2668](a1, v2);
}

uint64_t sub_23454C834(uint64_t a1)
{
  uint64_t v2 = sub_23454CF4C(&qword_2687A6A78, type metadata accessor for ASWebAuthenticationSessionError);

  return MEMORY[0x270EEF788](a1, v2);
}

uint64_t sub_23454C8A0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_23454DA34(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

void *sub_23454C8E0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_23454C8EC()
{
  return sub_234559C10();
}

uint64_t sub_23454C8FC(uint64_t a1)
{
  uint64_t v2 = sub_23454CF4C(&qword_2687A6A40, type metadata accessor for ASAuthorizationError);

  return MEMORY[0x270EEF7E8](a1, v2);
}

uint64_t sub_23454C968(uint64_t a1)
{
  uint64_t v2 = sub_23454CF4C(&qword_2687A6A40, type metadata accessor for ASAuthorizationError);

  return MEMORY[0x270EEF7A0](a1, v2);
}

uint64_t sub_23454C9D4(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_23454CF4C(&qword_2687A6A40, type metadata accessor for ASAuthorizationError);
  id v5 = a1;

  return MEMORY[0x270EEF790](v5, a2, v4);
}

uint64_t sub_23454CA64()
{
  id v1 = *v0;
  uint64_t v2 = sub_234559D10();

  return v2;
}

uint64_t sub_23454CA9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23454CF4C(&qword_2687A6A40, type metadata accessor for ASAuthorizationError);

  return MEMORY[0x270EEF7D0](a1, a2, v4);
}

void *sub_23454CB1C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_23454CB2C(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_23454CB38()
{
  return sub_234559C10();
}

uint64_t sub_23454CB48(uint64_t a1)
{
  uint64_t v2 = sub_23454CF4C(&qword_2687A6A78, type metadata accessor for ASWebAuthenticationSessionError);

  return MEMORY[0x270EEF7E8](a1, v2);
}

uint64_t sub_23454CBB4(uint64_t a1)
{
  uint64_t v2 = sub_23454CF4C(&qword_2687A6A78, type metadata accessor for ASWebAuthenticationSessionError);

  return MEMORY[0x270EEF7A0](a1, v2);
}

uint64_t sub_23454CC20(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_23454CF4C(&qword_2687A6A78, type metadata accessor for ASWebAuthenticationSessionError);
  id v5 = a1;

  return MEMORY[0x270EEF790](v5, a2, v4);
}

uint64_t sub_23454CCB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23454CF4C(&qword_2687A6A78, type metadata accessor for ASWebAuthenticationSessionError);

  return MEMORY[0x270EEF7D0](a1, a2, v4);
}

uint64_t sub_23454CD2C()
{
  return sub_234559E30();
}

uint64_t sub_23454CD8C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_234559BE0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_23454CDD4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_234559C10();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_23454CE00(uint64_t a1)
{
  uint64_t v2 = sub_23454CF4C(&qword_2687A6930, type metadata accessor for ASAuthorizationCustomMethod);
  uint64_t v3 = sub_23454CF4C(&qword_2687A6938, type metadata accessor for ASAuthorizationCustomMethod);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_23454CEBC()
{
  return sub_23454CF4C(&qword_2687A6918, type metadata accessor for ASAuthorizationCustomMethod);
}

uint64_t sub_23454CF04()
{
  return sub_23454CF4C(&qword_2687A6920, type metadata accessor for ASAuthorizationCustomMethod);
}

uint64_t sub_23454CF4C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_23454CF94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23454CF4C(&qword_2687A6A40, type metadata accessor for ASAuthorizationError);

  return MEMORY[0x270EEF7B8](a1, a2, a3, v6);
}

BOOL sub_23454D018(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23454D02C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23454CF4C(&qword_2687A6A78, type metadata accessor for ASWebAuthenticationSessionError);

  return MEMORY[0x270EEF7B8](a1, a2, a3, v6);
}

uint64_t sub_23454D0B0(uint64_t a1, uint64_t a2)
{
  return sub_23454D0C8(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_23454D0C8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_234559C10();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_23454D10C()
{
  sub_234559C10();
  sub_234559C20();

  return swift_bridgeObjectRelease();
}

uint64_t sub_23454D160()
{
  sub_234559C10();
  sub_234559E10();
  sub_234559C20();
  uint64_t v0 = sub_234559E30();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_23454D1D4()
{
  uint64_t v0 = sub_234559C10();
  uint64_t v2 = v1;
  if (v0 == sub_234559C10() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_234559DB0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_23454D260()
{
  return sub_23454CF4C(&qword_2687A6928, type metadata accessor for ASAuthorizationCustomMethod);
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

void type metadata accessor for ASAuthorizationError(uint64_t a1)
{
}

void type metadata accessor for ASWebAuthenticationSessionError(uint64_t a1)
{
}

void type metadata accessor for ButtonType(uint64_t a1)
{
}

void type metadata accessor for RequestOptions(uint64_t a1)
{
}

uint64_t sub_23454D33C()
{
  return sub_23454CF4C(&qword_2687A69C8, type metadata accessor for RequestOptions);
}

uint64_t sub_23454D384()
{
  return sub_23454CF4C(&qword_2687A69D0, type metadata accessor for RequestOptions);
}

uint64_t sub_23454D3CC()
{
  return sub_23454CF4C(&qword_2687A69D8, type metadata accessor for RequestOptions);
}

uint64_t sub_23454D414()
{
  return sub_23454CF4C(&qword_2687A69E0, type metadata accessor for RequestOptions);
}

uint64_t sub_23454D45C()
{
  return sub_23454CF4C(&qword_2687A69E8, type metadata accessor for ASWebAuthenticationSessionError);
}

uint64_t sub_23454D4A4()
{
  return sub_23454CF4C(&qword_2687A69F0, type metadata accessor for ASWebAuthenticationSessionError);
}

uint64_t sub_23454D4EC()
{
  return sub_23454CF4C(&qword_2687A69F8, type metadata accessor for ASAuthorizationError);
}

uint64_t sub_23454D534()
{
  return sub_23454CF4C(&qword_2687A6A00, type metadata accessor for ASAuthorizationError);
}

uint64_t sub_23454D57C()
{
  return sub_23454CF4C(&qword_2687A6A08, type metadata accessor for ASAuthorizationError);
}

uint64_t sub_23454D5C4()
{
  return sub_23454CF4C(&qword_2687A6A10, type metadata accessor for ASAuthorizationError);
}

uint64_t sub_23454D60C()
{
  return sub_23454CF4C(&qword_2687A6A18, type metadata accessor for ASAuthorizationError);
}

uint64_t sub_23454D654()
{
  return sub_23454CF4C(&qword_2687A6A20, _s3__C4CodeOMa_0);
}

void _s3__C4CodeOMa_0(uint64_t a1)
{
}

uint64_t sub_23454D6B0()
{
  return sub_23454CF4C(&qword_2687A6A28, _s3__C4CodeOMa_0);
}

unint64_t sub_23454D6FC()
{
  unint64_t result = qword_2687A6A30;
  if (!qword_2687A6A30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687A6A30);
  }
  return result;
}

uint64_t sub_23454D750()
{
  return sub_23454CF4C(&qword_2687A6A38, _s3__C4CodeOMa_0);
}

uint64_t sub_23454D798()
{
  return sub_23454CF4C(&qword_2687A6A40, type metadata accessor for ASAuthorizationError);
}

uint64_t sub_23454D7E0()
{
  return sub_23454CF4C(&qword_2687A6A48, type metadata accessor for ASWebAuthenticationSessionError);
}

uint64_t sub_23454D828()
{
  return sub_23454CF4C(&qword_2687A6A50, type metadata accessor for ASWebAuthenticationSessionError);
}

uint64_t sub_23454D870()
{
  return sub_23454CF4C(&qword_2687A6A58, type metadata accessor for ASWebAuthenticationSessionError);
}

uint64_t sub_23454D8B8()
{
  return sub_23454CF4C(&qword_2687A6A60, type metadata accessor for Code);
}

void type metadata accessor for Code(uint64_t a1)
{
}

void sub_23454D914(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_23454D95C()
{
  return sub_23454CF4C(&qword_2687A6A68, type metadata accessor for Code);
}

uint64_t sub_23454D9A4()
{
  return sub_23454CF4C(&qword_2687A6A70, type metadata accessor for Code);
}

uint64_t sub_23454D9EC()
{
  return sub_23454CF4C(&qword_2687A6A78, type metadata accessor for ASWebAuthenticationSessionError);
}

uint64_t sub_23454DA34(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0;
    }
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t AuthorizationController.performRequests(_:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v3 + 32) = a1;
  *(void *)(v3 + 40) = a2;
  *(_OWORD *)(v3 + 48) = *v2;
  *(void *)(v3 + 64) = sub_234559CB0();
  *(void *)(v3 + 72) = sub_234559CA0();
  uint64_t v5 = sub_234559C70();
  *(void *)(v3 + 80) = v5;
  *(void *)(v3 + 88) = v4;
  return MEMORY[0x270FA2498](sub_23454DB2C, v5, v4);
}

uint64_t sub_23454DB2C()
{
  swift_bridgeObjectRetain();
  v0[12] = sub_234559CA0();
  uint64_t v2 = sub_234559C70();
  v0[13] = v2;
  v0[14] = v1;
  return MEMORY[0x270FA2498](sub_23454DBC0, v2, v1);
}

uint64_t sub_23454DBC0()
{
  Class super_class = v0[3].super_class;
  Class v2 = v0[2].super_class;
  id receiver = v0[3].receiver;
  uint64_t v4 = (objc_class *)type metadata accessor for AuthorizationOperation();
  uint64_t v5 = (char *)objc_allocWithZone(v4);
  uint64_t v6 = &v5[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationCompletionHandler];
  *(void *)uint64_t v6 = 0;
  *((void *)v6 + 1) = 0;
  uint64_t v7 = &v5[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider];
  *(void *)uint64_t v7 = 0;
  *((void *)v7 + 1) = 0;
  uint64_t v8 = OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_stateStorage;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687A6D40);
  uint64_t v9 = swift_allocObject();
  *(_DWORD *)(v9 + 20) = 0;
  *(unsigned char *)(v9 + 16) = 0;
  *(void *)&v5[v8] = v9;
  *(void *)&v5[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationController] = 0;
  *(void *)&v5[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationContextProvider] = 0;
  v10 = &v5[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_requestContext];
  *(void *)v10 = v2;
  *((void *)v10 + 1) = 0;
  v10[16] = 0;
  v0[1].id receiver = v5;
  v0[1].Class super_class = v4;
  swift_bridgeObjectRetain();
  v11 = (objc_class *)objc_msgSendSuper2(v0 + 1, sel_init);
  v0[7].Class super_class = v11;
  v12 = (void *)((char *)v11
                 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider);
  uint64_t v13 = *(void *)((char *)v11
                  + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider);
  void *v12 = receiver;
  v12[1] = super_class;
  swift_retain();
  sub_234551854(v13);
  uint64_t v14 = swift_task_alloc();
  v0[8].id receiver = (id)v14;
  *(void *)(v14 + 16) = v11;
  uint64_t v15 = swift_task_alloc();
  v0[8].Class super_class = (Class)v15;
  *(void *)(v15 + 16) = v11;
  uint64_t v16 = sub_234559CA0();
  v0[9].id receiver = (id)v16;
  v17 = (objc_class *)swift_task_alloc();
  v0[9].Class super_class = v17;
  *(void *)v17 = v0;
  *((void *)v17 + 1) = sub_23454DDD8;
  id v18 = v0[2].receiver;
  uint64_t v19 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA2338](v18, &unk_2687A6C20, v14, sub_234551904, v15, v16, v19, &type metadata for ASAuthorizationResult);
}

uint64_t sub_23454DDD8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 160) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 104);
    uint64_t v4 = *(void *)(v2 + 112);
    uint64_t v5 = sub_23454DF8C;
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(void *)(v2 + 104);
    uint64_t v4 = *(void *)(v2 + 112);
    uint64_t v5 = sub_23454DF10;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_23454DF10()
{
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = *(void *)(v0 + 88);
  return MEMORY[0x270FA2498](sub_234552200, v1, v2);
}

uint64_t sub_23454DF8C()
{
  uint64_t v1 = (void *)v0[15];
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = v0[10];
  uint64_t v3 = v0[11];
  return MEMORY[0x270FA2498](sub_23454E030, v2, v3);
}

uint64_t sub_23454E030()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_23454E094(uint64_t a1, _OWORD *a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 24) = a3;
  *(void *)(v4 + 32) = a4;
  *(void *)(v4 + 16) = a1;
  *(_OWORD *)(v4 + 40) = *a2;
  *(void *)(v4 + 56) = sub_234559CB0();
  *(void *)(v4 + 64) = sub_234559CA0();
  uint64_t v6 = sub_234559C70();
  *(void *)(v4 + 72) = v6;
  *(void *)(v4 + 80) = v5;
  return MEMORY[0x270FA2498](sub_23454E13C, v6, v5);
}

uint64_t sub_23454E13C()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  id v4 = objc_allocWithZone((Class)type metadata accessor for AuthorizationOperation());
  uint64_t v5 = swift_bridgeObjectRetain();
  uint64_t v6 = (char *)sub_234552984(v5, v2);
  v0[11] = v6;
  uint64_t v7 = &v6[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider];
  uint64_t v8 = *(void *)&v6[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider];
  *(void *)uint64_t v7 = v3;
  *((void *)v7 + 1) = v1;
  swift_retain();
  sub_234551854(v8);
  uint64_t v9 = swift_task_alloc();
  v0[12] = v9;
  *(void *)(v9 + 16) = v6;
  uint64_t v10 = swift_task_alloc();
  v0[13] = v10;
  *(void *)(v10 + 16) = v6;
  uint64_t v11 = sub_234559CA0();
  v0[14] = v11;
  v12 = (void *)swift_task_alloc();
  v0[15] = v12;
  void *v12 = v0;
  v12[1] = sub_23454E2C4;
  uint64_t v13 = v0[2];
  uint64_t v14 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA2338](v13, &unk_2687A6C90, v9, sub_23455220C, v10, v11, v14, &type metadata for ASAuthorizationResult);
}

uint64_t sub_23454E2C4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 72);
    uint64_t v4 = *(void *)(v2 + 80);
    uint64_t v5 = sub_23454E478;
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(void *)(v2 + 72);
    uint64_t v4 = *(void *)(v2 + 80);
    uint64_t v5 = sub_23454E3FC;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_23454E3FC()
{
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_23454E478()
{
  uint64_t v1 = *(void **)(v0 + 88);
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_23454E51C(uint64_t a1, _OWORD *a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 24) = a3;
  *(void *)(v4 + 32) = a4;
  *(void *)(v4 + 16) = a1;
  *(_OWORD *)(v4 + 40) = *a2;
  *(void *)(v4 + 56) = sub_234559CB0();
  *(void *)(v4 + 64) = sub_234559CA0();
  uint64_t v6 = sub_234559C70();
  *(void *)(v4 + 72) = v6;
  *(void *)(v4 + 80) = v5;
  return MEMORY[0x270FA2498](sub_23454E5C4, v6, v5);
}

void sub_23454E5C4()
{
}

uint64_t sub_23454E604(uint64_t a1)
{
  v2[11] = a1;
  uint64_t v5 = (void *)(a1
                + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider);
  uint64_t v6 = *(void *)(a1
                 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider);
  void *v5 = v3;
  v5[1] = v1;
  swift_retain();
  sub_234551854(v6);
  uint64_t v7 = swift_task_alloc();
  v2[12] = v7;
  *(void *)(v7 + 16) = a1;
  uint64_t v8 = swift_task_alloc();
  v2[13] = v8;
  *(void *)(v8 + 16) = a1;
  uint64_t v9 = sub_234559CA0();
  v2[14] = v9;
  uint64_t v10 = (void *)swift_task_alloc();
  v2[15] = v10;
  void *v10 = v2;
  v10[1] = sub_23454E728;
  uint64_t v11 = v2[2];
  uint64_t v12 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA2338](v11, &unk_2687A6C88, v7, sub_23455220C, v8, v9, v12, &type metadata for ASAuthorizationResult);
}

uint64_t sub_23454E728()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 72);
    uint64_t v4 = *(void *)(v2 + 80);
    uint64_t v5 = sub_23454E8EC;
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(void *)(v2 + 72);
    uint64_t v4 = *(void *)(v2 + 80);
    uint64_t v5 = sub_23454E860;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_23454E860()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_23454E8EC()
{
  uint64_t v1 = *(void **)(v0 + 88);
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t AuthorizationController.performRequest(_:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v3 + 32) = a1;
  *(void *)(v3 + 40) = a2;
  *(_OWORD *)(v3 + 48) = *v2;
  *(void *)(v3 + 64) = sub_234559CB0();
  *(void *)(v3 + 72) = sub_234559CA0();
  uint64_t v5 = sub_234559C70();
  *(void *)(v3 + 80) = v5;
  *(void *)(v3 + 88) = v4;
  return MEMORY[0x270FA2498](sub_23454EA3C, v5, v4);
}

uint64_t sub_23454EA3C()
{
  uint64_t v1 = (void *)v0[5];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687A6E70);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_23455AE80;
  *(void *)(v2 + 32) = v1;
  uint64_t v7 = v2;
  sub_234559C60();
  v0[12] = v7;
  id v3 = v1;
  v0[13] = sub_234559CA0();
  uint64_t v5 = sub_234559C70();
  v0[14] = v5;
  v0[15] = v4;
  return MEMORY[0x270FA2498](sub_23454EB14, v5, v4);
}

uint64_t sub_23454EB14()
{
  swift_bridgeObjectRetain();
  v0[16] = sub_234559CA0();
  uint64_t v2 = sub_234559C70();
  v0[17] = v2;
  v0[18] = v1;
  return MEMORY[0x270FA2498](sub_23454EBA8, v2, v1);
}

uint64_t sub_23454EBA8()
{
  id receiver = v0[6].receiver;
  Class super_class = v0[3].super_class;
  id v3 = v0[3].receiver;
  uint64_t v4 = (objc_class *)type metadata accessor for AuthorizationOperation();
  uint64_t v5 = (char *)objc_allocWithZone(v4);
  uint64_t v6 = &v5[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationCompletionHandler];
  *(void *)uint64_t v6 = 0;
  *((void *)v6 + 1) = 0;
  uint64_t v7 = &v5[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider];
  *(void *)uint64_t v7 = 0;
  *((void *)v7 + 1) = 0;
  uint64_t v8 = OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_stateStorage;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687A6D40);
  uint64_t v9 = swift_allocObject();
  *(_DWORD *)(v9 + 20) = 0;
  *(unsigned char *)(v9 + 16) = 0;
  *(void *)&v5[v8] = v9;
  *(void *)&v5[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationController] = 0;
  *(void *)&v5[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationContextProvider] = 0;
  uint64_t v10 = &v5[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_requestContext];
  *(void *)uint64_t v10 = receiver;
  *((void *)v10 + 1) = 0;
  v10[16] = 0;
  v0[1].id receiver = v5;
  v0[1].Class super_class = v4;
  swift_bridgeObjectRetain();
  uint64_t v11 = (objc_class *)objc_msgSendSuper2(v0 + 1, sel_init);
  v0[9].Class super_class = v11;
  uint64_t v12 = (void *)((char *)v11
                 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider);
  uint64_t v13 = *(void *)((char *)v11
                  + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider);
  void *v12 = v3;
  v12[1] = super_class;
  swift_retain();
  sub_234551854(v13);
  uint64_t v14 = swift_task_alloc();
  v0[10].id receiver = (id)v14;
  *(void *)(v14 + 16) = v11;
  uint64_t v15 = swift_task_alloc();
  v0[10].Class super_class = (Class)v15;
  *(void *)(v15 + 16) = v11;
  uint64_t v16 = sub_234559CA0();
  v0[11].id receiver = (id)v16;
  v17 = (objc_class *)swift_task_alloc();
  v0[11].Class super_class = v17;
  *(void *)v17 = v0;
  *((void *)v17 + 1) = sub_23454EDC4;
  id v18 = v0[2].receiver;
  uint64_t v19 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA2338](v18, &unk_2687A6C30, v14, sub_23455220C, v15, v16, v19, &type metadata for ASAuthorizationResult);
}

uint64_t sub_23454EDC4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 192) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 136);
    uint64_t v4 = *(void *)(v2 + 144);
    uint64_t v5 = sub_23454F048;
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(void *)(v2 + 136);
    uint64_t v4 = *(void *)(v2 + 144);
    uint64_t v5 = sub_23454EEFC;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_23454EEFC()
{
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(void *)(v0 + 112);
  uint64_t v2 = *(void *)(v0 + 120);
  return MEMORY[0x270FA2498](sub_23454EF78, v1, v2);
}

uint64_t sub_23454EF78()
{
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = *(void *)(v0 + 88);
  return MEMORY[0x270FA2498](sub_23454EFE4, v1, v2);
}

uint64_t sub_23454EFE4()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_23454F048()
{
  uint64_t v1 = (void *)v0[19];
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = v0[14];
  uint64_t v3 = v0[15];
  return MEMORY[0x270FA2498](sub_23454F0EC, v2, v3);
}

uint64_t sub_23454F0EC()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = *(void *)(v0 + 88);
  return MEMORY[0x270FA2498](sub_23454F150, v1, v2);
}

uint64_t sub_23454F150()
{
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t AuthorizationController.performRequests(_:options:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v4 + 40) = a2;
  *(void *)(v4 + 48) = a3;
  *(void *)(v4 + 32) = a1;
  *(_OWORD *)(v4 + 56) = *v3;
  sub_234559CB0();
  *(void *)(v4 + 72) = sub_234559CA0();
  uint64_t v6 = sub_234559C70();
  *(void *)(v4 + 80) = v6;
  *(void *)(v4 + 88) = v5;
  return MEMORY[0x270FA2498](sub_23454F264, v6, v5);
}

uint64_t sub_23454F264()
{
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 56);
  swift_bridgeObjectRetain();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v1;
  void *v1 = v0;
  v1[1] = sub_23454F318;
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v4 = *(void *)(v0 + 32);
  return sub_23454E094(v4, (_OWORD *)(v0 + 16), v2, v3);
}

uint64_t sub_23454F318()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 104) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 88);
  if (v0) {
    uint64_t v5 = sub_23454F42C;
  }
  else {
    uint64_t v5 = sub_23454EFE4;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_23454F42C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t AuthorizationController.performRequest(_:options:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v4 + 40) = a2;
  *(void *)(v4 + 48) = a3;
  *(void *)(v4 + 32) = a1;
  *(_OWORD *)(v4 + 56) = *v3;
  *(void *)(v4 + 72) = sub_234559CB0();
  *(void *)(v4 + 80) = sub_234559CA0();
  uint64_t v6 = sub_234559C70();
  *(void *)(v4 + 88) = v6;
  *(void *)(v4 + 96) = v5;
  return MEMORY[0x270FA2498](sub_23454F538, v6, v5);
}

uint64_t sub_23454F538()
{
  uint64_t v1 = (void *)v0[5];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687A6E70);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_23455AE80;
  *(void *)(v2 + 32) = v1;
  uint64_t v7 = v2;
  sub_234559C60();
  v0[13] = v7;
  id v3 = v1;
  v0[14] = sub_234559CA0();
  uint64_t v5 = sub_234559C70();
  v0[15] = v5;
  v0[16] = v4;
  return MEMORY[0x270FA2498](sub_23454F610, v5, v4);
}

uint64_t sub_23454F610()
{
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 56);
  swift_bridgeObjectRetain();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v1;
  void *v1 = v0;
  v1[1] = sub_23454F6C8;
  uint64_t v2 = *(void *)(v0 + 104);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v4 = *(void *)(v0 + 32);
  return sub_23454E094(v4, (_OWORD *)(v0 + 16), v2, v3);
}

uint64_t sub_23454F6C8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 144) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 120);
  uint64_t v4 = *(void *)(v2 + 128);
  if (v0) {
    uint64_t v5 = sub_23454F8AC;
  }
  else {
    uint64_t v5 = sub_23454F7DC;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_23454F7DC()
{
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = *(void *)(v0 + 96);
  return MEMORY[0x270FA2498](sub_23454F848, v1, v2);
}

uint64_t sub_23454F848()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_23454F8AC()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = *(void *)(v0 + 96);
  return MEMORY[0x270FA2498](sub_23454F910, v1, v2);
}

uint64_t sub_23454F910()
{
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t AuthorizationController.performRequests(_:customMethods:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v4 + 40) = a2;
  *(void *)(v4 + 48) = a3;
  *(void *)(v4 + 32) = a1;
  *(_OWORD *)(v4 + 56) = *v3;
  sub_234559CB0();
  *(void *)(v4 + 72) = sub_234559CA0();
  uint64_t v6 = sub_234559C70();
  *(void *)(v4 + 80) = v6;
  *(void *)(v4 + 88) = v5;
  return MEMORY[0x270FA2498](sub_23454FA24, v6, v5);
}

uint64_t sub_23454FA24()
{
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v1;
  void *v1 = v0;
  v1[1] = sub_23454F318;
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v4 = *(void *)(v0 + 32);
  return sub_23454E51C(v4, (_OWORD *)(v0 + 16), v2, v3);
}

void sub_23454FAE8()
{
  uint64_t v0 = (char *)objc_allocWithZone((Class)type metadata accessor for AuthorizationOperation());
  uint64_t v1 = &v0[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationCompletionHandler];
  *(void *)uint64_t v1 = 0;
  *((void *)v1 + 1) = 0;
  uint64_t v2 = &v0[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider];
  *(void *)uint64_t v2 = 0;
  *((void *)v2 + 1) = 0;
  uint64_t v3 = OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_stateStorage;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687A6D40);
  uint64_t v4 = swift_allocObject();
  *(_DWORD *)(v4 + 20) = 0;
  *(unsigned char *)(v4 + 16) = 0;
  *(void *)&v0[v3] = v4;
  *(void *)&v0[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationController] = 0;
  *(void *)&v0[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationContextProvider] = 0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();

  sub_234559D80();
  __break(1u);
}

uint64_t AuthorizationController.performRequest(_:customMethods:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v4 + 80) = a2;
  *(void *)(v4 + 88) = a3;
  *(void *)(v4 + 72) = a1;
  *(_OWORD *)(v4 + 96) = *v3;
  *(void *)(v4 + 112) = sub_234559CB0();
  *(void *)(v4 + 120) = sub_234559CA0();
  uint64_t v6 = sub_234559C70();
  *(void *)(v4 + 128) = v6;
  *(void *)(v4 + 136) = v5;
  return MEMORY[0x270FA2498](sub_23454FC7C, v6, v5);
}

uint64_t sub_23454FC7C()
{
  uint64_t v1 = (void *)v0[10];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687A6E70);
  uint64_t inited = swift_initStackObject();
  v0[18] = inited;
  *(_OWORD *)(inited + 16) = xmmword_23455AE80;
  *(void *)(inited + 32) = v1;
  uint64_t v7 = inited;
  sub_234559C60();
  v0[19] = v7;
  id v3 = v1;
  v0[20] = sub_234559CA0();
  uint64_t v5 = sub_234559C70();
  v0[21] = v5;
  v0[22] = v4;
  return MEMORY[0x270FA2498](sub_23454FD58, v5, v4);
}

uint64_t sub_23454FD58()
{
  *(_OWORD *)(v0 + 56) = *(_OWORD *)(v0 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 184) = v1;
  void *v1 = v0;
  v1[1] = sub_23454FE24;
  uint64_t v2 = *(void *)(v0 + 152);
  uint64_t v3 = *(void *)(v0 + 88);
  uint64_t v4 = *(void *)(v0 + 72);
  return sub_23454E51C(v4, (_OWORD *)(v0 + 56), v2, v3);
}

uint64_t sub_23454FE24()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 192) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 168);
  uint64_t v4 = *(void *)(v2 + 176);
  if (v0) {
    uint64_t v5 = sub_234550008;
  }
  else {
    uint64_t v5 = sub_23454FF38;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_23454FF38()
{
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v2 = *(void *)(v0 + 136);
  return MEMORY[0x270FA2498](sub_23454FFA4, v1, v2);
}

uint64_t sub_23454FFA4()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_234550008()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v2 = *(void *)(v0 + 136);
  return MEMORY[0x270FA2498](sub_23455006C, v1, v2);
}

uint64_t sub_23455006C()
{
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t AuthorizationController.performAutoFillAssistedRequests(_:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v3 + 32) = a1;
  *(void *)(v3 + 40) = a2;
  *(_OWORD *)(v3 + 48) = *v2;
  *(void *)(v3 + 64) = sub_234559CB0();
  *(void *)(v3 + 72) = sub_234559CA0();
  uint64_t v5 = sub_234559C70();
  *(void *)(v3 + 80) = v5;
  *(void *)(v3 + 88) = v4;
  return MEMORY[0x270FA2498](sub_234550180, v5, v4);
}

uint64_t sub_234550180()
{
  swift_bridgeObjectRetain();
  v0[12] = sub_234559CA0();
  uint64_t v2 = sub_234559C70();
  v0[13] = v2;
  v0[14] = v1;
  return MEMORY[0x270FA2498](sub_234550214, v2, v1);
}

uint64_t sub_234550214()
{
  Class super_class = v0[3].super_class;
  Class v2 = v0[2].super_class;
  id receiver = v0[3].receiver;
  uint64_t v4 = (objc_class *)type metadata accessor for AuthorizationOperation();
  uint64_t v5 = (char *)objc_allocWithZone(v4);
  uint64_t v6 = &v5[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationCompletionHandler];
  *(void *)uint64_t v6 = 0;
  *((void *)v6 + 1) = 0;
  uint64_t v7 = &v5[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider];
  *(void *)uint64_t v7 = 0;
  *((void *)v7 + 1) = 0;
  uint64_t v8 = OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_stateStorage;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687A6D40);
  uint64_t v9 = swift_allocObject();
  *(_DWORD *)(v9 + 20) = 0;
  *(unsigned char *)(v9 + 16) = 0;
  *(void *)&v5[v8] = v9;
  *(void *)&v5[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationController] = 0;
  *(void *)&v5[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationContextProvider] = 0;
  uint64_t v10 = &v5[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_requestContext];
  *(void *)uint64_t v10 = v2;
  *((void *)v10 + 1) = 0;
  v10[16] = 1;
  v0[1].id receiver = v5;
  v0[1].Class super_class = v4;
  swift_bridgeObjectRetain();
  uint64_t v11 = (objc_class *)objc_msgSendSuper2(v0 + 1, sel_init);
  v0[7].Class super_class = v11;
  uint64_t v12 = (void *)((char *)v11
                 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider);
  uint64_t v13 = *(void *)((char *)v11
                  + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider);
  void *v12 = receiver;
  v12[1] = super_class;
  swift_retain();
  sub_234551854(v13);
  uint64_t v14 = swift_task_alloc();
  v0[8].id receiver = (id)v14;
  *(void *)(v14 + 16) = v11;
  uint64_t v15 = swift_task_alloc();
  v0[8].Class super_class = (Class)v15;
  *(void *)(v15 + 16) = v11;
  uint64_t v16 = sub_234559CA0();
  v0[9].id receiver = (id)v16;
  v17 = (objc_class *)swift_task_alloc();
  v0[9].Class super_class = v17;
  *(void *)v17 = v0;
  *((void *)v17 + 1) = sub_234550430;
  id v18 = v0[2].receiver;
  uint64_t v19 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA2338](v18, &unk_2687A6C70, v14, sub_23455220C, v15, v16, v19, &type metadata for ASAuthorizationResult);
}

uint64_t sub_234550430()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 160) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 104);
    uint64_t v4 = *(void *)(v2 + 112);
    uint64_t v5 = sub_234550568;
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(void *)(v2 + 104);
    uint64_t v4 = *(void *)(v2 + 112);
    uint64_t v5 = sub_23454DF10;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_234550568()
{
  uint64_t v1 = (void *)v0[15];
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = v0[10];
  uint64_t v3 = v0[11];
  return MEMORY[0x270FA2498](sub_234552210, v2, v3);
}

uint64_t AuthorizationController.performAutoFillAssistedRequest(_:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v3 + 32) = a1;
  *(void *)(v3 + 40) = a2;
  *(_OWORD *)(v3 + 48) = *v2;
  *(void *)(v3 + 64) = sub_234559CB0();
  *(void *)(v3 + 72) = sub_234559CA0();
  uint64_t v5 = sub_234559C70();
  *(void *)(v3 + 80) = v5;
  *(void *)(v3 + 88) = v4;
  return MEMORY[0x270FA2498](sub_2345506B0, v5, v4);
}

uint64_t sub_2345506B0()
{
  uint64_t v1 = (void *)v0[5];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687A6E70);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_23455AE80;
  *(void *)(v2 + 32) = v1;
  uint64_t v7 = v2;
  sub_234559C60();
  v0[12] = v7;
  id v3 = v1;
  v0[13] = sub_234559CA0();
  uint64_t v5 = sub_234559C70();
  v0[14] = v5;
  v0[15] = v4;
  return MEMORY[0x270FA2498](sub_234550788, v5, v4);
}

uint64_t sub_234550788()
{
  swift_bridgeObjectRetain();
  v0[16] = sub_234559CA0();
  uint64_t v2 = sub_234559C70();
  v0[17] = v2;
  v0[18] = v1;
  return MEMORY[0x270FA2498](sub_23455081C, v2, v1);
}

uint64_t sub_23455081C()
{
  id receiver = v0[6].receiver;
  Class super_class = v0[3].super_class;
  id v3 = v0[3].receiver;
  uint64_t v4 = (objc_class *)type metadata accessor for AuthorizationOperation();
  uint64_t v5 = (char *)objc_allocWithZone(v4);
  uint64_t v6 = &v5[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationCompletionHandler];
  *(void *)uint64_t v6 = 0;
  *((void *)v6 + 1) = 0;
  uint64_t v7 = &v5[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider];
  *(void *)uint64_t v7 = 0;
  *((void *)v7 + 1) = 0;
  uint64_t v8 = OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_stateStorage;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687A6D40);
  uint64_t v9 = swift_allocObject();
  *(_DWORD *)(v9 + 20) = 0;
  *(unsigned char *)(v9 + 16) = 0;
  *(void *)&v5[v8] = v9;
  *(void *)&v5[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationController] = 0;
  *(void *)&v5[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationContextProvider] = 0;
  uint64_t v10 = &v5[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_requestContext];
  *(void *)uint64_t v10 = receiver;
  *((void *)v10 + 1) = 0;
  v10[16] = 1;
  v0[1].id receiver = v5;
  v0[1].Class super_class = v4;
  swift_bridgeObjectRetain();
  uint64_t v11 = (objc_class *)objc_msgSendSuper2(v0 + 1, sel_init);
  v0[9].Class super_class = v11;
  uint64_t v12 = (void *)((char *)v11
                 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider);
  uint64_t v13 = *(void *)((char *)v11
                  + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider);
  void *v12 = v3;
  v12[1] = super_class;
  swift_retain();
  sub_234551854(v13);
  uint64_t v14 = swift_task_alloc();
  v0[10].id receiver = (id)v14;
  *(void *)(v14 + 16) = v11;
  uint64_t v15 = swift_task_alloc();
  v0[10].Class super_class = (Class)v15;
  *(void *)(v15 + 16) = v11;
  uint64_t v16 = sub_234559CA0();
  v0[11].id receiver = (id)v16;
  v17 = (objc_class *)swift_task_alloc();
  v0[11].Class super_class = v17;
  *(void *)v17 = v0;
  *((void *)v17 + 1) = sub_234550A3C;
  id v18 = v0[2].receiver;
  uint64_t v19 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA2338](v18, &unk_2687A6C80, v14, sub_23455220C, v15, v16, v19, &type metadata for ASAuthorizationResult);
}

uint64_t sub_234550A3C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 192) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 136);
    uint64_t v4 = *(void *)(v2 + 144);
    uint64_t v5 = sub_234550C5C;
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(void *)(v2 + 136);
    uint64_t v4 = *(void *)(v2 + 144);
    uint64_t v5 = sub_234550B74;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_234550B74()
{
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(void *)(v0 + 112);
  uint64_t v2 = *(void *)(v0 + 120);
  return MEMORY[0x270FA2498](sub_234550BF0, v1, v2);
}

uint64_t sub_234550BF0()
{
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = *(void *)(v0 + 88);
  return MEMORY[0x270FA2498](sub_234552200, v1, v2);
}

uint64_t sub_234550C5C()
{
  uint64_t v1 = (void *)v0[19];
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = v0[14];
  uint64_t v3 = v0[15];
  return MEMORY[0x270FA2498](sub_234550D00, v2, v3);
}

uint64_t sub_234550D00()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = *(void *)(v0 + 88);
  return MEMORY[0x270FA2498](sub_234552204, v1, v2);
}

uint64_t sub_234550D64(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  v2[4] = sub_234559CB0();
  v2[5] = sub_234559CA0();
  uint64_t v4 = sub_234559C70();
  v2[6] = v4;
  v2[7] = v3;
  return MEMORY[0x270FA2498](sub_234550E00, v4, v3);
}

uint64_t sub_234550E00()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = sub_234559CA0();
  v0[8] = v2;
  uint64_t v3 = swift_task_alloc();
  v0[9] = v3;
  *(void *)(v3 + 16) = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[10] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_234550F08;
  uint64_t v5 = v0[2];
  uint64_t v6 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA2360](v5, v2, v6, 0xD000000000000021, 0x800000023455CD70, sub_2345520F0, v3, &type metadata for ASAuthorizationResult);
}

uint64_t sub_234550F08()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 88) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 48);
    uint64_t v4 = *(void *)(v2 + 56);
    uint64_t v5 = sub_234551090;
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    uint64_t v3 = *(void *)(v2 + 48);
    uint64_t v4 = *(void *)(v2 + 56);
    uint64_t v5 = sub_23455102C;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_23455102C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_234551090()
{
  swift_release();
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_234551108(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687A6CC0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388]();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v7 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8 + v7, (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  uint64_t v9 = (uint64_t (**)(uint64_t))(a2
                                        + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationCompletionHandler);
  uint64_t v10 = *(void *)(a2
                  + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationCompletionHandler);
  *uint64_t v9 = sub_23455218C;
  v9[1] = (uint64_t (*)(uint64_t))v8;
  sub_234551854(v10);
  return sub_234552218();
}

uint64_t sub_234551254(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  if (*(unsigned char *)(a1 + 9))
  {
    id v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687A6CC0);
    return sub_234559C80();
  }
  else
  {
    id v5 = v2;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687A6CC0);
    return sub_234559C90();
  }
}

uint64_t sub_2345512D8(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687A6C98);
  MEMORY[0x270FA5388]();
  id v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_234559CD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  sub_234559CB0();
  id v5 = a1;
  uint64_t v6 = sub_234559CA0();
  unint64_t v7 = (void *)swift_allocObject();
  uint64_t v8 = MEMORY[0x263F8F500];
  v7[2] = v6;
  v7[3] = v8;
  v7[4] = v5;
  sub_2345514EC((uint64_t)v3, (uint64_t)&unk_2687A6CA8, (uint64_t)v7);
  return swift_release();
}

uint64_t sub_2345513F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  sub_234559CB0();
  *(void *)(v4 + 24) = sub_234559CA0();
  uint64_t v6 = sub_234559C70();
  return MEMORY[0x270FA2498](sub_234551488, v6, v5);
}

uint64_t sub_234551488()
{
  swift_release();
  sub_234552588();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2345514EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_234559CD0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_234559CC0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_234551DCC(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_234559C70();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t EnvironmentValues.authorizationController.getter@<X0>(id (**a1)()@<X8>)
{
  uint64_t v3 = sub_234559A50();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388]();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v1, v3);
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v4 + 32))(v7 + v6, (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
  *a1 = sub_234551B30;
  a1[1] = (id (*)())v7;
  return result;
}

id sub_2345517B8()
{
  uint64_t v0 = (void *)sub_234559A30();
  if (!v0) {
    return 0;
  }
  uint64_t v1 = v0;
  id v2 = objc_msgSend(v0, sel_scene);

  if (v2)
  {
    self;
    uint64_t v3 = (void *)swift_dynamicCastObjCClass();
    if (!v3) {

    }
    id v2 = objc_msgSend(v3, sel_keyWindow);
  }
  return v2;
}

uint64_t sub_234551854(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_234551864(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_234552208;
  return sub_234550D64(a1, v4);
}

uint64_t sub_234551904()
{
  return sub_2345512D8(*(void **)(v0 + 16));
}

uint64_t sub_23455190C(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_2345519AC;
  return sub_234550D64(a1, v4);
}

uint64_t sub_2345519AC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_234551AA0()
{
  uint64_t v1 = sub_234559A50();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

id sub_234551B30()
{
  sub_234559A50();

  return sub_2345517B8();
}

void *initializeBufferWithCopyOfBuffer for AuthorizationController(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for AuthorizationController()
{
  return swift_release();
}

void *assignWithCopy for AuthorizationController(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for AuthorizationController(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AuthorizationController(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AuthorizationController(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AuthorizationController()
{
  return &type metadata for AuthorizationController;
}

uint64_t sub_234551CD8()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_234551D18(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_2345519AC;
  return sub_2345513F0(a1, v4, v5, v6);
}

uint64_t sub_234551DCC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687A6C98);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_234551E2C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_234551F08;
  return v6(a1);
}

uint64_t sub_234551F08()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_234552000()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_234552038(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_234552208;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2687A6CB0 + dword_2687A6CB0);
  return v6(a1, v4);
}

uint64_t sub_2345520F0(uint64_t a1)
{
  return sub_234551108(a1, *(void *)(v1 + 16));
}

uint64_t sub_2345520F8()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687A6CC0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_23455218C(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687A6CC0);

  return sub_234551254(a1);
}

uint64_t sub_234552218()
{
  uint64_t v1 = sub_234559B90();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)&aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_234559BB0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend(v0, sel_isCancelled))
  {
    sub_234553C78(0, (unint64_t *)&qword_2687A6D20);
    uint64_t v9 = (void *)sub_234559CF0();
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v0;
    v20 = sub_234553C5C;
    uint64_t v21 = v10;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v17 = 1107296256;
    uint64_t v11 = &block_descriptor_28;
  }
  else
  {
    sub_234552B74();
    sub_234553C78(0, (unint64_t *)&qword_2687A6D20);
    uint64_t v9 = (void *)sub_234559CF0();
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v0;
    v20 = sub_234553C34;
    uint64_t v21 = v12;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v17 = 1107296256;
    uint64_t v11 = &block_descriptor_22;
  }
  id v18 = sub_234555824;
  uint64_t v19 = v11;
  uint64_t v13 = _Block_copy(&aBlock);
  id v14 = v0;
  swift_release();
  sub_234559BA0();
  uint64_t aBlock = MEMORY[0x263F8EE78];
  sub_234553BEC((unint64_t *)&unk_2687A6F70, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687A6D30);
  sub_234553B48();
  sub_234559D30();
  MEMORY[0x237DBF9C0](0, v8, v4, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_234552588()
{
  uint64_t v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = sub_234559B90();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_234559BB0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17.id receiver = v1;
  v17.Class super_class = ObjectType;
  objc_msgSendSuper2(&v17, sel_cancel);
  sub_234553C78(0, (unint64_t *)&qword_2687A6D20);
  uint64_t v11 = (void *)sub_234559CF0();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v1;
  aBlock[4] = sub_234553CC8;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_234555824;
  aBlock[3] = &block_descriptor;
  uint64_t v13 = _Block_copy(aBlock);
  id v14 = v1;
  swift_release();
  sub_234559BA0();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_234553BEC((unint64_t *)&unk_2687A6F70, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687A6D30);
  sub_234553B48();
  sub_234559D30();
  MEMORY[0x237DBF9C0](0, v10, v6, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

BOOL sub_234552864(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_234552878()
{
  return sub_234559E30();
}

uint64_t sub_2345528C0()
{
  return sub_234559E20();
}

uint64_t sub_2345528EC()
{
  return sub_234559E30();
}

id sub_234552984(uint64_t a1, uint64_t a2)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = &v2[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationCompletionHandler];
  *(void *)uint64_t v6 = 0;
  *((void *)v6 + 1) = 0;
  uint64_t v7 = &v2[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider];
  *(void *)uint64_t v7 = 0;
  *((void *)v7 + 1) = 0;
  uint64_t v8 = OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_stateStorage;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687A6D40);
  uint64_t v9 = swift_allocObject();
  *(_DWORD *)(v9 + 20) = 0;
  *(unsigned char *)(v9 + 16) = 0;
  *(void *)&v2[v8] = v9;
  *(void *)&v2[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationController] = 0;
  *(void *)&v2[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationContextProvider] = 0;
  uint64_t v10 = &v2[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_requestContext];
  *(void *)uint64_t v10 = a1;
  *((void *)v10 + 1) = a2;
  v10[16] = 0;
  v12.id receiver = v2;
  v12.Class super_class = ObjectType;
  return objc_msgSendSuper2(&v12, sel_init);
}

uint64_t sub_234552A58(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = (uint64_t *)(v1
                 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationCompletionHandler);
  uint64_t v4 = *(void (**)(void **))(v1
                                      + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationCompletionHandler);
  if (v4)
  {
    uint64_t v15 = a1;
    __int16 v16 = 256;
    sub_234553AD4((uint64_t)v4);
    id v6 = a1;
    v4(&v15);
    sub_234551854((uint64_t)v4);

    uint64_t v7 = *v3;
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t *v3 = 0;
  v3[1] = 0;
  sub_234551854(v7);
  uint64_t v8 = *(void **)(v1
                + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationContextProvider);
  *(void *)(v1 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationContextProvider) = 0;

  uint64_t v9 = (void *)(v1
                + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider);
  uint64_t v10 = *(void *)(v1
                  + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider);
  *uint64_t v9 = 0;
  v9[1] = 0;
  sub_234551854(v10);
  uint64_t v11 = OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationController;
  objc_super v12 = *(void **)(v2 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationController);
  if (v12)
  {
    objc_msgSend(v12, sel_cancel);
    uint64_t v13 = *(void **)(v2 + v11);
  }
  else
  {
    uint64_t v13 = 0;
  }
  *(void *)(v2 + v11) = 0;

  return sub_234552B74();
}

uint64_t sub_234552B74()
{
  swift_getKeyPath();
  sub_234559980();
  swift_getKeyPath();
  sub_234559980();
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_stateStorage);
  uint64_t v2 = v1 + 4;
  uint64_t v3 = v1 + 5;
  os_unfair_lock_lock(v1 + 5);
  sub_234553AEC(v2);
  os_unfair_lock_unlock(v3);
  swift_getKeyPath();
  sub_234559990();
  swift_getKeyPath();
  return sub_234559990();
}

uint64_t sub_234552C68()
{
  uint64_t v1 = v0;
  uint64_t v2 = (uint64_t *)(v0
                 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider);
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v0
                                         + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider);
  if (v3)
  {
    uint64_t v4 = swift_retain();
    uint64_t v5 = v3(v4);
    sub_234551854((uint64_t)v3);
    id v6 = 0;
    if (v5)
    {
      uint64_t v7 = (objc_class *)type metadata accessor for AuthorizationOperation.PresentationContextProvider();
      uint64_t v8 = (char *)objc_allocWithZone(v7);
      *(void *)&v8[OBJC_IVAR____TtCC31_AuthenticationServices_SwiftUI22AuthorizationOperationP33_BCDE3EDBB9065C8EBFE58D5929093A3327PresentationContextProvider_presentationAnchor] = v5;
      v12.id receiver = v8;
      v12.Class super_class = v7;
      id v6 = objc_msgSendSuper2(&v12, sel_init);
    }
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v9 = *(void **)(v1
                + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationContextProvider);
  *(void *)(v1 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationContextProvider) = v6;

  uint64_t v10 = *v2;
  *uint64_t v2 = 0;
  v2[1] = 0;
  return sub_234551854(v10);
}

id sub_234552D38()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_requestContext;
  id v2 = objc_allocWithZone(MEMORY[0x263EFC380]);
  sub_234553C78(0, (unint64_t *)&qword_2687A6D38);
  swift_bridgeObjectRetain();
  uint64_t v3 = (void *)sub_234559C50();
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(v2, sel_initWithAuthorizationRequests_, v3);

  uint64_t v5 = OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationController;
  id v6 = *(void **)(v0 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationController);
  *(void *)(v0 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationController) = v4;

  uint64_t v7 = *(void **)(v0 + v5);
  if (v7)
  {
    objc_msgSend(v7, sel_setDelegate_, v0);
    uint64_t v8 = *(void **)(v0 + v5);
    if (v8) {
      objc_msgSend(v8, sel_setPresentationContextProvider_, *(void *)(v0+ OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationContextProvider));
    }
  }
  id result = *(id *)(v0 + v5);
  if (*(unsigned char *)(v1 + 16) == 1)
  {
    if (!result) {
      return result;
    }
    uint64_t v10 = sel_performAutoFillAssistedRequests;
    return [result v10];
  }
  if (result)
  {
    uint64_t v10 = sel_performRequestsWithOptions_;
    return [result v10];
  }
  return result;
}

void sub_234552EE0()
{
  type metadata accessor for ASAuthorizationError(0);
  sub_234557980(MEMORY[0x263F8EE78]);
  sub_234553BEC(&qword_2687A6A40, type metadata accessor for ASAuthorizationError);
  sub_234559970();
  sub_234552A58(v0);
}

BOOL sub_234553068()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_stateStorage);
  id v2 = v1 + 4;
  uint64_t v3 = v1 + 5;
  os_unfair_lock_lock(v1 + 5);
  sub_2345531CC(v2, &v5);
  os_unfair_lock_unlock(v3);
  return v5 == 1;
}

BOOL sub_23455315C()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_stateStorage);
  id v2 = v1 + 4;
  uint64_t v3 = v1 + 5;
  os_unfair_lock_lock(v1 + 5);
  sub_2345531CC(v2, &v5);
  os_unfair_lock_unlock(v3);
  return v5 == 2;
}

unsigned char *sub_2345531CC@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_2345531D8(void *a1@<X0>, BOOL *a2@<X8>)
{
  uint64_t v3 = *(os_unfair_lock_s **)(*a1
                            + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_stateStorage);
  id v4 = v3 + 4;
  char v5 = v3 + 5;
  os_unfair_lock_lock(v3 + 5);
  sub_2345531CC(v4, &v6);
  os_unfair_lock_unlock(v5);
  *a2 = v6 == 1;
}

void sub_234553254(void *a1@<X0>, BOOL *a2@<X8>)
{
  uint64_t v3 = *(os_unfair_lock_s **)(*a1
                            + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_stateStorage);
  id v4 = v3 + 4;
  char v5 = v3 + 5;
  os_unfair_lock_lock(v3 + 5);
  sub_2345531CC(v4, &v6);
  os_unfair_lock_unlock(v5);
  *a2 = v6 == 2;
}

uint64_t sub_2345532D0(uint64_t a1)
{
  id v2 = (uint64_t *)(v1
                 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationCompletionHandler);
  uint64_t v3 = *(void (**)(id *))(v1
                                   + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationCompletionHandler);
  if (v3)
  {
    char v4 = *(unsigned char *)(a1 + 8);
    id v12 = *(id *)a1;
    char v13 = v4;
    char v14 = 0;
    sub_234553AD4((uint64_t)v3);
    id v5 = v12;
    v3(&v12);
    sub_234551854((uint64_t)v3);

    uint64_t v6 = *v2;
  }
  else
  {
    uint64_t v6 = 0;
  }
  *id v2 = 0;
  v2[1] = 0;
  sub_234551854(v6);
  uint64_t v7 = *(void **)(v1
                + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationContextProvider);
  *(void *)(v1 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationContextProvider) = 0;

  uint64_t v8 = (void *)(v1
                + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider);
  uint64_t v9 = *(void *)(v1
                 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider);
  *uint64_t v8 = 0;
  v8[1] = 0;
  sub_234551854(v9);
  uint64_t v10 = *(void **)(v1 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationController);
  *(void *)(v1 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationController) = 0;

  return sub_234552B74();
}

id sub_234553528()
{
  v2.id receiver = v0;
  v2.Class super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AuthorizationOperation()
{
  return self;
}

uint64_t type metadata accessor for AuthorizationOperation.PresentationContextProvider()
{
  return self;
}

uint64_t destroy for AuthorizationOperation.RequestContext()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s31_AuthenticationServices_SwiftUI22AuthorizationOperationC14RequestContextVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AuthorizationOperation.RequestContext(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for AuthorizationOperation.RequestContext(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for AuthorizationOperation.RequestContext(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 17)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AuthorizationOperation.RequestContext(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 17) = 1;
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
    *(unsigned char *)(result + 17) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AuthorizationOperation.RequestContext()
{
  return &type metadata for AuthorizationOperation.RequestContext;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AuthorizationOperation.State(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AuthorizationOperation.State(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x234553A34);
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

uint64_t sub_234553A5C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_234553A64(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AuthorizationOperation.State()
{
  return &type metadata for AuthorizationOperation.State;
}

unint64_t sub_234553A80()
{
  unint64_t result = qword_2687A6D18;
  if (!qword_2687A6D18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687A6D18);
  }
  return result;
}

uint64_t sub_234553AD4(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

unsigned char *sub_234553AEC(unsigned char *result)
{
  *unint64_t result = *(unsigned char *)(v1 + 16);
  return result;
}

uint64_t sub_234553AF8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
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

unint64_t sub_234553B48()
{
  unint64_t result = qword_2687A6F80;
  if (!qword_2687A6F80)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687A6D30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687A6F80);
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

uint64_t sub_234553BEC(unint64_t *a1, void (*a2)(uint64_t))
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

id sub_234553C34()
{
  return sub_234552D38();
}

void sub_234553C5C()
{
}

uint64_t sub_234553C78(uint64_t a1, unint64_t *a2)
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

void static SignInWithAppleButton.Label.signIn.getter(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

unsigned __int8 *SignInWithAppleButton.init(_:onRequest:onCompletion:)@<X0>(unsigned __int8 *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  *a6 = *result;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  a6[4] = a5;
  return result;
}

uint64_t SignInWithAppleButton.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v5 = v1[4];
  *(void *)a1 = swift_getKeyPath();
  *(unsigned char *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  *(_OWORD *)(a1 + 32) = *((_OWORD *)v1 + 1);
  *(void *)(a1 + 48) = v5;
  swift_retain();

  return swift_retain();
}

void static SignInWithAppleButton.Label.continue.getter(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

void static SignInWithAppleButton.Label.signUp.getter(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_234553D8C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v5 = v1[4];
  *(void *)a1 = swift_getKeyPath();
  *(unsigned char *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  *(_OWORD *)(a1 + 32) = *((_OWORD *)v1 + 1);
  *(void *)(a1 + 48) = v5;
  swift_retain();

  return swift_retain();
}

uint64_t View.signInWithAppleButtonStyle(_:)()
{
  return swift_release();
}

uint64_t sub_234553E78()
{
  sub_23455579C();

  return sub_234559A60();
}

uint64_t sub_234553EC0@<X0>(unsigned char *a1@<X8>)
{
  sub_23455579C();
  uint64_t result = sub_234559A60();
  *a1 = v3;
  return result;
}

uint64_t sub_234553F10()
{
  return sub_234559A70();
}

uint64_t sub_234553F5C(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &opaque type descriptor for <<opaque return type of SignInWithAppleButton.body>>, 1);
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

ValueMetadata *type metadata accessor for SignInWithAppleButton()
{
  return &type metadata for SignInWithAppleButton;
}

ValueMetadata *type metadata accessor for SignInWithAppleButton.Label()
{
  return &type metadata for SignInWithAppleButton.Label;
}

ValueMetadata *type metadata accessor for SignInWithAppleButton.Style()
{
  return &type metadata for SignInWithAppleButton.Style;
}

void sub_234553FDC(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

id sub_234553FE8()
{
  uint64_t v1 = *(void *)v0;
  char v2 = *(unsigned char *)(v0 + 8);
  uint64_t v3 = *(void *)(v0 + 16);
  sub_234554C04(*(void *)v0, v2);
  sub_234554F54(v1, v2, &v10);
  sub_234554C58(v1, v2);
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFC368]), sel_initWithAuthorizationButtonType_authorizationButtonStyle_, v3, qword_23455B350[(char)v10]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687A6E58);
  sub_234559B30();
  uint64_t v5 = v10;
  unsigned int v6 = *(void **)&v10[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUIP33_A3D59D81812617403D8A44C04D5B775311Coordinator_button];
  *(void *)&v10[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUIP33_A3D59D81812617403D8A44C04D5B775311Coordinator_button] = v4;
  id v7 = v4;

  sub_234559B30();
  int v8 = v10;
  objc_msgSend(v7, sel_addTarget_action_forControlEvents_, v10, sel_buttonPressed, 64);

  return v7;
}

void sub_234554104(void *a1)
{
  id v1 = objc_msgSend(a1, sel_window);
  if (v1)
  {
    id v2 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687A6E58);
    sub_234559B30();
    uint64_t v3 = *(void **)&v4[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUIP33_A3D59D81812617403D8A44C04D5B775311Coordinator_presentationAnchor];
    *(void *)&v4[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUIP33_A3D59D81812617403D8A44C04D5B775311Coordinator_presentationAnchor] = v2;
  }
}

id sub_234554180@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v5 = *(void *)(v1 + 48);
  unsigned int v6 = (objc_class *)type metadata accessor for Coordinator();
  long long v10 = *(_OWORD *)(v1 + 32);
  id v7 = (char *)objc_allocWithZone(v6);
  *(void *)&v7[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUIP33_A3D59D81812617403D8A44C04D5B775311Coordinator_presentationAnchor] = 0;
  *(void *)&v7[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUIP33_A3D59D81812617403D8A44C04D5B775311Coordinator_button] = 0;
  int v8 = &v7[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUIP33_A3D59D81812617403D8A44C04D5B775311Coordinator_config];
  *(void *)int v8 = v3;
  *((void *)v8 + 1) = v4;
  *((_OWORD *)v8 + 1) = v10;
  *((void *)v8 + 4) = v5;
  v11.id receiver = v7;
  v11.Class super_class = v6;
  swift_retain();
  swift_retain();
  id result = objc_msgSendSuper2(&v11, sel_init);
  *a1 = result;
  return result;
}

uint64_t sub_23455423C()
{
  return sub_234559AA0();
}

uint64_t sub_234554280(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_234555648();

  return MEMORY[0x270F01780](a1, a2, a3, v6);
}

uint64_t sub_2345542E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_234555648();

  return MEMORY[0x270F01718](a1, a2, a3, v6);
}

uint64_t sub_234554348()
{
  return sub_234559B80();
}

void sub_234554364()
{
}

void sub_23455438C()
{
  uint64_t v1 = v0;
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFC378]), sel_init);
  id v3 = objc_msgSend(v2, sel_createRequest);
  (*(void (**)(void))(v0
                    + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUIP33_A3D59D81812617403D8A44C04D5B775311Coordinator_config
                    + 8))();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687A6E70);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_23455AE80;
  *(void *)(v4 + 32) = v3;
  sub_234559C60();
  id v5 = objc_allocWithZone(MEMORY[0x263EFC380]);
  sub_23455575C();
  id v6 = v3;
  id v7 = (void *)sub_234559C50();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(v5, sel_initWithAuthorizationRequests_, v7);

  objc_msgSend(v8, sel_setDelegate_, v1);
  objc_msgSend(v8, sel_setPresentationContextProvider_, v1);
  objc_msgSend(v8, sel_performRequests);
}

id sub_234554574()
{
  v2.id receiver = v0;
  v2.Class super_class = (Class)type metadata accessor for Coordinator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for Coordinator()
{
  return self;
}

unint64_t sub_2345547BC()
{
  unint64_t result = qword_2687A6E30;
  if (!qword_2687A6E30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687A6E30);
  }
  return result;
}

uint64_t sub_234554810()
{
  return swift_getWitnessTable();
}

unint64_t sub_234554880()
{
  unint64_t result = qword_2687A6E40;
  if (!qword_2687A6E40)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687A6E38);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687A6E40);
  }
  return result;
}

ValueMetadata *type metadata accessor for SignInWithAppleButton.Style.Storage()
{
  return &type metadata for SignInWithAppleButton.Style.Storage;
}

unsigned char *_s31_AuthenticationServices_SwiftUI21SignInWithAppleButtonV5LabelV7StorageOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2345549B8);
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

ValueMetadata *type metadata accessor for SignInWithAppleButton.Label.Storage()
{
  return &type metadata for SignInWithAppleButton.Label.Storage;
}

uint64_t initializeBufferWithCopyOfBuffer for Configuration(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t _s31_AuthenticationServices_SwiftUI13ConfigurationVwxx_0()
{
  swift_release();

  return swift_release();
}

uint64_t _s31_AuthenticationServices_SwiftUI13ConfigurationVwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = v4;
  swift_retain();
  swift_retain();
  return a1;
}

void *_s31_AuthenticationServices_SwiftUI13ConfigurationVwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = a2[4];
  a1[3] = a2[3];
  a1[4] = v5;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t _s31_AuthenticationServices_SwiftUI13ConfigurationVwta_0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  return a1;
}

uint64_t _s31_AuthenticationServices_SwiftUI13ConfigurationVwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_234554BAC(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Configuration()
{
  return &type metadata for Configuration;
}

uint64_t sub_234554C04(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t destroy for ViewRepresentable(uint64_t a1)
{
  sub_234554C58(*(void *)a1, *(unsigned char *)(a1 + 8));
  swift_release();

  return swift_release();
}

uint64_t sub_234554C58(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t initializeWithCopy for ViewRepresentable(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_234554C04(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  uint64_t v7 = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = v7;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ViewRepresentable(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_234554C04(*(void *)a2, v5);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_234554C58(v6, v7);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v8 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v8;
  swift_retain();
  swift_release();
  uint64_t v9 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v9;
  swift_retain();
  swift_release();
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

uint64_t assignWithTake for ViewRepresentable(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  char v5 = *((unsigned char *)a2 + 8);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_234554C58(v6, v7);
  *(void *)(a1 + 16) = a2[2];
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 3);
  swift_release();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 5);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ViewRepresentable(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ViewRepresentable(uint64_t result, int a2, int a3)
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ViewRepresentable()
{
  return &type metadata for ViewRepresentable;
}

unint64_t sub_234554E98()
{
  unint64_t result = qword_2687A6E48;
  if (!qword_2687A6E48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687A6E48);
  }
  return result;
}

unint64_t sub_234554EF0()
{
  unint64_t result = qword_2687A6E50;
  if (!qword_2687A6E50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687A6E50);
  }
  return result;
}

uint64_t sub_234554F44()
{
  return MEMORY[0x263F1BB58];
}

uint64_t sub_234554F54@<X0>(uint64_t a1@<X0>, char a2@<W1>, unsigned char *a3@<X8>)
{
  uint64_t v6 = sub_234559A50();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t result = MEMORY[0x270FA5388]();
  long long v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    *a3 = a1;
  }
  else
  {
    sub_234554C04(a1, 0);
    os_log_type_t v11 = sub_234559CE0();
    id v12 = sub_234559B40();
    if (os_log_type_enabled(v12, v11))
    {
      uint64_t v13 = swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      uint64_t v16 = v14;
      *(_DWORD *)uint64_t v13 = 136315138;
      *(void *)(v13 + 4) = sub_23455513C(0x656C797453, 0xE500000000000000, &v16);
      _os_log_impl(&dword_23454A000, v12, v11, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x237DBFF30](v14, -1, -1);
      MEMORY[0x237DBFF30](v13, -1, -1);
    }

    sub_234559A40();
    swift_getAtKeyPath();
    sub_234554C58(a1, 0);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  return result;
}

unint64_t sub_23455513C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_234555210(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_234555360((uint64_t)v12, *a3);
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
      sub_234555360((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_234555210(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    unint64_t result = sub_2345553BC(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = sub_234559D60();
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

uint64_t sub_234555360(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2345553BC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_234555454(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_234555558(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_234555558((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_234555454(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_2345554F0(v2, 0);
      uint64_t result = sub_234559D50();
      if (v5) {
        break;
      }
      if (result == v2) {
        return (uint64_t)v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_234559C40();
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

void *sub_2345554F0(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687A6E60);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_234555558(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687A6E60);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  id v12 = v10 + 32;
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

unint64_t sub_234555648()
{
  unint64_t result = qword_2687A6E68;
  if (!qword_2687A6E68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687A6E68);
  }
  return result;
}

uint64_t sub_23455569C()
{
  uint64_t v1 = *(void **)(v0
                + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUIP33_A3D59D81812617403D8A44C04D5B775311Coordinator_presentationAnchor);
  if (v1)
  {
    id v2 = *(id *)(v0
               + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUIP33_A3D59D81812617403D8A44C04D5B775311Coordinator_presentationAnchor);
LABEL_6:
    id v5 = v1;
    return (uint64_t)v2;
  }
  unint64_t v3 = *(void **)(v0
                + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUIP33_A3D59D81812617403D8A44C04D5B775311Coordinator_button);
  if (v3)
  {
    id v4 = objc_msgSend(v3, sel_window);
    if (v4)
    {
      id v2 = v4;
      uint64_t v1 = 0;
      goto LABEL_6;
    }
  }
  uint64_t result = sub_234559D80();
  __break(1u);
  return result;
}

unint64_t sub_23455575C()
{
  unint64_t result = qword_2687A6D38;
  if (!qword_2687A6D38)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2687A6D38);
  }
  return result;
}

unint64_t sub_23455579C()
{
  unint64_t result = qword_2687A6E80;
  if (!qword_2687A6E80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687A6E80);
  }
  return result;
}

ValueMetadata *type metadata accessor for SignInWithAppleButtonStyleKey()
{
  return &type metadata for SignInWithAppleButtonStyleKey;
}

uint64_t sub_234555824(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

id sub_2345558B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v10 = &v4[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_authenticationCompletionHandler];
  *(void *)uint64_t v10 = 0;
  *((void *)v10 + 1) = 0;
  size_t v11 = &v4[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_presentationAnchorProvider];
  *(void *)size_t v11 = 0;
  *((void *)v11 + 1) = 0;
  uint64_t v12 = OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_stateStorage;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687A6FB0);
  uint64_t v13 = swift_allocObject();
  *(_DWORD *)(v13 + 20) = 0;
  *(void *)&v4[v12] = v13;
  *(unsigned char *)(v13 + 16) = 0;
  *(void *)&v4[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_authenticationSession] = 0;
  *(void *)&v4[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_presentationContextProvider] = 0;
  uint64_t v14 = &v4[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_requestContext];
  uint64_t v15 = sub_2345599C0();
  uint64_t v16 = *(void *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v14, a1, v15);
  objc_super v17 = (int *)type metadata accessor for WebAuthenticationOperation.RequestContext(0);
  *(void *)&v14[v17[5]] = a2;
  *(void *)&v14[v17[6]] = a3;
  *(void *)&v14[v17[7]] = a4;
  v20.id receiver = v4;
  v20.Class super_class = ObjectType;
  id v18 = objc_msgSendSuper2(&v20, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(a1, v15);
  return v18;
}

uint64_t sub_234555A34()
{
  uint64_t v1 = sub_234559B90();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388]();
  id v4 = (char *)&aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_234559BB0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  int64_t v8 = (char *)&aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend(v0, sel_isCancelled))
  {
    sub_2345577A8();
    int64_t v9 = (void *)sub_234559CF0();
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v0;
    objc_super v20 = sub_234557D00;
    uint64_t v21 = v10;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v17 = 1107296256;
    size_t v11 = &block_descriptor_26;
  }
  else
  {
    sub_234555EF4();
    sub_2345577A8();
    int64_t v9 = (void *)sub_234559CF0();
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v0;
    objc_super v20 = sub_234557CD8;
    uint64_t v21 = v12;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v17 = 1107296256;
    size_t v11 = &block_descriptor_20;
  }
  id v18 = sub_234555824;
  uint64_t v19 = v11;
  uint64_t v13 = _Block_copy(&aBlock);
  id v14 = v0;
  swift_release();
  sub_234559BA0();
  uint64_t aBlock = MEMORY[0x263F8EE78];
  sub_234557AB8((unint64_t *)&unk_2687A6F70, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687A6D30);
  sub_234553B48();
  sub_234559D30();
  MEMORY[0x237DBF9C0](0, v8, v4, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_234555D84(void *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687A6F90);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (uint64_t *)((char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = (uint64_t *)(v2
                 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_authenticationCompletionHandler);
  uint64_t v7 = *(void (**)(void *))(v2
                                       + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_authenticationCompletionHandler);
  if (v7)
  {
    void *v5 = a1;
    swift_storeEnumTagMultiPayload();
    sub_234553AD4((uint64_t)v7);
    id v8 = a1;
    v7(v5);
    sub_234551854((uint64_t)v7);
    sub_234557D5C((uint64_t)v5, &qword_2687A6F90);
    uint64_t v9 = *v6;
  }
  else
  {
    uint64_t v9 = 0;
  }
  *uint64_t v6 = 0;
  v6[1] = 0;
  sub_234551854(v9);
  uint64_t v10 = *(void **)(v2
                 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_presentationContextProvider);
  *(void *)(v2
            + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_presentationContextProvider) = 0;

  size_t v11 = (void *)(v2
                 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_presentationAnchorProvider);
  uint64_t v12 = *(void *)(v2
                  + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_presentationAnchorProvider);
  void *v11 = 0;
  v11[1] = 0;
  sub_234551854(v12);
  uint64_t v13 = OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_authenticationSession;
  id v14 = *(void **)(v2
                 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_authenticationSession);
  if (v14)
  {
    objc_msgSend(v14, sel_cancel);
    uint64_t v15 = *(void **)(v2 + v13);
  }
  else
  {
    uint64_t v15 = 0;
  }
  *(void *)(v2 + v13) = 0;

  return sub_234555EF4();
}

uint64_t sub_234555EF4()
{
  swift_getKeyPath();
  sub_234559980();
  swift_getKeyPath();
  sub_234559980();
  uint64_t v1 = *(os_unfair_lock_s **)(v0
                            + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_stateStorage);
  uint64_t v2 = v1 + 4;
  uint64_t v3 = v1 + 5;
  os_unfair_lock_lock(v1 + 5);
  sub_234553AEC(v2);
  os_unfair_lock_unlock(v3);
  swift_getKeyPath();
  sub_234559990();
  swift_getKeyPath();
  return sub_234559990();
}

uint64_t sub_234555FE8()
{
  uint64_t v1 = v0;
  uint64_t v2 = (uint64_t *)(v0
                 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_presentationAnchorProvider);
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v0
                                         + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_presentationAnchorProvider);
  if (v3)
  {
    uint64_t v4 = swift_retain();
    uint64_t v5 = v3(v4);
    sub_234551854((uint64_t)v3);
    id v6 = 0;
    if (v5)
    {
      uint64_t v7 = (objc_class *)type metadata accessor for WebAuthenticationOperation.PresentationContextProvider();
      id v8 = (char *)objc_allocWithZone(v7);
      *(void *)&v8[OBJC_IVAR____TtCC31_AuthenticationServices_SwiftUI26WebAuthenticationOperationP33_8E8F7254784E6C7F9718057E730AB2A627PresentationContextProvider_presentationAnchor] = v5;
      v12.id receiver = v8;
      v12.Class super_class = v7;
      id v6 = objc_msgSendSuper2(&v12, sel_init);
    }
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v9 = *(void **)(v1
                + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_presentationContextProvider);
  *(void *)(v1
            + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_presentationContextProvider) = v6;

  uint64_t v10 = *v2;
  *uint64_t v2 = 0;
  v2[1] = 0;
  return sub_234551854(v10);
}

uint64_t sub_2345560B8()
{
  uint64_t v1 = v0;
  uint64_t v2 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v3 = v0 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_requestContext;
  uint64_t v4 = (int *)type metadata accessor for WebAuthenticationOperation.RequestContext(0);
  uint64_t v5 = *(void **)(v3 + v4[5]);
  id v6 = objc_allocWithZone(MEMORY[0x263EFC480]);
  id v7 = v5;
  swift_retain();
  id v8 = (void *)sub_2345599A0();
  v21[4] = sub_234557D54;
  v21[5] = v2;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 1107296256;
  v21[2] = sub_234557838;
  v21[3] = &block_descriptor_32;
  uint64_t v9 = _Block_copy(v21);
  id v10 = objc_msgSend(v6, sel_initWithURL_callback_completionHandler_, v8, v7, v9);
  _Block_release(v9);

  swift_release();
  uint64_t v11 = OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_authenticationSession;
  objc_super v12 = *(void **)(v1
                 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_authenticationSession);
  *(void *)(v1 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_authenticationSession) = v10;

  uint64_t v13 = *(void **)(v1 + v11);
  if (v13)
  {
    id v14 = *(void **)(v3 + v4[7]);
    id v15 = v13;
    if (v14) {
      id v14 = (void *)sub_234559BC0();
    }
    objc_msgSend(v13, sel_setAdditionalHeaderFields_, v14);

    uint64_t v16 = *(void **)(v1 + v11);
    if (v16)
    {
      objc_msgSend(v16, sel_setStorageMode_, *(void *)(v3 + v4[6]));
      uint64_t v17 = *(void **)(v1 + v11);
      if (v17)
      {
        objc_msgSend(v17, sel_setPresentationContextProvider_, *(void *)(v1+ OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_presentationContextProvider));
        id v18 = *(void **)(v1 + v11);
        if (v18)
        {
          id v19 = v18;
          objc_msgSend(v19, sel_start);
        }
      }
    }
  }
  return swift_release();
}

uint64_t sub_23455631C()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = sub_234559B90();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  id v6 = (char *)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_234559BB0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  id v10 = (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17.id receiver = v1;
  v17.Class super_class = ObjectType;
  objc_msgSendSuper2(&v17, sel_cancel);
  sub_2345577A8();
  uint64_t v11 = (void *)sub_234559CF0();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v1;
  aBlock[4] = sub_234557E90;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_234555824;
  aBlock[3] = &block_descriptor_0;
  uint64_t v13 = _Block_copy(aBlock);
  id v14 = v1;
  swift_release();
  sub_234559BA0();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_234557AB8((unint64_t *)&unk_2687A6F70, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687A6D30);
  sub_234553B48();
  sub_234559D30();
  MEMORY[0x237DBF9C0](0, v10, v6, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

void sub_2345565E8()
{
  type metadata accessor for ASWebAuthenticationSessionError(0);
  sub_234557980(MEMORY[0x263F8EE78]);
  sub_234557AB8(&qword_2687A6A78, type metadata accessor for ASWebAuthenticationSessionError);
  sub_234559970();
  sub_234555D84(v0);
}

BOOL sub_234556770()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0
                            + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_stateStorage);
  uint64_t v2 = v1 + 4;
  uint64_t v3 = v1 + 5;
  os_unfair_lock_lock(v1 + 5);
  sub_2345531CC(v2, &v5);
  os_unfair_lock_unlock(v3);
  return v5 == 1;
}

BOOL sub_234556864()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0
                            + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_stateStorage);
  uint64_t v2 = v1 + 4;
  uint64_t v3 = v1 + 5;
  os_unfair_lock_lock(v1 + 5);
  sub_2345531CC(v2, &v5);
  os_unfair_lock_unlock(v3);
  return v5 == 2;
}

void sub_2345568D4(void *a1@<X0>, BOOL *a2@<X8>)
{
  uint64_t v3 = *(os_unfair_lock_s **)(*a1
                            + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_stateStorage);
  uint64_t v4 = v3 + 4;
  char v5 = v3 + 5;
  os_unfair_lock_lock(v3 + 5);
  sub_2345531CC(v4, &v6);
  os_unfair_lock_unlock(v5);
  *a2 = v6 == 1;
}

void sub_234556950(void *a1@<X0>, BOOL *a2@<X8>)
{
  uint64_t v3 = *(os_unfair_lock_s **)(*a1
                            + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_stateStorage);
  uint64_t v4 = v3 + 4;
  char v5 = v3 + 5;
  os_unfair_lock_lock(v3 + 5);
  sub_2345531CC(v4, &v6);
  os_unfair_lock_unlock(v5);
  *a2 = v6 == 2;
}

void sub_2345569CC(uint64_t a1, void *a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687A6FA8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2345599C0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v12 = MEMORY[0x237DBFFE0](a3 + 16);
  if (v12)
  {
    uint64_t v13 = (char *)v12;
    sub_234557DB8(a1, (uint64_t)v7, &qword_2687A6FA8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    {
      sub_234557D5C((uint64_t)v7, &qword_2687A6FA8);
      if (a2)
      {
        id v14 = *(void **)&v13[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_authenticationSession];
        *(void *)&v13[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_authenticationSession] = 0;
        id v15 = a2;

        sub_234555D84(a2);
      }
      else
      {
        uint64_t v16 = *(void **)&v13[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_authenticationSession];
        *(void *)&v13[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_authenticationSession] = 0;

        type metadata accessor for ASWebAuthenticationSessionError(0);
        v18[1] = 1;
        sub_234557980(MEMORY[0x263F8EE78]);
        sub_234557AB8(&qword_2687A6A78, type metadata accessor for ASWebAuthenticationSessionError);
        sub_234559970();
        objc_super v17 = v19;
        sub_234555D84(v19);
      }
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
      sub_234556C68((uint64_t)v11);

      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    }
  }
}

uint64_t sub_234556C68(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687A6F90);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v5 = (uint64_t *)(v1
                 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_authenticationCompletionHandler);
  uint64_t v6 = *(void (**)(char *))(v1
                                     + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_authenticationCompletionHandler);
  if (v6)
  {
    uint64_t v7 = sub_2345599C0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a1, v7);
    swift_storeEnumTagMultiPayload();
    swift_retain();
    v6(v4);
    sub_234551854((uint64_t)v6);
    sub_234557D5C((uint64_t)v4, &qword_2687A6F90);
    uint64_t v8 = *v5;
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t *v5 = 0;
  v5[1] = 0;
  sub_234551854(v8);
  uint64_t v9 = *(void **)(v1
                + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_presentationContextProvider);
  *(void *)(v1
            + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_presentationContextProvider) = 0;

  uint64_t v10 = (void *)(v1
                 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_presentationAnchorProvider);
  uint64_t v11 = *(void *)(v1
                  + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_presentationAnchorProvider);
  void *v10 = 0;
  v10[1] = 0;
  sub_234551854(v11);
  uint64_t v12 = *(void **)(v1
                 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_authenticationSession);
  *(void *)(v1 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_authenticationSession) = 0;

  return sub_234555EF4();
}

uint64_t sub_234556EB8()
{
  return type metadata accessor for WebAuthenticationOperation(0);
}

uint64_t type metadata accessor for WebAuthenticationOperation(uint64_t a1)
{
  return sub_234556FB4(a1, (uint64_t *)&unk_2687A6EC8);
}

uint64_t sub_234556EE0()
{
  uint64_t result = type metadata accessor for WebAuthenticationOperation.RequestContext(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for WebAuthenticationOperation.RequestContext(uint64_t a1)
{
  return sub_234556FB4(a1, (uint64_t *)&unk_2687A6F50);
}

uint64_t sub_234556FB4(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata accessor for WebAuthenticationOperation.PresentationContextProvider()
{
  return self;
}

unsigned char *storeEnumTagSinglePayload for WebAuthenticationOperation.State(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2345570DCLL);
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

ValueMetadata *type metadata accessor for WebAuthenticationOperation.State()
{
  return &type metadata for WebAuthenticationOperation.State;
}

uint64_t *sub_234557114(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2345599C0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v10;
    *(uint64_t *)((char *)a1 + v9) = *(uint64_t *)((char *)a2 + v9);
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    id v11 = v10;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_234557200(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2345599C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);

  return swift_bridgeObjectRelease();
}

uint64_t sub_234557280(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2345599C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v9;
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  id v10 = v9;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_23455731C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2345599C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = *(void **)(a2 + v7);
  uint64_t v9 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = v8;
  id v10 = v8;

  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2345573CC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2345599C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_23455745C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2345599C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);

  uint64_t v9 = a3[7];
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(void *)(a1 + v9) = *(void *)(a2 + v9);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2345574FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_234557510);
}

uint64_t sub_234557510(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2345599C0();
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

uint64_t sub_2345575D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2345575E4);
}

uint64_t sub_2345575E4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_2345599C0();
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

uint64_t sub_2345576A0()
{
  uint64_t result = sub_2345599C0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_234557754()
{
  unint64_t result = qword_2687A6F60;
  if (!qword_2687A6F60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687A6F60);
  }
  return result;
}

unint64_t sub_2345577A8()
{
  unint64_t result = qword_2687A6D20;
  if (!qword_2687A6D20)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2687A6D20);
  }
  return result;
}

uint64_t sub_2345577E8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
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

uint64_t sub_234557838(uint64_t a1, uint64_t a2, void *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687A6FA8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void (**)(char *, void *))(a1 + 32);
  if (a2)
  {
    sub_2345599B0();
    uint64_t v9 = sub_2345599C0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 0, 1, v9);
  }
  else
  {
    uint64_t v10 = sub_2345599C0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  }
  swift_retain();
  id v11 = a3;
  v8(v7, a3);
  swift_release();

  return sub_234557D5C((uint64_t)v7, &qword_2687A6FA8);
}

unint64_t sub_234557980(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    int v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687A6F98);
  uint64_t v2 = sub_234559D90();
  int v3 = (void *)v2;
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
    sub_234557DB8(v6, (uint64_t)&v15, &qword_2687A6FA0);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_234557B08(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    id v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_234557B80(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_234557AB8(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_234557B08(uint64_t a1, uint64_t a2)
{
  sub_234559E10();
  sub_234559C20();
  uint64_t v4 = sub_234559E30();

  return sub_234557B90(a1, a2, v4);
}

_OWORD *sub_234557B80(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_234557B90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_234559DB0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        BOOL v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_234559DB0() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (sub_234559DB0()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_234557CD8()
{
  return sub_2345560B8();
}

void sub_234557D00()
{
}

uint64_t sub_234557D1C()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_234557D54(uint64_t a1, void *a2)
{
  sub_2345569CC(a1, a2, v2);
}

uint64_t sub_234557D5C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_234557DB8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_234557E1C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for WebAuthenticationOperation.RequestContext(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void static WebAuthenticationSession.BrowserSession.ephemeral.getter(void *a1@<X8>)
{
  *a1 = 1;
}

void static WebAuthenticationSession.BrowserSession.shared.getter(void *a1@<X8>)
{
  *a1 = 0;
}

void static WebAuthenticationSession.BrowserSession.standalone.getter(void *a1@<X8>)
{
  *a1 = 2;
}

uint64_t WebAuthenticationSession.authenticate(using:callbackURLScheme:preferredBrowserSession:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v6 + 48) = a3;
  *(void *)(v6 + 56) = a4;
  *(void *)(v6 + 32) = a1;
  *(void *)(v6 + 40) = a2;
  *(void *)(v6 + 64) = *(void *)a5;
  *(unsigned char *)(v6 + 136) = *(unsigned char *)(a5 + 8);
  *(_OWORD *)(v6 + 72) = *v5;
  sub_234559CB0();
  *(void *)(v6 + 88) = sub_234559CA0();
  uint64_t v8 = sub_234559C70();
  *(void *)(v6 + 96) = v8;
  *(void *)(v6 + 104) = v7;
  return MEMORY[0x270FA2498](sub_234557F70, v8, v7);
}

uint64_t sub_234557F70()
{
  char v1 = *(unsigned char *)(v0 + 136);
  uint64_t v3 = *(void *)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 64);
  long long v8 = *(_OWORD *)(v0 + 40);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 72);
  uint64_t v4 = swift_task_alloc();
  *(void *)(v0 + 112) = v4;
  *(_OWORD *)(v4 + 16) = v8;
  *(void *)(v4 + 32) = v3;
  *(void *)(v4 + 40) = v2;
  *(unsigned char *)(v4 + 48) = v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 120) = v5;
  void *v5 = v0;
  v5[1] = sub_234558068;
  uint64_t v6 = *(void *)(v0 + 32);
  return sub_2345584E4(v6, (uint64_t)sub_2345583B0, v4);
}

uint64_t sub_234558068()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 96);
    uint64_t v4 = *(void *)(v2 + 104);
    uint64_t v5 = sub_2345581E8;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = *(void *)(v2 + 96);
    uint64_t v4 = *(void *)(v2 + 104);
    uint64_t v5 = sub_234558184;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_234558184()
{
  swift_release();
  char v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2345581E8()
{
  swift_release();
  swift_task_dealloc();
  char v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

id sub_234558258(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  sub_2345599C0();
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v10 + 16))(v9, a1);
  id v11 = self;
  uint64_t v12 = (void *)sub_234559BE0();
  id v13 = objc_msgSend(v11, sel_callbackWithCustomScheme_, v12);

  if (a5) {
    a4 = 0;
  }
  unint64_t v14 = sub_2345583C0(MEMORY[0x263F8EE78]);
  id v15 = objc_allocWithZone((Class)type metadata accessor for WebAuthenticationOperation(0));
  return sub_2345558B8((uint64_t)v9, (uint64_t)v13, a4, v14);
}

id sub_2345583B0()
{
  return sub_234558258(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(unsigned char *)(v0 + 48));
}

unint64_t sub_2345583C0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687A6FF0);
  uint64_t v2 = (void *)sub_234559D90();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_2345595A8(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    id v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
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

uint64_t sub_2345584E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v4 + 24) = a2;
  *(void *)(v4 + 32) = a3;
  *(void *)(v4 + 16) = a1;
  *(_OWORD *)(v4 + 40) = *v3;
  *(void *)(v4 + 56) = sub_234559CB0();
  *(void *)(v4 + 64) = sub_234559CA0();
  uint64_t v6 = sub_234559C70();
  *(void *)(v4 + 72) = v6;
  *(void *)(v4 + 80) = v5;
  return MEMORY[0x270FA2498](sub_23455858C, v6, v5);
}

uint64_t sub_23455858C()
{
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v3 = (*(uint64_t (**)(void))(v0 + 24))();
  *(void *)(v0 + 88) = v3;
  uint64_t v4 = (void *)(v3
                + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_presentationAnchorProvider);
  uint64_t v5 = *(void *)(v3
                 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_presentationAnchorProvider);
  *uint64_t v4 = v2;
  v4[1] = v1;
  swift_retain();
  sub_234551854(v5);
  uint64_t v6 = swift_task_alloc();
  *(void *)(v0 + 96) = v6;
  *(void *)(v6 + 16) = v3;
  uint64_t v7 = swift_task_alloc();
  *(void *)(v0 + 104) = v7;
  *(void *)(v7 + 16) = v3;
  uint64_t v8 = sub_234559CA0();
  *(void *)(v0 + 112) = v8;
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 120) = v9;
  uint64_t v10 = sub_2345599C0();
  *uint64_t v9 = v0;
  v9[1] = sub_2345586FC;
  uint64_t v11 = *(void *)(v0 + 16);
  uint64_t v12 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA2338](v11, &unk_2687A6FE0, v6, sub_23455940C, v7, v8, v12, v10);
}

uint64_t sub_2345586FC()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 72);
    uint64_t v4 = *(void *)(v2 + 80);
    uint64_t v5 = sub_2345588A4;
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(void *)(v2 + 72);
    uint64_t v4 = *(void *)(v2 + 80);
    uint64_t v5 = sub_234558834;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_234558834()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2345588A4()
{
  uint64_t v1 = *(void **)(v0 + 88);
  swift_release();

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t WebAuthenticationSession.authenticate(using:callback:preferredBrowserSession:additionalHeaderFields:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v6 + 48) = a3;
  *(void *)(v6 + 56) = a5;
  *(void *)(v6 + 32) = a1;
  *(void *)(v6 + 40) = a2;
  *(void *)(v6 + 64) = *(void *)a4;
  *(unsigned char *)(v6 + 136) = *(unsigned char *)(a4 + 8);
  *(_OWORD *)(v6 + 72) = *v5;
  sub_234559CB0();
  *(void *)(v6 + 88) = sub_234559CA0();
  uint64_t v8 = sub_234559C70();
  *(void *)(v6 + 96) = v8;
  *(void *)(v6 + 104) = v7;
  return MEMORY[0x270FA2498](sub_2345589E8, v8, v7);
}

uint64_t sub_2345589E8()
{
  char v1 = *(unsigned char *)(v0 + 136);
  uint64_t v3 = *(void *)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 64);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 72);
  uint64_t v4 = swift_task_alloc();
  *(void *)(v0 + 112) = v4;
  *(_OWORD *)(v4 + 16) = *(_OWORD *)(v0 + 40);
  *(void *)(v4 + 32) = v2;
  *(unsigned char *)(v4 + 40) = v1;
  *(void *)(v4 + 48) = v3;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 120) = v5;
  void *v5 = v0;
  v5[1] = sub_234558ADC;
  uint64_t v6 = *(void *)(v0 + 32);
  return sub_2345584E4(v6, (uint64_t)sub_234558D08, v4);
}

uint64_t sub_234558ADC()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 96);
    uint64_t v4 = *(void *)(v2 + 104);
    uint64_t v5 = sub_234559708;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = *(void *)(v2 + 96);
    uint64_t v4 = *(void *)(v2 + 104);
    uint64_t v5 = sub_234559704;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

id sub_234558BF8(uint64_t a1, void *a2, uint64_t a3, char a4, uint64_t a5)
{
  sub_2345599C0();
  MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v12 + 16))(v11, a1);
  if (a4) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = a3;
  }
  objc_allocWithZone((Class)type metadata accessor for WebAuthenticationOperation(0));
  swift_bridgeObjectRetain();
  return sub_2345558B8((uint64_t)v11, (uint64_t)a2, v13, a5);
}

id sub_234558D08()
{
  return sub_234558BF8(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32), *(unsigned char *)(v0 + 40), *(void *)(v0 + 48));
}

uint64_t sub_234558D1C(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  v2[4] = sub_234559CB0();
  v2[5] = sub_234559CA0();
  uint64_t v4 = sub_234559C70();
  v2[6] = v4;
  v2[7] = v3;
  return MEMORY[0x270FA2498](sub_234558DB8, v4, v3);
}

uint64_t sub_234558DB8()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = sub_234559CA0();
  v0[8] = v2;
  uint64_t v3 = swift_task_alloc();
  v0[9] = v3;
  *(void *)(v3 + 16) = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[10] = v4;
  uint64_t v5 = sub_2345599C0();
  *uint64_t v4 = v0;
  v4[1] = sub_234550F08;
  uint64_t v6 = v0[2];
  uint64_t v7 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA2360](v6, v2, v7, 0xD000000000000025, 0x800000023455D390, sub_234559430, v3, v5);
}

uint64_t sub_234558EC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687A6FE8);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388]();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v7 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8 + v7, (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  uint64_t v9 = (uint64_t (**)(uint64_t))(a2
                                        + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_authenticationCompletionHandler);
  uint64_t v10 = *(void *)(a2
                  + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_authenticationCompletionHandler);
  *uint64_t v9 = sub_2345594CC;
  v9[1] = (uint64_t (*)(uint64_t))v8;
  sub_234551854(v10);
  return sub_234555A34();
}

uint64_t sub_234559010(uint64_t a1)
{
  uint64_t v2 = sub_2345599C0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687A6F90);
  MEMORY[0x270FA5388]();
  unint64_t v7 = (void *)((char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_234559540(a1, (uint64_t)v7);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v9[1] = *v7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687A6FE8);
    return sub_234559C80();
  }
  else
  {
    (*(void (**)(char *, void *, uint64_t))(v3 + 32))(v5, v7, v2);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687A6FE8);
    return sub_234559C90();
  }
}

uint64_t EnvironmentValues.webAuthenticationSession.getter@<X0>(id (**a1)()@<X8>)
{
  uint64_t v3 = sub_234559A50();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388]();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v1, v3);
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v4 + 32))(v7 + v6, (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
  *a1 = sub_234551B30;
  a1[1] = (id (*)())v7;
  return result;
}

uint64_t sub_2345592BC()
{
  uint64_t v1 = sub_234559A50();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

ValueMetadata *type metadata accessor for WebAuthenticationSession()
{
  return &type metadata for WebAuthenticationSession;
}

ValueMetadata *type metadata accessor for WebAuthenticationSession.BrowserSession()
{
  return &type metadata for WebAuthenticationSession.BrowserSession;
}

uint64_t sub_23455936C(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_2345519AC;
  return sub_234558D1C(a1, v4);
}

uint64_t sub_23455940C()
{
  return sub_23455631C();
}

uint64_t sub_234559430(uint64_t a1)
{
  return sub_234558EC4(a1, *(void *)(v1 + 16));
}

uint64_t sub_234559438()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687A6FE8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_2345594CC(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687A6FE8);

  return sub_234559010(a1);
}

uint64_t sub_234559540(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687A6F90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_2345595A8(uint64_t a1, uint64_t a2)
{
  sub_234559E10();
  sub_234559C20();
  uint64_t v4 = sub_234559E30();

  return sub_234559620(a1, a2, v4);
}

unint64_t sub_234559620(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_234559DB0() & 1) == 0)
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
      while (!v14 && (sub_234559DB0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t EnvironmentValues.credentialExportManager.getter()
{
  uint64_t v1 = sub_234559A50();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  MEMORY[0x270FA5388]();
  sub_2345599E0();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))((char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v0, v1);
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(v5 + v4, (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v1);
  return sub_2345599D0();
}

uint64_t sub_234559848()
{
  uint64_t v1 = sub_234559A50();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t EnvironmentValues.credentialImportManager.getter()
{
  return sub_2345599F0();
}

uint64_t sub_234559970()
{
  return MEMORY[0x270EEF800]();
}

uint64_t sub_234559980()
{
  return MEMORY[0x270EEFA68]();
}

uint64_t sub_234559990()
{
  return MEMORY[0x270EEFA70]();
}

uint64_t sub_2345599A0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_2345599B0()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_2345599C0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2345599D0()
{
  return MEMORY[0x270EE2770]();
}

uint64_t sub_2345599E0()
{
  return MEMORY[0x270EE2788]();
}

uint64_t sub_2345599F0()
{
  return MEMORY[0x270EE2790]();
}

uint64_t sub_234559A00()
{
  return MEMORY[0x270EE27A8]();
}

uint64_t sub_234559A10()
{
  return MEMORY[0x270EFF9A0]();
}

uint64_t sub_234559A20()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_234559A30()
{
  return MEMORY[0x270F00960]();
}

uint64_t sub_234559A40()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_234559A50()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_234559A60()
{
  return MEMORY[0x270F00F10]();
}

uint64_t sub_234559A70()
{
  return MEMORY[0x270F00F20]();
}

uint64_t sub_234559A80()
{
  return MEMORY[0x270F016E0]();
}

uint64_t sub_234559A90()
{
  return MEMORY[0x270F016F8]();
}

uint64_t sub_234559AA0()
{
  return MEMORY[0x270F01708]();
}

uint64_t sub_234559AC0()
{
  return MEMORY[0x270F01728]();
}

uint64_t sub_234559AD0()
{
  return MEMORY[0x270F01738]();
}

uint64_t sub_234559AE0()
{
  return MEMORY[0x270F01748]();
}

uint64_t sub_234559AF0()
{
  return MEMORY[0x270F01758]();
}

uint64_t sub_234559B00()
{
  return MEMORY[0x270F01768]();
}

uint64_t sub_234559B10()
{
  return MEMORY[0x270F01778]();
}

uint64_t sub_234559B30()
{
  return MEMORY[0x270F02418]();
}

uint64_t sub_234559B40()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_234559B50()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_234559B60()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_234559B70()
{
  return MEMORY[0x270F034A0]();
}

uint64_t sub_234559B80()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_234559B90()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_234559BA0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_234559BB0()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_234559BC0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_234559BD0()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_234559BE0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_234559BF0()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_234559C00()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_234559C10()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_234559C20()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_234559C30()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_234559C40()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_234559C50()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_234559C60()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_234559C70()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_234559C80()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_234559C90()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_234559CA0()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_234559CB0()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_234559CC0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_234559CD0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_234559CE0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_234559CF0()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_234559D00()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_234559D10()
{
  return MEMORY[0x270FA11A0]();
}

uint64_t sub_234559D30()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_234559D40()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_234559D50()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_234559D60()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_234559D70()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_234559D80()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_234559D90()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_234559DB0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_234559E00()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_234559E10()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_234559E20()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_234559E30()
{
  return MEMORY[0x270F9FC90]();
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
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

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
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