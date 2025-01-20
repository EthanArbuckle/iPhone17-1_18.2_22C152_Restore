const char *sub_24CF7797C(char a1)
{
  const char *result;

  result = "BackboneModel";
  switch(a1)
  {
    case 1:
      result = "TopicClassificationModel";
      break;
    case 2:
      result = "CategoryClassificationModel";
      break;
    case 3:
      result = "FoundInModels";
      break;
    case 4:
      result = "IndexNonfileDocuments";
      break;
    case 5:
      result = "SearchAndOrganizationDocumentIngest";
      break;
    case 6:
      result = "AutonamingFromMessages";
      break;
    case 7:
      result = "FoundInUseLLM";
      break;
    default:
      return result;
  }
  return result;
}

BOOL sub_24CF77A40(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_24CF77A50()
{
  return sub_24CF7EAA8();
}

uint64_t sub_24CF77A78()
{
  return sub_24CF7EAB8();
}

BOOL sub_24CF77AC0(char *a1, char *a2)
{
  return sub_24CF77A40(*a1, *a2);
}

uint64_t sub_24CF77ACC()
{
  return sub_24CF77A78();
}

uint64_t sub_24CF77AD4()
{
  return sub_24CF77A50();
}

uint64_t sub_24CF77ADC()
{
  return sub_24CF7EAB8();
}

const char *sub_24CF77B20()
{
  return "DocumentUnderstanding";
}

const char *sub_24CF77B34()
{
  return sub_24CF7797C(*v0);
}

void *DocumentUnderstandingFeatureFlagReader.isBackboneModelEnabled.unsafeMutableAddressor()
{
  return &static DocumentUnderstandingFeatureFlagReader.isBackboneModelEnabled;
}

void *DocumentUnderstandingFeatureFlagReader.isTopicClassificationModelEnabled.unsafeMutableAddressor()
{
  return &static DocumentUnderstandingFeatureFlagReader.isTopicClassificationModelEnabled;
}

void *DocumentUnderstandingFeatureFlagReader.isCategoryClassificationModelEnabled.unsafeMutableAddressor()
{
  return &static DocumentUnderstandingFeatureFlagReader.isCategoryClassificationModelEnabled;
}

uint64_t sub_24CF77B9C(uint64_t a1)
{
  return sub_24CF77C88(a1, 3, static DocumentUnderstandingFeatureFlagReader.isFoundInModelsEnabled);
}

unsigned char *DocumentUnderstandingFeatureFlagReader.isFoundInModelsEnabled.unsafeMutableAddressor()
{
  if (qword_269848370 != -1) {
    swift_once();
  }
  return static DocumentUnderstandingFeatureFlagReader.isFoundInModelsEnabled;
}

uint64_t static DocumentUnderstandingFeatureFlagReader.isFoundInModelsEnabled.getter()
{
  return sub_24CF77D58(&qword_269848370, static DocumentUnderstandingFeatureFlagReader.isFoundInModelsEnabled);
}

void *DocumentUnderstandingFeatureFlagReader.isIndexNonfileDocumentsEnabled.unsafeMutableAddressor()
{
  return &static DocumentUnderstandingFeatureFlagReader.isIndexNonfileDocumentsEnabled;
}

void *DocumentUnderstandingFeatureFlagReader.isSearchAndOrganizationDocumentIngestEnabled.unsafeMutableAddressor()
{
  return &static DocumentUnderstandingFeatureFlagReader.isSearchAndOrganizationDocumentIngestEnabled;
}

void *DocumentUnderstandingFeatureFlagReader.isAutonamingFromMessagesEnabled.unsafeMutableAddressor()
{
  return &static DocumentUnderstandingFeatureFlagReader.isAutonamingFromMessagesEnabled;
}

uint64_t sub_24CF77C78(uint64_t a1)
{
  return sub_24CF77C88(a1, 7, &static DocumentUnderstandingFeatureFlagReader.isFoundInUseLLMEnabled);
}

uint64_t sub_24CF77C88(uint64_t a1, char a2, unsigned char *a3)
{
  v8 = &type metadata for DocumentUnderstandingFeatureFlags;
  unint64_t v9 = sub_24CF77E94();
  v7[0] = a2;
  char v5 = sub_24CF7E948();
  uint64_t result = sub_24CF77EE0((uint64_t)v7);
  *a3 = v5 & 1;
  return result;
}

void *DocumentUnderstandingFeatureFlagReader.isFoundInUseLLMEnabled.unsafeMutableAddressor()
{
  if (qword_26B182B80 != -1) {
    swift_once();
  }
  return &static DocumentUnderstandingFeatureFlagReader.isFoundInUseLLMEnabled;
}

uint64_t static DocumentUnderstandingFeatureFlagReader.isFoundInUseLLMEnabled.getter()
{
  return sub_24CF77D58(&qword_26B182B80, (unsigned __int8 *)&static DocumentUnderstandingFeatureFlagReader.isFoundInUseLLMEnabled);
}

uint64_t sub_24CF77D58(void *a1, unsigned __int8 *a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  return *a2;
}

id DocumentUnderstandingFeatureFlagReader.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id DocumentUnderstandingFeatureFlagReader.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DocumentUnderstandingFeatureFlagReader();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for DocumentUnderstandingFeatureFlagReader()
{
  return self;
}

id DocumentUnderstandingFeatureFlagReader.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DocumentUnderstandingFeatureFlagReader();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_24CF77E94()
{
  unint64_t result = qword_26B182B88;
  if (!qword_26B182B88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B182B88);
  }
  return result;
}

uint64_t sub_24CF77EE0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unsigned char *initializeBufferWithCopyOfBuffer for DocumentUnderstandingFeatureFlags(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DocumentUnderstandingFeatureFlags(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF9)
  {
    if (a2 + 7 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 7) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 8;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v5 = v6 - 8;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for DocumentUnderstandingFeatureFlags(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *unint64_t result = a2 + 7;
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
        JUMPOUT(0x24CF78094);
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
          *unint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

uint64_t sub_24CF780BC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24CF780C8(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for DocumentUnderstandingFeatureFlags()
{
  return &type metadata for DocumentUnderstandingFeatureFlags;
}

unint64_t sub_24CF780E4()
{
  unint64_t result = qword_2698483C0;
  if (!qword_2698483C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698483C0);
  }
  return result;
}

uint64_t _s27DocumentUnderstandingClient0aB17FeatureFlagReaderC22isBackboneModelEnabledSbvgZ_0()
{
  return 0;
}

uint64_t DUProtobufEncodableProtocol.init(serializedData:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v22 = a3;
  sub_24CF7E978();
  MEMORY[0x270FA5388]();
  sub_24CF78E40();
  swift_getAssociatedTypeWitness();
  sub_24CF78E0C();
  sub_24CF78E00();
  MEMORY[0x270FA5388]();
  sub_24CF7EA78();
  sub_24CF78DB8();
  uint64_t v20 = v6;
  uint64_t v21 = v5;
  sub_24CF78E00();
  MEMORY[0x270FA5388]();
  v8 = (char *)&v19 - v7;
  unint64_t v9 = a1;
  uint64_t v10 = MEMORY[0x253318B10](a1);
  unint64_t v12 = v11;
  swift_getAssociatedConformanceWitness();
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v25 = 0;
  sub_24CF783A8(v10, v12);
  sub_24CF7E968();
  sub_24CF7E9C8();
  sub_24CF78EAC();
  v13();

  sub_24CF78400(v10, v12);
  int v14 = sub_24CF78480((uint64_t)v8, 1, a2);
  uint64_t v15 = v22;
  if (v14)
  {
    (*(void (**)(char *, uint64_t))(v20 + 8))(v8, v21);
    uint64_t v16 = 1;
  }
  else
  {
    sub_24CF78E0C();
    sub_24CF78E30();
    v17();
    uint64_t v16 = 0;
  }
  return sub_24CF78458(v15, v16, 1, a2);
}

uint64_t sub_24CF783A8(uint64_t a1, unint64_t a2)
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

uint64_t sub_24CF78400(uint64_t a1, unint64_t a2)
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

uint64_t sub_24CF78458(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_24CF78480(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

NSData_optional __swiftcall DUProtobufEncodableProtocol.serializedData()()
{
  swift_getAssociatedTypeWitness();
  sub_24CF78DB8();
  sub_24CF78E00();
  MEMORY[0x270FA5388]();
  uint64_t v0 = sub_24CF78DD4();
  v1(v0);
  swift_getAssociatedConformanceWitness();
  uint64_t v2 = sub_24CF7E9D8();
  unint64_t v4 = v3;
  uint64_t v5 = sub_24CF78E18();
  v6(v5);
  sub_24CF785C0();
  uint64_t v7 = (objc_class *)sub_24CF78600(v2, v4);
  result.value.super.isa = v7;
  result.is_nil = v8;
  return result;
}

unint64_t sub_24CF785C0()
{
  unint64_t result = qword_2698483C8;
  if (!qword_2698483C8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2698483C8);
  }
  return result;
}

id sub_24CF78600(uint64_t a1, unint64_t a2)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v5 = (void *)sub_24CF7E938();
  id v6 = objc_msgSend(v4, sel_initWithData_, v5);
  sub_24CF78400(a1, a2);

  return v6;
}

uint64_t DUProtobufEncodableProtocol.init(jsonString:options:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v28 = a1;
  uint64_t v29 = a2;
  uint64_t v31 = a5;
  uint64_t v7 = sub_24CF7E958();
  sub_24CF78DB8();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388]();
  unint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getAssociatedTypeWitness();
  sub_24CF78E0C();
  sub_24CF78E00();
  MEMORY[0x270FA5388]();
  sub_24CF78E58();
  sub_24CF7EA78();
  sub_24CF78DB8();
  uint64_t v26 = v13;
  uint64_t v27 = v12;
  sub_24CF78E00();
  MEMORY[0x270FA5388]();
  uint64_t v15 = (char *)&v25 - v14;
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  uint64_t v30 = a3;
  v16(v11, a3, v7);
  swift_getAssociatedConformanceWitness();
  sub_24CF7E998();
  sub_24CF78EAC();
  v17();
  uint64_t v18 = sub_24CF78E98();
  v19(v18);
  int v20 = sub_24CF78480((uint64_t)v15, 1, a4);
  uint64_t v21 = v31;
  if (v20)
  {
    (*(void (**)(char *, uint64_t))(v26 + 8))(v15, v27);
    uint64_t v22 = 1;
  }
  else
  {
    sub_24CF78E0C();
    sub_24CF78E30();
    v23();
    uint64_t v22 = 0;
  }
  return sub_24CF78458(v21, v22, 1, a4);
}

uint64_t DUProtobufEncodableProtocol.jsonString(options:)()
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  sub_24CF78DB8();
  uint64_t v3 = v2;
  sub_24CF78E00();
  MEMORY[0x270FA5388]();
  uint64_t v4 = sub_24CF78DD4();
  v5(v4);
  swift_getAssociatedConformanceWitness();
  uint64_t v6 = sub_24CF7E988();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, AssociatedTypeWitness);
  return v6;
}

uint64_t DUProtobufEncodableProtocol.init(jsonUTF8Data:options:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  unint64_t v33 = a2;
  uint64_t v35 = a6;
  uint64_t v12 = sub_24CF7E958();
  sub_24CF78DB8();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388]();
  sub_24CF78E40();
  swift_getAssociatedTypeWitness();
  sub_24CF78E0C();
  sub_24CF78E00();
  MEMORY[0x270FA5388]();
  uint64_t v16 = (char *)&v29 - v15;
  sub_24CF7EA78();
  sub_24CF78DB8();
  uint64_t v31 = v18;
  uint64_t v32 = v17;
  sub_24CF78E00();
  MEMORY[0x270FA5388]();
  sub_24CF78E58();
  uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16);
  uint64_t v34 = a3;
  uint64_t v20 = a3;
  unint64_t v21 = v33;
  v19(v6, v20, v12);
  sub_24CF783A8(a1, v21);
  uint64_t v30 = a5;
  swift_getAssociatedConformanceWitness();
  sub_24CF7E9B8();
  (*(void (**)(char *, uint64_t))(v30 + 32))(v16, a4);
  sub_24CF78400(a1, v21);
  uint64_t v22 = sub_24CF78E84();
  v23(v22);
  int v24 = sub_24CF78480(v7, 1, a4);
  uint64_t v25 = v35;
  if (v24)
  {
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v7, v32);
    uint64_t v26 = 1;
  }
  else
  {
    sub_24CF78E0C();
    sub_24CF78E30();
    v27();
    uint64_t v26 = 0;
  }
  return sub_24CF78458(v25, v26, 1, a4);
}

uint64_t DUProtobufEncodableProtocol.jsonUTF8Data(options:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  sub_24CF78DB8();
  uint64_t v9 = v8;
  sub_24CF78E00();
  MEMORY[0x270FA5388]();
  sub_24CF78E58();
  (*(void (**)(uint64_t, uint64_t))(a3 + 24))(a2, a3);
  swift_getAssociatedConformanceWitness();
  uint64_t v10 = sub_24CF7E9A8();
  if (v3)
  {

    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = v10;
  }
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v4, AssociatedTypeWitness);
  return v11;
}

uint64_t sub_24CF78DD4()
{
  return v0;
}

uint64_t sub_24CF78E18()
{
  return v0;
}

uint64_t sub_24CF78E68(uint64_t a1)
{
  return sub_24CF78458(a1, 1, 1, v1);
}

uint64_t sub_24CF78E84()
{
  return *(void *)(v0 - 104);
}

uint64_t sub_24CF78E98()
{
  return *(void *)(v0 - 104);
}

uint64_t sub_24CF78EC0()
{
  uint64_t v0 = sub_24CF7EA28();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v2);
  uint64_t v7 = (char *)&v22 - v6;
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v22 - v8;
  sub_24CF7A484(&qword_2698483D0);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_24CF7F860;
  sub_24CF7E9F8();
  uint64_t v11 = sub_24CF7E9E8();
  uint64_t v13 = v12;
  uint64_t v14 = *(void (**)(char *, uint64_t))(v1 + 8);
  v14(v9, v0);
  *(void *)(v10 + 32) = v11;
  *(void *)(v10 + 40) = v13;
  sub_24CF7EA18();
  uint64_t v15 = sub_24CF7E9E8();
  uint64_t v17 = v16;
  v14(v7, v0);
  *(void *)(v10 + 48) = v15;
  *(void *)(v10 + 56) = v17;
  sub_24CF7EA08();
  uint64_t v18 = sub_24CF7E9E8();
  uint64_t v20 = v19;
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v14)(v4, v0);
  *(void *)(v10 + 64) = v18;
  *(void *)(v10 + 72) = v20;
  *(void *)(v10 + 80) = 0xD00000000000001ELL;
  *(void *)(v10 + 88) = 0x800000024CF7FD40;
  *(void *)(v10 + 96) = 0xD00000000000002CLL;
  *(void *)(v10 + 104) = 0x800000024CF7FD60;
  *(void *)(v10 + 112) = 0xD000000000000016;
  *(void *)(v10 + 120) = 0x800000024CF7FD90;
  *(void *)(v10 + 128) = 0xD00000000000001FLL;
  *(void *)(v10 + 136) = 0x800000024CF7FDB0;
  *(void *)(v10 + 144) = 0xD000000000000026;
  *(void *)(v10 + 152) = 0x800000024CF7FDD0;
  *(void *)(v10 + 160) = 0xD000000000000017;
  *(void *)(v10 + 168) = 0x800000024CF7FE00;
  *(void *)(v10 + 176) = 0xD00000000000001BLL;
  *(void *)(v10 + 184) = 0x800000024CF7FE20;
  *(void *)(v10 + 192) = 0xD00000000000002ELL;
  *(void *)(v10 + 200) = 0x800000024CF7FE40;
  *(void *)(v10 + 208) = 0xD00000000000001CLL;
  *(void *)(v10 + 216) = 0x800000024CF7FE70;
  static DUIngestableFiletypes.supportedUTTypes = v10;
  return result;
}

uint64_t *DUIngestableFiletypes.supportedUTTypes.unsafeMutableAddressor()
{
  if (qword_269848378 != -1) {
    swift_once();
  }
  return &static DUIngestableFiletypes.supportedUTTypes;
}

uint64_t static DUIngestableFiletypes.supportedUTTypes.getter()
{
  return sub_24CF79ED0(&qword_269848378);
}

uint64_t sub_24CF791E0()
{
  uint64_t v0 = sub_24CF7A484(&qword_2698483D8);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_24CF7EA28();
  uint64_t v21 = *(void *)(v3 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v4);
  uint64_t v9 = (char *)v19 - v8;
  if (qword_269848378 != -1) {
    uint64_t result = swift_once();
  }
  uint64_t v10 = static DUIngestableFiletypes.supportedUTTypes;
  uint64_t v11 = *(void *)(static DUIngestableFiletypes.supportedUTTypes + 16);
  if (v11)
  {
    uint64_t v12 = (void (**)(char *, char *, uint64_t))(v21 + 32);
    swift_bridgeObjectRetain_n();
    v19[1] = v10;
    uint64_t v13 = v10 + 40;
    size_t v14 = MEMORY[0x263F8EE78];
    uint64_t v20 = v6;
    do
    {
      swift_bridgeObjectRetain_n();
      sub_24CF7EA38();
      swift_bridgeObjectRelease();
      if (sub_24CF78480((uint64_t)v2, 1, v3) == 1)
      {
        sub_24CF7A4CC((uint64_t)v2);
      }
      else
      {
        uint64_t v15 = *v12;
        (*v12)(v9, v2, v3);
        v15(v6, v9, v3);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          size_t v14 = sub_24CF7A01C(0, *(void *)(v14 + 16) + 1, 1, v14);
        }
        unint64_t v17 = *(void *)(v14 + 16);
        unint64_t v16 = *(void *)(v14 + 24);
        if (v17 >= v16 >> 1) {
          size_t v14 = sub_24CF7A01C(v16 > 1, v17 + 1, 1, v14);
        }
        *(void *)(v14 + 16) = v17 + 1;
        unint64_t v18 = v14
            + ((*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80))
            + *(void *)(v21 + 72) * v17;
        uint64_t v6 = v20;
        v15((char *)v18, v20, v3);
      }
      v13 += 16;
      --v11;
    }
    while (v11);
    uint64_t result = swift_bridgeObjectRelease_n();
  }
  else
  {
    size_t v14 = MEMORY[0x263F8EE78];
  }
  static DUIngestableFiletypes.wrappedSupportedUTTypes = v14;
  return result;
}

uint64_t *DUIngestableFiletypes.wrappedSupportedUTTypes.unsafeMutableAddressor()
{
  if (qword_269848380 != -1) {
    swift_once();
  }
  return &static DUIngestableFiletypes.wrappedSupportedUTTypes;
}

uint64_t static DUIngestableFiletypes.wrappedSupportedUTTypes.getter()
{
  return sub_24CF79ED0(&qword_269848380);
}

uint64_t sub_24CF79578()
{
  if (qword_269848390 != -1) {
    swift_once();
  }
  uint64_t v0 = static DUIngestableFiletypes.officeFileExtensions;
  if (qword_269848398 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t v1 = swift_bridgeObjectRetain();
  sub_24CF7A3A0(v1);
  if (qword_2698483A0 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t v2 = swift_bridgeObjectRetain();
  sub_24CF7A3A0(v2);
  swift_bridgeObjectRelease();
  if (qword_2698483A8 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = swift_bridgeObjectRetain();
  sub_24CF7A3A0(v3);
  swift_bridgeObjectRelease();
  if (qword_2698483B0 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = swift_bridgeObjectRetain();
  sub_24CF7A3A0(v4);
  swift_bridgeObjectRelease();
  if (qword_2698483B8 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = swift_bridgeObjectRetain();
  sub_24CF7A3A0(v5);
  uint64_t result = swift_bridgeObjectRelease();
  static DUIngestableFiletypes.supportedFileExtensions = v0;
  return result;
}

uint64_t *DUIngestableFiletypes.officeFileExtensions.unsafeMutableAddressor()
{
  if (qword_269848390 != -1) {
    swift_once();
  }
  return &static DUIngestableFiletypes.officeFileExtensions;
}

uint64_t *DUIngestableFiletypes.iWorkFileExtensions.unsafeMutableAddressor()
{
  if (qword_269848398 != -1) {
    swift_once();
  }
  return &static DUIngestableFiletypes.iWorkFileExtensions;
}

uint64_t *DUIngestableFiletypes.pdfFileExtensions.unsafeMutableAddressor()
{
  if (qword_2698483A0 != -1) {
    swift_once();
  }
  return &static DUIngestableFiletypes.pdfFileExtensions;
}

uint64_t *DUIngestableFiletypes.jsonFileExtensions.unsafeMutableAddressor()
{
  if (qword_2698483A8 != -1) {
    swift_once();
  }
  return &static DUIngestableFiletypes.jsonFileExtensions;
}

uint64_t *DUIngestableFiletypes.txtFileExtensions.unsafeMutableAddressor()
{
  if (qword_2698483B0 != -1) {
    swift_once();
  }
  return &static DUIngestableFiletypes.txtFileExtensions;
}

uint64_t *DUIngestableFiletypes.emlFileExtensions.unsafeMutableAddressor()
{
  if (qword_2698483B8 != -1) {
    swift_once();
  }
  return &static DUIngestableFiletypes.emlFileExtensions;
}

uint64_t *DUIngestableFiletypes.supportedFileExtensions.unsafeMutableAddressor()
{
  if (qword_269848388 != -1) {
    swift_once();
  }
  return &static DUIngestableFiletypes.supportedFileExtensions;
}

uint64_t static DUIngestableFiletypes.supportedFileExtensions.getter()
{
  return sub_24CF79ED0(&qword_269848388);
}

id sub_24CF79A0C(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();
  uint64_t v3 = (void *)sub_24CF7EA68();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t static DUIngestableFiletypes.isFileURLSupported(_:)()
{
  sub_24CF7E8F8();
  uint64_t v0 = sub_24CF7EA58();
  uint64_t v2 = v1;
  swift_bridgeObjectRelease();
  if (qword_269848388 != -1) {
    swift_once();
  }
  char v3 = sub_24CF79AF8(v0, v2, (void *)static DUIngestableFiletypes.supportedFileExtensions);
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_24CF79AF8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_24CF7EA88();
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
    if (v12 || (sub_24CF7EA88() & 1) != 0) {
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

const char *DUIngestableFiletypes.icloudFileExtension.unsafeMutableAddressor()
{
  return "icloud";
}

uint64_t static DUIngestableFiletypes.icloudFileExtension.getter()
{
  return 0x64756F6C6369;
}

void sub_24CF79D08()
{
  static DUIngestableFiletypes.officeFileExtensions = (uint64_t)&unk_26FF53858;
}

uint64_t static DUIngestableFiletypes.officeFileExtensions.getter()
{
  return sub_24CF79ED0(&qword_269848390);
}

void sub_24CF79D58()
{
  static DUIngestableFiletypes.iWorkFileExtensions = (uint64_t)&unk_26FF539D8;
}

uint64_t static DUIngestableFiletypes.iWorkFileExtensions.getter()
{
  return sub_24CF79ED0(&qword_269848398);
}

void sub_24CF79DA8()
{
  static DUIngestableFiletypes.pdfFileExtensions = (uint64_t)&unk_26FF53A28;
}

uint64_t static DUIngestableFiletypes.pdfFileExtensions.getter()
{
  return sub_24CF79ED0(&qword_2698483A0);
}

void sub_24CF79DF8()
{
  static DUIngestableFiletypes.jsonFileExtensions = (uint64_t)&unk_26FF53A58;
}

uint64_t static DUIngestableFiletypes.jsonFileExtensions.getter()
{
  return sub_24CF79ED0(&qword_2698483A8);
}

void sub_24CF79E48()
{
  static DUIngestableFiletypes.txtFileExtensions = (uint64_t)&unk_26FF53A88;
}

uint64_t static DUIngestableFiletypes.txtFileExtensions.getter()
{
  return sub_24CF79ED0(&qword_2698483B0);
}

void sub_24CF79E98()
{
  static DUIngestableFiletypes.emlFileExtensions = (uint64_t)&unk_26FF53AB8;
}

uint64_t static DUIngestableFiletypes.emlFileExtensions.getter()
{
  return sub_24CF79ED0(&qword_2698483B8);
}

uint64_t sub_24CF79ED0(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

id DUIngestableFiletypes.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id DUIngestableFiletypes.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DUIngestableFiletypes();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for DUIngestableFiletypes()
{
  return self;
}

id DUIngestableFiletypes.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DUIngestableFiletypes();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

size_t sub_24CF7A01C(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_25:
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
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  sub_24CF7A484(&qword_2698483E0);
  uint64_t v10 = *(void *)(sub_24CF7EA28() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  uint64_t result = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_24;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_24CF7EA28() - 8);
  if (v5)
  {
    unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
    sub_24CF7A2CC(a4 + v16, v8, (unint64_t)v13 + v16);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

char *sub_24CF7A1CC(char *result, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_24CF7A484(&qword_2698483D0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_24CF7A2CC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a3 < a1 || (uint64_t result = sub_24CF7EA28(), a1 + *(void *)(*(void *)(result - 8) + 72) * a2 <= a3))
  {
    uint64_t v7 = sub_24CF7EA28();
    return MEMORY[0x270FA01D8](a3, a1, a2, v7);
  }
  else if (a3 != a1)
  {
    return MEMORY[0x270FA01D0](a3, a1, a2, result);
  }
  return result;
}

uint64_t sub_24CF7A3A0(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = result;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (!result || v5 > *(void *)(v3 + 24) >> 1)
  {
    if (v4 <= v5) {
      int64_t v7 = v4 + v2;
    }
    else {
      int64_t v7 = v4;
    }
    uint64_t result = (uint64_t)sub_24CF7A1CC((char *)result, v7, 1, (char *)v3);
    uint64_t v3 = result;
  }
  if (!*(void *)(v6 + 16))
  {
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  if ((*(void *)(v3 + 24) >> 1) - *(void *)(v3 + 16) < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t result = swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    uint64_t result = swift_bridgeObjectRelease();
    *id v1 = v3;
    return result;
  }
  uint64_t v8 = *(void *)(v3 + 16);
  BOOL v9 = __OFADD__(v8, v2);
  uint64_t v10 = v8 + v2;
  if (!v9)
  {
    *(void *)(v3 + 16) = v10;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_24CF7A484(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_24CF7A4CC(uint64_t a1)
{
  uint64_t v2 = sub_24CF7A484(&qword_2698483D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_24CF7A860(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_24CF7A898(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      uint64_t v2 = WeakRetained[10];
      int v3 = 138412290;
      uint64_t v4 = v2;
      _os_log_error_impl(&dword_24CF75000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Connection to %@ interrupted.", (uint8_t *)&v3, 0xCu);
    }
    (*(void (**)(void))(WeakRetained[13] + 16))();
  }
}

void sub_24CF7A960(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v2 = *((void *)WeakRetained + 10);
      int v4 = 138412290;
      uint64_t v5 = v2;
      _os_log_impl(&dword_24CF75000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Invalidated connection to %@ .", (uint8_t *)&v4, 0xCu);
    }
    (*(void (**)(void))(*((void *)WeakRetained + 14) + 16))();
    pthread_mutex_lock((pthread_mutex_t *)(WeakRetained + 8));
    int v3 = (void *)*((void *)WeakRetained + 9);
    *((void *)WeakRetained + 9) = 0;

    pthread_mutex_unlock((pthread_mutex_t *)(WeakRetained + 8));
  }
}

void sub_24CF7ACAC(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    int v3 = [v2 localizedDescription];
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_error_impl(&dword_24CF75000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error in addSerializedDocument: %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_24CF7AF20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_24CF7AF44(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_24CF7AF54(uint64_t a1)
{
}

void sub_24CF7AF5C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      BOOL v9 = [v6 localizedDescription];
      int v10 = 138412290;
      uint64_t v11 = v9;
      _os_log_error_impl(&dword_24CF75000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error in synchronousEventExtractionWithSerializedDocument: %@", (uint8_t *)&v10, 0xCu);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
}

void sub_24CF7B13C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = [v6 localizedDescription];
    int v8 = 138412290;
    BOOL v9 = v7;
    _os_log_error_impl(&dword_24CF75000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error in foundInEventResultWithSerializedDocument: %@", (uint8_t *)&v8, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_24CF7B3A4(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v3;
    _os_log_error_impl(&dword_24CF75000, &_os_log_internal, OS_LOG_TYPE_ERROR, "DocumentUnderstandingClient remote call to textunderstandingd error - %@", (uint8_t *)&v4, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_24CF7B758(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    int v3 = 138412290;
    uint64_t v4 = a2;
    _os_log_error_impl(&dword_24CF75000, &_os_log_internal, OS_LOG_TYPE_ERROR, "DocumentUnderstandingClient remote call to textunderstandingd error - %@", (uint8_t *)&v3, 0xCu);
  }
}

void sub_24CF7B9A8()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v0 = 138412290;
    id v1 = @"com.apple.TextUnderstanding.DocumentUnderstandingHarvesting";
    _os_log_impl(&dword_24CF75000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Connection to %@ invalidated.", (uint8_t *)&v0, 0xCu);
  }
}

void sub_24CF7BA44()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    int v0 = 138412290;
    id v1 = @"com.apple.TextUnderstanding.DocumentUnderstandingHarvesting";
    _os_log_error_impl(&dword_24CF75000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Connection to %@ interrupted.", (uint8_t *)&v0, 0xCu);
  }
}

void sub_24CF7BB84()
{
  int v0 = (void *)MEMORY[0x253318DF0]();
  uint64_t v1 = objc_opt_new();
  uint64_t v2 = (void *)qword_26B182BC0;
  qword_26B182BC0 = v1;
}

void sub_24CF7CB00(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = MEMORY[0x253319310](a2);
  if (v3 == MEMORY[0x263EF8708])
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      return;
    }
    LOWORD(v7) = 0;
    uint64_t v5 = &_os_log_internal;
    uint64_t v6 = "DocumentUndersanding: got an unexpected message back from DocumentUpdateHandler";
    goto LABEL_11;
  }
  if (v3 == MEMORY[0x263EF8720])
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      return;
    }
    LOWORD(v7) = 0;
    uint64_t v5 = &_os_log_internal;
    uint64_t v6 = "DocumentUndersanding: got an error back from DocumentUpdateHandler";
LABEL_11:
    _os_log_error_impl(&dword_24CF75000, v5, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v7, 2u);
    return;
  }
  if (v3 == MEMORY[0x263EF86F0] && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v4;
    _os_log_impl(&dword_24CF75000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "DocumentUndersanding: successfully got docUConnection: %@", (uint8_t *)&v7, 0xCu);
  }
}

void sub_24CF7D0D8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    int v7 = [v6 localizedDescription];
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_error_impl(&dword_24CF75000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error in requestExtractionOfPersonalIDWithLinesOfText: %@", (uint8_t *)&v8, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_24CF7DE24()
{
  id v1 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v0 = [v1 objectForKey:@"DUMockPersonalIDResult"];
  if (v0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&qword_269848780, v0);
    }
  }
}

uint64_t sub_24CF7DF0C()
{
  qword_26B182BB0 = objc_alloc_init(DUInformationExtractor);
  return MEMORY[0x270F9A758]();
}

void sub_24CF7E838(uint64_t a1, void *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    int v3 = 138412290;
    id v4 = v2;
    _os_log_error_impl(&dword_24CF75000, &_os_log_internal, OS_LOG_TYPE_ERROR, "DocumentUnderstanding: error in DUFileUpdateSpotlightReceiver received from XPC handler: %@", (uint8_t *)&v3, 0xCu);
  }
}

uint64_t sub_24CF7E8F8()
{
  return MEMORY[0x270EEFC48]();
}

uint64_t sub_24CF7E908()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_24CF7E918()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24CF7E928()
{
  return MEMORY[0x270EF0030]();
}

uint64_t sub_24CF7E938()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_24CF7E948()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_24CF7E958()
{
  return MEMORY[0x270F44A80]();
}

uint64_t sub_24CF7E968()
{
  return MEMORY[0x270F44AA8]();
}

uint64_t sub_24CF7E978()
{
  return MEMORY[0x270F44AB0]();
}

uint64_t sub_24CF7E988()
{
  return MEMORY[0x270F44C70]();
}

uint64_t sub_24CF7E998()
{
  return MEMORY[0x270F44C78]();
}

uint64_t sub_24CF7E9A8()
{
  return MEMORY[0x270F44C80]();
}

uint64_t sub_24CF7E9B8()
{
  return MEMORY[0x270F44C88]();
}

uint64_t sub_24CF7E9C8()
{
  return MEMORY[0x270F44CA0]();
}

uint64_t sub_24CF7E9D8()
{
  return MEMORY[0x270F44CA8]();
}

uint64_t sub_24CF7E9E8()
{
  return MEMORY[0x270FA16A8]();
}

uint64_t sub_24CF7E9F8()
{
  return MEMORY[0x270FA17B8]();
}

uint64_t sub_24CF7EA08()
{
  return MEMORY[0x270FA17C8]();
}

uint64_t sub_24CF7EA18()
{
  return MEMORY[0x270FA1930]();
}

uint64_t sub_24CF7EA28()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_24CF7EA38()
{
  return MEMORY[0x270FA1948]();
}

uint64_t sub_24CF7EA48()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24CF7EA58()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_24CF7EA68()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24CF7EA78()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24CF7EA88()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24CF7EA98()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24CF7EAA8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24CF7EAB8()
{
  return MEMORY[0x270F9FC90]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _exit(int a1)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

int fileno(FILE *a1)
{
  return MEMORY[0x270ED9978](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x270ED9D28](a1);
}

uid_t getuid(void)
{
  return MEMORY[0x270ED9DA0]();
}

int isatty(int a1)
{
  return MEMORY[0x270ED9EF0](*(void *)&a1);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
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

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
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

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF50](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

int setuid(uid_t a1)
{
  return MEMORY[0x270EDB450](*(void *)&a1);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
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

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
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

void xpc_connection_activate(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

uint64_t xpc_connection_set_target_uid()
{
  return MEMORY[0x270EDBF10]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}