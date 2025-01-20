id TCPContactStore()
{
  void *v0;
  double Current;
  id v2;
  uint64_t v3;
  void *v4;
  double v5;
  NSObject *v6;
  int v8;
  double v9;
  uint64_t v10;
  uint64_t vars8;

  v10 = *MEMORY[0x263EF8340];
  v0 = (void *)TCPContactStore_contactStore;
  if (!TCPContactStore_contactStore)
  {
    Current = CFAbsoluteTimeGetCurrent();
    v2 = objc_alloc_init(MEMORY[0x263EFEA68]);
    [v2 setIncludeIncludeManagedAppleIDs:1];
    v3 = [objc_alloc(MEMORY[0x263EFEA58]) initWithConfiguration:v2];
    v4 = (void *)TCPContactStore_contactStore;
    TCPContactStore_contactStore = v3;

    v5 = CFAbsoluteTimeGetCurrent();
    v6 = CSLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = 134217984;
      v9 = (v5 - Current) * 1000.0;
      _os_log_impl(&dword_21809D000, v6, OS_LOG_TYPE_INFO, "Time to create CNContactStore: %fms", (uint8_t *)&v8, 0xCu);
    }

    v0 = (void *)TCPContactStore_contactStore;
  }

  return v0;
}

id CSCNAutocompleteSearchControllerHeaderView(void *a1)
{
  id v1 = a1;
  if (objc_opt_respondsToSelector())
  {
    id v2 = [v1 headerView];
  }
  else
  {
    id v2 = objc_alloc_init(MEMORY[0x263F82E00]);
  }
  v3 = v2;

  return v3;
}

void CSSetCNAutocompleteSearchControllerHeaderView(void *a1, void *a2)
{
  id v4 = a1;
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v4 setHeaderView:v3];
  }
}

void sub_21809FEE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id CSCKSharingSummaryStringFromOptionsGroups()
{
  v0 = CKSharingSummaryStringFromOptionsGroups();
  if ([v0 length]) {
    id v1 = v0;
  }
  else {
    id v1 = 0;
  }
  id v2 = v1;

  return v2;
}

uint64_t sub_2180A1A50()
{
  return sub_2180D02D0();
}

uint64_t sub_2180A1A98()
{
  return sub_2180D02B0();
}

uint64_t sub_2180A1AC4()
{
  return sub_2180D02D0();
}

BOOL sub_2180A1B08(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

BOOL sub_2180A1B20(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2180A1B34@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2180A1B40(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v2;
  v5[2] = *(_OWORD *)(a1 + 32);
  __int16 v6 = *(_WORD *)(a1 + 48);
  long long v3 = *(_OWORD *)(a2 + 16);
  v7[0] = *(_OWORD *)a2;
  v7[1] = v3;
  v7[2] = *(_OWORD *)(a2 + 32);
  __int16 v8 = *(_WORD *)(a2 + 48);
  return sub_2180AB0D0((uint64_t)v5, (uint64_t)v7) & 1;
}

double sub_2180A1B9C@<D0>(id *a1@<X0>, unsigned char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X4>, uint64_t a6@<X8>)
{
  id v7 = *a1;
  __int16 v8 = (SEL *)&unk_2642FF000;
  if (*a2)
  {
    unsigned int v9 = objc_msgSend(*a1, sel_isSelected) ^ 1;
LABEL_18:
    __int16 v48 = v9;
    id v25 = v7;
    id v26 = [v25 v8[211]];
    uint64_t v27 = sub_2180CFE50();
    uint64_t v29 = v28;

    id v30 = objc_msgSend(v25, sel_title);
    uint64_t v31 = sub_2180CFE50();
    uint64_t v33 = v32;

    id v34 = objc_msgSend(v25, sel_subtitle);
    uint64_t v35 = sub_2180CFE50();
    uint64_t v37 = v36;

    *(void *)a6 = v27;
    *(void *)(a6 + 8) = v29;
    *(void *)(a6 + 16) = v31;
    *(void *)(a6 + 24) = v33;
    *(void *)(a6 + 32) = v35;
    *(void *)(a6 + 40) = v37;
    *(_WORD *)(a6 + 48) = v48 | 0x100;
    return result;
  }
  id v13 = objc_msgSend(*a1, sel_identifier);
  uint64_t v14 = sub_2180CFE50();
  uint64_t v16 = v15;

  if (!a4)
  {
    swift_bridgeObjectRelease();
LABEL_11:
    LOWORD(v9) = 1;
    goto LABEL_12;
  }
  if (v14 == a3 && v16 == a4)
  {
    swift_bridgeObjectRelease();
    LOWORD(v9) = 0;
    uint64_t v19 = a5[1];
    if (v19) {
      goto LABEL_13;
    }
LABEL_17:
    __int16 v8 = (SEL *)&unk_2642FF000;
    goto LABEL_18;
  }
  char v18 = sub_2180D0250();
  swift_bridgeObjectRelease();
  LOWORD(v9) = 0;
  if ((v18 & 1) == 0) {
    goto LABEL_11;
  }
LABEL_12:
  uint64_t v19 = a5[1];
  if (!v19) {
    goto LABEL_17;
  }
LABEL_13:
  __int16 v47 = v9;
  uint64_t v20 = *a5;
  swift_bridgeObjectRetain();
  id v21 = objc_msgSend(v7, sel_identifier);
  uint64_t v22 = sub_2180CFE50();
  uint64_t v24 = v23;

  if (v20 == v22 && v19 == v24)
  {
    swift_bridgeObjectRelease();
LABEL_28:
    swift_bridgeObjectRelease();
    goto LABEL_29;
  }
  char v39 = sub_2180D0250();
  swift_bridgeObjectRelease();
  if (v39) {
    goto LABEL_28;
  }
  if (v20 == sub_2180CFE50() && v19 == v40)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v41 = sub_2180D0250();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v41 & 1) == 0)
    {
      __int16 v8 = (SEL *)&unk_2642FF000;
      LOWORD(v9) = v47;
      goto LABEL_18;
    }
  }
  __int16 v8 = (SEL *)&unk_2642FF000;
  id v42 = objc_msgSend(v7, sel_identifier);
  uint64_t v43 = sub_2180CFE50();
  uint64_t v45 = v44;

  if (!a4) {
    goto LABEL_28;
  }
  if (v43 == a3 && v45 == a4)
  {
    swift_bridgeObjectRelease();
    LOWORD(v9) = v47;
    goto LABEL_18;
  }
  char v46 = sub_2180D0250();
  swift_bridgeObjectRelease();
  LOWORD(v9) = v47;
  if (v46) {
    goto LABEL_18;
  }
LABEL_29:
  *(_WORD *)(a6 + 48) = 0;
  double result = 0.0;
  *(_OWORD *)(a6 + 16) = 0u;
  *(_OWORD *)(a6 + 32) = 0u;
  *(_OWORD *)a6 = 0u;
  return result;
}

uint64_t sub_2180A1EE8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  v5[0] = *a1;
  v5[1] = v2;
  v6[0] = a1[2];
  *(_OWORD *)((char *)v6 + 9) = *(_OWORD *)((char *)a1 + 41);
  long long v3 = a2[1];
  v7[0] = *a2;
  v7[1] = v3;
  v8[0] = a2[2];
  *(_OWORD *)((char *)v8 + 9) = *(_OWORD *)((char *)a2 + 41);
  return sub_2180AB9D0((uint64_t)v5, (uint64_t)v7) & 1;
}

uint64_t (*sub_2180A1F4C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2180A1FA0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2180AE2AC(&qword_267BBD670, (void (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel);
  sub_2180CF610();
  swift_release();
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 24);
  *a2 = *(void *)(v3 + 16);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2180A2060()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_2180A2144()
{
  swift_getKeyPath();
  sub_2180AE2AC(&qword_267BBD670, (void (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel);
  sub_2180CF610();
  swift_release();
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2180A2208()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_2180A22E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 16) = a2;
  *(void *)(a1 + 24) = a3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void (*sub_2180A2350(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_getKeyPath();
  v3[5] = OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel___observationRegistrar;
  void *v3 = v1;
  v3[6] = sub_2180AE2AC(&qword_267BBD670, (void (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel);
  sub_2180CF610();
  swift_release();
  void *v3 = v1;
  swift_getKeyPath();
  sub_2180CF630();
  swift_release();
  v3[7] = sub_2180A1F4C();
  return sub_2180A246C;
}

void sub_2180A246C(void *a1)
{
}

uint64_t (*sub_2180A2478())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2180A24CC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2180AE2AC(&qword_267BBD670, (void (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel);
  sub_2180CF610();
  swift_release();
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 32);
  uint64_t v5 = *(void *)(v3 + 40);
  uint64_t v6 = *(void *)(v3 + 48);
  uint64_t v7 = *(void *)(v3 + 56);
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = v5;
  *(void *)(a2 + 16) = v6;
  *(void *)(a2 + 24) = v7;
  *(unsigned char *)(a2 + 32) = *(unsigned char *)(v3 + 64);
  return sub_2180AB8B4(v4, v5);
}

uint64_t sub_2180A259C(uint64_t a1)
{
  sub_2180AE460(a1, (uint64_t)v2, &qword_267BBD678);
  swift_getKeyPath();
  sub_2180AEE98((uint64_t)v2, (void (*)(void, void, void, void, void))sub_2180AB8B4);
  sub_2180AE2AC(&qword_267BBD670, (void (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel);
  sub_2180CF600();
  sub_2180AEE98((uint64_t)v2, (void (*)(void, void, void, void, void))sub_2180AB958);
  return swift_release();
}

uint64_t sub_2180A26B4@<X0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  sub_2180AE2AC(&qword_267BBD670, (void (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel);
  sub_2180CF610();
  swift_release();
  swift_beginAccess();
  uint64_t v3 = *(void *)(v1 + 32);
  uint64_t v4 = *(void *)(v1 + 40);
  uint64_t v5 = *(void *)(v1 + 48);
  uint64_t v6 = *(void *)(v1 + 56);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(v1 + 64);
  return sub_2180AB8B4(v3, v4);
}

uint64_t sub_2180A2784(uint64_t a1)
{
  sub_2180AE460(a1, (uint64_t)v2, &qword_267BBD678);
  swift_getKeyPath();
  sub_2180AE2AC(&qword_267BBD670, (void (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel);
  sub_2180CF600();
  sub_2180AEE98((uint64_t)v2, (void (*)(void, void, void, void, void))sub_2180AB958);
  return swift_release();
}

uint64_t sub_2180A287C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + 32;
  swift_beginAccess();
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  sub_2180AE460(a2, v4, &qword_267BBD678);
  sub_2180AEE98(a2, (void (*)(void, void, void, void, void))sub_2180AB8B4);
  return sub_2180AB958(v5, v6);
}

void (*sub_2180A2934(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_getKeyPath();
  v3[5] = OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel___observationRegistrar;
  void *v3 = v1;
  v3[6] = sub_2180AE2AC(&qword_267BBD670, (void (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel);
  sub_2180CF610();
  swift_release();
  void *v3 = v1;
  swift_getKeyPath();
  sub_2180CF630();
  swift_release();
  v3[7] = sub_2180A2478();
  return sub_2180A2A50;
}

void sub_2180A2A50(void *a1)
{
}

uint64_t (*sub_2180A2A5C())()
{
  return j_j__swift_endAccess;
}

__n128 sub_2180A2AB0@<Q0>(uint64_t *a1@<X0>, __n128 *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2180AE2AC(&qword_267BBD670, (void (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel);
  sub_2180CF610();
  swift_release();
  swift_beginAccess();
  __n128 result = *(__n128 *)(v3 + 72);
  *a2 = result;
  return result;
}

uint64_t sub_2180A2B6C()
{
  return swift_release();
}

double sub_2180A2C44()
{
  swift_getKeyPath();
  sub_2180AE2AC(&qword_267BBD670, (void (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel);
  sub_2180CF610();
  swift_release();
  swift_beginAccess();
  return *(double *)(v0 + 72);
}

uint64_t sub_2180A2CF8()
{
  return swift_release();
}

uint64_t sub_2180A2DD4(uint64_t a1, double a2, double a3)
{
  uint64_t result = swift_beginAccess();
  *(double *)(a1 + 72) = a2;
  *(double *)(a1 + 80) = a3;
  return result;
}

void (*sub_2180A2E2C(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_getKeyPath();
  v3[5] = OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel___observationRegistrar;
  void *v3 = v1;
  v3[6] = sub_2180AE2AC(&qword_267BBD670, (void (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel);
  sub_2180CF610();
  swift_release();
  void *v3 = v1;
  swift_getKeyPath();
  sub_2180CF630();
  swift_release();
  v3[7] = sub_2180A2A5C();
  return sub_2180A2F48;
}

void sub_2180A2F48(void *a1)
{
}

uint64_t (*sub_2180A2F54())()
{
  return j__swift_endAccess;
}

uint64_t sub_2180A2FAC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2180AE2AC(&qword_267BBD670, (void (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel);
  sub_2180CF610();
  swift_release();
  swift_beginAccess();
  *a2 = *(void *)(v3 + 88);
  return swift_bridgeObjectRetain();
}

uint64_t sub_2180A306C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_2180A314C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2180A3204()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_2180A32D8(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 88) = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void (*sub_2180A3340(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_getKeyPath();
  v3[5] = OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel___observationRegistrar;
  void *v3 = v1;
  v3[6] = sub_2180AE2AC(&qword_267BBD670, (void (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel);
  sub_2180CF610();
  swift_release();
  void *v3 = v1;
  swift_getKeyPath();
  sub_2180CF630();
  swift_release();
  v3[7] = sub_2180A2F54();
  return sub_2180A345C;
}

void sub_2180A345C(void *a1)
{
}

void sub_2180A3468(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 56))(*a1, 0);
  *uint64_t v1 = v1[4];
  swift_getKeyPath();
  sub_2180CF620();
  swift_release();

  free(v1);
}

uint64_t sub_2180A34F4()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2180A3598@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2180AE2AC(&qword_267BBD670, (void (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel);
  sub_2180CF610();
  swift_release();
  *a2 = *(void *)(v3 + 152);
  return swift_bridgeObjectRetain();
}

uint64_t sub_2180A3644()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_2180A3724@<X0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  sub_2180AE2AC(&qword_267BBD670, (void (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel);
  sub_2180CF610();
  swift_release();
  uint64_t v3 = v1 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__showingAlert;
  swift_beginAccess();
  return sub_2180AE5F8(v3, a1);
}

uint64_t sub_2180A37F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD6F8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2180AE5F8(a2, (uint64_t)v6);
  uint64_t v7 = a1 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__showingAlert;
  swift_beginAccess();
  sub_2180AE660((uint64_t)v6, v7);
  return swift_endAccess();
}

uint64_t sub_2180A38B4()
{
  return sub_2180A3D84((uint64_t)&unk_2180D1418, &OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__showingAlertBool);
}

uint64_t sub_2180A38C8(uint64_t result, char a2)
{
  *(unsigned char *)(result + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__showingAlertBool) = a2;
  return result;
}

uint64_t sub_2180A38D8()
{
  swift_getKeyPath();
  sub_2180AE2AC(&qword_267BBD670, (void (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel);
  sub_2180CF610();
  swift_release();
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__disableGroupWithID);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2180A3994@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2180AE2AC(&qword_267BBD670, (void (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel);
  sub_2180CF610();
  swift_release();
  uint64_t v4 = *(void *)(v3 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__disableGroupWithID + 8);
  *a2 = *(void *)(v3 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__disableGroupWithID);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2180A3A4C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_2180A3B30()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2180A3BDC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2180AE2AC(&qword_267BBD670, (void (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel);
  sub_2180CF610();
  swift_release();
  *a2 = *(void *)(v3 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__allGroups);
  return swift_bridgeObjectRetain();
}

uint64_t sub_2180A3C90()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_2180A3D70()
{
  return sub_2180A3D84((uint64_t)&unk_2180D13C8, &OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__shouldValidateWithAlert);
}

uint64_t sub_2180A3D84(uint64_t a1, void *a2)
{
  swift_getKeyPath();
  sub_2180AE2AC(&qword_267BBD670, (void (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel);
  sub_2180CF610();
  swift_release();
  return *(unsigned __int8 *)(v2 + *a2);
}

uint64_t sub_2180A3E24@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2180AE2AC(&qword_267BBD670, (void (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel);
  sub_2180CF610();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__shouldValidateWithAlert);
  return result;
}

uint64_t sub_2180A3ED4()
{
  return swift_release();
}

id sub_2180A3FA4()
{
  type metadata accessor for SharingOptionsViewModel();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_267BBD658 = (uint64_t)result;
  return result;
}

uint64_t SharingOptionsObservableModel.__allocating_init(collaborationOptionsGroups:layoutMargins:userDidChangeOption:contentSizeDidChange:)(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6, double a7, double a8, double a9)
{
  uint64_t v18 = swift_allocObject();
  SharingOptionsObservableModel.init(collaborationOptionsGroups:layoutMargins:userDidChangeOption:contentSizeDidChange:)(a1, a2, a3, a4, a5, a6, a7, a8, a9);
  return v18;
}

uint64_t SharingOptionsObservableModel.init(collaborationOptionsGroups:layoutMargins:userDidChangeOption:contentSizeDidChange:)(unint64_t isUniquelyReferenced_nonNull_native, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6, double a7, double a8, double a9)
{
  uint64_t v113 = a5;
  uint64_t v112 = a4;
  uint64_t v115 = a3;
  uint64_t v114 = a2;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD680);
  MEMORY[0x270FA5388](v15 - 8);
  v111 = (char *)&v109 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(unsigned char *)(v9 + 64) = 0;
  *(_OWORD *)(v9 + 32) = 0u;
  *(_OWORD *)(v9 + 48) = 0u;
  *(_OWORD *)(v9 + 16) = 0u;
  *(void *)(v9 + 72) = 0;
  *(void *)(v9 + 80) = 0;
  *(_OWORD *)(v9 + 96) = 0u;
  *(_OWORD *)(v9 + 112) = 0u;
  *(unsigned char *)(v9 + 128) = 0;
  *(void *)(v9 + 136) = 0;
  *(void *)(v9 + 144) = 0;
  uint64_t v17 = v9 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__showingAlert;
  uint64_t v18 = type metadata accessor for AlertViewModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 1, 1, v18);
  *(unsigned char *)(v9 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__showingAlertBool) = 0;
  uint64_t v19 = (void *)(v9 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__disableGroupWithID);
  *uint64_t v19 = 0;
  v19[1] = 0;
  uint64_t v20 = (void *)(v9 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__disabledGroupText);
  void *v20 = 0;
  v20[1] = 0;
  uint64_t v110 = OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__shouldValidateWithAlert;
  *(unsigned char *)(v9 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__shouldValidateWithAlert) = 0;
  sub_2180CF640();
  *(void *)(v9 + 88) = isUniquelyReferenced_nonNull_native;
  uint64_t v118 = v9;
  id v21 = (double *)(v9 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel_layoutMargins);
  *id v21 = a6;
  v21[1] = a7;
  v21[2] = a8;
  v21[3] = a9;
  *(void *)&v124[0] = MEMORY[0x263F8EE78];
  unint64_t v117 = isUniquelyReferenced_nonNull_native >> 62;
  if (isUniquelyReferenced_nonNull_native >> 62) {
    goto LABEL_32;
  }
  uint64_t v22 = *(void *)((isUniquelyReferenced_nonNull_native & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n();
  if (!v22) {
    goto LABEL_33;
  }
LABEL_3:
  if (v22 >= 1)
  {
    uint64_t v23 = 0;
    do
    {
      if ((isUniquelyReferenced_nonNull_native & 0xC000000000000001) != 0) {
        id v24 = (id)MEMORY[0x21D460E10](v23, isUniquelyReferenced_nonNull_native);
      }
      else {
        id v24 = *(id *)(isUniquelyReferenced_nonNull_native + 8 * v23 + 32);
      }
      id v25 = v24;
      ++v23;
      id v26 = objc_msgSend(v24, sel_options);
      sub_2180AEA60(0, &qword_267BBD6B0);
      unint64_t v27 = sub_2180CFEA0();

      sub_2180A9508(v27);
    }
    while (v22 != v23);
    swift_bridgeObjectRelease();
    uint64_t v28 = *(void *)&v124[0];
    if (*(void *)&v124[0] >> 62)
    {
      while (1)
      {
        swift_bridgeObjectRetain_n();
        uint64_t v29 = sub_2180D01F0();
        swift_bridgeObjectRelease();
        uint64_t v116 = v28;
        if (!v29) {
          break;
        }
LABEL_11:
        uint64_t v30 = 0;
        uint64_t v120 = v28 + 32;
        uint64_t v31 = (void *)MEMORY[0x263F8EE80];
        unint64_t v119 = isUniquelyReferenced_nonNull_native;
        while (1)
        {
          uint64_t v32 = v30 + 1;
          if (__OFADD__(v30, 1)) {
            break;
          }
          id v33 = *(id *)(v120 + 8 * v30);
          id v34 = objc_msgSend(v33, sel_identifier);
          uint64_t v122 = sub_2180CFE50();
          uint64_t v36 = v35;

          id v37 = objc_msgSend(v33, sel_requiredOptionsIdentifiers);
          uint64_t v38 = sub_2180CFEA0();

          uint64_t v39 = sub_2180CFF90();
          uint64_t v123 = v39;
          uint64_t v40 = *(void *)(v38 + 16);
          if (v40)
          {
            uint64_t v121 = v32;
            id v41 = v33;
            uint64_t v42 = v29;
            uint64_t v43 = v31;
            uint64_t v44 = (uint64_t *)(v38 + 40);
            do
            {
              uint64_t v45 = *(v44 - 1);
              uint64_t v46 = *v44;
              swift_bridgeObjectRetain();
              sub_2180A96D4((uint64_t *)v124, v45, v46);
              swift_bridgeObjectRelease();
              v44 += 2;
              --v40;
            }
            while (v40);
            swift_bridgeObjectRelease();
            uint64_t v47 = v123;
            uint64_t v31 = v43;
            uint64_t v29 = v42;
            id v33 = v41;
            uint64_t v32 = v121;
          }
          else
          {
            uint64_t v47 = v39;
            swift_bridgeObjectRelease();
          }
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          *(void *)&v124[0] = v31;
          unint64_t v49 = sub_2180A9884(v122, v36);
          uint64_t v50 = v31[2];
          BOOL v51 = (v48 & 1) == 0;
          uint64_t v52 = v50 + v51;
          if (__OFADD__(v50, v51)) {
            goto LABEL_30;
          }
          char v53 = v48;
          if (v31[3] >= v52)
          {
            if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
              sub_2180A9CD4();
            }
          }
          else
          {
            sub_2180A98FC(v52, isUniquelyReferenced_nonNull_native);
            unint64_t v54 = sub_2180A9884(v122, v36);
            if ((v53 & 1) != (v55 & 1)) {
              goto LABEL_87;
            }
            unint64_t v49 = v54;
          }
          isUniquelyReferenced_nonNull_native = v119;
          uint64_t v31 = *(void **)&v124[0];
          if (v53)
          {
            *(void *)(*(void *)(*(void *)&v124[0] + 56) + 8 * v49) = v47;
            swift_bridgeObjectRelease();
          }
          else
          {
            *(void *)(*(void *)&v124[0] + 8 * (v49 >> 6) + 64) |= 1 << v49;
            v56 = (void *)(v31[6] + 16 * v49);
            void *v56 = v122;
            v56[1] = v36;
            *(void *)(v31[7] + 8 * v49) = v47;
            uint64_t v57 = v31[2];
            BOOL v58 = __OFADD__(v57, 1);
            uint64_t v59 = v57 + 1;
            if (v58) {
              goto LABEL_31;
            }
            v31[2] = v59;
            swift_bridgeObjectRetain();
          }

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v30 = v32;
          if (v32 == v29) {
            goto LABEL_36;
          }
        }
        __break(1u);
LABEL_30:
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        swift_bridgeObjectRetain_n();
        uint64_t v22 = sub_2180D01F0();
        if (v22) {
          goto LABEL_3;
        }
LABEL_33:
        swift_bridgeObjectRelease();
        uint64_t v28 = MEMORY[0x263F8EE78];
        if (!(MEMORY[0x263F8EE78] >> 62)) {
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      uint64_t v29 = *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      uint64_t v116 = v28;
      if (v29) {
        goto LABEL_11;
      }
    }
    uint64_t v31 = (void *)MEMORY[0x263F8EE80];
LABEL_36:
    swift_bridgeObjectRelease_n();
    *(void *)(v118 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel_optionsDependency) = v31;
    if (v117)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v60 = sub_2180D01F0();
      swift_bridgeObjectRelease();
      if (v60) {
        goto LABEL_38;
      }
    }
    else
    {
      uint64_t v60 = *(void *)((isUniquelyReferenced_nonNull_native & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v60)
      {
LABEL_38:
        uint64_t v123 = MEMORY[0x263F8EE78];
        sub_2180AA754(0, v60 & ~(v60 >> 63), 0);
        if (v60 < 0) {
          goto LABEL_86;
        }
        uint64_t v61 = 0;
        uint64_t v62 = v123;
        do
        {
          if ((isUniquelyReferenced_nonNull_native & 0xC000000000000001) != 0) {
            id v63 = (id)MEMORY[0x21D460E10](v61, isUniquelyReferenced_nonNull_native);
          }
          else {
            id v63 = *(id *)(isUniquelyReferenced_nonNull_native + 8 * v61 + 32);
          }
          sub_2180ABCD0(v63, (uint64_t *)v124);
          uint64_t v123 = v62;
          unint64_t v65 = *(void *)(v62 + 16);
          unint64_t v64 = *(void *)(v62 + 24);
          if (v65 >= v64 >> 1)
          {
            sub_2180AA754(v64 > 1, v65 + 1, 1);
            uint64_t v62 = v123;
          }
          ++v61;
          *(void *)(v62 + 16) = v65 + 1;
          v66 = (_OWORD *)(v62 + (v65 << 6));
          long long v67 = v124[0];
          long long v68 = v124[1];
          long long v69 = v125[0];
          *(_OWORD *)((char *)v66 + 73) = *(_OWORD *)((char *)v125 + 9);
          v66[3] = v68;
          v66[4] = v69;
          v66[2] = v67;
        }
        while (v60 != v61);
        swift_bridgeObjectRelease();
        goto LABEL_49;
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v62 = MEMORY[0x263F8EE78];
LABEL_49:
    *(void *)(v118 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__allGroups) = v62;
    uint64_t v70 = *(void *)(v62 + 16);
    if (!v70)
    {
      swift_bridgeObjectRetain();
LABEL_81:
      uint64_t v97 = v118;
      v98 = (uint64_t *)(v118 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel_userDidChangeOption);
      uint64_t v99 = v114;
      uint64_t v100 = v115;
      uint64_t *v98 = v114;
      v98[1] = v100;
      v101 = (uint64_t *)(v97 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel_contentSizeDidChange);
      uint64_t v102 = v112;
      uint64_t v103 = v113;
      uint64_t *v101 = v112;
      v101[1] = v103;
      sub_2180AC708(v99);
      sub_2180AC708(v102);
      v104 = sub_2180AC55C(v62, (uint64_t)v31);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(void *)(v97 + 152) = v104;
      uint64_t v105 = sub_2180CFF30();
      uint64_t v106 = (uint64_t)v111;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v105 - 8) + 56))(v111, 1, 1, v105);
      v107 = (void *)swift_allocObject();
      v107[2] = 0;
      v107[3] = 0;
      v107[4] = v97;
      swift_retain();
      sub_2180A4CF0(v106, (uint64_t)&unk_267BBD6E0, (uint64_t)v107);
      sub_2180AC8B8(v102);
      sub_2180AC8B8(v99);
      swift_release();
      return v97;
    }
    uint64_t v122 = *MEMORY[0x263EFD580];
    swift_bridgeObjectRetain_n();
    v71 = (unint64_t *)(v62 + 80);
    while (1)
    {
      uint64_t v73 = *(v71 - 6);
      uint64_t v72 = *(v71 - 5);
      uint64_t v74 = *(v71 - 3);
      uint64_t v76 = *(v71 - 1);
      unint64_t v75 = *v71;
      if (v73 == sub_2180CFE50() && v72 == v77) {
        break;
      }
      char v79 = sub_2180D0250();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v79) {
        goto LABEL_60;
      }
      v71 += 8;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (!--v70) {
        goto LABEL_80;
      }
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
LABEL_60:
    swift_bridgeObjectRelease();
    uint64_t v80 = *(void *)(v75 + 16);
    if (!v80)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_80:
      swift_bridgeObjectRelease();
      goto LABEL_81;
    }
    uint64_t v109 = v74;
    uint64_t v116 = v76;
    uint64_t v122 = *MEMORY[0x263EFD548];
    swift_bridgeObjectRetain_n();
    unint64_t v117 = v75;
    v81 = (uint64_t *)(v75 + 40);
    uint64_t v120 = v80;
    uint64_t v82 = v80;
    while (1)
    {
      uint64_t v84 = *(v81 - 1);
      uint64_t v83 = *v81;
      if (v84 == sub_2180CFE50() && v83 == v85) {
        break;
      }
      char v87 = sub_2180D0250();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v87) {
        goto LABEL_71;
      }
      v81 += 7;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (!--v82)
      {
LABEL_79:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        goto LABEL_80;
      }
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
LABEL_71:
    unint64_t v88 = v117;
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v121 = *MEMORY[0x263EFD540];
    swift_bridgeObjectRetain_n();
    uint64_t v89 = 0;
    v90 = (unsigned __int8 *)(v88 + 80);
    while (1)
    {
      uint64_t v91 = v89 + 1;
      if (__OFADD__(v89, 1)) {
        break;
      }
      uint64_t v93 = *((void *)v90 - 6);
      uint64_t v92 = *((void *)v90 - 5);
      uint64_t v122 = *((void *)v90 - 3);
      LODWORD(v119) = *v90;
      if (v93 == sub_2180CFE50() && v92 == v94)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
LABEL_83:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        *(unsigned char *)(v118 + v110) = v119 == 0;
        goto LABEL_81;
      }
      char v96 = sub_2180D0250();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v96) {
        goto LABEL_83;
      }
      v90 += 56;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      ++v89;
      if (v91 == v120) {
        goto LABEL_79;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_86:
  __break(1u);
LABEL_87:
  uint64_t result = sub_2180D0280();
  __break(1u);
  return result;
}

uint64_t sub_2180A4C38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_2180A4C58, 0, 0);
}

uint64_t sub_2180A4C58()
{
  sub_2180CF5F0();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2180A4CF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2180CFF30();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2180CFF20();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_2180AECB4(a1, &qword_267BBD680);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2180CFEE0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t SharingOptionsObservableModel.__allocating_init(collaborationOptionsGroups:userDidChangeOption:)(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  SharingOptionsObservableModel.init(collaborationOptionsGroups:userDidChangeOption:)(a1, a2, a3);
  return v6;
}

uint64_t SharingOptionsObservableModel.init(collaborationOptionsGroups:userDidChangeOption:)(unint64_t isUniquelyReferenced_nonNull_native, uint64_t a2, uint64_t a3)
{
  uint64_t v71 = a2;
  uint64_t v72 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD680);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v70 = (char *)&v69 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(unsigned char *)(v3 + 64) = 0;
  *(_OWORD *)(v3 + 32) = 0u;
  *(_OWORD *)(v3 + 48) = 0u;
  *(_OWORD *)(v3 + 16) = 0u;
  *(void *)(v3 + 72) = 0;
  *(void *)(v3 + 80) = 0;
  *(_OWORD *)(v3 + 96) = 0u;
  *(_OWORD *)(v3 + 112) = 0u;
  *(unsigned char *)(v3 + 128) = 0;
  *(void *)(v3 + 136) = 0;
  *(void *)(v3 + 144) = 0;
  uint64_t v7 = v3 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__showingAlert;
  uint64_t v8 = type metadata accessor for AlertViewModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  *(unsigned char *)(v3 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__showingAlertBool) = 0;
  uint64_t v9 = (void *)(v3 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__disableGroupWithID);
  *uint64_t v9 = 0;
  v9[1] = 0;
  v10 = (void *)(v3 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__disabledGroupText);
  void *v10 = 0;
  v10[1] = 0;
  *(unsigned char *)(v3 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__shouldValidateWithAlert) = 0;
  sub_2180CF640();
  *(void *)(v3 + 88) = isUniquelyReferenced_nonNull_native;
  uint64_t v74 = v3;
  v11 = (_OWORD *)(v3 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel_layoutMargins);
  _OWORD *v11 = 0u;
  v11[1] = 0u;
  *(void *)&v80[0] = MEMORY[0x263F8EE78];
  unint64_t v73 = isUniquelyReferenced_nonNull_native >> 62;
  if (isUniquelyReferenced_nonNull_native >> 62) {
    goto LABEL_32;
  }
  uint64_t v12 = *(void *)((isUniquelyReferenced_nonNull_native & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n();
  if (!v12) {
    goto LABEL_33;
  }
LABEL_3:
  if (v12 < 1)
  {
    __break(1u);
    goto LABEL_51;
  }
  uint64_t v13 = 0;
  do
  {
    if ((isUniquelyReferenced_nonNull_native & 0xC000000000000001) != 0) {
      id v14 = (id)MEMORY[0x21D460E10](v13, isUniquelyReferenced_nonNull_native);
    }
    else {
      id v14 = *(id *)(isUniquelyReferenced_nonNull_native + 8 * v13 + 32);
    }
    uint64_t v15 = v14;
    ++v13;
    id v16 = objc_msgSend(v14, sel_options, v69);
    sub_2180AEA60(0, &qword_267BBD6B0);
    unint64_t v17 = sub_2180CFEA0();

    sub_2180A9508(v17);
  }
  while (v12 != v13);
  swift_bridgeObjectRelease();
  uint64_t v18 = *(void *)&v80[0];
  if (*(void *)&v80[0] >> 62)
  {
    while (1)
    {
      swift_bridgeObjectRetain_n();
      uint64_t v19 = sub_2180D01F0();
      swift_bridgeObjectRelease();
      uint64_t v69 = v18;
      if (!v19) {
        break;
      }
LABEL_11:
      uint64_t v20 = 0;
      uint64_t v76 = v18 + 32;
      id v21 = (void *)MEMORY[0x263F8EE80];
      unint64_t v75 = isUniquelyReferenced_nonNull_native;
      while (1)
      {
        uint64_t v22 = v20 + 1;
        if (__OFADD__(v20, 1)) {
          break;
        }
        id v23 = *(id *)(v76 + 8 * v20);
        id v24 = objc_msgSend(v23, sel_identifier);
        uint64_t v78 = sub_2180CFE50();
        uint64_t v26 = v25;

        id v27 = objc_msgSend(v23, sel_requiredOptionsIdentifiers);
        uint64_t v28 = sub_2180CFEA0();

        uint64_t v29 = sub_2180CFF90();
        uint64_t v79 = v29;
        uint64_t v30 = *(void *)(v28 + 16);
        if (v30)
        {
          uint64_t v77 = v22;
          id v31 = v23;
          uint64_t v32 = v19;
          id v33 = (uint64_t *)(v28 + 40);
          do
          {
            uint64_t v34 = *(v33 - 1);
            uint64_t v35 = *v33;
            swift_bridgeObjectRetain();
            sub_2180A96D4((uint64_t *)v80, v34, v35);
            swift_bridgeObjectRelease();
            v33 += 2;
            --v30;
          }
          while (v30);
          swift_bridgeObjectRelease();
          uint64_t v36 = v79;
          uint64_t v19 = v32;
          id v23 = v31;
          uint64_t v22 = v77;
        }
        else
        {
          uint64_t v36 = v29;
          swift_bridgeObjectRelease();
        }
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *(void *)&v80[0] = v21;
        unint64_t v38 = sub_2180A9884(v78, v26);
        uint64_t v39 = v21[2];
        BOOL v40 = (v37 & 1) == 0;
        uint64_t v41 = v39 + v40;
        if (__OFADD__(v39, v40)) {
          goto LABEL_30;
        }
        char v42 = v37;
        if (v21[3] >= v41)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
            sub_2180A9CD4();
          }
        }
        else
        {
          sub_2180A98FC(v41, isUniquelyReferenced_nonNull_native);
          unint64_t v43 = sub_2180A9884(v78, v26);
          if ((v42 & 1) != (v44 & 1)) {
            goto LABEL_52;
          }
          unint64_t v38 = v43;
        }
        isUniquelyReferenced_nonNull_native = v75;
        id v21 = *(void **)&v80[0];
        if (v42)
        {
          *(void *)(*(void *)(*(void *)&v80[0] + 56) + 8 * v38) = v36;
          swift_bridgeObjectRelease();
        }
        else
        {
          *(void *)(*(void *)&v80[0] + 8 * (v38 >> 6) + 64) |= 1 << v38;
          uint64_t v45 = (void *)(v21[6] + 16 * v38);
          *uint64_t v45 = v78;
          v45[1] = v26;
          *(void *)(v21[7] + 8 * v38) = v36;
          uint64_t v46 = v21[2];
          BOOL v47 = __OFADD__(v46, 1);
          uint64_t v48 = v46 + 1;
          if (v47) {
            goto LABEL_31;
          }
          v21[2] = v48;
          swift_bridgeObjectRetain();
        }

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v20 = v22;
        if (v22 == v19) {
          goto LABEL_36;
        }
      }
      __break(1u);
LABEL_30:
      __break(1u);
LABEL_31:
      __break(1u);
LABEL_32:
      swift_bridgeObjectRetain_n();
      uint64_t v12 = sub_2180D01F0();
      if (v12) {
        goto LABEL_3;
      }
LABEL_33:
      swift_bridgeObjectRelease();
      uint64_t v18 = MEMORY[0x263F8EE78];
      if (!(MEMORY[0x263F8EE78] >> 62)) {
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    uint64_t v19 = *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    uint64_t v69 = v18;
    if (v19) {
      goto LABEL_11;
    }
  }
  id v21 = (void *)MEMORY[0x263F8EE80];
LABEL_36:
  swift_bridgeObjectRelease_n();
  *(void *)(v74 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel_optionsDependency) = v21;
  if (!v73)
  {
    uint64_t v49 = *(void *)((isUniquelyReferenced_nonNull_native & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v49) {
      goto LABEL_38;
    }
LABEL_48:
    swift_bridgeObjectRelease();
    uint64_t v51 = MEMORY[0x263F8EE78];
LABEL_49:
    uint64_t v59 = v74;
    *(void *)(v74 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__allGroups) = v51;
    uint64_t v60 = (uint64_t *)(v59 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel_userDidChangeOption);
    uint64_t v62 = v71;
    uint64_t v61 = v72;
    *uint64_t v60 = v71;
    v60[1] = v61;
    id v63 = (void *)(v59 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel_contentSizeDidChange);
    *id v63 = 0;
    v63[1] = 0;
    swift_bridgeObjectRetain();
    sub_2180AC708(v62);
    unint64_t v64 = sub_2180AC55C(v51, (uint64_t)v21);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(void *)(v59 + 152) = v64;
    uint64_t v65 = sub_2180CFF30();
    uint64_t v66 = (uint64_t)v70;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v65 - 8) + 56))(v70, 1, 1, v65);
    long long v67 = (void *)swift_allocObject();
    v67[2] = 0;
    v67[3] = 0;
    v67[4] = v59;
    swift_retain();
    sub_2180A4CF0(v66, (uint64_t)&unk_267BBD6F0, (uint64_t)v67);
    sub_2180AC8B8(v62);
    swift_release();
    return v59;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v49 = sub_2180D01F0();
  swift_bridgeObjectRelease();
  if (!v49) {
    goto LABEL_48;
  }
LABEL_38:
  uint64_t v79 = MEMORY[0x263F8EE78];
  sub_2180AA754(0, v49 & ~(v49 >> 63), 0);
  if ((v49 & 0x8000000000000000) == 0)
  {
    uint64_t v50 = 0;
    uint64_t v51 = v79;
    do
    {
      if ((isUniquelyReferenced_nonNull_native & 0xC000000000000001) != 0) {
        id v52 = (id)MEMORY[0x21D460E10](v50, isUniquelyReferenced_nonNull_native);
      }
      else {
        id v52 = *(id *)(isUniquelyReferenced_nonNull_native + 8 * v50 + 32);
      }
      sub_2180ABCD0(v52, (uint64_t *)v80);
      uint64_t v79 = v51;
      unint64_t v54 = *(void *)(v51 + 16);
      unint64_t v53 = *(void *)(v51 + 24);
      if (v54 >= v53 >> 1)
      {
        sub_2180AA754(v53 > 1, v54 + 1, 1);
        uint64_t v51 = v79;
      }
      ++v50;
      *(void *)(v51 + 16) = v54 + 1;
      char v55 = (_OWORD *)(v51 + (v54 << 6));
      long long v56 = v80[0];
      long long v57 = v80[1];
      long long v58 = v81[0];
      *(_OWORD *)((char *)v55 + 73) = *(_OWORD *)((char *)v81 + 9);
      v55[3] = v57;
      v55[4] = v58;
      v55[2] = v56;
    }
    while (v49 != v50);
    swift_bridgeObjectRelease();
    goto LABEL_49;
  }
LABEL_51:
  __break(1u);
LABEL_52:
  uint64_t result = sub_2180D0280();
  __break(1u);
  return result;
}

uint64_t sub_2180A568C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_2180A56AC, 0, 0);
}

uint64_t sub_2180A56AC()
{
  sub_2180CF5F0();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_2180A5748(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, unint64_t a6, uint64_t a7, uint64_t a8, void (*a9)(uint64_t, uint64_t, uint64_t, uint64_t, void, id))
{
  sub_2180AEA60(0, (unint64_t *)&qword_267BBD778);
  id v14 = (void *)sub_2180CFE90();
  id v15 = CSCKSharingSummaryStringFromOptionsGroups();

  if (v15)
  {
    sub_2180CFE50();

    if (!(a6 >> 62)) {
      goto LABEL_7;
    }
    sub_2180AEA60(0, &qword_267BBD780);
    goto LABEL_19;
  }
  unint64_t v16 = a6 >> 62;
  if (a8)
  {
    if (!v16)
    {
      swift_bridgeObjectRetain();
LABEL_7:
      swift_bridgeObjectRetain();
      sub_2180D0260();
      sub_2180AEA60(0, &qword_267BBD780);
LABEL_8:
      id v17 = objc_allocWithZone(MEMORY[0x263F17768]);
      sub_2180AEA60(0, &qword_267BBD780);
      uint64_t v18 = (void *)sub_2180CFE90();
      swift_bridgeObjectRelease();
      uint64_t v19 = (void *)sub_2180CFE10();
      swift_bridgeObjectRelease();
      id v25 = objc_msgSend(v17, sel_initWithOptionsGroups_summary_, v18, v19);

      goto LABEL_9;
    }
    sub_2180AEA60(0, &qword_267BBD780);
    swift_bridgeObjectRetain();
LABEL_19:
    swift_bridgeObjectRetain();
    sub_2180D01E0();
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  if (v16)
  {
    sub_2180AEA60(0, &qword_267BBD780);
    swift_bridgeObjectRetain();
    sub_2180D01E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_2180D0260();
    sub_2180AEA60(0, &qword_267BBD780);
  }
  id v22 = objc_allocWithZone(MEMORY[0x263F17768]);
  sub_2180AEA60(0, &qword_267BBD780);
  uint64_t v19 = (void *)sub_2180CFE90();
  swift_bridgeObjectRelease();
  id v25 = objc_msgSend(v22, sel_initWithOptionsGroups_, v19);
LABEL_9:

  uint64_t v20 = v25;
  if (a9)
  {
    id v21 = v25;
    a9(a1, a2, a3, a4, a5 & 1, v25);

    uint64_t v20 = v25;
  }
}

uint64_t SharingOptionsObservableModel.__allocating_init(collaborationShareOptions:userDidChangeOption:)(void *a1, uint64_t a2, uint64_t a3)
{
  return _s14CloudSharingUI0B22OptionsObservableModelC018collaborationShareD013layoutMargins19userDidChangeOption011contentSizelM0ACSo016_SWCollaborationhD0CSg_05SwiftC010EdgeInsetsVySS_SSSbAJtcSgySo6CGSizeVcSgtcfC_0(a1, a2, a3, 0, 0, 0.0, 0.0, 0.0, 0.0);
}

uint64_t sub_2180A5AA4()
{
  return swift_bridgeObjectRelease();
}

id sub_2180A5B8C()
{
  uint64_t v1 = sub_2180CF680();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  uint64_t v19 = v0;
  sub_2180AE2AC(&qword_267BBD670, (void (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel);
  sub_2180CF610();
  swift_release();
  swift_beginAccess();
  unint64_t v5 = *(void *)(v0 + 24);
  unint64_t v6 = 0x263F82000uLL;
  if (!v5) {
    return objc_msgSend(objc_allocWithZone(*(Class *)(v6 + 2024)), sel_init);
  }
  uint64_t v7 = *(void *)(v0 + 16);
  uint64_t v8 = self;
  swift_bridgeObjectRetain();
  uint64_t v9 = (void *)sub_2180CFE10();
  id v10 = objc_msgSend(v8, sel__applicationIconImageForBundleIdentifier_format_, v9, 1);

  if (!v10)
  {
    sub_2180CF660();
    swift_bridgeObjectRetain();
    v11 = sub_2180CF670();
    os_log_type_t v12 = sub_2180CFFA0();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      uint64_t v18 = v14;
      *(_DWORD *)uint64_t v13 = 136315138;
      v17[0] = v13 + 4;
      swift_bridgeObjectRetain();
      v17[1] = sub_2180C4A4C(v7, v5, &v18);
      sub_2180D00E0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21809D000, v11, v12, "Failed to get appIcon for %s", v13, 0xCu);
      swift_arrayDestroy();
      uint64_t v15 = v14;
      unint64_t v6 = 0x263F82000;
      MEMORY[0x21D461630](v15, -1, -1);
      MEMORY[0x21D461630](v13, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    return objc_msgSend(objc_allocWithZone(*(Class *)(v6 + 2024)), sel_init);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_2180A5E98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, long long *a8)
{
  uint64_t v9 = v8;
  uint64_t v92 = a6;
  uint64_t v91 = a4;
  uint64_t v89 = a3;
  *((void *)&v90 + 1) = a2;
  *(void *)&long long v90 = a1;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD6F8);
  MEMORY[0x270FA5388](v13 - 8);
  char v87 = &v77[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = (int *)type metadata accessor for AlertViewModelButton(0);
  uint64_t v84 = *((void *)v15 - 1);
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v18 = &v77[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v16);
  unint64_t v88 = &v77[-v19];
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD758);
  MEMORY[0x270FA5388](v20 - 8);
  id v22 = &v77[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  long long v23 = a8[1];
  long long v102 = *a8;
  long long v103 = v23;
  long long v104 = a8[2];
  char v105 = *((unsigned char *)a8 + 48);
  swift_getKeyPath();
  uint64_t v24 = v9 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel___observationRegistrar;
  *(void *)&long long v98 = v9;
  uint64_t v85 = sub_2180AE2AC(&qword_267BBD670, (void (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel);
  uint64_t v86 = v24;
  sub_2180CF610();
  swift_release();
  if (*(unsigned char *)(v9 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__shouldValidateWithAlert) != 1) {
    goto LABEL_13;
  }
  if (sub_2180CFE50() == v92 && v25 == a7)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v26 = sub_2180D0250();
    swift_bridgeObjectRelease();
    if ((v26 & 1) == 0) {
      goto LABEL_13;
    }
  }
  long long v98 = v90;
  *(void *)&long long v99 = v89;
  *((void *)&v99 + 1) = v91;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD770);
  MEMORY[0x21D4609A0](&v93, v27);
  long long v28 = v93;
  if ((void)v28 != sub_2180CFE50() || *((void *)&v28 + 1) != v29)
  {
    char v30 = sub_2180D0250();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v30) {
      goto LABEL_10;
    }
LABEL_13:
    long long v98 = v102;
    long long v99 = v103;
    long long v100 = v104;
    char v101 = v105;
    long long v93 = v90;
    uint64_t v94 = v89;
    uint64_t v95 = v91;
    sub_2180AE3EC((uint64_t)&v102);
    swift_bridgeObjectRetain();
    uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD770);
    MEMORY[0x21D4609A0](v97, v76);
    *(void *)&long long v93 = v92;
    *((void *)&v93 + 1) = a7;
    uint64_t v94 = v97[0];
    uint64_t v95 = v97[1];
    char v96 = a5 & 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD760);
    sub_2180CFCF0();
    return sub_2180AE6E0((uint64_t)&v102);
  }
  swift_bridgeObjectRelease_n();
LABEL_10:
  uint64_t v83 = v18;
  sub_2180CF980();
  if (qword_267BBD650 != -1) {
    swift_once();
  }
  id v31 = (id)qword_267BBD658;
  uint64_t v32 = sub_2180CFB10();
  uint64_t v79 = v33;
  int v78 = v34;
  uint64_t v80 = v35;
  sub_2180CF770();
  uint64_t v36 = sub_2180CF790();
  uint64_t v37 = *(void *)(v36 - 8);
  v81 = *(void (**)(unsigned char *, void, uint64_t, uint64_t))(v37 + 56);
  uint64_t v82 = v37 + 56;
  v81(v22, 0, 1, v36);
  uint64_t v38 = swift_allocObject();
  swift_weakInit();
  uint64_t v39 = swift_allocObject();
  *(void *)(v39 + 16) = v38;
  long long v40 = v103;
  *(_OWORD *)(v39 + 24) = v102;
  *(_OWORD *)(v39 + 40) = v40;
  *(_OWORD *)(v39 + 56) = v104;
  *(unsigned char *)(v39 + 72) = v105;
  *(void *)(v39 + 80) = v92;
  *(void *)(v39 + 88) = a7;
  swift_retain();
  sub_2180AE3EC((uint64_t)&v102);
  swift_bridgeObjectRetain();
  uint64_t v41 = (uint64_t)v83;
  sub_2180CF5D0();
  uint64_t v42 = v41 + v15[5];
  uint64_t v43 = v79;
  *(void *)uint64_t v42 = v32;
  *(void *)(v42 + 8) = v43;
  *(unsigned char *)(v42 + 16) = v78 & 1;
  *(void *)(v42 + 24) = v80;
  sub_2180AE460((uint64_t)v22, v41 + v15[6], &qword_267BBD758);
  swift_release();
  char v44 = (uint64_t (**)())(v41 + v15[7]);
  *char v44 = sub_2180AF6D0;
  v44[1] = (uint64_t (*)())v39;
  sub_2180CF980();
  id v45 = (id)qword_267BBD658;
  uint64_t v46 = sub_2180CFB10();
  uint64_t v48 = v47;
  LOBYTE(v38) = v49;
  uint64_t v92 = v50;
  sub_2180CF780();
  v81(v22, 0, 1, v36);
  uint64_t v51 = swift_allocObject();
  swift_weakInit();
  id v52 = (uint64_t (*)())swift_allocObject();
  *((void *)v52 + 2) = v51;
  uint64_t v53 = *((void *)&v90 + 1);
  *((void *)v52 + 3) = v90;
  *((void *)v52 + 4) = v53;
  uint64_t v54 = v91;
  *((void *)v52 + 5) = v89;
  *((void *)v52 + 6) = v54;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v55 = (uint64_t)v88;
  sub_2180CF5D0();
  uint64_t v56 = v55 + v15[5];
  *(void *)uint64_t v56 = v46;
  *(void *)(v56 + 8) = v48;
  *(unsigned char *)(v56 + 16) = v38 & 1;
  *(void *)(v56 + 24) = v92;
  sub_2180AE460((uint64_t)v22, v55 + v15[6], &qword_267BBD758);
  swift_release();
  long long v57 = (uint64_t (**)())(v55 + v15[7]);
  *long long v57 = sub_2180AE808;
  v57[1] = v52;
  uint64_t v58 = sub_2180CF510();
  uint64_t v60 = v59;
  uint64_t v61 = sub_2180CF510();
  uint64_t v63 = v62;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD768);
  uint64_t v64 = *(void *)(v84 + 72);
  unint64_t v65 = (*(unsigned __int8 *)(v84 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v84 + 80);
  uint64_t v66 = swift_allocObject();
  *(_OWORD *)(v66 + 16) = xmmword_2180D0FC0;
  uint64_t v67 = v66 + v65;
  uint64_t v68 = (uint64_t)v83;
  sub_2180AE4F4((uint64_t)v83, v67);
  sub_2180AE4F4(v55, v67 + v64);
  uint64_t v69 = (uint64_t)v87;
  sub_2180CF5D0();
  uint64_t v70 = (int *)type metadata accessor for AlertViewModel(0);
  uint64_t v71 = (uint64_t *)(v69 + v70[5]);
  uint64_t *v71 = v58;
  v71[1] = v60;
  uint64_t v72 = (uint64_t *)(v69 + v70[6]);
  *uint64_t v72 = v61;
  v72[1] = v63;
  *(void *)(v69 + v70[7]) = v66;
  (*(void (**)(uint64_t, void, uint64_t, int *))(*((void *)v70 - 1) + 56))(v69, 0, 1, v70);
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  *(void *)&long long v98 = v9;
  sub_2180CF600();
  swift_release();
  sub_2180AECB4(v69, &qword_267BBD6F8);
  uint64_t v74 = swift_getKeyPath();
  MEMORY[0x270FA5388](v74);
  *(void *)&long long v98 = v9;
  sub_2180CF600();
  swift_release();
  sub_2180AE59C(v55);
  return sub_2180AE59C(v68);
}

uint64_t sub_2180A6960()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  uint64_t result = swift_release();
  if (Strong)
  {
    sub_2180CFE50();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD770);
    return sub_2180CFCF0();
  }
  return result;
}

uint64_t sub_2180A6A08(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, long long *a6)
{
  uint64_t v7 = v6;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD6F8);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v86 = &v76[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v82 = type metadata accessor for AlertViewModelButton(0);
  uint64_t v83 = *(void *)(v82 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v82);
  uint64_t v18 = &v76[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v16);
  char v87 = &v76[-v19];
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD758);
  MEMORY[0x270FA5388](v20 - 8);
  id v22 = &v76[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  long long v23 = a6[1];
  long long v97 = *a6;
  long long v24 = a6[2];
  long long v98 = v23;
  long long v99 = v24;
  char v100 = *((unsigned char *)a6 + 48);
  swift_getKeyPath();
  uint64_t v25 = v7 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel___observationRegistrar;
  *(void *)&long long v93 = v7;
  uint64_t v84 = sub_2180AE2AC(&qword_267BBD670, (void (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel);
  uint64_t v85 = v25;
  sub_2180CF610();
  swift_release();
  if (*(unsigned char *)(v7 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__shouldValidateWithAlert) != 1) {
    goto LABEL_13;
  }
  if (sub_2180CFE50() == a4 && v26 == a5)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v27 = sub_2180D0250();
    swift_bridgeObjectRelease();
    if ((v27 & 1) == 0) {
      goto LABEL_13;
    }
  }
  if (sub_2180CFE50() != a1 || v28 != a2)
  {
    char v29 = sub_2180D0250();
    swift_bridgeObjectRelease();
    if (v29) {
      goto LABEL_10;
    }
LABEL_13:
    long long v93 = v97;
    long long v94 = v98;
    long long v95 = v99;
    char v96 = v100;
    uint64_t v88 = a4;
    uint64_t v89 = a5;
    uint64_t v90 = a1;
    uint64_t v91 = a2;
    char v92 = a3 & 1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD760);
    return sub_2180CFCF0();
  }
  swift_bridgeObjectRelease();
LABEL_10:
  sub_2180CF980();
  if (qword_267BBD650 != -1) {
    swift_once();
  }
  id v30 = (id)qword_267BBD658;
  uint64_t v31 = sub_2180CFB10();
  uint64_t v33 = v32;
  int v77 = v34;
  v81 = (unsigned char *)v35;
  sub_2180CF770();
  uint64_t v36 = sub_2180CF790();
  uint64_t v37 = *(void *)(v36 - 8);
  uint64_t v79 = *(void (**)(unsigned char *, void, uint64_t, uint64_t))(v37 + 56);
  uint64_t v80 = v37 + 56;
  v79(v22, 0, 1, v36);
  uint64_t v38 = swift_allocObject();
  swift_weakInit();
  uint64_t v39 = swift_allocObject();
  *(void *)(v39 + 16) = v38;
  *(_OWORD *)(v39 + 24) = v97;
  long long v40 = v99;
  *(_OWORD *)(v39 + 40) = v98;
  *(_OWORD *)(v39 + 56) = v40;
  *(unsigned char *)(v39 + 72) = v100;
  uint64_t v78 = a4;
  *(void *)(v39 + 80) = a4;
  *(void *)(v39 + 88) = a5;
  swift_retain();
  sub_2180AE3EC((uint64_t)&v97);
  swift_bridgeObjectRetain();
  sub_2180CF5D0();
  uint64_t v41 = (int *)v82;
  uint64_t v42 = &v18[*(int *)(v82 + 20)];
  *(void *)uint64_t v42 = v31;
  *((void *)v42 + 1) = v33;
  v42[16] = v77 & 1;
  *((void *)v42 + 3) = v81;
  sub_2180AE460((uint64_t)v22, (uint64_t)&v18[v41[6]], &qword_267BBD758);
  swift_release();
  uint64_t v43 = (uint64_t (**)())&v18[v41[7]];
  *uint64_t v43 = sub_2180AE3C0;
  v43[1] = (uint64_t (*)())v39;
  sub_2180CF980();
  v81 = v18;
  id v44 = (id)qword_267BBD658;
  uint64_t v45 = sub_2180CFB10();
  uint64_t v47 = v46;
  LOBYTE(v38) = v48;
  uint64_t v50 = v49;
  sub_2180CF780();
  v79(v22, 0, 1, v36);
  uint64_t v51 = swift_allocObject();
  swift_weakInit();
  uint64_t v52 = swift_allocObject();
  *(void *)(v52 + 16) = v51;
  *(_OWORD *)(v52 + 24) = v97;
  long long v53 = v99;
  *(_OWORD *)(v52 + 40) = v98;
  *(_OWORD *)(v52 + 56) = v53;
  *(unsigned char *)(v52 + 72) = v100;
  *(void *)(v52 + 80) = v78;
  *(void *)(v52 + 88) = a5;
  sub_2180AE3EC((uint64_t)&v97);
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v54 = v87;
  sub_2180CF5D0();
  uint64_t v55 = &v54[v41[5]];
  *(void *)uint64_t v55 = v45;
  *((void *)v55 + 1) = v47;
  v55[16] = v38 & 1;
  *((void *)v55 + 3) = v50;
  sub_2180AE460((uint64_t)v22, (uint64_t)&v54[v41[6]], &qword_267BBD758);
  swift_release();
  uint64_t v56 = (uint64_t (**)())&v54[v41[7]];
  void *v56 = sub_2180AE4C8;
  v56[1] = (uint64_t (*)())v52;
  uint64_t v57 = sub_2180CF510();
  uint64_t v59 = v58;
  uint64_t v60 = sub_2180CF510();
  uint64_t v62 = v61;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD768);
  uint64_t v63 = *(void *)(v83 + 72);
  unint64_t v64 = (*(unsigned __int8 *)(v83 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v83 + 80);
  uint64_t v65 = swift_allocObject();
  *(_OWORD *)(v65 + 16) = xmmword_2180D0FC0;
  uint64_t v66 = v65 + v64;
  uint64_t v67 = (uint64_t)v81;
  sub_2180AE4F4((uint64_t)v81, v66);
  uint64_t v68 = v87;
  sub_2180AE4F4((uint64_t)v87, v66 + v63);
  uint64_t v69 = (uint64_t)v86;
  sub_2180CF5D0();
  uint64_t v70 = (int *)type metadata accessor for AlertViewModel(0);
  uint64_t v71 = (uint64_t *)(v69 + v70[5]);
  uint64_t *v71 = v57;
  v71[1] = v59;
  uint64_t v72 = (uint64_t *)(v69 + v70[6]);
  *uint64_t v72 = v60;
  v72[1] = v62;
  *(void *)(v69 + v70[7]) = v65;
  (*(void (**)(uint64_t, void, uint64_t, int *))(*((void *)v70 - 1) + 56))(v69, 0, 1, v70);
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  *(void *)&long long v93 = v7;
  sub_2180CF600();
  swift_release();
  sub_2180AECB4(v69, &qword_267BBD6F8);
  uint64_t v74 = swift_getKeyPath();
  MEMORY[0x270FA5388](v74);
  *(void *)&long long v93 = v7;
  sub_2180CF600();
  swift_release();
  sub_2180AE59C((uint64_t)v68);
  return sub_2180AE59C(v67);
}

uint64_t sub_2180A73D4()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  uint64_t result = swift_release();
  if (Strong)
  {
    sub_2180CFE50();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD760);
    return sub_2180CFCF0();
  }
  return result;
}

uint64_t sub_2180A7498(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 16) < *(void *)(a2 + 16)) {
    return 0;
  }
  uint64_t v3 = a2;
  uint64_t v4 = a1;
  uint64_t v31 = a2 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  if (-v5 < 64) {
    uint64_t v6 = ~(-1 << -(char)v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(a2 + 56);
  int64_t v30 = (unint64_t)(63 - v5) >> 6;
  uint64_t v32 = a1 + 56;
  uint64_t result = swift_bridgeObjectRetain();
  for (int64_t i = 0; ; int64_t i = v12)
  {
    if (v7)
    {
      unint64_t v10 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v11 = v10 | (i << 6);
      int64_t v12 = i;
      if (!*(void *)(v4 + 16)) {
        goto LABEL_40;
      }
      goto LABEL_25;
    }
    int64_t v13 = i + 1;
    if (__OFADD__(i, 1))
    {
      __break(1u);
      goto LABEL_45;
    }
    if (v13 >= v30) {
      goto LABEL_41;
    }
    unint64_t v14 = *(void *)(v31 + 8 * v13);
    int64_t v12 = i + 1;
    if (!v14)
    {
      int64_t v12 = i + 2;
      if (i + 2 >= v30) {
        goto LABEL_41;
      }
      unint64_t v14 = *(void *)(v31 + 8 * v12);
      if (!v14)
      {
        int64_t v12 = i + 3;
        if (i + 3 >= v30) {
          goto LABEL_41;
        }
        unint64_t v14 = *(void *)(v31 + 8 * v12);
        if (!v14) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v11 = __clz(__rbit64(v14)) + (v12 << 6);
    if (!*(void *)(v4 + 16))
    {
LABEL_40:
      uint64_t v2 = 0;
      goto LABEL_42;
    }
LABEL_25:
    uint64_t v16 = v3;
    uint64_t v17 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v11);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_2180D02A0();
    swift_bridgeObjectRetain();
    sub_2180CFE60();
    uint64_t v20 = sub_2180D02D0();
    uint64_t v21 = v4;
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = v20 & ~v22;
    if (((*(void *)(v32 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23) & 1) == 0) {
      goto LABEL_39;
    }
    uint64_t v24 = *(void *)(v21 + 48);
    uint64_t v25 = (void *)(v24 + 16 * v23);
    BOOL v26 = *v25 == v19 && v25[1] == v18;
    if (!v26 && (sub_2180D0250() & 1) == 0)
    {
      uint64_t v27 = ~v22;
      while (1)
      {
        unint64_t v23 = (v23 + 1) & v27;
        if (((*(void *)(v32 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23) & 1) == 0) {
          break;
        }
        uint64_t v28 = (void *)(v24 + 16 * v23);
        BOOL v29 = *v28 == v19 && v28[1] == v18;
        if (v29 || (sub_2180D0250() & 1) != 0) {
          goto LABEL_7;
        }
      }
LABEL_39:
      swift_bridgeObjectRelease();
      uint64_t v2 = 0;
LABEL_42:
      sub_2180AEBA0();
      return v2;
    }
LABEL_7:
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v3 = v16;
    uint64_t v4 = v21;
  }
  int64_t v15 = i + 4;
  if (i + 4 >= v30)
  {
LABEL_41:
    uint64_t v2 = 1;
    goto LABEL_42;
  }
  unint64_t v14 = *(void *)(v31 + 8 * v15);
  if (v14)
  {
    int64_t v12 = i + 4;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v12 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v12 >= v30) {
      goto LABEL_41;
    }
    unint64_t v14 = *(void *)(v31 + 8 * v12);
    ++v15;
    if (v14) {
      goto LABEL_24;
    }
  }
LABEL_45:
  __break(1u);
  return result;
}

id sub_2180A778C(void *a1, uint64_t a2)
{
  uint64_t v20 = a1[6];
  uint64_t v4 = v20;
  sub_2180AEAF4((uint64_t)&v20);
  sub_2180D01A0();
  uint64_t v5 = *(void *)(v4 + 16);
  swift_bridgeObjectRetain();
  if (v5)
  {
    uint64_t v6 = (long long *)(v4 + 32);
    sub_2180AEA60(0, &qword_267BBD6B0);
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    do
    {
      long long v9 = *v6;
      long long v10 = v6[1];
      long long v11 = v6[2];
      __int16 v22 = *((_WORD *)v6 + 24);
      v21[1] = v10;
      v21[2] = v11;
      v21[0] = v9;
      uint64_t v12 = v8 + 1;
      if (!(_BYTE)v22) {
        uint64_t v7 = v8;
      }
      sub_2180AEBAC((uint64_t)v21);
      swift_bridgeObjectRetain();
      sub_2180A8890((uint64_t)v21, a2);
      sub_2180D0180();
      sub_2180D01B0();
      sub_2180D01C0();
      sub_2180D0190();
      uint64_t v6 = (long long *)((char *)v6 + 56);
      uint64_t v8 = v12;
    }
    while (v5 != v12);
  }
  else
  {
    uint64_t v7 = 0;
  }
  sub_2180AEB20((uint64_t)&v20);
  sub_2180AEB20((uint64_t)&v20);
  swift_bridgeObjectRelease();
  if (a1[3])
  {
    swift_bridgeObjectRetain();
    int64_t v13 = (void *)sub_2180CFE10();
    swift_bridgeObjectRelease();
  }
  else
  {
    int64_t v13 = 0;
  }
  unint64_t v14 = (void *)sub_2180CFE10();
  if (a1[5])
  {
    swift_bridgeObjectRetain();
    int64_t v15 = (void *)sub_2180CFE10();
    sub_2180AEB4C((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2180AEB4C((uint64_t)a1);
    int64_t v15 = 0;
  }
  id v16 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_2180AEA60(0, &qword_267BBD6B0);
  uint64_t v17 = (void *)sub_2180CFE90();
  swift_release();
  id v18 = objc_msgSend(v16, sel_initWithTitle_identifier_footer_options_selectedOptionIdentifierIndex_, v13, v14, v15, v17, v7);

  return v18;
}

uint64_t *SharingOptionsObservableModel.deinit()
{
  swift_bridgeObjectRelease();
  sub_2180AB958(v0[4], v0[5]);
  swift_bridgeObjectRelease();
  sub_2180AB958(v0[12], v0[13]);
  swift_bridgeObjectRelease();
  sub_2180AECB4((uint64_t)v0 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__showingAlert, &qword_267BBD6F8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2180AC8B8(*(uint64_t *)((char *)v0
                           + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel_userDidChangeOption));
  sub_2180AC8B8(*(uint64_t *)((char *)v0
                           + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel_contentSizeDidChange));
  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel___observationRegistrar;
  uint64_t v2 = sub_2180CF650();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t SharingOptionsObservableModel.__deallocating_deinit()
{
  SharingOptionsObservableModel.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_2180A7B6C()
{
  return swift_release();
}

uint64_t sub_2180A7C38()
{
  uint64_t v0 = sub_2180CFD90();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2180CFDB0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v9 = result;
    swift_getKeyPath();
    uint64_t v25 = v5;
    aBlock[0] = v9;
    sub_2180AE2AC(&qword_267BBD670, (void (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel);
    unint64_t v23 = v3;
    sub_2180CF610();
    swift_release();
    swift_beginAccess();
    uint64_t v10 = *(void *)(v9 + 32);
    uint64_t v11 = *(void *)(v9 + 40);
    uint64_t v12 = *(void *)(v9 + 48);
    uint64_t v13 = *(void *)(v9 + 56);
    uint64_t v14 = *(void *)(v9 + 96);
    uint64_t v15 = *(void *)(v9 + 104);
    uint64_t v24 = v4;
    *(void *)(v9 + 96) = v10;
    *(void *)(v9 + 104) = v11;
    *(void *)(v9 + 112) = v12;
    *(void *)(v9 + 120) = v13;
    char v16 = *(unsigned char *)(v9 + 64);
    uint64_t v22 = v1;
    *(unsigned char *)(v9 + 128) = v16;
    sub_2180AB8B4(v10, v11);
    sub_2180AB958(v14, v15);
    swift_getKeyPath();
    aBlock[0] = v9;
    sub_2180CF610();
    swift_release();
    swift_beginAccess();
    *(_OWORD *)(v9 + 136) = *(_OWORD *)(v9 + 72);
    sub_2180AEA60(0, (unint64_t *)&unk_267BBDE40);
    uint64_t v17 = (void *)sub_2180CFFE0();
    uint64_t v18 = swift_allocObject();
    swift_weakInit();
    aBlock[4] = sub_2180AE978;
    aBlock[5] = v18;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2180A884C;
    aBlock[3] = &block_descriptor;
    uint64_t v19 = _Block_copy(aBlock);
    swift_retain();
    sub_2180CFDA0();
    uint64_t v26 = MEMORY[0x263F8EE78];
    sub_2180AE2AC(&qword_267BBD788, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBDE50);
    sub_2180AEE00(&qword_267BBD790, (uint64_t *)&unk_267BBDE50);
    uint64_t v20 = v23;
    sub_2180D0110();
    MEMORY[0x21D460CB0](0, v7, v20, v19);
    _Block_release(v19);
    swift_release();

    (*(void (**)(char *, uint64_t))(v22 + 8))(v20, v0);
    (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v24);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_2180A8084()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = result;
    swift_getKeyPath();
    sub_2180AE2AC(&qword_267BBD670, (void (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel);
    sub_2180CF610();
    swift_release();
    swift_beginAccess();
    if (*(double *)(v1 + 72) != *(double *)(v1 + 136) || *(double *)(v1 + 80) != *(double *)(v1 + 144)) {
      sub_2180A834C();
    }
    uint64_t v3 = *(void *)(v1 + 104);
    if (v3)
    {
      uint64_t v4 = *(void *)(v1 + 96);
      uint64_t v6 = *(void *)(v1 + 112);
      uint64_t v5 = *(void *)(v1 + 120);
      int v12 = *(unsigned __int8 *)(v1 + 128);
      swift_getKeyPath();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_2180CF610();
      swift_release();
      swift_beginAccess();
      uint64_t v7 = *(void *)(v1 + 40);
      if (v7
        && ((uint64_t v8 = *(void *)(v1 + 48),
             uint64_t v9 = *(void *)(v1 + 56),
             int v10 = *(unsigned __int8 *)(v1 + 64),
             *(void *)(v1 + 32) == v4)
         && v7 == v3
         || (sub_2180D0250() & 1) != 0))
      {
        if (v8 == v6 && v9 == v5)
        {
          sub_2180AB958(v4, v3);
          if (((v12 ^ v10) & 1) == 0)
          {
LABEL_18:
            swift_release();
            swift_beginAccess();
            uint64_t result = swift_weakLoadStrong();
            if (result)
            {
              sub_2180CF5F0();
              return swift_release();
            }
            return result;
          }
        }
        else
        {
          char v11 = sub_2180D0250();
          sub_2180AB958(v4, v3);
          if ((v11 & 1) != 0 && ((v12 ^ v10) & 1) == 0) {
            goto LABEL_18;
          }
        }
      }
      else
      {
        sub_2180AB958(v4, v3);
      }
    }
    sub_2180A8474();
    goto LABEL_18;
  }
  return result;
}

uint64_t sub_2180A834C()
{
  swift_getKeyPath();
  sub_2180AE2AC(&qword_267BBD670, (void (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel);
  sub_2180CF610();
  swift_release();
  uint64_t result = swift_beginAccess();
  if (*(double *)(v0 + 72) != 0.0 || *(double *)(v0 + 80) != 0.0)
  {
    uint64_t v2 = *(uint64_t (**)(uint64_t, double, double))(v0
                                                           + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel_contentSizeDidChange);
    if (v2)
    {
      swift_getKeyPath();
      sub_2180CF610();
      uint64_t v3 = swift_release();
      return v2(v3, *(double *)(v0 + 72), *(double *)(v0 + 80));
    }
  }
  return result;
}

uint64_t sub_2180A8474()
{
  swift_getKeyPath();
  v16[0] = v0;
  sub_2180AE2AC(&qword_267BBD670, (void (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel);
  sub_2180CF610();
  swift_release();
  uint64_t result = swift_beginAccess();
  uint64_t v2 = *(void *)(v0 + 40);
  if (v2)
  {
    uint64_t v3 = *(void *)(v0 + 48);
    uint64_t v4 = *(void *)(v0 + 56);
    char v5 = *(unsigned char *)(v0 + 64);
    v16[0] = *(void *)(v0 + 32);
    v16[1] = v2;
    v16[2] = v3;
    v16[3] = v4;
    unsigned int v13 = v5 & 1;
    char v17 = v5 & 1;
    swift_getKeyPath();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2180CF610();
    swift_release();
    uint64_t v15 = v16[0];
    uint64_t v14 = v3;
    sub_2180AB8B4(v16[0], v2);
    uint64_t v6 = swift_bridgeObjectRetain();
    uint64_t v7 = sub_2180ACB48(v6, v16);
    sub_2180AB958(v15, v2);
    swift_bridgeObjectRelease();
    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath);
    swift_bridgeObjectRetain();
    sub_2180CF600();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v9 = *(void *)(v0 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel_optionsDependency);
    sub_2180AC55C(v7, v9);
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_2180ACF3C(v7, v9);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v11 = swift_getKeyPath();
    MEMORY[0x270FA5388](v11);
    sub_2180CF600();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v12 = swift_getKeyPath();
    MEMORY[0x270FA5388](v12);
    swift_bridgeObjectRetain();
    sub_2180CF600();
    swift_release();
    swift_bridgeObjectRelease();
    if (*(void *)(v0 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel_userDidChangeOption)) {
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t))(v0
    }
                                                                                  + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel_userDidChangeOption))(v15, v2, v14, v4, v13, v10);
    swift_bridgeObjectRelease();
    return sub_2180AB958(v15, v2);
  }
  return result;
}

uint64_t sub_2180A884C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

id sub_2180A8890(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  if (*(void *)(a2 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v6 = sub_2180A9884(v4, v5);
    if (v7)
    {
      uint64_t v8 = *(void *)(*(void *)(a2 + 56) + 8 * v6);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*(void *)(v8 + 16)) {
        sub_2180AAA7C(v8);
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v9 = (void *)sub_2180CFE10();
  uint64_t v10 = (void *)sub_2180CFE10();
  if (*(void *)(a1 + 40))
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = (void *)sub_2180CFE10();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v11 = 0;
  }
  sub_2180AEBF8(a1);
  id v12 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  BOOL v13 = *(unsigned char *)(a1 + 48) == 0;
  uint64_t v14 = (void *)sub_2180CFE90();
  swift_bridgeObjectRelease();
  id v15 = objc_msgSend(v12, sel_initWithTitle_identifier_subtitle_selected_requiredOptionsIdentifiers_, v9, v10, v11, v13, v14);

  return v15;
}

uint64_t sub_2180A8A24(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v2)
  {
    uint64_t v3 = a2;
    if (a1 != a2)
    {
      uint64_t v4 = 0;
      uint64_t v15 = a1;
      while (1)
      {
        uint64_t v5 = *(void *)(a1 + v4 + 48);
        uint64_t v6 = *(void *)(a1 + v4 + 56);
        uint64_t v7 = *(void *)(a1 + v4 + 64);
        uint64_t v8 = *(void *)(a1 + v4 + 72);
        uint64_t v9 = *(void *)(v3 + v4 + 48);
        uint64_t v10 = *(void *)(v3 + v4 + 56);
        uint64_t v12 = *(void *)(v3 + v4 + 64);
        uint64_t v11 = *(void *)(v3 + v4 + 72);
        int v19 = *(unsigned __int8 *)(v3 + v4 + 80);
        int v20 = *(unsigned __int8 *)(a1 + v4 + 80);
        int v17 = *(unsigned __int8 *)(v3 + v4 + 81);
        int v18 = *(unsigned __int8 *)(a1 + v4 + 81);
        if ((*(void *)(a1 + v4 + 32) != *(void *)(v3 + v4 + 32)
           || *(void *)(a1 + v4 + 40) != *(void *)(v3 + v4 + 40))
          && (sub_2180D0250() & 1) == 0
          || (v5 != v9 || v6 != v10) && (sub_2180D0250() & 1) == 0)
        {
          return 0;
        }
        if (!v8) {
          break;
        }
        if (!v11) {
          return 0;
        }
        if (v7 == v12 && v8 == v11) {
          goto LABEL_18;
        }
        char v13 = sub_2180D0250();
        uint64_t result = 0;
        if ((v13 & 1) == 0) {
          return result;
        }
LABEL_19:
        if (v20 != v19 || ((v18 ^ v17) & 1) != 0) {
          return result;
        }
        v4 += 56;
        --v2;
        a1 = v15;
        uint64_t v3 = a2;
        if (!v2) {
          return 1;
        }
      }
      if (v11) {
        return 0;
      }
LABEL_18:
      uint64_t result = 0;
      goto LABEL_19;
    }
  }
  return 1;
}

uint64_t sub_2180A8B8C()
{
  return MEMORY[0x270EF1C48](*v0);
}

uint64_t sub_2180A8B94(uint64_t a1, uint64_t a2)
{
  int v6 = 0;
  char v7 = 1;
  uint64_t result = MEMORY[0x21D460C10](a1, &v6);
  char v4 = v7;
  int v5 = v6;
  if (v7) {
    int v5 = 0;
  }
  *(_DWORD *)a2 = v5;
  *(unsigned char *)(a2 + 4) = v4;
  return result;
}

uint64_t sub_2180A8BE8(uint64_t a1, uint64_t a2)
{
  int v7 = 0;
  char v8 = 1;
  char v3 = MEMORY[0x21D460C20](a1, &v7);
  char v4 = v8;
  int v5 = v7;
  if (v8) {
    int v5 = 0;
  }
  *(_DWORD *)a2 = v5;
  *(unsigned char *)(a2 + 4) = v4;
  return v3 & 1;
}

void sub_2180A8C40(float *a1@<X8>)
{
  *a1 = MEMORY[0x21D460C30]();
}

uint64_t sub_2180A8C68(uint64_t a1, uint64_t a2)
{
  return sub_2180A8DD4(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_2180A8C80(uint64_t a1, id *a2)
{
  uint64_t result = sub_2180CFE30();
  *a2 = 0;
  return result;
}

uint64_t sub_2180A8CF8(uint64_t a1, id *a2)
{
  char v3 = sub_2180CFE40();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_2180A8D78@<X0>(uint64_t *a1@<X8>)
{
  sub_2180CFE50();
  uint64_t v2 = sub_2180CFE10();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2180A8DBC(uint64_t a1, uint64_t a2)
{
  return sub_2180A8DD4(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_2180A8DD4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_2180CFE50();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_2180A8E18()
{
  sub_2180CFE50();
  sub_2180CFE60();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2180A8E6C()
{
  sub_2180CFE50();
  sub_2180D02A0();
  sub_2180CFE60();
  uint64_t v0 = sub_2180D02D0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_2180A8EE0()
{
  uint64_t v0 = sub_2180CFE50();
  uint64_t v2 = v1;
  if (v0 == sub_2180CFE50() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_2180D0250();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

_DWORD *sub_2180A8F6C@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

float sub_2180A8F7C@<S0>(_DWORD *a1@<X8>)
{
  float result = *v1;
  *a1 = *(_DWORD *)v1;
  return result;
}

uint64_t sub_2180A8F88()
{
  return sub_2180D0240();
}

uint64_t sub_2180A9044@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_2180CFE10();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2180A908C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2180CFE50();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2180A90B8()
{
  sub_2180AE2AC(&qword_267BBD748, type metadata accessor for URLResourceKey);
  sub_2180AE2AC(&qword_267BBD750, type metadata accessor for URLResourceKey);

  return sub_2180D0240();
}

uint64_t sub_2180A9174()
{
  return MEMORY[0x270F9DE70](*v0);
}

uint64_t sub_2180A917C()
{
  return sub_2180D02C0();
}

void sub_2180A91B0()
{
}

BOOL sub_2180A91C4(float *a1, float *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2180A91D8(uint64_t a1, int *a2)
{
  int v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_2180A92B4;
  return v6(a1);
}

uint64_t sub_2180A92B4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2180A93AC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = sub_2180C4704(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = (unint64_t)&v3[7 * v8 + 4];
  if (a1 + 32 < v9 + 56 * v2 && v9 < a1 + 32 + 56 * v2) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = v3[2];
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_2180D0230();
  __break(1u);
  return result;
}

uint64_t sub_2180A9508(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_2180D01F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_2180D01F0();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x21D460E20](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *uint64_t v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_2180AAB64(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_2180D01F0();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();

  return sub_2180CFEB0();
}

uint64_t sub_2180A96D4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_2180D02A0();
  swift_bridgeObjectRetain();
  sub_2180CFE60();
  uint64_t v8 = sub_2180D02D0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_2180D0250() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
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
      int v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_2180D0250() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_2180AA154(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

unint64_t sub_2180A9884(uint64_t a1, uint64_t a2)
{
  sub_2180D02A0();
  sub_2180CFE60();
  uint64_t v4 = sub_2180D02D0();

  return sub_2180A9BF0(a1, a2, v4);
}

uint64_t sub_2180A98FC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD7B0);
  char v37 = a2;
  uint64_t v6 = sub_2180D0210();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_38;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v2;
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_21;
    }
    if (__OFADD__(v14++, 1)) {
      goto LABEL_40;
    }
    if (v14 >= v11) {
      break;
    }
    unint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v14);
    if (!v24)
    {
      int64_t v25 = v14 + 1;
      if (v14 + 1 >= v11)
      {
LABEL_31:
        swift_release();
        uint64_t v3 = v35;
        if ((v37 & 1) == 0) {
          goto LABEL_38;
        }
        goto LABEL_34;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v25);
      if (!v24)
      {
        while (1)
        {
          int64_t v14 = v25 + 1;
          if (__OFADD__(v25, 1)) {
            break;
          }
          if (v14 >= v11) {
            goto LABEL_31;
          }
          unint64_t v24 = *(void *)(v36 + 8 * v14);
          ++v25;
          if (v24) {
            goto LABEL_20;
          }
        }
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        return result;
      }
      ++v14;
    }
LABEL_20:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_21:
    uint64_t v26 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v28 = *v26;
    uint64_t v27 = v26[1];
    uint64_t v29 = *(void *)(*(void *)(v5 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_2180D02A0();
    sub_2180CFE60();
    uint64_t result = sub_2180D02D0();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v30 = 0;
      unint64_t v31 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v31 && (v30 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v32 = v17 == v31;
        if (v17 == v31) {
          unint64_t v17 = 0;
        }
        v30 |= v32;
        uint64_t v33 = *(void *)(v12 + 8 * v17);
      }
      while (v33 == -1);
      unint64_t v18 = __clz(__rbit64(~v33)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    BOOL v19 = (void *)(*(void *)(v7 + 48) + 16 * v18);
    *BOOL v19 = v28;
    v19[1] = v27;
    *(void *)(*(void *)(v7 + 56) + 8 * v18) = v29;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  unint64_t v23 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_38;
  }
LABEL_34:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v23 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_38:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

unint64_t sub_2180A9BF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2180D0250() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        BOOL v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_2180D0250() & 1) == 0);
    }
  }
  return v6;
}

void *sub_2180A9CD4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD7B0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2180D0200();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_24:
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
    if (__OFADD__(v9++, 1)) {
      goto LABEL_26;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    if (!v23) {
      break;
    }
LABEL_23:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v9 + 1;
  if (v9 + 1 >= v13) {
    goto LABEL_24;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_23;
    }
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_2180A9E74()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD7D0);
  uint64_t v3 = sub_2180D0130();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    char v30 = (void *)(v2 + 56);
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
                  *char v30 = -1 << v29;
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
      uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_2180D02A0();
      sub_2180CFE60();
      uint64_t result = sub_2180D02D0();
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
      int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *int64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_2180AA154(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_2180A9E74();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_2180AA2F0();
      goto LABEL_22;
    }
    sub_2180AA4A4();
  }
  uint64_t v11 = *v4;
  sub_2180D02A0();
  sub_2180CFE60();
  uint64_t result = sub_2180D02D0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_2180D0250(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_2180D0270();
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
          uint64_t result = sub_2180D0250();
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

void *sub_2180AA2F0()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD7D0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2180D0120();
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
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v19 = *v17;
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

uint64_t sub_2180AA4A4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD7D0);
  uint64_t v3 = sub_2180D0130();
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
    uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_2180D02A0();
    swift_bridgeObjectRetain();
    sub_2180CFE60();
    uint64_t result = sub_2180D02D0();
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
    *int64_t v13 = v20;
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

uint64_t sub_2180AA754(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2180AA794(a1, a2, a3, *v3);
  uint64_t *v3 = (char *)result;
  return result;
}

uint64_t sub_2180AA774(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2180AA8FC(a1, a2, a3, *v3);
  uint64_t *v3 = (char *)result;
  return result;
}

uint64_t sub_2180AA794(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBDEB0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 + 31;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 6);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  int64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  size_t v15 = v8 << 6;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[v15]) {
      memmove(v13, v14, v15);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[v15] || v13 >= &v14[v15])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_2180D0230();
  __break(1u);
  return result;
}

uint64_t sub_2180AA8FC(char a1, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD7A8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 56);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  int64_t v13 = a4 + 32;
  size_t v14 = 56 * v8;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v14]) {
      memmove(v12, v13, v14);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_2180D0230();
  __break(1u);
  return result;
}

void *sub_2180AAA7C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD7A0);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_2180AAED0((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_2180AEBA0();
  if (v6 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t sub_2180AAB64(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_2180D01F0();
    swift_bridgeObjectRelease();
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
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_2180D01F0();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_2180AEE00(&qword_267BBD7E0, &qword_267BBD7D8);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD7D8);
          uint64_t v12 = sub_2180AAD98(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_2180AEA60(0, &qword_267BBD6B0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_2180D0230();
  __break(1u);
  return result;
}

void (*sub_2180AAD98(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_2180AAE48(v6, a2, a3);
  return sub_2180AAE00;
}

void sub_2180AAE00(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_2180AAE48(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x21D460E10](a2, a3);
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
    return sub_2180AAEC8;
  }
  __break(1u);
  return result;
}

void sub_2180AAEC8(id *a1)
{
}

uint64_t sub_2180AAED0(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 56;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    _OWORD v5[2] = ~v7;
    _OWORD v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  size_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    void *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_2180AB0D0(uint64_t a1, uint64_t a2)
{
  BOOL v4 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (v4 || (v5 = sub_2180D0250(), char v6 = 0, (v5 & 1) != 0))
  {
    BOOL v7 = *(void *)(a1 + 16) == *(void *)(a2 + 16) && *(void *)(a1 + 24) == *(void *)(a2 + 24);
    if (v7 || (v8 = sub_2180D0250(), char v6 = 0, (v8 & 1) != 0))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a2 + 40);
      if (v9)
      {
        if (!v10) {
          goto LABEL_20;
        }
        if (*(void *)(a1 + 32) != *(void *)(a2 + 32) || v9 != v10)
        {
          char v11 = sub_2180D0250();
          char v6 = 0;
          if ((v11 & 1) == 0) {
            return v6 & 1;
          }
        }
      }
      else if (v10)
      {
        goto LABEL_20;
      }
      if (*(unsigned __int8 *)(a1 + 48) == *(unsigned __int8 *)(a2 + 48))
      {
        char v6 = ((*(unsigned char *)(a1 + 49) & 1) == 0) ^ *(unsigned char *)(a2 + 49);
        return v6 & 1;
      }
LABEL_20:
      char v6 = 0;
    }
  }
  return v6 & 1;
}

uint64_t sub_2180AB1B0(void *a1)
{
  uint64_t v2 = sub_2180CF680();
  uint64_t v51 = *(void *)(v2 - 8);
  uint64_t v3 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  char v5 = (char *)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  BOOL v7 = (char *)&v49 - v6;
  id v8 = objc_msgSend(a1, sel_identifier);
  uint64_t v9 = sub_2180CFE50();
  uint64_t v11 = v10;

  if (v9 == sub_2180CFE50() && v11 == v12) {
    goto LABEL_8;
  }
  char v14 = sub_2180D0250();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v14 & 1) == 0)
  {
    id v15 = objc_msgSend(a1, sel_identifier);
    uint64_t v16 = sub_2180CFE50();
    uint64_t v18 = v17;

    if (v16 == sub_2180CFE50() && v18 == v19)
    {
LABEL_8:
      swift_bridgeObjectRelease_n();
      goto LABEL_9;
    }
    char v40 = sub_2180D0250();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v40 & 1) == 0) {
      goto LABEL_27;
    }
  }
LABEL_9:
  id v20 = objc_msgSend(a1, sel_selectedOptionIdentifier);
  uint64_t v21 = sub_2180CFE50();
  uint64_t v23 = v22;

  uint64_t v24 = *MEMORY[0x263EFD570];
  if (sub_2180CFE50() != v21 || v25 != v23)
  {
    unint64_t v26 = v7;
    char v27 = sub_2180D0250();
    swift_bridgeObjectRelease();
    if (v27) {
      goto LABEL_13;
    }
    uint64_t v38 = *MEMORY[0x263EFD558];
    if (sub_2180CFE50() == v21 && v39 == v23)
    {
      swift_bridgeObjectRelease_n();
LABEL_25:
      sub_2180CF660();
      uint64_t v42 = a1;
      uint64_t v43 = sub_2180CF670();
      os_log_type_t v44 = sub_2180CFFC0();
      if (os_log_type_enabled(v43, v44))
      {
        uint64_t v45 = (uint8_t *)swift_slowAlloc();
        uint64_t v49 = (void *)swift_slowAlloc();
        uint64_t v50 = v38;
        *(_DWORD *)uint64_t v45 = 138412290;
        uint64_t v52 = v42;
        uint64_t v46 = v42;
        sub_2180D00E0();
        uint64_t v47 = v49;
        *uint64_t v49 = v42;

        _os_log_impl(&dword_21809D000, v43, v44, "SharingOptionsObservableModel converted mixed allow others to invite to on: %@", v45, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD7C8);
        swift_arrayDestroy();
        MEMORY[0x21D461630](v47, -1, -1);
        MEMORY[0x21D461630](v45, -1, -1);
      }
      else
      {

        uint64_t v43 = v42;
      }

      (*(void (**)(char *, uint64_t))(v51 + 8))(v5, v2);
      uint64_t v36 = sub_2180CFE50();
      goto LABEL_17;
    }
    char v41 = sub_2180D0250();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v41) {
      goto LABEL_25;
    }
LABEL_27:
    id v48 = objc_msgSend(a1, sel_selectedOptionIdentifier);
    uint64_t v36 = sub_2180CFE50();

    return v36;
  }
  unint64_t v26 = v7;
  swift_bridgeObjectRelease();
LABEL_13:
  swift_bridgeObjectRelease();
  sub_2180CF660();
  uint64_t v28 = a1;
  int64_t v29 = sub_2180CF670();
  os_log_type_t v30 = sub_2180CFFC0();
  BOOL v31 = os_log_type_enabled(v29, v30);
  uint64_t v50 = v24;
  if (v31)
  {
    BOOL v32 = (uint8_t *)swift_slowAlloc();
    uint64_t v33 = (void *)swift_slowAlloc();
    uint64_t v49 = v26;
    *(_DWORD *)BOOL v32 = 138412290;
    uint64_t v52 = v28;
    uint64_t v34 = v28;
    unint64_t v26 = v49;
    sub_2180D00E0();
    *uint64_t v33 = v28;

    _os_log_impl(&dword_21809D000, v29, v30, "SharingOptionsObservableModel converted mixed permission to read-only: %@", v32, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD7C8);
    swift_arrayDestroy();
    MEMORY[0x21D461630](v33, -1, -1);
    MEMORY[0x21D461630](v32, -1, -1);
  }
  else
  {

    int64_t v29 = v28;
  }
  uint64_t v35 = v51;

  (*(void (**)(void *, uint64_t))(v35 + 8))(v26, v2);
  uint64_t v36 = sub_2180CFE50();
LABEL_17:
  sub_2180CFE50();
  return v36;
}

uint64_t _s14CloudSharingUI0B22OptionsObservableModelC10UserActionV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  int v4 = *(unsigned __int8 *)(a1 + 32);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  int v7 = *(unsigned __int8 *)(a2 + 32);
  BOOL v8 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (v8 || (char v9 = sub_2180D0250(), result = 0, (v9 & 1) != 0))
  {
    if (v2 == v5 && v3 == v6) {
      return v4 ^ v7 ^ 1u;
    }
    char v12 = sub_2180D0250();
    uint64_t result = 0;
    if (v12) {
      return v4 ^ v7 ^ 1u;
    }
  }
  return result;
}

uint64_t type metadata accessor for SharingOptionsObservableModel()
{
  uint64_t result = qword_267BBD700;
  if (!qword_267BBD700) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2180AB894()
{
  return sub_2180A22E4(v0[2], v0[3], v0[4]);
}

uint64_t sub_2180AB8B4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
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

uint64_t sub_2180AB93C()
{
  return sub_2180A287C(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_2180AB958(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2180AB99C()
{
  return sub_2180AEE44();
}

uint64_t sub_2180AB9B4()
{
  return sub_2180A32D8(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_2180AB9D0(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 != *(void *)a2 || *(void *)(a1 + 8) != *(void *)(a2 + 8))
  {
    char v5 = sub_2180D0250();
    char v6 = 0;
    if ((v5 & 1) == 0) {
      return v6 & 1;
    }
  }
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a2 + 24);
  if (!v7)
  {
    if (v8) {
      goto LABEL_24;
    }
    goto LABEL_15;
  }
  if (!v8) {
    goto LABEL_24;
  }
  BOOL v9 = *(void *)(a1 + 16) == *(void *)(a2 + 16) && v7 == v8;
  if (v9 || (v10 = sub_2180D0250(), char v6 = 0, (v10 & 1) != 0))
  {
LABEL_15:
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(a2 + 40);
    if (v11)
    {
      if (!v12) {
        goto LABEL_24;
      }
      if (*(void *)(a1 + 32) != *(void *)(a2 + 32) || v11 != v12)
      {
        char v13 = sub_2180D0250();
        char v6 = 0;
        if ((v13 & 1) == 0) {
          return v6 & 1;
        }
      }
    }
    else if (v12)
    {
      goto LABEL_24;
    }
    if (sub_2180A8A24(*(void *)(a1 + 48), *(void *)(a2 + 48)))
    {
      char v6 = *(unsigned char *)(a1 + 56) ^ *(unsigned char *)(a2 + 56) ^ 1;
      return v6 & 1;
    }
LABEL_24:
    char v6 = 0;
  }
  return v6 & 1;
}

void *sub_2180ABAC4(unint64_t a1, unsigned char *a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  unint64_t v6 = a1;
  if (a1 >> 62) {
    goto LABEL_19;
  }
  uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v7; uint64_t v7 = sub_2180D01F0())
  {
    unint64_t v25 = v6 & 0xC000000000000001;
    uint64_t v8 = (void *)MEMORY[0x263F8EE78];
    uint64_t v9 = 4;
    uint64_t v23 = v7;
    unint64_t v24 = v6;
    while (1)
    {
      id v11 = v25 ? (id)MEMORY[0x21D460E10](v9 - 4, v6) : *(id *)(v6 + 8 * v9);
      uint64_t v12 = v11;
      uint64_t v13 = v9 - 3;
      if (__OFADD__(v9 - 4, 1)) {
        break;
      }
      id v38 = v11;
      sub_2180A1B9C(&v38, a2, a3, a4, a5, (uint64_t)&v32);
      if (v5)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        return v8;
      }

      uint64_t v14 = v33;
      if (v33)
      {
        uint64_t v15 = v32;
        uint64_t v16 = v34;
        long long v31 = v36;
        __int16 v17 = v37;
        uint64_t v30 = v35;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v8 = sub_2180C4704(0, v8[2] + 1, 1, v8);
        }
        uint64_t v18 = v8;
        unint64_t v19 = v8[2];
        id v20 = v18;
        unint64_t v21 = v18[3];
        if (v19 >= v21 >> 1) {
          id v20 = sub_2180C4704((void *)(v21 > 1), v19 + 1, 1, v20);
        }
        v20[2] = v19 + 1;
        char v10 = &v20[7 * v19];
        uint64_t v8 = v20;
        v10[4] = v15;
        v10[5] = v14;
        v10[6] = v16;
        v10[7] = v30;
        *((_OWORD *)v10 + 4) = v31;
        *((unsigned char *)v10 + 80) = v17;
        *((unsigned char *)v10 + 81) = HIBYTE(v17) & 1;
        uint64_t v7 = v23;
        unint64_t v6 = v24;
      }
      ++v9;
      if (v13 == v7)
      {
        swift_bridgeObjectRelease();
        return v8;
      }
    }
    __break(1u);
LABEL_19:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return (void *)MEMORY[0x263F8EE78];
}

uint64_t sub_2180ABCD0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_2180CF680();
  uint64_t v5 = *(void **)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2180CF660();
  uint64_t v8 = a1;
  uint64_t v9 = sub_2180CF670();
  os_log_type_t v10 = sub_2180CFFC0();
  BOOL v11 = os_log_type_enabled(v9, v10);
  uint64_t v51 = a2;
  if (v11)
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v50 = v5;
    uint64_t v13 = (uint8_t *)v12;
    uint64_t v49 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 138412290;
    uint64_t v52 = v8;
    uint64_t v14 = v8;
    sub_2180D00E0();
    uint64_t v15 = v49;
    *uint64_t v49 = v8;

    _os_log_impl(&dword_21809D000, v9, v10, "SharingOptionsObservableModel init options: %@", v13, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD7C8);
    swift_arrayDestroy();
    MEMORY[0x21D461630](v15, -1, -1);
    uint64_t v16 = v13;
    uint64_t v5 = v50;
    MEMORY[0x21D461630](v16, -1, -1);
  }
  else
  {

    uint64_t v9 = v8;
  }

  ((void (*)(char *, uint64_t))v5[1])(v7, v4);
  uint64_t v52 = 0;
  long long v53 = 0;
  self;
  __int16 v17 = (void *)swift_dynamicCastObjCClass();
  BOOL v18 = v17 == 0;
  if (v17)
  {
    unint64_t v19 = v8;
    uint64_t v20 = sub_2180AB1B0(v17);
    uint64_t v22 = v21;
    uint64_t v24 = v23;
    __int16 v17 = v25;

    char v26 = 0;
    uint64_t v52 = v24;
    long long v53 = v17;
  }
  else
  {
    uint64_t v20 = 0;
    uint64_t v22 = 0;
    uint64_t v24 = 0;
    char v26 = 1;
  }
  char v54 = v26;
  id v27 = [v8 options];
  sub_2180AEA60(0, &qword_267BBD6B0);
  unint64_t v28 = sub_2180CFEA0();

  swift_bridgeObjectRetain();
  uint64_t v50 = sub_2180ABAC4(v28, &v54, v20, v22, (uint64_t *)&v52);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  uint64_t v29 = sub_2180CFE50();
  if (v17)
  {
    if (v24 == v29 && v17 == v30)
    {
      swift_bridgeObjectRelease();
LABEL_13:
      BOOL v18 = 1;
      goto LABEL_14;
    }
    char v31 = sub_2180D0250();
    swift_bridgeObjectRelease();
    if (v31) {
      goto LABEL_13;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
LABEL_14:
  id v32 = [v8 identifier];
  uint64_t v33 = sub_2180CFE50();
  uint64_t v35 = v34;

  id v36 = [v8 title];
  uint64_t v37 = sub_2180CFE50();
  BOOL v38 = v18;
  uint64_t v40 = v39;

  id v41 = [v8 footer];
  uint64_t v42 = sub_2180CFE50();
  uint64_t v44 = v43;

  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v47 = v50;
  uint64_t v46 = v51;
  *uint64_t v51 = v33;
  v46[1] = v35;
  v46[2] = v37;
  v46[3] = v40;
  v46[4] = v42;
  v46[5] = v44;
  v46[6] = (uint64_t)v47;
  *((unsigned char *)v46 + 56) = v38;
  return result;
}

void *sub_2180AC0E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v32 = *(void *)(a1 + 16);
  if (!v32) {
    return (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v31 = a1 + 32;
  swift_bridgeObjectRetain();
  uint64_t v4 = 0;
  uint64_t v5 = (void *)MEMORY[0x263F8EE78];
  uint64_t v44 = a2;
  do
  {
    uint64_t v39 = v5;
    uint64_t v6 = (uint64_t *)(v31 + (v4 << 6));
    uint64_t v34 = v6[2];
    uint64_t v35 = *v6;
    uint64_t v7 = v6[6];
    int v36 = *((unsigned __int8 *)v6 + 56);
    uint64_t v8 = *(void *)(v7 + 16);
    uint64_t v37 = v6[1];
    uint64_t v38 = v6[5];
    long long v40 = *(_OWORD *)(v6 + 3);
    if (v8)
    {
      uint64_t v33 = v4;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v9 = 0;
      os_log_type_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v43 = v7;
      while (1)
      {
        uint64_t v11 = v7 + v9;
        uint64_t v13 = *(void *)(v7 + v9 + 32);
        uint64_t v12 = *(void *)(v11 + 40);
        uint64_t v14 = *(void *)(v11 + 56);
        uint64_t v48 = *(void *)(v11 + 48);
        uint64_t v15 = *(void *)(v11 + 72);
        uint64_t v47 = *(void *)(v11 + 64);
        char v45 = *(unsigned char *)(v11 + 81);
        char v46 = *(unsigned char *)(v11 + 80);
        uint64_t v16 = *(void *)(a2 + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (!v16) {
          break;
        }
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        unint64_t v17 = sub_2180A9884(v13, v12);
        if ((v18 & 1) == 0
          || (uint64_t v19 = *(void *)(*(void *)(a2 + 56) + 8 * v17),
              swift_bridgeObjectRetain(),
              swift_bridgeObjectRelease(),
              !*(void *)(v19 + 16)))
        {
          swift_bridgeObjectRelease();
          goto LABEL_16;
        }
        char v42 = sub_2180A7498(a3, v19);
        swift_bridgeObjectRelease();
        a2 = v44;
        if (v42) {
          goto LABEL_16;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_8:
        uint64_t v7 = v43;
        v9 += 56;
        if (!--v8)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          uint64_t v4 = v33;
          goto LABEL_23;
        }
      }
      swift_bridgeObjectRetain();
LABEL_16:
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        os_log_type_t v10 = sub_2180C4704(0, v10[2] + 1, 1, v10);
      }
      unint64_t v21 = v10[2];
      unint64_t v20 = v10[3];
      if (v21 >= v20 >> 1) {
        os_log_type_t v10 = sub_2180C4704((void *)(v20 > 1), v21 + 1, 1, v10);
      }
      v10[2] = v21 + 1;
      uint64_t v22 = &v10[7 * v21];
      v22[4] = v13;
      v22[5] = v12;
      v22[6] = v48;
      v22[7] = v14;
      v22[8] = v47;
      v22[9] = v15;
      *((unsigned char *)v22 + 80) = v46;
      *((unsigned char *)v22 + 81) = v45;
      a2 = v44;
      goto LABEL_8;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    os_log_type_t v10 = (void *)MEMORY[0x263F8EE78];
LABEL_23:
    if (v36) {
      unint64_t v23 = 1;
    }
    else {
      unint64_t v23 = 2;
    }
    unint64_t v24 = v10[2];
    swift_bridgeObjectRelease();
    uint64_t v5 = v39;
    if (v24 < v23)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v5 = sub_2180C482C(0, v39[2] + 1, 1, v39);
      }
      unint64_t v26 = v5[2];
      unint64_t v25 = v5[3];
      long long v27 = v40;
      if (v26 >= v25 >> 1)
      {
        uint64_t v29 = sub_2180C482C((void *)(v25 > 1), v26 + 1, 1, v5);
        long long v27 = v40;
        uint64_t v5 = v29;
      }
      _OWORD v5[2] = v26 + 1;
      unint64_t v28 = &v5[8 * v26];
      v28[4] = v35;
      v28[5] = v37;
      v28[6] = v34;
      *(_OWORD *)(v28 + 7) = v27;
      v28[9] = v38;
      v28[10] = v10;
      *((unsigned char *)v28 + 88) = v36;
    }
    ++v4;
  }
  while (v4 != v32);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_2180AC4C4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_2180CFF90();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_2180A96D4(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

void *sub_2180AC55C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = MEMORY[0x263F8EE78];
  uint64_t v19 = MEMORY[0x263F8EE78];
  uint64_t v5 = *(void *)(a1 + 16);
  if (v5)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = 80;
    do
    {
      uint64_t v7 = swift_bridgeObjectRetain();
      sub_2180A93AC(v7);
      v6 += 64;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
    uint64_t v4 = v19;
  }
  uint64_t v8 = *(void *)(v4 + 16);
  if (v8)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = (uint64_t *)(v4 + 40);
    os_log_type_t v10 = (void *)MEMORY[0x263F8EE78];
    do
    {
      if (!*((unsigned char *)v9 + 40))
      {
        uint64_t v13 = *(v9 - 1);
        uint64_t v12 = *v9;
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          os_log_type_t v10 = sub_2180C493C(0, v10[2] + 1, 1, v10);
        }
        unint64_t v15 = v10[2];
        unint64_t v14 = v10[3];
        if (v15 >= v14 >> 1) {
          os_log_type_t v10 = sub_2180C493C((void *)(v14 > 1), v15 + 1, 1, v10);
        }
        v10[2] = v15 + 1;
        uint64_t v11 = &v10[2 * v15];
        v11[4] = v13;
        v11[5] = v12;
      }
      v9 += 7;
      --v8;
    }
    while (v8);
    swift_bridgeObjectRelease();
  }
  else
  {
    os_log_type_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease();
  uint64_t v16 = sub_2180AC4C4((uint64_t)v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v17 = sub_2180AC0E8(a1, a2, v16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  return v17;
}

uint64_t sub_2180AC708(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_2180AC71C()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_2180AC7C4;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_2180A4C58, 0, 0);
}

uint64_t sub_2180AC7C4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2180AC8B8(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2180AC90C()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_2180AF6F4;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_2180A56AC, 0, 0);
}

uint64_t sub_2180AC9B4(uint64_t a1, uint64_t a2)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v23 = MEMORY[0x263F8EE78];
    sub_2180AA774(0, v2, 0);
    uint64_t v3 = v23;
    uint64_t v6 = (uint64_t *)(a1 + 40);
    uint64_t v17 = *(void *)(a2 + 24);
    uint64_t v18 = *(void *)(a2 + 16);
    do
    {
      uint64_t v7 = *v6;
      uint64_t v8 = v6[2];
      uint64_t v9 = v6[4];
      uint64_t v21 = v6[3];
      uint64_t v22 = v6[1];
      LOBYTE(v10) = *((unsigned char *)v6 + 40);
      BOOL v11 = *(v6 - 1) == v18 && v7 == v17;
      uint64_t v20 = *(v6 - 1);
      if (v11 || (char v12 = *((unsigned char *)v6 + 41), (sub_2180D0250() & 1) != 0))
      {
        char v19 = 1;
        unsigned int v10 = 1u >> (8 * v10);
      }
      else
      {
        char v19 = v12;
      }
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v14 = *(void *)(v23 + 16);
      unint64_t v13 = *(void *)(v23 + 24);
      if (v14 >= v13 >> 1) {
        sub_2180AA774(v13 > 1, v14 + 1, 1);
      }
      v6 += 7;
      *(void *)(v23 + 16) = v14 + 1;
      uint64_t v15 = v23 + 56 * v14;
      *(void *)(v15 + 32) = v20;
      *(void *)(v15 + 40) = v7;
      *(void *)(v15 + 48) = v22;
      *(void *)(v15 + 56) = v8;
      *(void *)(v15 + 64) = v21;
      *(void *)(v15 + 72) = v9;
      *(unsigned char *)(v15 + 80) = v10;
      *(unsigned char *)(v15 + 81) = v19;
      --v2;
    }
    while (v2);
  }
  return v3;
}

uint64_t sub_2180ACB48(uint64_t a1, uint64_t *a2)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v52 = MEMORY[0x263F8EE78];
    sub_2180AA754(0, v2, 0);
    uint64_t v6 = 0;
    uint64_t v3 = v52;
    uint64_t v7 = *a2;
    uint64_t v38 = a1 + 32;
    uint64_t v39 = a2[1];
    uint64_t v37 = *a2;
    int64_t v32 = v2;
    uint64_t v33 = (uint64_t)a2;
    do
    {
      uint64_t v8 = (uint64_t *)(v38 + (v6 << 6));
      uint64_t v9 = *v8;
      long long v45 = *(_OWORD *)(v8 + 3);
      uint64_t v44 = v8[5];
      uint64_t v41 = v8[1];
      uint64_t v42 = v8[6];
      int v43 = *((unsigned __int8 *)v8 + 56);
      BOOL v10 = v7 == *v8 && v39 == v8[1];
      uint64_t v40 = v8[2];
      if (v10 || (sub_2180D0250() & 1) != 0)
      {
        if (v43)
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_2180AEC44((uint64_t)a2);
          uint64_t v11 = swift_bridgeObjectRetain();
          uint64_t v12 = sub_2180AC9B4(v11, (uint64_t)a2);
          sub_2180AEC7C((uint64_t)a2);
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v36 = v3;
          int64_t v13 = *(void *)(v42 + 16);
          if (v13)
          {
            uint64_t v34 = v9;
            uint64_t v35 = v6;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            sub_2180AEC44((uint64_t)a2);
            uint64_t v51 = MEMORY[0x263F8EE78];
            swift_bridgeObjectRetain();
            sub_2180AA774(0, v13, 0);
            uint64_t v12 = v51;
            unint64_t v14 = (uint64_t *)(v42 + 72);
            uint64_t v15 = a2[2];
            uint64_t v16 = a2[3];
            uint64_t v46 = v16;
            uint64_t v47 = v15;
            do
            {
              uint64_t v17 = *(v14 - 5);
              uint64_t v18 = *(v14 - 4);
              uint64_t v19 = *(v14 - 2);
              uint64_t v20 = *v14;
              uint64_t v49 = *(v14 - 1);
              uint64_t v50 = *(v14 - 3);
              BOOL v48 = (v17 != v15 || v18 != v16) && (sub_2180D0250() & 1) == 0;
              unint64_t v23 = *(void *)(v51 + 16);
              unint64_t v22 = *(void *)(v51 + 24);
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              if (v23 >= v22 >> 1) {
                sub_2180AA774(v22 > 1, v23 + 1, 1);
              }
              v14 += 7;
              *(void *)(v51 + 16) = v23 + 1;
              unint64_t v24 = v51 + 56 * v23;
              *(void *)(v24 + 32) = v17;
              *(void *)(v24 + 40) = v18;
              *(void *)(v24 + 48) = v50;
              *(void *)(v24 + 56) = v19;
              *(void *)(v24 + 64) = v49;
              *(void *)(v24 + 72) = v20;
              *(unsigned char *)(v24 + 80) = v48;
              *(unsigned char *)(v24 + 81) = 1;
              --v13;
              uint64_t v16 = v46;
              uint64_t v15 = v47;
            }
            while (v13);
            a2 = (uint64_t *)v33;
            sub_2180AEC7C(v33);
            swift_bridgeObjectRelease();
            uint64_t v6 = v35;
            int64_t v2 = v32;
            uint64_t v3 = v36;
            uint64_t v9 = v34;
          }
          else
          {
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            uint64_t v12 = MEMORY[0x263F8EE78];
            uint64_t v3 = v36;
          }
        }
        uint64_t v25 = v9;
        swift_bridgeObjectRelease();
        uint64_t v26 = v12;
        uint64_t v7 = v37;
      }
      else
      {
        uint64_t v25 = v9;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v26 = v42;
      }
      uint64_t v53 = v3;
      unint64_t v28 = *(void *)(v3 + 16);
      unint64_t v27 = *(void *)(v3 + 24);
      if (v28 >= v27 >> 1)
      {
        uint64_t v30 = v26;
        sub_2180AA754(v27 > 1, v28 + 1, 1);
        uint64_t v26 = v30;
        uint64_t v7 = v37;
        uint64_t v3 = v53;
      }
      ++v6;
      *(void *)(v3 + 16) = v28 + 1;
      uint64_t v29 = v3 + (v28 << 6);
      *(void *)(v29 + 32) = v25;
      *(void *)(v29 + 40) = v41;
      *(void *)(v29 + 48) = v40;
      *(_OWORD *)(v29 + 56) = v45;
      *(void *)(v29 + 72) = v44;
      *(void *)(v29 + 80) = v26;
      *(unsigned char *)(v29 + 88) = v43;
    }
    while (v6 != v2);
  }
  return v3;
}

uint64_t sub_2180ACF3C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (!v2) {
    return v3;
  }
  uint64_t v44 = MEMORY[0x263F8EE78];
  sub_2180D01A0();
  uint64_t v6 = 0;
  uint64_t v38 = a1 + 32;
  uint64_t v41 = a2;
  uint64_t v36 = v2;
  do
  {
    uint64_t v7 = (long long *)(v38 + (v6 << 6));
    *(_OWORD *)((char *)v47 + 9) = *(long long *)((char *)v7 + 41);
    long long v8 = v7[1];
    long long v45 = *v7;
    long long v46 = v8;
    v47[0] = v7[2];
    if (BYTE8(v47[1]) != 1)
    {
      sub_2180AEA60(0, &qword_267BBD798);
      sub_2180AEA9C((uint64_t)&v45);
      swift_bridgeObjectRetain();
      sub_2180A778C(&v45, a2);
      goto LABEL_4;
    }
    uint64_t v9 = *(void *)&v47[1];
    uint64_t v48 = *(void *)&v47[1];
    uint64_t v10 = *(void *)(*(void *)&v47[1] + 16);
    if (v10)
    {
      uint64_t v37 = v6;
      v43[5] = v3;
      sub_2180AEA9C((uint64_t)&v45);
      swift_bridgeObjectRetain();
      sub_2180AEAF4((uint64_t)&v48);
      sub_2180D01A0();
      uint64_t v11 = v9 + 40;
      do
      {
        uint64_t v16 = *(void *)(v11 - 8);
        uint64_t v15 = *(void *)v11;
        uint64_t v42 = v10;
        uint64_t v17 = *(void *)(v11 + 32);
        int v18 = *(unsigned __int8 *)(v11 + 40);
        uint64_t v19 = *(void *)(a2 + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v19)
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          unint64_t v20 = sub_2180A9884(v16, v15);
          if (v21)
          {
            int v40 = v18;
            uint64_t v22 = *(void *)(*(void *)(a2 + 56) + 8 * v20);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v23 = *(void *)(v22 + 16);
            if (v23)
            {
              __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD7A0);
              unint64_t v24 = (void *)swift_allocObject();
              int64_t v25 = _swift_stdlib_malloc_size(v24);
              uint64_t v26 = v25 - 32;
              if (v25 < 32) {
                uint64_t v26 = v25 - 17;
              }
              v24[2] = v23;
              v24[3] = 2 * (v26 >> 4);
              uint64_t v39 = sub_2180AAED0((uint64_t)v43, v24 + 4, v23, v22);
              swift_bridgeObjectRetain();
              uint64_t result = sub_2180AEBA0();
              if (v39 != v23)
              {
                __break(1u);
                return result;
              }
            }
            swift_bridgeObjectRelease();
            int v18 = v40;
          }
          else
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
        }
        else
        {
          swift_bridgeObjectRetain();
        }
        unint64_t v28 = (void *)sub_2180CFE10();
        uint64_t v29 = (void *)sub_2180CFE10();
        if (v17)
        {
          swift_bridgeObjectRetain();
          uint64_t v12 = (void *)sub_2180CFE10();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v12 = 0;
        }
        v11 += 56;
        id v13 = objc_allocWithZone(MEMORY[0x263F17750]);
        unint64_t v14 = (void *)sub_2180CFE90();
        swift_bridgeObjectRelease();
        objc_msgSend(v13, sel_initWithTitle_identifier_subtitle_selected_requiredOptionsIdentifiers_, v28, v29, v12, v18 == 0, v14);

        sub_2180D0180();
        sub_2180D01B0();
        sub_2180D01C0();
        sub_2180D0190();
        uint64_t v10 = v42 - 1;
        a2 = v41;
      }
      while (v42 != 1);
      sub_2180AEB20((uint64_t)&v48);
      swift_bridgeObjectRelease();
      uint64_t v3 = MEMORY[0x263F8EE78];
      uint64_t v2 = v36;
      uint64_t v6 = v37;
      if (!*((void *)&v46 + 1)) {
        goto LABEL_25;
      }
    }
    else
    {
      sub_2180AEA9C((uint64_t)&v45);
      if (!*((void *)&v46 + 1))
      {
LABEL_25:
        uint64_t v30 = 0;
        goto LABEL_26;
      }
    }
    swift_bridgeObjectRetain();
    uint64_t v30 = (void *)sub_2180CFE10();
    swift_bridgeObjectRelease();
LABEL_26:
    uint64_t v31 = (void *)sub_2180CFE10();
    uint64_t v32 = v6;
    if (*((void *)&v47[0] + 1))
    {
      swift_bridgeObjectRetain();
      uint64_t v33 = (void *)sub_2180CFE10();
      sub_2180AEB4C((uint64_t)&v45);
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_2180AEB4C((uint64_t)&v45);
      uint64_t v33 = 0;
    }
    id v34 = objc_allocWithZone(MEMORY[0x263F17758]);
    sub_2180AEA60(0, &qword_267BBD6B0);
    uint64_t v35 = (void *)sub_2180CFE90();
    swift_bridgeObjectRelease();
    objc_msgSend(v34, sel_initWithTitle_identifier_footer_options_, v30, v31, v33, v35);

    uint64_t v6 = v32;
LABEL_4:
    ++v6;
    sub_2180D0180();
    sub_2180D01B0();
    sub_2180D01C0();
    sub_2180D0190();
    a2 = v41;
  }
  while (v6 != v2);
  return v44;
}

uint64_t _s14CloudSharingUI0B22OptionsObservableModelC018collaborationShareD013layoutMargins19userDidChangeOption011contentSizelM0ACSo016_SWCollaborationhD0CSg_05SwiftC010EdgeInsetsVySS_SSSbAJtcSgySo6CGSizeVcSgtcfC_0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6, double a7, double a8, double a9)
{
  uint64_t v47 = a4;
  uint64_t v17 = sub_2180CF680();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  unint64_t v20 = (char *)&v42 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2180CF660();
  id v21 = a1;
  uint64_t v22 = sub_2180CF670();
  os_log_type_t v23 = sub_2180CFFC0();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v42 = v17;
    uint64_t v44 = a5;
    uint64_t v46 = a3;
    unint64_t v24 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    uint64_t v49 = v25;
    *(_DWORD *)unint64_t v24 = 136315138;
    int v43 = a1;
    uint64_t v45 = a2;
    if (a1)
    {
      id v26 = objc_msgSend(v21, sel_description);
      uint64_t v27 = sub_2180CFE50();
      unint64_t v29 = v28;
    }
    else
    {
      unint64_t v29 = 0xE500000000000000;
      uint64_t v27 = 0x296C696E28;
    }
    uint64_t v48 = sub_2180C4A4C(v27, v29, &v49);
    sub_2180D00E0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21809D000, v22, v23, "SharingOptionsViewModel init options: %s", v24, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D461630](v25, -1, -1);
    MEMORY[0x21D461630](v24, -1, -1);

    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v42);
    a2 = v45;
    a3 = v46;
    a5 = v44;
    if (!v43) {
      goto LABEL_9;
    }
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
    if (!a1)
    {
LABEL_9:
      id v34 = (void *)swift_allocObject();
      v34[2] = 0;
      v34[3] = 0;
      v34[4] = a2;
      v34[5] = a3;
      sub_2180AC708(a2);
      uint64_t v36 = sub_2180AE898;
      goto LABEL_10;
    }
  }
  id v30 = objc_msgSend(v21, sel_summary);
  uint64_t v31 = sub_2180CFE50();
  uint64_t v33 = v32;

  id v34 = (void *)swift_allocObject();
  v34[2] = v31;
  v34[3] = v33;
  v34[4] = a2;
  v34[5] = a3;
  sub_2180AC708(a2);
  id v35 = objc_msgSend(v21, sel_optionsGroups);
  uint64_t v36 = sub_2180AF680;
  if (!v35)
  {
LABEL_10:
    uint64_t v39 = v36;
    unint64_t v38 = MEMORY[0x263F8EE78];
    goto LABEL_11;
  }
  uint64_t v37 = v35;
  sub_2180AEA60(0, (unint64_t *)&qword_267BBD778);
  unint64_t v38 = sub_2180CFEA0();

  uint64_t v39 = sub_2180AF680;
LABEL_11:
  type metadata accessor for SharingOptionsObservableModel();
  uint64_t v40 = swift_allocObject();
  swift_retain();
  SharingOptionsObservableModel.init(collaborationOptionsGroups:layoutMargins:userDidChangeOption:contentSizeDidChange:)(v38, (uint64_t)v39, (uint64_t)v34, v47, a5, a6, a7, a8, a9);
  sub_2180AC8B8(a2);
  swift_release();

  return v40;
}

uint64_t sub_2180AD8A4()
{
  return type metadata accessor for SharingOptionsObservableModel();
}

void sub_2180AD8AC()
{
  sub_2180ADC44();
  if (v0 <= 0x3F)
  {
    sub_2180CF650();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for SharingOptionsObservableModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SharingOptionsObservableModel);
}

uint64_t dispatch thunk of SharingOptionsObservableModel.sourceAppBundleID.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of SharingOptionsObservableModel.sourceAppBundleID.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of SharingOptionsObservableModel.sourceAppBundleID.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t dispatch thunk of SharingOptionsObservableModel.userAction.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 296))();
}

uint64_t dispatch thunk of SharingOptionsObservableModel.userAction.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 304))();
}

uint64_t dispatch thunk of SharingOptionsObservableModel.userAction.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 312))();
}

uint64_t dispatch thunk of SharingOptionsObservableModel.contentSize.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 344))();
}

uint64_t dispatch thunk of SharingOptionsObservableModel.contentSize.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 352))();
}

uint64_t dispatch thunk of SharingOptionsObservableModel.contentSize.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 360))();
}

uint64_t dispatch thunk of SharingOptionsObservableModel.collaborationOptionsGroups.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 392))();
}

uint64_t dispatch thunk of SharingOptionsObservableModel.collaborationOptionsGroups.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 400))();
}

uint64_t dispatch thunk of SharingOptionsObservableModel.collaborationOptionsGroups.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 408))();
}

uint64_t dispatch thunk of SharingOptionsObservableModel.__allocating_init(collaborationOptionsGroups:layoutMargins:userDidChangeOption:contentSizeDidChange:)()
{
  return (*(uint64_t (**)(void))(v0 + 800))();
}

uint64_t dispatch thunk of SharingOptionsObservableModel.__allocating_init(collaborationOptionsGroups:userDidChangeOption:)()
{
  return (*(uint64_t (**)(void))(v0 + 808))();
}

uint64_t dispatch thunk of SharingOptionsObservableModel.setSourceAppBundleID(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 816))();
}

void sub_2180ADC44()
{
  if (!qword_267BBD710)
  {
    type metadata accessor for AlertViewModel(255);
    unint64_t v0 = sub_2180D00D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267BBD710);
    }
  }
}

uint64_t initializeBufferWithCopyOfBuffer for SharingOptionsObservableModel.UserAction(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SharingOptionsObservableModel.UserAction()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SharingOptionsObservableModel.UserAction(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SharingOptionsObservableModel.UserAction(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
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

uint64_t assignWithTake for SharingOptionsObservableModel.UserAction(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for SharingOptionsObservableModel.UserAction(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 33)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SharingOptionsObservableModel.UserAction(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 33) = 1;
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
    *(unsigned char *)(result + 33) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SharingOptionsObservableModel.UserAction()
{
  return &type metadata for SharingOptionsObservableModel.UserAction;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_2180ADEDC(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_2180ADEFC(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
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
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for UIEdgeInsets(uint64_t a1)
{
}

void type metadata accessor for URLResourceKey(uint64_t a1)
{
}

uint64_t destroy for SharingOptionsObservableModel.Group()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SharingOptionsObservableModel.Group(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SharingOptionsObservableModel.Group(uint64_t a1, uint64_t a2)
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
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

__n128 __swift_memcpy57_8(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for SharingOptionsObservableModel.Group(uint64_t a1, uint64_t a2)
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
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for SharingOptionsObservableModel.Group(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SharingOptionsObservableModel.Group(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SharingOptionsObservableModel.Group()
{
  return &type metadata for SharingOptionsObservableModel.Group;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_2180AE1FC(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_2180AE21C(uint64_t result, int a2, int a3)
{
  if (a2)
  {
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
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

uint64_t sub_2180AE258()
{
  return MEMORY[0x263F8D320];
}

uint64_t sub_2180AE264()
{
  return sub_2180AE2AC(&qword_267BBD730, type metadata accessor for URLResourceKey);
}

uint64_t sub_2180AE2AC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2180AE2F4()
{
  return sub_2180AE2AC(&qword_267BBD738, type metadata accessor for URLResourceKey);
}

uint64_t sub_2180AE33C()
{
  return sub_2180AE2AC(&qword_267BBD740, type metadata accessor for URLResourceKey);
}

uint64_t sub_2180AE384()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2180AE3C0()
{
  return sub_2180A73D4();
}

uint64_t sub_2180AE3EC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  swift_retain();
  swift_retain();
  sub_2180AB8B4(v2, v3);
  return a1;
}

uint64_t sub_2180AE460(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2180AE4C8()
{
  return sub_2180A73D4();
}

uint64_t sub_2180AE4F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AlertViewModelButton(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2180AE560()
{
  return sub_2180A37F0(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void sub_2180AE584()
{
  *(unsigned char *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__showingAlertBool) = *(unsigned char *)(v0 + 24);
}

uint64_t sub_2180AE59C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AlertViewModelButton(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2180AE5F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD6F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2180AE660(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD6F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_2180AE6C8()
{
  *(unsigned char *)(*(void *)(v0 + 16)
           + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__shouldValidateWithAlert) = *(unsigned char *)(v0 + 24);
}

uint64_t sub_2180AE6E0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  swift_release();
  swift_release();
  sub_2180AB958(v2, v3);
  return a1;
}

uint64_t objectdestroy_80Tm()
{
  swift_release();
  swift_release();
  swift_release();
  if (*(void *)(v0 + 48))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 96, 7);
}

uint64_t sub_2180AE7B8()
{
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_2180AE808()
{
  return sub_2180A6960();
}

uint64_t sub_2180AE818()
{
  return sub_2180AE9E0();
}

uint64_t sub_2180AE830()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = (void *)(v0[2] + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__disableGroupWithID);
  *uint64_t v2 = v0[3];
  v2[1] = v1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2180AE87C()
{
  return sub_2180AEA24();
}

void sub_2180AE898(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, unint64_t a6)
{
  sub_2180A5748(a1, a2, a3, a4, a5, a6, *(void *)(v6 + 16), *(void *)(v6 + 24), *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void, id))(v6 + 32));
}

uint64_t objectdestroy_109Tm()
{
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 32)) {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2180AE910()
{
  return sub_2180A7B6C();
}

uint64_t (*sub_2180AE918())()
{
  return sub_2180AE970;
}

uint64_t sub_2180AE970()
{
  return sub_2180A7C38();
}

uint64_t sub_2180AE978()
{
  return sub_2180A8084();
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

uint64_t sub_2180AE9E0()
{
  *(void *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__allGroups) = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2180AEA24()
{
  *(void *)(*(void *)(v0 + 16) + 152) = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2180AEA60(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2180AEA9C(uint64_t a1)
{
  return a1;
}

uint64_t sub_2180AEAF4(uint64_t a1)
{
  return a1;
}

uint64_t sub_2180AEB20(uint64_t a1)
{
  return a1;
}

uint64_t sub_2180AEB4C(uint64_t a1)
{
  return a1;
}

uint64_t sub_2180AEBA0()
{
  return swift_release();
}

uint64_t sub_2180AEBAC(uint64_t a1)
{
  return a1;
}

uint64_t sub_2180AEBF8(uint64_t a1)
{
  return a1;
}

uint64_t sub_2180AEC44(uint64_t a1)
{
  return a1;
}

uint64_t sub_2180AEC7C(uint64_t a1)
{
  return a1;
}

uint64_t sub_2180AECB4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2180AED10()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2180AED48(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2180AC7C4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_267BBD7B8 + dword_267BBD7B8);
  return v6(a1, v4);
}

uint64_t sub_2180AEE00(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_2180AEE44()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = v0[4];
  uint64_t result = swift_beginAccess();
  *(void *)(v1 + 72) = v2;
  *(void *)(v1 + 80) = v3;
  return result;
}

uint64_t sub_2180AEE98(uint64_t a1, void (*a2)(void, void, void, void, void))
{
  return a1;
}

uint64_t destroy for SharingOptionsObservableModel.Group.Option()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SharingOptionsObservableModel.Group.Option(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SharingOptionsObservableModel.Group.Option(uint64_t a1, uint64_t a2)
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
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  return a1;
}

__n128 __swift_memcpy50_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for SharingOptionsObservableModel.Group.Option(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  return a1;
}

uint64_t getEnumTagSinglePayload for SharingOptionsObservableModel.Group.Option(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 50)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SharingOptionsObservableModel.Group.Option(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 48) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 50) = 1;
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
    *(unsigned char *)(result + 50) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SharingOptionsObservableModel.Group.Option()
{
  return &type metadata for SharingOptionsObservableModel.Group.Option;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SharingOptionsObservableModel.Group.Kind(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SharingOptionsObservableModel.Group.Kind(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2180AF2B0);
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

uint64_t sub_2180AF2D8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2180AF2E4(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SharingOptionsObservableModel.Group.Kind()
{
  return &type metadata for SharingOptionsObservableModel.Group.Kind;
}

unint64_t sub_2180AF304()
{
  unint64_t result = qword_267BBD7E8;
  if (!qword_267BBD7E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBD7E8);
  }
  return result;
}

void type metadata accessor for UILayoutPriority(uint64_t a1)
{
}

void sub_2180AF36C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t getEnumTagSinglePayload for SharingOptionsObservableModel.Group.Option.AccessoryState(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SharingOptionsObservableModel.Group.Option.AccessoryState(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2180AF510);
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

unsigned char *sub_2180AF538(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SharingOptionsObservableModel.Group.Option.AccessoryState()
{
  return &type metadata for SharingOptionsObservableModel.Group.Option.AccessoryState;
}

unint64_t sub_2180AF554()
{
  unint64_t result = qword_267BBD7F8;
  if (!qword_267BBD7F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBD7F8);
  }
  return result;
}

uint64_t sub_2180AF5A8()
{
  return sub_2180AE2AC(&qword_267BBD800, type metadata accessor for UILayoutPriority);
}

uint64_t sub_2180AF5F0()
{
  return sub_2180AE2AC(&qword_267BBD808, type metadata accessor for UILayoutPriority);
}

uint64_t sub_2180AF638()
{
  return sub_2180AE2AC(&qword_267BBD810, type metadata accessor for UILayoutPriority);
}

uint64_t sub_2180AF684()
{
  return sub_2180AE560();
}

uint64_t sub_2180AF69C()
{
  return sub_2180AB9B4();
}

uint64_t sub_2180AF6B4()
{
  return sub_2180AB93C();
}

uint64_t sub_2180AF6D8()
{
  return sub_2180AB894();
}

void sub_2180AF6F8()
{
}

uint64_t sub_2180AF710()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2180CF720();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2180AF784()
{
  id v1 = objc_msgSend(self, sel_currentDevice);
  objc_msgSend(v1, sel_userInterfaceIdiom);

  swift_beginAccess();
  sub_2180CF6E0();
  swift_endAccess();
  return v0;
}

uint64_t sub_2180AF848()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC14CloudSharingUI13UserInterface__idiom;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD8C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_2180AF8EC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2180CF6D0();
  *a1 = result;
  return result;
}

uint64_t sub_2180AF93C()
{
  type metadata accessor for UserInterface(0);
  uint64_t v0 = swift_allocObject();
  sub_2180AF784();
  return v0;
}

uint64_t SharingOptionsView.viewModel.getter()
{
  return sub_2180AF9C8(MEMORY[0x263F18660]);
}

uint64_t type metadata accessor for SharingOptionsView(uint64_t a1)
{
  return sub_2180B077C(a1, (uint64_t *)&unk_267BBD890);
}

uint64_t SharingOptionsView.$viewModel.getter()
{
  return sub_2180AF9C8(MEMORY[0x263F18668]);
}

uint64_t sub_2180AF9C8(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v2 = (uint64_t *)(v1 + *(int *)(type metadata accessor for SharingOptionsView(0) + 24));
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  uint64_t v5 = *((unsigned __int8 *)v2 + 16);
  uint64_t v6 = type metadata accessor for SharingOptionsViewModel();
  uint64_t v7 = sub_2180B142C(&qword_267BBD828, (void (*)(uint64_t))type metadata accessor for SharingOptionsViewModel);

  return a1(v3, v4, v5, v6, v7);
}

double SharingOptionsView.init(viewModel:)@<D0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  *a2 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD830);
  swift_storeEnumTagMultiPayload();
  uint64_t v4 = (int *)type metadata accessor for SharingOptionsView(0);
  uint64_t v5 = (char *)a2 + v4[5];
  *(void *)uint64_t v5 = sub_2180AF93C;
  *((void *)v5 + 1) = 0;
  v5[16] = 0;
  uint64_t v6 = v4[7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD838);
  sub_2180CFC50();
  double result = *(double *)&v9;
  *(_OWORD *)((char *)a2 + v6) = v9;
  int v8 = (char *)a2 + v4[6];
  *(void *)int v8 = sub_2180B03E0;
  *((void *)v8 + 1) = a1;
  v8[16] = 0;
  return result;
}

uint64_t SharingOptionsView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v31 = sub_2180CFF30();
  uint64_t v29 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388](v31);
  uint64_t v3 = (char *)&v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for SharingOptionsView(0);
  uint64_t v5 = v4 - 8;
  uint64_t v27 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v27 + 64);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD840);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for SharingOptionsGroupsView(0);
  MEMORY[0x270FA5388](v11);
  id v13 = (uint64_t *)((char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = *(int *)(v5 + 36);
  uint64_t v28 = v1;
  long long v32 = *(_OWORD *)(v1 + v14);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD848);
  sub_2180CFC60();
  uint64_t v15 = v33;
  *id v13 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD830);
  swift_storeEnumTagMultiPayload();
  uint64_t v16 = (char *)v13 + *(int *)(v11 + 20);
  *(void *)uint64_t v16 = sub_2180B50D0;
  *((void *)v16 + 1) = 0;
  v16[16] = 0;
  if (!v15) {
    _s14CloudSharingUI0B22OptionsObservableModelC018collaborationShareD013layoutMargins19userDidChangeOption011contentSizelM0ACSo016_SWCollaborationhD0CSg_05SwiftC010EdgeInsetsVySS_SSSbAJtcSgySo6CGSizeVcSgtcfC_0(0, 0, 0, 0, 0, 0.0, 0.0, 0.0, 0.0);
  }
  type metadata accessor for SharingOptionsObservableModel();
  sub_2180B142C(&qword_267BBD670, (void (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel);
  sub_2180CFD50();
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))((char *)v13 + *(int *)(v11 + 24), v10, v7);
  sub_2180B0674(v28, (uint64_t)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for SharingOptionsView);
  unint64_t v17 = (*(unsigned __int8 *)(v27 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
  uint64_t v18 = swift_allocObject();
  sub_2180B0544((uint64_t)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v18 + v17);
  sub_2180CFF10();
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD860);
  uint64_t v20 = v30;
  id v21 = (char *)(v30 + *(int *)(v19 + 36));
  uint64_t v22 = sub_2180CF860();
  uint64_t v23 = v29;
  uint64_t v24 = v31;
  (*(void (**)(char *, char *, uint64_t))(v29 + 16))(&v21[*(int *)(v22 + 20)], v3, v31);
  *(void *)id v21 = &unk_267BBD858;
  *((void *)v21 + 1) = v18;
  sub_2180B0674((uint64_t)v13, v20, type metadata accessor for SharingOptionsGroupsView);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v3, v24);
  return sub_2180B06DC((uint64_t)v13);
}

uint64_t sub_2180AFF6C(uint64_t a1)
{
  *(void *)(v1 + 40) = a1;
  sub_2180CFF00();
  *(void *)(v1 + 48) = sub_2180CFEF0();
  uint64_t v3 = sub_2180CFEE0();
  return MEMORY[0x270FA2498](sub_2180B0004, v3, v2);
}

uint64_t sub_2180B0004()
{
  uint64_t v17 = v0[5];
  swift_release();
  uint64_t v16 = type metadata accessor for SharingOptionsView(0);
  type metadata accessor for SharingOptionsViewModel();
  sub_2180B142C(&qword_267BBD828, (void (*)(uint64_t))type metadata accessor for SharingOptionsViewModel);
  sub_2180CF7F0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2180CF720();
  swift_release();
  swift_release();
  swift_release();
  unint64_t v1 = v0[2];
  uint64_t v2 = sub_2180CF7F0();
  double v3 = *(double *)(v2 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel_layoutMargins);
  double v4 = *(double *)(v2 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel_layoutMargins + 8);
  double v5 = *(double *)(v2 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel_layoutMargins + 16);
  double v6 = *(double *)(v2 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel_layoutMargins + 24);
  swift_release();
  uint64_t v7 = sub_2180CF7F0();
  uint64_t v8 = *(void *)(v7 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel_userDidChangeOption);
  uint64_t v9 = *(void *)(v7 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel_userDidChangeOption + 8);
  sub_2180AC708(v8);
  swift_release();
  uint64_t v10 = sub_2180CF7F0();
  uint64_t v11 = *(void *)(v10 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel_contentSizeDidChange);
  uint64_t v12 = *(void *)(v10 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel_contentSizeDidChange + 8);
  sub_2180AC708(v11);
  swift_release();
  type metadata accessor for SharingOptionsObservableModel();
  swift_allocObject();
  uint64_t v13 = SharingOptionsObservableModel.init(collaborationOptionsGroups:layoutMargins:userDidChangeOption:contentSizeDidChange:)(v1, v8, v9, v11, v12, v3, v4, v5, v6);
  *((_OWORD *)v0 + 1) = *(_OWORD *)(v17 + *(int *)(v16 + 28));
  v0[4] = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD848);
  sub_2180CFC70();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_2180B02AC()
{
  return sub_2180CFB60();
}

uint64_t sub_2180B02CC()
{
  return sub_2180CF8C0();
}

uint64_t sub_2180B02F0()
{
  return sub_2180CF8C0();
}

uint64_t sub_2180B0314(uint64_t a1)
{
  uint64_t v2 = sub_2180CF7D0();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_2180CF8D0();
}

uint64_t sub_2180B03E0()
{
  return swift_retain();
}

uint64_t sub_2180B03E8()
{
  uint64_t v1 = *(void *)(type metadata accessor for SharingOptionsView(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD830);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_2180CF7D0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  sub_2180B053C();
  sub_2180B053C();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_2180B053C()
{
  return swift_release();
}

uint64_t sub_2180B0544(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SharingOptionsView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2180B05A8()
{
  uint64_t v2 = *(void *)(type metadata accessor for SharingOptionsView(0) - 8);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_2180AC7C4;
  return sub_2180AFF6C(v3);
}

uint64_t sub_2180B0674(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2180B06DC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SharingOptionsGroupsView(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2180B0738()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2180B0754()
{
  return type metadata accessor for UserInterface(0);
}

uint64_t type metadata accessor for UserInterface(uint64_t a1)
{
  return sub_2180B077C(a1, (uint64_t *)&unk_267BBD870);
}

uint64_t sub_2180B077C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2180B07B4()
{
  sub_2180B0844();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_2180B0844()
{
  if (!qword_267BBD880)
  {
    unint64_t v0 = sub_2180CF740();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267BBD880);
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for SharingOptionsView(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD830);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_2180CF7D0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    }
    else
    {
      *uint64_t v4 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = (char *)v4 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = *(void *)v11;
    uint64_t v13 = *((void *)v11 + 1);
    char v14 = v11[16];
    sub_2180B0A30();
    *(void *)uint64_t v10 = v12;
    *((void *)v10 + 1) = v13;
    v10[16] = v14;
    uint64_t v15 = a3[6];
    uint64_t v16 = (char *)v4 + v15;
    uint64_t v17 = (char *)a2 + v15;
    uint64_t v18 = *(void *)v17;
    uint64_t v19 = *((void *)v17 + 1);
    char v20 = v17[16];
    sub_2180B0A30();
    *(void *)uint64_t v16 = v18;
    *((void *)v16 + 1) = v19;
    v16[16] = v20;
    uint64_t v21 = a3[7];
    uint64_t v22 = (uint64_t *)((char *)v4 + v21);
    uint64_t v23 = (uint64_t *)((char *)a2 + v21);
    uint64_t v24 = v23[1];
    *uint64_t v22 = *v23;
    v22[1] = v24;
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_2180B0A30()
{
  return swift_retain();
}

uint64_t destroy for SharingOptionsView(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD830);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_2180CF7D0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  }
  else
  {
    swift_release();
  }
  sub_2180B053C();
  sub_2180B053C();
  swift_release();

  return swift_release();
}

void *initializeWithCopy for SharingOptionsView(void *a1, void *a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD830);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_2180CF7D0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = *(void *)v9;
  uint64_t v11 = *((void *)v9 + 1);
  char v12 = v9[16];
  sub_2180B0A30();
  *(void *)uint64_t v8 = v10;
  *((void *)v8 + 1) = v11;
  v8[16] = v12;
  uint64_t v13 = a3[6];
  char v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = *(void *)v15;
  uint64_t v17 = *((void *)v15 + 1);
  char v18 = v15[16];
  sub_2180B0A30();
  *(void *)char v14 = v16;
  *((void *)v14 + 1) = v17;
  v14[16] = v18;
  uint64_t v19 = a3[7];
  char v20 = (void *)((char *)a1 + v19);
  uint64_t v21 = (void *)((char *)a2 + v19);
  uint64_t v22 = v21[1];
  void *v20 = *v21;
  v20[1] = v22;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for SharingOptionsView(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_2180B0DE0((uint64_t)a1);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD830);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_2180CF7D0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = *(void *)v9;
  uint64_t v11 = *((void *)v9 + 1);
  char v12 = v9[16];
  sub_2180B0A30();
  *(void *)uint64_t v8 = v10;
  *((void *)v8 + 1) = v11;
  v8[16] = v12;
  sub_2180B053C();
  uint64_t v13 = a3[6];
  char v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = *(void *)v15;
  uint64_t v17 = *((void *)v15 + 1);
  char v18 = v15[16];
  sub_2180B0A30();
  *(void *)char v14 = v16;
  *((void *)v14 + 1) = v17;
  v14[16] = v18;
  sub_2180B053C();
  uint64_t v19 = a3[7];
  char v20 = (char *)a1 + v19;
  uint64_t v21 = (char *)a2 + v19;
  *(void *)((char *)a1 + v19) = *(void *)((char *)a2 + v19);
  swift_retain();
  swift_release();
  *((void *)v20 + 1) = *((void *)v21 + 1);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_2180B0DE0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD830);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *initializeWithTake for SharingOptionsView(char *a1, char *a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD830);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_2180CF7D0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = a3[6];
  uint64_t v10 = &a1[v8];
  uint64_t v11 = &a2[v8];
  long long v12 = *(_OWORD *)v11;
  v10[16] = v11[16];
  *(_OWORD *)uint64_t v10 = v12;
  uint64_t v13 = &a1[v9];
  char v14 = &a2[v9];
  *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
  v13[16] = v14[16];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  return a1;
}

char *assignWithTake for SharingOptionsView(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_2180B0DE0((uint64_t)a1);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD830);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_2180CF7D0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  char v11 = v10[16];
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  v9[16] = v11;
  sub_2180B053C();
  uint64_t v12 = a3[6];
  uint64_t v13 = &a1[v12];
  char v14 = &a2[v12];
  char v15 = v14[16];
  *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
  v13[16] = v15;
  sub_2180B053C();
  uint64_t v16 = a3[7];
  uint64_t v17 = &a1[v16];
  char v18 = &a2[v16];
  *(void *)&a1[v16] = *(void *)v18;
  swift_release();
  *((void *)v17 + 1) = *((void *)v18 + 1);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SharingOptionsView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2180B10B0);
}

uint64_t sub_2180B10B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD888);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 28));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for SharingOptionsView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2180B1194);
}

uint64_t sub_2180B1194(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD888);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 28)) = a2;
  }
  return result;
}

void sub_2180B1254()
{
  sub_2180B12F4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_2180B12F4()
{
  if (!qword_267BBD8A0)
  {
    sub_2180CF7D0();
    unint64_t v0 = sub_2180CF7E0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267BBD8A0);
    }
  }
}

unint64_t sub_2180B1350()
{
  unint64_t result = qword_267BBD8A8;
  if (!qword_267BBD8A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BBD860);
    sub_2180B142C(&qword_267BBD8B0, (void (*)(uint64_t))type metadata accessor for SharingOptionsGroupsView);
    sub_2180B142C(&qword_267BBD8B8, MEMORY[0x263F189F8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBD8A8);
  }
  return result;
}

uint64_t sub_2180B142C(unint64_t *a1, void (*a2)(uint64_t))
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

unsigned char *storeEnumTagSinglePayload for UserInterface.Idiom(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2180B1540);
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

ValueMetadata *type metadata accessor for UserInterface.Idiom()
{
  return &type metadata for UserInterface.Idiom;
}

unint64_t sub_2180B157C()
{
  unint64_t result = qword_267BBD8C0;
  if (!qword_267BBD8C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBD8C0);
  }
  return result;
}

uint64_t sub_2180B15D0()
{
  return MEMORY[0x263EFDDD8];
}

char *sub_2180B15EC(char *a1, uint64_t *a2, uint64_t a3)
{
  unsigned int v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *(void *)a1 = *a2;
    unsigned int v4 = (char *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = (int *)type metadata accessor for AlertViewModel(0);
    uint64_t v8 = *((void *)v7 - 1);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, int *))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD6F8);
      memcpy(v4, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      uint64_t v11 = sub_2180CF5E0();
      (*(void (**)(char *, uint64_t *, uint64_t))(*(void *)(v11 - 8) + 16))(v4, a2, v11);
      uint64_t v12 = v7[5];
      uint64_t v13 = &v4[v12];
      char v14 = (uint64_t *)((char *)a2 + v12);
      uint64_t v15 = v14[1];
      *(void *)uint64_t v13 = *v14;
      *((void *)v13 + 1) = v15;
      uint64_t v16 = v7[6];
      uint64_t v17 = &v4[v16];
      char v18 = (uint64_t *)((char *)a2 + v16);
      uint64_t v19 = v18[1];
      *(void *)uint64_t v17 = *v18;
      *((void *)v17 + 1) = v19;
      *(void *)&v4[v7[7]] = *(uint64_t *)((char *)a2 + v7[7]);
      char v20 = *(void (**)(char *, void, uint64_t, int *))(v8 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v20(v4, 0, 1, v7);
    }
    uint64_t v21 = *(int *)(a3 + 20);
    uint64_t v22 = &v4[v21];
    uint64_t v23 = (char *)a2 + v21;
    uint64_t v24 = *((void *)v23 + 1);
    *(void *)uint64_t v22 = *(void *)v23;
    *((void *)v22 + 1) = v24;
    v22[16] = v23[16];
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t type metadata accessor for AlertViewModel(uint64_t a1)
{
  return sub_2180B077C(a1, (uint64_t *)&unk_267BBD8E0);
}

uint64_t sub_2180B1808(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AlertViewModel(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 1, v2))
  {
    uint64_t v3 = sub_2180CF5E0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_release();

  return swift_release();
}

char *sub_2180B1900(char *a1, char *a2, uint64_t a3)
{
  unsigned int v6 = (int *)type metadata accessor for AlertViewModel(0);
  uint64_t v7 = *((void *)v6 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD6F8);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    uint64_t v9 = sub_2180CF5E0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
    uint64_t v10 = v6[5];
    uint64_t v11 = &a1[v10];
    uint64_t v12 = &a2[v10];
    uint64_t v13 = *((void *)v12 + 1);
    *(void *)uint64_t v11 = *(void *)v12;
    *((void *)v11 + 1) = v13;
    uint64_t v14 = v6[6];
    uint64_t v15 = &a1[v14];
    uint64_t v16 = &a2[v14];
    uint64_t v17 = *((void *)v16 + 1);
    *(void *)uint64_t v15 = *(void *)v16;
    *((void *)v15 + 1) = v17;
    *(void *)&a1[v6[7]] = *(void *)&a2[v6[7]];
    char v18 = *(void (**)(char *, void, uint64_t, int *))(v7 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v18(a1, 0, 1, v6);
  }
  uint64_t v19 = *(int *)(a3 + 20);
  char v20 = &a1[v19];
  uint64_t v21 = &a2[v19];
  uint64_t v22 = *((void *)v21 + 1);
  *(void *)char v20 = *(void *)v21;
  *((void *)v20 + 1) = v22;
  v20[16] = v21[16];
  swift_retain();
  swift_retain();
  return a1;
}

char *sub_2180B1AB0(char *a1, char *a2, uint64_t a3)
{
  unsigned int v6 = (int *)type metadata accessor for AlertViewModel(0);
  uint64_t v7 = *((void *)v6 - 1);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, int *))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v24 = sub_2180CF5E0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 24))(a1, a2, v24);
      uint64_t v25 = v6[5];
      uint64_t v26 = &a1[v25];
      uint64_t v27 = &a2[v25];
      *(void *)uint64_t v26 = *(void *)v27;
      *((void *)v26 + 1) = *((void *)v27 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v28 = v6[6];
      uint64_t v29 = &a1[v28];
      uint64_t v30 = &a2[v28];
      *(void *)uint64_t v29 = *(void *)v30;
      *((void *)v29 + 1) = *((void *)v30 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)&a1[v6[7]] = *(void *)&a2[v6[7]];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    sub_2180B1D6C((uint64_t)a1);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD6F8);
    memcpy(a1, a2, *(void *)(*(void *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v11 = sub_2180CF5E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
  uint64_t v12 = v6[5];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  *(void *)uint64_t v13 = *(void *)v14;
  *((void *)v13 + 1) = *((void *)v14 + 1);
  uint64_t v15 = v6[6];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  *(void *)uint64_t v16 = *(void *)v17;
  *((void *)v16 + 1) = *((void *)v17 + 1);
  *(void *)&a1[v6[7]] = *(void *)&a2[v6[7]];
  char v18 = *(void (**)(char *, void, uint64_t, int *))(v7 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v18(a1, 0, 1, v6);
LABEL_7:
  uint64_t v20 = *(int *)(a3 + 20);
  uint64_t v21 = &a1[v20];
  uint64_t v22 = &a2[v20];
  *(void *)&a1[v20] = *(void *)&a2[v20];
  swift_retain();
  swift_release();
  *((void *)v21 + 1) = *((void *)v22 + 1);
  swift_retain();
  swift_release();
  v21[16] = v22[16];
  return a1;
}

uint64_t sub_2180B1D6C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AlertViewModel(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *sub_2180B1DC8(char *a1, char *a2, uint64_t a3)
{
  unsigned int v6 = (int *)type metadata accessor for AlertViewModel(0);
  uint64_t v7 = *((void *)v6 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD6F8);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    uint64_t v9 = sub_2180CF5E0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
    *(_OWORD *)&a1[v6[5]] = *(_OWORD *)&a2[v6[5]];
    *(_OWORD *)&a1[v6[6]] = *(_OWORD *)&a2[v6[6]];
    *(void *)&a1[v6[7]] = *(void *)&a2[v6[7]];
    (*(void (**)(char *, void, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v10 = *(int *)(a3 + 20);
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
  v11[16] = v12[16];
  return a1;
}

char *sub_2180B1F40(char *a1, char *a2, uint64_t a3)
{
  unsigned int v6 = (int *)type metadata accessor for AlertViewModel(0);
  uint64_t v7 = *((void *)v6 - 1);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, int *))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v17 = sub_2180CF5E0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 40))(a1, a2, v17);
      uint64_t v18 = v6[5];
      uint64_t v19 = &a1[v18];
      uint64_t v20 = &a2[v18];
      uint64_t v22 = *(void *)v20;
      uint64_t v21 = *((void *)v20 + 1);
      *(void *)uint64_t v19 = v22;
      *((void *)v19 + 1) = v21;
      swift_bridgeObjectRelease();
      uint64_t v23 = v6[6];
      uint64_t v24 = &a1[v23];
      uint64_t v25 = &a2[v23];
      uint64_t v27 = *(void *)v25;
      uint64_t v26 = *((void *)v25 + 1);
      *(void *)uint64_t v24 = v27;
      *((void *)v24 + 1) = v26;
      swift_bridgeObjectRelease();
      *(void *)&a1[v6[7]] = *(void *)&a2[v6[7]];
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    sub_2180B1D6C((uint64_t)a1);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD6F8);
    memcpy(a1, a2, *(void *)(*(void *)(v12 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v11 = sub_2180CF5E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, a2, v11);
  *(_OWORD *)&a1[v6[5]] = *(_OWORD *)&a2[v6[5]];
  *(_OWORD *)&a1[v6[6]] = *(_OWORD *)&a2[v6[6]];
  *(void *)&a1[v6[7]] = *(void *)&a2[v6[7]];
  (*(void (**)(char *, void, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  uint64_t v13 = *(int *)(a3 + 20);
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  *(void *)&a1[v13] = *(void *)v15;
  swift_release();
  *((void *)v14 + 1) = *((void *)v15 + 1);
  swift_release();
  v14[16] = v15[16];
  return a1;
}

uint64_t sub_2180B2190(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2180B21A4);
}

uint64_t sub_2180B21A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD6F8);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_2180B226C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2180B2280);
}

uint64_t sub_2180B2280(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD6F8);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for AlertViewModelAlert(uint64_t a1)
{
  return sub_2180B077C(a1, (uint64_t *)&unk_267BBD8D0);
}

void sub_2180B2364()
{
  sub_2180B4A54(319, (unint64_t *)&qword_267BBD710, (void (*)(uint64_t))type metadata accessor for AlertViewModel);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t *sub_2180B2414(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2180CF5E0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    unint64_t v10 = (uint64_t *)((char *)a1 + v8);
    uint64_t v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    void *v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = (uint64_t *)((char *)a1 + v9);
    uint64_t v14 = (uint64_t *)((char *)a2 + v9);
    uint64_t v15 = v14[1];
    *uint64_t v13 = *v14;
    v13[1] = v15;
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_2180B2518(uint64_t a1)
{
  uint64_t v2 = sub_2180CF5E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2180B25AC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2180CF5E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v7);
  unint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = (void *)(a1 + v8);
  uint64_t v13 = (void *)(a2 + v8);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2180B2660(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2180CF5E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  void *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2180B2744(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2180CF5E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_2180B27D4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2180CF5E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[6];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  *uint64_t v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2180B2890(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2180B28A4);
}

uint64_t sub_2180B28A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2180CF5E0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_2180B2968(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2180B297C);
}

uint64_t sub_2180B297C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_2180CF5E0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_2180B2A3C()
{
  uint64_t result = sub_2180CF5E0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_2180B2AE8()
{
  return sub_2180B3808(&qword_267BBD8F0, MEMORY[0x263F07508]);
}

uint64_t sub_2180B2B34@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2180CF5E0();
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t sub_2180B2B9C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2180B2BB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v25 = a1;
  uint64_t v26 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD6F8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD8F8);
  uint64_t v23 = *(void *)(v7 - 8);
  uint64_t v24 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v22 = (char *)v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2180B3870(v3, (uint64_t)v6, &qword_267BBD6F8);
  uint64_t v9 = type metadata accessor for AlertViewModel(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v6, 1, v9) == 1)
  {
    sub_2180B35CC((uint64_t)v6);
    uint64_t v10 = 0;
    unint64_t v11 = 0xE000000000000000;
  }
  else
  {
    uint64_t v12 = &v6[*(int *)(v9 + 20)];
    uint64_t v10 = *(void *)v12;
    unint64_t v11 = *((void *)v12 + 1);
    swift_bridgeObjectRetain();
    sub_2180B1D6C((uint64_t)v6);
  }
  uint64_t v31 = v10;
  unint64_t v32 = v11;
  uint64_t v13 = v3 + *(int *)(type metadata accessor for AlertViewModelAlert(0) + 20);
  uint64_t v14 = *(void *)v13;
  uint64_t v15 = *(void *)(v13 + 8);
  LOBYTE(v13) = *(unsigned char *)(v13 + 16);
  uint64_t v27 = v14;
  uint64_t v28 = v15;
  char v29 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD900);
  uint64_t v16 = sub_2180CFD00();
  uint64_t v21 = v20;
  v20[3] = v30;
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  MEMORY[0x270FA5388](v17);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD908);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD910);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD918);
  sub_2180AEE00(&qword_267BBD920, &qword_267BBD908);
  sub_2180B363C();
  sub_2180B3690();
  sub_2180B379C();
  uint64_t v18 = v22;
  sub_2180CFBD0();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v23 + 32))(v26, v18, v24);
}

uint64_t sub_2180B2F08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD938);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD6F8);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for AlertViewModel(0);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2180B3870(a1, (uint64_t)v10, &qword_267BBD6F8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_2180B35CC((uint64_t)v10);
    uint64_t v15 = 1;
  }
  else
  {
    sub_2180B3A84((uint64_t)v10, (uint64_t)v14, type metadata accessor for AlertViewModel);
    v17[1] = *(void *)&v14[*(int *)(v11 + 28)];
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD958);
    sub_2180CF5E0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD948);
    sub_2180AEE00(&qword_267BBD960, &qword_267BBD958);
    sub_2180AEE00(&qword_267BBD940, &qword_267BBD948);
    sub_2180B3808(&qword_267BBD968, (void (*)(uint64_t))type metadata accessor for AlertViewModelButton);
    sub_2180CFD10();
    sub_2180B1D6C((uint64_t)v14);
    (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v7, v4);
    uint64_t v15 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a2, v15, 1, v4);
}

uint64_t sub_2180B3248(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AlertViewModelButton(0);
  uint64_t v3 = v2 - 8;
  uint64_t v4 = *(void *)(v2 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD758);
  MEMORY[0x270FA5388](v6 - 8);
  sub_2180B3870(a1 + *(int *)(v3 + 32), (uint64_t)&v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)], &qword_267BBD758);
  sub_2180AE4F4(a1, (uint64_t)&v11[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)]);
  unint64_t v8 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v9 = swift_allocObject();
  sub_2180B3A84((uint64_t)&v11[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)], v9 + v8, type metadata accessor for AlertViewModelButton);
  uint64_t v12 = a1;
  return sub_2180CFC90();
}

uint64_t sub_2180B3400@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = a1 + *(int *)(type metadata accessor for AlertViewModelButton(0) + 20);
  uint64_t v4 = *(void *)v3;
  uint64_t v5 = *(void *)(v3 + 8);
  char v6 = *(unsigned char *)(v3 + 16);
  uint64_t v7 = *(void *)(v3 + 24);
  *(void *)a2 = *(void *)v3;
  *(void *)(a2 + 8) = v5;
  *(unsigned char *)(a2 + 16) = v6;
  *(void *)(a2 + 24) = v7;
  sub_2180B3B68(v4, v5, v6);

  return swift_bridgeObjectRetain();
}

uint64_t sub_2180B3464@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD6F8);
  MEMORY[0x270FA5388](v4 - 8);
  char v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2180B3870(a1, (uint64_t)v6, &qword_267BBD6F8);
  uint64_t v7 = type metadata accessor for AlertViewModel(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7) == 1)
  {
    sub_2180B35CC((uint64_t)v6);
LABEL_5:
    uint64_t result = 0;
    uint64_t v12 = 0;
    uint64_t v15 = 0;
    uint64_t v13 = 0;
    goto LABEL_6;
  }
  unint64_t v8 = &v6[*(int *)(v7 + 24)];
  uint64_t v10 = *(void *)v8;
  uint64_t v9 = *((void *)v8 + 1);
  swift_bridgeObjectRetain();
  sub_2180B1D6C((uint64_t)v6);
  if (!v9) {
    goto LABEL_5;
  }
  v16[0] = v10;
  v16[1] = v9;
  sub_2180B363C();
  uint64_t result = sub_2180CFB20();
  uint64_t v15 = v14 & 1;
LABEL_6:
  *a2 = result;
  a2[1] = v12;
  a2[2] = v15;
  a2[3] = v13;
  return result;
}

uint64_t sub_2180B35AC()
{
  return sub_2180CF820();
}

uint64_t sub_2180B35CC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD6F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2180B362C@<X0>(uint64_t a1@<X8>)
{
  return sub_2180B2F08(*(void *)(v1 + 16), a1);
}

uint64_t sub_2180B3634@<X0>(uint64_t *a1@<X8>)
{
  return sub_2180B3464(*(void *)(v1 + 16), a1);
}

unint64_t sub_2180B363C()
{
  unint64_t result = qword_267BBDE10;
  if (!qword_267BBDE10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBDE10);
  }
  return result;
}

unint64_t sub_2180B3690()
{
  unint64_t result = qword_267BBD928;
  if (!qword_267BBD928)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BBD910);
    sub_2180B3704();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBD928);
  }
  return result;
}

unint64_t sub_2180B3704()
{
  unint64_t result = qword_267BBD930;
  if (!qword_267BBD930)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BBD938);
    sub_2180AEE00(&qword_267BBD940, &qword_267BBD948);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBD930);
  }
  return result;
}

unint64_t sub_2180B379C()
{
  unint64_t result = qword_267BBD950;
  if (!qword_267BBD950)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BBD918);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBD950);
  }
  return result;
}

uint64_t sub_2180B3808(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for AlertViewModelButton(uint64_t a1)
{
  return sub_2180B077C(a1, (uint64_t *)&unk_267BBD970);
}

uint64_t sub_2180B3870(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2180B38D4()
{
  uint64_t v1 = (int *)type metadata accessor for AlertViewModelButton(0);
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  uint64_t v6 = sub_2180CF5E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  sub_2180B3A74(*(void *)(v5 + v1[5]), *(void *)(v5 + v1[5] + 8), *(unsigned char *)(v5 + v1[5] + 16));
  swift_bridgeObjectRelease();
  uint64_t v7 = v0 + v3 + v1[6];
  uint64_t v8 = sub_2180CF790();
  uint64_t v9 = *(void *)(v8 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  }
  if (*(void *)(v5 + v1[7])) {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_2180B3A74(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_2180B3A84(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2180B3AEC()
{
  uint64_t v1 = type metadata accessor for AlertViewModelButton(0);
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t result = v1 - 8;
  uint64_t v4 = (uint64_t (**)(void))(v0
                          + *(int *)(result + 36)
                          + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)));
  if (*v4) {
    return (*v4)();
  }
  return result;
}

uint64_t sub_2180B3B60@<X0>(uint64_t a1@<X8>)
{
  return sub_2180B3400(*(void *)(v1 + 16), a1);
}

uint64_t sub_2180B3B68(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

void *sub_2180B3B78(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v21 = *a2;
    *a1 = *a2;
    a1 = (void *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2180CF5E0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = *(void *)((char *)a2 + v8);
    uint64_t v12 = *(void *)((char *)a2 + v8 + 8);
    char v13 = *((unsigned char *)a2 + v8 + 16);
    sub_2180B3B68(v11, v12, v13);
    *(void *)uint64_t v9 = v11;
    *((void *)v9 + 1) = v12;
    v9[16] = v13;
    *((void *)v9 + 3) = *((void *)v10 + 3);
    uint64_t v14 = a3[6];
    uint64_t v15 = (char *)a1 + v14;
    uint64_t v16 = (char *)a2 + v14;
    uint64_t v17 = sub_2180CF790();
    uint64_t v18 = *(void *)(v17 - 8);
    uint64_t v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
    swift_bridgeObjectRetain();
    if (v19(v16, 1, v17))
    {
      uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD758);
      memcpy(v15, v16, *(void *)(*(void *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v15, v16, v17);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
    }
    uint64_t v22 = a3[7];
    uint64_t v23 = (void *)((char *)a1 + v22);
    uint64_t v24 = (void *)((char *)a2 + v22);
    if (*v24)
    {
      uint64_t v25 = v24[1];
      *uint64_t v23 = *v24;
      v23[1] = v25;
      swift_retain();
    }
    else
    {
      *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
    }
  }
  return a1;
}

uint64_t sub_2180B3D90(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_2180CF5E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  sub_2180B3A74(*(void *)(a1 + a2[5]), *(void *)(a1 + a2[5] + 8), *(unsigned char *)(a1 + a2[5] + 16));
  swift_bridgeObjectRelease();
  uint64_t v5 = a1 + a2[6];
  uint64_t v6 = sub_2180CF790();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6);
  if (!result) {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  if (*(void *)(a1 + a2[7]))
  {
    return swift_release();
  }
  return result;
}

uint64_t sub_2180B3ECC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2180CF5E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(a2 + v7);
  uint64_t v11 = *(void *)(a2 + v7 + 8);
  char v12 = *(unsigned char *)(a2 + v7 + 16);
  sub_2180B3B68(v10, v11, v12);
  *(void *)uint64_t v8 = v10;
  *(void *)(v8 + 8) = v11;
  *(unsigned char *)(v8 + 16) = v12;
  *(void *)(v8 + 24) = *(void *)(v9 + 24);
  uint64_t v13 = a3[6];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (const void *)(a2 + v13);
  uint64_t v16 = sub_2180CF790();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v17 + 48);
  swift_bridgeObjectRetain();
  if (v18(v15, 1, v16))
  {
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD758);
    memcpy(v14, v15, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v17 + 16))(v14, v15, v16);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  uint64_t v20 = a3[7];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (void *)(a2 + v20);
  if (*v22)
  {
    uint64_t v23 = v22[1];
    *uint64_t v21 = *v22;
    v21[1] = v23;
    swift_retain();
  }
  else
  {
    *(_OWORD *)uint64_t v21 = *(_OWORD *)v22;
  }
  return a1;
}

uint64_t sub_2180B4094(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2180CF5E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(a2 + v7);
  uint64_t v11 = *(void *)(a2 + v7 + 8);
  char v12 = *(unsigned char *)(a2 + v7 + 16);
  sub_2180B3B68(v10, v11, v12);
  uint64_t v13 = *(void *)v8;
  uint64_t v14 = *(void *)(v8 + 8);
  char v15 = *(unsigned char *)(v8 + 16);
  *(void *)uint64_t v8 = v10;
  *(void *)(v8 + 8) = v11;
  *(unsigned char *)(v8 + 16) = v12;
  sub_2180B3A74(v13, v14, v15);
  *(void *)(v8 + 24) = *(void *)(v9 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[6];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (void *)(a2 + v16);
  uint64_t v19 = sub_2180CF790();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v20 + 48);
  LODWORD(v8) = v21(v17, 1, v19);
  int v22 = v21(v18, 1, v19);
  if (v8)
  {
    if (!v22)
    {
      (*(void (**)(void *, void *, uint64_t))(v20 + 16))(v17, v18, v19);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v22)
  {
    (*(void (**)(void *, uint64_t))(v20 + 8))(v17, v19);
LABEL_6:
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD758);
    memcpy(v17, v18, *(void *)(*(void *)(v23 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v20 + 24))(v17, v18, v19);
LABEL_7:
  uint64_t v24 = a3[7];
  uint64_t v25 = (void *)(a1 + v24);
  uint64_t v26 = (uint64_t *)(a2 + v24);
  uint64_t v27 = *(void *)(a1 + v24);
  uint64_t v28 = *v26;
  if (!v27)
  {
    if (v28)
    {
      uint64_t v30 = v26[1];
      *uint64_t v25 = v28;
      v25[1] = v30;
      swift_retain();
      return a1;
    }
LABEL_13:
    *(_OWORD *)uint64_t v25 = *(_OWORD *)v26;
    return a1;
  }
  if (!v28)
  {
    swift_release();
    goto LABEL_13;
  }
  uint64_t v29 = v26[1];
  *uint64_t v25 = v28;
  v25[1] = v29;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_2180B42FC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2180CF5E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (_OWORD *)(a1 + v7);
  uint64_t v10 = (_OWORD *)(a2 + v7);
  long long v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  char v12 = (void *)(a1 + v8);
  uint64_t v13 = (const void *)(a2 + v8);
  uint64_t v14 = sub_2180CF790();
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD758);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v15 + 32))(v12, v13, v14);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  uint64_t v17 = a3[7];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (uint64_t *)(a2 + v17);
  uint64_t v20 = *v19;
  if (*v19)
  {
    uint64_t v21 = v19[1];
    *uint64_t v18 = v20;
    v18[1] = v21;
  }
  else
  {
    *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
  }
  return a1;
}

uint64_t sub_2180B448C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2180CF5E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  LOBYTE(v7) = *(unsigned char *)(a2 + v7 + 16);
  uint64_t v10 = *(void *)v8;
  uint64_t v11 = *(void *)(v8 + 8);
  char v12 = *(unsigned char *)(v8 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(unsigned char *)(v8 + 16) = v7;
  sub_2180B3A74(v10, v11, v12);
  *(void *)(v8 + 24) = *(void *)(v9 + 24);
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[6];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  uint64_t v16 = sub_2180CF790();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v17 + 48);
  int v19 = v18(v14, 1, v16);
  int v20 = v18(v15, 1, v16);
  if (v19)
  {
    if (!v20)
    {
      (*(void (**)(void *, void *, uint64_t))(v17 + 32))(v14, v15, v16);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v20)
  {
    (*(void (**)(void *, uint64_t))(v17 + 8))(v14, v16);
LABEL_6:
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD758);
    memcpy(v14, v15, *(void *)(*(void *)(v21 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v17 + 40))(v14, v15, v16);
LABEL_7:
  uint64_t v22 = a3[7];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (uint64_t *)(a2 + v22);
  uint64_t v25 = *(void *)(a1 + v22);
  uint64_t v26 = *v24;
  if (!v25)
  {
    if (v26)
    {
      uint64_t v28 = v24[1];
      *uint64_t v23 = v26;
      v23[1] = v28;
      return a1;
    }
LABEL_13:
    *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
    return a1;
  }
  if (!v26)
  {
    swift_release();
    goto LABEL_13;
  }
  uint64_t v27 = v24[1];
  *uint64_t v23 = v26;
  v23[1] = v27;
  swift_release();
  return a1;
}

uint64_t sub_2180B46D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2180B46E4);
}

uint64_t sub_2180B46E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2180CF5E0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 24);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD758);
    char v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 24);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_2180B4818(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2180B482C);
}

uint64_t sub_2180B482C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_2180CF5E0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD758);
    char v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 24);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

void sub_2180B4960()
{
  sub_2180CF5E0();
  if (v0 <= 0x3F)
  {
    sub_2180B4A54(319, &qword_267BBD980, MEMORY[0x263F18380]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_2180B4A54(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_2180D00D0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_2180B4AA8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2180B4B84@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2180B9EC4(&qword_267BBD670, (void (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel);
  sub_2180CF610();
  swift_release();
  uint64_t v4 = v3 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__showingAlert;
  swift_beginAccess();
  return sub_2180B3870(v4, a2, &qword_267BBD6F8);
}

uint64_t sub_2180B4C58(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD6F8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_2180B3870(a1, (uint64_t)v6, &qword_267BBD6F8);
  uint64_t v7 = *a2;
  swift_getKeyPath();
  uint64_t v10 = v7;
  uint64_t v11 = v6;
  uint64_t v12 = v7;
  sub_2180B9EC4(&qword_267BBD670, (void (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel);
  sub_2180CF600();
  swift_release();
  return sub_2180AECB4((uint64_t)v6, &qword_267BBD6F8);
}

uint64_t sub_2180B4D98@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2180B9EC4(&qword_267BBD670, (void (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel);
  sub_2180CF610();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__showingAlertBool);
  return result;
}

uint64_t sub_2180B4E48()
{
  return swift_release();
}

uint64_t SharingOptionsGroupsView.init(viewModel:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD840);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *a2 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD830);
  swift_storeEnumTagMultiPayload();
  uint64_t v8 = type metadata accessor for SharingOptionsGroupsView(0);
  uint64_t v9 = (char *)a2 + *(int *)(v8 + 20);
  *(void *)uint64_t v9 = sub_2180B50D0;
  *((void *)v9 + 1) = 0;
  unsigned char v9[16] = 0;
  if (!a1) {
    _s14CloudSharingUI0B22OptionsObservableModelC018collaborationShareD013layoutMargins19userDidChangeOption011contentSizelM0ACSo016_SWCollaborationhD0CSg_05SwiftC010EdgeInsetsVySS_SSSbAJtcSgySo6CGSizeVcSgtcfC_0(0, 0, 0, 0, 0, 0.0, 0.0, 0.0, 0.0);
  }
  type metadata accessor for SharingOptionsObservableModel();
  sub_2180B9EC4(&qword_267BBD670, (void (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel);
  sub_2180CFD50();
  return (*(uint64_t (**)(char *, char *, uint64_t))(v5 + 32))((char *)a2 + *(int *)(v8 + 24), v7, v4);
}

uint64_t sub_2180B50D0()
{
  return sub_2180AF784();
}

uint64_t SharingOptionsGroupsView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v67 = a1;
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD988);
  uint64_t v54 = *(void *)(v55 - 8);
  MEMORY[0x270FA5388](v55);
  uint64_t v59 = (char *)&v50 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD990);
  MEMORY[0x270FA5388](v65);
  uint64_t v56 = (char *)&v50 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD998);
  uint64_t v58 = *(void *)(v66 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v66);
  uint64_t v53 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v57 = (char *)&v50 - v6;
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD9A0);
  MEMORY[0x270FA5388](v63);
  uint64_t v64 = (uint64_t)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD840);
  uint64_t v60 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD6F8);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v61 = (uint64_t)&v50 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD9A8);
  uint64_t v50 = *(void *)(v51 - 8);
  MEMORY[0x270FA5388](v51);
  uint64_t v14 = (char *)&v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD9B0);
  uint64_t v15 = MEMORY[0x270FA5388](v62);
  uint64_t v17 = (char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v52 = (uint64_t)&v50 - v18;
  type metadata accessor for SharingOptionsGroupsView(0);
  type metadata accessor for UserInterface(0);
  sub_2180B9EC4(&qword_267BBD9B8, (void (*)(uint64_t))type metadata accessor for UserInterface);
  sub_2180CF7F0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2180CF720();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v68 = v1;
  if (v72)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD9C0);
    sub_2180BBD98(&qword_267BBD9C8, &qword_267BBD9C0, (void (*)(void))sub_2180B9F1C);
    sub_2180CFAD0();
    sub_2180CFD30();
    uint64_t v19 = v72;
    swift_getKeyPath();
    uint64_t v72 = v19;
    sub_2180B9EC4(&qword_267BBD670, (void (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel);
    sub_2180CF610();
    swift_release();
    uint64_t v20 = v19 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__showingAlert;
    swift_beginAccess();
    uint64_t v21 = v61;
    sub_2180B3870(v20, v61, &qword_267BBD6F8);
    swift_release();
    sub_2180CFD40();
    swift_getKeyPath();
    sub_2180CFD60();
    swift_release();
    (*(void (**)(char *, uint64_t))(v60 + 8))(v10, v8);
    uint64_t v22 = v69;
    unint64_t v23 = v70;
    char v24 = v71;
    uint64_t v25 = v65;
    uint64_t v26 = (uint64_t)v56;
    uint64_t v27 = (uint64_t)&v56[*(int *)(v65 + 36)];
    sub_2180B3870(v21, v27, &qword_267BBD6F8);
    uint64_t v28 = v27 + *(int *)(type metadata accessor for AlertViewModelAlert(0) + 20);
    *(void *)uint64_t v28 = v22;
    *(void *)(v28 + 8) = v23;
    *(unsigned char *)(v28 + 16) = v24;
    uint64_t v29 = v54;
    uint64_t v30 = v59;
    uint64_t v31 = v55;
    (*(void (**)(uint64_t, char *, uint64_t))(v54 + 16))(v26, v59, v55);
    sub_2180AECB4(v21, &qword_267BBD6F8);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v31);
    sub_2180CFD30();
    sub_2180A5B8C();
    swift_release();
    sub_2180CFC30();
    unint64_t v32 = sub_2180BA09C();
    uint64_t v33 = v53;
    sub_2180CFB50();
    swift_release();
    sub_2180AECB4(v26, &qword_267BBD990);
    id v35 = v57;
    uint64_t v34 = v58;
    uint64_t v36 = v66;
    (*(void (**)(char *, char *, uint64_t))(v58 + 32))(v57, v33, v66);
    (*(void (**)(uint64_t, char *, uint64_t))(v34 + 16))(v64, v35, v36);
    swift_storeEnumTagMultiPayload();
    sub_2180BA16C();
    uint64_t v69 = v25;
    unint64_t v70 = v32;
    swift_getOpaqueTypeConformance2();
    sub_2180CF9B0();
    return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v35, v36);
  }
  else
  {
    sub_2180CFA80();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDA30);
    sub_2180BA244();
    sub_2180CF7B0();
    sub_2180CFD30();
    uint64_t v38 = v72;
    swift_getKeyPath();
    uint64_t v72 = v38;
    sub_2180B9EC4(&qword_267BBD670, (void (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel);
    sub_2180CF610();
    swift_release();
    uint64_t v39 = v38 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__showingAlert;
    swift_beginAccess();
    uint64_t v40 = v61;
    sub_2180B3870(v39, v61, &qword_267BBD6F8);
    swift_release();
    sub_2180CFD40();
    swift_getKeyPath();
    sub_2180CFD60();
    swift_release();
    (*(void (**)(char *, uint64_t))(v60 + 8))(v10, v8);
    uint64_t v41 = v69;
    unint64_t v42 = v70;
    char v43 = v71;
    uint64_t v44 = (uint64_t)&v17[*(int *)(v62 + 36)];
    sub_2180B3870(v40, v44, &qword_267BBD6F8);
    uint64_t v45 = v44 + *(int *)(type metadata accessor for AlertViewModelAlert(0) + 20);
    *(void *)uint64_t v45 = v41;
    *(void *)(v45 + 8) = v42;
    *(unsigned char *)(v45 + 16) = v43;
    uint64_t v46 = v50;
    uint64_t v47 = v51;
    (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v17, v14, v51);
    sub_2180AECB4(v40, &qword_267BBD6F8);
    (*(void (**)(char *, uint64_t))(v46 + 8))(v14, v47);
    uint64_t v48 = v52;
    sub_2180AE460((uint64_t)v17, v52, &qword_267BBD9B0);
    sub_2180B3870(v48, v64, &qword_267BBD9B0);
    swift_storeEnumTagMultiPayload();
    sub_2180BA16C();
    unint64_t v49 = sub_2180BA09C();
    uint64_t v69 = v65;
    unint64_t v70 = v49;
    swift_getOpaqueTypeConformance2();
    sub_2180CF9B0();
    return sub_2180AECB4(v48, &qword_267BBD9B0);
  }
}

uint64_t sub_2180B5BA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v56 = a2;
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDA48) - 8;
  MEMORY[0x270FA5388](v55);
  uint64_t v54 = (uint64_t)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for SharingOptionsGroupsView(0);
  uint64_t v47 = *(void *)(v4 - 8);
  uint64_t v5 = *(void *)(v47 + 64);
  MEMORY[0x270FA5388](v4);
  uint64_t v57 = (uint64_t)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDA78);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDA68);
  uint64_t v10 = v9 - 8;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDA58) - 8;
  MEMORY[0x270FA5388](v51);
  uint64_t v50 = (uint64_t)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDA30) - 8;
  MEMORY[0x270FA5388](v53);
  uint64_t v52 = (uint64_t)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v8 = sub_2180CF990();
  *((void *)v8 + 1) = 0x4024000000000000;
  v8[16] = 0;
  *(void *)&long long v42 = &v8[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BBDBA0) + 44)];
  uint64_t v49 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD840);
  sub_2180CFD30();
  uint64_t v15 = v58;
  swift_getKeyPath();
  uint64_t v58 = v15;
  uint64_t v43 = sub_2180B9EC4(&qword_267BBD670, (void (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel);
  sub_2180CF610();
  swift_release();
  uint64_t v16 = *(void *)(v15 + 152);
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v58 = v16;
  uint64_t v48 = type metadata accessor for SharingOptionsGroupsView;
  uint64_t v17 = a1;
  uint64_t v18 = v57;
  sub_2180BC3FC(v17, v57, type metadata accessor for SharingOptionsGroupsView);
  uint64_t v19 = *(unsigned __int8 *)(v47 + 80);
  uint64_t v46 = ((v19 + 16) & ~v19) + v5;
  uint64_t v47 = (v19 + 16) & ~v19;
  uint64_t v20 = v47;
  uint64_t v45 = v19 | 7;
  uint64_t v21 = swift_allocObject();
  uint64_t v44 = type metadata accessor for SharingOptionsGroupsView;
  sub_2180BC468(v18, v21 + v20, type metadata accessor for SharingOptionsGroupsView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDBA8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDBB0);
  sub_2180AEE00(&qword_267BBDBB8, &qword_267BBDBA8);
  sub_2180AEE00(&qword_267BBDBC0, &qword_267BBDBB0);
  sub_2180BC4E8();
  sub_2180CFD10();
  sub_2180CFD30();
  long long v42 = *(_OWORD *)(v58 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel_layoutMargins);
  uint64_t v22 = *(void *)(v58 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel_layoutMargins + 16);
  uint64_t v23 = *(void *)(v58 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel_layoutMargins + 24);
  swift_release();
  LOBYTE(v20) = sub_2180CFA90();
  sub_2180B3870((uint64_t)v8, (uint64_t)v12, &qword_267BBDA78);
  char v24 = &v12[*(int *)(v10 + 44)];
  *char v24 = v20;
  *(_OWORD *)(v24 + 8) = v42;
  *((void *)v24 + 3) = v22;
  *((void *)v24 + 4) = v23;
  v24[40] = 0;
  sub_2180AECB4((uint64_t)v8, &qword_267BBDA78);
  sub_2180CFD30();
  uint64_t v25 = v58;
  swift_getKeyPath();
  uint64_t v58 = v25;
  sub_2180CF610();
  swift_release();
  swift_beginAccess();
  double v26 = *(double *)(v25 + 72);
  double v27 = *(double *)(v25 + 80);
  swift_release();
  BOOL v28 = v27 == 0.0 && v26 == 0.0;
  uint64_t v29 = v50;
  sub_2180B3870((uint64_t)v12, v50, &qword_267BBDA68);
  uint64_t v30 = (BOOL *)(v29 + *(int *)(v51 + 44));
  *uint64_t v30 = v28;
  v30[1] = 0;
  sub_2180AECB4((uint64_t)v12, &qword_267BBDA68);
  uint64_t v31 = v57;
  sub_2180BC3FC(v49, v57, v48);
  uint64_t v32 = swift_allocObject();
  sub_2180BC468(v31, v32 + v47, v44);
  uint64_t v33 = sub_2180CFD70();
  id v35 = v34;
  uint64_t v36 = v54;
  sub_2180B3870(v29, v54, &qword_267BBDA58);
  uint64_t v37 = (uint64_t (**)@<X0>(uint64_t *@<X8>))(v36 + *(int *)(v55 + 44));
  *uint64_t v37 = sub_2180C5BC8;
  v37[1] = 0;
  v37[2] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v33;
  v37[3] = v35;
  uint64_t v38 = swift_allocObject();
  *(void *)(v38 + 16) = sub_2180BC6B4;
  *(void *)(v38 + 24) = v32;
  uint64_t v39 = v52;
  sub_2180B3870(v36, v52, &qword_267BBDA48);
  uint64_t v40 = (uint64_t (**)(double *))(v39 + *(int *)(v53 + 44));
  *uint64_t v40 = sub_2180BC764;
  v40[1] = (uint64_t (*)(double *))v38;
  sub_2180AECB4(v36, &qword_267BBDA48);
  sub_2180AECB4(v29, &qword_267BBDA58);
  return sub_2180AE460(v39, v56, &qword_267BBDA30);
}

uint64_t sub_2180B6270@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v137 = a2;
  uint64_t v148 = a3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD840);
  uint64_t v146 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v145 = (char *)&v121 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for SharingOptionsGroupsView.GroupView(0);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v147 = (uint64_t)&v121 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v153 = (uint64_t)&v121 - v9;
  uint64_t v10 = sub_2180CF8B0();
  MEMORY[0x270FA5388](v10 - 8);
  v134 = (char *)&v121 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v131 = sub_2180CF7D0();
  uint64_t v130 = *(void *)(v131 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v131);
  v151 = (char *)&v121 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v129 = (uint64_t)&v121 - v14;
  uint64_t v133 = sub_2180CFD80();
  uint64_t v132 = *(void *)(v133 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v133);
  uint64_t v17 = (char *)&v121 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v121 - v18;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDBD0);
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  char v24 = (char *)&v121 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = MEMORY[0x270FA5388](v22);
  uint64_t v125 = (uint64_t)&v121 - v26;
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  uint64_t v29 = (char *)&v121 - v28;
  MEMORY[0x270FA5388](v27);
  v135 = (uint64_t *)((char *)&v121 - v30);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDBD8);
  uint64_t v32 = MEMORY[0x270FA5388](v31 - 8);
  uint64_t v33 = MEMORY[0x270FA5388](v32);
  uint64_t v34 = MEMORY[0x270FA5388](v33);
  uint64_t v136 = (uint64_t)&v121 - v35;
  MEMORY[0x270FA5388](v34);
  uint64_t v37 = (char *)&v121 - v36;
  uint64_t v38 = *(void *)a1;
  uint64_t v39 = *(void *)(a1 + 8);
  unint64_t v41 = *(void *)(a1 + 24);
  uint64_t v40 = *(void *)(a1 + 32);
  long long v42 = *(void **)(a1 + 48);
  unint64_t v144 = *(void *)(a1 + 40);
  int v43 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v139 = v44;
  uint64_t v138 = v45;
  uint64_t v152 = v20;
  uint64_t v149 = v21;
  v150 = v37;
  v127 = v17;
  v126 = v24;
  uint64_t v128 = v40;
  uint64_t v143 = v38;
  uint64_t v142 = v39;
  v141 = v42;
  int v140 = v43;
  if (!v41) {
    goto LABEL_8;
  }
  uint64_t v46 = HIBYTE(v41) & 0xF;
  if ((v41 & 0x2000000000000000) == 0) {
    uint64_t v46 = *(void *)(a1 + 16) & 0xFFFFFFFFFFFFLL;
  }
  if (v46)
  {
    *(void *)&long long v156 = *(void *)(a1 + 16);
    *((void *)&v156 + 1) = v41;
    sub_2180B363C();
    swift_bridgeObjectRetain();
    uint64_t v47 = sub_2180CFB20();
    uint64_t v49 = v48;
    uint64_t v124 = v4;
    char v51 = v50 & 1;
    sub_2180CFC20();
    uint64_t v123 = v19;
    uint64_t v52 = sub_2180CFAF0();
    uint64_t v54 = v53;
    char v56 = v55;
    swift_release();
    sub_2180B3A74(v47, v49, v51);
    swift_bridgeObjectRelease();
    sub_2180CFAC0();
    uint64_t v57 = sub_2180CFAE0();
    uint64_t v59 = v58;
    uint64_t v122 = v60;
    char v62 = v61 & 1;
    sub_2180B3A74(v52, v54, v56 & 1);
    swift_bridgeObjectRelease();
    uint64_t v63 = v129;
    sub_2180C2620(v129);
    uint64_t v64 = v130;
    uint64_t v65 = v131;
    (*(void (**)(char *, void, uint64_t))(v130 + 104))(v151, *MEMORY[0x263F184F8], v131);
    LOBYTE(v54) = sub_2180CF7C0();
    uint64_t v66 = *(void (**)(char *, uint64_t))(v64 + 8);
    v66(v151, v65);
    v66((char *)v63, v65);
    uint64_t v67 = v132;
    uint64_t v68 = (unsigned int *)MEMORY[0x263F1B938];
    if ((v54 & 1) == 0) {
      uint64_t v68 = (unsigned int *)MEMORY[0x263F1B998];
    }
    uint64_t v69 = v123;
    uint64_t v70 = v133;
    (*(void (**)(char *, void, uint64_t))(v132 + 104))(v123, *v68, v133);
    uint64_t v71 = (uint64_t)v134;
    (*(void (**)(char *, char *, uint64_t))(v67 + 16))(v134, v69, v70);
    sub_2180BC3FC(v71, (uint64_t)&v29[*(int *)(v152 + 36)], MEMORY[0x263F190D8]);
    *(void *)uint64_t v29 = v57;
    *((void *)v29 + 1) = v59;
    v29[16] = v62;
    *((void *)v29 + 3) = v122;
    sub_2180B3B68(v57, v59, v62);
    swift_bridgeObjectRetain();
    sub_2180BC794(v71, MEMORY[0x263F190D8]);
    (*(void (**)(char *, uint64_t))(v67 + 8))(v69, v70);
    uint64_t v4 = v124;
    sub_2180B3A74(v57, v59, v62);
    swift_bridgeObjectRelease();
    uint64_t v72 = (void (*)(void, void, void, void))v135;
    sub_2180AE460((uint64_t)v29, (uint64_t)v135, &qword_267BBDBD0);
    uint64_t v73 = (uint64_t)v72;
    uint64_t v74 = (uint64_t)v150;
    sub_2180AE460(v73, (uint64_t)v150, &qword_267BBDBD0);
    v135 = *(void **)(v149 + 56);
    ((void (*)(uint64_t, void, uint64_t, uint64_t))v135)(v74, 0, 1, v152);
  }
  else
  {
LABEL_8:
    v135 = *(void **)(v21 + 56);
    ((void (*)(void))v135)();
  }
  type metadata accessor for SharingOptionsGroupsView(0);
  type metadata accessor for UserInterface(0);
  sub_2180B9EC4(&qword_267BBD9B8, (void (*)(uint64_t))type metadata accessor for UserInterface);
  uint64_t v75 = v142;
  swift_bridgeObjectRetain();
  sub_2180CF7F0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2180CF720();
  swift_release();
  swift_release();
  swift_release();
  char v76 = v156;
  int v77 = v141;
  swift_bridgeObjectRetain();
  sub_2180CFD30();
  uint64_t v78 = v145;
  sub_2180CFD40();
  swift_getKeyPath();
  sub_2180CFD60();
  swift_release();
  (*(void (**)(char *, uint64_t))(v146 + 8))(v78, v4);
  v154[0] = v156;
  v154[1] = v157;
  v154[2] = v158;
  char v155 = v159;
  sub_2180B70B4(v143, v75, v76, v140, v77, v154, v153);
  if (!v144) {
    goto LABEL_16;
  }
  uint64_t v79 = HIBYTE(v144) & 0xF;
  if ((v144 & 0x2000000000000000) == 0) {
    uint64_t v79 = v128 & 0xFFFFFFFFFFFFLL;
  }
  if (v79)
  {
    *(void *)&long long v156 = v128;
    *((void *)&v156 + 1) = v144;
    sub_2180B363C();
    swift_bridgeObjectRetain();
    uint64_t v80 = sub_2180CFB20();
    uint64_t v82 = v81;
    char v84 = v83 & 1;
    sub_2180CFC20();
    uint64_t v85 = sub_2180CFAF0();
    uint64_t v87 = v86;
    char v89 = v88;
    swift_release();
    sub_2180B3A74(v80, v82, v84);
    swift_bridgeObjectRelease();
    sub_2180CFAC0();
    uint64_t v90 = sub_2180CFAE0();
    uint64_t v92 = v91;
    uint64_t v94 = v93;
    char v96 = v95 & 1;
    sub_2180B3A74(v85, v87, v89 & 1);
    swift_bridgeObjectRelease();
    uint64_t v97 = v129;
    sub_2180C2620(v129);
    uint64_t v98 = v130;
    long long v99 = v151;
    uint64_t v100 = v131;
    (*(void (**)(char *, void, uint64_t))(v130 + 104))(v151, *MEMORY[0x263F184F8], v131);
    char v101 = sub_2180CF7C0();
    long long v102 = *(void (**)(char *, uint64_t))(v98 + 8);
    v102(v99, v100);
    v102((char *)v97, v100);
    uint64_t v103 = v132;
    long long v104 = (unsigned int *)MEMORY[0x263F1B938];
    if ((v101 & 1) == 0) {
      long long v104 = (unsigned int *)MEMORY[0x263F1B998];
    }
    char v105 = v127;
    uint64_t v106 = v133;
    (*(void (**)(char *, void, uint64_t))(v132 + 104))(v127, *v104, v133);
    uint64_t v107 = (uint64_t)v134;
    (*(void (**)(char *, char *, uint64_t))(v103 + 16))(v134, v105, v106);
    uint64_t v108 = v152;
    uint64_t v109 = (uint64_t)v126;
    sub_2180BC3FC(v107, (uint64_t)&v126[*(int *)(v152 + 36)], MEMORY[0x263F190D8]);
    *(void *)uint64_t v109 = v90;
    *(void *)(v109 + 8) = v92;
    *(unsigned char *)(v109 + 16) = v96;
    *(void *)(v109 + 24) = v94;
    sub_2180B3B68(v90, v92, v96);
    swift_bridgeObjectRetain();
    sub_2180BC794(v107, MEMORY[0x263F190D8]);
    (*(void (**)(char *, uint64_t))(v103 + 8))(v105, v106);
    sub_2180B3A74(v90, v92, v96);
    swift_bridgeObjectRelease();
    uint64_t v110 = v125;
    sub_2180AE460(v109, v125, &qword_267BBDBD0);
    uint64_t v111 = v136;
    sub_2180AE460(v110, v136, &qword_267BBDBD0);
    uint64_t v112 = 0;
    uint64_t v113 = v139;
    uint64_t v114 = v138;
  }
  else
  {
LABEL_16:
    uint64_t v112 = 1;
    uint64_t v113 = v139;
    uint64_t v114 = v138;
    uint64_t v108 = v152;
    uint64_t v111 = v136;
  }
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v135)(v111, v112, 1, v108);
  uint64_t v115 = (uint64_t)v150;
  sub_2180B3870((uint64_t)v150, v113, &qword_267BBDBD8);
  uint64_t v116 = v153;
  uint64_t v117 = v147;
  sub_2180BC3FC(v153, v147, type metadata accessor for SharingOptionsGroupsView.GroupView);
  sub_2180B3870(v111, v114, &qword_267BBDBD8);
  uint64_t v118 = v148;
  sub_2180B3870(v113, v148, &qword_267BBDBD8);
  uint64_t v119 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDBE0);
  sub_2180BC3FC(v117, v118 + *(int *)(v119 + 48), type metadata accessor for SharingOptionsGroupsView.GroupView);
  sub_2180B3870(v114, v118 + *(int *)(v119 + 64), &qword_267BBDBD8);
  sub_2180AECB4(v111, &qword_267BBDBD8);
  sub_2180BC794(v116, type metadata accessor for SharingOptionsGroupsView.GroupView);
  sub_2180AECB4(v115, &qword_267BBDBD8);
  sub_2180AECB4(v114, &qword_267BBDBD8);
  sub_2180BC794(v117, type metadata accessor for SharingOptionsGroupsView.GroupView);
  return sub_2180AECB4(v113, &qword_267BBDBD8);
}

uint64_t sub_2180B70B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, char a4@<W3>, void *a5@<X4>, long long *a6@<X6>, uint64_t a7@<X8>)
{
  long long v20 = a6[1];
  long long v21 = *a6;
  uint64_t v9 = *((void *)a6 + 4);
  uint64_t v10 = *((void *)a6 + 5);
  char v11 = *((unsigned char *)a6 + 48);
  *(void *)a7 = a1;
  *(void *)(a7 + 8) = a2;
  *(unsigned char *)(a7 + 17) = a3 & 1;
  *(unsigned char *)(a7 + 16) = a4 & 1;
  *(void *)(a7 + 24) = a5;
  uint64_t v12 = type metadata accessor for SharingOptionsGroupsView.GroupView(0);
  type metadata accessor for SharingOptionsObservableModel();
  sub_2180B9EC4(&qword_267BBD670, (void (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_2180CFD50();
  uint64_t v13 = a7 + *(int *)(v12 + 36);
  *(_OWORD *)uint64_t v13 = v21;
  *(_OWORD *)(v13 + 16) = v20;
  *(void *)(v13 + 32) = v9;
  *(void *)(v13 + 40) = v10;
  *(unsigned char *)(v13 + 48) = v11;
  uint64_t v14 = a5[2];
  if (v14)
  {
    uint64_t v15 = a5 + 5;
    while (*((unsigned char *)v15 + 40))
    {
      v15 += 7;
      if (!--v14)
      {
        uint64_t v17 = a5[4];
        unint64_t v16 = a5[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_release();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        goto LABEL_8;
      }
    }
    uint64_t v17 = *(v15 - 1);
    unint64_t v16 = *v15;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t result = swift_release();
  }
  else
  {
    swift_release();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v17 = 0;
    unint64_t v16 = 0xE000000000000000;
  }
LABEL_8:
  uint64_t v19 = (void *)(a7 + *(int *)(v12 + 40));
  *uint64_t v19 = v17;
  v19[1] = v16;
  v19[2] = 0;
  return result;
}

uint64_t sub_2180B7260()
{
  type metadata accessor for SharingOptionsGroupsView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD840);
  sub_2180CFD30();
  swift_getKeyPath();
  sub_2180B9EC4(&qword_267BBD670, (void (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel);
  sub_2180CF610();
  swift_release();
  swift_beginAccess();
  double v1 = *(double *)(v5 + 72);
  double v0 = *(double *)(v5 + 80);
  swift_release();
  if (v1 == 0.0 && v0 == 0.0)
  {
    sub_2180CFD30();
    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath);
    sub_2180CF600();
    swift_release();
  }
  else
  {
    sub_2180CFD30();
    sub_2180CFD30();
    swift_getKeyPath();
    sub_2180CF610();
    swift_release();
    swift_beginAccess();
    swift_release();
    uint64_t v3 = swift_getKeyPath();
    MEMORY[0x270FA5388](v3);
    sub_2180CF600();
    swift_release();
  }
  return swift_release();
}

uint64_t sub_2180B7524(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SharingOptionsGroupsView(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD840);
  sub_2180CFD30();
  swift_getKeyPath();
  sub_2180B9EC4(&qword_267BBD670, (void (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel);
  sub_2180CF610();
  swift_release();
  uint64_t v5 = *(void *)(v10 + 152);
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v10 = v5;
  sub_2180BC3FC(a1, (uint64_t)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for SharingOptionsGroupsView);
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = swift_allocObject();
  sub_2180BC468((uint64_t)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6, type metadata accessor for SharingOptionsGroupsView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDBA8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD9D8);
  sub_2180AEE00(&qword_267BBDBB8, &qword_267BBDBA8);
  sub_2180B9F1C();
  sub_2180BC4E8();
  return sub_2180CFD10();
}

uint64_t sub_2180B777C@<X0>(long long *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD9E8);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD9D8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v13 = a1[1];
  long long v53 = *a1;
  long long v54 = v13;
  v55[0] = a1[2];
  *(_OWORD *)((char *)v55 + 9) = *(long long *)((char *)a1 + 41);
  uint64_t v44 = &v53;
  uint64_t v45 = a2;
  if (!*((void *)&v13 + 1)) {
    goto LABEL_6;
  }
  uint64_t v14 = HIBYTE(*((void *)&v13 + 1)) & 0xFLL;
  if ((*((void *)&v13 + 1) & 0x2000000000000000) == 0) {
    uint64_t v14 = v54 & 0xFFFFFFFFFFFFLL;
  }
  if (v14)
  {
    uint64_t v49 = v54;
    uint64_t v50 = *((void *)&v13 + 1);
    sub_2180B363C();
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_2180CFB20();
    uint64_t v19 = v18 & 1;
  }
  else
  {
LABEL_6:
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    uint64_t v19 = 0;
    uint64_t v17 = 0;
  }
  uint64_t v49 = v15;
  uint64_t v50 = v16;
  uint64_t v51 = v19;
  uint64_t v52 = v17;
  uint64_t v43 = a3;
  uint64_t v42 = v6;
  uint64_t v41 = v7;
  uint64_t v40 = v10;
  if (!*((void *)&v55[0] + 1)) {
    goto LABEL_12;
  }
  uint64_t v20 = HIBYTE(v55[0]) & 0xF;
  if ((*((void *)&v55[0] + 1) & 0x2000000000000000) == 0) {
    uint64_t v20 = *(void *)&v55[0] & 0xFFFFFFFFFFFFLL;
  }
  if (v20)
  {
    long long v46 = v55[0];
    sub_2180B363C();
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_2180CFB20();
    uint64_t v25 = v24 & 1;
  }
  else
  {
LABEL_12:
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    uint64_t v25 = 0;
    uint64_t v23 = 0;
  }
  *(void *)&long long v46 = v21;
  *((void *)&v46 + 1) = v22;
  uint64_t v47 = v25;
  uint64_t v48 = v23;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD918);
  type metadata accessor for SharingOptionsGroupsView.GroupView(0);
  sub_2180B379C();
  sub_2180B9EC4(&qword_267BBD9F0, (void (*)(uint64_t))type metadata accessor for SharingOptionsGroupsView.GroupView);
  sub_2180CFD20();
  type metadata accessor for SharingOptionsGroupsView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD840);
  sub_2180CFD30();
  uint64_t v26 = v49;
  swift_getKeyPath();
  uint64_t v49 = v26;
  sub_2180B9EC4(&qword_267BBD670, (void (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel);
  sub_2180CF610();
  swift_release();
  uint64_t v27 = *(void *)(v26 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__disableGroupWithID + 8);
  swift_release();
  if (!v27)
  {
    char v32 = 0;
    uint64_t v33 = v43;
    uint64_t v34 = v42;
    uint64_t v35 = v41;
    uint64_t v36 = v40;
LABEL_20:
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v38 = swift_allocObject();
    *(unsigned char *)(v38 + 16) = v32 & 1;
    (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v12, v9, v34);
    uint64_t v39 = (uint64_t *)&v12[*(int *)(v36 + 36)];
    *uint64_t v39 = KeyPath;
    v39[1] = (uint64_t)sub_2180BC93C;
    v39[2] = v38;
    (*(void (**)(char *, uint64_t))(v35 + 8))(v9, v34);
    return sub_2180AE460((uint64_t)v12, v33, &qword_267BBD9D8);
  }
  sub_2180CFD30();
  uint64_t v28 = v49;
  swift_getKeyPath();
  uint64_t v49 = v28;
  sub_2180CF610();
  swift_release();
  unint64_t v30 = *(void *)(v28 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__disableGroupWithID);
  unint64_t v29 = *(void *)(v28 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__disableGroupWithID + 8);
  swift_bridgeObjectRetain();
  uint64_t result = swift_release();
  if (v29)
  {
    if (__PAIR128__(v29, v30) == v53) {
      char v32 = 1;
    }
    else {
      char v32 = sub_2180D0250();
    }
    uint64_t v33 = v43;
    uint64_t v34 = v42;
    uint64_t v35 = v41;
    uint64_t v36 = v40;
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
  __break(1u);
  return result;
}

uint64_t sub_2180B7C84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v12 = a2;
  uint64_t v16 = a3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD840);
  uint64_t v14 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v15 = *(void *)a1;
  uint64_t v13 = v7;
  type metadata accessor for SharingOptionsGroupsView(0);
  type metadata accessor for UserInterface(0);
  sub_2180B9EC4(&qword_267BBD9B8, (void (*)(uint64_t))type metadata accessor for UserInterface);
  swift_bridgeObjectRetain();
  sub_2180CF7F0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2180CF720();
  swift_release();
  swift_release();
  swift_release();
  char v8 = v19;
  char v9 = *(unsigned char *)(a1 + 56);
  uint64_t v10 = *(void **)(a1 + 48);
  swift_bridgeObjectRetain();
  sub_2180CFD30();
  sub_2180CFD40();
  swift_getKeyPath();
  sub_2180CFD60();
  swift_release();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v6, v4);
  v17[0] = v19;
  v17[1] = v20;
  void v17[2] = v21;
  char v18 = v22;
  return sub_2180B70B4(v15, v13, v8, v9, v10, v17, v16);
}

uint64_t sub_2180B7EEC()
{
  return swift_bridgeObjectRelease();
}

double sub_2180B7FDC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_2180CF970();
  sub_2180B80A8(a1, (uint64_t)v10);
  *(_OWORD *)&v11[71] = v10[4];
  *(_OWORD *)&v11[87] = v10[5];
  *(_OWORD *)&v11[103] = v10[6];
  *(_OWORD *)&v11[119] = v10[7];
  *(_OWORD *)&v11[7] = v10[0];
  *(_OWORD *)&v11[23] = v10[1];
  *(_OWORD *)&v11[39] = v10[2];
  *(_OWORD *)&v11[55] = v10[3];
  long long v5 = *(_OWORD *)&v11[64];
  *(_OWORD *)(a2 + 97) = *(_OWORD *)&v11[80];
  long long v6 = *(_OWORD *)&v11[112];
  *(_OWORD *)(a2 + 113) = *(_OWORD *)&v11[96];
  *(_OWORD *)(a2 + 129) = v6;
  long long v7 = *(_OWORD *)v11;
  *(_OWORD *)(a2 + 33) = *(_OWORD *)&v11[16];
  double result = *(double *)&v11[32];
  long long v9 = *(_OWORD *)&v11[48];
  *(_OWORD *)(a2 + 49) = *(_OWORD *)&v11[32];
  *(_OWORD *)(a2 + 65) = v9;
  *(_OWORD *)(a2 + 81) = v5;
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 1;
  *(void *)(a2 + 144) = *(void *)&v11[127];
  *(_OWORD *)(a2 + 17) = v7;
  return result;
}

uint64_t sub_2180B80A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_2180CF990();
  sub_2180B8248(a1, (uint64_t)v17);
  uint64_t v5 = v17[0];
  uint64_t v6 = v17[1];
  char v7 = v18;
  uint64_t v8 = v19;
  uint64_t v16 = v20;
  uint64_t v9 = v21;
  uint64_t v10 = v22;
  uint64_t v11 = v23;
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v15 = sub_2180CFC40();
    uint64_t v14 = sub_2180CFBF0();
    uint64_t KeyPath = swift_getKeyPath();
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t KeyPath = 0;
  }
  LOBYTE(v17[0]) = 1;
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 1;
  *(void *)(a2 + 24) = v5;
  *(void *)(a2 + 32) = v6;
  *(unsigned char *)(a2 + 40) = v7;
  *(void *)(a2 + 48) = v8;
  *(void *)(a2 + 56) = v16;
  *(void *)(a2 + 64) = v9;
  *(void *)(a2 + 72) = v10;
  *(void *)(a2 + 80) = v11;
  *(void *)(a2 + 88) = 0;
  *(unsigned char *)(a2 + 96) = 1;
  *(void *)(a2 + 104) = v15;
  *(void *)(a2 + 112) = KeyPath;
  *(void *)(a2 + 120) = v14;
  sub_2180B3B68(v5, v6, v7);
  swift_bridgeObjectRetain();
  sub_2180BD0B8(v16, v9, v10, v11);
  sub_2180BD0FC(v15);
  sub_2180BD14C(v15);
  sub_2180B3A74(v5, v6, v7);
  swift_bridgeObjectRelease();

  return sub_2180BD198(v16, v9, v10, v11);
}

uint64_t sub_2180B8248@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_2180B363C();
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_2180CFB20();
  uint64_t v6 = v5;
  char v8 = v7 & 1;
  sub_2180CFC10();
  uint64_t v9 = sub_2180CFAF0();
  uint64_t v11 = v10;
  char v39 = v12;
  uint64_t v40 = v13;
  swift_release();
  sub_2180B3A74(v4, v6, v8);
  swift_bridgeObjectRelease();
  unint64_t v14 = *(void *)(a1 + 40);
  if (!v14) {
    goto LABEL_6;
  }
  uint64_t v15 = HIBYTE(v14) & 0xF;
  if ((v14 & 0x2000000000000000) == 0) {
    uint64_t v15 = *(void *)(a1 + 32) & 0xFFFFFFFFFFFFLL;
  }
  if (v15)
  {
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_2180CFB20();
    uint64_t v18 = v17;
    char v20 = v19 & 1;
    sub_2180CFAA0();
    uint64_t v37 = v11;
    uint64_t v38 = v9;
    uint64_t v21 = sub_2180CFB00();
    uint64_t v23 = v22;
    char v25 = v24;
    swift_release();
    char v36 = v25 & 1;
    sub_2180B3A74(v16, v18, v20);
    swift_bridgeObjectRelease();
    sub_2180CFC20();
    uint64_t v26 = sub_2180CFAF0();
    uint64_t v28 = v27;
    LOBYTE(v18) = v29;
    uint64_t v31 = v30;
    swift_release();
    uint64_t v32 = v18 & 1;
    uint64_t v33 = v21;
    uint64_t v34 = v23;
    uint64_t v11 = v37;
    uint64_t v9 = v38;
    sub_2180B3A74(v33, v34, v36);
    swift_bridgeObjectRelease();
  }
  else
  {
LABEL_6:
    uint64_t v26 = 0;
    uint64_t v28 = 0;
    uint64_t v32 = 0;
    uint64_t v31 = 0;
  }
  *(void *)a2 = v9;
  *(void *)(a2 + 8) = v11;
  *(unsigned char *)(a2 + 16) = v39 & 1;
  *(void *)(a2 + 24) = v40;
  *(void *)(a2 + 32) = v26;
  *(void *)(a2 + 40) = v28;
  *(void *)(a2 + 48) = v32;
  *(void *)(a2 + 56) = v31;
  sub_2180B3B68(v9, v11, v39 & 1);
  swift_bridgeObjectRetain();
  sub_2180BD0B8(v26, v28, v32, v31);
  sub_2180BD198(v26, v28, v32, v31);
  sub_2180B3A74(v9, v11, v39 & 1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2180B84A0()
{
  long long v1 = *(_OWORD *)(v0 + 48);
  _OWORD v7[2] = *(_OWORD *)(v0 + 32);
  _OWORD v7[3] = v1;
  uint64_t v8 = *(void *)(v0 + 64);
  long long v2 = *(_OWORD *)(v0 + 16);
  v7[0] = *(_OWORD *)v0;
  v7[1] = v2;
  uint64_t v3 = swift_allocObject();
  long long v4 = *(_OWORD *)(v0 + 48);
  *(_OWORD *)(v3 + 48) = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v3 + 64) = v4;
  *(void *)(v3 + 80) = *(void *)(v0 + 64);
  long long v5 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)v0;
  *(_OWORD *)(v3 + 32) = v5;
  sub_2180BD060((uint64_t)v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDBF8);
  sub_2180AEE00(&qword_267BBDC00, &qword_267BBDBF8);
  return sub_2180CFCA0();
}

uint64_t sub_2180B85A0@<X0>(uint64_t a1@<X8>)
{
  v10[1] = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDC08);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  long long v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v14 = v1[3];
  long long v12 = v1[3];
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDC10);
  sub_2180CFC80();
  uint64_t v11 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDC18);
  sub_2180AEE00(&qword_267BBDC20, &qword_267BBDC18);
  sub_2180CFCD0();
  long long v13 = v14;
  sub_2180CFC60();
  LOBYTE(v13) = v12;
  uint64_t v6 = (_OWORD *)swift_allocObject();
  long long v7 = v1[3];
  v6[3] = v1[2];
  v6[4] = v7;
  v6[5] = v1[4];
  long long v8 = v1[1];
  v6[1] = *v1;
  _OWORD v6[2] = v8;
  sub_2180BD2C8((uint64_t)v1);
  sub_2180AEE00(&qword_267BBDC28, &qword_267BBDC08);
  sub_2180CFBE0();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

__n128 sub_2180B87F0@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_2180CF990();
  sub_2180B8868(a1, (uint64_t)&v10);
  char v5 = v11;
  uint64_t v6 = v12;
  __n128 result = v10;
  long long v8 = v13;
  long long v9 = v14;
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 1;
  *(__n128 *)(a2 + 24) = result;
  *(unsigned char *)(a2 + 40) = v5;
  *(void *)(a2 + 48) = v6;
  *(_OWORD *)(a2 + 56) = v8;
  *(_OWORD *)(a2 + 72) = v9;
  return result;
}

uint64_t sub_2180B8868@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_2180B363C();
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_2180CFB20();
  uint64_t v6 = v5;
  char v8 = v7;
  uint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 40);
  if (!v11) {
    goto LABEL_6;
  }
  uint64_t v12 = HIBYTE(v11) & 0xF;
  if ((v11 & 0x2000000000000000) == 0) {
    uint64_t v12 = *(void *)(a1 + 32) & 0xFFFFFFFFFFFFLL;
  }
  if (v12)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_2180CFB20();
    uint64_t v15 = v14;
    uint64_t v17 = v16;
    uint64_t v19 = v18 & 1;
  }
  else
  {
LABEL_6:
    uint64_t v13 = 0;
    uint64_t v15 = 0;
    uint64_t v19 = 0;
    uint64_t v17 = 0;
  }
  char v20 = v8 & 1;
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = v6;
  *(unsigned char *)(a2 + 16) = v20;
  *(void *)(a2 + 24) = v10;
  *(void *)(a2 + 32) = v13;
  *(void *)(a2 + 40) = v15;
  *(void *)(a2 + 48) = v19;
  *(void *)(a2 + 56) = v17;
  sub_2180B3B68(v4, v6, v20);
  swift_bridgeObjectRetain();
  sub_2180BD0B8(v13, v15, v19, v17);
  sub_2180BD198(v13, v15, v19, v17);
  sub_2180B3A74(v4, v6, v20);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2180B89C0@<X0>(uint64_t a1@<X8>)
{
  return sub_2180B85A0(a1);
}

uint64_t sub_2180B8A04@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v74 = a1;
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDAC8);
  uint64_t v63 = *(void *)(v72 - 8);
  MEMORY[0x270FA5388](v72);
  uint64_t v60 = (char *)&v55 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDAD0);
  MEMORY[0x270FA5388](v68);
  uint64_t v71 = (char *)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDAD8);
  uint64_t v64 = *(void *)(v67 - 8);
  MEMORY[0x270FA5388](v67);
  char v62 = (char *)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDAE0);
  uint64_t v66 = *(void *)(v69 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v69);
  char v61 = (char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v65 = (char *)&v55 - v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDAE8);
  MEMORY[0x270FA5388](v9);
  uint64_t v70 = (char *)&v55 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDAF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v55 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for SharingOptionsGroupsView.GroupView(0);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(void *)(v15 + 64);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDAF8);
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v55 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  LODWORD(v20) = *(unsigned __int8 *)(v2 + 16);
  uint64_t v73 = v9;
  if (v20 == 1)
  {
    *(void *)&unsigned long long v77 = *(void *)(v2 + 24);
    uint64_t v22 = v2;
    uint64_t v23 = v19;
    sub_2180BC3FC(v22, (uint64_t)&v55 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for SharingOptionsGroupsView.GroupView);
    unint64_t v24 = (*(unsigned __int8 *)(v15 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
    uint64_t v25 = swift_allocObject();
    sub_2180BC468((uint64_t)&v55 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v25 + v24, type metadata accessor for SharingOptionsGroupsView.GroupView);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDB00);
    sub_2180AEE00(&qword_267BBDB08, &qword_267BBDB00);
    sub_2180BBE10();
    sub_2180BBD44();
    sub_2180CFD10();
    (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v13, v21, v23);
    swift_storeEnumTagMultiPayload();
    sub_2180BBD98(&qword_267BBDB30, &qword_267BBDAF8, (void (*)(void))sub_2180BBE10);
    sub_2180BBE64();
    sub_2180CF9B0();
    return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v21, v23);
  }
  else
  {
    uint64_t v56 = v15;
    uint64_t v57 = v11;
    uint64_t v58 = v19;
    uint64_t v59 = v13;
    if (*(unsigned char *)(v2 + 17))
    {
      *(void *)&unsigned long long v77 = *(void *)(v2 + 24);
      sub_2180BC3FC(v2, (uint64_t)&v55 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for SharingOptionsGroupsView.GroupView);
      unint64_t v27 = (*(unsigned __int8 *)(v56 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80);
      uint64_t v28 = swift_allocObject();
      sub_2180BC468((uint64_t)&v55 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v28 + v27, type metadata accessor for SharingOptionsGroupsView.GroupView);
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDB00);
      sub_2180AEE00(&qword_267BBDB08, &qword_267BBDB00);
      sub_2180BBCF0();
      sub_2180BBD44();
      uint64_t v29 = MEMORY[0x263F8D310];
      uint64_t v30 = v60;
      sub_2180CFD10();
      uint64_t v31 = v63;
      uint64_t v32 = v72;
      (*(void (**)(char *, char *, uint64_t))(v63 + 16))(v71, v30, v72);
      swift_storeEnumTagMultiPayload();
      uint64_t v33 = sub_2180AEE00(&qword_267BBDB20, &qword_267BBDAD8);
      *(void *)&unsigned long long v77 = v67;
      *((void *)&v77 + 1) = v29;
      uint64_t v78 = v33;
      uint64_t v79 = MEMORY[0x263F8D338];
      swift_getOpaqueTypeConformance2();
      sub_2180BBD98(&qword_267BBDB28, &qword_267BBDAC8, (void (*)(void))sub_2180BBCF0);
      uint64_t v34 = (uint64_t)v70;
      sub_2180CF9B0();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v30, v32);
    }
    else
    {
      uint64_t v35 = v2 + *(int *)(v14 + 40);
      uint64_t v36 = *(void *)(v35 + 16);
      unsigned long long v75 = *(_OWORD *)v35;
      uint64_t v76 = v36;
      uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDB48);
      uint64_t v37 = sub_2180CFC80();
      uint64_t v60 = (char *)&v55;
      unint64_t v39 = *((void *)&v77 + 1);
      unint64_t v38 = v77;
      uint64_t v40 = v79;
      MEMORY[0x270FA5388](v37);
      unsigned long long v77 = __PAIR128__(v39, v38);
      uint64_t v78 = v41;
      uint64_t v79 = v40;
      swift_retain();
      swift_retain();
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDB50);
      sub_2180BBD98(&qword_267BBDB58, &qword_267BBDB50, (void (*)(void))sub_2180BBF80);
      uint64_t v42 = v62;
      uint64_t v43 = MEMORY[0x263F8D310];
      sub_2180CFCC0();
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      uint64_t v44 = *(void *)(v35 + 16);
      unsigned long long v77 = *(_OWORD *)v35;
      uint64_t v78 = v44;
      sub_2180CFC60();
      unsigned long long v77 = v75;
      sub_2180BC3FC(v2, (uint64_t)&v55 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for SharingOptionsGroupsView.GroupView);
      unint64_t v45 = (*(unsigned __int8 *)(v56 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80);
      uint64_t v46 = swift_allocObject();
      sub_2180BC468((uint64_t)&v55 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v46 + v45, type metadata accessor for SharingOptionsGroupsView.GroupView);
      uint64_t v47 = sub_2180AEE00(&qword_267BBDB20, &qword_267BBDAD8);
      uint64_t v48 = MEMORY[0x263F8D338];
      uint64_t v49 = v61;
      uint64_t v50 = v67;
      sub_2180CFBE0();
      swift_release();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v64 + 8))(v42, v50);
      uint64_t v52 = v65;
      uint64_t v51 = v66;
      long long v53 = v49;
      uint64_t v54 = v69;
      (*(void (**)(char *, char *, uint64_t))(v66 + 32))(v65, v53, v69);
      (*(void (**)(char *, char *, uint64_t))(v51 + 16))(v71, v52, v54);
      swift_storeEnumTagMultiPayload();
      *(void *)&unsigned long long v77 = v50;
      *((void *)&v77 + 1) = v43;
      uint64_t v78 = v47;
      uint64_t v79 = v48;
      swift_getOpaqueTypeConformance2();
      sub_2180BBD98(&qword_267BBDB28, &qword_267BBDAC8, (void (*)(void))sub_2180BBCF0);
      uint64_t v34 = (uint64_t)v70;
      sub_2180CF9B0();
      (*(void (**)(char *, uint64_t))(v51 + 8))(v52, v54);
    }
    sub_2180B3870(v34, (uint64_t)v59, &qword_267BBDAE8);
    swift_storeEnumTagMultiPayload();
    sub_2180BBD98(&qword_267BBDB30, &qword_267BBDAF8, (void (*)(void))sub_2180BBE10);
    sub_2180BBE64();
    sub_2180CF9B0();
    return sub_2180AECB4(v34, &qword_267BBDAE8);
  }
}

uint64_t sub_2180B95AC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for SharingOptionsGroupsView.GroupView(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v10 = *a1;
  uint64_t v9 = a1[1];
  uint64_t v11 = a1[2];
  uint64_t v12 = a1[3];
  uint64_t v13 = a1[5];
  uint64_t v20 = a1[4];
  uint64_t v21 = v11;
  LOBYTE(a1) = *((unsigned char *)a1 + 48) == 0;
  sub_2180BC3FC(a2, (uint64_t)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for SharingOptionsGroupsView.GroupView);
  unint64_t v14 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v15 = swift_allocObject();
  sub_2180BC468((uint64_t)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v15 + v14, type metadata accessor for SharingOptionsGroupsView.GroupView);
  char v22 = (char)a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t result = sub_2180CFC50();
  char v17 = v23;
  uint64_t v18 = v24;
  *(void *)a3 = v10;
  *(void *)(a3 + 8) = v9;
  *(void *)(a3 + 16) = v21;
  *(void *)(a3 + 24) = v12;
  *(void *)(a3 + 32) = v20;
  *(void *)(a3 + 40) = v13;
  *(unsigned char *)(a3 + 48) = v17;
  *(void *)(a3 + 56) = v18;
  *(void *)(a3 + 64) = sub_2180BC31C;
  *(void *)(a3 + 72) = v15;
  return result;
}

uint64_t sub_2180B9754()
{
  return sub_2180CFCF0();
}

uint64_t sub_2180B9800()
{
  return sub_2180CFD10();
}

uint64_t sub_2180B98DC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  sub_2180B363C();
  swift_bridgeObjectRetain();
  *(void *)a2 = sub_2180CFB20();
  *(void *)(a2 + 8) = v5;
  *(unsigned char *)(a2 + 16) = v6 & 1;
  *(void *)(a2 + 24) = v7;
  *(void *)(a2 + 32) = v4;
  *(void *)(a2 + 40) = v3;
  *(void *)(a2 + 48) = v4;
  *(void *)(a2 + 56) = v3;
  return swift_bridgeObjectRetain_n();
}

uint64_t sub_2180B9968(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4 = type metadata accessor for SharingOptionsGroupsView.GroupView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD840);
  sub_2180CFD30();
  uint64_t v5 = (char *)a3 + *(int *)(v4 + 40);
  long long v6 = *(_OWORD *)v5;
  uint64_t v7 = *((void *)v5 + 2);
  long long v12 = v6;
  *(void *)&long long v13 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDB48);
  sub_2180CFC80();
  uint64_t v11 = *a3;
  uint64_t v10 = a3[1];
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD760);
  sub_2180CFD00();
  long long v8 = v17;
  long long v12 = v16;
  long long v13 = v17;
  long long v14 = v18;
  char v15 = v19;
  sub_2180A5E98(v16, *((uint64_t *)&v16 + 1), v17, *((uint64_t *)&v17 + 1), 1, v11, v10, &v12);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  return sub_2180AB958(v8, *((uint64_t *)&v8 + 1));
}

uint64_t sub_2180B9AF4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for SharingOptionsGroupsView.GroupView(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v10 = *a1;
  uint64_t v9 = a1[1];
  uint64_t v11 = a1[2];
  uint64_t v12 = a1[3];
  uint64_t v13 = a1[5];
  uint64_t v17 = a1[4];
  uint64_t v18 = v11;
  LOBYTE(a1) = *((unsigned char *)a1 + 48) == 0;
  sub_2180BC3FC(a2, (uint64_t)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for SharingOptionsGroupsView.GroupView);
  unint64_t v14 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v15 = swift_allocObject();
  sub_2180BC468((uint64_t)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v15 + v14, type metadata accessor for SharingOptionsGroupsView.GroupView);
  *(void *)a3 = v10;
  *(void *)(a3 + 8) = v9;
  *(void *)(a3 + 16) = v18;
  *(void *)(a3 + 24) = v12;
  *(void *)(a3 + 32) = v17;
  *(void *)(a3 + 40) = v13;
  *(unsigned char *)(a3 + 48) = (_BYTE)a1;
  *(void *)(a3 + 56) = sub_2180BC338;
  *(void *)(a3 + 64) = v15;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2180B9C78(uint64_t a1, uint64_t a2, char a3, uint64_t *a4)
{
  type metadata accessor for SharingOptionsGroupsView.GroupView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD840);
  sub_2180CFD30();
  uint64_t v5 = a4[1];
  uint64_t v8 = *a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD760);
  sub_2180CFD00();
  long long v6 = v15;
  v12[0] = v14;
  v12[1] = v15;
  v12[2] = v16;
  char v13 = v17;
  sub_2180A6A08(a1, a2, a3, v8, v5, v12);
  swift_release();
  swift_release();
  swift_release();
  return sub_2180AB958(v6, *((uint64_t *)&v6 + 1));
}

uint64_t sub_2180B9DA8@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2180CF720();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2180B9E28()
{
  return sub_2180CF730();
}

uint64_t type metadata accessor for SharingOptionsGroupsView(uint64_t a1)
{
  return sub_2180B077C(a1, (uint64_t *)&unk_267BBDA90);
}

uint64_t sub_2180B9EC4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2180B9F14()
{
  return sub_2180B7524(*(void *)(v0 + 16));
}

unint64_t sub_2180B9F1C()
{
  unint64_t result = qword_267BBD9D0;
  if (!qword_267BBD9D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BBD9D8);
    sub_2180B9FBC();
    sub_2180AEE00(&qword_267BBD9F8, &qword_267BBDA00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBD9D0);
  }
  return result;
}

unint64_t sub_2180B9FBC()
{
  unint64_t result = qword_267BBD9E0;
  if (!qword_267BBD9E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BBD9E8);
    sub_2180B379C();
    sub_2180B9EC4(&qword_267BBD9F0, (void (*)(uint64_t))type metadata accessor for SharingOptionsGroupsView.GroupView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBD9E0);
  }
  return result;
}

uint64_t type metadata accessor for SharingOptionsGroupsView.GroupView(uint64_t a1)
{
  return sub_2180B077C(a1, (uint64_t *)&unk_267BBDAB8);
}

unint64_t sub_2180BA09C()
{
  unint64_t result = qword_267BBDA08;
  if (!qword_267BBDA08)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BBD990);
    sub_2180AEE00(&qword_267BBDA10, &qword_267BBD988);
    sub_2180B9EC4(&qword_267BBDA18, (void (*)(uint64_t))type metadata accessor for AlertViewModelAlert);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBDA08);
  }
  return result;
}

unint64_t sub_2180BA16C()
{
  unint64_t result = qword_267BBDA20;
  if (!qword_267BBDA20)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BBD9B0);
    sub_2180AEE00(&qword_267BBDA28, &qword_267BBD9A8);
    sub_2180B9EC4(&qword_267BBDA18, (void (*)(uint64_t))type metadata accessor for AlertViewModelAlert);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBDA20);
  }
  return result;
}

uint64_t sub_2180BA23C@<X0>(uint64_t a1@<X8>)
{
  return sub_2180B5BA8(*(void *)(v1 + 16), a1);
}

unint64_t sub_2180BA244()
{
  unint64_t result = qword_267BBDA38;
  if (!qword_267BBDA38)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BBDA30);
    sub_2180BA2E4();
    sub_2180AEE00(&qword_267BBDA88, &qword_267BBDDF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBDA38);
  }
  return result;
}

unint64_t sub_2180BA2E4()
{
  unint64_t result = qword_267BBDA40;
  if (!qword_267BBDA40)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BBDA48);
    sub_2180BA384();
    sub_2180AEE00(&qword_267BBDA80, (uint64_t *)&unk_267BBDDE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBDA40);
  }
  return result;
}

unint64_t sub_2180BA384()
{
  unint64_t result = qword_267BBDA50;
  if (!qword_267BBDA50)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BBDA58);
    sub_2180BA400();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBDA50);
  }
  return result;
}

unint64_t sub_2180BA400()
{
  unint64_t result = qword_267BBDA60;
  if (!qword_267BBDA60)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BBDA68);
    sub_2180AEE00(&qword_267BBDA70, &qword_267BBDA78);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBDA60);
  }
  return result;
}

uint64_t sub_2180BA4A0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for SharingOptionsGroupsView(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD830);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_2180CF7D0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = *(void *)v11;
    uint64_t v13 = *((void *)v11 + 1);
    char v14 = v11[16];
    sub_2180B0A30();
    *(void *)uint64_t v10 = v12;
    *((void *)v10 + 1) = v13;
    v10[16] = v14;
    uint64_t v15 = *(int *)(a3 + 24);
    long long v16 = (char *)a1 + v15;
    char v17 = (char *)a2 + v15;
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD840);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
  }
  return a1;
}

uint64_t destroy for SharingOptionsGroupsView(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD830);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_2180CF7D0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  sub_2180B053C();
  uint64_t v5 = a1 + *(int *)(a2 + 24);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD840);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

void *initializeWithCopy for SharingOptionsGroupsView(void *a1, void *a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD830);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_2180CF7D0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = *(void *)v9;
  uint64_t v11 = *((void *)v9 + 1);
  char v12 = v9[16];
  sub_2180B0A30();
  *(void *)uint64_t v8 = v10;
  *((void *)v8 + 1) = v11;
  v8[16] = v12;
  uint64_t v13 = *(int *)(a3 + 24);
  char v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD840);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  return a1;
}

void *assignWithCopy for SharingOptionsGroupsView(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_2180AECB4((uint64_t)a1, &qword_267BBD830);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD830);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_2180CF7D0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = *(void *)v9;
  uint64_t v11 = *((void *)v9 + 1);
  char v12 = v9[16];
  sub_2180B0A30();
  *(void *)uint64_t v8 = v10;
  *((void *)v8 + 1) = v11;
  v8[16] = v12;
  sub_2180B053C();
  uint64_t v13 = *(int *)(a3 + 24);
  char v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD840);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 24))(v14, v15, v16);
  return a1;
}

char *initializeWithTake for SharingOptionsGroupsView(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD830);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_2180CF7D0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = &a1[v8];
  uint64_t v11 = &a2[v8];
  *(_OWORD *)uint64_t v10 = *(_OWORD *)v11;
  v10[16] = v11[16];
  char v12 = &a1[v9];
  uint64_t v13 = &a2[v9];
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD840);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  return a1;
}

char *assignWithTake for SharingOptionsGroupsView(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_2180AECB4((uint64_t)a1, &qword_267BBD830);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD830);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_2180CF7D0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  char v11 = v10[16];
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  unsigned char v9[16] = v11;
  sub_2180B053C();
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD840);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  return a1;
}

uint64_t getEnumTagSinglePayload for SharingOptionsGroupsView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2180BAC88);
}

uint64_t sub_2180BAC88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD888);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 254)
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20) + 16);
    if (v10 > 1) {
      return (v10 ^ 0xFF) + 1;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD840);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 24);
    return v12(v14, a2, v13);
  }
}

uint64_t storeEnumTagSinglePayload for SharingOptionsGroupsView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2180BADCC);
}

uint64_t sub_2180BADCC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD888);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 254)
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20) + 16) = -(char)a2;
  }
  else
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD840);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 24);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

void sub_2180BAF00()
{
  sub_2180BB030(319, (unint64_t *)&qword_267BBD8A0, MEMORY[0x263F18520], MEMORY[0x263F185C8]);
  if (v0 <= 0x3F)
  {
    sub_2180BB030(319, &qword_267BBDAA0, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, MEMORY[0x263F1B870]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_2180BB030(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

unint64_t sub_2180BB098()
{
  unint64_t result = qword_267BBDAA8;
  if (!qword_267BBDAA8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BBDAB0);
    sub_2180BA16C();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BBD990);
    sub_2180BA09C();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBDAA8);
  }
  return result;
}

void *sub_2180BB150(void *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *a1 = *a2;
    uint64_t v4 = (void *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = a2[1];
    *uint64_t v4 = *a2;
    v4[1] = v7;
    *((unsigned char *)v4 + 16) = *((unsigned char *)a2 + 16);
    *((unsigned char *)v4 + 17) = *((unsigned char *)a2 + 17);
    uint64_t v8 = a3[8];
    uint64_t v9 = (char *)v4 + v8;
    uint64_t v10 = (uint64_t)a2 + v8;
    v4[3] = a2[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD840);
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = a3[9];
    uint64_t v13 = (char *)v4 + v12;
    uint64_t v14 = (uint64_t)a2 + v12;
    uint64_t v15 = *(uint64_t *)((char *)a2 + v12 + 8);
    *(void *)uint64_t v13 = *(uint64_t *)((char *)a2 + v12);
    *((void *)v13 + 1) = v15;
    uint64_t v16 = *(uint64_t *)((char *)a2 + v12 + 24);
    swift_retain();
    swift_retain();
    if (v16)
    {
      *((void *)v13 + 2) = *(void *)(v14 + 16);
      *((void *)v13 + 3) = v16;
      uint64_t v17 = *(void *)(v14 + 40);
      *((void *)v13 + 4) = *(void *)(v14 + 32);
      *((void *)v13 + 5) = v17;
      v13[48] = *(unsigned char *)(v14 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v19 = *(_OWORD *)(v14 + 32);
      *((_OWORD *)v13 + 1) = *(_OWORD *)(v14 + 16);
      *((_OWORD *)v13 + 2) = v19;
      v13[48] = *(unsigned char *)(v14 + 48);
    }
    uint64_t v20 = a3[10];
    uint64_t v21 = (void *)((char *)v4 + v20);
    char v22 = (uint64_t *)((char *)a2 + v20);
    uint64_t v23 = v22[1];
    *uint64_t v21 = *v22;
    v21[1] = v23;
    v21[2] = v22[2];
    swift_bridgeObjectRetain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_2180BB2EC(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD840);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 36);
  swift_release();
  swift_release();
  if (*(void *)(v6 + 24))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t sub_2180BB3BC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v7 = a3[8];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD840);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = a3[9];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = *(void *)(a2 + v11 + 8);
  *(void *)uint64_t v12 = *(void *)(a2 + v11);
  *(void *)(v12 + 8) = v14;
  uint64_t v15 = *(void *)(a2 + v11 + 24);
  swift_retain();
  swift_retain();
  if (v15)
  {
    *(void *)(v12 + 16) = *(void *)(v13 + 16);
    *(void *)(v12 + 24) = v15;
    uint64_t v16 = *(void *)(v13 + 40);
    *(void *)(v12 + 32) = *(void *)(v13 + 32);
    *(void *)(v12 + 40) = v16;
    *(unsigned char *)(v12 + 48) = *(unsigned char *)(v13 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v17 = *(_OWORD *)(v13 + 32);
    *(_OWORD *)(v12 + 16) = *(_OWORD *)(v13 + 16);
    *(_OWORD *)(v12 + 32) = v17;
    *(unsigned char *)(v12 + 48) = *(unsigned char *)(v13 + 48);
  }
  uint64_t v18 = a3[10];
  long long v19 = (void *)(a1 + v18);
  uint64_t v20 = (void *)(a2 + v18);
  uint64_t v21 = v20[1];
  *long long v19 = *v20;
  v19[1] = v21;
  v19[2] = v20[2];
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_2180BB50C(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[8];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD840);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[9];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  *(void *)(a1 + v10) = *(void *)(a2 + v10);
  swift_retain();
  swift_release();
  *(void *)(v11 + 8) = *(void *)(v12 + 8);
  swift_retain();
  swift_release();
  uint64_t v13 = (_OWORD *)(v11 + 16);
  uint64_t v14 = (_OWORD *)(v12 + 16);
  uint64_t v15 = *(void *)(v12 + 24);
  if (*(void *)(v11 + 24))
  {
    if (v15)
    {
      *(void *)(v11 + 16) = *(void *)(v12 + 16);
      *(void *)(v11 + 24) = *(void *)(v12 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(v11 + 32) = *(void *)(v12 + 32);
      *(void *)(v11 + 40) = *(void *)(v12 + 40);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(unsigned char *)(v11 + 48) = *(unsigned char *)(v12 + 48);
    }
    else
    {
      sub_2180BB72C(v11 + 16);
      char v16 = *(unsigned char *)(v12 + 48);
      long long v17 = *(_OWORD *)(v12 + 32);
      *uint64_t v13 = *v14;
      *(_OWORD *)(v11 + 32) = v17;
      *(unsigned char *)(v11 + 48) = v16;
    }
  }
  else if (v15)
  {
    *(void *)(v11 + 16) = *(void *)(v12 + 16);
    *(void *)(v11 + 24) = *(void *)(v12 + 24);
    *(void *)(v11 + 32) = *(void *)(v12 + 32);
    *(void *)(v11 + 40) = *(void *)(v12 + 40);
    *(unsigned char *)(v11 + 48) = *(unsigned char *)(v12 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v18 = *v14;
    long long v19 = *(_OWORD *)(v12 + 32);
    *(unsigned char *)(v11 + 48) = *(unsigned char *)(v12 + 48);
    *uint64_t v13 = v18;
    *(_OWORD *)(v11 + 32) = v19;
  }
  uint64_t v20 = a3[10];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = a2 + v20;
  *uint64_t v21 = *(void *)(a2 + v20);
  v21[1] = *(void *)(a2 + v20 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v21[2] = *(void *)(v22 + 16);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_2180BB72C(uint64_t a1)
{
  return a1;
}

uint64_t sub_2180BB780(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v6 = a3[8];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD840);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[9];
  uint64_t v11 = a3[10];
  uint64_t v12 = a1 + v10;
  uint64_t v13 = a2 + v10;
  long long v14 = *(_OWORD *)(v13 + 16);
  *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  *(_OWORD *)(v12 + 16) = v14;
  *(_OWORD *)(v12 + 32) = *(_OWORD *)(v13 + 32);
  *(unsigned char *)(v12 + 48) = *(unsigned char *)(v13 + 48);
  uint64_t v15 = a1 + v11;
  uint64_t v16 = a2 + v11;
  *(void *)(v15 + 16) = *(void *)(v16 + 16);
  *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
  return a1;
}

uint64_t sub_2180BB864(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[8];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD840);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[9];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  *(void *)(a1 + v11) = *(void *)(a2 + v11);
  swift_release();
  *(void *)(v12 + 8) = *(void *)(v13 + 8);
  swift_release();
  if (!*(void *)(v12 + 24)) {
    goto LABEL_5;
  }
  uint64_t v14 = *(void *)(v13 + 24);
  if (!v14)
  {
    sub_2180BB72C(v12 + 16);
LABEL_5:
    long long v16 = *(_OWORD *)(v13 + 32);
    *(_OWORD *)(v12 + 16) = *(_OWORD *)(v13 + 16);
    *(_OWORD *)(v12 + 32) = v16;
    *(unsigned char *)(v12 + 48) = *(unsigned char *)(v13 + 48);
    goto LABEL_6;
  }
  *(void *)(v12 + 16) = *(void *)(v13 + 16);
  *(void *)(v12 + 24) = v14;
  swift_bridgeObjectRelease();
  uint64_t v15 = *(void *)(v13 + 40);
  *(void *)(v12 + 32) = *(void *)(v13 + 32);
  *(void *)(v12 + 40) = v15;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v12 + 48) = *(unsigned char *)(v13 + 48);
LABEL_6:
  uint64_t v17 = a3[10];
  long long v18 = (void *)(a1 + v17);
  long long v19 = (void *)(a2 + v17);
  uint64_t v20 = v19[1];
  *long long v18 = *v19;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  v18[2] = v19[2];
  swift_release();
  return a1;
}

uint64_t sub_2180BB9D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2180BB9E8);
}

uint64_t sub_2180BB9E8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD840);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 32);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_2180BBA9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2180BBAB0);
}

uint64_t sub_2180BBAB0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD840);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 32);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_2180BBB5C()
{
  sub_2180BB030(319, &qword_267BBDAA0, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, MEMORY[0x263F1B870]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_2180BBC50()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2180BBC70@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for SharingOptionsGroupsView.GroupView(0) - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_2180B9AF4(a1, v6, a2);
}

unint64_t sub_2180BBCF0()
{
  unint64_t result = qword_267BBDB10;
  if (!qword_267BBDB10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBDB10);
  }
  return result;
}

unint64_t sub_2180BBD44()
{
  unint64_t result = qword_267BBDB18;
  if (!qword_267BBDB18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBDB18);
  }
  return result;
}

uint64_t sub_2180BBD98(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2180BBE10()
{
  unint64_t result = qword_267BBDB38;
  if (!qword_267BBDB38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBDB38);
  }
  return result;
}

unint64_t sub_2180BBE64()
{
  unint64_t result = qword_267BBDB40;
  if (!qword_267BBDB40)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BBDAE8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BBDAD8);
    sub_2180AEE00(&qword_267BBDB20, &qword_267BBDAD8);
    swift_getOpaqueTypeConformance2();
    sub_2180BBD98(&qword_267BBDB28, &qword_267BBDAC8, (void (*)(void))sub_2180BBCF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBDB40);
  }
  return result;
}

uint64_t sub_2180BBF78()
{
  return sub_2180B9800();
}

unint64_t sub_2180BBF80()
{
  unint64_t result = qword_267BBDB60;
  if (!qword_267BBDB60)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BBDB68);
    sub_2180BC020();
    sub_2180AEE00(&qword_267BBDB90, &qword_267BBDB98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBDB60);
  }
  return result;
}

unint64_t sub_2180BC020()
{
  unint64_t result = qword_267BBDB70;
  if (!qword_267BBDB70)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BBDB78);
    sub_2180AEE00(&qword_267BBDB80, &qword_267BBDB88);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBDB70);
  }
  return result;
}

uint64_t objectdestroyTm_0()
{
  uint64_t v1 = type metadata accessor for SharingOptionsGroupsView.GroupView(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 32);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD840);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = v0 + v3 + *(int *)(v1 + 36);
  swift_release();
  swift_release();
  if (*(void *)(v7 + 24))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_2180BC214(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(type metadata accessor for SharingOptionsGroupsView.GroupView(0) - 8);
  uint64_t v6 = (uint64_t *)(v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)));

  return sub_2180B9968(a1, a2, v6);
}

uint64_t sub_2180BC298@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for SharingOptionsGroupsView.GroupView(0) - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_2180B95AC(a1, v6, a2);
}

uint64_t sub_2180BC31C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2180BC350(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_2180B9754);
}

uint64_t sub_2180BC338(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2180BC350(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_2180B9C78);
}

uint64_t sub_2180BC350(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v8 = *(void *)(type metadata accessor for SharingOptionsGroupsView.GroupView(0) - 8);
  uint64_t v9 = v4 + ((*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));

  return a4(a1, a2, a3, v9);
}

uint64_t sub_2180BC3FC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2180BC468(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2180BC4D0(uint64_t a1)
{
  return sub_2180BC830(a1, (uint64_t (*)(uint64_t, uint64_t))sub_2180B6270);
}

unint64_t sub_2180BC4E8()
{
  unint64_t result = qword_267BBDBC8;
  if (!qword_267BBDBC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBDBC8);
  }
  return result;
}

uint64_t objectdestroy_43Tm()
{
  uint64_t v1 = type metadata accessor for SharingOptionsGroupsView(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD830);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_2180CF7D0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  sub_2180B053C();
  uint64_t v6 = v0 + v3 + *(int *)(v1 + 24);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD840);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_2180BC6B4()
{
  type metadata accessor for SharingOptionsGroupsView(0);

  return sub_2180B7260();
}

uint64_t sub_2180BC72C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2180BC764(double *a1)
{
  return sub_2180C25F4(a1, *(uint64_t (**)(double, double))(v1 + 16));
}

uint64_t sub_2180BC76C()
{
  return sub_2180A2DD4(*(void *)(v0 + 16), *(double *)(v0 + 24), *(double *)(v0 + 32));
}

uint64_t sub_2180BC794(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2180BC7F4()
{
  return sub_2180A38C8(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_2180BC818(uint64_t a1)
{
  return sub_2180BC830(a1, (uint64_t (*)(uint64_t, uint64_t))sub_2180B777C);
}

uint64_t sub_2180BC830(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(type metadata accessor for SharingOptionsGroupsView(0) - 8);
  uint64_t v5 = v2 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return a2(a1, v5);
}

uint64_t sub_2180BC8C4@<X0>(uint64_t a1@<X8>)
{
  return sub_2180B7C84(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_2180BC8D4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2180CF920();
  *a1 = result & 1;
  return result;
}

uint64_t sub_2180BC904()
{
  return sub_2180CF930();
}

uint64_t sub_2180BC92C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

unsigned char *sub_2180BC93C(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

uint64_t destroy for SharingOptionsGroupsView.GroupView.PickerRow()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for SharingOptionsGroupsView.GroupView.PickerRow(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for SharingOptionsGroupsView.GroupView.PickerRow(uint64_t a1, uint64_t a2)
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
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v4 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v4;
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

uint64_t assignWithTake for SharingOptionsGroupsView.GroupView.PickerRow(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SharingOptionsGroupsView.GroupView.PickerRow(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 72)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SharingOptionsGroupsView.GroupView.PickerRow(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SharingOptionsGroupsView.GroupView.PickerRow()
{
  return &type metadata for SharingOptionsGroupsView.GroupView.PickerRow;
}

uint64_t destroy for SharingOptionsGroupsView.GroupView.TogglesRow()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for SharingOptionsGroupsView.GroupView.TogglesRow(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v6 = *(void *)(a2 + 72);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for SharingOptionsGroupsView.GroupView.TogglesRow(uint64_t a1, uint64_t a2)
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
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  uint64_t v4 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v4;
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

uint64_t assignWithTake for SharingOptionsGroupsView.GroupView.TogglesRow(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  swift_release();
  uint64_t v7 = *(void *)(a2 + 72);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = v7;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SharingOptionsGroupsView.GroupView.TogglesRow(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SharingOptionsGroupsView.GroupView.TogglesRow(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 80) = 1;
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
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SharingOptionsGroupsView.GroupView.TogglesRow()
{
  return &type metadata for SharingOptionsGroupsView.GroupView.TogglesRow;
}

unint64_t sub_2180BCEF4()
{
  unint64_t result = qword_267BBDBE8;
  if (!qword_267BBDBE8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BBDBF0);
    sub_2180BBD98(&qword_267BBDB30, &qword_267BBDAF8, (void (*)(void))sub_2180BBE10);
    sub_2180BBE64();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBDBE8);
  }
  return result;
}

uint64_t sub_2180BCF94()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2180BCFB0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2180BCFCC()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 88, 7);
}

uint64_t sub_2180BD01C()
{
  return (*(uint64_t (**)(void, void, BOOL))(v0 + 72))(*(void *)(v0 + 16), *(void *)(v0 + 24), (*(unsigned char *)(v0 + 64) & 1) == 0);
}

double sub_2180BD058@<D0>(uint64_t a1@<X8>)
{
  return sub_2180B7FDC(*(void *)(v1 + 16), a1);
}

uint64_t sub_2180BD060(uint64_t a1)
{
  return a1;
}

uint64_t sub_2180BD0B8(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_2180B3B68(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_2180BD0FC(uint64_t result)
{
  if (result)
  {
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_2180BD14C(uint64_t result)
{
  if (result)
  {
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_2180BD198(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_2180B3A74(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2180BD1DC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2180CF8E0();
  *a1 = result;
  return result;
}

uint64_t sub_2180BD208()
{
  return sub_2180CF8F0();
}

double sub_2180BD234@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_2180B87F0(*(void *)(v1 + 16), a1).n128_u64[0];
  return result;
}

uint64_t sub_2180BD23C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 96, 7);
}

uint64_t sub_2180BD294(uint64_t a1, unsigned __int8 *a2)
{
  return (*(uint64_t (**)(void, void, void))(v2 + 80))(*(void *)(v2 + 16), *(void *)(v2 + 24), *a2);
}

uint64_t sub_2180BD2C8(uint64_t a1)
{
  return a1;
}

uint64_t sub_2180BD334()
{
  return sub_2180AEE00(&qword_267BBDC30, &qword_267BBDC38);
}

uint64_t sub_2180BD370()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2180BD408()
{
  return sub_2180BC76C();
}

uint64_t AddressingView.viewModel.getter()
{
  return sub_2180BD450(MEMORY[0x263F18660]);
}

uint64_t AddressingView.$viewModel.getter()
{
  return sub_2180BD450(MEMORY[0x263F18668]);
}

uint64_t sub_2180BD450(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v2 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v4 = *((unsigned __int8 *)v1 + 16);
  uint64_t v5 = type metadata accessor for AddressingViewModel();
  uint64_t v6 = sub_2180C2FB4(&qword_267BBDC40, (void (*)(uint64_t))type metadata accessor for AddressingViewModel);

  return a1(v2, v3, v4, v5, v6);
}

uint64_t AddressingView.init(viewModel:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = sub_2180B03E0;
  *(void *)(a2 + 8) = result;
  *(unsigned char *)(a2 + 16) = 0;
  return result;
}

uint64_t AddressingView.body.getter@<X0>(uint64_t a1@<X8>)
{
  sub_2180B0A30();
  type metadata accessor for AddressingViewModel();
  sub_2180C2FB4(&qword_267BBDC40, (void (*)(uint64_t))type metadata accessor for AddressingViewModel);
  sub_2180CF7F0();
  sub_2180B053C();
  uint64_t KeyPath = swift_getKeyPath();
  *(void *)(a1 + *(int *)(type metadata accessor for AddressingView_iOS(0) + 28)) = KeyPath;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDC48);
  swift_storeEnumTagMultiPayload();
  type metadata accessor for CGSize(0);
  sub_2180CFC50();
  *(_OWORD *)a1 = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = sub_2180BD674;
  *(void *)(a1 + 32) = 0;
  *(unsigned char *)(a1 + 40) = 0;
  uint64_t result = sub_2180CF880();
  *(void *)(a1 + 48) = result;
  *(void *)(a1 + 56) = v4;
  return result;
}

uint64_t sub_2180BD674()
{
  type metadata accessor for KeyboardObserver(0);
  uint64_t v0 = swift_allocObject();
  sub_2180CF6E0();
  return v0;
}

uint64_t sub_2180BD6D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v52 = a1;
  uint64_t v2 = type metadata accessor for AddressingView_iOS(0);
  uint64_t v47 = *(void *)(v2 - 8);
  uint64_t v46 = *(void *)(v47 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v42 = (uint64_t)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD948);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v48 = v4;
  uint64_t v49 = v5;
  MEMORY[0x270FA5388](v4);
  uint64_t v44 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDD40);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v50 = v7;
  uint64_t v51 = v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v43 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2180CF960();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDD48);
  uint64_t v14 = *(void *)(v39 - 8);
  MEMORY[0x270FA5388](v39);
  long long v16 = (char *)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDD50);
  uint64_t v45 = *(void *)(v41 - 8);
  MEMORY[0x270FA5388](v41);
  uint64_t v40 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = v1;
  uint64_t v53 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDD58);
  sub_2180C3D5C(&qword_267BBDD60, &qword_267BBDD58, (void (*)(void))sub_2180C3D2C);
  sub_2180CF870();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_2180CF720();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, *MEMORY[0x263F19698], v10);
  uint64_t v18 = sub_2180AEE00(&qword_267BBDE08, &qword_267BBDD48);
  unint64_t v19 = sub_2180B363C();
  uint64_t v20 = v39;
  sub_2180CFBA0();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  swift_bridgeObjectRelease();
  uint64_t v21 = v16;
  uint64_t v22 = v20;
  (*(void (**)(char *, uint64_t))(v14 + 8))(v21, v20);
  uint64_t v23 = v38;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_2180CF720();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v24 = v23;
  uint64_t v25 = v42;
  sub_2180C412C(v24, v42);
  unint64_t v26 = (*(unsigned __int8 *)(v47 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v47 + 80);
  uint64_t v27 = swift_allocObject();
  sub_2180C4194(v25, v27 + v26);
  uint64_t v28 = v44;
  uint64_t v29 = MEMORY[0x263F8D310];
  sub_2180CFCB0();
  uint64_t v30 = sub_2180AEE00(&qword_267BBD940, &qword_267BBD948);
  uint64_t v31 = v43;
  uint64_t v32 = v48;
  sub_2180CFBC0();
  (*(void (**)(char *, uint64_t))(v49 + 8))(v28, v32);
  uint64_t v54 = v22;
  uint64_t v55 = v29;
  uint64_t v56 = v18;
  unint64_t v57 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v54 = v32;
  uint64_t v55 = v30;
  swift_getOpaqueTypeConformance2();
  uint64_t v33 = v41;
  uint64_t v34 = v50;
  uint64_t v35 = v40;
  sub_2180CFB90();
  (*(void (**)(char *, uint64_t))(v51 + 8))(v31, v34);
  return (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v35, v33);
}

uint64_t sub_2180BDD90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v96 = a2;
  uint64_t v3 = sub_2180CF960();
  uint64_t v94 = *(void *)(v3 - 8);
  uint64_t v95 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v93 = (char *)v72 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDDB8);
  MEMORY[0x270FA5388](v78);
  uint64_t v6 = (char *)v72 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for AddressingView_iOS(0);
  uint64_t v74 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7 - 8);
  unsigned long long v75 = (char *)v8;
  uint64_t v9 = (char *)v72 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDDC0);
  MEMORY[0x270FA5388](v73);
  uint64_t v11 = (char *)v72 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDE20);
  uint64_t v12 = *(void *)(v77 - 8);
  MEMORY[0x270FA5388](v77);
  uint64_t v14 = (char *)v72 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDDA8);
  MEMORY[0x270FA5388](v76);
  long long v16 = (char *)v72 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDD90);
  MEMORY[0x270FA5388](v80);
  uint64_t v79 = (uint64_t)v72 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDD88);
  uint64_t v82 = *(void *)(v18 - 8);
  uint64_t v83 = v18;
  MEMORY[0x270FA5388](v18);
  uint64_t v81 = (char *)v72 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDE28);
  uint64_t v87 = *(void *)(v20 - 8);
  uint64_t v88 = v20;
  MEMORY[0x270FA5388](v20);
  uint64_t v85 = (char *)v72 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDD80);
  MEMORY[0x270FA5388](v84);
  char v89 = (char *)v72 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDD70);
  MEMORY[0x270FA5388](v86);
  uint64_t v92 = (uint64_t)v72 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDD58);
  MEMORY[0x270FA5388](v90);
  uint64_t v91 = (uint64_t)v72 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = a1;
  type metadata accessor for AddressingViewModel();
  sub_2180C2FB4(&qword_267BBDC40, (void (*)(uint64_t))type metadata accessor for AddressingViewModel);
  swift_retain();
  uint64_t v26 = sub_2180CF880();
  uint64_t v97 = 0x4034000000000000;
  uint64_t v98 = v26;
  uint64_t v99 = v27;
  uint64_t v28 = *MEMORY[0x263F18CB8];
  uint64_t v29 = sub_2180CF890();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v29 - 8) + 104))(v11, v28, v29);
  sub_2180C2FB4(&qword_267BBDE30, MEMORY[0x263F18D80]);
  uint64_t result = sub_2180CFE00();
  if (result)
  {
    sub_2180C40C8();
    sub_2180AEE00((unint64_t *)&unk_267BBDDD0, &qword_267BBDDC0);
    sub_2180CFB70();
    sub_2180AECB4((uint64_t)v11, &qword_267BBDDC0);
    swift_release();
    uint64_t v31 = v25;
    sub_2180C412C(v25, (uint64_t)v9);
    uint64_t v32 = *(unsigned __int8 *)(v74 + 80);
    uint64_t v33 = (v32 + 16) & ~v32;
    uint64_t v73 = (uint64_t)&v75[v33];
    v72[1] = v32 | 7;
    uint64_t v34 = swift_allocObject();
    uint64_t v74 = v33;
    unsigned long long v75 = v9;
    sub_2180C4194((uint64_t)v9, v34 + v33);
    uint64_t v35 = sub_2180CFD70();
    uint64_t v37 = v36;
    uint64_t v38 = v77;
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v6, v14, v77);
    uint64_t v39 = (uint64_t (**)@<X0>(uint64_t *@<X8>))&v6[*(int *)(v78 + 36)];
    *uint64_t v39 = sub_2180C5BC8;
    v39[1] = 0;
    v39[2] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v35;
    v39[3] = v37;
    uint64_t v40 = swift_allocObject();
    *(void *)(v40 + 16) = sub_2180C43A0;
    *(void *)(v40 + 24) = v34;
    sub_2180B3870((uint64_t)v6, (uint64_t)v16, &qword_267BBDDB8);
    uint64_t v41 = (uint64_t (**)(double *))&v16[*(int *)(v76 + 36)];
    *uint64_t v41 = sub_2180C4450;
    v41[1] = (uint64_t (*)(double *))v40;
    sub_2180AECB4((uint64_t)v6, &qword_267BBDDB8);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v38);
    uint64_t v42 = sub_2180CF8A0();
    LOBYTE(v40) = sub_2180CFA90();
    uint64_t v43 = v79;
    sub_2180B3870((uint64_t)v16, v79, &qword_267BBDDA8);
    uint64_t v44 = v80;
    uint64_t v45 = v43 + *(int *)(v80 + 36);
    *(void *)uint64_t v45 = v42;
    *(unsigned char *)(v45 + 8) = v40;
    sub_2180AECB4((uint64_t)v16, &qword_267BBDDA8);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_2180CF720();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v46 = v31;
    uint64_t v47 = v43;
    sub_2180CF980();
    uint64_t v48 = sub_2180C3D5C(&qword_267BBDD98, &qword_267BBDD90, (void (*)(void))sub_2180C3F14);
    uint64_t v49 = v81;
    sub_2180CFB80();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2180AECB4(v47, &qword_267BBDD90);
    uint64_t v51 = v94;
    uint64_t v50 = v95;
    uint64_t v52 = v44;
    uint64_t v53 = v93;
    (*(void (**)(char *, void, uint64_t))(v94 + 104))(v93, *MEMORY[0x263F19698], v95);
    uint64_t v97 = v52;
    uint64_t v98 = v48;
    swift_getOpaqueTypeConformance2();
    uint64_t v54 = v85;
    uint64_t v55 = v83;
    sub_2180CFBB0();
    (*(void (**)(char *, uint64_t))(v51 + 8))(v53, v50);
    (*(void (**)(char *, uint64_t))(v82 + 8))(v49, v55);
    uint64_t v56 = v46;
    type metadata accessor for KeyboardObserver(0);
    sub_2180C2FB4(&qword_267BBDE38, (void (*)(uint64_t))type metadata accessor for KeyboardObserver);
    sub_2180CF7F0();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_2180CF720();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v57 = v97;
    uint64_t v58 = v46;
    uint64_t v59 = (uint64_t)v75;
    sub_2180C412C(v58, (uint64_t)v75);
    uint64_t v60 = swift_allocObject();
    uint64_t v61 = v74;
    sub_2180C4194(v59, v60 + v74);
    uint64_t v63 = v87;
    uint64_t v62 = v88;
    uint64_t v64 = (uint64_t)v89;
    (*(void (**)(char *, char *, uint64_t))(v87 + 16))(v89, v54, v88);
    uint64_t v65 = (uint64_t *)(v64 + *(int *)(v84 + 36));
    *uint64_t v65 = v57;
    v65[1] = (uint64_t)sub_2180C458C;
    v65[2] = v60;
    (*(void (**)(char *, uint64_t))(v63 + 8))(v54, v62);
    sub_2180C412C(v56, v59);
    uint64_t v66 = swift_allocObject();
    sub_2180C4194(v59, v66 + v61);
    uint64_t v67 = v92;
    sub_2180B3870(v64, v92, &qword_267BBDD80);
    uint64_t v68 = (uint64_t (**)())(v67 + *(int *)(v86 + 36));
    *uint64_t v68 = sub_2180C4600;
    v68[1] = (uint64_t (*)())v66;
    v68[2] = 0;
    v68[3] = 0;
    sub_2180AECB4(v64, &qword_267BBDD80);
    sub_2180C412C(v56, v59);
    uint64_t v69 = swift_allocObject();
    sub_2180C4194(v59, v69 + v61);
    uint64_t v70 = v91;
    sub_2180B3870(v67, v91, &qword_267BBDD70);
    uint64_t v71 = (void *)(v70 + *(int *)(v90 + 36));
    void *v71 = 0;
    v71[1] = 0;
    v71[2] = sub_2180C4690;
    v71[3] = v69;
    sub_2180AECB4(v67, &qword_267BBDD70);
    return sub_2180AE460(v70, v96, &qword_267BBDD58);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_2180BE9F8(long long *a1, double a2, double a3)
{
  long long v5 = *a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDE60);
  sub_2180CFC70();
  type metadata accessor for KeyboardObserver(0);
  sub_2180C2FB4(&qword_267BBDE38, (void (*)(uint64_t))type metadata accessor for KeyboardObserver);
  sub_2180CF7F0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2180CF720();
  swift_release();
  swift_release();
  swift_release();
  sub_2180BEB34(a2, a3, *(double *)&v5);
}

void sub_2180BEB34(double a1, double a2, double a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDD08);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2180CF9D0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v28 - v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v28 - v18;
  id v20 = objc_msgSend(self, sel_currentDevice);
  id v21 = objc_msgSend(v20, sel_userInterfaceIdiom);

  if (!v21)
  {
    type metadata accessor for AddressingView_iOS(0);
    sub_2180C28DC((uint64_t)v9);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
    {
      sub_2180AECB4((uint64_t)v9, &qword_267BBDD08);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v19, v9, v10);
      uint64_t v22 = MEMORY[0x21D4616F0](*(void *)(v4 + 56) + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel_contactsSearchController);
      if (v22)
      {
        uint64_t v23 = (void *)v22;
        (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v17, v19, v10);
        if (a3 + 80.0 <= a2)
        {
          uint64_t v25 = *(void (**)(char *, uint64_t))(v11 + 8);
          v25(v17, v10);
          char v24 = 0;
        }
        else
        {
          (*(void (**)(char *, void, uint64_t))(v11 + 104))(v14, *MEMORY[0x263F19F00], v10);
          char v24 = sub_2180CF9C0();
          uint64_t v25 = *(void (**)(char *, uint64_t))(v11 + 8);
          v25(v14, v10);
          v25(v17, v10);
        }
        id v26 = objc_msgSend(v23, sel_footerView);
        if (v26)
        {
          uint64_t v27 = v26;
          objc_msgSend(v26, sel_setHidden_, v24 & 1);

          v25(v19, v10);
        }
        else
        {
          v25(v19, v10);
        }
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v11 + 8))(v19, v10);
      }
    }
  }
}

void sub_2180BEEA4(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDE60);
  sub_2180CFC60();
  type metadata accessor for KeyboardObserver(0);
  sub_2180C2FB4(&qword_267BBDE38, (void (*)(uint64_t))type metadata accessor for KeyboardObserver);
  sub_2180CF7F0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2180CF720();
  swift_release();
  swift_release();
  swift_release();
  sub_2180BEB34(v3, v4, *(double *)&v2);
}

uint64_t sub_2180BEFD4(uint64_t a1)
{
  uint64_t v2 = sub_2180CFD90();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  long long v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2180CFDB0();
  uint64_t v21 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = objc_msgSend(self, sel_currentDevice);
  id v10 = objc_msgSend(v9, sel_userInterfaceIdiom);

  if (!v10)
  {
    type metadata accessor for KeyboardObserver(0);
    sub_2180C2FB4(&qword_267BBDE38, (void (*)(uint64_t))type metadata accessor for KeyboardObserver);
    uint64_t v11 = sub_2180CF7F0();
    uint64_t v12 = self;
    id v13 = objc_msgSend(v12, sel_defaultCenter);
    objc_msgSend(v13, sel_addObserver_selector_name_object_, v11, sel_keyboardWillShow_, *MEMORY[0x263F83808], 0);

    id v14 = objc_msgSend(v12, sel_defaultCenter);
    objc_msgSend(v14, sel_addObserver_selector_name_object_, v11, sel_keyboardWillHide_, *MEMORY[0x263F83800], 0);
    swift_release();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_2180CF720();
  swift_release();
  swift_release();
  uint64_t result = swift_release();
  if ((aBlock[0] & 1) == 0)
  {
    sub_2180AEA60(0, (unint64_t *)&unk_267BBDE40);
    uint64_t v16 = (void *)sub_2180CFFE0();
    uint64_t v17 = *(void *)(a1 + 56);
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = v17;
    *(unsigned char *)(v18 + 24) = 1;
    aBlock[4] = sub_2180C46E0;
    aBlock[5] = v18;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2180A884C;
    aBlock[3] = &block_descriptor_0;
    uint64_t v19 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    sub_2180CFDA0();
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_2180C2FB4(&qword_267BBD788, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBDE50);
    sub_2180AEE00(&qword_267BBD790, (uint64_t *)&unk_267BBDE50);
    sub_2180D0110();
    MEMORY[0x21D460CB0](0, v8, v5, v19);
    _Block_release(v19);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v8, v6);
  }
  return result;
}

uint64_t sub_2180BF464()
{
  return sub_2180CF730();
}

void sub_2180BF4D8()
{
  id v0 = objc_msgSend(self, sel_currentDevice);
  id v1 = objc_msgSend(v0, sel_userInterfaceIdiom);

  if (!v1)
  {
    type metadata accessor for KeyboardObserver(0);
    sub_2180C2FB4(&qword_267BBDE38, (void (*)(uint64_t))type metadata accessor for KeyboardObserver);
    uint64_t v2 = sub_2180CF7F0();
    uint64_t v3 = self;
    id v4 = objc_msgSend(v3, sel_defaultCenter);
    objc_msgSend(v4, sel_removeObserver_name_object_, v2, *MEMORY[0x263F83808], 0);

    id v5 = objc_msgSend(v3, sel_defaultCenter);
    objc_msgSend(v5, sel_removeObserver_name_object_, v2, *MEMORY[0x263F83800], 0);
    swift_release();
  }
}

uint64_t sub_2180BF664(uint64_t result)
{
  id v1 = *(void (**)())(*(void *)(result + 56)
                               + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel_secondaryButtonDidClick);
  if (v1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_2180AC708((uint64_t)v1);
    swift_retain();
    sub_2180CF720();
    swift_release();
    swift_release();
    swift_release();
    v1();
    sub_2180AC8B8((uint64_t)v1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_2180BF9CC(void *a1, void *a2)
{
  uint64_t v4 = sub_2180CFD90();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2180CFDB0();
  uint64_t v29 = *(void *)(v8 - 8);
  uint64_t v30 = v8;
  MEMORY[0x270FA5388](v8);
  id v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_2180CFDD0();
  uint64_t v28 = *(void *)(v11 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  id v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v24 - v15;
  id v17 = objc_msgSend(a2, sel_contact);
  if (v17)
  {
    id v31 = v17;
    id v18 = objc_msgSend(a1, sel_navigationController);
    if (v18)
    {
      uint64_t v19 = v18;
      swift_getKeyPath();
      swift_getKeyPath();
      uint64_t v27 = v5;
      LOBYTE(aBlock[0]) = 0;
      swift_retain();
      sub_2180CF730();
      sub_2180AEA60(0, (unint64_t *)&unk_267BBDE40);
      uint64_t v26 = sub_2180CFFE0();
      sub_2180CFDC0();
      MEMORY[0x21D460AA0](v14, 0.01);
      uint64_t v28 = *(void *)(v28 + 8);
      ((void (*)(char *, uint64_t))v28)(v14, v11);
      uint64_t v20 = swift_allocObject();
      *(void *)(v20 + 16) = v31;
      *(void *)(v20 + 24) = v19;
      aBlock[4] = sub_2180C54F8;
      aBlock[5] = v20;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_2180A884C;
      aBlock[3] = &block_descriptor_80;
      uint64_t v21 = _Block_copy(aBlock);
      id v25 = v19;
      id v31 = v31;
      swift_release();
      sub_2180CFDA0();
      aBlock[0] = MEMORY[0x263F8EE78];
      sub_2180C2FB4(&qword_267BBD788, MEMORY[0x263F8F030]);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBDE50);
      sub_2180AEE00(&qword_267BBD790, (uint64_t *)&unk_267BBDE50);
      sub_2180D0110();
      uint64_t v22 = (void *)v26;
      MEMORY[0x21D460C90](v16, v10, v7, v21);
      _Block_release(v21);

      (*(void (**)(char *, uint64_t))(v27 + 8))(v7, v4);
      (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v30);
      ((void (*)(char *, uint64_t))v28)(v16, v11);
    }
    else
    {
      id v23 = v31;
    }
  }
}

void sub_2180BFE84(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(self, sel_viewControllerForContact_, a1);
  objc_msgSend(a2, sel_pushViewController_animated_, v3, 1);
}

uint64_t sub_2180BFF80(unint64_t a1)
{
  uint64_t v3 = *(void *)(v1
                 + OBJC_IVAR____TtCV14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D24CNAutocompleteSearchView11Coordinator_viewModel);
  if (!(a1 >> 62))
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v18 = v3;
    if (v4) {
      goto LABEL_3;
    }
LABEL_17:
    swift_bridgeObjectRelease();
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    return sub_2180CF730();
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_2180D01F0();
  uint64_t v4 = result;
  uint64_t v18 = v3;
  if (!result) {
    goto LABEL_17;
  }
LABEL_3:
  if (v4 >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = (void *)MEMORY[0x263F8EE78];
    do
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v8 = (id)MEMORY[0x21D460E10](v6, a1);
      }
      else {
        id v8 = *(id *)(a1 + 8 * v6 + 32);
      }
      uint64_t v9 = v8;
      id v10 = objc_msgSend(v8, sel_normalizedAddress, v18);
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = sub_2180CFE50();
        uint64_t v14 = v13;

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v7 = sub_2180C493C(0, v7[2] + 1, 1, v7);
        }
        unint64_t v16 = v7[2];
        unint64_t v15 = v7[3];
        if (v16 >= v15 >> 1) {
          uint64_t v7 = sub_2180C493C((void *)(v15 > 1), v16 + 1, 1, v7);
        }
        _OWORD v7[2] = v16 + 1;
        id v17 = &v7[2 * v16];
        v17[4] = v12;
        v17[5] = v14;
      }
      else
      {
      }
      ++v6;
    }
    while (v4 != v6);
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

id sub_2180C0190()
{
  return sub_2180C1D14((uint64_t (*)(void))type metadata accessor for CNAutocompleteSearchView.Coordinator);
}

id sub_2180C01B8(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v77 = a2;
  uint64_t v78 = a3;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDEF0);
  MEMORY[0x270FA5388](v6 - 8);
  id v8 = (char *)&v70 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = sub_2180D0020();
  uint64_t v9 = *(void *)(v71 - 8);
  MEMORY[0x270FA5388](v71);
  uint64_t v11 = (char *)&v70 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = sub_2180D0070();
  uint64_t v12 = *(void *)(v70 - 8);
  MEMORY[0x270FA5388](v70);
  uint64_t v14 = (char *)&v70 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_2180D0090();
  uint64_t v75 = *(void *)(v15 - 8);
  uint64_t v76 = v15;
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v70 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v74 = (char *)&v70 - v19;
  id v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F33418]), sel_initWithSearchType_, 1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDEF8);
  uint64_t v72 = a1;
  sub_2180CFA60();
  uint64_t v21 = v79;
  objc_msgSend(v20, sel_setDelegate_, v79);

  uint64_t v73 = v20;
  id result = objc_msgSend(v20, sel_view);
  if (result)
  {
    id v23 = result;
    objc_msgSend(result, sel_setClipsToBounds_, 1);

    type metadata accessor for InsetLabel();
    id v24 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
    id v25 = self;
    id v26 = v24;
    id v27 = objc_msgSend(v25, sel_secondaryLabelColor);
    objc_msgSend(v26, sel_setTextColor_, v27);

    uint64_t v28 = self;
    uint64_t v29 = *MEMORY[0x263F835B8];
    id v30 = v26;
    id v31 = objc_msgSend(v28, sel_preferredFontForTextStyle_, v29);
    objc_msgSend(v30, sel_setFont_, v31);

    objc_msgSend(v30, sel_setAdjustsFontForContentSizeCategory_, 1);
    objc_msgSend(v30, sel_setMaximumContentSizeCategory_, *MEMORY[0x263F83410]);
    objc_msgSend(v30, sel_setNumberOfLines_, 0);
    uint64_t v32 = v73;
    CSSetCNAutocompleteSearchControllerHeaderView(v73, v30);

    uint64_t v33 = v74;
    sub_2180D0040();
    (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, *MEMORY[0x263F821F0], v70);
    sub_2180D0010();
    (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F821A8], v71);
    sub_2180D0030();
    sub_2180CF6B0();
    uint64_t v34 = sub_2180CF6A0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v8, 0, 1, v34);
    sub_2180D0060();
    sub_2180AEA60(0, &qword_267BBDF00);
    (*(void (**)(char *, char *, uint64_t))(v75 + 16))(v18, v33, v76);
    sub_2180AEA60(0, &qword_267BBDF08);
    uint64_t v35 = swift_allocObject();
    *(double *)(v35 + 16) = a4;
    *(void *)(v35 + 24) = v77;
    *(void *)(v35 + 32) = v78;
    swift_retain();
    sub_2180D0000();
    uint64_t v36 = (void *)sub_2180D00A0();
    objc_msgSend(v36, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    id v37 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
    objc_msgSend(v37, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    id v38 = objc_msgSend(v25, sel_systemBackgroundColor);
    objc_msgSend(v37, sel_setBackgroundColor_, v38);

    objc_msgSend(v37, sel_setClipsToBounds_, 1);
    id v39 = objc_msgSend(v37, sel_layer);
    objc_msgSend(v39, sel_setCornerRadius_, 10.0);

    id v40 = objc_msgSend(v37, sel_layer);
    objc_msgSend(v40, sel_setCornerCurve_, *MEMORY[0x263F15A20]);

    id v41 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
    objc_msgSend(v41, sel_addSubview_, v37);
    objc_msgSend(v41, sel_addSubview_, v36);
    objc_msgSend(v32, sel_setFooterView_, v41);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDF10);
    uint64_t v42 = swift_allocObject();
    *(_OWORD *)(v42 + 16) = xmmword_2180D1FE0;
    id v43 = objc_msgSend(v36, sel_topAnchor);
    id v44 = objc_msgSend(v41, (SEL)&selRef_setSourceView_ + 3);
    id v45 = objc_msgSend(v43, sel_constraintEqualToAnchor_constant_, v44, a4);

    *(void *)(v42 + 32) = v45;
    id v46 = objc_msgSend(v36, sel_leadingAnchor);
    id v47 = objc_msgSend(v41, (SEL)&off_2642FF238 + 2);
    id v48 = objc_msgSend(v46, sel_constraintEqualToAnchor_constant_, v47, a4);

    *(void *)(v42 + 40) = v48;
    id v49 = objc_msgSend(v36, sel_bottomAnchor);
    id v50 = objc_msgSend(v41, sel_bottomAnchor);
    id v51 = objc_msgSend(v49, sel_constraintEqualToAnchor_constant_, v50, -a4);

    *(void *)(v42 + 48) = v51;
    id v52 = objc_msgSend(v36, sel_trailingAnchor);
    id v53 = objc_msgSend(v41, sel_trailingAnchor);
    id v54 = objc_msgSend(v52, sel_constraintEqualToAnchor_constant_, v53, -a4);

    *(void *)(v42 + 56) = v54;
    id v55 = objc_msgSend(v37, sel_topAnchor);
    id v56 = objc_msgSend(v41, sel_topAnchor);
    id v57 = objc_msgSend(v55, sel_constraintEqualToAnchor_constant_, v56, a4);

    *(void *)(v42 + 64) = v57;
    id v58 = objc_msgSend(v37, sel_leadingAnchor);
    id v59 = objc_msgSend(v41, sel_leadingAnchor);
    id v60 = objc_msgSend(v58, sel_constraintEqualToAnchor_constant_, v59, a4);

    *(void *)(v42 + 72) = v60;
    id v61 = objc_msgSend(v37, sel_bottomAnchor);
    id v62 = objc_msgSend(v41, sel_bottomAnchor);
    id v63 = objc_msgSend(v61, sel_constraintEqualToAnchor_constant_, v62, -a4);

    *(void *)(v42 + 80) = v63;
    id v64 = objc_msgSend(v37, sel_trailingAnchor);
    id v65 = objc_msgSend(v41, sel_trailingAnchor);
    id v66 = objc_msgSend(v64, sel_constraintEqualToAnchor_constant_, v65, -a4);

    *(void *)(v42 + 88) = v66;
    uint64_t v79 = (void *)v42;
    sub_2180CFEB0();
    uint64_t v67 = self;
    sub_2180AEA60(0, &qword_267BBDF18);
    uint64_t v68 = (void *)sub_2180CFE90();
    swift_bridgeObjectRelease();
    objc_msgSend(v67, sel_activateConstraints_, v68);

    (*(void (**)(char *, uint64_t))(v75 + 8))(v74, v76);
    uint64_t v69 = v73;
    swift_unknownObjectWeakAssign();
    sub_2180C0EC4(v69, a4);
    return v69;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2180C0C64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_2180CF550();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2180C5AB8();
  sub_2180CF530();
  swift_release();
  if (v6)
  {
    sub_2180CFAB0();
    swift_release();
  }
  return sub_2180CF540();
}

uint64_t sub_2180C0D7C()
{
  return sub_2180CFE00() & 1;
}

uint64_t sub_2180C0DD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void (**)())(a3 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel_primaryButtonDidClick);
  if (v3)
  {
    *(unsigned char *)(a3 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel_primaryButtonWasClicked) = 1;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_2180AC708((uint64_t)v3);
    sub_2180CF720();
    swift_release();
    swift_release();
    v3();
    swift_bridgeObjectRelease();
    sub_2180AC8B8((uint64_t)v3);
    return swift_release();
  }
  return result;
}

void sub_2180C0EC4(void *a1, double a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDEC8);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v59 - v9;
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v59 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v59 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v59 - v17;
  id v19 = CSCNAutocompleteSearchControllerHeaderView(a1);
  if (!v19) {
    return;
  }
  id v61 = v19;
  self;
  uint64_t v20 = swift_dynamicCastObjCClass();
  if (v20)
  {
    uint64_t v21 = (void *)v20;
    id v59 = v13;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_2180CF720();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v22 = v64;
    uint64_t v23 = v65;
    swift_getKeyPath();
    id v60 = a1;
    swift_getKeyPath();
    swift_retain();
    sub_2180CF720();
    swift_release();
    swift_release();
    swift_release();
    sub_2180C5834(v22, v23, v64, v65);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v24 = (void *)sub_2180CFE10();
    swift_bridgeObjectRelease();
    objc_msgSend(v21, sel_setText_, v24);

    objc_msgSend(v21, sel_sizeToFit);
    id v25 = objc_msgSend(v60, sel_footerView);
    if (!v25)
    {

      return;
    }
    id v26 = v25;
    sub_2180C16E8();
    unint64_t v28 = v27;

    if (v28 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v58 = sub_2180D01F0();
      swift_bridgeObjectRelease();
      id v29 = v61;
      if (v58)
      {
LABEL_6:
        if ((v28 & 0xC000000000000001) != 0)
        {
          id v30 = (id)MEMORY[0x21D460E10](0, v28);
        }
        else
        {
          if (!*(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            goto LABEL_38;
          }
          id v30 = *(id *)(v28 + 32);
        }
        id v31 = v30;
        swift_bridgeObjectRelease();
        swift_getKeyPath();
        swift_getKeyPath();
        swift_retain();
        sub_2180CF720();
        swift_release();
        swift_release();
        swift_release();
        uint64_t v33 = v64;
        unint64_t v32 = v65;
        swift_bridgeObjectRelease();
        uint64_t v34 = HIBYTE(v32) & 0xF;
        if ((v32 & 0x2000000000000000) == 0) {
          uint64_t v34 = v33 & 0xFFFFFFFFFFFFLL;
        }
        if (v34)
        {
          sub_2180D00B0();
          uint64_t v35 = sub_2180D0090();
          uint64_t v36 = *(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v35 - 8) + 48);
          if (v36(v10, 1, v35))
          {
            sub_2180B3870((uint64_t)v10, (uint64_t)v59, &qword_267BBDEC8);
            sub_2180D00C0();
            sub_2180AECB4((uint64_t)v10, &qword_267BBDEC8);
          }
          else
          {
            swift_getKeyPath();
            swift_getKeyPath();
            swift_retain();
            sub_2180CF720();
            swift_release();
            swift_release();
            swift_release();
            sub_2180D0080();
            sub_2180D00C0();
          }
          sub_2180D00B0();
          if (v36(v7, 1, v35))
          {
            sub_2180B3870((uint64_t)v7, (uint64_t)v59, &qword_267BBDEC8);
            sub_2180D00C0();
            uint64_t v40 = (uint64_t)v7;
LABEL_27:
            sub_2180AECB4(v40, &qword_267BBDEC8);
            goto LABEL_29;
          }
        }
        else
        {
          sub_2180D00B0();
          uint64_t v38 = sub_2180D0090();
          id v39 = *(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v38 - 8) + 48);
          if (v39(v18, 1, v38))
          {
            sub_2180B3870((uint64_t)v18, (uint64_t)v59, &qword_267BBDEC8);
            sub_2180D00C0();
            sub_2180AECB4((uint64_t)v18, &qword_267BBDEC8);
          }
          else
          {
            swift_getKeyPath();
            swift_getKeyPath();
            swift_retain();
            sub_2180CF720();
            swift_release();
            swift_release();
            swift_release();
            sub_2180D0080();
            sub_2180D00C0();
          }
          sub_2180D00B0();
          if (v39(v16, 1, v38))
          {
            sub_2180B3870((uint64_t)v16, (uint64_t)v59, &qword_267BBDEC8);
            sub_2180D00C0();
            uint64_t v40 = (uint64_t)v16;
            goto LABEL_27;
          }
        }
        sub_2180D0050();
        sub_2180D00C0();
LABEL_29:
        swift_retain();
        id v41 = v31;
        BOOL v42 = sub_2180C81D0();
        swift_release();
        objc_msgSend(v41, sel_setEnabled_, !v42);

        id v43 = v60;
        id v44 = objc_msgSend(v60, sel_view);
        if (v44)
        {
          id v45 = v44;
          objc_msgSend(v44, sel_frame);
          double v47 = v46;
          double v49 = v48;

          type metadata accessor for UILayoutPriority(0);
          int v63 = 1144750080;
          int v62 = 1065353216;
          sub_2180C2FB4(&qword_267BBDED0, type metadata accessor for UILayoutPriority);
          sub_2180CF690();
          LODWORD(v50) = v64;
          LODWORD(v51) = 1148846080;
          objc_msgSend(v41, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, v47, v49, v51, v50);
          CGFloat v53 = v52;
          CGFloat v55 = v54;
          id v56 = objc_msgSend(v43, sel_footerView);
          if (v56)
          {
            id v57 = v56;
            v67.origin.x = 0.0;
            v67.origin.y = 0.0;
            v67.size.width = v53;
            v67.size.height = v55;
            CGRect v68 = CGRectInset(v67, -a2, -a2);
            objc_msgSend(v57, sel_setFrame_, v68.origin.x, v68.origin.y, v68.size.width, v68.size.height);
          }
          return;
        }
LABEL_38:
        __break(1u);
        return;
      }
    }
    else
    {
      id v29 = v61;
      if (*(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_6;
      }
    }

    swift_bridgeObjectRelease();
    return;
  }
  id v37 = v61;
}

void sub_2180C16E8()
{
  uint64_t v7 = MEMORY[0x263F8EE78];
  id v1 = objc_msgSend(v0, sel_subviews);
  sub_2180AEA60(0, &qword_267BBDED8);
  unint64_t v2 = sub_2180CFEA0();

  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v3) {
      goto LABEL_3;
    }
LABEL_16:
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_2180D01F0();
  swift_bridgeObjectRelease();
  if (!v3) {
    goto LABEL_16;
  }
LABEL_3:
  if (v3 >= 1)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if ((v2 & 0xC000000000000001) != 0) {
        id v5 = (id)MEMORY[0x21D460E10](i, v2);
      }
      else {
        id v5 = *(id *)(v2 + 8 * i + 32);
      }
      uint64_t v6 = v5;
      self;
      if (swift_dynamicCastObjCClass())
      {
        MEMORY[0x21D460B40]();
        if (*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_2180CFEC0();
        }
        sub_2180CFED0();
        sub_2180CFEB0();
      }
      else
      {
      }
    }
    goto LABEL_16;
  }
  __break(1u);
}

id sub_2180C1898(uint64_t a1)
{
  return sub_2180C01B8(a1, *(void *)(v1 + 8), *(void *)(v1 + 16), *(double *)v1);
}

void sub_2180C18A4(void *a1)
{
  sub_2180C0EC4(a1, *v1);
}

id sub_2180C18B8@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = (objc_class *)type metadata accessor for CNAutocompleteSearchView.Coordinator();
  id v5 = (char *)objc_allocWithZone(v4);
  *(void *)&v5[OBJC_IVAR____TtCV14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D24CNAutocompleteSearchView11Coordinator_viewModel] = v3;
  v7.receiver = v5;
  v7.super_class = v4;
  swift_retain();
  id result = objc_msgSendSuper2(&v7, sel_init);
  *a1 = result;
  return result;
}

uint64_t sub_2180C192C()
{
  return sub_2180CFA00();
}

uint64_t sub_2180C1968(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_2180C57D0();

  return MEMORY[0x270F02710](a1, a2, a3, v6);
}

uint64_t sub_2180C19CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_2180C57D0();

  return MEMORY[0x270F026D8](a1, a2, a3, v6);
}

void sub_2180C1A30()
{
}

id sub_2180C1CFC()
{
  return sub_2180C1D14((uint64_t (*)(void))type metadata accessor for InsetLabel);
}

id sub_2180C1D14(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1(0);
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

double sub_2180C1D54()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2180CF720();
  swift_release();
  swift_release();
  return v1;
}

void sub_2180C1DC8()
{
  uint64_t v0 = sub_2180CF4E0();
  if (v0)
  {
    unint64_t v1 = sub_2180C1F38(v0);
    swift_bridgeObjectRelease();
    if (v1)
    {
      uint64_t v2 = sub_2180CFE50();
      if (*(void *)(v1 + 16) && (unint64_t v4 = sub_2180A9884(v2, v3), (v5 & 1) != 0))
      {
        sub_2180C4D2C(*(void *)(v1 + 56) + 32 * v4, (uint64_t)&v9);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (*((void *)&v10 + 1))
        {
          sub_2180AEA60(0, &qword_267BBDE78);
          if (swift_dynamicCast())
          {
            objc_msgSend(v8, sel_CGRectValue);
            uint64_t v7 = v6;
            swift_getKeyPath();
            swift_getKeyPath();
            *(void *)&long long v9 = v7;
            swift_retain();
            sub_2180CF730();
          }
          return;
        }
      }
      else
      {
        long long v9 = 0u;
        long long v10 = 0u;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      sub_2180AECB4((uint64_t)&v9, &qword_267BBDE70);
    }
  }
}

unint64_t sub_2180C1F38(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDE80);
    uint64_t v2 = (void *)sub_2180D0220();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
  }
  uint64_t v23 = a1 + 64;
  uint64_t v3 = -1;
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  if (-v4 < 64) {
    uint64_t v3 = ~(-1 << -(char)v4);
  }
  unint64_t v5 = v3 & *(void *)(a1 + 64);
  int64_t v22 = (unint64_t)(63 - v4) >> 6;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v7 = 0;
  while (1)
  {
    if (v5)
    {
      uint64_t v10 = (v5 - 1) & v5;
      unint64_t v11 = __clz(__rbit64(v5)) | (v7 << 6);
      int64_t v12 = v7;
    }
    else
    {
      int64_t v13 = v7 + 1;
      if (__OFADD__(v7, 1)) {
        goto LABEL_37;
      }
      if (v13 >= v22)
      {
LABEL_33:
        sub_2180AEBA0();
        return (unint64_t)v2;
      }
      unint64_t v14 = *(void *)(v23 + 8 * v13);
      int64_t v12 = v7 + 1;
      if (!v14)
      {
        int64_t v12 = v7 + 2;
        if (v7 + 2 >= v22) {
          goto LABEL_33;
        }
        unint64_t v14 = *(void *)(v23 + 8 * v12);
        if (!v14)
        {
          int64_t v12 = v7 + 3;
          if (v7 + 3 >= v22) {
            goto LABEL_33;
          }
          unint64_t v14 = *(void *)(v23 + 8 * v12);
          if (!v14)
          {
            int64_t v12 = v7 + 4;
            if (v7 + 4 >= v22) {
              goto LABEL_33;
            }
            unint64_t v14 = *(void *)(v23 + 8 * v12);
            if (!v14)
            {
              int64_t v15 = v7 + 5;
              if (v7 + 5 >= v22) {
                goto LABEL_33;
              }
              unint64_t v14 = *(void *)(v23 + 8 * v15);
              if (!v14)
              {
                while (1)
                {
                  int64_t v12 = v15 + 1;
                  if (__OFADD__(v15, 1)) {
                    goto LABEL_38;
                  }
                  if (v12 >= v22) {
                    goto LABEL_33;
                  }
                  unint64_t v14 = *(void *)(v23 + 8 * v12);
                  ++v15;
                  if (v14) {
                    goto LABEL_26;
                  }
                }
              }
              int64_t v12 = v7 + 5;
            }
          }
        }
      }
LABEL_26:
      uint64_t v10 = (v14 - 1) & v14;
      unint64_t v11 = __clz(__rbit64(v14)) + (v12 << 6);
    }
    sub_2180C5150(*(void *)(a1 + 48) + 40 * v11, (uint64_t)v33);
    sub_2180C4D2C(*(void *)(a1 + 56) + 32 * v11, (uint64_t)v34 + 8);
    v31[0] = v34[0];
    v31[1] = v34[1];
    uint64_t v32 = v35;
    v30[0] = v33[0];
    v30[1] = v33[1];
    sub_2180C5150((uint64_t)v30, (uint64_t)v25);
    if (!swift_dynamicCast())
    {
      sub_2180AECB4((uint64_t)v30, &qword_267BBDE88);
      swift_bridgeObjectRelease();
      sub_2180AEBA0();
      swift_release();
      return 0;
    }
    sub_2180C4D2C((uint64_t)v31 + 8, (uint64_t)v25);
    sub_2180AECB4((uint64_t)v30, &qword_267BBDE88);
    sub_2180C51AC(v25, v26);
    long long v27 = v24;
    sub_2180C51AC(v26, v28);
    long long v16 = v27;
    sub_2180C51AC(v28, v29);
    sub_2180C51AC(v29, &v27);
    unint64_t result = sub_2180A9884(v16, *((uint64_t *)&v16 + 1));
    unint64_t v17 = result;
    if (v18)
    {
      id v8 = (_OWORD *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *id v8 = v16;
      long long v9 = (_OWORD *)(v2[7] + 32 * v17);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
      unint64_t result = (unint64_t)sub_2180C51AC(&v27, v9);
      goto LABEL_8;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_OWORD *)(v2[6] + 16 * result) = v16;
    unint64_t result = (unint64_t)sub_2180C51AC(&v27, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v19 = v2[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_36;
    }
    v2[2] = v21;
LABEL_8:
    int64_t v7 = v12;
    unint64_t v5 = v10;
  }
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_2180C2510()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D16KeyboardObserver__height;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBDE90);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_2180C25B4@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for KeyboardObserver(0);
  uint64_t result = sub_2180CF6D0();
  *a1 = result;
  return result;
}

uint64_t sub_2180C25F4(double *a1, uint64_t (*a2)(double, double))
{
  return a2(*a1, a1[1]);
}

uint64_t sub_2180C2620@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2180CF950();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  int64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD830);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2180B3870(v2, (uint64_t)v10, &qword_267BBD830);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_2180CF7D0();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = sub_2180CFFB0();
    unint64_t v14 = sub_2180CFA70();
    os_log_type_t v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      long long v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v19[1] = a1;
      uint64_t v18 = v17;
      uint64_t v20 = v17;
      *(_DWORD *)long long v16 = 136315138;
      v19[2] = sub_2180C4A4C(0x686353726F6C6F43, 0xEB00000000656D65, &v20);
      sub_2180D00E0();
      _os_log_impl(&dword_21809D000, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D461630](v18, -1, -1);
      MEMORY[0x21D461630](v16, -1, -1);
    }

    sub_2180CF940();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_2180C28DC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2180CF950();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  int64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDC48);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2180B3870(v2, (uint64_t)v10, &qword_267BBDC48);
  if (swift_getEnumCaseMultiPayload() == 1) {
    return sub_2180AE460((uint64_t)v10, a1, &qword_267BBDD08);
  }
  os_log_type_t v12 = sub_2180CFFB0();
  os_log_type_t v13 = sub_2180CFA70();
  os_log_type_t v14 = v12;
  if (os_log_type_enabled(v13, v12))
  {
    os_log_type_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    v18[1] = a1;
    uint64_t v17 = v16;
    uint64_t v19 = v16;
    *(_DWORD *)os_log_type_t v15 = 136315138;
    v18[2] = sub_2180C4A4C(0xD000000000000020, 0x80000002180D3400, &v19);
    sub_2180D00E0();
    _os_log_impl(&dword_21809D000, v13, v14, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D461630](v17, -1, -1);
    MEMORY[0x21D461630](v15, -1, -1);
  }

  sub_2180CF940();
  swift_getAtKeyPath();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_2180C2B6C()
{
  return sub_2180CF900();
}

uint64_t sub_2180C2B90(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDD08);
  MEMORY[0x270FA5388](v2 - 8);
  sub_2180B3870(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_267BBDD08);
  return sub_2180CF910();
}

uint64_t type metadata accessor for AddressingView_iOS(uint64_t a1)
{
  return sub_2180B077C(a1, (uint64_t *)&unk_267BBDD20);
}

uint64_t sub_2180C2C48()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for AddressingView()
{
  return sub_2180B053C();
}

uint64_t _s14CloudSharingUI14AddressingViewVwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_2180B0A30();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for AddressingView(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_2180B0A30();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_2180B053C();
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for AddressingView(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_2180B053C();
  return a1;
}

uint64_t getEnumTagSinglePayload for AddressingView(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AddressingView(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for AddressingView()
{
  return &type metadata for AddressingView;
}

uint64_t type metadata accessor for CNAutocompleteSearchView.Coordinator()
{
  return self;
}

uint64_t type metadata accessor for InsetLabel()
{
  return self;
}

uint64_t sub_2180C2E5C()
{
  return type metadata accessor for KeyboardObserver(0);
}

uint64_t type metadata accessor for KeyboardObserver(uint64_t a1)
{
  return sub_2180B077C(a1, (uint64_t *)&unk_267BBDCE0);
}

void sub_2180C2E84()
{
  sub_2180C2F14();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_2180C2F14()
{
  if (!qword_267BBDCF0)
  {
    unint64_t v0 = sub_2180CF740();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267BBDCF0);
    }
  }
}

uint64_t sub_2180C2F6C()
{
  return sub_2180C2FB4(&qword_267BBDD00, (void (*)(uint64_t))type metadata accessor for AddressingView_iOS);
}

uint64_t sub_2180C2FB4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2180C2FFC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *(void *)uint64_t v4 = *a2;
    uint64_t v4 = v17 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    uint64_t v7 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    uint64_t v8 = a2[4];
    char v9 = *((unsigned char *)a2 + 40);
    swift_retain();
    sub_2180B0A30();
    *(void *)(v4 + 24) = v7;
    *(void *)(v4 + 32) = v8;
    *(unsigned char *)(v4 + 40) = v9;
    uint64_t v10 = a2[7];
    *(void *)(v4 + 48) = a2[6];
    *(void *)(v4 + 56) = v10;
    uint64_t v11 = *(int *)(a3 + 28);
    os_log_type_t v12 = (void *)(v4 + v11);
    os_log_type_t v13 = (uint64_t *)((char *)a2 + v11);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDC48);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v14 = sub_2180CF9D0();
      uint64_t v15 = *(void *)(v14 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
      {
        uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDD08);
        memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v15 + 16))(v12, v13, v14);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
      }
    }
    else
    {
      *os_log_type_t v12 = *v13;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v4;
}

uint64_t sub_2180C3204(uint64_t a1, uint64_t a2)
{
  swift_release();
  sub_2180B053C();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDC48);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_2180CF9D0();
    uint64_t v8 = *(void *)(v5 - 8);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v4, 1, v5);
    if (!result)
    {
      uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
      return v7(v4, v5);
    }
  }
  else
  {
    return swift_release();
  }
  return result;
}

uint64_t sub_2180C3340(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 32);
  char v8 = *(unsigned char *)(a2 + 40);
  swift_retain();
  sub_2180B0A30();
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = v8;
  uint64_t v9 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v9;
  uint64_t v10 = *(int *)(a3 + 28);
  uint64_t v11 = (void *)(a1 + v10);
  os_log_type_t v12 = (void *)(a2 + v10);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDC48);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v13 = sub_2180CF9D0();
    uint64_t v14 = *(void *)(v13 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
    {
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDD08);
      memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(v14 + 16))(v11, v12, v13);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
    }
  }
  else
  {
    void *v11 = *v12;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_2180C34F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  char v8 = *(unsigned char *)(a2 + 40);
  sub_2180B0A30();
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = v8;
  sub_2180B053C();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v9 = *(int *)(a3 + 28);
    uint64_t v10 = (void *)(a1 + v9);
    uint64_t v11 = (void *)(a2 + v9);
    sub_2180AECB4(a1 + v9, &qword_267BBDC48);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDC48);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_2180CF9D0();
      uint64_t v13 = *(void *)(v12 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
      {
        uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDD08);
        memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v13 + 16))(v10, v11, v12);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
      }
    }
    else
    {
      void *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_2180C36FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  uint64_t v4 = *(int *)(a3 + 28);
  uint64_t v5 = (void *)(a1 + v4);
  uint64_t v6 = (const void *)(a2 + v4);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDC48);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_2180CF9D0();
    uint64_t v9 = *(void *)(v8 - 8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8))
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDD08);
      memcpy(v5, v6, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v9 + 32))(v5, v6, v8);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v9 + 56))(v5, 0, 1, v8);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v5, v6, *(void *)(*(void *)(v7 - 8) + 64));
  }
  return a1;
}

uint64_t sub_2180C389C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  char v6 = *(unsigned char *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = v6;
  sub_2180B053C();
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  swift_release();
  if (a1 != a2)
  {
    uint64_t v8 = *(int *)(a3 + 28);
    uint64_t v9 = (void *)(a1 + v8);
    uint64_t v10 = (const void *)(a2 + v8);
    sub_2180AECB4(a1 + v8, &qword_267BBDC48);
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDC48);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_2180CF9D0();
      uint64_t v13 = *(void *)(v12 - 8);
      if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48))(v10, 1, v12))
      {
        uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDD08);
        memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(v13 + 32))(v9, v10, v12);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v9, 0, 1, v12);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_2180C3A78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2180C3A8C);
}

uint64_t sub_2180C3A8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 56);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBDD10);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_2180C3B40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2180C3B54);
}

uint64_t sub_2180C3B54(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 56) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBDD10);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_2180C3C00()
{
  sub_2180C3CAC();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_2180C3CAC()
{
  if (!qword_267BBDD30)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BBDD08);
    unint64_t v0 = sub_2180CF7E0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267BBDD30);
    }
  }
}

uint64_t sub_2180C3D08()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2180C3D24@<X0>(uint64_t a1@<X8>)
{
  return sub_2180BDD90(*(void *)(v1 + 16), a1);
}

uint64_t sub_2180C3D2C()
{
  return sub_2180C3D5C(&qword_267BBDD68, &qword_267BBDD70, (void (*)(void))sub_2180C3DD8);
}

uint64_t sub_2180C3D5C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2180C3DD8()
{
  unint64_t result = qword_267BBDD78;
  if (!qword_267BBDD78)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BBDD80);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BBDD88);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BBDD90);
    sub_2180C3D5C(&qword_267BBDD98, &qword_267BBDD90, (void (*)(void))sub_2180C3F14);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_2180AEE00(&qword_267BBDDF8, &qword_267BBDE00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBDD78);
  }
  return result;
}

unint64_t sub_2180C3F14()
{
  unint64_t result = qword_267BBDDA0;
  if (!qword_267BBDDA0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BBDDA8);
    sub_2180C3FB4();
    sub_2180AEE00(&qword_267BBDA88, &qword_267BBDDF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBDDA0);
  }
  return result;
}

unint64_t sub_2180C3FB4()
{
  unint64_t result = qword_267BBDDB0;
  if (!qword_267BBDDB0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BBDDB8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BBDDC0);
    sub_2180C40C8();
    sub_2180AEE00((unint64_t *)&unk_267BBDDD0, &qword_267BBDDC0);
    swift_getOpaqueTypeConformance2();
    sub_2180AEE00(&qword_267BBDA80, (uint64_t *)&unk_267BBDDE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBDDB0);
  }
  return result;
}

unint64_t sub_2180C40C8()
{
  unint64_t result = qword_267BBDDC8;
  if (!qword_267BBDDC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBDDC8);
  }
  return result;
}

uint64_t sub_2180C412C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AddressingView_iOS(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2180C4194(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AddressingView_iOS(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2180C41F8()
{
  return sub_2180C4618(sub_2180BF664);
}

uint64_t objectdestroyTm_1()
{
  uint64_t v1 = (int *)(type metadata accessor for AddressingView_iOS(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  swift_release();
  sub_2180B053C();
  swift_release();
  uint64_t v5 = v0 + v3 + v1[9];
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDC48);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_2180CF9D0();
    uint64_t v7 = *(void *)(v6 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
    }
  }
  else
  {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

void sub_2180C43A0(double a1, double a2)
{
  uint64_t v5 = *(void *)(type metadata accessor for AddressingView_iOS(0) - 8);
  uint64_t v6 = (long long *)(v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)));

  sub_2180BE9F8(v6, a1, a2);
}

uint64_t sub_2180C4418()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2180C4450(double *a1)
{
  return (*(uint64_t (**)(double, double))(v1 + 16))(*a1, a1[1]);
}

double sub_2180C4484@<D0>(double *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2180CF720();
  swift_release();
  swift_release();
  double result = v3;
  *a1 = v3;
  return result;
}

uint64_t sub_2180C4508()
{
  return sub_2180CF730();
}

void sub_2180C458C(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for AddressingView_iOS(0) - 8);
  uint64_t v4 = (long long *)(v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)));

  sub_2180BEEA4(a1, v4);
}

uint64_t sub_2180C4600()
{
  return sub_2180C4618(sub_2180BEFD4);
}

uint64_t sub_2180C4618(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for AddressingView_iOS(0) - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));

  return a1(v3);
}

uint64_t sub_2180C4690()
{
  return sub_2180C4618((uint64_t (*)(uint64_t))sub_2180BF4D8);
}

uint64_t sub_2180C46A8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 25, 7);
}

uint64_t sub_2180C46E0()
{
  return sub_2180BF464();
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

void *sub_2180C4704(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD7A8);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      void v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 56);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[7 * v8 + 4]) {
          memmove(v12, a4 + 4, 56 * v8);
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
    sub_2180C51D8(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_2180C482C(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BBDEB0);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 + 31;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 6);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_2180C52D0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_2180C493C(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD7A0);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2180C53C4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2180C4A4C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2180C4B20(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2180C4D2C((uint64_t)v12, *a3);
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
      sub_2180C4D2C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2180C4B20(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2180D00F0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_2180C4D88(a5, a6);
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
  uint64_t v8 = sub_2180D0170();
  if (!v8)
  {
    sub_2180D01D0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_2180D0230();
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

uint64_t sub_2180C4D2C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2180C4D88(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2180C4E20(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2180C5000(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2180C5000(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2180C4E20(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_2180C4F98(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_2180D0140();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_2180D01D0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2180CFE70();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_2180D0230();
    __break(1u);
LABEL_14:
    uint64_t result = sub_2180D01D0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_2180C4F98(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDE68);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2180C5000(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDE68);
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
  uint64_t result = sub_2180D0230();
  __break(1u);
  return result;
}

uint64_t sub_2180C5150(uint64_t a1, uint64_t a2)
{
  return a2;
}

_OWORD *sub_2180C51AC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

double UIEdgeInsetsInsetRect(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

uint64_t sub_2180C51D8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 56 * a1 + 32;
    unint64_t v6 = a3 + 56 * v4;
    if (v5 >= v6 || v5 + 56 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_2180D0230();
  __break(1u);
  return result;
}

uint64_t sub_2180C52D0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_2180D0230();
  __break(1u);
  return result;
}

uint64_t sub_2180C53C4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      return v6;
    }
  }
  uint64_t result = sub_2180D0230();
  __break(1u);
  return result;
}

uint64_t sub_2180C54B8()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_2180C54F8()
{
  sub_2180BFE84(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t initializeBufferWithCopyOfBuffer for CNAutocompleteSearchView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  return a1;
}

uint64_t destroy for CNAutocompleteSearchView()
{
  return swift_release();
}

void *assignWithCopy for CNAutocompleteSearchView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
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

void *assignWithTake for CNAutocompleteSearchView(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[2];
  a1[1] = a2[1];
  a1[2] = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CNAutocompleteSearchView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CNAutocompleteSearchView(uint64_t result, int a2, int a3)
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CNAutocompleteSearchView()
{
  return &type metadata for CNAutocompleteSearchView;
}

uint64_t sub_2180C5674()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2180C57C4()
{
  return MEMORY[0x263F1BB58];
}

unint64_t sub_2180C57D0()
{
  unint64_t result = qword_267BBDEC0;
  if (!qword_267BBDEC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBDEC0);
  }
  return result;
}

void sub_2180C5834(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v6 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    uint64_t v6 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (v6)
  {
    int64_t v9 = (void *)sub_2180CFE10();
    id v10 = objc_msgSend(self, sel_bundleWithIdentifier_, v9);

    if (v10)
    {
      sub_2180CF510();
      __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDEE0);
      uint64_t v11 = swift_allocObject();
      *(_OWORD *)(v11 + 16) = xmmword_2180D0FC0;
      uint64_t v12 = MEMORY[0x263F8D310];
      *(void *)(v11 + 56) = MEMORY[0x263F8D310];
      unint64_t v13 = sub_2180C5A00();
      *(void *)(v11 + 32) = a1;
      *(void *)(v11 + 40) = a2;
      *(void *)(v11 + 96) = v12;
      *(void *)(v11 + 104) = v13;
      *(void *)(v11 + 64) = v13;
      *(void *)(v11 + 72) = a3;
      *(void *)(v11 + 80) = a4;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_2180CFE20();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    swift_bridgeObjectRetain();
  }
}

unint64_t sub_2180C5A00()
{
  unint64_t result = qword_267BBDEE8;
  if (!qword_267BBDEE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBDEE8);
  }
  return result;
}

uint64_t sub_2180C5A54()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2180C5A8C(uint64_t a1)
{
  return sub_2180C0DD8(a1, *(void *)(v1 + 24), *(void *)(v1 + 32));
}

void sub_2180C5A98()
{
}

unint64_t sub_2180C5AB8()
{
  unint64_t result = qword_267BBDF20;
  if (!qword_267BBDF20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBDF20);
  }
  return result;
}

void sub_2180C5B0C()
{
}

uint64_t sub_2180C5B34()
{
  return 8;
}

uint64_t sub_2180C5B40()
{
  return swift_release();
}

uint64_t sub_2180C5B48(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_2180C5B58()
{
  return sub_2180CFDF0();
}

void *sub_2180C5BA0(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

ValueMetadata *type metadata accessor for SizePreferenceKey()
{
  return &type metadata for SizePreferenceKey;
}

uint64_t sub_2180C5BC8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_2180CFC00();
  uint64_t result = sub_2180CF830();
  *a1 = v2;
  a1[1] = v4;
  a1[2] = v5;
  return result;
}

void sub_2180C5C08()
{
  xmmword_267BBDF90 = 0uLL;
}

double sub_2180C5C18@<D0>(_OWORD *a1@<X8>)
{
  if (qword_267BBD660 != -1) {
    swift_once();
  }
  double result = *(double *)&xmmword_267BBDF90;
  *a1 = xmmword_267BBDF90;
  return result;
}

uint64_t sub_2180C5C80@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2180CF720();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2180C5D00(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  id v2 = v1;
  swift_retain();
  return sub_2180CF730();
}

uint64_t sub_2180C5D78()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2180CF720();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2180C5DF4()
{
  return sub_2180CF730();
}

uint64_t (*sub_2180C5E64(void *a1))()
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2180CF710();
  return sub_2180C5EF0;
}

uint64_t sub_2180C5EF4()
{
  return sub_2180C7D9C((uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__headerImage, &qword_267BBDFA8);
}

uint64_t sub_2180C5F08(uint64_t a1)
{
  return sub_2180C7E20(a1, &qword_267BBDFB0, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__headerImage, &qword_267BBDFA8);
}

uint64_t (*sub_2180C5F24(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDFB0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  int64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__headerImage;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDFA8);
  sub_2180CF6F0();
  swift_endAccess();
  return sub_2180C6034;
}

uint64_t sub_2180C6038@<X0>(void *a1@<X8>)
{
  return sub_2180C7124(a1);
}

uint64_t sub_2180C604C()
{
  return sub_2180C71B4();
}

uint64_t sub_2180C6060()
{
  return sub_2180C7248();
}

uint64_t sub_2180C607C()
{
  return sub_2180C72D0();
}

uint64_t (*sub_2180C6090(void *a1))()
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2180CF710();
  return sub_2180C5EF0;
}

uint64_t sub_2180C611C()
{
  return sub_2180C7D9C((uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__headerTitle, &qword_267BBDFC0);
}

uint64_t sub_2180C6130(uint64_t a1)
{
  return sub_2180C7E20(a1, &qword_267BBDFC8, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__headerTitle, &qword_267BBDFC0);
}

uint64_t (*sub_2180C614C(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDFC8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  int64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__headerTitle;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDFC0);
  sub_2180CF6F0();
  swift_endAccess();
  return sub_2180C6034;
}

double sub_2180C625C@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2180CF720();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_2180C62E4()
{
  return sub_2180CF730();
}

uint64_t sub_2180C6380()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2180CF720();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2180C6400()
{
  return sub_2180CF730();
}

uint64_t (*sub_2180C6490(void *a1))()
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2180CF710();
  return sub_2180C5EF0;
}

uint64_t sub_2180C651C()
{
  return sub_2180C7D9C((uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__yourNameAndEmail, &qword_267BBDFD8);
}

uint64_t sub_2180C6530(uint64_t a1)
{
  return sub_2180C7E20(a1, &qword_267BBDFE0, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__yourNameAndEmail, &qword_267BBDFD8);
}

uint64_t (*sub_2180C654C(void *a1))()
{
  long long v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDFE0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  int64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__yourNameAndEmail;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDFD8);
  sub_2180CF6F0();
  swift_endAccess();
  return sub_2180C6034;
}

uint64_t sub_2180C665C@<X0>(void *a1@<X8>)
{
  return sub_2180C7124(a1);
}

uint64_t sub_2180C6670()
{
  return sub_2180C71B4();
}

uint64_t sub_2180C6684()
{
  return sub_2180C7248();
}

uint64_t sub_2180C66A0()
{
  return sub_2180C72D0();
}

uint64_t (*sub_2180C66B4(void *a1))()
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2180CF710();
  return sub_2180C5EF0;
}

uint64_t sub_2180C6740()
{
  return sub_2180C7D9C((uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__inputText, &qword_267BBDFC0);
}

uint64_t sub_2180C6754(uint64_t a1)
{
  return sub_2180C7E20(a1, &qword_267BBDFC8, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__inputText, &qword_267BBDFC0);
}

uint64_t (*sub_2180C6770(void *a1))()
{
  long long v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDFC8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  int64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__inputText;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDFC0);
  sub_2180CF6F0();
  swift_endAccess();
  return sub_2180C6034;
}

uint64_t sub_2180C6880@<X0>(void *a1@<X8>)
{
  return sub_2180C7124(a1);
}

uint64_t sub_2180C6894()
{
  return sub_2180C71B4();
}

uint64_t sub_2180C68A8()
{
  return sub_2180C7248();
}

uint64_t sub_2180C68C4()
{
  return sub_2180C72D0();
}

uint64_t (*sub_2180C68D8(void *a1))()
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2180CF710();
  return sub_2180C5EF0;
}

uint64_t sub_2180C6964()
{
  return sub_2180C7D9C((uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__loadingText, &qword_267BBDFC0);
}

uint64_t sub_2180C6978(uint64_t a1)
{
  return sub_2180C7E20(a1, &qword_267BBDFC8, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__loadingText, &qword_267BBDFC0);
}

uint64_t (*sub_2180C6994(void *a1))()
{
  long long v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDFC8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  int64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__loadingText;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDFC0);
  sub_2180CF6F0();
  swift_endAccess();
  return sub_2180C6034;
}

uint64_t sub_2180C6AA4@<X0>(void *a1@<X8>)
{
  return sub_2180C7124(a1);
}

uint64_t sub_2180C6AB8()
{
  return sub_2180C71B4();
}

uint64_t sub_2180C6ACC()
{
  return sub_2180C7248();
}

uint64_t sub_2180C6AE8()
{
  return sub_2180C72D0();
}

uint64_t (*sub_2180C6AFC(void *a1))()
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2180CF710();
  return sub_2180C5EF0;
}

uint64_t sub_2180C6B88()
{
  return sub_2180C7D9C((uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__supplementaryText, &qword_267BBDFC0);
}

uint64_t sub_2180C6B9C(uint64_t a1)
{
  return sub_2180C7E20(a1, &qword_267BBDFC8, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__supplementaryText, &qword_267BBDFC0);
}

uint64_t (*sub_2180C6BB8(void *a1))()
{
  long long v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDFC8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  int64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__supplementaryText;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDFC0);
  sub_2180CF6F0();
  swift_endAccess();
  return sub_2180C6034;
}

uint64_t sub_2180C6CC8@<X0>(void *a1@<X8>)
{
  return sub_2180C7124(a1);
}

uint64_t sub_2180C6CDC()
{
  return sub_2180C71B4();
}

uint64_t sub_2180C6CF0()
{
  return sub_2180C7248();
}

uint64_t sub_2180C6D0C()
{
  return sub_2180C72D0();
}

uint64_t (*sub_2180C6D20(void *a1))()
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2180CF710();
  return sub_2180C5EF0;
}

uint64_t sub_2180C6DAC()
{
  return sub_2180C7D9C((uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__userInfoText, &qword_267BBDFC0);
}

uint64_t sub_2180C6DC0(uint64_t a1)
{
  return sub_2180C7E20(a1, &qword_267BBDFC8, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__userInfoText, &qword_267BBDFC0);
}

uint64_t (*sub_2180C6DDC(void *a1))()
{
  long long v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDFC8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  int64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__userInfoText;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDFC0);
  sub_2180CF6F0();
  swift_endAccess();
  return sub_2180C6034;
}

uint64_t sub_2180C6EEC@<X0>(void *a1@<X8>)
{
  return sub_2180C7124(a1);
}

uint64_t sub_2180C6F00()
{
  return sub_2180C71B4();
}

uint64_t sub_2180C6F14()
{
  return sub_2180C7248();
}

uint64_t sub_2180C6F30()
{
  return sub_2180C72D0();
}

uint64_t (*sub_2180C6F44(void *a1))()
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2180CF710();
  return sub_2180C5EF0;
}

uint64_t sub_2180C6FD0()
{
  return sub_2180C7D9C((uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__primaryButtonText, &qword_267BBDFC0);
}

uint64_t sub_2180C6FE4(uint64_t a1)
{
  return sub_2180C7E20(a1, &qword_267BBDFC8, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__primaryButtonText, &qword_267BBDFC0);
}

uint64_t (*sub_2180C7000(void *a1))()
{
  long long v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDFC8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  int64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__primaryButtonText;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDFC0);
  sub_2180CF6F0();
  swift_endAccess();
  return sub_2180C6034;
}

uint64_t sub_2180C7110@<X0>(void *a1@<X8>)
{
  return sub_2180C7124(a1);
}

uint64_t sub_2180C7124@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2180CF720();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_2180C71A0()
{
  return sub_2180C71B4();
}

uint64_t sub_2180C71B4()
{
  return sub_2180CF730();
}

uint64_t sub_2180C7234()
{
  return sub_2180C7248();
}

uint64_t sub_2180C7248()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2180CF720();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2180C72BC()
{
  return sub_2180C72D0();
}

uint64_t sub_2180C72D0()
{
  return sub_2180CF730();
}

uint64_t (*sub_2180C7348(void *a1))()
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2180CF710();
  return sub_2180C5EF0;
}

uint64_t sub_2180C73D4()
{
  return sub_2180C7D9C((uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__secondaryButtonText, &qword_267BBDFC0);
}

uint64_t sub_2180C73E8(uint64_t a1)
{
  return sub_2180C7E20(a1, &qword_267BBDFC8, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__secondaryButtonText, &qword_267BBDFC0);
}

uint64_t (*sub_2180C7404(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDFC8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  int64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__secondaryButtonText;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDFC0);
  sub_2180CF6F0();
  swift_endAccess();
  return sub_2180C6034;
}

uint64_t sub_2180C7514@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2180CF720();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2180C7594()
{
  return sub_2180CF730();
}

uint64_t sub_2180C7608()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2180CF720();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2180C7684()
{
  return sub_2180CF730();
}

uint64_t (*sub_2180C76F4(void *a1))()
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2180CF710();
  return sub_2180C5EF0;
}

uint64_t sub_2180C7780()
{
  return sub_2180C7D9C((uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__hideInnerNavigationBar, &qword_267BBE020);
}

uint64_t sub_2180C7794(uint64_t a1)
{
  return sub_2180C7E20(a1, &qword_267BBE028, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__hideInnerNavigationBar, &qword_267BBE020);
}

uint64_t (*sub_2180C77B0(void *a1))()
{
  char v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBE028);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  int64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__hideInnerNavigationBar;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBE020);
  sub_2180CF6F0();
  swift_endAccess();
  return sub_2180C6034;
}

uint64_t sub_2180C78C0@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2180CF720();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2180C7940()
{
  return sub_2180CF730();
}

uint64_t sub_2180C79BC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2180CF720();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2180C7A38()
{
  return sub_2180CF730();
}

uint64_t (*sub_2180C7AA8(void *a1))()
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2180CF710();
  return sub_2180C5EF0;
}

void sub_2180C7B34(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();

  free(v1);
}

uint64_t sub_2180C7B9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  return swift_endAccess();
}

uint64_t sub_2180C7C0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  unint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v18 - v14;
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v16((char *)&v18 - v14, a1, v9);
  v16(v13, (uint64_t)v15, v9);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a7);
  sub_2180CF700();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

uint64_t sub_2180C7D88()
{
  return sub_2180C7D9C((uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__addresses, &qword_267BBE038);
}

uint64_t sub_2180C7D9C(uint64_t a1, uint64_t *a2)
{
  return swift_endAccess();
}

uint64_t sub_2180C7E04(uint64_t a1)
{
  return sub_2180C7E20(a1, &qword_267BBE040, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__addresses, &qword_267BBE038);
}

uint64_t sub_2180C7E20(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_2180CF700();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*sub_2180C7F50(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBE040);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__addresses;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBE038);
  sub_2180CF6F0();
  swift_endAccess();
  return sub_2180C6034;
}

void sub_2180C8060(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  uint64_t v4 = *(void (**)(void, void, void))(*(void *)(*(void *)a1 + 88) + 16);
  v4(*(void *)(*(void *)a1 + 104), v3[14], v3[10]);
  uint64_t v5 = (void *)v3[14];
  size_t v6 = (void *)v3[12];
  uint64_t v7 = (void *)v3[13];
  uint64_t v8 = v3[10];
  uint64_t v9 = v3[11];
  if (a2)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_2180CF700();
    swift_endAccess();
    uint64_t v10 = *(void (**)(void *, uint64_t))(v9 + 8);
    v10(v7, v8);
    v10(v5, v8);
  }
  else
  {
    swift_beginAccess();
    sub_2180CF700();
    swift_endAccess();
    (*(void (**)(void *, uint64_t))(v9 + 8))(v5, v8);
  }
  free(v5);
  free(v7);
  free(v6);

  free(v3);
}

BOOL sub_2180C81D0()
{
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel_primaryButtonWasClicked)) {
    return 1;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2180CF720();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v1 = HIBYTE(v5) & 0xF;
  if ((v5 & 0x2000000000000000) == 0) {
    uint64_t v1 = v4 & 0xFFFFFFFFFFFFLL;
  }
  if (v1) {
    return 1;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2180CF720();
  swift_release();
  swift_release();
  uint64_t v3 = *(void *)(v4 + 16);
  swift_bridgeObjectRelease();
  return v3 == 0;
}

uint64_t AddressingViewModel.__allocating_init(headerImageData:headerTitle:loadingText:supplementaryText:userInfoText:primaryButtonText:secondaryButtonText:userDidClickPrimaryButton:userDidClickSecondaryButton:userDidClickShowContactPicker:userDidChangeAddresses:)(uint64_t a1, unint64_t a2, void *a3, unint64_t a4, void *a5, unint64_t a6, void *a7, unint64_t a8, void *a9, unint64_t a10, void *a11, unint64_t a12, void *a13, unint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  uint64_t v29 = swift_allocObject();
  AddressingViewModel.init(headerImageData:headerTitle:loadingText:supplementaryText:userInfoText:primaryButtonText:secondaryButtonText:userDidClickPrimaryButton:userDidClickSecondaryButton:userDidClickShowContactPicker:userDidChangeAddresses:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22);
  return v29;
}

uint64_t AddressingViewModel.init(headerImageData:headerTitle:loadingText:supplementaryText:userInfoText:primaryButtonText:secondaryButtonText:userDidClickPrimaryButton:userDidClickSecondaryButton:userDidClickShowContactPicker:userDidChangeAddresses:)(uint64_t a1, unint64_t a2, void *a3, unint64_t a4, void *a5, unint64_t a6, void *a7, unint64_t a8, void *a9, unint64_t a10, void *a11, unint64_t a12, void *a13, unint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  uint64_t v23 = v22;
  unint64_t v77 = a8;
  uint64_t v76 = a7;
  unint64_t v75 = a6;
  uint64_t v74 = a5;
  unint64_t v73 = a4;
  uint64_t v72 = a3;
  uint64_t v91 = a21;
  uint64_t v92 = a22;
  uint64_t v93 = a19;
  uint64_t v94 = a20;
  uint64_t v95 = a17;
  uint64_t v96 = a18;
  uint64_t v98 = a16;
  unint64_t v99 = a2;
  uint64_t v97 = a15;
  unint64_t v84 = a14;
  uint64_t v83 = a13;
  unint64_t v82 = a12;
  uint64_t v81 = a11;
  unint64_t v79 = a10;
  uint64_t v78 = a9;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBE040);
  uint64_t v86 = *(void *)(v25 - 8);
  uint64_t v87 = v25;
  MEMORY[0x270FA5388](v25);
  uint64_t v85 = (char *)&v72 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBE048);
  uint64_t v89 = *(void *)(v27 - 8);
  uint64_t v90 = v27;
  MEMORY[0x270FA5388](v27);
  uint64_t v88 = (char *)&v72 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBE020);
  uint64_t v30 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  uint64_t v32 = (char *)&v72 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDFA8);
  uint64_t v34 = *(void *)(v33 - 8);
  MEMORY[0x270FA5388](v33);
  uint64_t v36 = (char *)&v72 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = v23 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__headerImage;
  uint64_t v100 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBE050);
  sub_2180CF6E0();
  (*(void (**)(uint64_t, char *, uint64_t))(v34 + 32))(v37, v36, v33);
  *(unsigned char *)(v23 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel_primaryButtonWasClicked) = 0;
  uint64_t v38 = v23 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__hideInnerNavigationBar;
  LOBYTE(v100) = 1;
  sub_2180CF6E0();
  (*(void (**)(uint64_t, char *, uint64_t))(v30 + 32))(v38, v32, v29);
  swift_unknownObjectWeakInit();
  *(void *)(v23 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel_store) = MEMORY[0x263F8EE88];
  uint64_t v80 = a1;
  if (v99 >> 60 == 15)
  {
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v37, v33);
    id v104 = 0;
    sub_2180CF6E0();
    swift_endAccess();
  }
  else
  {
    id v39 = objc_allocWithZone(MEMORY[0x263F827E8]);
    unint64_t v40 = v99;
    sub_2180C8F34(a1, v99);
    id v41 = (void *)sub_2180CF5B0();
    id v42 = objc_msgSend(v39, sel_initWithData_, v41);

    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v37, v33);
    id v104 = v42;
    sub_2180CF6E0();
    swift_endAccess();
    sub_2180C8EC8(a1, v40);
  }
  if (v73) {
    id v43 = v72;
  }
  else {
    id v43 = 0;
  }
  unint64_t v44 = 0xE000000000000000;
  if (v73) {
    unint64_t v45 = v73;
  }
  else {
    unint64_t v45 = 0xE000000000000000;
  }
  swift_beginAccess();
  id v104 = v43;
  unint64_t v105 = v45;
  sub_2180CF6E0();
  swift_endAccess();
  swift_beginAccess();
  uint64_t v100 = 0;
  unint64_t v101 = 0xE000000000000000;
  uint64_t v102 = 0;
  unint64_t v103 = 0xE000000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBE060);
  sub_2180CF6E0();
  swift_endAccess();
  swift_beginAccess();
  id v104 = 0;
  unint64_t v105 = 0xE000000000000000;
  sub_2180CF6E0();
  swift_endAccess();
  if (v75) {
    double v46 = v74;
  }
  else {
    double v46 = 0;
  }
  if (v75) {
    unint64_t v47 = v75;
  }
  else {
    unint64_t v47 = 0xE000000000000000;
  }
  swift_beginAccess();
  id v104 = v46;
  unint64_t v105 = v47;
  sub_2180CF6E0();
  swift_endAccess();
  if (v77) {
    double v48 = v76;
  }
  else {
    double v48 = 0;
  }
  if (v77) {
    unint64_t v49 = v77;
  }
  else {
    unint64_t v49 = 0xE000000000000000;
  }
  swift_beginAccess();
  id v104 = v48;
  unint64_t v105 = v49;
  sub_2180CF6E0();
  swift_endAccess();
  if (v79) {
    double v50 = v78;
  }
  else {
    double v50 = 0;
  }
  if (v79) {
    unint64_t v51 = v79;
  }
  else {
    unint64_t v51 = 0xE000000000000000;
  }
  swift_beginAccess();
  id v104 = v50;
  unint64_t v105 = v51;
  sub_2180CF6E0();
  swift_endAccess();
  if (v82) {
    double v52 = v81;
  }
  else {
    double v52 = 0;
  }
  if (v82) {
    unint64_t v53 = v82;
  }
  else {
    unint64_t v53 = 0xE000000000000000;
  }
  swift_beginAccess();
  id v104 = v52;
  unint64_t v105 = v53;
  sub_2180CF6E0();
  swift_endAccess();
  double v54 = (void *)(v23 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel_primaryButtonDidClick);
  uint64_t v56 = v97;
  uint64_t v55 = v98;
  *double v54 = v97;
  v54[1] = v55;
  if (v84) {
    id v57 = v83;
  }
  else {
    id v57 = 0;
  }
  if (v84) {
    unint64_t v44 = v84;
  }
  swift_beginAccess();
  id v104 = v57;
  unint64_t v105 = v44;
  sub_2180AC708(v56);
  sub_2180CF6E0();
  swift_endAccess();
  uint64_t v58 = (uint64_t *)(v23 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel_secondaryButtonDidClick);
  uint64_t v60 = v95;
  uint64_t v59 = v96;
  *uint64_t v58 = v95;
  v58[1] = v59;
  id v61 = (uint64_t *)(v23 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel_showContactPickerDidClick);
  uint64_t v62 = v93;
  uint64_t v63 = v94;
  *id v61 = v93;
  v61[1] = v63;
  uint64_t v64 = (uint64_t *)(v23 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel_addressesDidChange);
  uint64_t v65 = v91;
  uint64_t v66 = v92;
  *uint64_t v64 = v91;
  v64[1] = v66;
  swift_beginAccess();
  id v104 = (id)MEMORY[0x263F8EE78];
  sub_2180AC708(v60);
  sub_2180AC708(v62);
  sub_2180AC708(v65);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBE068);
  sub_2180CF6E0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBE038);
  CGRect v67 = v85;
  sub_2180CF6F0();
  swift_endAccess();
  sub_2180AEE00(&qword_267BBE070, &qword_267BBE040);
  sub_2180C8D98();
  uint64_t v68 = v87;
  uint64_t v69 = v88;
  sub_2180CF750();
  (*(void (**)(char *, uint64_t))(v86 + 8))(v67, v68);
  swift_allocObject();
  swift_weakInit();
  sub_2180AEE00(&qword_267BBE080, &qword_267BBE048);
  uint64_t v70 = v90;
  sub_2180CF760();
  swift_release();
  (*(void (**)(char *, uint64_t))(v89 + 8))(v69, v70);
  swift_beginAccess();
  sub_2180CF6C0();
  swift_endAccess();
  sub_2180AC8B8(v65);
  sub_2180AC8B8(v62);
  sub_2180AC8B8(v60);
  sub_2180AC8B8(v97);
  sub_2180C8EC8(v80, v99);
  swift_release();
  return v23;
}

unint64_t sub_2180C8D98()
{
  unint64_t result = qword_267BBE078;
  if (!qword_267BBE078)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BBE068);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BBE078);
  }
  return result;
}

uint64_t sub_2180C8E04()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2180C8E3C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v3 = *(void (**)(uint64_t))(result
                                        + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel_addressesDidChange);
    if (v3) {
      v3(v1);
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_2180C8EC0(uint64_t *a1)
{
  return sub_2180C8E3C(a1);
}

uint64_t sub_2180C8EC8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_2180C8EDC(a1, a2);
  }
  return a1;
}

uint64_t sub_2180C8EDC(uint64_t a1, unint64_t a2)
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

uint64_t sub_2180C8F34(uint64_t a1, unint64_t a2)
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

void sub_2180C8F8C(void *a1, void *a2)
{
  if (!a1) {
    goto LABEL_20;
  }
  id v4 = a1;
  id v5 = objc_msgSend(v4, sel_emailAddresses);
  unint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBE090);
  unint64_t v7 = sub_2180CFEA0();

  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_2180D01F0();
    swift_bridgeObjectRelease();
    if (v15) {
      goto LABEL_4;
    }
LABEL_10:
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  if (!*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_10;
  }
LABEL_4:
  if ((v7 & 0xC000000000000001) != 0)
  {
    id v8 = (id)MEMORY[0x21D460E10](0, v7);
  }
  else
  {
    if (!*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
LABEL_54:
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_2180D01F0();
      swift_bridgeObjectRelease();
      if (v48) {
        goto LABEL_13;
      }
      goto LABEL_55;
    }
    id v8 = *(id *)(v7 + 32);
  }
  uint64_t v9 = v8;
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(v9, sel_value);

  if (v10)
  {
    sub_2180CFE50();
    id v11 = objc_allocWithZone(MEMORY[0x263F33430]);
    id v12 = v4;
    unint64_t v13 = (void *)sub_2180CFE10();
    swift_bridgeObjectRelease();
    id v14 = objc_msgSend(v11, sel_initWithContact_address_kind_, v12, v13, 0);

LABEL_17:
    if (v14)
    {
      uint64_t v23 = (void *)MEMORY[0x21D4616F0](v2 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel_contactsSearchController);
      objc_msgSend(v23, sel_addRecipient_, v14);
    }
LABEL_20:
    if (!a2) {
      goto LABEL_49;
    }
LABEL_21:
    id v24 = a2;
    id v25 = objc_msgSend(v24, sel_key);
    uint64_t v26 = sub_2180CFE50();
    uint64_t v28 = v27;

    if (v26 == sub_2180CFE50() && v28 == v29)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v31 = sub_2180D0250();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v31 & 1) == 0) {
        goto LABEL_35;
      }
    }
    if (objc_msgSend(v24, sel_value))
    {
      sub_2180D0100();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v50 = 0u;
      long long v51 = 0u;
    }
    sub_2180C9644((uint64_t)&v50, (uint64_t)v52);
    if (v53)
    {
      if (swift_dynamicCast())
      {
        id v32 = objc_msgSend(v24, sel_contact);
        id v33 = objc_allocWithZone(MEMORY[0x263F33430]);
        uint64_t v34 = (void *)sub_2180CFE10();
        swift_bridgeObjectRelease();
        id v35 = objc_msgSend(v33, sel_initWithContact_address_kind_, v32, v34, 0);
        goto LABEL_45;
      }
    }
    else
    {
      sub_2180C96AC((uint64_t)v52);
    }
LABEL_35:
    id v36 = objc_msgSend(v24, sel_key);
    uint64_t v37 = sub_2180CFE50();
    uint64_t v39 = v38;

    if (v37 == sub_2180CFE50() && v39 == v40)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v41 = sub_2180D0250();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v41 & 1) == 0) {
        goto LABEL_48;
      }
    }
    if (objc_msgSend(v24, sel_value))
    {
      sub_2180D0100();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v50 = 0u;
      long long v51 = 0u;
    }
    sub_2180C9644((uint64_t)&v50, (uint64_t)v52);
    if (v53)
    {
      sub_2180C970C();
      if (swift_dynamicCast())
      {
        id v42 = objc_msgSend(v49, sel_stringValue);

        sub_2180CFE50();
        id v32 = objc_msgSend(v24, sel_contact);
        id v43 = objc_allocWithZone(MEMORY[0x263F33430]);
        uint64_t v34 = (void *)sub_2180CFE10();
        swift_bridgeObjectRelease();
        id v35 = objc_msgSend(v43, sel_initWithContact_address_kind_, v32, v34, 1);
LABEL_45:
        unint64_t v44 = v35;

        if (v44)
        {
          unint64_t v45 = (void *)MEMORY[0x21D4616F0](v2 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel_contactsSearchController);
          objc_msgSend(v45, sel_addRecipient_, v44);

          goto LABEL_49;
        }
      }
    }
    else
    {
      sub_2180C96AC((uint64_t)v52);
    }
LABEL_48:

    goto LABEL_49;
  }
LABEL_11:
  id v16 = objc_msgSend(v4, sel_phoneNumbers);
  unint64_t v6 = sub_2180CFEA0();

  if (v6 >> 62) {
    goto LABEL_54;
  }
  if (*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_13:
    if ((v6 & 0xC000000000000001) != 0)
    {
      id v17 = (id)MEMORY[0x21D460E10](0, v6);
    }
    else
    {
      if (!*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        return;
      }
      id v17 = *(id *)(v6 + 32);
    }
    uint64_t v18 = v17;
    swift_bridgeObjectRelease();
    id v19 = objc_msgSend(v18, sel_value);

    id v20 = objc_msgSend(v19, sel_stringValue);
    sub_2180CFE50();

    id v21 = objc_allocWithZone(MEMORY[0x263F33430]);
    id v22 = v4;
    unint64_t v13 = (void *)sub_2180CFE10();
    swift_bridgeObjectRelease();
    id v14 = objc_msgSend(v21, sel_initWithContact_address_kind_, v22, v13, 1);
    goto LABEL_17;
  }
LABEL_55:

  swift_bridgeObjectRelease();
  if (a2) {
    goto LABEL_21;
  }
LABEL_49:
  double v46 = (void *)MEMORY[0x21D4616F0](v2 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel_contactsSearchController);
  if (v46)
  {
    unint64_t v47 = v46;
    objc_msgSend(v46, sel_becomeFirstResponder);
  }
}

uint64_t sub_2180C9644(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDE70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2180C96AC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDE70);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2180C970C()
{
  unint64_t result = qword_267BBE088;
  if (!qword_267BBE088)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267BBE088);
  }
  return result;
}

uint64_t sub_2180C974C(uint64_t a1, unint64_t a2, void *a3, unint64_t a4, void *a5, unint64_t a6, void *a7, unint64_t a8, void *a9, unint64_t a10, void *a11, unint64_t a12, void *a13, unint64_t a14)
{
  unint64_t v14 = a8;
  uint64_t v15 = a7;
  if (a2 >> 60 == 15)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    id v46 = 0;
    swift_retain();
    sub_2180CF730();
  }
  else
  {
    id v22 = objc_allocWithZone(MEMORY[0x263F827E8]);
    sub_2180C8F34(a1, a2);
    uint64_t v23 = (void *)sub_2180CF5B0();
    id v24 = objc_msgSend(v22, sel_initWithData_, v23);

    swift_getKeyPath();
    swift_getKeyPath();
    id v46 = v24;
    uint64_t v15 = a7;
    unint64_t v14 = a8;
    swift_retain();
    sub_2180CF730();
    sub_2180C8EC8(a1, a2);
  }
  if (a4) {
    id v25 = a3;
  }
  else {
    id v25 = 0;
  }
  if (a4) {
    unint64_t v26 = a4;
  }
  else {
    unint64_t v26 = 0xE000000000000000;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  sub_2180CF720();
  swift_release();
  swift_release();
  if (v46 == v25 && v47 == v26)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v27 = sub_2180D0250();
    swift_bridgeObjectRelease();
    if (v27)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      id v46 = v25;
      unint64_t v47 = v26;
      swift_retain();
      sub_2180CF730();
    }
  }
  if (a6) {
    id v28 = a5;
  }
  else {
    id v28 = 0;
  }
  if (a6) {
    unint64_t v29 = a6;
  }
  else {
    unint64_t v29 = 0xE000000000000000;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  sub_2180CF720();
  swift_release();
  swift_release();
  if (v46 == v28 && v47 == v29)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v30 = sub_2180D0250();
    swift_bridgeObjectRelease();
    if (v30)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      id v46 = v28;
      unint64_t v47 = v29;
      swift_retain();
      sub_2180CF730();
    }
  }
  if (v14) {
    id v31 = v15;
  }
  else {
    id v31 = 0;
  }
  if (v14) {
    unint64_t v32 = v14;
  }
  else {
    unint64_t v32 = 0xE000000000000000;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  sub_2180CF720();
  swift_release();
  swift_release();
  if (v46 == v31 && v47 == v32)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v33 = sub_2180D0250();
    swift_bridgeObjectRelease();
    if (v33)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      id v46 = v31;
      unint64_t v47 = v32;
      swift_retain();
      sub_2180CF730();
    }
  }
  if (a10) {
    id v34 = a9;
  }
  else {
    id v34 = 0;
  }
  if (a10) {
    unint64_t v35 = a10;
  }
  else {
    unint64_t v35 = 0xE000000000000000;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  sub_2180CF720();
  swift_release();
  swift_release();
  if (v46 == v34 && v47 == v35)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v36 = sub_2180D0250();
    swift_bridgeObjectRelease();
    if (v36)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      id v46 = v34;
      unint64_t v47 = v35;
      swift_retain();
      sub_2180CF730();
    }
  }
  if (a12) {
    id v37 = a11;
  }
  else {
    id v37 = 0;
  }
  if (a12) {
    unint64_t v38 = a12;
  }
  else {
    unint64_t v38 = 0xE000000000000000;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  sub_2180CF720();
  swift_release();
  swift_release();
  if (v46 == v37 && v47 == v38)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v39 = sub_2180D0250();
    swift_bridgeObjectRelease();
    if (v39)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      id v46 = v37;
      unint64_t v47 = v38;
      swift_retain();
      sub_2180CF730();
    }
  }
  if (a14) {
    id v40 = a13;
  }
  else {
    id v40 = 0;
  }
  if (a14) {
    unint64_t v41 = a14;
  }
  else {
    unint64_t v41 = 0xE000000000000000;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  sub_2180CF720();
  swift_release();
  swift_release();
  if (v46 == v40 && v47 == v41) {
    return swift_bridgeObjectRelease_n();
  }
  char v43 = sub_2180D0250();
  swift_bridgeObjectRelease();
  if (v43) {
    return swift_bridgeObjectRelease();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_2180CF730();
}

uint64_t AddressingViewModel.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__headerImage;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDFA8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__headerTitle;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDFC0);
  id v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  uint64_t v6 = v0 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__yourNameAndEmail;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBDFD8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  v5(v0 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__inputText, v4);
  v5(v0 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__loadingText, v4);
  v5(v0 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__supplementaryText, v4);
  v5(v0 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__userInfoText, v4);
  v5(v0 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__primaryButtonText, v4);
  sub_2180AC8B8(*(void *)(v0 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel_primaryButtonDidClick));
  v5(v0 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__secondaryButtonText, v4);
  sub_2180AC8B8(*(void *)(v0 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel_secondaryButtonDidClick));
  sub_2180AC8B8(*(void *)(v0 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel_showContactPickerDidClick));
  uint64_t v8 = v0 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__hideInnerNavigationBar;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBE020);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  uint64_t v10 = v0 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__addresses;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBE038);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  swift_unknownObjectWeakDestroy();
  sub_2180AC8B8(*(void *)(v0 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel_addressesDidChange));
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t AddressingViewModel.__deallocating_deinit()
{
  AddressingViewModel.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_2180CA16C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for AddressingViewModel();
  uint64_t result = sub_2180CF6D0();
  *a1 = result;
  return result;
}

uint64_t sub_2180CA1AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2180C7B9C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__headerImage, &qword_267BBDFA8);
}

uint64_t sub_2180CA1D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2180C7C0C(a1, a2, a3, a4, &qword_267BBDFB0, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__headerImage, &qword_267BBDFA8);
}

uint64_t sub_2180CA204(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2180C7B9C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__headerTitle, &qword_267BBDFC0);
}

uint64_t sub_2180CA22C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2180C7C0C(a1, a2, a3, a4, &qword_267BBDFC8, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__headerTitle, &qword_267BBDFC0);
}

uint64_t sub_2180CA25C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2180C7B9C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__yourNameAndEmail, &qword_267BBDFD8);
}

uint64_t sub_2180CA284(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2180C7C0C(a1, a2, a3, a4, &qword_267BBDFE0, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__yourNameAndEmail, &qword_267BBDFD8);
}

uint64_t sub_2180CA2B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2180C7B9C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__inputText, &qword_267BBDFC0);
}

uint64_t sub_2180CA2DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2180C7C0C(a1, a2, a3, a4, &qword_267BBDFC8, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__inputText, &qword_267BBDFC0);
}

uint64_t sub_2180CA30C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2180C7B9C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__loadingText, &qword_267BBDFC0);
}

uint64_t sub_2180CA334(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2180C7C0C(a1, a2, a3, a4, &qword_267BBDFC8, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__loadingText, &qword_267BBDFC0);
}

uint64_t sub_2180CA364(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2180C7B9C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__supplementaryText, &qword_267BBDFC0);
}

uint64_t sub_2180CA38C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2180C7C0C(a1, a2, a3, a4, &qword_267BBDFC8, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__supplementaryText, &qword_267BBDFC0);
}

uint64_t sub_2180CA3BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2180C7B9C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__userInfoText, &qword_267BBDFC0);
}

uint64_t sub_2180CA3E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2180C7C0C(a1, a2, a3, a4, &qword_267BBDFC8, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__userInfoText, &qword_267BBDFC0);
}

uint64_t sub_2180CA414(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2180C7B9C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__primaryButtonText, &qword_267BBDFC0);
}

uint64_t sub_2180CA43C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2180C7C0C(a1, a2, a3, a4, &qword_267BBDFC8, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__primaryButtonText, &qword_267BBDFC0);
}

uint64_t sub_2180CA46C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2180C7B9C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__secondaryButtonText, &qword_267BBDFC0);
}

uint64_t sub_2180CA494(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2180C7C0C(a1, a2, a3, a4, &qword_267BBDFC8, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__secondaryButtonText, &qword_267BBDFC0);
}

uint64_t sub_2180CA4C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2180C7B9C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__hideInnerNavigationBar, &qword_267BBE020);
}

uint64_t sub_2180CA4EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2180C7C0C(a1, a2, a3, a4, &qword_267BBE028, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__hideInnerNavigationBar, &qword_267BBE020);
}

uint64_t sub_2180CA51C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2180C7B9C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__addresses, &qword_267BBE038);
}

uint64_t sub_2180CA544(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2180C7C0C(a1, a2, a3, a4, &qword_267BBE040, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__addresses, &qword_267BBE038);
}

uint64_t sub_2180CA574()
{
  return type metadata accessor for AddressingViewModel();
}

uint64_t type metadata accessor for AddressingViewModel()
{
  uint64_t result = qword_267BBE098;
  if (!qword_267BBE098) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2180CA5C8()
{
  sub_2180CB468(319, &qword_267BBE0A8, &qword_267BBE050);
  if (v0 <= 0x3F)
  {
    sub_2180CB420(319, &qword_267BBE0B0);
    if (v1 <= 0x3F)
    {
      sub_2180CB468(319, &qword_267BBE0B8, &qword_267BBE060);
      if (v2 <= 0x3F)
      {
        sub_2180CB420(319, &qword_267BBE0C0);
        if (v3 <= 0x3F)
        {
          sub_2180CB468(319, &qword_267BBE0C8, &qword_267BBE068);
          if (v4 <= 0x3F) {
            swift_updateClassMetadata2();
          }
        }
      }
    }
  }
}

uint64_t method lookup function for AddressingViewModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AddressingViewModel);
}

uint64_t dispatch thunk of AddressingViewModel.headerImage.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of AddressingViewModel.headerImage.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of AddressingViewModel.headerImage.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of AddressingViewModel.$headerImage.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of AddressingViewModel.$headerImage.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of AddressingViewModel.$headerImage.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t dispatch thunk of AddressingViewModel.headerTitle.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of AddressingViewModel.headerTitle.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

uint64_t dispatch thunk of AddressingViewModel.headerTitle.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

uint64_t dispatch thunk of AddressingViewModel.$headerTitle.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 296))();
}

uint64_t dispatch thunk of AddressingViewModel.$headerTitle.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 304))();
}

uint64_t dispatch thunk of AddressingViewModel.$headerTitle.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 312))();
}

uint64_t dispatch thunk of AddressingViewModel.yourNameAndEmail.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320))();
}

uint64_t dispatch thunk of AddressingViewModel.yourNameAndEmail.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 328))();
}

uint64_t dispatch thunk of AddressingViewModel.yourNameAndEmail.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 336))();
}

uint64_t dispatch thunk of AddressingViewModel.$yourNameAndEmail.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 344))();
}

uint64_t dispatch thunk of AddressingViewModel.$yourNameAndEmail.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 352))();
}

uint64_t dispatch thunk of AddressingViewModel.$yourNameAndEmail.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 360))();
}

uint64_t dispatch thunk of AddressingViewModel.inputText.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 368))();
}

uint64_t dispatch thunk of AddressingViewModel.inputText.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 376))();
}

uint64_t dispatch thunk of AddressingViewModel.inputText.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 384))();
}

uint64_t dispatch thunk of AddressingViewModel.$inputText.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 392))();
}

uint64_t dispatch thunk of AddressingViewModel.$inputText.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 400))();
}

uint64_t dispatch thunk of AddressingViewModel.$inputText.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 408))();
}

uint64_t dispatch thunk of AddressingViewModel.loadingText.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 416))();
}

uint64_t dispatch thunk of AddressingViewModel.loadingText.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 424))();
}

uint64_t dispatch thunk of AddressingViewModel.loadingText.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 432))();
}

uint64_t dispatch thunk of AddressingViewModel.$loadingText.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 440))();
}

uint64_t dispatch thunk of AddressingViewModel.$loadingText.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 448))();
}

uint64_t dispatch thunk of AddressingViewModel.$loadingText.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 456))();
}

uint64_t dispatch thunk of AddressingViewModel.supplementaryText.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 464))();
}

uint64_t dispatch thunk of AddressingViewModel.supplementaryText.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 472))();
}

uint64_t dispatch thunk of AddressingViewModel.supplementaryText.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 480))();
}

uint64_t dispatch thunk of AddressingViewModel.$supplementaryText.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 488))();
}

uint64_t dispatch thunk of AddressingViewModel.$supplementaryText.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 496))();
}

uint64_t dispatch thunk of AddressingViewModel.$supplementaryText.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 504))();
}

uint64_t dispatch thunk of AddressingViewModel.userInfoText.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 512))();
}

uint64_t dispatch thunk of AddressingViewModel.userInfoText.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 520))();
}

uint64_t dispatch thunk of AddressingViewModel.userInfoText.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 528))();
}

uint64_t dispatch thunk of AddressingViewModel.$userInfoText.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 536))();
}

uint64_t dispatch thunk of AddressingViewModel.$userInfoText.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 544))();
}

uint64_t dispatch thunk of AddressingViewModel.$userInfoText.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 552))();
}

uint64_t dispatch thunk of AddressingViewModel.primaryButtonText.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 560))();
}

uint64_t dispatch thunk of AddressingViewModel.primaryButtonText.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 568))();
}

uint64_t dispatch thunk of AddressingViewModel.primaryButtonText.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 576))();
}

uint64_t dispatch thunk of AddressingViewModel.$primaryButtonText.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 584))();
}

uint64_t dispatch thunk of AddressingViewModel.$primaryButtonText.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 592))();
}

uint64_t dispatch thunk of AddressingViewModel.$primaryButtonText.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 600))();
}

uint64_t dispatch thunk of AddressingViewModel.secondaryButtonText.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 632))();
}

uint64_t dispatch thunk of AddressingViewModel.secondaryButtonText.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 640))();
}

uint64_t dispatch thunk of AddressingViewModel.secondaryButtonText.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 648))();
}

uint64_t dispatch thunk of AddressingViewModel.$secondaryButtonText.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 656))();
}

uint64_t dispatch thunk of AddressingViewModel.$secondaryButtonText.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 664))();
}

uint64_t dispatch thunk of AddressingViewModel.$secondaryButtonText.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 672))();
}

uint64_t dispatch thunk of AddressingViewModel.hideInnerNavigationBar.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 680))();
}

uint64_t dispatch thunk of AddressingViewModel.hideInnerNavigationBar.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 688))();
}

uint64_t dispatch thunk of AddressingViewModel.hideInnerNavigationBar.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 696))();
}

uint64_t dispatch thunk of AddressingViewModel.$hideInnerNavigationBar.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 704))();
}

uint64_t dispatch thunk of AddressingViewModel.$hideInnerNavigationBar.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 712))();
}

uint64_t dispatch thunk of AddressingViewModel.$hideInnerNavigationBar.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 720))();
}

uint64_t dispatch thunk of AddressingViewModel.addresses.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 728))();
}

uint64_t dispatch thunk of AddressingViewModel.addresses.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 736))();
}

uint64_t dispatch thunk of AddressingViewModel.addresses.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 744))();
}

uint64_t dispatch thunk of AddressingViewModel.$addresses.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 752))();
}

uint64_t dispatch thunk of AddressingViewModel.$addresses.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 760))();
}

uint64_t dispatch thunk of AddressingViewModel.$addresses.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 768))();
}

uint64_t dispatch thunk of AddressingViewModel.primaryButtonIsDisabled.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 800))();
}

uint64_t dispatch thunk of AddressingViewModel.__allocating_init(headerImageData:headerTitle:loadingText:supplementaryText:userInfoText:primaryButtonText:secondaryButtonText:userDidClickPrimaryButton:userDidClickSecondaryButton:userDidClickShowContactPicker:userDidChangeAddresses:)()
{
  return (*(uint64_t (**)(void))(v0 + 832))();
}

uint64_t dispatch thunk of AddressingViewModel.addAddress(from:contactProperty:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 848))();
}

uint64_t dispatch thunk of AddressingViewModel.update(headerImageData:headerTitle:loadingText:supplementaryText:userInfoText:primaryButtonText:secondaryButtonText:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 856))();
}

void sub_2180CB420(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_2180CF740();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

void sub_2180CB468(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    unint64_t v4 = sub_2180CF740();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void URL.evictionSafeResourceValues(forKeys:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v19 = a2;
  v22[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBE0D0);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v20 = (uint64_t)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v18 - v6;
  v22[0] = 0;
  uint64_t v8 = sub_2180CF520();
  uint64_t v9 = *(void *)(v8 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
  id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08830]), sel_init);
  uint64_t v11 = (void *)sub_2180CF570();
  id v12 = (void *)swift_allocObject();
  v12[2] = v7;
  uint64_t v12[3] = a1;
  v12[4] = v22;
  unint64_t v13 = (void *)swift_allocObject();
  v13[2] = sub_2180CB9BC;
  v13[3] = v12;
  aBlock[4] = sub_2180CB9D8;
  aBlock[5] = v13;
  aBlock[0] = (id)MEMORY[0x263EF8330];
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_2180CBA00;
  aBlock[3] = &block_descriptor_1;
  unint64_t v14 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  aBlock[0] = 0;
  objc_msgSend(v10, sel_coordinateReadingItemAtURL_options_error_byAccessor_, v11, 4, aBlock, v14);
  _Block_release(v14);

  id v15 = aBlock[0];
  LOBYTE(v14) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v14) {
    __break(1u);
  }
  if (v15)
  {
    id v16 = v15;
    swift_willThrow();
    sub_2180CBB64((uint64_t)v7);

    swift_release();
  }
  else if (v22[0])
  {
    v22[0];
    swift_willThrow();
    sub_2180CBB64((uint64_t)v7);

    swift_release();
  }
  else
  {
    uint64_t v17 = v20;
    sub_2180CBAFC((uint64_t)v7, v20);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v17, 1, v8) == 1)
    {
      __break(1u);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32))(v19, v17, v8);
      sub_2180CBB64((uint64_t)v7);

      swift_release();
    }
  }
}

uint64_t sub_2180CB844(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBE0D0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2180CF580();
  uint64_t v6 = sub_2180CF520();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 0, 1, v6);
  return sub_2180CBC04((uint64_t)v5, a2);
}

uint64_t sub_2180CB984()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2180CB9BC(uint64_t a1)
{
  return sub_2180CB844(a1, *(void *)(v1 + 16));
}

uint64_t sub_2180CB9C8()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2180CB9D8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_2180CBA00(uint64_t a1)
{
  uint64_t v2 = sub_2180CF5A0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void (**)(char *))(a1 + 32);
  sub_2180CF590();
  v6(v5);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
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

uint64_t sub_2180CBAFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBE0D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2180CBB64(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBE0D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2180CBBC4()
{
  unint64_t result = qword_267BBE0E0;
  if (!qword_267BBE0E0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267BBE0E0);
  }
  return result;
}

uint64_t sub_2180CBC04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBE0D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

id HostingControllerAndModelUpdates.__allocating_init(viewController:sourceAppBundleIDDidChangeBlock:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (char *)objc_allocWithZone(v3);
  *(void *)&v7[OBJC_IVAR____TtC14CloudSharingUI32HostingControllerAndModelUpdates_viewController] = a1;
  uint64_t v8 = &v7[OBJC_IVAR____TtC14CloudSharingUI32HostingControllerAndModelUpdates_sourceAppBundleIDDidChangeBlock];
  *(void *)uint64_t v8 = a2;
  *((void *)v8 + 1) = a3;
  v10.receiver = v7;
  v10.super_class = v3;
  return objc_msgSendSuper2(&v10, sel_init);
}

void sub_2180CBDF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7)
{
  objc_super v10 = (void *)sub_2180CFE10();
  id v11 = (id)sub_2180CFE10();
  (*(void (**)(uint64_t, void *, id, void, uint64_t))(a7 + 16))(a7, v10, v11, a5 & 1, a6);
}

uint64_t sub_2180CBE94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a3 + 16) = a1;
  *(void *)(a3 + 24) = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void sub_2180CBFA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9 = (void *)sub_2180CFE10();
  objc_super v10 = (void *)sub_2180CFE10();
  sub_2180CCB04();
  id v11 = (id)sub_2180CFE90();
  (*(void (**)(uint64_t, void *, void *, void, id))(a7 + 16))(a7, v9, v10, a5 & 1, v11);
}

id SharingOptionsViewFactory.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id SharingOptionsViewFactory.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SharingOptionsViewFactory();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SharingOptionsViewFactory.__deallocating_deinit()
{
  return sub_2180CC40C(type metadata accessor for SharingOptionsViewFactory);
}

id HostingControllerAndModelUpdates.viewController.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC14CloudSharingUI32HostingControllerAndModelUpdates_viewController);
}

uint64_t HostingControllerAndModelUpdates.sourceAppBundleIDDidChangeBlock.getter()
{
  uint64_t v1 = *(void *)(v0
                 + OBJC_IVAR____TtC14CloudSharingUI32HostingControllerAndModelUpdates_sourceAppBundleIDDidChangeBlock);
  swift_retain();
  return v1;
}

uint64_t sub_2180CC234(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  uint64_t v2 = sub_2180CFE50();
  uint64_t v4 = v3;
  swift_retain();
  v1(v2, v4);
  swift_release();

  return swift_bridgeObjectRelease();
}

id HostingControllerAndModelUpdates.init(viewController:sourceAppBundleIDDidChangeBlock:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)&v3[OBJC_IVAR____TtC14CloudSharingUI32HostingControllerAndModelUpdates_viewController] = a1;
  uint64_t v4 = &v3[OBJC_IVAR____TtC14CloudSharingUI32HostingControllerAndModelUpdates_sourceAppBundleIDDidChangeBlock];
  *(void *)uint64_t v4 = a2;
  *((void *)v4 + 1) = a3;
  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for HostingControllerAndModelUpdates();
  return objc_msgSendSuper2(&v6, sel_init);
}

void HostingControllerAndModelUpdates.init()()
{
}

id HostingControllerAndModelUpdates.__deallocating_deinit()
{
  return sub_2180CC40C(type metadata accessor for HostingControllerAndModelUpdates);
}

id sub_2180CC40C(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t _s14CloudSharingUI0B18OptionsViewFactoryC024createCollaborationSharedE0_13layoutMargins19userDidChangeOption011contentSizemN0AA32HostingControllerAndModelUpdatesCSo016_SWCollaborationiD0CSg_So23NSDirectionalEdgeInsetsVySS_SSSbALtcySo6CGSizeVctFZ_0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = type metadata accessor for SharingOptionsGroupsView(0);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  unint64_t v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  id v15 = (uint64_t *)((char *)&v34 - v14);
  id v16 = a1;
  sub_2180CF7A0();
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  swift_retain();
  swift_retain();
  qword_267BBE0E8 = _s14CloudSharingUI0B22OptionsObservableModelC018collaborationShareD013layoutMargins19userDidChangeOption011contentSizelM0ACSo016_SWCollaborationhD0CSg_05SwiftC010EdgeInsetsVySS_SSSbAJtcSgySo6CGSizeVcSgtcfC_0(a1, a2, a3, a4, a5, v18, v20, v22, v24);
  uint64_t result = swift_release();
  if (qword_267BBE0E8)
  {
    *id v15 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD830);
    swift_storeEnumTagMultiPayload();
    unint64_t v26 = (char *)v15 + *(int *)(v10 + 20);
    *(void *)unint64_t v26 = sub_2180B50D0;
    *((void *)v26 + 1) = 0;
    v26[16] = 0;
    type metadata accessor for SharingOptionsObservableModel();
    sub_2180CCB7C(&qword_267BBD670, (void (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel);
    swift_retain();
    sub_2180CFD50();
    sub_2180B0674((uint64_t)v15, (uint64_t)v13, type metadata accessor for SharingOptionsGroupsView);
    id v27 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_267BBE108));
    uint64_t v28 = sub_2180CF9A0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD840);
    sub_2180CFD30();
    unint64_t v29 = v36;
    char v30 = (objc_class *)type metadata accessor for HostingControllerAndModelUpdates();
    id v31 = (char *)objc_allocWithZone(v30);
    *(void *)&v31[OBJC_IVAR____TtC14CloudSharingUI32HostingControllerAndModelUpdates_viewController] = v28;
    unint64_t v32 = (uint64_t (**)())&v31[OBJC_IVAR____TtC14CloudSharingUI32HostingControllerAndModelUpdates_sourceAppBundleIDDidChangeBlock];
    *unint64_t v32 = sub_2180CCBC4;
    v32[1] = v29;
    v35.receiver = v31;
    v35.super_class = v30;
    id v33 = objc_msgSendSuper2(&v35, sel_init);
    sub_2180CCBCC((uint64_t)v15, type metadata accessor for SharingOptionsGroupsView);
    return (uint64_t)v33;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id _s14CloudSharingUI0B18OptionsViewFactoryC06createbdE0_19userDidChangeOptionAA32HostingControllerAndModelUpdatesCSaySo016_SWCollaborationD5GroupCG_ySS_SSSbAJtctFZ_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SharingOptionsView(0);
  uint64_t v7 = (int *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (uint64_t *)((char *)&v25 - v11);
  type metadata accessor for SharingOptionsViewModel();
  swift_allocObject();
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v13 = SharingOptionsViewModel.init(collaborationOptionsGroups:userDidChangeOption:)(a1, a2, a3);
  *uint64_t v12 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD830);
  swift_storeEnumTagMultiPayload();
  uint64_t v14 = (char *)v12 + v7[7];
  *(void *)uint64_t v14 = sub_2180AF93C;
  *((void *)v14 + 1) = 0;
  v14[16] = 0;
  uint64_t v15 = v7[9];
  uint64_t v27 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBD838);
  sub_2180CFC50();
  *(_OWORD *)((char *)v12 + v15) = v28;
  id v16 = (char *)v12 + v7[8];
  *(void *)id v16 = sub_2180CCB6C;
  *((void *)v16 + 1) = v13;
  v16[16] = 0;
  sub_2180B0674((uint64_t)v12, (uint64_t)v10, type metadata accessor for SharingOptionsView);
  id v17 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_267BBE100));
  uint64_t v18 = sub_2180CF9A0();
  sub_2180CCB7C(&qword_267BBD828, (void (*)(uint64_t))type metadata accessor for SharingOptionsViewModel);
  uint64_t v19 = sub_2180CF7F0();
  double v20 = (objc_class *)type metadata accessor for HostingControllerAndModelUpdates();
  double v21 = (char *)objc_allocWithZone(v20);
  *(void *)&v21[OBJC_IVAR____TtC14CloudSharingUI32HostingControllerAndModelUpdates_viewController] = v18;
  double v22 = (uint64_t (**)(uint64_t, uint64_t))&v21[OBJC_IVAR____TtC14CloudSharingUI32HostingControllerAndModelUpdates_sourceAppBundleIDDidChangeBlock];
  *double v22 = sub_2180CCB74;
  v22[1] = (uint64_t (*)(uint64_t, uint64_t))v19;
  v26.receiver = v21;
  v26.super_class = v20;
  id v23 = objc_msgSendSuper2(&v26, sel_init);
  sub_2180CCBCC((uint64_t)v12, type metadata accessor for SharingOptionsView);
  return v23;
}

uint64_t type metadata accessor for SharingOptionsViewFactory()
{
  return self;
}

uint64_t type metadata accessor for HostingControllerAndModelUpdates()
{
  return self;
}

uint64_t method lookup function for HostingControllerAndModelUpdates(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HostingControllerAndModelUpdates);
}

uint64_t dispatch thunk of HostingControllerAndModelUpdates.__allocating_init(viewController:sourceAppBundleIDDidChangeBlock:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_2180CCA5C()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2180CCA94()
{
  uint64_t v1 = *(void *)(v0 + 16);
  id v2 = (id)sub_2180CFE10();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
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

unint64_t sub_2180CCB04()
{
  unint64_t result = qword_267BBD778;
  if (!qword_267BBD778)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267BBD778);
  }
  return result;
}

void sub_2180CCB44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  sub_2180CBFA8(a1, a2, a3, a4, a5, a6, *(void *)(v6 + 16));
}

void sub_2180CCB4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  sub_2180CBDF8(a1, a2, a3, a4, a5, a6, *(void *)(v6 + 16));
}

uint64_t sub_2180CCB54()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_2180CCB6C()
{
  return j__swift_retain(v0);
}

uint64_t sub_2180CCB74(uint64_t a1, uint64_t a2)
{
  return sub_2180CBE94(a1, a2, v2);
}

uint64_t sub_2180CCB7C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2180CCBC4()
{
  return sub_2180B7EEC();
}

uint64_t sub_2180CCBCC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t SharingOptionsViewModel.__allocating_init(collaborationOptionsGroups:userDidChangeOption:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  SharingOptionsViewModel.init(collaborationOptionsGroups:userDidChangeOption:)(a1, a2, a3);
  return v6;
}

uint64_t sub_2180CCC98(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = *a2;
  swift_beginAccess();
  *(void *)(v4 + 16) = v3;
  *(void *)(v4 + 24) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2180CCCF8()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2180CCD44(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2180CCD98())()
{
  return j__swift_endAccess;
}

double sub_2180CCDEC@<D0>(_OWORD *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2180CF720();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_2180CCE6C()
{
  return sub_2180CF730();
}

double sub_2180CCEE8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2180CF720();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2180CCF5C()
{
  return sub_2180CF730();
}

uint64_t (*sub_2180CCFD8(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2180CF710();
  return sub_2180C5EF0;
}

uint64_t sub_2180CD064()
{
  return sub_2180C7D9C((uint64_t)&OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel__contentSize, &qword_267BBE118);
}

uint64_t sub_2180CD078(uint64_t a1)
{
  return sub_2180CD5BC(a1, &qword_267BBE120, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel__contentSize, &qword_267BBE118);
}

uint64_t (*sub_2180CD094(void *a1))()
{
  long long v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBE120);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel__contentSize;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBE118);
  sub_2180CF6F0();
  swift_endAccess();
  return sub_2180C6034;
}

uint64_t sub_2180CD1A4@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2180CF720();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2180CD224()
{
  return sub_2180CF730();
}

uint64_t sub_2180CD2A0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2180CF720();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2180CD314()
{
  return sub_2180CF730();
}

uint64_t (*sub_2180CD384(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2180CF710();
  return sub_2180C5EF0;
}

uint64_t sub_2180CD410(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v18 - v14;
  id v16 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v16((char *)&v18 - v14, a1, v9);
  v16(v13, (uint64_t)v15, v9);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a7);
  sub_2180CF700();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

uint64_t sub_2180CD58C()
{
  return sub_2180C7D9C((uint64_t)&OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel__collaborationOptionsGroups, &qword_267BBE130);
}

uint64_t sub_2180CD5A0(uint64_t a1)
{
  return sub_2180CD5BC(a1, &qword_267BBE138, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel__collaborationOptionsGroups, &qword_267BBE130);
}

uint64_t sub_2180CD5BC(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_2180CF700();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*sub_2180CD6EC(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBE138);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel__collaborationOptionsGroups;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBE130);
  sub_2180CF6F0();
  swift_endAccess();
  return sub_2180C6034;
}

uint64_t SharingOptionsViewModel.userDidChangeOption.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel_userDidChangeOption);
  sub_2180AC708(v1);
  return v1;
}

uint64_t SharingOptionsViewModel.contentSizeDidChange.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel_contentSizeDidChange);
  sub_2180AC708(v1);
  return v1;
}

uint64_t SharingOptionsViewModel.__allocating_init(collaborationOptionsGroups:layoutMargins:userDidChangeOption:contentSizeDidChange:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6, double a7, double a8, double a9)
{
  uint64_t v18 = swift_allocObject();
  SharingOptionsViewModel.init(collaborationOptionsGroups:layoutMargins:userDidChangeOption:contentSizeDidChange:)(a1, a2, a3, a4, a5, a6, a7, a8, a9);
  return v18;
}

uint64_t SharingOptionsViewModel.init(collaborationOptionsGroups:layoutMargins:userDidChangeOption:contentSizeDidChange:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6, double a7, double a8, double a9)
{
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBE118);
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  double v22 = (char *)v28 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v9 + 16) = 0;
  *(void *)(v9 + 24) = 0;
  uint64_t v23 = v9 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel__contentSize;
  type metadata accessor for CGSize(0);
  v28[1] = 0;
  _OWORD v28[2] = 0;
  sub_2180CF6E0();
  (*(void (**)(uint64_t, char *, uint64_t))(v20 + 32))(v23, v22, v19);
  swift_beginAccess();
  v28[0] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBE140);
  sub_2180CF6E0();
  swift_endAccess();
  double v24 = (double *)(v9 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel_layoutMargins);
  *double v24 = a6;
  v24[1] = a7;
  v24[2] = a8;
  v24[3] = a9;
  uint64_t v25 = (void *)(v9 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel_userDidChangeOption);
  *uint64_t v25 = a2;
  v25[1] = a3;
  objc_super v26 = (void *)(v9 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel_contentSizeDidChange);
  *objc_super v26 = a4;
  v26[1] = a5;
  return v9;
}

uint64_t SharingOptionsViewModel.init(collaborationOptionsGroups:userDidChangeOption:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBE118);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v3 + 16) = 0;
  *(void *)(v3 + 24) = 0;
  uint64_t v11 = v3 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel__contentSize;
  type metadata accessor for CGSize(0);
  v16[1] = 0;
  void v16[2] = 0;
  sub_2180CF6E0();
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v11, v10, v7);
  swift_beginAccess();
  v16[0] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BBE140);
  sub_2180CF6E0();
  swift_endAccess();
  uint64_t v12 = (_OWORD *)(v3 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel_layoutMargins);
  *uint64_t v12 = 0u;
  v12[1] = 0u;
  uint64_t v13 = (void *)(v3 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel_userDidChangeOption);
  *uint64_t v13 = a2;
  v13[1] = a3;
  uint64_t v14 = (void *)(v3 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel_contentSizeDidChange);
  *uint64_t v14 = 0;
  v14[1] = 0;
  return v3;
}

uint64_t SharingOptionsViewModel.__allocating_init(collaborationShareOptions:userDidChangeOption:)(void *a1, uint64_t a2, uint64_t a3)
{
  return _s14CloudSharingUI0B16OptionsViewModelC018collaborationShareD013layoutMargins19userDidChangeOption011contentSizelM0ACSo016_SWCollaborationhD0CSg_05SwiftC010EdgeInsetsVySS_SSSbAJtcSgySo6CGSizeVcSgtcfC_0(a1, a2, a3, 0, 0, 0.0, 0.0, 0.0, 0.0);
}

uint64_t sub_2180CDC84(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t SharingOptionsViewModel.deinit()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel__contentSize;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBE118);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel__collaborationOptionsGroups;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBE130);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_2180AC8B8(*(void *)(v0 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel_userDidChangeOption));
  sub_2180AC8B8(*(void *)(v0 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel_contentSizeDidChange));
  return v0;
}

uint64_t SharingOptionsViewModel.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel__contentSize;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBE118);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel__collaborationOptionsGroups;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BBE130);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_2180AC8B8(*(void *)(v0 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel_userDidChangeOption));
  sub_2180AC8B8(*(void *)(v0 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel_contentSizeDidChange));
  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v5, v6);
}

uint64_t sub_2180CDEE0@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for SharingOptionsViewModel();
  uint64_t result = sub_2180CF6D0();
  *a1 = result;
  return result;
}

uint64_t _s14CloudSharingUI0B16OptionsViewModelC018collaborationShareD013layoutMargins19userDidChangeOption011contentSizelM0ACSo016_SWCollaborationhD0CSg_05SwiftC010EdgeInsetsVySS_SSSbAJtcSgySo6CGSizeVcSgtcfC_0(id a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6, double a7, double a8, double a9)
{
  if (!a1)
  {
    double v22 = (void *)swift_allocObject();
    id v22[2] = 0;
    v22[3] = 0;
    v22[4] = a2;
    v22[5] = a3;
    sub_2180AC708(a2);
    double v24 = sub_2180AE898;
    goto LABEL_5;
  }
  id v18 = objc_msgSend(a1, sel_summary);
  uint64_t v19 = sub_2180CFE50();
  uint64_t v21 = v20;

  double v22 = (void *)swift_allocObject();
  id v22[2] = v19;
  v22[3] = v21;
  v22[4] = a2;
  v22[5] = a3;
  sub_2180AC708(a2);
  id v23 = objc_msgSend(a1, sel_optionsGroups);
  double v24 = sub_2180AF680;
  if (!v23)
  {
LABEL_5:
    uint64_t v27 = v24;
    uint64_t v26 = MEMORY[0x263F8EE78];
    goto LABEL_6;
  }
  uint64_t v25 = v23;
  sub_2180AEA60(0, (unint64_t *)&qword_267BBD778);
  uint64_t v26 = sub_2180CFEA0();

  uint64_t v27 = sub_2180AF680;
LABEL_6:
  type metadata accessor for SharingOptionsViewModel();
  uint64_t v28 = swift_allocObject();
  swift_retain();
  SharingOptionsViewModel.init(collaborationOptionsGroups:layoutMargins:userDidChangeOption:contentSizeDidChange:)(v26, (uint64_t)v27, (uint64_t)v22, a4, a5, a6, a7, a8, a9);
  sub_2180AC8B8(a2);
  swift_release();

  return v28;
}

uint64_t sub_2180CE120@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 24);
  *a2 = *(void *)(v3 + 16);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2180CE170(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2180C7B9C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel__contentSize, &qword_267BBE118);
}

uint64_t sub_2180CE198(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2180CD410(a1, a2, a3, a4, &qword_267BBE120, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel__contentSize, &qword_267BBE118);
}

uint64_t sub_2180CE1C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2180C7B9C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel__collaborationOptionsGroups, &qword_267BBE130);
}

uint64_t sub_2180CE1F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2180CD410(a1, a2, a3, a4, &qword_267BBE138, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel__collaborationOptionsGroups, &qword_267BBE130);
}

uint64_t sub_2180CE220()
{
  return type metadata accessor for SharingOptionsViewModel();
}

uint64_t type metadata accessor for SharingOptionsViewModel()
{
  uint64_t result = qword_267BBE148;
  if (!qword_267BBE148) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2180CE274()
{
  sub_2180CE5E0();
  if (v0 <= 0x3F)
  {
    sub_2180CE638();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for SharingOptionsViewModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SharingOptionsViewModel);
}

uint64_t dispatch thunk of SharingOptionsViewModel.sourceAppBundleID.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of SharingOptionsViewModel.sourceAppBundleID.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of SharingOptionsViewModel.sourceAppBundleID.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of SharingOptionsViewModel.contentSize.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of SharingOptionsViewModel.contentSize.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of SharingOptionsViewModel.contentSize.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of SharingOptionsViewModel.$contentSize.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of SharingOptionsViewModel.$contentSize.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of SharingOptionsViewModel.$contentSize.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of SharingOptionsViewModel.collaborationOptionsGroups.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of SharingOptionsViewModel.collaborationOptionsGroups.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of SharingOptionsViewModel.collaborationOptionsGroups.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of SharingOptionsViewModel.$collaborationOptionsGroups.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of SharingOptionsViewModel.$collaborationOptionsGroups.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of SharingOptionsViewModel.$collaborationOptionsGroups.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of SharingOptionsViewModel.__allocating_init(collaborationOptionsGroups:layoutMargins:userDidChangeOption:contentSizeDidChange:)()
{
  return (*(uint64_t (**)(void))(v0 + 248))();
}

uint64_t dispatch thunk of SharingOptionsViewModel.__allocating_init(collaborationOptionsGroups:userDidChangeOption:)()
{
  return (*(uint64_t (**)(void))(v0 + 256))();
}

uint64_t dispatch thunk of SharingOptionsViewModel.setSourceAppBundleID(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

void sub_2180CE5E0()
{
  if (!qword_267BBE158)
  {
    type metadata accessor for CGSize(255);
    unint64_t v0 = sub_2180CF740();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267BBE158);
    }
  }
}

void sub_2180CE638()
{
  if (!qword_267BBE160)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BBE140);
    unint64_t v0 = sub_2180CF740();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267BBE160);
    }
  }
}

ValueMetadata *type metadata accessor for SharingOptionsViewModel.UserAction()
{
  return &type metadata for SharingOptionsViewModel.UserAction;
}

id AddressingViewFactory.viewController.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC14CloudSharingUI21AddressingViewFactory_viewController);
}

id AddressingViewFactory.__allocating_init(headerImageData:headerTitle:loadingText:supplementaryText:userInfoText:primaryButtonText:secondaryButtonText:userDidClickPrimaryButton:userDidClickSecondaryButton:userDidClickShowContactPicker:userDidChangeAddresses:)(uint64_t a1, unint64_t a2, void *a3, unint64_t a4, void *a5, unint64_t a6, void *a7, unint64_t a8, long long a9, long long a10, void *a11, unint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  id v23 = objc_allocWithZone(v20);
  id v24 = sub_2180CF05C(a1, a2, a3, a4, a5, a6, a7, a8, (void *)a9, *((unint64_t *)&a9 + 1), (void *)a10, *((unint64_t *)&a10 + 1), a11, a12, a13, a14, a15, a16, a17,
          a18,
          a19,
          a20);
  sub_2180AC8B8(a19);
  sub_2180AC8B8(a17);
  sub_2180AC8B8(a15);
  sub_2180AC8B8(a13);
  sub_2180C8EC8(a1, a2);
  return v24;
}

id AddressingViewFactory.init(headerImageData:headerTitle:loadingText:supplementaryText:userInfoText:primaryButtonText:secondaryButtonText:userDidClickPrimaryButton:userDidClickSecondaryButton:userDidClickShowContactPicker:userDidChangeAddresses:)(uint64_t a1, unint64_t a2, void *a3, unint64_t a4, void *a5, unint64_t a6, void *a7, unint64_t a8, void *a9, unint64_t a10, void *a11, unint64_t a12, void *a13, unint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  id v23 = sub_2180CF05C(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
          a20,
          a21,
          a22);
  sub_2180AC8B8(a21);
  sub_2180AC8B8(a19);
  sub_2180AC8B8(a17);
  sub_2180AC8B8(a15);
  sub_2180C8EC8(a1, a2);
  return v23;
}

uint64_t sub_2180CEC20(uint64_t a1, unint64_t a2, void *a3, unint64_t a4, void *a5, unint64_t a6, void *a7, unint64_t a8, void *a9, unint64_t a10, void *a11, unint64_t a12, void *a13, unint64_t a14)
{
  return sub_2180C974C(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14);
}

void sub_2180CEE90(void *a1, void *a2)
{
}

id AddressingViewFactory.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void AddressingViewFactory.init()()
{
}

id AddressingViewFactory.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AddressingViewFactory();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_2180CF05C(uint64_t a1, unint64_t a2, void *a3, unint64_t a4, void *a5, unint64_t a6, void *a7, unint64_t a8, void *a9, unint64_t a10, void *a11, unint64_t a12, void *a13, unint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  id v23 = v22;
  type metadata accessor for AddressingViewModel();
  swift_allocObject();
  uint64_t v26 = v23;
  sub_2180CF3C0(a1, a2);
  sub_2180AC708(a15);
  sub_2180AC708(a17);
  sub_2180AC708(a19);
  sub_2180AC708(a21);
  uint64_t v27 = AddressingViewModel.init(headerImageData:headerTitle:loadingText:supplementaryText:userInfoText:primaryButtonText:secondaryButtonText:userDidClickPrimaryButton:userDidClickSecondaryButton:userDidClickShowContactPicker:userDidChangeAddresses:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
          a20,
          a21,
          a22);
  *(void *)&v26[OBJC_IVAR____TtC14CloudSharingUI21AddressingViewFactory_viewModel] = v27;
  id v37 = sub_2180CCB6C;
  uint64_t v38 = v27;
  char v39 = 0;
  objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_267BBE178));
  swift_retain();
  *(void *)&v26[OBJC_IVAR____TtC14CloudSharingUI21AddressingViewFactory_viewController] = sub_2180CF9A0();

  v36.receiver = v26;
  v36.super_class = (Class)type metadata accessor for AddressingViewFactory();
  return objc_msgSendSuper2(&v36, sel_init);
}

uint64_t type metadata accessor for AddressingViewFactory()
{
  return self;
}

uint64_t method lookup function for AddressingViewFactory(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AddressingViewFactory);
}

uint64_t dispatch thunk of AddressingViewFactory.__allocating_init(headerImageData:headerTitle:loadingText:supplementaryText:userInfoText:primaryButtonText:secondaryButtonText:userDidClickPrimaryButton:userDidClickSecondaryButton:userDidClickShowContactPicker:userDidChangeAddresses:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of AddressingViewFactory.update(headerImageData:headerTitle:loadingText:supplementaryText:userInfoText:primaryButtonText:secondaryButtonText:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of AddressingViewFactory.addAddress(from:contactProperty:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t sub_2180CF324()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2180CF360()
{
  uint64_t v1 = *(void *)(v0 + 16);
  id v2 = (id)sub_2180CFE90();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

uint64_t sub_2180CF3C0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_2180C8F34(a1, a2);
  }
  return a1;
}

uint64_t sub_2180CF4D0()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_2180CF4E0()
{
  return MEMORY[0x270EEE3B8]();
}

uint64_t sub_2180CF4F0()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_2180CF500()
{
  return MEMORY[0x270EFEB00]();
}

uint64_t sub_2180CF510()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_2180CF520()
{
  return MEMORY[0x270EEEFF8]();
}

uint64_t sub_2180CF530()
{
  return MEMORY[0x270EEF010]();
}

uint64_t sub_2180CF540()
{
  return MEMORY[0x270EEF020]();
}

uint64_t sub_2180CF550()
{
  return MEMORY[0x270EEF070]();
}

uint64_t sub_2180CF560()
{
  return MEMORY[0x270EFEB28]();
}

uint64_t sub_2180CF570()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_2180CF580()
{
  return MEMORY[0x270EEFDD0]();
}

uint64_t sub_2180CF590()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_2180CF5A0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2180CF5B0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_2180CF5C0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_2180CF5D0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_2180CF5E0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_2180CF5F0()
{
  return MEMORY[0x270FA11C0]();
}

uint64_t sub_2180CF600()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_2180CF610()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_2180CF620()
{
  return MEMORY[0x270FA1220]();
}

uint64_t sub_2180CF630()
{
  return MEMORY[0x270FA1228]();
}

uint64_t sub_2180CF640()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_2180CF650()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_2180CF660()
{
  return MEMORY[0x270F16D70]();
}

uint64_t sub_2180CF670()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2180CF680()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2180CF690()
{
  return MEMORY[0x270F81748]();
}

uint64_t sub_2180CF6A0()
{
  return MEMORY[0x270F823E0]();
}

uint64_t sub_2180CF6B0()
{
  return MEMORY[0x270F823F8]();
}

uint64_t sub_2180CF6C0()
{
  return MEMORY[0x270EE3B98]();
}

uint64_t sub_2180CF6D0()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_2180CF6E0()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_2180CF6F0()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_2180CF700()
{
  return MEMORY[0x270EE3DB8]();
}

uint64_t sub_2180CF710()
{
  return MEMORY[0x270EE3DD0]();
}

uint64_t sub_2180CF720()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_2180CF730()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_2180CF740()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_2180CF750()
{
  return MEMORY[0x270EE3FD8]();
}

uint64_t sub_2180CF760()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_2180CF770()
{
  return MEMORY[0x270EFEC68]();
}

uint64_t sub_2180CF780()
{
  return MEMORY[0x270EFEC70]();
}

uint64_t sub_2180CF790()
{
  return MEMORY[0x270EFEC88]();
}

uint64_t sub_2180CF7A0()
{
  return MEMORY[0x270EFED08]();
}

uint64_t sub_2180CF7B0()
{
  return MEMORY[0x270EFEDF8]();
}

uint64_t sub_2180CF7C0()
{
  return MEMORY[0x270EFEF10]();
}

uint64_t sub_2180CF7D0()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_2180CF7E0()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_2180CF7F0()
{
  return MEMORY[0x270EFF108]();
}

uint64_t sub_2180CF800()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_2180CF810()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_2180CF820()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_2180CF830()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_2180CF840()
{
  return MEMORY[0x270EFF888]();
}

uint64_t sub_2180CF850()
{
  return MEMORY[0x270EFF898]();
}

uint64_t sub_2180CF860()
{
  return MEMORY[0x270EFF908]();
}

uint64_t sub_2180CF870()
{
  return MEMORY[0x270EFFB68]();
}

uint64_t sub_2180CF880()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t sub_2180CF890()
{
  return MEMORY[0x270EFFEE0]();
}

uint64_t sub_2180CF8A0()
{
  return MEMORY[0x270F00228]();
}

uint64_t sub_2180CF8B0()
{
  return MEMORY[0x270F00670]();
}

uint64_t sub_2180CF8C0()
{
  return MEMORY[0x270F008D0]();
}

uint64_t sub_2180CF8D0()
{
  return MEMORY[0x270F008D8]();
}

uint64_t sub_2180CF8E0()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_2180CF8F0()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_2180CF900()
{
  return MEMORY[0x270F00B18]();
}

uint64_t sub_2180CF910()
{
  return MEMORY[0x270F00B20]();
}

uint64_t sub_2180CF920()
{
  return MEMORY[0x270F00E50]();
}

uint64_t sub_2180CF930()
{
  return MEMORY[0x270F00E68]();
}

uint64_t sub_2180CF940()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_2180CF950()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_2180CF960()
{
  return MEMORY[0x270F00F88]();
}

uint64_t sub_2180CF970()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_2180CF980()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_2180CF990()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_2180CF9A0()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_2180CF9B0()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_2180CF9C0()
{
  return MEMORY[0x270F01E58]();
}

uint64_t sub_2180CF9D0()
{
  return MEMORY[0x270F01E68]();
}

uint64_t sub_2180CF9E0()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_2180CF9F0()
{
  return MEMORY[0x270F026B0]();
}

uint64_t sub_2180CFA00()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_2180CFA20()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_2180CFA30()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_2180CFA40()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_2180CFA60()
{
  return MEMORY[0x270F02988]();
}

uint64_t sub_2180CFA70()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_2180CFA80()
{
  return MEMORY[0x270F02A00]();
}

uint64_t sub_2180CFA90()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_2180CFAA0()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_2180CFAB0()
{
  return MEMORY[0x270F02B50]();
}

uint64_t sub_2180CFAC0()
{
  return MEMORY[0x270F02BF8]();
}

uint64_t sub_2180CFAD0()
{
  return MEMORY[0x270F02DC8]();
}

uint64_t sub_2180CFAE0()
{
  return MEMORY[0x270F02F28]();
}

uint64_t sub_2180CFAF0()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_2180CFB00()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_2180CFB10()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_2180CFB20()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_2180CFB30()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_2180CFB40()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_2180CFB50()
{
  return MEMORY[0x270F03350]();
}

uint64_t sub_2180CFB60()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_2180CFB70()
{
  return MEMORY[0x270F03790]();
}

uint64_t sub_2180CFB80()
{
  return MEMORY[0x270F037F0]();
}

uint64_t sub_2180CFB90()
{
  return MEMORY[0x270F03A58]();
}

uint64_t sub_2180CFBA0()
{
  return MEMORY[0x270F03A68]();
}

uint64_t sub_2180CFBB0()
{
  return MEMORY[0x270F03E60]();
}

uint64_t sub_2180CFBC0()
{
  return MEMORY[0x270F03EF8]();
}

uint64_t sub_2180CFBD0()
{
  return MEMORY[0x270F03FB0]();
}

uint64_t sub_2180CFBE0()
{
  return MEMORY[0x270F04188]();
}

uint64_t sub_2180CFBF0()
{
  return MEMORY[0x270F04388]();
}

uint64_t sub_2180CFC00()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_2180CFC10()
{
  return MEMORY[0x270F044F0]();
}

uint64_t sub_2180CFC20()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_2180CFC30()
{
  return MEMORY[0x270F04630]();
}

uint64_t sub_2180CFC40()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_2180CFC50()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_2180CFC60()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_2180CFC70()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_2180CFC80()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_2180CFC90()
{
  return MEMORY[0x270F04890]();
}

uint64_t sub_2180CFCA0()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_2180CFCB0()
{
  return MEMORY[0x270F048E8]();
}

uint64_t sub_2180CFCC0()
{
  return MEMORY[0x270F049A8]();
}

uint64_t sub_2180CFCD0()
{
  return MEMORY[0x270F04AB0]();
}

uint64_t sub_2180CFCE0()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_2180CFCF0()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_2180CFD00()
{
  return MEMORY[0x270F04B68]();
}

uint64_t sub_2180CFD10()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_2180CFD20()
{
  return MEMORY[0x270F04D50]();
}

uint64_t sub_2180CFD30()
{
  return MEMORY[0x270F04DF0]();
}

uint64_t sub_2180CFD40()
{
  return MEMORY[0x270F04E10]();
}

uint64_t sub_2180CFD50()
{
  return MEMORY[0x270F04E20]();
}

uint64_t sub_2180CFD60()
{
  return MEMORY[0x270F04E28]();
}

uint64_t sub_2180CFD70()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_2180CFD80()
{
  return MEMORY[0x270F05198]();
}

uint64_t sub_2180CFD90()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_2180CFDA0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_2180CFDB0()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_2180CFDC0()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_2180CFDD0()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_2180CFDE0()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_2180CFDF0()
{
  return MEMORY[0x270F9D328]();
}

uint64_t sub_2180CFE00()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2180CFE10()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2180CFE20()
{
  return MEMORY[0x270EF19B8]();
}

uint64_t sub_2180CFE30()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_2180CFE40()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_2180CFE50()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2180CFE60()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2180CFE70()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2180CFE80()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_2180CFE90()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2180CFEA0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2180CFEB0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2180CFEC0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_2180CFED0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_2180CFEE0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2180CFEF0()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_2180CFF00()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_2180CFF10()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_2180CFF20()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2180CFF30()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2180CFF50()
{
  return MEMORY[0x270EF1C60]();
}

uint64_t sub_2180CFF60()
{
  return MEMORY[0x270EF1C70]();
}

uint64_t sub_2180CFF70()
{
  return MEMORY[0x270EF1C78]();
}

uint64_t sub_2180CFF90()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_2180CFFA0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2180CFFB0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_2180CFFC0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2180CFFD0()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_2180CFFE0()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_2180CFFF0()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_2180D0000()
{
  return MEMORY[0x270F82960]();
}

uint64_t sub_2180D0010()
{
  return MEMORY[0x270F82998]();
}

uint64_t sub_2180D0020()
{
  return MEMORY[0x270F829B0]();
}

uint64_t sub_2180D0030()
{
  return MEMORY[0x270F829B8]();
}

uint64_t sub_2180D0040()
{
  return MEMORY[0x270F82A38]();
}

uint64_t sub_2180D0050()
{
  return MEMORY[0x270F82A88]();
}

uint64_t sub_2180D0060()
{
  return MEMORY[0x270F82AB0]();
}

uint64_t sub_2180D0070()
{
  return MEMORY[0x270F82AD0]();
}

uint64_t sub_2180D0080()
{
  return MEMORY[0x270F82B18]();
}

uint64_t sub_2180D0090()
{
  return MEMORY[0x270F82B58]();
}

uint64_t sub_2180D00A0()
{
  return MEMORY[0x270F82B60]();
}

uint64_t sub_2180D00B0()
{
  return MEMORY[0x270F82B78]();
}

uint64_t sub_2180D00C0()
{
  return MEMORY[0x270F82B88]();
}

uint64_t sub_2180D00D0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2180D00E0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2180D00F0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2180D0100()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_2180D0110()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2180D0120()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_2180D0130()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_2180D0140()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2180D0150()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2180D0160()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_2180D0170()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2180D0180()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_2180D0190()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_2180D01A0()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_2180D01B0()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_2180D01C0()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_2180D01D0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2180D01E0()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_2180D01F0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2180D0200()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_2180D0210()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_2180D0220()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2180D0230()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2180D0240()
{
  return MEMORY[0x270F9F1A8]();
}

uint64_t sub_2180D0250()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2180D0260()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_2180D0270()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_2180D0280()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2180D0290()
{
  return MEMORY[0x270F9FC30]();
}

uint64_t sub_2180D02A0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2180D02B0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2180D02C0()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_2180D02D0()
{
  return MEMORY[0x270F9FC90]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

uint64_t CKErrorUserInfoClasses()
{
  return MEMORY[0x270EE37A0]();
}

uint64_t CKSharingSummaryStringFromOptionsGroups()
{
  return MEMORY[0x270EE37B0]();
}

uint64_t CSLogForCategory()
{
  return MEMORY[0x270F16D78]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
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