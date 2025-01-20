uint64_t UIImage.getPlatformData()()
{
  UIImage *v0;
  NSData *v1;
  NSData *v2;
  uint64_t v3;

  v1 = UIImagePNGRepresentation(v0);
  if (!v1) {
    return 0;
  }
  v2 = v1;
  v3 = sub_24FA75538();

  return v3;
}

id static UIImage.getPlatformImageFrom(data:)(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
  {
    id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
    sub_24FA5A514(a1, a2);
    v5 = (void *)sub_24FA75528();
    id v6 = objc_msgSend(v4, sel_initWithData_, v5);
    sub_24FA5A56C(a1, a2);

    if (v6) {
      return v6;
    }
  }
  id v8 = objc_allocWithZone(MEMORY[0x263F827E8]);
  return objc_msgSend(v8, sel_init);
}

id static UIImage.tryToGetPlatformImageFrom(data:)(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 == 15) {
    return 0;
  }
  id v5 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_24FA5A514(a1, a2);
  id v6 = (void *)sub_24FA75528();
  id v2 = objc_msgSend(v5, sel_initWithData_, v6);
  sub_24FA5A56C(a1, a2);

  return v2;
}

uint64_t sub_24FA5A514(uint64_t a1, unint64_t a2)
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

uint64_t sub_24FA5A56C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_24FA5A580(a1, a2);
  }
  return a1;
}

uint64_t sub_24FA5A580(uint64_t a1, unint64_t a2)
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

Swift::Int_optional __swiftcall UIImage.getFileSize()()
{
  Swift::Int v1 = UIImagePNGRepresentation(v0);
  id v2 = (void *)v1;
  if (v1)
  {
    uint64_t v3 = sub_24FA75538();
    unint64_t v5 = v4;

    switch(v5 >> 62)
    {
      case 1uLL:
        sub_24FA5A580(v3, v5);
        if (__OFSUB__(HIDWORD(v3), v3))
        {
          __break(1u);
          JUMPOUT(0x24FA5A6C0);
        }
        Swift::Int v1 = HIDWORD(v3) - (int)v3;
        break;
      case 2uLL:
        uint64_t v7 = *(void *)(v3 + 16);
        uint64_t v6 = *(void *)(v3 + 24);
        sub_24FA5A580(v3, v5);
        Swift::Int v1 = v6 - v7;
        if (__OFSUB__(v6, v7))
        {
          __break(1u);
          goto LABEL_9;
        }
        break;
      case 3uLL:
LABEL_9:
        sub_24FA5A580(v3, v5);
        Swift::Int v1 = 0;
        break;
      default:
        sub_24FA5A580(v3, v5);
        Swift::Int v1 = BYTE6(v5);
        break;
    }
  }
  Swift::Bool v8 = v2 == 0;
  result.value = v1;
  result.is_nil = v8;
  return result;
}

Swift::String_optional __swiftcall UIImage.getFileExtension()()
{
  Swift::Int v1 = (CGImage *)objc_msgSend(v0, sel_CGImage);
  if (!v1) {
    goto LABEL_5;
  }
  id v2 = v1;
  CFStringRef v3 = (id)CGImageGetUTType(v1);
  if (!v3)
  {

LABEL_5:
    uint64_t v5 = 0;
    uint64_t v7 = 0;
    goto LABEL_6;
  }
  unint64_t v4 = (__CFString *)v3;
  uint64_t v5 = sub_24FA75808();
  uint64_t v7 = v6;

LABEL_6:
  uint64_t v8 = v5;
  v9 = v7;
  result.value._object = v9;
  result.value._countAndFlagsBits = v8;
  return result;
}

uint64_t sub_24FA5A754()
{
  uint64_t v0 = sub_24FA757A8();
  __swift_allocate_value_buffer(v0, qword_269A498F8);
  __swift_project_value_buffer(v0, (uint64_t)qword_269A498F8);
  return sub_24FA75798();
}

uint64_t static Logger.platformImage.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_269A498F0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24FA757A8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269A498F8);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void type metadata accessor for GATSchemaGATMediaQnAUseCase(uint64_t a1)
{
}

void type metadata accessor for GATSchemaGATMediaType(uint64_t a1)
{
}

void type metadata accessor for GATSchemaGATUsecase(uint64_t a1)
{
}

void sub_24FA5A8F4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
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

Swift::String __swiftcall SupportedDocumentType.description()()
{
  unint64_t v1 = 0xD000000000000013;
  uint64_t v2 = (void *)0x800000024FA774B0;
  switch(*v0)
  {
    case 2:
      uint64_t v4 = 0x206567616D49;
      goto LABEL_6;
    case 3:
      uint64_t v2 = (void *)0xE700000000000000;
      unint64_t v1 = 0x65676170626557;
      goto LABEL_12;
    case 4:
      goto LABEL_12;
    case 5:
      uint64_t v4 = 0x207365676150;
LABEL_6:
      unint64_t v1 = v4 & 0xFFFFFFFFFFFFLL | 0x6F44000000000000;
      uint64_t v2 = (void *)0xEE00746E656D7563;
      goto LABEL_12;
    case 6:
      unint64_t v1 = 0xD000000000000014;
      uint64_t v2 = (void *)0x800000024FA77490;
      goto LABEL_12;
    case 7:
      unsigned __int16 v3 = 21586;
      goto LABEL_9;
    case 8:
      unsigned int v5 = 542398548;
      goto LABEL_11;
    default:
      unsigned __int16 v3 = 17488;
LABEL_9:
      unsigned int v5 = v3 | 0x20460000;
LABEL_11:
      unint64_t v1 = v5 | 0x75636F4400000000;
      uint64_t v2 = (void *)0xEC000000746E656DLL;
LABEL_12:
      result._object = v2;
      result._countAndFlagsBits = v1;
      return result;
  }
}

BOOL static SupportedDocumentType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t SupportedDocumentType.hash(into:)()
{
  return sub_24FA75B08();
}

uint64_t sub_24FA5AAD8(char a1)
{
  return *(void *)&aPdfdocumwebpag[8 * a1];
}

BOOL sub_24FA5AAF8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24FA5AB10()
{
  return sub_24FA75B08();
}

uint64_t sub_24FA5AB40()
{
  return sub_24FA5AAD8(*v0);
}

uint64_t sub_24FA5AB48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24FA5D218(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24FA5AB70()
{
  return 0;
}

void sub_24FA5AB7C(unsigned char *a1@<X8>)
{
  *a1 = 9;
}

uint64_t sub_24FA5AB88(uint64_t a1)
{
  unint64_t v2 = sub_24FA5B988();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24FA5ABC4(uint64_t a1)
{
  unint64_t v2 = sub_24FA5B988();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24FA5AC00()
{
  return 0;
}

void sub_24FA5AC0C(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_24FA5AC18(uint64_t a1)
{
  unint64_t v2 = sub_24FA5BBD4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24FA5AC54(uint64_t a1)
{
  unint64_t v2 = sub_24FA5BBD4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24FA5AC90(uint64_t a1)
{
  unint64_t v2 = sub_24FA5BA84();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24FA5ACCC(uint64_t a1)
{
  unint64_t v2 = sub_24FA5BA84();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24FA5AD08(uint64_t a1)
{
  unint64_t v2 = sub_24FA5BB2C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24FA5AD44(uint64_t a1)
{
  unint64_t v2 = sub_24FA5BB2C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24FA5AD80(uint64_t a1)
{
  unint64_t v2 = sub_24FA5BAD8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24FA5ADBC(uint64_t a1)
{
  unint64_t v2 = sub_24FA5BAD8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24FA5ADF8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_24FA5AE28(uint64_t a1)
{
  unint64_t v2 = sub_24FA5BC7C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24FA5AE64(uint64_t a1)
{
  unint64_t v2 = sub_24FA5BC7C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24FA5AEA0(uint64_t a1)
{
  unint64_t v2 = sub_24FA5B9DC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24FA5AEDC(uint64_t a1)
{
  unint64_t v2 = sub_24FA5B9DC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24FA5AF18(uint64_t a1)
{
  unint64_t v2 = sub_24FA5BA30();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24FA5AF54(uint64_t a1)
{
  unint64_t v2 = sub_24FA5BA30();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24FA5AF90(uint64_t a1)
{
  unint64_t v2 = sub_24FA5BB80();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24FA5AFCC(uint64_t a1)
{
  unint64_t v2 = sub_24FA5BB80();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24FA5B008(uint64_t a1)
{
  unint64_t v2 = sub_24FA5BC28();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24FA5B044(uint64_t a1)
{
  unint64_t v2 = sub_24FA5BC28();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SupportedDocumentType.encode(to:)(void *a1)
{
  unint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A49980);
  uint64_t v56 = *(void *)(v4 - 8);
  uint64_t v57 = v4;
  MEMORY[0x270FA5388]();
  v55 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A49988);
  uint64_t v53 = *(void *)(v6 - 8);
  uint64_t v54 = v6;
  MEMORY[0x270FA5388]();
  v52 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A49990);
  uint64_t v50 = *(void *)(v8 - 8);
  uint64_t v51 = v8;
  MEMORY[0x270FA5388]();
  v49 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A49998);
  uint64_t v47 = *(void *)(v10 - 8);
  uint64_t v48 = v10;
  MEMORY[0x270FA5388]();
  v46 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A499A0);
  uint64_t v44 = *(void *)(v12 - 8);
  uint64_t v45 = v12;
  MEMORY[0x270FA5388]();
  v43 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A499A8);
  uint64_t v41 = *(void *)(v14 - 8);
  uint64_t v42 = v14;
  MEMORY[0x270FA5388]();
  v40 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A499B0);
  uint64_t v38 = *(void *)(v39 - 8);
  MEMORY[0x270FA5388]();
  v37 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A499B8);
  uint64_t v36 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388]();
  v19 = (char *)&v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A499C0);
  uint64_t v35 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388]();
  v22 = (char *)&v35 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A499C8);
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v58 = v23;
  uint64_t v59 = v24;
  MEMORY[0x270FA5388]();
  v26 = (char *)&v35 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = *v2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24FA5B988();
  sub_24FA75B38();
  switch(v27)
  {
    case 1:
      char v61 = 1;
      sub_24FA5BC28();
      uint64_t v30 = v58;
      sub_24FA75A88();
      (*(void (**)(char *, uint64_t))(v36 + 8))(v19, v17);
      goto LABEL_12;
    case 2:
      char v62 = 2;
      sub_24FA5BBD4();
      v31 = v37;
      uint64_t v30 = v58;
      sub_24FA75A88();
      (*(void (**)(char *, uint64_t))(v38 + 8))(v31, v39);
      goto LABEL_12;
    case 3:
      char v63 = 3;
      sub_24FA5BB80();
      v32 = v40;
      uint64_t v30 = v58;
      sub_24FA75A88();
      uint64_t v34 = v41;
      uint64_t v33 = v42;
      goto LABEL_11;
    case 4:
      char v64 = 4;
      sub_24FA5BB2C();
      v32 = v43;
      uint64_t v30 = v58;
      sub_24FA75A88();
      uint64_t v34 = v44;
      uint64_t v33 = v45;
      goto LABEL_11;
    case 5:
      char v65 = 5;
      sub_24FA5BAD8();
      v32 = v46;
      uint64_t v30 = v58;
      sub_24FA75A88();
      uint64_t v34 = v47;
      uint64_t v33 = v48;
      goto LABEL_11;
    case 6:
      char v66 = 6;
      sub_24FA5BA84();
      v32 = v49;
      uint64_t v30 = v58;
      sub_24FA75A88();
      uint64_t v34 = v50;
      uint64_t v33 = v51;
      goto LABEL_11;
    case 7:
      char v67 = 7;
      sub_24FA5BA30();
      v32 = v52;
      uint64_t v30 = v58;
      sub_24FA75A88();
      uint64_t v34 = v53;
      uint64_t v33 = v54;
      goto LABEL_11;
    case 8:
      char v68 = 8;
      sub_24FA5B9DC();
      v32 = v55;
      uint64_t v30 = v58;
      sub_24FA75A88();
      uint64_t v34 = v56;
      uint64_t v33 = v57;
LABEL_11:
      (*(void (**)(char *, uint64_t))(v34 + 8))(v32, v33);
LABEL_12:
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v59 + 8))(v26, v30);
      break;
    default:
      char v60 = 0;
      sub_24FA5BC7C();
      uint64_t v28 = v58;
      sub_24FA75A88();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v22, v20);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v59 + 8))(v26, v28);
      break;
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

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_24FA5B988()
{
  unint64_t result = qword_269A499D0;
  if (!qword_269A499D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A499D0);
  }
  return result;
}

unint64_t sub_24FA5B9DC()
{
  unint64_t result = qword_269A499D8;
  if (!qword_269A499D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A499D8);
  }
  return result;
}

unint64_t sub_24FA5BA30()
{
  unint64_t result = qword_269A499E0;
  if (!qword_269A499E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A499E0);
  }
  return result;
}

unint64_t sub_24FA5BA84()
{
  unint64_t result = qword_269A499E8;
  if (!qword_269A499E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A499E8);
  }
  return result;
}

unint64_t sub_24FA5BAD8()
{
  unint64_t result = qword_269A499F0;
  if (!qword_269A499F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A499F0);
  }
  return result;
}

unint64_t sub_24FA5BB2C()
{
  unint64_t result = qword_269A499F8;
  if (!qword_269A499F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A499F8);
  }
  return result;
}

unint64_t sub_24FA5BB80()
{
  unint64_t result = qword_269A49A00;
  if (!qword_269A49A00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A49A00);
  }
  return result;
}

unint64_t sub_24FA5BBD4()
{
  unint64_t result = qword_269A49A08;
  if (!qword_269A49A08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A49A08);
  }
  return result;
}

unint64_t sub_24FA5BC28()
{
  unint64_t result = qword_269A49A10;
  if (!qword_269A49A10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A49A10);
  }
  return result;
}

unint64_t sub_24FA5BC7C()
{
  unint64_t result = qword_269A49A18;
  if (!qword_269A49A18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A49A18);
  }
  return result;
}

uint64_t SupportedDocumentType.hashValue.getter()
{
  return sub_24FA75B18();
}

uint64_t SupportedDocumentType.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  v71 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A49A20);
  uint64_t v62 = *(void *)(v3 - 8);
  uint64_t v63 = v3;
  MEMORY[0x270FA5388]();
  char v68 = (char *)v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A49A28);
  uint64_t v60 = *(void *)(v5 - 8);
  uint64_t v61 = v5;
  MEMORY[0x270FA5388]();
  char v67 = (char *)v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A49A30);
  uint64_t v58 = *(void *)(v7 - 8);
  uint64_t v59 = v7;
  MEMORY[0x270FA5388]();
  v70 = (char *)v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A49A38);
  uint64_t v56 = *(void *)(v9 - 8);
  uint64_t v57 = v9;
  MEMORY[0x270FA5388]();
  char v66 = (char *)v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A49A40);
  uint64_t v54 = *(void *)(v11 - 8);
  uint64_t v55 = v11;
  MEMORY[0x270FA5388]();
  v69 = (char *)v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A49A48);
  uint64_t v53 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388]();
  char v65 = (char *)v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A49A50);
  uint64_t v51 = *(void *)(v48 - 8);
  MEMORY[0x270FA5388]();
  char v64 = (char *)v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A49A58);
  uint64_t v49 = *(void *)(v50 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v16 = (char *)v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A49A60);
  uint64_t v47 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388]();
  v19 = (char *)v45 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A49A68);
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v23 = (char *)v45 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = a1[3];
  v72 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v24);
  sub_24FA5B988();
  uint64_t v25 = v73;
  sub_24FA75B28();
  if (!v25)
  {
    v46 = v19;
    v45[1] = v17;
    uint64_t v27 = v69;
    v26 = v70;
    uint64_t v73 = v21;
    uint64_t v28 = v71;
    v29 = v23;
    uint64_t v30 = sub_24FA75A78();
    if (*(void *)(v30 + 16) == 1)
    {
      char v31 = *(unsigned char *)(v30 + 32);
      switch(v31)
      {
        case 1:
          v75[0] = 1;
          sub_24FA5BC28();
          sub_24FA75A58();
          uint64_t v33 = *(void (**)(char *, uint64_t))(v49 + 8);
          uint64_t v34 = v16;
          uint64_t v35 = &v77;
          goto LABEL_9;
        case 2:
          v75[1] = 2;
          sub_24FA5BBD4();
          v40 = v64;
          sub_24FA75A58();
          uint64_t v33 = *(void (**)(char *, uint64_t))(v51 + 8);
          uint64_t v34 = v40;
          uint64_t v35 = &v76;
          goto LABEL_9;
        case 3:
          v75[2] = 3;
          sub_24FA5BB80();
          uint64_t v41 = v65;
          sub_24FA75A58();
          uint64_t v33 = *(void (**)(char *, uint64_t))(v53 + 8);
          uint64_t v34 = v41;
          uint64_t v35 = &v78;
          goto LABEL_9;
        case 4:
          v75[3] = 4;
          sub_24FA5BB2C();
          v26 = v27;
          sub_24FA75A58();
          uint64_t v43 = v54;
          uint64_t v42 = v55;
          goto LABEL_16;
        case 5:
          v75[4] = 5;
          sub_24FA5BAD8();
          v26 = v66;
          sub_24FA75A58();
          uint64_t v43 = v56;
          uint64_t v42 = v57;
          goto LABEL_16;
        case 6:
          v75[5] = 6;
          sub_24FA5BA84();
          sub_24FA75A58();
          uint64_t v43 = v58;
          uint64_t v42 = v59;
          goto LABEL_16;
        case 7:
          v75[6] = 7;
          sub_24FA5BA30();
          v26 = v67;
          sub_24FA75A58();
          uint64_t v43 = v60;
          uint64_t v42 = v61;
          goto LABEL_16;
        case 8:
          v75[7] = 8;
          sub_24FA5B9DC();
          v26 = v68;
          sub_24FA75A58();
          uint64_t v43 = v62;
          uint64_t v42 = v63;
LABEL_16:
          uint64_t v33 = *(void (**)(char *, uint64_t))(v43 + 8);
          uint64_t v34 = v26;
          break;
        default:
          char v74 = 0;
          sub_24FA5BC7C();
          v32 = v46;
          sub_24FA75A58();
          uint64_t v33 = *(void (**)(char *, uint64_t))(v47 + 8);
          uint64_t v34 = v32;
          uint64_t v35 = (uint64_t *)v75;
LABEL_9:
          uint64_t v42 = *(v35 - 32);
          break;
      }
      v33(v34, v42);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v73 + 8))(v29, v20);
      *uint64_t v28 = v31;
    }
    else
    {
      uint64_t v36 = v20;
      uint64_t v37 = sub_24FA759E8();
      swift_allocError();
      uint64_t v39 = v38;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269A49A70);
      *uint64_t v39 = &type metadata for SupportedDocumentType;
      sub_24FA75A68();
      sub_24FA759D8();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v37 - 8) + 104))(v39, *MEMORY[0x263F8DCB0], v37);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v73 + 8))(v23, v36);
    }
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v72);
}

uint64_t sub_24FA5C71C()
{
  return sub_24FA75B18();
}

uint64_t sub_24FA5C764()
{
  return sub_24FA75B18();
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_24FA5C7FC()
{
  unint64_t result = qword_269A49A78;
  if (!qword_269A49A78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A49A78);
  }
  return result;
}

uint64_t sub_24FA5C850@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return SupportedDocumentType.init(from:)(a1, a2);
}

uint64_t sub_24FA5C868(void *a1)
{
  return SupportedDocumentType.encode(to:)(a1);
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for SupportedDocumentType()
{
  return &type metadata for SupportedDocumentType;
}

uint64_t _s25GenerativeAssistantCommon21SupportedDocumentTypeOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF8) {
    goto LABEL_17;
  }
  if (a2 + 8 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 8) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 8;
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
      return (*a1 | (v4 << 8)) - 8;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v8 = v6 - 9;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s25GenerativeAssistantCommon21SupportedDocumentTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *unint64_t result = a2 + 8;
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
        JUMPOUT(0x24FA5CA08);
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
          *unint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

uint64_t sub_24FA5CA30(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24FA5CA38(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SupportedDocumentType.CodingKeys()
{
  return &type metadata for SupportedDocumentType.CodingKeys;
}

ValueMetadata *type metadata accessor for SupportedDocumentType.PdfDocumentCodingKeys()
{
  return &type metadata for SupportedDocumentType.PdfDocumentCodingKeys;
}

ValueMetadata *type metadata accessor for SupportedDocumentType.WebpageAsPDFCodingKeys()
{
  return &type metadata for SupportedDocumentType.WebpageAsPDFCodingKeys;
}

ValueMetadata *type metadata accessor for SupportedDocumentType.ImagesDocumentCodingKeys()
{
  return &type metadata for SupportedDocumentType.ImagesDocumentCodingKeys;
}

ValueMetadata *type metadata accessor for SupportedDocumentType.WebpageAsLinkCodingKeys()
{
  return &type metadata for SupportedDocumentType.WebpageAsLinkCodingKeys;
}

ValueMetadata *type metadata accessor for SupportedDocumentType.NumbersDocumentCodingKeys()
{
  return &type metadata for SupportedDocumentType.NumbersDocumentCodingKeys;
}

ValueMetadata *type metadata accessor for SupportedDocumentType.PagesDocumentCodingKeys()
{
  return &type metadata for SupportedDocumentType.PagesDocumentCodingKeys;
}

ValueMetadata *type metadata accessor for SupportedDocumentType.KeynoteDocumentCodingKeys()
{
  return &type metadata for SupportedDocumentType.KeynoteDocumentCodingKeys;
}

ValueMetadata *type metadata accessor for SupportedDocumentType.RichTextFileCodingKeys()
{
  return &type metadata for SupportedDocumentType.RichTextFileCodingKeys;
}

ValueMetadata *type metadata accessor for SupportedDocumentType.PlainTextFileCodingKeys()
{
  return &type metadata for SupportedDocumentType.PlainTextFileCodingKeys;
}

unint64_t sub_24FA5CAE4()
{
  unint64_t result = qword_269A49A80;
  if (!qword_269A49A80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A49A80);
  }
  return result;
}

unint64_t sub_24FA5CB3C()
{
  unint64_t result = qword_269A49A88;
  if (!qword_269A49A88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A49A88);
  }
  return result;
}

unint64_t sub_24FA5CB94()
{
  unint64_t result = qword_269A49A90;
  if (!qword_269A49A90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A49A90);
  }
  return result;
}

unint64_t sub_24FA5CBEC()
{
  unint64_t result = qword_269A49A98;
  if (!qword_269A49A98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A49A98);
  }
  return result;
}

unint64_t sub_24FA5CC44()
{
  unint64_t result = qword_269A49AA0;
  if (!qword_269A49AA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A49AA0);
  }
  return result;
}

unint64_t sub_24FA5CC9C()
{
  unint64_t result = qword_269A49AA8;
  if (!qword_269A49AA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A49AA8);
  }
  return result;
}

unint64_t sub_24FA5CCF4()
{
  unint64_t result = qword_269A49AB0;
  if (!qword_269A49AB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A49AB0);
  }
  return result;
}

unint64_t sub_24FA5CD4C()
{
  unint64_t result = qword_269A49AB8;
  if (!qword_269A49AB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A49AB8);
  }
  return result;
}

unint64_t sub_24FA5CDA4()
{
  unint64_t result = qword_269A49AC0;
  if (!qword_269A49AC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A49AC0);
  }
  return result;
}

unint64_t sub_24FA5CDFC()
{
  unint64_t result = qword_269A49AC8;
  if (!qword_269A49AC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A49AC8);
  }
  return result;
}

unint64_t sub_24FA5CE54()
{
  unint64_t result = qword_269A49AD0;
  if (!qword_269A49AD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A49AD0);
  }
  return result;
}

unint64_t sub_24FA5CEAC()
{
  unint64_t result = qword_269A49AD8;
  if (!qword_269A49AD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A49AD8);
  }
  return result;
}

unint64_t sub_24FA5CF04()
{
  unint64_t result = qword_269A49AE0;
  if (!qword_269A49AE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A49AE0);
  }
  return result;
}

unint64_t sub_24FA5CF5C()
{
  unint64_t result = qword_269A49AE8;
  if (!qword_269A49AE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A49AE8);
  }
  return result;
}

unint64_t sub_24FA5CFB4()
{
  unint64_t result = qword_269A49AF0;
  if (!qword_269A49AF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A49AF0);
  }
  return result;
}

unint64_t sub_24FA5D00C()
{
  unint64_t result = qword_269A49AF8;
  if (!qword_269A49AF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A49AF8);
  }
  return result;
}

unint64_t sub_24FA5D064()
{
  unint64_t result = qword_269A49B00;
  if (!qword_269A49B00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A49B00);
  }
  return result;
}

unint64_t sub_24FA5D0BC()
{
  unint64_t result = qword_269A49B08;
  if (!qword_269A49B08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A49B08);
  }
  return result;
}

unint64_t sub_24FA5D114()
{
  unint64_t result = qword_269A49B10;
  if (!qword_269A49B10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A49B10);
  }
  return result;
}

unint64_t sub_24FA5D16C()
{
  unint64_t result = qword_269A49B18;
  if (!qword_269A49B18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A49B18);
  }
  return result;
}

unint64_t sub_24FA5D1C4()
{
  unint64_t result = qword_269A49B20;
  if (!qword_269A49B20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A49B20);
  }
  return result;
}

uint64_t sub_24FA5D218(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6D75636F44666470 && a2 == 0xEB00000000746E65;
  if (v3 || (sub_24FA75AA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4165676170626577 && a2 == 0xEC00000046445073 || (sub_24FA75AA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6F44736567616D69 && a2 == 0xEE00746E656D7563 || (sub_24FA75AA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x4165676170626577 && a2 == 0xED00006B6E694C73 || (sub_24FA75AA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x44737265626D756ELL && a2 == 0xEF746E656D75636FLL || (sub_24FA75AA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x636F447365676170 && a2 == 0xED0000746E656D75 || (sub_24FA75AA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x4465746F6E79656BLL && a2 == 0xEF746E656D75636FLL || (sub_24FA75AA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x7478655468636972 && a2 == 0xEC000000656C6946 || (sub_24FA75AA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x7865546E69616C70 && a2 == 0xED0000656C694674)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else
  {
    char v6 = sub_24FA75AA8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 8;
    }
    else {
      return 9;
    }
  }
}

void sub_24FA5D63C()
{
  unk_269A49B37 = -18;
}

uint64_t static SessionPersistenceUtils.isBackToBackRequest(sessionId:)(uint64_t a1, unint64_t a2)
{
  if (!a2)
  {
    if (qword_269A49918 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_24FA757A8();
    __swift_project_value_buffer(v18, (uint64_t)qword_269A49B38);
    uint64_t v5 = sub_24FA75788();
    os_log_type_t v19 = sub_24FA758C8();
    if (!os_log_type_enabled(v5, v19)) {
      goto LABEL_23;
    }
    uint64_t v20 = swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    uint64_t v30 = v21;
    *(_DWORD *)uint64_t v20 = 136315394;
    sub_24FA602C0(0xD000000000000017, 0x800000024FA76A70, &v30);
    sub_24FA75958();
    *(_WORD *)(v20 + 12) = 2080;
    sub_24FA602C0(0xD00000000000001FLL, 0x800000024FA77500, &v30);
    sub_24FA75958();
    uint64_t v22 = "%s.%s sessionId is nil";
LABEL_22:
    _os_log_impl(&dword_24FA58000, v5, v19, v22, (uint8_t *)v20, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25336AD50](v21, -1, -1);
    MEMORY[0x25336AD50](v20, -1, -1);
LABEL_23:

    return 0;
  }
  swift_bridgeObjectRetain();
  unsigned int v4 = sub_24FA60928(0xD00000000000003FLL, 0x800000024FA77450);
  if (!v4)
  {
    swift_bridgeObjectRelease();
    if (qword_269A49918 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_24FA757A8();
    __swift_project_value_buffer(v23, (uint64_t)qword_269A49B38);
    uint64_t v5 = sub_24FA75788();
    os_log_type_t v19 = sub_24FA758C8();
    if (!os_log_type_enabled(v5, v19)) {
      goto LABEL_23;
    }
    uint64_t v20 = swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    uint64_t v30 = v21;
    *(_DWORD *)uint64_t v20 = 136315394;
    sub_24FA602C0(0xD000000000000017, 0x800000024FA76A70, &v30);
    sub_24FA75958();
    *(_WORD *)(v20 + 12) = 2080;
    sub_24FA602C0(0xD00000000000001FLL, 0x800000024FA77500, &v30);
    sub_24FA75958();
    uint64_t v22 = "%s.%s Cannot retrieve defaults from the extension domain";
    goto LABEL_22;
  }
  uint64_t v5 = v4;
  char v6 = (void *)sub_24FA757F8();
  id v7 = [v5 stringForKey:v6];

  if (!v7)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    if (qword_269A49918 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_24FA757A8();
    __swift_project_value_buffer(v13, (uint64_t)qword_269A49B38);
    uint64_t v14 = sub_24FA75788();
    os_log_type_t v15 = sub_24FA758B8();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      uint64_t v30 = v17;
      *(_DWORD *)uint64_t v16 = 136315394;
      sub_24FA602C0(0xD000000000000017, 0x800000024FA76A70, &v30);
      sub_24FA75958();
      *(_WORD *)(v16 + 12) = 2080;
      sub_24FA602C0(0xD00000000000001FLL, 0x800000024FA77500, &v30);
      sub_24FA75958();
      _os_log_impl(&dword_24FA58000, v14, v15, "%s.%s sessionId didn't matched. We are NOT in the same session.", (uint8_t *)v16, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25336AD50](v17, -1, -1);
      MEMORY[0x25336AD50](v16, -1, -1);
    }

    goto LABEL_23;
  }
  uint64_t v8 = sub_24FA75808();
  uint64_t v10 = v9;

  if (v8 == a1 && v10 == a2)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v12 = sub_24FA75AA8();
    swift_bridgeObjectRelease();
    if ((v12 & 1) == 0) {
      goto LABEL_9;
    }
  }
  if (qword_269A49918 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_24FA757A8();
  __swift_project_value_buffer(v25, (uint64_t)qword_269A49B38);
  swift_bridgeObjectRetain();
  v26 = sub_24FA75788();
  os_log_type_t v27 = sub_24FA758B8();
  if (os_log_type_enabled(v26, v27))
  {
    uint64_t v28 = swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    uint64_t v30 = v29;
    *(_DWORD *)uint64_t v28 = 136315650;
    sub_24FA602C0(0xD000000000000017, 0x800000024FA76A70, &v30);
    sub_24FA75958();
    *(_WORD *)(v28 + 12) = 2080;
    sub_24FA602C0(0xD00000000000001FLL, 0x800000024FA77500, &v30);
    sub_24FA75958();
    *(_WORD *)(v28 + 22) = 2080;
    swift_bridgeObjectRetain();
    sub_24FA602C0(a1, a2, &v30);
    sub_24FA75958();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24FA58000, v26, v27, "%s.%s sessionId matched. We are still in the same session %s", (uint8_t *)v28, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x25336AD50](v29, -1, -1);
    MEMORY[0x25336AD50](v28, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return 1;
}

void static SessionPersistenceUtils.setSession(forCurrentSession:)(uint64_t a1, unint64_t a2)
{
  if (qword_269A49918 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_24FA757A8();
  __swift_project_value_buffer(v4, (uint64_t)qword_269A49B38);
  swift_bridgeObjectRetain_n();
  uint64_t v5 = sub_24FA75788();
  os_log_type_t v6 = sub_24FA758B8();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v17 = v8;
    *(_DWORD *)uint64_t v7 = 136315650;
    sub_24FA602C0(0xD000000000000017, 0x800000024FA76A70, &v17);
    sub_24FA75958();
    *(_WORD *)(v7 + 12) = 2080;
    sub_24FA602C0(0xD00000000000001ELL, 0x800000024FA77560, &v17);
    sub_24FA75958();
    *(_WORD *)(v7 + 22) = 2080;
    swift_bridgeObjectRetain();
    sub_24FA602C0(a1, a2, &v17);
    sub_24FA75958();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24FA58000, v5, v6, "%s.%s Storing current session %s.", (uint8_t *)v7, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x25336AD50](v8, -1, -1);
    MEMORY[0x25336AD50](v7, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  id v9 = sub_24FA60928(0xD00000000000003FLL, 0x800000024FA77450);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = (void *)sub_24FA757F8();
    char v12 = (void *)sub_24FA757F8();
    objc_msgSend(v10, sel_setObject_forKey_, v11, v12);
  }
  else
  {
    uint64_t v13 = sub_24FA75788();
    os_log_type_t v14 = sub_24FA758C8();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t v17 = v16;
      *(_DWORD *)uint64_t v15 = 136315394;
      sub_24FA602C0(0xD000000000000017, 0x800000024FA76A70, &v17);
      sub_24FA75958();
      *(_WORD *)(v15 + 12) = 2080;
      sub_24FA602C0(0xD00000000000001ELL, 0x800000024FA77560, &v17);
      sub_24FA75958();
      _os_log_impl(&dword_24FA58000, v13, v14, "%s.%s Cannot retrieve defaults from the extension domain", (uint8_t *)v15, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25336AD50](v16, -1, -1);
      MEMORY[0x25336AD50](v15, -1, -1);
    }
  }
}

uint64_t static SessionPersistenceUtils.didConfirmInSession(sessionId:)(uint64_t a1, uint64_t a2)
{
  id v4 = sub_24FA60928(0xD00000000000003FLL, 0x800000024FA77450);
  if (v4)
  {
    uint64_t v5 = v4;
    os_log_type_t v6 = (void *)sub_24FA757F8();
    id v7 = objc_msgSend(v5, sel_stringForKey_, v6);

    if (!v7)
    {
LABEL_8:
      char v13 = _s25GenerativeAssistantCommon23SessionPersistenceUtilsV017didConfirmInMediaD09sessionIdSbSS_tFZ_0(a1, a2);

      return v13 & 1;
    }
    uint64_t v8 = sub_24FA75808();
    uint64_t v10 = v9;

    if (v8 == a1 && v10 == a2)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v12 = sub_24FA75AA8();
      swift_bridgeObjectRelease();
      if ((v12 & 1) == 0) {
        goto LABEL_8;
      }
    }
    if (qword_269A49918 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_24FA757A8();
    __swift_project_value_buffer(v20, (uint64_t)qword_269A49B38);
    uint64_t v21 = sub_24FA75788();
    os_log_type_t v22 = sub_24FA758B8();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      uint64_t v25 = v24;
      *(_DWORD *)uint64_t v23 = 136315394;
      sub_24FA602C0(0xD000000000000017, 0x800000024FA76A70, &v25);
      sub_24FA75958();
      *(_WORD *)(v23 + 12) = 2080;
      sub_24FA602C0(0xD00000000000001FLL, 0x800000024FA77580, &v25);
      sub_24FA75958();
      _os_log_impl(&dword_24FA58000, v21, v22, "%s.%s text sessionId matched", (uint8_t *)v23, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25336AD50](v24, -1, -1);
      MEMORY[0x25336AD50](v23, -1, -1);
    }

    return 1;
  }
  else
  {
    if (qword_269A49918 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_24FA757A8();
    __swift_project_value_buffer(v15, (uint64_t)qword_269A49B38);
    uint64_t v16 = sub_24FA75788();
    os_log_type_t v17 = sub_24FA758C8();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      uint64_t v25 = v19;
      *(_DWORD *)uint64_t v18 = 136315394;
      sub_24FA602C0(0xD000000000000017, 0x800000024FA76A70, &v25);
      sub_24FA75958();
      *(_WORD *)(v18 + 12) = 2080;
      sub_24FA602C0(0xD00000000000001FLL, 0x800000024FA77580, &v25);
      sub_24FA75958();
      _os_log_impl(&dword_24FA58000, v16, v17, "%s.%s Cannot retrieve defaults from the extension domain", (uint8_t *)v18, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25336AD50](v19, -1, -1);
      MEMORY[0x25336AD50](v18, -1, -1);
    }

    return 0;
  }
}

void static SessionPersistenceUtils.setConfirmation(forTextSession:)(uint64_t a1, uint64_t a2)
{
}

void static SessionPersistenceUtils.setConfirmation(forMediaSession:)(uint64_t a1, uint64_t a2)
{
}

void sub_24FA5E648(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  id v6 = sub_24FA60928(0xD00000000000003FLL, 0x800000024FA77450);
  if (v6)
  {
    id v7 = v6;
    os_log_t oslog = (os_log_t)a3;
    if (qword_269A49918 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_24FA757A8();
    __swift_project_value_buffer(v8, (uint64_t)qword_269A49B38);
    uint64_t v9 = sub_24FA75788();
    os_log_type_t v10 = sub_24FA758B8();
    if (os_log_type_enabled(v9, v10))
    {
      unint64_t v11 = a4;
      uint64_t v12 = swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v22 = v13;
      *(_DWORD *)uint64_t v12 = 136315394;
      sub_24FA602C0(0xD000000000000017, 0x800000024FA76A70, &v22);
      sub_24FA75958();
      *(_WORD *)(v12 + 12) = 2080;
      sub_24FA602C0((uint64_t)oslog, v11, &v22);
      sub_24FA75958();
      _os_log_impl(&dword_24FA58000, v9, v10, "%s.%s", (uint8_t *)v12, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25336AD50](v13, -1, -1);
      MEMORY[0x25336AD50](v12, -1, -1);
    }

    os_log_type_t v14 = (void *)sub_24FA757F8();
    uint64_t v15 = (void *)sub_24FA757F8();
    objc_msgSend(v7, sel_setObject_forKey_, v14, v15);
  }
  else
  {
    if (qword_269A49918 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_24FA757A8();
    __swift_project_value_buffer(v16, (uint64_t)qword_269A49B38);
    osloga = sub_24FA75788();
    os_log_type_t v17 = sub_24FA758C8();
    if (os_log_type_enabled(osloga, v17))
    {
      uint64_t v18 = swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      uint64_t v22 = v19;
      *(_DWORD *)uint64_t v18 = 136315394;
      sub_24FA602C0(0xD000000000000017, 0x800000024FA76A70, &v22);
      sub_24FA75958();
      *(_WORD *)(v18 + 12) = 2080;
      sub_24FA602C0(a3, a4, &v22);
      sub_24FA75958();
      _os_log_impl(&dword_24FA58000, osloga, v17, "%s.%s Cannot retrieve defaults from the extension domain", (uint8_t *)v18, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25336AD50](v19, -1, -1);
      MEMORY[0x25336AD50](v18, -1, -1);
    }
    else
    {
    }
  }
}

uint64_t SessionPersistenceUtils.SessionStoredValues.didRemoveAttachment.getter()
{
  return *v0;
}

uint64_t SessionPersistenceUtils.SessionStoredValues.didRemoveAttachment.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*SessionPersistenceUtils.SessionStoredValues.didRemoveAttachment.modify())()
{
  return nullsub_1;
}

uint64_t SessionPersistenceUtils.SessionStoredValues.didSelectAlternateAttachment.getter()
{
  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t SessionPersistenceUtils.SessionStoredValues.didSelectAlternateAttachment.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 1) = result;
  return result;
}

uint64_t (*SessionPersistenceUtils.SessionStoredValues.didSelectAlternateAttachment.modify())()
{
  return nullsub_1;
}

void static SessionPersistenceUtils.storedValuesForSession(sessionId:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  __int16 v50 = 0;
  if (!a2)
  {
    if (qword_269A49918 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_24FA757A8();
    __swift_project_value_buffer(v24, (uint64_t)qword_269A49B38);
    uint64_t v25 = sub_24FA75788();
    os_log_type_t v26 = sub_24FA758C8();
    if (!os_log_type_enabled(v25, v26)) {
      goto LABEL_29;
    }
    uint64_t v27 = swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    uint64_t v49 = v28;
    *(_DWORD *)uint64_t v27 = 136315394;
    sub_24FA602C0(0xD000000000000017, 0x800000024FA76A70, &v49);
    sub_24FA75958();
    *(_WORD *)(v27 + 12) = 2080;
    sub_24FA602C0(0xD000000000000022, 0x800000024FA776A0, &v49);
    sub_24FA75958();
    uint64_t v29 = "%s.%s Missing sessionId";
    goto LABEL_28;
  }
  if (qword_269A49910 != -1) {
    swift_once();
  }
  id v6 = sub_24FA60928(qword_269A49B28, unk_269A49B30);
  if (!v6)
  {
    if (qword_269A49918 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_24FA757A8();
    __swift_project_value_buffer(v30, (uint64_t)qword_269A49B38);
    uint64_t v25 = sub_24FA75788();
    os_log_type_t v26 = sub_24FA758C8();
    if (!os_log_type_enabled(v25, v26)) {
      goto LABEL_29;
    }
    uint64_t v27 = swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    uint64_t v49 = v28;
    *(_DWORD *)uint64_t v27 = 136315394;
    sub_24FA602C0(0xD000000000000017, 0x800000024FA76A70, &v49);
    sub_24FA75958();
    *(_WORD *)(v27 + 12) = 2080;
    sub_24FA602C0(0xD000000000000022, 0x800000024FA776A0, &v49);
    sub_24FA75958();
    uint64_t v29 = "%s.%s Cannot retrieve defaults from the Siri domain";
LABEL_28:
    _os_log_impl(&dword_24FA58000, v25, v26, v29, (uint8_t *)v27, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25336AD50](v28, -1, -1);
    MEMORY[0x25336AD50](v27, -1, -1);
LABEL_29:

    *(_WORD *)a3 = 0;
    return;
  }
  id v7 = v6;
  uint64_t v8 = (void *)sub_24FA757F8();
  id v9 = objc_msgSend(v7, sel_stringForKey_, v8);

  if (!v9) {
    goto LABEL_16;
  }
  uint64_t v10 = sub_24FA75808();
  uint64_t v12 = v11;

  if (v10 == a1 && v12 == a2)
  {
    swift_bridgeObjectRelease();
    goto LABEL_31;
  }
  char v14 = sub_24FA75AA8();
  swift_bridgeObjectRelease();
  if (v14)
  {
LABEL_31:
    if (qword_269A49918 != -1) {
      swift_once();
    }
    uint64_t v31 = sub_24FA757A8();
    __swift_project_value_buffer(v31, (uint64_t)qword_269A49B38);
    v32 = sub_24FA75788();
    os_log_type_t v33 = sub_24FA758B8();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      uint64_t v49 = v35;
      *(_DWORD *)uint64_t v34 = 136315394;
      sub_24FA602C0(0xD000000000000017, 0x800000024FA76A70, &v49);
      sub_24FA75958();
      *(_WORD *)(v34 + 12) = 2080;
      sub_24FA602C0(0xD000000000000022, 0x800000024FA776A0, &v49);
      sub_24FA75958();
      _os_log_impl(&dword_24FA58000, v32, v33, "%s.%s sessionId matched for removeAttachmentKey", (uint8_t *)v34, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25336AD50](v35, -1, -1);
      MEMORY[0x25336AD50](v34, -1, -1);
    }

    HIBYTE(v50) = 1;
    goto LABEL_36;
  }
  if (qword_269A49918 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_24FA757A8();
  __swift_project_value_buffer(v15, (uint64_t)qword_269A49B38);
  uint64_t v16 = sub_24FA75788();
  os_log_type_t v17 = sub_24FA758B8();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v48 = swift_slowAlloc();
    uint64_t v49 = v48;
    *(_DWORD *)uint64_t v18 = 136315394;
    sub_24FA602C0(0xD000000000000017, 0x800000024FA76A70, &v49);
    sub_24FA75958();
    *(_WORD *)(v18 + 12) = 2080;
    sub_24FA602C0(0xD000000000000022, 0x800000024FA776A0, &v49);
    sub_24FA75958();
    _os_log_impl(&dword_24FA58000, v16, v17, "%s.%s sessionId not matched for removeAttachmentKey", (uint8_t *)v18, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25336AD50](v48, -1, -1);
    MEMORY[0x25336AD50](v18, -1, -1);
  }

LABEL_16:
  uint64_t v19 = (void *)sub_24FA757F8();
  id v20 = objc_msgSend(v7, sel_stringForKey_, v19);

  if (v20)
  {
    uint64_t v21 = sub_24FA75808();
    uint64_t v23 = v22;

    if (v21 == a1 && v23 == a2)
    {
      swift_bridgeObjectRelease();
LABEL_38:
      if (qword_269A49918 != -1) {
        swift_once();
      }
      uint64_t v37 = sub_24FA757A8();
      __swift_project_value_buffer(v37, (uint64_t)qword_269A49B38);
      uint64_t v38 = sub_24FA75788();
      os_log_type_t v39 = sub_24FA758B8();
      if (os_log_type_enabled(v38, v39))
      {
        uint64_t v40 = swift_slowAlloc();
        uint64_t v41 = swift_slowAlloc();
        uint64_t v49 = v41;
        *(_DWORD *)uint64_t v40 = 136315394;
        sub_24FA602C0(0xD000000000000017, 0x800000024FA76A70, &v49);
        sub_24FA75958();
        *(_WORD *)(v40 + 12) = 2080;
        sub_24FA602C0(0xD000000000000022, 0x800000024FA776A0, &v49);
        sub_24FA75958();
        _os_log_impl(&dword_24FA58000, v38, v39, "%s.%s sessionId matched for selectAlternateAttachmentKey", (uint8_t *)v40, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x25336AD50](v41, -1, -1);
        MEMORY[0x25336AD50](v40, -1, -1);
      }

      LOBYTE(v50) = 1;
      goto LABEL_43;
    }
    char v36 = sub_24FA75AA8();
    swift_bridgeObjectRelease();
    if (v36) {
      goto LABEL_38;
    }
    if (qword_269A49918 != -1) {
      swift_once();
    }
    uint64_t v43 = sub_24FA757A8();
    __swift_project_value_buffer(v43, (uint64_t)qword_269A49B38);
    uint64_t v44 = sub_24FA75788();
    os_log_type_t v45 = sub_24FA758B8();
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v46 = swift_slowAlloc();
      uint64_t v47 = swift_slowAlloc();
      uint64_t v49 = v47;
      *(_DWORD *)uint64_t v46 = 136315394;
      sub_24FA602C0(0xD000000000000017, 0x800000024FA76A70, &v49);
      sub_24FA75958();
      *(_WORD *)(v46 + 12) = 2080;
      sub_24FA602C0(0xD000000000000022, 0x800000024FA776A0, &v49);
      sub_24FA75958();
      _os_log_impl(&dword_24FA58000, v44, v45, "%s.%s sessionId not matched for selectAlternateAttachmentKey", (uint8_t *)v46, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25336AD50](v47, -1, -1);
      MEMORY[0x25336AD50](v46, -1, -1);
    }
  }
LABEL_36:

LABEL_43:
  char v42 = v50;
  *(unsigned char *)a3 = HIBYTE(v50);
  *(unsigned char *)(a3 + 1) = v42;
}

void static SessionPersistenceUtils.setRemoveAttachment(forSession:)()
{
  if (qword_269A49918 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24FA757A8();
  __swift_project_value_buffer(v0, (uint64_t)qword_269A49B38);
  uint64_t v1 = sub_24FA75788();
  os_log_type_t v2 = sub_24FA758B8();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    uint64_t v13 = v4;
    *(_DWORD *)uint64_t v3 = 136315394;
    sub_24FA602C0(0xD000000000000017, 0x800000024FA76A70, &v13);
    sub_24FA75958();
    *(_WORD *)(v3 + 12) = 2080;
    sub_24FA602C0(0xD000000000000020, 0x800000024FA77770, &v13);
    sub_24FA75958();
    _os_log_impl(&dword_24FA58000, v1, v2, "%s.%s", (uint8_t *)v3, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25336AD50](v4, -1, -1);
    MEMORY[0x25336AD50](v3, -1, -1);
  }

  if (qword_269A49910 != -1) {
    swift_once();
  }
  id v5 = sub_24FA60928(qword_269A49B28, unk_269A49B30);
  if (v5)
  {
    id v6 = v5;
    id v7 = (void *)sub_24FA757F8();
    uint64_t v8 = (void *)sub_24FA757F8();
    objc_msgSend(v6, sel_setObject_forKey_, v7, v8);
  }
  else
  {
    id v9 = sub_24FA75788();
    os_log_type_t v10 = sub_24FA758C8();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v13 = v12;
      *(_DWORD *)uint64_t v11 = 136315394;
      sub_24FA602C0(0xD000000000000017, 0x800000024FA76A70, &v13);
      sub_24FA75958();
      *(_WORD *)(v11 + 12) = 2080;
      sub_24FA602C0(0xD000000000000020, 0x800000024FA77770, &v13);
      sub_24FA75958();
      _os_log_impl(&dword_24FA58000, v9, v10, "%s.%s Cannot retrieve defaults from the Siri domain", (uint8_t *)v11, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25336AD50](v12, -1, -1);
      MEMORY[0x25336AD50](v11, -1, -1);
    }
  }
}

void static SessionPersistenceUtils.setDidSelectAlternateAttachment(_:forSession:)(char a1)
{
  if (qword_269A49918 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24FA757A8();
  __swift_project_value_buffer(v2, (uint64_t)qword_269A49B38);
  uint64_t v3 = sub_24FA75788();
  os_log_type_t v4 = sub_24FA758B8();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v15 = v6;
    *(_DWORD *)uint64_t v5 = 136315394;
    sub_24FA602C0(0xD000000000000017, 0x800000024FA76A70, &v15);
    sub_24FA75958();
    *(_WORD *)(v5 + 12) = 2080;
    sub_24FA602C0(0xD00000000000002ELL, 0x800000024FA777A0, &v15);
    sub_24FA75958();
    _os_log_impl(&dword_24FA58000, v3, v4, "%s.%s", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25336AD50](v6, -1, -1);
    MEMORY[0x25336AD50](v5, -1, -1);
  }

  if (qword_269A49910 != -1) {
    swift_once();
  }
  id v7 = sub_24FA60928(qword_269A49B28, unk_269A49B30);
  if (v7)
  {
    uint64_t v8 = v7;
    if (a1) {
      uint64_t v9 = sub_24FA757F8();
    }
    else {
      uint64_t v9 = 0;
    }
    char v14 = (void *)sub_24FA757F8();
    objc_msgSend(v8, sel_setObject_forKey_, v9, v14);

    swift_unknownObjectRelease();
  }
  else
  {
    os_log_type_t v10 = sub_24FA75788();
    os_log_type_t v11 = sub_24FA758C8();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v15 = v13;
      *(_DWORD *)uint64_t v12 = 136315394;
      sub_24FA602C0(0xD000000000000017, 0x800000024FA76A70, &v15);
      sub_24FA75958();
      *(_WORD *)(v12 + 12) = 2080;
      sub_24FA602C0(0xD00000000000002ELL, 0x800000024FA777A0, &v15);
      sub_24FA75958();
      _os_log_impl(&dword_24FA58000, v10, v11, "%s.%s Cannot retrieve defaults from the Siri domain", (uint8_t *)v12, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25336AD50](v13, -1, -1);
      MEMORY[0x25336AD50](v12, -1, -1);
    }
  }
}

void static SessionPersistenceUtils.clearStoredValuesForSession()()
{
  if (qword_269A49918 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24FA757A8();
  __swift_project_value_buffer(v0, (uint64_t)qword_269A49B38);
  uint64_t v1 = sub_24FA75788();
  os_log_type_t v2 = sub_24FA758B8();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    uint64_t v13 = v4;
    *(_DWORD *)uint64_t v3 = 136315394;
    sub_24FA602C0(0xD000000000000017, 0x800000024FA76A70, &v13);
    sub_24FA75958();
    *(_WORD *)(v3 + 12) = 2080;
    sub_24FA602C0(0xD00000000000001DLL, 0x800000024FA777D0, &v13);
    sub_24FA75958();
    _os_log_impl(&dword_24FA58000, v1, v2, "%s.%s", (uint8_t *)v3, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25336AD50](v4, -1, -1);
    MEMORY[0x25336AD50](v3, -1, -1);
  }

  if (qword_269A49910 != -1) {
    swift_once();
  }
  id v5 = sub_24FA60928(qword_269A49B28, unk_269A49B30);
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = (void *)sub_24FA757F8();
    objc_msgSend(v6, sel_setURL_forKey_, 0, v7);

    uint64_t v8 = (void *)sub_24FA757F8();
    objc_msgSend(v6, sel_setURL_forKey_, 0, v8);
  }
  else
  {
    uint64_t v9 = sub_24FA75788();
    os_log_type_t v10 = sub_24FA758C8();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v13 = v12;
      *(_DWORD *)uint64_t v11 = 136315394;
      sub_24FA602C0(0xD000000000000017, 0x800000024FA76A70, &v13);
      sub_24FA75958();
      *(_WORD *)(v11 + 12) = 2080;
      sub_24FA602C0(0xD00000000000001DLL, 0x800000024FA777D0, &v13);
      sub_24FA75958();
      _os_log_impl(&dword_24FA58000, v9, v10, "%s.%s Cannot retrieve defaults from the Siri domain", (uint8_t *)v11, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25336AD50](v12, -1, -1);
      MEMORY[0x25336AD50](v11, -1, -1);
    }
  }
}

unint64_t static Logger.subsystem.getter()
{
  return 0xD00000000000003FLL;
}

uint64_t sub_24FA600A4()
{
  uint64_t v0 = sub_24FA757A8();
  __swift_allocate_value_buffer(v0, qword_269A49B38);
  __swift_project_value_buffer(v0, (uint64_t)qword_269A49B38);
  return sub_24FA75798();
}

uint64_t static Logger.sessionPersistenceUtils.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_269A49918 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24FA757A8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269A49B38);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_24FA601D4(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_24FA601E4(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_24FA60220(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_24FA60248(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_24FA602C0(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_24FA75958();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_24FA602C0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24FA60394(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24FA614EC((uint64_t)v12, *a3);
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
      sub_24FA614EC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_24FA60394(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24FA75968();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24FA60550(a5, a6);
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
  uint64_t v8 = sub_24FA759F8();
  if (!v8)
  {
    sub_24FA75A08();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24FA75A38();
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

uint64_t sub_24FA60550(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24FA605E8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24FA607C8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24FA607C8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24FA605E8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24FA60760(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24FA759A8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24FA75A08();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24FA75858();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24FA75A38();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24FA75A08();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24FA60760(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A49B50);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24FA607C8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A49B50);
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
  uint64_t result = sub_24FA75A38();
  __break(1u);
  return result;
}

unsigned char **sub_24FA60918(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

id sub_24FA60928(uint64_t a1, uint64_t a2)
{
  id v4 = objc_msgSend(self, sel_mainBundle);
  id v5 = objc_msgSend(v4, sel_bundleIdentifier);

  if (v5)
  {
    uint64_t v6 = sub_24FA75808();
    uint64_t v8 = v7;

    if (v6 == a1 && v8 == a2)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v10 = sub_24FA75AA8();
      swift_bridgeObjectRelease();
      if ((v10 & 1) == 0)
      {
        id v11 = objc_allocWithZone(MEMORY[0x263EFFA40]);
        swift_bridgeObjectRetain();
        uint64_t v12 = (void *)sub_24FA757F8();
        swift_bridgeObjectRelease();
        id v13 = objc_msgSend(v11, sel_initWithSuiteName_, v12);

        return v13;
      }
    }
    return objc_msgSend(self, sel_standardUserDefaults);
  }
  if (qword_269A49918 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_24FA757A8();
  __swift_project_value_buffer(v14, (uint64_t)qword_269A49B38);
  uint64_t v15 = sub_24FA75788();
  os_log_type_t v16 = sub_24FA758C8();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v20 = v18;
    *(_DWORD *)uint64_t v17 = 136315394;
    sub_24FA602C0(0xD000000000000017, 0x800000024FA76A70, &v20);
    sub_24FA75958();
    *(_WORD *)(v17 + 12) = 2080;
    sub_24FA602C0(0xD000000000000018, 0x800000024FA77830, &v20);
    sub_24FA75958();
    _os_log_impl(&dword_24FA58000, v15, v16, "%s.%s Cannot retrieve bundle id", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25336AD50](v18, -1, -1);
    MEMORY[0x25336AD50](v17, -1, -1);
  }

  return 0;
}

uint64_t _s25GenerativeAssistantCommon23SessionPersistenceUtilsV017didConfirmInMediaD09sessionIdSbSS_tFZ_0(uint64_t a1, uint64_t a2)
{
  if (qword_269A49918 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_24FA757A8();
  __swift_project_value_buffer(v4, (uint64_t)qword_269A49B38);
  id v5 = sub_24FA75788();
  os_log_type_t v6 = sub_24FA758B8();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v30 = v8;
    *(_DWORD *)uint64_t v7 = 136315394;
    sub_24FA602C0(0xD000000000000017, 0x800000024FA76A70, &v30);
    sub_24FA75958();
    *(_WORD *)(v7 + 12) = 2080;
    sub_24FA602C0(0xD000000000000024, 0x800000024FA77800, &v30);
    sub_24FA75958();
    _os_log_impl(&dword_24FA58000, v5, v6, "%s.%s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25336AD50](v8, -1, -1);
    MEMORY[0x25336AD50](v7, -1, -1);
  }

  int64_t v9 = sub_24FA60928(0xD00000000000003FLL, 0x800000024FA77450);
  if (!v9)
  {
    char v10 = sub_24FA75788();
    os_log_type_t v16 = sub_24FA758C8();
    if (os_log_type_enabled(v10, v16))
    {
      uint64_t v17 = swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      uint64_t v30 = v18;
      *(_DWORD *)uint64_t v17 = 136315394;
      sub_24FA602C0(0xD000000000000017, 0x800000024FA76A70, &v30);
      sub_24FA75958();
      *(_WORD *)(v17 + 12) = 2080;
      sub_24FA602C0(0xD000000000000024, 0x800000024FA77800, &v30);
      sub_24FA75958();
      _os_log_impl(&dword_24FA58000, v10, v16, "%s.%s Cannot retrieve defaults from the extension domain", (uint8_t *)v17, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25336AD50](v18, -1, -1);
      MEMORY[0x25336AD50](v17, -1, -1);
    }
    goto LABEL_22;
  }
  char v10 = v9;
  id v11 = (void *)sub_24FA757F8();
  id v12 = [v10 stringForKey:v11];

  if (!v12)
  {
    uint64_t v19 = sub_24FA75788();
    os_log_type_t v20 = sub_24FA758B8();
    if (!os_log_type_enabled(v19, v20))
    {
LABEL_21:

LABEL_22:
      return 0;
    }
    uint64_t v21 = swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    uint64_t v30 = v22;
    *(_DWORD *)uint64_t v21 = 136315394;
    sub_24FA602C0(0xD000000000000017, 0x800000024FA76A70, &v30);
    sub_24FA75958();
    *(_WORD *)(v21 + 12) = 2080;
    sub_24FA602C0(0xD000000000000024, 0x800000024FA77800, &v30);
    sub_24FA75958();
    uint64_t v23 = "%s.%s no media sessionId stored";
LABEL_20:
    _os_log_impl(&dword_24FA58000, v19, v20, v23, (uint8_t *)v21, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25336AD50](v22, -1, -1);
    MEMORY[0x25336AD50](v21, -1, -1);
    goto LABEL_21;
  }
  uint64_t v13 = sub_24FA75808();
  uint64_t v15 = v14;

  if (v13 != a1 || v15 != a2)
  {
    char v24 = sub_24FA75AA8();
    swift_bridgeObjectRelease();
    if (v24) {
      goto LABEL_15;
    }
    uint64_t v19 = sub_24FA75788();
    os_log_type_t v20 = sub_24FA758B8();
    if (!os_log_type_enabled(v19, v20)) {
      goto LABEL_21;
    }
    uint64_t v21 = swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    uint64_t v30 = v22;
    *(_DWORD *)uint64_t v21 = 136315394;
    sub_24FA602C0(0xD000000000000017, 0x800000024FA76A70, &v30);
    sub_24FA75958();
    *(_WORD *)(v21 + 12) = 2080;
    sub_24FA602C0(0xD000000000000024, 0x800000024FA77800, &v30);
    sub_24FA75958();
    uint64_t v23 = "%s.%s sessionId not matched";
    goto LABEL_20;
  }
  swift_bridgeObjectRelease();
LABEL_15:
  uint64_t v25 = sub_24FA75788();
  os_log_type_t v26 = sub_24FA758B8();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    uint64_t v30 = v28;
    *(_DWORD *)uint64_t v27 = 136315394;
    sub_24FA602C0(0xD000000000000017, 0x800000024FA76A70, &v30);
    sub_24FA75958();
    *(_WORD *)(v27 + 12) = 2080;
    sub_24FA602C0(0xD000000000000024, 0x800000024FA77800, &v30);
    sub_24FA75958();
    _os_log_impl(&dword_24FA58000, v25, v26, "%s.%s media sessionId matched", (uint8_t *)v27, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25336AD50](v28, -1, -1);
    MEMORY[0x25336AD50](v27, -1, -1);
  }

  return 1;
}

ValueMetadata *type metadata accessor for SessionPersistenceUtils()
{
  return &type metadata for SessionPersistenceUtils;
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SessionPersistenceUtils.SessionStoredValues(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 65281 <= 0xFFFEFFFF) {
    int v2 = 2;
  }
  else {
    int v2 = 4;
  }
  if (a2 + 65281 < 0xFF0000) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 16)) - 65281;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 16)) - 65281;
    }
    int v4 = *((unsigned __int8 *)a1 + 2);
    if (*((unsigned char *)a1 + 2)) {
      return (*a1 | (v4 << 16)) - 65281;
    }
  }
LABEL_17:
  unsigned int v6 = *(unsigned __int8 *)a1;
  BOOL v7 = v6 >= 2;
  int v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for SessionPersistenceUtils.SessionStoredValues(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a3 + 65281 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 65281 < 0xFF0000) {
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
    unsigned int v6 = ((a2 - 255) >> 16) + 1;
    *(_WORD *)uint64_t result = a2 - 255;
    switch(v5)
    {
      case 1:
        *(unsigned char *)(result + 2) = v6;
        break;
      case 2:
        *(_WORD *)(result + 2) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24FA614B4);
      case 4:
        *(_DWORD *)(result + 2) = v6;
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
        *(unsigned char *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 2) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *(unsigned char *)uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SessionPersistenceUtils.SessionStoredValues()
{
  return &type metadata for SessionPersistenceUtils.SessionStoredValues;
}

uint64_t sub_24FA614EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t static GATError.errorDomain.getter()
{
  swift_beginAccess();
  uint64_t v0 = qword_269A49B58;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t static GATError.errorDomain.setter(uint64_t a1, char *a2)
{
  qword_269A49B58 = a1;
  off_269A49B60 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static GATError.errorDomain.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t GATError.errorCode.getter()
{
  return *(unsigned __int8 *)(v0 + 16);
}

unint64_t GATError.errorUserInfo.getter()
{
  uint64_t v2 = *v0;
  uint64_t v1 = v0[1];
  if (!*((unsigned char *)v0 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A49B68);
    uint64_t inited = swift_initStackObject();
    uint64_t v4 = inited;
    *(_OWORD *)(inited + 16) = xmmword_24FA76AF0;
    unint64_t v5 = 0xD000000000000010;
    unsigned int v6 = "errorDescription";
    goto LABEL_5;
  }
  if (*((unsigned char *)v0 + 16) == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A49B68);
    uint64_t inited = swift_initStackObject();
    uint64_t v4 = inited;
    *(_OWORD *)(inited + 16) = xmmword_24FA76AF0;
    unint64_t v5 = 0xD000000000000012;
    unsigned int v6 = "emergencySituation";
LABEL_5:
    *(void *)(inited + 32) = v5;
    *(void *)(inited + 40) = (unint64_t)(v6 - 32) | 0x8000000000000000;
    *(void *)(inited + 72) = MEMORY[0x263F8D310];
    *(void *)(inited + 48) = v2;
    *(void *)(inited + 56) = v1;
    swift_bridgeObjectRetain();
    return sub_24FA61764(v4);
  }
  uint64_t v8 = MEMORY[0x263F8EE78];
  return sub_24FA61764(v8);
}

unint64_t sub_24FA61764(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A49BA8);
  uint64_t v2 = sub_24FA75A28();
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
    sub_24FA63220(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_24FA62788(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    id v11 = (uint64_t *)(v3[6] + 16 * result);
    *id v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_24FA63288(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t static GATError.fromNSError(_:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v4 = objc_msgSend(a1, sel_domain);
  uint64_t v5 = sub_24FA75808();
  uint64_t v7 = v6;

  swift_beginAccess();
  if (v5 == qword_269A49B58 && v7 == off_269A49B60)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v9 = sub_24FA75AA8();
    uint64_t result = swift_bridgeObjectRelease();
    if ((v9 & 1) == 0) {
      goto LABEL_27;
    }
  }
  uint64_t result = (uint64_t)objc_msgSend(a1, sel_code);
  switch(result)
  {
    case 2:
      *(void *)a2 = 0;
      *(void *)(a2 + 8) = 0;
      char v15 = 2;
      break;
    case 1:
      id v16 = objc_msgSend(a1, sel_userInfo);
      uint64_t v17 = sub_24FA757C8();

      if (*(void *)(v17 + 16) && (unint64_t v18 = sub_24FA62788(0xD000000000000012, 0x800000024FA77AE0), (v19 & 1) != 0))
      {
        sub_24FA614EC(*(void *)(v17 + 56) + 32 * v18, (uint64_t)&v22);
      }
      else
      {
        long long v22 = 0u;
        long long v23 = 0u;
      }
      swift_bridgeObjectRelease();
      if (!*((void *)&v23 + 1))
      {
LABEL_26:
        uint64_t result = sub_24FA62800((uint64_t)&v22);
        goto LABEL_27;
      }
      uint64_t result = swift_dynamicCast();
      if ((result & 1) == 0)
      {
LABEL_27:
        *(void *)a2 = 0;
        *(void *)(a2 + 8) = 0;
        char v15 = -1;
        break;
      }
      *(void *)a2 = v20;
      *(void *)(a2 + 8) = v21;
      char v15 = 1;
      break;
    case 0:
      id v11 = objc_msgSend(a1, sel_userInfo);
      uint64_t v12 = sub_24FA757C8();

      if (*(void *)(v12 + 16) && (unint64_t v13 = sub_24FA62788(0xD000000000000010, 0x800000024FA77B00), (v14 & 1) != 0))
      {
        sub_24FA614EC(*(void *)(v12 + 56) + 32 * v13, (uint64_t)&v22);
      }
      else
      {
        long long v22 = 0u;
        long long v23 = 0u;
      }
      swift_bridgeObjectRelease();
      if (*((void *)&v23 + 1))
      {
        uint64_t result = swift_dynamicCast();
        if (result)
        {
          *(void *)a2 = v20;
          *(void *)(a2 + 8) = v21;
          *(unsigned char *)(a2 + 16) = 0;
          return result;
        }
        goto LABEL_27;
      }
      goto LABEL_26;
    default:
      goto LABEL_27;
  }
  *(unsigned char *)(a2 + 16) = v15;
  return result;
}

uint64_t sub_24FA61B38()
{
  swift_beginAccess();
  uint64_t v0 = qword_269A49B58;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_24FA61B8C()
{
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_24FA61B9C(uint64_t a1)
{
  unint64_t v2 = sub_24FA631CC();
  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t sub_24FA61BD8(uint64_t a1)
{
  unint64_t v2 = sub_24FA631CC();
  return MEMORY[0x270EF2668](a1, v2);
}

uint64_t sub_24FA61C1C()
{
  return sub_24FA61DF4(&OBJC_IVAR____TtC25GenerativeAssistantCommon35CustomErrorWithLocalizedDescription_errorDomain);
}

uint64_t sub_24FA61C28(uint64_t a1, uint64_t a2)
{
  return sub_24FA61E54(a1, a2, &OBJC_IVAR____TtC25GenerativeAssistantCommon35CustomErrorWithLocalizedDescription_errorDomain);
}

uint64_t (*sub_24FA61C34())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_24FA61C90()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC25GenerativeAssistantCommon35CustomErrorWithLocalizedDescription_errorCode;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_24FA61CD8(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC25GenerativeAssistantCommon35CustomErrorWithLocalizedDescription_errorCode);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_24FA61D24())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_24FA61D80(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v7 = (void *)(*a2 + *a5);
  swift_beginAccess();
  *uint64_t v7 = v6;
  v7[1] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24FA61DE8()
{
  return sub_24FA61DF4(&OBJC_IVAR____TtC25GenerativeAssistantCommon35CustomErrorWithLocalizedDescription_errorDescription);
}

uint64_t sub_24FA61DF4(void *a1)
{
  unint64_t v2 = (uint64_t *)(v1 + *a1);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t sub_24FA61E48(uint64_t a1, uint64_t a2)
{
  return sub_24FA61E54(a1, a2, &OBJC_IVAR____TtC25GenerativeAssistantCommon35CustomErrorWithLocalizedDescription_errorDescription);
}

uint64_t sub_24FA61E54(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = (void *)(v3 + *a3);
  swift_beginAccess();
  *uint64_t v6 = a1;
  v6[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24FA61EB0())()
{
  return j__swift_endAccess;
}

id CustomErrorWithLocalizedDescription.__allocating_init(domain:code:errorDescription:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v11 = objc_allocWithZone(v5);
  return CustomErrorWithLocalizedDescription.init(domain:code:errorDescription:)(a1, a2, a3, a4, a5);
}

id CustomErrorWithLocalizedDescription.init(domain:code:errorDescription:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char v9 = &v5[OBJC_IVAR____TtC25GenerativeAssistantCommon35CustomErrorWithLocalizedDescription_errorDomain];
  *(void *)char v9 = a1;
  *((void *)v9 + 1) = a2;
  *(void *)&v5[OBJC_IVAR____TtC25GenerativeAssistantCommon35CustomErrorWithLocalizedDescription_errorCode] = a3;
  char v10 = &v5[OBJC_IVAR____TtC25GenerativeAssistantCommon35CustomErrorWithLocalizedDescription_errorDescription];
  *(void *)char v10 = a4;
  *((void *)v10 + 1) = a5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v11 = (void *)sub_24FA757F8();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A49B68);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24FA76AF0;
  *(void *)(inited + 32) = sub_24FA75808();
  *(void *)(inited + 40) = v13;
  *(void *)(inited + 72) = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = a4;
  *(void *)(inited + 56) = a5;
  sub_24FA61764(inited);
  char v14 = (void *)sub_24FA757B8();
  swift_bridgeObjectRelease();
  v17.receiver = v5;
  v17.super_class = (Class)type metadata accessor for CustomErrorWithLocalizedDescription();
  id v15 = objc_msgSendSuper2(&v17, sel_initWithDomain_code_userInfo_, v11, a3, v14);

  return v15;
}

id CustomErrorWithLocalizedDescription.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id CustomErrorWithLocalizedDescription.init(coder:)(void *a1)
{
  id v3 = v1;
  id v4 = (void *)sub_24FA757F8();
  id v5 = objc_msgSend(a1, sel_decodeObjectForKey_, v4);

  if (v5)
  {
    sub_24FA75988();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
  }
  sub_24FA62B20((uint64_t)&v21, (uint64_t)v23);
  if (v24)
  {
    if (swift_dynamicCast())
    {
      uint64_t v7 = v18;
      unint64_t v6 = v19;
      goto LABEL_9;
    }
  }
  else
  {
    sub_24FA62800((uint64_t)v23);
  }
  unint64_t v6 = 0xE700000000000000;
  uint64_t v7 = 0x6E776F6E6B6E55;
LABEL_9:
  uint64_t v8 = (uint64_t *)&v3[OBJC_IVAR____TtC25GenerativeAssistantCommon35CustomErrorWithLocalizedDescription_errorDomain];
  *uint64_t v8 = v7;
  v8[1] = v6;
  char v9 = (void *)sub_24FA757F8();
  id v10 = objc_msgSend(a1, sel_decodeIntegerForKey_, v9);

  *(void *)&v3[OBJC_IVAR____TtC25GenerativeAssistantCommon35CustomErrorWithLocalizedDescription_errorCode] = v10;
  id v11 = (void *)sub_24FA757F8();
  id v12 = objc_msgSend(a1, sel_decodeObjectForKey_, v11);

  if (v12)
  {
    sub_24FA75988();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
  }
  sub_24FA62B20((uint64_t)&v21, (uint64_t)v23);
  if (!v24)
  {
    sub_24FA62800((uint64_t)v23);
    goto LABEL_16;
  }
  if (!swift_dynamicCast())
  {
LABEL_16:
    unint64_t v13 = 0xE700000000000000;
    uint64_t v14 = 0x6E776F6E6B6E55;
    goto LABEL_17;
  }
  uint64_t v14 = v18;
  unint64_t v13 = v19;
LABEL_17:
  id v15 = (uint64_t *)&v3[OBJC_IVAR____TtC25GenerativeAssistantCommon35CustomErrorWithLocalizedDescription_errorDescription];
  *id v15 = v14;
  v15[1] = v13;

  v20.receiver = v3;
  v20.super_class = (Class)type metadata accessor for CustomErrorWithLocalizedDescription();
  id v16 = objc_msgSendSuper2(&v20, sel_initWithCoder_, a1);

  return v16;
}

uint64_t sub_24FA6237C()
{
  return sub_24FA75518();
}

uint64_t sub_24FA62464()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC25GenerativeAssistantCommon35CustomErrorWithLocalizedDescription_errorDescription);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

id CustomErrorWithLocalizedDescription.__allocating_init(domain:code:userInfo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = v4;
  uint64_t v8 = (void *)sub_24FA757F8();
  swift_bridgeObjectRelease();
  if (a4)
  {
    char v9 = (void *)sub_24FA757B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v9 = 0;
  }
  id v10 = objc_msgSend(objc_allocWithZone(v5), sel_initWithDomain_code_userInfo_, v8, a3, v9);

  return v10;
}

void CustomErrorWithLocalizedDescription.init(domain:code:userInfo:)()
{
}

id CustomErrorWithLocalizedDescription.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CustomErrorWithLocalizedDescription();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24FA6265C()
{
  id v1 = objc_msgSend(*v0, sel_helpAnchor);
  if (!v1) {
    return 0;
  }
  objc_super v2 = v1;
  uint64_t v3 = sub_24FA75808();

  return v3;
}

uint64_t sub_24FA626C8()
{
  uint64_t v1 = *v0 + OBJC_IVAR____TtC25GenerativeAssistantCommon35CustomErrorWithLocalizedDescription_errorCode;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_24FA62718()
{
  return sub_24FA75518();
}

unint64_t sub_24FA62788(uint64_t a1, uint64_t a2)
{
  sub_24FA75AF8();
  sub_24FA75838();
  uint64_t v4 = sub_24FA75B18();
  return sub_24FA62860(a1, a2, v4);
}

uint64_t sub_24FA62800(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A49B70);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24FA62860(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    id v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24FA75AA8() & 1) == 0)
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
      while (!v14 && (sub_24FA75AA8() & 1) == 0);
    }
  }
  return v6;
}

uint64_t _s25GenerativeAssistantCommon8GATErrorO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a1;
  uint64_t v2 = *(void *)(a1 + 8);
  int v4 = *(unsigned __int8 *)(a1 + 16);
  uint64_t v6 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  int v7 = *(unsigned __int8 *)(a2 + 16);
  if (*(unsigned char *)(a1 + 16))
  {
    if (v4 == 1)
    {
      if (v7 == 1)
      {
        if (v3 == v6 && v2 == v5) {
          char v9 = 1;
        }
        else {
          char v9 = sub_24FA75AA8();
        }
        sub_24FA62D8C(v6, v5, 1u);
        sub_24FA62D8C(v3, v2, 1u);
        sub_24FA62DB4(v3, v2, 1u);
        uint64_t v12 = v6;
        uint64_t v13 = v5;
        unsigned __int8 v14 = 1;
LABEL_25:
        sub_24FA62DB4(v12, v13, v14);
        return v9 & 1;
      }
    }
    else if (v7 == 2 && (v5 | v6) == 0)
    {
      sub_24FA62DB4(*(void *)a1, v2, 2u);
      sub_24FA62DB4(0, 0, 2u);
      char v9 = 1;
      return v9 & 1;
    }
  }
  else if (!*(unsigned char *)(a2 + 16))
  {
    if (v3 == v6 && v2 == v5) {
      char v9 = 1;
    }
    else {
      char v9 = sub_24FA75AA8();
    }
    sub_24FA62D8C(v6, v5, 0);
    sub_24FA62D8C(v3, v2, 0);
    sub_24FA62DB4(v3, v2, 0);
    uint64_t v12 = v6;
    uint64_t v13 = v5;
    unsigned __int8 v14 = 0;
    goto LABEL_25;
  }
  sub_24FA62D8C(*(void *)a2, *(void *)(a2 + 8), v7);
  sub_24FA62D8C(v3, v2, v4);
  sub_24FA62DB4(v3, v2, v4);
  sub_24FA62DB4(v6, v5, v7);
  char v9 = 0;
  return v9 & 1;
}

uint64_t type metadata accessor for CustomErrorWithLocalizedDescription()
{
  return self;
}

uint64_t sub_24FA62B20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A49B70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_24FA62B8C()
{
  unint64_t result = qword_269A49B90;
  if (!qword_269A49B90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A49B90);
  }
  return result;
}

unint64_t sub_24FA62BE4()
{
  unint64_t result = qword_269A49B98;
  if (!qword_269A49B98)
  {
    type metadata accessor for CustomErrorWithLocalizedDescription();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A49B98);
  }
  return result;
}

uint64_t sub_24FA62C38@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC25GenerativeAssistantCommon35CustomErrorWithLocalizedDescription_errorDomain, a2);
}

uint64_t sub_24FA62C44(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_24FA61D80(a1, a2, a3, a4, &OBJC_IVAR____TtC25GenerativeAssistantCommon35CustomErrorWithLocalizedDescription_errorDomain);
}

uint64_t sub_24FA62C64@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC25GenerativeAssistantCommon35CustomErrorWithLocalizedDescription_errorCode);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_24FA62CB8(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a2 + OBJC_IVAR____TtC25GenerativeAssistantCommon35CustomErrorWithLocalizedDescription_errorCode);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = v2;
  return result;
}

uint64_t sub_24FA62D08@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC25GenerativeAssistantCommon35CustomErrorWithLocalizedDescription_errorDescription, a2);
}

uint64_t keypath_getTm@<X0>(void *a1@<X0>, void *a2@<X3>, void *a3@<X8>)
{
  uint64_t v4 = (void *)(*a1 + *a2);
  swift_beginAccess();
  uint64_t v5 = v4[1];
  *a3 = *v4;
  a3[1] = v5;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24FA62D68(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_24FA61D80(a1, a2, a3, a4, &OBJC_IVAR____TtC25GenerativeAssistantCommon35CustomErrorWithLocalizedDescription_errorDescription);
}

uint64_t sub_24FA62D8C(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 1u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for GATError(uint64_t a1)
{
  return sub_24FA62DB4(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_24FA62DB4(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 1u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s25GenerativeAssistantCommon8GATErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_24FA62D8C(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for GATError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_24FA62D8C(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_24FA62DB4(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for GATError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_24FA62DB4(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for GATError(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for GATError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 254;
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

uint64_t sub_24FA62F58(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_24FA62F70(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for GATError()
{
  return &type metadata for GATError;
}

uint64_t method lookup function for CustomErrorWithLocalizedDescription(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CustomErrorWithLocalizedDescription);
}

uint64_t dispatch thunk of CustomErrorWithLocalizedDescription.errorDomain.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of CustomErrorWithLocalizedDescription.errorDomain.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of CustomErrorWithLocalizedDescription.errorDomain.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of CustomErrorWithLocalizedDescription.errorCode.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of CustomErrorWithLocalizedDescription.errorCode.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of CustomErrorWithLocalizedDescription.errorCode.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of CustomErrorWithLocalizedDescription.errorDescription.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of CustomErrorWithLocalizedDescription.errorDescription.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of CustomErrorWithLocalizedDescription.errorDescription.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of CustomErrorWithLocalizedDescription.__allocating_init(domain:code:errorDescription:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of CustomErrorWithLocalizedDescription.localizedStringResource.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

unint64_t sub_24FA631CC()
{
  unint64_t result = qword_269A49BA0;
  if (!qword_269A49BA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A49BA0);
  }
  return result;
}

uint64_t sub_24FA63220(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A49BB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_24FA63288(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t GenerativeAssistantFeatureFlagManager.isDocumentSupportWithContextRetrievalEnabled.getter()
{
  return sub_24FA63350(0);
}

unint64_t sub_24FA632AC()
{
  unint64_t result = qword_269A49BB8;
  if (!qword_269A49BB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A49BB8);
  }
  return result;
}

uint64_t GenerativeAssistantFeatureFlagManager.isImageSupportWithContextRetrievalEnabled.getter()
{
  return sub_24FA63350(2);
}

uint64_t GenerativeAssistantFeatureFlagManager.isEntitySupportWithContextRetrievalEnabled.getter()
{
  return sub_24FA63350(1);
}

uint64_t GenerativeAssistantFeatureFlagManager.isSnapshotSupportWithContextRetrievalEnabled.getter()
{
  return sub_24FA63350(3);
}

uint64_t GenerativeAssistantFeatureFlagManager.isMontaraEnabled.getter()
{
  return sub_24FA63350(4);
}

uint64_t GenerativeAssistantFeatureFlagManager.isLowConfidenceKnowledgeSearchEnabled.getter()
{
  return sub_24FA63350(5);
}

uint64_t GenerativeAssistantFeatureFlagManager.isLowConfidenceKnowledgeConfirmationEnabled.getter()
{
  return sub_24FA63350(6);
}

uint64_t GenerativeAssistantFeatureFlagManager.isPromptOverrideEnabled.getter()
{
  return sub_24FA63350(7);
}

uint64_t GenerativeAssistantFeatureFlagManager.isMailPDFConversionEnabled.getter()
{
  return sub_24FA63350(8);
}

uint64_t GenerativeAssistantFeatureFlagManager.isBrowserPDFConversionEnabled.getter()
{
  return sub_24FA63350(9);
}

uint64_t GenerativeAssistantFeatureFlagManager.isManageSubscriptionEnabled.getter()
{
  return sub_24FA63350(10);
}

uint64_t sub_24FA63350(char a1)
{
  uint64_t v5 = &type metadata for GenerativeAssistantFeatureFlags;
  unint64_t v6 = sub_24FA632AC();
  v4[0] = a1;
  char v2 = sub_24FA755B8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  return v2 & 1;
}

uint64_t GenerativeAssistantFeatureFlagManager.description.getter()
{
  v2[0] = 4;
  v2[1] = 0xE000000000000000;
  sub_24FA75998();
  uint64_t v5 = 0;
  unint64_t v6 = 0xE000000000000000;
  sub_24FA759B8();
  sub_24FA75848();
  swift_bridgeObjectRelease();
  sub_24FA75848();
  unsigned int v3 = &type metadata for GenerativeAssistantFeatureFlags;
  unint64_t v0 = sub_24FA632AC();
  unint64_t v4 = v0;
  sub_24FA755B8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  sub_24FA75848();
  swift_bridgeObjectRelease();
  sub_24FA75848();
  sub_24FA759B8();
  sub_24FA75848();
  swift_bridgeObjectRelease();
  sub_24FA75848();
  unsigned int v3 = &type metadata for GenerativeAssistantFeatureFlags;
  unint64_t v4 = v0;
  LOBYTE(v2[0]) = 0;
  sub_24FA755B8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  sub_24FA75848();
  swift_bridgeObjectRelease();
  sub_24FA75848();
  sub_24FA759B8();
  sub_24FA75848();
  swift_bridgeObjectRelease();
  sub_24FA75848();
  unsigned int v3 = &type metadata for GenerativeAssistantFeatureFlags;
  unint64_t v4 = v0;
  LOBYTE(v2[0]) = 2;
  sub_24FA755B8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  sub_24FA75848();
  swift_bridgeObjectRelease();
  sub_24FA75848();
  sub_24FA759B8();
  sub_24FA75848();
  swift_bridgeObjectRelease();
  sub_24FA75848();
  unsigned int v3 = &type metadata for GenerativeAssistantFeatureFlags;
  unint64_t v4 = v0;
  LOBYTE(v2[0]) = 1;
  sub_24FA755B8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  sub_24FA75848();
  swift_bridgeObjectRelease();
  sub_24FA75848();
  sub_24FA759B8();
  sub_24FA75848();
  swift_bridgeObjectRelease();
  sub_24FA75848();
  unsigned int v3 = &type metadata for GenerativeAssistantFeatureFlags;
  unint64_t v4 = v0;
  LOBYTE(v2[0]) = 3;
  sub_24FA755B8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  sub_24FA75848();
  swift_bridgeObjectRelease();
  sub_24FA75848();
  sub_24FA759B8();
  sub_24FA75848();
  swift_bridgeObjectRelease();
  sub_24FA75848();
  unsigned int v3 = &type metadata for GenerativeAssistantFeatureFlags;
  unint64_t v4 = v0;
  LOBYTE(v2[0]) = 5;
  sub_24FA755B8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  sub_24FA75848();
  swift_bridgeObjectRelease();
  sub_24FA75848();
  sub_24FA759B8();
  sub_24FA75848();
  swift_bridgeObjectRelease();
  sub_24FA75848();
  unsigned int v3 = &type metadata for GenerativeAssistantFeatureFlags;
  unint64_t v4 = v0;
  LOBYTE(v2[0]) = 6;
  sub_24FA755B8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  sub_24FA75848();
  swift_bridgeObjectRelease();
  sub_24FA75848();
  sub_24FA759B8();
  sub_24FA75848();
  swift_bridgeObjectRelease();
  sub_24FA75848();
  unsigned int v3 = &type metadata for GenerativeAssistantFeatureFlags;
  unint64_t v4 = v0;
  LOBYTE(v2[0]) = 7;
  sub_24FA755B8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  sub_24FA75848();
  swift_bridgeObjectRelease();
  sub_24FA75848();
  sub_24FA759B8();
  sub_24FA75848();
  swift_bridgeObjectRelease();
  sub_24FA75848();
  unsigned int v3 = &type metadata for GenerativeAssistantFeatureFlags;
  unint64_t v4 = v0;
  LOBYTE(v2[0]) = 8;
  sub_24FA755B8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  sub_24FA75848();
  swift_bridgeObjectRelease();
  sub_24FA75848();
  sub_24FA759B8();
  sub_24FA75848();
  swift_bridgeObjectRelease();
  sub_24FA75848();
  unsigned int v3 = &type metadata for GenerativeAssistantFeatureFlags;
  unint64_t v4 = v0;
  LOBYTE(v2[0]) = 9;
  sub_24FA755B8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  sub_24FA75848();
  swift_bridgeObjectRelease();
  sub_24FA75848();
  sub_24FA759B8();
  sub_24FA75848();
  swift_bridgeObjectRelease();
  sub_24FA75848();
  unsigned int v3 = &type metadata for GenerativeAssistantFeatureFlags;
  unint64_t v4 = v0;
  LOBYTE(v2[0]) = 10;
  sub_24FA755B8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  sub_24FA75848();
  swift_bridgeObjectRelease();
  return v5;
}

const char *sub_24FA63ADC(char a1)
{
  unint64_t result = "ContextRetrievalDocuments";
  switch(a1)
  {
    case 1:
      unint64_t result = "ContextRetrievalEntities";
      break;
    case 2:
      unint64_t result = "ContextRetrievalImages";
      break;
    case 3:
      unint64_t result = "ContextRetrievalSnapshots";
      break;
    case 4:
      unint64_t result = "MontaraTools";
      break;
    case 5:
      unint64_t result = "LowConfidenceKnowledgeSearch";
      break;
    case 6:
      unint64_t result = "LowConfidenceKnowledgeConfirmation";
      break;
    case 7:
      unint64_t result = "PromptOverride";
      break;
    case 8:
      unint64_t result = "MailPDFConversion";
      break;
    case 9:
      unint64_t result = "BrowserPDFConversion";
      break;
    case 10:
      unint64_t result = "ManageSubscription";
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24FA63C04(uint64_t a1, uint64_t a2)
{
  return sub_24FA63C5C(a1, a2, 4);
}

uint64_t sub_24FA63C0C(uint64_t a1, uint64_t a2)
{
  return sub_24FA63C5C(a1, a2, 5);
}

uint64_t sub_24FA63C14(uint64_t a1, uint64_t a2)
{
  return sub_24FA63C5C(a1, a2, 6);
}

uint64_t sub_24FA63C1C(uint64_t a1, uint64_t a2)
{
  return sub_24FA63C5C(a1, a2, 0);
}

uint64_t sub_24FA63C24(uint64_t a1, uint64_t a2)
{
  return sub_24FA63C5C(a1, a2, 2);
}

uint64_t sub_24FA63C2C(uint64_t a1, uint64_t a2)
{
  return sub_24FA63C5C(a1, a2, 1);
}

uint64_t sub_24FA63C34(uint64_t a1, uint64_t a2)
{
  return sub_24FA63C5C(a1, a2, 3);
}

uint64_t sub_24FA63C3C(uint64_t a1, uint64_t a2)
{
  return sub_24FA63C5C(a1, a2, 7);
}

uint64_t sub_24FA63C44(uint64_t a1, uint64_t a2)
{
  return sub_24FA63C5C(a1, a2, 8);
}

uint64_t sub_24FA63C4C(uint64_t a1, uint64_t a2)
{
  return sub_24FA63C5C(a1, a2, 9);
}

uint64_t sub_24FA63C54(uint64_t a1, uint64_t a2)
{
  return sub_24FA63C5C(a1, a2, 10);
}

uint64_t sub_24FA63C5C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v7 = &type metadata for GenerativeAssistantFeatureFlags;
  unint64_t v8 = sub_24FA632AC();
  v6[0] = a3;
  char v4 = sub_24FA755B8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return v4 & 1;
}

uint64_t sub_24FA63CB4()
{
  return GenerativeAssistantFeatureFlagManager.description.getter();
}

uint64_t dispatch thunk of GenerativeAssistantFeatureFlagManaging.isMontaraEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of GenerativeAssistantFeatureFlagManaging.isLowConfidenceKnowledgeSearchEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of GenerativeAssistantFeatureFlagManaging.isLowConfidenceKnowledgeConfirmationEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of GenerativeAssistantFeatureFlagManaging.isDocumentSupportWithContextRetrievalEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of GenerativeAssistantFeatureFlagManaging.isImageSupportWithContextRetrievalEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of GenerativeAssistantFeatureFlagManaging.isEntitySupportWithContextRetrievalEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of GenerativeAssistantFeatureFlagManaging.isSnapshotSupportWithContextRetrievalEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of GenerativeAssistantFeatureFlagManaging.isPromptOverrideEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of GenerativeAssistantFeatureFlagManaging.isMailPDFConversionEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of GenerativeAssistantFeatureFlagManaging.isBrowserPDFConversionEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of GenerativeAssistantFeatureFlagManaging.isManageSubscriptionEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t dispatch thunk of GenerativeAssistantFeatureFlagManaging.description.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 96))();
}

ValueMetadata *type metadata accessor for GenerativeAssistantFeatureFlagManager()
{
  return &type metadata for GenerativeAssistantFeatureFlagManager;
}

uint64_t getEnumTagSinglePayload for GenerativeAssistantFeatureFlags(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF6) {
    goto LABEL_17;
  }
  if (a2 + 10 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 10) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 10;
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
      return (*a1 | (v4 << 8)) - 10;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 10;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xB;
  int v8 = v6 - 11;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for GenerativeAssistantFeatureFlags(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 10 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 10) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF6) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF5)
  {
    unsigned int v6 = ((a2 - 246) >> 8) + 1;
    *unint64_t result = a2 + 10;
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
        JUMPOUT(0x24FA63F28);
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
          *unint64_t result = a2 + 10;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GenerativeAssistantFeatureFlags()
{
  return &type metadata for GenerativeAssistantFeatureFlags;
}

unint64_t sub_24FA63F64()
{
  unint64_t result = qword_269A49BC0;
  if (!qword_269A49BC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A49BC0);
  }
  return result;
}

const char *sub_24FA63FB8()
{
  return "GenerativeAssistantTools";
}

const char *sub_24FA63FCC()
{
  return sub_24FA63ADC(*v0);
}

GenerativeAssistantCommon::GenerativeAssistantUseCase_optional __swiftcall GenerativeAssistantUseCase.init(rawValue:)(Swift::String rawValue)
{
  int v2 = v1;
  unint64_t v3 = sub_24FA75A48();
  result.value = swift_bridgeObjectRelease();
  char v5 = 5;
  if (v3 < 5) {
    char v5 = v3;
  }
  *int v2 = v5;
  return result;
}

unint64_t GenerativeAssistantUseCase.rawValue.getter()
{
  unint64_t result = 0xD00000000000001FLL;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 2:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 3:
      unint64_t result = 0xD000000000000025;
      break;
    case 4:
      unint64_t result = 0xD00000000000002CLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24FA640F0(char *a1, char *a2)
{
  return sub_24FA6F47C(*a1, *a2);
}

unint64_t sub_24FA64100()
{
  unint64_t result = qword_269A49BC8;
  if (!qword_269A49BC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A49BC8);
  }
  return result;
}

uint64_t sub_24FA64154()
{
  return sub_24FA6415C();
}

uint64_t sub_24FA6415C()
{
  return sub_24FA75B18();
}

uint64_t sub_24FA64258()
{
  return sub_24FA6F6A4();
}

uint64_t sub_24FA64260()
{
  return sub_24FA6F840();
}

GenerativeAssistantCommon::GenerativeAssistantUseCase_optional sub_24FA64268(Swift::String *a1)
{
  return GenerativeAssistantUseCase.init(rawValue:)(*a1);
}

unint64_t sub_24FA64274@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = GenerativeAssistantUseCase.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for GenerativeAssistantUseCase(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for GenerativeAssistantUseCase(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x24FA643F8);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GenerativeAssistantUseCase()
{
  return &type metadata for GenerativeAssistantUseCase;
}

uint64_t sub_24FA64430()
{
  type metadata accessor for SELFUtils();
  swift_allocObject();
  uint64_t result = sub_24FA64F24();
  qword_269A49BD0 = result;
  return result;
}

uint64_t static SELFUtils.shared.getter()
{
  if (qword_269A49920 != -1) {
    swift_once();
  }
  return swift_retain();
}

__n128 sub_24FA644CC@<Q0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 64);
  char v5 = *(unsigned char *)(v3 + 72);
  char v6 = *(unsigned char *)(v3 + 73);
  long long v7 = *(_OWORD *)(v3 + 32);
  *(_OWORD *)a2 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)(a2 + 16) = v7;
  __n128 result = *(__n128 *)(v3 + 48);
  *(__n128 *)(a2 + 32) = result;
  *(void *)(a2 + 48) = v4;
  *(unsigned char *)(a2 + 56) = v5;
  *(unsigned char *)(a2 + 57) = v6;
  return result;
}

__n128 sub_24FA64534(long long *a1, uint64_t *a2)
{
  long long v8 = a1[1];
  long long v9 = *a1;
  __n128 v7 = (__n128)a1[2];
  uint64_t v2 = *((void *)a1 + 6);
  char v3 = *((unsigned char *)a1 + 56);
  char v4 = *((unsigned char *)a1 + 57);
  uint64_t v5 = *a2;
  swift_beginAccess();
  *(_OWORD *)(v5 + 16) = v9;
  *(_OWORD *)(v5 + 32) = v8;
  __n128 result = v7;
  *(__n128 *)(v5 + 48) = v7;
  *(void *)(v5 + 64) = v2;
  *(unsigned char *)(v5 + 72) = v3;
  *(unsigned char *)(v5 + 73) = v4;
  return result;
}

__n128 sub_24FA645B8@<Q0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = *(void *)(v1 + 64);
  char v4 = *(unsigned char *)(v1 + 72);
  char v5 = *(unsigned char *)(v1 + 73);
  long long v6 = *(_OWORD *)(v1 + 32);
  *(_OWORD *)a1 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(a1 + 16) = v6;
  __n128 result = *(__n128 *)(v1 + 48);
  *(__n128 *)(a1 + 32) = result;
  *(void *)(a1 + 48) = v3;
  *(unsigned char *)(a1 + 56) = v4;
  *(unsigned char *)(a1 + 57) = v5;
  return result;
}

__n128 sub_24FA6461C(long long *a1)
{
  long long v7 = a1[1];
  long long v8 = *a1;
  __n128 v6 = (__n128)a1[2];
  uint64_t v2 = *((void *)a1 + 6);
  char v3 = *((unsigned char *)a1 + 56);
  char v4 = *((unsigned char *)a1 + 57);
  swift_beginAccess();
  *(_OWORD *)(v1 + 16) = v8;
  *(_OWORD *)(v1 + 32) = v7;
  __n128 result = v6;
  *(__n128 *)(v1 + 48) = v6;
  *(void *)(v1 + 64) = v2;
  *(unsigned char *)(v1 + 72) = v3;
  *(unsigned char *)(v1 + 73) = v4;
  return result;
}

uint64_t (*sub_24FA646A0())()
{
  return j_j__swift_endAccess;
}

void sub_24FA646F4(void **a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  char v4 = *(void **)(v3 + 80);
  *(void *)(v3 + 80) = v2;
  id v5 = v2;
}

void *sub_24FA6474C()
{
  swift_beginAccess();
  uint64_t v1 = *(void **)(v0 + 80);
  id v2 = v1;
  return v1;
}

void sub_24FA64790(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void **)(v1 + 80);
  *(void *)(v1 + 80) = a1;
}

uint64_t (*sub_24FA647D8())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_24FA6482C(uint64_t a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A49BD8);
  MEMORY[0x270FA5388]();
  id v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24FA64940(a1, (uint64_t)v5);
  uint64_t v6 = *a2 + OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_gatID;
  swift_beginAccess();
  sub_24FA64A04((uint64_t)v5, v6);
  return swift_endAccess();
}

uint64_t sub_24FA648EC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_gatID;
  swift_beginAccess();
  return sub_24FA64940(v3, a1);
}

uint64_t sub_24FA64940(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A49BD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24FA649A8(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_gatID;
  swift_beginAccess();
  sub_24FA64A04(a1, v3);
  return swift_endAccess();
}

uint64_t sub_24FA64A04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A49BD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*sub_24FA64A6C())()
{
  return j_j__swift_endAccess;
}

unint64_t sub_24FA64AC8()
{
  return sub_24FA64B48(&OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_gatUsecase);
}

uint64_t sub_24FA64AD4(uint64_t a1)
{
  return sub_24FA64BA8(a1, &OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_gatUsecase);
}

uint64_t (*sub_24FA64AE0())()
{
  return j__swift_endAccess;
}

unint64_t sub_24FA64B3C()
{
  return sub_24FA64B48(&OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_generativeResultCharactersCount);
}

unint64_t sub_24FA64B48(void *a1)
{
  id v2 = (unsigned int *)(v1 + *a1);
  swift_beginAccess();
  return *v2 | ((unint64_t)*((unsigned __int8 *)v2 + 4) << 32);
}

uint64_t sub_24FA64B9C(uint64_t a1)
{
  return sub_24FA64BA8(a1, &OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_generativeResultCharactersCount);
}

uint64_t sub_24FA64BA8(uint64_t a1, void *a2)
{
  uint64_t v4 = v2 + *a2;
  uint64_t result = swift_beginAccess();
  *(_DWORD *)uint64_t v4 = a1;
  *(unsigned char *)(v4 + 4) = BYTE4(a1) & 1;
  return result;
}

uint64_t (*sub_24FA64BF8())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_24FA64C54()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_didRequestFailed);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_24FA64C9C(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_didRequestFailed);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_24FA64CE8())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_24FA64D44()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_didRequestCancelled);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_24FA64D8C(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_didRequestCancelled);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_24FA64DD8())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_24FA64E34()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_didRequestHandOffToTA);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_24FA64E7C(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_didRequestHandOffToTA);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_24FA64EC8())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_24FA64F24()
{
  uint64_t v1 = v0;
  *(_OWORD *)(v0 + 57) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 48) = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  *(unsigned char *)(v0 + 73) = 1;
  *(void *)(v0 + 80) = 0;
  uint64_t v2 = v0 + OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_gatID;
  uint64_t v3 = sub_24FA755A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  uint64_t v4 = v1 + OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_gatUsecase;
  *(_DWORD *)uint64_t v4 = 0;
  *(unsigned char *)(v4 + 4) = 1;
  uint64_t v5 = v1 + OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_generativeResultCharactersCount;
  *(_DWORD *)uint64_t v5 = 0;
  *(unsigned char *)(v5 + 4) = 1;
  *(unsigned char *)(v1 + OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_didRequestFailed) = 0;
  *(unsigned char *)(v1 + OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_didRequestCancelled) = 0;
  *(unsigned char *)(v1 + OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_didRequestHandOffToTA) = 0;
  if (qword_269A49948 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_24FA757A8();
  __swift_project_value_buffer(v6, (uint64_t)qword_269A49C70);
  long long v7 = sub_24FA75788();
  os_log_type_t v8 = sub_24FA758B8();
  if (os_log_type_enabled(v7, v8))
  {
    long long v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)long long v9 = 0;
    _os_log_impl(&dword_24FA58000, v7, v8, "Create the SELFUtils instance", v9, 2u);
    MEMORY[0x25336AD50](v9, -1, -1);
  }

  return v1;
}

void sub_24FA650B8()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A49BD8);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  *(_OWORD *)(v0 + 57) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 48) = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  *(unsigned char *)(v0 + 73) = 1;
  swift_beginAccess();
  uint64_t v4 = *(void **)(v0 + 80);
  *(void *)(v0 + 80) = 0;

  uint64_t v5 = sub_24FA755A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v3, 1, 1, v5);
  uint64_t v6 = v0 + OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_gatID;
  swift_beginAccess();
  sub_24FA64A04((uint64_t)v3, v6);
  swift_endAccess();
  uint64_t v7 = v0 + OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_gatUsecase;
  swift_beginAccess();
  *(_DWORD *)uint64_t v7 = 0;
  *(unsigned char *)(v7 + 4) = 1;
  uint64_t v8 = v0 + OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_generativeResultCharactersCount;
  swift_beginAccess();
  *(_DWORD *)uint64_t v8 = 0;
  *(unsigned char *)(v8 + 4) = 1;
  long long v9 = (unsigned char *)(v0 + OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_didRequestFailed);
  swift_beginAccess();
  unsigned char *v9 = 0;
  id v10 = (unsigned char *)(v0 + OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_didRequestCancelled);
  swift_beginAccess();
  *id v10 = 0;
  BOOL v11 = (unsigned char *)(v0 + OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_didRequestHandOffToTA);
  swift_beginAccess();
  *BOOL v11 = 0;
  if (qword_269A49958 != -1) {
    swift_once();
  }
  sub_24FA73E50();
}

void sub_24FA652E4(void *a1)
{
  uint64_t v2 = sub_24FA757A8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24FA6C814();
  if (v6)
  {
    objc_msgSend(a1, sel_setEventMetadata_, v6);
    if (qword_269A49948 != -1) {
      swift_once();
    }
    uint64_t v7 = __swift_project_value_buffer(v2, (uint64_t)qword_269A49C70);
    (*(void (**)(char *, NSObject *, uint64_t))(v3 + 16))(v5, v7, v2);
    id v8 = a1;
    long long v9 = sub_24FA75788();
    os_log_type_t v10 = sub_24FA758B8();
    if (os_log_type_enabled(v9, v10))
    {
      os_log_t v25 = v7;
      BOOL v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      uint64_t v27 = v24;
      *(_DWORD *)BOOL v11 = 136315138;
      id v12 = objc_msgSend(v8, sel_formattedJsonBody);
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = sub_24FA75808();
        unint64_t v16 = v15;
      }
      else
      {
        unint64_t v16 = 0xE600000000000000;
        uint64_t v14 = 0x3E6E6F736A3CLL;
      }
      uint64_t v26 = sub_24FA602C0(v14, v16, &v27);
      sub_24FA75958();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24FA58000, v9, v10, "emitting wrapper...\n%s", v11, 0xCu);
      uint64_t v20 = v24;
      swift_arrayDestroy();
      MEMORY[0x25336AD50](v20, -1, -1);
      MEMORY[0x25336AD50](v11, -1, -1);

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
    objc_msgSend(objc_msgSend(self, sel_sharedStream), sel_emitMessage_, v8);
    swift_unknownObjectRelease();
    long long v21 = sub_24FA75788();
    os_log_type_t v22 = sub_24FA758B8();
    if (os_log_type_enabled(v21, v22))
    {
      long long v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v23 = 0;
      _os_log_impl(&dword_24FA58000, v21, v22, "SELFUtils: Emitted the top level wrapper", v23, 2u);
      MEMORY[0x25336AD50](v23, -1, -1);
    }
  }
  else
  {
    if (qword_269A49948 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v2, (uint64_t)qword_269A49C70);
    os_log_t v25 = (os_log_t)sub_24FA75788();
    os_log_type_t v17 = sub_24FA758C8();
    if (os_log_type_enabled(v25, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_24FA58000, v25, v17, "Failed to add event metadata.", v18, 2u);
      MEMORY[0x25336AD50](v18, -1, -1);
    }
    os_log_t v19 = v25;
  }
}

id sub_24FA65740()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DD88]), sel_init);
  if (qword_269A49958 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_269A49C88 + 32;
  swift_beginAccess();
  sub_24FA6C730(v2, (uint64_t)v31);
  sub_24FA6C730((uint64_t)v31, (uint64_t)v32);
  if (sub_24FA6C798((uint64_t)v32) != 1)
  {
    if (v34 == 1)
    {
      sub_24FA6C730((uint64_t)v31, (uint64_t)&v20);
      if ((v23 & 1) == 0) {
        goto LABEL_6;
      }
    }
    else
    {
      objc_msgSend(v1, sel_setStartSiriSessionDurationInSeconds_, v33);
      sub_24FA6C730((uint64_t)v31, (uint64_t)&v20);
      if (v23 != 1)
      {
LABEL_6:
        objc_msgSend(v1, sel_setGenerativeRequestDurationInSeconds_, v22);
        sub_24FA6C730((uint64_t)v31, (uint64_t)&v20);
        if (v25 != 1) {
          goto LABEL_7;
        }
        goto LABEL_13;
      }
    }
    sub_24FA6C730((uint64_t)v31, (uint64_t)&v20);
    if ((v25 & 1) == 0)
    {
LABEL_7:
      objc_msgSend(v1, sel_setLoadScreenContentDurationInSeconds_, v24);
      sub_24FA6C730((uint64_t)v31, (uint64_t)&v20);
      if (v27 != 1) {
        goto LABEL_8;
      }
      goto LABEL_14;
    }
LABEL_13:
    sub_24FA6C730((uint64_t)v31, (uint64_t)&v20);
    if ((v27 & 1) == 0)
    {
LABEL_8:
      objc_msgSend(v1, sel_setImageResizingDurationInSeconds_, v26);
      sub_24FA6C730((uint64_t)v31, (uint64_t)&v20);
      if (v21 != 1) {
        goto LABEL_9;
      }
      goto LABEL_15;
    }
LABEL_14:
    sub_24FA6C730((uint64_t)v31, (uint64_t)&v20);
    if ((v21 & 1) == 0)
    {
LABEL_9:
      objc_msgSend(v1, sel_setRegisterMediaDurationInSeconds_, v20);
      sub_24FA6C730((uint64_t)v31, (uint64_t)&v20);
      if (v29 == 1)
      {
LABEL_17:
        sub_24FA6C730((uint64_t)v31, (uint64_t)&v20);
        if ((v21 & 1) == 0) {
          objc_msgSend(v1, sel_setRegisterMediaRateKBsPerSecond_, v20);
        }
        goto LABEL_19;
      }
LABEL_16:
      objc_msgSend(v1, sel_setLoadScreenContentRateKBsPerSecond_, v28);
      goto LABEL_17;
    }
LABEL_15:
    sub_24FA6C730((uint64_t)v31, (uint64_t)&v20);
    if (v29) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_19:
  uint64_t v3 = (unsigned int *)(v0 + OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_generativeResultCharactersCount);
  swift_beginAccess();
  if ((v3[1] & 1) == 0) {
    objc_msgSend(v1, sel_setGenerativeResultCharactersCount_, *v3);
  }
  swift_beginAccess();
  if ((*(unsigned char *)(v0 + 73) & 1) == 0)
  {
    double v4 = *(double *)(v0 + 24);
    uint64_t v5 = *(void *)(v0 + 32);
    sub_24FA6C730((uint64_t)v31, (uint64_t)&v20);
    if (sub_24FA6C798((uint64_t)&v20) != 1 && (v27 & 1) == 0 && (v5 & 1) == 0) {
      objc_msgSend(v1, sel_setImageResizingRateKBsPerSecond_, v4 / v26);
    }
  }
  if (qword_269A49948 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_24FA757A8();
  __swift_project_value_buffer(v6, (uint64_t)qword_269A49C70);
  id v7 = v1;
  id v8 = sub_24FA75788();
  os_log_type_t v9 = sub_24FA758B8();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    double v20 = *(double *)&v11;
    *(_DWORD *)uint64_t v10 = 136315394;
    uint64_t v30 = (uint64_t)v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A49BE8);
    uint64_t v12 = sub_24FA75938();
    uint64_t v30 = sub_24FA602C0(v12, v13, (uint64_t *)&v20);
    sub_24FA75958();

    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2080;
    if (v7 && (id v14 = objc_msgSend(v7, sel_formattedJsonBody)) != 0)
    {
      unint64_t v15 = v14;
      uint64_t v16 = sub_24FA75808();
      unint64_t v18 = v17;
    }
    else
    {
      uint64_t v16 = 0;
      unint64_t v18 = 0xE000000000000000;
    }
    uint64_t v30 = sub_24FA602C0(v16, v18, (uint64_t *)&v20);
    sub_24FA75958();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24FA58000, v8, v9, "Created GATSchemaGATPnRMetrics with values: %s %s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25336AD50](v11, -1, -1);
    MEMORY[0x25336AD50](v10, -1, -1);
  }
  else
  {
  }
  sub_24FA73E50();
  if (v7) {
    return v7;
  }
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DD88]), sel_init);
  id v7 = result;
  if (result) {
    return v7;
  }
  __break(1u);
  return result;
}

void sub_24FA65C80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_24FA755A8();
  os_log_t v66 = *(os_log_t *)(v5 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  char v65 = (char *)&v59 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  os_log_type_t v9 = (char *)&v59 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A49BD8);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  unint64_t v13 = (char *)&v59 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  unint64_t v15 = (char *)&v59 - v14;
  uint64_t v16 = &off_26533F000;
  id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DDD8]), sel_init);
  if (v17)
  {
    unint64_t v18 = v17;
    objc_msgSend(v17, sel_setAppIntentName_, a3);
    if (a2)
    {
      sub_24FA75578();
      os_log_t v19 = v66;
    }
    else
    {
      os_log_t v19 = v66;
      ((void (*)(char *, uint64_t, uint64_t, uint64_t))v66[7].isa)(v15, 1, 1, v5);
    }
    sub_24FA64940((uint64_t)v15, (uint64_t)v13);
    if (((unsigned int (*)(char *, uint64_t, uint64_t))v19[6].isa)(v13, 1, v5) == 1)
    {
      sub_24FA6C7B4((uint64_t)v15);
      sub_24FA75598();
      id v24 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
      char v25 = (void *)sub_24FA75588();
      id v26 = objc_msgSend(v24, sel_initWithNSUUID_, v25);

      isa = (void (*)(char *, uint64_t))v19[1].isa;
      isa(v9, v5);
    }
    else
    {
      ((void (*)(char *, char *, uint64_t))v19[4].isa)(v9, v13, v5);
      id v27 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
      double v28 = (void *)sub_24FA75588();
      id v26 = objc_msgSend(v27, sel_initWithNSUUID_, v28);

      isa = (void (*)(char *, uint64_t))v19[1].isa;
      isa(v9, v5);
      sub_24FA6C7B4((uint64_t)v15);
    }
    objc_msgSend(v18, sel_setClientTraceId_, v26);

    if (qword_269A49948 != -1) {
      swift_once();
    }
    uint64_t v29 = sub_24FA757A8();
    uint64_t v30 = __swift_project_value_buffer(v29, (uint64_t)qword_269A49C70);
    id v31 = v18;
    uint64_t v64 = v30;
    v32 = sub_24FA75788();
    os_log_type_t v33 = sub_24FA758B8();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v61 = v5;
      uint64_t v34 = swift_slowAlloc();
      id v62 = v31;
      uint64_t v35 = (uint8_t *)v34;
      uint64_t v60 = swift_slowAlloc();
      uint64_t v68 = v60;
      *(_DWORD *)uint64_t v35 = 136315138;
      uint64_t v59 = v35 + 4;
      id v36 = v62;
      id v37 = objc_msgSend(v36, sel_description);
      uint64_t v38 = sub_24FA75808();
      unint64_t v40 = v39;

      uint64_t v67 = sub_24FA602C0(v38, v40, &v68);
      sub_24FA75958();

      uint64_t v16 = &off_26533F000;
      uint64_t v5 = v61;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24FA58000, v32, v33, "Record the SELFUtils.recordRequestStarted() with start event: %s", v35, 0xCu);
      uint64_t v41 = v60;
      swift_arrayDestroy();
      MEMORY[0x25336AD50](v41, -1, -1);
      char v42 = v35;
      id v31 = v62;
      MEMORY[0x25336AD50](v42, -1, -1);
    }
    else
    {
    }
    id v43 = objc_msgSend(v31, sel_clientTraceId);
    if (v43)
    {
      uint64_t v44 = v43;
      sub_24FA75598();
      uint64_t v45 = (uint64_t)v65;
      sub_24FA758A8();
      sub_24FA6CD14(46, v45, 56);
      uint64_t v46 = (void (*)(uint64_t, uint64_t))isa;
      isa((char *)v45, v5);
      sub_24FA75598();
      sub_24FA6CD14(56, (uint64_t)v9, 46);

      v46(v45, v5);
      v46((uint64_t)v9, v5);
    }
    else
    {
      uint64_t v47 = sub_24FA75788();
      os_log_type_t v48 = sub_24FA758C8();
      if (os_log_type_enabled(v47, v48))
      {
        uint64_t v49 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v49 = 0;
        _os_log_impl(&dword_24FA58000, v47, v48, "Failed to create target link because no GATID.", v49, 2u);
        MEMORY[0x25336AD50](v49, -1, -1);
      }
    }
    id v50 = [objc_allocWithZone(MEMORY[0x263F6DDB8]) (SEL)v16[7]];
    if (v50)
    {
      uint64_t v51 = v50;
      objc_msgSend(v50, sel_setStartedOrChanged_, v31);
      uint64_t v52 = [objc_allocWithZone(MEMORY[0x263F6DCF8]) (SEL)v16[7]];
      if (v52)
      {
        uint64_t v53 = v52;
        [v52 setRequestContext:v51];
        sub_24FA652E4(v53);
LABEL_32:

        return;
      }
      uint64_t v53 = sub_24FA75788();
      os_log_type_t v57 = sub_24FA758C8();
      if (os_log_type_enabled(v53, v57))
      {
        uint64_t v58 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v58 = 0;
        _os_log_impl(&dword_24FA58000, v53, v57, "Failed to create GATSchemaGATClientEvent instance.", v58, 2u);
        MEMORY[0x25336AD50](v58, -1, -1);
        goto LABEL_32;
      }
    }
    else
    {
      uint64_t v54 = sub_24FA75788();
      os_log_type_t v55 = sub_24FA758C8();
      if (os_log_type_enabled(v54, v55))
      {
        uint64_t v56 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v56 = 0;
        _os_log_impl(&dword_24FA58000, v54, v55, "Failed to create GATSchemaGATRequestContext instance.", v56, 2u);
        MEMORY[0x25336AD50](v56, -1, -1);

        return;
      }
    }
  }
  else
  {
    if (qword_269A49948 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_24FA757A8();
    __swift_project_value_buffer(v20, (uint64_t)qword_269A49C70);
    os_log_t v66 = (os_log_t)sub_24FA75788();
    os_log_type_t v21 = sub_24FA758C8();
    if (os_log_type_enabled(v66, v21))
    {
      double v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)double v22 = 0;
      _os_log_impl(&dword_24FA58000, v66, v21, "Failed to create GATSchemaGATRequestStarted instance.", v22, 2u);
      MEMORY[0x25336AD50](v22, -1, -1);
    }
    os_log_t v23 = v66;
  }
}

void sub_24FA664B8()
{
  uint64_t v1 = v0;
  uint64_t v2 = (unsigned char *)(v0 + OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_didRequestFailed);
  swift_beginAccess();
  if ((*v2 & 1) != 0
    || (uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_didRequestCancelled),
        swift_beginAccess(),
        (*v3 & 1) != 0)
    || (double v4 = (unsigned char *)(v1 + OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_didRequestHandOffToTA),
        swift_beginAccess(),
        (*v4 & 1) != 0))
  {
    if (qword_269A49948 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_24FA757A8();
    __swift_project_value_buffer(v5, (uint64_t)qword_269A49C70);
    uint64_t v6 = sub_24FA75788();
    os_log_type_t v7 = sub_24FA758B8();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_24FA58000, v6, v7, "GATSchemaGATRequestFailed/Cancel/handOff event recorded not going to proceed to emit the end event.", v8, 2u);
      MEMORY[0x25336AD50](v8, -1, -1);
    }

    sub_24FA650B8();
  }
  else
  {
    os_log_type_t v9 = &off_26533F000;
    id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DDC0]), sel_init);
    if (v10)
    {
      uint64_t v11 = v10;
      id v12 = sub_24FA65740();
      objc_msgSend(v11, sel_setPerfMetrics_, v12);
      if (qword_269A49948 != -1) {
        swift_once();
      }
      uint64_t v13 = sub_24FA757A8();
      __swift_project_value_buffer(v13, (uint64_t)qword_269A49C70);
      id v14 = v11;
      unint64_t v15 = sub_24FA75788();
      os_log_type_t v16 = sub_24FA758B8();
      if (os_log_type_enabled(v15, v16))
      {
        id v17 = (uint8_t *)swift_slowAlloc();
        uint64_t v39 = swift_slowAlloc();
        id v40 = v12;
        uint64_t v41 = v39;
        *(_DWORD *)id v17 = 136315138;
        buf = v17;
        id v18 = v14;
        id v19 = v14;
        id v20 = objc_msgSend(v18, sel_description);
        uint64_t v21 = sub_24FA75808();
        unint64_t v23 = v22;

        id v14 = v19;
        sub_24FA602C0(v21, v23, &v41);
        sub_24FA75958();

        os_log_type_t v9 = &off_26533F000;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24FA58000, v15, v16, "Record the SELFUtils.recordRequestEnded() with ended event: %s", buf, 0xCu);
        swift_arrayDestroy();
        id v12 = v40;
        MEMORY[0x25336AD50](v39, -1, -1);
        MEMORY[0x25336AD50](buf, -1, -1);
      }
      else
      {
      }
      id v28 = [objc_allocWithZone(MEMORY[0x263F6DDB8]) (SEL)v9[7]];
      if (v28)
      {
        uint64_t v29 = v28;
        objc_msgSend(v28, sel_setEnded_, v14);
        id v30 = [objc_allocWithZone(MEMORY[0x263F6DCF8]) (SEL)v9[7]];
        if (v30)
        {
          id v31 = v30;
          objc_msgSend(v30, sel_setRequestContext_, v29);
          sub_24FA652E4(v31);
          sub_24FA650B8();

          return;
        }
        uint64_t v35 = sub_24FA75788();
        os_log_type_t v36 = sub_24FA758C8();
        if (os_log_type_enabled(v35, v36))
        {
          id v37 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)id v37 = 0;
          _os_log_impl(&dword_24FA58000, v35, v36, "Failed to create GATSchemaGATClientEvent instance.", v37, 2u);
          MEMORY[0x25336AD50](v37, -1, -1);

          return;
        }
      }
      else
      {
        v32 = sub_24FA75788();
        os_log_type_t v33 = sub_24FA758C8();
        if (os_log_type_enabled(v32, v33))
        {
          uint64_t v34 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v34 = 0;
          _os_log_impl(&dword_24FA58000, v32, v33, "Failed to create GATSchemaGATRequestContext instance.", v34, 2u);
          MEMORY[0x25336AD50](v34, -1, -1);

          return;
        }
      }
    }
    else
    {
      if (qword_269A49948 != -1) {
        swift_once();
      }
      uint64_t v24 = sub_24FA757A8();
      __swift_project_value_buffer(v24, (uint64_t)qword_269A49C70);
      char v25 = sub_24FA75788();
      os_log_type_t v26 = sub_24FA758C8();
      if (os_log_type_enabled(v25, v26))
      {
        id v27 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v27 = 0;
        _os_log_impl(&dword_24FA58000, v25, v26, "Failed to create GATSchemaGATRequestEnded instance.", v27, 2u);
        MEMORY[0x25336AD50](v27, -1, -1);
      }
    }
  }
}

void sub_24FA66A64(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = (unsigned char *)(v3 + OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_didRequestFailed);
  swift_beginAccess();
  *uint64_t v6 = 1;
  os_log_type_t v7 = &off_26533F000;
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DDC8]), sel_init);
  if (v8)
  {
    os_log_type_t v9 = v8;
    objc_msgSend(v8, sel_setErrorCode_, a1);
    objc_msgSend(v9, sel_setErrorDomain_, a2);
    if (qword_269A49948 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_24FA757A8();
    __swift_project_value_buffer(v10, (uint64_t)qword_269A49C70);
    id v11 = v9;
    id v12 = sub_24FA75788();
    os_log_type_t v13 = sub_24FA758B8();
    if (os_log_type_enabled(v12, v13))
    {
      id v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      uint64_t v38 = v15;
      *(_DWORD *)id v14 = 136315138;
      id v37 = v11;
      id v16 = v11;
      id v17 = objc_msgSend(v16, sel_description);
      uint64_t v18 = sub_24FA75808();
      os_log_type_t v36 = v6;
      unint64_t v20 = v19;

      sub_24FA602C0(v18, v20, &v38);
      sub_24FA75958();

      id v11 = v37;
      uint64_t v6 = v36;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24FA58000, v12, v13, "Record the SELFUtils.recordRequestFailed() with failed event: %s", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25336AD50](v15, -1, -1);
      uint64_t v21 = v14;
      os_log_type_t v7 = &off_26533F000;
      MEMORY[0x25336AD50](v21, -1, -1);
    }
    else
    {
    }
    id v26 = [objc_allocWithZone(MEMORY[0x263F6DDB8]) (SEL)v7[7]];
    if (v26)
    {
      id v27 = v26;
      objc_msgSend(v26, sel_setFailed_, v11);
      id v28 = [objc_allocWithZone(MEMORY[0x263F6DCF8]) (SEL)v7[7]];
      if (v28)
      {
        uint64_t v29 = v28;
        objc_msgSend(v28, sel_setRequestContext_, v27);
        sub_24FA652E4(v29);

        *uint64_t v6 = 1;
        return;
      }
      os_log_type_t v33 = sub_24FA75788();
      os_log_type_t v34 = sub_24FA758C8();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v35 = 0;
        _os_log_impl(&dword_24FA58000, v33, v34, "Failed to create GATSchemaGATClientEvent instance.", v35, 2u);
        MEMORY[0x25336AD50](v35, -1, -1);

        return;
      }
    }
    else
    {
      id v30 = sub_24FA75788();
      os_log_type_t v31 = sub_24FA758C8();
      if (os_log_type_enabled(v30, v31))
      {
        v32 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v32 = 0;
        _os_log_impl(&dword_24FA58000, v30, v31, "Failed to create GATSchemaGATRequestContext instance.", v32, 2u);
        MEMORY[0x25336AD50](v32, -1, -1);

        return;
      }
    }
  }
  else
  {
    if (qword_269A49948 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_24FA757A8();
    __swift_project_value_buffer(v22, (uint64_t)qword_269A49C70);
    unint64_t v23 = sub_24FA75788();
    os_log_type_t v24 = sub_24FA758C8();
    if (os_log_type_enabled(v23, v24))
    {
      char v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v25 = 0;
      _os_log_impl(&dword_24FA58000, v23, v24, "Failed to create GATSchemaGATRequestFailed instance.", v25, 2u);
      MEMORY[0x25336AD50](v25, -1, -1);
    }
  }
}

void sub_24FA66F04()
{
  uint64_t v1 = (unsigned char *)(v0 + OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_didRequestCancelled);
  swift_beginAccess();
  *uint64_t v1 = 1;
  uint64_t v2 = &off_26533F000;
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DDB0]), sel_init);
  if (v3)
  {
    double v4 = v3;
    objc_msgSend(v3, sel_setExist_, 1);
    if (qword_269A49948 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_24FA757A8();
    __swift_project_value_buffer(v5, (uint64_t)qword_269A49C70);
    uint64_t v6 = v4;
    os_log_type_t v7 = sub_24FA75788();
    os_log_type_t v8 = sub_24FA758B8();
    if (os_log_type_enabled(v7, v8))
    {
      os_log_type_t v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      uint64_t v28 = v10;
      *(_DWORD *)os_log_type_t v9 = 136315138;
      id v11 = v6;
      id v12 = v6;
      id v13 = [v11 description];
      uint64_t v14 = sub_24FA75808();
      unint64_t v16 = v15;

      uint64_t v6 = v12;
      sub_24FA602C0(v14, v16, &v28);
      uint64_t v2 = &off_26533F000;
      sub_24FA75958();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24FA58000, v7, v8, "Record the SELFUtils.recordRequestCanceled() with canceled event: %s", v9, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25336AD50](v10, -1, -1);
      MEMORY[0x25336AD50](v9, -1, -1);
    }
    else
    {
    }
    id v21 = [objc_allocWithZone(MEMORY[0x263F6DDB8]) (SEL)v2[7]];
    if (v21)
    {
      uint64_t v22 = v21;
      objc_msgSend(v21, sel_setCanceled_, v6);
      unint64_t v23 = [objc_allocWithZone(MEMORY[0x263F6DCF8]) (SEL)v2[7]];
      if (v23)
      {
        uint64_t v18 = v23;
        [v23 setRequestContext:v22];
        sub_24FA652E4(v18);
LABEL_18:

        goto LABEL_22;
      }
      uint64_t v18 = sub_24FA75788();
      os_log_type_t v26 = sub_24FA758C8();
      if (os_log_type_enabled(v18, v26))
      {
        id v27 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v27 = 0;
        _os_log_impl(&dword_24FA58000, v18, v26, "Failed to create GATSchemaGATClientEvent instance.", v27, 2u);
        MEMORY[0x25336AD50](v27, -1, -1);
        goto LABEL_18;
      }

LABEL_21:
      uint64_t v18 = v6;
      goto LABEL_22;
    }
    uint64_t v18 = sub_24FA75788();
    os_log_type_t v24 = sub_24FA758C8();
    if (!os_log_type_enabled(v18, v24))
    {

      goto LABEL_21;
    }
    char v25 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v25 = 0;
    _os_log_impl(&dword_24FA58000, v18, v24, "Failed to create GATSchemaGATRequestContext instance.", v25, 2u);
    MEMORY[0x25336AD50](v25, -1, -1);
  }
  else
  {
    if (qword_269A49948 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_24FA757A8();
    __swift_project_value_buffer(v17, (uint64_t)qword_269A49C70);
    uint64_t v18 = sub_24FA75788();
    os_log_type_t v19 = sub_24FA758C8();
    if (os_log_type_enabled(v18, v19))
    {
      unint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v20 = 0;
      _os_log_impl(&dword_24FA58000, v18, v19, "Failed to create GATSchemaGATRequestCanceled instance.", v20, 2u);
      MEMORY[0x25336AD50](v20, -1, -1);
    }
  }
LABEL_22:
}

void sub_24FA67378()
{
  uint64_t v1 = (unsigned char *)(v0 + OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_didRequestHandOffToTA);
  swift_beginAccess();
  *uint64_t v1 = 1;
  uint64_t v2 = &off_26533F000;
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DDD0]), sel_init);
  if (v3)
  {
    double v4 = v3;
    objc_msgSend(v3, sel_setExist_, 1);
    if (qword_269A49948 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_24FA757A8();
    __swift_project_value_buffer(v5, (uint64_t)qword_269A49C70);
    uint64_t v6 = v4;
    os_log_type_t v7 = sub_24FA75788();
    os_log_type_t v8 = sub_24FA758B8();
    if (os_log_type_enabled(v7, v8))
    {
      os_log_type_t v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      uint64_t v28 = v10;
      *(_DWORD *)os_log_type_t v9 = 136315138;
      id v11 = v6;
      id v12 = v6;
      id v13 = [v11 description];
      uint64_t v14 = sub_24FA75808();
      unint64_t v16 = v15;

      uint64_t v6 = v12;
      sub_24FA602C0(v14, v16, &v28);
      uint64_t v2 = &off_26533F000;
      sub_24FA75958();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24FA58000, v7, v8, "Record the SELFUtils.recordRequestHandoff() with handoff event: %s", v9, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25336AD50](v10, -1, -1);
      MEMORY[0x25336AD50](v9, -1, -1);
    }
    else
    {
    }
    id v21 = [objc_allocWithZone(MEMORY[0x263F6DDB8]) (SEL)v2[7]];
    if (v21)
    {
      uint64_t v22 = v21;
      objc_msgSend(v21, sel_setHandoff_, v6);
      unint64_t v23 = [objc_allocWithZone(MEMORY[0x263F6DCF8]) (SEL)v2[7]];
      if (v23)
      {
        uint64_t v18 = v23;
        [v23 setRequestContext:v22];
        sub_24FA652E4(v18);
LABEL_18:

        goto LABEL_22;
      }
      uint64_t v18 = sub_24FA75788();
      os_log_type_t v26 = sub_24FA758C8();
      if (os_log_type_enabled(v18, v26))
      {
        id v27 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v27 = 0;
        _os_log_impl(&dword_24FA58000, v18, v26, "Failed to create GATSchemaGATClientEvent instance.", v27, 2u);
        MEMORY[0x25336AD50](v27, -1, -1);
        goto LABEL_18;
      }

LABEL_21:
      uint64_t v18 = v6;
      goto LABEL_22;
    }
    uint64_t v18 = sub_24FA75788();
    os_log_type_t v24 = sub_24FA758C8();
    if (!os_log_type_enabled(v18, v24))
    {

      goto LABEL_21;
    }
    char v25 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v25 = 0;
    _os_log_impl(&dword_24FA58000, v18, v24, "Failed to create GATSchemaGATRequestContext instance.", v25, 2u);
    MEMORY[0x25336AD50](v25, -1, -1);
  }
  else
  {
    if (qword_269A49948 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_24FA757A8();
    __swift_project_value_buffer(v17, (uint64_t)qword_269A49C70);
    uint64_t v18 = sub_24FA75788();
    os_log_type_t v19 = sub_24FA758C8();
    if (os_log_type_enabled(v18, v19))
    {
      unint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v20 = 0;
      _os_log_impl(&dword_24FA58000, v18, v19, "Failed to create GATSchemaGATRequestHandoff instance.", v20, 2u);
      MEMORY[0x25336AD50](v20, -1, -1);
    }
  }
LABEL_22:
}

void sub_24FA677EC()
{
  uint64_t v0 = &off_26533F000;
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DD80]), sel_init);
  if (v1)
  {
    uint64_t v2 = v1;
    objc_msgSend(v1, sel_setExist_, 1);
    if (qword_269A49948 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_24FA757A8();
    __swift_project_value_buffer(v3, (uint64_t)qword_269A49C70);
    os_log_t v4 = v2;
    uint64_t v5 = sub_24FA75788();
    os_log_type_t v6 = sub_24FA758B8();
    if (os_log_type_enabled(v5, v6))
    {
      os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      uint64_t v30 = v8;
      *(_DWORD *)os_log_type_t v7 = 136315138;
      os_log_type_t v9 = v4;
      id v10 = [v9 description];
      uint64_t v11 = sub_24FA75808();
      os_log_t osloga = v4;
      unint64_t v13 = v12;

      sub_24FA602C0(v11, v13, &v30);
      sub_24FA75958();

      os_log_t v4 = osloga;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24FA58000, v5, v6, "Record the SELFUtils.recordLoadScreenContentStarted() with start event: %s", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25336AD50](v8, -1, -1);
      uint64_t v14 = v7;
      uint64_t v0 = &off_26533F000;
      MEMORY[0x25336AD50](v14, -1, -1);
    }
    else
    {
    }
    id v18 = [objc_allocWithZone(MEMORY[0x263F6DD68]) (SEL)v0[7]];
    if (v18)
    {
      os_log_type_t v19 = v18;
      objc_msgSend(v18, sel_setStartedOrChanged_, v4);
      id v20 = [objc_allocWithZone(MEMORY[0x263F6DCF8]) (SEL)v0[7]];
      if (v20)
      {
        id v21 = v20;
        objc_msgSend(v20, sel_setLoadScreenContentContext_, v19);
        sub_24FA652E4(v21);

        return;
      }
      char v25 = sub_24FA75788();
      os_log_type_t v26 = sub_24FA758C8();
      if (os_log_type_enabled(v25, v26))
      {
        id v27 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v27 = 0;
        _os_log_impl(&dword_24FA58000, v25, v26, "Failed to create GATSchemaGATClientEvent instance.", v27, 2u);
        MEMORY[0x25336AD50](v27, -1, -1);

        return;
      }
    }
    else
    {
      uint64_t v22 = sub_24FA75788();
      os_log_type_t v23 = sub_24FA758C8();
      if (os_log_type_enabled(v22, v23))
      {
        os_log_type_t v24 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v24 = 0;
        _os_log_impl(&dword_24FA58000, v22, v23, "Failed to create GATSchemaGATLoadScreenContentContext instance.", v24, 2u);
        MEMORY[0x25336AD50](v24, -1, -1);

        return;
      }
    }
  }
  else
  {
    if (qword_269A49948 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_24FA757A8();
    __swift_project_value_buffer(v15, (uint64_t)qword_269A49C70);
    os_log_t oslog = sub_24FA75788();
    os_log_type_t v16 = sub_24FA758C8();
    if (os_log_type_enabled(oslog, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_24FA58000, oslog, v16, "Failed to create GATSchemaGATLoadScreenContentEventStarted instance.", v17, 2u);
      MEMORY[0x25336AD50](v17, -1, -1);
    }
  }
}

void sub_24FA67C6C()
{
  uint64_t v0 = &off_26533F000;
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DD70]), sel_init);
  if (v1)
  {
    uint64_t v2 = v1;
    if (qword_269A49948 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_24FA757A8();
    __swift_project_value_buffer(v3, (uint64_t)qword_269A49C70);
    os_log_t v4 = v2;
    uint64_t v5 = sub_24FA75788();
    os_log_type_t v6 = sub_24FA758B8();
    if (os_log_type_enabled(v5, v6))
    {
      os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      uint64_t v30 = v8;
      *(_DWORD *)os_log_type_t v7 = 136315138;
      os_log_type_t v9 = v4;
      id v10 = [v9 description];
      uint64_t v11 = sub_24FA75808();
      os_log_t osloga = v4;
      unint64_t v13 = v12;

      sub_24FA602C0(v11, v13, &v30);
      sub_24FA75958();

      os_log_t v4 = osloga;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24FA58000, v5, v6, "Record the SELFUtils.recordLoadScreenContentEnded() with ended event: %s", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25336AD50](v8, -1, -1);
      uint64_t v14 = v7;
      uint64_t v0 = &off_26533F000;
      MEMORY[0x25336AD50](v14, -1, -1);
    }
    else
    {
    }
    id v18 = [objc_allocWithZone(MEMORY[0x263F6DD68]) (SEL)v0[7]];
    if (v18)
    {
      os_log_type_t v19 = v18;
      objc_msgSend(v18, sel_setEnded_, v4);
      id v20 = [objc_allocWithZone(MEMORY[0x263F6DCF8]) (SEL)v0[7]];
      if (v20)
      {
        id v21 = v20;
        objc_msgSend(v20, sel_setLoadScreenContentContext_, v19);
        sub_24FA652E4(v21);

        return;
      }
      char v25 = sub_24FA75788();
      os_log_type_t v26 = sub_24FA758C8();
      if (os_log_type_enabled(v25, v26))
      {
        id v27 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v27 = 0;
        _os_log_impl(&dword_24FA58000, v25, v26, "Failed to create GATSchemaGATClientEvent instance.", v27, 2u);
        MEMORY[0x25336AD50](v27, -1, -1);

        return;
      }
    }
    else
    {
      uint64_t v22 = sub_24FA75788();
      os_log_type_t v23 = sub_24FA758C8();
      if (os_log_type_enabled(v22, v23))
      {
        os_log_type_t v24 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v24 = 0;
        _os_log_impl(&dword_24FA58000, v22, v23, "Failed to create GATSchemaGATLoadScreenContentContext instance.", v24, 2u);
        MEMORY[0x25336AD50](v24, -1, -1);

        return;
      }
    }
  }
  else
  {
    if (qword_269A49948 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_24FA757A8();
    __swift_project_value_buffer(v15, (uint64_t)qword_269A49C70);
    os_log_t oslog = sub_24FA75788();
    os_log_type_t v16 = sub_24FA758C8();
    if (os_log_type_enabled(oslog, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_24FA58000, oslog, v16, "Failed to create GATSchemaGATLoadScreenContentEventEnded instance.", v17, 2u);
      MEMORY[0x25336AD50](v17, -1, -1);
    }
  }
}

void sub_24FA680D4(uint64_t a1, uint64_t a2)
{
  os_log_t v4 = &off_26533F000;
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DD78]), sel_init);
  if (v5)
  {
    os_log_type_t v6 = v5;
    objc_msgSend(v5, sel_setErrorCode_, a1);
    objc_msgSend(v6, sel_setErrorDomain_, a2);
    if (qword_269A49948 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_24FA757A8();
    __swift_project_value_buffer(v7, (uint64_t)qword_269A49C70);
    os_log_t v8 = v6;
    os_log_type_t v9 = sub_24FA75788();
    os_log_type_t v10 = sub_24FA758B8();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v34 = v12;
      *(_DWORD *)uint64_t v11 = 136315138;
      unint64_t v13 = v8;
      id v14 = [v13 description];
      uint64_t v15 = sub_24FA75808();
      os_log_t osloga = v8;
      unint64_t v17 = v16;

      sub_24FA602C0(v15, v17, &v34);
      sub_24FA75958();

      os_log_t v8 = osloga;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24FA58000, v9, v10, "Record the SELFUtils.recordLoadScreenContentFailed() with failed event: %s", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25336AD50](v12, -1, -1);
      id v18 = v11;
      os_log_t v4 = &off_26533F000;
      MEMORY[0x25336AD50](v18, -1, -1);
    }
    else
    {
    }
    id v22 = [objc_allocWithZone(MEMORY[0x263F6DD68]) (SEL)v4[7]];
    if (v22)
    {
      os_log_type_t v23 = v22;
      objc_msgSend(v22, sel_setFailed_, v8);
      id v24 = [objc_allocWithZone(MEMORY[0x263F6DCF8]) (SEL)v4[7]];
      if (v24)
      {
        char v25 = v24;
        objc_msgSend(v24, sel_setLoadScreenContentContext_, v23);
        sub_24FA652E4(v25);

        return;
      }
      uint64_t v29 = sub_24FA75788();
      os_log_type_t v30 = sub_24FA758C8();
      if (os_log_type_enabled(v29, v30))
      {
        os_log_type_t v31 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v31 = 0;
        _os_log_impl(&dword_24FA58000, v29, v30, "Failed to create GATSchemaGATClientEvent instance.", v31, 2u);
        MEMORY[0x25336AD50](v31, -1, -1);

        return;
      }
    }
    else
    {
      os_log_type_t v26 = sub_24FA75788();
      os_log_type_t v27 = sub_24FA758C8();
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v28 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v28 = 0;
        _os_log_impl(&dword_24FA58000, v26, v27, "Failed to create GATSchemaGATLoadScreenContentContext instance.", v28, 2u);
        MEMORY[0x25336AD50](v28, -1, -1);

        return;
      }
    }
  }
  else
  {
    if (qword_269A49948 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_24FA757A8();
    __swift_project_value_buffer(v19, (uint64_t)qword_269A49C70);
    os_log_t oslog = sub_24FA75788();
    os_log_type_t v20 = sub_24FA758C8();
    if (os_log_type_enabled(oslog, v20))
    {
      id v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v21 = 0;
      _os_log_impl(&dword_24FA58000, oslog, v20, "Failed to create GATSchemaGATLoadScreenContentEventFailed instance.", v21, 2u);
      MEMORY[0x25336AD50](v21, -1, -1);
    }
  }
}

void sub_24FA68570()
{
  uint64_t v0 = &off_26533F000;
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DD20]), sel_init);
  if (v1)
  {
    uint64_t v2 = v1;
    objc_msgSend(v1, sel_setExist_, 1);
    if (qword_269A49948 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_24FA757A8();
    __swift_project_value_buffer(v3, (uint64_t)qword_269A49C70);
    os_log_t v4 = v2;
    id v5 = sub_24FA75788();
    os_log_type_t v6 = sub_24FA758B8();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      uint64_t v30 = v8;
      *(_DWORD *)uint64_t v7 = 136315138;
      os_log_type_t v9 = v4;
      id v10 = [v9 description];
      uint64_t v11 = sub_24FA75808();
      os_log_t osloga = v4;
      unint64_t v13 = v12;

      sub_24FA602C0(v11, v13, &v30);
      sub_24FA75958();

      os_log_t v4 = osloga;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24FA58000, v5, v6, "Record the SELFUtils.recordCreateSessionStarted() with start event: %s", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25336AD50](v8, -1, -1);
      id v14 = v7;
      uint64_t v0 = &off_26533F000;
      MEMORY[0x25336AD50](v14, -1, -1);
    }
    else
    {
    }
    id v18 = [objc_allocWithZone(MEMORY[0x263F6DD08]) (SEL)v0[7]];
    if (v18)
    {
      uint64_t v19 = v18;
      objc_msgSend(v18, sel_setStartedOrChanged_, v4);
      id v20 = [objc_allocWithZone(MEMORY[0x263F6DCF8]) (SEL)v0[7]];
      if (v20)
      {
        id v21 = v20;
        objc_msgSend(v20, sel_setCreateSessionContext_, v19);
        sub_24FA652E4(v21);

        return;
      }
      char v25 = sub_24FA75788();
      os_log_type_t v26 = sub_24FA758C8();
      if (os_log_type_enabled(v25, v26))
      {
        os_log_type_t v27 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v27 = 0;
        _os_log_impl(&dword_24FA58000, v25, v26, "Failed to create GATSchemaGATClientEvent instance.", v27, 2u);
        MEMORY[0x25336AD50](v27, -1, -1);

        return;
      }
    }
    else
    {
      id v22 = sub_24FA75788();
      os_log_type_t v23 = sub_24FA758C8();
      if (os_log_type_enabled(v22, v23))
      {
        id v24 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v24 = 0;
        _os_log_impl(&dword_24FA58000, v22, v23, "Failed to create GATSchemaGATCreateSessionContext instance.", v24, 2u);
        MEMORY[0x25336AD50](v24, -1, -1);

        return;
      }
    }
  }
  else
  {
    if (qword_269A49948 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_24FA757A8();
    __swift_project_value_buffer(v15, (uint64_t)qword_269A49C70);
    os_log_t oslog = sub_24FA75788();
    os_log_type_t v16 = sub_24FA758C8();
    if (os_log_type_enabled(oslog, v16))
    {
      unint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v17 = 0;
      _os_log_impl(&dword_24FA58000, oslog, v16, "Failed to create GATSchemaGATCreateSessionEventStarted instance.", v17, 2u);
      MEMORY[0x25336AD50](v17, -1, -1);
    }
  }
}

void sub_24FA689F0()
{
  uint64_t v0 = &off_26533F000;
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DD10]), sel_init);
  if (v1)
  {
    uint64_t v2 = v1;
    objc_msgSend(v1, sel_setExist_, 1);
    if (qword_269A49948 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_24FA757A8();
    __swift_project_value_buffer(v3, (uint64_t)qword_269A49C70);
    os_log_t v4 = v2;
    id v5 = sub_24FA75788();
    os_log_type_t v6 = sub_24FA758B8();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      uint64_t v30 = v8;
      *(_DWORD *)uint64_t v7 = 136315138;
      os_log_type_t v9 = v4;
      id v10 = [v9 description];
      uint64_t v11 = sub_24FA75808();
      os_log_t osloga = v4;
      unint64_t v13 = v12;

      sub_24FA602C0(v11, v13, &v30);
      sub_24FA75958();

      os_log_t v4 = osloga;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24FA58000, v5, v6, "Record the SELFUtils.recordCreateSessionEnded() with end event: %s", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25336AD50](v8, -1, -1);
      id v14 = v7;
      uint64_t v0 = &off_26533F000;
      MEMORY[0x25336AD50](v14, -1, -1);
    }
    else
    {
    }
    id v18 = [objc_allocWithZone(MEMORY[0x263F6DD08]) (SEL)v0[7]];
    if (v18)
    {
      uint64_t v19 = v18;
      objc_msgSend(v18, sel_setEnded_, v4);
      id v20 = [objc_allocWithZone(MEMORY[0x263F6DCF8]) (SEL)v0[7]];
      if (v20)
      {
        id v21 = v20;
        objc_msgSend(v20, sel_setCreateSessionContext_, v19);
        sub_24FA652E4(v21);

        return;
      }
      char v25 = sub_24FA75788();
      os_log_type_t v26 = sub_24FA758C8();
      if (os_log_type_enabled(v25, v26))
      {
        os_log_type_t v27 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v27 = 0;
        _os_log_impl(&dword_24FA58000, v25, v26, "Failed to create GATSchemaGATClientEvent instance.", v27, 2u);
        MEMORY[0x25336AD50](v27, -1, -1);

        return;
      }
    }
    else
    {
      id v22 = sub_24FA75788();
      os_log_type_t v23 = sub_24FA758C8();
      if (os_log_type_enabled(v22, v23))
      {
        id v24 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v24 = 0;
        _os_log_impl(&dword_24FA58000, v22, v23, "Failed to create GATSchemaGATCreateSessionContext instance.", v24, 2u);
        MEMORY[0x25336AD50](v24, -1, -1);

        return;
      }
    }
  }
  else
  {
    if (qword_269A49948 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_24FA757A8();
    __swift_project_value_buffer(v15, (uint64_t)qword_269A49C70);
    os_log_t oslog = sub_24FA75788();
    os_log_type_t v16 = sub_24FA758C8();
    if (os_log_type_enabled(oslog, v16))
    {
      unint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v17 = 0;
      _os_log_impl(&dword_24FA58000, oslog, v16, "Failed to create GATSchemaGATCreateSessionEventEnded instance.", v17, 2u);
      MEMORY[0x25336AD50](v17, -1, -1);
    }
  }
}

void sub_24FA68E70(uint64_t a1, uint64_t a2)
{
  os_log_t v4 = &off_26533F000;
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DD18]), sel_init);
  if (v5)
  {
    os_log_type_t v6 = v5;
    objc_msgSend(v5, sel_setErrorCode_, a1);
    objc_msgSend(v6, sel_setErrorDomain_, a2);
    if (qword_269A49948 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_24FA757A8();
    __swift_project_value_buffer(v7, (uint64_t)qword_269A49C70);
    os_log_t v8 = v6;
    os_log_type_t v9 = sub_24FA75788();
    os_log_type_t v10 = sub_24FA758B8();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v34 = v12;
      *(_DWORD *)uint64_t v11 = 136315138;
      unint64_t v13 = v8;
      id v14 = [v13 description];
      uint64_t v15 = sub_24FA75808();
      os_log_t osloga = v8;
      unint64_t v17 = v16;

      sub_24FA602C0(v15, v17, &v34);
      sub_24FA75958();

      os_log_t v8 = osloga;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24FA58000, v9, v10, "Record the SELFUtils.recordCreateSessionFailed() with failed event: %s", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25336AD50](v12, -1, -1);
      id v18 = v11;
      os_log_t v4 = &off_26533F000;
      MEMORY[0x25336AD50](v18, -1, -1);
    }
    else
    {
    }
    id v22 = [objc_allocWithZone(MEMORY[0x263F6DD08]) (SEL)v4[7]];
    if (v22)
    {
      os_log_type_t v23 = v22;
      objc_msgSend(v22, sel_setFailed_, v8);
      id v24 = [objc_allocWithZone(MEMORY[0x263F6DCF8]) (SEL)v4[7]];
      if (v24)
      {
        char v25 = v24;
        objc_msgSend(v24, sel_setCreateSessionContext_, v23);
        sub_24FA652E4(v25);

        return;
      }
      uint64_t v29 = sub_24FA75788();
      os_log_type_t v30 = sub_24FA758C8();
      if (os_log_type_enabled(v29, v30))
      {
        os_log_type_t v31 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v31 = 0;
        _os_log_impl(&dword_24FA58000, v29, v30, "Failed to create GATSchemaGATClientEvent instance.", v31, 2u);
        MEMORY[0x25336AD50](v31, -1, -1);

        return;
      }
    }
    else
    {
      os_log_type_t v26 = sub_24FA75788();
      os_log_type_t v27 = sub_24FA758C8();
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v28 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v28 = 0;
        _os_log_impl(&dword_24FA58000, v26, v27, "Failed to create GATSchemaGATCreateSessionContext instance.", v28, 2u);
        MEMORY[0x25336AD50](v28, -1, -1);

        return;
      }
    }
  }
  else
  {
    if (qword_269A49948 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_24FA757A8();
    __swift_project_value_buffer(v19, (uint64_t)qword_269A49C70);
    os_log_t oslog = sub_24FA75788();
    os_log_type_t v20 = sub_24FA758C8();
    if (os_log_type_enabled(oslog, v20))
    {
      id v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v21 = 0;
      _os_log_impl(&dword_24FA58000, oslog, v20, "Failed to create GATSchemaGATCreateSessionEventFailed instance.", v21, 2u);
      MEMORY[0x25336AD50](v21, -1, -1);
    }
  }
}

void sub_24FA6930C()
{
  uint64_t v0 = &off_26533F000;
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DDA8]), sel_init);
  if (v1)
  {
    uint64_t v2 = v1;
    objc_msgSend(v1, sel_setExist_, 1);
    if (qword_269A49948 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_24FA757A8();
    __swift_project_value_buffer(v3, (uint64_t)qword_269A49C70);
    os_log_t v4 = v2;
    id v5 = sub_24FA75788();
    os_log_type_t v6 = sub_24FA758B8();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      uint64_t v30 = v8;
      *(_DWORD *)uint64_t v7 = 136315138;
      os_log_type_t v9 = v4;
      id v10 = [v9 description];
      uint64_t v11 = sub_24FA75808();
      os_log_t osloga = v4;
      unint64_t v13 = v12;

      sub_24FA602C0(v11, v13, &v30);
      sub_24FA75958();

      os_log_t v4 = osloga;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24FA58000, v5, v6, "Record the SELFUtils.recordRegisterMediaStarted() with start event: %s", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25336AD50](v8, -1, -1);
      id v14 = v7;
      uint64_t v0 = &off_26533F000;
      MEMORY[0x25336AD50](v14, -1, -1);
    }
    else
    {
    }
    id v18 = [objc_allocWithZone(MEMORY[0x263F6DD90]) (SEL)v0[7]];
    if (v18)
    {
      uint64_t v19 = v18;
      objc_msgSend(v18, sel_setStartedOrChanged_, v4);
      id v20 = [objc_allocWithZone(MEMORY[0x263F6DCF8]) (SEL)v0[7]];
      if (v20)
      {
        id v21 = v20;
        objc_msgSend(v20, sel_setRegisterMediaContext_, v19);
        sub_24FA652E4(v21);

        return;
      }
      char v25 = sub_24FA75788();
      os_log_type_t v26 = sub_24FA758C8();
      if (os_log_type_enabled(v25, v26))
      {
        os_log_type_t v27 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v27 = 0;
        _os_log_impl(&dword_24FA58000, v25, v26, "Failed to create GATSchemaGATClientEvent instance.", v27, 2u);
        MEMORY[0x25336AD50](v27, -1, -1);

        return;
      }
    }
    else
    {
      id v22 = sub_24FA75788();
      os_log_type_t v23 = sub_24FA758C8();
      if (os_log_type_enabled(v22, v23))
      {
        id v24 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v24 = 0;
        _os_log_impl(&dword_24FA58000, v22, v23, "Failed to create GATSchemaGATRegisterMediaContext instance.", v24, 2u);
        MEMORY[0x25336AD50](v24, -1, -1);

        return;
      }
    }
  }
  else
  {
    if (qword_269A49948 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_24FA757A8();
    __swift_project_value_buffer(v15, (uint64_t)qword_269A49C70);
    os_log_t oslog = sub_24FA75788();
    os_log_type_t v16 = sub_24FA758C8();
    if (os_log_type_enabled(oslog, v16))
    {
      unint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v17 = 0;
      _os_log_impl(&dword_24FA58000, oslog, v16, "Failed to create GATSchemaGATRegisterMediaEventStarted instance.", v17, 2u);
      MEMORY[0x25336AD50](v17, -1, -1);
    }
  }
}

void sub_24FA6978C()
{
  uint64_t v0 = &off_26533F000;
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DD98]), sel_init);
  if (v1)
  {
    uint64_t v2 = v1;
    objc_msgSend(v1, sel_setExist_, 1);
    if (qword_269A49948 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_24FA757A8();
    __swift_project_value_buffer(v3, (uint64_t)qword_269A49C70);
    os_log_t v4 = v2;
    id v5 = sub_24FA75788();
    os_log_type_t v6 = sub_24FA758B8();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      uint64_t v30 = v8;
      *(_DWORD *)uint64_t v7 = 136315138;
      os_log_type_t v9 = v4;
      id v10 = [v9 description];
      uint64_t v11 = sub_24FA75808();
      os_log_t osloga = v4;
      unint64_t v13 = v12;

      sub_24FA602C0(v11, v13, &v30);
      sub_24FA75958();

      os_log_t v4 = osloga;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24FA58000, v5, v6, "Record the SELFUtils.recordRegisterMediaEnded() with end event: %s", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25336AD50](v8, -1, -1);
      id v14 = v7;
      uint64_t v0 = &off_26533F000;
      MEMORY[0x25336AD50](v14, -1, -1);
    }
    else
    {
    }
    id v18 = [objc_allocWithZone(MEMORY[0x263F6DD90]) (SEL)v0[7]];
    if (v18)
    {
      uint64_t v19 = v18;
      objc_msgSend(v18, sel_setEnded_, v4);
      id v20 = [objc_allocWithZone(MEMORY[0x263F6DCF8]) (SEL)v0[7]];
      if (v20)
      {
        id v21 = v20;
        objc_msgSend(v20, sel_setRegisterMediaContext_, v19);
        sub_24FA652E4(v21);

        return;
      }
      char v25 = sub_24FA75788();
      os_log_type_t v26 = sub_24FA758C8();
      if (os_log_type_enabled(v25, v26))
      {
        os_log_type_t v27 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v27 = 0;
        _os_log_impl(&dword_24FA58000, v25, v26, "Failed to create GATSchemaGATClientEvent instance.", v27, 2u);
        MEMORY[0x25336AD50](v27, -1, -1);

        return;
      }
    }
    else
    {
      id v22 = sub_24FA75788();
      os_log_type_t v23 = sub_24FA758C8();
      if (os_log_type_enabled(v22, v23))
      {
        id v24 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v24 = 0;
        _os_log_impl(&dword_24FA58000, v22, v23, "Failed to create GATSchemaGATRegisterMediaContext instance.", v24, 2u);
        MEMORY[0x25336AD50](v24, -1, -1);

        return;
      }
    }
  }
  else
  {
    if (qword_269A49948 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_24FA757A8();
    __swift_project_value_buffer(v15, (uint64_t)qword_269A49C70);
    os_log_t oslog = sub_24FA75788();
    os_log_type_t v16 = sub_24FA758C8();
    if (os_log_type_enabled(oslog, v16))
    {
      unint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v17 = 0;
      _os_log_impl(&dword_24FA58000, oslog, v16, "Failed to create GATSchemaGATRegisterMediaEventEnded instance.", v17, 2u);
      MEMORY[0x25336AD50](v17, -1, -1);
    }
  }
}

void sub_24FA69C0C(uint64_t a1, uint64_t a2)
{
  os_log_t v4 = &off_26533F000;
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DDA0]), sel_init);
  if (v5)
  {
    os_log_type_t v6 = v5;
    objc_msgSend(v5, sel_setErrorCode_, a1);
    objc_msgSend(v6, sel_setErrorDomain_, a2);
    if (qword_269A49948 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_24FA757A8();
    __swift_project_value_buffer(v7, (uint64_t)qword_269A49C70);
    os_log_t v8 = v6;
    os_log_type_t v9 = sub_24FA75788();
    os_log_type_t v10 = sub_24FA758B8();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v34 = v12;
      *(_DWORD *)uint64_t v11 = 136315138;
      unint64_t v13 = v8;
      id v14 = [v13 description];
      uint64_t v15 = sub_24FA75808();
      os_log_t osloga = v8;
      unint64_t v17 = v16;

      sub_24FA602C0(v15, v17, &v34);
      sub_24FA75958();

      os_log_t v8 = osloga;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24FA58000, v9, v10, "Record the SELFUtils.recordRegisterMediaFailed() with failed event: %s", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25336AD50](v12, -1, -1);
      id v18 = v11;
      os_log_t v4 = &off_26533F000;
      MEMORY[0x25336AD50](v18, -1, -1);
    }
    else
    {
    }
    id v22 = [objc_allocWithZone(MEMORY[0x263F6DD90]) (SEL)v4[7]];
    if (v22)
    {
      os_log_type_t v23 = v22;
      objc_msgSend(v22, sel_setFailed_, v8);
      id v24 = [objc_allocWithZone(MEMORY[0x263F6DCF8]) (SEL)v4[7]];
      if (v24)
      {
        char v25 = v24;
        objc_msgSend(v24, sel_setRegisterMediaContext_, v23);
        sub_24FA652E4(v25);

        return;
      }
      uint64_t v29 = sub_24FA75788();
      os_log_type_t v30 = sub_24FA758C8();
      if (os_log_type_enabled(v29, v30))
      {
        os_log_type_t v31 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v31 = 0;
        _os_log_impl(&dword_24FA58000, v29, v30, "Failed to create GATSchemaGATClientEvent instance.", v31, 2u);
        MEMORY[0x25336AD50](v31, -1, -1);

        return;
      }
    }
    else
    {
      os_log_type_t v26 = sub_24FA75788();
      os_log_type_t v27 = sub_24FA758C8();
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v28 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v28 = 0;
        _os_log_impl(&dword_24FA58000, v26, v27, "Failed to create GATSchemaGATRegisterMediaContext instance.", v28, 2u);
        MEMORY[0x25336AD50](v28, -1, -1);

        return;
      }
    }
  }
  else
  {
    if (qword_269A49948 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_24FA757A8();
    __swift_project_value_buffer(v19, (uint64_t)qword_269A49C70);
    os_log_t oslog = sub_24FA75788();
    os_log_type_t v20 = sub_24FA758C8();
    if (os_log_type_enabled(oslog, v20))
    {
      id v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v21 = 0;
      _os_log_impl(&dword_24FA58000, oslog, v20, "Failed to create GATSchemaGATRegisterMediaEventFailed instance.", v21, 2u);
      MEMORY[0x25336AD50](v21, -1, -1);
    }
  }
}

void sub_24FA6A0A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  os_log_t v8 = &off_26533F000;
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DD40]), sel_init);
  if (!v9)
  {
    if (qword_269A49948 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_24FA757A8();
    __swift_project_value_buffer(v24, (uint64_t)qword_269A49C70);
    os_log_t oslog = sub_24FA75788();
    os_log_type_t v25 = sub_24FA758C8();
    if (os_log_type_enabled(oslog, v25))
    {
      os_log_type_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v26 = 0;
      _os_log_impl(&dword_24FA58000, oslog, v25, "Failed to create GATSchemaGATGenerativeRequestEventStarted instance.", v26, 2u);
      MEMORY[0x25336AD50](v26, -1, -1);
    }

    return;
  }
  os_log_type_t v10 = v9;
  if ((a1 & 0x100000000) == 0) {
    goto LABEL_5;
  }
  uint64_t v11 = (unsigned int *)(v4 + OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_gatUsecase);
  swift_beginAccess();
  if ((v11[1] & 1) == 0)
  {
    a1 = *v11;
LABEL_5:
    objc_msgSend(v10, sel_setUsecase_, a1);
  }
  if ((a2 & 0x100000000) == 0) {
    objc_msgSend(v10, sel_setMediaQAUseCase_, a2);
  }
  objc_msgSend(v10, sel_setLlmAgentName_, a3);
  if (qword_269A49948 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_24FA757A8();
  __swift_project_value_buffer(v12, (uint64_t)qword_269A49C70);
  os_log_t v13 = v10;
  id v14 = sub_24FA75788();
  os_log_type_t v15 = sub_24FA758B8();
  if (os_log_type_enabled(v14, v15))
  {
    unint64_t v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    uint64_t v39 = v17;
    *(_DWORD *)unint64_t v16 = 136315138;
    id v18 = v13;
    id v19 = [v18 description];
    uint64_t v20 = sub_24FA75808();
    os_log_t osloga = v13;
    unint64_t v22 = v21;

    sub_24FA602C0(v20, v22, &v39);
    sub_24FA75958();

    os_log_t v13 = osloga;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24FA58000, v14, v15, "Record the SELFUtils.recordGenerativeRequestStarted() with start event: %s", v16, 0xCu);
    swift_arrayDestroy();
    uint64_t v23 = v17;
    os_log_t v8 = &off_26533F000;
    MEMORY[0x25336AD50](v23, -1, -1);
    MEMORY[0x25336AD50](v16, -1, -1);
  }
  else
  {
  }
  id v27 = [objc_allocWithZone(MEMORY[0x263F6DD28]) (SEL)v8[7]];
  if (v27)
  {
    uint64_t v28 = v27;
    objc_msgSend(v27, sel_setStartedOrChanged_, v13);
    id v29 = [objc_allocWithZone(MEMORY[0x263F6DCF8]) (SEL)v8[7]];
    if (v29)
    {
      os_log_type_t v30 = v29;
      objc_msgSend(v29, sel_setGenerativeRequestContext_, v28);
      sub_24FA652E4(v30);

      return;
    }
    uint64_t v34 = sub_24FA75788();
    os_log_type_t v35 = sub_24FA758C8();
    if (os_log_type_enabled(v34, v35))
    {
      os_log_type_t v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v36 = 0;
      _os_log_impl(&dword_24FA58000, v34, v35, "Failed to create GATSchemaGATClientEvent instance.", v36, 2u);
      MEMORY[0x25336AD50](v36, -1, -1);

      return;
    }
  }
  else
  {
    os_log_type_t v31 = sub_24FA75788();
    os_log_type_t v32 = sub_24FA758C8();
    if (os_log_type_enabled(v31, v32))
    {
      os_log_type_t v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v33 = 0;
      _os_log_impl(&dword_24FA58000, v31, v32, "Failed to create GATSchemaGATGenerativeRequestContext instance.", v33, 2u);
      MEMORY[0x25336AD50](v33, -1, -1);

      return;
    }
  }
}

void sub_24FA6A58C()
{
  uint64_t v0 = &off_26533F000;
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DD30]), sel_init);
  if (v1)
  {
    uint64_t v2 = v1;
    objc_msgSend(v1, sel_setExist_, 1);
    if (qword_269A49948 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_24FA757A8();
    __swift_project_value_buffer(v3, (uint64_t)qword_269A49C70);
    os_log_t v4 = v2;
    id v5 = sub_24FA75788();
    os_log_type_t v6 = sub_24FA758B8();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      uint64_t v30 = v8;
      *(_DWORD *)uint64_t v7 = 136315138;
      id v9 = v4;
      id v10 = [v9 description];
      uint64_t v11 = sub_24FA75808();
      os_log_t osloga = v4;
      unint64_t v13 = v12;

      sub_24FA602C0(v11, v13, &v30);
      sub_24FA75958();

      os_log_t v4 = osloga;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24FA58000, v5, v6, "Record the SELFUtils.recordGenerativeRequestEnded() with end event: %s", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25336AD50](v8, -1, -1);
      id v14 = v7;
      uint64_t v0 = &off_26533F000;
      MEMORY[0x25336AD50](v14, -1, -1);
    }
    else
    {
    }
    id v18 = [objc_allocWithZone(MEMORY[0x263F6DD28]) (SEL)v0[7]];
    if (v18)
    {
      id v19 = v18;
      objc_msgSend(v18, sel_setEnded_, v4);
      id v20 = [objc_allocWithZone(MEMORY[0x263F6DCF8]) (SEL)v0[7]];
      if (v20)
      {
        unint64_t v21 = v20;
        objc_msgSend(v20, sel_setGenerativeRequestContext_, v19);
        sub_24FA652E4(v21);

        return;
      }
      os_log_type_t v25 = sub_24FA75788();
      os_log_type_t v26 = sub_24FA758C8();
      if (os_log_type_enabled(v25, v26))
      {
        id v27 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v27 = 0;
        _os_log_impl(&dword_24FA58000, v25, v26, "Failed to create GATSchemaGATClientEvent instance.", v27, 2u);
        MEMORY[0x25336AD50](v27, -1, -1);

        return;
      }
    }
    else
    {
      unint64_t v22 = sub_24FA75788();
      os_log_type_t v23 = sub_24FA758C8();
      if (os_log_type_enabled(v22, v23))
      {
        uint64_t v24 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v24 = 0;
        _os_log_impl(&dword_24FA58000, v22, v23, "Failed to create GATSchemaGATGenerativeRequestContext instance.", v24, 2u);
        MEMORY[0x25336AD50](v24, -1, -1);

        return;
      }
    }
  }
  else
  {
    if (qword_269A49948 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_24FA757A8();
    __swift_project_value_buffer(v15, (uint64_t)qword_269A49C70);
    os_log_t oslog = sub_24FA75788();
    os_log_type_t v16 = sub_24FA758C8();
    if (os_log_type_enabled(oslog, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_24FA58000, oslog, v16, "Failed to create GATSchemaGATGenerativeRequestEventEnded instance.", v17, 2u);
      MEMORY[0x25336AD50](v17, -1, -1);
    }
  }
}

void sub_24FA6AA0C(uint64_t a1, uint64_t a2)
{
  os_log_t v4 = &off_26533F000;
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DD38]), sel_init);
  if (v5)
  {
    os_log_type_t v6 = v5;
    objc_msgSend(v5, sel_setErrorCode_, a1);
    objc_msgSend(v6, sel_setErrorDomain_, a2);
    if (qword_269A49948 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_24FA757A8();
    __swift_project_value_buffer(v7, (uint64_t)qword_269A49C70);
    os_log_t v8 = v6;
    id v9 = sub_24FA75788();
    os_log_type_t v10 = sub_24FA758B8();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v34 = v12;
      *(_DWORD *)uint64_t v11 = 136315138;
      unint64_t v13 = v8;
      id v14 = [v13 description];
      uint64_t v15 = sub_24FA75808();
      os_log_t osloga = v8;
      unint64_t v17 = v16;

      sub_24FA602C0(v15, v17, &v34);
      sub_24FA75958();

      os_log_t v8 = osloga;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24FA58000, v9, v10, "Record the SELFUtils.recordGenerativeRequestFailed() with failed event: %s", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25336AD50](v12, -1, -1);
      id v18 = v11;
      os_log_t v4 = &off_26533F000;
      MEMORY[0x25336AD50](v18, -1, -1);
    }
    else
    {
    }
    id v22 = [objc_allocWithZone(MEMORY[0x263F6DD28]) (SEL)v4[7]];
    if (v22)
    {
      os_log_type_t v23 = v22;
      objc_msgSend(v22, sel_setFailed_, v8);
      id v24 = [objc_allocWithZone(MEMORY[0x263F6DCF8]) (SEL)v4[7]];
      if (v24)
      {
        os_log_type_t v25 = v24;
        objc_msgSend(v24, sel_setGenerativeRequestContext_, v23);
        sub_24FA652E4(v25);

        return;
      }
      id v29 = sub_24FA75788();
      os_log_type_t v30 = sub_24FA758C8();
      if (os_log_type_enabled(v29, v30))
      {
        os_log_type_t v31 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v31 = 0;
        _os_log_impl(&dword_24FA58000, v29, v30, "Failed to create GATSchemaGATClientEvent instance.", v31, 2u);
        MEMORY[0x25336AD50](v31, -1, -1);

        return;
      }
    }
    else
    {
      os_log_type_t v26 = sub_24FA75788();
      os_log_type_t v27 = sub_24FA758C8();
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v28 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v28 = 0;
        _os_log_impl(&dword_24FA58000, v26, v27, "Failed to create GATSchemaGATGenerativeRequestContext instance.", v28, 2u);
        MEMORY[0x25336AD50](v28, -1, -1);

        return;
      }
    }
  }
  else
  {
    if (qword_269A49948 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_24FA757A8();
    __swift_project_value_buffer(v19, (uint64_t)qword_269A49C70);
    os_log_t oslog = sub_24FA75788();
    os_log_type_t v20 = sub_24FA758C8();
    if (os_log_type_enabled(oslog, v20))
    {
      unint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v21 = 0;
      _os_log_impl(&dword_24FA58000, oslog, v20, "Failed to create GATSchemaGATGenerativeRequestEventFailed instance.", v21, 2u);
      MEMORY[0x25336AD50](v21, -1, -1);
    }
  }
}

void sub_24FA6AEA8()
{
  uint64_t v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DD60]), sel_init);
  if (!v0)
  {
    if (qword_269A49948 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_24FA757A8();
    __swift_project_value_buffer(v5, (uint64_t)qword_269A49C70);
    os_log_t oslog = sub_24FA75788();
    os_log_type_t v6 = sub_24FA758C8();
    if (os_log_type_enabled(oslog, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_24FA58000, oslog, v6, "Failed to create GATSchemaGATImageResizingEventEnded instance.", v7, 2u);
      MEMORY[0x25336AD50](v7, -1, -1);
    }
    goto LABEL_18;
  }
  id v1 = v0;
  [v0 setExist:1];
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DD48]), sel_init);
  if (v2)
  {
    uint64_t v3 = v2;
    objc_msgSend(v2, sel_setStartedOrChanged_, v1);
    os_log_t v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DCF8]), sel_init);
    if (v4)
    {
      os_log_t oslog = v4;
      [v4 setImageResizingContext:v3];
      sub_24FA652E4(oslog);
LABEL_17:

      goto LABEL_18;
    }
    if (qword_269A49948 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_24FA757A8();
    __swift_project_value_buffer(v11, (uint64_t)qword_269A49C70);
    os_log_t oslog = sub_24FA75788();
    os_log_type_t v12 = sub_24FA758C8();
    if (os_log_type_enabled(oslog, v12))
    {
      unint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v13 = 0;
      _os_log_impl(&dword_24FA58000, oslog, v12, "Failed to create GATSchemaGATClientEvent instance.", v13, 2u);
      MEMORY[0x25336AD50](v13, -1, -1);
      goto LABEL_17;
    }

    id v14 = v1;
  }
  else
  {
    if (qword_269A49948 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_24FA757A8();
    __swift_project_value_buffer(v8, (uint64_t)qword_269A49C70);
    os_log_t oslog = sub_24FA75788();
    os_log_type_t v9 = sub_24FA758C8();
    if (os_log_type_enabled(oslog, v9))
    {
      os_log_type_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v10 = 0;
      _os_log_impl(&dword_24FA58000, oslog, v9, "Failed to create GATSchemaGATImageResizingContext instance.", v10, 2u);
      MEMORY[0x25336AD50](v10, -1, -1);

LABEL_18:
      id v14 = oslog;
      goto LABEL_19;
    }

    id v14 = v1;
  }
LABEL_19:
}

void sub_24FA6B1C4(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = &off_26533F000;
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DD50]), sel_init);
  if (!v9)
  {
    if (qword_269A49948 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_24FA757A8();
    __swift_project_value_buffer(v11, (uint64_t)qword_269A49C70);
    os_log_t oslog = sub_24FA75788();
    os_log_type_t v12 = sub_24FA758C8();
    if (os_log_type_enabled(oslog, v12))
    {
      unint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v13 = 0;
      _os_log_impl(&dword_24FA58000, oslog, v12, "Failed to create GATSchemaGATImageResizingEventEnded instance.", v13, 2u);
      MEMORY[0x25336AD50](v13, -1, -1);
    }

    return;
  }
  os_log_type_t v10 = v9;
  if ((a1 & 0x100000000) == 0) {
    goto LABEL_3;
  }
  swift_beginAccess();
  if ((*(unsigned char *)(v4 + 73) & 1) == 0 && (*(unsigned char *)(v4 + 56) & 1) == 0)
  {
    a1 = *(unsigned int *)(v4 + 52);
LABEL_3:
    objc_msgSend(v10, sel_setProcessedMediaType_, a1);
  }
  if (a3)
  {
    swift_beginAccess();
    if (*(unsigned char *)(v4 + 73) & 1) != 0 || (*(unsigned char *)(v4 + 72)) {
      goto LABEL_19;
    }
    a2 = *(void *)(v4 + 64);
  }
  objc_msgSend(v10, sel_setProcessedMediaSizeInKBs_, *(double *)&a2);
LABEL_19:
  if (qword_269A49948 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_24FA757A8();
  __swift_project_value_buffer(v14, (uint64_t)qword_269A49C70);
  id v15 = v10;
  unint64_t v16 = sub_24FA75788();
  os_log_type_t v17 = sub_24FA758B8();
  if (os_log_type_enabled(v16, v17))
  {
    id v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    uint64_t v38 = v19;
    *(_DWORD *)id v18 = 136315138;
    id v20 = v15;
    id v21 = objc_msgSend(v20, sel_description);
    uint64_t v22 = sub_24FA75808();
    id v36 = v15;
    unint64_t v24 = v23;

    sub_24FA602C0(v22, v24, &v38);
    sub_24FA75958();

    id v15 = v36;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24FA58000, v16, v17, "Record the SELFUtils.recordImageResizingEnded() with end event: %s", v18, 0xCu);
    swift_arrayDestroy();
    uint64_t v25 = v19;
    uint64_t v8 = &off_26533F000;
    MEMORY[0x25336AD50](v25, -1, -1);
    MEMORY[0x25336AD50](v18, -1, -1);
  }
  else
  {
  }
  id v26 = [objc_allocWithZone(MEMORY[0x263F6DD48]) (SEL)v8[7]];
  if (v26)
  {
    os_log_type_t v27 = v26;
    objc_msgSend(v26, sel_setEnded_, v15);
    id v28 = [objc_allocWithZone(MEMORY[0x263F6DCF8]) (SEL)v8[7]];
    if (v28)
    {
      id v29 = v28;
      objc_msgSend(v28, sel_setImageResizingContext_, v27);
      sub_24FA652E4(v29);

      return;
    }
    os_log_type_t v33 = sub_24FA75788();
    os_log_type_t v34 = sub_24FA758C8();
    if (os_log_type_enabled(v33, v34))
    {
      os_log_type_t v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v35 = 0;
      _os_log_impl(&dword_24FA58000, v33, v34, "Failed to create GATSchemaGATClientEvent instance.", v35, 2u);
      MEMORY[0x25336AD50](v35, -1, -1);

      return;
    }
  }
  else
  {
    os_log_type_t v30 = sub_24FA75788();
    os_log_type_t v31 = sub_24FA758C8();
    if (os_log_type_enabled(v30, v31))
    {
      os_log_type_t v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v32 = 0;
      _os_log_impl(&dword_24FA58000, v30, v31, "Failed to create GATSchemaGATImageResizingContext instance.", v32, 2u);
      MEMORY[0x25336AD50](v32, -1, -1);

      return;
    }
  }
}

void sub_24FA6B6C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = &off_26533F000;
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DD58]), sel_init);
  if (v5)
  {
    os_log_type_t v6 = v5;
    objc_msgSend(v5, sel_setErrorCode_, a1);
    objc_msgSend(v6, sel_setErrorDomain_, a2);
    if (qword_269A49948 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_24FA757A8();
    __swift_project_value_buffer(v7, (uint64_t)qword_269A49C70);
    os_log_t v8 = v6;
    id v9 = sub_24FA75788();
    os_log_type_t v10 = sub_24FA758B8();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v34 = v12;
      *(_DWORD *)uint64_t v11 = 136315138;
      unint64_t v13 = v8;
      id v14 = [v13 description];
      uint64_t v15 = sub_24FA75808();
      os_log_t osloga = v8;
      unint64_t v17 = v16;

      sub_24FA602C0(v15, v17, &v34);
      sub_24FA75958();

      os_log_t v8 = osloga;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24FA58000, v9, v10, "Record the SELFUtils.recordImageResizingFailed() with failed event: %s", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25336AD50](v12, -1, -1);
      id v18 = v11;
      uint64_t v4 = &off_26533F000;
      MEMORY[0x25336AD50](v18, -1, -1);
    }
    else
    {
    }
    id v22 = [objc_allocWithZone(MEMORY[0x263F6DD48]) (SEL)v4[7]];
    if (v22)
    {
      unint64_t v23 = v22;
      objc_msgSend(v22, sel_setFailed_, v8);
      id v24 = [objc_allocWithZone(MEMORY[0x263F6DCF8]) (SEL)v4[7]];
      if (v24)
      {
        uint64_t v25 = v24;
        objc_msgSend(v24, sel_setImageResizingContext_, v23);
        sub_24FA652E4(v25);

        return;
      }
      id v29 = sub_24FA75788();
      os_log_type_t v30 = sub_24FA758C8();
      if (os_log_type_enabled(v29, v30))
      {
        os_log_type_t v31 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v31 = 0;
        _os_log_impl(&dword_24FA58000, v29, v30, "Failed to create GATSchemaGATClientEvent instance.", v31, 2u);
        MEMORY[0x25336AD50](v31, -1, -1);

        return;
      }
    }
    else
    {
      id v26 = sub_24FA75788();
      os_log_type_t v27 = sub_24FA758C8();
      if (os_log_type_enabled(v26, v27))
      {
        id v28 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v28 = 0;
        _os_log_impl(&dword_24FA58000, v26, v27, "Failed to create GATSchemaGATImageResizingContext instance.", v28, 2u);
        MEMORY[0x25336AD50](v28, -1, -1);

        return;
      }
    }
  }
  else
  {
    if (qword_269A49948 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_24FA757A8();
    __swift_project_value_buffer(v19, (uint64_t)qword_269A49C70);
    os_log_t oslog = sub_24FA75788();
    os_log_type_t v20 = sub_24FA758C8();
    if (os_log_type_enabled(oslog, v20))
    {
      id v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v21 = 0;
      _os_log_impl(&dword_24FA58000, oslog, v20, "Failed to create GATSchemaGATImageResizingEventFailed instance.", v21, 2u);
      MEMORY[0x25336AD50](v21, -1, -1);
    }
  }
}

uint64_t SELFUtils.deinit()
{
  sub_24FA6C7B4(v0 + OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_gatID);
  return v0;
}

uint64_t SELFUtils.__deallocating_deinit()
{
  sub_24FA6C7B4((uint64_t)v0 + OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_gatID);
  uint64_t v1 = *((unsigned int *)*v0 + 12);
  uint64_t v2 = *((unsigned __int16 *)*v0 + 26);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

unint64_t GATAttachedMediaInfo.originalMediaType.getter()
{
  return *v0 | ((unint64_t)*((unsigned __int8 *)v0 + 4) << 32);
}

uint64_t GATAttachedMediaInfo.originalMediaType.setter(uint64_t result)
{
  *(_DWORD *)uint64_t v1 = result;
  *(unsigned char *)(v1 + 4) = BYTE4(result) & 1;
  return result;
}

uint64_t (*GATAttachedMediaInfo.originalMediaType.modify())()
{
  return nullsub_1;
}

uint64_t GATAttachedMediaInfo.originalMediaSizeInKBs.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t GATAttachedMediaInfo.originalMediaSizeInKBs.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 8) = result;
  *(unsigned char *)(v2 + 16) = a2 & 1;
  return result;
}

uint64_t (*GATAttachedMediaInfo.originalMediaSizeInKBs.modify())()
{
  return nullsub_1;
}

unint64_t GATAttachedMediaInfo.mediaQAUseCase.getter()
{
  return *(unsigned int *)(v0 + 20) | ((unint64_t)*(unsigned __int8 *)(v0 + 24) << 32);
}

uint64_t GATAttachedMediaInfo.mediaQAUseCase.setter(uint64_t result)
{
  *(_DWORD *)(v1 + 20) = result;
  *(unsigned char *)(v1 + 24) = BYTE4(result) & 1;
  return result;
}

uint64_t (*GATAttachedMediaInfo.mediaQAUseCase.modify())()
{
  return nullsub_1;
}

unint64_t GATAttachedMediaInfo.gatUsecase.getter()
{
  return *(unsigned int *)(v0 + 28) | ((unint64_t)*(unsigned __int8 *)(v0 + 32) << 32);
}

uint64_t GATAttachedMediaInfo.gatUsecase.setter(uint64_t result)
{
  *(_DWORD *)(v1 + 28) = result;
  *(unsigned char *)(v1 + 32) = BYTE4(result) & 1;
  return result;
}

uint64_t (*GATAttachedMediaInfo.gatUsecase.modify())()
{
  return nullsub_1;
}

unint64_t GATAttachedMediaInfo.processedMediaType.getter()
{
  return *(unsigned int *)(v0 + 36) | ((unint64_t)*(unsigned __int8 *)(v0 + 40) << 32);
}

uint64_t GATAttachedMediaInfo.processedMediaType.setter(uint64_t result)
{
  *(_DWORD *)(v1 + 36) = result;
  *(unsigned char *)(v1 + 40) = BYTE4(result) & 1;
  return result;
}

uint64_t (*GATAttachedMediaInfo.processedMediaType.modify())()
{
  return nullsub_1;
}

uint64_t GATAttachedMediaInfo.processedMediaSizeInKBs.getter()
{
  return *(void *)(v0 + 48);
}

uint64_t GATAttachedMediaInfo.processedMediaSizeInKBs.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 48) = result;
  *(unsigned char *)(v2 + 56) = a2 & 1;
  return result;
}

uint64_t (*GATAttachedMediaInfo.processedMediaSizeInKBs.modify())()
{
  return nullsub_1;
}

uint64_t GATAttachedMediaInfo.init(originalMediaType:originalMediaSizeInKBs:mediaQAUseCase:gatUsecase:processedMediaType:processedMediaSizeInKBs:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char a8@<W7>, uint64_t a9@<X8>)
{
  *(_DWORD *)a9 = result;
  *(unsigned char *)(a9 + 4) = BYTE4(result) & 1;
  *(void *)(a9 + 8) = a2;
  *(unsigned char *)(a9 + 16) = a3 & 1;
  *(_DWORD *)(a9 + 20) = a4;
  *(unsigned char *)(a9 + 24) = BYTE4(a4) & 1;
  *(_DWORD *)(a9 + 28) = a5;
  *(unsigned char *)(a9 + 32) = BYTE4(a5) & 1;
  *(_DWORD *)(a9 + 36) = a6;
  *(unsigned char *)(a9 + 40) = BYTE4(a6) & 1;
  *(void *)(a9 + 48) = a7;
  *(unsigned char *)(a9 + 56) = a8 & 1;
  return result;
}

uint64_t static GATSchemaGATMediaType.from(fileExtension:)()
{
  sub_24FA75828();
  sub_24FA6D60C();
  if (sub_24FA75978() & 1) != 0 || (sub_24FA75978())
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (sub_24FA75978())
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (sub_24FA75978())
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (sub_24FA75978())
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (sub_24FA75978())
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (sub_24FA75978())
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (sub_24FA75978() & 1) != 0 || (sub_24FA75978())
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (sub_24FA75978())
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (sub_24FA75978())
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (sub_24FA75978())
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else
  {
    char v1 = sub_24FA75978();
    swift_bridgeObjectRelease();
    if (v1) {
      return 11;
    }
    else {
      return 0;
    }
  }
}

uint64_t static GATSchemaGATMediaType.from(utType:)(uint64_t a1)
{
  uint64_t v2 = sub_24FA75708();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  os_log_type_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  os_log_t v8 = (char *)&v24 - v7;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v24 - v7, a1, v2);
  sub_24FA756D8();
  sub_24FA6E364(&qword_269A49BF8, MEMORY[0x263F8F3A0]);
  char v9 = sub_24FA757E8();
  os_log_type_t v10 = *(void (**)(char *, uint64_t))(v3 + 8);
  v10(v6, v2);
  if (v9)
  {
    v10(v8, v2);
    return 1;
  }
  else
  {
    sub_24FA756A8();
    char v12 = sub_24FA757E8();
    v10(v6, v2);
    if (v12)
    {
      v10(v8, v2);
      return 2;
    }
    else
    {
      sub_24FA75678();
      char v13 = sub_24FA757E8();
      v10(v6, v2);
      if (v13)
      {
        v10(v8, v2);
        return 3;
      }
      else
      {
        sub_24FA75688();
        char v14 = sub_24FA757E8();
        v10(v6, v2);
        if (v14)
        {
          v10(v8, v2);
          return 5;
        }
        else
        {
          sub_24FA756E8();
          char v15 = sub_24FA757E8();
          v10(v6, v2);
          if (v15)
          {
            v10(v8, v2);
            return 7;
          }
          else
          {
            sub_24FA75698();
            char v16 = sub_24FA757E8();
            v10(v6, v2);
            if (v16)
            {
              v10(v8, v2);
              return 9;
            }
            else
            {
              sub_24FA756F8();
              char v17 = sub_24FA757E8();
              v10(v6, v2);
              if (v17)
              {
                v10(v8, v2);
                return 10;
              }
              else
              {
                sub_24FA756B8();
                char v18 = sub_24FA757E8();
                v10(v6, v2);
                if (v18)
                {
                  v10(v8, v2);
                  return 11;
                }
                else
                {
                  sub_24FA756C8();
                  char v19 = sub_24FA757E8();
                  v10(v6, v2);
                  v10(v8, v2);
                  if (v19)
                  {
                    return 6;
                  }
                  else
                  {
                    uint64_t v26 = sub_24FA75668();
                    uint64_t v27 = v20;
                    uint64_t v24 = 7501925;
                    unint64_t v25 = 0xE300000000000000;
                    sub_24FA6D60C();
                    char v21 = sub_24FA75978();
                    swift_bridgeObjectRelease();
                    if (v21)
                    {
                      return 4;
                    }
                    else
                    {
                      uint64_t v26 = sub_24FA75668();
                      uint64_t v27 = v22;
                      uint64_t v24 = 7501925;
                      unint64_t v25 = 0xE300000000000000;
                      char v23 = sub_24FA75978();
                      swift_bridgeObjectRelease();
                      if (v23) {
                        return 8;
                      }
                      else {
                        return 0;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t GATError.logError()()
{
  uint64_t v1 = *(void *)v0;
  uint64_t v2 = *(void *)(v0 + 8);
  uint64_t v3 = *(unsigned __int8 *)(v0 + 16);
  if (qword_269A49920 != -1) {
    swift_once();
  }
  sub_24FA66A64(v3, 4);
  sub_24FA62B8C();
  uint64_t v4 = swift_allocError();
  *(void *)uint64_t v5 = v1;
  *(void *)(v5 + 8) = v2;
  *(unsigned char *)(v5 + 16) = v3;
  sub_24FA62D8C(v1, v2, v3);
  return v4;
}

uint64_t sub_24FA6C730(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A49BE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24FA6C798(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 121)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_24FA6C7B4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A49BD8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_24FA6C814()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A49BD8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v2 = (char *)&v35 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_24FA755A8();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  char v9 = (char *)&v35 - v8;
  uint64_t v10 = v0 + 80;
  swift_beginAccess();
  if (*(void *)(v0 + 80))
  {
    if (qword_269A49948 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_24FA757A8();
    __swift_project_value_buffer(v11, (uint64_t)qword_269A49C70);
    char v12 = sub_24FA75788();
    os_log_type_t v13 = sub_24FA758B8();
    if (os_log_type_enabled(v12, v13))
    {
      char v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v14 = 0;
      _os_log_impl(&dword_24FA58000, v12, v13, "using shared current session metadata", v14, 2u);
      MEMORY[0x25336AD50](v14, -1, -1);
    }
  }
  else
  {
    sub_24FA75598();
    char v15 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
    v15(v2, v9, v3);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v4 + 56))(v2, 0, 1, v3);
    uint64_t v16 = v0 + OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_gatID;
    swift_beginAccess();
    sub_24FA64A04((uint64_t)v2, v16);
    swift_endAccess();
    char v17 = (void (*)(char *, char *, uint64_t))objc_msgSend(objc_allocWithZone(MEMORY[0x263F6DD00]), sel_init);
    if (v17)
    {
      id v18 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
      id v37 = v15;
      id v19 = v18;
      uint64_t v20 = v17;
      char v21 = (void *)sub_24FA75588();
      id v22 = objc_msgSend(v19, sel_initWithNSUUID_, v21);

      objc_msgSend(v20, sel_setGatId_, v22);
      char v15 = v37;
    }
    if (qword_269A49948 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_24FA757A8();
    __swift_project_value_buffer(v23, (uint64_t)qword_269A49C70);
    v15(v7, v9, v3);
    uint64_t v24 = sub_24FA75788();
    os_log_type_t v25 = sub_24FA758B8();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = swift_slowAlloc();
      id v37 = v17;
      uint64_t v27 = (uint8_t *)v26;
      uint64_t v36 = swift_slowAlloc();
      v39[0] = v36;
      *(_DWORD *)uint64_t v27 = 136315138;
      os_log_type_t v35 = v27 + 4;
      sub_24FA6E364(&qword_269A49C18, MEMORY[0x263F07508]);
      uint64_t v28 = sub_24FA75A98();
      uint64_t v38 = sub_24FA602C0(v28, v29, v39);
      sub_24FA75958();
      swift_bridgeObjectRelease();
      os_log_type_t v30 = *(void (**)(char *, uint64_t))(v4 + 8);
      v30(v7, v3);
      _os_log_impl(&dword_24FA58000, v24, v25, "Created event metadata with unique GAT ID: %s", v27, 0xCu);
      uint64_t v31 = v36;
      swift_arrayDestroy();
      MEMORY[0x25336AD50](v31, -1, -1);
      os_log_type_t v32 = v27;
      char v17 = v37;
      MEMORY[0x25336AD50](v32, -1, -1);
    }
    else
    {
      os_log_type_t v30 = *(void (**)(char *, uint64_t))(v4 + 8);
      v30(v7, v3);
    }

    os_log_type_t v33 = *(void **)v10;
    *(void *)uint64_t v10 = v17;

    v30(v9, v3);
  }
  return *(void **)v10;
}

void sub_24FA6CD14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_24FA757A8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EDB8]), sel_init);
  if (!v9)
  {
    if (qword_269A49948 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v5, (uint64_t)qword_269A49C70);
    os_log_t v56 = (os_log_t)sub_24FA75788();
    os_log_type_t v33 = sub_24FA758C8();
    if (os_log_type_enabled(v56, v33))
    {
      uint64_t v34 = swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      uint64_t v58 = v35;
      *(_DWORD *)uint64_t v34 = 136315394;
      uint64_t v36 = sub_24FA75908();
      uint64_t v57 = sub_24FA602C0(v36, v37, &v58);
      sub_24FA75958();
      swift_bridgeObjectRelease();
      *(_WORD *)(v34 + 12) = 2080;
      uint64_t v38 = sub_24FA75908();
      uint64_t v57 = sub_24FA602C0(v38, v39, &v58);
      sub_24FA75958();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24FA58000, v56, v33, "Failed to create RequestLink event for source component: %s and target component: %s", (uint8_t *)v34, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25336AD50](v35, -1, -1);
      MEMORY[0x25336AD50](v34, -1, -1);

      return;
    }
LABEL_27:
    os_log_t v51 = v56;
    goto LABEL_28;
  }
  os_log_type_t v55 = v9;
  os_log_t v56 = (os_log_t)objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EDC0]), sel_init);
  if (v56)
  {
    id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6EDC0]), sel_init);
    if (v10)
    {
      uint64_t v53 = v6;
      id v54 = v10;
      [v56 setComponent:a1];
      id v11 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
      char v12 = (void *)sub_24FA75588();
      id v13 = objc_msgSend(v11, sel_initWithNSUUID_, v12);

      [v56 setUuid:v13];
      id v14 = v54;
      objc_msgSend(v54, sel_setComponent_, a3);
      id v15 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
      uint64_t v16 = (void *)sub_24FA75588();
      id v17 = objc_msgSend(v15, sel_initWithNSUUID_, v16);

      objc_msgSend(v14, sel_setUuid_, v17);
      [v55 setSource:v56];
      [v55 setTarget:v14];
      if (qword_269A49948 != -1) {
        swift_once();
      }
      uint64_t v18 = __swift_project_value_buffer(v5, (uint64_t)qword_269A49C70);
      id v19 = sub_24FA75788();
      os_log_type_t v20 = sub_24FA758B8();
      BOOL v21 = os_log_type_enabled(v19, v20);
      uint64_t v22 = v53;
      if (v21)
      {
        uint64_t v23 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v23 = 0;
        _os_log_impl(&dword_24FA58000, v19, v20, "SELFUtils.emitMessage(requestLink)", v23, 2u);
        MEMORY[0x25336AD50](v23, -1, -1);
      }

      (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v8, v18, v5);
      uint64_t v24 = v55;
      os_log_type_t v25 = sub_24FA75788();
      os_log_type_t v26 = sub_24FA758B8();
      if (os_log_type_enabled(v25, v26))
      {
        uint64_t v27 = (uint8_t *)swift_slowAlloc();
        os_log_type_t v55 = swift_slowAlloc();
        uint64_t v58 = (uint64_t)v55;
        *(_DWORD *)uint64_t v27 = 136315138;
        id v28 = [v24 formattedJsonBody];
        if (v28)
        {
          unint64_t v29 = v28;
          uint64_t v30 = sub_24FA75808();
          unint64_t v32 = v31;
        }
        else
        {
          unint64_t v32 = 0xE500000000000000;
          uint64_t v30 = 0x7974706D65;
        }
        uint64_t v57 = sub_24FA602C0(v30, v32, &v58);
        sub_24FA75958();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24FA58000, v25, v26, "requestLink...\n%s", v27, 0xCu);
        uint64_t v52 = v55;
        swift_arrayDestroy();
        MEMORY[0x25336AD50](v52, -1, -1);
        MEMORY[0x25336AD50](v27, -1, -1);

        (*(void (**)(char *, uint64_t))(v22 + 8))(v8, v5);
        id v14 = v54;
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v22 + 8))(v8, v5);
      }
      objc_msgSend(objc_msgSend(self, sel_sharedStream), sel_emitMessage_, v24);

      swift_unknownObjectRelease();
      return;
    }
    if (qword_269A49948 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v5, (uint64_t)qword_269A49C70);
    id v40 = sub_24FA75788();
    os_log_type_t v46 = sub_24FA758C8();
    if (os_log_type_enabled(v40, v46))
    {
      uint64_t v47 = (uint8_t *)swift_slowAlloc();
      uint64_t v48 = swift_slowAlloc();
      uint64_t v58 = v48;
      *(_DWORD *)uint64_t v47 = 136315138;
      uint64_t v49 = sub_24FA75908();
      uint64_t v57 = sub_24FA602C0(v49, v50, &v58);
      sub_24FA75958();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24FA58000, v40, v46, "Failed to create target link event for target component: %s", v47, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25336AD50](v48, -1, -1);
      MEMORY[0x25336AD50](v47, -1, -1);

      goto LABEL_23;
    }

    goto LABEL_27;
  }
  if (qword_269A49948 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v5, (uint64_t)qword_269A49C70);
  id v40 = sub_24FA75788();
  os_log_type_t v41 = sub_24FA758C8();
  if (os_log_type_enabled(v40, v41))
  {
    char v42 = (uint8_t *)swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    uint64_t v58 = v43;
    *(_DWORD *)char v42 = 136315138;
    uint64_t v44 = sub_24FA75908();
    uint64_t v57 = sub_24FA602C0(v44, v45, &v58);
    sub_24FA75958();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24FA58000, v40, v41, "Failed to create source link event for source component: %s", v42, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25336AD50](v43, -1, -1);
    MEMORY[0x25336AD50](v42, -1, -1);
LABEL_23:

    return;
  }

  os_log_t v51 = v55;
LABEL_28:
}

unint64_t sub_24FA6D60C()
{
  unint64_t result = qword_269A49BF0;
  if (!qword_269A49BF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A49BF0);
  }
  return result;
}

id sub_24FA6D668@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void **)(v3 + 80);
  *a2 = v4;
  return v4;
}

uint64_t sub_24FA6D6C4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_gatID;
  swift_beginAccess();
  return sub_24FA64940(v3, a2);
}

uint64_t sub_24FA6D720@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return keypath_get_9Tm(a1, &OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_gatUsecase, a2);
}

uint64_t sub_24FA6D72C(int *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_10Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_gatUsecase);
}

uint64_t sub_24FA6D738@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return keypath_get_9Tm(a1, &OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_generativeResultCharactersCount, a2);
}

uint64_t keypath_get_9Tm@<X0>(void *a1@<X0>, void *a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v4 = *a1 + *a2;
  uint64_t result = swift_beginAccess();
  char v6 = *(unsigned char *)(v4 + 4);
  *(_DWORD *)a3 = *(_DWORD *)v4;
  *(unsigned char *)(a3 + 4) = v6;
  return result;
}

uint64_t sub_24FA6D79C(int *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_10Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_generativeResultCharactersCount);
}

uint64_t keypath_set_10Tm(int *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  int v5 = *a1;
  char v6 = *((unsigned char *)a1 + 4);
  uint64_t v7 = *a2 + *a5;
  uint64_t result = swift_beginAccess();
  *(_DWORD *)uint64_t v7 = v5;
  *(unsigned char *)(v7 + 4) = v6;
  return result;
}

uint64_t sub_24FA6D804@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_13Tm(a1, &OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_didRequestFailed, a2);
}

uint64_t sub_24FA6D810(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_14Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_didRequestFailed);
}

uint64_t sub_24FA6D81C@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_13Tm(a1, &OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_didRequestCancelled, a2);
}

uint64_t sub_24FA6D828(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_14Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_didRequestCancelled);
}

uint64_t sub_24FA6D834@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_13Tm(a1, &OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_didRequestHandOffToTA, a2);
}

uint64_t keypath_get_13Tm@<X0>(void *a1@<X0>, void *a2@<X3>, unsigned char *a3@<X8>)
{
  uint64_t v4 = (unsigned char *)(*a1 + *a2);
  uint64_t result = swift_beginAccess();
  *a3 = *v4;
  return result;
}

uint64_t sub_24FA6D890(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_14Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC25GenerativeAssistantCommon9SELFUtils_didRequestHandOffToTA);
}

uint64_t keypath_set_14Tm(char *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  char v5 = *a1;
  char v6 = (unsigned char *)(*a2 + *a5);
  uint64_t result = swift_beginAccess();
  *char v6 = v5;
  return result;
}

uint64_t sub_24FA6D8E8()
{
  return type metadata accessor for SELFUtils();
}

uint64_t type metadata accessor for SELFUtils()
{
  uint64_t result = qword_269A49C00;
  if (!qword_269A49C00) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_24FA6D93C()
{
  sub_24FA6E250();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for SELFUtils(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SELFUtils);
}

uint64_t dispatch thunk of SELFUtils.gatMediaInfo.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of SELFUtils.gatMediaInfo.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of SELFUtils.gatMediaInfo.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of SELFUtils.currentLoggingCycleMetadata.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of SELFUtils.currentLoggingCycleMetadata.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of SELFUtils.currentLoggingCycleMetadata.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of SELFUtils.gatID.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of SELFUtils.gatID.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of SELFUtils.gatID.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of SELFUtils.gatUsecase.getter()
{
  unint64_t v1 = (*(uint64_t (**)(void))(*(void *)v0 + 216))();
  return v1 | ((HIDWORD(v1) & 1) << 32);
}

uint64_t dispatch thunk of SELFUtils.gatUsecase.setter(unint64_t a1)
{
  return (*(uint64_t (**)(unint64_t))(*(void *)v1 + 224))(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t dispatch thunk of SELFUtils.gatUsecase.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of SELFUtils.generativeResultCharactersCount.getter()
{
  unint64_t v1 = (*(uint64_t (**)(void))(*(void *)v0 + 240))();
  return v1 | ((HIDWORD(v1) & 1) << 32);
}

uint64_t dispatch thunk of SELFUtils.generativeResultCharactersCount.setter(unint64_t a1)
{
  return (*(uint64_t (**)(unint64_t))(*(void *)v1 + 248))(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t dispatch thunk of SELFUtils.generativeResultCharactersCount.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of SELFUtils.didRequestFailed.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t dispatch thunk of SELFUtils.didRequestFailed.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of SELFUtils.didRequestFailed.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

uint64_t dispatch thunk of SELFUtils.didRequestCancelled.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

uint64_t dispatch thunk of SELFUtils.didRequestCancelled.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 296))();
}

uint64_t dispatch thunk of SELFUtils.didRequestCancelled.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 304))();
}

uint64_t dispatch thunk of SELFUtils.didRequestHandOffToTA.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 312))();
}

uint64_t dispatch thunk of SELFUtils.didRequestHandOffToTA.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320))();
}

uint64_t dispatch thunk of SELFUtils.didRequestHandOffToTA.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 328))();
}

uint64_t dispatch thunk of SELFUtils.cleanCurrentSessionData()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 344))();
}

uint64_t dispatch thunk of SELFUtils.createPerformanceMetrics()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 376))();
}

uint64_t dispatch thunk of SELFUtils.recordRequestStarted(clientTraceId:appIntentName:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 384))();
}

uint64_t dispatch thunk of SELFUtils.recordRequestEnded()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 392))();
}

uint64_t dispatch thunk of SELFUtils.recordRequestFailed(code:domain:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 400))();
}

uint64_t dispatch thunk of SELFUtils.recordRequestCanceled()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 408))();
}

uint64_t dispatch thunk of SELFUtils.recordRequestHandoff()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 416))();
}

uint64_t dispatch thunk of SELFUtils.recordLoadScreenContentStarted()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 424))();
}

uint64_t dispatch thunk of SELFUtils.recordLoadScreenContentEnded(originalMediaType:originalMediaSizeInKBs:)(unint64_t a1, uint64_t a2, char a3)
{
  return (*(uint64_t (**)(unint64_t, uint64_t, void))(*(void *)v3 + 432))(a1 | ((HIDWORD(a1) & 1) << 32), a2, a3 & 1);
}

uint64_t dispatch thunk of SELFUtils.recordLoadScreenContentFailed(code:domain:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 440))();
}

uint64_t dispatch thunk of SELFUtils.recordCreateSessionStarted()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 448))();
}

uint64_t dispatch thunk of SELFUtils.recordCreateSessionEnded()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 456))();
}

uint64_t dispatch thunk of SELFUtils.recordCreateSessionFailed(code:domain:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 464))();
}

uint64_t dispatch thunk of SELFUtils.recordRegisterMediaStarted()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 472))();
}

uint64_t dispatch thunk of SELFUtils.recordRegisterMediaEnded()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 480))();
}

uint64_t dispatch thunk of SELFUtils.recordRegisterMediaFailed(code:domain:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 488))();
}

uint64_t dispatch thunk of SELFUtils.recordGenerativeRequestStarted(usecase:mediaQAUseCase:llmAgentName:)(unint64_t a1, unint64_t a2)
{
  return (*(uint64_t (**)(unint64_t, unint64_t))(*(void *)v2 + 496))(a1 | ((HIDWORD(a1) & 1) << 32), a2 | ((HIDWORD(a2) & 1) << 32));
}

uint64_t dispatch thunk of SELFUtils.recordGenerativeRequestEnded()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 504))();
}

uint64_t dispatch thunk of SELFUtils.recordGenerativeRequestFailed(code:domain:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 512))();
}

uint64_t dispatch thunk of SELFUtils.recordImageResizingStarted()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 520))();
}

uint64_t dispatch thunk of SELFUtils.recordImageResizingEnded(processedMediaType:processedMediaSizeInKBs:)(unint64_t a1, uint64_t a2, char a3)
{
  return (*(uint64_t (**)(unint64_t, uint64_t, void))(*(void *)v3 + 528))(a1 | ((HIDWORD(a1) & 1) << 32), a2, a3 & 1);
}

uint64_t dispatch thunk of SELFUtils.recordImageResizingFailed(code:domain:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 536))();
}

void sub_24FA6E250()
{
  if (!qword_269A49C10)
  {
    sub_24FA755A8();
    unint64_t v0 = sub_24FA75948();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269A49C10);
    }
  }
}

uint64_t initializeBufferWithCopyOfBuffer for GATAttachedMediaInfo(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
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

uint64_t getEnumTagSinglePayload for GATAttachedMediaInfo(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 57)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for GATAttachedMediaInfo(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 56) = 0;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 57) = v3;
  return result;
}

ValueMetadata *type metadata accessor for GATAttachedMediaInfo()
{
  return &type metadata for GATAttachedMediaInfo;
}

uint64_t sub_24FA6E364(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24FA6E3AC()
{
  uint64_t v0 = sub_24FA757A8();
  __swift_allocate_value_buffer(v0, qword_269A49C20);
  __swift_project_value_buffer(v0, (uint64_t)qword_269A49C20);
  return sub_24FA75798();
}

uint64_t static Logger.restrictions.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_269A49928 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24FA757A8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269A49C20);
  long long v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

void sub_24FA6E4D8()
{
  off_269A49C38 = &unk_27011E2D0;
}

uint64_t static GenerativeAssistantRestrictionManager.useCases.getter()
{
  if (qword_269A49930 != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

Swift::Bool __swiftcall GenerativeAssistantRestrictionManager.isUseCaseAvailable(useCase:)(GenerativeAssistantCommon::GenerativeAssistantUseCase useCase)
{
  v18[1] = useCase;
  uint64_t v1 = sub_24FA75608();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  char v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)v18 - v6;
  uint64_t v8 = sub_24FA75628();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = (char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24FA75658();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  id v15 = (char *)v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24FA75618();
  sub_24FA75648();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_24FA75638();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v5, *MEMORY[0x263F41150], v1);
  LOBYTE(v8) = sub_24FA755F8();
  uint64_t v16 = *(void (**)(char *, uint64_t))(v2 + 8);
  v16(v5, v1);
  v16(v7, v1);
  return v8 & 1;
}

uint64_t GenerativeAssistantRestrictionManager.isMontaraHardDisabled.getter()
{
  uint64_t v0 = sub_24FA755C8();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)v37 - v5;
  uint64_t v54 = sub_24FA755E8();
  unint64_t v7 = *(void *)(v54 - 8);
  MEMORY[0x270FA5388](v54);
  uint64_t v9 = (char *)v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = sub_24FA75628();
  uint64_t v65 = *(void *)(v58 - 8);
  MEMORY[0x270FA5388](v58);
  uint64_t v57 = (char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_24FA75658();
  uint64_t v64 = *(void *)(v56 - 8);
  MEMORY[0x270FA5388](v56);
  os_log_type_t v55 = (char *)v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24FA75608();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (void (**)(char *, uint64_t))((char *)v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v14);
  uint64_t v61 = (char *)v37 - v17;
  if (qword_269A49930 != -1) {
    goto LABEL_40;
  }
  while (1)
  {
    uint64_t v18 = off_269A49C38;
    uint64_t v44 = *((void *)off_269A49C38 + 2);
    if (!v44) {
      return 0;
    }
    uint64_t v60 = v16;
    uint64_t v52 = (void (**)(char *, uint64_t))(v65 + 8);
    uint64_t v53 = (char *)off_269A49C38 + 32;
    unint64_t v50 = (void (**)(void (**)(char *, uint64_t), char *, uint64_t))(v13 + 16);
    os_log_t v51 = (void (**)(char *, uint64_t))(v64 + 8);
    uint64_t v49 = (uint64_t (**)(void, uint64_t))(v13 + 88);
    int v48 = *MEMORY[0x263F40F98];
    int v43 = *MEMORY[0x263F40FA8];
    os_log_type_t v46 = (void (**)(char *, uint64_t))(v13 + 8);
    char v42 = (void (**)(void, uint64_t))(v13 + 96);
    os_log_type_t v41 = (void (**)(char *, void (**)(char *, uint64_t), uint64_t))(v7 + 32);
    uint64_t v64 = v1 + 32;
    uint64_t v65 = v1 + 16;
    uint64_t v63 = v1 + 88;
    int v62 = *MEMORY[0x263F40FC8];
    uint64_t v16 = (void (**)(char *, uint64_t))(v1 + 8);
    uint64_t v38 = (void (**)(char *, uint64_t))(v7 + 8);
    swift_bridgeObjectRetain();
    unint64_t v19 = 0;
    uint64_t v47 = &unk_24FA77330;
    v37[4] = "GenerativeAssistant.composition";
    v37[3] = "GenerativeAssistant.mediaQA";
    v37[2] = "GenerativeAssistant.knowledge";
    v37[1] = "ant.knowledgeFallback";
    id v40 = v9;
    uint64_t v39 = v12;
    unint64_t v45 = v18;
    while (v19 < v18[2])
    {
      unint64_t v59 = v19 + 1;
      os_log_type_t v20 = v57;
      sub_24FA75618();
      BOOL v21 = v55;
      sub_24FA75648();
      (*v52)(v20, v58);
      uint64_t v22 = v61;
      sub_24FA75638();
      (*v51)(v21, v56);
      uint64_t v23 = v60;
      (*v50)(v60, v22, v12);
      uint64_t v24 = (*v49)(v23, v12);
      if (v24 == v48)
      {
        (*v42)(v23, v12);
        (*v41)(v9, v23, v54);
        uint64_t v25 = sub_24FA755D8();
        uint64_t v13 = v25;
        uint64_t v12 = 0;
        uint64_t v9 = (char *)(v25 + 56);
        uint64_t v26 = 1 << *(unsigned char *)(v25 + 32);
        if (v26 < 64) {
          uint64_t v27 = ~(-1 << v26);
        }
        else {
          uint64_t v27 = -1;
        }
        unint64_t v7 = v27 & *(void *)(v25 + 56);
        int64_t v28 = (unint64_t)(v26 + 63) >> 6;
        if (v7)
        {
LABEL_10:
          unint64_t v29 = __clz(__rbit64(v7));
          v7 &= v7 - 1;
          unint64_t v30 = v29 | (v12 << 6);
          goto LABEL_25;
        }
        while (1)
        {
          int64_t v31 = v12 + 1;
          if (__OFADD__(v12, 1))
          {
            __break(1u);
            goto LABEL_38;
          }
          if (v31 >= v28) {
            goto LABEL_30;
          }
          unint64_t v32 = *(void *)&v9[8 * v31];
          ++v12;
          if (!v32)
          {
            uint64_t v12 = v31 + 1;
            if (v31 + 1 >= v28) {
              goto LABEL_30;
            }
            unint64_t v32 = *(void *)&v9[8 * v12];
            if (!v32)
            {
              uint64_t v12 = v31 + 2;
              if (v31 + 2 >= v28) {
                goto LABEL_30;
              }
              unint64_t v32 = *(void *)&v9[8 * v12];
              if (!v32)
              {
                int64_t v33 = v31 + 3;
                if (v33 >= v28)
                {
LABEL_30:
                  swift_release();
                  uint64_t v9 = v40;
                  (*v38)(v40, v54);
                  uint64_t v12 = v39;
                  (*v46)(v61, v39);
                  goto LABEL_31;
                }
                unint64_t v32 = *(void *)&v9[8 * v33];
                if (!v32)
                {
                  while (1)
                  {
                    uint64_t v12 = v33 + 1;
                    if (__OFADD__(v33, 1)) {
                      goto LABEL_39;
                    }
                    if (v12 >= v28) {
                      goto LABEL_30;
                    }
                    unint64_t v32 = *(void *)&v9[8 * v12];
                    ++v33;
                    if (v32) {
                      goto LABEL_24;
                    }
                  }
                }
                uint64_t v12 = v33;
              }
            }
          }
LABEL_24:
          unint64_t v7 = (v32 - 1) & v32;
          unint64_t v30 = __clz(__rbit64(v32)) + (v12 << 6);
LABEL_25:
          (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v6, *(void *)(v13 + 48) + *(void *)(v1 + 72) * v30, v0);
          (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v4, v6, v0);
          int v34 = (*(uint64_t (**)(char *, uint64_t))(v1 + 88))(v4, v0);
          if (v34 == v62)
          {
            swift_release();
            (*v38)(v40, v54);
            (*v46)(v61, v39);
            swift_bridgeObjectRelease();
            (*v16)(v4, v0);
            return 1;
          }
          (*v16)(v4, v0);
          if (v7) {
            goto LABEL_10;
          }
        }
      }
      uint64_t v13 = v24;
      unint64_t v7 = v12;
      uint64_t v35 = *v46;
      (*v46)(v22, v7);
      if (v13 == v43)
      {
        swift_bridgeObjectRelease();
        v35((char *)v60, v7);
        return 1;
      }
      v35((char *)v60, v7);
      uint64_t v12 = v7;
LABEL_31:
      uint64_t v18 = v45;
      unint64_t v19 = v59;
      if (v59 == v44)
      {
        swift_bridgeObjectRelease();
        return 0;
      }
    }
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
LABEL_40:
    swift_once();
  }
}

uint64_t GenerativeAssistantRestrictionManager.isMontaraAllowed.getter()
{
  int v0 = AFMontaraRestricted();
  if (qword_269A49928 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24FA757A8();
  __swift_project_value_buffer(v1, (uint64_t)qword_269A49C20);
  uint64_t v2 = sub_24FA75788();
  os_log_type_t v3 = sub_24FA758B8();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 67109120;
    uint64_t v5 = v0 ^ 1u;
    sub_24FA75958();
    _os_log_impl(&dword_24FA58000, v2, v3, "Montara: isMontaraAllowed %{BOOL}d", v4, 8u);
    MEMORY[0x25336AD50](v4, -1, -1);
  }
  else
  {

    return v0 ^ 1u;
  }
  return v5;
}

uint64_t GenerativeAssistantRestrictionManager.isMontaraAvailable.getter()
{
  if (GenerativeAssistantRestrictionManager.isMontaraAllowed.getter()) {
    char v0 = GenerativeAssistantRestrictionManager.isMontaraHardDisabled.getter() ^ 1;
  }
  else {
    char v0 = 0;
  }
  return v0 & 1;
}

id GenerativeAssistantRestrictionManager.isExternalIntelligenceSignInAllowed.getter()
{
  id result = objc_msgSend(self, sel_sharedConnection);
  if (result)
  {
    uint64_t v1 = result;
    id v2 = objc_msgSend(result, sel_isExternalIntelligenceSignInAllowed);

    return v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

BOOL sub_24FA6F324(GenerativeAssistantCommon::GenerativeAssistantUseCase a1)
{
  return GenerativeAssistantRestrictionManager.isUseCaseAvailable(useCase:)(a1);
}

uint64_t sub_24FA6F340()
{
  return GenerativeAssistantRestrictionManager.isMontaraAllowed.getter() & 1;
}

uint64_t sub_24FA6F35C()
{
  return GenerativeAssistantRestrictionManager.isMontaraHardDisabled.getter() & 1;
}

uint64_t sub_24FA6F378()
{
  if (GenerativeAssistantRestrictionManager.isMontaraAllowed.getter()) {
    char v0 = GenerativeAssistantRestrictionManager.isMontaraHardDisabled.getter() ^ 1;
  }
  else {
    char v0 = 0;
  }
  return v0 & 1;
}

id sub_24FA6F3A8()
{
  id result = objc_msgSend(self, sel_sharedConnection);
  if (result)
  {
    uint64_t v1 = result;
    id v2 = objc_msgSend(result, sel_isExternalIntelligenceSignInAllowed);

    return v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t dispatch thunk of GenerativeAssistantRestrictions.isUseCaseAvailable(useCase:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of GenerativeAssistantRestrictions.isMontaraAllowed.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of GenerativeAssistantRestrictions.isMontaraHardDisabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of GenerativeAssistantRestrictions.isMontaraAvailable.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of GenerativeAssistantRestrictions.isExternalIntelligenceSignInAllowed.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

ValueMetadata *type metadata accessor for GenerativeAssistantRestrictionManager()
{
  return &type metadata for GenerativeAssistantRestrictionManager;
}

uint64_t sub_24FA6F47C(char a1, char a2)
{
  unint64_t v3 = 0xD00000000000001FLL;
  unint64_t v4 = 0x800000024FA77330;
  switch(a1)
  {
    case 1:
      unint64_t v4 = 0x800000024FA77350;
      unint64_t v3 = 0xD00000000000001BLL;
      break;
    case 2:
      unint64_t v3 = 0xD00000000000001DLL;
      uint64_t v5 = "GenerativeAssistant.knowledge";
      goto LABEL_6;
    case 3:
      unint64_t v3 = 0xD000000000000025;
      uint64_t v5 = "GenerativeAssistant.knowledgeFallback";
      goto LABEL_6;
    case 4:
      unint64_t v3 = 0xD00000000000002CLL;
      uint64_t v5 = "GenerativeAssistant.visualIntelligenceCamera";
LABEL_6:
      unint64_t v4 = (unint64_t)(v5 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xD00000000000001FLL;
  unint64_t v7 = 0x800000024FA77330;
  switch(a2)
  {
    case 1:
      unint64_t v7 = 0x800000024FA77350;
      unint64_t v6 = 0xD00000000000001BLL;
      break;
    case 2:
      unint64_t v6 = 0xD00000000000001DLL;
      uint64_t v8 = "GenerativeAssistant.knowledge";
      goto LABEL_12;
    case 3:
      unint64_t v6 = 0xD000000000000025;
      uint64_t v8 = "GenerativeAssistant.knowledgeFallback";
      goto LABEL_12;
    case 4:
      unint64_t v6 = 0xD00000000000002CLL;
      uint64_t v8 = "GenerativeAssistant.visualIntelligenceCamera";
LABEL_12:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v3 == v6 && v4 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_24FA75AA8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_24FA6F61C(char a1, char a2)
{
  if (*(void *)&aInlineimdocume[8 * a1] == *(void *)&aInlineimdocume[8 * a2]
    && *(void *)&aInlineimdocume[8 * a1 + 56] == *(void *)&aInlineimdocume[8 * a2 + 56])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_24FA75AA8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_24FA6F6A4()
{
  sub_24FA75838();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24FA6F784()
{
  sub_24FA75838();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24FA6F7D8()
{
  return sub_24FA75B18();
}

uint64_t sub_24FA6F840()
{
  return sub_24FA75B18();
}

uint64_t sub_24FA6F938(uint64_t a1)
{
  return sub_24FA6F9D8(a1, MEMORY[0x263F90268], qword_269A49C40, MEMORY[0x263F90260]);
}

uint64_t static Logger.metricsLogger.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24FA6FB4C(&qword_269A49938, MEMORY[0x263F90268], (uint64_t)qword_269A49C40, a1);
}

uint64_t sub_24FA6F9A4(uint64_t a1)
{
  return sub_24FA6F9D8(a1, MEMORY[0x263F90228], qword_269A49C58, MEMORY[0x263F90220]);
}

uint64_t sub_24FA6F9D8(uint64_t a1, uint64_t (*a2)(void), uint64_t *a3, uint64_t (*a4)(unint64_t, unint64_t, uint64_t, unint64_t))
{
  uint64_t v6 = a2(0);
  __swift_allocate_value_buffer(v6, a3);
  __swift_project_value_buffer(v6, (uint64_t)a3);
  return a4(0xD00000000000003FLL, 0x800000024FA77450, 0x7363697274654DLL, 0xE700000000000000);
}

uint64_t static Logger.signposter.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24FA6FB4C(&qword_269A49940, MEMORY[0x263F90228], (uint64_t)qword_269A49C58, a1);
}

uint64_t sub_24FA6FA98()
{
  uint64_t v0 = sub_24FA757A8();
  __swift_allocate_value_buffer(v0, qword_269A49C70);
  __swift_project_value_buffer(v0, (uint64_t)qword_269A49C70);
  return sub_24FA75798();
}

uint64_t static Logger.selfSchemaLogger.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24FA6FB4C(&qword_269A49948, MEMORY[0x263F90268], (uint64_t)qword_269A49C70, a1);
}

uint64_t sub_24FA6FB4C@<X0>(void *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = __swift_project_value_buffer(v7, a3);
  char v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);
  return v9(a4, v8, v7);
}

uint64_t sub_24FA6FBEC()
{
  sub_24FA75478();
  uint64_t result = sub_24FA75928();
  qword_269A4B730 = result;
  return result;
}

uint64_t static Log.begin(_:enableTelemetry:)()
{
  if (qword_269A49950 != -1) {
    swift_once();
  }
  id v0 = (id)qword_269A4B730;
  sub_24FA75738();
  sub_24FA758E8();
  return sub_24FA75718();
}

uint64_t static Log.end(_:_:)()
{
  sub_24FA758D8();
  if (qword_269A49950 != -1) {
    swift_once();
  }
  return sub_24FA75718();
}

const char *static Signpost.generateImageIntentPerformDuration.getter()
{
  return "GenerateImage.Time";
}

const char *static Signpost.generateRichContentIntentPerformDuration.getter()
{
  return "GenerateText.Time";
}

const char *static Signpost.generateRichContentFromMediaPerformDuration.getter()
{
  return "GenerateTextFromMedia.Time";
}

const char *static Signpost.generateKnowledgeResponseIntentPerformDuration.getter()
{
  return "GenerateKnowledgeResponse.Time";
}

const char *static Signpost.lowConfidenceKnowledgeSearchDuration.getter()
{
  return "KnowledgeFallback.Time";
}

const char *static Signpost.textAssistantHandoffDuration.getter()
{
  return "TextAssistantHandoff.Time";
}

const char *static Signpost.waitUserConfirmToContinueDuration.getter()
{
  return "WaitUserConfirmToContinue.Time";
}

const char *static Signpost.loadScreenContentProcess.getter()
{
  return "LoadScreenContent.Time";
}

const char *static Signpost.contextScreenContentRetrieval.getter()
{
  return "ContextScreenContentRetrieval.Time";
}

const char *static Signpost.imageResizeProcess.getter()
{
  return "ImageResize.Time";
}

const char *static Signpost.imageJPEGEncodeDuration.getter()
{
  return "InlineImageEncodeProcess.Time";
}

const char *static Signpost.imageContextConversion.getter()
{
  return "ImageContextConversion.Time";
}

const char *static Signpost.documentContextConversion.getter()
{
  return "DocumentContextConversion.Time";
}

const char *static Signpost.registerDocumentProcess.getter()
{
  return "RegisterDocument.Time";
}

const char *static Signpost.registerImageProcess.getter()
{
  return "RegisterImageProcess.Time";
}

const char *static Signpost.createSessionProcess.getter()
{
  return "SessionCreation.Time";
}

const char *static Signpost.responseGenerationDuration.getter()
{
  return "ResponseGeneration.Time";
}

const char *static Signpost.uiRenderingDuration.getter()
{
  return "UIRendering.Time";
}

const char *static Signpost.userCancelDuringConfirmation.getter()
{
  return "Event.UserCancelled";
}

const char *static Signpost.emptyResponse.getter()
{
  return "Error.EmptyResponse";
}

const char *static Signpost.gmsResultError.getter()
{
  return "Error.GMS.GenerativeResultFailed";
}

const char *static Signpost.timeOut.getter()
{
  return "Error.TimeOut";
}

const char *static Signpost.textAssistantHandoffError.getter()
{
  return "Error.TextAssistantHandoffError";
}

const char *static Signpost.sessionCreationError.getter()
{
  return "Error.SessionCreation";
}

const char *static Signpost.loadScreenContentError.getter()
{
  return "Error.LoadScreenContent";
}

const char *static Signpost.imageContextConversionError.getter()
{
  return "Error.ImageContextConversion";
}

const char *static Signpost.documentContextConversionError.getter()
{
  return "Error.DocumentContextConversion";
}

const char *static Signpost.registerDocumentError.getter()
{
  return "Error.RegisterDocument";
}

const char *static Signpost.registerDocumentNeverFinishError.getter()
{
  return "Error.RegisterDocumentNeverFinish";
}

const char *GenerativeUsecases.staticString.getter()
{
  uint64_t result = "Usecase.InlineImageQnA";
  switch(*v0)
  {
    case 1:
      uint64_t result = "Usecase.DocumentQnA";
      break;
    case 2:
      uint64_t result = "Usecase.SessionImageQnA";
      break;
    case 3:
      uint64_t result = "Usecase.TextGeneration";
      break;
    case 4:
      uint64_t result = "Usecase.Knowledge";
      break;
    case 5:
      uint64_t result = "Usecase.TextAssistant";
      break;
    case 6:
      uint64_t result = "Usecase.ImageGeneration";
      break;
    default:
      return result;
  }
  return result;
}

GenerativeAssistantCommon::GenerativeUsecases_optional __swiftcall GenerativeUsecases.init(rawValue:)(Swift::String rawValue)
{
  id v2 = v1;
  unint64_t v3 = sub_24FA75A48();
  result.value = swift_bridgeObjectRelease();
  char v5 = 7;
  if (v3 < 7) {
    char v5 = v3;
  }
  *id v2 = v5;
  return result;
}

uint64_t GenerativeUsecases.rawValue.getter()
{
  return *(void *)&aInlineimdocume[8 * *v0];
}

uint64_t sub_24FA70134(char *a1, char *a2)
{
  return sub_24FA6F61C(*a1, *a2);
}

uint64_t sub_24FA70140()
{
  return sub_24FA6F7D8();
}

uint64_t sub_24FA7014C()
{
  return sub_24FA6F784();
}

uint64_t sub_24FA70154()
{
  return sub_24FA6F7D8();
}

GenerativeAssistantCommon::GenerativeUsecases_optional sub_24FA7015C(Swift::String *a1)
{
  return GenerativeUsecases.init(rawValue:)(*a1);
}

uint64_t sub_24FA70168@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = GenerativeUsecases.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_24FA70190(void **a1, uint64_t *a2)
{
  id v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  unint64_t v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;
  id v5 = v2;
}

id sub_24FA701E8()
{
  swift_beginAccess();
  uint64_t v1 = *(void **)(v0 + 16);
  return v1;
}

void sub_24FA7022C(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = a1;
}

uint64_t sub_24FA70274@<X0>(uint64_t a1@<X8>)
{
  return sub_24FA704E0(&OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_signpostID, MEMORY[0x263F90210], a1);
}

uint64_t sub_24FA70294(uint64_t a1)
{
  return sub_24FA70590(a1, &OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_signpostID, MEMORY[0x263F90210]);
}

uint64_t (*sub_24FA702B4())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_24FA70310@<X0>(void *a1@<X0>, void *a2@<X3>, uint64_t (*a3)(void)@<X4>, uint64_t a4@<X8>)
{
  uint64_t v6 = *a1 + *a2;
  swift_beginAccess();
  uint64_t v7 = a3(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(a4, v6, v7);
}

uint64_t sub_24FA703A4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void), void *a6)
{
  uint64_t v9 = a5(0);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v15 - v11;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v15 - v11, a1, v9);
  uint64_t v13 = *a2 + *a6;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 40))(v13, v12, v9);
  return swift_endAccess();
}

uint64_t sub_24FA704C0@<X0>(uint64_t a1@<X8>)
{
  return sub_24FA704E0(&OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_begin, MEMORY[0x263F07490], a1);
}

uint64_t sub_24FA704E0@<X0>(void *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = v3 + *a1;
  swift_beginAccess();
  uint64_t v7 = a2(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(a3, v6, v7);
}

uint64_t sub_24FA70570(uint64_t a1)
{
  return sub_24FA70590(a1, &OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_begin, MEMORY[0x263F07490]);
}

uint64_t sub_24FA70590(uint64_t a1, void *a2, uint64_t (*a3)(void))
{
  uint64_t v6 = v3 + *a2;
  swift_beginAccess();
  uint64_t v7 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 40))(v6, a1, v7);
  return swift_endAccess();
}

uint64_t (*sub_24FA70628())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_24FA70684(uint64_t a1, void *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A49CA0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24FA7424C(a1, (uint64_t)v6, &qword_269A49CA0);
  uint64_t v7 = *a2 + OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_end;
  swift_beginAccess();
  sub_24FA70804((uint64_t)v6, v7);
  return swift_endAccess();
}

uint64_t sub_24FA7074C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_end;
  swift_beginAccess();
  return sub_24FA7424C(v3, a1, &qword_269A49CA0);
}

uint64_t sub_24FA707A8(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_end;
  swift_beginAccess();
  sub_24FA70804(a1, v3);
  return swift_endAccess();
}

uint64_t sub_24FA70804(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A49CA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*sub_24FA7086C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_24FA708C8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_timeInterval;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_24FA70914(uint64_t a1, char a2)
{
  uint64_t v5 = v2 + OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_timeInterval;
  uint64_t result = swift_beginAccess();
  *(void *)uint64_t v5 = a1;
  *(unsigned char *)(v5 + 8) = a2 & 1;
  return result;
}

uint64_t (*sub_24FA70974())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_24FA709D0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_name;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_24FA70A1C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v7 = v3 + OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_name;
  uint64_t result = swift_beginAccess();
  *(void *)uint64_t v7 = a1;
  *(void *)(v7 + 8) = a2;
  *(unsigned char *)(v7 + 16) = a3;
  return result;
}

uint64_t (*sub_24FA70A7C())()
{
  return j_j__swift_endAccess;
}

uint64_t SignpostInterval.__allocating_init(name:)(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6 = swift_allocObject();
  SignpostInterval.init(name:)(a1, a2, a3);
  return v6;
}

char *SignpostInterval.init(name:)(uint64_t a1, uint64_t a2, int a3)
{
  int v40 = a3;
  uint64_t v39 = a2;
  uint64_t v5 = sub_24FA75758();
  uint64_t v36 = *(void *)(v5 - 8);
  uint64_t v37 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v35 = (char *)v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A49CA0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v38 = (char *)v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24FA75568();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34[1] = v3 + 16;
  if (qword_269A49950 != -1) {
    swift_once();
  }
  uint64_t v13 = (void *)qword_269A4B730;
  *((void *)v3 + 2) = qword_269A4B730;
  uint64_t v14 = &v3[OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_signpostID];
  id v15 = v13;
  sub_24FA75738();
  uint64_t v16 = (uint64_t)&v3[OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_end];
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
  v17(&v3[OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_end], 1, 1, v9);
  uint64_t v18 = &v3[OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_timeInterval];
  *(void *)uint64_t v18 = 0;
  v18[8] = 1;
  unint64_t v19 = &v3[OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_name];
  *(void *)unint64_t v19 = a1;
  v34[0] = a1;
  *((void *)v19 + 1) = v39;
  v19[16] = v40;
  sub_24FA75558();
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v3[OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_begin], v12, v9);
  uint64_t v20 = (uint64_t)v38;
  v17(v38, 1, 1, v9);
  swift_beginAccess();
  sub_24FA70804(v20, v16);
  swift_endAccess();
  sub_24FA758E8();
  swift_beginAccess();
  uint64_t v38 = v3;
  BOOL v21 = (void *)*((void *)v3 + 2);
  swift_beginAccess();
  uint64_t v23 = v35;
  uint64_t v22 = v36;
  uint64_t v24 = v37;
  (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v35, v14, v37);
  id v25 = v21;
  sub_24FA75718();

  (*(void (**)(char *, uint64_t))(v22 + 8))(v23, v24);
  if (qword_269A49938 != -1) {
    swift_once();
  }
  uint64_t v26 = sub_24FA757A8();
  __swift_project_value_buffer(v26, (uint64_t)qword_269A49C40);
  uint64_t v27 = sub_24FA75788();
  os_log_type_t v28 = sub_24FA758B8();
  if (os_log_type_enabled(v27, v28))
  {
    unint64_t v29 = (uint8_t *)swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    uint64_t v42 = v30;
    *(_DWORD *)unint64_t v29 = 136315138;
    uint64_t v31 = sub_24FA759B8();
    uint64_t v41 = sub_24FA602C0(v31, v32, &v42);
    sub_24FA75958();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24FA58000, v27, v28, "Started signpost: %s", v29, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25336AD50](v30, -1, -1);
    MEMORY[0x25336AD50](v29, -1, -1);
  }

  return v38;
}

uint64_t sub_24FA70FF8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24FA75758();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v35 = v2;
  uint64_t v36 = v3;
  MEMORY[0x270FA5388](v2);
  uint64_t v37 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24FA75568();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v30 - v10;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A49CA0);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  id v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v30 - v16;
  sub_24FA75558();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v17, 0, 1, v5);
  uint64_t v18 = v0 + OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_end;
  swift_beginAccess();
  sub_24FA70804((uint64_t)v17, v18);
  swift_endAccess();
  sub_24FA7424C(v18, (uint64_t)v15, &qword_269A49CA0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v15, 1, v5) == 1) {
    return sub_24FA742B0((uint64_t)v15, &qword_269A49CA0);
  }
  uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
  int v34 = v11;
  v20(v11, v15, v5);
  uint64_t v21 = v0 + OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_begin;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v21, v5);
  sub_24FA75548();
  uint64_t v23 = v22;
  int64_t v33 = *(void (**)(char *, uint64_t))(v6 + 8);
  v33(v9, v5);
  uint64_t v24 = v0 + OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_timeInterval;
  swift_beginAccess();
  *(void *)uint64_t v24 = v23;
  *(unsigned char *)(v24 + 8) = 0;
  int v32 = sub_24FA758D8();
  swift_beginAccess();
  uint64_t v25 = v35;
  id v31 = *(id *)(v1 + 16);
  swift_beginAccess();
  uint64_t v26 = v1 + OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_signpostID;
  swift_beginAccess();
  uint64_t v28 = v36;
  uint64_t v27 = v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v37, v26, v25);
  id v29 = v31;
  sub_24FA75718();

  (*(void (**)(char *, uint64_t))(v28 + 8))(v27, v25);
  sub_24FA71444();
  return ((uint64_t (*)(char *, uint64_t))v33)(v34, v5);
}

void sub_24FA71444()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_timeInterval);
  swift_beginAccess();
  if ((v1[1] & 1) == 0)
  {
    uint64_t v2 = *v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A49CA8);
    uint64_t v3 = swift_allocObject();
    uint64_t v4 = MEMORY[0x263F8D538];
    *(_OWORD *)(v3 + 16) = xmmword_24FA76AF0;
    uint64_t v5 = MEMORY[0x263F8D5B8];
    *(void *)(v3 + 56) = v4;
    *(void *)(v3 + 64) = v5;
    *(void *)(v3 + 32) = v2;
    uint64_t v6 = sub_24FA75818();
    unint64_t v8 = v7;
    if (qword_269A49938 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_24FA757A8();
    __swift_project_value_buffer(v9, (uint64_t)qword_269A49C40);
    swift_retain_n();
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_24FA75788();
    os_log_type_t v11 = sub_24FA758B8();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v18 = v13;
      *(_DWORD *)uint64_t v12 = 136315650;
      if (qword_269A49960 != -1) {
        swift_once();
      }
      uint64_t v14 = qword_269A49C90;
      unint64_t v15 = qword_269A49C98;
      swift_bridgeObjectRetain();
      sub_24FA602C0(v14, v15, &v18);
      sub_24FA75958();
      swift_bridgeObjectRelease();
      *(_WORD *)(v12 + 12) = 2080;
      swift_beginAccess();
      uint64_t v16 = sub_24FA759B8();
      sub_24FA602C0(v16, v17, &v18);
      sub_24FA75958();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v12 + 22) = 2080;
      swift_bridgeObjectRetain();
      sub_24FA602C0(v6, v8, &v18);
      sub_24FA75958();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24FA58000, v10, v11, "%s%s : %s", (uint8_t *)v12, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x25336AD50](v13, -1, -1);
      MEMORY[0x25336AD50](v12, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release_n();
    }
  }
}

uint64_t static SignpostInterval.== infix(_:_:)()
{
  swift_beginAccess();
  uint64_t v0 = sub_24FA759B8();
  uint64_t v2 = v1;
  swift_beginAccess();
  if (v0 == sub_24FA759B8() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_24FA75AA8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t SignpostInterval.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_signpostID;
  uint64_t v2 = sub_24FA75758();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_begin;
  uint64_t v4 = sub_24FA75568();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_24FA742B0(v0 + OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_end, &qword_269A49CA0);
  return v0;
}

uint64_t SignpostInterval.__deallocating_deinit()
{
  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_signpostID;
  uint64_t v2 = sub_24FA75758();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = (char *)v0 + OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_begin;
  uint64_t v4 = sub_24FA75568();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_24FA742B0((uint64_t)v0 + OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_end, &qword_269A49CA0);
  uint64_t v5 = *((unsigned int *)*v0 + 12);
  uint64_t v6 = *((unsigned __int16 *)*v0 + 26);
  return MEMORY[0x270FA0228](v0, v5, v6);
}

uint64_t sub_24FA71A24()
{
  type metadata accessor for MetricsUtils();
  uint64_t v0 = swift_allocObject();
  uint64_t v1 = MEMORY[0x263F8EE78];
  *(void *)(v0 + 16) = MEMORY[0x263F8EE78];
  *(void *)(v0 + 24) = v1;
  sub_24FA745FC((uint64_t)v3);
  uint64_t result = sub_24FA6C730((uint64_t)v3, v0 + 32);
  qword_269A49C88 = v0;
  return result;
}

uint64_t static MetricsUtils.shared.getter()
{
  if (qword_269A49958 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t sub_24FA71AE4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  *(void *)(v3 + 16) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24FA71B44()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_24FA71B7C(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_24FA71BC4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  *(void *)(v3 + 24) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24FA71C24()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_24FA71C5C(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 24) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24FA71CA4())()
{
  return j_j__swift_endAccess;
}

void sub_24FA71CF8()
{
  HIWORD(qword_269A49C98) = -4864;
}

uint64_t static MetricsUtils.loggingPrefix.getter()
{
  if (qword_269A49960 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_269A49C90;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_24FA71D90@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + 32;
  swift_beginAccess();
  sub_24FA6C730(v3, (uint64_t)v5);
  return sub_24FA6C730((uint64_t)v5, a2);
}

uint64_t sub_24FA71DEC(uint64_t a1, void *a2)
{
  sub_24FA6C730(a1, (uint64_t)v5);
  uint64_t v3 = *a2 + 32;
  swift_beginAccess();
  return sub_24FA6C730((uint64_t)v5, v3);
}

uint64_t sub_24FA71E44@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  sub_24FA6C730(v1 + 32, (uint64_t)v4);
  return sub_24FA6C730((uint64_t)v4, a1);
}

uint64_t sub_24FA71E9C(uint64_t a1)
{
  sub_24FA6C730(a1, (uint64_t)v3);
  swift_beginAccess();
  return sub_24FA6C730((uint64_t)v3, v1 + 32);
}

uint64_t (*sub_24FA71EEC())()
{
  return j__swift_endAccess;
}

void sub_24FA71F40(uint64_t a1, uint64_t a2, int a3)
{
  type metadata accessor for SignpostInterval();
  swift_allocObject();
  SignpostInterval.init(name:)(a1, a2, a3);
  swift_beginAccess();
  uint64_t v7 = swift_retain();
  MEMORY[0x25336A620](v7);
  if (*(void *)((*(void *)(v3 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v3 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_24FA75888();
  sub_24FA75898();
  sub_24FA75878();
  swift_endAccess();
  if (qword_269A49938 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_24FA757A8();
  __swift_project_value_buffer(v8, (uint64_t)qword_269A49C40);
  uint64_t v9 = sub_24FA75788();
  os_log_type_t v10 = sub_24FA758B8();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    v17[0] = v12;
    *(_DWORD *)uint64_t v11 = 136315394;
    if (qword_269A49960 != -1) {
      swift_once();
    }
    uint64_t v14 = qword_269A49C90;
    unint64_t v13 = qword_269A49C98;
    swift_bridgeObjectRetain();
    sub_24FA602C0(v14, v13, v17);
    sub_24FA75958();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    uint64_t v15 = sub_24FA759B8();
    sub_24FA602C0(v15, v16, v17);
    sub_24FA75958();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24FA58000, v9, v10, "%s Recorded signpost begin: %s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25336AD50](v12, -1, -1);
    MEMORY[0x25336AD50](v11, -1, -1);
    swift_release();
  }
  else
  {

    swift_release();
  }
}

void sub_24FA72204(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  int v37 = a3;
  v36[1] = a1;
  v36[2] = a2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A49CB0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24FA75758();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24FA7424C(a4, (uint64_t)v8, &qword_269A49CB0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
    uint64_t v24 = swift_beginAccess();
    unint64_t v25 = *(void *)(v4 + 16);
    MEMORY[0x270FA5388](v24);
    v36[-2] = v12;
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_24FA728E0(sub_24FA74538, (uint64_t)&v36[-4], v25);
    swift_bridgeObjectRelease();
    if (v26)
    {
      sub_24FA70FF8();
      swift_release();
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    goto LABEL_25;
  }
  sub_24FA742B0((uint64_t)v8, &qword_269A49CB0);
  swift_beginAccess();
  unint64_t v13 = *(void *)(v4 + 16);
  unint64_t v38 = v13;
  if (!(v13 >> 62))
  {
    unint64_t v14 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_17;
  }
  swift_bridgeObjectRetain();
  unint64_t v14 = sub_24FA75A18();
  if (!v14)
  {
LABEL_17:
    uint64_t v23 = 0;
LABEL_23:
    swift_bridgeObjectRelease();
    if (v23)
    {
      sub_24FA70FF8();
      swift_release();
    }
LABEL_25:
    if (qword_269A49938 == -1) {
      goto LABEL_26;
    }
    goto LABEL_34;
  }
LABEL_4:
  v36[0] = v13 & 0xFFFFFFFFFFFFFF8;
  while (!__OFSUB__(v14--, 1))
  {
    if ((v13 & 0xC000000000000001) != 0)
    {
      MEMORY[0x25336A780](v14, v13);
    }
    else
    {
      if ((v14 & 0x8000000000000000) != 0) {
        goto LABEL_32;
      }
      if (v14 >= *(void *)(v36[0] + 16)) {
        goto LABEL_33;
      }
      swift_retain();
    }
    swift_beginAccess();
    uint64_t v16 = sub_24FA759B8();
    uint64_t v18 = v17;
    if (v16 == sub_24FA759B8() && v18 == v19)
    {
      swift_release();
      uint64_t v22 = swift_bridgeObjectRelease_n();
LABEL_22:
      MEMORY[0x270FA5388](v22);
      v36[-2] = &v38;
      uint64_t v39 = v14;
      sub_24FA744F4((unint64_t *)&v39, (unint64_t *)&v40);
      uint64_t v23 = v40;
      goto LABEL_23;
    }
    char v21 = sub_24FA75AA8();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v22 = swift_bridgeObjectRelease();
    if (v21) {
      goto LABEL_22;
    }
    if (!v14) {
      goto LABEL_17;
    }
  }
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  swift_once();
LABEL_26:
  uint64_t v27 = sub_24FA757A8();
  __swift_project_value_buffer(v27, (uint64_t)qword_269A49C40);
  uint64_t v28 = sub_24FA75788();
  os_log_type_t v29 = sub_24FA758B8();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    uint64_t v40 = v31;
    *(_DWORD *)uint64_t v30 = 136315394;
    if (qword_269A49960 != -1) {
      swift_once();
    }
    uint64_t v32 = qword_269A49C90;
    unint64_t v33 = qword_269A49C98;
    swift_bridgeObjectRetain();
    uint64_t v39 = sub_24FA602C0(v32, v33, &v40);
    sub_24FA75958();
    swift_bridgeObjectRelease();
    *(_WORD *)(v30 + 12) = 2080;
    uint64_t v34 = sub_24FA759B8();
    uint64_t v39 = sub_24FA602C0(v34, v35, &v40);
    sub_24FA75958();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24FA58000, v28, v29, "%s Recorded signpost end: %s", (uint8_t *)v30, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25336AD50](v31, -1, -1);
    MEMORY[0x25336AD50](v30, -1, -1);
  }
}

uint64_t sub_24FA727B4(void *a1)
{
  uint64_t v2 = sub_24FA75758();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *a1 + OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_signpostID;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  char v7 = sub_24FA75728();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v7 & 1;
}

uint64_t sub_24FA728E0(uint64_t (*a1)(uint64_t *), uint64_t a2, unint64_t a3)
{
  if (a3 >> 62)
  {
LABEL_17:
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_24FA75A18();
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v6 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v6)
    {
LABEL_3:
      uint64_t v7 = 4;
      do
      {
        uint64_t v8 = v7 - 4;
        if ((a3 & 0xC000000000000001) != 0)
        {
          uint64_t v9 = MEMORY[0x25336A780](v7 - 4, a3);
          BOOL v10 = __OFADD__(v8, 1);
          uint64_t v11 = v7 - 3;
          if (v10) {
            goto LABEL_16;
          }
        }
        else
        {
          uint64_t v9 = *(void *)(a3 + 8 * v7);
          swift_retain();
          BOOL v10 = __OFADD__(v8, 1);
          uint64_t v11 = v7 - 3;
          if (v10)
          {
LABEL_16:
            __break(1u);
            goto LABEL_17;
          }
        }
        uint64_t v14 = v9;
        char v12 = a1(&v14);
        if (v3)
        {
          swift_bridgeObjectRelease();
          swift_release();
          return v9;
        }
        if (v12)
        {
          swift_bridgeObjectRelease();
          return v9;
        }
        swift_release();
        ++v7;
      }
      while (v11 != v6);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

void sub_24FA72A1C()
{
  swift_beginAccess();
  uint64_t v4 = *(void *)(v0 + 24);
  int64_t v5 = *(void *)(v4 + 16);
  uint64_t v6 = MEMORY[0x263F8EE78];
  if (v5)
  {
    uint64_t v39 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_24FA74368(0, v5, 0);
    uint64_t v7 = v39;
    uint64_t v8 = v4 + 48;
    do
    {
      unint64_t v1 = sub_24FA759B8();
      uint64_t v2 = v9;
      uint64_t v39 = v7;
      unint64_t v11 = *(void *)(v7 + 16);
      unint64_t v10 = *(void *)(v7 + 24);
      unint64_t v3 = v11 + 1;
      if (v11 >= v10 >> 1)
      {
        sub_24FA74368(v10 > 1, v11 + 1, 1);
        uint64_t v7 = v39;
      }
      v8 += 24;
      *(void *)(v7 + 16) = v3;
      uint64_t v12 = v7 + 16 * v11;
      *(void *)(v12 + 32) = v1;
      *(void *)(v12 + 40) = v2;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = MEMORY[0x263F8EE78];
  }
  uint64_t v39 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A49CB8);
  unint64_t v35 = sub_24FA74558();
  uint64_t v34 = sub_24FA757D8();
  unint64_t v14 = v13;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  unint64_t v15 = *(void *)(v0 + 16);
  if (v15 >> 62) {
    goto LABEL_21;
  }
  uint64_t v16 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v16)
  {
    while (1)
    {
      unint64_t v33 = v15;
      uint64_t v38 = v6;
      uint64_t v17 = &v38;
      sub_24FA74368(0, v16 & ~(v16 >> 63), 0);
      if (v16 < 0) {
        break;
      }
      uint64_t v18 = 0;
      uint64_t v6 = v38;
      unint64_t v15 = v33;
      while (v16 != v18)
      {
        if ((v33 & 0xC000000000000001) != 0)
        {
          uint64_t v19 = MEMORY[0x25336A780](v18, v15);
        }
        else
        {
          uint64_t v19 = *(void *)(v15 + 8 * v18 + 32);
          swift_retain();
        }
        uint64_t v36 = v19;
        sub_24FA73080(&v36, v37);
        swift_release();
        unint64_t v1 = v37[0];
        uint64_t v2 = (uint64_t *)v37[1];
        uint64_t v38 = v6;
        unint64_t v3 = *(void *)(v6 + 16);
        unint64_t v20 = *(void *)(v6 + 24);
        if (v3 >= v20 >> 1)
        {
          sub_24FA74368(v20 > 1, v3 + 1, 1);
          unint64_t v15 = v33;
          uint64_t v6 = v38;
        }
        ++v18;
        *(void *)(v6 + 16) = v3 + 1;
        unint64_t v21 = v6 + 16 * v3;
        *(void *)(v21 + 32) = v1;
        *(void *)(v21 + 40) = v2;
        if (v16 == v18)
        {
          swift_bridgeObjectRelease();
          goto LABEL_23;
        }
      }
      __break(1u);
LABEL_21:
      swift_bridgeObjectRetain();
      uint64_t v16 = sub_24FA75A18();
      if (!v16) {
        goto LABEL_22;
      }
    }
    __break(1u);
    goto LABEL_35;
  }
LABEL_22:
  swift_bridgeObjectRelease();
  uint64_t v6 = MEMORY[0x263F8EE78];
LABEL_23:
  v37[0] = v6;
  uint64_t v22 = sub_24FA757D8();
  unint64_t v1 = v23;
  swift_bridgeObjectRelease();
  if (qword_269A49938 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_24FA757A8();
  __swift_project_value_buffer(v24, (uint64_t)qword_269A49C40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_24FA75788();
  LOBYTE(v16) = sub_24FA758B8();
  uint64_t v2 = &qword_269A49C90;
  if (os_log_type_enabled(v17, (os_log_type_t)v16))
  {
    unint64_t v35 = v22;
    unint64_t v3 = swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    v37[0] = v6;
    *(_DWORD *)unint64_t v3 = 136315650;
    if (qword_269A49960 == -1)
    {
LABEL_27:
      uint64_t v25 = *v2;
      unint64_t v26 = qword_269A49C98;
      swift_bridgeObjectRetain();
      uint64_t v38 = sub_24FA602C0(v25, v26, v37);
      sub_24FA75958();
      swift_bridgeObjectRelease();
      *(_WORD *)(v3 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v38 = sub_24FA602C0(v34, v14, v37);
      sub_24FA75958();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v3 + 22) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v38 = sub_24FA602C0(v35, v1, v37);
      sub_24FA75958();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24FA58000, v17, (os_log_type_t)v16, "%s Events and usecases: %s\nIntervals: %s", (uint8_t *)v3, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x25336AD50](v6, -1, -1);
      MEMORY[0x25336AD50](v3, -1, -1);

      goto LABEL_29;
    }
LABEL_35:
    swift_once();
    goto LABEL_27;
  }

  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
LABEL_29:
  sub_24FA7369C();
  uint64_t v27 = sub_24FA75788();
  os_log_type_t v28 = sub_24FA758B8();
  if (os_log_type_enabled(v27, v28))
  {
    os_log_type_t v29 = (uint8_t *)swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    v37[0] = v30;
    *(_DWORD *)os_log_type_t v29 = 136315138;
    if (qword_269A49960 != -1) {
      swift_once();
    }
    uint64_t v31 = qword_269A49C90;
    unint64_t v32 = qword_269A49C98;
    swift_bridgeObjectRetain();
    uint64_t v38 = sub_24FA602C0(v31, v32, v37);
    sub_24FA75958();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24FA58000, v27, v28, "%s Emitted all signposts and events.", v29, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25336AD50](v30, -1, -1);
    MEMORY[0x25336AD50](v29, -1, -1);
  }
}

uint64_t sub_24FA73080@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A49CA8);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_24FA76AF0;
  uint64_t v5 = v3 + OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_timeInterval;
  swift_beginAccess();
  double v6 = *(double *)v5;
  int v7 = *(unsigned __int8 *)(v5 + 8);
  uint64_t v8 = MEMORY[0x263F8D5B8];
  *(void *)(v4 + 56) = MEMORY[0x263F8D538];
  *(void *)(v4 + 64) = v8;
  if (v7) {
    double v6 = 0.0;
  }
  *(double *)(v4 + 32) = v6;
  sub_24FA75818();
  swift_beginAccess();
  uint64_t v11 = sub_24FA759B8();
  uint64_t v12 = v9;
  sub_24FA75848();
  sub_24FA75848();
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v11;
  a2[1] = v12;
  return result;
}

uint64_t sub_24FA731B8(const char *a1, uint64_t a2, int a3)
{
  uint64_t v40 = a2;
  uint64_t v6 = sub_24FA75758();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  unint64_t v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v39 - v11;
  if (qword_269A49940 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_24FA75778();
  __swift_project_value_buffer(v13, (uint64_t)qword_269A49C58);
  sub_24FA75768();
  sub_24FA75738();
  unint64_t v14 = (void *)(v3 + 24);
  swift_beginAccess();
  unint64_t v15 = *(void **)(v3 + 24);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v3 + 24) = v15;
  int v41 = a3;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    unint64_t v15 = sub_24FA740DC(0, v15[2] + 1, 1, v15);
    *unint64_t v14 = v15;
  }
  unint64_t v18 = v15[2];
  unint64_t v17 = v15[3];
  if (v18 >= v17 >> 1)
  {
    unint64_t v15 = sub_24FA740DC((void *)(v17 > 1), v18 + 1, 1, v15);
    *unint64_t v14 = v15;
  }
  v15[2] = v18 + 1;
  uint64_t v19 = &v15[3 * v18];
  uint64_t v20 = v40;
  v19[4] = a1;
  v19[5] = v20;
  char v21 = v41;
  *((unsigned char *)v19 + 48) = v41;
  swift_endAccess();
  uint64_t v22 = sub_24FA75768();
  os_signpost_type_t v23 = sub_24FA758F8();
  uint64_t result = sub_24FA75918();
  if (result)
  {
    if (v21)
    {
      if (!((unint64_t)a1 >> 32))
      {
        if (a1 >> 11 == 27)
        {
LABEL_27:
          __break(1u);
          return result;
        }
        if (a1 >> 16 <= 0x10)
        {
          uint64_t v25 = &v44;
          goto LABEL_16;
        }
LABEL_26:
        __break(1u);
        goto LABEL_27;
      }
    }
    else
    {
      if (a1)
      {
        uint64_t v25 = a1;
LABEL_16:
        (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
        uint64_t v26 = v6;
        uint64_t v27 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v27 = 0;
        os_signpost_id_t v28 = sub_24FA75748();
        _os_signpost_emit_with_name_impl(&dword_24FA58000, v22, v23, v28, v25, "", v27, 2u);
        os_log_type_t v29 = v27;
        uint64_t v6 = v26;
        MEMORY[0x25336AD50](v29, -1, -1);

        (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v26);
        goto LABEL_17;
      }
      __break(1u);
    }
    __break(1u);
    goto LABEL_26;
  }

LABEL_17:
  if (qword_269A49938 != -1) {
    swift_once();
  }
  uint64_t v30 = sub_24FA757A8();
  __swift_project_value_buffer(v30, (uint64_t)qword_269A49C40);
  uint64_t v31 = sub_24FA75788();
  os_log_type_t v32 = sub_24FA758B8();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v39 = v6;
    uint64_t v33 = swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    v43[0] = v34;
    *(_DWORD *)uint64_t v33 = 136315394;
    if (qword_269A49960 != -1) {
      swift_once();
    }
    uint64_t v36 = qword_269A49C90;
    unint64_t v35 = qword_269A49C98;
    swift_bridgeObjectRetain();
    uint64_t v42 = sub_24FA602C0(v36, v35, v43);
    sub_24FA75958();
    swift_bridgeObjectRelease();
    *(_WORD *)(v33 + 12) = 2080;
    uint64_t v37 = sub_24FA759B8();
    uint64_t v42 = sub_24FA602C0(v37, v38, v43);
    sub_24FA75958();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24FA58000, v31, v32, "%s Event emitted: %s", (uint8_t *)v33, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25336AD50](v34, -1, -1);
    MEMORY[0x25336AD50](v33, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v12, v39);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  }
}

void sub_24FA7369C()
{
  uint64_t v1 = 1;
  char v95 = 1;
  char v94 = 1;
  char v93 = 1;
  char v92 = 1;
  char v91 = 1;
  char v90 = 1;
  char v89 = 1;
  char v88 = 1;
  char v87 = 1;
  char v85 = 1;
  char v83 = 1;
  char v81 = 1;
  char v79 = 1;
  char v77 = 1;
  swift_beginAccess();
  unint64_t v2 = *(void *)(v0 + 16);
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_24FA75A18();
    if (v3) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3)
    {
LABEL_3:
      if (v3 >= 1)
      {
        uint64_t v49 = 0;
        uint64_t v50 = 0;
        uint64_t v47 = 0;
        uint64_t v48 = 0;
        uint64_t v45 = 0;
        uint64_t v46 = 0;
        uint64_t v4 = 0;
        while (1)
        {
          if ((v2 & 0xC000000000000001) != 0)
          {
            uint64_t v6 = MEMORY[0x25336A780](v4, v2);
          }
          else
          {
            uint64_t v6 = *(void *)(v2 + 8 * v4 + 32);
            swift_retain();
          }
          swift_beginAccess();
          uint64_t v7 = sub_24FA759B8();
          uint64_t v9 = v8;
          if (sub_24FA759B8() == v7 && v10 == v9) {
            break;
          }
          char v12 = sub_24FA75AA8();
          swift_bridgeObjectRelease();
          if (v12) {
            goto LABEL_6;
          }
          if (sub_24FA759B8() == v7 && v13 == v9)
          {
            swift_bridgeObjectRelease();
LABEL_30:
            swift_bridgeObjectRelease();
            uint64_t v20 = v6 + OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_timeInterval;
            swift_beginAccess();
            uint64_t v49 = *(void *)v20;
            LOBYTE(v20) = *(unsigned char *)(v20 + 8);
            swift_release();
            char v85 = v20;
            goto LABEL_7;
          }
          char v15 = sub_24FA75AA8();
          swift_bridgeObjectRelease();
          if (v15) {
            goto LABEL_30;
          }
          if (sub_24FA759B8() == v7 && v16 == v9)
          {
            swift_bridgeObjectRelease();
LABEL_32:
            swift_bridgeObjectRelease();
            uint64_t v21 = v6 + OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_timeInterval;
            swift_beginAccess();
            uint64_t v48 = *(void *)v21;
            LOBYTE(v21) = *(unsigned char *)(v21 + 8);
            swift_release();
            char v83 = v21;
            goto LABEL_7;
          }
          char v18 = sub_24FA75AA8();
          swift_bridgeObjectRelease();
          if (v18) {
            goto LABEL_32;
          }
          if (sub_24FA759B8() == v7 && v19 == v9)
          {
            swift_bridgeObjectRelease();
LABEL_34:
            swift_bridgeObjectRelease();
            uint64_t v23 = v6 + OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_timeInterval;
            swift_beginAccess();
            uint64_t v47 = *(void *)v23;
            LOBYTE(v23) = *(unsigned char *)(v23 + 8);
            swift_release();
            char v81 = v23;
            goto LABEL_7;
          }
          char v22 = sub_24FA75AA8();
          swift_bridgeObjectRelease();
          if (v22) {
            goto LABEL_34;
          }
          if (sub_24FA759B8() == v7 && v24 == v9)
          {
            swift_bridgeObjectRelease();
LABEL_39:
            swift_bridgeObjectRelease();
            uint64_t v26 = v6 + OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_timeInterval;
            swift_beginAccess();
            uint64_t v46 = *(void *)v26;
            LOBYTE(v26) = *(unsigned char *)(v26 + 8);
            swift_release();
            char v79 = v26;
            goto LABEL_7;
          }
          char v25 = sub_24FA75AA8();
          swift_bridgeObjectRelease();
          if (v25) {
            goto LABEL_39;
          }
          if (sub_24FA759B8() == v7 && v27 == v9)
          {
            swift_bridgeObjectRelease_n();
          }
          else
          {
            char v28 = sub_24FA75AA8();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v28 & 1) == 0)
            {
              swift_release();
              goto LABEL_7;
            }
          }
          uint64_t v29 = v6 + OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_timeInterval;
          swift_beginAccess();
          uint64_t v45 = *(void *)v29;
          LOBYTE(v29) = *(unsigned char *)(v29 + 8);
          swift_release();
          char v77 = v29;
LABEL_7:
          if (v3 == ++v4)
          {
            swift_bridgeObjectRelease();
            char v30 = v87;
            char v31 = v85;
            char v32 = v83;
            char v33 = v81;
            char v34 = v79;
            char v35 = v77;
            uint64_t v37 = v45;
            uint64_t v36 = v46;
            uint64_t v38 = v47;
            uint64_t v39 = v48;
            uint64_t v40 = v49;
            uint64_t v41 = v50;
            goto LABEL_49;
          }
        }
        swift_bridgeObjectRelease();
LABEL_6:
        swift_bridgeObjectRelease();
        uint64_t v5 = v6 + OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_timeInterval;
        swift_beginAccess();
        uint64_t v50 = *(void *)v5;
        LOBYTE(v5) = *(unsigned char *)(v5 + 8);
        swift_release();
        char v87 = v5;
        goto LABEL_7;
      }
      __break(1u);
      goto LABEL_56;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v41 = 0;
  uint64_t v40 = 0;
  uint64_t v39 = 0;
  uint64_t v38 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  char v35 = 1;
  char v34 = 1;
  char v33 = 1;
  char v32 = 1;
  char v31 = 1;
  char v30 = 1;
LABEL_49:
  *(_DWORD *)uint64_t v54 = *(_DWORD *)v86;
  *(_DWORD *)&v54[3] = *(_DWORD *)&v86[3];
  *(_DWORD *)uint64_t v57 = *(_DWORD *)v84;
  *(_DWORD *)&v57[3] = *(_DWORD *)&v84[3];
  *(_DWORD *)uint64_t v60 = *(_DWORD *)v82;
  *(_DWORD *)&v60[3] = *(_DWORD *)&v82[3];
  *(_DWORD *)&v63[3] = *(_DWORD *)&v80[3];
  *(_DWORD *)uint64_t v63 = *(_DWORD *)v80;
  *(_DWORD *)&v66[3] = *(_DWORD *)&v78[3];
  *(_DWORD *)os_log_t v66 = *(_DWORD *)v78;
  uint64_t v52 = v41;
  char v53 = v30;
  uint64_t v55 = v40;
  char v56 = v31;
  uint64_t v58 = v39;
  char v59 = v32;
  uint64_t v61 = v38;
  char v62 = v33;
  uint64_t v64 = v36;
  char v65 = v34;
  uint64_t v67 = v37;
  char v68 = v35;
  *(_DWORD *)&v69[3] = *(_DWORD *)((char *)v76 + 3);
  *(_DWORD *)v69 = v76[0];
  uint64_t v70 = 0;
  char v71 = 1;
  *(_DWORD *)&v72[3] = *(_DWORD *)((char *)v75 + 3);
  *(_DWORD *)v72 = v75[0];
  uint64_t v73 = 0;
  char v74 = 1;
  sub_24FA75470((uint64_t)&v52);
  swift_beginAccess();
  sub_24FA6C730((uint64_t)&v52, v0 + 32);
  if (qword_269A49938 != -1) {
    swift_once();
  }
  uint64_t v42 = sub_24FA757A8();
  __swift_project_value_buffer(v42, (uint64_t)qword_269A49C40);
  unint64_t v2 = sub_24FA75788();
  LOBYTE(v3) = sub_24FA758B8();
  if (os_log_type_enabled((os_log_t)v2, (os_log_type_t)v3))
  {
    uint64_t v0 = swift_slowAlloc();
    uint64_t v1 = swift_slowAlloc();
    uint64_t v51 = v1;
    *(_DWORD *)uint64_t v0 = 136315138;
    if (qword_269A49960 == -1)
    {
LABEL_53:
      uint64_t v43 = qword_269A49C90;
      unint64_t v44 = qword_269A49C98;
      swift_bridgeObjectRetain();
      sub_24FA602C0(v43, v44, &v51);
      sub_24FA75958();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24FA58000, (os_log_t)v2, (os_log_type_t)v3, "%s Performance metrics saved.", (uint8_t *)v0, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25336AD50](v1, -1, -1);
      MEMORY[0x25336AD50](v0, -1, -1);
      goto LABEL_54;
    }
LABEL_56:
    swift_once();
    goto LABEL_53;
  }
LABEL_54:
}

void sub_24FA73E50()
{
  sub_24FA745FC((uint64_t)v10);
  swift_beginAccess();
  sub_24FA6C730((uint64_t)v10, v0 + 32);
  swift_beginAccess();
  uint64_t v1 = MEMORY[0x263F8EE78];
  *(void *)(v0 + 16) = MEMORY[0x263F8EE78];
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(void *)(v0 + 24) = v1;
  swift_bridgeObjectRelease();
  if (qword_269A49938 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24FA757A8();
  __swift_project_value_buffer(v2, (uint64_t)qword_269A49C40);
  uint64_t v3 = sub_24FA75788();
  os_log_type_t v4 = sub_24FA758B8();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v9 = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    if (qword_269A49960 != -1) {
      swift_once();
    }
    uint64_t v7 = qword_269A49C90;
    unint64_t v8 = qword_269A49C98;
    swift_bridgeObjectRetain();
    sub_24FA602C0(v7, v8, &v9);
    sub_24FA75958();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24FA58000, v3, v4, "%s All data cleaned after emitting to SELF.", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25336AD50](v6, -1, -1);
    MEMORY[0x25336AD50](v5, -1, -1);
  }
}

uint64_t MetricsUtils.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t MetricsUtils.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 154, 7);
}

void *sub_24FA740DC(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_269A49CE8);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
      char v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[3 * v8 + 4]) {
          memmove(v12, a4 + 4, 24 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      char v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_24FA75380(0, v8, (char *)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for SignpostInterval()
{
  uint64_t result = qword_269A49CD0;
  if (!qword_269A49CD0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24FA7424C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24FA742B0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_24FA7430C(unint64_t result, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) != 0) {
    return MEMORY[0x25336A780]();
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10) > result)
  {
    return swift_retain();
  }
  __break(1u);
  return result;
}

uint64_t sub_24FA74368(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24FA74388(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_24FA74388(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A49CF0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_24FA75A38();
  __break(1u);
  return result;
}

unint64_t sub_24FA744F4@<X0>(unint64_t *a1@<X0>, unint64_t *a2@<X8>)
{
  unint64_t result = sub_24FA7430C(*a1, **(void **)(v2 + 16));
  if (!v3) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_24FA74538(void *a1)
{
  return sub_24FA727B4(a1) & 1;
}

unint64_t sub_24FA74558()
{
  unint64_t result = qword_269A49CC0;
  if (!qword_269A49CC0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A49CB8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A49CC0);
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

double sub_24FA745FC(uint64_t a1)
{
  double result = 0.0;
  *(_OWORD *)(a1 + 105) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(unsigned char *)(a1 + 121) = 1;
  return result;
}

unint64_t sub_24FA74624()
{
  unint64_t result = qword_269A49CC8;
  if (!qword_269A49CC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A49CC8);
  }
  return result;
}

id sub_24FA74678@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  os_log_type_t v4 = *(void **)(v3 + 16);
  *a2 = v4;
  return v4;
}

uint64_t sub_24FA746D4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24FA70310(a1, &OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_signpostID, MEMORY[0x263F90210], a2);
}

uint64_t sub_24FA74708(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_24FA703A4(a1, a2, a3, a4, MEMORY[0x263F90210], &OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_signpostID);
}

uint64_t sub_24FA7473C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24FA70310(a1, &OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_begin, MEMORY[0x263F07490], a2);
}

uint64_t sub_24FA74770(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_24FA703A4(a1, a2, a3, a4, MEMORY[0x263F07490], &OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_begin);
}

uint64_t sub_24FA747A4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_end;
  swift_beginAccess();
  return sub_24FA7424C(v3, a2, &qword_269A49CA0);
}

uint64_t sub_24FA74808@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_timeInterval;
  uint64_t result = swift_beginAccess();
  char v5 = *(unsigned char *)(v3 + 8);
  *(void *)a2 = *(void *)v3;
  *(unsigned char *)(a2 + 8) = v5;
  return result;
}

uint64_t sub_24FA74864(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  char v3 = *((unsigned char *)a1 + 8);
  uint64_t v4 = *a2 + OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_timeInterval;
  uint64_t result = swift_beginAccess();
  *(void *)uint64_t v4 = v2;
  *(unsigned char *)(v4 + 8) = v3;
  return result;
}

__n128 sub_24FA748C4@<Q0>(void *a1@<X0>, __n128 *a2@<X8>)
{
  char v3 = (__n128 *)(*a1 + OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_name);
  swift_beginAccess();
  unsigned __int8 v4 = v3[1].n128_u8[0];
  __n128 result = *v3;
  *a2 = *v3;
  a2[1].n128_u8[0] = v4;
  return result;
}

uint64_t sub_24FA74920(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  char v4 = *((unsigned char *)a1 + 16);
  uint64_t v5 = *a2 + OBJC_IVAR____TtC25GenerativeAssistantCommon16SignpostInterval_name;
  uint64_t result = swift_beginAccess();
  *(void *)uint64_t v5 = v2;
  *(void *)(v5 + 8) = v3;
  *(unsigned char *)(v5 + 16) = v4;
  return result;
}

uint64_t sub_24FA74980@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  *a2 = *(void *)(v3 + 16);
  return swift_bridgeObjectRetain();
}

uint64_t sub_24FA749D0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  *a2 = *(void *)(v3 + 24);
  return swift_bridgeObjectRetain();
}

ValueMetadata *type metadata accessor for Log()
{
  return &type metadata for Log;
}

ValueMetadata *type metadata accessor for Signpost()
{
  return &type metadata for Signpost;
}

uint64_t getEnumTagSinglePayload for GenerativeUsecases(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for GenerativeUsecases(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *uint64_t result = a2 + 6;
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
        JUMPOUT(0x24FA74BA4);
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
          *uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GenerativeUsecases()
{
  return &type metadata for GenerativeUsecases;
}

uint64_t sub_24FA74BDC()
{
  return type metadata accessor for SignpostInterval();
}

void sub_24FA74BE4()
{
  sub_24FA75758();
  if (v0 <= 0x3F)
  {
    sub_24FA75568();
    if (v1 <= 0x3F)
    {
      sub_24FA7504C();
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

uint64_t method lookup function for SignpostInterval(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SignpostInterval);
}

uint64_t dispatch thunk of SignpostInterval.log.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of SignpostInterval.log.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of SignpostInterval.log.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of SignpostInterval.signpostID.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of SignpostInterval.signpostID.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of SignpostInterval.signpostID.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of SignpostInterval.begin.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of SignpostInterval.begin.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of SignpostInterval.begin.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of SignpostInterval.end.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of SignpostInterval.end.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of SignpostInterval.end.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of SignpostInterval.timeInterval.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of SignpostInterval.timeInterval.setter(uint64_t a1, char a2)
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)v2 + 232))(a1, a2 & 1);
}

uint64_t dispatch thunk of SignpostInterval.timeInterval.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of SignpostInterval.name.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of SignpostInterval.name.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of SignpostInterval.name.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t dispatch thunk of SignpostInterval.__allocating_init(name:)()
{
  return (*(uint64_t (**)(void))(v0 + 272))();
}

uint64_t dispatch thunk of SignpostInterval.endSignpost()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

uint64_t dispatch thunk of SignpostInterval.printTimeInterval()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

void sub_24FA7504C()
{
  if (!qword_269A49CE0)
  {
    sub_24FA75568();
    unint64_t v0 = sub_24FA75948();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269A49CE0);
    }
  }
}

uint64_t type metadata accessor for MetricsUtils()
{
  return self;
}

uint64_t method lookup function for MetricsUtils(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MetricsUtils);
}

uint64_t dispatch thunk of MetricsUtils.signpostIntervals.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of MetricsUtils.signpostIntervals.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of MetricsUtils.signpostIntervals.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of MetricsUtils.usecasesAndEvents.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of MetricsUtils.usecasesAndEvents.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of MetricsUtils.usecasesAndEvents.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of MetricsUtils.performanceMetrics.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of MetricsUtils.performanceMetrics.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of MetricsUtils.performanceMetrics.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of MetricsUtils.recordSignpostBegin(for:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of MetricsUtils.recordSignpostEnd(for:signPostID:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of MetricsUtils.emitAllSignpostAndEvent()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of MetricsUtils.emitSignpostEvent(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of MetricsUtils.cleanAllDataAfterEmitToSELF()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

__n128 __swift_memcpy121_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  long long v6 = a2[5];
  long long v7 = a2[6];
  *(_OWORD *)(a1 + 105) = *(long long *)((char *)a2 + 105);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for GATPerformanceLatencyMetrics(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 121)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for GATPerformanceLatencyMetrics(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 120) = 0;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 121) = v3;
  return result;
}

ValueMetadata *type metadata accessor for GATPerformanceLatencyMetrics()
{
  return &type metadata for GATPerformanceLatencyMetrics;
}

char *sub_24FA75380(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 24 * a1 + 32);
    size_t v6 = 24 * v4;
    long long v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  __n128 result = (char *)sub_24FA75A38();
  __break(1u);
  return result;
}

uint64_t sub_24FA75470(uint64_t result)
{
  *(unsigned char *)(result + 121) = 0;
  return result;
}

unint64_t sub_24FA75478()
{
  unint64_t result = qword_269A49CF8;
  if (!qword_269A49CF8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269A49CF8);
  }
  return result;
}

uint64_t sub_24FA754B8()
{
  return MEMORY[0x270EEE438]();
}

uint64_t sub_24FA754C8()
{
  return MEMORY[0x270EEE440]();
}

uint64_t sub_24FA754D8()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_24FA754E8()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_24FA754F8()
{
  return MEMORY[0x270EEE940]();
}

uint64_t sub_24FA75508()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_24FA75518()
{
  return MEMORY[0x270EEF868]();
}

uint64_t sub_24FA75528()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_24FA75538()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_24FA75548()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_24FA75558()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_24FA75568()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24FA75578()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_24FA75588()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_24FA75598()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_24FA755A8()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24FA755B8()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_24FA755C8()
{
  return MEMORY[0x270F2F860]();
}

uint64_t sub_24FA755D8()
{
  return MEMORY[0x270F2F898]();
}

uint64_t sub_24FA755E8()
{
  return MEMORY[0x270F2F8B0]();
}

uint64_t sub_24FA755F8()
{
  return MEMORY[0x270F2F928]();
}

uint64_t sub_24FA75608()
{
  return MEMORY[0x270F2F948]();
}

uint64_t sub_24FA75618()
{
  return MEMORY[0x270F2F950]();
}

uint64_t sub_24FA75628()
{
  return MEMORY[0x270F2F990]();
}

uint64_t sub_24FA75638()
{
  return MEMORY[0x270F2F9A8]();
}

uint64_t sub_24FA75648()
{
  return MEMORY[0x270F2FA88]();
}

uint64_t sub_24FA75658()
{
  return MEMORY[0x270F2FA98]();
}

uint64_t sub_24FA75668()
{
  return MEMORY[0x270FA16A8]();
}

uint64_t sub_24FA75678()
{
  return MEMORY[0x270FA17A8]();
}

uint64_t sub_24FA75688()
{
  return MEMORY[0x270FA17B0]();
}

uint64_t sub_24FA75698()
{
  return MEMORY[0x270FA17B8]();
}

uint64_t sub_24FA756A8()
{
  return MEMORY[0x270FA17C0]();
}

uint64_t sub_24FA756B8()
{
  return MEMORY[0x270FA17C8]();
}

uint64_t sub_24FA756C8()
{
  return MEMORY[0x270FA1808]();
}

uint64_t sub_24FA756D8()
{
  return MEMORY[0x270FA1828]();
}

uint64_t sub_24FA756E8()
{
  return MEMORY[0x270FA1848]();
}

uint64_t sub_24FA756F8()
{
  return MEMORY[0x270FA1930]();
}

uint64_t sub_24FA75708()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_24FA75718()
{
  return MEMORY[0x270FA2C98]();
}

uint64_t sub_24FA75728()
{
  return MEMORY[0x270FA2CB0]();
}

uint64_t sub_24FA75738()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_24FA75748()
{
  return MEMORY[0x270FA2CE8]();
}

uint64_t sub_24FA75758()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_24FA75768()
{
  return MEMORY[0x270FA2D58]();
}

uint64_t sub_24FA75778()
{
  return MEMORY[0x270FA2D88]();
}

uint64_t sub_24FA75788()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24FA75798()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24FA757A8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24FA757B8()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_24FA757C8()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_24FA757D8()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_24FA757E8()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_24FA757F8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24FA75808()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24FA75818()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_24FA75828()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_24FA75838()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24FA75848()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24FA75858()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24FA75868()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_24FA75878()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24FA75888()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_24FA75898()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_24FA758A8()
{
  return MEMORY[0x270F66220]();
}

uint64_t sub_24FA758B8()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_24FA758C8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24FA758D8()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_24FA758E8()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_24FA758F8()
{
  return MEMORY[0x270FA2EB8]();
}

uint64_t sub_24FA75908()
{
  return MEMORY[0x270F66260]();
}

uint64_t sub_24FA75918()
{
  return MEMORY[0x270FA2EC8]();
}

uint64_t sub_24FA75928()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_24FA75938()
{
  return MEMORY[0x270F9E3B0]();
}

uint64_t sub_24FA75948()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24FA75958()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24FA75968()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24FA75978()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_24FA75988()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24FA75998()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24FA759A8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24FA759B8()
{
  return MEMORY[0x270F9E9E8]();
}

uint64_t sub_24FA759C8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24FA759D8()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_24FA759E8()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_24FA759F8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24FA75A08()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24FA75A18()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24FA75A28()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24FA75A38()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24FA75A48()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_24FA75A58()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_24FA75A68()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_24FA75A78()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_24FA75A88()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_24FA75A98()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24FA75AA8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24FA75AD8()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24FA75AE8()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24FA75AF8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24FA75B08()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24FA75B18()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24FA75B28()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24FA75B38()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t AFMontaraRestricted()
{
  return MEMORY[0x270F0EE38]();
}

CFStringRef CGImageGetUTType(CGImageRef image)
{
  return (CFStringRef)MEMORY[0x270EE6860](image);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F82DD8](image);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
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