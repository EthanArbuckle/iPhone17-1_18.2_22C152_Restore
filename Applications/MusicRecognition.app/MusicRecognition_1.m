uint64_t sub_1000BDFCC(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(unint64_t);
  unint64_t v6;
  uint64_t vars8;

  v3 = (a1 + 9) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  v4 = *(void *)(*(void *)(a2 + 16) - 8);
  v5 = *(uint64_t (**)(unint64_t))(v4 + 8);
  v6 = (v3 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);

  return v5(v6);
}

unsigned char *sub_1000BE044(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  v4 = (void *)((unint64_t)(a1 + 9) & 0xFFFFFFFFFFFFFFF8);
  v5 = (void *)((unint64_t)(a2 + 9) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v6 = v5[1];
  void *v4 = *v5;
  v4[1] = v6;
  uint64_t v7 = *(void *)(a3 + 16);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);
  uint64_t v9 = *(unsigned __int8 *)(*(void *)(v7 - 8) + 80);
  uint64_t v10 = ((unint64_t)v4 + v9 + 16) & ~v9;
  uint64_t v11 = ((unint64_t)v5 + v9 + 16) & ~v9;
  swift_retain();
  v8(v10, v11, v7);
  return a1;
}

unsigned char *sub_1000BE0F4(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  v5 = (void *)((unint64_t)(a1 + 9) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v6 = (void *)((unint64_t)(a2 + 9) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v7 = v6[1];
  void *v5 = *v6;
  v5[1] = v7;
  swift_retain();
  swift_release();
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v8 + 24))(((unint64_t)v5 + *(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), ((unint64_t)v6 + *(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  return a1;
}

unsigned char *sub_1000BE1A8(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  v4 = (_OWORD *)((unint64_t)(a1 + 9) & 0xFFFFFFFFFFFFFFF8);
  v5 = (_OWORD *)((unint64_t)(a2 + 9) & 0xFFFFFFFFFFFFFFF8);
  _OWORD *v4 = *v5;
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v6 + 32))(((unint64_t)v4 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), ((unint64_t)v5 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return a1;
}

unsigned char *sub_1000BE238(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  v5 = (_OWORD *)((unint64_t)(a1 + 9) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v6 = (_OWORD *)((unint64_t)(a2 + 9) & 0xFFFFFFFFFFFFFFF8);
  _OWORD *v5 = *v6;
  swift_release();
  uint64_t v7 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 40))(((unint64_t)v5 + *(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), ((unint64_t)v6 + *(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_1000BE2DC(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  int v8 = a2 - v7;
  if (a2 <= v7) {
    goto LABEL_23;
  }
  uint64_t v9 = ((v6 + 24) & ~v6) + *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  char v10 = 8 * v9;
  if (v9 <= 3)
  {
    unsigned int v13 = ((v8 + ~(-1 << v10)) >> v10) + 1;
    if (HIWORD(v13))
    {
      int v11 = *(_DWORD *)((char *)a1 + v9);
      if (!v11) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v13 > 0xFF)
    {
      int v11 = *(unsigned __int16 *)((char *)a1 + v9);
      if (!*(unsigned __int16 *)((char *)a1 + v9)) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v13 < 2)
    {
LABEL_23:
      v15 = (unint64_t *)(((unint64_t)a1 + 9) & 0xFFFFFFFFFFFFFFF8);
      if ((v5 & 0x80000000) != 0) {
        return (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)v15 + v6 + 16) & ~v6);
      }
      unint64_t v16 = *v15;
      if (v16 >= 0xFFFFFFFF) {
        LODWORD(v16) = -1;
      }
      return (v16 + 1);
    }
  }
  int v11 = *((unsigned __int8 *)a1 + v9);
  if (!*((unsigned char *)a1 + v9)) {
    goto LABEL_23;
  }
LABEL_15:
  int v14 = (v11 - 1) << v10;
  if (v9 > 3) {
    int v14 = 0;
  }
  if (v9)
  {
    if (v9 > 3) {
      LODWORD(v9) = 4;
    }
    switch((int)v9)
    {
      case 2:
        LODWORD(v9) = *a1;
        break;
      case 3:
        LODWORD(v9) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v9) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v9) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v7 + (v9 | v14) + 1;
}

void sub_1000BE484(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  size_t v10 = ((v9 + 24) & ~v9) + *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  BOOL v11 = a3 >= v8;
  unsigned int v12 = a3 - v8;
  if (v12 != 0 && v11)
  {
    if (v10 <= 3)
    {
      unsigned int v16 = ((v12 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
      if (HIWORD(v16))
      {
        int v13 = 4;
      }
      else if (v16 >= 0x100)
      {
        int v13 = 2;
      }
      else
      {
        int v13 = v16 > 1;
      }
    }
    else
    {
      int v13 = 1;
    }
  }
  else
  {
    int v13 = 0;
  }
  if (v8 < a2)
  {
    unsigned int v14 = ~v8 + a2;
    if (v10 < 4)
    {
      int v15 = (v14 >> (8 * v10)) + 1;
      if (v10)
      {
        int v17 = v14 & ~(-1 << (8 * v10));
        bzero(a1, v10);
        if (v10 == 3)
        {
          *(_WORD *)a1 = v17;
          a1[2] = BYTE2(v17);
        }
        else if (v10 == 2)
        {
          *(_WORD *)a1 = v17;
        }
        else
        {
          *a1 = v17;
        }
      }
    }
    else
    {
      bzero(a1, v10);
      *(_DWORD *)a1 = v14;
      int v15 = 1;
    }
    switch(v13)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_42;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
  switch(v13)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_42:
      __break(1u);
      JUMPOUT(0x1000BE6ECLL);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        v18 = (void *)((unint64_t)(a1 + 9) & 0xFFFFFFFFFFFFFFF8);
        if ((v7 & 0x80000000) != 0)
        {
          v20 = *(void (**)(unint64_t))(v6 + 56);
          v20(((unint64_t)v18 + v9 + 16) & ~v9);
        }
        else
        {
          if ((a2 & 0x80000000) != 0)
          {
            uint64_t v19 = a2 ^ 0x80000000;
            v18[1] = 0;
          }
          else
          {
            uint64_t v19 = a2 - 1;
          }
          void *v18 = v19;
        }
      }
      return;
  }
}

uint64_t type metadata accessor for ObservableScrollView()
{
  return sub_100020608();
}

uint64_t sub_1000BE72C()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_1000BE770(double *a1@<X8>)
{
  *a1 = sub_1000E8190();
}

uint64_t sub_1000BE7C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v39 = a2;
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v30 = *(void *)(a1 + 16);
  uint64_t v5 = v4;
  uint64_t v29 = v4;
  uint64_t v31 = type metadata accessor for ObservableScrollView.OffsetPreferenceKey();
  uint64_t WitnessTable = swift_getWitnessTable();
  type metadata accessor for SizeModifier();
  type metadata accessor for ModifiedContent();
  uint64_t v49 = v5;
  uint64_t v50 = swift_getWitnessTable();
  v38 = &protocol conformance descriptor for <> ModifiedContent<A, B>;
  uint64_t v28 = swift_getWitnessTable();
  uint64_t v6 = type metadata accessor for ScrollView();
  uint64_t v32 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  unsigned int v8 = (char *)&v28 - v7;
  sub_100006224(&qword_10015B770);
  uint64_t v9 = type metadata accessor for ModifiedContent();
  uint64_t v37 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  BOOL v11 = (char *)&v28 - v10;
  unint64_t v33 = sub_1000569EC();
  uint64_t v35 = type metadata accessor for _PreferenceActionModifier();
  uint64_t v12 = type metadata accessor for ModifiedContent();
  uint64_t v36 = *(void *)(v12 - 8);
  uint64_t v13 = __chkstk_darwin(v12);
  int v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  int v17 = (char *)&v28 - v16;
  uint64_t v40 = v30;
  uint64_t v41 = v29;
  uint64_t v42 = v3;
  ScrollView.init(_:showsIndicators:content:)();
  uint64_t v47 = 0x69566C6C6F726373;
  unint64_t v48 = 0xEA00000000007765;
  uint64_t v18 = swift_getWitnessTable();
  View.coordinateSpace<A>(name:)();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v8, v6);
  uint64_t v20 = *(void *)(v3 + 8);
  uint64_t v19 = *(void *)(v3 + 16);
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v20;
  *(void *)(v21 + 24) = v19;
  unint64_t v22 = sub_1000BF060();
  uint64_t v45 = v18;
  unint64_t v46 = v22;
  swift_retain();
  uint64_t v23 = swift_getWitnessTable();
  View.onPreferenceChange<A>(_:perform:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v11, v9);
  uint64_t v24 = swift_getWitnessTable();
  uint64_t v43 = v23;
  uint64_t v44 = v24;
  uint64_t v25 = swift_getWitnessTable();
  sub_1000BA728(v15, v12, v25);
  v26 = *(void (**)(char *, uint64_t))(v36 + 8);
  v26(v15, v12);
  sub_1000BA728(v17, v12, v25);
  return ((uint64_t (*)(char *, uint64_t))v26)(v17, v12);
}

uint64_t sub_1000BECA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v23 = a1;
  uint64_t v25 = a4;
  uint64_t v24 = type metadata accessor for CoordinateSpace();
  uint64_t v6 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  unsigned int v8 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for ObservableScrollView.OffsetPreferenceKey();
  v22[1] = swift_getWitnessTable();
  v22[2] = type metadata accessor for SizeModifier();
  uint64_t v10 = type metadata accessor for ModifiedContent();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)v22 - v15;
  v23 += *(int *)(type metadata accessor for ObservableScrollView() + 44);
  uint64_t v28 = 0x69566C6C6F726373;
  unint64_t v29 = 0xEA00000000007765;
  AnyHashable.init<A>(_:)();
  uint64_t v17 = v24;
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for CoordinateSpace.named(_:), v24);
  sub_1000EB2C0(v9, (uint64_t)v8, (uint64_t)sub_1000BEFCC, 0, a2, a3, (uint64_t)v14);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v17);
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v26 = a3;
  uint64_t v27 = WitnessTable;
  uint64_t v19 = swift_getWitnessTable();
  sub_1000BA728(v14, v10, v19);
  uint64_t v20 = *(void (**)(char *, uint64_t))(v11 + 8);
  v20(v14, v10);
  sub_1000BA728(v16, v10, v19);
  return ((uint64_t (*)(char *, uint64_t))v20)(v16, v10);
}

void sub_1000BEFCC(double *a1@<X8>, double a2@<D1>)
{
  *a1 = a2;
}

uint64_t type metadata accessor for ObservableScrollView.OffsetPreferenceKey()
{
  return sub_100020608();
}

uint64_t sub_1000BEFF0@<X0>(uint64_t a1@<X8>)
{
  return sub_1000BECA8(v1[4], v1[2], v1[3], a1);
}

uint64_t sub_1000BEFFC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000BF034(double *a1)
{
  return (*(uint64_t (**)(double))(v1 + 16))(*a1);
}

unint64_t sub_1000BF060()
{
  unint64_t result = qword_10015B778;
  if (!qword_10015B778)
  {
    sub_100006224(&qword_10015B770);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015B778);
  }
  return result;
}

uint64_t sub_1000BF0BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 16);
}

uint64_t sub_1000BF0C4()
{
  return swift_getWitnessTable();
}

uint64_t sub_1000BF26C(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

double sub_1000BF2A8()
{
  uint64_t v5 = 0;
  double v6 = 0.0;
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  sub_1000BF490();
  swift_retain();
  uint64_t v0 = (void *)UIColor.init(_:)();
  unsigned int v1 = [v0 getRed:&v6 green:&v5 blue:&v4 alpha:&v3];

  double result = 0.0;
  if (v1) {
    return v6;
  }
  return result;
}

double sub_1000BF360()
{
  double v0 = sub_1000BF2A8();
  if (v0 >= 0.04045) {
    double v1 = pow((v0 + 0.055) / 1.055, 2.4);
  }
  else {
    double v1 = v0 / 12.92;
  }
  sub_1000BF2A8();
  if (v2 >= 0.04045) {
    double v3 = pow((v2 + 0.055) / 1.055, 2.4);
  }
  else {
    double v3 = v2 / 12.92;
  }
  sub_1000BF2A8();
  if (v4 >= 0.04045) {
    double v5 = pow((v4 + 0.055) / 1.055, 2.4);
  }
  else {
    double v5 = v4 / 12.92;
  }
  return v1 * 0.2126 + v3 * 0.7152 + v5 * 0.0722;
}

unint64_t sub_1000BF490()
{
  unint64_t result = qword_100157678;
  if (!qword_100157678)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100157678);
  }
  return result;
}

uint64_t sub_1000BF4D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Song();
  double v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_1000BF53C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Song();
  double v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_1000BF5A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Song();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_1000BF604(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Song();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_1000BF668(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Song();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_1000BF6CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Song();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_1000BF730(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000BF744);
}

uint64_t sub_1000BF744(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Song();
  double v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_1000BF7B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000BF7C4);
}

uint64_t sub_1000BF7C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Song();
  double v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for MusicKitSong()
{
  uint64_t result = qword_10015B858;
  if (!qword_10015B858) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000BF880()
{
  uint64_t result = type metadata accessor for Song();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1000BF90C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1000060EC(&qword_10015B890);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = Song.previewAssets.getter();
  if (!v5) {
    goto LABEL_7;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 + 16);
  uint64_t v8 = type metadata accessor for PreviewAsset();
  uint64_t v9 = *(void *)(v8 - 8);
  if (v7)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v9 + 16))(v4, v6 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80)), v8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v4, 0, 1, v8);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v4, 1, 1, v8);
  }
  swift_bridgeObjectRelease();
  type metadata accessor for PreviewAsset();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v4, 1, v8) == 1)
  {
    sub_1000BFB34((uint64_t)v4);
LABEL_7:
    uint64_t v10 = type metadata accessor for URL();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(a1, 1, 1, v10);
  }
  PreviewAsset.url.getter();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v4, v8);
}

uint64_t sub_1000BFB34(uint64_t a1)
{
  uint64_t v2 = sub_1000060EC(&qword_10015B890);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1000BFB94()
{
  unint64_t v1 = v0;
  id v2 = objc_allocWithZone((Class)AVURLAsset);
  URL._bridgeToObjectiveC()(v3);
  uint64_t v5 = v4;
  id v17 = [v2 initWithURL:v4 options:0];

  id v6 = [objc_allocWithZone((Class)AVPlayerItem) initWithAsset:v17];
  [v6 setPreferredForwardBufferDuration:0.0];
  id v7 = [objc_allocWithZone((Class)AVQueuePlayer) initWithPlayerItem:v6];
  [v7 setMuted:1];
  id v8 = [self playerLayerWithPlayer:v7];
  uint64_t v9 = OBJC_IVAR____TtC16MusicRecognitionP33_CD8D04CF73D338E472373D718D0990B827AnimatedArtworkPlayerUIView_playerLayer;
  uint64_t v10 = *(void **)&v1[OBJC_IVAR____TtC16MusicRecognitionP33_CD8D04CF73D338E472373D718D0990B827AnimatedArtworkPlayerUIView_playerLayer];
  *(void *)&v1[OBJC_IVAR____TtC16MusicRecognitionP33_CD8D04CF73D338E472373D718D0990B827AnimatedArtworkPlayerUIView_playerLayer] = v8;

  uint64_t v11 = *(void **)&v1[v9];
  if (v11)
  {
    uint64_t v12 = self;
    id v13 = v11;
    id v14 = [v12 playerLooperWithPlayer:v7 templateItem:v6];
    uint64_t v15 = *(void **)&v1[OBJC_IVAR____TtC16MusicRecognitionP33_CD8D04CF73D338E472373D718D0990B827AnimatedArtworkPlayerUIView_playbackLooper];
    *(void *)&v1[OBJC_IVAR____TtC16MusicRecognitionP33_CD8D04CF73D338E472373D718D0990B827AnimatedArtworkPlayerUIView_playbackLooper] = v14;

    [v7 play];
    id v16 = [v1 layer];
    [v16 addSublayer:v13];

    id v6 = v13;
    id v7 = v16;
  }
}

uint64_t type metadata accessor for AnimatedArtworkPlayerUIView()
{
  return self;
}

uint64_t sub_1000BFF28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000BFF3C);
}

uint64_t sub_1000BFF40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000BFF54);
}

uint64_t type metadata accessor for AnimatedArtworkPlayerView(uint64_t a1)
{
  return sub_10009C0CC(a1, qword_10015B928);
}

uint64_t sub_1000BFF7C()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_1000BFF98()
{
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v0, v1);
  uint64_t v5 = *(void **)(v0 + *(int *)(type metadata accessor for AnimatedArtworkPlayerViewRepresentable(0) + 20));
  id v6 = (objc_class *)type metadata accessor for AnimatedArtworkPlayerUIView();
  id v7 = (char *)objc_allocWithZone(v6);
  *(void *)&v7[OBJC_IVAR____TtC16MusicRecognitionP33_CD8D04CF73D338E472373D718D0990B827AnimatedArtworkPlayerUIView_playerLayer] = 0;
  *(void *)&v7[OBJC_IVAR____TtC16MusicRecognitionP33_CD8D04CF73D338E472373D718D0990B827AnimatedArtworkPlayerUIView_playbackLooper] = 0;
  v11.receiver = v7;
  v11.super_class = v6;
  id v8 = v5;
  [super initWithFrame:0.0, 0.0, 0.0, 0.0];
  sub_1000BFB94();

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return v9;
}

uint64_t sub_1000C0104(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000C0944(&qword_10015B9F8);

  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1000C0184(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000C0944(&qword_10015B9F8);

  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_1000C0204()
{
}

id sub_1000C0248@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, v2, v5);
  id v7 = *(id *)(v2 + *(int *)(a1 + 20));
  *(void *)(a2 + *(int *)(type metadata accessor for AnimatedArtworkPlayerViewRepresentable(0) + 20)) = v7;

  return v7;
}

uint64_t type metadata accessor for AnimatedArtworkPlayerViewRepresentable(uint64_t a1)
{
  return sub_10009C0CC(a1, qword_10015B9B8);
}

uint64_t *sub_1000C0308(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = type metadata accessor for URL();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    id v9 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v9;
    id v10 = v9;
  }
  return a1;
}

void sub_1000C03D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  int v5 = *(void **)(a1 + *(int *)(a2 + 20));
}

uint64_t sub_1000C044C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v8;
  id v9 = v8;
  return a1;
}

uint64_t sub_1000C04CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a2 + v7);
  id v9 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = v8;
  id v10 = v8;

  return a1;
}

uint64_t sub_1000C0554(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_1000C05D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);

  return a1;
}

uint64_t sub_1000C0654(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000C0668);
}

uint64_t sub_1000C066C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
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

uint64_t sub_1000C072C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000C0740);
}

uint64_t sub_1000C0744(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for URL();
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

uint64_t sub_1000C0800()
{
  uint64_t result = type metadata accessor for URL();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1000C0898()
{
  return sub_1000C0944(&qword_10015B9F0);
}

uint64_t sub_1000C08CC()
{
  return sub_1000C0944(&qword_10015B9F0);
}

uint64_t sub_1000C0900(uint64_t a1)
{
  uint64_t result = sub_1000C0944(&qword_10015B9F8);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_1000C0944(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for AnimatedArtworkPlayerViewRepresentable(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000C0988(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    sub_1000060EC(&qword_10015BAF0);
    uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v34 = v1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v33 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = &v38;
  uint64_t v7 = &v40;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t i = 0;
  unint64_t v10 = (char *)&type metadata for Any + 8;
  if (v5) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v20 = i + 1;
  if (__OFADD__(i, 1)) {
    goto LABEL_35;
  }
  if (v20 >= v33) {
    goto LABEL_32;
  }
  unint64_t v21 = *(void *)(v34 + 8 * v20);
  int64_t v22 = i + 1;
  if (!v21)
  {
    int64_t v22 = i + 2;
    if (i + 2 >= v33) {
      goto LABEL_32;
    }
    unint64_t v21 = *(void *)(v34 + 8 * v22);
    if (!v21)
    {
      int64_t v22 = i + 3;
      if (i + 3 >= v33) {
        goto LABEL_32;
      }
      unint64_t v21 = *(void *)(v34 + 8 * v22);
      if (!v21)
      {
        int64_t v22 = i + 4;
        if (i + 4 >= v33) {
          goto LABEL_32;
        }
        unint64_t v21 = *(void *)(v34 + 8 * v22);
        if (!v21)
        {
          int64_t v23 = i + 5;
          if (i + 5 < v33)
          {
            unint64_t v21 = *(void *)(v34 + 8 * v23);
            if (v21)
            {
              int64_t v22 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              int64_t v22 = v23 + 1;
              if (__OFADD__(v23, 1)) {
                goto LABEL_36;
              }
              if (v22 >= v33) {
                break;
              }
              unint64_t v21 = *(void *)(v34 + 8 * v22);
              ++v23;
              if (v21) {
                goto LABEL_26;
              }
            }
          }
LABEL_32:
          sub_10005F094();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  unint64_t v5 = (v21 - 1) & v21;
  unint64_t v19 = __clz(__rbit64(v21)) + (v22 << 6);
  for (i = v22; ; unint64_t v19 = v18 | (i << 6))
  {
    uint64_t v24 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v19);
    uint64_t v25 = *(void **)(*(void *)(v1 + 56) + 8 * v19);
    uint64_t v36 = *v24;
    uint64_t v37 = v24[1];
    sub_1000C13F8();
    swift_bridgeObjectRetain();
    id v26 = v25;
    swift_dynamicCast();
    sub_1000C1438(v6, v7);
    sub_1000C1438(v7, v41);
    sub_1000C1438(v41, &v39);
    unint64_t result = sub_1000CA380(v36, v37);
    unint64_t v27 = result;
    if (v28)
    {
      unint64_t v35 = v5;
      uint64_t v11 = v7;
      uint64_t v12 = v6;
      uint64_t v13 = v1;
      int64_t v14 = i;
      uint64_t v15 = v10;
      id v16 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *id v16 = v36;
      v16[1] = v37;
      unint64_t v10 = v15;
      int64_t i = v14;
      uint64_t v1 = v13;
      uint64_t v6 = v12;
      uint64_t v7 = v11;
      unint64_t v5 = v35;
      id v17 = (_OWORD *)(v2[7] + 32 * v27);
      _s16MusicRecognition11AnyPlaylistVwxx_0((uint64_t)v17);
      unint64_t result = (unint64_t)sub_1000C1438(&v39, v17);
      if (!v35) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    unint64_t v29 = (uint64_t *)(v2[6] + 16 * result);
    *unint64_t v29 = v36;
    v29[1] = v37;
    unint64_t result = (unint64_t)sub_1000C1438(&v39, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v30 = v2[2];
    BOOL v31 = __OFADD__(v30, 1);
    uint64_t v32 = v30 + 1;
    if (v31) {
      goto LABEL_34;
    }
    v2[2] = v32;
    if (!v5) {
      goto LABEL_11;
    }
LABEL_10:
    unint64_t v18 = __clz(__rbit64(v5));
    v5 &= v5 - 1;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_1000C0CE0()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC16MusicRecognition19LocationModuleModel___observationRegistrar;
  uint64_t v2 = type metadata accessor for ObservationRegistrar();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *((unsigned int *)*v0 + 12);
  uint64_t v4 = *((unsigned __int16 *)*v0 + 26);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_1000C0DB0()
{
  return type metadata accessor for LocationModuleModel();
}

uint64_t type metadata accessor for LocationModuleModel()
{
  uint64_t result = qword_10015BA30;
  if (!qword_10015BA30) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000C0E04()
{
  uint64_t result = type metadata accessor for ObservationRegistrar();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000C0EC0(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v4 = v3;
  unint64_t v35 = a2;
  uint64_t v36 = type metadata accessor for Date();
  uint64_t v7 = *(void *)(v36 - 8);
  __chkstk_darwin(v36);
  uint64_t v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Locale();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = [objc_allocWithZone((Class)NSDateFormatter) init];
  static Locale.current.getter();
  Class isa = Locale._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  [v14 setLocale:isa];

  NSString v16 = String._bridgeToObjectiveC()();
  [v14 setLocalizedDateFormatFromTemplate:v16];

  *(void *)(v4 + 64) = v14;
  id v17 = [objc_allocWithZone((Class)NSRelativeDateTimeFormatter) init];
  [v17 setUnitsStyle:0];
  *(void *)(v4 + 72) = v17;
  ObservationRegistrar.init()();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 40) = a3;
  swift_retain();
  swift_retain();
  id v18 = v17;
  unint64_t v19 = v35;
  Class v20 = Date._bridgeToObjectiveC()().super.isa;
  static Date.now.getter();
  Class v21 = Date._bridgeToObjectiveC()().super.isa;
  int64_t v22 = *(void (**)(char *, uint64_t))(v7 + 8);
  uint64_t v23 = v36;
  v22(v9, v36);
  id v24 = [v18 localizedStringForDate:v20 relativeToDate:v21];

  uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v27 = v26;

  *(void *)(v4 + 24) = v25;
  *(void *)(v4 + 32) = v27;
  id v28 = *(id *)(v4 + 64);
  Class v29 = Date._bridgeToObjectiveC()().super.isa;
  id v30 = [v28 stringFromDate:v29];

  uint64_t v31 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v33 = v32;

  v22(v19, v23);
  *(void *)(v4 + 48) = v31;
  *(void *)(v4 + 56) = v33;
  return v4;
}

void sub_1000C11F4(double a1, double a2, uint64_t a3, NSString a4)
{
  MKCoordinateRegion v19 = MKCoordinateRegionMakeWithDistance(*(CLLocationCoordinate2D *)&a1, 1000.0, 1000.0);
  double latitude = v19.center.latitude;
  double longitude = v19.center.longitude;
  double latitudeDelta = v19.span.latitudeDelta;
  double longitudeDelta = v19.span.longitudeDelta;
  sub_1000060EC(&qword_10015BAE8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1001118A0;
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 40) = v12;
  uint64_t v13 = self;
  *(void *)(inited + 48) = [v13 valueWithMKCoordinate:latitude longitude:longitude];
  *(void *)(inited + 56) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 64) = v14;
  *(void *)(inited + 72) = [v13 valueWithMKCoordinateSpan:latitudeDelta longitudeDelta:longitudeDelta];
  unint64_t v15 = sub_1000E8FBC(inited);
  id v16 = [objc_allocWithZone((Class)MKPlacemark) initWithCoordinate:0 addressDictionary:a1, a2];
  id v17 = [objc_allocWithZone((Class)MKMapItem) initWithPlacemark:v16];
  if (a4) {
    a4 = String._bridgeToObjectiveC()();
  }
  [v17 setName:a4];

  sub_1000C0988(v15);
  swift_bridgeObjectRelease();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v17 openInMapsWithLaunchOptions:isa];
}

unint64_t sub_1000C13F8()
{
  unint64_t result = qword_10015BAF8;
  if (!qword_10015BAF8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10015BAF8);
  }
  return result;
}

_OWORD *sub_1000C1438(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1000C1448()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000C14DC()
{
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*(void *)v0 + 80) - 8) + 8))(v0 + *(void *)(*(void *)v0 + 96));
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t type metadata accessor for ConditionalValue.Storage()
{
  return sub_100020608();
}

void *sub_1000C15A0(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

void *sub_1000C15E4(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

uint64_t sub_1000C1618(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_1000C1660(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for ConditionalValue()
{
  return sub_100020608();
}

uint64_t sub_1000C16B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return static DynamicProperty._makeProperty<A>(in:container:fieldOffset:inputs:)(a1, a2, a3, a4, a6, a5);
}

double sub_1000C16CC()
{
  return sub_1000C16F4();
}

double sub_1000C16E0()
{
  return sub_1000C16F4();
}

double sub_1000C16F4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

double sub_1000C1760()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1000C17D4()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC16MusicRecognition28SongPreviewPlaybackViewModel_previewController + 24);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC16MusicRecognition28SongPreviewPlaybackViewModel_previewController + 32);
  sub_100010740((void *)(v0 + OBJC_IVAR____TtC16MusicRecognition28SongPreviewPlaybackViewModel_previewController), v1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2);
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  id v3 = [self mainBundle];
  if (v9 == 1) {
    unint64_t v4 = 0x800000010011ACC0;
  }
  else {
    unint64_t v4 = 0x800000010011ACA0;
  }
  v10._object = (void *)0xE000000000000000;
  unint64_t v5 = 0xD000000000000015;
  v6._uint64_t countAndFlagsBits = 0;
  v6._object = (void *)0xE000000000000000;
  v10._uint64_t countAndFlagsBits = 0;
  uint64_t countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(*(Swift::String *)(&v4 - 1), (Swift::String_optional)0, (NSBundle)v3, v6, v10)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_1000C1918(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v46 = a2;
  uint64_t v47 = a3;
  long long v39 = a1;
  uint64_t v5 = sub_1000060EC(&qword_10015BD20);
  uint64_t v44 = *(void *)(v5 - 8);
  uint64_t v45 = v5;
  __chkstk_darwin(v5);
  uint64_t v43 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000060EC(&qword_10015BD28);
  uint64_t v41 = *(void *)(v7 - 8);
  uint64_t v42 = v7;
  __chkstk_darwin(v7);
  uint64_t v40 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000060EC(&qword_10015BD18);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000060EC(&qword_100159EB0);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  id v16 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = v4 + OBJC_IVAR____TtC16MusicRecognition28SongPreviewPlaybackViewModel__previewProgress;
  uint64_t v48 = 0;
  Published.init(initialValue:)();
  id v18 = *(void (**)(uint64_t, char *, uint64_t))(v14 + 32);
  v18(v17, v16, v13);
  uint64_t v19 = v4 + OBJC_IVAR____TtC16MusicRecognition28SongPreviewPlaybackViewModel__backgroundOpacity;
  uint64_t v48 = 0x3FF0000000000000;
  Published.init(initialValue:)();
  v18(v19, v16, v13);
  uint64_t v20 = v4 + OBJC_IVAR____TtC16MusicRecognition28SongPreviewPlaybackViewModel__previewButtonWidth;
  uint64_t v48 = 0;
  Published.init(initialValue:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v20, v12, v9);
  if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && _CocoaArrayWrapper.endIndex.getter()) {
    Class v21 = (void *)sub_100075F38((unint64_t)_swiftEmptyArrayStorage);
  }
  else {
    Class v21 = &_swiftEmptySetSingleton;
  }
  int64_t v22 = v39;
  *(void *)(v4 + OBJC_IVAR____TtC16MusicRecognition28SongPreviewPlaybackViewModel_cancellables) = v21;
  uint64_t v23 = (Swift::String *)(v4 + OBJC_IVAR____TtC16MusicRecognition28SongPreviewPlaybackViewModel_mediaPlaybackToolTipLabel);
  id v24 = [self mainBundle];
  v49._object = (void *)0xE000000000000000;
  v25._object = (void *)0x800000010011AC70;
  v25._uint64_t countAndFlagsBits = 0xD000000000000020;
  v26._uint64_t countAndFlagsBits = 0;
  v26._object = (void *)0xE000000000000000;
  v49._uint64_t countAndFlagsBits = 0;
  Swift::String v27 = NSLocalizedString(_:tableName:bundle:value:comment:)(v25, (Swift::String_optional)0, (NSBundle)v24, v26, v49);

  *uint64_t v23 = v27;
  sub_100009AD0((uint64_t)v22, v4 + OBJC_IVAR____TtC16MusicRecognition28SongPreviewPlaybackViewModel_previewController);
  uint64_t v28 = v47;
  *(void *)(v4 + OBJC_IVAR____TtC16MusicRecognition28SongPreviewPlaybackViewModel_buttonColor) = v46;
  *(void *)(v4 + OBJC_IVAR____TtC16MusicRecognition28SongPreviewPlaybackViewModel_backgroundColor) = v28;
  uint64_t v29 = v22[3];
  uint64_t v30 = v22[4];
  sub_100010740(v22, v29);
  uint64_t v31 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
  swift_retain();
  swift_retain();
  v31(v29, v30);
  swift_beginAccess();
  uint64_t v32 = v40;
  Published.projectedValue.getter();
  swift_endAccess();
  swift_release();
  swift_allocObject();
  swift_weakInit();
  sub_1000C242C(&qword_10015BD30, &qword_10015BD28);
  uint64_t v33 = v42;
  Publisher<>.sink(receiveValue:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v32, v33);
  swift_beginAccess();
  AnyCancellable.store(in:)();
  swift_endAccess();
  swift_release();
  uint64_t v34 = v22[3];
  uint64_t v35 = v22[4];
  sub_100010740(v22, v34);
  (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v34, v35);
  swift_beginAccess();
  sub_1000060EC(&qword_100159EB8);
  uint64_t v36 = v43;
  Published.projectedValue.getter();
  swift_endAccess();
  swift_release();
  swift_allocObject();
  swift_weakInit();
  sub_1000C242C(&qword_10015BD38, &qword_10015BD20);
  uint64_t v37 = v45;
  Publisher<>.sink(receiveValue:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v36, v37);
  swift_beginAccess();
  AnyCancellable.store(in:)();
  swift_endAccess();
  swift_release();
  swift_release();
  swift_release();
  _s16MusicRecognition11AnyPlaylistVwxx_0((uint64_t)v22);
  return v4;
}

uint64_t sub_1000C1FA8()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    return static Published.subscript.setter();
  }
  return result;
}

uint64_t sub_1000C2034(unsigned char *a1)
{
  if (*a1)
  {
    swift_beginAccess();
    uint64_t result = swift_weakLoadStrong();
    if (!result) {
      return result;
    }
  }
  else
  {
    swift_beginAccess();
    uint64_t result = swift_weakLoadStrong();
    if (!result) {
      return result;
    }
  }
  swift_getKeyPath();
  swift_getKeyPath();
  return static Published.subscript.setter();
}

uint64_t sub_1000C2108()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16MusicRecognition28SongPreviewPlaybackViewModel__previewProgress;
  uint64_t v2 = sub_1000060EC(&qword_100159EB0);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC16MusicRecognition28SongPreviewPlaybackViewModel__backgroundOpacity, v2);
  uint64_t v4 = v0 + OBJC_IVAR____TtC16MusicRecognition28SongPreviewPlaybackViewModel__previewButtonWidth;
  uint64_t v5 = sub_1000060EC(&qword_10015BD18);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  _s16MusicRecognition11AnyPlaylistVwxx_0(v0 + OBJC_IVAR____TtC16MusicRecognition28SongPreviewPlaybackViewModel_previewController);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v7 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v6, v7);
}

uint64_t sub_1000C2278()
{
  return type metadata accessor for SongPreviewPlaybackViewModel();
}

uint64_t type metadata accessor for SongPreviewPlaybackViewModel()
{
  uint64_t result = qword_10015BC50;
  if (!qword_10015BC50) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000C22CC()
{
  sub_10007DC18(319, &qword_100159E18);
  if (v0 <= 0x3F)
  {
    sub_10007DC18(319, (unint64_t *)&unk_10015BC60);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t sub_1000C23E4()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000C241C()
{
  return sub_1000C1FA8();
}

uint64_t sub_1000C2424(unsigned char *a1)
{
  return sub_1000C2034(a1);
}

uint64_t sub_1000C242C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100006224(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

double sub_1000C247C@<D0>(double *a1@<X8>)
{
  return sub_1000C24B8(a1);
}

uint64_t sub_1000C2490()
{
  return sub_1000C2548();
}

double sub_1000C24A4@<D0>(double *a1@<X8>)
{
  return sub_1000C24B8(a1);
}

double sub_1000C24B8@<D0>(double *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  double result = v3;
  *a1 = v3;
  return result;
}

uint64_t sub_1000C2534()
{
  return sub_1000C2548();
}

uint64_t sub_1000C2548()
{
  return static Published.subscript.setter();
}

double sub_1000C25C0@<D0>(double *a1@<X8>)
{
  return sub_1000C24B8(a1);
}

uint64_t sub_1000C25E8()
{
  return sub_1000C2548();
}

double sub_1000C2610@<D0>(double *a1@<X8>)
{
  return sub_1000C24B8(a1);
}

uint64_t sub_1000C2638()
{
  return sub_1000C2548();
}

uint64_t sub_1000C2670()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC16MusicRecognition28SongPreviewPlaybackViewModel_previewController + 24);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC16MusicRecognition28SongPreviewPlaybackViewModel_previewController + 32);
  sub_100010740((void *)(v0 + OBJC_IVAR____TtC16MusicRecognition28SongPreviewPlaybackViewModel_previewController), v1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2);
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  if (v5 == 1)
  {
    if (qword_100156300 != -1) {
      swift_once();
    }
    double v3 = &qword_100164CD0;
  }
  else
  {
    if (qword_1001562F8 != -1) {
      swift_once();
    }
    double v3 = &qword_100164CC0;
  }
  return *v3;
}

uint64_t sub_1000C27A8(uint64_t a1)
{
  return sub_100043C08(a1, (SEL *)&selRef_labelColor, &qword_10015BD40);
}

uint64_t sub_1000C27BC(uint64_t a1)
{
  return sub_100043C08(a1, (SEL *)&selRef_systemBackgroundColor, &qword_10015BD48);
}

uint64_t sub_1000C27D0()
{
  uint64_t result = static Color.white.getter();
  qword_10015BD50 = result;
  return result;
}

uint64_t sub_1000C27F0()
{
  uint64_t result = static Color.black.getter();
  qword_10015BD58 = result;
  return result;
}

uint64_t sub_1000C2810(uint64_t a1)
{
  uint64_t v37 = a1;
  uint64_t v2 = type metadata accessor for ColorScheme();
  uint64_t v36 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000060EC(&qword_100158950);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v34 - v9;
  uint64_t v11 = v1 + *(int *)(type metadata accessor for TrackPageMetadata() + 32);
  sub_100009C94(v11, (uint64_t)v10, &qword_100158950);
  uint64_t v12 = type metadata accessor for AnyAlbum();
  uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48);
  if (v13(v10, 1, v12) == 1)
  {
    sub_1000063D0((uint64_t)v10, &qword_100158950);
LABEL_11:
    if (qword_100156490 != -1) {
      swift_once();
    }
    uint64_t v25 = qword_10015BD40;
    swift_retain();
    return v25;
  }
  uint64_t v35 = v2;
  uint64_t v14 = &v10[*(int *)(v12 + 20)];
  uint64_t v15 = *((void *)v14 + 3);
  uint64_t v16 = *((void *)v14 + 4);
  sub_100010740(v14, v15);
  uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 16))(v15, v16);
  sub_1000C748C((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for AnyAlbum);
  if (!v17) {
    goto LABEL_11;
  }
  sub_100009C94(v11, (uint64_t)v8, &qword_100158950);
  if (v13(v8, 1, v12) == 1)
  {
    sub_1000063D0((uint64_t)v8, &qword_100158950);
LABEL_10:
    swift_release();
    goto LABEL_11;
  }
  id v18 = &v8[*(int *)(v12 + 20)];
  uint64_t v19 = *((void *)v18 + 3);
  uint64_t v20 = *((void *)v18 + 4);
  sub_100010740(v18, v19);
  uint64_t v21 = (*(uint64_t (**)(uint64_t, uint64_t))(v20 + 24))(v19, v20);
  sub_1000C748C((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for AnyAlbum);
  if (!v21) {
    goto LABEL_10;
  }
  uint64_t v22 = v35;
  uint64_t v23 = v36;
  (*(void (**)(char *, void, uint64_t))(v36 + 104))(v4, enum case for ColorScheme.light(_:), v35);
  char v24 = static ColorScheme.== infix(_:_:)();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v4, v22);
  if ((v24 & 1) == 0)
  {
    if (qword_1001564A8 == -1) {
      goto LABEL_16;
    }
    goto LABEL_34;
  }
  if (qword_1001564A0 != -1) {
LABEL_34:
  }
    swift_once();
LABEL_16:
  swift_retain();
  double v27 = sub_1000BF360();
  double v28 = sub_1000BF360();
  swift_release();
  if (v28 >= v27) {
    double v29 = v27;
  }
  else {
    double v29 = v28;
  }
  if (v27 > v28) {
    double v30 = v27;
  }
  else {
    double v30 = v28;
  }
  if ((v30 + 0.05) / (v29 + 0.05) >= 3.0)
  {
    double v31 = sub_1000BF360();
    double v32 = sub_1000BF360();
    if (v32 >= v31) {
      double v33 = v31;
    }
    else {
      double v33 = v32;
    }
    if (v31 > v32) {
      double v32 = v31;
    }
    if ((v32 + 0.05) / (v33 + 0.05) >= 4.5)
    {
      swift_release();
      return v17;
    }
    else
    {
      if (qword_100156490 != -1) {
        swift_once();
      }
      uint64_t v25 = qword_10015BD40;
      swift_retain();
      swift_release();
      swift_release();
    }
  }
  else
  {
    swift_release();
    return v21;
  }
  return v25;
}

uint64_t sub_1000C2CE0(uint64_t a1)
{
  uint64_t v37 = a1;
  uint64_t v2 = type metadata accessor for ColorScheme();
  uint64_t v36 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000060EC(&qword_100158950);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v34 - v9;
  uint64_t v11 = v1 + *(int *)(type metadata accessor for TrackPageMetadata() + 32);
  sub_100009C94(v11, (uint64_t)v10, &qword_100158950);
  uint64_t v12 = type metadata accessor for AnyAlbum();
  uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48);
  if (v13(v10, 1, v12) == 1)
  {
    sub_1000063D0((uint64_t)v10, &qword_100158950);
LABEL_11:
    if (qword_100156498 != -1) {
      swift_once();
    }
    uint64_t v25 = qword_10015BD48;
    swift_retain();
    return v25;
  }
  uint64_t v35 = v2;
  uint64_t v14 = &v10[*(int *)(v12 + 20)];
  uint64_t v15 = *((void *)v14 + 3);
  uint64_t v16 = *((void *)v14 + 4);
  sub_100010740(v14, v15);
  uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 16))(v15, v16);
  sub_1000C748C((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for AnyAlbum);
  if (!v17) {
    goto LABEL_11;
  }
  sub_100009C94(v11, (uint64_t)v8, &qword_100158950);
  if (v13(v8, 1, v12) == 1)
  {
    sub_1000063D0((uint64_t)v8, &qword_100158950);
LABEL_10:
    swift_release();
    goto LABEL_11;
  }
  id v18 = &v8[*(int *)(v12 + 20)];
  uint64_t v19 = *((void *)v18 + 3);
  uint64_t v20 = *((void *)v18 + 4);
  sub_100010740(v18, v19);
  uint64_t v21 = (*(uint64_t (**)(uint64_t, uint64_t))(v20 + 24))(v19, v20);
  sub_1000C748C((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for AnyAlbum);
  if (!v21) {
    goto LABEL_10;
  }
  uint64_t v22 = v35;
  uint64_t v23 = v36;
  (*(void (**)(char *, void, uint64_t))(v36 + 104))(v4, enum case for ColorScheme.light(_:), v35);
  char v24 = static ColorScheme.== infix(_:_:)();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v4, v22);
  if ((v24 & 1) == 0)
  {
    if (qword_1001564A8 == -1) {
      goto LABEL_16;
    }
    goto LABEL_34;
  }
  if (qword_1001564A0 != -1) {
LABEL_34:
  }
    swift_once();
LABEL_16:
  swift_retain();
  double v27 = sub_1000BF360();
  double v28 = sub_1000BF360();
  swift_release();
  if (v28 >= v27) {
    double v29 = v27;
  }
  else {
    double v29 = v28;
  }
  if (v27 > v28) {
    double v30 = v27;
  }
  else {
    double v30 = v28;
  }
  if ((v30 + 0.05) / (v29 + 0.05) >= 3.0)
  {
    double v31 = sub_1000BF360();
    double v32 = sub_1000BF360();
    if (v32 >= v31) {
      double v33 = v31;
    }
    else {
      double v33 = v32;
    }
    if (v31 > v32) {
      double v32 = v31;
    }
    if ((v32 + 0.05) / (v33 + 0.05) >= 4.5)
    {
      swift_release();
      return v21;
    }
    else
    {
      if (qword_100156498 != -1) {
        swift_once();
      }
      uint64_t v25 = qword_10015BD48;
      swift_retain();
      swift_release();
      swift_release();
    }
  }
  else
  {
    swift_release();
    return v17;
  }
  return v25;
}

uint64_t sub_1000C31B0()
{
  uint64_t v1 = sub_1000060EC(&qword_100158950);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for TrackPageMetadata();
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = [*(id *)(v0 + *(int *)(v5 + 20)) albumName];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v12 = v11;

    sub_1000C7428(v0, (uint64_t)v7);
    if (v12)
    {
      uint64_t v13 = type metadata accessor for TrackPageMetadata;
      uint64_t v14 = (uint64_t)v7;
LABEL_8:
      sub_1000C748C(v14, (uint64_t (*)(void))v13);
      return v10;
    }
  }
  else
  {
    sub_1000C7428(v0, (uint64_t)v7);
  }
  sub_100009C94((uint64_t)&v7[*(int *)(v4 + 32)], (uint64_t)v3, &qword_100158950);
  uint64_t v15 = type metadata accessor for AnyAlbum();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48))(v3, 1, v15) != 1)
  {
    uint64_t v16 = &v3[*(int *)(v15 + 20)];
    uint64_t v17 = *((void *)v16 + 3);
    uint64_t v18 = *((void *)v16 + 4);
    sub_100010740(v16, v17);
    uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 40))(v17, v18);
    sub_1000C748C((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for TrackPageMetadata);
    uint64_t v13 = type metadata accessor for AnyAlbum;
    uint64_t v14 = (uint64_t)v3;
    goto LABEL_8;
  }
  sub_1000C748C((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for TrackPageMetadata);
  sub_1000063D0((uint64_t)v3, &qword_100158950);
  return 0;
}

uint64_t sub_1000C33FC()
{
  id v1 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                             + *(int *)(type metadata accessor for TrackPageMetadata()
                                                                      + 20)), "genres"));
  uint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (*(void *)(v2 + 16))
  {
    uint64_t v3 = *(void *)(v2 + 32);
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v3 = 0;
  }
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_1000C348C()
{
  uint64_t v1 = sub_1000060EC(&qword_100158860);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for TrackPageMetadata();
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = [*(id *)(v0 + *(int *)(v5 + 20)) title];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v12 = v11;

    sub_1000C7428(v0, (uint64_t)v7);
    if (v12)
    {
      uint64_t v13 = type metadata accessor for TrackPageMetadata;
      uint64_t v14 = (uint64_t)v7;
LABEL_8:
      sub_1000C748C(v14, (uint64_t (*)(void))v13);
      return v10;
    }
  }
  else
  {
    sub_1000C7428(v0, (uint64_t)v7);
  }
  sub_100009C94((uint64_t)&v7[*(int *)(v4 + 24)], (uint64_t)v3, &qword_100158860);
  uint64_t v15 = type metadata accessor for AnySong();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48))(v3, 1, v15) != 1)
  {
    uint64_t v16 = &v3[*(int *)(v15 + 20)];
    uint64_t v17 = *((void *)v16 + 3);
    uint64_t v18 = *((void *)v16 + 4);
    sub_100010740(v16, v17);
    uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 16))(v17, v18);
    sub_1000C748C((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for TrackPageMetadata);
    uint64_t v13 = type metadata accessor for AnySong;
    uint64_t v14 = (uint64_t)v3;
    goto LABEL_8;
  }
  sub_1000C748C((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for TrackPageMetadata);
  sub_1000063D0((uint64_t)v3, &qword_100158860);
  return 0;
}

uint64_t sub_1000C36D8()
{
  uint64_t v1 = sub_1000060EC(&qword_100158860);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for TrackPageMetadata();
  id v5 = [*(id *)(v0 + *(int *)(v4 + 20)) appleMusicID];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    sub_100009C94(v0 + *(int *)(v4 + 24), (uint64_t)v3, &qword_100158860);
    uint64_t v8 = type metadata accessor for AnySong();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v3, 1, v8) == 1)
    {
      sub_1000063D0((uint64_t)v3, &qword_100158860);
      return 0;
    }
    else
    {
      uint64_t v9 = &v3[*(int *)(v8 + 20)];
      uint64_t v10 = *((void *)v9 + 3);
      uint64_t v11 = *((void *)v9 + 4);
      sub_100010740(v9, v10);
      uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(v10, v11);
      sub_1000C748C((uint64_t)v3, (uint64_t (*)(void))type metadata accessor for AnySong);
    }
  }
  return v7;
}

uint64_t type metadata accessor for TrackPageMetadata()
{
  uint64_t result = qword_10015BDB8;
  if (!qword_10015BDB8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t *sub_1000C38B4(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for UUID();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v10;
    uint64_t v11 = (char *)a1 + v9;
    uint64_t v12 = (char *)a2 + v9;
    uint64_t v13 = type metadata accessor for AnySong();
    uint64_t v14 = *(void *)(v13 - 8);
    uint64_t v15 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
    id v16 = v10;
    if (v15(v12, 1, v13))
    {
      uint64_t v17 = sub_1000060EC(&qword_100158860);
      memcpy(v11, v12, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      uint64_t v19 = type metadata accessor for URL();
      uint64_t v20 = *(void *)(v19 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v12, 1, v19))
      {
        uint64_t v21 = sub_1000060EC((uint64_t *)&unk_100158FC0);
        memcpy(v11, v12, *(void *)(*(void *)(v21 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v11, v12, v19);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v11, 0, 1, v19);
      }
      uint64_t v22 = *(int *)(v13 + 20);
      long long v23 = *(_OWORD *)&v12[v22 + 24];
      *(_OWORD *)&v11[v22 + 24] = v23;
      (**(void (***)(void))(v23 - 8))();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
    }
    uint64_t v24 = a3[7];
    uint64_t v25 = (char *)a1 + v24;
    Swift::String v26 = (char *)a2 + v24;
    uint64_t v27 = type metadata accessor for AnyArtist();
    uint64_t v28 = *(void *)(v27 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27))
    {
      uint64_t v29 = sub_1000060EC(&qword_100158958);
      memcpy(v25, v26, *(void *)(*(void *)(v29 - 8) + 64));
    }
    else
    {
      uint64_t v30 = type metadata accessor for URL();
      uint64_t v31 = *(void *)(v30 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v26, 1, v30))
      {
        uint64_t v32 = sub_1000060EC((uint64_t *)&unk_100158FC0);
        memcpy(v25, v26, *(void *)(*(void *)(v32 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v25, v26, v30);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v25, 0, 1, v30);
      }
      uint64_t v33 = *(int *)(v27 + 20);
      long long v34 = *(_OWORD *)&v26[v33 + 24];
      *(_OWORD *)&v25[v33 + 24] = v34;
      (**(void (***)(void))(v34 - 8))();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
    }
    uint64_t v35 = a3[8];
    uint64_t v36 = (char *)a1 + v35;
    uint64_t v37 = (char *)a2 + v35;
    uint64_t v38 = type metadata accessor for AnyAlbum();
    uint64_t v39 = *(void *)(v38 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48))(v37, 1, v38))
    {
      uint64_t v40 = sub_1000060EC(&qword_100158950);
      memcpy(v36, v37, *(void *)(*(void *)(v40 - 8) + 64));
    }
    else
    {
      uint64_t v41 = type metadata accessor for URL();
      uint64_t v42 = *(void *)(v41 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v42 + 48))(v37, 1, v41))
      {
        uint64_t v43 = sub_1000060EC((uint64_t *)&unk_100158FC0);
        memcpy(v36, v37, *(void *)(*(void *)(v43 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v42 + 16))(v36, v37, v41);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v42 + 56))(v36, 0, 1, v41);
      }
      uint64_t v44 = *(int *)(v38 + 20);
      long long v45 = *(_OWORD *)&v37[v44 + 24];
      *(_OWORD *)&v36[v44 + 24] = v45;
      (**(void (***)(void))(v45 - 8))();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v39 + 56))(v36, 0, 1, v38);
    }
  }
  return a1;
}

uint64_t sub_1000C3F48(uint64_t a1, int *a2)
{
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);

  uint64_t v5 = a1 + a2[6];
  uint64_t v6 = type metadata accessor for AnySong();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v5, 1, v6))
  {
    uint64_t v7 = type metadata accessor for URL();
    uint64_t v8 = *(void *)(v7 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7)) {
      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v5, v7);
    }
    _s16MusicRecognition11AnyPlaylistVwxx_0(v5 + *(int *)(v6 + 20));
  }
  uint64_t v9 = a1 + a2[7];
  uint64_t v10 = type metadata accessor for AnyArtist();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48))(v9, 1, v10))
  {
    uint64_t v11 = type metadata accessor for URL();
    uint64_t v12 = *(void *)(v11 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v9, 1, v11)) {
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v9, v11);
    }
    _s16MusicRecognition11AnyPlaylistVwxx_0(v9 + *(int *)(v10 + 20));
  }
  uint64_t v13 = a1 + a2[8];
  uint64_t v14 = type metadata accessor for AnyAlbum();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48))(v13, 1, v14);
  if (!result)
  {
    uint64_t v16 = type metadata accessor for URL();
    uint64_t v17 = *(void *)(v16 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v17 + 48))(v13, 1, v16)) {
      (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v13, v16);
    }
    uint64_t v18 = v13 + *(int *)(v14 + 20);
    return _s16MusicRecognition11AnyPlaylistVwxx_0(v18);
  }
  return result;
}

uint64_t sub_1000C4280(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v9;
  uint64_t v10 = (char *)(a1 + v8);
  uint64_t v11 = (char *)(a2 + v8);
  uint64_t v12 = type metadata accessor for AnySong();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
  id v15 = v9;
  if (v14(v11, 1, v12))
  {
    uint64_t v16 = sub_1000060EC(&qword_100158860);
    memcpy(v10, v11, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    uint64_t v17 = type metadata accessor for URL();
    uint64_t v18 = *(void *)(v17 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v11, 1, v17))
    {
      uint64_t v19 = sub_1000060EC((uint64_t *)&unk_100158FC0);
      memcpy(v10, v11, *(void *)(*(void *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v10, v11, v17);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v10, 0, 1, v17);
    }
    uint64_t v20 = *(int *)(v12 + 20);
    long long v21 = *(_OWORD *)&v11[v20 + 24];
    *(_OWORD *)&v10[v20 + 24] = v21;
    (**(void (***)(void))(v21 - 8))();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  uint64_t v22 = a3[7];
  long long v23 = (char *)(a1 + v22);
  uint64_t v24 = (char *)(a2 + v22);
  uint64_t v25 = type metadata accessor for AnyArtist();
  uint64_t v26 = *(void *)(v25 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25))
  {
    uint64_t v27 = sub_1000060EC(&qword_100158958);
    memcpy(v23, v24, *(void *)(*(void *)(v27 - 8) + 64));
  }
  else
  {
    uint64_t v28 = type metadata accessor for URL();
    uint64_t v29 = *(void *)(v28 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v24, 1, v28))
    {
      uint64_t v30 = sub_1000060EC((uint64_t *)&unk_100158FC0);
      memcpy(v23, v24, *(void *)(*(void *)(v30 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v23, v24, v28);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v23, 0, 1, v28);
    }
    uint64_t v31 = *(int *)(v25 + 20);
    long long v32 = *(_OWORD *)&v24[v31 + 24];
    *(_OWORD *)&v23[v31 + 24] = v32;
    (**(void (***)(void))(v32 - 8))();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
  }
  uint64_t v33 = a3[8];
  long long v34 = (char *)(a1 + v33);
  uint64_t v35 = (char *)(a2 + v33);
  uint64_t v36 = type metadata accessor for AnyAlbum();
  uint64_t v37 = *(void *)(v36 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v35, 1, v36))
  {
    uint64_t v38 = sub_1000060EC(&qword_100158950);
    memcpy(v34, v35, *(void *)(*(void *)(v38 - 8) + 64));
  }
  else
  {
    uint64_t v39 = type metadata accessor for URL();
    uint64_t v40 = *(void *)(v39 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v35, 1, v39))
    {
      uint64_t v41 = sub_1000060EC((uint64_t *)&unk_100158FC0);
      memcpy(v34, v35, *(void *)(*(void *)(v41 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v34, v35, v39);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v40 + 56))(v34, 0, 1, v39);
    }
    uint64_t v42 = *(int *)(v36 + 20);
    long long v43 = *(_OWORD *)&v35[v42 + 24];
    *(_OWORD *)&v34[v42 + 24] = v43;
    (**(void (***)(void))(v43 - 8))();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v34, 0, 1, v36);
  }
  return a1;
}

uint64_t sub_1000C48C4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = *(void **)(a2 + v7);
  uint64_t v9 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = v8;
  id v10 = v8;

  uint64_t v11 = a3[6];
  uint64_t v12 = (char *)(a1 + v11);
  uint64_t v13 = (char *)(a2 + v11);
  uint64_t v14 = type metadata accessor for AnySong();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48);
  int v17 = v16(v12, 1, v14);
  int v18 = v16(v13, 1, v14);
  if (!v17)
  {
    if (v18)
    {
      sub_1000C748C((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for AnySong);
      goto LABEL_7;
    }
    uint64_t v23 = type metadata accessor for URL();
    uint64_t v73 = *(void *)(v23 - 8);
    uint64_t v24 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v73 + 48);
    int v25 = v24(v12, 1, v23);
    int v26 = v24(v13, 1, v23);
    if (v25)
    {
      if (!v26)
      {
        (*(void (**)(char *, char *, uint64_t))(v73 + 16))(v12, v13, v23);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v73 + 56))(v12, 0, 1, v23);
LABEL_16:
        sub_100018AC4((uint64_t *)&v12[*(int *)(v14 + 20)], (uint64_t *)&v13[*(int *)(v14 + 20)]);
        goto LABEL_17;
      }
    }
    else
    {
      if (!v26)
      {
        (*(void (**)(char *, char *, uint64_t))(v73 + 24))(v12, v13, v23);
        goto LABEL_16;
      }
      (*(void (**)(char *, uint64_t))(v73 + 8))(v12, v23);
    }
    uint64_t v30 = sub_1000060EC((uint64_t *)&unk_100158FC0);
    memcpy(v12, v13, *(void *)(*(void *)(v30 - 8) + 64));
    goto LABEL_16;
  }
  if (v18)
  {
LABEL_7:
    uint64_t v22 = sub_1000060EC(&qword_100158860);
    memcpy(v12, v13, *(void *)(*(void *)(v22 - 8) + 64));
    goto LABEL_17;
  }
  uint64_t v19 = type metadata accessor for URL();
  uint64_t v20 = *(void *)(v19 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v13, 1, v19))
  {
    uint64_t v21 = sub_1000060EC((uint64_t *)&unk_100158FC0);
    memcpy(v12, v13, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v12, v13, v19);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v12, 0, 1, v19);
  }
  uint64_t v27 = *(int *)(v14 + 20);
  uint64_t v28 = &v12[v27];
  uint64_t v29 = *(void *)&v13[v27 + 24];
  *((void *)v28 + 3) = v29;
  *((void *)v28 + 4) = *(void *)&v13[v27 + 32];
  (**(void (***)(void))(v29 - 8))();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
LABEL_17:
  uint64_t v31 = a3[7];
  long long v32 = (char *)(a1 + v31);
  uint64_t v33 = (char *)(a2 + v31);
  uint64_t v34 = type metadata accessor for AnyArtist();
  uint64_t v35 = *(void *)(v34 - 8);
  uint64_t v36 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v35 + 48);
  int v37 = v36(v32, 1, v34);
  int v38 = v36(v33, 1, v34);
  if (!v37)
  {
    if (v38)
    {
      sub_1000C748C((uint64_t)v32, (uint64_t (*)(void))type metadata accessor for AnyArtist);
      goto LABEL_23;
    }
    uint64_t v43 = type metadata accessor for URL();
    uint64_t v74 = *(void *)(v43 - 8);
    uint64_t v44 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v74 + 48);
    int v45 = v44(v32, 1, v43);
    int v46 = v44(v33, 1, v43);
    if (v45)
    {
      if (!v46)
      {
        (*(void (**)(char *, char *, uint64_t))(v74 + 16))(v32, v33, v43);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v74 + 56))(v32, 0, 1, v43);
LABEL_32:
        sub_100018AC4((uint64_t *)&v32[*(int *)(v34 + 20)], (uint64_t *)&v33[*(int *)(v34 + 20)]);
        goto LABEL_33;
      }
    }
    else
    {
      if (!v46)
      {
        (*(void (**)(char *, char *, uint64_t))(v74 + 24))(v32, v33, v43);
        goto LABEL_32;
      }
      (*(void (**)(char *, uint64_t))(v74 + 8))(v32, v43);
    }
    uint64_t v50 = sub_1000060EC((uint64_t *)&unk_100158FC0);
    memcpy(v32, v33, *(void *)(*(void *)(v50 - 8) + 64));
    goto LABEL_32;
  }
  if (v38)
  {
LABEL_23:
    uint64_t v42 = sub_1000060EC(&qword_100158958);
    memcpy(v32, v33, *(void *)(*(void *)(v42 - 8) + 64));
    goto LABEL_33;
  }
  uint64_t v39 = type metadata accessor for URL();
  uint64_t v40 = *(void *)(v39 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v33, 1, v39))
  {
    uint64_t v41 = sub_1000060EC((uint64_t *)&unk_100158FC0);
    memcpy(v32, v33, *(void *)(*(void *)(v41 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v32, v33, v39);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v40 + 56))(v32, 0, 1, v39);
  }
  uint64_t v47 = *(int *)(v34 + 20);
  uint64_t v48 = &v32[v47];
  uint64_t v49 = *(void *)&v33[v47 + 24];
  *((void *)v48 + 3) = v49;
  *((void *)v48 + 4) = *(void *)&v33[v47 + 32];
  (**(void (***)(void))(v49 - 8))();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v35 + 56))(v32, 0, 1, v34);
LABEL_33:
  uint64_t v51 = a3[8];
  v52 = (char *)(a1 + v51);
  v53 = (char *)(a2 + v51);
  uint64_t v54 = type metadata accessor for AnyAlbum();
  uint64_t v55 = *(void *)(v54 - 8);
  v56 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v55 + 48);
  int v57 = v56(v52, 1, v54);
  int v58 = v56(v53, 1, v54);
  if (!v57)
  {
    if (v58)
    {
      sub_1000C748C((uint64_t)v52, (uint64_t (*)(void))type metadata accessor for AnyAlbum);
      goto LABEL_39;
    }
    uint64_t v63 = type metadata accessor for URL();
    uint64_t v64 = *(void *)(v63 - 8);
    v65 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v64 + 48);
    int v66 = v65(v52, 1, v63);
    int v67 = v65(v53, 1, v63);
    if (v66)
    {
      if (!v67)
      {
        (*(void (**)(char *, char *, uint64_t))(v64 + 16))(v52, v53, v63);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v64 + 56))(v52, 0, 1, v63);
LABEL_48:
        sub_100018AC4((uint64_t *)&v52[*(int *)(v54 + 20)], (uint64_t *)&v53[*(int *)(v54 + 20)]);
        return a1;
      }
    }
    else
    {
      if (!v67)
      {
        (*(void (**)(char *, char *, uint64_t))(v64 + 24))(v52, v53, v63);
        goto LABEL_48;
      }
      (*(void (**)(char *, uint64_t))(v64 + 8))(v52, v63);
    }
    uint64_t v71 = sub_1000060EC((uint64_t *)&unk_100158FC0);
    memcpy(v52, v53, *(void *)(*(void *)(v71 - 8) + 64));
    goto LABEL_48;
  }
  if (v58)
  {
LABEL_39:
    uint64_t v62 = sub_1000060EC(&qword_100158950);
    memcpy(v52, v53, *(void *)(*(void *)(v62 - 8) + 64));
    return a1;
  }
  uint64_t v59 = type metadata accessor for URL();
  uint64_t v60 = *(void *)(v59 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v60 + 48))(v53, 1, v59))
  {
    uint64_t v61 = sub_1000060EC((uint64_t *)&unk_100158FC0);
    memcpy(v52, v53, *(void *)(*(void *)(v61 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v60 + 16))(v52, v53, v59);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v60 + 56))(v52, 0, 1, v59);
  }
  uint64_t v68 = *(int *)(v54 + 20);
  v69 = &v52[v68];
  uint64_t v70 = *(void *)&v53[v68 + 24];
  *((void *)v69 + 3) = v70;
  *((void *)v69 + 4) = *(void *)&v53[v68 + 32];
  (**(void (***)(void))(v70 - 8))();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v55 + 56))(v52, 0, 1, v54);
  return a1;
}

uint64_t sub_1000C53F0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v8 = (char *)(a1 + v7);
  uint64_t v9 = (char *)(a2 + v7);
  uint64_t v10 = type metadata accessor for AnySong();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = sub_1000060EC(&qword_100158860);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    uint64_t v13 = type metadata accessor for URL();
    uint64_t v14 = *(void *)(v13 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v9, 1, v13))
    {
      uint64_t v15 = sub_1000060EC((uint64_t *)&unk_100158FC0);
      memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v8, v9, v13);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v8, 0, 1, v13);
    }
    uint64_t v16 = *(int *)(v10 + 20);
    int v17 = &v8[v16];
    int v18 = &v9[v16];
    long long v19 = *((_OWORD *)v18 + 1);
    *(_OWORD *)int v17 = *(_OWORD *)v18;
    *((_OWORD *)v17 + 1) = v19;
    *((void *)v17 + 4) = *((void *)v18 + 4);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v20 = a3[7];
  uint64_t v21 = (char *)(a1 + v20);
  uint64_t v22 = (char *)(a2 + v20);
  uint64_t v23 = type metadata accessor for AnyArtist();
  uint64_t v24 = *(void *)(v23 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
  {
    uint64_t v25 = sub_1000060EC(&qword_100158958);
    memcpy(v21, v22, *(void *)(*(void *)(v25 - 8) + 64));
  }
  else
  {
    uint64_t v26 = type metadata accessor for URL();
    uint64_t v27 = *(void *)(v26 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v22, 1, v26))
    {
      uint64_t v28 = sub_1000060EC((uint64_t *)&unk_100158FC0);
      memcpy(v21, v22, *(void *)(*(void *)(v28 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v21, v22, v26);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v21, 0, 1, v26);
    }
    uint64_t v29 = *(int *)(v23 + 20);
    uint64_t v30 = &v21[v29];
    uint64_t v31 = &v22[v29];
    long long v32 = *((_OWORD *)v31 + 1);
    *(_OWORD *)uint64_t v30 = *(_OWORD *)v31;
    *((_OWORD *)v30 + 1) = v32;
    *((void *)v30 + 4) = *((void *)v31 + 4);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
  }
  uint64_t v33 = a3[8];
  uint64_t v34 = (char *)(a1 + v33);
  uint64_t v35 = (char *)(a2 + v33);
  uint64_t v36 = type metadata accessor for AnyAlbum();
  uint64_t v37 = *(void *)(v36 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v35, 1, v36))
  {
    uint64_t v38 = sub_1000060EC(&qword_100158950);
    memcpy(v34, v35, *(void *)(*(void *)(v38 - 8) + 64));
  }
  else
  {
    uint64_t v39 = type metadata accessor for URL();
    uint64_t v40 = *(void *)(v39 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v35, 1, v39))
    {
      uint64_t v41 = sub_1000060EC((uint64_t *)&unk_100158FC0);
      memcpy(v34, v35, *(void *)(*(void *)(v41 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v40 + 32))(v34, v35, v39);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v40 + 56))(v34, 0, 1, v39);
    }
    uint64_t v42 = *(int *)(v36 + 20);
    uint64_t v43 = &v34[v42];
    uint64_t v44 = &v35[v42];
    long long v45 = *((_OWORD *)v44 + 1);
    *(_OWORD *)uint64_t v43 = *(_OWORD *)v44;
    *((_OWORD *)v43 + 1) = v45;
    *((void *)v43 + 4) = *((void *)v44 + 4);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v34, 0, 1, v36);
  }
  return a1;
}

uint64_t sub_1000C59C4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);

  uint64_t v9 = a3[6];
  uint64_t v10 = (char *)(a1 + v9);
  uint64_t v11 = (char *)(a2 + v9);
  uint64_t v12 = type metadata accessor for AnySong();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (v16)
    {
      sub_1000C748C((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for AnySong);
      goto LABEL_7;
    }
    uint64_t v21 = type metadata accessor for URL();
    uint64_t v86 = *(void *)(v21 - 8);
    uint64_t v22 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v86 + 48);
    int v23 = v22(v10, 1, v21);
    int v24 = v22(v11, 1, v21);
    if (v23)
    {
      if (!v24)
      {
        (*(void (**)(char *, char *, uint64_t))(v86 + 32))(v10, v11, v21);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v86 + 56))(v10, 0, 1, v21);
LABEL_16:
        uint64_t v30 = *(int *)(v12 + 20);
        uint64_t v31 = (uint64_t)&v10[v30];
        long long v32 = &v11[v30];
        _s16MusicRecognition11AnyPlaylistVwxx_0(v31);
        long long v33 = *((_OWORD *)v32 + 1);
        *(_OWORD *)uint64_t v31 = *(_OWORD *)v32;
        *(_OWORD *)(v31 + 16) = v33;
        *(void *)(v31 + 32) = *((void *)v32 + 4);
        goto LABEL_17;
      }
    }
    else
    {
      if (!v24)
      {
        (*(void (**)(char *, char *, uint64_t))(v86 + 40))(v10, v11, v21);
        goto LABEL_16;
      }
      (*(void (**)(char *, uint64_t))(v86 + 8))(v10, v21);
    }
    uint64_t v29 = sub_1000060EC((uint64_t *)&unk_100158FC0);
    memcpy(v10, v11, *(void *)(*(void *)(v29 - 8) + 64));
    goto LABEL_16;
  }
  if (v16)
  {
LABEL_7:
    uint64_t v20 = sub_1000060EC(&qword_100158860);
    memcpy(v10, v11, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_17;
  }
  uint64_t v17 = type metadata accessor for URL();
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v11, 1, v17))
  {
    uint64_t v19 = sub_1000060EC((uint64_t *)&unk_100158FC0);
    memcpy(v10, v11, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v10, v11, v17);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v10, 0, 1, v17);
  }
  uint64_t v25 = *(int *)(v12 + 20);
  uint64_t v26 = &v10[v25];
  uint64_t v27 = &v11[v25];
  long long v28 = *((_OWORD *)v27 + 1);
  *(_OWORD *)uint64_t v26 = *(_OWORD *)v27;
  *((_OWORD *)v26 + 1) = v28;
  *((void *)v26 + 4) = *((void *)v27 + 4);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
LABEL_17:
  uint64_t v34 = a3[7];
  uint64_t v35 = (char *)(a1 + v34);
  uint64_t v36 = (char *)(a2 + v34);
  uint64_t v37 = type metadata accessor for AnyArtist();
  uint64_t v38 = *(void *)(v37 - 8);
  uint64_t v39 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v38 + 48);
  int v40 = v39(v35, 1, v37);
  int v41 = v39(v36, 1, v37);
  if (!v40)
  {
    if (v41)
    {
      sub_1000C748C((uint64_t)v35, (uint64_t (*)(void))type metadata accessor for AnyArtist);
      goto LABEL_23;
    }
    uint64_t v46 = type metadata accessor for URL();
    uint64_t v87 = *(void *)(v46 - 8);
    uint64_t v47 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v87 + 48);
    int v48 = v47(v35, 1, v46);
    int v49 = v47(v36, 1, v46);
    if (v48)
    {
      if (!v49)
      {
        (*(void (**)(char *, char *, uint64_t))(v87 + 32))(v35, v36, v46);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v87 + 56))(v35, 0, 1, v46);
LABEL_32:
        uint64_t v55 = *(int *)(v37 + 20);
        uint64_t v56 = (uint64_t)&v35[v55];
        int v57 = &v36[v55];
        _s16MusicRecognition11AnyPlaylistVwxx_0(v56);
        long long v58 = *((_OWORD *)v57 + 1);
        *(_OWORD *)uint64_t v56 = *(_OWORD *)v57;
        *(_OWORD *)(v56 + 16) = v58;
        *(void *)(v56 + 32) = *((void *)v57 + 4);
        goto LABEL_33;
      }
    }
    else
    {
      if (!v49)
      {
        (*(void (**)(char *, char *, uint64_t))(v87 + 40))(v35, v36, v46);
        goto LABEL_32;
      }
      (*(void (**)(char *, uint64_t))(v87 + 8))(v35, v46);
    }
    uint64_t v54 = sub_1000060EC((uint64_t *)&unk_100158FC0);
    memcpy(v35, v36, *(void *)(*(void *)(v54 - 8) + 64));
    goto LABEL_32;
  }
  if (v41)
  {
LABEL_23:
    uint64_t v45 = sub_1000060EC(&qword_100158958);
    memcpy(v35, v36, *(void *)(*(void *)(v45 - 8) + 64));
    goto LABEL_33;
  }
  uint64_t v42 = type metadata accessor for URL();
  uint64_t v43 = *(void *)(v42 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v43 + 48))(v36, 1, v42))
  {
    uint64_t v44 = sub_1000060EC((uint64_t *)&unk_100158FC0);
    memcpy(v35, v36, *(void *)(*(void *)(v44 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v43 + 32))(v35, v36, v42);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v43 + 56))(v35, 0, 1, v42);
  }
  uint64_t v50 = *(int *)(v37 + 20);
  uint64_t v51 = &v35[v50];
  v52 = &v36[v50];
  long long v53 = *((_OWORD *)v52 + 1);
  *(_OWORD *)uint64_t v51 = *(_OWORD *)v52;
  *((_OWORD *)v51 + 1) = v53;
  *((void *)v51 + 4) = *((void *)v52 + 4);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v38 + 56))(v35, 0, 1, v37);
LABEL_33:
  uint64_t v59 = a3[8];
  uint64_t v60 = (char *)(a1 + v59);
  uint64_t v61 = (char *)(a2 + v59);
  uint64_t v62 = type metadata accessor for AnyAlbum();
  uint64_t v63 = *(void *)(v62 - 8);
  uint64_t v64 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v63 + 48);
  int v65 = v64(v60, 1, v62);
  int v66 = v64(v61, 1, v62);
  if (!v65)
  {
    if (v66)
    {
      sub_1000C748C((uint64_t)v60, (uint64_t (*)(void))type metadata accessor for AnyAlbum);
      goto LABEL_39;
    }
    uint64_t v71 = type metadata accessor for URL();
    uint64_t v72 = *(void *)(v71 - 8);
    uint64_t v73 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v72 + 48);
    int v74 = v73(v60, 1, v71);
    int v75 = v73(v61, 1, v71);
    if (v74)
    {
      if (!v75)
      {
        (*(void (**)(char *, char *, uint64_t))(v72 + 32))(v60, v61, v71);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v72 + 56))(v60, 0, 1, v71);
LABEL_48:
        uint64_t v81 = *(int *)(v62 + 20);
        uint64_t v82 = (uint64_t)&v60[v81];
        v83 = &v61[v81];
        _s16MusicRecognition11AnyPlaylistVwxx_0(v82);
        long long v84 = *((_OWORD *)v83 + 1);
        *(_OWORD *)uint64_t v82 = *(_OWORD *)v83;
        *(_OWORD *)(v82 + 16) = v84;
        *(void *)(v82 + 32) = *((void *)v83 + 4);
        return a1;
      }
    }
    else
    {
      if (!v75)
      {
        (*(void (**)(char *, char *, uint64_t))(v72 + 40))(v60, v61, v71);
        goto LABEL_48;
      }
      (*(void (**)(char *, uint64_t))(v72 + 8))(v60, v71);
    }
    uint64_t v80 = sub_1000060EC((uint64_t *)&unk_100158FC0);
    memcpy(v60, v61, *(void *)(*(void *)(v80 - 8) + 64));
    goto LABEL_48;
  }
  if (v66)
  {
LABEL_39:
    uint64_t v70 = sub_1000060EC(&qword_100158950);
    memcpy(v60, v61, *(void *)(*(void *)(v70 - 8) + 64));
    return a1;
  }
  uint64_t v67 = type metadata accessor for URL();
  uint64_t v68 = *(void *)(v67 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v68 + 48))(v61, 1, v67))
  {
    uint64_t v69 = sub_1000060EC((uint64_t *)&unk_100158FC0);
    memcpy(v60, v61, *(void *)(*(void *)(v69 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v68 + 32))(v60, v61, v67);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v68 + 56))(v60, 0, 1, v67);
  }
  uint64_t v76 = *(int *)(v62 + 20);
  v77 = &v60[v76];
  v78 = &v61[v76];
  long long v79 = *((_OWORD *)v78 + 1);
  *(_OWORD *)v77 = *(_OWORD *)v78;
  *((_OWORD *)v77 + 1) = v79;
  *((void *)v77 + 4) = *((void *)v78 + 4);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v63 + 56))(v60, 0, 1, v62);
  return a1;
}

uint64_t sub_1000C64B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000C64C4);
}

uint64_t sub_1000C64C4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_12:
    return v9(v10, a2, v8);
  }
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v11 = *(void *)(a1 + a3[5]);
    if (v11 >= 0xFFFFFFFF) {
      LODWORD(v11) = -1;
    }
    return (v11 + 1);
  }
  uint64_t v13 = sub_1000060EC(&qword_100158860);
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a2)
  {
    uint64_t v8 = v13;
    uint64_t v14 = *(void *)(v13 - 8);
    uint64_t v15 = a3[6];
LABEL_11:
    uint64_t v10 = a1 + v15;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
    goto LABEL_12;
  }
  uint64_t v16 = sub_1000060EC(&qword_100158958);
  if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a2)
  {
    uint64_t v8 = v16;
    uint64_t v14 = *(void *)(v16 - 8);
    uint64_t v15 = a3[7];
    goto LABEL_11;
  }
  uint64_t v17 = sub_1000060EC(&qword_100158950);
  uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 48);
  uint64_t v19 = v17;
  uint64_t v20 = a1 + a3[8];

  return v18(v20, a2, v19);
}

uint64_t sub_1000C669C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000C66B0);
}

uint64_t sub_1000C66B0(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_10:
    return v11(v12, a2, a2, v10);
  }
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + a4[5]) = (a2 - 1);
    return result;
  }
  uint64_t v13 = sub_1000060EC(&qword_100158860);
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v14 = *(void *)(v13 - 8);
    uint64_t v15 = a4[6];
LABEL_9:
    uint64_t v12 = a1 + v15;
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_10;
  }
  uint64_t v16 = sub_1000060EC(&qword_100158958);
  if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a3)
  {
    uint64_t v10 = v16;
    uint64_t v14 = *(void *)(v16 - 8);
    uint64_t v15 = a4[7];
    goto LABEL_9;
  }
  uint64_t v17 = sub_1000060EC(&qword_100158950);
  uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
  uint64_t v19 = v17;
  uint64_t v20 = a1 + a4[8];

  return v18(v20, a2, a2, v19);
}

void sub_1000C6888()
{
  type metadata accessor for UUID();
  if (v0 <= 0x3F)
  {
    sub_1000C6A28(319, &qword_10015BDC8, (void (*)(uint64_t))type metadata accessor for AnySong);
    if (v1 <= 0x3F)
    {
      sub_1000C6A28(319, &qword_10015BDD0, (void (*)(uint64_t))type metadata accessor for AnyArtist);
      if (v2 <= 0x3F)
      {
        sub_1000C6A28(319, (unint64_t *)&unk_10015BDD8, (void (*)(uint64_t))type metadata accessor for AnyAlbum);
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

void sub_1000C6A28(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = type metadata accessor for Optional();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_1000C6A7C()
{
  return sub_1000C73E0((unint64_t *)&qword_1001580C8, (void (*)(uint64_t))&type metadata accessor for UUID);
}

uint64_t sub_1000C6AC4()
{
  uint64_t v1 = sub_1000060EC(&qword_100158958);
  __chkstk_darwin(v1 - 8);
  unint64_t v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for TrackPageMetadata();
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = [*(id *)(v0 + *(int *)(v5 + 20)) artist];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v12 = v11;

    sub_1000C7428(v0, (uint64_t)v7);
    if (v12)
    {
      uint64_t v13 = type metadata accessor for TrackPageMetadata;
      uint64_t v14 = (uint64_t)v7;
LABEL_8:
      sub_1000C748C(v14, (uint64_t (*)(void))v13);
      return v10;
    }
  }
  else
  {
    sub_1000C7428(v0, (uint64_t)v7);
  }
  sub_100009C94((uint64_t)&v7[*(int *)(v4 + 28)], (uint64_t)v3, &qword_100158958);
  uint64_t v15 = type metadata accessor for AnyArtist();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48))(v3, 1, v15) != 1)
  {
    uint64_t v16 = &v3[*(int *)(v15 + 20)];
    uint64_t v17 = *((void *)v16 + 3);
    uint64_t v18 = *((void *)v16 + 4);
    sub_100010740(v16, v17);
    uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 16))(v17, v18);
    sub_1000C748C((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for TrackPageMetadata);
    uint64_t v13 = type metadata accessor for AnyArtist;
    uint64_t v14 = (uint64_t)v3;
    goto LABEL_8;
  }
  sub_1000C748C((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for TrackPageMetadata);
  sub_1000063D0((uint64_t)v3, &qword_100158958);
  return 0;
}

uint64_t sub_1000C6D10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000C6D2C(a1, (SEL *)&selRef_creationDate, a2);
}

uint64_t sub_1000C6D20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000C6D2C(a1, (SEL *)&selRef_releaseDate, a2);
}

uint64_t sub_1000C6D2C@<X0>(uint64_t a1@<X0>, SEL *a2@<X2>, uint64_t a3@<X8>)
{
  id v5 = [*(id *)(v3 + *(int *)(a1 + 20)) *a2];
  if (v5)
  {
    uint64_t v6 = v5;
    static Date._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v7 = type metadata accessor for Date();
    id v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = a3;
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v12 = type metadata accessor for Date();
    id v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v9 = v12;
    uint64_t v10 = a3;
    uint64_t v11 = 1;
  }

  return v8(v10, v11, 1, v9);
}

uint64_t sub_1000C6DF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_1000060EC(&qword_100158950);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009C94(v2 + *(int *)(a1 + 32), (uint64_t)v7, &qword_100158950);
  uint64_t v8 = type metadata accessor for AnyAlbum();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v7, 1, v8) == 1)
  {
    sub_1000063D0((uint64_t)v7, &qword_100158950);
    uint64_t v9 = type metadata accessor for URL();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(a2, 1, 1, v9);
  }
  else
  {
    sub_100009C94((uint64_t)v7, a2, (uint64_t *)&unk_100158FC0);
    return sub_1000C748C((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for AnyAlbum);
  }
}

uint64_t sub_1000C6F58(uint64_t a1)
{
  uint64_t v3 = sub_1000060EC(&qword_100158950);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009C94(v1 + *(int *)(a1 + 32), (uint64_t)v5, &qword_100158950);
  uint64_t v6 = type metadata accessor for AnyAlbum();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v5, 1, v6) == 1)
  {
    sub_1000063D0((uint64_t)v5, &qword_100158950);
    return 0;
  }
  else
  {
    uint64_t v8 = &v5[*(int *)(v6 + 20)];
    uint64_t v9 = *((void *)v8 + 3);
    uint64_t v10 = *((void *)v8 + 4);
    sub_100010740(v8, v9);
    uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 32))(v9, v10);
    sub_1000C748C((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for AnyAlbum);
  }
  return v7;
}

uint64_t sub_1000C70A8(uint64_t a1)
{
  uint64_t v3 = sub_1000060EC(&qword_100158860);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009C94(v1 + *(int *)(a1 + 24), (uint64_t)v5, &qword_100158860);
  uint64_t v6 = type metadata accessor for AnySong();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v5, 1, v6) == 1)
  {
    sub_1000063D0((uint64_t)v5, &qword_100158860);
    return 0;
  }
  else
  {
    uint64_t v8 = &v5[*(int *)(v6 + 20)];
    uint64_t v9 = *((void *)v8 + 3);
    uint64_t v10 = *((void *)v8 + 4);
    sub_100010740(v8, v9);
    uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 24))(v9, v10);
    sub_1000C748C((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for AnySong);
  }
  return v7;
}

uint64_t sub_1000C71F8(uint64_t a1)
{
  uint64_t v3 = sub_1000060EC(&qword_100158860);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009C94(v1 + *(int *)(a1 + 24), (uint64_t)v5, &qword_100158860);
  uint64_t v6 = type metadata accessor for AnySong();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v5, 1, v6) == 1)
  {
    sub_1000063D0((uint64_t)v5, &qword_100158860);
    return 0;
  }
  else
  {
    uint64_t v8 = &v5[*(int *)(v6 + 20)];
    uint64_t v9 = *((void *)v8 + 3);
    uint64_t v10 = *((void *)v8 + 4);
    sub_100010740(v8, v9);
    uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 32))(v9, v10);
    sub_1000C748C((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for AnySong);
  }
  return v7;
}

id sub_1000C7348(uint64_t a1)
{
  id v2 = [*(id *)(v1 + *(int *)(a1 + 20)) matchLocation];

  return v2;
}

uint64_t sub_1000C7388(uint64_t a1)
{
  uint64_t result = sub_1000C73E0(&qword_10015BE18, (void (*)(uint64_t))type metadata accessor for TrackPageMetadata);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_1000C73E0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000C7428(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TrackPageMetadata();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000C748C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

id sub_1000C74EC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = self;
  id v5 = [v4 mainBundle];
  v20._object = (void *)0xE000000000000000;
  v6._object = (void *)0x800000010011AD50;
  v6._uint64_t countAndFlagsBits = 0xD00000000000001ELL;
  v7._uint64_t countAndFlagsBits = 0;
  v7._object = (void *)0xE000000000000000;
  v20._uint64_t countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v6, (Swift::String_optional)0, (NSBundle)v5, v7, v20);

  if (a1)
  {
    swift_errorRetain();
    sub_1000060EC(&qword_1001577C8);
    sub_1000150F8(0, (unint64_t *)&qword_100159978);
    if (swift_dynamicCast())
    {
      uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v10 = v9;
      uint64_t v11 = sub_100075DC8((uint64_t)&off_100148F40);
      uint64_t v12 = (void *)sub_1000DFF5C(v8, v10, v11);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v12)
      {
        swift_bridgeObjectRelease();

        id v13 = [v4 mainBundle];
        v14._uint64_t countAndFlagsBits = 0xD000000000000023;
        v21._object = (void *)0xE000000000000000;
        v14._object = (void *)0x800000010011ADA0;
        v15._uint64_t countAndFlagsBits = 0;
        v15._object = (void *)0xE000000000000000;
        v21._uint64_t countAndFlagsBits = 0;
        NSLocalizedString(_:tableName:bundle:value:comment:)(v14, (Swift::String_optional)0, (NSBundle)v13, v15, v21);
      }
    }
  }
  uint64_t v16 = *(void **)(v2 + OBJC_IVAR____TtC16MusicRecognition11NoMatchView_noMatchLabel);
  NSString v17 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v16 setText:v17];

  return [v16 setNeedsDisplay];
}

void sub_1000C7710()
{
  qword_10015BE20 = 0x6C632E776F727261;
  *(void *)algn_10015BE28 = 0xEF657369776B636FLL;
}

id sub_1000C7740()
{
  id result = [objc_allocWithZone((Class)UIColor) initWithRed:0.262745098 green:0.533333333 blue:0.996078431 alpha:1.0];
  qword_10015BE30 = (uint64_t)result;
  return result;
}

id sub_1000C7794()
{
  id result = [objc_allocWithZone((Class)UIColor) initWithRed:0.0588235294 green:0.129411765 blue:0.250980392 alpha:1.0];
  qword_10015BE38 = (uint64_t)result;
  return result;
}

id sub_1000C77EC(double a1, double a2, double a3, double a4)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v10 = OBJC_IVAR____TtC16MusicRecognition11NoMatchView_noMatchLabel;
  id v11 = objc_allocWithZone((Class)UILabel);
  uint64_t v12 = v4;
  *(void *)&v4[v10] = [v11 initWithFrame:0.0, 0.0, 0.0, 0.0];
  uint64_t v13 = OBJC_IVAR____TtC16MusicRecognition11NoMatchView_retryButton;
  *(void *)&v12[v13] = [objc_allocWithZone((Class)UIButton) initWithFrame:0.0, 0.0, 0.0, 0.0];
  *(void *)&v12[OBJC_IVAR____TtC16MusicRecognition11NoMatchView_noMatchLabelVerticalAnchor] = 0;

  v16.receiver = v12;
  v16.super_class = ObjectType;
  [super initWithFrame:a1, a2, a3, a4];
  sub_1000C7904();

  return v14;
}

uint64_t sub_1000C7904()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000060EC(&qword_10015AC50);
  __chkstk_darwin(v2 - 8);
  uint64_t v60 = (char *)&v56 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = (void *)type metadata accessor for UIButton.Configuration.CornerStyle();
  uint64_t v58 = *(v4 - 1);
  id v59 = v4;
  __chkstk_darwin(v4);
  int v57 = (char *)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for UIButton.Configuration();
  uint64_t v62 = *(void *)(v6 - 8);
  uint64_t v63 = v6;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  [v0 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v0 setLayoutMargins:0.0, 34.0, 0.0, 17.0];
  uint64_t v9 = *(void **)&v0[OBJC_IVAR____TtC16MusicRecognition11NoMatchView_noMatchLabel];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v0 addSubview:v9];
  id v10 = [self systemFontOfSize:16.0 weight:UIFontWeightSemibold];
  [v9 setFont:v10];

  id v11 = [self whiteColor];
  [v9 setTextColor:v11];

  if (qword_1001563B8 != -1) {
    swift_once();
  }
  NSString v12 = String._bridgeToObjectiveC()();
  [v9 setAccessibilityIdentifier:v12];

  uint64_t v13 = self;
  id v14 = [v13 mainBundle];
  v65._object = (void *)0xE000000000000000;
  v15._object = (void *)0x800000010011AD50;
  v15._uint64_t countAndFlagsBits = 0xD00000000000001ELL;
  v16._uint64_t countAndFlagsBits = 0;
  v16._object = (void *)0xE000000000000000;
  v65._uint64_t countAndFlagsBits = 0;
  Swift::String v17 = NSLocalizedString(_:tableName:bundle:value:comment:)(v15, (Swift::String_optional)0, (NSBundle)v14, v16, v65);

  Swift::String v64 = v17;
  v18._uint64_t countAndFlagsBits = 8236;
  v18._object = (void *)0xE200000000000000;
  String.append(_:)(v18);
  id v19 = [v13 mainBundle];
  v20._uint64_t countAndFlagsBits = 0xD000000000000021;
  v66._object = (void *)0xE000000000000000;
  v20._object = (void *)0x800000010011AD70;
  v21._uint64_t countAndFlagsBits = 0;
  v21._object = (void *)0xE000000000000000;
  v66._uint64_t countAndFlagsBits = 0;
  Swift::String v22 = NSLocalizedString(_:tableName:bundle:value:comment:)(v20, (Swift::String_optional)0, (NSBundle)v19, v21, v66);

  String.append(_:)(v22);
  swift_bridgeObjectRelease();
  NSString v23 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v1 setAccessibilityLabel:v23];

  [v1 setIsAccessibilityElement:1];
  int v24 = *(void **)&v1[OBJC_IVAR____TtC16MusicRecognition11NoMatchView_retryButton];
  [v24 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v1 addSubview:v24];
  id v25 = [self configurationWithPointSize:5 weight:21.0];
  static UIButton.Configuration.filled()();
  if (qword_1001564B0 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  id v26 = v25;
  NSString v27 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v28 = [self systemImageNamed:v27 withConfiguration:v26];

  id v61 = v26;
  UIButton.Configuration.image.setter();
  if (qword_1001564B8 != -1) {
    swift_once();
  }
  id v29 = (id)qword_10015BE30;
  UIButton.Configuration.baseForegroundColor.setter();
  uint64_t v31 = v62;
  uint64_t v30 = v63;
  if (qword_1001564C0 != -1) {
    swift_once();
  }
  id v32 = (id)qword_10015BE38;
  UIButton.Configuration.baseBackgroundColor.setter();
  (*(void (**)(char *, void, id))(v58 + 104))(v57, enum case for UIButton.Configuration.CornerStyle.capsule(_:), v59);
  UIButton.Configuration.cornerStyle.setter();
  long long v33 = v60;
  (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v60, v8, v30);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v33, 0, 1, v30);
  UIButton.configuration.setter();
  [v24 setContentVerticalAlignment:3];
  [v24 setContentHorizontalAlignment:3];
  [v24 setUserInteractionEnabled:0];
  uint64_t v60 = v8;
  if (qword_1001563C0 != -1) {
    swift_once();
  }
  NSString v34 = String._bridgeToObjectiveC()();
  [v24 setAccessibilityIdentifier:v34];

  id v59 = self;
  sub_1000060EC(&qword_100157030);
  uint64_t v35 = swift_allocObject();
  *(_OWORD *)(v35 + 16) = xmmword_100110680;
  id v36 = [v9 leadingAnchor];
  id v37 = [v1 layoutMarginsGuide];
  id v38 = [v37 leadingAnchor];

  id v39 = [v36 constraintEqualToAnchor:v38];
  *(void *)(v35 + 32) = v39;
  id v40 = [v9 trailingAnchor];
  id v41 = [v24 leadingAnchor];
  id v42 = [v40 constraintEqualToAnchor:v41];

  *(void *)(v35 + 40) = v42;
  id v43 = [v24 trailingAnchor];
  id v44 = [v1 layoutMarginsGuide];
  id v45 = [v44 trailingAnchor];

  id v46 = [v43 constraintEqualToAnchor:v45];
  *(void *)(v35 + 48) = v46;
  id v47 = [v24 centerYAnchor];
  id v48 = [v1 centerYAnchor];
  id v49 = [v47 constraintEqualToAnchor:v48];

  *(void *)(v35 + 56) = v49;
  id v50 = [v24 widthAnchor];
  id v51 = [v50 constraintEqualToConstant:51.0];

  *(void *)(v35 + 64) = v51;
  id v52 = [v24 heightAnchor];
  id v53 = [v52 constraintEqualToConstant:51.0];

  *(void *)(v35 + 72) = v53;
  v64._uint64_t countAndFlagsBits = v35;
  specialized Array._endMutation()();
  sub_1000150F8(0, (unint64_t *)&qword_100157AD0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v59 activateConstraints:isa];

  return (*(uint64_t (**)(char *, uint64_t))(v62 + 8))(v60, v63);
}

id sub_1000C82E4(void *a1)
{
  uint64_t v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = OBJC_IVAR____TtC16MusicRecognition11NoMatchView_noMatchLabel;
  id v6 = objc_allocWithZone((Class)UILabel);
  uint64_t v7 = v2;
  *(void *)&v2[v5] = [v6 initWithFrame:0.0, 0.0, 0.0, 0.0];
  uint64_t v8 = OBJC_IVAR____TtC16MusicRecognition11NoMatchView_retryButton;
  *(void *)&v7[v8] = [objc_allocWithZone((Class)UIButton) initWithFrame:0.0, 0.0, 0.0, 0.0];
  *(void *)&v7[OBJC_IVAR____TtC16MusicRecognition11NoMatchView_noMatchLabelVerticalAnchor] = 0;

  v13.receiver = v7;
  v13.super_class = ObjectType;
  [super initWithCoder:a1];
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
    sub_1000C7904();
  }
  return v10;
}

void sub_1000C8418()
{
  v12.receiver = v0;
  v12.super_class = (Class)swift_getObjectType();
  [super layoutSubviews];
  if (!*(void *)&v0[OBJC_IVAR____TtC16MusicRecognition11NoMatchView_noMatchLabelVerticalAnchor])
  {
    char v1 = sub_1000CAC20();
    uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC16MusicRecognition11NoMatchView_noMatchLabel];
    if (v1)
    {
      id v3 = [v2 _tightBoundingBoxLayoutGuide];
      id v4 = [v3 topAnchor];

      id v5 = [v0 SBUISA_systemApertureObstructedAreaLayoutGuide];
      id v6 = [v5 bottomAnchor];
    }
    else
    {
      id v4 = [v2 centerYAnchor];
      id v6 = [v0 centerYAnchor];
    }
    id v7 = [v4 constraintEqualToAnchor:v6];

    uint64_t v8 = self;
    sub_1000060EC(&qword_100157030);
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_100112420;
    *(void *)(v9 + 32) = v7;
    specialized Array._endMutation()();
    sub_1000150F8(0, (unint64_t *)&qword_100157AD0);
    id v10 = v7;
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v8 activateConstraints:isa];
  }
}

uint64_t type metadata accessor for NoMatchView()
{
  return self;
}

uint64_t sub_1000C86B4()
{
  sub_100008FB8();
  EnvironmentValues.subscript.getter();
  return v1;
}

uint64_t sub_1000C86F0(char a1)
{
  if (!a1) {
    return 0x7974706D65;
  }
  if (a1 == 1) {
    return 0xD000000000000022;
  }
  return 0xD000000000000024;
}

uint64_t sub_1000C8748(char a1, id a2)
{
  id v4 = [a2 userInfo];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    *(void *)&long long v24 = 0xD000000000000010;
    *((void *)&v24 + 1) = 0x800000010011AE50;
    AnyHashable.init<A>(_:)();
    if (*(void *)(v6 + 16) && (unint64_t v7 = sub_1000CA2E8((uint64_t)v23), (v8 & 1) != 0))
    {
      sub_10008FE98(*(void *)(v6 + 56) + 32 * v7, (uint64_t)&v24);
    }
    else
    {
      long long v24 = 0u;
      long long v25 = 0u;
    }
    sub_1000CA32C((uint64_t)v23);
    swift_bridgeObjectRelease();
    if (*((void *)&v25 + 1))
    {
      swift_dynamicCast();
      goto LABEL_10;
    }
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
  }
  sub_1000CA1BC((uint64_t)&v24);
LABEL_10:
  id v9 = [a2 userInfo];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    *(void *)&long long v24 = 0xD000000000000013;
    *((void *)&v24 + 1) = 0x800000010011AE30;
    AnyHashable.init<A>(_:)();
    if (*(void *)(v11 + 16) && (unint64_t v12 = sub_1000CA2E8((uint64_t)v23), (v13 & 1) != 0))
    {
      sub_10008FE98(*(void *)(v11 + 56) + 32 * v12, (uint64_t)&v24);
    }
    else
    {
      long long v24 = 0u;
      long long v25 = 0u;
    }
    sub_1000CA32C((uint64_t)v23);
    swift_bridgeObjectRelease();
    if (*((void *)&v25 + 1))
    {
      swift_dynamicCast();
      goto LABEL_19;
    }
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
  }
  sub_1000CA1BC((uint64_t)&v24);
LABEL_19:
  id v14 = [a2 userInfo];
  if (!v14)
  {
    long long v24 = 0u;
    long long v25 = 0u;
LABEL_30:
    sub_1000CA1BC((uint64_t)&v24);
    goto LABEL_31;
  }
  Swift::String v15 = v14;
  uint64_t v16 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  if (qword_1001564C8 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  AnyHashable.init<A>(_:)();
  if (*(void *)(v16 + 16) && (unint64_t v17 = sub_1000CA2E8((uint64_t)v23), (v18 & 1) != 0))
  {
    sub_10008FE98(*(void *)(v16 + 56) + 32 * v17, (uint64_t)&v24);
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
  }
  sub_1000CA32C((uint64_t)v23);
  swift_bridgeObjectRelease();
  if (!*((void *)&v25 + 1)) {
    goto LABEL_30;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_31:
    Swift::String v22 = 0;
    goto LABEL_32;
  }
  uint64_t v19 = v23[0];
  unint64_t v20 = v23[1];
  sub_1000150F8(0, &qword_10015BF78);
  sub_1000150F8(0, (unint64_t *)&qword_1001577E0);
  Swift::String v22 = (void *)static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
  sub_100060B4C(v19, v20);
LABEL_32:
  sub_1000C9A7C(a1, v22);

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000C8B60()
{
  swift_getKeyPath();
  sub_1000CAB90((unint64_t *)&qword_100156898, (void (*)(uint64_t))type metadata accessor for ViewConfiguration);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  return *(unsigned __int8 *)(v0 + 16);
}

void *sub_1000C8C00()
{
  swift_getKeyPath();
  sub_1000CAB90((unint64_t *)&qword_100156898, (void (*)(uint64_t))type metadata accessor for ViewConfiguration);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v1 = *(void **)(v0 + 24);
  id v2 = v1;
  return v1;
}

uint64_t sub_1000C8CA8()
{
  swift_getKeyPath();
  sub_1000CAB90((unint64_t *)&qword_100156898, (void (*)(uint64_t))type metadata accessor for ViewConfiguration);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1000C8D58()
{
  swift_getKeyPath();
  sub_1000CAB90((unint64_t *)&qword_100156898, (void (*)(uint64_t))type metadata accessor for ViewConfiguration);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  return *(unsigned __int8 *)(v0 + 48);
}

uint64_t sub_1000C8DF8(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v3 = 0xD000000000000022;
    }
    else {
      unint64_t v3 = 0xD000000000000024;
    }
    if (v2 == 1) {
      unint64_t v4 = 0x8000000100117480;
    }
    else {
      unint64_t v4 = 0x80000001001174B0;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        unint64_t v6 = 0xD000000000000022;
      }
      else {
        unint64_t v6 = 0xD000000000000024;
      }
      if (v5 == 1) {
        unint64_t v7 = 0x8000000100117480;
      }
      else {
        unint64_t v7 = 0x80000001001174B0;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE500000000000000;
    unint64_t v3 = 0x7974706D65;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE500000000000000;
  if (v3 != 0x7974706D65)
  {
LABEL_21:
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_1000C8EF8(char a1, char a2)
{
  unint64_t v3 = 0xE100000000000000;
  uint64_t v4 = 50;
  switch(a1)
  {
    case 1:
      uint64_t v4 = 51;
      break;
    case 2:
      uint64_t v4 = 53;
      break;
    case 3:
      uint64_t v4 = 55;
      break;
    case 4:
      uint64_t v4 = 56;
      break;
    case 5:
      uint64_t v4 = 57;
      break;
    case 6:
      unint64_t v3 = 0xE200000000000000;
      uint64_t v4 = 12337;
      break;
    default:
      break;
  }
  unint64_t v5 = 0xE100000000000000;
  uint64_t v6 = 50;
  switch(a2)
  {
    case 1:
      if (v4 == 51) {
        goto LABEL_19;
      }
      goto LABEL_22;
    case 2:
      if (v4 != 53) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 3:
      if (v4 != 55) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 4:
      if (v4 != 56) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 5:
      uint64_t v6 = 57;
      goto LABEL_18;
    case 6:
      unint64_t v5 = 0xE200000000000000;
      if (v4 != 12337) {
        goto LABEL_22;
      }
      goto LABEL_19;
    default:
LABEL_18:
      if (v4 != v6) {
        goto LABEL_22;
      }
LABEL_19:
      if (v3 == v5) {
        char v7 = 1;
      }
      else {
LABEL_22:
      }
        char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

Swift::Int sub_1000C9078()
{
  return Hasher._finalize()();
}

uint64_t sub_1000C911C()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000C91A8()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000C925C()
{
  return Hasher._finalize()();
}

Swift::Int sub_1000C9320()
{
  return Hasher._finalize()();
}

void sub_1000C93C0()
{
  qword_10015BE80 = 0x657449616964656DLL;
  *(void *)algn_10015BE88 = 0xE90000000000006DLL;
}

uint64_t sub_1000C93E8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1000C8DF8(*a1, *a2);
}

Swift::Int sub_1000C93F4()
{
  return sub_1000C9078();
}

uint64_t sub_1000C93FC()
{
  return sub_1000C911C();
}

Swift::Int sub_1000C9404()
{
  return sub_1000C9320();
}

unint64_t sub_1000C940C@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_1000CAB34(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1000C943C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000C86F0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1000C9468@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_1000CAB90((unint64_t *)&qword_100156898, (void (*)(uint64_t))type metadata accessor for ViewConfiguration);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 16);
  return result;
}

uint64_t sub_1000C9510()
{
  return swift_release();
}

id sub_1000C95E0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_1000CAB90((unint64_t *)&qword_100156898, (void (*)(uint64_t))type metadata accessor for ViewConfiguration);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v4 = *(void **)(v3 + 24);
  *a2 = v4;

  return v4;
}

void sub_1000C9698(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  sub_1000CAB90((unint64_t *)&qword_100156898, (void (*)(uint64_t))type metadata accessor for ViewConfiguration);
  id v2 = v1;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
}

uint64_t sub_1000C9774@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_1000CAB90((unint64_t *)&qword_100156898, (void (*)(uint64_t))type metadata accessor for ViewConfiguration);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v4 = *(void *)(v3 + 40);
  *a2 = *(void *)(v3 + 32);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1000C9820()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000C9904@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_1000CAB90((unint64_t *)&qword_100156898, (void (*)(uint64_t))type metadata accessor for ViewConfiguration);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 48);
  return result;
}

uint64_t sub_1000C99AC()
{
  return swift_release();
}

void sub_1000C9A7C(char a1, void *a2)
{
  if (a1 != 2) {
    goto LABEL_18;
  }
  swift_getKeyPath();
  sub_1000CAB90((unint64_t *)&qword_100156898, (void (*)(uint64_t))type metadata accessor for ViewConfiguration);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v4 = *(void **)(v2 + 24);
  if (v4 && (id v5 = [v4 shazamID]) != 0)
  {
    uint64_t v6 = v5;
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = v8;

    if (!a2) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
    if (!a2) {
      goto LABEL_11;
    }
  }
  id v10 = [a2 shazamID];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v14 = v13;

    if (v9) {
      goto LABEL_12;
    }
LABEL_9:
    if (!v14) {
      return;
    }
    goto LABEL_16;
  }
LABEL_11:
  uint64_t v12 = 0;
  uint64_t v14 = 0;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_12:
  if (!v14)
  {
LABEL_16:
    swift_bridgeObjectRelease();
LABEL_18:
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath);
    sub_1000CAB90((unint64_t *)&qword_100156898, (void (*)(uint64_t))type metadata accessor for ViewConfiguration);
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
    swift_release();
    uint64_t v17 = swift_getKeyPath();
    __chkstk_darwin(v17);
    id v18 = a2;
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
    swift_release();

    uint64_t v19 = swift_getKeyPath();
    __chkstk_darwin(v19);
    swift_bridgeObjectRetain();
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v20 = swift_getKeyPath();
    __chkstk_darwin(v20);
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
    swift_release();
    return;
  }
  if (v7 == v12 && v9 == v14)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return;
  }
  char v15 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v15 & 1) == 0) {
    goto LABEL_18;
  }
}

uint64_t sub_1000C9EA4()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC16MusicRecognition17ViewConfiguration___observationRegistrar;
  uint64_t v2 = type metadata accessor for ObservationRegistrar();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *((unsigned int *)*v0 + 12);
  uint64_t v4 = *((unsigned __int16 *)*v0 + 26);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_1000C9F54()
{
  return type metadata accessor for ViewConfiguration();
}

uint64_t type metadata accessor for ViewConfiguration()
{
  uint64_t result = qword_10015BEC8;
  if (!qword_10015BEC8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000C9FA8()
{
  uint64_t result = type metadata accessor for ObservationRegistrar();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for ViewConfiguration.ViewName(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000CA12CLL);
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

ValueMetadata *type metadata accessor for ViewConfiguration.ViewName()
{
  return &type metadata for ViewConfiguration.ViewName;
}

unint64_t sub_1000CA168()
{
  unint64_t result = qword_10015BF70;
  if (!qword_10015BF70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015BF70);
  }
  return result;
}

uint64_t sub_1000CA1BC(uint64_t a1)
{
  uint64_t v2 = sub_1000060EC(&qword_10015A520);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000CA21C()
{
  type metadata accessor for ViewConfiguration();
  uint64_t v0 = swift_allocObject();
  *(unsigned char *)(v0 + 16) = 0;
  *(void *)(v0 + 32) = 0;
  *(void *)(v0 + 40) = 0;
  *(void *)(v0 + 24) = 0;
  *(unsigned char *)(v0 + 48) = 0;
  uint64_t result = ObservationRegistrar.init()();
  qword_10015BE90 = v0;
  return result;
}

uint64_t sub_1000CA278@<X0>(void *a1@<X8>)
{
  if (qword_1001564D0 != -1) {
    swift_once();
  }
  *a1 = qword_10015BE90;

  return swift_retain();
}

unint64_t sub_1000CA2E8(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_1000CA524(a1, v4);
}

uint64_t sub_1000CA32C(uint64_t a1)
{
  return a1;
}

unint64_t sub_1000CA380(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_1000CA718(a1, a2, v4);
}

unint64_t sub_1000CA3F8(uint64_t a1)
{
  type metadata accessor for EditorialVideoArtworkFlavor();
  sub_1000CAB90(&qword_10015BF80, (void (*)(uint64_t))&type metadata accessor for EditorialVideoArtworkFlavor);
  uint64_t v2 = dispatch thunk of Hashable._rawHashValue(seed:)();

  return sub_1000CA7FC(a1, v2);
}

unint64_t sub_1000CA494(uint64_t a1)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v2 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return sub_1000CA9BC(a1, v2);
}

unint64_t sub_1000CA524(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_1000CA5EC(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_1000CA32C((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_1000CA5EC(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_1000CA650()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 16) = *(unsigned char *)(v0 + 24);
}

void sub_1000CA668()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 24);
  uint64_t v3 = *(void **)(v1 + 24);
  *(void *)(v1 + 24) = v2;
  id v4 = v2;
}

uint64_t sub_1000CA6A8()
{
  return sub_1000CA6D8();
}

void sub_1000CA6C8()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 48) = *(unsigned char *)(v0 + 24);
}

uint64_t sub_1000CA6D8()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[4];
  *(void *)(v1 + 32) = v0[3];
  *(void *)(v1 + 40) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

unint64_t sub_1000CA718(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    id v10 = (void *)(v9 + 16 * v6);
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
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1000CA7FC(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = type metadata accessor for EditorialVideoArtworkFlavor();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    BOOL v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_1000CAB90(&qword_10015BF88, (void (*)(uint64_t))&type metadata accessor for EditorialVideoArtworkFlavor);
      char v15 = dispatch thunk of static Equatable.== infix(_:_:)();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

unint64_t sub_1000CA9BC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;
    if (v6 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v15 = v14;
          if (v13 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v15 == v16) {
            break;
          }
          char v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_1000CAB34(Swift::String string)
{
  object = string._object;
  v2._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100149078, v2);
  swift_bridgeObjectRelease();
  if (v3 >= 3) {
    return 3;
  }
  else {
    return v3;
  }
}

ValueMetadata *_s20ViewConfigurationKeyVMa()
{
  return &_s20ViewConfigurationKeyVN;
}

uint64_t sub_1000CAB90(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_1000CABD8()
{
}

void sub_1000CABF0()
{
}

void sub_1000CAC08()
{
}

uint64_t sub_1000CAC20()
{
  id v1 = [v0 window];
  if (!v1 || (Swift::String v2 = v1, v3 = [v1 windowScene], v2, !v3))
  {
    uint64_t v6 = (void *)static UISceneSessionRole.activitySystemAperture.getter();
    goto LABEL_10;
  }
  id v4 = [v3 session];

  id v5 = [v4 role];
  uint64_t v6 = (void *)static UISceneSessionRole.activitySystemAperture.getter();
  if (!v5)
  {
LABEL_10:

    char v12 = 0;
    return v12 & 1;
  }
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  if (v7 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v9 == v10) {
    char v12 = 1;
  }
  else {
    char v12 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12 & 1;
}

uint64_t sub_1000CAD54()
{
  swift_getKeyPath();
  sub_10009230C();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_1000CADC4()
{
  id v1 = objc_allocWithZone((Class)AMSAcknowledgePrivacyTask);
  NSString v2 = String._bridgeToObjectiveC()();
  id v3 = [v1 initWithPrivacyIdentifier:v2];

  id v4 = [v3 acknowledgePrivacy];
  char v12 = sub_1000CB1C0;
  uint64_t v13 = 0;
  aBlock = _NSConcreteStackBlock;
  uint64_t v9 = 1107296256;
  uint64_t v10 = sub_1000D559C;
  char v11 = &unk_10014D020;
  id v5 = _Block_copy(&aBlock);
  [v4 addSuccessBlock:v5];
  _Block_release(v5);
  char v12 = sub_1000CB2A8;
  uint64_t v13 = 0;
  aBlock = _NSConcreteStackBlock;
  uint64_t v9 = 1107296256;
  uint64_t v10 = sub_1000CB484;
  char v11 = &unk_10014D048;
  uint64_t v6 = _Block_copy(&aBlock);
  [v4 addErrorBlock:v6];
  _Block_release(v6);

  swift_getKeyPath();
  aBlock = v0;
  sub_10009230C();
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  return swift_release();
}

uint64_t sub_1000CAFD0()
{
  uint64_t v1 = v0;
  ObservationRegistrar.init()();
  NSString v2 = self;
  NSString v3 = String._bridgeToObjectiveC()();
  unsigned __int8 v4 = [v2 acknowledgementNeededForPrivacyIdentifier:v3];

  if (qword_100156018 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  sub_10000E808(v5, (uint64_t)qword_100164B38);
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315394;
    sub_1000CB67C(0xD000000000000025, 0x80000001001174E0, &v10);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v8 + 12) = 1024;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Privacy required for %s: %{BOOL}d", (uint8_t *)v8, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  *(unsigned char *)(v1 + 16) = v4;
  return v1;
}

void sub_1000CB1C0()
{
  if (qword_100156018 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_10000E808(v0, (uint64_t)qword_100164B38);
  oslog = Logger.logObject.getter();
  os_log_type_t v1 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(oslog, v1))
  {
    NSString v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)NSString v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v1, "User accepted the privacy terms. Acknowledge privacy task succeeded.", v2, 2u);
    swift_slowDealloc();
  }
}

void sub_1000CB2A8()
{
  if (qword_100156018 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_10000E808(v0, (uint64_t)qword_100164B38);
  swift_errorRetain();
  swift_errorRetain();
  oslog = Logger.logObject.getter();
  os_log_type_t v1 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(oslog, v1))
  {
    NSString v2 = (uint8_t *)swift_slowAlloc();
    NSString v3 = (void *)swift_slowAlloc();
    *(_DWORD *)NSString v2 = 138412290;
    swift_errorRetain();
    uint64_t v5 = _swift_stdlib_bridgeErrorToNSError();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *NSString v3 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, oslog, v1, "User tried to accept the privacy terms. Acknowledge privacy task failed with error: %@", v2, 0xCu);
    sub_1000060EC((uint64_t *)&unk_1001570F0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
}

void sub_1000CB484(uint64_t a1, void *a2)
{
  NSString v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_1000CB4EC()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16MusicRecognition42MusicRecognitionOnboardingWelcomeViewModel___observationRegistrar;
  uint64_t v2 = type metadata accessor for ObservationRegistrar();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_1000CB58C()
{
  return type metadata accessor for MusicRecognitionOnboardingWelcomeViewModel();
}

uint64_t type metadata accessor for MusicRecognitionOnboardingWelcomeViewModel()
{
  uint64_t result = qword_10015BFC0;
  if (!qword_10015BFC0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000CB5E0()
{
  uint64_t result = type metadata accessor for ObservationRegistrar();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000CB67C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000CB750(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10008FE98((uint64_t)v12, *a3);
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
      sub_10008FE98((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  _s16MusicRecognition11AnyPlaylistVwxx_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1000CB750(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1000CB90C(a5, a6);
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
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
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

uint64_t sub_1000CB90C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000CB9A4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000CBB84(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000CBB84(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000CB9A4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1000CBB1C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_1000CBB1C(uint64_t a1, uint64_t a2)
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
  sub_1000060EC(&qword_10015C050);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000CBB84(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000060EC(&qword_10015C050);
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000CBCD4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000CBCE4()
{
  return swift_release();
}

uint64_t *sub_1000CBCFC(uint64_t *a1, uint64_t *a2, int *a3)
{
  unint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v24 = *a2;
    *a1 = *a2;
    unint64_t v4 = (uint64_t *)(v24 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    a1[1] = a2[1];
    uint64_t v7 = a3[5];
    int64_t v8 = (char *)a1 + v7;
    int64_t v9 = (char *)a2 + v7;
    uint64_t v10 = type metadata accessor for URL();
    size_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_retain();
    v11(v8, v9, v10);
    uint64_t v12 = a3[6];
    uint64_t v13 = a3[7];
    uint64_t v14 = (uint64_t *)((char *)v4 + v12);
    uint64_t v15 = (uint64_t *)((char *)a2 + v12);
    uint64_t v16 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v16;
    uint64_t v17 = (char *)v4 + v13;
    char v18 = (char *)a2 + v13;
    uint64_t v19 = *((void *)v18 + 1);
    *(void *)uint64_t v17 = *(void *)v18;
    *((void *)v17 + 1) = v19;
    v17[16] = v18[16];
    *((void *)v17 + 3) = *((void *)v18 + 3);
    uint64_t v20 = a3[8];
    Swift::String v21 = (uint64_t *)((char *)v4 + v20);
    Swift::String v22 = (uint64_t *)((char *)a2 + v20);
    uint64_t v23 = v22[1];
    *Swift::String v21 = *v22;
    v21[1] = v23;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_1000CBE5C(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t sub_1000CBF14(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v6 = a3[5];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = type metadata accessor for URL();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_retain();
  v10(v7, v8, v9);
  uint64_t v11 = a3[6];
  uint64_t v12 = a3[7];
  uint64_t v13 = (void *)(a1 + v11);
  uint64_t v14 = (void *)(a2 + v11);
  uint64_t v15 = v14[1];
  *uint64_t v13 = *v14;
  v13[1] = v15;
  uint64_t v16 = a1 + v12;
  uint64_t v17 = a2 + v12;
  uint64_t v18 = *(void *)(v17 + 8);
  *(void *)uint64_t v16 = *(void *)v17;
  *(void *)(v16 + 8) = v18;
  *(unsigned char *)(v16 + 16) = *(unsigned char *)(v17 + 16);
  *(void *)(v16 + 24) = *(void *)(v17 + 24);
  uint64_t v19 = a3[8];
  uint64_t v20 = (void *)(a1 + v19);
  Swift::String v21 = (void *)(a2 + v19);
  uint64_t v22 = v21[1];
  *uint64_t v20 = *v21;
  v20[1] = v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_1000CC028(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  uint64_t v6 = a3[5];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[7];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  *(void *)uint64_t v14 = *(void *)(a2 + v13);
  *(void *)(v14 + 8) = *(void *)(a2 + v13 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v14 + 16) = *(unsigned char *)(v15 + 16);
  *(void *)(v14 + 24) = *(void *)(v15 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[8];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (void *)(a2 + v16);
  uint64_t v19 = v18[1];
  *uint64_t v17 = *v18;
  v17[1] = v19;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_1000CC168(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for URL();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  uint64_t v11 = (_OWORD *)((char *)a1 + v10);
  uint64_t v12 = (_OWORD *)((char *)a2 + v10);
  long long v13 = v12[1];
  *uint64_t v11 = *v12;
  v11[1] = v13;
  *(_OWORD *)((char *)a1 + a3[8]) = *(_OWORD *)((char *)a2 + a3[8]);
  return a1;
}

uint64_t sub_1000CC21C(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  uint64_t v6 = a3[5];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (uint64_t *)(a2 + v10);
  uint64_t v14 = *v12;
  uint64_t v13 = v12[1];
  *uint64_t v11 = v14;
  v11[1] = v13;
  swift_bridgeObjectRelease();
  uint64_t v15 = a3[7];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = *(void *)(a2 + v15 + 8);
  *(void *)uint64_t v16 = *(void *)(a2 + v15);
  *(void *)(v16 + 8) = v18;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v16 + 16) = *(unsigned char *)(v17 + 16);
  *(void *)(v16 + 24) = *(void *)(v17 + 24);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + a3[8]) = *(_OWORD *)(a2 + a3[8]);
  swift_release();
  return a1;
}

uint64_t sub_1000CC320(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000CC334);
}

uint64_t sub_1000CC334(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t sub_1000CC3FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000CC410);
}

uint64_t sub_1000CC410(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for URL();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for ToolbarShareButton()
{
  uint64_t result = qword_10015C0B0;
  if (!qword_10015C0B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000CC520()
{
  uint64_t result = type metadata accessor for URL();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1000CC5D8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000CC5F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v46 = a1;
  uint64_t v45 = type metadata accessor for NavigationBarButtonStyle();
  uint64_t v3 = __chkstk_darwin(v45);
  id v41 = (uint64_t *)((char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v3);
  uint64_t v42 = (uint64_t)&v38 - v5;
  uint64_t v6 = type metadata accessor for ToolbarShareButton();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6);
  uint64_t v9 = sub_1000060EC(&qword_10015C0F8);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  unint64_t v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_1000060EC(&qword_10015C100);
  uint64_t v13 = __chkstk_darwin(v39);
  uint64_t v15 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v38 - v16;
  uint64_t v18 = sub_1000060EC(&qword_10015C108);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v43 = v18;
  uint64_t v44 = v19;
  __chkstk_darwin(v18);
  id v40 = (char *)&v38 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000CCE7C(v2, (uint64_t)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v21 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v22 = swift_allocObject();
  sub_1000CD130((uint64_t)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v22 + v21, (uint64_t (*)(void))type metadata accessor for ToolbarShareButton);
  sub_1000060EC(&qword_100156AD8);
  id v47 = &type metadata for Image;
  id v48 = &protocol witness table for Image;
  swift_getOpaqueTypeConformance2();
  Button.init(action:label:)();
  uint64_t v38 = v2;
  sub_1000CD06C();
  View.accessibilityIdentifier(_:)();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v23 = Text.init(_:tableName:bundle:comment:)();
  uint64_t v25 = v24;
  LOBYTE(v21) = v26 & 1;
  NSString v27 = (void *)v39;
  ModifiedContent<>.accessibilityLabel(_:)();
  sub_10000E904(v23, v25, v21);
  swift_bridgeObjectRelease();
  sub_1000CD0C8((uint64_t)v15);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v29 = (uint64_t)v41;
  *id v41 = KeyPath;
  sub_1000060EC(&qword_100156938);
  swift_storeEnumTagMultiPayload();
  uint64_t v30 = v42;
  sub_1000CD130(v29, v42, (uint64_t (*)(void))type metadata accessor for NavigationBarButtonStyle);
  unint64_t v31 = sub_1000CD198();
  uint64_t v32 = sub_1000CD244(&qword_100156B10, (void (*)(uint64_t))type metadata accessor for NavigationBarButtonStyle);
  long long v33 = v40;
  NSString v34 = (void *)v45;
  View.buttonStyle<A>(_:)();
  sub_1000CD28C(v30);
  sub_1000CD0C8((uint64_t)v17);
  uint64_t v35 = *(void *)(v38 + 8);
  char v51 = *(unsigned char *)v38;
  uint64_t v52 = v35;
  sub_1000060EC(qword_10015C120);
  State.projectedValue.getter();
  id v47 = v27;
  id v48 = v34;
  unint64_t v49 = v31;
  uint64_t v50 = v32;
  swift_getOpaqueTypeConformance2();
  uint64_t v36 = v43;
  View.sharingPicker(isPresented:item:subject:message:)();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v33, v36);
}

uint64_t sub_1000CCBF8(uint64_t a1)
{
  static Animation.default.getter();
  withAnimation<A>(_:_:)();
  swift_release();
  uint64_t v2 = type metadata accessor for ToolbarShareButton();
  return (*(uint64_t (**)(void))(a1 + *(int *)(v2 + 32)))();
}

uint64_t sub_1000CCC84()
{
  return swift_release();
}

uint64_t sub_1000CCD24()
{
  uint64_t v0 = type metadata accessor for SymbolVariants();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)v9 - v5;
  v9[1] = Image.init(systemName:)();
  static SymbolVariants.circle.getter();
  SymbolVariants.fill.getter();
  uint64_t v7 = *(void (**)(char *, uint64_t))(v1 + 8);
  v7(v6, v0);
  View.symbolVariant(_:)();
  v7(v4, v0);
  return swift_release();
}

uint64_t sub_1000CCE7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ToolbarShareButton();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000CCEE0()
{
  uint64_t v1 = (int *)(type metadata accessor for ToolbarShareButton() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  swift_release();
  uint64_t v7 = v6 + v1[7];
  uint64_t v8 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_1000CD00C()
{
  uint64_t v1 = *(void *)(type metadata accessor for ToolbarShareButton() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_1000CCBF8(v2);
}

unint64_t sub_1000CD06C()
{
  unint64_t result = qword_10015C110;
  if (!qword_10015C110)
  {
    sub_100006224(&qword_10015C0F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015C110);
  }
  return result;
}

uint64_t sub_1000CD0C8(uint64_t a1)
{
  uint64_t v2 = sub_1000060EC(&qword_10015C100);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000CD130(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_1000CD198()
{
  unint64_t result = qword_10015C118;
  if (!qword_10015C118)
  {
    sub_100006224(&qword_10015C100);
    sub_1000CD06C();
    sub_1000CD244((unint64_t *)&qword_1001567D8, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015C118);
  }
  return result;
}

uint64_t sub_1000CD244(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000CD28C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for NavigationBarButtonStyle();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000CD2E8()
{
  return sub_1000CCC84();
}

uint64_t sub_1000CD304()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000CD3E4()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1000CD48C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(_DWORD *)(v6 + 80);
  uint64_t v8 = *(void *)(v6 + 64) + 7;
  if (v7 > 7
    || (*(_DWORD *)(v6 + 80) & 0x100000) != 0
    || ((v8 + ((v7 + 9) & ~v7)) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    uint64_t v11 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = v11 + ((v7 & 0xF8 ^ 0x1F8) & (v7 + 16));
    swift_retain();
  }
  else
  {
    uint64_t v12 = ~v7;
    uint64_t v13 = *(void *)a2;
    char v14 = *(unsigned char *)(a2 + 8);
    sub_10005464C(*(void *)a2, v14);
    *(void *)a1 = v13;
    *(unsigned char *)(a1 + 8) = v14;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))((a1 + v7 + 9) & v12, (a2 + v7 + 9) & v12, v5);
    *(void *)((v8 + ((a1 + v7 + 9) & v12)) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v8 + ((a2 + v7 + 9) & v12)) & 0xFFFFFFFFFFFFFFF8);
  }
  return a1;
}

uint64_t sub_1000CD5E0(uint64_t a1, uint64_t a2)
{
  sub_100009CF8(*(void *)a1, *(unsigned char *)(a1 + 8));
  uint64_t v4 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v5 = *(uint64_t (**)(unint64_t))(v4 + 8);
  unint64_t v6 = (a1 + *(unsigned __int8 *)(v4 + 80) + 9) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);

  return v5(v6);
}

uint64_t sub_1000CD658(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  sub_10005464C(*(void *)a2, v7);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v9 = v8 + 16;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = (v10 + 9 + a1) & ~v10;
  uint64_t v12 = (v10 + 9 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v11, v12);
  *(void *)((*(void *)(v9 + 48) + 7 + v11) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v9 + 48) + 7 + v12) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_1000CD71C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  sub_10005464C(*(void *)a2, v7);
  uint64_t v8 = *(void *)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  sub_100009CF8(v8, v9);
  uint64_t v10 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v11 = v10 + 24;
  uint64_t v12 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (v12 + 9 + a1) & ~v12;
  uint64_t v14 = (v12 + 9 + a2) & ~v12;
  (*(void (**)(uint64_t, uint64_t))(v10 + 24))(v13, v14);
  *(void *)((*(void *)(v11 + 40) + 7 + v13) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v11 + 40)
                                                                                       + 7
                                                                                       + v14) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_1000CD7EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = v4 + 32;
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = (v6 + 9 + a1) & ~v6;
  uint64_t v8 = (v6 + 9 + a2) & ~v6;
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v7, v8);
  *(void *)((*(void *)(v5 + 32) + 7 + v7) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 32) + 7 + v8) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_1000CD894(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  char v7 = *((unsigned char *)a2 + 8);
  uint64_t v8 = *(void *)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  sub_100009CF8(v8, v9);
  uint64_t v10 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v11 = v10 + 40;
  uint64_t v12 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (v12 + 9 + a1) & ~v12;
  uint64_t v14 = ((unint64_t)a2 + v12 + 9) & ~v12;
  (*(void (**)(uint64_t, uint64_t))(v10 + 40))(v13, v14);
  *(void *)((*(void *)(v11 + 24) + 7 + v13) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v11 + 24)
                                                                                       + 7
                                                                                       + v14) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_1000CD950(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  if (v5 <= 0xFE) {
    unsigned int v7 = 254;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) + ((v6 + 9) & ~v6) + 7) & 0xFFFFFFFFFFFFFFF8)
       + 8;
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
        int v14 = *(unsigned __int8 *)(a1 + v8);
        if (!v14) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v14 = *(unsigned __int16 *)(a1 + v8);
        if (v14) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x1000CDAA8);
      case 4:
        int v14 = *(_DWORD *)(a1 + v8);
        if (!v14) {
          break;
        }
LABEL_22:
        int v16 = v14 - 1;
        if (v10)
        {
          int v16 = 0;
          LODWORD(v10) = *(_DWORD *)a1;
        }
        return v7 + (v10 | v16) + 1;
      default:
        break;
    }
  }
  if (v5 > 0xFE) {
    return (*(uint64_t (**)(uint64_t))(v4 + 48))((a1 + v6 + 9) & ~v6);
  }
  unsigned int v17 = *(unsigned __int8 *)(a1 + 8);
  if (v17 > 1) {
    return (v17 ^ 0xFF) + 1;
  }
  else {
    return 0;
  }
}

void sub_1000CDABC(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0xFE) {
    unsigned int v8 = 254;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  size_t v10 = ((*(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + ((v9 + 9) & ~v9) + 7) & 0xFFFFFFFFFFFFFFF8)
      + 8;
  if (v8 >= a3)
  {
    int v14 = 0;
    int v15 = a2 - v8;
    if (a2 <= v8)
    {
LABEL_17:
      switch(v14)
      {
        case 1:
          a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 2:
          *(_WORD *)&a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 3:
          goto LABEL_42;
        case 4:
          *(_DWORD *)&a1[v10] = 0;
          goto LABEL_29;
        default:
LABEL_29:
          if (a2)
          {
LABEL_30:
            if (v7 > 0xFE)
            {
              unint64_t v18 = (unint64_t)&a1[v9 + 9] & ~v9;
              uint64_t v19 = *(void (**)(unint64_t))(v6 + 56);
              v19(v18);
            }
            else if (a2 > 0xFE)
            {
              a1[8] = 0;
              *(void *)a1 = a2 - 255;
            }
            else
            {
              a1[8] = -(char)a2;
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v11 = a3 - v8;
    if (((*(_DWORD *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + ((v9 + 9) & ~v9) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      unsigned int v12 = v11 + 1;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v12 >= 0x10000) {
      int v13 = 4;
    }
    else {
      int v13 = 2;
    }
    if (v12 < 0x100) {
      int v13 = 1;
    }
    if (v12 >= 2) {
      int v14 = v13;
    }
    else {
      int v14 = 0;
    }
    int v15 = a2 - v8;
    if (a2 <= v8) {
      goto LABEL_17;
    }
  }
  if (((*(_DWORD *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + ((v9 + 9) & ~v9) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
    int v16 = v15;
  }
  else {
    int v16 = 1;
  }
  if (((*(_DWORD *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + ((v9 + 9) & ~v9) + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    unsigned int v17 = ~v8 + a2;
    bzero(a1, v10);
    *(_DWORD *)a1 = v17;
  }
  switch(v14)
  {
    case 1:
      a1[v10] = v16;
      break;
    case 2:
      *(_WORD *)&a1[v10] = v16;
      break;
    case 3:
LABEL_42:
      __break(1u);
      JUMPOUT(0x1000CDCBCLL);
    case 4:
      *(_DWORD *)&a1[v10] = v16;
      break;
    default:
      return;
  }
}

uint64_t type metadata accessor for ScrollFadingView()
{
  return sub_100020608();
}

uint64_t sub_1000CDCFC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000CDD40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v40 = a2;
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = __chkstk_darwin(a1);
  uint64_t v7 = *(void *)(v6 + 16);
  uint64_t v41 = *(void *)(v7 - 8);
  __chkstk_darwin(v6);
  NSString v34 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100006224(&qword_10015C1A8);
  uint64_t v36 = v9;
  uint64_t v33 = *(void *)(a1 + 24);
  uint64_t v10 = v33;
  uint64_t v11 = type metadata accessor for EmptyVisualEffect();
  unint64_t v12 = sub_1000CE324();
  uint64_t v42 = v11;
  unint64_t v43 = v12;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v42 = v7;
  unint64_t v43 = v9;
  uint64_t v44 = v10;
  uint64_t v45 = OpaqueTypeConformance2;
  uint64_t v37 = OpaqueTypeConformance2;
  uint64_t v38 = &opaque type descriptor for <<opaque return type of View.visualEffect<A>(_:)>>;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v39 = *(void *)(OpaqueTypeMetadata2 - 8);
  uint64_t v15 = __chkstk_darwin(OpaqueTypeMetadata2);
  unsigned int v17 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v35 = (char *)&v32 - v18;
  uint64_t v19 = v2;
  uint64_t v20 = v2 + *(int *)(a1 + 36);
  unint64_t v21 = v34;
  (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v34, v20, v7);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v19, a1);
  uint64_t v22 = v4;
  unint64_t v23 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v24 = swift_allocObject();
  uint64_t v25 = v33;
  *(void *)(v24 + 16) = v7;
  *(void *)(v24 + 24) = v25;
  (*(void (**)(unint64_t, char *, uint64_t))(v22 + 32))(v24 + v23, (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  unint64_t v26 = v36;
  uint64_t v27 = v37;
  View.visualEffect<A>(_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v21, v7);
  uint64_t v42 = v7;
  unint64_t v43 = v26;
  uint64_t v44 = v25;
  uint64_t v45 = v27;
  uint64_t v28 = swift_getOpaqueTypeConformance2();
  uint64_t v29 = v35;
  sub_1000BA728(v17, OpaqueTypeMetadata2, v28);
  uint64_t v30 = *(void (**)(char *, uint64_t))(v39 + 8);
  v30(v17, OpaqueTypeMetadata2);
  sub_1000BA728(v29, OpaqueTypeMetadata2, v28);
  return ((uint64_t (*)(char *, uint64_t))v30)(v29, OpaqueTypeMetadata2);
}

uint64_t sub_1000CE0F0()
{
  return VisualEffect.opacity(_:)();
}

void sub_1000CE174()
{
  unint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for NamedCoordinateSpace();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  void v9[2] = xmmword_100115840;
  uint64_t v10 = 0x3FF0000000000000;
  static CoordinateSpaceProtocol<>.scrollView.getter();
  GeometryProxy.bounds(of:)();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_1000CE514((uint64_t)v11, (uint64_t)&v12);
  if ((v13 & 1) == 0 && CGRectGetMinY(v12) > 0.0)
  {
    uint64_t v6 = *v0;
    char v7 = *((unsigned char *)v1 + 8);
    sub_10005464C(*v1, v7);
    char v8 = sub_100008A10(v6, v7);
    sub_100009CF8(v6, v7);
    if ((v8 & 1) == 0) {
      swift_beginAccess();
    }
  }
}

unint64_t sub_1000CE324()
{
  unint64_t result = qword_10015C1B0;
  if (!qword_10015C1B0)
  {
    type metadata accessor for EmptyVisualEffect();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015C1B0);
  }
  return result;
}

uint64_t sub_1000CE37C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = (int *)(type metadata accessor for ScrollFadingView() - 8);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(*(void *)v2 + 64);
  uint64_t v6 = v3 | 7;
  uint64_t v7 = v0 + v4;
  sub_100009CF8(*(void *)(v0 + v4), *(unsigned char *)(v0 + v4 + 8));
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v7 + v2[11], v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1000CE470()
{
  type metadata accessor for ScrollFadingView();

  return sub_1000CE0F0();
}

uint64_t sub_1000CE514(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000060EC(&qword_10015C1B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000CE57C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000CE618@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v24 = a1;
  uint64_t v29 = a2;
  uint64_t v3 = type metadata accessor for AccessibilityChildBehavior();
  uint64_t v27 = *(void *)(v3 - 8);
  uint64_t v28 = v3;
  __chkstk_darwin(v3);
  uint64_t v25 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = *(void *)(a1 + 16);
  sub_100006224(&qword_100157218);
  type metadata accessor for ModifiedContent();
  sub_100006224(&qword_100156790);
  type metadata accessor for ModifiedContent();
  sub_100006224(&qword_1001567A0);
  type metadata accessor for ModifiedContent();
  sub_100006224(&qword_100158CD0);
  swift_getTupleTypeMetadata2();
  type metadata accessor for TupleView();
  swift_getWitnessTable();
  uint64_t v5 = type metadata accessor for HStack();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  char v8 = (char *)&v22 - v7;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v33 = v5;
  uint64_t v34 = WitnessTable;
  uint64_t v22 = &opaque type descriptor for <<opaque return type of View.accessibilityElement(children:)>>;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v11 = *(void *)(OpaqueTypeMetadata2 - 8);
  uint64_t v12 = __chkstk_darwin(OpaqueTypeMetadata2);
  int v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v22 - v15;
  uint64_t v17 = *(void *)(v24 + 24);
  uint64_t v30 = v23;
  uint64_t v31 = v17;
  uint64_t v32 = v26;
  static VerticalAlignment.center.getter();
  HStack.init(alignment:spacing:content:)();
  uint64_t v18 = v25;
  static AccessibilityChildBehavior.combine.getter();
  View.accessibilityElement(children:)();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v18, v28);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v33 = v5;
  uint64_t v34 = WitnessTable;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_1000BA728(v14, OpaqueTypeMetadata2, OpaqueTypeConformance2);
  uint64_t v20 = *(void (**)(char *, uint64_t))(v11 + 8);
  v20(v14, OpaqueTypeMetadata2);
  sub_1000BA728(v16, OpaqueTypeMetadata2, OpaqueTypeConformance2);
  return ((uint64_t (*)(char *, uint64_t))v20)(v16, OpaqueTypeMetadata2);
}

uint64_t sub_1000CEA00@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v44 = a1;
  uint64_t v53 = a4;
  uint64_t v6 = sub_1000060EC(&qword_100158CC8);
  __chkstk_darwin(v6 - 8);
  uint64_t v49 = (uint64_t)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_1000060EC(&qword_100158CD0);
  uint64_t v8 = __chkstk_darwin(v52);
  uint64_t v50 = (uint64_t)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v51 = (uint64_t)&v39 - v10;
  sub_100006224(&qword_100157218);
  uint64_t v11 = type metadata accessor for ModifiedContent();
  uint64_t v45 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v39 - v12;
  sub_100006224(&qword_100156790);
  uint64_t v14 = type metadata accessor for ModifiedContent();
  uint64_t v47 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v39 - v15;
  sub_100006224(&qword_1001567A0);
  uint64_t v17 = type metadata accessor for ModifiedContent();
  uint64_t v48 = *(void *)(v17 - 8);
  uint64_t v18 = __chkstk_darwin(v17);
  uint64_t v40 = (char *)&v39 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  unint64_t v43 = (char *)&v39 - v20;
  uint64_t v42 = a2;
  uint64_t v46 = (int *)type metadata accessor for SongMetadataRowView();
  uint64_t v41 = a3;
  View.lineLimit(_:)();
  static Font.subheadline.getter();
  uint64_t v21 = sub_100006480(&qword_100157210, &qword_100157218);
  v57[6] = a3;
  v57[7] = v21;
  uint64_t WitnessTable = swift_getWitnessTable();
  View.font(_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v13, v11);
  LODWORD(v57[0]) = static HierarchicalShapeStyle.secondary.getter();
  uint64_t v23 = sub_100006480(&qword_100156788, &qword_100156790);
  v57[4] = WitnessTable;
  v57[5] = v23;
  uint64_t v24 = swift_getWitnessTable();
  uint64_t v25 = v40;
  View.foregroundStyle<A>(_:)();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v16, v14);
  uint64_t v26 = sub_100006480(&qword_100156798, &qword_1001567A0);
  v57[2] = v24;
  v57[3] = v26;
  uint64_t v27 = swift_getWitnessTable();
  uint64_t v28 = v43;
  sub_1000BA728(v25, v17, v27);
  uint64_t v29 = v48;
  uint64_t v30 = *(void (**)(char *, uint64_t))(v48 + 8);
  v30(v25, v17);
  uint64_t v31 = sub_1000CF054(v44, v42, v41);
  uint64_t v32 = v49;
  sub_1000CF5FC((uint64_t)v31, v33, v46, v49);
  swift_release();
  uint64_t v34 = static Alignment.trailing.getter();
  uint64_t v35 = v50;
  sub_100043624(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v50, 0.0, 1, 0.0, 1, v34, v36);
  sub_1000063D0(v32, &qword_100158CC8);
  uint64_t v37 = v51;
  sub_100009C30(v35, v51, &qword_100158CD0);
  (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v25, v28, v17);
  v57[0] = v25;
  sub_100009C94(v37, v35, &qword_100158CD0);
  v57[1] = v35;
  v56[0] = v17;
  v56[1] = v52;
  uint64_t v54 = v27;
  uint64_t v55 = sub_1000D3434(&qword_10015C250, &qword_100158CD0, (void (*)(void))sub_1000D32C4);
  sub_1000327E4((uint64_t)v57, 2uLL, (uint64_t)v56);
  sub_1000063D0(v37, &qword_100158CD0);
  v30(v28, v17);
  sub_1000063D0(v35, &qword_100158CD0);
  return ((uint64_t (*)(char *, uint64_t))v30)(v25, v17);
}

uint64_t (*sub_1000CF054(uint64_t a1, uint64_t a2, uint64_t a3))()
{
  uint64_t v6 = type metadata accessor for SongMetadataRowView();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v13 - v8;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v13 - v8, a1, v6);
  unint64_t v10 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a2;
  *(void *)(v11 + 24) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v11 + v10, v9, v6);
  return sub_1000D37B4;
}

uint64_t sub_1000CF18C(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for OpenURLAction();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v32 = (uint64_t)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000060EC((uint64_t *)&unk_100158FC0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for URL();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v28 - v14;
  uint64_t v33 = a1;
  sub_100009C94(v1 + *(int *)(a1 + 44), (uint64_t)v8, (uint64_t *)&unk_100158FC0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1) {
    return sub_1000063D0((uint64_t)v8, (uint64_t *)&unk_100158FC0);
  }
  uint64_t v30 = v1;
  uint64_t v31 = v4;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v15, v8, v9);
  if (qword_100156018 != -1) {
    swift_once();
  }
  uint64_t v17 = type metadata accessor for Logger();
  sub_10000E808(v17, (uint64_t)qword_100164B38);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  uint64_t v18 = Logger.logObject.getter();
  os_log_type_t v19 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v29 = v3;
    uint64_t v21 = (uint8_t *)v20;
    uint64_t v35 = swift_slowAlloc();
    *(_DWORD *)uint64_t v21 = 136315138;
    uint64_t v28 = v21 + 4;
    sub_1000D3818((unint64_t *)&qword_100156B88, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v22 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v34 = sub_1000CB67C(v22, v23, &v35);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v24 = *(void (**)(char *, uint64_t))(v10 + 8);
    v24(v13, v9);
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Opening %s", v21, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v3 = v29;
    swift_slowDealloc();
  }
  else
  {
    uint64_t v24 = *(void (**)(char *, uint64_t))(v10 + 8);
    v24(v13, v9);
  }

  uint64_t v25 = v31;
  uint64_t v26 = (void (**)(void))(v30 + *(int *)(v33 + 48));
  if (*v26) {
    (*v26)();
  }
  uint64_t v27 = v32;
  sub_1000083D4(v32);
  OpenURLAction.callAsFunction(_:)();
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v27, v3);
  return ((uint64_t (*)(char *, uint64_t))v24)(v15, v9);
}

uint64_t sub_1000CF5FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v61 = a1;
  uint64_t v62 = a2;
  uint64_t v69 = sub_1000060EC(&qword_10015C290);
  uint64_t v7 = __chkstk_darwin(v69);
  uint64_t v9 = (char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = *((void *)a3 - 1);
  __chkstk_darwin(v7);
  Swift::String v64 = (char *)&v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000060EC(&qword_10015C298);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v61 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1000060EC(&qword_10015C278);
  uint64_t v65 = *(void *)(v14 - 8);
  uint64_t v66 = v14;
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v61 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_1000060EC(&qword_10015C268);
  uint64_t v17 = __chkstk_darwin(v68);
  uint64_t v63 = (char *)&v61 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v67 = (uint64_t)&v61 - v19;
  uint64_t v20 = sub_1000060EC((uint64_t *)&unk_100158FC0);
  __chkstk_darwin(v20 - 8);
  uint64_t v22 = (char *)&v61 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009C94(v4 + a3[11], (uint64_t)v22, (uint64_t *)&unk_100158FC0);
  uint64_t v23 = type metadata accessor for URL();
  BOOL v24 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 48))(v22, 1, v23) == 1;
  uint64_t v71 = a4;
  if (v24)
  {
    sub_1000063D0((uint64_t)v22, (uint64_t *)&unk_100158FC0);
    uint64_t v25 = (void *)(v4 + a3[10]);
    uint64_t v26 = v25[1];
    *(void *)&long long v81 = *v25;
    *((void *)&v81 + 1) = v26;
    sub_10000E0F0();
    swift_bridgeObjectRetain();
    uint64_t v27 = Text.init<A>(_:)();
    uint64_t v29 = v28;
    char v31 = v30 & 1;
    static Font.subheadline.getter();
    uint64_t v32 = Text.font(_:)();
    uint64_t v34 = v33;
    char v36 = v35;
    uint64_t v70 = v37;
    swift_release();
    sub_10000E904(v27, v29, v31);
    swift_bridgeObjectRelease();
    static Color.primary.getter();
    uint64_t v38 = Text.foregroundColor(_:)();
    uint64_t v40 = v39;
    char v42 = v41;
    uint64_t v67 = v43;
    swift_release();
    v42 &= 1u;
    sub_10000E904(v32, v34, v36 & 1);
    swift_bridgeObjectRelease();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v92 = v38;
    uint64_t v93 = v40;
    char v94 = v42;
    uint64_t v95 = v67;
    uint64_t v96 = KeyPath;
    uint64_t v97 = 1;
    char v98 = 0;
    static Alignment.trailing.getter();
    sub_10004343C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v72, 0.0, 1, 0.0, 1);
    sub_10000E904(v38, v40, v42);
    swift_release();
    swift_bridgeObjectRelease();
    long long v89 = v78;
    long long v90 = v79;
    uint64_t v91 = v80;
    long long v85 = v74;
    long long v86 = v75;
    long long v45 = v77;
    long long v87 = v76;
    long long v88 = v77;
    long long v81 = v72[0];
    long long v82 = v72[1];
    long long v46 = v73;
    long long v83 = v72[2];
    long long v84 = v73;
    long long v47 = v79;
    *((_OWORD *)v9 + 8) = v78;
    *((_OWORD *)v9 + 9) = v47;
    *((void *)v9 + 20) = v91;
    long long v48 = v86;
    *((_OWORD *)v9 + 4) = v85;
    *((_OWORD *)v9 + 5) = v48;
    *((_OWORD *)v9 + 6) = v87;
    *((_OWORD *)v9 + 7) = v45;
    long long v49 = v82;
    *(_OWORD *)uint64_t v9 = v81;
    *((_OWORD *)v9 + 1) = v49;
    *((_OWORD *)v9 + 2) = v83;
    *((_OWORD *)v9 + 3) = v46;
    swift_storeEnumTagMultiPayload();
    sub_1000060EC(&qword_10015C288);
    sub_1000D3364();
    sub_1000D3434(&qword_10015C280, &qword_10015C288, (void (*)(void))sub_100017828);
    return _ConditionalContent<>.init(storage:)();
  }
  else
  {
    sub_1000063D0((uint64_t)v22, (uint64_t *)&unk_100158FC0);
    uint64_t v51 = swift_allocObject();
    *(void *)(v51 + 16) = v61;
    uint64_t v52 = v62;
    *(void *)(v51 + 24) = v62;
    __chkstk_darwin(v52);
    swift_retain();
    sub_1000060EC(&qword_100157208);
    sub_100017828();
    Button.init(action:label:)();
    sub_100009C94(v4 + a3[13], (uint64_t)v13, &qword_10015C298);
    uint64_t v53 = type metadata accessor for SongMetadataRowViewModel();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v53 - 8) + 48))(v13, 1, v53) == 1)
    {
      sub_1000063D0((uint64_t)v13, &qword_10015C298);
      uint64_t v54 = 0;
      uint64_t v55 = 0;
    }
    else
    {
      uint64_t v54 = *((void *)v13 + 6);
      uint64_t v55 = *((void *)v13 + 7);
      swift_bridgeObjectRetain();
      sub_1000D029C((uint64_t)v13);
    }
    uint64_t v56 = v64;
    (*(void (**)(char *, uint64_t, int *))(v70 + 16))(v64, v4, a3);
    if (!v55)
    {
      int v57 = &v56[a3[10]];
      uint64_t v54 = *(void *)v57;
      uint64_t v55 = *((void *)v57 + 1);
      swift_bridgeObjectRetain();
    }
    (*(void (**)(char *, int *))(v70 + 8))(v56, a3);
    *(void *)&long long v81 = v54;
    *((void *)&v81 + 1) = v55;
    sub_100006480(&qword_10015C270, &qword_10015C278);
    sub_10000E0F0();
    uint64_t v58 = (uint64_t)v63;
    uint64_t v59 = v66;
    View.accessibilityLabel<A>(_:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v65 + 8))(v16, v59);
    uint64_t v60 = v67;
    sub_100009C30(v58, v67, &qword_10015C268);
    sub_100009C94(v60, (uint64_t)v9, &qword_10015C268);
    swift_storeEnumTagMultiPayload();
    sub_1000060EC(&qword_10015C288);
    sub_1000D3364();
    sub_1000D3434(&qword_10015C280, &qword_10015C288, (void (*)(void))sub_100017828);
    _ConditionalContent<>.init(storage:)();
    return sub_1000063D0(v60, &qword_10015C268);
  }
}

uint64_t sub_1000CFE34@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for SongMetadataRowView();
  sub_10000E0F0();
  swift_bridgeObjectRetain();
  uint64_t v2 = Text.init<A>(_:)();
  uint64_t v4 = v3;
  char v6 = v5 & 1;
  static Font.subheadline.getter();
  uint64_t v7 = Text.font(_:)();
  uint64_t v9 = v8;
  char v11 = v10;
  swift_release();
  char v12 = v11 & 1;
  sub_10000E904(v2, v4, v6);
  swift_bridgeObjectRelease();
  static Color.blue.getter();
  uint64_t v13 = Text.foregroundStyle<A>(_:)();
  uint64_t v15 = v14;
  char v17 = v16;
  uint64_t v19 = v18;
  sub_10000E904(v7, v9, v12);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t result = swift_getKeyPath();
  *(void *)a1 = v13;
  *(void *)(a1 + 8) = v15;
  *(unsigned char *)(a1 + 16) = v17 & 1;
  *(void *)(a1 + 24) = v19;
  *(void *)(a1 + 32) = result;
  *(void *)(a1 + 40) = 1;
  *(unsigned char *)(a1 + 48) = 0;
  return result;
}

uint64_t sub_1000CFFAC@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v42 = a2;
  uint64_t v43 = a3;
  uint64_t v44 = a4;
  char v5 = (int *)sub_1000060EC(qword_10015C1C0);
  __chkstk_darwin(v5);
  uint64_t v7 = (uint64_t *)((char *)v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = sub_1000060EC((uint64_t *)&unk_100158FC0);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  char v11 = (char *)v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)v38 - v12;
  int v14 = *(unsigned __int8 *)a1;
  uint64_t v15 = sub_100085964();
  uint64_t v40 = v16;
  uint64_t v41 = v15;
  v38[1] = v17;
  uint64_t v39 = v18;
  uint64_t v19 = sub_1000864BC();
  unint64_t v21 = v20;
  if (v14 == 2)
  {
    uint64_t v23 = a1[4];
    uint64_t v22 = a1[5];
    sub_100010740(a1 + 1, v23);
    (*(void (**)(uint64_t, uint64_t))(v22 + 32))(v23, v22);
  }
  else
  {
    uint64_t v24 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v11, 1, 1, v24);
  }
  if (v21) {
    unint64_t v25 = v21;
  }
  else {
    unint64_t v25 = 0xE000000000000000;
  }
  if (!v21) {
    uint64_t v19 = 0;
  }
  sub_100009C30((uint64_t)v11, (uint64_t)v13, (uint64_t *)&unk_100158FC0);
  *uint64_t v7 = swift_getKeyPath();
  sub_1000060EC(&qword_100156940);
  swift_storeEnumTagMultiPayload();
  uint64_t v26 = Text.init(_:tableName:bundle:comment:)();
  uint64_t v27 = (char *)v7 + v5[9];
  *(void *)uint64_t v27 = v26;
  *((void *)v27 + 1) = v28;
  v27[16] = v29 & 1;
  *((void *)v27 + 3) = v30;
  char v31 = (uint64_t *)((char *)v7 + v5[10]);
  *char v31 = v19;
  v31[1] = v25;
  sub_100009C30((uint64_t)v13, (uint64_t)v7 + v5[11], (uint64_t *)&unk_100158FC0);
  uint64_t v32 = (char *)v7 + v5[13];
  uint64_t v33 = type metadata accessor for SongMetadataRowViewModel();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v32, 1, 1, v33);
  uint64_t v34 = (uint64_t *)((char *)v7 + v5[12]);
  uint64_t v36 = v43;
  uint64_t v35 = v44;
  *uint64_t v34 = v42;
  v34[1] = v36;
  sub_100009C30((uint64_t)v7, v35, qword_10015C1C0);
  return sub_1000D029C((uint64_t)a1);
}

uint64_t sub_1000D029C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SongMetadataRowViewModel();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1000D02F8()
{
  sub_1000D3210(319, (unint64_t *)&qword_100156A78, (uint64_t (*)(uint64_t))&type metadata accessor for OpenURLAction, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
  if (v0 <= 0x3F)
  {
    swift_checkMetadataState();
    if (v1 <= 0x3F)
    {
      sub_1000D3210(319, (unint64_t *)&qword_1001569B8, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
      if (v2 <= 0x3F)
      {
        sub_1000D3210(319, &qword_10015C248, (uint64_t (*)(uint64_t))type metadata accessor for SongMetadataRowViewModel, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

void *sub_1000D04DC(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v64 = type metadata accessor for OpenURLAction();
  uint64_t v5 = *(void *)(v64 - 8);
  if (*(void *)(v5 + 64) <= 8uLL) {
    uint64_t v6 = 8;
  }
  else {
    uint64_t v6 = *(void *)(*(void *)(v64 - 8) + 64);
  }
  uint64_t v70 = *(void *)(a3 + 16);
  uint64_t v69 = *(void *)(v70 - 8);
  int v7 = *(_DWORD *)(v69 + 80);
  uint64_t v67 = v6 + v7 + 1;
  uint64_t v68 = *(void *)(v69 + 64) + 7;
  uint64_t v71 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v71 - 8);
  int v9 = *(_DWORD *)(v8 + 80);
  uint64_t v66 = v8;
  uint64_t v10 = v9;
  if (*(_DWORD *)(v8 + 84)) {
    size_t v11 = *(void *)(v8 + 64);
  }
  else {
    size_t v11 = *(void *)(v8 + 64) + 1;
  }
  uint64_t v12 = type metadata accessor for Date.FormatStyle();
  uint64_t v13 = *(void *)(v12 - 8);
  int v14 = *(_DWORD *)(v13 + 84);
  uint64_t v65 = v13;
  uint64_t v15 = *(_DWORD *)(v13 + 80);
  uint64_t v16 = *(void *)(v13 + 64);
  uint64_t v17 = v16 + v15;
  size_t v18 = ((v16 + v15 + ((v15 + 64) & ~v15)) & ~v15) + v16;
  unsigned int v19 = v9 | *(_DWORD *)(v5 + 80) & 0xF8 | *(_DWORD *)(v13 + 80) | v7;
  if (v19 <= 7
    && ((v9 | *(_DWORD *)(v13 + 80) | *(_DWORD *)(v5 + 80) | v7) & 0x100000) == 0
    && v18
     + ((*(_DWORD *)(v13 + 80)
       + 16
       + ((v11
         + 7
         + ((v9 + ((v68 + (v67 & ~(unint64_t)v7)) & 0xFFFFFFFFFFFFFFF8) + 16) & ~(unint64_t)v9)) & 0xFFFFFFFFFFFFFFF8)) & ~(v15 | 7)) <= 0x18)
  {
    uint64_t v24 = v5;
    size_t v62 = v11 + 7;
    uint64_t v60 = *(_DWORD *)(v13 + 80) + 16;
    unsigned int v25 = a2[v6];
    unsigned int v26 = v25 - 2;
    if (v25 < 2)
    {
      uint64_t v28 = a1;
      uint64_t v29 = v66;
    }
    else
    {
      if (v6 <= 3) {
        uint64_t v27 = v6;
      }
      else {
        uint64_t v27 = 4;
      }
      uint64_t v28 = a1;
      uint64_t v29 = v66;
      switch(v27)
      {
        case 1:
          int v30 = *a2;
          if (v6 < 4) {
            goto LABEL_27;
          }
          goto LABEL_29;
        case 2:
          int v30 = *(unsigned __int16 *)a2;
          if (v6 >= 4) {
            goto LABEL_29;
          }
          goto LABEL_27;
        case 3:
          int v30 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          if (v6 < 4) {
            goto LABEL_27;
          }
          goto LABEL_29;
        case 4:
          int v30 = *(_DWORD *)a2;
          if (v6 < 4) {
LABEL_27:
          }
            unsigned int v25 = (v30 | (v26 << (8 * v6))) + 2;
          else {
LABEL_29:
          }
            unsigned int v25 = v30 + 2;
          break;
        default:
          break;
      }
    }
    int v63 = v14;
    uint64_t v58 = v17;
    size_t v59 = v18;
    uint64_t v61 = v12;
    unint64_t v31 = ~(unint64_t)v7;
    uint64_t v32 = ~v10;
    if (v25 == 1)
    {
      (*(void (**)(void *, unsigned __int8 *, uint64_t))(v24 + 16))(v28, a2, v64);
      char v33 = 1;
    }
    else
    {
      *uint64_t v28 = *(void *)a2;
      swift_retain();
      char v33 = 0;
    }
    *((unsigned char *)v28 + v6) = v33;
    unint64_t v34 = ((unint64_t)v28 + v67) & v31;
    unint64_t v35 = (unint64_t)&a2[v67] & v31;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v69 + 16))(v34, v35, v70);
    uint64_t v36 = (void *)((v68 + v34) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v37 = (void *)((v68 + v35) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v36 = *v37;
    v36[1] = v37[1];
    uint64_t v38 = (void *)(((unint64_t)v36 + v10 + 16) & v32);
    uint64_t v39 = (const void *)(((unint64_t)v37 + v10 + 16) & v32);
    uint64_t v40 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v29 + 48);
    swift_bridgeObjectRetain();
    if (v40(v39, 1, v71))
    {
      memcpy(v38, v39, v11);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v29 + 16))(v38, v39, v71);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v29 + 56))(v38, 0, 1, v71);
    }
    uint64_t v41 = v15 | 7;
    uint64_t v42 = ~(v15 | 7);
    unint64_t v43 = ((unint64_t)v38 + v62) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v44 = ((unint64_t)v39 + v62) & 0xFFFFFFFFFFFFFFF8;
    if (*(void *)v44 < 0xFFFFFFFFuLL)
    {
      *(_OWORD *)unint64_t v43 = *(_OWORD *)v44;
    }
    else
    {
      uint64_t v45 = *(void *)(v44 + 8);
      *(void *)unint64_t v43 = *(void *)v44;
      *(void *)(v43 + 8) = v45;
      swift_retain();
      uint64_t v41 = v15 | 7;
    }
    uint64_t v23 = a1;
    uint64_t v46 = ~v15;
    long long v47 = (void *)((v43 + v41 + 16) & v42);
    uint64_t v48 = v44 + v41 + 16;
    long long v49 = (void *)(v48 & v42);
    if (v63 < 0)
    {
      if ((*(unsigned int (**)(unint64_t))(v65 + 48))((v60
                                                                        + (((unint64_t)v49 + 55) & 0xFFFFFFFFFFFFFFF8)) & v46))
      {
LABEL_43:
        memcpy(v47, v49, v59);
        return v23;
      }
    }
    else
    {
      unint64_t v50 = *(void *)((v48 & v42) + 0x20);
      if (v50 >= 0xFFFFFFFF) {
        LODWORD(v50) = -1;
      }
      if (v50 != -1) {
        goto LABEL_43;
      }
    }
    *(unsigned char *)long long v47 = *(unsigned char *)v49;
    uint64_t v51 = v49[4];
    v47[4] = v51;
    v47[5] = v49[5];
    (**(void (***)(uint64_t, uint64_t))(v51 - 8))((uint64_t)(v47 + 1), (uint64_t)(v49 + 1));
    uint64_t v52 = (void *)(((unint64_t)v47 + 55) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v53 = (void *)(((unint64_t)v49 + 55) & 0xFFFFFFFFFFFFFFF8);
    void *v52 = *v53;
    v52[1] = v53[1];
    unint64_t v54 = ((unint64_t)v52 + v60) & v46;
    unint64_t v55 = ((unint64_t)v53 + v60) & v46;
    uint64_t v56 = *(void (**)(unint64_t, unint64_t, uint64_t))(v65 + 16);
    swift_bridgeObjectRetain();
    v56(v54, v55, v61);
    v56((v58 + v54) & v46, (v58 + v55) & v46, v61);
    return v23;
  }
  uint64_t v22 = *(void *)a2;
  *a1 = *(void *)a2;
  uint64_t v23 = (void *)(v22 + (((v19 | 7) + 16) & ~(unint64_t)(v19 | 7)));
  swift_retain();
  return v23;
}

uint64_t sub_1000D0AF0(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for OpenURLAction();
  if (*(void *)(*(void *)(v4 - 8) + 64) <= 8uLL) {
    uint64_t v5 = 8;
  }
  else {
    uint64_t v5 = *(void *)(*(void *)(v4 - 8) + 64);
  }
  unsigned int v6 = a1[v5];
  unsigned int v7 = v6 - 2;
  if (v6 >= 2)
  {
    if (v5 <= 3) {
      uint64_t v8 = v5;
    }
    else {
      uint64_t v8 = 4;
    }
    switch(v8)
    {
      case 1:
        int v9 = *a1;
        if (v5 >= 4) {
          goto LABEL_18;
        }
        goto LABEL_14;
      case 2:
        int v9 = *(unsigned __int16 *)a1;
        if (v5 >= 4) {
          goto LABEL_18;
        }
        goto LABEL_14;
      case 3:
        int v9 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        if (v5 < 4) {
          goto LABEL_14;
        }
        goto LABEL_18;
      case 4:
        int v9 = *(_DWORD *)a1;
        if (v5 < 4)
        {
LABEL_14:
          unsigned int v6 = (v9 | (v7 << (8 * v5))) + 2;
          break;
        }
LABEL_18:
        if (v9 != -1) {
          goto LABEL_19;
        }
        goto LABEL_16;
      default:
        break;
    }
  }
  if (v6 == 1) {
LABEL_16:
  }
    (*(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  else {
LABEL_19:
  }
    swift_release();
  uint64_t v10 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v11 = v10 + 8;
  unint64_t v12 = (unint64_t)&a1[v5 + 1 + *(unsigned __int8 *)(v10 + 80)] & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  (*(void (**)(unint64_t))(v10 + 8))(v12);
  unint64_t v13 = (*(void *)(v11 + 56) + v12 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_bridgeObjectRelease();
  uint64_t v14 = type metadata accessor for URL();
  uint64_t v15 = *(void *)(v14 - 8);
  unint64_t v16 = (v13 + *(unsigned __int8 *)(v15 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v15 + 48))(v16, 1, v14)) {
    (*(void (**)(unint64_t, uint64_t))(v15 + 8))(v16, v14);
  }
  unint64_t v17 = v16 + *(void *)(v15 + 64);
  if (!*(_DWORD *)(v15 + 84)) {
    ++v17;
  }
  size_t v18 = (void *)((v17 + 7) & 0xFFFFFFFFFFFFFFF8);
  if (*v18 >= 0xFFFFFFFFuLL) {
    swift_release();
  }
  uint64_t v19 = type metadata accessor for Date.FormatStyle();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(unsigned __int8 *)(v20 + 80);
  uint64_t v22 = (uint64_t)v18 + (v21 | 7) + 16;
  uint64_t v23 = v22 & ~(v21 | 7);
  uint64_t v24 = *(void *)(v20 + 64);
  uint64_t v25 = ~v21;
  if ((*(_DWORD *)(v20 + 84) & 0x80000000) != 0)
  {
    uint64_t v30 = *(void *)(v19 - 8);
    uint64_t result = (*(uint64_t (**)(unint64_t))(v20 + 48))((v21 + ((v23 + 55) & 0xFFFFFFFFFFFFFFF8) + 16) & v25);
    uint64_t v20 = v30;
    if (result) {
      return result;
    }
    goto LABEL_32;
  }
  unint64_t v26 = *(void *)((v22 & ~(v21 | 7)) + 0x20);
  if (v26 >= 0xFFFFFFFF) {
    LODWORD(v26) = -1;
  }
  uint64_t result = (v26 + 1);
  if (v26 == -1)
  {
LABEL_32:
    uint64_t v31 = v20;
    _s16MusicRecognition11AnyPlaylistVwxx_0(v23 + 8);
    swift_bridgeObjectRelease();
    unint64_t v28 = (v21 + ((v23 + 55) & 0xFFFFFFFFFFFFFFF8) + 16) & v25;
    uint64_t v29 = *(void (**)(unint64_t, uint64_t))(v31 + 8);
    v29(v28, v19);
    return ((uint64_t (*)(unint64_t, uint64_t))v29)((v24 + v21 + v28) & v25, v19);
  }
  return result;
}

void *sub_1000D0EC0(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for OpenURLAction();
  if (*(void *)(*(void *)(v6 - 8) + 64) <= 8uLL) {
    uint64_t v7 = 8;
  }
  else {
    uint64_t v7 = *(void *)(*(void *)(v6 - 8) + 64);
  }
  unsigned int v8 = a2[v7];
  unsigned int v9 = v8 - 2;
  if (v8 >= 2)
  {
    if (v7 <= 3) {
      uint64_t v10 = v7;
    }
    else {
      uint64_t v10 = 4;
    }
    switch(v10)
    {
      case 1:
        int v11 = *a2;
        if (v7 >= 4) {
          goto LABEL_18;
        }
        goto LABEL_14;
      case 2:
        int v11 = *(unsigned __int16 *)a2;
        if (v7 >= 4) {
          goto LABEL_18;
        }
        goto LABEL_14;
      case 3:
        int v11 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        if (v7 < 4) {
          goto LABEL_14;
        }
        goto LABEL_18;
      case 4:
        int v11 = *(_DWORD *)a2;
        if (v7 < 4)
        {
LABEL_14:
          unsigned int v8 = (v11 | (v9 << (8 * v7))) + 2;
          break;
        }
LABEL_18:
        if (v11 != -1) {
          goto LABEL_19;
        }
        goto LABEL_16;
      default:
        break;
    }
  }
  if (v8 == 1)
  {
LABEL_16:
    (*(void (**)(void *, unsigned __int8 *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    char v12 = 1;
  }
  else
  {
LABEL_19:
    *a1 = *(void *)a2;
    swift_retain();
    char v12 = 0;
  }
  *((unsigned char *)a1 + v7) = v12;
  uint64_t v13 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v14 = v13 + 16;
  uint64_t v15 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = v7 + v15 + 1;
  unint64_t v17 = ((unint64_t)a1 + v16) & ~v15;
  unint64_t v18 = (unint64_t)&a2[v16] & ~v15;
  (*(void (**)(unint64_t, unint64_t))(v13 + 16))(v17, v18);
  uint64_t v19 = *(void *)(v14 + 48) + 7;
  uint64_t v20 = (void *)((v19 + v17) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v21 = (void *)((v19 + v18) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v20 = *v21;
  v20[1] = v21[1];
  uint64_t v22 = type metadata accessor for URL();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(unsigned __int8 *)(v23 + 80);
  uint64_t v25 = (void *)(((unint64_t)v20 + v24 + 16) & ~v24);
  unint64_t v26 = (const void *)(((unint64_t)v21 + v24 + 16) & ~v24);
  uint64_t v27 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v23 + 48);
  swift_bridgeObjectRetain();
  if (v27(v26, 1, v22))
  {
    int v28 = *(_DWORD *)(v23 + 84);
    uint64_t v29 = *(void *)(v23 + 64);
    if (v28) {
      size_t v30 = *(void *)(v23 + 64);
    }
    else {
      size_t v30 = v29 + 1;
    }
    memcpy(v25, v26, v30);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v23 + 16))(v25, v26, v22);
    uint64_t v32 = *(void (**)(void *, void, uint64_t, uint64_t))(v23 + 56);
    uint64_t v31 = v23 + 56;
    v32(v25, 0, 1, v22);
    int v28 = *(_DWORD *)(v31 + 28);
    uint64_t v29 = *(void *)(v31 + 8);
  }
  if (v28) {
    uint64_t v33 = v29;
  }
  else {
    uint64_t v33 = v29 + 1;
  }
  unint64_t v34 = ((unint64_t)v25 + v33 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v35 = ((unint64_t)v26 + v33 + 7) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)v35 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)unint64_t v34 = *(_OWORD *)v35;
  }
  else
  {
    uint64_t v36 = *(void *)(v35 + 8);
    *(void *)unint64_t v34 = *(void *)v35;
    *(void *)(v34 + 8) = v36;
    swift_retain();
  }
  uint64_t v37 = type metadata accessor for Date.FormatStyle();
  uint64_t v38 = *(void *)(v37 - 8);
  uint64_t v39 = *(unsigned __int8 *)(v38 + 80);
  unint64_t v40 = v35 + (v39 | 7);
  uint64_t v41 = (void *)((v34 + (v39 | 7) + 16) & ~(v39 | 7));
  uint64_t v42 = (void *)((v40 + 16) & ~(v39 | 7));
  uint64_t v43 = ~v39;
  uint64_t v44 = *(void *)(v38 + 64);
  if ((*(_DWORD *)(v38 + 84) & 0x80000000) == 0)
  {
    unint64_t v45 = *(void *)(((v40 + 16) & ~(v39 | 7)) + 0x20);
    if (v45 >= 0xFFFFFFFF) {
      LODWORD(v45) = -1;
    }
    uint64_t v46 = v44 + v39;
    if (v45 != -1) {
      goto LABEL_36;
    }
LABEL_38:
    *(unsigned char *)uint64_t v41 = *(unsigned char *)v42;
    uint64_t v47 = v42[4];
    v41[4] = v47;
    v41[5] = v42[5];
    (**(void (***)(uint64_t, uint64_t))(v47 - 8))((uint64_t)(v41 + 1), (uint64_t)(v42 + 1));
    uint64_t v48 = (void *)(((unint64_t)v41 + 55) & 0xFFFFFFFFFFFFFFF8);
    long long v49 = (void *)(((unint64_t)v42 + 55) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v48 = *v49;
    v48[1] = v49[1];
    uint64_t v50 = ((unint64_t)v48 + v39 + 16) & v43;
    uint64_t v51 = ((unint64_t)v49 + v39 + 16) & v43;
    uint64_t v52 = *(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 16);
    swift_bridgeObjectRetain();
    v52(v50, v51, v37);
    v52((v46 + v50) & v43, (v46 + v51) & v43, v37);
    return a1;
  }
  uint64_t v46 = v44 + v39;
  if (!(*(unsigned int (**)(unint64_t))(v38 + 48))((v39
                                                                     + (((unint64_t)v42 + 55) & 0xFFFFFFFFFFFFFFF8)
                                                                     + 16) & v43))
    goto LABEL_38;
LABEL_36:
  memcpy(v41, v42, ((v46 + ((v39 + 64) & ~v39)) & ~v39) + v44);
  return a1;
}

unsigned __int8 *sub_1000D139C(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v6 = type metadata accessor for OpenURLAction();
    uint64_t v7 = *(void *)(v6 - 8);
    if (*(void *)(v7 + 64) <= 8uLL) {
      uint64_t v8 = 8;
    }
    else {
      uint64_t v8 = *(void *)(*(void *)(v6 - 8) + 64);
    }
    unsigned int v9 = a1[v8];
    unsigned int v10 = v9 - 2;
    if (v9 >= 2)
    {
      if (v8 <= 3) {
        uint64_t v11 = v8;
      }
      else {
        uint64_t v11 = 4;
      }
      switch(v11)
      {
        case 1:
          int v12 = *a1;
          if (v8 >= 4) {
            goto LABEL_19;
          }
          goto LABEL_15;
        case 2:
          int v12 = *(unsigned __int16 *)a1;
          if (v8 >= 4) {
            goto LABEL_19;
          }
          goto LABEL_15;
        case 3:
          int v12 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          if (v8 < 4) {
            goto LABEL_15;
          }
          goto LABEL_19;
        case 4:
          int v12 = *(_DWORD *)a1;
          if (v8 < 4)
          {
LABEL_15:
            unsigned int v9 = (v12 | (v10 << (8 * v8))) + 2;
            break;
          }
LABEL_19:
          if (v12 != -1) {
            goto LABEL_20;
          }
          goto LABEL_17;
        default:
          break;
      }
    }
    if (v9 == 1) {
LABEL_17:
    }
      (*(void (**)(unsigned __int8 *, uint64_t))(v7 + 8))(a1, v6);
    else {
LABEL_20:
    }
      swift_release();
    unsigned int v13 = a2[v8];
    unsigned int v14 = v13 - 2;
    if (v13 >= 2)
    {
      if (v8 <= 3) {
        uint64_t v15 = v8;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *a2;
          if (v8 >= 4) {
            goto LABEL_35;
          }
          goto LABEL_31;
        case 2:
          int v16 = *(unsigned __int16 *)a2;
          if (v8 >= 4) {
            goto LABEL_35;
          }
          goto LABEL_31;
        case 3:
          int v16 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          if (v8 < 4) {
            goto LABEL_31;
          }
          goto LABEL_35;
        case 4:
          int v16 = *(_DWORD *)a2;
          if (v8 < 4)
          {
LABEL_31:
            unsigned int v13 = (v16 | (v14 << (8 * v8))) + 2;
            break;
          }
LABEL_35:
          if (v16 != -1) {
            goto LABEL_36;
          }
          goto LABEL_33;
        default:
          break;
      }
    }
    if (v13 == 1)
    {
LABEL_33:
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v7 + 16))(a1, a2, v6);
      a1[v8] = 1;
    }
    else
    {
LABEL_36:
      *(void *)a1 = *(void *)a2;
      a1[v8] = 0;
      swift_retain();
    }
  }
  unint64_t v17 = *(void *)(*(void *)(type metadata accessor for OpenURLAction() - 8) + 64);
  if (v17 <= 8) {
    unint64_t v17 = 8;
  }
  uint64_t v18 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v19 = v18 + 24;
  uint64_t v20 = *(unsigned __int8 *)(v18 + 80);
  uint64_t v21 = v17 + v20 + 1;
  unint64_t v22 = (unint64_t)&a1[v21] & ~v20;
  unint64_t v23 = (unint64_t)&a2[v21] & ~v20;
  (*(void (**)(unint64_t, unint64_t))(v18 + 24))(v22, v23);
  uint64_t v24 = *(void *)(v19 + 40) + 7;
  uint64_t v25 = (void *)((v24 + v22) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v26 = (void *)((v24 + v23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v25 = *v26;
  v25[1] = v26[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v27 = type metadata accessor for URL();
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v29 = *(unsigned __int8 *)(v28 + 80);
  size_t v30 = (void *)(((unint64_t)v25 + v29 + 16) & ~v29);
  uint64_t v31 = (void *)(((unint64_t)v26 + v29 + 16) & ~v29);
  uint64_t v32 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v28 + 48);
  int v33 = v32(v30, 1, v27);
  int v34 = v32(v31, 1, v27);
  if (v33)
  {
    if (!v34)
    {
      (*(void (**)(void *, void *, uint64_t))(v28 + 16))(v30, v31, v27);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v28 + 56))(v30, 0, 1, v27);
      goto LABEL_50;
    }
    int v35 = *(_DWORD *)(v28 + 84);
    size_t v36 = *(void *)(v28 + 64);
  }
  else
  {
    if (!v34)
    {
      (*(void (**)(void *, void *, uint64_t))(v28 + 24))(v30, v31, v27);
      goto LABEL_50;
    }
    (*(void (**)(void *, uint64_t))(v28 + 8))(v30, v27);
    int v35 = *(_DWORD *)(v28 + 84);
    size_t v36 = *(void *)(v28 + 64);
  }
  if (v35) {
    size_t v37 = v36;
  }
  else {
    size_t v37 = v36 + 1;
  }
  memcpy(v30, v31, v37);
LABEL_50:
  if (*(_DWORD *)(v28 + 84)) {
    uint64_t v38 = *(void *)(v28 + 64);
  }
  else {
    uint64_t v38 = *(void *)(v28 + 64) + 1;
  }
  uint64_t v39 = (void *)(((unint64_t)v30 + v38 + 7) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v40 = (unint64_t *)(((unint64_t)v31 + v38 + 7) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v41 = *v40;
  if (*v39 < 0xFFFFFFFFuLL)
  {
    if (v41 >= 0xFFFFFFFF)
    {
      unint64_t v43 = v40[1];
      *uint64_t v39 = v41;
      v39[1] = v43;
      swift_retain();
      goto LABEL_60;
    }
  }
  else
  {
    if (v41 >= 0xFFFFFFFF)
    {
      unint64_t v42 = v40[1];
      *uint64_t v39 = v41;
      v39[1] = v42;
      swift_retain();
      swift_release();
      goto LABEL_60;
    }
    swift_release();
  }
  *(_OWORD *)uint64_t v39 = *(_OWORD *)v40;
LABEL_60:
  uint64_t v44 = type metadata accessor for Date.FormatStyle();
  uint64_t v45 = *(void *)(v44 - 8);
  uint64_t v46 = *(unsigned __int8 *)(v45 + 80);
  uint64_t v47 = (char *)v40 + (v46 | 7);
  uint64_t v48 = ((unint64_t)v39 + (v46 | 7) + 16) & ~(v46 | 7);
  uint64_t v49 = (unint64_t)(v47 + 16) & ~(v46 | 7);
  uint64_t v50 = *(unsigned int *)(v45 + 84);
  uint64_t v51 = ~v46;
  uint64_t v52 = *(void *)(v45 + 64);
  uint64_t v53 = v52 + v46;
  size_t v54 = ((v52 + v46 + ((v46 + 64) & ~v46)) & ~v46) + v52;
  if ((v50 & 0x80000000) != 0)
  {
    uint64_t v75 = v52 + v46;
    uint64_t v61 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v45 + 48);
    size_t v77 = ((v52 + v46 + ((v46 + 64) & ~v46)) & ~v46) + v52;
    int v74 = v61((v46 + 16 + ((v48 + 55) & 0xFFFFFFFFFFFFFFF8)) & ~v46, v50, v44);
    uint64_t v51 = ~v46;
    uint64_t v53 = v75;
    int v56 = v61((v46 + 16 + ((v49 + 55) & 0xFFFFFFFFFFFFFFF8)) & ~v46, v50, v44);
    size_t v54 = v77;
    if (!v74)
    {
LABEL_64:
      if (!v56)
      {
        *(unsigned char *)uint64_t v48 = *(unsigned char *)v49;
        sub_100018AC4((uint64_t *)(v48 + 8), (uint64_t *)(v49 + 8));
        uint64_t v68 = (void *)((v48 + 55) & 0xFFFFFFFFFFFFFFF8);
        uint64_t v69 = (void *)((v49 + 55) & 0xFFFFFFFFFFFFFFF8);
        *uint64_t v68 = *v69;
        v68[1] = v69[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v70 = ((unint64_t)v68 + v46 + 16) & v51;
        uint64_t v71 = ((unint64_t)v69 + v46 + 16) & v51;
        uint64_t v72 = *(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 24);
        v72(v70, v71, v44);
        v72((v53 + v70) & v51, (v53 + v71) & v51, v44);
        return a1;
      }
      size_t v76 = v54;
      _s16MusicRecognition11AnyPlaylistVwxx_0(v48 + 8);
      swift_bridgeObjectRelease();
      unint64_t v57 = (v46 + ((v48 + 55) & 0xFFFFFFFFFFFFFFF8) + 16) & v51;
      uint64_t v58 = *(void (**)(unint64_t, uint64_t))(v45 + 8);
      v58(v57, v44);
      v58((v53 + v57) & v51, v44);
      size_t v59 = (void *)v48;
      uint64_t v60 = (const void *)v49;
      size_t v54 = v76;
      goto LABEL_69;
    }
  }
  else
  {
    unint64_t v55 = *(void *)(((unint64_t)(v47 + 16) & ~(v46 | 7)) + 0x20);
    if (v55 >= 0xFFFFFFFF) {
      LODWORD(v55) = -1;
    }
    int v56 = v55 + 1;
    if (*(void *)(v48 + 32) > 0xFFFFFFFEuLL) {
      goto LABEL_64;
    }
  }
  if (!v56)
  {
    *(unsigned char *)uint64_t v48 = *(unsigned char *)v49;
    uint64_t v62 = *(void *)(v49 + 32);
    *(void *)(v48 + 32) = v62;
    *(void *)(v48 + 40) = *(void *)(v49 + 40);
    (**(void (***)(uint64_t, uint64_t))(v62 - 8))(v48 + 8, v49 + 8);
    int v63 = (void *)((v48 + 55) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v64 = (void *)((v49 + 55) & 0xFFFFFFFFFFFFFFF8);
    *int v63 = *v64;
    v63[1] = v64[1];
    uint64_t v65 = ((unint64_t)v63 + v46 + 16) & v51;
    uint64_t v66 = ((unint64_t)v64 + v46 + 16) & v51;
    uint64_t v67 = *(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 16);
    swift_bridgeObjectRetain();
    v67(v65, v66, v44);
    v67((v53 + v65) & v51, (v53 + v66) & v51, v44);
    return a1;
  }
  size_t v59 = (void *)v48;
  uint64_t v60 = (const void *)v49;
LABEL_69:
  memcpy(v59, v60, v54);
  return a1;
}

void *sub_1000D1BAC(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for OpenURLAction();
  if (*(void *)(*(void *)(v6 - 8) + 64) <= 8uLL) {
    uint64_t v7 = 8;
  }
  else {
    uint64_t v7 = *(void *)(*(void *)(v6 - 8) + 64);
  }
  unsigned int v8 = a2[v7];
  unsigned int v9 = v8 - 2;
  if (v8 >= 2)
  {
    if (v7 <= 3) {
      uint64_t v10 = v7;
    }
    else {
      uint64_t v10 = 4;
    }
    switch(v10)
    {
      case 1:
        int v11 = *a2;
        if (v7 >= 4) {
          goto LABEL_18;
        }
        goto LABEL_14;
      case 2:
        int v11 = *(unsigned __int16 *)a2;
        if (v7 >= 4) {
          goto LABEL_18;
        }
        goto LABEL_14;
      case 3:
        int v11 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        if (v7 < 4) {
          goto LABEL_14;
        }
        goto LABEL_18;
      case 4:
        int v11 = *(_DWORD *)a2;
        if (v7 < 4)
        {
LABEL_14:
          unsigned int v8 = (v11 | (v9 << (8 * v7))) + 2;
          break;
        }
LABEL_18:
        if (v11 != -1) {
          goto LABEL_19;
        }
        goto LABEL_16;
      default:
        break;
    }
  }
  if (v8 == 1)
  {
LABEL_16:
    (*(void (**)(void *, unsigned __int8 *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    char v12 = 1;
  }
  else
  {
LABEL_19:
    char v12 = 0;
    *a1 = *(void *)a2;
  }
  *((unsigned char *)a1 + v7) = v12;
  uint64_t v13 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v14 = v13 + 32;
  uint64_t v15 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = v7 + v15 + 1;
  unint64_t v17 = ((unint64_t)a1 + v16) & ~v15;
  unint64_t v18 = (unint64_t)&a2[v16] & ~v15;
  (*(void (**)(unint64_t, unint64_t))(v13 + 32))(v17, v18);
  uint64_t v19 = *(void *)(v14 + 32) + 7;
  uint64_t v20 = (_OWORD *)((v19 + v17) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v21 = (_OWORD *)((v19 + v18) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v20 = *v21;
  uint64_t v22 = type metadata accessor for URL();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(unsigned __int8 *)(v23 + 80);
  uint64_t v25 = (void *)(((unint64_t)v20 + v24 + 16) & ~v24);
  unint64_t v26 = (const void *)(((unint64_t)v21 + v24 + 16) & ~v24);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v23 + 48))(v26, 1, v22))
  {
    int v27 = *(_DWORD *)(v23 + 84);
    size_t v28 = *(void *)(v23 + 64);
    if (v27) {
      size_t v29 = v28;
    }
    else {
      size_t v29 = v28 + 1;
    }
    memcpy(v25, v26, v29);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v23 + 32))(v25, v26, v22);
    uint64_t v31 = *(void (**)(void *, void, uint64_t, uint64_t))(v23 + 56);
    uint64_t v30 = v23 + 56;
    v31(v25, 0, 1, v22);
    int v27 = *(_DWORD *)(v30 + 28);
    size_t v28 = *(void *)(v30 + 8);
  }
  if (v27) {
    size_t v32 = v28;
  }
  else {
    size_t v32 = v28 + 1;
  }
  unint64_t v33 = ((unint64_t)v25 + v32 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v34 = ((unint64_t)v26 + v32 + 7) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)v34 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)unint64_t v33 = *(_OWORD *)v34;
  }
  else
  {
    uint64_t v35 = *(void *)(v34 + 8);
    *(void *)unint64_t v33 = *(void *)v34;
    *(void *)(v33 + 8) = v35;
  }
  uint64_t v36 = type metadata accessor for Date.FormatStyle();
  uint64_t v37 = *(void *)(v36 - 8);
  uint64_t v38 = *(unsigned __int8 *)(v37 + 80);
  unint64_t v39 = v34 + (v38 | 7);
  unint64_t v40 = (char *)((v33 + (v38 | 7) + 16) & ~(v38 | 7));
  unint64_t v41 = (char *)((v39 + 16) & ~(v38 | 7));
  uint64_t v42 = ~v38;
  uint64_t v43 = *(void *)(v37 + 64);
  if ((*(_DWORD *)(v37 + 84) & 0x80000000) == 0)
  {
    unint64_t v44 = *(void *)(((v39 + 16) & ~(v38 | 7)) + 0x20);
    if (v44 >= 0xFFFFFFFF) {
      LODWORD(v44) = -1;
    }
    uint64_t v45 = v43 + v38;
    if (v44 != -1) {
      goto LABEL_36;
    }
LABEL_38:
    *unint64_t v40 = *v41;
    long long v46 = *(_OWORD *)(v41 + 8);
    long long v47 = *(_OWORD *)(v41 + 24);
    *((void *)v40 + 5) = *((void *)v41 + 5);
    *(_OWORD *)(v40 + 24) = v47;
    *(_OWORD *)(v40 + 8) = v46;
    uint64_t v48 = (_OWORD *)((unint64_t)(v40 + 55) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v49 = (_OWORD *)((unint64_t)(v41 + 55) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v48 = *v49;
    uint64_t v50 = ((unint64_t)v48 + v38 + 16) & v42;
    uint64_t v51 = ((unint64_t)v49 + v38 + 16) & v42;
    uint64_t v52 = *(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 32);
    v52(v50, v51, v36);
    v52((v45 + v50) & v42, (v45 + v51) & v42, v36);
    return a1;
  }
  uint64_t v45 = v43 + v38;
  if (!(*(unsigned int (**)(unint64_t))(v37 + 48))((v38
                                                                     + ((unint64_t)(v41 + 55) & 0xFFFFFFFFFFFFFFF8)
                                                                     + 16) & v42))
    goto LABEL_38;
LABEL_36:
  memcpy(v40, v41, ((v45 + ((v38 + 64) & ~v38)) & ~v38) + v43);
  return a1;
}

unsigned __int8 *sub_1000D203C(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v6 = type metadata accessor for OpenURLAction();
    uint64_t v7 = *(void *)(v6 - 8);
    if (*(void *)(v7 + 64) <= 8uLL) {
      uint64_t v8 = 8;
    }
    else {
      uint64_t v8 = *(void *)(*(void *)(v6 - 8) + 64);
    }
    unsigned int v9 = a1[v8];
    unsigned int v10 = v9 - 2;
    if (v9 >= 2)
    {
      if (v8 <= 3) {
        uint64_t v11 = v8;
      }
      else {
        uint64_t v11 = 4;
      }
      switch(v11)
      {
        case 1:
          int v12 = *a1;
          if (v8 >= 4) {
            goto LABEL_19;
          }
          goto LABEL_15;
        case 2:
          int v12 = *(unsigned __int16 *)a1;
          if (v8 >= 4) {
            goto LABEL_19;
          }
          goto LABEL_15;
        case 3:
          int v12 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          if (v8 < 4) {
            goto LABEL_15;
          }
          goto LABEL_19;
        case 4:
          int v12 = *(_DWORD *)a1;
          if (v8 < 4)
          {
LABEL_15:
            unsigned int v9 = (v12 | (v10 << (8 * v8))) + 2;
            break;
          }
LABEL_19:
          if (v12 != -1) {
            goto LABEL_20;
          }
          goto LABEL_17;
        default:
          break;
      }
    }
    if (v9 == 1) {
LABEL_17:
    }
      (*(void (**)(unsigned __int8 *, uint64_t))(v7 + 8))(a1, v6);
    else {
LABEL_20:
    }
      swift_release();
    unsigned int v13 = a2[v8];
    unsigned int v14 = v13 - 2;
    if (v13 >= 2)
    {
      if (v8 <= 3) {
        uint64_t v15 = v8;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *a2;
          if (v8 >= 4) {
            goto LABEL_35;
          }
          goto LABEL_31;
        case 2:
          int v16 = *(unsigned __int16 *)a2;
          if (v8 >= 4) {
            goto LABEL_35;
          }
          goto LABEL_31;
        case 3:
          int v16 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          if (v8 < 4) {
            goto LABEL_31;
          }
          goto LABEL_35;
        case 4:
          int v16 = *(_DWORD *)a2;
          if (v8 < 4)
          {
LABEL_31:
            unsigned int v13 = (v16 | (v14 << (8 * v8))) + 2;
            break;
          }
LABEL_35:
          if (v16 != -1) {
            goto LABEL_36;
          }
          goto LABEL_33;
        default:
          break;
      }
    }
    if (v13 == 1)
    {
LABEL_33:
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v7 + 32))(a1, a2, v6);
      char v17 = 1;
    }
    else
    {
LABEL_36:
      char v17 = 0;
      *(void *)a1 = *(void *)a2;
    }
    a1[v8] = v17;
  }
  unint64_t v18 = *(void *)(*(void *)(type metadata accessor for OpenURLAction() - 8) + 64);
  if (v18 <= 8) {
    unint64_t v18 = 8;
  }
  uint64_t v19 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v20 = v19 + 40;
  uint64_t v21 = *(unsigned __int8 *)(v19 + 80);
  uint64_t v22 = v18 + v21 + 1;
  unint64_t v23 = (unint64_t)&a1[v22] & ~v21;
  unint64_t v24 = (unint64_t)&a2[v22] & ~v21;
  (*(void (**)(unint64_t, unint64_t))(v19 + 40))(v23, v24);
  uint64_t v25 = *(void *)(v20 + 24) + 7;
  unint64_t v26 = (void *)((v25 + v23) & 0xFFFFFFFFFFFFFFF8);
  int v27 = (void *)((v25 + v24) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v26 = *v27;
  v26[1] = v27[1];
  swift_bridgeObjectRelease();
  uint64_t v28 = type metadata accessor for URL();
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v30 = *(unsigned __int8 *)(v29 + 80);
  uint64_t v31 = (void *)(((unint64_t)v26 + v30 + 16) & ~v30);
  size_t v32 = (void *)(((unint64_t)v27 + v30 + 16) & ~v30);
  unint64_t v33 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v29 + 48);
  int v34 = v33(v31, 1, v28);
  int v35 = v33(v32, 1, v28);
  if (v34)
  {
    if (!v35)
    {
      (*(void (**)(void *, void *, uint64_t))(v29 + 32))(v31, v32, v28);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v29 + 56))(v31, 0, 1, v28);
      goto LABEL_51;
    }
    int v36 = *(_DWORD *)(v29 + 84);
    size_t v37 = *(void *)(v29 + 64);
  }
  else
  {
    if (!v35)
    {
      (*(void (**)(void *, void *, uint64_t))(v29 + 40))(v31, v32, v28);
      goto LABEL_51;
    }
    (*(void (**)(void *, uint64_t))(v29 + 8))(v31, v28);
    int v36 = *(_DWORD *)(v29 + 84);
    size_t v37 = *(void *)(v29 + 64);
  }
  if (v36) {
    size_t v38 = v37;
  }
  else {
    size_t v38 = v37 + 1;
  }
  memcpy(v31, v32, v38);
LABEL_51:
  if (*(_DWORD *)(v29 + 84)) {
    uint64_t v39 = *(void *)(v29 + 64);
  }
  else {
    uint64_t v39 = *(void *)(v29 + 64) + 1;
  }
  unint64_t v40 = (void *)(((unint64_t)v31 + v39 + 7) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v41 = (unint64_t *)(((unint64_t)v32 + v39 + 7) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v42 = *v41;
  if (*v40 < 0xFFFFFFFFuLL)
  {
    if (v42 >= 0xFFFFFFFF)
    {
      unint64_t v44 = v41[1];
      *unint64_t v40 = v42;
      v40[1] = v44;
      goto LABEL_61;
    }
  }
  else
  {
    if (v42 >= 0xFFFFFFFF)
    {
      unint64_t v43 = v41[1];
      *unint64_t v40 = v42;
      v40[1] = v43;
      swift_release();
      goto LABEL_61;
    }
    swift_release();
  }
  *(_OWORD *)unint64_t v40 = *(_OWORD *)v41;
LABEL_61:
  uint64_t v45 = type metadata accessor for Date.FormatStyle();
  uint64_t v46 = *(void *)(v45 - 8);
  uint64_t v47 = *(unsigned __int8 *)(v46 + 80);
  uint64_t v48 = (char *)v41 + (v47 | 7);
  uint64_t v49 = ((unint64_t)v40 + (v47 | 7) + 16) & ~(v47 | 7);
  uint64_t v50 = (unint64_t)(v48 + 16) & ~(v47 | 7);
  uint64_t v51 = *(unsigned int *)(v46 + 84);
  uint64_t v52 = ~v47;
  uint64_t v53 = *(void *)(v46 + 64);
  uint64_t v54 = v53 + v47;
  size_t v55 = ((v53 + v47 + ((v47 + 64) & ~v47)) & ~v47) + v53;
  uint64_t v82 = ~v47;
  if ((v51 & 0x80000000) != 0)
  {
    uint64_t v81 = v53 + v47;
    int v63 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v46 + 48);
    size_t __n = ((v53 + v47 + ((v47 + 64) & ~v47)) & ~v47) + v53;
    int v79 = v63((v47 + 16 + ((v49 + 55) & 0xFFFFFFFFFFFFFFF8)) & v52, v51, v45);
    uint64_t v54 = v81;
    int v57 = v63((v47 + 16 + ((v50 + 55) & 0xFFFFFFFFFFFFFFF8)) & v52, v51, v45);
    size_t v55 = __n;
    if (!v79)
    {
LABEL_65:
      if (!v57)
      {
        *(unsigned char *)uint64_t v49 = *(unsigned char *)v50;
        _s16MusicRecognition11AnyPlaylistVwxx_0(v49 + 8);
        long long v71 = *(_OWORD *)(v50 + 8);
        long long v72 = *(_OWORD *)(v50 + 24);
        *(void *)(v49 + 40) = *(void *)(v50 + 40);
        *(_OWORD *)(v49 + 24) = v72;
        *(_OWORD *)(v49 + 8) = v71;
        long long v73 = (void *)((v49 + 55) & 0xFFFFFFFFFFFFFFF8);
        int v74 = (void *)((v50 + 55) & 0xFFFFFFFFFFFFFFF8);
        *long long v73 = *v74;
        v73[1] = v74[1];
        swift_bridgeObjectRelease();
        uint64_t v75 = ((unint64_t)v73 + v47 + 16) & v82;
        uint64_t v76 = ((unint64_t)v74 + v47 + 16) & v82;
        size_t v77 = *(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 40);
        v77(v75, v76, v45);
        v77((v54 + v75) & v82, (v54 + v76) & v82, v45);
        return a1;
      }
      size_t v58 = v55;
      _s16MusicRecognition11AnyPlaylistVwxx_0(v49 + 8);
      swift_bridgeObjectRelease();
      unint64_t v59 = (v47 + ((v49 + 55) & 0xFFFFFFFFFFFFFFF8) + 16) & v82;
      uint64_t v60 = *(void (**)(unint64_t, uint64_t))(v46 + 8);
      v60(v59, v45);
      v60((v54 + v59) & v82, v45);
      uint64_t v61 = (void *)v49;
      uint64_t v62 = (const void *)v50;
      size_t v55 = v58;
      goto LABEL_70;
    }
  }
  else
  {
    unint64_t v56 = *(void *)(((unint64_t)(v48 + 16) & ~(v47 | 7)) + 0x20);
    if (v56 >= 0xFFFFFFFF) {
      LODWORD(v56) = -1;
    }
    int v57 = v56 + 1;
    if (*(void *)(v49 + 32) > 0xFFFFFFFEuLL) {
      goto LABEL_65;
    }
  }
  if (!v57)
  {
    *(unsigned char *)uint64_t v49 = *(unsigned char *)v50;
    long long v64 = *(_OWORD *)(v50 + 8);
    long long v65 = *(_OWORD *)(v50 + 24);
    *(void *)(v49 + 40) = *(void *)(v50 + 40);
    *(_OWORD *)(v49 + 24) = v65;
    *(_OWORD *)(v49 + 8) = v64;
    uint64_t v66 = (_OWORD *)((v49 + 55) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v67 = (_OWORD *)((v50 + 55) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v66 = *v67;
    uint64_t v68 = ((unint64_t)v66 + v47 + 16) & v82;
    uint64_t v69 = ((unint64_t)v67 + v47 + 16) & v82;
    uint64_t v70 = *(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 32);
    v70(v68, v69, v45);
    v70((v54 + v68) & v82, (v54 + v69) & v82, v45);
    return a1;
  }
  uint64_t v61 = (void *)v49;
  uint64_t v62 = (const void *)v50;
LABEL_70:
  memcpy(v61, v62, v55);
  return a1;
}

uint64_t sub_1000D2814(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  unint64_t v5 = *(void *)(*(void *)(type metadata accessor for OpenURLAction() - 8) + 64);
  if (v5 <= 8) {
    unint64_t v5 = 8;
  }
  uint64_t v46 = *(void *)(a3 + 16);
  unint64_t v47 = v5;
  uint64_t v6 = *(void *)(v46 - 8);
  uint64_t v7 = *(unsigned int *)(v6 + 84);
  uint64_t v45 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v45 - 8);
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  if (v9) {
    unsigned int v10 = v9 - 1;
  }
  else {
    unsigned int v10 = 0;
  }
  if (v7 <= v10) {
    unsigned int v11 = v10;
  }
  else {
    unsigned int v11 = v7;
  }
  uint64_t v12 = *(void *)(type metadata accessor for Date.FormatStyle() - 8);
  uint64_t v13 = v12;
  unsigned int v14 = *(_DWORD *)(v12 + 84);
  if (v14 <= 0x7FFFFFFF) {
    int v15 = 0x7FFFFFFF;
  }
  else {
    int v15 = *(_DWORD *)(v12 + 84);
  }
  unsigned int v16 = v15 - 1;
  if (v11 > v16) {
    unsigned int v16 = v11;
  }
  if (v16 <= 0x7FFFFFFF) {
    unsigned int v17 = 0x7FFFFFFF;
  }
  else {
    unsigned int v17 = v16;
  }
  uint64_t v18 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v19 = *(unsigned __int8 *)(v8 + 80);
  int v20 = *(_DWORD *)(v12 + 80);
  uint64_t v21 = *(void *)(v12 + 64);
  if (v9) {
    uint64_t v22 = *(void *)(v8 + 64);
  }
  else {
    uint64_t v22 = *(void *)(v8 + 64) + 1;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v23 = v47 + v18 + 1;
  uint64_t v24 = *(void *)(v6 + 64) + 7;
  uint64_t v25 = v19 + 16;
  uint64_t v26 = *(_DWORD *)(v12 + 80);
  unint64_t v27 = v20 & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  uint64_t v28 = v22 + 7;
  uint64_t v29 = v26 + 16;
  if (a2 <= v17) {
    goto LABEL_40;
  }
  unint64_t v30 = ((v21 + v26 + ((v26 + 64) & ~v26)) & ~v26)
      + v21
      + ((v29 + ((v28 + ((v25 + ((v24 + (v23 & ~v18)) & 0xFFFFFFFFFFFFFFF8)) & ~v19)) & 0xFFFFFFFFFFFFFFF8)) & v27);
  char v31 = 8 * v30;
  if (v30 <= 3)
  {
    unsigned int v33 = ((a2 - v17 + ~(-1 << v31)) >> v31) + 1;
    if (HIWORD(v33))
    {
      int v32 = *(_DWORD *)((char *)a1 + v30);
      if (!v32) {
        goto LABEL_40;
      }
      goto LABEL_30;
    }
    if (v33 > 0xFF)
    {
      int v32 = *(unsigned __int16 *)((char *)a1 + v30);
      if (!*(unsigned __int16 *)((char *)a1 + v30)) {
        goto LABEL_40;
      }
      goto LABEL_30;
    }
    if (v33 < 2)
    {
LABEL_40:
      unint64_t v37 = ((unint64_t)a1 + v23) & ~v18;
      if (v7 == v17)
      {
        size_t v38 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v6 + 48);
        return v38(v37, v7, v46);
      }
      unint64_t v40 = (v24 + v37) & 0xFFFFFFFFFFFFFFF8;
      if ((v16 & 0x80000000) == 0)
      {
        unint64_t v41 = *(void *)(v40 + 8);
        if (v41 >= 0xFFFFFFFF) {
          LODWORD(v41) = -1;
        }
        return (v41 + 1);
      }
      unint64_t v42 = (v25 + v40) & ~v19;
      if (v10 == v17)
      {
        if (v9 < 2) {
          return 0;
        }
        unsigned int v44 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v8 + 48))(v42, v9, v45);
      }
      else if ((v14 & 0x80000000) != 0)
      {
        unsigned int v44 = (*(uint64_t (**)(unint64_t))(v13 + 48))((v29
                                                                      + ((((v29 + ((v28 + v42) & 0xFFFFFFFFFFFFFFF8)) & v27)
                                                                        + 55) & 0xFFFFFFFFFFFFFFF8)) & ~v26);
      }
      else
      {
        unint64_t v43 = *(void *)(((v29 + ((v28 + v42) & 0xFFFFFFFFFFFFFFF8)) & v27) + 0x20);
        if (v43 >= 0xFFFFFFFF) {
          LODWORD(v43) = -1;
        }
        unsigned int v44 = v43 + 1;
      }
      if (v44 >= 2) {
        return v44 - 1;
      }
      else {
        return 0;
      }
    }
  }
  int v32 = *((unsigned __int8 *)a1 + v30);
  if (!*((unsigned char *)a1 + v30)) {
    goto LABEL_40;
  }
LABEL_30:
  int v34 = (v32 - 1) << v31;
  if (v30 > 3) {
    int v34 = 0;
  }
  if (v30)
  {
    if (v30 <= 3) {
      int v35 = v30;
    }
    else {
      int v35 = 4;
    }
    switch(v35)
    {
      case 2:
        int v36 = *a1;
        break;
      case 3:
        int v36 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        int v36 = *(_DWORD *)a1;
        break;
      default:
        int v36 = *(unsigned __int8 *)a1;
        break;
    }
  }
  else
  {
    int v36 = 0;
  }
  return v17 + (v36 | v34) + 1;
}

void sub_1000D2C44(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v6 = *(void *)(*(void *)(type metadata accessor for OpenURLAction() - 8) + 64);
  if (v6 <= 8) {
    uint64_t v7 = 8;
  }
  else {
    uint64_t v7 = v6;
  }
  uint64_t v54 = *(void *)(a4 + 16);
  uint64_t v8 = *(void *)(v54 - 8);
  uint64_t v57 = v8;
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  uint64_t v53 = type metadata accessor for URL();
  uint64_t v10 = *(void *)(v53 - 8);
  uint64_t v11 = *(unsigned int *)(v10 + 84);
  if (v11) {
    unsigned int v12 = v11 - 1;
  }
  else {
    unsigned int v12 = 0;
  }
  if (v9 <= v12) {
    unsigned int v13 = v12;
  }
  else {
    unsigned int v13 = v9;
  }
  int v14 = 0;
  uint64_t v15 = *(void *)(type metadata accessor for Date.FormatStyle() - 8);
  unsigned int v16 = *(_DWORD *)(v15 + 84);
  uint64_t v17 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v18 = *(void *)(v8 + 64);
  uint64_t v19 = *(unsigned __int8 *)(v10 + 80);
  if (v16 <= 0x7FFFFFFF) {
    unsigned int v20 = 0x7FFFFFFF;
  }
  else {
    unsigned int v20 = *(_DWORD *)(v15 + 84);
  }
  unsigned int v21 = v20 - 1;
  if (v13 > v20 - 1) {
    unsigned int v21 = v13;
  }
  if (v21 <= 0x7FFFFFFF) {
    unsigned int v22 = 0x7FFFFFFF;
  }
  else {
    unsigned int v22 = v21;
  }
  uint64_t v23 = v7 + v17 + 1;
  uint64_t v24 = v18 + 7;
  uint64_t v25 = v19 + 16;
  unint64_t v26 = (v19 + 16 + ((v18 + 7 + (v23 & ~v17)) & 0xFFFFFFFFFFFFFFF8)) & ~v19;
  if (v11) {
    uint64_t v27 = *(void *)(v10 + 64);
  }
  else {
    uint64_t v27 = *(void *)(v10 + 64) + 1;
  }
  uint64_t v28 = *(_DWORD *)(v15 + 80);
  unint64_t v29 = *(_DWORD *)(v15 + 80) & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  size_t v30 = ((*(void *)(v15 + 64) + v28 + ((v28 + 64) & ~v28)) & ~v28) + *(void *)(v15 + 64);
  uint64_t v31 = v27 + 7;
  unint64_t v32 = (v27 + 7 + v26) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v33 = v28 + 16;
  size_t v34 = ((v28 + 16 + v32) & v29) + v30;
  if (a3 > v22)
  {
    if (v34 <= 3)
    {
      unsigned int v35 = ((a3 - v22 + ~(-1 << (8 * v34))) >> (8 * v34)) + 1;
      if (HIWORD(v35))
      {
        int v14 = 4;
      }
      else if (v35 >= 0x100)
      {
        int v14 = 2;
      }
      else
      {
        int v14 = v35 > 1;
      }
    }
    else
    {
      int v14 = 1;
    }
  }
  if (v22 < a2)
  {
    unsigned int v36 = ~v22 + a2;
    if (v34 < 4)
    {
      int v37 = (v36 >> (8 * v34)) + 1;
      if (v34)
      {
        int v41 = v36 & ~(-1 << (8 * v34));
        bzero(a1, v34);
        if (v34 == 3)
        {
          *(_WORD *)a1 = v41;
          a1[2] = BYTE2(v41);
        }
        else if (v34 == 2)
        {
          *(_WORD *)a1 = v41;
        }
        else
        {
          *a1 = v41;
        }
      }
    }
    else
    {
      bzero(a1, v34);
      *(_DWORD *)a1 = v36;
      int v37 = 1;
    }
    switch(v14)
    {
      case 1:
        a1[v34] = v37;
        return;
      case 2:
        *(_WORD *)&a1[v34] = v37;
        return;
      case 3:
        goto LABEL_83;
      case 4:
        *(_DWORD *)&a1[v34] = v37;
        return;
      default:
        return;
    }
  }
  uint64_t v38 = ~v17;
  uint64_t v39 = ~v19;
  uint64_t v40 = ~v28;
  switch(v14)
  {
    case 1:
      a1[v34] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_41;
    case 2:
      *(_WORD *)&a1[v34] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_41;
    case 3:
LABEL_83:
      __break(1u);
      JUMPOUT(0x1000D31C0);
    case 4:
      *(_DWORD *)&a1[v34] = 0;
      goto LABEL_40;
    default:
LABEL_40:
      if (!a2) {
        return;
      }
LABEL_41:
      unint64_t v42 = (unint64_t)&a1[v23] & v38;
      if (v9 == v22)
      {
        unint64_t v43 = *(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(v57 + 56);
        uint64_t v44 = a2;
        uint64_t v45 = v9;
        uint64_t v46 = v54;
LABEL_43:
        v43(v42, v44, v45, v46);
        return;
      }
      unint64_t v47 = (void *)((v24 + v42) & 0xFFFFFFFFFFFFFFF8);
      if ((v21 & 0x80000000) == 0)
      {
        if ((a2 & 0x80000000) != 0)
        {
          *unint64_t v47 = a2 ^ 0x80000000;
          v47[1] = 0;
        }
        else
        {
          v47[1] = a2 - 1;
        }
        return;
      }
      unint64_t v42 = ((unint64_t)v47 + v25) & v39;
      if (v12 == v22)
      {
        if (v11 < 2) {
          return;
        }
        uint64_t v44 = a2 + 1;
        unint64_t v43 = *(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
        uint64_t v45 = v11;
        uint64_t v46 = v53;
        goto LABEL_43;
      }
      uint64_t v48 = (unsigned char *)((v33 + ((v31 + v42) & 0xFFFFFFFFFFFFFFF8)) & v29);
      if (a2 + 1 <= v20)
      {
        if (a2 != -1)
        {
          if ((v16 & 0x80000000) != 0)
          {
            uint64_t v52 = *(void (**)(unint64_t, void))(v15 + 56);
            v52((v33 + ((unint64_t)(v48 + 55) & 0xFFFFFFFFFFFFFFF8)) & v40, a2 + 1);
          }
          else if (((a2 + 1) & 0x80000000) != 0)
          {
            *(_OWORD *)(((v33 + ((v31 + v42) & 0xFFFFFFFFFFFFFFF8)) & v29) + 0x10) = 0u;
            *(_OWORD *)(((v33 + ((v31 + v42) & 0xFFFFFFFFFFFFFFF8)) & v29) + 0x20) = 0u;
            *(void *)(((v33 + ((v31 + v42) & 0xFFFFFFFFFFFFFFF8)) & v29) + 8) = a2 - 0x7FFFFFFF;
          }
          else
          {
            *(void *)(((v33 + ((v31 + v42) & 0xFFFFFFFFFFFFFFF8)) & v29) + 0x20) = a2;
          }
        }
      }
      else
      {
        if (v30 <= 3) {
          int v49 = ~(-1 << (8 * v30));
        }
        else {
          int v49 = -1;
        }
        if (v30)
        {
          int v50 = v49 & (a2 - v20);
          if (v30 <= 3) {
            int v51 = v30;
          }
          else {
            int v51 = 4;
          }
          bzero(v48, v30);
          switch(v51)
          {
            case 2:
              *(_WORD *)uint64_t v48 = v50;
              break;
            case 3:
              *(_WORD *)uint64_t v48 = v50;
              v48[2] = BYTE2(v50);
              break;
            case 4:
              *(_DWORD *)uint64_t v48 = v50;
              break;
            default:
              *uint64_t v48 = v50;
              break;
          }
        }
      }
      return;
  }
}

uint64_t type metadata accessor for SongMetadataRowView()
{
  return sub_100020608();
}

void sub_1000D3210(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_1000D3274()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000D32B8@<X0>(uint64_t a1@<X8>)
{
  return sub_1000CEA00(v1[4], v1[2], v1[3], a1);
}

unint64_t sub_1000D32C4()
{
  unint64_t result = qword_10015C258;
  if (!qword_10015C258)
  {
    sub_100006224(&qword_100158CC8);
    sub_1000D3364();
    sub_1000D3434(&qword_10015C280, &qword_10015C288, (void (*)(void))sub_100017828);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015C258);
  }
  return result;
}

unint64_t sub_1000D3364()
{
  unint64_t result = qword_10015C260;
  if (!qword_10015C260)
  {
    sub_100006224(&qword_10015C268);
    sub_100006480(&qword_10015C270, &qword_10015C278);
    sub_1000D3818((unint64_t *)&qword_1001567D8, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015C260);
  }
  return result;
}

uint64_t sub_1000D3434(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100006224(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000D34BC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000D34F4@<X0>(uint64_t a1@<X8>)
{
  return sub_1000CFE34(a1);
}

uint64_t sub_1000D3500()
{
  uint64_t v1 = *(void *)(v0 + 16);
  unint64_t v2 = (int *)type metadata accessor for SongMetadataRowView();
  uint64_t v3 = *(unsigned __int8 *)(*((void *)v2 - 1) + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = *(void *)(*((void *)v2 - 1) + 64);
  uint64_t v6 = v0 + v4;
  sub_1000060EC(&qword_100156940);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = type metadata accessor for OpenURLAction();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v0 + v4, v7);
  }
  else
  {
    swift_release();
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v6 + v2[9], v1);
  swift_bridgeObjectRelease();
  uint64_t v8 = v6 + v2[11];
  uint64_t v9 = type metadata accessor for URL();
  uint64_t v10 = *(void *)(v9 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9)) {
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  }
  if (*(void *)(v6 + v2[12])) {
    swift_release();
  }
  uint64_t v11 = v6 + v2[13];
  uint64_t v12 = type metadata accessor for SongMetadataRowViewModel();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48))(v11, 1, v12))
  {
    _s16MusicRecognition11AnyPlaylistVwxx_0(v11 + 8);
    swift_bridgeObjectRelease();
    uint64_t v13 = v11 + *(int *)(v12 + 28);
    uint64_t v14 = type metadata accessor for Date.FormatStyle();
    uint64_t v15 = *(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8);
    v15(v13, v14);
    v15(v11 + *(int *)(v12 + 32), v14);
  }

  return _swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_1000D37B4()
{
  uint64_t v0 = type metadata accessor for SongMetadataRowView();
  return sub_1000CF18C(v0);
}

uint64_t sub_1000D3818(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000D3860()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_1000D398C(void *a1, void *a2, unsigned __int8 a3)
{
  if (a3 != 0xFF)
  {
    sub_10002659C(a1, a2, a3);
    if (SHSession.Result.wasCancelled.getter())
    {
      sub_1000A9540(0);
      sub_100014BF8(a1, a2, a3);
      return;
    }
    if (a3)
    {
      if (a3 != 1)
      {
        swift_errorRetain();
        sub_1000060EC(&qword_1001577C8);
        sub_1000150F8(0, (unint64_t *)&qword_100159978);
        if (swift_dynamicCast())
        {
          id v6 = v15;
          sub_1000A9540((uint64_t)v15);
          sub_100014BF8(a1, a2, 2u);

          swift_errorRelease();
          return;
        }
        swift_errorRelease();
      }
      goto LABEL_26;
    }
    sub_10002659C(a1, a2, 0);
    id v7 = [a1 mediaItems];
    sub_1000150F8(0, (unint64_t *)&qword_1001578D0);
    unint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v8 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v9 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (!v9)
    {
      sub_100014BF8(a1, a2, 0);
LABEL_26:
      sub_1000A9540(0);
      sub_100014BF8(a1, a2, a3);
      return;
    }
    id v10 = [a1 mediaItems];
    unint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v11 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v13 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v13)
      {
LABEL_18:
        if ((v11 & 0xC000000000000001) == 0)
        {
          if (!*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            return;
          }
          id v12 = *(id *)(v11 + 32);
          goto LABEL_21;
        }
LABEL_31:
        id v12 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_21:
        id v14 = v12;
        swift_bridgeObjectRelease();
        sub_1000A8D88(v14);
        sub_100014BF8(a1, a2, 0);
        sub_100014BF8(a1, a2, 0);

        return;
      }
    }
    else if (*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_18;
    }
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_31;
  }

  sub_1000A8CA0();
}

void sub_1000D3CDC(void *a1, void *a2, unsigned __int8 a3)
{
  int v7 = ~a3;
  uint64_t v8 = sub_1000060EC(&qword_100157038);
  __chkstk_darwin(v8 - 8);
  id v10 = (char *)v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v7)
  {
    sub_10002659C(a1, a2, a3);
    if (SHSession.Result.wasCancelled.getter())
    {
      unint64_t v11 = *(void **)&v3[OBJC_IVAR____TtC16MusicRecognition22ListeningAccessoryView_listeningView];
      [v11 setHidden:0];
      if (qword_100156128 != -1) {
        swift_once();
      }
      NSString v12 = String._bridgeToObjectiveC()();
      [v11 setState:v12];

      [*(id *)&v3[OBJC_IVAR____TtC16MusicRecognition22ListeningAccessoryView_imageView] setHidden:1];
      sub_100014BF8(a1, a2, a3);
      return;
    }
    if (a3)
    {
      if (a3 != 1)
      {
        v32[1] = a1;
        swift_errorRetain();
        sub_1000060EC(&qword_1001577C8);
        sub_1000150F8(0, (unint64_t *)&qword_100159978);
        if (swift_dynamicCast())
        {
          id v10 = *(char **)&v3[OBJC_IVAR____TtC16MusicRecognition22ListeningAccessoryView_listeningView];
          unint64_t v16 = (unint64_t)v32[0];
          uint64_t v17 = (SEL *)&selRef_setDeviceToDeviceEncryptionUpgradeType_;
          [v10 setHidden:0];
          if (qword_100156128 == -1)
          {
LABEL_17:
            NSString v18 = String._bridgeToObjectiveC()();
            [v10 setState:v18];

            [*(id *)&v3[OBJC_IVAR____TtC16MusicRecognition22ListeningAccessoryView_imageView] setImage:[UIImage imageNamed:@"MusicRecognition.bundle/ListeningAccessoryView_imageView"]];
            sub_100014BF8(a1, a2, 2u);

            swift_errorRelease();
            return;
          }
LABEL_37:
          swift_once();
          goto LABEL_17;
        }
        swift_errorRelease();
      }
      goto LABEL_29;
    }
    sub_10002659C(a1, a2, 0);
    id v19 = [a1 mediaItems];
    sub_1000150F8(0, (unint64_t *)&qword_1001578D0);
    unint64_t v20 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v20 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v21 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v21 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (!v21)
    {
      sub_100014BF8(a1, a2, 0);
LABEL_29:
      unint64_t v29 = *(void **)&v3[OBJC_IVAR____TtC16MusicRecognition22ListeningAccessoryView_listeningView];
      [v29 setHidden:0];
      if (qword_100156128 != -1) {
        swift_once();
      }
      NSString v30 = String._bridgeToObjectiveC()();
      [v29 setState:v30];

      [*(id *)&v3[OBJC_IVAR____TtC16MusicRecognition22ListeningAccessoryView_imageView] setHidden:1];
      sub_100014BF8(a1, a2, a3);
      return;
    }
    uint64_t v17 = (SEL *)[a1 mediaItems];
    unint64_t v16 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v16 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v31 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v31)
      {
LABEL_23:
        if ((v16 & 0xC000000000000001) == 0)
        {
          if (!*(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            goto LABEL_37;
          }
          id v22 = *(id *)(v16 + 32);
LABEL_26:
          uint64_t v23 = v22;
          swift_bridgeObjectRelease();
          [*(id *)&v3[OBJC_IVAR____TtC16MusicRecognition22ListeningAccessoryView_imageView] setHidden:0];
          [*(id *)&v3[OBJC_IVAR____TtC16MusicRecognition22ListeningAccessoryView_listeningView] setHidden:1];
          uint64_t v24 = type metadata accessor for TaskPriority();
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v10, 1, 1, v24);
          type metadata accessor for MainActor();
          uint64_t v25 = v3;
          id v26 = v23;
          uint64_t v27 = static MainActor.shared.getter();
          uint64_t v28 = (void *)swift_allocObject();
          v28[2] = v27;
          v28[3] = &protocol witness table for MainActor;
          v28[4] = v25;
          v28[5] = v26;
          sub_1000DC37C((uint64_t)v10, (uint64_t)&unk_10015C320, (uint64_t)v28);
          swift_release();
          sub_100014BF8(a1, a2, 0);
          sub_100014BF8(a1, a2, 0);

          return;
        }
LABEL_35:
        id v22 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        goto LABEL_26;
      }
    }
    else if (*(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v13 = *(void **)&v3[OBJC_IVAR____TtC16MusicRecognition22ListeningAccessoryView_listeningView];
  [v13 setHidden:0];
  if (qword_100156130 != -1) {
    swift_once();
  }
  NSString v14 = String._bridgeToObjectiveC()();
  [v13 setState:v14];

  uint64_t v15 = *(void **)&v3[OBJC_IVAR____TtC16MusicRecognition22ListeningAccessoryView_imageView];
  [v15 setHidden:1];

  [v15 setAccessibilityIdentifier:0];
}

void sub_1000D43B8(void *a1, void *a2, unsigned __int8 a3)
{
  if (a3 != 0xFF)
  {
    sub_10002659C(a1, a2, a3);
    if (SHSession.Result.wasCancelled.getter())
    {
      [*(id *)(v3 + OBJC_IVAR____TtC16MusicRecognition21WaveformAccessoryView_waveformView) setHidden:1];
      [*(id *)(v3 + OBJC_IVAR____TtC16MusicRecognition21WaveformAccessoryView_listeningView) setHidden:1];
      sub_100014BF8(a1, a2, a3);
      return;
    }
    if (a3)
    {
      if (a3 != 1)
      {
        swift_errorRetain();
        sub_1000060EC(&qword_1001577C8);
        sub_1000150F8(0, (unint64_t *)&qword_100159978);
        if (swift_dynamicCast())
        {
          uint64_t v8 = *(void **)(v3 + OBJC_IVAR____TtC16MusicRecognition21WaveformAccessoryView_waveformView);
          id v9 = v18;
          [v8 setHidden:1];
          [*(id *)(v3 + OBJC_IVAR____TtC16MusicRecognition21WaveformAccessoryView_listeningView) setHidden:1];
          sub_100014BF8(a1, a2, 2u);

          swift_errorRelease();
          return;
        }
        swift_errorRelease();
      }
      goto LABEL_26;
    }
    sub_10002659C(a1, a2, 0);
    id v10 = [a1 mediaItems];
    sub_1000150F8(0, (unint64_t *)&qword_1001578D0);
    unint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v11 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v12 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (!v12)
    {
      sub_100014BF8(a1, a2, 0);
LABEL_26:
      [*(id *)(v3 + OBJC_IVAR____TtC16MusicRecognition21WaveformAccessoryView_waveformView) setHidden:1];
      [*(id *)(v3 + OBJC_IVAR____TtC16MusicRecognition21WaveformAccessoryView_listeningView) setHidden:1];
      sub_100014BF8(a1, a2, a3);
      return;
    }
    id v13 = [a1 mediaItems];
    unint64_t v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v14 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v16 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v16)
      {
LABEL_18:
        if ((v14 & 0xC000000000000001) == 0)
        {
          if (!*(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            return;
          }
          id v15 = *(id *)(v14 + 32);
          goto LABEL_21;
        }
LABEL_31:
        id v15 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_21:
        id v17 = v15;
        swift_bridgeObjectRelease();
        [*(id *)(v3 + OBJC_IVAR____TtC16MusicRecognition21WaveformAccessoryView_waveformView) setHidden:1];
        [*(id *)(v3 + OBJC_IVAR____TtC16MusicRecognition21WaveformAccessoryView_listeningView) setHidden:0];
        sub_100014BF8(a1, a2, 0);
        sub_100014BF8(a1, a2, 0);

        return;
      }
    }
    else if (*(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_18;
    }
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_31;
  }
  [*(id *)(v3 + OBJC_IVAR____TtC16MusicRecognition21WaveformAccessoryView_waveformView) setHidden:0];
  int v7 = *(void **)(v3 + OBJC_IVAR____TtC16MusicRecognition21WaveformAccessoryView_listeningView);

  [v7 setHidden:1];
}

void sub_1000D4814(void *a1, void *a2, unsigned __int8 a3)
{
  int v7 = ~a3;
  uint64_t v8 = sub_1000060EC(&qword_100157038);
  __chkstk_darwin(v8 - 8);
  id v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!v7)
  {
    *(void *)&v3[OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_maximumLayoutMode] = 4;
    *(void *)&v3[OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_preferredLayoutMode] = 3;
    if (qword_100156120 != -1) {
      swift_once();
    }
    if (*(unsigned char *)(qword_100164BD0 + OBJC_IVAR____TtC16MusicRecognition15MusicRecognizer_isRetryAttempt) == 1) {
      sub_100014180(84.0);
    }
    id v28 = objc_retain(*(id *)(*(void *)&v3[OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_matchingFlowView]
                            + OBJC_IVAR____TtC16MusicRecognition22MatchingFlowCustomView_listeningView));
    sub_10009C3BC();
    goto LABEL_9;
  }
  sub_10002659C(a1, a2, a3);
  if (SHSession.Result.wasCancelled.getter())
  {
    uint64_t v11 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
    type metadata accessor for MainActor();
    uint64_t v12 = v3;
    uint64_t v13 = static MainActor.shared.getter();
    unint64_t v14 = (void *)swift_allocObject();
    v14[2] = v13;
    v14[3] = &protocol witness table for MainActor;
    v14[4] = v12;
    sub_1000DC37C((uint64_t)v10, (uint64_t)&unk_10015C328, (uint64_t)v14);
    swift_release();
LABEL_28:
    sub_100014BF8(a1, a2, a3);
    return;
  }
  if (a3)
  {
    if (a3 != 1)
    {
      NSString v30 = a1;
      swift_errorRetain();
      sub_1000060EC(&qword_1001577C8);
      sub_1000150F8(0, (unint64_t *)&qword_100159978);
      if (swift_dynamicCast())
      {
        uint64_t v16 = *(void **)(*(void *)&v3[OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_matchingFlowView]
                       + OBJC_IVAR____TtC16MusicRecognition22MatchingFlowCustomView_listeningView);
        id v17 = v29;
        id v18 = v16;
        sub_10009C3BC();

        sub_100014BF8(a1, a2, 2u);
        swift_errorRelease();
        return;
      }
      swift_errorRelease();
    }
    goto LABEL_27;
  }
  sub_10002659C(a1, a2, 0);
  id v19 = [a1 mediaItems];
  sub_1000150F8(0, (unint64_t *)&qword_1001578D0);
  unint64_t v20 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v20 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v21 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v21 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (!v21)
  {
    sub_100014BF8(a1, a2, 0);
LABEL_27:
    id v25 = objc_retain(*(id *)(*(void *)&v3[OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_matchingFlowView]
                            + OBJC_IVAR____TtC16MusicRecognition22MatchingFlowCustomView_listeningView));
    sub_10009C3BC();

    goto LABEL_28;
  }
  id v22 = [a1 mediaItems];
  unint64_t v23 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v23 >> 62))
  {
    if (*(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_21;
    }
LABEL_31:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_32;
  }
  swift_bridgeObjectRetain();
  uint64_t v26 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v26) {
    goto LABEL_31;
  }
LABEL_21:
  if ((v23 & 0xC000000000000001) == 0)
  {
    if (!*(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    id v24 = *(id *)(v23 + 32);
    goto LABEL_24;
  }
LABEL_32:
  id v24 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_24:
  id v28 = v24;
  swift_bridgeObjectRelease();
  sub_1000151A4();
  sub_100014BF8(a1, a2, 0);
  sub_100014BF8(a1, a2, 0);
LABEL_9:
  id v15 = v28;
}

void sub_1000D4CFC(void *a1, void *a2, unsigned __int8 a3)
{
  if (a3 != 0xFF)
  {
    sub_10002659C(a1, a2, a3);
    if (SHSession.Result.wasCancelled.getter())
    {
      id v7 = [*(id *)(v3 + OBJC_IVAR____TtC16MusicRecognition30AmbientCompactMatchingFlowView_imageView) layer];
      [v7 removeAllAnimations];

      sub_100014BF8(a1, a2, a3);
      return;
    }
    if (a3)
    {
      if (a3 != 1)
      {
        swift_errorRetain();
        sub_1000060EC(&qword_1001577C8);
        sub_1000150F8(0, (unint64_t *)&qword_100159978);
        if (swift_dynamicCast())
        {
          uint64_t v8 = *(void **)(v3 + OBJC_IVAR____TtC16MusicRecognition30AmbientCompactMatchingFlowView_imageView);
          id v9 = v21;
          id v10 = [v8 layer];
          [v10 removeAllAnimations];

          sub_100014BF8(a1, a2, 2u);
          swift_errorRelease();
          return;
        }
        swift_errorRelease();
      }
      goto LABEL_26;
    }
    sub_10002659C(a1, a2, 0);
    id v11 = [a1 mediaItems];
    sub_1000150F8(0, (unint64_t *)&qword_1001578D0);
    unint64_t v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v12 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v13 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v13 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (!v13)
    {
      sub_100014BF8(a1, a2, 0);
LABEL_26:
      id v18 = [*(id *)(v3 + OBJC_IVAR____TtC16MusicRecognition30AmbientCompactMatchingFlowView_imageView) layer];
      [v18 removeAllAnimations];

      sub_100014BF8(a1, a2, a3);
      return;
    }
    id v14 = [a1 mediaItems];
    unint64_t v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v15 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v19 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v19)
      {
LABEL_18:
        if ((v15 & 0xC000000000000001) == 0)
        {
          if (!*(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            return;
          }
          id v16 = *(id *)(v15 + 32);
          goto LABEL_21;
        }
LABEL_31:
        id v16 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_21:
        id v20 = v16;
        swift_bridgeObjectRelease();
        id v17 = [*(id *)(v3 + OBJC_IVAR____TtC16MusicRecognition30AmbientCompactMatchingFlowView_imageView) layer];
        [v17 removeAllAnimations];

        sub_100014BF8(a1, a2, 0);
        sub_100014BF8(a1, a2, 0);

        return;
      }
    }
    else if (*(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_18;
    }
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_31;
  }

  sub_1000F5338();
}

void sub_1000D5110(void *a1, void *a2, unsigned __int8 a3)
{
  if (a3 == 0xFF)
  {
    id v7 = *(void **)(v3 + OBJC_IVAR____TtC16MusicRecognition23AmbientMatchingFlowView_listeningView);
    [v7 setAlpha:1.0];
    [v7 setHidden:0];
    [*(id *)(v3 + OBJC_IVAR____TtC16MusicRecognition23AmbientMatchingFlowView_matchView) setHidden:1];
    [*(id *)(v3 + OBJC_IVAR____TtC16MusicRecognition23AmbientMatchingFlowView_noMatchView) setHidden:1];
    uint64_t v8 = sub_100065394();
    [*(id *)&v8[OBJC_IVAR____TtC16MusicRecognition23AmbientMatchingFlowView_listeningView] setAlpha:1.0];
    id v9 = self;
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v8;
    aBlock[4] = sub_1000D7A74;
    aBlock[5] = v10;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1000D559C;
    aBlock[3] = &unk_10014D2C8;
    id v11 = _Block_copy(aBlock);
    unint64_t v12 = v8;
    swift_release();
    [v9 animateWithDuration:24 delay:v11 options:0 animations:1.2 completion:0.0];
    _Block_release(v11);

    return;
  }
  sub_10002659C(a1, a2, a3);
  if (SHSession.Result.wasCancelled.getter())
  {
    sub_100066A80(0);
    sub_100014BF8(a1, a2, a3);
    return;
  }
  if (a3)
  {
    if (a3 != 1)
    {
      aBlock[0] = a1;
      swift_errorRetain();
      sub_1000060EC(&qword_1001577C8);
      sub_1000150F8(0, (unint64_t *)&qword_100159978);
      if (swift_dynamicCast())
      {
        id v13 = v22;
        sub_100066A80((uint64_t)v22);
        sub_100014BF8(a1, a2, 2u);

        swift_errorRelease();
        return;
      }
      swift_errorRelease();
    }
    goto LABEL_24;
  }
  sub_10002659C(a1, a2, 0);
  id v14 = [a1 mediaItems];
  sub_1000150F8(0, (unint64_t *)&qword_1001578D0);
  unint64_t v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v15 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v16 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v16 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (!v16)
  {
    sub_100014BF8(a1, a2, 0);
LABEL_24:
    sub_100066A80(0);
    sub_100014BF8(a1, a2, a3);
    return;
  }
  id v17 = [a1 mediaItems];
  unint64_t v18 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v18 >> 62))
  {
    if (*(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_16;
    }
LABEL_28:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_29;
  }
  swift_bridgeObjectRetain();
  uint64_t v20 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v20) {
    goto LABEL_28;
  }
LABEL_16:
  if ((v18 & 0xC000000000000001) == 0)
  {
    if (!*(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    id v19 = *(id *)(v18 + 32);
    goto LABEL_19;
  }
LABEL_29:
  id v19 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_19:
  id v21 = v19;
  swift_bridgeObjectRelease();
  sub_100065FB0(v21);
  sub_100014BF8(a1, a2, 0);
  sub_100014BF8(a1, a2, 0);
}

uint64_t sub_1000D559C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_1000D55E0(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    sub_1000060EC(&qword_1001577C8);
    uint64_t v4 = swift_allocError();
    void *v5 = a2;
    id v6 = a2;
    return _swift_continuation_throwingResumeWithError(v2, v4);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    return _swift_continuation_throwingResume(v7);
  }
}

uint64_t sub_1000D5678(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for TaskPriority();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_1000063D0(a1, &qword_100157038);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

id sub_1000D5874()
{
  uint64_t v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = sub_1000060EC(&qword_100157038);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42.receiver = v1;
  v42.super_class = ObjectType;
  [super viewDidLoad];
  id result = [v1 view];
  if (!result)
  {
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v7 = result;
  id v8 = [self blackColor];
  [v7 setBackgroundColor:v8];

  id result = [v1 view];
  if (!result)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  id v9 = result;
  [result setLayoutMargins:32.0, 32.0, 32.0, 32.0];

  id result = [v1 view];
  if (!result)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v10 = result;
  [result setTranslatesAutoresizingMaskIntoConstraints:0];

  id v11 = *(void **)&v1[OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionAmbientViewController_matchingFlowView];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  id result = [v1 view];
  if (!result)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  unint64_t v12 = result;
  v41[0] = v5;
  [result addSubview:v11];

  sub_1000060EC(&qword_100157030);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_100110690;
  id v14 = [v11 topAnchor];
  id result = [v1 view];
  if (!result)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  unint64_t v15 = result;
  id v16 = [result layoutMarginsGuide];

  id v17 = [v16 topAnchor];
  id v18 = [v14 constraintEqualToAnchor:v17];

  *(void *)(v13 + 32) = v18;
  id v19 = [v11 bottomAnchor];
  id result = [v1 view];
  if (!result)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v20 = result;
  id v21 = [result layoutMarginsGuide];

  id v22 = [v21 bottomAnchor];
  id v23 = [v19 constraintEqualToAnchor:v22];

  *(void *)(v13 + 40) = v23;
  id v24 = [v11 leadingAnchor];
  id result = [v1 view];
  if (!result)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  id v25 = result;
  id v26 = [result layoutMarginsGuide];

  id v27 = [v26 leadingAnchor];
  id v28 = [v24 constraintEqualToAnchor:v27];

  *(void *)(v13 + 48) = v28;
  id v29 = [v11 trailingAnchor];
  id result = [v1 view];
  if (result)
  {
    NSString v30 = result;
    uint64_t v31 = self;
    id v32 = [v30 layoutMarginsGuide];

    id v33 = [v32 trailingAnchor];
    id v34 = [v29 constraintEqualToAnchor:v33];

    *(void *)(v13 + 56) = v34;
    v41[1] = v13;
    specialized Array._endMutation()();
    sub_1000150F8(0, (unint64_t *)&qword_100157AD0);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v31 activateConstraints:isa];

    uint64_t v36 = type metadata accessor for TaskPriority();
    uint64_t v37 = v41[0];
    (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v41[0], 1, 1, v36);
    uint64_t v38 = swift_allocObject();
    swift_unknownObjectWeakInit();
    type metadata accessor for MainActor();
    swift_retain();
    uint64_t v39 = static MainActor.shared.getter();
    uint64_t v40 = (void *)swift_allocObject();
    v40[2] = v39;
    v40[3] = &protocol witness table for MainActor;
    v40[4] = v38;
    swift_release();
    sub_1000DC528(v37, (uint64_t)&unk_10015C2E0, (uint64_t)v40);
    swift_release();
    return (id)sub_1000D5E30();
  }
LABEL_17:
  __break(1u);
  return result;
}

uint64_t sub_1000D5E30()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionAmbientViewController_matchingFlowView);
  uint64_t v2 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v3 = (uint64_t (**)())(v1 + OBJC_IVAR____TtC16MusicRecognition23AmbientMatchingFlowView_retryHandler);
  *uint64_t v3 = sub_1000D68E8;
  v3[1] = (uint64_t (*)())v2;
  swift_release();
  uint64_t v4 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v5 = (uint64_t (**)())(v1 + OBJC_IVAR____TtC16MusicRecognition23AmbientMatchingFlowView_cancellationHandler);
  char *v5 = sub_1000D6A84;
  v5[1] = (uint64_t (*)())v4;
  swift_release();
  uint64_t v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v7 = (void (**)(uint64_t))(v1
                                     + OBJC_IVAR____TtC16MusicRecognition23AmbientMatchingFlowView_appleMusicURLHandler);
  *uint64_t v7 = sub_1000D6B38;
  v7[1] = (void (*)(uint64_t))v6;
  swift_release();
  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v9 = (uint64_t (**)(void *))(v1
                                       + OBJC_IVAR____TtC16MusicRecognition23AmbientMatchingFlowView_displayMatchedMediaItemHandler);
  *id v9 = sub_1000D6C98;
  v9[1] = (uint64_t (*)(void *))v8;

  return swift_release();
}

uint64_t sub_1000D5FEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[12] = a1;
  v4[13] = a4;
  sub_1000060EC(&qword_100158E50);
  v4[14] = swift_task_alloc();
  uint64_t v5 = sub_1000060EC(&qword_100157068);
  v4[15] = v5;
  v4[16] = *(void *)(v5 - 8);
  v4[17] = swift_task_alloc();
  uint64_t v6 = sub_1000060EC(&qword_10015A860);
  v4[18] = v6;
  v4[19] = *(void *)(v6 - 8);
  v4[20] = swift_task_alloc();
  type metadata accessor for MainActor();
  v4[21] = static MainActor.shared.getter();
  uint64_t v8 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_1000D6174, v8, v7);
}

uint64_t sub_1000D6174()
{
  swift_release();
  swift_beginAccess();
  Strong = (char *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    if (qword_100156120 != -1) {
      swift_once();
    }
    uint64_t v2 = *(void *)(v0 + 160);
    uint64_t v3 = *(void *)(v0 + 136);
    uint64_t v12 = *(void *)(v0 + 144);
    uint64_t v13 = *(void *)(v0 + 152);
    uint64_t v5 = *(void *)(v0 + 120);
    uint64_t v4 = *(void *)(v0 + 128);
    uint64_t v6 = *(void *)(v0 + 112);
    swift_beginAccess();
    sub_1000060EC(&qword_100157078);
    Published.projectedValue.getter();
    swift_endAccess();
    sub_1000150F8(0, (unint64_t *)&qword_100158E68);
    *(void *)(v0 + 88) = static OS_dispatch_queue.main.getter();
    uint64_t v7 = type metadata accessor for OS_dispatch_queue.SchedulerOptions();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
    sub_100006480(&qword_100157088, &qword_100157068);
    sub_10005DE60();
    Publisher.receive<A>(on:options:)();
    sub_1000063D0(v6, &qword_100158E50);

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    swift_allocObject();
    swift_beginAccess();
    uint64_t v8 = (void *)swift_unknownObjectWeakLoadStrong();
    swift_unknownObjectWeakInit();

    sub_100006480(&qword_10015A868, &qword_10015A860);
    uint64_t v9 = Publisher<>.sink(receiveValue:)();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v2, v12);
    *(void *)&Strong[OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionAmbientViewController_musicRecognitionCancellable] = v9;

    swift_release();
  }
  **(unsigned char **)(v0 + 96) = Strong == 0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

void sub_1000D64BC(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void **)(a1 + 8);
  unsigned __int8 v3 = *(unsigned char *)(a1 + 16);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v5 = (void *)Strong;
    id v6 = objc_retain(*(id *)(Strong
                           + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionAmbientViewController_matchingFlowView));
    sub_1000D5110(v1, v2, v3);
  }
}

id sub_1000D6558(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v4[OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionAmbientViewController_musicRecognitionCancellable] = 0;
  uint64_t v8 = OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionAmbientViewController_matchingFlowView;
  id v9 = objc_allocWithZone((Class)type metadata accessor for AmbientMatchingFlowView());
  uint64_t v10 = v4;
  *(void *)&v4[v8] = [v9 initWithFrame:0.0, 0.0, 0.0, 0.0];

  if (a2)
  {
    NSString v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v11 = 0;
  }
  v14.receiver = v10;
  v14.super_class = ObjectType;
  id v12 = [super initWithNibName:v11 bundle:a3];

  return v12;
}

id sub_1000D66B4(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v1[OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionAmbientViewController_musicRecognitionCancellable] = 0;
  uint64_t v4 = OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionAmbientViewController_matchingFlowView;
  id v5 = objc_allocWithZone((Class)type metadata accessor for AmbientMatchingFlowView());
  id v6 = v1;
  *(void *)&v1[v4] = [v5 initWithFrame:0.0, 0.0, 0.0, 0.0];

  v9.receiver = v6;
  v9.super_class = ObjectType;
  id v7 = [super initWithCoder:a1];

  return v7;
}

uint64_t type metadata accessor for MusicRecognitionAmbientViewController()
{
  return self;
}

uint64_t sub_1000D67BC()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000D67F4()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000D6834(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  id v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *id v7 = v2;
  v7[1] = sub_100014D10;
  return sub_1000D5FEC(a1, v4, v5, v6);
}

uint64_t sub_1000D68E8()
{
  return sub_1000D6938(v0, 0xEu, (uint64_t)&unk_10014D288, (uint64_t)&unk_10015C318, (void (*)(char *, uint64_t, uint64_t))sub_1000DC550);
}

uint64_t sub_1000D6938(uint64_t a1, unsigned __int8 a2, uint64_t a3, uint64_t a4, void (*a5)(char *, uint64_t, uint64_t))
{
  uint64_t v8 = sub_1000060EC(&qword_100157038);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v12 = (void *)Strong;
    sub_1000D74A0(a2);
  }
  uint64_t v13 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  type metadata accessor for MainActor();
  uint64_t v14 = static MainActor.shared.getter();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v14;
  *(void *)(v15 + 24) = &protocol witness table for MainActor;
  a5(v10, a4, v15);
  return swift_release();
}

uint64_t sub_1000D6A84()
{
  return sub_1000D6938(v0, 0xDu, (uint64_t)&unk_10014D260, (uint64_t)&unk_10015C308, (void (*)(char *, uint64_t, uint64_t))sub_1000DC37C);
}

void sub_1000D6AD4(uint64_t a1)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    unsigned __int8 v3 = (void *)Strong;
    sub_1000D74A0(1u);
  }
  sub_100104B84(a1);
}

void sub_1000D6B38(uint64_t a1)
{
}

uint64_t sub_1000D6B40(void *a1)
{
  uint64_t v2 = sub_1000060EC(&qword_100157038);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v6 = (void *)Strong;
    sub_1000D74A0(0xBu);
  }
  uint64_t v7 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v4, 1, 1, v7);
  type metadata accessor for MainActor();
  id v8 = a1;
  uint64_t v9 = static MainActor.shared.getter();
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = v9;
  v10[3] = &protocol witness table for MainActor;
  v10[4] = v8;
  sub_1000D5678((uint64_t)v4, (uint64_t)&unk_10015C2F0, (uint64_t)v10);
  return swift_release();
}

uint64_t sub_1000D6C98(void *a1)
{
  return sub_1000D6B40(a1);
}

uint64_t sub_1000D6CA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[15] = a4;
  type metadata accessor for MainActor();
  v4[16] = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  v4[17] = v6;
  v4[18] = v5;
  return _swift_task_switch(sub_1000D6D38, v6, v5);
}

uint64_t sub_1000D6D38()
{
  uint64_t v1 = v0[15];
  uint64_t v2 = self;
  v0[2] = v0;
  v0[3] = sub_100013F10;
  uint64_t v3 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_1000D55E0;
  v0[13] = &unk_10014D238;
  v0[14] = v3;
  [v2 presentMediaItem:v1 completionHandler:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_1000D6E40(int a1, uint64_t a2, uint64_t a3)
{
  id v25 = &type metadata for MusicRecognitionLifeCycle;
  id v26 = &off_10014DAF0;
  __int16 v21 = a1;
  unsigned __int8 v22 = BYTE2(a1);
  uint64_t v23 = a2;
  uint64_t v24 = a3;
  uint64_t v3 = qword_1001565B8;
  swift_bridgeObjectRetain();
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_10000E808(v4, (uint64_t)qword_10015CEC0);
  sub_100009AD0((uint64_t)&v21, (uint64_t)v20);
  sub_100009AD0((uint64_t)&v21, (uint64_t)v19);
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315395;
    uint64_t v8 = sub_100010740(v20, v20[3]);
    uint64_t v9 = v8[1];
    unint64_t v10 = v8[2];
    swift_bridgeObjectRetain();
    sub_1000CB67C(v9, v10, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _s16MusicRecognition11AnyPlaylistVwxx_0((uint64_t)v20);
    *(_WORD *)(v7 + 12) = 2081;
    NSString v11 = sub_100010740(v19, v19[3]);
    sub_1000EC6D8(*(unsigned char *)v11, *((unsigned char *)v11 + 1), *((unsigned char *)v11 + 2));
    sub_1000150F8(0, &qword_10015C2F8);
    uint64_t v12 = Dictionary.description.getter();
    unint64_t v14 = v13;
    swift_bridgeObjectRelease();
    sub_1000CB67C(v12, v14, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _s16MusicRecognition11AnyPlaylistVwxx_0((uint64_t)v19);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Send analytics event: %s, payload: %{private}s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    _s16MusicRecognition11AnyPlaylistVwxx_0((uint64_t)v20);
    _s16MusicRecognition11AnyPlaylistVwxx_0((uint64_t)v19);
  }

  swift_bridgeObjectRetain();
  NSString v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  sub_1000EC6D8(v21, HIBYTE(v21), v22);
  sub_1000150F8(0, &qword_10015C2F8);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  AnalyticsSendEvent();

  return _s16MusicRecognition11AnyPlaylistVwxx_0((uint64_t)&v21);
}

uint64_t sub_1000D7174(__int16 a1, uint64_t a2, uint64_t a3)
{
  uint64_t v24 = &type metadata for MatchLifeCycle;
  id v25 = &off_10014DC20;
  __int16 v21 = a1 & 0xFF01;
  uint64_t v22 = a2;
  uint64_t v23 = a3;
  uint64_t v3 = qword_1001565B8;
  swift_bridgeObjectRetain();
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_10000E808(v4, (uint64_t)qword_10015CEC0);
  sub_100009AD0((uint64_t)&v21, (uint64_t)v20);
  sub_100009AD0((uint64_t)&v21, (uint64_t)v19);
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315395;
    uint64_t v8 = sub_100010740(v20, v20[3]);
    uint64_t v9 = v8[1];
    unint64_t v10 = v8[2];
    swift_bridgeObjectRetain();
    sub_1000CB67C(v9, v10, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _s16MusicRecognition11AnyPlaylistVwxx_0((uint64_t)v20);
    *(_WORD *)(v7 + 12) = 2081;
    NSString v11 = (char *)sub_100010740(v19, v19[3]);
    sub_1000EC83C(*v11, v11[1]);
    sub_1000150F8(0, &qword_10015C2F8);
    uint64_t v12 = Dictionary.description.getter();
    unint64_t v14 = v13;
    swift_bridgeObjectRelease();
    sub_1000CB67C(v12, v14, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _s16MusicRecognition11AnyPlaylistVwxx_0((uint64_t)v19);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Send analytics event: %s, payload: %{private}s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    _s16MusicRecognition11AnyPlaylistVwxx_0((uint64_t)v20);
    _s16MusicRecognition11AnyPlaylistVwxx_0((uint64_t)v19);
  }

  swift_bridgeObjectRetain();
  NSString v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  sub_1000EC83C(v21, SHIBYTE(v21));
  sub_1000150F8(0, &qword_10015C2F8);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  AnalyticsSendEvent();

  return _s16MusicRecognition11AnyPlaylistVwxx_0((uint64_t)&v21);
}

uint64_t sub_1000D74A0(unsigned __int8 a1)
{
  uint64_t v2 = type metadata accessor for IntentSystemContext.Source();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000060EC(&qword_1001570C8);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100156120 != -1) {
    swift_once();
  }
  uint64_t v9 = qword_100164BD0 + OBJC_IVAR____TtC16MusicRecognition15MusicRecognizer_origin;
  swift_beginAccess();
  sub_100015928(v9, (uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) == 1) {
    return sub_1000063D0((uint64_t)v8, &qword_1001570C8);
  }
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v5, v8, v2);
  int v11 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v11 == enum case for IntentSystemContext.Source.app(_:)
    || v11 == enum case for IntentSystemContext.Source.CLI(_:))
  {
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  }
  if (v11 == enum case for IntentSystemContext.Source.siri(_:))
  {
LABEL_12:
    int v13 = 256;
LABEL_15:
    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    return sub_1000D6E40(v13 | a1 | 0x20000u, 0xD000000000000028, 0x8000000100117950);
  }
  if (v11 == enum case for IntentSystemContext.Source.shortcuts(_:))
  {
    int v13 = 2560;
    goto LABEL_15;
  }
  if (v11 == enum case for IntentSystemContext.Source.testing(_:)) {
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  }
  if (v11 == enum case for IntentSystemContext.Source.actionButton(_:))
  {
    int v13 = 1792;
    goto LABEL_15;
  }
  if (v11 == enum case for IntentSystemContext.Source.spotlight(_:))
  {
    int v13 = 2304;
    goto LABEL_15;
  }
  if (v11 == enum case for IntentSystemContext.Source.controlCenter(_:))
  {
    int v13 = 1536;
    goto LABEL_15;
  }
  if (v11 == enum case for IntentSystemContext.Source.widget(_:)) {
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  }
  if (v11 == enum case for IntentSystemContext.Source.assistant(_:)) {
    goto LABEL_12;
  }
  unint64_t v14 = *(void (**)(char *, uint64_t))(v3 + 8);
  v14(v5, v2);
  return ((uint64_t (*)(char *, uint64_t))v14)(v8, v2);
}

uint64_t sub_1000D77F0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100014D10;
  return sub_1000D6CA0(a1, v4, v5, v6);
}

uint64_t sub_1000D78A4()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000D78DC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_100015B24;
  return sub_100013A5C();
}

uint64_t sub_1000D7988(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100015B24;
  return sub_100013464(a1);
}

void sub_1000D7A34(uint64_t a1)
{
}

uint64_t sub_1000D7A3C()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_1000D7A74()
{
  return sub_1000B6840(*(void *)(v0 + 16));
}

uint64_t sub_1000D7A7C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000D7A8C()
{
  return swift_release();
}

uint64_t sub_1000D7A94()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000D7ADC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_100015B24;
  return sub_100060080(a1, v4, v5, v7, v6);
}

uint64_t sub_1000D7BA0()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000D7BE0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100015B24;
  return sub_1000142D0(a1, v4, v5, v6);
}

void *sub_1000D7C98(void *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    uint64_t v4 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    sub_1000060EC(&qword_100156938);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = type metadata accessor for ColorScheme();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    }
    else
    {
      void *v4 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = a3[6];
    int v11 = (void *)((char *)v4 + v9);
    uint64_t v12 = (void *)((char *)a2 + v9);
    uint64_t v13 = v12[1];
    *int v11 = *v12;
    v11[1] = v13;
    unint64_t v14 = (void *)((char *)v4 + v10);
    uint64_t v15 = (void *)((char *)a2 + v10);
    uint64_t v16 = v15[1];
    *unint64_t v14 = *v15;
    v14[1] = v16;
    uint64_t v17 = a3[8];
    *(void *)((char *)v4 + a3[7]) = *(void *)((char *)a2 + a3[7]);
    *((unsigned char *)v4 + v17) = *((unsigned char *)a2 + v17);
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_1000D7DF0(uint64_t a1)
{
  sub_1000060EC(&qword_100156938);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = type metadata accessor for ColorScheme();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();

  return swift_release();
}

void *sub_1000D7EB0(void *a1, void *a2, int *a3)
{
  sub_1000060EC(&qword_100156938);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for ColorScheme();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)((char *)a1 + v7);
  uint64_t v10 = (void *)((char *)a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = (void *)((char *)a1 + v8);
  uint64_t v13 = (void *)((char *)a2 + v8);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  uint64_t v15 = a3[8];
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  *((unsigned char *)a1 + v15) = *((unsigned char *)a2 + v15);
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_1000D7FBC(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_1000063D0((uint64_t)a1, &qword_100156938);
    sub_1000060EC(&qword_100156938);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = type metadata accessor for ColorScheme();
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
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_retain();
  swift_release();
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_retain();
  swift_release();
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_retain();
  swift_release();
  *((unsigned char *)a1 + a3[8]) = *((unsigned char *)a2 + a3[8]);
  return a1;
}

char *sub_1000D8114(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_1000060EC(&qword_100156938);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = type metadata accessor for ColorScheme();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[6];
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  *(_OWORD *)&a1[v8] = *(_OWORD *)&a2[v8];
  uint64_t v9 = a3[8];
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  a1[v9] = a2[v9];
  return a1;
}

char *sub_1000D8204(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_1000063D0((uint64_t)a1, &qword_100156938);
    uint64_t v6 = sub_1000060EC(&qword_100156938);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = type metadata accessor for ColorScheme();
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
  *(void *)uint64_t v9 = *(void *)v10;
  *((void *)v9 + 1) = *((void *)v10 + 1);
  swift_release();
  uint64_t v11 = a3[6];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  *(void *)uint64_t v12 = *(void *)v13;
  *((void *)v12 + 1) = *((void *)v13 + 1);
  swift_release();
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  swift_release();
  a1[a3[8]] = a2[a3[8]];
  return a1;
}

uint64_t sub_1000D834C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000D8360);
}

uint64_t sub_1000D8360(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000060EC(&qword_100157AF0);
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
    return (v10 + 1);
  }
}

uint64_t sub_1000D8424(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000D8438);
}

uint64_t sub_1000D8438(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1000060EC(&qword_100157AF0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 28)) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for SongArtworkView()
{
  uint64_t result = qword_10015C3C0;
  if (!qword_10015C3C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000D8544()
{
  sub_100028F30();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_1000D85F4()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_1000D8610()
{
  qword_10015C330 = 0x636973756DLL;
  *(void *)algn_10015C338 = 0xE500000000000000;
}

uint64_t sub_1000D8630(uint64_t a1)
{
  return sub_1000D8668(0.5, a1, (SEL *)&selRef_blackColor, &qword_10015C340);
}

uint64_t sub_1000D8648(uint64_t a1)
{
  return sub_1000D8668(0.3, a1, (SEL *)&selRef_grayColor, &qword_10015C348);
}

uint64_t sub_1000D8668(double a1, uint64_t a2, SEL *a3, uint64_t *a4)
{
  id v6 = [self *a3];
  id v7 = [v6 colorWithAlphaComponent:a1];

  uint64_t result = Color.init(uiColor:)();
  *a4 = result;
  return result;
}

uint64_t sub_1000D86EC()
{
  uint64_t v0 = type metadata accessor for RoundedRectangle();
  uint64_t v1 = v0 - 8;
  __chkstk_darwin(v0);
  uint64_t v3 = &v25[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_1000060EC(&qword_100157980);
  sub_10000FC3C(v4, qword_10015C350);
  uint64_t v5 = sub_10000E808(v4, (uint64_t)qword_10015C350);
  id v6 = (char *)v3 + *(int *)(v1 + 28);
  uint64_t v7 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v8 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 104))(v6, v7, v8);
  __asm { FMOV            V0.2D, #15.0 }
  *uint64_t v3 = _Q0;
  id v14 = [self whiteColor];
  id v15 = [v14 colorWithAlphaComponent:0.15];

  uint64_t v16 = Color.init(uiColor:)();
  StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
  sub_1000DA6C0((uint64_t)v3, v5, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  uint64_t v17 = v5 + *(int *)(sub_1000060EC(&qword_1001579A0) + 36);
  long long v18 = v26;
  *(_OWORD *)uint64_t v17 = *(_OWORD *)&v25[8];
  *(_OWORD *)(v17 + 16) = v18;
  *(void *)(v17 + 32) = v27;
  uint64_t v19 = sub_1000060EC(&qword_1001579A8);
  *(void *)(v5 + *(int *)(v19 + 52)) = v16;
  *(_WORD *)(v5 + *(int *)(v19 + 56)) = 256;
  swift_retain();
  uint64_t v20 = static Alignment.center.getter();
  uint64_t v22 = v21;
  uint64_t v23 = (uint64_t *)(v5 + *(int *)(sub_1000060EC(&qword_1001579B0) + 36));
  *uint64_t v23 = v20;
  v23[1] = v22;
  swift_release();
  return sub_10002717C((uint64_t)v3);
}

uint64_t sub_1000D8910@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v70 = a1;
  uint64_t v3 = sub_1000060EC(&qword_10015C408);
  __chkstk_darwin(v3 - 8);
  uint64_t v69 = (uint64_t)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = type metadata accessor for RoundedRectangle();
  __chkstk_darwin(v67);
  id v6 = (_OWORD *)((char *)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = type metadata accessor for SongArtworkView();
  uint64_t v8 = v7 - 8;
  uint64_t v57 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v58 = v9;
  uint64_t v61 = (uint64_t)&v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_1000060EC((uint64_t *)&unk_100158FC0);
  __chkstk_darwin(v62);
  uint64_t v11 = (char *)&v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_1000060EC(&qword_10015C410);
  __chkstk_darwin(v60);
  uint64_t v13 = (uint64_t *)((char *)&v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v64 = sub_1000060EC(&qword_10015C418);
  uint64_t v14 = *(void *)(v64 - 8);
  __chkstk_darwin(v64);
  uint64_t v16 = (char *)&v56 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = sub_1000060EC(&qword_10015C420);
  __chkstk_darwin(v59);
  uint64_t v66 = (char *)&v56 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = sub_1000060EC(&qword_10015C428);
  __chkstk_darwin(v63);
  uint64_t v19 = (char *)&v56 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = sub_1000060EC(&qword_10015C430);
  __chkstk_darwin(v65);
  uint64_t v68 = (char *)&v56 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  *uint64_t v13 = static Alignment.center.getter();
  v13[1] = v21;
  uint64_t v22 = sub_1000060EC(&qword_10015C438);
  sub_1000D90C8(v2, (uint64_t)v13 + *(int *)(v22 + 44));
  uint64_t v23 = v2;
  uint64_t v24 = *(void *)(v2 + *(int *)(v8 + 36));
  if (UIAccessibilityIsVideoAutoplayEnabled() && !UIAccessibilityIsReduceMotionEnabled())
  {
    swift_getKeyPath();
    uint64_t v71 = v24;
    sub_1000DAAB8((unint64_t *)&qword_10015C458, (void (*)(uint64_t))type metadata accessor for SongArtworkViewModel);
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    uint64_t v26 = v24 + OBJC_IVAR____TtC16MusicRecognition20SongArtworkViewModel___animatedArtworkURL;
    swift_beginAccess();
    sub_100009C94(v26, (uint64_t)v11, (uint64_t *)&unk_100158FC0);
  }
  else
  {
    uint64_t v25 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v11, 1, 1, v25);
  }
  uint64_t v27 = v61;
  sub_1000DA6C0(v23, v61, (uint64_t (*)(void))type metadata accessor for SongArtworkView);
  unint64_t v28 = (*(unsigned __int8 *)(v57 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v57 + 80);
  uint64_t v29 = swift_allocObject();
  sub_1000DA5DC(v27, v29 + v28);
  sub_100006480(&qword_10015C440, &qword_10015C410);
  sub_100074598();
  View.onChange<A>(of:initial:_:)();
  swift_release();
  sub_1000063D0((uint64_t)v11, (uint64_t *)&unk_100158FC0);
  sub_1000063D0((uint64_t)v13, &qword_10015C410);
  NSString v30 = (char *)v6 + *(int *)(v67 + 20);
  uint64_t v31 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v32 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v32 - 8) + 104))(v30, v31, v32);
  __asm { FMOV            V0.2D, #15.0 }
  *id v6 = _Q0;
  uint64_t v38 = (uint64_t)v66;
  uint64_t v39 = (uint64_t)&v66[*(int *)(v59 + 36)];
  sub_1000DA6C0((uint64_t)v6, v39, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  *(_WORD *)(v39 + *(int *)(sub_1000060EC(&qword_100157ED8) + 36)) = 256;
  uint64_t v40 = v64;
  (*(void (**)(uint64_t, char *, uint64_t))(v14 + 16))(v38, v16, v64);
  sub_10002717C((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v40);
  if (qword_1001564F0 != -1) {
    swift_once();
  }
  uint64_t v41 = sub_1000060EC(&qword_100157980);
  uint64_t v42 = sub_10000E808(v41, (uint64_t)qword_10015C350);
  uint64_t v43 = static Alignment.center.getter();
  uint64_t v45 = v44;
  uint64_t v46 = (uint64_t)&v19[*(int *)(v63 + 36)];
  sub_100009C94(v42, v46, &qword_100157980);
  unint64_t v47 = (uint64_t *)(v46 + *(int *)(sub_1000060EC(&qword_10015C448) + 36));
  *unint64_t v47 = v43;
  v47[1] = v45;
  sub_100009C30(v38, (uint64_t)v19, &qword_10015C420);
  uint64_t v48 = v69;
  sub_1000D9C5C(v69);
  uint64_t v49 = static Alignment.center.getter();
  uint64_t v51 = v50;
  uint64_t v52 = (uint64_t)v68;
  uint64_t v53 = (uint64_t)&v68[*(int *)(v65 + 36)];
  sub_100009C94(v48, v53, &qword_10015C408);
  uint64_t v54 = (uint64_t *)(v53 + *(int *)(sub_1000060EC(&qword_10015C450) + 36));
  *uint64_t v54 = v49;
  v54[1] = v51;
  sub_100009C94((uint64_t)v19, v52, &qword_10015C428);
  sub_1000063D0(v48, &qword_10015C408);
  sub_1000063D0((uint64_t)v19, &qword_10015C428);
  return sub_100009C30(v52, v70, &qword_10015C430);
}

uint64_t sub_1000D90C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v54 = a2;
  uint64_t v3 = sub_1000060EC(&qword_10015C470);
  __chkstk_darwin(v3 - 8);
  uint64_t v50 = (char *)v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = sub_1000060EC(&qword_10015C478) - 8;
  uint64_t v5 = __chkstk_darwin(v53);
  uint64_t v51 = (uint64_t)v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v52 = (uint64_t)v46 - v7;
  uint64_t v8 = type metadata accessor for SongArtworkView();
  uint64_t v9 = (int *)(v8 - 8);
  uint64_t v47 = *(void *)(v8 - 8);
  v46[1] = *(void *)(v47 + 64);
  __chkstk_darwin(v8);
  v46[0] = (uint64_t)v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000060EC((uint64_t *)&unk_100158FC0);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_1000060EC(&qword_10015C480);
  uint64_t v14 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  uint64_t v16 = (char *)v46 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1000060EC(&qword_10015C488);
  uint64_t v18 = v17 - 8;
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v21 = (char *)v46 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v48 = (uint64_t)v46 - v22;
  uint64_t v23 = *(void *)(a1 + v9[9]);
  swift_getKeyPath();
  uint64_t v58 = v23;
  sub_1000DAAB8((unint64_t *)&qword_10015C458, (void (*)(uint64_t))type metadata accessor for SongArtworkViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v24 = v23 + OBJC_IVAR____TtC16MusicRecognition20SongArtworkViewModel__artworkURL;
  swift_beginAccess();
  sub_100009C94(v24, (uint64_t)v13, (uint64_t *)&unk_100158FC0);
  uint64_t v25 = a1;
  uint64_t v26 = a1;
  uint64_t v27 = v46[0];
  sub_1000DA6C0(v26, v46[0], (uint64_t (*)(void))type metadata accessor for SongArtworkView);
  unint64_t v28 = (*(unsigned __int8 *)(v47 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v47 + 80);
  uint64_t v29 = swift_allocObject();
  sub_1000DA5DC(v27, v29 + v28);
  sub_1000060EC(&qword_10015C490);
  sub_1000DA998();
  AsyncImage.init(url:scale:transaction:content:)();
  NSString v30 = (uint64_t *)(v25 + v9[8]);
  uint64_t v31 = *v30;
  uint64_t v32 = v30[1];
  uint64_t v55 = v31;
  uint64_t v56 = v32;
  sub_1000060EC(&qword_10015C468);
  State.wrappedValue.getter();
  uint64_t v33 = v57;
  uint64_t v34 = v49;
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v21, v16, v49);
  *(void *)&v21[*(int *)(v18 + 44)] = v33;
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v34);
  uint64_t v35 = v48;
  sub_100009C30((uint64_t)v21, v48, &qword_10015C488);
  uint64_t v36 = v50;
  sub_1000D9688(v50);
  uint64_t v37 = (uint64_t *)(v25 + v9[7]);
  uint64_t v38 = *v37;
  uint64_t v39 = v37[1];
  uint64_t v55 = v38;
  uint64_t v56 = v39;
  State.wrappedValue.getter();
  uint64_t v40 = v57;
  uint64_t v41 = v51;
  sub_100009C94((uint64_t)v36, v51, &qword_10015C470);
  *(void *)(v41 + *(int *)(v53 + 44)) = v40;
  sub_1000063D0((uint64_t)v36, &qword_10015C470);
  uint64_t v42 = v52;
  sub_100009C30(v41, v52, &qword_10015C478);
  sub_100009C94(v35, (uint64_t)v21, &qword_10015C488);
  sub_100009C94(v42, v41, &qword_10015C478);
  uint64_t v43 = v54;
  sub_100009C94((uint64_t)v21, v54, &qword_10015C488);
  uint64_t v44 = sub_1000060EC(&qword_10015C4B0);
  sub_100009C94(v41, v43 + *(int *)(v44 + 48), &qword_10015C478);
  sub_1000063D0(v42, &qword_10015C478);
  sub_1000063D0(v35, &qword_10015C488);
  sub_1000063D0(v41, &qword_10015C478);
  return sub_1000063D0((uint64_t)v21, &qword_10015C488);
}

uint64_t sub_1000D9688@<X0>(char *a1@<X8>)
{
  uint64_t v3 = sub_1000060EC((uint64_t *)&unk_100158FC0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)v20 - v11;
  uint64_t v13 = *(void *)(v1 + *(int *)(type metadata accessor for SongArtworkView() + 28));
  if (UIAccessibilityIsVideoAutoplayEnabled() && !UIAccessibilityIsReduceMotionEnabled())
  {
    swift_getKeyPath();
    v20[1] = v13;
    sub_1000DAAB8((unint64_t *)&qword_10015C458, (void (*)(uint64_t))type metadata accessor for SongArtworkViewModel);
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    uint64_t v16 = v13 + OBJC_IVAR____TtC16MusicRecognition20SongArtworkViewModel___animatedArtworkURL;
    swift_beginAccess();
    sub_100009C94(v16, (uint64_t)v5, (uint64_t *)&unk_100158FC0);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
    {
      uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
      v17(v12, v5, v6);
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
      id v18 = [self secondarySystemFillColor];
      (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
      v17(a1, v10, v6);
      uint64_t v19 = type metadata accessor for AnimatedArtworkPlayerView(0);
      *(void *)&a1[*(int *)(v19 + 20)] = v18;
      return (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(a1, 0, 1, v19);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
  }
  sub_1000063D0((uint64_t)v5, (uint64_t *)&unk_100158FC0);
  uint64_t v14 = type metadata accessor for AnimatedArtworkPlayerView(0);
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(a1, 1, 1, v14);
}

uint64_t sub_1000D99D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for SongArtworkView();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  __chkstk_darwin(v5 - 8);
  uint64_t v8 = type metadata accessor for AnimationCompletionCriteria();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = &v17[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = type metadata accessor for URL();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48))(a2, 1, v12);
  if (result != 1)
  {
    static Animation.spring(response:dampingFraction:blendDuration:)();
    uint64_t v14 = static AnimationCompletionCriteria.logicallyComplete.getter();
    __chkstk_darwin(v14);
    *(void *)&v17[-16] = a3;
    sub_1000DA6C0(a3, (uint64_t)&v17[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)], (uint64_t (*)(void))type metadata accessor for SongArtworkView);
    unint64_t v15 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    uint64_t v16 = swift_allocObject();
    sub_1000DA5DC((uint64_t)&v17[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)], v16 + v15);
    withAnimation<A>(_:completionCriteria:_:completion:)();
    swift_release();
    swift_release();
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return result;
}

uint64_t sub_1000D9C5C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v33 = a1;
  uint64_t v1 = type metadata accessor for ColorScheme();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v32 - v6;
  uint64_t v8 = type metadata accessor for RoundedRectangle();
  uint64_t v9 = v8 - 8;
  __chkstk_darwin(v8);
  uint64_t v11 = (_OWORD *)((char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = sub_1000060EC(&qword_10015C460);
  uint64_t v13 = v12 - 8;
  __chkstk_darwin(v12);
  unint64_t v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = (char *)v11 + *(int *)(v9 + 28);
  uint64_t v17 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v18 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 104))(v16, v17, v18);
  __asm { FMOV            V0.2D, #15.0 }
  *uint64_t v11 = _Q0;
  uint64_t v24 = static Color.primary.getter();
  sub_1000DA6C0((uint64_t)v11, (uint64_t)v15, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  *(void *)&v15[*(int *)(v13 + 60)] = v24;
  *(_WORD *)&v15[*(int *)(v13 + 64)] = 256;
  sub_10002717C((uint64_t)v11);
  sub_100008414((uint64_t)v7);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v5, enum case for ColorScheme.light(_:), v1);
  char v25 = static ColorScheme.== infix(_:_:)();
  uint64_t v26 = *(void (**)(char *, uint64_t))(v2 + 8);
  v26(v5, v1);
  v26(v7, v1);
  if (v25)
  {
    if (qword_1001564E0 != -1) {
      swift_once();
    }
    uint64_t v27 = &qword_10015C340;
  }
  else
  {
    if (qword_1001564E8 != -1) {
      swift_once();
    }
    uint64_t v27 = &qword_10015C348;
  }
  uint64_t v28 = *v27;
  swift_retain();
  uint64_t v29 = v33;
  sub_100009C94((uint64_t)v15, v33, &qword_10015C460);
  uint64_t v30 = v29 + *(int *)(sub_1000060EC(&qword_10015C408) + 36);
  *(void *)uint64_t v30 = v28;
  *(_OWORD *)(v30 + 8) = xmmword_100115A20;
  *(void *)(v30 + 24) = 0x4020000000000000;
  return sub_1000063D0((uint64_t)v15, &qword_10015C460);
}

uint64_t sub_1000D9FB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v23 = a2;
  uint64_t v26 = a3;
  uint64_t v4 = type metadata accessor for ArtworkUnavailableView();
  uint64_t v24 = *(void *)(v4 - 8);
  uint64_t v25 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000060EC(&qword_10015C4B8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Image.ResizingMode();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for AsyncImagePhase();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, a1, v14);
  if ((*(unsigned int (**)(char *, uint64_t))(v15 + 88))(v17, v14) == enum case for AsyncImagePhase.success(_:))
  {
    (*(void (**)(char *, uint64_t))(v15 + 96))(v17, v14);
    (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, enum case for Image.ResizingMode.stretch(_:), v10);
    uint64_t v18 = Image.resizable(capInsets:resizingMode:)();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    char v19 = *(unsigned char *)(v23 + *(int *)(type metadata accessor for SongArtworkView() + 32));
    *(void *)uint64_t v9 = v18;
    *((void *)v9 + 1) = 0;
    v9[16] = 1;
    v9[17] = v19;
    swift_storeEnumTagMultiPayload();
    swift_retain_n();
    sub_1000060EC(&qword_10015C4A8);
    sub_1000DAA44();
    sub_1000DAAB8((unint64_t *)&qword_100157600, (void (*)(uint64_t))&type metadata accessor for ArtworkUnavailableView);
    _ConditionalContent<>.init(storage:)();
    swift_release_n();
    return swift_release();
  }
  else
  {
    uint64_t v21 = v25;
    if (qword_1001564D8 != -1) {
      swift_once();
    }
    swift_bridgeObjectRetain();
    ArtworkUnavailableView.init(placeholderImage:widthRatio:heightRatio:)();
    uint64_t v22 = v24;
    (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v9, v6, v21);
    swift_storeEnumTagMultiPayload();
    sub_1000060EC(&qword_10015C4A8);
    sub_1000DAA44();
    sub_1000DAAB8((unint64_t *)&qword_100157600, (void (*)(uint64_t))&type metadata accessor for ArtworkUnavailableView);
    _ConditionalContent<>.init(storage:)();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v6, v21);
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }
}

uint64_t sub_1000DA474()
{
  return State.wrappedValue.setter();
}

uint64_t sub_1000DA4E8()
{
  return swift_release();
}

uint64_t sub_1000DA564()
{
  return State.wrappedValue.setter();
}

uint64_t sub_1000DA5DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SongArtworkView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000DA640(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(type metadata accessor for SongArtworkView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_1000D99D8(a1, a2, v6);
}

uint64_t sub_1000DA6C0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000DA730()
{
  return sub_1000DA474();
}

uint64_t sub_1000DA750()
{
  type metadata accessor for SongArtworkView();

  return sub_1000DA4E8();
}

uint64_t sub_1000DA7B0()
{
  return sub_1000DA564();
}

uint64_t sub_1000DA7D8()
{
  uint64_t v1 = *(void *)(type metadata accessor for SongArtworkView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  sub_1000060EC(&qword_100156938);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = type metadata accessor for ColorScheme();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_1000DA918@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for SongArtworkView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_1000D9FB0(a1, v6, a2);
}

unint64_t sub_1000DA998()
{
  unint64_t result = qword_10015C498;
  if (!qword_10015C498)
  {
    sub_100006224(&qword_10015C490);
    sub_1000DAA44();
    sub_1000DAAB8((unint64_t *)&qword_100157600, (void (*)(uint64_t))&type metadata accessor for ArtworkUnavailableView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015C498);
  }
  return result;
}

unint64_t sub_1000DAA44()
{
  unint64_t result = qword_10015C4A0;
  if (!qword_10015C4A0)
  {
    sub_100006224(&qword_10015C4A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015C4A0);
  }
  return result;
}

uint64_t sub_1000DAAB8(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1000DAB04()
{
  unint64_t result = qword_10015C4C0;
  if (!qword_10015C4C0)
  {
    sub_100006224(&qword_10015C430);
    sub_1000DABA4();
    sub_100006480(&qword_10015C4E0, &qword_10015C450);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015C4C0);
  }
  return result;
}

unint64_t sub_1000DABA4()
{
  unint64_t result = qword_10015C4C8;
  if (!qword_10015C4C8)
  {
    sub_100006224(&qword_10015C428);
    sub_1000DAC44();
    sub_100006480(&qword_10015C4D8, &qword_10015C448);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015C4C8);
  }
  return result;
}

unint64_t sub_1000DAC44()
{
  unint64_t result = qword_10015C4D0;
  if (!qword_10015C4D0)
  {
    sub_100006224(&qword_10015C420);
    sub_100006224(&qword_10015C410);
    sub_100006224((uint64_t *)&unk_100158FC0);
    sub_100006480(&qword_10015C440, &qword_10015C410);
    sub_100074598();
    swift_getOpaqueTypeConformance2();
    sub_100006480(&qword_10015A2C8, &qword_100157ED8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015C4D0);
  }
  return result;
}

id sub_1000DAD60()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  id v3 = objc_allocWithZone((Class)type metadata accessor for MusicRecognitionOnboardingWelcomeViewController());
  swift_retain();
  return sub_1000DB1EC(v1, v2);
}

uint64_t sub_1000DADBC()
{
  return UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)();
}

uint64_t sub_1000DADF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1000DB9D4();

  return static UIViewControllerRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1000DAE5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1000DB9D4();

  return static UIViewControllerRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_1000DAEC0()
{
}

uint64_t sub_1000DAEE8(uint64_t a1)
{
  return sub_1000DB048(a1, 0xD000000000000010, 0x800000010011B3E0, &qword_10015C4E8, &qword_10015C4F0);
}

uint64_t sub_1000DAF10(uint64_t a1)
{
  return sub_1000DB048(a1, 0xD000000000000011, 0x800000010011B3C0, &qword_10015C4F8, &qword_10015C500);
}

uint64_t sub_1000DAF38(uint64_t a1)
{
  return sub_1000DB048(a1, 0xD00000000000001DLL, 0x800000010011B3A0, &qword_10015C508, &qword_10015C510);
}

uint64_t sub_1000DAF60(uint64_t a1)
{
  return sub_1000DB048(a1, 0xD000000000000023, 0x800000010011B370, &qword_10015C518, &qword_10015C520);
}

uint64_t sub_1000DAF88(uint64_t a1)
{
  return sub_1000DB048(a1, 0xD00000000000001ELL, 0x800000010011B350, &qword_10015C528, &qword_10015C530);
}

uint64_t sub_1000DAFB0(uint64_t a1)
{
  return sub_1000DB048(a1, 0xD000000000000024, 0x800000010011B320, &qword_10015C538, &qword_10015C540);
}

void sub_1000DAFD8()
{
  qword_10015C548 = 0x64756F6C63;
  unk_10015C550 = 0xE500000000000000;
}

uint64_t sub_1000DAFF8(uint64_t a1)
{
  return sub_1000DB048(a1, 0xD00000000000001DLL, 0x800000010011B300, &qword_10015C558, &qword_10015C560);
}

uint64_t sub_1000DB020(uint64_t a1)
{
  return sub_1000DB048(a1, 0xD000000000000023, 0x800000010011B2D0, &qword_10015C568, &qword_10015C570);
}

uint64_t sub_1000DB048(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, void *a5)
{
  uint64_t v7 = type metadata accessor for Locale();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v8 - 8);
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  uint64_t result = String.init(localized:table:bundle:locale:comment:)();
  *a4 = result;
  *a5 = v10;
  return result;
}

void sub_1000DB158()
{
  unk_10015C586 = -4864;
}

uint64_t sub_1000DB188()
{
  uint64_t v0 = type metadata accessor for LocalizedStringResource();
  sub_10000FC3C(v0, qword_10015C588);
  sub_10000E808(v0, (uint64_t)qword_10015C588);
  return LocalizedStringResource.init(stringLiteral:)();
}

id sub_1000DB1EC(uint64_t a1, uint64_t a2)
{
  ObjectType = (objc_class *)swift_getObjectType();
  unint64_t v6 = &v2[OBJC_IVAR____TtC16MusicRecognitionP33_553F2292AAF29353FD38327969F6010947MusicRecognitionOnboardingWelcomeViewController_didTapContinue];
  *(void *)unint64_t v6 = a1;
  *((void *)v6 + 1) = a2;
  uint64_t v7 = qword_1001564F8;
  swift_retain();
  if (v7 != -1) {
    swift_once();
  }
  NSString v8 = String._bridgeToObjectiveC()();
  if (qword_100156500 != -1) {
    swift_once();
  }
  NSString v9 = String._bridgeToObjectiveC()();
  NSString v10 = String._bridgeToObjectiveC()();
  id v11 = [self systemImageNamed:v10];

  v15.receiver = v2;
  v15.super_class = ObjectType;
  id v12 = [super initWithTitle:v8 detailText:v9 icon:v11 contentLayout:2];

  id v13 = v12;
  sub_1000DB378();

  swift_release();
  return v13;
}

void sub_1000DB378()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for LocalizedStringResource();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100156508 != -1) {
    swift_once();
  }
  NSString v6 = String._bridgeToObjectiveC()();
  if (qword_100156510 != -1) {
    swift_once();
  }
  NSString v7 = String._bridgeToObjectiveC()();
  NSString v8 = String._bridgeToObjectiveC()();
  [v1 addBulletedListItemWithTitle:v6 description:v7 symbolName:v8];

  if (qword_100156518 != -1) {
    swift_once();
  }
  NSString v9 = String._bridgeToObjectiveC()();
  if (qword_100156520 != -1) {
    swift_once();
  }
  NSString v10 = String._bridgeToObjectiveC()();
  if (qword_100156528 != -1) {
    swift_once();
  }
  NSString v11 = String._bridgeToObjectiveC()();
  [v1 addBulletedListItemWithTitle:v9 description:v10 symbolName:v11];

  if (qword_100156530 != -1) {
    swift_once();
  }
  NSString v12 = String._bridgeToObjectiveC()();
  if (qword_100156538 != -1) {
    swift_once();
  }
  NSString v13 = String._bridgeToObjectiveC()();
  if (qword_100156540 != -1) {
    swift_once();
  }
  NSString v14 = String._bridgeToObjectiveC()();
  [v1 addBulletedListItemWithTitle:v12 description:v13 symbolName:v14];

  sub_1000DBA28();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  objc_super v15 = (void *)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
  id v16 = [self boldButton];
  [v16 addAction:v15 forControlEvents:64];
  if (qword_100156548 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_10000E808(v2, (uint64_t)qword_10015C588);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v17, v2);
  String.init(localized:)();
  NSString v18 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v16 setTitle:v18 forState:0];

  id v19 = [v1 buttonTray];
  [v19 addButton:v16];

  id v20 = [v1 buttonTray];
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  [v20 setPrivacyLinkForBundles:isa];
}

uint64_t sub_1000DB8A4()
{
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v1 = (void *)result;
    uint64_t v2 = *(void (**)(void))(result
                          + OBJC_IVAR____TtC16MusicRecognitionP33_553F2292AAF29353FD38327969F6010947MusicRecognitionOnboardingWelcomeViewController_didTapContinue);
    swift_retain();

    v2();
    return swift_release();
  }
  return result;
}

uint64_t type metadata accessor for MusicRecognitionOnboardingWelcomeViewController()
{
  return self;
}

ValueMetadata *type metadata accessor for MusicRecognitionOnboardingWelcomeView()
{
  return &type metadata for MusicRecognitionOnboardingWelcomeView;
}

unint64_t sub_1000DB9D4()
{
  unint64_t result = qword_10015C5D0;
  if (!qword_10015C5D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015C5D0);
  }
  return result;
}

unint64_t sub_1000DBA28()
{
  unint64_t result = qword_10015C5D8;
  if (!qword_10015C5D8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10015C5D8);
  }
  return result;
}

uint64_t sub_1000DBA68()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000DBAA0()
{
  return sub_1000DB8A4();
}

uint64_t Color.init(_:dark:)()
{
  uint64_t v0 = sub_1000DBC50();
  swift_release();
  swift_release();
  return v0;
}

id static UIColor.dynamicColor(light:dark:)(void *a1, void *a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a2;
  *(void *)(v4 + 24) = a1;
  id v5 = objc_allocWithZone((Class)UIColor);
  v11[4] = sub_1000DBDCC;
  v11[5] = v4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_1000DBBE8;
  v11[3] = &unk_10014D488;
  NSString v6 = _Block_copy(v11);
  id v7 = a2;
  id v8 = a1;
  id v9 = [v5 initWithDynamicProvider:v6];
  _Block_release(v6);
  swift_release();
  return v9;
}

id sub_1000DBBE8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  id v5 = (void *)v3();
  swift_release();

  return v5;
}

uint64_t sub_1000DBC50()
{
  sub_1000BF490();
  swift_retain();
  uint64_t v0 = (void *)UIColor.init(_:)();
  swift_retain();
  uint64_t v1 = (void *)UIColor.init(_:)();
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v1;
  *(void *)(v2 + 24) = v0;
  id v3 = objc_allocWithZone((Class)UIColor);
  v8[4] = sub_1000DBDCC;
  v8[5] = v2;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  v8[2] = sub_1000DBBE8;
  v8[3] = &unk_10014D4D8;
  id v4 = _Block_copy(v8);
  id v5 = v1;
  id v6 = v0;
  [v3 initWithDynamicProvider:v4];
  _Block_release(v4);

  swift_release();
  return Color.init(_:)();
}

uint64_t sub_1000DBD8C()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000DBDD0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000DBDE0()
{
  return swift_release();
}

id sub_1000DBDE8(void *a1)
{
  uint64_t v2 = *(void **)(v1 + 16);
  id v3 = *(void **)(v1 + 24);
  if ([a1 userInterfaceStyle] == (id)2) {
    id v4 = v2;
  }
  else {
    id v4 = v3;
  }

  return v4;
}

uint64_t sub_1000DBE38()
{
  v1[3] = v0;
  uint64_t v2 = type metadata accessor for MusicSubscription();
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  uint64_t v3 = swift_task_alloc();
  v1[6] = v3;
  id v4 = (void *)swift_task_alloc();
  v1[7] = v4;
  void *v4 = v1;
  v4[1] = sub_1000DBF34;
  return static MusicSubscription.current.getter(v3);
}

uint64_t sub_1000DBF34()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1000DC170;
  }
  else {
    uint64_t v2 = sub_1000DC048;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000DC048()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[6];
  uint64_t v3 = v0[3];
  uint64_t v4 = *(os_unfair_lock_s **)(v3 + OBJC_IVAR____TtC16MusicRecognition33MusicSubscriptionStatusController_lock);
  uint64_t v5 = swift_task_alloc();
  *(void *)(v5 + 16) = v3;
  *(void *)(v5 + 24) = v2;
  uint64_t v6 = swift_task_alloc();
  *(void *)(v6 + 16) = sub_1000DDA80;
  *(void *)(v6 + 24) = v5;
  os_unfair_lock_lock(v4 + 4);
  sub_1000DDA9C();
  os_unfair_lock_unlock(v4 + 4);
  uint64_t result = swift_task_dealloc();
  if (!v1)
  {
    swift_task_dealloc();
    if (MusicSubscription.canBecomeSubscriber.getter()) {
      sub_1000DCBE0();
    }
    (*(void (**)(void, void))(v0[5] + 8))(v0[6], v0[4]);
    swift_task_dealloc();
    id v8 = (uint64_t (*)(void))v0[1];
    return v8();
  }
  return result;
}

uint64_t sub_1000DC170()
{
  if (qword_100156018 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_10000E808(v1, (uint64_t)qword_100164B38);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 138412290;
    swift_errorRetain();
    uint64_t v6 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 16) = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v5 = v6;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Error fetching Apple Music subscription status with error: %@", v4, 0xCu);
    sub_1000060EC((uint64_t *)&unk_1001570F0);
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
  swift_task_dealloc();
  id v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_1000DC37C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1000063D0(a1, &qword_100157038);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1000DC528(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000DC578(a1, a2, a3, (uint64_t)&unk_10014D5C8, &qword_10015C710);
}

uint64_t sub_1000DC550(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000DC578(a1, a2, a3, (uint64_t)&unk_10014D5A0, &qword_100158D68);
}

uint64_t sub_1000DC578(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v9 = type metadata accessor for TaskPriority();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1, 1, v9) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1000063D0(a1, &qword_100157038);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a2;
  *(void *)(v11 + 24) = a3;
  sub_1000060EC(a5);
  return swift_task_create();
}

uint64_t sub_1000DC728()
{
  uint64_t v0 = type metadata accessor for MusicDataRequest.ExecutionMethod();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  os_log_type_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MusicSubscriptionStatusController();
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = v4 + OBJC_IVAR____TtC16MusicRecognition33MusicSubscriptionStatusController__musicSubscription;
  uint64_t v6 = type metadata accessor for MusicSubscription();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = OBJC_IVAR____TtC16MusicRecognition33MusicSubscriptionStatusController_lock;
  sub_1000060EC(&qword_10015C6E8);
  uint64_t v8 = swift_allocObject();
  *(_DWORD *)(v8 + 16) = 0;
  *(void *)(v4 + v7) = v8;
  ObservationRegistrar.init()();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for MusicDataRequest.ExecutionMethod.firstParty(_:), v0);
  uint64_t result = static MusicDataRequest.preferredExecutionMethod.setter();
  qword_100164EA8 = v4;
  return result;
}

uint64_t sub_1000DC8A0@<X0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  sub_1000DDC4C((unint64_t *)&qword_1001577D8, (void (*)(uint64_t))type metadata accessor for MusicSubscriptionStatusController);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v3 = v1 + OBJC_IVAR____TtC16MusicRecognition33MusicSubscriptionStatusController__musicSubscription;
  swift_beginAccess();
  return sub_100023D4C(v3, a1);
}

uint64_t sub_1000DC96C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_1000DDC4C((unint64_t *)&qword_1001577D8, (void (*)(uint64_t))type metadata accessor for MusicSubscriptionStatusController);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v4 = v3 + OBJC_IVAR____TtC16MusicRecognition33MusicSubscriptionStatusController__musicSubscription;
  swift_beginAccess();
  return sub_100023D4C(v4, a2);
}

uint64_t sub_1000DCA38(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = sub_1000060EC(&qword_1001577D0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100023D4C(a1, (uint64_t)v6);
  uint64_t v7 = *a2;
  swift_getKeyPath();
  uint64_t v10 = v7;
  uint64_t v11 = v6;
  uint64_t v12 = v7;
  sub_1000DDC4C((unint64_t *)&qword_1001577D8, (void (*)(uint64_t))type metadata accessor for MusicSubscriptionStatusController);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  return sub_1000063D0((uint64_t)v6, &qword_1001577D0);
}

uint64_t sub_1000DCB74(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1 + OBJC_IVAR____TtC16MusicRecognition33MusicSubscriptionStatusController__musicSubscription;
  swift_beginAccess();
  sub_1000DDC94(a2, v3);
  return swift_endAccess();
}

uint64_t sub_1000DCBE0()
{
  uint64_t v0 = sub_1000060EC(&qword_100157038);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100156018 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_10000E808(v3, (uint64_t)qword_100164B38);
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Started observing subscription updates", v6, 2u);
    swift_slowDealloc();
  }

  uint64_t v7 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v2, 1, 1, v7);
  uint64_t v8 = swift_allocObject();
  swift_weakInit();
  uint64_t v9 = (void *)swift_allocObject();
  void v9[2] = 0;
  _OWORD v9[3] = 0;
  v9[4] = v8;
  sub_1000DC37C((uint64_t)v2, (uint64_t)&unk_10015C6D0, (uint64_t)v9);
  return swift_release();
}

uint64_t sub_1000DCDB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[6] = a4;
  uint64_t v5 = type metadata accessor for MusicSubscription();
  v4[7] = v5;
  v4[8] = *(void *)(v5 - 8);
  v4[9] = swift_task_alloc();
  sub_1000060EC(&qword_1001577D0);
  v4[10] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for MusicSubscription.Updates();
  v4[11] = v6;
  v4[12] = *(void *)(v6 - 8);
  v4[13] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for MusicSubscription.Updates.Iterator();
  v4[14] = v7;
  v4[15] = *(void *)(v7 - 8);
  v4[16] = swift_task_alloc();
  return _swift_task_switch(sub_1000DCF5C, 0, 0);
}

uint64_t sub_1000DCF5C()
{
  uint64_t v2 = v0[12];
  uint64_t v1 = v0[13];
  uint64_t v3 = v0[11];
  static MusicSubscription.subscriptionUpdates.getter();
  MusicSubscription.Updates.makeAsyncIterator()();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_beginAccess();
  uint64_t v4 = sub_1000DDC4C(&qword_10015C6E0, (void (*)(uint64_t))&type metadata accessor for MusicSubscription.Updates.Iterator);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[17] = v5;
  void *v5 = v0;
  v5[1] = sub_1000DD0A0;
  uint64_t v6 = v0[14];
  uint64_t v7 = v0[10];
  return dispatch thunk of AsyncIteratorProtocol.next()(v7, v6, v4);
}

uint64_t sub_1000DD0A0()
{
  *(void *)(*(void *)v1 + 144) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1000DD51C;
  }
  else {
    uint64_t v2 = sub_1000DD1B4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000DD1B4()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[7];
  uint64_t v3 = v0[8];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) != 1)
  {
    (*(void (**)(void, uint64_t, uint64_t))(v3 + 32))(v0[9], v1, v2);
    uint64_t Strong = swift_weakLoadStrong();
    if (Strong)
    {
      uint64_t v5 = Strong;
      uint64_t v6 = v0[18];
      uint64_t v7 = v0[9];
      uint64_t v8 = *(os_unfair_lock_s **)(Strong + OBJC_IVAR____TtC16MusicRecognition33MusicSubscriptionStatusController_lock);
      uint64_t v9 = swift_task_alloc();
      *(void *)(v9 + 16) = v5;
      *(void *)(v9 + 24) = v7;
      uint64_t v10 = swift_task_alloc();
      *(void *)(v10 + 16) = sub_1000DE27C;
      *(void *)(v10 + 24) = v9;
      v8 += 4;
      os_unfair_lock_lock(v8);
      sub_1000DE264();
      os_unfair_lock_unlock(v8);
      if (v6)
      {
        return swift_task_dealloc();
      }
      swift_release();
      swift_task_dealloc();
      swift_task_dealloc();
    }
    if (MusicSubscription.canBecomeSubscriber.getter())
    {
      (*(void (**)(void, void))(v0[8] + 8))(v0[9], v0[7]);
      uint64_t v12 = sub_1000DDC4C(&qword_10015C6E0, (void (*)(uint64_t))&type metadata accessor for MusicSubscription.Updates.Iterator);
      NSString v13 = (void *)swift_task_alloc();
      v0[17] = v13;
      *NSString v13 = v0;
      v13[1] = sub_1000DD0A0;
      uint64_t v14 = v0[14];
      uint64_t v15 = v0[10];
      return dispatch thunk of AsyncIteratorProtocol.next()(v15, v14, v12);
    }
    if (qword_100156018 != -1) {
      swift_once();
    }
    uint64_t v16 = type metadata accessor for Logger();
    sub_10000E808(v16, (uint64_t)qword_100164B38);
    uint64_t v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v17, v18))
    {
      id v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Stopped observing subscription updates", v19, 2u);
      swift_slowDealloc();
    }
    uint64_t v21 = v0[8];
    uint64_t v20 = v0[9];
    uint64_t v22 = v0[7];

    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
  }
  (*(void (**)(void, void))(v0[15] + 8))(v0[16], v0[14]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v23 = (uint64_t (*)(void))v0[1];
  return v23();
}

uint64_t sub_1000DD51C()
{
  *(void *)(v0 + 40) = *(void *)(v0 + 144);
  sub_1000060EC(&qword_1001577C8);
  uint64_t v1 = swift_dynamicCast();
  return _swift_willThrowTypedImpl(v1, &type metadata for Never, &protocol witness table for Never);
}

uint64_t sub_1000DD5A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000060EC(&qword_1001577D0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = &v10[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = type metadata accessor for MusicSubscription();
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v8 + 16))(v6, a2, v7);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  swift_getKeyPath();
  uint64_t v11 = a1;
  uint64_t v12 = v6;
  uint64_t v13 = a1;
  sub_1000DDC4C((unint64_t *)&qword_1001577D8, (void (*)(uint64_t))type metadata accessor for MusicSubscriptionStatusController);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  return sub_1000063D0((uint64_t)v6, &qword_1001577D0);
}

uint64_t sub_1000DD758()
{
  sub_1000063D0(v0 + OBJC_IVAR____TtC16MusicRecognition33MusicSubscriptionStatusController__musicSubscription, &qword_1001577D0);
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC16MusicRecognition33MusicSubscriptionStatusController___observationRegistrar;
  uint64_t v2 = type metadata accessor for ObservationRegistrar();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_1000DD820()
{
  return type metadata accessor for MusicSubscriptionStatusController();
}

uint64_t type metadata accessor for MusicSubscriptionStatusController()
{
  uint64_t result = qword_10015C620;
  if (!qword_10015C620) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000DD874()
{
  sub_1000DD94C();
  if (v0 <= 0x3F)
  {
    type metadata accessor for ObservationRegistrar();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_1000DD94C()
{
  if (!qword_10015C630)
  {
    type metadata accessor for MusicSubscription();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10015C630);
    }
  }
}

uint64_t sub_1000DD9A4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_1000B29EC;
  return v6(a1);
}

uint64_t sub_1000DDA80()
{
  return sub_1000DD5A0(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1000DDA9C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1000DDAC4()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000DDAFC()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000DDB3C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100014D10;
  return sub_1000DCDB4(a1, v4, v5, v6);
}

uint64_t sub_1000DDBF0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000DDC30()
{
  return sub_1000DCB74(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1000DDC4C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000DDC94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000060EC(&qword_1001577D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000DDCFC(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_1000DDDDC;
  return v5(v2 + 32);
}

uint64_t sub_1000DDDDC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  *uint64_t v2 = *(unsigned char *)(v1 + 32);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_1000DDEF0(uint64_t a1, int *a2)
{
  *(void *)(v2 + 40) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 48) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_1000DDFD0;
  return v5(v2 + 16);
}

uint64_t sub_1000DDFD0()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 40);
  uint64_t v6 = *v0;
  swift_task_dealloc();
  char v3 = *(unsigned char *)(v1 + 32);
  *(_OWORD *)uint64_t v2 = *(_OWORD *)(v1 + 16);
  *(unsigned char *)(v2 + 16) = v3;
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t sub_1000DE0EC(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_100014D10;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10015C6F0 + dword_10015C6F0);
  return v6(a1, v4);
}

uint64_t sub_1000DE1A4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_100015B24;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10015C700 + dword_10015C700);
  return v6(a1, v4);
}

uint64_t sub_1000DE264()
{
  return sub_1000DDA9C();
}

uint64_t sub_1000DE27C()
{
  return sub_1000DDA80();
}

uint64_t sub_1000DE294()
{
  return sub_1000DDC30();
}

uint64_t sub_1000DE2AC()
{
  return sub_1000DE9A4((uint64_t)&unk_100115D80, &OBJC_IVAR____TtC16MusicRecognition37ContextMenuForSubscribedUserViewModel__confirmationDialogPresented);
}

uint64_t sub_1000DE2C0()
{
  *(void *)(v1 + 40) = v0;
  return _swift_task_switch(sub_1000DE2E0, 0, 0);
}

uint64_t sub_1000DE2E0()
{
  uint64_t v1 = v0[5];
  swift_getKeyPath();
  uint64_t v2 = swift_task_alloc();
  *(void *)(v2 + 16) = v1;
  *(unsigned char *)(v2 + 24) = 0;
  v0[6] = OBJC_IVAR____TtC16MusicRecognition37ContextMenuForSubscribedUserViewModel___observationRegistrar;
  v0[2] = v1;
  v0[7] = sub_1000DFEDC();
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  swift_task_dealloc();
  char v3 = *(void **)(v1 + OBJC_IVAR____TtC16MusicRecognition37ContextMenuForSubscribedUserViewModel_musicLibraryController);
  uint64_t v4 = v3[6];
  uint64_t v5 = v3[7];
  sub_100010740(v3 + 3, v4);
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v5 + 24) + **(int **)(v5 + 24));
  uint64_t v6 = (void *)swift_task_alloc();
  v0[8] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_1000DE484;
  return v8(v4, v5);
}

uint64_t sub_1000DE484()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1000DE6EC;
  }
  else {
    uint64_t v2 = sub_1000DE598;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000DE598()
{
  if (*(unsigned char *)(*(void *)(v0 + 40) + OBJC_IVAR____TtC16MusicRecognition20ContextMenuViewModel_member)) {
    int v1 = 66312;
  }
  else {
    int v1 = 776;
  }
  sub_1000D6E40(v1, 0xD000000000000028, 0x8000000100117950);
  if (qword_100156018 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_10000E808(v2, (uint64_t)qword_100164B38);
  char v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Removed song from Music Library", v5, 2u);
    swift_slowDealloc();
  }

  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_1000DE6EC()
{
  uint64_t v1 = v0[5];
  swift_getKeyPath();
  uint64_t v2 = swift_task_alloc();
  *(void *)(v2 + 16) = v1;
  *(unsigned char *)(v2 + 24) = 1;
  v0[3] = v1;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  swift_task_dealloc();
  if (qword_100156018 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_10000E808(v3, (uint64_t)qword_100164B38);
  swift_errorRetain();
  swift_errorRetain();
  os_log_type_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 138412290;
    swift_errorRetain();
    uint64_t v8 = _swift_stdlib_bridgeErrorToNSError();
    v0[4] = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v7 = v8;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Removing song from Music Library failed: %@", v6, 0xCu);
    sub_1000060EC((uint64_t *)&unk_1001570F0);
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
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_1000DE97C()
{
  return sub_1000DE9A4((uint64_t)&unk_100115D58, &OBJC_IVAR____TtC16MusicRecognition37ContextMenuForSubscribedUserViewModel__addToPlaylistSheetPresented);
}

uint64_t sub_1000DE990()
{
  return sub_1000DE9A4((uint64_t)&unk_100115D30, &OBJC_IVAR____TtC16MusicRecognition37ContextMenuForSubscribedUserViewModel__isSongInLibrary);
}

uint64_t sub_1000DE9A4(uint64_t a1, void *a2)
{
  swift_getKeyPath();
  sub_1000DFEDC();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  return *(unsigned __int8 *)(v2 + *a2);
}

uint64_t sub_1000DEA14()
{
  *(void *)(v1 + 40) = v0;
  return _swift_task_switch(sub_1000DEA34, 0, 0);
}

uint64_t sub_1000DEA34()
{
  uint64_t v1 = v0[5];
  swift_getKeyPath();
  uint64_t v2 = swift_task_alloc();
  *(void *)(v2 + 16) = v1;
  *(unsigned char *)(v2 + 24) = 1;
  v0[6] = OBJC_IVAR____TtC16MusicRecognition37ContextMenuForSubscribedUserViewModel___observationRegistrar;
  v0[2] = v1;
  v0[7] = sub_1000DFEDC();
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  swift_task_dealloc();
  v0[8] = type metadata accessor for MainActor();
  v0[9] = static MainActor.shared.getter();
  uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_1000DEB70, v4, v3);
}

uint64_t sub_1000DEB70()
{
  swift_release();
  *(void *)(v0 + 80) = [objc_allocWithZone((Class)UINotificationFeedbackGenerator) init];
  return _swift_task_switch(sub_1000DEBF4, 0, 0);
}

uint64_t sub_1000DEBF4()
{
  *(void *)(v0 + 88) = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_1000DEC80, v2, v1);
}

uint64_t sub_1000DEC80()
{
  uint64_t v1 = *(void **)(v0 + 80);
  swift_release();
  [v1 notificationOccurred:0];

  return _swift_task_switch(sub_1000DED00, 0, 0);
}

uint64_t sub_1000DED00()
{
  uint64_t v1 = *(void **)(*(void *)(v0 + 40)
                  + OBJC_IVAR____TtC16MusicRecognition37ContextMenuForSubscribedUserViewModel_musicLibraryController);
  uint64_t v2 = v1[6];
  uint64_t v3 = v1[7];
  sub_100010740(v1 + 3, v2);
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v3 + 16) + **(int **)(v3 + 16));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v4;
  void *v4 = v0;
  v4[1] = sub_1000DEE10;
  return v6(v2, v3);
}

uint64_t sub_1000DEE10()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1000DF078;
  }
  else {
    uint64_t v2 = sub_1000DEF24;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000DEF24()
{
  if (*(unsigned char *)(*(void *)(v0 + 40) + OBJC_IVAR____TtC16MusicRecognition20ContextMenuViewModel_member)) {
    int v1 = 66311;
  }
  else {
    int v1 = 775;
  }
  sub_1000D6E40(v1, 0xD000000000000028, 0x8000000100117950);
  if (qword_100156018 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_10000E808(v2, (uint64_t)qword_100164B38);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    os_log_type_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Added song to Music Library", v5, 2u);
    swift_slowDealloc();
  }

  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_1000DF078()
{
  uint64_t v1 = v0[5];
  swift_getKeyPath();
  uint64_t v2 = swift_task_alloc();
  *(void *)(v2 + 16) = v1;
  *(unsigned char *)(v2 + 24) = 0;
  v0[3] = v1;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  swift_task_dealloc();
  if (qword_100156018 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_10000E808(v3, (uint64_t)qword_100164B38);
  swift_errorRetain();
  swift_errorRetain();
  os_log_type_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 138412290;
    swift_errorRetain();
    uint64_t v8 = _swift_stdlib_bridgeErrorToNSError();
    v0[4] = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v7 = v8;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Adding song to Music Library failed: %@", v6, 0xCu);
    sub_1000060EC((uint64_t *)&unk_1001570F0);
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
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

void sub_1000DF304()
{
  qword_10015C718 = 1937075312;
  unk_10015C720 = 0xE400000000000000;
}

void sub_1000DF320()
{
  qword_10015C728 = 0x69662E6873617274;
  unk_10015C730 = 0xEA00000000006C6CLL;
}

uint64_t sub_1000DF348(uint64_t result, char a2)
{
  *(unsigned char *)(result
           + OBJC_IVAR____TtC16MusicRecognition37ContextMenuForSubscribedUserViewModel__confirmationDialogPresented) = a2;
  return result;
}

uint64_t sub_1000DF358(uint64_t result, char a2)
{
  *(unsigned char *)(result
           + OBJC_IVAR____TtC16MusicRecognition37ContextMenuForSubscribedUserViewModel__addToPlaylistSheetPresented) = a2;
  return result;
}

uint64_t sub_1000DF368@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_1000DFEDC();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + OBJC_IVAR____TtC16MusicRecognition37ContextMenuForSubscribedUserViewModel__isSongInLibrary);
  return result;
}

uint64_t sub_1000DF3E8()
{
  return swift_release();
}

uint64_t sub_1000DF488()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath);
    sub_1000DFEDC();
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1000DF584()
{
  sub_1000DF9D8(v0 + OBJC_IVAR____TtC16MusicRecognition37ContextMenuForSubscribedUserViewModel_classicalProvider);
  uint64_t v1 = v0 + OBJC_IVAR____TtC16MusicRecognition37ContextMenuForSubscribedUserViewModel_songCampaignURL;
  uint64_t v2 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = v0 + OBJC_IVAR____TtC16MusicRecognition37ContextMenuForSubscribedUserViewModel___observationRegistrar;
  uint64_t v4 = type metadata accessor for ObservationRegistrar();
  os_log_type_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);

  return v5(v3, v4);
}

uint64_t sub_1000DF684()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16MusicRecognition20ContextMenuViewModel_shazamAppStoreURL;
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC16MusicRecognition20ContextMenuViewModel_shazamURL, v2);
  uint64_t v4 = v0 + OBJC_IVAR____TtC16MusicRecognition20ContextMenuViewModel___observationRegistrar;
  uint64_t v5 = type metadata accessor for ObservationRegistrar();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v6(v4, v5);
  sub_1000DF9D8(v0 + OBJC_IVAR____TtC16MusicRecognition37ContextMenuForSubscribedUserViewModel_classicalProvider);
  v3(v0 + OBJC_IVAR____TtC16MusicRecognition37ContextMenuForSubscribedUserViewModel_songCampaignURL, v2);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v6(v0 + OBJC_IVAR____TtC16MusicRecognition37ContextMenuForSubscribedUserViewModel___observationRegistrar, v5);
  return v0;
}

uint64_t sub_1000DF7F8()
{
  sub_1000DF684();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_1000DF850()
{
  return type metadata accessor for ContextMenuForSubscribedUserViewModel();
}

uint64_t type metadata accessor for ContextMenuForSubscribedUserViewModel()
{
  uint64_t result = qword_10015C788;
  if (!qword_10015C788) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000DF8A4()
{
  sub_100064A7C();
  if (v0 <= 0x3F)
  {
    type metadata accessor for URL();
    if (v1 <= 0x3F)
    {
      type metadata accessor for ObservationRegistrar();
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

uint64_t sub_1000DF9D8(uint64_t a1)
{
  uint64_t v2 = sub_1000060EC(&qword_100158940);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000DFA38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v28 = a5;
  uint64_t v29 = a3;
  uint64_t v30 = a4;
  uint64_t v31 = a2;
  uint64_t v9 = type metadata accessor for URL();
  uint64_t v10 = *(void **)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v27 - v14;
  *(unsigned char *)(v6 + OBJC_IVAR____TtC16MusicRecognition37ContextMenuForSubscribedUserViewModel__confirmationDialogPresented) = 0;
  *(unsigned char *)(v6 + OBJC_IVAR____TtC16MusicRecognition37ContextMenuForSubscribedUserViewModel__addToPlaylistSheetPresented) = 0;
  *(unsigned char *)(v6 + OBJC_IVAR____TtC16MusicRecognition37ContextMenuForSubscribedUserViewModel__isSongInLibrary) = 0;
  *(void *)(v6 + OBJC_IVAR____TtC16MusicRecognition37ContextMenuForSubscribedUserViewModel_songAddStatusCancellable) = 0;
  uint64_t v16 = v6 + OBJC_IVAR____TtC16MusicRecognition37ContextMenuForSubscribedUserViewModel_openInClassicalTitle;
  swift_retain();
  *(void *)uint64_t v16 = LocalizedStringKey.init(stringLiteral:)();
  *(void *)(v16 + 8) = v17;
  *(unsigned char *)(v16 + 16) = v18 & 1;
  *(void *)(v16 + 24) = v19;
  ObservationRegistrar.init()();
  uint64_t v20 = (void (*)(uint64_t, uint64_t, uint64_t))v10[2];
  v20(v6 + OBJC_IVAR____TtC16MusicRecognition37ContextMenuForSubscribedUserViewModel_songCampaignURL, a4, v9);
  *(void *)(v6 + OBJC_IVAR____TtC16MusicRecognition37ContextMenuForSubscribedUserViewModel_musicLibraryController) = a1;
  uint64_t v21 = v28;
  sub_1000DFDB8(v28, v6 + OBJC_IVAR____TtC16MusicRecognition37ContextMenuForSubscribedUserViewModel_classicalProvider);
  swift_retain();
  swift_release();
  uint64_t v22 = v29;
  v20((uint64_t)v15, v29, v9);
  v20((uint64_t)v13, v31, v9);
  *(unsigned char *)(v6 + OBJC_IVAR____TtC16MusicRecognition20ContextMenuViewModel__shareSheetFromOverflow) = 0;
  ObservationRegistrar.init()();
  uint64_t v23 = (void (*)(uint64_t, char *, uint64_t))v10[4];
  v23(v6 + OBJC_IVAR____TtC16MusicRecognition20ContextMenuViewModel_shazamAppStoreURL, v15, v9);
  v23(v6 + OBJC_IVAR____TtC16MusicRecognition20ContextMenuViewModel_shazamURL, v13, v9);
  *(unsigned char *)(v6 + OBJC_IVAR____TtC16MusicRecognition20ContextMenuViewModel_member) = 1;
  uint64_t v32 = *(void *)(*(void *)(v6
                              + OBJC_IVAR____TtC16MusicRecognition37ContextMenuForSubscribedUserViewModel_musicLibraryController)
                  + 16);
  swift_allocObject();
  swift_weakInit();
  swift_retain();
  swift_retain();
  sub_1000060EC(&qword_100159388);
  sub_1000DFE60();
  uint64_t v24 = Publisher<>.sink(receiveValue:)();
  swift_release();
  swift_release();
  *(void *)(v6 + OBJC_IVAR____TtC16MusicRecognition37ContextMenuForSubscribedUserViewModel_songAddStatusCancellable) = v24;
  swift_release();
  swift_release();
  sub_1000DF9D8(v21);
  uint64_t v25 = (void (*)(uint64_t, uint64_t))v10[1];
  v25(v30, v9);
  v25(v22, v9);
  v25(v31, v9);
  return v6;
}

uint64_t sub_1000DFDB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000060EC(&qword_100158940);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000DFE20()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000DFE58()
{
  return sub_1000DF488();
}

unint64_t sub_1000DFE60()
{
  unint64_t result = qword_10015B3F0;
  if (!qword_10015B3F0)
  {
    sub_100006224(&qword_100159388);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015B3F0);
  }
  return result;
}

void sub_1000DFEC4()
{
  *(unsigned char *)(*(void *)(v0 + 16)
           + OBJC_IVAR____TtC16MusicRecognition37ContextMenuForSubscribedUserViewModel__isSongInLibrary) = *(unsigned char *)(v0 + 24);
}

unint64_t sub_1000DFEDC()
{
  unint64_t result = qword_100159FF0;
  if (!qword_100159FF0)
  {
    type metadata accessor for ContextMenuForSubscribedUserViewModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_100159FF0);
  }
  return result;
}

void sub_1000DFF44()
{
}

uint64_t sub_1000DFF5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (uint64_t)v3;
  id v8 = [v3 domain];
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;

  if (v9 == a1 && v11 == a2)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v13 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v13 & 1) == 0) {
      goto LABEL_10;
    }
  }
  if (sub_1000E014C((uint64_t)[v3 code], a3))
  {
    id v14 = v3;
    return v4;
  }
LABEL_10:
  id v15 = [v3 underlyingErrors];
  sub_1000060EC(&qword_1001577C8);
  uint64_t v16 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v17 = *(void *)(v16 + 16);
  if (v17)
  {
    uint64_t v18 = 0;
    while (1)
    {
      swift_errorRetain();
      sub_1000E010C();
      if (swift_dynamicCast())
      {
        uint64_t v4 = sub_1000DFF5C(a1, a2, a3);

        if (v4) {
          break;
        }
      }
      if (v17 == ++v18) {
        goto LABEL_16;
      }
    }
    swift_bridgeObjectRelease();
  }
  else
  {
LABEL_16:
    swift_bridgeObjectRelease();
    return 0;
  }
  return v4;
}

unint64_t sub_1000E010C()
{
  unint64_t result = qword_100159978;
  if (!qword_100159978)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100159978);
  }
  return result;
}

BOOL sub_1000E014C(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return 0;
  }
  uint64_t v4 = static Hasher._hash(seed:_:)();
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = v4 & ~v5;
  uint64_t v7 = a2 + 56;
  if (((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
    return 0;
  }
  uint64_t v8 = *(void *)(a2 + 48);
  if (*(void *)(v8 + 8 * v6) == a1) {
    return 1;
  }
  uint64_t v10 = ~v5;
  unint64_t v11 = (v6 + 1) & v10;
  if (((*(void *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
    return 0;
  }
  do
  {
    uint64_t v12 = *(void *)(v8 + 8 * v11);
    BOOL result = v12 == a1;
    if (v12 == a1) {
      break;
    }
    unint64_t v11 = (v11 + 1) & v10;
  }
  while (((*(void *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
  return result;
}

BOOL sub_1000E0218(unsigned __int8 a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return 0;
  }
  Swift::UInt v3 = a1;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v3);
  Swift::Int v4 = Hasher._finalize()();
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = v4 & ~v5;
  uint64_t v7 = a2 + 56;
  if (((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
    return 0;
  }
  uint64_t v8 = *(void *)(a2 + 48);
  if (*(unsigned __int8 *)(v8 + v6) == v3) {
    return 1;
  }
  uint64_t v10 = ~v5;
  unint64_t v11 = (v6 + 1) & v10;
  if (((*(void *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
    return 0;
  }
  do
  {
    int v12 = *(unsigned __int8 *)(v8 + v11);
    BOOL result = v12 == v3;
    if (v12 == v3) {
      break;
    }
    unint64_t v11 = (v11 + 1) & v10;
  }
  while (((*(void *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
  return result;
}

uint64_t destroy for SongMetadataView(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  _s16MusicRecognition11AnyPlaylistVwxx_0(a1 + 32);
  uint64_t result = swift_bridgeObjectRelease();
  if (*(void *)(a1 + 80))
  {
    return swift_release();
  }
  return result;
}

uint64_t initializeWithCopy for SongMetadataView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v5 = a2 + 32;
  long long v6 = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 56) = v6;
  uint64_t v7 = v6;
  uint64_t v8 = **(void (***)(uint64_t, uint64_t, uint64_t))(v6 - 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v8(a1 + 32, v5, v7);
  uint64_t v9 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  if (v9)
  {
    uint64_t v10 = *(void *)(a2 + 88);
    *(void *)(a1 + 80) = v9;
    *(void *)(a1 + 88) = v10;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  }
  return a1;
}

uint64_t assignWithCopy for SongMetadataView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_100018AC4((uint64_t *)(a1 + 32), (uint64_t *)(a2 + 32));
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 80);
  if (!*(void *)(a1 + 80))
  {
    if (v4)
    {
      uint64_t v6 = *(void *)(a2 + 88);
      *(void *)(a1 + 80) = v4;
      *(void *)(a1 + 88) = v6;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
    return a1;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v5 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = v4;
  *(void *)(a1 + 88) = v5;
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for SongMetadataView(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

uint64_t assignWithTake for SongMetadataView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  _s16MusicRecognition11AnyPlaylistVwxx_0(a1 + 32);
  long long v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  uint64_t v6 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 80);
  if (!*(void *)(a1 + 80))
  {
    if (v7)
    {
      uint64_t v9 = *(void *)(a2 + 88);
      *(void *)(a1 + 80) = v7;
      *(void *)(a1 + 88) = v9;
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
    return a1;
  }
  if (!v7)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v8 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = v7;
  *(void *)(a1 + 88) = v8;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SongMetadataView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 96)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SongMetadataView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 96) = 1;
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
    *(unsigned char *)(result + 96) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SongMetadataView()
{
  return &type metadata for SongMetadataView;
}

uint64_t sub_1000E06CC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000E06E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v61 = a2;
  uint64_t v3 = sub_1000060EC(&qword_10015C900);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v60 = (uint64_t)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v59 = (uint64_t *)((char *)&v52 - v6);
  uint64_t v57 = type metadata accessor for AccessibilityTraits();
  uint64_t v56 = *(void *)(v57 - 8);
  __chkstk_darwin(v57);
  uint64_t v8 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000060EC(&qword_100158238);
  __chkstk_darwin(v9 - 8);
  uint64_t v52 = (char *)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = sub_1000060EC(&qword_10015C908) - 8;
  uint64_t v11 = __chkstk_darwin(v55);
  uint64_t v53 = (uint64_t)&v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v54 = (uint64_t)&v52 - v13;
  uint64_t v58 = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v14 = Text.init(_:tableName:bundle:comment:)();
  uint64_t v16 = v15;
  char v18 = v17 & 1;
  static Font.title2.getter();
  uint64_t v19 = Text.font(_:)();
  uint64_t v21 = v20;
  LOBYTE(a1) = v22;
  swift_release();
  sub_10000E904(v14, v16, v18);
  swift_bridgeObjectRelease();
  static Font.Weight.bold.getter();
  uint64_t v23 = Text.fontWeight(_:)();
  uint64_t v25 = v24;
  char v27 = v26;
  uint64_t v29 = v28;
  sub_10000E904(v19, v21, a1 & 1);
  swift_bridgeObjectRelease();
  *(void *)&long long v62 = v23;
  *((void *)&v62 + 1) = v25;
  LOBYTE(v63) = v27 & 1;
  *((void *)&v63 + 1) = v29;
  static AccessibilityTraits.isHeader.getter();
  uint64_t v30 = (uint64_t)v52;
  View.accessibilityAddTraits(_:)();
  (*(void (**)(char *, uint64_t))(v56 + 8))(v8, v57);
  sub_10000E904(v62, *((uint64_t *)&v62 + 1), v63);
  swift_bridgeObjectRelease();
  LOBYTE(a1) = static Edge.Set.bottom.getter();
  EdgeInsets.init(_all:)();
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  uint64_t v38 = v37;
  uint64_t v39 = v53;
  sub_100009C94(v30, v53, &qword_100158238);
  uint64_t v40 = v39 + *(int *)(v55 + 44);
  *(unsigned char *)uint64_t v40 = a1;
  *(void *)(v40 + 8) = v32;
  *(void *)(v40 + 16) = v34;
  *(void *)(v40 + 24) = v36;
  *(void *)(v40 + 32) = v38;
  *(unsigned char *)(v40 + 40) = 0;
  sub_1000063D0(v30, &qword_100158238);
  uint64_t v41 = v54;
  sub_100009C30(v39, v54, &qword_10015C908);
  uint64_t v42 = static HorizontalAlignment.leading.getter();
  uint64_t v43 = (uint64_t)v59;
  *uint64_t v59 = v42;
  *(void *)(v43 + 8) = 0;
  *(unsigned char *)(v43 + 16) = 0;
  sub_1000060EC(&qword_10015C910);
  uint64_t v68 = *(void *)(v58 + 72);
  sub_1000579F4(v58, (uint64_t)&v62);
  uint64_t v44 = (_OWORD *)swift_allocObject();
  long long v45 = v65;
  v44[3] = v64;
  v44[4] = v45;
  long long v46 = v67;
  v44[5] = v66;
  v44[6] = v46;
  long long v47 = v63;
  v44[1] = v62;
  v44[2] = v47;
  swift_bridgeObjectRetain();
  sub_1000060EC(&qword_10015C918);
  sub_1000060EC(&qword_10015C920);
  sub_100006480(&qword_10015C928, &qword_10015C918);
  sub_100006480(&qword_10015C930, &qword_10015C920);
  sub_1000E1460();
  ForEach<>.init(_:content:)();
  sub_100009C94(v41, v39, &qword_10015C908);
  uint64_t v48 = v60;
  sub_100009C94(v43, v60, &qword_10015C900);
  uint64_t v49 = v61;
  sub_100009C94(v39, v61, &qword_10015C908);
  uint64_t v50 = sub_1000060EC(&qword_10015C940);
  sub_100009C94(v48, v49 + *(int *)(v50 + 48), &qword_10015C900);
  sub_1000063D0(v43, &qword_10015C900);
  sub_1000063D0(v41, &qword_10015C908);
  sub_1000063D0(v48, &qword_10015C900);
  return sub_1000063D0(v39, &qword_10015C908);
}

uint64_t sub_1000E0CD8@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v86 = a3;
  uint64_t v80 = type metadata accessor for Divider();
  uint64_t v79 = *(void *)(v80 - 8);
  __chkstk_darwin(v80);
  long long v78 = (char *)&v76 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000060EC(&qword_100158390);
  uint64_t v82 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  size_t v77 = (char *)&v76 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000060EC(&qword_10015C948);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v85 = (uint64_t)&v76 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v83 = (uint64_t)&v76 - v11;
  uint64_t v12 = type metadata accessor for SongMetadataRowViewModel();
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  uint64_t v15 = (char *)&v76 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  char v17 = (uint64_t *)((char *)&v76 - v16);
  uint64_t v18 = sub_1000060EC(qword_10015C1C0);
  __chkstk_darwin(v18 - 8);
  uint64_t v20 = (char *)&v76 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_1000060EC(&qword_10015C950);
  uint64_t v22 = __chkstk_darwin(v21);
  uint64_t v81 = (uint64_t)&v76 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __chkstk_darwin(v22);
  char v26 = (char *)&v76 - v25;
  __chkstk_darwin(v24);
  uint64_t v28 = (char *)&v76 - v27;
  int v29 = *a1;
  uint64_t v30 = a2;
  uint64_t v31 = a2 + 32;
  uint64_t v84 = v6;
  if (v29 == 2)
  {
    sub_100009AD0(v31, (uint64_t)v87);
    if (qword_1001562D0 != -1) {
      swift_once();
    }
    uint64_t v32 = qword_100164C70;
    uint64_t v33 = *(void *)algn_100164C78;
    swift_bridgeObjectRetain();
    uint64_t v34 = v15;
    int v35 = 2;
    uint64_t v36 = v32;
    uint64_t v37 = v33;
  }
  else
  {
    sub_100009AD0(v31, (uint64_t)v87);
    uint64_t v34 = v15;
    int v35 = v29;
    uint64_t v36 = 0;
    uint64_t v37 = 0;
  }
  sub_100084CDC(v35, v87, v36, v37, v34);
  sub_1000E14B4((uint64_t)v15, (uint64_t)v17);
  sub_1000579F4(v30, (uint64_t)v87);
  uint64_t v38 = (_OWORD *)swift_allocObject();
  long long v39 = v87[3];
  v38[3] = v87[2];
  v38[4] = v39;
  long long v40 = v87[5];
  v38[5] = v87[4];
  v38[6] = v40;
  long long v41 = v87[1];
  v38[1] = v87[0];
  _DWORD v38[2] = v41;
  sub_1000CFFAC(v17, (uint64_t)sub_1000E157C, (uint64_t)v38, (uint64_t)v20);
  char v42 = static Edge.Set.bottom.getter();
  EdgeInsets.init(_all:)();
  uint64_t v44 = v43;
  uint64_t v46 = v45;
  uint64_t v48 = v47;
  uint64_t v50 = v49;
  sub_100009C94((uint64_t)v20, (uint64_t)v26, qword_10015C1C0);
  uint64_t v51 = &v26[*(int *)(v21 + 36)];
  *uint64_t v51 = v42;
  *((void *)v51 + 1) = v44;
  *((void *)v51 + 2) = v46;
  *((void *)v51 + 3) = v48;
  *((void *)v51 + 4) = v50;
  v51[40] = 0;
  sub_1000063D0((uint64_t)v20, qword_10015C1C0);
  sub_100009C30((uint64_t)v26, (uint64_t)v28, &qword_10015C950);
  uint64_t v52 = *(void *)(v30 + 72);
  uint64_t v53 = *(void *)(v52 + 16);
  if (v53 && v29 == *(unsigned __int8 *)(v53 + v52 + 31))
  {
    uint64_t v54 = 1;
    uint64_t v56 = v83;
    uint64_t v55 = v84;
  }
  else
  {
    uint64_t v57 = v78;
    Divider.init()();
    char v58 = static Edge.Set.bottom.getter();
    EdgeInsets.init(_all:)();
    uint64_t v60 = v59;
    uint64_t v62 = v61;
    uint64_t v64 = v63;
    uint64_t v66 = v65;
    uint64_t v67 = v79;
    uint64_t v68 = (uint64_t)v77;
    uint64_t v69 = v80;
    (*(void (**)(char *, char *, uint64_t))(v79 + 16))(v77, v57, v80);
    uint64_t v55 = v84;
    uint64_t v70 = v68 + *(int *)(v84 + 36);
    *(unsigned char *)uint64_t v70 = v58;
    *(void *)(v70 + 8) = v60;
    *(void *)(v70 + 16) = v62;
    *(void *)(v70 + 24) = v64;
    *(void *)(v70 + 32) = v66;
    *(unsigned char *)(v70 + 40) = 0;
    (*(void (**)(char *, uint64_t))(v67 + 8))(v57, v69);
    uint64_t v56 = v83;
    sub_100009C30(v68, v83, &qword_100158390);
    uint64_t v54 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v82 + 56))(v56, v54, 1, v55);
  uint64_t v71 = v81;
  sub_100009C94((uint64_t)v28, v81, &qword_10015C950);
  uint64_t v72 = v85;
  sub_100009C94(v56, v85, &qword_10015C948);
  uint64_t v73 = v86;
  sub_100009C94(v71, v86, &qword_10015C950);
  uint64_t v74 = sub_1000060EC(&qword_10015C958);
  sub_100009C94(v72, v73 + *(int *)(v74 + 48), &qword_10015C948);
  sub_1000063D0(v56, &qword_10015C948);
  sub_1000063D0((uint64_t)v28, &qword_10015C950);
  sub_1000063D0(v72, &qword_10015C948);
  return sub_1000063D0(v71, &qword_10015C950);
}

uint64_t sub_1000E1314()
{
  uint64_t v1 = sub_1000060EC(&qword_10015C8E8);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v3 = static HorizontalAlignment.leading.getter();
  *((void *)v3 + 1) = 0;
  v3[16] = 0;
  uint64_t v4 = sub_1000060EC(&qword_10015C8F0);
  sub_1000E06E8(v0, (uint64_t)&v3[*(int *)(v4 + 44)]);
  if (qword_1001562C8 != -1) {
    swift_once();
  }
  sub_100006480(&qword_10015C8F8, &qword_10015C8E8);
  View.accessibilityIdentifier(_:)();
  return sub_1000063D0((uint64_t)v3, &qword_10015C8E8);
}

uint64_t sub_1000E1458@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000E0CD8(a1, v2 + 16, a2);
}

unint64_t sub_1000E1460()
{
  unint64_t result = qword_10015C938;
  if (!qword_10015C938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015C938);
  }
  return result;
}

uint64_t sub_1000E14B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SongMetadataRowViewModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000E151C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  _s16MusicRecognition11AnyPlaylistVwxx_0(v0 + 48);
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 96)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 112, 7);
}

uint64_t sub_1000E157C()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 96);
  if (v1) {
    return v1();
  }
  return result;
}

unint64_t sub_1000E15B0()
{
  unint64_t result = qword_10015C960;
  if (!qword_10015C960)
  {
    sub_100006224(&qword_10015C968);
    sub_100006480(&qword_10015C8F8, &qword_10015C8E8);
    sub_10005F80C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015C960);
  }
  return result;
}

void sub_1000E1650()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC16MusicRecognition21RunningBoardAssertion_assertion;
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC16MusicRecognition21RunningBoardAssertion_assertion);
  if (v3)
  {
    id v4 = v3;
    if ([v4 isValid]) {
      sub_1000E1B64();
    }
  }
  id v5 = [self identifierForCurrentProcess];
  id v6 = [self targetWithProcessIdentifier:v5];

  NSString v7 = String._bridgeToObjectiveC()();
  NSString v8 = String._bridgeToObjectiveC()();
  id v9 = [self attributeWithDomain:v7 name:v8];

  sub_1000060EC(&qword_100157030);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_100112420;
  *(void *)(v10 + 32) = v9;
  id v33 = (id)v10;
  specialized Array._endMutation()();
  id v11 = objc_allocWithZone((Class)RBSAssertion);
  uint64_t v12 = v6;
  uint64_t v13 = v9;
  NSString v14 = String._bridgeToObjectiveC()();
  sub_1000E2414();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v16 = [v11 initWithExplanation:v14 target:v12 attributes:isa];

  char v17 = *(void **)(v1 + v2);
  *(void *)(v1 + v2) = v16;

  uint64_t v18 = *(void **)(v1 + v2);
  if (!v18) {
    goto LABEL_9;
  }
  [v18 addObserver:v1];
  uint64_t v19 = *(void **)(v1 + v2);
  if (!v19) {
    goto LABEL_9;
  }
  id v33 = 0;
  if ([v19 acquireWithError:&v33])
  {
    id v20 = v33;
LABEL_9:
    if (qword_100156018 != -1) {
      swift_once();
    }
    uint64_t v21 = type metadata accessor for Logger();
    sub_10000E808(v21, (uint64_t)qword_100164B38);
    uint64_t v22 = Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "Acquired assertion", v24, 2u);
      swift_slowDealloc();
    }
    else
    {

      uint64_t v22 = v12;
    }
    goto LABEL_20;
  }
  id v25 = v33;
  _convertNSErrorToError(_:)();

  swift_willThrow();
  if (qword_100156018 != -1) {
    swift_once();
  }
  uint64_t v26 = type metadata accessor for Logger();
  sub_10000E808(v26, (uint64_t)qword_100164B38);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v27 = Logger.logObject.getter();
  os_log_type_t v28 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v27, v28))
  {
    log = v27;
    int v29 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = (void *)swift_slowAlloc();
    *(_DWORD *)int v29 = 138412290;
    swift_errorRetain();
    uint64_t v30 = (void *)_swift_stdlib_bridgeErrorToNSError();
    id v33 = v30;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v31 = v30;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, log, v28, "Unable to acquire assertion %@", v29, 0xCu);
    sub_1000060EC((uint64_t *)&unk_1001570F0);
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
    uint64_t v13 = v27;
  }

  uint64_t v22 = *(NSObject **)(v1 + v2);
  *(void *)(v1 + v2) = 0;
LABEL_20:
}

void sub_1000E1B64()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC16MusicRecognition21RunningBoardAssertion_assertion);
  if (!v1) {
    goto LABEL_4;
  }
  id v14 = 0;
  if ([v1 invalidateSyncWithError:&v14])
  {
    id v2 = v14;
LABEL_4:
    if (qword_100156018 != -1) {
      swift_once();
    }
    uint64_t v3 = type metadata accessor for Logger();
    sub_10000E808(v3, (uint64_t)qword_100164B38);
    id v4 = Logger.logObject.getter();
    os_log_type_t v5 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v4, v5))
    {
      id v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Invalidated assertion", v6, 2u);
      swift_slowDealloc();
    }

    return;
  }
  id v7 = v14;
  _convertNSErrorToError(_:)();

  swift_willThrow();
  if (qword_100156018 != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  sub_10000E808(v8, (uint64_t)qword_100164B38);
  swift_errorRetain();
  swift_errorRetain();
  id v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v9, v10))
  {
    id v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = (void *)swift_slowAlloc();
    *(_DWORD *)id v11 = 138412290;
    swift_errorRetain();
    uint64_t v13 = (void *)_swift_stdlib_bridgeErrorToNSError();
    id v14 = v13;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v12 = v13;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Unable to invalidate assertion %@", v11, 0xCu);
    sub_1000060EC((uint64_t *)&unk_1001570F0);
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

uint64_t type metadata accessor for RunningBoardAssertion()
{
  return self;
}

void sub_1000E1FA0(void *a1)
{
  if (qword_100156018 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_10000E808(v2, (uint64_t)qword_100164B38);
  id v8 = a1;
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    os_log_type_t v5 = (uint8_t *)swift_slowAlloc();
    id v6 = (void *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v5 = 138412290;
    id v7 = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *id v6 = v8;

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Assertion will invalidate %@", v5, 0xCu);
    sub_1000060EC((uint64_t *)&unk_1001570F0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

void sub_1000E216C(void *a1, uint64_t a2)
{
  if (qword_100156018 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_10000E808(v4, (uint64_t)qword_100164B38);
  id v5 = a1;
  swift_errorRetain();
  id v6 = v5;
  swift_errorRetain();
  oslog = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    id v9 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412546;
    id v10 = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *id v9 = v6;

    *(_WORD *)(v8 + 12) = 2112;
    if (a2)
    {
      swift_errorRetain();
      uint64_t v11 = _swift_stdlib_bridgeErrorToNSError();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
    }
    else
    {
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      uint64_t v11 = 0;
    }
    v9[1] = v11;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, oslog, v7, "Assertion did invalidate %@ with error %@", (uint8_t *)v8, 0x16u);
    sub_1000060EC((uint64_t *)&unk_1001570F0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();
  }
}

unint64_t sub_1000E2414()
{
  unint64_t result = qword_10015CA00;
  if (!qword_10015CA00)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10015CA00);
  }
  return result;
}

uint64_t sub_1000E2454@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for ArtistProfileViewModel();
  id v5 = (int *)(v4 - 8);
  __chkstk_darwin(v4);
  os_log_type_t v7 = (uint64_t *)((char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  sub_100010740(a1, v8);
  *os_log_type_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 16))(v8, v9);
  v7[1] = v10;
  uint64_t v11 = a1[3];
  uint64_t v12 = a1[4];
  sub_100010740(a1, v11);
  (*(void (**)(uint64_t, uint64_t))(v12 + 32))(v11, v12);
  uint64_t v13 = a1[3];
  uint64_t v14 = a1[4];
  sub_100010740(a1, v13);
  uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 24))(v13, v14);
  id v16 = (void *)((char *)v7 + v5[8]);
  *id v16 = v15;
  v16[1] = v17;
  uint64_t v18 = a1[3];
  uint64_t v19 = a1[4];
  sub_100010740(a1, v18);
  uint64_t v20 = (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 40))(v18, v19);
  uint64_t v21 = (void *)((char *)v7 + v5[9]);
  *uint64_t v21 = v20;
  v21[1] = v22;
  uint64_t v23 = a1[3];
  uint64_t v24 = a1[4];
  sub_100010740(a1, v23);
  *(void *)((char *)v7 + v5[10]) = (*(uint64_t (**)(uint64_t, uint64_t))(v24 + 48))(v23, v24);
  sub_1000E2658((uint64_t)v7, a2);
  return _s16MusicRecognition11AnyPlaylistVwxx_0((uint64_t)a1);
}

uint64_t type metadata accessor for ArtistProfileViewModel()
{
  uint64_t result = qword_10015CA68;
  if (!qword_10015CA68) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000E2658(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ArtistProfileViewModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t *sub_1000E26BC(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for URL();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      uint64_t v14 = sub_1000060EC((uint64_t *)&unk_100158FC0);
      memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    uint64_t v16 = a3[6];
    uint64_t v17 = a3[7];
    uint64_t v18 = (uint64_t *)((char *)v4 + v16);
    uint64_t v19 = (uint64_t *)((char *)a2 + v16);
    uint64_t v20 = v19[1];
    void *v18 = *v19;
    v18[1] = v20;
    uint64_t v21 = (uint64_t *)((char *)v4 + v17);
    uint64_t v22 = (uint64_t *)((char *)a2 + v17);
    uint64_t v23 = v22[1];
    *uint64_t v21 = *v22;
    v21[1] = v23;
    *(uint64_t *)((char *)v4 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_1000E2880(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = type metadata accessor for URL();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_release();
}

void *sub_1000E2970(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for URL();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    uint64_t v13 = sub_1000060EC((uint64_t *)&unk_100158FC0);
    memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v14 = a3[6];
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)((char *)a1 + v14);
  uint64_t v17 = (void *)((char *)a2 + v14);
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  uint64_t v19 = (void *)((char *)a1 + v15);
  uint64_t v20 = (void *)((char *)a2 + v15);
  uint64_t v21 = v20[1];
  *uint64_t v19 = *v20;
  v19[1] = v21;
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *sub_1000E2AE8(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for URL();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = sub_1000060EC((uint64_t *)&unk_100158FC0);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  uint64_t v15 = a3[6];
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (void *)((char *)a2 + v15);
  *uint64_t v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[7];
  uint64_t v19 = (void *)((char *)a1 + v18);
  uint64_t v20 = (void *)((char *)a2 + v18);
  *uint64_t v19 = *v20;
  v19[1] = v20[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_1000E2CFC(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for URL();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = sub_1000060EC((uint64_t *)&unk_100158FC0);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v12 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  *(_OWORD *)((char *)a1 + v12) = *(_OWORD *)((char *)a2 + v12);
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  return a1;
}

void *sub_1000E2E40(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for URL();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = sub_1000060EC((uint64_t *)&unk_100158FC0);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  uint64_t v16 = a3[6];
  uint64_t v17 = (void *)((char *)a1 + v16);
  uint64_t v18 = (void *)((char *)a2 + v16);
  uint64_t v20 = *v18;
  uint64_t v19 = v18[1];
  *uint64_t v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  uint64_t v21 = a3[7];
  uint64_t v22 = (void *)((char *)a1 + v21);
  uint64_t v23 = (void *)((char *)a2 + v21);
  uint64_t v25 = *v23;
  uint64_t v24 = v23[1];
  *uint64_t v22 = v25;
  v22[1] = v24;
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  swift_release();
  return a1;
}

uint64_t sub_1000E301C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000E3030);
}

uint64_t sub_1000E3030(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_1000060EC((uint64_t *)&unk_100158FC0);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1000E30E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000E30F8);
}

uint64_t sub_1000E30F8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_1000060EC((uint64_t *)&unk_100158FC0);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_1000E31A4()
{
  sub_10000ABC4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_1000E3254()
{
  qword_10015CAB0 = 0x6C69662E79616C70;
  *(void *)algn_10015CAB8 = 0xE90000000000006CLL;
}

void sub_1000E327C()
{
  qword_10015CAC0 = 0x69662E6573756170;
  *(void *)algn_10015CAC8 = 0xEA00000000006C6CLL;
}

uint64_t sub_1000E32A4()
{
  uint64_t result = static Animation.interpolatingSpring(mass:stiffness:damping:initialVelocity:)();
  qword_10015CAD0 = result;
  return result;
}

uint64_t sub_1000E32DC()
{
  uint64_t v0 = type metadata accessor for LayoutDirection();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  unint64_t v4 = &v12[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v2);
  uint64_t v6 = &v12[-v5];
  sub_100008C14((uint64_t)&v12[-v5]);
  (*(void (**)(unsigned char *, void, uint64_t))(v1 + 104))(v4, enum case for LayoutDirection.leftToRight(_:), v0);
  static LayoutDirection.== infix(_:_:)();
  uint64_t v7 = *(void (**)(unsigned char *, uint64_t))(v1 + 8);
  v7(v4, v0);
  v7(v6, v0);
  type metadata accessor for SongPreviewPlaybackView();
  type metadata accessor for SongPreviewPlaybackViewModel();
  sub_1000E65E8(&qword_10015CBC0, (void (*)(uint64_t))type metadata accessor for SongPreviewPlaybackViewModel);
  StateObject.wrappedValue.getter();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v8 = (void *)(StateObject.wrappedValue.getter()
                + OBJC_IVAR____TtC16MusicRecognition28SongPreviewPlaybackViewModel_previewController);
  uint64_t v9 = v8[3];
  uint64_t v10 = v8[4];
  sub_100010740(v8, v9);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v10);
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t *sub_1000E35C4(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    sub_1000060EC(&qword_100156948);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = type metadata accessor for LayoutDirection();
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
    sub_1000E373C();
    *(void *)uint64_t v10 = v12;
    *((void *)v10 + 1) = v13;
    unsigned char v10[16] = v14;
    uint64_t v15 = *(int *)(a3 + 24);
    uint64_t v16 = (uint64_t *)((char *)a1 + v15);
    uint64_t v17 = (uint64_t *)((char *)a2 + v15);
    if (*v17)
    {
      uint64_t v18 = v17[1];
      *uint64_t v16 = *v17;
      v16[1] = v18;
      swift_retain();
    }
    else
    {
      *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
    }
  }
  return a1;
}

uint64_t sub_1000E373C()
{
  return swift_retain();
}

uint64_t sub_1000E3744(uint64_t a1, uint64_t a2)
{
  sub_1000060EC(&qword_100156948);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = type metadata accessor for LayoutDirection();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t result = sub_1000E3810();
  if (*(void *)(a1 + *(int *)(a2 + 24)))
  {
    return swift_release();
  }
  return result;
}

uint64_t sub_1000E3810()
{
  return swift_release();
}

void *sub_1000E3818(void *a1, void *a2, uint64_t a3)
{
  sub_1000060EC(&qword_100156948);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for LayoutDirection();
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
  sub_1000E373C();
  *(void *)uint64_t v8 = v10;
  *((void *)v8 + 1) = v11;
  v8[16] = v12;
  uint64_t v13 = *(int *)(a3 + 24);
  char v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  if (*v15)
  {
    uint64_t v16 = v15[1];
    *char v14 = *v15;
    v14[1] = v16;
    swift_retain();
  }
  else
  {
    *(_OWORD *)char v14 = *(_OWORD *)v15;
  }
  return a1;
}

void *sub_1000E3940(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1000063D0((uint64_t)a1, &qword_100156948);
    sub_1000060EC(&qword_100156948);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = type metadata accessor for LayoutDirection();
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
  sub_1000E373C();
  *(void *)uint64_t v8 = v10;
  *((void *)v8 + 1) = v11;
  v8[16] = v12;
  sub_1000E3810();
  uint64_t v13 = *(int *)(a3 + 24);
  char v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  uint64_t v16 = *(void *)((char *)a1 + v13);
  uint64_t v17 = *v15;
  if (!v16)
  {
    if (v17)
    {
      uint64_t v19 = v15[1];
      *char v14 = v17;
      v14[1] = v19;
      swift_retain();
      return a1;
    }
LABEL_12:
    *(_OWORD *)char v14 = *(_OWORD *)v15;
    return a1;
  }
  if (!v17)
  {
    swift_release();
    goto LABEL_12;
  }
  uint64_t v18 = v15[1];
  *char v14 = v17;
  v14[1] = v18;
  swift_retain();
  swift_release();
  return a1;
}

char *sub_1000E3ABC(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_1000060EC(&qword_100156948);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = type metadata accessor for LayoutDirection();
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
  unsigned char v10[16] = v11[16];
  char v12 = &a1[v9];
  uint64_t v13 = &a2[v9];
  uint64_t v14 = *(void *)v13;
  if (*(void *)v13)
  {
    uint64_t v15 = *((void *)v13 + 1);
    *(void *)char v12 = v14;
    *((void *)v12 + 1) = v15;
  }
  else
  {
    *(_OWORD *)char v12 = *(_OWORD *)v13;
  }
  return a1;
}

char *sub_1000E3BC4(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1000063D0((uint64_t)a1, &qword_100156948);
    uint64_t v6 = sub_1000060EC(&qword_100156948);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = type metadata accessor for LayoutDirection();
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
  sub_1000E3810();
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = *(void *)&a1[v12];
  uint64_t v16 = *(void *)v14;
  if (!v15)
  {
    if (v16)
    {
      uint64_t v18 = *((void *)v14 + 1);
      *(void *)uint64_t v13 = v16;
      *((void *)v13 + 1) = v18;
      return a1;
    }
LABEL_11:
    *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
    return a1;
  }
  if (!v16)
  {
    swift_release();
    goto LABEL_11;
  }
  uint64_t v17 = *((void *)v14 + 1);
  *(void *)uint64_t v13 = v16;
  *((void *)v13 + 1) = v17;
  swift_release();
  return a1;
}

uint64_t sub_1000E3D1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000E3D30);
}

uint64_t sub_1000E3D30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000060EC(&qword_10015CAD8);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24));
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

uint64_t sub_1000E3E00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000E3E14);
}

uint64_t sub_1000E3E14(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1000060EC(&qword_10015CAD8);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = a2;
  }
  return result;
}

uint64_t type metadata accessor for SongPreviewPlaybackView()
{
  uint64_t result = qword_10015CB38;
  if (!qword_10015CB38) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000E3F20()
{
  sub_1000E3FC0();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_1000E3FC0()
{
  if (!qword_10015CB48)
  {
    type metadata accessor for LayoutDirection();
    unint64_t v0 = type metadata accessor for Environment.Content();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10015CB48);
    }
  }
}

uint64_t sub_1000E4018()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000E4034@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v96 = a2;
  uint64_t v3 = type metadata accessor for CoordinateSpace();
  uint64_t v94 = *(void *)(v3 - 8);
  uint64_t v95 = v3;
  __chkstk_darwin(v3);
  uint64_t v93 = (char *)&v68 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for SongPreviewPlaybackView();
  uint64_t v76 = *(void *)(v5 - 8);
  uint64_t v6 = *(void *)(v76 + 64);
  __chkstk_darwin(v5);
  uint64_t v97 = (uint64_t)&v68 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = sub_1000060EC(&qword_10015CB88);
  uint64_t v71 = *(void *)(v72 - 8);
  __chkstk_darwin(v72);
  uint64_t v8 = (char *)&v68 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_1000060EC(&qword_10015CB90) - 8;
  __chkstk_darwin(v69);
  uint64_t v68 = (char *)&v68 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = sub_1000060EC(&qword_10015CB98) - 8;
  __chkstk_darwin(v79);
  uint64_t v73 = (uint64_t)&v68 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = sub_1000060EC(&qword_10015CBA0);
  __chkstk_darwin(v78);
  uint64_t v77 = (uint64_t)&v68 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = sub_1000060EC(&qword_10015CBA8);
  uint64_t v12 = __chkstk_darwin(v87);
  uint64_t v80 = (char *)&v68 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v84 = (char *)&v68 - v14;
  uint64_t v86 = sub_1000060EC(&qword_10015CBB0) - 8;
  __chkstk_darwin(v86);
  uint64_t v85 = (char *)&v68 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = sub_1000060EC(&qword_10015CBB8) - 8;
  uint64_t v16 = __chkstk_darwin(v91);
  uint64_t v92 = (uint64_t)&v68 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v89 = (uint64_t)&v68 - v19;
  __chkstk_darwin(v18);
  uint64_t v90 = (uint64_t)&v68 - v20;
  type metadata accessor for SongPreviewPlaybackViewModel();
  sub_1000E65E8(&qword_10015CBC0, (void (*)(uint64_t))type metadata accessor for SongPreviewPlaybackViewModel);
  uint64_t v88 = *(void *)(StateObject.wrappedValue.getter()
                  + OBJC_IVAR____TtC16MusicRecognition28SongPreviewPlaybackViewModel_backgroundColor);
  swift_retain();
  swift_release();
  StateObject.projectedValue.getter();
  swift_getKeyPath();
  ObservedObject.Wrapper.subscript.getter();
  swift_release();
  swift_release();
  uint64_t v83 = v102;
  uint64_t v82 = v103;
  uint64_t v21 = v104;
  uint64_t v99 = 0;
  State.init(wrappedValue:)();
  uint64_t v22 = v100;
  uint64_t v81 = v101;
  uint64_t v23 = a1;
  uint64_t v70 = a1;
  uint64_t v24 = a1;
  uint64_t v25 = v97;
  sub_1000E5E34(v24, v97);
  uint64_t v26 = *(unsigned __int8 *)(v76 + 80);
  uint64_t v27 = ((v26 + 16) & ~v26) + v6;
  uint64_t v28 = (v26 + 16) & ~v26;
  uint64_t v74 = v28;
  uint64_t v76 = v27;
  uint64_t v75 = v26 | 7;
  uint64_t v29 = swift_allocObject();
  sub_1000E5E9C(v25, v29 + v28);
  uint64_t v98 = v23;
  sub_1000060EC(&qword_100158C90);
  sub_1000E5F68();
  Button.init(action:label:)();
  uint64_t v30 = StateObject.wrappedValue.getter();
  uint64_t v31 = *(void *)(v30 + OBJC_IVAR____TtC16MusicRecognition28SongPreviewPlaybackViewModel_previewController + 24);
  uint64_t v32 = *(void *)(v30 + OBJC_IVAR____TtC16MusicRecognition28SongPreviewPlaybackViewModel_previewController + 32);
  sub_100010740((void *)(v30 + OBJC_IVAR____TtC16MusicRecognition28SongPreviewPlaybackViewModel_previewController), v31);
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v31, v32);
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  id v33 = &OBJC_IVAR____TtC16MusicRecognition28SongPreviewPlaybackViewModel_buttonColor;
  if ((_BYTE)v102) {
    id v33 = &OBJC_IVAR____TtC16MusicRecognition28SongPreviewPlaybackViewModel_backgroundColor;
  }
  uint64_t v34 = *(void *)(v30 + *v33);
  swift_retain();
  swift_release();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v102 = v34;
  swift_retain();
  uint64_t v36 = AnyShapeStyle.init<A>(_:)();
  uint64_t v37 = v71;
  uint64_t v38 = (uint64_t)v68;
  uint64_t v39 = v72;
  (*(void (**)(char *, char *, uint64_t))(v71 + 16))(v68, v8, v72);
  swift_release();
  long long v40 = (uint64_t *)(v38 + *(int *)(v69 + 44));
  *long long v40 = KeyPath;
  v40[1] = v36;
  (*(void (**)(char *, uint64_t))(v37 + 8))(v8, v39);
  StateObject.wrappedValue.getter();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  uint64_t v41 = Color.opacity(_:)();
  swift_release();
  LOBYTE(KeyPath) = static Edge.Set.all.getter();
  uint64_t v42 = v73;
  sub_100009C94(v38, v73, &qword_10015CB90);
  uint64_t v43 = v42 + *(int *)(v79 + 44);
  *(void *)uint64_t v43 = v41;
  *(unsigned char *)(v43 + 8) = KeyPath;
  sub_1000063D0(v38, &qword_10015CB90);
  uint64_t v44 = v77;
  sub_100009C94(v42, v77, &qword_10015CB98);
  *(_WORD *)(v44 + *(int *)(v78 + 36)) = 256;
  sub_1000063D0(v42, &qword_10015CB98);
  StateObject.wrappedValue.getter();
  sub_1000C2670();
  swift_bridgeObjectRetain();
  swift_release();
  sub_1000E61C8();
  uint64_t v45 = (uint64_t)v80;
  View.accessibilityIdentifier(_:)();
  swift_bridgeObjectRelease();
  sub_1000063D0(v44, &qword_10015CBA0);
  StateObject.wrappedValue.getter();
  uint64_t v46 = sub_1000C17D4();
  uint64_t v48 = v47;
  swift_release();
  uint64_t v102 = v46;
  uint64_t v103 = v48;
  sub_10000E0F0();
  uint64_t v49 = (uint64_t)v84;
  ModifiedContent<>.accessibilityLabel<A>(_:)();
  swift_bridgeObjectRelease();
  sub_1000063D0(v45, &qword_10015CBA8);
  uint64_t v51 = v93;
  uint64_t v50 = v94;
  uint64_t v52 = v95;
  (*(void (**)(char *, void, uint64_t))(v94 + 104))(v93, enum case for CoordinateSpace.local(_:), v95);
  uint64_t v53 = (uint64_t)v85;
  uint64_t v54 = &v85[*(int *)(v86 + 44)];
  uint64_t v55 = sub_1000060EC(&qword_10015CC08);
  (*(void (**)(char *, char *, uint64_t))(v50 + 16))(&v54[*(int *)(v55 + 36)], v51, v52);
  *(void *)uint64_t v54 = &type metadata for PreviewButtonWidthPreferenceKey;
  uint64_t v56 = (void (**)(double *@<X8>, double@<D2>, double@<D3>))&v54[*(int *)(v55 + 40)];
  *uint64_t v56 = sub_10004FA84;
  v56[1] = 0;
  sub_100009C94(v49, v53, &qword_10015CBA8);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v51, v52);
  sub_1000063D0(v49, &qword_10015CBA8);
  uint64_t v57 = v97;
  sub_1000E5E34(v70, v97);
  uint64_t v58 = swift_allocObject();
  sub_1000E5E9C(v57, v58 + v74);
  uint64_t v59 = v89;
  sub_100009C94(v53, v89, &qword_10015CBB0);
  uint64_t v60 = (uint64_t (**)())(v59 + *(int *)(v91 + 44));
  *uint64_t v60 = sub_1000E6508;
  v60[1] = (uint64_t (*)())v58;
  sub_1000063D0(v53, &qword_10015CBB0);
  uint64_t v61 = v90;
  sub_1000E6578(v59, v90);
  uint64_t v62 = v92;
  sub_100009C94(v61, v92, &qword_10015CBB8);
  uint64_t v63 = v96;
  *uint64_t v96 = v88;
  v63[1] = v22;
  uint64_t v64 = v83;
  v63[2] = v81;
  v63[3] = v64;
  v63[4] = v82;
  v63[5] = v21;
  uint64_t v65 = v63;
  uint64_t v66 = sub_1000060EC(&qword_10015CC10);
  sub_100009C94(v62, (uint64_t)v65 + *(int *)(v66 + 48), &qword_10015CBB8);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1000063D0(v61, &qword_10015CBB8);
  sub_1000063D0(v62, &qword_10015CBB8);
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_1000E4C2C(uint64_t a1)
{
  uint64_t v1 = (void (**)(void))(a1 + *(int *)(type metadata accessor for SongPreviewPlaybackView() + 24));
  if (*v1) {
    (*v1)();
  }
  type metadata accessor for SongPreviewPlaybackViewModel();
  sub_1000E65E8(&qword_10015CBC0, (void (*)(uint64_t))type metadata accessor for SongPreviewPlaybackViewModel);
  uint64_t v2 = (void *)(StateObject.wrappedValue.getter()
                + OBJC_IVAR____TtC16MusicRecognition28SongPreviewPlaybackViewModel_previewController);
  uint64_t v3 = v2[3];
  uint64_t v4 = v2[4];
  sub_100010740(v2, v3);
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v3, v4);

  return swift_release();
}

uint64_t sub_1000E4D38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v23 = a2;
  uint64_t v3 = type metadata accessor for AccessibilityTraits();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_1000060EC(&qword_100158C88);
  uint64_t v7 = __chkstk_darwin(v22);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v21 = (char *)&v20 - v10;
  uint64_t v11 = static Alignment.center.getter();
  uint64_t v13 = v12;
  sub_1000E50DC(a1, (uint64_t)v25);
  *(void *)&long long v24 = v11;
  *((void *)&v24 + 1) = v13;
  sub_1000060EC(&qword_10015CC18);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_100110670;
  static AccessibilityTraits.startsMediaSession.getter();
  *(void *)&v27[0] = v14;
  sub_1000E65E8(&qword_10015CC20, (void (*)(uint64_t))&type metadata accessor for AccessibilityTraits);
  sub_1000060EC(&qword_10015CC28);
  sub_100006480(&qword_10015CC30, &qword_10015CC28);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  sub_1000060EC(&qword_10015CBE0);
  sub_100006480(&qword_10015CBD8, &qword_10015CBE0);
  View.accessibilityAddTraits(_:)();
  uint64_t v15 = *(void (**)(char *, uint64_t))(v4 + 8);
  v15(v6, v3);
  v27[12] = v25[11];
  v27[13] = v25[12];
  v28[0] = v26[0];
  *(_OWORD *)((char *)v28 + 9) = *(_OWORD *)((char *)v26 + 9);
  v27[8] = v25[7];
  v27[9] = v25[8];
  v27[10] = v25[9];
  v27[11] = v25[10];
  v27[4] = v25[3];
  v27[5] = v25[4];
  v27[6] = v25[5];
  v27[7] = v25[6];
  v27[0] = v24;
  v27[1] = v25[0];
  v27[2] = v25[1];
  v27[3] = v25[2];
  sub_1000E6630((uint64_t)v27);
  static AccessibilityTraits.isImage.getter();
  uint64_t v16 = (uint64_t)v21;
  ModifiedContent<>.accessibilityRemoveTraits(_:)();
  v15(v6, v3);
  sub_1000063D0((uint64_t)v9, &qword_100158C88);
  uint64_t v17 = static Alignment.center.getter();
  sub_100043694(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v23, 0.0, 1, INFINITY, 0, v17, v18);
  return sub_1000063D0(v16, &qword_100158C88);
}

uint64_t sub_1000E50DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Image.ResizingMode();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v72 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100156570 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  Image.init(systemName:)();
  uint64_t v8 = *(void (**)(void))(v5 + 104);
  unsigned int v78 = enum case for Image.ResizingMode.stretch(_:);
  uint64_t v79 = v5 + 104;
  uint64_t v77 = (void (*)(char *, void, uint64_t))v8;
  v8(v7);
  uint64_t v92 = Image.resizable(capInsets:resizingMode:)();
  swift_release();
  uint64_t v9 = *(void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v80 = v7;
  uint64_t v81 = v5 + 8;
  uint64_t v82 = v4;
  uint64_t v75 = v9;
  v9(v7, v4);
  type metadata accessor for SongPreviewPlaybackView();
  uint64_t v85 = a1;
  uint64_t v10 = type metadata accessor for SongPreviewPlaybackViewModel();
  uint64_t v11 = sub_1000E65E8(&qword_10015CBC0, (void (*)(uint64_t))type metadata accessor for SongPreviewPlaybackViewModel);
  StateObject.wrappedValue.getter();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v94 = v10;
  StateObject.wrappedValue.getter();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v90 = v130;
  uint64_t v91 = v128;
  int v86 = v131;
  int v87 = v129;
  uint64_t v88 = v133;
  uint64_t v89 = v132;
  uint64_t v12 = (void *)(StateObject.wrappedValue.getter()
                 + OBJC_IVAR____TtC16MusicRecognition28SongPreviewPlaybackViewModel_previewController);
  uint64_t v13 = v12[3];
  uint64_t v14 = v12[4];
  sub_100010740(v12, v13);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v14);
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  int v74 = LOBYTE(v106[0]);
  swift_release();
  uint64_t v93 = v11;
  uint64_t v15 = (void *)(StateObject.wrappedValue.getter()
                 + OBJC_IVAR____TtC16MusicRecognition28SongPreviewPlaybackViewModel_previewController);
  uint64_t v16 = v15[3];
  uint64_t v17 = v15[4];
  sub_100010740(v15, v16);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v17);
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  int v73 = LOBYTE(v106[0]);
  swift_release();
  static UnitPoint.center.getter();
  uint64_t v83 = v18;
  uint64_t v20 = v19;
  if (qword_100156578 != -1) {
    swift_once();
  }
  uint64_t v21 = qword_10015CAD0;
  uint64_t v22 = (void *)(StateObject.wrappedValue.getter()
                 + OBJC_IVAR____TtC16MusicRecognition28SongPreviewPlaybackViewModel_previewController);
  uint64_t v23 = v22[3];
  uint64_t v24 = v22[4];
  sub_100010740(v22, v23);
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v24);
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  int v25 = LOBYTE(v106[0]);
  swift_release();
  uint64_t v26 = qword_100156568;
  uint64_t v84 = v21;
  swift_retain();
  if (v26 != -1) {
    swift_once();
  }
  BOOL v76 = v25 == 1;
  if (v73 == 1) {
    double v27 = 1.0;
  }
  else {
    double v27 = 0.0;
  }
  if (v74 == 1) {
    double v28 = 1.0;
  }
  else {
    double v28 = 0.0;
  }
  swift_bridgeObjectRetain();
  Image.init(systemName:)();
  uint64_t v29 = v80;
  uint64_t v30 = v82;
  v77(v80, v78, v82);
  uint64_t v79 = Image.resizable(capInsets:resizingMode:)();
  swift_release();
  v75(v29, v30);
  StateObject.wrappedValue.getter();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  StateObject.wrappedValue.getter();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  LODWORD(v80) = v135;
  uint64_t v81 = v136;
  uint64_t v82 = v134;
  unsigned int v78 = v137;
  uint64_t v77 = v138;
  uint64_t v75 = v139;
  sub_1000E32DC();
  uint64_t v32 = v31;
  id v33 = (void *)(StateObject.wrappedValue.getter()
                 + OBJC_IVAR____TtC16MusicRecognition28SongPreviewPlaybackViewModel_previewController);
  uint64_t v34 = v33[3];
  uint64_t v35 = v33[4];
  sub_100010740(v33, v34);
  (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v34, v35);
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  int v36 = LOBYTE(v106[0]);
  swift_release();
  if (v36 == 1) {
    double v37 = 0.0;
  }
  else {
    double v37 = 1.0;
  }
  uint64_t v38 = (void *)(StateObject.wrappedValue.getter()
                 + OBJC_IVAR____TtC16MusicRecognition28SongPreviewPlaybackViewModel_previewController);
  uint64_t v39 = v38[3];
  uint64_t v40 = v38[4];
  sub_100010740(v38, v39);
  (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v39, v40);
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  int v41 = LOBYTE(v106[0]);
  swift_release();
  if (v41 == 1) {
    double v42 = 0.0;
  }
  else {
    double v42 = 1.0;
  }
  static UnitPoint.center.getter();
  uint64_t v44 = v43;
  uint64_t v46 = v45;
  uint64_t v47 = qword_10015CAD0;
  uint64_t v48 = (void *)(StateObject.wrappedValue.getter()
                 + OBJC_IVAR____TtC16MusicRecognition28SongPreviewPlaybackViewModel_previewController);
  uint64_t v49 = v48[3];
  uint64_t v50 = v48[4];
  sub_100010740(v48, v49);
  (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v49, v50);
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  int v51 = LOBYTE(v106[0]);
  swift_release();
  *(_DWORD *)((char *)&v101 + 1) = *(_DWORD *)v95;
  DWORD1(v101) = *(_DWORD *)&v95[3];
  uint64_t v52 = v79;
  uint64_t v54 = v81;
  uint64_t v53 = v82;
  *(void *)&long long v99 = v79;
  *((void *)&v99 + 1) = v82;
  LOBYTE(v100) = (_BYTE)v80;
  DWORD1(v100) = *(_DWORD *)&v97[3];
  *(_DWORD *)((char *)&v100 + 1) = *(_DWORD *)v97;
  *((void *)&v100 + 1) = v81;
  char v55 = v78;
  LOBYTE(v101) = v78;
  uint64_t v56 = (void (*)(void, void, void))v77;
  uint64_t v57 = v75;
  *((void *)&v101 + 1) = v77;
  *(void *)&long long v102 = v75;
  *((void *)&v102 + 1) = v32;
  *(void *)&long long v103 = 0;
  *((double *)&v103 + 1) = v37;
  *(double *)&long long v104 = v42;
  *((double *)&v104 + 1) = v42;
  *(void *)&v105[0] = v44;
  *((void *)&v105[0] + 1) = v46;
  *(void *)&v105[1] = v47;
  BYTE8(v105[1]) = v51 == 1;
  v106[7] = *(_OWORD *)((char *)v105 + 9);
  *(_OWORD *)((char *)&v106[6] + 7) = v105[0];
  *(_OWORD *)((char *)&v106[5] + 7) = v104;
  *(_OWORD *)((char *)&v106[4] + 7) = v103;
  *(_OWORD *)((char *)v106 + 7) = v99;
  *(_OWORD *)((char *)&v106[1] + 7) = v100;
  *(_OWORD *)((char *)&v106[3] + 7) = v102;
  char v98 = (char)v80;
  char v58 = (char)v80;
  char v96 = v78;
  *(_DWORD *)v113 = *(_DWORD *)v97;
  *(_DWORD *)&v113[3] = *(_DWORD *)&v97[3];
  *(_DWORD *)v116 = *(_DWORD *)v95;
  *(_DWORD *)&v116[3] = *(_DWORD *)&v95[3];
  char v110 = v87;
  char v108 = v86;
  *(_OWORD *)((char *)&v106[2] + 7) = v101;
  char v59 = v87;
  int v60 = *(_DWORD *)v109;
  *(_DWORD *)(a2 + 20) = *(_DWORD *)&v109[3];
  *(_DWORD *)(a2 + 17) = v60;
  LOBYTE(v60) = v108;
  int v61 = *(_DWORD *)v107;
  *(_DWORD *)(a2 + 36) = *(_DWORD *)&v107[3];
  *(_DWORD *)(a2 + 33) = v61;
  uint64_t v62 = v91;
  *(void *)a2 = v92;
  *(void *)(a2 + 8) = v62;
  *(unsigned char *)(a2 + 16) = v59;
  *(void *)(a2 + 24) = v90;
  *(unsigned char *)(a2 + 32) = v60;
  uint64_t v63 = v88;
  *(void *)(a2 + 40) = v89;
  *(void *)(a2 + 48) = v63;
  *(double *)(a2 + 56) = v28;
  *(double *)(a2 + 64) = v27;
  uint64_t v64 = v83;
  *(double *)(a2 + 72) = v27;
  *(void *)(a2 + 80) = v64;
  *(void *)(a2 + 88) = v20;
  *(void *)(a2 + 96) = v84;
  *(unsigned char *)(a2 + 104) = v76;
  long long v65 = v106[0];
  long long v66 = v106[1];
  long long v67 = v106[2];
  *(_OWORD *)(a2 + 153) = v106[3];
  *(_OWORD *)(a2 + 137) = v67;
  *(_OWORD *)(a2 + 121) = v66;
  *(_OWORD *)(a2 + 105) = v65;
  long long v68 = v106[4];
  long long v69 = v106[5];
  long long v70 = v106[6];
  *(_OWORD *)(a2 + 217) = v106[7];
  *(_OWORD *)(a2 + 201) = v70;
  *(_OWORD *)(a2 + 185) = v69;
  *(_OWORD *)(a2 + 169) = v68;
  v111[0] = v52;
  v111[1] = v53;
  char v112 = v58;
  uint64_t v114 = v54;
  char v115 = v55;
  v117 = v56;
  v118 = v57;
  uint64_t v119 = v32;
  uint64_t v120 = 0;
  double v121 = v37;
  double v122 = v42;
  double v123 = v42;
  uint64_t v124 = v44;
  uint64_t v125 = v46;
  uint64_t v126 = v47;
  BOOL v127 = v51 == 1;
  swift_retain();
  swift_retain();
  sub_1000E6688((uint64_t)&v99);
  swift_retain();
  sub_1000E66C0((uint64_t)v111);
  swift_release();
  return swift_release();
}

uint64_t sub_1000E5CF4()
{
  return static Published.subscript.setter();
}

uint64_t sub_1000E5DE8@<X0>(uint64_t *a1@<X8>)
{
  *a1 = static Alignment.center.getter();
  a1[1] = v3;
  uint64_t v4 = sub_1000060EC(&qword_10015CB80);
  return sub_1000E4034(v1, (uint64_t *)((char *)a1 + *(int *)(v4 + 44)));
}

uint64_t sub_1000E5E34(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SongPreviewPlaybackView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000E5E9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SongPreviewPlaybackView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000E5F00()
{
  uint64_t v1 = *(void *)(type metadata accessor for SongPreviewPlaybackView() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_1000E4C2C(v2);
}

uint64_t sub_1000E5F60@<X0>(uint64_t a1@<X8>)
{
  return sub_1000E4D38(*(void *)(v1 + 16), a1);
}

unint64_t sub_1000E5F68()
{
  unint64_t result = qword_10015CBC8;
  if (!qword_10015CBC8)
  {
    sub_100006224(&qword_100158C90);
    sub_1000E5FE4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015CBC8);
  }
  return result;
}

unint64_t sub_1000E5FE4()
{
  unint64_t result = qword_10015CBD0;
  if (!qword_10015CBD0)
  {
    sub_100006224(&qword_100158C88);
    sub_100006480(&qword_10015CBD8, &qword_10015CBE0);
    sub_1000E65E8((unint64_t *)&qword_1001567D8, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015CBD0);
  }
  return result;
}

double sub_1000E60BC@<D0>(double *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  double result = v3;
  *a1 = v3;
  return result;
}

uint64_t sub_1000E613C()
{
  return static Published.subscript.setter();
}

unint64_t sub_1000E61C8()
{
  unint64_t result = qword_10015CBE8;
  if (!qword_10015CBE8)
  {
    sub_100006224(&qword_10015CBA0);
    sub_1000E6268();
    sub_100006480(&qword_100158BE0, &qword_100158BE8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015CBE8);
  }
  return result;
}

unint64_t sub_1000E6268()
{
  unint64_t result = qword_10015CBF0;
  if (!qword_10015CBF0)
  {
    sub_100006224(&qword_10015CB98);
    sub_1000E6308();
    sub_100006480(&qword_10015A2B8, &qword_10015A2C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015CBF0);
  }
  return result;
}

unint64_t sub_1000E6308()
{
  unint64_t result = qword_10015CBF8;
  if (!qword_10015CBF8)
  {
    sub_100006224(&qword_10015CB90);
    sub_100006480(&qword_10015CC00, &qword_10015CB88);
    sub_100006480(&qword_100157BF8, &qword_100157C00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015CBF8);
  }
  return result;
}

uint64_t sub_1000E63D0()
{
  uint64_t v1 = type metadata accessor for SongPreviewPlaybackView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  sub_1000060EC(&qword_100156948);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = type metadata accessor for LayoutDirection();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  sub_1000E3810();
  if (*(void *)(v0 + v3 + *(int *)(v1 + 24))) {
    swift_release();
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_1000E6508()
{
  type metadata accessor for SongPreviewPlaybackView();

  return sub_1000E5CF4();
}

uint64_t sub_1000E6578(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000060EC(&qword_10015CBB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000E65E8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000E6630(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000E6688(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000E66C0(uint64_t a1)
{
  return a1;
}

ValueMetadata *type metadata accessor for PreviewButtonWidthPreferenceKey()
{
  return &type metadata for PreviewButtonWidthPreferenceKey;
}

uint64_t sub_1000E6708()
{
  return sub_100006480(&qword_10015CC38, &qword_10015CC40);
}

unint64_t sub_1000E6744(uint64_t a1)
{
  unint64_t result = sub_1000E676C();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1000E676C()
{
  unint64_t result = qword_10015CC48[0];
  if (!qword_10015CC48[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10015CC48);
  }
  return result;
}

void *sub_1000E67C0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1000060EC(&qword_100157818);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v54 - v8;
  uint64_t v10 = v1 + 4;
  uint64_t v11 = v1[7];
  uint64_t v12 = v1[8];
  sub_100010740(v1 + 4, v11);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v12);
  uint64_t v13 = type metadata accessor for Date();
  char v55 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
  int v14 = v55(v9, 1, v13);
  sub_1000867E8((uint64_t)v9);
  if (v14 == 1 || sub_1000E0218(0, a1))
  {
    uint64_t v15 = _swiftEmptyArrayStorage;
  }
  else
  {
    uint64_t v15 = sub_10005E998(0, 1, 1, _swiftEmptyArrayStorage);
    unint64_t v17 = v15[2];
    unint64_t v16 = v15[3];
    if (v17 >= v16 >> 1) {
      uint64_t v15 = sub_10005E998((void *)(v16 > 1), v17 + 1, 1, v15);
    }
    v15[2] = v17 + 1;
    *((unsigned char *)v15 + v17 + 32) = 0;
  }
  uint64_t v18 = v2[7];
  uint64_t v19 = v2[8];
  sub_100010740(v10, v18);
  (*(void (**)(uint64_t, uint64_t))(v19 + 16))(v18, v19);
  uint64_t v21 = v20;
  swift_bridgeObjectRelease();
  if (v21 && !sub_1000E0218(1u, a1))
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v15 = sub_10005E998(0, v15[2] + 1, 1, v15);
    }
    unint64_t v23 = v15[2];
    unint64_t v22 = v15[3];
    if (v23 >= v22 >> 1) {
      uint64_t v15 = sub_10005E998((void *)(v22 > 1), v23 + 1, 1, v15);
    }
    v15[2] = v23 + 1;
    *((unsigned char *)v15 + v23 + 32) = 1;
  }
  uint64_t v24 = v2[7];
  uint64_t v25 = v2[8];
  sub_100010740(v10, v24);
  (*(void (**)(uint64_t, uint64_t))(v25 + 40))(v24, v25);
  uint64_t v27 = v26;
  swift_bridgeObjectRelease();
  if (v27 && !sub_1000E0218(2u, a1))
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v15 = sub_10005E998(0, v15[2] + 1, 1, v15);
    }
    unint64_t v29 = v15[2];
    unint64_t v28 = v15[3];
    if (v29 >= v28 >> 1) {
      uint64_t v15 = sub_10005E998((void *)(v28 > 1), v29 + 1, 1, v15);
    }
    v15[2] = v29 + 1;
    *((unsigned char *)v15 + v29 + 32) = 2;
  }
  uint64_t v30 = v2[7];
  uint64_t v31 = v2[8];
  sub_100010740(v10, v30);
  (*(void (**)(uint64_t, uint64_t))(v31 + 48))(v30, v31);
  uint64_t v33 = v32;
  swift_bridgeObjectRelease();
  if (v33 && !sub_1000E0218(3u, a1))
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v15 = sub_10005E998(0, v15[2] + 1, 1, v15);
    }
    unint64_t v35 = v15[2];
    unint64_t v34 = v15[3];
    if (v35 >= v34 >> 1) {
      uint64_t v15 = sub_10005E998((void *)(v34 > 1), v35 + 1, 1, v15);
    }
    v15[2] = v35 + 1;
    *((unsigned char *)v15 + v35 + 32) = 3;
  }
  uint64_t v36 = v2[7];
  uint64_t v37 = v2[8];
  sub_100010740(v10, v36);
  (*(void (**)(uint64_t, uint64_t))(v37 + 24))(v36, v37);
  int v38 = v55(v7, 1, v13);
  sub_1000867E8((uint64_t)v7);
  if (v38 != 1 && !sub_1000E0218(4u, a1))
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v15 = sub_10005E998(0, v15[2] + 1, 1, v15);
    }
    unint64_t v40 = v15[2];
    unint64_t v39 = v15[3];
    if (v40 >= v39 >> 1) {
      uint64_t v15 = sub_10005E998((void *)(v39 > 1), v40 + 1, 1, v15);
    }
    v15[2] = v40 + 1;
    *((unsigned char *)v15 + v40 + 32) = 4;
  }
  uint64_t v41 = v2[7];
  uint64_t v42 = v2[8];
  sub_100010740(v10, v41);
  (*(void (**)(uint64_t, uint64_t))(v42 + 64))(v41, v42);
  uint64_t v44 = v43;
  swift_bridgeObjectRelease();
  if (v44 && !sub_1000E0218(5u, a1))
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v15 = sub_10005E998(0, v15[2] + 1, 1, v15);
    }
    unint64_t v46 = v15[2];
    unint64_t v45 = v15[3];
    if (v46 >= v45 >> 1) {
      uint64_t v15 = sub_10005E998((void *)(v45 > 1), v46 + 1, 1, v15);
    }
    v15[2] = v46 + 1;
    *((unsigned char *)v15 + v46 + 32) = 5;
  }
  uint64_t v48 = v2[7];
  uint64_t v47 = v2[8];
  sub_100010740(v10, v48);
  (*(void (**)(uint64_t, uint64_t))(v47 + 56))(v48, v47);
  uint64_t v50 = v49;
  swift_bridgeObjectRelease();
  if (v50 && !sub_1000E0218(6u, a1))
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v15 = sub_10005E998(0, v15[2] + 1, 1, v15);
    }
    unint64_t v52 = v15[2];
    unint64_t v51 = v15[3];
    if (v52 >= v51 >> 1) {
      uint64_t v15 = sub_10005E998((void *)(v51 > 1), v52 + 1, 1, v15);
    }
    v15[2] = v52 + 1;
    *((unsigned char *)v15 + v52 + 32) = 6;
  }
  return v15;
}

uint64_t destroy for SongMetadataViewModel(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  _s16MusicRecognition11AnyPlaylistVwxx_0(a1 + 32);

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SongMetadataViewModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v5 = a2 + 32;
  long long v6 = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 56) = v6;
  uint64_t v7 = v6;
  uint64_t v8 = **(void (***)(uint64_t, uint64_t, uint64_t))(v6 - 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v8(a1 + 32, v5, v7);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SongMetadataViewModel(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_100018AC4((uint64_t *)(a1 + 32), (uint64_t *)(a2 + 32));
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for SongMetadataViewModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  _s16MusicRecognition11AnyPlaylistVwxx_0(a1 + 32);
  long long v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  uint64_t v6 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for SongMetadataViewModel()
{
  return &type metadata for SongMetadataViewModel;
}

void sub_1000E7020()
{
  swift_checkMetadataState();
  if (v0 <= 0x3F)
  {
    sub_10008FB14();
    if (v1 <= 0x3F) {
      swift_initClassMetadata2();
    }
  }
}

uint64_t sub_1000E7108()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1000E71BC()
{
  return static Published.subscript.setter();
}

uint64_t sub_1000E7274@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for MusicPlayer.Queue.Entry();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  long long v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000060EC(&qword_10015B428);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000060EC(&qword_10015B430);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  dispatch thunk of SystemMusicPlayer.queue.getter();
  dispatch thunk of MusicPlayer.Queue.currentEntry.getter();
  swift_release();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2))
  {
    uint64_t v12 = &qword_10015B428;
    uint64_t v13 = (uint64_t)v8;
LABEL_5:
    uint64_t result = sub_1000063D0(v13, v12);
    *(void *)(a1 + 32) = 0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    return result;
  }
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v5, v8, v2);
  sub_1000063D0((uint64_t)v8, &qword_10015B428);
  MusicPlayer.Queue.Entry.item.getter();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v14 = type metadata accessor for MusicPlayer.Queue.Entry.Item();
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v11, 1, v14) == 1)
  {
    uint64_t v12 = &qword_10015B430;
    uint64_t v13 = (uint64_t)v11;
    goto LABEL_5;
  }
  *(void *)(a1 + 24) = v14;
  *(void *)(a1 + 32) = &protocol witness table for MusicPlayer.Queue.Entry.Item;
  unint64_t v17 = sub_100057938((uint64_t *)a1);
  return (*(uint64_t (**)(uint64_t *, char *, uint64_t))(v15 + 32))(v17, v11, v14);
}

uint64_t sub_1000E751C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)v0;
  uint64_t v3 = type metadata accessor for MusicPlayer.PlaybackStatus();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v21[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000E7274((uint64_t)v21);
  if (v22)
  {
    sub_100010740(v21, v22);
    uint64_t v7 = dispatch thunk of MusicItem.id.getter();
    uint64_t v9 = v8;
    _s16MusicRecognition11AnyPlaylistVwxx_0((uint64_t)v21);
  }
  else
  {
    sub_1000063D0((uint64_t)v21, &qword_10015CCD0);
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  uint64_t v10 = v0 + *(void *)(*(void *)v0 + 104);
  uint64_t v11 = *(void *)(v2 + 80);
  uint64_t v12 = *(void *)(v2 + 88);
  uint64_t v13 = dispatch thunk of MusicItem.id.getter();
  if (!v9)
  {
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  if (v7 == v13 && v9 == v14)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  char v16 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v16 & 1) == 0)
  {
LABEL_12:
    sub_1000060EC(&qword_10015CCD8);
    uint64_t v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_100110670;
    *(void *)(v17 + 56) = v11;
    *(void *)(v17 + 64) = v12;
    uint64_t v18 = sub_100057938((uint64_t *)(v17 + 32));
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v18, v10, v11);
    type metadata accessor for MusicPlayer.Queue();
    dispatch thunk of MusicPlayer.Queue.__allocating_init(arrayLiteral:)();
    dispatch thunk of SystemMusicPlayer.queue.setter();
    return sub_1000E7878(v1);
  }
LABEL_15:
  MusicPlayer.state.getter();
  dispatch thunk of MusicPlayer.State.playbackStatus.getter();
  swift_release();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v6, v3);
  if (result == enum case for MusicPlayer.PlaybackStatus.stopped(_:)) {
    return result;
  }
  if (result == enum case for MusicPlayer.PlaybackStatus.playing(_:)) {
    return dispatch thunk of MusicPlayer.pause()();
  }
  if (result == enum case for MusicPlayer.PlaybackStatus.paused(_:)) {
    return sub_1000E7878(v1);
  }
  if (result == enum case for MusicPlayer.PlaybackStatus.interrupted(_:)) {
    return dispatch thunk of MusicPlayer.pause()();
  }
  if (result != enum case for MusicPlayer.PlaybackStatus.seekingForward(_:)
    && result != enum case for MusicPlayer.PlaybackStatus.seekingBackward(_:))
  {
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  return result;
}

uint64_t sub_1000E7878(uint64_t a1)
{
  uint64_t v2 = sub_1000060EC(&qword_100157038);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  type metadata accessor for MainActor();
  swift_retain();
  uint64_t v6 = static MainActor.shared.getter();
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = v6;
  v7[3] = &protocol witness table for MainActor;
  v7[4] = a1;
  sub_1000DC37C((uint64_t)v4, (uint64_t)&unk_10015CCE8, (uint64_t)v7);
  return swift_release();
}

uint64_t sub_1000E7990(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[3] = a4;
  type metadata accessor for MainActor();
  v4[4] = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  v4[5] = v6;
  v4[6] = v5;
  return _swift_task_switch(sub_1000E7A28, v6, v5);
}

uint64_t sub_1000E7A28()
{
  uint64_t v3 = (uint64_t (*)(void))((char *)&async function pointer to dispatch thunk of MusicPlayer.play()
                         + async function pointer to dispatch thunk of MusicPlayer.play());
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v1;
  void *v1 = v0;
  v1[1] = sub_1000E7AE4;
  return v3();
}

uint64_t sub_1000E7AE4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 64) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 48);
  uint64_t v4 = *(void *)(v2 + 40);
  if (v0) {
    uint64_t v5 = sub_1000E7C20;
  }
  else {
    uint64_t v5 = sub_10005CA8C;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_1000E7C20()
{
  swift_release();
  if (qword_100156018 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_10000E808(v1, (uint64_t)qword_100164B38);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 138412290;
    swift_errorRetain();
    uint64_t v6 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 16) = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v5 = v6;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Error playing: %@", v4, 0xCu);
    sub_1000060EC((uint64_t *)&unk_1001570F0);
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
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t *sub_1000E7E2C()
{
  uint64_t v1 = *v0;
  swift_release();
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + 80) - 8) + 8))((uint64_t)v0 + *(void *)(*v0 + 104));
  swift_release();
  uint64_t v2 = (uint64_t)v0 + *(void *)(*v0 + 120);
  uint64_t v3 = sub_1000060EC(&qword_10015A528);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  return v0;
}

uint64_t sub_1000E7F1C()
{
  sub_1000E7E2C();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t type metadata accessor for SongPreviewAppleMusicPlaybackController()
{
  return sub_100020608();
}

uint64_t sub_1000E7F8C()
{
  return sub_1000E7108();
}

uint64_t sub_1000E7FB0()
{
  return sub_1000E751C();
}

uint64_t sub_1000E7FD4()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000E8014(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100014D10;
  return sub_1000E7990(a1, v4, v5, v6);
}

uint64_t sub_1000E80C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000E7108();
  *a1 = result;
  return result;
}

uint64_t sub_1000E80F4()
{
  return sub_1000E71BC();
}

uint64_t sub_1000E8120@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000E7108();
  *a1 = result;
  return result;
}

uint64_t sub_1000E814C()
{
  return sub_1000E71BC();
}

uint64_t sub_1000E8178()
{
  return 16;
}

__n128 sub_1000E8184(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

double sub_1000E8190()
{
  return 0.0;
}

uint64_t sub_1000E8198()
{
  uint64_t v59 = type metadata accessor for _AssistantIntent.PhraseToken();
  uint64_t v0 = *(void *)(v59 - 8);
  __chkstk_darwin(v59);
  uint64_t v2 = (char *)&v42 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000060EC(&qword_10015CD00);
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v50 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v6 = sub_1000060EC(&qword_10015CD08);
  uint64_t v53 = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001D3BC();
  _AssistantIntent.Phrase.init(stringLiteral:)();
  uint64_t v51 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v7 + 8);
  v10(v9, v6);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v11._uint64_t countAndFlagsBits = 0xD000000000000015;
  v11._object = (void *)0x800000010011B680;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v11);
  unsigned int v58 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  char v55 = *(void (**)(char *))(v0 + 104);
  uint64_t v57 = v0 + 104;
  uint64_t v12 = v59;
  v55(v2);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)();
  uint64_t v13 = *(void (**)(char *, uint64_t))(v0 + 8);
  uint64_t v54 = v0 + 8;
  uint64_t v56 = v13;
  v13(v2, v12);
  v14._uint64_t countAndFlagsBits = 0;
  v14._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v14);
  _AssistantIntent.Phrase.init(stringInterpolation:)();
  uint64_t v49 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
  uint64_t v15 = v53;
  uint64_t v42 = v10;
  uint64_t v52 = v7 + 8;
  v10(v9, v53);
  _AssistantIntent.Phrase.init(stringLiteral:)();
  uint64_t v48 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
  uint64_t v16 = v15;
  v10(v9, v15);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v17._uint64_t countAndFlagsBits = 0xD000000000000014;
  v17._object = (void *)0x800000010011B6A0;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v17);
  uint64_t v43 = v2;
  uint64_t v18 = v59;
  uint64_t v19 = v55;
  ((void (*)(char *, void, uint64_t))v55)(v2, v58, v59);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)();
  v56(v2, v18);
  v20._uint64_t countAndFlagsBits = 0;
  v20._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v20);
  _AssistantIntent.Phrase.init(stringInterpolation:)();
  uint64_t v47 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
  uint64_t v21 = v16;
  uint64_t v22 = v16;
  unint64_t v23 = v42;
  v42(v9, v22);
  _AssistantIntent.Phrase.init(stringLiteral:)();
  uint64_t v46 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
  v23(v9, v21);
  uint64_t v24 = v23;
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v25._object = (void *)0x800000010011B6C0;
  v25._uint64_t countAndFlagsBits = 0xD000000000000011;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v25);
  uint64_t v26 = v43;
  uint64_t v27 = v59;
  ((void (*)(char *, void, uint64_t))v19)(v43, v58, v59);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)();
  v56(v26, v27);
  v28._uint64_t countAndFlagsBits = 0;
  v28._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v28);
  _AssistantIntent.Phrase.init(stringInterpolation:)();
  uint64_t v45 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
  uint64_t v29 = v53;
  v23(v9, v53);
  _AssistantIntent.Phrase.init(stringLiteral:)();
  uint64_t v44 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
  v23(v9, v29);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v30._uint64_t countAndFlagsBits = 0;
  v30._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v30);
  uint64_t v31 = v59;
  ((void (*)(char *, void, uint64_t))v55)(v26, v58, v59);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)();
  v56(v26, v31);
  v32._uint64_t countAndFlagsBits = 0x7369687420;
  v32._object = (void *)0xE500000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v32);
  _AssistantIntent.Phrase.init(stringInterpolation:)();
  uint64_t v33 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
  v23(v9, v29);
  _AssistantIntent.Phrase.init(stringLiteral:)();
  uint64_t v34 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
  v23(v9, v29);
  _AssistantIntent.Phrase.init(stringLiteral:)();
  uint64_t v35 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
  v24(v9, v29);
  sub_1000060EC(&qword_10015CD10);
  uint64_t v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = xmmword_100116250;
  uint64_t v37 = v49;
  *(void *)(v36 + 32) = v51;
  *(void *)(v36 + 40) = v37;
  uint64_t v38 = v47;
  *(void *)(v36 + 48) = v48;
  *(void *)(v36 + 56) = v38;
  uint64_t v39 = v45;
  *(void *)(v36 + 64) = v46;
  *(void *)(v36 + 72) = v39;
  *(void *)(v36 + 80) = v44;
  *(void *)(v36 + 88) = v33;
  *(void *)(v36 + 96) = v34;
  *(void *)(v36 + 104) = v35;
  uint64_t v40 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease();
  return v40;
}

void sub_1000E8980()
{
  qword_100164ED0 = (uint64_t)&_swiftEmptyArrayStorage;
}

uint64_t sub_1000E8994()
{
  uint64_t v0 = type metadata accessor for _AssistantIntent();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9[0] = sub_100025840();
  v9[1] = v4;
  sub_10001D3BC();
  _AssistantIntent.init<A>(_:phrases:parameterValues:)();
  uint64_t v5 = static _AssistantIntent.Builder.buildExpression(_:)();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_1000060EC(&qword_10015CCF8);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_100110670;
  *(void *)(v6 + 32) = v5;
  uint64_t v7 = static _AssistantIntent.Builder.buildBlock(_:)();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_1000E8AF4()
{
  if (qword_100156580 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

ValueMetadata *type metadata accessor for MusicRecognitonIntents()
{
  return &type metadata for MusicRecognitonIntents;
}

unint64_t sub_1000E8B60(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000060EC(&qword_10015CDA8);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
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
    unint64_t result = sub_1000CA380(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    Swift::String v11 = (uint64_t *)(v2[6] + 16 * result);
    *Swift::String v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    *uint64_t v12 = v8;
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

unint64_t sub_1000E8C84(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000060EC(&qword_10015BAF0);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
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
    sub_100009C94(v6, (uint64_t)&v15, &qword_10015CDB0);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_1000CA380(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    Swift::String v11 = (uint64_t *)(v3[6] + 16 * result);
    *Swift::String v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_1000C1438(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_1000E8DBC(uint64_t a1)
{
  uint64_t v2 = sub_1000060EC(&qword_100159360);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (void *)((char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000060EC(&qword_100159368);
  uint64_t v6 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = (char *)v5 + *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v25[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_100009C94(v12, (uint64_t)v5, &qword_100159360);
    uint64_t v14 = *v5;
    uint64_t v15 = v5[1];
    unint64_t result = sub_1000CA380(*v5, v15);
    if (v17) {
      break;
    }
    unint64_t v18 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v19 = (uint64_t *)(v7[6] + 16 * result);
    *uint64_t v19 = v14;
    v19[1] = v15;
    uint64_t v20 = v7[7];
    uint64_t v21 = type metadata accessor for Playlist();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v20 + *(void *)(*(void *)(v21 - 8) + 72) * v18, v9, v21);
    uint64_t v22 = v7[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23) {
      goto LABEL_11;
    }
    v7[2] = v24;
    v12 += v13;
    if (!--v8)
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

unint64_t sub_1000E8FBC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000060EC(&qword_10015CDB8);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_1000CA380(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    unint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *unint64_t v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
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

unint64_t sub_1000E90D8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000060EC(&qword_10015CD98);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
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
    sub_100009C94(v6, (uint64_t)&v13, &qword_10015CDA0);
    uint64_t v7 = v13;
    unint64_t result = sub_1000CA490(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_1000C1438(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
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

id sub_1000E9208(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = self;
  id v5 = [v4 mainBundle];
  v20._object = (void *)0xE000000000000000;
  v6._object = (void *)0x800000010011AD50;
  v6._uint64_t countAndFlagsBits = 0xD00000000000001ELL;
  v7._uint64_t countAndFlagsBits = 0;
  v7._object = (void *)0xE000000000000000;
  v20._uint64_t countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v6, (Swift::String_optional)0, (NSBundle)v5, v7, v20);

  if (a1)
  {
    swift_errorRetain();
    sub_1000060EC(&qword_1001577C8);
    sub_1000150F8(0, (unint64_t *)&qword_100159978);
    if (swift_dynamicCast())
    {
      uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v10 = v9;
      uint64_t v11 = sub_100075DC8((uint64_t)&off_100148F70);
      uint64_t v12 = (void *)sub_1000DFF5C(v8, v10, v11);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v12)
      {
        swift_bridgeObjectRelease();

        id v13 = [v4 mainBundle];
        v14._uint64_t countAndFlagsBits = 0xD000000000000023;
        v21._object = (void *)0xE000000000000000;
        v14._object = (void *)0x800000010011ADA0;
        v15._uint64_t countAndFlagsBits = 0;
        v15._object = (void *)0xE000000000000000;
        v21._uint64_t countAndFlagsBits = 0;
        NSLocalizedString(_:tableName:bundle:value:comment:)(v14, (Swift::String_optional)0, (NSBundle)v13, v15, v21);
      }
    }
  }
  uint64_t v16 = *(void **)(v2 + OBJC_IVAR____TtC16MusicRecognition18AmbientNoMatchView_titleLabel);
  NSString v17 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v16 setText:v17];

  return [v16 setNeedsDisplay];
}

id sub_1000E942C()
{
  id result = [objc_allocWithZone((Class)UIColor) initWithRed:0.470588235 green:0.470588235 blue:0.501960784 alpha:0.36];
  qword_10015CD18 = (uint64_t)result;
  return result;
}

id sub_1000E9484(double a1, double a2, double a3, double a4)
{
  id v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v11 = OBJC_IVAR____TtC16MusicRecognition18AmbientNoMatchView_retryButton;
  id v12 = objc_allocWithZone((Class)UIButton);
  id v13 = v4;
  *(void *)&v5[v11] = [v12 initWithFrame:0.0, 0.0, 0.0, 0.0];
  uint64_t v14 = OBJC_IVAR____TtC16MusicRecognition18AmbientNoMatchView_titleLabel;
  *(void *)&v13[v14] = [objc_allocWithZone((Class)UILabel) initWithFrame:0.0, 0.0, 0.0, 0.0];
  uint64_t v15 = OBJC_IVAR____TtC16MusicRecognition18AmbientNoMatchView_stackView;
  *(void *)&v13[v15] = [objc_allocWithZone((Class)UIStackView) initWithFrame:0.0, 0.0, 0.0, 0.0];

  v18.receiver = v13;
  v18.super_class = ObjectType;
  [super initWithFrame:a1, a2, a3, a4];
  sub_1000E95C4();

  return v16;
}

uint64_t sub_1000E95C4()
{
  uint64_t v1 = sub_1000060EC(&qword_10015AC50);
  __chkstk_darwin(v1 - 8);
  uint64_t v71 = (char *)&v61 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000060EC(&qword_10015CD60);
  __chkstk_darwin(v3 - 8);
  long long v70 = (char *)&v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = type metadata accessor for AttributeContainer();
  uint64_t v68 = *(void *)(v69 - 8);
  __chkstk_darwin(v69);
  long long v67 = (char *)&v61 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = type metadata accessor for AttributedString.FormattingOptions();
  __chkstk_darwin(v65);
  uint64_t v64 = (char *)&v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000060EC(&qword_10015CD68);
  __chkstk_darwin(v7 - 8);
  int v61 = (char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v9 - 8);
  uint64_t v73 = type metadata accessor for AttributedString();
  uint64_t v66 = *(void *)(v73 - 8);
  __chkstk_darwin(v73);
  BOOL v76 = (char *)&v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for UIButton.Configuration.CornerStyle();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v61 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for UIButton.Configuration();
  uint64_t v74 = *(void *)(v15 - 8);
  uint64_t v75 = v15;
  __chkstk_darwin(v15);
  NSString v17 = (char *)&v61 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  [v0 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v18 = *(void **)&v0[OBJC_IVAR____TtC16MusicRecognition18AmbientNoMatchView_stackView];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v0 addSubview:v18];
  uint64_t v19 = *(void **)&v0[OBJC_IVAR____TtC16MusicRecognition18AmbientNoMatchView_titleLabel];
  [v18 addArrangedSubview:v19];
  id v72 = v0;
  Swift::String v20 = *(void **)&v0[OBJC_IVAR____TtC16MusicRecognition18AmbientNoMatchView_retryButton];
  [v18 addArrangedSubview:v20];
  [v18 setCustomSpacing:v19 afterView:21.0];
  [v18 setAxis:1];
  [v18 setDistribution:0];
  [v18 setAlignment:3];
  uint64_t v62 = v20;
  [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
  static UIButton.Configuration.filled()();
  id v63 = self;
  id v21 = [v63 whiteColor];
  UIButton.Configuration.baseForegroundColor.setter();
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, enum case for UIButton.Configuration.CornerStyle.capsule(_:), v11);
  UIButton.Configuration.cornerStyle.setter();
  if (qword_100156588 != -1) {
    swift_once();
  }
  id v22 = (id)qword_10015CD18;
  UIButton.Configuration.baseBackgroundColor.setter();
  String.LocalizationValue.init(stringLiteral:)();
  uint64_t v23 = type metadata accessor for Locale();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v61, 1, 1, v23);
  uint64_t v77 = _swiftEmptyArrayStorage;
  sub_1000EA3AC();
  sub_1000060EC(&qword_10015CD78);
  sub_1000EA404();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  uint64_t v24 = v76;
  AttributedString.init(localized:options:table:bundle:locale:comment:)();
  sub_1000060EC(&qword_10015CD88);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100110670;
  *(void *)(inited + 32) = NSFontAttributeName;
  uint64_t v26 = self;
  uint64_t v27 = NSFontAttributeName;
  id v28 = [v26 systemFontOfSize:34.0 weight:UIFontWeightSemibold];
  *(void *)(inited + 64) = sub_1000150F8(0, &qword_10015CD90);
  *(void *)(inited + 40) = v28;
  sub_1000E90D8(inited);
  uint64_t v29 = v67;
  AttributeContainer.init(_:)();
  AttributedString.setAttributes(_:)();
  (*(void (**)(char *, uint64_t))(v68 + 8))(v29, v69);
  uint64_t v30 = v66;
  uint64_t v31 = v70;
  uint64_t v32 = v73;
  (*(void (**)(char *, char *, uint64_t))(v66 + 16))(v70, v24, v73);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v31, 0, 1, v32);
  UIButton.Configuration.attributedTitle.setter();
  uint64_t v34 = v74;
  uint64_t v33 = v75;
  uint64_t v35 = v71;
  (*(void (**)(char *, char *, uint64_t))(v74 + 16))(v71, v17, v75);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v35, 0, 1, v33);
  uint64_t v36 = v62;
  UIButton.configuration.setter();
  if (qword_1001563C0 != -1) {
    swift_once();
  }
  uint64_t v71 = v17;
  NSString v37 = String._bridgeToObjectiveC()();
  [v36 setAccessibilityIdentifier:v37];

  [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v38 = [v26 systemFontOfSize:62.0 weight:UIFontWeightSemibold];
  [v19 setFont:v38];

  id v39 = [v63 whiteColor];
  [v19 setTextColor:v39];

  id v40 = [self mainBundle];
  v78._object = (void *)0xE000000000000000;
  v41._object = (void *)0x800000010011AD50;
  v41._uint64_t countAndFlagsBits = 0xD00000000000001ELL;
  v42._uint64_t countAndFlagsBits = 0;
  v42._object = (void *)0xE000000000000000;
  v78._uint64_t countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v41, (Swift::String_optional)0, (NSBundle)v40, v42, v78);

  NSString v43 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v19 setText:v43];

  uint64_t v44 = v36;
  if (qword_1001563B8 != -1) {
    swift_once();
  }
  NSString v45 = String._bridgeToObjectiveC()();
  [v19 setAccessibilityIdentifier:v45];

  uint64_t v46 = self;
  sub_1000060EC(&qword_100157030);
  uint64_t v47 = swift_allocObject();
  *(_OWORD *)(v47 + 16) = xmmword_100110690;
  id v48 = [v18 centerXAnchor];
  id v49 = v72;
  id v50 = [v72 centerXAnchor];
  id v51 = [v48 constraintEqualToAnchor:v50];

  *(void *)(v47 + 32) = v51;
  id v52 = [v18 centerYAnchor];
  id v53 = [v49 centerYAnchor];
  id v54 = [v52 constraintEqualToAnchor:v53 constant:-13.0];

  *(void *)(v47 + 40) = v54;
  id v55 = [v44 heightAnchor];
  id v56 = [v55 constraintEqualToConstant:76.0];

  *(void *)(v47 + 48) = v56;
  id v57 = [v44 widthAnchor];
  id v58 = [v57 constraintEqualToConstant:234.0];

  *(void *)(v47 + 56) = v58;
  uint64_t v77 = (void *)v47;
  specialized Array._endMutation()();
  sub_1000150F8(0, (unint64_t *)&qword_100157AD0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v46 activateConstraints:isa];

  (*(void (**)(char *, uint64_t))(v30 + 8))(v76, v73);
  return (*(uint64_t (**)(char *, uint64_t))(v74 + 8))(v71, v75);
}

id sub_1000EA1D4(void *a1)
{
  uint64_t v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = OBJC_IVAR____TtC16MusicRecognition18AmbientNoMatchView_retryButton;
  id v6 = objc_allocWithZone((Class)UIButton);
  uint64_t v7 = v2;
  *(void *)&v2[v5] = [v6 initWithFrame:0.0, 0.0, 0.0, 0.0];
  uint64_t v8 = OBJC_IVAR____TtC16MusicRecognition18AmbientNoMatchView_titleLabel;
  *(void *)&v7[v8] = [objc_allocWithZone((Class)UILabel) initWithFrame:0.0, 0.0, 0.0, 0.0];
  uint64_t v9 = OBJC_IVAR____TtC16MusicRecognition18AmbientNoMatchView_stackView;
  *(void *)&v7[v9] = [objc_allocWithZone((Class)UIStackView) initWithFrame:0.0, 0.0, 0.0, 0.0];

  v14.receiver = v7;
  v14.super_class = ObjectType;
  id v10 = [super initWithCoder:a1];
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
    sub_1000E95C4();
  }
  return v11;
}

uint64_t type metadata accessor for AmbientNoMatchView()
{
  return self;
}

unint64_t sub_1000EA3AC()
{
  unint64_t result = qword_10015CD70;
  if (!qword_10015CD70)
  {
    type metadata accessor for AttributedString.FormattingOptions();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015CD70);
  }
  return result;
}

unint64_t sub_1000EA404()
{
  unint64_t result = qword_10015CD80;
  if (!qword_10015CD80)
  {
    sub_100006224(&qword_10015CD78);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015CD80);
  }
  return result;
}

ValueMetadata *type metadata accessor for SongPlaybackView()
{
  return &type metadata for SongPlaybackView;
}

uint64_t sub_1000EA470()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_1000EA48C()
{
  qword_10015CDC0 = 3028656112;
  *(void *)algn_10015CDC8 = 0xA400000000000000;
}

uint64_t sub_1000EA4A8()
{
  uint64_t result = static Font.title3.getter();
  qword_10015CDD0 = result;
  return result;
}

uint64_t sub_1000EA4C8()
{
  uint64_t result = static Font.Weight.regular.getter();
  qword_10015CDD8 = v1;
  return result;
}

uint64_t sub_1000EA4E8()
{
  uint64_t result = static Font.title.getter();
  qword_10015CDE0 = result;
  return result;
}

uint64_t sub_1000EA508()
{
  id v0 = [self tertiaryLabelColor];
  uint64_t result = Color.init(uiColor:)();
  qword_10015CDE8 = result;
  return result;
}

uint64_t sub_1000EA548@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  long long v101 = a2;
  uint64_t v98 = type metadata accessor for Image.Scale();
  uint64_t v97 = *(void *)(v98 - 8);
  __chkstk_darwin(v98);
  char v96 = (char *)&v85 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = type metadata accessor for Text.Suffix();
  uint64_t v87 = *(void *)(v88 - 8);
  __chkstk_darwin(v88);
  int v86 = (char *)&v85 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v95 = sub_1000060EC(&qword_10015CDF8);
  uint64_t v94 = *(void *)(v95 - 8);
  __chkstk_darwin(v95);
  uint64_t v92 = (char *)&v85 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = sub_1000060EC(&qword_10015CE00);
  __chkstk_darwin(v93);
  uint64_t v7 = (char *)&v85 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = sub_1000060EC(&qword_10015CE08);
  uint64_t v100 = *(void *)(v104 - 8);
  uint64_t v8 = __chkstk_darwin(v104);
  long long v99 = (char *)&v85 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v91 = (char *)&v85 - v11;
  __chkstk_darwin(v10);
  long long v103 = (char *)&v85 - v12;
  uint64_t v89 = *(void *)a1;
  uint64_t v90 = *(void *)(a1 + 8);
  uint64_t v13 = *(void *)(a1 + 24);
  char v14 = *(unsigned char *)(a1 + 32);
  uint64_t v107 = *(void *)(a1 + 16);
  uint64_t v108 = v13;
  unint64_t v15 = sub_10000E0F0();
  swift_bridgeObjectRetain();
  unint64_t v102 = v15;
  uint64_t v16 = Text.init<A>(_:)();
  uint64_t v18 = v17;
  char v20 = v19;
  if (qword_1001565A8 != -1) {
    swift_once();
  }
  uint64_t v21 = Text.font(_:)();
  uint64_t v23 = v22;
  char v25 = v24;
  uint64_t v27 = v26;
  sub_10000E904(v16, v18, v20 & 1);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v107 = v21;
  uint64_t v108 = v23;
  char v109 = v25 & 1;
  uint64_t v110 = v27;
  uint64_t v111 = KeyPath;
  uint64_t v112 = 3;
  char v113 = 0;
  if (v14)
  {
    if (qword_100156590 != -1) {
      swift_once();
    }
    uint64_t v105 = qword_10015CDC0;
    uint64_t v106 = *(void *)algn_10015CDC8;
    swift_bridgeObjectRetain();
    uint64_t v30 = Text.init<A>(_:)();
    uint64_t v32 = v31;
    char v34 = v33;
    if (qword_1001565B0 != -1) {
      swift_once();
    }
    char v35 = v34 & 1;
    uint64_t v36 = Text.foregroundColor(_:)();
    uint64_t v38 = v37;
    char v40 = v39 & 1;
    sub_10000E904(v30, v32, v35);
    swift_bridgeObjectRelease();
    static Font.title2.getter();
    uint64_t v41 = Text.font(_:)();
    uint64_t v43 = v42;
    char v45 = v44;
    swift_release();
    sub_10000E904(v36, v38, v40);
    swift_bridgeObjectRelease();
    uint64_t v29 = v86;
    static Text.Suffix.alwaysVisible(_:)();
    sub_10000E904(v41, v43, v45 & 1);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v29 = v86;
    static Text.Suffix.none.getter();
  }
  uint64_t v46 = v104;
  sub_1000060EC(&qword_100157208);
  sub_100017828();
  uint64_t v47 = v92;
  View.textSuffix(_:)();
  (*(void (**)(char *, uint64_t))(v87 + 8))(v29, v88);
  sub_10000E904(v107, v108, v109);
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v48 = v97;
  id v49 = v96;
  uint64_t v50 = v98;
  (*(void (**)(char *, void, uint64_t))(v97 + 104))(v96, enum case for Image.Scale.small(_:), v98);
  uint64_t v51 = swift_getKeyPath();
  id v52 = (uint64_t *)&v7[*(int *)(v93 + 36)];
  uint64_t v53 = sub_1000060EC(&qword_10015CE10);
  (*(void (**)(char *, char *, uint64_t))(v48 + 16))((char *)v52 + *(int *)(v53 + 28), v49, v50);
  uint64_t *v52 = v51;
  uint64_t v54 = v94;
  uint64_t v55 = v95;
  (*(void (**)(char *, char *, uint64_t))(v94 + 16))(v7, v47, v95);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v49, v50);
  (*(void (**)(char *, uint64_t))(v54 + 8))(v47, v55);
  static Font.Weight.bold.getter();
  sub_1000EB0D4();
  id v56 = v91;
  View.fontWeight(_:)();
  sub_1000063D0((uint64_t)v7, &qword_10015CE00);
  uint64_t v57 = v100;
  (*(void (**)(char *, char *, uint64_t))(v100 + 32))(v103, v56, v46);
  uint64_t v107 = v89;
  uint64_t v108 = v90;
  swift_bridgeObjectRetain();
  uint64_t v58 = Text.init<A>(_:)();
  uint64_t v60 = v59;
  char v62 = v61;
  if (qword_100156598 != -1) {
    swift_once();
  }
  char v63 = v62 & 1;
  uint64_t v64 = Text.font(_:)();
  uint64_t v66 = v65;
  char v68 = v67;
  sub_10000E904(v58, v60, v63);
  swift_bridgeObjectRelease();
  if (qword_1001565A0 != -1) {
    swift_once();
  }
  char v69 = v68 & 1;
  uint64_t v98 = Text.fontWeight(_:)();
  uint64_t v71 = v70;
  unint64_t v102 = v72;
  char v74 = v73 & 1;
  sub_10000E904(v64, v66, v69);
  swift_bridgeObjectRelease();
  uint64_t v75 = swift_getKeyPath();
  BOOL v76 = *(void (**)(char *, char *, uint64_t))(v57 + 16);
  uint64_t v77 = v99;
  uint64_t v79 = v103;
  uint64_t v78 = v104;
  v76(v99, v103, v104);
  uint64_t v80 = v101;
  v76(v101, v77, v78);
  uint64_t v81 = &v80[*(int *)(sub_1000060EC(&qword_10015CE28) + 48)];
  uint64_t v82 = v98;
  *(void *)uint64_t v81 = v98;
  *((void *)v81 + 1) = v71;
  v81[16] = v74;
  *((void *)v81 + 3) = v102;
  *((void *)v81 + 4) = v75;
  *((void *)v81 + 5) = 2;
  v81[48] = 0;
  sub_10002FC24(v82, v71, v74);
  uint64_t v83 = *(void (**)(char *, uint64_t))(v57 + 8);
  swift_bridgeObjectRetain();
  swift_retain();
  v83(v79, v78);
  sub_10000E904(v82, v71, v74);
  swift_release();
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(char *, uint64_t))v83)(v77, v78);
}

uint64_t sub_1000EAEC8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1000060EC(&qword_100158C98);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v6 = *(_OWORD *)(v1 + 16);
  v11[0] = *(_OWORD *)v1;
  v11[1] = v6;
  char v12 = *(unsigned char *)(v1 + 32);
  *(void *)uint64_t v5 = static HorizontalAlignment.leading.getter();
  *((void *)v5 + 1) = 0x4014000000000000;
  v5[16] = 0;
  uint64_t v7 = sub_1000060EC(&qword_10015CDF0);
  sub_1000EA548((uint64_t)v11, &v5[*(int *)(v7 + 44)]);
  uint64_t v8 = static Alignment.leading.getter();
  sub_100043704(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, a1, 0.0, 1, 0.0, 1, v8, v9);
  return sub_1000063D0((uint64_t)v5, &qword_100158C98);
}

uint64_t sub_1000EAFE4()
{
  return EnvironmentValues.imageScale.getter();
}

uint64_t sub_1000EB008(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Image.Scale();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return EnvironmentValues.imageScale.setter();
}

unint64_t sub_1000EB0D4()
{
  unint64_t result = qword_10015CE18;
  if (!qword_10015CE18)
  {
    sub_100006224(&qword_10015CE00);
    sub_100006224(&qword_100157208);
    sub_100017828();
    swift_getOpaqueTypeConformance2();
    sub_100006480(&qword_10015CE20, &qword_10015CE10);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015CE18);
  }
  return result;
}

unint64_t sub_1000EB1AC()
{
  unint64_t result = qword_10015CE30;
  if (!qword_10015CE30)
  {
    sub_100006224(&qword_100158CA0);
    sub_100006480(qword_10015CE38, &qword_100158C98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015CE30);
  }
  return result;
}

uint64_t sub_1000EB260(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1000EB280(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)unint64_t result = (a2 - 1);
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
  *(unsigned char *)(result + 8) = v3;
  return result;
}

uint64_t type metadata accessor for WeakContainer()
{
  return sub_100020608();
}

uint64_t sub_1000EB2C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  uint64_t v22 = a6;
  uint64_t v20 = a7;
  uint64_t v21 = a5;
  uint64_t v18 = a1;
  uint64_t v19 = a3;
  uint64_t v9 = type metadata accessor for CoordinateSpace();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  char v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for SizeModifier();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (uint64_t *)((char *)&v18 - v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a2, v9);
  sub_10008DBA0(v18, (uint64_t)v12, v19, a4, v16);
  swift_retain();
  View.modifier<A>(_:)();
  return (*(uint64_t (**)(void *, uint64_t))(v14 + 8))(v16, v13);
}

uint64_t destroy for MusicRecognitionLifeCycle()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s16MusicRecognition25MusicRecognitionLifeCycleVwCP_0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for MusicRecognitionLifeCycle(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(unsigned char *)(a1 + 2) = *(unsigned char *)(a2 + 2);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for MusicRecognitionLifeCycle(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for MusicRecognitionLifeCycle()
{
  return &type metadata for MusicRecognitionLifeCycle;
}

uint64_t getEnumTagSinglePayload for MusicRecognitionLifeCycle.OriginType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for MusicRecognitionLifeCycle.OriginType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000EB6E0);
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

ValueMetadata *type metadata accessor for MusicRecognitionLifeCycle.OriginType()
{
  return &type metadata for MusicRecognitionLifeCycle.OriginType;
}

uint64_t sub_1000EB718()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_10000FC3C(v0, qword_10015CEC0);
  sub_10000E808(v0, (uint64_t)qword_10015CEC0);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_1000EB794(char a1)
{
  uint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x6973754D6E65706FLL;
      break;
    case 2:
      uint64_t result = 2036427888;
      break;
    case 3:
      uint64_t result = 0x7265764F6E65706FLL;
      break;
    case 4:
      uint64_t result = 0x726968546E65706FLL;
      break;
    case 5:
      uint64_t result = 0x7A6168536E65706FLL;
      break;
    case 6:
      uint64_t result = 0x64616F6C6E776F64;
      break;
    case 7:
      uint64_t result = 0x62694C6F54646461;
      break;
    case 8:
    case 18:
      return result;
    case 9:
      uint64_t result = 0x73616C436E65706FLL;
      break;
    case 10:
      uint64_t result = 0x616C506F54646461;
      break;
    case 11:
      unsigned int v3 = 1852141679;
      goto LABEL_18;
    case 12:
      uint64_t result = 0xD000000000000010;
      break;
    case 13:
      uint64_t result = 0x6C65636E6163;
      break;
    case 14:
      uint64_t result = 0x7972746572;
      break;
    case 15:
      uint64_t result = 0x7473694877656976;
      break;
    case 16:
      unsigned int v3 = 2003134838;
LABEL_18:
      uint64_t result = v3 | 0x6374614D00000000;
      break;
    case 17:
      uint64_t result = 0x74726F53706174;
      break;
    default:
      uint64_t result = 0x6572616873;
      break;
  }
  return result;
}

uint64_t sub_1000EB9F0(char a1)
{
  uint64_t result = 49;
  switch(a1)
  {
    case 1:
      uint64_t result = 51;
      break;
    case 2:
      uint64_t result = 52;
      break;
    case 3:
      uint64_t result = 53;
      break;
    case 4:
      uint64_t result = 54;
      break;
    case 5:
      uint64_t result = 55;
      break;
    case 6:
      uint64_t result = 56;
      break;
    case 7:
      uint64_t result = 57;
      break;
    case 8:
      uint64_t result = 12337;
      break;
    case 9:
      uint64_t result = 12849;
      break;
    case 10:
      uint64_t result = 13105;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1000EBAA8(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4)
{
  return sub_1000EBB7C(a1, a2, a3, a4, (uint64_t (*)(uint64_t))sub_1000EB794);
}

Swift::Int sub_1000EBAC0(uint64_t a1, uint64_t a2)
{
  return sub_1000EBC2C(a1, a2, (void (*)(uint64_t))sub_1000EB794);
}

uint64_t sub_1000EBAD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000EBCB0(a1, a2, a3, (void (*)(void))sub_1000EB794);
}

Swift::Int sub_1000EBAF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000EBD20(a1, a2, a3, (void (*)(uint64_t))sub_1000EB794);
}

uint64_t sub_1000EBB08@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1000EC980();
  *a1 = result;
  return result;
}

uint64_t sub_1000EBB38@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000EB794(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1000EBB64(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4)
{
  return sub_1000EBB7C(a1, a2, a3, a4, (uint64_t (*)(uint64_t))sub_1000EB9F0);
}

uint64_t sub_1000EBB7C(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  uint64_t v6 = *a2;
  uint64_t v7 = a5(*a1);
  uint64_t v9 = v8;
  if (v7 == a5(v6) && v9 == v10) {
    char v12 = 1;
  }
  else {
    char v12 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12 & 1;
}

Swift::Int sub_1000EBC14(uint64_t a1, uint64_t a2)
{
  return sub_1000EBC2C(a1, a2, (void (*)(uint64_t))sub_1000EB9F0);
}

Swift::Int sub_1000EBC2C(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v5 = *v3;
  Hasher.init(_seed:)();
  a3(v5);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t sub_1000EBC98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000EBCB0(a1, a2, a3, (void (*)(void))sub_1000EB9F0);
}

uint64_t sub_1000EBCB0(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  a4(*v4);
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000EBD08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000EBD20(a1, a2, a3, (void (*)(uint64_t))sub_1000EB9F0);
}

Swift::Int sub_1000EBD20(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v6 = *v4;
  Hasher.init(_seed:)();
  a4(v6);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

unint64_t sub_1000EBD88@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_1000EC9D4(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1000EBDB8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000EB9F0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_1000EBDE8()
{
  unint64_t result = qword_10015CED8;
  if (!qword_10015CED8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015CED8);
  }
  return result;
}

uint64_t sub_1000EBE3C(char a1)
{
  uint64_t result = 50;
  switch(a1)
  {
    case 1:
      uint64_t result = 51;
      break;
    case 2:
      uint64_t result = 53;
      break;
    case 3:
      uint64_t result = 55;
      break;
    case 4:
      uint64_t result = 56;
      break;
    case 5:
      uint64_t result = 57;
      break;
    case 6:
      uint64_t result = 12337;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1000EBEBC(char *a1, char *a2)
{
  return sub_1000C8EF8(*a1, *a2);
}

Swift::Int sub_1000EBEC8()
{
  return sub_1000C925C();
}

uint64_t sub_1000EBED4()
{
  return sub_1000C91A8();
}

Swift::Int sub_1000EBEDC()
{
  return sub_1000C925C();
}

unint64_t sub_1000EBEE4@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_1000ECE4C(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1000EBF14@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000EBE3C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t *sub_1000EBF40(uint64_t isStackAllocationSafe)
{
  int v2 = (unint64_t *)isStackAllocationSafe;
  char v3 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v4 = (unint64_t)((1 << v3) + 63) >> 6;
  size_t v5 = 8 * v4;
  if ((v3 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v5);
    uint64_t v6 = sub_1000EC2B8((unint64_t *)((char *)&v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0)), v4, (uint64_t)v2);
    if (v1) {
      swift_willThrow();
    }
    else {
      return v6;
    }
  }
  else
  {
    uint64_t v7 = (void *)swift_slowAlloc();
    bzero(v7, v5);
    int v2 = sub_1000EC2B8((unint64_t *)v7, v4, (uint64_t)v2);
    swift_slowDealloc();
  }
  return v2;
}

uint64_t sub_1000EC098(uint64_t a1)
{
  sub_1000060EC(&qword_10015CEE0);
  uint64_t result = static _DictionaryStorage.copy(original:)();
  char v3 = (void *)result;
  int64_t v4 = 0;
  uint64_t v27 = a1;
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v6 = a1 + 64;
  uint64_t v5 = v7;
  uint64_t v8 = 1 << *(unsigned char *)(v6 - 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & v5;
  uint64_t v24 = v6;
  int64_t v25 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v26 = result + 64;
  if ((v9 & v5) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v11 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (unint64_t i = v11 | (v4 << 6); ; unint64_t i = __clz(__rbit64(v14)) + (v4 << 6))
  {
    uint64_t v16 = (uint64_t *)(*(void *)(v27 + 48) + 16 * i);
    uint64_t v17 = *v16;
    uint64_t v18 = v16[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    NSString v19 = String._bridgeToObjectiveC()();
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)(v26 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    uint64_t v20 = (void *)(v3[6] + 16 * i);
    *uint64_t v20 = v17;
    v20[1] = v18;
    *(void *)(v3[7] + 8 * i) = v19;
    uint64_t v21 = v3[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v3[2] = v23;
    if (v10) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v13 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      goto LABEL_24;
    }
    if (v13 >= v25) {
      return (uint64_t)v3;
    }
    unint64_t v14 = *(void *)(v24 + 8 * v13);
    ++v4;
    if (!v14)
    {
      int64_t v4 = v13 + 1;
      if (v13 + 1 >= v25) {
        return (uint64_t)v3;
      }
      unint64_t v14 = *(void *)(v24 + 8 * v4);
      if (!v14)
      {
        int64_t v4 = v13 + 2;
        if (v13 + 2 >= v25) {
          return (uint64_t)v3;
        }
        unint64_t v14 = *(void *)(v24 + 8 * v4);
        if (!v14) {
          break;
        }
      }
    }
LABEL_18:
    unint64_t v10 = (v14 - 1) & v14;
  }
  int64_t v15 = v13 + 3;
  if (v15 >= v25) {
    return (uint64_t)v3;
  }
  unint64_t v14 = *(void *)(v24 + 8 * v15);
  if (v14)
  {
    int64_t v4 = v15;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v4 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v4 >= v25) {
      return (uint64_t)v3;
    }
    unint64_t v14 = *(void *)(v24 + 8 * v4);
    ++v15;
    if (v14) {
      goto LABEL_18;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

unint64_t *sub_1000EC2B8(unint64_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = 0;
  int64_t v5 = 0;
  uint64_t v6 = a3 + 64;
  uint64_t v7 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(a3 + 64);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  while (v9)
  {
    unint64_t v11 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    unint64_t v12 = v11 | (v5 << 6);
LABEL_5:
    int64_t v13 = (uint64_t *)(*(void *)(a3 + 56) + 16 * v12);
    uint64_t v15 = *v13;
    unint64_t v14 = v13[1];
    uint64_t v16 = v15 & 0xFFFFFFFFFFFFLL;
    if ((v14 & 0x2000000000000000) != 0) {
      uint64_t v17 = HIBYTE(v14) & 0xF;
    }
    else {
      uint64_t v17 = v16;
    }
    if (v17)
    {
      *(unint64_t *)((char *)result + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      if (__OFADD__(v4++, 1))
      {
        __break(1u);
        return (unint64_t *)sub_1000EC418(result, a2, v4, a3);
      }
    }
  }
  int64_t v18 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v18 >= v10) {
    return (unint64_t *)sub_1000EC418(result, a2, v4, a3);
  }
  unint64_t v19 = *(void *)(v6 + 8 * v18);
  ++v5;
  if (v19) {
    goto LABEL_23;
  }
  int64_t v5 = v18 + 1;
  if (v18 + 1 >= v10) {
    return (unint64_t *)sub_1000EC418(result, a2, v4, a3);
  }
  unint64_t v19 = *(void *)(v6 + 8 * v5);
  if (v19) {
    goto LABEL_23;
  }
  int64_t v5 = v18 + 2;
  if (v18 + 2 >= v10) {
    return (unint64_t *)sub_1000EC418(result, a2, v4, a3);
  }
  unint64_t v19 = *(void *)(v6 + 8 * v5);
  if (v19)
  {
LABEL_23:
    unint64_t v9 = (v19 - 1) & v19;
    unint64_t v12 = __clz(__rbit64(v19)) + (v5 << 6);
    goto LABEL_5;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v10) {
    return (unint64_t *)sub_1000EC418(result, a2, v4, a3);
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v5 = v20;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v5 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v5 >= v10) {
      return (unint64_t *)sub_1000EC418(result, a2, v4, a3);
    }
    unint64_t v19 = *(void *)(v6 + 8 * v5);
    ++v20;
    if (v19) {
      goto LABEL_23;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_1000EC418(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return (uint64_t)&_swiftEmptyDictionarySingleton;
  }
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  sub_1000060EC(&qword_10015CDA8);
  uint64_t result = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v9 = result;
  char v39 = a1;
  uint64_t v40 = a2;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 64;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      uint64_t v41 = v11;
      unint64_t v14 = v13 | (v11 << 6);
    }
    else
    {
      uint64_t v15 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_40;
      }
      if (v15 >= v40) {
        return v9;
      }
      unint64_t v16 = v39[v15];
      uint64_t v17 = v11 + 1;
      if (!v16)
      {
        uint64_t v17 = v11 + 2;
        if (v11 + 2 >= v40) {
          return v9;
        }
        unint64_t v16 = v39[v17];
        if (!v16)
        {
          uint64_t v17 = v11 + 3;
          if (v11 + 3 >= v40) {
            return v9;
          }
          unint64_t v16 = v39[v17];
          if (!v16)
          {
            uint64_t v18 = v11 + 4;
            if (v11 + 4 >= v40) {
              return v9;
            }
            unint64_t v16 = v39[v18];
            if (!v16)
            {
              while (1)
              {
                uint64_t v17 = v18 + 1;
                if (__OFADD__(v18, 1)) {
                  goto LABEL_41;
                }
                if (v17 >= v40) {
                  return v9;
                }
                unint64_t v16 = v39[v17];
                ++v18;
                if (v16) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v17 = v11 + 4;
          }
        }
      }
LABEL_24:
      unint64_t v10 = (v16 - 1) & v16;
      uint64_t v41 = v17;
      unint64_t v14 = __clz(__rbit64(v16)) + (v17 << 6);
    }
    uint64_t v19 = 16 * v14;
    uint64_t v20 = v4;
    uint64_t v21 = (uint64_t *)(*(void *)(v4 + 48) + v19);
    uint64_t v23 = *v21;
    uint64_t v22 = v21[1];
    uint64_t v24 = (uint64_t *)(*(void *)(v4 + 56) + v19);
    uint64_t v25 = *v24;
    uint64_t v26 = v24[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v27 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v28 = result & ~v27;
    unint64_t v29 = v28 >> 6;
    if (((-1 << v28) & ~*(void *)(v12 + 8 * (v28 >> 6))) != 0)
    {
      unint64_t v30 = __clz(__rbit64((-1 << v28) & ~*(void *)(v12 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v31 = 0;
      unint64_t v32 = (unint64_t)(63 - v27) >> 6;
      do
      {
        if (++v29 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v33 = v29 == v32;
        if (v29 == v32) {
          unint64_t v29 = 0;
        }
        v31 |= v33;
        uint64_t v34 = *(void *)(v12 + 8 * v29);
      }
      while (v34 == -1);
      unint64_t v30 = __clz(__rbit64(~v34)) + (v29 << 6);
    }
    *(void *)(v12 + ((v30 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v30;
    uint64_t v35 = 16 * v30;
    uint64_t v36 = (void *)(*(void *)(v9 + 48) + v35);
    *uint64_t v36 = v23;
    v36[1] = v22;
    uint64_t v37 = (void *)(*(void *)(v9 + 56) + v35);
    *uint64_t v37 = v25;
    v37[1] = v26;
    ++*(void *)(v9 + 16);
    if (__OFSUB__(v5--, 1)) {
      break;
    }
    uint64_t v4 = v20;
    uint64_t v11 = v41;
    if (!v5) {
      return v9;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1000EC6D8(char a1, unsigned __int8 a2, unsigned __int8 a3)
{
  int v5 = a2;
  int v6 = a3;
  sub_1000060EC((uint64_t *)&unk_100159A40);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100110CD0;
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 40) = v8;
  *(void *)(inited + 48) = sub_1000EB794(a1);
  *(void *)(inited + 56) = v9;
  *(void *)(inited + 64) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 72) = v10;
  if (v5 == 11)
  {
    uint64_t v11 = 0;
    unint64_t v12 = 0xE000000000000000;
  }
  else
  {
    uint64_t v11 = sub_1000EB9F0(a2);
  }
  *(void *)(inited + 80) = v11;
  *(void *)(inited + 88) = v12;
  *(void *)(inited + 96) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 104) = v13;
  if (v6 != 2)
  {
    if (v6) {
      uint64_t v14 = 1702195828;
    }
    else {
      uint64_t v14 = 0x65736C6166;
    }
    if (v6) {
      unint64_t v15 = 0xE400000000000000;
    }
    else {
      unint64_t v15 = 0xE500000000000000;
    }
    unint64_t v16 = v15;
    String.append(_:)(*(Swift::String *)&v14);
    swift_bridgeObjectRelease();
  }
  *(void *)(inited + 112) = 0;
  *(void *)(inited + 120) = 0xE000000000000000;
  unint64_t v17 = sub_1000E8B60(inited);
  uint64_t v18 = sub_1000EBF40(v17);
  swift_bridgeObjectRelease();
  uint64_t v19 = sub_1000EC098((uint64_t)v18);
  swift_release();
  return v19;
}

uint64_t sub_1000EC83C(char a1, char a2)
{
  sub_1000060EC((uint64_t *)&unk_100159A40);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1001118A0;
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 40) = v5;
  uint64_t v6 = 48;
  if (a1) {
    uint64_t v6 = 49;
  }
  unint64_t v7 = 0xE100000000000000;
  *(void *)(inited + 48) = v6;
  *(void *)(inited + 56) = 0xE100000000000000;
  *(void *)(inited + 64) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 72) = v8;
  uint64_t v9 = 50;
  switch(a2)
  {
    case 1:
      uint64_t v9 = 51;
      break;
    case 2:
      uint64_t v9 = 53;
      break;
    case 3:
      uint64_t v9 = 55;
      break;
    case 4:
      uint64_t v9 = 56;
      break;
    case 5:
      uint64_t v9 = 57;
      break;
    case 6:
      unint64_t v7 = 0xE200000000000000;
      uint64_t v9 = 12337;
      break;
    default:
      break;
  }
  *(void *)(inited + 80) = v9;
  *(void *)(inited + 88) = v7;
  unint64_t v10 = sub_1000E8B60(inited);
  uint64_t v11 = sub_1000EBF40(v10);
  swift_bridgeObjectRelease();
  uint64_t v12 = sub_1000EC098((uint64_t)v11);
  swift_release();
  return v12;
}

uint64_t sub_1000EC980()
{
  unint64_t v0 = _findStringSwitchCaseWithCache(cases:string:cache:)();
  swift_bridgeObjectRelease();
  if (v0 >= 0x13) {
    return 19;
  }
  else {
    return v0;
  }
}

unint64_t sub_1000EC9D4(Swift::String string)
{
  object = string._object;
  v2._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1001492F8, v2);
  swift_bridgeObjectRelease();
  if (v3 >= 0xB) {
    return 11;
  }
  else {
    return v3;
  }
}

uint64_t sub_1000ECA24(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for MatchLifeCycle(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for MatchLifeCycle(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for MatchLifeCycle()
{
  return &type metadata for MatchLifeCycle;
}

uint64_t getEnumTagSinglePayload for MusicRecognitionLifeCycle.ActionType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xEE) {
    goto LABEL_17;
  }
  if (a2 + 18 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 18) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 18;
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
      return (*a1 | (v4 << 8)) - 18;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 18;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x13;
  int v8 = v6 - 19;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for MusicRecognitionLifeCycle.ActionType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 18 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 18) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xED)
  {
    unsigned int v6 = ((a2 - 238) >> 8) + 1;
    *uint64_t result = a2 + 18;
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
        JUMPOUT(0x1000ECC60);
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
          *uint64_t result = a2 + 18;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MusicRecognitionLifeCycle.ActionType()
{
  return &type metadata for MusicRecognitionLifeCycle.ActionType;
}

unint64_t sub_1000ECC9C()
{
  unint64_t result = qword_10015CEE8;
  if (!qword_10015CEE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015CEE8);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for MatchLifeCycle.OriginType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 6;
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
        JUMPOUT(0x1000ECDBCLL);
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
          *unint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MatchLifeCycle.OriginType()
{
  return &type metadata for MatchLifeCycle.OriginType;
}

unint64_t sub_1000ECDF8()
{
  unint64_t result = qword_10015CEF0;
  if (!qword_10015CEF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015CEF0);
  }
  return result;
}

unint64_t sub_1000ECE4C(Swift::String string)
{
  object = string._object;
  v2._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100149420, v2);
  swift_bridgeObjectRelease();
  if (v3 >= 7) {
    return 7;
  }
  else {
    return v3;
  }
}

uint64_t sub_1000ECEA4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_1000060EC((uint64_t *)&unk_100158FC0);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v9 = &v13[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v7);
  uint64_t v11 = &v13[-v10];
  sub_10000AD3C(a1, (uint64_t)&v13[-v10]);
  swift_getKeyPath();
  uint64_t v16 = v3;
  unint64_t v17 = v11;
  uint64_t v18 = v3;
  sub_1000ED670();
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  sub_10001ABF4((uint64_t)v11);
  sub_10000AD3C(a2, (uint64_t)v11);
  sub_10000AD3C((uint64_t)v11, (uint64_t)v9);
  swift_getKeyPath();
  uint64_t v14 = v3;
  unint64_t v15 = v9;
  uint64_t v18 = v3;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  sub_10001ABF4((uint64_t)v9);
  return sub_10001ABF4((uint64_t)v11);
}

uint64_t sub_1000ED054@<X0>(uint64_t a1@<X8>)
{
  return sub_1000ED18C(&OBJC_IVAR____TtC16MusicRecognition20SongArtworkViewModel__artworkURL, a1);
}

uint64_t sub_1000ED068@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000ED23C(a1, &OBJC_IVAR____TtC16MusicRecognition20SongArtworkViewModel__artworkURL, a2);
}

uint64_t sub_1000ED07C(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = sub_1000060EC((uint64_t *)&unk_100158FC0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10000AD3C(a1, (uint64_t)v6);
  uint64_t v7 = *a2;
  swift_getKeyPath();
  uint64_t v10 = v7;
  uint64_t v11 = v6;
  uint64_t v12 = v7;
  sub_1000ED670();
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  return sub_10001ABF4((uint64_t)v6);
}

uint64_t sub_1000ED178@<X0>(uint64_t a1@<X8>)
{
  return sub_1000ED18C(&OBJC_IVAR____TtC16MusicRecognition20SongArtworkViewModel___animatedArtworkURL, a1);
}

uint64_t sub_1000ED18C@<X0>(void *a1@<X1>, uint64_t a2@<X8>)
{
  swift_getKeyPath();
  sub_1000ED670();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v5 = v2 + *a1;
  swift_beginAccess();
  return sub_10000AD3C(v5, a2);
}

uint64_t sub_1000ED228@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000ED23C(a1, &OBJC_IVAR____TtC16MusicRecognition20SongArtworkViewModel___animatedArtworkURL, a2);
}

uint64_t sub_1000ED23C@<X0>(uint64_t *a1@<X0>, void *a2@<X4>, uint64_t a3@<X8>)
{
  uint64_t v5 = *a1;
  swift_getKeyPath();
  sub_1000ED670();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v6 = v5 + *a2;
  swift_beginAccess();
  return sub_10000AD3C(v6, a3);
}

uint64_t sub_1000ED2DC(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = sub_1000060EC((uint64_t *)&unk_100158FC0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10000AD3C(a1, (uint64_t)v6);
  uint64_t v7 = *a2;
  swift_getKeyPath();
  uint64_t v10 = v7;
  uint64_t v11 = v6;
  uint64_t v12 = v7;
  sub_1000ED670();
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  return sub_10001ABF4((uint64_t)v6);
}

uint64_t sub_1000ED3D8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a1 + *a3;
  swift_beginAccess();
  sub_1000ED718(a2, v4);
  return swift_endAccess();
}

uint64_t sub_1000ED440()
{
  sub_10001ABF4(v0 + OBJC_IVAR____TtC16MusicRecognition20SongArtworkViewModel__artworkURL);
  sub_10001ABF4(v0 + OBJC_IVAR____TtC16MusicRecognition20SongArtworkViewModel___animatedArtworkURL);
  uint64_t v1 = v0 + OBJC_IVAR____TtC16MusicRecognition20SongArtworkViewModel___observationRegistrar;
  uint64_t v2 = type metadata accessor for ObservationRegistrar();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_1000ED500()
{
  return type metadata accessor for SongArtworkViewModel();
}

uint64_t type metadata accessor for SongArtworkViewModel()
{
  uint64_t result = qword_10015CF38;
  if (!qword_10015CF38) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000ED554()
{
  sub_10000ABC4();
  if (v0 <= 0x3F)
  {
    type metadata accessor for ObservationRegistrar();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t sub_1000ED620@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000ED23C(a1, &OBJC_IVAR____TtC16MusicRecognition20SongArtworkViewModel__artworkURL, a2);
}

uint64_t sub_1000ED64C()
{
  return sub_1000ED3D8(*(void *)(v0 + 16), *(void *)(v0 + 24), &OBJC_IVAR____TtC16MusicRecognition20SongArtworkViewModel__artworkURL);
}

unint64_t sub_1000ED670()
{
  unint64_t result = qword_10015C458;
  if (!qword_10015C458)
  {
    type metadata accessor for SongArtworkViewModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015C458);
  }
  return result;
}

uint64_t sub_1000ED6C8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000ED23C(a1, &OBJC_IVAR____TtC16MusicRecognition20SongArtworkViewModel___animatedArtworkURL, a2);
}

uint64_t sub_1000ED6F4()
{
  return sub_1000ED3D8(*(void *)(v0 + 16), *(void *)(v0 + 24), &OBJC_IVAR____TtC16MusicRecognition20SongArtworkViewModel___animatedArtworkURL);
}

uint64_t sub_1000ED718(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000060EC((uint64_t *)&unk_100158FC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000ED780()
{
  return sub_1000ED6F4();
}

uint64_t sub_1000ED798()
{
  return sub_1000ED64C();
}

void **initializeBufferWithCopyOfBuffer for DeviceToDeviceEncryptionView(void **a1, void **a2)
{
  uint64_t v3 = *a2;
  *a1 = *a2;
  id v4 = v3;
  return a1;
}

void **assignWithCopy for DeviceToDeviceEncryptionView(void **a1, void **a2)
{
  uint64_t v3 = *a1;
  id v4 = *a2;
  *a1 = *a2;
  id v5 = v4;

  return a1;
}

void **assignWithTake for DeviceToDeviceEncryptionView(void **a1, void **a2)
{
  uint64_t v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for DeviceToDeviceEncryptionView(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DeviceToDeviceEncryptionView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceToDeviceEncryptionView()
{
  return &type metadata for DeviceToDeviceEncryptionView;
}

uint64_t sub_1000ED90C(uint64_t a1, void *a2)
{
  uint64_t v9 = LocalizedStringKey.init(stringLiteral:)();
  uint64_t v10 = v3;
  LOBYTE(v11) = v4 & 1;
  uint64_t v12 = v5;
  id v6 = objc_allocWithZone((Class)sub_1000060EC(&qword_10015CFD8));
  uint64_t v7 = UIHostingController.init(rootView:)();
  if (a2) {
    [a2 setPresentingViewController:v7, v9, v10, v11, v12];
  }
  return v7;
}

uint64_t sub_1000ED9A4(uint64_t a1)
{
  return sub_1000ED90C(a1, *v1);
}

uint64_t sub_1000ED9AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1000EDA9C();

  return static UIViewControllerRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1000EDA10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1000EDA9C();

  return static UIViewControllerRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_1000EDA74()
{
}

unint64_t sub_1000EDA9C()
{
  unint64_t result = qword_10015CFD0;
  if (!qword_10015CFD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015CFD0);
  }
  return result;
}

uint64_t sub_1000EDAF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v38 = a5;
  v35[1] = a4;
  uint64_t v36 = a3;
  uint64_t v39 = a6;
  uint64_t v8 = sub_1000060EC((uint64_t *)&unk_100158FC0);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for ShazamUpsellViewModel();
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (void *)((char *)v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = (int *)type metadata accessor for ShazamUpsellOverlayModifier(0);
  uint64_t v15 = __chkstk_darwin(v14);
  unint64_t v17 = (char *)v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)v35 - v18;
  uint64_t v20 = type metadata accessor for ModifiedContent();
  uint64_t v37 = *(void *)(v20 - 8);
  uint64_t v21 = __chkstk_darwin(v20);
  uint64_t v23 = (char *)v35 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  uint64_t v25 = (char *)v35 - v24;
  sub_100009C94(a1, (uint64_t)v10, (uint64_t *)&unk_100158FC0);
  sub_100095BE8((uint64_t)v10, v13);
  uint64_t v26 = (uint64_t *)&v17[v14[6]];
  *uint64_t v26 = swift_getKeyPath();
  sub_1000060EC(&qword_100156938);
  swift_storeEnumTagMultiPayload();
  uint64_t v27 = (uint64_t *)&v17[v14[7]];
  *uint64_t v27 = swift_getKeyPath();
  sub_1000060EC(&qword_100156928);
  swift_storeEnumTagMultiPayload();
  uint64_t v42 = 0x4051800000000000;
  uint64_t v28 = v36;
  sub_100017778(a2);
  sub_10008A53C();
  ScaledMetric.init(wrappedValue:)();
  sub_1000EF22C((uint64_t)v13, (uint64_t)v17, (uint64_t (*)(void))type metadata accessor for ShazamUpsellViewModel);
  unint64_t v29 = (uint64_t *)&v17[v14[5]];
  *unint64_t v29 = a2;
  v29[1] = v28;
  sub_1000EF22C((uint64_t)v17, (uint64_t)v19, type metadata accessor for ShazamUpsellOverlayModifier);
  uint64_t v30 = v38;
  View.modifier<A>(_:)();
  sub_1000F2338((uint64_t)v19, type metadata accessor for ShazamUpsellOverlayModifier);
  uint64_t v31 = sub_1000F2408(&qword_100158108, (void (*)(uint64_t))type metadata accessor for ShazamUpsellOverlayModifier);
  uint64_t v40 = v30;
  uint64_t v41 = v31;
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_1000BA728(v23, v20, WitnessTable);
  BOOL v33 = *(void (**)(char *, uint64_t))(v37 + 8);
  v33(v23, v20);
  sub_1000BA728(v25, v20, WitnessTable);
  return ((uint64_t (*)(char *, uint64_t))v33)(v25, v20);
}

uint64_t type metadata accessor for ShazamUpsellOverlayModifier(uint64_t a1)
{
  return sub_10009C0CC(a1, (uint64_t *)&unk_10015D040);
}

double sub_1000EDF08()
{
  uint64_t v0 = type metadata accessor for UserInterfaceSizeClass();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000060EC(&qword_1001589C8);
  uint64_t v5 = v4 - 8;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000060EC(&qword_100156930);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v22 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v22 - v15;
  type metadata accessor for ShazamUpsellOverlay(0);
  sub_100008780((uint64_t)v16);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v14, enum case for UserInterfaceSizeClass.compact(_:), v0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v1 + 56))(v14, 0, 1, v0);
  uint64_t v17 = (uint64_t)&v7[*(int *)(v5 + 56)];
  sub_100009C94((uint64_t)v16, (uint64_t)v7, &qword_100156930);
  sub_100009C94((uint64_t)v14, v17, &qword_100156930);
  uint64_t v18 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48);
  if (v18((uint64_t)v7, 1, v0) == 1)
  {
    sub_1000063D0((uint64_t)v14, &qword_100156930);
    sub_1000063D0((uint64_t)v16, &qword_100156930);
    if (v18(v17, 1, v0) == 1)
    {
      sub_1000063D0((uint64_t)v7, &qword_100156930);
      return 8.0;
    }
  }
  else
  {
    sub_100009C94((uint64_t)v7, (uint64_t)v11, &qword_100156930);
    if (v18(v17, 1, v0) != 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v1 + 32))(v3, v17, v0);
      sub_1000F2408(&qword_1001589D0, (void (*)(uint64_t))&type metadata accessor for UserInterfaceSizeClass);
      char v20 = dispatch thunk of static Equatable.== infix(_:_:)();
      uint64_t v21 = *(void (**)(char *, uint64_t))(v1 + 8);
      v21(v3, v0);
      sub_1000063D0((uint64_t)v14, &qword_100156930);
      sub_1000063D0((uint64_t)v16, &qword_100156930);
      v21(v11, v0);
      sub_1000063D0((uint64_t)v7, &qword_100156930);
      double result = 8.0;
      if (v20) {
        return result;
      }
      return 80.0;
    }
    sub_1000063D0((uint64_t)v14, &qword_100156930);
    sub_1000063D0((uint64_t)v16, &qword_100156930);
    (*(void (**)(char *, uint64_t))(v1 + 8))(v11, v0);
  }
  sub_1000063D0((uint64_t)v7, &qword_1001589C8);
  return 80.0;
}

double sub_1000EE2FC()
{
  uint64_t v0 = type metadata accessor for UserInterfaceSizeClass();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000060EC(&qword_1001589C8);
  uint64_t v5 = v4 - 8;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000060EC(&qword_100156930);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v22 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v22 - v15;
  type metadata accessor for ShazamUpsellOverlay(0);
  sub_100008780((uint64_t)v16);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v14, enum case for UserInterfaceSizeClass.compact(_:), v0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v1 + 56))(v14, 0, 1, v0);
  uint64_t v17 = (uint64_t)&v7[*(int *)(v5 + 56)];
  sub_100009C94((uint64_t)v16, (uint64_t)v7, &qword_100156930);
  sub_100009C94((uint64_t)v14, v17, &qword_100156930);
  uint64_t v18 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48);
  if (v18((uint64_t)v7, 1, v0) == 1)
  {
    sub_1000063D0((uint64_t)v14, &qword_100156930);
    sub_1000063D0((uint64_t)v16, &qword_100156930);
    if (v18(v17, 1, v0) == 1)
    {
      sub_1000063D0((uint64_t)v7, &qword_100156930);
      return 10.0;
    }
  }
  else
  {
    sub_100009C94((uint64_t)v7, (uint64_t)v11, &qword_100156930);
    if (v18(v17, 1, v0) != 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v1 + 32))(v3, v17, v0);
      sub_1000F2408(&qword_1001589D0, (void (*)(uint64_t))&type metadata accessor for UserInterfaceSizeClass);
      char v20 = dispatch thunk of static Equatable.== infix(_:_:)();
      uint64_t v21 = *(void (**)(char *, uint64_t))(v1 + 8);
      v21(v3, v0);
      sub_1000063D0((uint64_t)v14, &qword_100156930);
      sub_1000063D0((uint64_t)v16, &qword_100156930);
      v21(v11, v0);
      sub_1000063D0((uint64_t)v7, &qword_100156930);
      double result = 10.0;
      if (v20) {
        return result;
      }
      return 28.0;
    }
    sub_1000063D0((uint64_t)v14, &qword_100156930);
    sub_1000063D0((uint64_t)v16, &qword_100156930);
    (*(void (**)(char *, uint64_t))(v1 + 8))(v11, v0);
  }
  sub_1000063D0((uint64_t)v7, &qword_1001589C8);
  return 28.0;
}

uint64_t sub_1000EE6EC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v63 = a1;
  uint64_t v62 = sub_1000060EC(&qword_1001571C0);
  __chkstk_darwin(v62);
  uint64_t v78 = (char *)&v61 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = sub_1000060EC(&qword_100157ED8) - 8;
  __chkstk_darwin(v76);
  uint64_t v75 = (uint64_t)&v61 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = type metadata accessor for RoundedRectangle() - 8;
  __chkstk_darwin(v73);
  unint64_t v72 = (char *)&v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for ShazamUpsellOverlay(0);
  uint64_t v6 = v5 - 8;
  uint64_t v7 = *(void *)(v5 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = sub_1000060EC(&qword_10015D1A8) - 8;
  __chkstk_darwin(v71);
  uint64_t v11 = (char *)&v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = sub_1000060EC(&qword_10015D1B0) - 8;
  __chkstk_darwin(v79);
  uint64_t v77 = (uint64_t)&v61 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_1000060EC(&qword_10015D1B8);
  __chkstk_darwin(v69);
  char v74 = (char *)&v61 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = (uint64_t *)(v1 + *(int *)(v6 + 32));
  uint64_t v15 = v14[1];
  uint64_t v66 = *v14;
  uint64_t v17 = v14[2];
  uint64_t v16 = v14[3];
  uint64_t v65 = v17;
  uint64_t v64 = v16;
  uint64_t v70 = v1;
  sub_1000F22D0(v1, (uint64_t)v9, type metadata accessor for ShazamUpsellOverlay);
  unint64_t v18 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v19 = swift_allocObject();
  uint64_t v67 = v19;
  sub_1000EF22C((uint64_t)v9, v19 + v18, type metadata accessor for ShazamUpsellOverlay);
  sub_1000F22D0(v1, (uint64_t)v9, type metadata accessor for ShazamUpsellOverlay);
  uint64_t v20 = swift_allocObject();
  sub_1000EF22C((uint64_t)v9, v20 + v18, type metadata accessor for ShazamUpsellOverlay);
  uint64_t v68 = v15;
  swift_bridgeObjectRetain();
  uint64_t v21 = v64;
  swift_bridgeObjectRetain();
  char v22 = static Edge.Set.all.getter();
  EdgeInsets.init(_all:)();
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  char v80 = 0;
  uint64_t v31 = static Alignment.center.getter();
  *(void *)&long long v81 = v66;
  *((void *)&v81 + 1) = v15;
  *(void *)&long long v82 = v65;
  *((void *)&v82 + 1) = v21;
  long long v83 = 0uLL;
  *(void *)&long long v84 = sub_1000F4714;
  *((void *)&v84 + 1) = v19;
  *(void *)&long long v85 = sub_1000F4A9C;
  *((void *)&v85 + 1) = v20;
  LOBYTE(v86) = v22;
  *((void *)&v86 + 1) = v24;
  *(void *)&long long v87 = v26;
  *((void *)&v87 + 1) = v28;
  *(void *)&long long v88 = v30;
  BYTE8(v88) = v80;
  *(void *)&long long v89 = 9;
  *((void *)&v89 + 1) = v31;
  uint64_t v90 = v32;
  BOOL v33 = v72;
  uint64_t v34 = &v72[*(int *)(v73 + 28)];
  uint64_t v35 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v36 = type metadata accessor for RoundedCornerStyle();
  uint64_t v37 = v35;
  uint64_t v38 = v69;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v36 - 8) + 104))(v34, v37, v36);
  __asm { FMOV            V0.2D, #16.0 }
  *BOOL v33 = _Q0;
  uint64_t v44 = v75;
  sub_1000F22D0((uint64_t)v33, v75, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  *(_WORD *)(v44 + *(int *)(v76 + 44)) = 256;
  uint64_t v45 = (uint64_t)v78;
  sub_100009C94(v44, (uint64_t)&v11[*(int *)(v71 + 44)], &qword_100157ED8);
  long long v46 = v88;
  *((_OWORD *)v11 + 6) = v87;
  *((_OWORD *)v11 + 7) = v46;
  *((_OWORD *)v11 + 8) = v89;
  *((void *)v11 + 18) = v90;
  long long v47 = v84;
  *((_OWORD *)v11 + 2) = v83;
  *((_OWORD *)v11 + 3) = v47;
  long long v48 = v86;
  *((_OWORD *)v11 + 4) = v85;
  *((_OWORD *)v11 + 5) = v48;
  long long v49 = v82;
  *(_OWORD *)uint64_t v11 = v81;
  *((_OWORD *)v11 + 1) = v49;
  sub_1000F4B0C((uint64_t)&v81);
  sub_1000063D0(v44, &qword_100157ED8);
  sub_1000F2338((uint64_t)v33, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100077228((uint64_t)sub_1000F4714);
  uint64_t v50 = (uint64_t)v74;
  sub_100077228((uint64_t)sub_1000F4A9C);
  double v51 = sub_1000EDF08();
  double v52 = sub_1000EE2FC();
  double v53 = sub_1000EDF08();
  LOBYTE(v34) = static Edge.Set.all.getter();
  uint64_t v54 = v77;
  sub_100009C94((uint64_t)v11, v77, &qword_10015D1A8);
  uint64_t v55 = v54 + *(int *)(v79 + 44);
  *(unsigned char *)uint64_t v55 = (_BYTE)v34;
  *(void *)(v55 + 8) = 0x4020000000000000;
  *(double *)(v55 + 16) = v51;
  *(double *)(v55 + 24) = v52;
  *(double *)(v55 + 32) = v53;
  *(unsigned char *)(v55 + 40) = 0;
  sub_1000063D0((uint64_t)v11, &qword_10015D1A8);
  static Color.black.getter();
  uint64_t v56 = Color.opacity(_:)();
  swift_release();
  sub_100009C94(v54, v50, &qword_10015D1B0);
  uint64_t v57 = (uint64_t *)(v50 + *(int *)(v38 + 36));
  *uint64_t v57 = v56;
  v57[1] = 0x4034000000000000;
  v57[2] = 0;
  v57[3] = 0;
  sub_1000063D0(v54, &qword_10015D1B0);
  uint64_t v58 = enum case for DynamicTypeSize.xLarge(_:);
  uint64_t v59 = type metadata accessor for DynamicTypeSize();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v59 - 8) + 104))(v45, v58, v59);
  sub_1000F2408(&qword_100157258, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  uint64_t result = dispatch thunk of static Equatable.== infix(_:_:)();
  if (result)
  {
    sub_1000F4D24(&qword_10015D1C0, &qword_10015D1B8, (void (*)(void))sub_1000F4B88);
    sub_100006480(&qword_100157260, &qword_1001571C0);
    View.dynamicTypeSize<A>(_:)();
    sub_1000063D0(v45, &qword_1001571C0);
    return sub_1000063D0(v50, &qword_10015D1B8);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000EEF10(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for OpenURLAction();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000060EC((uint64_t *)&unk_100158FC0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for URL();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = a1 + *(int *)(type metadata accessor for ShazamUpsellOverlay(0) + 24);
  uint64_t v14 = type metadata accessor for ShazamUpsellViewModel();
  sub_100009C94(v13 + *(int *)(v14 + 24), (uint64_t)v8, (uint64_t *)&unk_100158FC0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1) {
    return sub_1000063D0((uint64_t)v8, (uint64_t *)&unk_100158FC0);
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
  sub_1000083D4((uint64_t)v5);
  OpenURLAction.callAsFunction(_:)();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_1000EF15C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = v4;
  if (v3 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v5 == v6)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if ((v8 & 1) == 0) {
      return result;
    }
  }
  uint64_t result = type metadata accessor for ShazamUpsellOverlay(0);
  uint64_t v10 = (uint64_t (**)(void))(a2 + *(int *)(result + 28));
  if (*v10) {
    return (*v10)();
  }
  return result;
}

uint64_t sub_1000EF22C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void *sub_1000EF294(void *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    void *v4 = *a2;
    uint64_t v4 = (void *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    uint64_t v9 = (int *)type metadata accessor for ShazamUpsellViewModel();
    uint64_t v10 = v9[6];
    __dst = (char *)v4 + v10;
    uint64_t v54 = a2;
    uint64_t v11 = (char *)a2 + v10;
    uint64_t v12 = type metadata accessor for URL();
    uint64_t v13 = *(void *)(v12 - 8);
    uint64_t v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v52 = v13;
    if (v14(v11, 1, v12))
    {
      uint64_t v15 = sub_1000060EC((uint64_t *)&unk_100158FC0);
      memcpy(__dst, v11, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(__dst, v11, v12);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(__dst, 0, 1, v12);
    }
    uint64_t v17 = v9[7];
    unint64_t v18 = (void *)((char *)v4 + v17);
    uint64_t v19 = (void *)((char *)v54 + v17);
    uint64_t v20 = v19[1];
    void *v18 = *v19;
    v18[1] = v20;
    uint64_t v21 = v9[8];
    char v22 = (char *)v4 + v21;
    uint64_t v23 = (char *)v54 + v21;
    uint64_t v24 = *((void *)v23 + 1);
    *(void *)char v22 = *(void *)v23;
    *((void *)v22 + 1) = v24;
    v22[16] = v23[16];
    *((void *)v22 + 3) = *((void *)v23 + 3);
    uint64_t v25 = v9[9];
    uint64_t v26 = (char *)v4 + v25;
    uint64_t v27 = (char *)v54 + v25;
    uint64_t v28 = *((void *)v27 + 1);
    *(void *)uint64_t v26 = *(void *)v27;
    *((void *)v26 + 1) = v28;
    v26[16] = v27[16];
    *((void *)v26 + 3) = *((void *)v27 + 3);
    uint64_t v29 = v9[10];
    uint64_t v30 = (char *)v4 + v29;
    uint64_t v31 = (char *)v54 + v29;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v14(v31, 1, v12))
    {
      uint64_t v32 = sub_1000060EC((uint64_t *)&unk_100158FC0);
      memcpy(v30, v31, *(void *)(*(void *)(v32 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v30, v31, v12);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v52 + 56))(v30, 0, 1, v12);
    }
    uint64_t v33 = a3[5];
    uint64_t v34 = (void *)((char *)v4 + v33);
    uint64_t v35 = (void *)((char *)v54 + v33);
    if (*v35)
    {
      uint64_t v36 = v35[1];
      *uint64_t v34 = *v35;
      v34[1] = v36;
      swift_retain();
    }
    else
    {
      *(_OWORD *)uint64_t v34 = *(_OWORD *)v35;
    }
    uint64_t v37 = a3[6];
    uint64_t v38 = (void *)((char *)v4 + v37);
    uint64_t v39 = (void *)((char *)v54 + v37);
    sub_1000060EC(&qword_100156938);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v40 = type metadata accessor for ColorScheme();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v40 - 8) + 16))(v38, v39, v40);
    }
    else
    {
      void *v38 = *v39;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v41 = a3[7];
    uint64_t v42 = (void *)((char *)v4 + v41);
    uint64_t v43 = (void *)((char *)v54 + v41);
    sub_1000060EC(&qword_100156928);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v44 = type metadata accessor for UserInterfaceSizeClass();
      uint64_t v45 = *(void *)(v44 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v45 + 48))(v43, 1, v44))
      {
        uint64_t v46 = sub_1000060EC(&qword_100156930);
        memcpy(v42, v43, *(void *)(*(void *)(v46 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v45 + 16))(v42, v43, v44);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v45 + 56))(v42, 0, 1, v44);
      }
    }
    else
    {
      *uint64_t v42 = *v43;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v47 = a3[8];
    long long v48 = (char *)v4 + v47;
    long long v49 = (char *)v54 + v47;
    uint64_t v50 = sub_1000060EC(&qword_10015CFE0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v50 - 8) + 16))(v48, v49, v50);
  }
  return v4;
}

uint64_t sub_1000EF7C8(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = type metadata accessor for ShazamUpsellViewModel();
  uint64_t v5 = a1 + *(int *)(v4 + 24);
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  if (!v8(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v9 = a1 + *(int *)(v4 + 40);
  if (!v8(v9, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v9, v6);
  }
  if (*(void *)(a1 + a2[5])) {
    swift_release();
  }
  uint64_t v10 = a1 + a2[6];
  sub_1000060EC(&qword_100156938);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = type metadata accessor for ColorScheme();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  }
  else
  {
    swift_release();
  }
  uint64_t v12 = a1 + a2[7];
  sub_1000060EC(&qword_100156928);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v13 = type metadata accessor for UserInterfaceSizeClass();
    uint64_t v14 = *(void *)(v13 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13)) {
      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v15 = a1 + a2[8];
  uint64_t v16 = sub_1000060EC(&qword_10015CFE0);
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8);

  return v17(v15, v16);
}

void *sub_1000EFAAC(void *a1, void *a2, int *a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  uint64_t v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  uint64_t v7 = (int *)type metadata accessor for ShazamUpsellViewModel();
  uint64_t v8 = v7[6];
  uint64_t v9 = (char *)a1 + v8;
  double v51 = a2;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for URL();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v13(v10, 1, v11))
  {
    uint64_t v14 = sub_1000060EC((uint64_t *)&unk_100158FC0);
    memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  uint64_t v15 = v7[7];
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (void *)((char *)v51 + v15);
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  uint64_t v19 = v7[8];
  uint64_t v20 = (char *)a1 + v19;
  uint64_t v21 = (char *)v51 + v19;
  uint64_t v22 = *((void *)v21 + 1);
  *(void *)uint64_t v20 = *(void *)v21;
  *((void *)v20 + 1) = v22;
  v20[16] = v21[16];
  *((void *)v20 + 3) = *((void *)v21 + 3);
  uint64_t v23 = v7[9];
  uint64_t v24 = (char *)a1 + v23;
  uint64_t v25 = (char *)v51 + v23;
  uint64_t v26 = *((void *)v25 + 1);
  *(void *)uint64_t v24 = *(void *)v25;
  *((void *)v24 + 1) = v26;
  v24[16] = v25[16];
  *((void *)v24 + 3) = *((void *)v25 + 3);
  uint64_t v27 = v7[10];
  uint64_t v28 = (char *)a1 + v27;
  uint64_t v29 = (char *)v51 + v27;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v13(v29, 1, v11))
  {
    uint64_t v30 = sub_1000060EC((uint64_t *)&unk_100158FC0);
    memcpy(v28, v29, *(void *)(*(void *)(v30 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v28, v29, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v28, 0, 1, v11);
  }
  uint64_t v31 = a3[5];
  uint64_t v32 = (void *)((char *)a1 + v31);
  uint64_t v33 = (void *)((char *)v51 + v31);
  if (*v33)
  {
    uint64_t v34 = v33[1];
    *uint64_t v32 = *v33;
    v32[1] = v34;
    swift_retain();
  }
  else
  {
    *(_OWORD *)uint64_t v32 = *(_OWORD *)v33;
  }
  uint64_t v35 = a3[6];
  uint64_t v36 = (void *)((char *)a1 + v35);
  uint64_t v37 = (void *)((char *)v51 + v35);
  sub_1000060EC(&qword_100156938);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v38 = type metadata accessor for ColorScheme();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v38 - 8) + 16))(v36, v37, v38);
  }
  else
  {
    *uint64_t v36 = *v37;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v39 = a3[7];
  uint64_t v40 = (void *)((char *)a1 + v39);
  uint64_t v41 = (void *)((char *)v51 + v39);
  sub_1000060EC(&qword_100156928);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v42 = type metadata accessor for UserInterfaceSizeClass();
    uint64_t v43 = *(void *)(v42 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v43 + 48))(v41, 1, v42))
    {
      uint64_t v44 = sub_1000060EC(&qword_100156930);
      memcpy(v40, v41, *(void *)(*(void *)(v44 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(v43 + 16))(v40, v41, v42);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v43 + 56))(v40, 0, 1, v42);
    }
  }
  else
  {
    *uint64_t v40 = *v41;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v45 = a3[8];
  uint64_t v46 = (char *)a1 + v45;
  uint64_t v47 = (char *)v51 + v45;
  uint64_t v48 = sub_1000060EC(&qword_10015CFE0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v48 - 8) + 16))(v46, v47, v48);
  return a1;
}

char *sub_1000EFF7C(char *a1, char *a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = *((void *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 2) = *((void *)a2 + 2);
  *((void *)a1 + 3) = *((void *)a2 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v5 = (int *)type metadata accessor for ShazamUpsellViewModel();
  uint64_t v6 = v5[6];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = type metadata accessor for URL();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    uint64_t v14 = sub_1000060EC((uint64_t *)&unk_100158FC0);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = v5[7];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  *(void *)uint64_t v16 = *(void *)v17;
  *((void *)v16 + 1) = *((void *)v17 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v18 = v5[8];
  uint64_t v19 = &a1[v18];
  uint64_t v20 = &a2[v18];
  *(void *)uint64_t v19 = *(void *)&a2[v18];
  *((void *)v19 + 1) = *(void *)&a2[v18 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v19[16] = v20[16];
  *((void *)v19 + 3) = *((void *)v20 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v21 = v5[9];
  uint64_t v22 = &a1[v21];
  uint64_t v23 = &a2[v21];
  *(void *)uint64_t v22 = *(void *)&a2[v21];
  *((void *)v22 + 1) = *(void *)&a2[v21 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v22[16] = v23[16];
  *((void *)v22 + 3) = *((void *)v23 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v24 = v5[10];
  uint64_t v25 = &a1[v24];
  uint64_t v26 = &a2[v24];
  LODWORD(v22) = v11(&a1[v24], 1, v9);
  int v27 = v11(v26, 1, v9);
  if (v22)
  {
    if (!v27)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v25, v26, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v25, 0, 1, v9);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v27)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v25, v9);
LABEL_12:
    uint64_t v28 = sub_1000060EC((uint64_t *)&unk_100158FC0);
    memcpy(v25, v26, *(void *)(*(void *)(v28 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v25, v26, v9);
LABEL_13:
  uint64_t v29 = a3[5];
  uint64_t v30 = &a1[v29];
  uint64_t v31 = &a2[v29];
  uint64_t v32 = *(void *)&a1[v29];
  uint64_t v33 = *(void *)&a2[v29];
  if (v32)
  {
    if (v33)
    {
      uint64_t v34 = *((void *)v31 + 1);
      *(void *)uint64_t v30 = v33;
      *((void *)v30 + 1) = v34;
      swift_retain();
      swift_release();
      goto LABEL_20;
    }
    swift_release();
  }
  else if (v33)
  {
    uint64_t v35 = *((void *)v31 + 1);
    *(void *)uint64_t v30 = v33;
    *((void *)v30 + 1) = v35;
    swift_retain();
    goto LABEL_20;
  }
  *(_OWORD *)uint64_t v30 = *(_OWORD *)v31;
LABEL_20:
  if (a1 != a2)
  {
    uint64_t v36 = a3[6];
    uint64_t v37 = &a1[v36];
    uint64_t v38 = &a2[v36];
    sub_1000063D0((uint64_t)&a1[v36], &qword_100156938);
    sub_1000060EC(&qword_100156938);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v39 = type metadata accessor for ColorScheme();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v39 - 8) + 16))(v37, v38, v39);
    }
    else
    {
      *(void *)uint64_t v37 = *(void *)v38;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v40 = a3[7];
    uint64_t v41 = &a1[v40];
    uint64_t v42 = &a2[v40];
    sub_1000063D0((uint64_t)&a1[v40], &qword_100156928);
    sub_1000060EC(&qword_100156928);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v43 = type metadata accessor for UserInterfaceSizeClass();
      uint64_t v44 = *(void *)(v43 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v44 + 48))(v42, 1, v43))
      {
        uint64_t v45 = sub_1000060EC(&qword_100156930);
        memcpy(v41, v42, *(void *)(*(void *)(v45 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v44 + 16))(v41, v42, v43);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v44 + 56))(v41, 0, 1, v43);
      }
    }
    else
    {
      *(void *)uint64_t v41 = *(void *)v42;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v46 = a3[8];
  uint64_t v47 = &a1[v46];
  uint64_t v48 = &a2[v46];
  uint64_t v49 = sub_1000060EC(&qword_10015CFE0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v49 - 8) + 24))(v47, v48, v49);
  return a1;
}

_OWORD *sub_1000F05B0(_OWORD *a1, char *a2, int *a3)
{
  long long v6 = *((_OWORD *)a2 + 1);
  *a1 = *(_OWORD *)a2;
  a1[1] = v6;
  uint64_t v7 = (int *)type metadata accessor for ShazamUpsellViewModel();
  uint64_t v8 = v7[6];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = &a2[v8];
  uint64_t v11 = type metadata accessor for URL();
  uint64_t v12 = *(void *)(v11 - 8);
  int v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  if (v13(v10, 1, v11))
  {
    uint64_t v14 = sub_1000060EC((uint64_t *)&unk_100158FC0);
    memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  *(_OWORD *)((char *)a1 + v7[7]) = *(_OWORD *)&a2[v7[7]];
  uint64_t v15 = v7[8];
  uint64_t v16 = (_OWORD *)((char *)a1 + v15);
  uint64_t v17 = &a2[v15];
  long long v18 = *((_OWORD *)v17 + 1);
  *uint64_t v16 = *(_OWORD *)v17;
  v16[1] = v18;
  uint64_t v19 = v7[9];
  uint64_t v20 = (_OWORD *)((char *)a1 + v19);
  uint64_t v21 = &a2[v19];
  long long v22 = *((_OWORD *)v21 + 1);
  *uint64_t v20 = *(_OWORD *)v21;
  v20[1] = v22;
  uint64_t v23 = v7[10];
  uint64_t v24 = (char *)a1 + v23;
  uint64_t v25 = &a2[v23];
  if (v13(&a2[v23], 1, v11))
  {
    uint64_t v26 = sub_1000060EC((uint64_t *)&unk_100158FC0);
    memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v24, v25, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v24, 0, 1, v11);
  }
  uint64_t v27 = a3[5];
  uint64_t v28 = (void *)((char *)a1 + v27);
  uint64_t v29 = (uint64_t *)&a2[v27];
  uint64_t v30 = *v29;
  if (*v29)
  {
    uint64_t v31 = v29[1];
    *uint64_t v28 = v30;
    v28[1] = v31;
  }
  else
  {
    *(_OWORD *)uint64_t v28 = *(_OWORD *)v29;
  }
  uint64_t v32 = a3[6];
  uint64_t v33 = (char *)a1 + v32;
  uint64_t v34 = &a2[v32];
  uint64_t v35 = sub_1000060EC(&qword_100156938);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v36 = type metadata accessor for ColorScheme();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v36 - 8) + 32))(v33, v34, v36);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v33, v34, *(void *)(*(void *)(v35 - 8) + 64));
  }
  uint64_t v37 = a3[7];
  uint64_t v38 = (char *)a1 + v37;
  uint64_t v39 = &a2[v37];
  uint64_t v40 = sub_1000060EC(&qword_100156928);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v41 = type metadata accessor for UserInterfaceSizeClass();
    uint64_t v42 = *(void *)(v41 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v42 + 48))(v39, 1, v41))
    {
      uint64_t v43 = sub_1000060EC(&qword_100156930);
      memcpy(v38, v39, *(void *)(*(void *)(v43 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v42 + 32))(v38, v39, v41);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v42 + 56))(v38, 0, 1, v41);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v38, v39, *(void *)(*(void *)(v40 - 8) + 64));
  }
  uint64_t v44 = a3[8];
  uint64_t v45 = (char *)a1 + v44;
  uint64_t v46 = &a2[v44];
  uint64_t v47 = sub_1000060EC(&qword_10015CFE0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v47 - 8) + 32))(v45, v46, v47);
  return a1;
}

char *sub_1000F0A10(char *a1, char *a2, int *a3)
{
  uint64_t v5 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *((void *)a2 + 3);
  *((void *)a1 + 2) = *((void *)a2 + 2);
  *((void *)a1 + 3) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = (int *)type metadata accessor for ShazamUpsellViewModel();
  uint64_t v8 = v7[6];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = type metadata accessor for URL();
  uint64_t v12 = *(void *)(v11 - 8);
  int v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (v14)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v15)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v11);
LABEL_6:
    uint64_t v16 = sub_1000060EC((uint64_t *)&unk_100158FC0);
    memcpy(v9, v10, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 40))(v9, v10, v11);
LABEL_7:
  uint64_t v17 = v7[7];
  long long v18 = &a1[v17];
  uint64_t v19 = (uint64_t *)&a2[v17];
  uint64_t v21 = *v19;
  uint64_t v20 = v19[1];
  *(void *)long long v18 = v21;
  *((void *)v18 + 1) = v20;
  swift_bridgeObjectRelease();
  uint64_t v22 = v7[8];
  uint64_t v23 = &a1[v22];
  uint64_t v24 = &a2[v22];
  uint64_t v25 = *(void *)&a2[v22 + 8];
  *(void *)uint64_t v23 = *(void *)&a2[v22];
  *((void *)v23 + 1) = v25;
  swift_bridgeObjectRelease();
  v23[16] = v24[16];
  *((void *)v23 + 3) = *((void *)v24 + 3);
  swift_bridgeObjectRelease();
  uint64_t v26 = v7[9];
  uint64_t v27 = &a1[v26];
  uint64_t v28 = &a2[v26];
  uint64_t v29 = *(void *)&a2[v26 + 8];
  *(void *)uint64_t v27 = *(void *)&a2[v26];
  *((void *)v27 + 1) = v29;
  swift_bridgeObjectRelease();
  v27[16] = v28[16];
  *((void *)v27 + 3) = *((void *)v28 + 3);
  swift_bridgeObjectRelease();
  uint64_t v30 = v7[10];
  uint64_t v31 = &a1[v30];
  uint64_t v32 = &a2[v30];
  LODWORD(v28) = v13(&a1[v30], 1, v11);
  int v33 = v13(v32, 1, v11);
  if (v28)
  {
    if (!v33)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v31, v32, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v31, 0, 1, v11);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v33)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v31, v11);
LABEL_12:
    uint64_t v34 = sub_1000060EC((uint64_t *)&unk_100158FC0);
    memcpy(v31, v32, *(void *)(*(void *)(v34 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 40))(v31, v32, v11);
LABEL_13:
  uint64_t v35 = a3[5];
  uint64_t v36 = &a1[v35];
  uint64_t v37 = &a2[v35];
  uint64_t v38 = *(void *)&a1[v35];
  uint64_t v39 = *(void *)&a2[v35];
  if (v38)
  {
    if (v39)
    {
      uint64_t v40 = *((void *)v37 + 1);
      *(void *)uint64_t v36 = v39;
      *((void *)v36 + 1) = v40;
      swift_release();
      goto LABEL_20;
    }
    swift_release();
  }
  else if (v39)
  {
    uint64_t v41 = *((void *)v37 + 1);
    *(void *)uint64_t v36 = v39;
    *((void *)v36 + 1) = v41;
    goto LABEL_20;
  }
  *(_OWORD *)uint64_t v36 = *(_OWORD *)v37;
LABEL_20:
  if (a1 != a2)
  {
    uint64_t v42 = a3[6];
    uint64_t v43 = &a1[v42];
    uint64_t v44 = &a2[v42];
    sub_1000063D0((uint64_t)&a1[v42], &qword_100156938);
    uint64_t v45 = sub_1000060EC(&qword_100156938);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v46 = type metadata accessor for ColorScheme();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v46 - 8) + 32))(v43, v44, v46);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v43, v44, *(void *)(*(void *)(v45 - 8) + 64));
    }
    uint64_t v47 = a3[7];
    uint64_t v48 = &a1[v47];
    uint64_t v49 = &a2[v47];
    sub_1000063D0((uint64_t)&a1[v47], &qword_100156928);
    uint64_t v50 = sub_1000060EC(&qword_100156928);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v51 = type metadata accessor for UserInterfaceSizeClass();
      uint64_t v52 = *(void *)(v51 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v52 + 48))(v49, 1, v51))
      {
        uint64_t v53 = sub_1000060EC(&qword_100156930);
        memcpy(v48, v49, *(void *)(*(void *)(v53 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v52 + 32))(v48, v49, v51);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v52 + 56))(v48, 0, 1, v51);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v48, v49, *(void *)(*(void *)(v50 - 8) + 64));
    }
  }
  uint64_t v54 = a3[8];
  uint64_t v55 = &a1[v54];
  uint64_t v56 = &a2[v54];
  uint64_t v57 = sub_1000060EC(&qword_10015CFE0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v57 - 8) + 40))(v55, v56, v57);
  return a1;
}

uint64_t sub_1000F0FF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000F1004);
}

uint64_t sub_1000F1004(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for ShazamUpsellViewModel();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_14:
    return v9(v10, a2, v8);
  }
  if (a2 == 2147483646)
  {
    unint64_t v11 = *(void *)(a1 + a3[5]);
    if (v11 >= 0xFFFFFFFF) {
      LODWORD(v11) = -1;
    }
    int v12 = v11 - 1;
    if (v12 < 0) {
      int v12 = -1;
    }
    return (v12 + 1);
  }
  uint64_t v14 = sub_1000060EC(&qword_100157AF0);
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
  {
    uint64_t v8 = v14;
    uint64_t v15 = *(void *)(v14 - 8);
    uint64_t v16 = a3[6];
LABEL_13:
    uint64_t v10 = a1 + v16;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 48);
    goto LABEL_14;
  }
  uint64_t v17 = sub_1000060EC(&qword_1001585B0);
  if (*(_DWORD *)(*(void *)(v17 - 8) + 84) == a2)
  {
    uint64_t v8 = v17;
    uint64_t v15 = *(void *)(v17 - 8);
    uint64_t v16 = a3[7];
    goto LABEL_13;
  }
  uint64_t v18 = sub_1000060EC(&qword_10015CFE0);
  uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 48);
  uint64_t v20 = v18;
  uint64_t v21 = a1 + a3[8];

  return v19(v21, a2, v20);
}

uint64_t sub_1000F11E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000F11FC);
}

uint64_t sub_1000F11FC(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result = type metadata accessor for ShazamUpsellViewModel();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_10:
    return v11(v12, a2, a2, v10);
  }
  if (a3 == 2147483646)
  {
    *(void *)(a1 + a4[5]) = a2;
    return result;
  }
  uint64_t v13 = sub_1000060EC(&qword_100157AF0);
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v14 = *(void *)(v13 - 8);
    uint64_t v15 = a4[6];
LABEL_9:
    uint64_t v12 = a1 + v15;
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_10;
  }
  uint64_t v16 = sub_1000060EC(&qword_1001585B0);
  if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a3)
  {
    uint64_t v10 = v16;
    uint64_t v14 = *(void *)(v16 - 8);
    uint64_t v15 = a4[7];
    goto LABEL_9;
  }
  uint64_t v17 = sub_1000060EC(&qword_10015CFE0);
  uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
  uint64_t v19 = v17;
  uint64_t v20 = a1 + a4[8];

  return v18(v20, a2, a2, v19);
}

void sub_1000F13D4()
{
  type metadata accessor for ShazamUpsellViewModel();
  if (v0 <= 0x3F)
  {
    sub_1000F45D8(319, (unint64_t *)&qword_100157B60, (void (*)(uint64_t))&type metadata accessor for ColorScheme);
    if (v1 <= 0x3F)
    {
      sub_1000562A0();
      if (v2 <= 0x3F)
      {
        sub_1000F1538();
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

void sub_1000F1538()
{
  if (!qword_10015D050)
  {
    sub_10008A53C();
    unint64_t v0 = type metadata accessor for ScaledMetric();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10015D050);
    }
  }
}

uint64_t sub_1000F1594()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000F15B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v65 = a2;
  uint64_t v3 = type metadata accessor for UserInterfaceSizeClass();
  uint64_t v60 = *(void *)(v3 - 8);
  uint64_t v61 = v3;
  __chkstk_darwin(v3);
  uint64_t v57 = (char *)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = sub_1000060EC(&qword_1001589C8) - 8;
  __chkstk_darwin(v63);
  uint64_t v62 = (char *)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000060EC(&qword_100156930);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v58 = (uint64_t)&v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v66 = (uint64_t)&v56 - v10;
  __chkstk_darwin(v9);
  uint64_t v59 = (char *)&v56 - v11;
  uint64_t v12 = type metadata accessor for ShazamUpsellViewModel();
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v56 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for ShazamUpsellOverlay(0);
  uint64_t v16 = (int *)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v19 = (uint64_t *)((char *)&v56 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v56 - v20;
  uint64_t v22 = sub_1000060EC(&qword_10015D0A8);
  uint64_t v23 = v22 - 8;
  __chkstk_darwin(v22);
  uint64_t v25 = (char *)&v56 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_1000060EC(&qword_10015D0B0);
  __chkstk_darwin(v26 - 8);
  uint64_t v64 = (uint64_t)&v56 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = a1;
  sub_1000F22D0(a1, (uint64_t)v14, (uint64_t (*)(void))type metadata accessor for ShazamUpsellViewModel);
  uint64_t v28 = (uint64_t *)(a1 + *(int *)(type metadata accessor for ShazamUpsellOverlayModifier(0) + 20));
  uint64_t v30 = *v28;
  uint64_t v29 = v28[1];
  *uint64_t v19 = swift_getKeyPath();
  sub_1000060EC(&qword_100156940);
  swift_storeEnumTagMultiPayload();
  uint64_t v31 = (uint64_t *)((char *)v19 + v16[7]);
  *uint64_t v31 = swift_getKeyPath();
  sub_1000060EC(&qword_100156928);
  swift_storeEnumTagMultiPayload();
  sub_1000EF22C((uint64_t)v14, (uint64_t)v19 + v16[8], (uint64_t (*)(void))type metadata accessor for ShazamUpsellViewModel);
  uint64_t v32 = v16[9];
  uint64_t v33 = (uint64_t)v25;
  uint64_t v34 = (uint64_t)v59;
  uint64_t v35 = (uint64_t *)((char *)v19 + v32);
  *uint64_t v35 = v30;
  v35[1] = v29;
  sub_1000EF22C((uint64_t)v19, (uint64_t)v21, type metadata accessor for ShazamUpsellOverlay);
  uint64_t v36 = v30;
  uint64_t v38 = v60;
  uint64_t v37 = v61;
  sub_100017778(v36);
  sub_1000060EC(&qword_10015CFE0);
  ScaledMetric.wrappedValue.getter();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  sub_1000F22D0((uint64_t)v21, v33, type metadata accessor for ShazamUpsellOverlay);
  uint64_t v39 = *(int *)(v23 + 44);
  uint64_t v40 = v66;
  uint64_t v41 = (_OWORD *)(v33 + v39);
  long long v42 = v69;
  *uint64_t v41 = v68;
  v41[1] = v42;
  void v41[2] = v70;
  uint64_t v43 = (uint64_t)v21;
  uint64_t v44 = (uint64_t)v62;
  sub_1000F2338(v43, type metadata accessor for ShazamUpsellOverlay);
  sub_100008780(v34);
  (*(void (**)(uint64_t, void, uint64_t))(v38 + 104))(v40, enum case for UserInterfaceSizeClass.compact(_:), v37);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v38 + 56))(v40, 0, 1, v37);
  uint64_t v45 = v44 + *(int *)(v63 + 56);
  sub_100009C94(v34, v44, &qword_100156930);
  sub_100009C94(v40, v45, &qword_100156930);
  uint64_t v46 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v38 + 48);
  if (v46(v44, 1, v37) == 1)
  {
    sub_1000063D0(v40, &qword_100156930);
    sub_1000063D0(v34, &qword_100156930);
    int v47 = v46(v45, 1, v37);
    if (v47 == 1) {
      uint64_t v48 = &qword_100156930;
    }
    else {
      uint64_t v48 = &qword_1001589C8;
    }
    if (v47 == 1) {
      char v49 = -1;
    }
    else {
      char v49 = 0;
    }
  }
  else
  {
    uint64_t v50 = v58;
    sub_100009C94(v44, v58, &qword_100156930);
    if (v46(v45, 1, v37) == 1)
    {
      sub_1000063D0(v66, &qword_100156930);
      sub_1000063D0(v34, &qword_100156930);
      (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v50, v37);
      char v49 = 0;
      uint64_t v48 = &qword_1001589C8;
    }
    else
    {
      uint64_t v51 = v57;
      (*(void (**)(char *, uint64_t, uint64_t))(v38 + 32))(v57, v45, v37);
      sub_1000F2408(&qword_1001589D0, (void (*)(uint64_t))&type metadata accessor for UserInterfaceSizeClass);
      char v49 = dispatch thunk of static Equatable.== infix(_:_:)();
      uint64_t v52 = *(void (**)(char *, uint64_t))(v38 + 8);
      v52(v51, v37);
      uint64_t v48 = &qword_100156930;
      sub_1000063D0(v66, &qword_100156930);
      sub_1000063D0(v34, &qword_100156930);
      v52((char *)v50, v37);
    }
  }
  uint64_t v53 = sub_1000063D0(v44, v48);
  __chkstk_darwin(v53);
  *(&v56 - 2) = v67;
  uint64_t v54 = v64;
  sub_1000F1F88(v49 & 1, (void (*)(uint64_t))sub_1000F2398, v64);
  sub_1000063D0(v33, &qword_10015D0A8);
  return sub_1000F23A0(v54, v65);
}

double sub_1000F1D20@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for ColorScheme();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v22 - v9;
  sub_1000060EC(&qword_10015D0F0);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_1001118A0;
  type metadata accessor for ShazamUpsellOverlayModifier(0);
  sub_100008414((uint64_t)v10);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v8, enum case for ColorScheme.light(_:), v4);
  char v12 = static ColorScheme.== infix(_:_:)();
  uint64_t v13 = *(void (**)(char *, uint64_t))(v5 + 8);
  v13(v8, v4);
  v13(v10, v4);
  if (v12)
  {
    id v14 = [self systemGray6Color];
    uint64_t v15 = Color.init(uiColor:)();
  }
  else
  {
    uint64_t v15 = static Color.black.getter();
  }
  *(void *)(v11 + 32) = v15;
  *(void *)(v11 + 40) = static Color.clear.getter();
  uint64_t v23 = v11;
  specialized Array._endMutation()();
  Gradient.init(colors:)();
  static UnitPoint.bottom.getter();
  static UnitPoint.center.getter();
  LinearGradient.init(gradient:startPoint:endPoint:)();
  uint64_t v16 = v23;
  long long v22 = v24;
  uint64_t v17 = v25;
  uint64_t v18 = v26;
  char v19 = static Edge.Set.all.getter();
  sub_100009C94(a1, a2, &qword_10015D0A8);
  uint64_t v20 = a2 + *(int *)(sub_1000060EC(&qword_10015D0C0) + 36);
  *(void *)uint64_t v20 = v16;
  double result = *(double *)&v22;
  *(_OWORD *)(v20 + 8) = v22;
  *(void *)(v20 + 24) = v17;
  *(void *)(v20 + 32) = v18;
  *(unsigned char *)(v20 + 40) = v19;
  return result;
}

uint64_t sub_1000F1F88@<X0>(char a1@<W0>, void (*a2)(uint64_t)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  v19[1] = a3;
  uint64_t v7 = sub_1000060EC(&qword_10015D0A8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000060EC(&qword_10015D0B8);
  __chkstk_darwin(v10);
  char v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000060EC(&qword_10015D0C0);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    a2(v4);
    sub_100009C94((uint64_t)v15, (uint64_t)v12, &qword_10015D0C0);
    swift_storeEnumTagMultiPayload();
    sub_1000F2450();
    sub_1000F24F0();
    _ConditionalContent<>.init(storage:)();
    uint64_t v16 = (uint64_t)v15;
    uint64_t v17 = &qword_10015D0C0;
  }
  else
  {
    sub_100009C94(v4, (uint64_t)v9, &qword_10015D0A8);
    sub_100009C94((uint64_t)v9, (uint64_t)v12, &qword_10015D0A8);
    swift_storeEnumTagMultiPayload();
    sub_1000F2450();
    sub_1000F24F0();
    _ConditionalContent<>.init(storage:)();
    uint64_t v16 = (uint64_t)v9;
    uint64_t v17 = &qword_10015D0A8;
  }
  return sub_1000063D0(v16, v17);
}

uint64_t sub_1000F21B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = static HorizontalAlignment.center.getter();
  uint64_t v7 = a2 + *(int *)(sub_1000060EC(&qword_10015D090) + 36);
  sub_1000F15B0(v3, v7);
  VerticalEdge.rawValue.getter();
  LOBYTE(v3) = Edge.init(rawValue:)();
  uint64_t v8 = static SafeAreaRegions.container.getter();
  uint64_t v9 = v7 + *(int *)(sub_1000060EC(&qword_10015D098) + 36);
  *(void *)uint64_t v9 = v8;
  *(void *)(v9 + 8) = 0;
  *(unsigned char *)(v9 + 16) = 1;
  *(unsigned char *)(v9 + 17) = v3;
  *(void *)(v9 + 24) = v6;
  uint64_t v10 = sub_1000060EC(&qword_10015D0A0);
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);

  return v11(a2, a1, v10);
}

uint64_t type metadata accessor for ShazamUpsellOverlay(uint64_t a1)
{
  return sub_10009C0CC(a1, qword_10015D150);
}

uint64_t sub_1000F22D0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000F2338(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

double sub_1000F2398@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000F1D20(a1, a2);
}

uint64_t sub_1000F23A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000060EC(&qword_10015D0B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000F2408(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1000F2450()
{
  unint64_t result = qword_10015D0C8;
  if (!qword_10015D0C8)
  {
    sub_100006224(&qword_10015D0C0);
    sub_1000F24F0();
    sub_100006480(&qword_10015D0E0, &qword_10015D0E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015D0C8);
  }
  return result;
}

unint64_t sub_1000F24F0()
{
  unint64_t result = qword_10015D0D0;
  if (!qword_10015D0D0)
  {
    sub_100006224(&qword_10015D0A8);
    sub_1000F2408(&qword_10015D0D8, (void (*)(uint64_t))type metadata accessor for ShazamUpsellOverlay);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015D0D0);
  }
  return result;
}

void *sub_1000F259C(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    uint64_t v9 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_1000060EC(&qword_100156940);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = type metadata accessor for OpenURLAction();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v10 = *(int *)(a3 + 20);
    uint64_t v11 = (void *)((char *)a1 + v10);
    char v12 = (void *)((char *)a2 + v10);
    sub_1000060EC(&qword_100156928);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = type metadata accessor for UserInterfaceSizeClass();
      uint64_t v14 = *(void *)(v13 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
      {
        uint64_t v15 = sub_1000060EC(&qword_100156930);
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
      *uint64_t v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v51 = a3;
    uint64_t v52 = a2;
    uint64_t v16 = *(int *)(a3 + 24);
    uint64_t v17 = (void *)((char *)a1 + v16);
    uint64_t v18 = (void *)((char *)a2 + v16);
    uint64_t v53 = a1;
    uint64_t v19 = v18[1];
    *uint64_t v17 = *v18;
    v17[1] = v19;
    uint64_t v20 = v18[3];
    v17[2] = v18[2];
    v17[3] = v20;
    uint64_t v21 = (int *)type metadata accessor for ShazamUpsellViewModel();
    uint64_t v22 = v21[6];
    __dst = (char *)v17 + v22;
    uint64_t v23 = (char *)v18 + v22;
    uint64_t v24 = type metadata accessor for URL();
    uint64_t v25 = *(void *)(v24 - 8);
    uint64_t v26 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v49 = v25;
    if (v26(v23, 1, v24))
    {
      uint64_t v27 = sub_1000060EC((uint64_t *)&unk_100158FC0);
      memcpy(__dst, v23, *(void *)(*(void *)(v27 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v25 + 16))(__dst, v23, v24);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(__dst, 0, 1, v24);
    }
    uint64_t v28 = v21[7];
    uint64_t v29 = (void *)((char *)v17 + v28);
    uint64_t v30 = (void *)((char *)v18 + v28);
    uint64_t v31 = v30[1];
    *uint64_t v29 = *v30;
    v29[1] = v31;
    uint64_t v32 = v21[8];
    uint64_t v33 = (char *)v17 + v32;
    uint64_t v34 = (char *)v18 + v32;
    uint64_t v35 = *((void *)v34 + 1);
    *(void *)uint64_t v33 = *(void *)v34;
    *((void *)v33 + 1) = v35;
    v33[16] = v34[16];
    *((void *)v33 + 3) = *((void *)v34 + 3);
    uint64_t v36 = v21[9];
    uint64_t v37 = (char *)v17 + v36;
    uint64_t v38 = (char *)v18 + v36;
    uint64_t v39 = *((void *)v38 + 1);
    *(void *)uint64_t v37 = *(void *)v38;
    *((void *)v37 + 1) = v39;
    v37[16] = v38[16];
    *((void *)v37 + 3) = *((void *)v38 + 3);
    uint64_t v40 = v21[10];
    uint64_t v41 = (char *)v17 + v40;
    long long v42 = (char *)v18 + v40;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v26(v42, 1, v24))
    {
      uint64_t v43 = sub_1000060EC((uint64_t *)&unk_100158FC0);
      memcpy(v41, v42, *(void *)(*(void *)(v43 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v41, v42, v24);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v49 + 56))(v41, 0, 1, v24);
    }
    uint64_t v9 = v53;
    uint64_t v44 = *(int *)(v51 + 28);
    uint64_t v45 = (void *)((char *)v53 + v44);
    uint64_t v46 = (void *)((char *)v52 + v44);
    if (*v46)
    {
      uint64_t v47 = v46[1];
      *uint64_t v45 = *v46;
      v45[1] = v47;
      swift_retain();
    }
    else
    {
      *(_OWORD *)uint64_t v45 = *(_OWORD *)v46;
    }
  }
  return v9;
}

uint64_t sub_1000F2A8C(uint64_t a1, int *a2)
{
  sub_1000060EC(&qword_100156940);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = type metadata accessor for OpenURLAction();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + a2[5];
  sub_1000060EC(&qword_100156928);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for UserInterfaceSizeClass();
    uint64_t v7 = *(void *)(v6 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v8 = a1 + a2[6];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v9 = type metadata accessor for ShazamUpsellViewModel();
  uint64_t v10 = v8 + *(int *)(v9 + 24);
  uint64_t v11 = type metadata accessor for URL();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  if (!v13(v10, 1, v11)) {
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v14 = v8 + *(int *)(v9 + 40);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v13)(v14, 1, v11);
  if (!result) {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(v14, v11);
  }
  if (*(void *)(a1 + a2[7]))
  {
    return swift_release();
  }
  return result;
}

void *sub_1000F2D50(void *a1, void *a2, uint64_t a3)
{
  sub_1000060EC(&qword_100156940);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for OpenURLAction();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  sub_1000060EC(&qword_100156928);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = type metadata accessor for UserInterfaceSizeClass();
    uint64_t v11 = *(void *)(v10 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
    {
      uint64_t v12 = sub_1000060EC(&qword_100156930);
      memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
  }
  else
  {
    *uint64_t v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v47 = a3;
  uint64_t v48 = a2;
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  uint64_t v49 = a1;
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  uint64_t v17 = v15[3];
  v14[2] = v15[2];
  v14[3] = v17;
  uint64_t v18 = (int *)type metadata accessor for ShazamUpsellViewModel();
  uint64_t v19 = v18[6];
  __dst = (char *)v14 + v19;
  uint64_t v20 = (char *)v15 + v19;
  uint64_t v21 = type metadata accessor for URL();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v50 = v23;
  if (v23(v20, 1, v21))
  {
    uint64_t v24 = sub_1000060EC((uint64_t *)&unk_100158FC0);
    memcpy(__dst, v20, *(void *)(*(void *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v22 + 16))(__dst, v20, v21);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(__dst, 0, 1, v21);
  }
  uint64_t v25 = v18[7];
  uint64_t v26 = (void *)((char *)v14 + v25);
  uint64_t v27 = (void *)((char *)v15 + v25);
  uint64_t v28 = v27[1];
  *uint64_t v26 = *v27;
  v26[1] = v28;
  uint64_t v29 = v18[8];
  uint64_t v30 = (char *)v14 + v29;
  uint64_t v31 = (char *)v15 + v29;
  uint64_t v32 = *((void *)v31 + 1);
  *(void *)uint64_t v30 = *(void *)v31;
  *((void *)v30 + 1) = v32;
  v30[16] = v31[16];
  *((void *)v30 + 3) = *((void *)v31 + 3);
  uint64_t v33 = v18[9];
  uint64_t v34 = (char *)v14 + v33;
  uint64_t v35 = (char *)v15 + v33;
  uint64_t v36 = *((void *)v35 + 1);
  *(void *)uint64_t v34 = *(void *)v35;
  *((void *)v34 + 1) = v36;
  v34[16] = v35[16];
  *((void *)v34 + 3) = *((void *)v35 + 3);
  uint64_t v37 = v18[10];
  uint64_t v38 = (char *)v14 + v37;
  uint64_t v39 = (char *)v15 + v37;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v50(v39, 1, v21))
  {
    uint64_t v40 = sub_1000060EC((uint64_t *)&unk_100158FC0);
    memcpy(v38, v39, *(void *)(*(void *)(v40 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v38, v39, v21);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v38, 0, 1, v21);
  }
  uint64_t v41 = *(int *)(v47 + 28);
  long long v42 = (void *)((char *)v49 + v41);
  uint64_t v43 = (void *)((char *)v48 + v41);
  if (*v43)
  {
    uint64_t v44 = v43[1];
    *long long v42 = *v43;
    v42[1] = v44;
    swift_retain();
  }
  else
  {
    *(_OWORD *)long long v42 = *(_OWORD *)v43;
  }
  return v49;
}

void *sub_1000F31EC(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1000063D0((uint64_t)a1, &qword_100156940);
    sub_1000060EC(&qword_100156940);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = type metadata accessor for OpenURLAction();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v7 = *(int *)(a3 + 20);
    uint64_t v8 = (void *)((char *)a1 + v7);
    uint64_t v9 = (void *)((char *)a2 + v7);
    sub_1000063D0((uint64_t)a1 + v7, &qword_100156928);
    sub_1000060EC(&qword_100156928);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = type metadata accessor for UserInterfaceSizeClass();
      uint64_t v11 = *(void *)(v10 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
      {
        uint64_t v12 = sub_1000060EC(&qword_100156930);
        memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      }
    }
    else
    {
      *uint64_t v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v48 = a3;
  uint64_t v49 = a2;
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v50 = a1;
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  *(void *)uint64_t v14 = *(void *)((char *)a2 + v13);
  *((void *)v14 + 1) = *(void *)((char *)a2 + v13 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v14 + 2) = *((void *)v15 + 2);
  *((void *)v14 + 3) = *((void *)v15 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v16 = (int *)type metadata accessor for ShazamUpsellViewModel();
  uint64_t v17 = v16[6];
  uint64_t v18 = &v14[v17];
  uint64_t v19 = &v15[v17];
  uint64_t v20 = type metadata accessor for URL();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v21 + 48);
  int v23 = v22(v18, 1, v20);
  int v24 = v22(v19, 1, v20);
  if (v23)
  {
    if (!v24)
    {
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v18, v19, v20);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (v24)
  {
    (*(void (**)(char *, uint64_t))(v21 + 8))(v18, v20);
LABEL_16:
    uint64_t v25 = sub_1000060EC((uint64_t *)&unk_100158FC0);
    memcpy(v18, v19, *(void *)(*(void *)(v25 - 8) + 64));
    goto LABEL_17;
  }
  (*(void (**)(char *, char *, uint64_t))(v21 + 24))(v18, v19, v20);
LABEL_17:
  uint64_t v26 = v16[7];
  uint64_t v27 = &v14[v26];
  uint64_t v28 = &v15[v26];
  *(void *)uint64_t v27 = *(void *)v28;
  *((void *)v27 + 1) = *((void *)v28 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v29 = v16[8];
  uint64_t v30 = &v14[v29];
  uint64_t v31 = &v15[v29];
  *(void *)uint64_t v30 = *(void *)&v15[v29];
  *((void *)v30 + 1) = *(void *)&v15[v29 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v30[16] = v31[16];
  *((void *)v30 + 3) = *((void *)v31 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v32 = v16[9];
  uint64_t v33 = &v14[v32];
  uint64_t v34 = &v15[v32];
  *(void *)uint64_t v33 = *(void *)&v15[v32];
  *((void *)v33 + 1) = *(void *)&v15[v32 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v33[16] = v34[16];
  *((void *)v33 + 3) = *((void *)v34 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v35 = v16[10];
  uint64_t v36 = &v14[v35];
  uint64_t v37 = &v15[v35];
  LODWORD(v33) = v22(&v14[v35], 1, v20);
  int v38 = v22(v37, 1, v20);
  if (v33)
  {
    if (!v38)
    {
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v36, v37, v20);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v36, 0, 1, v20);
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  if (v38)
  {
    (*(void (**)(char *, uint64_t))(v21 + 8))(v36, v20);
LABEL_22:
    uint64_t v39 = sub_1000060EC((uint64_t *)&unk_100158FC0);
    memcpy(v36, v37, *(void *)(*(void *)(v39 - 8) + 64));
    goto LABEL_23;
  }
  (*(void (**)(char *, char *, uint64_t))(v21 + 24))(v36, v37, v20);
LABEL_23:
  uint64_t v40 = *(int *)(v48 + 28);
  uint64_t v41 = (void *)((char *)v50 + v40);
  long long v42 = (char *)v49 + v40;
  uint64_t v43 = *(void *)((char *)v50 + v40);
  uint64_t v44 = *(void *)((char *)v49 + v40);
  if (!v43)
  {
    if (v44)
    {
      uint64_t v46 = *((void *)v42 + 1);
      *uint64_t v41 = v44;
      v41[1] = v46;
      swift_retain();
      return v50;
    }
LABEL_29:
    *(_OWORD *)uint64_t v41 = *(_OWORD *)v42;
    return v50;
  }
  if (!v44)
  {
    swift_release();
    goto LABEL_29;
  }
  uint64_t v45 = *((void *)v42 + 1);
  *uint64_t v41 = v44;
  v41[1] = v45;
  swift_retain();
  swift_release();
  return v50;
}

char *sub_1000F37E8(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_1000060EC(&qword_100156940);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = type metadata accessor for OpenURLAction();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_1000060EC(&qword_100156928);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = type metadata accessor for UserInterfaceSizeClass();
    uint64_t v13 = *(void *)(v12 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v10, 1, v12))
    {
      uint64_t v14 = sub_1000060EC(&qword_100156930);
      memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v9, v10, v12);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v9, 0, 1, v12);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  uint64_t v45 = a2;
  uint64_t v15 = a3[6];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  long long v18 = *(_OWORD *)&a2[v15 + 16];
  *(_OWORD *)uint64_t v16 = *(_OWORD *)&a2[v15];
  *((_OWORD *)v16 + 1) = v18;
  uint64_t v19 = (int *)type metadata accessor for ShazamUpsellViewModel();
  uint64_t v20 = v19[6];
  uint64_t v21 = &v16[v20];
  uint64_t v22 = &v17[v20];
  uint64_t v23 = type metadata accessor for URL();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48);
  if (v25(v22, 1, v23))
  {
    uint64_t v26 = sub_1000060EC((uint64_t *)&unk_100158FC0);
    memcpy(v21, v22, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v21, v22, v23);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
  }
  *(_OWORD *)&v16[v19[7]] = *(_OWORD *)&v17[v19[7]];
  uint64_t v27 = v19[8];
  uint64_t v28 = &v16[v27];
  uint64_t v29 = &v17[v27];
  long long v30 = *((_OWORD *)v29 + 1);
  *(_OWORD *)uint64_t v28 = *(_OWORD *)v29;
  *((_OWORD *)v28 + 1) = v30;
  uint64_t v31 = v19[9];
  uint64_t v32 = &v16[v31];
  uint64_t v33 = &v17[v31];
  long long v34 = *((_OWORD *)v33 + 1);
  *(_OWORD *)uint64_t v32 = *(_OWORD *)v33;
  *((_OWORD *)v32 + 1) = v34;
  uint64_t v35 = v19[10];
  uint64_t v36 = &v16[v35];
  uint64_t v37 = &v17[v35];
  if (v25(&v17[v35], 1, v23))
  {
    uint64_t v38 = sub_1000060EC((uint64_t *)&unk_100158FC0);
    memcpy(v36, v37, *(void *)(*(void *)(v38 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v36, v37, v23);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v36, 0, 1, v23);
  }
  uint64_t v39 = a3[7];
  uint64_t v40 = &a1[v39];
  uint64_t v41 = &v45[v39];
  uint64_t v42 = *(void *)v41;
  if (*(void *)v41)
  {
    uint64_t v43 = *((void *)v41 + 1);
    *(void *)uint64_t v40 = v42;
    *((void *)v40 + 1) = v43;
  }
  else
  {
    *(_OWORD *)uint64_t v40 = *(_OWORD *)v41;
  }
  return a1;
}

char *sub_1000F3C0C(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1000063D0((uint64_t)a1, &qword_100156940);
    uint64_t v6 = sub_1000060EC(&qword_100156940);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = type metadata accessor for OpenURLAction();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    sub_1000063D0((uint64_t)&a1[v8], &qword_100156928);
    uint64_t v11 = sub_1000060EC(&qword_100156928);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = type metadata accessor for UserInterfaceSizeClass();
      uint64_t v13 = *(void *)(v12 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v10, 1, v12))
      {
        uint64_t v14 = sub_1000060EC(&qword_100156930);
        memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v9, v10, v12);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v9, 0, 1, v12);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
  }
  uint64_t v56 = a3;
  uint64_t v57 = a2;
  uint64_t v15 = *(int *)(a3 + 24);
  uint64_t v58 = a1;
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  uint64_t v18 = *(void *)&a2[v15 + 8];
  *(void *)uint64_t v16 = *(void *)&a2[v15];
  *((void *)v16 + 1) = v18;
  swift_bridgeObjectRelease();
  uint64_t v19 = *((void *)v17 + 3);
  *((void *)v16 + 2) = *((void *)v17 + 2);
  *((void *)v16 + 3) = v19;
  swift_bridgeObjectRelease();
  uint64_t v20 = (int *)type metadata accessor for ShazamUpsellViewModel();
  uint64_t v21 = v20[6];
  uint64_t v22 = &v16[v21];
  uint64_t v23 = &v17[v21];
  uint64_t v24 = type metadata accessor for URL();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v25 + 48);
  int v27 = v26(v22, 1, v24);
  int v28 = v26(v23, 1, v24);
  if (v27)
  {
    if (!v28)
    {
      (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v22, v23, v24);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (v28)
  {
    (*(void (**)(char *, uint64_t))(v25 + 8))(v22, v24);
LABEL_16:
    uint64_t v29 = sub_1000060EC((uint64_t *)&unk_100158FC0);
    memcpy(v22, v23, *(void *)(*(void *)(v29 - 8) + 64));
    goto LABEL_17;
  }
  (*(void (**)(char *, char *, uint64_t))(v25 + 40))(v22, v23, v24);
LABEL_17:
  uint64_t v30 = v20[7];
  uint64_t v31 = &v16[v30];
  uint64_t v32 = &v17[v30];
  uint64_t v34 = *(void *)v32;
  uint64_t v33 = *((void *)v32 + 1);
  *(void *)uint64_t v31 = v34;
  *((void *)v31 + 1) = v33;
  swift_bridgeObjectRelease();
  uint64_t v35 = v20[8];
  uint64_t v36 = &v16[v35];
  uint64_t v37 = &v17[v35];
  uint64_t v38 = *(void *)&v17[v35 + 8];
  *(void *)uint64_t v36 = *(void *)&v17[v35];
  *((void *)v36 + 1) = v38;
  swift_bridgeObjectRelease();
  v36[16] = v37[16];
  *((void *)v36 + 3) = *((void *)v37 + 3);
  swift_bridgeObjectRelease();
  uint64_t v39 = v20[9];
  uint64_t v40 = &v16[v39];
  uint64_t v41 = &v17[v39];
  uint64_t v42 = *(void *)&v17[v39 + 8];
  *(void *)uint64_t v40 = *(void *)&v17[v39];
  *((void *)v40 + 1) = v42;
  swift_bridgeObjectRelease();
  v40[16] = v41[16];
  *((void *)v40 + 3) = *((void *)v41 + 3);
  swift_bridgeObjectRelease();
  uint64_t v43 = v20[10];
  uint64_t v44 = &v16[v43];
  uint64_t v45 = &v17[v43];
  LODWORD(v41) = v26(&v16[v43], 1, v24);
  int v46 = v26(v45, 1, v24);
  if (v41)
  {
    if (!v46)
    {
      (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v44, v45, v24);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v44, 0, 1, v24);
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  if (v46)
  {
    (*(void (**)(char *, uint64_t))(v25 + 8))(v44, v24);
LABEL_22:
    uint64_t v47 = sub_1000060EC((uint64_t *)&unk_100158FC0);
    memcpy(v44, v45, *(void *)(*(void *)(v47 - 8) + 64));
    goto LABEL_23;
  }
  (*(void (**)(char *, char *, uint64_t))(v25 + 40))(v44, v45, v24);
LABEL_23:
  uint64_t v48 = *(int *)(v56 + 28);
  uint64_t v49 = &v58[v48];
  uint64_t v50 = &v57[v48];
  uint64_t v51 = *(void *)&v58[v48];
  uint64_t v52 = *(void *)&v57[v48];
  if (!v51)
  {
    if (v52)
    {
      uint64_t v54 = *((void *)v50 + 1);
      *(void *)uint64_t v49 = v52;
      *((void *)v49 + 1) = v54;
      return v58;
    }
LABEL_29:
    *(_OWORD *)uint64_t v49 = *(_OWORD *)v50;
    return v58;
  }
  if (!v52)
  {
    swift_release();
    goto LABEL_29;
  }
  uint64_t v53 = *((void *)v50 + 1);
  *(void *)uint64_t v49 = v52;
  *((void *)v49 + 1) = v53;
  swift_release();
  return v58;
}

uint64_t sub_1000F41B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000F41C4);
}

uint64_t sub_1000F41C4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000060EC(&qword_100156A08);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_8:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_1000060EC(&qword_1001585B0);
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = a3[5];
LABEL_7:
    uint64_t v10 = a1 + v13;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_8;
  }
  uint64_t v14 = type metadata accessor for ShazamUpsellViewModel();
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
  {
    uint64_t v8 = v14;
    uint64_t v12 = *(void *)(v14 - 8);
    uint64_t v13 = a3[6];
    goto LABEL_7;
  }
  unint64_t v16 = *(void *)(a1 + a3[7]);
  if (v16 >= 0xFFFFFFFF) {
    LODWORD(v16) = -1;
  }
  int v17 = v16 - 1;
  if (v17 < 0) {
    int v17 = -1;
  }
  return (v17 + 1);
}

uint64_t sub_1000F4338(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000F434C);
}

uint64_t sub_1000F434C(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_1000060EC(&qword_100156A08);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t v13 = sub_1000060EC(&qword_1001585B0);
    if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
    {
      uint64_t v10 = v13;
      uint64_t v14 = *(void *)(v13 - 8);
      uint64_t v15 = a4[5];
    }
    else
    {
      uint64_t result = type metadata accessor for ShazamUpsellViewModel();
      if (*(_DWORD *)(*(void *)(result - 8) + 84) != a3)
      {
        *(void *)(a1 + a4[7]) = a2;
        return result;
      }
      uint64_t v10 = result;
      uint64_t v14 = *(void *)(result - 8);
      uint64_t v15 = a4[6];
    }
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

void sub_1000F44B0()
{
  sub_1000F45D8(319, (unint64_t *)&qword_100156A78, (void (*)(uint64_t))&type metadata accessor for OpenURLAction);
  if (v0 <= 0x3F)
  {
    sub_1000562A0();
    if (v1 <= 0x3F)
    {
      type metadata accessor for ShazamUpsellViewModel();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_1000F45D8(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = type metadata accessor for Environment.Content();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

unint64_t sub_1000F4630()
{
  unint64_t result = qword_10015D190;
  if (!qword_10015D190)
  {
    sub_100006224(&qword_10015D090);
    sub_100006480(&qword_10015D198, &qword_10015D0A0);
    sub_100006480(&qword_10015D1A0, &qword_10015D098);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015D190);
  }
  return result;
}

uint64_t sub_1000F46F4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000F4714()
{
  uint64_t v1 = *(void *)(type metadata accessor for ShazamUpsellOverlay(0) - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_1000EEF10(v2);
}

uint64_t sub_1000F4778()
{
  uint64_t v1 = (int *)type metadata accessor for ShazamUpsellOverlay(0);
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v16 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v17 = (v2 + 16) & ~v2;
  uint64_t v18 = v0;
  uint64_t v3 = v0 + v17;
  sub_1000060EC(&qword_100156940);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = type metadata accessor for OpenURLAction();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = v3 + v1[5];
  sub_1000060EC(&qword_100156928);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for UserInterfaceSizeClass();
    uint64_t v7 = *(void *)(v6 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v8 = v3 + v1[6];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v9 = type metadata accessor for ShazamUpsellViewModel();
  uint64_t v10 = v8 + *(int *)(v9 + 24);
  uint64_t v11 = type metadata accessor for URL();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  if (!v13(v10, 1, v11)) {
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v14 = v8 + *(int *)(v9 + 40);
  if (!v13(v14, 1, v11)) {
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v14, v11);
  }
  if (*(void *)(v3 + v1[7])) {
    swift_release();
  }

  return _swift_deallocObject(v18, v17 + v16, v2 | 7);
}

uint64_t sub_1000F4A9C(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for ShazamUpsellOverlay(0) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_1000EF15C(a1, v4);
}

uint64_t sub_1000F4B0C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_100017778(v2);
  sub_100017778(v3);
  return a1;
}

uint64_t sub_1000F4B88()
{
  return sub_1000F4D24(&qword_10015D1C8, &qword_10015D1B0, (void (*)(void))sub_1000F4BB8);
}

unint64_t sub_1000F4BB8()
{
  unint64_t result = qword_10015D1D0;
  if (!qword_10015D1D0)
  {
    sub_100006224(&qword_10015D1A8);
    sub_1000F4C58();
    sub_100006480(&qword_10015A2C8, &qword_100157ED8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015D1D0);
  }
  return result;
}

unint64_t sub_1000F4C58()
{
  unint64_t result = qword_10015D1D8;
  if (!qword_10015D1D8)
  {
    sub_100006224(&qword_10015D1E0);
    sub_1000F4D24(&qword_10015D1E8, &qword_10015D1F0, (void (*)(void))sub_100077644);
    sub_100006480(&qword_10015D1F8, &qword_10015D200);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015D1D8);
  }
  return result;
}

uint64_t sub_1000F4D24(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100006224(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000F4DA0()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_1000F4E70()
{
  id result = [objc_allocWithZone((Class)UIColor) initWithRed:0.447058824 green:0.447058824 blue:0.447058824 alpha:0.6];
  qword_10015D208 = (uint64_t)result;
  return result;
}

int64x2_t sub_1000F4EC0()
{
  int64x2_t result = vdupq_n_s64(0x4042000000000000uLL);
  xmmword_10015D210 = (__int128)result;
  return result;
}

void sub_1000F4ED8()
{
  uint64_t v1 = v0;
  [v0 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC16MusicRecognition30AmbientCompactMatchingFlowView_imageView];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v1 addSubview:v2];
  uint64_t v3 = self;
  sub_1000060EC(&qword_100157030);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100110690;
  id v5 = [v2 centerXAnchor];
  id v6 = [v1 centerXAnchor];
  id v7 = [v5 constraintEqualToAnchor:v6];

  *(void *)(v4 + 32) = v7;
  id v8 = [v2 centerYAnchor];
  id v9 = [v1 centerYAnchor];
  id v10 = [v8 constraintEqualToAnchor:v9];

  *(void *)(v4 + 40) = v10;
  id v11 = [v2 heightAnchor];
  if (qword_1001565C8 != -1) {
    swift_once();
  }
  id v12 = objc_retainAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToConstant:", *((double *)&xmmword_10015D210
                                                                                           + 1)));

  *(void *)(v4 + 48) = v12;
  id v13 = [v2 widthAnchor];
  id v14 = [v13 constraintEqualToConstant:*(double *)&xmmword_10015D210];

  *(void *)(v4 + 56) = v14;
  specialized Array._endMutation()();
  sub_1000150F8(0, (unint64_t *)&qword_100157AD0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v3 activateConstraints:isa];
}

id sub_1000F524C(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR____TtC16MusicRecognition30AmbientCompactMatchingFlowView_imageView;
  id v5 = objc_allocWithZone((Class)UIImageView);
  id v6 = v1;
  *(void *)&v1[v4] = [v5 initWithFrame:0.0, 0.0, 0.0, 0.0];

  v11.receiver = v6;
  v11.super_class = ObjectType;
  id v7 = [super initWithCoder:a1];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
    sub_1000F4ED8();
  }
  return v8;
}

void sub_1000F5338()
{
  uint64_t v1 = v0;
  sub_1000060EC(&qword_100157030);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1001169B0;
  uint64_t v3 = self;
  *(void *)(v2 + 32) = [v3 whiteColor];
  *(void *)(v2 + 40) = [v3 whiteColor];
  if (qword_1001565C0 != -1) {
    swift_once();
  }
  uint64_t v4 = (void *)qword_10015D208;
  *(void *)(v2 + 48) = qword_10015D208;
  *(void *)&aBlock.a = v2;
  specialized Array._endMutation()();
  sub_1000150F8(0, (unint64_t *)&qword_100157678);
  id v5 = v4;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v7 = [self configurationWithPaletteColors:isa];

  id v8 = v7;
  NSString v9 = String._bridgeToObjectiveC()();
  id v10 = [self systemImageNamed:v9 withConfiguration:v8];

  objc_super v11 = *(void **)(v1 + OBJC_IVAR____TtC16MusicRecognition30AmbientCompactMatchingFlowView_imageView);
  [v11 setImage:v10];
  [v11 transform];
  CGAffineTransformScale(&v15, &aBlock, 0.9, 0.9);
  CGAffineTransform aBlock = v15;
  [v11 setTransform:&aBlock];
  id v12 = self;
  uint64_t v13 = swift_allocObject();
  swift_unknownObjectWeakInit();
  *(void *)&aBlock.tx = sub_1000F5738;
  *(void *)&aBlock.ty = v13;
  *(void *)&aBlock.a = _NSConcreteStackBlock;
  *(void *)&aBlock.b = 1107296256;
  *(void *)&aBlock.c = sub_1000D559C;
  *(void *)&aBlock.d = &unk_10014DDF0;
  id v14 = _Block_copy(&aBlock);
  swift_release();
  [v12 animateWithDuration:24 delay:v14 options:0 animations:1.2 completion:0.0];

  _Block_release(v14);
}

void sub_1000F5640()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    id v2 = *(id *)(Strong + OBJC_IVAR____TtC16MusicRecognition30AmbientCompactMatchingFlowView_imageView);

    v3[0] = 0x3FF0000000000000;
    v3[1] = 0;
    v3[2] = 0;
    v3[3] = 0x3FF0000000000000;
    v3[4] = 0;
    v3[5] = 0;
    [v2 setTransform:v3];
  }
}

uint64_t type metadata accessor for AmbientCompactMatchingFlowView()
{
  return self;
}

uint64_t sub_1000F5700()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000F5738()
{
}

uint64_t sub_1000F5740(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000F5750()
{
  return swift_release();
}

void sub_1000F5758()
{
  id v0 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 initWithSuiteName:v1];

  qword_10015D250 = (uint64_t)v2;
}

uint64_t initializeBufferWithCopyOfBuffer for LibraryItemDetailView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  id v4 = v3;
  return a1;
}

uint64_t assignWithCopy for LibraryItemDetailView(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

uint64_t assignWithTake for LibraryItemDetailView(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for LibraryItemDetailView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 9)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LibraryItemDetailView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)int64x2_t result = a2 ^ 0x80000000;
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
      *(void *)int64x2_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 9) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LibraryItemDetailView()
{
  return &type metadata for LibraryItemDetailView;
}

uint64_t sub_1000F5924()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_1000F5940()
{
  unk_10015D266 = -4864;
}

uint64_t sub_1000F5970@<X0>(void *a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_1000060EC(&qword_10015D270);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  NSString v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  objc_super v11 = (char *)&v26 - v10;
  uint64_t v12 = sub_1000060EC(&qword_10015D278);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  CGAffineTransform v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v18 = (char *)&v26 - v17;
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v26 - v19;
  uint64_t v21 = static HorizontalAlignment.leading.getter();
  uint64_t v22 = 0x3FF0000000000000;
  if (a2) {
    uint64_t v22 = 0x4000000000000000;
  }
  *(void *)uint64_t v18 = v21;
  *((void *)v18 + 1) = v22;
  v18[16] = 0;
  uint64_t v23 = sub_1000060EC(&qword_10015D280);
  sub_1000F5B90(a1, a2, (uint64_t)&v18[*(int *)(v23 + 44)]);
  sub_100009C30((uint64_t)v18, (uint64_t)v20, &qword_10015D278);
  sub_1000F67C4((uint64_t)v11);
  sub_100009C94((uint64_t)v20, (uint64_t)v15, &qword_10015D278);
  sub_100009C94((uint64_t)v11, (uint64_t)v9, &qword_10015D270);
  sub_100009C94((uint64_t)v15, a3, &qword_10015D278);
  uint64_t v24 = sub_1000060EC(&qword_10015D288);
  sub_100009C94((uint64_t)v9, a3 + *(int *)(v24 + 48), &qword_10015D270);
  sub_1000063D0((uint64_t)v11, &qword_10015D270);
  sub_1000063D0((uint64_t)v20, &qword_10015D278);
  sub_1000063D0((uint64_t)v9, &qword_10015D270);
  return sub_1000063D0((uint64_t)v15, &qword_10015D278);
}

uint64_t sub_1000F5B90@<X0>(void *a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v43 = a3;
  uint64_t v5 = sub_1000060EC(&qword_10015D2F0);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v44 = (uint64_t)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  NSString v9 = (char *)&v39 - v8;
  uint64_t v10 = sub_1000060EC(&qword_10015AD98);
  uint64_t v40 = *(void *)(v10 - 8);
  uint64_t v41 = (char *)v10;
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v42 = (uint64_t)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v39 - v13;
  uint64_t v15 = sub_1000060EC(&qword_10015D2F8);
  uint64_t v16 = __chkstk_darwin(v15 - 8);
  uint64_t v18 = (char *)&v39 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __chkstk_darwin(v16);
  uint64_t v21 = (char *)&v39 - v20;
  __chkstk_darwin(v19);
  uint64_t v23 = (char *)&v39 - v22;
  id v24 = [a1 title];
  if (v24)
  {
    uint64_t v25 = v24;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    *(void *)uint64_t v21 = static VerticalAlignment.center.getter();
    *((void *)v21 + 1) = 0x4014000000000000;
    v21[16] = 0;
    uint64_t v26 = sub_1000060EC(&qword_10015D310);
    sub_1000F705C(a1, a2 & 1, (uint64_t)&v21[*(int *)(v26 + 44)]);
    swift_bridgeObjectRelease();
    uint64_t v27 = sub_1000060EC(&qword_10015D300);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v21, 0, 1, v27);
  }
  else
  {
    uint64_t v28 = sub_1000060EC(&qword_10015D300);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v21, 1, 1, v28);
  }
  sub_100009C30((uint64_t)v21, (uint64_t)v23, &qword_10015D2F8);
  sub_1000F5FB8(a1, (uint64_t)v14);
  if (a2)
  {
    sub_1000F624C(a1, (uint64_t)v9);
    uint64_t v29 = 0;
  }
  else
  {
    uint64_t v29 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, char *))(v40 + 56))(v9, v29, 1, v41);
  sub_100009C94((uint64_t)v23, (uint64_t)v18, &qword_10015D2F8);
  uint64_t v30 = v42;
  sub_100009C94((uint64_t)v14, v42, &qword_10015AD98);
  uint64_t v31 = v44;
  sub_100009C94((uint64_t)v9, v44, &qword_10015D2F0);
  uint64_t v32 = (uint64_t)v18;
  uint64_t v41 = v18;
  uint64_t v33 = (uint64_t)v14;
  uint64_t v34 = v30;
  uint64_t v35 = v43;
  sub_100009C94(v32, v43, &qword_10015D2F8);
  uint64_t v36 = (uint64_t)v23;
  uint64_t v37 = sub_1000060EC(&qword_10015D308);
  sub_100009C94(v34, v35 + *(int *)(v37 + 48), &qword_10015AD98);
  sub_100009C94(v31, v35 + *(int *)(v37 + 64), &qword_10015D2F0);
  sub_1000063D0((uint64_t)v9, &qword_10015D2F0);
  sub_1000063D0(v33, &qword_10015AD98);
  sub_1000063D0(v36, &qword_10015D2F8);
  sub_1000063D0(v31, &qword_10015D2F0);
  sub_1000063D0(v34, &qword_10015AD98);
  return sub_1000063D0((uint64_t)v41, &qword_10015D2F8);
}

uint64_t sub_1000F5FB8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v4 = [a1 subtitle];
  if (v4 || (id v4 = [a1 artist]) != 0)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    static Font.caption.getter();
    uint64_t v5 = Text.font(_:)();
    uint64_t v7 = v6;
    char v9 = v8;
    swift_bridgeObjectRelease();
    swift_release();
    char v10 = v9 & 1;
    Color.init(_:bundle:)();
    uint64_t v11 = Text.foregroundStyle<A>(_:)();
    uint64_t v13 = v12;
    char v15 = v14;
    sub_10000E904(v5, v7, v10);
    swift_release();
    swift_bridgeObjectRelease();
    if (qword_100156348 != -1) {
      swift_once();
    }
    View.accessibilityIdentifier(_:)();
    sub_10000E904(v11, v13, v15 & 1);
    swift_bridgeObjectRelease();
    uint64_t v16 = sub_1000060EC(&qword_100158238);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(a2, 0, 1, v16);
  }
  else
  {
    uint64_t v18 = sub_1000060EC(&qword_100158238);
    uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    return v19(a2, 1, 1, v18);
  }
}

uint64_t sub_1000F624C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v52 = a2;
  uint64_t v3 = type metadata accessor for Date.FormatStyle.TimeStyle();
  uint64_t v48 = *(void *)(v3 - 8);
  uint64_t v49 = (char *)v3;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Date.FormatStyle.DateStyle();
  uint64_t v47 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  char v8 = (char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000060EC(&qword_100158238);
  uint64_t v50 = *(void *)(v9 - 8);
  uint64_t v51 = v9;
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000060EC(&qword_100157818);
  __chkstk_darwin(v12 - 8);
  char v14 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for Date();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v45 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v45 - v20;
  id v22 = [a1 creationDate];
  if (!v22)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v14, 1, 1, v15);
    goto LABEL_7;
  }
  uint64_t v23 = v22;
  int v46 = v11;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  id v24 = *(void (**)(char *, char *, uint64_t))(v16 + 32);
  v24(v14, v19, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v14, 0, 1, v15);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
  {
LABEL_7:
    sub_1000063D0((uint64_t)v14, &qword_100157818);
    uint64_t v43 = 1;
    uint64_t v42 = v52;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v50 + 56))(v42, v43, 1, v51);
  }
  v24(v21, v14, v15);
  static Date.FormatStyle.DateStyle.long.getter();
  static Date.FormatStyle.TimeStyle.shortened.getter();
  Date.formatted(date:time:)();
  (*(void (**)(char *, char *))(v48 + 8))(v5, v49);
  (*(void (**)(char *, uint64_t))(v47 + 8))(v8, v6);
  static Font.caption.getter();
  uint64_t v25 = Text.font(_:)();
  uint64_t v27 = v26;
  char v29 = v28;
  uint64_t v48 = v30;
  uint64_t v49 = v21;
  swift_bridgeObjectRelease();
  swift_release();
  char v31 = v29 & 1;
  uint64_t v53 = Color.init(_:bundle:)();
  uint64_t v32 = Text.foregroundStyle<A>(_:)();
  uint64_t v34 = v33;
  char v36 = v35;
  uint64_t v38 = v37;
  sub_10000E904(v25, v27, v31);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v53 = v32;
  uint64_t v54 = v34;
  char v39 = v36 & 1;
  char v55 = v36 & 1;
  uint64_t v56 = v38;
  if (qword_100156350 != -1) {
    swift_once();
  }
  uint64_t v40 = (uint64_t)v46;
  View.accessibilityIdentifier(_:)();
  sub_10000E904(v32, v34, v39);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v49, v15);
  uint64_t v41 = v40;
  uint64_t v42 = v52;
  sub_100009C30(v41, v52, &qword_100158238);
  uint64_t v43 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v50 + 56))(v42, v43, 1, v51);
}

uint64_t sub_1000F67C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1000060EC(&qword_1001571C0);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)v56 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000060EC(&qword_10015D290);
  __chkstk_darwin(v5 - 8);
  long long v70 = (char *)v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Font.TextStyle();
  uint64_t v68 = *(void *)(v7 - 8);
  uint64_t v69 = v7;
  __chkstk_darwin(v7);
  uint64_t v67 = (char *)v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_1000060EC(&qword_100157ED8);
  __chkstk_darwin(v62);
  uint64_t v10 = (char *)v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for RoundedRectangle();
  __chkstk_darwin(v11);
  uint64_t v13 = (_OWORD *)((char *)v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v61 = sub_1000060EC(&qword_10015D298);
  __chkstk_darwin(v61);
  uint64_t v15 = (char *)v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = sub_1000060EC(&qword_10015D2A0);
  __chkstk_darwin(v63);
  uint64_t v64 = (uint64_t)v56 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = sub_1000060EC(&qword_10015D2A8);
  __chkstk_darwin(v66);
  uint64_t v65 = (uint64_t)v56 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_1000060EC(&qword_10015D2B0);
  __chkstk_darwin(v60);
  uint64_t v71 = (char *)v56 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_1000060EC(&qword_10015D2B8);
  uint64_t v72 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  uint64_t v59 = (char *)v56 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SHLibrary();
  uint64_t v21 = static SHLibrary.localizedAttribution(for:)();
  if (v22)
  {
    uint64_t v23 = v21;
    uint64_t v24 = v22;
    v56[0] = v19;
    v56[1] = v2;
    uint64_t v57 = a1;
    int v58 = static Edge.Set.all.getter();
    id v25 = [self systemGray6Color];
    uint64_t v26 = Color.init(uiColor:)();
    char v27 = static Edge.Set.all.getter();
    char v28 = (char *)v13 + *(int *)(v11 + 20);
    uint64_t v29 = (uint64_t)v4;
    uint64_t v30 = enum case for RoundedCornerStyle.continuous(_:);
    uint64_t v31 = type metadata accessor for RoundedCornerStyle();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v31 - 8) + 104))(v28, v30, v31);
    __asm { FMOV            V0.2D, #4.0 }
    *uint64_t v13 = _Q0;
    sub_100027118((uint64_t)v13, (uint64_t)v10);
    *(_WORD *)&v10[*(int *)(v62 + 36)] = 256;
    sub_100009C94((uint64_t)v10, (uint64_t)&v15[*(int *)(v61 + 36)], &qword_100157ED8);
    *(void *)uint64_t v15 = v23;
    *((void *)v15 + 1) = v24;
    v15[16] = 0;
    *((void *)v15 + 3) = _swiftEmptyArrayStorage;
    v15[32] = v58;
    *(_OWORD *)(v15 + 40) = xmmword_1001169F0;
    *(_OWORD *)(v15 + 56) = xmmword_1001169F0;
    v15[72] = 0;
    *((void *)v15 + 10) = v26;
    v15[88] = v27;
    sub_10002FC24(v23, v24, 0);
    swift_bridgeObjectRetain();
    swift_retain();
    sub_1000063D0((uint64_t)v10, &qword_100157ED8);
    sub_10002717C((uint64_t)v13);
    sub_10000E904(v23, v24, 0);
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v38 = v67;
    uint64_t v37 = v68;
    uint64_t v39 = v69;
    (*(void (**)(char *, void, uint64_t))(v68 + 104))(v67, enum case for Font.TextStyle.caption2(_:), v69);
    uint64_t v40 = type metadata accessor for Font.Design();
    uint64_t v41 = (uint64_t)v70;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v70, 1, 1, v40);
    static Font.Weight.semibold.getter();
    uint64_t v42 = static Font.system(_:design:weight:)();
    sub_1000063D0(v41, &qword_10015D290);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v38, v39);
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v44 = v64;
    sub_100009C94((uint64_t)v15, v64, &qword_10015D298);
    uint64_t v45 = (uint64_t *)(v44 + *(int *)(v63 + 36));
    *uint64_t v45 = KeyPath;
    v45[1] = v42;
    sub_1000063D0((uint64_t)v15, &qword_10015D298);
    uint64_t v46 = Color.init(_:bundle:)();
    uint64_t v47 = v65;
    sub_100009C94(v44, v65, &qword_10015D2A0);
    *(void *)(v47 + *(int *)(v66 + 36)) = v46;
    sub_1000063D0(v44, &qword_10015D2A0);
    sub_1000F7A5C();
    uint64_t v48 = (uint64_t)v71;
    View.accessibilityIdentifier(_:)();
    sub_1000063D0(v47, &qword_10015D2A8);
    uint64_t v49 = enum case for DynamicTypeSize.xxxLarge(_:);
    uint64_t v50 = type metadata accessor for DynamicTypeSize();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 104))(v29, v49, v50);
    sub_10008A47C(&qword_100157258, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
    uint64_t result = dispatch thunk of static Equatable.== infix(_:_:)();
    if (result)
    {
      sub_1000F7CDC();
      sub_100006480(&qword_100157260, &qword_1001571C0);
      uint64_t v52 = v59;
      View.dynamicTypeSize<A>(_:)();
      sub_1000063D0(v29, &qword_1001571C0);
      sub_1000063D0(v48, &qword_10015D2B0);
      uint64_t v53 = v57;
      uint64_t v54 = v56[0];
      (*(void (**)(uint64_t, char *, void))(v72 + 32))(v57, v52, v56[0]);
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v72 + 56))(v53, 0, 1, v54);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    char v55 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v72 + 56);
    return v55(a1, 1, 1, v19);
  }
  return result;
}

uint64_t sub_1000F705C@<X0>(void *a1@<X2>, char a2@<W3>, uint64_t a3@<X8>)
{
  id v76 = a1;
  uint64_t v82 = a3;
  uint64_t v65 = sub_1000060EC(&qword_1001581E0);
  __chkstk_darwin(v65);
  uint64_t v67 = (uint64_t *)((char *)&v63 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = sub_1000060EC(&qword_100158200);
  __chkstk_darwin(v5 - 8);
  uint64_t v66 = (char *)&v63 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = sub_1000060EC(&qword_10015D318);
  __chkstk_darwin(v64);
  uint64_t v68 = (uint64_t *)((char *)&v63 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v70 = sub_1000060EC(&qword_10015D320);
  __chkstk_darwin(v70);
  uint64_t v69 = (uint64_t)&v63 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000060EC(&qword_10015D328);
  uint64_t v79 = *(void *)(v9 - 8);
  uint64_t v80 = v9;
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v72 = (char *)&v63 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v71 = (char *)&v63 - v12;
  uint64_t v13 = sub_1000060EC(&qword_10015D330);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  uint64_t v81 = (uint64_t)&v63 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v78 = (uint64_t)&v63 - v16;
  uint64_t v17 = sub_1000060EC(&qword_10015D338);
  uint64_t v18 = __chkstk_darwin(v17 - 8);
  uint64_t v77 = (uint64_t)&v63 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __chkstk_darwin(v18);
  char v74 = (char *)&v63 - v21;
  __chkstk_darwin(v20);
  uint64_t v75 = (uint64_t)&v63 - v22;
  swift_bridgeObjectRetain();
  static Font.callout.getter();
  static Font.Weight.semibold.getter();
  Font.weight(_:)();
  swift_release();
  uint64_t v23 = Text.font(_:)();
  uint64_t v25 = v24;
  char v27 = v26;
  swift_bridgeObjectRelease();
  swift_release();
  LODWORD(v83) = static HierarchicalShapeStyle.primary.getter();
  uint64_t v28 = Text.foregroundStyle<A>(_:)();
  uint64_t v30 = v29;
  char v32 = v31;
  uint64_t v34 = v33;
  sub_10000E904(v23, v25, v27 & 1);
  swift_bridgeObjectRelease();
  int v35 = a2 & 1;
  if (v35) {
    uint64_t v36 = 0;
  }
  else {
    uint64_t v36 = 2;
  }
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v38 = swift_getKeyPath();
  uint64_t v83 = v28;
  uint64_t v84 = v30;
  char v85 = v32 & 1;
  uint64_t v73 = v34;
  uint64_t v86 = v34;
  uint64_t v87 = KeyPath;
  uint64_t v88 = v36;
  char v89 = v35;
  uint64_t v90 = v38;
  char v91 = 0;
  if (qword_100156340 != -1) {
    swift_once();
  }
  sub_1000060EC(&qword_10015D340);
  sub_1000F7D98();
  uint64_t v39 = (uint64_t)v74;
  View.accessibilityIdentifier(_:)();
  sub_10000E904(v28, v30, v32 & 1);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v40 = v75;
  sub_100009C30(v39, v75, &qword_10015D338);
  if ([v76 explicitContent])
  {
    if (qword_1001565D8 != -1) {
      swift_once();
    }
    swift_bridgeObjectRetain();
    uint64_t v41 = Image.init(systemName:)();
    uint64_t v42 = static Font.caption.getter();
    uint64_t v43 = swift_getKeyPath();
    uint64_t v44 = (uint64_t)v66;
    static SymbolRenderingMode.palette.getter();
    uint64_t v45 = type metadata accessor for SymbolRenderingMode();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(v44, 0, 1, v45);
    uint64_t v46 = swift_getKeyPath();
    uint64_t v47 = v67;
    sub_100009C94(v44, (uint64_t)v67 + *(int *)(v65 + 28), &qword_100158200);
    *uint64_t v47 = v46;
    uint64_t v48 = v68;
    sub_100009C94((uint64_t)v47, (uint64_t)v68 + *(int *)(v64 + 36), &qword_1001581E0);
    *uint64_t v48 = v41;
    v48[1] = v43;
    v48[2] = v42;
    swift_retain();
    swift_retain();
    swift_retain();
    sub_1000063D0((uint64_t)v47, &qword_1001581E0);
    sub_1000063D0(v44, &qword_100158200);
    swift_release();
    swift_release();
    swift_release();
    uint64_t v49 = static Color.white.getter();
    uint64_t v50 = Color.init(_:bundle:)();
    uint64_t v51 = v69;
    sub_100009C94((uint64_t)v48, v69, &qword_10015D318);
    uint64_t v52 = (uint64_t *)(v51 + *(int *)(v70 + 36));
    uint64_t *v52 = v49;
    v52[1] = v50;
    sub_1000063D0((uint64_t)v48, &qword_10015D318);
    if (qword_100156358 != -1) {
      swift_once();
    }
    sub_1000F7E40();
    uint64_t v53 = (uint64_t)v72;
    View.accessibilityIdentifier(_:)();
    sub_1000063D0(v51, &qword_10015D320);
    LocalizedStringKey.init(_:)();
    uint64_t v54 = (uint64_t)v71;
    uint64_t v55 = v80;
    ModifiedContent<>.accessibilityLabel(_:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1000063D0(v53, &qword_10015D328);
    uint64_t v56 = v78;
    sub_100009C30(v54, v78, &qword_10015D328);
    uint64_t v57 = 0;
  }
  else
  {
    uint64_t v57 = 1;
    uint64_t v55 = v80;
    uint64_t v56 = v78;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v79 + 56))(v56, v57, 1, v55);
  uint64_t v58 = v77;
  sub_100009C94(v40, v77, &qword_10015D338);
  uint64_t v59 = v81;
  sub_100009C94(v56, v81, &qword_10015D330);
  uint64_t v60 = v82;
  sub_100009C94(v58, v82, &qword_10015D338);
  uint64_t v61 = sub_1000060EC(&qword_10015D350);
  sub_100009C94(v59, v60 + *(int *)(v61 + 48), &qword_10015D330);
  sub_1000063D0(v56, &qword_10015D330);
  sub_1000063D0(v40, &qword_10015D338);
  sub_1000063D0(v59, &qword_10015D330);
  return sub_1000063D0(v58, &qword_10015D338);
}

uint64_t sub_1000F7940@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1000060EC(&qword_100158CD8);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void **)v1;
  char v7 = *(unsigned char *)(v1 + 8);
  *(void *)uint64_t v5 = static HorizontalAlignment.leading.getter();
  *((void *)v5 + 1) = 0x4020000000000000;
  v5[16] = 0;
  uint64_t v8 = sub_1000060EC(&qword_10015D268);
  sub_1000F5970(v6, v7, (uint64_t)&v5[*(int *)(v8 + 44)]);
  uint64_t v9 = static Alignment.leading.getter();
  sub_100043774(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, a1, 0.0, 1, 0.0, 1, v9, v10);
  return sub_1000063D0((uint64_t)v5, &qword_100158CD8);
}

unint64_t sub_1000F7A5C()
{
  unint64_t result = qword_10015D2C0;
  if (!qword_10015D2C0)
  {
    sub_100006224(&qword_10015D2A8);
    sub_1000F7AFC();
    sub_100006480(&qword_1001572F8, (uint64_t *)&unk_100157300);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015D2C0);
  }
  return result;
}

unint64_t sub_1000F7AFC()
{
  unint64_t result = qword_10015D2C8;
  if (!qword_10015D2C8)
  {
    sub_100006224(&qword_10015D2A0);
    sub_1000F7B9C();
    sub_100006480(&qword_100156788, &qword_100156790);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015D2C8);
  }
  return result;
}

unint64_t sub_1000F7B9C()
{
  unint64_t result = qword_10015D2D0;
  if (!qword_10015D2D0)
  {
    sub_100006224(&qword_10015D298);
    sub_1000F7C3C();
    sub_100006480(&qword_10015A2C8, &qword_100157ED8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015D2D0);
  }
  return result;
}

unint64_t sub_1000F7C3C()
{
  unint64_t result = qword_10015D2D8;
  if (!qword_10015D2D8)
  {
    sub_100006224(&qword_10015D2E0);
    sub_10002FAA8();
    sub_100006480(&qword_10015A2B8, &qword_10015A2C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015D2D8);
  }
  return result;
}

unint64_t sub_1000F7CDC()
{
  unint64_t result = qword_10015D2E8;
  if (!qword_10015D2E8)
  {
    sub_100006224(&qword_10015D2B0);
    sub_1000F7A5C();
    sub_10008A47C((unint64_t *)&qword_1001567D8, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015D2E8);
  }
  return result;
}

unint64_t sub_1000F7D98()
{
  unint64_t result = qword_10015D348;
  if (!qword_10015D348)
  {
    sub_100006224(&qword_10015D340);
    sub_100017828();
    sub_100006480(&qword_100158470, &qword_100158478);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015D348);
  }
  return result;
}

unint64_t sub_1000F7E40()
{
  unint64_t result = qword_10015D358;
  if (!qword_10015D358)
  {
    sub_100006224(&qword_10015D320);
    sub_1000F7EE0();
    sub_100006480(&qword_100157BE8, &qword_100157BF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015D358);
  }
  return result;
}

unint64_t sub_1000F7EE0()
{
  unint64_t result = qword_10015D360;
  if (!qword_10015D360)
  {
    sub_100006224(&qword_10015D318);
    sub_1000F7F80();
    sub_100006480(&qword_1001581D8, &qword_1001581E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015D360);
  }
  return result;
}

unint64_t sub_1000F7F80()
{
  unint64_t result = qword_10015D368;
  if (!qword_10015D368)
  {
    sub_100006224(&qword_10015D370);
    sub_100006480(&qword_100156788, &qword_100156790);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015D368);
  }
  return result;
}

unint64_t sub_1000F8024()
{
  unint64_t result = qword_10015D378;
  if (!qword_10015D378)
  {
    sub_100006224(&qword_100158CE0);
    sub_100006480(qword_10015D380, &qword_100158CD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015D378);
  }
  return result;
}

uint64_t sub_1000F80C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  swift_retain();
  return a1;
}

uint64_t sub_1000F8100()
{
  return swift_release();
}

void *sub_1000F8108(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[2];
  a1[1] = a2[1];
  a1[2] = v3;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_1000F814C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  swift_release();
  return a1;
}

uint64_t type metadata accessor for SafeAreaModifier()
{
  return sub_100020608();
}

uint64_t sub_1000F81A0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000F81E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v28 = a3;
  uint64_t v29 = a4;
  uint64_t v27 = a2;
  uint64_t v30 = a1;
  uint64_t v31 = a7;
  uint64_t v25 = a6;
  type metadata accessor for SafeAreaModifier();
  swift_getWitnessTable();
  type metadata accessor for _ViewModifier_Content();
  sub_100006224(&qword_10015A4B0);
  type metadata accessor for _PreferenceWritingModifier();
  type metadata accessor for ModifiedContent();
  unint64_t v36 = sub_10008DC48();
  uint64_t WitnessTable = swift_getWitnessTable();
  char v26 = &protocol conformance descriptor for <> ModifiedContent<A, B>;
  swift_getWitnessTable();
  type metadata accessor for GeometryReader();
  v24[1] = swift_getWitnessTable();
  v24[2] = type metadata accessor for _BackgroundModifier();
  uint64_t v8 = type metadata accessor for ModifiedContent();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)v24 - v13;
  uint64_t v15 = (void *)swift_allocObject();
  uint64_t v16 = v25;
  v15[2] = a5;
  v15[3] = v16;
  uint64_t v17 = v28;
  v15[4] = v27;
  v15[5] = v17;
  v15[6] = v29;
  swift_retain();
  uint64_t v34 = GeometryReader.init(content:)();
  uint64_t v35 = v18;
  static Alignment.center.getter();
  uint64_t v19 = swift_getWitnessTable();
  View.background<A>(_:alignment:)();
  swift_release();
  uint64_t v20 = swift_getWitnessTable();
  uint64_t v32 = v19;
  uint64_t v33 = v20;
  uint64_t v21 = swift_getWitnessTable();
  sub_1000BA728(v12, v8, v21);
  uint64_t v22 = *(void (**)(char *, uint64_t))(v9 + 8);
  v22(v12, v8);
  sub_1000BA728(v14, v8, v21);
  return ((uint64_t (*)(char *, uint64_t))v22)(v14, v8);
}

uint64_t sub_1000F853C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void (*a3)(uint64_t)@<X2>, uint64_t a4@<X3>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  v24[4] = a4;
  uint64_t v26 = a2;
  uint64_t v27 = a6;
  v24[2] = a1;
  v24[1] = a5;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  __chkstk_darwin(AssociatedTypeWitness);
  uint64_t v9 = (char *)v24 - v8;
  sub_100006224(&qword_10015A4B0);
  void v24[3] = type metadata accessor for _PreferenceWritingModifier();
  uint64_t v10 = type metadata accessor for ModifiedContent();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)v24 - v15;
  uint64_t v17 = static Color.clear.getter();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v31 = v17;
  uint64_t v18 = GeometryProxy.safeAreaInsets.getter();
  a3(v18);
  unint64_t v19 = sub_10008DC48();
  View.preference<A>(key:value:)();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, AssociatedTypeWitness);
  swift_release();
  swift_release();
  uint64_t WitnessTable = swift_getWitnessTable();
  unint64_t v28 = v19;
  uint64_t v29 = WitnessTable;
  uint64_t v21 = swift_getWitnessTable();
  sub_1000BA728(v14, v10, v21);
  uint64_t v22 = *(void (**)(char *, uint64_t))(v11 + 8);
  v22(v14, v10);
  sub_1000BA728(v16, v10, v21);
  return ((uint64_t (*)(char *, uint64_t))v22)(v16, v10);
}

uint64_t sub_1000F8808@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_1000F81E4(a1, *v3, v3[1], v3[2], *(void *)(a2 + 16), *(void *)(a2 + 24), a3);
}

uint64_t sub_1000F881C()
{
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1000F8854@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000F853C(a1, *(void *)(v2 + 32), *(void (**)(uint64_t))(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 24), a2);
}

uint64_t sub_1000F8864@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000F8890@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000F88BC()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_1000F88E8()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_1000F8914()
{
  return swift_getWitnessTable();
}

void *sub_1000F8AB8(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (void *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 2u:
      case 4u:
      case 5u:
      case 6u:
        uint64_t v13 = a2[1];
        *a1 = *a2;
        a1[1] = v13;
        swift_retain();
        break;
      case 3u:
      case 7u:
        uint64_t v12 = type metadata accessor for URL();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(a1, a2, v12);
        break;
      case 8u:
        uint64_t v14 = a2[1];
        *a1 = *a2;
        a1[1] = v14;
        uint64_t v15 = (int *)type metadata accessor for StreamingService();
        uint64_t v16 = v15[5];
        uint64_t v17 = (char *)a1 + v16;
        uint64_t v18 = (char *)a2 + v16;
        uint64_t v19 = type metadata accessor for URL();
        uint64_t v20 = *(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16);
        swift_bridgeObjectRetain();
        v20(v17, v18, v19);
        uint64_t v21 = v15[6];
        uint64_t v22 = (void *)((char *)a1 + v21);
        uint64_t v23 = (void *)((char *)a2 + v21);
        uint64_t v24 = v23[1];
        *uint64_t v22 = *v23;
        v22[1] = v24;
        uint64_t v25 = v15[7];
        uint64_t v26 = (void *)((char *)a1 + v25);
        uint64_t v27 = (void *)((char *)a2 + v25);
        uint64_t v28 = v27[1];
        *uint64_t v26 = *v27;
        v26[1] = v28;
        *((unsigned char *)a1 + v15[8]) = *((unsigned char *)a2 + v15[8]);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        break;
      default:
        uint64_t v6 = type metadata accessor for URL();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
        uint64_t v7 = *(int *)(sub_1000060EC(&qword_10015AA80) + 48);
        uint64_t v8 = (void *)((char *)a1 + v7);
        uint64_t v9 = (void *)((char *)a2 + v7);
        uint64_t v10 = v9[1];
        *uint64_t v8 = *v9;
        v8[1] = v10;
        swift_retain();
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_1000F8E48(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
    case 1:
      uint64_t v3 = type metadata accessor for URL();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
      sub_1000060EC(&qword_10015AA80);
      goto LABEL_3;
    case 2:
    case 4:
    case 5:
    case 6:
LABEL_3:
      uint64_t result = swift_release();
      break;
    case 3:
    case 7:
      uint64_t v4 = type metadata accessor for URL();
      int v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
      uint64_t result = v5(a1, v4);
      break;
    case 8:
      swift_bridgeObjectRelease();
      uint64_t v6 = a1 + *(int *)(type metadata accessor for StreamingService() + 20);
      uint64_t v7 = type metadata accessor for URL();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

void *sub_1000F9020(void *a1, void *a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 2u:
    case 4u:
    case 5u:
    case 6u:
      uint64_t v10 = a2[1];
      *a1 = *a2;
      a1[1] = v10;
      swift_retain();
      break;
    case 3u:
    case 7u:
      uint64_t v9 = type metadata accessor for URL();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
      break;
    case 8u:
      uint64_t v11 = a2[1];
      *a1 = *a2;
      a1[1] = v11;
      uint64_t v12 = (int *)type metadata accessor for StreamingService();
      uint64_t v13 = v12[5];
      uint64_t v14 = (char *)a1 + v13;
      uint64_t v15 = (char *)a2 + v13;
      uint64_t v16 = type metadata accessor for URL();
      uint64_t v17 = *(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16);
      swift_bridgeObjectRetain();
      v17(v14, v15, v16);
      uint64_t v18 = v12[6];
      uint64_t v19 = (void *)((char *)a1 + v18);
      uint64_t v20 = (void *)((char *)a2 + v18);
      uint64_t v21 = v20[1];
      *uint64_t v19 = *v20;
      v19[1] = v21;
      uint64_t v22 = v12[7];
      uint64_t v23 = (void *)((char *)a1 + v22);
      uint64_t v24 = (void *)((char *)a2 + v22);
      uint64_t v25 = v24[1];
      *uint64_t v23 = *v24;
      v23[1] = v25;
      *((unsigned char *)a1 + v12[8]) = *((unsigned char *)a2 + v12[8]);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      break;
    default:
      uint64_t v4 = type metadata accessor for URL();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
      uint64_t v5 = *(int *)(sub_1000060EC(&qword_10015AA80) + 48);
      uint64_t v6 = (void *)((char *)a1 + v5);
      uint64_t v7 = (void *)((char *)a2 + v5);
      uint64_t v8 = v7[1];
      *uint64_t v6 = *v7;
      v6[1] = v8;
      swift_retain();
      break;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_1000F9360(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_10009B1A0((uint64_t)a1);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 2u:
      case 4u:
      case 5u:
      case 6u:
        uint64_t v10 = a2[1];
        *a1 = *a2;
        a1[1] = v10;
        swift_retain();
        break;
      case 3u:
      case 7u:
        uint64_t v9 = type metadata accessor for URL();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
        break;
      case 8u:
        *a1 = *a2;
        a1[1] = a2[1];
        uint64_t v11 = (int *)type metadata accessor for StreamingService();
        uint64_t v12 = v11[5];
        uint64_t v13 = (char *)a1 + v12;
        uint64_t v14 = (char *)a2 + v12;
        uint64_t v15 = type metadata accessor for URL();
        uint64_t v16 = *(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16);
        swift_bridgeObjectRetain();
        v16(v13, v14, v15);
        uint64_t v17 = v11[6];
        uint64_t v18 = (void *)((char *)a1 + v17);
        uint64_t v19 = (void *)((char *)a2 + v17);
        void *v18 = *v19;
        v18[1] = v19[1];
        uint64_t v20 = v11[7];
        uint64_t v21 = (void *)((char *)a1 + v20);
        uint64_t v22 = (void *)((char *)a2 + v20);
        *uint64_t v21 = *v22;
        v21[1] = v22[1];
        *((unsigned char *)a1 + v11[8]) = *((unsigned char *)a2 + v11[8]);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        break;
      default:
        uint64_t v4 = type metadata accessor for URL();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
        uint64_t v5 = *(int *)(sub_1000060EC(&qword_10015AA80) + 48);
        uint64_t v6 = (void *)((char *)a1 + v5);
        uint64_t v7 = (void *)((char *)a2 + v5);
        uint64_t v8 = v7[1];
        *uint64_t v6 = *v7;
        v6[1] = v8;
        swift_retain();
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t _s6ActionOMa(uint64_t a1)
{
  return sub_10009C0CC(a1, qword_10015D478);
}

_OWORD *sub_1000F96E8(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 1u:
      uint64_t v6 = type metadata accessor for URL();
      (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      uint64_t v7 = sub_1000060EC(&qword_10015AA80);
      *(_OWORD *)((char *)a1 + *(int *)(v7 + 48)) = *(_OWORD *)((char *)a2 + *(int *)(v7 + 48));
      goto LABEL_6;
    case 3u:
    case 7u:
      uint64_t v8 = type metadata accessor for URL();
      (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
      goto LABEL_6;
    case 8u:
      *a1 = *a2;
      uint64_t v9 = (int *)type metadata accessor for StreamingService();
      uint64_t v10 = v9[5];
      uint64_t v11 = (char *)a1 + v10;
      uint64_t v12 = (char *)a2 + v10;
      uint64_t v13 = type metadata accessor for URL();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
      *(_OWORD *)((char *)a1 + v9[6]) = *(_OWORD *)((char *)a2 + v9[6]);
      *(_OWORD *)((char *)a1 + v9[7]) = *(_OWORD *)((char *)a2 + v9[7]);
      *((unsigned char *)a1 + v9[8]) = *((unsigned char *)a2 + v9[8]);
LABEL_6:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

_OWORD *sub_1000F9994(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_10009B1A0((uint64_t)a1);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 1u:
        uint64_t v6 = type metadata accessor for URL();
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
        uint64_t v7 = sub_1000060EC(&qword_10015AA80);
        *(_OWORD *)((char *)a1 + *(int *)(v7 + 48)) = *(_OWORD *)((char *)a2 + *(int *)(v7 + 48));
        goto LABEL_7;
      case 3u:
      case 7u:
        uint64_t v8 = type metadata accessor for URL();
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
        goto LABEL_7;
      case 8u:
        *a1 = *a2;
        uint64_t v9 = (int *)type metadata accessor for StreamingService();
        uint64_t v10 = v9[5];
        uint64_t v11 = (char *)a1 + v10;
        uint64_t v12 = (char *)a2 + v10;
        uint64_t v13 = type metadata accessor for URL();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
        *(_OWORD *)((char *)a1 + v9[6]) = *(_OWORD *)((char *)a2 + v9[6]);
        *(_OWORD *)((char *)a1 + v9[7]) = *(_OWORD *)((char *)a2 + v9[7]);
        *((unsigned char *)a1 + v9[8]) = *((unsigned char *)a2 + v9[8]);
LABEL_7:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

uint64_t sub_1000F9C50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_1000F9C78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_1000F9CA4()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_1000F9CB4()
{
  uint64_t result = type metadata accessor for URL();
  if (v1 <= 0x3F)
  {
    uint64_t v2 = *(void *)(result - 8) + 64;
    swift_getTupleTypeLayout2();
    uint64_t v6 = &v5;
    swift_getTupleTypeLayout2();
    uint64_t v7 = &v4;
    uint64_t v8 = (char *)&value witness table for () + 64;
    uint64_t v9 = v2;
    uint64_t v10 = (char *)&value witness table for () + 64;
    uint64_t v11 = (char *)&value witness table for () + 64;
    uint64_t v12 = (char *)&value witness table for () + 64;
    uint64_t v13 = v2;
    uint64_t result = type metadata accessor for StreamingService();
    if (v3 <= 0x3F)
    {
      uint64_t v14 = *(void *)(result - 8) + 64;
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_1000F9DC4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_1000FA940(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for ButtonRole);
}

uint64_t sub_1000F9DDC(uint64_t a1, uint64_t a2)
{
  return sub_1000FAA78(a1, a2, (uint64_t (*)(void))&type metadata accessor for ButtonRole);
}

void *sub_1000F9DF4(void *a1, void *a2, uint64_t a3)
{
  return sub_1000FAB30(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for ButtonRole);
}

void *sub_1000F9E0C(void *a1, void *a2, uint64_t a3)
{
  return sub_1000FAC1C(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for ButtonRole);
}

_OWORD *sub_1000F9E24(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  return sub_1000FAD24(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for ButtonRole);
}

void *sub_1000F9E3C(void *a1, void *a2, uint64_t a3)
{
  return sub_1000FADD8(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for ButtonRole);
}

uint64_t sub_1000F9E54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000F9E68);
}

uint64_t sub_1000F9E68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000FAEC8(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for ButtonRole);
}

uint64_t sub_1000F9E80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000F9E94);
}

uint64_t sub_1000F9E94(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return sub_1000FAFA8(a1, a2, a3, a4, (uint64_t (*)(void))&type metadata accessor for ButtonRole);
}

uint64_t type metadata accessor for SyncAction(uint64_t a1)
{
  return sub_10009C0CC(a1, qword_10015D508);
}

uint64_t sub_1000F9ECC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000FB08C(a1, a2, a3, (uint64_t (*)(uint64_t))&type metadata accessor for ButtonRole);
}

uint64_t sub_1000F9EE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000F9EF8);
}

uint64_t sub_1000F9EF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000FAEC8(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for ButtonRole);
}

uint64_t sub_1000F9F10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000F9F24);
}

uint64_t sub_1000F9F24(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return sub_1000FAFA8(a1, a2, a3, a4, (uint64_t (*)(void))&type metadata accessor for ButtonRole);
}

uint64_t type metadata accessor for AsyncThrowingAction(uint64_t a1)
{
  return sub_10009C0CC(a1, qword_10015D5A0);
}

uint64_t *sub_1000F9F5C(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_1000060EC(&qword_100156940);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = type metadata accessor for OpenURLAction();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = a3[6];
    uint64_t v11 = (uint64_t *)((char *)a1 + v9);
    uint64_t v12 = (uint64_t *)((char *)a2 + v9);
    uint64_t v13 = v12[1];
    *uint64_t v11 = *v12;
    v11[1] = v13;
    uint64_t v14 = (uint64_t *)((char *)a1 + v10);
    uint64_t v15 = (uint64_t *)((char *)a2 + v10);
    uint64_t v16 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v16;
    uint64_t v17 = a3[7];
    uint64_t v18 = (char *)a1 + v17;
    uint64_t v19 = (char *)a2 + v17;
    uint64_t v20 = type metadata accessor for URL();
    uint64_t v21 = *(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v21(v18, v19, v20);
  }
  return a1;
}

uint64_t sub_1000FA0FC(uint64_t a1, uint64_t a2)
{
  sub_1000060EC(&qword_100156940);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = type metadata accessor for OpenURLAction();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = a1 + *(int *)(a2 + 28);
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

void *sub_1000FA1F0(void *a1, void *a2, int *a3)
{
  sub_1000060EC(&qword_100156940);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for OpenURLAction();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)((char *)a1 + v7);
  uint64_t v10 = (void *)((char *)a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = (void *)((char *)a1 + v8);
  uint64_t v13 = (void *)((char *)a2 + v8);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  uint64_t v15 = a3[7];
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = type metadata accessor for URL();
  uint64_t v19 = *(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v19(v16, v17, v18);
  return a1;
}

void *sub_1000FA340(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_1000FA4B0((uint64_t)a1);
    sub_1000060EC(&qword_100156940);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = type metadata accessor for OpenURLAction();
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
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[7];
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = type metadata accessor for URL();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 24))(v14, v15, v16);
  return a1;
}

uint64_t sub_1000FA4B0(uint64_t a1)
{
  uint64_t v2 = sub_1000060EC(&qword_100156940);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *sub_1000FA510(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_1000060EC(&qword_100156940);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = type metadata accessor for OpenURLAction();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[6];
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  *(_OWORD *)&a1[v8] = *(_OWORD *)&a2[v8];
  uint64_t v9 = a3[7];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = type metadata accessor for URL();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  return a1;
}

char *sub_1000FA634(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_1000FA4B0((uint64_t)a1);
    uint64_t v6 = sub_1000060EC(&qword_100156940);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = type metadata accessor for OpenURLAction();
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
  uint64_t v12 = *(void *)v10;
  uint64_t v11 = *((void *)v10 + 1);
  *(void *)uint64_t v9 = v12;
  *((void *)v9 + 1) = v11;
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[6];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v17 = *(void *)v15;
  uint64_t v16 = *((void *)v15 + 1);
  *(void *)uint64_t v14 = v17;
  *((void *)v14 + 1) = v16;
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[7];
  uint64_t v19 = &a1[v18];
  uint64_t v20 = &a2[v18];
  uint64_t v21 = type metadata accessor for URL();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 40))(v19, v20, v21);
  return a1;
}

uint64_t sub_1000FA78C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000FA7A0);
}

uint64_t sub_1000FA7A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000FA7B8);
}

uint64_t type metadata accessor for _OpenAction(uint64_t a1)
{
  return sub_10009C0CC(a1, qword_10015D638);
}

void sub_1000FA7DC()
{
  sub_10000B6DC();
  if (v0 <= 0x3F)
  {
    type metadata accessor for URL();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t sub_1000FA8B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000FA8C4);
}

uint64_t sub_1000FA8C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000FAEC8(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for ButtonRole);
}

uint64_t sub_1000FA8DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000FA8F0);
}

uint64_t sub_1000FA8F0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return sub_1000FAFA8(a1, a2, a3, a4, (uint64_t (*)(void))&type metadata accessor for ButtonRole);
}

uint64_t type metadata accessor for AsyncAction(uint64_t a1)
{
  return sub_10009C0CC(a1, qword_10015D6D0);
}

uint64_t *sub_1000FA928(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_1000FA940(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for URL);
}

uint64_t *sub_1000FA940(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v5 = a1;
  int v6 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v6 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    uint64_t *v5 = *a2;
    uint64_t v5 = (uint64_t *)(v19 + ((v6 + 16) & ~(unint64_t)v6));
  }
  else
  {
    uint64_t v8 = a2[1];
    *a1 = *a2;
    a1[1] = v8;
    uint64_t v9 = a2[3];
    a1[2] = a2[2];
    a1[3] = v9;
    uint64_t v10 = *(int *)(a3 + 24);
    uint64_t v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    uint64_t v13 = a4(0);
    uint64_t v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14(v11, v12, v13);
    uint64_t v15 = *(int *)(a3 + 28);
    uint64_t v16 = (uint64_t *)((char *)v5 + v15);
    uint64_t v17 = (uint64_t *)((char *)a2 + v15);
    uint64_t v18 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v18;
  }
  swift_retain();
  return v5;
}

uint64_t sub_1000FAA60(uint64_t a1, uint64_t a2)
{
  return sub_1000FAA78(a1, a2, (uint64_t (*)(void))&type metadata accessor for URL);
}

uint64_t sub_1000FAA78(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = a1 + *(int *)(a2 + 24);
  uint64_t v7 = a3(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);

  return swift_release();
}

void *sub_1000FAB18(void *a1, void *a2, uint64_t a3)
{
  return sub_1000FAB30(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for URL);
}

void *sub_1000FAB30(void *a1, void *a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v7 = a2[1];
  *a1 = *a2;
  a1[1] = v7;
  uint64_t v8 = a2[3];
  a1[2] = a2[2];
  a1[3] = v8;
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = a4(0);
  uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13(v10, v11, v12);
  uint64_t v14 = *(int *)(a3 + 28);
  uint64_t v15 = (void *)((char *)a1 + v14);
  uint64_t v16 = (void *)((char *)a2 + v14);
  uint64_t v17 = v16[1];
  void *v15 = *v16;
  v15[1] = v17;
  swift_retain();
  return a1;
}

void *sub_1000FAC04(void *a1, void *a2, uint64_t a3)
{
  return sub_1000FAC1C(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for URL);
}

void *sub_1000FAC1C(void *a1, void *a2, uint64_t a3, uint64_t (*a4)(void))
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = a4(0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 24))(v9, v10, v11);
  uint64_t v12 = *(int *)(a3 + 28);
  uint64_t v13 = (void *)((char *)a1 + v12);
  uint64_t v14 = (void *)((char *)a2 + v12);
  uint64_t v15 = v14[1];
  *uint64_t v13 = *v14;
  v13[1] = v15;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_1000FAD0C(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  return sub_1000FAD24(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for URL);
}

_OWORD *sub_1000FAD24(_OWORD *a1, _OWORD *a2, uint64_t a3, uint64_t (*a4)(void))
{
  long long v7 = a2[1];
  *a1 = *a2;
  a1[1] = v7;
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = a4(0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 28)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 28));
  return a1;
}

void *sub_1000FADC0(void *a1, void *a2, uint64_t a3)
{
  return sub_1000FADD8(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for URL);
}

void *sub_1000FADD8(void *a1, void *a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v8 = a2[1];
  *a1 = *a2;
  a1[1] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a2[3];
  a1[2] = a2[2];
  a1[3] = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = a4(0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 28)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 28));
  swift_release();
  return a1;
}

uint64_t sub_1000FAE9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000FAEB0);
}

uint64_t sub_1000FAEB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000FAEC8(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for URL);
}

uint64_t sub_1000FAEC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v5 = *(void *)(a1 + 8);
    if (v5 >= 0xFFFFFFFF) {
      LODWORD(v5) = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = a4(0);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = a1 + *(int *)(a3 + 24);
    return v10(v12, a2, v11);
  }
}

uint64_t sub_1000FAF7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000FAF90);
}

uint64_t sub_1000FAF90(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return sub_1000FAFA8(a1, a2, a3, a4, (uint64_t (*)(void))&type metadata accessor for URL);
}

uint64_t sub_1000FAFA8(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v6 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = a5(0);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
    uint64_t v10 = v8;
    uint64_t v11 = v6 + *(int *)(a4 + 24);
    return v9(v11, a2, a2, v10);
  }
  return result;
}

uint64_t type metadata accessor for ShareAction(uint64_t a1)
{
  return sub_10009C0CC(a1, qword_10015D768);
}

uint64_t sub_1000FB074(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000FB08C(a1, a2, a3, (uint64_t (*)(uint64_t))&type metadata accessor for URL);
}

uint64_t sub_1000FB08C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t result = a4(319);
  if (v5 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1000FB134(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    sub_1000060EC(&qword_100156940);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = type metadata accessor for OpenURLAction();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = a3[6];
    uint64_t v11 = (uint64_t *)((char *)a1 + v9);
    uint64_t v12 = (uint64_t *)((char *)a2 + v9);
    uint64_t v13 = v12[1];
    *uint64_t v11 = *v12;
    v11[1] = v13;
    uint64_t v14 = (uint64_t *)((char *)a1 + v10);
    uint64_t v15 = (uint64_t *)((char *)a2 + v10);
    uint64_t v16 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v16;
    uint64_t v17 = a3[7];
    uint64_t v18 = (char *)a1 + v17;
    uint64_t v19 = (char *)a2 + v17;
    uint64_t v20 = type metadata accessor for URL();
    uint64_t v21 = *(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v21(v18, v19, v20);
    uint64_t v22 = a3[8];
    uint64_t v23 = (uint64_t *)((char *)a1 + v22);
    uint64_t v24 = (uint64_t *)((char *)a2 + v22);
    uint64_t v25 = v24[1];
    *uint64_t v23 = *v24;
    v23[1] = v25;
  }
  swift_retain();
  return a1;
}

uint64_t sub_1000FB2F0(uint64_t a1, uint64_t a2)
{
  sub_1000060EC(&qword_100156940);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = type metadata accessor for OpenURLAction();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = a1 + *(int *)(a2 + 28);
  uint64_t v6 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  return swift_release();
}

void *sub_1000FB3FC(void *a1, void *a2, int *a3)
{
  sub_1000060EC(&qword_100156940);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for OpenURLAction();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)((char *)a1 + v7);
  uint64_t v10 = (void *)((char *)a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = (void *)((char *)a1 + v8);
  uint64_t v13 = (void *)((char *)a2 + v8);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  uint64_t v15 = a3[7];
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = type metadata accessor for URL();
  uint64_t v19 = *(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v19(v16, v17, v18);
  uint64_t v20 = a3[8];
  uint64_t v21 = (void *)((char *)a1 + v20);
  uint64_t v22 = (void *)((char *)a2 + v20);
  uint64_t v23 = v22[1];
  *uint64_t v21 = *v22;
  v21[1] = v23;
  swift_retain();
  return a1;
}

void *sub_1000FB56C(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_1000FA4B0((uint64_t)a1);
    sub_1000060EC(&qword_100156940);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = type metadata accessor for OpenURLAction();
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
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[7];
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = type metadata accessor for URL();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 24))(v14, v15, v16);
  uint64_t v17 = a3[8];
  uint64_t v18 = (void *)((char *)a1 + v17);
  uint64_t v19 = (void *)((char *)a2 + v17);
  uint64_t v20 = v19[1];
  void *v18 = *v19;
  v18[1] = v20;
  swift_retain();
  swift_release();
  return a1;
}

char *sub_1000FB708(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_1000060EC(&qword_100156940);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = type metadata accessor for OpenURLAction();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[6];
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  *(_OWORD *)&a1[v8] = *(_OWORD *)&a2[v8];
  uint64_t v9 = a3[7];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = type metadata accessor for URL();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  *(_OWORD *)&a1[a3[8]] = *(_OWORD *)&a2[a3[8]];
  return a1;
}

char *sub_1000FB840(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_1000FA4B0((uint64_t)a1);
    uint64_t v6 = sub_1000060EC(&qword_100156940);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = type metadata accessor for OpenURLAction();
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
  uint64_t v12 = *(void *)v10;
  uint64_t v11 = *((void *)v10 + 1);
  *(void *)uint64_t v9 = v12;
  *((void *)v9 + 1) = v11;
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[6];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v17 = *(void *)v15;
  uint64_t v16 = *((void *)v15 + 1);
  *(void *)uint64_t v14 = v17;
  *((void *)v14 + 1) = v16;
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[7];
  uint64_t v19 = &a1[v18];
  uint64_t v20 = &a2[v18];
  uint64_t v21 = type metadata accessor for URL();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 40))(v19, v20, v21);
  *(_OWORD *)&a1[a3[8]] = *(_OWORD *)&a2[a3[8]];
  swift_release();
  return a1;
}

uint64_t sub_1000FB9B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000FB9CC);
}

uint64_t sub_1000FB9D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000060EC(&qword_100156A08);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v11 = type metadata accessor for URL();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 28);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_1000FBB04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000FBB18);
}

uint64_t sub_1000FBB1C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1000060EC(&qword_100156A08);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v11 = type metadata accessor for URL();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 28);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t type metadata accessor for OpenAction(uint64_t a1)
{
  return sub_10009C0CC(a1, qword_10015D800);
}

void sub_1000FBC70()
{
  sub_10000B6DC();
  if (v0 <= 0x3F)
  {
    type metadata accessor for URL();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t sub_1000FBD50()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000FBD6C@<X0>(uint64_t a1@<X8>)
{
  v21[1] = a1;
  uint64_t v2 = type metadata accessor for OpenAction(0);
  uint64_t v3 = v2 - 8;
  uint64_t v4 = *(void *)(v2 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(v2);
  uint64_t v6 = sub_1000060EC(&qword_100156B48);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000FDED8(v1, (uint64_t)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for OpenAction);
  unint64_t v10 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v11 = swift_allocObject();
  sub_1000FDF6C((uint64_t)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v11 + v10, type metadata accessor for OpenAction);
  uint64_t v22 = v1;
  sub_1000060EC(&qword_100156748);
  sub_100006480(&qword_100156780, &qword_100156748);
  Button.init(action:label:)();
  uint64_t v12 = (uint64_t *)(v1 + *(int *)(v3 + 28));
  uint64_t v13 = v12[1];
  uint64_t v23 = *v12;
  uint64_t v24 = v13;
  swift_bridgeObjectRetain();
  v14._uint64_t countAndFlagsBits = 32;
  v14._object = (void *)0xE100000000000000;
  String.append(_:)(v14);
  uint64_t v15 = v23;
  uint64_t v16 = v24;
  if (qword_100156388 != -1) {
    swift_once();
  }
  uint64_t v17 = qword_100164DE0;
  uint64_t v18 = *(void **)algn_100164DE8;
  uint64_t v23 = v15;
  uint64_t v24 = v16;
  swift_bridgeObjectRetain();
  v19._uint64_t countAndFlagsBits = v17;
  v19._object = v18;
  String.append(_:)(v19);
  swift_bridgeObjectRelease();
  sub_100006480(&qword_100156B40, &qword_100156B48);
  View.accessibilityIdentifier(_:)();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_1000FC068(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for OpenURLAction();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000083D4((uint64_t)v5);
  uint64_t v6 = type metadata accessor for OpenAction(0);
  OpenURLAction.callAsFunction(_:)();
  uint64_t v7 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(uint64_t))(a1 + *(int *)(v6 + 32)))(v7);
}

uint64_t sub_1000FC16C@<X0>(uint64_t a1@<X8>)
{
  v21[1] = a1;
  uint64_t v2 = type metadata accessor for _OpenAction(0);
  uint64_t v3 = v2 - 8;
  uint64_t v4 = *(void *)(v2 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(v2);
  uint64_t v6 = sub_1000060EC(&qword_100156B48);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000FDED8(v1, (uint64_t)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for _OpenAction);
  unint64_t v10 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v11 = swift_allocObject();
  sub_1000FDF6C((uint64_t)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v11 + v10, type metadata accessor for _OpenAction);
  uint64_t v22 = v1;
  sub_1000060EC(&qword_100156748);
  sub_100006480(&qword_100156780, &qword_100156748);
  Button.init(action:label:)();
  uint64_t v12 = (uint64_t *)(v1 + *(int *)(v3 + 28));
  uint64_t v13 = v12[1];
  uint64_t v23 = *v12;
  uint64_t v24 = v13;
  swift_bridgeObjectRetain();
  v14._uint64_t countAndFlagsBits = 32;
  v14._object = (void *)0xE100000000000000;
  String.append(_:)(v14);
  uint64_t v15 = v23;
  uint64_t v16 = v24;
  if (qword_100156388 != -1) {
    swift_once();
  }
  uint64_t v17 = qword_100164DE0;
  uint64_t v18 = *(void **)algn_100164DE8;
  uint64_t v23 = v15;
  uint64_t v24 = v16;
  swift_bridgeObjectRetain();
  v19._uint64_t countAndFlagsBits = v17;
  v19._object = v18;
  String.append(_:)(v19);
  swift_bridgeObjectRelease();
  sub_100006480(&qword_100156B40, &qword_100156B48);
  View.accessibilityIdentifier(_:)();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_1000FC468()
{
  uint64_t v0 = type metadata accessor for OpenURLAction();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000083D4((uint64_t)v3);
  type metadata accessor for _OpenAction(0);
  OpenURLAction.callAsFunction(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_1000FC548@<X0>(uint64_t a1@<X8>)
{
  v24[1] = a1;
  uint64_t v2 = type metadata accessor for ShareAction(0);
  uint64_t v3 = v2 - 8;
  v24[0] = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v24[0] + 64);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000060EC(&qword_10015D848);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, &v1[*(int *)(v3 + 32)], v6);
  sub_1000FDED8((uint64_t)v1, (uint64_t)v5, type metadata accessor for ShareAction);
  unint64_t v14 = (*(unsigned __int8 *)(v24[0] + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v24[0] + 80);
  uint64_t v15 = swift_allocObject();
  sub_1000FDF6C((uint64_t)v5, v15 + v14, type metadata accessor for ShareAction);
  ShareLink<>.init<>(item:subject:message:onPresentationChanged:)();
  uint64_t v16 = *((void *)v1 + 1);
  uint64_t v25 = *(void *)v1;
  uint64_t v26 = v16;
  swift_bridgeObjectRetain();
  v17._uint64_t countAndFlagsBits = 32;
  v17._object = (void *)0xE100000000000000;
  String.append(_:)(v17);
  uint64_t v18 = v25;
  uint64_t v19 = v26;
  if (qword_100156388 != -1) {
    swift_once();
  }
  uint64_t v20 = qword_100164DE0;
  uint64_t v21 = *(void **)algn_100164DE8;
  uint64_t v25 = v18;
  uint64_t v26 = v19;
  swift_bridgeObjectRetain();
  v22._uint64_t countAndFlagsBits = v20;
  v22._object = v21;
  String.append(_:)(v22);
  swift_bridgeObjectRelease();
  sub_100006480(&qword_10015D850, &qword_10015D848);
  View.accessibilityIdentifier(_:)();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t sub_1000FC8A8@<X0>(uint64_t a1@<X8>)
{
  v25[1] = a1;
  uint64_t v2 = type metadata accessor for SyncAction(0);
  uint64_t v3 = v2 - 8;
  v25[0] = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v25[0] + 64);
  __chkstk_darwin(v2);
  uint64_t v5 = sub_1000060EC(&qword_100158370);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000060EC(&qword_100156B48);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (char *)v1 + *(int *)(v3 + 32);
  uint64_t v13 = type metadata accessor for ButtonRole();
  uint64_t v14 = *(void *)(v13 - 8);
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v7, v12, v13);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v7, 0, 1, v13);
  sub_1000FDED8((uint64_t)v1, (uint64_t)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for SyncAction);
  unint64_t v15 = (*(unsigned __int8 *)(v25[0] + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v25[0] + 80);
  uint64_t v16 = swift_allocObject();
  sub_1000FDF6C((uint64_t)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v16 + v15, type metadata accessor for SyncAction);
  uint64_t v26 = v1;
  sub_1000060EC(&qword_100156748);
  sub_100006480(&qword_100156780, &qword_100156748);
  Button.init(role:action:label:)();
  uint64_t v17 = v1[1];
  uint64_t v27 = *v1;
  uint64_t v28 = v17;
  swift_bridgeObjectRetain();
  v18._uint64_t countAndFlagsBits = 32;
  v18._object = (void *)0xE100000000000000;
  String.append(_:)(v18);
  uint64_t v19 = v27;
  uint64_t v20 = v28;
  if (qword_100156388 != -1) {
    swift_once();
  }
  uint64_t v21 = qword_100164DE0;
  Swift::String v22 = *(void **)algn_100164DE8;
  uint64_t v27 = v19;
  uint64_t v28 = v20;
  swift_bridgeObjectRetain();
  v23._uint64_t countAndFlagsBits = v21;
  v23._object = v22;
  String.append(_:)(v23);
  swift_bridgeObjectRelease();
  sub_100006480(&qword_100156B40, &qword_100156B48);
  View.accessibilityIdentifier(_:)();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_1000FCC70()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000FCC8C@<X0>(uint64_t a1@<X8>)
{
  v25[1] = a1;
  uint64_t v2 = type metadata accessor for AsyncAction(0);
  uint64_t v3 = v2 - 8;
  v25[0] = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v25[0] + 64);
  __chkstk_darwin(v2);
  uint64_t v5 = sub_1000060EC(&qword_100158370);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000060EC(&qword_100156B48);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (char *)v1 + *(int *)(v3 + 32);
  uint64_t v13 = type metadata accessor for ButtonRole();
  uint64_t v14 = *(void *)(v13 - 8);
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v7, v12, v13);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v7, 0, 1, v13);
  sub_1000FDED8((uint64_t)v1, (uint64_t)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for AsyncAction);
  unint64_t v15 = (*(unsigned __int8 *)(v25[0] + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v25[0] + 80);
  uint64_t v16 = swift_allocObject();
  sub_1000FDF6C((uint64_t)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v16 + v15, type metadata accessor for AsyncAction);
  uint64_t v26 = v1;
  sub_1000060EC(&qword_100156748);
  sub_100006480(&qword_100156780, &qword_100156748);
  Button.init(role:action:label:)();
  uint64_t v17 = v1[1];
  uint64_t v27 = *v1;
  uint64_t v28 = v17;
  swift_bridgeObjectRetain();
  v18._uint64_t countAndFlagsBits = 32;
  v18._object = (void *)0xE100000000000000;
  String.append(_:)(v18);
  uint64_t v19 = v27;
  uint64_t v20 = v28;
  if (qword_100156388 != -1) {
    swift_once();
  }
  uint64_t v21 = qword_100164DE0;
  Swift::String v22 = *(void **)algn_100164DE8;
  uint64_t v27 = v19;
  uint64_t v28 = v20;
  swift_bridgeObjectRetain();
  v23._uint64_t countAndFlagsBits = v21;
  v23._object = v22;
  String.append(_:)(v23);
  swift_bridgeObjectRelease();
  sub_100006480(&qword_100156B40, &qword_100156B48);
  View.accessibilityIdentifier(_:)();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_1000FD050(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AsyncAction(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000060EC(&qword_100157038);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  sub_1000FDED8(a1, (uint64_t)v5, type metadata accessor for AsyncAction);
  type metadata accessor for MainActor();
  uint64_t v10 = static MainActor.shared.getter();
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v10;
  *(void *)(v12 + 24) = &protocol witness table for MainActor;
  sub_1000FDF6C((uint64_t)v5, v12 + v11, type metadata accessor for AsyncAction);
  sub_1000DC37C((uint64_t)v8, (uint64_t)&unk_10015D860, v12);
  return swift_release();
}

uint64_t sub_1000FD218(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  type metadata accessor for MainActor();
  v4[3] = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  v4[4] = v6;
  v4[5] = v5;
  return _swift_task_switch(sub_1000FD2B0, v6, v5);
}

uint64_t sub_1000FD2B0()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = (void *)(v1 + *(int *)(type metadata accessor for AsyncAction(0) + 28));
  uint64_t v5 = (uint64_t (*)(void))(*v2 + *(int *)*v2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_100045010;
  return v5();
}

uint64_t sub_1000FD390@<X0>(uint64_t a1@<X8>)
{
  v25[1] = a1;
  uint64_t v2 = type metadata accessor for AsyncThrowingAction(0);
  uint64_t v3 = v2 - 8;
  v25[0] = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v25[0] + 64);
  __chkstk_darwin(v2);
  uint64_t v5 = sub_1000060EC(&qword_100158370);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000060EC(&qword_100156B48);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  unint64_t v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (char *)v1 + *(int *)(v3 + 32);
  uint64_t v13 = type metadata accessor for ButtonRole();
  uint64_t v14 = *(void *)(v13 - 8);
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v7, v12, v13);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v7, 0, 1, v13);
  sub_1000FDED8((uint64_t)v1, (uint64_t)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for AsyncThrowingAction);
  unint64_t v15 = (*(unsigned __int8 *)(v25[0] + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v25[0] + 80);
  uint64_t v16 = swift_allocObject();
  sub_1000FDF6C((uint64_t)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v16 + v15, type metadata accessor for AsyncThrowingAction);
  uint64_t v26 = v1;
  sub_1000060EC(&qword_100156748);
  sub_100006480(&qword_100156780, &qword_100156748);
  Button.init(role:action:label:)();
  uint64_t v17 = v1[1];
  uint64_t v27 = *v1;
  uint64_t v28 = v17;
  swift_bridgeObjectRetain();
  v18._uint64_t countAndFlagsBits = 32;
  v18._object = (void *)0xE100000000000000;
  String.append(_:)(v18);
  uint64_t v19 = v27;
  uint64_t v20 = v28;
  if (qword_100156388 != -1) {
    swift_once();
  }
  uint64_t v21 = qword_100164DE0;
  Swift::String v22 = *(void **)algn_100164DE8;
  uint64_t v27 = v19;
  uint64_t v28 = v20;
  swift_bridgeObjectRetain();
  v23._uint64_t countAndFlagsBits = v21;
  v23._object = v22;
  String.append(_:)(v23);
  swift_bridgeObjectRelease();
  sub_100006480(&qword_100156B40, &qword_100156B48);
  View.accessibilityIdentifier(_:)();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_1000FD754(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AsyncThrowingAction(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000060EC(&qword_100157038);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  sub_1000FDED8(a1, (uint64_t)v5, type metadata accessor for AsyncThrowingAction);
  type metadata accessor for MainActor();
  uint64_t v10 = static MainActor.shared.getter();
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v10;
  *(void *)(v12 + 24) = &protocol witness table for MainActor;
  sub_1000FDF6C((uint64_t)v5, v12 + v11, type metadata accessor for AsyncThrowingAction);
  sub_1000DC528((uint64_t)v8, (uint64_t)&unk_10015D870, v12);
  return swift_release();
}

uint64_t sub_1000FD91C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a1;
  v4[3] = a4;
  type metadata accessor for MainActor();
  v4[4] = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  v4[5] = v6;
  v4[6] = v5;
  return _swift_task_switch(sub_1000FD9B4, v6, v5);
}

uint64_t sub_1000FD9B4()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = (void *)(v1 + *(int *)(type metadata accessor for AsyncThrowingAction(0) + 28));
  uint64_t v5 = (uint64_t (*)(void))(*v2 + *(int *)*v2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_1000FDA90;
  return v5();
}

uint64_t sub_1000FDA90()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_errorRelease();
    uint64_t v3 = *(void *)(v2 + 40);
    uint64_t v4 = *(void *)(v2 + 48);
    uint64_t v5 = sub_1000FEAE4;
  }
  else
  {
    uint64_t v3 = *(void *)(v2 + 40);
    uint64_t v4 = *(void *)(v2 + 48);
    uint64_t v5 = sub_1000FDBB8;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_1000FDBB8()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = (BOOL *)v0[2];
  swift_release();
  *uint64_t v2 = v1 != 0;
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_1000FDC30()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000FDC4C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000FDC68()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000FDC84()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000FDCA0()
{
  uint64_t v1 = type metadata accessor for OpenAction(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v5 = v0 + v3;
  sub_1000060EC(&qword_100156940);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for OpenURLAction();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = v3 + v4;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v8 = v5 + *(int *)(v1 + 28);
  uint64_t v9 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  swift_release();

  return _swift_deallocObject(v0, v7, v2 | 7);
}

uint64_t sub_1000FDE24()
{
  return sub_1000FE1C8(type metadata accessor for OpenAction, sub_1000FC068);
}

uint64_t sub_1000FDE50()
{
  return sub_1000FE97C();
}

uint64_t sub_1000FDE7C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000FE5C4(type metadata accessor for OpenAction, a1);
}

uint64_t sub_1000FDE94@<X0>(uint64_t *a1@<X8>)
{
  return sub_1000FE270(*(void *)(v1 + 16), type metadata accessor for OpenAction, (uint64_t (*)(uint64_t, uint64_t))&Image.init(systemName:), a1);
}

uint64_t sub_1000FDED8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000FDF40()
{
  return sub_1000FE078(type metadata accessor for ShareAction, (uint64_t (*)(void))&type metadata accessor for URL);
}

uint64_t sub_1000FDF6C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000FDFD4(char a1)
{
  uint64_t result = type metadata accessor for ShareAction(0);
  if (a1) {
    return (*(uint64_t (**)(void))(v1
  }
                                + *(int *)(result + 28)
                                + ((*(unsigned __int8 *)(*(void *)(result - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(result - 8) + 80))))();
  return result;
}

uint64_t sub_1000FE04C()
{
  return sub_1000FE078(type metadata accessor for AsyncAction, (uint64_t (*)(void))&type metadata accessor for ButtonRole);
}

uint64_t sub_1000FE078(uint64_t (*a1)(void), uint64_t (*a2)(void))
{
  uint64_t v4 = (int *)(a1(0) - 8);
  uint64_t v5 = *(unsigned __int8 *)(*(void *)v4 + 80);
  uint64_t v6 = (v5 + 16) & ~v5;
  uint64_t v7 = v6 + *(void *)(*(void *)v4 + 64);
  uint64_t v8 = v5 | 7;
  uint64_t v9 = v2 + v6;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v10 = v9 + v4[8];
  uint64_t v11 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  swift_release();

  return _swift_deallocObject(v2, v7, v8);
}

uint64_t sub_1000FE19C()
{
  return sub_1000FE1C8(type metadata accessor for AsyncAction, sub_1000FD050);
}

uint64_t sub_1000FE1C8(uint64_t (*a1)(void), uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = *(void *)(a1(0) - 8);
  uint64_t v4 = v2 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return a2(v4);
}

uint64_t sub_1000FE244()
{
  return sub_1000FE97C();
}

uint64_t sub_1000FE270@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t (*a3)(uint64_t, uint64_t)@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v6 = (uint64_t *)(a1 + *(int *)(a2(0) + 24));
  uint64_t v7 = *v6;
  uint64_t v8 = v6[1];
  swift_bridgeObjectRetain();
  uint64_t result = a3(v7, v8);
  *a4 = result;
  return result;
}

uint64_t sub_1000FE2DC()
{
  return sub_1000FE6DC(type metadata accessor for AsyncAction);
}

uint64_t sub_1000FE2F4(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for AsyncAction(0) - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_100014D10;
  return sub_1000FD218(a1, v5, v6, v7);
}

uint64_t sub_1000FE3E0()
{
  uint64_t v1 = type metadata accessor for _OpenAction(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  sub_1000060EC(&qword_100156940);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = type metadata accessor for OpenURLAction();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = v0 + v3 + *(int *)(v1 + 28);
  uint64_t v7 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_1000FE554()
{
  return sub_1000FE1C8(type metadata accessor for _OpenAction, (uint64_t (*)(uint64_t))sub_1000FC468);
}

uint64_t sub_1000FE580()
{
  return sub_1000FE97C();
}

uint64_t sub_1000FE5AC@<X0>(uint64_t a1@<X8>)
{
  return sub_1000FE5C4(type metadata accessor for _OpenAction, a1);
}

uint64_t sub_1000FE5C4@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(v2 + 16);
  uint64_t v5 = (void *)(v4 + *(int *)(a1(0) + 20));
  uint64_t v6 = v5[1];
  *(void *)a2 = *v5;
  *(void *)(a2 + 8) = v6;
  *(unsigned char *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = _swiftEmptyArrayStorage;

  return swift_bridgeObjectRetain();
}

uint64_t sub_1000FE628@<X0>(uint64_t *a1@<X8>)
{
  return sub_1000FE270(*(void *)(v1 + 16), type metadata accessor for _OpenAction, (uint64_t (*)(uint64_t, uint64_t))&Image.init(_internalSystemName:), a1);
}

uint64_t sub_1000FE66C()
{
  return sub_1000FE078(type metadata accessor for AsyncThrowingAction, (uint64_t (*)(void))&type metadata accessor for ButtonRole);
}

uint64_t sub_1000FE698()
{
  return sub_1000FE1C8(type metadata accessor for AsyncThrowingAction, sub_1000FD754);
}

uint64_t sub_1000FE6C4()
{
  return sub_1000FE6DC(type metadata accessor for AsyncThrowingAction);
}

uint64_t sub_1000FE6DC(uint64_t (*a1)(void))
{
  uint64_t v2 = (int *)(a1(0) - 8);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(*(void *)v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = v1 + v4 + v2[8];
  uint64_t v8 = type metadata accessor for ButtonRole();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_release();

  return _swift_deallocObject(v1, v5, v6);
}

uint64_t sub_1000FE7F8(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for AsyncThrowingAction(0) - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_100015B24;
  return sub_1000FD91C(a1, v5, v6, v7);
}

uint64_t sub_1000FE8E4()
{
  return sub_1000FE078(type metadata accessor for SyncAction, (uint64_t (*)(void))&type metadata accessor for ButtonRole);
}

uint64_t sub_1000FE910()
{
  uint64_t v1 = type metadata accessor for SyncAction(0);
  return (*(uint64_t (**)(void))(v0
                              + *(int *)(v1 + 28)
                              + ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80))))();
}

uint64_t sub_1000FE97C()
{
  return Label.init(title:icon:)();
}

uint64_t sub_1000FE9D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void **)(v1 + 16);
  uint64_t v3 = v2[1];
  *(void *)a1 = *v2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = _swiftEmptyArrayStorage;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1000FE9F4@<X0>(uint64_t *a1@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t result = Image.init(systemName:)();
  *a1 = result;
  return result;
}

unint64_t sub_1000FEA44()
{
  unint64_t result = qword_10015D878;
  if (!qword_10015D878)
  {
    sub_100006224(&qword_10015D880);
    sub_100006480(&qword_10015D850, &qword_10015D848);
    sub_10005F80C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015D878);
  }
  return result;
}

uint64_t *sub_1000FEAE8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for URL();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = sub_1000060EC((uint64_t *)&unk_100158FC0);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v11 = *(int *)(a3 + 20);
    uint64_t v12 = (char *)a1 + v11;
    uint64_t v13 = (char *)a2 + v11;
    uint64_t v14 = sub_1000060EC(&qword_10015CFE0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
    uint64_t v15 = *(int *)(a3 + 24);
    uint64_t v16 = (uint64_t *)((char *)a1 + v15);
    uint64_t v17 = (uint64_t *)((char *)a2 + v15);
    sub_1000060EC(&qword_100156938);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v18 = type metadata accessor for ColorScheme();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
    }
    else
    {
      *uint64_t v16 = *v17;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_1000FED38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  }
  uint64_t v6 = a1 + *(int *)(a2 + 20);
  uint64_t v7 = sub_1000060EC(&qword_10015CFE0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = a1 + *(int *)(a2 + 24);
  sub_1000060EC(&qword_100156938);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = type metadata accessor for ColorScheme();
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);
    return v10(v8, v9);
  }
  else
  {
    return swift_release();
  }
}

char *sub_1000FEEC0(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_1000060EC((uint64_t *)&unk_100158FC0);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = sub_1000060EC(&qword_10015CFE0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  sub_1000060EC(&qword_100156938);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v16 = type metadata accessor for ColorScheme();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  }
  else
  {
    *(void *)uint64_t v14 = *(void *)v15;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

char *sub_1000FF0C0(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    uint64_t v11 = sub_1000060EC((uint64_t *)&unk_100158FC0);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
LABEL_7:
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = sub_1000060EC(&qword_10015CFE0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  if (a1 != a2)
  {
    uint64_t v16 = *(int *)(a3 + 24);
    uint64_t v17 = &a1[v16];
    uint64_t v18 = &a2[v16];
    sub_1000063D0((uint64_t)&a1[v16], &qword_100156938);
    sub_1000060EC(&qword_100156938);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v19 = type metadata accessor for ColorScheme();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
    }
    else
    {
      *(void *)uint64_t v17 = *(void *)v18;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *sub_1000FF33C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_1000060EC((uint64_t *)&unk_100158FC0);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = *(int *)(a3 + 20);
  int v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = sub_1000060EC(&qword_10015CFE0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v16 = sub_1000060EC(&qword_100156938);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v17 = type metadata accessor for ColorScheme();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v14, v15, v17);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
  }
  return a1;
}

char *sub_1000FF544(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    uint64_t v11 = sub_1000060EC((uint64_t *)&unk_100158FC0);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
LABEL_7:
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = sub_1000060EC(&qword_10015CFE0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  if (a1 != a2)
  {
    uint64_t v16 = *(int *)(a3 + 24);
    uint64_t v17 = &a1[v16];
    uint64_t v18 = &a2[v16];
    sub_1000063D0((uint64_t)&a1[v16], &qword_100156938);
    uint64_t v19 = sub_1000060EC(&qword_100156938);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v20 = type metadata accessor for ColorScheme();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 32))(v17, v18, v20);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v17, v18, *(void *)(*(void *)(v19 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_1000FF7C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000FF7DC);
}

uint64_t sub_1000FF7DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000060EC((uint64_t *)&unk_100158FC0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_1000060EC(&qword_10015CFE0);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  uint64_t v14 = sub_1000060EC(&qword_100157AF0);
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = a1 + *(int *)(a3 + 24);

  return v15(v17, a2, v16);
}

uint64_t sub_1000FF934(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000FF948);
}

uint64_t sub_1000FF948(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_1000060EC((uint64_t *)&unk_100158FC0);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t v13 = sub_1000060EC(&qword_10015CFE0);
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  uint64_t v16 = sub_1000060EC(&qword_100157AF0);
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  uint64_t v18 = v16;
  uint64_t v19 = a1 + *(int *)(a4 + 24);

  return v17(v19, a2, a2, v18);
}

uint64_t type metadata accessor for LibraryItemArtwork()
{
  uint64_t result = qword_10015D8F8;
  if (!qword_10015D8F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000FFAF8()
{
  sub_1000FFC5C(319, (unint64_t *)&qword_1001569B8, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  if (v0 <= 0x3F)
  {
    sub_1000F1538();
    if (v1 <= 0x3F)
    {
      sub_1000FFC5C(319, (unint64_t *)&qword_100157B60, (uint64_t (*)(uint64_t))&type metadata accessor for ColorScheme, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_1000FFC5C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_1000FFCC0()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_1000FFCDC@<D0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v29 = a4;
  uint64_t v30 = a5;
  uint64_t v28 = a3;
  uint64_t v9 = sub_1000060EC((uint64_t *)&unk_100158FC0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for URL();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v28 - v17;
  uint64_t v19 = sub_1000060EC(qword_1001597F8);
  __chkstk_darwin(v19 - 8);
  uint64_t v21 = (char *)&v28 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009C94(a1, (uint64_t)v11, (uint64_t *)&unk_100158FC0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_1000063D0((uint64_t)v11, (uint64_t *)&unk_100158FC0);
    uint64_t v22 = type metadata accessor for URLRequest();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v21, 1, 1, v22);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v18, v11, v12);
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, v12);
    URLRequest.init(url:cachePolicy:timeoutInterval:)();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
    uint64_t v23 = type metadata accessor for URLRequest();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v21, 0, 1, v23);
  }
  uint64_t v24 = sub_1000060EC(&qword_10015D938);
  sub_100009C30((uint64_t)v21, a6 + *(int *)(v24 + 44), qword_1001597F8);
  id v25 = [self defaultSessionConfiguration];
  [v25 setURLCache:a2];
  *(void *)(a6 + *(int *)(v24 + 48)) = [self sessionWithConfiguration:v25];
  uint64_t v26 = v28;
  *(void *)(a6 + 16) = v29;
  *(void *)(a6 + 24) = v30;
  *(void *)(a6 + 32) = v26;
  unint64_t v31 = 0x8000000000000000;
  State.init(wrappedValue:)();

  sub_1000063D0(a1, (uint64_t *)&unk_100158FC0);
  double result = *(double *)&v32;
  *(_OWORD *)a6 = v32;
  return result;
}

uint64_t sub_100100064()
{
  uint64_t v0 = type metadata accessor for Color.RGBColorSpace();
  __chkstk_darwin(v0);
  (*(void (**)(char *, void))(v2 + 104))((char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0), enum case for Color.RGBColorSpace.sRGB(_:));
  uint64_t result = Color.init(_:red:green:blue:opacity:)();
  qword_10015D888 = result;
  return result;
}

void sub_100100144()
{
  qword_10015D890 = 0x636973756DLL;
  *(void *)algn_10015D898 = 0xE500000000000000;
}

uint64_t sub_100100164@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v28 = a1;
  uint64_t v3 = type metadata accessor for LibraryItemArtwork();
  uint64_t v26 = *(void *)(v3 - 8);
  uint64_t v4 = *(void *)(v26 + 64);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000060EC((uint64_t *)&unk_100158FC0);
  __chkstk_darwin(v6 - 8);
  unint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000060EC(&qword_10015D938);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000060EC(&qword_10015D940);
  uint64_t v13 = v12 - 8;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_1000060EC(&qword_10015D948);
  __chkstk_darwin(v27);
  uint64_t v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = v1;
  sub_100009C94(v1, (uint64_t)v8, (uint64_t *)&unk_100158FC0);
  static Animation.easeInOut.getter();
  uint64_t v18 = Transaction.init(animation:)();
  sub_100101824(v2, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for LibraryItemArtwork);
  unint64_t v19 = (*(unsigned __int8 *)(v26 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
  uint64_t v20 = swift_allocObject();
  sub_10008A598((uint64_t)v5, v20 + v19);
  id v21 = [self sharedURLCache];
  sub_1000FFCDC((uint64_t)v8, v21, v18, (uint64_t)sub_100101470, v20, (uint64_t)v11);
  sub_1000060EC(&qword_10015CFE0);
  ScaledMetric.wrappedValue.getter();
  ScaledMetric.wrappedValue.getter();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  sub_100009C94((uint64_t)v11, (uint64_t)v15, &qword_10015D938);
  uint64_t v22 = &v15[*(int *)(v13 + 44)];
  long long v23 = v30;
  *(_OWORD *)uint64_t v22 = v29;
  *((_OWORD *)v22 + 1) = v23;
  *((_OWORD *)v22 + 2) = v31;
  sub_1000063D0((uint64_t)v11, &qword_10015D938);
  sub_100009C94((uint64_t)v15, (uint64_t)v17, &qword_10015D940);
  v17[*(int *)(v27 + 36)] = 1;
  sub_1000063D0((uint64_t)v15, &qword_10015D940);
  sub_1001014F0();
  View.accessibilityHidden(_:)();
  return sub_1000063D0((uint64_t)v17, &qword_10015D948);
}

uint64_t sub_10010050C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v53 = a1;
  uint64_t v66 = a2;
  uint64_t v2 = type metadata accessor for AccessibilityChildBehavior();
  uint64_t v57 = *(void *)(v2 - 8);
  uint64_t v58 = v2;
  __chkstk_darwin(v2);
  uint64_t v55 = (char *)&v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_1000060EC(&qword_10015D970);
  __chkstk_darwin(v56);
  uint64_t v5 = (uint64_t *)((char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = sub_1000060EC(&qword_10015D978);
  uint64_t v59 = *(void *)(v6 - 8);
  unint64_t v60 = v6;
  __chkstk_darwin(v6);
  uint64_t v52 = (char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = sub_1000060EC(&qword_10015D980);
  uint64_t v8 = __chkstk_darwin(v65);
  uint64_t v54 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v61 = (uint64_t)&v51 - v10;
  uint64_t v63 = sub_1000060EC(&qword_10015D988);
  __chkstk_darwin(v63);
  uint64_t v64 = (uint64_t)&v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_1000060EC(&qword_100157ED8);
  __chkstk_darwin(v51);
  uint64_t v13 = (char *)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for RoundedRectangle();
  __chkstk_darwin(v14);
  uint64_t v16 = (_OWORD *)((char *)&v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = type metadata accessor for Image.ResizingMode();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v51 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_1000060EC(&qword_10015D990);
  __chkstk_darwin(v21);
  long long v23 = (uint64_t *)((char *)&v51 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v62 = sub_1000060EC(&qword_10015D998);
  uint64_t v24 = __chkstk_darwin(v62);
  uint64_t v26 = (char *)&v51 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24);
  if (v28 >> 62)
  {
    uint64_t *v5 = static Alignment.center.getter();
    v5[1] = v41;
    uint64_t v42 = sub_1000060EC(&qword_10015D9A0);
    sub_100100D88((uint64_t)v5 + *(int *)(v42 + 44));
    uint64_t v43 = v55;
    static AccessibilityChildBehavior.combine.getter();
    uint64_t v44 = sub_100006480(&qword_10015D9A8, &qword_10015D970);
    uint64_t v45 = v52;
    uint64_t v46 = v56;
    View.accessibilityElement(children:)();
    (*(void (**)(char *, uint64_t))(v57 + 8))(v43, v58);
    sub_1000063D0((uint64_t)v5, &qword_10015D970);
    if (qword_100156338 != -1) {
      swift_once();
    }
    uint64_t v67 = v46;
    uint64_t v68 = v44;
    swift_getOpaqueTypeConformance2();
    uint64_t v47 = v54;
    unint64_t v48 = v60;
    View.accessibilityIdentifier(_:)();
    (*(void (**)(char *, unint64_t))(v59 + 8))(v45, v48);
    uint64_t v39 = &qword_10015D980;
    uint64_t v49 = (uint64_t)v47;
    uint64_t v40 = v61;
    sub_100009C30(v49, v61, &qword_10015D980);
    sub_100009C94(v40, v64, &qword_10015D980);
    swift_storeEnumTagMultiPayload();
    sub_100101620(&qword_10015D9B0, &qword_10015D998, (void (*)(void))sub_1001016A8, (void (*)(void))sub_10005F80C);
    sub_100101748();
    _ConditionalContent<>.init(storage:)();
  }
  else
  {
    uint64_t v61 = (uint64_t)&v51 - v27;
    unint64_t v29 = v28;
    (*(void (**)(char *, void, uint64_t))(v18 + 104))(v20, enum case for Image.ResizingMode.stretch(_:), v17);
    swift_retain();
    unint64_t v60 = v29;
    uint64_t v30 = Image.resizable(capInsets:resizingMode:)();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
    long long v31 = (char *)v16 + *(int *)(v14 + 20);
    uint64_t v32 = enum case for RoundedCornerStyle.continuous(_:);
    uint64_t v33 = type metadata accessor for RoundedCornerStyle();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v33 - 8) + 104))(v31, v32, v33);
    __asm { FMOV            V0.2D, #8.0 }
    *uint64_t v16 = _Q0;
    sub_100101824((uint64_t)v16, (uint64_t)v13, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
    *(_WORD *)&v13[*(int *)(v51 + 36)] = 256;
    sub_100009C94((uint64_t)v13, (uint64_t)v23 + *(int *)(v21 + 36), &qword_100157ED8);
    *long long v23 = v30;
    swift_retain();
    sub_1000063D0((uint64_t)v13, &qword_100157ED8);
    sub_10002717C((uint64_t)v16);
    swift_release();
    if (qword_100156330 != -1) {
      swift_once();
    }
    sub_1001016A8();
    View.accessibilityIdentifier(_:)();
    sub_1000063D0((uint64_t)v23, &qword_10015D990);
    uint64_t v39 = &qword_10015D998;
    uint64_t v40 = v61;
    sub_100009C30((uint64_t)v26, v61, &qword_10015D998);
    sub_100009C94(v40, v64, &qword_10015D998);
    swift_storeEnumTagMultiPayload();
    sub_100101620(&qword_10015D9B0, &qword_10015D998, (void (*)(void))sub_1001016A8, (void (*)(void))sub_10005F80C);
    sub_100101748();
    _ConditionalContent<>.init(storage:)();
    sub_100071F0C(v60);
  }
  return sub_1000063D0(v40, v39);
}

uint64_t sub_100100D88@<X0>(uint64_t a1@<X8>)
{
  uint64_t v44 = a1;
  uint64_t v1 = type metadata accessor for ColorScheme();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v42 - v6;
  uint64_t v8 = type metadata accessor for RoundedRectangle();
  uint64_t v9 = v8 - 8;
  __chkstk_darwin(v8);
  uint64_t v11 = (_OWORD *)((char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = sub_1000060EC(&qword_10015D9C8);
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v43 = (uint64_t)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v42 - v16;
  __chkstk_darwin(v15);
  uint64_t v42 = (uint64_t)&v42 - v18;
  uint64_t v19 = (char *)v11 + *(int *)(v9 + 28);
  uint64_t v20 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v21 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 104))(v19, v20, v21);
  __asm { FMOV            V0.2D, #8.0 }
  *uint64_t v11 = _Q0;
  sub_1000060EC(&qword_10015D0F0);
  uint64_t v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_1001118A0;
  type metadata accessor for LibraryItemArtwork();
  sub_100008414((uint64_t)v7);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v5, enum case for ColorScheme.light(_:), v1);
  LOBYTE(v20) = static ColorScheme.== infix(_:_:)();
  unint64_t v28 = *(void (**)(char *, uint64_t))(v2 + 8);
  v28(v5, v1);
  v28(v7, v1);
  if (v20)
  {
    id v29 = [self systemGray5Color];
    uint64_t v30 = Color.init(uiColor:)();
  }
  else
  {
    uint64_t v30 = static Color.gray.getter();
  }
  *(void *)(v27 + 32) = v30;
  if (qword_1001565E0 != -1) {
    swift_once();
  }
  *(void *)(v27 + 40) = qword_10015D888;
  *(void *)&long long v45 = v27;
  specialized Array._endMutation()();
  swift_retain();
  static UnitPoint.top.getter();
  static UnitPoint.bottom.getter();
  Gradient.init(colors:)();
  LinearGradient.init(gradient:startPoint:endPoint:)();
  sub_100101824((uint64_t)v11, (uint64_t)v17, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  long long v31 = &v17[*(int *)(v12 + 52)];
  long long v32 = v46;
  *(_OWORD *)long long v31 = v45;
  *((_OWORD *)v31 + 1) = v32;
  *((void *)v31 + 4) = v47;
  *(_WORD *)&v17[*(int *)(v12 + 56)] = 256;
  sub_10002717C((uint64_t)v11);
  uint64_t v33 = v42;
  sub_100009C30((uint64_t)v17, v42, &qword_10015D9C8);
  if (qword_1001565E8 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t v34 = Image.init(_internalSystemName:)();
  uint64_t v35 = static Font.title.getter();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v37 = static Color.white.getter();
  uint64_t v38 = v43;
  sub_100009C94(v33, v43, &qword_10015D9C8);
  uint64_t v39 = v44;
  sub_100009C94(v38, v44, &qword_10015D9C8);
  uint64_t v40 = (uint64_t *)(v39 + *(int *)(sub_1000060EC(&qword_10015D9D0) + 48));
  *uint64_t v40 = v34;
  v40[1] = KeyPath;
  v40[2] = v35;
  v40[3] = v37;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1000063D0(v33, &qword_10015D9C8);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return sub_1000063D0(v38, &qword_10015D9C8);
}

uint64_t sub_10010129C()
{
  uint64_t v1 = type metadata accessor for LibraryItemArtwork();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v5 = v0 + v3;
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v0 + v3, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v3, v6);
  }
  uint64_t v8 = v5 + *(int *)(v1 + 20);
  uint64_t v9 = sub_1000060EC(&qword_10015CFE0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  uint64_t v10 = v5 + *(int *)(v1 + 24);
  sub_1000060EC(&qword_100156938);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = type metadata accessor for ColorScheme();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  }
  else
  {
    swift_release();
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_100101470@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for LibraryItemArtwork() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_10010050C(v4, a1);
}

uint64_t sub_1001014F0()
{
  return sub_100101620(&qword_10015D950, &qword_10015D948, (void (*)(void))sub_10010152C, (void (*)(void))sub_1001015CC);
}

unint64_t sub_10010152C()
{
  unint64_t result = qword_10015D958;
  if (!qword_10015D958)
  {
    sub_100006224(&qword_10015D940);
    sub_100006480(&qword_10015D960, &qword_10015D938);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015D958);
  }
  return result;
}

unint64_t sub_1001015CC()
{
  unint64_t result = qword_10015D968;
  if (!qword_10015D968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015D968);
  }
  return result;
}

uint64_t sub_100101620(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100006224(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1001016A8()
{
  unint64_t result = qword_10015D9B8;
  if (!qword_10015D9B8)
  {
    sub_100006224(&qword_10015D990);
    sub_100006480(&qword_10015A2C8, &qword_100157ED8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015D9B8);
  }
  return result;
}

unint64_t sub_100101748()
{
  unint64_t result = qword_10015D9C0;
  if (!qword_10015D9C0)
  {
    sub_100006224(&qword_10015D980);
    sub_100006224(&qword_10015D970);
    sub_100006480(&qword_10015D9A8, &qword_10015D970);
    swift_getOpaqueTypeConformance2();
    sub_10005F80C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015D9C0);
  }
  return result;
}

uint64_t sub_100101824(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100101894()
{
  return sub_100101620(&qword_10015D9D8, qword_10015D9E0, (void (*)(void))sub_1001014F0, (void (*)(void))sub_10005F80C);
}

uint64_t sub_1001018E4()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for ObservationRegistrar();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_initClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_1001019C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  sub_100102850(a1, a2);
  return v4;
}

unint64_t sub_100101A14(uint64_t a1)
{
  uint64_t v101 = *(void *)v1;
  uint64_t v102 = *(void *)(v101 + 80);
  uint64_t v100 = *(void *)(v102 - 8);
  uint64_t v98 = *(void *)(v100 + 64);
  __chkstk_darwin(a1);
  uint64_t v3 = (char *)&v87 - v2;
  uint64_t v110 = _s6ActionOMa(0);
  __chkstk_darwin(v110);
  char v109 = (void *)((char *)&v87 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v111 = type metadata accessor for ContextMenuItemSection(0);
  unint64_t v5 = *(void *)(v111 - 8);
  uint64_t v6 = __chkstk_darwin(v111);
  uint64_t v92 = (char *)&v87 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  long long v103 = (char *)&v87 - v9;
  __chkstk_darwin(v8);
  uint64_t v95 = (char *)&v87 - v10;
  uint64_t v11 = sub_1000060EC((uint64_t *)&unk_100158FC0);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  uint64_t v14 = (char *)&v87 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v87 - v15;
  uint64_t v17 = type metadata accessor for URL();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v94 = (char *)&v87 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __chkstk_darwin(v19);
  long long v23 = (char *)&v87 - v22;
  __chkstk_darwin(v21);
  uint64_t v25 = (char *)&v87 - v24;
  uint64_t v108 = v1;
  id v97 = (id)*((void *)v1 + 2);
  id v26 = [v97 webURL];
  uint64_t v105 = v14;
  uint64_t v106 = v18;
  unint64_t v104 = v5;
  uint64_t v93 = v23;
  uint64_t v107 = v17;
  if (!v26)
  {
    long long v99 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
    v99(v16, 1, 1, v17);
    goto LABEL_7;
  }
  uint64_t v27 = v26;
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  unint64_t v28 = *(void (**)(char *, char *, uint64_t))(v18 + 32);
  v28(v16, v23, v17);
  long long v99 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
  v99(v16, 0, 1, v17);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) == 1)
  {
LABEL_7:
    sub_1000063D0((uint64_t)v16, (uint64_t *)&unk_100158FC0);
    char v96 = (char *)_swiftEmptyArrayStorage;
    goto LABEL_8;
  }
  char v96 = v3;
  v28(v25, v16, v17);
  sub_1000060EC(&qword_10015DA68);
  id v29 = (int *)(type metadata accessor for ContextMenuItem(0) - 8);
  unint64_t v30 = (*(unsigned __int8 *)(*(void *)v29 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v29 + 80);
  uint64_t v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_100110670;
  uint64_t v32 = sub_1000060EC(&qword_10015AA80);
  uint64_t v33 = (uint64_t)v109;
  uint64_t v34 = (uint64_t (**)())((char *)v109 + *(int *)(v32 + 48));
  (*(void (**)(void *, char *, uint64_t))(v18 + 16))(v109, v25, v17);
  uint64_t v35 = v108;
  *uint64_t v34 = sub_100102C70;
  v34[1] = v35;
  swift_storeEnumTagMultiPayload();
  swift_retain();
  UUID.init()();
  sub_100102C00(v33, v31 + v30 + v29[7], _s6ActionOMa);
  uint64_t v36 = (uint64_t)v95;
  UUID.init()();
  uint64_t v37 = v111;
  uint64_t v38 = (void *)(v36 + *(int *)(v111 + 20));
  void *v38 = 0;
  v38[1] = 0;
  *(void *)(v36 + *(int *)(v37 + 24)) = v31;
  unint64_t v39 = sub_10005E730(0, 1, 1, (unint64_t)_swiftEmptyArrayStorage);
  unint64_t v41 = *(void *)(v39 + 16);
  unint64_t v40 = *(void *)(v39 + 24);
  if (v41 >= v40 >> 1) {
    unint64_t v39 = sub_10005E730(v40 > 1, v41 + 1, 1, v39);
  }
  uint64_t v3 = v96;
  char v96 = (char *)v39;
  *(void *)(v39 + 16) = v41 + 1;
  sub_100102C00(v36, v39+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v41, type metadata accessor for ContextMenuItemSection);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v25, v107);
LABEL_8:
  uint64_t v42 = sub_1000060EC(&qword_10015DA68);
  uint64_t v43 = type metadata accessor for ContextMenuItem(0);
  uint64_t v44 = *(unsigned __int8 *)(*(void *)(v43 - 8) + 80);
  uint64_t v45 = (v44 + 32) & ~v44;
  uint64_t v46 = v45 + *(void *)(*(void *)(v43 - 8) + 72);
  uint64_t v91 = v42;
  uint64_t v89 = v46;
  uint64_t v88 = v44 | 7;
  uint64_t v47 = swift_allocObject();
  long long v87 = xmmword_100110670;
  *(_OWORD *)(v47 + 16) = xmmword_100110670;
  uint64_t v90 = v45;
  uint64_t v95 = (char *)(v47 + v45);
  unint64_t v48 = (char *)v108;
  uint64_t v49 = v100;
  uint64_t v50 = v102;
  (*(void (**)(char *, char *, uint64_t))(v100 + 16))(v3, &v48[*(void *)(*(void *)v48 + 104)], v102);
  uint64_t v51 = v3;
  unint64_t v52 = (*(unsigned __int8 *)(v49 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80);
  unint64_t v53 = (v98 + v52 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v54 = swift_allocObject();
  *(void *)(v54 + 16) = v50;
  *(void *)(v54 + 24) = *(void *)(v101 + 88);
  (*(void (**)(unint64_t, char *, uint64_t))(v49 + 32))(v54 + v52, v51, v50);
  id v55 = v97;
  *(void *)(v54 + v53) = v97;
  *(void *)(v54 + ((v53 + 15) & 0xFFFFFFFFFFFFFFF8)) = v48;
  uint64_t v56 = (uint64_t)v109;
  *char v109 = &unk_10015DA78;
  *(void *)(v56 + 8) = v54;
  swift_storeEnumTagMultiPayload();
  swift_retain();
  id v57 = v55;
  uint64_t v58 = v95;
  UUID.init()();
  uint64_t v102 = v43;
  sub_100102C00(v56, (uint64_t)&v58[*(int *)(v43 + 20)], _s6ActionOMa);
  uint64_t v59 = (uint64_t)v103;
  UUID.init()();
  uint64_t v60 = v111;
  uint64_t v61 = (void *)(v59 + *(int *)(v111 + 20));
  *uint64_t v61 = 0;
  v61[1] = 0;
  *(void *)(v59 + *(int *)(v60 + 24)) = v47;
  unint64_t v62 = (unint64_t)v96;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v62 = sub_10005E730(0, *(void *)(v62 + 16) + 1, 1, v62);
  }
  uint64_t v63 = v107;
  unint64_t v65 = *(void *)(v62 + 16);
  unint64_t v64 = *(void *)(v62 + 24);
  uint64_t v66 = (uint64_t)v105;
  if (v65 >= v64 >> 1) {
    unint64_t v62 = sub_10005E730(v64 > 1, v65 + 1, 1, v62);
  }
  *(void *)(v62 + 16) = v65 + 1;
  unint64_t v67 = (*(unsigned __int8 *)(v104 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v104 + 80);
  uint64_t v68 = *(void *)(v104 + 72);
  sub_100102C00(v59, v62 + v67 + v68 * v65, type metadata accessor for ContextMenuItemSection);
  id v69 = [v57 webURL];
  if (!v69)
  {
    v99((char *)v66, 1, 1, v63);
    goto LABEL_18;
  }
  uint64_t v70 = v69;
  uint64_t v71 = v93;
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v72 = v106;
  uint64_t v73 = *(void (**)(uint64_t, char *, uint64_t))(v106 + 32);
  v73(v66, v71, v63);
  v99((char *)v66, 0, 1, v63);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v72 + 48))(v66, 1, v63) == 1)
  {
LABEL_18:
    sub_1000063D0(v66, (uint64_t *)&unk_100158FC0);
    return v62;
  }
  unint64_t v104 = v67;
  char v74 = v94;
  v73((uint64_t)v94, (char *)v66, v63);
  uint64_t v75 = swift_allocObject();
  *(_OWORD *)(v75 + 16) = v87;
  uint64_t v76 = v75 + v90;
  uint64_t v77 = sub_1000060EC(&qword_10015AA80);
  uint64_t v78 = (uint64_t)v109;
  uint64_t v79 = (uint64_t (**)())((char *)v109 + *(int *)(v77 + 48));
  (*(void (**)(void *, char *, uint64_t))(v72 + 16))(v109, v74, v63);
  uint64_t v80 = v108;
  *uint64_t v79 = sub_100102C68;
  v79[1] = v80;
  swift_storeEnumTagMultiPayload();
  swift_retain();
  UUID.init()();
  sub_100102C00(v78, v76 + *(int *)(v102 + 20), _s6ActionOMa);
  uint64_t v81 = (uint64_t)v92;
  UUID.init()();
  uint64_t v82 = v111;
  uint64_t v83 = (void *)(v81 + *(int *)(v111 + 20));
  void *v83 = 0;
  v83[1] = 0;
  *(void *)(v81 + *(int *)(v82 + 24)) = v75;
  unint64_t v85 = *(void *)(v62 + 16);
  unint64_t v84 = *(void *)(v62 + 24);
  if (v85 >= v84 >> 1) {
    unint64_t v62 = sub_10005E730(v84 > 1, v85 + 1, 1, v62);
  }
  *(void *)(v62 + 16) = v85 + 1;
  sub_100102C00(v81, v62 + v104 + v85 * v68, type metadata accessor for ContextMenuItemSection);
  (*(void (**)(char *, uint64_t))(v72 + 8))(v94, v63);
  return v62;
}

uint64_t sub_10010253C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = *a3;
  v3[2] = type metadata accessor for MainActor();
  v3[3] = static MainActor.shared.getter();
  uint64_t v6 = *(void *)(v5 + 88);
  v3[4] = v6;
  uint64_t v7 = *(int **)(v6 + 40);
  uint64_t v8 = *(void *)(v5 + 80);
  v3[5] = v8;
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)v7 + *v7);
  uint64_t v9 = (void *)swift_task_alloc();
  void v3[6] = v9;
  *uint64_t v9 = v3;
  v9[1] = sub_1001026A0;
  return v11(a2, v8, v6);
}

uint64_t sub_1001026A0()
{
  swift_task_dealloc();
  uint64_t v1 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_1001027DC, v1, v0);
}

uint64_t sub_1001027DC()
{
  swift_release();
  sub_100102CA8(0x12u);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

char *sub_100102850(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)v2;
  ObservationRegistrar.init()();
  *((void *)v2 + 2) = a1;
  (*(void (**)(char *, uint64_t))(*(void *)(*(void *)(v5 + 80) - 8) + 32))(&v2[*(void *)(*(void *)v2 + 104)], a2);
  return v2;
}

id *sub_1001028FC()
{
  uint64_t v1 = *v0;

  (*(void (**)(char *))(*(void *)(v1[10] - 8) + 8))((char *)v0 + *((void *)*v0 + 13));
  uint64_t v2 = (char *)v0 + *((void *)*v0 + 14);
  uint64_t v3 = type metadata accessor for ObservationRegistrar();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  return v0;
}

uint64_t sub_1001029CC()
{
  sub_1001028FC();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t type metadata accessor for LibraryItemContextMenuModel()
{
  return sub_100020608();
}

uint64_t sub_100102A3C()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = (*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);

  swift_release();

  return _swift_deallocObject(v0, ((v5 + 15) & 0xFFFFFFFFFFFFFFF8) + 8, v4);
}

uint64_t sub_100102AF0()
{
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 16) - 8) + 80);
  unint64_t v3 = (*(void *)(*(void *)(*(void *)(v0 + 16) - 8) + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v4 = v0 + v2;
  uint64_t v5 = *(void *)(v0 + v3);
  uint64_t v6 = *(uint64_t **)(v0 + ((v3 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_100014D10;
  return sub_10010253C(v4, v5, v6);
}

uint64_t sub_100102C00(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100102C68()
{
  return sub_100102C78(0);
}

uint64_t sub_100102C70()
{
  return sub_100102C78(5u);
}

uint64_t sub_100102C78(unsigned __int8 a1)
{
  return sub_100102CA8(a1);
}

uint64_t sub_100102CA8(unsigned __int8 a1)
{
  uint64_t v2 = type metadata accessor for MusicSubscription();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000060EC(&qword_1001577D0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100156550 != -1) {
    swift_once();
  }
  uint64_t v9 = qword_100164EA8;
  swift_getKeyPath();
  v14[1] = v9;
  sub_10007B5F8();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v10 = v9 + OBJC_IVAR____TtC16MusicRecognition33MusicSubscriptionStatusController__musicSubscription;
  swift_beginAccess();
  sub_100023D4C(v10, (uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2))
  {
    sub_1000063D0((uint64_t)v8, &qword_1001577D0);
    int v11 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v5, v8, v2);
    sub_1000063D0((uint64_t)v8, &qword_1001577D0);
    char v12 = MusicSubscription.canBecomeSubscriber.getter();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    if (v12) {
      int v11 = 0;
    }
    else {
      int v11 = 0x10000;
    }
  }
  return sub_1000D6E40(v11 | a1 | 0x300u, 0xD000000000000028, 0x8000000100117950);
}

uint64_t sub_100102F14()
{
  swift_getKeyPath();
  sub_1001035F4(&qword_100156B18, (void (*)(uint64_t))type metadata accessor for ContextMenuViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16MusicRecognition20ContextMenuViewModel__shareSheetFromOverflow);
}

uint64_t sub_100102FBC(uint64_t (*a1)(uint64_t))
{
  if (qword_100156018 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_10000E808(v3, (uint64_t)qword_100164B38);
  swift_retain_n();
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315138;
    uint64_t v13 = v7;
    type metadata accessor for URL();
    sub_1001035F4((unint64_t *)&qword_100156B88, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v8 = dispatch thunk of CustomStringConvertible.description.getter();
    sub_1000CB67C(v8, v9, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Opening Shazam App Store URL %s", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC16MusicRecognition20ContextMenuViewModel_member)) {
    int v10 = 66309;
  }
  else {
    int v10 = 773;
  }
  uint64_t v11 = sub_1000D6E40(v10, 0xD000000000000028, 0x8000000100117950);
  return a1(v11);
}

uint64_t sub_10010321C@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_1001035F4(&qword_100156B18, (void (*)(uint64_t))type metadata accessor for ContextMenuViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + OBJC_IVAR____TtC16MusicRecognition20ContextMenuViewModel__shareSheetFromOverflow);
  return result;
}

uint64_t sub_1001032CC()
{
  return swift_release();
}

uint64_t sub_10010339C(uint64_t result, char a2)
{
  *(unsigned char *)(result + OBJC_IVAR____TtC16MusicRecognition20ContextMenuViewModel__shareSheetFromOverflow) = a2;
  return result;
}

uint64_t sub_1001033AC()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16MusicRecognition20ContextMenuViewModel_shazamAppStoreURL;
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC16MusicRecognition20ContextMenuViewModel_shazamURL, v2);
  uint64_t v4 = v0 + OBJC_IVAR____TtC16MusicRecognition20ContextMenuViewModel___observationRegistrar;
  uint64_t v5 = type metadata accessor for ObservationRegistrar();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v7 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v6, v7);
}

uint64_t sub_1001034C0()
{
  return type metadata accessor for ContextMenuViewModel();
}

uint64_t type metadata accessor for ContextMenuViewModel()
{
  uint64_t result = qword_10015DAC0;
  if (!qword_10015DAC0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100103514()
{
  uint64_t result = type metadata accessor for URL();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for ObservationRegistrar();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_updateClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_1001035F4(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_10010363C()
{
  *(unsigned char *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC16MusicRecognition20ContextMenuViewModel__shareSheetFromOverflow) = *(unsigned char *)(v0 + 24);
}

ValueMetadata *type metadata accessor for LibraryItemView()
{
  return &type metadata for LibraryItemView;
}

uint64_t sub_100103664()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100103680@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1000060EC((uint64_t *)&unk_100158FC0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for LibraryItemArtwork();
  uint64_t v8 = __chkstk_darwin(v7);
  int v10 = (char *)v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v13 = (char *)v24 - v12;
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)v24 - v14;
  id v16 = [a1 artworkURL];
  if (v16)
  {
    uint64_t v17 = v16;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v18 = type metadata accessor for URL();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v6, 0, 1, v18);
  }
  else
  {
    uint64_t v19 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v6, 1, 1, v19);
  }
  sub_100009F78((uint64_t)v6, (uint64_t)v13);
  v24[1] = 0x404E000000000000;
  sub_10008A53C();
  ScaledMetric.init(wrappedValue:)();
  uint64_t v20 = (uint64_t *)&v13[*(int *)(v7 + 24)];
  *uint64_t v20 = swift_getKeyPath();
  sub_1000060EC(&qword_100156938);
  swift_storeEnumTagMultiPayload();
  sub_10008A598((uint64_t)v13, (uint64_t)v15);
  sub_10008A5FC((uint64_t)v15, (uint64_t)v10);
  sub_10008A5FC((uint64_t)v10, a2);
  uint64_t v21 = a2 + *(int *)(sub_1000060EC(&qword_10015DBC8) + 48);
  *(void *)uint64_t v21 = a1;
  *(unsigned char *)(v21 + 8) = 0;
  id v22 = a1;
  sub_10008A68C((uint64_t)v15);

  return sub_10008A68C((uint64_t)v10);
}

uint64_t sub_100103900@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  *(void *)a1 = static VerticalAlignment.center.getter();
  *(void *)(a1 + 8) = 0x4028000000000000;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v4 = sub_1000060EC(&qword_10015DBC0);
  return sub_100103680(v3, a1 + *(int *)(v4 + 44));
}

unint64_t sub_10010395C()
{
  unint64_t result = qword_10015DBD0;
  if (!qword_10015DBD0)
  {
    sub_100006224(&qword_10015DBD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015DBD0);
  }
  return result;
}

uint64_t destroy for CircularProgressView()
{
  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

void *initializeWithCopy for CircularProgressView(void *a1, void *a2)
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
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for CircularProgressView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  a1[4] = a2[4];
  swift_retain();
  swift_release();
  a1[5] = a2[5];
  return a1;
}

uint64_t assignWithTake for CircularProgressView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for CircularProgressView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CircularProgressView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CircularProgressView()
{
  return &type metadata for CircularProgressView;
}

uint64_t sub_100103C18()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100103C34@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v32 = a1;
  uint64_t v3 = sub_1000060EC(&qword_10015DBE0);
  uint64_t v4 = v3 - 8;
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for CoordinateSpace();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  int v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000060EC(&qword_10015DBE8);
  uint64_t v12 = v11 - 8;
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = static Alignment.center.getter();
  uint64_t v30 = v16;
  uint64_t v31 = v15;
  sub_100104010(v1, (uint64_t)v36);
  long long v48 = v36[10];
  long long v49 = v36[11];
  uint64_t v50 = v37;
  long long v44 = v36[6];
  long long v45 = v36[7];
  long long v46 = v36[8];
  long long v47 = v36[9];
  long long v40 = v36[2];
  long long v41 = v36[3];
  long long v42 = v36[4];
  long long v43 = v36[5];
  long long v38 = v36[0];
  long long v39 = v36[1];
  long long v35 = *(_OWORD *)(v1 + 1);
  v51[0] = *(_OWORD *)(v1 + 1);
  sub_1000060EC(&qword_10015DBF0);
  State.wrappedValue.getter();
  char v17 = static Edge.Set.all.getter();
  EdgeInsets.init(_all:)();
  *(void *)&v51[0] = v31;
  *((void *)&v51[0] + 1) = v30;
  v51[11] = v48;
  v51[12] = v49;
  *(void *)&v51[13] = v50;
  v51[7] = v44;
  v51[8] = v45;
  v51[9] = v46;
  v51[10] = v47;
  v51[3] = v40;
  v51[4] = v41;
  v51[5] = v42;
  v51[6] = v43;
  v51[1] = v38;
  v51[2] = v39;
  BYTE8(v51[13]) = v17;
  *(void *)&v51[14] = v18;
  *((void *)&v51[14] + 1) = v19;
  *(void *)&v51[15] = v20;
  *((void *)&v51[15] + 1) = v21;
  LOBYTE(v51[16]) = 0;
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for CoordinateSpace.local(_:), v7);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(&v6[*(int *)(v4 + 44)], v10, v7);
  *(void *)uint64_t v6 = &type metadata for CircularWidthHeightPreferenceKey;
  id v22 = (void (**)(double *@<X8>, double@<D2>, double@<D3>))&v6[*(int *)(v4 + 48)];
  *id v22 = sub_10004FA84;
  v22[1] = 0;
  sub_100009C94((uint64_t)v6, (uint64_t)&v14[*(int *)(v12 + 44)], &qword_10015DBE0);
  memcpy(v14, v51, 0x101uLL);
  sub_10010431C((uint64_t)v51);
  sub_1000063D0((uint64_t)v6, &qword_10015DBE0);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_100104388((uint64_t)v36);
  uint64_t v23 = *v2;
  uint64_t v33 = v2[3];
  uint64_t v34 = v23;
  uint64_t v24 = (uint64_t (*)())swift_allocObject();
  long long v25 = *((_OWORD *)v2 + 1);
  *((_OWORD *)v24 + 1) = *(_OWORD *)v2;
  *((_OWORD *)v24 + 2) = v25;
  *((_OWORD *)v24 + 3) = *((_OWORD *)v2 + 2);
  uint64_t v26 = v32;
  sub_100009C94((uint64_t)v14, v32, &qword_10015DBE8);
  uint64_t v27 = (uint64_t (**)())(v26 + *(int *)(sub_1000060EC(&qword_10015DBF8) + 36));
  *uint64_t v27 = sub_100104444;
  v27[1] = v24;
  sub_100058D98((uint64_t)&v34);
  sub_1001044A0((uint64_t)&v35);
  sub_100058D98((uint64_t)&v33);
  swift_retain();
  return sub_1000063D0((uint64_t)v14, &qword_10015DBE8);
}

uint64_t sub_100104010@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v19 = *a1;
  uint64_t v22 = Color.opacity(_:)();
  sub_1000060EC(&qword_10015DBF0);
  State.wrappedValue.getter();
  StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
  uint64_t v3 = static Alignment.center.getter();
  uint64_t v20 = v4;
  uint64_t v21 = v3;
  sub_1000060EC(&qword_10015DC00);
  Binding.wrappedValue.getter();
  uint64_t v5 = *(void *)&v31[0];
  swift_retain();
  State.wrappedValue.getter();
  StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
  uint64_t v6 = static Alignment.center.getter();
  uint64_t v8 = v7;
  static UnitPoint.center.getter();
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v13 = static Animation.easeOut.getter();
  Binding.wrappedValue.getter();
  uint64_t v14 = *(void *)&v31[0];
  *(void *)&v31[0] = 0;
  *((void *)&v31[0] + 1) = v5;
  v31[1] = v28;
  long long v32 = v29;
  *(void *)&long long v33 = v30;
  *((void *)&v33 + 1) = v19;
  LOWORD(v34) = 256;
  *((void *)&v34 + 1) = v6;
  *(void *)&long long v35 = v8;
  *((void *)&v35 + 1) = 0xBFF921FB54442D18;
  *(void *)&long long v36 = v10;
  *((void *)&v36 + 1) = v12;
  *(void *)&long long v37 = v13;
  *((void *)&v37 + 1) = v14;
  *(_OWORD *)(a2 + 72) = v31[0];
  long long v15 = v32;
  *(_OWORD *)(a2 + 120) = v33;
  *(_OWORD *)(a2 + 104) = v15;
  long long v16 = v37;
  *(_OWORD *)(a2 + 168) = v36;
  long long v17 = v34;
  *(_OWORD *)(a2 + 152) = v35;
  *(_OWORD *)(a2 + 136) = v17;
  *(_OWORD *)(a2 + 88) = v28;
  *(_OWORD *)(a2 + 184) = v16;
  *(void *)a2 = v23;
  *(void *)(a2 + 8) = v24;
  *(void *)(a2 + 16) = v25;
  *(void *)(a2 + 24) = v26;
  *(void *)(a2 + 32) = v27;
  *(void *)(a2 + 40) = v22;
  *(_WORD *)(a2 + 48) = 256;
  *(void *)(a2 + 56) = v21;
  *(void *)(a2 + 64) = v20;
  v38[0] = 0;
  v38[1] = v5;
  long long v39 = v28;
  long long v40 = v29;
  uint64_t v41 = v30;
  uint64_t v42 = v19;
  __int16 v43 = 256;
  uint64_t v44 = v6;
  uint64_t v45 = v8;
  unint64_t v46 = 0xBFF921FB54442D18;
  uint64_t v47 = v10;
  uint64_t v48 = v12;
  uint64_t v49 = v13;
  uint64_t v50 = v14;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1001044CC((uint64_t)v31);
  sub_100104518((uint64_t)v38);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1001042E0@<X0>(uint64_t a1@<X8>)
{
  return sub_100103C34(a1);
}

uint64_t sub_10010431C(uint64_t a1)
{
  return a1;
}

uint64_t sub_100104388(uint64_t a1)
{
  return a1;
}

uint64_t sub_1001043F4()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_100104444()
{
  return State.wrappedValue.setter();
}

uint64_t sub_1001044A0(uint64_t a1)
{
  return a1;
}

uint64_t sub_1001044CC(uint64_t a1)
{
  return a1;
}

uint64_t sub_100104518(uint64_t a1)
{
  return a1;
}

ValueMetadata *type metadata accessor for CircularWidthHeightPreferenceKey()
{
  return &type metadata for CircularWidthHeightPreferenceKey;
}

unint64_t sub_100104578()
{
  unint64_t result = qword_10015DC08;
  if (!qword_10015DC08)
  {
    sub_100006224(&qword_10015DBF8);
    sub_100104618();
    sub_100006480(&qword_10015DC40, &qword_10015DC48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015DC08);
  }
  return result;
}

unint64_t sub_100104618()
{
  unint64_t result = qword_10015DC10;
  if (!qword_10015DC10)
  {
    sub_100006224(&qword_10015DBE8);
    sub_1001046B8();
    sub_100006480(&qword_10015DC38, &qword_10015DBE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015DC10);
  }
  return result;
}

unint64_t sub_1001046B8()
{
  unint64_t result = qword_10015DC18;
  if (!qword_10015DC18)
  {
    sub_100006224(&qword_10015DC20);
    sub_100006480(&qword_10015DC28, &qword_10015DC30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015DC18);
  }
  return result;
}

unint64_t sub_100104758(uint64_t a1)
{
  unint64_t result = sub_100104780();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_100104780()
{
  unint64_t result = qword_10015DC50;
  if (!qword_10015DC50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10015DC50);
  }
  return result;
}

void sub_1001047D4(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) == 0 && a2)
  {
    swift_errorRetain();
    if (qword_100156018 != -1) {
      swift_once();
    }
    uint64_t v10 = type metadata accessor for Logger();
    sub_10000E808(v10, (uint64_t)qword_100164B38);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a3, v6);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = swift_slowAlloc();
      long long v17 = (void *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      uint64_t v20 = v18;
      *(_DWORD *)uint64_t v13 = 136315394;
      sub_100104F60();
      uint64_t v14 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v19 = sub_1000CB67C(v14, v15, &v20);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      *(_WORD *)(v13 + 12) = 2112;
      swift_errorRetain();
      uint64_t v16 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v19 = v16;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *long long v17 = v16;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Failed to launch url: %s error: %@", (uint8_t *)v13, 0x16u);
      sub_1000060EC((uint64_t *)&unk_1001570F0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      swift_errorRelease();
      swift_errorRelease();
    }
  }
}

void sub_100104B0C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void sub_100104B84(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2);
  id v5 = [objc_allocWithZone((Class)_LSOpenConfiguration) init];
  sub_1000060EC(&qword_100158ED8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1001118A0;
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 40) = v7;
  *(void *)(inited + 72) = &type metadata for Bool;
  *(unsigned char *)(inited + 48) = 1;
  *(void *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 88) = v8;
  *(void *)(inited + 120) = &type metadata for Bool;
  *(unsigned char *)(inited + 96) = 1;
  sub_1000E8C84(inited);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v5 setFrontBoardOptions:isa];

  uint64_t v10 = self;
  URL._bridgeToObjectiveC()(v11);
  uint64_t v13 = v12;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  unint64_t v14 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v15 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v15 + v14, (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  aBlock[4] = sub_100104EC8;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100104B0C;
  aBlock[3] = &unk_10014E320;
  uint64_t v16 = _Block_copy(aBlock);
  id v17 = v5;
  swift_release();
  [v10 openWithURL:v13 configuration:v17 completionHandler:v16];
  _Block_release(v16);
}

uint64_t sub_100104E38()
{
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

void sub_100104EC8(char a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(type metadata accessor for URL() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  sub_1001047D4(a1, a2, v6);
}

uint64_t sub_100104F48(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100104F58()
{
  return swift_release();
}

unint64_t sub_100104F60()
{
  unint64_t result = qword_100156B88;
  if (!qword_100156B88)
  {
    type metadata accessor for URL();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100156B88);
  }
  return result;
}

uint64_t initializeWithCopy for AnyPlaylist(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for AnyPlaylist(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

__n128 initializeWithTake for AnyPlaylist(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for AnyPlaylist(uint64_t a1, uint64_t a2)
{
  _s16MusicRecognition11AnyPlaylistVwxx_0(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for AnyPlaylist(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AnyPlaylist(uint64_t result, int a2, int a3)
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AnyPlaylist()
{
  return &type metadata for AnyPlaylist;
}

uint64_t sub_10010512C()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  sub_100010740(v0, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2);
}

uint64_t sub_100105180()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  sub_100010740(v0, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v1, v2);
}

uint64_t sub_1001051D4()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  sub_100010740(v0, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 24))(v1, v2) & 1;
}

uint64_t sub_10010522C()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  sub_100010740(v0, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 32))(v1, v2);
}

unsigned char *storeEnumTagSinglePayload for MusicRecognitionPlatterPresentationStyle(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10010534CLL);
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

ValueMetadata *type metadata accessor for MusicRecognitionPlatterPresentationStyle()
{
  return &type metadata for MusicRecognitionPlatterPresentationStyle;
}

unint64_t sub_100105388()
{
  unint64_t result = qword_10015DC58;
  if (!qword_10015DC58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_10015DC58);
  }
  return result;
}

uint64_t sub_1001053DC()
{
  v1[2] = v0;
  sub_1000060EC((uint64_t *)&unk_100158FC0);
  v1[3] = swift_task_alloc();
  uint64_t v2 = type metadata accessor for URL();
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  v1[6] = swift_task_alloc();
  v1[7] = swift_task_alloc();
  return _swift_task_switch(sub_1001054DC, 0, 0);
}

uint64_t sub_1001054DC()
{
  id v1 = [*(id *)(v0 + 16) artworkURL];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v4 = *(void *)(v0 + 40);
    uint64_t v3 = *(void *)(v0 + 48);
    uint64_t v6 = *(void *)(v0 + 24);
    uint64_t v5 = *(void *)(v0 + 32);
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32);
    v7(v6, v3, v5);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v4 + 56))(v6, 0, 1, v5);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v6, 1, v5) != 1)
    {
      v7(*(void *)(v0 + 56), *(void *)(v0 + 24), *(void *)(v0 + 32));
      os_log_type_t v12 = (uint64_t (*)(uint64_t))((char *)&dword_100158FD0 + dword_100158FD0);
      uint64_t v8 = (void *)swift_task_alloc();
      *(void *)(v0 + 64) = v8;
      *uint64_t v8 = v0;
      v8[1] = sub_1001056CC;
      uint64_t v9 = *(void *)(v0 + 56);
      return v12(v9);
    }
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 40) + 56))(*(void *)(v0 + 24), 1, 1, *(void *)(v0 + 32));
  }
  sub_10001ABF4(*(void *)(v0 + 24));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
  return v11(0);
}

uint64_t sub_1001056CC(uint64_t a1)
{
  uint64_t v4 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    swift_errorRelease();
    uint64_t v5 = sub_100105894;
  }
  else
  {
    *(void *)(v4 + 72) = a1;
    uint64_t v5 = sub_1001057F8;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_1001057F8()
{
  uint64_t v1 = v0[9];
  (*(void (**)(void, void))(v0[5] + 8))(v0[7], v0[4]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(uint64_t))v0[1];
  return v2(v1);
}

uint64_t sub_100105894()
{
  (*(void (**)(void, void))(v0[5] + 8))(v0[7], v0[4]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1(0);
}

uint64_t sub_100105924(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[13] = a4;
  v5[14] = a5;
  v5[11] = a2;
  v5[12] = a3;
  v5[10] = a1;
  sub_1000060EC(&qword_10015DC70);
  v5[15] = swift_task_alloc();
  sub_1000060EC(&qword_10015B370);
  v5[16] = swift_task_alloc();
  v5[17] = swift_task_alloc();
  sub_1000060EC(&qword_10015DC78);
  v5[18] = swift_task_alloc();
  sub_1000060EC(&qword_10015B368);
  v5[19] = swift_task_alloc();
  uint64_t v6 = sub_1000060EC(&qword_1001593C0);
  v5[20] = v6;
  v5[21] = *(void *)(v6 - 8);
  v5[22] = swift_task_alloc();
  sub_1000060EC(&qword_10015B378);
  v5[23] = swift_task_alloc();
  v5[24] = swift_task_alloc();
  v5[25] = swift_task_alloc();
  uint64_t v7 = sub_1000060EC(&qword_10015DC80);
  v5[26] = v7;
  v5[27] = *(void *)(v7 - 8);
  v5[28] = swift_task_alloc();
  uint64_t v8 = sub_1000060EC(&qword_10015DC88);
  v5[29] = v8;
  v5[30] = *(void *)(v8 - 8);
  v5[31] = swift_task_alloc();
  uint64_t v9 = type metadata accessor for MusicDataRequest.ExecutionMethod();
  v5[32] = v9;
  v5[33] = *(void *)(v9 - 8);
  v5[34] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for MusicAuthorization.Status();
  v5[35] = v10;
  v5[36] = *(void *)(v10 - 8);
  v5[37] = swift_task_alloc();
  v5[38] = swift_task_alloc();
  return _swift_task_switch(sub_100105C94, 0, 0);
}

uint64_t sub_100105C94()
{
  (*(void (**)(void, void, void))(v0[33] + 104))(v0[34], enum case for MusicDataRequest.ExecutionMethod.firstParty(_:), v0[32]);
  static MusicDataRequest.preferredExecutionMethod.setter();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[39] = v1;
  void *v1 = v0;
  v1[1] = sub_100105D5C;
  uint64_t v2 = v0[38];
  return static MusicAuthorization.request()(v2);
}

uint64_t sub_100105D5C()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100105E58, 0, 0);
}

uint64_t sub_100105E58()
{
  (*(void (**)(void, void, void))(v0[36] + 104))(v0[37], enum case for MusicAuthorization.Status.authorized(_:), v0[35]);
  sub_1001077A8(&qword_10015DC90, (void (*)(uint64_t))&type metadata accessor for MusicAuthorization.Status);
  dispatch thunk of RawRepresentable.rawValue.getter();
  dispatch thunk of RawRepresentable.rawValue.getter();
  uint64_t v2 = v0[37];
  uint64_t v1 = v0[38];
  uint64_t v3 = v0[35];
  uint64_t v4 = v0[36];
  uint64_t v5 = v0[14];
  if (v0[2] == v0[4] && v0[3] == v0[5])
  {
    swift_bridgeObjectRelease_n();
    uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
    v6(v2, v3);
    v6(v1, v3);
    if (!v5)
    {
LABEL_10:
      if (qword_100156018 != -1) {
        swift_once();
      }
      uint64_t v14 = type metadata accessor for Logger();
      sub_10000E808(v14, (uint64_t)qword_100164B38);
      uint64_t v15 = Logger.logObject.getter();
      os_log_type_t v16 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v15, v16))
      {
        id v17 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, v16, "Unexpected MusicKit authorization status", v17, 2u);
        swift_slowDealloc();
      }
      uint64_t v19 = v0[11];
      uint64_t v18 = v0[12];
      uint64_t v20 = v0[10];

      uint64_t v21 = type metadata accessor for Song();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v20, 1, 1, v21);
      uint64_t v22 = type metadata accessor for Artist();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v19, 1, 1, v22);
      uint64_t v23 = type metadata accessor for Album();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v18, 1, 1, v23);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v24 = (uint64_t (*)(void))v0[1];
      return v24();
    }
  }
  else
  {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
    v8(v2, v3);
    v8(v1, v3);
    if ((v7 & 1) == 0 || !v5) {
      goto LABEL_10;
    }
  }
  swift_getKeyPath();
  swift_bridgeObjectRetain_n();
  v0[6] = MusicItemID.init(_:)();
  v0[7] = v9;
  v0[40] = type metadata accessor for Song();
  sub_1001077A8(&qword_10015DC98, (void (*)(uint64_t))&type metadata accessor for Song);
  MusicCatalogResourceRequest.init<A>(matching:equalTo:)();
  v0[41] = sub_1000060EC(&qword_100157030);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1001169B0;
  sub_1000060EC(&qword_10015DCA0);
  *(void *)(v10 + 32) = static PartialMusicProperty<A>.albums.getter();
  *(void *)(v10 + 40) = static PartialMusicProperty<A>.artists.getter();
  *(void *)(v10 + 48) = static PartialMusicProperty<A>.editorialVideoArtworks.getter();
  specialized Array._endMutation()();
  MusicCatalogResourceRequest.properties.setter();
  MusicCatalogResourceRequest.limit.setter();
  uint64_t v11 = (void *)swift_task_alloc();
  v0[42] = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_1001063E4;
  uint64_t v12 = v0[28];
  uint64_t v13 = v0[29];
  return MusicCatalogResourceRequest.response()(v12, v13);
}

uint64_t sub_1001063E4()
{
  *(void *)(*(void *)v1 + 344) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_10010732C;
  }
  else {
    uint64_t v2 = sub_1001064F8;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1001064F8()
{
  uint64_t v2 = v0 + 24;
  uint64_t v1 = v0[24];
  uint64_t v3 = v0[40];
  uint64_t v4 = v0[25];
  uint64_t v6 = v0[21];
  uint64_t v5 = v0[22];
  uint64_t v7 = v0[20];
  MusicCatalogResourceResponse.items.getter();
  sub_100067A94(v4);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  sub_1001077F0(v4, v1);
  uint64_t v8 = *(void *)(v3 - 8);
  uint64_t v9 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
  if (v9(v1, 1, v3) == 1)
  {
    uint64_t v10 = &qword_10015B378;
LABEL_5:
    sub_1000063D0(*v2, v10);
    uint64_t v16 = v0[19];
    uint64_t v17 = type metadata accessor for Album();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 1, 1, v17);
    goto LABEL_7;
  }
  uint64_t v2 = v0 + 18;
  uint64_t v11 = v0[18];
  uint64_t v12 = v0[40];
  uint64_t v13 = v0[24];
  Song.albums.getter();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v13, v12);
  uint64_t v14 = sub_1000060EC(&qword_1001593A0);
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v11, 1, v14) == 1)
  {
    uint64_t v10 = (uint64_t *)&unk_10015DC78;
    goto LABEL_5;
  }
  uint64_t v18 = v0[18];
  sub_100067ABC(v0[19]);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v18, v14);
LABEL_7:
  uint64_t v19 = v0[40];
  uint64_t v20 = v0[23];
  sub_1001077F0(v0[25], v20);
  if (v9(v20, 1, v19) == 1)
  {
    uint64_t v22 = v0[30];
    uint64_t v21 = v0[31];
    uint64_t v24 = v0[28];
    uint64_t v23 = v0[29];
    uint64_t v25 = v0[26];
    uint64_t v26 = v0[27];
    uint64_t v27 = v0[23];
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v24, v25);
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
    long long v28 = &qword_10015B378;
LABEL_13:
    sub_1000063D0(v27, v28);
    uint64_t v50 = v0[17];
    uint64_t v51 = type metadata accessor for Artist();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56))(v50, 1, 1, v51);
    uint64_t v52 = v0[19];
    uint64_t v53 = v0[17];
    uint64_t v55 = v0[11];
    uint64_t v54 = v0[12];
    sub_100009C30(v0[25], v0[10], &qword_10015B378);
    sub_100009C30(v53, v55, &qword_10015B370);
    sub_100009C30(v52, v54, &qword_10015B368);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v56 = (uint64_t (*)(void))v0[1];
    return v56();
  }
  uint64_t v29 = v0[40];
  uint64_t v30 = v0[23];
  uint64_t v31 = v0[15];
  Song.artists.getter();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v30, v29);
  uint64_t v32 = sub_1000060EC(&qword_1001593B0);
  uint64_t v33 = *(void *)(v32 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v33 + 48))(v31, 1, v32) == 1)
  {
    uint64_t v35 = v0[30];
    uint64_t v34 = v0[31];
    uint64_t v37 = v0[28];
    uint64_t v36 = v0[29];
    uint64_t v38 = v0[26];
    uint64_t v39 = v0[27];
    uint64_t v27 = v0[15];
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v37, v38);
    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v34, v36);
    long long v28 = (uint64_t *)&unk_10015DC70;
    goto LABEL_13;
  }
  uint64_t v40 = v0[15];
  uint64_t v41 = v0[16];
  sub_100067AE4(v41);
  (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v40, v32);
  uint64_t v42 = type metadata accessor for Artist();
  v0[44] = v42;
  uint64_t v43 = *(void *)(v42 - 8);
  v0[45] = v43;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v43 + 48))(v41, 1, v42) == 1)
  {
    uint64_t v45 = v0[30];
    uint64_t v44 = v0[31];
    uint64_t v47 = v0[28];
    uint64_t v46 = v0[29];
    uint64_t v48 = v0[26];
    uint64_t v49 = v0[27];
    uint64_t v27 = v0[16];
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v47, v48);
    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v44, v46);
    long long v28 = &qword_10015B370;
    goto LABEL_13;
  }
  uint64_t v58 = swift_allocObject();
  *(_OWORD *)(v58 + 16) = xmmword_100112420;
  sub_1000060EC(&qword_10015DCA8);
  *(void *)(v58 + 32) = static PartialMusicProperty<A>.biography.getter();
  specialized Array._endMutation()();
  v0[46] = v58;
  uint64_t v59 = (void *)swift_task_alloc();
  v0[47] = v59;
  *uint64_t v59 = v0;
  v59[1] = sub_100106B80;
  uint64_t v60 = v0[17];
  return dispatch thunk of MusicPropertyContainer.with(_:)(v60, v58, v42, &protocol witness table for Artist);
}

uint64_t sub_100106B80()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 384) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0)
  {
    uint64_t v3 = sub_100106E98;
  }
  else
  {
    uint64_t v4 = v2[44];
    uint64_t v5 = v2[45];
    uint64_t v6 = v2[16];
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v6, v4);
    uint64_t v3 = sub_100106CE0;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_100106CE0()
{
  uint64_t v1 = v0[44];
  uint64_t v2 = v0[45];
  uint64_t v4 = v0[30];
  uint64_t v3 = v0[31];
  uint64_t v5 = v0[29];
  uint64_t v6 = v0[17];
  (*(void (**)(void, void))(v0[27] + 8))(v0[28], v0[26]);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v2 + 56))(v6, 0, 1, v1);
  uint64_t v7 = v0[19];
  uint64_t v8 = v0[17];
  uint64_t v10 = v0[11];
  uint64_t v9 = v0[12];
  sub_100009C30(v0[25], v0[10], &qword_10015B378);
  sub_100009C30(v8, v10, &qword_10015B370);
  sub_100009C30(v7, v9, &qword_10015B368);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_100106E98()
{
  long long v28 = v0;
  uint64_t v1 = v0[44];
  uint64_t v2 = v0[45];
  uint64_t v4 = v0[27];
  uint64_t v3 = v0[28];
  uint64_t v6 = v0[25];
  uint64_t v5 = v0[26];
  uint64_t v7 = v0[16];
  sub_1000063D0(v0[19], &qword_10015B368);
  sub_1000063D0(v6, &qword_10015B378);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v7, v1);
  if (qword_100156018 != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  sub_10000E808(v8, (uint64_t)qword_100164B38);
  swift_errorRetain();
  swift_bridgeObjectRetain();
  swift_errorRetain();
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.error.getter();
  BOOL v11 = os_log_type_enabled(v9, v10);
  uint64_t v13 = v0[30];
  uint64_t v12 = v0[31];
  uint64_t v14 = v0[29];
  unint64_t v15 = v0[14];
  if (v11)
  {
    uint64_t v26 = v0[29];
    uint64_t v16 = v0[13];
    uint64_t v17 = swift_slowAlloc();
    uint64_t v25 = (void *)swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    *(_DWORD *)uint64_t v17 = 136315394;
    swift_bridgeObjectRetain();
    v0[8] = sub_1000CB67C(v16, v15, &v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v17 + 12) = 2112;
    swift_errorRetain();
    uint64_t v18 = _swift_stdlib_bridgeErrorToNSError();
    v0[9] = v18;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v25 = v18;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Error fetching metadata for song %s: %@", (uint8_t *)v17, 0x16u);
    sub_1000060EC((uint64_t *)&unk_1001570F0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v26);
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();
    swift_bridgeObjectRelease_n();
    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  uint64_t v19 = v0[11];
  uint64_t v20 = v0[12];
  (*(void (**)(void, uint64_t, uint64_t))(*(void *)(v0[40] - 8) + 56))(v0[10], 1, 1);
  uint64_t v21 = type metadata accessor for Artist();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v19, 1, 1, v21);
  uint64_t v22 = type metadata accessor for Album();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v20, 1, 1, v22);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v23 = (uint64_t (*)(void))v0[1];
  return v23();
}

uint64_t sub_10010732C()
{
  uint64_t v21 = v0;
  if (qword_100156018 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_10000E808(v1, (uint64_t)qword_100164B38);
  swift_errorRetain();
  swift_bridgeObjectRetain();
  swift_errorRetain();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.error.getter();
  BOOL v4 = os_log_type_enabled(v2, v3);
  uint64_t v6 = v0[30];
  uint64_t v5 = v0[31];
  uint64_t v7 = v0[29];
  unint64_t v8 = v0[14];
  if (v4)
  {
    uint64_t v19 = v0[29];
    uint64_t v9 = v0[13];
    uint64_t v10 = swift_slowAlloc();
    uint64_t v18 = (void *)swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315394;
    swift_bridgeObjectRetain();
    v0[8] = sub_1000CB67C(v9, v8, &v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v10 + 12) = 2112;
    swift_errorRetain();
    uint64_t v11 = _swift_stdlib_bridgeErrorToNSError();
    v0[9] = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v18 = v11;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Error fetching metadata for song %s: %@", (uint8_t *)v10, 0x16u);
    sub_1000060EC((uint64_t *)&unk_1001570F0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v19);
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();
    swift_bridgeObjectRelease_n();
    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  }
  uint64_t v12 = v0[11];
  uint64_t v13 = v0[12];
  (*(void (**)(void, uint64_t, uint64_t))(*(void *)(v0[40] - 8) + 56))(v0[10], 1, 1);
  uint64_t v14 = type metadata accessor for Artist();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v12, 1, 1, v14);
  uint64_t v15 = type metadata accessor for Album();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v13, 1, 1, v15);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_100107760@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_100010740(a1, a1[3]);
  uint64_t result = dispatch thunk of SongFilter.id.getter();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1001077A8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1001077F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000060EC(&qword_10015B378);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void **sub_100107858(void **a1, void **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v5 = a1;
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    unint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = type metadata accessor for Logger();
    uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    uint64_t v11 = v4;
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t sub_100107938(id *a1, uint64_t a2)
{
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void **sub_1001079B0(void **a1, void **a2, uint64_t a3)
{
  uint64_t v4 = *a2;
  *a1 = *a2;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
  id v10 = v4;
  v9(v6, v7, v8);
  return a1;
}

void **sub_100107A44(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = *a1;
  *a1 = *a2;
  id v8 = v6;

  uint64_t v9 = *(int *)(a3 + 20);
  id v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = type metadata accessor for Logger();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

void *sub_100107AD4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = type metadata accessor for Logger();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void **sub_100107B50(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  uint64_t v7 = *(int *)(a3 + 20);
  id v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for Logger();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_100107BDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100107BF0);
}

uint64_t sub_100107BF0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for Logger();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_100107CA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100107CB4);
}

void *sub_100107CB4(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for Logger();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for LocationManager()
{
  uint64_t result = qword_10015DD08;
  if (!qword_10015DD08) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100107DA8()
{
  uint64_t result = type metadata accessor for Logger();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

id sub_100107E44()
{
  unint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for LocationManager();
  uint64_t v3 = v2 - 8;
  __chkstk_darwin(v2);
  uint64_t v5 = (id *)((char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)v24 - v11;
  unsigned int v13 = [*v1 authorizationStatus];
  uint64_t v14 = (char *)v1 + *(int *)(v3 + 28);
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  if (v13)
  {
    v15(v10, v14, v6);
    sub_100108138((uint64_t)v1, (uint64_t)v5);
    uint64_t v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 67109120;
      unsigned int v19 = [*v5 authorizationStatus];
      sub_10010819C((uint64_t)v5);
      void v24[3] = v19;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Location status is %d, not requesting authorization", v18, 8u);
      swift_slowDealloc();
    }
    else
    {
      sub_10010819C((uint64_t)v5);
    }

    return (id)(*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  else
  {
    v15(v12, v14, v6);
    uint64_t v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Location status is notDetermined, requesting authorization", v22, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
    return [*v1 requestWhenInUseAuthorization];
  }
}

uint64_t sub_100108138(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LocationManager();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10010819C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LocationManager();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1001081F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10010820C);
}

uint64_t sub_10010820C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000060EC((uint64_t *)&unk_100158FC0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 24);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_1001082D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1001082E8);
}

uint64_t sub_1001082E8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1000060EC((uint64_t *)&unk_100158FC0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 24) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for AnySong()
{
  uint64_t result = qword_10015DD98;
  if (!qword_10015DD98) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1001083F8()
{
  sub_10000ABC4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_10010848C(uint64_t a1)
{
  uint64_t v2 = (void *)(v1 + *(int *)(a1 + 20));
  uint64_t v3 = v2[3];
  uint64_t v4 = v2[4];
  sub_100010740(v2, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v3, v4);
}

uint64_t sub_1001084E4(uint64_t a1)
{
  uint64_t v2 = (void *)(v1 + *(int *)(a1 + 20));
  uint64_t v3 = v2[3];
  uint64_t v4 = v2[4];
  sub_100010740(v2, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16))(v3, v4);
}

uint64_t sub_10010853C(uint64_t a1)
{
  uint64_t v2 = (void *)(v1 + *(int *)(a1 + 20));
  uint64_t v3 = v2[3];
  uint64_t v4 = v2[4];
  sub_100010740(v2, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 24))(v3, v4);
}

uint64_t sub_100108594(uint64_t a1)
{
  uint64_t v2 = (void *)(v1 + *(int *)(a1 + 20));
  uint64_t v3 = v2[3];
  uint64_t v4 = v2[4];
  sub_100010740(v2, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 32))(v3, v4);
}

uint64_t sub_1001085EC(uint64_t a1)
{
  uint64_t v2 = (void *)(v1 + *(int *)(a1 + 20));
  uint64_t v3 = v2[3];
  uint64_t v4 = v2[4];
  sub_100010740(v2, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 40))(v3, v4);
}

uint64_t sub_10010864C(uint64_t a1)
{
  uint64_t v2 = (void *)(v1 + *(int *)(a1 + 20));
  uint64_t v3 = v2[3];
  uint64_t v4 = v2[4];
  sub_100010740(v2, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 48))(v3, v4);
}

uint64_t sub_1001086AC(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = type metadata accessor for URL();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  sub_1000060EC((uint64_t *)&unk_100158FC0);
  v2[7] = swift_task_alloc();
  v2[8] = swift_task_alloc();
  type metadata accessor for MainActor();
  v2[9] = static MainActor.shared.getter();
  uint64_t v5 = dispatch thunk of Actor.unownedExecutor.getter();
  v2[10] = v5;
  v2[11] = v4;
  return _swift_task_switch(sub_1001087E0, v5, v4);
}

uint64_t sub_1001087E0()
{
  uint64_t v1 = *(void **)(*(void *)(v0 + 24) + OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_placeholderArtworkView);
  id v2 = [*(id *)(v0 + 16) artworkURL];
  uint64_t v3 = *(void *)(v0 + 64);
  if (!v2)
  {
    uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 40) + 56);
    v8(*(void *)(v0 + 64), 1, 1, *(void *)(v0 + 32));
    goto LABEL_5;
  }
  uint64_t v4 = v2;
  uint64_t v6 = *(void *)(v0 + 40);
  uint64_t v5 = *(void *)(v0 + 48);
  uint64_t v7 = *(void *)(v0 + 32);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v3, v5, v7);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56);
  uint64_t v9 = 1;
  v8(v3, 0, 1, v7);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v3, 1, v7) == 1) {
LABEL_5:
  }
    uint64_t v9 = 0;
  unint64_t v10 = *(void **)(v0 + 16);
  uint64_t v11 = *(void *)(v0 + 24);
  sub_10001ABF4(*(void *)(v0 + 64));
  [v1 setHidden:v9];
  uint64_t v12 = *(void **)(v11 + OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_albumArtImageView);
  *(void *)(v0 + 96) = v12;
  id v13 = [v10 artworkURL];
  uint64_t v14 = *(void *)(v0 + 56);
  if (!v13)
  {
    v8(*(void *)(v0 + 56), 1, 1, *(void *)(v0 + 32));
    goto LABEL_10;
  }
  uint64_t v15 = v13;
  uint64_t v17 = *(void *)(v0 + 40);
  uint64_t v16 = *(void *)(v0 + 48);
  uint64_t v18 = *(void *)(v0 + 32);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 32))(v14, v16, v18);
  v8(v14, 0, 1, v18);
  int v19 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 48))(v14, 1, v18);
  uint64_t v20 = 0;
  if (v19 == 1) {
LABEL_10:
  }
    uint64_t v20 = 1;
  sub_10001ABF4(*(void *)(v0 + 56));
  [v12 setHidden:v20];
  os_log_type_t v21 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v21;
  *os_log_type_t v21 = v0;
  v21[1] = sub_100108A6C;
  return sub_1001053DC();
}

uint64_t sub_100108A6C(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 112) = a1;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 88);
  uint64_t v4 = *(void *)(v2 + 80);
  return _swift_task_switch(sub_100108B94, v4, v3);
}

uint64_t sub_100108B94()
{
  uint64_t v1 = (void *)v0[14];
  uint64_t v2 = (void *)v0[12];
  swift_release();
  [v2 setImage:v1];

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

id sub_100108C40()
{
  return sub_100108C68(&OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView____lazy_storage___placeholderViewCenterYConstraint, &OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_placeholderArtworkView);
}

id sub_100108C54()
{
  return sub_100108C68(&OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView____lazy_storage___albumArtImageViewCenterYConstraint, &OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_albumArtImageView);
}

id sub_100108C68(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(void **)(v2 + *a1);
  if (v4)
  {
    id v5 = *(id *)(v2 + *a1);
  }
  else
  {
    id v6 = [*(id *)(v2 + *a2) centerYAnchor];
    id v7 = [*(id *)(v2 + OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_albumArtContainerView) centerYAnchor];
    id v8 = [v6 constraintEqualToAnchor:v7 constant:391.0];

    uint64_t v9 = *(void **)(v2 + v3);
    *(void *)(v2 + v3) = v8;
    id v5 = v8;

    uint64_t v4 = 0;
  }
  id v10 = v4;
  return v5;
}

id sub_100108D3C()
{
  id result = [objc_allocWithZone((Class)UIColor) initWithRed:0.6 green:0.6 blue:0.6 alpha:1.0];
  qword_10015DDD0 = (uint64_t)result;
  return result;
}

id sub_100108D88()
{
  id result = [objc_allocWithZone((Class)UIColor) initWithRed:0.447058824 green:0.447058824 blue:0.447058824 alpha:0.6];
  qword_10015DDD8 = (uint64_t)result;
  return result;
}

void sub_100108DD8()
{
  id v0 = [self whiteColor];
  id v1 = [v0 colorWithAlphaComponent:0.15];

  qword_10015DDE0 = (uint64_t)v1;
}

id sub_100108E48()
{
  id result = [objc_allocWithZone((Class)UIColor) initWithRed:0.0980392157 green:0.0980392157 blue:0.0980392157 alpha:1.0];
  qword_10015DDE8 = (uint64_t)result;
  return result;
}

__n128 sub_100108E90()
{
  __asm { FMOV            V0.2D, #24.0 }
  xmmword_10015DDF0 = (__int128)result;
  return result;
}

void sub_100108EA4()
{
  qword_10015DE00 = 0x636973756DLL;
  *(void *)algn_10015DE08 = 0xE500000000000000;
}

void sub_100108EC4(double a1, double a2, double a3, double a4)
{
  id v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v11 = type metadata accessor for ArtworkUnavailableView();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v33 - v16;
  uint64_t v18 = qword_100156618;
  int v19 = v5;
  if (v18 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  ArtworkUnavailableView.init(placeholderImage:widthRatio:heightRatio:)();
  id v20 = objc_allocWithZone((Class)sub_1000060EC(&qword_10015DE98));
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
  os_log_type_t v21 = (void *)UIHostingController.init(rootView:)();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v11);
  id v22 = [v21 view];

  if (v22)
  {
    *(void *)&v19[OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_placeholderArtworkView] = v22;
    uint64_t v23 = OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_albumArtContainerView;
    *(void *)&v19[v23] = [objc_allocWithZone((Class)UIView) initWithFrame:0.0, 0.0, 0.0, 0.0];
    uint64_t v24 = OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_albumArtImageView;
    *(void *)&v19[v24] = [objc_allocWithZone((Class)UIImageView) initWithFrame:0.0, 0.0, 0.0, 0.0];
    uint64_t v25 = OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_titleLabel;
    *(void *)&v19[v25] = [objc_allocWithZone((Class)UILabel) initWithFrame:0.0, 0.0, 0.0, 0.0];
    uint64_t v26 = OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_artistLabel;
    *(void *)&v19[v26] = [objc_allocWithZone((Class)UILabel) initWithFrame:0.0, 0.0, 0.0, 0.0];
    uint64_t v27 = OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_shazamLogoImageView;
    *(void *)&v19[v27] = [objc_allocWithZone((Class)UIImageView) initWithFrame:0.0, 0.0, 0.0, 0.0];
    uint64_t v28 = OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_shazamCountLabel;
    *(void *)&v19[v28] = [objc_allocWithZone((Class)UILabel) initWithFrame:0.0, 0.0, 0.0, 0.0];
    uint64_t v29 = OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_trackDetailsStackView;
    *(void *)&v19[v29] = [objc_allocWithZone((Class)UIStackView) initWithFrame:0.0, 0.0, 0.0, 0.0];
    uint64_t v30 = OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_shazamCountStackView;
    *(void *)&v19[v30] = [objc_allocWithZone((Class)UIStackView) initWithFrame:0.0, 0.0, 0.0, 0.0];
    uint64_t v31 = OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_appleMusicButton;
    *(void *)&v19[v31] = [objc_allocWithZone((Class)UIButton) initWithFrame:0.0, 0.0, 0.0, 0.0];
    *(void *)&v19[OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView____lazy_storage___albumArtImageViewCenterYConstraint] = 0;
    *(void *)&v19[OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView____lazy_storage___placeholderViewCenterYConstraint] = 0;

    v33.receiver = v19;
    v33.super_class = ObjectType;
    id v32 = [super initWithFrame:a1, a2, a3, a4];
    sub_1001092B8();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1001092B8()
{
  id v1 = v0;
  uint64_t v2 = sub_1000060EC(&qword_10015AC50);
  __chkstk_darwin(v2 - 8);
  v145 = (char *)&v140 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for UIButton.Configuration.CornerStyle();
  uint64_t v143 = *(void *)(v4 - 8);
  uint64_t v144 = v4;
  __chkstk_darwin(v4);
  v142 = (char *)&v140 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v154 = type metadata accessor for UIButton.Configuration();
  uint64_t v6 = *(void *)(v154 - 8);
  __chkstk_darwin(v154);
  id v8 = (char *)&v140 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  [v0 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v9 = *(void **)&v0[OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_trackDetailsStackView];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v1 addSubview:v9];
  id v10 = *(void **)&v1[OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_titleLabel];
  [v9 addArrangedSubview:v10];
  uint64_t v11 = *(void **)&v1[OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_artistLabel];
  [v9 addArrangedSubview:v11];
  [v9 setAxis:1];
  [v9 setDistribution:0];
  id v150 = v9;
  [v9 setAlignment:0];
  uint64_t v12 = *(void **)&v1[OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_albumArtContainerView];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v1 addSubview:v12];
  v155 = v1;
  uint64_t v13 = *(void **)&v1[OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_albumArtImageView];
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v151 = v12;
  [v12 addSubview:v13];
  [v13 _setContinuousCornerRadius:20.0];
  [v13 setClipsToBounds:1];
  id v14 = [v13 layer];
  if (qword_100156600 != -1) {
    swift_once();
  }
  v152 = v8;
  uint64_t v153 = v6;
  id v15 = [(id)qword_10015DDE0 CGColor];
  [v14 setBorderColor:v15];

  id v16 = [v13 layer];
  [v16 setBorderWidth:0.5];

  id v17 = [v13 layer];
  [v17 setBorderPathIsBounds:1];

  if (qword_1001563B0 != -1) {
    swift_once();
  }
  NSString v18 = String._bridgeToObjectiveC()();
  [v13 setAccessibilityIdentifier:v18];

  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  int v19 = self;
  id v20 = [v19 systemFontOfSize:38.0 weight:UIFontWeightSemibold];
  [v10 setFont:v20];

  os_log_type_t v21 = self;
  id v22 = [v21 whiteColor];
  [v10 setTextColor:v22];

  [v10 setNumberOfLines:2];
  LODWORD(v23) = 1132068864;
  [v10 setContentCompressionResistancePriority:0 forAxis:v23];
  if (qword_1001563A8 != -1) {
    swift_once();
  }
  NSString v24 = String._bridgeToObjectiveC()();
  [v10 setAccessibilityIdentifier:v24];

  uint64_t v25 = v155;
  uint64_t v26 = *(void **)&v155[OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_placeholderArtworkView];
  [v26 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v151 addSubview:v26];
  [v26 _setContinuousCornerRadius:20.0];
  [v26 setClipsToBounds:1];
  if (qword_1001562D8 != -1) {
    swift_once();
  }
  NSString v27 = String._bridgeToObjectiveC()();
  [v26 setAccessibilityIdentifier:v27];

  id v28 = [v26 layer];
  id v29 = [(id)qword_10015DDE0 CGColor];
  [v28 setBorderColor:v29];

  id v30 = [v26 layer];
  [v30 setBorderWidth:0.5];

  id v31 = [v26 layer];
  [v31 setBorderPathIsBounds:1];

  [v26 setOverrideUserInterfaceStyle:2];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v32 = [v19 systemFontOfSize:34.0 weight:UIFontWeightRegular];
  [v11 setFont:v32];

  [v11 setNumberOfLines:1];
  if (qword_1001565F0 != -1) {
    swift_once();
  }
  id v149 = v26;
  [v11 setTextColor:qword_10015DDD0];
  LODWORD(v33) = 1132068864;
  [v11 setContentCompressionResistancePriority:0 forAxis:v33];
  if (qword_1001563A0 != -1) {
    swift_once();
  }
  NSString v34 = String._bridgeToObjectiveC()();
  [v11 setAccessibilityIdentifier:v34];

  uint64_t v35 = *(void **)&v25[OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_shazamCountStackView];
  [v35 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v25 addSubview:v35];
  uint64_t v36 = *(void **)&v25[OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_shazamLogoImageView];
  [v35 addArrangedSubview:v36];
  [v35 setCustomSpacing:v36 afterView:4.0];
  uint64_t v37 = *(void **)&v25[OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_shazamCountLabel];
  [v35 addArrangedSubview:v37];
  [v35 setAxis:0];
  [v35 setDistribution:0];
  id v141 = v35;
  [v35 setAlignment:0];
  uint64_t v140 = sub_1000060EC(&qword_100157030);
  uint64_t v38 = swift_allocObject();
  *(_OWORD *)(v38 + 16) = xmmword_1001169B0;
  *(void *)(v38 + 32) = [v21 blackColor];
  *(void *)(v38 + 40) = [v21 blackColor];
  if (qword_1001565F8 != -1) {
    swift_once();
  }
  uint64_t v39 = (void *)qword_10015DDD8;
  *(void *)(v38 + 48) = qword_10015DDD8;
  uint64_t v156 = v38;
  specialized Array._endMutation()();
  sub_1000150F8(0, (unint64_t *)&qword_100157678);
  id v40 = v39;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v42 = [self configurationWithPaletteColors:isa];

  id v43 = v42;
  NSString v44 = String._bridgeToObjectiveC()();
  uint64_t v45 = self;
  id v46 = [v45 systemImageNamed:v44 withConfiguration:v43];

  id v148 = v43;
  id v146 = v36;
  id v147 = v46;
  [v36 setImage:v46];
  id v47 = [v19 systemFontOfSize:20.0 weight:UIFontWeightMedium];
  [v37 setFont:v47];

  [v37 setAdjustsFontForContentSizeCategory:1];
  [v37 setTextColor:qword_10015DDD8];
  LODWORD(v48) = 1132068864;
  [v37 setContentCompressionResistancePriority:0 forAxis:v48];
  if (qword_1001562A8 != -1) {
    swift_once();
  }
  NSString v49 = String._bridgeToObjectiveC()();
  [v37 setAccessibilityIdentifier:v49];

  uint64_t v50 = v155;
  uint64_t v51 = *(void **)&v155[OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_appleMusicButton];
  [v51 setTranslatesAutoresizingMaskIntoConstraints:0];
  NSString v52 = String._bridgeToObjectiveC()();
  [v51 setAccessibilityIdentifier:v52];

  id v53 = [self mainBundle];
  v54._uint64_t countAndFlagsBits = 0xD00000000000001FLL;
  v157._object = (void *)0xE000000000000000;
  v54._object = (void *)0x800000010011A8B0;
  v55._uint64_t countAndFlagsBits = 0;
  v55._object = (void *)0xE000000000000000;
  v157._uint64_t countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v54, (Swift::String_optional)0, (NSBundle)v53, v55, v157);

  NSString v56 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v51 setAccessibilityLabel:v56];

  [v50 addSubview:v51];
  id v57 = v152;
  static UIButton.Configuration.filled()();
  NSString v58 = String._bridgeToObjectiveC()();
  id v59 = [v45 imageNamed:v58];

  UIButton.Configuration.image.setter();
  uint64_t v60 = v154;
  if (qword_100156608 != -1) {
    swift_once();
  }
  id v61 = (id)qword_10015DDE8;
  UIButton.Configuration.baseBackgroundColor.setter();
  (*(void (**)(char *, void, uint64_t))(v143 + 104))(v142, enum case for UIButton.Configuration.CornerStyle.capsule(_:), v144);
  UIButton.Configuration.cornerStyle.setter();
  uint64_t v62 = v153;
  uint64_t v63 = v145;
  (*(void (**)(char *, char *, uint64_t))(v153 + 16))(v145, v57, v60);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v62 + 56))(v63, 0, 1, v60);
  UIButton.configuration.setter();
  id v64 = [self mainScreen];
  [v64 bounds];
  CGFloat v66 = v65;
  CGFloat v68 = v67;
  CGFloat v70 = v69;
  CGFloat v72 = v71;

  v158.origin.x = v66;
  v158.origin.y = v68;
  v158.size.width = v70;
  v158.size.height = v72;
  CGFloat v73 = CGRectGetWidth(v158) + -98.0;
  v145 = (char *)self;
  uint64_t v74 = swift_allocObject();
  *(_OWORD *)(v74 + 16) = xmmword_100117440;
  id v75 = v151;
  id v76 = [v151 leadingAnchor];
  id v77 = [v50 leadingAnchor];
  id v78 = [v76 constraintEqualToAnchor:v77 constant:24.0];

  *(void *)(v74 + 32) = v78;
  id v79 = [v75 heightAnchor];
  id v80 = [v79 constraintEqualToConstant:v73];

  *(void *)(v74 + 40) = v80;
  id v81 = [v75 widthAnchor];
  id v82 = [v75 heightAnchor];
  id v83 = [v81 constraintEqualToAnchor:v82];

  *(void *)(v74 + 48) = v83;
  id v84 = [v75 centerYAnchor];
  id v85 = [v50 centerYAnchor];
  id v86 = [v84 constraintEqualToAnchor:v85];

  *(void *)(v74 + 56) = v86;
  id v87 = [v13 centerXAnchor];
  id v88 = [v75 centerXAnchor];
  id v89 = [v87 constraintEqualToAnchor:v88];

  *(void *)(v74 + 64) = v89;
  id v90 = [v13 heightAnchor];
  id v91 = [v75 heightAnchor];
  id v92 = [v90 constraintEqualToAnchor:v91];

  *(void *)(v74 + 72) = v92;
  id v93 = [v13 widthAnchor];
  id v94 = [v75 widthAnchor];
  id v95 = [v93 constraintEqualToAnchor:v94];

  *(void *)(v74 + 80) = v95;
  *(void *)(v74 + 88) = sub_100108C68(&OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView____lazy_storage___albumArtImageViewCenterYConstraint, &OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_albumArtImageView);
  id v96 = v150;
  id v97 = [v150 leadingAnchor];
  id v98 = [v75 trailingAnchor];
  id v99 = [v97 constraintEqualToAnchor:v98 constant:38.0];

  *(void *)(v74 + 96) = v99;
  id v100 = [v96 trailingAnchor];
  id v101 = [v50 trailingAnchor];
  id v102 = [v100 constraintEqualToAnchor:v101];

  *(void *)(v74 + 104) = v102;
  id v103 = [v96 centerYAnchor];
  id v104 = [v50 centerYAnchor];
  id v105 = [v103 constraintEqualToAnchor:v104];

  *(void *)(v74 + 112) = v105;
  id v106 = [v51 trailingAnchor];
  id v107 = [v50 trailingAnchor];
  id v108 = [v106 constraintEqualToAnchor:v107];

  *(void *)(v74 + 120) = v108;
  id v109 = [v51 widthAnchor];
  id v110 = [v109 constraintEqualToConstant:149.0];

  *(void *)(v74 + 128) = v110;
  id v111 = [v51 heightAnchor];
  id v112 = [v111 constraintEqualToConstant:50.0];

  *(void *)(v74 + 136) = v112;
  id v113 = [v51 bottomAnchor];
  id v114 = [v75 bottomAnchor];
  id v115 = [v113 constraintEqualToAnchor:v114];

  *(void *)(v74 + 144) = v115;
  id v116 = v141;
  id v117 = [v141 leadingAnchor];
  id v118 = [v96 leadingAnchor];
  id v119 = [v117 constraintEqualToAnchor:v118];

  *(void *)(v74 + 152) = v119;
  id v120 = [v116 centerYAnchor];
  id v121 = [v51 centerYAnchor];
  id v122 = [v120 constraintEqualToAnchor:v121];

  *(void *)(v74 + 160) = v122;
  id v123 = v146;
  id v124 = [v146 heightAnchor];
  if (qword_100156610 != -1) {
    swift_once();
  }
  id v125 = objc_retainAutoreleasedReturnValue(objc_msgSend(v124, "constraintEqualToConstant:", *((double *)&xmmword_10015DDF0
                                                                                             + 1)));

  *(void *)(v74 + 168) = v125;
  id v126 = [v123 widthAnchor];
  id v127 = [v126 constraintEqualToConstant:*(double *)&xmmword_10015DDF0];

  *(void *)(v74 + 176) = v127;
  id v128 = v149;
  id v129 = [v149 centerXAnchor];
  id v130 = [v75 centerXAnchor];
  id v131 = [v129 constraintEqualToAnchor:v130];

  *(void *)(v74 + 184) = v131;
  id v132 = [v128 heightAnchor];
  id v133 = [v75 heightAnchor];
  id v134 = [v132 constraintEqualToAnchor:v133];

  *(void *)(v74 + 192) = v134;
  id v135 = [v128 widthAnchor];
  id v136 = [v75 widthAnchor];
  id v137 = [v135 constraintEqualToAnchor:v136];

  *(void *)(v74 + 200) = v137;
  *(void *)(v74 + 208) = sub_100108C68(&OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView____lazy_storage___placeholderViewCenterYConstraint, &OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_placeholderArtworkView);
  uint64_t v156 = v74;
  specialized Array._endMutation()();
  sub_1000150F8(0, (unint64_t *)&qword_100157AD0);
  Class v138 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v145 activateConstraints:v138];

  return (*(uint64_t (**)(char *, uint64_t))(v153 + 8))(v152, v154);
}

void sub_10010A8F0(void *a1)
{
  uint64_t v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = type metadata accessor for ArtworkUnavailableView();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v28 - v10;
  uint64_t v12 = qword_100156618;
  uint64_t v13 = v2;
  if (v12 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  ArtworkUnavailableView.init(placeholderImage:widthRatio:heightRatio:)();
  id v14 = objc_allocWithZone((Class)sub_1000060EC(&qword_10015DE98));
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
  id v15 = (void *)UIHostingController.init(rootView:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  id v16 = [v15 view];

  if (v16)
  {
    *(void *)&v13[OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_placeholderArtworkView] = v16;
    uint64_t v17 = OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_albumArtContainerView;
    *(void *)&v13[v17] = [objc_allocWithZone((Class)UIView) initWithFrame:0.0, 0.0, 0.0, 0.0];
    uint64_t v18 = OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_albumArtImageView;
    *(void *)&v13[v18] = [objc_allocWithZone((Class)UIImageView) initWithFrame:0.0, 0.0, 0.0, 0.0];
    uint64_t v19 = OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_titleLabel;
    *(void *)&v13[v19] = [objc_allocWithZone((Class)UILabel) initWithFrame:0.0, 0.0, 0.0, 0.0];
    uint64_t v20 = OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_artistLabel;
    *(void *)&v13[v20] = [objc_allocWithZone((Class)UILabel) initWithFrame:0.0, 0.0, 0.0, 0.0];
    uint64_t v21 = OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_shazamLogoImageView;
    *(void *)&v13[v21] = [objc_allocWithZone((Class)UIImageView) initWithFrame:0.0, 0.0, 0.0, 0.0];
    uint64_t v22 = OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_shazamCountLabel;
    *(void *)&v13[v22] = [objc_allocWithZone((Class)UILabel) initWithFrame:0.0, 0.0, 0.0, 0.0];
    uint64_t v23 = OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_trackDetailsStackView;
    *(void *)&v13[v23] = [objc_allocWithZone((Class)UIStackView) initWithFrame:0.0, 0.0, 0.0, 0.0];
    uint64_t v24 = OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_shazamCountStackView;
    *(void *)&v13[v24] = [objc_allocWithZone((Class)UIStackView) initWithFrame:0.0, 0.0, 0.0, 0.0];
    uint64_t v25 = OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_appleMusicButton;
    *(void *)&v13[v25] = [objc_allocWithZone((Class)UIButton) initWithFrame:0.0, 0.0, 0.0, 0.0];
    *(void *)&v13[OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView____lazy_storage___albumArtImageViewCenterYConstraint] = 0;
    *(void *)&v13[OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView____lazy_storage___placeholderViewCenterYConstraint] = 0;

    v28.receiver = v13;
    v28.super_class = ObjectType;
    [super initWithCoder:a1];
    if (v26)
    {
      id v27 = v26;
      sub_1001092B8();
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t type metadata accessor for AmbientMatchView()
{
  return self;
}

uint64_t sub_10010AE0C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t static _AssistantIntentsProvider.uniqueEntities.getter()
{
  return static _AssistantIntentsProvider.uniqueEntities.getter();
}

uint64_t AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)()
{
  return AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)();
}

Swift::Void __swiftcall AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t AppShortcutPhrase.init(stringInterpolation:)()
{
  return AppShortcutPhrase.init(stringInterpolation:)();
}

uint64_t static AppShortcutsBuilder.buildBlock(_:)()
{
  return static AppShortcutsBuilder.buildBlock(_:)();
}

uint64_t static AppShortcutsBuilder.buildExpression(_:)()
{
  return static AppShortcutsBuilder.buildExpression(_:)();
}

uint64_t type metadata accessor for AppShortcutPhraseToken()
{
  return type metadata accessor for AppShortcutPhraseToken();
}

uint64_t static AppIntent.openAppWhenRun.getter()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t static AppIntent.description.getter()
{
  return static AppIntent.description.getter();
}

uint64_t AppIntent.systemContext.getter()
{
  return AppIntent.systemContext.getter();
}

uint64_t static AppIntent.isDiscoverable.getter()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t static AppIntent.parameterSummary.getter()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t static AppIntent.authenticationPolicy.getter()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t AppShortcut.init<A>(intent:phrases:shortTitle:systemImageName:)()
{
  return AppShortcut.init<A>(intent:phrases:shortTitle:systemImageName:)();
}

uint64_t type metadata accessor for AppShortcut()
{
  return type metadata accessor for AppShortcut();
}

uint64_t type metadata accessor for IntentDialog()
{
  return type metadata accessor for IntentDialog();
}

uint64_t static IntentResult.result<A>(value:)()
{
  return static IntentResult.result<A>(value:)();
}

uint64_t EntityProperty.wrappedValue.getter()
{
  return EntityProperty.wrappedValue.getter();
}

uint64_t EntityProperty.wrappedValue.setter()
{
  return EntityProperty.wrappedValue.setter();
}

uint64_t EntityProperty<>.init(title:)()
{
  return EntityProperty<>.init(title:)();
}

{
  return EntityProperty<>.init(title:)();
}

{
  return EntityProperty<>.init(title:)();
}

uint64_t IntentParameter.wrappedValue.getter()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)()
{
  return IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t IntentPrediction.init<>(displayRepresentation:)()
{
  return IntentPrediction.init<>(displayRepresentation:)();
}

uint64_t type metadata accessor for _AssistantIntent.PhraseToken()
{
  return type metadata accessor for _AssistantIntent.PhraseToken();
}

uint64_t static _AssistantIntent.PhraseBuilder.buildBlock(_:)()
{
  return static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
}

uint64_t static _AssistantIntent.PhraseBuilder.buildExpression(_:)()
{
  return static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
}

uint64_t static _AssistantIntent.ParameterValueBuilder.buildBlock()()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock()();
}

uint64_t _AssistantIntent.Phrase.init(stringLiteral:)()
{
  return _AssistantIntent.Phrase.init(stringLiteral:)();
}

uint64_t _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)()
{
  return _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)();
}

Swift::Void __swiftcall _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t _AssistantIntent.Phrase.init(stringInterpolation:)()
{
  return _AssistantIntent.Phrase.init(stringInterpolation:)();
}

uint64_t static _AssistantIntent.Builder.buildBlock(_:)()
{
  return static _AssistantIntent.Builder.buildBlock(_:)();
}

uint64_t static _AssistantIntent.Builder.buildExpression(_:)()
{
  return static _AssistantIntent.Builder.buildExpression(_:)();
}

uint64_t type metadata accessor for _AssistantIntent()
{
  return type metadata accessor for _AssistantIntent();
}

uint64_t _AssistantIntent.init<A>(_:phrases:parameterValues:)()
{
  return _AssistantIntent.init<A>(_:phrases:parameterValues:)();
}

uint64_t type metadata accessor for ShortcutTileColor()
{
  return type metadata accessor for ShortcutTileColor();
}

uint64_t type metadata accessor for IntentSystemContext.Source()
{
  return type metadata accessor for IntentSystemContext.Source();
}

uint64_t IntentSystemContext.source.getter()
{
  return IntentSystemContext.source.getter();
}

uint64_t type metadata accessor for IntentSystemContext()
{
  return type metadata accessor for IntentSystemContext();
}

uint64_t type metadata accessor for DisplayRepresentation.Image()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t DisplayRepresentation.init(title:subtitle:image:)()
{
  return DisplayRepresentation.init(title:subtitle:image:)();
}

uint64_t static IntentDonationManager.shared.getter()
{
  return static IntentDonationManager.shared.getter();
}

uint64_t type metadata accessor for IntentDonationManager()
{
  return type metadata accessor for IntentDonationManager();
}

uint64_t type metadata accessor for InputConnectionBehavior()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t type metadata accessor for IntentDonationIdentifier()
{
  return type metadata accessor for IntentDonationIdentifier();
}

uint64_t static IntentPredictionsBuilder.buildBlock<A>(_:)()
{
  return static IntentPredictionsBuilder.buildBlock<A>(_:)();
}

uint64_t static IntentPredictionsBuilder.buildExpression<A>(_:)()
{
  return static IntentPredictionsBuilder.buildExpression<A>(_:)();
}

uint64_t static PersistentlyIdentifiable.persistentIdentifier.getter()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t TypeDisplayRepresentation.init(stringLiteral:)()
{
  return TypeDisplayRepresentation.init(stringLiteral:)();
}

uint64_t type metadata accessor for TypeDisplayRepresentation()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

NSURLRequest __swiftcall URLRequest._bridgeToObjectiveC()()
{
  uint64_t v0 = (objc_class *)URLRequest._bridgeToObjectiveC()();
  result._internal = v1;
  result.super.Class isa = v0;
  return result;
}

uint64_t URLRequest.init(url:cachePolicy:timeoutInterval:)()
{
  return URLRequest.init(url:cachePolicy:timeoutInterval:)();
}

uint64_t URLRequest.url.getter()
{
  return URLRequest.url.getter();
}

uint64_t type metadata accessor for URLRequest()
{
  return type metadata accessor for URLRequest();
}

uint64_t static FormatStyle<>.dateTime.getter()
{
  return static FormatStyle<>.dateTime.getter();
}

uint64_t static CharacterSet.urlQueryAllowed.getter()
{
  return static CharacterSet.urlQueryAllowed.getter();
}

uint64_t type metadata accessor for CharacterSet()
{
  return type metadata accessor for CharacterSet();
}

uint64_t URLQueryItem.init(name:value:)()
{
  return URLQueryItem.init(name:value:)();
}

uint64_t type metadata accessor for URLQueryItem()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t CustomNSError.errorUserInfo.getter()
{
  return CustomNSError.errorUserInfo.getter();
}

uint64_t URLComponents.queryItems.setter()
{
  return URLComponents.queryItems.setter();
}

uint64_t URLComponents.percentEncodedQuery.getter()
{
  return URLComponents.percentEncodedQuery.getter();
}

uint64_t URLComponents.init(url:resolvingAgainstBaseURL:)()
{
  return URLComponents.init(url:resolvingAgainstBaseURL:)();
}

uint64_t URLComponents.url.getter()
{
  return URLComponents.url.getter();
}

uint64_t URLComponents.init()()
{
  return URLComponents.init()();
}

uint64_t type metadata accessor for URLComponents()
{
  return type metadata accessor for URLComponents();
}

uint64_t LocalizedError.helpAnchor.getter()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t LocalizedError.recoverySuggestion.getter()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t SortDescriptor.init(_:comparator:order:)()
{
  return SortDescriptor.init(_:comparator:order:)();
}

uint64_t AttributedString.setAttributes(_:)()
{
  return AttributedString.setAttributes(_:)();
}

uint64_t type metadata accessor for AttributedString.FormattingOptions()
{
  return type metadata accessor for AttributedString.FormattingOptions();
}

uint64_t AttributedString.init(localized:options:table:bundle:locale:comment:)()
{
  return AttributedString.init(localized:options:table:bundle:locale:comment:)();
}

uint64_t type metadata accessor for AttributedString()
{
  return type metadata accessor for AttributedString();
}

Swift::String __swiftcall NSLocalizedString(_:tableName:bundle:value:comment:)(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  uint64_t v5 = NSLocalizedString(_:tableName:bundle:value:comment:)(_._countAndFlagsBits, _._object, tableName.value._countAndFlagsBits, tableName.value._object, bundle.super.isa, value._countAndFlagsBits, value._object, comment._countAndFlagsBits);
  result._object = v6;
  result._uint64_t countAndFlagsBits = v5;
  return result;
}

uint64_t type metadata accessor for AttributeContainer()
{
  return type metadata accessor for AttributeContainer();
}

uint64_t AttributeContainer.init(_:)()
{
  return AttributeContainer.init(_:)();
}

uint64_t IntegerFormatStyle.init(locale:)()
{
  return IntegerFormatStyle.init(locale:)();
}

uint64_t IntegerFormatStyle.locale(_:)()
{
  return IntegerFormatStyle.locale(_:)();
}

uint64_t _BridgedStoredNSError.init(_:userInfo:)()
{
  return _BridgedStoredNSError.init(_:userInfo:)();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t LocalizedStringResource.init(stringLiteral:)()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t type metadata accessor for LocalizedStringResource()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t static FormatStyleCapitalizationContext.unknown.getter()
{
  return static FormatStyleCapitalizationContext.unknown.getter();
}

uint64_t type metadata accessor for FormatStyleCapitalizationContext()
{
  return type metadata accessor for FormatStyleCapitalizationContext();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t static URL.== infix(_:_:)()
{
  return static URL.== infix(_:_:)();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
}

uint64_t URL.appending(queryItems:)()
{
  return URL.appending(queryItems:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
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

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static Date.FormatStyle.TimeStyle.shortened.getter()
{
  return static Date.FormatStyle.TimeStyle.shortened.getter();
}

uint64_t type metadata accessor for Date.FormatStyle.TimeStyle()
{
  return type metadata accessor for Date.FormatStyle.TimeStyle();
}

uint64_t static Date.FormatStyle.DateStyle.long.getter()
{
  return static Date.FormatStyle.DateStyle.long.getter();
}

uint64_t type metadata accessor for Date.FormatStyle.DateStyle()
{
  return type metadata accessor for Date.FormatStyle.DateStyle();
}

uint64_t Date.FormatStyle.day(_:)()
{
  return Date.FormatStyle.day(_:)();
}

uint64_t Date.FormatStyle.init(date:time:locale:calendar:timeZone:capitalizationContext:)()
{
  return Date.FormatStyle.init(date:time:locale:calendar:timeZone:capitalizationContext:)();
}

uint64_t Date.FormatStyle.hour(_:)()
{
  return Date.FormatStyle.hour(_:)();
}

uint64_t Date.FormatStyle.year(_:)()
{
  return Date.FormatStyle.year(_:)();
}

uint64_t Date.FormatStyle.month(_:)()
{
  return Date.FormatStyle.month(_:)();
}

uint64_t static Date.FormatStyle.Symbol.Day.twoDigits.getter()
{
  return static Date.FormatStyle.Symbol.Day.twoDigits.getter();
}

uint64_t type metadata accessor for Date.FormatStyle.Symbol.Day()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Day();
}

uint64_t static Date.FormatStyle.Symbol.Hour.defaultDigits(amPM:)()
{
  return static Date.FormatStyle.Symbol.Hour.defaultDigits(amPM:)();
}

uint64_t static Date.FormatStyle.Symbol.Hour.AMPMStyle.abbreviated.getter()
{
  return static Date.FormatStyle.Symbol.Hour.AMPMStyle.abbreviated.getter();
}

uint64_t type metadata accessor for Date.FormatStyle.Symbol.Hour.AMPMStyle()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Hour.AMPMStyle();
}

uint64_t type metadata accessor for Date.FormatStyle.Symbol.Hour()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Hour();
}

uint64_t static Date.FormatStyle.Symbol.Year.defaultDigits.getter()
{
  return static Date.FormatStyle.Symbol.Year.defaultDigits.getter();
}

uint64_t type metadata accessor for Date.FormatStyle.Symbol.Year()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Year();
}

uint64_t static Date.FormatStyle.Symbol.Month.abbreviated.getter()
{
  return static Date.FormatStyle.Symbol.Month.abbreviated.getter();
}

uint64_t type metadata accessor for Date.FormatStyle.Symbol.Month()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Month();
}

uint64_t static Date.FormatStyle.Symbol.Minute.twoDigits.getter()
{
  return static Date.FormatStyle.Symbol.Minute.twoDigits.getter();
}

uint64_t type metadata accessor for Date.FormatStyle.Symbol.Minute()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Minute();
}

uint64_t static Date.FormatStyle.Symbol.Weekday.abbreviated.getter()
{
  return static Date.FormatStyle.Symbol.Weekday.abbreviated.getter();
}

uint64_t type metadata accessor for Date.FormatStyle.Symbol.Weekday()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Weekday();
}

uint64_t Date.FormatStyle.format(_:)()
{
  return Date.FormatStyle.format(_:)();
}

uint64_t Date.FormatStyle.locale(_:)()
{
  return Date.FormatStyle.locale(_:)();
}

uint64_t Date.FormatStyle.minute(_:)()
{
  return Date.FormatStyle.minute(_:)();
}

uint64_t Date.FormatStyle.weekday(_:)()
{
  return Date.FormatStyle.weekday(_:)();
}

uint64_t type metadata accessor for Date.FormatStyle()
{
  return type metadata accessor for Date.FormatStyle();
}

uint64_t Date.timeIntervalSince(_:)()
{
  return Date.timeIntervalSince(_:)();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static Date.now.getter()
{
  return static Date.now.getter();
}

uint64_t Date.compare(_:)()
{
  return Date.compare(_:)();
}

uint64_t Date.formatted(date:time:)()
{
  return Date.formatted(date:time:)();
}

uint64_t Date.formatted<A>(_:)()
{
  return Date.formatted<A>(_:)();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

uint64_t static UUID.== infix(_:_:)()
{
  return static UUID.== infix(_:_:)();
}

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

NSLocale __swiftcall Locale._bridgeToObjectiveC()()
{
  return (NSLocale)Locale._bridgeToObjectiveC()();
}

uint64_t static Locale.autoupdatingCurrent.getter()
{
  return static Locale.autoupdatingCurrent.getter();
}

uint64_t static Locale.current.getter()
{
  return static Locale.current.getter();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

uint64_t static Calendar.autoupdatingCurrent.getter()
{
  return static Calendar.autoupdatingCurrent.getter();
}

uint64_t type metadata accessor for Calendar()
{
  return type metadata accessor for Calendar();
}

uint64_t static TimeZone.autoupdatingCurrent.getter()
{
  return static TimeZone.autoupdatingCurrent.getter();
}

uint64_t type metadata accessor for TimeZone()
{
  return type metadata accessor for TimeZone();
}

uint64_t static Activity.activities.getter()
{
  return static Activity.activities.getter();
}

uint64_t Activity.id.getter()
{
  return Activity.id.getter();
}

uint64_t dispatch thunk of Activity.content.getter()
{
  return dispatch thunk of Activity.content.getter();
}

uint64_t static Activity.request(attributes:content:presentationOptions:platterTarget:contentSourceRequests:isEphemeral:isUnbounded:)()
{
  return static Activity.request(attributes:content:presentationOptions:platterTarget:contentSourceRequests:isEphemeral:isUnbounded:)();
}

uint64_t static ActivityUIDismissalPolicy.immediate.getter()
{
  return static ActivityUIDismissalPolicy.immediate.getter();
}

uint64_t type metadata accessor for ActivityUIDismissalPolicy()
{
  return type metadata accessor for ActivityUIDismissalPolicy();
}

uint64_t type metadata accessor for ActivityPresentationOptions.ActivityPresentationDestination()
{
  return type metadata accessor for ActivityPresentationOptions.ActivityPresentationDestination();
}

uint64_t ActivityPresentationOptions.init(destinations:)()
{
  return ActivityPresentationOptions.init(destinations:)();
}

uint64_t ActivityPresentationOptions.isActionButtonInitiated.setter()
{
  return ActivityPresentationOptions.isActionButtonInitiated.setter();
}

uint64_t ActivityPresentationOptions.shouldSuppressAlertContentOnLockScreen.setter()
{
  return ActivityPresentationOptions.shouldSuppressAlertContentOnLockScreen.setter();
}

uint64_t type metadata accessor for ActivityPresentationOptions()
{
  return type metadata accessor for ActivityPresentationOptions();
}

uint64_t ActivityContent.init(state:staleDate:relevanceScore:)()
{
  return ActivityContent.init(state:staleDate:relevanceScore:)();
}

uint64_t static AlertConfiguration.AlertSound.default.getter()
{
  return static AlertConfiguration.AlertSound.default.getter();
}

uint64_t type metadata accessor for AlertConfiguration.AlertSound()
{
  return type metadata accessor for AlertConfiguration.AlertSound();
}

uint64_t AlertConfiguration.init(title:body:sound:)()
{
  return AlertConfiguration.init(title:body:sound:)();
}

uint64_t type metadata accessor for AlertConfiguration()
{
  return type metadata accessor for AlertConfiguration();
}

uint64_t ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)()
{
  return ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
}

uint64_t ObservationRegistrar.access<A, B>(_:keyPath:)()
{
  return ObservationRegistrar.access<A, B>(_:keyPath:)();
}

uint64_t ObservationRegistrar.didSet<A, B>(_:keyPath:)()
{
  return ObservationRegistrar.didSet<A, B>(_:keyPath:)();
}

uint64_t ObservationRegistrar.willSet<A, B>(_:keyPath:)()
{
  return ObservationRegistrar.willSet<A, B>(_:keyPath:)();
}

uint64_t ObservationRegistrar.init()()
{
  return ObservationRegistrar.init()();
}

uint64_t type metadata accessor for ObservationRegistrar()
{
  return type metadata accessor for ObservationRegistrar();
}

uint64_t LocationView.init(viewModel:strokeColor:)()
{
  return LocationView.init(viewModel:strokeColor:)();
}

uint64_t type metadata accessor for LocationView()
{
  return type metadata accessor for LocationView();
}

uint64_t LocationViewModel.address.getter()
{
  return LocationViewModel.address.getter();
}

uint64_t LocationViewModel.__allocating_init(location:artworkView:)()
{
  return LocationViewModel.__allocating_init(location:artworkView:)();
}

uint64_t LocationViewModel.location.getter()
{
  return LocationViewModel.location.getter();
}

uint64_t type metadata accessor for LocationViewModel()
{
  return type metadata accessor for LocationViewModel();
}

uint64_t ExpandableTextView.init(text:font:numberOfLines:expandTextToken:_:)()
{
  return ExpandableTextView.init(text:font:numberOfLines:expandTextToken:_:)();
}

uint64_t type metadata accessor for ExpandableTextView()
{
  return type metadata accessor for ExpandableTextView();
}

uint64_t ArtworkUnavailableView.init(placeholderImage:widthRatio:heightRatio:)()
{
  return ArtworkUnavailableView.init(placeholderImage:widthRatio:heightRatio:)();
}

uint64_t type metadata accessor for ArtworkUnavailableView()
{
  return type metadata accessor for ArtworkUnavailableView();
}

uint64_t dispatch thunk of LibraryPlaylistInternalSortProperties.lastModifiedDate.getter()
{
  return dispatch thunk of LibraryPlaylistInternalSortProperties.lastModifiedDate.getter();
}

uint64_t dispatch thunk of LibraryPlaylistInternalFilter.isEditable.getter()
{
  return dispatch thunk of LibraryPlaylistInternalFilter.isEditable.getter();
}

uint64_t VideoArtwork.url.getter()
{
  return VideoArtwork.url.getter();
}

uint64_t type metadata accessor for VideoArtwork()
{
  return type metadata accessor for VideoArtwork();
}

uint64_t static EditorialVideoArtworkFlavor.motionDetailSquare.getter()
{
  return static EditorialVideoArtworkFlavor.motionDetailSquare.getter();
}

uint64_t type metadata accessor for EditorialVideoArtworkFlavor()
{
  return type metadata accessor for EditorialVideoArtworkFlavor();
}

uint64_t EditorialVideoArtworkVending.editorialVideoArtworks.getter()
{
  return EditorialVideoArtworkVending.editorialVideoArtworks.getter();
}

uint64_t ProminentPresentationAssertion.init(explanation:activityIdentifier:duration:invalidationHandler:)()
{
  return ProminentPresentationAssertion.init(explanation:activityIdentifier:duration:invalidationHandler:)();
}

uint64_t type metadata accessor for ProminentPresentationAssertion()
{
  return type metadata accessor for ProminentPresentationAssertion();
}

uint64_t static MusicSubscriptionOffer.MessageIdentifier.playMusic.getter()
{
  return static MusicSubscriptionOffer.MessageIdentifier.playMusic.getter();
}

uint64_t static MusicSubscriptionOffer.MessageIdentifier.join.getter()
{
  return static MusicSubscriptionOffer.MessageIdentifier.join.getter();
}

uint64_t type metadata accessor for MusicSubscriptionOffer.MessageIdentifier()
{
  return type metadata accessor for MusicSubscriptionOffer.MessageIdentifier();
}

uint64_t static MusicSubscriptionOffer.Action.subscribe.getter()
{
  return static MusicSubscriptionOffer.Action.subscribe.getter();
}

uint64_t type metadata accessor for MusicSubscriptionOffer.Action()
{
  return type metadata accessor for MusicSubscriptionOffer.Action();
}

uint64_t MusicSubscriptionOffer.Options.figaroCampaignGroup.setter()
{
  return MusicSubscriptionOffer.Options.figaroCampaignGroup.setter();
}

uint64_t MusicSubscriptionOffer.Options.figaroCampaignToken.setter()
{
  return MusicSubscriptionOffer.Options.figaroCampaignToken.setter();
}

uint64_t MusicSubscriptionOffer.Options.messageIdentifier.setter()
{
  return MusicSubscriptionOffer.Options.messageIdentifier.setter();
}

uint64_t MusicSubscriptionOffer.Options.init(action:messageIdentifier:itemID:affiliateToken:campaignToken:)()
{
  return MusicSubscriptionOffer.Options.init(action:messageIdentifier:itemID:affiliateToken:campaignToken:)();
}

uint64_t MusicSubscriptionOffer.Options.itemID.setter()
{
  return MusicSubscriptionOffer.Options.itemID.setter();
}

uint64_t type metadata accessor for MusicSubscriptionOffer.Options()
{
  return type metadata accessor for MusicSubscriptionOffer.Options();
}

uint64_t ArtworkImage.artworkPlaceholder<A>(_:)()
{
  return ArtworkImage.artworkPlaceholder<A>(_:)();
}

uint64_t ArtworkImage.init(_:)()
{
  return ArtworkImage.init(_:)();
}

uint64_t type metadata accessor for ArtworkImage()
{
  return type metadata accessor for ArtworkImage();
}

uint64_t ActivitySceneMetrics.init(size:cornerRadius:)()
{
  return ActivitySceneMetrics.init(size:cornerRadius:)();
}

uint64_t type metadata accessor for ActivitySceneMetrics()
{
  return type metadata accessor for ActivitySceneMetrics();
}

uint64_t dispatch thunk of ActivityScene.resolvedMetrics.setter()
{
  return dispatch thunk of ActivityScene.resolvedMetrics.setter();
}

uint64_t dispatch thunk of ActivityScene.backgroundTintColor.setter()
{
  return dispatch thunk of ActivityScene.backgroundTintColor.setter();
}

uint64_t type metadata accessor for ActivityScene()
{
  return type metadata accessor for ActivityScene();
}

uint64_t _HashTable.UnsafeHandle._startIterator(bucket:)()
{
  return _HashTable.UnsafeHandle._startIterator(bucket:)();
}

uint64_t _HashTable.UnsafeHandle.subscript.setter()
{
  return _HashTable.UnsafeHandle.subscript.setter();
}

uint64_t _HashTable.BucketIterator.currentValue.getter()
{
  return _HashTable.BucketIterator.currentValue.getter();
}

uint64_t _HashTable.BucketIterator.currentValue.setter()
{
  return _HashTable.BucketIterator.currentValue.setter();
}

Swift::Void __swiftcall _HashTable.BucketIterator.advance()()
{
}

uint64_t static _HashTable.maximumCapacity(forScale:)()
{
  return static _HashTable.maximumCapacity(forScale:)();
}

uint64_t _HashTable.copy()()
{
  return _HashTable.copy()();
}

uint64_t static _HashTable.scale(forCapacity:)()
{
  return static _HashTable.scale(forCapacity:)();
}

uint64_t _HashTable.init(scale:reservedScale:)()
{
  return _HashTable.init(scale:reservedScale:)();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t type metadata accessor for UITraitBacklightLuminance()
{
  return type metadata accessor for UITraitBacklightLuminance();
}

uint64_t AnyCancellable.store(in:)()
{
  return AnyCancellable.store(in:)();
}

Swift::Void __swiftcall AnyCancellable.cancel()()
{
}

uint64_t type metadata accessor for AnyCancellable()
{
  return type metadata accessor for AnyCancellable();
}

uint64_t ObservableObject<>.objectWillChange.getter()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t CurrentValueSubject.send(_:)()
{
  return CurrentValueSubject.send(_:)();
}

uint64_t CurrentValueSubject.value.getter()
{
  return CurrentValueSubject.value.getter();
}

uint64_t CurrentValueSubject.init(_:)()
{
  return CurrentValueSubject.init(_:)();
}

Swift::Void __swiftcall ObservableObjectPublisher.send()()
{
}

uint64_t type metadata accessor for ObservableObjectPublisher()
{
  return type metadata accessor for ObservableObjectPublisher();
}

uint64_t Published.init(initialValue:)()
{
  return Published.init(initialValue:)();
}

uint64_t Published.projectedValue.getter()
{
  return Published.projectedValue.getter();
}

uint64_t static Published.subscript.getter()
{
  return static Published.subscript.getter();
}

uint64_t static Published.subscript.setter()
{
  return static Published.subscript.setter();
}

uint64_t type metadata accessor for Published()
{
  return type metadata accessor for Published();
}

uint64_t Publisher.receive<A>(on:options:)()
{
  return Publisher.receive<A>(on:options:)();
}

uint64_t Publisher.debounce<A>(for:scheduler:options:)()
{
  return Publisher.debounce<A>(for:scheduler:options:)();
}

uint64_t Publisher<>.sink(receiveValue:)()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t AsyncImage.init(url:scale:transaction:content:)()
{
  return AsyncImage.init(url:scale:transaction:content:)();
}

uint64_t static ButtonRole.destructive.getter()
{
  return static ButtonRole.destructive.getter();
}

uint64_t static ButtonRole.cancel.getter()
{
  return static ButtonRole.cancel.getter();
}

uint64_t type metadata accessor for ButtonRole()
{
  return type metadata accessor for ButtonRole();
}

uint64_t EdgeInsets.init(_all:)()
{
  return EdgeInsets.init(_all:)();
}

uint64_t type metadata accessor for Prominence()
{
  return type metadata accessor for Prominence();
}

uint64_t static ScenePhase.== infix(_:_:)()
{
  return static ScenePhase.== infix(_:_:)();
}

uint64_t type metadata accessor for ScenePhase()
{
  return type metadata accessor for ScenePhase();
}

uint64_t type metadata accessor for ScrollView()
{
  return type metadata accessor for ScrollView();
}

uint64_t ScrollView.init(_:showsIndicators:content:)()
{
  return ScrollView.init(_:showsIndicators:content:)();
}

uint64_t static ColorScheme.== infix(_:_:)()
{
  return static ColorScheme.== infix(_:_:)();
}

uint64_t type metadata accessor for ColorScheme()
{
  return type metadata accessor for ColorScheme();
}

uint64_t type metadata accessor for Environment.Content()
{
  return type metadata accessor for Environment.Content();
}

uint64_t StateObject.wrappedValue.getter()
{
  return StateObject.wrappedValue.getter();
}

uint64_t StateObject.projectedValue.getter()
{
  return StateObject.projectedValue.getter();
}

uint64_t StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)()
{
  return StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
}

uint64_t ToolbarItem<>.init(placement:content:)()
{
  return ToolbarItem<>.init(placement:content:)();
}

uint64_t static ToolbarRole.automatic.getter()
{
  return static ToolbarRole.automatic.getter();
}

uint64_t type metadata accessor for ToolbarRole()
{
  return type metadata accessor for ToolbarRole();
}

uint64_t Transaction.animation.getter()
{
  return Transaction.animation.getter();
}

uint64_t Transaction.init(animation:)()
{
  return Transaction.init(animation:)();
}

uint64_t WindowGroup.init(id:title:lazyContent:)()
{
  return WindowGroup.init(id:title:lazyContent:)();
}

uint64_t ProgressView<>.init<>()()
{
  return ProgressView<>.init<>()();
}

uint64_t ProgressView<>.init<>(_:)()
{
  return ProgressView<>.init<>(_:)();
}

uint64_t ScaledMetric.init(wrappedValue:)()
{
  return ScaledMetric.init(wrappedValue:)();
}

uint64_t ScaledMetric.wrappedValue.getter()
{
  return ScaledMetric.wrappedValue.getter();
}

uint64_t type metadata accessor for ScaledMetric()
{
  return type metadata accessor for ScaledMetric();
}

uint64_t static SceneBuilder.buildBlock<A>(_:)()
{
  return static SceneBuilder.buildBlock<A>(_:)();
}

uint64_t static VerticalEdge.Set.all.getter()
{
  return static VerticalEdge.Set.all.getter();
}

uint64_t VerticalEdge.rawValue.getter()
{
  return VerticalEdge.rawValue.getter();
}

uint64_t static ViewModifier._makeView(modifier:inputs:body:)()
{
  return static ViewModifier._makeView(modifier:inputs:body:)();
}

uint64_t static ViewModifier._makeViewList(modifier:inputs:body:)()
{
  return static ViewModifier._makeViewList(modifier:inputs:body:)();
}

uint64_t static ViewModifier._viewListCount(inputs:body:)()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t VisualEffect.opacity(_:)()
{
  return VisualEffect.opacity(_:)();
}

uint64_t _FrameLayout.init(width:height:alignment:)()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t AnyShapeStyle.init<A>(_:)()
{
  return AnyShapeStyle.init<A>(_:)();
}

uint64_t static AnyTransition.opacity.getter()
{
  return static AnyTransition.opacity.getter();
}

uint64_t AnyTransition.animation(_:)()
{
  return AnyTransition.animation(_:)();
}

Swift::Void __swiftcall DismissAction.callAsFunction()()
{
}

uint64_t type metadata accessor for DismissAction()
{
  return type metadata accessor for DismissAction();
}

uint64_t GeometryProxy.safeAreaInsets.getter()
{
  return GeometryProxy.safeAreaInsets.getter();
}

uint64_t GeometryProxy.frame(in:)()
{
  return GeometryProxy.frame(in:)();
}

uint64_t GeometryProxy.bounds(of:)()
{
  return GeometryProxy.bounds(of:)();
}

uint64_t OpenURLAction.callAsFunction(_:)()
{
  return OpenURLAction.callAsFunction(_:)();
}

uint64_t type metadata accessor for OpenURLAction()
{
  return type metadata accessor for OpenURLAction();
}

uint64_t static PreferenceKey._isReadableByHost.getter()
{
  return static PreferenceKey._isReadableByHost.getter();
}

uint64_t static PreferenceKey._includesRemovedValues.getter()
{
  return static PreferenceKey._includesRemovedValues.getter();
}

uint64_t type metadata accessor for _TaskModifier()
{
  return type metadata accessor for _TaskModifier();
}

uint64_t withAnimation<A>(_:completionCriteria:_:completion:)()
{
  return withAnimation<A>(_:completionCriteria:_:completion:)();
}

uint64_t withAnimation<A>(_:_:)()
{
  return withAnimation<A>(_:_:)();
}

uint64_t static EnvironmentKey._valuesEqual(_:_:)()
{
  return static EnvironmentKey._valuesEqual(_:_:)();
}

uint64_t GeometryReader.init(content:)()
{
  return GeometryReader.init(content:)();
}

uint64_t type metadata accessor for GeometryReader()
{
  return type metadata accessor for GeometryReader();
}

uint64_t InsetListStyle.init()()
{
  return InsetListStyle.init()();
}

uint64_t type metadata accessor for InsetListStyle()
{
  return type metadata accessor for InsetListStyle();
}

uint64_t LinearGradient.init(gradient:startPoint:endPoint:)()
{
  return LinearGradient.init(gradient:startPoint:endPoint:)();
}

uint64_t NavigationPath.append<A>(_:)()
{
  return NavigationPath.append<A>(_:)();
}

uint64_t NavigationPath.init()()
{
  return NavigationPath.init()();
}

uint64_t type metadata accessor for NavigationPath()
{
  return type metadata accessor for NavigationPath();
}

uint64_t NavigationView.init(content:)()
{
  return NavigationView.init(content:)();
}

uint64_t ObservedObject.init(wrappedValue:)()
{
  return ObservedObject.init(wrappedValue:)();
}

uint64_t ObservedObject.Wrapper.subscript.getter()
{
  return ObservedObject.Wrapper.subscript.getter();
}

uint64_t ScrollGeometry.contentOffset.getter()
{
  return ScrollGeometry.contentOffset.getter();
}

uint64_t SymbolVariants.fill.getter()
{
  return SymbolVariants.fill.getter();
}

uint64_t static SymbolVariants.circle.getter()
{
  return static SymbolVariants.circle.getter();
}

uint64_t static SymbolVariants.square.getter()
{
  return static SymbolVariants.square.getter();
}

uint64_t type metadata accessor for SymbolVariants()
{
  return type metadata accessor for SymbolVariants();
}

uint64_t type metadata accessor for AsyncImagePhase()
{
  return type metadata accessor for AsyncImagePhase();
}

uint64_t ButtonMenuStyle.init()()
{
  return ButtonMenuStyle.init()();
}

uint64_t type metadata accessor for ButtonMenuStyle()
{
  return type metadata accessor for ButtonMenuStyle();
}

uint64_t type metadata accessor for CoordinateSpace()
{
  return type metadata accessor for CoordinateSpace();
}

uint64_t static DynamicProperty._propertyBehaviors.getter()
{
  return static DynamicProperty._propertyBehaviors.getter();
}

Swift::Void __swiftcall DynamicProperty.update()()
{
}

uint64_t type metadata accessor for DynamicTypeSize()
{
  return type metadata accessor for DynamicTypeSize();
}

uint64_t static LayoutDirection.== infix(_:_:)()
{
  return static LayoutDirection.== infix(_:_:)();
}

uint64_t type metadata accessor for LayoutDirection()
{
  return type metadata accessor for LayoutDirection();
}

uint64_t ModifiedContent<>.accessibilityHint(_:)()
{
  return ModifiedContent<>.accessibilityHint(_:)();
}

uint64_t ModifiedContent<>.accessibilityLabel(_:)()
{
  return ModifiedContent<>.accessibilityLabel(_:)();
}

{
  return ModifiedContent<>.accessibilityLabel(_:)();
}

uint64_t ModifiedContent<>.accessibilityLabel<A>(_:)()
{
  return ModifiedContent<>.accessibilityLabel<A>(_:)();
}

uint64_t ModifiedContent<>.accessibilityHidden(_:)()
{
  return ModifiedContent<>.accessibilityHidden(_:)();
}

uint64_t ModifiedContent<>.accessibilityHeading(_:)()
{
  return ModifiedContent<>.accessibilityHeading(_:)();
}

uint64_t ModifiedContent<>.accessibilityAddTraits(_:)()
{
  return ModifiedContent<>.accessibilityAddTraits(_:)();
}

uint64_t ModifiedContent<>.accessibilityIdentifier(_:)()
{
  return ModifiedContent<>.accessibilityIdentifier(_:)();
}

uint64_t ModifiedContent<>.accessibilityRemoveTraits(_:)()
{
  return ModifiedContent<>.accessibilityRemoveTraits(_:)();
}

uint64_t type metadata accessor for ModifiedContent()
{
  return type metadata accessor for ModifiedContent();
}

uint64_t NavigationStack.init<>(path:root:)()
{
  return NavigationStack.init<>(path:root:)();
}

uint64_t NavigationStack.init<>(root:)()
{
  return NavigationStack.init<>(root:)();
}

uint64_t type metadata accessor for NavigationStack()
{
  return type metadata accessor for NavigationStack();
}

uint64_t static SafeAreaRegions.all.getter()
{
  return static SafeAreaRegions.all.getter();
}

uint64_t static SafeAreaRegions.container.getter()
{
  return static SafeAreaRegions.container.getter();
}

uint64_t PlainButtonStyle.init()()
{
  return PlainButtonStyle.init()();
}

uint64_t type metadata accessor for PlainButtonStyle()
{
  return type metadata accessor for PlainButtonStyle();
}

uint64_t static RedactionReasons.placeholder.getter()
{
  return static RedactionReasons.placeholder.getter();
}

uint64_t type metadata accessor for RedactionReasons()
{
  return type metadata accessor for RedactionReasons();
}

uint64_t type metadata accessor for RoundedRectangle()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t ToolbarItemGroup.init(placement:content:)()
{
  return ToolbarItemGroup.init(placement:content:)();
}

uint64_t _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t type metadata accessor for EmptyVisualEffect()
{
  return type metadata accessor for EmptyVisualEffect();
}

uint64_t EnvironmentValues.imageScale.getter()
{
  return EnvironmentValues.imageScale.getter();
}

uint64_t EnvironmentValues.imageScale.setter()
{
  return EnvironmentValues.imageScale.setter();
}

uint64_t EnvironmentValues.scenePhase.getter()
{
  return EnvironmentValues.scenePhase.getter();
}

uint64_t EnvironmentValues.colorScheme.getter()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t EnvironmentValues.foregroundColor.getter()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t EnvironmentValues.foregroundColor.setter()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t EnvironmentValues.layoutDirection.getter()
{
  return EnvironmentValues.layoutDirection.getter();
}

uint64_t EnvironmentValues.listSectionSpacing.getter()
{
  return EnvironmentValues.listSectionSpacing.getter();
}

uint64_t EnvironmentValues.minimumScaleFactor.getter()
{
  return EnvironmentValues.minimumScaleFactor.getter();
}

uint64_t EnvironmentValues.minimumScaleFactor.setter()
{
  return EnvironmentValues.minimumScaleFactor.setter();
}

uint64_t EnvironmentValues.horizontalSizeClass.getter()
{
  return EnvironmentValues.horizontalSizeClass.getter();
}

uint64_t EnvironmentValues.horizontalSizeClass.setter()
{
  return EnvironmentValues.horizontalSizeClass.setter();
}

uint64_t EnvironmentValues.symbolRenderingMode.getter()
{
  return EnvironmentValues.symbolRenderingMode.getter();
}

uint64_t EnvironmentValues.multilineTextAlignment.getter()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t EnvironmentValues.multilineTextAlignment.setter()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t EnvironmentValues.accessibilityReduceMotion.getter()
{
  return EnvironmentValues.accessibilityReduceMotion.getter();
}

uint64_t EnvironmentValues.accessibilityReduceTransparency.getter()
{
  return EnvironmentValues.accessibilityReduceTransparency.getter();
}

uint64_t EnvironmentValues.font.getter()
{
  return EnvironmentValues.font.getter();
}

uint64_t EnvironmentValues.font.setter()
{
  return EnvironmentValues.font.setter();
}

uint64_t EnvironmentValues.tint.getter()
{
  return EnvironmentValues.tint.getter();
}

uint64_t EnvironmentValues.tint.setter()
{
  return EnvironmentValues.tint.setter();
}

uint64_t EnvironmentValues.dismiss.getter()
{
  return EnvironmentValues.dismiss.getter();
}

uint64_t EnvironmentValues.openURL.getter()
{
  return EnvironmentValues.openURL.getter();
}

uint64_t EnvironmentValues.isEnabled.getter()
{
  return EnvironmentValues.isEnabled.getter();
}

uint64_t EnvironmentValues.isEnabled.setter()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t EnvironmentValues.lineLimit.getter()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t EnvironmentValues.lineLimit.setter()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t EnvironmentValues.tintColor.getter()
{
  return EnvironmentValues.tintColor.getter();
}

uint64_t EnvironmentValues.tintColor.setter()
{
  return EnvironmentValues.tintColor.setter();
}

uint64_t EnvironmentValues.init()()
{
  return EnvironmentValues.init()();
}

uint64_t type metadata accessor for EnvironmentValues()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t EnvironmentValues.subscript.getter()
{
  return EnvironmentValues.subscript.getter();
}

uint64_t EnvironmentValues.subscript.setter()
{
  return EnvironmentValues.subscript.setter();
}

uint64_t type metadata accessor for NavigationBarItem.TitleDisplayMode()
{
  return type metadata accessor for NavigationBarItem.TitleDisplayMode();
}

uint64_t static VerticalAlignment.lastTextBaseline.getter()
{
  return static VerticalAlignment.lastTextBaseline.getter();
}

uint64_t static VerticalAlignment.top.getter()
{
  return static VerticalAlignment.top.getter();
}

uint64_t static VerticalAlignment.center.getter()
{
  return static VerticalAlignment.center.getter();
}

uint64_t DefaultButtonStyle.init()()
{
  return DefaultButtonStyle.init()();
}

uint64_t type metadata accessor for DefaultButtonStyle()
{
  return type metadata accessor for DefaultButtonStyle();
}

uint64_t static ListSectionSpacing.custom(_:)()
{
  return static ListSectionSpacing.custom(_:)();
}

uint64_t type metadata accessor for ListSectionSpacing()
{
  return type metadata accessor for ListSectionSpacing();
}

uint64_t LocalizedStringKey.init(stringLiteral:)()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t LocalizedStringKey.init(_:)()
{
  return LocalizedStringKey.init(_:)();
}

uint64_t type metadata accessor for RoundedCornerStyle()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t static AccessibilityTraits.startsMediaSession.getter()
{
  return static AccessibilityTraits.startsMediaSession.getter();
}

uint64_t static AccessibilityTraits.isImage.getter()
{
  return static AccessibilityTraits.isImage.getter();
}

uint64_t static AccessibilityTraits.isButton.getter()
{
  return static AccessibilityTraits.isButton.getter();
}

uint64_t static AccessibilityTraits.isHeader.getter()
{
  return static AccessibilityTraits.isHeader.getter();
}

uint64_t type metadata accessor for AccessibilityTraits()
{
  return type metadata accessor for AccessibilityTraits();
}

uint64_t static HorizontalAlignment.center.getter()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t static HorizontalAlignment.leading.getter()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t static SymbolRenderingMode.palette.getter()
{
  return static SymbolRenderingMode.palette.getter();
}

uint64_t type metadata accessor for SymbolRenderingMode()
{
  return type metadata accessor for SymbolRenderingMode();
}

uint64_t TupleToolbarContent.init(_:)()
{
  return TupleToolbarContent.init(_:)();
}

uint64_t UIHostingController.init(coder:rootView:)()
{
  return UIHostingController.init(coder:rootView:)();
}

uint64_t UIHostingController.init(rootView:)()
{
  return UIHostingController.init(rootView:)();
}

uint64_t UIViewRepresentable._resetUIView(_:coordinator:destroy:)()
{
  return UIViewRepresentable._resetUIView(_:coordinator:destroy:)();
}

uint64_t static UIViewRepresentable.dismantleUIView(_:coordinator:)()
{
  return static UIViewRepresentable.dismantleUIView(_:coordinator:)();
}

uint64_t UIViewRepresentable.sizeThatFits(_:uiView:context:)()
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)();
}

uint64_t static UIViewRepresentable._layoutOptions(_:)()
{
  return static UIViewRepresentable._layoutOptions(_:)();
}

uint64_t UIViewRepresentable._identifiedViewTree(in:)()
{
  return UIViewRepresentable._identifiedViewTree(in:)();
}

uint64_t UIViewRepresentable._overrideLayoutTraits(_:for:)()
{
  return UIViewRepresentable._overrideLayoutTraits(_:for:)();
}

uint64_t UIViewRepresentable._overrideSizeThatFits(_:in:uiView:)()
{
  return UIViewRepresentable._overrideSizeThatFits(_:in:uiView:)();
}

uint64_t static UIViewRepresentable._modifyBridgedViewInputs(_:)()
{
  return static UIViewRepresentable._modifyBridgedViewInputs(_:)();
}

uint64_t UIViewRepresentable.body.getter()
{
  return UIViewRepresentable.body.getter();
}

uint64_t UIViewRepresentable<>.makeCoordinator()()
{
  return UIViewRepresentable<>.makeCoordinator()();
}

uint64_t type metadata accessor for _BackgroundModifier()
{
  return type metadata accessor for _BackgroundModifier();
}

uint64_t type metadata accessor for _ConditionalContent.Storage()
{
  return type metadata accessor for _ConditionalContent.Storage();
}

uint64_t _ConditionalContent<>.init(storage:)()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t type metadata accessor for _ConditionalContent()
{
  return type metadata accessor for _ConditionalContent();
}

uint64_t type metadata accessor for NamedCoordinateSpace()
{
  return type metadata accessor for NamedCoordinateSpace();
}

uint64_t static ToolbarItemPlacement.topBarLeading.getter()
{
  return static ToolbarItemPlacement.topBarLeading.getter();
}

uint64_t static ToolbarItemPlacement.topBarTrailing.getter()
{
  return static ToolbarItemPlacement.topBarTrailing.getter();
}

uint64_t static ToolbarItemPlacement.principal.getter()
{
  return static ToolbarItemPlacement.principal.getter();
}

uint64_t type metadata accessor for ToolbarItemPlacement()
{
  return type metadata accessor for ToolbarItemPlacement();
}

uint64_t BorderlessButtonStyle.init()()
{
  return BorderlessButtonStyle.init()();
}

uint64_t type metadata accessor for BorderlessButtonStyle()
{
  return type metadata accessor for BorderlessButtonStyle();
}

uint64_t static ToolbarContentBuilder.buildBlock<A>(_:)()
{
  return static ToolbarContentBuilder.buildBlock<A>(_:)();
}

uint64_t static ToolbarContentBuilder.buildEither<A, B>(first:)()
{
  return static ToolbarContentBuilder.buildEither<A, B>(first:)();
}

uint64_t static ToolbarContentBuilder.buildEither<A, B>(second:)()
{
  return static ToolbarContentBuilder.buildEither<A, B>(second:)();
}

uint64_t static ToolbarContentBuilder.buildIf<A>(_:)()
{
  return static ToolbarContentBuilder.buildIf<A>(_:)();
}

uint64_t type metadata accessor for _ViewModifier_Content()
{
  return type metadata accessor for _ViewModifier_Content();
}

uint64_t static ContentMarginPlacement.automatic.getter()
{
  return static ContentMarginPlacement.automatic.getter();
}

uint64_t type metadata accessor for ContentMarginPlacement()
{
  return type metadata accessor for ContentMarginPlacement();
}

uint64_t ContentUnavailableView.init(label:description:actions:)()
{
  return ContentUnavailableView.init(label:description:actions:)();
}

uint64_t ContentUnavailableView<>.init(_:systemImage:description:)()
{
  return ContentUnavailableView<>.init(_:systemImage:description:)();
}

uint64_t static HierarchicalShapeStyle.primary.getter()
{
  return static HierarchicalShapeStyle.primary.getter();
}

uint64_t static HierarchicalShapeStyle.secondary.getter()
{
  return static HierarchicalShapeStyle.secondary.getter();
}

uint64_t static UserInterfaceSizeClass.== infix(_:_:)()
{
  return static UserInterfaceSizeClass.== infix(_:_:)();
}

uint64_t type metadata accessor for UserInterfaceSizeClass()
{
  return type metadata accessor for UserInterfaceSizeClass();
}

uint64_t static CoordinateSpaceProtocol<>.scrollView.getter()
{
  return static CoordinateSpaceProtocol<>.scrollView.getter();
}

uint64_t type metadata accessor for ButtonStyleConfiguration.Label()
{
  return type metadata accessor for ButtonStyleConfiguration.Label();
}

uint64_t ButtonStyleConfiguration.label.getter()
{
  return ButtonStyleConfiguration.label.getter();
}

uint64_t CircularProgressViewStyle.init()()
{
  return CircularProgressViewStyle.init()();
}

uint64_t type metadata accessor for CircularProgressViewStyle()
{
  return type metadata accessor for CircularProgressViewStyle();
}

uint64_t type metadata accessor for _PreferenceActionModifier()
{
  return type metadata accessor for _PreferenceActionModifier();
}

uint64_t static AccessibilityChildBehavior.combine.getter()
{
  return static AccessibilityChildBehavior.combine.getter();
}

uint64_t type metadata accessor for AccessibilityChildBehavior()
{
  return type metadata accessor for AccessibilityChildBehavior();
}

uint64_t UIViewRepresentableContext.coordinator.getter()
{
  return UIViewRepresentableContext.coordinator.getter();
}

uint64_t type metadata accessor for _PreferenceWritingModifier()
{
  return type metadata accessor for _PreferenceWritingModifier();
}

uint64_t static AnimationCompletionCriteria.logicallyComplete.getter()
{
  return static AnimationCompletionCriteria.logicallyComplete.getter();
}

uint64_t type metadata accessor for AnimationCompletionCriteria()
{
  return type metadata accessor for AnimationCompletionCriteria();
}

uint64_t BorderedProminentButtonStyle.init()()
{
  return BorderedProminentButtonStyle.init()();
}

uint64_t type metadata accessor for BorderedProminentButtonStyle()
{
  return type metadata accessor for BorderedProminentButtonStyle();
}

uint64_t UIViewControllerRepresentable._resetUIViewController(_:coordinator:destroy:)()
{
  return UIViewControllerRepresentable._resetUIViewController(_:coordinator:destroy:)();
}

uint64_t static UIViewControllerRepresentable.dismantleUIViewController(_:coordinator:)()
{
  return static UIViewControllerRepresentable.dismantleUIViewController(_:coordinator:)();
}

uint64_t UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)()
{
  return UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)();
}

uint64_t static UIViewControllerRepresentable._layoutOptions(_:)()
{
  return static UIViewControllerRepresentable._layoutOptions(_:)();
}

uint64_t UIViewControllerRepresentable._identifiedViewTree(in:)()
{
  return UIViewControllerRepresentable._identifiedViewTree(in:)();
}

uint64_t UIViewControllerRepresentable.body.getter()
{
  return UIViewControllerRepresentable.body.getter();
}

uint64_t UIViewControllerRepresentable<>.makeCoordinator()()
{
  return UIViewControllerRepresentable<>.makeCoordinator()();
}

uint64_t type metadata accessor for AccessibilityAttachmentModifier()
{
  return type metadata accessor for AccessibilityAttachmentModifier();
}

uint64_t static App.main()()
{
  return static App.main()();
}

uint64_t static Log.runtimeIssuesLog.getter()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t static Axis.Set.horizontal.getter()
{
  return static Axis.Set.horizontal.getter();
}

uint64_t static Axis.Set.vertical.getter()
{
  return static Axis.Set.vertical.getter();
}

uint64_t static Edge.Set.horizontal.getter()
{
  return static Edge.Set.horizontal.getter();
}

uint64_t static Edge.Set.all.getter()
{
  return static Edge.Set.all.getter();
}

uint64_t static Edge.Set.top.getter()
{
  return static Edge.Set.top.getter();
}

uint64_t static Edge.Set.bottom.getter()
{
  return static Edge.Set.bottom.getter();
}

uint64_t static Edge.Set.trailing.getter()
{
  return static Edge.Set.trailing.getter();
}

uint64_t static Edge.Set.vertical.getter()
{
  return static Edge.Set.vertical.getter();
}

uint64_t Edge.init(rawValue:)()
{
  return Edge.init(rawValue:)();
}

uint64_t static Font.largeTitle.getter()
{
  return static Font.largeTitle.getter();
}

uint64_t static Font.subheadline.getter()
{
  return static Font.subheadline.getter();
}

uint64_t static Font.body.getter()
{
  return static Font.body.getter();
}

uint64_t static Font.title.getter()
{
  return static Font.title.getter();
}

uint64_t type metadata accessor for Font.Design()
{
  return type metadata accessor for Font.Design();
}

uint64_t static Font.Weight.bold.getter()
{
  return static Font.Weight.bold.getter();
}

uint64_t static Font.Weight.heavy.getter()
{
  return static Font.Weight.heavy.getter();
}

uint64_t static Font.Weight.regular.getter()
{
  return static Font.Weight.regular.getter();
}

uint64_t static Font.Weight.semibold.getter()
{
  return static Font.Weight.semibold.getter();
}

uint64_t static Font.system(_:design:weight:)()
{
  return static Font.system(_:design:weight:)();
}

uint64_t static Font.title2.getter()
{
  return static Font.title2.getter();
}

uint64_t static Font.title3.getter()
{
  return static Font.title3.getter();
}

uint64_t Font.weight(_:)()
{
  return Font.weight(_:)();
}

uint64_t static Font.callout.getter()
{
  return static Font.callout.getter();
}

uint64_t static Font.caption.getter()
{
  return static Font.caption.getter();
}

uint64_t static Font.caption2.getter()
{
  return static Font.caption2.getter();
}

uint64_t static Font.footnote.getter()
{
  return static Font.footnote.getter();
}

uint64_t static Font.headline.getter()
{
  return static Font.headline.getter();
}

uint64_t type metadata accessor for Font.TextStyle()
{
  return type metadata accessor for Font.TextStyle();
}

uint64_t List<>.init(content:)()
{
  return List<>.init(content:)();
}

uint64_t type metadata accessor for List()
{
  return type metadata accessor for List();
}

uint64_t Menu.init(onPresentationChanged:content:label:)()
{
  return Menu.init(onPresentationChanged:content:label:)();
}

uint64_t Text.fontWeight(_:)()
{
  return Text.fontWeight(_:)();
}

uint64_t Text.foregroundColor(_:)()
{
  return Text.foregroundColor(_:)();
}

uint64_t Text.foregroundStyle<A>(_:)()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t Text.bold()()
{
  return Text.bold()();
}

uint64_t Text.font(_:)()
{
  return Text.font(_:)();
}

uint64_t static Text.Suffix.alwaysVisible(_:)()
{
  return static Text.Suffix.alwaysVisible(_:)();
}

uint64_t static Text.Suffix.none.getter()
{
  return static Text.Suffix.none.getter();
}

uint64_t type metadata accessor for Text.Suffix()
{
  return type metadata accessor for Text.Suffix();
}

uint64_t Text.init(_:tableName:bundle:comment:)()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t Text.init<A>(_:)()
{
  return Text.init<A>(_:)();
}

uint64_t View.musicSubscriptionOffer(isPresented:options:onLoadCompletion:)()
{
  return View.musicSubscriptionOffer(isPresented:options:onLoadCompletion:)();
}

uint64_t static View._makeView(view:inputs:)()
{
  return static View._makeView(view:inputs:)();
}

uint64_t static View._makeViewList(view:inputs:)()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t View.progressViewStyle<A>(_:)()
{
  return View.progressViewStyle<A>(_:)();
}

uint64_t View.background<A>(_:alignment:)()
{
  return View.background<A>(_:alignment:)();
}

uint64_t View.fontWeight(_:)()
{
  return View.fontWeight(_:)();
}

uint64_t View.preference<A>(key:value:)()
{
  return View.preference<A>(key:value:)();
}

uint64_t View.textSuffix(_:)()
{
  return View.textSuffix(_:)();
}

uint64_t View.buttonStyle<A>(_:)()
{
  return View.buttonStyle<A>(_:)();
}

{
  return View.buttonStyle<A>(_:)();
}

uint64_t View.contextMenu<A, B, C>(menuItems:preview:previewDestination:)()
{
  return View.contextMenu<A, B, C>(menuItems:preview:previewDestination:)();
}

uint64_t View.toolbarRole(_:)()
{
  return View.toolbarRole(_:)();
}

uint64_t View.onTapGesture(count:perform:)()
{
  return View.onTapGesture(count:perform:)();
}

uint64_t View.swipeActions<A>(edge:allowsFullSwipe:content:)()
{
  return View.swipeActions<A>(edge:allowsFullSwipe:content:)();
}

uint64_t View.visualEffect<A>(_:)()
{
  return View.visualEffect<A>(_:)();
}

uint64_t View.listRowInsets(_:)()
{
  return View.listRowInsets(_:)();
}

uint64_t View.sharingPicker(isPresented:item:subject:message:)()
{
  return View.sharingPicker(isPresented:item:subject:message:)();
}

uint64_t View.symbolVariant(_:)()
{
  return View.symbolVariant(_:)();
}

uint64_t static View._viewListCount(inputs:)()
{
  return static View._viewListCount(inputs:)();
}

uint64_t View.contentMargins(_:_:for:)()
{
  return View.contentMargins(_:_:for:)();
}

uint64_t View.coordinateSpace<A>(name:)()
{
  return View.coordinateSpace<A>(name:)();
}

uint64_t View.dynamicTypeSize<A>(_:)()
{
  return View.dynamicTypeSize<A>(_:)();
}

uint64_t View.foregroundStyle<A>(_:)()
{
  return View.foregroundStyle<A>(_:)();
}

uint64_t View.fullScreenCover<A>(isPresented:onDismiss:content:)()
{
  return View.fullScreenCover<A>(isPresented:onDismiss:content:)();
}

uint64_t View.navigationTitle(_:)()
{
  return View.navigationTitle(_:)();
}

uint64_t View.navigationTitle<A>(_:)()
{
  return View.navigationTitle<A>(_:)();
}

uint64_t View.headerProminence(_:)()
{
  return View.headerProminence(_:)();
}

uint64_t View.accessibilityLabel(_:)()
{
  return View.accessibilityLabel(_:)();
}

uint64_t View.accessibilityLabel<A>(_:)()
{
  return View.accessibilityLabel<A>(_:)();
}

uint64_t View.confirmationDialog<A, B>(_:isPresented:titleVisibility:actions:message:)()
{
  return View.confirmationDialog<A, B>(_:isPresented:titleVisibility:actions:message:)();
}

uint64_t View.listSectionSpacing(_:)()
{
  return View.listSectionSpacing(_:)();
}

uint64_t View.onPreferenceChange<A>(_:perform:)()
{
  return View.onPreferenceChange<A>(_:perform:)();
}

uint64_t View.accessibilityHidden(_:)()
{
  return View.accessibilityHidden(_:)();
}

uint64_t View.accessibilityElement(children:)()
{
  return View.accessibilityElement(children:)();
}

uint64_t View.listSectionSeparator(_:edges:)()
{
  return View.listSectionSeparator(_:edges:)();
}

uint64_t View.navigationDestination<A, B>(for:destination:)()
{
  return View.navigationDestination<A, B>(for:destination:)();
}

uint64_t View.accessibilityAddTraits(_:)()
{
  return View.accessibilityAddTraits(_:)();
}

uint64_t View.onContinueUserActivity(_:perform:)()
{
  return View.onContinueUserActivity(_:perform:)();
}

uint64_t View.onScrollGeometryChange<A>(for:of:action:)()
{
  return View.onScrollGeometryChange<A>(for:of:action:)();
}

uint64_t View.accessibilityIdentifier(_:)()
{
  return View.accessibilityIdentifier(_:)();
}

uint64_t View.interactiveDismissDisabled(_:)()
{
  return View.interactiveDismissDisabled(_:)();
}

uint64_t View.navigationBarBackButtonHidden(_:)()
{
  return View.navigationBarBackButtonHidden(_:)();
}

uint64_t View.navigationBarTitleDisplayMode(_:)()
{
  return View.navigationBarTitleDisplayMode(_:)();
}

uint64_t View.accessibilityShowsLargeContentViewer()()
{
  return View.accessibilityShowsLargeContentViewer()();
}

uint64_t View.accessibilityShowsLargeContentViewer<A>(_:)()
{
  return View.accessibilityShowsLargeContentViewer<A>(_:)();
}

uint64_t View.font(_:)()
{
  return View.font(_:)();
}

uint64_t View.task<A>(id:priority:_:)()
{
  return View.task<A>(id:priority:_:)();
}

uint64_t View.task(priority:_:)()
{
  return View.task(priority:_:)();
}

uint64_t View.tint(_:)()
{
  return View.tint(_:)();
}

uint64_t View.sheet<A>(isPresented:onDismiss:content:)()
{
  return View.sheet<A>(isPresented:onDismiss:content:)();
}

uint64_t View.toolbar<A>(content:)()
{
  return View.toolbar<A>(content:)();
}

{
  return View.toolbar<A>(content:)();
}

uint64_t View.modifier<A>(_:)()
{
  return View.modifier<A>(_:)();
}

uint64_t View.onAppear(perform:)()
{
  return View.onAppear(perform:)();
}

uint64_t View.onChange<A>(of:initial:_:)()
{
  return View.onChange<A>(of:initial:_:)();
}

uint64_t View.redacted(reason:)()
{
  return View.redacted(reason:)();
}

uint64_t View.lineLimit(_:)()
{
  return View.lineLimit(_:)();
}

uint64_t View.listStyle<A>(_:)()
{
  return View.listStyle<A>(_:)();
}

uint64_t View.menuStyle<A>(_:)()
{
  return View.menuStyle<A>(_:)();
}

uint64_t Color.init(uiColor:)()
{
  return Color.init(uiColor:)();
}

uint64_t type metadata accessor for Color.RGBColorSpace()
{
  return type metadata accessor for Color.RGBColorSpace();
}

uint64_t static Color.red.getter()
{
  return static Color.red.getter();
}

uint64_t static Color.blue.getter()
{
  return static Color.blue.getter();
}

uint64_t static Color.gray.getter()
{
  return static Color.gray.getter();
}

uint64_t static Color.black.getter()
{
  return static Color.black.getter();
}

uint64_t static Color.clear.getter()
{
  return static Color.clear.getter();
}

uint64_t static Color.white.getter()
{
  return static Color.white.getter();
}

uint64_t Color.opacity(_:)()
{
  return Color.opacity(_:)();
}

uint64_t static Color.primary.getter()
{
  return static Color.primary.getter();
}

uint64_t static Color.secondary.getter()
{
  return static Color.secondary.getter();
}

uint64_t Color.init(_:red:green:blue:opacity:)()
{
  return Color.init(_:red:green:blue:opacity:)();
}

uint64_t Color.init(_:bundle:)()
{
  return Color.init(_:bundle:)();
}

uint64_t Color.init(_:)()
{
  return Color.init(_:)();
}

uint64_t Color.init<A>(_:)()
{
  return Color.init<A>(_:)();
}

uint64_t Image.init(uiImage:)()
{
  return Image.init(uiImage:)();
}

uint64_t Image.init(systemName:)()
{
  return Image.init(systemName:)();
}

uint64_t type metadata accessor for Image.ResizingMode()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t Image.init(_internalSystemName:)()
{
  return Image.init(_internalSystemName:)();
}

uint64_t type metadata accessor for Image.Scale()
{
  return type metadata accessor for Image.Scale();
}

uint64_t Image.resizable(capInsets:resizingMode:)()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t Label.init(title:icon:)()
{
  return Label.init(title:icon:)();
}

uint64_t Label<>.init(_:systemImage:)()
{
  return Label<>.init(_:systemImage:)();
}

uint64_t State.init(wrappedValue:)()
{
  return State.init(wrappedValue:)();
}

uint64_t State.wrappedValue.getter()
{
  return State.wrappedValue.getter();
}

uint64_t State.wrappedValue.setter()
{
  return State.wrappedValue.setter();
}

uint64_t State.projectedValue.getter()
{
  return State.projectedValue.getter();
}

uint64_t type metadata accessor for State()
{
  return type metadata accessor for State();
}

uint64_t Button.init(role:action:label:)()
{
  return Button.init(role:action:label:)();
}

uint64_t Button.init(action:label:)()
{
  return Button.init(action:label:)();
}

uint64_t Button<>.init(_:role:action:)()
{
  return Button<>.init(_:role:action:)();
}

uint64_t type metadata accessor for Button()
{
  return type metadata accessor for Button();
}

uint64_t HStack.init(alignment:spacing:content:)()
{
  return HStack.init(alignment:spacing:content:)();
}

uint64_t type metadata accessor for HStack()
{
  return type metadata accessor for HStack();
}

uint64_t Picker.init(selection:label:content:)()
{
  return Picker.init(selection:label:content:)();
}

uint64_t AnyView.init<A>(_:)()
{
  return AnyView.init<A>(_:)();
}

uint64_t Binding.wrappedValue.getter()
{
  return Binding.wrappedValue.getter();
}

uint64_t Binding.subscript.getter()
{
  return Binding.subscript.getter();
}

uint64_t Divider.init()()
{
  return Divider.init()();
}

uint64_t type metadata accessor for Divider()
{
  return type metadata accessor for Divider();
}

uint64_t ForEach<>.init(_:id:content:)()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t ForEach<>.init(_:content:)()
{
  return ForEach<>.init(_:content:)();
}

uint64_t type metadata accessor for ForEach()
{
  return type metadata accessor for ForEach();
}

uint64_t Section<>.init(_:content:)()
{
  return Section<>.init(_:content:)();
}

uint64_t Section<>.init(header:content:)()
{
  return Section<>.init(header:content:)();
}

uint64_t Section<>.init(content:)()
{
  return Section<>.init(content:)();
}

uint64_t type metadata accessor for Section()
{
  return type metadata accessor for Section();
}

uint64_t Bindable.wrappedValue.getter()
{
  return Bindable.wrappedValue.getter();
}

uint64_t Bindable.projectedValue.getter()
{
  return Bindable.projectedValue.getter();
}

uint64_t Bindable<A>.init(wrappedValue:)()
{
  return Bindable<A>.init(wrappedValue:)();
}

uint64_t Bindable<A>.subscript.getter()
{
  return Bindable<A>.subscript.getter();
}

uint64_t type metadata accessor for Bindable()
{
  return type metadata accessor for Bindable();
}

uint64_t Gradient.Stop.init(color:location:)()
{
  return Gradient.Stop.init(color:location:)();
}

uint64_t Gradient.init(stops:)()
{
  return Gradient.init(stops:)();
}

uint64_t Gradient.init(colors:)()
{
  return Gradient.init(colors:)();
}

uint64_t static Material.thin.getter()
{
  return static Material.thin.getter();
}

uint64_t type metadata accessor for Material()
{
  return type metadata accessor for Material();
}

uint64_t static Alignment.center.getter()
{
  return static Alignment.center.getter();
}

uint64_t static Alignment.leading.getter()
{
  return static Alignment.leading.getter();
}

uint64_t static Alignment.trailing.getter()
{
  return static Alignment.trailing.getter();
}

uint64_t static Animation.interpolatingSpring(mass:stiffness:damping:initialVelocity:)()
{
  return static Animation.interpolatingSpring(mass:stiffness:damping:initialVelocity:)();
}

uint64_t Animation.delay(_:)()
{
  return Animation.delay(_:)();
}

uint64_t static Animation.easeIn(duration:)()
{
  return static Animation.easeIn(duration:)();
}

uint64_t static Animation.spring(response:dampingFraction:blendDuration:)()
{
  return static Animation.spring(response:dampingFraction:blendDuration:)();
}

uint64_t static Animation.default.getter()
{
  return static Animation.default.getter();
}

uint64_t static Animation.easeOut(duration:)()
{
  return static Animation.easeOut(duration:)();
}

uint64_t static Animation.easeOut.getter()
{
  return static Animation.easeOut.getter();
}

uint64_t static Animation.easeInOut.getter()
{
  return static Animation.easeInOut.getter();
}

uint64_t ShareLink<>.init<>(item:subject:message:onPresentationChanged:)()
{
  return ShareLink<>.init<>(item:subject:message:onPresentationChanged:)();
}

uint64_t type metadata accessor for TupleView()
{
  return type metadata accessor for TupleView();
}

uint64_t TupleView.init(_:)()
{
  return TupleView.init(_:)();
}

uint64_t static UnitPoint.top.getter()
{
  return static UnitPoint.top.getter();
}

uint64_t static UnitPoint.bottom.getter()
{
  return static UnitPoint.bottom.getter();
}

uint64_t static UnitPoint.center.getter()
{
  return static UnitPoint.center.getter();
}

uint64_t dispatch thunk of SystemMusicPlayer.queue.getter()
{
  return dispatch thunk of SystemMusicPlayer.queue.getter();
}

uint64_t dispatch thunk of SystemMusicPlayer.queue.setter()
{
  return dispatch thunk of SystemMusicPlayer.queue.setter();
}

uint64_t static SystemMusicPlayer.shared.getter()
{
  return static SystemMusicPlayer.shared.getter();
}

uint64_t type metadata accessor for SystemMusicPlayer()
{
  return type metadata accessor for SystemMusicPlayer();
}

uint64_t static PartialMusicProperty<A>.biography.getter()
{
  return static PartialMusicProperty<A>.biography.getter();
}

uint64_t static PartialMusicProperty<A>.editorialVideoArtworks.getter()
{
  return static PartialMusicProperty<A>.editorialVideoArtworks.getter();
}

uint64_t static PartialMusicProperty<A>.albums.getter()
{
  return static PartialMusicProperty<A>.albums.getter();
}

uint64_t static PartialMusicProperty<A>.artists.getter()
{
  return static PartialMusicProperty<A>.artists.getter();
}

uint64_t type metadata accessor for MusicDataRequest.ExecutionMethod()
{
  return type metadata accessor for MusicDataRequest.ExecutionMethod();
}

uint64_t static MusicDataRequest.preferredExecutionMethod.setter()
{
  return static MusicDataRequest.preferredExecutionMethod.setter();
}

uint64_t MusicSubscription.canBecomeSubscriber.getter()
{
  return MusicSubscription.canBecomeSubscriber.getter();
}

uint64_t static MusicSubscription.subscriptionUpdates.getter()
{
  return static MusicSubscription.subscriptionUpdates.getter();
}

uint64_t MusicSubscription.Updates.makeAsyncIterator()()
{
  return MusicSubscription.Updates.makeAsyncIterator()();
}

uint64_t type metadata accessor for MusicSubscription.Updates.Iterator()
{
  return type metadata accessor for MusicSubscription.Updates.Iterator();
}

uint64_t type metadata accessor for MusicSubscription.Updates()
{
  return type metadata accessor for MusicSubscription.Updates();
}

uint64_t type metadata accessor for MusicSubscription()
{
  return type metadata accessor for MusicSubscription();
}

uint64_t type metadata accessor for MusicAuthorization.Status()
{
  return type metadata accessor for MusicAuthorization.Status();
}

uint64_t MusicLibraryRequest<>.sort<A>(by:ascending:)()
{
  return MusicLibraryRequest<>.sort<A>(by:ascending:)();
}

uint64_t MusicLibraryRequest<>.filter<A>(matching:equalTo:)()
{
  return MusicLibraryRequest<>.filter<A>(matching:equalTo:)();
}

uint64_t MusicLibraryRequest.sort<A>(by:ascending:)()
{
  return MusicLibraryRequest.sort<A>(by:ascending:)();
}

uint64_t MusicLibraryRequest.limit.setter()
{
  return MusicLibraryRequest.limit.setter();
}

uint64_t MusicLibraryRequest.init()()
{
  return MusicLibraryRequest.init()();
}

uint64_t MusicLibraryResponse.items.getter()
{
  return MusicLibraryResponse.items.getter();
}

uint64_t MusicAttributeProperty.init(_:)()
{
  return MusicAttributeProperty.init(_:)();
}

uint64_t MusicCatalogResourceRequest.properties.setter()
{
  return MusicCatalogResourceRequest.properties.setter();
}

uint64_t MusicCatalogResourceRequest.limit.setter()
{
  return MusicCatalogResourceRequest.limit.setter();
}

uint64_t MusicCatalogResourceRequest.init<A>(matching:equalTo:)()
{
  return MusicCatalogResourceRequest.init<A>(matching:equalTo:)();
}

uint64_t MusicCatalogResourceResponse.items.getter()
{
  return MusicCatalogResourceResponse.items.getter();
}

uint64_t dispatch thunk of MusicItem.id.getter()
{
  return dispatch thunk of MusicItem.id.getter();
}

uint64_t MusicItemID.init(_:)()
{
  return MusicItemID.init(_:)();
}

uint64_t type metadata accessor for MusicPlayer.PlaybackStatus()
{
  return type metadata accessor for MusicPlayer.PlaybackStatus();
}

uint64_t dispatch thunk of MusicPlayer.Queue.__allocating_init(arrayLiteral:)()
{
  return dispatch thunk of MusicPlayer.Queue.__allocating_init(arrayLiteral:)();
}

uint64_t dispatch thunk of MusicPlayer.Queue.currentEntry.getter()
{
  return dispatch thunk of MusicPlayer.Queue.currentEntry.getter();
}

uint64_t MusicPlayer.Queue.Entry.Item.id.getter()
{
  return MusicPlayer.Queue.Entry.Item.id.getter();
}

uint64_t type metadata accessor for MusicPlayer.Queue.Entry.Item()
{
  return type metadata accessor for MusicPlayer.Queue.Entry.Item();
}

uint64_t MusicPlayer.Queue.Entry.item.getter()
{
  return MusicPlayer.Queue.Entry.item.getter();
}

uint64_t type metadata accessor for MusicPlayer.Queue.Entry()
{
  return type metadata accessor for MusicPlayer.Queue.Entry();
}

uint64_t type metadata accessor for MusicPlayer.Queue()
{
  return type metadata accessor for MusicPlayer.Queue();
}

uint64_t dispatch thunk of MusicPlayer.State.playbackStatus.getter()
{
  return dispatch thunk of MusicPlayer.State.playbackStatus.getter();
}

uint64_t dispatch thunk of MusicPlayer.State.objectWillChange.getter()
{
  return dispatch thunk of MusicPlayer.State.objectWillChange.getter();
}

uint64_t dispatch thunk of MusicPlayer.pause()()
{
  return dispatch thunk of MusicPlayer.pause()();
}

uint64_t MusicPlayer.state.getter()
{
  return MusicPlayer.state.getter();
}

uint64_t MusicLibrary.state<A>(for:)()
{
  return MusicLibrary.state<A>(for:)();
}

uint64_t static MusicLibrary.AddStatus.== infix(_:_:)()
{
  return static MusicLibrary.AddStatus.== infix(_:_:)();
}

uint64_t type metadata accessor for MusicLibrary.AddStatus()
{
  return type metadata accessor for MusicLibrary.AddStatus();
}

uint64_t dispatch thunk of MusicLibrary.ItemState.addStatus.getter()
{
  return dispatch thunk of MusicLibrary.ItemState.addStatus.getter();
}

uint64_t static MusicLibrary.shared.getter()
{
  return static MusicLibrary.shared.getter();
}

uint64_t type metadata accessor for MusicLibrary()
{
  return type metadata accessor for MusicLibrary();
}

uint64_t dispatch thunk of SongFilter.id.getter()
{
  return dispatch thunk of SongFilter.id.getter();
}

uint64_t PreviewAsset.url.getter()
{
  return PreviewAsset.url.getter();
}

uint64_t type metadata accessor for PreviewAsset()
{
  return type metadata accessor for PreviewAsset();
}

uint64_t dispatch thunk of LibraryPlaylistSortProperties.name.getter()
{
  return dispatch thunk of LibraryPlaylistSortProperties.name.getter();
}

uint64_t Song.movementName.getter()
{
  return Song.movementName.getter();
}

uint64_t Song.previewAssets.getter()
{
  return Song.previewAssets.getter();
}

uint64_t Song.id.getter()
{
  return Song.id.getter();
}

uint64_t Song.url.getter()
{
  return Song.url.getter();
}

uint64_t Song.title.getter()
{
  return Song.title.getter();
}

uint64_t Song.albums.getter()
{
  return Song.albums.getter();
}

uint64_t Song.artists.getter()
{
  return Song.artists.getter();
}

uint64_t Song.workName.getter()
{
  return Song.workName.getter();
}

uint64_t type metadata accessor for Song()
{
  return type metadata accessor for Song();
}

uint64_t Album.classicalURL.getter()
{
  return Album.classicalURL.getter();
}

uint64_t Album.recordLabelName.getter()
{
  return Album.recordLabelName.getter();
}

uint64_t Album.url.getter()
{
  return Album.url.getter();
}

uint64_t Album.title.getter()
{
  return Album.title.getter();
}

uint64_t Album.artwork.getter()
{
  return Album.artwork.getter();
}

uint64_t type metadata accessor for Album()
{
  return type metadata accessor for Album();
}

uint64_t Genre.name.getter()
{
  return Genre.name.getter();
}

uint64_t type metadata accessor for Genre()
{
  return type metadata accessor for Genre();
}

uint64_t Artist.biography.getter()
{
  return Artist.biography.getter();
}

uint64_t Artist.url.getter()
{
  return Artist.url.getter();
}

uint64_t Artist.name.getter()
{
  return Artist.name.getter();
}

uint64_t Artist.genres.getter()
{
  return Artist.genres.getter();
}

uint64_t Artist.subscript.getter()
{
  return Artist.subscript.getter();
}

uint64_t type metadata accessor for Artist()
{
  return type metadata accessor for Artist();
}

uint64_t Artwork.url(width:height:)()
{
  return Artwork.url(width:height:)();
}

uint64_t type metadata accessor for Artwork()
{
  return type metadata accessor for Artwork();
}

uint64_t Playlist.isCollaborative.getter()
{
  return Playlist.isCollaborative.getter();
}

uint64_t Playlist.id.getter()
{
  return Playlist.id.getter();
}

uint64_t Playlist.name.getter()
{
  return Playlist.name.getter();
}

uint64_t Playlist.artwork.getter()
{
  return Playlist.artwork.getter();
}

uint64_t type metadata accessor for Playlist()
{
  return type metadata accessor for Playlist();
}

uint64_t SHManagedSession.spectralOutput.getter()
{
  return SHManagedSession.spectralOutput.getter();
}

uint64_t static SHManagedSession.State.== infix(_:_:)()
{
  return static SHManagedSession.State.== infix(_:_:)();
}

uint64_t SHManagedSession.state.getter()
{
  return SHManagedSession.state.getter();
}

Swift::Void __swiftcall SHManagedSession.cancel()()
{
}

uint64_t SHManagedSession.init()()
{
  return SHManagedSession.init()();
}

uint64_t type metadata accessor for SHManagedSession()
{
  return type metadata accessor for SHManagedSession();
}

uint64_t SHLibrary.isUpdating.getter()
{
  return SHLibrary.isUpdating.getter();
}

uint64_t SHLibrary.isEncrypted.getter()
{
  return SHLibrary.isEncrypted.getter();
}

uint64_t static SHLibrary.localizedAttribution(for:)()
{
  return static SHLibrary.localizedAttribution(for:)();
}

uint64_t SHLibrary.items.getter()
{
  return SHLibrary.items.getter();
}

uint64_t static SHLibrary.default.getter()
{
  return static SHLibrary.default.getter();
}

uint64_t type metadata accessor for SHLibrary()
{
  return type metadata accessor for SHLibrary();
}

uint64_t dispatch thunk of ControlCenter.reloadControls(ofKind:)()
{
  return dispatch thunk of ControlCenter.reloadControls(ofKind:)();
}

uint64_t static ControlCenter.shared.getter()
{
  return static ControlCenter.shared.getter();
}

uint64_t type metadata accessor for ControlCenter()
{
  return type metadata accessor for ControlCenter();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t dispatch thunk of static Comparable.<= infix(_:_:)()
{
  return dispatch thunk of static Comparable.<= infix(_:_:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t String.LocalizationValue.init(stringLiteral:)()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t type metadata accessor for String.LocalizationValue()
{
  return type metadata accessor for String.LocalizationValue();
}

uint64_t static String.StandardComparator.localizedStandard.getter()
{
  return static String.StandardComparator.localizedStandard.getter();
}

uint64_t type metadata accessor for String.StandardComparator()
{
  return type metadata accessor for String.StandardComparator();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String.localizedStringWithFormat(_:_:)()
{
  return static String.localizedStringWithFormat(_:_:)();
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

uint64_t String.init(localized:table:bundle:locale:comment:)()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t String.init(localized:)()
{
  return String.init(localized:)();
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

uint64_t static String._fromSubstring(_:)()
{
  return static String._fromSubstring(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.index(_:offsetBy:limitedBy:)()
{
  return String.index(_:offsetBy:limitedBy:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t Sequence.sorted<A>(using:)()
{
  return Sequence.sorted<A>(using:)();
}

uint64_t dispatch thunk of Sequence._copyToContiguousArray()()
{
  return dispatch thunk of Sequence._copyToContiguousArray()();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
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

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t type metadata accessor for Bool.IntentDisplayName()
{
  return type metadata accessor for Bool.IntentDisplayName();
}

NSNumber __swiftcall Bool._bridgeToObjectiveC()()
{
  return (NSNumber)Bool._bridgeToObjectiveC()();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t static MainActor.shared.getter()
{
  return static MainActor.shared.getter();
}

uint64_t type metadata accessor for MainActor()
{
  return type metadata accessor for MainActor();
}

uint64_t static TaskPriority.userInitiated.getter()
{
  return static TaskPriority.userInitiated.getter();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t AsyncStream.makeAsyncIterator()()
{
  return AsyncStream.makeAsyncIterator()();
}

Swift::Void __swiftcall Task.cancel()()
{
}

uint64_t static Task<>.checkCancellation()()
{
  return static Task<>.checkCancellation()();
}

NSNumber __swiftcall Double._bridgeToObjectiveC()()
{
  return (NSNumber)Double._bridgeToObjectiveC()();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return dispatch thunk of Collection.startIndex.getter();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return dispatch thunk of Collection.count.getter();
}

uint64_t dispatch thunk of Collection.endIndex.getter()
{
  return dispatch thunk of Collection.endIndex.getter();
}

uint64_t dispatch thunk of Collection.formIndex(after:)()
{
  return dispatch thunk of Collection.formIndex(after:)();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t SHMediaItem.properties.getter()
{
  return SHMediaItem.properties.getter();
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

uint64_t UIViewController.registerForTraitChanges<A>(_:handler:)()
{
  return UIViewController.registerForTraitChanges<A>(_:handler:)();
}

uint64_t static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)()
{
  return static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
}

uint64_t type metadata accessor for OS_dispatch_queue.SchedulerOptions()
{
  return type metadata accessor for OS_dispatch_queue.SchedulerOptions();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t static UISceneSessionRole.activitySystemAperture.getter()
{
  return static UISceneSessionRole.activitySystemAperture.getter();
}

uint64_t type metadata accessor for NSNotificationCenter.Publisher()
{
  return type metadata accessor for NSNotificationCenter.Publisher();
}

uint64_t NSNotificationCenter.publisher(for:object:)()
{
  return NSNotificationCenter.publisher(for:object:)();
}

CMTime __swiftcall CMTime.init(value:timescale:)(Swift::Int64 value, Swift::Int32 timescale)
{
  CMTimeValue v2 = CMTime.init(value:timescale:)(value, *(void *)&timescale);
  result.epoch = v4;
  result.timescale = v3;
  result.flags = HIDWORD(v3);
  result.value = v2;
  return result;
}

uint64_t CMTime.seconds.getter()
{
  return CMTime.seconds.getter();
}

uint64_t UIColor.init(_:)()
{
  return UIColor.init(_:)();
}

uint64_t NSObject.hashValue.getter()
{
  return NSObject.hashValue.getter();
}

uint64_t UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)()
{
  return UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
}

uint64_t type metadata accessor for UIButton.Configuration.CornerStyle()
{
  return type metadata accessor for UIButton.Configuration.CornerStyle();
}

uint64_t UIButton.Configuration.cornerStyle.setter()
{
  return UIButton.Configuration.cornerStyle.setter();
}

uint64_t UIButton.Configuration.attributedTitle.setter()
{
  return UIButton.Configuration.attributedTitle.setter();
}

uint64_t UIButton.Configuration.baseBackgroundColor.setter()
{
  return UIButton.Configuration.baseBackgroundColor.setter();
}

uint64_t UIButton.Configuration.baseForegroundColor.setter()
{
  return UIButton.Configuration.baseForegroundColor.setter();
}

uint64_t UIButton.Configuration.image.setter()
{
  return UIButton.Configuration.image.setter();
}

uint64_t static UIButton.Configuration.filled()()
{
  return static UIButton.Configuration.filled()();
}

uint64_t type metadata accessor for UIButton.Configuration()
{
  return type metadata accessor for UIButton.Configuration();
}

uint64_t UIButton.configuration.setter()
{
  return UIButton.configuration.setter();
}

uint64_t type metadata accessor for NSRunLoop.SchedulerOptions()
{
  return type metadata accessor for NSRunLoop.SchedulerOptions();
}

uint64_t type metadata accessor for NSRunLoop.SchedulerTimeType.Stride()
{
  return type metadata accessor for NSRunLoop.SchedulerTimeType.Stride();
}

uint64_t NSRunLoop.SchedulerTimeType.Stride.init(_:)()
{
  return NSRunLoop.SchedulerTimeType.Stride.init(_:)();
}

uint64_t SHSession.Result.wasCancelled.getter()
{
  return SHSession.Result.wasCancelled.getter();
}

uint64_t Optional.debugDescription.getter()
{
  return Optional.debugDescription.getter();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t Substring.init(_:)()
{
  return Substring.init(_:)();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t StringProtocol.localizedUppercase.getter()
{
  return StringProtocol.localizedUppercase.getter();
}

uint64_t StringProtocol.addingPercentEncoding(withAllowedCharacters:)()
{
  return StringProtocol.addingPercentEncoding(withAllowedCharacters:)();
}

uint64_t StringProtocol.precomposedStringWithCanonicalMapping.getter()
{
  return StringProtocol.precomposedStringWithCanonicalMapping.getter();
}

uint64_t BinaryInteger.formatted<A>(_:)()
{
  return BinaryInteger.formatted<A>(_:)();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t __CocoaSet.makeIterator()()
{
  return __CocoaSet.makeIterator()();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return __CocoaSet.Iterator.next()();
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

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return specialized ContiguousArray._endMutation()();
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

uint64_t type metadata accessor for ContinuousClock.Instant()
{
  return type metadata accessor for ContinuousClock.Instant();
}

uint64_t ContinuousClock.init()()
{
  return ContinuousClock.init()();
}

uint64_t type metadata accessor for ContinuousClock()
{
  return type metadata accessor for ContinuousClock();
}

uint64_t dispatch thunk of InstantProtocol.advanced(by:)()
{
  return dispatch thunk of InstantProtocol.advanced(by:)();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
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

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t _findStringSwitchCaseWithCache(cases:string:cache:)()
{
  return _findStringSwitchCaseWithCache(cases:string:cache:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t dispatch thunk of Clock.now.getter()
{
  return dispatch thunk of Clock.now.getter();
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

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t static Duration.seconds(_:)()
{
  return static Duration.seconds(_:)();
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformScale(retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformTranslate(retstr, t, tx, ty);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return _CLLocationCoordinate2DIsValid(coord);
}

MKCoordinateRegion MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D centerCoordinate, CLLocationDistance latitudinalMeters, CLLocationDistance longitudinalMeters)
{
  return _MKCoordinateRegionMakeWithDistance(centerCoordinate, latitudinalMeters, longitudinalMeters);
}

uint64_t SBSIsSystemApertureAvailable()
{
  return _SBSIsSystemApertureAvailable();
}

uint64_t SBUIIsSystemApertureEnabled()
{
  return _SBUIIsSystemApertureEnabled();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return _UIAccessibilityIsReduceMotionEnabled();
}

BOOL UIAccessibilityIsVideoAutoplayEnabled(void)
{
  return _UIAccessibilityIsVideoAutoplayEnabled();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
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

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
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

float powf(float a1, float a2)
{
  return _powf(a1, a2);
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

uint64_t swift_asyncLet_begin()
{
  return _swift_asyncLet_begin();
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

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return _swift_getOpaqueTypeMetadata2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTupleTypeLayout2()
{
  return _swift_getTupleTypeLayout2();
}

uint64_t swift_getTupleTypeMetadata()
{
  return _swift_getTupleTypeMetadata();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return _swift_getTupleTypeMetadata2();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return _swift_getTupleTypeMetadata3();
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

uint64_t swift_isUniquelyReferenced_native()
{
  return _swift_isUniquelyReferenced_native();
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

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
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