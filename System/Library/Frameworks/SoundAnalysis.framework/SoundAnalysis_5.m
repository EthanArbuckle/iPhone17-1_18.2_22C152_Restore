ValueMetadata *type metadata accessor for SpeechEmotionEstimation.Result.CodingKeys()
{
  return &type metadata for SpeechEmotionEstimation.Result.CodingKeys;
}

ValueMetadata *type metadata accessor for SpeechEmotionEstimation.AudioSourceAgnosticRequest.CodingKeys()
{
  return &type metadata for SpeechEmotionEstimation.AudioSourceAgnosticRequest.CodingKeys;
}

unsigned char *sub_1DCB3AA58(unsigned char *result, int a2, int a3)
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
        *result = a2;
        return result;
      case 2:
        *(_WORD *)result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *result = 0;
      break;
    case 2:
      *(_WORD *)result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1DCB3AAF4);
    case 4:
      *(_DWORD *)result = 0;
      break;
    default:
      return result;
  }
  return result;
}

void type metadata accessor for SNSpeechEmotionEstimator.DomainError()
{
}

void type metadata accessor for SpeechEmotionEstimation.Session()
{
}

void type metadata accessor for SpeechEmotionEstimation.Request()
{
}

unint64_t sub_1DCB3AB44()
{
  unint64_t result = qword_1EAAAB990;
  if (!qword_1EAAAB990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAAAB990);
  }
  return result;
}

unint64_t sub_1DCB3AB94()
{
  unint64_t result = qword_1EAAAB998;
  if (!qword_1EAAAB998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAAAB998);
  }
  return result;
}

unint64_t sub_1DCB3ABE4()
{
  unint64_t result = qword_1EAAAB9A0;
  if (!qword_1EAAAB9A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAAAB9A0);
  }
  return result;
}

unint64_t sub_1DCB3AC34()
{
  unint64_t result = qword_1EAAAB9A8;
  if (!qword_1EAAAB9A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAAAB9A8);
  }
  return result;
}

unint64_t sub_1DCB3AC84()
{
  unint64_t result = qword_1EAAAB9B0;
  if (!qword_1EAAAB9B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAAAB9B0);
  }
  return result;
}

unint64_t sub_1DCB3ACD4()
{
  unint64_t result = qword_1EAAAB9B8;
  if (!qword_1EAAAB9B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAAAB9B8);
  }
  return result;
}

unint64_t sub_1DCB3AD24()
{
  unint64_t result = qword_1EAAAB9C0;
  if (!qword_1EAAAB9C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAAAB9C0);
  }
  return result;
}

unint64_t sub_1DCB3AD70()
{
  unint64_t result = qword_1EAAAB9D0;
  if (!qword_1EAAAB9D0)
  {
    sub_1DC8863A8(&qword_1EAAA4298);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAAAB9D0);
  }
  return result;
}

unint64_t sub_1DCB3ADE4()
{
  unint64_t result = qword_1EAAAB9E0;
  if (!qword_1EAAAB9E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAAAB9E0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for SpeechEmotionEstimation.Request.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1DCB3AEFCLL);
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

ValueMetadata *type metadata accessor for SpeechEmotionEstimation.Request.CodingKeys()
{
  return &type metadata for SpeechEmotionEstimation.Request.CodingKeys;
}

unint64_t sub_1DCB3AF38()
{
  unint64_t result = qword_1EAAABA00;
  if (!qword_1EAAABA00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAAABA00);
  }
  return result;
}

unint64_t sub_1DCB3AF88()
{
  unint64_t result = qword_1EAAABA08;
  if (!qword_1EAAABA08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAAABA08);
  }
  return result;
}

unint64_t sub_1DCB3AFD8()
{
  unint64_t result = qword_1EAAABA10;
  if (!qword_1EAAABA10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAAABA10);
  }
  return result;
}

double sub_1DCB3B024()
{
  return *(double *)(v0 + 80);
}

uint64_t sub_1DCB3B070@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 176) = a1;
  return sub_1DCB88DC8();
}

uint64_t sub_1DCB3B094()
{
  return v0;
}

uint64_t sub_1DCB3B0C4()
{
  return sub_1DCB87908();
}

uint64_t sub_1DCB3B0E4()
{
  return sub_1DCB88EE8();
}

uint64_t sub_1DCB3B0FC@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 160) = a1;
  return v1 - 160;
}

uint64_t sub_1DCB3B108()
{
  return v0;
}

uint64_t sub_1DCB3B11C()
{
  return v0;
}

void sub_1DCB3B130()
{
  qword_1EAAFFBB8 = (uint64_t)&unk_1F37FB678;
}

uint64_t sub_1DCB3B144()
{
  uint64_t result = sub_1DCB3B164();
  qword_1EAAFFBC0 = result;
  return result;
}

uint64_t sub_1DCB3B164()
{
  if (qword_1EAA9D2A0 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_1EAAFFBB8;
  uint64_t v1 = *(void *)(qword_1EAAFFBB8 + 16);
  uint64_t v2 = MEMORY[0x1E4FBC860];
  if (v1)
  {
    uint64_t v10 = MEMORY[0x1E4FBC860];
    swift_bridgeObjectRetain();
    sub_1DC89877C();
    uint64_t v3 = 0;
    uint64_t v2 = v10;
    do
    {
      char v4 = *(unsigned char *)(v0 + v3 + 32);
      unint64_t v5 = 0xE500000000000000;
      uint64_t v6 = 0x6B63696C63;
      switch(v4)
      {
        case 1:
          uint64_t v6 = 0x6B63756C63;
          break;
        case 2:
          unint64_t v5 = 0xE200000000000000;
          uint64_t v6 = 25957;
          break;
        case 3:
          unint64_t v5 = 0xE200000000000000;
          uint64_t v6 = 26725;
          break;
        case 4:
          unint64_t v5 = 0xE200000000000000;
          uint64_t v6 = 27499;
          break;
        case 5:
          unint64_t v5 = 0xE200000000000000;
          uint64_t v6 = 24940;
          break;
        case 6:
          unint64_t v5 = 0xE300000000000000;
          uint64_t v6 = 6845805;
          break;
        case 7:
          unint64_t v5 = 0xE200000000000000;
          uint64_t v6 = 28527;
          break;
        case 8:
          unint64_t v5 = 0xE300000000000000;
          uint64_t v6 = 7368560;
          break;
        case 9:
          unint64_t v5 = 0xE200000000000000;
          uint64_t v6 = 28784;
          break;
        case 10:
          unint64_t v5 = 0xE200000000000000;
          uint64_t v6 = 26739;
          break;
        case 11:
          unint64_t v5 = 0xE200000000000000;
          uint64_t v6 = 29555;
          break;
        case 12:
          unint64_t v5 = 0xE200000000000000;
          uint64_t v6 = 29812;
          break;
        case 13:
          unint64_t v5 = 0xE200000000000000;
          uint64_t v6 = 26741;
          break;
        default:
          break;
      }
      unint64_t v7 = *(void *)(v10 + 16);
      if (v7 >= *(void *)(v10 + 24) >> 1) {
        sub_1DC89877C();
      }
      ++v3;
      *(void *)(v10 + 16) = v7 + 1;
      uint64_t v8 = v10 + 24 * v7;
      *(void *)(v8 + 32) = v6;
      *(void *)(v8 + 40) = v5;
      *(unsigned char *)(v8 + 48) = v4;
    }
    while (v1 != v3);
    swift_bridgeObjectRelease();
  }

  return sub_1DCAA7F54(v2);
}

uint64_t sub_1DCB3B3B4(id a1, char a2)
{
  id v2 = a1;
  if (a2)
  {
    if (a2 == 1)
    {
      id v3 = a1;
      sub_1DC87E988(&qword_1EAA9DF60);
      if (swift_dynamicCast())
      {
        sub_1DC938C60(v2, 1);
        return v5 | 0x40u;
      }
      else
      {
        sub_1DC938C60(v2, 1);
        return 64;
      }
    }
    else
    {
      return 128;
    }
  }
  return (uint64_t)v2;
}

uint64_t sub_1DCB3B458(uint64_t result)
{
  if (!(result >> 6)) {
    return result;
  }
  if (result >> 6 != 1) {
    return 0;
  }
  char v1 = result & 0x3F;
  sub_1DC938C14();
  uint64_t result = swift_allocError();
  *id v2 = v1;
  return result;
}

uint64_t sub_1DCB3B4BC@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1DCB3B3B4(*(id *)a1, *(unsigned char *)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_1DCB3B4F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_1DCB3B458(*v1);
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v4;
  return result;
}

uint64_t sub_1DCB3B520@<X0>(uint64_t a1@<X8>)
{
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  id v4 = objc_msgSend(v3, sel_resourceURL);
  if (v4)
  {
    id v5 = v4;
    sub_1DCB869B8();

    uint64_t v6 = 0;
    id v3 = v5;
  }
  else
  {
    uint64_t v6 = 1;
  }

  uint64_t v7 = sub_1DCB86A18();

  return _s13SoundAnalysis11SNAOPReportV14SuccessPayloadOwst_0(a1, v6, 1, v7);
}

uint64_t sub_1DCB3B5DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_1DCB3BAE8();
  if (!v3)
  {
    uint64_t v7 = sub_1DCB868F8();
    sub_1DCB3BBDC(v7, a2, a3);
    swift_bridgeObjectRelease();
    uint64_t v8 = self;
    v9 = (void *)sub_1DCB87C08();
    swift_bridgeObjectRelease();
    id v10 = objc_msgSend(v8, sel_pathWithComponents_, v9);

    sub_1DCB87938();
    sub_1DCB86928();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1DCB3B6D0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5)
{
  v15[1] = *(id *)MEMORY[0x1E4F143B8];
  v15[0] = 0;
  id v8 = objc_msgSend(self, sel_dataWithJSONObject_options_error_, a2, a3, v15);
  id v9 = v15[0];
  if (v8)
  {
    uint64_t v10 = sub_1DCB86AD8();
    unint64_t v12 = v11;

    sub_1DCB3BD18(a1, a4 & 1, a5 & 1, v10, v12);
    return sub_1DC881920(v10, v12);
  }
  else
  {
    v14 = v9;
    sub_1DCB86898();

    return swift_willThrow();
  }
}

uint64_t sub_1DCB3B7F0()
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t result = sub_1DCB3BAE8();
  if (!v0)
  {
    sub_1DCB869D8();
    sub_1DCB87998();
    swift_bridgeObjectRelease();
    int v2 = sub_1DCB87068();
    swift_release();
    if (v2 < 0)
    {
      sub_1DCB88A98();
      uint64_t v6 = swift_bridgeObjectRelease();
      LODWORD(v14[0]) = MEMORY[0x1E01A6070](v6);
      sub_1DCB88F98();
      sub_1DCB87A18();
      swift_bridgeObjectRelease();
      uint64_t v7 = sub_1DCB87A18();
      int v8 = MEMORY[0x1E01A6070](v7);
      if (strerror(v8)) {
        sub_1DCB87A28();
      }
      type metadata accessor for SNError();
      sub_1DCB87A18();
      swift_bridgeObjectRelease();
      sub_1DCB87A18();
      sub_1DCB3C2B0(0xD00000000000001BLL, (uint64_t)"com.apple.SoundAnalysis");
      swift_bridgeObjectRelease();
      return swift_willThrow();
    }
    else
    {
      v14[0] = qword_1EAAABBD0 | qword_1EAAABBC8;
      if (ffsctl(v2, dword_1EAAABBD8, v14, 0))
      {
        sub_1DCB88A98();
        uint64_t v3 = swift_bridgeObjectRelease();
        MEMORY[0x1E01A6070](v3);
        sub_1DCB88F98();
        sub_1DCB87A18();
        swift_bridgeObjectRelease();
        uint64_t v4 = sub_1DCB87A18();
        int v5 = MEMORY[0x1E01A6070](v4);
        if (strerror(v5)) {
          sub_1DCB87A28();
        }
        type metadata accessor for SNError();
        sub_1DCB87A18();
        swift_bridgeObjectRelease();
        sub_1DCB87A18();
        unint64_t v9 = sub_1DC8CD9C0();
        sub_1DCA14B2C(v9, v10, v11, v12, v13, 0x80000001DCB9BCD0);
        swift_bridgeObjectRelease();
        swift_willThrow();
      }
      return close(v2);
    }
  }
  return result;
}

uint64_t sub_1DCB3BAE8()
{
  uint64_t result = sub_1DCB868B8();
  if ((result & 1) == 0)
  {
    type metadata accessor for SNError();
    sub_1DCB88A98();
    swift_bridgeObjectRelease();
    sub_1DCB86A18();
    sub_1DCA841E4();
    sub_1DCB88F98();
    sub_1DCB87A18();
    swift_bridgeObjectRelease();
    unint64_t v1 = sub_1DC8CD9C0();
    sub_1DCA14B2C(v1, v2, v3, v4, v5, 0x80000001DCB9BD20);
    swift_bridgeObjectRelease();
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_1DCB3BBDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a1 + 16))
  {
    type metadata accessor for SNError();
    unint64_t v10 = sub_1DC8CD9C0();
    sub_1DCA14B2C(v10, v11, v12, v13, v14, v15);
    swift_willThrow();
    return v4;
  }
  uint64_t v4 = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_1DC9871E4();
    uint64_t v4 = v17;
  }
  uint64_t v8 = *(void *)(v4 + 16);
  if (!v8)
  {
    __break(1u);
    goto LABEL_10;
  }
  *(void *)(v4 + 16) = v8 - 1;
  sub_1DCB87A18();
  swift_bridgeObjectRelease();
  uint64_t v5 = a2;
  uint64_t v6 = a3;
  unint64_t v7 = *(void *)(v4 + 16);
  unint64_t v3 = v7 + 1;
  if (v7 >= *(void *)(v4 + 24) >> 1)
  {
LABEL_10:
    sub_1DCA737F0();
    uint64_t v4 = v18;
  }
  *(void *)(v4 + 16) = v3;
  uint64_t v9 = v4 + 16 * v7;
  *(void *)(v9 + 32) = v5;
  *(void *)(v9 + 40) = v6;
  return v4;
}

uint64_t sub_1DCB3BD18(uint64_t a1, char a2, char a3, uint64_t a4, uint64_t a5)
{
  uint64_t v33 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = sub_1DCB86A18();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](v10);
  uint64_t v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  v16 = (char *)&v31 - v15;
  uint64_t result = sub_1DCB3BAE8();
  if (!v5)
  {
    uint64_t v32 = v10;
    uint64_t v18 = a1;
    uint64_t v19 = v11;
    if (a2)
    {
      uint64_t v31 = a5;
      sub_1DCB86998();
      id v20 = objc_msgSend(self, sel_defaultManager);
      v21 = (void *)sub_1DCB86948();
      id v34 = 0;
      unsigned int v22 = objc_msgSend(v20, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v21, 1, 0, &v34);

      if (!v22)
      {
        id v30 = v34;
        sub_1DCB86898();

        swift_willThrow();
        return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v16, v32);
      }
      v23 = *(void (**)(char *, uint64_t))(v19 + 8);
      id v24 = v34;
      v23(v16, v32);
      a5 = v31;
    }
    uint64_t v25 = v32;
    (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v14, v18, v32);
    if (a3)
    {
      (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v25);
    }
    else
    {
      id v26 = objc_msgSend(self, sel_defaultManager);
      uint64_t v31 = a5;
      id v27 = v26;
      sub_1DCB869D8();
      v28 = (void *)sub_1DCB87908();
      swift_bridgeObjectRelease();
      unsigned __int8 v29 = objc_msgSend(v27, sel_fileExistsAtPath_, v28);

      (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v32);
      if (v29)
      {
        type metadata accessor for SNError();
        id v34 = 0;
        unint64_t v35 = 0xE000000000000000;
        sub_1DCB88A98();
        swift_bridgeObjectRelease();
        id v34 = (id)0xD000000000000029;
        unint64_t v35 = 0x80000001DCB9BD40;
        sub_1DCA841E4();
        sub_1DCB88F98();
        sub_1DCB87A18();
        swift_bridgeObjectRelease();
        sub_1DCB3C2B0((uint64_t)v34, (uint64_t)"com.apple.SoundAnalysis");
        swift_bridgeObjectRelease();
        return swift_willThrow();
      }
    }
    return sub_1DCB86B08();
  }
  return result;
}

id sub_1DCB3C200()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SNFileUtils();
  return objc_msgSendSuper2(&v2, sel_init);
}

id sub_1DCB3C258()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SNFileUtils();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SNFileUtils()
{
  return self;
}

id sub_1DCB3C2B0@<X0>(uint64_t a1@<X4>, uint64_t a2@<X8>)
{
  return sub_1DCA14B2C(0xD000000000000017, (a2 - 32) | 0x8000000000000000, 1, 0, a1, v2);
}

id sub_1DCB3C2E0(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  sub_1DCB3D7A4(a1, (uint64_t)v3 + OBJC_IVAR___SNFileCopyingResult_impl);
  v6.receiver = v3;
  v6.super_class = v1;
  id v4 = objc_msgSendSuper2(&v6, sel_init);
  sub_1DCB3D808(a1);
  return v4;
}

uint64_t sub_1DCB3C354()
{
  return sub_1DCB87818();
}

uint64_t sub_1DCB3C418(void *a1, void *a2)
{
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (sub_1DCB89018()) && a1[2] == a2[2])
  {
    type metadata accessor for FileCopyingResult(0);
    JUMPOUT(0x1E01A59A0);
  }
  return 0;
}

uint64_t sub_1DCB3C4A4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x656D616E656C6966 && a2 == 0xE800000000000000;
  if (v2 || (sub_1DCB89018() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x657A6953656C6966 && a2 == 0xE800000000000000;
    if (v6 || (sub_1DCB89018() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x4C52556D657469 && a2 == 0xE700000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v8 = sub_1DCB89018();
      swift_bridgeObjectRelease();
      if (v8) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_1DCB3C5FC(char a1)
{
  if (!a1) {
    return 0x656D616E656C6966;
  }
  if (a1 == 1) {
    return 0x657A6953656C6966;
  }
  return 0x4C52556D657469;
}

uint64_t sub_1DCB3C654(void *a1)
{
  uint64_t v3 = sub_1DC87E988((uint64_t *)&unk_1EAAABA50);
  sub_1DC89D4E0();
  uint64_t v5 = v4;
  MEMORY[0x1F4188790](v6);
  sub_1DC8A22D0();
  uint64_t v9 = v8 - v7;
  sub_1DC881A8C(a1, a1[3]);
  sub_1DCB3D710();
  sub_1DCB892B8();
  sub_1DCB88EC8();
  if (!v1)
  {
    sub_1DCB88F38();
    type metadata accessor for FileCopyingResult(0);
    sub_1DCB86A18();
    sub_1DCB3D75C(&qword_1EAA9DD48, MEMORY[0x1E4F276F0]);
    sub_1DCB88F18();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

uint64_t sub_1DCB3C804()
{
  return sub_1DCB891F8();
}

uint64_t sub_1DCB3C8DC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v23 = sub_1DCB86A18();
  sub_1DC89D4E0();
  uint64_t v20 = v4;
  MEMORY[0x1F4188790](v5);
  sub_1DC8A22D0();
  uint64_t v8 = v7 - v6;
  uint64_t v24 = sub_1DC87E988(&qword_1EAAABA38);
  sub_1DC89D4E0();
  uint64_t v22 = v9;
  MEMORY[0x1F4188790](v10);
  sub_1DC8A22D0();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = type metadata accessor for FileCopyingResult(0);
  MEMORY[0x1F4188790](v14);
  sub_1DC8A22D0();
  uint64_t v17 = (uint64_t *)(v16 - v15);
  sub_1DC881A8C(a1, a1[3]);
  sub_1DCB3D710();
  sub_1DCB89298();
  if (v2) {
    return sub_1DC8818D0((uint64_t)a1);
  }
  *uint64_t v17 = sub_1DCB88DA8();
  v17[1] = v18;
  v17[2] = sub_1DCB88E18();
  sub_1DCB3D75C(&qword_1EAA9DD28, MEMORY[0x1E4F276F0]);
  sub_1DCB88DF8();
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v13, v24);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 32))((char *)v17 + *(int *)(v14 + 24), v8, v23);
  sub_1DCB3D7A4((uint64_t)v17, a2);
  sub_1DC8818D0((uint64_t)a1);
  return sub_1DCB3D808((uint64_t)v17);
}

uint64_t sub_1DCB3CBA8()
{
  return sub_1DCB3C5FC(*v0);
}

uint64_t sub_1DCB3CBB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1DCB3C4A4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1DCB3CBD8(uint64_t a1)
{
  unint64_t v2 = sub_1DCB3D710();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1DCB3CC14(uint64_t a1)
{
  unint64_t v2 = sub_1DCB3D710();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1DCB3CC50@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1DCB3C8DC(a1, a2);
}

uint64_t sub_1DCB3CC68(void *a1)
{
  return sub_1DCB3C654(a1);
}

uint64_t sub_1DCB3CC88()
{
  return sub_1DCB891F8();
}

uint64_t sub_1DCB3CDA8()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___SNFileCopyingResult_impl);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1DCB3CE08()
{
  return *(void *)(v0 + OBJC_IVAR___SNFileCopyingResult_impl + 16);
}

uint64_t sub_1DCB3CF00@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR___SNFileCopyingResult_impl;
  uint64_t v4 = v3 + *(int *)(type metadata accessor for FileCopyingResult(0) + 24);
  uint64_t v5 = sub_1DCB86A18();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a1, v4, v5);
}

id SNFileCopyingResult.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void SNFileCopyingResult.init()()
{
}

id SNFileCopyingResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SNFileCopyingResult(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SNFileCopyingResult(uint64_t a1)
{
  return sub_1DC88EA30(a1, (uint64_t *)&unk_1EAA9D178);
}

uint64_t sub_1DCB3D060()
{
  return type metadata accessor for SNFileCopyingResult(0);
}

uint64_t sub_1DCB3D068()
{
  uint64_t result = type metadata accessor for FileCopyingResult(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for SNFileCopyingResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SNFileCopyingResult);
}

uint64_t type metadata accessor for FileCopyingResult(uint64_t a1)
{
  return sub_1DC88EA30(a1, (uint64_t *)&unk_1EAAABA20);
}

uint64_t *sub_1DCB3D130(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    a1[2] = a2[2];
    uint64_t v6 = *(int *)(a3 + 24);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_1DCB86A18();
    uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t sub_1DCB3D220(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_1DCB86A18();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *sub_1DCB3D298(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_1DCB86A18();
  uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

void *sub_1DCB3D338(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1DCB86A18();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t sub_1DCB3D3DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_1DCB86A18();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *sub_1DCB3D460(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1DCB86A18();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_1DCB3D4F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1DCB3D508);
}

uint64_t sub_1DCB3D508(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_1DCB86A18();
    uint64_t v9 = a1 + *(int *)(a3 + 24);
    return _s13SoundAnalysis11SNAOPReportV14SuccessPayloadOwet_0(v9, a2, v8);
  }
}

uint64_t sub_1DCB3D590(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1DCB3D5A4);
}

uint64_t sub_1DCB3D5A4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_1DCB86A18();
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return _s13SoundAnalysis11SNAOPReportV14SuccessPayloadOwst_0(v8, a2, a2, v7);
  }
  return result;
}

uint64_t sub_1DCB3D624()
{
  uint64_t result = sub_1DCB86A18();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1DCB3D6C8()
{
  return sub_1DCB3D75C(&qword_1EAAABA30, (void (*)(uint64_t))type metadata accessor for FileCopyingResult);
}

unint64_t sub_1DCB3D710()
{
  unint64_t result = qword_1EAAABA40;
  if (!qword_1EAAABA40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAAABA40);
  }
  return result;
}

uint64_t sub_1DCB3D75C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1DCB3D7A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FileCopyingResult(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DCB3D808(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for FileCopyingResult(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unsigned char *storeEnumTagSinglePayload for FileCopyingResult.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1DCB3D930);
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

ValueMetadata *type metadata accessor for FileCopyingResult.CodingKeys()
{
  return &type metadata for FileCopyingResult.CodingKeys;
}

unint64_t sub_1DCB3D96C()
{
  unint64_t result = qword_1EAAABA68;
  if (!qword_1EAAABA68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAAABA68);
  }
  return result;
}

unint64_t sub_1DCB3D9BC()
{
  unint64_t result = qword_1EAAABA70;
  if (!qword_1EAAABA70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAAABA70);
  }
  return result;
}

unint64_t sub_1DCB3DA0C()
{
  unint64_t result = qword_1EAAABA78;
  if (!qword_1EAAABA78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAAABA78);
  }
  return result;
}

uint64_t sub_1DCB3DA58()
{
  return v0;
}

id sub_1DCB3DA6C(uint64_t a1)
{
  int v3 = (char *)objc_allocWithZone(v1);
  *(void *)&v3[OBJC_IVAR____TtC13SoundAnalysis21AnyCancellableWrapper_wrapped] = a1;
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t sub_1DCB3DABC()
{
  return swift_retain();
}

uint64_t sub_1DCB3DACC()
{
  swift_retain();
  sub_1DCB87268();

  return swift_release();
}

void sub_1DCB3DB5C()
{
}

uint64_t type metadata accessor for AnyCancellableWrapper()
{
  return self;
}

uint64_t sub_1DCB3DBD0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1DCB3DABC();
  *a1 = result;
  return result;
}

id sub_1DCB3DBFC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  id result = sub_1DCB3DA6C(*a1);
  *a2 = result;
  return result;
}

void sub_1DCB3DC28(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_10;
  }
  if (!v2) {
    return;
  }
  uint64_t v7 = MEMORY[0x1E4FBC860];
  sub_1DC89840C();
  if (a2 < a1 || v2 < 0)
  {
LABEL_10:
    __break(1u);
    return;
  }
  do
  {
    char v5 = sub_1DCB87648();
    unint64_t v6 = *(void *)(v7 + 16);
    if (v6 >= *(void *)(v7 + 24) >> 1) {
      sub_1DC89840C();
    }
    *(void *)(v7 + 16) = v6 + 1;
    *(unsigned char *)(v7 + v6 + 32) = v5;
    --v2;
  }
  while (v2);
}

void sub_1DCB3DD20(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_10;
  }
  if (!v2) {
    return;
  }
  uint64_t v8 = MEMORY[0x1E4FBC860];
  sub_1DC89827C();
  if (a2 < a1 || v2 < 0)
  {
LABEL_10:
    __break(1u);
    return;
  }
  do
  {
    sub_1DCB87628();
    int v6 = v5;
    unint64_t v7 = *(void *)(v8 + 16);
    if (v7 >= *(void *)(v8 + 24) >> 1) {
      sub_1DC89827C();
    }
    *(void *)(v8 + 16) = v7 + 1;
    *(_DWORD *)(v8 + 4 * v7 + 32) = v6;
    --v2;
  }
  while (v2);
}

uint64_t sub_1DCB3DE20()
{
  uint64_t v1 = sub_1DCB876E8();
  sub_1DC89D4E0();
  uint64_t v3 = v2;
  MEMORY[0x1F4188790](v4);
  int v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DCB43444();
  uint64_t result = sub_1DCB87728();
  if (!v0)
  {
    sub_1DCB876F8();
    sub_1DCB876C8();
    sub_1DCB876D8();
    sub_1DCB43444();
    sub_1DCB87738();
    swift_release();
    swift_release();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v1);
  }
  return result;
}

void sub_1DCB3DF60()
{
  sub_1DC88D6B0();
  sub_1DCB87688();
  sub_1DC89D4E0();
  MEMORY[0x1F4188790](v2);
  uint64_t v3 = sub_1DCB43310();
  sub_1DC89D4E0();
  uint64_t v5 = v4;
  MEMORY[0x1F4188790](v6);
  sub_1DC981E40();
  sub_1DCB43450();
  sub_1DCB87728();
  if (!v0)
  {
    sub_1DCB876F8();
    sub_1DCB876C8();
    sub_1DCB876D8();
    sub_1DCB87738();
    swift_release();
    swift_retain();
    sub_1DCB87678();
    sub_1DCB3F400();
    char v8 = v7;
    if (v9)
    {
      sub_1DC938C14();
      swift_allocError();
      *uint64_t v12 = v8;
      swift_willThrow();
      swift_release();
      swift_release();
      sub_1DC88D5C8();
      v13();
      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v3);
    }
    else
    {
      swift_release();
      swift_release();
      sub_1DC88D5C8();
      v10();
      sub_1DC88D5C8();
      v11();
    }
  }
  sub_1DC89DCC4();
  sub_1DC88D674();
}

void sub_1DCB3E1B0()
{
  sub_1DC88D6B0();
  uint64_t v1 = sub_1DCB87688();
  sub_1DC89D4E0();
  uint64_t v3 = v2;
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1DCB876E8();
  sub_1DC89D4E0();
  uint64_t v9 = v8;
  MEMORY[0x1F4188790](v10);
  sub_1DC981E40();
  sub_1DCB87728();
  if (!v0)
  {
    v18[2] = v1;
    v18[3] = v6;
    v18[4] = v9;
    v18[5] = v7;
    v18[1] = v3;
    sub_1DCB876F8();
    sub_1DCB876C8();
    sub_1DCB41260();
    sub_1DCB876D8();
    sub_1DCB87738();
    swift_release();
    swift_retain();
    sub_1DCB87678();
    sub_1DCB43444();
    sub_1DCB3F400();
    char v13 = v11;
    if (v12)
    {
      sub_1DC938C14();
      swift_allocError();
      *uint64_t v17 = v13;
      swift_willThrow();
    }
    swift_release();
    swift_release();
    uint64_t v14 = sub_1DCB433E8();
    v15(v14);
    sub_1DC8CD890();
    v16();
  }
  sub_1DC88D674();
}

void sub_1DCB3E478()
{
  sub_1DC88D6B0();
  uint64_t v2 = v1;
  sub_1DCB87688();
  sub_1DC89D4E0();
  MEMORY[0x1F4188790](v3);
  sub_1DCB876E8();
  sub_1DC89D4E0();
  MEMORY[0x1F4188790](v4);
  sub_1DCB432C0();
  memcpy(v15, v2, sizeof(v15));
  if (__OFADD__(sub_1DCB42020(v15, v5, v6, v7), 8))
  {
    __break(1u);
  }
  else
  {
    sub_1DCB43450();
    sub_1DCB87728();
    if (!v0)
    {
      sub_1DCB876F8();
      sub_1DCB876C8();
      sub_1DCB412D0(v15);
      sub_1DCB876D8();
      sub_1DCB87738();
      swift_release();
      swift_retain();
      sub_1DCB87678();
      sub_1DCB3F400();
      char v10 = v8;
      if (v9)
      {
        sub_1DC938C14();
        swift_allocError();
        unsigned char *v14 = v10;
        swift_willThrow();
      }
      swift_release();
      swift_release();
      sub_1DC88D5C8();
      v11();
      uint64_t v12 = sub_1DCB43194();
      v13(v12);
    }
    sub_1DC88D674();
  }
}

void sub_1DCB3E700()
{
}

void sub_1DCB3E728()
{
}

void sub_1DCB3E750()
{
}

void sub_1DCB3E778()
{
  sub_1DC88D6B0();
  uint64_t v2 = v1;
  sub_1DCB876E8();
  sub_1DC89D4E0();
  MEMORY[0x1F4188790](v3);
  sub_1DCB432C0();
  if (__OFADD__(sub_1DCB3F29C(v2), 8))
  {
    __break(1u);
  }
  else
  {
    sub_1DCB43450();
    sub_1DCB87728();
    if (!v0)
    {
      sub_1DCB876F8();
      sub_1DCB876C8();
      sub_1DCB3F4C0(v2);
      sub_1DCB876D8();
      sub_1DCB87738();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v4 = sub_1DCB43194();
      v5(v4);
    }
    sub_1DC88D674();
  }
}

void sub_1DCB3E8C4()
{
  sub_1DC88D6B0();
  sub_1DCB43424();
  sub_1DC89D4E0();
  MEMORY[0x1F4188790](v2);
  sub_1DCB43310();
  sub_1DC89D4E0();
  MEMORY[0x1F4188790](v3);
  sub_1DCB432E8();
  if (__OFADD__(sub_1DCB3F29C(v1), 8))
  {
    __break(1u);
  }
  else
  {
    sub_1DCB87728();
    if (!v0)
    {
      sub_1DCB876F8();
      sub_1DCB876C8();
      sub_1DCB3F4C0(v1);
      sub_1DCB876D8();
      sub_1DCB87738();
      swift_release();
      swift_retain();
      sub_1DCB87678();
      if (sub_1DCB87648() == 1) {
        sub_1DCB3F5F0();
      }
      swift_release();
      swift_release();
      sub_1DC8CD890();
      v4();
      uint64_t v5 = sub_1DCB43218();
      v6(v5);
    }
    sub_1DC89DCC4();
    sub_1DC88D674();
  }
}

void sub_1DCB3EAE4()
{
}

void sub_1DCB3EB0C()
{
}

void sub_1DCB3EB34()
{
  sub_1DC88D6B0();
  uint64_t v2 = sub_1DCB43424();
  sub_1DC89D4E0();
  uint64_t v9 = v3;
  MEMORY[0x1F4188790](v4);
  sub_1DC88D550();
  uint64_t v10 = v5;
  sub_1DCB876E8();
  sub_1DC89D4E0();
  MEMORY[0x1F4188790](v6);
  sub_1DCB432E8();
  if (__OFADD__(sub_1DCB3F29C(v1), 8))
  {
    __break(1u);
  }
  else
  {
    sub_1DCB87728();
    if (!v0)
    {
      sub_1DCB876F8();
      sub_1DCB876C8();
      sub_1DCB3F4C0(v1);
      sub_1DCB876D8();
      sub_1DCB87738();
      swift_release();
      swift_retain();
      sub_1DCB87678();
      if (sub_1DCB87648() == 1) {
        sub_1DCB3F73C();
      }
      swift_release();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v2);
      uint64_t v7 = sub_1DCB43354();
      v8(v7);
    }
    sub_1DC89DCC4();
    sub_1DC88D674();
  }
}

uint64_t sub_1DCB3ED64(uint64_t a1)
{
  switch(a1)
  {
    case 0xA05B56AEEEB622AALL:
      return 11;
    case 0xA7999863D4BD6434:
      return 16;
    case 0xA80C09E1359627FELL:
      return 3;
    case 0xB4AA481BE1FDE43ALL:
      return 12;
    case 0xB85A2ACE36B59E0CLL:
      return 4;
    case 0xC1061158A6EF645BLL:
      return 1;
    case 0xC5B924663006A428:
      return 0;
    case 0xC6E760DD47B2C80FLL:
      return 10;
    case 0xEC86CD7F9908C763:
      return 8;
    case 0xF7B74B2F7799A98BLL:
      return 9;
    case 0x2845DB5F511B4BDLL:
      return 13;
    case 0x667A44265312B161:
      return 7;
    case 0xB7557F369368E5ALL:
      return 5;
    case 0x200EC452214DB258:
      return 14;
    case 0x2DD4073BB2F83286:
      return 15;
    case 0x54EC16DA33AB016CLL:
      return 6;
    case 0x76F1521F8653CE2:
      return 2;
  }
  return 17;
}

uint64_t sub_1DCB3EF8C(uint64_t a1)
{
  switch(a1)
  {
    case 0x80126D949929C654:
      return 9;
    case 0x9094EC1D31E278F3:
      return 4;
    case 0xA50962D2B59FB697:
      return 7;
    case 0x7F7B2594F1CDFC26:
      return 3;
    case 0xFE267728FDFA9246:
      return 11;
    case 0x2D787BC6DE9B341:
      return 12;
    case 0x1B795E774E951A5DLL:
      return 10;
    case 0x3B780FAB693D8BD9:
      return 6;
    case 0x5542283F2D7D9659:
      return 8;
    case 0x57E29905DCBE3961:
      return 5;
    case 0x678009F229B2CCD0:
      return 0;
    case 0x6B447290CD5047BALL:
      return 13;
    case 0x7B90A92065B64AACLL:
      return 1;
    case 0xA686EEC936C06A86:
      return 2;
  }
  return 14;
}

uint64_t sub_1DCB3F154(uint64_t a1)
{
  switch(a1)
  {
    case 0x9F4F88E3E848C0D6:
      return 9;
    case 0xA4C369110A5245FFLL:
      return 7;
    case 0xB6438CFD4F02BBE8:
      return 3;
    case 0xCB1950A52A9C8BD6:
      return 4;
    case 0xC3B126BD3C7C0BCLL:
      return 0;
    case 0x286E0B96332FA124:
      return 1;
    case 0x7973C1DC54C48923:
      return 5;
    case 0x43B6383B7310EDE6:
      return 8;
    case 0x46BD4B3D40F57A48:
      return 6;
    case 0x301B8A18FA2DFB16:
      return 2;
  }
  return 10;
}

unint64_t sub_1DCB3F29C(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 16);
  if (result >= 2)
  {
    uint64_t v2 = 0;
    while (v2 != 14)
    {
      if (result - 1 == ++v2) {
        return result;
      }
    }
    return 16;
  }
  return result;
}

uint64_t sub_1DCB3F2D0(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  sub_1DCB3F310(a1);
  return v2;
}

uint64_t sub_1DCB3F310(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1DCB87718();
  sub_1DC89D4E0();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  sub_1DCB87758();
  swift_allocObject();
  uint64_t v9 = sub_1DCB87748();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v4);
  *(void *)(v2 + 16) = v9;
  return v2;
}

void sub_1DCB3F400()
{
  int v0 = sub_1DCB87648();
  if (v0 == 1)
  {
    sub_1DCB40E24();
  }
  else if (v0)
  {
    sub_1DCB88C68();
    __break(1u);
  }
  else
  {
    sub_1DCB3DC28(0, 16);
  }
}

uint64_t sub_1DCB3F4C0(uint64_t a1)
{
  if (*(void *)(a1 + 16) == 16)
  {
    swift_bridgeObjectRetain();
    for (uint64_t i = 32; i != 48; ++i)
      sub_1DCB876B8();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_1DCB88A98();
    sub_1DCB87A18();
    sub_1DCB87A18();
    sub_1DCB88F98();
    sub_1DCB87A18();
    swift_bridgeObjectRelease();
    uint64_t result = sub_1DCB88C68();
    __break(1u);
  }
  return result;
}

uint64_t sub_1DCB3F5F0()
{
  uint64_t v1 = sub_1DCB87658();
  switch(v1)
  {
    case 0xCAFC1CD77EB0E6EDLL:
      uint64_t result = sub_1DCB40E24();
      if (!v0) {
        return result | 0x40;
      }
      break;
    case 0x385465D0567AF133:
      return 128;
    case 0xD4E65CB265808313:
      return sub_1DCB40F74();
    default:
      sub_1DCB88A98();
      swift_bridgeObjectRelease();
      sub_1DCB88F98();
      sub_1DCB87A18();
      swift_bridgeObjectRelease();
      uint64_t result = sub_1DCB88C68();
      __break(1u);
      break;
  }
  return result;
}

uint64_t sub_1DCB3F73C()
{
  uint64_t v1 = sub_1DCB87658();
  switch(v1)
  {
    case 0x7CDFD625139CCB69:
      uint64_t result = sub_1DCB40E24();
      if (!v0) {
        return result | 0x40;
      }
      break;
    case 0x36378DC0B5CDF907:
      return 128;
    case 0xD6F3B8EF6B967A21:
      uint64_t result = sub_1DCB40D14();
      if (!v0) {
        return result & 1;
      }
      break;
    default:
      sub_1DCB88A98();
      swift_bridgeObjectRelease();
      sub_1DCB88F98();
      sub_1DCB87A18();
      swift_bridgeObjectRelease();
      uint64_t result = sub_1DCB88C68();
      __break(1u);
      break;
  }
  return result;
}

uint64_t sub_1DCB3F890@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1DCB3F2D0(a1);
  *a2 = result;
  return result;
}

void sub_1DCB3F8B8()
{
  sub_1DC88D6B0();
  v115 = v0;
  v116 = v1;
  v119 = v2;
  uint64_t v3 = sub_1DCB876E8();
  sub_1DC89D4E0();
  uint64_t v111 = v4;
  MEMORY[0x1F4188790](v5);
  sub_1DC88D550();
  uint64_t v110 = v6;
  uint64_t v7 = sub_1DC87E988(&qword_1EAAABA98);
  MEMORY[0x1F4188790](v7 - 8);
  v108 = (void (*)(void))((char *)v101 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1DC9198D0();
  MEMORY[0x1F4188790](v9);
  sub_1DC91990C();
  v107 = v10;
  sub_1DC9198D0();
  MEMORY[0x1F4188790](v11);
  sub_1DC91990C();
  v106 = v12;
  sub_1DC9198D0();
  MEMORY[0x1F4188790](v13);
  sub_1DC91990C();
  uint64_t v104 = v14;
  sub_1DC9198D0();
  MEMORY[0x1F4188790](v15);
  sub_1DC91990C();
  uint64_t v103 = v16;
  sub_1DC9198D0();
  MEMORY[0x1F4188790](v17);
  sub_1DC91990C();
  uint64_t v102 = v18;
  sub_1DC9198D0();
  MEMORY[0x1F4188790](v19);
  sub_1DC91990C();
  uint64_t v109 = v20;
  sub_1DC9198D0();
  MEMORY[0x1F4188790](v21);
  sub_1DC91990C();
  v101[1] = v22;
  sub_1DC9198D0();
  MEMORY[0x1F4188790](v23);
  sub_1DC91990C();
  uint64_t v105 = v24;
  sub_1DC9198D0();
  uint64_t v26 = MEMORY[0x1F4188790](v25);
  v28 = (char *)v101 - v27;
  MEMORY[0x1F4188790](v26);
  id v30 = (char *)v101 - v29;
  sub_1DCB87688();
  sub_1DC89D4E0();
  uint64_t v32 = v31;
  uint64_t v34 = MEMORY[0x1F4188790](v33);
  uint64_t v36 = (char *)v101 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = MEMORY[0x1F4188790](v34);
  v39 = (char *)v101 - v38;
  uint64_t v40 = MEMORY[0x1F4188790](v37);
  v42 = (char *)v101 - v41;
  MEMORY[0x1F4188790](v40);
  v44 = (char *)v101 - v43;
  uint64_t v117 = v45;
  uint64_t v118 = v32;
  v112 = *(void (**)(char *, char *))(v32 + 16);
  v112((char *)v101 - v43, v119);
  v113 = (char *)v3;
  v114 = v30;
  _s13SoundAnalysis11SNAOPReportV14SuccessPayloadOwst_0((uint64_t)v30, 1, 1, v3);
  v119 = v44;
  switch(sub_1DCB40624())
  {
    case 1u:
      sub_1DCB431AC();
      sub_1DCB4325C();
      v61 = v1;
      sub_1DCB4324C();
      v68();
      swift_bridgeObjectRelease();
      uint64_t v60 = v102;
      goto LABEL_17;
    case 2u:
      sub_1DCB431AC();
      sub_1DCB4325C();
      sub_1DCB4324C();
      v59();
      swift_bridgeObjectRelease();
      uint64_t v60 = v104;
      sub_1DCB4345C();
      goto LABEL_18;
    case 3u:
      sub_1DCB431AC();
      sub_1DCB4325C();
      v61 = v1;
      sub_1DCB4324C();
      v62();
      swift_bridgeObjectRelease();
      uint64_t v60 = v103;
LABEL_17:
      sub_1DCB4345C();
      uint64_t v1 = v61;
LABEL_18:
      sub_1DCB87668();
      if (v1) {
        goto LABEL_19;
      }
      v44 = v113;
      _s13SoundAnalysis11SNAOPReportV14SuccessPayloadOwst_0(v60, 0, 1, (uint64_t)v113);
      uint64_t v48 = v60;
      goto LABEL_21;
    case 4u:
      sub_1DCB431AC();
      sub_1DCB43400();
      v116 = v1;
      sub_1DCB4324C();
      uint64_t v50 = v49();
      swift_bridgeObjectRelease();
      uint64_t v51 = v117;
      sub_1DCB43394();
      v52();
      v53 = v106;
      sub_1DCB433BC();
      v54 = v116;
      sub_1DCB87668();
      if (v54)
      {
        v55 = *(void (**)(char *, uint64_t))(v118 + 8);
        v55(v42, v51);
        v55((char *)v3, v51);
        goto LABEL_26;
      }
      LODWORD(v116) = v50;
      sub_1DCB43384();
      sub_1DCA78710();
      v53();
      sub_1DCB431D4();
      int v84 = sub_1DCB43230();
      if (v50 > 0xEFu) {
        goto LABEL_37;
      }
      if (!v84)
      {
        sub_1DCB876B8();
        v44 = v113;
      }
      if (_s13SoundAnalysis11SNAOPReportV14SuccessPayloadOwet_0(v50, 1, (uint64_t)v44)) {
        goto LABEL_60;
      }
      sub_1DCB407D4(v116);
      goto LABEL_59;
    case 5u:
      uint64_t v70 = v115[7];
      sub_1DC881A8C(v115 + 3, v115[6]);
      uint64_t v50 = (uint64_t)v119;
      v71 = v116;
      sub_1DCB3DC28(0, 16);
      v116 = v71;
      int v72 = (*(uint64_t (**)(void))(v70 + 80))();
      swift_bridgeObjectRelease();
      sub_1DCB43394();
      v73();
      v74 = v108;
      v44 = v36;
      v75 = v116;
      sub_1DCB87668();
      if (v75)
      {
        v76 = *(void (**)(void))(v118 + 8);
        sub_1DCA78710();
        v76();
        sub_1DCA78710();
        v76();
        goto LABEL_26;
      }
      LODWORD(v116) = v72;
      sub_1DCB43384();
      sub_1DCA78710();
      v74();
      sub_1DCB431D4();
      int v84 = sub_1DCB43230();
      if (v72 > 0xFBu) {
        goto LABEL_37;
      }
      goto LABEL_40;
    case 6u:
      sub_1DCB431AC();
      sub_1DCB43400();
      v116 = v1;
      sub_1DCB4324C();
      uint64_t v50 = v77();
      swift_bridgeObjectRelease();
      uint64_t v78 = v117;
      sub_1DCB43394();
      v79();
      v80 = v107;
      sub_1DCB43450();
      v81 = v116;
      sub_1DCB87668();
      if (v81)
      {
        v82 = *(void (**)(char *, uint64_t))(v118 + 8);
        v82(v39, v78);
        v82((char *)v3, v78);
        goto LABEL_26;
      }
      LODWORD(v116) = v50;
      sub_1DCB43384();
      v80(v39, v78);
      sub_1DCB431D4();
      int v84 = sub_1DCB43230();
      if (v50 > 0xFBu)
      {
LABEL_37:
        if (v84) {
          goto LABEL_60;
        }
        sub_1DCB876B8();
        goto LABEL_59;
      }
LABEL_40:
      if (!v84)
      {
        sub_1DCB876B8();
        v44 = v113;
      }
      if (!_s13SoundAnalysis11SNAOPReportV14SuccessPayloadOwet_0(v50, 1, (uint64_t)v44))
      {
        sub_1DCB408DC(v116);
        goto LABEL_59;
      }
      goto LABEL_60;
    case 7u:
      uint64_t v63 = v115[6];
      uint64_t v64 = v115[7];
      v44 = (char *)sub_1DC881A8C(v115 + 3, v63);
      v65 = v116;
      uint64_t v66 = (*(uint64_t (**)(uint64_t, uint64_t))(v64 + 16))(v63, v64);
      if (v65)
      {
        v121[0] = v65;
        sub_1DC87E988(&qword_1EAA9DF60);
        if (sub_1DCB43338())
        {
          uint64_t v67 = v120;

          goto LABEL_35;
        }
LABEL_67:

        sub_1DCB88C68();
        __break(1u);
        JUMPOUT(0x1DCB405FCLL);
      }
      uint64_t v67 = v66;
      v44 = (char *)sub_1DCB87708();
      if (!__OFADD__(sub_1DCB3F29C(v67), 1))
      {
LABEL_35:
        uint64_t v50 = (uint64_t)v114;
        sub_1DCB433BC();
        sub_1DCB87668();
        sub_1DCB43280();
        if (sub_1DCB43230())
        {
          char v88 = v65 != 0;
          uint64_t v87 = v67;
          goto LABEL_51;
        }
        sub_1DCB40704(v67, v65 != 0);
        char v95 = v65 != 0;
        uint64_t v94 = v67;
LABEL_58:
        sub_1DC90249C(v94, v95);
LABEL_59:
        v44 = v113;
        goto LABEL_60;
      }
      __break(1u);
      goto LABEL_65;
    case 8u:
      sub_1DC8B9960((uint64_t)(v115 + 3), (uint64_t)v121);
      sub_1DC881A8C(v121, v122);
      sub_1DCB433CC();
      sub_1DCB41060(v83);
      if (!v1)
      {
        memcpy(v125, v124, sizeof(v125));
        sub_1DCB43444();
        uint64_t v92 = v85();
        sub_1DCA57F64((uint64_t)v124);
        sub_1DC8818D0((uint64_t)v121);
        v44 = (char *)sub_1DCB87708();
        unint64_t v93 = sub_1DCB3F29C(v92);
        uint64_t v50 = (uint64_t)v114;
        if (!__OFADD__(v93, 1)) {
          goto LABEL_47;
        }
LABEL_66:
        __break(1u);
        goto LABEL_67;
      }
      sub_1DC8818D0((uint64_t)v121);
      v121[0] = v1;
      sub_1DC87E988(&qword_1EAA9DF60);
      int v86 = sub_1DCB43338();
      uint64_t v50 = (uint64_t)v114;
      if (!v86) {
        goto LABEL_67;
      }

LABEL_47:
      sub_1DCB433BC();
      sub_1DCB87668();
      sub_1DCB43280();
      if (!sub_1DCB43230())
      {
        uint64_t v89 = sub_1DCB433DC();
        sub_1DCB40704(v89, v90);
        uint64_t v94 = sub_1DCB433DC();
        goto LABEL_58;
      }
      uint64_t v87 = sub_1DCB433DC();
LABEL_51:
      sub_1DC90249C(v87, v88);
LABEL_60:
      if (sub_1DCB43230())
      {
        sub_1DC88D5C8();
        v96();
      }
      else
      {
        uint64_t v98 = v110;
        uint64_t v97 = v111;
        (*(void (**)(uint64_t, uint64_t, char *))(v111 + 16))(v110, v50, v44);
        sub_1DCB876D8();
        (*(void (**)(uint64_t, char *))(v97 + 8))(v98, v44);
        uint64_t v99 = sub_1DCB433A4();
        v100(v99);
      }
LABEL_63:
      sub_1DCB427D8(v50);
      sub_1DC89DCC4();
      sub_1DC88D674();
      return;
    case 9u:
      sub_1DC8B9960((uint64_t)(v115 + 3), (uint64_t)v121);
      uint64_t v56 = v122;
      uint64_t v57 = v123;
      sub_1DC881A8C(v121, v122);
      sub_1DCB433CC();
      uint64_t v58 = sub_1DCB40C28();
      if (v1)
      {
        sub_1DC8818D0((uint64_t)v121);
        v121[0] = v1;
        sub_1DC87E988(&qword_1EAA9DF60);
        if (!sub_1DCB43338()) {
          goto LABEL_67;
        }
      }
      else
      {
        uint64_t v91 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v57 + 24))(v58, v56, v57);
        sub_1DC8818D0((uint64_t)v121);
        v44 = (char *)sub_1DCB87708();
        if (__OFADD__(sub_1DCB3F29C(v91), 1))
        {
LABEL_65:
          __break(1u);
          goto LABEL_66;
        }
      }
      uint64_t v50 = (uint64_t)v114;
      goto LABEL_47;
    default:
      uint64_t v46 = v115[6];
      uint64_t v47 = v115[7];
      sub_1DC881A8C(v115 + 3, v46);
      (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v46, v47);
      sub_1DCB433CC();
      sub_1DCB87668();
      if (!v1)
      {
        v44 = v113;
        _s13SoundAnalysis11SNAOPReportV14SuccessPayloadOwst_0((uint64_t)v28, 0, 1, (uint64_t)v113);
        uint64_t v48 = (uint64_t)v28;
LABEL_21:
        uint64_t v50 = (uint64_t)v114;
        sub_1DCB42838(v48, (uint64_t)v114);
        goto LABEL_60;
      }
LABEL_19:
      sub_1DC88D5C8();
      v69();
LABEL_26:
      uint64_t v50 = (uint64_t)v114;
      goto LABEL_63;
  }
}

uint64_t sub_1DCB40624()
{
  uint64_t v0 = sub_1DCB87658();
  uint64_t result = sub_1DCB3F154(v0);
  if (result == 10)
  {
    sub_1DCB88A98();
    sub_1DCB87A18();
    sub_1DCB88F98();
    sub_1DCB87A18();
    swift_bridgeObjectRelease();
    uint64_t result = sub_1DCB88C68();
    __break(1u);
  }
  return result;
}

uint64_t sub_1DCB40704(uint64_t a1, char a2)
{
  if (a2)
  {
    sub_1DCB876B8();
    return sub_1DCB876C8();
  }
  else
  {
    sub_1DCB876B8();
    return sub_1DCB3F4C0(a1);
  }
}

uint64_t sub_1DCB407D4(unsigned __int8 a1)
{
  if (a1 >> 6)
  {
    if (a1 >> 6 == 1) {
      sub_1DCB876C8();
    }
    return sub_1DCB876C8();
  }
  else
  {
    sub_1DCB876C8();
    return sub_1DCB41298();
  }
}

uint64_t sub_1DCB408DC(unsigned __int8 a1)
{
  if (!(a1 >> 6) || a1 >> 6 == 1) {
    sub_1DCB876C8();
  }
  return sub_1DCB876C8();
}

uint64_t sub_1DCB40990()
{
  swift_release();
  sub_1DC8818D0(v0 + 24);

  return swift_deallocClassInstance();
}

void sub_1DCB409D0()
{
}

uint64_t type metadata accessor for SoundAnalysisService()
{
  return self;
}

uint64_t type metadata accessor for SoundAnalysisService.Service()
{
  return self;
}

uint64_t type metadata accessor for SoundAnalysisService.Server()
{
  return self;
}

void type metadata accessor for TBAccessibilitySoundActionsSoundAction()
{
}

void type metadata accessor for TBSoundRecognitionRequest()
{
}

unsigned char *sub_1DCB40A88(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1DCB40B54);
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

void type metadata accessor for TBSoundRecognitionDetection()
{
}

unint64_t sub_1DCB40B8C()
{
  unint64_t result = qword_1EAAABA88;
  if (!qword_1EAAABA88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAAABA88);
  }
  return result;
}

unint64_t sub_1DCB40BDC()
{
  unint64_t result = qword_1EAAABA90;
  if (!qword_1EAAABA90)
  {
    type metadata accessor for SoundAnalysisService.Server();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAAABA90);
  }
  return result;
}

uint64_t sub_1DCB40C28()
{
  uint64_t v0 = sub_1DCB87658();
  uint64_t result = sub_1DCB3ED64(v0);
  if (result == 17)
  {
    sub_1DCB88A98();
    swift_bridgeObjectRelease();
    sub_1DCB88F98();
    sub_1DCB87A18();
    swift_bridgeObjectRelease();
    uint64_t result = sub_1DCB88C68();
    __break(1u);
  }
  return result;
}

uint64_t sub_1DCB40D14()
{
  uint64_t v0 = sub_1DCB87658();
  if (v0 == 0xCA52B494267CED00) {
    return 1;
  }
  if (v0 == 0xA600ADF28585EF58) {
    return 0;
  }
  sub_1DCB88A98();
  swift_bridgeObjectRelease();
  sub_1DCB88F98();
  sub_1DCB87A18();
  swift_bridgeObjectRelease();
  uint64_t result = sub_1DCB88C68();
  __break(1u);
  return result;
}

uint64_t sub_1DCB40E24()
{
  uint64_t v0 = sub_1DCB87658();
  switch(v0)
  {
    case 0xB801F3AC3EEF488FLL:
      return 0;
    case 0xC5F65F31FE2D91DALL:
      return 3;
    case 0x7C2C4EAC2EADFF1FLL:
      return 1;
    case 0xEB9E83B99489DAF3:
      return 2;
  }
  sub_1DCB88A98();
  swift_bridgeObjectRelease();
  sub_1DCB88F98();
  sub_1DCB87A18();
  swift_bridgeObjectRelease();
  uint64_t result = sub_1DCB88C68();
  __break(1u);
  return result;
}

uint64_t sub_1DCB40F74()
{
  uint64_t v0 = sub_1DCB87658();
  uint64_t result = sub_1DCB3EF8C(v0);
  if (result == 14)
  {
    sub_1DCB88A98();
    swift_bridgeObjectRelease();
    sub_1DCB88F98();
    sub_1DCB87A18();
    swift_bridgeObjectRelease();
    uint64_t result = sub_1DCB88C68();
    __break(1u);
  }
  return result;
}

void sub_1DCB41060(uint64_t a1@<X8>)
{
  int v31 = sub_1DCB87638();
  sub_1DCB3DD20(0, 512);
  uint64_t v30 = v2;
  sub_1DCB3DD20(0, 10240);
  uint64_t v29 = v3;
  sub_1DCB3DD20(0, 10);
  uint64_t v28 = v4;
  sub_1DCB3DD20(0, 200);
  uint64_t v27 = v5;
  sub_1DCB3DD20(0, 4);
  uint64_t v26 = v6;
  sub_1DCB3DD20(0, 160);
  uint64_t v25 = v7;
  sub_1DCB3DD20(0, 8);
  uint64_t v24 = v8;
  sub_1DCB3DD20(0, 320);
  uint64_t v10 = v9;
  sub_1DCB3DD20(0, 8);
  uint64_t v12 = v11;
  sub_1DCB3DD20(0, 320);
  uint64_t v14 = v13;
  sub_1DCB3DD20(0, 8);
  uint64_t v16 = v15;
  sub_1DCB3DD20(0, 256);
  uint64_t v18 = v17;
  sub_1DCB3DD20(0, 32);
  uint64_t v20 = v19;
  sub_1DCB3DD20(0, 64);
  uint64_t v22 = v21;
  sub_1DCB3DD20(0, 2);
  *(_DWORD *)a1 = v31;
  *(void *)(a1 + 8) = v30;
  *(void *)(a1 + 16) = v29;
  *(void *)(a1 + 24) = v28;
  *(void *)(a1 + 32) = v27;
  *(void *)(a1 + 40) = v26;
  *(void *)(a1 + 48) = v25;
  *(void *)(a1 + 56) = v24;
  *(void *)(a1 + 64) = v10;
  *(void *)(a1 + 72) = v12;
  *(void *)(a1 + 80) = v14;
  *(void *)(a1 + 88) = v16;
  *(void *)(a1 + 96) = v18;
  *(void *)(a1 + 104) = v20;
  *(void *)(a1 + 112) = v22;
  *(void *)(a1 + 120) = v23;
}

uint64_t sub_1DCB41260()
{
  return sub_1DCB876C8();
}

uint64_t sub_1DCB41298()
{
  return sub_1DCB876C8();
}

uint64_t sub_1DCB412D0(void *a1)
{
  sub_1DCB876A8();
  uint64_t v46 = a1[1];
  uint64_t v2 = *(void *)(v46 + 16);
  if (v2 != 512)
  {
    sub_1DCB88A98();
    sub_1DCB87A18();
    sub_1DCB87A18();
    uint64_t v45 = v2;
    sub_1DCB88F98();
    sub_1DCB87A18();
    swift_bridgeObjectRelease();
LABEL_62:
    uint64_t result = sub_1DCB88C68();
    __break(1u);
    return result;
  }
  swift_bridgeObjectRetain();
  for (uint64_t i = 0; i != 2048; i += 4)
    sub_1DCB87698();
  sub_1DC8CBD50((uint64_t)&v46);
  uint64_t v45 = a1[2];
  uint64_t v4 = *(void *)(v45 + 16);
  if (v4 != 10240)
  {
    sub_1DCB88A98();
    sub_1DCB87A18();
    sub_1DCB87A18();
    uint64_t v44 = v4;
    sub_1DCB88F98();
    sub_1DCB87A18();
    swift_bridgeObjectRelease();
    goto LABEL_62;
  }
  swift_bridgeObjectRetain();
  for (uint64_t j = 0; j != 40960; j += 4)
    sub_1DCB87698();
  sub_1DC8CBD50((uint64_t)&v45);
  uint64_t v44 = a1[3];
  uint64_t v6 = *(void *)(v44 + 16);
  if (v6 != 10)
  {
    sub_1DCB88A98();
    sub_1DCB87A18();
    sub_1DCB87A18();
    uint64_t v43 = v6;
    sub_1DCB88F98();
    sub_1DCB87A18();
    swift_bridgeObjectRelease();
    goto LABEL_62;
  }
  swift_bridgeObjectRetain();
  for (uint64_t k = 0; k != 40; k += 4)
    sub_1DCB87698();
  sub_1DC8CBD50((uint64_t)&v44);
  uint64_t v43 = a1[4];
  if (*(void *)(v43 + 16) != 200)
  {
    uint64_t v28 = *(void *)(v43 + 16);
    sub_1DCB88A98();
    sub_1DCB87A18();
    sub_1DCB87A18();
    uint64_t v42 = v28;
    sub_1DCB88F98();
    sub_1DCB87A18();
    swift_bridgeObjectRelease();
    goto LABEL_62;
  }
  swift_bridgeObjectRetain();
  for (uint64_t m = 32; m != 832; m += 4)
    sub_1DCB87698();
  sub_1DC8CBD50((uint64_t)&v43);
  uint64_t v42 = a1[5];
  uint64_t v9 = *(void *)(v42 + 16);
  if (v9 != 4)
  {
    sub_1DCB88A98();
    sub_1DCB87A18();
    sub_1DCB87A18();
    uint64_t v41 = v9;
    sub_1DCB88F98();
    sub_1DCB87A18();
    swift_bridgeObjectRelease();
    goto LABEL_62;
  }
  swift_bridgeObjectRetain();
  for (uint64_t n = 0; n != 16; n += 4)
    sub_1DCB87698();
  sub_1DC8CBD50((uint64_t)&v42);
  uint64_t v41 = a1[6];
  if (*(void *)(v41 + 16) != 160)
  {
    uint64_t v29 = *(void *)(v41 + 16);
    sub_1DCB88A98();
    sub_1DCB87A18();
    sub_1DCB87A18();
    uint64_t v40 = v29;
    sub_1DCB88F98();
    sub_1DCB87A18();
    swift_bridgeObjectRelease();
    goto LABEL_62;
  }
  swift_bridgeObjectRetain();
  for (iuint64_t i = 32; ii != 672; ii += 4)
    sub_1DCB87698();
  sub_1DC8CBD50((uint64_t)&v41);
  uint64_t v40 = a1[7];
  uint64_t v12 = *(void *)(v40 + 16);
  if (v12 != 8)
  {
    sub_1DCB88A98();
    sub_1DCB87A18();
    sub_1DCB87A18();
    uint64_t v39 = v12;
    sub_1DCB88F98();
    sub_1DCB87A18();
    swift_bridgeObjectRelease();
    goto LABEL_62;
  }
  swift_bridgeObjectRetain();
  for (juint64_t j = 0; jj != 32; jj += 4)
    sub_1DCB87698();
  sub_1DC8CBD50((uint64_t)&v40);
  uint64_t v39 = a1[8];
  if (*(void *)(v39 + 16) != 320)
  {
    uint64_t v30 = *(void *)(v39 + 16);
    sub_1DCB88A98();
    sub_1DCB87A18();
    sub_1DCB87A18();
    uint64_t v38 = v30;
    sub_1DCB88F98();
    sub_1DCB87A18();
    swift_bridgeObjectRelease();
    goto LABEL_62;
  }
  swift_bridgeObjectRetain();
  for (kuint64_t k = 32; kk != 1312; kk += 4)
    sub_1DCB87698();
  sub_1DC8CBD50((uint64_t)&v39);
  uint64_t v38 = a1[9];
  uint64_t v15 = *(void *)(v38 + 16);
  if (v15 != 8)
  {
    sub_1DCB88A98();
    sub_1DCB87A18();
    sub_1DCB87A18();
    uint64_t v37 = v15;
    sub_1DCB88F98();
    sub_1DCB87A18();
    swift_bridgeObjectRelease();
    goto LABEL_62;
  }
  swift_bridgeObjectRetain();
  for (muint64_t m = 0; mm != 32; mm += 4)
    sub_1DCB87698();
  sub_1DC8CBD50((uint64_t)&v38);
  uint64_t v37 = a1[10];
  if (*(void *)(v37 + 16) != 320)
  {
    uint64_t v31 = *(void *)(v37 + 16);
    sub_1DCB88A98();
    sub_1DCB87A18();
    sub_1DCB87A18();
    uint64_t v36 = v31;
    sub_1DCB88F98();
    sub_1DCB87A18();
    swift_bridgeObjectRelease();
    goto LABEL_62;
  }
  swift_bridgeObjectRetain();
  for (nuint64_t n = 32; nn != 1312; nn += 4)
    sub_1DCB87698();
  sub_1DC8CBD50((uint64_t)&v37);
  uint64_t v36 = a1[11];
  uint64_t v18 = *(void *)(v36 + 16);
  if (v18 != 8)
  {
    sub_1DCB88A98();
    sub_1DCB87A18();
    sub_1DCB87A18();
    uint64_t v35 = v18;
    sub_1DCB88F98();
    sub_1DCB87A18();
    swift_bridgeObjectRelease();
    goto LABEL_62;
  }
  swift_bridgeObjectRetain();
  for (uint64_t i1 = 0; i1 != 32; i1 += 4)
    sub_1DCB87698();
  sub_1DC8CBD50((uint64_t)&v36);
  uint64_t v35 = a1[12];
  uint64_t v20 = *(void *)(v35 + 16);
  if (v20 != 256)
  {
    sub_1DCB88A98();
    sub_1DCB87A18();
    sub_1DCB87A18();
    uint64_t v34 = v20;
    sub_1DCB88F98();
    sub_1DCB87A18();
    swift_bridgeObjectRelease();
    goto LABEL_62;
  }
  swift_bridgeObjectRetain();
  for (uint64_t i2 = 0; i2 != 1024; i2 += 4)
    sub_1DCB87698();
  sub_1DC8CBD50((uint64_t)&v35);
  uint64_t v34 = a1[13];
  uint64_t v22 = *(void *)(v34 + 16);
  if (v22 != 32)
  {
    sub_1DCB88A98();
    sub_1DCB87A18();
    sub_1DCB87A18();
    uint64_t v33 = v22;
    sub_1DCB88F98();
    sub_1DCB87A18();
    swift_bridgeObjectRelease();
    goto LABEL_62;
  }
  swift_bridgeObjectRetain();
  for (uint64_t i3 = 0; i3 != 128; i3 += 4)
    sub_1DCB87698();
  sub_1DC8CBD50((uint64_t)&v34);
  uint64_t v33 = a1[14];
  uint64_t v24 = *(void *)(v33 + 16);
  if (v24 != 64)
  {
    sub_1DCB88A98();
    sub_1DCB87A18();
    sub_1DCB87A18();
    uint64_t v32 = v24;
    sub_1DCB88F98();
    sub_1DCB87A18();
    swift_bridgeObjectRelease();
    goto LABEL_62;
  }
  swift_bridgeObjectRetain();
  for (uint64_t i4 = 0; i4 != 256; i4 += 4)
    sub_1DCB87698();
  sub_1DC8CBD50((uint64_t)&v33);
  uint64_t v32 = a1[15];
  if (*(void *)(v32 + 16) != 2)
  {
    sub_1DCB88A98();
    sub_1DCB87A18();
    sub_1DCB87A18();
    sub_1DCB88F98();
    sub_1DCB87A18();
    swift_bridgeObjectRelease();
    goto LABEL_62;
  }
  swift_bridgeObjectRetain();
  for (uint64_t i5 = 0; i5 != 8; i5 += 4)
    sub_1DCB87698();
  return sub_1DC8CBD50((uint64_t)&v32);
}

void *sub_1DCB42020(void *result, double a2, int64x2_t a3, int64x2_t a4)
{
  uint64_t v4 = *(void *)(result[1] + 16);
  if (v4)
  {
    if (v4 == 1)
    {
      uint64_t v4 = 4;
    }
    else
    {
      uint64_t v5 = 0;
      unint64_t v6 = v4 - 2;
      unint64_t v7 = 510;
      if (v6 < 0x1FE) {
        unint64_t v7 = v6;
      }
      uint64x2_t v8 = (uint64x2_t)vdupq_n_s64(v7);
      a3 = (int64x2_t)xmmword_1DCBE3840;
      int64x2_t v9 = vdupq_n_s64(4uLL);
      do
      {
        a4 = a3;
        a3 = vaddq_s64(a3, v9);
        v5 += 2;
      }
      while ((((_WORD)v7 + 2) & 0x3FE) != v5);
      uint64_t v4 = vaddvq_s64((int64x2_t)vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)vorrq_s8((int8x16_t)vdupq_n_s64(v5 - 2), (int8x16_t)xmmword_1DCBCB680), v8), (int8x16_t)a4, (int8x16_t)a3));
    }
  }
  uint64_t v10 = v4 + 4;
  if (__OFADD__(v4, 4))
  {
    __break(1u);
LABEL_133:
    __break(1u);
LABEL_134:
    __break(1u);
LABEL_135:
    __break(1u);
LABEL_136:
    __break(1u);
LABEL_137:
    __break(1u);
LABEL_138:
    __break(1u);
LABEL_139:
    __break(1u);
LABEL_140:
    __break(1u);
LABEL_141:
    __break(1u);
LABEL_142:
    __break(1u);
LABEL_143:
    __break(1u);
LABEL_144:
    __break(1u);
LABEL_145:
    __break(1u);
LABEL_146:
    __break(1u);
    return result;
  }
  uint64_t v11 = *(void *)(result[2] + 16);
  if (v11)
  {
    if (v11 == 1)
    {
      uint64_t v11 = 4;
    }
    else
    {
      uint64_t v12 = 0;
      unint64_t v13 = v11 - 2;
      unint64_t v14 = 10238;
      if (v13 < 0x27FE) {
        unint64_t v14 = v13;
      }
      uint64x2_t v15 = (uint64x2_t)vdupq_n_s64(v14);
      a3 = (int64x2_t)xmmword_1DCBE3840;
      int64x2_t v16 = vdupq_n_s64(4uLL);
      do
      {
        a4 = a3;
        a3 = vaddq_s64(a3, v16);
        v12 += 2;
      }
      while ((((_WORD)v14 + 2) & 0x7FFE) != v12);
      uint64_t v11 = vaddvq_s64((int64x2_t)vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)vorrq_s8((int8x16_t)vdupq_n_s64(v12 - 2), (int8x16_t)xmmword_1DCBCB680), v15), (int8x16_t)a4, (int8x16_t)a3));
    }
  }
  BOOL v17 = __OFADD__(v10, v11);
  uint64_t v18 = v10 + v11;
  if (v17) {
    goto LABEL_133;
  }
  uint64_t v19 = *(void *)(result[3] + 16);
  if (v19)
  {
    if (v19 == 1)
    {
      uint64_t v19 = 4;
    }
    else
    {
      uint64_t v20 = 0;
      unint64_t v21 = v19 - 2;
      unint64_t v22 = 8;
      if (v21 < 8) {
        unint64_t v22 = v21;
      }
      uint64x2_t v23 = (uint64x2_t)vdupq_n_s64(v22);
      a3 = (int64x2_t)xmmword_1DCBE3840;
      int64x2_t v24 = vdupq_n_s64(4uLL);
      do
      {
        a4 = a3;
        a3 = vaddq_s64(a3, v24);
        v20 += 2;
      }
      while ((((_BYTE)v22 + 2) & 0x1E) != v20);
      uint64_t v19 = vaddvq_s64((int64x2_t)vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)vorrq_s8((int8x16_t)vdupq_n_s64(v20 - 2), (int8x16_t)xmmword_1DCBCB680), v23), (int8x16_t)a4, (int8x16_t)a3));
    }
  }
  BOOL v17 = __OFADD__(v18, v19);
  uint64_t v25 = v18 + v19;
  if (v17) {
    goto LABEL_134;
  }
  uint64_t v26 = *(void *)(result[4] + 16);
  if (v26)
  {
    if (v26 == 1)
    {
      uint64_t v26 = 4;
    }
    else
    {
      uint64_t v27 = 0;
      unint64_t v28 = v26 - 2;
      unint64_t v29 = 198;
      if (v28 < 0xC6) {
        unint64_t v29 = v28;
      }
      uint64x2_t v30 = (uint64x2_t)vdupq_n_s64(v29);
      a3 = (int64x2_t)xmmword_1DCBE3840;
      int64x2_t v31 = vdupq_n_s64(4uLL);
      do
      {
        a4 = a3;
        a3 = vaddq_s64(a3, v31);
        v27 += 2;
      }
      while ((((_WORD)v29 + 2) & 0x1FE) != v27);
      uint64_t v26 = vaddvq_s64((int64x2_t)vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)vorrq_s8((int8x16_t)vdupq_n_s64(v27 - 2), (int8x16_t)xmmword_1DCBCB680), v30), (int8x16_t)a4, (int8x16_t)a3));
    }
  }
  BOOL v17 = __OFADD__(v25, v26);
  uint64_t v32 = v25 + v26;
  if (v17) {
    goto LABEL_135;
  }
  uint64_t v33 = *(void *)(result[5] + 16);
  if (v33)
  {
    if (v33 == 1)
    {
      uint64_t v33 = 4;
    }
    else
    {
      unint64_t v34 = v33 - 2;
      if (v34 >= 2) {
        unint64_t v34 = 2;
      }
      uint64x2_t v35 = (uint64x2_t)vdupq_n_s64(v34);
      unint64_t v36 = ((_BYTE)v34 + 2) & 6;
      a3.i64[0] = v36;
      a4.i64[0] = 2;
      int8x16_t v37 = (int8x16_t)vdupq_lane_s64(vceqq_s64(a3, a4).i64[0], 0);
      uint64_t v33 = vaddvq_s64((int64x2_t)vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)vorrq_s8((int8x16_t)vdupq_n_s64(2 * (unint64_t)(v36 != 2)), (int8x16_t)xmmword_1DCBCB680), v35), vbslq_s8(v37, (int8x16_t)xmmword_1DCBE3840, (int8x16_t)xmmword_1DCBE3850), vbslq_s8(v37, (int8x16_t)xmmword_1DCBE3850, (int8x16_t)xmmword_1DCBE3860)));
    }
  }
  BOOL v17 = __OFADD__(v32, v33);
  uint64_t v38 = v32 + v33;
  if (v17) {
    goto LABEL_136;
  }
  uint64_t v39 = *(void *)(result[6] + 16);
  if (v39)
  {
    if (v39 == 1)
    {
      uint64_t v39 = 4;
    }
    else
    {
      uint64_t v40 = 0;
      unint64_t v41 = v39 - 2;
      unint64_t v42 = 158;
      if (v41 < 0x9E) {
        unint64_t v42 = v41;
      }
      uint64x2_t v43 = (uint64x2_t)vdupq_n_s64(v42);
      int64x2_t v44 = (int64x2_t)xmmword_1DCBE3840;
      int64x2_t v45 = vdupq_n_s64(4uLL);
      do
      {
        int8x16_t v46 = (int8x16_t)v44;
        int64x2_t v44 = vaddq_s64(v44, v45);
        v40 += 2;
      }
      while ((((_WORD)v42 + 2) & 0x1FE) != v40);
      uint64_t v39 = vaddvq_s64((int64x2_t)vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)vorrq_s8((int8x16_t)vdupq_n_s64(v40 - 2), (int8x16_t)xmmword_1DCBCB680), v43), v46, (int8x16_t)v44));
    }
  }
  BOOL v17 = __OFADD__(v38, v39);
  uint64_t v47 = v38 + v39;
  if (v17) {
    goto LABEL_137;
  }
  uint64_t v48 = *(void *)(result[7] + 16);
  if (v48)
  {
    if (v48 == 1)
    {
      uint64_t v48 = 4;
    }
    else
    {
      uint64_t v49 = 0;
      unint64_t v50 = v48 - 2;
      unint64_t v51 = 6;
      if (v50 < 6) {
        unint64_t v51 = v50;
      }
      uint64x2_t v52 = (uint64x2_t)vdupq_n_s64(v51);
      int64x2_t v53 = (int64x2_t)xmmword_1DCBE3840;
      int64x2_t v54 = vdupq_n_s64(4uLL);
      do
      {
        int8x16_t v55 = (int8x16_t)v53;
        int64x2_t v53 = vaddq_s64(v53, v54);
        v49 += 2;
      }
      while ((((_BYTE)v51 + 2) & 0xE) != v49);
      uint64_t v48 = vaddvq_s64((int64x2_t)vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)vorrq_s8((int8x16_t)vdupq_n_s64(v49 - 2), (int8x16_t)xmmword_1DCBCB680), v52), v55, (int8x16_t)v53));
    }
  }
  BOOL v17 = __OFADD__(v47, v48);
  uint64_t v56 = v47 + v48;
  if (v17) {
    goto LABEL_138;
  }
  uint64_t v57 = *(void *)(result[8] + 16);
  if (v57)
  {
    if (v57 == 1)
    {
      uint64_t v57 = 4;
    }
    else
    {
      uint64_t v58 = 0;
      unint64_t v59 = v57 - 2;
      unint64_t v60 = 318;
      if (v59 < 0x13E) {
        unint64_t v60 = v59;
      }
      uint64x2_t v61 = (uint64x2_t)vdupq_n_s64(v60);
      int64x2_t v62 = (int64x2_t)xmmword_1DCBE3840;
      int64x2_t v63 = vdupq_n_s64(4uLL);
      do
      {
        int8x16_t v64 = (int8x16_t)v62;
        int64x2_t v62 = vaddq_s64(v62, v63);
        v58 += 2;
      }
      while ((((_WORD)v60 + 2) & 0x3FE) != v58);
      uint64_t v57 = vaddvq_s64((int64x2_t)vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)vorrq_s8((int8x16_t)vdupq_n_s64(v58 - 2), (int8x16_t)xmmword_1DCBCB680), v61), v64, (int8x16_t)v62));
    }
  }
  BOOL v17 = __OFADD__(v56, v57);
  uint64_t v65 = v56 + v57;
  if (v17) {
    goto LABEL_139;
  }
  uint64_t v66 = *(void *)(result[9] + 16);
  if (v66)
  {
    if (v66 == 1)
    {
      uint64_t v66 = 4;
    }
    else
    {
      uint64_t v67 = 0;
      unint64_t v68 = v66 - 2;
      unint64_t v69 = 6;
      if (v68 < 6) {
        unint64_t v69 = v68;
      }
      uint64x2_t v70 = (uint64x2_t)vdupq_n_s64(v69);
      int64x2_t v71 = (int64x2_t)xmmword_1DCBE3840;
      int64x2_t v72 = vdupq_n_s64(4uLL);
      do
      {
        int8x16_t v73 = (int8x16_t)v71;
        int64x2_t v71 = vaddq_s64(v71, v72);
        v67 += 2;
      }
      while ((((_BYTE)v69 + 2) & 0xE) != v67);
      uint64_t v66 = vaddvq_s64((int64x2_t)vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)vorrq_s8((int8x16_t)vdupq_n_s64(v67 - 2), (int8x16_t)xmmword_1DCBCB680), v70), v73, (int8x16_t)v71));
    }
  }
  BOOL v17 = __OFADD__(v65, v66);
  uint64_t v74 = v65 + v66;
  if (v17) {
    goto LABEL_140;
  }
  uint64_t v75 = *(void *)(result[10] + 16);
  if (v75)
  {
    if (v75 == 1)
    {
      uint64_t v75 = 4;
    }
    else
    {
      uint64_t v76 = 0;
      unint64_t v77 = v75 - 2;
      unint64_t v78 = 318;
      if (v77 < 0x13E) {
        unint64_t v78 = v77;
      }
      uint64x2_t v79 = (uint64x2_t)vdupq_n_s64(v78);
      int64x2_t v80 = (int64x2_t)xmmword_1DCBE3840;
      int64x2_t v81 = vdupq_n_s64(4uLL);
      do
      {
        int8x16_t v82 = (int8x16_t)v80;
        int64x2_t v80 = vaddq_s64(v80, v81);
        v76 += 2;
      }
      while ((((_WORD)v78 + 2) & 0x3FE) != v76);
      uint64_t v75 = vaddvq_s64((int64x2_t)vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)vorrq_s8((int8x16_t)vdupq_n_s64(v76 - 2), (int8x16_t)xmmword_1DCBCB680), v79), v82, (int8x16_t)v80));
    }
  }
  BOOL v17 = __OFADD__(v74, v75);
  uint64_t v83 = v74 + v75;
  if (v17) {
    goto LABEL_141;
  }
  uint64_t v84 = *(void *)(result[11] + 16);
  if (v84)
  {
    if (v84 == 1)
    {
      uint64_t v84 = 4;
    }
    else
    {
      uint64_t v85 = 0;
      unint64_t v86 = v84 - 2;
      unint64_t v87 = 6;
      if (v86 < 6) {
        unint64_t v87 = v86;
      }
      uint64x2_t v88 = (uint64x2_t)vdupq_n_s64(v87);
      int64x2_t v89 = (int64x2_t)xmmword_1DCBE3840;
      int64x2_t v90 = vdupq_n_s64(4uLL);
      do
      {
        int8x16_t v91 = (int8x16_t)v89;
        int64x2_t v89 = vaddq_s64(v89, v90);
        v85 += 2;
      }
      while ((((_BYTE)v87 + 2) & 0xE) != v85);
      uint64_t v84 = vaddvq_s64((int64x2_t)vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)vorrq_s8((int8x16_t)vdupq_n_s64(v85 - 2), (int8x16_t)xmmword_1DCBCB680), v88), v91, (int8x16_t)v89));
    }
  }
  BOOL v17 = __OFADD__(v83, v84);
  uint64_t v92 = v83 + v84;
  if (v17) {
    goto LABEL_142;
  }
  uint64_t v93 = *(void *)(result[12] + 16);
  if (v93)
  {
    if (v93 == 1)
    {
      uint64_t v93 = 4;
    }
    else
    {
      uint64_t v94 = 0;
      unint64_t v95 = v93 - 2;
      unint64_t v96 = 254;
      if (v95 < 0xFE) {
        unint64_t v96 = v95;
      }
      uint64x2_t v97 = (uint64x2_t)vdupq_n_s64(v96);
      int64x2_t v98 = (int64x2_t)xmmword_1DCBE3840;
      int64x2_t v99 = vdupq_n_s64(4uLL);
      do
      {
        int8x16_t v100 = (int8x16_t)v98;
        int64x2_t v98 = vaddq_s64(v98, v99);
        v94 += 2;
      }
      while ((((_WORD)v96 + 2) & 0x1FE) != v94);
      uint64_t v93 = vaddvq_s64((int64x2_t)vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)vorrq_s8((int8x16_t)vdupq_n_s64(v94 - 2), (int8x16_t)xmmword_1DCBCB680), v97), v100, (int8x16_t)v98));
    }
  }
  BOOL v17 = __OFADD__(v92, v93);
  uint64_t v101 = v92 + v93;
  if (v17) {
    goto LABEL_143;
  }
  uint64_t v102 = *(void *)(result[13] + 16);
  if (v102)
  {
    if (v102 == 1)
    {
      uint64_t v102 = 4;
    }
    else
    {
      uint64_t v103 = 0;
      unint64_t v104 = v102 - 2;
      unint64_t v105 = 30;
      if (v104 < 0x1E) {
        unint64_t v105 = v104;
      }
      uint64x2_t v106 = (uint64x2_t)vdupq_n_s64(v105);
      int64x2_t v107 = (int64x2_t)xmmword_1DCBE3840;
      int64x2_t v108 = vdupq_n_s64(4uLL);
      do
      {
        int8x16_t v109 = (int8x16_t)v107;
        int64x2_t v107 = vaddq_s64(v107, v108);
        v103 += 2;
      }
      while ((((_BYTE)v105 + 2) & 0x3E) != v103);
      uint64_t v102 = vaddvq_s64((int64x2_t)vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)vorrq_s8((int8x16_t)vdupq_n_s64(v103 - 2), (int8x16_t)xmmword_1DCBCB680), v106), v109, (int8x16_t)v107));
    }
  }
  BOOL v17 = __OFADD__(v101, v102);
  uint64_t v110 = v101 + v102;
  if (v17) {
    goto LABEL_144;
  }
  uint64_t v111 = *(void *)(result[14] + 16);
  if (v111)
  {
    if (v111 == 1)
    {
      uint64_t v111 = 4;
    }
    else
    {
      uint64_t v112 = 0;
      unint64_t v113 = v111 - 2;
      unint64_t v114 = 62;
      if (v113 < 0x3E) {
        unint64_t v114 = v113;
      }
      uint64x2_t v115 = (uint64x2_t)vdupq_n_s64(v114);
      int64x2_t v116 = (int64x2_t)xmmword_1DCBE3840;
      int64x2_t v117 = vdupq_n_s64(4uLL);
      do
      {
        int8x16_t v118 = (int8x16_t)v116;
        int64x2_t v116 = vaddq_s64(v116, v117);
        v112 += 2;
      }
      while ((((_BYTE)v114 + 2) & 0x7E) != v112);
      uint64_t v111 = vaddvq_s64((int64x2_t)vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)vorrq_s8((int8x16_t)vdupq_n_s64(v112 - 2), (int8x16_t)xmmword_1DCBCB680), v115), v118, (int8x16_t)v116));
    }
  }
  uint64_t v119 = v110 + v111;
  if (__OFADD__(v110, v111)) {
    goto LABEL_145;
  }
  uint64_t v120 = *(void *)(result[15] + 16);
  uint64_t v121 = 8;
  if (v120 == 1) {
    uint64_t v121 = 4;
  }
  if (v120) {
    uint64_t v122 = v121;
  }
  else {
    uint64_t v122 = 0;
  }
  uint64_t result = (void *)(v119 + v122);
  if (__OFADD__(v119, v122)) {
    goto LABEL_146;
  }
  return result;
}

uint64_t sub_1DCB427D8(uint64_t a1)
{
  uint64_t v2 = sub_1DC87E988(&qword_1EAAABA98);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1DCB42838(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1DC87E988(&qword_1EAAABA98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unsigned char *sub_1DCB428A0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x1DCB4296CLL);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

void type metadata accessor for TBSoundAnalysisError()
{
}

uint64_t sub_1DCB429A0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    unsigned int v5 = -1;
    return v5 + 1;
  }
  if (a2 >= 0x3E)
  {
    if (a2 + 194 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 194) >> 8 < 0xFF) {
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
    unsigned int v5 = (*a1 | (v4 << 8)) - 195;
    return v5 + 1;
  }
LABEL_17:
  unsigned int v5 = (*a1 & 0x3C | (*a1 >> 6)) ^ 0x3F;
  if (v5 >= 0x3D) {
    unsigned int v5 = -1;
  }
  return v5 + 1;
}

unsigned char *sub_1DCB42A34(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 194 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 194) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0x3E) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0x3D)
  {
    unsigned int v6 = ((a2 - 62) >> 8) + 1;
    *uint64_t result = a2 - 62;
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
        JUMPOUT(0x1DCB42B0CLL);
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
          *uint64_t result = 4 * (((-a2 >> 2) & 0xF) - 16 * a2);
        break;
    }
  }
  return result;
}

uint64_t sub_1DCB42B34(unsigned char *a1)
{
  int v1 = (char)*a1;
  if (v1 >= 0) {
    return *a1 >> 6;
  }
  else {
    return (v1 & 3u) + 2;
  }
}

unsigned char *sub_1DCB42B50(unsigned char *result, unsigned int a2)
{
  if (a2 < 2) {
    char v2 = *result & 3 | ((_BYTE)a2 << 6);
  }
  else {
    char v2 = (a2 + 2) & 3 | 0x80;
  }
  *uint64_t result = v2;
  return result;
}

void type metadata accessor for TBSoundRecognitionStreamResult()
{
}

void type metadata accessor for TBUUID()
{
}

uint64_t sub_1DCB42B94(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    unsigned int v5 = -1;
    return v5 + 1;
  }
  if (a2 >= 0xE)
  {
    if (a2 + 242 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 242) >> 8 < 0xFF) {
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
    unsigned int v5 = (*a1 | (v4 << 8)) - 243;
    return v5 + 1;
  }
LABEL_17:
  unsigned int v5 = ((*a1 >> 2) & 0xC | (*a1 >> 6)) ^ 0xF;
  if (v5 >= 0xD) {
    unsigned int v5 = -1;
  }
  return v5 + 1;
}

unsigned char *sub_1DCB42C2C(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 242 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 242) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xD)
  {
    unsigned int v6 = ((a2 - 14) >> 8) + 1;
    *uint64_t result = a2 - 14;
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
        JUMPOUT(0x1DCB42D04);
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
          *uint64_t result = 16 * (((-a2 >> 2) & 3) - 4 * a2);
        break;
    }
  }
  return result;
}

uint64_t sub_1DCB42D2C(unsigned char *a1)
{
  int v1 = (char)*a1;
  if (v1 >= 0) {
    return *a1 >> 6;
  }
  else {
    return (v1 & 0xFu) + 2;
  }
}

unsigned char *sub_1DCB42D48(unsigned char *result)
{
  *result &= 0x3Fu;
  return result;
}

unsigned char *sub_1DCB42D58(unsigned char *result, unsigned int a2)
{
  if (a2 < 2) {
    char v2 = *result & 0xF | ((_BYTE)a2 << 6);
  }
  else {
    char v2 = (a2 + 14) & 0xF | 0x80;
  }
  *uint64_t result = v2;
  return result;
}

void type metadata accessor for TBAccessibilitySoundActionStreamResult()
{
}

uint64_t sub_1DCB42D90(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF3)
  {
    if (a2 + 13 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 13) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 14;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xE;
  int v5 = v6 - 14;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_1DCB42E18(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 13 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 13) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF2)
  {
    unsigned int v6 = ((a2 - 243) >> 8) + 1;
    *uint64_t result = a2 + 13;
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
        JUMPOUT(0x1DCB42EE4);
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
          *uint64_t result = a2 + 13;
        break;
    }
  }
  return result;
}

void type metadata accessor for TBAccessibilitySoundActionsSoundActionIdentifier()
{
}

uint64_t sub_1DCB42F18(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF0)
  {
    if (a2 + 16 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 16) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 17;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x11;
  int v5 = v6 - 17;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_1DCB42FA0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 16 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 16) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEF)
  {
    unsigned int v6 = ((a2 - 240) >> 8) + 1;
    *uint64_t result = a2 + 16;
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
        JUMPOUT(0x1DCB4306CLL);
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
          *uint64_t result = a2 + 16;
        break;
    }
  }
  return result;
}

void type metadata accessor for TBSoundRecognitionBuiltInDetectorIdentifier()
{
}

unint64_t sub_1DCB430A4()
{
  unint64_t result = qword_1EAAABAA0;
  if (!qword_1EAAABAA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAAABAA0);
  }
  return result;
}

unint64_t sub_1DCB430F4()
{
  unint64_t result = qword_1EAAABAA8;
  if (!qword_1EAAABAA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAAABAA8);
  }
  return result;
}

unint64_t sub_1DCB43144()
{
  unint64_t result = qword_1EAAABAB0;
  if (!qword_1EAAABAB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAAABAB0);
  }
  return result;
}

uint64_t sub_1DCB43194()
{
  return v0;
}

void *sub_1DCB431AC()
{
  return sub_1DC881A8C((void *)(*(void *)(v0 + 120) + 24), *(void *)(*(void *)(v0 + 120) + 48));
}

uint64_t sub_1DCB431D4()
{
  _s13SoundAnalysis11SNAOPReportV14SuccessPayloadOwst_0(v1, 0, 1, *(void *)(v0 + 104));
  uint64_t v2 = *(void *)(v0 + 112);
  return sub_1DCB42838(v1, v2);
}

uint64_t sub_1DCB43218()
{
  return v0;
}

uint64_t sub_1DCB43230()
{
  return _s13SoundAnalysis11SNAOPReportV14SuccessPayloadOwet_0(v1, 1, v0);
}

void sub_1DCB4325C()
{
  sub_1DCB3DC28(0, 16);
}

uint64_t sub_1DCB43280()
{
  _s13SoundAnalysis11SNAOPReportV14SuccessPayloadOwst_0(v1, 0, 1, *(void *)(v0 + 104));
  return sub_1DCB42838(v1, v2);
}

uint64_t sub_1DCB432C0()
{
  return sub_1DCB87708();
}

uint64_t sub_1DCB432E8()
{
  return sub_1DCB87708();
}

uint64_t sub_1DCB43310()
{
  return sub_1DCB876E8();
}

uint64_t sub_1DCB43338()
{
  return swift_dynamicCast();
}

uint64_t sub_1DCB43354()
{
  return v0;
}

uint64_t sub_1DCB4336C()
{
  return v0;
}

uint64_t sub_1DCB433A4()
{
  return v0;
}

uint64_t sub_1DCB433DC()
{
  return v0;
}

uint64_t sub_1DCB433E8()
{
  return v0;
}

void sub_1DCB43400()
{
  sub_1DCB3DC28(0, 16);
}

uint64_t sub_1DCB43424()
{
  return sub_1DCB87688();
}

uint64_t sub_1DCB4345C()
{
  return 0;
}

uint64_t sub_1DCB43470(uint64_t a1, int a2, float a3)
{
  *(void *)a1 = 0;
  *(_DWORD *)(a1 + 8) = a2;
  __int16 v8 = 0;
  char v9 = 0;
  *(float *)uint64_t v5 = a3;
  v5[1] = dword_1EAAABAB8;
  v5[2] = dword_1EAAABAC0;
  v5[3] = dword_1EAAABAC4;
  uint64_t v6 = 0x3C23D70A00000002;
  char v7 = 0;
  int v10 = 160;
  int v11 = a2;
  int v12 = 0;
  int v13 = dword_1EAAABABC;
  uint64_t v14 = 0;
  *(void *)a1 = sub_1DCB5E9D0((uint64_t)v5);
  return a1;
}

uint64_t *sub_1DCB43508(uint64_t *a1)
{
  uint64_t v2 = (void *)*a1;
  if (*a1)
  {
    sub_1DCB5E8AC(*a1);
    free(v2);
  }
  return a1;
}

void sub_1DCB43544(void *a1)
{
}

uint64_t sub_1DCB43558(uint64_t a1, void *a2)
{
  id v3 = a2;
  DSPGraph::Box::Box((DSPGraph::Box *)a1);
  *(void *)a1 = &unk_1F37F6E00;
  *(void *)(a1 + 776) = v3;
  *(_OWORD *)(a1 + 784) = 0u;
  uint64_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v5 = v3;
  dispatch_queue_t v6 = dispatch_queue_create("com.apple.SoundAnalysis.EARAudioProcessor", v4);
  char v7 = *(void **)(a1 + 792);
  *(void *)(a1 + 792) = v6;

  return a1;
}

void sub_1DCB43604(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCB43614(uint64_t a1, int a2)
{
  uint64_t v4 = a1 + 64;
  uint64_t v3 = *(void *)(a1 + 64);
  if (*(void *)(v4 + 8) == v3)
  {
    sub_1DCB43D1C(v14, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(v13, "in");
    int v10 = (void *)(a1 + 32);
    if (*(char *)(a1 + 55) < 0) {
      int v10 = (void *)*v10;
    }
    goto LABEL_11;
  }
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 40))(v3);
  uint64_t v7 = *(void *)(a1 + 64);
  if (*(void *)(a1 + 72) == v7)
  {
    sub_1DCB43D1C(v14, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(v13, "in");
    int v10 = (void *)(a1 + 32);
    if (*(char *)(a1 + 55) < 0) {
      int v10 = (void *)*v10;
    }
LABEL_11:
    DSPGraph::strprintf(v12, (DSPGraph *)"Box::in inIndex out of range! box %s has %zu inputs but input %u was requested", v9, v10, (uint64_t)(*(void *)(a1 + 72) - *(void *)(a1 + 64)) >> 5, 0);
    DSPGraph::ThrowException();
    __break(1u);
    return;
  }
  id v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:*(void *)(*(void *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v7 + 40))(v7) + 56) + 80)+ 16) length:(*(_DWORD *)(*(void *)(v6 + 120) + 24) * a2)];
  __int16 v8 = (void *)MEMORY[0x1E01A90A0]();
  [*(id *)(a1 + 784) addAudio:v11];
}

void sub_1DCB437EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  if (a25 < 0) {
    operator delete(a20);
  }
  if (*(char *)(v25 - 17) < 0) {
    operator delete(*(void **)(v25 - 40));
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DCB43854(uint64_t a1)
{
  uint64_t v3 = a1 + 64;
  uint64_t v2 = *(void *)(a1 + 64);
  if (*(void *)(v3 + 8) == v2)
  {
    sub_1DCB43D1C(v14, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(v13, "in");
    int v10 = (void *)(a1 + 32);
    if (*(char *)(a1 + 55) < 0) {
      int v10 = (void *)*v10;
    }
    goto LABEL_22;
  }
  if (**(double **)((*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2) + 120) != 16000.0) {
    __assert_rtn("initialize", "DSPGraph_EARAudioProcessorBox.mm", 40, "in(0).format().mSampleRate == 16000");
  }
  uint64_t v4 = *(void *)(a1 + 64);
  if (*(void *)(a1 + 72) == v4)
  {
    sub_1DCB43D1C(v14, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(v13, "in");
    int v10 = (void *)(a1 + 32);
    if (*(char *)(a1 + 55) < 0) {
      int v10 = (void *)*v10;
    }
    goto LABEL_22;
  }
  if (*(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4) + 120) + 28) != 1) {
    __assert_rtn("initialize", "DSPGraph_EARAudioProcessorBox.mm", 41, "in(0).format().mChannelsPerFrame == 1");
  }
  uint64_t v5 = *(void *)(a1 + 64);
  if (*(void *)(a1 + 72) == v5)
  {
    sub_1DCB43D1C(v14, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(v13, "in");
    int v10 = (void *)(a1 + 32);
    if (*(char *)(a1 + 55) < 0) {
      int v10 = (void *)*v10;
    }
LABEL_22:
    DSPGraph::strprintf(v12, (DSPGraph *)"Box::in inIndex out of range! box %s has %zu inputs but input %u was requested", v9, v10, (uint64_t)(*(void *)(a1 + 72) - *(void *)(a1 + 64)) >> 5, 0);
    uint64_t v8 = DSPGraph::ThrowException();
LABEL_24:
    __break(1u);
    return MEMORY[0x1F4181798](v8, sel_resetForNewRequest);
  }
  if (*(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v5 + 40))(v5) + 120) + 24) != 2) {
    __assert_rtn("initialize", "DSPGraph_EARAudioProcessorBox.mm", 42, "in(0).format().mBytesPerFrame == 2");
  }
  uint64_t v6 = [objc_alloc(MEMORY[0x1E4F60F78]) initWithConfigFile:*(void *)(a1 + 776) configRoot:@"config" sampleRate:16000 delegate:0 queue:*(void *)(a1 + 792)];
  uint64_t v7 = *(void **)(a1 + 784);
  *(void *)(a1 + 784) = v6;

  uint64_t v8 = *(void *)(a1 + 784);
  if (!v8)
  {
    sub_1DCB43D1C(v14, "/Library/Caches/com.apple.xbs/Sources/Listen/Framework/Internal/Core/DSPGraph/Boxes/DSPGraph_EARAudioProcessorBox.mm");
    sub_1DCB43D1C(v13, "initialize");
    sub_1DCB43D1C(v12, "inputs must be 16kHz");
    uint64_t v8 = DSPGraph::ThrowException();
    goto LABEL_24;
  }

  return MEMORY[0x1F4181798](v8, sel_resetForNewRequest);
}

void sub_1DCB43B9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (*(char *)(v23 - 17) < 0) {
    operator delete(*(void **)(v23 - 40));
  }
  _Unwind_Resume(exception_object);
}

void sub_1DCB43C10(id *a1)
{
  sub_1DCB43E78(a1);

  JUMPOUT(0x1E01A8C50);
}

const char *sub_1DCB43C48()
{
  return "EARAudioProcessorBox";
}

uint64_t sub_1DCB43C54()
{
  return 0;
}

uint64_t sub_1DCB43C5C()
{
  return 0;
}

uint64_t sub_1DCB43C68()
{
  return 0;
}

uint64_t sub_1DCB43C70()
{
  return 0;
}

uint64_t sub_1DCB43C80()
{
  return 0;
}

double sub_1DCB43C88@<D0>(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 + 16) = 0;
  double result = *(double *)"xfuapraexoba";
  *(_OWORD *)a1 = *(_OWORD *)"xfuapraexoba";
  return result;
}

uint64_t sub_1DCB43CA0()
{
  return 0;
}

uint64_t sub_1DCB43CA8()
{
  return 0;
}

uint64_t sub_1DCB43CB0()
{
  return 0;
}

uint64_t sub_1DCB43CB8()
{
  return 0;
}

uint64_t sub_1DCB43CC0()
{
  return 0;
}

uint64_t sub_1DCB43CC8()
{
  return 0;
}

uint64_t sub_1DCB43CD0()
{
  return 0;
}

uint64_t sub_1DCB43CD8()
{
  return 0;
}

uint64_t sub_1DCB43CE0()
{
  return 0;
}

uint64_t sub_1DCB43CE8()
{
  return 0;
}

uint64_t sub_1DCB43CF0()
{
  return 1;
}

void sub_1DCB43CF8(unsigned char *a1@<X8>)
{
  *a1 = 0;
  a1[24] = 0;
}

uint64_t sub_1DCB43D04()
{
  return 0;
}

uint64_t sub_1DCB43D0C()
{
  return 1;
}

void *sub_1DCB43D1C(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_1DCB43DD0();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void sub_1DCB43DD0()
{
}

void sub_1DCB43DE8(const char *a1)
{
  exceptiouint64_t n = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1DCB43E44(exception, a1);
  __cxa_throw(exception, (struct type_info *)&unk_1F37F61A0, MEMORY[0x1E4FBA1C8]);
}

void sub_1DCB43E30(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_1DCB43E44(std::logic_error *a1, const char *a2)
{
  double result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

void sub_1DCB43E78(id *a1)
{
  DSPGraph::Box::~Box((DSPGraph::Box *)a1);
}

void sub_1DCB44078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,std::__shared_weak_count *a24)
{
  _Block_object_dispose(&a17, 8);
  if (a24) {
    sub_1DCB44254(a24);
  }

  _Unwind_Resume(a1);
}

__n128 sub_1DCB440C0(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[3] = result;
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  return result;
}

void sub_1DCB440D0(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 56);
  if (v1) {
    sub_1DCB44254(v1);
  }
}

uint64_t sub_1DCB440E0(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2)
  {
    uint64_t v4 = *(void *)(v2 + 8);
    uint64_t v3 = *(std::__shared_weak_count **)(v2 + 16);
    if (v3) {
      atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v3 = 0;
  }
  uint64_t v5 = a1[5];
  if (v5)
  {
    uint64_t v7 = *(void *)(v5 + 8);
    uint64_t v6 = *(std::__shared_weak_count **)(v5 + 16);
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v8 = operator new(0x38uLL);
  v8[1] = 0;
  v8[2] = 0;
  *uint64_t v8 = &unk_1F37F8418;
  v13[0] = v4;
  v13[1] = v3;
  v12[0] = v7;
  v12[1] = v6;
  sub_1DCB591B8(v8 + 3, v13, v12);
  if (v6) {
    sub_1DCB44254(v6);
  }
  if (v3) {
    sub_1DCB44254(v3);
  }
  uint64_t v9 = *(void *)(a1[6] + 8);
  int v10 = *(std::__shared_weak_count **)(v9 + 56);
  *(void *)(v9 + 48) = v8 + 3;
  *(void *)(v9 + 56) = v8;
  if (v10) {
    sub_1DCB44254(v10);
  }
  return 1;
}

void sub_1DCB441EC(_Unwind_Exception *a1)
{
  if (v3) {
    sub_1DCB44254(v3);
  }
  if (v1) {
    sub_1DCB44254(v1);
  }
  std::__shared_weak_count::~__shared_weak_count(v2);
  operator delete(v5);
  _Unwind_Resume(a1);
}

void sub_1DCB44254(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void sub_1DCB442C8(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F37F8418;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1DCB442E8(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F37F8418;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1E01A8C50);
}

void sub_1DCB4433C(uint64_t a1)
{
}

void sub_1DCB44348(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 24);
  if (v2) {
    sub_1DCB44254(v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 8);
  if (v3)
  {
    sub_1DCB44254(v3);
  }
}

void sub_1DCB44398(uint64_t a1, long long *a2, long long *a3)
{
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = a1 + 16;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 24) = a1 + 16;
  *(void *)a1 = &unk_1F37F62C0;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  long long v3 = *a2;
  long long v4 = a2[2];
  *(_OWORD *)(a1 + 80) = a2[1];
  *(_OWORD *)(a1 + 96) = v4;
  *(_OWORD *)(a1 + 64) = v3;
  long long v5 = *a3;
  long long v6 = a3[2];
  *(_OWORD *)(a1 + 128) = a3[1];
  *(_OWORD *)(a1 + 144) = v6;
  *(_OWORD *)(a1 + 112) = v5;
  if (*((_DWORD *)a2 + 10) == 1)
  {
    if (*((_DWORD *)a3 + 10) == 1) {
      sub_1DCB444A4(a1);
    }
    uint64_t v7 = "downstreamFormat.mBlockSize == 1";
    int v8 = 19;
  }
  else
  {
    uint64_t v7 = "upstreamFormat.mBlockSize == 1";
    int v8 = 18;
  }
  __assert_rtn("FormatMatchingNode", "SoundAnalysis_FormatMatchingNode.cpp", v8, v7);
}

void sub_1DCB44468(_Unwind_Exception *a1)
{
  long long v4 = (std::__shared_weak_count *)v2[7];
  if (v4) {
    sub_1DCB44254(v4);
  }
  *uint64_t v2 = &unk_1F37F6290;
  sub_1DCB44990(v1);
  _Unwind_Resume(a1);
}

void sub_1DCB444A4(uint64_t a1)
{
  sub_1DCB44A4C(__p);
  long long v2 = *(_OWORD *)__p;
  __p[0] = 0;
  __p[1] = 0;
  long long v3 = *(std::__shared_weak_count **)(a1 + 56);
  *(_OWORD *)(a1 + 48) = v2;
  if (v3)
  {
    sub_1DCB44254(v3);
    if (__p[1]) {
      sub_1DCB44254((std::__shared_weak_count *)__p[1]);
    }
  }
  uint64_t v4 = *(void *)(a1 + 48);
  if (*(char *)(v4 + 431) < 0)
  {
    *(void *)(v4 + 416) = 19;
    long long v5 = *(char **)(v4 + 408);
  }
  else
  {
    long long v5 = (char *)(v4 + 408);
    *(unsigned char *)(v4 + 431) = 19;
  }
  strcpy(v5, "formatMatchingGraph");
  sub_1DCB43D1C(__p, "input");
  DSPGraph::Graph::addInput();
  if (v7 < 0) {
    operator delete(__p[0]);
  }
  operator new();
}

void sub_1DCB447EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DCB448A8(_OWORD *a1, long long *a2)
{
  if (*((_DWORD *)a2 + 10) == 1)
  {
    long long v2 = *a2;
    long long v3 = a2[1];
    *(_OWORD *)((char *)a1 + 92) = *(long long *)((char *)a2 + 28);
    a1[4] = v2;
    a1[5] = v3;
    sub_1DCB444A4((uint64_t)a1);
  }
  __assert_rtn("setUpstreamFormat", "SoundAnalysis_FormatMatchingNode.cpp", 24, "upstreamFormat.mBlockSize == 1");
}

uint64_t sub_1DCB44908()
{
  return 1;
}

uint64_t sub_1DCB44910@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void *)(result + 56);
  *a2 = *(void *)(result + 48);
  a2[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

__n128 sub_1DCB4492C@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  long long v2 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a2 + 16) = v2;
  __n128 result = *(__n128 *)(a1 + 96);
  *(__n128 *)(a2 + 32) = result;
  return result;
}

__n128 sub_1DCB44940@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  long long v2 = *(_OWORD *)(a1 + 128);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(a2 + 16) = v2;
  __n128 result = *(__n128 *)(a1 + 144);
  *(__n128 *)(a2 + 32) = result;
  return result;
}

void sub_1DCB44958(void *a1)
{
  sub_1DCB44B90(a1);

  JUMPOUT(0x1E01A8C50);
}

void *sub_1DCB44990(void *result)
{
  if (result[2])
  {
    uint64_t v1 = result;
    __n128 result = (void *)result[1];
    uint64_t v2 = *v1;
    uint64_t v3 = *result;
    *(void *)(v3 + 8) = *(void *)(*v1 + 8);
    **(void **)(v2 + 8) = v3;
    v1[2] = 0;
    if (result != v1)
    {
      do
      {
        uint64_t v4 = (void *)result[1];
        operator delete(result);
        __n128 result = v4;
      }
      while (v4 != v1);
    }
  }
  return result;
}

void sub_1DCB449F4(uint64_t a1)
{
  *(void *)a1 = MEMORY[0x1E4F4EAF0] + 16;
  DSPGraph::RingBuffer::~RingBuffer((DSPGraph::RingBuffer *)(a1 + 808));

  DSPGraph::Box::~Box((DSPGraph::Box *)a1);
}

void *sub_1DCB44A4C@<X0>(void *a1@<X8>)
{
  uint64_t v2 = operator new(0x460uLL);
  __n128 result = sub_1DCB44A98(v2);
  *a1 = v2 + 3;
  a1[1] = v2;
  return result;
}

void sub_1DCB44A84(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_1DCB44A98(void *a1)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_1F37F8450;
  MEMORY[0x1E01A89C0](a1 + 3);
  return a1;
}

void sub_1DCB44AE0(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_1DCB44AF4(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F37F8450;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1DCB44B14(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F37F8450;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1E01A8C50);
}

uint64_t sub_1DCB44B68(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void *sub_1DCB44B90(void *a1)
{
  *a1 = &unk_1F37F62C0;
  uint64_t v2 = (std::__shared_weak_count *)a1[7];
  if (v2) {
    sub_1DCB44254(v2);
  }
  *a1 = &unk_1F37F6290;
  sub_1DCB44990(a1 + 2);
  return a1;
}

void sub_1DCB44DA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  _Block_object_dispose(&a16, 8);
  uint64_t v25 = a22;
  a22 = 0;
  if (v25) {
    (*(void (**)(uint64_t))(*(void *)v25 + 8))(v25);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_1DCB44E00(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(a2 + 48) = 0;
  *(void *)(result + 48) = v2;
  return result;
}

uint64_t sub_1DCB44E10(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  *(void *)(a1 + 48) = 0;
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void sub_1DCB44E48(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = *(void *)(v1 + 16);
    uint64_t v3 = *(void *)(v1 + 8);
    uint64_t v4 = v2;
    if (v2) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  operator new();
}

void sub_1DCB44F10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, std::__shared_weak_count *a10)
{
  MEMORY[0x1E01A8C50](v10, 0xE1C40E9FAB1CALL);
  if (a10) {
    sub_1DCB44254(a10);
  }
  _Unwind_Resume(a1);
}

double sub_1DCB452E8(uint64_t a1)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = a1 + 16;
  *(void *)(a1 + 24) = a1 + 16;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = a1 + 40;
  *(void *)(a1 + 48) = a1 + 40;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = a1 + 64;
  *(void *)(a1 + 72) = a1 + 64;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = a1 + 88;
  *(void *)(a1 + 96) = a1 + 88;
  *(void *)(a1 + 104) = 0;
  *(void *)(a1 + 120) = 0;
  *(void *)(a1 + 128) = a1 + 128;
  *(void *)(a1 + 144) = 0;
  *(void *)(a1 + 152) = 0;
  *(void *)(a1 + 136) = a1 + 128;
  *(void *)(a1 + 112) = &unk_1F37F6340;
  double result = 0.0;
  *(_OWORD *)(a1 + 188) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 236) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(void *)(a1 + 288) = 0;
  *(void *)(a1 + 296) = 0;
  *(_DWORD *)(a1 + 256) = 0x4000;
  return result;
}

__n128 sub_1DCB45368@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  long long v2 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(a2 + 16) = v2;
  __n128 result = *(__n128 *)(a1 + 128);
  *(__n128 *)(a2 + 32) = result;
  return result;
}

uint64_t sub_1DCB4537C(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a1 + 176);
  v15[0] = *(_OWORD *)(a1 + 160);
  v15[1] = v4;
  id v15[2] = *(_OWORD *)(a1 + 192);
  uint64_t result = sub_1DCB45440(a2, (uint64_t)v15);
  if ((result & 1) == 0)
  {
    long long v6 = *(_OWORD *)a2;
    long long v7 = *(_OWORD *)(a2 + 16);
    uint64_t v8 = *(void *)(a2 + 32);
    *(_DWORD *)(a1 + 200) = *(_DWORD *)(a2 + 40);
    *(void *)(a1 + 192) = v8;
    *(_OWORD *)(a1 + 160) = v6;
    *(_OWORD *)(a1 + 176) = v7;
    long long v9 = *(_OWORD *)a2;
    long long v10 = *(_OWORD *)(a2 + 16);
    uint64_t v11 = *(void *)(a2 + 32);
    *(_DWORD *)(a1 + 248) = *(_DWORD *)(a2 + 40);
    *(void *)(a1 + 240) = v11;
    *(_OWORD *)(a1 + 208) = v9;
    *(_OWORD *)(a1 + 224) = v10;
    uint64_t v12 = *(void *)(a1 + 48);
    if (v12 != a1 + 40)
    {
      long long v13 = *(_OWORD *)(a2 + 16);
      v14[0] = *(_OWORD *)a2;
      v14[1] = v13;
      void v14[2] = *(_OWORD *)(a2 + 32);
      sub_1DCB448A8((_OWORD *)(v12 + 16), v14);
    }
    return sub_1DCB45504((DSPGraph::Graph **)a1);
  }
  return result;
}

uint64_t sub_1DCB45440(uint64_t a1, uint64_t a2)
{
  if (*(double *)a1 == *(double *)a2
    && *(_DWORD *)(a1 + 8) == *(_DWORD *)(a2 + 8)
    && *(_DWORD *)(a1 + 16) == *(_DWORD *)(a2 + 16)
    && *(_DWORD *)(a1 + 20) == *(_DWORD *)(a2 + 20)
    && *(_DWORD *)(a1 + 28) == *(_DWORD *)(a2 + 28)
    && *(_DWORD *)(a1 + 32) == *(_DWORD *)(a2 + 32))
  {
    LODWORD(result) = sub_1DCB48FD8(a1, a2, 0, 0);
  }
  else
  {
    LODWORD(result) = 0;
  }
  if (*(_DWORD *)(a1 + 40) == *(_DWORD *)(a2 + 40)) {
    return result;
  }
  else {
    return 0;
  }
}

__n128 sub_1DCB454F0@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  long long v2 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a2 + 16) = v2;
  __n128 result = *(__n128 *)(a1 + 80);
  *(__n128 *)(a2 + 32) = result;
  return result;
}

uint64_t sub_1DCB45504(DSPGraph::Graph **a1)
{
  sub_1DCB44A4C(__p);
  long long v2 = *(_OWORD *)__p;
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v3 = (std::__shared_weak_count *)a1[1];
  *(_OWORD *)a1 = v2;
  if (v3)
  {
    sub_1DCB44254(v3);
    if (__p[1]) {
      sub_1DCB44254((std::__shared_weak_count *)__p[1]);
    }
  }
  long long v4 = *a1;
  if (*((char *)*a1 + 431) < 0)
  {
    *((void *)v4 + 52) = 9;
    long long v5 = (char *)*((void *)v4 + 51);
  }
  else
  {
    long long v5 = (char *)v4 + 408;
    *((unsigned char *)v4 + 431) = 9;
  }
  strcpy(v5, "treeGraph");
  sub_1DCB43D1C(__p, "input");
  uint64_t v6 = DSPGraph::Graph::addInput();
  if (v15 < 0) {
    operator delete(__p[0]);
  }
  a1[19] = (DSPGraph::Graph *)v6;
  long long v7 = (std::__shared_weak_count *)a1[1];
  v13[0] = *a1;
  v13[1] = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  sub_1DCB457AC((uint64_t)v13, a1 + 14);
  if (v7) {
    sub_1DCB44254(v7);
  }
  DSPGraph::Graph::setSliceDuration();
  DSPGraph::Graph::configure(*a1);
  uint64_t v8 = a1[36];
  if (v8)
  {
    long long v9 = (std::__shared_weak_count *)a1[1];
    uint64_t v11 = *a1;
    uint64_t v12 = v9;
    if (v9)
    {
      atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v8 = a1[36];
      __p[0] = a1[4];
      if (!v8) {
        sub_1DCB4C86C();
      }
    }
    else
    {
      __p[0] = a1[4];
    }
    (*(void (**)(DSPGraph::Graph *, DSPGraph::Graph **, void **))(*(void *)v8 + 48))(v8, &v11, __p);
    if (v12) {
      sub_1DCB44254(v12);
    }
  }
  return DSPGraph::Graph::initialize(*a1);
}

void sub_1DCB456A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (v18) {
    sub_1DCB44254(v18);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DCB456E8(uint64_t a1, double *a2)
{
  int v4 = *(_DWORD *)a2;
  *(void *)(a1 + 296) = (uint64_t)a2[1];
  DSPGraph::Graph::preflight();
  if (*(_DWORD *)a2 != v4) {
    __assert_rtn("processBuffer", "SoundAnalysis_ProcessingTree.cpp", 66, "inputBuffer.mNumFrames == expectedNumberOfFrames");
  }
  uint64_t result = DSPGraph::Graph::processMultiple();
  *(void *)(a1 + 296) += *(unsigned int *)a2;
  return result;
}

void sub_1DCB457AC(uint64_t a1, void *a2)
{
  if (!a2) {
    __assert_rtn("buildTreeGraphRecursively", "SoundAnalysis_ProcessingTree.cpp", 89, "node");
  }
  long long v2 = a2 + 2;
  uint64_t v23 = &v23;
  int64x2_t v24 = &v23;
  uint64_t v25 = 0;
  uint64_t v3 = (void *)a2[3];
  if (v3 == a2 + 2) {
    goto LABEL_15;
  }
  uint64_t v4 = 1;
  long long v5 = &v23;
  do
  {
    uint64_t v6 = operator new(0x18uLL);
    uint64_t v7 = v3[2];
    v6[1] = &v23;
    v6[2] = v7;
    *uint64_t v6 = v5;
    v5[1] = v6;
    uint64_t v23 = v6;
    uint64_t v25 = v4;
    uint64_t v3 = (void *)v3[1];
    ++v4;
    long long v5 = v6;
  }
  while (v3 != v2);
  if (v24 == &v23)
  {
LABEL_15:
    sub_1DCB44990(&v23);
    if (!a2[4])
    {
      if (!(*(unsigned int (**)(void *))*a2)(a2)) {
        goto LABEL_20;
      }
      (*(void (**)(void **__return_ptr, void *))(*a2 + 8))(&__p, a2);
      int v15 = DSPGraph::Graph::numOutputs((DSPGraph::Graph *)__p);
      if (v27) {
        sub_1DCB44254(v27);
      }
      if (v15) {
LABEL_20:
      }
        operator new();
    }
  }
  else
  {
    uint64_t v8 = (void *)v24[2];
    if (!v8[1]) {
      __assert_rtn("buildTreeGraphRecursively", "SoundAnalysis_ProcessingTree.cpp", 91, "downstreamNode->upstreamNode()");
    }
    (*(void (**)(void **__return_ptr, void))(*v8 + 16))(&__p, v24[2]);
    (*(void (**)(uint64_t *__return_ptr))(*(void *)v8[1] + 24))(&v22);
    if ((sub_1DCB45440((uint64_t)&__p, (uint64_t)&v22) & 1) == 0) {
      __assert_rtn("buildTreeGraphRecursively", "SoundAnalysis_ProcessingTree.cpp", 92, "formatsAreEquivalent(downstreamNode->upstreamFB(), downstreamNode->upstreamNode()->downstreamFB())");
    }
    (*(void (**)(DSPGraph::Graph **__return_ptr, void *))(*v8 + 8))(&v21, v8);
    if (!DSPGraph::Graph::numOutputs(v21)) {
LABEL_13:
    }
      operator new();
    uint64_t v9 = DSPGraph::Graph::in(v21);
    uint64_t v10 = *(void *)(v9 + 88);
    if (*(void *)(v9 + 96) == v10)
    {
      sub_1DCB43D1C(&__p, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
      sub_1DCB43D1C(&v22, "out");
      BOOL v17 = (void *)(v9 + 32);
      if (*(char *)(v9 + 55) < 0) {
        BOOL v17 = (void *)*v17;
      }
      DSPGraph::strprintf(v28, (DSPGraph *)"Box::out inIndex out of range! box %s has %zu outputs but input %u was requested", v16, v17, (uint64_t)(*(void *)(v9 + 96) - *(void *)(v9 + 88)) >> 5, 0);
      DSPGraph::ThrowException();
    }
    else
    {
      double v11 = **(double **)((*(uint64_t (**)(uint64_t))(*(void *)v10 + 40))(v10) + 120);
      uint64_t v12 = DSPGraph::Graph::out(v21);
      uint64_t v13 = *(void *)(v12 + 64);
      if (*(void *)(v12 + 72) != v13)
      {
        if (v11 != **(double **)((*(uint64_t (**)(uint64_t))(*(void *)v13 + 40))(v13)
                                                            + 120)
          || (int v14 = sub_1DCB491C8(v21), v14 != sub_1DCB492EC(v21)))
        {
          operator new();
        }
        goto LABEL_13;
      }
      sub_1DCB43D1C(&__p, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
      sub_1DCB43D1C(&v22, "in");
      uint64_t v19 = (void *)(v12 + 32);
      if (*(char *)(v12 + 55) < 0) {
        uint64_t v19 = (void *)*v19;
      }
      DSPGraph::strprintf(v28, (DSPGraph *)"Box::in inIndex out of range! box %s has %zu inputs but input %u was requested", v18, v19, (uint64_t)(*(void *)(v12 + 72) - *(void *)(v12 + 64)) >> 5, 0);
      DSPGraph::ThrowException();
    }
    __break(1u);
  }
}

void sub_1DCB46AD0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,void *__p,std::__shared_weak_count *a39,int a40,__int16 a41,char a42,char a43)
{
  if (a39) {
    sub_1DCB44254(a39);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DCB46F24(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + 64;
  uint64_t v3 = *(void *)(a1 + 72);
  if (v3 == a1 + 64)
  {
    uint64_t v3 = a1 + 64;
  }
  else
  {
    while (1)
    {
      (*(void (**)(uint64_t *__return_ptr))(*(void *)(v3 + 16) + 8))(&v9);
      uint64_t v6 = *(void *)(a2 + 64);
      long long v5 = *(std::__shared_weak_count **)(a2 + 72);
      if (v5)
      {
        atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
        uint64_t v7 = v9;
        sub_1DCB44254(v5);
      }
      else
      {
        uint64_t v7 = v9;
      }
      if (v10) {
        sub_1DCB44254(v10);
      }
      if (v7 == v6) {
        break;
      }
      uint64_t v3 = *(void *)(v3 + 8);
      if (v3 == v2) {
        return 0;
      }
    }
  }
  if (v3 == v2) {
    return 0;
  }
  else {
    return v3 + 16;
  }
}

uint64_t sub_1DCB46FF4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + 40;
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3 == a1 + 40)
  {
    uint64_t v3 = a1 + 40;
  }
  else
  {
    while (1)
    {
      (*(void (**)(void *__return_ptr))(*(void *)(v3 + 16) + 24))(v7);
      (*(void (**)(void *__return_ptr, uint64_t))(*(void *)a2 + 16))(v6, a2);
      if (sub_1DCB45440((uint64_t)v7, (uint64_t)v6)) {
        break;
      }
      uint64_t v3 = *(void *)(v3 + 8);
      if (v3 == v2) {
        return 0;
      }
    }
  }
  if (v3 == v2) {
    return 0;
  }
  else {
    return v3 + 16;
  }
}

void *sub_1DCB470C0(void *a1, uint64_t a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v6[0] = a2;
  sub_1DCB4C8F4(v5, (uint64_t)v6, 1);
  sub_1DCB63128(a1, (uint64_t)v5);
  uint64_t result = sub_1DCB44990(v5);
  *(void *)(a2 + 8) = a1;
  return result;
}

void sub_1DCB47144(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1DCB44990((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1DCB47160(uint64_t a1, uint64_t a2)
{
  if (!*(_DWORD *)(a1 + 248)) {
    __assert_rtn("setProcessingContexts", "SoundAnalysis_ProcessingTree.cpp", 256, "format().mBlockSize > 0");
  }
  v67[0] = (uint64_t)v67;
  v67[1] = (uint64_t)v67;
  uint64_t v68 = 0;
  uint64_t v4 = (long long *)(a1 + 16);
  long long v5 = *(long long **)(a1 + 24);
  uint64_t v6 = *(long long **)(a2 + 8);
  while (v5 != v4 && v6 != (long long *)a2)
  {
    if (*((void *)v6 + 2) == *((void *)v5 + 2))
    {
      if (v5 >= v6 || *((void *)v6 + 4) == *((void *)v5 + 4))
      {
        if (v6 < v5 && *((void *)v6 + 4) != *((void *)v5 + 4)) {
          goto LABEL_16;
        }
LABEL_15:
        uint64_t v8 = sub_1DCB4C988((uint64_t)v67, 0, 0, (void *)v5 + 2);
        uint64_t v9 = v67[0];
        *uint64_t v8 = v67[0];
        v8[1] = v67;
        *(void *)(v9 + 8) = v8;
        v67[0] = (uint64_t)v8;
        ++v68;
        long long v5 = (long long *)*((void *)v5 + 1);
        goto LABEL_16;
      }
LABEL_13:
      long long v5 = (long long *)*((void *)v5 + 1);
    }
    else
    {
      if (v5 < v6) {
        goto LABEL_13;
      }
      if (v6 >= v5) {
        goto LABEL_15;
      }
LABEL_16:
      uint64_t v6 = (long long *)*((void *)v6 + 1);
    }
  }
  sub_1DCB4C9F4(&v64, (uint64_t)v4);
  sub_1DCB4C9F4(&v61, a2);
  uint64_t v10 = v65;
  if (v65 != &v64)
  {
    while (1)
    {
      uint64_t v11 = v10[2];
      uint64_t v12 = (std::__shared_weak_count *)v10[3];
      uint64_t v57 = v11;
      uint64_t v58 = v12;
      if (v12) {
        atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t v13 = v10[4];
      int v14 = (std::__shared_weak_count *)v10[5];
      uint64_t v59 = v13;
      unint64_t v60 = v14;
      if (v14) {
        atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      for (uint64_t i = *(void **)(a1 + 96); ; uint64_t i = (void *)i[1])
      {
        if (i == (void *)(a1 + 88)) {
          __assert_rtn("removeProcessingContext", "SoundAnalysis_ProcessingTree.cpp", 335, "requestProcessingNode");
        }
        if (i[8] == v11 && i[10] == v13) {
          break;
        }
      }
      *(void *)&long long v74 = &v74;
      *((void *)&v74 + 1) = &v74;
      *(void *)&long long v75 = 0;
      int64x2_t v16 = *(long long **)(a1 + 24);
      if (v16 != v4) {
        break;
      }
LABEL_49:
      uint64_t v25 = (uint64_t)(i + 2);
      sub_1DCB48F64((uint64_t *)&v74);
      sub_1DCB47954((uint64_t *)a1, v25);
      if (v60) {
        sub_1DCB44254(v60);
      }
      if (v58) {
        sub_1DCB44254(v58);
      }
      uint64_t v10 = (uint64_t *)v10[1];
      if (v10 == &v64) {
        goto LABEL_54;
      }
    }
    uint64_t v17 = 0;
    while (2)
    {
      if (*((void *)v16 + 2) != v11)
      {
        uint64_t v18 = v16;
        goto LABEL_31;
      }
      uint64_t v18 = (long long *)*((void *)v16 + 1);
      if (*((void *)v16 + 4) == v13)
      {
        while (v18 != v4)
        {
          if (*((void *)v18 + 2) != v11 || *((void *)v18 + 4) != v13)
          {
            char v19 = 0;
            goto LABEL_40;
          }
          uint64_t v18 = (long long *)*((void *)v18 + 1);
        }
        char v19 = 1;
        uint64_t v18 = v4;
LABEL_40:
        if (v16 != v18)
        {
          uint64_t v20 = *(long long **)v18;
          if (&v74 != v4)
          {
            uint64_t v21 = 1;
            if (v20 != v16)
            {
              uint64_t v22 = v16;
              do
              {
                uint64_t v22 = (long long *)*((void *)v22 + 1);
                ++v21;
              }
              while (v22 != v20);
            }
            *(void *)(a1 + 32) -= v21;
            v17 += v21;
            *(void *)&long long v75 = v17;
          }
          uint64_t v23 = *(void *)v16;
          *(void *)(v23 + 8) = *((void *)v20 + 1);
          **((void **)v20 + 1) = v23;
          uint64_t v24 = v74;
          *(void *)(v74 + 8) = v16;
          *(void *)int64x2_t v16 = v24;
          *(void *)&long long v74 = v20;
          *((void *)v20 + 1) = &v74;
        }
        if ((v19 & 1) == 0) {
LABEL_31:
        }
          uint64_t v18 = (long long *)*((void *)v18 + 1);
      }
      int64x2_t v16 = v18;
      if (v18 == v4) {
        goto LABEL_49;
      }
      continue;
    }
  }
LABEL_54:
  sub_1DCB45504((DSPGraph::Graph **)a1);
  for (uint64_t j = *(void **)(a2 + 8); j != (void *)a2; uint64_t j = (void *)j[1])
  {
    uint64_t v27 = (DSPGraph::Graph *)j[2];
    if (v27) {
      DSPGraph::Graph::reset(v27);
    }
    unint64_t v28 = (DSPGraph::Graph *)j[4];
    if (v28) {
      DSPGraph::Graph::reset(v28);
    }
  }
  unint64_t v29 = v62;
  if (v62 != &v61)
  {
    uint64x2_t v30 = (void *)(a1 + 88);
    do
    {
      int64x2_t v31 = (DSPGraph::Graph *)v29[2];
      uint64_t v32 = (std::__shared_weak_count *)v29[3];
      int64x2_t v53 = v31;
      int64x2_t v54 = v32;
      if (v32) {
        atomic_fetch_add_explicit(&v32->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t v34 = v29[4];
      uint64_t v33 = (std::__shared_weak_count *)v29[5];
      uint64_t v55 = v34;
      uint64_t v56 = v33;
      if (v33) {
        atomic_fetch_add_explicit(&v33->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      for (uint64_t k = *(void **)(a1 + 96); k != v30; uint64_t k = (void *)k[1])
      {
        if (v31 == (DSPGraph::Graph *)k[8] && v34 == k[10]) {
          __assert_rtn("addProcessingContext", "SoundAnalysis_ProcessingTree.cpp", 183, "!findAnalyzerNodeForContext(processingContext)");
        }
      }
      unint64_t v36 = operator new(0x30uLL);
      *unint64_t v36 = 0;
      v36[1] = 0;
      v36[2] = v31;
      v36[3] = v32;
      if (v32) {
        atomic_fetch_add_explicit(&v32->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      v36[4] = v34;
      v36[5] = v33;
      if (v33) {
        atomic_fetch_add_explicit(&v33->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t v37 = *(void *)(a1 + 16);
      *unint64_t v36 = v37;
      v36[1] = v4;
      *(void *)(v37 + 8) = v36;
      *(void *)(a1 + 16) = v36;
      ++*(void *)(a1 + 32);
      uint64_t v38 = operator new(0x60uLL);
      uint64_t v39 = v38;
      *uint64_t v38 = 0;
      v38[1] = 0;
      if (v32) {
        atomic_fetch_add_explicit(&v32->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      if (v33) {
        atomic_fetch_add_explicit(&v33->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t v40 = (uint64_t)(v38 + 2);
      v38[3] = 0;
      v38[4] = v38 + 4;
      v38[6] = 0;
      v38[7] = 0;
      v38[5] = v38 + 4;
      v38[2] = &unk_1F37F6250;
      v38[8] = v31;
      v38[9] = v32;
      if (v32) {
        atomic_fetch_add_explicit(&v32->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      v38[10] = v34;
      v38[11] = v33;
      if (v33)
      {
        atomic_fetch_add_explicit(&v33->__shared_owners_, 1uLL, memory_order_relaxed);
        sub_1DCB44254(v33);
      }
      if (v32) {
        sub_1DCB44254(v32);
      }
      uint64_t v41 = *(void *)(a1 + 88);
      void *v39 = v41;
      v39[1] = v30;
      *(void *)(v41 + 8) = v39;
      *(void *)(a1 + 88) = v39;
      ++*(void *)(a1 + 104);
      if (v39[10])
      {
        unint64_t v42 = (void *)sub_1DCB46F24(a1, (uint64_t)(v39 + 2));
        int v43 = v42 == 0;
        if (!v42)
        {
          sub_1DCB592D8(&v53, (uint64_t)&v74);
          BOOL v52 = DWORD2(v76) > 1;
          int64x2_t v44 = (std::__shared_weak_count *)v39[11];
          uint64_t v51 = v39[10];
          if (v44) {
            atomic_fetch_add_explicit(&v44->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          int64x2_t v45 = operator new(0x58uLL);
          int8x16_t v46 = v45;
          unint64_t v42 = v45 + 2;
          *int64x2_t v45 = 0;
          v45[1] = 0;
          v45[3] = 0;
          v45[4] = v45 + 4;
          v45[6] = 0;
          v45[7] = 0;
          v45[5] = v45 + 4;
          v45[2] = &unk_1F37F6300;
          v45[8] = v51;
          v45[9] = v44;
          if (v44)
          {
            atomic_fetch_add_explicit(&v44->__shared_owners_, 1uLL, memory_order_relaxed);
            *((unsigned char *)v45 + 80) = v52;
            sub_1DCB44254(v44);
          }
          else
          {
            *((unsigned char *)v45 + 80) = v52;
          }
          uint64_t v47 = *(void *)(a1 + 64);
          *int8x16_t v46 = v47;
          v46[1] = a1 + 64;
          *(void *)(v47 + 8) = v46;
          *(void *)(a1 + 64) = v46;
          ++*(void *)(a1 + 80);
        }
        sub_1DCB470C0(v42, (uint64_t)(v39 + 2));
        uint64_t v40 = (uint64_t)v42;
      }
      else
      {
        int v43 = 0;
      }
      uint64_t v48 = (void *)sub_1DCB46FF4(a1, v40);
      if (!v48)
      {
        long long v49 = *(_OWORD *)(a1 + 224);
        long long v70 = *(_OWORD *)(a1 + 208);
        long long v71 = v49;
        long long v72 = *(_OWORD *)(a1 + 240);
        (*(void (**)(_OWORD *__return_ptr, uint64_t))(*(void *)v40 + 16))(v69, v40);
        unint64_t v50 = operator new(0xB0uLL);
        *unint64_t v50 = 0;
        v50[1] = 0;
        long long v75 = v71;
        long long v76 = v72;
        v73[0] = v69[0];
        v73[1] = v69[1];
        v73[2] = v69[2];
        long long v74 = v70;
        sub_1DCB44398((uint64_t)(v50 + 2), &v74, v73);
      }
      if (((v39[10] != 0) & ~v43) == 0) {
        sub_1DCB470C0(v48, v40);
      }
      if (v56) {
        sub_1DCB44254(v56);
      }
      if (v54) {
        sub_1DCB44254(v54);
      }
      unint64_t v29 = (uint64_t *)v29[1];
    }
    while (v29 != &v61);
  }
  if (v66 | v63) {
    sub_1DCB45504((DSPGraph::Graph **)a1);
  }
  sub_1DCB48F64(&v61);
  sub_1DCB48F64(&v64);
  sub_1DCB48F64(v67);
}

void sub_1DCB47894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
}

uint64_t sub_1DCB47918(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 24);
  if (v2) {
    sub_1DCB44254(v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 8);
  if (v3) {
    sub_1DCB44254(v3);
  }
  return a1;
}

void sub_1DCB47954(uint64_t *a1, uint64_t a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (!a2) {
    __assert_rtn("removeNodeRecursively", "SoundAnalysis_ProcessingTree.cpp", 296, "node");
  }
  uint64_t v4 = *(void *)(a2 + 8);
  int v5 = (**(uint64_t (***)(uint64_t))a2)(a2);
  if (v5 == 1)
  {
    int64x2_t v16 = a1 + 5;
    uint64_t v37 = (uint64_t)&v37;
    uint64_t v38 = &v37;
    uint64_t v39 = 0;
    uint64_t v17 = (uint64_t *)a1[6];
    if (v17 != a1 + 5)
    {
      uint64_t v18 = 0;
      do
      {
        char v19 = (uint64_t *)v17[1];
        if (v17 + 2 == (uint64_t *)a2)
        {
          if (v19 != v16 && v17 == v19)
          {
            while (1)
              ;
          }
          if (v17 != v19)
          {
            uint64_t v21 = *v19;
            if (&v37 != v16)
            {
              uint64_t v22 = 1;
              if ((uint64_t *)v21 != v17)
              {
                uint64_t v23 = v17;
                do
                {
                  uint64_t v23 = (uint64_t *)v23[1];
                  ++v22;
                }
                while (v23 != (uint64_t *)v21);
              }
              a1[7] -= v22;
              v18 += v22;
              uint64_t v39 = v18;
            }
            uint64_t v24 = *v17;
            *(void *)(v24 + 8) = *(void *)(v21 + 8);
            **(void **)(v21 + 8) = v24;
            uint64_t v25 = v37;
            *(void *)(v37 + 8) = v17;
            *uint64_t v17 = v25;
            uint64_t v37 = v21;
            *(void *)(v21 + 8) = &v37;
          }
          if (v19 == v16) {
            break;
          }
          char v19 = (uint64_t *)v19[1];
        }
        uint64_t v17 = v19;
      }
      while (v19 != v16);
    }
    sub_1DCB48ED0(&v37);
    goto LABEL_43;
  }
  if (v5 != 2)
  {
    if (v5 == 3)
    {
      uint64_t v6 = a1 + 11;
      uint64_t v37 = (uint64_t)&v37;
      uint64_t v38 = &v37;
      uint64_t v39 = 0;
      uint64_t v7 = (uint64_t *)a1[12];
      if (v7 != a1 + 11)
      {
        uint64_t v8 = 0;
        do
        {
          uint64_t v9 = (uint64_t *)v7[1];
          if (v7 + 2 == (uint64_t *)a2)
          {
            if (v9 != v6 && v7 == v9)
            {
              while (1)
                ;
            }
            if (v7 != v9)
            {
              uint64_t v11 = *v9;
              if (&v37 != v6)
              {
                uint64_t v12 = 1;
                if ((uint64_t *)v11 != v7)
                {
                  uint64_t v13 = v7;
                  do
                  {
                    uint64_t v13 = (uint64_t *)v13[1];
                    ++v12;
                  }
                  while (v13 != (uint64_t *)v11);
                }
                a1[13] -= v12;
                v8 += v12;
                uint64_t v39 = v8;
              }
              uint64_t v14 = *v7;
              *(void *)(v14 + 8) = *(void *)(v11 + 8);
              **(void **)(v11 + 8) = v14;
              uint64_t v15 = v37;
              *(void *)(v37 + 8) = v7;
              *uint64_t v7 = v15;
              uint64_t v37 = v11;
              *(void *)(v11 + 8) = &v37;
            }
            if (v9 == v6) {
              break;
            }
            uint64_t v9 = (uint64_t *)v9[1];
          }
          uint64_t v7 = v9;
        }
        while (v9 != v6);
      }
      sub_1DCB48DA8(&v37);
      if (!v4) {
        return;
      }
LABEL_44:
      uint64_t v37 = a2;
      sub_1DCB4C8F4(v36, (uint64_t)&v37, 1);
      sub_1DCB632DC(v4, (uint64_t)v36);
      sub_1DCB44990(v36);
      if (!*(void *)(v4 + 32)) {
        sub_1DCB47954(a1, v4);
      }
      return;
    }
LABEL_43:
    if (!v4) {
      return;
    }
    goto LABEL_44;
  }
  uint64_t v26 = a1 + 8;
  uint64_t v37 = (uint64_t)&v37;
  uint64_t v38 = &v37;
  uint64_t v39 = 0;
  uint64_t v27 = (uint64_t *)a1[9];
  if (v27 != a1 + 8)
  {
    uint64_t v28 = 0;
    do
    {
      unint64_t v29 = (uint64_t *)v27[1];
      if (v27 + 2 == (uint64_t *)a2)
      {
        if (v29 != v26 && v27 == v29)
        {
          while (1)
            ;
        }
        if (v27 != v29)
        {
          uint64_t v31 = *v29;
          if (&v37 != v26)
          {
            uint64_t v32 = 1;
            if ((uint64_t *)v31 != v27)
            {
              uint64_t v33 = v27;
              do
              {
                uint64_t v33 = (uint64_t *)v33[1];
                ++v32;
              }
              while (v33 != (uint64_t *)v31);
            }
            a1[10] -= v32;
            v28 += v32;
            uint64_t v39 = v28;
          }
          uint64_t v34 = *v27;
          *(void *)(v34 + 8) = *(void *)(v31 + 8);
          **(void **)(v31 + 8) = v34;
          uint64_t v35 = v37;
          *(void *)(v37 + 8) = v27;
          *uint64_t v27 = v35;
          uint64_t v37 = v31;
          *(void *)(v31 + 8) = &v37;
        }
        if (v29 == v26) {
          break;
        }
        unint64_t v29 = (uint64_t *)v29[1];
      }
      uint64_t v27 = v29;
    }
    while (v29 != v26);
  }
  sub_1DCB48E3C(&v37);
  if (v4) {
    goto LABEL_44;
  }
}

void sub_1DCB47CD8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1DCB44990((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB47CF4(void *a1, uint64_t a2, DSPGraph::Box *a3)
{
  if (!a3) {
    __assert_rtn("convertSampleTimeToRootSampleTime", "SoundAnalysis_ProcessingTree.cpp", 433, "box");
  }
  uint64_t v6 = *((void *)a3 + 2);
  uint64_t v7 = sub_1DCB482BC(*(void *)(v6 + 288));
  double v8 = *(double *)(v6 + 256);
  uint64_t v9 = sub_1DCB482BC(*(void *)(v6 + 304));
  uint64_t v10 = (*(uint64_t (**)(DSPGraph::Box *))(*(void *)a3 + 72))(a3);
  uint64_t v11 = DSPGraph::Box::upstreamLatencyInTicks(a3);
  if (!*a1) {
    __assert_rtn("findGraphBoxContainingBox", "SoundAnalysis_ProcessingTree.cpp", 389, "treeGraph");
  }
  uint64_t v61 = v11;
  uint64_t v62 = v10;
  uint64_t v63 = v9;
  uint64_t v64 = v7;
  uint64_t v65 = a2;
  uint64_t v66 = a1;
  uint64_t v12 = *(uint64_t ***)(*a1 + 24);
  if (!v12) {
    goto LABEL_47;
  }
  while (1)
  {
    uint64_t v13 = (char *)(*(uint64_t (**)(uint64_t *))(*v12[2] + 16))(v12[2]);
    sub_1DCB43D1C(&__p, v13);
    unint64_t v14 = v69;
    if ((v69 & 0x80u) != 0) {
      unint64_t v14 = (unint64_t)v68;
    }
    if (v14 == 17)
    {
      p_p = (uint64_t *)__p;
      if ((v69 & 0x80u) == 0) {
        p_p = (uint64_t *)&__p;
      }
      uint64_t v16 = *p_p;
      uint64_t v17 = p_p[1];
      int v18 = *((unsigned __int8 *)p_p + 16);
      BOOL v21 = v16 == 0x74615269746C754DLL && v17 == 0x6F42687061724765 && v18 == 120;
      if (((char)v69 & 0x80000000) == 0)
      {
LABEL_21:
        if (v21) {
          goto LABEL_22;
        }
        goto LABEL_24;
      }
    }
    else
    {
      BOOL v21 = 0;
      if (((char)v69 & 0x80000000) == 0) {
        goto LABEL_21;
      }
    }
    operator delete(__p);
    if (v21)
    {
LABEL_22:
      uint64_t v22 = (DSPGraph::Graph *)(*(uint64_t (**)(uint64_t *))(*v12[2] + 728))(v12[2]);
      goto LABEL_45;
    }
LABEL_24:
    uint64_t v23 = (char *)(*(uint64_t (**)(uint64_t *))(*v12[2] + 16))(v12[2]);
    sub_1DCB43D1C(&__p, v23);
    unint64_t v24 = v69;
    if ((v69 & 0x80u) != 0) {
      unint64_t v24 = (unint64_t)v68;
    }
    if (v24 == 18) {
      break;
    }
    BOOL v31 = 0;
    if (((char)v69 & 0x80000000) == 0) {
      goto LABEL_41;
    }
LABEL_43:
    operator delete(__p);
    if (v31) {
      goto LABEL_44;
    }
LABEL_46:
    uint64_t v12 = (uint64_t **)*v12;
    if (!v12) {
      goto LABEL_47;
    }
  }
  uint64_t v25 = (uint64_t *)__p;
  if ((v69 & 0x80u) == 0) {
    uint64_t v25 = (uint64_t *)&__p;
  }
  uint64_t v26 = *v25;
  uint64_t v27 = v25[1];
  int v28 = *((unsigned __int16 *)v25 + 8);
  BOOL v31 = v26 == 0x6152656C676E6953 && v27 == 0x4268706172476574 && v28 == 30831;
  if ((char)v69 < 0) {
    goto LABEL_43;
  }
LABEL_41:
  if (!v31) {
    goto LABEL_46;
  }
LABEL_44:
  uint64_t v22 = (DSPGraph::Graph *)(*(uint64_t (**)(uint64_t *))(*v12[2] + 664))(v12[2]);
LABEL_45:
  if (v22 != *((DSPGraph::Graph **)a3 + 1)) {
    goto LABEL_46;
  }
  uint64_t v33 = (DSPGraph::Graph **)v12[2];
  if (!v33)
  {
LABEL_47:
    exceptiouint64_t n = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Couldn't find GraphBox containing graph");
    __cxa_throw(exception, (struct type_info *)&unk_1F37F61D0, MEMORY[0x1E4FBA1D8]);
  }
  uint64_t v34 = DSPGraph::Graph::in(v22);
  uint64_t v35 = *(void *)(*(void *)(v34 + 8) + 704);
  if ((char *)(*((uint64_t (**)(DSPGraph::Graph **))*v33 + 2))(v33) == "MultiRateGraphBox")
  {
    unint64_t v36 = (int *)v33 + 255;
  }
  else
  {
    if ((char *)(*((uint64_t (**)(DSPGraph::Graph **))*v33 + 2))(v33) != "SingleRateGraphBox") {
      __assert_rtn("getCurrentInputSampleFromGraphBox", "SoundAnalysis_ProcessingTree.cpp", 428, "false");
    }
    unint64_t v36 = (int *)v33 + 227;
  }
  uint64_t v37 = *v36;
  uint64_t v38 = sub_1DCB482BC(v35);
  uint64_t v39 = sub_1DCB482BC(*(void *)(*(void *)(v34 + 16) + 304));
  uint64_t v40 = sub_1DCB48328(v64 + (v65 - (int)v8) * v63 - (v62 + v61), v38, v37, v39);
  uint64_t v41 = v33[2];
  uint64_t v42 = sub_1DCB482BC(*((void *)v41 + 36));
  double v43 = *((double *)v41 + 32);
  uint64_t v44 = sub_1DCB482BC(*((void *)v41 + 38));
  uint64_t v45 = DSPGraph::Box::upstreamLatencyInTicks((DSPGraph::Box *)v33);
  int8x16_t v46 = (void *)v66[3];
  if (v46 != v66 + 2)
  {
    uint64_t v47 = *((void *)a3 + 1);
    do
    {
      if (v46[2] == v47)
      {
        for (uint64_t i = (void *)v66[12]; i != v66 + 11; uint64_t i = (void *)i[1])
        {
          if (i[8] == v47)
          {
            uint64_t v49 = v46[4];
            if (v49 == i[10])
            {
              uint64_t v50 = (uint64_t)(i + 2);
              if (v49)
              {
                uint64_t v51 = sub_1DCB46F24((uint64_t)v66, (uint64_t)(i + 2));
                if (v51) {
                  uint64_t v50 = v51;
                }
              }
              uint64_t v52 = sub_1DCB46FF4((uint64_t)v66, v50);
              if (v52)
              {
                (*(void (**)(void **__return_ptr))(*(void *)v52 + 8))(&__p);
                int64x2_t v53 = (DSPGraph::Box *)DSPGraph::Graph::out((DSPGraph::Graph *)__p);
                uint64_t v54 = DSPGraph::Box::upstreamLatencyInTicks(v53);
                if (v68) {
                  sub_1DCB44254(v68);
                }
                v45 -= v54;
              }
              goto LABEL_70;
            }
          }
        }
      }
      int8x16_t v46 = (void *)v46[1];
    }
    while (v46 != v66 + 2);
  }
LABEL_70:
  uint64_t v55 = v42 + (v40 - (int)v43) * v44 - v45;
  uint64_t v56 = DSPGraph::Graph::in(v33[1]);
  uint64_t v57 = v66[37];
  uint64_t v58 = sub_1DCB482BC(*((void *)v33[1] + 88));
  uint64_t v59 = sub_1DCB482BC(*(void *)(*(void *)(v56 + 16) + 304));
  return sub_1DCB48328(v55, v58, v57, v59);
}

void sub_1DCB48294(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, std::__shared_weak_count *a17)
{
  if (a17) {
    sub_1DCB44254(a17);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DCB482BC(uint64_t result)
{
  if (result < 0)
  {
    exceptiouint64_t n = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_1DCB4C7B0(exception, "numerical cast overflow: could not retain value in conversion type");
    __cxa_throw(exception, (struct type_info *)&unk_1F37F61E8, MEMORY[0x1E4FBA1E0]);
  }
  return result;
}

void sub_1DCB48314(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB48328(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 - a2 >= 0x80000000)
  {
    exceptiouint64_t n = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Tick delta too large");
    __cxa_throw(exception, (struct type_info *)&unk_1F37F61D0, MEMORY[0x1E4FBA1D8]);
  }
  return (a1 - a2) / a4 + a3;
}

void sub_1DCB48394(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_1DCB483A8(uint64_t *a1, const void **a2)
{
  uint64_t v2 = *a1;
  if (!*a1)
  {
    exceptiouint64_t n = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "Processing tree graph is null");
    __cxa_throw(exception, (struct type_info *)&unk_1F37F6188, MEMORY[0x1E4FBA1B0]);
  }
  int v5 = (const char *)(v2 + 408);
  if (*(char *)(v2 + 431) < 0) {
    int v5 = *(const char **)v5;
  }
  if (*((char *)a2 + 23) >= 0) {
    size_t v6 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v6 = (size_t)a2[1];
  }
  size_t v7 = strlen(v5);
  double v8 = &v80;
  sub_1DCB4C7E4((uint64_t)&v80, v6 + v7);
  if ((v80.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    double v8 = (std::string *)v80.__r_.__value_.__r.__words[0];
  }
  if (v6)
  {
    if (*((char *)a2 + 23) >= 0) {
      uint64_t v9 = a2;
    }
    else {
      uint64_t v9 = *a2;
    }
    memmove(v8, v9, v6);
  }
  uint64_t v10 = (char *)v8 + v6;
  if (v7) {
    memmove(v10, v5, v7);
  }
  v10[v7] = 0;
  uint64_t v11 = std::string::append(&v80, ".dot", 4uLL);
  long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
  int64_t v74 = v11->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v12;
  v11->__r_.__value_.__l.__size_ = 0;
  v11->__r_.__value_.__r.__words[2] = 0;
  v11->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v80.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v80.__r_.__value_.__l.__data_);
  }
  uint64_t v13 = (const char *)(*a1 + 408);
  if (*(char *)(*a1 + 431) < 0) {
    uint64_t v13 = *(const char **)v13;
  }
  if (v74 >= 0) {
    unint64_t v14 = __p;
  }
  else {
    unint64_t v14 = (void **)__p[0];
  }
  DSPGraph::Graph::writeDotFile((DSPGraph::Graph *)*a1, v13, (const char *)v14);
  for (uint64_t i = (uint64_t *)a1[6]; i != a1 + 5; uint64_t i = (uint64_t *)i[1])
  {
    uint64_t v16 = (const char *)(*a1 + 408);
    if (*(char *)(*a1 + 431) < 0) {
      uint64_t v16 = *(const char **)v16;
    }
    if (*((char *)a2 + 23) >= 0) {
      size_t v17 = *((unsigned __int8 *)a2 + 23);
    }
    else {
      size_t v17 = (size_t)a2[1];
    }
    size_t v18 = strlen(v16);
    sub_1DCB4C7E4((uint64_t)&v77, v17 + v18);
    if ((v77.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      char v19 = &v77;
    }
    else {
      char v19 = (std::string *)v77.__r_.__value_.__r.__words[0];
    }
    if (v17)
    {
      if (*((char *)a2 + 23) >= 0) {
        uint64_t v20 = a2;
      }
      else {
        uint64_t v20 = *a2;
      }
      memmove(v19, v20, v17);
    }
    BOOL v21 = (char *)v19 + v17;
    if (v18) {
      memmove(v21, v16, v18);
    }
    v21[v18] = 0;
    uint64_t v22 = std::string::append(&v77, "_", 1uLL);
    uint64_t v23 = i + 2;
    long long v24 = *(_OWORD *)&v22->__r_.__value_.__l.__data_;
    v78.__r_.__value_.__r.__words[2] = v22->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v78.__r_.__value_.__l.__data_ = v24;
    v22->__r_.__value_.__l.__size_ = 0;
    v22->__r_.__value_.__r.__words[2] = 0;
    v22->__r_.__value_.__r.__words[0] = 0;
    (*(void (**)(uint64_t *__return_ptr, uint64_t *))(i[2] + 8))(&v75, i + 2);
    uint64_t v25 = (const char *)(v75 + 408);
    if (*(char *)(v75 + 431) < 0) {
      uint64_t v25 = *(const char **)v25;
    }
    std::string::size_type v26 = strlen(v25);
    uint64_t v27 = std::string::append(&v78, v25, v26);
    long long v28 = *(_OWORD *)&v27->__r_.__value_.__l.__data_;
    v79.__r_.__value_.__r.__words[2] = v27->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v79.__r_.__value_.__l.__data_ = v28;
    v27->__r_.__value_.__l.__size_ = 0;
    v27->__r_.__value_.__r.__words[2] = 0;
    v27->__r_.__value_.__r.__words[0] = 0;
    unint64_t v29 = std::string::append(&v79, ".dot", 4uLL);
    long long v30 = *(_OWORD *)&v29->__r_.__value_.__l.__data_;
    v80.__r_.__value_.__r.__words[2] = v29->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v80.__r_.__value_.__l.__data_ = v30;
    v29->__r_.__value_.__l.__size_ = 0;
    v29->__r_.__value_.__r.__words[2] = 0;
    v29->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(v79.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v79.__r_.__value_.__l.__data_);
    }
    if (v76) {
      sub_1DCB44254(v76);
    }
    if (SHIBYTE(v78.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v78.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v77.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v77.__r_.__value_.__l.__data_);
    }
    (*(void (**)(std::string *__return_ptr, uint64_t *))(*v23 + 8))(&v79, i + 2);
    BOOL v31 = (DSPGraph::Graph *)v79.__r_.__value_.__r.__words[0];
    (*(void (**)(std::string *__return_ptr, uint64_t *))(*v23 + 8))(&v78, i + 2);
    uint64_t v32 = (const char *)(v78.__r_.__value_.__r.__words[0] + 408);
    if (*(char *)(v78.__r_.__value_.__r.__words[0] + 431) < 0) {
      uint64_t v32 = *(const char **)v32;
    }
    if ((v80.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v33 = &v80;
    }
    else {
      uint64_t v33 = (std::string *)v80.__r_.__value_.__r.__words[0];
    }
    DSPGraph::Graph::writeDotFile(v31, v32, (const char *)v33);
    if (v78.__r_.__value_.__l.__size_) {
      sub_1DCB44254((std::__shared_weak_count *)v78.__r_.__value_.__l.__size_);
    }
    if (v79.__r_.__value_.__l.__size_) {
      sub_1DCB44254((std::__shared_weak_count *)v79.__r_.__value_.__l.__size_);
    }
    if (SHIBYTE(v80.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v80.__r_.__value_.__l.__data_);
    }
  }
  for (uint64_t j = (uint64_t *)a1[9]; j != a1 + 8; uint64_t j = (uint64_t *)j[1])
  {
    uint64_t v35 = (const char *)(*a1 + 408);
    if (*(char *)(*a1 + 431) < 0) {
      uint64_t v35 = *(const char **)v35;
    }
    if (*((char *)a2 + 23) >= 0) {
      size_t v36 = *((unsigned __int8 *)a2 + 23);
    }
    else {
      size_t v36 = (size_t)a2[1];
    }
    size_t v37 = strlen(v35);
    sub_1DCB4C7E4((uint64_t)&v77, v36 + v37);
    if ((v77.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v38 = &v77;
    }
    else {
      uint64_t v38 = (std::string *)v77.__r_.__value_.__r.__words[0];
    }
    if (v36)
    {
      if (*((char *)a2 + 23) >= 0) {
        uint64_t v39 = a2;
      }
      else {
        uint64_t v39 = *a2;
      }
      memmove(v38, v39, v36);
    }
    uint64_t v40 = (char *)v38 + v36;
    if (v37) {
      memmove(v40, v35, v37);
    }
    v40[v37] = 0;
    uint64_t v41 = std::string::append(&v77, "_", 1uLL);
    uint64_t v42 = j + 2;
    long long v43 = *(_OWORD *)&v41->__r_.__value_.__l.__data_;
    v78.__r_.__value_.__r.__words[2] = v41->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v78.__r_.__value_.__l.__data_ = v43;
    v41->__r_.__value_.__l.__size_ = 0;
    v41->__r_.__value_.__r.__words[2] = 0;
    v41->__r_.__value_.__r.__words[0] = 0;
    (*(void (**)(uint64_t *__return_ptr, uint64_t *))(j[2] + 8))(&v75, j + 2);
    uint64_t v44 = (const char *)(v75 + 408);
    if (*(char *)(v75 + 431) < 0) {
      uint64_t v44 = *(const char **)v44;
    }
    std::string::size_type v45 = strlen(v44);
    int8x16_t v46 = std::string::append(&v78, v44, v45);
    long long v47 = *(_OWORD *)&v46->__r_.__value_.__l.__data_;
    v79.__r_.__value_.__r.__words[2] = v46->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v79.__r_.__value_.__l.__data_ = v47;
    v46->__r_.__value_.__l.__size_ = 0;
    v46->__r_.__value_.__r.__words[2] = 0;
    v46->__r_.__value_.__r.__words[0] = 0;
    uint64_t v48 = std::string::append(&v79, ".dot", 4uLL);
    long long v49 = *(_OWORD *)&v48->__r_.__value_.__l.__data_;
    v80.__r_.__value_.__r.__words[2] = v48->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v80.__r_.__value_.__l.__data_ = v49;
    v48->__r_.__value_.__l.__size_ = 0;
    v48->__r_.__value_.__r.__words[2] = 0;
    v48->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(v79.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v79.__r_.__value_.__l.__data_);
    }
    if (v76) {
      sub_1DCB44254(v76);
    }
    if (SHIBYTE(v78.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v78.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v77.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v77.__r_.__value_.__l.__data_);
    }
    (*(void (**)(std::string *__return_ptr, uint64_t *))(*v42 + 8))(&v79, j + 2);
    uint64_t v50 = (DSPGraph::Graph *)v79.__r_.__value_.__r.__words[0];
    (*(void (**)(std::string *__return_ptr, uint64_t *))(*v42 + 8))(&v78, j + 2);
    uint64_t v51 = (const char *)(v78.__r_.__value_.__r.__words[0] + 408);
    if (*(char *)(v78.__r_.__value_.__r.__words[0] + 431) < 0) {
      uint64_t v51 = *(const char **)v51;
    }
    if ((v80.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v52 = &v80;
    }
    else {
      uint64_t v52 = (std::string *)v80.__r_.__value_.__r.__words[0];
    }
    DSPGraph::Graph::writeDotFile(v50, v51, (const char *)v52);
    if (v78.__r_.__value_.__l.__size_) {
      sub_1DCB44254((std::__shared_weak_count *)v78.__r_.__value_.__l.__size_);
    }
    if (v79.__r_.__value_.__l.__size_) {
      sub_1DCB44254((std::__shared_weak_count *)v79.__r_.__value_.__l.__size_);
    }
    if (SHIBYTE(v80.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v80.__r_.__value_.__l.__data_);
    }
  }
  for (uint64_t k = (uint64_t *)a1[12]; k != a1 + 11; uint64_t k = (uint64_t *)k[1])
  {
    uint64_t v54 = (const char *)(*a1 + 408);
    if (*(char *)(*a1 + 431) < 0) {
      uint64_t v54 = *(const char **)v54;
    }
    if (*((char *)a2 + 23) >= 0) {
      size_t v55 = *((unsigned __int8 *)a2 + 23);
    }
    else {
      size_t v55 = (size_t)a2[1];
    }
    size_t v56 = strlen(v54);
    sub_1DCB4C7E4((uint64_t)&v77, v55 + v56);
    if ((v77.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v57 = &v77;
    }
    else {
      uint64_t v57 = (std::string *)v77.__r_.__value_.__r.__words[0];
    }
    if (v55)
    {
      if (*((char *)a2 + 23) >= 0) {
        uint64_t v58 = a2;
      }
      else {
        uint64_t v58 = *a2;
      }
      memmove(v57, v58, v55);
    }
    uint64_t v59 = (char *)v57 + v55;
    if (v56) {
      memmove(v59, v54, v56);
    }
    v59[v56] = 0;
    unint64_t v60 = std::string::append(&v77, "_", 1uLL);
    uint64_t v61 = k + 2;
    long long v62 = *(_OWORD *)&v60->__r_.__value_.__l.__data_;
    v78.__r_.__value_.__r.__words[2] = v60->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v78.__r_.__value_.__l.__data_ = v62;
    v60->__r_.__value_.__l.__size_ = 0;
    v60->__r_.__value_.__r.__words[2] = 0;
    v60->__r_.__value_.__r.__words[0] = 0;
    (*(void (**)(uint64_t *__return_ptr, uint64_t *))(k[2] + 8))(&v75, k + 2);
    uint64_t v63 = (const char *)(v75 + 408);
    if (*(char *)(v75 + 431) < 0) {
      uint64_t v63 = *(const char **)v63;
    }
    std::string::size_type v64 = strlen(v63);
    uint64_t v65 = std::string::append(&v78, v63, v64);
    long long v66 = *(_OWORD *)&v65->__r_.__value_.__l.__data_;
    v79.__r_.__value_.__r.__words[2] = v65->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v79.__r_.__value_.__l.__data_ = v66;
    v65->__r_.__value_.__l.__size_ = 0;
    v65->__r_.__value_.__r.__words[2] = 0;
    v65->__r_.__value_.__r.__words[0] = 0;
    uint64_t v67 = std::string::append(&v79, ".dot", 4uLL);
    long long v68 = *(_OWORD *)&v67->__r_.__value_.__l.__data_;
    v80.__r_.__value_.__r.__words[2] = v67->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v80.__r_.__value_.__l.__data_ = v68;
    v67->__r_.__value_.__l.__size_ = 0;
    v67->__r_.__value_.__r.__words[2] = 0;
    v67->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(v79.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v79.__r_.__value_.__l.__data_);
    }
    if (v76) {
      sub_1DCB44254(v76);
    }
    if (SHIBYTE(v78.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v78.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v77.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v77.__r_.__value_.__l.__data_);
    }
    (*(void (**)(std::string *__return_ptr, uint64_t *))(*v61 + 8))(&v79, k + 2);
    unsigned __int8 v69 = (DSPGraph::Graph *)v79.__r_.__value_.__r.__words[0];
    (*(void (**)(std::string *__return_ptr, uint64_t *))(*v61 + 8))(&v78, k + 2);
    long long v70 = (const char *)(v78.__r_.__value_.__r.__words[0] + 408);
    if (*(char *)(v78.__r_.__value_.__r.__words[0] + 431) < 0) {
      long long v70 = *(const char **)v70;
    }
    if ((v80.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      long long v71 = &v80;
    }
    else {
      long long v71 = (std::string *)v80.__r_.__value_.__r.__words[0];
    }
    DSPGraph::Graph::writeDotFile(v69, v70, (const char *)v71);
    if (v78.__r_.__value_.__l.__size_) {
      sub_1DCB44254((std::__shared_weak_count *)v78.__r_.__value_.__l.__size_);
    }
    if (v79.__r_.__value_.__l.__size_) {
      sub_1DCB44254((std::__shared_weak_count *)v79.__r_.__value_.__l.__size_);
    }
    if (SHIBYTE(v80.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v80.__r_.__value_.__l.__data_);
    }
  }
  if (SHIBYTE(v74) < 0) {
    operator delete(__p[0]);
  }
}

void sub_1DCB48C7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35)
{
  __cxa_free_exception(v35);
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB48D98()
{
  return 0;
}

void sub_1DCB48DA0(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void sub_1DCB48DA8(uint64_t *a1)
{
  if (a1[2])
  {
    uint64_t v2 = *a1;
    uint64_t v3 = (uint64_t *)a1[1];
    uint64_t v4 = *v3;
    *(void *)(v4 + 8) = *(void *)(*a1 + 8);
    **(void **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        int v5 = (uint64_t *)v3[1];
        (*(void (**)(void))(v3[2] + 32))();
        operator delete(v3);
        uint64_t v3 = v5;
      }
      while (v5 != a1);
    }
  }
}

void sub_1DCB48E3C(uint64_t *a1)
{
  if (a1[2])
  {
    uint64_t v2 = *a1;
    uint64_t v3 = (uint64_t *)a1[1];
    uint64_t v4 = *v3;
    *(void *)(v4 + 8) = *(void *)(*a1 + 8);
    **(void **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        int v5 = (uint64_t *)v3[1];
        (*(void (**)(void))(v3[2] + 32))();
        operator delete(v3);
        uint64_t v3 = v5;
      }
      while (v5 != a1);
    }
  }
}

void sub_1DCB48ED0(uint64_t *a1)
{
  if (a1[2])
  {
    uint64_t v2 = *a1;
    uint64_t v3 = (uint64_t *)a1[1];
    uint64_t v4 = *v3;
    *(void *)(v4 + 8) = *(void *)(*a1 + 8);
    **(void **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        int v5 = (uint64_t *)v3[1];
        (*(void (**)(void))(v3[2] + 32))();
        operator delete(v3);
        uint64_t v3 = v5;
      }
      while (v5 != a1);
    }
  }
}

void sub_1DCB48F64(uint64_t *a1)
{
  if (a1[2])
  {
    uint64_t v2 = *a1;
    uint64_t v3 = (uint64_t *)a1[1];
    uint64_t v4 = *v3;
    *(void *)(v4 + 8) = *(void *)(*a1 + 8);
    **(void **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        int v5 = (uint64_t *)v3[1];
        sub_1DCB44348((uint64_t)(v3 + 2));
        operator delete(v3);
        uint64_t v3 = v5;
      }
      while (v5 != a1);
    }
  }
}

uint64_t sub_1DCB48FD8(uint64_t a1, uint64_t a2, int a3, char a4)
{
  if (a4)
  {
    int v4 = *(_DWORD *)(a1 + 12);
    int32x4_t v5 = *(int32x4_t *)(a2 + 8);
    v5.i64[1] = *(void *)(a1 + 8);
    if (vmaxv_u16((uint16x4_t)vmovn_s32(vceqzq_s32(v5)))) {
      return 1;
    }
  }
  else
  {
    int v4 = *(_DWORD *)(a1 + 12);
  }
  if (*(_DWORD *)(a1 + 8) != 1819304813) {
    return v4 == *(_DWORD *)(a2 + 12);
  }
  int v7 = v4 & 0x7FFFFFFF;
  if ((v4 & 0x7FFFFFFF) == 0) {
    int v7 = v4;
  }
  if (a3) {
    unsigned int v8 = v7;
  }
  else {
    unsigned int v8 = v7 & 0xFFFFFFBF;
  }
  unsigned int v9 = *(_DWORD *)(a1 + 24);
  if (v9)
  {
    int v10 = *(_DWORD *)(a1 + 28);
    if ((v4 & 0x20) != 0) {
      unsigned int v11 = 1;
    }
    else {
      unsigned int v11 = *(_DWORD *)(a1 + 28);
    }
    if (v11)
    {
      unsigned int v9 = 8 * (v9 / v11);
      unsigned int v12 = *(_DWORD *)(a1 + 32);
      int v13 = v8 | 8;
      BOOL v14 = v9 == v12;
      goto LABEL_21;
    }
    unsigned int v9 = 0;
    unsigned int v12 = *(_DWORD *)(a1 + 32);
    int v13 = v8 | 8;
  }
  else
  {
    int v13 = v8 | 8;
    int v10 = *(_DWORD *)(a1 + 28);
    unsigned int v12 = *(_DWORD *)(a1 + 32);
  }
  BOOL v14 = v12 == 0;
LABEL_21:
  if (v14) {
    unsigned int v8 = v13;
  }
  BOOL v16 = (v12 & 7) == 0 && v9 == v12;
  unsigned int v17 = v8 & 0xFFFFFFEF;
  if (!v16) {
    unsigned int v17 = v8;
  }
  if (v17) {
    v17 &= ~4u;
  }
  BOOL v18 = (v17 & 8) == 0 || v12 > 8;
  int v19 = v17 & 2;
  if (v18) {
    int v19 = v17;
  }
  if (v10 == 1) {
    unsigned int v20 = v19 & 0xFFFFFFDF;
  }
  else {
    unsigned int v20 = v19;
  }
  if (!v20) {
    unsigned int v20 = 0x80000000;
  }
  unsigned int v21 = *(_DWORD *)(a2 + 12);
  if (*(_DWORD *)(a2 + 8) != 1819304813) {
    return v20 == v21;
  }
  int v22 = v21 & 0x7FFFFFFF;
  if ((v21 & 0x7FFFFFFF) == 0) {
    int v22 = *(_DWORD *)(a2 + 12);
  }
  if (a3) {
    unsigned int v23 = v22;
  }
  else {
    unsigned int v23 = v22 & 0xFFFFFFBF;
  }
  unsigned int v24 = *(_DWORD *)(a2 + 24);
  if (!v24)
  {
    int v28 = v23 | 8;
    int v25 = *(_DWORD *)(a2 + 28);
    unsigned int v27 = *(_DWORD *)(a2 + 32);
LABEL_54:
    BOOL v29 = v27 == 0;
    goto LABEL_55;
  }
  int v25 = *(_DWORD *)(a2 + 28);
  if ((v21 & 0x20) != 0) {
    unsigned int v26 = 1;
  }
  else {
    unsigned int v26 = *(_DWORD *)(a2 + 28);
  }
  if (!v26)
  {
    unsigned int v24 = 0;
    unsigned int v27 = *(_DWORD *)(a2 + 32);
    int v28 = v23 | 8;
    goto LABEL_54;
  }
  unsigned int v24 = 8 * (v24 / v26);
  unsigned int v27 = *(_DWORD *)(a2 + 32);
  int v28 = v23 | 8;
  BOOL v29 = v24 == v27;
LABEL_55:
  if (v29) {
    unsigned int v23 = v28;
  }
  BOOL v30 = (v27 & 7) == 0 && v24 == v27;
  unsigned int v31 = v23 & 0xFFFFFFEF;
  if (!v30) {
    unsigned int v31 = v23;
  }
  if (v31) {
    v31 &= ~4u;
  }
  BOOL v32 = (v31 & 8) == 0 || v27 > 8;
  int v33 = v31 & 2;
  if (v32) {
    int v33 = v31;
  }
  if (v25 == 1) {
    unsigned int v34 = v33 & 0xFFFFFFDF;
  }
  else {
    unsigned int v34 = v33;
  }
  if (v34) {
    unsigned int v21 = v34;
  }
  else {
    unsigned int v21 = 0x80000000;
  }
  return v20 == v21;
}

void sub_1DCB49194()
{
  exceptiouint64_t n = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, (struct type_info *)&unk_1F37F6200, MEMORY[0x1E4FBA1F8]);
}

uint64_t sub_1DCB491C8(DSPGraph::Graph *a1)
{
  uint64_t v1 = DSPGraph::Graph::in(a1);
  uint64_t v2 = *(void *)(v1 + 88);
  if (*(void *)(v1 + 96) != v2) {
    return *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2) + 120) + 40);
  }
  sub_1DCB43D1C(v8, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
  sub_1DCB43D1C(v7, "out");
  int32x4_t v5 = (void *)(v1 + 32);
  if (*(char *)(v1 + 55) < 0) {
    int32x4_t v5 = (void *)*v5;
  }
  DSPGraph::strprintf(v6, (DSPGraph *)"Box::out inIndex out of range! box %s has %zu outputs but input %u was requested", v4, v5, (uint64_t)(*(void *)(v1 + 96) - *(void *)(v1 + 88)) >> 5, 0);
  uint64_t result = DSPGraph::ThrowException();
  __break(1u);
  return result;
}

void sub_1DCB492A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (*(char *)(v23 - 17) < 0) {
    operator delete(*(void **)(v23 - 40));
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DCB492EC(DSPGraph::Graph *a1)
{
  uint64_t v1 = DSPGraph::Graph::out(a1);
  uint64_t v2 = *(void *)(v1 + 64);
  if (*(void *)(v1 + 72) != v2) {
    return *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2) + 120) + 40);
  }
  sub_1DCB43D1C(v8, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
  sub_1DCB43D1C(v7, "in");
  int32x4_t v5 = (void *)(v1 + 32);
  if (*(char *)(v1 + 55) < 0) {
    int32x4_t v5 = (void *)*v5;
  }
  DSPGraph::strprintf(v6, (DSPGraph *)"Box::in inIndex out of range! box %s has %zu inputs but input %u was requested", v4, v5, (uint64_t)(*(void *)(v1 + 72) - *(void *)(v1 + 64)) >> 5, 0);
  uint64_t result = DSPGraph::ThrowException();
  __break(1u);
  return result;
}

void sub_1DCB493C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (*(char *)(v23 - 17) < 0) {
    operator delete(*(void **)(v23 - 40));
  }
  _Unwind_Resume(exception_object);
}

void sub_1DCB49414(uint64_t a1)
{
  sub_1DCB4A930(a1);

  JUMPOUT(0x1E01A8C50);
}

const char *sub_1DCB4944C()
{
  return "MultiRateGraphBox";
}

uint64_t sub_1DCB49458(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result = DSPGraph::Box::print();
  if (a3 >= 2)
  {
    DSPGraph::printi();
    size_t v6 = *(uint64_t (**)(void))(**(void **)(a1 + 896) + 24);
    return v6();
  }
  return result;
}

uint64_t sub_1DCB49514(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 712))();
}

unint64_t sub_1DCB49540(uint64_t a1)
{
  if (DSPGraph::Graph::numOutputs(*(DSPGraph::Graph **)(a1 + 896)))
  {
    unsigned int v2 = 0;
    unint64_t v3 = 0;
    do
    {
      int v4 = (DSPGraph::Box *)DSPGraph::Graph::out(*(DSPGraph::Graph **)(a1 + 896));
      unint64_t v5 = DSPGraph::Box::totalLatencyInTicks(v4);
      if (v3 <= v5) {
        unint64_t v3 = v5;
      }
      ++v2;
    }
    while (v2 < DSPGraph::Graph::numOutputs(*(DSPGraph::Graph **)(a1 + 896)));
  }
  else
  {
    unint64_t v3 = 0;
  }
  return *(void *)(*(void *)(a1 + 8) + 696) * v3 / *(void *)(*(void *)(a1 + 896) + 696);
}

uint64_t sub_1DCB495C8(uint64_t a1, uint64_t a2, int a3, int a4)
{
  if (a4 | a3)
  {
    sub_1DCB43D1C(v8, "/Library/Caches/com.apple.xbs/Sources/Listen/Framework/Internal/Core/DSPGraph/Boxes/DSPGraph_GraphBox.h");
    sub_1DCB43D1C(v7, "setParameter");
    sub_1DCB43D1C(v6, "DSPGraph parameters must have global scope and master element.");
    uint64_t result = DSPGraph::ThrowException();
    __break(1u);
  }
  else
  {
    int v4 = *(uint64_t (**)(void))(**(void **)(a1 + 896) + 40);
    return v4();
  }
  return result;
}

void sub_1DCB49678(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DCB496C4(uint64_t a1, uint64_t a2, int a3, int a4)
{
  if (a4 | a3)
  {
    sub_1DCB43D1C(v8, "/Library/Caches/com.apple.xbs/Sources/Listen/Framework/Internal/Core/DSPGraph/Boxes/DSPGraph_GraphBox.h");
    sub_1DCB43D1C(v7, "getParameter");
    sub_1DCB43D1C(v6, "DSPGraph parameters must have global scope and master element.");
    uint64_t result = DSPGraph::ThrowException();
    __break(1u);
  }
  else
  {
    int v4 = *(uint64_t (**)(void))(**(void **)(a1 + 896) + 48);
    return v4();
  }
  return result;
}

void sub_1DCB49774(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DCB497C0@<X0>(uint64_t result@<X0>, int a2@<W1>, void *a3@<X8>)
{
  if (!a2) {
    return MEMORY[0x1F410BC38](*(void *)(result + 896));
  }
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  return result;
}

double sub_1DCB497D8@<D0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 96) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(unsigned char *)(a1 + 104) = 1;
  return result;
}

uint64_t sub_1DCB497F8(DSPGraph::Graph **a1, int a2)
{
  uint64_t result = (uint64_t)a1[112];
  if (*(_DWORD *)(result + 688) != a2)
  {
    int v4 = *(unsigned __int8 *)(result + 762);
    if (*(unsigned char *)(result + 762))
    {
      DSPGraph::Graph::uninitialize((DSPGraph::Graph *)result);
      uint64_t result = (uint64_t)a1[112];
    }
    DSPGraph::Graph::unconfigure((DSPGraph::Graph *)result);
    unint64_t v5 = (DSPGraph::Box *)DSPGraph::Graph::in(a1[112]);
    DSPGraph::Box::sampleRate(v5);
    (*((void (**)(DSPGraph::Graph **))*a1 + 16))(a1);
    DSPGraph::Graph::setSliceDuration();
    uint64_t result = DSPGraph::Graph::configure(a1[112]);
    if (v4)
    {
      size_t v6 = a1[112];
      return DSPGraph::Graph::initialize(v6);
    }
  }
  return result;
}

DSPGraph::Graph *sub_1DCB498D0(uint64_t a1, int a2)
{
  uint64_t result = *(DSPGraph::Graph **)(a1 + 896);
  if ((((*((unsigned char *)result + 760) != 0) ^ a2) & 1) == 0)
  {
    int v4 = *((unsigned __int8 *)result + 762);
    if (*((unsigned char *)result + 762))
    {
      DSPGraph::Graph::uninitialize(result);
      uint64_t result = *(DSPGraph::Graph **)(a1 + 896);
    }
    DSPGraph::Graph::unconfigure(result);
    unint64_t v5 = (DSPGraph::Box *)DSPGraph::Graph::in(*(DSPGraph::Graph **)(a1 + 896));
    DSPGraph::Box::sampleRate(v5);
    DSPGraph::Graph::setSliceDuration();
    uint64_t result = (DSPGraph::Graph *)DSPGraph::Graph::configure(*(DSPGraph::Graph **)(a1 + 896));
    if (v4)
    {
      size_t v6 = *(DSPGraph::Graph **)(a1 + 896);
      return (DSPGraph::Graph *)DSPGraph::Graph::initialize(v6);
    }
  }
  return result;
}

BOOL sub_1DCB49984(uint64_t a1)
{
  return *(unsigned char *)(*(void *)(a1 + 896) + 760) == 0;
}

double sub_1DCB49998@<D0>(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 + 16) = 0;
  double result = *(double *)"xfuapraexoba";
  *(_OWORD *)a1 = *(_OWORD *)"xfuapraexoba";
  return result;
}

uint64_t sub_1DCB499B4(uint64_t a1)
{
  uint64_t v1 = a1;
  if (!DSPGraph::Graph::numOutputs(*(DSPGraph::Graph **)(a1 + 896))) {
    return 0;
  }
  unsigned int v2 = (DSPGraph::Box *)DSPGraph::Graph::in(*(DSPGraph::Graph **)(v1 + 896));
  int v3 = DSPGraph::Box::sampleRate(v2);
  int v4 = (DSPGraph::Box *)DSPGraph::Graph::out(*(DSPGraph::Graph **)(v1 + 896));
  if (v3 != DSPGraph::Box::sampleRate(v4)) {
    return v1;
  }
  uint64_t v5 = DSPGraph::Graph::in(*(DSPGraph::Graph **)(v1 + 896));
  uint64_t v6 = *(void *)(v5 + 88);
  if (*(void *)(v5 + 96) == v6)
  {
    uint64_t v11 = v5;
    sub_1DCB43D1C(v19, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(v18, "out");
    int v13 = (void *)(v11 + 32);
    if (*(char *)(v11 + 55) < 0) {
      int v13 = (void *)*v13;
    }
    DSPGraph::strprintf(v17, (DSPGraph *)"Box::out inIndex out of range! box %s has %zu outputs but input %u was requested", v12, v13, (uint64_t)(*(void *)(v11 + 96) - *(void *)(v11 + 88)) >> 5, 0);
    uint64_t result = DSPGraph::ThrowException();
  }
  else
  {
    int v7 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v6 + 40))(v6) + 120) + 40);
    uint64_t v8 = DSPGraph::Graph::out(*(DSPGraph::Graph **)(v1 + 896));
    uint64_t v9 = *(void *)(v8 + 64);
    if (*(void *)(v8 + 72) != v9)
    {
      if (v7 == *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v9 + 40))(v9) + 120) + 40)) {
        return 0;
      }
      return v1;
    }
    uint64_t v14 = v8;
    sub_1DCB43D1C(v19, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(v18, "in");
    BOOL v16 = (void *)(v14 + 32);
    if (*(char *)(v14 + 55) < 0) {
      BOOL v16 = (void *)*v16;
    }
    DSPGraph::strprintf(v17, (DSPGraph *)"Box::in inIndex out of range! box %s has %zu inputs but input %u was requested", v15, v16, (uint64_t)(*(void *)(v14 + 72) - *(void *)(v14 + 64)) >> 5, 0);
    uint64_t result = DSPGraph::ThrowException();
  }
  __break(1u);
  return result;
}

void sub_1DCB49BAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (*(char *)(v23 - 17) < 0) {
    operator delete(*(void **)(v23 - 40));
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DCB49C04(uint64_t a1)
{
  uint64_t v1 = a1;
  if (!DSPGraph::Graph::numOutputs(*(DSPGraph::Graph **)(a1 + 896))) {
    return 0;
  }
  unsigned int v2 = (DSPGraph::Box *)DSPGraph::Graph::in(*(DSPGraph::Graph **)(v1 + 896));
  int v3 = DSPGraph::Box::sampleRate(v2);
  int v4 = (DSPGraph::Box *)DSPGraph::Graph::out(*(DSPGraph::Graph **)(v1 + 896));
  if (v3 == DSPGraph::Box::sampleRate(v4)) {
    return 0;
  }
  return v1;
}

uint64_t sub_1DCB49C64()
{
  return 0;
}

BOOL sub_1DCB49C6C(uint64_t a1)
{
  return *(_DWORD *)(a1 + 776) == 0;
}

uint64_t sub_1DCB49C7C(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v3 = result;
    if ((*(unsigned int (**)(uint64_t))(*(void *)result + 64))(result))
    {
      uint64_t v4 = *(void *)(v3 + 64);
      if (*(void *)(v3 + 72) == v4)
      {
        sub_1DCB43D1C(v26, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
        sub_1DCB43D1C(v25, "in");
        unsigned int v20 = (void *)(v3 + 32);
        if (*(char *)(v3 + 55) < 0) {
          unsigned int v20 = (void *)*v20;
        }
        DSPGraph::strprintf(v24, (DSPGraph *)"Box::in inIndex out of range! box %s has %zu inputs but input %u was requested", v19, v20, (uint64_t)(*(void *)(v3 + 72) - *(void *)(v3 + 64)) >> 5, 0);
        uint64_t result = DSPGraph::ThrowException();
        goto LABEL_31;
      }
      uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4);
      uint64_t v6 = *(void *)(v3 + 88);
      if (*(void *)(v3 + 96) == v6)
      {
        sub_1DCB43D1C(v26, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
        sub_1DCB43D1C(v25, "out");
        int v22 = (void *)(v3 + 32);
        if (*(char *)(v3 + 55) < 0) {
          int v22 = (void *)*v22;
        }
        DSPGraph::strprintf(v24, (DSPGraph *)"Box::out inIndex out of range! box %s has %zu outputs but input %u was requested", v21, v22, (uint64_t)(*(void *)(v3 + 96) - *(void *)(v3 + 88)) >> 5, 0);
        uint64_t result = DSPGraph::ThrowException();
        goto LABEL_31;
      }
      int v7 = *(DSPGraph::Buffer **)(v5 + 56);
      uint64_t v8 = (*(uint64_t (**)(uint64_t))(*(void *)v6 + 40))(v6);
      if (*(DSPGraph::Buffer **)(v8 + 56) != v7)
      {
        DSPGraph::Buffer::copyFrom(*(DSPGraph::Buffer **)(v8 + 56), v7);
        DSPGraph::Buffer::copyTimeFrom();
      }
      sub_1DCB4AA40(v3, a2);
      uint64_t v9 = *(void *)(v3 + 912);
      if (*(void *)(v3 + 920) == v9) {
        goto LABEL_20;
      }
      *(_DWORD *)(v3 + 1020) = (int)*(double *)(v9 + 8);
      if (*(void *)(v3 + 944) == *(void *)(v3 + 936)) {
        goto LABEL_20;
      }
      uint64_t result = DSPGraph::Graph::processInPlace();
    }
    else
    {
      sub_1DCB4AA40(v3, a2);
      uint64_t v10 = *(void *)(v3 + 912);
      if (*(void *)(v3 + 920) == v10) {
        goto LABEL_20;
      }
      *(_DWORD *)(v3 + 1020) = (int)*(double *)(v10 + 8);
      uint64_t result = DSPGraph::Graph::processMultiple();
    }
    *(_DWORD *)(v3 + 1020) += a2;
    if (*(void *)(v3 + 944) == *(void *)(v3 + 936)) {
      return result;
    }
    DSPGraph::SimpleABL::SimpleABL((DSPGraph::SimpleABL *)v23, (AudioBufferList *)(*(void *)(v3 + 960) + 24));
    unsigned int v12 = *(_DWORD **)(v3 + 936);
    if (*(_DWORD **)(v3 + 944) == v12) {
      sub_1DCB4B220();
    }
    uint64_t v13 = *(void *)(v3 + 88);
    if (*(void *)(v3 + 96) != v13)
    {
      LODWORD(v11) = *v12;
      double v14 = (double)v11;
      LODWORD(v15) = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v13 + 40))(v13) + 120)
                               + 20);
      if (vabdd_f64(floor(v14 / (double)v15), v14 / (double)v15) >= 0.001) {
        __assert_rtn("process", "DSPGraph_GraphBox.h", 348, "isIntegral(numPacketsToWrite)");
      }
      DSPGraph::RingBuffer::write();
      DSPGraph::SimpleABL::~SimpleABL((DSPGraph::SimpleABL *)v23);
      uint64_t v16 = *(void *)(v3 + 936);
      if (*(void *)(v3 + 944) != v16) {
        return DSPGraph::Box::propagateFlagsAndTimeStamp((DSPGraph::Box *)v3, *(unsigned int *)(v16 + 4), (const AudioTimeStamp *)(v16 + 8));
      }
LABEL_20:
      sub_1DCB4B220();
    }
    sub_1DCB43D1C(v26, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(v25, "out");
    BOOL v18 = (void *)(v3 + 32);
    if (*(char *)(v3 + 55) < 0) {
      BOOL v18 = (void *)*v18;
    }
    DSPGraph::strprintf(v24, (DSPGraph *)"Box::out inIndex out of range! box %s has %zu outputs but input %u was requested", v17, v18, (uint64_t)(*(void *)(v3 + 96) - *(void *)(v3 + 88)) >> 5, 0);
    uint64_t result = DSPGraph::ThrowException();
LABEL_31:
    __break(1u);
  }
  return result;
}

void sub_1DCB4A048(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  if (a25 < 0) {
    operator delete(a20);
  }
  if (*(char *)(v25 - 49) < 0) {
    operator delete(*(void **)(v25 - 72));
  }
  DSPGraph::SimpleABL::~SimpleABL((DSPGraph::SimpleABL *)&a12);
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB4A0F8(uint64_t a1)
{
  DSPGraph::RingBufferBox::initialize((DSPGraph::RingBufferBox *)a1);
  if (!DSPGraph::Graph::numOutputs(*(DSPGraph::Graph **)(a1 + 896))) {
    return DSPGraph::Graph::initialize(*(DSPGraph::Graph **)(a1 + 896));
  }
  uint64_t v2 = DSPGraph::Graph::out(*(DSPGraph::Graph **)(a1 + 896));
  uint64_t v3 = *(void *)(v2 + 64);
  if (*(void *)(v2 + 72) == v3)
  {
    uint64_t v21 = v2;
    sub_1DCB43D1C(&v27, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(v32, "in");
    uint64_t v23 = (void *)(v21 + 32);
    if (*(char *)(v21 + 55) < 0) {
      uint64_t v23 = (void *)*v23;
    }
    DSPGraph::strprintf(v31, (DSPGraph *)"Box::in inIndex out of range! box %s has %zu inputs but input %u was requested", v22, v23, (uint64_t)(*(void *)(v21 + 72) - *(void *)(v21 + 64)) >> 5, 0);
    uint64_t result = DSPGraph::ThrowException();
  }
  else
  {
    uint64_t v4 = *(long long **)((*(uint64_t (**)(uint64_t))(*(void *)v3 + 40))(v3) + 120);
    uint64_t v5 = *((void *)v4 + 4);
    long long v6 = v4[1];
    long long v27 = *v4;
    long long v28 = v6;
    uint64_t v29 = v5;
    int v7 = sub_1DCB4B2C8((uint64_t)"", (uint64_t)&v27);
    v32[0] = 0;
    uint64_t v8 = *(void **)(a1 + 960);
    *(void *)(a1 + 960) = v7;
    if (v8)
    {
      sub_1DCB4A8D8(a1 + 960, v8);
      uint64_t v9 = (void *)v32[0];
      v32[0] = 0;
      if (v9) {
        sub_1DCB4A8D8((int)v32, v9);
      }
    }
    uint64_t v10 = DSPGraph::Graph::out(*(DSPGraph::Graph **)(a1 + 896));
    uint64_t v11 = *(void *)(v10 + 64);
    if (*(void *)(v10 + 72) == v11)
    {
      uint64_t v24 = v10;
      sub_1DCB43D1C(v32, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
      sub_1DCB43D1C(v31, "in");
      unsigned int v26 = (void *)(v24 + 32);
      if (*(char *)(v24 + 55) < 0) {
        unsigned int v26 = (void *)*v26;
      }
    }
    else
    {
      uint64_t v12 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v11 + 40))(v11) + 120);
      int v13 = *(_DWORD *)(v12 + 8);
      BOOL v14 = v13 == 1718773105 || v13 == 1819304813;
      if (!v14 && *(_DWORD *)(v12 + 16))
      {
        int v18 = v28;
        goto LABEL_16;
      }
      uint64_t v15 = DSPGraph::Graph::out(*(DSPGraph::Graph **)(a1 + 896));
      uint64_t v16 = *(void *)(v15 + 64);
      if (*(void *)(v15 + 72) != v16)
      {
        uint64_t v17 = (*(uint64_t (**)(uint64_t))(*(void *)v16 + 40))(v16);
        int v18 = DWORD2(v28) * *(_DWORD *)(*(void *)(v17 + 120) + 40);
LABEL_16:
        uint64_t v19 = DSPGraph::Graph::out(*(DSPGraph::Graph **)(a1 + 896));
        sub_1DCB4EED8(*(void *)(a1 + 960), *(_DWORD *)(*(void *)(v19 + 16) + 276) * v18);
        return DSPGraph::Graph::initialize(*(DSPGraph::Graph **)(a1 + 896));
      }
      uint64_t v24 = v15;
      sub_1DCB43D1C(v32, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
      sub_1DCB43D1C(v31, "in");
      unsigned int v26 = (void *)(v24 + 32);
      if (*(char *)(v24 + 55) < 0) {
        unsigned int v26 = (void *)*v26;
      }
    }
    DSPGraph::strprintf(v30, (DSPGraph *)"Box::in inIndex out of range! box %s has %zu inputs but input %u was requested", v25, v26, (uint64_t)(*(void *)(v24 + 72) - *(void *)(v24 + 64)) >> 5, 0);
    uint64_t result = DSPGraph::ThrowException();
  }
  __break(1u);
  return result;
}

void sub_1DCB4A424(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a26 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v26 - 41) < 0) {
    operator delete(*(void **)(v26 - 64));
  }
  if (*(char *)(v26 - 17) < 0) {
    operator delete(*(void **)(v26 - 40));
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DCB4A4C0(uint64_t a1)
{
  uint64_t result = DSPGraph::RingBufferBox::uninitialize((DSPGraph::RingBufferBox *)a1);
  if (!*(unsigned char *)(a1 + 1016))
  {
    uint64_t v3 = *(DSPGraph::Graph **)(a1 + 896);
    return DSPGraph::Graph::uninitialize(v3);
  }
  return result;
}

uint64_t sub_1DCB4A50C(DSPGraph::RingBufferBox *a1)
{
  DSPGraph::RingBufferBox::reset(a1);
  uint64_t v2 = (DSPGraph::Graph *)*((void *)a1 + 112);

  return DSPGraph::Graph::reset(v2);
}

uint64_t sub_1DCB4A544()
{
  return 0;
}

uint64_t sub_1DCB4A54C(uint64_t a1)
{
  uint64_t v3 = a1 + 88;
  uint64_t v2 = *(void *)(a1 + 88);
  if (*(void *)(v3 + 8) != v2) {
    return *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2) + 120) + 28);
  }
  sub_1DCB43D1C(v9, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
  sub_1DCB43D1C(v8, "out");
  long long v6 = (void *)(a1 + 32);
  if (*(char *)(a1 + 55) < 0) {
    long long v6 = (void *)*v6;
  }
  DSPGraph::strprintf(v7, (DSPGraph *)"Box::out inIndex out of range! box %s has %zu outputs but input %u was requested", v5, v6, (uint64_t)(*(void *)(a1 + 96) - *(void *)(a1 + 88)) >> 5, 0);
  uint64_t result = DSPGraph::ThrowException();
  __break(1u);
  return result;
}

void sub_1DCB4A620(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (*(char *)(v23 - 17) < 0) {
    operator delete(*(void **)(v23 - 40));
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DCB4A66C(uint64_t a1)
{
  uint64_t v3 = a1 + 88;
  uint64_t v2 = *(void *)(a1 + 88);
  if (*(void *)(v3 + 8) != v2) {
    return *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2) + 120) + 16);
  }
  sub_1DCB43D1C(v9, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
  sub_1DCB43D1C(v8, "out");
  long long v6 = (void *)(a1 + 32);
  if (*(char *)(a1 + 55) < 0) {
    long long v6 = (void *)*v6;
  }
  DSPGraph::strprintf(v7, (DSPGraph *)"Box::out inIndex out of range! box %s has %zu outputs but input %u was requested", v5, v6, (uint64_t)(*(void *)(a1 + 96) - *(void *)(a1 + 88)) >> 5, 0);
  uint64_t result = DSPGraph::ThrowException();
  __break(1u);
  return result;
}

void sub_1DCB4A740(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (*(char *)(v23 - 17) < 0) {
    operator delete(*(void **)(v23 - 40));
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DCB4A794(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F410BA18](a1, a2, 0);
}

uint64_t sub_1DCB4A79C()
{
  return 1;
}

uint64_t sub_1DCB4A7A4()
{
  return 0;
}

uint64_t sub_1DCB4A7AC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 896);
  uint64_t result = v1 + 408;
  if (*(char *)(v1 + 431) < 0) {
    return *(void *)result;
  }
  return result;
}

uint64_t sub_1DCB4A7C8(uint64_t a1)
{
  return *(void *)(a1 + 896);
}

uint64_t sub_1DCB4A7D0(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

void *sub_1DCB4A7D8(void *a1, uint64_t a2, _OWORD *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    uint64_t v5 = 5 * a2;
    uint64_t v6 = 80 * a2;
    int v7 = operator new(80 * a2);
    *a1 = v7;
    a1[1] = v7;
    uint64_t v8 = &v7[v5];
    a1[2] = v8;
    do
    {
      long long v9 = a3[3];
      v7[2] = a3[2];
      uint64_t v7[3] = v9;
      v7[4] = a3[4];
      long long v10 = a3[1];
      *int v7 = *a3;
      v7[1] = v10;
      v7 += 5;
      v6 -= 80;
    }
    while (v6);
    a1[1] = v8;
  }
  return a1;
}

void sub_1DCB4A854(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    uint64_t v5 = v2;
    if (v4 != v2)
    {
      do
        DSPGraph::SimpleABL::~SimpleABL((DSPGraph::SimpleABL *)(v4 - 16));
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_1DCB4A8D8(int a1, void *__p)
{
  if (__p)
  {
    uint64_t v3 = __p[1];
    if (v3) {
      MEMORY[0x1E01A8C30](v3, 0x1000C8077774924);
    }
    operator delete(__p);
  }
}

void sub_1DCB4A930(uint64_t a1)
{
  *(void *)a1 = &unk_1F37F7358;
  *(void *)(a1 + 888) = &unk_1F37F7648;
  if (!*(unsigned char *)(a1 + 1016)) {
    DSPGraph::Graph::uninitialize(*(DSPGraph::Graph **)(a1 + 896));
  }
  uint64_t v2 = *(void **)(a1 + 992);
  if (v2)
  {
    *(void *)(a1 + 1000) = v2;
    operator delete(v2);
  }
  int v7 = (void **)(a1 + 968);
  sub_1DCB4A854(&v7);
  uint64_t v3 = *(void **)(a1 + 960);
  *(void *)(a1 + 960) = 0;
  if (v3) {
    sub_1DCB4A8D8(a1 + 960, v3);
  }
  uint64_t v4 = *(void **)(a1 + 936);
  if (v4)
  {
    *(void *)(a1 + 944) = v4;
    operator delete(v4);
  }
  uint64_t v5 = *(void **)(a1 + 912);
  if (v5)
  {
    *(void *)(a1 + 920) = v5;
    operator delete(v5);
  }
  uint64_t v6 = *(std::__shared_weak_count **)(a1 + 904);
  if (v6) {
    sub_1DCB44254(v6);
  }
  *(void *)a1 = MEMORY[0x1E4F4EAF0] + 16;
  DSPGraph::RingBuffer::~RingBuffer((DSPGraph::RingBuffer *)(a1 + 808));

  DSPGraph::Box::~Box((DSPGraph::Box *)a1);
}

uint64_t sub_1DCB4AA40(uint64_t a1, int a2)
{
  if (DSPGraph::Graph::numInputs(*(DSPGraph::Graph **)(a1 + 896)))
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = *(void *)(a1 + 64);
      if (v6 >= (*(void *)(a1 + 72) - v7) >> 5) {
        break;
      }
      uint64_t v8 = *(void *)((*(uint64_t (**)(void))(*(void *)(v7 + v5) + 40))() + 56);
      uint64_t v9 = *(void *)(v8 + 80);
      *(void *)(v8 + 8) = *(void *)(*(void *)(a1 + 16) + 256);
      int v10 = *(_DWORD *)(v8 + 72);
      long long v45 = *(_OWORD *)(v8 + 8);
      long long v46 = *(_OWORD *)(v8 + 24);
      long long v47 = *(_OWORD *)(v8 + 40);
      long long v48 = *(_OWORD *)(v8 + 56);
      uint64_t v11 = *(void *)(a1 + 912);
      if (0xCCCCCCCCCCCCCCCDLL * ((*(void *)(a1 + 920) - v11) >> 4) <= v6) {
        goto LABEL_37;
      }
      uint64_t v12 = v11 + v4;
      *(_DWORD *)uint64_t v12 = a2;
      *(_DWORD *)(v12 + 4) = v10;
      *(_OWORD *)(v12 + 8) = v45;
      *(_OWORD *)(v12 + 24) = v46;
      *(_OWORD *)(v12 + 40) = v47;
      *(_OWORD *)(v12 + 56) = v48;
      *(void *)(v12 + 72) = v9;
      ++v6;
      v5 += 32;
      v4 += 80;
      if (v6 >= DSPGraph::Graph::numInputs(*(DSPGraph::Graph **)(a1 + 896))) {
        goto LABEL_6;
      }
    }
    sub_1DCB43D1C(&v45, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(v50, "in");
    uint64_t v44 = (void *)(a1 + 32);
    if (*(char *)(a1 + 55) < 0) {
      uint64_t v44 = (void *)*v44;
    }
    DSPGraph::strprintf(v49, (DSPGraph *)"Box::in inIndex out of range! box %s has %zu inputs but input %u was requested", v43, v44, (uint64_t)(*(void *)(a1 + 72) - *(void *)(a1 + 64)) >> 5, v6);
    uint64_t result = DSPGraph::ThrowException();
    goto LABEL_56;
  }
LABEL_6:
  int v13 = (DSPGraph::Box *)DSPGraph::Graph::in(*(DSPGraph::Graph **)(a1 + 896));
  DSPGraph::Box::sampleRate(v13);
  DSPGraph::Graph::preflight();
  BOOL v14 = *(_DWORD **)(a1 + 912);
  if (*(_DWORD **)(a1 + 920) == v14) {
LABEL_37:
  }
    sub_1DCB4B220();
  if (*v14 != a2) {
    __assert_rtn("prepareGraphIOData", "DSPGraph_GraphBox.h", 279, "mGraphIODataIn.at(0).mNumFrames == inNumFrames");
  }
  uint64_t result = DSPGraph::Graph::numOutputs(*(DSPGraph::Graph **)(a1 + 896));
  if (result)
  {
    unsigned int v16 = 0;
    while (1)
    {
      uint64_t v17 = *(void *)(a1 + 88);
      if (v16 >= (unint64_t)((*(void *)(a1 + 96) - v17) >> 5))
      {
        sub_1DCB43D1C(&v45, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
        sub_1DCB43D1C(v50, "out");
        uint64_t v42 = (void *)(a1 + 32);
        if (*(char *)(a1 + 55) < 0) {
          uint64_t v42 = (void *)*v42;
        }
        goto LABEL_55;
      }
      int v18 = *(_DWORD **)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)(v17 + 32 * v16) + 40))(v17 + 32 * v16)
                                   + 56)
                       + 80);
      if (*v18) {
        break;
      }
LABEL_31:
      uint64_t v40 = *(void *)(a1 + 936);
      if (0xCCCCCCCCCCCCCCCDLL * ((*(void *)(a1 + 944) - v40) >> 4) <= v16) {
        goto LABEL_37;
      }
      *(void *)(v40 + 80 * v16++ + 72) = *(void *)(a1 + 960) + 24;
      uint64_t result = DSPGraph::Graph::numOutputs(*(DSPGraph::Graph **)(a1 + 896));
      if (v16 >= result) {
        return result;
      }
    }
    unint64_t v19 = 0;
    uint64_t v20 = 36;
    while (1)
    {
      uint64_t v21 = *(void *)(a1 + 88);
      if (v16 >= (unint64_t)((*(void *)(a1 + 96) - v21) >> 5)) {
        break;
      }
      uint64_t v22 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)(v21 + 32 * v16) + 40))(v21 + 32 * v16)
                      + 120);
      int v24 = *(_DWORD *)(v22 + 8);
      BOOL v25 = v24 == 1718773105 || v24 == 1819304813;
      if (v25 || !*(_DWORD *)(v22 + 16))
      {
        uint64_t v26 = *(void *)(a1 + 88);
        if (v16 >= (unint64_t)((*(void *)(a1 + 96) - v26) >> 5))
        {
          sub_1DCB43D1C(&v45, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
          sub_1DCB43D1C(v50, "out");
          uint64_t v42 = (void *)(a1 + 32);
          if (*(char *)(a1 + 55) < 0) {
            uint64_t v42 = (void *)*v42;
          }
          goto LABEL_55;
        }
        uint64_t v27 = (*(uint64_t (**)(uint64_t))(*(void *)(v26 + 32 * v16) + 40))(v26 + 32 * v16);
        uint64_t v28 = *(void *)(a1 + 936);
        if (0xCCCCCCCCCCCCCCCDLL * ((*(void *)(a1 + 944) - v28) >> 4) <= v16) {
          goto LABEL_37;
        }
        unsigned int v29 = *(_DWORD *)(v28 + 80 * v16) * *(_DWORD *)(*(void *)(v27 + 120) + 24);
        uint64_t v30 = *(void *)(a1 + 960);
        if (v29 > *(_DWORD *)(v30 + 16)) {
          __assert_rtn("prepareGraphIOData", "DSPGraph_GraphBox.h", 305, "outNumBytes <= mOutBufferList->GetCapacityBytes()");
        }
      }
      else
      {
        unsigned int v31 = *(_DWORD **)(a1 + 936);
        if (*(_DWORD **)(a1 + 944) == v31) {
          goto LABEL_37;
        }
        uint64_t v32 = *(void *)(a1 + 88);
        if (v16 >= (unint64_t)((*(void *)(a1 + 96) - v32) >> 5))
        {
          sub_1DCB43D1C(&v45, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
          sub_1DCB43D1C(v50, "out");
          uint64_t v42 = (void *)(a1 + 32);
          if (*(char *)(a1 + 55) < 0) {
            uint64_t v42 = (void *)*v42;
          }
          goto LABEL_55;
        }
        LODWORD(v23) = *v31;
        double v33 = (double)v23;
        LODWORD(v34) = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)(v32 + 32 * v16) + 40))(v32 + 32 * v16)
                                             + 120)
                                 + 20);
        double v35 = v33 / (double)v34;
        if (vabdd_f64(floor(v35), v35) >= 0.001) {
          __assert_rtn("prepareGraphIOData", "DSPGraph_GraphBox.h", 288, "isIntegral(numPacketsOut)");
        }
        uint64_t v36 = *(void *)(a1 + 88);
        if (v16 >= (unint64_t)((*(void *)(a1 + 96) - v36) >> 5))
        {
          sub_1DCB43D1C(&v45, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
          sub_1DCB43D1C(v50, "out");
          uint64_t v42 = (void *)(a1 + 32);
          if (*(char *)(a1 + 55) < 0) {
            uint64_t v42 = (void *)*v42;
          }
          goto LABEL_55;
        }
        LODWORD(v37) = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)(v36 + 32 * v16) + 40))(v36 + 32 * v16)
                                             + 120)
                                 + 16);
        double v38 = v35 * (double)v37;
        uint64_t v30 = *(void *)(a1 + 960);
        LODWORD(v39) = *(_DWORD *)(v30 + 16);
        if (v38 > (double)v39) {
          __assert_rtn("prepareGraphIOData", "DSPGraph_GraphBox.h", 294, "outNumBytes <= mOutBufferList->GetCapacityBytes()");
        }
        unsigned int v29 = v38;
      }
      *(_DWORD *)(v30 + v20) = v29;
      ++v19;
      v20 += 16;
      if (v19 >= *v18) {
        goto LABEL_31;
      }
    }
    sub_1DCB43D1C(&v45, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(v50, "out");
    uint64_t v42 = (void *)(a1 + 32);
    if (*(char *)(a1 + 55) < 0) {
      uint64_t v42 = (void *)*v42;
    }
LABEL_55:
    DSPGraph::strprintf(v49, (DSPGraph *)"Box::out inIndex out of range! box %s has %zu outputs but input %u was requested", v41, v42, (uint64_t)(*(void *)(a1 + 96) - *(void *)(a1 + 88)) >> 5, v16);
    uint64_t result = DSPGraph::ThrowException();
LABEL_56:
    __break(1u);
  }
  return result;
}

void sub_1DCB4B198(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35)
{
  if (a29 < 0) {
    operator delete(__p);
  }
  if (a35 < 0) {
    operator delete(a30);
  }
  if (a18 < 0) {
    operator delete(a13);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DCB4B220()
{
}

void sub_1DCB4B238(const char *a1)
{
  exceptiouint64_t n = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1DCB4B294(exception, a1);
  __cxa_throw(exception, (struct type_info *)&unk_1F37F61B8, MEMORY[0x1E4FBA1D0]);
}

void sub_1DCB4B280(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_1DCB4B294(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D8] + 16);
  return result;
}

void *sub_1DCB4B2C8(uint64_t a1, uint64_t a2)
{
  int v3 = *(_DWORD *)(a2 + 12);
  if ((v3 & 0x20) != 0) {
    unsigned int v4 = *(_DWORD *)(a2 + 28);
  }
  else {
    unsigned int v4 = 1;
  }
  if ((v3 & 0x20) != 0) {
    int v5 = 1;
  }
  else {
    int v5 = *(_DWORD *)(a2 + 28);
  }
  uint64_t result = operator new(16 * v4 + 32);
  *uint64_t result = a1;
  result[1] = 0;
  *((_DWORD *)result + 4) = 0;
  *((_DWORD *)result + 6) = v4;
  if (v4)
  {
    uint64_t v7 = (char *)(result + 4);
    do
    {
      *(_DWORD *)uint64_t v7 = v5;
      *((_DWORD *)v7 + 1) = 0;
      *((void *)v7 + 1) = 0;
      v7 += 16;
      --v4;
    }
    while (v4);
  }
  return result;
}

void sub_1DCB4B33C(uint64_t a1)
{
  sub_1DCB4BF50(a1);

  JUMPOUT(0x1E01A8C50);
}

const char *sub_1DCB4B374()
{
  return "SingleRateGraphBox";
}

uint64_t sub_1DCB4B380(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result = DSPGraph::Box::print();
  if (a3 >= 2)
  {
    DSPGraph::printi();
    unint64_t v6 = *(uint64_t (**)(void))(**(void **)(a1 + 784) + 24);
    return v6();
  }
  return result;
}

unint64_t sub_1DCB4B43C(uint64_t a1)
{
  if (DSPGraph::Graph::numOutputs(*(DSPGraph::Graph **)(a1 + 784)))
  {
    unsigned int v2 = 0;
    unint64_t v3 = 0;
    do
    {
      unsigned int v4 = (DSPGraph::Box *)DSPGraph::Graph::out(*(DSPGraph::Graph **)(a1 + 784));
      unint64_t v5 = DSPGraph::Box::totalLatencyInTicks(v4);
      if (v3 <= v5) {
        unint64_t v3 = v5;
      }
      ++v2;
    }
    while (v2 < DSPGraph::Graph::numOutputs(*(DSPGraph::Graph **)(a1 + 784)));
  }
  else
  {
    unint64_t v3 = 0;
  }
  return *(void *)(*(void *)(a1 + 8) + 696) * v3 / *(void *)(*(void *)(a1 + 784) + 696);
}

uint64_t sub_1DCB4B4C4(uint64_t a1, uint64_t a2, int a3, int a4)
{
  if (a4 | a3)
  {
    sub_1DCB43D1C(v8, "/Library/Caches/com.apple.xbs/Sources/Listen/Framework/Internal/Core/DSPGraph/Boxes/DSPGraph_GraphBox.h");
    sub_1DCB43D1C(v7, "setParameter");
    sub_1DCB43D1C(v6, "DSPGraph parameters must have global scope and master element.");
    uint64_t result = DSPGraph::ThrowException();
    __break(1u);
  }
  else
  {
    unsigned int v4 = *(uint64_t (**)(void))(**(void **)(a1 + 784) + 40);
    return v4();
  }
  return result;
}

void sub_1DCB4B574(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DCB4B5C0(uint64_t a1, uint64_t a2, int a3, int a4)
{
  if (a4 | a3)
  {
    sub_1DCB43D1C(v8, "/Library/Caches/com.apple.xbs/Sources/Listen/Framework/Internal/Core/DSPGraph/Boxes/DSPGraph_GraphBox.h");
    sub_1DCB43D1C(v7, "getParameter");
    sub_1DCB43D1C(v6, "DSPGraph parameters must have global scope and master element.");
    uint64_t result = DSPGraph::ThrowException();
    __break(1u);
  }
  else
  {
    unsigned int v4 = *(uint64_t (**)(void))(**(void **)(a1 + 784) + 48);
    return v4();
  }
  return result;
}

void sub_1DCB4B670(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DCB4B6BC@<X0>(uint64_t result@<X0>, int a2@<W1>, void *a3@<X8>)
{
  if (!a2) {
    return MEMORY[0x1F410BC38](*(void *)(result + 784));
  }
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  return result;
}

double sub_1DCB4B6D4@<D0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 96) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(unsigned char *)(a1 + 104) = 1;
  return result;
}

uint64_t sub_1DCB4B6F4(DSPGraph::Graph **a1, int a2)
{
  uint64_t result = (uint64_t)a1[98];
  if (*(_DWORD *)(result + 688) != a2)
  {
    int v4 = *(unsigned __int8 *)(result + 762);
    if (*(unsigned char *)(result + 762))
    {
      DSPGraph::Graph::uninitialize((DSPGraph::Graph *)result);
      uint64_t result = (uint64_t)a1[98];
    }
    DSPGraph::Graph::unconfigure((DSPGraph::Graph *)result);
    unint64_t v5 = (DSPGraph::Box *)DSPGraph::Graph::in(a1[98]);
    DSPGraph::Box::sampleRate(v5);
    (*((void (**)(DSPGraph::Graph **))*a1 + 16))(a1);
    DSPGraph::Graph::setSliceDuration();
    uint64_t result = DSPGraph::Graph::configure(a1[98]);
    if (v4)
    {
      unint64_t v6 = a1[98];
      return DSPGraph::Graph::initialize(v6);
    }
  }
  return result;
}

DSPGraph::Graph *sub_1DCB4B7CC(uint64_t a1, int a2)
{
  uint64_t result = *(DSPGraph::Graph **)(a1 + 784);
  if ((((*((unsigned char *)result + 760) != 0) ^ a2) & 1) == 0)
  {
    int v4 = *((unsigned __int8 *)result + 762);
    if (*((unsigned char *)result + 762))
    {
      DSPGraph::Graph::uninitialize(result);
      uint64_t result = *(DSPGraph::Graph **)(a1 + 784);
    }
    DSPGraph::Graph::unconfigure(result);
    unint64_t v5 = (DSPGraph::Box *)DSPGraph::Graph::in(*(DSPGraph::Graph **)(a1 + 784));
    DSPGraph::Box::sampleRate(v5);
    DSPGraph::Graph::setSliceDuration();
    uint64_t result = (DSPGraph::Graph *)DSPGraph::Graph::configure(*(DSPGraph::Graph **)(a1 + 784));
    if (v4)
    {
      unint64_t v6 = *(DSPGraph::Graph **)(a1 + 784);
      return (DSPGraph::Graph *)DSPGraph::Graph::initialize(v6);
    }
  }
  return result;
}

BOOL sub_1DCB4B880(uint64_t a1)
{
  return *(unsigned char *)(*(void *)(a1 + 784) + 760) == 0;
}

double sub_1DCB4B894@<D0>(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 + 16) = 0;
  double result = *(double *)"xfuapraexoba";
  *(_OWORD *)a1 = *(_OWORD *)"xfuapraexoba";
  return result;
}

uint64_t sub_1DCB4B8AC(uint64_t a1)
{
  uint64_t v1 = a1;
  if (!DSPGraph::Graph::numOutputs(*(DSPGraph::Graph **)(a1 + 784))) {
    return 0;
  }
  unsigned int v2 = (DSPGraph::Box *)DSPGraph::Graph::in(*(DSPGraph::Graph **)(v1 + 784));
  int v3 = DSPGraph::Box::sampleRate(v2);
  int v4 = (DSPGraph::Box *)DSPGraph::Graph::out(*(DSPGraph::Graph **)(v1 + 784));
  if (v3 != DSPGraph::Box::sampleRate(v4)) {
    return v1;
  }
  uint64_t v5 = DSPGraph::Graph::in(*(DSPGraph::Graph **)(v1 + 784));
  uint64_t v6 = *(void *)(v5 + 88);
  if (*(void *)(v5 + 96) == v6)
  {
    uint64_t v11 = v5;
    sub_1DCB43D1C(v19, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(v18, "out");
    int v13 = (void *)(v11 + 32);
    if (*(char *)(v11 + 55) < 0) {
      int v13 = (void *)*v13;
    }
    DSPGraph::strprintf(v17, (DSPGraph *)"Box::out inIndex out of range! box %s has %zu outputs but input %u was requested", v12, v13, (uint64_t)(*(void *)(v11 + 96) - *(void *)(v11 + 88)) >> 5, 0);
    uint64_t result = DSPGraph::ThrowException();
  }
  else
  {
    int v7 = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v6 + 40))(v6) + 120) + 40);
    uint64_t v8 = DSPGraph::Graph::out(*(DSPGraph::Graph **)(v1 + 784));
    uint64_t v9 = *(void *)(v8 + 64);
    if (*(void *)(v8 + 72) != v9)
    {
      if (v7 == *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v9 + 40))(v9) + 120) + 40)) {
        return 0;
      }
      return v1;
    }
    uint64_t v14 = v8;
    sub_1DCB43D1C(v19, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(v18, "in");
    unsigned int v16 = (void *)(v14 + 32);
    if (*(char *)(v14 + 55) < 0) {
      unsigned int v16 = (void *)*v16;
    }
    DSPGraph::strprintf(v17, (DSPGraph *)"Box::in inIndex out of range! box %s has %zu inputs but input %u was requested", v15, v16, (uint64_t)(*(void *)(v14 + 72) - *(void *)(v14 + 64)) >> 5, 0);
    uint64_t result = DSPGraph::ThrowException();
  }
  __break(1u);
  return result;
}

void sub_1DCB4BAA4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (*(char *)(v23 - 17) < 0) {
    operator delete(*(void **)(v23 - 40));
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DCB4BAFC(uint64_t a1)
{
  uint64_t v1 = a1;
  if (!DSPGraph::Graph::numOutputs(*(DSPGraph::Graph **)(a1 + 784))) {
    return 0;
  }
  unsigned int v2 = (DSPGraph::Box *)DSPGraph::Graph::in(*(DSPGraph::Graph **)(v1 + 784));
  int v3 = DSPGraph::Box::sampleRate(v2);
  int v4 = (DSPGraph::Box *)DSPGraph::Graph::out(*(DSPGraph::Graph **)(v1 + 784));
  if (v3 == DSPGraph::Box::sampleRate(v4)) {
    return 0;
  }
  return v1;
}

uint64_t sub_1DCB4BB5C()
{
  return 0;
}

uint64_t sub_1DCB4BB64(uint64_t result, int a2)
{
  if (!a2) {
    return result;
  }
  uint64_t v3 = result;
  if ((*(unsigned int (**)(uint64_t))(*(void *)result + 64))(result))
  {
    uint64_t v4 = *(void *)(v3 + 64);
    if (*(void *)(v3 + 72) == v4)
    {
      sub_1DCB43D1C(v19, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
      sub_1DCB43D1C(v18, "in");
      uint64_t v14 = (void *)(v3 + 32);
      if (*(char *)(v3 + 55) < 0) {
        uint64_t v14 = (void *)*v14;
      }
      DSPGraph::strprintf(v17, (DSPGraph *)"Box::in inIndex out of range! box %s has %zu inputs but input %u was requested", v13, v14, (uint64_t)(*(void *)(v3 + 72) - *(void *)(v3 + 64)) >> 5, 0);
      uint64_t result = DSPGraph::ThrowException();
    }
    else
    {
      uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4);
      uint64_t v6 = *(void *)(v3 + 88);
      if (*(void *)(v3 + 96) != v6)
      {
        int v7 = *(DSPGraph::Buffer **)(v5 + 56);
        uint64_t v8 = (*(uint64_t (**)(uint64_t))(*(void *)v6 + 40))(v6);
        if (*(DSPGraph::Buffer **)(v8 + 56) != v7)
        {
          DSPGraph::Buffer::copyFrom(*(DSPGraph::Buffer **)(v8 + 56), v7);
          DSPGraph::Buffer::copyTimeFrom();
        }
        sub_1DCB4C03C(v3, a2);
        uint64_t v9 = *(void *)(v3 + 800);
        if (*(void *)(v3 + 808) != v9)
        {
          *(_DWORD *)(v3 + 908) = (int)*(double *)(v9 + 8);
          if (*(void *)(v3 + 832) != *(void *)(v3 + 824))
          {
            uint64_t result = DSPGraph::Graph::processInPlace();
            goto LABEL_12;
          }
        }
LABEL_17:
        sub_1DCB4B220();
      }
      sub_1DCB43D1C(v19, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
      sub_1DCB43D1C(v18, "out");
      unsigned int v16 = (void *)(v3 + 32);
      if (*(char *)(v3 + 55) < 0) {
        unsigned int v16 = (void *)*v16;
      }
      DSPGraph::strprintf(v17, (DSPGraph *)"Box::out inIndex out of range! box %s has %zu outputs but input %u was requested", v15, v16, (uint64_t)(*(void *)(v3 + 96) - *(void *)(v3 + 88)) >> 5, 0);
      uint64_t result = DSPGraph::ThrowException();
    }
    __break(1u);
    return result;
  }
  sub_1DCB4C03C(v3, a2);
  uint64_t v10 = *(void *)(v3 + 800);
  if (*(void *)(v3 + 808) == v10) {
    goto LABEL_17;
  }
  *(_DWORD *)(v3 + 908) = (int)*(double *)(v10 + 8);
  uint64_t result = DSPGraph::Graph::processMultiple();
LABEL_12:
  *(_DWORD *)(v3 + 908) += a2;
  uint64_t v11 = *(void *)(v3 + 824);
  if (*(void *)(v3 + 832) != v11)
  {
    uint64_t v12 = *(unsigned int *)(v11 + 4);
    return DSPGraph::Box::propagateFlagsAndTimeStamp((DSPGraph::Box *)v3, v12, (const AudioTimeStamp *)(v11 + 8));
  }
  return result;
}

void sub_1DCB4BE00(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (*(char *)(v23 - 33) < 0) {
    operator delete(*(void **)(v23 - 56));
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DCB4BE58(DSPGraph::Box *a1)
{
  DSPGraph::Box::initialize(a1);
  unsigned int v2 = (DSPGraph::Graph *)*((void *)a1 + 98);

  return DSPGraph::Graph::initialize(v2);
}

uint64_t sub_1DCB4BE94(uint64_t a1)
{
  uint64_t result = DSPGraph::Box::uninitialize((DSPGraph::Box *)a1);
  if (!*(unsigned char *)(a1 + 904))
  {
    uint64_t v3 = *(DSPGraph::Graph **)(a1 + 784);
    return DSPGraph::Graph::uninitialize(v3);
  }
  return result;
}

uint64_t sub_1DCB4BEE0(DSPGraph::Box *a1)
{
  DSPGraph::Box::reset(a1);
  unsigned int v2 = (DSPGraph::Graph *)*((void *)a1 + 98);

  return DSPGraph::Graph::reset(v2);
}

uint64_t sub_1DCB4BF18()
{
  return 0;
}

uint64_t sub_1DCB4BF24(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 784);
  uint64_t result = v1 + 408;
  if (*(char *)(v1 + 431) < 0) {
    return *(void *)result;
  }
  return result;
}

uint64_t sub_1DCB4BF40(uint64_t a1)
{
  return *(void *)(a1 + 784);
}

uint64_t sub_1DCB4BF48(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

void sub_1DCB4BF50(uint64_t a1)
{
  *(void *)a1 = &unk_1F37F7090;
  *(void *)(a1 + 776) = &unk_1F37F7340;
  if (!*(unsigned char *)(a1 + 904)) {
    DSPGraph::Graph::uninitialize(*(DSPGraph::Graph **)(a1 + 784));
  }
  unsigned int v2 = *(void **)(a1 + 880);
  if (v2)
  {
    *(void *)(a1 + 888) = v2;
    operator delete(v2);
  }
  int v7 = (void **)(a1 + 856);
  sub_1DCB4A854(&v7);
  uint64_t v3 = *(void **)(a1 + 848);
  *(void *)(a1 + 848) = 0;
  if (v3) {
    sub_1DCB4A8D8(a1 + 848, v3);
  }
  uint64_t v4 = *(void **)(a1 + 824);
  if (v4)
  {
    *(void *)(a1 + 832) = v4;
    operator delete(v4);
  }
  uint64_t v5 = *(void **)(a1 + 800);
  if (v5)
  {
    *(void *)(a1 + 808) = v5;
    operator delete(v5);
  }
  uint64_t v6 = *(std::__shared_weak_count **)(a1 + 792);
  if (v6) {
    sub_1DCB44254(v6);
  }

  DSPGraph::Box::~Box((DSPGraph::Box *)a1);
}

uint64_t sub_1DCB4C03C(uint64_t a1, int a2)
{
  if (DSPGraph::Graph::numInputs(*(DSPGraph::Graph **)(a1 + 784)))
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = *(void *)(a1 + 64);
      if (v6 >= (*(void *)(a1 + 72) - v7) >> 5) {
        break;
      }
      uint64_t v8 = *(void *)((*(uint64_t (**)(void))(*(void *)(v7 + v5) + 40))() + 56);
      uint64_t v9 = *(void *)(v8 + 80);
      *(void *)(v8 + 8) = *(void *)(*(void *)(a1 + 16) + 256);
      int v10 = *(_DWORD *)(v8 + 72);
      long long v42 = *(_OWORD *)(v8 + 8);
      long long v43 = *(_OWORD *)(v8 + 24);
      long long v44 = *(_OWORD *)(v8 + 40);
      long long v45 = *(_OWORD *)(v8 + 56);
      uint64_t v11 = *(void *)(a1 + 800);
      if (0xCCCCCCCCCCCCCCCDLL * ((*(void *)(a1 + 808) - v11) >> 4) <= v6) {
        goto LABEL_34;
      }
      uint64_t v12 = v11 + v4;
      *(_DWORD *)uint64_t v12 = a2;
      *(_DWORD *)(v12 + 4) = v10;
      *(_OWORD *)(v12 + 8) = v42;
      *(_OWORD *)(v12 + 24) = v43;
      *(_OWORD *)(v12 + 40) = v44;
      *(_OWORD *)(v12 + 56) = v45;
      *(void *)(v12 + 72) = v9;
      ++v6;
      v5 += 32;
      v4 += 80;
      if (v6 >= DSPGraph::Graph::numInputs(*(DSPGraph::Graph **)(a1 + 784))) {
        goto LABEL_6;
      }
    }
    sub_1DCB43D1C(&v42, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(v47, "in");
    uint64_t v41 = (void *)(a1 + 32);
    if (*(char *)(a1 + 55) < 0) {
      uint64_t v41 = (void *)*v41;
    }
    DSPGraph::strprintf(v46, (DSPGraph *)"Box::in inIndex out of range! box %s has %zu inputs but input %u was requested", v40, v41, (uint64_t)(*(void *)(a1 + 72) - *(void *)(a1 + 64)) >> 5, v6);
    uint64_t result = DSPGraph::ThrowException();
    goto LABEL_53;
  }
LABEL_6:
  int v13 = (DSPGraph::Box *)DSPGraph::Graph::in(*(DSPGraph::Graph **)(a1 + 784));
  DSPGraph::Box::sampleRate(v13);
  DSPGraph::Graph::preflight();
  uint64_t v14 = *(_DWORD **)(a1 + 800);
  if (*(_DWORD **)(a1 + 808) == v14) {
LABEL_34:
  }
    sub_1DCB4B220();
  if (*v14 != a2) {
    __assert_rtn("prepareGraphIOData", "DSPGraph_GraphBox.h", 279, "mGraphIODataIn.at(0).mNumFrames == inNumFrames");
  }
  uint64_t result = DSPGraph::Graph::numOutputs(*(DSPGraph::Graph **)(a1 + 784));
  if (result)
  {
    unsigned int v16 = 0;
    while (1)
    {
      uint64_t v17 = *(void *)(a1 + 88);
      if (v16 >= (unint64_t)((*(void *)(a1 + 96) - v17) >> 5))
      {
        sub_1DCB43D1C(&v42, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
        sub_1DCB43D1C(v47, "out");
        unint64_t v39 = (void *)(a1 + 32);
        if (*(char *)(a1 + 55) < 0) {
          unint64_t v39 = (void *)*v39;
        }
        goto LABEL_52;
      }
      int v18 = *(_DWORD **)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)(v17 + 32 * v16) + 40))(v17 + 32 * v16)
                                   + 56)
                       + 80);
      if (*v18) {
        break;
      }
LABEL_29:
      uint64_t v37 = *(void *)(a1 + 824);
      if (0xCCCCCCCCCCCCCCCDLL * ((*(void *)(a1 + 832) - v37) >> 4) <= v16) {
        goto LABEL_34;
      }
      *(void *)(v37 + 80 * v16++ + 72) = v18;
      uint64_t result = DSPGraph::Graph::numOutputs(*(DSPGraph::Graph **)(a1 + 784));
      if (v16 >= result) {
        return result;
      }
    }
    unint64_t v19 = 0;
    uint64_t v20 = 3;
    while (1)
    {
      uint64_t v21 = *(void *)(a1 + 88);
      if (v16 >= (unint64_t)((*(void *)(a1 + 96) - v21) >> 5)) {
        break;
      }
      uint64_t v22 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)(v21 + 32 * v16) + 40))(v21 + 32 * v16)
                      + 120);
      int v24 = *(_DWORD *)(v22 + 8);
      BOOL v25 = v24 == 1718773105 || v24 == 1819304813;
      if (v25 || !*(_DWORD *)(v22 + 16))
      {
        uint64_t v26 = *(void *)(a1 + 88);
        if (v16 >= (unint64_t)((*(void *)(a1 + 96) - v26) >> 5))
        {
          sub_1DCB43D1C(&v42, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
          sub_1DCB43D1C(v47, "out");
          unint64_t v39 = (void *)(a1 + 32);
          if (*(char *)(a1 + 55) < 0) {
            unint64_t v39 = (void *)*v39;
          }
          goto LABEL_52;
        }
        uint64_t v27 = (*(uint64_t (**)(uint64_t))(*(void *)(v26 + 32 * v16) + 40))(v26 + 32 * v16);
        uint64_t v28 = *(void *)(a1 + 824);
        if (0xCCCCCCCCCCCCCCCDLL * ((*(void *)(a1 + 832) - v28) >> 4) <= v16) {
          goto LABEL_34;
        }
        int v29 = *(_DWORD *)(v28 + 80 * v16) * *(_DWORD *)(*(void *)(v27 + 120) + 24);
      }
      else
      {
        uint64_t v30 = *(_DWORD **)(a1 + 824);
        if (*(_DWORD **)(a1 + 832) == v30) {
          goto LABEL_34;
        }
        uint64_t v31 = *(void *)(a1 + 88);
        if (v16 >= (unint64_t)((*(void *)(a1 + 96) - v31) >> 5))
        {
          sub_1DCB43D1C(&v42, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
          sub_1DCB43D1C(v47, "out");
          unint64_t v39 = (void *)(a1 + 32);
          if (*(char *)(a1 + 55) < 0) {
            unint64_t v39 = (void *)*v39;
          }
          goto LABEL_52;
        }
        LODWORD(v23) = *v30;
        double v32 = (double)v23;
        LODWORD(v33) = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)(v31 + 32 * v16) + 40))(v31 + 32 * v16)
                                             + 120)
                                 + 20);
        double v34 = v32 / (double)v33;
        if (vabdd_f64(floor(v34), v34) >= 0.001) {
          __assert_rtn("prepareGraphIOData", "DSPGraph_GraphBox.h", 288, "isIntegral(numPacketsOut)");
        }
        uint64_t v35 = *(void *)(a1 + 88);
        if (v16 >= (unint64_t)((*(void *)(a1 + 96) - v35) >> 5))
        {
          sub_1DCB43D1C(&v42, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
          sub_1DCB43D1C(v47, "out");
          unint64_t v39 = (void *)(a1 + 32);
          if (*(char *)(a1 + 55) < 0) {
            unint64_t v39 = (void *)*v39;
          }
          goto LABEL_52;
        }
        LODWORD(v36) = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)(v35 + 32 * v16) + 40))(v35 + 32 * v16)
                                             + 120)
                                 + 16);
        int v29 = (v34 * (double)v36);
      }
      v18[v20] = v29;
      ++v19;
      v20 += 4;
      if (v19 >= *v18) {
        goto LABEL_29;
      }
    }
    sub_1DCB43D1C(&v42, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(v47, "out");
    unint64_t v39 = (void *)(a1 + 32);
    if (*(char *)(a1 + 55) < 0) {
      unint64_t v39 = (void *)*v39;
    }
LABEL_52:
    DSPGraph::strprintf(v46, (DSPGraph *)"Box::out inIndex out of range! box %s has %zu outputs but input %u was requested", v38, v39, (uint64_t)(*(void *)(a1 + 96) - *(void *)(a1 + 88)) >> 5, v16);
    uint64_t result = DSPGraph::ThrowException();
LABEL_53:
    __break(1u);
  }
  return result;
}

void sub_1DCB4C728(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35)
{
  if (a29 < 0) {
    operator delete(__p);
  }
  if (a35 < 0) {
    operator delete(a30);
  }
  if (a18 < 0) {
    operator delete(a13);
  }
  _Unwind_Resume(exception_object);
}

std::runtime_error *sub_1DCB4C7B0(std::runtime_error *a1, const char *a2)
{
  uint64_t result = std::runtime_error::runtime_error(a1, a2);
  result->__vftable = (std::runtime_error_vtbl *)(MEMORY[0x1E4FBA4E0] + 16);
  return result;
}

uint64_t sub_1DCB4C7E4(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x7FFFFFFFFFFFFFF8) {
    sub_1DCB43DD0();
  }
  if (a2 > 0x16)
  {
    uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a2 | 7) != 0x17) {
      uint64_t v4 = a2 | 7;
    }
    uint64_t v5 = v4 + 1;
    unint64_t v6 = operator new(v4 + 1);
    *(void *)(a1 + 8) = a2;
    *(void *)(a1 + 16) = v5 | 0x8000000000000000;
    *(void *)a1 = v6;
  }
  else
  {
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    *(void *)a1 = 0;
    *(unsigned char *)(a1 + 23) = a2;
  }
  return a1;
}

void sub_1DCB4C86C()
{
  exceptiouint64_t n = __cxa_allocate_exception(8uLL);
  *exceptiouint64_t n = &unk_1F37F83B8;
  __cxa_throw(exception, (struct type_info *)&unk_1F37F6170, (void (*)(void *))std::exception::~exception);
}

void sub_1DCB4C8BC(std::exception *a1)
{
  std::exception::~exception(a1);

  JUMPOUT(0x1E01A8C50);
}

void *sub_1DCB4C8F4(void *a1, uint64_t a2, uint64_t a3)
{
  *a1 = a1;
  a1[1] = a1;
  a1[2] = 0;
  if (a3)
  {
    uint64_t v5 = 0;
    uint64_t v6 = 8 * a3;
    uint64_t v7 = a1;
    do
    {
      uint64_t v8 = operator new(0x18uLL);
      uint64_t v9 = *(void *)(a2 + 8 * v5);
      v8[1] = a1;
      v8[2] = v9;
      *uint64_t v8 = v7;
      v7[1] = v8;
      *a1 = v8;
      a1[2] = ++v5;
      uint64_t v7 = v8;
      v6 -= 8;
    }
    while (v6);
  }
  return a1;
}

void sub_1DCB4C974(_Unwind_Exception *a1)
{
  sub_1DCB44990(v1);
  _Unwind_Resume(a1);
}

void *sub_1DCB4C988(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t result = operator new(0x30uLL);
  *uint64_t result = a2;
  result[1] = a3;
  uint64_t v8 = a4[1];
  result[2] = *a4;
  result[3] = v8;
  if (v8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v9 = a4[3];
  result[4] = a4[2];
  result[5] = v9;
  if (v9) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t *sub_1DCB4C9F4(uint64_t *a1, uint64_t a2)
{
  *a1 = (uint64_t)a1;
  a1[1] = (uint64_t)a1;
  a1[2] = 0;
  for (uint64_t i = *(void *)(a2 + 8); i != a2; uint64_t i = *(void *)(i + 8))
  {
    uint64_t v5 = sub_1DCB4C988((uint64_t)a1, 0, 0, (void *)(i + 16));
    uint64_t v6 = *a1;
    *uint64_t v5 = *a1;
    v5[1] = a1;
    *(void *)(v6 + 8) = v5;
    *a1 = (uint64_t)v5;
    ++a1[2];
  }
  return a1;
}

void sub_1DCB4CA74(_Unwind_Exception *a1)
{
  sub_1DCB48F64(v1);
  _Unwind_Resume(a1);
}

__n128 sub_1DCB4CA88@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = sub_1DCB4CACC(*(DSPGraph::Graph **)(a1 + 48));
  __n128 result = *(__n128 *)v3;
  long long v5 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)a2 = *(_OWORD *)v3;
  *(_OWORD *)(a2 + 16) = v5;
  *(void *)(a2 + 32) = *(void *)(v3 + 32);
  *(_DWORD *)(a2 + 40) = 1;
  return result;
}

uint64_t sub_1DCB4CACC(DSPGraph::Graph *a1)
{
  uint64_t v1 = DSPGraph::Graph::in(a1);
  uint64_t v2 = *(void *)(v1 + 88);
  if (*(void *)(v1 + 96) != v2) {
    return *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2) + 120);
  }
  sub_1DCB43D1C(v8, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
  sub_1DCB43D1C(v7, "out");
  long long v5 = (void *)(v1 + 32);
  if (*(char *)(v1 + 55) < 0) {
    long long v5 = (void *)*v5;
  }
  DSPGraph::strprintf(v6, (DSPGraph *)"Box::out inIndex out of range! box %s has %zu outputs but input %u was requested", v4, v5, (uint64_t)(*(void *)(v1 + 96) - *(void *)(v1 + 88)) >> 5, 0);
  uint64_t result = DSPGraph::ThrowException();
  __break(1u);
  return result;
}

void sub_1DCB4CBA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (*(char *)(v23 - 17) < 0) {
    operator delete(*(void **)(v23 - 40));
  }
  _Unwind_Resume(exception_object);
}

__n128 sub_1DCB4CBEC@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (*(unsigned char *)(a1 + 64)) {
    int v4 = sub_1DCB492EC(*(DSPGraph::Graph **)(a1 + 48));
  }
  else {
    int v4 = 1;
  }
  uint64_t v5 = sub_1DCB4CC58(*(DSPGraph::Graph **)(a1 + 48));
  __n128 result = *(__n128 *)v5;
  long long v7 = *(_OWORD *)(v5 + 16);
  *(_OWORD *)a2 = *(_OWORD *)v5;
  *(_OWORD *)(a2 + 16) = v7;
  *(void *)(a2 + 32) = *(void *)(v5 + 32);
  *(_DWORD *)(a2 + 40) = v4;
  return result;
}

uint64_t sub_1DCB4CC58(DSPGraph::Graph *a1)
{
  uint64_t v1 = DSPGraph::Graph::out(a1);
  uint64_t v2 = *(void *)(v1 + 64);
  if (*(void *)(v1 + 72) != v2) {
    return *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2) + 120);
  }
  sub_1DCB43D1C(v8, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
  sub_1DCB43D1C(v7, "in");
  uint64_t v5 = (void *)(v1 + 32);
  if (*(char *)(v1 + 55) < 0) {
    uint64_t v5 = (void *)*v5;
  }
  DSPGraph::strprintf(v6, (DSPGraph *)"Box::in inIndex out of range! box %s has %zu inputs but input %u was requested", v4, v5, (uint64_t)(*(void *)(v1 + 72) - *(void *)(v1 + 64)) >> 5, 0);
  uint64_t result = DSPGraph::ThrowException();
  __break(1u);
  return result;
}

void sub_1DCB4CD2C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (*(char *)(v23 - 17) < 0) {
    operator delete(*(void **)(v23 - 40));
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DCB4CD78()
{
  return 2;
}

uint64_t sub_1DCB4CD80@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void *)(result + 56);
  *a2 = *(void *)(result + 48);
  a2[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_1DCB4CDA0(void *a1)
{
  sub_1DCB4CDD8(a1);

  JUMPOUT(0x1E01A8C50);
}

void *sub_1DCB4CDD8(void *a1)
{
  *a1 = &unk_1F37F6300;
  uint64_t v2 = (std::__shared_weak_count *)a1[7];
  if (v2) {
    sub_1DCB44254(v2);
  }
  *a1 = &unk_1F37F6290;
  sub_1DCB44990(a1 + 2);
  return a1;
}

uint64_t sub_1DCB4CE48(uint64_t a1, int a2, int a3, double a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = DSPGraph::Box::Box((DSPGraph::Box *)a1);
  *(void *)uint64_t v8 = &unk_1F37F7900;
  *(_OWORD *)(v8 + 776) = 0u;
  *(void *)(a1 + 792) = [MEMORY[0x1E4F1CA48] array];
  *(void *)(a1 + 800) = [MEMORY[0x1E4F1CA48] array];
  uint64_t v9 = sub_1DCB6CF14();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 134218496;
    double v12 = a4;
    __int16 v13 = 1024;
    int v14 = a2;
    __int16 v15 = 1024;
    int v16 = a3;
    _os_log_impl(&dword_1DC873000, v9, OS_LOG_TYPE_DEBUG, "Constructing ShazamBox(ringBufferDuratiouint64_t n = %f, saveWavFile = %d, channelCount = %d)", (uint8_t *)&v11, 0x18u);
  }

  *(double *)(a1 + 808) = a4;
  *(unsigned char *)(a1 + 816) = a2;
  *(_DWORD *)(a1 + 832) = a3;
  return a1;
}

void sub_1DCB4CF84(_Unwind_Exception *exception_object)
{
}

uint64_t sub_1DCB4CFD0(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = sub_1DCB6CF14();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DC873000, v2, OS_LOG_TYPE_DEBUG, "Initializing ShazamBox", buf, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 64);
  if (*(void *)(a1 + 72) == v3)
  {
    sub_1DCB43D1C(buf, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(v34, "in");
    uint64_t v26 = (void *)(a1 + 32);
    if (*(char *)(a1 + 55) < 0) {
      uint64_t v26 = (void *)*v26;
    }
    goto LABEL_57;
  }
  if (**(double **)((*(uint64_t (**)(uint64_t))(*(void *)v3 + 40))(v3) + 120) != 16000.0)
  {
    uint64_t v4 = *(void *)(a1 + 64);
    if (*(void *)(a1 + 72) == v4)
    {
      sub_1DCB43D1C(buf, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
      sub_1DCB43D1C(v34, "in");
      uint64_t v26 = (void *)(a1 + 32);
      if (*(char *)(a1 + 55) < 0) {
        uint64_t v26 = (void *)*v26;
      }
      goto LABEL_57;
    }
    if (**(double **)((*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4) + 120) != 24000.0)
    {
      uint64_t v5 = *(void *)(a1 + 64);
      if (*(void *)(a1 + 72) == v5)
      {
        sub_1DCB43D1C(buf, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
        sub_1DCB43D1C(v34, "in");
        uint64_t v26 = (void *)(a1 + 32);
        if (*(char *)(a1 + 55) < 0) {
          uint64_t v26 = (void *)*v26;
        }
        goto LABEL_57;
      }
      if (**(double **)((*(uint64_t (**)(uint64_t))(*(void *)v5 + 40))(v5) + 120) != 32000.0)
      {
        uint64_t v6 = *(void *)(a1 + 64);
        if (*(void *)(a1 + 72) == v6)
        {
          sub_1DCB43D1C(buf, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
          sub_1DCB43D1C(v34, "in");
          uint64_t v26 = (void *)(a1 + 32);
          if (*(char *)(a1 + 55) < 0) {
            uint64_t v26 = (void *)*v26;
          }
          goto LABEL_57;
        }
        if (**(double **)((*(uint64_t (**)(uint64_t))(*(void *)v6 + 40))(v6) + 120) != 48000.0) {
          __assert_rtn("initialize", "DSPGraph_ShazamBox.mm", 45, "in(0).format().mSampleRate == 16000 || in(0).format().mSampleRate == 24000 || in(0).format().mSampleRate == 32000 || in(0).format().mSampleRate == 48000");
        }
      }
    }
  }
  uint64_t v7 = *(void *)(a1 + 64);
  if (*(void *)(a1 + 72) == v7)
  {
    sub_1DCB43D1C(buf, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(v34, "in");
    uint64_t v26 = (void *)(a1 + 32);
    if (*(char *)(a1 + 55) < 0) {
      uint64_t v26 = (void *)*v26;
    }
    goto LABEL_57;
  }
  if (*(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v7 + 40))(v7) + 120) + 28) != *(_DWORD *)(a1 + 832)) {
    __assert_rtn("initialize", "DSPGraph_ShazamBox.mm", 46, "in(0).format().mChannelsPerFrame == mChannelCount");
  }
  uint64_t v8 = *(void *)(a1 + 64);
  if (*(void *)(a1 + 72) == v8)
  {
    sub_1DCB43D1C(buf, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(v34, "in");
    uint64_t v26 = (void *)(a1 + 32);
    if (*(char *)(a1 + 55) < 0) {
      uint64_t v26 = (void *)*v26;
    }
LABEL_57:
    DSPGraph::strprintf((uint64_t *)v32, (DSPGraph *)"Box::in inIndex out of range! box %s has %zu inputs but input %u was requested", v25, v26, (uint64_t)(*(void *)(a1 + 72) - *(void *)(a1 + 64)) >> 5, 0);
    uint64_t result = DSPGraph::ThrowException();
    __break(1u);
    return result;
  }
  uint64_t v9 = *(uint64_t **)((*(uint64_t (**)(uint64_t))(*(void *)v8 + 40))(v8) + 120);
  uint64_t v10 = *v9;
  LODWORD(v9) = *((_DWORD *)v9 + 7);
  *(void *)buf = v10;
  long long v28 = xmmword_1DCBE3F00;
  int v29 = 4;
  int v30 = (int)v9;
  uint64_t v31 = 32;
  uint64_t v11 = [objc_alloc(MEMORY[0x1E4F153A0]) initWithStreamDescription:buf];
  double v12 = *(void **)(a1 + 776);
  *(void *)(a1 + 776) = v11;

  __int16 v13 = sub_1DCB6CF14();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v14 = [*(id *)(a1 + 776) debugDescription];
    *(_DWORD *)double v34 = 138412290;
    *(void *)&v34[4] = v14;
    _os_log_impl(&dword_1DC873000, v13, OS_LOG_TYPE_DEBUG, "Shazam DSPGraph ABL AudioFormat: %@", v34, 0xCu);
  }
  memset(v34, 0, 20);
  +[SNGenerateShazamSignatureRequest shazamChannelsMixingInfo];
  __int16 v15 = sub_1DCB6CF14();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)double v32 = 0;
    _os_log_impl(&dword_1DC873000, v15, OS_LOG_TYPE_DEBUG, "ShazamChannelsMixingInfo: ", v32, 2u);
  }

  int v16 = sub_1DCB6CF14();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)double v32 = 67109120;
    LODWORD(v33) = *(unsigned __int16 *)v34;
    _os_log_impl(&dword_1DC873000, v16, OS_LOG_TYPE_DEBUG, "  Playback Channel:   %d ", v32, 8u);
  }

  uint64_t v17 = sub_1DCB6CF14();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)double v32 = 67109120;
    LODWORD(v33) = *(unsigned __int16 *)&v34[8];
    _os_log_impl(&dword_1DC873000, v17, OS_LOG_TYPE_DEBUG, "  Microphone Channel: %d ", v32, 8u);
  }

  int v18 = sub_1DCB6CF14();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)double v32 = 134217984;
    double v33 = *(float *)&v34[4];
    _os_log_impl(&dword_1DC873000, v18, OS_LOG_TYPE_DEBUG, "  Playback Scale:     %.2f ", v32, 0xCu);
  }

  unint64_t v19 = sub_1DCB6CF14();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)double v32 = 134217984;
    double v33 = *(float *)&v34[12];
    _os_log_impl(&dword_1DC873000, v19, OS_LOG_TYPE_DEBUG, "  Micrphone Scale:    %.2f ", v32, 0xCu);
  }

  uint64_t v20 = sub_1DCB6CF14();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)double v32 = 134217984;
    double v33 = *(float *)&v34[16];
    _os_log_impl(&dword_1DC873000, v20, OS_LOG_TYPE_DEBUG, "  Mixer Scale:        %.2f ", v32, 0xCu);
  }

  *(_DWORD *)(a1 + 820) = *(_DWORD *)&v34[4];
  *(void *)(a1 + 824) = *(void *)&v34[12];
  if (*(_DWORD *)(a1 + 832) >= 2u)
  {
    uint64_t v21 = sub_1DCB6CF14();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)double v32 = 0;
      _os_log_impl(&dword_1DC873000, v21, OS_LOG_TYPE_DEBUG, "Testing ShazamChannels Scaling Assertions", v32, 2u);
    }

    if (*(float *)(a1 + 820) == 0.0) {
      __assert_rtn("initialize", "DSPGraph_ShazamBox.mm", 68, "playbackScale != 0.0");
    }
    if (*(float *)(a1 + 824) == 0.0) {
      __assert_rtn("initialize", "DSPGraph_ShazamBox.mm", 69, "micScale != 0.0");
    }
    if (*(float *)(a1 + 828) == 0.0) {
      __assert_rtn("initialize", "DSPGraph_ShazamBox.mm", 70, "mixerScale != 0.0");
    }
  }
  id v22 = objc_alloc_init(MEMORY[0x1E4F3BEC8]);
  uint64_t v23 = *(void **)(a1 + 784);
  *(void *)(a1 + 784) = v22;

  [*(id *)(a1 + 792) removeAllObjects];
  return [*(id *)(a1 + 800) removeAllObjects];
}

void sub_1DCB4D8DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a27 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v27 - 41) < 0) {
    operator delete(*(void **)(v27 - 64));
  }
  if (a18 < 0) {
    operator delete(a13);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DCB4D978(uint64_t a1)
{
  uint64_t v2 = sub_1DCB6CF14();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1DC873000, v2, OS_LOG_TYPE_DEBUG, "Uninitializing ShazamBox", v6, 2u);
  }

  uint64_t v3 = *(void **)(a1 + 776);
  *(void *)(a1 + 776) = 0;

  uint64_t v4 = *(void **)(a1 + 784);
  *(void *)(a1 + 784) = 0;

  [*(id *)(a1 + 792) removeAllObjects];
  return [*(id *)(a1 + 800) removeAllObjects];
}

void sub_1DCB4DA0C(uint64_t a1)
{
  uint64_t v3 = a1 + 64;
  uint64_t v2 = *(void *)(a1 + 64);
  if (*(void *)(v3 + 8) == v2)
  {
    sub_1DCB43D1C(v45, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(v44, "in");
    unint64_t v39 = (void *)(a1 + 32);
    if (*(char *)(a1 + 55) < 0) {
      unint64_t v39 = (void *)*v39;
    }
    goto LABEL_27;
  }
  uint64_t v4 = (void *)MEMORY[0x1E4F153F8];
  uint64_t v5 = (uint64_t)*(double *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2) + 56) + 8);
  [*(id *)(a1 + 776) sampleRate];
  objc_msgSend(v4, "timeWithSampleTime:atRate:", v5);
  id v42 = (id)objc_claimAutoreleasedReturnValue();
  if (*(_DWORD *)(a1 + 832) >= 2u)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F153B0]);
    uint64_t v7 = *(void *)(a1 + 64);
    if (*(void *)(a1 + 72) == v7)
    {
      sub_1DCB43D1C(v45, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
      sub_1DCB43D1C(v44, "in");
      unint64_t v39 = (void *)(a1 + 32);
      if (*(char *)(a1 + 55) < 0) {
        unint64_t v39 = (void *)*v39;
      }
    }
    else
    {
      uint64_t v8 = (void *)[v6 initWithPCMFormat:*(void *)(a1 + 776) bufferListNoCopy:*(void *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v7 + 40))(v7) + 56) + 80) deallocator:0];
      uint64_t v9 = [v8 frameLength];
      size_t v10 = 4 * v9;
      id v41 = (id)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:v10];
      id v40 = (id)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:v10];
      if ([*(id *)(a1 + 776) isInterleaved])
      {
        vDSP_vsmul(*(const float **)([v8 audioBufferList] + 16), *(unsigned int *)(a1 + 832), (const float *)(a1 + 820), (float *)objc_msgSend(v40, "mutableBytes"), 1, v9);
        vDSP_vsmul((const float *)(*(void *)([v8 audioBufferList] + 16) + 4), *(unsigned int *)(a1 + 832), (const float *)(a1 + 824), (float *)objc_msgSend(v41, "mutableBytes"), 1, v9);
      }
      else
      {
        vDSP_vsmul(*(const float **)([v8 audioBufferList] + 16), 1, (const float *)(a1 + 820), (float *)objc_msgSend(v40, "mutableBytes"), 1, v9);
        vDSP_vsmul(*(const float **)([v8 audioBufferList] + 32), 1, (const float *)(a1 + 824), (float *)objc_msgSend(v41, "mutableBytes"), 1, v9);
      }
      id v16 = v41;
      uint64_t v17 = (const float *)[v16 mutableBytes];
      id v18 = v40;
      unint64_t v19 = (const float *)[v18 mutableBytes];
      id v20 = v16;
      vDSP_vadd(v17, 1, v19, 1, (float *)[v20 mutableBytes], 1, v9);
      id v21 = v20;
      id v22 = (const float *)[v21 mutableBytes];
      id v23 = v21;
      vDSP_vsmul(v22, 1, (const float *)(a1 + 828), (float *)[v23 mutableBytes], 1, v9);
      id v24 = objc_alloc(MEMORY[0x1E4F153A0]);
      uint64_t v25 = *(void *)(a1 + 64);
      if (*(void *)(a1 + 72) != v25)
      {
        uint64_t v26 = (void *)[v24 initWithCommonFormat:1 sampleRate:1 channels:0 interleaved:**(double **)((*(uint64_t (**)(uint64_t))(*(void *)v25 + 40))(v25) + 120)];
        __int16 v13 = (void *)[objc_alloc(MEMORY[0x1E4F153B0]) initWithPCMFormat:v26 frameCapacity:v9];
        [v13 setFrameLength:v9];
        uint64_t v27 = *(void **)([v13 audioBufferList] + 16);
        id v28 = v23;
        memcpy(v27, (const void *)[v28 mutableBytes], v10);

        int v29 = *(void **)(a1 + 792);
        int v30 = (void *)[v13 mutableCopy];
        objc_msgSend(v29, "insertObject:atIndex:", v30, objc_msgSend(*(id *)(a1 + 792), "count"));

        objc_msgSend(*(id *)(a1 + 800), "insertObject:atIndex:", v42, objc_msgSend(*(id *)(a1 + 800), "count"));
        goto LABEL_11;
      }
      sub_1DCB43D1C(v45, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
      sub_1DCB43D1C(v44, "in");
      unint64_t v39 = (void *)(a1 + 32);
      if (*(char *)(a1 + 55) < 0) {
        unint64_t v39 = (void *)*v39;
      }
    }
LABEL_27:
    DSPGraph::strprintf(v43, (DSPGraph *)"Box::in inIndex out of range! box %s has %zu inputs but input %u was requested", v38, v39, (uint64_t)(*(void *)(a1 + 72) - *(void *)(a1 + 64)) >> 5, 0);
    DSPGraph::ThrowException();
    __break(1u);
    return;
  }
  id v11 = objc_alloc(MEMORY[0x1E4F153B0]);
  uint64_t v12 = *(void *)(a1 + 64);
  if (*(void *)(a1 + 72) == v12)
  {
    sub_1DCB43D1C(v45, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(v44, "in");
    unint64_t v39 = (void *)(a1 + 32);
    if (*(char *)(a1 + 55) < 0) {
      unint64_t v39 = (void *)*v39;
    }
    goto LABEL_27;
  }
  __int16 v13 = (void *)[v11 initWithPCMFormat:*(void *)(a1 + 776) bufferListNoCopy:*(void *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v12 + 40))(v12) + 56) + 80) deallocator:0];
  int v14 = *(void **)(a1 + 792);
  __int16 v15 = (void *)[v13 mutableCopy];
  objc_msgSend(v14, "insertObject:atIndex:", v15, objc_msgSend(*(id *)(a1 + 792), "count"));

  objc_msgSend(*(id *)(a1 + 800), "insertObject:atIndex:", v42, objc_msgSend(*(id *)(a1 + 800), "count"));
LABEL_11:

  uint64_t v31 = [*(id *)(a1 + 800) lastObject];
  uint64_t v32 = [v31 sampleTime];
  double v33 = [*(id *)(a1 + 800) firstObject];
  uint64_t v34 = [v33 sampleTime];
  double v35 = *(double *)(a1 + 808);
  [*(id *)(a1 + 776) sampleRate];
  double v37 = v35 * v36;

  if (v37 <= (double)(v32 - v34))
  {
    [*(id *)(a1 + 792) removeObjectAtIndex:0];
    [*(id *)(a1 + 800) removeObjectAtIndex:0];
  }
}

void sub_1DCB4E0E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, id a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  if (a33 < 0) {
    operator delete(a28);
  }

  _Unwind_Resume(a1);
}

id sub_1DCB4E25C(uint64_t a1, uint64_t a2)
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(a1 + 816) || ![*(id *)(a1 + 792) count]) {
    goto LABEL_46;
  }
  uint64_t v2 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v3 = NSHomeDirectory();
  uint64_t v4 = [v2 URLWithString:v3];
  uint64_t v5 = [v4 URLByAppendingPathComponent:@"/Library/Caches/com.apple.soundanalysisd/CoAudibility/"];

  uint64_t v59 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v70 = 0;
  id v6 = [v5 absoluteString];
  [v59 fileExistsAtPath:v6 isDirectory:&v70];

  if (a2 == 1)
  {
    if (v70)
    {
      uint64_t v7 = [v5 absoluteString];
      v65[0] = 0;
      char v8 = [v59 removeItemAtPath:v7 error:v65];
      id v61 = v65[0];

      if (v8)
      {
        uint64_t v9 = sub_1DCB6CF14();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          size_t v10 = [v5 absoluteString];
          *(_DWORD *)buf = 138412290;
          long long v72 = v10;
          _os_log_impl(&dword_1DC873000, v9, OS_LOG_TYPE_DEBUG, "Deleted directory at: %@", buf, 0xCu);
        }
        char v70 = 0;
        goto LABEL_17;
      }
      id v11 = sub_1DCB6CF14();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = [v5 absoluteString];
        __int16 v13 = [v61 localizedDescription];
        *(_DWORD *)buf = 138412546;
        long long v72 = v12;
        __int16 v73 = 2112;
        int64_t v74 = v13;
        _os_log_impl(&dword_1DC873000, v11, OS_LOG_TYPE_ERROR, "Error in deleting directory at: %@, Error %@", buf, 0x16u);
      }
    }
    else
    {
      id v11 = sub_1DCB6CF14();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DC873000, v11, OS_LOG_TYPE_DEBUG, "CoAudibility directory doesn't exist", buf, 2u);
      }
      id v61 = 0;
    }
  }
  else
  {
    id v61 = 0;
  }
  if (!v70)
  {
LABEL_17:
    int v14 = [v5 absoluteString];
    v64[0] = v61;
    char v15 = [v59 createDirectoryAtPath:v14 withIntermediateDirectories:1 attributes:0 error:v64];
    id v16 = v64[0];

    if (v15)
    {
      uint64_t v17 = sub_1DCB6CF14();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        id v18 = [v5 absoluteString];
        *(_DWORD *)buf = 138412290;
        long long v72 = v18;
        _os_log_impl(&dword_1DC873000, v17, OS_LOG_TYPE_DEBUG, "Created directory at: %@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v17 = sub_1DCB6CF14();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        unint64_t v19 = [v5 absoluteString];
        id v20 = [v16 localizedDescription];
        *(_DWORD *)buf = 138412546;
        long long v72 = v19;
        __int16 v73 = 2112;
        int64_t v74 = v20;
        _os_log_impl(&dword_1DC873000, v17, OS_LOG_TYPE_ERROR, "Error in creating directory at: %@, Error %@", buf, 0x16u);
      }
    }

    id v61 = v16;
  }
  unint64_t v21 = 0;
  id v22 = 0;
  id v23 = v61;
  while (1)
  {
    long long v62 = v23;
    if (v21 >= [*(id *)(a1 + 792) count]) {
      break;
    }
    id v24 = [*(id *)(a1 + 792) objectAtIndex:v21];
    if (v21 || v22) {
      goto LABEL_31;
    }
    uint64_t v25 = objc_msgSend(NSString, "stringWithFormat:", @"CoADebuggingWav_%llu.wav", a2);
    uint64_t v26 = [v5 URLByAppendingPathComponent:v25];

    id v27 = objc_alloc(MEMORY[0x1E4F15390]);
    id v28 = [v24 format];
    int v29 = [v28 settings];
    int v30 = [v24 format];
    uint64_t v31 = [v30 commonFormat];
    uint64_t v32 = [v24 format];
    uint64_t v33 = [v32 isInterleaved];
    id v69 = v62;
    id v22 = (void *)[v27 initForWriting:v26 settings:v29 commonFormat:v31 interleaved:v33 error:&v69];
    id v34 = v69;

    if (v34)
    {
      double v35 = sub_1DCB6CF14();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        double v36 = [v34 localizedDescription];
        *(_DWORD *)buf = 138412290;
        long long v72 = v36;
        _os_log_impl(&dword_1DC873000, v35, OS_LOG_TYPE_ERROR, "Error in creating Audio File: %@", buf, 0xCu);
      }
      uint64_t v5 = (void *)v26;
      long long v62 = v34;
LABEL_31:
      if (!v22) {
        goto LABEL_37;
      }
      goto LABEL_32;
    }
    long long v62 = 0;
    uint64_t v5 = (void *)v26;
    if (!v22)
    {
LABEL_37:
      id v23 = v62;
      goto LABEL_38;
    }
LABEL_32:
    id v68 = v62;
    char v37 = [v22 writeFromBuffer:v24 error:&v68];
    id v23 = v68;

    if ((v37 & 1) == 0)
    {
      double v38 = sub_1DCB6CF14();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        unint64_t v39 = [v23 localizedDescription];
        *(_DWORD *)buf = 138412290;
        long long v72 = v39;
        _os_log_impl(&dword_1DC873000, v38, OS_LOG_TYPE_ERROR, "Error in writing PCMBuffer to wav file: %@", buf, 0xCu);
      }
    }
LABEL_38:

    ++v21;
  }

  id v40 = sub_1DCB6CF14();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
  {
    id v41 = [v5 absoluteString];
    *(_DWORD *)buf = 138412290;
    long long v72 = v41;
    _os_log_impl(&dword_1DC873000, v40, OS_LOG_TYPE_DEBUG, "Written WavFile at %@", buf, 0xCu);
  }
  id v42 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v43 = [v5 absoluteString];
  long long v44 = [v42 fileURLWithPath:v43];

  id v67 = v62;
  LOBYTE(v43) = +[SNFileUtils addPurgeablePropertyToURL:v44 error:&v67];
  id v45 = v67;

  if ((v43 & 1) == 0)
  {
    long long v46 = sub_1DCB6CF14();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      long long v47 = [v5 absoluteString];
      long long v48 = [v45 localizedDescription];
      *(_DWORD *)buf = 138412546;
      long long v72 = v47;
      __int16 v73 = 2112;
      int64_t v74 = v48;
      _os_log_impl(&dword_1DC873000, v46, OS_LOG_TYPE_ERROR, "Error adding purgeable property to the file: %@, Error: %@", buf, 0x16u);
    }
  }

LABEL_46:
  long long v49 = sub_1DCB6CF14();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DC873000, v49, OS_LOG_TYPE_DEBUG, "Generate Shazam Signature", buf, 2u);
  }

  if ([*(id *)(a1 + 792) count])
  {
    unint64_t v50 = 0;
    do
    {
      uint64_t v51 = *(void **)(a1 + 784);
      uint64_t v52 = [*(id *)(a1 + 792) objectAtIndexedSubscript:v50];
      int64x2_t v53 = (void *)[v52 mutableCopy];
      uint64_t v54 = [*(id *)(a1 + 800) objectAtIndexedSubscript:v50];
      id v66 = 0;
      char v55 = [v51 appendBuffer:v53 atTime:v54 error:&v66];
      id v56 = v66;

      if ((v55 & 1) == 0)
      {
        sub_1DCB43D1C(buf, "/Library/Caches/com.apple.xbs/Sources/Listen/Framework/Internal/Core/DSPGraph/Boxes/DSPGraph_ShazamBox.mm");
        sub_1DCB43D1C(v65, "generateSignature");
        sub_1DCB43D1C(v64, "Error appending buffer to Shazam signature generator");
        DSPGraph::ThrowException();
        __break(1u);
      }

      ++v50;
    }
    while (v50 < [*(id *)(a1 + 792) count]);
  }
  uint64_t v57 = [*(id *)(a1 + 784) signature];

  return v57;
}

void sub_1DCB4EB54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  _Unwind_Resume(a1);
}

void sub_1DCB4EDA0(uint64_t a1)
{
  uint64_t v2 = sub_1DCB6CF14();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1DC873000, v2, OS_LOG_TYPE_DEBUG, "Reset Shazam Signature", v5, 2u);
  }

  id v3 = objc_alloc_init(MEMORY[0x1E4F3BEC8]);
  uint64_t v4 = *(void **)(a1 + 784);
  *(void *)(a1 + 784) = v3;
}

void sub_1DCB4EE28(id *a1)
{
  sub_1DCB4EE84(a1);

  JUMPOUT(0x1E01A8C50);
}

const char *sub_1DCB4EE60()
{
  return "ShazamBox";
}

double sub_1DCB4EE6C@<D0>(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 + 16) = 0;
  double result = *(double *)"xfuamzhsxoba";
  *(_OWORD *)a1 = *(_OWORD *)"xfuamzhsxoba";
  return result;
}

void sub_1DCB4EE84(id *a1)
{
  DSPGraph::Box::~Box((DSPGraph::Box *)a1);
}

uint64_t sub_1DCB4EED8(uint64_t result, unsigned int a2)
{
  if (*(_DWORD *)(result + 36) < a2) {
    operator new[]();
  }
  return result;
}

uint64_t sub_1DCB4EFD4(int a1)
{
  return 16 * a1 + 28;
}

uint64_t sub_1DCB4EFE0(void *a1, size_t *a2, int a3)
{
  if ((a3 & 7) != 0) {
    return 0;
  }
  unint64_t v6 = 16 * a3 + 28;
  size_t v7 = *a2;
  if (v7 < v6) {
    return 0;
  }
  bzero(a1, v7);
  *a2 = v6;
  *(_DWORD *)((((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF0) + 4 * ((4 * a3) | 2)) = -1;
  return 1;
}

BOOL sub_1DCB4F064(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, float a8)
{
  if ((a5 & 7) == 0)
  {
    *(void *)a1 = a2;
    *(void *)(a1 + 8) = a3;
    *(void *)(a1 + 16) = a4;
    *(float *)(a1 + 24) = a8;
    *(_DWORD *)(a1 + 28) = a5;
    *(_DWORD *)(a1 + 32) = a6;
    *(void *)(a1 + 36) = a7;
    unint64_t v8 = (a7 + 15) & 0xFFFFFFFFFFFFFFF0;
    uint64_t v9 = (4 * a5) | 2;
    int v10 = *(_DWORD *)(v8 + 4 * v9);
    if (v10 < 0) {
      v10 += a6 + a6 * (v10 / a6);
    }
    *(_DWORD *)(v8 + 4 * v9) = v10 % a6;
  }
  return (a5 & 7) == 0;
}

uint64_t sub_1DCB4F0C0(uint64_t a1, int a2)
{
  return ((*(_DWORD *)(((*(void *)(a1 + 36) + 15) & 0xFFFFFFFFFFFFFFF0)
                                   + 16 * *(int *)(a1 + 28)
                                   + 8)
                       + a2)
                      / *(_DWORD *)(a1 + 32));
}

uint64_t sub_1DCB4F0E8(uint64_t a1, float32x4_t *a2, uint64_t a3, uint64_t a4, int *a5)
{
  unint64_t v5 = (*(void *)(a1 + 36) + 15) & 0xFFFFFFFFFFFFFFF0;
  *a5 = (*(_DWORD *)(v5 + 16 * *(int *)(a1 + 28) + 8) + (int)a4) / *(_DWORD *)(a1 + 32);
  uint64_t v6 = *(int *)(a1 + 28);
  if ((int)v6 >= 1)
  {
    unsigned int v8 = 0;
    unint64_t v179 = v5 + 8 * v6;
    unint64_t v9 = v5 + 16 * v6;
    uint64_t v10 = (int)((4 * v6) | 2);
    int v11 = *(_DWORD *)(v5 + 4 * v10);
    uint64_t v12 = *(void *)v9;
    int v13 = a4 & 7;
    v167 = (float *)(a1 + 24);
    uint64_t v165 = a4;
    int v14 = v11 + 1;
    int8x16_t v177 = (int8x16_t)vdupq_n_s32(0x7F800000u);
    float32x4_t v178 = (float32x4_t)vdupq_n_s32(0x24E69595u);
    float32x4_t v175 = (float32x4_t)vdupq_n_s32(0x3EE4F4B8u);
    float32x4_t v176 = (float32x4_t)vdupq_n_s32(0xBD67B6D6);
    float32x4_t v173 = (float32x4_t)vdupq_n_s32(0x40348E95u);
    float32x4_t v174 = (float32x4_t)vdupq_n_s32(0xBFBC278B);
    float32x4_t v171 = (float32x4_t)vdupq_n_s32(0x3F317218u);
    float32x4_t v172 = (float32x4_t)vdupq_n_s32(0xBFDEF31A);
    uint64_t v164 = a3 + 64;
    unsigned int v170 = a4;
    uint64_t v169 = a3;
    int v168 = v13;
    uint64_t v166 = *(void *)v9;
    do
    {
      int v15 = v6 - v8;
      *(_DWORD *)(v5 + 4 * v10) = v11;
      *(void *)unint64_t v9 = v12;
      int v16 = *(_DWORD *)(a1 + 28);
      if (!v13 && v16 == 32 && v15 == 32)
      {
        int v17 = *(_DWORD *)(a1 + 32);
        int v18 = v11 + 1;
        if (v11 <= -2) {
          int v18 = v17 + v17 * (v14 / v17) + v14;
        }
        unint64_t v19 = (float32x4_t *)(a3 + 4 * v8);
        int v20 = *a5;
        int v21 = sub_1DC875E60((v18 % v17), a2, v19, a4, (uint64_t *)v9, (float *)(v5 + 4 * v8), (float32x4_t *)(v179 + 4 * v8), v167, v17, (float32x4_t *)(*(void *)a1 + 32 * v8), (float32x4_t *)(*(void *)(a1 + 8) + 32 * v8), (float32x4_t *)(*(void *)(a1 + 16) + 32 * v8));
        int v22 = v21 - 1;
        if (v21 <= 0) {
          v22 += v17 + v17 * (v22 / v17);
        }
        *(_DWORD *)(v5 + 4 * v10) = v22 % v17;
        a4 = v170;
        a3 = v169;
        int v13 = v168;
        if (v20 >= 1)
        {
          do
          {
            float32x4_t v23 = vaddq_f32(*v19, v178);
            float32x4_t v24 = vaddq_f32(v19[1], v178);
            float32x4_t v25 = vdivq_f32(v23, (float32x4_t)vandq_s8((int8x16_t)v23, v177));
            float32x4_t v26 = vdivq_f32(v24, (float32x4_t)vandq_s8((int8x16_t)v24, v177));
            v27.i64[0] = 0x7E0000007ELL;
            v27.i64[1] = 0x7E0000007ELL;
            int32x4_t v28 = vsraq_n_s32(v27, (int32x4_t)v24, 0x17uLL);
            v24.i64[0] = 0x7E0000007ELL;
            v24.i64[1] = 0x7E0000007ELL;
            *unint64_t v19 = vmlaq_f32(vmlaq_f32(v172, v25, vmlaq_f32(v173, v25, vmlaq_f32(v174, v25, vmlaq_f32(v175, v176, v25)))), v171, vcvtq_f32_s32(vsraq_n_s32((int32x4_t)v24, (int32x4_t)v23, 0x17uLL)));
            v19[1] = vmlaq_f32(vmlaq_f32(v172, v26, vmlaq_f32(v173, v26, vmlaq_f32(v174, v26, vmlaq_f32(v175, v176, v26)))), v171, vcvtq_f32_s32(v28));
            float32x4_t v29 = vaddq_f32(v19[2], v178);
            float32x4_t v30 = vaddq_f32(v19[3], v178);
            float32x4_t v31 = vdivq_f32(v29, (float32x4_t)vandq_s8((int8x16_t)v29, v177));
            float32x4_t v32 = vdivq_f32(v30, (float32x4_t)vandq_s8((int8x16_t)v30, v177));
            v28.i64[0] = 0x7E0000007ELL;
            v28.i64[1] = 0x7E0000007ELL;
            int32x4_t v33 = vsraq_n_s32(v28, (int32x4_t)v30, 0x17uLL);
            v30.i64[0] = 0x7E0000007ELL;
            v30.i64[1] = 0x7E0000007ELL;
            v19[2] = vmlaq_f32(vmlaq_f32(v172, v31, vmlaq_f32(v173, v31, vmlaq_f32(v174, v31, vmlaq_f32(v175, v176, v31)))), v171, vcvtq_f32_s32(vsraq_n_s32((int32x4_t)v30, (int32x4_t)v29, 0x17uLL)));
            void v19[3] = vmlaq_f32(vmlaq_f32(v172, v32, vmlaq_f32(v173, v32, vmlaq_f32(v174, v32, vmlaq_f32(v175, v176, v32)))), v171, vcvtq_f32_s32(v33));
            float32x4_t v34 = vaddq_f32(v19[4], v178);
            float32x4_t v35 = vaddq_f32(v19[5], v178);
            float32x4_t v36 = vdivq_f32(v34, (float32x4_t)vandq_s8((int8x16_t)v34, v177));
            float32x4_t v37 = vdivq_f32(v35, (float32x4_t)vandq_s8((int8x16_t)v35, v177));
            v33.i64[0] = 0x7E0000007ELL;
            v33.i64[1] = 0x7E0000007ELL;
            int32x4_t v38 = vsraq_n_s32(v33, (int32x4_t)v35, 0x17uLL);
            v35.i64[0] = 0x7E0000007ELL;
            v35.i64[1] = 0x7E0000007ELL;
            v19[4] = vmlaq_f32(vmlaq_f32(v172, v36, vmlaq_f32(v173, v36, vmlaq_f32(v174, v36, vmlaq_f32(v175, v176, v36)))), v171, vcvtq_f32_s32(vsraq_n_s32((int32x4_t)v35, (int32x4_t)v34, 0x17uLL)));
            v19[5] = vmlaq_f32(vmlaq_f32(v172, v37, vmlaq_f32(v173, v37, vmlaq_f32(v174, v37, vmlaq_f32(v175, v176, v37)))), v171, vcvtq_f32_s32(v38));
            float32x4_t v39 = vaddq_f32(v19[6], v178);
            float32x4_t v40 = vaddq_f32(v19[7], v178);
            float32x4_t v41 = vdivq_f32(v39, (float32x4_t)vandq_s8((int8x16_t)v39, v177));
            float32x4_t v42 = vdivq_f32(v40, (float32x4_t)vandq_s8((int8x16_t)v40, v177));
            v38.i64[0] = 0x7E0000007ELL;
            v38.i64[1] = 0x7E0000007ELL;
            int32x4_t v43 = vsraq_n_s32(v38, (int32x4_t)v40, 0x17uLL);
            v40.i64[0] = 0x7E0000007ELL;
            v40.i64[1] = 0x7E0000007ELL;
            v19[6] = vmlaq_f32(vmlaq_f32(v172, v41, vmlaq_f32(v173, v41, vmlaq_f32(v174, v41, vmlaq_f32(v175, v176, v41)))), v171, vcvtq_f32_s32(vsraq_n_s32((int32x4_t)v40, (int32x4_t)v39, 0x17uLL)));
            v19[7] = vmlaq_f32(vmlaq_f32(v172, v42, vmlaq_f32(v173, v42, vmlaq_f32(v174, v42, vmlaq_f32(v175, v176, v42)))), v171, vcvtq_f32_s32(v43));
            v19 += 8;
            --v20;
          }
          while (v20);
        }
      }
      else
      {
        if (!v13 && v16 == 16 && v15 == 16)
        {
          int v45 = *(_DWORD *)(a1 + 32);
          int v46 = v11 + 1;
          if (v11 <= -2) {
            int v46 = v45 + v45 * (v14 / v45) + v14;
          }
          long long v47 = (float32x4_t *)(a3 + 4 * v8);
          int v48 = *a5;
          int v49 = sub_1DC87574C((v46 % v45), a2, v47, a4, (uint64_t *)v9, (float *)(v5 + 4 * v8), (float32x4_t *)(v179 + 4 * v8), v167, v45, (float32x4_t *)(*(void *)a1 + 32 * v8), (float32x4_t *)(*(void *)(a1 + 8) + 32 * v8), (float32x4_t *)(*(void *)(a1 + 16) + 32 * v8));
          int v50 = v49 - 1;
          if (v49 <= 0) {
            v50 += v45 + v45 * (v50 / v45);
          }
          *(_DWORD *)(v5 + 4 * v10) = v50 % v45;
          a4 = v170;
          a3 = v169;
          int v13 = v168;
          if (v48 >= 1)
          {
            do
            {
              float32x4_t v51 = vaddq_f32(*v47, v178);
              float32x4_t v52 = vaddq_f32(v47[1], v178);
              float32x4_t v53 = vdivq_f32(v51, (float32x4_t)vandq_s8((int8x16_t)v51, v177));
              float32x4_t v54 = vdivq_f32(v52, (float32x4_t)vandq_s8((int8x16_t)v52, v177));
              v55.i64[0] = 0x7E0000007ELL;
              v55.i64[1] = 0x7E0000007ELL;
              int32x4_t v56 = vsraq_n_s32(v55, (int32x4_t)v52, 0x17uLL);
              v52.i64[0] = 0x7E0000007ELL;
              v52.i64[1] = 0x7E0000007ELL;
              *long long v47 = vmlaq_f32(vmlaq_f32(v172, v53, vmlaq_f32(v173, v53, vmlaq_f32(v174, v53, vmlaq_f32(v175, v176, v53)))), v171, vcvtq_f32_s32(vsraq_n_s32((int32x4_t)v52, (int32x4_t)v51, 0x17uLL)));
              v47[1] = vmlaq_f32(vmlaq_f32(v172, v54, vmlaq_f32(v173, v54, vmlaq_f32(v174, v54, vmlaq_f32(v175, v176, v54)))), v171, vcvtq_f32_s32(v56));
              float32x4_t v57 = vaddq_f32(v47[2], v178);
              float32x4_t v58 = vaddq_f32(v47[3], v178);
              float32x4_t v59 = vdivq_f32(v57, (float32x4_t)vandq_s8((int8x16_t)v57, v177));
              float32x4_t v60 = vdivq_f32(v58, (float32x4_t)vandq_s8((int8x16_t)v58, v177));
              v56.i64[0] = 0x7E0000007ELL;
              v56.i64[1] = 0x7E0000007ELL;
              int32x4_t v61 = vsraq_n_s32(v56, (int32x4_t)v58, 0x17uLL);
              v58.i64[0] = 0x7E0000007ELL;
              v58.i64[1] = 0x7E0000007ELL;
              v47[2] = vmlaq_f32(vmlaq_f32(v172, v59, vmlaq_f32(v173, v59, vmlaq_f32(v174, v59, vmlaq_f32(v175, v176, v59)))), v171, vcvtq_f32_s32(vsraq_n_s32((int32x4_t)v58, (int32x4_t)v57, 0x17uLL)));
              void v47[3] = vmlaq_f32(vmlaq_f32(v172, v60, vmlaq_f32(v173, v60, vmlaq_f32(v174, v60, vmlaq_f32(v175, v176, v60)))), v171, vcvtq_f32_s32(v61));
              v47 += 4;
              --v48;
            }
            while (v48);
          }
          int v62 = 16;
          goto LABEL_37;
        }
        uint64_t result = 0;
        if (v15 < 32 || (v16 & 7) != 0) {
          return result;
        }
        std::string::size_type v64 = (float32x4_t *)(a3 + 4 * v8);
        int v65 = *a5;
        int v66 = v16 / 8;
        int v67 = v11;
        if ((int)a4 >= 1)
        {
          id v68 = (float32x4_t *)(v5 + 4 * v8);
          id v69 = (float32x4_t *)(*(void *)a1 + 32 * v8);
          float32x4_t v70 = v69[2];
          float32x4_t v183 = *v69;
          float32x4_t v184 = v69[1];
          long long v71 = (float32x4_t *)(v179 + 4 * v8);
          float32x4_t v72 = v69[4];
          float32x4_t v182 = v69[3];
          __int16 v73 = (float32x4_t *)(*(void *)(a1 + 8) + 32 * v8);
          float32x4_t v74 = v69[5];
          float32x4_t v75 = v69[6];
          long long v76 = (float32x4_t *)(*(void *)(a1 + 16) + 32 * v8);
          std::string v77 = (const float *)(a1 + 24);
          float32x4_t v78 = v69[7];
          float32x4_t v80 = *v73;
          float32x4_t v79 = v73[1];
          float32x4_t v82 = v73[2];
          float32x4_t v81 = v73[3];
          float32x4_t v84 = v73[4];
          float32x4_t v83 = v73[5];
          float32x4_t v86 = v73[6];
          float32x4_t v85 = v73[7];
          float32x4_t v88 = *v76;
          float32x4_t v87 = v76[1];
          float32x4_t v90 = v76[2];
          float32x4_t v89 = v76[3];
          float32x4_t v92 = v76[4];
          float32x4_t v91 = v76[5];
          float32x4_t v94 = v76[6];
          float32x4_t v93 = v76[7];
          unint64_t v95 = (float *)a2;
          float32x4_t v96 = vld1q_dup_f32(v77);
          uint64_t v97 = v165;
          int v67 = v11;
          int64x2_t v98 = (float32x4_t *)(a3 + 4 * v8);
          int v99 = *(_DWORD *)(a1 + 32);
          do
          {
            float v100 = *v95 - *(float *)(v9 + 4);
            *(_DWORD *)(v9 + 4) = *(_DWORD *)v9;
            *(float *)unint64_t v9 = *v95;
            float32x4_t v101 = vmlaq_n_f32(v68[1], v184, v100);
            float32x4_t v102 = vmlaq_n_f32(*v68, v183, v100);
            float32x4_t v103 = vmlaq_n_f32(v68[3], v182, v100);
            float32x4_t v104 = vmlaq_n_f32(v68[2], v70, v100);
            float32x4_t v105 = vmlaq_n_f32(v68[5], v74, v100);
            float32x4_t v106 = vmlaq_n_f32(v68[4], v72, v100);
            float32x4_t v107 = vmlaq_n_f32(v68[7], v78, v100);
            float32x4_t v108 = vmlaq_n_f32(v68[6], v75, v100);
            float32x4_t v109 = vmlaq_f32(v68[9], v101, v79);
            *id v68 = vmlaq_f32(v68[8], v102, v80);
            v68[1] = v109;
            float32x4_t v110 = vmlaq_f32(v68[11], v103, v81);
            v68[2] = vmlaq_f32(v68[10], v104, v82);
            v68[3] = v110;
            float32x4_t v111 = vmlaq_f32(v68[13], v105, v83);
            v68[4] = vmlaq_f32(v68[12], v106, v84);
            v68[5] = v111;
            float32x4_t v112 = vmlaq_f32(v68[15], v107, v85);
            v68[6] = vmlaq_f32(v68[14], v108, v86);
            v68[7] = v112;
            v68[8] = vmulq_f32(v88, v102);
            v68[9] = vmulq_f32(v87, v101);
            v68[10] = vmulq_f32(v90, v104);
            v68[11] = vmulq_f32(v89, v103);
            v68[12] = vmulq_f32(v92, v106);
            v68[13] = vmulq_f32(v91, v105);
            v68[14] = vmulq_f32(v94, v108);
            v68[15] = vmulq_f32(v93, v107);
            float32x4_t v113 = vmulq_f32(v101, v101);
            float32x4_t v114 = vmulq_f32(v102, v102);
            float32x4_t v115 = vmulq_f32(v103, v103);
            float32x4_t v116 = vmulq_f32(v104, v104);
            float32x4_t v117 = vmulq_f32(v105, v105);
            float32x4_t v118 = vmulq_f32(v106, v106);
            float32x4_t v119 = vmulq_f32(v107, v107);
            float32x4_t v120 = vmulq_f32(v108, v108);
            float32x4_t v121 = vmlaq_f32(v113, v96, vsubq_f32(v71[1], v113));
            float32x4_t v122 = vmlaq_f32(v114, v96, vsubq_f32(*v71, v114));
            float32x4_t v123 = vmlaq_f32(v115, v96, vsubq_f32(v71[3], v115));
            float32x4_t v124 = vmlaq_f32(v116, v96, vsubq_f32(v71[2], v116));
            float32x4_t v125 = vmlaq_f32(v117, v96, vsubq_f32(v71[5], v117));
            float32x4_t v126 = vmlaq_f32(v118, v96, vsubq_f32(v71[4], v118));
            float32x4_t v127 = vsubq_f32(v71[6], v120);
            float32x4_t v128 = vsubq_f32(v71[7], v119);
            float32x4_t *v71 = v122;
            v71[1] = v121;
            v71[2] = v124;
            v71[3] = v123;
            float32x4_t v129 = vmlaq_f32(v119, v96, v128);
            float32x4_t v130 = vmlaq_f32(v120, v96, v127);
            float32x4_t v131 = vmlaq_f32(v121, v96, vsubq_f32(v71[9], v121));
            float32x4_t v132 = vmlaq_f32(v122, v96, vsubq_f32(v71[8], v122));
            float32x4_t v133 = vmlaq_f32(v123, v96, vsubq_f32(v71[11], v123));
            float32x4_t v134 = vmlaq_f32(v124, v96, vsubq_f32(v71[10], v124));
            v71[4] = v126;
            v71[5] = v125;
            v71[10] = v134;
            v71[11] = v133;
            float32x4_t v135 = vmlaq_f32(v125, v96, vsubq_f32(v71[13], v125));
            float32x4_t v136 = vmlaq_f32(v126, v96, vsubq_f32(v71[12], v126));
            v71[6] = v130;
            v71[7] = v129;
            v71[12] = v136;
            v71[13] = v135;
            float32x4_t v137 = vmlaq_f32(v129, v96, vsubq_f32(v71[15], v129));
            v71[14] = vmlaq_f32(v130, v96, vsubq_f32(v71[14], v130));
            v71[15] = v137;
            v71[8] = v132;
            v71[9] = v131;
            if (++v67 >= v99)
            {
              int v67 = 0;
              *int64x2_t v98 = v132;
              v98[1] = v131;
              float32x4_t v138 = v71[11];
              v98[2] = v71[10];
              v98[3] = v138;
              float32x4_t v139 = v71[13];
              v98[4] = v71[12];
              v98[5] = v139;
              float32x4_t v140 = v71[15];
              v98[6] = v71[14];
              v98[7] = v140;
              v98 += 2 * v66;
            }
            ++v95;
            --v97;
          }
          while (v97);
        }
        *(_DWORD *)(v5 + 4 * v10) = v67;
        if (v65 < 1)
        {
          int v62 = 32;
          uint64_t v12 = v166;
          goto LABEL_37;
        }
        uint64_t v141 = 32 * v66;
        v142 = (float32x4_t *)(v164 + 4 * v8);
        uint64_t v12 = v166;
        do
        {
          float32x4_t v143 = vaddq_f32(v64[1], v178);
          float32x4_t v144 = vaddq_f32(*v64, v178);
          float32x4_t v145 = vdivq_f32(v143, (float32x4_t)vandq_s8((int8x16_t)v143, v177));
          float32x4_t v146 = vdivq_f32(v144, (float32x4_t)vandq_s8((int8x16_t)v144, v177));
          v147.i64[0] = 0x7E0000007ELL;
          v147.i64[1] = 0x7E0000007ELL;
          int32x4_t v148 = vsraq_n_s32(v147, (int32x4_t)v144, 0x17uLL);
          v144.i64[0] = 0x7E0000007ELL;
          v144.i64[1] = 0x7E0000007ELL;
          v142[-4] = vmlaq_f32(vmlaq_f32(v172, v146, vmlaq_f32(v173, v146, vmlaq_f32(v174, v146, vmlaq_f32(v175, v176, v146)))), v171, vcvtq_f32_s32(v148));
          v142[-3] = vmlaq_f32(vmlaq_f32(v172, v145, vmlaq_f32(v173, v145, vmlaq_f32(v174, v145, vmlaq_f32(v175, v176, v145)))), v171, vcvtq_f32_s32(vsraq_n_s32((int32x4_t)v144, (int32x4_t)v143, 0x17uLL)));
          float32x4_t v149 = vaddq_f32(v64[3], v178);
          float32x4_t v150 = vaddq_f32(v64[2], v178);
          float32x4_t v151 = vdivq_f32(v149, (float32x4_t)vandq_s8((int8x16_t)v149, v177));
          float32x4_t v152 = vdivq_f32(v150, (float32x4_t)vandq_s8((int8x16_t)v150, v177));
          v148.i64[0] = 0x7E0000007ELL;
          v148.i64[1] = 0x7E0000007ELL;
          int32x4_t v153 = vsraq_n_s32(v148, (int32x4_t)v150, 0x17uLL);
          v150.i64[0] = 0x7E0000007ELL;
          v150.i64[1] = 0x7E0000007ELL;
          v142[-2] = vmlaq_f32(vmlaq_f32(v172, v152, vmlaq_f32(v173, v152, vmlaq_f32(v174, v152, vmlaq_f32(v175, v176, v152)))), v171, vcvtq_f32_s32(v153));
          v142[-1] = vmlaq_f32(vmlaq_f32(v172, v151, vmlaq_f32(v173, v151, vmlaq_f32(v174, v151, vmlaq_f32(v175, v176, v151)))), v171, vcvtq_f32_s32(vsraq_n_s32((int32x4_t)v150, (int32x4_t)v149, 0x17uLL)));
          float32x4_t v154 = vaddq_f32(v64[5], v178);
          float32x4_t v155 = vaddq_f32(v64[4], v178);
          float32x4_t v156 = vdivq_f32(v154, (float32x4_t)vandq_s8((int8x16_t)v154, v177));
          float32x4_t v157 = vdivq_f32(v155, (float32x4_t)vandq_s8((int8x16_t)v155, v177));
          v153.i64[0] = 0x7E0000007ELL;
          v153.i64[1] = 0x7E0000007ELL;
          int32x4_t v158 = vsraq_n_s32(v153, (int32x4_t)v155, 0x17uLL);
          v155.i64[0] = 0x7E0000007ELL;
          v155.i64[1] = 0x7E0000007ELL;
          float32x4_t *v142 = vmlaq_f32(vmlaq_f32(v172, v157, vmlaq_f32(v173, v157, vmlaq_f32(v174, v157, vmlaq_f32(v175, v176, v157)))), v171, vcvtq_f32_s32(v158));
          v142[1] = vmlaq_f32(vmlaq_f32(v172, v156, vmlaq_f32(v173, v156, vmlaq_f32(v174, v156, vmlaq_f32(v175, v176, v156)))), v171, vcvtq_f32_s32(vsraq_n_s32((int32x4_t)v155, (int32x4_t)v154, 0x17uLL)));
          float32x4_t v159 = vaddq_f32(v64[7], v178);
          float32x4_t v160 = vaddq_f32(v64[6], v178);
          float32x4_t v161 = vdivq_f32(v159, (float32x4_t)vandq_s8((int8x16_t)v159, v177));
          float32x4_t v162 = vdivq_f32(v160, (float32x4_t)vandq_s8((int8x16_t)v160, v177));
          v158.i64[0] = 0x7E0000007ELL;
          v158.i64[1] = 0x7E0000007ELL;
          int32x4_t v163 = vsraq_n_s32(v158, (int32x4_t)v160, 0x17uLL);
          v160.i64[0] = 0x7E0000007ELL;
          v160.i64[1] = 0x7E0000007ELL;
          v142[2] = vmlaq_f32(vmlaq_f32(v172, v162, vmlaq_f32(v173, v162, vmlaq_f32(v174, v162, vmlaq_f32(v175, v176, v162)))), v171, vcvtq_f32_s32(v163));
          v142[3] = vmlaq_f32(vmlaq_f32(v172, v161, vmlaq_f32(v173, v161, vmlaq_f32(v174, v161, vmlaq_f32(v175, v176, v161)))), v171, vcvtq_f32_s32(vsraq_n_s32((int32x4_t)v160, (int32x4_t)v159, 0x17uLL)));
          v142 = (float32x4_t *)((char *)v142 + v141);
          v64 += 8;
          --v65;
        }
        while (v65);
      }
      int v62 = 32;
LABEL_37:
      v8 += v62;
      LODWORD(v6) = *(_DWORD *)(a1 + 28);
    }
    while ((int)v8 < (int)v6);
  }
  return 1;
}

id sub_1DCB4FC58(uint64_t a1, void *a2, int *a3, int a4, int *a5, int a6, uint64_t a7)
{
  v142[1] = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = objc_alloc(MEMORY[0x1E4F1E9A8]);
  unint64_t v13 = 0x1E4F28000uLL;
  uint64_t v129 = a1;
  int v14 = [NSNumber numberWithInt:a1];
  v142[0] = v14;
  int v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v142 count:1];
  int v16 = (void *)[v12 initWithShape:v15 dataType:65568 error:a7];

  if (v16)
  {
    id v115 = v16;
    __B = (float *)[v115 dataPointer];
    id v17 = objc_alloc(MEMORY[0x1E4F1E9A8]);
    int v136 = a6;
    uint64_t v18 = (a6 + a4);
    unint64_t v19 = [NSNumber numberWithInt:v18];
    uint64_t v141 = v19;
    int v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v141 count:1];
    int v21 = (void *)[v17 initWithShape:v20 dataType:65568 error:a7];

    if (v21)
    {
      float32x4_t v137 = v11;
      float32x4_t v116 = v21;
      __C = (float *)[v21 dataPointer];
      id v22 = objc_alloc(MEMORY[0x1E4F1E9A8]);
      float32x4_t v23 = [NSNumber numberWithInt:v18];
      float32x4_t v140 = v23;
      float32x4_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v140 count:1];
      float32x4_t v25 = (void *)[v22 initWithShape:v24 dataType:65568 error:a7];

      if (v25)
      {
        int v125 = a4;
        float32x4_t v123 = (float *)[v25 dataPointer];
        id v26 = objc_alloc(MEMORY[0x1E4F1E9A8]);
        int v27 = v129;
        int32x4_t v28 = [NSNumber numberWithInt:v129];
        v139[0] = v28;
        int v118 = v18;
        float32x4_t v29 = [NSNumber numberWithInt:v18];
        v139[1] = v29;
        float32x4_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v139 count:2];
        float32x4_t v31 = (void *)[v26 initWithShape:v30 dataType:65568 error:a7];

        if (v31)
        {
          uint64_t v120 = a7;
          float32x4_t v114 = v16;
          float32x4_t v112 = v31;
          id v32 = v31;
          uint64_t v33 = [v32 dataPointer];
          float32x4_t v34 = [v32 strides];
          float32x4_t v35 = [v34 objectAtIndexedSubscript:0];
          int v36 = [v35 intValue];

          float32x4_t v37 = [v32 strides];
          int32x4_t v38 = [v37 objectAtIndexedSubscript:1];
          int v39 = [v38 intValue];

          float32x4_t v113 = v25;
          __A = (float *)v33;
          if ((int)v129 <= 0)
          {
            int v69 = v125;
            uint64_t v71 = v125;
            uint64_t v70 = v36;
            uint64_t v134 = v136;
            uint64_t v135 = v125;
            uint64_t v132 = v129;
            id v68 = v137;
          }
          else
          {
            uint64_t v40 = 0;
            uint64_t v110 = v39;
            uint64_t v111 = v36;
            uint64_t v132 = v129;
            float32x4_t v126 = (float *)(4 * v36);
            uint64_t v41 = 4 * v39;
            float32x4_t v42 = (_DWORD *)v33;
            int v43 = v125;
            uint64_t v135 = v125;
            do
            {
              long long v44 = a3;
              float32x4_t v133 = v42;
              uint64_t v45 = v125;
              if (v43 >= 1)
              {
                do
                {
                  int v46 = (void *)MEMORY[0x1E4F1C978];
                  long long v47 = [NSNumber numberWithInteger:0];
                  uint64_t v48 = *v44++;
                  int v49 = [NSNumber numberWithInteger:v48];
                  int v50 = [NSNumber numberWithInteger:v40];
                  float32x4_t v51 = objc_msgSend(v46, "arrayWithObjects:", v47, v49, v50, 0);
                  float32x4_t v52 = [v137 objectForKeyedSubscript:v51];
                  [v52 floatValue];
                  _DWORD *v42 = v53;

                  unint64_t v13 = 0x1E4F28000uLL;
                  float32x4_t v42 = (_DWORD *)((char *)v42 + v41);
                  --v45;
                }
                while (v45);
              }
              ++v40;
              int v43 = v125;
              float32x4_t v42 = (_DWORD *)((char *)v126 + (void)v133);
            }
            while (v40 != v129);
            uint64_t v54 = 0;
            int v55 = v136;
            uint64_t v134 = v136;
            int32x4_t v56 = &__A[(int)v110 * (uint64_t)v125];
            do
            {
              float32x4_t v57 = a5;
              float32x4_t v127 = v56;
              uint64_t v58 = v136;
              if (v55 >= 1)
              {
                do
                {
                  float32x4_t v59 = (void *)MEMORY[0x1E4F1C978];
                  float32x4_t v60 = [*(id *)(v13 + 3792) numberWithInteger:0];
                  uint64_t v61 = *v57++;
                  int v62 = [*(id *)(v13 + 3792) numberWithInteger:v61];
                  [*(id *)(v13 + 3792) numberWithInteger:v54];
                  v64 = uint64_t v63 = v54;
                  int v65 = objc_msgSend(v59, "arrayWithObjects:", v60, v62, v64, 0);
                  int v66 = [v137 objectForKeyedSubscript:v65];
                  [v66 floatValue];
                  *(_DWORD *)int32x4_t v56 = v67;

                  unint64_t v13 = 0x1E4F28000;
                  uint64_t v54 = v63;

                  v56 += v110;
                  --v58;
                }
                while (v58);
              }
              ++v54;
              int32x4_t v56 = &v127[v111];
              int v55 = v136;
            }
            while (v54 != v129);
            bzero(__B, 4 * v129);
            id v68 = v137;
            int v69 = v125;
            int v27 = v129;
            uint64_t v71 = v125;
            uint64_t v70 = v111;
          }
          uint64_t v73 = [v68 dataPointer];
          int v74 = 0;
          vDSP_Length v75 = v27;
          vDSP_Length v76 = v118;
          double v77 = -0.03 / (double)v118;
          float32x4_t v128 = &__C[v71];
          float32x4_t v119 = &v123[v71];
          uint64_t v78 = 4 * v70;
          while (1)
          {
            int v122 = v74;
            float32x4_t v79 = a3;
            float32x4_t v80 = __C;
            uint64_t v81 = v135;
            if (v69 >= 1)
            {
              do
              {
                int v82 = *v79++;
                vDSP_dotpr((const float *)(v73 + 4 * v82 * (int)v129), 1, __B, 1, v80++, v75);
                --v81;
              }
              while (v81);
            }
            float32x4_t v83 = a5;
            float32x4_t v84 = v128;
            uint64_t v85 = v134;
            if (v136 >= 1)
            {
              do
              {
                int v86 = *v83++;
                vDSP_dotpr((const float *)(v73 + 4 * v86 * (int)v129), 1, __B, 1, v84++, v75);
                --v85;
              }
              while (v85);
            }
            float32x4_t v88 = v123;
            float32x4_t v87 = __C;
            uint64_t v89 = v135;
            if (v69 >= 1)
            {
              do
              {
                float v90 = *v87++;
                float v91 = 1.0 / (exp((float)-v90) + 1.0) + -1.0;
                *v88++ = v91;
                --v89;
              }
              while (v89);
            }
            float32x4_t v92 = v128;
            float32x4_t v93 = v119;
            uint64_t v94 = v134;
            if (v136 >= 1)
            {
              do
              {
                float v95 = *v92++;
                float v96 = 1.0 / (exp((float)-v95) + 1.0);
                *v93++ = v96;
                --v94;
              }
              while (v94);
            }
            id v97 = objc_alloc(MEMORY[0x1E4F1E9A8]);
            int64x2_t v98 = [NSNumber numberWithInt:v129];
            float32x4_t v138 = v98;
            int v99 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v138 count:1];
            float v100 = (void *)[v97 initWithShape:v99 dataType:65568 error:v120];

            if (!v100) {
              break;
            }
            id v101 = v100;
            uint64_t v102 = [v101 dataPointer];
            if ((int)v129 >= 1)
            {
              float32x4_t v103 = (float *)v102;
              float32x4_t v104 = __A;
              float32x4_t v105 = __B;
              uint64_t v106 = v132;
              do
              {
                vDSP_dotpr(v104, 1, v123, 1, v103, v76);
                float v107 = *v103++;
                float v108 = *v105 + v77 * v107;
                *v105++ = v108;
                float32x4_t v104 = (const float *)((char *)v104 + v78);
                --v106;
              }
              while (v106);
            }

            int v74 = v122 + 1;
            int v69 = v125;
            if (v122 == 1499)
            {
              id v72 = v115;
              goto LABEL_36;
            }
          }
          id v72 = 0;
LABEL_36:
          float32x4_t v25 = v113;
          int v16 = v114;
          float32x4_t v31 = v112;
        }
        else
        {
          id v72 = 0;
        }
      }
      else
      {
        id v72 = 0;
      }
      int v21 = v116;

      id v11 = v137;
    }
    else
    {
      id v72 = 0;
    }
  }
  else
  {
    id v72 = 0;
  }

  return v72;
}

uint64_t sub_1DCB504DC(int a1, uint32_t __upper_bound)
{
  return arc4random_uniform(__upper_bound);
}

uint64_t sub_1DCB50594(uint64_t a1, unsigned int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1103515245
                                                              * *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24)
                                                              + 12345;
  return (*(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 26) & 0x7FFFu) % a2;
}

id sub_1DCB505D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc(MEMORY[0x1E4F1E9A8]);
  size_t v7 = [NSNumber numberWithInt:a2];
  v25[0] = v7;
  unsigned int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  unint64_t v9 = (void *)[v6 initWithShape:v8 dataType:65568 error:a3];

  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = [v10 dataPointer];
    id v12 = objc_alloc(MEMORY[0x1E4F1E9A8]);
    unint64_t v13 = [NSNumber numberWithInt:a2];
    float32x4_t v24 = v13;
    int v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
    int v15 = (void *)[v12 initWithShape:v14 dataType:65568 error:a3];

    if (v15)
    {
      int v16 = (_DWORD *)[v15 dataPointer];
      _DWORD *v16 = 0;
      if ((int)a2 >= 2)
      {
        uint64_t v17 = 0;
        uint64_t v18 = (float *)(v16 + 1);
        do
        {
          uint64_t v19 = v17 + 1;
          float v20 = *(v18 - 1) + *(float *)(a1 + 4 + 4 * v17);
          *uint64_t v18 = v20;
          float v21 = 0.0;
          if ((unint64_t)(v17 + 1) >= 0x14) {
            float v21 = (float)(v20 - *(v18 - 20)) / 20.0;
          }
          *(float *)(v11 + 4 * v17) = v21;
          ++v18;
          ++v17;
        }
        while (a2 - 1 != v19);
      }
      id v22 = v10;
    }
    else
    {
      id v22 = 0;
    }
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

id sub_1DCB507D8(float *a1, uint64_t a2, uint64_t a3)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc(MEMORY[0x1E4F1E9A8]);
  size_t v7 = [NSNumber numberWithInt:a2];
  v15[0] = v7;
  unsigned int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  unint64_t v9 = (void *)[v6 initWithShape:v8 dataType:131104 error:a3];

  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = (_DWORD *)[v10 dataPointer];
    if ((int)a2 >= 1)
    {
      uint64_t v12 = a2;
      do
      {
        *uint64_t v11 = 0;
        if (*a1 > 0.8) {
          *uint64_t v11 = 1;
        }
        ++a1;
        ++v11;
        --v12;
      }
      while (v12);
    }
    id v13 = v10;
  }

  return v9;
}

id sub_1DCB5091C(uint64_t a1, int a2, int a3, int a4, int32_t a5, void *a6, uint64_t a7, float a8)
{
  v65[1] = *MEMORY[0x1E4F143B8];
  id v15 = a6;
  int v16 = (void *)[objc_alloc(MEMORY[0x1E4F1E9A8]) initWithShape:&unk_1F3818E58 dataType:131104 error:a7];
  if (!v16)
  {
    id v22 = 0;
    goto LABEL_46;
  }
  id v59 = v16;
  uint64_t v17 = [v16 dataPointer];
  uint64_t v18 = (int *)v17;
  if (a2 < 2)
  {
    int v20 = 0;
  }
  else
  {
    uint64_t v19 = 0;
    int v20 = 0;
    do
    {
      if (*(_DWORD *)(a1 + 4 * v19) != *(_DWORD *)(a1 + 4 * v19 + 4))
      {
        if ((int)v19 <= 20) {
          int v21 = 20;
        }
        else {
          int v21 = v19;
        }
        *(_DWORD *)(v17 + 4 * v20++) = v21 - 20;
      }
      ++v19;
    }
    while (a2 - 1 != v19);
  }
  id v23 = objc_alloc(MEMORY[0x1E4F1E9A8]);
  float32x4_t v24 = [NSNumber numberWithInt:(v20 + 1)];
  v65[0] = v24;
  float32x4_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:1];
  id v26 = (void *)[v23 initWithShape:v25 dataType:131104 error:a7];

  if (!v26)
  {
    id v22 = 0;
    goto LABEL_45;
  }
  uint64_t v27 = [v26 dataPointer];
  uint64_t v28 = v27;
  uint64_t v58 = v26;
  if (v20 < 1)
  {
    uint64_t v30 = 0;
    goto LABEL_30;
  }
  char v29 = 0;
  uint64_t v30 = 0;
  int v31 = 0;
  char v32 = 1;
  uint64_t v33 = v20;
  do
  {
    int v34 = *v18;
    if ((v32 & 1) == 0)
    {
      char v29 = 1;
      int v31 = *v18;
      goto LABEL_24;
    }
    if ((v29 & 1) == 0)
    {
      int v36 = 1;
      int v35 = v30;
      goto LABEL_22;
    }
    if (v34 - v31 > a3)
    {
      *(_DWORD *)(v27 + 4 * (int)v30) = v31;
      int v35 = v30 + 1;
      int v34 = *v18;
      int v36 = 2;
LABEL_22:
      *(_DWORD *)(v27 + 4 * v35) = v34;
      uint64_t v30 = (v36 + v30);
      goto LABEL_24;
    }
    char v29 = 1;
LABEL_24:
    v32 ^= 1u;
    ++v18;
    --v33;
  }
  while (v33);
  if ((int)v30 > 0 && v31 != *(_DWORD *)(v27 + 4 * (v30 - 1)))
  {
    *(_DWORD *)(v27 + 4 * v30) = v31;
    uint64_t v30 = (v30 + 1);
  }
LABEL_30:
  id v37 = objc_alloc(MEMORY[0x1E4F1E9A8]);
  int32x4_t v38 = [NSNumber numberWithInt:v30];
  std::string::size_type v64 = v38;
  int v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
  uint64_t v40 = (void *)[v37 initWithShape:v39 dataType:131104 error:a7];

  if (v40)
  {
    uint64_t v41 = [v40 dataPointer];
    uint64_t v42 = v41;
    if ((int)v30 < 2)
    {
      int v43 = 0;
    }
    else
    {
      int v43 = 0;
      uint64_t v44 = v30 >> 1;
      uint64_t v45 = (_DWORD *)(v28 + 4);
      do
      {
        int v46 = *(v45 - 1);
        if (*v45 - v46 + 1 > a4)
        {
          long long v47 = (_DWORD *)(v41 + 4 * v43);
          *long long v47 = v46;
          v47[1] = *v45 + 1;
          v43 += 2;
        }
        v45 += 2;
        --v44;
      }
      while (v44);
    }
    id v22 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:20];
    if (v43 >= 2)
    {
      uint64_t v48 = v43 >> 1;
      int v49 = (_DWORD *)(v42 + 4);
      do
      {
        int v50 = objc_alloc_init(SNKShotSegment);
        [(SNKShotSegment *)v50 setUrl:v15];
        id v51 = v15;
        int v52 = *v49 * a5 / 100 + (int)(float)((float)a5 * a8);
        int v53 = v52 - 10 * a5;
        unint64_t v54 = 1374389535 * *(v49 - 1) * a5;
        int v55 = (v54 >> 63) + (SHIDWORD(v54) >> 5);
        if (v53 <= v55) {
          int v53 = v55;
        }
        CMTimeMake(&start, v53, a5);
        int64_t v56 = v52;
        id v15 = v51;
        CMTimeMake(&end, v56, a5);
        CMTimeRangeFromTimeToTime(&v63, &start, &end);
        CMTimeRange v60 = v63;
        [(SNKShotSegment *)v50 setTimeRange:&v60];
        [v22 addObject:v50];

        v49 += 2;
        --v48;
      }
      while (v48);
    }
  }
  else
  {
    id v22 = 0;
  }

  id v26 = v58;
LABEL_45:

  int v16 = v59;
LABEL_46:

  return v22;
}

SNKShotSegment *sub_1DCB50D90(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  self;
  unint64_t v5 = objc_alloc_init(SNKShotSegment);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  id v6 = [v4 url];
  id v23 = 0;
  +[SNAudioFileUtils getTimeRangeEncompassingEntireAudioFileAtURL:v6 error:&v23];
  id v7 = v23;

  unsigned int v8 = [v4 url];
  [(SNKShotSegment *)v5 setUrl:v8];

  if (v4) {
    [v4 timeRange];
  }
  else {
    memset(v19, 0, 48);
  }
  v18[0] = v24;
  v18[1] = v25;
  v18[2] = v26;
  +[SNTimeUtils clipTimeRange:v19 toBounds:v18];
  v17[0] = v20;
  v17[1] = v21;
  v17[2] = v22;
  [(SNKShotSegment *)v5 setTimeRange:v17];
  if (v5)
  {
    [(SNKShotSegment *)v5 timeRange];
    if (BYTE12(v14))
    {
      [(SNKShotSegment *)v5 timeRange];
      if (v13)
      {
        if (v7) {
          goto LABEL_8;
        }
LABEL_12:
        unint64_t v9 = v5;
        goto LABEL_13;
      }
    }
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v14 = 0u;
  }
  id v12 = v7;
  +[SNError populateClientError:&v12 withCode:1 underlyingError:v7 message:@"Failed to clip segment to file."];
  id v10 = v12;

  id v7 = v10;
  if (!v10) {
    goto LABEL_12;
  }
LABEL_8:
  unint64_t v9 = 0;
  if (a3) {
    *a3 = v7;
  }
LABEL_13:

  return v9;
}

SNKShotSegment *sub_1DCB50F90(uint64_t a1, long long *a2, void *a3, SNKShotSegment **a4)
{
  id v6 = a3;
  self;
  id v7 = (SNKShotSegment *)v6;
  unsigned int v8 = v7;
  if (v7)
  {
    [(SNKShotSegment *)v7 timeRange];
  }
  else
  {
    memset(v20, 0, sizeof(v20));
    long long v19 = 0u;
  }
  CMTime time1 = *(CMTime *)((char *)v20 + 8);
  *(_OWORD *)&time2.start.value = *a2;
  time2.start.epoch = *((void *)a2 + 2);
  unint64_t v9 = v8;
  if (CMTimeCompare(&time1, &time2.start) != -1) {
    goto LABEL_9;
  }
  long long v17 = *a2;
  CMTimeEpoch v18 = *((void *)a2 + 2);
  id v10 = v8;
  self;
  unint64_t v9 = objc_alloc_init(SNKShotSegment);
  uint64_t v11 = [(SNKShotSegment *)v10 url];
  [(SNKShotSegment *)v9 setUrl:v11];

  if (v8)
  {
    [(SNKShotSegment *)v10 timeRange];
    *(_OWORD *)&start.value = v25;
    start.epoch = v26;
    [(SNKShotSegment *)v10 timeRange];
    int32_t v12 = v23;
  }
  else
  {
    int32_t v12 = 0;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v25 = 0u;
    memset(&start, 0, sizeof(start));
    memset(&v22[48], 0, 32);
    long long v23 = 0u;
  }
  *(_OWORD *)&time2.start.value = v17;
  time2.start.epoch = v18;
  CMTimeConvertScale(&duration, &time2.start, v12, kCMTimeRoundingMethod_RoundAwayFromZero);
  CMTimeRangeMake(&time2, &start, &duration);
  *(CMTimeRange *)long long v22 = time2;
  [(SNKShotSegment *)v9 setTimeRange:v22];

  if (v9) {
    goto LABEL_9;
  }
  id v16 = 0;
  +[SNError populateClientError:&v16 withCode:1 underlyingError:0 message:@"Failed resize segment."];
  long long v15 = (SNKShotSegment *)v16;
  unint64_t v9 = v15;
  if (v15)
  {
    if (a4)
    {
      unint64_t v9 = v15;
      char v13 = 0;
      *a4 = v9;
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
LABEL_9:
    char v13 = v9;
    unint64_t v9 = 0;
  }

  return v13;
}

id sub_1DCB511D0(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  id v10 = a3;
  id v11 = a4;
  self;
  int32_t v12 = [[SNCreateFeaturePrintRequest alloc] initWithFeaturePrintType:a2];
  if (v12)
  {
    if (v11)
    {
      [v11 CMTimeValue];
      long long v37 = v39;
      uint64_t v38 = v40;
      [(SNCreateFeaturePrintRequest *)v12 setWindowDuration:&v37];
    }
    if (!a5)
    {
      [0 doubleValue];
      *(float *)&double v13 = v13;
      [(SNCreateFeaturePrintRequest *)v12 setOverlapFactor:v13];
    }
  }
  else
  {
    id v41 = 0;
    +[SNError populateClientError:&v41 withCode:1 underlyingError:0 message:@"Failed to allocate resources."];
    id v14 = v41;
    if (v14)
    {
      id v15 = v14;
      id v16 = 0;
      goto LABEL_21;
    }
  }
  long long v17 = v12;
  id v18 = v10;
  self;
  long long v19 = objc_alloc_init(SNResultsCollector);
  if (!v19)
  {
    v47[0] = 0;
    +[SNError populateClientError:v47 withCode:1 underlyingError:0 message:@"Failed to allocate resources."];
    id v24 = v47[0];
    if (v24)
    {
      id v23 = v24;
      long long v22 = 0;
      goto LABEL_18;
    }
  }
  long long v20 = [SNAudioFileAnalyzer alloc];
  long long v21 = [v18 url];
  id v46 = 0;
  long long v22 = [(SNAudioFileAnalyzer *)v20 initWithURL:v21 error:&v46];
  id v23 = v46;

  if (v22)
  {
    if (v23)
    {
LABEL_18:
      id v28 = v23;
      id v16 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    id v45 = v23;
    +[SNError populateClientError:&v45 withCode:1 underlyingError:v23 message:@"Failed to initialize analyzer."];
    id v25 = v45;

    id v23 = v25;
    if (v25) {
      goto LABEL_18;
    }
  }
  id v44 = 0;
  BOOL v26 = [(SNAudioFileAnalyzer *)v22 addRequest:v17 withObserver:v19 error:&v44];
  id v23 = v44;
  if (!v26)
  {
    id v43 = v23;
    +[SNError populateClientError:&v43 withCode:1 underlyingError:v23 message:@"Failed to register request."];
    id v27 = v43;

    id v23 = v27;
  }
  if (v23) {
    goto LABEL_18;
  }
  if (v18) {
    [v18 timeRange];
  }
  else {
    memset(v42, 0, sizeof(v42));
  }
  [(SNAudioFileAnalyzer *)v22 analyzeInRange:v42];
  uint64_t v33 = [(SNResultsCollector *)v19 errors];
  uint64_t v34 = [v33 count];

  if (v34)
  {
    int v35 = [(SNResultsCollector *)v19 errors];
    id v23 = [v35 objectAtIndexedSubscript:0];

    if (v23) {
      goto LABEL_18;
    }
  }
  id v16 = [(SNResultsCollector *)v19 results];
  id v28 = 0;
LABEL_19:

  id v29 = v28;
  id v15 = v29;
  if (v16)
  {
    if (v29) {
      goto LABEL_21;
    }
LABEL_24:
    id v16 = v16;
    uint64_t v30 = v16;
    goto LABEL_26;
  }
  id v36 = v29;
  +[SNError populateClientError:&v36 withCode:1 underlyingError:v29 message:@"Failed to perform request."];
  id v31 = v36;

  id v15 = v31;
  if (!v31) {
    goto LABEL_24;
  }
LABEL_21:
  if (a6)
  {
    id v15 = v15;
    uint64_t v30 = 0;
    *a6 = v15;
  }
  else
  {
    uint64_t v30 = 0;
  }
LABEL_26:

  return v30;
}

id sub_1DCB51598(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = self;
  id v17 = 0;
  unint64_t v9 = sub_1DCB511D0(v8, 5, v7, v6, 0, &v17);

  id v10 = v17;
  id v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_7;
    }
  }
  else
  {
    id v16 = v10;
    +[SNError populateClientError:&v16 withCode:1 underlyingError:v10 message:@"Failed to generate feature prints."];
    id v12 = v16;

    id v11 = v12;
    if (v12) {
      goto LABEL_7;
    }
  }
  if ([v9 count]
    || (id v15 = 0,
        +[SNError populateClientError:&v15 withCode:1 underlyingError:0 message:@"No feature prints generated."], (id v11 = v15) == 0))
  {
    double v13 = [v9 objectAtIndexedSubscript:0];
    id v11 = 0;
    goto LABEL_11;
  }
LABEL_7:
  if (a4)
  {
    id v11 = v11;
    double v13 = 0;
    *a4 = v11;
  }
  else
  {
    double v13 = 0;
  }
LABEL_11:

  return v13;
}

void sub_1DCB51968(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v3 = [v13 label];
  uint64_t v4 = [v3 type];
  unint64_t v5 = &unk_1F3818E40;
  if (!v4) {
    unint64_t v5 = &unk_1F3818E28;
  }
  id v6 = v5;

  uint64_t v7 = [v13 datasetType];
  if (v7 == 1)
  {
    id v11 = *(void **)(a1 + 48);
    id v12 = [v13 data];
    [v11 addObject:v12];

    id v10 = (id *)(a1 + 56);
  }
  else
  {
    if (v7) {
      goto LABEL_8;
    }
    uint64_t v8 = *(void **)(a1 + 32);
    unint64_t v9 = [v13 data];
    [v8 addObject:v9];

    id v10 = (id *)(a1 + 40);
  }
  [*v10 addObject:v6];
LABEL_8:
}

void sub_1DCB51A60(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(SNKShotFeaturizationResult);
  [(SNKShotFeaturizationResult *)v7 setTrainingDataEmbeddings:a1[4]];
  [(SNKShotFeaturizationResult *)v7 setTrainingDataLabels:a1[5]];
  [(SNKShotFeaturizationResult *)v7 setValidationDataEmbeddings:a1[6]];
  [(SNKShotFeaturizationResult *)v7 setValidationDataLabels:a1[7]];
  if (v5)
  {
    [v5 inferenceWindowSize];
  }
  else
  {
    long long v11 = 0uLL;
    uint64_t v12 = 0;
  }
  long long v9 = v11;
  uint64_t v10 = v12;
  [(SNKShotFeaturizationResult *)v7 setInferenceWindowSize:&v9];
  uint64_t v8 = [v5 exemplar];
  [(SNKShotFeaturizationResult *)v7 setExemplar:v8];

  (*(void (**)(void))(a1[8] + 16))();
}

void sub_1DCB51CC8(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E01A90A0]();
  id v3 = (void *)a1[9];
  uint64_t v4 = (void *)a1[4];
  id v5 = [v3 defaultRandomNumberGenerator];
  id v6 = (void *)a1[5];
  uint64_t v7 = (void *)a1[6];
  uint64_t v8 = (void *)a1[7];
  id v11 = 0;
  long long v9 = sub_1DCB51D80((uint64_t)v3, v4, v5, v6, v7, v8, &v11);
  id v10 = v11;

  (*(void (**)(void))(a1[8] + 16))();
}

SNKShotFeaturizationStreamCompletion *sub_1DCB51D80(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v12 = a2;
  id v47 = a3;
  id v48 = a4;
  id v13 = a5;
  id v49 = a6;
  uint64_t v14 = self;
  id v15 = sub_1DCB6CF14();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = [v12 count];
    _os_log_impl(&dword_1DC873000, v15, OS_LOG_TYPE_DEFAULT, "[Custom Sound Recognition Model Training] Beginning Featurization on file count: %llu", (uint8_t *)&buf, 0xCu);
  }

  id v16 = objc_alloc_init(SNKShotSegmentationRequest);
  uint64_t v17 = [(SNKShotSegmentationRequest *)v16 setFileURLs:v12];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v98 = 0x3032000000;
  int v99 = sub_1DCB56A18;
  float v100 = sub_1DCB56A28;
  id v101 = 0;
  id v18 = (void *)MEMORY[0x1E01A90A0](v17);
  uint64_t v19 = *((void *)&buf + 1);
  id v96 = *(id *)(*((void *)&buf + 1) + 40);
  long long v20 = +[SNKShotFeaturizerImpl performSegmentationRequest:v16 error:&v96];
  objc_storeStrong((id *)(v19 + 40), v96);
  if (!v20)
  {
    id v23 = [*(id *)(*((void *)&buf + 1) + 40) localizedDescription];
    +[SNError populateClientError:a7 withCode:1 underlyingError:0 message:v23];
    id v25 = 0;
    goto LABEL_39;
  }
  long long v21 = [v20 segments];
  long long v22 = [v20 exemplarIndex];
  id v23 = objc_msgSend(v21, "objectAtIndexedSubscript:", (int)objc_msgSend(v22, "intValue"));

  if (v23)
  {
    [v23 timeRange];
    int v24 = DWORD2(v93);
  }
  else
  {
    int v24 = 0;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v93 = 0u;
  }
  if (![v13 isCancelled])
  {
    BOOL v26 = [v20 segments];
    int v27 = [v26 count];

    if (v27 <= 2)
    {
      +[SNError populateClientError:a7 withCode:1 underlyingError:0 message:@"Not enough audio segments found to continue."];
      id v25 = 0;
      goto LABEL_39;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1DCB56A30;
    aBlock[3] = &unk_1E6CA7968;
    id v92 = v49;
    id v45 = _Block_copy(aBlock);
    uint64_t v85 = 0;
    int v86 = &v85;
    uint64_t v87 = 0x3032000000;
    float32x4_t v88 = sub_1DCB56A18;
    uint64_t v89 = sub_1DCB56A28;
    id v90 = 0;
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = sub_1DCB56B1C;
    v70[3] = &unk_1E6CA79E0;
    id v71 = v48;
    p_long long buf = &buf;
    uint64_t v79 = v14;
    int v80 = v27;
    int v81 = 80;
    int v82 = 1065353216;
    int v83 = v24;
    id v44 = v23;
    id v72 = v44;
    uint64_t v78 = &v85;
    id v43 = v45;
    id v75 = v43;
    id v73 = v20;
    uint64_t v84 = 0x100000028;
    id v76 = v47;
    id v28 = v13;
    id v74 = v28;
    id v46 = (uint64_t (**)(void))_Block_copy(v70);
    if (v46[2]())
    {
      if (![v28 isCancelled])
      {
        memset(&v69, 0, sizeof(v69));
        [(id)v86[5] floatValue];
        CMTimeMake(&v69, (int)vcvts_n_s32_f32(v29 * 160.0, 5uLL), 16000);
        memset(&v68, 0, sizeof(v68));
        if (v23)
        {
          [v44 timeRange];
        }
        else
        {
          memset(v66, 0, sizeof(v66));
          long long v65 = 0u;
        }
        CMTime rhs = *(CMTime *)((char *)v66 + 8);
        CMTime lhs = v69;
        CMTimeSubtract(&v68, &lhs, &rhs);
        v68.value /= 2;
        uint64_t v30 = objc_alloc_init(SNKShotSegment);
        id v31 = [v44 url];
        [(SNKShotSegment *)v30 setUrl:v31];
        uint64_t v42 = v30;

        if (v23)
        {
          [v44 timeRange];
        }
        else
        {
          long long v59 = 0u;
          long long v60 = 0u;
          long long v58 = 0u;
        }
        *(_OWORD *)&v61.value = v58;
        v61.epoch = v59;
        CMTime lhs = v68;
        CMTimeSubtract(&start, &v61, &lhs);
        CMTime lhs = v69;
        CMTimeRangeMake(&v63, &start, &lhs);
        CMTimeRange v57 = v63;
        [(SNKShotSegment *)v30 setTimeRange:&v57];
        id v56 = 0;
        char v32 = sub_1DCB50D90(v14, v30, &v56);
        id v33 = v56;
        if (v42)
        {
          uint64_t v34 = (void *)MEMORY[0x1E4F29238];
          if (v32)
          {
            [v32 timeRange];
          }
          else
          {
            memset(v53, 0, sizeof(v53));
            long long v52 = 0u;
          }
          long long v54 = *(_OWORD *)((char *)v53 + 8);
          uint64_t v55 = *((void *)&v53[1] + 1);
          int v35 = [v34 valueWithCMTime:&v54];
          id v51 = v33;
          id v36 = sub_1DCB51598((uint64_t)SNKShotFeaturizerImpl, v32, v35, &v51);
          id v41 = v51;

          long long v37 = v36;
          if (v36)
          {
            id v25 = objc_alloc_init(SNKShotFeaturizationStreamCompletion);
            CMTime v50 = v69;
            [(SNKShotFeaturizationStreamCompletion *)v25 setInferenceWindowSize:&v50];
            uint64_t v38 = [v36 featureVector];
            [(SNKShotFeaturizationStreamCompletion *)v25 setExemplar:v38];

            long long v39 = sub_1DCB6CF14();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(lhs.value) = 0;
              _os_log_impl(&dword_1DC873000, v39, OS_LOG_TYPE_DEFAULT, "[Custom Sound Recognition Model Training] Successfully completed Featurization", (uint8_t *)&lhs, 2u);
            }
          }
          else
          {
            +[SNError populateClientError:a7 withCode:1 underlyingError:v41 message:@"Error computing SoundPrint."];
            id v25 = 0;
            long long v37 = 0;
          }

          id v33 = v41;
        }
        else
        {
          +[SNError populateClientError:a7 withCode:1 underlyingError:v33 message:@"Failed to fit segment to file."];
          id v25 = 0;
        }

        goto LABEL_38;
      }
      if (a7)
      {
        id v25 = 0;
        *a7 = 0;
LABEL_38:

        _Block_object_dispose(&v85, 8);
        id v23 = v44;
        goto LABEL_39;
      }
    }
    else if (a7)
    {
      id v25 = 0;
      *a7 = *(id *)(*((void *)&buf + 1) + 40);
      goto LABEL_38;
    }
    id v25 = 0;
    goto LABEL_38;
  }
  id v25 = 0;
  if (a7) {
    *a7 = 0;
  }
LABEL_39:

  _Block_object_dispose(&buf, 8);

  return v25;
}

void sub_1DCB525FC(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x288], 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1DCB53B34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

id sub_1DCB53B5C(uint64_t a1)
{
  v199[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F15390]);
  uint64_t v3 = *(void *)(a1 + 32);
  id v192 = 0;
  uint64_t v4 = (void *)[v2 initForReading:v3 commonFormat:1 interleaved:0 error:&v192];
  id v5 = v192;
  if (v4)
  {
    id v6 = [[SNCreateFeaturePrintRequest alloc] initWithFeaturePrintType:2];
    LODWORD(v7) = 1014763457;
    [(SNCreateFeaturePrintRequest *)v6 setOverlapFactor:v7];
    uint64_t v8 = objc_alloc_init(SNResultsCollector);
    long long v9 = [SNAudioFileAnalyzer alloc];
    uint64_t v10 = *(void *)(a1 + 32);
    id v191 = v5;
    id v11 = [(SNAudioFileAnalyzer *)v9 initWithURL:v10 error:&v191];
    id v12 = v191;

    if (v11)
    {
      id v190 = v12;
      BOOL v13 = [(SNAudioFileAnalyzer *)v11 addRequest:v6 withObserver:v8 error:&v190];
      id v14 = v190;

      if (v13)
      {
        float32x4_t v171 = v11;
        float32x4_t v172 = v6;
        unsigned int v170 = v4;
        [(SNAudioFileAnalyzer *)v11 analyze];
        int8x16_t v177 = v8;
        id v15 = [(SNResultsCollector *)v8 results];
        int v16 = [v15 count];

        float32x4_t v176 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v16];
        uint64_t v178 = a1;
        if (v16 < 1)
        {
LABEL_11:
          float v29 = (void *)MEMORY[0x1E4F1E9A8];
          uint64_t v30 = [v176 objectAtIndexedSubscript:0];
          id v31 = objc_msgSend(v29, "multiArrayByConcatenatingMultiArrays:alongAxis:dataType:", v176, 1, objc_msgSend(v30, "dataType"));

          LODWORD(v30) = *(_DWORD *)(a1 + 60);
          char v32 = [(SNResultsCollector *)v177 results];
          uint64_t v33 = v30 * [v32 count];

          id v34 = objc_alloc(MEMORY[0x1E4F1E9A8]);
          int v35 = [NSNumber numberWithInt:v33];
          v196 = v35;
          id v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v196 count:1];
          id v188 = v14;
          long long v37 = (void *)[v34 initWithShape:v36 dataType:65568 error:&v188];
          id v38 = v188;

          if (v37)
          {
            uint64_t v166 = v37;
            v167 = v38;
            uint64_t v39 = [v37 dataPointer];
            uint64_t v174 = v33;
            if ((int)v33 >= 1)
            {
              uint64_t v40 = 0;
              LODWORD(v41) = *(_DWORD *)(a1 + 64);
              do
              {
                *(_DWORD *)(v39 + 4 * v40) = -998637568;
                if ((int)v41 >= 1)
                {
                  uint64_t v42 = 0;
                  do
                  {
                    float v43 = *(float *)(v39 + 4 * v40);
                    id v44 = (void *)MEMORY[0x1E4F1C978];
                    id v45 = [NSNumber numberWithInteger:0];
                    id v46 = [NSNumber numberWithInteger:v40];
                    id v47 = [NSNumber numberWithInteger:v42];
                    id v48 = objc_msgSend(v44, "arrayWithObjects:", v45, v46, v47, 0);
                    id v49 = [v31 objectForKeyedSubscript:v48];
                    [v49 floatValue];
                    float v51 = v50;

                    if (v43 < v51)
                    {
                      long long v52 = (void *)MEMORY[0x1E4F1C978];
                      int v53 = [NSNumber numberWithInteger:0];
                      long long v54 = [NSNumber numberWithInteger:v40];
                      uint64_t v55 = [NSNumber numberWithInteger:v42];
                      id v56 = objc_msgSend(v52, "arrayWithObjects:", v53, v54, v55, 0);
                      CMTimeRange v57 = [v31 objectForKeyedSubscript:v56];
                      [v57 floatValue];
                      *(_DWORD *)(v39 + 4 * v40) = v58;
                    }
                    ++v42;
                    a1 = v178;
                    uint64_t v41 = *(int *)(v178 + 64);
                  }
                  while (v42 < v41);
                  uint64_t v33 = v174;
                }
                ++v40;
              }
              while (v40 != v33);
            }
            [*(id *)(a1 + 40) backgroundEnergyPercentile];
            uint64_t v60 = (int)((float)(v59 * (float)(int)v33) / 100.0);
            id v187 = v167;
            id v61 = objc_alloc(MEMORY[0x1E4F1E9A8]);
            int v62 = [NSNumber numberWithInt:v60];
            v199[0] = v62;
            CMTimeRange v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:v199 count:1];
            std::string::size_type v64 = (void *)[v61 initWithShape:v63 dataType:131104 error:&v187];

            if (v64)
            {
              id v65 = v64;
              uint64_t v66 = [v65 dataPointer];
              if ((int)v60 < 1)
              {
                int v68 = 0;
              }
              else
              {
                uint64_t v67 = 0;
                int v68 = 0;
                do
                {
                  *(_DWORD *)(v66 + 4 * v67) = v67;
                  if (*(float *)(v39 + 4 * v67) >= *(float *)(v39 + 4 * v68)) {
                    int v68 = v67;
                  }
                  ++v67;
                }
                while (v60 != v67);
              }
              if ((int)v174 > (int)v60)
              {
                uint64_t v70 = (int)v60;
                do
                {
                  if (*(float *)(v39 + 4 * v70) <= *(float *)(v39 + 4 * *(int *)(v66 + 4 * v68)))
                  {
                    *(_DWORD *)(v66 + 4 * v68) = v70;
                    if ((int)v60 >= 1)
                    {
                      for (uint64_t i = 0; i != v60; ++i)
                      {
                        if (*(float *)(v39 + 4 * *(int *)(v66 + 4 * i)) >= *(float *)(v39
                                                                                       + 4 * *(int *)(v66 + 4 * v68)))
                          int v68 = i;
                      }
                    }
                  }
                  ++v70;
                }
                while (v70 != (int)v174);
              }
              id v72 = v65;
            }

            id v73 = v187;
            if (v64)
            {
              uint64_t v74 = [v64 dataPointer];
              id v75 = (int *)v74;
              uint64_t v165 = v64;
              if ((int)v60 <= 0)
              {
                uint64_t v80 = 0;
                float v81 = 0.0 / (float)(int)v60;
              }
              else
              {
                float v76 = 0.0;
                double v77 = (int *)v74;
                uint64_t v78 = v60;
                do
                {
                  uint64_t v79 = *v77++;
                  float v76 = v76 + *(float *)(v39 + 4 * v79);
                  --v78;
                }
                while (v78);
                LODWORD(v80) = 0;
                float v81 = v76 / (float)(int)v60;
                int v82 = (int *)v74;
                uint64_t v83 = v60;
                do
                {
                  uint64_t v84 = *v82++;
                  if (*(float *)(v39 + 4 * v84) > v81) {
                    uint64_t v80 = v80;
                  }
                  else {
                    uint64_t v80 = (v80 + 1);
                  }
                  --v83;
                }
                while (v83);
              }
              id v85 = objc_alloc(MEMORY[0x1E4F1E9A8]);
              int v86 = [NSNumber numberWithInt:v80];
              v195 = v86;
              uint64_t v87 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v195 count:1];
              id v186 = v73;
              float32x4_t v88 = (void *)[v85 initWithShape:v87 dataType:131104 error:&v186];
              id v168 = v186;

              if (v88)
              {
                uint64_t v89 = [v88 dataPointer];
                id v90 = (int *)v89;
                if ((int)v60 >= 1)
                {
                  int v91 = 0;
                  do
                  {
                    uint64_t v93 = *v75++;
                    int v92 = v93;
                    if (*(float *)(v39 + 4 * v93) <= v81) {
                      *(_DWORD *)(v89 + 4 * v91++) = v92;
                    }
                    --v60;
                  }
                  while (v60);
                }
                int32x4_t v163 = v88;
                [*(id *)(v178 + 40) foregroundEnergyPercentile];
                uint64_t v95 = (int)((100.0 - v94) * (double)(int)v174 / 100.0);
                id v185 = v168;
                id v96 = objc_alloc(MEMORY[0x1E4F1E9A8]);
                id v97 = [NSNumber numberWithInt:v95];
                v199[0] = v97;
                uint64_t v98 = [MEMORY[0x1E4F1C978] arrayWithObjects:v199 count:1];
                int v99 = (void *)[v96 initWithShape:v98 dataType:131104 error:&v185];

                if (v99)
                {
                  id v100 = v99;
                  uint64_t v101 = [v100 dataPointer];
                  if ((int)v95 < 1)
                  {
                    int v103 = 0;
                  }
                  else
                  {
                    uint64_t v102 = 0;
                    int v103 = 0;
                    do
                    {
                      *(_DWORD *)(v101 + 4 * v102) = v102;
                      if (*(float *)(v39 + 4 * v102) <= *(float *)(v39 + 4 * v103)) {
                        int v103 = v102;
                      }
                      ++v102;
                    }
                    while (v95 != v102);
                  }
                  if ((int)v174 > (int)v95)
                  {
                    uint64_t v105 = (int)v95;
                    do
                    {
                      if (*(float *)(v39 + 4 * v105) >= *(float *)(v39 + 4 * *(int *)(v101 + 4 * v103)))
                      {
                        *(_DWORD *)(v101 + 4 * v103) = v105;
                        if ((int)v95 >= 1)
                        {
                          for (uint64_t j = 0; j != v95; ++j)
                          {
                            if (*(float *)(v39 + 4 * *(int *)(v101 + 4 * j)) <= *(float *)(v39
                                                                                            + 4
                                                                                            * *(int *)(v101 + 4 * v103)))
                              int v103 = j;
                          }
                        }
                      }
                      ++v105;
                    }
                    while (v105 != (int)v174);
                  }
                  id v107 = v100;
                }

                id v108 = v185;
                if (v99)
                {
                  float32x4_t v160 = v108;
                  uint64_t v109 = [v99 dataPointer];
                  uint64_t v110 = (int *)v109;
                  float32x4_t v162 = v99;
                  float32x4_t v157 = v90;
                  if ((int)v95 <= 0)
                  {
                    uint64_t v115 = 0;
                    float v116 = 0.0 / (float)(int)v95;
                  }
                  else
                  {
                    float v111 = 0.0;
                    float32x4_t v112 = (int *)v109;
                    uint64_t v113 = v95;
                    do
                    {
                      uint64_t v114 = *v112++;
                      float v111 = v111 + *(float *)(v39 + 4 * v114);
                      --v113;
                    }
                    while (v113);
                    LODWORD(v115) = 0;
                    float v116 = v111 / (float)(int)v95;
                    float32x4_t v117 = (int *)v109;
                    uint64_t v118 = v95;
                    do
                    {
                      uint64_t v119 = *v117++;
                      if (*(float *)(v39 + 4 * v119) < v116) {
                        uint64_t v115 = v115;
                      }
                      else {
                        uint64_t v115 = (v115 + 1);
                      }
                      --v118;
                    }
                    while (v118);
                  }
                  id v120 = objc_alloc(MEMORY[0x1E4F1E9A8]);
                  float32x4_t v159 = [NSNumber numberWithInt:v115];
                  v194 = v159;
                  float32x4_t v121 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v194 count:1];
                  id v184 = v160;
                  int v122 = (void *)[v120 initWithShape:v121 dataType:131104 error:&v184];
                  id v158 = v184;

                  uint64_t v169 = v122;
                  if (v122)
                  {
                    uint64_t v123 = [v122 dataPointer];
                    float32x4_t v124 = (int *)v123;
                    float32x4_t v104 = v163;
                    if ((int)v95 >= 1)
                    {
                      int v125 = 0;
                      do
                      {
                        uint64_t v127 = *v110++;
                        int v126 = v127;
                        if (*(float *)(v39 + 4 * v127) >= v116) {
                          *(_DWORD *)(v123 + 4 * v125++) = v126;
                        }
                        --v95;
                      }
                      while (v95);
                    }
                    uint64_t v128 = *(unsigned int *)(v178 + 64);
                    id v183 = v158;
                    uint64_t v129 = sub_1DCB4FC58(v128, v31, v124, v115, v157, v80, (uint64_t)&v183);
                    id v108 = v183;

                    if (v129)
                    {
                      float32x4_t v130 = (const float *)[v129 dataPointer];
                      id v131 = objc_alloc(MEMORY[0x1E4F1E9A8]);
                      uint64_t v132 = [NSNumber numberWithInt:v174];
                      v193 = v132;
                      float32x4_t v133 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v193 count:1];
                      id v182 = v108;
                      uint64_t v134 = (void *)[v131 initWithShape:v133 dataType:65568 error:&v182];
                      id v135 = v182;

                      uint64_t v164 = v134;
                      if (v134)
                      {
                        uint64_t v136 = [v134 dataPointer];
                        uint64_t v137 = [v31 dataPointer];
                        unsigned int v161 = v174 - 1;
                        if ((int)v174 >= 1)
                        {
                          uint64_t v138 = v137;
                          int v139 = 0;
                          float32x4_t v140 = (float *)v136;
                          uint64_t v141 = v174;
                          do
                          {
                            vDSP_dotpr((const float *)(v138 + 4 * *(_DWORD *)(v178 + 64) * v139), 1, v130, 1, v140, *(int *)(v178 + 64));
                            float v142 = 1.0 / (exp((float)-*v140) + 1.0);
                            *v140++ = v142;
                            ++v139;
                            --v141;
                          }
                          while (v141);
                        }
                        id v181 = v135;
                        float32x4_t v143 = sub_1DCB505D0(v136, v174, (uint64_t)&v181);
                        id v144 = v181;

                        if (v143)
                        {
                          id v180 = v144;
                          float32x4_t v145 = sub_1DCB507D8((float *)[v143 dataPointer], v161, (uint64_t)&v180);
                          id v146 = v180;

                          uint64_t v4 = v170;
                          float32x4_t v175 = v145;
                          if (v145)
                          {
                            uint64_t v147 = [v145 dataPointer];
                            int v148 = *(_DWORD *)(v178 + 68);
                            int v149 = *(_DWORD *)(v178 + 72);
                            float32x4_t v150 = [v170 fileFormat];
                            [v150 sampleRate];
                            int32_t v152 = (int)v151;
                            int32x4_t v153 = *(void **)(v178 + 32);
                            LODWORD(v151) = *(_DWORD *)(v178 + 76);
                            id v179 = v146;
                            float32x4_t v154 = sub_1DCB5091C(v147, v161, v148, v149, v152, v153, (uint64_t)&v179, *(float *)&v151);
                            id v144 = v179;

                            if (v154)
                            {
                              [*(id *)(v178 + 48) addObjectsFromArray:v154];
                              uint64_t v155 = 0;
                            }
                            else
                            {
                              uint64_t v155 = +[SNError errorWithCode:1 underlyingError:v144 message:@"error getting segments"];
                            }
                            std::string::size_type v64 = v165;
                            long long v37 = v166;
                          }
                          else
                          {
                            uint64_t v155 = +[SNError errorWithCode:1 underlyingError:v146 message:@"error rounding"];
                            id v144 = v146;
                            std::string::size_type v64 = v165;
                            long long v37 = v166;
                          }
                        }
                        else
                        {
                          uint64_t v155 = +[SNError errorWithCode:1 underlyingError:v144 message:@"error smoothing"];
                          uint64_t v4 = v170;
                          std::string::size_type v64 = v165;
                          long long v37 = v166;
                        }
                        float32x4_t v104 = v163;

                        id v135 = v144;
                        CMTime v69 = (void *)v155;
                      }
                      else
                      {
                        CMTime v69 = +[SNError errorWithCode:1 underlyingError:v135 message:@"error allocating"];
                        std::string::size_type v64 = v165;
                        long long v37 = v166;
                        float32x4_t v104 = v163;
                      }

                      id v108 = v135;
                    }
                    else
                    {
                      CMTime v69 = +[SNError errorWithCode:1 underlyingError:v108 message:@"error in logistic regression"];
                      std::string::size_type v64 = v165;
                      long long v37 = v166;
                    }
                  }
                  else
                  {
                    id v108 = v158;
                    CMTime v69 = +[SNError errorWithCode:1 underlyingError:v158 message:@"error allocating."];
                    std::string::size_type v64 = v165;
                    long long v37 = v166;
                    float32x4_t v104 = v163;
                  }
                  int v99 = v162;
                }
                else
                {
                  CMTime v69 = +[SNError errorWithCode:1 underlyingError:v108 message:@"error getting top indices."];
                  std::string::size_type v64 = v165;
                  long long v37 = v166;
                  float32x4_t v104 = v163;
                }

                id v73 = v108;
              }
              else
              {
                float32x4_t v104 = 0;
                id v73 = v168;
                CMTime v69 = +[SNError errorWithCode:1 underlyingError:v168 message:@"error allocating."];
                std::string::size_type v64 = v165;
                long long v37 = v166;
              }
            }
            else
            {
              CMTime v69 = +[SNError errorWithCode:1 underlyingError:v73 message:@"error getting bottom indices."];
              long long v37 = v166;
            }

            id v14 = v73;
          }
          else
          {
            CMTime v69 = +[SNError errorWithCode:1 underlyingError:v38 message:@"allocation error."];
            id v14 = v38;
          }
        }
        else
        {
          uint64_t v17 = 0;
          uint64_t v18 = v16;
          while (1)
          {
            uint64_t v19 = v14;
            long long v20 = [(SNResultsCollector *)v177 results];
            long long v21 = [v20 objectAtIndexedSubscript:v17];
            long long v22 = [v21 featureVector];

            v198[0] = &unk_1F3818E28;
            v198[1] = &unk_1F3818E28;
            id v23 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
            v198[2] = v23;
            int v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v198 count:3];

            v197[0] = &unk_1F3818E40;
            id v25 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
            v197[1] = v25;
            BOOL v26 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
            v197[2] = v26;
            int v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v197 count:3];

            id v189 = v19;
            id v28 = [v22 sliceAtOrigin:v24 shape:v27 squeeze:0 error:&v189];
            id v14 = v189;

            if (v28)
            {
              [v176 addObject:v28];
            }
            else
            {
              uint64_t v173 = +[SNError errorWithCode:1 underlyingError:v14 message:@"error making slice."];
            }

            if (!v28) {
              break;
            }
            ++v17;
            a1 = v178;
            if (v18 == v17) {
              goto LABEL_11;
            }
          }
          CMTime v69 = (void *)v173;
        }

        id v12 = v14;
        id v11 = v171;
        id v6 = v172;
        uint64_t v8 = v177;
      }
      else
      {
        CMTime v69 = +[SNError errorWithCode:1 underlyingError:v14 message:@"Error adding SN LogMel request."];
        id v12 = v14;
      }
    }
    else
    {
      CMTime v69 = +[SNError errorWithCode:1 underlyingError:v12 message:@"Error creating SN analyzer."];
    }

    id v5 = v12;
  }
  else
  {
    CMTime v69 = +[SNError errorWithCode:1 underlyingError:v5 message:@"Error loading audio files."];
  }

  return v69;
}

id sub_1DCB54BC4(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t v3 = (void *)a1[4];
  id v19 = 0;
  uint64_t v4 = sub_1DCB50D90(v2, v3, &v19);
  id v5 = v19;
  if (v4)
  {
    id v6 = (void *)MEMORY[0x1E4F29238];
    [v4 timeRange];
    long long v17 = v15;
    uint64_t v18 = v16;
    double v7 = [v6 valueWithCMTime:&v17];
    id v14 = v5;
    uint64_t v8 = sub_1DCB51598((uint64_t)SNKShotFeaturizerImpl, v4, v7, &v14);
    id v9 = v14;

    if (v8)
    {
      uint64_t v10 = (void *)a1[5];
      id v11 = [v8 featureVector];
      [v10 addObject:v11];

      id v12 = 0;
    }
    else
    {
      id v12 = +[SNError errorWithCode:1 underlyingError:v9 message:@"Error computing SoundPrint."];
    }
  }
  else
  {
    id v12 = +[SNError errorWithCode:1 underlyingError:v5 message:@"Failed to fit segment to file."];
    id v9 = v5;
  }

  return v12;
}

BOOL sub_1DCB54D3C(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  id v7 = v5;
  if (v6)
  {
    [v6 timeRange];
  }
  else
  {
    memset(v13, 0, sizeof(v13));
    long long v12 = 0u;
  }
  CMTime time1 = *(CMTime *)((char *)v13 + 8);
  if (v7) {
    [v7 timeRange];
  }
  else {
    memset(v10, 0, sizeof(v10));
  }
  CMTime time2 = *(CMTime *)&v10[1];
  BOOL v8 = CMTimeCompare(&time1, &time2) > 0;

  return v8;
}

id sub_1DCB54E14(uint64_t a1)
{
  v166[3] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F15390]);
  uint64_t v3 = [*(id *)(a1 + 32) url];
  id v163 = 0;
  id v4 = (id)[v2 initForReading:v3 commonFormat:1 interleaved:0 error:&v163];
  id v5 = (SNKShotSegment *)v163;

  if (!v4)
  {
    id v7 = +[SNError errorWithCode:1 underlyingError:v5 message:@"Error loading audio files."];
    goto LABEL_38;
  }
  if (*(_DWORD *)(a1 + 80) == *(_DWORD *)(a1 + 84))
  {
    [*(id *)(a1 + 40) addObject:*(void *)(a1 + 32)];
    CMTime v162 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
    id v6 = *(void **)(a1 + 32);
    if (v6)
    {
      [v6 timeRange];
    }
    else
    {
      memset(v160, 0, sizeof(v160));
      long long v159 = 0u;
    }
    CMTime time1 = *(CMTime *)&v160[1];
    CMTimeMake(&v158, 10, 1);
    if (CMTimeCompare(&time1, &v158) >= 1)
    {
      BOOL v26 = *(void **)(a1 + 32);
      if (v26)
      {
        [v26 timeRange];
      }
      else
      {
        long long v155 = 0u;
        long long v154 = 0u;
        long long v153 = 0u;
      }
      *(_OWORD *)&v156.CMTimeValue value = v153;
      v156.epoch = v154;
      int v27 = [v4 fileFormat];
      [v27 sampleRate];
      int64_t v29 = (uint64_t)(v28 * 10.0);
      uint64_t v30 = [v4 fileFormat];
      [v30 sampleRate];
      CMTimeMake(&v152, v29, (int)v31);
      CMTimeRangeMake(&v157, &v156, &v152);
      char v32 = *(void **)(a1 + 32);
      CMTimeRange v151 = v157;
      [v32 setTimeRange:&v151];
    }
    uint64_t v33 = *(void **)(a1 + 32);
    if (v33)
    {
      [v33 timeRange];
      uint64_t v34 = v148;
    }
    else
    {
      uint64_t v34 = 0;
      long long v149 = 0u;
      long long v150 = 0u;
      long long v148 = 0u;
    }
    unint64_t v35 = *(void *)(a1 + 56) + v34;
    if (v35 <= [v4 length] - 1)
    {
      long long v37 = *(void **)(a1 + 32);
      if (v37)
      {
        [v37 timeRange];
        uint64_t v38 = v145;
      }
      else
      {
        uint64_t v38 = 0;
        long long v146 = 0u;
        long long v147 = 0u;
        long long v145 = 0u;
      }
      int64_t v36 = *(void *)(a1 + 56) + v38;
    }
    else
    {
      int64_t v36 = [v4 length] - 1;
    }
    uint64_t v39 = [v4 fileFormat];
    [v39 sampleRate];
    CMTimeMake(&v162, v36, (int)v40);

    uint64_t v41 = *(void **)(a1 + 32);
    if (v41)
    {
      [v41 timeRange];
    }
    else
    {
      long long v141 = 0u;
      long long v142 = 0u;
      long long v140 = 0u;
    }
    *(_OWORD *)&v143.CMTimeValue value = v140;
    v143.epoch = v141;
    CMTime v139 = v162;
    CMTimeRangeFromTimeToTime(&v144, &v143, &v139);
    uint64_t v42 = *(void **)(a1 + 32);
    CMTimeRange v138 = v144;
    [v42 setTimeRange:&v138];
    goto LABEL_37;
  }
  uint64_t v8 = *(void *)(a1 + 64);
  CMTimeMake(&v137, 1, 1);
  id v9 = *(void **)(a1 + 32);
  uint64_t v136 = v5;
  uint64_t v10 = sub_1DCB50F90(v8, (long long *)&v137.value, v9, &v136);
  id v11 = v136;

  if (!v10)
  {
    id v7 = +[SNError errorWithCode:1 underlyingError:v11 message:@"Error ensuring segment length."];
    id v5 = v11;
    goto LABEL_38;
  }
  uint64_t v12 = *(void *)(a1 + 64);
  id v135 = v11;
  BOOL v13 = sub_1DCB511D0(v12, 2, v10, 0, (uint64_t)&unk_1F3819290, &v135);
  id v5 = v135;

  if (!v13)
  {
    id v7 = +[SNError errorWithCode:1 underlyingError:v5 message:@"Error collecting LogMel."];

    goto LABEL_38;
  }
  id v108 = v10;
  id v109 = v4;
  int v14 = [v13 count];
  id v111 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v14];
  if (v14 < 1)
  {
LABEL_41:
    id v44 = (void *)MEMORY[0x1E4F1E9A8];
    id v45 = [v111 objectAtIndexedSubscript:0];
    uint64_t v46 = objc_msgSend(v44, "multiArrayByConcatenatingMultiArrays:alongAxis:dataType:", v111, 1, objc_msgSend(v45, "dataType"));

    id v105 = (id) v46;
    uint64_t v107 = [v105 dataPointer];
    LODWORD(v46) = *(_DWORD *)(a1 + 92);
    int v47 = v46 * [v13 count] - *(_DWORD *)(a1 + 100);
    id v48 = objc_alloc(MEMORY[0x1E4F1E9A8]);
    uint64_t v104 = (v47 + 1);
    id v49 = [NSNumber numberWithInt:v104];
    uint64_t v164 = v49;
    float v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v164 count:1];
    float32x4_t v133 = v5;
    float v51 = (void *)[v48 initWithShape:v50 dataType:65568 error:&v133];
    long long v52 = v133;

    id v106 = v51;
    if (v51)
    {
      uint64_t v112 = [v51 dataPointer];
      int v101 = v47;
      if (v47 < 0)
      {
LABEL_51:
        uint64_t v67 = *(void **)(a1 + 32);
        if (v67)
        {
          [v67 timeRange];
          CMTimeValue value = *(void *)&v130[0];
        }
        else
        {
          CMTimeValue value = 0;
          memset(v130, 0, sizeof(v130));
        }
        id v72 = v13;
        long long v131 = *(_OWORD *)((char *)v130 + 8);
        if (v101 < 1)
        {
          int v73 = 0;
        }
        else
        {
          int v73 = 0;
          uint64_t v74 = (v101 + 1);
          uint64_t v75 = 1;
          do
          {
            if (*(float *)(v112 + 4 * v75) > *(float *)(v112 + 4 * v73))
            {
              float v76 = *(void **)(a1 + 32);
              if (v76)
              {
                [v76 timeRange];
                uint64_t v77 = v127;
              }
              else
              {
                uint64_t v77 = 0;
                long long v128 = 0u;
                long long v129 = 0u;
                long long v127 = 0u;
              }
              double v78 = (double)v77;
              id v79 = v109;
              uint64_t v80 = [v109 fileFormat];
              [v80 sampleRate];
              int64_t v82 = (uint64_t)(v81 * (double)(int)v75 / 100.0 + v78);
              uint64_t v83 = [v79 fileFormat];
              [v83 sampleRate];
              CMTimeMake(&v162, v82, (int)v84);
              CMTimeValue value = v162.value;
              long long v131 = *(_OWORD *)&v162.timescale;

              int v73 = v75;
            }
            ++v75;
          }
          while (v74 != v75);
        }
        CMTime v162 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
        id v85 = *(void **)(a1 + 32);
        if (v85)
        {
          [v85 timeRange];
        }
        else
        {
          memset(v125, 0, sizeof(v125));
          long long v124 = 0u;
        }
        id v4 = v109;
        BOOL v13 = v72;
        CMTime v126 = *(CMTime *)&v125[1];
        CMTimeMake(&v123, 10, 1);
        if (CMTimeCompare(&v126, &v123) >= 1)
        {
          int v86 = *(void **)(a1 + 32);
          CMTimeValue v87 = value;
          if (v86)
          {
            [v86 timeRange];
          }
          else
          {
            long long v119 = 0u;
            long long v120 = 0u;
            long long v118 = 0u;
          }
          *(_OWORD *)&v121.CMTimeValue value = v118;
          v121.epoch = v119;
          float32x4_t v88 = [v4 fileFormat];
          [v88 sampleRate];
          int64_t v90 = (uint64_t)(v89 * 10.0);
          int v91 = [v4 fileFormat];
          [v91 sampleRate];
          CMTimeMake(&v117, v90, (int)v92);
          CMTimeRangeMake(&v122, &v121, &v117);
          uint64_t v93 = *(void **)(a1 + 32);
          CMTimeRange v116 = v122;
          [v93 setTimeRange:&v116];

          CMTimeValue value = v87;
        }
        unint64_t v94 = *(void *)(a1 + 56) + value;
        if (v94 <= [v4 length] - 1) {
          int64_t v95 = *(void *)(a1 + 56) + value;
        }
        else {
          int64_t v95 = [v4 length] - 1;
        }
        id v71 = v105;
        CMTimeValue v96 = value;
        id v97 = [v4 fileFormat];
        [v97 sampleRate];
        CMTimeMake(&v162, v95, (int)v98);

        v139.CMTimeValue value = v96;
        *(_OWORD *)&v139.timescale = v131;
        CMTime v114 = v162;
        CMTimeRangeFromTimeToTime(&v115, &v139, &v114);
        int v99 = *(void **)(a1 + 32);
        CMTimeRange v113 = v115;
        [v99 setTimeRange:&v113];
        if (*(float *)(v112 + 4 * v73) <= 0.5)
        {
          uint64_t v70 = v108;
          id v7 = (void *)v110;
          if (*(_DWORD *)(a1 + 80) < *(_DWORD *)(a1 + 84)) {
            --*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
          }
        }
        else
        {
          [*(id *)(a1 + 40) addObject:*(void *)(a1 + 32)];
          uint64_t v70 = v108;
          id v7 = (void *)v110;
        }
        int v69 = 0;
        goto LABEL_84;
      }
      uint64_t v53 = 0;
      uint64_t v102 = v13;
      while (1)
      {
        uint64_t v54 = *(unsigned int *)(a1 + 100);
        uint64_t v55 = (float *)&v100[-((4 * v54 * (unint64_t)*(unsigned int *)(a1 + 96) + 15) & 0xFFFFFFFFFFFFFFF0)];
        vDSP_mtrans((const float *)(v107 + 4 * *(_DWORD *)(a1 + 96) * (int)v53), 1, v55, 1, *(int *)(a1 + 96), *(int *)(a1 + 100));
        LODWORD(v56) = *(_DWORD *)(a1 + 96);
        if ((int)v56 >= 1) {
          break;
        }
        float v60 = 0.0;
LABEL_50:
        float v66 = v60 / (double)(int)v56;
        *(float *)(v112 + 4 * v53++) = v66;
        if (v53 == v104) {
          goto LABEL_51;
        }
      }
      int v103 = v100;
      uint64_t v57 = 0;
      uint64_t v58 = 0;
      uint64_t v59 = 4 * v54;
      float v60 = 0.0;
      while (1)
      {
        id v61 = v52;
        uint64_t v62 = *(void *)(a1 + 72) + v57;
        uint64_t v63 = *(int *)(a1 + 100);
        uint64_t v132 = v52;
        std::string::size_type v64 = +[SNFeaturePrint cosineSimilarityBetweenOneFloat32Array:v62 andAnotherFloat32Array:v55 length:v63 error:&v132];
        long long v52 = v132;

        if (!v64) {
          break;
        }
        [v64 floatValue];
        float v60 = v60 + v65;

        ++v58;
        uint64_t v56 = *(int *)(a1 + 96);
        uint64_t v55 = (float *)((char *)v55 + v59);
        v57 += 4;
        if (v58 >= v56)
        {
          BOOL v13 = v102;
          goto LABEL_50;
        }
      }
      int v69 = 1;
      id v7 = +[SNError errorWithCode:1 underlyingError:v52 message:@"error getting similarity"];
      BOOL v13 = v102;
    }
    else
    {
      long long v52 = v52;
      int v69 = 1;
      id v7 = v52;
    }
    uint64_t v70 = v108;
    id v4 = v109;
    id v71 = v105;
LABEL_84:

    id v5 = v52;
    goto LABEL_85;
  }
  uint64_t v15 = 0;
  uint64_t v112 = v14;
  while (1)
  {
    uint64_t v16 = v5;
    long long v17 = v13;
    uint64_t v18 = [v13 objectAtIndexedSubscript:v15];
    id v19 = [v18 featureVector];

    v166[0] = &unk_1F3818E28;
    v166[1] = &unk_1F3818E28;
    long long v20 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 88)];
    v166[2] = v20;
    long long v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v166 count:3];

    v165[0] = &unk_1F3818E40;
    long long v22 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 92)];
    v165[1] = v22;
    id v23 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 96)];
    v165[2] = v23;
    int v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v165 count:3];

    uint64_t v134 = v16;
    id v25 = [v19 sliceAtOrigin:v21 shape:v24 squeeze:0 error:&v134];
    id v5 = v134;

    if (v25)
    {
      [v111 addObject:v25];
    }
    else
    {
      uint64_t v110 = +[SNError errorWithCode:1 underlyingError:v5 message:@"error getting slice"];
    }

    if (!v25) {
      break;
    }
    ++v15;
    BOOL v13 = v17;
    if (v112 == v15) {
      goto LABEL_41;
    }
  }
  int v69 = 1;
  uint64_t v70 = v108;
  id v4 = v109;
  BOOL v13 = v17;
  id v7 = (void *)v110;
LABEL_85:

  if (!v69) {
LABEL_37:
  }
    id v7 = 0;
LABEL_38:

  return v7;
}

uint64_t sub_1DCB55A04(uint64_t a1, void *a2, int a3, int32_t a4, void *a5, void *a6, void *a7, void *a8, uint64_t a9)
{
  uint64_t v134 = *MEMORY[0x1E4F143B8];
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a2;
  self;
  CMTimeMake(&v94, a3, a4);
  id v82 = v18;
  id v75 = v17;
  id v76 = v16;
  id v89 = v15;
  id v20 = v19;
  int v91 = self;
  memset(&v101, 0, sizeof(v101));
  CMTime time = v94;
  CMTimeConvertScale(&v101, &time, 16000, kCMTimeRoundingMethod_RoundTowardZero);
  id v21 = v20;
  self;
  id v93 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v109 = 0u;
  long long v108 = 0u;
  long long v107 = 0u;
  long long v106 = 0u;
  obunint64_t j = v21;
  uint64_t v22 = [obj countByEnumeratingWithState:&v106 objects:&time count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v107;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v107 != v23) {
          objc_enumerationMutation(obj);
        }
        id v25 = *(id *)(*((void *)&v106 + 1) + 8 * i);
        self;
        BOOL v26 = objc_alloc_init(SNKShotSegment);
        int v27 = [v25 url];
        [(SNKShotSegment *)v26 setUrl:v27];

        if (v25)
        {
          [v25 timeRange];
        }
        else
        {
          long long lhs_16 = 0u;
          long long v124 = 0u;
          long long lhs = 0u;
        }
        +[SNTimeUtils convertScaleForTimeRange:&lhs toValue:16000 preferShrinkingWhenRounding:1];
        duratiouint64_t n = v125;
        [(SNKShotSegment *)v26 setTimeRange:&duration];

        [v93 addObject:v26];
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v106 objects:&time count:16];
    }
    while (v22);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1DCB58CE8;
  aBlock[3] = &unk_1E6CA7B48;
  id v100 = v89;
  id v72 = v89;
  id v71 = _Block_copy(aBlock);
  double v78 = objc_msgSend(v91, "readNumRepetitionsPerTimeShiftFromHallucinator:error:", v82);
  if (!v78
    || ([v91 readNumTimeShiftsPerSegmentFromHallucinator:v82 error:a9],
        (int v73 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    int v73 = 0;
    goto LABEL_49;
  }
  CMTimeValue value = (void *)v101.value;
  *(_OWORD *)&v125.start.CMTimeValue value = *(_OWORD *)&v101.timescale;
  id v29 = v93;
  uint64_t v30 = self;
  *(void *)&long long v106 = 0;
  *((void *)&v106 + 1) = &v106;
  long long v107 = 0x2020000000uLL;
  time.CMTimeValue value = MEMORY[0x1E4F143A8];
  *(void *)&time.timescale = 3221225472;
  time.CMTimeEpoch epoch = (CMTimeEpoch)sub_1DCB57E3C;
  long long v127 = &unk_1E6CA7AA8;
  id v130 = v30;
  id v131 = value;
  long long v132 = *(_OWORD *)&v125.start.value;
  LODWORD(v133) = 0x2000;
  long long v129 = &v106;
  id v31 = v29;
  id v128 = v31;
  char v32 = _Block_copy(&time);
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  char v34 = 1;
  do
  {
    char v35 = v34;
    [v33 addObject:&unk_1F3818E40];
    char v34 = 0;
  }
  while ((v35 & 1) != 0);
  int64_t v36 = [NSNumber numberWithLongLong:value];
  [v33 addObject:v36];

  long long v37 = (void *)[objc_alloc(MEMORY[0x1E4F1E9A8]) initWithShape:v33 dataType:65568 error:a9];
  if (v37)
  {
    id v38 = v37;
    if (+[SNUtils flushBytesFromStreamSource:toBuffer:ofSizeInBytes:error:](SNUtils, "flushBytesFromStreamSource:toBuffer:ofSizeInBytes:error:", v32, [v38 dataPointer], 4 * objc_msgSend(v38, "count"), a9))
    {
      goto LABEL_19;
    }
  }
  id v38 = 0;
LABEL_19:

  _Block_object_dispose(&v106, 8);
  if (!v38)
  {
LABEL_49:
    uint64_t v70 = 0;
    goto LABEL_50;
  }
  uint64_t v39 = [v78 integerValue];
  id v40 = v82;
  uint64_t v41 = (long long *)v38;
  id v42 = v71;
  uint64_t v43 = self;
  *(void *)&long long v106 = 0;
  *((void *)&v106 + 1) = &v106;
  *(void *)&long long v107 = 0x3032000000;
  *((void *)&v107 + 1) = sub_1DCB56A18;
  *(void *)&long long v108 = sub_1DCB56A28;
  *((void *)&v108 + 1) = 0;
  v125.start.CMTimeValue value = MEMORY[0x1E4F143A8];
  *(void *)&v125.start.timescale = 3221225472;
  v125.start.CMTimeEpoch epoch = (CMTimeEpoch)sub_1DCB5843C;
  v125.duration.CMTimeValue value = (CMTimeValue)&unk_1E6CA7AD0;
  *(void *)&v125.duration.timescale = &v106;
  id v44 = _Block_copy(&v125);
  time.CMTimeValue value = MEMORY[0x1E4F143A8];
  *(void *)&time.timescale = 3221225472;
  time.CMTimeEpoch epoch = (CMTimeEpoch)sub_1DCB5844C;
  long long v127 = &unk_1E6CA7B20;
  *(void *)&long long v132 = &v106;
  *((void *)&v132 + 1) = v43;
  id v130 = v42;
  id v131 = v44;
  id v128 = v40;
  long long v129 = v41;
  uint64_t v133 = v39;
  uint64_t v70 = v41;
  id v45 = v44;
  id v46 = v40;
  id v47 = v42;
  id v48 = _Block_copy(&time);

  _Block_object_dispose(&v106, 8);
  if (!v48)
  {
LABEL_50:
    uint64_t v67 = 0;
    goto LABEL_51;
  }
  CMTimeMake(&start, -16000, 16000);
  CMTimeMake(&end, 16000, 16000);
  CMTimeRangeFromTimeToTime(&v98, &start, &end);
  unint64_t v84 = [v73 integerValue];
  CMTime v95 = v101;
  id v49 = v31;
  id v80 = v76;
  id v77 = v75;
  id v81 = v48;
  self;
  long long v109 = 0u;
  long long v108 = 0u;
  long long v107 = 0u;
  long long v106 = 0u;
  id v69 = v49;
  uint64_t v79 = [v69 countByEnumeratingWithState:&v106 objects:&time count:16];
  if (v79)
  {
    uint64_t v74 = *(void *)v107;
    while (2)
    {
      uint64_t v50 = 0;
      do
      {
        if (*(void *)v107 != v74)
        {
          uint64_t v51 = v50;
          objc_enumerationMutation(v69);
          uint64_t v50 = v51;
        }
        uint64_t v83 = v50;
        long long v52 = *(void **)(*((void *)&v106 + 1) + 8 * v50);
        long long v104 = *(_OWORD *)&v98.start.value;
        CMTimeValue v85 = v98.duration.value;
        CMTimeEpoch epoch = v98.start.epoch;
        long long v103 = *(_OWORD *)&v98.duration.timescale;
        CMTime v102 = v95;
        id v53 = v52;
        id v90 = v80;
        id v87 = v77;
        id v88 = v81;
        self;
        if (v84)
        {
          BOOL v86 = 0;
          for (j = 0; j != v84; BOOL v86 = j >= v84)
          {
            id v55 = v53;
            self;
            uint64_t v56 = objc_alloc_init(SNKShotSegment);
            uint64_t v57 = [v55 url];
            [(SNKShotSegment *)v56 setUrl:v57];

            if (v53)
            {
              [v55 timeRange];
            }
            else
            {
              long long lhs_16 = 0u;
              long long v124 = 0u;
              long long lhs = 0u;
            }
            *(_OWORD *)&v121.CMTimeValue value = lhs;
            v121.CMTimeEpoch epoch = lhs_16;
            duration.CMTime start = v102;
            CMTimeRangeMake(&v125, &v121, &duration.start);
            duratiouint64_t n = v125;
            [(SNKShotSegment *)v56 setTimeRange:&duration];

            memset(&v121, 0, sizeof(v121));
            id v58 = v90;
            self;
            id v59 = v58;
            self;
            long long lhs = v104;
            *(void *)&long long lhs_16 = epoch;
            *((void *)&lhs_16 + 1) = v85;
            long long v124 = v103;
            +[SNTimeUtils standardizeTimeRange:&lhs directionShouldBePositive:1 negativeShouldResideInTimescale:0];
            LODWORD(v58) = v125.duration.value;
            memset(&v125, 0, 24);
            unsigned int v60 = (*((uint64_t (**)(id, void))v80 + 2))(v59, LODWORD(v125.duration.value));

            CMTimeMake(&v125.start, v60, (int32_t)v58);
            long long lhs = v104;
            *(void *)&long long lhs_16 = epoch;
            *(_OWORD *)&duration.start.CMTimeValue value = *(_OWORD *)&v125.start.value;
            duration.start.CMTimeEpoch epoch = v125.start.epoch;
            CMTimeAdd(&v121, (CMTime *)&lhs, &duration.start);
            memset(&v125, 0, 24);
            if (v53)
            {
              [v55 timeRange];
              int32_t v61 = v119;
            }
            else
            {
              int32_t v61 = 0;
              long long v119 = 0u;
              memset(v118, 0, sizeof(v118));
            }
            long long lhs = *(_OWORD *)&v121.value;
            *(void *)&long long lhs_16 = v121.epoch;
            CMTimeConvertScale(&v125.start, (CMTime *)&lhs, v61, kCMTimeRoundingMethod_RoundTowardZero);
            if (v56) {
              [(SNKShotSegment *)v56 timeRange];
            }
            else {
              memset(v114, 0, sizeof(v114));
            }
            long long lhs = *(_OWORD *)&v125.start.value;
            *(void *)&long long lhs_16 = v125.start.epoch;
            +[SNTimeUtils addOffset:&lhs toTimeRange:v114];
            v113[0] = v115;
            v113[1] = v116;
            v113[2] = v117;
            [(SNKShotSegment *)v56 setTimeRange:v113];
            uint64_t v62 = NSNumber;
            if (v53)
            {
              [v55 timeRange];
              uint64_t v63 = *((void *)&v111 + 1);
            }
            else
            {
              uint64_t v63 = 0;
              long long v112 = 0u;
              long long v111 = 0u;
              long long v110 = 0u;
            }
            std::string::size_type v64 = [v62 numberWithLongLong:v63];
            float v65 = [NSNumber numberWithLongLong:v125.start.value];
            char v66 = (*((uint64_t (**)(id, SNKShotSegment *, void *, void *, id, uint64_t))v81 + 2))(v88, v56, v64, v65, v87, a9);

            if ((v66 & 1) == 0) {
              break;
            }
            ++j;
          }
        }
        else
        {
          BOOL v86 = 1;
        }

        if (!v86)
        {
          uint64_t v67 = 0;
          goto LABEL_53;
        }
        uint64_t v50 = v83 + 1;
      }
      while (v83 + 1 != v79);
      uint64_t v79 = [v69 countByEnumeratingWithState:&v106 objects:&time count:16];
      if (v79) {
        continue;
      }
      break;
    }
  }
  uint64_t v67 = 1;
LABEL_53:

LABEL_51:
  return v67;
}

void sub_1DCB566AC(_Unwind_Exception *a1)
{
}

void sub_1DCB56920(uint64_t a1, void *a2)
{
  id v13 = a2;
  uint64_t v3 = [v13 label];
  uint64_t v4 = [v3 type];
  id v5 = &unk_1F3818E40;
  if (!v4) {
    id v5 = &unk_1F3818E28;
  }
  id v6 = v5;

  uint64_t v7 = [v13 datasetType];
  if (v7 == 1)
  {
    id v11 = *(void **)(a1 + 48);
    uint64_t v12 = [v13 data];
    [v11 addObject:v12];

    uint64_t v10 = (id *)(a1 + 56);
  }
  else
  {
    if (v7) {
      goto LABEL_8;
    }
    uint64_t v8 = *(void **)(a1 + 32);
    id v9 = [v13 data];
    [v8 addObject:v9];

    uint64_t v10 = (id *)(a1 + 40);
  }
  [*v10 addObject:v6];
LABEL_8:
}

uint64_t sub_1DCB56A18(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1DCB56A28(uint64_t a1)
{
}

void sub_1DCB56A30(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  id v8 = a2;
  uint64_t v12 = objc_alloc_init(SNKShotFeaturizationStreamResult);
  [(SNKShotFeaturizationStreamResult *)v12 setDatasetType:a4];
  [(SNKShotFeaturizationStreamResult *)v12 setData:v7];

  LODWORD(a4) = [v8 isEqual:&unk_1F3818E28];
  id v9 = [SNKShotLabel alloc];
  if (a4) {
    uint64_t v10 = [(SNKShotLabel *)v9 initAsNegativeLabel];
  }
  else {
    uint64_t v10 = [(SNKShotLabel *)v9 initAsPositiveLabel];
  }
  id v11 = (void *)v10;
  [(SNKShotFeaturizationStreamResult *)v12 setLabel:v10];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1DCB56B1C(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E01A90A0]();
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(*(void *)(a1 + 80) + 8);
  v54[0] = *(id *)(v4 + 40);
  id v5 = +[SNUtils loadModelAtURL:v3 withTimeout:v54 error:5.0];
  objc_storeStrong((id *)(v4 + 40), v54[0]);
  if (!v5)
  {
    unsigned int v8 = 0;
    goto LABEL_6;
  }
  id v6 = *(void **)(a1 + 96);
  uint64_t v7 = *(void *)(*(void *)(a1 + 80) + 8);
  id v53 = *(id *)(v7 + 40);
  unsigned int v8 = [v6 recognizeHallucinatorModel:v5 error:&v53];
  objc_storeStrong((id *)(v7 + 40), v53);
  if (!v8)
  {
LABEL_6:
    int v12 = 1;
    goto LABEL_20;
  }
  uint64_t v9 = 1374389535 * *(_DWORD *)(a1 + 108) * *(_DWORD *)(a1 + 104);
  uint64_t v10 = (int)((v9 >> 37) + ((unint64_t)v9 >> 63));
  id v11 = *(void **)(a1 + 40);
  if (v11) {
    [v11 timeRange];
  }
  else {
    memset(&range, 0, sizeof(range));
  }
  CMTimeRangeGetEnd(&v51, &range);
  int value = v51.value;
  int v14 = *(void **)(a1 + 40);
  id v38 = v2;
  if (v14)
  {
    [v14 timeRange];
    int v15 = v48;
  }
  else
  {
    int v15 = 0;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v48 = 0u;
  }
  int v16 = value - v15 + (int)(float)(*(float *)(a1 + 112) * (float)*(int *)(a1 + 116));
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1DCB56F74;
  aBlock[3] = &unk_1E6CA7990;
  uint64_t v47 = *(void *)(a1 + 88);
  id v46 = *(id *)(a1 + 64);
  id v17 = _Block_copy(aBlock);
  id v18 = [*(id *)(a1 + 48) segments];
  id v19 = objc_msgSend(v18, "subarrayWithRange:", 0, v10);
  int32_t v20 = *(_DWORD *)(a1 + 116);
  id v21 = *(void **)(a1 + 72);
  uint64_t v22 = *(void *)(*(void *)(a1 + 80) + 8);
  obunint64_t j = *(id *)(v22 + 40);
  char v23 = sub_1DCB55A04((uint64_t)SNKShotFeaturizerImpl, v19, v16, v20, v5, &unk_1F3818E28, v21, v17, (uint64_t)&obj);
  objc_storeStrong((id *)(v22 + 40), obj);

  if (v23)
  {
    if ([*(id *)(a1 + 56) isCancelled])
    {
      uint64_t v24 = *(void *)(*(void *)(a1 + 80) + 8);
      id v25 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = 0;
      int v12 = 1;
      unsigned int v8 = 1;
    }
    else
    {
      uint64_t v27 = *(int *)(a1 + 104) - v10;
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = sub_1DCB5702C;
      v41[3] = &unk_1E6CA79B8;
      id v42 = *(id *)(a1 + 64);
      double v28 = _Block_copy(v41);
      id v29 = [*(id *)(a1 + 48) segments];
      uint64_t v30 = objc_msgSend(v29, "subarrayWithRange:", v10, v27);
      int32_t v31 = *(_DWORD *)(a1 + 116);
      char v32 = *(void **)(a1 + 72);
      uint64_t v33 = *(void *)(*(void *)(a1 + 80) + 8);
      id v40 = *(id *)(v33 + 40);
      char v34 = sub_1DCB55A04((uint64_t)SNKShotFeaturizerImpl, v30, v16, v31, v5, &unk_1F3818E40, v32, v28, (uint64_t)&v40);
      objc_storeStrong((id *)(v33 + 40), v40);

      if (v34)
      {
        int v12 = 0;
      }
      else
      {
        uint64_t v35 = *(void *)(*(void *)(a1 + 80) + 8);
        id v39 = *(id *)(v35 + 40);
        int64_t v36 = [v39 localizedDescription];
        +[SNError populateClientError:&v39 withCode:1 underlyingError:v39 message:v36];
        objc_storeStrong((id *)(v35 + 40), v39);

        int v12 = 1;
      }

      unsigned int v8 = 0;
      id v25 = v42;
    }
  }
  else
  {
    uint64_t v26 = *(void *)(*(void *)(a1 + 80) + 8);
    id v43 = *(id *)(v26 + 40);
    id v25 = [v43 localizedDescription];
    int v12 = 1;
    +[SNError populateClientError:&v43 withCode:1 underlyingError:v43 message:v25];
    objc_storeStrong((id *)(v26 + 40), v43);
    unsigned int v8 = 0;
  }
  id v2 = v38;

LABEL_20:
  if (v12) {
    return v8;
  }
  else {
    return 1;
  }
}

void sub_1DCB56F74(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = v5;
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v7 = [v5 shape];
    uint64_t v8 = [v7 lastObject];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1DCB5702C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1DCB579C4(void *a1, _OWORD *a2, uint64_t a3, _OWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = a1[5];
  uint64_t v10 = a1[4];
  uint64_t v11 = *(void *)(a1[7] + 8);
  id v18 = *(id *)(v11 + 40);
  int v12 = *(uint64_t (**)(uint64_t, uint64_t, _OWORD *, _OWORD *, id *, uint64_t, uint64_t, uint64_t))(v9 + 16);
  long long v13 = a2[1];
  v17[0] = *a2;
  v17[1] = v13;
  v17[2] = a2[2];
  long long v14 = a4[1];
  v16[0] = *a4;
  v16[1] = v14;
  v16[2] = a4[2];
  char v15 = v12(v9, v10, v17, v16, &v18, a6, a7, a8);
  objc_storeStrong((id *)(v11 + 40), v18);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v15;
}

uint64_t sub_1DCB57A64(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  self;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obunint64_t j = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v54 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(id *)(*((void *)&v22 + 1) + 8 * i);
        id v12 = v7;
        self;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v51 = 0u;
        long long v13 = [v11 url];
        +[SNAudioFileUtils getTimeRangeEncompassingEntireAudioFileAtURL:v13 error:a4];

        if ((BYTE12(v51) & 1) == 0 || (BYTE4(v53) & 1) == 0)
        {

LABEL_22:
          uint64_t v19 = 0;
          goto LABEL_24;
        }
        uint64_t v47 = 0;
        long long v48 = &v47;
        uint64_t v49 = 0x2020000000;
        char v50 = 1;
        uint64_t v41 = 0;
        id v42 = &v41;
        uint64_t v43 = 0x3032000000;
        id v44 = sub_1DCB56A18;
        id v45 = sub_1DCB56A28;
        id v46 = 0;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v38 = 0u;
        if (v11)
        {
          [v11 timeRange];
          uint64_t v14 = v37;
        }
        else
        {
          uint64_t v14 = 0;
          long long v36 = 0uLL;
          long long v37 = 0uLL;
          long long v35 = 0uLL;
        }
        long long v32 = v51;
        long long v33 = v52;
        long long v34 = v53;
        +[SNTimeUtils convertScaleForTimeRange:&v32 toValue:v14 preferShrinkingWhenRounding:1];
        if (v11) {
          [v11 timeRange];
        }
        else {
          memset(v31, 0, sizeof(v31));
        }
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = sub_1DCB579C4;
        void v26[3] = &unk_1E6CA7A08;
        id v29 = &v47;
        id v15 = v12;
        id v28 = v15;
        id v16 = v11;
        id v27 = v16;
        uint64_t v30 = &v41;
        long long v32 = v38;
        long long v33 = v39;
        long long v34 = v40;
        +[SNTimeUtils clipTimeRange:&v32 toBounds:v31 handler:v26];
        int v17 = *((unsigned __int8 *)v48 + 24);
        if (a4 && !*((unsigned char *)v48 + 24))
        {
          *a4 = (id) v42[5];
          int v17 = *((unsigned __int8 *)v48 + 24);
        }
        BOOL v18 = v17 == 0;

        _Block_object_dispose(&v41, 8);
        _Block_object_dispose(&v47, 8);

        if (v18) {
          goto LABEL_22;
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v54 count:16];
      uint64_t v19 = 1;
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v19 = 1;
  }
LABEL_24:

  return v19;
}

void sub_1DCB57E10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
}

uint64_t sub_1DCB57E3C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1DCB58014;
  aBlock[3] = &unk_1E6CA7A30;
  long long v22 = *(_OWORD *)(a1 + 56);
  uint64_t v23 = *(void *)(a1 + 72);
  uint64_t v21 = *(void *)(a1 + 40);
  int v24 = *(_DWORD *)(a1 + 80);
  id v6 = v5;
  id v20 = v6;
  id v7 = _Block_copy(aBlock);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1DCB58154;
  _OWORD v17[3] = &unk_1E6CA7A58;
  id v8 = v7;
  id v18 = v8;
  uint64_t v9 = _Block_copy(v17);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = sub_1DCB58264;
  long long v14[3] = &unk_1E6CA7A80;
  uint64_t v16 = *(void *)(a1 + 48);
  id v10 = v9;
  id v15 = v10;
  id v11 = _Block_copy(v14);
  if (sub_1DCB57A64(*(void *)(a1 + 48), *(void **)(a1 + 32), v11, a3)) {
    uint64_t v12 = sub_1DCB57A64(*(void *)(a1 + 48), *(void **)(a1 + 32), v10, a3);
  }
  else {
    uint64_t v12 = 0;
  }

  return v12;
}

BOOL sub_1DCB58014(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (*(void *)(a3 + 24) >= *(void *)(a1 + 48) - *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    int64_t v8 = *(void *)(a1 + 48) - *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  else {
    int64_t v8 = *(void *)(a3 + 24);
  }
  memset(&v17, 0, sizeof(v17));
  CMTimeMake(&duration, v8, *(_DWORD *)(a3 + 32));
  *(_OWORD *)&start.start.int value = *(_OWORD *)a3;
  start.start.CMTimeEpoch epoch = *(void *)(a3 + 16);
  CMTimeRangeMake(&v17, &start.start, &duration);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v8;
  if (v8)
  {
    uint64_t v9 = *(unsigned int *)(a1 + 72);
    id v10 = +[SNUtils zeroBufferPopulator];
    id v11 = +[SNUtils zeroBufferPopulator];
    uint64_t v12 = *(void *)(a1 + 32);
    CMTimeRange start = v17;
    BOOL v13 = +[SNUtils flushBytesFromPreciseTimeRangeInAudioFile:v7 timeRange:&start maxFramesPerBuffer:v9 recycleBuffers:1 prefixBufferPopulator:v10 suffixBufferPopulator:v11 intoSink:v12 error:a4];
  }
  else
  {
    BOOL v13 = 1;
  }

  return v13;
}

uint64_t sub_1DCB58154(uint64_t a1, void *a2, long long *a3, long long *a4, uint64_t a5)
{
  uint64_t v9 = (objc_class *)MEMORY[0x1E4F15390];
  id v10 = a2;
  id v11 = [v9 alloc];
  uint64_t v12 = [v10 url];

  BOOL v13 = (void *)[v11 initForReading:v12 commonFormat:1 interleaved:0 error:a5];
  if (v13
    && (uint64_t v16 = *(void *)(a1 + 32),
        CMTimeRange v17 = *(unsigned int (**)(uint64_t, void *, long long *, uint64_t, uint64_t, uint64_t))(v16 + 16),
        long long v18 = a3[1],
        long long v26 = *a3,
        long long v27 = v18,
        long long v28 = a3[2],
        v17(v16, v13, &v26, a5, v14, v15)))
  {
    uint64_t v21 = *(void *)(a1 + 32);
    long long v22 = *(uint64_t (**)(uint64_t, void *, long long *, uint64_t, uint64_t, uint64_t))(v21 + 16);
    long long v23 = a4[1];
    long long v26 = *a4;
    long long v27 = v23;
    long long v28 = a4[2];
    uint64_t v24 = v22(v21, v13, &v26, a5, v19, v20);
  }
  else
  {
    uint64_t v24 = 0;
  }

  return v24;
}

uint64_t sub_1DCB58264(uint64_t a1, void *a2, long long *a3, _OWORD *a4, uint64_t a5)
{
  id v7 = *(void **)(a1 + 32);
  long long v15 = *a3;
  long long v16 = a3[1];
  long long v8 = a4[1];
  *(_OWORD *)&range.start.int value = *a4;
  *(_OWORD *)&range.start.CMTimeEpoch epoch = v8;
  *(_OWORD *)&range.duration.timescale = a4[2];
  uint64_t v9 = v7;
  id v10 = a2;
  self;
  memset(&v24, 0, sizeof(v24));
  CMTimeRangeGetEnd(&v24, &range);
  memset(&v22, 0, sizeof(v22));
  CMTimeMake(&v22, 1, 1);
  memset(&v21, 0, sizeof(v21));
  range.CMTimeRange start = v24;
  rhs.CMTimeRange start = v22;
  CMTimeSubtract(&v21, &range.start, &rhs.start);
  memset(&v20, 0, sizeof(v20));
  range.CMTimeRange start = v21;
  long long v14 = *MEMORY[0x1E4F1FA48];
  *(_OWORD *)&rhs.start.int value = *MEMORY[0x1E4F1FA48];
  CMTimeEpoch v11 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  rhs.start.CMTimeEpoch epoch = v11;
  if (CMTimeCompare(&range.start, &rhs.start) == -1) {
    CMTimeMake(&v20, 0, v21.timescale);
  }
  else {
    CMTime v20 = v21;
  }
  *(_OWORD *)&rhs.start.int value = v15;
  rhs.start.CMTimeEpoch epoch = v16;
  *(_OWORD *)&duration.int value = v14;
  duration.CMTimeEpoch epoch = v11;
  CMTimeRangeMake(&range, &rhs.start, &duration);
  duratiouint64_t n = v20;
  CMTime end = v24;
  CMTimeRangeFromTimeToTime(&rhs, &duration, &end);
  uint64_t v12 = v9[2](v9, v10, &range, &rhs, a5);

  return v12;
}

id sub_1DCB5843C(uint64_t a1)
{
  return *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
}

uint64_t sub_1DCB5844C(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  v93[6] = *MEMORY[0x1E4F143B8];
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1DCB58C4C;
  aBlock[3] = &unk_1E6CA7AF8;
  uint64_t v90 = *(void *)(a1 + 64);
  id v89 = *(id *)(a1 + 48);
  long long v14 = _Block_copy(aBlock);
  context = (void *)MEMORY[0x1E01A90A0]();
  long long v15 = *(void **)(a1 + 56);
  long long v16 = *(void **)(a1 + 32);
  CMTimeRange v17 = *(void **)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 80);
  id v87 = 0;
  id v19 = v10;
  id v80 = v16;
  id v81 = v15;
  id v79 = v17;
  id v20 = v13;
  id v21 = v12;
  id v85 = v11;
  CMTime v22 = v14;
  self;
  id v23 = objc_alloc(MEMORY[0x1E4F15390]);
  CMTime v24 = [v19 url];
  long long v25 = (void *)[v23 initForReading:v24 commonFormat:1 interleaved:0 error:&v87];

  if (!v25)
  {
    uint64_t v26 = 0;

    goto LABEL_43;
  }
  if (v19) {
    [v19 timeRange];
  }
  else {
    memset(v91, 0, sizeof(v91));
  }
  long long v27 = +[SNUtils zeroBufferPopulator];
  long long v28 = +[SNUtils zeroBufferPopulator];
  uint64_t v26 = +[SNUtils createMultiArrayContainingPreciseTimeRangeOfAudioFile:v25 timeRange:v91 maxFramesPerBuffer:0x2000 recycleBuffers:1 prefixBufferPopulator:v27 suffixBufferPopulator:v28 numDimensions:3 error:&v87];

  uint64_t v74 = (void *)v26;
  if (!v26)
  {

    goto LABEL_43;
  }
  if (!v18)
  {
    uint64_t v26 = 1;

    goto LABEL_43;
  }
  uint64_t v29 = 0;
  id v72 = v21;
  int v68 = v22 + 2;
  id v69 = v25;
  uint64_t v67 = v18 - 1;
  id v73 = v20;
  uint64_t v70 = v22;
  id v71 = v19;
  while (1)
  {
    uint64_t v77 = v29;
    uint64_t v30 = [NSNumber numberWithUnsignedLong:v29];
    int32_t v31 = v81[2]();
    id v82 = v80;
    double v78 = v22;
    id v32 = v31;
    id v33 = v85;
    id v34 = v21;
    id v35 = v20;
    id v36 = v30;
    id v37 = v79;
    id v38 = v74;
    self;
    id v86 = v38;
    id v39 = v37;
    id v40 = v35;
    id v41 = v34;
    id v42 = v33;
    id v84 = v32;
    id v43 = v36;
    self;
    id v44 = +[SNUtils toMLMultiArrayConvertFromFloatScalar:v43 error:&v87];
    uint64_t v83 = v43;

    if (!v44)
    {
      long long v51 = 0;
      id v46 = 0;
      id v45 = 0;
LABEL_20:
      long long v48 = 0;
LABEL_21:
      long long v52 = 0;
      goto LABEL_22;
    }
    id v45 = +[SNUtils toMLMultiArrayConvertFromFloatScalar:v42 error:&v87];
    if (!v45)
    {
      long long v51 = 0;
      id v46 = 0;
      goto LABEL_20;
    }
    id v46 = +[SNUtils toMLMultiArrayConvertFromFloatScalar:v40 error:&v87];
    if (!v46)
    {
      long long v51 = 0;
      goto LABEL_20;
    }
    uint64_t v47 = +[SNUtils toMLMultiArrayConvertFromFloatScalar:v41 error:&v87];
    long long v48 = (void *)v47;
    if (!v47)
    {
      long long v51 = 0;
      goto LABEL_21;
    }
    uint64_t v49 = (void *)MEMORY[0x1E4F1CA60];
    v92[0] = @"foreground";
    v92[1] = @"background";
    v93[0] = v86;
    v93[1] = v39;
    v92[2] = @"shiftIteration";
    v92[3] = @"set";
    v93[2] = v44;
    v93[3] = v46;
    v92[4] = @"shiftedSamples";
    v92[5] = @"segmentLength";
    v93[4] = v47;
    v93[5] = v45;
    char v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:v92 count:6];
    long long v51 = [v49 dictionaryWithDictionary:v50];

    if (!v51) {
      goto LABEL_21;
    }
    if (v84) {
      [v51 setObject:v84 forKey:@"stateIn"];
    }
    long long v52 = (void *)[objc_alloc(MEMORY[0x1E4F1E930]) initWithDictionary:v51 error:&v87];
LABEL_22:

    long long v53 = v84;
    id v21 = v72;
    id v20 = v73;
    if (!v52) {
      goto LABEL_40;
    }
    uint64_t v54 = [v82 predictionFromFeatures:v52 error:&v87];
    if (!v54) {
      goto LABEL_40;
    }
    id v55 = v54;
    uint64_t v56 = v78;
    self;
    uint64_t v57 = [v55 featureValueForName:@"embedding"];
    id v58 = [v57 multiArrayValue];
    if (!v58)
    {
      +[SNError populateClientError:&v87 withCode:1 underlyingError:0 message:@"Expected multiarray embedding output."];
      goto LABEL_39;
    }
    id v59 = [v55 featureValueForName:@"label"];

    unsigned int v60 = [v59 multiArrayValue];

    if (!v60)
    {
      +[SNError populateClientError:&v87 withCode:1 underlyingError:0 message:@"Expected multiarray label output."];
LABEL_36:
      uint64_t v57 = v59;
      goto LABEL_38;
    }
    int32_t v61 = [v59 multiArrayValue];
    uint64_t v62 = +[SNUtils toFloatScalarConvertFromMLMultiArray:v61 error:&v87];

    if (!v62) {
      goto LABEL_36;
    }
    uint64_t v57 = [v55 featureValueForName:@"stateOut"];

    uint64_t v63 = [v57 multiArrayValue];
    if (!v63) {
      break;
    }
    std::string::size_type v64 = (void *)v63;
    uint64_t v26 = (*v68)(v56, v58, v62, v63, &v87);

    if (!v26) {
      goto LABEL_41;
    }
    uint64_t v29 = v77 + 1;
    CMTime v22 = v70;
    id v19 = v71;
    long long v25 = v69;
    if (v67 == v77) {
      goto LABEL_42;
    }
  }
  +[SNError populateClientError:&v87 withCode:1 underlyingError:0 message:@"Expected multiarray state output."];

LABEL_38:
  long long v53 = v84;
LABEL_39:

LABEL_40:
  uint64_t v26 = 0;
LABEL_41:
  CMTime v22 = v70;
  id v19 = v71;
  long long v25 = v69;
LABEL_42:

LABEL_43:
  id v65 = v87;
  if (a6) {
    *a6 = v65;
  }

  return v26;
}

uint64_t sub_1DCB58C4C(uint64_t a1, void *a2, void *a3, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v8 = obj;
  id v9 = a3;
  id v10 = a2;
  uint64_t v11 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return v11;
}

uint64_t sub_1DCB58CE8(uint64_t a1)
{
  return 1;
}

void *sub_1DCB591B8(void *result, void *a2, void *a3)
{
  uint64_t v3 = a2[1];
  *uint64_t result = *a2;
  result[1] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v4 = a3[1];
  result[2] = *a3;
  result[3] = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  if (!*a2)
  {
    exceptiouint64_t n = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "analyzerProcessingGraph should be non-null");
    __cxa_throw(exception, (struct type_info *)&unk_1F37F6188, MEMORY[0x1E4FBA1B0]);
  }
  if (!*(unsigned char *)(*a2 + 761))
  {
    id v5 = "requestProcessingGraph->configured()";
    int v6 = 21;
    goto LABEL_12;
  }
  if (*a3 && !*(unsigned char *)(*a3 + 761))
  {
    id v5 = "sharedProcessingGraph->configured()";
    int v6 = 22;
LABEL_12:
    __assert_rtn("ProcessingContext", "SoundAnalysis_ProcessingContext.cpp", v6, v5);
  }
  return result;
}

void sub_1DCB592A4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  uint64_t v4 = *(std::__shared_weak_count **)(v1 + 24);
  if (v4) {
    sub_1DCB44254(v4);
  }
  id v5 = *(std::__shared_weak_count **)(v1 + 8);
  if (v5) {
    sub_1DCB44254(v5);
  }
  _Unwind_Resume(a1);
}

__n128 sub_1DCB592D8@<Q0>(DSPGraph::Graph **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = a1[2];
  if (v4 && (int v5 = sub_1DCB492EC(v4), v5 == sub_1DCB491C8(*a1)))
  {
    uint64_t v6 = sub_1DCB59370(*a1);
    long long v7 = *(_OWORD *)(v6 + 16);
    *(_OWORD *)a2 = *(_OWORD *)v6;
    *(_OWORD *)(a2 + 16) = v7;
    __n128 result = *(__n128 *)(v6 + 32);
    *(__n128 *)(a2 + 32) = result;
  }
  else
  {
    uint64_t v9 = sub_1DCB4CACC(*a1);
    __n128 result = *(__n128 *)v9;
    long long v10 = *(_OWORD *)(v9 + 16);
    *(_OWORD *)a2 = *(_OWORD *)v9;
    *(_OWORD *)(a2 + 16) = v10;
    *(void *)(a2 + 32) = *(void *)(v9 + 32);
    *(_DWORD *)(a2 + 40) = 1;
  }
  return result;
}

uint64_t sub_1DCB59370(DSPGraph::Graph *a1)
{
  uint64_t v1 = DSPGraph::Graph::in(a1);
  uint64_t v2 = *(void *)(v1 + 88);
  if (*(void *)(v1 + 96) != v2) {
    return *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2) + 120);
  }
  sub_1DCB43D1C(v8, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
  sub_1DCB43D1C(v7, "out");
  int v5 = (void *)(v1 + 32);
  if (*(char *)(v1 + 55) < 0) {
    int v5 = (void *)*v5;
  }
  DSPGraph::strprintf(v6, (DSPGraph *)"Box::out inIndex out of range! box %s has %zu outputs but input %u was requested", v4, v5, (uint64_t)(*(void *)(v1 + 96) - *(void *)(v1 + 88)) >> 5, 0);
  uint64_t result = DSPGraph::ThrowException();
  __break(1u);
  return result;
}

void sub_1DCB59444(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (*(char *)(v23 - 17) < 0) {
    operator delete(*(void **)(v23 - 40));
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DCB59490@<X0>(DSPGraph::Graph **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = DSPGraph::Graph::numOutputs(*a1);
  if (!result)
  {
    *(_OWORD *)(a2 + 2_Block_object_dispose(&STACK[0x220], 8) = 0u;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    return result;
  }
  uint64_t v5 = DSPGraph::Graph::out(*a1);
  uint64_t v6 = *(void *)(v5 + 64);
  if (*(void *)(v5 + 72) != v6)
  {
    uint64_t v7 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v6 + 40))(v6) + 120);
    int v8 = *(_DWORD *)(v7 + 8);
    if (v8 == 1819304813 || v8 == 1718773105)
    {
      uint64_t v10 = sub_1DCB4CC58(*a1);
    }
    else
    {
      int v11 = *(_DWORD *)(v7 + 16);
      uint64_t v10 = sub_1DCB4CC58(*a1);
      if (v11)
      {
        uint64_t result = sub_1DCB492EC(*a1);
        goto LABEL_13;
      }
    }
    uint64_t result = 1;
LABEL_13:
    long long v12 = *(_OWORD *)(v10 + 16);
    *(_OWORD *)a2 = *(_OWORD *)v10;
    *(_OWORD *)(a2 + 16) = v12;
    *(void *)(a2 + 32) = *(void *)(v10 + 32);
    *(_DWORD *)(a2 + 40) = result;
    return result;
  }
  uint64_t v13 = v5;
  sub_1DCB43D1C(v18, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
  sub_1DCB43D1C(v17, "in");
  long long v15 = (void *)(v13 + 32);
  if (*(char *)(v13 + 55) < 0) {
    long long v15 = (void *)*v15;
  }
  DSPGraph::strprintf(v16, (DSPGraph *)"Box::in inIndex out of range! box %s has %zu inputs but input %u was requested", v14, v15, (uint64_t)(*(void *)(v13 + 72) - *(void *)(v13 + 64)) >> 5, 0);
  uint64_t result = DSPGraph::ThrowException();
  __break(1u);
  return result;
}

void sub_1DCB59610(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (*(char *)(v23 - 33) < 0) {
    operator delete(*(void **)(v23 - 56));
  }
  _Unwind_Resume(exception_object);
}

void sub_1DCB59BA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCB59C30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCB59D44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_1DCB59D60(void *a1, uint64_t a2, uint64_t *a3)
{
  if (!a1) {
    return 0;
  }
  v12.receiver = a1;
  v12.super_class = (Class)SNDSPGraphBox;
  uint64_t v5 = objc_msgSendSuper2(&v12, sel_init);
  if (v5)
  {
    if (!a2)
    {
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:sel_initWithBox_fromGraph_, v5, @"SNDSPGraphBox.mm", 35, @"Invalid parameter not satisfying: %@", @"box" object file lineNumber description];
    }
    if (!*a3)
    {
      int v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:sel_initWithBox_fromGraph_, v5, @"SNDSPGraphBox.mm", 36, @"Invalid parameter not satisfying: %@", @"graph" object file lineNumber description];
    }
    v5[1] = a2;
    uint64_t v7 = *a3;
    uint64_t v6 = a3[1];
    if (v6) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
    }
    int v8 = (std::__shared_weak_count *)v5[3];
    v5[2] = v7;
    void v5[3] = v6;
    if (v8) {
      sub_1DCB44254(v8);
    }
  }
  return v5;
}

void sub_1DCB59EA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB59ECC(uint64_t a1)
{
  v3[4] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v3[0] = &unk_1F37F7E60;
  v3[1] = 0;
  v3[3] = v3;
  uint64_t v1 = ((*(void *)(*(void *)(a1 + 8) + 96) - *(void *)(*(void *)(a1 + 8) + 88)) >> 5);
  sub_1DCB5D364(v3);
  return v1;
}

BOOL sub_1DCB59F68(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  int v8 = &unk_1F37F8250;
  char v9 = 0;
  uint64_t v10 = &v8;
  int v7 = *a3;
  int v4 = (*(uint64_t (**)(void))(**(void **)(a1 + 8) + 304))();
  *a3 = v7;
  BOOL v5 = v4 == 0;
  sub_1DCB5D2E0(&v8);
  return v5;
}

void sub_1DCB5A074(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, long long buf, int *a16, long long a17, int a18, int a19)
{
  if (a2)
  {
    if (a2 == 4)
    {
      id v20 = (char *)__cxa_begin_catch(a1);
      int v21 = *((_DWORD *)v20 + 2);
      a10 = v21;
      CMTime v22 = sub_1DCB6CF14();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = v20 + 72;
        if (v20[95] < 0) {
          uint64_t v23 = (void *)*v23;
        }
        CMTime v24 = v20 + 16;
        if (v20[39] < 0) {
          CMTime v24 = (void *)*v24;
        }
        int v25 = *((_DWORD *)v20 + 10);
        LODWORD(buf) = 67110402;
        DWORD1(buf) = v21;
        WORD4(buf) = 1040;
        *(_DWORD *)((char *)&buf + 10) = 4;
        HIWORD(buf) = 2080;
        a16 = &a10;
        LOWORD(a17) = 2080;
        *(void *)((char *)&a17 + 2) = v23;
        WORD5(a17) = 2080;
        *(void *)((char *)&a17 + 12) = v24;
        LOWORD(a19) = 1024;
        *(int *)((char *)&a19 + 2) = v25;
        _os_log_impl(&dword_1DC873000, v22, OS_LOG_TYPE_ERROR, "Caught graph exception %d %4.4s %s in %s:%i", (uint8_t *)&buf, 0x32u);
      }
    }
    else if (a2 == 3)
    {
      uint64_t v26 = __cxa_begin_catch(a1);
      CMTime v22 = sub_1DCB6CF14();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = (*(uint64_t (**)(void *))(*(void *)v26 + 16))(v26);
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = v27;
        _os_log_impl(&dword_1DC873000, v22, OS_LOG_TYPE_ERROR, "std::exception caught: %s.", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      long long v28 = (int *)__cxa_begin_catch(a1);
      if (a2 == 2)
      {
        int v29 = *v28;
        a10 = *v28;
        CMTime v22 = sub_1DCB6CF14();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 67109634;
          DWORD1(buf) = v29;
          WORD4(buf) = 1040;
          *(_DWORD *)((char *)&buf + 10) = 4;
          HIWORD(buf) = 2080;
          a16 = &a10;
          _os_log_impl(&dword_1DC873000, v22, OS_LOG_TYPE_ERROR, "Caught OSStatus exception %d %4.4s", (uint8_t *)&buf, 0x18u);
        }
      }
      else
      {
        CMTime v22 = sub_1DCB6CF14();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1DC873000, v22, OS_LOG_TYPE_ERROR, "Unknown exception caught!", (uint8_t *)&buf, 2u);
        }
      }
    }

    __cxa_end_catch();
    if (a14)
    {
      (*(void (**)(uint64_t))(*(void *)a14 + 48))(a14);
      JUMPOUT(0x1DCB5A030);
    }
    sub_1DCB4C86C();
  }
  _Unwind_Resume(a1);
}

BOOL sub_1DCB5A348(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  int v8 = &unk_1F37F8298;
  char v9 = 0;
  uint64_t v10 = &v8;
  BOOL v6 = (*(unsigned int (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(void **)(a1 + 8)
                                                                                           + 312))(*(void *)(a1 + 8), a4, a5, a6, a3, a2) == 0;
  sub_1DCB5D2E0(&v8);
  return v6;
}

void sub_1DCB5A434(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, long long buf, int *a17, long long a18, int a19, int a20)
{
  if (a2)
  {
    if (a2 == 4)
    {
      int v21 = (char *)__cxa_begin_catch(a1);
      int v22 = *((_DWORD *)v21 + 2);
      a11 = v22;
      uint64_t v23 = sub_1DCB6CF14();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        CMTime v24 = v21 + 72;
        if (v21[95] < 0) {
          CMTime v24 = (void *)*v24;
        }
        int v25 = v21 + 16;
        if (v21[39] < 0) {
          int v25 = (void *)*v25;
        }
        int v26 = *((_DWORD *)v21 + 10);
        LODWORD(buf) = 67110402;
        DWORD1(buf) = v22;
        WORD4(buf) = 1040;
        *(_DWORD *)((char *)&buf + 10) = 4;
        HIWORD(buf) = 2080;
        a17 = &a11;
        LOWORD(a1_Block_object_dispose(&STACK[0x220], 8) = 2080;
        *(void *)((char *)&a18 + 2) = v24;
        WORD5(a1_Block_object_dispose(&STACK[0x220], 8) = 2080;
        *(void *)((char *)&a18 + 12) = v25;
        LOWORD(a20) = 1024;
        *(int *)((char *)&a20 + 2) = v26;
        _os_log_impl(&dword_1DC873000, v23, OS_LOG_TYPE_ERROR, "Caught graph exception %d %4.4s %s in %s:%i", (uint8_t *)&buf, 0x32u);
      }
    }
    else if (a2 == 3)
    {
      uint64_t v27 = __cxa_begin_catch(a1);
      uint64_t v23 = sub_1DCB6CF14();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = (*(uint64_t (**)(void *))(*(void *)v27 + 16))(v27);
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = v28;
        _os_log_impl(&dword_1DC873000, v23, OS_LOG_TYPE_ERROR, "std::exception caught: %s.", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      int v29 = (int *)__cxa_begin_catch(a1);
      if (a2 == 2)
      {
        int v30 = *v29;
        a11 = *v29;
        uint64_t v23 = sub_1DCB6CF14();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 67109634;
          DWORD1(buf) = v30;
          WORD4(buf) = 1040;
          *(_DWORD *)((char *)&buf + 10) = 4;
          HIWORD(buf) = 2080;
          a17 = &a11;
          _os_log_impl(&dword_1DC873000, v23, OS_LOG_TYPE_ERROR, "Caught OSStatus exception %d %4.4s", (uint8_t *)&buf, 0x18u);
        }
      }
      else
      {
        uint64_t v23 = sub_1DCB6CF14();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1DC873000, v23, OS_LOG_TYPE_ERROR, "Unknown exception caught!", (uint8_t *)&buf, 2u);
        }
      }
    }

    __cxa_end_catch();
    if (a15)
    {
      (*(void (**)(uint64_t))(*(void *)a15 + 48))(a15);
      JUMPOUT(0x1DCB5A3F0);
    }
    sub_1DCB4C86C();
  }
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB5A708(uint64_t a1, float *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  int v7 = &unk_1F37F8208;
  char v8 = 0;
  char v9 = &v7;
  *a2 = (*(float (**)(void, uint64_t, uint64_t, uint64_t))(**(void **)(a1 + 8) + 88))(*(void *)(a1 + 8), a3, a4, a5);
  uint64_t v5 = 1;
  sub_1DCB5D2E0(&v7);
  return v5;
}

void sub_1DCB5A7E0(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, long long buf, int *a17, long long a18, int a19, int a20)
{
  if (a2)
  {
    if (a2 == 4)
    {
      int v21 = (char *)__cxa_begin_catch(a1);
      int v22 = *((_DWORD *)v21 + 2);
      a11 = v22;
      uint64_t v23 = sub_1DCB6CF14();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        CMTime v24 = v21 + 72;
        if (v21[95] < 0) {
          CMTime v24 = (void *)*v24;
        }
        int v25 = v21 + 16;
        if (v21[39] < 0) {
          int v25 = (void *)*v25;
        }
        int v26 = *((_DWORD *)v21 + 10);
        LODWORD(buf) = 67110402;
        DWORD1(buf) = v22;
        WORD4(buf) = 1040;
        *(_DWORD *)((char *)&buf + 10) = 4;
        HIWORD(buf) = 2080;
        a17 = &a11;
        LOWORD(a1_Block_object_dispose(&STACK[0x220], 8) = 2080;
        *(void *)((char *)&a18 + 2) = v24;
        WORD5(a1_Block_object_dispose(&STACK[0x220], 8) = 2080;
        *(void *)((char *)&a18 + 12) = v25;
        LOWORD(a20) = 1024;
        *(int *)((char *)&a20 + 2) = v26;
        _os_log_impl(&dword_1DC873000, v23, OS_LOG_TYPE_ERROR, "Caught graph exception %d %4.4s %s in %s:%i", (uint8_t *)&buf, 0x32u);
      }
    }
    else if (a2 == 3)
    {
      uint64_t v27 = __cxa_begin_catch(a1);
      uint64_t v23 = sub_1DCB6CF14();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = (*(uint64_t (**)(void *))(*(void *)v27 + 16))(v27);
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = v28;
        _os_log_impl(&dword_1DC873000, v23, OS_LOG_TYPE_ERROR, "std::exception caught: %s.", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      int v29 = (int *)__cxa_begin_catch(a1);
      if (a2 == 2)
      {
        int v30 = *v29;
        a11 = *v29;
        uint64_t v23 = sub_1DCB6CF14();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 67109634;
          DWORD1(buf) = v30;
          WORD4(buf) = 1040;
          *(_DWORD *)((char *)&buf + 10) = 4;
          HIWORD(buf) = 2080;
          a17 = &a11;
          _os_log_impl(&dword_1DC873000, v23, OS_LOG_TYPE_ERROR, "Caught OSStatus exception %d %4.4s", (uint8_t *)&buf, 0x18u);
        }
      }
      else
      {
        uint64_t v23 = sub_1DCB6CF14();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1DC873000, v23, OS_LOG_TYPE_ERROR, "Unknown exception caught!", (uint8_t *)&buf, 2u);
        }
      }
    }

    __cxa_end_catch();
    if (a15)
    {
      (*(void (**)(uint64_t))(*(void *)a15 + 48))(a15);
      JUMPOUT(0x1DCB5A79CLL);
    }
    sub_1DCB4C86C();
  }
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB5AAB4(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v3 = &unk_1F37F82E0;
  char v4 = 0;
  uint64_t v5 = &v3;
  (*(void (**)(void))(**(void **)(a1 + 8) + 80))(*(void *)(a1 + 8));
  uint64_t v1 = 1;
  sub_1DCB5D2E0(&v3);
  return v1;
}

void sub_1DCB5AB78(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, long long buf, int *a17, long long a18, int a19, int a20)
{
  if (a2)
  {
    if (a2 == 4)
    {
      int v21 = (char *)__cxa_begin_catch(a1);
      int v22 = *((_DWORD *)v21 + 2);
      a11 = v22;
      uint64_t v23 = sub_1DCB6CF14();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        CMTime v24 = v21 + 72;
        if (v21[95] < 0) {
          CMTime v24 = (void *)*v24;
        }
        int v25 = v21 + 16;
        if (v21[39] < 0) {
          int v25 = (void *)*v25;
        }
        int v26 = *((_DWORD *)v21 + 10);
        LODWORD(buf) = 67110402;
        DWORD1(buf) = v22;
        WORD4(buf) = 1040;
        *(_DWORD *)((char *)&buf + 10) = 4;
        HIWORD(buf) = 2080;
        a17 = &a11;
        LOWORD(a1_Block_object_dispose(&STACK[0x220], 8) = 2080;
        *(void *)((char *)&a18 + 2) = v24;
        WORD5(a1_Block_object_dispose(&STACK[0x220], 8) = 2080;
        *(void *)((char *)&a18 + 12) = v25;
        LOWORD(a20) = 1024;
        *(int *)((char *)&a20 + 2) = v26;
        _os_log_impl(&dword_1DC873000, v23, OS_LOG_TYPE_ERROR, "Caught graph exception %d %4.4s %s in %s:%i", (uint8_t *)&buf, 0x32u);
      }
    }
    else if (a2 == 3)
    {
      uint64_t v27 = __cxa_begin_catch(a1);
      uint64_t v23 = sub_1DCB6CF14();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = (*(uint64_t (**)(void *))(*(void *)v27 + 16))(v27);
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = v28;
        _os_log_impl(&dword_1DC873000, v23, OS_LOG_TYPE_ERROR, "std::exception caught: %s.", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      int v29 = (int *)__cxa_begin_catch(a1);
      if (a2 == 2)
      {
        int v30 = *v29;
        a11 = *v29;
        uint64_t v23 = sub_1DCB6CF14();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 67109634;
          DWORD1(buf) = v30;
          WORD4(buf) = 1040;
          *(_DWORD *)((char *)&buf + 10) = 4;
          HIWORD(buf) = 2080;
          a17 = &a11;
          _os_log_impl(&dword_1DC873000, v23, OS_LOG_TYPE_ERROR, "Caught OSStatus exception %d %4.4s", (uint8_t *)&buf, 0x18u);
        }
      }
      else
      {
        uint64_t v23 = sub_1DCB6CF14();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1DC873000, v23, OS_LOG_TYPE_ERROR, "Unknown exception caught!", (uint8_t *)&buf, 2u);
        }
      }
    }

    __cxa_end_catch();
    if (a15)
    {
      (*(void (**)(uint64_t))(*(void *)a15 + 48))(a15);
      JUMPOUT(0x1DCB5AB34);
    }
    sub_1DCB4C86C();
  }
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB5AE4C(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v11 = &unk_1F37F7FC8;
  int v12 = 0;
  uint64_t v13 = &v11;
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(v3 + 64);
  if (a2 < (unint64_t)((*(void *)(v3 + 72) - v4) >> 5))
  {
    uint64_t v5 = *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)(v4 + 32 * a2)
                                                                          + 40))(v4 + 32 * a2)
                                     + 120)
                         + 40);
    sub_1DCB5D788(&v11);
    return v5;
  }
  sub_1DCB43D1C(&v10, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
  sub_1DCB43D1C(buf, "in");
  char v8 = (void *)(v3 + 32);
  if (*(char *)(v3 + 55) < 0) {
    char v8 = (void *)*v8;
  }
  DSPGraph::strprintf((uint64_t *)&__p, (DSPGraph *)"Box::in inIndex out of range! box %s has %zu inputs but input %u was requested", v7, v8, (uint64_t)(*(void *)(v3 + 72) - *(void *)(v3 + 64)) >> 5, a2);
  uint64_t result = DSPGraph::ThrowException();
  __break(1u);
  return result;
}

void sub_1DCB5B27C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  __cxa_end_catch();
  sub_1DCB5D788((uint64_t *)va);
  _Unwind_Resume(a1);
}

void *sub_1DCB5B2D8(void *result, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v9[0] = &unk_1F37F80A0;
    v9[1] = 0;
    void v9[3] = v9;
    uint64_t v3 = result[1];
    uint64_t v4 = *(void *)(v3 + 64);
    if (a2 >= (unint64_t)((*(void *)(v3 + 72) - v4) >> 5))
    {
      sub_1DCB43D1C(&v8, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
      sub_1DCB43D1C(buf, "in");
      uint64_t v6 = (void *)(v3 + 32);
      if (*(char *)(v3 + 55) < 0) {
        uint64_t v6 = (void *)*v6;
      }
      DSPGraph::strprintf((uint64_t *)&__p, (DSPGraph *)"Box::in inIndex out of range! box %s has %zu inputs but input %u was requested", v5, v6, (uint64_t)(*(void *)(v3 + 72) - *(void *)(v3 + 64)) >> 5, a2);
      uint64_t result = (void *)DSPGraph::ThrowException();
      __break(1u);
    }
    else
    {
      (*(uint64_t (**)(uint64_t))(*(void *)(v4 + 32 * a2) + 40))(v4 + 32
                                                                                                 * a2);
      return sub_1DCB5D8A0(v9);
    }
  }
  return result;
}

void sub_1DCB5B70C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  __cxa_end_catch();
  sub_1DCB5D8A0((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB5B768(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v11 = &unk_1F37F8130;
  int v12 = 0;
  uint64_t v13 = &v11;
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(v3 + 64);
  if (a2 < (unint64_t)((*(void *)(v3 + 72) - v4) >> 5))
  {
    uint64_t v5 = *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)(v4 + 32 * a2)
                                                                          + 40))(v4 + 32 * a2)
                                     + 120)
                         + 28);
    sub_1DCB5D788(&v11);
    return v5;
  }
  sub_1DCB43D1C(&v10, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
  sub_1DCB43D1C(buf, "in");
  char v8 = (void *)(v3 + 32);
  if (*(char *)(v3 + 55) < 0) {
    char v8 = (void *)*v8;
  }
  DSPGraph::strprintf((uint64_t *)&__p, (DSPGraph *)"Box::in inIndex out of range! box %s has %zu inputs but input %u was requested", v7, v8, (uint64_t)(*(void *)(v3 + 72) - *(void *)(v3 + 64)) >> 5, a2);
  uint64_t result = DSPGraph::ThrowException();
  __break(1u);
  return result;
}

void sub_1DCB5BB98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  __cxa_end_catch();
  sub_1DCB5D788((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB5BBF4(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v11 = &unk_1F37F8058;
  int v12 = 0;
  uint64_t v13 = &v11;
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(v3 + 88);
  if (a2 < (unint64_t)((*(void *)(v3 + 96) - v4) >> 5))
  {
    uint64_t v5 = *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)(v4 + 32 * a2)
                                                                          + 40))(v4 + 32 * a2)
                                     + 120)
                         + 40);
    sub_1DCB5D788(&v11);
    return v5;
  }
  sub_1DCB43D1C(&v10, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
  sub_1DCB43D1C(buf, "out");
  char v8 = (void *)(v3 + 32);
  if (*(char *)(v3 + 55) < 0) {
    char v8 = (void *)*v8;
  }
  DSPGraph::strprintf((uint64_t *)&__p, (DSPGraph *)"Box::out inIndex out of range! box %s has %zu outputs but input %u was requested", v7, v8, (uint64_t)(*(void *)(v3 + 96) - *(void *)(v3 + 88)) >> 5, a2);
  uint64_t result = DSPGraph::ThrowException();
  __break(1u);
  return result;
}

void sub_1DCB5C024(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  __cxa_end_catch();
  sub_1DCB5D788((uint64_t *)va);
  _Unwind_Resume(a1);
}

void *sub_1DCB5C080(void *result, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v9[0] = &unk_1F37F80E8;
    v9[1] = 0;
    void v9[3] = v9;
    uint64_t v3 = result[1];
    uint64_t v4 = *(void *)(v3 + 88);
    if (a2 >= (unint64_t)((*(void *)(v3 + 96) - v4) >> 5))
    {
      sub_1DCB43D1C(&v8, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
      sub_1DCB43D1C(buf, "out");
      uint64_t v6 = (void *)(v3 + 32);
      if (*(char *)(v3 + 55) < 0) {
        uint64_t v6 = (void *)*v6;
      }
      DSPGraph::strprintf((uint64_t *)&__p, (DSPGraph *)"Box::out inIndex out of range! box %s has %zu outputs but input %u was requested", v5, v6, (uint64_t)(*(void *)(v3 + 96) - *(void *)(v3 + 88)) >> 5, a2);
      uint64_t result = (void *)DSPGraph::ThrowException();
      __break(1u);
    }
    else
    {
      (*(uint64_t (**)(uint64_t))(*(void *)(v4 + 32 * a2) + 40))(v4 + 32
                                                                                                 * a2);
      return sub_1DCB5D8A0(v9);
    }
  }
  return result;
}

void sub_1DCB5C4B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  __cxa_end_catch();
  sub_1DCB5D8A0((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB5C510(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v11 = &unk_1F37F8178;
  int v12 = 0;
  uint64_t v13 = &v11;
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(v3 + 88);
  if (a2 < (unint64_t)((*(void *)(v3 + 96) - v4) >> 5))
  {
    uint64_t v5 = *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)(v4 + 32 * a2)
                                                                          + 40))(v4 + 32 * a2)
                                     + 120)
                         + 28);
    sub_1DCB5D788(&v11);
    return v5;
  }
  sub_1DCB43D1C(&v10, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
  sub_1DCB43D1C(buf, "out");
  char v8 = (void *)(v3 + 32);
  if (*(char *)(v3 + 55) < 0) {
    char v8 = (void *)*v8;
  }
  DSPGraph::strprintf((uint64_t *)&__p, (DSPGraph *)"Box::out inIndex out of range! box %s has %zu outputs but input %u was requested", v7, v8, (uint64_t)(*(void *)(v3 + 96) - *(void *)(v3 + 88)) >> 5, a2);
  uint64_t result = DSPGraph::ThrowException();
  __break(1u);
  return result;
}

void sub_1DCB5C940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  __cxa_end_catch();
  sub_1DCB5D788((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB5C99C(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v3 = &unk_1F37F7EA8;
  int v4 = 0;
  uint64_t v5 = &v3;
  uint64_t v1 = DSPGraph::Box::sampleRate(*(DSPGraph::Box **)(a1 + 8));
  sub_1DCB5D788(&v3);
  return v1;
}

void sub_1DCB5CA40(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, long long buf, int *a17, long long a18, int a19, int a20)
{
  if (a2)
  {
    if (a2 == 4)
    {
      int v21 = (char *)__cxa_begin_catch(a1);
      int v22 = *((_DWORD *)v21 + 2);
      a11 = v22;
      uint64_t v23 = sub_1DCB6CF14();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        CMTime v24 = v21 + 72;
        if (v21[95] < 0) {
          CMTime v24 = (void *)*v24;
        }
        int v25 = v21 + 16;
        if (v21[39] < 0) {
          int v25 = (void *)*v25;
        }
        int v26 = *((_DWORD *)v21 + 10);
        LODWORD(buf) = 67110402;
        DWORD1(buf) = v22;
        WORD4(buf) = 1040;
        *(_DWORD *)((char *)&buf + 10) = 4;
        HIWORD(buf) = 2080;
        a17 = &a11;
        LOWORD(a1_Block_object_dispose(&STACK[0x220], 8) = 2080;
        *(void *)((char *)&a18 + 2) = v24;
        WORD5(a1_Block_object_dispose(&STACK[0x220], 8) = 2080;
        *(void *)((char *)&a18 + 12) = v25;
        LOWORD(a20) = 1024;
        *(int *)((char *)&a20 + 2) = v26;
        _os_log_impl(&dword_1DC873000, v23, OS_LOG_TYPE_ERROR, "Caught graph exception %d %4.4s %s in %s:%i", (uint8_t *)&buf, 0x32u);
      }
    }
    else if (a2 == 3)
    {
      uint64_t v27 = __cxa_begin_catch(a1);
      uint64_t v23 = sub_1DCB6CF14();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = (*(uint64_t (**)(void *))(*(void *)v27 + 16))(v27);
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = v28;
        _os_log_impl(&dword_1DC873000, v23, OS_LOG_TYPE_ERROR, "std::exception caught: %s.", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      int v29 = (int *)__cxa_begin_catch(a1);
      if (a2 == 2)
      {
        int v30 = *v29;
        a11 = *v29;
        uint64_t v23 = sub_1DCB6CF14();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 67109634;
          DWORD1(buf) = v30;
          WORD4(buf) = 1040;
          *(_DWORD *)((char *)&buf + 10) = 4;
          HIWORD(buf) = 2080;
          a17 = &a11;
          _os_log_impl(&dword_1DC873000, v23, OS_LOG_TYPE_ERROR, "Caught OSStatus exception %d %4.4s", (uint8_t *)&buf, 0x18u);
        }
      }
      else
      {
        uint64_t v23 = sub_1DCB6CF14();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1DC873000, v23, OS_LOG_TYPE_ERROR, "Unknown exception caught!", (uint8_t *)&buf, 2u);
        }
      }
    }

    __cxa_end_catch();
    if (a15)
    {
      (*(void (**)(uint64_t))(*(void *)a15 + 48))(a15);
      JUMPOUT(0x1DCB5C9F8);
    }
    sub_1DCB4C86C();
  }
  _Unwind_Resume(a1);
}

void *sub_1DCB5CD10(void *result, char a2)
{
  _DWORD v5[4] = *MEMORY[0x1E4F143B8];
  int v4 = result;
  char v3 = a2;
  if (result)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3321888768;
    v2[2] = sub_1DCB5CE08;
    v2[3] = &unk_1F37F8570;
    v2[4] = &v4;
    v2[5] = &v3;
    v5[0] = &unk_1F37F7B90;
    void v5[3] = v5;
    sub_1DCB5CE64(v2);
    return sub_1DCB5D25C(v5);
  }
  return result;
}

void sub_1DCB5CDF4(_Unwind_Exception *a1)
{
  sub_1DCB5D25C((void *)(v1 - 56));
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB5CE08(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 **)(a1 + 40);
  uint64_t v2 = *(void *)(**(void **)(a1 + 32) + 8);
  return (*(uint64_t (**)(uint64_t, void))(*(void *)v2 + 56))(v2, *v1);
}

__n128 sub_1DCB5CE3C(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[2];
  a1[2] = result;
  return result;
}

void sub_1DCB5CE64(void *a1)
{
  uint64_t v1 = a1;
  v1[2]();
}

void sub_1DCB5CEE0(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, long long buf, int *a13, long long a14, int a15, int a16)
{
  if (a2)
  {
    if (a2 == 4)
    {
      uint64_t v18 = (char *)__cxa_begin_catch(a1);
      int v19 = *((_DWORD *)v18 + 2);
      a11 = v19;
      id v20 = sub_1DCB6CF14();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        int v21 = v18 + 72;
        if (v18[95] < 0) {
          int v21 = (void *)*v21;
        }
        int v22 = v18 + 16;
        if (v18[39] < 0) {
          int v22 = (void *)*v22;
        }
        int v23 = *((_DWORD *)v18 + 10);
        LODWORD(buf) = 67110402;
        DWORD1(buf) = v19;
        WORD4(buf) = 1040;
        *(_DWORD *)((char *)&buf + 10) = 4;
        HIWORD(buf) = 2080;
        a13 = &a11;
        LOWORD(a14) = 2080;
        *(void *)((char *)&a14 + 2) = v21;
        WORD5(a14) = 2080;
        *(void *)((char *)&a14 + 12) = v22;
        LOWORD(a16) = 1024;
        *(int *)((char *)&a16 + 2) = v23;
        _os_log_impl(&dword_1DC873000, v20, OS_LOG_TYPE_ERROR, "Caught graph exception %d %4.4s %s in %s:%i", (uint8_t *)&buf, 0x32u);
      }
    }
    else if (a2 == 3)
    {
      CMTime v24 = __cxa_begin_catch(a1);
      id v20 = sub_1DCB6CF14();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = (*(uint64_t (**)(void *))(*(void *)v24 + 16))(v24);
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = v25;
        _os_log_impl(&dword_1DC873000, v20, OS_LOG_TYPE_ERROR, "std::exception caught: %s.", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      int v26 = (int *)__cxa_begin_catch(a1);
      if (a2 == 2)
      {
        int v27 = *v26;
        a11 = *v26;
        id v20 = sub_1DCB6CF14();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 67109634;
          DWORD1(buf) = v27;
          WORD4(buf) = 1040;
          *(_DWORD *)((char *)&buf + 10) = 4;
          HIWORD(buf) = 2080;
          a13 = &a11;
          _os_log_impl(&dword_1DC873000, v20, OS_LOG_TYPE_ERROR, "Caught OSStatus exception %d %4.4s", (uint8_t *)&buf, 0x18u);
        }
      }
      else
      {
        id v20 = sub_1DCB6CF14();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1DC873000, v20, OS_LOG_TYPE_ERROR, "Unknown exception caught!", (uint8_t *)&buf, 2u);
        }
      }
    }

    __cxa_end_catch();
    sub_1DCB5D190(v16);
    JUMPOUT(0x1DCB5CEA8);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB5D190(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 24);
  if (!v1) {
    sub_1DCB4C86C();
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)v1 + 48);

  return v2();
}

void sub_1DCB5D1E4()
{
}

void *sub_1DCB5D1F8()
{
  __n128 result = operator new(0x10uLL);
  *__n128 result = &unk_1F37F7B90;
  return result;
}

void sub_1DCB5D230(uint64_t a1, void *a2)
{
  *a2 = &unk_1F37F7B90;
}

void *sub_1DCB5D25C(void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void *sub_1DCB5D2E0(void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void *sub_1DCB5D364(void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void sub_1DCB5D3EC()
{
}

void *sub_1DCB5D400(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *__n128 result = &unk_1F37F7E60;
  result[1] = v3;
  return result;
}

uint64_t sub_1DCB5D448(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1F37F7E60;
  a2[1] = v2;
  return result;
}

uint64_t sub_1DCB5D474(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

void sub_1DCB5D480()
{
}

unsigned char *sub_1DCB5D494(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  *(void *)__n128 result = &unk_1F37F8250;
  result[8] = *(unsigned char *)(a1 + 8);
  return result;
}

uint64_t sub_1DCB5D4E0(uint64_t result, uint64_t a2)
{
  *(void *)a2 = &unk_1F37F8250;
  *(unsigned char *)(a2 + _Block_object_dispose(&STACK[0x220], 8) = *(unsigned char *)(result + 8);
  return result;
}

uint64_t sub_1DCB5D510(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

void sub_1DCB5D51C()
{
}

unsigned char *sub_1DCB5D530(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  *(void *)__n128 result = &unk_1F37F8298;
  result[8] = *(unsigned char *)(a1 + 8);
  return result;
}

uint64_t sub_1DCB5D57C(uint64_t result, uint64_t a2)
{
  *(void *)a2 = &unk_1F37F8298;
  *(unsigned char *)(a2 + _Block_object_dispose(&STACK[0x220], 8) = *(unsigned char *)(result + 8);
  return result;
}

uint64_t sub_1DCB5D5AC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

void sub_1DCB5D5B8()
{
}

unsigned char *sub_1DCB5D5CC(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  *(void *)__n128 result = &unk_1F37F8208;
  result[8] = *(unsigned char *)(a1 + 8);
  return result;
}

uint64_t sub_1DCB5D618(uint64_t result, uint64_t a2)
{
  *(void *)a2 = &unk_1F37F8208;
  *(unsigned char *)(a2 + _Block_object_dispose(&STACK[0x220], 8) = *(unsigned char *)(result + 8);
  return result;
}

uint64_t sub_1DCB5D648(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

void sub_1DCB5D654()
{
}

unsigned char *sub_1DCB5D668(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  *(void *)__n128 result = &unk_1F37F82E0;
  result[8] = *(unsigned char *)(a1 + 8);
  return result;
}

uint64_t sub_1DCB5D6B4(uint64_t result, uint64_t a2)
{
  *(void *)a2 = &unk_1F37F82E0;
  *(unsigned char *)(a2 + _Block_object_dispose(&STACK[0x220], 8) = *(unsigned char *)(result + 8);
  return result;
}

uint64_t sub_1DCB5D6E4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

void sub_1DCB5D6F0()
{
}

_DWORD *sub_1DCB5D704(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  *(void *)__n128 result = &unk_1F37F7FC8;
  result[2] = *(_DWORD *)(a1 + 8);
  return result;
}

uint64_t sub_1DCB5D750(uint64_t result, uint64_t a2)
{
  *(void *)a2 = &unk_1F37F7FC8;
  *(_DWORD *)(a2 + _Block_object_dispose(&STACK[0x220], 8) = *(_DWORD *)(result + 8);
  return result;
}

uint64_t sub_1DCB5D780(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

void *sub_1DCB5D788(void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void sub_1DCB5D810()
{
}

void *sub_1DCB5D824(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *__n128 result = &unk_1F37F80A0;
  result[1] = v3;
  return result;
}

uint64_t sub_1DCB5D86C(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1F37F80A0;
  a2[1] = v2;
  return result;
}

double sub_1DCB5D898(uint64_t a1)
{
  return *(double *)(a1 + 8);
}

void *sub_1DCB5D8A0(void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void sub_1DCB5D928()
{
}

_DWORD *sub_1DCB5D93C(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  *(void *)__n128 result = &unk_1F37F8130;
  result[2] = *(_DWORD *)(a1 + 8);
  return result;
}

uint64_t sub_1DCB5D988(uint64_t result, uint64_t a2)
{
  *(void *)a2 = &unk_1F37F8130;
  *(_DWORD *)(a2 + _Block_object_dispose(&STACK[0x220], 8) = *(_DWORD *)(result + 8);
  return result;
}

uint64_t sub_1DCB5D9B8(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

void sub_1DCB5D9C4()
{
}

_DWORD *sub_1DCB5D9D8(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  *(void *)__n128 result = &unk_1F37F8058;
  result[2] = *(_DWORD *)(a1 + 8);
  return result;
}

uint64_t sub_1DCB5DA24(uint64_t result, uint64_t a2)
{
  *(void *)a2 = &unk_1F37F8058;
  *(_DWORD *)(a2 + _Block_object_dispose(&STACK[0x220], 8) = *(_DWORD *)(result + 8);
  return result;
}

uint64_t sub_1DCB5DA54(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

void sub_1DCB5DA60()
{
}

void *sub_1DCB5DA74(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *__n128 result = &unk_1F37F80E8;
  result[1] = v3;
  return result;
}

uint64_t sub_1DCB5DABC(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1F37F80E8;
  a2[1] = v2;
  return result;
}

double sub_1DCB5DAE8(uint64_t a1)
{
  return *(double *)(a1 + 8);
}

void sub_1DCB5DAF4()
{
}

_DWORD *sub_1DCB5DB08(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  *(void *)__n128 result = &unk_1F37F8178;
  result[2] = *(_DWORD *)(a1 + 8);
  return result;
}

uint64_t sub_1DCB5DB54(uint64_t result, uint64_t a2)
{
  *(void *)a2 = &unk_1F37F8178;
  *(_DWORD *)(a2 + _Block_object_dispose(&STACK[0x220], 8) = *(_DWORD *)(result + 8);
  return result;
}

uint64_t sub_1DCB5DB84(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

void sub_1DCB5DB90()
{
}

_DWORD *sub_1DCB5DBA4(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  *(void *)__n128 result = &unk_1F37F7EA8;
  result[2] = *(_DWORD *)(a1 + 8);
  return result;
}

uint64_t sub_1DCB5DBF0(uint64_t result, uint64_t a2)
{
  *(void *)a2 = &unk_1F37F7EA8;
  *(_DWORD *)(a2 + _Block_object_dispose(&STACK[0x220], 8) = *(_DWORD *)(result + 8);
  return result;
}

uint64_t sub_1DCB5DC20(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

float sub_1DCB5DC28(float a1)
{
  double v1 = a1;
  if (a1 <= 1000.0) {
    return v1 / 66.6666667;
  }
  else {
    return log(v1 / 1000.0) / 0.0687517774 + 15.0;
  }
}

float sub_1DCB5DC8C(float a1)
{
  return log10(a1 / 700.0 + 1.0) * 2595.0;
}

float sub_1DCB5DCCC(float a1)
{
  return log(a1 / 700.0 + 1.0) * 1127.0;
}

float sub_1DCB5DD0C(float a1)
{
  double v1 = a1;
  if (v1 <= 15.0) {
    return v1 * 66.6666667 + 0.0;
  }
  else {
    return exp((v1 + -15.0) * 0.0687517774) * 1000.0;
  }
}

float sub_1DCB5DD74(float a1)
{
  return (__exp10(a1 / 2595.0) + -1.0) * 700.0;
}

float sub_1DCB5DDB4(float a1)
{
  return (exp(a1 / 1127.0) + -1.0) * 700.0;
}

uint64_t sub_1DCB5DDF4(unsigned int a1, _DWORD *a2)
{
  unsigned int v2 = a2[9] + a2[8];
  BOOL v3 = a1 >= v2;
  unsigned int v4 = a1 - v2;
  if (v3) {
    return v4 / a2[7] + 1;
  }
  else {
    return 0;
  }
}

uint64_t sub_1DCB5DE1C(unsigned int a1, _DWORD *a2)
{
  unsigned int v2 = a2[2] + a2[3];
  BOOL v3 = a1 >= v2;
  unsigned int v4 = a1 - v2;
  if (v3) {
    return v4 / a2[1] + 1;
  }
  else {
    return 0;
  }
}

uint64_t sub_1DCB5DE44(uint64_t a1, int a2, int a3, unsigned int a4, DSPComplex *__C)
{
  if (*(unsigned int *)(a1 + 48) < 4 * (unint64_t)(2 * a4) || 4 * a4 < 4 * (unint64_t)a4) {
    return 0;
  }
  vDSP_Length v6 = *(unsigned int *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 8);
  char v8 = (float *)(*(void *)a1 + 4 * (v6 * a2));
  char v9 = *(const vDSP_DFT_SetupStruct **)(a1 + 24);
  float v10 = *(float *)(a1 + 32);
  uint64_t v11 = *(float **)(a1 + 40);
  vDSP_Length v12 = a4 >> 1;
  vDSP_Length v13 = (v12 + 1);
  long long v14 = &v11[a4];
  __Z.realp = v14;
  __Z.imagp = &v14[v12];
  vDSP_ctoz(__C, 2, &__Z, 1, v12);
  vDSP_DFT_Execute(v9, __Z.realp, __Z.imagp, __Z.realp, __Z.imagp);
  float v15 = *__Z.imagp;
  *__Z.imagp = 0.0;
  LODWORD(__N) = v12 + 1;
  float v16 = v15 * v15;
  vDSP_zvmags(&__Z, 1, v11, 1, v12);
  v11[v12] = v16;
  vvsqrtf(v14, v11, (const int *)&__N);
  float __B = 0.5;
  vDSP_vsmul(v14, 1, &__B, v11, 1, (int)__N);
  if (v6)
  {
    unsigned int v17 = 0;
    uint64_t v18 = v8;
    vDSP_Length v19 = v6;
    do
    {
      LODWORD(__Z.realp) = 0;
      vDSP_dotpr(v11, 1, (const float *)(v7 + 4 * v17), 1, (float *)&__Z, v13);
      *v18++ = *(float *)&__Z.realp;
      v17 += v13;
      --v19;
    }
    while (v19);
  }
  else
  {
    vDSP_Length v6 = 0;
  }
  float __B = v10;
  uint64_t v5 = 1;
  vDSP_vsadd(v8, 1, &__B, v8, 1, v6);
  LODWORD(__Z.realp) = 1065353216;
  vDSP_vdbcon(v8, 1, (const float *)&__Z, v8, 1, v6, 1u);
  LODWORD(__N) = 1038862563;
  vDSP_vsmul(v8, 1, (const float *)&__N, v8, 1, v6);
  return v5;
}

uint64_t sub_1DCB5E034(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, unsigned int a5, unsigned int a6, int a7, uint64_t a8, float a9, const float *a10, int a11, int a12, unsigned int a13, DSPComplex *a14, unsigned int a15)
{
  if (a3 >= a12 + a11) {
    unsigned int v16 = (a3 - (a12 + a11)) / a13 + 1;
  }
  else {
    unsigned int v16 = 0;
  }
  v35[0] = a1;
  v35[1] = a4;
  v35[2] = a5;
  v35[3] = a8;
  v35[4] = LODWORD(a9);
  size_t v17 = 4 * a6;
  v35[5] = a14;
  v35[6] = a15;
  if (v17 > a15) {
    return 0;
  }
  if (!v16) {
    return 1;
  }
  int v19 = 0;
  unsigned int v20 = 0;
  uint64_t v21 = 0;
  vDSP_Length v32 = a6;
  unsigned int v22 = -a7;
  uint64_t v31 = v16 - 1;
  int v23 = a7 + a6;
  do
  {
    if (v20 >= v22) {
      unsigned int v24 = v22;
    }
    else {
      unsigned int v24 = v20;
    }
    unsigned int v25 = v24 + v23;
    if (a3 < v25) {
      unsigned int v25 = a3;
    }
    unsigned int v26 = v25 + v19;
    size_t v27 = v17;
    bzero(a14, v17);
    unsigned int v28 = v22 - v20;
    if (v22 < v20) {
      unsigned int v28 = 0;
    }
    memcpy((char *)a14 + 4 * v28, (const void *)(a2 + 4 * v20), 4 * v26);
    vDSP_vmul((const float *)a14, 1, a10, 1, (float *)a14, 1, v32);
    uint64_t result = sub_1DCB5DE44((uint64_t)v35, v21, v29, a6, a14);
    if (!result) {
      break;
    }
    v20 += a13;
    v23 += a13;
    v19 -= a13;
    BOOL v30 = v31 == v21++;
    size_t v17 = v27;
  }
  while (!v30);
  return result;
}

uint64_t sub_1DCB5E1BC(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  return sub_1DCB5E034(a1, a2, a3, *(void *)(a4 + 32), *(_DWORD *)a4, *(_DWORD *)(a4 + 16), *(_DWORD *)(a4 + 20), *(void *)(a4 + 24), *(float *)(a4 + 48), *(const float **)(a4 + 40), *(_DWORD *)(a4 + 12), *(_DWORD *)(a4 + 8), *(_DWORD *)(a4 + 4), *(DSPComplex **)(a4 + 56), *(_DWORD *)(a4 + 64));
}

void sub_1DCB5E214(uint64_t a1, uint64_t a2, vDSP_Length __N, uint64_t a4, int a5)
{
  uint64_t v5 = (a5 - 2);
  if (a5 != 2)
  {
    int v7 = __N;
    unsigned int v10 = 0;
    uint64_t v11 = 0;
    vDSP_Length v12 = __N;
    do
    {
      float __B = 2.0 / (float)(*(float *)(a4 + 4 * (v11 + 2)) - *(float *)(a4 + 4 * v11));
      vDSP_vsmul((const float *)(a2 + 4 * v10), 1, &__B, (float *)(a1 + 4 * v10), 1, v12);
      ++v11;
      v10 += v7;
    }
    while (v5 != v11);
  }
}

void *sub_1DCB5E2C4(void *result, const void *a2, unsigned int a3, uint64_t a4, int a5)
{
  if (result != a2) {
    return memcpy(result, a2, 4 * a3 * (unint64_t)(a5 - 2));
  }
  return result;
}

uint64_t sub_1DCB5E2E0(uint64_t a1, uint64_t a2)
{
  int v4 = *(_DWORD *)(a2 + 4);
  vDSP_Length v5 = *(unsigned int *)(a2 + 40);
  uint64_t v6 = (v5 >> 1) + 1;
  int v7 = v4 + v6;
  int v8 = *(_DWORD *)(a2 + 32);
  unsigned int v9 = 4 * v7 + 8;
  if (4 * v8 <= v9) {
    size_t v10 = v9;
  }
  else {
    size_t v10 = (4 * v8);
  }
  size_t v11 = (8 * v5);
  uint64_t v12 = *(int *)(a2 + 16);
  if (v12 > 2)
  {
    vDSP_Length v13 = 0;
    long long v14 = 0;
  }
  else
  {
    vDSP_Length v13 = (float (*)(float))*(&off_1F38062C8 + v12);
    long long v14 = (float (*)(float))*(&off_1F38062E0 + v12);
  }
  int v15 = *(_DWORD *)(a2 + 48);
  if (v15 == 1) {
    unsigned int v16 = sub_1DCB5E214;
  }
  else {
    unsigned int v16 = 0;
  }
  if (v15) {
    size_t v17 = (void *(*)(void *, const void *, unsigned int, uint64_t, int))v16;
  }
  else {
    size_t v17 = sub_1DCB5E2C4;
  }
  long long v106 = v17;
  int v18 = *(_DWORD *)(a2 + 44);
  unsigned int v19 = v8 - v18;
  if (-v18 < v5) {
    int v20 = -v18;
  }
  else {
    int v20 = v5;
  }
  if (v19 >= v5) {
    unsigned int v19 = v5;
  }
  unsigned int v105 = v19;
  vDSP_DFT_Setup Setup = vDSP_DFT_zrop_CreateSetup(0, v5, vDSP_DFT_FORWARD);
  unsigned int v22 = (float *)malloc_type_malloc(v10, 0xB5B4EAB2uLL);
  if (!v22 || (int v23 = malloc_type_malloc(v11, 0x6C4D9378uLL)) == 0)
  {
    uint64_t v29 = 0;
    BOOL v30 = 0;
    unsigned int v24 = 0;
    uint64_t v31 = 0;
    goto LABEL_73;
  }
  long long v104 = v23;
  unsigned int v24 = (char *)malloc_type_malloc(4 * v6 * (unint64_t)*(unsigned int *)(a2 + 4), 0x32ED6ECBuLL);
  if (v24)
  {
    long long v103 = Setup;
    unint64_t v26 = *(unsigned int *)(a2 + 40);
    int v27 = *(_DWORD *)(a2 + 4);
    uint64_t v28 = (v26 >> 1) + 1;
    if (v10 < 4 * (unint64_t)(v27 + 2 + v28))
    {
      uint64_t v29 = 0;
      BOOL v30 = 0;
LABEL_71:
      vDSP_DFT_Setup Setup = v103;
      goto LABEL_72;
    }
    float v33 = *(float *)(a2 + 8);
    float v32 = *(float *)(a2 + 12);
    id v34 = &v22[v28];
    uint64_t v96 = *(unsigned int *)(a2 + 40);
    int v97 = v11;
    *(float *)v25.i32 = *(float *)a2 / (float)v26;
    uint64_t v35 = ((v26 >> 1) + 2) & 0x1FFFFFFFELL;
    uint64x2_t v36 = (uint64x2_t)vdupq_n_s64(v26 >> 1);
    float32x2_t v37 = (float32x2_t)vdup_lane_s32(v25, 0);
    int v102 = v20;
    uint64_t v101 = (v27 + 2);
    int v99 = *(unsigned __int8 *)(a2 + 24);
    int v100 = *(_DWORD *)(a2 + 4);
    uint64_t v38 = 0;
    int64x2_t v39 = (int64x2_t)xmmword_1DCBCB680;
    int64x2_t v40 = vdupq_n_s64(2uLL);
    if (*(unsigned char *)(a2 + 24))
    {
      do
      {
        int32x2_t v41 = vmovn_s64((int64x2_t)vcgeq_u64(v36, (uint64x2_t)v39));
        v42.i32[0] = v38;
        v42.i32[1] = v38 + 1;
        float32x2_t v43 = vmla_f32(0, vcvt_f32_u32(v42), v37);
        if (v41.i8[0]) {
          v22[v38] = v43.f32[0];
        }
        if (v41.i8[4]) {
          v22[v38 + 1] = v43.f32[1];
        }
        v38 += 2;
        int64x2_t v39 = vaddq_s64(v39, v40);
      }
      while (v35 != v38);
    }
    else
    {
      do
      {
        int32x2_t v44 = vmovn_s64((int64x2_t)vcgeq_u64(v36, (uint64x2_t)v39));
        v45.i32[0] = v38;
        v45.i32[1] = v38 + 1;
        float32x2_t v46 = vmla_f32(0, vcvt_f32_u32(v45), v37);
        if (v44.i8[0]) {
          v22[v38] = v46.f32[0];
        }
        if (v44.i8[4]) {
          v22[v38 + 1] = v46.f32[1];
        }
        v38 += 2;
        int64x2_t v39 = vaddq_s64(v39, v40);
      }
      while (v35 != v38);
      uint64_t v47 = v22;
      uint64_t v48 = v28;
      do
      {
        *uint64_t v47 = v13(*v47);
        ++v47;
        --v48;
      }
      while (v48);
    }
    int32x2_t v98 = COERCE_INT32X2_T(((double (*)(float))v13)(v33));
    float v49 = v13(v32);
    uint64_t v50 = (v100 + 1);
    *(float *)v51.i32 = (float)(v49 - *(float *)v98.i32) / (float)v50;
    if (v99)
    {
      unsigned int v52 = v102;
      uint64_t v53 = v101;
      if (!v101) {
        goto LABEL_58;
      }
      uint64_t v54 = 0;
      uint64x2_t v55 = (uint64x2_t)vdupq_n_s64(v101 - 1);
      float32x2_t v56 = (float32x2_t)vdup_lane_s32(v51, 0);
      float32x2_t v57 = (float32x2_t)vdup_lane_s32(v98, 0);
      id v58 = (char *)v22 + ((2 * v96) & 0x1FFFFFFFCLL);
      int64x2_t v59 = (int64x2_t)xmmword_1DCBCB680;
      int64x2_t v60 = vdupq_n_s64(2uLL);
      do
      {
        int32x2_t v61 = vmovn_s64((int64x2_t)vcgeq_u64(v55, (uint64x2_t)v59));
        v62.i32[0] = v54;
        v62.i32[1] = v54 + 1;
        float32x2_t v63 = vmla_f32(v57, vcvt_f32_u32(v62), v56);
        if (v61.i8[0]) {
          *(_DWORD *)&v58[4 * v54 + 4] = v63.i32[0];
        }
        if (v61.i8[4]) {
          *(_DWORD *)&v58[4 * v54 + 8] = v63.i32[1];
        }
        v54 += 2;
        int64x2_t v59 = vaddq_s64(v59, v60);
      }
      while (((v101 + 1) & 0x1FFFFFFFELL) != v54);
      std::string::size_type v64 = &v22[v28];
      uint64_t v65 = v101;
      do
      {
        *std::string::size_type v64 = v14(*v64);
        ++v64;
        --v65;
      }
      while (v65);
    }
    else
    {
      unsigned int v52 = v102;
      uint64_t v53 = v101;
      if (!v101) {
        goto LABEL_58;
      }
      uint64_t v66 = 0;
      uint64x2_t v67 = (uint64x2_t)vdupq_n_s64(v101 - 1);
      float32x2_t v68 = (float32x2_t)vdup_lane_s32(v51, 0);
      float32x2_t v69 = (float32x2_t)vdup_lane_s32(v98, 0);
      uint64_t v70 = (char *)v22 + ((2 * v96) & 0x1FFFFFFFCLL);
      int64x2_t v71 = (int64x2_t)xmmword_1DCBCB680;
      int64x2_t v72 = vdupq_n_s64(2uLL);
      do
      {
        int32x2_t v73 = vmovn_s64((int64x2_t)vcgeq_u64(v67, (uint64x2_t)v71));
        v74.i32[0] = v66;
        v74.i32[1] = v66 + 1;
        float32x2_t v75 = vmla_f32(v69, vcvt_f32_u32(v74), v68);
        if (v73.i8[0]) {
          *(_DWORD *)&v70[4 * v66 + 4] = v75.i32[0];
        }
        if (v73.i8[4]) {
          *(_DWORD *)&v70[4 * v66 + 8] = v75.i32[1];
        }
        v66 += 2;
        int64x2_t v71 = vaddq_s64(v71, v72);
      }
      while (((v101 + 1) & 0x1FFFFFFFELL) != v66);
    }
    unsigned int v52 = v102;
    uint64_t v53 = v101;
    if (v50 < 2)
    {
LABEL_67:
      v106(v24, v24, v28, (uint64_t)&v22[v28], v53);
      vDSP_hann_window(v22, *(unsigned int *)(a2 + 32), 0);
      id v89 = (char *)malloc_type_malloc(4 * *(unsigned int *)(a2 + 40), 0x100004052888210uLL);
      BOOL v30 = v89;
      if (v89)
      {
        bzero(v89, 4 * *(unsigned int *)(a2 + 40));
        memcpy(&v30[4 * v52], v22, 4 * (v105 - v52));
        uint64_t v29 = 1;
      }
      else
      {
        uint64_t v29 = 0;
      }
      LODWORD(v11) = v97;
      goto LABEL_71;
    }
LABEL_58:
    int v76 = 0;
    uint64_t v77 = 1;
    do
    {
      double v78 = (float *)&v24[4 * v76];
      id v79 = &v34[v77];
      float v80 = *(v79 - 1);
      float v81 = *v79;
      float v82 = v34[++v77];
      float v83 = v82 - *v79;
      float v84 = *v79 - v80;
      id v85 = v22;
      uint64_t v86 = v28;
      do
      {
        float v87 = *v85;
        float v88 = 0.0;
        if (*v85 > v80)
        {
          if (v87 >= v81)
          {
            if (v87 < v82) {
              float v88 = (float)(v82 - v87) / v83;
            }
          }
          else
          {
            float v88 = (float)(v87 - v80) / v84;
          }
        }
        *v78++ = v88;
        ++v85;
        --v86;
      }
      while (v86);
      v76 += v28;
    }
    while (v77 != v50);
    goto LABEL_67;
  }
  uint64_t v29 = 0;
  BOOL v30 = 0;
LABEL_72:
  uint64_t v31 = v104;
LABEL_73:
  int v90 = *(_DWORD *)(a2 + 20);
  int v91 = (float *)(a1 + 4);
  float32x2x2_t v92 = *(float32x2x2_t *)(a2 + 28);
  int v93 = *(_DWORD *)(a2 + 44) + v92.val[1].i32[0];
  *(_DWORD *)a1 = *(_DWORD *)(a2 + 4);
  unint64_t v94 = vextq_s8((int8x16_t)v92, (int8x16_t)v92, 8uLL).u64[0];
  vst2_f32(v91, v92);
  *(_DWORD *)(a1 + 20) = v93;
  *(void *)(a1 + 24) = Setup;
  *(void *)(a1 + 32) = v24;
  *(void *)(a1 + 40) = v30;
  *(_DWORD *)(a1 + 4_Block_object_dispose(&STACK[0x220], 8) = v90;
  *(void *)(a1 + 56) = v31;
  *(_DWORD *)(a1 + 64) = v11;
  if ((v29 & 1) == 0) {
    sub_1DCB5E8AC(a1);
  }
  if (v22) {
    free(v22);
  }
  return v29;
}

void sub_1DCB5E8AC(uint64_t a1)
{
  vDSP_DFT_DestroySetup(*(vDSP_DFT_Setup *)(a1 + 24));
  unsigned int v2 = *(void **)(a1 + 32);
  if (v2)
  {
    free(v2);
    *(void *)(a1 + 32) = 0;
  }
  BOOL v3 = *(void **)(a1 + 56);
  if (v3)
  {
    free(v3);
    *(void *)(a1 + 56) = 0;
  }
  int v4 = *(void **)(a1 + 40);
  if (v4)
  {
    free(v4);
    *(void *)(a1 + 40) = 0;
  }
}

uint64_t sub_1DCB5E904(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  *(void *)unsigned int v16 = 0;
  *(_OWORD *)long long v14 = 0u;
  *(_OWORD *)int v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v7 = *(_OWORD *)(a4 + 16);
  v10[0] = *(_OWORD *)a4;
  v10[1] = v7;
  v10[2] = *(_OWORD *)(a4 + 32);
  int v11 = *(_DWORD *)(a4 + 48);
  if (sub_1DCB5E2E0((uint64_t)&v12, (uint64_t)v10)) {
    uint64_t v8 = sub_1DCB5E034(a1, a2, a3, v14[0], v12, v13, SDWORD1(v13), *((uint64_t *)&v13 + 1), *(float *)v15, (const float *)v14[1], SHIDWORD(v12), SDWORD2(v12), DWORD1(v12), (DSPComplex *)v15[1], v16[0]);
  }
  else {
    uint64_t v8 = 0;
  }
  sub_1DCB5E8AC((uint64_t)&v12);
  return v8;
}

void *sub_1DCB5E9D0(uint64_t a1)
{
  unsigned int v2 = malloc_type_malloc(0x48uLL, 0x10A0040C3289421uLL);
  long long v3 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v3;
  v5[2] = *(_OWORD *)(a1 + 32);
  int v6 = *(_DWORD *)(a1 + 48);
  if ((sub_1DCB5E2E0((uint64_t)v2, (uint64_t)v5) & 1) == 0)
  {
    free(v2);
    return 0;
  }
  return v2;
}

void sub_1DCB5EA48(void *a1)
{
  sub_1DCB5E8AC((uint64_t)a1);

  free(a1);
}

void sub_1DCB5EB00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1DCB5EB1C(void *a1, uint64_t *a2)
{
  if (!a1) {
    return 0;
  }
  v9.receiver = a1;
  v9.super_class = (Class)SNDSPGraph;
  id v3 = objc_msgSendSuper2(&v9, sel_init);
  if (v3)
  {
    uint64_t v4 = *a2;
    if (!*a2)
    {
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:sel_initWithDSPGraph_, v3, @"SNDSPGraph.mm", 38, @"Invalid parameter not satisfying: %@", @"graph" object file lineNumber description];

      uint64_t v4 = *a2;
    }
    uint64_t v5 = a2[1];
    if (v5) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
    }
    int v6 = (std::__shared_weak_count *)*((void *)v3 + 2);
    *((void *)v3 + 1) = v4;
    *((void *)v3 + 2) = v5;
    if (v6) {
      sub_1DCB44254(v6);
    }
  }
  return v3;
}

void sub_1DCB5EC04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB5EC24(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v4 = &unk_1F37F8328;
  char v5 = 0;
  int v6 = &v4;
  double v1 = *(std::__shared_weak_count **)(a1 + 16);
  if (v1) {
    atomic_fetch_add_explicit(&v1->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  DSPGraph::Graph::setSliceDuration();
  if (v1) {
    sub_1DCB44254(v1);
  }
  uint64_t v2 = 1;
  sub_1DCB5D2E0(&v4);
  return v2;
}

void sub_1DCB5ECEC(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, long long buf, int *a17, long long a18, int a19, int a20)
{
  if (a2)
  {
    if (v20) {
      sub_1DCB44254(v20);
    }
    if (a2 == 4)
    {
      int v23 = (char *)__cxa_begin_catch(a1);
      int v24 = *((_DWORD *)v23 + 2);
      a11 = v24;
      int32x2_t v25 = sub_1DCB6CF14();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        unint64_t v26 = v23 + 72;
        if (v23[95] < 0) {
          unint64_t v26 = (void *)*v26;
        }
        int v27 = v23 + 16;
        if (v23[39] < 0) {
          int v27 = (void *)*v27;
        }
        int v28 = *((_DWORD *)v23 + 10);
        LODWORD(buf) = 67110402;
        DWORD1(buf) = v24;
        WORD4(buf) = 1040;
        *(_DWORD *)((char *)&buf + 10) = 4;
        HIWORD(buf) = 2080;
        a17 = &a11;
        LOWORD(a1_Block_object_dispose(&STACK[0x220], 8) = 2080;
        *(void *)((char *)&a18 + 2) = v26;
        WORD5(a1_Block_object_dispose(&STACK[0x220], 8) = 2080;
        *(void *)((char *)&a18 + 12) = v27;
        LOWORD(a20) = 1024;
        *(int *)((char *)&a20 + 2) = v28;
        _os_log_impl(&dword_1DC873000, v25, OS_LOG_TYPE_ERROR, "Caught graph exception %d %4.4s %s in %s:%i", (uint8_t *)&buf, 0x32u);
      }
    }
    else if (a2 == 3)
    {
      uint64_t v29 = __cxa_begin_catch(a1);
      int32x2_t v25 = sub_1DCB6CF14();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = (*(uint64_t (**)(void *))(*(void *)v29 + 16))(v29);
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = v30;
        _os_log_impl(&dword_1DC873000, v25, OS_LOG_TYPE_ERROR, "std::exception caught: %s.", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      uint64_t v31 = (int *)__cxa_begin_catch(a1);
      if (a2 == 2)
      {
        int v32 = *v31;
        a11 = *v31;
        int32x2_t v25 = sub_1DCB6CF14();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 67109634;
          DWORD1(buf) = v32;
          WORD4(buf) = 1040;
          *(_DWORD *)((char *)&buf + 10) = 4;
          HIWORD(buf) = 2080;
          a17 = &a11;
          _os_log_impl(&dword_1DC873000, v25, OS_LOG_TYPE_ERROR, "Caught OSStatus exception %d %4.4s", (uint8_t *)&buf, 0x18u);
        }
      }
      else
      {
        int32x2_t v25 = sub_1DCB6CF14();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1DC873000, v25, OS_LOG_TYPE_ERROR, "Unknown exception caught!", (uint8_t *)&buf, 2u);
        }
      }
    }

    __cxa_end_catch();
    if (a15)
    {
      (*(void (**)(uint64_t))(*(void *)a15 + 48))(a15);
      JUMPOUT(0x1DCB5ECA8);
    }
    sub_1DCB4C86C();
  }
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB5EFCC(uint64_t a1)
{
  _DWORD v5[4] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v5[0] = &unk_1F37F8010;
  v5[1] = 0;
  _OWORD v5[3] = v5;
  uint64_t v2 = *(void *)(a1 + 8);
  double v1 = *(std::__shared_weak_count **)(a1 + 16);
  if (v1)
  {
    atomic_fetch_add_explicit(&v1->__shared_owners_, 1uLL, memory_order_relaxed);
    LODWORD(v3) = *(_DWORD *)(v2 + 688);
    sub_1DCB44254(v1);
  }
  else
  {
    LODWORD(v3) = *(_DWORD *)(v2 + 688);
  }
  uint64_t v3 = v3;
  sub_1DCB5D364(v5);
  return v3;
}

BOOL sub_1DCB5F080(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  int v6 = &unk_1F37F7D40;
  char v7 = 0;
  uint64_t v8 = &v6;
  uint64_t v2 = *(void *)(a1 + 8);
  double v1 = *(std::__shared_weak_count **)(a1 + 16);
  if (v1)
  {
    atomic_fetch_add_explicit(&v1->__shared_owners_, 1uLL, memory_order_relaxed);
    int v3 = *(unsigned __int8 *)(v2 + 761);
    sub_1DCB44254(v1);
  }
  else
  {
    int v3 = *(unsigned __int8 *)(v2 + 761);
  }
  BOOL v4 = v3 != 0;
  sub_1DCB5D2E0(&v6);
  return v4;
}

BOOL sub_1DCB5F13C(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  int v6 = &unk_1F37F7DD0;
  char v7 = 0;
  uint64_t v8 = &v6;
  uint64_t v2 = *(void *)(a1 + 8);
  double v1 = *(std::__shared_weak_count **)(a1 + 16);
  if (v1)
  {
    atomic_fetch_add_explicit(&v1->__shared_owners_, 1uLL, memory_order_relaxed);
    int v3 = *(unsigned __int8 *)(v2 + 762);
    sub_1DCB44254(v1);
  }
  else
  {
    int v3 = *(unsigned __int8 *)(v2 + 762);
  }
  BOOL v4 = v3 != 0;
  sub_1DCB5D2E0(&v6);
  return v4;
}

uint64_t sub_1DCB5F1F8(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  int v6 = &unk_1F37F7CF8;
  char v7 = 0;
  uint64_t v8 = &v6;
  uint64_t v2 = *(DSPGraph::Graph **)(a1 + 8);
  int v3 = *(std::__shared_weak_count **)(a1 + 16);
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  DSPGraph::Graph::configure(v2);
  if (v3) {
    sub_1DCB44254(v3);
  }
  uint64_t v4 = 1;
  sub_1DCB5D2E0(&v6);
  return v4;
}

void sub_1DCB5F2C0(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, long long buf, int *a17, long long a18, int a19, int a20)
{
  if (a2)
  {
    if (v20) {
      sub_1DCB44254(v20);
    }
    if (a2 == 4)
    {
      int v23 = (char *)__cxa_begin_catch(a1);
      int v24 = *((_DWORD *)v23 + 2);
      a11 = v24;
      int32x2_t v25 = sub_1DCB6CF14();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        unint64_t v26 = v23 + 72;
        if (v23[95] < 0) {
          unint64_t v26 = (void *)*v26;
        }
        int v27 = v23 + 16;
        if (v23[39] < 0) {
          int v27 = (void *)*v27;
        }
        int v28 = *((_DWORD *)v23 + 10);
        LODWORD(buf) = 67110402;
        DWORD1(buf) = v24;
        WORD4(buf) = 1040;
        *(_DWORD *)((char *)&buf + 10) = 4;
        HIWORD(buf) = 2080;
        a17 = &a11;
        LOWORD(a1_Block_object_dispose(&STACK[0x220], 8) = 2080;
        *(void *)((char *)&a18 + 2) = v26;
        WORD5(a1_Block_object_dispose(&STACK[0x220], 8) = 2080;
        *(void *)((char *)&a18 + 12) = v27;
        LOWORD(a20) = 1024;
        *(int *)((char *)&a20 + 2) = v28;
        _os_log_impl(&dword_1DC873000, v25, OS_LOG_TYPE_ERROR, "Caught graph exception %d %4.4s %s in %s:%i", (uint8_t *)&buf, 0x32u);
      }
    }
    else if (a2 == 3)
    {
      uint64_t v29 = __cxa_begin_catch(a1);
      int32x2_t v25 = sub_1DCB6CF14();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = (*(uint64_t (**)(void *))(*(void *)v29 + 16))(v29);
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = v30;
        _os_log_impl(&dword_1DC873000, v25, OS_LOG_TYPE_ERROR, "std::exception caught: %s.", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      uint64_t v31 = (int *)__cxa_begin_catch(a1);
      if (a2 == 2)
      {
        int v32 = *v31;
        a11 = *v31;
        int32x2_t v25 = sub_1DCB6CF14();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 67109634;
          DWORD1(buf) = v32;
          WORD4(buf) = 1040;
          *(_DWORD *)((char *)&buf + 10) = 4;
          HIWORD(buf) = 2080;
          a17 = &a11;
          _os_log_impl(&dword_1DC873000, v25, OS_LOG_TYPE_ERROR, "Caught OSStatus exception %d %4.4s", (uint8_t *)&buf, 0x18u);
        }
      }
      else
      {
        int32x2_t v25 = sub_1DCB6CF14();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1DC873000, v25, OS_LOG_TYPE_ERROR, "Unknown exception caught!", (uint8_t *)&buf, 2u);
        }
      }
    }

    __cxa_end_catch();
    if (a15)
    {
      (*(void (**)(uint64_t))(*(void *)a15 + 48))(a15);
      JUMPOUT(0x1DCB5F27CLL);
    }
    sub_1DCB4C86C();
  }
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB5F5A0(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  int v6 = &unk_1F37F7D88;
  char v7 = 0;
  uint64_t v8 = &v6;
  uint64_t v2 = *(DSPGraph::Graph **)(a1 + 8);
  int v3 = *(std::__shared_weak_count **)(a1 + 16);
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  DSPGraph::Graph::initialize(v2);
  if (v3) {
    sub_1DCB44254(v3);
  }
  uint64_t v4 = 1;
  sub_1DCB5D2E0(&v6);
  return v4;
}

void sub_1DCB5F66C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, long long buf, int *a17, long long a18, int a19, int a20)
{
  if (a2)
  {
    if (v20) {
      sub_1DCB44254(v20);
    }
    if (a2 == 4)
    {
      int v23 = (char *)__cxa_begin_catch(a1);
      int v24 = *((_DWORD *)v23 + 2);
      a11 = v24;
      int32x2_t v25 = sub_1DCB6CF14();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        unint64_t v26 = v23 + 72;
        if (v23[95] < 0) {
          unint64_t v26 = (void *)*v26;
        }
        int v27 = v23 + 16;
        if (v23[39] < 0) {
          int v27 = (void *)*v27;
        }
        int v28 = *((_DWORD *)v23 + 10);
        LODWORD(buf) = 67110402;
        DWORD1(buf) = v24;
        WORD4(buf) = 1040;
        *(_DWORD *)((char *)&buf + 10) = 4;
        HIWORD(buf) = 2080;
        a17 = &a11;
        LOWORD(a1_Block_object_dispose(&STACK[0x220], 8) = 2080;
        *(void *)((char *)&a18 + 2) = v26;
        WORD5(a1_Block_object_dispose(&STACK[0x220], 8) = 2080;
        *(void *)((char *)&a18 + 12) = v27;
        LOWORD(a20) = 1024;
        *(int *)((char *)&a20 + 2) = v28;
        _os_log_impl(&dword_1DC873000, v25, OS_LOG_TYPE_ERROR, "Caught graph exception %d %4.4s %s in %s:%i", (uint8_t *)&buf, 0x32u);
      }
    }
    else if (a2 == 3)
    {
      uint64_t v29 = __cxa_begin_catch(a1);
      int32x2_t v25 = sub_1DCB6CF14();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = (*(uint64_t (**)(void *))(*(void *)v29 + 16))(v29);
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = v30;
        _os_log_impl(&dword_1DC873000, v25, OS_LOG_TYPE_ERROR, "std::exception caught: %s.", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      uint64_t v31 = (int *)__cxa_begin_catch(a1);
      if (a2 == 2)
      {
        int v32 = *v31;
        a11 = *v31;
        int32x2_t v25 = sub_1DCB6CF14();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 67109634;
          DWORD1(buf) = v32;
          WORD4(buf) = 1040;
          *(_DWORD *)((char *)&buf + 10) = 4;
          HIWORD(buf) = 2080;
          a17 = &a11;
          _os_log_impl(&dword_1DC873000, v25, OS_LOG_TYPE_ERROR, "Caught OSStatus exception %d %4.4s", (uint8_t *)&buf, 0x18u);
        }
      }
      else
      {
        int32x2_t v25 = sub_1DCB6CF14();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1DC873000, v25, OS_LOG_TYPE_ERROR, "Unknown exception caught!", (uint8_t *)&buf, 2u);
        }
      }
    }

    __cxa_end_catch();
    if (a15)
    {
      (*(void (**)(uint64_t))(*(void *)a15 + 48))(a15);
      JUMPOUT(0x1DCB5F628);
    }
    sub_1DCB4C86C();
  }
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB5F94C(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v3 = a2;
  CFDictionaryRef v4 = v3;
  if (a1)
  {
    if (v3)
    {
      uint64_t v9 = &unk_1F37F7E18;
      char v10 = 0;
      int v11 = &v9;
      char v5 = *(DSPGraph::Graph **)(a1 + 8);
      int v6 = *(std::__shared_weak_count **)(a1 + 16);
      if (v6) {
        atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      DSPGraph::Graph::setAUStrip(v5, v4);
      if (v6) {
        sub_1DCB44254(v6);
      }
      a1 = 1;
      sub_1DCB5D2E0(&v9);
    }
    else
    {
      char v7 = sub_1DCB6CF14();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1DC873000, v7, OS_LOG_TYPE_ERROR, "AUStrip is nil", buf, 2u);
      }

      a1 = 0;
    }
  }

  return a1;
}

void sub_1DCB5FA68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB5FD54(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v5 = a2;
  int v6 = a3;
  if (a1)
  {
    if (v5)
    {
      int v11 = &unk_1F37F81C0;
      char v12 = 0;
      uint64_t v13 = &v11;
      char v7 = *(DSPGraph::Graph **)(a1 + 8);
      uint64_t v8 = *(std::__shared_weak_count **)(a1 + 16);
      if (v8) {
        atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      DSPGraph::Graph::setPropertyStrip(v7, v5, v6);
      if (v8) {
        sub_1DCB44254(v8);
      }
      a1 = 1;
      sub_1DCB5D2E0(&v11);
    }
    else
    {
      uint64_t v9 = sub_1DCB6CF14();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1DC873000, v9, OS_LOG_TYPE_ERROR, "PropertyStrip is nil", buf, 2u);
      }

      a1 = 0;
    }
  }

  return a1;
}

void sub_1DCB5FE8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB6017C(uint64_t a1, float *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v8 = &unk_1F37F7F80;
  char v9 = 0;
  char v10 = &v8;
  uint64_t v4 = *(void *)(a1 + 8);
  CFDictionaryRef v5 = *(std::__shared_weak_count **)(a1 + 16);
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  *a2 = (*(float (**)(uint64_t, uint64_t))(*(void *)v4 + 48))(v4, a3);
  if (v5) {
    sub_1DCB44254(v5);
  }
  uint64_t v6 = 1;
  sub_1DCB5D2E0(&v8);
  return v6;
}

void sub_1DCB60270(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, long long buf, int *a17, long long a18, int a19, int a20)
{
  if (a2)
  {
    if (v20) {
      sub_1DCB44254(v20);
    }
    if (a2 == 4)
    {
      int v23 = (char *)__cxa_begin_catch(a1);
      int v24 = *((_DWORD *)v23 + 2);
      a11 = v24;
      int32x2_t v25 = sub_1DCB6CF14();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        unint64_t v26 = v23 + 72;
        if (v23[95] < 0) {
          unint64_t v26 = (void *)*v26;
        }
        int v27 = v23 + 16;
        if (v23[39] < 0) {
          int v27 = (void *)*v27;
        }
        int v28 = *((_DWORD *)v23 + 10);
        LODWORD(buf) = 67110402;
        DWORD1(buf) = v24;
        WORD4(buf) = 1040;
        *(_DWORD *)((char *)&buf + 10) = 4;
        HIWORD(buf) = 2080;
        a17 = &a11;
        LOWORD(a1_Block_object_dispose(&STACK[0x220], 8) = 2080;
        *(void *)((char *)&a18 + 2) = v26;
        WORD5(a1_Block_object_dispose(&STACK[0x220], 8) = 2080;
        *(void *)((char *)&a18 + 12) = v27;
        LOWORD(a20) = 1024;
        *(int *)((char *)&a20 + 2) = v28;
        _os_log_impl(&dword_1DC873000, v25, OS_LOG_TYPE_ERROR, "Caught graph exception %d %4.4s %s in %s:%i", (uint8_t *)&buf, 0x32u);
      }
    }
    else if (a2 == 3)
    {
      uint64_t v29 = __cxa_begin_catch(a1);
      int32x2_t v25 = sub_1DCB6CF14();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = (*(uint64_t (**)(void *))(*(void *)v29 + 16))(v29);
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = v30;
        _os_log_impl(&dword_1DC873000, v25, OS_LOG_TYPE_ERROR, "std::exception caught: %s.", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      uint64_t v31 = (int *)__cxa_begin_catch(a1);
      if (a2 == 2)
      {
        int v32 = *v31;
        a11 = *v31;
        int32x2_t v25 = sub_1DCB6CF14();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 67109634;
          DWORD1(buf) = v32;
          WORD4(buf) = 1040;
          *(_DWORD *)((char *)&buf + 10) = 4;
          HIWORD(buf) = 2080;
          a17 = &a11;
          _os_log_impl(&dword_1DC873000, v25, OS_LOG_TYPE_ERROR, "Caught OSStatus exception %d %4.4s", (uint8_t *)&buf, 0x18u);
        }
      }
      else
      {
        int32x2_t v25 = sub_1DCB6CF14();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1DC873000, v25, OS_LOG_TYPE_ERROR, "Unknown exception caught!", (uint8_t *)&buf, 2u);
        }
      }
    }

    __cxa_end_catch();
    if (a15)
    {
      (*(void (**)(uint64_t))(*(void *)a15 + 48))(a15);
      JUMPOUT(0x1DCB6022CLL);
    }
    sub_1DCB4C86C();
  }
  _Unwind_Resume(a1);
}

id sub_1DCB60550(void *a1, void *a2)
{
  uint64_t v2 = a1;
  v8[4] = *MEMORY[0x1E4F143B8];
  char v7 = a1;
  id v3 = a2;
  id v6 = v3;
  if (v2)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3321888768;
    v5[2] = sub_1DCB60684;
    _OWORD v5[3] = &unk_1F37F8540;
    _DWORD v5[4] = &v7;
    void v5[5] = &v6;
    v8[0] = &unk_1F37F7BD8;
    v8[1] = 0;
    void v8[3] = v8;
    uint64_t v2 = sub_1DCB620AC(v5);
    sub_1DCB625B4(v8);
    id v3 = v6;
  }

  return v2;
}

void sub_1DCB60660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  sub_1DCB625B4((void *)(v16 - 56));

  _Unwind_Resume(a1);
}

void *sub_1DCB60684(uint64_t a1)
{
  sub_1DCB43D1C(&__p, (char *)[**(id **)(a1 + 40) UTF8String]);
  uint64_t v2 = DSPGraph::Graph::box();
  uint64_t v3 = v2;
  if (v12 < 0)
  {
    operator delete(__p);
    if (v3) {
      goto LABEL_3;
    }
LABEL_8:
    uint64_t v8 = 0;
    goto LABEL_9;
  }
  if (!v2) {
    goto LABEL_8;
  }
LABEL_3:
  uint64_t v4 = [SNDSPGraphBox alloc];
  uint64_t v5 = **(void **)(a1 + 32);
  char v7 = *(void **)(v5 + 8);
  id v6 = *(std::__shared_weak_count **)(v5 + 16);
  __p = v7;
  uint64_t v11 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v8 = sub_1DCB59D60(v4, v3, (uint64_t *)&__p);
  if (v11) {
    sub_1DCB44254(v11);
  }
LABEL_9:

  return v8;
}

void sub_1DCB6075C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, std::__shared_weak_count *a11, int a12, __int16 a13, char a14, char a15)
{
  if (a11) {
    sub_1DCB44254(a11);
  }
  _Unwind_Resume(exception_object);
}

__n128 sub_1DCB60794(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[2];
  a1[2] = result;
  return result;
}

id sub_1DCB607A4(uint64_t a1)
{
  _DWORD v5[4] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a1;
  if (a1)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3321888768;
    v3[2] = sub_1DCB608B8;
    v3[3] = &unk_1F37F84E0;
    v3[4] = &v4;
    v5[0] = &unk_1F37F7BD8;
    v5[1] = 0;
    _OWORD v5[3] = v5;
    double v1 = sub_1DCB620AC(v3);
    sub_1DCB625B4(v5);
  }
  else
  {
    double v1 = 0;
  }

  return v1;
}

void sub_1DCB608A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  sub_1DCB625B4((uint64_t *)va);
  _Unwind_Resume(a1);
}

id sub_1DCB608B8(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA80] set];
  for (uint64_t i = *(void **)(*(void *)(**(void **)(a1 + 32) + 8) + 24); i; uint64_t i = (void *)*i)
  {
    uint64_t v4 = [SNDSPGraphBox alloc];
    uint64_t v5 = i[2];
    uint64_t v6 = **(void **)(a1 + 32);
    uint64_t v8 = *(void *)(v6 + 8);
    char v7 = *(std::__shared_weak_count **)(v6 + 16);
    uint64_t v11 = v8;
    char v12 = v7;
    if (v7) {
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    char v9 = sub_1DCB59D60(v4, v5, &v11);
    if (v12) {
      sub_1DCB44254(v12);
    }
    objc_msgSend(v2, "addObject:", v9, v11);
  }

  return v2;
}

void sub_1DCB6098C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_1DCB44254(a10);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_1DCB609BC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 32) = *(void *)(a2 + 32);
  return result;
}

id sub_1DCB609C8(uint64_t a1)
{
  _DWORD v5[4] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a1;
  if (a1)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3321888768;
    v3[2] = sub_1DCB60ADC;
    v3[3] = &unk_1F37F84B0;
    v3[4] = &v4;
    v5[0] = &unk_1F37F7BD8;
    v5[1] = 0;
    _OWORD v5[3] = v5;
    double v1 = sub_1DCB620AC(v3);
    sub_1DCB625B4(v5);
  }
  else
  {
    double v1 = 0;
  }

  return v1;
}

void sub_1DCB60AC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  sub_1DCB625B4((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB60ADC(uint64_t a1)
{
  uint64_t v1 = *(void *)(**(void **)(a1 + 32) + 8);
  uint64_t v2 = (void *)(v1 + 408);
  if (*(char *)(v1 + 431) < 0) {
    uint64_t v2 = (void *)*v2;
  }
  return [NSString stringWithUTF8String:v2];
}

uint64_t sub_1DCB60B0C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 32) = *(void *)(a2 + 32);
  return result;
}

void sub_1DCB60B18(uint64_t a1, void *a2)
{
  v7[4] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = a1;
  id v3 = a2;
  id v5 = v3;
  if (a1)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3321888768;
    v4[2] = sub_1DCB60C30;
    v4[3] = &unk_1F37F8510;
    v4[4] = &v6;
    v4[5] = &v5;
    v7[0] = &unk_1F37F7B90;
    void v7[3] = v7;
    sub_1DCB5CE64(v4);
    sub_1DCB5D25C(v7);
    id v3 = v5;
  }
}

void sub_1DCB60C0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  sub_1DCB5D25C((void *)(v16 - 56));

  _Unwind_Resume(a1);
}

std::string *sub_1DCB60C30(uint64_t a1)
{
  uint64_t v1 = *(std::string **)(**(void **)(a1 + 32) + 8);
  uint64_t v2 = (char *)[**(id **)(a1 + 40) UTF8String];

  return sub_1DCB626F8(v1 + 17, v2);
}

__n128 sub_1DCB60C7C(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[2];
  a1[2] = result;
  return result;
}

uint64_t sub_1DCB60C88(uint64_t a1)
{
  v3[11] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v3[0] = &unk_1F37F7EF0;
  v3[1] = 0;
  v3[3] = v3;
  uint64_t v1 = DSPGraph::Graph::numInputs(*(DSPGraph::Graph **)(a1 + 8));
  sub_1DCB5D364(v3);
  return v1;
}

void sub_1DCB60D28(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, long long buf, int *a17, long long a18, int a19, int a20)
{
  if (a2)
  {
    if (a2 == 4)
    {
      uint64_t v21 = (char *)__cxa_begin_catch(a1);
      int v22 = *((_DWORD *)v21 + 2);
      a11 = v22;
      int v23 = sub_1DCB6CF14();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        int v24 = v21 + 72;
        if (v21[95] < 0) {
          int v24 = (void *)*v24;
        }
        int32x2_t v25 = v21 + 16;
        if (v21[39] < 0) {
          int32x2_t v25 = (void *)*v25;
        }
        int v26 = *((_DWORD *)v21 + 10);
        LODWORD(buf) = 67110402;
        DWORD1(buf) = v22;
        WORD4(buf) = 1040;
        *(_DWORD *)((char *)&buf + 10) = 4;
        HIWORD(buf) = 2080;
        a17 = &a11;
        LOWORD(a1_Block_object_dispose(&STACK[0x220], 8) = 2080;
        *(void *)((char *)&a18 + 2) = v24;
        WORD5(a1_Block_object_dispose(&STACK[0x220], 8) = 2080;
        *(void *)((char *)&a18 + 12) = v25;
        LOWORD(a20) = 1024;
        *(int *)((char *)&a20 + 2) = v26;
        _os_log_impl(&dword_1DC873000, v23, OS_LOG_TYPE_ERROR, "Caught graph exception %d %4.4s %s in %s:%i", (uint8_t *)&buf, 0x32u);
      }
    }
    else if (a2 == 3)
    {
      int v27 = __cxa_begin_catch(a1);
      int v23 = sub_1DCB6CF14();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = (*(uint64_t (**)(void *))(*(void *)v27 + 16))(v27);
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = v28;
        _os_log_impl(&dword_1DC873000, v23, OS_LOG_TYPE_ERROR, "std::exception caught: %s.", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      uint64_t v29 = (int *)__cxa_begin_catch(a1);
      if (a2 == 2)
      {
        int v30 = *v29;
        a11 = *v29;
        int v23 = sub_1DCB6CF14();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 67109634;
          DWORD1(buf) = v30;
          WORD4(buf) = 1040;
          *(_DWORD *)((char *)&buf + 10) = 4;
          HIWORD(buf) = 2080;
          a17 = &a11;
          _os_log_impl(&dword_1DC873000, v23, OS_LOG_TYPE_ERROR, "Caught OSStatus exception %d %4.4s", (uint8_t *)&buf, 0x18u);
        }
      }
      else
      {
        int v23 = sub_1DCB6CF14();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1DC873000, v23, OS_LOG_TYPE_ERROR, "Unknown exception caught!", (uint8_t *)&buf, 2u);
        }
      }
    }

    __cxa_end_catch();
    if (a15)
    {
      (*(void (**)(uint64_t))(*(void *)a15 + 48))(a15);
      JUMPOUT(0x1DCB60CE4);
    }
    sub_1DCB4C86C();
  }
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB60FFC(uint64_t a1)
{
  v3[11] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v3[0] = &unk_1F37F7F38;
  v3[1] = 0;
  v3[3] = v3;
  uint64_t v1 = DSPGraph::Graph::numOutputs(*(DSPGraph::Graph **)(a1 + 8));
  sub_1DCB5D364(v3);
  return v1;
}

void sub_1DCB6109C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, long long buf, int *a17, long long a18, int a19, int a20)
{
  if (a2)
  {
    if (a2 == 4)
    {
      uint64_t v21 = (char *)__cxa_begin_catch(a1);
      int v22 = *((_DWORD *)v21 + 2);
      a11 = v22;
      int v23 = sub_1DCB6CF14();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        int v24 = v21 + 72;
        if (v21[95] < 0) {
          int v24 = (void *)*v24;
        }
        int32x2_t v25 = v21 + 16;
        if (v21[39] < 0) {
          int32x2_t v25 = (void *)*v25;
        }
        int v26 = *((_DWORD *)v21 + 10);
        LODWORD(buf) = 67110402;
        DWORD1(buf) = v22;
        WORD4(buf) = 1040;
        *(_DWORD *)((char *)&buf + 10) = 4;
        HIWORD(buf) = 2080;
        a17 = &a11;
        LOWORD(a1_Block_object_dispose(&STACK[0x220], 8) = 2080;
        *(void *)((char *)&a18 + 2) = v24;
        WORD5(a1_Block_object_dispose(&STACK[0x220], 8) = 2080;
        *(void *)((char *)&a18 + 12) = v25;
        LOWORD(a20) = 1024;
        *(int *)((char *)&a20 + 2) = v26;
        _os_log_impl(&dword_1DC873000, v23, OS_LOG_TYPE_ERROR, "Caught graph exception %d %4.4s %s in %s:%i", (uint8_t *)&buf, 0x32u);
      }
    }
    else if (a2 == 3)
    {
      int v27 = __cxa_begin_catch(a1);
      int v23 = sub_1DCB6CF14();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = (*(uint64_t (**)(void *))(*(void *)v27 + 16))(v27);
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = v28;
        _os_log_impl(&dword_1DC873000, v23, OS_LOG_TYPE_ERROR, "std::exception caught: %s.", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      uint64_t v29 = (int *)__cxa_begin_catch(a1);
      if (a2 == 2)
      {
        int v30 = *v29;
        a11 = *v29;
        int v23 = sub_1DCB6CF14();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 67109634;
          DWORD1(buf) = v30;
          WORD4(buf) = 1040;
          *(_DWORD *)((char *)&buf + 10) = 4;
          HIWORD(buf) = 2080;
          a17 = &a11;
          _os_log_impl(&dword_1DC873000, v23, OS_LOG_TYPE_ERROR, "Caught OSStatus exception %d %4.4s", (uint8_t *)&buf, 0x18u);
        }
      }
      else
      {
        int v23 = sub_1DCB6CF14();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1DC873000, v23, OS_LOG_TYPE_ERROR, "Unknown exception caught!", (uint8_t *)&buf, 2u);
        }
      }
    }

    __cxa_end_catch();
    if (a15)
    {
      (*(void (**)(uint64_t))(*(void *)a15 + 48))(a15);
      JUMPOUT(0x1DCB61058);
    }
    sub_1DCB4C86C();
  }
  _Unwind_Resume(a1);
}

void *sub_1DCB61370(void *a1)
{
  uint64_t v1 = a1;
  v8[11] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v8[0] = &unk_1F37F7C68;
    v8[1] = 0;
    void v8[3] = v8;
    uint64_t v2 = [SNDSPGraphBox alloc];
    uint64_t v3 = DSPGraph::Graph::in((DSPGraph::Graph *)v1[1]);
    uint64_t v4 = (std::__shared_weak_count *)v1[2];
    uint64_t v6 = v1[1];
    char v7 = v4;
    if (v4) {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v1 = sub_1DCB59D60(v2, v3, &v6);
    if (v7) {
      sub_1DCB44254(v7);
    }
    sub_1DCB62F40(v8);
  }

  return v1;
}

void sub_1DCB61468(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, uint64_t a12, std::__shared_weak_count *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, long long buf, int *a19, long long a20,int a21,int a22)
{
  if (a2)
  {
    if (a13) {
      sub_1DCB44254(a13);
    }
    if (a2 == 4)
    {
      int v24 = (char *)__cxa_begin_catch(a1);
      int v25 = *((_DWORD *)v24 + 2);
      a11 = v25;
      int v26 = sub_1DCB6CF14();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        int v27 = v24 + 72;
        if (v24[95] < 0) {
          int v27 = (void *)*v27;
        }
        uint64_t v28 = v24 + 16;
        if (v24[39] < 0) {
          uint64_t v28 = (void *)*v28;
        }
        int v29 = *((_DWORD *)v24 + 10);
        LODWORD(buf) = 67110402;
        DWORD1(buf) = v25;
        WORD4(buf) = 1040;
        *(_DWORD *)((char *)&buf + 10) = 4;
        HIWORD(buf) = 2080;
        a19 = &a11;
        LOWORD(a20) = 2080;
        *(void *)((char *)&a20 + 2) = v27;
        WORD5(a20) = 2080;
        *(void *)((char *)&a20 + 12) = v28;
        LOWORD(a22) = 1024;
        *(int *)((char *)&a22 + 2) = v29;
        _os_log_impl(&dword_1DC873000, v26, OS_LOG_TYPE_ERROR, "Caught graph exception %d %4.4s %s in %s:%i", (uint8_t *)&buf, 0x32u);
      }
    }
    else if (a2 == 3)
    {
      int v30 = __cxa_begin_catch(a1);
      int v26 = sub_1DCB6CF14();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = (*(uint64_t (**)(void *))(*(void *)v30 + 16))(v30);
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = v31;
        _os_log_impl(&dword_1DC873000, v26, OS_LOG_TYPE_ERROR, "std::exception caught: %s.", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      int v32 = (int *)__cxa_begin_catch(a1);
      if (a2 == 2)
      {
        int v33 = *v32;
        a11 = *v32;
        int v26 = sub_1DCB6CF14();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 67109634;
          DWORD1(buf) = v33;
          WORD4(buf) = 1040;
          *(_DWORD *)((char *)&buf + 10) = 4;
          HIWORD(buf) = 2080;
          a19 = &a11;
          _os_log_impl(&dword_1DC873000, v26, OS_LOG_TYPE_ERROR, "Caught OSStatus exception %d %4.4s", (uint8_t *)&buf, 0x18u);
        }
      }
      else
      {
        int v26 = sub_1DCB6CF14();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1DC873000, v26, OS_LOG_TYPE_ERROR, "Unknown exception caught!", (uint8_t *)&buf, 2u);
        }
      }
    }

    __cxa_end_catch();
    if (a17)
    {
      (*(void (**)(uint64_t))(*(void *)a17 + 48))(a17);
      objc_claimAutoreleasedReturnValue();
      JUMPOUT(0x1DCB6141CLL);
    }
    sub_1DCB4C86C();
  }
  _Unwind_Resume(a1);
}

void *sub_1DCB6175C(void *a1)
{
  uint64_t v1 = a1;
  v8[11] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v8[0] = &unk_1F37F7CB0;
    v8[1] = 0;
    void v8[3] = v8;
    uint64_t v2 = [SNDSPGraphBox alloc];
    uint64_t v3 = DSPGraph::Graph::out((DSPGraph::Graph *)v1[1]);
    uint64_t v4 = (std::__shared_weak_count *)v1[2];
    uint64_t v6 = v1[1];
    char v7 = v4;
    if (v4) {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v1 = sub_1DCB59D60(v2, v3, &v6);
    if (v7) {
      sub_1DCB44254(v7);
    }
    sub_1DCB62F40(v8);
  }

  return v1;
}

void sub_1DCB61854(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, uint64_t a12, std::__shared_weak_count *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, long long buf, int *a19, long long a20,int a21,int a22)
{
  if (a2)
  {
    if (a13) {
      sub_1DCB44254(a13);
    }
    if (a2 == 4)
    {
      int v24 = (char *)__cxa_begin_catch(a1);
      int v25 = *((_DWORD *)v24 + 2);
      a11 = v25;
      int v26 = sub_1DCB6CF14();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        int v27 = v24 + 72;
        if (v24[95] < 0) {
          int v27 = (void *)*v27;
        }
        uint64_t v28 = v24 + 16;
        if (v24[39] < 0) {
          uint64_t v28 = (void *)*v28;
        }
        int v29 = *((_DWORD *)v24 + 10);
        LODWORD(buf) = 67110402;
        DWORD1(buf) = v25;
        WORD4(buf) = 1040;
        *(_DWORD *)((char *)&buf + 10) = 4;
        HIWORD(buf) = 2080;
        a19 = &a11;
        LOWORD(a20) = 2080;
        *(void *)((char *)&a20 + 2) = v27;
        WORD5(a20) = 2080;
        *(void *)((char *)&a20 + 12) = v28;
        LOWORD(a22) = 1024;
        *(int *)((char *)&a22 + 2) = v29;
        _os_log_impl(&dword_1DC873000, v26, OS_LOG_TYPE_ERROR, "Caught graph exception %d %4.4s %s in %s:%i", (uint8_t *)&buf, 0x32u);
      }
    }
    else if (a2 == 3)
    {
      int v30 = __cxa_begin_catch(a1);
      int v26 = sub_1DCB6CF14();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = (*(uint64_t (**)(void *))(*(void *)v30 + 16))(v30);
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = v31;
        _os_log_impl(&dword_1DC873000, v26, OS_LOG_TYPE_ERROR, "std::exception caught: %s.", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      int v32 = (int *)__cxa_begin_catch(a1);
      if (a2 == 2)
      {
        int v33 = *v32;
        a11 = *v32;
        int v26 = sub_1DCB6CF14();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 67109634;
          DWORD1(buf) = v33;
          WORD4(buf) = 1040;
          *(_DWORD *)((char *)&buf + 10) = 4;
          HIWORD(buf) = 2080;
          a19 = &a11;
          _os_log_impl(&dword_1DC873000, v26, OS_LOG_TYPE_ERROR, "Caught OSStatus exception %d %4.4s", (uint8_t *)&buf, 0x18u);
        }
      }
      else
      {
        int v26 = sub_1DCB6CF14();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1DC873000, v26, OS_LOG_TYPE_ERROR, "Unknown exception caught!", (uint8_t *)&buf, 2u);
        }
      }
    }

    __cxa_end_catch();
    if (a17)
    {
      (*(void (**)(uint64_t))(*(void *)a17 + 48))(a17);
      objc_claimAutoreleasedReturnValue();
      JUMPOUT(0x1DCB61808);
    }
    sub_1DCB4C86C();
  }
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB61B48(uint64_t result)
{
  if (result) {
    return MEMORY[0x1F4181798](result, sel_preflight_outputFrameCount_error_);
  }
  return result;
}

void sub_1DCB61C64(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, __int16 buf)
{
  __cxa_begin_catch(a1);
  uint64_t v21 = sub_1DCB6CF14();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    long long buf = 0;
    _os_log_impl(&dword_1DC873000, v21, OS_LOG_TYPE_ERROR, "Failed to preflight DSPGraph", (uint8_t *)&buf, 2u);
  }

  if (v20)
  {
    *int v20 = +[SNError errorWithCode:2 underlyingError:0 message:@"Failed to preflight DSPGraph"];
  }
  *unsigned int v19 = 0;
  __cxa_end_catch();
  JUMPOUT(0x1DCB61BF0);
}

void sub_1DCB61CE8(_Unwind_Exception *a1)
{
}

void *sub_1DCB61D00(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (result) {
    return (void *)[result processInputBufferList:a2 inputFrameCount:a3 atSourcePosition:a4 to:a5 outputFrameCapacity:a6 outputFrameCount:a7 atDestinationPosition:a8 error:0];
  }
  return result;
}

void sub_1DCB61EF4(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, long long buf)
{
  if (a2)
  {
    int v22 = (char *)__cxa_begin_catch(a1);
    if (a2 == 2)
    {
      int v23 = v22;
      int v24 = sub_1DCB6CF14();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        int v25 = v23 + 72;
        if (v23[95] < 0) {
          int v25 = (void *)*v25;
        }
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = v25;
        _os_log_impl(&dword_1DC873000, v24, OS_LOG_TYPE_ERROR, "Caught DSPGraph Exception: %s", (uint8_t *)&buf, 0xCu);
      }

      if (v20)
      {
        int v26 = v23 + 72;
        if (v23[95] < 0) {
          int v26 = (void *)*v26;
        }
        int v27 = [NSString stringWithUTF8String:v26];
        *int v20 = +[SNError errorWithCode:2 underlyingError:0 message:v27];
      }
      *unsigned int v19 = 0;
      __cxa_end_catch();
    }
    else
    {
      uint64_t v28 = sub_1DCB6CF14();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1DC873000, v28, OS_LOG_TYPE_ERROR, "Failed to process DSPGraph", (uint8_t *)&buf, 2u);
      }

      if (v20)
      {
        *int v20 = +[SNError errorWithCode:2 underlyingError:0 message:@"Failed to process DSPGraph"];
      }
      *unsigned int v19 = 0;
      __cxa_end_catch();
    }
    JUMPOUT(0x1DCB61E34);
  }
  _Unwind_Resume(a1);
}

id sub_1DCB620AC(void *a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = v1[2]();

  return v2;
}

void sub_1DCB62144(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, long long buf, int *a13, long long a14, int a15, int a16)
{
  if (a2)
  {
    if (a2 == 4)
    {
      int v18 = (char *)__cxa_begin_catch(a1);
      int v19 = *((_DWORD *)v18 + 2);
      a11 = v19;
      int v20 = sub_1DCB6CF14();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = v18 + 72;
        if (v18[95] < 0) {
          uint64_t v21 = (void *)*v21;
        }
        int v22 = v18 + 16;
        if (v18[39] < 0) {
          int v22 = (void *)*v22;
        }
        int v23 = *((_DWORD *)v18 + 10);
        LODWORD(buf) = 67110402;
        DWORD1(buf) = v19;
        WORD4(buf) = 1040;
        *(_DWORD *)((char *)&buf + 10) = 4;
        HIWORD(buf) = 2080;
        a13 = &a11;
        LOWORD(a14) = 2080;
        *(void *)((char *)&a14 + 2) = v21;
        WORD5(a14) = 2080;
        *(void *)((char *)&a14 + 12) = v22;
        LOWORD(a16) = 1024;
        *(int *)((char *)&a16 + 2) = v23;
        _os_log_impl(&dword_1DC873000, v20, OS_LOG_TYPE_ERROR, "Caught graph exception %d %4.4s %s in %s:%i", (uint8_t *)&buf, 0x32u);
      }
    }
    else if (a2 == 3)
    {
      int v24 = __cxa_begin_catch(a1);
      int v20 = sub_1DCB6CF14();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = (*(uint64_t (**)(void *))(*(void *)v24 + 16))(v24);
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = v25;
        _os_log_impl(&dword_1DC873000, v20, OS_LOG_TYPE_ERROR, "std::exception caught: %s.", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      int v26 = (int *)__cxa_begin_catch(a1);
      if (a2 == 2)
      {
        int v27 = *v26;
        a11 = *v26;
        int v20 = sub_1DCB6CF14();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 67109634;
          DWORD1(buf) = v27;
          WORD4(buf) = 1040;
          *(_DWORD *)((char *)&buf + 10) = 4;
          HIWORD(buf) = 2080;
          a13 = &a11;
          _os_log_impl(&dword_1DC873000, v20, OS_LOG_TYPE_ERROR, "Caught OSStatus exception %d %4.4s", (uint8_t *)&buf, 0x18u);
        }
      }
      else
      {
        int v20 = sub_1DCB6CF14();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1DC873000, v20, OS_LOG_TYPE_ERROR, "Unknown exception caught!", (uint8_t *)&buf, 2u);
        }
      }
    }

    __cxa_end_catch();
    sub_1DCB623F8(v16);
    objc_claimAutoreleasedReturnValue();
    JUMPOUT(0x1DCB620F4);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB623F8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 24);
  if (!v1) {
    sub_1DCB4C86C();
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)v1 + 48);

  return v2();
}

uint64_t sub_1DCB62448(uint64_t a1)
{
  return a1;
}

void sub_1DCB62474(uint64_t a1)
{
  JUMPOUT(0x1E01A8C50);
}

void *sub_1DCB624C0(uint64_t a1)
{
  uint64_t v2 = operator new(0x10uLL);
  *uint64_t v2 = &unk_1F37F7BD8;
  v2[1] = *(id *)(a1 + 8);
  return v2;
}

id sub_1DCB62518(uint64_t a1, void *a2)
{
  *a2 = &unk_1F37F7BD8;
  id result = *(id *)(a1 + 8);
  a2[1] = result;
  return result;
}

void sub_1DCB62560(uint64_t a1)
{
}

void sub_1DCB62568(id *a1)
{
  operator delete(a1);
}

id sub_1DCB625A4(uint64_t a1)
{
  return sub_1DCB625AC((id *)(a1 + 8));
}

id sub_1DCB625AC(id *a1)
{
  return *a1;
}

void *sub_1DCB625B4(void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

std::string *sub_1DCB62638(std::string *__dst, const std::string::value_type *__src, size_t __len)
{
  LODWORD(v6) = SHIBYTE(__dst->__r_.__value_.__r.__words[2]);
  if ((v6 & 0x80000000) != 0)
  {
    unint64_t v10 = __dst->__r_.__value_.__r.__words[2];
    std::string::size_type v9 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (v9 < __len)
    {
      std::string::size_type size = __dst->__r_.__value_.__l.__size_;
      goto LABEL_6;
    }
    unint64_t v6 = HIBYTE(v10);
    char v7 = (std::string *)__dst->__r_.__value_.__r.__words[0];
  }
  else
  {
    char v7 = __dst;
    if (__len > 0x16)
    {
      std::string::size_type size = HIBYTE(__dst->__r_.__value_.__r.__words[2]);
      std::string::size_type v9 = 22;
LABEL_6:
      std::string::__grow_by_and_replace(__dst, v9, __len - v9, size, 0, size, __len, __src);
      return __dst;
    }
  }
  if (__len)
  {
    memmove(v7, __src, __len);
    LOBYTE(v6) = *((unsigned char *)&__dst->__r_.__value_.__s + 23);
  }
  if ((v6 & 0x80) != 0) {
    __dst->__r_.__value_.__l.__size_ = __len;
  }
  else {
    *((unsigned char *)&__dst->__r_.__value_.__s + 23) = __len & 0x7F;
  }
  v7->__r_.__value_.__s.__data_[__len] = 0;
  return __dst;
}

std::string *sub_1DCB626F8(std::string *a1, char *__s)
{
  size_t v4 = strlen(__s);

  return sub_1DCB62638(a1, __s, v4);
}

void sub_1DCB62744()
{
}

unsigned char *sub_1DCB62758(uint64_t a1)
{
  id result = operator new(0x10uLL);
  *(void *)id result = &unk_1F37F8328;
  result[8] = *(unsigned char *)(a1 + 8);
  return result;
}

uint64_t sub_1DCB627A4(uint64_t result, uint64_t a2)
{
  *(void *)a2 = &unk_1F37F8328;
  *(unsigned char *)(a2 + _Block_object_dispose(&STACK[0x220], 8) = *(unsigned char *)(result + 8);
  return result;
}

uint64_t sub_1DCB627D4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

void sub_1DCB627E0()
{
}

void *sub_1DCB627F4(uint64_t a1)
{
  id result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *id result = &unk_1F37F8010;
  result[1] = v3;
  return result;
}

uint64_t sub_1DCB6283C(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1F37F8010;
  a2[1] = v2;
  return result;
}

uint64_t sub_1DCB62868(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

void sub_1DCB62874()
{
}

unsigned char *sub_1DCB62888(uint64_t a1)
{
  id result = operator new(0x10uLL);
  *(void *)id result = &unk_1F37F7D40;
  result[8] = *(unsigned char *)(a1 + 8);
  return result;
}

uint64_t sub_1DCB628D4(uint64_t result, uint64_t a2)
{
  *(void *)a2 = &unk_1F37F7D40;
  *(unsigned char *)(a2 + _Block_object_dispose(&STACK[0x220], 8) = *(unsigned char *)(result + 8);
  return result;
}

uint64_t sub_1DCB62904(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

void sub_1DCB62910()
{
}

unsigned char *sub_1DCB62924(uint64_t a1)
{
  id result = operator new(0x10uLL);
  *(void *)id result = &unk_1F37F7DD0;
  result[8] = *(unsigned char *)(a1 + 8);
  return result;
}

uint64_t sub_1DCB62970(uint64_t result, uint64_t a2)
{
  *(void *)a2 = &unk_1F37F7DD0;
  *(unsigned char *)(a2 + _Block_object_dispose(&STACK[0x220], 8) = *(unsigned char *)(result + 8);
  return result;
}

uint64_t sub_1DCB629A0(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

void sub_1DCB629AC()
{
}

unsigned char *sub_1DCB629C0(uint64_t a1)
{
  id result = operator new(0x10uLL);
  *(void *)id result = &unk_1F37F7CF8;
  result[8] = *(unsigned char *)(a1 + 8);
  return result;
}

uint64_t sub_1DCB62A0C(uint64_t result, uint64_t a2)
{
  *(void *)a2 = &unk_1F37F7CF8;
  *(unsigned char *)(a2 + _Block_object_dispose(&STACK[0x220], 8) = *(unsigned char *)(result + 8);
  return result;
}

uint64_t sub_1DCB62A3C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

void sub_1DCB62A48()
{
}

unsigned char *sub_1DCB62A5C(uint64_t a1)
{
  id result = operator new(0x10uLL);
  *(void *)id result = &unk_1F37F7D88;
  result[8] = *(unsigned char *)(a1 + 8);
  return result;
}

uint64_t sub_1DCB62AA8(uint64_t result, uint64_t a2)
{
  *(void *)a2 = &unk_1F37F7D88;
  *(unsigned char *)(a2 + _Block_object_dispose(&STACK[0x220], 8) = *(unsigned char *)(result + 8);
  return result;
}

uint64_t sub_1DCB62AD8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

void sub_1DCB62AE4()
{
}

unsigned char *sub_1DCB62AF8(uint64_t a1)
{
  id result = operator new(0x10uLL);
  *(void *)id result = &unk_1F37F7E18;
  result[8] = *(unsigned char *)(a1 + 8);
  return result;
}

uint64_t sub_1DCB62B44(uint64_t result, uint64_t a2)
{
  *(void *)a2 = &unk_1F37F7E18;
  *(unsigned char *)(a2 + _Block_object_dispose(&STACK[0x220], 8) = *(unsigned char *)(result + 8);
  return result;
}

uint64_t sub_1DCB62B74(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

void sub_1DCB62B80()
{
}

unsigned char *sub_1DCB62B94(uint64_t a1)
{
  id result = operator new(0x10uLL);
  *(void *)id result = &unk_1F37F81C0;
  result[8] = *(unsigned char *)(a1 + 8);
  return result;
}

uint64_t sub_1DCB62BE0(uint64_t result, uint64_t a2)
{
  *(void *)a2 = &unk_1F37F81C0;
  *(unsigned char *)(a2 + _Block_object_dispose(&STACK[0x220], 8) = *(unsigned char *)(result + 8);
  return result;
}

uint64_t sub_1DCB62C10(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

void sub_1DCB62C1C()
{
}

unsigned char *sub_1DCB62C30(uint64_t a1)
{
  id result = operator new(0x10uLL);
  *(void *)id result = &unk_1F37F7F80;
  result[8] = *(unsigned char *)(a1 + 8);
  return result;
}

uint64_t sub_1DCB62C7C(uint64_t result, uint64_t a2)
{
  *(void *)a2 = &unk_1F37F7F80;
  *(unsigned char *)(a2 + _Block_object_dispose(&STACK[0x220], 8) = *(unsigned char *)(result + 8);
  return result;
}

uint64_t sub_1DCB62CAC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

void sub_1DCB62CB8()
{
}

void *sub_1DCB62CCC(uint64_t a1)
{
  id result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *id result = &unk_1F37F7EF0;
  result[1] = v3;
  return result;
}

uint64_t sub_1DCB62D14(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1F37F7EF0;
  a2[1] = v2;
  return result;
}

uint64_t sub_1DCB62D40(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

void sub_1DCB62D4C()
{
}

void *sub_1DCB62D60(uint64_t a1)
{
  id result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *id result = &unk_1F37F7F38;
  result[1] = v3;
  return result;
}

uint64_t sub_1DCB62DA8(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1F37F7F38;
  a2[1] = v2;
  return result;
}

uint64_t sub_1DCB62DD4(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t sub_1DCB62DDC(uint64_t a1)
{
  return a1;
}

void sub_1DCB62E08(uint64_t a1)
{
  JUMPOUT(0x1E01A8C50);
}

void *sub_1DCB62E54(uint64_t a1)
{
  uint64_t v2 = operator new(0x10uLL);
  *uint64_t v2 = &unk_1F37F7C68;
  v2[1] = *(id *)(a1 + 8);
  return v2;
}

id sub_1DCB62EAC(uint64_t a1, void *a2)
{
  *a2 = &unk_1F37F7C68;
  id result = *(id *)(a1 + 8);
  a2[1] = result;
  return result;
}

void sub_1DCB62EF4(uint64_t a1)
{
}

void sub_1DCB62EFC(id *a1)
{
  operator delete(a1);
}

id sub_1DCB62F38(uint64_t a1)
{
  return *(id *)(a1 + 8);
}

void *sub_1DCB62F40(void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

uint64_t sub_1DCB62FC4(uint64_t a1)
{
  return a1;
}

void sub_1DCB62FF0(uint64_t a1)
{
  JUMPOUT(0x1E01A8C50);
}

void *sub_1DCB6303C(uint64_t a1)
{
  uint64_t v2 = operator new(0x10uLL);
  *uint64_t v2 = &unk_1F37F7CB0;
  v2[1] = *(id *)(a1 + 8);
  return v2;
}

id sub_1DCB63094(uint64_t a1, void *a2)
{
  *a2 = &unk_1F37F7CB0;
  id result = *(id *)(a1 + 8);
  a2[1] = result;
  return result;
}

void sub_1DCB630DC(uint64_t a1)
{
}

void sub_1DCB630E4(id *a1)
{
  operator delete(a1);
}

id sub_1DCB63120(uint64_t a1)
{
  return *(id *)(a1 + 8);
}

void *sub_1DCB63128(void *result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 8);
  if (v2 != a2)
  {
    size_t v4 = result;
    id v5 = result + 2;
    do
    {
      unint64_t v6 = (void *)v4[3];
      uint64_t v7 = *(void *)(v2 + 16);
      while (v6 != v5)
      {
        if (v6[2] == v7)
        {
          if (v6 != v5) {
            __assert_rtn("addDownstreamNodes", "SoundAnalysis_ProcessingNode.cpp", 27, "!elementFoundInList(node, mDownstreamNodes)");
          }
          break;
        }
        unint64_t v6 = (void *)v6[1];
      }
      (*(void (**)(double *__return_ptr))(*(void *)v7 + 16))(&v16);
      (*(void (**)(double *__return_ptr, void *))(*v4 + 24))(&v10, v4);
      if (v16 != v10
        || v17 != v11
        || v18 != v12
        || v19 != v13
        || v20 != v14
        || v21 != v15
        || (sub_1DCB48FD8((uint64_t)&v16, (uint64_t)&v10, 0, 0) & 1) == 0)
      {
        __assert_rtn("addDownstreamNodes", "SoundAnalysis_ProcessingNode.cpp", 31, "CA::StreamDescription::IsEquivalent(node->upstreamFB().mFormat, downstreamFB().mFormat)");
      }
      id result = operator new(0x18uLL);
      uint64_t v8 = *(void *)(v2 + 16);
      result[1] = v5;
      result[2] = v8;
      uint64_t v9 = v4[2];
      *id result = v9;
      *(void *)(v9 + _Block_object_dispose(&STACK[0x220], 8) = result;
      v4[2] = result;
      ++v4[4];
      uint64_t v2 = *(void *)(v2 + 8);
    }
    while (v2 != a2);
  }
  return result;
}

uint64_t sub_1DCB632DC(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 8);
  if (v2 != a2)
  {
    uint64_t v4 = result;
    uint64_t v5 = result + 16;
    do
    {
      uint64_t v6 = *(void *)(v4 + 24);
      if (v6 == v5) {
        goto LABEL_10;
      }
      while (*(void *)(v6 + 16) != *(void *)(v2 + 16))
      {
        uint64_t v6 = *(void *)(v6 + 8);
        if (v6 == v5) {
          goto LABEL_10;
        }
      }
      if (v6 == v5) {
LABEL_10:
      }
        __assert_rtn("removeDownstreamNodes", "SoundAnalysis_ProcessingNode.cpp", 38, "elementFoundInList(node, mDownstreamNodes)");
      id result = sub_1DCB63384(v5, (void *)(v2 + 16));
      uint64_t v2 = *(void *)(v2 + 8);
    }
    while (v2 != a2);
  }
  return result;
}

uint64_t sub_1DCB63384(uint64_t a1, void *a2)
{
  v11[0] = (uint64_t)v11;
  v11[1] = (uint64_t)v11;
  uint64_t v12 = 0;
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2 == (void *)a1)
  {
    uint64_t v9 = 0;
  }
  else
  {
    do
    {
      uint64_t v6 = (void *)v2[1];
      uint64_t v5 = v2[2];
      if (v5 == *a2)
      {
        if (v6 == (void *)a1)
        {
          BOOL v8 = 1;
LABEL_8:
          uint64_t v6 = (void *)a1;
        }
        else
        {
          while (1)
          {
            uint64_t v7 = v6[2];
            BOOL v8 = v7 == v5;
            if (v7 != v5) {
              break;
            }
            uint64_t v6 = (void *)v6[1];
            if (v6 == (void *)a1) {
              goto LABEL_8;
            }
          }
        }
        sub_1DCB63464((uint64_t)v11, v11, a1, v2, v6);
        if (!v8) {
          uint64_t v6 = (void *)v6[1];
        }
      }
      uint64_t v2 = v6;
    }
    while (v6 != (void *)a1);
    uint64_t v9 = v12;
  }
  sub_1DCB44990(v11);
  return v9;
}

void sub_1DCB63450(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1DCB44990((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB63464(uint64_t result, uint64_t *a2, uint64_t a3, void *a4, void *a5)
{
  if (a4 != a5)
  {
    uint64_t v5 = (void *)*a5;
    if (result != a3)
    {
      uint64_t v6 = 1;
      if (v5 != a4)
      {
        uint64_t v7 = a4;
        do
        {
          uint64_t v7 = (void *)v7[1];
          ++v6;
        }
        while (v7 != v5);
      }
      *(void *)(a3 + 16) -= v6;
      *(void *)(result + 16) += v6;
    }
    uint64_t v8 = *a4;
    *(void *)(v8 + _Block_object_dispose(&STACK[0x220], 8) = v5[1];
    *(void *)v5[1] = v8;
    uint64_t v9 = *a2;
    *(void *)(v9 + _Block_object_dispose(&STACK[0x220], 8) = a4;
    *a4 = v9;
    *a2 = (uint64_t)v5;
    v5[1] = a2;
  }
  return result;
}

void sub_1DCB6358C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCB63604(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

uint64_t sub_1DCB63670(uint64_t a1)
{
  *(void *)DSPGraph::Box::Box((DSPGraph::Box *)a1) = &unk_1F37F7660;
  *(void *)(a1 + 776) = objc_alloc_init(DSPGCoreMLInfo);
  *(_OWORD *)(a1 + 784) = 0u;
  *(void *)(a1 + 797) = 0;
  return a1;
}

void sub_1DCB636DC(_Unwind_Exception *a1)
{
  DSPGraph::Box::~Box(v1);
  _Unwind_Resume(a1);
}

void sub_1DCB636F0(DSPGraph::Box *a1)
{
  uint64_t v6 = a1;
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  DSPGraph::Box::initialize(a1);
  uint64_t v7 = *((void *)v6 + 8);
  uint64_t v8 = *((void *)v6 + 9);
  if (((v8 - v7) & 0x1FFFFFFFE0) != 0x20 || ((*((void *)v6 + 12) - *((void *)v6 + 11)) & 0x1FFFFFFFE0) != 0x20)
  {
    sub_1DCB43D1C(buf, "/Library/Caches/com.apple.xbs/Sources/Listen/Framework/Internal/Core/DSPGraph/Boxes/DSPGraph_CoreMLBox.mm");
    sub_1DCB43D1C(&v82, "initialize");
    sub_1DCB43D1C(v81, "only supports 1 bus in 1 bus out");
    DSPGraph::ThrowException();
    goto LABEL_106;
  }
  if (v8 == v7)
  {
    sub_1DCB43D1C(buf, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(&v82, "in");
    int64x2_t v71 = (void *)((char *)v6 + 32);
    if (*((char *)v6 + 55) < 0) {
      int64x2_t v71 = (void *)*v71;
    }
    DSPGraph::strprintf((uint64_t *)v81, (DSPGraph *)"Box::in inIndex out of range! box %s has %zu inputs but input %u was requested", v70, v71, (uint64_t)(*((void *)v6 + 9) - *((void *)v6 + 8)) >> 5, 0);
    DSPGraph::ThrowException();
    goto LABEL_106;
  }
  uint64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)v7 + 40))(v7);
  uint64_t v10 = *((void *)v6 + 11);
  if (*((void *)v6 + 12) == v10)
  {
    sub_1DCB43D1C(buf, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(&v82, "out");
    int32x2_t v73 = (void *)((char *)v6 + 32);
    if (*((char *)v6 + 55) < 0) {
      int32x2_t v73 = (void *)*v73;
    }
    DSPGraph::strprintf((uint64_t *)v81, (DSPGraph *)"Box::out inIndex out of range! box %s has %zu outputs but input %u was requested", v72, v73, (uint64_t)(*((void *)v6 + 12) - *((void *)v6 + 11)) >> 5, 0);
    DSPGraph::ThrowException();
    goto LABEL_106;
  }
  uint64_t v5 = *(void *)(v9 + 120);
  uint64_t v11 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v10 + 40))(v10) + 120);
  unsigned int v78 = *(_DWORD *)(v5 + 28);
  if (v78 >= 2 && (*(unsigned char *)(v5 + 12) & 0x20) == 0)
  {
    sub_1DCB43D1C(buf, "/Library/Caches/com.apple.xbs/Sources/Listen/Framework/Internal/Core/DSPGraph/Boxes/DSPGraph_CoreMLBox.mm");
    sub_1DCB43D1C(&v82, "initialize");
    sub_1DCB43D1C(v81, "input format must be deinterleaved");
    DSPGraph::ThrowException();
    goto LABEL_106;
  }
  if (*(_DWORD *)(v11 + 28) != 1)
  {
    sub_1DCB43D1C(buf, "/Library/Caches/com.apple.xbs/Sources/Listen/Framework/Internal/Core/DSPGraph/Boxes/DSPGraph_CoreMLBox.mm");
    sub_1DCB43D1C(&v82, "initialize");
    sub_1DCB43D1C(v81, "output must be single channel");
    DSPGraph::ThrowException();
    goto LABEL_106;
  }
  double v12 = *(double *)v5;
  if (*(double *)v5 != *(double *)v11)
  {
    sub_1DCB43D1C(buf, "/Library/Caches/com.apple.xbs/Sources/Listen/Framework/Internal/Core/DSPGraph/Boxes/DSPGraph_CoreMLBox.mm");
    sub_1DCB43D1C(&v82, "initialize");
    sub_1DCB43D1C(v81, "input and output sample rates must match");
    DSPGraph::ThrowException();
    goto LABEL_106;
  }
  if (*(_DWORD *)(v5 + 8) == 1819304813) {
    unsigned int v13 = *((_DWORD *)v6 + 200) * *(_DWORD *)(v5 + 24);
  }
  else {
    unsigned int v13 = *(_DWORD *)(v5 + 16);
  }
  *((_DWORD *)v6 + 19_Block_object_dispose(&STACK[0x220], 8) = v13;
  if (*(_DWORD *)(v11 + 8) == 1819304813) {
    int v14 = *((_DWORD *)v6 + 200) * *(_DWORD *)(v11 + 24);
  }
  else {
    int v14 = *(_DWORD *)(v11 + 16);
  }
  *((_DWORD *)v6 + 199) = v14;
  uint64_t v15 = *((void *)v6 + 98);
  if (v15)
  {
    v81[0] = 0;
    double v16 = objc_msgSend(MEMORY[0x1E4F1E968], "compileModelAtURL:error:", v15, v81, v12);
    uint64_t v3 = v81[0];
    if (v16)
    {
      float v83 = v3;
      uint64_t v2 = [MEMORY[0x1E4F1E968] modelWithContentsOfURL:v16 error:&v83];
      float v80 = v83;

      if (v2)
      {
        uint64_t v3 = sub_1DCB6CF14();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1DC873000, v3, OS_LOG_TYPE_DEFAULT, "MLModel successfully loaded!", buf, 2u);
        }
      }
      sub_1DCB63604(*((void *)v6 + 97), v2);
    }
    else
    {
      uint64_t v2 = sub_1DCB6CF14();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = *((void *)v6 + 98);
        *(_DWORD *)long long buf = 138412546;
        *(void *)id v85 = v17;
        *(_WORD *)&v85[8] = 2112;
        uint64_t v86 = v3;
        _os_log_impl(&dword_1DC873000, v2, OS_LOG_TYPE_ERROR, "Unable to compile model at %@ with error %@", buf, 0x16u);
      }
      float v80 = v3;
    }
  }
  else
  {
    float v80 = 0;
  }
  uint64_t v18 = *((void *)v6 + 97);
  if (!v18 || (int v19 = *(void **)(v18 + 8)) == 0)
  {
    float32x2_t v37 = sub_1DCB6CF14();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)id v85 = v80;
      _os_log_impl(&dword_1DC873000, v37, OS_LOG_TYPE_ERROR, "No CoreML model set: %@", buf, 0xCu);
    }

    goto LABEL_85;
  }
  id v20 = v19;
  int v21 = [v20 modelDescription];
  uint64_t v1 = [v21 inputDescriptionsByName];

  uint64_t v22 = *((void *)v6 + 97);
  if (v22) {
    int v23 = *(void **)(v22 + 8);
  }
  else {
    int v23 = 0;
  }
  int v24 = [v23 modelDescription];
  uint64_t v2 = [v24 outputDescriptionsByName];

  if (![v1 count] || !-[NSObject count](v2, "count"))
  {
    uint64_t v3 = sub_1DCB6CF14();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1DC873000, v3, OS_LOG_TYPE_ERROR, "MLModel must have at least one feature in and one feature out", buf, 2u);
    }

    goto LABEL_85;
  }
  uint64_t v25 = (void *)*((void *)v6 + 97);
  if (v25) {
    uint64_t v25 = (void *)v25[1];
  }
  int v26 = v25;
  int v27 = [v26 modelDescription];
  uint64_t v3 = +[SNUtils userSuppliedInputFeatureNames:v27];

  if ([v3 count] != 1)
  {
    uint64_t v4 = sub_1DCB6CF14();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)id v85 = v3;
      _os_log_impl(&dword_1DC873000, v4, OS_LOG_TYPE_ERROR, "MLModel must have only one user defined input. Has %@", buf, 0xCu);
    }
    goto LABEL_84;
  }
  uint64_t v28 = [v3 firstObject];
  uint64_t v4 = [v1 objectForKeyedSubscript:v28];

  int v29 = [v4 multiArrayConstraint];
  BOOL v30 = +[SNUtils multiArrayConstraintLastDimensionIsFlexible:v29];

  unint64_t v77 = v13 >> 2;
  if (!v30)
  {
    uint64_t v38 = [v4 multiArrayConstraint];
    int64x2_t v39 = [v38 shape];
    int v40 = +[SNUtils numberOfElements:v39];
    BOOL v41 = v40 < 0;
    BOOL v42 = v40 <= 0;
    unsigned int v43 = v40 & 0xFFFFFF00 | (v40 & ~(v40 >> 31));
    if (v42) {
      int v44 = 0;
    }
    else {
      int v44 = -1;
    }
    if (v41) {
      unsigned int v45 = v44;
    }
    else {
      unsigned int v45 = v43;
    }

    if (v77 * v78 != v45)
    {
      uint64_t v35 = sub_1DCB6CF14();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 67109632;
        *(_DWORD *)id v85 = v45;
        *(_WORD *)&v85[4] = 1024;
        *(_DWORD *)&v85[6] = v77;
        LOWORD(v86) = 1024;
        *(_DWORD *)((char *)&v86 + 2) = v78;
        float32x2_t v56 = "MLModel input requires %d total elements. CoreMLBox wire block size is %d, with %d channels";
        float32x2_t v57 = v35;
        uint32_t v58 = 20;
LABEL_82:
        _os_log_impl(&dword_1DC873000, v57, OS_LOG_TYPE_ERROR, v56, buf, v58);
      }
      goto LABEL_83;
    }
LABEL_56:
    float32x2_t v46 = [DSPGMLInputProvider alloc];
    uint64_t v47 = [v1 allKeys];
    int v76 = v4;
    id v75 = v47;
    if (!v46) {
      goto LABEL_107;
    }
    v82.receiver = v46;
    v82.super_class = (Class)DSPGMLInputProvider;
    uint64_t v48 = [(DSPGraph::Box *)&v82 init];
    if (!v48) {
      goto LABEL_75;
    }
    if ([v76 type] == 5)
    {
      objc_storeStrong((id *)&v48[1].isa, v4);
      uint64_t v49 = [MEMORY[0x1E4F1CA60] dictionary];
      Class isa = v48[2].isa;
      v48[2].Class isa = (Class)v49;

      objc_storeStrong((id *)&v48[3].isa, v47);
      id v51 = [v76 multiArrayConstraint];
      self;
      if (+[SNUtils multiArrayConstraintLastDimensionIsFlexible:v51])
      {
        unsigned int v52 = [v51 shape];
        uint64_t v74 = [v52 count];

        uint64_t v53 = [v51 shape];
        uint64_t v54 = [v53 mutableCopy];

        uint64x2_t v55 = [NSNumber numberWithInt:v77];
        [v54 setObject:v55 atIndexedSubscript:v74 - 1];
      }
      else
      {
        uint64_t v54 = [v51 shape];
      }

      uint64_t v59 = +[SNUtils modelBlockSize:v54 channelCount:v78];
      if (v59 == v77)
      {
        uint64_t v60 = [objc_alloc(MEMORY[0x1E4F1E9A8]) initWithShape:v54 dataType:65568 error:0];
        Class v61 = v48[4].isa;
        v48[4].Class isa = (Class)v60;

        if (v48[4].isa)
        {
LABEL_74:

          goto LABEL_75;
        }
        uint32x2_t v62 = sub_1DCB6CF14();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1DC873000, v62, OS_LOG_TYPE_ERROR, "Error allocating MLMultiArray", buf, 2u);
        }
      }
      else
      {
        uint32x2_t v62 = sub_1DCB6CF14();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          id v79 = [NSNumber numberWithUnsignedInt:v77];
          float32x2_t v63 = [NSNumber numberWithUnsignedInt:v59];
          *(_DWORD *)long long buf = 138412546;
          *(void *)id v85 = v79;
          *(_WORD *)&v85[8] = 2112;
          uint64_t v86 = v63;
          _os_log_impl(&dword_1DC873000, v62, OS_LOG_TYPE_ERROR, "CoreMLBox configured to receive %@ elements. CoreMLModel input expects %@ total elements", buf, 0x16u);
        }
      }
    }
    else
    {
      uint64_t v54 = sub_1DCB6CF14();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1DC873000, v54, OS_LOG_TYPE_ERROR, "Model must have MLMultiArray features", buf, 2u);
      }
    }

    uint64_t v54 = v48;
    uint64_t v48 = 0;
    goto LABEL_74;
  }
  uint64_t v31 = [v4 multiArrayConstraint];
  unint64_t v32 = +[SNUtils lastDimensionSizeRange:v31];
  unint64_t v34 = v33;

  if (v77 >= v32 && v77 - v32 < v34) {
    goto LABEL_56;
  }
  uint64_t v35 = sub_1DCB6CF14();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    uint64x2_t v36 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v32, v34);
    *(_DWORD *)long long buf = 138412546;
    *(void *)id v85 = v36;
    *(_WORD *)&v85[8] = 1024;
    LODWORD(v86) = v77;
    _os_log_impl(&dword_1DC873000, v35, OS_LOG_TYPE_ERROR, "MLModel supports block sizes in range %@. CoreMLBox block size is %d.", buf, 0x12u);
  }
LABEL_83:

LABEL_84:
LABEL_85:
  uint64_t v66 = sub_1DCB6CF14();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1DC873000, v66, OS_LOG_TYPE_ERROR, "No CoreML model prepared. Bypassing.", buf, 2u);
  }

  while (1)
  {
    uint64x2_t v67 = (id *)*((void *)v6 + 97);
    if (v67)
    {
      id v68 = v67[3];
      float32x2_t v69 = v68;
      uint64x2_t v67 = v68 ? (id *)*((void *)v68 + 4) : 0;
    }
    else
    {
      float32x2_t v69 = 0;
    }
    uint64_t v1 = v67;
    uint64_t v6 = (DSPGraph::Box *)(*(_DWORD *)(v5 + 28) * *((_DWORD *)v6 + 198) == 4 * sub_1DCB6469C([v1 count]));

    if (v6) {
      break;
    }
    sub_1DCB43D1C(buf, "/Library/Caches/com.apple.xbs/Sources/Listen/Framework/Internal/Core/DSPGraph/Boxes/DSPGraph_CoreMLBox.mm");
    sub_1DCB43D1C(&v82, "initialize");
    sub_1DCB43D1C(v81, "MLModel input doesn't match CoreMLBox upstream block size");
    DSPGraph::ThrowException();
LABEL_106:
    __break(1u);
LABEL_107:
    uint64_t v48 = 0;
LABEL_75:

    uint64_t v64 = *((void *)v6 + 97);
    if (v64) {
      objc_storeStrong((id *)(v64 + 24), v48);
    }

    uint64_t v65 = *((void *)v6 + 97);
    if (!v65 || !*(void *)(v65 + 24))
    {
      uint64_t v35 = sub_1DCB6CF14();
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        goto LABEL_83;
      }
      *(_WORD *)long long buf = 0;
      float32x2_t v56 = "Error creating input provider";
      float32x2_t v57 = v35;
      uint32_t v58 = 2;
      goto LABEL_82;
    }
  }
}

void sub_1DCB64430(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, void *a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB6469C(uint64_t result)
{
  if (result < 0)
  {
    exceptiouint64_t n = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_1DCB4C7B0(exception, "numerical cast overflow: could not retain value in conversion type");
    __cxa_throw(exception, (struct type_info *)&unk_1F37F61E8, MEMORY[0x1E4FBA1E0]);
  }
  return result;
}

void sub_1DCB646F4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB6470C(uint64_t result, char a2)
{
  *(unsigned char *)(result + 804) = a2;
  return result;
}

uint64_t sub_1DCB64714(uint64_t a1)
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 776);
  if (!v3 || !*(void *)(v3 + 8))
  {
    uint64_t v65 = sub_1DCB6CF14();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.__r_.__value_.__l.__data_) = 0;
      _os_log_impl(&dword_1DC873000, v65, OS_LOG_TYPE_DEFAULT, "No MLModel, bypassing this process call", (uint8_t *)&buf, 2u);
    }

    uint64_t v4 = a1;
    uint64_t v66 = *(void *)(a1 + 88);
    if (*(void *)(a1 + 96) == v66)
    {
      sub_1DCB43D1C(&buf, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
      sub_1DCB43D1C(&__p, "out");
      float v83 = (void *)(a1 + 32);
      if (*(char *)(a1 + 55) < 0) {
        float v83 = (void *)*v83;
      }
    }
    else
    {
      uint64_t v67 = (*(uint64_t (**)(uint64_t))(*(void *)v66 + 40))(v66);
      bzero(*(void **)(*(void *)(*(void *)(v67 + 56) + 80) + 16), *(unsigned int *)(a1 + 796));
      uint64_t v68 = *(void *)(a1 + 88);
      if (*(void *)(a1 + 96) != v68)
      {
        int v69 = *(_DWORD *)(a1 + 796);
        uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v68 + 40))(v68);
        *(_DWORD *)(*(void *)(*(void *)(result + 56) + 80) + 12) = v69;
        return result;
      }
      sub_1DCB43D1C(&buf, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
      sub_1DCB43D1C(&__p, "out");
      float v83 = (void *)(a1 + 32);
      if (*(char *)(a1 + 55) < 0) {
        float v83 = (void *)*v83;
      }
    }
LABEL_132:
    DSPGraph::strprintf((uint64_t *)&v111, (DSPGraph *)"Box::out inIndex out of range! box %s has %zu outputs but input %u was requested", v82, v83, (uint64_t)(*(void *)(a1 + 96) - *(void *)(a1 + 88)) >> 5, 0);
    DSPGraph::ThrowException();
    goto LABEL_176;
  }
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(a1 + 64);
  if (*(void *)(a1 + 72) == v5)
  {
    sub_1DCB43D1C(&buf, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(&__p, "in");
    float v81 = (void *)(a1 + 32);
    if (*(char *)(a1 + 55) < 0) {
      float v81 = (void *)*v81;
    }
    goto LABEL_91;
  }
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)v5 + 40))(v5);
  uint64_t v7 = *(void *)(a1 + 88);
  if (*(void *)(a1 + 96) == v7)
  {
    sub_1DCB43D1C(&buf, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(&__p, "out");
    float v83 = (void *)(a1 + 32);
    if (*(char *)(a1 + 55) < 0) {
      float v83 = (void *)*v83;
    }
    goto LABEL_132;
  }
  uint64_t v8 = *(void *)(*(void *)(v6 + 56) + 80);
  uint64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)v7 + 40))(v7);
  if (!v8) {
    __assert_rtn("process", "DSPGraph_CoreMLBox.mm", 231, "inABL");
  }
  uint64_t v10 = *(void *)(v9 + 56);
  uint64_t i = *(std::string **)(v10 + 80);
  if (!i) {
    __assert_rtn("process", "DSPGraph_CoreMLBox.mm", 232, "outABL");
  }
  int v11 = *(_DWORD *)(v8 + 12);
  uint64_t v4 = a1;
  if (v11 != *(_DWORD *)(a1 + 792)) {
    __assert_rtn("process", "DSPGraph_CoreMLBox.mm", 235, "inABL->mBuffers[0].mDataByteSize == mInputNumBytes");
  }
  uint64_t v12 = *(void *)(a1 + 64);
  if (*(void *)(a1 + 72) == v12)
  {
    sub_1DCB43D1C(&buf, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(&__p, "in");
    float v81 = (void *)(a1 + 32);
    if (*(char *)(a1 + 55) < 0) {
      float v81 = (void *)*v81;
    }
LABEL_91:
    DSPGraph::strprintf((uint64_t *)&v111, (DSPGraph *)"Box::in inIndex out of range! box %s has %zu inputs but input %u was requested", v80, v81, (uint64_t)(*(void *)(a1 + 72) - *(void *)(a1 + 64)) >> 5, 0);
    DSPGraph::ThrowException();
    goto LABEL_176;
  }
  uint64_t v2 = *(unsigned int *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v12 + 40))(v12) + 120) + 28);
  uint64_t v13 = *(void *)(a1 + 776);
  if (v13)
  {
    int v14 = *(id *)(v13 + 24);
    uint64_t v4 = (uint64_t)v14;
    if (v14) {
      int v14 = (void *)v14[4];
    }
  }
  else
  {
    uint64_t v4 = 0;
    int v14 = 0;
  }
  uint64_t v15 = [v14 dataType];

  if (v15 != 65568)
  {
    sub_1DCB43D1C(&buf, "/Library/Caches/com.apple.xbs/Sources/Listen/Framework/Internal/Core/DSPGraph/Boxes/DSPGraph_CoreMLBox.mm");
    sub_1DCB43D1C(&__p, "process");
    sub_1DCB43D1C(&v111, "input data must be Float32");
    DSPGraph::ThrowException();
    goto LABEL_176;
  }
  double v16 = *(id **)(a1 + 776);
  uint64_t v100 = v10;
  if (v16)
  {
    id v17 = v16[3];
    uint64_t v4 = (uint64_t)v17;
    if (!v17) {
      goto LABEL_177;
    }
    double v16 = (id *)*((void *)v17 + 4);
  }
  else
  {
    uint64_t v4 = 0;
  }
  while (1)
  {
    uint64_t v18 = v16;
    uint64_t v19 = [v18 count];
    sub_1DCB6469C(v19);
    uint64_t v20 = (*(_DWORD *)(a1 + 792) * v2);

    if (v20 != 4 * v19)
    {
      float v84 = *(id **)(a1 + 776);
      if (v84)
      {
        id v85 = v84[3];
        uint64_t v4 = (uint64_t)v85;
        if (v85) {
          float v84 = (id *)*((void *)v85 + 4);
        }
        else {
          float v84 = 0;
        }
      }
      else
      {
        uint64_t v4 = 0;
      }
      uint64_t v86 = v84;
      std::to_string(&v109, [v86 count]);
      sub_1DCB65DE0(&v110, "Error: Model input size (", &v109);
      sub_1DCB65D80(&v111, &v110, " bytes) doesn't match audio input size (");
      uint64_t i = &v108;
      std::to_string(&v108, *(_DWORD *)(a1 + 792));
      if ((v108.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v87 = &v108;
      }
      else {
        uint64_t v87 = (std::string *)v108.__r_.__value_.__r.__words[0];
      }
      if ((v108.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type size = HIBYTE(v108.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type size = v108.__r_.__value_.__l.__size_;
      }
      id v89 = std::string::append(&v111, (const std::string::value_type *)v87, size);
      long long v90 = *(_OWORD *)&v89->__r_.__value_.__l.__data_;
      __p.__r_.__value_.__r.__words[2] = v89->__r_.__value_.__r.__words[2];
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v90;
      v89->__r_.__value_.__l.__size_ = 0;
      v89->__r_.__value_.__r.__words[2] = 0;
      v89->__r_.__value_.__r.__words[0] = 0;
      sub_1DCB65D80(&buf, &__p, " bytes)");
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v108.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v108.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v111.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v111.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v110.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v110.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v109.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v109.__r_.__value_.__l.__data_);
      }

      sub_1DCB43D1C(&__p, "/Library/Caches/com.apple.xbs/Sources/Listen/Framework/Internal/Core/DSPGraph/Boxes/DSPGraph_CoreMLBox.mm");
      sub_1DCB43D1C(&v111, "process");
      DSPGraph::ThrowException();
      goto LABEL_176;
    }
    HIDWORD(i->__r_.__value_.__r.__words[1]) = *(_DWORD *)(a1 + 796);
    if (v2)
    {
      uint64_t i = 0;
      uint64_t v21 = 16;
      while (1)
      {
        uint64_t v22 = *(void *)(a1 + 64);
        if (*(void *)(a1 + 72) == v22) {
          break;
        }
        uint64_t v4 = *(void *)(*(void *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v22 + 40))(v22) + 56)
                                   + 80)
                       + v21);
        size_t v23 = *(unsigned int *)(a1 + 792);
        int v24 = *(id **)(a1 + 776);
        if (v24)
        {
          uint64_t v25 = (id **)v24[3];
          int v26 = v25;
          if (v25) {
            int v24 = v25[4];
          }
          else {
            int v24 = 0;
          }
        }
        else
        {
          int v26 = 0;
        }
        int v27 = v24;
        uint64_t v28 = [v27 dataPointer];
        int v29 = *(_DWORD *)(a1 + 792);

        if (v23) {
          memmove((void *)(v28 + (v29 * i)), (const void *)v4, v23);
        }
        uint64_t i = (std::string *)((char *)i + 1);
        v21 += 16;
        if ((std::string *)v2 == i) {
          goto LABEL_29;
        }
      }
      sub_1DCB43D1C(&buf, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
      sub_1DCB43D1C(&__p, "in");
      id v79 = (void *)(a1 + 32);
      if (*(char *)(a1 + 55) < 0) {
        id v79 = (void *)*v79;
      }
      goto LABEL_126;
    }
LABEL_29:
    BOOL v30 = (DSPGraph::Box *)a1;
    if (!*(unsigned char *)(a1 + 804))
    {
      context = (void *)MEMORY[0x1E01A90A0]();
      uint64_t v31 = *(void **)(a1 + 776);
      if (v31) {
        uint64_t v31 = (void *)v31[1];
      }
      unint64_t v32 = v31;
      unint64_t v33 = *(void **)(a1 + 776);
      if (v33) {
        unint64_t v33 = (void *)v33[3];
      }
      unint64_t v34 = v33;
      id v35 = objc_alloc_init(MEMORY[0x1E4F1E9E0]);
      id v107 = 0;
      uint64_t v4 = [v32 predictionFromFeatures:v34 options:v35 error:&v107];
      id v101 = v107;
      uint64_t v36 = *(void *)(a1 + 776);
      if (v36) {
        objc_storeStrong((id *)(v36 + 32), (id)v4);
      }

      long long v105 = 0u;
      long long v106 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      float32x2_t v37 = *(void **)(a1 + 776);
      if (v37) {
        float32x2_t v37 = (void *)v37[2];
      }
      uint64_t v38 = v37;
      uint64_t v39 = [v38 countByEnumeratingWithState:&v103 objects:v113 count:16];
      if (v39)
      {
        uint64_t v40 = *(void *)v104;
        do
        {
          for (uint64_t i = 0; i != (std::string *)v39; uint64_t i = (std::string *)((char *)i + 1))
          {
            if (*(void *)v104 != v40) {
              objc_enumerationMutation(v38);
            }
            BOOL v41 = *(void **)(a1 + 776);
            if (v41) {
              BOOL v41 = (void *)v41[3];
            }
            BOOL v42 = *(void **)(*((void *)&v103 + 1) + 8 * i);
            unsigned int v43 = v41;
            int v44 = *(void **)(a1 + 776);
            if (v44) {
              int v44 = (void *)v44[4];
            }
            uint64_t v2 = v44;
            unsigned int v45 = [v42 sourceFeatureName];
            float32x2_t v46 = [(id)v2 featureValueForName:v45];
            uint64_t v47 = [v42 destinationFeatureName];
            id v48 = v46;
            uint64_t v4 = v47;
            if (v43) {
              [v43[2] setObject:v48 forKeyedSubscript:v4];
            }
          }
          uint64_t v39 = [v38 countByEnumeratingWithState:&v103 objects:v113 count:16];
        }
        while (v39);
      }

      uint64_t v49 = *(void **)(a1 + 776);
      if (v49) {
        uint64_t v49 = (void *)v49[4];
      }
      uint64_t v50 = v49;
      id v51 = v50;
      if (!v50 || v101)
      {
        if (v101)
        {
          uint64_t v4 = sub_1DCB6CF14();
          if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf.__r_.__value_.__l.__data_) = 138412290;
            *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v101;
            _os_log_impl(&dword_1DC873000, (os_log_t)v4, OS_LOG_TYPE_ERROR, "CoreML prediction failed with %@", (uint8_t *)&buf, 0xCu);
          }
        }
        sub_1DCB43D1C(&buf, "/Library/Caches/com.apple.xbs/Sources/Listen/Framework/Internal/Core/DSPGraph/Boxes/DSPGraph_CoreMLBox.mm");
        sub_1DCB43D1C(&__p, "process");
        sub_1DCB43D1C(&v111, "prediction failed");
        DSPGraph::ThrowException();
        goto LABEL_176;
      }
      uint64_t v4 = [v50 featureNames];
      uint64_t i = (std::string *)([(id)v4 count] == 0);

      if (i)
      {
        sub_1DCB43D1C(&buf, "/Library/Caches/com.apple.xbs/Sources/Listen/Framework/Internal/Core/DSPGraph/Boxes/DSPGraph_CoreMLBox.mm");
        sub_1DCB43D1C(&__p, "process");
        sub_1DCB43D1C(&v111, "MLModel output must have only one feature (MLMultiArray)");
        DSPGraph::ThrowException();
        goto LABEL_176;
      }
      uint64_t v52 = *(void *)(a1 + 776);
      if (v52) {
        uint64_t v53 = *(void **)(v52 + 8);
      }
      else {
        uint64_t v53 = 0;
      }
      uint64_t v54 = [v53 modelDescription];
      uint64x2_t v55 = [v54 predictedProbabilitiesName];

      float32x2_t v56 = [v51 featureNames];
      uint64_t v4 = [v56 allObjects];
      float32x2_t v57 = [(id)v4 firstObject];

      LODWORD(v4) = 0;
      if (v55 && v57) {
        LODWORD(v4) = [v55 isEqual:v57];
      }
      uint32_t v58 = [v51 featureNames];
      if ([v58 count] == 1) {
        uint64_t v4 = v4;
      }
      else {
        uint64_t v4 = 1;
      }

      if ((v4 & 1) == 0)
      {
        uint64_t v2 = [v51 featureNames];
        uint64_t v59 = [(id)v2 allObjects];
        uint64_t v4 = [v59 firstObject];
        uint64_t v60 = [v51 featureValueForName:v4];

        if ([v60 type] != 5)
        {
          sub_1DCB43D1C(&buf, "/Library/Caches/com.apple.xbs/Sources/Listen/Framework/Internal/Core/DSPGraph/Boxes/DSPGraph_CoreMLBox.mm");
          sub_1DCB43D1C(&__p, "process");
          sub_1DCB43D1C(&v111, "MLModel output must be an MLMultiArray");
          DSPGraph::ThrowException();
          goto LABEL_176;
        }
        uint64_t v2 = [v60 multiArrayValue];
        Class v61 = *(void **)(*(void *)(v100 + 80) + 16);
        uint64_t v62 = [(id)v2 dataType];
        if (v62 == 65568)
        {
          if (*(_DWORD *)(a1 + 796) != 4 * sub_1DCB6469C([(id)v2 count]))
          {
            std::to_string(&v109, [(id)v2 count]);
            sub_1DCB65DE0(&v110, "Error: Model output size (", &v109);
            sub_1DCB65D80(&v111, &v110, " bytes) doesn't match audio input size (");
            uint64_t v4 = (uint64_t)&v108;
            std::to_string(&v108, *(_DWORD *)(a1 + 796));
            if ((v108.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              CMTime v95 = &v108;
            }
            else {
              CMTime v95 = (std::string *)v108.__r_.__value_.__r.__words[0];
            }
            if ((v108.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              std::string::size_type v96 = HIBYTE(v108.__r_.__value_.__r.__words[2]);
            }
            else {
              std::string::size_type v96 = v108.__r_.__value_.__l.__size_;
            }
            int v97 = std::string::append(&v111, (const std::string::value_type *)v95, v96);
            long long v98 = *(_OWORD *)&v97->__r_.__value_.__l.__data_;
            __p.__r_.__value_.__r.__words[2] = v97->__r_.__value_.__r.__words[2];
            *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v98;
            v97->__r_.__value_.__l.__size_ = 0;
            v97->__r_.__value_.__r.__words[2] = 0;
            v97->__r_.__value_.__r.__words[0] = 0;
            sub_1DCB65D80(&buf, &__p, " bytes)");
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__p.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(v108.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v108.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(v111.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v111.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(v110.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v110.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(v109.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v109.__r_.__value_.__l.__data_);
            }
            goto LABEL_175;
          }
          int64x2_t v71 = (const void *)[ (id) v2 dataPointer];
          size_t v72 = *(unsigned int *)(a1 + 796);
          if (v72) {
            memmove(v61, v71, v72);
          }
        }
        else
        {
          if (v62 != 65600)
          {
            sub_1DCB43D1C(&buf, "/Library/Caches/com.apple.xbs/Sources/Listen/Framework/Internal/Core/DSPGraph/Boxes/DSPGraph_CoreMLBox.mm");
            sub_1DCB43D1C(&__p, "process");
            sub_1DCB43D1C(&v111, "unsupported CoreML data type");
            DSPGraph::ThrowException();
            goto LABEL_176;
          }
          if (*(_DWORD *)(a1 + 796) != 4 * sub_1DCB6469C([(id)v2 count]))
          {
            std::to_string(&v109, [(id)v2 count]);
            sub_1DCB65DE0(&v110, "Error: Model output size (", &v109);
            sub_1DCB65D80(&v111, &v110, " bytes) doesn't match audio input size (");
            uint64_t v4 = (uint64_t)&v108;
            std::to_string(&v108, *(_DWORD *)(a1 + 796));
            if ((v108.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              int v91 = &v108;
            }
            else {
              int v91 = (std::string *)v108.__r_.__value_.__r.__words[0];
            }
            if ((v108.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              std::string::size_type v92 = HIBYTE(v108.__r_.__value_.__r.__words[2]);
            }
            else {
              std::string::size_type v92 = v108.__r_.__value_.__l.__size_;
            }
            int v93 = std::string::append(&v111, (const std::string::value_type *)v91, v92);
            long long v94 = *(_OWORD *)&v93->__r_.__value_.__l.__data_;
            __p.__r_.__value_.__r.__words[2] = v93->__r_.__value_.__r.__words[2];
            *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v94;
            v93->__r_.__value_.__l.__size_ = 0;
            v93->__r_.__value_.__r.__words[2] = 0;
            v93->__r_.__value_.__r.__words[0] = 0;
            sub_1DCB65D80(&buf, &__p, " bytes)");
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__p.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(v108.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v108.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(v111.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v111.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(v110.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v110.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(v109.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v109.__r_.__value_.__l.__data_);
            }
LABEL_175:
            sub_1DCB43D1C(&__p, "/Library/Caches/com.apple.xbs/Sources/Listen/Framework/Internal/Core/DSPGraph/Boxes/DSPGraph_CoreMLBox.mm");
            sub_1DCB43D1C(&v111, "process");
            DSPGraph::ThrowException();
            goto LABEL_176;
          }
          id v63 = (id) v2;
          uint64_t v4 = [v63 dataPointer];
          uint64_t v64 = [v63 count];
          sub_1DCB6469C(v64);
          vDSP_vdpsp((const double *)v4, 1, (float *)v61, 1, v64);
        }
      }
      BOOL v30 = (DSPGraph::Box *)a1;
    }
    uint64_t v73 = *((void *)v30 + 8);
    if (*((void *)v30 + 9) == v73)
    {
      sub_1DCB43D1C(&buf, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
      sub_1DCB43D1C(&__p, "in");
      id v79 = (void *)(a1 + 32);
      if (*(char *)(a1 + 55) < 0) {
        id v79 = (void *)*v79;
      }
      goto LABEL_126;
    }
    uint64_t v74 = (*(uint64_t (**)(uint64_t))(*(void *)v73 + 40))(v73);
    uint64_t v75 = *((void *)v30 + 8);
    if (*((void *)v30 + 9) != v75) {
      break;
    }
    sub_1DCB43D1C(&buf, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(&__p, "in");
    id v79 = (void *)(a1 + 32);
    if (*(char *)(a1 + 55) < 0) {
      id v79 = (void *)*v79;
    }
LABEL_126:
    DSPGraph::strprintf((uint64_t *)&v111, (DSPGraph *)"Box::in inIndex out of range! box %s has %zu inputs but input %u was requested", v78, v79, (uint64_t)(*(void *)(a1 + 72) - *(void *)(a1 + 64)) >> 5, 0);
    DSPGraph::ThrowException();
LABEL_176:
    __break(1u);
LABEL_177:
    double v16 = 0;
  }
  uint64_t v76 = *(unsigned int *)(*(void *)(v74 + 56) + 72);
  uint64_t v77 = (*(uint64_t (**)(uint64_t))(*(void *)v75 + 40))(v75);
  return DSPGraph::Box::propagateFlagsAndTimeStamp(v30, v76, (const AudioTimeStamp *)(*(void *)(v77 + 56) + 8));
}

void sub_1DCB65934(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,void *a33,uint64_t a34,int a35,__int16 a36,char a37,char a38,void *a39,uint64_t a40,int a41,__int16 a42,char a43,char a44,void *__p,uint64_t a46,int a47,__int16 a48,char a49,char a50,void *a51,uint64_t a52,int a53,__int16 a54,char a55,char a56)
{
  if (a50 < 0) {
    operator delete(__p);
  }
  if (a56 < 0) {
    operator delete(a51);
  }
  if (*(char *)(v61 - 105) < 0) {
    operator delete(*(void **)(v61 - 128));
  }

  _Unwind_Resume(a1);
}

__n128 sub_1DCB65D80(std::string *a1, std::string *a2, char *__s)
{
  std::string::size_type v6 = strlen(__s);
  uint64_t v7 = (__n128 *)std::string::append(a2, __s, v6);
  __n128 result = *v7;
  *a1 = *(std::string *)v7->n128_u8;
  v7->n128_u64[0] = 0;
  v7->n128_u64[1] = 0;
  v7[1].n128_u64[0] = 0;
  return result;
}

__n128 sub_1DCB65DE0(std::string *a1, char *__s, std::string *a3)
{
  std::string::size_type v6 = strlen(__s);
  uint64_t v7 = (__n128 *)std::string::insert(a3, 0, __s, v6);
  __n128 result = *v7;
  *a1 = *(std::string *)v7->n128_u8;
  v7->n128_u64[0] = 0;
  v7->n128_u64[1] = 0;
  v7[1].n128_u64[0] = 0;
  return result;
}

uint64_t sub_1DCB65E44()
{
  return 0;
}

void sub_1DCB65E4C(uint64_t a1, void *a2)
{
  id v8 = a2;
  sub_1DCB63604(*(void *)(a1 + 776), v8);
  uint64_t v3 = [v8 modelDescription];
  uint64_t v4 = [MEMORY[0x1E4F1CAD0] set];
  uint64_t v5 = +[SNModelMetadataUtils validatedFeedbackConnectionsFromModelDescription:v3 orDefault:v4];
  uint64_t v6 = *(void *)(a1 + 776);
  if (v6) {
    objc_storeStrong((id *)(v6 + 16), v5);
  }

  uint64_t v7 = *(void **)(a1 + 784);
  *(void *)(a1 + 784) = 0;
}

void sub_1DCB65F14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB65F40(uint64_t *a1, int a2, int a3, uint64_t a4, int a5, id *a6)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a2 != 10000) {
    return 4294956417;
  }
  if (a5 != 8) {
    return 561211770;
  }
  if (a3) {
    return 4294956430;
  }
  if (!a6) {
    return 4294956445;
  }
  if (DSPGraph::Box::initialized((DSPGraph::Box *)a1))
  {
    uint64_t v9 = sub_1DCB6CF14();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1DC873000, v9, OS_LOG_TYPE_DEFAULT, "Audio is already running. Model will be loaded next time audio is restarted", (uint8_t *)&v15, 2u);
    }
  }
  id v10 = *a6;
  uint64_t v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v10];
  uint64_t v12 = (void *)a1[98];
  a1[98] = v11;

  if (a1[98])
  {
    uint64_t v13 = sub_1DCB6CF14();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v10;
      _os_log_impl(&dword_1DC873000, v13, OS_LOG_TYPE_DEFAULT, "Set CoreMLModel URL at path %@", (uint8_t *)&v15, 0xCu);
    }

    sub_1DCB63604(a1[97], 0);
  }
  else
  {
    int v14 = sub_1DCB6CF14();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412290;
      id v16 = v10;
      _os_log_impl(&dword_1DC873000, v14, OS_LOG_TYPE_ERROR, "Error creating URL from path: %@", (uint8_t *)&v15, 0xCu);
    }
  }
  return 0;
}

void sub_1DCB6611C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1DCB6613C(uint64_t a1)
{
  return *(id *)(a1 + 776);
}

void sub_1DCB66148(id *a1)
{
  sub_1DCB661B4(a1);

  JUMPOUT(0x1E01A8C50);
}

const char *sub_1DCB66180()
{
  return "CoreMLBox";
}

uint64_t sub_1DCB6618C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 800) = a2;
  return result;
}

uint64_t sub_1DCB66194()
{
  return 1;
}

double sub_1DCB6619C@<D0>(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 + 16) = 0;
  double result = *(double *)"xfualmrcxoba";
  *(_OWORD *)a1 = *(_OWORD *)"xfualmrcxoba";
  return result;
}

void sub_1DCB661B4(id *a1)
{
  DSPGraph::Box::~Box((DSPGraph::Box *)a1);
}

uint64_t sub_1DCB661F8()
{
  return *MEMORY[0x1E4F14960];
}

unint64_t sub_1DCB66208(unint64_t *a1)
{
  return atomic_load(a1);
}

unint64_t *sub_1DCB66210(unint64_t *result, unint64_t a2)
{
  return result;
}

unint64_t sub_1DCB66218(atomic_ullong *a1, unint64_t a2)
{
  return atomic_fetch_add(a1, a2);
}

BOOL sub_1DCB66220(atomic_ullong *a1, uint64_t *a2, unint64_t a3)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *a2;
  atomic_compare_exchange_strong_explicit(a1, (unint64_t *)&v4, a3, memory_order_relaxed, memory_order_relaxed);
  BOOL result = v4 == v3;
  *a2 = v4;
  return result;
}

uint64_t sub_1DCB6623C(unsigned __int8 *a1)
{
  unsigned __int8 v1 = atomic_load(a1);
  return v1 & 1;
}

unsigned __int8 *sub_1DCB66248(unsigned __int8 *result, unsigned __int8 a2)
{
  return result;
}

BOOL sub_1DCB66250(atomic_uchar *a1, unsigned char *a2, unsigned __int8 a3)
{
  int v3 = *a2;
  int v4 = v3;
  atomic_compare_exchange_strong_explicit(a1, (unsigned __int8 *)&v4, a3, memory_order_relaxed, memory_order_relaxed);
  BOOL result = v4 == v3;
  *a2 = v4;
  return result;
}

void sub_1DCB6626C()
{
}

void sub_1DCB6629C()
{
}

uint64_t sub_1DCB662CC(uint64_t result)
{
  if (result) {
    JUMPOUT(0x1E01A8C50);
  }
  return result;
}

uint64_t sub_1DCB662E8(uint64_t result)
{
  if (result) {
    JUMPOUT(0x1E01A8C50);
  }
  return result;
}

uint64_t sub_1DCB66304(uint64_t result)
{
  if (result) {
    JUMPOUT(0x1E01A8C50);
  }
  return result;
}

__CFString *sub_1DCB66320()
{
  return @"Shouting";
}

void sub_1DCB663D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCB6655C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB667B8(uint64_t a1)
{
  DSPGraph::RingBufferBox::initialize((DSPGraph::RingBufferBox *)a1);
  MEMORY[0x1E01A8730](a1 + 808);
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 72);
  if (((v3 - v2) & 0x1FFFFFFFE0) == 0)
  {
    sub_1DCB43D1C(v58, "/Library/Caches/com.apple.xbs/Sources/Listen/Framework/Internal/Core/DSPGraph/Boxes/DSPGraph_ContextBox.cpp");
    sub_1DCB43D1C(v57, "initialize");
    sub_1DCB43D1C(v56, "ContextBox has no inputs");
    uint64_t v47 = DSPGraph::ThrowException();
LABEL_64:
    __break(1u);
    return MEMORY[0x1F410B9C8](v47, v48, v49);
  }
  if (v3 == v2)
  {
    sub_1DCB43D1C(v58, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(v57, "in");
    id v51 = (void *)(a1 + 32);
    if (*(char *)(a1 + 55) < 0) {
      id v51 = (void *)*v51;
    }
    goto LABEL_59;
  }
  uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2);
  uint64_t v5 = *(void *)(a1 + 88);
  if (*(void *)(a1 + 96) == v5)
  {
    sub_1DCB43D1C(v58, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(v57, "out");
    uint64_t v53 = (void *)(a1 + 32);
    if (*(char *)(a1 + 55) < 0) {
      uint64_t v53 = (void *)*v53;
    }
    goto LABEL_62;
  }
  uint64_t v6 = *(void *)(v4 + 120);
  uint64_t v7 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v5 + 40))(v5) + 120);
  if (*(_DWORD *)(v6 + 40) == 1 && *(_DWORD *)(v7 + 40) == 1)
  {
    sub_1DCB43D1C(v58, "/Library/Caches/com.apple.xbs/Sources/Listen/Framework/Internal/Core/DSPGraph/Boxes/DSPGraph_ContextBox.cpp");
    sub_1DCB43D1C(v57, "validateFormats");
    sub_1DCB43D1C(v56, "Context box can't produce variable output frames.");
    uint64_t v47 = DSPGraph::ThrowException();
    goto LABEL_64;
  }
  if (*(_DWORD *)(v6 + 28) != *(_DWORD *)(v7 + 28))
  {
    sub_1DCB43D1C(v58, "/Library/Caches/com.apple.xbs/Sources/Listen/Framework/Internal/Core/DSPGraph/Boxes/DSPGraph_ContextBox.cpp");
    sub_1DCB43D1C(v57, "validateFormats");
    sub_1DCB43D1C(v56, "input and output channel counts don't match");
    uint64_t v47 = DSPGraph::ThrowException();
    goto LABEL_64;
  }
  if (*(_DWORD *)(a1 + 936) <= 1u) {
    __assert_rtn("initialize", "DSPGraph_ContextBox.cpp", 65, "mMaxFrames > 1");
  }
  uint64_t v9 = *(void *)(a1 + 64);
  if (*(void *)(a1 + 72) == v9)
  {
    sub_1DCB43D1C(v58, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(v57, "in");
    id v51 = (void *)(a1 + 32);
    if (*(char *)(a1 + 55) < 0) {
      id v51 = (void *)*v51;
    }
    goto LABEL_59;
  }
  uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)v9 + 40))(v9);
  uint64_t v11 = *(void *)(a1 + 88);
  if (*(void *)(a1 + 96) == v11)
  {
    sub_1DCB43D1C(v58, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(v57, "out");
    uint64_t v53 = (void *)(a1 + 32);
    if (*(char *)(a1 + 55) < 0) {
      uint64_t v53 = (void *)*v53;
    }
    goto LABEL_62;
  }
  uint64_t v12 = *(_DWORD **)(v10 + 120);
  int v14 = v12[3];
  unsigned int v13 = v12[4];
  int v15 = v12[6];
  unsigned int v55 = v12[7];
  uint64_t v16 = (*(uint64_t (**)(uint64_t))(*(void *)v11 + 40))(v11);
  uint64_t v17 = *(void *)(a1 + 64);
  if (*(void *)(a1 + 72) == v17)
  {
    sub_1DCB43D1C(v58, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(v57, "in");
    id v51 = (void *)(a1 + 32);
    if (*(char *)(a1 + 55) < 0) {
      id v51 = (void *)*v51;
    }
LABEL_59:
    DSPGraph::strprintf(v56, (DSPGraph *)"Box::in inIndex out of range! box %s has %zu inputs but input %u was requested", v50, v51, (uint64_t)(*(void *)(a1 + 72) - *(void *)(a1 + 64)) >> 5, 0);
    uint64_t v47 = DSPGraph::ThrowException();
    goto LABEL_64;
  }
  uint64_t v18 = *(_DWORD **)(v16 + 120);
  int v20 = v18[3];
  unsigned int v19 = v18[4];
  int v22 = v18[6];
  unsigned int v21 = v18[7];
  int v23 = DSPGraph::FCBox::upstreamBlockSize((DSPGraph::FCBox *)a1);
  uint64_t v24 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v17 + 40))(v17) + 120);
  int v25 = *(_DWORD *)(v24 + 8);
  BOOL v26 = v25 == 1718773105 || v25 == 1819304813;
  if (v26 || !*(_DWORD *)(v24 + 16))
  {
    unsigned int v13 = v23 * v15;
    if ((v14 & 0x20) == 0) {
      v13 /= v55;
    }
  }
  uint64_t v27 = *(void *)(a1 + 88);
  if (*(void *)(a1 + 96) == v27)
  {
    sub_1DCB43D1C(v58, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(v57, "out");
    uint64_t v53 = (void *)(a1 + 32);
    if (*(char *)(a1 + 55) < 0) {
      uint64_t v53 = (void *)*v53;
    }
LABEL_62:
    DSPGraph::strprintf(v56, (DSPGraph *)"Box::out inIndex out of range! box %s has %zu outputs but input %u was requested", v52, v53, (uint64_t)(*(void *)(a1 + 96) - *(void *)(a1 + 88)) >> 5, 0);
    uint64_t v47 = DSPGraph::ThrowException();
    goto LABEL_64;
  }
  int v28 = DSPGraph::FCBox::upstreamBlockSize((DSPGraph::FCBox *)a1);
  uint64_t v29 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v27 + 40))(v27) + 120);
  int v30 = *(_DWORD *)(v29 + 8);
  BOOL v31 = v30 == 1718773105 || v30 == 1819304813;
  if (v31 || !*(_DWORD *)(v29 + 16))
  {
    unsigned int v19 = v28 * v22;
    if ((v20 & 0x20) == 0) {
      v19 /= v21;
    }
  }
  *(_DWORD *)(a1 + 96_Block_object_dispose(&STACK[0x220], 8) = v13 >> 2;
  *(_DWORD *)(a1 + 972) = v19 >> 2;
  if (v19 >> 2 < v13 >> 2)
  {
    sub_1DCB43D1C(v58, "/Library/Caches/com.apple.xbs/Sources/Listen/Framework/Internal/Core/DSPGraph/Boxes/DSPGraph_ContextBox.cpp");
    sub_1DCB43D1C(v57, "initialize");
    sub_1DCB43D1C(v56, "number of context frames must be greater than block size");
    uint64_t v47 = DSPGraph::ThrowException();
    goto LABEL_64;
  }
  unsigned int v32 = DSPGraph::FCBox::downstreamBlockSize((DSPGraph::FCBox *)a1);
  LODWORD(v33) = *(_DWORD *)(a1 + 968);
  double v34 = (double)v32 * (double)v33 / (double)DSPGraph::FCBox::upstreamBlockSize((DSPGraph::FCBox *)a1);
  *(double *)(a1 + 944) = v34;
  if (vabdd_f64(floor(v34), v34) >= 0.001) {
    __assert_rtn("initialize", "DSPGraph_ContextBox.cpp", 94, "isIntegral(mOutputHopSize)");
  }
  uint64_t v35 = *(unsigned int *)(a1 + 968);
  *(void *)(a1 + 952) = v35;
  uint64_t v36 = *(void *)(a1 + 848);
  *(void *)(a1 + 960) = *(unsigned int *)(v36 + 268);
  int v37 = *(_DWORD *)(v36 + 276);
  uint64_t v38 = *(unsigned int *)(a1 + 972);
  unint64_t v39 = *(void *)(v36 + 296);
  if (v39)
  {
    unint64_t v40 = *(void *)(*(void *)(a1 + 856) + 296);
    unint64_t v41 = v39;
    do
    {
      unint64_t v42 = v41;
      unint64_t v41 = v40 % v41;
      unint64_t v40 = v42;
    }
    while (v41);
  }
  else
  {
    unint64_t v42 = *(void *)(*(void *)(a1 + 856) + 296);
  }
  uint64_t v43 = (v38 + v37 * v35);
  unint64_t v44 = (*(void *)(*(void *)(a1 + 856) + 296) - v42) * v35 / v39;
  unsigned int v45 = *(_DWORD *)(a1 + 968) * DSPGraph::FCBox::downstreamBlockSize((DSPGraph::FCBox *)a1);
  unsigned int v46 = DSPGraph::FCBox::upstreamBlockSize((DSPGraph::FCBox *)a1);
  *(_DWORD *)(a1 + 976) = (v44 + v38 - v45 / v46) & ~((uint64_t)(v44 + v38 - v45 / v46) >> 63);
  uint64_t v47 = a1 + 888;
  uint64_t v48 = v55;
  uint64_t v49 = v43;

  return MEMORY[0x1F410B9C8](v47, v48, v49);
}

void sub_1DCB66F80(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  if (a25 < 0) {
    operator delete(a20);
  }
  if (a31 < 0) {
    operator delete(a26);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DCB67038(uint64_t a1, int a2, int a3)
{
  *(_DWORD *)(a1 + 92_Block_object_dispose(&STACK[0x220], 8) = a2;
  *(_DWORD *)(a1 + 932) = a3;
  return MEMORY[0x1F410BA18](a1, 0, 0);
}

uint64_t sub_1DCB6704C(DSPGraph::RingBufferBox *a1)
{
  MEMORY[0x1E01A8730]((char *)a1 + 888);

  return DSPGraph::RingBufferBox::uninitialize(a1);
}

uint64_t sub_1DCB67088(uint64_t a1)
{
  return MEMORY[0x1F410B9B0](a1 + 888, *(unsigned int *)(a1 + 976));
}

uint64_t sub_1DCB67098(uint64_t a1, unsigned int a2)
{
  int v4 = DSPGraph::FCBox::upstreamBlockSize((DSPGraph::FCBox *)a1);
  unsigned int v5 = *(_DWORD *)(a1 + 936);
  if (v4 == 1)
  {
    if (v5 < a2) {
      __assert_rtn("process", "DSPGraph_ContextBox.cpp", 150, "inNumFrames <= mMaxFrames");
    }
    uint64_t v6 = *(void *)(a1 + 64);
    if (*(void *)(a1 + 72) == v6)
    {
      sub_1DCB43D1C(v19, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
      sub_1DCB43D1C(v18, "in");
      uint64_t v11 = (void *)(a1 + 32);
      if (*(char *)(a1 + 55) < 0) {
        uint64_t v11 = (void *)*v11;
      }
      goto LABEL_32;
    }
    (*(void (**)(uint64_t))(*(void *)v6 + 40))(v6);
    DSPGraph::RingBuffer::write();
    uint64_t v7 = *(void *)(a1 + 64);
    if (*(void *)(a1 + 72) == v7)
    {
      sub_1DCB43D1C(v19, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
      sub_1DCB43D1C(v18, "in");
      uint64_t v11 = (void *)(a1 + 32);
      if (*(char *)(a1 + 55) < 0) {
        uint64_t v11 = (void *)*v11;
      }
      goto LABEL_32;
    }
    uint64_t v8 = (*(uint64_t (**)(uint64_t))(*(void *)v7 + 40))(v7);
    uint64_t v9 = *(void *)(a1 + 64);
    if (*(void *)(a1 + 72) == v9)
    {
      sub_1DCB43D1C(v19, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
      sub_1DCB43D1C(v18, "in");
      uint64_t v11 = (void *)(a1 + 32);
      if (*(char *)(a1 + 55) < 0) {
        uint64_t v11 = (void *)*v11;
      }
LABEL_32:
      DSPGraph::strprintf(v17, (DSPGraph *)"Box::in inIndex out of range! box %s has %zu inputs but input %u was requested", v10, v11, (uint64_t)(*(void *)(a1 + 72) - *(void *)(a1 + 64)) >> 5, 0);
      uint64_t result = DSPGraph::ThrowException();
      __break(1u);
      return result;
    }
  }
  else
  {
    if (v5 != a2) {
      __assert_rtn("process", "DSPGraph_ContextBox.cpp", 156, "inNumFrames == mMaxFrames");
    }
    uint64_t v12 = *(void *)(a1 + 64);
    if (*(void *)(a1 + 72) == v12)
    {
      sub_1DCB43D1C(v19, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
      sub_1DCB43D1C(v18, "in");
      uint64_t v11 = (void *)(a1 + 32);
      if (*(char *)(a1 + 55) < 0) {
        uint64_t v11 = (void *)*v11;
      }
      goto LABEL_32;
    }
    (*(void (**)(uint64_t))(*(void *)v12 + 40))(v12);
    DSPGraph::RingBuffer::write();
    uint64_t v13 = *(void *)(a1 + 64);
    if (*(void *)(a1 + 72) == v13)
    {
      sub_1DCB43D1C(v19, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
      sub_1DCB43D1C(v18, "in");
      uint64_t v11 = (void *)(a1 + 32);
      if (*(char *)(a1 + 55) < 0) {
        uint64_t v11 = (void *)*v11;
      }
      goto LABEL_32;
    }
    uint64_t v8 = (*(uint64_t (**)(uint64_t))(*(void *)v13 + 40))(v13);
    uint64_t v9 = *(void *)(a1 + 64);
    if (*(void *)(a1 + 72) == v9)
    {
      sub_1DCB43D1C(v19, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
      sub_1DCB43D1C(v18, "in");
      uint64_t v11 = (void *)(a1 + 32);
      if (*(char *)(a1 + 55) < 0) {
        uint64_t v11 = (void *)*v11;
      }
      goto LABEL_32;
    }
  }
  uint64_t v14 = *(unsigned int *)(*(void *)(v8 + 56) + 72);
  int v15 = (const AudioTimeStamp *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v9 + 40))(v9) + 56) + 8);

  return DSPGraph::Box::propagateFlagsAndTimeStamp((DSPGraph::Box *)a1, v14, v15);
}

void sub_1DCB6754C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (*(char *)(v23 - 33) < 0) {
    operator delete(*(void **)(v23 - 56));
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DCB675D4(uint64_t a1)
{
  uint64_t v3 = a1 + 88;
  uint64_t v2 = *(void *)(a1 + 88);
  if (*(void *)(v3 + 8) == v2)
  {
    sub_1DCB43D1C(v14, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(v13, "out");
    uint64_t v11 = (void *)(a1 + 32);
    if (*(char *)(a1 + 55) < 0) {
      uint64_t v11 = (void *)*v11;
    }
  }
  else
  {
    uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2);
    DSPGraph::Buffer::restoreSizeToCapacity(*(DSPGraph::Buffer **)(v4 + 56));
    uint64_t v5 = *(void *)(a1 + 88);
    if (*(void *)(a1 + 96) == v5)
    {
      sub_1DCB43D1C(v14, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
      sub_1DCB43D1C(v13, "out");
      uint64_t v11 = (void *)(a1 + 32);
      if (*(char *)(a1 + 55) < 0) {
        uint64_t v11 = (void *)*v11;
      }
    }
    else
    {
      (*(void (**)(uint64_t))(*(void *)v5 + 40))(v5);
      DSPGraph::RingBuffer::read();
      uint64_t v6 = *(void *)(a1 + 88);
      if (*(void *)(a1 + 96) != v6)
      {
        uint64_t v7 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v6 + 40))(v6) + 56);
        *(_DWORD *)(v7 + 64) = 1;
        uint64_t result = DSPGraph::FCBox::downstreamSampleTime((DSPGraph::FCBox *)a1);
        *(void *)(v7 + _Block_object_dispose(&STACK[0x220], 8) = v9;
        return result;
      }
      sub_1DCB43D1C(v14, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
      sub_1DCB43D1C(v13, "out");
      uint64_t v11 = (void *)(a1 + 32);
      if (*(char *)(a1 + 55) < 0) {
        uint64_t v11 = (void *)*v11;
      }
    }
  }
  DSPGraph::strprintf(v12, (DSPGraph *)"Box::out inIndex out of range! box %s has %zu outputs but input %u was requested", v10, v11, (uint64_t)(*(void *)(a1 + 96) - *(void *)(a1 + 88)) >> 5, 0);
  uint64_t result = DSPGraph::ThrowException();
  __break(1u);
  return result;
}

void sub_1DCB67838(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (*(char *)(v23 - 33) < 0) {
    operator delete(*(void **)(v23 - 56));
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DCB6789C(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 936) <= 1u) {
    __assert_rtn("selfLatencyInTicks", "DSPGraph_ContextBox.cpp", 181, "mMaxFrames > 1");
  }
  uint64_t v2 = *(unsigned int *)(a1 + 976);
  uint64_t v3 = *(void *)(a1 + 960);
  uint64_t v4 = sub_1DCB482BC(*(void *)(*(void *)(a1 + 8) + 696));
  uint64_t v5 = *(void *)(a1 + 64);
  if (*(void *)(a1 + 72) == v5)
  {
    sub_1DCB43D1C(v12, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(v11, "in");
    uint64_t v8 = (void *)(a1 + 32);
    if (*(char *)(a1 + 55) < 0) {
      uint64_t v8 = (void *)*v8;
    }
    DSPGraph::strprintf(v10, (DSPGraph *)"Box::in inIndex out of range! box %s has %zu inputs but input %u was requested", v7, v8, (uint64_t)(*(void *)(a1 + 72) - *(void *)(a1 + 64)) >> 5, 0);
    DSPGraph::ThrowException();
    __break(1u);
LABEL_9:
    exceptiouint64_t n = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_1DCB4C7B0(exception, "numerical cast overflow: could not retain value in conversion type");
    __cxa_throw(exception, (struct type_info *)&unk_1F37F61E8, MEMORY[0x1E4FBA1E0]);
  }
  uint64_t result = v3
         * v2
         * v4
         / (*(void *)(a1 + 952)
          * **(double **)((*(uint64_t (**)(uint64_t))(*(void *)v5 + 40))(v5) + 120));
  if (result < 0) {
    goto LABEL_9;
  }
  return result;
}

void sub_1DCB67A10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (*(char *)(v23 - 33) < 0) {
    operator delete(*(void **)(v23 - 56));
  }
  _Unwind_Resume(exception_object);
}

void sub_1DCB67A6C(uint64_t a1)
{
  *(void *)a1 = &unk_1F37F6370;
  DSPGraph::RingBuffer::~RingBuffer((DSPGraph::RingBuffer *)(a1 + 888));
  *(void *)a1 = MEMORY[0x1E4F4EAF0] + 16;
  DSPGraph::RingBuffer::~RingBuffer((DSPGraph::RingBuffer *)(a1 + 808));

  DSPGraph::Box::~Box((DSPGraph::Box *)a1);
}

void sub_1DCB67AE8(uint64_t a1)
{
  *(void *)a1 = &unk_1F37F6370;
  DSPGraph::RingBuffer::~RingBuffer((DSPGraph::RingBuffer *)(a1 + 888));
  *(void *)a1 = MEMORY[0x1E4F4EAF0] + 16;
  DSPGraph::RingBuffer::~RingBuffer((DSPGraph::RingBuffer *)(a1 + 808));
  DSPGraph::Box::~Box((DSPGraph::Box *)a1);

  JUMPOUT(0x1E01A8C50);
}

const char *sub_1DCB67B78()
{
  return "context";
}

uint64_t sub_1DCB67B84(uint64_t result, int a2)
{
  *(_DWORD *)(result + 936) = a2;
  return result;
}

uint64_t sub_1DCB67B8C(uint64_t result, char a2)
{
  *(unsigned char *)(result + 980) = a2;
  return result;
}

uint64_t sub_1DCB67B94(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 980);
}

double sub_1DCB67B9C@<D0>(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 + 16) = 0;
  double result = *(double *)"xfuaxtncxoba";
  *(_OWORD *)a1 = *(_OWORD *)"xfuaxtncxoba";
  return result;
}

uint64_t sub_1DCB67BB8()
{
  return 0;
}

uint64_t sub_1DCB67BC0()
{
  return 0;
}

uint64_t sub_1DCB67C0C(uint64_t a1, void *a2)
{
  v50[8] = *MEMORY[0x1E4F143B8];
  id v19 = a2;
  self;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v2 = sub_1DCB607A4((uint64_t)v19);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v25 objects:v49 count:16];
  if (v3)
  {
    obunint64_t j = v2;
    uint64_t v22 = *(void *)v26;
LABEL_3:
    uint64_t v4 = 0;
    uint64_t v21 = v3;
    while (1)
    {
      if (*(void *)v26 != v22) {
        objc_enumerationMutation(obj);
      }
      id v5 = *(id *)(*((void *)&v25 + 1) + 8 * v4);
      uint64_t v23 = v5;
      self;
      uint64_t v6 = v5 ? *((void *)v5 + 1) : 0;
      (*(void (**)(long long *__return_ptr))(*(void *)v6 + 208))(&v29);
      self;
      long long v31 = v29;
      int v32 = v30;
      self;
      id v24 = (id)objc_msgSend(MEMORY[0x1E4F29238], "value:withObjCType:", &v31, "{AudioComponentDescription=IIIII}", v19);
      self;
      int v48 = 0;
      long long v47 = *(_OWORD *)"xfualmrcxoba";
      self;
      id v7 = (id)[MEMORY[0x1E4F29238] value:&v47 withObjCType:"{AudioComponentDescription=IIIII}"];
      v50[0] = v7;
      int v46 = 0;
      long long v45 = *(_OWORD *)"xfuaftmlxoba";
      self;
      id v8 = (id)[MEMORY[0x1E4F29238] value:&v45 withObjCType:"{AudioComponentDescription=IIIII}"];
      v50[1] = v8;
      int v44 = 0;
      long long v43 = *(_OWORD *)"xfuaxtncxoba";
      self;
      id v9 = (id)[MEMORY[0x1E4F29238] value:&v43 withObjCType:"{AudioComponentDescription=IIIII}"];
      v50[2] = v9;
      int v42 = 0;
      long long v41 = *(_OWORD *)"xfuapraexoba";
      self;
      id v10 = (id)[MEMORY[0x1E4F29238] value:&v41 withObjCType:"{AudioComponentDescription=IIIII}"];
      void v50[3] = v10;
      int v40 = 0;
      long long v39 = *(_OWORD *)"xfuadgisxoba";
      self;
      id v11 = (id)[MEMORY[0x1E4F29238] value:&v39 withObjCType:"{AudioComponentDescription=IIIII}"];
      v50[4] = v11;
      int v38 = 0;
      long long v37 = *(_OWORD *)"xfuapcxexoba";
      self;
      id v12 = (id)[MEMORY[0x1E4F29238] value:&v37 withObjCType:"{AudioComponentDescription=IIIII}"];
      v50[5] = v12;
      int v36 = 0;
      long long v35 = *(_OWORD *)"xfuapraexoba";
      self;
      id v13 = (id)[MEMORY[0x1E4F29238] value:&v35 withObjCType:"{AudioComponentDescription=IIIII}"];
      v50[6] = v13;
      int v34 = 0;
      long long v33 = *(_OWORD *)"xfuamzhsxoba";
      self;
      id v14 = (id)[MEMORY[0x1E4F29238] value:&v33 withObjCType:"{AudioComponentDescription=IIIII}"];
      v50[7] = v14;
      int v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:8];

      uint64_t v16 = [MEMORY[0x1E4F1CAD0] setWithArray:v15];

      LOBYTE(v14) = [v16 containsObject:v24];
      if (v14) {
        break;
      }
      if (v21 == ++v4)
      {
        uint64_t v3 = [obj countByEnumeratingWithState:&v25 objects:v49 count:16];
        if (!v3)
        {
          uint64_t v17 = 0;
          goto LABEL_15;
        }
        goto LABEL_3;
      }
    }
    uint64_t v17 = 1;
LABEL_15:
    uint64_t v2 = obj;
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

void sub_1DCB68070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

id sub_1DCB68148(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  self;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1DCB6823C;
  void v8[3] = &unk_1E6CA7B78;
  id v5 = v4;
  id v9 = v5;
  uint64_t v6 = sub_1DCB68388((uint64_t)SNDSPGraphUtilities, v8, a3);

  return v6;
}

void sub_1DCB6821C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB6823C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v2 = *(void *)(v1 + 8);
  }
  else {
    uint64_t v2 = 0;
  }
  uint64_t v3 = *(void *)(v2 + 64);
  if (*(void *)(v2 + 72) == v3)
  {
    sub_1DCB43D1C(v11, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(v10, "in");
    id v8 = (void *)(v2 + 32);
    if (*(char *)(v2 + 55) < 0) {
      id v8 = (void *)*v8;
    }
    DSPGraph::strprintf(v9, (DSPGraph *)"Box::in inIndex out of range! box %s has %zu inputs but input %u was requested", v7, v8, (uint64_t)(*(void *)(v2 + 72) - *(void *)(v2 + 64)) >> 5, 0);
    uint64_t result = DSPGraph::ThrowException();
    __break(1u);
  }
  else
  {
    id v4 = NSNumber;
    double v5 = *(double *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v3 + 40))(v3) + 56) + 8);
    return [v4 numberWithDouble:v5];
  }
  return result;
}

void sub_1DCB6833C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (*(char *)(v23 - 17) < 0) {
    operator delete(*(void **)(v23 - 40));
  }
  _Unwind_Resume(exception_object);
}

id sub_1DCB68388(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  double v5 = self;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = sub_1DCB6C1FC;
  id v13 = &unk_1E6CA7DF0;
  id v6 = v4;
  id v14 = v6;
  int v15 = v5;
  id v7 = _Block_copy(&v10);
  id v8 = objc_msgSend(v5, "actCatchingExceptions:error:", v7, a3, v10, v11, v12, v13);

  return v8;
}

void sub_1DCB68470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

id sub_1DCB68494(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v6 = a2;
  id v7 = a3;
  self;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = sub_1DCB685C0;
  void v12[3] = &unk_1E6CA7BA0;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  uint64_t v10 = sub_1DCB68388((uint64_t)SNDSPGraphUtilities, v12, a4);

  return v10;
}

void sub_1DCB68594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void *sub_1DCB685C0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = *(std::__shared_weak_count **)(v2 + 16);
    if (v3) {
      atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  sub_1DCB43D1C(&__p, (char *)[*(id *)(a1 + 40) UTF8String]);
  uint64_t v4 = DSPGraph::Graph::addInput();
  if (v14 < 0) {
    operator delete(__p);
  }
  if (v3) {
    sub_1DCB44254(v3);
  }
  double v5 = [SNDSPGraphBox alloc];
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    uint64_t v8 = *(void *)(v6 + 8);
    id v7 = *(std::__shared_weak_count **)(v6 + 16);
    uint64_t v11 = v8;
    id v12 = v7;
    if (v7) {
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    uint64_t v11 = 0;
    id v12 = 0;
  }
  id v9 = sub_1DCB59D60(v5, v4, &v11);
  if (v12) {
    sub_1DCB44254(v12);
  }

  return v9;
}

void sub_1DCB686C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a11) {
    sub_1DCB44254(a11);
  }
  _Unwind_Resume(exception_object);
}

id sub_1DCB686FC(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v6 = a2;
  id v7 = a3;
  self;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = sub_1DCB68828;
  void v12[3] = &unk_1E6CA7BA0;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  uint64_t v10 = sub_1DCB68388((uint64_t)SNDSPGraphUtilities, v12, a4);

  return v10;
}

void sub_1DCB687FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void *sub_1DCB68828(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = *(std::__shared_weak_count **)(v2 + 16);
    if (v3) {
      atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  sub_1DCB43D1C(&__p, (char *)[*(id *)(a1 + 40) UTF8String]);
  uint64_t v4 = DSPGraph::Graph::addOutput();
  if (v14 < 0) {
    operator delete(__p);
  }
  if (v3) {
    sub_1DCB44254(v3);
  }
  double v5 = [SNDSPGraphBox alloc];
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    uint64_t v8 = *(void *)(v6 + 8);
    id v7 = *(std::__shared_weak_count **)(v6 + 16);
    uint64_t v11 = v8;
    id v12 = v7;
    if (v7) {
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    uint64_t v11 = 0;
    id v12 = 0;
  }
  id v9 = sub_1DCB59D60(v5, v4, &v11);
  if (v12) {
    sub_1DCB44254(v12);
  }

  return v9;
}

void sub_1DCB68928(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a11) {
    sub_1DCB44254(a11);
  }
  _Unwind_Resume(exception_object);
}

id sub_1DCB68964(uint64_t a1, void *a2, void *a3, int a4, uint64_t a5)
{
  id v8 = a2;
  id v9 = a3;
  self;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  uint64_t v14[2] = sub_1DCB68A98;
  void v14[3] = &unk_1E6CA7BC8;
  int v17 = a4;
  id v10 = v8;
  id v15 = v10;
  id v11 = v9;
  id v16 = v11;
  id v12 = sub_1DCB68388((uint64_t)SNDSPGraphUtilities, v14, a5);

  return v12;
}

void sub_1DCB68A6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1DCB68A98()
{
}

void sub_1DCB68BDC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a11) {
    sub_1DCB44254(a11);
  }
  _Unwind_Resume(exception_object);
}

id sub_1DCB68C3C(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v8 = a2;
  id v9 = a3;
  self;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  uint64_t v14[2] = sub_1DCB68D70;
  void v14[3] = &unk_1E6CA7BF0;
  uint64_t v17 = a4;
  id v10 = v8;
  id v15 = v10;
  id v11 = v9;
  id v16 = v11;
  id v12 = sub_1DCB68388((uint64_t)SNDSPGraphUtilities, v14, a5);

  return v12;
}

void sub_1DCB68D44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1DCB68D70()
{
}

void sub_1DCB68EBC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a11) {
    sub_1DCB44254(a11);
  }
  _Unwind_Resume(exception_object);
}

id sub_1DCB68F1C(uint64_t a1, void *a2, void *a3, int a4, uint64_t a5)
{
  id v8 = a2;
  id v9 = a3;
  self;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  uint64_t v14[2] = sub_1DCB69050;
  void v14[3] = &unk_1E6CA7BC8;
  int v17 = a4;
  id v10 = v8;
  id v15 = v10;
  id v11 = v9;
  id v16 = v11;
  id v12 = sub_1DCB68388((uint64_t)SNDSPGraphUtilities, v14, a5);

  return v12;
}

void sub_1DCB69024(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1DCB69050()
{
}

void sub_1DCB69174(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a11) {
    sub_1DCB44254(a11);
  }
  _Unwind_Resume(exception_object);
}

id sub_1DCB691D4(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v6 = a2;
  id v7 = a3;
  self;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = sub_1DCB69300;
  void v12[3] = &unk_1E6CA7BA0;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  id v10 = sub_1DCB68388((uint64_t)SNDSPGraphUtilities, v12, a4);

  return v10;
}

void sub_1DCB692D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1DCB69300()
{
}

void sub_1DCB69448(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a11) {
    sub_1DCB44254(a11);
  }
  _Unwind_Resume(exception_object);
}

id sub_1DCB694A8(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  self;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1DCB6960C;
  uint64_t v16[3] = &unk_1E6CA7C18;
  id v11 = v10;
  id v17 = v11;
  id v12 = v8;
  id v18 = v12;
  id v13 = v9;
  id v19 = v13;
  id v14 = sub_1DCB68388((uint64_t)SNDSPGraphUtilities, v16, a5);

  return v14;
}

void sub_1DCB695D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1DCB6960C()
{
}

void sub_1DCB69730(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a11) {
    sub_1DCB44254(a11);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DCB69790(float a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6 = a3;
  self;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1DCB69880;
  void v10[3] = &unk_1E6CA7C40;
  id v7 = v6;
  id v11 = v7;
  float v12 = a1;
  uint64_t v8 = sub_1DCB69898((uint64_t)SNDSPGraphUtilities, v10, a4);

  return v8;
}

void sub_1DCB69860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB69880(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 82_Block_object_dispose(&STACK[0x220], 8) = *(_DWORD *)(a1 + 40);
  return 1;
}

uint64_t sub_1DCB69898(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  uint64_t v5 = self;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1DCB6C3E8;
  void v10[3] = &unk_1E6CA7E18;
  id v6 = v4;
  id v11 = v6;
  id v7 = sub_1DCB68388(v5, v10, a3);
  uint64_t v8 = [v7 BOOLValue];

  return v8;
}

void sub_1DCB69964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_1DCB69990(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  self;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1DCB69A84;
  void v8[3] = &unk_1E6CA7C68;
  id v5 = v4;
  id v9 = v5;
  id v6 = sub_1DCB68388((uint64_t)SNDSPGraphUtilities, v8, a3);

  return v6;
}

void sub_1DCB69A64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_1DCB69A84(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  id v13 = 0;
  id v14 = 0;
  uint64_t v15 = 0;
  sub_1DCB7407C(&v13, *(uint64_t ****)(v1 + 800), *(uint64_t ****)(v1 + 808), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v1 + 808) - *(void *)(v1 + 800)) >> 3));
  id v12 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v2 = v13;
  for (uint64_t i = v14; v2 != i; v2 += 3)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", i);
    [v12 addObject:v3];
    id v4 = *v2;
    id v5 = v2[1];
    while (v4 != v5)
    {
      id v6 = [MEMORY[0x1E4F1CA48] array];
      [v3 addObject:v6];
      id v7 = *v4;
      uint64_t v8 = v4[1];
      while (v7 != v8)
      {
        id v9 = [NSNumber numberWithInt:*v7];
        [v6 addObject:v9];

        v7 += 2;
      }

      v4 += 3;
    }
  }
  id v16 = &v13;
  sub_1DCB6CC00((void ***)&v16);

  return v12;
}

void sub_1DCB69BE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, void **a14)
{
  a14 = (void **)&a11;
  sub_1DCB6CC00(&a14);
  _Unwind_Resume(a1);
}

id sub_1DCB69C3C(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  self;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1DCB69D30;
  void v8[3] = &unk_1E6CA7C68;
  id v5 = v4;
  id v9 = v5;
  id v6 = sub_1DCB68388((uint64_t)SNDSPGraphUtilities, v8, a3);

  return v6;
}

void sub_1DCB69D10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_1DCB69D30(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  id v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  sub_1DCB7407C(&v13, *(uint64_t ****)(v1 + 800), *(uint64_t ****)(v1 + 808), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v1 + 808) - *(void *)(v1 + 800)) >> 3));
  id v12 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v2 = v13;
  for (uint64_t i = v14; v2 != (uint64_t **)i; v2 += 3)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", i);
    [v12 addObject:v3];
    id v4 = *v2;
    id v5 = v2[1];
    while (v4 != v5)
    {
      id v6 = [MEMORY[0x1E4F1CA48] array];
      [v3 addObject:v6];
      uint64_t v7 = *v4;
      uint64_t v8 = v4[1];
      while (v7 != v8)
      {
        id v9 = [NSNumber numberWithInt:*(unsigned int *)(v7 + 4)];
        [v6 addObject:v9];

        v7 += 8;
      }

      v4 += 3;
    }
  }
  id v16 = &v13;
  sub_1DCB6CC00((void ***)&v16);

  return v12;
}

void sub_1DCB69E90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, void **a14)
{
  a14 = (void **)&a11;
  sub_1DCB6CC00(&a14);
  _Unwind_Resume(a1);
}

id sub_1DCB69EE8(uint64_t a1, void *a2)
{
  id v2 = a2;
  self;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1DCB69FEC;
  void v8[3] = &unk_1E6CA7C90;
  id v3 = v2;
  id v9 = v3;
  id v7 = 0;
  id v4 = sub_1DCB68388((uint64_t)SNDSPGraphUtilities, v8, (uint64_t)&v7);
  id v5 = v7;

  return v4;
}

void sub_1DCB69FCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB69FEC(uint64_t a1)
{
  return MEMORY[0x1F4181798](*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 784), sel_getLatestSuperVector);
}

id sub_1DCB69FFC(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, long long *a6, uint64_t a7)
{
  id v10 = a2;
  id v11 = a3;
  self;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1DCB6A13C;
  uint64_t v16[3] = &unk_1E6CA7CB8;
  long long v19 = *a6;
  int v20 = *((_DWORD *)a6 + 4);
  id v12 = v10;
  id v17 = v12;
  id v13 = v11;
  id v18 = v13;
  uint64_t v14 = sub_1DCB68388((uint64_t)SNDSPGraphUtilities, v16, a7);

  return v14;
}

void sub_1DCB6A110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1DCB6A13C()
{
}

void sub_1DCB6A2A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a11) {
    sub_1DCB44254(a11);
  }
  _Unwind_Resume(exception_object);
}

id sub_1DCB6A308(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v6 = a2;
  id v7 = a3;
  self;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = sub_1DCB6A434;
  void v12[3] = &unk_1E6CA7BA0;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  id v10 = sub_1DCB68388((uint64_t)SNDSPGraphUtilities, v12, a4);

  return v10;
}

void sub_1DCB6A408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1DCB6A434()
{
}

void sub_1DCB6A5E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a11) {
    sub_1DCB44254(a11);
  }
  _Unwind_Resume(exception_object);
}

id sub_1DCB6A664(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v6 = a2;
  id v7 = a3;
  self;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = sub_1DCB6A790;
  void v12[3] = &unk_1E6CA7BA0;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  id v10 = sub_1DCB68388((uint64_t)SNDSPGraphUtilities, v12, a4);

  return v10;
}

void sub_1DCB6A764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1DCB6A790()
{
}

void sub_1DCB6A8E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a11) {
    sub_1DCB44254(a11);
  }
  _Unwind_Resume(exception_object);
}

id sub_1DCB6A948(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v6 = a2;
  id v7 = a3;
  self;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = sub_1DCB6AA74;
  void v12[3] = &unk_1E6CA7BA0;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  id v10 = sub_1DCB68388((uint64_t)SNDSPGraphUtilities, v12, a4);

  return v10;
}

void sub_1DCB6AA48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1DCB6AA74()
{
}

void sub_1DCB6AB94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a11) {
    sub_1DCB44254(a11);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DCB6ABF4(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v6 = a2;
  id v7 = a3;
  self;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = sub_1DCB6AD0C;
  void v12[3] = &unk_1E6CA7CE0;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  uint64_t v10 = sub_1DCB69898((uint64_t)SNDSPGraphUtilities, v12, a4);

  return v10;
}

void sub_1DCB6ACE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB6AD0C(uint64_t a1)
{
  return 1;
}

void sub_1DCB6AD58(float a1, uint64_t a2, void *a3, void *a4)
{
  a3;
  id v6 = a4;
  self;
  id v7 = [v6 format];
  uint64_t v8 = [v7 streamDescription];
  long long v9 = *(_OWORD *)v8;
  long long v10 = *(_OWORD *)(v8 + 16);
  uint64_t v27 = *(void *)(v8 + 32);
  long long v25 = v9;
  long long v26 = v10;

  LODWORD(v7) = [v6 frameLength];
  int v24 = (int)(float)((float)v7 - (float)(a1 * (float)[v6 frameLength]));
  int v23 = [v6 frameLength];
  id v11 = (_DWORD *)[v6 audioBufferList];
  v20[0] = v25;
  v20[1] = v26;
  uint64_t v21 = v27;
  std::string __p = sub_1DCB4B2C8((uint64_t)"", (uint64_t)v20);
  sub_1DCB4EED8((uint64_t)__p, 4 * [v6 frameLength]);
  if (*v11)
  {
    uint64_t v12 = 0;
    unint64_t v13 = 0;
    id v14 = __p;
    do
    {
      unsigned int v15 = v14[4];
      size_t v16 = v11[v12 + 3];
      if (v15) {
        BOOL v17 = v16 > v15;
      }
      else {
        BOOL v17 = 0;
      }
      if (v17) {
        __assert_rtn("CopyDataFrom", "CABufferList.h", 87, "mBufferCapacity == 0 || other.mBuffers[i].mDataByteSize <= mBufferCapacity");
      }
      id v18 = *(void **)&v14[v12 + 10];
      long long v19 = *(const void **)&v11[v12 + 4];
      v14[v12 + 9] = v16;
      memcpy(v18, v19, v16);
      ++v13;
      v12 += 4;
    }
    while (v13 < *v11);
  }
  operator new();
}

void sub_1DCB6B0FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p)
{
  id v18 = __p;
  std::string __p = 0;
  if (v18) {
    sub_1DCB4A8D8((int)&__p, v18);
  }

  _Unwind_Resume(a1);
}

id sub_1DCB6B170(double a1, uint64_t a2, void *a3, void *a4, char a5, int a6, uint64_t a7)
{
  id v12 = a3;
  id v13 = a4;
  self;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1DCB6B2BC;
  void v18[3] = &unk_1E6CA7D08;
  double v21 = a1;
  char v23 = a5;
  int v22 = a6;
  id v14 = v12;
  id v19 = v14;
  id v15 = v13;
  id v20 = v15;
  size_t v16 = sub_1DCB68388((uint64_t)SNDSPGraphUtilities, v18, a7);

  return v16;
}

void sub_1DCB6B290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1DCB6B2BC()
{
}

void sub_1DCB6B3E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a11) {
    sub_1DCB44254(a11);
  }
  _Unwind_Resume(exception_object);
}

id sub_1DCB6B448(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  self;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1DCB6B550;
  void v10[3] = &unk_1E6CA7D30;
  id v5 = v4;
  id v11 = v5;
  uint64_t v12 = a3;
  id v9 = 0;
  id v6 = sub_1DCB68388((uint64_t)SNDSPGraphUtilities, v10, (uint64_t)&v9);
  id v7 = v9;

  return v6;
}

void sub_1DCB6B530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

id sub_1DCB6B550(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v2 = *(void *)(v1 + 8);
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = sub_1DCB4E25C(v2, *(void *)(a1 + 40));
  sub_1DCB4EDA0(v2);

  return v3;
}

void sub_1DCB6B5B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1DCB6B5C0(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  self;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1DCB6B6B4;
  void v8[3] = &unk_1E6CA7D58;
  id v5 = v4;
  id v9 = v5;
  id v6 = sub_1DCB68388((uint64_t)SNDSPGraphUtilities, v8, a3);

  return v6;
}

void sub_1DCB6B694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_1DCB6B6B4(uint64_t a1)
{
  (*(void (**)(void))(**(void **)(*(void *)(a1 + 32) + 8) + 648))(*(void *)(*(void *)(a1 + 32)
  uint64_t v1 = + 8));
  uint64_t v2 = (void *)v1;
  if (v1) {
    id v3 = *(void **)(v1 + 32);
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

id sub_1DCB6B73C(uint64_t a1, uint64_t a2)
{
  self;

  return sub_1DCB68388((uint64_t)SNDSPGraphUtilities, &unk_1F37F85C0, a2);
}

id sub_1DCB6B784()
{
  sub_1DCB44A4C(&v5);
  uint64_t v0 = [SNDSPGraph alloc];
  uint64_t v3 = v5;
  id v4 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v1 = sub_1DCB5EB1C(v0, &v3);
  if (v4) {
    sub_1DCB44254(v4);
  }
  if (v6) {
    sub_1DCB44254(v6);
  }

  return v1;
}

void sub_1DCB6B810(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11, uint64_t a12, std::__shared_weak_count *a13)
{
  if (a11) {
    sub_1DCB44254(a11);
  }
  if (a13) {
    sub_1DCB44254(a13);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DCB6B83C(uint64_t a1, void *a2, void *a3, void *a4, int a5, int a6, long long *a7, uint64_t a8)
{
  id v14 = a2;
  id v15 = a3;
  id v16 = a4;
  self;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  long long v17 = a7[1];
  long long v27 = *a7;
  v23[2] = sub_1DCB6B9B8;
  v23[3] = &unk_1E6CA7DA0;
  long long v28 = v17;
  long long v29 = a7[2];
  id v18 = v14;
  id v24 = v18;
  id v19 = v15;
  id v25 = v19;
  id v20 = v16;
  id v26 = v20;
  int v30 = a5;
  int v31 = a6;
  uint64_t v21 = sub_1DCB69898((uint64_t)SNDSPGraphUtilities, v23, a8);

  return v21;
}

void sub_1DCB6B980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB6B9B8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = *(std::__shared_weak_count **)(v1 + 16);
    if (v2) {
      atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    uint64_t v2 = 0;
  }
  DSPGraph::Graph::connect();
  if (v2) {
    sub_1DCB44254(v2);
  }
  return 1;
}

void sub_1DCB6BA70(_Unwind_Exception *exception_object)
{
  if (v1) {
    sub_1DCB44254(v1);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DCB6BA88@<D0>(unsigned int a1@<W1>, int a2@<W2>, int a3@<W3>, uint64_t a4@<X8>)
{
  self;
  if (!a1 || !a2) {
    __assert_rtn("floatFormat", "SNDSPGraphUtils.mm", 44, "sampleRate > 0 && blockSize > 0");
  }
  *(void *)(a4 + 40) = 0;
  *(double *)a4 = (double)a1;
  *(_OWORD *)(a4 + _Block_object_dispose(&STACK[0x220], 8) = xmmword_1DCBE3F00;
  *(_DWORD *)(a4 + 24) = 4;
  *(_DWORD *)(a4 + 2_Block_object_dispose(&STACK[0x220], 8) = a3;
  *(void *)&double result = 32;
  *(void *)(a4 + 32) = 32;
  *(_DWORD *)(a4 + 40) = a2;
  return result;
}

double sub_1DCB6BB18@<D0>(unsigned int a1@<W1>, int a2@<W2>, uint64_t a3@<X8>)
{
  self;
  *(void *)(a3 + 40) = 0;
  *(double *)a3 = (double)a1;
  *(_OWORD *)(a3 + _Block_object_dispose(&STACK[0x220], 8) = xmmword_1DCBE4170;
  *(void *)&double result = 0x100000002;
  *(_OWORD *)(a3 + 24) = xmmword_1DCBE4180;
  *(_DWORD *)(a3 + 40) = a2;
  return result;
}

double sub_1DCB6BB74@<D0>(unsigned int a1@<W1>, int a2@<W2>, int a3@<W3>, int a4@<W4>, uint64_t a5@<X8>)
{
  self;
  if (!a4 || !a1 || !a2 || !a3) {
    __assert_rtn("floatFormatWithContext", "SNDSPGraphUtils.mm", 29, "sampleRate > 0 && blockSize > 0 && contextSize > 0 && channelCount > 0");
  }
  double result = (double)a1;
  *(double *)a5 = (double)a1;
  *(void *)(a5 + _Block_object_dispose(&STACK[0x220], 8) = 0x2170636D63;
  *(_DWORD *)(a5 + 16) = 4 * a3;
  *(_DWORD *)(a5 + 20) = a2;
  *(_DWORD *)(a5 + 24) = 0;
  *(_DWORD *)(a5 + 2_Block_object_dispose(&STACK[0x220], 8) = a4;
  *(void *)(a5 + 32) = 0;
  *(void *)(a5 + 40) = 0;
  *(_DWORD *)(a5 + 40) = a2;
  return result;
}

void sub_1DCB6BC0C()
{
  uint64_t v0 = (DSPGraph *)self;
  uint64_t v1 = DSPGraph::ABIVersion(v0);
  if (v1 != 4)
  {
    uint64_t v2 = v1;
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSNumber numberWithInt:v2];
    id v4 = [NSNumber numberWithInt:4];
    [v5 handleFailureInMethod:sel_assertDSPGraphABIVersionMatchesExpectation, v0, @"SNDSPGraphUtilities.mm", 710, @"DSPGraph ABI runtime/compile-time mismatch (Got: %@, Expected: %@)", v3, v4 object file lineNumber description];
  }
}

void sub_1DCB6BCEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB6BD18(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  self;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1DCB6BE04;
  void v10[3] = &unk_1E6CA7DC8;
  id v7 = v6;
  id v11 = v7;
  uint64_t v12 = a3;
  uint64_t v8 = sub_1DCB69898((uint64_t)SNDSPGraphUtilities, v10, a4);

  return v8;
}

void sub_1DCB6BDE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB6BE04(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = *(DSPGraph::Graph **)(v2 + 8);
    id v4 = *(std::__shared_weak_count **)(v2 + 16);
    if (v4) {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    uint64_t v3 = 0;
    id v4 = 0;
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5 != (int)v5)
  {
    exceptiouint64_t n = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "numerical cast overflow: could not retain value in conversion type");
    exception->__vftable = (std::runtime_error_vtbl *)(MEMORY[0x1E4FBA4E0] + 16);
    __cxa_throw(exception, (struct type_info *)&unk_1F37F61E8, MEMORY[0x1E4FBA1E0]);
  }
  sub_1DCB71E60(v3, v5);
  if (v4) {
    sub_1DCB44254(v4);
  }
  return 1;
}

void sub_1DCB6BECC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  if (v1) {
    sub_1DCB44254(v1);
  }
  _Unwind_Resume(a1);
}

void sub_1DCB6BF54(void *a1)
{
  __cxa_begin_catch(a1);
  +[SNError populateClientError:v1 withCode:2 underlyingError:0 message:@"caught exception"];
  __cxa_end_catch();
  JUMPOUT(0x1DCB6BF2CLL);
}

void sub_1DCB6BF84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCB6C1A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1DCB6C1FC(uint64_t a1)
{
  uint64_t v1 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return v1;
}

uint64_t sub_1DCB6C3E8(uint64_t a1)
{
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
    return MEMORY[0x1E4F1CC38];
  }
  else {
    return 0;
  }
}

id sub_1DCB6C41C(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  self;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1DCB6C510;
  void v8[3] = &unk_1E6CA7B78;
  id v5 = v4;
  id v9 = v5;
  id v6 = sub_1DCB68388((uint64_t)SNDSPGraphUtilities, v8, a3);

  return v6;
}

void sub_1DCB6C4F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB6C510(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v2 = *(void *)(v1 + 8);
  }
  else {
    uint64_t v2 = 0;
  }
  uint64_t v3 = *(void *)(v2 + 88);
  if (*(void *)(v2 + 96) == v3)
  {
    sub_1DCB43D1C(v11, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(v10, "out");
    uint64_t v8 = (void *)(v2 + 32);
    if (*(char *)(v2 + 55) < 0) {
      uint64_t v8 = (void *)*v8;
    }
    DSPGraph::strprintf(v9, (DSPGraph *)"Box::out inIndex out of range! box %s has %zu outputs but input %u was requested", v7, v8, (uint64_t)(*(void *)(v2 + 96) - *(void *)(v2 + 88)) >> 5, 0);
    uint64_t result = DSPGraph::ThrowException();
    __break(1u);
  }
  else
  {
    id v4 = NSNumber;
    double v5 = *(double *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v3 + 40))(v3) + 56) + 8);
    return [v4 numberWithDouble:v5];
  }
  return result;
}

void sub_1DCB6C610(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (*(char *)(v23 - 17) < 0) {
    operator delete(*(void **)(v23 - 40));
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DCB6C65C(uint64_t a1, void *a2, int a3, uint64_t a4, uint64_t a5)
{
  id v8 = a2;
  self;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = sub_1DCB6C754;
  void v12[3] = &unk_1E6CA7E40;
  uint64_t v14 = a4;
  id v9 = v8;
  id v13 = v9;
  int v15 = a3;
  uint64_t v10 = sub_1DCB69898((uint64_t)SNDSPGraphUtilities, v12, a5);

  return v10;
}

void sub_1DCB6C734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB6C754(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v2 = (void *)v2[1];
  }
  unint64_t v3 = *(unsigned int *)(a1 + 48);
  uint64_t v4 = v2[11];
  if (v3 >= (v2[12] - v4) >> 5)
  {
    id v11 = v2;
    uint64_t v14 = *(unsigned int *)(a1 + 48);
    sub_1DCB43D1C(v17, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(v16, "out");
    id v13 = v11 + 4;
    if (*((char *)v11 + 55) < 0) {
      id v13 = (void *)*v13;
    }
    DSPGraph::strprintf(v15, (DSPGraph *)"Box::out inIndex out of range! box %s has %zu outputs but input %u was requested", v12, v13, (uint64_t)(v11[12] - v11[11]) >> 5, v14);
    uint64_t result = DSPGraph::ThrowException();
    __break(1u);
  }
  else
  {
    uint64_t v5 = *(void *)((*(uint64_t (**)(unint64_t))(*(void *)(v4 + 32 * v3) + 40))(v4 + 32 * v3) + 56);
    id v6 = *(_OWORD **)(a1 + 40);
    long long v7 = *(_OWORD *)(v5 + 8);
    long long v8 = *(_OWORD *)(v5 + 24);
    long long v9 = *(_OWORD *)(v5 + 56);
    void v6[2] = *(_OWORD *)(v5 + 40);
    uint64_t v6[3] = v9;
    *id v6 = v7;
    v6[1] = v8;
    return 1;
  }
  return result;
}

void sub_1DCB6C86C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  if (a25 < 0) {
    operator delete(a20);
  }
  if (*(char *)(v25 - 17) < 0) {
    operator delete(*(void **)(v25 - 40));
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DCB6C8B8(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v6 = a2;
  id v7 = a3;
  self;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = sub_1DCB6C9D0;
  void v12[3] = &unk_1E6CA7E68;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  uint64_t v10 = sub_1DCB69898((uint64_t)SNDSPGraphUtilities, v12, a4);

  return v10;
}

void sub_1DCB6C9A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB6C9D0(uint64_t a1)
{
  v3[4] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = _Block_copy(*(const void **)(a1 + 40));
  v3[0] = &unk_1F37F8370;
  v3[1] = _Block_copy(v1);
  v3[3] = v3;

  DSPGraph::Box::addRenderCallback();
  sub_1DCB6CE90(v3);
  return 1;
}

void sub_1DCB6CAA4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1DCB6CE90((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1DCB6CAC4(DSPGraph::Box *a1)
{
  DSPGraph::Box::~Box(a1);

  JUMPOUT(0x1E01A8C50);
}

const char *sub_1DCB6CAFC()
{
  return "ExceptionBox";
}

double sub_1DCB6CB08@<D0>(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 + 16) = 0;
  double result = *(double *)"xfuapcxexoba";
  *(_OWORD *)a1 = *(_OWORD *)"xfuapcxexoba";
  return result;
}

uint64_t sub_1DCB6CB20(uint64_t result)
{
  if ((*(unsigned char *)(result + 772) & 2) != 0)
  {
    exceptiouint64_t n = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "ExceptionBox throws");
    __cxa_throw(exception, (struct type_info *)&unk_1F37F61D0, MEMORY[0x1E4FBA1D8]);
  }
  return result;
}

void sub_1DCB6CB7C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB6CB90(uint64_t result)
{
  if (*(unsigned char *)(result + 772))
  {
    exceptiouint64_t n = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "ExceptionBox Initialize");
    __cxa_throw(exception, (struct type_info *)&unk_1F37F61D0, MEMORY[0x1E4FBA1D8]);
  }
  return result;
}

void sub_1DCB6CBEC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_1DCB6CC00(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (void **)**a1;
  if (v2)
  {
    uint64_t v4 = (void **)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 3;
        id v6 = v4;
        sub_1DCB6CC74(&v6);
      }
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_1DCB6CC74(void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    sub_1DCB6CCC8((uint64_t *)v2);
    unint64_t v3 = **a1;
    operator delete(v3);
  }
}

void sub_1DCB6CCC8(uint64_t *a1)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  if (v2 != *a1)
  {
    uint64_t v4 = a1[1];
    do
    {
      id v6 = *(void **)(v4 - 24);
      v4 -= 24;
      uint64_t v5 = v6;
      if (v6)
      {
        *(void *)(v2 - 16) = v5;
        operator delete(v5);
      }
      uint64_t v2 = v4;
    }
    while (v4 != v3);
  }
  a1[1] = v3;
}

uint64_t sub_1DCB6CD20(uint64_t a1)
{
  return a1;
}

void sub_1DCB6CD4C(uint64_t a1)
{
  JUMPOUT(0x1E01A8C50);
}

void *sub_1DCB6CD98(uint64_t a1)
{
  uint64_t v2 = operator new(0x10uLL);
  *uint64_t v2 = &unk_1F37F8370;
  v2[1] = _Block_copy(*(const void **)(a1 + 8));
  return v2;
}

void *sub_1DCB6CDF0(uint64_t a1, void *a2)
{
  *a2 = &unk_1F37F8370;
  double result = _Block_copy(*(const void **)(a1 + 8));
  a2[1] = result;
  return result;
}

void sub_1DCB6CE38(uint64_t a1)
{
}

void sub_1DCB6CE40(id *a1)
{
  operator delete(a1);
}

uint64_t sub_1DCB6CE7C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

void *sub_1DCB6CE90(void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

id sub_1DCB6CF14()
{
  if (qword_1EAAAC468[0] != -1) {
    dispatch_once(qword_1EAAAC468, &unk_1F37F85E0);
  }
  uint64_t v0 = (void *)qword_1EAAAC460;

  return v0;
}

void sub_1DCB6CF68()
{
  if (+[SNUtils isRunningInDaemon]) {
    uint64_t v0 = "soundanalysisd";
  }
  else {
    uint64_t v0 = "";
  }
  os_log_t v1 = os_log_create("com.apple.SoundAnalysis", v0);
  uint64_t v2 = (void *)qword_1EAAAC460;
  qword_1EAAAC460 = (uint64_t)v1;
}

id sub_1DCB6CFC8(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  aBlock[5] = MEMORY[0x1E4F143A8];
  aBlock[6] = 3221225472;
  aBlock[7] = sub_1DCB6D0F8;
  aBlock[8] = &unk_1E6CA7EB0;
  id v13 = v4;
  id v14 = v5;
  id v6 = v5;
  id v7 = v4;
  uint64_t v8 = os_state_add_handler();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1DCB6D408;
  aBlock[3] = &unk_1E6CA7ED0;
  void aBlock[4] = v8;
  id v9 = _Block_copy(aBlock);
  uint64_t v10 = _Block_copy(v9);

  return v10;
}

char *sub_1DCB6D0F8(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (*(_DWORD *)(a2 + 16) == 3)
  {
    uint64_t v3 = sub_1DCB6CF14();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id v4 = *(void **)(a1 + 32);
      *(_DWORD *)std::string buf = 138412290;
      id v21 = v4;
      _os_log_impl(&dword_1DC873000, v3, OS_LOG_TYPE_DEBUG, "Collecting state information (title: %@)", buf, 0xCu);
    }

    uint64_t v5 = *(void *)(a1 + 40);
    v19[1] = 0;
    id v6 = (*(void (**)(void))(v5 + 16))();
    id v7 = 0;
    uint64_t v8 = v7;
    if (v6)
    {
      id v9 = *(void **)(a1 + 32);
      v19[0] = v7;
      id v10 = v9;
      id v11 = v6;
      uint64_t v12 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v11 format:200 options:0 error:v19];
      id v13 = v12;
      if (v12)
      {
        id v14 = (char *)malloc_type_calloc(1uLL, objc_msgSend(v12, "length", v19[0]) + 200, 0x8167000AuLL);
        if (v14)
        {
          strlcpy(v14 + 136, (const char *)[v10 UTF8String], 0x40uLL);
          *(_DWORD *)id v14 = 1;
          *((_DWORD *)v14 + 1) = [v13 length];
          id v15 = v13;
          memcpy(v14 + 200, (const void *)[v15 bytes], objc_msgSend(v15, "length"));
        }
        else
        {
          +[SNError populateClientError:v19 withCode:1 underlyingError:0 message:@"could not allocate enough memory for serialized state"];
        }
      }
      else
      {
        id v14 = 0;
      }

      id v17 = v19[0];
      if (v14)
      {
        uint64_t v8 = v17;
LABEL_19:

        return v14;
      }
      id v16 = sub_1DCB6CF14();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)std::string buf = 138412290;
        id v21 = v17;
        _os_log_impl(&dword_1DC873000, v16, OS_LOG_TYPE_ERROR, "Error preparing captured state! %@", buf, 0xCu);
      }
      uint64_t v8 = v17;
    }
    else
    {
      id v16 = sub_1DCB6CF14();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)std::string buf = 138412290;
        id v21 = v8;
        _os_log_impl(&dword_1DC873000, v16, OS_LOG_TYPE_ERROR, "Error capturing state! %@", buf, 0xCu);
      }
    }

    id v14 = 0;
    goto LABEL_19;
  }
  return 0;
}

void sub_1DCB6D3D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB6D408(uint64_t a1)
{
  return MEMORY[0x1F40CD578](*(void *)(a1 + 32));
}

uint64_t sub_1DCB6D410(AT::RingBuffer *a1, void *a2, void *a3)
{
  AT::RingBuffer::GetTimeBounds(v6, a1);
  uint64_t result = v6[0];
  if (v7)
  {
    *a2 = v6[0];
    *a3 = v6[1];
    std::system_category();
    return 0;
  }
  return result;
}

id sub_1DCB6D464(uint64_t *a1, int a2, void *a3)
{
  LODWORD(v4) = a2;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  sub_1DCB6D410((AT::RingBuffer *)a1, &v15, &v14);
  if (v14 < v15) {
    __assert_rtn("copyRecentFramesOfAudioRingBufferToAVAudioBuffer", "SNAudioRingBuffer.mm", 38, "sourceBufferStartTime <= sourceBufferEndTime");
  }
  if ((int)v14 - (int)v15 >= v4) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = (v14 - v15);
  }
  if (v4)
  {
    *a3 = v14 - v4;
    long long v6 = *((_OWORD *)a1 + 1);
    long long v11 = *(_OWORD *)a1;
    long long v12 = v6;
    uint64_t v13 = a1[4];
    char v7 = (void *)[objc_alloc(MEMORY[0x1E4F153A0]) initWithStreamDescription:&v11];
    id v8 = objc_alloc(MEMORY[0x1E4F153B0]);
    id v9 = objc_msgSend(v8, "initWithPCMFormat:frameCapacity:", v7, v4, v11, v12, v13);
    AT::RingBuffer::Fetch((AT::RingBuffer *)a1, (AudioBufferList *)[v9 mutableAudioBufferList]);
    [v9 setFrameLength:v4];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void sub_1DCB6D580(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCB6D59C(AT::RingBuffer *a1, AT::RingBuffer *a2)
{
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  sub_1DCB6D410(a1, &v9, &v8);
  if (v8 < v9) {
    __assert_rtn("copyRecentFrames", "SNAudioRingBuffer.mm", 57, "sourceBufferStartTime <= sourceBufferEndTime");
  }
  if (*((_DWORD *)a2 + 10) >= (v8 - v9)) {
    int v4 = v8 - v9;
  }
  else {
    int v4 = *((_DWORD *)a2 + 10);
  }
  uint64_t v7 = 0;
  sub_1DCB6D464((uint64_t *)a1, v4, &v7);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (const AudioBufferList *)[v6 audioBufferList];
  [v6 frameLength];
  AT::RingBuffer::Store(a2, v5);
}

void sub_1DCB6D664(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  _Unwind_Resume(a1);
}

void sub_1DCB6D7F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);

  _Block_object_dispose(va, 8);
  sub_1DCB6E2F4(v10, 0);

  _Unwind_Resume(a1);
}

uint64_t sub_1DCB6D834(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(a2 + 4_Block_object_dispose(&STACK[0x220], 8) = 0;
  *(void *)(result + 4_Block_object_dispose(&STACK[0x220], 8) = v2;
  return result;
}

AT::RingBuffer *sub_1DCB6D844(uint64_t a1)
{
  return sub_1DCB6E2F4((AT::RingBuffer **)(a1 + 48), 0);
}

void sub_1DCB6D850(uint64_t a1)
{
}

void sub_1DCB6D8C4(_Unwind_Exception *a1)
{
  MEMORY[0x1E01A8C50](v1, 0x1020C4047CAF6D5);
  _Unwind_Resume(a1);
}

id sub_1DCB6D978(uint64_t a1)
{
  uint64_t v1 = (void *)[objc_alloc(MEMORY[0x1E4F153A0]) initWithStreamDescription:*(void *)(*(void *)(a1 + 32) + 8)];

  return v1;
}

void sub_1DCB6DA7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB6DA94(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(_DWORD *)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  if (*(_DWORD *)(*(void *)(v1 + 8) + 40) != v2)
  {
    [v3 streamDescription];
    operator new();
  }

  return 1;
}

void sub_1DCB6DB4C(_Unwind_Exception *a1)
{
  AT::RingBuffer::~RingBuffer(v2);
  MEMORY[0x1E01A8C50]();

  _Unwind_Resume(a1);
}

uint64_t sub_1DCB6DC1C(uint64_t a1)
{
  return [NSNumber numberWithUnsignedInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

void sub_1DCB6DCF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1DCB6DD10(uint64_t a1)
{
  if (sub_1DCB6D410(*(AT::RingBuffer **)(*(void *)(a1 + 32) + 8), *(void **)(a1 + 40), *(void **)(a1 + 48)))uint64_t v1 = (void *)MEMORY[0x1E4F1CC28]; {
  else
  }
    uint64_t v1 = (void *)MEMORY[0x1E4F1CC38];

  return v1;
}

uint64_t sub_1DCB6DDE8(uint64_t a1)
{
  return 1;
}

uint64_t sub_1DCB6DEA0(uint64_t a1)
{
  return 1;
}

void sub_1DCB6DF88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

id sub_1DCB6DFA0(uint64_t a1)
{
  uint64_t v1 = *(uint64_t **)(a1 + 40);
  int v2 = *(uint64_t **)(*(void *)(a1 + 32) + 8);
  uint64_t v15 = 0;
  sub_1DCB6D410((AT::RingBuffer *)v2, v1, &v15);
  uint64_t v3 = *v1;
  int v4 = v15;
  if (v15 < *v1) {
    __assert_rtn("copyAudioRingBufferToAVAudioBuffer", "SNAudioRingBuffer.mm", 25, "outSourceBufferStartTime <= sourceBufferEndTime");
  }
  long long v5 = *(_OWORD *)v2;
  long long v6 = *((_OWORD *)v2 + 1);
  uint64_t v14 = v2[4];
  long long v12 = v5;
  long long v13 = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F153A0]) initWithStreamDescription:&v12];
  id v8 = objc_alloc(MEMORY[0x1E4F153B0]);
  uint64_t v9 = (v4 - v3);
  id v10 = objc_msgSend(v8, "initWithPCMFormat:frameCapacity:", v7, v9, v12, v13, v14);
  AT::RingBuffer::Fetch((AT::RingBuffer *)v2, (AudioBufferList *)[v10 mutableAudioBufferList]);
  [v10 setFrameLength:v9];

  return v10;
}

void sub_1DCB6E0A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCB6E18C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_1DCB6E1A4(uint64_t a1)
{
  return sub_1DCB6D464(*(uint64_t **)(*(void *)(a1 + 32) + 8), *(_DWORD *)(a1 + 40), *(void **)(a1 + 48));
}

void sub_1DCB6E294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB6E2B8(uint64_t a1)
{
  return 1;
}

AT::RingBuffer *sub_1DCB6E2F4(AT::RingBuffer **a1, AT::RingBuffer *a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    AT::RingBuffer::~RingBuffer(result);
    JUMPOUT(0x1E01A8C50);
  }
  return result;
}

void sub_1DCB6E480(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,long long buf,int *a23,long long a24,int a25,__int16 a26)
{
  if (a2)
  {
    if (a2 == 4)
    {
      long long v28 = (char *)__cxa_begin_catch(a1);
      int v29 = *((_DWORD *)v28 + 2);
      a17 = v29;
      int v30 = sub_1DCB6CF14();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        int v31 = v28 + 72;
        if (v28[95] < 0) {
          int v31 = (void *)*v31;
        }
        int v32 = v28 + 16;
        if (v28[39] < 0) {
          int v32 = (void *)*v32;
        }
        int v33 = *((_DWORD *)v28 + 10);
        LODWORD(buf) = 67110402;
        DWORD1(buf) = v29;
        WORD4(buf) = 1040;
        *(_DWORD *)((char *)&buf + 10) = 4;
        HIWORD(buf) = 2080;
        a23 = &a17;
        LOWORD(a24) = 2080;
        *(void *)((char *)&a24 + 2) = v31;
        WORD5(a24) = 2080;
        *(void *)(v26 + 36) = v32;
        a26 = 1024;
        *(_DWORD *)(v26 + 46) = v33;
        _os_log_impl(&dword_1DC873000, v30, OS_LOG_TYPE_ERROR, "Caught graph exception %d %4.4s %s in %s:%i", (uint8_t *)&buf, 0x32u);
      }
    }
    else if (a2 == 3)
    {
      int v34 = __cxa_begin_catch(a1);
      int v30 = sub_1DCB6CF14();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        uint64_t v35 = (*(uint64_t (**)(void *))(*(void *)v34 + 16))(v34);
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = v35;
        _os_log_impl(&dword_1DC873000, v30, OS_LOG_TYPE_ERROR, "std::exception caught: %s.", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      int v36 = (int *)__cxa_begin_catch(a1);
      if (a2 == 2)
      {
        int v37 = *v36;
        a17 = *v36;
        int v30 = sub_1DCB6CF14();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 67109634;
          DWORD1(buf) = v37;
          WORD4(buf) = 1040;
          *(_DWORD *)((char *)&buf + 10) = 4;
          HIWORD(buf) = 2080;
          a23 = &a17;
          _os_log_impl(&dword_1DC873000, v30, OS_LOG_TYPE_ERROR, "Caught OSStatus exception %d %4.4s", (uint8_t *)&buf, 0x18u);
        }
      }
      else
      {
        int v30 = sub_1DCB6CF14();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1DC873000, v30, OS_LOG_TYPE_ERROR, "Unknown exception caught!", (uint8_t *)&buf, 2u);
        }
      }
    }

    __cxa_end_catch();
    if (a21)
    {
      (*(void (**)(uint64_t))(*(void *)a21 + 48))(a21);
      JUMPOUT(0x1DCB6E41CLL);
    }
    sub_1DCB4C86C();
  }
  _Unwind_Resume(a1);
}

void sub_1DCB6E770()
{
  MEMORY[0x1E01A8800](v0);
  operator new();
}

void sub_1DCB6E83C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  MEMORY[0x1E01A8C50](v2, 0x10A1C4088BA2E40);
  sub_1DCB6E870((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB6E870(uint64_t a1)
{
  *(void *)a1 = MEMORY[0x1E4F4EAF8] + 16;
  uint64_t v2 = a1 + 8;
  int v4 = (void **)(a1 + 88);
  sub_1DCB6FDF0(&v4);
  sub_1DCB6FE7C(a1 + 48);
  sub_1DCB6FF60(v2);
  return a1;
}

id sub_1DCB6E8DC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  self;
  id v9 = objc_alloc_init((Class)objc_opt_class());
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1DCB6EA84;
  void v18[3] = &unk_1E6CA81A0;
  id v19 = v9;
  id v10 = v6;
  id v20 = v10;
  id v11 = v7;
  id v21 = v11;
  id v12 = v8;
  id v22 = v12;
  id v17 = 0;
  id v13 = v9;
  uint64_t v14 = sub_1DCB68388((uint64_t)SNDSPGraphUtilities, v18, (uint64_t)&v17);
  id v15 = v17;

  return v14;
}

void sub_1DCB6EA3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

id sub_1DCB6EA84(uint64_t a1)
{
  v13[4] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 48);
  uint64_t v3 = *(void **)(a1 + 56);
  id v4 = *(id *)(a1 + 40);
  id v5 = v2;
  id v6 = v3;
  if (v1)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1DCB6EC3C;
    uint64_t v9[3] = &unk_1E6CA81C8;
    void v9[4] = v1;
    id v10 = v4;
    id v11 = v5;
    id v12 = v6;
    v13[0] = &unk_1F37F7BD8;
    v13[1] = 0;
    void v13[3] = v13;
    id v7 = sub_1DCB620AC(v9);
    sub_1DCB625B4(v13);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void sub_1DCB6EBFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, void *a9, void *a10, ...)
{
  va_start(va, a10);
  sub_1DCB625B4((uint64_t *)va);

  _Unwind_Resume(a1);
}

id sub_1DCB6EC3C(id *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [a1[5] UTF8String];
  sub_1DCB6EEA4((uint64_t *)buf, (uint64_t)SNDSPGraphInterpreter, a1[6]);
  sub_1DCB6F538(&v5, (uint64_t)SNDSPGraphInterpreter, a1[7]);
  DSPGraph::Interpreter::compileFile();
  if (v6) {
    operator new();
  }
  uint64_t v6 = 0;
  id v7 = &v5;
  sub_1DCB6FFD0((void ***)&v7);
  sub_1DCB70174((uint64_t)buf);
  uint64_t v3 = sub_1DCB6CF14();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    id v4 = a1[5];
    *(_DWORD *)std::string buf = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_1DC873000, v3, OS_LOG_TYPE_ERROR, "Graph %@ couldn't be compiled", buf, 0xCu);
  }

  return 0;
}

void sub_1DCB6EE0C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  if (v17) {
    sub_1DCB44254(v17);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DCB6EEA4(uint64_t *a1, uint64_t a2, void *a3)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self;
  *(_OWORD *)a1 = 0u;
  *((_OWORD *)a1 + 1) = 0u;
  *((_DWORD *)a1 + _Block_object_dispose(&STACK[0x220], 8) = 1065353216;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v62 objects:v68 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v63;
    uint64_t v61 = a1 + 2;
    id v59 = v5;
    uint64_t v58 = *(void *)v63;
    do
    {
      uint64_t v8 = 0;
      uint64_t v60 = v6;
      do
      {
        if (*(void *)v63 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v62 + 1) + 8 * v8);
        uint64_t v10 = [v5 objectForKeyedSubscript:v9];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_97;
        }
        id v11 = (char *)[v9 UTF8String];
        id v12 = (char *)[v10 UTF8String];
        id v13 = operator new(0x40uLL);
        v66[0] = v13;
        v66[1] = a1 + 2;
        char v67 = 0;
        uint64_t v14 = (unsigned __int8 *)(v13 + 2);
        *id v13 = 0;
        v13[1] = 0;
        sub_1DCB43D1C(v13 + 2, v11);
        sub_1DCB43D1C(v13 + 5, v12);
        char v67 = 1;
        v13[1] = sub_1DCB7029C((uint64_t)(v13 + 2));
        unint64_t v15 = sub_1DCB7029C((uint64_t)(v13 + 2));
        v13[1] = v15;
        unint64_t v16 = a1[1];
        if (!v16) {
          goto LABEL_39;
        }
        unint64_t v17 = v15;
        uint8x8_t v18 = (uint8x8_t)vcnt_s8((int8x8_t)v16);
        v18.i16[0] = vaddlv_u8(v18);
        unint64_t v19 = v18.u32[0];
        if (v18.u32[0] > 1uLL)
        {
          unint64_t v20 = v15;
          if (v16 <= v15) {
            unint64_t v20 = v15 % v16;
          }
        }
        else
        {
          unint64_t v20 = (v16 - 1) & v15;
        }
        id v21 = *(uint64_t ***)(*a1 + 8 * v20);
        if (!v21 || (id v22 = *v21) == 0)
        {
LABEL_39:
          float v32 = (float)(unint64_t)(a1[3] + 1);
          float v33 = *((float *)a1 + 8);
          if (v16 && (float)(v33 * (float)v16) >= v32) {
            goto LABEL_82;
          }
          BOOL v34 = (v16 & (v16 - 1)) != 0;
          if (v16 < 3) {
            BOOL v34 = 1;
          }
          unint64_t v35 = v34 | (2 * v16);
          unint64_t v36 = vcvtps_u32_f32(v32 / v33);
          if (v35 <= v36) {
            int8x8_t prime = (int8x8_t)v36;
          }
          else {
            int8x8_t prime = (int8x8_t)v35;
          }
          if (*(void *)&prime == 1)
          {
            int8x8_t prime = (int8x8_t)2;
          }
          else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
          {
            int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
            unint64_t v16 = a1[1];
          }
          if (*(void *)&prime <= v16)
          {
            if (*(void *)&prime >= v16) {
              goto LABEL_82;
            }
            unint64_t v44 = vcvtps_u32_f32((float)(unint64_t)a1[3] / *((float *)a1 + 8));
            if (v16 < 3 || (uint8x8_t v45 = (uint8x8_t)vcnt_s8((int8x8_t)v16), v45.i16[0] = vaddlv_u8(v45), v45.u32[0] > 1uLL))
            {
              unint64_t v44 = std::__next_prime(v44);
            }
            else
            {
              uint64_t v46 = 1 << -(char)__clz(v44 - 1);
              if (v44 >= 2) {
                unint64_t v44 = v46;
              }
            }
            if (*(void *)&prime <= v44) {
              int8x8_t prime = (int8x8_t)v44;
            }
            if (*(void *)&prime >= v16)
            {
              unint64_t v16 = a1[1];
              goto LABEL_82;
            }
            if (!*(void *)&prime)
            {
              uint64_t v54 = (void *)*a1;
              *a1 = 0;
              if (v54) {
                operator delete(v54);
              }
              unint64_t v16 = 0;
              a1[1] = 0;
              goto LABEL_82;
            }
          }
          if (*(void *)&prime >> 61) {
            sub_1DCB49194();
          }
          int v38 = operator new(8 * *(void *)&prime);
          long long v39 = (void *)*a1;
          *a1 = (uint64_t)v38;
          if (v39) {
            operator delete(v39);
          }
          uint64_t v40 = 0;
          a1[1] = (uint64_t)prime;
          do
            *(void *)(*a1 + 8 * v40++) = 0;
          while (*(void *)&prime != v40);
          long long v41 = (void *)*v61;
          if (!*v61) {
            goto LABEL_81;
          }
          unint64_t v42 = v41[1];
          uint8x8_t v43 = (uint8x8_t)vcnt_s8(prime);
          v43.i16[0] = vaddlv_u8(v43);
          if (v43.u32[0] > 1uLL)
          {
            if (v42 >= *(void *)&prime) {
              v42 %= *(void *)&prime;
            }
          }
          else
          {
            v42 &= *(void *)&prime - 1;
          }
          *(void *)(*a1 + 8 * v42) = v61;
          long long v47 = (void *)*v41;
          if (!*v41)
          {
LABEL_81:
            unint64_t v16 = (unint64_t)prime;
            goto LABEL_82;
          }
          while (2)
          {
            unint64_t v48 = v47[1];
            if (v43.u32[0] > 1uLL)
            {
              if (v48 >= *(void *)&prime) {
                v48 %= *(void *)&prime;
              }
            }
            else
            {
              v48 &= *(void *)&prime - 1;
            }
            if (v48 == v42)
            {
LABEL_77:
              unint64_t v48 = v42;
            }
            else
            {
              if (*(void *)(*a1 + 8 * v48))
              {
                *long long v41 = *v47;
                *long long v47 = **(void **)(*a1 + 8 * v48);
                **(void **)(*a1 + 8 * v4_Block_object_dispose(&STACK[0x220], 8) = v47;
                long long v47 = v41;
                goto LABEL_77;
              }
              *(void *)(*a1 + 8 * v4_Block_object_dispose(&STACK[0x220], 8) = v41;
            }
            long long v41 = v47;
            long long v47 = (void *)*v47;
            unint64_t v42 = v48;
            if (!v47) {
              goto LABEL_81;
            }
            continue;
          }
        }
        unint64_t v23 = v16 - 1;
        char v24 = *((unsigned char *)v13 + 39);
        if (v24 >= 0) {
          uint64_t v25 = *((unsigned __int8 *)v13 + 39);
        }
        else {
          uint64_t v25 = v13[3];
        }
        if (v24 < 0) {
          uint64_t v14 = (unsigned __int8 *)v13[2];
        }
        while (1)
        {
          unint64_t v26 = v22[1];
          if (v26 == v17) {
            break;
          }
          if (v19 > 1)
          {
            if (v26 >= v16) {
              v26 %= v16;
            }
          }
          else
          {
            v26 &= v23;
          }
          if (v26 != v20) {
            goto LABEL_39;
          }
LABEL_35:
          id v22 = (uint64_t *)*v22;
          if (!v22) {
            goto LABEL_39;
          }
        }
        uint64_t v27 = *((unsigned __int8 *)v22 + 39);
        if ((v27 & 0x80u) == 0) {
          uint64_t v28 = *((unsigned __int8 *)v22 + 39);
        }
        else {
          uint64_t v28 = v22[3];
        }
        if (v28 != v25) {
          goto LABEL_35;
        }
        if ((v27 & 0x80) != 0)
        {
          unint64_t v56 = v23;
          float32x2_t v57 = v10;
          unint64_t v30 = v19;
          int v31 = memcmp((const void *)v22[2], v14, v22[3]);
          unint64_t v19 = v30;
          unint64_t v23 = v56;
          uint64_t v10 = v57;
          if (!v31) {
            goto LABEL_96;
          }
          goto LABEL_35;
        }
        if (*((unsigned char *)v22 + 39))
        {
          uint64_t v29 = 0;
          do
          {
            if (*((unsigned __int8 *)v22 + v29 + 16) != v14[v29]) {
              goto LABEL_35;
            }
            ++v29;
          }
          while (v27 != v29);
          if (!v22)
          {
LABEL_82:
            unint64_t v49 = v13[1];
            uint8x8_t v50 = (uint8x8_t)vcnt_s8((int8x8_t)v16);
            v50.i16[0] = vaddlv_u8(v50);
            if (v50.u32[0] > 1uLL)
            {
              if (v49 >= v16) {
                v49 %= v16;
              }
            }
            else
            {
              v49 &= v16 - 1;
            }
            uint64_t v51 = *a1;
            uint64_t v52 = *(void **)(*a1 + 8 * v49);
            if (v52)
            {
              *id v13 = *v52;
              goto LABEL_94;
            }
            *id v13 = *v61;
            void *v61 = v13;
            *(void *)(v51 + 8 * v49) = v61;
            if (*v13)
            {
              unint64_t v53 = *(void *)(*v13 + 8);
              if (v50.u32[0] > 1uLL)
              {
                if (v53 >= v16) {
                  v53 %= v16;
                }
              }
              else
              {
                v53 &= v16 - 1;
              }
              uint64_t v52 = (void *)(*a1 + 8 * v53);
LABEL_94:
              *uint64_t v52 = v13;
            }
            ++a1[3];
            v66[0] = 0;
          }
        }
LABEL_96:
        sub_1DCB706EC((uint64_t)v66);
        id v5 = v59;
        uint64_t v7 = v58;
        uint64_t v6 = v60;
LABEL_97:

        ++v8;
      }
      while (v8 != v6);
      uint64_t v55 = [v5 countByEnumeratingWithState:&v62 objects:v68 count:16];
      uint64_t v6 = v55;
    }
    while (v55);
  }
}

void sub_1DCB6F4B4(_Unwind_Exception *a1)
{
  sub_1DCB70174(v2);
  _Unwind_Resume(a1);
}

void sub_1DCB6F538(int64x2_t *a1, uint64_t a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self;
  a1->i64[0] = 0;
  a1->i64[1] = 0;
  a1[1].i64[0] = 0;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v10 = (char *)[v9 UTF8String];
          unint64_t v12 = a1->u64[1];
          unint64_t v11 = a1[1].u64[0];
          if (v12 >= v11)
          {
            unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v12 - a1->i64[0]) >> 3);
            unint64_t v15 = v14 + 1;
            if (v14 + 1 > 0xAAAAAAAAAAAAAAALL) {
              sub_1DCB7005C();
            }
            unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v11 - a1->i64[0]) >> 3);
            if (2 * v16 > v15) {
              unint64_t v15 = 2 * v16;
            }
            if (v16 >= 0x555555555555555) {
              unint64_t v17 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v17 = v15;
            }
            float v33 = a1 + 1;
            if (v17)
            {
              if (v17 > 0xAAAAAAAAAAAAAAALL) {
                sub_1DCB49194();
              }
              uint8x8_t v18 = (char *)operator new(24 * v17);
            }
            else
            {
              uint8x8_t v18 = 0;
            }
            unint64_t v30 = v18;
            v31.i64[0] = (uint64_t)&v18[24 * v14];
            v31.i64[1] = v31.i64[0];
            float v32 = &v18[24 * v17];
            sub_1DCB43D1C(v31.i64[0], v10);
            uint64_t v19 = a1->i64[0];
            unint64_t v20 = a1->u64[1];
            uint64_t v21 = v31.i64[1];
            uint64_t v22 = v31.i64[0];
            if (v20 == a1->i64[0])
            {
              int64x2_t v24 = vdupq_n_s64(v20);
            }
            else
            {
              do
              {
                long long v23 = *(_OWORD *)(v20 - 24);
                *(void *)(v22 - _Block_object_dispose(&STACK[0x220], 8) = *(void *)(v20 - 8);
                *(_OWORD *)(v22 - 24) = v23;
                v22 -= 24;
                *(void *)(v20 - 16) = 0;
                *(void *)(v20 - _Block_object_dispose(&STACK[0x220], 8) = 0;
                *(void *)(v20 - 24) = 0;
                v20 -= 24;
              }
              while (v20 != v19);
              int64x2_t v24 = *a1;
            }
            uint64_t v13 = v21 + 24;
            a1->i64[0] = v22;
            a1->i64[1] = v21 + 24;
            int64x2_t v31 = v24;
            uint64_t v25 = (char *)a1[1].i64[0];
            a1[1].i64[0] = (uint64_t)v32;
            float v32 = v25;
            unint64_t v30 = (char *)v24.i64[0];
            sub_1DCB70074((uint64_t)&v30);
          }
          else
          {
            sub_1DCB43D1C((void *)a1->i64[1], v10);
            uint64_t v13 = v12 + 24;
            a1->i64[1] = v12 + 24;
          }
          a1->i64[1] = v13;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v6);
  }
}

void sub_1DCB6F7D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);

  sub_1DCB6FFD0((void ***)va);
  _Unwind_Resume(a1);
}

id sub_1DCB6F82C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  self;
  id v9 = objc_alloc_init((Class)objc_opt_class());
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1DCB6F9D4;
  void v18[3] = &unk_1E6CA81A0;
  id v19 = v9;
  id v10 = v6;
  id v20 = v10;
  id v11 = v7;
  id v21 = v11;
  id v12 = v8;
  id v22 = v12;
  id v17 = 0;
  id v13 = v9;
  unint64_t v14 = sub_1DCB68388((uint64_t)SNDSPGraphUtilities, v18, (uint64_t)&v17);
  id v15 = v17;

  return v14;
}

void sub_1DCB6F98C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

id sub_1DCB6F9D4(uint64_t a1)
{
  v13[4] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 48);
  uint64_t v3 = *(void **)(a1 + 56);
  id v4 = *(id *)(a1 + 40);
  id v5 = v2;
  id v6 = v3;
  if (v1)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1DCB6FB8C;
    uint64_t v9[3] = &unk_1E6CA81C8;
    void v9[4] = v1;
    id v10 = v4;
    id v11 = v5;
    id v12 = v6;
    v13[0] = &unk_1F37F7BD8;
    v13[1] = 0;
    void v13[3] = v13;
    id v7 = sub_1DCB620AC(v9);
    sub_1DCB625B4(v13);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void sub_1DCB6FB4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, void *a9, void *a10, ...)
{
  va_start(va, a10);
  sub_1DCB625B4((uint64_t *)va);

  _Unwind_Resume(a1);
}

id sub_1DCB6FB8C(id *a1)
{
  [a1[5] UTF8String];
  sub_1DCB6EEA4(buf, (uint64_t)SNDSPGraphInterpreter, a1[6]);
  sub_1DCB6F538(&v4, (uint64_t)SNDSPGraphInterpreter, a1[7]);
  DSPGraph::Interpreter::compileText();
  if (v6) {
    operator new();
  }
  uint64_t v6 = 0;
  id v7 = &v4;
  sub_1DCB6FFD0((void ***)&v7);
  sub_1DCB70174((uint64_t)buf);
  uint64_t v3 = sub_1DCB6CF14();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1DC873000, v3, OS_LOG_TYPE_ERROR, "Graph couldn't be compiled from text", (uint8_t *)buf, 2u);
  }

  return 0;
}

void sub_1DCB6FD20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, char a15)
{
  if (v15) {
    sub_1DCB44254(v15);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DCB6FDF0(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (void **)**a1;
  if (v2)
  {
    int64x2_t v4 = (void **)v1[1];
    id v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        if (*((char *)v4 - 25) < 0) {
          operator delete(*(v4 - 6));
        }
        v4 -= 6;
      }
      while (v4 != v2);
      id v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t sub_1DCB6FE7C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)*v2;
      sub_1DCB6FEDC(v2 + 5);
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  int64x2_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void *sub_1DCB6FEDC(void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

uint64_t sub_1DCB6FF60(uint64_t a1)
{
  uint64_t v2 = *(char **)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v3 = *(char **)v2;
      sub_1DCB6FEDC((void *)v2 + 5);
      if (v2[39] < 0) {
        operator delete(*((void **)v2 + 2));
      }
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  int64x2_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void sub_1DCB6FFD0(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (void **)**a1;
  if (v2)
  {
    int64x2_t v4 = (void **)v1[1];
    id v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        if (*((char *)v4 - 1) < 0) {
          operator delete(*(v4 - 3));
        }
        v4 -= 3;
      }
      while (v4 != v2);
      id v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_1DCB7005C()
{
}

uint64_t sub_1DCB70074(uint64_t a1)
{
  uint64_t v3 = *(void ***)(a1 + 8);
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != v3)
  {
    do
    {
      int64x2_t v4 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v4);
        int64x2_t v4 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v4;
    }
    while (v4 != v3);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_1DCB700DC()
{
}

unsigned char *sub_1DCB700F0(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  *(void *)uint64_t result = &unk_1F37F7C20;
  result[8] = *(unsigned char *)(a1 + 8);
  return result;
}

uint64_t sub_1DCB7013C(uint64_t result, uint64_t a2)
{
  *(void *)a2 = &unk_1F37F7C20;
  *(unsigned char *)(a2 + _Block_object_dispose(&STACK[0x220], 8) = *(unsigned char *)(result + 8);
  return result;
}

uint64_t sub_1DCB7016C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_1DCB70174(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)*v2;
      sub_1DCB701D4((uint64_t)(v2 + 2));
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  int64x2_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void sub_1DCB701D4(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v2 = *(void **)a1;
    operator delete(v2);
  }
}

void sub_1DCB70230(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1E01A8C50);
}

uint64_t sub_1DCB70268(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

unint64_t sub_1DCB7029C(uint64_t a1)
{
  int v1 = *(char *)(a1 + 23);
  unint64_t v2 = *(void *)(a1 + 8);
  BOOL v3 = v1 < 0;
  if (v1 >= 0) {
    int64x2_t v4 = (uint64_t *)a1;
  }
  else {
    int64x2_t v4 = *(uint64_t **)a1;
  }
  if (!v3) {
    unint64_t v2 = *(unsigned __int8 *)(a1 + 23);
  }
  if (v2 > 0x20)
  {
    if (v2 > 0x40)
    {
      unint64_t v34 = 0x9DDFEA08EB382D69;
      uint64_t v44 = *(uint64_t *)((char *)v4 + v2 - 48);
      uint64_t v43 = *(uint64_t *)((char *)v4 + v2 - 40);
      uint64_t v45 = *(uint64_t *)((char *)v4 + v2 - 24);
      uint64_t v47 = *(uint64_t *)((char *)v4 + v2 - 64);
      uint64_t v46 = *(uint64_t *)((char *)v4 + v2 - 56);
      uint64_t v48 = *(uint64_t *)((char *)v4 + v2 - 16);
      uint64_t v49 = *(uint64_t *)((char *)v4 + v2 - 8);
      unint64_t v50 = v46 + v48;
      unint64_t v51 = 0x9DDFEA08EB382D69
          * (v45 ^ ((0x9DDFEA08EB382D69 * (v45 ^ (v44 + v2))) >> 47) ^ (0x9DDFEA08EB382D69 * (v45 ^ (v44 + v2))));
      unint64_t v52 = 0x9DDFEA08EB382D69 * (v51 ^ (v51 >> 47));
      unint64_t v53 = v44 + v46 + v47 + v2;
      uint64_t v54 = v53 + v43;
      unint64_t v55 = __ROR8__(v53, 44) + v47 + v2 + __ROR8__(v47 + v2 + v43 - 0x622015F714C7D297 * (v51 ^ (v51 >> 47)), 21);
      uint64_t v56 = v46 + v48 + *(uint64_t *)((char *)v4 + v2 - 32) - 0x4B6D499041670D8DLL;
      uint64_t v57 = v45 + v48 + v56;
      uint64_t v58 = __ROR8__(v57, 44);
      uint64_t v59 = v57 + v49;
      uint64_t v60 = v58 + v56 + __ROR8__(v56 + v43 + v49, 21);
      uint64_t v62 = *v4;
      uint64_t v61 = v4 + 4;
      unint64_t v63 = v62 - 0x4B6D499041670D8DLL * v43;
      uint64_t v64 = -(uint64_t)((v2 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        uint64_t v65 = *(v61 - 3);
        uint64_t v66 = v63 + v54 + v50 + v65;
        uint64_t v67 = v61[2];
        uint64_t v68 = v61[3];
        uint64_t v69 = v61[1];
        unint64_t v50 = v69 + v54 - 0x4B6D499041670D8DLL * __ROR8__(v50 + v55 + v67, 42);
        uint64_t v70 = v52 + v59;
        uint64_t v71 = *(v61 - 2);
        uint64_t v72 = *(v61 - 1);
        uint64_t v73 = *(v61 - 4) - 0x4B6D499041670D8DLL * v55;
        uint64_t v74 = v73 + v59 + v72;
        uint64_t v75 = v73 + v65 + v71;
        uint64_t v54 = v75 + v72;
        uint64_t v76 = __ROR8__(v75, 44) + v73;
        unint64_t v77 = (0xB492B66FBE98F273 * __ROR8__(v66, 37)) ^ v60;
        unint64_t v63 = 0xB492B66FBE98F273 * __ROR8__(v70, 33);
        unint64_t v55 = v76 + __ROR8__(v74 + v77, 21);
        unint64_t v78 = v63 + v60 + *v61;
        uint64_t v59 = v69 + v67 + v78 + v68;
        uint64_t v60 = __ROR8__(v69 + v67 + v78, 44) + v78 + __ROR8__(v50 + v71 + v78 + v68, 21);
        v61 += 8;
        unint64_t v52 = v77;
        v64 += 64;
      }
      while (v64);
      unint64_t v79 = 0x9DDFEA08EB382D69
          * (v59 ^ ((0x9DDFEA08EB382D69 * (v59 ^ v54)) >> 47) ^ (0x9DDFEA08EB382D69 * (v59 ^ v54)));
      unint64_t v80 = v63
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v60 ^ ((0x9DDFEA08EB382D69 * (v60 ^ v55)) >> 47) ^ (0x9DDFEA08EB382D69 * (v60 ^ v55)))) ^ ((0x9DDFEA08EB382D69 * (v60 ^ ((0x9DDFEA08EB382D69 * (v60 ^ v55)) >> 47) ^ (0x9DDFEA08EB382D69 * (v60 ^ v55)))) >> 47));
      unint64_t v81 = 0x9DDFEA08EB382D69
          * (v80 ^ (v77 - 0x4B6D499041670D8DLL * (v50 ^ (v50 >> 47)) - 0x622015F714C7D297 * (v79 ^ (v79 >> 47))));
      unint64_t v35 = 0x9DDFEA08EB382D69 * (v80 ^ (v81 >> 47) ^ v81);
    }
    else
    {
      id v9 = (char *)v4 + v2;
      uint64_t v10 = *(uint64_t *)((char *)v4 + v2 - 16);
      uint64_t v11 = *(uint64_t *)((char *)v4 + v2 - 8);
      uint64_t v12 = v4[1];
      uint64_t v13 = *v4 - 0x3C5A37A36834CED9 * (v10 + v2);
      unint64_t v16 = v4 + 2;
      uint64_t v14 = v4[2];
      uint64_t v15 = v16[1];
      uint64_t v17 = __ROR8__(v13 + v15, 52);
      uint64_t v18 = __ROR8__(v13, 37);
      uint64_t v19 = v13 + v12;
      uint64_t v20 = __ROR8__(v19, 7);
      uint64_t v21 = v19 + v14;
      uint64_t v22 = v20 + v18;
      uint64_t v23 = *((void *)v9 - 4) + v14;
      uint64_t v24 = v11 + v15;
      uint64_t v25 = __ROR8__(v24 + v23, 52);
      uint64_t v26 = v22 + v17;
      uint64_t v27 = __ROR8__(v23, 37);
      uint64_t v28 = *((void *)v9 - 3) + v23;
      uint64_t v29 = __ROR8__(v28, 7);
      uint64_t v30 = v26 + __ROR8__(v21, 31);
      uint64_t v31 = v28 + v10;
      uint64_t v32 = v31 + v24;
      uint64_t v33 = v21 + v15 + v27 + v29 + v25 + __ROR8__(v31, 31);
      unint64_t v34 = 0x9AE16A3B2F90404FLL;
      unint64_t v35 = v30
          - 0x3C5A37A36834CED9
          * ((0xC3A5C85C97CB3127 * (v32 + v30) - 0x651E95C4D06FBFB1 * v33) ^ ((0xC3A5C85C97CB3127 * (v32 + v30)
                                                                                 - 0x651E95C4D06FBFB1 * v33) >> 47));
    }
    return (v35 ^ (v35 >> 47)) * v34;
  }
  else
  {
    if (v2 > 0x10)
    {
      uint64_t v36 = v4[1];
      unint64_t v37 = 0xB492B66FBE98F273 * *v4;
      unint64_t v38 = 0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)v4 + v2 - 8);
      uint64_t v39 = __ROR8__(v38, 30) + __ROR8__(v37 - v36, 43);
      unint64_t v40 = v37 + v2 + __ROR8__(v36 ^ 0xC949D7C7509E6557, 20) - v38;
      unint64_t v41 = 0x9DDFEA08EB382D69 * ((v39 - 0x3C5A37A36834CED9 * *(uint64_t *)((char *)v4 + v2 - 16)) ^ v40);
      unint64_t v42 = v40 ^ (v41 >> 47) ^ v41;
      return 0x9DDFEA08EB382D69 * ((0x9DDFEA08EB382D69 * v42) ^ ((0x9DDFEA08EB382D69 * v42) >> 47));
    }
    if (v2 >= 9)
    {
      uint64_t v5 = *v4;
      uint64_t v6 = *(uint64_t *)((char *)v4 + v2 - 8);
      uint64_t v7 = __ROR8__(v6 + v2, v2);
      return (0x9DDFEA08EB382D69
            * ((0x9DDFEA08EB382D69
              * (v7 ^ ((0x9DDFEA08EB382D69 * (v7 ^ v5)) >> 47) ^ (0x9DDFEA08EB382D69 * (v7 ^ v5)))) ^ ((0x9DDFEA08EB382D69 * (v7 ^ ((0x9DDFEA08EB382D69 * (v7 ^ v5)) >> 47) ^ (0x9DDFEA08EB382D69 * (v7 ^ v5)))) >> 47))) ^ v6;
    }
    if (v2 >= 4)
    {
      int v82 = *(_DWORD *)v4;
      uint64_t v83 = *(unsigned int *)((char *)v4 + v2 - 4);
      unint64_t v84 = 0x9DDFEA08EB382D69 * ((v2 + (8 * v82)) ^ v83);
      unint64_t v42 = v83 ^ (v84 >> 47) ^ v84;
      return 0x9DDFEA08EB382D69 * ((0x9DDFEA08EB382D69 * v42) ^ ((0x9DDFEA08EB382D69 * v42) >> 47));
    }
    unint64_t result = 0x9AE16A3B2F90404FLL;
    if (v2)
    {
      unint64_t v85 = (0xC949D7C7509E6557 * (v2 + 4 * *((unsigned __int8 *)v4 + v2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                     * (*(unsigned __int8 *)v4 | ((unint64_t)*((unsigned __int8 *)v4 + (v2 >> 1)) << 8)));
      return 0x9AE16A3B2F90404FLL * (v85 ^ (v85 >> 47));
    }
  }
  return result;
}

void sub_1DCB706EC(uint64_t a1)
{
  int v1 = *(void **)a1;
  *(void *)a1 = 0;
  if (v1)
  {
    if (*(unsigned char *)(a1 + 16)) {
      sub_1DCB701D4((uint64_t)v1 + 16);
    }
    operator delete(v1);
  }
}

void sub_1DCB712E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,std::__shared_weak_count *a22)
{
  _Block_object_dispose(&a15, 8);
  if (a22) {
    sub_1DCB44254(a22);
  }

  _Unwind_Resume(a1);
}

__n128 sub_1DCB7130C(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[3] = result;
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  return result;
}

void sub_1DCB7131C(uint64_t a1)
{
  int v1 = *(std::__shared_weak_count **)(a1 + 56);
  if (v1) {
    sub_1DCB44254(v1);
  }
}

uint64_t sub_1DCB7132C(uint64_t a1)
{
  unint64_t v2 = operator new(0x148uLL);
  v2[1] = 0;
  v2[2] = 0;
  *unint64_t v2 = &unk_1F37F83E0;
  sub_1DCB452E8((uint64_t)(v2 + 3));
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  int64x2_t v4 = *(std::__shared_weak_count **)(v3 + 56);
  *(void *)(v3 + 4_Block_object_dispose(&STACK[0x220], 8) = v2 + 3;
  *(void *)(v3 + 56) = v2;
  if (v4) {
    sub_1DCB44254(v4);
  }
  return 1;
}

void sub_1DCB71480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB71498(uint64_t a1)
{
  *(void *)&v3[9] = objc_msgSend(*(id *)(a1 + 32), "audioBufferList", objc_msgSend(*(id *)(a1 + 32), "frameLength"), (double)*(uint64_t *)(a1 + 48), 0, 0, 0, 0, 0, 0, 1);
  sub_1DCB456E8(*(void *)(*(void *)(a1 + 40) + 8), v3);
  return 1;
}

uint64_t sub_1DCB715A0(uint64_t a1)
{
  return [NSNumber numberWithUnsignedInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 256)];
}

void sub_1DCB71670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB71688(uint64_t a1)
{
  int v1 = *(uint64_t **)(*(void *)(a1 + 32) + 8);
  sub_1DCB43D1C(__p, (char *)[*(id *)(a1 + 40) UTF8String]);
  sub_1DCB483A8(v1, (const void **)__p);
  if (v4 < 0) {
    operator delete(__p[0]);
  }
  return 1;
}

void sub_1DCB716E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DCB717B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB717D0(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v19[0] = (uint64_t)v19;
  v19[1] = (uint64_t)v19;
  uint64_t v20 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * i) processingContext];
        uint64_t v6 = (void *)v13[3];
        uint64_t v7 = operator new(0x30uLL);
        *uint64_t v7 = 0;
        v7[1] = 0;
        v7[2] = *v6;
        uint64_t v8 = v6[1];
        void v7[3] = v8;
        if (v8) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
        }
        v7[4] = v6[2];
        uint64_t v9 = v6[3];
        void v7[5] = v9;
        if (v9) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
        }
        uint64_t v10 = v19[0];
        *uint64_t v7 = v19[0];
        v7[1] = v19;
        *(void *)(v10 + _Block_object_dispose(&STACK[0x220], 8) = v7;
        v19[0] = (uint64_t)v7;
        ++v20;
        if (v14) {
          sub_1DCB44254(v14);
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v3);
  }

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  sub_1DCB4C9F4(v13, (uint64_t)v19);
  sub_1DCB47160(v11, (uint64_t)v13);
  sub_1DCB48F64(v13);
  sub_1DCB48F64(v19);
  return 1;
}

void sub_1DCB7198C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, void);
  uint64_t v5 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  sub_1DCB48F64((uint64_t *)va);
  sub_1DCB48F64((uint64_t *)va1);
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB71A74(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 80);
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v3 = *(_OWORD *)(a1 + 56);
  v5[0] = *(_OWORD *)(a1 + 40);
  v5[1] = v3;
  uint64_t v6 = *(void *)(a1 + 72);
  int v7 = v1;
  sub_1DCB4537C(v2, (uint64_t)v5);
  return 1;
}

void sub_1DCB71B94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB71BAC(void *a1)
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void **)(a1[4] + 8);
  if (v3) {
    uint64_t v5 = *(DSPGraph::Box **)(v3 + 8);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = sub_1DCB47CF4(v4, a1[6], v5);

  return [v2 numberWithLongLong:v6];
}

id sub_1DCB71C9C(uint64_t a1)
{
  int v1 = [NSNumber numberWithDouble:*(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 208)];

  return v1;
}

void sub_1DCB71CF8(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F37F83E0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1DCB71D18(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F37F83E0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1E01A8C50);
}

void sub_1DCB71D6C(uint64_t *a1)
{
  uint64_t v2 = a1 + 36;
  uint64_t v3 = (void *)a1[39];
  if (v3 == v2)
  {
    (*(void (**)(void *))(*v2 + 32))(v2);
  }
  else if (v3)
  {
    (*(void (**)(void *))(*v3 + 40))(v3);
  }
  a1[17] = (uint64_t)&unk_1F37F6290;
  sub_1DCB44990(a1 + 19);
  sub_1DCB48DA8(a1 + 14);
  sub_1DCB48E3C(a1 + 11);
  sub_1DCB48ED0(a1 + 8);
  sub_1DCB48F64(a1 + 5);
  uint64_t v4 = (std::__shared_weak_count *)a1[4];
  if (v4)
  {
    sub_1DCB44254(v4);
  }
}

void sub_1DCB71E60(DSPGraph::Graph *a1, int a2)
{
  if (a2 >= 1)
  {
    int v2 = a2;
    while (1)
    {
      int v4 = *((_DWORD *)a1 + 172);
      uint64_t v5 = v4 >= v2 ? v2 : v4;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v31 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      uint64_t v40 = 1;
      unint64_t v41 = 0;
      v30[1] = 0;
      v30[2] = 0;
      uint64_t v34 = 1;
      unint64_t v35 = 0;
      sub_1DCB72394(v5);
      uint64_t v6 = DSPGraph::Graph::in(a1);
      uint64_t v7 = *(void *)(v6 + 88);
      if (*(void *)(v6 + 96) == v7) {
        break;
      }
      (*(void (**)(uint64_t))(*(void *)v7 + 40))(v7);
      DSPGraph::Graph::preflight();
      if (DSPGraph::Graph::numInputs(a1))
      {
        uint64_t v8 = DSPGraph::Graph::in(a1);
        uint64_t v9 = *(void *)(v8 + 88);
        if (*(void *)(v8 + 96) == v9)
        {
          sub_1DCB43D1C(v47, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
          sub_1DCB43D1C(v46, "out");
          uint64_t v26 = (void *)(v8 + 32);
          if (*(char *)(v8 + 55) < 0) {
            uint64_t v26 = (void *)*v26;
          }
          DSPGraph::strprintf(v45, (DSPGraph *)"Box::out inIndex out of range! box %s has %zu outputs but input %u was requested", v25, v26, (uint64_t)(*(void *)(v8 + 96) - *(void *)(v8 + 88)) >> 5, 0);
          DSPGraph::ThrowException();
          goto LABEL_33;
        }
        uint64_t v10 = *(long long **)((*(uint64_t (**)(uint64_t))(*(void *)v9 + 40))(v9) + 120);
        uint64_t v11 = *((void *)v10 + 4);
        long long v12 = v10[1];
        long long v42 = *v10;
        long long v43 = v12;
        uint64_t v44 = v11;
        uint64_t v13 = sub_1DCB4B2C8((uint64_t)"", (uint64_t)&v42);
        v30[0] = v13;
        sub_1DCB72394(v5);
        sub_1DCB4EED8((uint64_t)v13, DWORD2(v43) * v5);
        if (v30[0]) {
          unint64_t v41 = (char *)v30[0] + 24;
        }
      }
      else
      {
        v30[0] = 0;
      }
      if (DSPGraph::Graph::numOutputs(a1))
      {
        uint64_t v14 = DSPGraph::Graph::out(a1);
        uint64_t v15 = *(void *)(v14 + 64);
        if (*(void *)(v14 + 72) == v15)
        {
          sub_1DCB43D1C(v47, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
          sub_1DCB43D1C(v46, "in");
          uint64_t v28 = (void *)(v14 + 32);
          if (*(char *)(v14 + 55) < 0) {
            uint64_t v28 = (void *)*v28;
          }
          DSPGraph::strprintf(v45, (DSPGraph *)"Box::in inIndex out of range! box %s has %zu inputs but input %u was requested", v27, v28, (uint64_t)(*(void *)(v14 + 72) - *(void *)(v14 + 64)) >> 5, 0);
          DSPGraph::ThrowException();
          goto LABEL_33;
        }
        uint64_t v16 = *(long long **)((*(uint64_t (**)(uint64_t))(*(void *)v15 + 40))(v15) + 120);
        uint64_t v17 = *((void *)v16 + 4);
        long long v18 = v16[1];
        long long v42 = *v16;
        long long v43 = v18;
        uint64_t v44 = v17;
        uint64_t v19 = sub_1DCB4B2C8((uint64_t)"", (uint64_t)&v42);
        std::string __p = v19;
        sub_1DCB72394(v5);
        sub_1DCB4EED8((uint64_t)v19, DWORD2(v43) * v5);
        if (__p) {
          unint64_t v35 = (char *)__p + 24;
        }
      }
      else
      {
        std::string __p = 0;
      }
      DSPGraph::Graph::processMultiple();
      uint64_t v20 = __p;
      std::string __p = 0;
      if (v20) {
        sub_1DCB4A8D8((int)&__p, v20);
      }
      uint64_t v21 = v30[0];
      v30[0] = 0;
      if (v21) {
        sub_1DCB4A8D8((int)v30, v21);
      }
      BOOL v22 = __OFSUB__(v2, v5);
      v2 -= v5;
      if ((v2 < 0) ^ v22 | (v2 == 0)) {
        return;
      }
    }
    sub_1DCB43D1C(&v42, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(v47, "out");
    uint64_t v24 = (void *)(v6 + 32);
    if (*(char *)(v6 + 55) < 0) {
      uint64_t v24 = (void *)*v24;
    }
    DSPGraph::strprintf(v46, (DSPGraph *)"Box::out inIndex out of range! box %s has %zu outputs but input %u was requested", v23, v24, (uint64_t)(*(void *)(v6 + 96) - *(void *)(v6 + 88)) >> 5, 0);
    DSPGraph::ThrowException();
LABEL_33:
    __break(1u);
  }
}

void sub_1DCB72250(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p)
{
  if (*(char *)(v14 - 129) < 0) {
    operator delete(*(void **)(v14 - 152));
  }
  if (*(char *)(v14 - 105) < 0) {
    operator delete(*(void **)(v14 - 128));
  }
  if (*(char *)(v14 - 81) < 0) {
    operator delete(*(void **)(v14 - 104));
  }
  uint64_t v16 = __p;
  std::string __p = 0;
  if (v16) {
    sub_1DCB4A8D8((int)&__p, v16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DCB72394(uint64_t result)
{
  if ((result & 0x80000000) != 0)
  {
    exceptiouint64_t n = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_1DCB4C7B0(exception, "numerical cast overflow: could not retain value in conversion type");
    __cxa_throw(exception, (struct type_info *)&unk_1F37F61E8, MEMORY[0x1E4FBA1E0]);
  }
  return result;
}

void sub_1DCB723EC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

DSPGraph::Box *sub_1DCB72400(DSPGraph::Box *a1, unsigned int a2)
{
  int v4 = (void *)DSPGraph::Box::Box(a1);
  *int v4 = &unk_1F37F68E0;
  sub_1DCB73DC4(v4 + 97, a2);
  *((_OWORD *)a1 + 50) = 0u;
  *((_OWORD *)a1 + 51) = 0u;
  return a1;
}

void sub_1DCB72460(_Unwind_Exception *a1)
{
  DSPGraph::Box::~Box(v1);
  _Unwind_Resume(a1);
}

void sub_1DCB72474(uint64_t a1)
{
  uint64_t v1 = a1;
  unint64_t v2 = *(void *)(a1 + 72) - *(void *)(a1 + 64);
  sub_1DCB72DCC((void ***)(a1 + 776), (v2 >> 5));
  unint64_t v97 = (v2 >> 5);
  sub_1DCB72F9C((void ***)(v1 + 800), v97);
  if ((v2 & 0x1FFFFFFFE0) != 0)
  {
    unint64_t v3 = 0;
    uint64_t v98 = v1;
    do
    {
      uint64_t v4 = *(void *)(v1 + 64);
      unint64_t v100 = v3;
      if (v3 >= (*(void *)(v1 + 72) - v4) >> 5)
      {
        sub_1DCB43D1C(v105, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
        sub_1DCB43D1C(v104, "in");
        std::string::size_type v96 = (void *)(v98 + 32);
        if (*(char *)(v98 + 55) < 0) {
          std::string::size_type v96 = (void *)*v96;
        }
LABEL_117:
        DSPGraph::strprintf(v103, (DSPGraph *)"Box::in inIndex out of range! box %s has %zu inputs but input %u was requested", v95, v96, (uint64_t)(*(void *)(v98 + 72) - *(void *)(v98 + 64)) >> 5, v3);
        DSPGraph::ThrowException();
LABEL_118:
        __break(1u);
LABEL_119:
        sub_1DCB49194();
      }
      if (*(_DWORD *)(*(void *)((*(uint64_t (**)(unint64_t))(*(void *)(v4 + 32 * v3) + 40))(v4 + 32 * v3)
                                 + 120)
                     + 8) != 1819304813)
      {
        sub_1DCB43D1C(v105, "/Library/Caches/com.apple.xbs/Sources/Listen/Framework/Internal/Core/DSPGraph/Boxes/DSPGraph_SignalDetectorBox.cpp");
        sub_1DCB43D1C(v104, "initialize");
        sub_1DCB43D1C(v103, "inputs must be LPCM");
        DSPGraph::ThrowException();
        goto LABEL_118;
      }
      uint64_t v5 = *(void *)(v1 + 64);
      if (v3 >= (*(void *)(v1 + 72) - v5) >> 5)
      {
        sub_1DCB43D1C(v105, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
        sub_1DCB43D1C(v104, "in");
        std::string::size_type v96 = (void *)(v98 + 32);
        if (*(char *)(v98 + 55) < 0) {
          std::string::size_type v96 = (void *)*v96;
        }
        goto LABEL_117;
      }
      uint64_t v6 = (*(uint64_t (**)(unint64_t))(*(void *)(v5 + 32 * v3) + 40))(v5 + 32 * v3);
      uint64_t v7 = *(void *)(v1 + 776);
      if (0xAAAAAAAAAAAAAAABLL * ((*(void *)(v1 + 784) - v7) >> 3) <= v3) {
LABEL_107:
      }
        sub_1DCB7402C();
      uint64_t v8 = (char **)(v7 + 24 * v3);
      uint64_t v10 = v8 + 1;
      uint64_t v9 = v8[1];
      unint64_t v11 = *(unsigned int *)(*(void *)(v6 + 120) + 28);
      long long v12 = *v8;
      unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * ((v9 - *v8) >> 3);
      unint64_t v14 = v3;
      unint64_t v15 = v11 - v13;
      if (v11 <= v13)
      {
        unint64_t v33 = v14;
        if (v11 < v13)
        {
          uint64_t v34 = &v12[24 * v11];
          while (v9 != v34)
          {
            long long v36 = (void *)*((void *)v9 - 3);
            v9 -= 24;
            unint64_t v35 = v36;
            if (v36) {
              operator delete(v35);
            }
          }
          *uint64_t v10 = v34;
        }
      }
      else
      {
        uint64_t v16 = v7 + 24 * v14;
        uint64_t v19 = *(void *)(v16 + 16);
        long long v18 = (char **)(v16 + 16);
        uint64_t v17 = v19;
        if (0xAAAAAAAAAAAAAAABLL * ((v19 - (uint64_t)v9) >> 3) >= v15)
        {
          bzero(v9, 24 * ((24 * v15 - 24) / 0x18) + 24);
          *uint64_t v10 = &v9[24 * ((24 * v15 - 24) / 0x18) + 24];
          unint64_t v33 = v100;
        }
        else
        {
          unint64_t v20 = 0xAAAAAAAAAAAAAAABLL * ((v17 - (uint64_t)v12) >> 3);
          uint64_t v21 = 2 * v20;
          if (2 * v20 <= v11) {
            uint64_t v21 = *(unsigned int *)(*(void *)(v6 + 120) + 28);
          }
          if (v20 >= 0x555555555555555) {
            unint64_t v22 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v22 = v21;
          }
          if (v22 > 0xAAAAAAAAAAAAAAALL) {
            goto LABEL_119;
          }
          uint64_t v23 = 3 * v22;
          uint64_t v24 = (char *)operator new(24 * v22);
          uint64_t v25 = &v24[24 * v13];
          uint64_t v26 = &v24[8 * v23];
          size_t v27 = 24 * ((24 * v15 - 24) / 0x18) + 24;
          bzero(v25, v27);
          uint64_t v28 = &v25[v27];
          if (v9 == v12)
          {
            *uint64_t v8 = v25;
            *uint64_t v10 = v28;
            *long long v18 = v26;
          }
          else
          {
            do
            {
              uint64_t v29 = *((void *)v9 - 3);
              v9 -= 24;
              *((void *)v25 - 3) = v29;
              v25 -= 24;
              *((void *)v25 + 1) = *((void *)v9 + 1);
              *((void *)v25 + 2) = *((void *)v9 + 2);
              *(void *)uint64_t v9 = 0;
              *((void *)v9 + 1) = 0;
              *((void *)v9 + 2) = 0;
            }
            while (v9 != v12);
            uint64_t v9 = *v8;
            uint64_t v30 = *v10;
            *uint64_t v8 = v25;
            *uint64_t v10 = v28;
            *long long v18 = v26;
            while (v30 != v9)
            {
              long long v32 = (void *)*((void *)v30 - 3);
              v30 -= 24;
              long long v31 = v32;
              if (v32) {
                operator delete(v31);
              }
            }
          }
          unint64_t v33 = v100;
          if (v9) {
            operator delete(v9);
          }
        }
      }
      uint64_t v1 = v98;
      uint64_t v37 = *(void *)(v98 + 800);
      if (0xAAAAAAAAAAAAAAABLL * ((*(void *)(v98 + 808) - v37) >> 3) <= v33) {
LABEL_108:
      }
        sub_1DCB7402C();
      long long v38 = (char **)(v37 + 24 * v33);
      uint64_t v40 = v38 + 1;
      long long v39 = v38[1];
      unint64_t v41 = *v38;
      unint64_t v42 = v33;
      unint64_t v43 = 0xAAAAAAAAAAAAAAABLL * ((v39 - *v38) >> 3);
      BOOL v44 = v11 >= v43;
      unint64_t v45 = v11 - v43;
      if (v11 <= v43)
      {
        unint64_t v63 = v42;
        if (!v44)
        {
          uint64_t v66 = &v41[24 * v11];
          if (v39 != v66)
          {
            uint64_t v67 = v39;
            do
            {
              uint64_t v69 = (void *)*((void *)v67 - 3);
              v67 -= 24;
              uint64_t v68 = v69;
              if (v69)
              {
                *((void *)v39 - 2) = v68;
                operator delete(v68);
              }
              long long v39 = v67;
            }
            while (v67 != v66);
          }
          *uint64_t v40 = v66;
          uint64_t v1 = v98;
        }
      }
      else
      {
        uint64_t v46 = v37 + 24 * v42;
        uint64_t v49 = *(void *)(v46 + 16);
        uint64_t v48 = (char **)(v46 + 16);
        uint64_t v47 = v49;
        if (0xAAAAAAAAAAAAAAABLL * ((v49 - (uint64_t)v39) >> 3) >= v45)
        {
          bzero(v39, 24 * ((24 * v45 - 24) / 0x18) + 24);
          *uint64_t v40 = &v39[24 * ((24 * v45 - 24) / 0x18) + 24];
          uint64_t v1 = v98;
          unint64_t v63 = v100;
          goto LABEL_60;
        }
        unint64_t v50 = 0xAAAAAAAAAAAAAAABLL * ((v47 - (uint64_t)v41) >> 3);
        uint64_t v51 = 2 * v50;
        if (2 * v50 <= v11) {
          uint64_t v51 = v11;
        }
        if (v50 >= 0x555555555555555) {
          unint64_t v52 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v52 = v51;
        }
        unint64_t v53 = (char *)sub_1DCB73ED4((uint64_t)v48, v52);
        uint64_t v54 = &v53[24 * v43];
        uint64_t v56 = &v53[24 * v55];
        bzero(v54, 24 * ((24 * v45 - 24) / 0x18) + 24);
        uint64_t v57 = &v54[24 * ((24 * v45 - 24) / 0x18) + 24];
        uint64_t v58 = *v40;
        uint64_t v59 = *v38;
        if (*v40 == *v38)
        {
          *long long v38 = v54;
          *uint64_t v40 = v57;
          *uint64_t v48 = v56;
LABEL_58:
          uint64_t v1 = v98;
          unint64_t v63 = v100;
          if (!v58) {
            goto LABEL_60;
          }
LABEL_59:
          operator delete(v58);
          goto LABEL_60;
        }
        do
        {
          *((void *)v54 - 3) = 0;
          *((void *)v54 - 2) = 0;
          v54 -= 24;
          *((void *)v54 + 2) = 0;
          long long v60 = *(_OWORD *)(v58 - 24);
          v58 -= 24;
          *(_OWORD *)uint64_t v54 = v60;
          *((void *)v54 + 2) = *((void *)v58 + 2);
          *(void *)uint64_t v58 = 0;
          *((void *)v58 + 1) = 0;
          *((void *)v58 + 2) = 0;
        }
        while (v58 != v59);
        uint64_t v58 = *v38;
        uint64_t v61 = *v40;
        *long long v38 = v54;
        *uint64_t v40 = v57;
        *uint64_t v48 = v56;
        if (v61 == v58) {
          goto LABEL_58;
        }
        uint64_t v62 = v61;
        uint64_t v1 = v98;
        unint64_t v63 = v100;
        do
        {
          uint64_t v65 = (void *)*((void *)v62 - 3);
          v62 -= 24;
          uint64_t v64 = v65;
          if (v65)
          {
            *((void *)v61 - 2) = v64;
            operator delete(v64);
          }
          uint64_t v61 = v62;
        }
        while (v62 != v58);
        if (v58) {
          goto LABEL_59;
        }
      }
LABEL_60:
      if (v11)
      {
        uint64_t v70 = 0;
        unint64_t v71 = 0;
        uint64_t v102 = 24 * v11;
        while (1)
        {
          uint64_t v72 = *(void *)(v1 + 776);
          if (0xAAAAAAAAAAAAAAABLL * ((*(void *)(v1 + 784) - v72) >> 3) <= v63) {
            goto LABEL_107;
          }
          uint64_t v73 = (uint64_t *)(v72 + 24 * v63);
          uint64_t v74 = *v73;
          if (0xAAAAAAAAAAAAAAABLL * ((v73[1] - *v73) >> 3) <= v71) {
            sub_1DCB7402C();
          }
          unint64_t v75 = *(unsigned int *)(v1 + 824);
          uint64_t v76 = v74 + v70;
          unint64_t v77 = *(void *)(v74 + v70 + 8);
          unint64_t v78 = v75 - v77;
          if (v75 <= v77)
          {
            *(void *)(v76 + _Block_object_dispose(&STACK[0x220], 8) = v75;
            goto LABEL_98;
          }
          uint64_t v79 = *(void *)(v76 + 16);
          if (v79 << 6 >= v78 && v77 <= (v79 << 6) - v78)
          {
            int v82 = (unint64_t *)(*(void *)(v74 + v70) + 8 * (v77 >> 6));
            uint64_t v83 = *(void *)(v74 + v70 + 8) & 0x3FLL;
            *(void *)(v76 + _Block_object_dispose(&STACK[0x220], 8) = v75;
            goto LABEL_88;
          }
          if ((unint64_t)(v79 << 6) > 0x3FFFFFFFFFFFFFFELL) {
            break;
          }
          unint64_t v81 = v79 << 7;
          if (v81 <= ((v75 + 63) & 0x1FFFFFFC0)) {
            unint64_t v81 = (v75 + 63) & 0x1FFFFFFC0;
          }
          if (v81)
          {
            if ((v81 & 0x8000000000000000) != 0) {
              sub_1DCB73EBC();
            }
            goto LABEL_78;
          }
          unint64_t v85 = 0;
          unint64_t v84 = 0;
LABEL_79:
          uint64_t v86 = *(void **)(v74 + v70);
          int v82 = v85;
          if ((uint64_t)v77 < 1) {
            goto LABEL_85;
          }
          unint64_t v99 = v84;
          unint64_t v87 = v77 >> 6;
          if (v77 >= 0x40)
          {
            float v88 = *(void **)(v74 + v70);
            memmove(v85, v86, 8 * v87);
            uint64_t v86 = v88;
          }
          int v82 = &v85[v87];
          uint64_t v83 = v77 & 0x3F;
          if ((v77 & 0x3F) == 0)
          {
            uint64_t v1 = v98;
            unint64_t v84 = v99;
LABEL_85:
            *(void *)(v74 + v70) = v85;
            *(void *)(v76 + _Block_object_dispose(&STACK[0x220], 8) = v75;
            *(void *)(v76 + 16) = v84;
            if (!v86)
            {
              unint64_t v63 = v100;
              if (v75 != v77) {
                goto LABEL_94;
              }
              goto LABEL_98;
            }
            id v101 = v82;
            uint64_t v83 = 0;
            goto LABEL_87;
          }
          id v101 = &v85[v87];
          *id v101 = *v101 & ~(0xFFFFFFFFFFFFFFFFLL >> -(char)v83) | *((void *)v86 + v87) & (0xFFFFFFFFFFFFFFFFLL >> -(char)v83);
          *(void *)(v74 + v70) = v85;
          uint64_t v1 = v98;
          *(void *)(v76 + _Block_object_dispose(&STACK[0x220], 8) = v75;
          *(void *)(v76 + 16) = v99;
LABEL_87:
          unint64_t v63 = v100;
          operator delete(v86);
          int v82 = v101;
LABEL_88:
          if (v75 != v77)
          {
            if (v83)
            {
              if (64 - v83 >= v78) {
                uint64_t v89 = v75 - v77;
              }
              else {
                uint64_t v89 = 64 - v83;
              }
              *v82++ &= ~((0xFFFFFFFFFFFFFFFFLL >> (64 - v83 - v89)) & (-1 << v83));
              v78 -= v89;
            }
LABEL_94:
            unint64_t v90 = v78 >> 6;
            if (v78 >= 0x40)
            {
              int v91 = v82;
              bzero(v82, 8 * v90);
              int v82 = v91;
            }
            if ((v78 & 0x3F) != 0) {
              v82[v90] &= ~(0xFFFFFFFFFFFFFFFFLL >> -(v78 & 0x3F));
            }
          }
LABEL_98:
          uint64_t v92 = *(void *)(v1 + 800);
          if (0xAAAAAAAAAAAAAAABLL * ((*(void *)(v1 + 808) - v92) >> 3) <= v63) {
            goto LABEL_108;
          }
          long long v94 = (uint64_t *)(v92 + 24 * v63);
          uint64_t v93 = *v94;
          if (0xAAAAAAAAAAAAAAABLL * ((v94[1] - *v94) >> 3) <= v71) {
            sub_1DCB7402C();
          }
          sub_1DCB7316C((char **)(v93 + v70), *(unsigned int *)(v1 + 824));
          ++v71;
          v70 += 24;
          if (v102 == v70) {
            goto LABEL_105;
          }
        }
        unint64_t v81 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_78:
        unint64_t v84 = ((v81 - 1) >> 6) + 1;
        unint64_t v85 = (unint64_t *)operator new(8 * v84);
        *unint64_t v85 = 0;
        goto LABEL_79;
      }
LABEL_105:
      unint64_t v3 = v63 + 1;
    }
    while (v3 != v97);
  }
}

void sub_1DCB72D68(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  if (a29 < 0) {
    operator delete(a24);
  }
  if (*(char *)(v29 - 81) < 0) {
    operator delete(*(void **)(v29 - 104));
  }
  _Unwind_Resume(exception_object);
}

void sub_1DCB72DCC(void ***a1, unint64_t a2)
{
  unint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  unint64_t v5 = 0xAAAAAAAAAAAAAAABLL * (v4 - *a1);
  unint64_t v6 = a2 - v5;
  if (a2 <= v5)
  {
    if (a2 < v5)
    {
      uint64_t v21 = &v3[3 * a2];
      while (v4 != v21)
      {
        v4 -= 3;
        unint64_t v22 = v4;
        sub_1DCB73F90(&v22);
      }
      a1[1] = v21;
    }
  }
  else
  {
    uint64_t v7 = (uint64_t)(a1 + 2);
    uint64_t v8 = a1[2];
    if (0xAAAAAAAAAAAAAAABLL * (v8 - v4) >= v6)
    {
      bzero(v4, 24 * ((24 * v6 - 24) / 0x18) + 24);
      a1[1] = &v4[3 * ((24 * v6 - 24) / 0x18) + 3];
    }
    else
    {
      if (a2 > 0xAAAAAAAAAAAAAAALL) {
        sub_1DCB73EBC();
      }
      unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * (v8 - v3);
      uint64_t v10 = 2 * v9;
      if (2 * v9 <= a2) {
        uint64_t v10 = a2;
      }
      if (v9 >= 0x555555555555555) {
        unint64_t v11 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v11 = v10;
      }
      long long v12 = (char *)sub_1DCB73ED4(v7, v11);
      unint64_t v13 = &v12[24 * v5];
      unint64_t v15 = &v12[24 * v14];
      bzero(v13, 24 * ((24 * v6 - 24) / 0x18) + 24);
      uint64_t v16 = (void **)&v13[24 * ((24 * v6 - 24) / 0x18) + 24];
      uint64_t v17 = *a1;
      long long v18 = a1[1];
      if (v18 == *a1)
      {
        *a1 = (void **)v13;
        a1[1] = v16;
        a1[2] = (void **)v15;
      }
      else
      {
        do
        {
          *((void *)v13 - 3) = 0;
          *((void *)v13 - 2) = 0;
          v13 -= 24;
          *((void *)v13 + 2) = 0;
          long long v19 = *(_OWORD *)(v18 - 3);
          v18 -= 3;
          *(_OWORD *)unint64_t v13 = v19;
          *((void *)v13 + 2) = v18[2];
          *long long v18 = 0;
          v18[1] = 0;
          v18[2] = 0;
        }
        while (v18 != v17);
        long long v18 = *a1;
        unint64_t v20 = a1[1];
        *a1 = (void **)v13;
        a1[1] = v16;
        a1[2] = (void **)v15;
        while (v20 != v18)
        {
          v20 -= 3;
          unint64_t v22 = v20;
          sub_1DCB73F90(&v22);
        }
      }
      if (v18) {
        operator delete(v18);
      }
    }
  }
}

void sub_1DCB72F9C(void ***a1, unint64_t a2)
{
  unint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  unint64_t v5 = 0xAAAAAAAAAAAAAAABLL * (v4 - *a1);
  unint64_t v6 = a2 - v5;
  if (a2 <= v5)
  {
    if (a2 < v5)
    {
      uint64_t v21 = &v3[3 * a2];
      while (v4 != v21)
      {
        v4 -= 3;
        unint64_t v22 = v4;
        sub_1DCB6CC74(&v22);
      }
      a1[1] = v21;
    }
  }
  else
  {
    uint64_t v7 = (uint64_t)(a1 + 2);
    uint64_t v8 = a1[2];
    if (0xAAAAAAAAAAAAAAABLL * (v8 - v4) >= v6)
    {
      bzero(v4, 24 * ((24 * v6 - 24) / 0x18) + 24);
      a1[1] = &v4[3 * ((24 * v6 - 24) / 0x18) + 3];
    }
    else
    {
      if (a2 > 0xAAAAAAAAAAAAAAALL) {
        sub_1DCB73EBC();
      }
      unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * (v8 - v3);
      uint64_t v10 = 2 * v9;
      if (2 * v9 <= a2) {
        uint64_t v10 = a2;
      }
      if (v9 >= 0x555555555555555) {
        unint64_t v11 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v11 = v10;
      }
      long long v12 = (char *)sub_1DCB73ED4(v7, v11);
      unint64_t v13 = &v12[24 * v5];
      unint64_t v15 = &v12[24 * v14];
      bzero(v13, 24 * ((24 * v6 - 24) / 0x18) + 24);
      uint64_t v16 = (void **)&v13[24 * ((24 * v6 - 24) / 0x18) + 24];
      uint64_t v17 = *a1;
      long long v18 = a1[1];
      if (v18 == *a1)
      {
        *a1 = (void **)v13;
        a1[1] = v16;
        a1[2] = (void **)v15;
      }
      else
      {
        do
        {
          *((void *)v13 - 3) = 0;
          *((void *)v13 - 2) = 0;
          v13 -= 24;
          *((void *)v13 + 2) = 0;
          long long v19 = *(_OWORD *)(v18 - 3);
          v18 -= 3;
          *(_OWORD *)unint64_t v13 = v19;
          *((void *)v13 + 2) = v18[2];
          *long long v18 = 0;
          v18[1] = 0;
          v18[2] = 0;
        }
        while (v18 != v17);
        long long v18 = *a1;
        unint64_t v20 = a1[1];
        *a1 = (void **)v13;
        a1[1] = v16;
        a1[2] = (void **)v15;
        while (v20 != v18)
        {
          v20 -= 3;
          unint64_t v22 = v20;
          sub_1DCB6CC74(&v22);
        }
      }
      if (v18) {
        operator delete(v18);
      }
    }
  }
}

void sub_1DCB7316C(char **a1, unint64_t a2)
{
  unint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  unint64_t v5 = (v4 - *a1) >> 3;
  if (a2 <= v5)
  {
    if (a2 >= v5) {
      return;
    }
    long long v19 = &v3[8 * a2];
    goto LABEL_19;
  }
  unint64_t v6 = a2 - v5;
  uint64_t v7 = a1[2];
  if (a2 - v5 <= (v7 - v4) >> 3)
  {
    bzero(a1[1], 8 * v6);
    long long v19 = &v4[8 * v6];
LABEL_19:
    a1[1] = v19;
    return;
  }
  if (a2 >> 61) {
    sub_1DCB73EBC();
  }
  uint64_t v8 = v7 - v3;
  uint64_t v9 = v8 >> 2;
  if (v8 >> 2 <= a2) {
    uint64_t v9 = a2;
  }
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v10 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v10 = v9;
  }
  unint64_t v11 = (char *)sub_1DCB74044(v10);
  unint64_t v13 = *a1;
  long long v12 = a1[1];
  uint64_t v14 = &v11[8 * v5];
  uint64_t v16 = &v11[8 * v15];
  bzero(v14, 8 * v6);
  uint64_t v17 = &v14[8 * v6];
  if (v12 != v13)
  {
    do
    {
      uint64_t v18 = *((void *)v12 - 1);
      v12 -= 8;
      *((void *)v14 - 1) = v18;
      v14 -= 8;
    }
    while (v12 != v13);
    long long v12 = *a1;
  }
  *a1 = v14;
  a1[1] = v17;
  a1[2] = v16;
  if (v12)
  {
    operator delete(v12);
  }
}

void sub_1DCB73288(uint64_t a1)
{
  sub_1DCB72DCC((void ***)(a1 + 776), ((*(void *)(a1 + 72) - *(void *)(a1 + 64)) >> 5));
  unint64_t v2 = ((*(void *)(a1 + 72) - *(void *)(a1 + 64)) >> 5);

  sub_1DCB72F9C((void ***)(a1 + 800), v2);
}

uint64_t sub_1DCB732DC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = a1 + 64;
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(v5 + 8);
  if (((v4 - v3) & 0x1FFFFFFFE0) == 0)
  {
LABEL_68:
    if (v4 == v3)
    {
      sub_1DCB43D1C(v100, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
      sub_1DCB43D1C(v99, "in");
      unint64_t v90 = (void *)(a1 + 32);
      if (*(char *)(a1 + 55) < 0) {
        unint64_t v90 = (void *)*v90;
      }
    }
    else
    {
      uint64_t v82 = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 40))(v3);
      uint64_t v83 = *(void *)(a1 + 64);
      if (*(void *)(a1 + 72) != v83)
      {
        uint64_t v84 = *(unsigned int *)(*(void *)(v82 + 56) + 72);
        unint64_t v85 = (const AudioTimeStamp *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v83 + 40))(v83) + 56)
                                     + 8);
        return DSPGraph::Box::propagateFlagsAndTimeStamp((DSPGraph::Box *)a1, v84, v85);
      }
      sub_1DCB43D1C(v100, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
      sub_1DCB43D1C(v99, "in");
      unint64_t v90 = (void *)(a1 + 32);
      if (*(char *)(a1 + 55) < 0) {
        unint64_t v90 = (void *)*v90;
      }
    }
    DSPGraph::strprintf(v98, (DSPGraph *)"Box::in inIndex out of range! box %s has %zu inputs but input %u was requested", v89, v90, (uint64_t)(*(void *)(a1 + 72) - *(void *)(a1 + 64)) >> 5, 0);
    uint64_t result = DSPGraph::ThrowException();
    goto LABEL_101;
  }
  uint64_t v6 = a2;
  unint64_t v7 = 0;
  unint64_t v8 = (v4 - v3) >> 5;
  unint64_t v93 = a2;
LABEL_3:
  if (v8 > v7)
  {
    uint64_t v9 = (*(uint64_t (**)(unint64_t))(*(void *)(v3 + 32 * v7) + 40))(v3 + 32 * v7);
    uint64_t v10 = *(void *)(a1 + 64);
    if (v7 >= (*(void *)(a1 + 72) - v10) >> 5)
    {
      sub_1DCB43D1C(v100, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
      sub_1DCB43D1C(v99, "in");
      float v88 = (void *)(a1 + 32);
      if (*(char *)(a1 + 55) < 0) {
        float v88 = (void *)*v88;
      }
      goto LABEL_94;
    }
    uint64_t v92 = *(void *)(*(void *)(v9 + 56) + 80);
    uint64_t v11 = *(void *)((*(uint64_t (**)(unint64_t))(*(void *)(v10 + 32 * v7) + 40))(v10 + 32 * v7)
                    + 120);
    uint64_t v94 = *(unsigned int *)(v11 + 28);
    if (!v94) {
      goto LABEL_67;
    }
    unint64_t v12 = 0;
    int v91 = *(_DWORD *)(v11 + 12);
    while (1)
    {
      uint64_t v13 = *(void *)(a1 + 800);
      if (0xAAAAAAAAAAAAAAABLL * ((*(void *)(a1 + 808) - v13) >> 3) <= v7) {
        goto LABEL_77;
      }
      uint64_t v15 = (uint64_t *)(v13 + 24 * v7);
      uint64_t v14 = *v15;
      if (0xAAAAAAAAAAAAAAABLL * ((v15[1] - *v15) >> 3) <= v12) {
        goto LABEL_78;
      }
      sub_1DCB7316C((char **)(v14 + 24 * v12), 0);
      uint64_t v16 = *(void *)(a1 + 800);
      if (0xAAAAAAAAAAAAAAABLL * ((*(void *)(a1 + 808) - v16) >> 3) <= v7) {
LABEL_77:
      }
        sub_1DCB7402C();
      uint64_t v18 = (uint64_t *)(v16 + 24 * v7);
      uint64_t v17 = *v18;
      if (0xAAAAAAAAAAAAAAABLL * ((v18[1] - *v18) >> 3) <= v12) {
        goto LABEL_78;
      }
      if (v93 > (uint64_t)(*(void *)(v17 + 24 * v12 + 16) - *(void *)(v17 + 24 * v12)) >> 3) {
        __assert_rtn("process", "DSPGraph_SignalDetectorBox.cpp", 56, "mInputSignalRanges.at(busIdx).at(channelIdx).capacity() >= inNumFrames");
      }
      if (!v6) {
        goto LABEL_66;
      }
      unsigned int v19 = 0;
      BOOL v20 = 0;
      int v21 = (v91 & 0x20) != 0 ? 1 : v12;
      unint64_t v22 = (void *)((v91 & 0x20) != 0 ? v92 + 16 * v12 + 16 : v92 + 16);
      int v96 = v21;
      int v97 = 0;
      CMTime v95 = v22;
      while (1)
      {
        float v23 = *(float *)(a1 + 828);
        float v24 = fabsf(*(float *)(*v22 + 4 * v19 * v21));
        BOOL v25 = v24 > v23;
        uint64_t v26 = *(void *)(a1 + 776);
        if (0xAAAAAAAAAAAAAAABLL * ((*(void *)(a1 + 784) - v26) >> 3) <= v7) {
          sub_1DCB7402C();
        }
        uint64_t v28 = (uint64_t *)(v26 + 24 * v7);
        uint64_t v27 = *v28;
        if (0xAAAAAAAAAAAAAAABLL * ((v28[1] - *v28) >> 3) <= v12) {
          sub_1DCB7402C();
        }
        if (*(void *)(v27 + 24 * v12 + 8) <= (unint64_t)v19) {
          sub_1DCB7402C();
        }
        uint64_t v29 = *(void *)(v27 + 24 * v12);
        unint64_t v30 = (unint64_t)v19 >> 6;
        uint64_t v31 = 1 << v19;
        if (v24 > v23) {
          break;
        }
        *(void *)(v29 + 8 * v30) &= ~v31;
        unsigned int v32 = v19 + 1;
        if (v20)
        {
          uint64_t v33 = *(void *)(a1 + 64);
          if (v7 >= (*(void *)(a1 + 72) - v33) >> 5)
          {
            sub_1DCB43D1C(v100, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
            sub_1DCB43D1C(v99, "in");
            float v88 = (void *)(a1 + 32);
            if (*(char *)(a1 + 55) < 0) {
              float v88 = (void *)*v88;
            }
            goto LABEL_94;
          }
          uint64_t v34 = (*(uint64_t (**)(unint64_t))(*(void *)(v33 + 32 * v7) + 40))(v33 + 32 * v7);
          uint64_t v35 = *(void *)(a1 + 800);
          if (0xAAAAAAAAAAAAAAABLL * ((*(void *)(a1 + 808) - v35) >> 3) <= v7) {
            goto LABEL_77;
          }
          uint64_t v37 = (uint64_t *)(v35 + 24 * v7);
          uint64_t v36 = *v37;
          if (0xAAAAAAAAAAAAAAABLL * ((v37[1] - *v37) >> 3) <= v12) {
            goto LABEL_78;
          }
          double v38 = *(double *)(*(void *)(v34 + 56) + 8) + (double)v19;
          long long v39 = (int **)(v36 + 24 * v12);
          unint64_t v41 = (void **)(v39 + 1);
          uint64_t v40 = v39[1];
          unint64_t v43 = v39 + 2;
          unint64_t v42 = (unint64_t)v39[2];
          if ((unint64_t)v40 >= v42)
          {
            uint64_t v47 = v6;
            uint64_t v48 = ((char *)v40 - (char *)*v39) >> 3;
            unint64_t v49 = v48 + 1;
            if ((unint64_t)(v48 + 1) >> 61) {
              goto LABEL_85;
            }
            uint64_t v50 = v42 - (void)*v39;
            if (v50 >> 2 > v49) {
              unint64_t v49 = v50 >> 2;
            }
            if ((unint64_t)v50 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v51 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v51 = v49;
            }
            unint64_t v53 = (char *)sub_1DCB74044(v51);
            uint64_t v54 = (int *)&v53[8 * v48];
            int *v54 = v97;
            v54[1] = (int)v38;
            uint64_t v55 = (char *)*v41;
            uint64_t v56 = *v39;
            uint64_t v57 = v54;
            uint64_t v6 = v47;
            if (*v41 != *v39)
            {
              do
              {
                uint64_t v58 = *((void *)v55 - 1);
                v55 -= 8;
                *((void *)v57 - 1) = v58;
                v57 -= 2;
              }
              while (v55 != (char *)v56);
              uint64_t v55 = (char *)*v39;
            }
            char *v39 = v57;
            BOOL v44 = v54 + 2;
            *unint64_t v41 = v54 + 2;
            *unint64_t v43 = &v53[8 * v52];
            if (v55) {
              operator delete(v55);
            }
          }
          else
          {
            *uint64_t v40 = v97;
            v40[1] = (int)v38;
            BOOL v44 = v40 + 2;
          }
          int v21 = v96;
          unint64_t v22 = v95;
          *unint64_t v41 = v44;
        }
LABEL_47:
        unsigned int v19 = v32;
        BOOL v20 = v25;
        if (v32 >= v6) {
          goto LABEL_66;
        }
      }
      *(void *)(v29 + 8 * v30) |= v31;
      unsigned int v32 = v19 + 1;
      if (!v20) {
        break;
      }
      if (v32 != v6) {
        goto LABEL_47;
      }
      uint64_t v59 = *(void *)(a1 + 64);
      if (v7 >= (*(void *)(a1 + 72) - v59) >> 5)
      {
        sub_1DCB43D1C(v100, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
        sub_1DCB43D1C(v99, "in");
        float v88 = (void *)(a1 + 32);
        if (*(char *)(a1 + 55) < 0) {
          float v88 = (void *)*v88;
        }
        goto LABEL_94;
      }
      uint64_t v60 = (*(uint64_t (**)(unint64_t))(*(void *)(v59 + 32 * v7) + 40))(v59 + 32 * v7);
      uint64_t v61 = *(void *)(a1 + 800);
      if (0xAAAAAAAAAAAAAAABLL * ((*(void *)(a1 + 808) - v61) >> 3) <= v7) {
        goto LABEL_77;
      }
      unint64_t v63 = (uint64_t *)(v61 + 24 * v7);
      uint64_t v62 = *v63;
      if (0xAAAAAAAAAAAAAAABLL * ((v63[1] - *v63) >> 3) <= v12) {
LABEL_78:
      }
        sub_1DCB7402C();
      double v64 = *(double *)(*(void *)(v60 + 56) + 8) + (double)v19 + 1.0;
      uint64_t v65 = (int **)(v62 + 24 * v12);
      uint64_t v67 = (void **)(v65 + 1);
      uint64_t v66 = v65[1];
      uint64_t v69 = v65 + 2;
      unint64_t v68 = (unint64_t)v65[2];
      if ((unint64_t)v66 >= v68)
      {
        uint64_t v71 = ((char *)v66 - (char *)*v65) >> 3;
        unint64_t v72 = v71 + 1;
        if ((unint64_t)(v71 + 1) >> 61) {
LABEL_85:
        }
          sub_1DCB73EBC();
        uint64_t v73 = v68 - (void)*v65;
        if (v73 >> 2 > v72) {
          unint64_t v72 = v73 >> 2;
        }
        if ((unint64_t)v73 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v74 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v74 = v72;
        }
        uint64_t v76 = (char *)sub_1DCB74044(v74);
        unint64_t v77 = (int *)&v76[8 * v71];
        *unint64_t v77 = v97;
        v77[1] = (int)v64;
        unint64_t v78 = (char *)*v67;
        uint64_t v79 = *v65;
        unint64_t v80 = v77;
        if (*v67 != *v65)
        {
          do
          {
            uint64_t v81 = *((void *)v78 - 1);
            v78 -= 8;
            *((void *)v80 - 1) = v81;
            v80 -= 2;
          }
          while (v78 != (char *)v79);
          unint64_t v78 = (char *)*v65;
        }
        void *v65 = v80;
        uint64_t v70 = v77 + 2;
        *uint64_t v67 = v77 + 2;
        *uint64_t v69 = &v76[8 * v75];
        if (v78) {
          operator delete(v78);
        }
      }
      else
      {
        *uint64_t v66 = v97;
        v66[1] = (int)v64;
        uint64_t v70 = v66 + 2;
      }
      *uint64_t v67 = v70;
LABEL_66:
      if (++v12 == v94)
      {
LABEL_67:
        ++v7;
        uint64_t v3 = *(void *)(a1 + 64);
        uint64_t v4 = *(void *)(a1 + 72);
        unint64_t v8 = (v4 - v3) >> 5;
        if (v7 >= v8) {
          goto LABEL_68;
        }
        goto LABEL_3;
      }
    }
    uint64_t v45 = *(void *)(a1 + 64);
    if (v7 >= (*(void *)(a1 + 72) - v45) >> 5)
    {
      sub_1DCB43D1C(v100, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
      sub_1DCB43D1C(v99, "in");
      float v88 = (void *)(a1 + 32);
      if (*(char *)(a1 + 55) < 0) {
        float v88 = (void *)*v88;
      }
      goto LABEL_94;
    }
    uint64_t v46 = (*(uint64_t (**)(unint64_t))(*(void *)(v45 + 32 * v7) + 40))(v45 + 32 * v7);
    unint64_t v22 = v95;
    int v21 = v96;
    int v97 = (int)(*(double *)(*(void *)(v46 + 56) + 8) + (double)v19);
    goto LABEL_47;
  }
  sub_1DCB43D1C(v100, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
  sub_1DCB43D1C(v99, "in");
  float v88 = (void *)(a1 + 32);
  if (*(char *)(a1 + 55) < 0) {
    float v88 = (void *)*v88;
  }
LABEL_94:
  DSPGraph::strprintf(v98, (DSPGraph *)"Box::in inIndex out of range! box %s has %zu inputs but input %u was requested", v87, v88, (uint64_t)(*(void *)(a1 + 72) - *(void *)(a1 + 64)) >> 5, v7);
  uint64_t result = DSPGraph::ThrowException();
LABEL_101:
  __break(1u);
  return result;
}

void sub_1DCB73CC0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36)
{
  if (a24 < 0) {
    operator delete(__p);
  }
  if (a30 < 0) {
    operator delete(a25);
  }
  if (a36 < 0) {
    operator delete(a31);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DCB73D58(void **a1)
{
  sub_1DCB74444(a1);

  JUMPOUT(0x1E01A8C50);
}

const char *sub_1DCB73D90()
{
  return "SignalDetectorBox";
}

uint64_t sub_1DCB73D9C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 824) = a2;
  return result;
}

double sub_1DCB73DA4@<D0>(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 + 16) = 0;
  double result = *(double *)"xfuadgisxoba";
  *(_OWORD *)a1 = *(_OWORD *)"xfuadgisxoba";
  return result;
}

uint64_t sub_1DCB73DBC()
{
  return 0;
}

void *sub_1DCB73DC4(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_1DCB73E68(a1, a2);
    uint64_t v4 = (char *)a1[1];
    size_t v5 = 24 * ((24 * a2 - 24) / 0x18) + 24;
    bzero(v4, v5);
    a1[1] = &v4[v5];
  }
  return a1;
}

void sub_1DCB73E54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

char *sub_1DCB73E68(void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_1DCB73EBC();
  }
  double result = (char *)sub_1DCB73ED4((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void sub_1DCB73EBC()
{
}

void *sub_1DCB73ED4(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_1DCB49194();
  }
  return operator new(24 * a2);
}

void sub_1DCB73F1C(void ***a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = (void **)**a1;
  if (v2)
  {
    uint64_t v4 = (void **)v1[1];
    size_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 3;
        uint64_t v6 = v4;
        sub_1DCB73F90(&v6);
      }
      while (v4 != v2);
      size_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_1DCB73F90(void ***a1)
{
  unint64_t v2 = *a1;
  if (*v2)
  {
    sub_1DCB73FE4((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void sub_1DCB73FE4(uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24)
  {
    size_t v5 = *(void **)(i - 24);
    uint64_t v4 = v5;
    if (v5) {
      operator delete(v4);
    }
  }
  a1[1] = v2;
}

void sub_1DCB7402C()
{
}

void *sub_1DCB74044(unint64_t a1)
{
  if (a1 >> 61) {
    sub_1DCB49194();
  }
  return operator new(8 * a1);
}

void *sub_1DCB7407C(void *result, uint64_t ***a2, uint64_t ***a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    sub_1DCB73E68(result, a4);
    double result = sub_1DCB74104((uint64_t)(v6 + 2), a2, a3, (void *)v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_1DCB740E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + _Block_object_dispose(&STACK[0x220], 8) = v10;
  sub_1DCB6CC00(&a9);
  _Unwind_Resume(a1);
}

void *sub_1DCB74104(uint64_t a1, uint64_t ***a2, uint64_t ***a3, void *a4)
{
  uint64_t v4 = a4;
  uint64_t v10 = a4;
  uint64_t v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  char v9 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      *uint64_t v4 = 0;
      v4[1] = 0;
      v4[2] = 0;
      sub_1DCB741C4(v4, *v6, v6[1], 0xAAAAAAAAAAAAAAABLL * (v6[1] - *v6));
      uint64_t v4 = v11 + 3;
      v11 += 3;
      v6 += 3;
    }
    while (v6 != a3);
  }
  char v9 = 1;
  sub_1DCB743C0((uint64_t)v8);
  return v4;
}

void sub_1DCB741B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *sub_1DCB741C4(void *result, uint64_t **a2, uint64_t **a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    sub_1DCB73E68(result, a4);
    double result = sub_1DCB7424C((uint64_t)(v6 + 2), a2, a3, (void *)v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_1DCB7422C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + _Block_object_dispose(&STACK[0x220], 8) = v10;
  sub_1DCB6CC74(&a9);
  _Unwind_Resume(a1);
}

void *sub_1DCB7424C(uint64_t a1, uint64_t **a2, uint64_t **a3, void *a4)
{
  uint64_t v4 = a4;
  uint64_t v18 = a4;
  unsigned int v19 = a4;
  v16[0] = a1;
  v16[1] = &v18;
  v16[2] = &v19;
  char v17 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      *uint64_t v4 = 0;
      v4[1] = 0;
      v4[2] = 0;
      unint64_t v7 = *v6;
      unint64_t v8 = v6[1];
      uint64_t v9 = (char *)v8 - (char *)*v6;
      if (v8 != *v6)
      {
        if (v9 < 0) {
          sub_1DCB73EBC();
        }
        uint64_t v10 = sub_1DCB74044(v9 >> 3);
        uint64_t v11 = 0;
        *uint64_t v4 = v10;
        v4[1] = v10;
        v4[2] = &v10[v12];
        uint64_t v13 = v10;
        do
        {
          uint64_t v14 = *v7++;
          *v13++ = v14;
          ++v11;
        }
        while (v7 != v8);
        v4[1] = &v10[v11];
        uint64_t v4 = v19;
      }
      v6 += 3;
      v4 += 3;
      unsigned int v19 = v4;
    }
    while (v6 != a3);
  }
  char v17 = 1;
  sub_1DCB74358((uint64_t)v16);
  return v4;
}

void sub_1DCB74330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v11 = *(void **)v9;
  if (*(void *)v9)
  {
    *(void *)(v9 + _Block_object_dispose(&STACK[0x220], 8) = v11;
    operator delete(v11);
  }
  sub_1DCB74358((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t sub_1DCB74358(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24))
  {
    uint64_t v2 = **(void **)(a1 + 8);
    uint64_t v3 = **(void **)(a1 + 16);
    if (v3 != v2)
    {
      uint64_t v4 = **(void **)(a1 + 16);
      do
      {
        uint64_t v6 = *(void **)(v4 - 24);
        v4 -= 24;
        size_t v5 = v6;
        if (v6)
        {
          *(void *)(v3 - 16) = v5;
          operator delete(v5);
        }
        uint64_t v3 = v4;
      }
      while (v4 != v2);
    }
  }
  return a1;
}

uint64_t sub_1DCB743C0(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_1DCB743F8(a1);
  }
  return a1;
}

void sub_1DCB743F8(uint64_t a1)
{
  uint64_t v1 = **(void ****)(a1 + 16);
  uint64_t v2 = **(void ****)(a1 + 8);
  while (v1 != v2)
  {
    v1 -= 3;
    uint64_t v3 = v1;
    sub_1DCB6CC74(&v3);
  }
}

void sub_1DCB74444(void **a1)
{
  *a1 = &unk_1F37F68E0;
  uint64_t v2 = a1 + 100;
  sub_1DCB6CC00(&v2);
  uint64_t v2 = a1 + 97;
  sub_1DCB73F1C(&v2);
  DSPGraph::Box::~Box((DSPGraph::Box *)a1);
}

void sub_1DCB744B0(uint64_t a1)
{
  DSPGraph::Box::initialize((DSPGraph::Box *)a1);
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 72);
  if (((v3 - v2) & 0x1FFFFFFFE0) != 0x20 || ((*(void *)(a1 + 96) - *(void *)(a1 + 88)) & 0x1FFFFFFFE0) != 0x20)
  {
    sub_1DCB43D1C(v23, "/Library/Caches/com.apple.xbs/Sources/Listen/Framework/Internal/Core/DSPGraph/Boxes/DSPGraph_LogMelTransformBox.cpp");
    sub_1DCB43D1C(v22, "initialize");
    sub_1DCB43D1C(v21, "only supports 1 bus in 1 bus out");
    DSPGraph::ThrowException();
    goto LABEL_45;
  }
  if (v3 == v2)
  {
    sub_1DCB43D1C(v23, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(v22, "in");
    uint64_t v18 = (void *)(a1 + 32);
    if (*(char *)(a1 + 55) < 0) {
      uint64_t v18 = (void *)*v18;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2) + 120);
    if (*(_DWORD *)(v4 + 28) != 1)
    {
      sub_1DCB43D1C(v23, "/Library/Caches/com.apple.xbs/Sources/Listen/Framework/Internal/Core/DSPGraph/Boxes/DSPGraph_LogMelTransformBox.cpp");
      sub_1DCB43D1C(v22, "initialize");
      sub_1DCB43D1C(v21, "input must be single channel");
      DSPGraph::ThrowException();
      goto LABEL_45;
    }
    uint64_t v5 = *(void *)(a1 + 88);
    if (*(void *)(a1 + 96) == v5)
    {
      sub_1DCB43D1C(v23, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
      sub_1DCB43D1C(v22, "out");
      BOOL v20 = (void *)(a1 + 32);
      if (*(char *)(a1 + 55) < 0) {
        BOOL v20 = (void *)*v20;
      }
      goto LABEL_44;
    }
    uint64_t v6 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v5 + 40))(v5) + 120);
    if (*(_DWORD *)(v6 + 28) != 1)
    {
      sub_1DCB43D1C(v23, "/Library/Caches/com.apple.xbs/Sources/Listen/Framework/Internal/Core/DSPGraph/Boxes/DSPGraph_LogMelTransformBox.cpp");
      sub_1DCB43D1C(v22, "initialize");
      sub_1DCB43D1C(v21, "output must be single channel");
      DSPGraph::ThrowException();
      goto LABEL_45;
    }
    if (*(double *)v4 != *(double *)v6)
    {
      sub_1DCB43D1C(v23, "/Library/Caches/com.apple.xbs/Sources/Listen/Framework/Internal/Core/DSPGraph/Boxes/DSPGraph_LogMelTransformBox.cpp");
      sub_1DCB43D1C(v22, "initialize");
      sub_1DCB43D1C(v21, "input and output sample rates must match");
      DSPGraph::ThrowException();
      goto LABEL_45;
    }
    if (*(_DWORD *)(a1 + 808) <= 1u) {
      __assert_rtn("initialize", "DSPGraph_LogMelTransformBox.cpp", 46, "mMaxFrames > 1");
    }
    uint64_t v7 = *(void *)(a1 + 64);
    if (*(void *)(a1 + 72) != v7)
    {
      uint64_t v8 = *(void *)((*(uint64_t (**)(uint64_t, double))(*(void *)v7 + 40))(v7, *(double *)v4) + 120);
      int v9 = *(_DWORD *)(v8 + 8);
      BOOL v10 = v9 == 1718773105 || v9 == 1819304813;
      if (v10 || !*(_DWORD *)(v8 + 16)) {
        int v11 = *(_DWORD *)(v4 + 24) * *(_DWORD *)(a1 + 808);
      }
      else {
        int v11 = *(_DWORD *)(v4 + 16);
      }
      *(_DWORD *)(a1 + 812) = v11;
      uint64_t v12 = *(void *)(a1 + 88);
      if (*(void *)(a1 + 96) != v12)
      {
        uint64_t v13 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)v12 + 40))(v12) + 120);
        int v14 = *(_DWORD *)(v13 + 8);
        BOOL v15 = v14 == 1718773105 || v14 == 1819304813;
        if (v15 || !*(_DWORD *)(v13 + 16)) {
          unsigned int v16 = *(_DWORD *)(v6 + 24) * *(_DWORD *)(a1 + 808);
        }
        else {
          unsigned int v16 = *(_DWORD *)(v6 + 16);
        }
        *(_DWORD *)(a1 + 816) = v16;
        *(_DWORD *)(a1 + 820) = *(_DWORD *)(a1 + 812) >> 2;
        *(_DWORD *)(a1 + 824) = v16 >> 2;
        operator new();
      }
      sub_1DCB43D1C(v23, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
      sub_1DCB43D1C(v22, "out");
      BOOL v20 = (void *)(a1 + 32);
      if (*(char *)(a1 + 55) < 0) {
        BOOL v20 = (void *)*v20;
      }
LABEL_44:
      DSPGraph::strprintf(v21, (DSPGraph *)"Box::out inIndex out of range! box %s has %zu outputs but input %u was requested", v19, v20, (uint64_t)(*(void *)(a1 + 96) - *(void *)(a1 + 88)) >> 5, 0);
      DSPGraph::ThrowException();
LABEL_45:
      __break(1u);
      sub_1DCB49194();
    }
    sub_1DCB43D1C(v23, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(v22, "in");
    uint64_t v18 = (void *)(a1 + 32);
    if (*(char *)(a1 + 55) < 0) {
      uint64_t v18 = (void *)*v18;
    }
  }
  DSPGraph::strprintf(v21, (DSPGraph *)"Box::in inIndex out of range! box %s has %zu inputs but input %u was requested", v17, v18, (uint64_t)(*(void *)(a1 + 72) - *(void *)(a1 + 64)) >> 5, 0);
  DSPGraph::ThrowException();
  goto LABEL_45;
}

void sub_1DCB74B00(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (a29 < 0) {
    operator delete(a24);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *sub_1DCB74BC0(uint64_t **a1)
{
  DSPGraph::Box::uninitialize((DSPGraph::Box *)a1);

  return sub_1DCB74BFC(a1 + 97, 0);
}

uint64_t *sub_1DCB74BFC(uint64_t **a1, uint64_t *a2)
{
  double result = *a1;
  *a1 = a2;
  if (result)
  {
    sub_1DCB43508(result);
    JUMPOUT(0x1E01A8C50);
  }
  return result;
}

uint64_t sub_1DCB74C4C(uint64_t a1)
{
  uint64_t v3 = a1 + 64;
  uint64_t v2 = *(void *)(a1 + 64);
  if (*(void *)(v3 + 8) == v2)
  {
    sub_1DCB43D1C(v27, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(v26, "in");
    unint64_t v22 = (void *)(a1 + 32);
    if (*(char *)(a1 + 55) < 0) {
      unint64_t v22 = (void *)*v22;
    }
    goto LABEL_30;
  }
  uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2);
  uint64_t v5 = *(void *)(a1 + 88);
  if (*(void *)(a1 + 96) == v5)
  {
    sub_1DCB43D1C(v27, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(v26, "out");
    float v24 = (void *)(a1 + 32);
    if (*(char *)(a1 + 55) < 0) {
      float v24 = (void *)*v24;
    }
    goto LABEL_21;
  }
  uint64_t v6 = *(const void **)(*(void *)(*(void *)(v4 + 56) + 80) + 16);
  uint64_t v7 = *(void **)(*(void *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v5 + 40))(v5) + 56) + 80)
                + 16);
  uint64_t v8 = *(unsigned int *)(a1 + 820);
  if (v8) {
    memmove(*(void **)(a1 + 784), v6, 4 * v8);
  }
  sub_1DCB5E1BC(*(void *)(a1 + 784), *(void *)(a1 + 784), *(_DWORD *)(*(void *)(a1 + 776) + 8), **(void **)(a1 + 776));
  uint64_t v9 = *(unsigned int *)(a1 + 824);
  if (v9) {
    memmove(v7, *(const void **)(a1 + 784), 4 * v9);
  }
  uint64_t v10 = *(void *)(a1 + 88);
  if (*(void *)(a1 + 96) == v10)
  {
    sub_1DCB43D1C(v27, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(v26, "out");
    float v24 = (void *)(a1 + 32);
    if (*(char *)(a1 + 55) < 0) {
      float v24 = (void *)*v24;
    }
LABEL_21:
    DSPGraph::strprintf(v25, (DSPGraph *)"Box::out inIndex out of range! box %s has %zu outputs but input %u was requested", v23, v24, (uint64_t)(*(void *)(a1 + 96) - *(void *)(a1 + 88)) >> 5, 0);
    uint64_t result = DSPGraph::ThrowException();
LABEL_31:
    __break(1u);
    return result;
  }
  int v11 = *(unsigned int **)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v10 + 40))(v10) + 56) + 80);
  uint64_t v12 = *v11;
  if (v12)
  {
    int v13 = *(_DWORD *)(a1 + 816);
    int v14 = v11 + 3;
    do
    {
      _DWORD *v14 = v13;
      v14 += 4;
      --v12;
    }
    while (v12);
  }
  uint64_t v15 = *(void *)(a1 + 64);
  if (*(void *)(a1 + 72) == v15)
  {
    sub_1DCB43D1C(v27, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(v26, "in");
    unint64_t v22 = (void *)(a1 + 32);
    if (*(char *)(a1 + 55) < 0) {
      unint64_t v22 = (void *)*v22;
    }
    goto LABEL_30;
  }
  uint64_t v16 = (*(uint64_t (**)(uint64_t))(*(void *)v15 + 40))(v15);
  uint64_t v17 = *(void *)(a1 + 64);
  if (*(void *)(a1 + 72) == v17)
  {
    sub_1DCB43D1C(v27, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    sub_1DCB43D1C(v26, "in");
    unint64_t v22 = (void *)(a1 + 32);
    if (*(char *)(a1 + 55) < 0) {
      unint64_t v22 = (void *)*v22;
    }
LABEL_30:
    DSPGraph::strprintf(v25, (DSPGraph *)"Box::in inIndex out of range! box %s has %zu inputs but input %u was requested", v21, v22, (uint64_t)(*(void *)(a1 + 72) - *(void *)(a1 + 64)) >> 5, 0);
    uint64_t result = DSPGraph::ThrowException();
    goto LABEL_31;
  }
  uint64_t v18 = *(unsigned int *)(*(void *)(v16 + 56) + 72);
  unsigned int v19 = (const AudioTimeStamp *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v17 + 40))(v17) + 56)
                               + 8);

  return DSPGraph::Box::propagateFlagsAndTimeStamp((DSPGraph::Box *)a1, v18, v19);
}

void sub_1DCB75064(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (*(char *)(v23 - 33) < 0) {
    operator delete(*(void **)(v23 - 56));
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DCB750E0()
{
  return 0;
}

void sub_1DCB750EC(uint64_t a1)
{
  sub_1DCB75158(a1);

  JUMPOUT(0x1E01A8C50);
}

const char *sub_1DCB75124()
{
  return "LogMelTransformBox";
}

uint64_t sub_1DCB75130(uint64_t result, int a2)
{
  *(_DWORD *)(result + 80_Block_object_dispose(&STACK[0x220], 8) = a2;
  return result;
}

uint64_t sub_1DCB75138()
{
  return 1;
}

double sub_1DCB75140@<D0>(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 + 16) = 0;
  double result = *(double *)"xfuaftmlxoba";
  *(_OWORD *)a1 = *(_OWORD *)"xfuaftmlxoba";
  return result;
}

void sub_1DCB75158(uint64_t a1)
{
  *(void *)a1 = &unk_1F37F6B70;
  uint64_t v2 = *(void **)(a1 + 784);
  if (v2)
  {
    *(void *)(a1 + 792) = v2;
    operator delete(v2);
  }
  sub_1DCB74BFC((uint64_t **)(a1 + 776), 0);

  DSPGraph::Box::~Box((DSPGraph::Box *)a1);
}

uint64_t sub_1DCB751C4@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void *)(result + 56);
  *a2 = *(void *)(result + 48);
  a2[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t sub_1DCB751E0()
{
  return 3;
}

double sub_1DCB751E8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)&double result = sub_1DCB592D8((DSPGraph::Graph **)(a1 + 48), a2).n128_u64[0];
  return result;
}

uint64_t sub_1DCB751F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1DCB59490((DSPGraph::Graph **)(a1 + 48), a2);
}

void sub_1DCB751FC(void *a1)
{
  sub_1DCB75234(a1);

  JUMPOUT(0x1E01A8C50);
}

void *sub_1DCB75234(void *a1)
{
  *a1 = &unk_1F37F6250;
  uint64_t v2 = (std::__shared_weak_count *)a1[9];
  if (v2) {
    sub_1DCB44254(v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)a1[7];
  if (v3) {
    sub_1DCB44254(v3);
  }
  *a1 = &unk_1F37F6290;
  sub_1DCB44990(a1 + 2);
  return a1;
}

void sub_1DCB75950(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v3 = [[SNVGGishLaughterModel alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_1DCB75C18(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  if (v12)
  {
    id v5 = a3;
    uint64_t v6 = [SNVGGishLaughterModelOutput alloc];
    uint64_t v7 = [v12 featureValueForName:@"output1"];
    uint64_t v8 = [v7 multiArrayValue];
    uint64_t v9 = [(SNVGGishLaughterModelOutput *)v6 initWithOutput1:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = *(void (**)(uint64_t, void, SNVGGishLaughterModelOutput *))(v10 + 16);
    uint64_t v9 = a3;
    v11(v10, 0, v9);
  }
}

void sub_1DCB75DF0(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  if (v12)
  {
    id v5 = a3;
    uint64_t v6 = [SNVGGishLaughterModelOutput alloc];
    uint64_t v7 = [v12 featureValueForName:@"output1"];
    uint64_t v8 = [v7 multiArrayValue];
    uint64_t v9 = [(SNVGGishLaughterModelOutput *)v6 initWithOutput1:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = *(void (**)(uint64_t, void, SNVGGishLaughterModelOutput *))(v10 + 16);
    uint64_t v9 = a3;
    v11(v10, 0, v9);
  }
}

void sub_1DCB767C4(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v3 = [[SNVGGishApplauseModel alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_1DCB76A8C(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  if (v12)
  {
    id v5 = a3;
    uint64_t v6 = [SNVGGishApplauseModelOutput alloc];
    uint64_t v7 = [v12 featureValueForName:@"output1"];
    uint64_t v8 = [v7 multiArrayValue];
    uint64_t v9 = [(SNVGGishApplauseModelOutput *)v6 initWithOutput1:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = *(void (**)(uint64_t, void, SNVGGishApplauseModelOutput *))(v10 + 16);
    uint64_t v9 = a3;
    v11(v10, 0, v9);
  }
}

void sub_1DCB76C64(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  if (v12)
  {
    id v5 = a3;
    uint64_t v6 = [SNVGGishApplauseModelOutput alloc];
    uint64_t v7 = [v12 featureValueForName:@"output1"];
    uint64_t v8 = [v7 multiArrayValue];
    uint64_t v9 = [(SNVGGishApplauseModelOutput *)v6 initWithOutput1:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = *(void (**)(uint64_t, void, SNVGGishApplauseModelOutput *))(v10 + 16);
    uint64_t v9 = a3;
    v11(v10, 0, v9);
  }
}

void sub_1DCB77638(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v3 = [[SNVGGishEmbeddingModel alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_1DCB77900(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  if (v12)
  {
    id v5 = a3;
    uint64_t v6 = [SNVGGishEmbeddingModelOutput alloc];
    uint64_t v7 = [v12 featureValueForName:@"output1"];
    uint64_t v8 = [v7 multiArrayValue];
    uint64_t v9 = [(SNVGGishEmbeddingModelOutput *)v6 initWithOutput1:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = *(void (**)(uint64_t, void, SNVGGishEmbeddingModelOutput *))(v10 + 16);
    uint64_t v9 = a3;
    v11(v10, 0, v9);
  }
}

void sub_1DCB77AD8(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  if (v12)
  {
    id v5 = a3;
    uint64_t v6 = [SNVGGishEmbeddingModelOutput alloc];
    uint64_t v7 = [v12 featureValueForName:@"output1"];
    uint64_t v8 = [v7 multiArrayValue];
    uint64_t v9 = [(SNVGGishEmbeddingModelOutput *)v6 initWithOutput1:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = *(void (**)(uint64_t, void, SNVGGishEmbeddingModelOutput *))(v10 + 16);
    uint64_t v9 = a3;
    v11(v10, 0, v9);
  }
}

void sub_1DCB784AC(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v3 = [[SNSoundPrintAEmbeddingModel alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_1DCB78774(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  if (v12)
  {
    id v5 = a3;
    uint64_t v6 = [SNSoundPrintAEmbeddingModelOutput alloc];
    uint64_t v7 = [v12 featureValueForName:@"637"];
    uint64_t v8 = [v7 multiArrayValue];
    uint64_t v9 = [(SNSoundPrintAEmbeddingModelOutput *)v6 initWith_637:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = *(void (**)(uint64_t, void, SNSoundPrintAEmbeddingModelOutput *))(v10 + 16);
    uint64_t v9 = a3;
    v11(v10, 0, v9);
  }
}

void sub_1DCB7894C(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  if (v12)
  {
    id v5 = a3;
    uint64_t v6 = [SNSoundPrintAEmbeddingModelOutput alloc];
    uint64_t v7 = [v12 featureValueForName:@"637"];
    uint64_t v8 = [v7 multiArrayValue];
    uint64_t v9 = [(SNSoundPrintAEmbeddingModelOutput *)v6 initWith_637:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = *(void (**)(uint64_t, void, SNSoundPrintAEmbeddingModelOutput *))(v10 + 16);
    uint64_t v9 = a3;
    v11(v10, 0, v9);
  }
}

void sub_1DCB79704(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v3 = [[SNSoundPrintASmokeAlarmModel alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_1DCB79AB8(uint64_t a1, void *a2, void *a3)
{
  id v21 = a2;
  if (v21)
  {
    id v20 = a3;
    id v5 = [SNSoundPrintASmokeAlarmModelOutput alloc];
    unsigned int v19 = [v21 featureValueForName:@"input_1"];
    uint64_t v6 = [v19 multiArrayValue];
    uint64_t v7 = [v21 featureValueForName:@"Confidence"];
    uint64_t v8 = [v7 multiArrayValue];
    uint64_t v9 = [v21 featureValueForName:@"Detected"];
    uint64_t v10 = [v9 multiArrayValue];
    int v11 = [v21 featureValueForName:@"thresholdedHistoryOut"];
    id v12 = [v11 multiArrayValue];
    [v21 featureValueForName:@"detectedHistoryOut"];
    int v13 = v18 = a1;
    int v14 = [v13 multiArrayValue];
    uint64_t v15 = [(SNSoundPrintASmokeAlarmModelOutput *)v5 initWithInput_1:v6 Confidence:v8 Detected:v10 thresholdedHistoryOut:v12 detectedHistoryOut:v14];

    (*(void (**)(void))(*(void *)(v18 + 32) + 16))();
  }
  else
  {
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = *(void (**)(uint64_t, void, SNSoundPrintASmokeAlarmModelOutput *))(v16 + 16);
    uint64_t v15 = a3;
    v17(v16, 0, v15);
  }
}

void sub_1DCB79D70(uint64_t a1, void *a2, void *a3)
{
  id v21 = a2;
  if (v21)
  {
    id v20 = a3;
    id v5 = [SNSoundPrintASmokeAlarmModelOutput alloc];
    unsigned int v19 = [v21 featureValueForName:@"input_1"];
    uint64_t v6 = [v19 multiArrayValue];
    uint64_t v7 = [v21 featureValueForName:@"Confidence"];
    uint64_t v8 = [v7 multiArrayValue];
    uint64_t v9 = [v21 featureValueForName:@"Detected"];
    uint64_t v10 = [v9 multiArrayValue];
    int v11 = [v21 featureValueForName:@"thresholdedHistoryOut"];
    id v12 = [v11 multiArrayValue];
    [v21 featureValueForName:@"detectedHistoryOut"];
    int v13 = v18 = a1;
    int v14 = [v13 multiArrayValue];
    uint64_t v15 = [(SNSoundPrintASmokeAlarmModelOutput *)v5 initWithInput_1:v6 Confidence:v8 Detected:v10 thresholdedHistoryOut:v12 detectedHistoryOut:v14];

    (*(void (**)(void))(*(void *)(v18 + 32) + 16))();
  }
  else
  {
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = *(void (**)(uint64_t, void, SNSoundPrintASmokeAlarmModelOutput *))(v16 + 16);
    uint64_t v15 = a3;
    v17(v16, 0, v15);
  }
}

void sub_1DCB7A94C(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v3 = [[SNLanguageAlignedAudioEncoder alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_1DCB7AC14(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  if (v12)
  {
    id v5 = a3;
    uint64_t v6 = [SNLanguageAlignedAudioEncoderOutput alloc];
    uint64_t v7 = [v12 featureValueForName:@"embedding"];
    uint64_t v8 = [v7 multiArrayValue];
    uint64_t v9 = [(SNLanguageAlignedAudioEncoderOutput *)v6 initWithEmbedding:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = *(void (**)(uint64_t, void, SNLanguageAlignedAudioEncoderOutput *))(v10 + 16);
    uint64_t v9 = a3;
    v11(v10, 0, v9);
  }
}

void sub_1DCB7ADEC(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  if (v12)
  {
    id v5 = a3;
    uint64_t v6 = [SNLanguageAlignedAudioEncoderOutput alloc];
    uint64_t v7 = [v12 featureValueForName:@"embedding"];
    uint64_t v8 = [v7 multiArrayValue];
    uint64_t v9 = [(SNLanguageAlignedAudioEncoderOutput *)v6 initWithEmbedding:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = *(void (**)(uint64_t, void, SNLanguageAlignedAudioEncoderOutput *))(v10 + 16);
    uint64_t v9 = a3;
    v11(v10, 0, v9);
  }
}

void sub_1DCB7B878(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v3 = [[SNSoundClassifierVersion1Model alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_1DCB7BB78(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    uint64_t v6 = [SNSoundClassifierVersion1ModelOutput alloc];
    uint64_t v7 = [v14 featureValueForName:@"9"];
    uint64_t v8 = [v7 dictionaryValue];
    uint64_t v9 = [v14 featureValueForName:@"classLabel"];
    uint64_t v10 = [v9 stringValue];
    int v11 = [(SNSoundClassifierVersion1ModelOutput *)v6 initWith_9:v8 classLabel:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    int v13 = *(void (**)(uint64_t, void, SNSoundClassifierVersion1ModelOutput *))(v12 + 16);
    int v11 = a3;
    v13(v12, 0, v11);
  }
}

void sub_1DCB7BD88(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    uint64_t v6 = [SNSoundClassifierVersion1ModelOutput alloc];
    uint64_t v7 = [v14 featureValueForName:@"9"];
    uint64_t v8 = [v7 dictionaryValue];
    uint64_t v9 = [v14 featureValueForName:@"classLabel"];
    uint64_t v10 = [v9 stringValue];
    int v11 = [(SNSoundClassifierVersion1ModelOutput *)v6 initWith_9:v8 classLabel:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    int v13 = *(void (**)(uint64_t, void, SNSoundClassifierVersion1ModelOutput *))(v12 + 16);
    int v11 = a3;
    v13(v12, 0, v11);
  }
}

void sub_1DCB7C7CC(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v3 = [[SNVGGishBabbleModel alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_1DCB7CA94(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  if (v12)
  {
    id v5 = a3;
    uint64_t v6 = [SNVGGishBabbleModelOutput alloc];
    uint64_t v7 = [v12 featureValueForName:@"output1"];
    uint64_t v8 = [v7 multiArrayValue];
    uint64_t v9 = [(SNVGGishBabbleModelOutput *)v6 initWithOutput1:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = *(void (**)(uint64_t, void, SNVGGishBabbleModelOutput *))(v10 + 16);
    uint64_t v9 = a3;
    v11(v10, 0, v9);
  }
}

void sub_1DCB7CC6C(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  if (v12)
  {
    id v5 = a3;
    uint64_t v6 = [SNVGGishBabbleModelOutput alloc];
    uint64_t v7 = [v12 featureValueForName:@"output1"];
    uint64_t v8 = [v7 multiArrayValue];
    uint64_t v9 = [(SNVGGishBabbleModelOutput *)v6 initWithOutput1:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = *(void (**)(uint64_t, void, SNVGGishBabbleModelOutput *))(v10 + 16);
    uint64_t v9 = a3;
    v11(v10, 0, v9);
  }
}

void sub_1DCB7D930(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v3 = [[SNSoundPrintAShoutingModel alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_1DCB7DCA0(uint64_t a1, void *a2, void *a3)
{
  id v18 = a2;
  if (v18)
  {
    id v17 = a3;
    id v5 = [SNSoundPrintAShoutingModelOutput alloc];
    uint64_t v6 = [v18 featureValueForName:@"input_1"];
    uint64_t v7 = [v6 multiArrayValue];
    uint64_t v8 = [v18 featureValueForName:@"Confidence"];
    uint64_t v9 = [v8 multiArrayValue];
    uint64_t v10 = [v18 featureValueForName:@"Detected"];
    int v11 = [v10 multiArrayValue];
    id v12 = [v18 featureValueForName:@"detectedHistoryOut"];
    int v13 = [v12 multiArrayValue];
    id v14 = [(SNSoundPrintAShoutingModelOutput *)v5 initWithInput_1:v7 Confidence:v9 Detected:v11 detectedHistoryOut:v13];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = *(void (**)(uint64_t, void, SNSoundPrintAShoutingModelOutput *))(v15 + 16);
    id v14 = a3;
    v16(v15, 0, v14);
  }
}

void sub_1DCB7DF1C(uint64_t a1, void *a2, void *a3)
{
  id v18 = a2;
  if (v18)
  {
    id v17 = a3;
    id v5 = [SNSoundPrintAShoutingModelOutput alloc];
    uint64_t v6 = [v18 featureValueForName:@"input_1"];
    uint64_t v7 = [v6 multiArrayValue];
    uint64_t v8 = [v18 featureValueForName:@"Confidence"];
    uint64_t v9 = [v8 multiArrayValue];
    uint64_t v10 = [v18 featureValueForName:@"Detected"];
    int v11 = [v10 multiArrayValue];
    id v12 = [v18 featureValueForName:@"detectedHistoryOut"];
    int v13 = [v12 multiArrayValue];
    id v14 = [(SNSoundPrintAShoutingModelOutput *)v5 initWithInput_1:v7 Confidence:v9 Detected:v11 detectedHistoryOut:v13];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = *(void (**)(uint64_t, void, SNSoundPrintAShoutingModelOutput *))(v15 + 16);
    id v14 = a3;
    v16(v15, 0, v14);
  }
}

void sub_1DCB7EB04(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v3 = [[SNLanguageAlignedAVFuserModel alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_1DCB7EDCC(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  if (v12)
  {
    id v5 = a3;
    uint64_t v6 = [SNLanguageAlignedAVFuserModelOutput alloc];
    uint64_t v7 = [v12 featureValueForName:@"fused_embedding"];
    uint64_t v8 = [v7 multiArrayValue];
    uint64_t v9 = [(SNLanguageAlignedAVFuserModelOutput *)v6 initWithFused_embedding:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = *(void (**)(uint64_t, void, SNLanguageAlignedAVFuserModelOutput *))(v10 + 16);
    uint64_t v9 = a3;
    v11(v10, 0, v9);
  }
}

void sub_1DCB7EFA4(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  if (v12)
  {
    id v5 = a3;
    uint64_t v6 = [SNLanguageAlignedAVFuserModelOutput alloc];
    uint64_t v7 = [v12 featureValueForName:@"fused_embedding"];
    uint64_t v8 = [v7 multiArrayValue];
    uint64_t v9 = [(SNLanguageAlignedAVFuserModelOutput *)v6 initWithFused_embedding:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = *(void (**)(uint64_t, void, SNLanguageAlignedAVFuserModelOutput *))(v10 + 16);
    uint64_t v9 = a3;
    v11(v10, 0, v9);
  }
}

void sub_1DCB7FC84(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v3 = [[SNSoundPrintASpeechModel alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_1DCB7FFF4(uint64_t a1, void *a2, void *a3)
{
  id v18 = a2;
  if (v18)
  {
    id v17 = a3;
    id v5 = [SNSoundPrintASpeechModelOutput alloc];
    uint64_t v6 = [v18 featureValueForName:@"input_1"];
    uint64_t v7 = [v6 multiArrayValue];
    uint64_t v8 = [v18 featureValueForName:@"Confidence"];
    uint64_t v9 = [v8 multiArrayValue];
    uint64_t v10 = [v18 featureValueForName:@"Detected"];
    int v11 = [v10 multiArrayValue];
    id v12 = [v18 featureValueForName:@"detectedHistoryOut"];
    int v13 = [v12 multiArrayValue];
    id v14 = [(SNSoundPrintASpeechModelOutput *)v5 initWithInput_1:v7 Confidence:v9 Detected:v11 detectedHistoryOut:v13];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = *(void (**)(uint64_t, void, SNSoundPrintASpeechModelOutput *))(v15 + 16);
    id v14 = a3;
    v16(v15, 0, v14);
  }
}

void sub_1DCB80270(uint64_t a1, void *a2, void *a3)
{
  id v18 = a2;
  if (v18)
  {
    id v17 = a3;
    id v5 = [SNSoundPrintASpeechModelOutput alloc];
    uint64_t v6 = [v18 featureValueForName:@"input_1"];
    uint64_t v7 = [v6 multiArrayValue];
    uint64_t v8 = [v18 featureValueForName:@"Confidence"];
    uint64_t v9 = [v8 multiArrayValue];
    uint64_t v10 = [v18 featureValueForName:@"Detected"];
    int v11 = [v10 multiArrayValue];
    id v12 = [v18 featureValueForName:@"detectedHistoryOut"];
    int v13 = [v12 multiArrayValue];
    id v14 = [(SNSoundPrintASpeechModelOutput *)v5 initWithInput_1:v7 Confidence:v9 Detected:v11 detectedHistoryOut:v13];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = *(void (**)(uint64_t, void, SNSoundPrintASpeechModelOutput *))(v15 + 16);
    id v14 = a3;
    v16(v15, 0, v14);
  }
}

void sub_1DCB80DB8(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v3 = [[SNVGGishSpeechModel alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_1DCB81080(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  if (v12)
  {
    id v5 = a3;
    uint64_t v6 = [SNVGGishSpeechModelOutput alloc];
    uint64_t v7 = [v12 featureValueForName:@"output1"];
    uint64_t v8 = [v7 multiArrayValue];
    uint64_t v9 = [(SNVGGishSpeechModelOutput *)v6 initWithOutput1:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = *(void (**)(uint64_t, void, SNVGGishSpeechModelOutput *))(v10 + 16);
    uint64_t v9 = a3;
    v11(v10, 0, v9);
  }
}

void sub_1DCB81258(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  if (v12)
  {
    id v5 = a3;
    uint64_t v6 = [SNVGGishSpeechModelOutput alloc];
    uint64_t v7 = [v12 featureValueForName:@"output1"];
    uint64_t v8 = [v7 multiArrayValue];
    uint64_t v9 = [(SNVGGishSpeechModelOutput *)v6 initWithOutput1:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = *(void (**)(uint64_t, void, SNVGGishSpeechModelOutput *))(v10 + 16);
    uint64_t v9 = a3;
    v11(v10, 0, v9);
  }
}

void sub_1DCB81F1C(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v3 = [[SNSoundPrintALaughterModel alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_1DCB8228C(uint64_t a1, void *a2, void *a3)
{
  id v18 = a2;
  if (v18)
  {
    id v17 = a3;
    id v5 = [SNSoundPrintALaughterModelOutput alloc];
    uint64_t v6 = [v18 featureValueForName:@"input_1"];
    uint64_t v7 = [v6 multiArrayValue];
    uint64_t v8 = [v18 featureValueForName:@"Confidence"];
    uint64_t v9 = [v8 multiArrayValue];
    uint64_t v10 = [v18 featureValueForName:@"Detected"];
    int v11 = [v10 multiArrayValue];
    id v12 = [v18 featureValueForName:@"detectedHistoryOut"];
    int v13 = [v12 multiArrayValue];
    id v14 = [(SNSoundPrintALaughterModelOutput *)v5 initWithInput_1:v7 Confidence:v9 Detected:v11 detectedHistoryOut:v13];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = *(void (**)(uint64_t, void, SNSoundPrintALaughterModelOutput *))(v15 + 16);
    id v14 = a3;
    v16(v15, 0, v14);
  }
}

void sub_1DCB82508(uint64_t a1, void *a2, void *a3)
{
  id v18 = a2;
  if (v18)
  {
    id v17 = a3;
    id v5 = [SNSoundPrintALaughterModelOutput alloc];
    uint64_t v6 = [v18 featureValueForName:@"input_1"];
    uint64_t v7 = [v6 multiArrayValue];
    uint64_t v8 = [v18 featureValueForName:@"Confidence"];
    uint64_t v9 = [v8 multiArrayValue];
    uint64_t v10 = [v18 featureValueForName:@"Detected"];
    int v11 = [v10 multiArrayValue];
    id v12 = [v18 featureValueForName:@"detectedHistoryOut"];
    int v13 = [v12 multiArrayValue];
    id v14 = [(SNSoundPrintALaughterModelOutput *)v5 initWithInput_1:v7 Confidence:v9 Detected:v11 detectedHistoryOut:v13];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = *(void (**)(uint64_t, void, SNSoundPrintALaughterModelOutput *))(v15 + 16);
    id v14 = a3;
    v16(v15, 0, v14);
  }
}

void sub_1DCB830F0(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v3 = [[SNSoundPrintKEmbeddingModel alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_1DCB833F0(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    uint64_t v6 = [SNSoundPrintKEmbeddingModelOutput alloc];
    uint64_t v7 = [v14 featureValueForName:@"fixedLengthEmbedding"];
    uint64_t v8 = [v7 multiArrayValue];
    uint64_t v9 = [v14 featureValueForName:@"framewiseEmbedding"];
    uint64_t v10 = [v9 multiArrayValue];
    int v11 = [(SNSoundPrintKEmbeddingModelOutput *)v6 initWithFixedLengthEmbedding:v8 framewiseEmbedding:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    int v13 = *(void (**)(uint64_t, void, SNSoundPrintKEmbeddingModelOutput *))(v12 + 16);
    int v11 = a3;
    v13(v12, 0, v11);
  }
}

void sub_1DCB83600(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    uint64_t v6 = [SNSoundPrintKEmbeddingModelOutput alloc];
    uint64_t v7 = [v14 featureValueForName:@"fixedLengthEmbedding"];
    uint64_t v8 = [v7 multiArrayValue];
    uint64_t v9 = [v14 featureValueForName:@"framewiseEmbedding"];
    uint64_t v10 = [v9 multiArrayValue];
    int v11 = [(SNSoundPrintKEmbeddingModelOutput *)v6 initWithFixedLengthEmbedding:v8 framewiseEmbedding:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    int v13 = *(void (**)(uint64_t, void, SNSoundPrintKEmbeddingModelOutput *))(v12 + 16);
    int v11 = a3;
    v13(v12, 0, v11);
  }
}

void sub_1DCB84044(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v3 = [[SNVGGishMusicModel alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_1DCB8430C(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  if (v12)
  {
    id v5 = a3;
    uint64_t v6 = [SNVGGishMusicModelOutput alloc];
    uint64_t v7 = [v12 featureValueForName:@"output1"];
    uint64_t v8 = [v7 multiArrayValue];
    uint64_t v9 = [(SNVGGishMusicModelOutput *)v6 initWithOutput1:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = *(void (**)(uint64_t, void, SNVGGishMusicModelOutput *))(v10 + 16);
    uint64_t v9 = a3;
    v11(v10, 0, v9);
  }
}

void sub_1DCB844E4(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  if (v12)
  {
    id v5 = a3;
    uint64_t v6 = [SNVGGishMusicModelOutput alloc];
    uint64_t v7 = [v12 featureValueForName:@"output1"];
    uint64_t v8 = [v7 multiArrayValue];
    uint64_t v9 = [(SNVGGishMusicModelOutput *)v6 initWithOutput1:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = *(void (**)(uint64_t, void, SNVGGishMusicModelOutput *))(v10 + 16);
    uint64_t v9 = a3;
    v11(v10, 0, v9);
  }
}

void sub_1DCB84EB8(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v3 = [[SNVGGishCheeringModel alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_1DCB85180(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  if (v12)
  {
    id v5 = a3;
    uint64_t v6 = [SNVGGishCheeringModelOutput alloc];
    uint64_t v7 = [v12 featureValueForName:@"output1"];
    uint64_t v8 = [v7 multiArrayValue];
    uint64_t v9 = [(SNVGGishCheeringModelOutput *)v6 initWithOutput1:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = *(void (**)(uint64_t, void, SNVGGishCheeringModelOutput *))(v10 + 16);
    uint64_t v9 = a3;
    v11(v10, 0, v9);
  }
}

void sub_1DCB85358(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  if (v12)
  {
    id v5 = a3;
    uint64_t v6 = [SNVGGishCheeringModelOutput alloc];
    uint64_t v7 = [v12 featureValueForName:@"output1"];
    uint64_t v8 = [v7 multiArrayValue];
    uint64_t v9 = [(SNVGGishCheeringModelOutput *)v6 initWithOutput1:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = *(void (**)(uint64_t, void, SNVGGishCheeringModelOutput *))(v10 + 16);
    uint64_t v9 = a3;
    v11(v10, 0, v9);
  }
}

void sub_1DCB85DE4(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v3 = [[SNAudioQualityModel alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_1DCB860E4(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    uint64_t v6 = [SNAudioQualityModelOutput alloc];
    uint64_t v7 = [v14 featureValueForName:@"final_output"];
    uint64_t v8 = [v7 dictionaryValue];
    uint64_t v9 = [v14 featureValueForName:@"classLabel"];
    uint64_t v10 = [v9 stringValue];
    int v11 = [(SNAudioQualityModelOutput *)v6 initWithFinal_output:v8 classLabel:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    int v13 = *(void (**)(uint64_t, void, SNAudioQualityModelOutput *))(v12 + 16);
    int v11 = a3;
    v13(v12, 0, v11);
  }
}

void sub_1DCB862F4(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    uint64_t v6 = [SNAudioQualityModelOutput alloc];
    uint64_t v7 = [v14 featureValueForName:@"final_output"];
    uint64_t v8 = [v7 dictionaryValue];
    uint64_t v9 = [v14 featureValueForName:@"classLabel"];
    uint64_t v10 = [v9 stringValue];
    int v11 = [(SNAudioQualityModelOutput *)v6 initWithFinal_output:v8 classLabel:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    int v13 = *(void (**)(uint64_t, void, SNAudioQualityModelOutput *))(v12 + 16);
    int v11 = a3;
    v13(v12, 0, v11);
  }
}

uint64_t sub_1DCB86698()
{
  return MEMORY[0x1F4182DD0]();
}

uint64_t sub_1DCB866A8()
{
  return MEMORY[0x1F4182DD8]();
}

uint64_t sub_1DCB866B8()
{
  return MEMORY[0x1F40E2E68]();
}

uint64_t sub_1DCB866C8()
{
  return MEMORY[0x1F40E2E88]();
}

uint64_t sub_1DCB866D8()
{
  return MEMORY[0x1F40E2EA8]();
}

uint64_t sub_1DCB866E8()
{
  return MEMORY[0x1F40E2EE8]();
}

uint64_t sub_1DCB866F8()
{
  return MEMORY[0x1F40E2F50]();
}

uint64_t sub_1DCB86708()
{
  return MEMORY[0x1F40E2F60]();
}

uint64_t sub_1DCB86718()
{
  return MEMORY[0x1F40E3038]();
}

uint64_t sub_1DCB86728()
{
  return MEMORY[0x1F40E3060]();
}

uint64_t sub_1DCB86738()
{
  return MEMORY[0x1F40E3070]();
}

uint64_t sub_1DCB86748()
{
  return MEMORY[0x1F40E3098]();
}

uint64_t sub_1DCB86758()
{
  return MEMORY[0x1F40E30A8]();
}

uint64_t sub_1DCB86768()
{
  return MEMORY[0x1F40E30C0]();
}

uint64_t sub_1DCB86778()
{
  return MEMORY[0x1F40E3128]();
}

uint64_t sub_1DCB86788()
{
  return MEMORY[0x1F40E3150]();
}

uint64_t sub_1DCB86798()
{
  return MEMORY[0x1F40E3160]();
}

uint64_t sub_1DCB867A8()
{
  return MEMORY[0x1F40E3368]();
}

uint64_t sub_1DCB867B8()
{
  return MEMORY[0x1F40E3420]();
}

uint64_t sub_1DCB867C8()
{
  return MEMORY[0x1F40E37C0]();
}

uint64_t sub_1DCB867D8()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_1DCB867E8()
{
  return MEMORY[0x1F40E37F0]();
}

uint64_t sub_1DCB867F8()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_1DCB86808()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_1DCB86818()
{
  return MEMORY[0x1F40E3830]();
}

uint64_t sub_1DCB86828()
{
  return MEMORY[0x1F40E41E0]();
}

uint64_t sub_1DCB86838()
{
  return MEMORY[0x1F40E4210]();
}

uint64_t sub_1DCB86848()
{
  return MEMORY[0x1F40E4220]();
}

uint64_t sub_1DCB86858()
{
  return MEMORY[0x1F40E4240]();
}

uint64_t sub_1DCB86868()
{
  return MEMORY[0x1F40E4260]();
}

uint64_t sub_1DCB86878()
{
  return MEMORY[0x1F40E4270]();
}

uint64_t sub_1DCB86888()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1DCB86898()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1DCB868A8()
{
  return MEMORY[0x1F40E46D0]();
}

uint64_t sub_1DCB868B8()
{
  return MEMORY[0x1F40E4898]();
}

uint64_t sub_1DCB868C8()
{
  return MEMORY[0x1F40E48A0]();
}

uint64_t sub_1DCB868D8()
{
  return MEMORY[0x1F40E48D8]();
}

uint64_t sub_1DCB868E8()
{
  return MEMORY[0x1F40E48E8]();
}

uint64_t sub_1DCB868F8()
{
  return MEMORY[0x1F40E4908]();
}

uint64_t sub_1DCB86908()
{
  return MEMORY[0x1F40E4920]();
}

uint64_t sub_1DCB86918()
{
  return MEMORY[0x1F40E4930]();
}

uint64_t sub_1DCB86928()
{
  return MEMORY[0x1F40E4938]();
}

uint64_t sub_1DCB86938()
{
  return MEMORY[0x1F40E4970]();
}

uint64_t sub_1DCB86948()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1DCB86958()
{
  return MEMORY[0x1F40E49D0]();
}

uint64_t sub_1DCB86968()
{
  return MEMORY[0x1F40E49E8]();
}

uint64_t sub_1DCB86978()
{
  return MEMORY[0x1F40E49F8]();
}

uint64_t sub_1DCB86988()
{
  return MEMORY[0x1F40E4A18]();
}

uint64_t sub_1DCB86998()
{
  return MEMORY[0x1F40E4A28]();
}

uint64_t sub_1DCB869A8()
{
  return MEMORY[0x1F40E4A50]();
}

uint64_t sub_1DCB869B8()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1DCB869C8()
{
  return MEMORY[0x1F40E4AA8]();
}

uint64_t sub_1DCB869D8()
{
  return MEMORY[0x1F40E4AC0]();
}

uint64_t sub_1DCB869E8()
{
  return MEMORY[0x1F40E4B20]();
}

uint64_t sub_1DCB869F8()
{
  return MEMORY[0x1F40E4B58]();
}

uint64_t sub_1DCB86A08()
{
  return MEMORY[0x1F40E4B68]();
}

uint64_t sub_1DCB86A18()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1DCB86A28()
{
  return MEMORY[0x1F40E4BB0]();
}

uint64_t sub_1DCB86A38()
{
  return MEMORY[0x1F40E4BC8]();
}

uint64_t sub_1DCB86A48()
{
  return MEMORY[0x1F40E4BD8]();
}

uint64_t sub_1DCB86A58()
{
  return MEMORY[0x1F40E4BE0]();
}

uint64_t sub_1DCB86A68()
{
  return MEMORY[0x1F40E4C18]();
}

uint64_t sub_1DCB86A78()
{
  return MEMORY[0x1F40E4C48]();
}

uint64_t sub_1DCB86A88()
{
  return MEMORY[0x1F40E4CD8]();
}

uint64_t sub_1DCB86A98()
{
  return MEMORY[0x1F40E4CF8]();
}

uint64_t sub_1DCB86AA8()
{
  return MEMORY[0x1F40E4D30]();
}

uint64_t sub_1DCB86AB8()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1DCB86AC8()
{
  return MEMORY[0x1F40E4D58]();
}

uint64_t sub_1DCB86AD8()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1DCB86AE8()
{
  return MEMORY[0x1F40E4DE8]();
}

uint64_t sub_1DCB86AF8()
{
  return MEMORY[0x1F40E4DF0]();
}

uint64_t sub_1DCB86B08()
{
  return MEMORY[0x1F40E4E10]();
}

uint64_t sub_1DCB86B18()
{
  return MEMORY[0x1F40E4E60]();
}

uint64_t sub_1DCB86B28()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1DCB86B38()
{
  return MEMORY[0x1F40E51D8]();
}

uint64_t sub_1DCB86B48()
{
  return MEMORY[0x1F40E51F0]();
}

uint64_t sub_1DCB86B58()
{
  return MEMORY[0x1F40E52A0]();
}

uint64_t sub_1DCB86B68()
{
  return MEMORY[0x1F40E52C0]();
}

uint64_t sub_1DCB86B78()
{
  return MEMORY[0x1F40E52F0]();
}

uint64_t sub_1DCB86B88()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1DCB86B98()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1DCB86BA8()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1DCB86BB8()
{
  return MEMORY[0x1F40E53E8]();
}

uint64_t sub_1DCB86BC8()
{
  return MEMORY[0x1F40E5418]();
}

uint64_t sub_1DCB86BD8()
{
  return MEMORY[0x1F40E5428]();
}

uint64_t sub_1DCB86BE8()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1DCB86BF8()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1DCB86C08()
{
  return MEMORY[0x1F40E5500]();
}

uint64_t sub_1DCB86C18()
{
  return MEMORY[0x1F40E5648]();
}

uint64_t sub_1DCB86C28()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1DCB86C38()
{
  return MEMORY[0x1F40E5CC0]();
}

uint64_t sub_1DCB86C48()
{
  return MEMORY[0x1F40E5D28]();
}

uint64_t sub_1DCB86C58()
{
  return MEMORY[0x1F40E5D70]();
}

uint64_t sub_1DCB86C68()
{
  return MEMORY[0x1F4182DA0]();
}

uint64_t sub_1DCB86C78()
{
  return MEMORY[0x1F4119150]();
}

uint64_t sub_1DCB86C88()
{
  return MEMORY[0x1F4188358]();
}

uint64_t sub_1DCB86C98()
{
  return MEMORY[0x1F41883B8]();
}

uint64_t sub_1DCB86CA8()
{
  return MEMORY[0x1F412C208]();
}

uint64_t sub_1DCB86CB8()
{
  return MEMORY[0x1F412C210]();
}

uint64_t sub_1DCB86CC8()
{
  return MEMORY[0x1F412C218]();
}

uint64_t sub_1DCB86CD8()
{
  return MEMORY[0x1F412C220]();
}

uint64_t sub_1DCB86CE8()
{
  return MEMORY[0x1F412C228]();
}

uint64_t sub_1DCB86CF8()
{
  return MEMORY[0x1F412C230]();
}

uint64_t sub_1DCB86D08()
{
  return MEMORY[0x1F412C238]();
}

uint64_t sub_1DCB86D18()
{
  return MEMORY[0x1F412C240]();
}

uint64_t sub_1DCB86D28()
{
  return MEMORY[0x1F412C248]();
}

uint64_t sub_1DCB86D38()
{
  return MEMORY[0x1F412C250]();
}

uint64_t sub_1DCB86D48()
{
  return MEMORY[0x1F412C258]();
}

uint64_t sub_1DCB86D58()
{
  return MEMORY[0x1F412C260]();
}

uint64_t sub_1DCB86D68()
{
  return MEMORY[0x1F412C268]();
}

uint64_t sub_1DCB86D78()
{
  return MEMORY[0x1F412C270]();
}

uint64_t sub_1DCB86D88()
{
  return MEMORY[0x1F412C278]();
}

uint64_t sub_1DCB86D98()
{
  return MEMORY[0x1F412C280]();
}

uint64_t sub_1DCB86DA8()
{
  return MEMORY[0x1F412C288]();
}

uint64_t sub_1DCB86DB8()
{
  return MEMORY[0x1F412C290]();
}

uint64_t sub_1DCB86DC8()
{
  return MEMORY[0x1F412C298]();
}

uint64_t sub_1DCB86DD8()
{
  return MEMORY[0x1F412C2A0]();
}

uint64_t sub_1DCB86DE8()
{
  return MEMORY[0x1F412C2A8]();
}

uint64_t sub_1DCB86DF8()
{
  return MEMORY[0x1F412C2B0]();
}

uint64_t sub_1DCB86E08()
{
  return MEMORY[0x1F412C2B8]();
}

uint64_t sub_1DCB86E18()
{
  return MEMORY[0x1F412C2C0]();
}

uint64_t sub_1DCB86E28()
{
  return MEMORY[0x1F412C2C8]();
}

uint64_t sub_1DCB86E38()
{
  return MEMORY[0x1F412C2D0]();
}

uint64_t sub_1DCB86E48()
{
  return MEMORY[0x1F412C2D8]();
}

uint64_t sub_1DCB86E58()
{
  return MEMORY[0x1F412C2E0]();
}

uint64_t sub_1DCB86E68()
{
  return MEMORY[0x1F412C2E8]();
}

uint64_t sub_1DCB86E78()
{
  return MEMORY[0x1F412C2F0]();
}

uint64_t sub_1DCB86E88()
{
  return MEMORY[0x1F412C2F8]();
}

uint64_t sub_1DCB86E98()
{
  return MEMORY[0x1F412C300]();
}

uint64_t sub_1DCB86EA8()
{
  return MEMORY[0x1F412C308]();
}

uint64_t sub_1DCB86EB8()
{
  return MEMORY[0x1F412C310]();
}

uint64_t sub_1DCB86EC8()
{
  return MEMORY[0x1F412C318]();
}

uint64_t sub_1DCB86ED8()
{
  return MEMORY[0x1F412C320]();
}

uint64_t sub_1DCB86EE8()
{
  return MEMORY[0x1F412C328]();
}

uint64_t sub_1DCB86EF8()
{
  return MEMORY[0x1F412C330]();
}

uint64_t sub_1DCB86F08()
{
  return MEMORY[0x1F412C338]();
}

uint64_t sub_1DCB86F18()
{
  return MEMORY[0x1F4188570]();
}

uint64_t sub_1DCB86F28()
{
  return MEMORY[0x1F4188578]();
}

uint64_t sub_1DCB86F38()
{
  return MEMORY[0x1F4188580]();
}

uint64_t sub_1DCB86F48()
{
  return MEMORY[0x1F41885B0]();
}

uint64_t sub_1DCB86F58()
{
  return MEMORY[0x1F41885B8]();
}

uint64_t sub_1DCB86F68()
{
  return MEMORY[0x1F41885D0]();
}

uint64_t sub_1DCB86F78()
{
  return MEMORY[0x1F41885E0]();
}

uint64_t sub_1DCB86F88()
{
  return MEMORY[0x1F4188650]();
}

uint64_t sub_1DCB86F98()
{
  return MEMORY[0x1F4188658]();
}

uint64_t sub_1DCB86FA8()
{
  return MEMORY[0x1F4188660]();
}

uint64_t sub_1DCB86FB8()
{
  return MEMORY[0x1F4188668]();
}

uint64_t sub_1DCB86FC8()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1DCB86FD8()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1DCB86FE8()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1DCB86FF8()
{
  return MEMORY[0x1F40DB6B0]();
}

uint64_t sub_1DCB87008()
{
  return MEMORY[0x1F40DB6B8]();
}

uint64_t sub_1DCB87018()
{
  return MEMORY[0x1F40DB6C0]();
}

uint64_t sub_1DCB87028()
{
  return MEMORY[0x1F40DB6C8]();
}

uint64_t sub_1DCB87038()
{
  return MEMORY[0x1F40DB6D0]();
}

uint64_t sub_1DCB87048()
{
  return MEMORY[0x1F40DB6E0]();
}

uint64_t sub_1DCB87058()
{
  return MEMORY[0x1F40DB718]();
}

uint64_t sub_1DCB87068()
{
  return MEMORY[0x1F4186B80]();
}

uint64_t sub_1DCB87078()
{
  return MEMORY[0x1F41884A8]();
}

uint64_t sub_1DCB87088()
{
  return MEMORY[0x1F4186BA0]();
}

uint64_t sub_1DCB87098()
{
  return MEMORY[0x1F40D65E8]();
}

uint64_t sub_1DCB870A8()
{
  return MEMORY[0x1F40D66C8]();
}

uint64_t sub_1DCB870B8()
{
  return MEMORY[0x1F40D66E8]();
}

uint64_t sub_1DCB870C8()
{
  return MEMORY[0x1F40D6710]();
}

uint64_t sub_1DCB870D8()
{
  return MEMORY[0x1F40D6718]();
}

uint64_t sub_1DCB870E8()
{
  return MEMORY[0x1F40D6728]();
}

uint64_t sub_1DCB870F8()
{
  return MEMORY[0x1F40D6768]();
}

uint64_t sub_1DCB87108()
{
  return MEMORY[0x1F40D67B0]();
}

uint64_t sub_1DCB87118()
{
  return MEMORY[0x1F40D67C0]();
}

uint64_t sub_1DCB87128()
{
  return MEMORY[0x1F40D67D8]();
}

uint64_t sub_1DCB87138()
{
  return MEMORY[0x1F40D67E0]();
}

uint64_t sub_1DCB87148()
{
  return MEMORY[0x1F40D67E8]();
}

uint64_t sub_1DCB87158()
{
  return MEMORY[0x1F40D67F8]();
}

uint64_t sub_1DCB87168()
{
  return MEMORY[0x1F40D6818]();
}

uint64_t sub_1DCB87178()
{
  return MEMORY[0x1F40D6820]();
}

uint64_t sub_1DCB87188()
{
  return MEMORY[0x1F40D6850]();
}

uint64_t sub_1DCB87198()
{
  return MEMORY[0x1F40D68A8]();
}

uint64_t sub_1DCB871A8()
{
  return MEMORY[0x1F40D68B0]();
}

uint64_t sub_1DCB871B8()
{
  return MEMORY[0x1F40D68B8]();
}

uint64_t sub_1DCB871C8()
{
  return MEMORY[0x1F40D68C8]();
}

uint64_t sub_1DCB871D8()
{
  return MEMORY[0x1F40D68E0]();
}

uint64_t sub_1DCB871E8()
{
  return MEMORY[0x1F40D68F0]();
}

uint64_t sub_1DCB871F8()
{
  return MEMORY[0x1F40D68F8]();
}

uint64_t sub_1DCB87208()
{
  return MEMORY[0x1F40D6900]();
}

uint64_t sub_1DCB87218()
{
  return MEMORY[0x1F40D6908]();
}

uint64_t sub_1DCB87238()
{
  return MEMORY[0x1F40D6918]();
}

uint64_t sub_1DCB87248()
{
  return MEMORY[0x1F40D6928]();
}

uint64_t sub_1DCB87258()
{
  return MEMORY[0x1F40D6938]();
}

uint64_t sub_1DCB87268()
{
  return MEMORY[0x1F40D6950]();
}

uint64_t sub_1DCB87278()
{
  return MEMORY[0x1F40D6960]();
}

uint64_t sub_1DCB87288()
{
  return MEMORY[0x1F40D6A00]();
}

uint64_t sub_1DCB87298()
{
  return MEMORY[0x1F40D6A08]();
}

uint64_t sub_1DCB872A8()
{
  return MEMORY[0x1F40D6A18]();
}

uint64_t sub_1DCB872B8()
{
  return MEMORY[0x1F40D6A20]();
}

uint64_t sub_1DCB872C8()
{
  return MEMORY[0x1F40D6A28]();
}

uint64_t sub_1DCB872D8()
{
  return MEMORY[0x1F40D6A30]();
}

uint64_t sub_1DCB872E8()
{
  return MEMORY[0x1F40D6A40]();
}

uint64_t sub_1DCB872F8()
{
  return MEMORY[0x1F40D6A78]();
}

uint64_t sub_1DCB87308()
{
  return MEMORY[0x1F40D6AF0]();
}

uint64_t sub_1DCB87318()
{
  return MEMORY[0x1F40D6B10]();
}

uint64_t sub_1DCB87328()
{
  return MEMORY[0x1F40D6B18]();
}

uint64_t sub_1DCB87338()
{
  return MEMORY[0x1F40D6B50]();
}

uint64_t sub_1DCB87348()
{
  return MEMORY[0x1F40D6B58]();
}

uint64_t sub_1DCB87358()
{
  return MEMORY[0x1F40D6B60]();
}

uint64_t sub_1DCB87368()
{
  return MEMORY[0x1F40D6B68]();
}

uint64_t sub_1DCB87378()
{
  return MEMORY[0x1F40D6B70]();
}

uint64_t sub_1DCB87388()
{
  return MEMORY[0x1F40D6BC0]();
}

uint64_t sub_1DCB87398()
{
  return MEMORY[0x1F40D6BD0]();
}

uint64_t sub_1DCB873A8()
{
  return MEMORY[0x1F40D6BD8]();
}

uint64_t sub_1DCB873B8()
{
  return MEMORY[0x1F40D6BE0]();
}

uint64_t sub_1DCB873C8()
{
  return MEMORY[0x1F40D6BE8]();
}

uint64_t sub_1DCB873D8()
{
  return MEMORY[0x1F40D6C50]();
}

uint64_t sub_1DCB873E8()
{
  return MEMORY[0x1F40D6C70]();
}

uint64_t sub_1DCB873F8()
{
  return MEMORY[0x1F40D6C78]();
}

uint64_t sub_1DCB87408()
{
  return MEMORY[0x1F40D6C80]();
}

uint64_t sub_1DCB87418()
{
  return MEMORY[0x1F40D6C88]();
}

uint64_t sub_1DCB87428()
{
  return MEMORY[0x1F40D6C98]();
}

uint64_t sub_1DCB87438()
{
  return MEMORY[0x1F40D6CA0]();
}

uint64_t sub_1DCB87448()
{
  return MEMORY[0x1F40D6CC8]();
}

uint64_t sub_1DCB87458()
{
  return MEMORY[0x1F40D6CE0]();
}

uint64_t sub_1DCB87468()
{
  return MEMORY[0x1F40D6CF8]();
}

uint64_t sub_1DCB87478()
{
  return MEMORY[0x1F40D6D08]();
}

uint64_t sub_1DCB87488()
{
  return MEMORY[0x1F40D6D10]();
}

uint64_t sub_1DCB87498()
{
  return MEMORY[0x1F40D6D18]();
}

uint64_t sub_1DCB874A8()
{
  return MEMORY[0x1F40D6D30]();
}

uint64_t sub_1DCB874B8()
{
  return MEMORY[0x1F40D6D38]();
}

uint64_t sub_1DCB874C8()
{
  return MEMORY[0x1F40D6D40]();
}

uint64_t sub_1DCB874D8()
{
  return MEMORY[0x1F40D6D58]();
}

uint64_t sub_1DCB874E8()
{
  return MEMORY[0x1F40D6D68]();
}

uint64_t sub_1DCB874F8()
{
  return MEMORY[0x1F40D6D70]();
}

uint64_t sub_1DCB87508()
{
  return MEMORY[0x1F40D6D98]();
}

uint64_t sub_1DCB87518()
{
  return MEMORY[0x1F40D6DE0]();
}

uint64_t sub_1DCB87528()
{
  return MEMORY[0x1F40D6DE8]();
}

uint64_t sub_1DCB87538()
{
  return MEMORY[0x1F40D6DF0]();
}

uint64_t sub_1DCB87548()
{
  return MEMORY[0x1F40D6E08]();
}

uint64_t sub_1DCB87558()
{
  return MEMORY[0x1F40D6E18]();
}

uint64_t sub_1DCB87568()
{
  return MEMORY[0x1F4186C60]();
}

uint64_t sub_1DCB87578()
{
  return MEMORY[0x1F4186C78]();
}

uint64_t sub_1DCB87588()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1DCB87598()
{
  return MEMORY[0x1F4186CE0]();
}

uint64_t sub_1DCB875A8()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1DCB875B8()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1DCB875C8()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t sub_1DCB875D8()
{
  return MEMORY[0x1F4186E38]();
}

uint64_t sub_1DCB875E8()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_1DCB875F8()
{
  return MEMORY[0x1F41868F8]();
}

uint64_t sub_1DCB87608()
{
  return MEMORY[0x1F4186900]();
}

uint64_t sub_1DCB87618()
{
  return MEMORY[0x1F4186908]();
}

uint64_t sub_1DCB87628()
{
  return MEMORY[0x1F4164070]();
}

uint64_t sub_1DCB87638()
{
  return MEMORY[0x1F4164078]();
}

uint64_t sub_1DCB87648()
{
  return MEMORY[0x1F4164080]();
}

uint64_t sub_1DCB87658()
{
  return MEMORY[0x1F4164088]();
}

uint64_t sub_1DCB87668()
{
  return MEMORY[0x1F4164090]();
}

uint64_t sub_1DCB87678()
{
  return MEMORY[0x1F4164098]();
}

uint64_t sub_1DCB87688()
{
  return MEMORY[0x1F41640A0]();
}

uint64_t sub_1DCB87698()
{
  return MEMORY[0x1F41640A8]();
}

uint64_t sub_1DCB876A8()
{
  return MEMORY[0x1F41640B0]();
}

uint64_t sub_1DCB876B8()
{
  return MEMORY[0x1F41640B8]();
}

uint64_t sub_1DCB876C8()
{
  return MEMORY[0x1F41640C0]();
}

uint64_t sub_1DCB876D8()
{
  return MEMORY[0x1F41640C8]();
}

uint64_t sub_1DCB876E8()
{
  return MEMORY[0x1F41640D0]();
}

uint64_t sub_1DCB876F8()
{
  return MEMORY[0x1F41640D8]();
}

uint64_t sub_1DCB87708()
{
  return MEMORY[0x1F41640E0]();
}

uint64_t sub_1DCB87718()
{
  return MEMORY[0x1F41640E8]();
}

uint64_t sub_1DCB87728()
{
  return MEMORY[0x1F41640F0]();
}

uint64_t sub_1DCB87738()
{
  return MEMORY[0x1F41640F8]();
}

uint64_t sub_1DCB87748()
{
  return MEMORY[0x1F4164100]();
}

uint64_t sub_1DCB87758()
{
  return MEMORY[0x1F4164108]();
}

uint64_t sub_1DCB87768()
{
  return MEMORY[0x1F4164110]();
}

uint64_t sub_1DCB87778()
{
  return MEMORY[0x1F4183280]();
}

uint64_t sub_1DCB87788()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1DCB87798()
{
  return MEMORY[0x1F40E6008]();
}

uint64_t sub_1DCB877A8()
{
  return MEMORY[0x1F40E6018]();
}

uint64_t sub_1DCB877B8()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1DCB877C8()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_1DCB877D8()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1DCB877E8()
{
  return MEMORY[0x1F41834F8]();
}

uint64_t sub_1DCB877F8()
{
  return MEMORY[0x1F4183500]();
}

uint64_t sub_1DCB87808()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1DCB87818()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1DCB87828()
{
  return MEMORY[0x1F41835D0]();
}

uint64_t sub_1DCB87838()
{
  return MEMORY[0x1F4183618]();
}

uint64_t sub_1DCB87848()
{
  return MEMORY[0x1F4188400]();
}

uint64_t sub_1DCB87858()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1DCB87868()
{
  return MEMORY[0x1F4183740]();
}

uint64_t sub_1DCB87878()
{
  return MEMORY[0x1F4183750]();
}

uint64_t sub_1DCB87888()
{
  return MEMORY[0x1F4183758]();
}

uint64_t sub_1DCB87898()
{
  return MEMORY[0x1F4183760]();
}

uint64_t sub_1DCB878A8()
{
  return MEMORY[0x1F4183768]();
}

uint64_t sub_1DCB878B8()
{
  return MEMORY[0x1F41837B0]();
}

uint64_t sub_1DCB878C8()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1DCB878D8()
{
  return MEMORY[0x1F4183840]();
}

uint64_t sub_1DCB878E8()
{
  return MEMORY[0x1F4183870]();
}

uint64_t sub_1DCB878F8()
{
  return MEMORY[0x1F40E6088]();
}

uint64_t sub_1DCB87908()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1DCB87918()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1DCB87928()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1DCB87938()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1DCB87948()
{
  return MEMORY[0x1F40E61F8]();
}

uint64_t sub_1DCB87958()
{
  return MEMORY[0x1F40E6238]();
}

uint64_t sub_1DCB87968()
{
  return MEMORY[0x1F40E6268]();
}

uint64_t sub_1DCB87978()
{
  return MEMORY[0x1F40E62A0]();
}

uint64_t sub_1DCB87988()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1DCB87998()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t sub_1DCB879A8()
{
  return MEMORY[0x1F41838D8]();
}

uint64_t sub_1DCB879B8()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1DCB879C8()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1DCB879D8()
{
  return MEMORY[0x1F41839F8]();
}

uint64_t sub_1DCB879E8()
{
  return MEMORY[0x1F4183A00]();
}

uint64_t sub_1DCB879F8()
{
  return MEMORY[0x1F4183A08]();
}

uint64_t sub_1DCB87A08()
{
  return MEMORY[0x1F4183A28]();
}

uint64_t sub_1DCB87A18()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1DCB87A28()
{
  return MEMORY[0x1F4183A60]();
}

uint64_t sub_1DCB87A38()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1DCB87A48()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t sub_1DCB87A58()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_1DCB87A68()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t sub_1DCB87A78()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_1DCB87A88()
{
  return MEMORY[0x1F4183B30]();
}

uint64_t sub_1DCB87A98()
{
  return MEMORY[0x1F4183B40]();
}

uint64_t sub_1DCB87AA8()
{
  return MEMORY[0x1F4183B58]();
}

uint64_t sub_1DCB87AB8()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_1DCB87AC8()
{
  return MEMORY[0x1F4183BA8]();
}

uint64_t sub_1DCB87AD8()
{
  return MEMORY[0x1F4183BB8]();
}

uint64_t sub_1DCB87AE8()
{
  return MEMORY[0x1F40D6E68]();
}

uint64_t sub_1DCB87AF8()
{
  return MEMORY[0x1F4183BF8]();
}

uint64_t sub_1DCB87B08()
{
  return MEMORY[0x1F4183C08]();
}

uint64_t sub_1DCB87B18()
{
  return MEMORY[0x1F4183C10]();
}

uint64_t sub_1DCB87B28()
{
  return MEMORY[0x1F4183C18]();
}

uint64_t sub_1DCB87B38()
{
  return MEMORY[0x1F4183C40]();
}

uint64_t sub_1DCB87B48()
{
  return MEMORY[0x1F4183C68]();
}

uint64_t sub_1DCB87B58()
{
  return MEMORY[0x1F4183CD0]();
}

uint64_t sub_1DCB87B68()
{
  return MEMORY[0x1F40E6328]();
}

uint64_t sub_1DCB87B78()
{
  return MEMORY[0x1F4183D40]();
}

uint64_t sub_1DCB87B88()
{
  return MEMORY[0x1F4183D48]();
}

uint64_t sub_1DCB87B98()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t sub_1DCB87BA8()
{
  return MEMORY[0x1F4183D78]();
}

uint64_t sub_1DCB87BB8()
{
  return MEMORY[0x1F4183D80]();
}

uint64_t sub_1DCB87BC8()
{
  return MEMORY[0x1F4183D98]();
}

uint64_t sub_1DCB87BD8()
{
  return MEMORY[0x1F4183DF8]();
}

uint64_t sub_1DCB87BE8()
{
  return MEMORY[0x1F4183E10]();
}

uint64_t sub_1DCB87BF8()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1DCB87C08()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1DCB87C18()
{
  return MEMORY[0x1F40E6348]();
}

uint64_t sub_1DCB87C28()
{
  return MEMORY[0x1F40E6360]();
}

uint64_t sub_1DCB87C38()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1DCB87C48()
{
  return MEMORY[0x1F4183E88]();
}

uint64_t sub_1DCB87C58()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1DCB87C68()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1DCB87C78()
{
  return MEMORY[0x1F4183EA0]();
}

uint64_t sub_1DCB87C88()
{
  return MEMORY[0x1F4183EA8]();
}

uint64_t sub_1DCB87C98()
{
  return MEMORY[0x1F4183EB8]();
}

uint64_t sub_1DCB87CA8()
{
  return MEMORY[0x1F4183EC0]();
}

uint64_t sub_1DCB87CB8()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1DCB87CC8()
{
  return MEMORY[0x1F4183ED8]();
}

uint64_t sub_1DCB87CD8()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1DCB87CE8()
{
  return MEMORY[0x1F4183F00]();
}

uint64_t sub_1DCB87CF8()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1DCB87D08()
{
  return MEMORY[0x1F4183F10]();
}

uint64_t sub_1DCB87D18()
{
  return MEMORY[0x1F4183F18]();
}

uint64_t sub_1DCB87D28()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1DCB87D38()
{
  return MEMORY[0x1F4183F40]();
}

uint64_t sub_1DCB87D48()
{
  return MEMORY[0x1F4183F60]();
}

uint64_t sub_1DCB87D58()
{
  return MEMORY[0x1F4183F78]();
}

uint64_t sub_1DCB87D68()
{
  return MEMORY[0x1F4183F88]();
}

uint64_t sub_1DCB87D78()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1DCB87D88()
{
  return MEMORY[0x1F4183FB8]();
}

uint64_t sub_1DCB87D98()
{
  return MEMORY[0x1F4183FC8]();
}

uint64_t sub_1DCB87DA8()
{
  return MEMORY[0x1F4183FD8]();
}

uint64_t sub_1DCB87DD8()
{
  return MEMORY[0x1F40E6388]();
}

uint64_t sub_1DCB87DE8()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1DCB87DF8()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1DCB87E38()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1DCB87E48()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1DCB87E58()
{
  return MEMORY[0x1F4187D10]();
}

uint64_t sub_1DCB87E68()
{
  return MEMORY[0x1F4187D20]();
}

uint64_t sub_1DCB87E78()
{
  return MEMORY[0x1F4187D38]();
}

uint64_t sub_1DCB87E88()
{
  return MEMORY[0x1F4187D40]();
}

uint64_t sub_1DCB87E98()
{
  return MEMORY[0x1F4187D48]();
}

uint64_t sub_1DCB87EA8()
{
  return MEMORY[0x1F4187D50]();
}

uint64_t sub_1DCB87EC8()
{
  return MEMORY[0x1F4187D70]();
}

uint64_t sub_1DCB87ED8()
{
  return MEMORY[0x1F4187D78]();
}

uint64_t sub_1DCB87EE8()
{
  return MEMORY[0x1F4187D98]();
}

uint64_t sub_1DCB87F08()
{
  return MEMORY[0x1F4187DC8]();
}

uint64_t sub_1DCB87F28()
{
  return MEMORY[0x1F4187E68]();
}

uint64_t sub_1DCB87F38()
{
  return MEMORY[0x1F4187E78]();
}

uint64_t sub_1DCB87F58()
{
  return MEMORY[0x1F4187EA8]();
}

uint64_t sub_1DCB87F68()
{
  return MEMORY[0x1F4187EB8]();
}

uint64_t sub_1DCB87F78()
{
  return MEMORY[0x1F4187EC0]();
}

uint64_t sub_1DCB87F88()
{
  return MEMORY[0x1F4187F00]();
}

uint64_t sub_1DCB87F98()
{
  return MEMORY[0x1F40E63C8]();
}

uint64_t sub_1DCB87FA8()
{
  return MEMORY[0x1F40E63D8]();
}

uint64_t sub_1DCB87FB8()
{
  return MEMORY[0x1F4184048]();
}

uint64_t sub_1DCB87FC8()
{
  return MEMORY[0x1F41840C0]();
}

uint64_t sub_1DCB87FD8()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_1DCB87FE8()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t sub_1DCB87FF8()
{
  return MEMORY[0x1F4184100]();
}

uint64_t sub_1DCB88008()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1DCB88018()
{
  return MEMORY[0x1F4184178]();
}

uint64_t sub_1DCB88028()
{
  return MEMORY[0x1F41841D0]();
}

uint64_t sub_1DCB88038()
{
  return MEMORY[0x1F40E6468]();
}

uint64_t sub_1DCB88048()
{
  return MEMORY[0x1F40E6478]();
}

uint64_t sub_1DCB88058()
{
  return MEMORY[0x1F4184278]();
}

uint64_t sub_1DCB88068()
{
  return MEMORY[0x1F4184280]();
}

uint64_t sub_1DCB88078()
{
  return MEMORY[0x1F41842A0]();
}

uint64_t sub_1DCB88098()
{
  return MEMORY[0x1F41842C0]();
}

uint64_t sub_1DCB880B8()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1DCB880C8()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t sub_1DCB880D8()
{
  return MEMORY[0x1F4184300]();
}

uint64_t sub_1DCB880E8()
{
  return MEMORY[0x1F4184310]();
}

uint64_t sub_1DCB880F8()
{
  return MEMORY[0x1F4184318]();
}

uint64_t sub_1DCB88108()
{
  return MEMORY[0x1F4184328]();
}

uint64_t sub_1DCB88118()
{
  return MEMORY[0x1F4184330]();
}

uint64_t sub_1DCB88128()
{
  return MEMORY[0x1F4184340]();
}

uint64_t sub_1DCB88148()
{
  return MEMORY[0x1F4184368]();
}

uint64_t sub_1DCB88158()
{
  return MEMORY[0x1F4184370]();
}

uint64_t sub_1DCB88168()
{
  return MEMORY[0x1F4184378]();
}

uint64_t sub_1DCB88188()
{
  return MEMORY[0x1F4184390]();
}

uint64_t sub_1DCB88198()
{
  return MEMORY[0x1F4184398]();
}

uint64_t sub_1DCB881A8()
{
  return MEMORY[0x1F41843A0]();
}

uint64_t sub_1DCB881B8()
{
  return MEMORY[0x1F41843A8]();
}

uint64_t sub_1DCB881C8()
{
  return MEMORY[0x1F41843D0]();
}

uint64_t sub_1DCB881D8()
{
  return MEMORY[0x1F4184408]();
}

uint64_t sub_1DCB881E8()
{
  return MEMORY[0x1F4184410]();
}

uint64_t sub_1DCB881F8()
{
  return MEMORY[0x1F4184430]();
}

uint64_t sub_1DCB88208()
{
  return MEMORY[0x1F4184438]();
}

uint64_t sub_1DCB88218()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1DCB88228()
{
  return MEMORY[0x1F4184448]();
}

uint64_t sub_1DCB88238()
{
  return MEMORY[0x1F4184450]();
}

uint64_t sub_1DCB88248()
{
  return MEMORY[0x1F4184468]();
}

uint64_t sub_1DCB88258()
{
  return MEMORY[0x1F4184490]();
}

uint64_t sub_1DCB88268()
{
  return MEMORY[0x1F4184498]();
}

uint64_t sub_1DCB88278()
{
  return MEMORY[0x1F41844A0]();
}

uint64_t sub_1DCB88288()
{
  return MEMORY[0x1F41844A8]();
}

uint64_t sub_1DCB88298()
{
  return MEMORY[0x1F41844B0]();
}

uint64_t sub_1DCB882A8()
{
  return MEMORY[0x1F41844C8]();
}

uint64_t sub_1DCB882B8()
{
  return MEMORY[0x1F41844D0]();
}

uint64_t sub_1DCB882C8()
{
  return MEMORY[0x1F41844D8]();
}

uint64_t sub_1DCB882D8()
{
  return MEMORY[0x1F41844E8]();
}

uint64_t sub_1DCB882F8()
{
  return MEMORY[0x1F4184508]();
}

uint64_t sub_1DCB88318()
{
  return MEMORY[0x1F4184518]();
}

uint64_t sub_1DCB88328()
{
  return MEMORY[0x1F4184520]();
}

uint64_t sub_1DCB88338()
{
  return MEMORY[0x1F4184530]();
}

uint64_t sub_1DCB88348()
{
  return MEMORY[0x1F4184538]();
}

uint64_t sub_1DCB88358()
{
  return MEMORY[0x1F4184540]();
}

uint64_t sub_1DCB88398()
{
  return MEMORY[0x1F4184588]();
}

uint64_t sub_1DCB883A8()
{
  return MEMORY[0x1F41845B0]();
}

uint64_t sub_1DCB883B8()
{
  return MEMORY[0x1F4186A08]();
}

uint64_t sub_1DCB883C8()
{
  return MEMORY[0x1F4186A28]();
}

uint64_t sub_1DCB883D8()
{
  return MEMORY[0x1F4186A30]();
}

uint64_t sub_1DCB883E8()
{
  return MEMORY[0x1F40E6508]();
}

uint64_t sub_1DCB883F8()
{
  return MEMORY[0x1F40DB760]();
}

uint64_t sub_1DCB88408()
{
  return MEMORY[0x1F40DB768]();
}

uint64_t sub_1DCB88418()
{
  return MEMORY[0x1F40DB770]();
}

uint64_t sub_1DCB88428()
{
  return MEMORY[0x1F40DB788]();
}

uint64_t sub_1DCB88438()
{
  return MEMORY[0x1F40E65D0]();
}

uint64_t sub_1DCB88448()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1DCB88458()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1DCB88468()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1DCB88478()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1DCB88488()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1DCB88498()
{
  return MEMORY[0x1F40DB798]();
}

uint64_t sub_1DCB884A8()
{
  return MEMORY[0x1F40DB7A0]();
}

uint64_t sub_1DCB884B8()
{
  return MEMORY[0x1F40E66C8]();
}

uint64_t sub_1DCB884C8()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1DCB884D8()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1DCB884E8()
{
  return MEMORY[0x1F41870D8]();
}

uint64_t sub_1DCB884F8()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1DCB88508()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1DCB88518()
{
  return MEMORY[0x1F4187110]();
}

uint64_t sub_1DCB88528()
{
  return MEMORY[0x1F4188708]();
}

uint64_t sub_1DCB88538()
{
  return MEMORY[0x1F4188710]();
}

uint64_t sub_1DCB88548()
{
  return MEMORY[0x1F4188718]();
}

uint64_t sub_1DCB88568()
{
  return MEMORY[0x1F40E6798]();
}

uint64_t sub_1DCB88578()
{
  return MEMORY[0x1F40E67A0]();
}

uint64_t sub_1DCB88588()
{
  return MEMORY[0x1F4187268]();
}

uint64_t sub_1DCB88598()
{
  return MEMORY[0x1F4187288]();
}

uint64_t sub_1DCB885B8()
{
  return MEMORY[0x1F4186AF0]();
}

uint64_t sub_1DCB885C8()
{
  return MEMORY[0x1F4186B00]();
}

uint64_t sub_1DCB885D8()
{
  return MEMORY[0x1F4186B08]();
}

uint64_t sub_1DCB885E8()
{
  return MEMORY[0x1F4186B10]();
}

uint64_t sub_1DCB885F8()
{
  return MEMORY[0x1F4186B20]();
}

uint64_t sub_1DCB88608()
{
  return MEMORY[0x1F4186B28]();
}

uint64_t sub_1DCB88618()
{
  return MEMORY[0x1F4186B30]();
}

uint64_t sub_1DCB88628()
{
  return MEMORY[0x1F4186B40]();
}

uint64_t sub_1DCB88638()
{
  return MEMORY[0x1F4186B48]();
}

uint64_t sub_1DCB88648()
{
  return MEMORY[0x1F40DB7B8]();
}

uint64_t sub_1DCB88658()
{
  return MEMORY[0x1F40E6858]();
}

uint64_t sub_1DCB88668()
{
  return MEMORY[0x1F40E6868]();
}

uint64_t sub_1DCB88678()
{
  return MEMORY[0x1F40E68F8]();
}

uint64_t sub_1DCB88688()
{
  return MEMORY[0x1F40E6910]();
}

uint64_t sub_1DCB88698()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_1DCB886A8()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1DCB886B8()
{
  return MEMORY[0x1F41874D0]();
}

uint64_t sub_1DCB886C8()
{
  return MEMORY[0x1F40E6940]();
}

uint64_t sub_1DCB886D8()
{
  return MEMORY[0x1F40E6B18]();
}

uint64_t sub_1DCB886E8()
{
  return MEMORY[0x1F40E6B48]();
}

uint64_t sub_1DCB886F8()
{
  return MEMORY[0x1F4188720]();
}

uint64_t sub_1DCB88708()
{
  return MEMORY[0x1F41845D8]();
}

uint64_t sub_1DCB88718()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1DCB88728()
{
  return MEMORY[0x1F4184658]();
}

uint64_t sub_1DCB88738()
{
  return MEMORY[0x1F4184668]();
}

uint64_t sub_1DCB88748()
{
  return MEMORY[0x1F4184680]();
}

uint64_t sub_1DCB88758()
{
  return MEMORY[0x1F41847A0]();
}

uint64_t sub_1DCB88768()
{
  return MEMORY[0x1F40E6B98]();
}

uint64_t sub_1DCB88778()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1DCB88788()
{
  return MEMORY[0x1F41847F0]();
}

uint64_t sub_1DCB88798()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1DCB887A8()
{
  return MEMORY[0x1F4184830]();
}

uint64_t sub_1DCB887B8()
{
  return MEMORY[0x1F40E6BA8]();
}

uint64_t sub_1DCB887C8()
{
  return MEMORY[0x1F40E6BB0]();
}

uint64_t sub_1DCB887D8()
{
  return MEMORY[0x1F40E6C80]();
}

uint64_t sub_1DCB887E8()
{
  return MEMORY[0x1F40E6D28]();
}

uint64_t sub_1DCB887F8()
{
  return MEMORY[0x1F40E6D48]();
}

uint64_t sub_1DCB88808()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1DCB88818()
{
  return MEMORY[0x1F41849B8]();
}

uint64_t sub_1DCB88828()
{
  return MEMORY[0x1F41849D8]();
}

uint64_t sub_1DCB88838()
{
  return MEMORY[0x1F41849E8]();
}

uint64_t sub_1DCB88848()
{
  return MEMORY[0x1F41849F0]();
}

uint64_t sub_1DCB88858()
{
  return MEMORY[0x1F4184A00]();
}

uint64_t sub_1DCB88868()
{
  return MEMORY[0x1F4184A08]();
}

uint64_t sub_1DCB88878()
{
  return MEMORY[0x1F4184A10]();
}

uint64_t sub_1DCB88888()
{
  return MEMORY[0x1F4184A18]();
}

uint64_t sub_1DCB88898()
{
  return MEMORY[0x1F4184A20]();
}

uint64_t sub_1DCB888A8()
{
  return MEMORY[0x1F4184A38]();
}

uint64_t sub_1DCB888B8()
{
  return MEMORY[0x1F4184A40]();
}

uint64_t sub_1DCB888C8()
{
  return MEMORY[0x1F4184A48]();
}

uint64_t sub_1DCB888E8()
{
  return MEMORY[0x1F4184A58]();
}

uint64_t sub_1DCB888F8()
{
  return MEMORY[0x1F4184A60]();
}

uint64_t sub_1DCB88908()
{
  return MEMORY[0x1F4184A70]();
}

uint64_t sub_1DCB88928()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1DCB88938()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1DCB88948()
{
  return MEMORY[0x1F4184B28]();
}

uint64_t sub_1DCB88958()
{
  return MEMORY[0x1F4184B30]();
}

uint64_t sub_1DCB88968()
{
  return MEMORY[0x1F4184B58]();
}

uint64_t sub_1DCB88978()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_1DCB88988()
{
  return MEMORY[0x1F4184B68]();
}

uint64_t sub_1DCB88998()
{
  return MEMORY[0x1F4184B80]();
}

uint64_t sub_1DCB889A8()
{
  return MEMORY[0x1F4184B88]();
}

uint64_t sub_1DCB889B8()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_1DCB889C8()
{
  return MEMORY[0x1F4184BA8]();
}

uint64_t sub_1DCB889D8()
{
  return MEMORY[0x1F4184BB0]();
}

uint64_t sub_1DCB889E8()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_1DCB889F8()
{
  return MEMORY[0x1F4184BD8]();
}

uint64_t sub_1DCB88A08()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1DCB88A18()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1DCB88A28()
{
  return MEMORY[0x1F4184C30]();
}

uint64_t sub_1DCB88A38()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1DCB88A48()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1DCB88A58()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1DCB88A68()
{
  return MEMORY[0x1F4184CA0]();
}

uint64_t sub_1DCB88A78()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1DCB88A88()
{
  return MEMORY[0x1F4184CC0]();
}

uint64_t sub_1DCB88A98()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1DCB88AA8()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1DCB88AB8()
{
  return MEMORY[0x1F4184D10]();
}

uint64_t sub_1DCB88AC8()
{
  return MEMORY[0x1F4184D40]();
}

uint64_t sub_1DCB88AD8()
{
  return MEMORY[0x1F4184D78]();
}

uint64_t sub_1DCB88AE8()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1DCB88AF8()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1DCB88B08()
{
  return MEMORY[0x1F4184DD0]();
}

uint64_t sub_1DCB88B18()
{
  return MEMORY[0x1F4184DF0]();
}

uint64_t sub_1DCB88B28()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1DCB88B48()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1DCB88B58()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1DCB88B68()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1DCB88B78()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1DCB88B88()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1DCB88B98()
{
  return MEMORY[0x1F4187F70]();
}

uint64_t sub_1DCB88BA8()
{
  return MEMORY[0x1F4187F78]();
}

uint64_t sub_1DCB88BB8()
{
  return MEMORY[0x1F4187F80]();
}

uint64_t sub_1DCB88BC8()
{
  return MEMORY[0x1F4184F98]();
}

uint64_t sub_1DCB88BD8()
{
  return MEMORY[0x1F4184FF8]();
}

uint64_t sub_1DCB88BE8()
{
  return MEMORY[0x1F4185008]();
}

uint64_t sub_1DCB88BF8()
{
  return MEMORY[0x1F4185018]();
}

uint64_t sub_1DCB88C08()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1DCB88C18()
{
  return MEMORY[0x1F4188000]();
}

uint64_t sub_1DCB88C28()
{
  return MEMORY[0x1F41851A0]();
}

uint64_t sub_1DCB88C38()
{
  return MEMORY[0x1F41851B8]();
}

uint64_t sub_1DCB88C48()
{
  return MEMORY[0x1F41851C0]();
}

uint64_t sub_1DCB88C58()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1DCB88C68()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1DCB88C78()
{
  return MEMORY[0x1F41852B0]();
}

uint64_t sub_1DCB88C88()
{
  return MEMORY[0x1F41852C0]();
}

uint64_t sub_1DCB88C98()
{
  return MEMORY[0x1F41852C8]();
}

uint64_t sub_1DCB88CA8()
{
  return MEMORY[0x1F41852D0]();
}

uint64_t sub_1DCB88CB8()
{
  return MEMORY[0x1F41852E0]();
}

uint64_t sub_1DCB88CC8()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1DCB88CD8()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1DCB88CE8()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1DCB88CF8()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1DCB88D08()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1DCB88D18()
{
  return MEMORY[0x1F41853A8]();
}

uint64_t sub_1DCB88D28()
{
  return MEMORY[0x1F4185400]();
}

uint64_t sub_1DCB88D48()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1DCB88D58()
{
  return MEMORY[0x1F41854D8]();
}

uint64_t sub_1DCB88D68()
{
  return MEMORY[0x1F41854E0]();
}

uint64_t sub_1DCB88D78()
{
  return MEMORY[0x1F41854F8]();
}

uint64_t sub_1DCB88D88()
{
  return MEMORY[0x1F4185518]();
}

uint64_t sub_1DCB88D98()
{
  return MEMORY[0x1F4185528]();
}

uint64_t sub_1DCB88DA8()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1DCB88DB8()
{
  return MEMORY[0x1F4185570]();
}

uint64_t sub_1DCB88DC8()
{
  return MEMORY[0x1F4185578]();
}

uint64_t sub_1DCB88DD8()
{
  return MEMORY[0x1F4185580]();
}

uint64_t sub_1DCB88DE8()
{
  return MEMORY[0x1F4185588]();
}

uint64_t sub_1DCB88DF8()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1DCB88E08()
{
  return MEMORY[0x1F41855B0]();
}

uint64_t sub_1DCB88E18()
{
  return MEMORY[0x1F41855B8]();
}

uint64_t sub_1DCB88E38()
{
  return MEMORY[0x1F41855D0]();
}

uint64_t sub_1DCB88E48()
{
  return MEMORY[0x1F41855D8]();
}

uint64_t sub_1DCB88E58()
{
  return MEMORY[0x1F41855E0]();
}

uint64_t sub_1DCB88E68()
{
  return MEMORY[0x1F41855E8]();
}

uint64_t sub_1DCB88E78()
{
  return MEMORY[0x1F41855F0]();
}

uint64_t sub_1DCB88E88()
{
  return MEMORY[0x1F4185608]();
}

uint64_t sub_1DCB88E98()
{
  return MEMORY[0x1F4185628]();
}

uint64_t sub_1DCB88EA8()
{
  return MEMORY[0x1F4185648]();
}

uint64_t sub_1DCB88EB8()
{
  return MEMORY[0x1F4185658]();
}

uint64_t sub_1DCB88EC8()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1DCB88ED8()
{
  return MEMORY[0x1F4185698]();
}

uint64_t sub_1DCB88EE8()
{
  return MEMORY[0x1F41856A0]();
}

uint64_t sub_1DCB88EF8()
{
  return MEMORY[0x1F41856A8]();
}

uint64_t sub_1DCB88F08()
{
  return MEMORY[0x1F41856B0]();
}

uint64_t sub_1DCB88F18()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1DCB88F28()
{
  return MEMORY[0x1F41856D8]();
}

uint64_t sub_1DCB88F38()
{
  return MEMORY[0x1F41856E0]();
}

uint64_t sub_1DCB88F58()
{
  return MEMORY[0x1F41856F8]();
}

uint64_t sub_1DCB88F68()
{
  return MEMORY[0x1F4185700]();
}

uint64_t sub_1DCB88F78()
{
  return MEMORY[0x1F4185710]();
}

uint64_t sub_1DCB88F88()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_1DCB88F98()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1DCB88FA8()
{
  return MEMORY[0x1F4185768]();
}

uint64_t sub_1DCB88FC8()
{
  return MEMORY[0x1F4188138]();
}

uint64_t sub_1DCB88FD8()
{
  return MEMORY[0x1F4188140]();
}

uint64_t sub_1DCB88FE8()
{
  return MEMORY[0x1F41859A8]();
}

uint64_t sub_1DCB88FF8()
{
  return MEMORY[0x1F4185A20]();
}

uint64_t sub_1DCB89008()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1DCB89018()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1DCB89038()
{
  return MEMORY[0x1F4185A88]();
}

uint64_t sub_1DCB89048()
{
  return MEMORY[0x1F4185AC0]();
}

uint64_t sub_1DCB89058()
{
  return MEMORY[0x1F4185B20]();
}

uint64_t sub_1DCB89068()
{
  return MEMORY[0x1F4185B68]();
}

uint64_t sub_1DCB89078()
{
  return MEMORY[0x1F4185B90]();
}

uint64_t sub_1DCB89088()
{
  return MEMORY[0x1F4185B98]();
}

uint64_t sub_1DCB89098()
{
  return MEMORY[0x1F4185D58]();
}

uint64_t sub_1DCB890A8()
{
  return MEMORY[0x1F4185D68]();
}

uint64_t sub_1DCB890B8()
{
  return MEMORY[0x1F4185DA0]();
}

uint64_t sub_1DCB890D8()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1DCB890E8()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1DCB890F8()
{
  return MEMORY[0x1F4188170]();
}

uint64_t sub_1DCB89118()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_1DCB89128()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1DCB89138()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1DCB89148()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1DCB89158()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1DCB89168()
{
  return MEMORY[0x1F40E6E58]();
}

uint64_t sub_1DCB89178()
{
  return MEMORY[0x1F40E6E60]();
}

uint64_t sub_1DCB89188()
{
  return MEMORY[0x1F4185E90]();
}

uint64_t sub_1DCB89198()
{
  return MEMORY[0x1F4185EA8]();
}

uint64_t sub_1DCB891A8()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1DCB891B8()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1DCB891C8()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_1DCB891D8()
{
  return MEMORY[0x1F4185EE0]();
}

uint64_t sub_1DCB891E8()
{
  return MEMORY[0x1F4185EE8]();
}

uint64_t sub_1DCB891F8()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1DCB89208()
{
  return MEMORY[0x1F4185F10]();
}

uint64_t sub_1DCB89218()
{
  return MEMORY[0x1F4185F28]();
}

uint64_t sub_1DCB89228()
{
  return MEMORY[0x1F4185F38]();
}

uint64_t sub_1DCB89238()
{
  return MEMORY[0x1F4185F40]();
}

uint64_t sub_1DCB89248()
{
  return MEMORY[0x1F4185F48]();
}

uint64_t sub_1DCB89258()
{
  return MEMORY[0x1F4185F60]();
}

uint64_t sub_1DCB89268()
{
  return MEMORY[0x1F4185F68]();
}

uint64_t sub_1DCB89278()
{
  return MEMORY[0x1F4185F80]();
}

uint64_t sub_1DCB89288()
{
  return MEMORY[0x1F4185FB8]();
}

uint64_t sub_1DCB89298()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1DCB892A8()
{
  return MEMORY[0x1F4185FE0]();
}

uint64_t sub_1DCB892B8()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1DCB892C8()
{
  return MEMORY[0x1F41861A8]();
}

uint64_t sub_1DCB892F8()
{
  return MEMORY[0x1F4186318]();
}

OSStatus AudioQueueAddPropertyListener(AudioQueueRef inAQ, AudioQueuePropertyID inID, AudioQueuePropertyListenerProc inProc, void *inUserData)
{
  return MEMORY[0x1F40D4CD8](inAQ, *(void *)&inID, inProc, inUserData);
}

OSStatus AudioQueueAllocateBuffer(AudioQueueRef inAQ, UInt32 inBufferByteSize, AudioQueueBufferRef *outBuffer)
{
  return MEMORY[0x1F40D4CE0](inAQ, *(void *)&inBufferByteSize, outBuffer);
}

OSStatus AudioQueueDispose(AudioQueueRef inAQ, Boolean inImmediate)
{
  return MEMORY[0x1F40D4D18](inAQ, inImmediate);
}

OSStatus AudioQueueEnqueueBuffer(AudioQueueRef inAQ, AudioQueueBufferRef inBuffer, UInt32 inNumPacketDescs, const AudioStreamPacketDescription *inPacketDescs)
{
  return MEMORY[0x1F40D4D20](inAQ, inBuffer, *(void *)&inNumPacketDescs, inPacketDescs);
}

OSStatus AudioQueueGetProperty(AudioQueueRef inAQ, AudioQueuePropertyID inID, void *outData, UInt32 *ioDataSize)
{
  return MEMORY[0x1F40D4D58](inAQ, *(void *)&inID, outData, ioDataSize);
}

uint64_t AudioQueueNewInputWithAudioSession()
{
  return MEMORY[0x1F40D4D70]();
}

OSStatus AudioQueueRemovePropertyListener(AudioQueueRef inAQ, AudioQueuePropertyID inID, AudioQueuePropertyListenerProc inProc, void *inUserData)
{
  return MEMORY[0x1F40D4DC8](inAQ, *(void *)&inID, inProc, inUserData);
}

OSStatus AudioQueueSetProperty(AudioQueueRef inAQ, AudioQueuePropertyID inID, const void *inData, UInt32 inDataSize)
{
  return MEMORY[0x1F40D4DE8](inAQ, *(void *)&inID, inData, *(void *)&inDataSize);
}

OSStatus AudioQueueStart(AudioQueueRef inAQ, const AudioTimeStamp *inStartTime)
{
  return MEMORY[0x1F40D4DF0](inAQ, inStartTime);
}

OSStatus AudioQueueStop(AudioQueueRef inAQ, Boolean inImmediate)
{
  return MEMORY[0x1F40D4E00](inAQ, inImmediate);
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9770](data, *(void *)&len, md);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC088](retstr, lhs, rhs);
}

CMTime *__cdecl CMTimeClampToRange(CMTime *__return_ptr retstr, CMTime *time, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x1F40DC090](retstr, time, range);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1F40DC0C8](time1, time2);
}

CMTime *__cdecl CMTimeConvertScale(CMTime *__return_ptr retstr, CMTime *time, int32_t newTimescale, CMTimeRoundingMethod method)
{
  return (CMTime *)MEMORY[0x1F40DC0D0](retstr, time, *(void *)&newTimescale, *(void *)&method);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x1F40DC100](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1F40DC108](retstr, value, *(void *)&timescale);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1F40DC120](retstr, *(void *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeMultiply(CMTime *__return_ptr retstr, CMTime *time, int32_t multiplier)
{
  return (CMTime *)MEMORY[0x1F40DC170](retstr, time, *(void *)&multiplier);
}

CMTime *__cdecl CMTimeMultiplyByRatio(CMTime *__return_ptr retstr, CMTime *time, int32_t multiplier, int32_t divisor)
{
  return (CMTime *)MEMORY[0x1F40DC180](retstr, time, *(void *)&multiplier, *(void *)&divisor);
}

Boolean CMTimeRangeContainsTime(CMTimeRange *range, CMTime *time)
{
  return MEMORY[0x1F40DC190](range, time);
}

CFDictionaryRef CMTimeRangeCopyAsDictionary(CMTimeRange *range, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1F40DC1A0](range, allocator);
}

CMTimeRange *__cdecl CMTimeRangeFromTimeToTime(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *end)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1B8](retstr, start, end);
}

CMTime *__cdecl CMTimeRangeGetEnd(CMTime *__return_ptr retstr, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x1F40DC1C0](retstr, range);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1D8](retstr, start, duration);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC1F0](retstr, lhs, rhs);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1F40E86C8](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return MEMORY[0x1F40E8778](notifier);
}

BOOLean_t IOIteratorIsValid(io_iterator_t iterator)
{
  return MEMORY[0x1F40E8EC8](*(void *)&iterator);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1F40E8ED8](*(void *)&iterator);
}

void IOIteratorReset(io_iterator_t iterator)
{
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1F40E9240](*(void *)&connect);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x1F40E9258](*(void *)&mainPort, matching, existing);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x1F40E9280](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1F417CE18]();
}

uint64_t MobileGestalt_copy_buildVersion_obj()
{
  return MEMORY[0x1F417CE68]();
}

uint64_t MobileGestalt_get_acousticID()
{
  return MEMORY[0x1F417CE88]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x1F417CE98]();
}

uint64_t MobileGestalt_get_exclaveCapability()
{
  return MEMORY[0x1F417CEC0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E7110]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

uint64_t PPSCreateTelemetryIdentifier()
{
  return MEMORY[0x1F4145DC0]();
}

uint64_t PPSSendTelemetry()
{
  return MEMORY[0x1F4145DD0]();
}

uint64_t RegisterForIsolatedAudio()
{
  return MEMORY[0x1F41276D8]();
}

uint64_t RequestIsolatedAudio()
{
  return MEMORY[0x1F41276F0]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

uint64_t SetAudioLapseHandler()
{
  return MEMORY[0x1F4127700]();
}

uint64_t StartIsolatedAudio()
{
  return MEMORY[0x1F4127708]();
}

uint64_t StopIsolatedAudio()
{
  return MEMORY[0x1F4127728]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
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

uint64_t AUProcessingBlock_DSPGraph::AUProcessingBlock_DSPGraph()
{
  return MEMORY[0x1F410B8D8]();
}

uint64_t AT::RingBuffer::Fetch(AT::RingBuffer *this, AudioBufferList *a2)
{
  return MEMORY[0x1F410B930](this, a2);
}

uint64_t AT::RingBuffer::Store(AT::RingBuffer *this, const AudioBufferList *a2)
{
  return MEMORY[0x1F410B938](this, a2);
}

uint64_t AT::RingBuffer::RingBuffer(AT::RingBuffer *this, const AudioStreamBasicDescription *a2)
{
  return MEMORY[0x1F410B940](this, a2);
}

void AT::RingBuffer::~RingBuffer(AT::RingBuffer *this)
{
}

uint64_t DSPGraph::ABIVersion(DSPGraph *this)
{
  return MEMORY[0x1F410B9A8](this);
}

uint64_t DSPGraph::RingBuffer::free(DSPGraph::RingBuffer *this)
{
  return MEMORY[0x1F410B9B8](this);
}

uint64_t DSPGraph::RingBuffer::read()
{
  return MEMORY[0x1F410B9C0]();
}

uint64_t DSPGraph::RingBuffer::write()
{
  return MEMORY[0x1F410B9D0]();
}

{
  return MEMORY[0x1F410B9D8]();
}

void DSPGraph::RingBuffer::~RingBuffer(DSPGraph::RingBuffer *this)
{
}

uint64_t DSPGraph::Interpreter::compileFile()
{
  return MEMORY[0x1F410B9E8]();
}

uint64_t DSPGraph::Interpreter::compileText()
{
  return MEMORY[0x1F410B9F0]();
}

uint64_t DSPGraph::Interpreter::Interpreter()
{
  return MEMORY[0x1F410B9F8]();
}

uint64_t DSPGraph::RingBufferBox::initialize(DSPGraph::RingBufferBox *this)
{
  return MEMORY[0x1F410BA08](this);
}

uint64_t DSPGraph::RingBufferBox::uninitialize(DSPGraph::RingBufferBox *this)
{
  return MEMORY[0x1F410BA10](this);
}

uint64_t DSPGraph::RingBufferBox::reset(DSPGraph::RingBufferBox *this)
{
  return MEMORY[0x1F410BA20](this);
}

uint64_t DSPGraph::NewBoxRegistry::NewBoxRegistry(DSPGraph::NewBoxRegistry *this)
{
  return MEMORY[0x1F410BA30](this);
}

uint64_t DSPGraph::ThrowException()
{
  return MEMORY[0x1F410BA38]();
}

uint64_t DSPGraph::Box::initialize(DSPGraph::Box *this)
{
  return MEMORY[0x1F410BA48](this);
}

uint64_t DSPGraph::Box::uninitialize(DSPGraph::Box *this)
{
  return MEMORY[0x1F410BA50](this);
}

uint64_t DSPGraph::Box::addRenderCallback()
{
  return MEMORY[0x1F410BA58]();
}

uint64_t DSPGraph::Box::totalLatencyInTicks(DSPGraph::Box *this)
{
  return MEMORY[0x1F410BA60](this);
}

uint64_t DSPGraph::Box::upstreamLatencyInTicks(DSPGraph::Box *this)
{
  return MEMORY[0x1F410BA80](this);
}

uint64_t DSPGraph::Box::propagateFlagsAndTimeStamp(DSPGraph::Box *this, uint64_t a2, const AudioTimeStamp *a3)
{
  return MEMORY[0x1F410BA88](this, a2, a3);
}

uint64_t DSPGraph::Box::reset(DSPGraph::Box *this)
{
  return MEMORY[0x1F410BA90](this);
}

uint64_t DSPGraph::Box::Box(DSPGraph::Box *this)
{
  return MEMORY[0x1F410BA98](this);
}

void DSPGraph::Box::~Box(DSPGraph::Box *this)
{
}

uint64_t DSPGraph::Graph::initialize(DSPGraph::Graph *this)
{
  return MEMORY[0x1F410BAA8](this);
}

uint64_t DSPGraph::Graph::setAUStrip(DSPGraph::Graph *this, const __CFDictionary *a2)
{
  return MEMORY[0x1F410BAB0](this, a2);
}

uint64_t DSPGraph::Graph::unconfigure(DSPGraph::Graph *this)
{
  return MEMORY[0x1F410BAB8](this);
}

uint64_t DSPGraph::Graph::uninitialize(DSPGraph::Graph *this)
{
  return MEMORY[0x1F410BAC0](this);
}

uint64_t DSPGraph::Graph::writeDotFile(DSPGraph::Graph *this, const char *a2, const char *a3)
{
  return MEMORY[0x1F410BAD0](this, a2, a3);
}

uint64_t DSPGraph::Graph::processInPlace()
{
  return MEMORY[0x1F410BAE0]();
}

uint64_t DSPGraph::Graph::processMultiple()
{
  return MEMORY[0x1F410BAE8]();
}

uint64_t DSPGraph::Graph::setPropertyStrip(DSPGraph::Graph *this, const __CFDictionary *a2, const __CFString *a3)
{
  return MEMORY[0x1F410BB00](this, a2, a3);
}

uint64_t DSPGraph::Graph::setSliceDuration()
{
  return MEMORY[0x1F410BB08]();
}

uint64_t DSPGraph::Graph::add()
{
  return MEMORY[0x1F410BB28]();
}

uint64_t DSPGraph::Graph::box()
{
  return MEMORY[0x1F410BB38]();
}

uint64_t DSPGraph::Graph::reset(DSPGraph::Graph *this)
{
  return MEMORY[0x1F410BB40](this);
}

uint64_t DSPGraph::Graph::connect()
{
  return MEMORY[0x1F410BB48]();
}

uint64_t DSPGraph::Graph::addInput()
{
  return MEMORY[0x1F410BB58]();
}

uint64_t DSPGraph::Graph::addOutput()
{
  return MEMORY[0x1F410BB60]();
}

uint64_t DSPGraph::Graph::configure(DSPGraph::Graph *this)
{
  return MEMORY[0x1F410BB68](this);
}

uint64_t DSPGraph::Graph::preflight()
{
  return MEMORY[0x1F410BB78]();
}

uint64_t DSPGraph::Graph::Graph(DSPGraph::Graph *this)
{
  return MEMORY[0x1F410BB80](this);
}

uint64_t DSPGraph::Buffer::copyTimeFrom()
{
  return MEMORY[0x1F410BB88]();
}

uint64_t DSPGraph::Buffer::restoreSizeToCapacity(DSPGraph::Buffer *this)
{
  return MEMORY[0x1F410BB90](this);
}

uint64_t DSPGraph::Buffer::copyFrom(DSPGraph::Buffer *this, DSPGraph::Buffer *a2)
{
  return MEMORY[0x1F410BB98](this, a2);
}

uint64_t DSPGraph::printi()
{
  return MEMORY[0x1F410BBA0]();
}

uint64_t DSPGraph::SimpleABL::SimpleABL(DSPGraph::SimpleABL *this, AudioBufferList *a2)
{
  return MEMORY[0x1F410BBA8](this, a2);
}

uint64_t DSPGraph::SimpleABL::SimpleABL(DSPGraph::SimpleABL *this)
{
  return MEMORY[0x1F410BBB0](this);
}

void DSPGraph::SimpleABL::~SimpleABL(DSPGraph::SimpleABL *this)
{
}

uint64_t DSPGraph::strprintf(DSPGraph *this, const char *a2, ...)
{
  return MEMORY[0x1F410BBC0](this, a2);
}

uint64_t AT::RingBuffer::GetTimeBounds(AT::RingBuffer *this)
{
  return MEMORY[0x1F410BBC8](this);
}

uint64_t DSPGraph::Box::sampleRate(DSPGraph::Box *this)
{
  return MEMORY[0x1F410BBD8](this);
}

uint64_t DSPGraph::Box::initialized(DSPGraph::Box *this)
{
  return MEMORY[0x1F410BBE0](this);
}

uint64_t DSPGraph::Box::print()
{
  return MEMORY[0x1F410BBE8]();
}

uint64_t DSPGraph::FCBox::upstreamBlockSize(DSPGraph::FCBox *this)
{
  return MEMORY[0x1F410BBF0](this);
}

uint64_t DSPGraph::FCBox::downstreamBlockSize(DSPGraph::FCBox *this)
{
  return MEMORY[0x1F410BBF8](this);
}

uint64_t DSPGraph::FCBox::downstreamSampleRate(DSPGraph::FCBox *this)
{
  return MEMORY[0x1F410BC00](this);
}

uint64_t DSPGraph::FCBox::downstreamSampleTime(DSPGraph::FCBox *this)
{
  return MEMORY[0x1F410BC08](this);
}

uint64_t DSPGraph::FCBox::downstreamFramesPerPacket(DSPGraph::FCBox *this)
{
  return MEMORY[0x1F410BC10](this);
}

uint64_t DSPGraph::Graph::numOutputs(DSPGraph::Graph *this)
{
  return MEMORY[0x1F410BC18](this);
}

uint64_t DSPGraph::Graph::in(DSPGraph::Graph *this)
{
  return MEMORY[0x1F410BC40](this);
}

uint64_t DSPGraph::Graph::out(DSPGraph::Graph *this)
{
  return MEMORY[0x1F410BC48](this);
}

uint64_t DSPGraph::Graph::numInputs(DSPGraph::Graph *this)
{
  return MEMORY[0x1F410BC58](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E438](this, a2);
}

{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1F417E4B8](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x1F417E4D0](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5C0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E608](this, __pos, __s, __n);
}

const std::error_category *std::system_category(void)
{
  return (const std::error_category *)MEMORY[0x1F417E9E0]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x1F417EE78](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, uint64_t __val)
{
  return (std::string *)MEMORY[0x1F417EE80](retstr, __val);
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

{
  return MEMORY[0x1F41813D0]();
}

{
  return MEMORY[0x1F41813F0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x1F4186398]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t e5rt_buffer_object_alloc()
{
  return MEMORY[0x1F4118058]();
}

uint64_t e5rt_buffer_object_get_data_ptr()
{
  return MEMORY[0x1F4118070]();
}

uint64_t e5rt_execution_stream_create()
{
  return MEMORY[0x1F41181C8]();
}

uint64_t e5rt_execution_stream_execute_sync()
{
  return MEMORY[0x1F41181E8]();
}

uint64_t e5rt_execution_stream_operation_create_precompiled_compute_operation()
{
  return MEMORY[0x1F4118220]();
}

uint64_t e5rt_execution_stream_operation_reshape_operation()
{
  return MEMORY[0x1F41182B8]();
}

uint64_t e5rt_execution_stream_operation_retain_input_port()
{
  return MEMORY[0x1F41182D8]();
}

uint64_t e5rt_execution_stream_operation_retain_output_port()
{
  return MEMORY[0x1F41182E8]();
}

uint64_t e5rt_io_port_retain_buffer_object()
{
  return MEMORY[0x1F41183A8]();
}

uint64_t e5rt_io_port_retain_tensor_desc()
{
  return MEMORY[0x1F41183C0]();
}

uint64_t e5rt_operand_desc_retain_from_tensor_desc()
{
  return MEMORY[0x1F41183E0]();
}

uint64_t e5rt_tensor_desc_create()
{
  return MEMORY[0x1F4118510]();
}

uint64_t e5rt_tensor_desc_dtype_create()
{
  return MEMORY[0x1F4118528]();
}

uint64_t e5rt_tensor_desc_dtype_get_component_dtype()
{
  return MEMORY[0x1F4118538]();
}

uint64_t e5rt_tensor_desc_dtype_get_num_components()
{
  return MEMORY[0x1F4118560]();
}

uint64_t e5rt_tensor_desc_get_shape()
{
  return MEMORY[0x1F4118590]();
}

uint64_t e5rt_tensor_desc_get_size()
{
  return MEMORY[0x1F4118598]();
}

long double exp(long double __x)
{
  MEMORY[0x1F40CBFE0](__x);
  return result;
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1F40CC0D8](*(void *)&a1, a2, a3, *(void *)&a4);
}

void free(void *a1)
{
}

uid_t geteuid(void)
{
  return MEMORY[0x1F40CC3B8]();
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1F40CC940](*(void *)&error_value);
}

uint64_t mach_get_times()
{
  return MEMORY[0x1F40CC948]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

uint64_t os_enumerate_boot_args_b()
{
  return MEMORY[0x1F40CD2C8]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1F40CD570]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x1F40CD5F0](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1F40CD610]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1F40CD628]();
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1F40CD630]();
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocEmptyBox()
{
  return MEMORY[0x1F41863D8]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1F4186478]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1F4188200]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1F4188208]();
}

uint64_t swift_deallocBox()
{
  return MEMORY[0x1F4186480]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1F4186498]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_deallocUninitializedObject()
{
  return MEMORY[0x1F41864A8]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1F4188218]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1F4188220]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1F41864D0]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x1F41864F0]();
}

uint64_t swift_dynamicCastTypeToObjCProtocolConditional()
{
  return MEMORY[0x1F4186500]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1F4186538]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getFunctionTypeMetadata0()
{
  return MEMORY[0x1F41865C0]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1F4186638]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x1F4186698]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1F41866A0]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x1F41866C0]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull()
{
  return MEMORY[0x1F41866F0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x1F4186730]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1F41867A8]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1F41867B0]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1F41867D8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1F41867E8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x1F4186848]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x1F4186850]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x1F4186870]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x1F4186878]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x1F41868A0]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1F41868B8]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1F41868C0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1F41868C8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1F41868E8]();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

void vDSP_DFT_DestroySetup(vDSP_DFT_Setup __Setup)
{
}

void vDSP_DFT_Execute(const vDSP_DFT_SetupStruct *__Setup, const float *__Ir, const float *__Ii, float *__Or, float *__Oi)
{
}

vDSP_DFT_Setup vDSP_DFT_zrop_CreateSetup(vDSP_DFT_Setup __Previous, vDSP_Length __Length, vDSP_DFT_Direction __Direction)
{
  return (vDSP_DFT_Setup)MEMORY[0x1F40D1980](__Previous, __Length, *(void *)&__Direction);
}

void vDSP_ctoz(const DSPComplex *__C, vDSP_Stride __IC, const DSPSplitComplex *__Z, vDSP_Stride __IZ, vDSP_Length __N)
{
}

void vDSP_dotpr(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Length __N)
{
}

void vDSP_hann_window(float *__C, vDSP_Length __N, int __Flag)
{
}

void vDSP_mtrans(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __M, vDSP_Length __N)
{
}

void vDSP_vadd(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vdbcon(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N, unsigned int __F)
{
}

void vDSP_vdpsp(const double *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vmul(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsadd(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsmul(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_zvmags(const DSPSplitComplex *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vvsqrtf(float *a1, const float *a2, const int *a3)
{
}