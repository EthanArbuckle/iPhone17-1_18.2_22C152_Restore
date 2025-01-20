BOOL ModelMonitoringDataTrialIdentifierReadFrom(uint64_t a1, uint64_t a2)
{
  char v4;
  unsigned int v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  int v10;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      v4 = 0;
      v5 = 0;
      v6 = 0;
      while (1)
      {
        v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
        v6 |= (unint64_t)(v8 & 0x7F) << v4;
        if ((v8 & 0x80) == 0) {
          goto LABEL_11;
        }
        v4 += 7;
        if (v5++ >= 9)
        {
          v6 = 0;
          v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        v6 = 0;
      }
LABEL_13:
      if (v10 || (v6 & 7) == 4) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      v12 = v6 >> 3;
      if ((v6 >> 3) == 3) {
        break;
      }
      if (v12 == 2)
      {
        v13 = PBReaderReadString();
        v14 = 24;
        goto LABEL_23;
      }
      if (v12 == 1)
      {
        v13 = PBReaderReadString();
        v14 = 16;
LABEL_23:
        v15 = *(void **)(a1 + v14);
        *(void *)(a1 + v14) = v13;

        goto LABEL_25;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_25:
      if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
    }
    v13 = PBReaderReadString();
    v14 = 8;
    goto LABEL_23;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t ModelMonitoringDataAnomalyMessageReadFrom(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
    return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
  }
  while (2)
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    switch((v6 >> 3))
    {
      case 1u:
        char v12 = 0;
        unsigned int v13 = 0;
        uint64_t v14 = 0;
        *(unsigned char *)(a1 + 40) |= 1u;
        while (1)
        {
          unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
          v14 |= (unint64_t)(v16 & 0x7F) << v12;
          if ((v16 & 0x80) == 0) {
            goto LABEL_48;
          }
          v12 += 7;
          BOOL v9 = v13++ >= 9;
          if (v9)
          {
            LODWORD(v14) = 0;
            goto LABEL_50;
          }
        }
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_48:
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v14) = 0;
        }
LABEL_50:
        uint64_t v27 = 8;
        goto LABEL_59;
      case 2u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v14 = 0;
        *(unsigned char *)(a1 + 40) |= 2u;
        while (2)
        {
          unint64_t v20 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v20 == -1 || v20 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v21 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v20);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v20 + 1;
            v14 |= (unint64_t)(v21 & 0x7F) << v18;
            if (v21 < 0)
            {
              v18 += 7;
              BOOL v9 = v19++ >= 9;
              if (v9)
              {
                LODWORD(v14) = 0;
                goto LABEL_54;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v14) = 0;
        }
LABEL_54:
        uint64_t v27 = 24;
        goto LABEL_59;
      case 3u:
        char v22 = 0;
        unsigned int v23 = 0;
        uint64_t v14 = 0;
        *(unsigned char *)(a1 + 40) |= 4u;
        while (2)
        {
          unint64_t v24 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v24 == -1 || v24 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v25 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v24);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v24 + 1;
            v14 |= (unint64_t)(v25 & 0x7F) << v22;
            if (v25 < 0)
            {
              v22 += 7;
              BOOL v9 = v23++ >= 9;
              if (v9)
              {
                LODWORD(v14) = 0;
                goto LABEL_58;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v14) = 0;
        }
LABEL_58:
        uint64_t v27 = 28;
LABEL_59:
        *(_DWORD *)(a1 + v27) = v14;
        goto LABEL_60;
      case 4u:
        v26 = objc_alloc_init(ModelMonitoringDataTrialIdentifier);
        objc_storeStrong((id *)(a1 + 32), v26);
        if (!PBReaderPlaceMark() || !ModelMonitoringDataTrialIdentifierReadFrom((uint64_t)v26, a2)) {
          goto LABEL_62;
        }
        goto LABEL_46;
      case 5u:
        v26 = objc_alloc_init(ModelMonitoringDataDataStateFromSingleSource);
        [(id)a1 addDataStates:v26];
        if (PBReaderPlaceMark()
          && (ModelMonitoringDataDataStateFromSingleSourceReadFrom((uint64_t)v26, a2) & 1) != 0)
        {
LABEL_46:
          PBReaderRecallMark();

LABEL_60:
          if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
          }
          continue;
        }
LABEL_62:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_60;
    }
  }
}

uint64_t ModelMonitoringDataDataStateFromSingleSourceReadFrom(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 2)
    {
      char v14 = 0;
      unsigned int v15 = 0;
      uint64_t v16 = 0;
      *(unsigned char *)(a1 + 24) |= 1u;
      while (1)
      {
        unint64_t v17 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v17 == -1 || v17 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v18 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v17);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v17 + 1;
        v16 |= (unint64_t)(v18 & 0x7F) << v14;
        if ((v18 & 0x80) == 0) {
          goto LABEL_30;
        }
        v14 += 7;
        BOOL v9 = v15++ >= 9;
        if (v9)
        {
          LODWORD(v16) = 0;
          goto LABEL_32;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_30:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v16) = 0;
      }
LABEL_32:
      *(_DWORD *)(a1 + 8) = v16;
    }
    else if ((v6 >> 3) == 1)
    {
      uint64_t v12 = PBReaderReadString();
      unsigned int v13 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v12;
    }
    else
    {
      uint64_t result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t sub_100003CD4()
{
  uint64_t v0 = sub_100009680();
  sub_100008E94(v0, qword_100010FB0);
  sub_100008CA0(v0, (uint64_t)qword_100010FB0);
  return sub_100009670();
}

uint64_t sub_100003D58()
{
  uint64_t v0 = sub_100009650();
  sub_100008E94(v0, qword_100010FC8);
  sub_100008CA0(v0, (uint64_t)qword_100010FC8);
  return sub_100009640();
}

unint64_t sub_100003DA4(char a1, double a2)
{
  uint64_t v4 = sub_1000098A0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  unint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = &type metadata for ModelMonitoringLighthousePluginConfig;
  LOBYTE(v14) = a1;
  unint64_t v15 = *(void *)&a2;
  sub_100009880();
  sub_100009890();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  char v8 = sub_100003F34();
  swift_release();
  unint64_t v14 = 0xD000000000000026;
  unint64_t v15 = 0x800000010000A960;
  unsigned int v13 = v8;
  sub_100006D48(&qword_100010A40);
  sub_100008F50();
  uint64_t v9 = sub_1000096A0();
  v11 = v10;
  swift_bridgeObjectRelease();
  v17._countAndFlagsBits = v9;
  v17._object = v11;
  sub_1000096E0(v17);
  swift_bridgeObjectRelease();
  v18._countAndFlagsBits = 41;
  v18._object = (void *)0xE100000000000000;
  sub_1000096E0(v18);
  return v14;
}

char *sub_100003F34()
{
  swift_retain();
  sub_1000097A0();
  swift_release();
  sub_1000097E0();
  if (*((void *)&v9 + 1))
  {
    uint64_t v0 = (char *)&_swiftEmptyArrayStorage;
    do
    {
      v6[0] = v7;
      v6[1] = v8;
      v6[2] = v9;
      v1._object = (void *)*((void *)&v7 + 1);
      if (*((void *)&v7 + 1))
      {
        v1._countAndFlagsBits = *(void *)&v6[0];
        sub_1000096E0(v1);
        v10._countAndFlagsBits = 8250;
        v10._object = (void *)0xE200000000000000;
        sub_1000096E0(v10);
        sub_1000097B0();
        sub_100008FF4((uint64_t)v6, &qword_100010A50);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v0 = sub_1000073D8(0, *((void *)v0 + 2) + 1, 1, v0);
        }
        unint64_t v3 = *((void *)v0 + 2);
        unint64_t v2 = *((void *)v0 + 3);
        if (v3 >= v2 >> 1) {
          uint64_t v0 = sub_1000073D8((char *)(v2 > 1), v3 + 1, 1, v0);
        }
        *((void *)v0 + 2) = v3 + 1;
        uint64_t v4 = &v0[16 * v3];
        *((void *)v4 + 4) = 0;
        *((void *)v4 + 5) = 0xE000000000000000;
      }
      else
      {
        sub_100008FF4((uint64_t)v6, &qword_100010A50);
      }
      sub_1000097E0();
    }
    while (*((void *)&v9 + 1));
  }
  else
  {
    uint64_t v0 = (char *)&_swiftEmptyArrayStorage;
  }
  swift_release();
  return v0;
}

uint64_t sub_1000040E0(char a1)
{
  if (a1) {
    return 0xD000000000000011;
  }
  else {
    return 0x726150776F6C6C61;
  }
}

BOOL sub_100004124(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_10000413C()
{
  Swift::UInt v1 = *v0;
  sub_100009850();
  sub_100009860(v1);
  return sub_100009870();
}

void sub_100004184()
{
  sub_100009860(*v0);
}

Swift::Int sub_1000041B0()
{
  Swift::UInt v1 = *v0;
  sub_100009850();
  sub_100009860(v1);
  return sub_100009870();
}

uint64_t sub_1000041F4()
{
  return sub_1000040E0(*v0);
}

uint64_t sub_1000041FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100007D90(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100004224()
{
  return 0;
}

void sub_100004230(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_10000423C(uint64_t a1)
{
  unint64_t v2 = sub_100008074();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100004278(uint64_t a1)
{
  unint64_t v2 = sub_100008074();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000042B4(void *a1)
{
  uint64_t v3 = sub_100006D48(&qword_1000109F0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008030(a1, a1[3]);
  sub_100008074();
  sub_1000098C0();
  char v10 = 0;
  sub_100009810();
  if (!v1)
  {
    char v9 = 1;
    sub_100009820();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

void sub_10000441C(void *a1@<X0>, uint64_t a2@<X8>)
{
  double v5 = sub_100007E88(a1);
  if (!v2)
  {
    *(unsigned char *)a2 = v4 & 1;
    *(double *)(a2 + 8) = v5;
  }
}

uint64_t sub_100004450(void *a1)
{
  return sub_1000042B4(a1);
}

unint64_t sub_100004470()
{
  return sub_100003DA4(*(unsigned char *)v0, *(double *)(v0 + 8));
}

void sub_10000447C(void *a1@<X8>)
{
  id v2 = [self clientWithIdentifier:210];
  NSString v3 = sub_1000096B0();
  id v4 = [v2 experimentIdentifiersWithNamespaceName:v3];

  if (qword_100010A60 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_100009680();
  sub_100008CA0(v5, (uint64_t)qword_100010FB0);
  id v6 = v4;
  long long v7 = sub_100009660();
  os_log_type_t v8 = sub_100009720();
  if (os_log_type_enabled(v7, v8))
  {
    char v9 = (uint8_t *)swift_slowAlloc();
    char v10 = (void *)swift_slowAlloc();
    *(_DWORD *)char v9 = 138412290;
    if (v6)
    {
      id v11 = v6;
      sub_100009750();
    }
    else
    {
      sub_100009750();
      id v4 = 0;
    }
    *char v10 = v4;

    _os_log_impl((void *)&_mh_execute_header, v7, v8, "mm pligin: TrialRecipe: Trial identifiers: %@", v9, 0xCu);
    sub_100006D48(&qword_100010A20);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    if (!v6) {
      goto LABEL_10;
    }
  }
  else
  {

    if (!v6)
    {
LABEL_10:

      uint64_t v15 = 0;
      uint64_t v17 = 0;
      uint64_t v19 = 0;
      uint64_t v20 = 0;
      uint64_t v22 = 0;
      goto LABEL_11;
    }
  }
  id v12 = v6;
  id v13 = [v12 experimentId];
  id v6 = (id)sub_1000096C0();
  uint64_t v15 = v14;

  id v16 = [v12 treatmentId];
  uint64_t v17 = sub_1000096C0();
  uint64_t v19 = v18;

  [v12 deploymentId];
  uint64_t v20 = sub_100009830();
  uint64_t v22 = v21;

LABEL_11:
  *a1 = v6;
  a1[1] = v15;
  a1[2] = v17;
  a1[3] = v19;
  a1[4] = v20;
  a1[5] = v22;
}

id sub_1000047A4()
{
  id v0 = [self clientWithIdentifier:210];
  NSString v1 = sub_1000096B0();
  id v2 = [v0 experimentIdentifiersWithNamespaceName:v1];

  if (qword_100010A60 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_100009680();
  sub_100008CA0(v3, (uint64_t)qword_100010FB0);
  id v4 = v2;
  uint64_t v5 = sub_100009660();
  os_log_type_t v6 = sub_100009720();
  if (os_log_type_enabled(v5, v6))
  {
    long long v7 = (uint8_t *)swift_slowAlloc();
    os_log_type_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)long long v7 = 138412290;
    if (v4)
    {
      uint64_t v20 = (uint64_t)v4;
      id v9 = v4;
      sub_100009750();
    }
    else
    {
      uint64_t v20 = 0;
      sub_100009750();
      id v2 = 0;
    }
    *os_log_type_t v8 = v2;

    _os_log_impl((void *)&_mh_execute_header, v5, v6, "TrialAsset: Trial identifiers: %@", v7, 0xCu);
    sub_100006D48(&qword_100010A20);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  NSString v10 = sub_1000096B0();
  NSString v11 = sub_1000096B0();
  id v12 = [v0 levelForFactor:v10 withNamespaceName:v11];

  if (!v12)
  {

    goto LABEL_17;
  }
  id result = [v12 fileValue];
  if (result)
  {
    uint64_t v14 = result;
    id v15 = [result path];

    if (v15)
    {
      uint64_t v16 = sub_1000096C0();

      return (id)v16;
    }
    uint64_t v17 = sub_100009660();
    uint64_t v18 = sub_100009730();
    if (os_log_type_enabled(v17, (os_log_type_t)v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      *(_DWORD *)uint64_t v19 = 136315138;
      sub_1000074E8(0xD00000000000001FLL, 0x800000010000A8F0, &v20);
      sub_100009750();
      _os_log_impl((void *)&_mh_execute_header, v17, (os_log_type_t)v18, "TrialAsset: Config file path not found in %s namespace", v19, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return 0;
    }

LABEL_17:
    return 0;
  }
  __break(1u);
  return result;
}

void sub_100004BFC(uint64_t a1)
{
  id v2 = [self sharedInstance];
  if (v2)
  {
    oslog = v2;
    [v2 logMessage:a1];
  }
  else
  {
    if (qword_100010A60 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_100009680();
    sub_100008CA0(v3, (uint64_t)qword_100010FB0);
    oslog = sub_100009660();
    os_log_type_t v4 = sub_100009730();
    if (os_log_type_enabled(oslog, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v4, "Unable to get PETEventTracker2", v5, 2u);
      swift_slowDealloc();
    }
  }
}

uint64_t sub_100004D24()
{
  id v0 = [self defaultManager];
  NSString v1 = sub_1000096B0();
  id v2 = [v0 contentsAtPath:v1];

  if (!v2)
  {
    if (qword_100010A60 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_100009680();
    sub_100008CA0(v11, (uint64_t)qword_100010FB0);
    id v12 = sub_100009660();
    os_log_type_t v13 = sub_100009720();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "mm plugin: Unable to read plist data.", v14, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
  uint64_t v3 = sub_1000095A0();
  unint64_t v5 = v4;

  os_log_type_t v6 = self;
  Class isa = sub_100009590().super.isa;
  v23[0] = 0;
  id v8 = [v6 propertyListWithData:isa options:0 format:0 error:v23];

  if (!v8)
  {
    id v15 = v23[0];
    sub_100009580();

    swift_willThrow();
    if (qword_100010A60 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_100009680();
    sub_100008CA0(v16, (uint64_t)qword_100010FB0);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v17 = sub_100009660();
    os_log_type_t v18 = sub_100009720();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v19 = 138412290;
      swift_errorRetain();
      uint64_t v21 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v23[0] = v21;
      sub_100009750();
      *uint64_t v20 = v21;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "mm plugin: Error reading plist file: %@", v19, 0xCu);
      sub_100006D48(&qword_100010A20);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      sub_100008EF8(v3, v5);

      swift_errorRelease();
    }
    else
    {
      sub_100008EF8(v3, v5);
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
    }
    return 0;
  }
  id v9 = v23[0];
  sub_100009770();
  sub_100008EF8(v3, v5);
  swift_unknownObjectRelease();
  sub_100006D48(&qword_100010A38);
  if (swift_dynamicCast()) {
    return v22;
  }
  else {
    return 0;
  }
}

uint64_t sub_100005140()
{
  if (qword_100010A60 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100009680();
  sub_100008CA0(v0, (uint64_t)qword_100010FB0);
  NSString v1 = sub_100009660();
  os_log_type_t v2 = sub_100009720();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "mm plugin: started interaction store", v3, 2u);
    swift_slowDealloc();
  }

  unint64_t v4 = self;
  NSString v5 = [v4 defaultDatabaseDirectory];
  if (v5)
  {
    sub_1000096C0();

    NSString v5 = sub_1000096B0();
    swift_bridgeObjectRelease();
  }
  os_log_type_t v6 = [v4 storeWithDirectory:v5 readOnly:1];

  id v7 = [self predicateWithValue:1];
  id v8 = objc_allocWithZone((Class)NSSortDescriptor);
  NSString v9 = sub_1000096B0();
  id v10 = [v8 initWithKey:v9 ascending:1];

  uint64_t v11 = sub_100009660();
  os_log_type_t v12 = sub_100009720();
  if (os_log_type_enabled(v11, v12))
  {
    os_log_type_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "mm plugin: in the middle of the interaction store", v13, 2u);
    swift_slowDealloc();
  }

  uint64_t v14 = -1;
  uint64_t v40 = -1;
  if (v6)
  {
    sub_100006D48(&qword_100010A28);
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_10000B320;
    *(void *)(v15 + 56) = sub_100008E58(0, &qword_100010A30);
    *(void *)(v15 + 32) = v10;
    id v16 = v7;
    id v17 = v10;
    os_log_type_t v18 = v6;
    Class isa = sub_100009700().super.isa;
    swift_bridgeObjectRelease();
    v41[0] = 0;
    id v20 = [v18 queryInteractionsUsingPredicate:v16 sortDescriptors:isa limit:10000 error:v41];

    id v21 = v41[0];
    if (v20)
    {
      uint64_t v22 = sub_100009710();
      id v23 = v21;

      uint64_t v14 = *(void *)(v22 + 16);
      swift_bridgeObjectRelease();
      uint64_t v40 = v14;
    }
    else
    {
      id v24 = v41[0];
      sub_100009580();

      swift_willThrow();
      swift_errorRetain();
      swift_errorRetain();
      char v25 = sub_100009660();
      os_log_type_t v26 = sub_100009720();
      if (os_log_type_enabled(v25, v26))
      {
        log = v25;
        uint64_t v27 = (uint8_t *)swift_slowAlloc();
        v28 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v27 = 138412290;
        swift_errorRetain();
        v29 = (void *)_swift_stdlib_bridgeErrorToNSError();
        v41[0] = v29;
        sub_100009750();
        void *v28 = v29;
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, log, v26, "Unexpected error throws: %@", v27, 0xCu);
        sub_100006D48(&qword_100010A20);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        swift_errorRelease();
      }
      else
      {
        swift_errorRelease();
        swift_errorRelease();
        swift_errorRelease();
      }
    }
  }
  v30 = sub_100009660();
  os_log_type_t v31 = sub_100009720();
  if (os_log_type_enabled(v30, v31))
  {
    v32 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v32 = 134217984;
    v41[0] = (id)v14;
    sub_100009750();
    _os_log_impl((void *)&_mh_execute_header, v30, v31, "mm plugin: interactionSize = %ld", v32, 0xCu);
    swift_slowDealloc();
  }

  v33 = sub_100009660();
  os_log_type_t v34 = sub_100009720();
  if (os_log_type_enabled(v33, v34))
  {
    v35 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v35 = 0;
    _os_log_impl((void *)&_mh_execute_header, v33, v34, "mm plugin: done with the interaction store", v35, 2u);
    swift_slowDealloc();
    v36 = v6;
    v37 = v7;
  }
  else
  {
    v36 = v33;
    v37 = v10;
    id v10 = v7;
    v33 = v6;
  }

  swift_beginAccess();
  return v40;
}

void sub_100005778(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (qword_100010A60 != -1) {
    swift_once();
  }
  uint64_t v100 = a5;
  uint64_t v8 = sub_100009680();
  sub_100008CA0(v8, (uint64_t)qword_100010FB0);
  NSString v9 = sub_100009660();
  os_log_type_t v10 = sub_100009720();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "mm plugin starting PET message!", v11, 2u);
    swift_slowDealloc();
  }

  sub_10000447C(v105);
  sub_100008DF0((uint64_t)v105, (uint64_t)v106);
  if (!v106[1]) {
    goto LABEL_89;
  }
  os_log_type_t v12 = [objc_allocWithZone((Class)ModelMonitoringDataTrialIdentifier) init];
  if (!v12)
  {
LABEL_90:
    __break(1u);
    goto LABEL_91;
  }
  os_log_type_t v13 = v12;
  NSString v14 = sub_1000096B0();
  [v13 setTask:v14];

  NSString v15 = sub_1000096B0();
  [v13 setTreatment:v15];

  NSString v16 = sub_1000096B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  [v13 setDeployment:v16];

  uint64_t v17 = v100;
  v96 = v13;
  if (a2 < 1) {
    goto LABEL_26;
  }
  id v18 = [objc_allocWithZone((Class)ModelMonitoringDataAnomalyMessage) init];
  if (!v18)
  {
LABEL_91:
    __break(1u);
    goto LABEL_92;
  }
  uint64_t v19 = v18;
  [v18 setAnomalyType:1];
  if ((unint64_t)a2 >> 31)
  {
    __break(1u);
    goto LABEL_69;
  }
  [v19 setOccuranceCount:a2];
  if (a1 < (uint64_t)0xFFFFFFFF80000000)
  {
LABEL_69:
    __break(1u);
    goto LABEL_70;
  }
  if (a1 > 0x7FFFFFFF)
  {
LABEL_70:
    __break(1u);
LABEL_71:
    __break(1u);
    goto LABEL_72;
  }
  [v19 setTotalEventCount:a1];
  [v19 setTrialIdentifier:v13];
  sub_100008E58(0, &qword_100010A18);
  id v20 = (void *)sub_100009740();
  [v19 setDataStates:v20];

  id v21 = [objc_allocWithZone((Class)ModelMonitoringDataDataStateFromSingleSource) init];
  if (!v21)
  {
LABEL_92:
    __break(1u);
    goto LABEL_93;
  }
  uint64_t v22 = v21;
  NSString v23 = sub_1000096B0();
  [v22 setSourceName:v23];

  [v22 setRecordCount:a1];
  id v24 = [v19 dataStates];
  if (!v24)
  {
LABEL_93:
    __break(1u);
    goto LABEL_94;
  }
  char v25 = v24;
  [v24 addObject:v22];

  id v26 = [objc_allocWithZone((Class)ModelMonitoringDataDataStateFromSingleSource) init];
  if (!v26)
  {
LABEL_94:
    __break(1u);
    goto LABEL_95;
  }
  uint64_t v27 = v22;
  v28 = v26;
  NSString v29 = sub_1000096B0();
  [v28 setSourceName:v29];

  if (v100 < (uint64_t)0xFFFFFFFF80000000) {
    goto LABEL_71;
  }
  if (v100 > 0x7FFFFFFF)
  {
LABEL_72:
    __break(1u);
LABEL_73:
    __break(1u);
LABEL_74:
    __break(1u);
    goto LABEL_75;
  }
  [v28 setRecordCount:v100];
  id v30 = [v19 dataStates];
  if (!v30)
  {
LABEL_95:
    __break(1u);
    goto LABEL_96;
  }
  os_log_type_t v31 = v30;
  [v30 addObject:v28];

  id v32 = [objc_allocWithZone((Class)ModelMonitoringDataDataStateFromSingleSource) init];
  if (!v32)
  {
LABEL_96:
    __break(1u);
    goto LABEL_97;
  }
  v33 = v32;
  NSString v34 = sub_1000096B0();
  [v33 setSourceName:v34];

  if (a6 < (uint64_t)0xFFFFFFFF80000000) {
    goto LABEL_74;
  }
  if (a6 > 0x7FFFFFFF)
  {
LABEL_76:
    __break(1u);
    goto LABEL_77;
  }
  [v33 setRecordCount:a6];
  id v35 = [v19 dataStates];
  if (!v35)
  {
LABEL_97:
    __break(1u);
    goto LABEL_98;
  }
  v36 = v35;
  [v35 addObject:v33];

  v37 = v19;
  v38 = sub_100009660();
  os_log_type_t v39 = sub_100009720();
  if (os_log_type_enabled(v38, v39))
  {
    uint64_t v40 = (uint8_t *)swift_slowAlloc();
    v93 = (void *)swift_slowAlloc();
    buf = v40;
    *(_DWORD *)uint64_t v40 = 138412290;
    v41 = v37;
    uint64_t v17 = v100;
    sub_100009750();
    void *v93 = v19;

    _os_log_impl((void *)&_mh_execute_header, v38, v39, "mm plugin: message is %@", buf, 0xCu);
    sub_100006D48(&qword_100010A20);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    v38 = v37;
  }

  sub_100004BFC((uint64_t)v37);
LABEL_26:
  uint64_t v42 = a1;
  if (a3 < 1) {
    goto LABEL_45;
  }
  id v43 = [objc_allocWithZone((Class)ModelMonitoringDataAnomalyMessage) init];
  if (!v43)
  {
LABEL_98:
    __break(1u);
    goto LABEL_99;
  }
  v44 = v43;
  [v43 setAnomalyType:4];
  if ((unint64_t)a3 >> 31) {
    goto LABEL_73;
  }
  objc_msgSend(v44, "setOccuranceCount:");
  if (a1 < (uint64_t)0xFFFFFFFF80000000)
  {
LABEL_75:
    __break(1u);
    goto LABEL_76;
  }
  if (a1 > 0x7FFFFFFF)
  {
LABEL_77:
    __break(1u);
LABEL_78:
    __break(1u);
    goto LABEL_79;
  }
  [v44 setTotalEventCount:a1];
  [v44 setTrialIdentifier:v13];
  sub_100008E58(0, &qword_100010A18);
  v45 = (void *)sub_100009740();
  [v44 setDataStates:v45];

  id v46 = [objc_allocWithZone((Class)ModelMonitoringDataDataStateFromSingleSource) init];
  if (!v46)
  {
LABEL_99:
    __break(1u);
    goto LABEL_100;
  }
  v47 = v46;
  NSString v48 = sub_1000096B0();
  [v47 setSourceName:v48];

  [v47 setRecordCount:a1];
  id v49 = [v44 dataStates];
  if (!v49)
  {
LABEL_100:
    __break(1u);
    goto LABEL_101;
  }
  v50 = v49;
  [v49 addObject:v47];

  id v51 = [objc_allocWithZone((Class)ModelMonitoringDataDataStateFromSingleSource) init];
  if (!v51)
  {
LABEL_101:
    __break(1u);
    goto LABEL_102;
  }
  v52 = v51;
  NSString v53 = sub_1000096B0();
  [v52 setSourceName:v53];

  if (v17 < (uint64_t)0xFFFFFFFF80000000) {
    goto LABEL_78;
  }
  if (v17 > 0x7FFFFFFF)
  {
LABEL_79:
    __break(1u);
LABEL_80:
    __break(1u);
LABEL_81:
    __break(1u);
LABEL_82:
    __break(1u);
    goto LABEL_83;
  }
  [v52 setRecordCount:v17];
  id v54 = [v44 dataStates];
  if (!v54)
  {
LABEL_102:
    __break(1u);
    goto LABEL_103;
  }
  v55 = v54;
  v99 = v52;
  [v54 addObject:v52];

  id v56 = [objc_allocWithZone((Class)ModelMonitoringDataDataStateFromSingleSource) init];
  if (!v56)
  {
LABEL_103:
    __break(1u);
    goto LABEL_104;
  }
  v57 = v56;
  NSString v58 = sub_1000096B0();
  [v57 setSourceName:v58];

  if (a6 < (uint64_t)0xFFFFFFFF80000000) {
    goto LABEL_81;
  }
  if (a6 > 0x7FFFFFFF)
  {
LABEL_83:
    __break(1u);
    goto LABEL_84;
  }
  [v57 setRecordCount:a6];
  id v59 = [v44 dataStates];
  if (!v59)
  {
LABEL_104:
    __break(1u);
    goto LABEL_105;
  }
  v60 = v59;
  [v59 addObject:v57];

  v61 = v44;
  v62 = sub_100009660();
  os_log_type_t v63 = sub_100009720();
  if (os_log_type_enabled(v62, v63))
  {
    v64 = (uint8_t *)swift_slowAlloc();
    v94 = (void *)swift_slowAlloc();
    *(_DWORD *)v64 = 138412290;
    v65 = v61;
    sub_100009750();
    void *v94 = v44;

    _os_log_impl((void *)&_mh_execute_header, v62, v63, "mm plugin: message is %@", v64, 0xCu);
    sub_100006D48(&qword_100010A20);
    uint64_t v42 = a1;
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v17 = v100;
    swift_slowDealloc();
  }
  else
  {

    v62 = v61;
  }

  sub_100004BFC((uint64_t)v61);
  os_log_type_t v13 = v96;
LABEL_45:
  if (a4 >= 1)
  {
    id v66 = [objc_allocWithZone((Class)ModelMonitoringDataAnomalyMessage) init];
    if (!v66)
    {
LABEL_105:
      __break(1u);
      goto LABEL_106;
    }
    v67 = v66;
    [v66 setAnomalyType:5];
    if (!((unint64_t)a4 >> 31))
    {
      objc_msgSend(v67, "setOccuranceCount:");
      if (v42 >= (uint64_t)0xFFFFFFFF80000000)
      {
        if (v42 <= 0x7FFFFFFF)
        {
          [v67 setTotalEventCount:v42];
          [v67 setTrialIdentifier:v13];
          sub_100008E58(0, &qword_100010A18);
          v68 = (void *)sub_100009740();
          [v67 setDataStates:v68];

          id v69 = [objc_allocWithZone((Class)ModelMonitoringDataDataStateFromSingleSource) init];
          if (!v69)
          {
LABEL_106:
            __break(1u);
            goto LABEL_107;
          }
          v70 = v69;
          NSString v71 = sub_1000096B0();
          [v70 setSourceName:v71];

          [v70 setRecordCount:v42];
          id v72 = [v67 dataStates];
          if (!v72)
          {
LABEL_107:
            __break(1u);
            goto LABEL_108;
          }
          v73 = v72;
          [v72 addObject:v70];

          id v74 = [objc_allocWithZone((Class)ModelMonitoringDataDataStateFromSingleSource) init];
          if (!v74)
          {
LABEL_108:
            __break(1u);
            goto LABEL_109;
          }
          v75 = v74;
          NSString v76 = sub_1000096B0();
          [v75 setSourceName:v76];

          if (v17 >= (uint64_t)0xFFFFFFFF80000000)
          {
            if (v17 <= 0x7FFFFFFF)
            {
              [v75 setRecordCount:v17];
              id v77 = [v67 dataStates];
              if (!v77)
              {
LABEL_109:
                __break(1u);
                goto LABEL_110;
              }
              v78 = v77;
              [v77 addObject:v75];

              id v79 = [objc_allocWithZone((Class)ModelMonitoringDataDataStateFromSingleSource) init];
              if (!v79)
              {
LABEL_110:
                __break(1u);
                goto LABEL_111;
              }
              v80 = v79;
              NSString v81 = sub_1000096B0();
              [v80 setSourceName:v81];

              if (a6 >= (uint64_t)0xFFFFFFFF80000000)
              {
                if (a6 <= 0x7FFFFFFF)
                {
                  [v80 setRecordCount:a6];
                  id v82 = [v67 dataStates];
                  if (v82)
                  {
                    v83 = v82;
                    [v82 addObject:v80];

                    v84 = v67;
                    v85 = sub_100009660();
                    os_log_type_t v86 = sub_100009720();
                    if (os_log_type_enabled(v85, v86))
                    {
                      v104 = v80;
                      v87 = (uint8_t *)swift_slowAlloc();
                      v101 = (void *)swift_slowAlloc();
                      *(_DWORD *)v87 = 138412290;
                      v88 = v84;
                      os_log_type_t v13 = v96;
                      sub_100009750();
                      void *v101 = v67;

                      v80 = v104;
                      _os_log_impl((void *)&_mh_execute_header, v85, v86, "mm plugin: message is %@", v87, 0xCu);
                      sub_100006D48(&qword_100010A20);
                      swift_arrayDestroy();
                      swift_slowDealloc();
                      swift_slowDealloc();
                    }
                    else
                    {

                      v85 = v84;
                    }

                    sub_100004BFC((uint64_t)v84);
                    goto LABEL_64;
                  }
LABEL_111:
                  __break(1u);
                  return;
                }
                goto LABEL_88;
              }
LABEL_87:
              __break(1u);
LABEL_88:
              __break(1u);
LABEL_89:
              __break(1u);
              goto LABEL_90;
            }
LABEL_86:
            __break(1u);
            goto LABEL_87;
          }
LABEL_85:
          __break(1u);
          goto LABEL_86;
        }
LABEL_84:
        __break(1u);
        goto LABEL_85;
      }
      goto LABEL_82;
    }
    goto LABEL_80;
  }
LABEL_64:
  v89 = sub_100009660();
  os_log_type_t v90 = sub_100009720();
  if (os_log_type_enabled(v89, v90))
  {
    v91 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v91 = 0;
    _os_log_impl((void *)&_mh_execute_header, v89, v90, "mm plugin: done with sending the message to pet!", v91, 2u);
    swift_slowDealloc();
    v92 = v13;
  }
  else
  {
    v92 = v89;
    v89 = v13;
  }
}

uint64_t sub_100006748()
{
  return _swift_task_switch(sub_100006764, 0, 0);
}

uint64_t sub_100006764()
{
  objc_allocWithZone((Class)sub_1000095D0());
  uint64_t v1 = sub_1000095C0();
  os_log_type_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_1000067D8()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_1000109F8 + dword_1000109F8);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100006878;
  return v3();
}

uint64_t sub_100006878(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_100006974(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  NSString v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  *NSString v15 = v7;
  v15[1] = sub_100006A58;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_100006A58()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100006B4C(uint64_t a1)
{
  uint64_t v2 = sub_100007394(&qword_1000109E0);

  return MLHostExtension.configuration.getter(a1, v2);
}

uint64_t sub_100006BB4()
{
  return sub_100009600();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

uint64_t type metadata accessor for ModelMonitoringLighthousePlugin()
{
  uint64_t result = qword_100010A70;
  if (!qword_100010A70) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100006CD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006D48(&qword_100010928);
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_100006D48(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100006D8C(uint64_t a1)
{
  uint64_t v2 = sub_100006D48(&qword_100010928);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_100006DF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006D48(&qword_100010928);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_100006E5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006D48(&qword_100010928);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_100006EC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006D48(&qword_100010928);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_100006F2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006D48(&qword_100010928);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_100006F94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100006FA8);
}

uint64_t sub_100006FA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006D48(&qword_100010928);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_100007018(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000702C);
}

uint64_t sub_10000702C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006D48(&qword_100010928);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

void sub_1000070A0()
{
  sub_10000712C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_10000712C()
{
  if (!qword_100010988)
  {
    sub_100007194();
    sub_1000071E8();
    unint64_t v0 = sub_100009610();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100010988);
    }
  }
}

unint64_t sub_100007194()
{
  unint64_t result = qword_100010990;
  if (!qword_100010990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010990);
  }
  return result;
}

unint64_t sub_1000071E8()
{
  unint64_t result = qword_100010998;
  if (!qword_100010998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010998);
  }
  return result;
}

__n128 initializeBufferWithCopyOfBuffer for ModelMonitoringLighthousePluginConfig(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ModelMonitoringLighthousePluginConfig(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[16]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ModelMonitoringLighthousePluginConfig(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ModelMonitoringLighthousePluginConfig()
{
  return &type metadata for ModelMonitoringLighthousePluginConfig;
}

uint64_t sub_1000072F0()
{
  return sub_100007394(&qword_100010920);
}

uint64_t sub_100007324()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100007394(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for ModelMonitoringLighthousePlugin();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

char *sub_1000073D8(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
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
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100006D48(&qword_100010A58);
      os_log_type_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      os_log_type_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      os_log_type_t v10 = (char *)&_swiftEmptyArrayStorage;
      os_log_type_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_100007C9C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000074E8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000075BC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100008D40((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_100008D40((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100008D9C((uint64_t)v12);
  return v7;
}

uint64_t sub_1000075BC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100009760();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100007778(a5, a6);
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
  uint64_t v8 = sub_100009790();
  if (!v8)
  {
    sub_1000097C0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1000097D0();
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

uint64_t sub_100007778(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100007810(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000079F0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000079F0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100007810(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100007988(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100009780();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_1000097C0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1000096F0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_1000097D0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_1000097C0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100007988(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100006D48(&qword_100010A08);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000079F0(char a1, int64_t a2, char a3, char *a4)
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
    sub_100006D48(&qword_100010A08);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  os_log_type_t v13 = a4 + 32;
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
  uint64_t result = sub_1000097D0();
  __break(1u);
  return result;
}

unint64_t sub_100007B40(uint64_t a1, uint64_t a2)
{
  sub_100009850();
  sub_1000096D0();
  Swift::Int v4 = sub_100009870();

  return sub_100007BB8(a1, a2, v4);
}

unint64_t sub_100007BB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100009840() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        os_log_type_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_100009840() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_100007C9C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_1000097D0();
  __break(1u);
  return result;
}

uint64_t sub_100007D90(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x726150776F6C6C61 && a2 == 0xEC0000006C616974;
  if (v3 || (sub_100009840() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000010000A9D0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_100009840();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

double sub_100007E88(void *a1)
{
  uint64_t v4 = sub_100006D48(&qword_1000109E8);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  int64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008030(a1, a1[3]);
  sub_100008074();
  sub_1000098B0();
  if (!v1)
  {
    char v12 = 0;
    sub_1000097F0();
    char v11 = 1;
    sub_100009800();
    double v2 = v8;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  sub_100008D9C((uint64_t)a1);
  return v2;
}

void *sub_100008030(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_100008074()
{
  unint64_t result = qword_100010D00[0];
  if (!qword_100010D00[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100010D00);
  }
  return result;
}

uint64_t sub_1000080C8()
{
  v1[16] = v0;
  uint64_t v2 = sub_100009680();
  v1[17] = v2;
  v1[18] = *(void *)(v2 - 8);
  v1[19] = swift_task_alloc();
  return _swift_task_switch(sub_100008188, 0, 0);
}

void sub_100008188()
{
  uint64_t v71 = v0;
  if (qword_100010A60 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_100008CA0(*(void *)(v0 + 136), (uint64_t)qword_100010FB0);
  uint64_t v2 = sub_100009660();
  os_log_type_t v3 = sub_100009720();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "mm plugin now started!", v4, 2u);
    swift_slowDealloc();
  }

  uint64_t v5 = sub_100009660();
  os_log_type_t v6 = sub_100009720();
  if (os_log_type_enabled(v5, v6))
  {
    int64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "mm plugin: Checking if Trial has an update on anomaly scheme", v7, 2u);
    swift_slowDealloc();
  }

  id v8 = sub_1000047A4();
  if (v9)
  {
    uint64_t v10 = (uint64_t)v8;
    unint64_t v11 = v9;
    swift_bridgeObjectRetain_n();
    char v12 = sub_100009660();
    os_log_type_t v13 = sub_100009720();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v69 = v10;
      BOOL v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v70 = swift_slowAlloc();
      *(_DWORD *)BOOL v14 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 104) = sub_1000074E8(v69, v11, &v70);
      sub_100009750();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "mm plugin: Trial asset found at path %s, using that", v14, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    id v15 = [self mainBundle];
    NSString v16 = sub_1000096B0();
    NSString v17 = sub_1000096B0();
    char v12 = [v15 pathForResource:v16 ofType:v17];

    if (!v12)
    {
      __break(1u);
      return;
    }
    sub_1000096C0();
  }

  id v18 = (unsigned char *)(v0 + 173);
  uint64_t v19 = sub_100009660();
  os_log_type_t v20 = sub_100009720();
  if (os_log_type_enabled(v19, v20))
  {
    id v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "mm plugin: starting scheme!", v21, 2u);
    swift_slowDealloc();
  }

  *id v18 = 0;
  uint64_t v22 = sub_100004D24();
  swift_bridgeObjectRelease();
  if (v22)
  {
    uint64_t v23 = v0 + 16;
    swift_bridgeObjectRetain_n();
    id v24 = sub_100009660();
    os_log_type_t v25 = sub_100009720();
    if (os_log_type_enabled(v24, v25))
    {
      id v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v70 = swift_slowAlloc();
      *(_DWORD *)id v26 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v27 = v1;
      uint64_t v28 = sub_100009690();
      unint64_t v30 = v29;
      swift_bridgeObjectRelease();
      uint64_t v31 = v28;
      uint64_t v1 = v27;
      *(void *)(v0 + 120) = sub_1000074E8(v31, v30, &v70);
      sub_100009750();
      uint64_t v23 = v0 + 16;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "mm plugin: Plist contents: %s", v26, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      id v18 = (unsigned char *)(v0 + 173);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    if (*(void *)(v22 + 16) && (unint64_t v32 = sub_100007B40(0x6E65704F65746167, 0xE800000000000000), (v33 & 1) != 0))
    {
      sub_100008D40(*(void *)(v22 + 56) + 32 * v32, v0 + 48);
    }
    else
    {
      *(_OWORD *)(v0 + 48) = 0u;
      *(_OWORD *)(v0 + 64) = 0u;
    }
    swift_bridgeObjectRelease();
    sub_100008CD8(v0 + 48, v23);
    if (*(void *)(v0 + 40))
    {
      if (swift_dynamicCast())
      {
        int v34 = *(unsigned __int8 *)(v0 + 172);
        *id v18 = v34;
        id v35 = sub_100009660();
        os_log_type_t v36 = sub_100009720();
        if (os_log_type_enabled(v35, v36))
        {
          v37 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)v37 = 67109120;
          *(_DWORD *)(v0 + 164) = v34;
          sub_100009750();
          _os_log_impl((void *)&_mh_execute_header, v35, v36, "mm plugin: executeMonitoring is %{BOOL}d", v37, 8u);
          swift_slowDealloc();
        }

        v38 = sub_100009660();
        os_log_type_t v39 = sub_100009720();
        if (os_log_type_enabled(v38, v39))
        {
          uint64_t v40 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)uint64_t v40 = 67109120;
          *(_DWORD *)(v0 + 160) = v34;
          sub_100009750();
          _os_log_impl((void *)&_mh_execute_header, v38, v39, "mm plugin: gateOpen is %{BOOL}d", v40, 8u);
          swift_slowDealloc();
        }

        sub_100008FF4(v0 + 48, &qword_100010A00);
        goto LABEL_35;
      }
    }
    else
    {
      sub_100008FF4(v23, &qword_100010A00);
    }
    (*(void (**)(void, uint64_t, void))(*(void *)(v0 + 144) + 16))(*(void *)(v0 + 152), v1, *(void *)(v0 + 136));
    v41 = sub_100009660();
    os_log_type_t v42 = sub_100009720();
    BOOL v43 = os_log_type_enabled(v41, v42);
    uint64_t v45 = *(void *)(v0 + 144);
    uint64_t v44 = *(void *)(v0 + 152);
    uint64_t v46 = *(void *)(v0 + 136);
    if (v43)
    {
      uint64_t v68 = *(void *)(v0 + 136);
      v47 = (uint8_t *)swift_slowAlloc();
      uint64_t v70 = swift_slowAlloc();
      *(_DWORD *)v47 = 136315138;
      *(void *)(v0 + 112) = sub_1000074E8(0x6C616E6F6974704FLL, 0xED00003E796E413CLL, &v70);
      sub_100009750();
      _os_log_impl((void *)&_mh_execute_header, v41, v42, "mm plugin: could not cast gateOpen %s.", v47, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v44, v68);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v44, v46);
    }
    sub_100008FF4(v0 + 48, &qword_100010A00);
  }
LABEL_35:
  NSString v48 = sub_100009660();
  os_log_type_t v49 = sub_100009720();
  if (os_log_type_enabled(v48, v49))
  {
    v50 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v50 = 0;
    _os_log_impl((void *)&_mh_execute_header, v48, v49, "mm plugin: done with scheme!", v50, 2u);
    swift_slowDealloc();
  }

  int v51 = *v18;
  v52 = sub_100009660();
  os_log_type_t v53 = sub_100009720();
  if (os_log_type_enabled(v52, v53))
  {
    id v54 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)id v54 = 67109120;
    *(_DWORD *)(v0 + 168) = v51;
    sub_100009750();
    _os_log_impl((void *)&_mh_execute_header, v52, v53, "mm plugin: executeMonitoring is %{BOOL}d", v54, 8u);
    swift_slowDealloc();
  }

  swift_beginAccess();
  if (*v18 == 1)
  {
    if (qword_100010A68 != -1) {
      swift_once();
    }
    uint64_t v55 = sub_100009650();
    sub_100008CA0(v55, (uint64_t)qword_100010FC8);
    unint64_t v56 = sub_100009620(0.08, 0.02, 0.83, 0.45);
    uint64_t v58 = v57;
    uint64_t v60 = v59;
    uint64_t v62 = v61;
    Swift::Int v63 = sub_100009630();
    uint64_t v64 = sub_100005140();
    sub_100005778(v56, v58, v60, v62, v63, v64);
  }
  id v65 = objc_allocWithZone((Class)sub_1000095D0());
  uint64_t v66 = sub_1000095C0();
  swift_task_dealloc();
  v67 = *(void (**)(uint64_t))(v0 + 8);
  v67(v66);
}

uint64_t sub_100008CA0(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100008CD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006D48(&qword_100010A00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100008D40(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100008D9C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100008DF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006D48(&qword_100010A10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100008E58(uint64_t a1, unint64_t *a2)
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

uint64_t *sub_100008E94(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100008EF8(uint64_t a1, unint64_t a2)
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

unint64_t sub_100008F50()
{
  unint64_t result = qword_100010A48;
  if (!qword_100010A48)
  {
    sub_100008FAC(&qword_100010A40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010A48);
  }
  return result;
}

uint64_t sub_100008FAC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100008FF4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100006D48(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t initializeBufferWithCopyOfBuffer for TrialIdentifier(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for TrialIdentifier()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for TrialIdentifier(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for TrialIdentifier(void *a1, void *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for TrialIdentifier(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

void *assignWithTake for TrialIdentifier(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TrialIdentifier(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TrialIdentifier(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TrialIdentifier()
{
  return &type metadata for TrialIdentifier;
}

unsigned char *initializeBufferWithCopyOfBuffer for ModelMonitoringLighthousePluginConfig.CodingKeys(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ModelMonitoringLighthousePluginConfig.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ModelMonitoringLighthousePluginConfig.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100009428);
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

uint64_t sub_100009450(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000945C(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ModelMonitoringLighthousePluginConfig.CodingKeys()
{
  return &type metadata for ModelMonitoringLighthousePluginConfig.CodingKeys;
}

unint64_t sub_10000947C()
{
  unint64_t result = qword_100010E10[0];
  if (!qword_100010E10[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100010E10);
  }
  return result;
}

unint64_t sub_1000094D4()
{
  unint64_t result = qword_100010F20;
  if (!qword_100010F20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010F20);
  }
  return result;
}

unint64_t sub_10000952C()
{
  unint64_t result = qword_100010F28[0];
  if (!qword_100010F28[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100010F28);
  }
  return result;
}

uint64_t sub_100009580()
{
  return _convertNSErrorToError(_:)();
}

NSData sub_100009590()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_1000095A0()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000095B0()
{
  return static AppExtension.main()();
}

uint64_t sub_1000095C0()
{
  return MLHostResult.init(status:policy:)();
}

uint64_t sub_1000095D0()
{
  return type metadata accessor for MLHostResult();
}

uint64_t sub_100009600()
{
  return MLHostParameters.init(taskParameters:)();
}

uint64_t sub_100009610()
{
  return type metadata accessor for MLHostParameters();
}

unint64_t sub_100009620(Swift::Double mean, Swift::Double std, Swift::Double entropyMean, Swift::Double entropySd)
{
  return (unint64_t)ModelMonitoringLighthouseWorker.monitorScores(mean:std:entropyMean:entropySd:)(mean, std, entropyMean, entropySd);
}

Swift::Int sub_100009630()
{
  return ModelMonitoringLighthouseWorker.monitorVirtualFeatureStore()();
}

uint64_t sub_100009640()
{
  return ModelMonitoringLighthouseWorker.init()();
}

uint64_t sub_100009650()
{
  return type metadata accessor for ModelMonitoringLighthouseWorker();
}

uint64_t sub_100009660()
{
  return Logger.logObject.getter();
}

uint64_t sub_100009670()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100009680()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100009690()
{
  return Dictionary.description.getter();
}

uint64_t sub_1000096A0()
{
  return BidirectionalCollection<>.joined(separator:)();
}

NSString sub_1000096B0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000096C0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000096D0()
{
  return String.hash(into:)();
}

void sub_1000096E0(Swift::String a1)
{
}

Swift::Int sub_1000096F0()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_100009700()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100009710()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100009720()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100009730()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100009740()
{
  return NSArray.init(arrayLiteral:)();
}

uint64_t sub_100009750()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100009760()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100009770()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_100009780()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100009790()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_1000097A0()
{
  return dispatch thunk of _AnySequenceBox._makeIterator()();
}

uint64_t sub_1000097B0()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_1000097C0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000097D0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_1000097E0()
{
  return dispatch thunk of _AnyIteratorBoxBase.next()();
}

uint64_t sub_1000097F0()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100009800()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100009810()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100009820()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100009830()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100009840()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100009850()
{
  return Hasher.init(_seed:)();
}

void sub_100009860(Swift::UInt a1)
{
}

Swift::Int sub_100009870()
{
  return Hasher._finalize()();
}

uint64_t sub_100009880()
{
  return Mirror.init(reflecting:)();
}

uint64_t sub_100009890()
{
  return Mirror.children.getter();
}

uint64_t sub_1000098A0()
{
  return type metadata accessor for Mirror();
}

uint64_t sub_1000098B0()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_1000098C0()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return _PBDataWriterWriteInt32Field();
}

uint64_t PBDataWriterWriteStringField()
{
  return _PBDataWriterWriteStringField();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return _PBDataWriterWriteSubmessage();
}

uint64_t PBReaderPlaceMark()
{
  return _PBReaderPlaceMark();
}

uint64_t PBReaderReadString()
{
  return _PBReaderReadString();
}

uint64_t PBReaderRecallMark()
{
  return _PBReaderRecallMark();
}

uint64_t PBReaderSkipValueWithTag()
{
  return _PBReaderSkipValueWithTag();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_addDataStates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDataStates:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_clearDataStates(void *a1, const char *a2, ...)
{
  return _[a1 clearDataStates];
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyWithZone:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dataStatesAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataStatesAtIndex:");
}

id objc_msgSend_dataStatesCount(void *a1, const char *a2, ...)
{
  return _[a1 dataStatesCount];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 dictionaryRepresentation];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isMemberOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMemberOfClass:");
}

id objc_msgSend_mergeFrom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeFrom:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_setDeployment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeployment:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setSourceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceName:");
}

id objc_msgSend_setTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTask:");
}

id objc_msgSend_setTreatment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTreatment:");
}

id objc_msgSend_setTrialIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTrialIdentifier:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}