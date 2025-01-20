uint64_t SearchFeedbackTable.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t vars8;

  v0 = _s14SearchFeedback0aB5TableCfd_0();

  return _swift_deallocClassInstance(v0, 104, 7);
}

uint64_t SearchFeedbackConnection.checkPlanOrdering(_:)(uint64_t result)
{
  if (*(_DWORD *)(result + 16) == 1)
  {
    uint64_t v1 = result;
    v2 = *(unsigned int **)(result + 24);
    if (v2)
    {
      if (!*((unsigned char *)v2 + 4))
      {
        result = sub_1001882F8(*v2);
        if ((result - 1) >= 4u) {
          *(_DWORD *)(v1 + 60) = 1;
        }
      }
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t SearchFeedbackConnection.checkPlanConstraints(_:)(unsigned int *a1)
{
  uint64_t v5 = *a1;
  if ((v5 & 0x80000000) != 0)
  {
LABEL_44:
    __break(1u);
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  v4 = (_UNKNOWN **)a1;
  if (v5)
  {
    v3 = 0;
    int v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = *((void *)a1 + 1);
    uint64_t v10 = 8 * v5;
    v11 = (unsigned char *)(v9 + 5);
    v2 = _swiftEmptyArrayStorage;
    v4 = &off_1002066B8;
    while (1)
    {
      if ((char *)v10 == v3) {
        goto LABEL_41;
      }
      if (!v9) {
        break;
      }
      uint64_t v12 = *(int *)(v11 - 5);
      if ((int)v12 <= 3)
      {
        if ((v12 & 0x80000000) != 0) {
          goto LABEL_42;
        }
        int v13 = *((unsigned __int8 *)&off_1002066B8 + v12 + 32);
        if ((v13 - 2) >= 2)
        {
          if (v13)
          {
            if (!*v11)
            {
              swift_bridgeObjectRelease();
              return 0;
            }
          }
          else if (*v11)
          {
            int v14 = *(v11 - 1);
            HIDWORD(v15) = v14;
            LODWORD(v15) = v14 - 4;
            switch((v15 >> 2))
            {
              case 0u:
              case 7u:
                uint64_t v18 = v8;
                char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                uint64_t v8 = v18;
                uint64_t v7 = 1;
                if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
                  goto LABEL_25;
                }
                uint64_t v7 = 1;
                goto LABEL_18;
              case 1u:
              case 3u:
                uint64_t v16 = v7;
                char v17 = swift_isUniquelyReferenced_nonNull_native();
                uint64_t v7 = v16;
                uint64_t v8 = 1;
                if (v17)
                {
                  uint64_t v8 = 1;
                }
                else
                {
LABEL_25:
                  uint64_t v25 = v7;
                  uint64_t v26 = v8;
                  sub_100065744(0, v2[2] + 1, 1, (uint64_t)v2);
                  uint64_t v8 = v26;
                  uint64_t v7 = v25;
                  v2 = v27;
                }
LABEL_18:
                unint64_t v21 = v2[2];
                unint64_t v20 = v2[3];
                uint64_t v1 = (void *)(v21 + 1);
                if (v21 >= v20 >> 1)
                {
                  uint64_t v28 = (uint64_t)v2;
                  uint64_t v46 = v7;
                  uint64_t v29 = v8;
                  sub_100065744(v20 > 1, v21 + 1, 1, v28);
                  uint64_t v8 = v29;
                  uint64_t v7 = v46;
                  v2 = v30;
                }
                v2[2] = v1;
                *((unsigned char *)v2 + v21 + 32) = v14;
                if (__OFADD__(v6++, 1)) {
                  goto LABEL_43;
                }
                uint64_t v23 = *((void *)a1 + 4);
                if (!v23) {
                  goto LABEL_48;
                }
                v24 = &v3[v23];
                *(_DWORD *)v24 = v6;
                v24[4] = 1;
                break;
              default:
                break;
            }
          }
        }
      }
      v3 += 8;
      v11 += 12;
      if ((char *)v10 == v3)
      {
        uint64_t v31 = v8 + v7;
        v4 = (_UNKNOWN **)a1;
        goto LABEL_27;
      }
    }
    __break(1u);
LABEL_48:
    __break(1u);
LABEL_49:
    __break(1u);
    JUMPOUT(0x100193480);
  }
  uint64_t v31 = 0;
  v2 = _swiftEmptyArrayStorage;
LABEL_27:
  v4[8] = *(&off_1002066E0 + v31 + 4);
  unint64_t v32 = v2[2];
  if (v32 > 0x7FFFFFFE) {
    goto LABEL_45;
  }
  v33 = (char *)sqlite3_malloc((int)v32 + 1);
  if (!v33) {
    goto LABEL_49;
  }
  v3 = v33;
  v4[6] = v33;
  int64_t v34 = v2[2];
  uint64_t v1 = _swiftEmptyArrayStorage;
  if (v34)
  {
    swift_bridgeObjectRetain();
    sub_1001895A0(0, v34, 0);
    uint64_t v35 = 0;
    uint64_t v1 = _swiftEmptyArrayStorage;
    while (1)
    {
      int v36 = *((char *)v2 + v35 + 32);
      if (v36 < 0) {
        break;
      }
      unint64_t v38 = _swiftEmptyArrayStorage[2];
      unint64_t v37 = _swiftEmptyArrayStorage[3];
      if (v38 >= v37 >> 1) {
        sub_1001895A0((void *)(v37 > 1), v38 + 1, 1);
      }
      ++v35;
      _swiftEmptyArrayStorage[2] = v38 + 1;
      *((unsigned char *)&_swiftEmptyArrayStorage[4] + v38) = v36;
      if (v34 == v35)
      {
        swift_bridgeObjectRelease();
        goto LABEL_36;
      }
    }
    __break(1u);
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
LABEL_36:
  swift_bridgeObjectRetain();
  v39 = _swiftEmptyArrayStorage;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
LABEL_46:
    sub_100065EE0(0, v1[2] + 1, 1, (uint64_t)v1);
    v39 = v44;
  }
  unint64_t v41 = v39[2];
  unint64_t v40 = v39[3];
  if (v41 >= v40 >> 1)
  {
    sub_100065EE0(v40 > 1, v41 + 1, 1, (uint64_t)v39);
    v39 = v45;
  }
  v39[2] = v41 + 1;
  *((unsigned char *)v39 + v41 + 32) = 0;
  swift_bridgeObjectRelease();
  uint64_t v42 = v2[2];
  swift_bridgeObjectRelease();
  sub_100188774((char *)v39 + 32, v42 + 1, v3);
  swift_bridgeObjectRelease();
  uint64_t result = 1;
  *((_DWORD *)v4 + 14) = 1;
  return result;
}

uint64_t SearchFeedbackConnection.__allocating_init(_:argc:argv:)(uint64_t a1, int a2, uint64_t a3)
{
  return sub_1001889B0(a1, a2, a3);
}

uint64_t SearchFeedbackConnection.init(_:argc:argv:)(uint64_t a1, int a2, uint64_t a3)
{
  return sub_1001889B0(a1, a2, a3);
}

double *sub_10019351C()
{
  return sub_100193564();
}

double *sub_100193564()
{
  uint64_t v2 = v1;
  v3 = (double *)v0;
  uint64_t v4 = qword_100224308;
  swift_retain();
  if (v4 != -1) {
    swift_once();
  }
  *(_OWORD *)(v0 + 72) = static BiomeStoreEnumerator.Constants.defaultTimeRange;
  type metadata accessor for SearchFeedbackConnection(0);
  uint64_t v5 = swift_dynamicCastClass();
  if (!v5)
  {
    swift_release();
    sub_100189A30();
    sub_100024A30();
    unsigned char *v11 = 2;
    swift_willThrow();
LABEL_8:
    swift_release();
    type metadata accessor for SearchFeedbackCursor(0);
    swift_deallocPartialClassInstance();
    return v3;
  }
  uint64_t v6 = v5;
  swift_retain();
  uint64_t v7 = sub_100192834(&qword_100224AE0);
  if (v2)
  {
    swift_release_n();
    goto LABEL_8;
  }
  uint64_t v9 = v7;
  uint64_t v10 = v8;
  Swift::Int v12 = sub_1001928C0(1, &qword_100224AE0);
  uint64_t v14 = v13;
  Swift::Int v28 = sub_1001928C0(0, &qword_100224AE0);
  uint64_t v33 = v15;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v26 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
  v26(ObjectType, v10);
  uint64_t v29 = v16;
  uint64_t v17 = swift_getObjectType();
  (*(void (**)(void *__return_ptr, Swift::Int, uint64_t, uint64_t))(v29 + 40))(v32, v12, v14, v17);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  v26(ObjectType, v10);
  uint64_t v20 = v19;
  uint64_t v21 = swift_getObjectType();
  (*(void (**)(void *__return_ptr, Swift::Int, uint64_t, uint64_t, uint64_t))(v20 + 40))(v31, v28, v33, v21, v20);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  *(double *)(v0 + 72) = sub_100192958(&qword_100224AE0);
  *(void *)(v0 + 80) = v22;
  uint64_t v23 = sub_1001929E0(0, &qword_100224AE0);
  double v24 = v3[9];
  double v25 = v3[10];
  sub_10001C20C((uint64_t)v31, (uint64_t)v30);
  type metadata accessor for FeedbackEnumerator();
  swift_allocObject();
  swift_unknownObjectRetain();
  *((void *)v3 + 8) = sub_100199960(v23, v9, v10, v30, v24, v25);
  swift_release();
  v3 = (double *)sub_100192A78(v6, &qword_100224AE8, &qword_100224AE0, &qword_1002257D8);
  swift_unknownObjectRelease();
  swift_release();
  sub_10001CA50((uint64_t)v31);
  sub_10001CA50((uint64_t)v32);
  return v3;
}

uint64_t SearchFeedbackCursor.readFilterParameters(idxNum:idxStr:arguments:)(uint64_t a1, char *a2, uint64_t a3)
{
  double v4 = *(double *)(v3 + 72);
  double v5 = *(double *)(v3 + 80);
  if (a2)
  {
    uint64_t v6 = *(void *)(a3 + 16);
    if (v6)
    {
      uint64_t v7 = a2;
      uint64_t v8 = a3 + 32;
      do
      {
        int v9 = *v7++;
        double v10 = SQLiteArgument.getDouble()();
        HIDWORD(v11) = v9;
        LODWORD(v11) = v9 - 4;
        switch((v11 >> 2))
        {
          case 0u:
            if (v4 < v10)
            {
              double v4 = v10 + 0.0;
              if (v10 + 0.0 < INFINITY) {
                *(void *)&v4 += (*(uint64_t *)&v4 >> 63) | 1;
              }
            }
            break;
          case 1u:
            if (v10 <= v5) {
              double v5 = v10;
            }
            break;
          case 3u:
            if (v10 < v5)
            {
              double v12 = 0.0 - v10;
              if (v12 < INFINITY) {
                *(void *)&v12 += (*(uint64_t *)&v12 >> 63) | 1;
              }
              double v5 = -v12;
            }
            break;
          case 7u:
            if (v4 <= v10) {
              double v4 = v10;
            }
            break;
          default:
            break;
        }
        v8 += 8;
        --v6;
      }
      while (v6);
    }
  }
  if (v5 >= v4) {
    double v13 = v5;
  }
  else {
    double v13 = v4;
  }
  double v14 = fmax(v4, 0.0);
  if (v5 >= 0.0)
  {
    double v15 = v5;
  }
  else
  {
    double v13 = v14;
    double v15 = 0.0;
  }
  if (v4 < 0.0)
  {
    double v16 = 0.0;
  }
  else
  {
    double v15 = v13;
    double v16 = v4;
  }
  if (v16 > v15)
  {
    __break(1u);
    JUMPOUT(0x100193B3CLL);
  }
  uint64_t v17 = *(void *)(v3 + 64);
  double v18 = ClosedRange<>.fromUnixToReferenceTime.getter(v16, v15);
  uint64_t v20 = v19;
  swift_beginAccess();
  *(double *)(v17 + 24) = v18;
  *(void *)(v17 + 32) = v20;
  return 0;
}

Swift::Int32 __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SearchFeedbackCursor.setValue(forColumn:on:)(Swift::String forColumn, SQLiter::SQLiteContext on)
{
  uint64_t v3 = v2;
  object = forColumn._object;
  uint64_t countAndFlagsBits = forColumn._countAndFlagsBits;
  swift_bridgeObjectRetain();
  v7._uint64_t countAndFlagsBits = countAndFlagsBits;
  v7._object = object;
  switch(SearchFeedbackTableColumn.init(rawValue:)(v7).value)
  {
    case SearchFeedback_SearchFeedbackTableColumn_feedback:
      uint64_t v8 = sub_100024D64();
      sub_10019A0A0(v8);
      break;
    case SearchFeedback_SearchFeedbackTableColumn_type:
      uint64_t v9 = sub_100199E9C();
      if (!v3)
      {
        SQLiteContext.setString(_:destructor:)(v9, v10, (void (__cdecl **)(void *))1, (sqlite3_context *)on.context._rawValue);
        swift_bridgeObjectRelease();
      }
      break;
    case SearchFeedback_SearchFeedbackTableColumn_queryId:
      Swift::UInt64 v11 = sub_100199F54();
      if (!v3)
      {
        if (v12) {
          goto LABEL_10;
        }
        SQLiteContext.setUInt64(_:)(v11);
      }
      break;
    case SearchFeedback_SearchFeedbackTableColumn_unknownDefault:
LABEL_10:
      SQLiteContext.setNull()();
      break;
    default:
      sub_100024D64();
      sub_10018C1E8();
      break;
  }
  return 0;
}

unint64_t sub_100193C6C()
{
  unint64_t result = qword_100225258;
  if (!qword_100225258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100225258);
  }
  return result;
}

unint64_t sub_100193CB8(void *a1)
{
  a1[1] = sub_100193CF0();
  a1[2] = sub_100193D3C();
  unint64_t result = sub_100193D88();
  a1[3] = result;
  return result;
}

unint64_t sub_100193CF0()
{
  unint64_t result = qword_100225260;
  if (!qword_100225260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100225260);
  }
  return result;
}

unint64_t sub_100193D3C()
{
  unint64_t result = qword_100225268;
  if (!qword_100225268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100225268);
  }
  return result;
}

unint64_t sub_100193D88()
{
  unint64_t result = qword_100225270;
  if (!qword_100225270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100225270);
  }
  return result;
}

unint64_t sub_100193DD8()
{
  unint64_t result = qword_100225278;
  if (!qword_100225278)
  {
    sub_1000371D4(&qword_100225280);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100225278);
  }
  return result;
}

unint64_t sub_100193E2C(uint64_t a1)
{
  unint64_t result = sub_100193C6C();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_100193E58()
{
  unint64_t result = qword_100225288;
  if (!qword_100225288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100225288);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for SearchFeedbackTableColumn(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x100193F70);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SearchFeedbackTableColumn()
{
  return &type metadata for SearchFeedbackTableColumn;
}

ValueMetadata *type metadata accessor for SearchFeedbackTableConfig()
{
  return &type metadata for SearchFeedbackTableConfig;
}

uint64_t type metadata accessor for SearchFeedbackTable(uint64_t a1)
{
  return sub_100027D28(a1, qword_1002252E0);
}

uint64_t type metadata accessor for SearchFeedbackConnection(uint64_t a1)
{
  return sub_100027D28(a1, qword_1002254F8);
}

uint64_t type metadata accessor for SearchFeedbackCursor(uint64_t a1)
{
  return sub_100027D28(a1, qword_100225650);
}

uint64_t sub_100194018()
{
  return swift_initClassMetadata2();
}

long long *BiomeStoreEnumerator.Constants.defaultTimeRange.unsafeMutableAddressor()
{
  if (qword_100224308 != -1) {
    swift_once();
  }
  return &static BiomeStoreEnumerator.Constants.defaultTimeRange;
}

void *BiomeStoreEnumerator.getNextEvent()()
{
  uint64_t v1 = *(void **)(v0 + 40);
  if (!v1) {
    return 0;
  }
  id v2 = [v1 nextEvent];
  int v3 = v2;
  if (v2)
  {
    [v2 timestamp];
    double v5 = v4;
    sub_100026BE4();
    if (v5 > *(double *)(v0 + 32))
    {

      return 0;
    }
  }
  return v3;
}

double BiomeStoreEnumerator.enumerationRange.getter()
{
  sub_100026BE4();
  return *(double *)(v0 + 24);
}

uint64_t BiomeStoreEnumerator.enumerationRange.setter(double a1, double a2)
{
  uint64_t result = swift_beginAccess();
  *(double *)(v2 + 24) = a1;
  *(double *)(v2 + 32) = a2;
  return result;
}

uint64_t (*BiomeStoreEnumerator.enumerationRange.modify())()
{
  return j__swift_endAccess;
}

void BiomeStoreEnumerator.currentEvent.setter(void *a1)
{
  uint64_t v2 = (void *)v1[6];
  v1[6] = a1;
  id v3 = a1;

  (*(void (**)(void))(*v1 + 272))();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> BiomeStoreEnumerator.startEnumeration()()
{
  uint64_t v1 = *(void **)(v0 + 16);
  swift_beginAccess();
  id v2 = [v1 newEnumeratorFromStartTime:*(double *)(v0 + 24)];
  id v3 = *(void **)(v0 + 40);
  *(void *)(v0 + 40) = v2;

  sub_100017E10();
  (*(void (**)(void))(v4 + 224))();
}

Swift::Void __swiftcall BiomeStoreEnumerator.next()()
{
  sub_100017E10();
  uint64_t v1 = (void *)(*(uint64_t (**)(void))(v0 + 216))();

  BiomeStoreEnumerator.currentEvent.setter(v1);
}

Swift::Bool __swiftcall BiomeStoreEnumerator.hasEvent()()
{
  return *(void *)(v0 + 48) != 0;
}

Swift::Void __swiftcall BiomeStoreEnumerator.setPayload(on:)(SQLiter::SQLiteContext on)
{
  sub_100017E10();
  uint64_t v4 = (*(uint64_t (**)(void))(v3 + 248))();
  if (v5 >> 60 == 15)
  {
    SQLiteContext.setNull()();
  }
  else
  {
    uint64_t v6 = v4;
    unint64_t v7 = v5;
    uint64_t v8 = v1[8];
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, unint64_t, void, void, void *, uint64_t, uint64_t))(v8 + 32))(v6, v7, v1[9], v1[10], on.context._rawValue, ObjectType, v8);
    sub_10000A330(v6, v7);
  }
}

uint64_t BiomeStoreEnumerator.init(reader:sqliteBridge:enumerationRange:messageName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6, double a7)
{
  *(void *)(v7 + 40) = 0;
  *(void *)(v7 + 48) = 0;
  *(void *)(v7 + 16) = a1;
  *(double *)(v7 + 24) = a6;
  *(double *)(v7 + 32) = a7;
  *(void *)(v7 + 56) = a2;
  *(void *)(v7 + 64) = a3;
  *(void *)(v7 + 72) = a4;
  *(void *)(v7 + 80) = a5;
  return v7;
}

id *BiomeStoreEnumerator.deinit()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t BiomeStoreEnumerator.timestamp.getter()
{
  if (!*(void *)(v0 + 48)) {
    return 0;
  }
  [*(id *)(v0 + 48) timestamp];
  return v1;
}

uint64_t BiomeStoreEnumerator.payload.getter()
{
  uint64_t v1 = *(void **)(v0 + 48);
  if (!v1) {
    return 0;
  }
  id v2 = (char *)[v1 eventBody];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)&v2[OBJC_IVAR___SRRawPayload_data];
  sub_100027BCC(v4, *(void *)&v2[OBJC_IVAR___SRRawPayload_data + 8]);

  return v4;
}

uint64_t sub_100194550()
{
  uint64_t v0 = type metadata accessor for Date();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v13 - v5;
  static Date.distantPast.getter();
  Date.timeIntervalSince1970.getter();
  double v8 = v7;
  uint64_t v9 = *(void (**)(char *, uint64_t))(v1 + 8);
  v9(v6, v0);
  static Date.distantFuture.getter();
  Date.timeIntervalSince1970.getter();
  double v11 = v10;
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v9)(v3, v0);
  if (v8 > v11)
  {
    __break(1u);
  }
  else
  {
    *(double *)&static BiomeStoreEnumerator.Constants.defaultTimeRange = v8;
    *((double *)&static BiomeStoreEnumerator.Constants.defaultTimeRange + 1) = v11;
  }
  return result;
}

double static BiomeStoreEnumerator.Constants.defaultTimeRange.getter()
{
  if (qword_100224308 != -1) {
    swift_once();
  }
  return *(double *)&static BiomeStoreEnumerator.Constants.defaultTimeRange;
}

uint64_t BiomeStoreEnumerator.sqliteBridge.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t BiomeStoreEnumerator.messageName.getter()
{
  uint64_t v1 = *(void *)(v0 + 72);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t BiomeStoreEnumerator.__allocating_init(reader:sqliteBridge:enumerationRange:messageName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6, double a7)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 40) = 0;
  *(void *)(result + 48) = 0;
  *(void *)(result + 16) = a1;
  *(double *)(result + 24) = a6;
  *(double *)(result + 32) = a7;
  *(void *)(result + 56) = a2;
  *(void *)(result + 64) = a3;
  *(void *)(result + 72) = a4;
  *(void *)(result + 80) = a5;
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> BiomeStoreEnumerator.setTimestamp(on:)(SQLiter::SQLiteContext on)
{
  sub_100017E10();
  Swift::Double v2 = COERCE_DOUBLE((*(uint64_t (**)(void))(v1 + 240))());
  if (v3) {
    SQLiteContext.setNull()();
  }
  else {
    SQLiteContext.setDouble(_:)(v2);
  }
}

uint64_t BiomeStoreEnumerator.__deallocating_deinit()
{
  BiomeStoreEnumerator.deinit();

  return _swift_deallocClassInstance(v0, 88, 7);
}

uint64_t type metadata accessor for BiomeStoreEnumerator()
{
  return self;
}

ValueMetadata *type metadata accessor for BiomeStoreEnumerator.Constants()
{
  return &type metadata for BiomeStoreEnumerator.Constants;
}

Swift::Void __swiftcall BiomeTablesProvider.teardown()()
{
  *(void *)(v0 + 56) = 0;
  swift_release();
}

uint64_t BiomeTablesProvider.getTableFunction()()
{
  if (v0[7])
  {
    uint64_t v1 = v0[7];
  }
  else
  {
    Swift::Double v2 = v0;
    uint64_t v3 = *(void *)(*v0 + 88);
    sub_10001C20C((uint64_t)(v2 + 2), (uint64_t)v8);
    uint64_t v4 = v2[9];
    uint64_t v5 = v2[10];
    uint64_t v6 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v3 + 408);
    swift_unknownObjectRetain();
    uint64_t v1 = v6(v8, v4, v5);
    v2[7] = v1;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v1;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> BiomeTablesProvider.configure(databaseConnection:)(Swift::OpaquePointer databaseConnection)
{
  type metadata accessor for SQLiteDatabase();
  swift_allocObject();
  uint64_t v3 = SQLiteDatabase.init(connection:)((uint64_t)databaseConnection._rawValue);
  if (!v1)
  {
    uint64_t v4 = v3;
    BiomeTablesProvider.getTableFunction()();
    BaseBiomeTable.register(with:)(v4);
    uint64_t v5 = swift_release();
    (*(void (**)(uint64_t))(*(void *)v4 + 144))(v5);
    swift_release();
  }
}

uint64_t BiomeTablesProvider.config.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_10001C20C(v1 + 16, a1);
}

uint64_t BiomeTablesProvider.__allocating_init(config:environment:)(long long *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  BiomeTablesProvider.init(config:environment:)(a1, a2, a3);
  return v6;
}

uint64_t BiomeTablesProvider.__deallocating_deinit()
{
  BiomeTablesProvider.deinit();

  return _swift_deallocClassInstance(v0, 88, 7);
}

uint64_t sub_100194AC0()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t sub_100194AF8()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for BiomeTablesProvider()
{
  return sub_100040C54();
}

uint64_t sub_100194B70(uint64_t a1)
{
  uint64_t v2 = sub_10002572C(&qword_100225AE8);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v21[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001FC30(a1, v21);
  uint64_t v5 = v21[0];
  uint64_t v6 = v21[1];
  int64_t v7 = v21[3];
  unint64_t v8 = v21[4];
  int64_t v9 = (unint64_t)(v21[2] + 64) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  if (!v8) {
    goto LABEL_3;
  }
LABEL_2:
  unint64_t v11 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  unint64_t v12 = v11 | (v7 << 6);
  while (1)
  {
    uint64_t v17 = *(void *)(v5 + 48);
    uint64_t v18 = type metadata accessor for SessionType();
    (*(void (**)(char *, unint64_t, uint64_t))(*(void *)(v18 - 8) + 16))(v4, v17 + *(void *)(*(void *)(v18 - 8) + 72) * v12, v18);
    uint64_t v19 = *(void **)(*(void *)(v5 + 56) + 8 * v12);
    *(void *)&v4[*(int *)(v2 + 48)] = v19;
    [v19 syncMappedFiles];
    uint64_t result = sub_100019994((uint64_t)v4, &qword_100225AE8);
    if (v8) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v13 = v7 + 1;
    if (__OFADD__(v7, 1)) {
      break;
    }
    if (v13 >= v9) {
      return swift_release();
    }
    unint64_t v14 = *(void *)(v6 + 8 * v13);
    int64_t v15 = v7 + 1;
    if (!v14)
    {
      int64_t v15 = v7 + 2;
      if (v7 + 2 >= v9) {
        return swift_release();
      }
      unint64_t v14 = *(void *)(v6 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v7 + 3;
        if (v7 + 3 >= v9) {
          return swift_release();
        }
        unint64_t v14 = *(void *)(v6 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v7 + 4;
          if (v7 + 4 >= v9) {
            return swift_release();
          }
          unint64_t v14 = *(void *)(v6 + 8 * v15);
          if (!v14)
          {
            int64_t v15 = v7 + 5;
            if (v7 + 5 >= v9) {
              return swift_release();
            }
            unint64_t v14 = *(void *)(v6 + 8 * v15);
            if (!v14)
            {
              int64_t v16 = v7 + 6;
              while (v16 < v9)
              {
                unint64_t v14 = *(void *)(v6 + 8 * v16++);
                if (v14)
                {
                  int64_t v15 = v16 - 1;
                  goto LABEL_18;
                }
              }
              return swift_release();
            }
          }
        }
      }
    }
LABEL_18:
    unint64_t v8 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v7 = v15;
  }
  __break(1u);
  return result;
}

uint64_t sub_100194D7C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  if (*(void *)(a1 + 16) && (unint64_t v4 = sub_100019A28(), (v5 & 1) != 0))
  {
    unint64_t v6 = v4;
    uint64_t v7 = *(void *)(a1 + 56);
    uint64_t v8 = type metadata accessor for BiomeDatabaseReader.SessionProxy();
    sub_10001DCF8();
    sub_10019174C(v7 + *(void *)(v9 + 72) * v6, a2);
    uint64_t v10 = a2;
    uint64_t v11 = 0;
    uint64_t v12 = v8;
  }
  else
  {
    uint64_t v12 = type metadata accessor for BiomeDatabaseReader.SessionProxy();
    uint64_t v10 = a2;
    uint64_t v11 = 1;
  }

  return sub_10002538C(v10, v11, 1, v12);
}

void *sub_100194E24(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return 0;
  }
  unint64_t v3 = sub_100019A28();
  if ((v4 & 1) == 0) {
    return 0;
  }
  char v5 = *(void **)(*(void *)(a2 + 56) + 8 * v3);
  id v6 = v5;
  return v5;
}

void *sub_100194E6C(uint64_t a1, uint64_t a2)
{
  type metadata accessor for SessionType();
  sub_10002572C(&qword_100224328);
  sub_100186FD8();
  v2[2] = Dictionary.init(dictionaryLiteral:)();
  v2[3] = 0;
  v2[4] = a1;
  sub_100195354(a2, (uint64_t)&v6);
  if (v7)
  {
    sub_100019994(a2, &qword_100225AE0);
    sub_10001C1AC(&v6, (uint64_t)&v8);
  }
  else
  {
    uint64_t v9 = &type metadata for BiomeStreamsTelemetryReporter;
    uint64_t v10 = &off_100207048;
    sub_100019994(a2, &qword_100225AE0);
    sub_100019994((uint64_t)&v6, &qword_100225AE0);
  }
  sub_10001C1AC(&v8, (uint64_t)(v2 + 5));
  return v2;
}

void sub_100194F60(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for SessionType();
  sub_100020C48();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  sub_10000DFD0();
  uint64_t v10 = v9 - v8;
  swift_beginAccess();
  uint64_t v11 = *(void *)(v2 + 16);
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_100194E24(a1, v11);
  swift_bridgeObjectRelease();

  if (v12)
  {
    swift_beginAccess();
    int64_t v13 = (void *)sub_10019C6AC();
    swift_endAccess();

    if (!*(void *)(*(void *)(v2 + 16) + 16))
    {
      unint64_t v14 = *(void **)(v2 + 24);
      *(void *)(v2 + 24) = 0;
    }
  }
  else
  {
    if (qword_100224318 != -1) {
      swift_once();
    }
    uint64_t v15 = type metadata accessor for Logger();
    sub_10002A10C(v15, (uint64_t)qword_100236DC8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v10, a1, v4);
    int64_t v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      v26[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 136315138;
      uint64_t v19 = SessionType.description.getter();
      uint64_t v21 = sub_10001C274(v19, v20, v26);
      sub_100028074(v21);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      uint64_t v22 = sub_1000277C8();
      v23(v22);
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Attempt to release un-acquired ftore writer for: %s", v18, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      uint64_t v24 = sub_1000277C8();
      v25(v24);
    }
  }
}

uint64_t BiomeDatabaseWriter.deinit()
{
  sub_100010E78();
  uint64_t v2 = v1;
  [v1 syncMappedFiles];

  swift_beginAccess();
  uint64_t v3 = swift_bridgeObjectRetain();
  sub_100194B70(v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_10001CA50(v0 + 40);
  return v0;
}

uint64_t BiomeDatabaseWriter.__deallocating_deinit()
{
  BiomeDatabaseWriter.deinit();

  return _swift_deallocClassInstance(v0, 80, 7);
}

void BiomeDatabaseWriter.close(session:)(uint64_t a1)
{
}

void sub_10019530C(uint64_t a1)
{
}

uint64_t type metadata accessor for BiomeDatabaseWriter()
{
  return self;
}

uint64_t sub_100195354(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10002572C(&qword_100225AE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1001953BC(uint64_t a1)
{
  if (a1 == 1) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 2;
  }
  if (a1) {
    return v1;
  }
  else {
    return 0;
  }
}

uint64_t sub_1001953D4(char a1)
{
  return a1 & 1;
}

Swift::Int sub_1001953DC(uint64_t a1)
{
  return sub_10019239C(a1, *v1);
}

uint64_t sub_1001953E4@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1001953BC(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_100195410@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1001953D4(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_10019543C()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_10019549C()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t sub_1001954EC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6B72616D6B6F6F62 && a2 == 0xE800000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6574617473 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1001955D4(char a1)
{
  if (a1) {
    return 0x6574617473;
  }
  else {
    return 0x6B72616D6B6F6F62;
  }
}

uint64_t sub_100195608()
{
  return sub_1001955D4(*v0);
}

uint64_t sub_100195610@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1001954EC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100195638(uint64_t a1)
{
  unint64_t v2 = sub_10019696C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100195674(uint64_t a1)
{
  unint64_t v2 = sub_10019696C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001956B0(void *a1)
{
  uint64_t v3 = sub_10002572C(&qword_100225C20);
  sub_100020C48();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  sub_10000DFD0();
  uint64_t v9 = v8 - v7;
  sub_10001B620(a1, a1[3]);
  sub_10019696C();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  type metadata accessor for SessionBookmark();
  sub_100196A04(&qword_100225C28);
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v1)
  {
    sub_100196A48();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

uint64_t sub_10019583C(void *a1)
{
  sub_10002572C(&qword_100225C00);
  sub_100020C48();
  __chkstk_darwin(v3);
  uint64_t v4 = a1[3];
  sub_10001B620(a1, v4);
  sub_10019696C();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v1)
  {
    sub_10001CA50((uint64_t)a1);
  }
  else
  {
    type metadata accessor for SessionBookmark();
    sub_100196A04(&qword_100225C10);
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    uint64_t v4 = v8;
    sub_1001969B8();
    swift_retain();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    uint64_t v6 = sub_100024EFC();
    v7(v6);
    sub_10001CA50((uint64_t)a1);
    swift_release();
  }
  return v4;
}

uint64_t sub_100195A20(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x736574617473 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_100195AA0()
{
  return 0x736574617473;
}

uint64_t sub_100195AB4(void *a1)
{
  uint64_t v2 = sub_10002572C(&qword_100225C70);
  sub_100020C48();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  sub_10000DFD0();
  uint64_t v8 = v7 - v6;
  sub_10001B620(a1, a1[3]);
  sub_100196DDC();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  sub_10002572C(&qword_100225C80);
  sub_100196E74(&qword_100225C88, (void (*)(void))sub_100196E28);
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v8, v2);
}

void *sub_100195C04(void *a1)
{
  uint64_t v3 = sub_10002572C(&qword_100225C98);
  sub_100020C48();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10001B620(a1, a1[3]);
  sub_100196DDC();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v1)
  {
    sub_10001CA50((uint64_t)a1);
  }
  else
  {
    sub_10002572C(&qword_100225C80);
    sub_100196E74(&qword_100225CA0, (void (*)(void))sub_100196EE4);
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v3);
    uint64_t v9 = (void *)v11[1];
    sub_10001CA50((uint64_t)a1);
  }
  return v9;
}

uint64_t sub_100195D84@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_10019583C(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(unsigned char *)(a2 + 8) = v5 & 1;
  }
  return result;
}

uint64_t sub_100195DB8(void *a1)
{
  return sub_1001956B0(a1);
}

uint64_t sub_100195DDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100195A20(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_100195E08(uint64_t a1)
{
  unint64_t v2 = sub_100196DDC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100195E44(uint64_t a1)
{
  unint64_t v2 = sub_100196DDC();

  return CodingKey.debugDescription.getter(a1, v2);
}

void *sub_100195E80@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_100195C04(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_100195EAC(void *a1)
{
  return sub_100195AB4(a1);
}

uint64_t UploadStateFileStore.isUploadEnabled.getter()
{
  return static SessionDBFeatureFlags.uploadFromFlag.getter() & 1;
}

uint64_t UploadStateFileStore.aggregatedToDate.getter()
{
  return sub_10019602C();
}

void *UploadStateFileStore.uploadedBookmarks.getter()
{
  return UploadStateFileStore.uploadedAtBookmarks()();
}

uint64_t UploadStateFileStore.__allocating_init(fileManager:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  UploadStateFileStore.init(fileManager:)(a1);
  return v2;
}

uint64_t UploadStateFileStore.init(fileManager:)(uint64_t a1)
{
  Logger.init(subsystem:category:)();
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC14SearchFeedback20UploadStateFileStore_sessionUploadStateFileName);
  void *v3 = 0xD000000000000019;
  v3[1] = 0x80000001001BA160;
  *(void *)(v1 + OBJC_IVAR____TtC14SearchFeedback20UploadStateFileStore_uploadStateCache) = 0;
  *(void *)(v1 + OBJC_IVAR____TtC14SearchFeedback20UploadStateFileStore_fileManager) = a1;
  return v1;
}

uint64_t sub_10019602C()
{
  type metadata accessor for Date();
  sub_100020C48();
  __chkstk_darwin(v0);
  sub_10000DFD0();
  static Date.now.getter();
  Date.timeIntervalSince1970.getter();
  double v2 = v1;
  sub_100025454();
  uint64_t result = v3();
  if ((~*(void *)&v2 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (v2 <= -1.0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (v2 >= 1.84467441e19)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if ((unint64_t)v2 / 0x15180 >= 7) {
    return Date.init(timeIntervalSince1970:)();
  }
LABEL_9:
  __break(1u);
  return result;
}

void (*sub_100196130())(void)
{
  uint64_t v1 = sub_10002572C(&qword_10021BB20);
  __chkstk_darwin(v1 - 8);
  sub_10000DFD0();
  uint64_t v4 = v3 - v2;
  uint64_t v5 = type metadata accessor for URL();
  sub_100020C48();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  __chkstk_darwin(v9);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)v26 - v11;
  if (*(void *)(v0 + OBJC_IVAR____TtC14SearchFeedback20UploadStateFileStore_uploadStateCache))
  {
    int64_t v13 = *(void (**)(void))(v0 + OBJC_IVAR____TtC14SearchFeedback20UploadStateFileStore_uploadStateCache);
  }
  else
  {
    uint64_t v27 = OBJC_IVAR____TtC14SearchFeedback20UploadStateFileStore_uploadStateCache;
    uint64_t v28 = v0;
    int64_t v13 = *(void (**)(void))(v0 + OBJC_IVAR____TtC14SearchFeedback20UploadStateFileStore_fileManager);
    NSFileManager.parsecdAssetsDirectoryURL.getter();
    if (sub_100027BA4(v4, 1, v5) == 1)
    {
      sub_10003CB40(v4);
      sub_100196A94();
      swift_allocError();
      *unint64_t v14 = 0;
      swift_willThrow();
      return v13;
    }
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 32))(v12, v4, v5);
    uint64_t v15 = *(void *)(v28 + OBJC_IVAR____TtC14SearchFeedback20UploadStateFileStore_sessionUploadStateFileName);
    v26[1] = *(void *)(v28 + OBJC_IVAR____TtC14SearchFeedback20UploadStateFileStore_sessionUploadStateFileName + 8);
    v26[2] = v15;
    URL.appendingPathComponent(_:)();
    URL.path.getter();
    int64_t v16 = *(void (**)(void))(v7 + 8);
    sub_100025454();
    v17();
    NSString v18 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    unsigned int v19 = [v13 fileExistsAtPath:v18];

    if (v19)
    {
      int64_t v13 = v16;
      URL.appendingPathComponent(_:)();
      uint64_t v20 = v29;
      uint64_t v21 = Data.init(contentsOf:options:)();
      if (v20)
      {
        sub_100025454();
        v16();
        sub_100025454();
        v16();
        return v13;
      }
      uint64_t v23 = v21;
      unint64_t v24 = v22;
      sub_100025454();
      v13();
      type metadata accessor for JSONDecoder();
      swift_allocObject();
      JSONDecoder.init()();
      sub_100196AE0();
      dispatch thunk of JSONDecoder.decode<A>(_:from:)();
      uint64_t v29 = 0;
      sub_100025454();
      v13();
      sub_1000291B4(v23, v24);
      swift_release();
      int64_t v13 = v30;
      *(void *)(v28 + v27) = v30;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      int64_t v13 = (void (*)(void))_swiftEmptyArrayStorage;
      *(void *)(v28 + v27) = _swiftEmptyArrayStorage;
      swift_bridgeObjectRelease();
      sub_100025454();
      v16();
    }
  }
  swift_bridgeObjectRetain();
  return v13;
}

uint64_t UploadStateFileStore.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC14SearchFeedback20UploadStateFileStore_logger;
  uint64_t v2 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t UploadStateFileStore.__deallocating_deinit()
{
  UploadStateFileStore.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

unint64_t sub_1001965CC()
{
  unint64_t result = qword_100225AF0;
  if (!qword_100225AF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100225AF0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for UploadStateStoreError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1001966E4);
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

void type metadata accessor for UploadStateStoreError()
{
}

uint64_t sub_100196718()
{
  return type metadata accessor for UploadStateFileStore();
}

uint64_t type metadata accessor for UploadStateFileStore()
{
  uint64_t result = qword_100225B20;
  if (!qword_100225B20) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100196768()
{
  uint64_t result = type metadata accessor for Logger();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100196818(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  swift_retain();
  return a1;
}

uint64_t sub_100196850(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

uint64_t sub_1001968A0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

uint64_t sub_1001968E0(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 9))
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

uint64_t sub_100196920(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 9) = 1;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 9) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for UploadStateFileStore.UploadState()
{
}

unint64_t sub_10019696C()
{
  unint64_t result = qword_100225C08;
  if (!qword_100225C08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100225C08);
  }
  return result;
}

unint64_t sub_1001969B8()
{
  unint64_t result = qword_100225C18;
  if (!qword_100225C18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100225C18);
  }
  return result;
}

uint64_t sub_100196A04(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for SessionBookmark();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100196A48()
{
  unint64_t result = qword_100225C30;
  if (!qword_100225C30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100225C30);
  }
  return result;
}

unint64_t sub_100196A94()
{
  unint64_t result = qword_100225C38;
  if (!qword_100225C38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100225C38);
  }
  return result;
}

unint64_t sub_100196AE0()
{
  unint64_t result = qword_100225C40;
  if (!qword_100225C40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100225C40);
  }
  return result;
}

void type metadata accessor for UploadStateFileStore.UploadStates()
{
}

ValueMetadata *type metadata accessor for UploadStateFileStore.UploadState.CodingKeys()
{
  return &type metadata for UploadStateFileStore.UploadState.CodingKeys;
}

unsigned char *_s14SearchFeedback20UploadStateFileStoreC11UploadStateV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100196C1CLL);
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

void type metadata accessor for UploadStateFileStore.State()
{
}

unint64_t sub_100196C54()
{
  unint64_t result = qword_100225C48;
  if (!qword_100225C48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100225C48);
  }
  return result;
}

unint64_t sub_100196CA4()
{
  unint64_t result = qword_100225C50;
  if (!qword_100225C50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100225C50);
  }
  return result;
}

unint64_t sub_100196CF4()
{
  unint64_t result = qword_100225C58;
  if (!qword_100225C58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100225C58);
  }
  return result;
}

unint64_t sub_100196D44()
{
  unint64_t result = qword_100225C60;
  if (!qword_100225C60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100225C60);
  }
  return result;
}

unint64_t sub_100196D90()
{
  unint64_t result = qword_100225C68;
  if (!qword_100225C68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100225C68);
  }
  return result;
}

unint64_t sub_100196DDC()
{
  unint64_t result = qword_100225C78;
  if (!qword_100225C78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100225C78);
  }
  return result;
}

unint64_t sub_100196E28()
{
  unint64_t result = qword_100225C90;
  if (!qword_100225C90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100225C90);
  }
  return result;
}

uint64_t sub_100196E74(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000371D4(&qword_100225C80);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100196EE4()
{
  unint64_t result = qword_100225CA8;
  if (!qword_100225CA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100225CA8);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for UploadStateFileStore.UploadStates.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x100196FCCLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for UploadStateFileStore.UploadStates.CodingKeys()
{
  return &type metadata for UploadStateFileStore.UploadStates.CodingKeys;
}

unint64_t sub_100197008()
{
  unint64_t result = qword_100225CB0;
  if (!qword_100225CB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100225CB0);
  }
  return result;
}

unint64_t sub_100197058()
{
  unint64_t result = qword_100225CB8;
  if (!qword_100225CB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100225CB8);
  }
  return result;
}

unint64_t sub_1001970A8()
{
  unint64_t result = qword_100225CC0;
  if (!qword_100225CC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100225CC0);
  }
  return result;
}

void sub_1001970F8(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_10002572C(&qword_10021DB68);
  __chkstk_darwin(v5 - 8);
  sub_10000DFD0();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = type metadata accessor for SessionType();
  sub_100020C48();
  uint64_t v11 = v10;
  __chkstk_darwin(v12);
  sub_10000DFD0();
  uint64_t v39 = v14 - v13;
  if (qword_100225CD8)
  {
    uint64_t v35 = v9;
    uint64_t v36 = v11;
    uint64_t v34 = a2;
    uint64_t v15 = (_UNKNOWN **)off_100225CE0;
    int64_t v16 = (uint64_t *)qword_100225CD8;
  }
  else
  {
    if (qword_100224310 != -1) {
      swift_once();
    }
    uint64_t v23 = qword_100225CC8;
    uint64_t v24 = unk_100225CD0;
    type metadata accessor for ProtoSchemaStore();
    swift_allocObject();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    double v25 = ProtoSchemaStore.init(withModel:)(v23, v24);
    if (v2) {
      goto LABEL_18;
    }
    int64_t v16 = v25;
    uint64_t v35 = v9;
    uint64_t v36 = v11;
    uint64_t v34 = a2;
    uint64_t v15 = &protocol witness table for ProtoSchemaStore;
    qword_100225CD8 = (uint64_t)v25;
    off_100225CE0 = &protocol witness table for ProtoSchemaStore;
    swift_retain();
    swift_unknownObjectRelease();
  }
  type metadata accessor for ProtobufPayload();
  uint64_t v17 = *(void *)&a1[OBJC_IVAR___SRRawPayload_data];
  unint64_t v18 = *(void *)&a1[OBJC_IVAR___SRRawPayload_data + 8];
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  sub_100027BCC(v17, v18);
  uint64_t v19 = sub_100028088();
  uint64_t v21 = ProtobufPayload.__allocating_init(with:from:payload:)(v19, v20, v16, (uint64_t)v15, v17, v18);
  if (v2)
  {
    swift_unknownObjectRelease();
LABEL_18:

    return;
  }
  unint64_t v22 = *(void (**)(void))(*v21 + 104);
  sub_1000215D8();
  v22();
  if (HIBYTE(v38) >= 0xFFu)
  {
    sub_100019994((uint64_t)v37, &qword_100221918);
LABEL_16:
    sub_100198B64();
    sub_100024A30();
    char v27 = 1;
    goto LABEL_17;
  }
  if ((v38 & 0xFF00) != 0x800)
  {
    sub_10001B840((uint64_t)v37);
    goto LABEL_16;
  }
  SessionType.init(withCanonicalIdentifier:)();
  if (sub_100027BA4(v8, 1, v35) == 1)
  {
    sub_100019994(v8, &qword_10021DB68);
    sub_100198B64();
    sub_100024A30();
    char v27 = 2;
LABEL_17:
    *uint64_t v26 = v27;
    swift_willThrow();
    swift_unknownObjectRelease();
    swift_release();
    goto LABEL_18;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 32))(v39, v8, v35);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 16))(v34, v39, v35);
  sub_1000215D8();
  v22();
  if (HIBYTE(v38) < 0xFFu)
  {
    if ((v38 & 0xFF00) == 0x900)
    {
      id v28 = objc_allocWithZone((Class)type metadata accessor for RawPayload());
      id v29 = RawPayload.init(with:)(v37[0], v37[1]);
      swift_unknownObjectRelease();

      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v39, v35);
      *(void *)(v34 + *(int *)(type metadata accessor for BiomeSessionWrapper(0) + 20)) = v29;
      return;
    }
    sub_10001B840((uint64_t)v37);
  }
  else
  {
    sub_100019994((uint64_t)v37, &qword_100221918);
  }
  uint64_t v30 = v39;
  sub_100198B64();
  uint64_t v31 = sub_100024A30();
  sub_10000E2D4(v31, v32);
  swift_unknownObjectRelease();

  swift_release();
  uint64_t v33 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
  v33(v30, v35);
  v33(v34, v35);
}

uint64_t SessionFeedback.__allocating_init(session:sessionId:type:creationDate:closingDate:)()
{
  sub_1000277DC();
  uint64_t v0 = swift_allocObject();
  SessionFeedback.init(session:sessionId:type:creationDate:closingDate:)();
  return v0;
}

uint64_t SessionFeedback.__allocating_init(withWrappedPayload:creationDate:closingDate:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  SessionFeedback.init(withWrappedPayload:creationDate:closingDate:)(a1, a2, a3);
  return v6;
}

uint64_t sub_1001976C0()
{
  sub_10002572C(&qword_100225EA8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1001A3830;
  *(void *)(inited + 32) = 0x72657070617257;
  *(void *)(inited + 40) = 0xE700000000000000;
  v3.value._rawValue = (void *)Dictionary.init(dictionaryLiteral:)();
  v3.is_nil = 0;
  *(Schematizer::MessageSchemaModel *)(inited + 48) = MessageSchemaModel.init(properties:oneOfs:)(v3, v5);
  *(void *)(inited + 72) = 0x6E6F6973736553;
  *(void *)(inited + 80) = 0xE700000000000000;
  v4.value._rawValue = (void *)Dictionary.init(dictionaryLiteral:)();
  v4.is_nil = 0;
  *(Schematizer::MessageSchemaModel *)(inited + 88) = MessageSchemaModel.init(properties:oneOfs:)(v4, v6);
  uint64_t v1 = Dictionary.init(dictionaryLiteral:)();
  uint64_t result = Dictionary.init(dictionaryLiteral:)();
  qword_100225CC8 = v1;
  unk_100225CD0 = result;
  return result;
}

uint64_t *sub_1001977F0()
{
  uint64_t v2 = v0;
  if (qword_100225CD8)
  {
    Swift::OpaquePointer_optional v3 = (_UNKNOWN **)off_100225CE0;
    Swift::OpaquePointer_optional v4 = (uint64_t *)qword_100225CD8;
  }
  else
  {
    if (qword_100224310 != -1) {
      swift_once();
    }
    uint64_t v9 = qword_100225CC8;
    uint64_t v10 = unk_100225CD0;
    type metadata accessor for ProtoSchemaStore();
    swift_allocObject();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t result = ProtoSchemaStore.init(withModel:)(v9, v10);
    if (v1) {
      return result;
    }
    Swift::OpaquePointer_optional v4 = result;
    Swift::OpaquePointer_optional v3 = &protocol witness table for ProtoSchemaStore;
    qword_100225CD8 = (uint64_t)result;
    off_100225CE0 = &protocol witness table for ProtoSchemaStore;
    swift_retain();
    swift_unknownObjectRelease();
  }
  type metadata accessor for ProtobufPayload();
  Swift::OpaquePointer_optional v5 = (uint64_t *)(*(void *)(v2 + *(int *)(type metadata accessor for BiomeSessionWrapper(0) + 20))
                 + OBJC_IVAR___SRRawPayload_data);
  uint64_t v6 = *v5;
  unint64_t v7 = v5[1];
  swift_unknownObjectRetain();
  sub_100027BCC(v6, v7);
  uint64_t result = ProtobufPayload.__allocating_init(with:from:payload:)(0x6E6F6973736553, 0xE700000000000000, v4, (uint64_t)v3, v6, v7);
  if (v1) {
    return result;
  }
  (*(void (**)(uint64_t *__return_ptr, uint64_t, unint64_t))(*result + 104))(&v13, 25705, 0xE200000000000000);
  if (HIBYTE(v14) < 0xFFu)
  {
    if ((v14 & 0xFF00) == 0x800)
    {
      swift_release();
      return (uint64_t *)v13;
    }
    sub_10001B840((uint64_t)&v13);
  }
  else
  {
    sub_100019994((uint64_t)&v13, &qword_100221918);
  }
  sub_100198B64();
  uint64_t v11 = sub_100024A30();
  sub_10000E2D4(v11, v12);
  return (uint64_t *)swift_release();
}

id SessionFeedback.backingStore.getter()
{
  swift_beginAccess();
  uint64_t v1 = *(void **)(v0 + 16);

  return v1;
}

void SessionFeedback.backingStore.setter(uint64_t a1)
{
  swift_beginAccess();
  Swift::OpaquePointer_optional v3 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = a1;
}

uint64_t (*SessionFeedback.backingStore.modify())()
{
  return j__swift_endAccess;
}

uint64_t SessionFeedback.type.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_100197B80(&OBJC_IVAR____TtC14SearchFeedback15SessionFeedback_type, (void (*)(void))&type metadata accessor for SessionType, a1);
}

uint64_t SessionFeedback.sessionId.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC14SearchFeedback15SessionFeedback_sessionId);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SessionFeedback.creationDate.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_100197B80(&OBJC_IVAR____TtC14SearchFeedback15SessionFeedback_creationDate, (void (*)(void))&type metadata accessor for Date, a1);
}

uint64_t sub_100197B80@<X0>(void *a1@<X0>, void (*a2)(void)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = v3 + *a1;
  a2(0);
  sub_10001DCF8();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);

  return v8(a3, v5, v6);
}

uint64_t sub_100197BEC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC14SearchFeedback15SessionFeedback_closingDate;
  swift_beginAccess();
  return sub_100058624(v3, a2);
}

uint64_t sub_100197C44(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_10002572C(&qword_10021BB10);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100058624(a1, (uint64_t)v6);
  uint64_t v7 = *a2 + OBJC_IVAR____TtC14SearchFeedback15SessionFeedback_closingDate;
  swift_beginAccess();
  sub_100032DFC((uint64_t)v6, v7);
  return swift_endAccess();
}

uint64_t SessionFeedback.closingDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC14SearchFeedback15SessionFeedback_closingDate;
  swift_beginAccess();
  return sub_100058624(v3, a1);
}

uint64_t SessionFeedback.init(withWrappedPayload:creationDate:closingDate:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = v3;
  uint64_t v7 = type metadata accessor for SessionType();
  sub_100020C48();
  uint64_t v31 = v8;
  __chkstk_darwin(v9);
  sub_10000DFD0();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = type metadata accessor for BiomeSessionWrapper(0);
  sub_10001DCF8();
  __chkstk_darwin(v14);
  sub_10000DFD0();
  uint64_t v17 = v16 - v15;
  uint64_t v18 = v5 + OBJC_IVAR____TtC14SearchFeedback15SessionFeedback_closingDate;
  uint64_t v19 = type metadata accessor for Date();
  sub_10002538C(v18, 1, 1, v19);
  uint64_t v20 = a1;
  sub_1001970F8(v20, v17);
  if (v4)
  {

    sub_100019994(a3, &qword_10021BB10);
    sub_10000E004();
    sub_10000E040();
    v21();
    sub_100019994(v5 + OBJC_IVAR____TtC14SearchFeedback15SessionFeedback_closingDate, &qword_10021BB10);
    type metadata accessor for SessionFeedback(0);
    swift_deallocPartialClassInstance();
  }
  else
  {
    unint64_t v22 = *(void **)(v17 + *(int *)(v13 + 20));
    *(void *)(v5 + 16) = v22;
    id v23 = v22;
    double v25 = sub_1001977F0();
    char v27 = v26;

    id v28 = (uint64_t **)(v5 + OBJC_IVAR____TtC14SearchFeedback15SessionFeedback_sessionId);
    *id v28 = v25;
    v28[1] = v27;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 16))(v12, v17, v7);
    sub_1000329E8(v17);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 32))(v5 + OBJC_IVAR____TtC14SearchFeedback15SessionFeedback_type, v12, v7);
    sub_10000E004();
    (*(void (**)(void))(v29 + 32))();
    uint64_t v30 = v5 + OBJC_IVAR____TtC14SearchFeedback15SessionFeedback_closingDate;
    swift_beginAccess();
    sub_100032DFC(a3, v30);
    swift_endAccess();
  }
  return v5;
}

uint64_t sub_100198064(uint64_t a1, uint64_t a2)
{
  unint64_t v37 = (char *)a2;
  uint64_t v40 = a1;
  uint64_t v3 = sub_10002572C(&qword_10021BB10);
  __chkstk_darwin(v3 - 8);
  sub_100017D2C();
  uint64_t v42 = v4;
  sub_10000E100();
  __chkstk_darwin(v5);
  sub_100021308();
  uint64_t v41 = v6;
  sub_10000E100();
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v34 - v8;
  uint64_t v10 = type metadata accessor for Date();
  sub_100020C48();
  uint64_t v12 = v11;
  __chkstk_darwin(v13);
  sub_100017D2C();
  uint64_t v39 = v14;
  sub_10000E100();
  __chkstk_darwin(v15);
  sub_100021308();
  uint64_t v38 = v16;
  sub_10000E100();
  __chkstk_darwin(v17);
  sub_100021308();
  uint64_t v35 = v18;
  sub_10000E100();
  __chkstk_darwin(v19);
  sub_100021308();
  uint64_t v36 = v20;
  sub_10000E100();
  __chkstk_darwin(v21);
  __chkstk_darwin(v22);
  __chkstk_darwin(v23);
  double v25 = (char *)&v34 - v24;
  uint64_t v43 = v2;
  Date.addingTimeInterval(_:)();
  Date.init()();
  unint64_t v44 = sub_1000A599C();
  dispatch thunk of static Comparable.< infix(_:_:)();
  uint64_t v26 = *(void (**)(void))(v12 + 16);
  sub_1000273EC();
  v26();
  char v27 = *(void (**)(void))(v12 + 8);
  sub_10002C868();
  v27();
  uint64_t v28 = v35;
  sub_10002C868();
  v27();
  sub_100058624((uint64_t)v37, (uint64_t)v9);
  sub_1000273EC();
  v26();
  if (sub_100027BA4((uint64_t)v9, 1, v10) == 1)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 32))(v36, v28, v10);
    sub_100019994((uint64_t)v9, &qword_10021BB10);
  }
  else
  {
    sub_10002C868();
    v27();
    (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(v36, v9, v10);
  }
  dispatch thunk of static Comparable.>= infix(_:_:)();
  unint64_t v37 = v25;
  sub_1000273EC();
  v26();
  dispatch thunk of static Comparable.>= infix(_:_:)();
  sub_1000273EC();
  v26();
  dispatch thunk of static Comparable.< infix(_:_:)();
  uint64_t v29 = v41;
  sub_1000273EC();
  v26();
  sub_10002C868();
  v27();
  sub_10002C868();
  v27();
  sub_10002C868();
  v27();
  sub_10002C868();
  v27();
  sub_10002538C(v29, 0, 1, v10);
  uint64_t v30 = v29;
  uint64_t v31 = v42;
  sub_10007D918(v30, v42);
  uint64_t v32 = v43 + OBJC_IVAR____TtC14SearchFeedback15SessionFeedback_closingDate;
  swift_beginAccess();
  sub_100032DFC(v31, v32);
  return swift_endAccess();
}

uint64_t SessionFeedback.deinit()
{
  type metadata accessor for SessionType();
  sub_10001DCF8();
  sub_10000E040();
  v1();
  swift_bridgeObjectRelease();
  type metadata accessor for Date();
  sub_10001DCF8();
  sub_10000E040();
  v2();
  sub_100019994(v0 + OBJC_IVAR____TtC14SearchFeedback15SessionFeedback_closingDate, &qword_10021BB10);
  return v0;
}

uint64_t SessionFeedback.__deallocating_deinit()
{
  SessionFeedback.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_100198594()
{
  return type metadata accessor for SessionFeedback(0);
}

void sub_10019859C()
{
  type metadata accessor for SessionType();
  if (v0 <= 0x3F)
  {
    type metadata accessor for Date();
    if (v1 <= 0x3F)
    {
      sub_1000442AC();
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

uint64_t *sub_1001986B8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for SessionType();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v9;
    id v10 = v9;
  }
  return a1;
}

uint64_t sub_100198788(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SessionType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v8;
  id v9 = v8;
  return a1;
}

uint64_t sub_100198808(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SessionType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a2 + v7);
  id v9 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = v8;
  id v10 = v8;

  return a1;
}

uint64_t sub_100198890(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SessionType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_10019890C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SessionType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);

  return a1;
}

uint64_t sub_100198990(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1001989A4);
}

uint64_t sub_1001989A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for SessionType();
  sub_1000248F0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return sub_100027BA4(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    return (v9 + 1);
  }
}

uint64_t sub_100198A30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100198A44);
}

void sub_100198A44(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  type metadata accessor for SessionType();
  sub_1000248F0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    sub_10002538C(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
}

uint64_t sub_100198ACC()
{
  uint64_t result = type metadata accessor for SessionType();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_100198B64()
{
  unint64_t result = qword_100225EA0;
  if (!qword_100225EA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100225EA0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for BiomeSessionError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100198C7CLL);
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

ValueMetadata *type metadata accessor for BiomeSessionError()
{
  return &type metadata for BiomeSessionError;
}

unint64_t sub_100198CB8()
{
  unint64_t result = qword_100225EB0;
  if (!qword_100225EB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100225EB0);
  }
  return result;
}

void UploadStateFileStore.uploadDidStart(at:)(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_retain_n();
  unsigned int v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    unsigned int v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    *(_DWORD *)unsigned int v6 = 136315138;
    type metadata accessor for SessionBookmark();
    swift_retain();
    uint64_t v7 = String.init<A>(describing:)();
    sub_10001C274(v7, v8, &v26);
    sub_100017EA4();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    sub_100019B54();
    uint64_t v2 = v1;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Starting upload at bookmark: %s", v6, 0xCu);
    swift_arrayDestroy();
    sub_100017D40();
    sub_100017D40();
  }
  else
  {
    sub_100019B54();
  }

  uint64_t v9 = sub_100196130();
  if (!v2)
  {
    id v10 = v9;
    uint64_t v11 = *((void *)v9 + 2);
    if (v11)
    {
      type metadata accessor for SessionBookmark();
      uint64_t v12 = v10 + 5;
      while (1)
      {
        char v13 = *v12;
        if (static SessionBookmark.== infix(_:_:)(*((void *)v12 - 1), a1)) {
          break;
        }
        v12 += 16;
        if (!--v11) {
          goto LABEL_9;
        }
      }
      swift_retain();
      swift_bridgeObjectRelease();
      if (v13)
      {
        sub_100196A94();
        sub_100024A30();
        *uint64_t v19 = 1;
        swift_willThrow();
LABEL_20:
        swift_release();
        return;
      }
      swift_retain_n();
      uint64_t v21 = Logger.logObject.getter();
      os_log_type_t v22 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v21, v22))
      {
        uint64_t v23 = (uint8_t *)swift_slowAlloc();
        uint64_t v26 = swift_slowAlloc();
        *(_DWORD *)uint64_t v23 = 136315138;
        swift_retain();
        uint64_t v24 = String.init<A>(describing:)();
        sub_10001C274(v24, v25, &v26);
        sub_100017EA4();
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        sub_100019B54();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "restarting upload at bookmark: %s", v23, 0xCu);
        swift_arrayDestroy();
        sub_100017D40();
        sub_100017D40();
      }
      else
      {
        sub_100019B54();
      }
      swift_release();
    }
    else
    {
LABEL_9:
      uint64_t v14 = sub_100199134((uint64_t)v10);
      if (v14)
      {
        uint64_t v15 = v14;
        type metadata accessor for SessionBookmark();
        if (!static SessionBookmark.< infix(_:_:)(v15, a1))
        {
          swift_bridgeObjectRelease();
          sub_100196A94();
          sub_100024A30();
          *uint64_t v20 = 4;
          swift_willThrow();
          goto LABEL_20;
        }
        swift_release();
      }
      swift_retain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        id v10 = sub_100189370(0, v10[2] + 1, 1, (uint64_t)v10);
      }
      unint64_t v17 = v10[2];
      unint64_t v16 = v10[3];
      if (v17 >= v16 >> 1) {
        id v10 = sub_100189370((void *)(v16 > 1), v17 + 1, 1, (uint64_t)v10);
      }
      v10[2] = v17 + 1;
      uint64_t v18 = &v10[2 * v17];
      v18[4] = a1;
      *((unsigned char *)v18 + 40) = 0;
      sub_100199178((uint64_t)v10);
      swift_bridgeObjectRelease();
    }
  }
}

uint64_t sub_100199134(uint64_t a1)
{
  if (*(void *)(a1 + 16)) {
    return swift_retain();
  }
  else {
    return 0;
  }
}

uint64_t sub_100199178(uint64_t a1)
{
  uint64_t v4 = sub_10002572C(&qword_10021BB20);
  __chkstk_darwin(v4 - 8);
  unsigned int v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  char v13 = (char *)&v21 - v12;
  *(void *)(v1 + OBJC_IVAR____TtC14SearchFeedback20UploadStateFileStore_uploadStateCache) = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  NSFileManager.parsecdAssetsDirectoryURL.getter();
  if (sub_100027BA4((uint64_t)v6, 1, v7) == 1)
  {
    sub_10003CB40((uint64_t)v6);
    sub_100196A94();
    sub_100024A30();
    *uint64_t v14 = 0;
    return swift_willThrow();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v6, v7);
    type metadata accessor for JSONEncoder();
    swift_allocObject();
    JSONEncoder.init()();
    uint64_t v23 = a1;
    sub_100199914();
    swift_bridgeObjectRetain();
    uint64_t v16 = dispatch thunk of JSONEncoder.encode<A>(_:)();
    unint64_t v22 = v17;
    if (v2)
    {
      swift_bridgeObjectRelease();
      swift_release();
      return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    }
    else
    {
      uint64_t v18 = v16;
      swift_release();
      swift_bridgeObjectRelease();
      URL.appendingPathComponent(_:)();
      unint64_t v19 = v22;
      Data.write(to:options:)();
      sub_1000291B4(v18, v19);
      uint64_t v20 = *(void (**)(char *, uint64_t))(v8 + 8);
      v20(v10, v7);
      return ((uint64_t (*)(char *, uint64_t))v20)(v13, v7);
    }
  }
}

uint64_t UploadStateFileStore.uploadDidFinish(at:)(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_retain_n();
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    unsigned int v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    *(_DWORD *)unsigned int v6 = 136315138;
    type metadata accessor for SessionBookmark();
    swift_retain();
    uint64_t v7 = String.init<A>(describing:)();
    sub_10001C274(v7, v8, &v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    uint64_t v2 = v1;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Finished uploading at bookmark: %s", v6, 0xCu);
    swift_arrayDestroy();
    sub_100017D40();
    sub_100017D40();
  }
  else
  {
    swift_release_n();
  }

  uint64_t result = (uint64_t)sub_100196130();
  if (v2) {
    return result;
  }
  uint64_t v10 = result;
  swift_retain();
  uint64_t v11 = swift_bridgeObjectRetain();
  unint64_t v12 = sub_100199774(v11, a1);
  char v14 = v13;
  swift_bridgeObjectRelease();
  if (v14)
  {
    sub_100196A94();
    sub_100024A30();
    char v16 = 3;
    goto LABEL_11;
  }
  if ((v12 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v12 < *(void *)(v10 + 16))
  {
    if (*(unsigned char *)(v10 + 16 * v12 + 40))
    {
      sub_100196A94();
      sub_100024A30();
      char v16 = 2;
LABEL_11:
      *uint64_t v15 = v16;
      swift_willThrow();
      return swift_bridgeObjectRelease();
    }
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if (result) {
      goto LABEL_13;
    }
    goto LABEL_23;
  }
  __break(1u);
LABEL_23:
  uint64_t result = (uint64_t)sub_100199900(v10);
  uint64_t v10 = result;
LABEL_13:
  unint64_t v17 = *(void *)(v10 + 16);
  if (v12 >= v17)
  {
    __break(1u);
  }
  else
  {
    *(unsigned char *)(v10 + 32 + 16 * v12 + 8) = 1;
    if (v17 != 1 && *(unsigned char *)(v10 + 40) && *(unsigned char *)(v10 + 56) == 1)
    {
      do
      {
        unint64_t v18 = v17 - 1;
        memmove((void *)(v10 + 32), (const void *)(v10 + 48), 16 * (v17 - 1));
        *(void *)(v10 + 16) = v18;
        swift_release();
        unint64_t v17 = *(void *)(v10 + 16);
      }
      while (v17 >= 2 && (*(unsigned char *)(v10 + 56) & 1) != 0);
    }
    uint64_t v19 = swift_bridgeObjectRetain();
    sub_100199178(v19);
    return swift_bridgeObjectRelease_n();
  }
  return result;
}

uint64_t sub_100199774(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = (uint64_t *)(a1 + 32);
    type metadata accessor for SessionBookmark();
    uint64_t v5 = 0;
    while ((static SessionBookmark.== infix(_:_:)(*v4, a2) & 1) == 0)
    {
      ++v5;
      v4 += 2;
      if (v3 == v5)
      {
        uint64_t v5 = 0;
        break;
      }
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  swift_release();
  return v5;
}

uint64_t sub_10019980C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    sub_100026E64();
    uint64_t result = sub_100025BFC();
    __break(1u);
  }
  else if (a3 < a1 {
         || (uint64_t result = type metadata accessor for BiomeDatabaseReader.SessionProxy(),
  }
             a1 + *(void *)(*(void *)(result - 8) + 72) * a2 <= a3))
  {
    type metadata accessor for BiomeDatabaseReader.SessionProxy();
    sub_10000E1F0();
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    sub_10000E1F0();
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

void *sub_100199900(uint64_t a1)
{
  return sub_100189370(0, *(void *)(a1 + 16), 0, a1);
}

unint64_t sub_100199914()
{
  unint64_t result = qword_100225EB8;
  if (!qword_100225EB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100225EB8);
  }
  return result;
}

uint64_t sub_100199960(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, double a5, double a6)
{
  *(_WORD *)(v6 + 240) = 0;
  *(_OWORD *)(v6 + 208) = 0u;
  *(_OWORD *)(v6 + 224) = 0u;
  *(_OWORD *)(v6 + 176) = 0u;
  *(_OWORD *)(v6 + 192) = 0u;
  *(_OWORD *)(v6 + 144) = 0u;
  *(_OWORD *)(v6 + 160) = 0u;
  *(_OWORD *)(v6 + 128) = 0u;
  sub_10001C20C((uint64_t)a4, v6 + 88);
  uint64_t v13 = a4[3];
  sub_10001B620(a4, v13);
  sub_100025C7C();
  uint64_t v15 = v14(v13);
  uint64_t v17 = BiomeStoreEnumerator.init(reader:sqliteBridge:enumerationRange:messageName:)(a1, a2, a3, v15, v16, a5, a6);
  sub_10001CA50((uint64_t)a4);
  return v17;
}

uint64_t sub_100199A34()
{
  *(void *)(v0 + 128) = 0;
  *(void *)(v0 + 136) = 0;
  swift_unknownObjectRelease();
  __int16 v3 = 0;
  memset(v2, 0, sizeof(v2));
  sub_10002C878();
  swift_beginAccess();
  sub_10019A240((uint64_t)v2, v0 + 144);
  return swift_endAccess();
}

uint64_t *sub_100199A98()
{
  uint64_t v1 = v0;
  if (*(void *)(v0 + 128))
  {
    uint64_t v2 = *(uint64_t **)(v0 + 128);
  }
  else
  {
    uint64_t v3 = BiomeStoreEnumerator.payload.getter();
    if (v4 >> 60 == 15)
    {
      uint64_t v2 = 0;
    }
    else
    {
      uint64_t v5 = v3;
      unint64_t v6 = v4;
      id v7 = objc_allocWithZone((Class)type metadata accessor for RawPayload());
      sub_100027BCC(v5, v6);
      id v8 = RawPayload.init(with:)(v5, v6);
      uint64_t v2 = RawPayload.schemitized(with:)(v0 + 88);
      uint64_t v10 = v9;
      sub_10000A330(v5, v6);

      *(void *)(v1 + 128) = v2;
      *(void *)(v1 + 136) = v10;
      swift_unknownObjectRetain();
      swift_unknownObjectRelease();
    }
  }
  swift_unknownObjectRetain();
  return v2;
}

uint64_t *sub_100199B84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t result = sub_100199A98();
  if (result)
  {
    uint64_t v8 = v7;
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56))(a1, a2, ObjectType, v8);
    return (uint64_t *)swift_unknownObjectRelease();
  }
  else
  {
    *(void *)(a3 + 48) = 0;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)a3 = 0u;
    *(_WORD *)(a3 + 56) = -256;
  }
  return result;
}

double sub_100199C2C@<D0>(void *a1@<X8>)
{
  void (*v10)(void *__return_ptr, uint64_t, void *, uint64_t, uint64_t);
  double result;
  uint64_t v12;
  unsigned char v13[104];
  void __src[13];
  void v15[14];
  uint64_t v16;

  uint64_t v3 = v2;
  if (!sub_100199A98()) {
    return sub_100026F9C();
  }
  uint64_t v6 = v5;
  uint64_t v16 = v1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v8 = qword_100225EC0;
  uint64_t v9 = off_100225EC8;
  uint64_t v10 = *(void (**)(void *__return_ptr, uint64_t, void *, uint64_t, uint64_t))(v6 + 136);
  swift_bridgeObjectRetain();
  v10(v15, v8, v9, ObjectType, v6);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  if (!v3)
  {
    sub_10019A2FC((uint64_t)v15, (uint64_t)__src);
    if (__src[3])
    {
      memcpy(a1, __src, 0x62uLL);
      sub_10019A364((uint64_t)a1, (uint64_t)__src);
      sub_10019A2FC((uint64_t)__src, (uint64_t)v13);
      unint64_t v12 = v16 + 144;
      sub_10002C878();
      swift_beginAccess();
      sub_10019A240((uint64_t)v13, v12);
      swift_endAccess();
    }
    else
    {
      sub_100019938((uint64_t)__src, &qword_1002260D8);
      return sub_100026F9C();
    }
  }
  return result;
}

void sub_100199D78()
{
  sub_100199C2C(v4);
  if (!v0)
  {
    sub_100008B84((uint64_t)v4, (uint64_t)__src, &qword_1002260D8);
    if (__src[3])
    {
      memcpy(__dst, __src, 0x62uLL);
      sub_100032AD8((uint64_t)&__dst[40], (uint64_t)__src);
      if (BYTE1(__src[7]) != 10)
      {
        sub_10001B840((uint64_t)__src);
        sub_10018C19C();
        swift_allocError();
        *uint64_t v1 = 0;
        swift_willThrow();
      }
      sub_10019A2A8((uint64_t)__dst);
      sub_100019938((uint64_t)v4, &qword_1002260D8);
    }
    else
    {
      sub_100019938((uint64_t)v4, &qword_1002260D8);
      sub_100019938((uint64_t)__src, &qword_1002260D8);
    }
  }
}

uint64_t sub_100199E9C()
{
  sub_100199C2C(v7);
  if (!v1)
  {
    if (v8)
    {
      sub_10001C20C((uint64_t)v7, (uint64_t)v5);
      sub_10019A2A8((uint64_t)v7);
      uint64_t v2 = v6;
      sub_10001B620(v5, v6);
      sub_100025C7C();
      uint64_t v0 = v3(v2);
      sub_10001CA50((uint64_t)v5);
    }
    else
    {
      sub_100019938((uint64_t)v7, &qword_1002260D8);
      return 0;
    }
  }
  return v0;
}

uint64_t sub_100199F54()
{
  uint64_t v1 = *(void *)aQueryid_0;
  uint64_t v2 = unk_100225ED8;
  swift_bridgeObjectRetain();
  sub_100199B84(v1, v2, (uint64_t)v8);
  uint64_t result = swift_bridgeObjectRelease();
  if (!v0)
  {
    sub_100008B84((uint64_t)v8, (uint64_t)v5, &qword_100221918);
    if (HIBYTE(v6) <= 0xFEu)
    {
      sub_10001B978((uint64_t)v5, (uint64_t)v7);
      sub_100032AD8((uint64_t)v7, (uint64_t)v5);
      if (HIBYTE(v6) == 3)
      {
        sub_10001B840((uint64_t)v7);
        sub_100019938((uint64_t)v8, &qword_100221918);
        return v5[0];
      }
      else
      {
        sub_10001B840((uint64_t)v5);
        sub_10018C19C();
        swift_allocError();
        *unint64_t v4 = 0;
        swift_willThrow();
        sub_10001B840((uint64_t)v7);
        return sub_100019938((uint64_t)v8, &qword_100221918);
      }
    }
    else
    {
      sub_100019938((uint64_t)v8, &qword_100221918);
      sub_100019938((uint64_t)v5, &qword_100221918);
      return 0;
    }
  }
  return result;
}

void sub_10019A0A0(uint64_t a1)
{
  sub_100199D78();
  if (!v2)
  {
    uint64_t v6 = v4;
    if (v4)
    {
      uint64_t v7 = v5;
      uint64_t v8 = *(void *)(v1 + 64);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 16))(v6, v7, a1, ObjectType, v8);
      swift_unknownObjectRelease();
    }
    else
    {
      SQLiteContext.setNull()();
    }
  }
}

void sub_10019A140()
{
}

uint64_t sub_10019A170()
{
  sub_10001CA50(v0 + 88);
  swift_unknownObjectRelease();
  return sub_100019938(v0 + 144, &qword_1002260D8);
}

id *sub_10019A1A4()
{
  uint64_t v0 = BiomeStoreEnumerator.deinit();
  sub_10001CA50((uint64_t)(v0 + 11));
  swift_unknownObjectRelease();
  sub_100019938((uint64_t)(v0 + 18), &qword_1002260D8);
  return v0;
}

uint64_t sub_10019A1EC()
{
  uint64_t v0 = sub_10019A1A4();

  return _swift_deallocClassInstance(v0, 242, 7);
}

uint64_t type metadata accessor for FeedbackEnumerator()
{
  return self;
}

uint64_t sub_10019A240(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10002572C(&qword_1002260D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_10019A2A8(uint64_t a1)
{
  return a1;
}

uint64_t sub_10019A2FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10002572C(&qword_1002260D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10019A364(uint64_t a1, uint64_t a2)
{
  return a2;
}

void SessionDatabaseError.hash(into:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  switch(a3)
  {
    case 1:
      Swift::UInt v3 = 0;
      goto LABEL_11;
    case 2:
      Swift::UInt v3 = 1;
      goto LABEL_11;
    case 3:
      Swift::UInt v3 = 2;
      goto LABEL_11;
    case 4:
      Swift::UInt v3 = 3;
      goto LABEL_11;
    case 5:
      Swift::UInt v3 = 4;
LABEL_11:
      Hasher._combine(_:)(v3);
      break;
    default:
      Hasher._combine(_:)(5uLL);
      if (a3)
      {
        Hasher._combine(_:)(1u);
        swift_bridgeObjectRetain();
        String.hash(into:)();
        sub_10019A4DC(a2, a3);
      }
      else
      {
        Hasher._combine(_:)(0);
      }
      break;
  }
}

uint64_t sub_10019A4DC(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a2 - 1) >= 5) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t static SessionDatabaseError.__derived_enum_equals(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  switch(a2)
  {
    case 1:
      return a4 == 1;
    case 2:
      return a4 == 2;
    case 3:
      return a4 == 3;
    case 4:
      return a4 == 4;
    case 5:
      return a4 == 5;
    default:
      if ((unint64_t)(a4 - 1) < 5) {
        return 0;
      }
      if (a2)
      {
        if (!a4) {
          return 0;
        }
        BOOL v4 = a1 == a3 && a2 == a4;
        return v4 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0;
      }
      if (!a4) {
        return 1;
      }
      sub_10019A4DC(a1, 0);
      return 0;
  }
}

Swift::Int SessionDatabaseError.hashValue.getter(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  switch(a2)
  {
    case 1:
      Swift::UInt v4 = 0;
      goto LABEL_9;
    case 2:
      Swift::UInt v4 = 1;
      goto LABEL_9;
    case 3:
      Swift::UInt v4 = 2;
      goto LABEL_9;
    case 4:
      Swift::UInt v4 = 3;
      goto LABEL_9;
    case 5:
      Swift::UInt v4 = 4;
LABEL_9:
      Hasher._combine(_:)(v4);
      break;
    default:
      Hasher._combine(_:)(5uLL);
      if (a2)
      {
        Hasher._combine(_:)(1u);
        swift_bridgeObjectRetain();
        String.hash(into:)();
        sub_10019A4DC(a1, a2);
      }
      else
      {
        Hasher._combine(_:)(0);
      }
      break;
  }
  return Hasher._finalize()();
}

Swift::Int sub_10019A6DC()
{
  return SessionDatabaseError.hashValue.getter(*v0, v0[1]);
}

void sub_10019A6E4(uint64_t a1)
{
  SessionDatabaseError.hash(into:)(a1, *v1, v1[1]);
}

Swift::Int sub_10019A6EC()
{
  uint64_t v2 = *v0;
  uint64_t v1 = v0[1];
  Hasher.init(_seed:)();
  switch(v1)
  {
    case 1:
      Swift::UInt v3 = 0;
      goto LABEL_9;
    case 2:
      Swift::UInt v3 = 1;
      goto LABEL_9;
    case 3:
      Swift::UInt v3 = 2;
      goto LABEL_9;
    case 4:
      Swift::UInt v3 = 3;
      goto LABEL_9;
    case 5:
      Swift::UInt v3 = 4;
LABEL_9:
      Hasher._combine(_:)(v3);
      break;
    default:
      Hasher._combine(_:)(5uLL);
      if (v1)
      {
        Hasher._combine(_:)(1u);
        swift_bridgeObjectRetain();
        String.hash(into:)();
        sub_10019A4DC(v2, v1);
      }
      else
      {
        Hasher._combine(_:)(0);
      }
      break;
  }
  return Hasher._finalize()();
}

uint64_t sub_10019A7F8(uint64_t *a1, uint64_t *a2)
{
  return static SessionDatabaseError.__derived_enum_equals(_:_:)(*a1, a1[1], *a2, a2[1]);
}

uint64_t SessionFeedbackReference.sessionBookmark.getter()
{
  return swift_retain();
}

unint64_t sub_10019A81C()
{
  unint64_t result = qword_100226190;
  if (!qword_100226190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100226190);
  }
  return result;
}

unint64_t destroy for SessionDatabaseError(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  int v2 = -1;
  if (result < 0xFFFFFFFF) {
    int v2 = result;
  }
  if ((v2 + 1) <= 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s14SearchFeedback20SessionDatabaseErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  LODWORD(v4) = -1;
  if (v3 < 0xFFFFFFFF) {
    uint64_t v4 = *(void *)(a2 + 8);
  }
  if ((v4 + 1) > 1)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

void *assignWithCopy for SessionDatabaseError(void *a1, void *a2)
{
  LODWORD(v4) = -1;
  if (a1[1] >= 0xFFFFFFFFuLL) {
    LODWORD(v5) = -1;
  }
  else {
    uint64_t v5 = a1[1];
  }
  unsigned int v6 = v5 + 1;
  if (a2[1] < 0xFFFFFFFFuLL) {
    uint64_t v4 = a2[1];
  }
  unsigned int v7 = v4 + 1;
  if (v6 > 1)
  {
    if (v7 <= 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_12:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v7 > 1)
  {
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for SessionDatabaseError(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a1 + 8);
  int v5 = -1;
  if (v4 < 0xFFFFFFFF) {
    int v5 = v4;
  }
  if ((v5 + 1) > 1) {
    goto LABEL_9;
  }
  unint64_t v6 = *(void *)(a2 + 8);
  LODWORD(v7) = -1;
  if (v6 < 0xFFFFFFFF) {
    uint64_t v7 = *(void *)(a2 + 8);
  }
  if ((v7 + 1) > 1)
  {
    swift_bridgeObjectRelease();
LABEL_9:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SessionDatabaseError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 > 0x7FFFFFF9 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483642);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) < 2) {
    LODWORD(v3) = 0;
  }
  if (v3 >= 6) {
    return (v3 - 5);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SessionDatabaseError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFA)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483642;
    if (a3 >= 0x7FFFFFFA) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFA) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 5;
    }
  }
  return result;
}

uint64_t sub_10019AAC8(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  if ((v1 + 1) >= 2) {
    return v1;
  }
  else {
    return 0;
  }
}

void *sub_10019AAE8(void *result, unsigned int a2)
{
  if (a2 > 0x7FFFFFFE)
  {
    *unint64_t result = 0;
    result[1] = 0;
    *(_DWORD *)unint64_t result = a2 - 0x7FFFFFFF;
  }
  else if (a2)
  {
    result[1] = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for SessionDatabaseError()
{
  return &type metadata for SessionDatabaseError;
}

uint64_t destroy for SessionFeedbackReference()
{
  swift_release();

  return swift_release();
}

void *_s14SearchFeedback24SessionFeedbackReferenceVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for SessionFeedbackReference(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for SessionFeedbackReference(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for SessionFeedbackReference()
{
  return &type metadata for SessionFeedbackReference;
}

uint64_t sub_10019AC50()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_10004CD40(v0, qword_100236DC8);
  sub_10002A10C(v0, (uint64_t)qword_100236DC8);
  return Logger.init(subsystem:category:)();
}

ValueMetadata *type metadata accessor for SearchFeedbackError()
{
  return &type metadata for SearchFeedbackError;
}

double SessionBookmark.__allocating_init()()
{
  sub_1000273FC();
  uint64_t v0 = swift_allocObject();
  double result = 0.0;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(unsigned char *)(v0 + 48) = 1;
  return result;
}

uint64_t static SessionBookmark.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a2 + 32);
  uint64_t result = (v4 | v5) == 0;
  if (v4 && v5)
  {
    if (*(void *)(a1 + 24) == *(void *)(a2 + 24) && v4 == v5) {
      return 1;
    }
    else {
      return _stringCompareWithSmolCheck(_:_:expecting:)();
    }
  }
  return result;
}

BOOL static SessionBookmark.< infix(_:_:)(uint64_t a1, uint64_t a2)
{
  double v2 = *(double *)(a1 + 40);
  double v3 = -1.0;
  if (*(unsigned char *)(a1 + 48)) {
    double v2 = -1.0;
  }
  if (!*(unsigned char *)(a2 + 48)) {
    double v3 = *(double *)(a2 + 40);
  }
  return v2 < v3;
}

uint64_t sub_10019AD88(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x616D6B6F6F426D62 && a2 == 0xEA00000000006B72;
  if (v2 || (sub_100025848() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x496E6F6973736573 && a2 == 0xE900000000000064;
    if (v6 || (sub_100025848() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x6D617473656D6974 && a2 == 0xE900000000000070)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v8 = sub_100025848();
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

uint64_t sub_10019AED0(char a1)
{
  if (!a1) {
    return 0x616D6B6F6F426D62;
  }
  if (a1 == 1) {
    return 0x496E6F6973736573;
  }
  return 0x6D617473656D6974;
}

uint64_t sub_10019AF30()
{
  return sub_10019AED0(*v0);
}

uint64_t sub_10019AF38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10019AD88(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10019AF60(uint64_t a1)
{
  unint64_t v2 = sub_10019B3AC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10019AF9C(uint64_t a1)
{
  unint64_t v2 = sub_10019B3AC();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10019AFD8(void *a1)
{
  uint64_t v1 = sub_10019BC3C(a1);
  if (v2 >> 60 == 15)
  {
    sub_10019BCA0();
    swift_allocError();
    unsigned char *v3 = 1;
    swift_willThrow();
  }
  return v1;
}

id sub_10019B054(uint64_t a1, unint64_t a2)
{
  objc_allocWithZone((Class)BMStoreBookmark);
  sub_100027BCC(a1, a2);
  id result = sub_10019BBC8(a1, a2);
  if (!result)
  {
    sub_10019BCA0();
    swift_allocError();
    *uint64_t v5 = 0;
    return (id)swift_willThrow();
  }
  return result;
}

double SessionBookmark.init()()
{
  double result = 0.0;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(unsigned char *)(v0 + 48) = 1;
  return result;
}

uint64_t SessionBookmark.__allocating_init(from:)(void *a1)
{
  sub_1000273FC();
  uint64_t v2 = swift_allocObject();
  SessionBookmark.init(from:)(a1);
  return v2;
}

uint64_t SessionBookmark.init(from:)(void *a1)
{
  sub_10002572C(&qword_100226198);
  sub_100020C48();
  __chkstk_darwin(v3);
  sub_10001B620(a1, a1[3]);
  sub_10019B3AC();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v1)
  {
    uint64_t v5 = v11;
    type metadata accessor for SessionBookmark();
    swift_deallocPartialClassInstance();
  }
  else
  {
    sub_10010EDBC();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    uint64_t v5 = v11;
    *(void *)(v11 + 16) = sub_10019B054(v12, v13);
    sub_100024F10(1);
    *(void *)(v11 + 24) = KeyedDecodingContainer.decode(_:forKey:)();
    *(void *)(v11 + 32) = v6;
    sub_100024F10(2);
    KeyedDecodingContainer.decode(_:forKey:)();
    uint64_t v8 = v7;
    uint64_t v9 = sub_10002C88C();
    v10(v9);
    sub_1000291B4(v12, v13);
    *(void *)(v11 + 40) = v8;
    *(unsigned char *)(v11 + 48) = 0;
  }
  sub_10001CA50((uint64_t)a1);
  return v5;
}

unint64_t sub_10019B3AC()
{
  unint64_t result = qword_1002261A0;
  if (!qword_1002261A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002261A0);
  }
  return result;
}

uint64_t type metadata accessor for SessionBookmark()
{
  return self;
}

uint64_t sub_10019B41C(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  *(void *)(v4 + 32) = a3;
  *(double *)(v4 + 40) = a4;
  *(unsigned char *)(v4 + 48) = 0;
  return v4;
}

void SessionBookmark.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  sub_10002572C(&qword_1002261A8);
  sub_100020C48();
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void **)(v3 + 16);
  if (v10)
  {
    uint64_t v20 = v7;
    uint64_t v21 = v6;
    sub_10001B620(a1, a1[3]);
    sub_10019B3AC();
    id v11 = v10;
    dispatch thunk of Encoder.container<A>(keyedBy:)();
    uint64_t v12 = sub_10019AFD8(v11);
    if (v2)
    {
      (*(void (**)(char *, uint64_t))(v20 + 8))(v9, v21);
    }
    else
    {
      uint64_t v14 = v12;
      unint64_t v15 = v13;
      uint64_t v22 = v12;
      unint64_t v23 = v13;
      char v24 = 0;
      sub_100061560();
      KeyedEncodingContainer.encode<A>(_:forKey:)();
      sub_1000291B4(v14, v15);
      unint64_t v16 = *(void *)(v3 + 32);
      uint64_t v22 = *(void *)(v3 + 24);
      unint64_t v23 = v16;
      char v24 = 1;
      swift_bridgeObjectRetain();
      sub_10002572C(&qword_10021D050);
      sub_10019B6D8(&qword_1002261B0, &qword_10021D050);
      sub_10002ACC0();
      KeyedEncodingContainer.encode<A>(_:forKey:)();
      swift_bridgeObjectRelease();
      char v17 = *(unsigned char *)(v3 + 48);
      uint64_t v22 = *(void *)(v3 + 40);
      LOBYTE(v23) = v17;
      char v24 = 2;
      sub_10002572C(&qword_1002235C8);
      sub_10019B6D8(&qword_1002261B8, &qword_1002235C8);
      sub_10002ACC0();
      KeyedEncodingContainer.encode<A>(_:forKey:)();
      uint64_t v18 = sub_10002A900();
      v19(v18);
    }
  }
}

uint64_t sub_10019B6D8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000371D4(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void SessionBookmark.hash(into:)()
{
  if (*(void *)(v0 + 32))
  {
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    Hasher._combine(_:)(0);
  }
}

uint64_t SessionBookmark.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t SessionBookmark.__deallocating_deinit()
{
  SessionBookmark.deinit();
  uint64_t v0 = sub_1000273FC();

  return _swift_deallocClassInstance(v0, v1, v2);
}

Swift::Int SessionBookmark.hashValue.getter()
{
  return Hasher._finalize()();
}

Swift::Int sub_10019B858()
{
  return SessionBookmark.hashValue.getter();
}

void sub_10019B87C()
{
}

unint64_t sub_10019B8A4()
{
  unint64_t result = qword_1002261C0;
  if (!qword_1002261C0)
  {
    type metadata accessor for SessionBookmark();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002261C0);
  }
  return result;
}

Swift::Int sub_10019B8F0()
{
  return Hasher._finalize()();
}

BOOL sub_10019B930(uint64_t *a1, uint64_t *a2)
{
  return static SessionBookmark.< infix(_:_:)(*a1, *a2);
}

uint64_t sub_10019B960@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = SessionBookmark.__allocating_init(from:)(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

void sub_10019B98C(void *a1)
{
}

uint64_t sub_10019B9B0(uint64_t *a1, uint64_t *a2)
{
  return static SessionBookmark.== infix(_:_:)(*a1, *a2) & 1;
}

unsigned char *storeEnumTagSinglePayload for SessionBookmark.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10019BAA0);
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

ValueMetadata *type metadata accessor for SessionBookmark.CodingKeys()
{
  return &type metadata for SessionBookmark.CodingKeys;
}

unint64_t sub_10019BADC()
{
  unint64_t result = qword_1002262A0;
  if (!qword_1002262A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002262A0);
  }
  return result;
}

unint64_t sub_10019BB2C()
{
  unint64_t result = qword_1002262A8;
  if (!qword_1002262A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002262A8);
  }
  return result;
}

unint64_t sub_10019BB7C()
{
  unint64_t result = qword_1002262B0;
  if (!qword_1002262B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002262B0);
  }
  return result;
}

id sub_10019BBC8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_10000A330(a1, a2);
  }
  id v6 = [v2 initWithProtoData:isa];

  return v6;
}

uint64_t sub_10019BC3C(void *a1)
{
  id v1 = [a1 encodeAsProto];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = static Data._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

unint64_t sub_10019BCA0()
{
  unint64_t result = qword_1002262B8;
  if (!qword_1002262B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002262B8);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for SessionBookmarkError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10019BDB8);
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

ValueMetadata *type metadata accessor for SessionBookmarkError()
{
  return &type metadata for SessionBookmarkError;
}

unint64_t sub_10019BDF4()
{
  unint64_t result = qword_1002262C0;
  if (!qword_1002262C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002262C0);
  }
  return result;
}

uint64_t sub_10019BE40()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_10004CD40(v0, qword_100236DE0);
  sub_10002A10C(v0, (uint64_t)qword_100236DE0);
  return Logger.init(subsystem:category:)();
}

uint64_t WritableSessionDatabase.__allocating_init(fileManager:ledger:)(void *a1, uint64_t a2)
{
  sub_10001C20C(a2, (uint64_t)v8);
  uint64_t v7 = 0;
  memset(v6, 0, sizeof(v6));
  uint64_t v4 = sub_10019BF20(a1, (uint64_t)v8, (uint64_t)v6);
  sub_10001CA50(a2);
  return v4;
}

uint64_t sub_10019BF20(void *a1, uint64_t a2, uint64_t a3)
{
  if (qword_100224320 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_10002A10C(v6, (uint64_t)qword_100236DE0);
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Initializing Biome feedback store", v9, 2u);
    sub_100017D40();
  }

  sub_100195354(a3, (uint64_t)v15);
  type metadata accessor for BiomeDatabaseWriter();
  swift_allocObject();
  id v10 = a1;
  id v11 = sub_100194E6C((uint64_t)v10, (uint64_t)v15);
  sub_10001C20C(a2, (uint64_t)v15);
  type metadata accessor for WritableSessionDatabase();
  uint64_t v12 = swift_allocObject();
  uint64_t v13 = sub_10019CC30((uint64_t)v11, v15, v12);

  sub_10019CCF8(a3);
  sub_10001CA50(a2);
  return v13;
}

Swift::Bool __swiftcall WritableSessionDatabase.closeSession(guid:)(Swift::String guid)
{
  object = guid._object;
  uint64_t countAndFlagsBits = guid._countAndFlagsBits;
  uint64_t v4 = v1[12];
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_100032814(v4, v1, countAndFlagsBits);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = v1[5];
    uint64_t v8 = v1[6];
    sub_10001B620(v1 + 2, v7);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 24))(v6, v7, v8);
    unint64_t v16 = *(os_unfair_lock_s **)(v4 + 16);
    os_unfair_lock_lock(v16);
    sub_10002AD10();
    swift_bridgeObjectRetain();
    sub_10019C7FC(countAndFlagsBits, (uint64_t)object);
    swift_endAccess();
    swift_bridgeObjectRelease();
    swift_release();
    os_unfair_lock_unlock(v16);
    swift_release();
    return 1;
  }
  else
  {
    if (qword_100224320 != -1) {
      swift_once();
    }
    uint64_t v9 = type metadata accessor for Logger();
    sub_10002A10C(v9, (uint64_t)qword_100236DE0);
    sub_100024F28();
    id v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v10, v11))
    {
      swift_slowAlloc();
      v18[0] = swift_slowAlloc();
      uint64_t v12 = sub_1000215EC(4.8149e-34);
      sub_10002CFFC(v12, v13, v18);
      sub_10000E2F4();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      sub_10002A918();
      sub_1000280A0((void *)&_mh_execute_header, v14, v15, "Attempt to close missing session with GUID: %s");
      swift_arrayDestroy();
      sub_100017D40();
      sub_100017D40();
    }
    else
    {

      sub_100025FDC();
    }
    return 0;
  }
}

uint64_t WritableSessionDatabase.deinit()
{
  sub_10001CA50(v0 + 16);
  sub_10001CA50(v0 + 56);
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t WritableSessionDatabase.__deallocating_deinit()
{
  WritableSessionDatabase.deinit();

  return _swift_deallocClassInstance(v0, 112, 7);
}

BOOL sub_10019C4E4(uint64_t a1, uint64_t a2)
{
  return WritableSessionDatabase.closeSession(guid:)(*(Swift::String *)&a1);
}

uint64_t sub_10019C50C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_100019A28();
  char v6 = v5;
  swift_bridgeObjectRelease();
  if (v6)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v20 = *v2;
    uint64_t v8 = *v2;
    uint64_t *v2 = 0x8000000000000000;
    Swift::Int v9 = *(void *)(v8 + 24);
    sub_10002572C((uint64_t *)&unk_1002263C0);
    _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v9);
    uint64_t v10 = *(void *)(v20 + 48);
    uint64_t v11 = type metadata accessor for SessionType();
    sub_10001DCF8();
    (*(void (**)(unint64_t, uint64_t))(v12 + 8))(v10 + *(void *)(v12 + 72) * v4, v11);
    uint64_t v13 = *(void *)(v20 + 56);
    uint64_t v14 = type metadata accessor for BiomeDatabaseReader.SessionProxy();
    sub_10001DCF8();
    sub_1001917B0(v13 + *(void *)(v15 + 72) * v4, a1);
    sub_10019CD58((unint64_t *)&qword_1002197A0);
    _NativeDictionary._delete(at:)();
    uint64_t *v2 = v20;
    swift_bridgeObjectRelease();
    uint64_t v16 = a1;
    uint64_t v17 = 0;
    uint64_t v18 = v14;
  }
  else
  {
    uint64_t v18 = type metadata accessor for BiomeDatabaseReader.SessionProxy();
    uint64_t v16 = a1;
    uint64_t v17 = 1;
  }

  return sub_10002538C(v16, v17, 1, v18);
}

uint64_t sub_10019C6AC()
{
  id v1 = v0;
  swift_bridgeObjectRetain();
  unint64_t v2 = sub_100019A28();
  char v4 = v3;
  swift_bridgeObjectRelease();
  if ((v4 & 1) == 0) {
    return 0;
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *v1;
  uint64_t v6 = *v1;
  *id v1 = 0x8000000000000000;
  Swift::Int v7 = *(void *)(v6 + 24);
  sub_10002572C(&qword_1002263B8);
  _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v7);
  uint64_t v8 = *(void *)(v13 + 48);
  uint64_t v9 = type metadata accessor for SessionType();
  sub_10001DCF8();
  (*(void (**)(unint64_t, uint64_t))(v10 + 8))(v8 + *(void *)(v10 + 72) * v2, v9);
  uint64_t v11 = *(void *)(*(void *)(v13 + 56) + 8 * v2);
  sub_10002572C(&qword_100224328);
  sub_10019CD58((unint64_t *)&qword_1002197A0);
  _NativeDictionary._delete(at:)();
  *id v1 = v13;
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_10019C7FC(uint64_t a1, uint64_t a2)
{
  char v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_1000287F0(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *v3;
  uint64_t v9 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  Swift::Int v10 = *(void *)(v9 + 24);
  sub_10002572C(&qword_1002263B0);
  _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v10);
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(*(void *)(v13 + 56) + 8 * v6);
  type metadata accessor for SessionFeedback(0);
  _NativeDictionary._delete(at:)();
  uint64_t *v3 = v13;
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_10019C908()
{
  sub_1000274B0();
  uint64_t v1 = sub_100025FF4();
  sub_10019C980(v1, v2, v3);
  *uint64_t v0 = v5;

  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for WritableSessionDatabase()
{
  return self;
}

uint64_t sub_10019C980(uint64_t a1, uint64_t a2, char a3)
{
  char v4 = (void **)v3;
  uint64_t v8 = type metadata accessor for SessionType();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)*v3;
  unint64_t v13 = sub_100019A28();
  uint64_t v15 = v12[2];
  BOOL v16 = (v14 & 1) == 0;
  Swift::Int v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v18 = v13;
  char v19 = v14;
  sub_10002572C((uint64_t *)&unk_1002263C0);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a3 & 1, v17)) {
    goto LABEL_5;
  }
  unint64_t v20 = sub_100019A28();
  if ((v19 & 1) != (v21 & 1))
  {
LABEL_11:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v18 = v20;
LABEL_5:
  uint64_t v22 = *v4;
  if (v19)
  {
    uint64_t v23 = v22[7];
    uint64_t v24 = v23 + *(void *)(*(void *)(type metadata accessor for BiomeDatabaseReader.SessionProxy() - 8) + 72) * v18;
    return sub_10019CD9C(a1, v24);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
    return sub_10019CB54(v18, (uint64_t)v11, a1, v22);
  }
}

uint64_t sub_10019CB54(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = type metadata accessor for SessionType();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  uint64_t v10 = a4[7];
  uint64_t v11 = type metadata accessor for BiomeDatabaseReader.SessionProxy();
  uint64_t result = sub_1001917B0(a3, v10 + *(void *)(*(void *)(v11 - 8) + 72) * a1);
  uint64_t v13 = a4[2];
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    a4[2] = v15;
  }
  return result;
}

uint64_t sub_10019CC30(uint64_t a1, long long *a2, uint64_t a3)
{
  uint64_t v10 = type metadata accessor for BiomeDatabaseWriter();
  uint64_t v11 = &protocol witness table for BiomeDatabaseWriter;
  *(void *)&long long v9 = a1;
  type metadata accessor for Locker();
  uint64_t v6 = swift_allocObject();
  char v7 = (_DWORD *)swift_slowAlloc();
  *(void *)(v6 + 16) = v7;
  *char v7 = 0;
  *(void *)(a3 + 96) = v6;
  type metadata accessor for SessionFeedback(0);
  *(void *)(a3 + 104) = Dictionary.init(dictionaryLiteral:)();
  sub_10001C1AC(&v9, a3 + 16);
  sub_10001C1AC(a2, a3 + 56);
  return a3;
}

uint64_t sub_10019CCF8(uint64_t a1)
{
  uint64_t v2 = sub_10002572C(&qword_100225AE0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10019CD58(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for SessionType();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10019CD9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for BiomeDatabaseReader.SessionProxy();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t URLRequest.cachePolicy.setter()
{
  return URLRequest.cachePolicy.setter();
}

uint64_t URLRequest.description.getter()
{
  return URLRequest.description.getter();
}

uint64_t URLRequest.timeoutInterval.setter()
{
  return URLRequest.timeoutInterval.setter();
}

uint64_t URLRequest.debugDescription.getter()
{
  return URLRequest.debugDescription.getter();
}

NSURLRequest __swiftcall URLRequest._bridgeToObjectiveC()()
{
  uint64_t v0 = (objc_class *)URLRequest._bridgeToObjectiveC()();
  result._internal = v1;
  result.super.Class isa = v0;
  return result;
}

uint64_t URLRequest.allHTTPHeaderFields.getter()
{
  return URLRequest.allHTTPHeaderFields.getter();
}

uint64_t URLRequest.allHTTPHeaderFields.setter()
{
  return URLRequest.allHTTPHeaderFields.setter();
}

uint64_t URLRequest.assumesHTTP3Capable.setter()
{
  return URLRequest.assumesHTTP3Capable.setter();
}

uint64_t static URLRequest._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URLRequest._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t URLRequest.init(url:cachePolicy:timeoutInterval:)()
{
  return URLRequest.init(url:cachePolicy:timeoutInterval:)();
}

uint64_t URLRequest.url.getter()
{
  return URLRequest.url.getter();
}

Swift::String_optional __swiftcall URLRequest.value(forHTTPHeaderField:)(Swift::String forHTTPHeaderField)
{
  uint64_t v1 = URLRequest.value(forHTTPHeaderField:)(forHTTPHeaderField._countAndFlagsBits, forHTTPHeaderField._object);
  result.value._object = v2;
  result.value._uint64_t countAndFlagsBits = v1;
  return result;
}

Swift::Void __swiftcall URLRequest.setValue(_:forHTTPHeaderField:)(Swift::String_optional _, Swift::String forHTTPHeaderField)
{
}

uint64_t type metadata accessor for URLRequest()
{
  return type metadata accessor for URLRequest();
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t JSONDecoder.init()()
{
  return JSONDecoder.init()();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t static JSONEncoder.OutputFormatting.sortedKeys.getter()
{
  return static JSONEncoder.OutputFormatting.sortedKeys.getter();
}

uint64_t static JSONEncoder.OutputFormatting.prettyPrinted.getter()
{
  return static JSONEncoder.OutputFormatting.prettyPrinted.getter();
}

uint64_t type metadata accessor for JSONEncoder.OutputFormatting()
{
  return type metadata accessor for JSONEncoder.OutputFormatting();
}

uint64_t dispatch thunk of JSONEncoder.outputFormatting.setter()
{
  return dispatch thunk of JSONEncoder.outputFormatting.setter();
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t JSONEncoder.init()()
{
  return JSONEncoder.init()();
}

uint64_t type metadata accessor for JSONEncoder()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t static CharacterSet.whitespaces.getter()
{
  return static CharacterSet.whitespaces.getter();
}

uint64_t CharacterSet.init(charactersIn:)()
{
  return CharacterSet.init(charactersIn:)();
}

uint64_t static CharacterSet.alphanumerics.getter()
{
  return static CharacterSet.alphanumerics.getter();
}

uint64_t static CharacterSet.decimalDigits.getter()
{
  return static CharacterSet.decimalDigits.getter();
}

uint64_t CharacterSet.union(_:)()
{
  return CharacterSet.union(_:)();
}

uint64_t static CharacterSet.letters.getter()
{
  return static CharacterSet.letters.getter();
}

uint64_t CharacterSet.contains(_:)()
{
  return CharacterSet.contains(_:)();
}

uint64_t CharacterSet.inverted.getter()
{
  return CharacterSet.inverted.getter();
}

uint64_t type metadata accessor for CharacterSet()
{
  return type metadata accessor for CharacterSet();
}

uint64_t static Notification._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Notification.userInfo.getter()
{
  return Notification.userInfo.getter();
}

uint64_t type metadata accessor for Notification()
{
  return type metadata accessor for Notification();
}

uint64_t URLQueryItem.init(name:value:)()
{
  return URLQueryItem.init(name:value:)();
}

uint64_t URLQueryItem.name.getter()
{
  return URLQueryItem.name.getter();
}

uint64_t URLQueryItem.value.getter()
{
  return URLQueryItem.value.getter();
}

uint64_t type metadata accessor for URLQueryItem()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t URLComponents.queryItems.getter()
{
  return URLComponents.queryItems.getter();
}

uint64_t URLComponents.percentEncodedQuery.getter()
{
  return URLComponents.percentEncodedQuery.getter();
}

uint64_t URLComponents.percentEncodedQuery.setter()
{
  return URLComponents.percentEncodedQuery.setter();
}

uint64_t static URLComponents._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URLComponents._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t URLComponents.init(url:resolvingAgainstBaseURL:)()
{
  return URLComponents.init(url:resolvingAgainstBaseURL:)();
}

uint64_t URLComponents.url.getter()
{
  return URLComponents.url.getter();
}

uint64_t URLComponents.path.getter()
{
  return URLComponents.path.getter();
}

uint64_t type metadata accessor for URLComponents()
{
  return type metadata accessor for URLComponents();
}

uint64_t __DataStorage.init(bytes:length:copy:deallocator:offset:)()
{
  return __DataStorage.init(bytes:length:copy:deallocator:offset:)();
}

uint64_t __DataStorage.init(bytes:length:)()
{
  return __DataStorage.init(bytes:length:)();
}

uint64_t __DataStorage._bytes.getter()
{
  return __DataStorage._bytes.getter();
}

uint64_t __DataStorage._length.getter()
{
  return __DataStorage._length.getter();
}

uint64_t __DataStorage._offset.getter()
{
  return __DataStorage._offset.getter();
}

uint64_t type metadata accessor for __DataStorage()
{
  return type metadata accessor for __DataStorage();
}

uint64_t LocalizedError.helpAnchor.getter()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t LocalizedError.failureReason.getter()
{
  return LocalizedError.failureReason.getter();
}

uint64_t LocalizedError.recoverySuggestion.getter()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)()
{
  return dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
}

uint64_t URLResourceValues.creationDate.getter()
{
  return URLResourceValues.creationDate.getter();
}

uint64_t type metadata accessor for URLResourceValues()
{
  return type metadata accessor for URLResourceValues();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t URL.standardizedFileURL.getter()
{
  return URL.standardizedFileURL.getter();
}

uint64_t URL.absoluteString.getter()
{
  return URL.absoluteString.getter();
}

uint64_t URL.resourceValues(forKeys:)()
{
  return URL.resourceValues(forKeys:)();
}

uint64_t URL.lastPathComponent.getter()
{
  return URL.lastPathComponent.getter();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.appendingPathComponent(_:isDirectory:)()
{
  return URL.appendingPathComponent(_:isDirectory:)();
}

uint64_t URL.appendingPathComponent(_:)()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t URL.deletingLastPathComponent()()
{
  return URL.deletingLastPathComponent()();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::String_optional __swiftcall URL.host(percentEncoded:)(Swift::Bool percentEncoded)
{
  uint64_t v1 = URL.host(percentEncoded:)(percentEncoded);
  result.value._object = v2;
  result.value._uint64_t countAndFlagsBits = v1;
  return result;
}

Swift::String __swiftcall URL.path(percentEncoded:)(Swift::Bool percentEncoded)
{
  uint64_t v1 = URL.path(percentEncoded:)(percentEncoded);
  result._object = v2;
  result._uint64_t countAndFlagsBits = v1;
  return result;
}

uint64_t URL.path.getter()
{
  return URL.path.getter();
}

uint64_t URL.scheme.getter()
{
  return URL.scheme.getter();
}

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t Data.InlineData.init(_:)()
{
  return Data.InlineData.init(_:)();
}

Swift::Void __swiftcall Data.LargeSlice.ensureUniqueReference()()
{
}

uint64_t Data.LargeSlice.init(_:)()
{
  return Data.LargeSlice.init(_:)();
}

uint64_t Data.init(contentsOf:options:)()
{
  return Data.init(contentsOf:options:)();
}

uint64_t type metadata accessor for Data.Deallocator()
{
  return type metadata accessor for Data.Deallocator();
}

uint64_t Data.InlineSlice.init(_:)()
{
  return Data.InlineSlice.init(_:)();
}

uint64_t Data.init(bytesNoCopy:count:deallocator:)()
{
  return Data.init(bytesNoCopy:count:deallocator:)();
}

uint64_t Data.init(base64Encoded:options:)()
{
  return Data.init(base64Encoded:options:)();
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return type metadata accessor for Data.RangeReference();
}

uint64_t Data._Representation.replaceSubrange(_:with:count:)()
{
  return Data._Representation.replaceSubrange(_:with:count:)();
}

uint64_t Data._Representation.init(count:)()
{
  return Data._Representation.init(count:)();
}

uint64_t Data._Representation.append(contentsOf:)()
{
  return Data._Representation.append(contentsOf:)();
}

uint64_t Data._Representation.init(_:)()
{
  return Data._Representation.init(_:)();
}

uint64_t Data.withUnsafeBytes<A>(_:)()
{
  return Data.withUnsafeBytes<A>(_:)();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

Swift::String __swiftcall Data.base64EncodedString(options:)(NSDataBase64EncodingOptions options)
{
  uint64_t v1 = Data.base64EncodedString(options:)(options);
  result._object = v2;
  result._uint64_t countAndFlagsBits = v1;
  return result;
}

uint64_t static Data.== infix(_:_:)()
{
  return static Data.== infix(_:_:)();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Data.hash(into:)()
{
  return Data.hash(into:)();
}

uint64_t Data.init(bytes:count:)()
{
  return Data.init(bytes:count:)();
}

uint64_t Data.count.getter()
{
  return Data.count.getter();
}

uint64_t Data.write(to:options:)()
{
  return Data.write(to:options:)();
}

uint64_t Data.append(_:)()
{
  return Data.append(_:)();
}

uint64_t Data.hashValue.getter()
{
  return Data.hashValue.getter();
}

uint64_t Date.init(timeIntervalSinceReferenceDate:)()
{
  return Date.init(timeIntervalSinceReferenceDate:)();
}

uint64_t Date.timeIntervalSinceReferenceDate.getter()
{
  return Date.timeIntervalSinceReferenceDate.getter();
}

uint64_t static Date.distantPast.getter()
{
  return static Date.distantPast.getter();
}

uint64_t Date.init(timeInterval:since:)()
{
  return Date.init(timeInterval:since:)();
}

uint64_t static Date.distantFuture.getter()
{
  return static Date.distantFuture.getter();
}

uint64_t Date.timeIntervalSince(_:)()
{
  return Date.timeIntervalSince(_:)();
}

uint64_t Date.addingTimeInterval(_:)()
{
  return Date.addingTimeInterval(_:)();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t static Date.> infix(_:_:)()
{
  return static Date.> infix(_:_:)();
}

uint64_t static Date.< infix(_:_:)()
{
  return static Date.< infix(_:_:)();
}

uint64_t static Date.- infix(_:_:)()
{
  return static Date.- infix(_:_:)();
}

uint64_t Date.init(timeIntervalSinceNow:)()
{
  return Date.init(timeIntervalSinceNow:)();
}

uint64_t Date.timeIntervalSinceNow.getter()
{
  return Date.timeIntervalSinceNow.getter();
}

uint64_t Date.init(timeIntervalSince1970:)()
{
  return Date.init(timeIntervalSince1970:)();
}

uint64_t Date.timeIntervalSince1970.getter()
{
  return Date.timeIntervalSince1970.getter();
}

uint64_t static Date.== infix(_:_:)()
{
  return static Date.== infix(_:_:)();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static Date.now.getter()
{
  return static Date.now.getter();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t UUID.init(uuidString:)()
{
  return UUID.init(uuidString:)();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

uint64_t UUID.description.getter()
{
  return UUID.description.getter();
}

uint64_t static UUID.== infix(_:_:)()
{
  return static UUID.== infix(_:_:)();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t Locale.identifier.getter()
{
  return Locale.identifier.getter();
}

uint64_t Locale.localizedString(for:)()
{
  return Locale.localizedString(for:)();
}

uint64_t static Locale.MeasurementSystem.uk.getter()
{
  return static Locale.MeasurementSystem.uk.getter();
}

uint64_t static Locale.MeasurementSystem.us.getter()
{
  return static Locale.MeasurementSystem.us.getter();
}

uint64_t static Locale.MeasurementSystem.metric.getter()
{
  return static Locale.MeasurementSystem.metric.getter();
}

uint64_t type metadata accessor for Locale.MeasurementSystem()
{
  return type metadata accessor for Locale.MeasurementSystem();
}

uint64_t Locale.measurementSystem.getter()
{
  return Locale.measurementSystem.getter();
}

uint64_t static Locale.preferredLanguages.getter()
{
  return static Locale.preferredLanguages.getter();
}

NSLocale __swiftcall Locale._bridgeToObjectiveC()()
{
  return (NSLocale)Locale._bridgeToObjectiveC()();
}

uint64_t static Locale._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Locale._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Locale.Region.identifier.getter()
{
  return Locale.Region.identifier.getter();
}

uint64_t type metadata accessor for Locale.Region()
{
  return type metadata accessor for Locale.Region();
}

uint64_t static Locale.current.getter()
{
  return static Locale.current.getter();
}

uint64_t Locale.Language.region.getter()
{
  return Locale.Language.region.getter();
}

uint64_t type metadata accessor for Locale.Language()
{
  return type metadata accessor for Locale.Language();
}

uint64_t Locale.calendar.getter()
{
  return Locale.calendar.getter();
}

uint64_t Locale.language.getter()
{
  return Locale.language.getter();
}

uint64_t type metadata accessor for Locale.HourCycle()
{
  return type metadata accessor for Locale.HourCycle();
}

uint64_t Locale.hourCycle.getter()
{
  return Locale.hourCycle.getter();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

uint64_t type metadata accessor for Calendar.Identifier()
{
  return type metadata accessor for Calendar.Identifier();
}

uint64_t Calendar.identifier.getter()
{
  return Calendar.identifier.getter();
}

uint64_t type metadata accessor for Calendar()
{
  return type metadata accessor for Calendar();
}

uint64_t TimeZone.identifier.getter()
{
  return TimeZone.identifier.getter();
}

uint64_t static TimeZone.current.getter()
{
  return static TimeZone.current.getter();
}

uint64_t type metadata accessor for TimeZone()
{
  return type metadata accessor for TimeZone();
}

uint64_t static URLError.Code.cannotFindHost.getter()
{
  return static URLError.Code.cannotFindHost.getter();
}

uint64_t static URLError.Code.unsupportedURL.getter()
{
  return static URLError.Code.unsupportedURL.getter();
}

uint64_t static URLError.Code.dnsLookupFailed.getter()
{
  return static URLError.Code.dnsLookupFailed.getter();
}

uint64_t static URLError.Code.cannotConnectToHost.getter()
{
  return static URLError.Code.cannotConnectToHost.getter();
}

uint64_t static URLError.Code.resourceUnavailable.getter()
{
  return static URLError.Code.resourceUnavailable.getter();
}

uint64_t static URLError.Code.httpTooManyRedirects.getter()
{
  return static URLError.Code.httpTooManyRedirects.getter();
}

uint64_t static URLError.Code.networkConnectionLost.getter()
{
  return static URLError.Code.networkConnectionLost.getter();
}

uint64_t static URLError.Code.notConnectedToInternet.getter()
{
  return static URLError.Code.notConnectedToInternet.getter();
}

uint64_t static URLError.Code.redirectToNonExistentLocation.getter()
{
  return static URLError.Code.redirectToNonExistentLocation.getter();
}

uint64_t static URLError.Code.badURL.getter()
{
  return static URLError.Code.badURL.getter();
}

uint64_t URLError.Code.init(rawValue:)()
{
  return URLError.Code.init(rawValue:)();
}

uint64_t static URLError.Code.timedOut.getter()
{
  return static URLError.Code.timedOut.getter();
}

uint64_t static URLError.Code.cancelled.getter()
{
  return static URLError.Code.cancelled.getter();
}

uint64_t type metadata accessor for URLError.Code()
{
  return type metadata accessor for URLError.Code();
}

uint64_t type metadata accessor for Apple_Parsec_Search_PegasusQueryContext.HourFormat()
{
  return type metadata accessor for Apple_Parsec_Search_PegasusQueryContext.HourFormat();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.hourFormat.setter()
{
  return Apple_Parsec_Search_PegasusQueryContext.hourFormat.setter();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.storeFront.setter()
{
  return Apple_Parsec_Search_PegasusQueryContext.storeFront.setter();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.countryCode.setter()
{
  return Apple_Parsec_Search_PegasusQueryContext.countryCode.setter();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.deviceModel.setter()
{
  return Apple_Parsec_Search_PegasusQueryContext.deviceModel.setter();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.keyboardIme.setter()
{
  return Apple_Parsec_Search_PegasusQueryContext.keyboardIme.setter();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.searchOptOut.setter()
{
  return Apple_Parsec_Search_PegasusQueryContext.searchOptOut.setter();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.internalBuild.setter()
{
  return Apple_Parsec_Search_PegasusQueryContext.internalBuild.setter();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.longSecretKey.setter()
{
  return Apple_Parsec_Search_PegasusQueryContext.longSecretKey.setter();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.managedDevice.setter()
{
  return Apple_Parsec_Search_PegasusQueryContext.managedDevice.setter();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.subscriptions.setter()
{
  return Apple_Parsec_Search_PegasusQueryContext.subscriptions.setter();
}

uint64_t type metadata accessor for Apple_Parsec_Search_PegasusQueryContext.TemperatureUnit()
{
  return type metadata accessor for Apple_Parsec_Search_PegasusQueryContext.TemperatureUnit();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.marketplaceInfo.setter()
{
  return Apple_Parsec_Search_PegasusQueryContext.marketplaceInfo.setter();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.temperatureUnit.setter()
{
  return Apple_Parsec_Search_PegasusQueryContext.temperatureUnit.setter();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.trialIdentifiers.setter()
{
  return Apple_Parsec_Search_PegasusQueryContext.trialIdentifiers.setter();
}

uint64_t type metadata accessor for Apple_Parsec_Search_PegasusQueryContext.MeasurementSystem()
{
  return type metadata accessor for Apple_Parsec_Search_PegasusQueryContext.MeasurementSystem();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.measurementSystem.setter()
{
  return Apple_Parsec_Search_PegasusQueryContext.measurementSystem.setter();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.encryptedAuthToken.setter()
{
  return Apple_Parsec_Search_PegasusQueryContext.encryptedAuthToken.setter();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.preferredLanguages.setter()
{
  return Apple_Parsec_Search_PegasusQueryContext.preferredLanguages.setter();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.transportationMode.setter()
{
  return Apple_Parsec_Search_PegasusQueryContext.transportationMode.setter();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.installedAppsSignature.setter()
{
  return Apple_Parsec_Search_PegasusQueryContext.installedAppsSignature.setter();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.effectiveSystemLanguage.setter()
{
  return Apple_Parsec_Search_PegasusQueryContext.effectiveSystemLanguage.setter();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.ampBaselineExperimentMetadata.setter()
{
  return Apple_Parsec_Search_PegasusQueryContext.ampBaselineExperimentMetadata.setter();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.sil.setter()
{
  return Apple_Parsec_Search_PegasusQueryContext.sil.setter();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.locale.setter()
{
  return Apple_Parsec_Search_PegasusQueryContext.locale.setter();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.region.setter()
{
  return Apple_Parsec_Search_PegasusQueryContext.region.setter();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.uiScale.setter()
{
  return Apple_Parsec_Search_PegasusQueryContext.uiScale.setter();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.calendar.setter()
{
  return Apple_Parsec_Search_PegasusQueryContext.calendar.setter();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.location.setter()
{
  return Apple_Parsec_Search_PegasusQueryContext.location.setter();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.timeZone.setter()
{
  return Apple_Parsec_Search_PegasusQueryContext.timeZone.setter();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.userGuid.setter()
{
  return Apple_Parsec_Search_PegasusQueryContext.userGuid.setter();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.hsEnabled.setter()
{
  return Apple_Parsec_Search_PegasusQueryContext.hsEnabled.setter();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.seedBuild.setter()
{
  return Apple_Parsec_Search_PegasusQueryContext.seedBuild.setter();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.skuRegion.setter()
{
  return Apple_Parsec_Search_PegasusQueryContext.skuRegion.setter();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.init()()
{
  return Apple_Parsec_Search_PegasusQueryContext.init()();
}

uint64_t type metadata accessor for Apple_Parsec_Search_PegasusQueryContext()
{
  return type metadata accessor for Apple_Parsec_Search_PegasusQueryContext();
}

uint64_t Apple_Parsec_Search_PegasusSearchQuery.query.setter()
{
  return Apple_Parsec_Search_PegasusSearchQuery.query.setter();
}

uint64_t Apple_Parsec_Search_PegasusSearchQuery.init()()
{
  return Apple_Parsec_Search_PegasusSearchQuery.init()();
}

uint64_t type metadata accessor for Apple_Parsec_Search_PegasusSearchQuery()
{
  return type metadata accessor for Apple_Parsec_Search_PegasusSearchQuery();
}

uint64_t type metadata accessor for Apple_Parsec_Search_V2_SearchResponse.StatusCode()
{
  return type metadata accessor for Apple_Parsec_Search_V2_SearchResponse.StatusCode();
}

uint64_t Apple_Parsec_Search_V2_SearchResponse.maxAgeSeconds.getter()
{
  return Apple_Parsec_Search_V2_SearchResponse.maxAgeSeconds.getter();
}

uint64_t Apple_Parsec_Search_V2_SearchResponse.maxAgeSeconds.setter()
{
  return Apple_Parsec_Search_V2_SearchResponse.maxAgeSeconds.setter();
}

uint64_t Apple_Parsec_Search_V2_SearchResponse.completionScore.getter()
{
  return Apple_Parsec_Search_V2_SearchResponse.completionScore.getter();
}

uint64_t Apple_Parsec_Search_V2_SearchResponse.completionScore.setter()
{
  return Apple_Parsec_Search_V2_SearchResponse.completionScore.setter();
}

uint64_t Apple_Parsec_Search_V2_SearchResponse.millisecondDuration.getter()
{
  return Apple_Parsec_Search_V2_SearchResponse.millisecondDuration.getter();
}

uint64_t Apple_Parsec_Search_V2_SearchResponse.millisecondDuration.setter()
{
  return Apple_Parsec_Search_V2_SearchResponse.millisecondDuration.setter();
}

uint64_t Apple_Parsec_Search_V2_SearchResponse.partialClientAddress.getter()
{
  return Apple_Parsec_Search_V2_SearchResponse.partialClientAddress.getter();
}

uint64_t Apple_Parsec_Search_V2_SearchResponse.partialClientAddress.setter()
{
  return Apple_Parsec_Search_V2_SearchResponse.partialClientAddress.setter();
}

uint64_t Apple_Parsec_Search_V2_SearchResponse.query.getter()
{
  return Apple_Parsec_Search_V2_SearchResponse.query.getter();
}

uint64_t Apple_Parsec_Search_V2_SearchResponse.query.setter()
{
  return Apple_Parsec_Search_V2_SearchResponse.query.setter();
}

uint64_t Apple_Parsec_Search_V2_SearchResponse.status.getter()
{
  return Apple_Parsec_Search_V2_SearchResponse.status.getter();
}

uint64_t Apple_Parsec_Search_V2_SearchResponse.status.setter()
{
  return Apple_Parsec_Search_V2_SearchResponse.status.setter();
}

uint64_t Apple_Parsec_Search_V2_SearchResponse.feedback.getter()
{
  return Apple_Parsec_Search_V2_SearchResponse.feedback.getter();
}

uint64_t Apple_Parsec_Search_V2_SearchResponse.feedback.setter()
{
  return Apple_Parsec_Search_V2_SearchResponse.feedback.setter();
}

uint64_t Apple_Parsec_Search_V2_SearchResponse.init()()
{
  return Apple_Parsec_Search_V2_SearchResponse.init()();
}

uint64_t type metadata accessor for Apple_Parsec_Search_V2_SearchResponse()
{
  return type metadata accessor for Apple_Parsec_Search_V2_SearchResponse();
}

uint64_t static Apple_Parsec_Feedback_V2_Feedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_Feedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_Feedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_Feedback();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_FeedbackPayload.OneOf_ContainedFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_FeedbackPayload.OneOf_ContainedFeedback();
}

uint64_t Apple_Parsec_Feedback_V2_FeedbackPayload.endNetworkSearchFeedback.modify()
{
  return Apple_Parsec_Feedback_V2_FeedbackPayload.endNetworkSearchFeedback.modify();
}

uint64_t Apple_Parsec_Feedback_V2_FeedbackPayload.startNetworkSearchFeedback.modify()
{
  return Apple_Parsec_Feedback_V2_FeedbackPayload.startNetworkSearchFeedback.modify();
}

uint64_t Apple_Parsec_Feedback_V2_FeedbackPayload.containedFeedback.getter()
{
  return Apple_Parsec_Feedback_V2_FeedbackPayload.containedFeedback.getter();
}

uint64_t Apple_Parsec_Feedback_V2_FeedbackPayload.queryID.setter()
{
  return Apple_Parsec_Feedback_V2_FeedbackPayload.queryID.setter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_FeedbackPayload()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_FeedbackPayload();
}

uint64_t type metadata accessor for Apple_Parsec_Lookup_V1alpha_LookupSearchRequest()
{
  return type metadata accessor for Apple_Parsec_Lookup_V1alpha_LookupSearchRequest();
}

uint64_t Apple_Parsec_Lookup_V1alpha_LookupSearchResponse.status.getter()
{
  return Apple_Parsec_Lookup_V1alpha_LookupSearchResponse.status.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Lookup_V1alpha_LookupSearchResponse()
{
  return type metadata accessor for Apple_Parsec_Lookup_V1alpha_LookupSearchResponse();
}

uint64_t type metadata accessor for Apple_Parsec_Safari_V1alpha_SafariQueryContext()
{
  return type metadata accessor for Apple_Parsec_Safari_V1alpha_SafariQueryContext();
}

uint64_t type metadata accessor for Apple_Parsec_Safari_V1alpha_SafariSearchRequest()
{
  return type metadata accessor for Apple_Parsec_Safari_V1alpha_SafariSearchRequest();
}

uint64_t Apple_Parsec_Safari_V1alpha_SafariSearchResults.completionScore.getter()
{
  return Apple_Parsec_Safari_V1alpha_SafariSearchResults.completionScore.getter();
}

uint64_t Apple_Parsec_Safari_V1alpha_SafariSearchResults.query.getter()
{
  return Apple_Parsec_Safari_V1alpha_SafariSearchResults.query.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Safari_V1alpha_SafariSearchResults()
{
  return type metadata accessor for Apple_Parsec_Safari_V1alpha_SafariSearchResults();
}

uint64_t Apple_Parsec_Safari_V1alpha_SafariSearchResponse.searchResults.getter()
{
  return Apple_Parsec_Safari_V1alpha_SafariSearchResponse.searchResults.getter();
}

uint64_t Apple_Parsec_Safari_V1alpha_SafariSearchResponse.status.getter()
{
  return Apple_Parsec_Safari_V1alpha_SafariSearchResponse.status.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Safari_V1alpha_SafariSearchResponse()
{
  return type metadata accessor for Apple_Parsec_Safari_V1alpha_SafariSearchResponse();
}

uint64_t static Apple_Parsec_Feedback_V2_ErrorFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_ErrorFeedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_ErrorFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_ErrorFeedback();
}

uint64_t static Apple_Parsec_Feedback_V2_CustomFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_CustomFeedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_CustomFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_CustomFeedback();
}

uint64_t static Apple_Parsec_Feedback_V2_ResultFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_ResultFeedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_ResultFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_ResultFeedback();
}

uint64_t static Apple_Parsec_Feedback_V2_RankingFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_RankingFeedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_RankingFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_RankingFeedback();
}

uint64_t static Apple_Parsec_Feedback_V2_CacheHitFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_CacheHitFeedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_CacheHitFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_CacheHitFeedback();
}

uint64_t static Apple_Parsec_Feedback_V2_EndSearchFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_EndSearchFeedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_EndSearchFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_EndSearchFeedback();
}

uint64_t static Apple_Parsec_Feedback_V2_ClearInputFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_ClearInputFeedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_ClearInputFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_ClearInputFeedback();
}

uint64_t static Apple_Parsec_Feedback_V2_SessionEndFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_SessionEndFeedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_SessionEndFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_SessionEndFeedback();
}

uint64_t static Apple_Parsec_Feedback_V2_SkipSearchFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_SkipSearchFeedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_SkipSearchFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_SkipSearchFeedback();
}

uint64_t static Apple_Parsec_Feedback_V2_CardSectionFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_CardSectionFeedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_CardSectionFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_CardSectionFeedback();
}

uint64_t static Apple_Parsec_Feedback_V2_DidGoToSiteFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_DidGoToSiteFeedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_DidGoToSiteFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_DidGoToSiteFeedback();
}

uint64_t static Apple_Parsec_Feedback_V2_StartSearchFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_StartSearchFeedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_StartSearchFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_StartSearchFeedback();
}

uint64_t static Apple_Parsec_Feedback_V2_ClientTimingFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_ClientTimingFeedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_ClientTimingFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_ClientTimingFeedback();
}

uint64_t static Apple_Parsec_Feedback_V2_CBAEngagementFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_CBAEngagementFeedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_CBAEngagementFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_CBAEngagementFeedback();
}

uint64_t static Apple_Parsec_Feedback_V2_DidGoToSearchFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_DidGoToSearchFeedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_DidGoToSearchFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_DidGoToSearchFeedback();
}

uint64_t static Apple_Parsec_Feedback_V2_ResultGradingFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_ResultGradingFeedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_ResultGradingFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_ResultGradingFeedback();
}

uint64_t static Apple_Parsec_Feedback_V2_ResultRankingFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_ResultRankingFeedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_ResultRankingFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_ResultRankingFeedback();
}

uint64_t static Apple_Parsec_Feedback_V2_CardViewAppearFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_CardViewAppearFeedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_CardViewAppearFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_CardViewAppearFeedback();
}

uint64_t static Apple_Parsec_Feedback_V2_EndLocalSearchFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_EndLocalSearchFeedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_EndLocalSearchFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_EndLocalSearchFeedback();
}

uint64_t static Apple_Parsec_Feedback_V2_SectionRankingFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_SectionRankingFeedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_SectionRankingFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_SectionRankingFeedback();
}

uint64_t static Apple_Parsec_Feedback_V2_VisibleResultsFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_VisibleResultsFeedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_VisibleResultsFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_VisibleResultsFeedback();
}

uint64_t Apple_Parsec_Feedback_V2_EndNetworkSearchFeedback.endpointType.setter()
{
  return Apple_Parsec_Feedback_V2_EndNetworkSearchFeedback.endpointType.setter();
}

uint64_t static Apple_Parsec_Feedback_V2_EndNetworkSearchFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_EndNetworkSearchFeedback.protoMessageName.getter();
}

uint64_t Apple_Parsec_Feedback_V2_EndNetworkSearchFeedback.fbq.setter()
{
  return Apple_Parsec_Feedback_V2_EndNetworkSearchFeedback.fbq.setter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_EndNetworkSearchFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_EndNetworkSearchFeedback();
}

uint64_t static Apple_Parsec_Feedback_V2_ResultEngagementFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_ResultEngagementFeedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_ResultEngagementFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_ResultEngagementFeedback();
}

uint64_t static Apple_Parsec_Feedback_V2_SearchViewAppearFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_SearchViewAppearFeedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_SearchViewAppearFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_SearchViewAppearFeedback();
}

uint64_t static Apple_Parsec_Feedback_V2_StartLocalSearchFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_StartLocalSearchFeedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_StartLocalSearchFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_StartLocalSearchFeedback();
}

uint64_t static Apple_Parsec_Feedback_V2_CardViewDisappearFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_CardViewDisappearFeedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_CardViewDisappearFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_CardViewDisappearFeedback();
}

uint64_t static Apple_Parsec_Feedback_V2_CommandEngagementFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_CommandEngagementFeedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_CommandEngagementFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_CommandEngagementFeedback();
}

uint64_t static Apple_Parsec_Feedback_V2_SectionEngagementFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_SectionEngagementFeedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_SectionEngagementFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_SectionEngagementFeedback();
}

uint64_t Apple_Parsec_Feedback_V2_StartNetworkSearchFeedback.searchType.setter()
{
  return Apple_Parsec_Feedback_V2_StartNetworkSearchFeedback.searchType.setter();
}

uint64_t Apple_Parsec_Feedback_V2_StartNetworkSearchFeedback.triggerEvent.setter()
{
  return Apple_Parsec_Feedback_V2_StartNetworkSearchFeedback.triggerEvent.setter();
}

uint64_t static Apple_Parsec_Feedback_V2_StartNetworkSearchFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_StartNetworkSearchFeedback.protoMessageName.getter();
}

uint64_t Apple_Parsec_Feedback_V2_StartNetworkSearchFeedback.lookupSelectionType.setter()
{
  return Apple_Parsec_Feedback_V2_StartNetworkSearchFeedback.lookupSelectionType.setter();
}

uint64_t Apple_Parsec_Feedback_V2_StartNetworkSearchFeedback.input.setter()
{
  return Apple_Parsec_Feedback_V2_StartNetworkSearchFeedback.input.setter();
}

uint64_t Apple_Parsec_Feedback_V2_StartNetworkSearchFeedback.endpoint.setter()
{
  return Apple_Parsec_Feedback_V2_StartNetworkSearchFeedback.endpoint.setter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_StartNetworkSearchFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_StartNetworkSearchFeedback();
}

uint64_t static Apple_Parsec_Feedback_V2_VisibleSuggestionsFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_VisibleSuggestionsFeedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_VisibleSuggestionsFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_VisibleSuggestionsFeedback();
}

uint64_t static Apple_Parsec_Feedback_V2_ExperimentTriggeredFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_ExperimentTriggeredFeedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_ExperimentTriggeredFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_ExperimentTriggeredFeedback();
}

uint64_t static Apple_Parsec_Feedback_V2_LookupHintRelevancyFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_LookupHintRelevancyFeedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_LookupHintRelevancyFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_LookupHintRelevancyFeedback();
}

uint64_t static Apple_Parsec_Feedback_V2_SearchViewDisappearFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_SearchViewDisappearFeedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_SearchViewDisappearFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_SearchViewDisappearFeedback();
}

uint64_t static Apple_Parsec_Feedback_V2_LateSectionsAppendedFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_LateSectionsAppendedFeedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_LateSectionsAppendedFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_LateSectionsAppendedFeedback();
}

uint64_t static Apple_Parsec_Feedback_V2_SuggestionEngagementFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_SuggestionEngagementFeedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_SuggestionEngagementFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_SuggestionEngagementFeedback();
}

uint64_t static Apple_Parsec_Feedback_V2_VisibleSectionHeaderFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_VisibleSectionHeaderFeedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_VisibleSectionHeaderFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_VisibleSectionHeaderFeedback();
}

uint64_t static Apple_Parsec_Feedback_V2_CardSectionEngagementFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_CardSectionEngagementFeedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_CardSectionEngagementFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_CardSectionEngagementFeedback();
}

uint64_t static Apple_Parsec_Feedback_V2_ConnectionInvalidatedFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_ConnectionInvalidatedFeedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_ConnectionInvalidatedFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_ConnectionInvalidatedFeedback();
}

uint64_t static Apple_Parsec_Feedback_V2_SessionMissingResultsFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_SessionMissingResultsFeedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_SessionMissingResultsFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_SessionMissingResultsFeedback();
}

uint64_t static Apple_Parsec_Feedback_V2_DynamicButtonVisibilityFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_DynamicButtonVisibilityFeedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_DynamicButtonVisibilityFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_DynamicButtonVisibilityFeedback();
}

uint64_t static Apple_Parsec_Feedback_V2_MapsCardSectionEngagementFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_MapsCardSectionEngagementFeedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_MapsCardSectionEngagementFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_MapsCardSectionEngagementFeedback();
}

uint64_t static Apple_Parsec_Feedback_V2_SessionMissingSuggestionsFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_SessionMissingSuggestionsFeedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_SessionMissingSuggestionsFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_SessionMissingSuggestionsFeedback();
}

uint64_t Apple_Parsec_Responseframework_Engagement_V1alpha_EngagementRequest.queryContext.setter()
{
  return Apple_Parsec_Responseframework_Engagement_V1alpha_EngagementRequest.queryContext.setter();
}

uint64_t Apple_Parsec_Responseframework_Engagement_V1alpha_EngagementRequest.requestMetadata.setter()
{
  return Apple_Parsec_Responseframework_Engagement_V1alpha_EngagementRequest.requestMetadata.setter();
}

uint64_t Apple_Parsec_Responseframework_Engagement_V1alpha_EngagementRequest.init()()
{
  return Apple_Parsec_Responseframework_Engagement_V1alpha_EngagementRequest.init()();
}

uint64_t type metadata accessor for Apple_Parsec_Responseframework_Engagement_V1alpha_EngagementRequest()
{
  return type metadata accessor for Apple_Parsec_Responseframework_Engagement_V1alpha_EngagementRequest();
}

uint64_t type metadata accessor for Apple_Parsec_Responseframework_Engagement_V1alpha_EngagementResponse()
{
  return type metadata accessor for Apple_Parsec_Responseframework_Engagement_V1alpha_EngagementResponse();
}

uint64_t static Apple_Parsec_Feedback_V2_StoreCardSectionEngagementFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_StoreCardSectionEngagementFeedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_StoreCardSectionEngagementFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_StoreCardSectionEngagementFeedback();
}

uint64_t static Apple_Parsec_Feedback_V2_ResultsReceivedAfterTimeoutFeedback.protoMessageName.getter()
{
  return static Apple_Parsec_Feedback_V2_ResultsReceivedAfterTimeoutFeedback.protoMessageName.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_ResultsReceivedAfterTimeoutFeedback()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_ResultsReceivedAfterTimeoutFeedback();
}

uint64_t Trialpb_TrialExperiment.treatmentID.getter()
{
  return Trialpb_TrialExperiment.treatmentID.getter();
}

uint64_t Trialpb_TrialExperiment.treatmentID.setter()
{
  return Trialpb_TrialExperiment.treatmentID.setter();
}

uint64_t Trialpb_TrialExperiment.deploymentID.getter()
{
  return Trialpb_TrialExperiment.deploymentID.getter();
}

uint64_t Trialpb_TrialExperiment.deploymentID.setter()
{
  return Trialpb_TrialExperiment.deploymentID.setter();
}

uint64_t Trialpb_TrialExperiment.experimentID.getter()
{
  return Trialpb_TrialExperiment.experimentID.getter();
}

uint64_t Trialpb_TrialExperiment.experimentID.setter()
{
  return Trialpb_TrialExperiment.experimentID.setter();
}

uint64_t Trialpb_TrialExperiment.experimentNamespace.getter()
{
  return Trialpb_TrialExperiment.experimentNamespace.getter();
}

uint64_t Trialpb_TrialExperiment.experimentNamespace.setter()
{
  return Trialpb_TrialExperiment.experimentNamespace.setter();
}

uint64_t Trialpb_TrialExperiment.compatibilityVersion.getter()
{
  return Trialpb_TrialExperiment.compatibilityVersion.getter();
}

uint64_t Trialpb_TrialExperiment.compatibilityVersion.setter()
{
  return Trialpb_TrialExperiment.compatibilityVersion.setter();
}

uint64_t Trialpb_TrialExperiment.init()()
{
  return Trialpb_TrialExperiment.init()();
}

uint64_t type metadata accessor for Trialpb_TrialExperiment()
{
  return type metadata accessor for Trialpb_TrialExperiment();
}

uint64_t Apple_Parsec_Search_V2_Entity.probabilityScore.getter()
{
  return Apple_Parsec_Search_V2_Entity.probabilityScore.getter();
}

uint64_t Apple_Parsec_Search_V2_Entity.name.getter()
{
  return Apple_Parsec_Search_V2_Entity.name.getter();
}

uint64_t Apple_Parsec_Search_V2_Entity.Topic.identifier.getter()
{
  return Apple_Parsec_Search_V2_Entity.Topic.identifier.getter();
}

uint64_t Apple_Parsec_Search_V2_Entity.Topic.score.getter()
{
  return Apple_Parsec_Search_V2_Entity.Topic.score.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Search_V2_Entity.Topic()
{
  return type metadata accessor for Apple_Parsec_Search_V2_Entity.Topic();
}

uint64_t Apple_Parsec_Search_V2_Entity.topics.getter()
{
  return Apple_Parsec_Search_V2_Entity.topics.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Search_V2_Entity.Category()
{
  return type metadata accessor for Apple_Parsec_Search_V2_Entity.Category();
}

uint64_t Apple_Parsec_Search_V2_Entity.category.getter()
{
  return Apple_Parsec_Search_V2_Entity.category.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Search_V2_Entity()
{
  return type metadata accessor for Apple_Parsec_Search_V2_Entity();
}

uint64_t Apple_Parsec_Search_V2_Result.entities.getter()
{
  return Apple_Parsec_Search_V2_Result.entities.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Search_V2_Result()
{
  return type metadata accessor for Apple_Parsec_Search_V2_Result();
}

uint64_t Apple_Parsec_Search_StatusCode.rawValue.getter()
{
  return Apple_Parsec_Search_StatusCode.rawValue.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Search_StatusCode()
{
  return type metadata accessor for Apple_Parsec_Search_StatusCode();
}

uint64_t Apple_Parsec_Search_V2_Location.revGeoResolution.setter()
{
  return Apple_Parsec_Search_V2_Location.revGeoResolution.setter();
}

uint64_t Apple_Parsec_Search_V2_Location.horizontalAccuracy.setter()
{
  return Apple_Parsec_Search_V2_Location.horizontalAccuracy.setter();
}

uint64_t type metadata accessor for Apple_Parsec_Search_V2_Location.Source()
{
  return type metadata accessor for Apple_Parsec_Search_V2_Location.Source();
}

uint64_t Apple_Parsec_Search_V2_Location.source.setter()
{
  return Apple_Parsec_Search_V2_Location.source.setter();
}

uint64_t Apple_Parsec_Search_V2_Location.latitude.setter()
{
  return Apple_Parsec_Search_V2_Location.latitude.setter();
}

uint64_t Apple_Parsec_Search_V2_Location.longitude.setter()
{
  return Apple_Parsec_Search_V2_Location.longitude.setter();
}

uint64_t Apple_Parsec_Search_V2_Location.init()()
{
  return Apple_Parsec_Search_V2_Location.init()();
}

uint64_t type metadata accessor for Apple_Parsec_Search_V2_Location()
{
  return type metadata accessor for Apple_Parsec_Search_V2_Location();
}

uint64_t Searchfoundation_DrillDownMetadata.init()()
{
  return Searchfoundation_DrillDownMetadata.init()();
}

uint64_t type metadata accessor for Searchfoundation_DrillDownMetadata()
{
  return type metadata accessor for Searchfoundation_DrillDownMetadata();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_SearchType()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_SearchType();
}

uint64_t Apple_Parsec_Sba_V1_HashBucketDetail.HashDetail.fullHash.getter()
{
  return Apple_Parsec_Sba_V1_HashBucketDetail.HashDetail.fullHash.getter();
}

uint64_t Apple_Parsec_Sba_V1_HashBucketDetail.HashDetail.matchedURLVariant.setter()
{
  return Apple_Parsec_Sba_V1_HashBucketDetail.HashDetail.matchedURLVariant.setter();
}

uint64_t type metadata accessor for Apple_Parsec_Sba_V1_HashBucketDetail.HashDetail()
{
  return type metadata accessor for Apple_Parsec_Sba_V1_HashBucketDetail.HashDetail();
}

uint64_t Apple_Parsec_Sba_V1_HashBucketDetail.hashPrefix.getter()
{
  return Apple_Parsec_Sba_V1_HashBucketDetail.hashPrefix.getter();
}

uint64_t Apple_Parsec_Sba_V1_HashBucketDetail.hashDetails.getter()
{
  return Apple_Parsec_Sba_V1_HashBucketDetail.hashDetails.getter();
}

uint64_t Apple_Parsec_Sba_V1_HashBucketDetail.hashDetails.setter()
{
  return Apple_Parsec_Sba_V1_HashBucketDetail.hashDetails.setter();
}

uint64_t type metadata accessor for Apple_Parsec_Sba_V1_HashBucketDetail()
{
  return type metadata accessor for Apple_Parsec_Sba_V1_HashBucketDetail();
}

uint64_t Apple_Parsec_Search_V2_Subscriptions.subscriptionJson.setter()
{
  return Apple_Parsec_Search_V2_Subscriptions.subscriptionJson.setter();
}

uint64_t Apple_Parsec_Search_V2_Subscriptions.init()()
{
  return Apple_Parsec_Search_V2_Subscriptions.init()();
}

uint64_t type metadata accessor for Apple_Parsec_Search_V2_Subscriptions()
{
  return type metadata accessor for Apple_Parsec_Search_V2_Subscriptions();
}

uint64_t Apple_Parsec_Spotlight_V1alpha_Topic.FlightDetail.timestamp.setter()
{
  return Apple_Parsec_Spotlight_V1alpha_Topic.FlightDetail.timestamp.setter();
}

uint64_t Apple_Parsec_Spotlight_V1alpha_Topic.FlightDetail.init()()
{
  return Apple_Parsec_Spotlight_V1alpha_Topic.FlightDetail.init()();
}

uint64_t type metadata accessor for Apple_Parsec_Spotlight_V1alpha_Topic.FlightDetail()
{
  return type metadata accessor for Apple_Parsec_Spotlight_V1alpha_Topic.FlightDetail();
}

uint64_t Apple_Parsec_Spotlight_V1alpha_Topic.WeatherDetail.lat.setter()
{
  return Apple_Parsec_Spotlight_V1alpha_Topic.WeatherDetail.lat.setter();
}

uint64_t Apple_Parsec_Spotlight_V1alpha_Topic.WeatherDetail.long.setter()
{
  return Apple_Parsec_Spotlight_V1alpha_Topic.WeatherDetail.long.setter();
}

uint64_t Apple_Parsec_Spotlight_V1alpha_Topic.WeatherDetail.init()()
{
  return Apple_Parsec_Spotlight_V1alpha_Topic.WeatherDetail.init()();
}

uint64_t type metadata accessor for Apple_Parsec_Spotlight_V1alpha_Topic.WeatherDetail()
{
  return type metadata accessor for Apple_Parsec_Spotlight_V1alpha_Topic.WeatherDetail();
}

uint64_t Apple_Parsec_Spotlight_V1alpha_Topic.id.setter()
{
  return Apple_Parsec_Spotlight_V1alpha_Topic.id.setter();
}

uint64_t Apple_Parsec_Spotlight_V1alpha_Topic.type.setter()
{
  return Apple_Parsec_Spotlight_V1alpha_Topic.type.setter();
}

uint64_t Apple_Parsec_Spotlight_V1alpha_Topic.query.setter()
{
  return Apple_Parsec_Spotlight_V1alpha_Topic.query.setter();
}

uint64_t Apple_Parsec_Spotlight_V1alpha_Topic.flight.setter()
{
  return Apple_Parsec_Spotlight_V1alpha_Topic.flight.setter();
}

uint64_t Apple_Parsec_Spotlight_V1alpha_Topic.weather.setter()
{
  return Apple_Parsec_Spotlight_V1alpha_Topic.weather.setter();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_EndpointType()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_EndpointType();
}

uint64_t Apple_Parsec_Spotlight_V1alpha_Result.identifier.getter()
{
  return Apple_Parsec_Spotlight_V1alpha_Result.identifier.getter();
}

uint64_t Apple_Parsec_Spotlight_V1alpha_Result.maxAgeSeconds.getter()
{
  return Apple_Parsec_Spotlight_V1alpha_Result.maxAgeSeconds.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Spotlight_V1alpha_Result()
{
  return type metadata accessor for Apple_Parsec_Spotlight_V1alpha_Result();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_ClientSession()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_ClientSession();
}

uint64_t Apple_Parsec_Search_V2_MarketplaceInfo.isMarketplaceEligible.setter()
{
  return Apple_Parsec_Search_V2_MarketplaceInfo.isMarketplaceEligible.setter();
}

uint64_t Apple_Parsec_Search_V2_MarketplaceInfo.Marketplace.id.setter()
{
  return Apple_Parsec_Search_V2_MarketplaceInfo.Marketplace.id.setter();
}

uint64_t Apple_Parsec_Search_V2_MarketplaceInfo.Marketplace.territory.setter()
{
  return Apple_Parsec_Search_V2_MarketplaceInfo.Marketplace.territory.setter();
}

uint64_t Apple_Parsec_Search_V2_MarketplaceInfo.Marketplace.init()()
{
  return Apple_Parsec_Search_V2_MarketplaceInfo.Marketplace.init()();
}

uint64_t type metadata accessor for Apple_Parsec_Search_V2_MarketplaceInfo.Marketplace()
{
  return type metadata accessor for Apple_Parsec_Search_V2_MarketplaceInfo.Marketplace();
}

uint64_t Apple_Parsec_Search_V2_MarketplaceInfo.supportedMarketplaces.setter()
{
  return Apple_Parsec_Search_V2_MarketplaceInfo.supportedMarketplaces.setter();
}

uint64_t Apple_Parsec_Search_V2_MarketplaceInfo.init()()
{
  return Apple_Parsec_Search_V2_MarketplaceInfo.init()();
}

uint64_t type metadata accessor for Apple_Parsec_Search_V2_MarketplaceInfo()
{
  return type metadata accessor for Apple_Parsec_Search_V2_MarketplaceInfo();
}

uint64_t Apple_Parsec_Search_LocalCompletionInfo.completions.getter()
{
  return Apple_Parsec_Search_LocalCompletionInfo.completions.getter();
}

uint64_t Apple_Parsec_Search_LocalCompletionInfo.completions.setter()
{
  return Apple_Parsec_Search_LocalCompletionInfo.completions.setter();
}

uint64_t Apple_Parsec_Search_LocalCompletionInfo.scores.getter()
{
  return Apple_Parsec_Search_LocalCompletionInfo.scores.getter();
}

uint64_t Apple_Parsec_Search_LocalCompletionInfo.scores.setter()
{
  return Apple_Parsec_Search_LocalCompletionInfo.scores.setter();
}

uint64_t Apple_Parsec_Search_LocalCompletionInfo.origins.getter()
{
  return Apple_Parsec_Search_LocalCompletionInfo.origins.getter();
}

uint64_t Apple_Parsec_Search_LocalCompletionInfo.origins.setter()
{
  return Apple_Parsec_Search_LocalCompletionInfo.origins.setter();
}

uint64_t Apple_Parsec_Search_LocalCompletionInfo.init()()
{
  return Apple_Parsec_Search_LocalCompletionInfo.init()();
}

uint64_t type metadata accessor for Apple_Parsec_Search_LocalCompletionInfo()
{
  return type metadata accessor for Apple_Parsec_Search_LocalCompletionInfo();
}

uint64_t Apple_Parsec_Search_V2_RevGeoResolution.administrativeArea.setter()
{
  return Apple_Parsec_Search_V2_RevGeoResolution.administrativeArea.setter();
}

uint64_t Apple_Parsec_Search_V2_RevGeoResolution.formattedAddressLines.setter()
{
  return Apple_Parsec_Search_V2_RevGeoResolution.formattedAddressLines.setter();
}

uint64_t Apple_Parsec_Search_V2_RevGeoResolution.subAdministrativeArea.setter()
{
  return Apple_Parsec_Search_V2_RevGeoResolution.subAdministrativeArea.setter();
}

uint64_t Apple_Parsec_Search_V2_RevGeoResolution.country.setter()
{
  return Apple_Parsec_Search_V2_RevGeoResolution.country.setter();
}

uint64_t Apple_Parsec_Search_V2_RevGeoResolution.locality.setter()
{
  return Apple_Parsec_Search_V2_RevGeoResolution.locality.setter();
}

uint64_t Apple_Parsec_Search_V2_RevGeoResolution.init()()
{
  return Apple_Parsec_Search_V2_RevGeoResolution.init()();
}

uint64_t type metadata accessor for Apple_Parsec_Search_V2_RevGeoResolution()
{
  return type metadata accessor for Apple_Parsec_Search_V2_RevGeoResolution();
}

uint64_t type metadata accessor for Apple_Parsec_Spotlight_V1alpha_TopicType()
{
  return type metadata accessor for Apple_Parsec_Spotlight_V1alpha_TopicType();
}

uint64_t type metadata accessor for Apple_Parsec_Search_V2_TransportationMode()
{
  return type metadata accessor for Apple_Parsec_Search_V2_TransportationMode();
}

uint64_t Apple_Parsec_Spotlight_V1alpha_TopicContext.contextID.setter()
{
  return Apple_Parsec_Spotlight_V1alpha_TopicContext.contextID.setter();
}

uint64_t Apple_Parsec_Spotlight_V1alpha_TopicContext.init()()
{
  return Apple_Parsec_Spotlight_V1alpha_TopicContext.init()();
}

uint64_t type metadata accessor for Apple_Parsec_Spotlight_V1alpha_TopicContext()
{
  return type metadata accessor for Apple_Parsec_Spotlight_V1alpha_TopicContext();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_LookupSelectionType()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_LookupSelectionType();
}

uint64_t Apple_Parsec_Spotlight_V1alpha_ZkwSuggestRequest.queryContext.setter()
{
  return Apple_Parsec_Spotlight_V1alpha_ZkwSuggestRequest.queryContext.setter();
}

uint64_t Apple_Parsec_Spotlight_V1alpha_ZkwSuggestRequest.topics.setter()
{
  return Apple_Parsec_Spotlight_V1alpha_ZkwSuggestRequest.topics.setter();
}

uint64_t Apple_Parsec_Spotlight_V1alpha_ZkwSuggestRequest.init()()
{
  return Apple_Parsec_Spotlight_V1alpha_ZkwSuggestRequest.init()();
}

uint64_t type metadata accessor for Apple_Parsec_Spotlight_V1alpha_ZkwSuggestRequest()
{
  return type metadata accessor for Apple_Parsec_Spotlight_V1alpha_ZkwSuggestRequest();
}

uint64_t Apple_Parsec_Spotlight_V1alpha_ZkwSuggestResponse.Section.resultIdentifiers.modify()
{
  return Apple_Parsec_Spotlight_V1alpha_ZkwSuggestResponse.Section.resultIdentifiers.modify();
}

uint64_t Apple_Parsec_Spotlight_V1alpha_ZkwSuggestResponse.Section.resultIdentifiers.getter()
{
  return Apple_Parsec_Spotlight_V1alpha_ZkwSuggestResponse.Section.resultIdentifiers.getter();
}

uint64_t Apple_Parsec_Spotlight_V1alpha_ZkwSuggestResponse.Section.contextID.setter()
{
  return Apple_Parsec_Spotlight_V1alpha_ZkwSuggestResponse.Section.contextID.setter();
}

uint64_t Apple_Parsec_Spotlight_V1alpha_ZkwSuggestResponse.Section.init()()
{
  return Apple_Parsec_Spotlight_V1alpha_ZkwSuggestResponse.Section.init()();
}

uint64_t type metadata accessor for Apple_Parsec_Spotlight_V1alpha_ZkwSuggestResponse.Section()
{
  return type metadata accessor for Apple_Parsec_Spotlight_V1alpha_ZkwSuggestResponse.Section();
}

uint64_t Apple_Parsec_Spotlight_V1alpha_ZkwSuggestResponse.results.modify()
{
  return Apple_Parsec_Spotlight_V1alpha_ZkwSuggestResponse.results.modify();
}

uint64_t Apple_Parsec_Spotlight_V1alpha_ZkwSuggestResponse.results.getter()
{
  return Apple_Parsec_Spotlight_V1alpha_ZkwSuggestResponse.results.getter();
}

uint64_t Apple_Parsec_Spotlight_V1alpha_ZkwSuggestResponse.sections.modify()
{
  return Apple_Parsec_Spotlight_V1alpha_ZkwSuggestResponse.sections.modify();
}

uint64_t Apple_Parsec_Spotlight_V1alpha_ZkwSuggestResponse.sections.getter()
{
  return Apple_Parsec_Spotlight_V1alpha_ZkwSuggestResponse.sections.getter();
}

uint64_t Apple_Parsec_Spotlight_V1alpha_ZkwSuggestResponse.init()()
{
  return Apple_Parsec_Spotlight_V1alpha_ZkwSuggestResponse.init()();
}

uint64_t type metadata accessor for Apple_Parsec_Spotlight_V1alpha_ZkwSuggestResponse()
{
  return type metadata accessor for Apple_Parsec_Spotlight_V1alpha_ZkwSuggestResponse();
}

uint64_t Apple_Parsec_Feedback_V2_TriggerSearchRequestEvent.init(rawValue:)()
{
  return Apple_Parsec_Feedback_V2_TriggerSearchRequestEvent.init(rawValue:)();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_TriggerSearchRequestEvent()
{
  return type metadata accessor for Apple_Parsec_Feedback_V2_TriggerSearchRequestEvent();
}

uint64_t Apple_Parsec_Sba_V1_SafariAssistantPrefetchRequest.hashPrefix.getter()
{
  return Apple_Parsec_Sba_V1_SafariAssistantPrefetchRequest.hashPrefix.getter();
}

uint64_t Apple_Parsec_Sba_V1_SafariAssistantPrefetchRequest.queryContext.setter()
{
  return Apple_Parsec_Sba_V1_SafariAssistantPrefetchRequest.queryContext.setter();
}

uint64_t type metadata accessor for Apple_Parsec_Sba_V1_SafariAssistantPrefetchRequest()
{
  return type metadata accessor for Apple_Parsec_Sba_V1_SafariAssistantPrefetchRequest();
}

uint64_t Apple_Parsec_Sba_V1_SafariAssistantPrefetchResponse.hashBuckets.getter()
{
  return Apple_Parsec_Sba_V1_SafariAssistantPrefetchResponse.hashBuckets.getter();
}

uint64_t Apple_Parsec_Sba_V1_SafariAssistantPrefetchResponse.hashBuckets.setter()
{
  return Apple_Parsec_Sba_V1_SafariAssistantPrefetchResponse.hashBuckets.setter();
}

uint64_t type metadata accessor for Apple_Parsec_Sba_V1_SafariAssistantPrefetchResponse()
{
  return type metadata accessor for Apple_Parsec_Sba_V1_SafariAssistantPrefetchResponse();
}

uint64_t Apple_Parsec_Sba_V1_SafariAssistantSummarizeRequest.queryContext.setter()
{
  return Apple_Parsec_Sba_V1_SafariAssistantSummarizeRequest.queryContext.setter();
}

uint64_t type metadata accessor for Apple_Parsec_Sba_V1_SafariAssistantSummarizeRequest()
{
  return type metadata accessor for Apple_Parsec_Sba_V1_SafariAssistantSummarizeRequest();
}

uint64_t type metadata accessor for Apple_Parsec_Sba_V1_SafariAssistantSummarizeResponse()
{
  return type metadata accessor for Apple_Parsec_Sba_V1_SafariAssistantSummarizeResponse();
}

uint64_t dispatch thunk of BasePegasusProxy.feedbackEventStream.getter()
{
  return dispatch thunk of BasePegasusProxy.feedbackEventStream.getter();
}

uint64_t dispatch thunk of BasePegasusProxy.warmUpConnectionIfNeeded()()
{
  return dispatch thunk of BasePegasusProxy.warmUpConnectionIfNeeded()();
}

uint64_t dispatch thunk of PegasusProxyForEngagement.searchResponsePublisher(forSearchRequestWithQueryContext:)()
{
  return dispatch thunk of PegasusProxyForEngagement.searchResponsePublisher(forSearchRequestWithQueryContext:)();
}

uint64_t type metadata accessor for PegasusProxyForEngagement.Error()
{
  return type metadata accessor for PegasusProxyForEngagement.Error();
}

uint64_t PegasusProxyForEngagement.init(bagData:urlSession:client:)()
{
  return PegasusProxyForEngagement.init(bagData:urlSession:client:)();
}

uint64_t type metadata accessor for PegasusProxyForEngagement()
{
  return type metadata accessor for PegasusProxyForEngagement();
}

uint64_t dispatch thunk of PegasusProxyForLookupSearch.createRequest(_:context:)()
{
  return dispatch thunk of PegasusProxyForLookupSearch.createRequest(_:context:)();
}

uint64_t PegasusProxyForLookupSearch.init(bagData:urlSession:)()
{
  return PegasusProxyForLookupSearch.init(bagData:urlSession:)();
}

uint64_t type metadata accessor for PegasusProxyForLookupSearch()
{
  return type metadata accessor for PegasusProxyForLookupSearch();
}

uint64_t dispatch thunk of PegasusProxyForSafariSearch.createSafariQueryContext(previousQuery:suggestQuery:localCompletions:)()
{
  return dispatch thunk of PegasusProxyForSafariSearch.createSafariQueryContext(previousQuery:suggestQuery:localCompletions:)();
}

uint64_t dispatch thunk of PegasusProxyForSafariSearch.createRequest(_:context:safariContext:)()
{
  return dispatch thunk of PegasusProxyForSafariSearch.createRequest(_:context:safariContext:)();
}

uint64_t PegasusProxyForSafariSearch.init(bagData:urlSession:)()
{
  return PegasusProxyForSafariSearch.init(bagData:urlSession:)();
}

uint64_t type metadata accessor for PegasusProxyForSafariSearch()
{
  return type metadata accessor for PegasusProxyForSafariSearch();
}

uint64_t dispatch thunk of PegasusProxyForSpotlightZKW.searchResponsePublisher(forSearchRequest:withTimeout:onQueue:responseAfterTimeoutHandler:)()
{
  return dispatch thunk of PegasusProxyForSpotlightZKW.searchResponsePublisher(forSearchRequest:withTimeout:onQueue:responseAfterTimeoutHandler:)();
}

uint64_t static PegasusProxyForSpotlightZKW.Error.== infix(_:_:)()
{
  return static PegasusProxyForSpotlightZKW.Error.== infix(_:_:)();
}

uint64_t type metadata accessor for PegasusProxyForSpotlightZKW.Error()
{
  return type metadata accessor for PegasusProxyForSpotlightZKW.Error();
}

uint64_t PegasusProxyForSpotlightZKW.init(bagData:urlSession:)()
{
  return PegasusProxyForSpotlightZKW.init(bagData:urlSession:)();
}

uint64_t type metadata accessor for PegasusProxyForSpotlightZKW()
{
  return type metadata accessor for PegasusProxyForSpotlightZKW();
}

uint64_t dispatch thunk of PegasusProxyForSafariAssistant.createPrefetchRequest(url:localeString:)()
{
  return dispatch thunk of PegasusProxyForSafariAssistant.createPrefetchRequest(url:localeString:)();
}

uint64_t dispatch thunk of PegasusProxyForSafariAssistant.createSummarizeRequest(urlString:)()
{
  return dispatch thunk of PegasusProxyForSafariAssistant.createSummarizeRequest(urlString:)();
}

uint64_t PegasusProxyForSafariAssistant.init(bagData:urlSession:)()
{
  return PegasusProxyForSafariAssistant.init(bagData:urlSession:)();
}

uint64_t type metadata accessor for PegasusProxyForSafariAssistant()
{
  return type metadata accessor for PegasusProxyForSafariAssistant();
}

uint64_t type metadata accessor for ProxyError()
{
  return type metadata accessor for ProxyError();
}

uint64_t isFeatureEnabled(_:)()
{
  return isFeatureEnabled(_:)();
}

uint64_t type metadata accessor for AppLibrary()
{
  return type metadata accessor for AppLibrary();
}

uint64_t static AppDistributor.AppDistributorsOrTrustedDevelopersChangedNotification.getter()
{
  return static AppDistributor.AppDistributorsOrTrustedDevelopersChangedNotification.getter();
}

uint64_t Regex.init(_regexString:version:)()
{
  return Regex.init(_regexString:version:)();
}

uint64_t dispatch thunk of PegasusKeyValueStore.setInteger(_:for:)()
{
  return dispatch thunk of PegasusKeyValueStore.setInteger(_:for:)();
}

uint64_t dispatch thunk of PegasusKeyValueStore.string(for:)()
{
  return dispatch thunk of PegasusKeyValueStore.string(for:)();
}

uint64_t dispatch thunk of PegasusKeyValueStore.integer(for:)()
{
  return dispatch thunk of PegasusKeyValueStore.integer(for:)();
}

uint64_t dispatch thunk of PegasusKeyValueStore.setString(_:for:)()
{
  return dispatch thunk of PegasusKeyValueStore.setString(_:for:)();
}

uint64_t static PegasusKeyValueStoreFactory.deviceInfoStore(context:name:requiresAuthentication:)()
{
  return static PegasusKeyValueStoreFactory.deviceInfoStore(context:name:requiresAuthentication:)();
}

uint64_t PegasusPersistenceContext.init(location:fileManager:)()
{
  return PegasusPersistenceContext.init(location:fileManager:)();
}

uint64_t type metadata accessor for PegasusPersistenceContext()
{
  return type metadata accessor for PegasusPersistenceContext();
}

uint64_t PegasusClientName.init(rawValue:)()
{
  return PegasusClientName.init(rawValue:)();
}

uint64_t PegasusClientName.rawValue.getter()
{
  return PegasusClientName.rawValue.getter();
}

uint64_t type metadata accessor for PegasusClientName()
{
  return type metadata accessor for PegasusClientName();
}

uint64_t static PegasusConfigContainerURLProvider.containerURL<A>(using:)()
{
  return static PegasusConfigContainerURLProvider.containerURL<A>(using:)();
}

uint64_t static PegasusConfigContainerURLProvider.configFileName.getter()
{
  return static PegasusConfigContainerURLProvider.configFileName.getter();
}

uint64_t static ConfigurationContext.regionCode.getter()
{
  return static ConfigurationContext.regionCode.getter();
}

uint64_t static ConfigurationContext.modelNumber.getter()
{
  return static ConfigurationContext.modelNumber.getter();
}

uint64_t ConfigurationManager.configAccessProvider.getter()
{
  return ConfigurationManager.configAccessProvider.getter();
}

uint64_t ConfigurationManager.init(defaults:context:configFactory:urlDataSource:delegate:)()
{
  return ConfigurationManager.init(defaults:context:configFactory:urlDataSource:delegate:)();
}

uint64_t type metadata accessor for ConfigurationManager()
{
  return type metadata accessor for ConfigurationManager();
}

uint64_t ClientType.rawValue.getter()
{
  return ClientType.rawValue.getter();
}

uint64_t ParsecKeys.oldSecretKey.getter()
{
  return ParsecKeys.oldSecretKey.getter();
}

uint64_t ParsecKeys.encryptedToken.getter()
{
  return ParsecKeys.encryptedToken.getter();
}

uint64_t static ParsecKeys.shared.getter()
{
  return static ParsecKeys.shared.getter();
}

uint64_t type metadata accessor for ParsecKeys()
{
  return type metadata accessor for ParsecKeys();
}

uint64_t SessionType.clientType.getter()
{
  return SessionType.clientType.getter();
}

uint64_t SessionType.description.getter()
{
  return SessionType.description.getter();
}

uint64_t SessionType.canonicalIdentifier.getter()
{
  return SessionType.canonicalIdentifier.getter();
}

uint64_t SessionType.init(withClientIdentifier:)()
{
  return SessionType.init(withClientIdentifier:)();
}

uint64_t SessionType.biomeStreamDescriptor.getter()
{
  return SessionType.biomeStreamDescriptor.getter();
}

uint64_t SessionType.init(withCanonicalIdentifier:)()
{
  return SessionType.init(withCanonicalIdentifier:)();
}

uint64_t static SessionType.== infix(_:_:)()
{
  return static SessionType.== infix(_:_:)();
}

uint64_t type metadata accessor for SessionType()
{
  return type metadata accessor for SessionType();
}

uint64_t LocalCachePaths.init(standard:legacy:)()
{
  return LocalCachePaths.init(standard:legacy:)();
}

uint64_t parsecdUserAgent.getter()
{
  return parsecdUserAgent.getter();
}

uint64_t BiomeStreamConfig.storeConfig.getter()
{
  return BiomeStreamConfig.storeConfig.getter();
}

uint64_t BiomeStreamConfig.messageSchemaName.getter()
{
  return BiomeStreamConfig.messageSchemaName.getter();
}

uint64_t BiomeStreamConfig.tableName.getter()
{
  return BiomeStreamConfig.tableName.getter();
}

uint64_t type metadata accessor for BiomeStreamConfig()
{
  return type metadata accessor for BiomeStreamConfig();
}

uint64_t static DeviceContextUtil.localeIdentifier()()
{
  return static DeviceContextUtil.localeIdentifier()();
}

uint64_t static DeviceContextUtil.deviceCountryCode()()
{
  return static DeviceContextUtil.deviceCountryCode()();
}

uint64_t static DeviceContextUtil.topPreferredLanguages()()
{
  return static DeviceContextUtil.topPreferredLanguages()();
}

uint64_t static DeviceContextUtil.effectiveSystemLanguage()()
{
  return static DeviceContextUtil.effectiveSystemLanguage()();
}

uint64_t static DeviceContextUtil.region.getter()
{
  return static DeviceContextUtil.region.getter();
}

uint64_t FeedbackStoreConfig.getConfig(forStream:)()
{
  return FeedbackStoreConfig.getConfig(forStream:)();
}

uint64_t FeedbackStoreConfig.init(fileManager:streams:)()
{
  return FeedbackStoreConfig.init(fileManager:streams:)();
}

uint64_t type metadata accessor for FeedbackStoreConfig()
{
  return type metadata accessor for FeedbackStoreConfig();
}

uint64_t URLDataSourceOutput.timingInfo.getter()
{
  return URLDataSourceOutput.timingInfo.getter();
}

uint64_t URLDataSourceOutput.data.getter()
{
  return URLDataSourceOutput.data.getter();
}

uint64_t URLDataSourceOutput.response.getter()
{
  return URLDataSourceOutput.response.getter();
}

uint64_t dispatch thunk of ConfigAccessProvider.currentConfig.getter()
{
  return dispatch thunk of ConfigAccessProvider.currentConfig.getter();
}

uint64_t dispatch thunk of ConfigAccessProvider.hasPendingTasks.getter()
{
  return dispatch thunk of ConfigAccessProvider.hasPendingTasks.getter();
}

uint64_t FeedbackStreamDescriptor.rawValue.getter()
{
  return FeedbackStreamDescriptor.rawValue.getter();
}

uint64_t FeedbackStreamDescriptor.init(tableName:)()
{
  return FeedbackStreamDescriptor.init(tableName:)();
}

uint64_t FeedbackStreamDescriptor.tableName.getter()
{
  return FeedbackStreamDescriptor.tableName.getter();
}

uint64_t type metadata accessor for FeedbackStreamDescriptor()
{
  return type metadata accessor for FeedbackStreamDescriptor();
}

uint64_t type metadata accessor for ShouldThrottleConfigFetchResult()
{
  return type metadata accessor for ShouldThrottleConfigFetchResult();
}

uint64_t type metadata accessor for ShouldThrottleConfigFetchResultReason()
{
  return type metadata accessor for ShouldThrottleConfigFetchResultReason();
}

uint64_t static Client.unknownClientName.getter()
{
  return static Client.unknownClientName.getter();
}

uint64_t Client.name.getter()
{
  return Client.name.getter();
}

uint64_t Client.type.getter()
{
  return Client.type.getter();
}

uint64_t static Client.parsecd.getter()
{
  return static Client.parsecd.getter();
}

uint64_t static Client.unknown.getter()
{
  return static Client.unknown.getter();
}

uint64_t type metadata accessor for Client()
{
  return type metadata accessor for Client();
}

uint64_t Client.init(_:)()
{
  return Client.init(_:)();
}

{
  return Client.init(_:)();
}

{
  return Client.init(_:)();
}

uint64_t Config.isDefault.getter()
{
  return Config.isDefault.getter();
}

uint64_t type metadata accessor for Requestor()
{
  return type metadata accessor for Requestor();
}

uint64_t UserAgent.fullString.getter()
{
  return UserAgent.fullString.getter();
}

uint64_t UserAgent.client.getter()
{
  return UserAgent.client.getter();
}

uint64_t type metadata accessor for UserAgent()
{
  return type metadata accessor for UserAgent();
}

uint64_t UserAgent.init(_:requestor:)()
{
  return UserAgent.init(_:requestor:)();
}

{
  return UserAgent.init(_:requestor:)();
}

{
  return UserAgent.init(_:requestor:)();
}

uint64_t Google_Protobuf_DoubleValue.value.getter()
{
  return Google_Protobuf_DoubleValue.value.getter();
}

uint64_t type metadata accessor for Google_Protobuf_DoubleValue()
{
  return type metadata accessor for Google_Protobuf_DoubleValue();
}

uint64_t type metadata accessor for BinaryEncodingError()
{
  return type metadata accessor for BinaryEncodingError();
}

uint64_t JSONDecodingOptions.init()()
{
  return JSONDecodingOptions.init()();
}

uint64_t type metadata accessor for JSONDecodingOptions()
{
  return type metadata accessor for JSONDecodingOptions();
}

uint64_t JSONEncodingOptions.init()()
{
  return JSONEncodingOptions.init()();
}

uint64_t type metadata accessor for JSONEncodingOptions()
{
  return type metadata accessor for JSONEncodingOptions();
}

uint64_t BinaryDecodingOptions.init()()
{
  return BinaryDecodingOptions.init()();
}

uint64_t type metadata accessor for BinaryDecodingOptions()
{
  return type metadata accessor for BinaryDecodingOptions();
}

uint64_t Message.jsonString(options:)()
{
  return Message.jsonString(options:)();
}

uint64_t Message.init(jsonUTF8Data:options:)()
{
  return Message.init(jsonUTF8Data:options:)();
}

uint64_t Message.init(serializedData:extensions:partial:options:)()
{
  return Message.init(serializedData:extensions:partial:options:)();
}

uint64_t Message.serializedData(partial:)()
{
  return Message.serializedData(partial:)();
}

uint64_t os_log(_:dso:log:type:_:)()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t os_signpost(_:dso:log:name:signpostID:_:_:)()
{
  return os_signpost(_:dso:log:name:signpostID:_:_:)();
}

uint64_t os_signpost(_:dso:log:name:signpostID:)()
{
  return os_signpost(_:dso:log:name:signpostID:)();
}

uint64_t OSSignpostID.init(log:object:)()
{
  return OSSignpostID.init(log:object:)();
}

uint64_t OSSignpostID.init(log:)()
{
  return OSSignpostID.init(log:)();
}

uint64_t static OSSignpostID.exclusive.getter()
{
  return static OSSignpostID.exclusive.getter();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t Logger.init()()
{
  return Logger.init()();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t errno.getter()
{
  return errno.getter();
}

uint64_t noErr.getter()
{
  return noErr.getter();
}

uint64_t SIG_IGN.getter()
{
  return SIG_IGN.getter();
}

uint64_t Publishers.Map.tryMap<A>(_:)()
{
  return Publishers.Map.tryMap<A>(_:)();
}

uint64_t Publishers.TryMap.tryMap<A>(_:)()
{
  return Publishers.TryMap.tryMap<A>(_:)();
}

Swift::Void __swiftcall AnyCancellable.cancel()()
{
}

uint64_t type metadata accessor for AnyCancellable()
{
  return type metadata accessor for AnyCancellable();
}

uint64_t Just.init(_:)()
{
  return Just.init(_:)();
}

uint64_t Future.init(_:)()
{
  return Future.init(_:)();
}

uint64_t Deferred.init(createPublisher:)()
{
  return Deferred.init(createPublisher:)();
}

uint64_t Publisher.eraseToAnyPublisher()()
{
  return Publisher.eraseToAnyPublisher()();
}

uint64_t Publisher.map<A>(_:)()
{
  return Publisher.map<A>(_:)();
}

uint64_t Publisher.sink(receiveCompletion:receiveValue:)()
{
  return Publisher.sink(receiveCompletion:receiveValue:)();
}

uint64_t Publisher.catch<A>(_:)()
{
  return Publisher.catch<A>(_:)();
}

uint64_t Publisher.mapError<A>(_:)()
{
  return Publisher.mapError<A>(_:)();
}

uint64_t Publisher<>.sink(receiveValue:)()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t type metadata accessor for DispatchTimeInterval()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t static DispatchTimeoutResult.== infix(_:_:)()
{
  return static DispatchTimeoutResult.== infix(_:_:)();
}

uint64_t static DispatchWorkItemFlags.assignCurrentContext.getter()
{
  return static DispatchWorkItemFlags.assignCurrentContext.getter();
}

uint64_t static DispatchWorkItemFlags.barrier.getter()
{
  return static DispatchWorkItemFlags.barrier.getter();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t type metadata accessor for DispatchQoS.QoSClass()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t static DispatchQoS.background.getter()
{
  return static DispatchQoS.background.getter();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t static DispatchQoS.userInitiated.getter()
{
  return static DispatchQoS.userInitiated.getter();
}

uint64_t static DispatchQoS.userInteractive.getter()
{
  return static DispatchQoS.userInteractive.getter();
}

uint64_t static DispatchQoS.default.getter()
{
  return static DispatchQoS.default.getter();
}

uint64_t static DispatchQoS.utility.getter()
{
  return static DispatchQoS.utility.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t DispatchTime.init(uptimeNanoseconds:)()
{
  return DispatchTime.init(uptimeNanoseconds:)();
}

uint64_t DispatchTime.uptimeNanoseconds.getter()
{
  return DispatchTime.uptimeNanoseconds.getter();
}

uint64_t static DispatchTime.now()()
{
  return static DispatchTime.now()();
}

uint64_t type metadata accessor for DispatchTime()
{
  return type metadata accessor for DispatchTime();
}

uint64_t DispatchWorkItem.init(flags:block:)()
{
  return DispatchWorkItem.init(flags:block:)();
}

uint64_t type metadata accessor for DispatchWorkItem()
{
  return type metadata accessor for DispatchWorkItem();
}

uint64_t type metadata accessor for DispatchPredicate()
{
  return type metadata accessor for DispatchPredicate();
}

uint64_t + infix(_:_:)()
{
  return + infix(_:_:)();
}

uint64_t _dispatchPreconditionTest(_:)()
{
  return _dispatchPreconditionTest(_:)();
}

uint64_t dispatch thunk of HashFunction.update(bufferPointer:)()
{
  return dispatch thunk of HashFunction.update(bufferPointer:)();
}

uint64_t dispatch thunk of HashFunction.finalize()()
{
  return dispatch thunk of HashFunction.finalize()();
}

uint64_t dispatch thunk of HashFunction.init()()
{
  return dispatch thunk of HashFunction.init()();
}

uint64_t type metadata accessor for SHA256Digest()
{
  return type metadata accessor for SHA256Digest();
}

uint64_t type metadata accessor for SHA256()
{
  return type metadata accessor for SHA256();
}

uint64_t Array.init()()
{
  return Array.init()();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
}

uint64_t Dictionary.debugDescription.getter()
{
  return Dictionary.debugDescription.getter();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t type metadata accessor for Dictionary.Values()
{
  return type metadata accessor for Dictionary.Values();
}

uint64_t Dictionary.values.getter()
{
  return Dictionary.values.getter();
}

Swift::Void __swiftcall Dictionary._Variant.removeAll(keepingCapacity:)(Swift::Bool keepingCapacity)
{
}

uint64_t Dictionary<>.encode(to:)()
{
  return Dictionary<>.encode(to:)();
}

uint64_t dispatch thunk of Encodable.encode(to:)()
{
  return dispatch thunk of Encodable.encode(to:)();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t BidirectionalCollection<>.starts<A>(with:)()
{
  return BidirectionalCollection<>.starts<A>(with:)();
}

uint64_t BidirectionalCollection.last.getter()
{
  return BidirectionalCollection.last.getter();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

uint64_t dispatch thunk of static Comparable.>= infix(_:_:)()
{
  return dispatch thunk of static Comparable.>= infix(_:_:)();
}

uint64_t dispatch thunk of static Comparable.<= infix(_:_:)()
{
  return dispatch thunk of static Comparable.<= infix(_:_:)();
}

uint64_t static Comparable.> infix(_:_:)()
{
  return static Comparable.> infix(_:_:)();
}

uint64_t static Comparable.>= infix(_:_:)()
{
  return static Comparable.>= infix(_:_:)();
}

uint64_t static Comparable.<= infix(_:_:)()
{
  return static Comparable.<= infix(_:_:)();
}

uint64_t ClosedRange.contains(_:)()
{
  return ClosedRange.contains(_:)();
}

uint64_t type metadata accessor for ClosedRange()
{
  return type metadata accessor for ClosedRange();
}

uint64_t ClosedRange<>.startIndex.getter()
{
  return ClosedRange<>.startIndex.getter();
}

uint64_t static ClosedRange<>.Index.== infix(_:_:)()
{
  return static ClosedRange<>.Index.== infix(_:_:)();
}

uint64_t type metadata accessor for ClosedRange<>.Index()
{
  return type metadata accessor for ClosedRange<>.Index();
}

uint64_t ClosedRange<>.index(after:)()
{
  return ClosedRange<>.index(after:)();
}

uint64_t ClosedRange<>.endIndex.getter()
{
  return ClosedRange<>.endIndex.getter();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.data(using:allowLossyConversion:)()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t String.init(data:encoding:)()
{
  return String.init(data:encoding:)();
}

uint64_t String.init<A>(bytes:encoding:)()
{
  return String.init<A>(bytes:encoding:)();
}

uint64_t String.init(format:_:)()
{
  return String.init(format:_:)();
}

uint64_t String.init(cString:encoding:)()
{
  return String.init(cString:encoding:)();
}

uint64_t static String.Encoding.utf8.getter()
{
  return static String.Encoding.utf8.getter();
}

uint64_t type metadata accessor for String.Encoding()
{
  return type metadata accessor for String.Encoding();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

Swift::String __swiftcall String.lowercased()()
{
  uint64_t v0 = String.lowercased()();
  result._object = v1;
  result._uint64_t countAndFlagsBits = v0;
  return result;
}

Swift::String __swiftcall String.uppercased()()
{
  uint64_t v0 = String.uppercased()();
  result._object = v1;
  result._uint64_t countAndFlagsBits = v0;
  return result;
}

uint64_t String.utf8CString.getter()
{
  return String.utf8CString.getter();
}

uint64_t static String._fromSubstring(_:)()
{
  return static String._fromSubstring(_:)();
}

uint64_t static String._fromUTF8Repairing(_:)()
{
  return static String._fromUTF8Repairing(_:)();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.count.getter()
{
  return String.count.getter();
}

uint64_t String.index(after:)()
{
  return String.index(after:)();
}

uint64_t String.index(before:)()
{
  return String.index(before:)();
}

uint64_t String.index(_:offsetBy:limitedBy:)()
{
  return String.index(_:offsetBy:limitedBy:)();
}

uint64_t String.index(_:offsetBy:)()
{
  return String.index(_:offsetBy:)();
}

uint64_t String.append<A>(contentsOf:)()
{
  return String.append<A>(contentsOf:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t String.encode(to:)()
{
  return String.encode(to:)();
}

uint64_t String.init(cString:)()
{
  return String.init(cString:)();
}

{
  return String.init(cString:)();
}

Swift::String_optional __swiftcall String.Iterator.next()()
{
  uint64_t v0 = String.Iterator.next()();
  result.value._object = v1;
  result.value._uint64_t countAndFlagsBits = v0;
  return result;
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t String.UTF8View._foreignDistance(from:to:)()
{
  return String.UTF8View._foreignDistance(from:to:)();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t String.distance(from:to:)()
{
  return String.distance(from:to:)();
}

uint64_t String.UTF16View.count.getter()
{
  return String.UTF16View.count.getter();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return String.UTF16View.index(_:offsetBy:)();
}

Swift::Bool __swiftcall String.hasPrefix(_:)(Swift::String a1)
{
  return String.hasPrefix(_:)(a1._countAndFlagsBits, a1._object);
}

Swift::Bool __swiftcall String.hasSuffix(_:)(Swift::String a1)
{
  return String.hasSuffix(_:)(a1._countAndFlagsBits, a1._object);
}

Swift::String __swiftcall String.init(repeating:count:)(Swift::String repeating, Swift::Int count)
{
  uint64_t v2 = String.init(repeating:count:)(repeating._countAndFlagsBits, repeating._object, count);
  result._object = v3;
  result._uint64_t countAndFlagsBits = v2;
  return result;
}

uint64_t String.subscript.getter()
{
  return String.subscript.getter();
}

{
  return String.subscript.getter();
}

uint64_t String.init<A>(_:)()
{
  return String.init<A>(_:)();
}

uint64_t Sequence._copyContents(initializing:)()
{
  return Sequence._copyContents(initializing:)();
}

uint64_t Sequence.underestimatedCount.getter()
{
  return Sequence.underestimatedCount.getter();
}

uint64_t Sequence._copyToContiguousArray()()
{
  return Sequence._copyToContiguousArray()();
}

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

uint64_t Sequence.first(where:)()
{
  return Sequence.first(where:)();
}

uint64_t Sequence.forEach(_:)()
{
  return Sequence.forEach(_:)();
}

uint64_t Sequence<>.joined(separator:)()
{
  return Sequence<>.joined(separator:)();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t dispatch thunk of RawRepresentable.init(rawValue:)()
{
  return dispatch thunk of RawRepresentable.init(rawValue:)();
}

uint64_t RawRepresentable<>.encode(to:)()
{
  return RawRepresentable<>.encode(to:)();
}

{
  return RawRepresentable<>.encode(to:)();
}

{
  return RawRepresentable<>.encode(to:)();
}

{
  return RawRepresentable<>.encode(to:)();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return RawRepresentable<>.init(from:)();
}

{
  return RawRepresentable<>.init(from:)();
}

{
  return RawRepresentable<>.init(from:)();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Array.startIndex.getter()
{
  return Array.startIndex.getter();
}

uint64_t Array.description.getter()
{
  return Array.description.getter();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t Array._checkSubscript(_:wasNativeTypeChecked:)()
{
  return Array._checkSubscript(_:wasNativeTypeChecked:)();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

Swift::Void __swiftcall Array._makeMutableAndUnique()()
{
}

uint64_t static Array._allocateUninitialized(_:)()
{
  return static Array._allocateUninitialized(_:)();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

Swift::Bool __swiftcall Array._hoistableIsNativeTypeChecked()()
{
  return Array._hoistableIsNativeTypeChecked()();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t Array.count.getter()
{
  return Array.count.getter();
}

uint64_t Array.append(_:)()
{
  return Array.append(_:)();
}

uint64_t Array.insert(_:at:)()
{
  return Array.insert(_:at:)();
}

uint64_t Array.remove(at:)()
{
  return Array.remove(at:)();
}

uint64_t Array.endIndex.getter()
{
  return Array.endIndex.getter();
}

Swift::Void __swiftcall Array.formIndex(after:)(Swift::Int *after)
{
}

uint64_t type metadata accessor for Array()
{
  return type metadata accessor for Array();
}

uint64_t Array<A>.encode(to:)()
{
  return Array<A>.encode(to:)();
}

uint64_t Array.init<A>(_:)()
{
  return Array.init<A>(_:)();
}

uint64_t Array.subscript.getter()
{
  return Array.subscript.getter();
}

Swift::Bool_optional __swiftcall Bool.init(_:)(Swift::String a1)
{
  return (Swift::Bool_optional)Bool.init(_:)(a1._countAndFlagsBits, a1._object);
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t TaskGroup.makeAsyncIterator()()
{
  return TaskGroup.makeAsyncIterator()();
}

uint64_t static TaskPriority.userInitiated.getter()
{
  return static TaskPriority.userInitiated.getter();
}

uint64_t static TaskPriority.high.getter()
{
  return static TaskPriority.high.getter();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

Swift::Void __swiftcall Task.cancel()()
{
}

uint64_t static Task<>.isCancelled.getter()
{
  return static Task<>.isCancelled.getter();
}

NSNumber __swiftcall Double._bridgeToObjectiveC()()
{
  return (NSNumber)Double._bridgeToObjectiveC()();
}

uint64_t Double.description.getter()
{
  return Double.description.getter();
}

uint64_t Double.write<A>(to:)()
{
  return Double.write<A>(to:)();
}

uint64_t Float.description.getter()
{
  return Float.description.getter();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)Set._bridgeToObjectiveC()();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return dispatch thunk of Collection.startIndex.getter();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return dispatch thunk of Collection.count.getter();
}

uint64_t dispatch thunk of Collection.formIndex(after:)()
{
  return dispatch thunk of Collection.formIndex(after:)();
}

uint64_t Collection.firstIndex(where:)()
{
  return Collection.firstIndex(where:)();
}

uint64_t Collection.first.getter()
{
  return Collection.first.getter();
}

uint64_t Collection.isEmpty.getter()
{
  return Collection.isEmpty.getter();
}

uint64_t Collection<>.firstIndex(of:)()
{
  return Collection<>.firstIndex(of:)();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t RangeReplaceableCollection<>.popLast()()
{
  return RangeReplaceableCollection<>.popLast()();
}

uint64_t Range<>.init(_:in:)()
{
  return Range<>.init(_:in:)();
}

uint64_t NSFileHandle.write<A>(contentsOf:)()
{
  return NSFileHandle.write<A>(contentsOf:)();
}

uint64_t NSFileManager.parsecdAssetsDirectoryURL.getter()
{
  return NSFileManager.parsecdAssetsDirectoryURL.getter();
}

uint64_t NSFileManager.parsecdCustomFBDirectoryURL.getter()
{
  return NSFileManager.parsecdCustomFBDirectoryURL.getter();
}

uint64_t NSFileManager.parsecdSessionFBDirectoryURL.getter()
{
  return NSFileManager.parsecdSessionFBDirectoryURL.getter();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.fault.getter()
{
  return static os_log_type_t.fault.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t PAREngagedResult.toServerSuggestion()()
{
  return PAREngagedResult.toServerSuggestion()();
}

uint64_t PAREngagedResult.encoded()()
{
  return PAREngagedResult.encoded()();
}

uint64_t PAREngagedResult.init(encoded:)()
{
  return PAREngagedResult.init(encoded:)();
}

uint64_t PAREngagedResult.init(_:searchString:type:engagemementTime:)()
{
  return PAREngagedResult.init(_:searchString:type:engagemementTime:)();
}

uint64_t OS_dispatch_group.wait(timeout:)()
{
  return OS_dispatch_group.wait(timeout:)();
}

Swift::Void __swiftcall OS_dispatch_group.wait()()
{
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.sync<A>(execute:)()
{
  return OS_dispatch_queue.sync<A>(execute:)();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t OS_dispatch_queue.label.getter()
{
  return OS_dispatch_queue.label.getter();
}

uint64_t static OS_dispatch_queue.global(qos:)()
{
  return static OS_dispatch_queue.global(qos:)();
}

uint64_t type metadata accessor for OS_dispatch_source.TimerFlags()
{
  return type metadata accessor for OS_dispatch_source.TimerFlags();
}

uint64_t static OS_dispatch_source.makeTimerSource(flags:queue:)()
{
  return static OS_dispatch_source.makeTimerSource(flags:queue:)();
}

uint64_t static OS_dispatch_source.makeSignalSource(signal:queue:)()
{
  return static OS_dispatch_source.makeSignalSource(signal:queue:)();
}

uint64_t OS_dispatch_source.setEventHandler(qos:flags:handler:)()
{
  return OS_dispatch_source.setEventHandler(qos:flags:handler:)();
}

uint64_t OS_dispatch_source.setEventHandler(handler:)()
{
  return OS_dispatch_source.setEventHandler(handler:)();
}

Swift::Void __swiftcall OS_dispatch_source.cancel()()
{
}

Swift::Void __swiftcall OS_dispatch_source.resume()()
{
}

Swift::Void __swiftcall OS_dispatch_source.activate()()
{
}

uint64_t static os_signpost_type_t.end.getter()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return static os_signpost_type_t.begin.getter();
}

uint64_t static os_signpost_type_t.event.getter()
{
  return static os_signpost_type_t.event.getter();
}

uint64_t OS_dispatch_semaphore.wait(timeout:)()
{
  return OS_dispatch_semaphore.wait(timeout:)();
}

Swift::Int __swiftcall OS_dispatch_semaphore.signal()()
{
  return OS_dispatch_semaphore.signal()();
}

uint64_t OS_dispatch_source_timer.schedule(deadline:repeating:leeway:)()
{
  return OS_dispatch_source_timer.schedule(deadline:repeating:leeway:)();
}

uint64_t NSURLSessionTaskTransactionMetrics.remotePort.getter()
{
  return NSURLSessionTaskTransactionMetrics.remotePort.getter();
}

uint64_t NSData.startIndex.getter()
{
  return NSData.startIndex.getter();
}

uint64_t NSData.endIndex.getter()
{
  return NSData.endIndex.getter();
}

uint64_t NSData.subscript.getter()
{
  return NSData.subscript.getter();
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t NSScanner.currentIndex.getter()
{
  return NSScanner.currentIndex.getter();
}

uint64_t NSScanner.currentIndex.setter()
{
  return NSScanner.currentIndex.setter();
}

uint64_t NSScanner.scanCharacters(from:)()
{
  return NSScanner.scanCharacters(from:)();
}

uint64_t type metadata accessor for NSScanner.NumberRepresentation()
{
  return type metadata accessor for NSScanner.NumberRepresentation();
}

uint64_t NSScanner.scanInt(representation:)()
{
  return NSScanner.scanInt(representation:)();
}

uint64_t static OS_os_log.default.getter()
{
  return static OS_os_log.default.getter();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t Optional.debugDescription.getter()
{
  return Optional.debugDescription.getter();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t Substring.index(after:)()
{
  return Substring.index(after:)();
}

uint64_t Substring.index(before:)()
{
  return Substring.index(before:)();
}

uint64_t Substring.subscript.getter()
{
  return Substring.subscript.getter();
}

{
  return Substring.subscript.getter();
}

NSNumber __swiftcall UInt._bridgeToObjectiveC()()
{
  return (NSNumber)UInt._bridgeToObjectiveC()();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t StringProtocol.components<A>(separatedBy:)()
{
  return StringProtocol.components<A>(separatedBy:)();
}

uint64_t StringProtocol.capitalized.getter()
{
  return StringProtocol.capitalized.getter();
}

uint64_t StringProtocol.rangeOfCharacter(from:options:range:)()
{
  return StringProtocol.rangeOfCharacter(from:options:range:)();
}

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t StringProtocol.addingPercentEncoding(withAllowedCharacters:)()
{
  return StringProtocol.addingPercentEncoding(withAllowedCharacters:)();
}

uint64_t StringProtocol.decomposedStringWithCompatibilityMapping.getter()
{
  return StringProtocol.decomposedStringWithCompatibilityMapping.getter();
}

uint64_t StringProtocol.cString(using:)()
{
  return StringProtocol.cString(using:)();
}

uint64_t StringProtocol.folding(options:locale:)()
{
  return StringProtocol.folding(options:locale:)();
}

uint64_t StringProtocol.contains<A>(_:)()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t dispatch thunk of static BinaryInteger.isSigned.getter()
{
  return dispatch thunk of static BinaryInteger.isSigned.getter();
}

uint64_t dispatch thunk of BinaryInteger.init<A>(_:)()
{
  return dispatch thunk of BinaryInteger.init<A>(_:)();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
}

uint64_t _HashTable.occupiedBucket(after:)()
{
  return _HashTable.occupiedBucket(after:)();
}

uint64_t _expectEnd<A>(of:is:)()
{
  return _expectEnd<A>(of:is:)();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t _StringGuts._slowWithCString<A>(_:)()
{
  return _StringGuts._slowWithCString<A>(_:)();
}

uint64_t _StringGuts.foreignErrorCorrectedScalar(startingAt:)()
{
  return _StringGuts.foreignErrorCorrectedScalar(startingAt:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t dispatch thunk of static CaseIterable.allCases.getter()
{
  return dispatch thunk of static CaseIterable.allCases.getter();
}

uint64_t StaticString.description.getter()
{
  return StaticString.description.getter();
}

Swift::Void __swiftcall _ArrayBuffer._typeCheckSlowPath(_:)(Swift::Int a1)
{
}

uint64_t _ArrayBuffer._getElementSlowPath(_:)()
{
  return _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _decodeScalar(_:startingAt:)()
{
  return _decodeScalar(_:startingAt:)();
}

uint64_t _ArrayProtocol.filter(_:)()
{
  return _ArrayProtocol.filter(_:)();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return specialized ContiguousArray._endMutation()();
}

Swift::Void __swiftcall ContiguousArray.reserveCapacity(_:)(Swift::Int a1)
{
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t ContiguousArray.append(_:)()
{
  return ContiguousArray.append(_:)();
}

uint64_t ContiguousArray.init()()
{
  return ContiguousArray.init()();
}

uint64_t type metadata accessor for ContiguousArray()
{
  return type metadata accessor for ContiguousArray();
}

uint64_t static ContinuousClock.Instant.now.getter()
{
  return static ContinuousClock.Instant.now.getter();
}

uint64_t ContinuousClock.Instant.advanced(by:)()
{
  return ContinuousClock.Instant.advanced(by:)();
}

uint64_t type metadata accessor for ContinuousClock.Instant()
{
  return type metadata accessor for ContinuousClock.Instant();
}

uint64_t type metadata accessor for ContinuousClock()
{
  return type metadata accessor for ContinuousClock();
}

uint64_t _arrayForceCast<A, B>(_:)()
{
  return _arrayForceCast<A, B>(_:)();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t type metadata accessor for IndexingIterator()
{
  return type metadata accessor for IndexingIterator();
}

uint64_t type metadata accessor for CodingUserInfoKey()
{
  return type metadata accessor for CodingUserInfoKey();
}

uint64_t dispatch thunk of FixedWidthInteger.littleEndian.getter()
{
  return dispatch thunk of FixedWidthInteger.littleEndian.getter();
}

uint64_t dispatch thunk of static FixedWidthInteger.max.getter()
{
  return dispatch thunk of static FixedWidthInteger.max.getter();
}

uint64_t dispatch thunk of static FixedWidthInteger.min.getter()
{
  return dispatch thunk of static FixedWidthInteger.min.getter();
}

uint64_t dispatch thunk of FixedWidthInteger.bigEndian.getter()
{
  return dispatch thunk of FixedWidthInteger.bigEndian.getter();
}

Swift::Bool __swiftcall _NativeDictionary.ensureUnique(isUnique:capacity:)(Swift::Bool isUnique, Swift::Int capacity)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(isUnique, capacity);
}

Swift::Void __swiftcall _NativeDictionary.copy()()
{
}

uint64_t _NativeDictionary._delete(at:)()
{
  return _NativeDictionary._delete(at:)();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _bridgeCocoaArray<A>(_:)()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t dispatch thunk of static AdditiveArithmetic.+ infix(_:_:)()
{
  return dispatch thunk of static AdditiveArithmetic.+ infix(_:_:)();
}

uint64_t dispatch thunk of static AdditiveArithmetic.- infix(_:_:)()
{
  return dispatch thunk of static AdditiveArithmetic.- infix(_:_:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t _CocoaArrayWrapper.subscript.getter()
{
  return _CocoaArrayWrapper.subscript.getter();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t KeyedEncodingContainer.init<A>(_:)()
{
  return KeyedEncodingContainer.init<A>(_:)();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t UnkeyedEncodingContainer.encodeConditional<A>(_:)()
{
  return UnkeyedEncodingContainer.encodeConditional<A>(_:)();
}

uint64_t UnkeyedEncodingContainer.encode<A>(contentsOf:)()
{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

uint64_t UnkeyedEncodingContainer.encode(_:)()
{
  return UnkeyedEncodingContainer.encode(_:)();
}

{
  return UnkeyedEncodingContainer.encode(_:)();
}

uint64_t _getErrorEmbeddedNSError<A>(_:)()
{
  return _getErrorEmbeddedNSError<A>(_:)();
}

uint64_t dispatch thunk of LosslessStringConvertible.init(_:)()
{
  return dispatch thunk of LosslessStringConvertible.init(_:)();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)()
{
  return DefaultStringInterpolation.appendInterpolation<A>(_:)();
}

uint64_t dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)()
{
  return dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t _diagnoseUnexpectedEnumCase<A>(type:)()
{
  return _diagnoseUnexpectedEnumCase<A>(type:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t dispatch thunk of SingleValueDecodingContainer.decode(_:)()
{
  return dispatch thunk of SingleValueDecodingContainer.decode(_:)();
}

{
  return dispatch thunk of SingleValueDecodingContainer.decode(_:)();
}

uint64_t dispatch thunk of SingleValueDecodingContainer.decode<A>(_:)()
{
  return dispatch thunk of SingleValueDecodingContainer.decode<A>(_:)();
}

uint64_t dispatch thunk of SingleValueEncodingContainer.encode(_:)()
{
  return dispatch thunk of SingleValueEncodingContainer.encode(_:)();
}

{
  return dispatch thunk of SingleValueEncodingContainer.encode(_:)();
}

{
  return dispatch thunk of SingleValueEncodingContainer.encode(_:)();
}

{
  return dispatch thunk of SingleValueEncodingContainer.encode(_:)();
}

{
  return dispatch thunk of SingleValueEncodingContainer.encode(_:)();
}

{
  return dispatch thunk of SingleValueEncodingContainer.encode(_:)();
}

{
  return dispatch thunk of SingleValueEncodingContainer.encode(_:)();
}

{
  return dispatch thunk of SingleValueEncodingContainer.encode(_:)();
}

uint64_t dispatch thunk of SingleValueEncodingContainer.encode<A>(_:)()
{
  return dispatch thunk of SingleValueEncodingContainer.encode<A>(_:)();
}

uint64_t SingleValueEncodingContainer.encode(_:)()
{
  return SingleValueEncodingContainer.encode(_:)();
}

{
  return SingleValueEncodingContainer.encode(_:)();
}

uint64_t dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t type metadata accessor for __ContiguousArrayStorageBase()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:)()
{
  return KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:)();
}

{
  return KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:)();
}

{
  return KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:)();
}

{
  return KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:)();
}

{
  return KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:)();
}

{
  return KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:)();
}

{
  return KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:)();
}

{
  return KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:)();
}

{
  return KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:)();
}

uint64_t KeyedEncodingContainerProtocol.encodeIfPresent<A>(_:forKey:)()
{
  return KeyedEncodingContainerProtocol.encodeIfPresent<A>(_:forKey:)();
}

uint64_t KeyedEncodingContainerProtocol.encodeConditional<A>(_:forKey:)()
{
  return KeyedEncodingContainerProtocol.encodeConditional<A>(_:forKey:)();
}

uint64_t KeyedEncodingContainerProtocol.encode(_:forKey:)()
{
  return KeyedEncodingContainerProtocol.encode(_:forKey:)();
}

{
  return KeyedEncodingContainerProtocol.encode(_:forKey:)();
}

uint64_t _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)()
{
  return _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
}

uint64_t dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)()
{
  return dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
}

uint64_t _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._code.getter()
{
  return Error._code.getter();
}

uint64_t Error._domain.getter()
{
  return Error._domain.getter();
}

uint64_t Error._userInfo.getter()
{
  return Error._userInfo.getter();
}

NSNumber __swiftcall Int32._bridgeToObjectiveC()()
{
  return (NSNumber)Int32._bridgeToObjectiveC()();
}

uint64_t Int64.encode(to:)()
{
  return Int64.encode(to:)();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return static Hasher._hash(seed:_:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt32 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt64 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t dispatch thunk of Decoder.singleValueContainer()()
{
  return dispatch thunk of Decoder.singleValueContainer()();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t dispatch thunk of Encoder.singleValueContainer()()
{
  return dispatch thunk of Encoder.singleValueContainer()();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t dispatch thunk of CodingKey.stringValue.getter()
{
  return dispatch thunk of CodingKey.stringValue.getter();
}

uint64_t dispatch thunk of OptionSet.init(rawValue:)()
{
  return dispatch thunk of OptionSet.init(rawValue:)();
}

uint64_t _typeName(_:qualified:)()
{
  return _typeName(_:qualified:)();
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t BYSetupAssistantNeedsToRun()
{
  return _BYSetupAssistantNeedsToRun();
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return _CC_SHA512_Final(md, c);
}

int CC_SHA512_Init(CC_SHA512_CTX *c)
{
  return _CC_SHA512_Init(c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA512_Update(c, data, len);
}

CFStringRef CFStringTokenizerCopyBestStringLanguage(CFStringRef string, CFRange range)
{
  return _CFStringTokenizerCopyBestStringLanguage(string, range);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  CLLocationCoordinate2D v4 = _CLLocationCoordinate2DMake(latitude, longitude);
  double v3 = v4.longitude;
  double v2 = v4.latitude;
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t DiagnosticLogSubmissionEnabled()
{
  return _DiagnosticLogSubmissionEnabled();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return _PBDataWriterWriteSubmessage();
}

uint64_t PBReaderReadData()
{
  return _PBReaderReadData();
}

uint64_t PBReaderReadString()
{
  return _PBReaderReadString();
}

uint64_t PBReaderSkipValueWithTag()
{
  return _PBReaderSkipValueWithTag();
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

uint32_t SecTaskGetCodeSignStatus(SecTaskRef task)
{
  return _SecTaskGetCodeSignStatus(task);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFPreferencesSetBackupDisabled()
{
  return __CFPreferencesSetBackupDisabled();
}

uint64_t _CFURLCachePurgeMemoryCache()
{
  return __CFURLCachePurgeMemoryCache();
}

void _Exit(int a1)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

{
}

{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return __swift_isClassOrObjCExistentialType();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return __swift_stdlib_strtod_clocale();
}

uint64_t _swift_stdlib_strtof_clocale()
{
  return __swift_stdlib_strtof_clocale();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return _compression_stream_destroy(stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return _compression_stream_init(stream, operation, algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return _compression_stream_process(stream, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_main(void)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void exit(int a1)
{
}

long double exp(long double __x)
{
  return _exp(__x);
}

void free(void *a1)
{
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

uint64_t nw_activity_activate()
{
  return _nw_activity_activate();
}

uint64_t nw_activity_complete_with_reason()
{
  return _nw_activity_complete_with_reason();
}

uint64_t nw_activity_create()
{
  return _nw_activity_create();
}

uint64_t nw_activity_is_activated()
{
  return _nw_activity_is_activated();
}

uint64_t nw_activity_set_parent_activity()
{
  return _nw_activity_set_parent_activity();
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

Class object_getClass(id a1)
{
  return _object_getClass(a1);
}

uint64_t os_eligibility_get_domain_answer()
{
  return _os_eligibility_get_domain_answer();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double pow(long double __x, long double __y)
{
  return _pow(__x, __y);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath(pid, buffer, buffersize);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return _pthread_cond_broadcast(a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return _pthread_cond_init(a1, a2);
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return _pthread_cond_timedwait(a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return _pthread_cond_wait(a1, a2);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_blob(a1, a2, a3, n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return _sqlite3_bind_double(a1, a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return _sqlite3_bind_int(a1, a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return _sqlite3_bind_int64(a1, a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return _sqlite3_bind_null(a1, a2);
}

int sqlite3_bind_parameter_index(sqlite3_stmt *a1, const char *zName)
{
  return _sqlite3_bind_parameter_index(a1, zName);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_text(a1, a2, a3, a4, a5);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return _sqlite3_clear_bindings(a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return _sqlite3_close_v2(a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_blob(a1, iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_bytes(a1, iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return _sqlite3_column_count(pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_double(a1, iCol);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int(a1, iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int64(a1, iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return _sqlite3_column_name(a1, N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_text(a1, iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_type(a1, iCol);
}

int sqlite3_create_function(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *))
{
  return _sqlite3_create_function(db, zFunctionName, nArg, eTextRep, pApp, xFunc, xStep, xFinal);
}

int sqlite3_create_function_v2(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *), void (__cdecl *xDestroy)(void *))
{
  return _sqlite3_create_function_v2(db, zFunctionName, nArg, eTextRep, pApp, xFunc, xStep, xFinal, xDestroy);
}

int sqlite3_create_module_v2(sqlite3 *db, const char *zName, const sqlite3_module *p, void *pClientData, void (__cdecl *xDestroy)(void *))
{
  return _sqlite3_create_module_v2(db, zName, p, pClientData, xDestroy);
}

int sqlite3_declare_vtab(sqlite3 *a1, const char *zSQL)
{
  return _sqlite3_declare_vtab(a1, zSQL);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return _sqlite3_errmsg(a1);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return _sqlite3_finalize(pStmt);
}

void sqlite3_free(void *a1)
{
}

void *__cdecl sqlite3_malloc(int a1)
{
  return _sqlite3_malloc(a1);
}

int sqlite3_open(const char *filename, sqlite3 **ppDb)
{
  return _sqlite3_open(filename, ppDb);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return _sqlite3_open_v2(filename, ppDb, flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return _sqlite3_prepare_v2(db, zSql, nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return _sqlite3_reset(pStmt);
}

void sqlite3_result_blob(sqlite3_context *a1, const void *a2, int a3, void (__cdecl *a4)(void *))
{
}

void sqlite3_result_double(sqlite3_context *a1, double a2)
{
}

void sqlite3_result_error(sqlite3_context *a1, const char *a2, int a3)
{
}

void sqlite3_result_int(sqlite3_context *a1, int a2)
{
}

void sqlite3_result_int64(sqlite3_context *a1, sqlite3_int64 a2)
{
}

void sqlite3_result_null(sqlite3_context *a1)
{
}

void sqlite3_result_subtype(sqlite3_context *a1, unsigned int a2)
{
}

void sqlite3_result_text(sqlite3_context *a1, const char *a2, int a3, void (__cdecl *a4)(void *))
{
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return _sqlite3_step(a1);
}

int sqlite3_threadsafe(void)
{
  return _sqlite3_threadsafe();
}

void *__cdecl sqlite3_user_data(sqlite3_context *a1)
{
  return _sqlite3_user_data(a1);
}

const void *__cdecl sqlite3_value_blob(sqlite3_value *a1)
{
  return _sqlite3_value_blob(a1);
}

int sqlite3_value_bytes(sqlite3_value *a1)
{
  return _sqlite3_value_bytes(a1);
}

double sqlite3_value_double(sqlite3_value *a1)
{
  return _sqlite3_value_double(a1);
}

int sqlite3_value_int(sqlite3_value *a1)
{
  return _sqlite3_value_int(a1);
}

sqlite3_int64 sqlite3_value_int64(sqlite3_value *a1)
{
  return _sqlite3_value_int64(a1);
}

unsigned int sqlite3_value_subtype(sqlite3_value *a1)
{
  return _sqlite3_value_subtype(a1);
}

const unsigned __int8 *__cdecl sqlite3_value_text(sqlite3_value *a1)
{
  return _sqlite3_value_text(a1);
}

int sqlite3_value_type(sqlite3_value *a1)
{
  return _sqlite3_value_type(a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
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

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_conformsToProtocol2()
{
  return _swift_conformsToProtocol2();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_deletedMethodError()
{
  return _swift_deletedMethodError();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return _swift_getAssociatedConformanceWitness();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getDynamicType()
{
  return _swift_getDynamicType();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getMetatypeMetadata()
{
  return _swift_getMetatypeMetadata();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTupleTypeLayout2()
{
  return _swift_getTupleTypeLayout2();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return _swift_getTupleTypeMetadata2();
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

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
}

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unexpectedError()
{
  return _swift_unexpectedError();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return _swift_unknownObjectUnownedDestroy();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return _swift_unknownObjectUnownedInit();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return _swift_unknownObjectUnownedLoadStrong();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return _swift_unknownObjectWeakCopyAssign();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return _swift_unknownObjectWeakCopyInit();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return _swift_unknownObjectWeakTakeAssign();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return _swift_unknownObjectWeakTakeInit();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakAssign()
{
  return _swift_weakAssign();
}

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

uint64_t swift_willThrowTypedImpl()
{
  return _swift_willThrowTypedImpl();
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_getEffectiveUserTier_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getEffectiveUserTier:completionHandler:");
}

id objc_msgSend_handleInvocation(void *a1, const char *a2, ...)
{
  return _[a1 handleInvocation];
}

id objc_msgSend_invoke(void *a1, const char *a2, ...)
{
  return _[a1 invoke];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_parsec_componentsWithURL_resolvingAgainstBaseURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parsec_componentsWithURL:resolvingAgainstBaseURL:");
}

id objc_msgSend_parsec_filterObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parsec_filterObjectsUsingBlock:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_query(void *a1, const char *a2, ...)
{
  return _[a1 query];
}

id objc_msgSend_queryItems(void *a1, const char *a2, ...)
{
  return _[a1 queryItems];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return _[a1 queue];
}

id objc_msgSend_setQuery_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQuery:");
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueryItems:");
}

id objc_msgSend_setQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueue:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}