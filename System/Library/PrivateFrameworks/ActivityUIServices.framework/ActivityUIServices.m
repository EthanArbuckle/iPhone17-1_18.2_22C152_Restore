id _sceneComponentLogger()
{
  void *v0;
  uint64_t vars8;

  if (_sceneComponentLogger___once != -1) {
    dispatch_once(&_sceneComponentLogger___once, &__block_literal_global);
  }
  v0 = (void *)_sceneComponentLogger___instance;
  return v0;
}

uint64_t ___sceneComponentLogger_block_invoke()
{
  _sceneComponentLogger___instance = (uint64_t)os_log_create("com.apple.activityuiservices", "sceneComponent");
  return MEMORY[0x270F9A758]();
}

void sub_23C94B7FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

unint64_t activitySceneType(unint64_t result)
{
  if (result >= 4) {
    return 1;
  }
  return result;
}

unint64_t acuisSceneType(unint64_t result)
{
  if (result >= 4) {
    return 1;
  }
  return result;
}

id _logger()
{
  if (_logger___once[0] != -1) {
    dispatch_once(_logger___once, &__block_literal_global_0);
  }
  v0 = (void *)_logger___instance;
  return v0;
}

uint64_t ___logger_block_invoke()
{
  _logger___instance = (uint64_t)os_log_create("com.apple.activityuiservices", "openApplicationAction");
  return MEMORY[0x270F9A758]();
}

void sub_23C94CE8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 120), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

double _CentroidOfTouches(void *a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v1 = a1;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v2) {
    goto LABEL_10;
  }
  uint64_t v3 = v2;
  unint64_t v4 = 0;
  uint64_t v5 = *(void *)v18;
  double v6 = 0.0;
  double v7 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if (*(void *)v18 != v5) {
        objc_enumerationMutation(v1);
      }
      v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
      v10 = [v9 window];
      [v9 locationInView:0];
      objc_msgSend(v10, "_convertPointToSceneReferenceSpace:");
      double v12 = v11;
      double v14 = v13;

      double v6 = v6 + v12;
      double v7 = v7 + v14;
    }
    v4 += v3;
    uint64_t v3 = [v1 countByEnumeratingWithState:&v17 objects:v21 count:16];
  }
  while (v3);
  if (v4) {
    double v15 = v6 / (double)v4;
  }
  else {
LABEL_10:
  }
    double v15 = *MEMORY[0x263F00148];

  return v15;
}

__CFString *NSStringFromACUISSizeDimensionRequestType(uint64_t a1)
{
  if (a1) {
    return @"dynamic";
  }
  else {
    return @"fixed";
  }
}

__CFString *ACUISActivitySceneCommandDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"unknown";
  }
  else {
    return off_264E783A0[a1 - 1];
  }
}

void *sub_23C950880()
{
  id v1 = *(void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics);
  id v2 = v1;
  return v1;
}

void sub_23C950928(void *a1)
{
  sub_23C9521D4(a1, (void (*)(void))type metadata accessor for ActivityItemMetricsRequest, &OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics);
}

id sub_23C95097C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v2 = *(void **)(*a1 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics);
  *a2 = v2;
  return v2;
}

void sub_23C950994(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  sub_23C9521D4(v1, (void (*)(void))type metadata accessor for ActivityItemMetricsRequest, &OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics);
}

void (*sub_23C950A00(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics;
  v3[6] = v1;
  v3[7] = v4;
  uint64_t v5 = *(void **)(v1 + v4);
  v3[4] = v5;
  id v6 = v5;
  return sub_23C950A70;
}

void sub_23C950A70(uint64_t a1, char a2)
{
}

id sub_23C950A98()
{
  return *(id *)(v0 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics);
}

void sub_23C950B54(void *a1)
{
  objc_msgSend(a1, sel_copy);
  sub_23C991270();
  swift_unknownObjectRelease();
  type metadata accessor for ActivityItemMetricsRequest();
  swift_dynamicCast();
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics);
  *(void *)(v1 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics) = v4;
}

id sub_23C950BE8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v2 = *(void **)(*a1 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics);
  *a2 = v2;
  return v2;
}

void sub_23C950C00(id *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  id v3 = *a1;
  objc_msgSend(v3, sel_copy);
  sub_23C991270();
  swift_unknownObjectRelease();
  type metadata accessor for ActivityItemMetricsRequest();
  swift_dynamicCast();
  uint64_t v4 = *(void **)(v2 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics);
  *(void *)(v2 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics) = v5;
}

void (*sub_23C950CA0(void *a1))(uint64_t *a1, char a2)
{
  id v3 = malloc(0x40uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics;
  v3[6] = v1;
  v3[7] = v4;
  uint64_t v5 = *(void **)(v1 + v4);
  v3[4] = v5;
  id v6 = v5;
  return sub_23C950D10;
}

void sub_23C950D10(uint64_t *a1, char a2)
{
  uint64_t v2 = *a1;
  id v3 = *(void **)(*a1 + 32);
  uint64_t v5 = *(void *)(*a1 + 48);
  uint64_t v4 = *(void *)(*a1 + 56);
  if (a2)
  {
    id v6 = v3;
    objc_msgSend(v6, sel_copy);
    sub_23C991270();
    swift_unknownObjectRelease();
    type metadata accessor for ActivityItemMetricsRequest();
    swift_dynamicCast();
    double v7 = *(void **)(v5 + v4);
    *(void *)(v5 + v4) = *(void *)(v2 + 40);
  }
  else
  {
    objc_msgSend(*(id *)(*a1 + 32), sel_copy);
    sub_23C991270();
    swift_unknownObjectRelease();
    type metadata accessor for ActivityItemMetricsRequest();
    swift_dynamicCast();
    v8 = *(void **)(v5 + v4);
    *(void *)(v5 + v4) = *(void *)(v2 + 40);
  }
  free((void *)v2);
}

void *sub_23C950E48()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics);
  id v2 = v1;
  return v1;
}

void sub_23C950EF0(void *a1)
{
  sub_23C9521D4(a1, (void (*)(void))type metadata accessor for SystemApertureMetricsRequest, &OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics);
}

id sub_23C950F44@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v2 = *(void **)(*a1 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics);
  *a2 = v2;
  return v2;
}

void sub_23C950F5C(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  sub_23C9521D4(v1, (void (*)(void))type metadata accessor for SystemApertureMetricsRequest, &OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics);
}

void (*sub_23C950FC8(void *a1))(uint64_t a1, char a2)
{
  id v3 = malloc(0x40uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics;
  v3[6] = v1;
  v3[7] = v4;
  uint64_t v5 = *(void **)(v1 + v4);
  v3[4] = v5;
  id v6 = v5;
  return sub_23C951038;
}

void sub_23C951038(uint64_t a1, char a2)
{
}

void sub_23C951050(uint64_t a1, char a2, void (*a3)(void))
{
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void **)(*(void *)a1 + 32);
  if (a2)
  {
    if (v5)
    {
      objc_msgSend(v5, sel_copy);
      sub_23C991270();
      swift_unknownObjectRelease();
      a3(0);
      int v6 = swift_dynamicCast();
      uint64_t v7 = v4[5];
      if (!v6) {
        uint64_t v7 = 0;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
    uint64_t v11 = v4[6];
    uint64_t v10 = v4[7];
    double v12 = *(void **)(v11 + v10);
    *(void *)(v11 + v10) = v7;

    double v13 = (void *)v4[4];
  }
  else
  {
    if (v5)
    {
      objc_msgSend(*(id *)(*(void *)a1 + 32), sel_copy);
      sub_23C991270();
      swift_unknownObjectRelease();
      a3(0);
      int v8 = swift_dynamicCast();
      uint64_t v9 = v4[5];
      if (!v8) {
        uint64_t v9 = 0;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
    uint64_t v15 = v4[6];
    uint64_t v14 = v4[7];
    double v13 = *(void **)(v15 + v14);
    *(void *)(v15 + v14) = v9;
  }
  free(v4);
}

id ActivityMetricsRequest.__allocating_init(lockScreenMetrics:systemApertureMetrics:ambientMetrics:)(void *a1, void *a2, void *a3)
{
  uint64_t v7 = (char *)objc_allocWithZone(v3);
  uint64_t v8 = OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics;
  *(void *)&v7[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics] = 0;
  uint64_t v9 = OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics;
  *(void *)&v7[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics] = 0;
  *(void *)&v7[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics] = a1;
  uint64_t v10 = *(void **)&v7[v9];
  *(void *)&v7[v9] = a2;
  uint64_t v11 = v7;
  id v12 = a1;
  id v13 = a2;

  uint64_t v14 = *(void **)&v7[v8];
  *(void *)&v7[v8] = a3;
  id v15 = a3;

  v18.receiver = v11;
  v18.super_class = v3;
  id v16 = objc_msgSendSuper2(&v18, sel_init);

  return v16;
}

id ActivityMetricsRequest.init(lockScreenMetrics:systemApertureMetrics:ambientMetrics:)(void *a1, void *a2, void *a3)
{
  id v6 = sub_23C95227C(a1, a2, a3);

  return v6;
}

id ActivityMetricsRequest.__allocating_init(lockScreenMetrics:systemApertureMetrics:)(void *a1, void *a2)
{
  uint64_t v5 = (char *)objc_allocWithZone(v2);
  uint64_t v6 = OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics;
  *(void *)&v5[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics] = 0;
  uint64_t v7 = OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics;
  *(void *)&v5[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics] = 0;
  *(void *)&v5[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics] = a1;
  uint64_t v8 = *(void **)&v5[v7];
  *(void *)&v5[v7] = a2;
  uint64_t v9 = v5;
  id v10 = a1;
  id v11 = a2;

  id v12 = *(void **)&v5[v6];
  *(void *)&v5[v6] = 0;

  v15.receiver = v9;
  v15.super_class = v2;
  id v13 = objc_msgSendSuper2(&v15, sel_init);

  return v13;
}

id ActivityMetricsRequest.init(lockScreenMetrics:systemApertureMetrics:)(void *a1, void *a2)
{
  id v4 = sub_23C952330(a1, a2);

  return v4;
}

uint64_t sub_23C9514A8(char a1)
{
  uint64_t result = 0xD000000000000011;
  if (a1)
  {
    if (a1 == 1) {
      return 0xD000000000000015;
    }
    else {
      return 0x4D746E6569626D61;
    }
  }
  return result;
}

uint64_t sub_23C951548()
{
  uint64_t result = (uint64_t)objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics), sel_hash);
  if (result >= 1) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = result;
  }
  uint64_t v3 = 23 * v2;
  if ((unsigned __int128)(v2 * (__int128)23) >> 64 != (23 * v2) >> 63)
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  id v4 = *(void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics);
  if (v4) {
    uint64_t result = (uint64_t)objc_msgSend(v4, sel_hash);
  }
  else {
    uint64_t result = 1;
  }
  uint64_t v5 = v3 * result;
  if ((unsigned __int128)(v3 * (__int128)result) >> 64 != (v3 * result) >> 63) {
    goto LABEL_15;
  }
  uint64_t v6 = *(void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics);
  if (v6) {
    uint64_t result = (uint64_t)objc_msgSend(v6, sel_hash);
  }
  else {
    uint64_t result = 1;
  }
  if ((unsigned __int128)(v5 * (__int128)result) >> 64 == (v5 * result) >> 63)
  {
    result *= v5;
    return result;
  }
LABEL_16:
  __break(1u);
  return result;
}

uint64_t sub_23C951610(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_23C9523D4(a1, (uint64_t)v21);
  if (!v22)
  {
    sub_23C952480((uint64_t)v21);
    goto LABEL_14;
  }
  type metadata accessor for ActivityMetricsRequest();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_14:
    char v17 = 0;
    return v17 & 1;
  }
  sub_23C952504();
  uint64_t v3 = *(void **)&v20[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics];
  id v4 = *(id *)(v1 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics);
  id v5 = v3;
  char v6 = sub_23C991200();

  if ((v6 & 1) == 0) {
    goto LABEL_13;
  }
  uint64_t v7 = *(void **)(v2 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics);
  uint64_t v8 = *(void **)&v20[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics];
  if (!v7)
  {
    if (!v8) {
      goto LABEL_10;
    }
LABEL_13:

    goto LABEL_14;
  }
  if (!v8) {
    goto LABEL_13;
  }
  type metadata accessor for SystemApertureMetricsRequest();
  id v9 = v8;
  id v10 = v7;
  char v11 = sub_23C991200();

  if ((v11 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_10:
  id v12 = *(void **)(v2 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics);
  id v13 = *(void **)&v20[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics];
  if (!v12)
  {
    id v19 = v13;

    if (!v13)
    {
      char v17 = 1;
      return v17 & 1;
    }

    goto LABEL_14;
  }
  if (!v13) {
    goto LABEL_13;
  }
  type metadata accessor for ActivityItemMetricsRequest();
  id v14 = v12;
  id v15 = v13;
  id v16 = v14;
  char v17 = sub_23C991200();

  return v17 & 1;
}

id sub_23C951894()
{
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29C40]), sel_initWithObject_, v0);
  if (result)
  {
    uint64_t v2 = result;
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics);
    id v4 = (void *)sub_23C990FC0();

    id v5 = *(id *)(v0 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics);
    char v6 = (void *)sub_23C990FC0();

    id v7 = *(id *)(v0 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics);
    uint64_t v8 = (void *)sub_23C990FC0();

    id result = objc_msgSend(v2, sel_build);
    if (result)
    {
      id v9 = result;
      uint64_t v10 = sub_23C990FD0();

      return (id)v10;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

id ActivityMetricsRequest.__allocating_init(xpcDictionary:)()
{
  id v1 = objc_allocWithZone(v0);
  id v2 = sub_23C952544();
  swift_unknownObjectRelease();
  return v2;
}

id ActivityMetricsRequest.init(xpcDictionary:)()
{
  id v0 = sub_23C952544();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t sub_23C951B0C(uint64_t result)
{
  if (result)
  {
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
    return BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  }
  return result;
}

void sub_23C951C04(void *a1@<X8>)
{
  id v3 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics);
  id v4 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics);
  id v5 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics);
  char v6 = (objc_class *)type metadata accessor for ActivityMetricsRequest();
  id v7 = (char *)objc_allocWithZone(v6);
  uint64_t v8 = OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics;
  *(void *)&v7[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics] = 0;
  uint64_t v9 = OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics;
  *(void *)&v7[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics] = 0;
  *(void *)&v7[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics] = v3;
  uint64_t v10 = *(void **)&v7[v9];
  *(void *)&v7[v9] = v4;
  id v11 = v3;
  id v12 = v4;
  id v13 = v11;
  id v14 = v12;
  id v15 = v5;
  id v16 = v7;

  char v17 = *(void **)&v7[v8];
  *(void *)&v7[v8] = v5;
  id v18 = v15;

  v20.receiver = v16;
  v20.super_class = v6;
  id v19 = objc_msgSendSuper2(&v20, sel_init);

  a1[3] = v6;
  *a1 = v19;
}

uint64_t static ActivityMetricsRequest.supportsSecureCoding.getter()
{
  return 1;
}

void sub_23C951D88(void *a1)
{
  id v3 = *(id *)(v1 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics);
  id v4 = (void *)sub_23C990FC0();
  objc_msgSend(a1, sel_encodeObject_forKey_, v3, v4);

  id v5 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics);
  if (v5)
  {
    id v6 = v5;
    id v7 = (void *)sub_23C990FC0();
    objc_msgSend(a1, sel_encodeObject_forKey_, v6, v7);
  }
  uint64_t v8 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics);
  if (v8)
  {
    id v9 = v8;
    id v10 = (id)sub_23C990FC0();
    objc_msgSend(a1, sel_encodeObject_forKey_, v9, v10);
  }
}

id ActivityMetricsRequest.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = sub_23C95278C(a1);

  return v4;
}

id ActivityMetricsRequest.init(coder:)(void *a1)
{
  id v2 = sub_23C95278C(a1);

  return v2;
}

id ActivityMetricsRequest.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void ActivityMetricsRequest.init()()
{
}

id ActivityMetricsRequest.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityMetricsRequest();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

BOOL sub_23C952124(void *a1, void *a2)
{
  return *a1 == *a2;
}

void sub_23C952138(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_23C952140@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

BOOL sub_23C952154(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_23C952184(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_23C952198(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_23C9521AC@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_23C9521BC(void *a1@<X8>)
{
  *a1 = *v1;
}

void *sub_23C9521C8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_23C9521D4(void *a1, void (*a2)(void), void *a3)
{
  if (a1)
  {
    objc_msgSend(a1, sel_copy);
    sub_23C991270();
    swift_unknownObjectRelease();
    a2(0);
    int v6 = swift_dynamicCast();
    uint64_t v7 = v9;
    if (!v6) {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(void **)(v3 + *a3);
  *(void *)(v3 + *a3) = v7;
}

id sub_23C95227C(void *a1, void *a2, void *a3)
{
  uint64_t v7 = OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics;
  *(void *)&v3[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics] = 0;
  uint64_t v8 = OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics;
  *(void *)&v3[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics] = 0;
  *(void *)&v3[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics] = a1;
  uint64_t v9 = *(void **)&v3[v8];
  *(void *)&v3[v8] = a2;
  id v10 = v3;
  id v11 = a1;
  id v12 = a2;

  id v13 = *(void **)&v3[v7];
  *(void *)&v3[v7] = a3;
  id v14 = a3;

  v16.receiver = v10;
  v16.super_class = (Class)type metadata accessor for ActivityMetricsRequest();
  return objc_msgSendSuper2(&v16, sel_init);
}

id sub_23C952330(void *a1, void *a2)
{
  uint64_t v5 = OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics;
  *(void *)&v2[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics] = 0;
  uint64_t v6 = OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics;
  *(void *)&v2[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics] = 0;
  *(void *)&v2[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics] = a1;
  uint64_t v7 = *(void **)&v2[v6];
  *(void *)&v2[v6] = a2;
  uint64_t v8 = v2;
  id v9 = a1;
  id v10 = a2;

  id v11 = *(void **)&v2[v5];
  *(void *)&v2[v5] = 0;

  v13.receiver = v8;
  v13.super_class = (Class)type metadata accessor for ActivityMetricsRequest();
  return objc_msgSendSuper2(&v13, sel_init);
}

uint64_t sub_23C9523D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF22BA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
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

uint64_t sub_23C952480(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF22BA0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for ActivityMetricsRequest()
{
  return self;
}

unint64_t sub_23C952504()
{
  unint64_t result = qword_26AF22810;
  if (!qword_26AF22810)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26AF22810);
  }
  return result;
}

id sub_23C952544()
{
  uint64_t v1 = OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics;
  *(void *)&v0[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics] = 0;
  uint64_t v2 = OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics;
  *(void *)&v0[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics] = 0;
  uint64_t v3 = v0;
  if ((id)BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey())
  {
    sub_23C991270();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
  }
  sub_23C952E40((uint64_t)&v14, (uint64_t)v16);
  if (v17)
  {
    type metadata accessor for ActivityItemMetricsRequest();
    if (swift_dynamicCast())
    {
      id v4 = v12;
      goto LABEL_9;
    }
  }
  else
  {
    sub_23C952480((uint64_t)v16);
  }
  id v4 = sub_23C989B04();
LABEL_9:
  *(void *)&v3[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics] = v4;
  if ((id)BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey())
  {
    sub_23C991270();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
  }
  sub_23C952E40((uint64_t)&v14, (uint64_t)v16);
  if (v17)
  {
    type metadata accessor for SystemApertureMetricsRequest();
    int v5 = swift_dynamicCast();
    uint64_t v6 = v12;
    if (!v5) {
      uint64_t v6 = 0;
    }
  }
  else
  {
    sub_23C952480((uint64_t)v16);
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(void **)&v0[v2];
  *(void *)&v0[v2] = v6;

  if ((id)BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey())
  {
    sub_23C991270();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
  }
  sub_23C952E40((uint64_t)&v14, (uint64_t)v16);
  if (v17)
  {
    type metadata accessor for ActivityItemMetricsRequest();
    int v8 = swift_dynamicCast();
    id v9 = v12;
    if (!v8) {
      id v9 = 0;
    }
  }
  else
  {
    sub_23C952480((uint64_t)v16);
    id v9 = 0;
  }
  id v10 = *(void **)&v0[v1];
  *(void *)&v0[v1] = v9;

  v13.receiver = v3;
  v13.super_class = (Class)type metadata accessor for ActivityMetricsRequest();
  return objc_msgSendSuper2(&v13, sel_init);
}

id sub_23C95278C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics;
  *(void *)&v2[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics] = 0;
  uint64_t v5 = OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics;
  *(void *)&v2[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics] = 0;
  type metadata accessor for ActivityItemMetricsRequest();
  uint64_t v6 = v2;
  uint64_t v7 = sub_23C9911D0();
  if (!v7)
  {
    sub_23C952DEC();
    int v8 = (void *)swift_allocError();
    void *v9 = 0xD000000000000013;
    v9[1] = 0x800000023C996880;
    id v10 = (void *)sub_23C990B20();

    objc_msgSend(a1, sel_failWithError_, v10);
    uint64_t v7 = (uint64_t)sub_23C989B04();
  }
  *(void *)&v6[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics] = v7;
  type metadata accessor for SystemApertureMetricsRequest();
  uint64_t v11 = sub_23C9911D0();
  if (v11)
  {
    id v12 = *(void **)&v2[v5];
    *(void *)&v2[v5] = v11;
  }
  uint64_t v13 = sub_23C9911D0();
  long long v14 = v6;
  if (v13)
  {
    long long v14 = *(char **)&v2[v4];
    *(void *)&v2[v4] = v13;
  }
  v16.receiver = v6;
  v16.super_class = (Class)type metadata accessor for ActivityMetricsRequest();
  return objc_msgSendSuper2(&v16, sel_init);
}

uint64_t method lookup function for ActivityMetricsRequest(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ActivityMetricsRequest);
}

uint64_t dispatch thunk of ActivityMetricsRequest.ambientMetrics.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of ActivityMetricsRequest.ambientMetrics.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of ActivityMetricsRequest.ambientMetrics.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of ActivityMetricsRequest.lockScreenMetrics.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of ActivityMetricsRequest.lockScreenMetrics.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of ActivityMetricsRequest.lockScreenMetrics.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of ActivityMetricsRequest.systemApertureMetrics.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of ActivityMetricsRequest.systemApertureMetrics.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of ActivityMetricsRequest.systemApertureMetrics.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of ActivityMetricsRequest.__allocating_init(lockScreenMetrics:systemApertureMetrics:ambientMetrics:)()
{
  return (*(uint64_t (**)(void))(v0 + 248))();
}

uint64_t dispatch thunk of ActivityMetricsRequest.__allocating_init(lockScreenMetrics:systemApertureMetrics:)()
{
  return (*(uint64_t (**)(void))(v0 + 256))();
}

uint64_t dispatch thunk of ActivityMetricsRequest.__allocating_init(xpcDictionary:)()
{
  return (*(uint64_t (**)(void))(v0 + 264))();
}

uint64_t dispatch thunk of ActivityMetricsRequest.encode(withXPCDictionary:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of ActivityMetricsRequest.copy(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of ActivityMetricsRequest.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of ActivityMetricsRequest.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 296))();
}

uint64_t sub_23C952C24(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_23C952C68(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_23C952C88(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGRect(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_23C952CD4(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_23C952CF4(uint64_t result, int a2, int a3)
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

void type metadata accessor for ACUISActivitySceneCommand(uint64_t a1)
{
}

void type metadata accessor for FBSceneContentState(uint64_t a1)
{
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
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

unint64_t sub_23C952DEC()
{
  unint64_t result = qword_268BBAC90;
  if (!qword_268BBAC90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBAC90);
  }
  return result;
}

uint64_t sub_23C952E40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF22BA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_23C952EBC(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

id sub_23C952F94()
{
  return sub_23C953414(type metadata accessor for ActivityAmbientSceneExtension);
}

uint64_t type metadata accessor for ActivityAmbientSceneExtension()
{
  return self;
}

id sub_23C95306C()
{
  return sub_23C953414(type metadata accessor for ActivitySceneSpecificationBase);
}

uint64_t type metadata accessor for ActivitySceneSpecificationBase()
{
  return self;
}

id sub_23C9530E4()
{
  return sub_23C953414(type metadata accessor for ActivityListItemSceneSpecification);
}

uint64_t type metadata accessor for ActivityListItemSceneSpecification()
{
  return self;
}

id sub_23C95315C()
{
  return sub_23C953414(type metadata accessor for ActivityBannerSceneSpecification);
}

uint64_t type metadata accessor for ActivityBannerSceneSpecification()
{
  return self;
}

id sub_23C9531D4()
{
  return sub_23C953414(type metadata accessor for ActivitySystemApertureSceneSpecification);
}

uint64_t type metadata accessor for ActivitySystemApertureSceneSpecification()
{
  return self;
}

id sub_23C9532D0()
{
  return sub_23C953414(type metadata accessor for ActivityAmbientSceneSpecification);
}

uint64_t type metadata accessor for ActivityAmbientSceneSpecification()
{
  return self;
}

id sub_23C953330(void *a1, uint64_t a2, uint64_t *a3, id *a4)
{
  uint64_t v5 = *a3;
  id v6 = a1;
  if (v5 != -1) {
    swift_once();
  }
  id v7 = *a4;

  return v7;
}

id sub_23C9533B8(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  v4.receiver = a1;
  v4.super_class = (Class)a3();
  return objc_msgSendSuper2(&v4, sel_init);
}

id sub_23C9533FC()
{
  return sub_23C953414(type metadata accessor for ActivityAmbientCompactSceneSpecification);
}

id sub_23C953414(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for ActivityAmbientCompactSceneSpecification()
{
  return self;
}

void *sub_23C953470()
{
  uint64_t v0 = (NSString *)sub_23C990FC0();
  Class v1 = NSClassFromString(v0);

  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  objc_super v3 = sub_23C9730F0(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v5 = v3[2];
  unint64_t v4 = v3[3];
  if (v5 >= v4 >> 1) {
    objc_super v3 = sub_23C9730F0((void *)(v4 > 1), v5 + 1, 1, v3);
  }
  v3[2] = v5 + 1;
  v3[v5 + 4] = ObjCClassMetadata;
  return v3;
}

uint64_t ArchivedActivityFamily.description.getter()
{
  if (*v0) {
    return 0x6D756964656DLL;
  }
  else {
    return 0x6C6C616D73;
  }
}

ActivityUIServices::ArchivedActivityFamily_optional __swiftcall ArchivedActivityFamily.init(rawValue:)(Swift::Int rawValue)
{
  if (rawValue == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (!rawValue) {
    char v2 = 0;
  }
  *Class v1 = v2;
  return (ActivityUIServices::ArchivedActivityFamily_optional)rawValue;
}

uint64_t ArchivedActivityFamily.rawValue.getter()
{
  return *v0;
}

BOOL sub_23C95358C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

unint64_t sub_23C9535A8()
{
  unint64_t result = qword_268BBADD0;
  if (!qword_268BBADD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBADD0);
  }
  return result;
}

uint64_t sub_23C9535FC()
{
  return sub_23C991620();
}

uint64_t sub_23C953644()
{
  return sub_23C9915D0();
}

uint64_t sub_23C953670()
{
  return sub_23C991620();
}

void *sub_23C9536B4@<X0>(void *result@<X0>, char *a2@<X8>)
{
  if (*result == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (*result) {
    char v3 = v2;
  }
  else {
    char v3 = 0;
  }
  *a2 = v3;
  return result;
}

void sub_23C9536D4(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_23C9536E0()
{
  return sub_23C991040();
}

uint64_t sub_23C953740()
{
  return sub_23C991030();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ArchivedActivityFamily(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ArchivedActivityFamily(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x23C9538FCLL);
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

uint64_t sub_23C953924(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_23C953930(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ArchivedActivityFamily()
{
  return &type metadata for ArchivedActivityFamily;
}

unint64_t sub_23C95394C()
{
  unint64_t result = qword_268BBADD8;
  if (!qword_268BBADD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBADD8);
  }
  return result;
}

uint64_t AnimationDemoAttributes.ContentState.value.getter()
{
  return *(void *)v0;
}

uint64_t AnimationDemoAttributes.ContentState.value.setter(uint64_t result)
{
  *Class v1 = result;
  return result;
}

uint64_t (*AnimationDemoAttributes.ContentState.value.modify())()
{
  return CGSizeMake;
}

ActivityUIServices::AnimationDemoAttributes::ContentState __swiftcall AnimationDemoAttributes.ContentState.init(value:)(ActivityUIServices::AnimationDemoAttributes::ContentState value)
{
  v1->value = value.value;
  return value;
}

uint64_t AnimationDemoAttributes.ContentState.hash(into:)()
{
  return sub_23C9915D0();
}

BOOL static AnimationDemoAttributes.ContentState.== infix(_:_:)(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23C953A18()
{
  return 1;
}

uint64_t sub_23C953A20()
{
  return sub_23C991620();
}

uint64_t sub_23C953A64()
{
  return sub_23C9915D0();
}

uint64_t sub_23C953A8C()
{
  return sub_23C991620();
}

uint64_t sub_23C953AD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_23C954954(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23C953AFC()
{
  return 0;
}

void sub_23C953B08(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_23C953B14(uint64_t a1)
{
  unint64_t v2 = sub_23C953CC0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_23C953B50(uint64_t a1)
{
  unint64_t v2 = sub_23C953CC0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t AnimationDemoAttributes.ContentState.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBADE0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_23C953CC0();
  sub_23C991660();
  sub_23C9914A0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_23C953CC0()
{
  unint64_t result = qword_268BBADE8;
  if (!qword_268BBADE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBADE8);
  }
  return result;
}

uint64_t AnimationDemoAttributes.ContentState.hashValue.getter()
{
  return sub_23C991620();
}

uint64_t AnimationDemoAttributes.ContentState.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBADF0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  int v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_23C953CC0();
  sub_23C991650();
  if (!v2)
  {
    uint64_t v9 = sub_23C991470();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_23C953EAC()
{
  return sub_23C991620();
}

uint64_t sub_23C953EF4()
{
  return sub_23C9915D0();
}

uint64_t sub_23C953F20()
{
  return sub_23C991620();
}

uint64_t sub_23C953F64@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return AnimationDemoAttributes.ContentState.init(from:)(a1, a2);
}

uint64_t sub_23C953F7C(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBADE0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_23C953CC0();
  sub_23C991660();
  sub_23C9914A0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_23C9540B4()
{
  return 0;
}

uint64_t sub_23C9540C0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_23C9540F0(uint64_t a1)
{
  unint64_t v2 = sub_23C954278();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_23C95412C(uint64_t a1)
{
  unint64_t v2 = sub_23C954278();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t AnimationDemoAttributes.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBADF8);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_23C954278();
  sub_23C991660();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_23C954278()
{
  unint64_t result = qword_268BBAE00;
  if (!qword_268BBAE00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBAE00);
  }
  return result;
}

uint64_t AnimationDemoAttributes.init(from:)(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_0(a1);
}

unint64_t sub_23C9542F8()
{
  unint64_t result = qword_268BBAE08;
  if (!qword_268BBAE08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBAE08);
  }
  return result;
}

unint64_t sub_23C954350()
{
  unint64_t result = qword_268BBAE10;
  if (!qword_268BBAE10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBAE10);
  }
  return result;
}

unint64_t sub_23C9543A8()
{
  unint64_t result = qword_268BBAE18;
  if (!qword_268BBAE18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBAE18);
  }
  return result;
}

unint64_t sub_23C954400()
{
  unint64_t result = qword_268BBAE20;
  if (!qword_268BBAE20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBAE20);
  }
  return result;
}

unint64_t sub_23C954458()
{
  unint64_t result = qword_268BBAE28;
  if (!qword_268BBAE28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBAE28);
  }
  return result;
}

unint64_t sub_23C9544B0()
{
  unint64_t result = qword_268BBAE30;
  if (!qword_268BBAE30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBAE30);
  }
  return result;
}

uint64_t sub_23C954504(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_0(a1);
}

uint64_t sub_23C95452C(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBADF8);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_23C954278();
  sub_23C991660();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

ValueMetadata *type metadata accessor for AnimationDemoAttributes()
{
  return &type metadata for AnimationDemoAttributes;
}

ValueMetadata *type metadata accessor for AnimationDemoAttributes.ContentState()
{
  return &type metadata for AnimationDemoAttributes.ContentState;
}

ValueMetadata *type metadata accessor for AnimationDemoAttributes.CodingKeys()
{
  return &type metadata for AnimationDemoAttributes.CodingKeys;
}

uint64_t getEnumTagSinglePayload for AnimationDemoAttributes.ContentState.CodingKeys(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for AnimationDemoAttributes.ContentState.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x23C95475CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_23C954784()
{
  return 0;
}

ValueMetadata *type metadata accessor for AnimationDemoAttributes.ContentState.CodingKeys()
{
  return &type metadata for AnimationDemoAttributes.ContentState.CodingKeys;
}

unint64_t sub_23C9547A0()
{
  unint64_t result = qword_268BBAE38;
  if (!qword_268BBAE38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBAE38);
  }
  return result;
}

unint64_t sub_23C9547F8()
{
  unint64_t result = qword_268BBAE40;
  if (!qword_268BBAE40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBAE40);
  }
  return result;
}

unint64_t sub_23C954850()
{
  unint64_t result = qword_268BBAE48;
  if (!qword_268BBAE48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBAE48);
  }
  return result;
}

unint64_t sub_23C9548A8()
{
  unint64_t result = qword_268BBAE50;
  if (!qword_268BBAE50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBAE50);
  }
  return result;
}

unint64_t sub_23C954900()
{
  unint64_t result = qword_268BBAE58;
  if (!qword_268BBAE58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBAE58);
  }
  return result;
}

uint64_t sub_23C954954(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x65756C6176 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_23C9914F0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23C9549D4()
{
  return 0x65756C6176;
}

id sub_23C954A6C()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for CancellableAssertion()
{
  return self;
}

uint64_t sub_23C954AD8()
{
  swift_retain();
  sub_23C990E90();
  return swift_release();
}

id ActivityListItemHostViewController.__allocating_init(activityDescriptor:systemMetricsRequest:)(uint64_t a1, void *a2)
{
  uint64_t v5 = sub_23C990C60();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  int v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_allocWithZone(v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  id v9 = objc_allocWithZone((Class)type metadata accessor for ActivitySceneDescriptor());
  id v10 = sub_23C98368C(0, (uint64_t)v8, a2, 0, 0);
  id v11 = ActivityHostViewController.init(activitySceneDescriptor:)(v10);

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
  return v11;
}

id ActivityListItemHostViewController.init(activityDescriptor:systemMetricsRequest:)(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_23C990C60();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  id v8 = objc_allocWithZone((Class)type metadata accessor for ActivitySceneDescriptor());
  id v9 = sub_23C98368C(0, (uint64_t)v7, a2, 0, 0);
  id v10 = ActivityHostViewController.init(activitySceneDescriptor:)(v9);

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  return v10;
}

id sub_23C954EFC()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for ActivityListItemSceneSpecification());
  return objc_msgSend(v0, sel_init);
}

unint64_t sub_23C954F34()
{
  return 0xD000000000000014;
}

void ActivityListItemHostViewController.__allocating_init(activitySceneDescriptor:)()
{
}

void ActivityListItemHostViewController.init(activitySceneDescriptor:)()
{
}

id ActivityListItemHostViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityListItemHostViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ActivityListItemHostViewController()
{
  return self;
}

uint64_t method lookup function for ActivityListItemHostViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ActivityListItemHostViewController);
}

uint64_t dispatch thunk of ActivityListItemHostViewController.__allocating_init(activityDescriptor:systemMetricsRequest:)()
{
  return (*(uint64_t (**)(void))(v0 + 1496))();
}

unint64_t sub_23C9550C8()
{
  unint64_t result = qword_26AF226B8;
  if (!qword_26AF226B8)
  {
    sub_23C990C60();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF226B8);
  }
  return result;
}

unint64_t static ActivityAlertClientError.errorDomain.getter()
{
  return 0xD00000000000001CLL;
}

uint64_t ActivityAlertClientError.errorCode.getter(uint64_t a1)
{
  if (!a1) {
    return 1001;
  }
  uint64_t result = sub_23C991500();
  __break(1u);
  return result;
}

uint64_t ActivityAlertClientError.errorDescription.getter(uint64_t a1)
{
  if (!a1) {
    return 0xD000000000000012;
  }
  uint64_t result = sub_23C991500();
  __break(1u);
  return result;
}

uint64_t ActivityAlertClientError.init(rawValue:)()
{
  return 0;
}

unint64_t static ActivityAlertClientError._nsErrorDomain.getter()
{
  return 0xD00000000000002BLL;
}

uint64_t sub_23C955200()
{
  return sub_23C991620();
}

uint64_t sub_23C955264(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_23C9563D8();
  return MEMORY[0x270EEEA70](a1, a2, v4);
}

uint64_t sub_23C9552B0()
{
  return sub_23C991620();
}

void *sub_23C955310@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2 = *result != 0;
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = v2;
  return result;
}

unint64_t sub_23C955328()
{
  return 0xD00000000000001CLL;
}

uint64_t sub_23C955344()
{
  if (!*v0) {
    return 1001;
  }
  uint64_t result = sub_23C991500();
  __break(1u);
  return result;
}

uint64_t sub_23C95538C()
{
  if (!*v0) {
    return 0xD000000000000012;
  }
  uint64_t result = sub_23C991500();
  __break(1u);
  return result;
}

uint64_t sub_23C9553F0(uint64_t a1)
{
  unint64_t v2 = sub_23C9563D8();
  return MEMORY[0x270EEEA80](a1, v2);
}

uint64_t sub_23C95542C(uint64_t a1)
{
  unint64_t v2 = sub_23C9563D8();
  return MEMORY[0x270EEEA78](a1, v2);
}

unint64_t sub_23C955470()
{
  return 0xD00000000000002BLL;
}

uint64_t sub_23C95548C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_23C9563D8();
  return MEMORY[0x270EEEA68](a1, a2, v4);
}

uint64_t sub_23C95553C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18ActivityUIServices19ActivityAlertClient_delegate;
  swift_beginAccess();
  return MEMORY[0x23ECEAE20](v1);
}

uint64_t sub_23C9555DC()
{
  return swift_unknownObjectRelease();
}

void (*sub_23C955638(void *a1))(void **a1, char a2)
{
  char v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC18ActivityUIServices19ActivityAlertClient_delegate;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x23ECEAE20](v5);
  return sub_23C9556BC;
}

void sub_23C9556BC(void **a1, char a2)
{
  char v3 = *a1;
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

id ActivityAlertClient.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

char *ActivityAlertClient.init()()
{
  swift_unknownObjectWeakInit();
  sub_23C990CE0();
  id v1 = v0;
  *(void *)&v1[OBJC_IVAR____TtC18ActivityUIServices19ActivityAlertClient_alertClient] = sub_23C990CD0();

  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for ActivityAlertClient();
  unint64_t v2 = (char *)objc_msgSendSuper2(&v7, sel_init);
  char v3 = *(void **)&v2[OBJC_IVAR____TtC18ActivityUIServices19ActivityAlertClient_alertClient];
  sub_23C95585C();
  uint64_t v4 = v2;
  id v5 = v3;
  sub_23C990CC0();

  return v4;
}

uint64_t type metadata accessor for ActivityAlertClient()
{
  return self;
}

unint64_t sub_23C95585C()
{
  unint64_t result = qword_26AF226C0;
  if (!qword_26AF226C0)
  {
    type metadata accessor for ActivityAlertClient();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF226C0);
  }
  return result;
}

id ActivityAlertClient.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityAlertClient();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void ActivityAlertClient.presentAlert(activityIdentifier:payload:options:completion:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v37 = a6;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBAE78);
  MEMORY[0x270FA5388](v13 - 8);
  long long v15 = (char *)v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268BBAA58 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_23C990E40();
  __swift_project_value_buffer(v16, (uint64_t)qword_268BBB3A0);
  swift_bridgeObjectRetain_n();
  uint64_t v17 = sub_23C990E20();
  os_log_type_t v18 = sub_23C991140();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v35 = v7;
    uint64_t v19 = swift_slowAlloc();
    v34[1] = a4;
    objc_super v20 = (uint8_t *)v19;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v36 = a5;
    uint64_t v22 = v21;
    aBlock[0] = v21;
    *(_DWORD *)objc_super v20 = 136315138;
    swift_bridgeObjectRetain();
    aBlock[6] = sub_23C9733B0(a1, a2, aBlock);
    uint64_t v7 = v35;
    sub_23C991240();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23C948000, v17, v18, "[Activity: %s] Presenting alert", v20, 0xCu);
    swift_arrayDestroy();
    uint64_t v23 = v22;
    a5 = v36;
    MEMORY[0x23ECEADB0](v23, -1, -1);
    MEMORY[0x23ECEADB0](v20, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain();
  v24 = (void *)sub_23C990DC0();
  uint64_t v25 = sub_23C990D50();
  uint64_t v26 = *(void *)(v25 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v15, a3, v25);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v15, 0, 1, v25);
  id v27 = objc_allocWithZone((Class)type metadata accessor for ActivityAlertProvider());
  id v28 = sub_23C95A1B4(a1, a2, 0, v24, (uint64_t)v15);

  uint64_t v29 = v7 + OBJC_IVAR____TtC18ActivityUIServices19ActivityAlertClient_delegate;
  swift_beginAccess();
  uint64_t v30 = MEMORY[0x23ECEAE20](v29);
  if (v30)
  {
    v31 = (void *)v30;
    aBlock[4] = a5;
    aBlock[5] = v37;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_23C968FA8;
    aBlock[3] = (uint64_t)&block_descriptor;
    v32 = _Block_copy(aBlock);
    id v33 = v28;
    swift_retain();
    swift_release();
    objc_msgSend(v31, sel_activityWithAlertClient_presentAlertProvider_completion_, v7, v33, v32);
    swift_unknownObjectRelease();

    _Block_release(v32);
  }
}

Swift::Void __swiftcall ActivityAlertClient.dismissAlert(activityIdentifier:)(Swift::String activityIdentifier)
{
  uint64_t v2 = v1;
  object = activityIdentifier._object;
  uint64_t countAndFlagsBits = activityIdentifier._countAndFlagsBits;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBAE78);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v19[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268BBAA58 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_23C990E40();
  __swift_project_value_buffer(v8, (uint64_t)qword_268BBB3A0);
  swift_bridgeObjectRetain_n();
  id v9 = sub_23C990E20();
  os_log_type_t v10 = sub_23C991140();
  if (os_log_type_enabled(v9, v10))
  {
    id v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    v19[0] = v12;
    *(_DWORD *)id v11 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_23C9733B0(countAndFlagsBits, (unint64_t)object, v19);
    sub_23C991240();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23C948000, v9, v10, "[Activity: %s] Dismissing alert", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEADB0](v12, -1, -1);
    MEMORY[0x23ECEADB0](v11, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v13 = sub_23C990D50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v7, 1, 1, v13);
  id v14 = objc_allocWithZone((Class)type metadata accessor for ActivityAlertProvider());
  swift_bridgeObjectRetain();
  id v15 = sub_23C95A1B4(countAndFlagsBits, (uint64_t)object, (char *)1, 0, (uint64_t)v7);
  uint64_t v16 = v2 + OBJC_IVAR____TtC18ActivityUIServices19ActivityAlertClient_delegate;
  swift_beginAccess();
  uint64_t v17 = (void *)MEMORY[0x23ECEAE20](v16);
  if (v17)
  {
    objc_msgSend(v17, sel_activityWithAlertClient_dismissAlertProvider_, v2, v15);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
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

unint64_t sub_23C956030()
{
  unint64_t result = qword_268BBAE80;
  if (!qword_268BBAE80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBAE80);
  }
  return result;
}

unint64_t sub_23C956088()
{
  unint64_t result = qword_268BBAE88;
  if (!qword_268BBAE88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBAE88);
  }
  return result;
}

unint64_t sub_23C9560E0()
{
  unint64_t result = qword_268BBAE90;
  if (!qword_268BBAE90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBAE90);
  }
  return result;
}

unint64_t sub_23C956138()
{
  unint64_t result = qword_268BBAE98;
  if (!qword_268BBAE98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBAE98);
  }
  return result;
}

unint64_t sub_23C956190()
{
  unint64_t result = qword_268BBAEA0;
  if (!qword_268BBAEA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBAEA0);
  }
  return result;
}

unint64_t sub_23C9561E8()
{
  unint64_t result = qword_268BBAEA8;
  if (!qword_268BBAEA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBAEA8);
  }
  return result;
}

uint64_t sub_23C95623C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC18ActivityUIServices19ActivityAlertClient_delegate;
  swift_beginAccess();
  uint64_t result = MEMORY[0x23ECEAE20](v3);
  *a2 = result;
  return result;
}

uint64_t sub_23C956294()
{
  return swift_unknownObjectWeakAssign();
}

ValueMetadata *type metadata accessor for ActivityAlertClientError()
{
  return &type metadata for ActivityAlertClientError;
}

uint64_t method lookup function for ActivityAlertClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ActivityAlertClient);
}

uint64_t dispatch thunk of ActivityAlertClient.delegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of ActivityAlertClient.delegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of ActivityAlertClient.delegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t sub_23C9563B0(uint64_t a1)
{
  return a1;
}

unint64_t sub_23C9563D8()
{
  unint64_t result = qword_268BBAEB0;
  if (!qword_268BBAEB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBAEB0);
  }
  return result;
}

id ActivityAmbientCompactHostViewController.__allocating_init(activityDescriptor:systemMetricsRequest:payloadID:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = sub_23C990C60();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_allocWithZone(v4);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
  id v13 = objc_allocWithZone((Class)type metadata accessor for ActivitySceneDescriptor());
  id v14 = sub_23C98368C(3, (uint64_t)v12, a2, a3, a4);
  id v15 = ActivityHostViewController.init(activitySceneDescriptor:)(v14);

  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
  return v15;
}

id ActivityAmbientCompactHostViewController.init(activityDescriptor:systemMetricsRequest:payloadID:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_23C990C60();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  id v12 = objc_allocWithZone((Class)type metadata accessor for ActivitySceneDescriptor());
  id v13 = sub_23C98368C(3, (uint64_t)v11, a2, a3, a4);
  id v14 = ActivityHostViewController.init(activitySceneDescriptor:)(v13);

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
  return v14;
}

id sub_23C956850()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for ActivityAmbientCompactSceneSpecification());
  return objc_msgSend(v0, sel_init);
}

unint64_t sub_23C956888()
{
  return 0xD000000000000018;
}

void ActivityAmbientCompactHostViewController.__allocating_init(activitySceneDescriptor:)()
{
}

void ActivityAmbientCompactHostViewController.init(activitySceneDescriptor:)()
{
}

id ActivityAmbientCompactHostViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityAmbientCompactHostViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ActivityAmbientCompactHostViewController()
{
  return self;
}

uint64_t method lookup function for ActivityAmbientCompactHostViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ActivityAmbientCompactHostViewController);
}

uint64_t dispatch thunk of ActivityAmbientCompactHostViewController.__allocating_init(activityDescriptor:systemMetricsRequest:payloadID:)()
{
  return (*(uint64_t (**)(void))(v0 + 1496))();
}

void *initializeBufferWithCopyOfBuffer for ProcessResource(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ProcessResource()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for ProcessResource(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for ProcessResource(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ProcessResource(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ProcessResource(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for ProcessResource()
{
  return &type metadata for ProcessResource;
}

id sub_23C956B60(uint64_t a1, unint64_t a2)
{
  if ((a1 != 0xD000000000000011 || a2 != 0x800000023C997380) && (sub_23C9914F0() & 1) == 0)
  {
    id v10 = objc_allocWithZone(MEMORY[0x263F01878]);
    swift_bridgeObjectRetain();
    id v11 = sub_23C958F5C(a1, a2, 0);
    if (v11)
    {
      id v12 = v11;
      id v13 = objc_msgSend(v12, sel_identities);
      sub_23C959038(0, &qword_26AF227D8);
      unint64_t v14 = sub_23C991070();

      if (v14 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v23 = sub_23C9913E0();
        swift_bridgeObjectRelease();
        if (v23 == 1)
        {
          swift_bridgeObjectRetain();
          uint64_t v24 = sub_23C9913E0();
          swift_bridgeObjectRelease();
          if (v24) {
            goto LABEL_12;
          }
          swift_bridgeObjectRelease();
          if (qword_268BBA4C0 != -1) {
            swift_once();
          }
          uint64_t v25 = sub_23C990E40();
          __swift_project_value_buffer(v25, (uint64_t)qword_268BBA580);
          swift_bridgeObjectRetain_n();
          unint64_t v14 = sub_23C990E20();
          os_log_type_t v26 = sub_23C991130();
          if (!os_log_type_enabled((os_log_t)v14, v26))
          {
LABEL_39:

            swift_bridgeObjectRelease_n();
            goto LABEL_34;
          }
          id v27 = (uint8_t *)swift_slowAlloc();
          id v28 = (void *)swift_slowAlloc();
          v31[0] = v28;
          *(_DWORD *)id v27 = 136380675;
          swift_bridgeObjectRetain();
          sub_23C9733B0(a1, a2, (uint64_t *)v31);
          sub_23C991240();
          swift_bridgeObjectRelease_n();
          uint64_t v29 = "No lsIdentity found for bundle identifier: %{private}s";
LABEL_33:
          _os_log_impl(&dword_23C948000, (os_log_t)v14, v26, v29, v27, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x23ECEADB0](v28, -1, -1);
          MEMORY[0x23ECEADB0](v27, -1, -1);

LABEL_34:
          return 0;
        }
      }
      else if (*(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10) == 1)
      {
LABEL_12:
        if ((v14 & 0xC000000000000001) != 0)
        {
          id v15 = (objc_class *)MEMORY[0x23ECEA1A0](0, v14);
          goto LABEL_15;
        }
        if (*(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          id v15 = (objc_class *)*(id *)(v14 + 32);
LABEL_15:
          uint64_t v16 = v15;
          swift_bridgeObjectRelease();
          id v9 = objc_msgSend(self, sel_identityForLSApplicationIdentity_LSApplicationRecord_, v16, v12);

          return v9;
        }
        __break(1u);
        goto LABEL_39;
      }
      swift_bridgeObjectRelease();
      if (qword_268BBA4C0 != -1) {
        swift_once();
      }
      uint64_t v30 = sub_23C990E40();
      __swift_project_value_buffer(v30, (uint64_t)qword_268BBA580);
      swift_bridgeObjectRetain_n();
      unint64_t v14 = sub_23C990E20();
      os_log_type_t v26 = sub_23C991130();
      if (os_log_type_enabled((os_log_t)v14, v26))
      {
        id v27 = (uint8_t *)swift_slowAlloc();
        id v28 = (void *)swift_slowAlloc();
        v31[0] = v28;
        *(_DWORD *)id v27 = 136380675;
        swift_bridgeObjectRetain();
        sub_23C9733B0(a1, a2, (uint64_t *)v31);
        sub_23C991240();
        swift_bridgeObjectRelease_n();
        uint64_t v29 = "Multiple identities found with bundle identifier: %{private}s";
        goto LABEL_33;
      }
    }
    else
    {
      if (qword_268BBA4C0 != -1) {
        swift_once();
      }
      uint64_t v18 = sub_23C990E40();
      __swift_project_value_buffer(v18, (uint64_t)qword_268BBA580);
      swift_bridgeObjectRetain_n();
      uint64_t v19 = sub_23C990E20();
      os_log_type_t v20 = sub_23C991130();
      if (os_log_type_enabled(v19, v20))
      {
        uint64_t v21 = (uint8_t *)swift_slowAlloc();
        uint64_t v22 = (void *)swift_slowAlloc();
        v31[0] = v22;
        *(_DWORD *)uint64_t v21 = 136380675;
        swift_bridgeObjectRetain();
        sub_23C9733B0(a1, a2, (uint64_t *)v31);
        sub_23C991240();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_23C948000, v19, v20, "No application record created with bundle identifier: %{private}s", v21, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23ECEADB0](v22, -1, -1);
        MEMORY[0x23ECEADB0](v21, -1, -1);

        return 0;
      }
    }
    swift_bridgeObjectRelease_n();
    return 0;
  }
  if (qword_268BBA4C0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_23C990E40();
  __swift_project_value_buffer(v4, (uint64_t)qword_268BBA580);
  uint64_t v5 = sub_23C990E20();
  os_log_type_t v6 = sub_23C991140();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_23C948000, v5, v6, "Creating a process identity for chrono", v7, 2u);
    MEMORY[0x23ECEADB0](v7, -1, -1);
  }

  swift_bridgeObjectRetain();
  uint64_t v8 = (void *)sub_23C990FC0();
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(self, sel_identityForDaemonJobLabel_, v8);

  return v9;
}

uint64_t sub_23C95750C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v172 = a2;
  uint64_t v178 = a1;
  uint64_t v169 = a5;
  uint64_t v168 = sub_23C990B70();
  uint64_t v153 = *(void *)(v168 - 8);
  MEMORY[0x270FA5388](v168);
  v152 = (char *)&v145 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v170 = sub_23C990BD0();
  uint64_t v181 = *(void *)(v170 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v170);
  v154 = (char *)&v145 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v166 = (char *)&v145 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  v176 = (char *)&v145 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v165 = (char *)&v145 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v164 = (char *)&v145 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  v175 = (void (*)(char *, uint64_t, uint64_t))((char *)&v145 - v19);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  v174 = (char *)&v145 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  v151 = (char *)&v145 - v23;
  MEMORY[0x270FA5388](v22);
  v163 = (char *)&v145 - v24;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBAEB8);
  uint64_t v26 = MEMORY[0x270FA5388](v25 - 8);
  v155 = (char *)&v145 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v158 = (uint64_t)&v145 - v29;
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  uint64_t v177 = (uint64_t)&v145 - v31;
  uint64_t v32 = MEMORY[0x270FA5388](v30);
  uint64_t v183 = (uint64_t)&v145 - v33;
  uint64_t v34 = MEMORY[0x270FA5388](v32);
  uint64_t v36 = (char *)&v145 - v35;
  uint64_t v37 = MEMORY[0x270FA5388](v34);
  v39 = (char *)&v145 - v38;
  uint64_t v40 = MEMORY[0x270FA5388](v37);
  v42 = (char *)&v145 - v41;
  uint64_t v43 = MEMORY[0x270FA5388](v40);
  v45 = (char *)&v145 - v44;
  uint64_t v46 = MEMORY[0x270FA5388](v43);
  v48 = (void (*)(char *, uint64_t, uint64_t))((char *)&v145 - v47);
  uint64_t v49 = MEMORY[0x270FA5388](v46);
  v51 = (void (**)(char *, uint64_t))((char *)&v145 - v50);
  MEMORY[0x270FA5388](v49);
  v53 = (char *)&v145 - v52;
  id v54 = objc_allocWithZone(MEMORY[0x263F01878]);
  swift_bridgeObjectRetain();
  uint64_t v179 = a3;
  uint64_t v182 = a4;
  id v55 = sub_23C958F5C(a3, a4, 0);
  v160 = v48;
  v161 = v51;
  v162 = (void (*)(char *, uint64_t, uint64_t))v42;
  v171 = v39;
  v167 = v36;
  v156 = v53;
  v146 = v45;
  if (!v55)
  {
    uint64_t v67 = v170;
    unint64_t v68 = v182;
    if (qword_268BBA4C0 != -1) {
      swift_once();
    }
    uint64_t v69 = sub_23C990E40();
    __swift_project_value_buffer(v69, (uint64_t)qword_268BBA580);
    swift_bridgeObjectRetain_n();
    v70 = sub_23C990E20();
    os_log_type_t v71 = sub_23C991130();
    if (os_log_type_enabled(v70, v71))
    {
      v72 = (uint8_t *)swift_slowAlloc();
      uint64_t v73 = swift_slowAlloc();
      v186[0] = v73;
      *(_DWORD *)v72 = 136380675;
      swift_bridgeObjectRetain();
      uint64_t v184 = sub_23C9733B0(v179, v68, v186);
      sub_23C991240();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23C948000, v70, v71, "No application record created with bundle identifier: %{private}s", v72, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23ECEADB0](v73, -1, -1);
      MEMORY[0x23ECEADB0](v72, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v181 + 56))(v169, 1, 1, v67);
  }
  uint64_t v56 = v181 + 56;
  uint64_t v57 = 1;
  uint64_t v58 = v170;
  v173 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v181 + 56);
  v173(v156, 1, 1, v170);
  id v147 = v55;
  id v59 = objc_msgSend(v147, sel_dataContainerURL);
  if (v59)
  {
    v60 = v59;
    uint64_t v61 = (uint64_t)v160;
    sub_23C990BA0();

    uint64_t v57 = 0;
    v62 = v171;
    v63 = v163;
    v64 = v162;
    uint64_t v65 = (uint64_t)v161;
  }
  else
  {
    v62 = v171;
    v63 = v163;
    v64 = v162;
    uint64_t v65 = (uint64_t)v161;
    uint64_t v61 = (uint64_t)v160;
  }
  v74 = v173;
  v173((char *)v61, v57, 1, v58);
  sub_23C958C14(v178, v172, v61, v65);
  sub_23C959074(v61);
  uint64_t v75 = v181;
  uint64_t v77 = v181 + 48;
  v76 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v181 + 48);
  unsigned int v78 = v76(v65, 1, v58);
  v157 = v76;
  if (v78 == 1)
  {
    sub_23C959074(v65);
    uint64_t v79 = v168;
    uint64_t v80 = (uint64_t)v156;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v75 + 32))(v63, v65, v58);
    uint64_t v81 = (uint64_t)v146;
    sub_23C990B60();
    v76 = v157;
    (*(void (**)(char *, uint64_t))(v75 + 8))(v63, v58);
    v74((char *)v81, 0, 1, v58);
    uint64_t v80 = (uint64_t)v156;
    sub_23C959308(v81, (uint64_t)v156);
    uint64_t v79 = v168;
  }
  sub_23C9590D4(v80, (uint64_t)v64);
  unsigned int v82 = v76((uint64_t)v64, 1, v58);
  sub_23C959074((uint64_t)v64);
  if (v82 == 1)
  {
    id v83 = objc_msgSend(v147, sel_groupContainerURLs);
    uint64_t v84 = sub_23C990F80();

    uint64_t v85 = *(void *)(v84 + 64);
    uint64_t v149 = v84 + 64;
    uint64_t v86 = 1 << *(unsigned char *)(v84 + 32);
    uint64_t v87 = -1;
    if (v86 < 64) {
      uint64_t v87 = ~(-1 << v86);
    }
    uint64_t v182 = v87 & v85;
    int64_t v150 = (unint64_t)(v86 + 63) >> 6;
    v162 = (void (*)(char *, uint64_t, uint64_t))(v75 + 16);
    v88 = (void (**)(uint64_t, char *, uint64_t))(v75 + 32);
    v161 = (void (**)(char *, uint64_t))(v75 + 8);
    v163 = (char *)v84;
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v89 = 0;
    v159 = (void (**)(uint64_t, char *, uint64_t))(v75 + 32);
    uint64_t v148 = v77;
    uint64_t v180 = v56;
    v90 = v173;
    unint64_t v91 = v182;
    if (!v182) {
      goto LABEL_18;
    }
LABEL_17:
    uint64_t v182 = (v91 - 1) & v91;
    uint64_t v179 = v89;
    unint64_t v92 = __clz(__rbit64(v91)) | (v89 << 6);
    while (1)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v75 + 16))(v62, *((void *)v163 + 7) + *(void *)(v75 + 72) * v92, v58);
      v90(v62, 0, 1, v58);
      if (v76((uint64_t)v62, 1, v58) == 1)
      {
        swift_release();
        swift_bridgeObjectRelease();
        uint64_t v79 = v168;
LABEL_51:
        uint64_t v80 = (uint64_t)v156;
        break;
      }
      v64 = (void (*)(char *, uint64_t, uint64_t))*v88;
      v97 = v62;
      uint64_t v98 = v183;
      (*v88)(v183, v97, v58);
      v90((char *)v98, 0, 1, v58);
      uint64_t v99 = v177;
      sub_23C9590D4(v98, v177);
      unsigned int v100 = v76(v99, 1, v58);
      v160 = v64;
      if (v100 == 1)
      {
        sub_23C959074(v99);
        uint64_t v101 = 1;
        v62 = v171;
        goto LABEL_42;
      }
      v64(v174, v99, v58);
      v102 = v164;
      sub_23C990B60();
      v103 = v165;
      sub_23C990B90();
      v64 = v175;
      sub_23C990B90();
      v104 = *v161;
      (*v161)(v103, v58);
      v104(v102, v58);
      sub_23C990B90();
      v105 = v166;
      sub_23C990B60();
      sub_23C990BB0();
      v104(v105, v58);
      sub_23C990B60();
      sub_23C990BB0();
      v104(v105, v58);
      char v106 = sub_23C991020();
      swift_bridgeObjectRelease();
      if ((v106 & 1) != 0
        && (v107 = (void *)sub_23C990FC0(), char v108 = BSIsSymbolicLinkAtPath(), v107, (v108 & 1) == 0))
      {
        id v110 = objc_msgSend(self, sel_defaultManager);
        v111 = (void *)sub_23C990FC0();
        swift_bridgeObjectRelease();
        unsigned __int8 v112 = objc_msgSend(v110, sel_fileExistsAtPath_, v111);

        v62 = v171;
        if (v112)
        {
          v113 = v176;
          sub_23C990B60();
          v104(v113, v58);
          v104((char *)v175, v58);
          v104(v174, v58);
          uint64_t v101 = 0;
          goto LABEL_41;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
        v62 = v171;
      }
      v104(v176, v58);
      v104((char *)v175, v58);
      v104(v174, v58);
      uint64_t v101 = 1;
LABEL_41:
      uint64_t v75 = v181;
      uint64_t v77 = v148;
      v76 = v157;
      v88 = v159;
LABEL_42:
      uint64_t v109 = (uint64_t)v167;
      v90(v167, v101, 1, v58);
      sub_23C959074(v183);
      if (v76(v109, 1, v58) != 1)
      {
        uint64_t v114 = v109;
        v115 = v151;
        v160(v151, v114, v58);
        uint64_t v116 = (uint64_t)v146;
        sub_23C990B60();
        v76 = v157;
        swift_bridgeObjectRelease();
        (*v161)(v115, v58);
        swift_release();
        uint64_t v56 = v180;
        v173((char *)v116, 0, 1, v58);
        uint64_t v80 = (uint64_t)v156;
        sub_23C959308(v116, (uint64_t)v156);
        uint64_t v79 = v168;
        break;
      }
      uint64_t result = sub_23C959074(v109);
      uint64_t v89 = v179;
      uint64_t v56 = v180;
      unint64_t v91 = v182;
      if (v182) {
        goto LABEL_17;
      }
LABEL_18:
      int64_t v93 = v89 + 1;
      if (__OFADD__(v89, 1))
      {
        __break(1u);
        goto LABEL_70;
      }
      uint64_t v79 = v168;
      if (v93 >= v150) {
        goto LABEL_50;
      }
      unint64_t v94 = *(void *)(v149 + 8 * v93);
      uint64_t v95 = v89 + 1;
      if (!v94)
      {
        uint64_t v95 = v89 + 2;
        if (v89 + 2 >= v150) {
          goto LABEL_50;
        }
        unint64_t v94 = *(void *)(v149 + 8 * v95);
        if (!v94)
        {
          uint64_t v95 = v89 + 3;
          if (v89 + 3 >= v150) {
            goto LABEL_50;
          }
          unint64_t v94 = *(void *)(v149 + 8 * v95);
          if (!v94)
          {
            uint64_t v95 = v89 + 4;
            if (v89 + 4 >= v150) {
              goto LABEL_50;
            }
            unint64_t v94 = *(void *)(v149 + 8 * v95);
            if (!v94)
            {
              uint64_t v96 = v89 + 5;
              if (v89 + 5 >= v150)
              {
LABEL_50:
                v173(v62, 1, 1, v58);
                swift_release();
                swift_bridgeObjectRelease();
                goto LABEL_51;
              }
              unint64_t v94 = *(void *)(v149 + 8 * v96);
              if (!v94)
              {
                while (1)
                {
                  uint64_t v95 = v96 + 1;
                  if (__OFADD__(v96, 1)) {
                    break;
                  }
                  if (v95 >= v150) {
                    goto LABEL_50;
                  }
                  unint64_t v94 = *(void *)(v149 + 8 * v95);
                  ++v96;
                  if (v94) {
                    goto LABEL_33;
                  }
                }
                __break(1u);
                return result;
              }
              uint64_t v95 = v89 + 5;
            }
          }
        }
      }
LABEL_33:
      uint64_t v182 = (v94 - 1) & v94;
      uint64_t v179 = v95;
      unint64_t v92 = __clz(__rbit64(v94)) + (v95 << 6);
      v88 = v159;
    }
  }
  v64 = (void (*)(char *, uint64_t, uint64_t))v80;
  uint64_t v117 = v80;
  uint64_t v118 = v158;
  sub_23C9590D4(v117, v158);
  unsigned int v119 = v76(v118, 1, v58);
  sub_23C959074(v118);
  if (v119 == 1)
  {
    id v120 = objc_msgSend(v147, sel_URL);
    v121 = v155;
    sub_23C990BA0();

    v173(v121, 0, 1, v58);
    if (v76((uint64_t)v121, 1, v58) == 1)
    {
      v122 = 0;
    }
    else
    {
      v122 = (void *)sub_23C990B80();
      (*(void (**)(char *, uint64_t))(v75 + 8))(v121, v58);
    }
    id v123 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29C00]), sel_initWithURL_, v122);

    if (v123)
    {
      v124 = (void *)sub_23C990FC0();
      id v125 = objc_msgSend(v123, sel_pathForResource_ofType_, v124, 0);

      if (v125)
      {
        uint64_t v148 = v77;
        sub_23C990FD0();

        uint64_t v126 = (uint64_t)v146;
        uint64_t v180 = v56;
        v173(v146, 1, 1, v58);
        (*(void (**)(char *, void, uint64_t))(v153 + 104))(v152, *MEMORY[0x263F06E50], v79);
        v127 = v154;
        sub_23C990BC0();
        id v128 = objc_msgSend(v147, sel_URL);
        v129 = v166;
        sub_23C990BA0();

        LOBYTE(v128) = sub_23C95913C();
        v130 = *(void (**)(char *, uint64_t))(v75 + 8);
        v130(v129, v58);
        if (v128)
        {
          sub_23C990B60();

          v130(v127, v58);
          v173((char *)v126, 0, 1, v58);
          sub_23C959308(v126, (uint64_t)v64);
        }
        else
        {
          v130(v127, v58);
        }
      }
      else
      {
      }
    }
  }
  if (qword_268BBA4C0 != -1) {
LABEL_70:
  }
    swift_once();
  uint64_t v131 = sub_23C990E40();
  __swift_project_value_buffer(v131, (uint64_t)qword_268BBA580);
  v132 = sub_23C990E20();
  os_log_type_t v133 = sub_23C991130();
  if (os_log_type_enabled(v132, v133))
  {
    v134 = (uint8_t *)swift_slowAlloc();
    uint64_t v135 = swift_slowAlloc();
    uint64_t v185 = v135;
    *(_DWORD *)v134 = 136380675;
    swift_beginAccess();
    uint64_t v136 = 0;
    uint64_t v137 = 0;
    if (!v157((uint64_t)v64, 1, v58))
    {
      uint64_t v138 = v181;
      v139 = v166;
      (*(void (**)(char *, char *, uint64_t))(v181 + 16))(v166, v156, v58);
      uint64_t v136 = sub_23C990BB0();
      uint64_t v137 = v140;
      (*(void (**)(char *, uint64_t))(v138 + 8))(v139, v58);
    }
    v186[0] = v136;
    v186[1] = v137;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BBAEC0);
    uint64_t v141 = sub_23C990FE0();
    v186[0] = sub_23C9733B0(v141, v142, &v185);
    sub_23C991240();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C948000, v132, v133, "External sound url: %{private}s", v134, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEADB0](v135, -1, -1);
    MEMORY[0x23ECEADB0](v134, -1, -1);

    id v143 = v147;
    v64 = (void (*)(char *, uint64_t, uint64_t))v156;
  }
  else
  {

    id v144 = v147;
  }
  swift_beginAccess();
  sub_23C9590D4((uint64_t)v64, v169);
  return sub_23C959074((uint64_t)v64);
}

uint64_t sub_23C958C14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v31 = a1;
  uint64_t v32 = a2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBAEB8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_23C990BD0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v29 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = (char *)&v29 - v18;
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  uint64_t v22 = (char *)&v29 - v21;
  MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v29 - v23;
  sub_23C9590D4(a3, (uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_23C959074((uint64_t)v8);
    uint64_t v25 = 1;
  }
  else
  {
    uint64_t v30 = a4;
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v24, v8, v9);
    sub_23C990B60();
    sub_23C990B90();
    sub_23C990B90();
    uint64_t v26 = *(void (**)(char *, uint64_t))(v10 + 8);
    v26(v16, v9);
    v26(v19, v9);
    sub_23C990B90();
    if (sub_23C95913C())
    {
      uint64_t v27 = v30;
      sub_23C990B60();
      v26(v13, v9);
      v26(v22, v9);
      v26(v24, v9);
      a4 = v27;
      uint64_t v25 = 0;
    }
    else
    {
      v26(v13, v9);
      v26(v22, v9);
      v26(v24, v9);
      uint64_t v25 = 1;
      a4 = v30;
    }
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(a4, v25, 1, v9);
}

id sub_23C958F5C(uint64_t a1, uint64_t a2, char a3)
{
  v10[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v5 = (void *)sub_23C990FC0();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  id v6 = objc_msgSend(v3, sel_initWithBundleIdentifier_allowPlaceholder_error_, v5, a3 & 1, v10);

  if (v6)
  {
    id v7 = v10[0];
  }
  else
  {
    id v8 = v10[0];
    sub_23C990B30();

    swift_willThrow();
  }
  return v6;
}

uint64_t sub_23C959038(uint64_t a1, unint64_t *a2)
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

uint64_t sub_23C959074(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBAEB8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23C9590D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBAEB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id sub_23C95913C()
{
  uint64_t v0 = sub_23C990BD0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C990B60();
  sub_23C990BB0();
  uint64_t v4 = *(void (**)(char *, uint64_t))(v1 + 8);
  v4(v3, v0);
  sub_23C990B60();
  sub_23C990BB0();
  v4(v3, v0);
  char v5 = sub_23C991020();
  swift_bridgeObjectRelease();
  if ((v5 & 1) != 0 && (id v6 = (void *)sub_23C990FC0(), v7 = BSIsSymbolicLinkAtPath(), v6, !v7))
  {
    id v9 = objc_msgSend(self, sel_defaultManager);
    uint64_t v10 = (void *)sub_23C990FC0();
    swift_bridgeObjectRelease();
    id v8 = objc_msgSend(v9, sel_fileExistsAtPath_, v10);
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v8;
}

uint64_t sub_23C959308(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBAEB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

id ActivityAlertProvider.__allocating_init(identifier:action:presentationOptions:payload:)(uint64_t a1, uint64_t a2, char *a3, void *a4, uint64_t a5)
{
  id v11 = objc_allocWithZone(v5);
  id v12 = sub_23C95A1B4(a1, a2, a3, a4, a5);

  return v12;
}

uint64_t sub_23C9593F4()
{
  return *(void *)(v0 + OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_alertAction);
}

uint64_t sub_23C959464()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_activityIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_23C9594B8()
{
  return sub_23C959A74(MEMORY[0x263EFB590]);
}

uint64_t sub_23C9594E8()
{
  uint64_t v1 = sub_23C990C10();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_23C990D50();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBAE78);
  MEMORY[0x270FA5388](v9 - 8);
  id v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = v0 + OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_payload;
  swift_beginAccess();
  sub_23C95A840(v12, (uint64_t)v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v11, 1, v5))
  {
    sub_23C95AEBC((uint64_t)v11, &qword_268BBAE78);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, v11, v5);
    sub_23C95AEBC((uint64_t)v11, &qword_268BBAE78);
    sub_23C990D30();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v13 = sub_23C990C00();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  return v13;
}

void *sub_23C959758()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_configuration);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_23C9597B4(void *a1)
{
}

uint64_t (*sub_23C9597C0())()
{
  return j__swift_endAccess;
}

id sub_23C95982C(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (id *)(a1 + *a3);
  swift_beginAccess();
  return *v3;
}

void *sub_23C959874()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_presentationOptions);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_23C9598D0(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v5 = (void **)(a1 + *a4);
  swift_beginAccess();
  uint64_t v6 = *v5;
  *uint64_t v5 = a3;
  id v7 = a3;
}

void sub_23C95992C(void *a1)
{
}

void sub_23C959938(void *a1, void *a2)
{
  uint64_t v4 = (void **)(v2 + *a2);
  swift_beginAccess();
  uint64_t v5 = *v4;
  *uint64_t v4 = a1;
}

void sub_23C959988(void **a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = *a1;
  uint64_t v6 = (void **)(*a2 + *a5);
  swift_beginAccess();
  id v7 = *v6;
  *uint64_t v6 = v5;
  id v8 = v5;
}

uint64_t (*sub_23C9599E8())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_23C959A5C()
{
  return sub_23C959A74(MEMORY[0x263EFB5A0]);
}

uint64_t sub_23C959A74(uint64_t (*a1)(uint64_t))
{
  uint64_t v3 = sub_23C990D50();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBAE78);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = v1 + OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_payload;
  swift_beginAccess();
  sub_23C95A840(v10, (uint64_t)v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v9, 1, v3))
  {
    sub_23C95AEBC((uint64_t)v9, &qword_268BBAE78);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v9, v3);
    uint64_t v12 = sub_23C95AEBC((uint64_t)v9, &qword_268BBAE78);
    uint64_t v11 = a1(v12);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  return v11;
}

uint64_t sub_23C959C54()
{
  return sub_23C959A74(MEMORY[0x263EFB598]);
}

id sub_23C959C84(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();
  uint64_t v6 = v5;

  if (v6)
  {
    uint64_t v7 = (void *)sub_23C990FC0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

uint64_t sub_23C959D04()
{
  uint64_t v1 = sub_23C990D50();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  id v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBAE78);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = v0 + OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_payload;
  swift_beginAccess();
  sub_23C95A840(v8, (uint64_t)v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v7, 1, v1))
  {
    sub_23C95AEBC((uint64_t)v7, &qword_268BBAE78);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v4, v7, v1);
    sub_23C95AEBC((uint64_t)v7, &qword_268BBAE78);
    uint64_t v10 = sub_23C990D20();
    uint64_t v12 = v11;
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    if (v12) {
      return v10;
    }
    else {
      return 0;
    }
  }
}

id ActivityAlertProvider.init(identifier:action:presentationOptions:payload:)(uint64_t a1, uint64_t a2, char *a3, void *a4, uint64_t a5)
{
  id v6 = sub_23C95A1B4(a1, a2, a3, a4, a5);

  return v6;
}

id ActivityAlertProvider.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void ActivityAlertProvider.init()()
{
}

id ActivityAlertProvider.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityAlertProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_23C95A1B4(uint64_t a1, uint64_t a2, char *a3, void *a4, uint64_t a5)
{
  uint64_t v70 = a2;
  os_log_type_t v71 = a3;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBAEB8);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v62 = (uint64_t)&v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_23C990BD0();
  uint64_t v63 = *(void *)(v11 - 8);
  uint64_t v64 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v61 = (char *)&v59 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = sub_23C990DA0();
  uint64_t v68 = *(void *)(v66 - 8);
  MEMORY[0x270FA5388](v66);
  uint64_t v67 = (char *)&v59 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBAE78);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  uint64_t v65 = (uint64_t)&v59 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v59 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v59 - v20;
  uint64_t v69 = (void **)&v5[OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_configuration];
  *(void *)&v5[OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_configuration] = 0;
  uint64_t v22 = (void **)&v5[OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_presentationOptions];
  *(void *)&v5[OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_presentationOptions] = 0;
  uint64_t v23 = &v5[OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_alertConfiguration];
  uint64_t v24 = sub_23C990DB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v23, 1, 1, v24);
  uint64_t v25 = (uint64_t)&v5[OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_payload];
  uint64_t v26 = sub_23C990D50();
  uint64_t v27 = *(void *)(v26 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 56))(v25, 1, 1, v26);
  uint64_t v28 = &v5[OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_activityIdentifier];
  uint64_t v29 = v70;
  *(void *)uint64_t v28 = a1;
  *((void *)v28 + 1) = v29;
  *(void *)&v5[OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_alertAction] = v71;
  swift_beginAccess();
  uint64_t v30 = *v22;
  *uint64_t v22 = a4;
  os_log_type_t v71 = v5;
  id v31 = a4;

  swift_beginAccess();
  sub_23C95AE54(a5, v25);
  swift_endAccess();
  id v32 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F7FC70]), sel_initWithType_, 17);
  sub_23C95A840(a5, (uint64_t)v21);
  uint64_t v33 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48);
  if (v33(v21, 1, v26) == 1)
  {
    sub_23C95AEBC((uint64_t)v21, &qword_268BBAE78);
    goto LABEL_14;
  }
  id v32 = v32;
  uint64_t v70 = sub_23C990D10();
  uint64_t v35 = v34;
  uint64_t v36 = *(void (**)(char *, uint64_t))(v27 + 8);
  v36(v21, v26);
  sub_23C95A840(a5, (uint64_t)v19);
  if (v33(v19, 1, v26) == 1)
  {

    swift_bridgeObjectRelease();
    sub_23C95AEBC((uint64_t)v19, &qword_268BBAE78);
    uint64_t v37 = v66;
  }
  else
  {
    uint64_t v60 = v35;
    uint64_t v38 = v67;
    sub_23C990D40();
    v36(v19, v26);
    uint64_t v39 = sub_23C990D90();
    uint64_t v41 = v40;
    v42 = v38;
    uint64_t v37 = v66;
    (*(void (**)(char *, uint64_t))(v68 + 8))(v42, v66);
    if (v41)
    {
      uint64_t v43 = v62;
      sub_23C95750C(v39, v41, v70, v60, v62);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v45 = v63;
      uint64_t v44 = v64;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v63 + 48))(v43, 1, v64) == 1)
      {

        sub_23C95AEBC(v43, &qword_268BBAEB8);
      }
      else
      {
        v51 = v61;
        (*(void (**)(char *, uint64_t, uint64_t))(v45 + 32))(v61, v43, v44);
        uint64_t v52 = (void *)sub_23C990B80();
        objc_msgSend(v32, sel_setExternalToneFileURL_, v52);

        (*(void (**)(char *, uint64_t))(v45 + 8))(v51, v44);
      }
      goto LABEL_14;
    }

    swift_bridgeObjectRelease();
  }
  uint64_t v46 = v65;
  sub_23C95A840(a5, v65);
  unsigned int v47 = v33((char *)v46, 1, v26);
  uint64_t v49 = v67;
  uint64_t v48 = v68;
  if (v47 == 1)
  {
    sub_23C95AEBC(v46, &qword_268BBAE78);
  }
  else
  {
    sub_23C990D40();
    v36((char *)v46, v26);
    uint64_t v50 = sub_23C990D80();
    (*(void (**)(char *, uint64_t))(v48 + 8))(v49, v37);
    if (v50)
    {

      id v32 = (id)v50;
    }
  }
LABEL_14:
  v53 = v69;
  id v54 = v71;
  swift_beginAccess();
  id v55 = *v53;
  char *v53 = v32;

  uint64_t v56 = (objc_class *)type metadata accessor for ActivityAlertProvider();
  v72.receiver = v54;
  v72.super_class = v56;
  id v57 = objc_msgSendSuper2(&v72, sel_init);
  sub_23C95AEBC(a5, &qword_268BBAE78);
  return v57;
}

uint64_t sub_23C95A840(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBAE78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for ActivityAlertProvider()
{
  uint64_t result = qword_268BBAEF8;
  if (!qword_268BBAEF8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id sub_23C95A8F4@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_configuration, a2);
}

void sub_23C95A900(void **a1, void *a2, uint64_t a3, uint64_t a4)
{
}

id sub_23C95A920@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC18ActivityUIServices21ActivityAlertProvider_presentationOptions, a2);
}

id keypath_getTm@<X0>(void *a1@<X0>, void *a2@<X3>, void **a3@<X8>)
{
  uint64_t v4 = (void **)(*a1 + *a2);
  swift_beginAccess();
  uint64_t v5 = *v4;
  *a3 = *v4;
  return v5;
}

void sub_23C95A98C(void **a1, void *a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_23C95A9AC()
{
  return type metadata accessor for ActivityAlertProvider();
}

void sub_23C95A9B4()
{
  sub_23C95ADA8(319, &qword_268BBAF08, MEMORY[0x263EFB5B8]);
  if (v0 <= 0x3F)
  {
    sub_23C95ADA8(319, &qword_268BBAF10, MEMORY[0x263EFB5B0]);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for ActivityAlertProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ActivityAlertProvider);
}

uint64_t dispatch thunk of ActivityAlertProvider.action.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of ActivityAlertProvider.identifier.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of ActivityAlertProvider.bundleIdentifier.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of ActivityAlertProvider.payloadIdentifier.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of ActivityAlertProvider.configuration.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of ActivityAlertProvider.configuration.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of ActivityAlertProvider.configuration.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of ActivityAlertProvider.presentationOptions.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of ActivityAlertProvider.presentationOptions.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of ActivityAlertProvider.presentationOptions.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of ActivityAlertProvider.title.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of ActivityAlertProvider.body.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of ActivityAlertProvider.deviceIdentifier.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of ActivityAlertProvider.__allocating_init(identifier:action:presentationOptions:payload:)()
{
  return (*(uint64_t (**)(void))(v0 + 328))();
}

void sub_23C95ADA8(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_23C991230();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

unint64_t sub_23C95ADFC()
{
  unint64_t result = qword_268BBAF18;
  if (!qword_268BBAF18)
  {
    sub_23C990D50();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBAF18);
  }
  return result;
}

uint64_t sub_23C95AE54(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBAE78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C95AEBC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void ClientSettingDynamicLookup.subscript.getter()
{
}

uint64_t static SceneClientSettingScopes.ActivitySettings.BackgroundTintColorKey.keyIndex.getter()
{
  return qword_268BBAF28;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.BackgroundTintColorKey.keyIndex.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_268BBAF28 = a1;
  return result;
}

uint64_t (*static SceneClientSettingScopes.ActivitySettings.BackgroundTintColorKey.keyIndex.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.BackgroundTintColorKey.keyDescription.getter()
{
  return sub_23C95C244((uint64_t *)&unk_268BBAF30);
}

uint64_t static SceneClientSettingScopes.ActivitySettings.BackgroundTintColorKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return sub_23C95C2A8(a1, a2, qword_268BBAF30, &qword_268BBAF30[1]);
}

uint64_t (*static SceneClientSettingScopes.ActivitySettings.BackgroundTintColorKey.keyDescription.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_23C95B0D4(uint64_t a1, uint64_t a2)
{
  return sub_23C95C370(a1, a2, qword_268BBAF30);
}

uint64_t sub_23C95B0E4()
{
  return qword_268BBAF28;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.TextColorKey.keyIndex.getter()
{
  return qword_268BBAF40;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.TextColorKey.keyIndex.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_268BBAF40 = a1;
  return result;
}

uint64_t (*static SceneClientSettingScopes.ActivitySettings.TextColorKey.keyIndex.modify())()
{
  return j_j__swift_endAccess;
}

void sub_23C95B20C()
{
  qword_268BBAF48 = 0x6F6C6F4374786574;
  unk_268BBAF50 = 0xE900000000000072;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.TextColorKey.keyDescription.getter()
{
  return sub_23C95B814(&qword_268BBAA40, &qword_268BBAF48);
}

uint64_t static SceneClientSettingScopes.ActivitySettings.TextColorKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return sub_23C95B8AC(a1, a2, &qword_268BBAA40, &qword_268BBAF48, &qword_268BBAF50);
}

uint64_t (*static SceneClientSettingScopes.ActivitySettings.TextColorKey.keyDescription.modify())()
{
  if (qword_268BBAA40 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_23C95B30C(uint64_t a1, uint64_t a2)
{
  return sub_23C95B9D8(a1, a2, &qword_268BBAA40, &qword_268BBAF48);
}

uint64_t sub_23C95B334()
{
  return qword_268BBAF40;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ArchiveContentReadyKey.keyIndex.getter()
{
  return qword_268BBAF58;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ArchiveContentReadyKey.keyIndex.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_268BBAF58 = a1;
  return result;
}

uint64_t (*static SceneClientSettingScopes.ActivitySettings.ArchiveContentReadyKey.keyIndex.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ArchiveContentReadyKey.keyDescription.getter()
{
  return sub_23C95C244((uint64_t *)&unk_268BBAF60);
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ArchiveContentReadyKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return sub_23C95C2A8(a1, a2, qword_268BBAF60, &qword_268BBAF60[1]);
}

uint64_t (*static SceneClientSettingScopes.ActivitySettings.ArchiveContentReadyKey.keyDescription.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_23C95B4D4(uint64_t a1, uint64_t a2)
{
  return sub_23C95C370(a1, a2, qword_268BBAF60);
}

uint64_t sub_23C95B4E4()
{
  return qword_268BBAF58;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ContentPayloadIDKey.keyIndex.getter()
{
  return qword_268BBAF70;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ContentPayloadIDKey.keyIndex.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_268BBAF70 = a1;
  return result;
}

uint64_t (*static SceneClientSettingScopes.ActivitySettings.ContentPayloadIDKey.keyIndex.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ContentPayloadIDKey.keyDescription.getter()
{
  return sub_23C95C244((uint64_t *)&unk_268BBAF78);
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ContentPayloadIDKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return sub_23C95C2A8(a1, a2, qword_268BBAF78, &qword_268BBAF78[1]);
}

uint64_t (*static SceneClientSettingScopes.ActivitySettings.ContentPayloadIDKey.keyDescription.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_23C95B684(uint64_t a1, uint64_t a2)
{
  return sub_23C95C370(a1, a2, qword_268BBAF78);
}

uint64_t sub_23C95B694()
{
  return qword_268BBAF70;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ResolvedMetricsKey.keyIndex.getter()
{
  return qword_268BBAF88;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ResolvedMetricsKey.keyIndex.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_268BBAF88 = a1;
  return result;
}

uint64_t (*static SceneClientSettingScopes.ActivitySettings.ResolvedMetricsKey.keyIndex.modify())()
{
  return j_j__swift_endAccess;
}

void sub_23C95B7BC()
{
  qword_268BBAF90 = 0x6465766C6F736572;
  *(void *)algn_268BBAF98 = 0xEF7363697274654DLL;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ResolvedMetricsKey.keyDescription.getter()
{
  return sub_23C95B814(&qword_268BBAA48, &qword_268BBAF90);
}

uint64_t sub_23C95B814(void *a1, uint64_t *a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ResolvedMetricsKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return sub_23C95B8AC(a1, a2, &qword_268BBAA48, &qword_268BBAF90, algn_268BBAF98);
}

uint64_t sub_23C95B8AC(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  if (*a3 != -1) {
    swift_once();
  }
  swift_beginAccess();
  *a4 = a1;
  *a5 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static SceneClientSettingScopes.ActivitySettings.ResolvedMetricsKey.keyDescription.modify())()
{
  if (qword_268BBAA48 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_23C95B9B0(uint64_t a1, uint64_t a2)
{
  return sub_23C95B9D8(a1, a2, &qword_268BBAA48, &qword_268BBAF90);
}

uint64_t sub_23C95B9D8(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4)
{
  if (*a3 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v5 = *a4;
  swift_bridgeObjectRetain();
  return v5;
}

uint64_t sub_23C95BA4C()
{
  return qword_268BBAF88;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ActivityHostTouchRestrictedRectsKey.keyIndex.getter()
{
  return qword_268BBAFA0;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ActivityHostTouchRestrictedRectsKey.keyIndex.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_268BBAFA0 = a1;
  return result;
}

uint64_t (*static SceneClientSettingScopes.ActivitySettings.ActivityHostTouchRestrictedRectsKey.keyIndex.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ActivityHostTouchRestrictedRectsKey.keyDescription.getter()
{
  return sub_23C95C244((uint64_t *)&unk_268BBAFA8);
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ActivityHostTouchRestrictedRectsKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return sub_23C95C2A8(a1, a2, qword_268BBAFA8, &qword_268BBAFA8[1]);
}

uint64_t (*static SceneClientSettingScopes.ActivitySettings.ActivityHostTouchRestrictedRectsKey.keyDescription.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_23C95BBEC(uint64_t a1, uint64_t a2)
{
  return sub_23C95C370(a1, a2, qword_268BBAFA8);
}

uint64_t sub_23C95BBFC()
{
  return qword_268BBAFA0;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.DisableIdleTimerKey.keyIndex.getter()
{
  return qword_268BBAFB8;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.DisableIdleTimerKey.keyIndex.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_268BBAFB8 = a1;
  return result;
}

uint64_t (*static SceneClientSettingScopes.ActivitySettings.DisableIdleTimerKey.keyIndex.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.DisableIdleTimerKey.keyDescription.getter()
{
  return sub_23C95C244((uint64_t *)&unk_268BBAFC0);
}

uint64_t static SceneClientSettingScopes.ActivitySettings.DisableIdleTimerKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return sub_23C95C2A8(a1, a2, qword_268BBAFC0, &qword_268BBAFC0[1]);
}

uint64_t (*static SceneClientSettingScopes.ActivitySettings.DisableIdleTimerKey.keyDescription.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_23C95BD9C(uint64_t a1, uint64_t a2)
{
  return sub_23C95C370(a1, a2, qword_268BBAFC0);
}

uint64_t sub_23C95BDAC()
{
  return qword_268BBAFB8;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ArchivedActivityFamilyKey.keyIndex.getter()
{
  return qword_268BBAFD0;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ArchivedActivityFamilyKey.keyIndex.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_268BBAFD0 = a1;
  return result;
}

uint64_t (*static SceneClientSettingScopes.ActivitySettings.ArchivedActivityFamilyKey.keyIndex.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ArchivedActivityFamilyKey.keyDescription.getter()
{
  return sub_23C95C244((uint64_t *)&unk_268BBAFD8);
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ArchivedActivityFamilyKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return sub_23C95C2A8(a1, a2, qword_268BBAFD8, &qword_268BBAFD8[1]);
}

uint64_t (*static SceneClientSettingScopes.ActivitySettings.ArchivedActivityFamilyKey.keyDescription.modify())()
{
  return j__swift_endAccess;
}

uint64_t sub_23C95BF4C(uint64_t a1, uint64_t a2)
{
  return sub_23C95C370(a1, a2, qword_268BBAFD8);
}

uint64_t sub_23C95BF5C()
{
  return qword_268BBAFD0;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.BaseContentTouchedDownKey.keyIndex.getter()
{
  return qword_268BBAFE8;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.BaseContentTouchedDownKey.keyIndex.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_268BBAFE8 = a1;
  return result;
}

uint64_t (*static SceneClientSettingScopes.ActivitySettings.BaseContentTouchedDownKey.keyIndex.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.BaseContentTouchedDownKey.keyDescription.getter()
{
  return sub_23C95C244((uint64_t *)&unk_268BBAFF0);
}

uint64_t static SceneClientSettingScopes.ActivitySettings.BaseContentTouchedDownKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return sub_23C95C2A8(a1, a2, qword_268BBAFF0, &qword_268BBAFF0[1]);
}

uint64_t (*static SceneClientSettingScopes.ActivitySettings.BaseContentTouchedDownKey.keyDescription.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_23C95C0FC(uint64_t a1, uint64_t a2)
{
  return sub_23C95C370(a1, a2, qword_268BBAFF0);
}

uint64_t sub_23C95C10C()
{
  return qword_268BBAFE8;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ActionButtonInitiatedKey.keyIndex.getter()
{
  return qword_268BBB000;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ActionButtonInitiatedKey.keyIndex.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_268BBB000 = a1;
  return result;
}

uint64_t (*static SceneClientSettingScopes.ActivitySettings.ActionButtonInitiatedKey.keyIndex.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ActionButtonInitiatedKey.keyDescription.getter()
{
  return sub_23C95C244((uint64_t *)&unk_268BBB008);
}

uint64_t sub_23C95C244(uint64_t *a1)
{
  swift_beginAccess();
  uint64_t v2 = *a1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t static SceneClientSettingScopes.ActivitySettings.ActionButtonInitiatedKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return sub_23C95C2A8(a1, a2, qword_268BBB008, &qword_268BBB008[1]);
}

uint64_t sub_23C95C2A8(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  *a3 = a1;
  *a4 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static SceneClientSettingScopes.ActivitySettings.ActionButtonInitiatedKey.keyDescription.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_23C95C360(uint64_t a1, uint64_t a2)
{
  return sub_23C95C370(a1, a2, qword_268BBB008);
}

uint64_t sub_23C95C370(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  swift_beginAccess();
  uint64_t v4 = *a3;
  swift_bridgeObjectRetain();
  return v4;
}

uint64_t sub_23C95C3C8()
{
  return qword_268BBB000;
}

ValueMetadata *type metadata accessor for ClientSettingDynamicLookup()
{
  return &type metadata for ClientSettingDynamicLookup;
}

ValueMetadata *type metadata accessor for SceneClientSettingScopes()
{
  return &type metadata for SceneClientSettingScopes;
}

ValueMetadata *type metadata accessor for SceneClientSettingScopes.ActivitySettings()
{
  return &type metadata for SceneClientSettingScopes.ActivitySettings;
}

ValueMetadata *type metadata accessor for SceneClientSettingScopes.ActivitySettings.BackgroundTintColorKey()
{
  return &type metadata for SceneClientSettingScopes.ActivitySettings.BackgroundTintColorKey;
}

ValueMetadata *type metadata accessor for SceneClientSettingScopes.ActivitySettings.TextColorKey()
{
  return &type metadata for SceneClientSettingScopes.ActivitySettings.TextColorKey;
}

ValueMetadata *type metadata accessor for SceneClientSettingScopes.ActivitySettings.ArchiveContentReadyKey()
{
  return &type metadata for SceneClientSettingScopes.ActivitySettings.ArchiveContentReadyKey;
}

ValueMetadata *type metadata accessor for SceneClientSettingScopes.ActivitySettings.ContentPayloadIDKey()
{
  return &type metadata for SceneClientSettingScopes.ActivitySettings.ContentPayloadIDKey;
}

ValueMetadata *type metadata accessor for SceneClientSettingScopes.ActivitySettings.ResolvedMetricsKey()
{
  return &type metadata for SceneClientSettingScopes.ActivitySettings.ResolvedMetricsKey;
}

ValueMetadata *type metadata accessor for SceneClientSettingScopes.ActivitySettings.ActivityHostTouchRestrictedRectsKey()
{
  return &type metadata for SceneClientSettingScopes.ActivitySettings.ActivityHostTouchRestrictedRectsKey;
}

ValueMetadata *type metadata accessor for SceneClientSettingScopes.ActivitySettings.DisableIdleTimerKey()
{
  return &type metadata for SceneClientSettingScopes.ActivitySettings.DisableIdleTimerKey;
}

ValueMetadata *type metadata accessor for SceneClientSettingScopes.ActivitySettings.ArchivedActivityFamilyKey()
{
  return &type metadata for SceneClientSettingScopes.ActivitySettings.ArchivedActivityFamilyKey;
}

ValueMetadata *type metadata accessor for SceneClientSettingScopes.ActivitySettings.BaseContentTouchedDownKey()
{
  return &type metadata for SceneClientSettingScopes.ActivitySettings.BaseContentTouchedDownKey;
}

ValueMetadata *type metadata accessor for SceneClientSettingScopes.ActivitySettings.ActionButtonInitiatedKey()
{
  return &type metadata for SceneClientSettingScopes.ActivitySettings.ActionButtonInitiatedKey;
}

uint64_t sub_23C95C504@<X0>(void *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  if (AssociatedTypeWitness != sub_23C959038(0, &qword_26AF227E8))
  {
    if (objc_msgSend(a1, sel_objectForSetting_, (*(uint64_t (**)(uint64_t))(*(void *)(a3 + 8) + 16))(a2)))
    {
      sub_23C991270();
      swift_unknownObjectRelease();
      sub_23C95CAC4(v15, &v16);
    }
    else
    {
      long long v16 = 0u;
      long long v17 = 0u;
    }
    uint64_t v9 = &qword_26AF22BA0;
    goto LABEL_8;
  }
  if (objc_msgSend(a1, sel_objectForSetting_, (*(uint64_t (**)(uint64_t))(*(void *)(a3 + 8) + 16))(a2)))
  {
    sub_23C991270();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v15, 0, sizeof(v15));
  }
  sub_23C952E40((uint64_t)v15, (uint64_t)&v16);
  if (*((void *)&v17 + 1))
  {
    if (swift_dynamicCast())
    {
      sub_23C959038(0, (unint64_t *)&unk_26AF227A0);
      uint64_t v12 = sub_23C991150();
      sub_23C95CAD4(v13, v14);
      *(void *)&long long v16 = v12;
      uint64_t v9 = (uint64_t *)&unk_268BBB018;
LABEL_8:
      __swift_instantiateConcreteTypeFromMangledName(v9);
      int v10 = swift_dynamicCast();
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56))(a4, v10 ^ 1u, 1, AssociatedTypeWitness);
    }
  }
  else
  {
    sub_23C952480((uint64_t)&v16);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56))(a4, 1, 1, AssociatedTypeWitness);
}

void sub_23C95C788(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
}

void sub_23C95C7CC(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  id v7 = objc_msgSend(v3, sel_otherSettings);
  sub_23C95C504(v7, a1, a2, a3);
}

id sub_23C95C89C()
{
  return sub_23C95CA5C(type metadata accessor for ActivitySceneClientSettings);
}

uint64_t type metadata accessor for ActivitySceneClientSettings()
{
  return self;
}

void sub_23C95C8D8(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
}

void sub_23C95C8FC(void *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
}

id sub_23C95C93C(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  v6.receiver = a1;
  v6.super_class = (Class)a4();
  return objc_msgSendSuper2(&v6, sel_initWithSettings_, a3);
}

id sub_23C95C9A0(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  v4.receiver = a1;
  v4.super_class = (Class)a3();
  return objc_msgSendSuper2(&v4, sel_init);
}

id sub_23C95C9FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  id v5 = objc_allocWithZone((Class)a4());
  return objc_msgSend(v5, sel_initWithSettings_, a1);
}

id sub_23C95CA44()
{
  return sub_23C95CA5C(type metadata accessor for ActivityMutableSceneClientSettings);
}

id sub_23C95CA5C(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for ActivityMutableSceneClientSettings()
{
  return self;
}

_UNKNOWN **sub_23C95CAB8()
{
  return &protocol witness table for SceneClientSettingScopes.ActivitySettings;
}

_OWORD *sub_23C95CAC4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_23C95CAD4(uint64_t a1, unint64_t a2)
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

uint64_t sub_23C95CB74()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18ActivityUIServices22ActivityUpdateProvider_activityState;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_23C95CC08(uint64_t a1)
{
  objc_super v3 = (void *)(v1 + OBJC_IVAR____TtC18ActivityUIServices22ActivityUpdateProvider_activityState);
  uint64_t result = swift_beginAccess();
  *objc_super v3 = a1;
  return result;
}

uint64_t (*sub_23C95CC54())()
{
  return j_j__swift_endAccess;
}

id sub_23C95CCFC()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices22ActivityUpdateProvider_descriptor);
  swift_beginAccess();
  long long v2 = *v1;
  return v2;
}

void sub_23C95CDB4(void *a1)
{
  objc_super v3 = (void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices22ActivityUpdateProvider_descriptor);
  swift_beginAccess();
  objc_super v4 = *v3;
  *objc_super v3 = a1;
}

void sub_23C95CE08(void **a1, void *a2)
{
  long long v2 = *a1;
  objc_super v3 = (void **)(*a2 + OBJC_IVAR____TtC18ActivityUIServices22ActivityUpdateProvider_descriptor);
  swift_beginAccess();
  objc_super v4 = *v3;
  *objc_super v3 = v2;
  id v5 = v2;
}

uint64_t (*sub_23C95CE6C())()
{
  return j__swift_endAccess;
}

uint64_t sub_23C95CF28()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC18ActivityUIServices22ActivityUpdateProvider_activityIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

id ActivityUpdateProvider.__allocating_init(activityDescriptor:activityState:systemMetricsRequest:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = objc_allocWithZone(v3);
  id v8 = sub_23C95D22C(a1, a2, a3);

  return v8;
}

id ActivityUpdateProvider.init(activityDescriptor:activityState:systemMetricsRequest:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = sub_23C95D22C(a1, a2, a3);

  return v4;
}

id ActivityUpdateProvider.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void ActivityUpdateProvider.init()()
{
}

id ActivityUpdateProvider.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityUpdateProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_23C95D22C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = sub_23C990C60();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  int v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v11(&v3[OBJC_IVAR____TtC18ActivityUIServices22ActivityUpdateProvider_activityDescriptor], a1, v7);
  *(void *)&v3[OBJC_IVAR____TtC18ActivityUIServices22ActivityUpdateProvider_activityState] = a2;
  uint64_t v12 = v3;
  uint64_t v13 = sub_23C990C50();
  unint64_t v14 = (uint64_t *)&v12[OBJC_IVAR____TtC18ActivityUIServices22ActivityUpdateProvider_activityIdentifier];
  *unint64_t v14 = v13;
  v14[1] = v15;
  sub_23C95D780();
  v11(v10, a1, v7);
  *(void *)&v12[OBJC_IVAR____TtC18ActivityUIServices22ActivityUpdateProvider_descriptor] = sub_23C9911B0();
  *(void *)&v12[OBJC_IVAR____TtC18ActivityUIServices22ActivityUpdateProvider_systemMetricsRequest] = a3;
  id v16 = a3;

  updated = (objc_class *)type metadata accessor for ActivityUpdateProvider();
  v20.receiver = v12;
  v20.super_class = updated;
  id v18 = objc_msgSendSuper2(&v20, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(a1, v7);
  return v18;
}

uint64_t type metadata accessor for ActivityUpdateProvider()
{
  uint64_t result = qword_268BBA5E8;
  if (!qword_268BBA5E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_23C95D41C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v3 = (void *)(*a1 + OBJC_IVAR____TtC18ActivityUIServices22ActivityUpdateProvider_activityState);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_23C95D470(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  objc_super v3 = (void *)(*a2 + OBJC_IVAR____TtC18ActivityUIServices22ActivityUpdateProvider_activityState);
  uint64_t result = swift_beginAccess();
  *objc_super v3 = v2;
  return result;
}

id sub_23C95D4C0@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  objc_super v3 = (void **)(*a1 + OBJC_IVAR____TtC18ActivityUIServices22ActivityUpdateProvider_descriptor);
  swift_beginAccess();
  id v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t sub_23C95D528()
{
  return type metadata accessor for ActivityUpdateProvider();
}

uint64_t sub_23C95D530()
{
  uint64_t result = sub_23C990C60();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for ActivityUpdateProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ActivityUpdateProvider);
}

uint64_t dispatch thunk of ActivityUpdateProvider.activityState.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of ActivityUpdateProvider.activityState.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of ActivityUpdateProvider.activityState.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of ActivityUpdateProvider.descriptor.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of ActivityUpdateProvider.descriptor.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of ActivityUpdateProvider.descriptor.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of ActivityUpdateProvider.identifier.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of ActivityUpdateProvider.__allocating_init(activityDescriptor:activityState:systemMetricsRequest:)()
{
  return (*(uint64_t (**)(void))(v0 + 248))();
}

unint64_t sub_23C95D780()
{
  unint64_t result = qword_26AF227D0;
  if (!qword_26AF227D0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26AF227D0);
  }
  return result;
}

id *sub_23C95D7C0()
{
  objc_msgSend(v0[2], sel_invalidate);
  id v1 = v0[2];
  v0[2] = 0;

  objc_msgSend(v0[11], sel_invalidate);
  id v2 = v0[11];
  v0[11] = 0;

  swift_bridgeObjectRelease();
  swift_release();

  return v0;
}

uint64_t sub_23C95D83C()
{
  sub_23C95D7C0();
  return MEMORY[0x270FA0228](v0, 96, 7);
}

uint64_t type metadata accessor for BackOffTimer()
{
  return self;
}

void sub_23C95D894()
{
  id v1 = (void *)v0;
  if (*(void *)(v0 + 16))
  {
    if (qword_26AF22720 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_23C990E40();
    __swift_project_value_buffer(v2, (uint64_t)qword_26AF22708);
    swift_retain();
    objc_super v3 = sub_23C990E20();
    os_log_type_t v4 = sub_23C991140();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = swift_slowAlloc();
      uint64_t v6 = swift_slowAlloc();
      aBlock[0] = v6;
      *(_DWORD *)uint64_t v5 = 136315138;
      uint64_t v7 = v1[4];
      unint64_t v8 = v1[5];
      swift_bridgeObjectRetain();
      uint64_t v38 = sub_23C9733B0(v7, v8, aBlock);
      sub_23C991240();
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v9 = "[%s] Back off timer is already on";
      int v10 = v3;
      os_log_type_t v11 = v4;
      uint64_t v12 = (uint8_t *)v5;
      uint32_t v13 = 12;
LABEL_20:
      _os_log_impl(&dword_23C948000, v10, v11, v9, v12, v13);
      swift_arrayDestroy();
      MEMORY[0x23ECEADB0](v6, -1, -1);
      MEMORY[0x23ECEADB0](v5, -1, -1);

      return;
    }

    swift_release();
  }
  else
  {
    objc_msgSend(*(id *)(v0 + 88), sel_invalidate);
    unint64_t v14 = *(void **)(v0 + 88);
    *(void *)(v0 + 88) = 0;

    if (qword_26AF22720 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_23C990E40();
    __swift_project_value_buffer(v15, (uint64_t)qword_26AF22708);
    swift_retain();
    id v16 = sub_23C990E20();
    os_log_type_t v17 = sub_23C991140();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      aBlock[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315394;
      uint64_t v20 = *(void *)(v0 + 32);
      unint64_t v21 = *(void *)(v0 + 40);
      swift_bridgeObjectRetain();
      uint64_t v38 = sub_23C9733B0(v20, v21, aBlock);
      sub_23C991240();
      swift_bridgeObjectRelease();
      *(_WORD *)(v18 + 12) = 2048;
      uint64_t v38 = *(void *)(v0 + 24);
      sub_23C991240();
      swift_release();
      _os_log_impl(&dword_23C948000, v16, v17, "[%s] scheduling new backoff with base interval: %f.", (uint8_t *)v18, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x23ECEADB0](v19, -1, -1);
      MEMORY[0x23ECEADB0](v18, -1, -1);
    }
    else
    {

      swift_release();
    }
    id v22 = objc_allocWithZone(MEMORY[0x263F29C20]);
    uint64_t v23 = (void *)sub_23C990FC0();
    id v24 = objc_msgSend(v22, sel_initWithIdentifier_, v23);

    uint64_t v25 = *(void **)(v0 + 16);
    *(void *)(v0 + 16) = v24;

    double v26 = *(double *)(v0 + 24);
    if (v26 >= 0.1) {
      double v27 = v26 + v26;
    }
    else {
      double v27 = 0.1;
    }
    double v28 = fmin(v27, 120.0);
    *(double *)(v0 + 24) = v28;
    uint64_t v29 = *(void **)(v0 + 16);
    if (v29)
    {
      uint64_t v30 = *(void *)(v0 + 48);
      uint64_t v31 = swift_allocObject();
      swift_weakInit();
      aBlock[4] = (uint64_t)sub_23C95E4C4;
      aBlock[5] = v31;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_23C95E08C;
      aBlock[3] = (uint64_t)&block_descriptor_18;
      id v32 = _Block_copy(aBlock);
      id v33 = v29;
      swift_release();
      objc_msgSend(v33, sel_scheduleWithFireInterval_leewayInterval_queue_handler_, v30, v32, v28, 0.0);
      _Block_release(v32);

      swift_retain();
      objc_super v3 = sub_23C990E20();
      os_log_type_t v34 = sub_23C991140();
      if (os_log_type_enabled(v3, v34))
      {
        uint64_t v5 = swift_slowAlloc();
        uint64_t v6 = swift_slowAlloc();
        aBlock[0] = v6;
        *(_DWORD *)uint64_t v5 = 136315394;
        uint64_t v35 = v1[4];
        unint64_t v36 = v1[5];
        swift_bridgeObjectRetain();
        uint64_t v38 = sub_23C9733B0(v35, v36, aBlock);
        sub_23C991240();
        swift_bridgeObjectRelease();
        *(_WORD *)(v5 + 12) = 2048;
        uint64_t v38 = v1[3];
        sub_23C991240();
        swift_release();
        uint64_t v9 = "[%s] Back off timer is scheduled with fire interval: %f";
        int v10 = v3;
        os_log_type_t v11 = v34;
        uint64_t v12 = (uint8_t *)v5;
        uint32_t v13 = 22;
        goto LABEL_20;
      }

      swift_release();
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_23C95DE70(void *a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    objc_super v3 = (void *)result;
    if (qword_26AF22720 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_23C990E40();
    __swift_project_value_buffer(v4, (uint64_t)qword_26AF22708);
    swift_retain();
    uint64_t v5 = sub_23C990E20();
    os_log_type_t v6 = sub_23C991140();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      uint64_t v14 = v8;
      *(_DWORD *)uint64_t v7 = 136315138;
      uint64_t v9 = v3[4];
      unint64_t v10 = v3[5];
      swift_bridgeObjectRetain();
      sub_23C9733B0(v9, v10, &v14);
      sub_23C991240();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23C948000, v5, v6, "[%s] Back off timer fired", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23ECEADB0](v8, -1, -1);
      MEMORY[0x23ECEADB0](v7, -1, -1);
    }
    else
    {

      swift_release();
    }
    os_log_type_t v11 = (void (*)(uint64_t))v3[7];
    uint64_t v12 = swift_retain();
    v11(v12);
    swift_release();
    objc_msgSend(a1, sel_invalidate);
    uint32_t v13 = (void *)v3[2];
    v3[2] = 0;

    sub_23C95E0F4();
    return swift_release();
  }
  return result;
}

void sub_23C95E08C(uint64_t a1, void *a2)
{
  objc_super v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_23C95E0F4()
{
  if ((*(unsigned char *)(v0 + 80) & 1) == 0)
  {
    double v1 = *(double *)(v0 + 72);
    objc_msgSend(*(id *)(v0 + 88), sel_invalidate);
    id v2 = objc_allocWithZone(MEMORY[0x263F29C20]);
    swift_bridgeObjectRetain();
    objc_super v3 = (void *)sub_23C990FC0();
    swift_bridgeObjectRelease();
    id v4 = objc_msgSend(v2, sel_initWithIdentifier_, v3);

    uint64_t v5 = *(void **)(v0 + 88);
    *(void *)(v0 + 88) = v4;

    os_log_type_t v6 = *(void **)(v0 + 88);
    if (v6)
    {
      uint64_t v7 = *(void *)(v0 + 48);
      uint64_t v8 = swift_allocObject();
      swift_weakInit();
      v11[4] = sub_23C95E4A4;
      v11[5] = v8;
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 1107296256;
      v11[2] = sub_23C95E08C;
      v11[3] = &block_descriptor_0;
      uint64_t v9 = _Block_copy(v11);
      id v10 = v6;
      swift_release();
      objc_msgSend(v10, sel_scheduleWithFireInterval_leewayInterval_queue_handler_, v7, v9, v1, 0.0);
      _Block_release(v9);
    }
  }
}

uint64_t sub_23C95E274()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_23C95E2AC()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = Strong;
    if (qword_26AF22720 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_23C990E40();
    __swift_project_value_buffer(v2, (uint64_t)qword_26AF22708);
    swift_retain();
    objc_super v3 = sub_23C990E20();
    os_log_type_t v4 = sub_23C991140();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      uint64_t v6 = swift_slowAlloc();
      uint64_t v10 = v6;
      *(_DWORD *)uint64_t v5 = 136315138;
      uint64_t v7 = *(void *)(v1 + 32);
      unint64_t v8 = *(void *)(v1 + 40);
      swift_bridgeObjectRetain();
      sub_23C9733B0(v7, v8, &v10);
      sub_23C991240();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23C948000, v3, v4, "[%s] Reset interval satiated, resetting", v5, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23ECEADB0](v6, -1, -1);
      MEMORY[0x23ECEADB0](v5, -1, -1);
    }
    else
    {

      swift_release();
    }
    *(void *)(v1 + 24) = 0;
    objc_msgSend(*(id *)(v1 + 88), sel_invalidate);
    uint64_t v9 = *(void **)(v1 + 88);
    *(void *)(v1 + 88) = 0;
    swift_release();
  }
}

void sub_23C95E4A4()
{
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

uint64_t sub_23C95E4C4(void *a1)
{
  return sub_23C95DE70(a1);
}

id sub_23C95E4E4()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__expandedMetricsRequest));
}

void sub_23C95E500(void *a1)
{
}

void (*sub_23C95E50C(void *a1))(uint64_t *, char)
{
  objc_super v3 = malloc(0x40uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__expandedMetricsRequest;
  v3[6] = v1;
  v3[7] = v4;
  uint64_t v5 = *(void **)(v1 + v4);
  v3[4] = v5;
  id v6 = v5;
  return sub_23C95E57C;
}

id sub_23C95E590()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactLeadingMetricsRequest));
}

void sub_23C95E5AC(void *a1)
{
}

void (*sub_23C95E5B8(void *a1))(uint64_t *, char)
{
  objc_super v3 = malloc(0x40uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactLeadingMetricsRequest;
  v3[6] = v1;
  v3[7] = v4;
  uint64_t v5 = *(void **)(v1 + v4);
  v3[4] = v5;
  id v6 = v5;
  return sub_23C95E57C;
}

id sub_23C95E638()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactTrailingMetricsRequest));
}

void sub_23C95E654(void *a1)
{
}

void (*sub_23C95E660(void *a1))(uint64_t *, char)
{
  objc_super v3 = malloc(0x40uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactTrailingMetricsRequest;
  v3[6] = v1;
  v3[7] = v4;
  uint64_t v5 = *(void **)(v1 + v4);
  v3[4] = v5;
  id v6 = v5;
  return sub_23C95E57C;
}

id sub_23C95E6E0()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__minimalMetricsRequest));
}

void sub_23C95E6FC(void *a1, uint64_t a2, void *a3, uint64_t *a4)
{
  id v6 = a3;
  uint64_t v7 = a1;
  objc_msgSend(v6, sel_copy);
  sub_23C991270();
  swift_unknownObjectRelease();
  type metadata accessor for ActivityItemMetricsRequest();
  swift_dynamicCast();
  uint64_t v8 = *a4;
  uint64_t v9 = *(void **)&v7[*a4];
  *(void *)&v7[v8] = v10;
}

void sub_23C95E7A8(void *a1)
{
}

void sub_23C95E7B4(void *a1, uint64_t *a2)
{
  objc_msgSend(a1, sel_copy);
  sub_23C991270();
  swift_unknownObjectRelease();
  type metadata accessor for ActivityItemMetricsRequest();
  swift_dynamicCast();
  uint64_t v5 = *a2;
  id v6 = *(void **)(v2 + *a2);
  *(void *)(v2 + v5) = v7;
}

void sub_23C95E848(id *a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v6 = *a2;
  id v7 = *a1;
  objc_msgSend(v7, sel_copy);
  sub_23C991270();
  swift_unknownObjectRelease();
  type metadata accessor for ActivityItemMetricsRequest();
  swift_dynamicCast();
  uint64_t v8 = *a5;
  uint64_t v9 = *(void **)(v6 + *a5);
  *(void *)(v6 + v8) = v10;
}

void (*sub_23C95E8E8(void *a1))(uint64_t *, char)
{
  objc_super v3 = malloc(0x40uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__minimalMetricsRequest;
  v3[6] = v1;
  v3[7] = v4;
  uint64_t v5 = *(void **)(v1 + v4);
  v3[4] = v5;
  id v6 = v5;
  return sub_23C95E57C;
}

double sub_23C95E9A0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionSize;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_23C95EA40(double a1, double a2)
{
  uint64_t v5 = (double *)(v2 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionSize);
  uint64_t result = swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*sub_23C95EA98())()
{
  return j__swift_endAccess;
}

double sub_23C95EB3C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionTopMargin;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_23C95EBD8(double a1)
{
  objc_super v3 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionTopMargin);
  uint64_t result = swift_beginAccess();
  *objc_super v3 = a1;
  return result;
}

uint64_t (*sub_23C95EC2C())()
{
  return j_j__swift_endAccess;
}

id SystemApertureMetricsRequest.__allocating_init(obstructionSize:obstructionTopMargin:expandedMetricsRequest:compactLeadingMetricsRequest:compactTrailingMetricsRequest:minimalMetricsRequest:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6, double a7)
{
  uint64_t v15 = (char *)objc_allocWithZone(v7);
  id v16 = (double *)&v15[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionSize];
  *id v16 = a5;
  v16[1] = a6;
  *(double *)&v15[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionTopMargin] = a7;
  *(void *)&v15[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__expandedMetricsRequest] = a1;
  *(void *)&v15[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactLeadingMetricsRequest] = a2;
  *(void *)&v15[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactTrailingMetricsRequest] = a3;
  *(void *)&v15[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__minimalMetricsRequest] = a4;
  v18.receiver = v15;
  v18.super_class = v7;
  return objc_msgSendSuper2(&v18, sel_init);
}

id SystemApertureMetricsRequest.init(obstructionSize:obstructionTopMargin:expandedMetricsRequest:compactLeadingMetricsRequest:compactTrailingMetricsRequest:minimalMetricsRequest:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6, double a7)
{
  uint64_t v8 = (double *)&v7[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionSize];
  double *v8 = a5;
  v8[1] = a6;
  *(double *)&v7[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionTopMargin] = a7;
  *(void *)&v7[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__expandedMetricsRequest] = a1;
  *(void *)&v7[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactLeadingMetricsRequest] = a2;
  *(void *)&v7[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactTrailingMetricsRequest] = a3;
  *(void *)&v7[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__minimalMetricsRequest] = a4;
  v10.receiver = v7;
  v10.super_class = (Class)type metadata accessor for SystemApertureMetricsRequest();
  return objc_msgSendSuper2(&v10, sel_init);
}

uint64_t type metadata accessor for SystemApertureMetricsRequest()
{
  return self;
}

id SystemApertureMetricsRequest.__allocating_init(obstructionSize:expandedMetricsRequest:compactLeadingMetricsRequest:compactTrailingMetricsRequest:minimalMetricsRequest:)(void *a1, void *a2, void *a3, void *a4, double a5, double a6)
{
  id v11 = objc_msgSend(objc_allocWithZone(v6), sel_initWithObstructionSize_obstructionTopMargin_expandedMetricsRequest_compactLeadingMetricsRequest_compactTrailingMetricsRequest_minimalMetricsRequest_, a1, a2, a3, a4, a5, a6, 0.0);

  return v11;
}

id SystemApertureMetricsRequest.init(obstructionSize:expandedMetricsRequest:compactLeadingMetricsRequest:compactTrailingMetricsRequest:minimalMetricsRequest:)(void *a1, void *a2, void *a3, void *a4, double a5, double a6)
{
  id v11 = objc_msgSend(v6, sel_initWithObstructionSize_obstructionTopMargin_expandedMetricsRequest_compactLeadingMetricsRequest_compactTrailingMetricsRequest_minimalMetricsRequest_, a1, a2, a3, a4, a5, a6, 0.0);

  return v11;
}

unint64_t sub_23C95EFD0(char a1)
{
  unint64_t result = 0xD000000000000014;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0xD000000000000016;
      break;
    case 3:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 4:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 5:
      unint64_t result = 0xD000000000000015;
      break;
    default:
      unint64_t result = 0x746375727473626FLL;
      break;
  }
  return result;
}

uint64_t sub_23C95F0C8()
{
  uint64_t v1 = (uint64_t)objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__expandedMetricsRequest), sel_hash);
  if (v1 >= 1) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = v1;
  }
  uint64_t v3 = (uint64_t)objc_msgSend(*(id *)(v0+ OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactLeadingMetricsRequest), sel_hash);
  if (v3 >= 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = v3;
  }
  uint64_t v5 = (uint64_t)objc_msgSend(*(id *)(v0+ OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactTrailingMetricsRequest), sel_hash);
  if (v5 >= 1) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = v5;
  }
  uint64_t v7 = (uint64_t)objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__minimalMetricsRequest), sel_hash);
  if (v7 >= 1) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = v7;
  }
  uint64_t v9 = (double *)(v0 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionSize);
  uint64_t result = swift_beginAccess();
  if (*v9 <= 1.0) {
    double v11 = *v9;
  }
  else {
    double v11 = 1.0;
  }
  if ((~*(void *)&v11 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_39;
  }
  if (v11 <= -9.22337204e18)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  if (v11 >= 9.22337204e18)
  {
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  if (v9[1] <= 1.0) {
    double v12 = v9[1];
  }
  else {
    double v12 = 1.0;
  }
  if ((~*(void *)&v12 & 0x7FF0000000000000) == 0) {
    goto LABEL_41;
  }
  if (v12 <= -9.22337204e18)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  if (v12 >= 9.22337204e18)
  {
LABEL_43:
    __break(1u);
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  uint32_t v13 = (double *)(v0 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionTopMargin);
  uint64_t result = swift_beginAccess();
  double v14 = *v13;
  if (*v13 > 1.0) {
    double v14 = 1.0;
  }
  if ((~*(void *)&v14 & 0x7FF0000000000000) == 0) {
    goto LABEL_44;
  }
  if (v14 <= -9.22337204e18)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  if (v14 >= 9.22337204e18)
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  uint64_t v15 = 37 * v2;
  if ((unsigned __int128)(v2 * (__int128)37) >> 64 != (37 * v2) >> 63)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  uint64_t v16 = v15 * v4;
  if ((unsigned __int128)(v15 * (__int128)v4) >> 64 != (v15 * v4) >> 63)
  {
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  uint64_t v17 = v16 * v6;
  if ((unsigned __int128)(v16 * (__int128)v6) >> 64 != (v16 * v6) >> 63)
  {
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
  uint64_t v18 = v17 * v8;
  if ((unsigned __int128)(v17 * (__int128)v8) >> 64 != (v17 * v8) >> 63)
  {
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  uint64_t v19 = v18 * (uint64_t)v11;
  if ((unsigned __int128)(v18 * (__int128)(uint64_t)v11) >> 64 != v19 >> 63)
  {
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  uint64_t v20 = v19 * (uint64_t)v12;
  if ((unsigned __int128)(v19 * (__int128)(uint64_t)v12) >> 64 != v20 >> 63)
  {
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  uint64_t result = v20 * (uint64_t)v14;
  if ((unsigned __int128)(v20 * (__int128)(uint64_t)v14) >> 64 != result >> 63) {
LABEL_53:
  }
    __break(1u);
  return result;
}

BOOL sub_23C95F33C(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_23C9523D4(a1, (uint64_t)v29);
  if (v30)
  {
    type metadata accessor for SystemApertureMetricsRequest();
    if (swift_dynamicCast())
    {
      sub_23C952504();
      uint64_t v3 = *(void **)&v28[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__expandedMetricsRequest];
      id v4 = objc_retain(*(id *)(v1
                             + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__expandedMetricsRequest));
      id v5 = v3;
      char v6 = sub_23C991200();

      if (v6)
      {
        uint64_t v7 = *(void **)&v28[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactLeadingMetricsRequest];
        id v8 = objc_retain(*(id *)(v1
                               + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactLeadingMetricsRequest));
        id v9 = v7;
        char v10 = sub_23C991200();

        if (v10)
        {
          double v11 = *(void **)&v28[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactTrailingMetricsRequest];
          id v12 = objc_retain(*(id *)(v1
                                  + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactTrailingMetricsRequest));
          id v13 = v11;
          char v14 = sub_23C991200();

          if (v14)
          {
            uint64_t v15 = *(void **)&v28[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__minimalMetricsRequest];
            id v16 = objc_retain(*(id *)(v1
                                    + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__minimalMetricsRequest));
            id v17 = v15;
            char v18 = sub_23C991200();

            if (v18)
            {
              uint64_t v19 = (CGFloat *)(v2 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionSize);
              swift_beginAccess();
              CGFloat v20 = *v19;
              CGFloat v21 = v19[1];
              id v22 = (CGSize *)&v28[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionSize];
              swift_beginAccess();
              v31.width = v20;
              v31.height = v21;
              if (CGSizeEqualToSize(v31, *v22))
              {
                uint64_t v23 = (double *)(v2
                               + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionTopMargin);
                swift_beginAccess();
                double v24 = *v23;
                uint64_t v25 = (double *)&v28[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionTopMargin];
                swift_beginAccess();
                double v26 = *v25;

                return v24 == v26;
              }
            }
          }
        }
      }
    }
  }
  else
  {
    sub_23C952480((uint64_t)v29);
  }
  return 0;
}

id sub_23C95F650()
{
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29C40]), sel_initWithObject_, v0);
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = (double *)(v0 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionSize);
    swift_beginAccess();
    double v4 = *v3;
    double v5 = v3[1];
    char v6 = (void *)sub_23C990FC0();

    uint64_t v7 = (double *)(v0 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionTopMargin);
    swift_beginAccess();
    double v8 = *v7;
    id v9 = (void *)sub_23C990FC0();

    id v10 = objc_retain(*(id *)(v0
                            + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__expandedMetricsRequest));
    double v11 = (void *)sub_23C990FC0();

    id v12 = objc_retain(*(id *)(v0
                            + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactLeadingMetricsRequest));
    id v13 = (void *)sub_23C990FC0();

    id v14 = objc_retain(*(id *)(v0
                            + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactTrailingMetricsRequest));
    uint64_t v15 = (void *)sub_23C990FC0();

    id v16 = objc_retain(*(id *)(v0
                            + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__minimalMetricsRequest));
    id v17 = (void *)sub_23C990FC0();

    id result = objc_msgSend(v2, sel_build);
    if (result)
    {
      char v18 = result;
      uint64_t v19 = sub_23C990FD0();

      return (id)v19;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_23C95F94C@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionSize);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  char v6 = (uint64_t *)(v1 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionTopMargin);
  swift_beginAccess();
  uint64_t v7 = *v6;
  double v8 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__expandedMetricsRequest);
  id v9 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactLeadingMetricsRequest);
  id v10 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactTrailingMetricsRequest);
  double v11 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__minimalMetricsRequest);
  id v12 = (objc_class *)type metadata accessor for SystemApertureMetricsRequest();
  id v13 = (char *)objc_allocWithZone(v12);
  id v14 = &v13[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionSize];
  *(void *)id v14 = v4;
  *((void *)v14 + 1) = v5;
  *(void *)&v13[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionTopMargin] = v7;
  *(void *)&v13[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__expandedMetricsRequest] = v8;
  *(void *)&v13[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactLeadingMetricsRequest] = v9;
  *(void *)&v13[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactTrailingMetricsRequest] = v10;
  *(void *)&v13[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__minimalMetricsRequest] = v11;
  v20.receiver = v13;
  v20.super_class = v12;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v18 = v11;
  id result = objc_msgSendSuper2(&v20, sel_init);
  a1[3] = v12;
  *a1 = result;
  return result;
}

id SystemApertureMetricsRequest.__allocating_init(xpcDictionary:)()
{
  id v1 = objc_allocWithZone(v0);
  id v2 = sub_23C9601DC();
  swift_unknownObjectRelease();
  return v2;
}

id SystemApertureMetricsRequest.init(xpcDictionary:)()
{
  id v0 = sub_23C9601DC();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t sub_23C95FBB0()
{
  return BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
}

uint64_t static SystemApertureMetricsRequest.supportsSecureCoding.getter()
{
  return 1;
}

void sub_23C95FD30(void *a1)
{
  uint64_t v3 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionSize);
  swift_beginAccess();
  double v4 = *v3;
  uint64_t v5 = (void *)sub_23C990FC0();
  objc_msgSend(a1, sel_encodeDouble_forKey_, v5, v4);

  double v6 = v3[1];
  uint64_t v7 = (void *)sub_23C990FC0();
  objc_msgSend(a1, sel_encodeDouble_forKey_, v7, v6);

  double v8 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionTopMargin);
  swift_beginAccess();
  double v9 = *v8;
  id v10 = (void *)sub_23C990FC0();
  objc_msgSend(a1, sel_encodeDouble_forKey_, v10, v9);

  id v11 = objc_retain(*(id *)(v1
                          + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__expandedMetricsRequest));
  id v12 = (void *)sub_23C990FC0();
  objc_msgSend(a1, sel_encodeObject_forKey_, v11, v12);

  id v13 = objc_retain(*(id *)(v1
                          + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__minimalMetricsRequest));
  id v14 = (void *)sub_23C990FC0();
  objc_msgSend(a1, sel_encodeObject_forKey_, v13, v14);

  id v15 = objc_retain(*(id *)(v1
                          + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactLeadingMetricsRequest));
  id v16 = (void *)sub_23C990FC0();
  objc_msgSend(a1, sel_encodeObject_forKey_, v15, v16);

  id v17 = objc_retain(*(id *)(v1
                          + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactTrailingMetricsRequest));
  id v18 = (void *)sub_23C990FC0();
  objc_msgSend(a1, sel_encodeObject_forKey_, v17, v18);
}

id SystemApertureMetricsRequest.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = sub_23C9604CC(a1);

  return v4;
}

id SystemApertureMetricsRequest.init(coder:)(void *a1)
{
  id v2 = sub_23C9604CC(a1);

  return v2;
}

id SystemApertureMetricsRequest.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void SystemApertureMetricsRequest.init()()
{
}

id SystemApertureMetricsRequest.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SystemApertureMetricsRequest();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_23C9601DC()
{
  id v1 = v0;
  BSDeserializeCGSizeFromXPCDictionaryWithKey();
  objc_super v2 = &v1[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionSize];
  *(void *)objc_super v2 = v3;
  *((void *)v2 + 1) = v4;
  BSDeserializeDoubleFromXPCDictionaryWithKey();
  *(void *)&v1[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionTopMargin] = v5;
  if ((id)BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey())
  {
    sub_23C991270();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
  }
  sub_23C952E40((uint64_t)&v13, (uint64_t)v15);
  if (v16)
  {
    type metadata accessor for ActivityItemMetricsRequest();
    if (swift_dynamicCast())
    {
      id v6 = v11;
      goto LABEL_9;
    }
  }
  else
  {
    sub_23C952480((uint64_t)v15);
  }
  id v6 = sub_23C989B04();
LABEL_9:
  *(void *)&v1[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__expandedMetricsRequest] = v6;
  if ((id)BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey())
  {
    sub_23C991270();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
  }
  sub_23C952E40((uint64_t)&v13, (uint64_t)v15);
  if (v16)
  {
    type metadata accessor for ActivityItemMetricsRequest();
    if (swift_dynamicCast())
    {
      id v7 = v11;
      goto LABEL_17;
    }
  }
  else
  {
    sub_23C952480((uint64_t)v15);
  }
  id v7 = sub_23C989B04();
LABEL_17:
  *(void *)&v1[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactLeadingMetricsRequest] = v7;
  if ((id)BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey())
  {
    sub_23C991270();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
  }
  sub_23C952E40((uint64_t)&v13, (uint64_t)v15);
  if (v16)
  {
    type metadata accessor for ActivityItemMetricsRequest();
    if (swift_dynamicCast())
    {
      id v8 = v11;
      goto LABEL_25;
    }
  }
  else
  {
    sub_23C952480((uint64_t)v15);
  }
  id v8 = sub_23C989B04();
LABEL_25:
  *(void *)&v1[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactTrailingMetricsRequest] = v8;
  if ((id)BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey())
  {
    sub_23C991270();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
  }
  sub_23C952E40((uint64_t)&v13, (uint64_t)v15);
  if (!v16)
  {
    sub_23C952480((uint64_t)v15);
    goto LABEL_32;
  }
  type metadata accessor for ActivityItemMetricsRequest();
  if (!swift_dynamicCast())
  {
LABEL_32:
    id v9 = sub_23C989B04();
    goto LABEL_33;
  }
  id v9 = v11;
LABEL_33:
  *(void *)&v1[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__minimalMetricsRequest] = v9;

  v12.receiver = v1;
  v12.super_class = (Class)type metadata accessor for SystemApertureMetricsRequest();
  return objc_msgSendSuper2(&v12, sel_init);
}

id sub_23C9604CC(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v4 = (void *)sub_23C990FC0();
  objc_msgSend(a1, sel_decodeDoubleForKey_, v4);
  uint64_t v6 = v5;

  id v7 = (void *)sub_23C990FC0();
  objc_msgSend(a1, sel_decodeDoubleForKey_, v7);
  uint64_t v9 = v8;

  id v10 = &v3[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionSize];
  *(void *)id v10 = v6;
  *((void *)v10 + 1) = v9;
  id v11 = (void *)sub_23C990FC0();
  objc_msgSend(a1, sel_decodeDoubleForKey_, v11);
  uint64_t v13 = v12;

  *(void *)&v3[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionTopMargin] = v13;
  type metadata accessor for ActivityItemMetricsRequest();
  uint64_t v14 = sub_23C9911D0();
  if (!v14)
  {
    sub_23C952DEC();
    id v15 = (void *)swift_allocError();
    *uint64_t v16 = 0xD000000000000010;
    v16[1] = 0x800000023C997E00;
    id v17 = (void *)sub_23C990B20();

    objc_msgSend(a1, sel_failWithError_, v17);
    uint64_t v14 = (uint64_t)sub_23C989B04();
  }
  *(void *)&v3[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__expandedMetricsRequest] = v14;
  uint64_t v18 = sub_23C9911D0();
  if (!v18)
  {
    sub_23C952DEC();
    uint64_t v19 = (void *)swift_allocError();
    *objc_super v20 = 0x206C616D696E696DLL;
    v20[1] = 0xEF7363697274656DLL;
    CGFloat v21 = (void *)sub_23C990B20();

    objc_msgSend(a1, sel_failWithError_, v21);
    uint64_t v18 = (uint64_t)sub_23C989B04();
  }
  *(void *)&v3[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__minimalMetricsRequest] = v18;
  uint64_t v22 = sub_23C9911D0();
  if (!v22)
  {
    sub_23C952DEC();
    uint64_t v23 = (void *)swift_allocError();
    void *v24 = 0xD000000000000017;
    v24[1] = 0x800000023C997E20;
    uint64_t v25 = (void *)sub_23C990B20();

    objc_msgSend(a1, sel_failWithError_, v25);
    uint64_t v22 = (uint64_t)sub_23C989B04();
  }
  *(void *)&v3[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactLeadingMetricsRequest] = v22;
  uint64_t v26 = sub_23C9911D0();
  if (!v26)
  {
    sub_23C952DEC();
    double v27 = (void *)swift_allocError();
    *double v28 = 0xD000000000000018;
    v28[1] = 0x800000023C997E40;
    uint64_t v29 = (void *)sub_23C990B20();

    objc_msgSend(a1, sel_failWithError_, v29);
    uint64_t v26 = (uint64_t)sub_23C989B04();
  }
  *(void *)&v3[OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactTrailingMetricsRequest] = v26;

  v31.receiver = v3;
  v31.super_class = (Class)type metadata accessor for SystemApertureMetricsRequest();
  return objc_msgSendSuper2(&v31, sel_init);
}

id sub_23C96085C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v2 = *(void **)(*a1 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__expandedMetricsRequest);
  *a2 = v2;
  return v2;
}

void sub_23C960874(id *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
}

id sub_23C960894@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v2 = *(void **)(*a1 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactLeadingMetricsRequest);
  *a2 = v2;
  return v2;
}

void sub_23C9608AC(id *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
}

id sub_23C9608CC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v2 = *(void **)(*a1 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactTrailingMetricsRequest);
  *a2 = v2;
  return v2;
}

void sub_23C9608E4(id *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
}

id sub_23C960904@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v2 = *(void **)(*a1 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__minimalMetricsRequest);
  *a2 = v2;
  return v2;
}

void sub_23C96091C(id *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
}

__n128 sub_23C96093C@<Q0>(void *a1@<X0>, __n128 *a2@<X8>)
{
  uint64_t v3 = (__n128 *)(*a1 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionSize);
  swift_beginAccess();
  __n128 result = *v3;
  *a2 = *v3;
  return result;
}

uint64_t sub_23C960990(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = (void *)(*a2 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionSize);
  uint64_t result = swift_beginAccess();
  *uint64_t v4 = v2;
  v4[1] = v3;
  return result;
}

double sub_23C9609E8@<D0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (double *)(*a1 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionTopMargin);
  swift_beginAccess();
  double result = *v3;
  *a2 = *(void *)v3;
  return result;
}

uint64_t sub_23C960A3C(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a2 + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionTopMargin);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = v2;
  return result;
}

uint64_t method lookup function for SystemApertureMetricsRequest(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SystemApertureMetricsRequest);
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.expandedMetricsRequest.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.expandedMetricsRequest.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.expandedMetricsRequest.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.compactLeadingMetricsRequest.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.compactLeadingMetricsRequest.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.compactLeadingMetricsRequest.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.compactTrailingMetricsRequest.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.compactTrailingMetricsRequest.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.compactTrailingMetricsRequest.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.minimalMetricsRequest.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.minimalMetricsRequest.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.minimalMetricsRequest.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.obstructionSize.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.obstructionSize.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.obstructionSize.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.obstructionTopMargin.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.obstructionTopMargin.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.obstructionTopMargin.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.__allocating_init(obstructionSize:obstructionTopMargin:expandedMetricsRequest:compactLeadingMetricsRequest:compactTrailingMetricsRequest:minimalMetricsRequest:)()
{
  return (*(uint64_t (**)(void))(v0 + 368))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.copy(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.__allocating_init(xpcDictionary:)()
{
  return (*(uint64_t (**)(void))(v0 + 384))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.encode(withXPCDictionary:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of SystemApertureMetricsRequest.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 408))();
}

id sub_23C960F9C()
{
  if ((*((unsigned char *)v0 + OBJC_IVAR____TtC18ActivityUIServices28ActivityCancelTouchAssertion_isInvalidated) & 1) == 0) {
    objc_msgSend(v0, sel_invalidate);
  }
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityCancelTouchAssertion();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ActivityCancelTouchAssertion()
{
  return self;
}

void sub_23C9610B8()
{
  uint64_t v1 = OBJC_IVAR____TtC18ActivityUIServices28ActivityCancelTouchAssertion_isInvalidated;
  if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC18ActivityUIServices28ActivityCancelTouchAssertion_isInvalidated) & 1) == 0)
  {
    unint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC18ActivityUIServices28ActivityCancelTouchAssertion_assertions);
    if (v2 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v3 = sub_23C9913E0();
      if (v3) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v3)
      {
LABEL_4:
        if (v3 < 1)
        {
          __break(1u);
          return;
        }
        for (uint64_t i = 0; i != v3; ++i)
        {
          if ((v2 & 0xC000000000000001) != 0) {
            id v5 = (id)MEMORY[0x23ECEA1A0](i, v2);
          }
          else {
            id v5 = *(id *)(v2 + 8 * i + 32);
          }
          uint64_t v6 = v5;
          objc_msgSend(v5, sel_invalidate);
        }
      }
    }
    swift_bridgeObjectRelease();
    *(unsigned char *)(v0 + v1) = 1;
  }
}

id ActivityHostViewController.init(activitySceneDescriptor:)(void *a1)
{
  uint64_t v3 = sub_23C990D70();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C990D00();
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  *(_DWORD *)&v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController__presentationMode] = 0;
  v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_wantsBaseContentTouchEvents] = 0;
  *(void *)&v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_backgroundTintColor] = 0;
  *(void *)&v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_textColor] = 0;
  *(void *)&v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_resolvedMetrics] = 0;
  v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_idleTimerDisabled] = 0;
  *(void *)&v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_audioCategoriesDisablingVolumeHUD] = 0;
  v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_archivedActivityFamily] = 2;
  v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_baseContentTouchedDown] = 0;
  v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_actionButtonInitiated] = 0;
  uint64_t v9 = MEMORY[0x263F8EE78];
  *(void *)&v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activityTouchRestrictedRects] = MEMORY[0x263F8EE78];
  uint64_t v10 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_settingsDiffInspector;
  id v11 = objc_allocWithZone((Class)type metadata accessor for ActivitySceneClientSettingsDiffInspector());
  uint64_t v12 = v1;
  *(void *)&v1[v10] = objc_msgSend(v11, sel_init);
  *(void *)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene] = 0;
  v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneForeground] = 0;
  v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_invalidated] = 0;
  *(void *)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scenePresenter] = 0;
  *(void *)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activatedSceneView] = 0;
  *(void *)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_liveSceneSnapshotView] = 0;
  *(void *)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_debugLabel] = 0;
  *(void *)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_presentationAssertion] = 0;
  v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_waitingForArchiveContentReady] = 0;
  *(void *)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_waitingForArchiveContentReadyBlocks] = v9;
  *(void *)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_waitingForInitialContentSizeReadyBlocks] = v9;
  v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneActivated] = 0;
  *(void *)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneActivatedBlocks] = v9;
  uint64_t v13 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_touchDeliveryPolicyAssertions;
  *(void *)&v12[v13] = sub_23C9752F0(v9);
  uint64_t v14 = &v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController____lazy_storage___logIdentifier];
  *uint64_t v14 = 0;
  v14[1] = 0;
  *(void *)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController____lazy_storage___queue] = 0;
  *(void *)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_backOffTimer] = 0;
  *(void *)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_ensureContentTimer] = 0;
  *(void *)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneClientExitCountWithinTimeout] = 0;
  *(void *)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneClientExitTimer] = 0;
  v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_shouldShareTouchesWithHost] = 0;
  id v15 = &v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activitySceneDescriptor];
  *(void *)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activitySceneDescriptor] = a1;
  id v16 = a1;
  sub_23C990C30();
  sub_23C990CF0();
  sub_23C9753EC((uint64_t)v8);
  uint64_t v17 = sub_23C990D60();
  uint64_t v19 = v18;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  objc_super v20 = (uint64_t *)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_processResource];
  *objc_super v20 = v17;
  v20[1] = v19;
  swift_beginAccess();
  CGFloat v21 = *(void **)(*v15 + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_metricsRequest);
  *(void *)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_systemProvidedMetrics] = v21;
  id v22 = v21;

  uint64_t v23 = (objc_class *)type metadata accessor for ActivityHostViewController();
  v38.receiver = v12;
  v38.super_class = v23;
  id v24 = objc_msgSendSuper2(&v38, sel_initWithNibName_bundle_, 0, 0);
  uint64_t v25 = qword_26AF22748;
  id v26 = v24;
  if (v25 != -1) {
    swift_once();
  }
  uint64_t v27 = sub_23C990E40();
  __swift_project_value_buffer(v27, (uint64_t)qword_26AF22728);
  id v28 = v26;
  uint64_t v29 = sub_23C990E20();
  os_log_type_t v30 = sub_23C991140();
  if (os_log_type_enabled(v29, v30))
  {
    objc_super v31 = (uint8_t *)swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    uint64_t v37 = v32;
    *(_DWORD *)objc_super v31 = 136446210;
    uint64_t v33 = sub_23C96245C();
    v36[1] = sub_23C9733B0(v33, v34, &v37);
    sub_23C991240();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C948000, v29, v30, "[%{public}s] Created", v31, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEADB0](v32, -1, -1);
    MEMORY[0x23ECEADB0](v31, -1, -1);
  }
  else
  {
  }
  sub_23C9647D8();

  return v28;
}

uint64_t sub_23C961734()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_delegate;
  swift_beginAccess();
  return MEMORY[0x23ECEAE20](v1);
}

uint64_t sub_23C961780()
{
  return swift_unknownObjectRelease();
}

void (*sub_23C9617DC(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_delegate;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x23ECEAE20](v5);
  return sub_23C9556BC;
}

id sub_23C961860()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activitySceneDescriptor);
  swift_beginAccess();
  unint64_t v2 = *v1;
  return v2;
}

uint64_t sub_23C9618B8()
{
  uint64_t v1 = sub_23C990C60();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C959038(0, (unint64_t *)&qword_26AF227D0);
  uint64_t v5 = (void *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activitySceneDescriptor);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, *v5 + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityDescriptor, v1);
  return sub_23C9911B0();
}

uint64_t sub_23C9619D8()
{
  return *(unsigned int *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController__presentationMode);
}

void sub_23C9619E8(uint64_t a1)
{
  BSDispatchQueueAssertMain();
  sub_23C965288(a1, 0);
}

void (*sub_23C961A24(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(v1
                                  + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController__presentationMode);
  return sub_23C961A58;
}

void sub_23C961A58(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 8);
  BSDispatchQueueAssertMain();
  sub_23C965288(v1, 0);
}

uint64_t sub_23C961A8C()
{
  uint64_t v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_wantsBaseContentTouchEvents);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_23C961AD4(char a1)
{
  int v3 = a1 & 1;
  uint64_t v4 = (unsigned char *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_wantsBaseContentTouchEvents);
  uint64_t result = swift_beginAccess();
  int v6 = *v4;
  *uint64_t v4 = a1;
  if (v6 != v3)
  {
    uint64_t v7 = swift_allocObject();
    swift_unknownObjectWeakInit();
    BSDispatchQueueAssertMain();
    uint64_t v8 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene);
    if (v8)
    {
      uint64_t v9 = swift_allocObject();
      *(void *)(v9 + 16) = sub_23C9754A4;
      *(void *)(v9 + 24) = v7;
      uint64_t v10 = swift_allocObject();
      *(void *)(v10 + 16) = sub_23C9754BC;
      *(void *)(v10 + 24) = v9;
      aBlock[4] = sub_23C9754BC;
      aBlock[5] = v10;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_23C96EF18;
      aBlock[3] = &block_descriptor_1;
      id v11 = _Block_copy(aBlock);
      id v12 = v8;
      swift_retain();
      swift_release();
      objc_msgSend(v12, sel_performUpdate_, v11);

      _Block_release(v11);
      LOBYTE(v11) = swift_isEscapingClosureAtFileLocation();
      swift_release();
      swift_release();
      uint64_t result = swift_release();
      if ((v11 & 1) == 0) {
        return result;
      }
      __break(1u);
    }
    return swift_release();
  }
  return result;
}

void (*sub_23C961CBC(void *a1))(uint64_t a1)
{
  int v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[3] = v1;
  uint64_t v4 = (unsigned char *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_wantsBaseContentTouchEvents);
  swift_beginAccess();
  *((unsigned char *)v3 + 32) = *v4;
  return sub_23C961D3C;
}

void sub_23C961D3C(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  sub_23C961AD4(*(unsigned char *)(*(void *)a1 + 32));
  free(v1);
}

void *sub_23C961D7C()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_backgroundTintColor);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void *sub_23C961DCC()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_textColor);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void *sub_23C961E1C()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_resolvedMetrics);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

uint64_t sub_23C961E6C()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_idleTimerDisabled);
  swift_beginAccess();
  return *v1;
}

void *sub_23C961EB4(unsigned __int8 a1)
{
  id v3 = (unsigned __int8 *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_idleTimerDisabled);
  swift_beginAccess();
  *id v3 = a1;
  BSDispatchQueueAssertMain();
  uint64_t v4 = v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_delegate;
  swift_beginAccess();
  uint64_t result = (void *)MEMORY[0x23ECEAE20](v4);
  if (result)
  {
    objc_msgSend(result, sel_activityHostViewControllerWithViewController_didSetIdleTimerDisabled_, v1, *v3);
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_23C961F58()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23C961FA4@<X0>(unsigned char *a1@<X8>)
{
  id v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_archivedActivityFamily);
  uint64_t result = swift_beginAccess();
  *a1 = *v3;
  return result;
}

uint64_t sub_23C961FF4()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_baseContentTouchedDown);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_23C96203C()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_actionButtonInitiated);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_23C962084()
{
  return swift_bridgeObjectRetain();
}

id sub_23C9620D0()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_systemProvidedMetrics);
  swift_beginAccess();
  uint64_t v2 = *v1;
  return v2;
}

void sub_23C962128(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_systemProvidedMetrics);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = a1;
}

uint64_t (*sub_23C96217C())()
{
  return j__swift_endAccess;
}

id sub_23C9621D8()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activitySceneDescriptor);
  swift_beginAccess();
  uint64_t v2 = (char *)*v1;
  if (*(void *)((char *)*v1 + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activitySceneType) == 2
    && (id v3 = *(char **)&v2[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_metricsRequest],
        (uint64_t v4 = *(char **)&v3[OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics]) != 0))
  {
    double v5 = *(double *)(*(void *)&v4[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest]
                   + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum);
    int v6 = (double *)&v4[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_scaleFactor];
    swift_beginAccess();
    double v7 = v5 * *v6;
    double v8 = *v6
       * *(double *)(*(void *)&v4[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__heightRequest]
                   + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum);
    uint64_t v9 = &v4[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_cornerRadius];
    swift_beginAccess();
    uint64_t v10 = *(void *)v9;
    id v11 = *(void **)&v4[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__edgeInsets];
    id v12 = (objc_class *)type metadata accessor for ActivitySceneMetrics();
    uint64_t v13 = (char *)objc_allocWithZone(v12);
    uint64_t v14 = (void **)&v13[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets];
    *(void *)&v13[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets] = 0;
    id v15 = (double *)&v13[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size];
    *id v15 = v7;
    v15[1] = v8;
    *(void *)&v13[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius] = v10;
    swift_beginAccess();
    id v16 = *v14;
    *uint64_t v14 = v11;
    uint64_t v17 = v11;
    uint64_t v18 = v3;
    uint64_t v19 = v4;

    v26.receiver = v13;
    v26.super_class = v12;
    id v20 = objc_msgSendSuper2(&v26, sel_init);
  }
  else
  {
    CGFloat v21 = (objc_class *)type metadata accessor for ActivitySceneMetrics();
    id v22 = (char *)objc_allocWithZone(v21);
    uint64_t v23 = (void **)&v22[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets];
    *(void *)&v22[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets] = 0;
    *(_OWORD *)&v22[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size] = xmmword_23C994F40;
    *(void *)&v22[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius] = 0x4028000000000000;
    swift_beginAccess();
    id v24 = *v23;
    *uint64_t v23 = 0;
    uint64_t v17 = v2;

    v27.receiver = v22;
    v27.super_class = v21;
    id v20 = objc_msgSendSuper2(&v27, sel_init);
  }

  return v20;
}

uint64_t sub_23C96245C()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController____lazy_storage___logIdentifier);
  if (*(void *)(v0
                 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController____lazy_storage___logIdentifier
                 + 8))
  {
    uint64_t v2 = *v1;
  }
  else
  {
    sub_23C991370();
    sub_23C991000();
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_23C991000();
    swift_bridgeObjectRelease();
    uint64_t v2 = 0;
    *uint64_t v1 = 0;
    v1[1] = 0xE000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

id sub_23C962570()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_23C991170();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  double v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_23C991160();
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = sub_23C990F50();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v8 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController____lazy_storage___queue;
  uint64_t v9 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController____lazy_storage___queue);
  if (v9)
  {
    id v10 = *(id *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController____lazy_storage___queue);
  }
  else
  {
    uint64_t v19 = v3;
    v18[3] = sub_23C959038(0, &qword_26AF227C0);
    uint64_t v11 = sub_23C96245C();
    v18[1] = v12;
    v18[2] = v11;
    if (qword_26AF22700 != -1) {
      swift_once();
    }
    v18[0] = qword_26AF22FC8;
    id v13 = (id)qword_26AF22FC8;
    sub_23C990F40();
    uint64_t v20 = MEMORY[0x263F8EE78];
    sub_23C97764C((unint64_t *)&unk_26AF227B0, MEMORY[0x263F8F0F8]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF22788);
    sub_23C977AB0(&qword_26AF22790, &qword_26AF22788);
    sub_23C991280();
    (*(void (**)(char *, void, uint64_t))(v19 + 104))(v5, *MEMORY[0x263F8F130], v2);
    uint64_t v14 = (void *)sub_23C9911A0();
    id v15 = *(void **)(v1 + v8);
    *(void *)(v1 + v8) = v14;
    id v10 = v14;

    uint64_t v9 = 0;
  }
  id v16 = v9;
  return v10;
}

void sub_23C962838(void *a1, uint64_t a2, void *a3, double a4)
{
  uint64_t v137 = a2;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v8 = sub_23C990D70();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v137 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_23C990D00();
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v137 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  BSDispatchQueueAssertMain();
  if (qword_26AF22748 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_23C990E40();
  uint64_t v16 = __swift_project_value_buffer(v15, (uint64_t)qword_26AF22728);
  uint64_t v17 = v4;
  uint64_t v142 = v16;
  uint64_t v18 = sub_23C990E20();
  os_log_type_t v19 = sub_23C991140();
  BOOL v20 = os_log_type_enabled(v18, v19);
  uint64_t v140 = (uint8_t *)v8;
  uint64_t v139 = v9;
  id v143 = a3;
  uint64_t v138 = a1;
  if (v20)
  {
    CGFloat v21 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    *(void *)&long long aBlock = v22;
    *(_DWORD *)CGFloat v21 = 136446210;
    uint64_t v23 = sub_23C96245C();
    *(void *)&v144[0] = sub_23C9733B0(v23, v24, (uint64_t *)&aBlock);
    sub_23C991240();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C948000, v18, v19, "[%{public}s] Ensure content begin", v21, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEADB0](v22, -1, -1);
    MEMORY[0x23ECEADB0](v21, -1, -1);
  }
  else
  {
  }
  uint64_t v25 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene;
  if (!*(void *)&v17[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene]) {
    sub_23C965288(*(unsigned int *)&v17[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController__presentationMode], 1);
  }
  id v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29CF8]), sel_init);
  if (qword_268BBA4B0 != -1) {
    swift_once();
  }
  objc_super v27 = (void *)sub_23C990FC0();
  objc_msgSend(v26, sel_addMilestone_, v27);

  id v28 = (void *)swift_allocObject();
  uint64_t v29 = v138;
  v28[2] = v26;
  v28[3] = v29;
  uint64_t v30 = v137;
  v28[4] = v17;
  v28[5] = v30;
  v28[6] = v143;
  uint64_t v148 = sub_23C97555C;
  uint64_t v149 = v28;
  *(void *)&long long aBlock = MEMORY[0x263EF8330];
  *((void *)&aBlock + 1) = 1107296256;
  *(void *)&long long v147 = sub_23C96B678;
  *((void *)&v147 + 1) = &block_descriptor_12;
  objc_super v31 = _Block_copy(&aBlock);
  uint64_t v32 = v17;
  id v33 = v26;
  id v34 = v29;
  swift_retain();
  swift_release();
  id v143 = v33;
  objc_msgSend(v33, sel_setCompletionBlock_, v31);
  _Block_release(v31);
  uint64_t v35 = &v32[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activitySceneDescriptor];
  swift_beginAccess();
  sub_23C990C30();
  sub_23C990CF0();
  sub_23C9753EC((uint64_t)v14);
  uint64_t v36 = sub_23C990D60();
  uint64_t v38 = v37;
  (*(void (**)(char *, uint8_t *))(v139 + 8))(v11, v140);
  if (v36 == 0xD000000000000011 && v38 == 0x800000023C997380)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v39 = sub_23C9914F0();
    swift_bridgeObjectRelease();
    if ((v39 & 1) == 0)
    {
      if (*(void *)(*(void *)v35 + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activitySceneType) > 1uLL) {
        goto LABEL_41;
      }
      unsigned int v47 = (void *)sub_23C990FC0();
      id v48 = v143;
      objc_msgSend(v143, sel_addMilestone_, v47);

      uint64_t v49 = *(void **)&v17[v25];
      if (v49)
      {
        id v50 = objc_msgSend(v49, sel_clientSettings);
        if (v50)
        {
          v51 = v50;
          type metadata accessor for ActivitySceneClientSettings();
          uint64_t v52 = (void *)swift_dynamicCastClass();
          if (v52)
          {
            id v53 = objc_msgSend(v52, sel_otherSettings);
            swift_beginAccess();
            if (objc_msgSend(v53, sel_objectForSetting_, qword_268BBAF88))
            {
              sub_23C991270();
              swift_unknownObjectRelease();
              sub_23C95CAC4(v144, &aBlock);
            }
            else
            {
              long long aBlock = 0u;
              long long v147 = 0u;
            }
            __swift_instantiateConcreteTypeFromMangledName(&qword_26AF22BA0);
            type metadata accessor for ActivitySceneMetrics();
            if (swift_dynamicCast())
            {
              v115 = v145;

              if (v115)
              {

                uint64_t v116 = v32;
                uint64_t v117 = sub_23C990E20();
                os_log_type_t v118 = sub_23C991140();
                if (os_log_type_enabled(v117, v118))
                {
                  unsigned int v119 = (uint8_t *)swift_slowAlloc();
                  uint64_t v120 = swift_slowAlloc();
                  *(void *)&long long aBlock = v120;
                  *(_DWORD *)unsigned int v119 = 136446210;
                  uint64_t v140 = v119 + 4;
                  uint64_t v121 = sub_23C96245C();
                  *(void *)&v144[0] = sub_23C9733B0(v121, v122, (uint64_t *)&aBlock);
                  sub_23C991240();

                  swift_bridgeObjectRelease();
                  _os_log_impl(&dword_23C948000, v117, v118, "[%{public}s] Ensure content: initial content size ready", v119, 0xCu);
                  swift_arrayDestroy();
                  MEMORY[0x23ECEADB0](v120, -1, -1);
                  MEMORY[0x23ECEADB0](v119, -1, -1);
                }
                else
                {
                }
                uint64_t v114 = (void *)sub_23C990FC0();
                objc_msgSend(v48, sel_satisfyMilestone_, v114, v137);
                goto LABEL_59;
              }
            }
            else
            {
              uint64_t v145 = 0;
            }
          }
          else
          {
          }
        }
      }
      id v123 = v32;
      v124 = sub_23C990E20();
      os_log_type_t v125 = sub_23C991140();
      if (os_log_type_enabled(v124, v125))
      {
        uint64_t v126 = (uint8_t *)swift_slowAlloc();
        uint64_t v127 = swift_slowAlloc();
        *(void *)&long long aBlock = v127;
        *(_DWORD *)uint64_t v126 = 136446210;
        uint64_t v128 = sub_23C96245C();
        *(void *)&v144[0] = sub_23C9733B0(v128, v129, (uint64_t *)&aBlock);
        id v48 = v143;
        sub_23C991240();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23C948000, v124, v125, "[%{public}s] Ensure content: waiting on initial content size", v126, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23ECEADB0](v127, -1, -1);
        MEMORY[0x23ECEADB0](v126, -1, -1);
      }
      else
      {
      }
      uint64_t v69 = (void *)swift_allocObject();
      v69[2] = v123;
      v69[3] = v48;
      v69[4] = ObjectType;
      v130 = &v123[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_waitingForInitialContentSizeReadyBlocks];
      swift_beginAccess();
      uint64_t v131 = *(void **)v130;
      v132 = v123;
      id v133 = v48;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)v130 = v131;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t v131 = sub_23C973200(0, v131[2] + 1, 1, v131);
        *(void *)v130 = v131;
      }
      unint64_t v136 = v131[2];
      unint64_t v135 = v131[3];
      if (v136 >= v135 >> 1)
      {
        uint64_t v131 = sub_23C973200((void *)(v135 > 1), v136 + 1, 1, v131);
        *(void *)v130 = v131;
      }
      v131[2] = v136 + 1;
      uint64_t v77 = &v131[2 * v136];
      unsigned int v78 = sub_23C9755F8;
LABEL_40:
      v77[4] = v78;
      v77[5] = v69;
      swift_endAccess();
      goto LABEL_41;
    }
  }
  uint64_t v40 = (void *)sub_23C990FC0();
  id v41 = v143;
  objc_msgSend(v143, sel_addMilestone_, v40);

  v42 = *(void **)&v17[v25];
  if (!v42) {
    goto LABEL_32;
  }
  id v43 = objc_msgSend(v42, sel_clientSettings);
  if (!v43) {
    goto LABEL_32;
  }
  uint64_t v44 = v43;
  type metadata accessor for ActivitySceneClientSettings();
  uint64_t v45 = (void *)swift_dynamicCastClass();
  if (!v45)
  {

    goto LABEL_32;
  }
  id v46 = objc_msgSend(v45, sel_otherSettings);
  swift_beginAccess();
  if (objc_msgSend(v46, sel_objectForSetting_, qword_268BBAF58))
  {
    sub_23C991270();
    swift_unknownObjectRelease();
    sub_23C95CAC4(v144, &aBlock);
  }
  else
  {
    long long aBlock = 0u;
    long long v147 = 0u;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF22BA0);
  if ((swift_dynamicCast() & 1) == 0)
  {
    LOBYTE(v145) = 2;

    goto LABEL_32;
  }
  char v54 = (char)v145;

  if ((v54 & 1) == 0)
  {
LABEL_32:
    uint64_t v62 = v32;
    uint64_t v63 = sub_23C990E20();
    os_log_type_t v64 = sub_23C991140();
    if (os_log_type_enabled(v63, v64))
    {
      uint64_t v65 = (uint8_t *)swift_slowAlloc();
      uint64_t v66 = swift_slowAlloc();
      *(void *)&long long aBlock = v66;
      *(_DWORD *)uint64_t v65 = 136446210;
      uint64_t v67 = sub_23C96245C();
      *(void *)&v144[0] = sub_23C9733B0(v67, v68, (uint64_t *)&aBlock);
      id v41 = v143;
      sub_23C991240();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23C948000, v63, v64, "[%{public}s] Ensure content: waiting on content ready", v65, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23ECEADB0](v66, -1, -1);
      MEMORY[0x23ECEADB0](v65, -1, -1);
    }
    else
    {
    }
    uint64_t v69 = (void *)swift_allocObject();
    v69[2] = v62;
    v69[3] = v41;
    v69[4] = ObjectType;
    uint64_t v70 = &v62[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_waitingForArchiveContentReadyBlocks];
    swift_beginAccess();
    os_log_type_t v71 = *(void **)v70;
    objc_super v72 = v62;
    id v73 = v41;
    char v74 = swift_isUniquelyReferenced_nonNull_native();
    *(void *)uint64_t v70 = v71;
    if ((v74 & 1) == 0)
    {
      os_log_type_t v71 = sub_23C973200(0, v71[2] + 1, 1, v71);
      *(void *)uint64_t v70 = v71;
    }
    unint64_t v76 = v71[2];
    unint64_t v75 = v71[3];
    if (v76 >= v75 >> 1)
    {
      os_log_type_t v71 = sub_23C973200((void *)(v75 > 1), v76 + 1, 1, v71);
      *(void *)uint64_t v70 = v71;
    }
    v71[2] = v76 + 1;
    uint64_t v77 = &v71[2 * v76];
    unsigned int v78 = sub_23C975638;
    goto LABEL_40;
  }
  id v55 = v32;
  uint64_t v56 = sub_23C990E20();
  os_log_type_t v57 = sub_23C991140();
  if (os_log_type_enabled(v56, v57))
  {
    uint64_t v58 = (uint8_t *)swift_slowAlloc();
    uint64_t v59 = swift_slowAlloc();
    *(void *)&long long aBlock = v59;
    *(_DWORD *)uint64_t v58 = 136446210;
    uint64_t v140 = v58 + 4;
    uint64_t v60 = sub_23C96245C();
    *(void *)&v144[0] = sub_23C9733B0(v60, v61, (uint64_t *)&aBlock);
    sub_23C991240();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C948000, v56, v57, "[%{public}s] Ensure content: archive content ready", v58, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEADB0](v59, -1, -1);
    MEMORY[0x23ECEADB0](v58, -1, -1);
  }
  else
  {
  }
  uint64_t v114 = (void *)sub_23C990FC0();
  objc_msgSend(v41, sel_satisfyMilestone_, v114, v137);
LABEL_59:

LABEL_41:
  int v79 = v32[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneActivated];
  uint64_t v80 = v32;
  uint64_t v81 = sub_23C990E20();
  os_log_type_t v82 = sub_23C991140();
  BOOL v83 = os_log_type_enabled(v81, v82);
  if (v79 == 1)
  {
    id v84 = v143;
    if (v83)
    {
      uint64_t v85 = (uint8_t *)swift_slowAlloc();
      uint64_t v86 = swift_slowAlloc();
      *(void *)&long long aBlock = v86;
      *(_DWORD *)uint64_t v85 = 136446210;
      uint64_t v87 = sub_23C96245C();
      *(void *)&v144[0] = sub_23C9733B0(v87, v88, (uint64_t *)&aBlock);
      sub_23C991240();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23C948000, v81, v82, "[%{public}s] Ensure content: scene activated", v85, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23ECEADB0](v86, -1, -1);
      MEMORY[0x23ECEADB0](v85, -1, -1);
    }
    else
    {
    }
    int64_t v93 = (void *)sub_23C990FC0();
    objc_msgSend(v84, sel_satisfyMilestone_, v93);
  }
  else
  {
    id v84 = v143;
    if (v83)
    {
      uint64_t v89 = (uint8_t *)swift_slowAlloc();
      uint64_t v90 = swift_slowAlloc();
      *(void *)&long long aBlock = v90;
      *(_DWORD *)uint64_t v89 = 136446210;
      uint64_t v91 = sub_23C96245C();
      *(void *)&v144[0] = sub_23C9733B0(v91, v92, (uint64_t *)&aBlock);
      sub_23C991240();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23C948000, v81, v82, "[%{public}s] Ensure content: waiting on scene activation", v89, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23ECEADB0](v90, -1, -1);
      MEMORY[0x23ECEADB0](v89, -1, -1);
    }
    else
    {
    }
    unint64_t v94 = (void *)swift_allocObject();
    v94[2] = v80;
    v94[3] = v84;
    v94[4] = ObjectType;
    uint64_t v95 = &v80[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneActivatedBlocks];
    swift_beginAccess();
    uint64_t v96 = *(void **)v95;
    v97 = v80;
    id v98 = v84;
    char v99 = swift_isUniquelyReferenced_nonNull_native();
    *(void *)uint64_t v95 = v96;
    if ((v99 & 1) == 0)
    {
      uint64_t v96 = sub_23C973200(0, v96[2] + 1, 1, v96);
      *(void *)uint64_t v95 = v96;
    }
    unint64_t v101 = v96[2];
    unint64_t v100 = v96[3];
    if (v101 >= v100 >> 1)
    {
      uint64_t v96 = sub_23C973200((void *)(v100 > 1), v101 + 1, 1, v96);
      *(void *)uint64_t v95 = v96;
    }
    v96[2] = v101 + 1;
    v102 = &v96[2 * v101];
    v102[4] = sub_23C9755AC;
    v102[5] = v94;
    swift_endAccess();
  }
  objc_msgSend(v84, sel_begin, v137);
  uint64_t v103 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_ensureContentTimer;
  objc_msgSend(*(id *)&v80[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_ensureContentTimer], sel_invalidate);
  id v104 = objc_allocWithZone(MEMORY[0x263F29BA8]);
  v105 = (void *)sub_23C990FC0();
  id v106 = objc_msgSend(v104, sel_initWithIdentifier_, v105);

  v107 = *(void **)&v80[v103];
  *(void *)&v80[v103] = v106;

  char v108 = *(void **)&v80[v103];
  if (v108)
  {
    sub_23C959038(0, &qword_26AF227C0);
    id v109 = v108;
    uint64_t v110 = sub_23C991180();
    uint64_t v111 = swift_allocObject();
    *(void *)(v111 + 16) = v84;
    uint64_t v148 = sub_23C9755F0;
    uint64_t v149 = (void *)v111;
    *(void *)&long long aBlock = MEMORY[0x263EF8330];
    *((void *)&aBlock + 1) = 1107296256;
    *(void *)&long long v147 = sub_23C95E08C;
    *((void *)&v147 + 1) = &block_descriptor_21;
    unsigned __int8 v112 = _Block_copy(&aBlock);
    id v113 = v84;
    swift_release();
    objc_msgSend(v109, sel_scheduleWithFireInterval_leewayInterval_queue_handler_, v110, v112, a4, 0.0);

    _Block_release(v112);
    id v84 = (id)v110;
  }
}

id sub_23C963BAC()
{
  BSDispatchQueueAssertMain();
  id result = *(id *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene);
  if (result) {
    return objc_msgSend(result, sel_backlightSceneHostEnvironment);
  }
  return result;
}

void sub_23C963BE8()
{
  BSDispatchQueueAssertMain();
  uint64_t v1 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_invalidated;
  if ((*((unsigned char *)v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_invalidated) & 1) == 0)
  {
    if (qword_26AF22748 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_23C990E40();
    __swift_project_value_buffer(v2, (uint64_t)qword_26AF22728);
    uint64_t v3 = v0;
    uint64_t v4 = sub_23C990E20();
    os_log_type_t v5 = sub_23C991140();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v7 = swift_slowAlloc();
      v19[0] = v7;
      *(_DWORD *)uint64_t v6 = 136446210;
      uint64_t v8 = sub_23C96245C();
      sub_23C9733B0(v8, v9, v19);
      sub_23C991240();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23C948000, v4, v5, "[%{public}s] Invalidated", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23ECEADB0](v7, -1, -1);
      MEMORY[0x23ECEADB0](v6, -1, -1);
    }
    else
    {
    }
    swift_beginAccess();
    swift_unknownObjectWeakAssign();
    *((unsigned char *)v0 + v1) = 1;
    sub_23C967170();
    uint64_t v10 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_backOffTimer;
    uint64_t v11 = *(void *)&v3[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_backOffTimer];
    if (v11)
    {
      uint64_t v12 = *(void **)(v11 + 16);
      swift_retain();
      objc_msgSend(v12, sel_invalidate);
      uint64_t v13 = *(void **)(v11 + 16);
      *(void *)(v11 + 16) = 0;

      objc_msgSend(*(id *)(v11 + 88), sel_invalidate);
      uint64_t v14 = *(void **)(v11 + 88);
      *(void *)(v11 + 88) = 0;
      swift_release();
    }
    *(void *)&v3[v10] = 0;
    swift_release();
    uint64_t v15 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_ensureContentTimer;
    objc_msgSend(*(id *)&v3[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_ensureContentTimer], sel_invalidate);
    uint64_t v16 = *(void **)&v3[v15];
    *(void *)&v3[v15] = 0;

    uint64_t v17 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneClientExitTimer;
    objc_msgSend(*(id *)&v3[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneClientExitTimer], sel_invalidate);
    uint64_t v18 = *(void **)&v3[v17];
    *(void *)&v3[v17] = 0;
  }
}

uint64_t sub_23C963E8C()
{
  uint64_t v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_shouldShareTouchesWithHost);
  swift_beginAccess();
  return *v1;
}

void sub_23C963ED4(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_shouldShareTouchesWithHost);
  swift_beginAccess();
  *uint64_t v3 = a1;
  BSDispatchQueueAssertMain();
  if (*v3 == 1) {
    sub_23C9679D8();
  }
  else {
    sub_23C9681C4();
  }
}

void (*sub_23C963F44(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_shouldShareTouchesWithHost;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_23C963FB0;
}

void sub_23C963FB0(void **a1, char a2)
{
  uint64_t v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    uint64_t v5 = v3[3];
    uint64_t v4 = v3[4];
    BSDispatchQueueAssertMain();
    if (*(unsigned char *)(v5 + v4) == 1) {
      sub_23C9679D8();
    }
    else {
      sub_23C9681C4();
    }
  }
  free(v3);
}

void sub_23C964020()
{
  uint64_t v1 = sub_23C990B50();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  BSDispatchQueueAssertMain();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v0;
  id v41 = sub_23C975678;
  uint64_t v42 = v5;
  *(void *)&long long aBlock = MEMORY[0x263EF8330];
  *((void *)&aBlock + 1) = 1107296256;
  char v39 = sub_23C968FA8;
  uint64_t v40 = &block_descriptor_34;
  uint64_t v6 = _Block_copy(&aBlock);
  uint64_t v7 = v0;
  swift_release();
  id v8 = (id)BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler();
  _Block_release(v6);
  id v9 = objc_msgSend(v7, sel_view);
  if (!v9)
  {
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v10 = v9;
  id v11 = objc_msgSend(v9, sel_window);

  if (!v11)
  {
LABEL_18:
    swift_unknownObjectRelease();
    return;
  }
  if (!v8)
  {

    return;
  }
  uint64_t v12 = *(void **)&v7[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene];
  if (!v12)
  {

    goto LABEL_18;
  }
  uint64_t v32 = v2;
  uint64_t v33 = v1;
  uint64_t v13 = (void *)*MEMORY[0x263F83300];
  if (!*MEMORY[0x263F83300])
  {
LABEL_20:
    __break(1u);
    return;
  }
  swift_unknownObjectRetain();
  id v14 = v12;
  id v31 = v11;
  objc_msgSend(v13, sel__initialTouchTimestampForWindow_, v11);
  double v16 = v15;
  id v30 = v14;
  id v17 = objc_msgSend(v14, sel_layerManager);
  id v18 = objc_msgSend(v17, sel_layers);

  uint64_t v37 = MEMORY[0x263F8EE78];
  id v29 = v18;
  sub_23C991110();
  sub_23C990B40();
  while (v40)
  {
    sub_23C95CAC4(&aBlock, &v35);
    sub_23C959038(0, &qword_26AF22798);
    if (swift_dynamicCast())
    {
      id v20 = v34;
      id v21 = objc_msgSend(v34, sel_contextID);
      id v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F298B8]), sel_init);
      id v23 = objc_msgSend(self, sel_policyCancelingTouchesDeliveredToContextId_withInitialTouchTimestamp_, v21, v16);
      unint64_t v24 = v23;
      if (v23)
      {
        id v25 = v23;
        objc_msgSend(v25, sel_setAssertionEndpoint_, objc_msgSend(v22, sel_endpoint));

        swift_unknownObjectRelease();
      }
      objc_msgSend(v8, sel_ipc_addPolicy_, v24);
      id v19 = v22;
      MEMORY[0x23ECE9EA0]();
      if (*(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_23C9910A0();
      }
      sub_23C9910B0();
      sub_23C991090();
    }
    sub_23C990B40();
  }
  (*(void (**)(char *, uint64_t))(v32 + 8))(v4, v33);
  uint64_t v26 = v37;
  objc_super v27 = (objc_class *)type metadata accessor for ActivityCancelTouchAssertion();
  id v28 = objc_allocWithZone(v27);
  v28[OBJC_IVAR____TtC18ActivityUIServices28ActivityCancelTouchAssertion_isInvalidated] = 0;
  *(void *)&v28[OBJC_IVAR____TtC18ActivityUIServices28ActivityCancelTouchAssertion_assertions] = v26;
  v36.receiver = v28;
  v36.super_class = v27;
  objc_msgSendSuper2(&v36, sel_init);

  swift_unknownObjectRelease_n();
}

void sub_23C9644C4()
{
  id v1 = objc_msgSend(objc_allocWithZone((Class)ACUISHandleLiveActivityDoubleTapAction), sel_init);
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene];
  id v19 = v1;
  if (v2)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF22B60);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_23C994F50;
    *(void *)(inited + 32) = v19;
    unint64_t v20 = inited;
    sub_23C991090();
    if (v20 >> 62)
    {
      id v15 = v2;
      id v16 = v19;
      swift_bridgeObjectRetain();
      uint64_t v17 = sub_23C9913E0();
      swift_bridgeObjectRelease();
      if (!v17) {
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v4 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
      id v5 = v2;
      id v6 = v19;
      if (!v4)
      {
LABEL_13:
        swift_bridgeObjectRelease();
        sub_23C959038(0, (unint64_t *)&unk_26AF227F0);
        sub_23C975BB4();
        id v18 = (void *)sub_23C9910D0();
        swift_bridgeObjectRelease();
        objc_msgSend(v2, sel_sendActions_, v18);

        return;
      }
    }
    sub_23C975858(v20);
    goto LABEL_13;
  }
  if (qword_26AF22748 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_23C990E40();
  __swift_project_value_buffer(v7, (uint64_t)qword_26AF22728);
  id v8 = v0;
  id v9 = sub_23C990E20();
  os_log_type_t v10 = sub_23C991130();
  if (os_log_type_enabled(v9, v10))
  {
    id v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    unint64_t v20 = v12;
    *(_DWORD *)id v11 = 136446210;
    uint64_t v13 = sub_23C96245C();
    sub_23C9733B0(v13, v14, (uint64_t *)&v20);
    sub_23C991240();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C948000, v9, v10, "[%{public}s] Did fail to send Double Tap BSAction.", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEADB0](v12, -1, -1);
    MEMORY[0x23ECEADB0](v11, -1, -1);
  }
  else
  {
  }
}

uint64_t sub_23C9647D8()
{
  uint64_t v1 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_settingsDiffInspector;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_settingsDiffInspector);
  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  uint64_t v4 = qword_268BBAF28;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = sub_23C977C14;
  *(void *)(v5 + 24) = v3;
  uint64_t v65 = sub_23C977C60;
  uint64_t v66 = v5;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v62 = 1107296256;
  uint64_t v63 = sub_23C983C00;
  os_log_type_t v64 = &block_descriptor_313;
  id v6 = _Block_copy(&aBlock);
  id v7 = v2;
  swift_retain_n();
  swift_release();
  objc_msgSend(v7, sel_observeOtherSetting_withBlock_, v4, v6);
  _Block_release(v6);

  swift_release_n();
  id v8 = *(void **)(v0 + v1);
  uint64_t v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  uint64_t v10 = qword_268BBAF40;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_23C977C68;
  *(void *)(v11 + 24) = v9;
  uint64_t v65 = sub_23C978060;
  uint64_t v66 = v11;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v62 = 1107296256;
  uint64_t v63 = sub_23C983C00;
  os_log_type_t v64 = &block_descriptor_321;
  uint64_t v12 = _Block_copy(&aBlock);
  id v13 = v8;
  swift_retain_n();
  swift_release();
  objc_msgSend(v13, sel_observeOtherSetting_withBlock_, v10, v12);
  _Block_release(v12);

  swift_release_n();
  unint64_t v14 = *(void **)(v0 + v1);
  uint64_t v15 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  uint64_t v16 = qword_268BBAF58;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = sub_23C977CB4;
  *(void *)(v17 + 24) = v15;
  uint64_t v65 = sub_23C978060;
  uint64_t v66 = v17;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v62 = 1107296256;
  uint64_t v63 = sub_23C983C00;
  os_log_type_t v64 = &block_descriptor_329;
  id v18 = _Block_copy(&aBlock);
  id v19 = v14;
  swift_retain_n();
  swift_release();
  objc_msgSend(v19, sel_observeOtherSetting_withBlock_, v16, v18);
  _Block_release(v18);

  swift_release_n();
  unint64_t v20 = *(void **)(v0 + v1);
  uint64_t v21 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  uint64_t v22 = qword_268BBAF88;
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = sub_23C977CC0;
  *(void *)(v23 + 24) = v21;
  uint64_t v65 = sub_23C978060;
  uint64_t v66 = v23;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v62 = 1107296256;
  uint64_t v63 = sub_23C983C00;
  os_log_type_t v64 = &block_descriptor_337;
  unint64_t v24 = _Block_copy(&aBlock);
  id v25 = v20;
  swift_retain_n();
  swift_release();
  objc_msgSend(v25, sel_observeOtherSetting_withBlock_, v22, v24);
  _Block_release(v24);

  swift_release_n();
  uint64_t v26 = *(void **)(v0 + v1);
  uint64_t v27 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  uint64_t v28 = qword_268BBAFA0;
  uint64_t v29 = swift_allocObject();
  *(void *)(v29 + 16) = sub_23C977CCC;
  *(void *)(v29 + 24) = v27;
  uint64_t v65 = sub_23C978060;
  uint64_t v66 = v29;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v62 = 1107296256;
  uint64_t v63 = sub_23C983C00;
  os_log_type_t v64 = &block_descriptor_345;
  id v30 = _Block_copy(&aBlock);
  id v31 = v26;
  swift_retain_n();
  swift_release();
  objc_msgSend(v31, sel_observeOtherSetting_withBlock_, v28, v30);
  _Block_release(v30);

  swift_release_n();
  uint64_t v32 = *(void **)(v0 + v1);
  uint64_t v33 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  uint64_t v34 = qword_268BBAFB8;
  uint64_t v35 = swift_allocObject();
  *(void *)(v35 + 16) = sub_23C977CD8;
  *(void *)(v35 + 24) = v33;
  uint64_t v65 = sub_23C978060;
  uint64_t v66 = v35;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v62 = 1107296256;
  uint64_t v63 = sub_23C983C00;
  os_log_type_t v64 = &block_descriptor_353;
  objc_super v36 = _Block_copy(&aBlock);
  id v37 = v32;
  swift_retain_n();
  swift_release();
  objc_msgSend(v37, sel_observeOtherSetting_withBlock_, v34, v36);
  _Block_release(v36);

  swift_release_n();
  uint64_t v38 = *(void **)(v0 + v1);
  uint64_t v39 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v65 = sub_23C977CE4;
  uint64_t v66 = v39;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v62 = 1107296256;
  uint64_t v63 = sub_23C983BAC;
  os_log_type_t v64 = &block_descriptor_357;
  uint64_t v40 = _Block_copy(&aBlock);
  id v41 = v38;
  swift_release();
  objc_msgSend(v41, sel_observeAudioCategoriesDisablingVolumeHUDWithBlock_, v40);
  _Block_release(v40);

  uint64_t v42 = *(void **)(v0 + v1);
  uint64_t v43 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  uint64_t v44 = qword_268BBAFD0;
  uint64_t v45 = swift_allocObject();
  *(void *)(v45 + 16) = sub_23C977CEC;
  *(void *)(v45 + 24) = v43;
  uint64_t v65 = sub_23C978060;
  uint64_t v66 = v45;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v62 = 1107296256;
  uint64_t v63 = sub_23C983C00;
  os_log_type_t v64 = &block_descriptor_365;
  id v46 = _Block_copy(&aBlock);
  id v47 = v42;
  swift_retain_n();
  swift_release();
  objc_msgSend(v47, sel_observeOtherSetting_withBlock_, v44, v46);
  _Block_release(v46);

  swift_release_n();
  id v48 = *(void **)(v0 + v1);
  uint64_t v49 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  uint64_t v50 = qword_268BBAFE8;
  uint64_t v51 = swift_allocObject();
  *(void *)(v51 + 16) = sub_23C977CF8;
  *(void *)(v51 + 24) = v49;
  uint64_t v65 = sub_23C978060;
  uint64_t v66 = v51;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v62 = 1107296256;
  uint64_t v63 = sub_23C983C00;
  os_log_type_t v64 = &block_descriptor_373;
  uint64_t v52 = _Block_copy(&aBlock);
  id v53 = v48;
  swift_retain_n();
  swift_release();
  objc_msgSend(v53, sel_observeOtherSetting_withBlock_, v50, v52);
  _Block_release(v52);

  swift_release_n();
  char v54 = *(void **)(v0 + v1);
  uint64_t v55 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  uint64_t v56 = qword_268BBB000;
  uint64_t v57 = swift_allocObject();
  *(void *)(v57 + 16) = sub_23C977D04;
  *(void *)(v57 + 24) = v55;
  uint64_t v65 = sub_23C978060;
  uint64_t v66 = v57;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v62 = 1107296256;
  uint64_t v63 = sub_23C983C00;
  os_log_type_t v64 = &block_descriptor_381;
  uint64_t v58 = _Block_copy(&aBlock);
  id v59 = v54;
  swift_retain_n();
  swift_release();
  objc_msgSend(v59, sel_observeOtherSetting_withBlock_, v56, v58);
  _Block_release(v58);

  return swift_release_n();
}

void sub_23C965288(uint64_t a1, int a2)
{
  uint64_t v68 = a1;
  uint64_t v67 = sub_23C990F30();
  uint64_t v4 = *(void *)(v67 - 8);
  MEMORY[0x270FA5388](v67);
  id v6 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_23C990F50();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_23C990E40();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  unint64_t v14 = (char *)&v58 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  BSDispatchQueueAssertMain();
  if ((v2[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_invalidated] & 1) != 0
    || (a2 & 1) == 0
    && *(_DWORD *)&v2[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController__presentationMode] == v68)
  {
    return;
  }
  int v61 = a2;
  uint64_t v62 = v10;
  uint64_t v63 = v8;
  os_log_type_t v64 = v6;
  uint64_t v65 = v7;
  uint64_t v66 = v4;
  if (qword_26AF22748 != -1) {
    swift_once();
  }
  uint64_t v15 = __swift_project_value_buffer(v11, (uint64_t)qword_26AF22728);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v15, v11);
  uint64_t v16 = v2;
  uint64_t v17 = sub_23C990E20();
  int v18 = sub_23C991140();
  if (os_log_type_enabled(v17, (os_log_type_t)v18))
  {
    int v59 = v18;
    uint64_t v60 = v15;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v58 = swift_slowAlloc();
    aBlock[0] = v58;
    *(_DWORD *)uint64_t v19 = 136446722;
    uint64_t v20 = sub_23C96245C();
    uint64_t v70 = sub_23C9733B0(v20, v21, aBlock);
    sub_23C991240();

    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2082;
    int v22 = v68;
    if (v68 >= 3)
    {
LABEL_37:
      LODWORD(v70) = v22;
LABEL_39:
      sub_23C991500();
      __break(1u);
      return;
    }
    uint64_t v70 = sub_23C9733B0(*(void *)&aNone[8 * (int)v68], *(void *)&aLiveSna[8 * (int)v68 + 8], aBlock);
    sub_23C991240();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 22) = 1026;
    LODWORD(v70) = v61 & 1;
    sub_23C991240();
    _os_log_impl(&dword_23C948000, v17, (os_log_type_t)v59, "[%{public}s] Updating presentationMode to: %{public}s - (forced? %{BOOL,public}d).", (uint8_t *)v19, 0x1Cu);
    uint64_t v23 = v58;
    swift_arrayDestroy();
    MEMORY[0x23ECEADB0](v23, -1, -1);
    MEMORY[0x23ECEADB0](v19, -1, -1);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    int v22 = v68;
  }
  uint64_t v24 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController__presentationMode;
  *(_DWORD *)&v16[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController__presentationMode] = v22;
  if (!v22)
  {
    uint64_t v34 = *(void **)&v16[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_debugLabel];
    if (v34)
    {
      id v35 = v34;
      objc_super v36 = (void *)sub_23C990FC0();
      objc_msgSend(v35, sel_setText_, v36);

      id v37 = objc_msgSend(v16, sel_view);
      if (!v37)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      uint64_t v38 = v37;
      objc_msgSend(v37, sel_setNeedsLayout);
    }
LABEL_24:
    uint64_t v39 = *(void **)&v16[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_debugLabel];
    if (v39)
    {
      id v40 = v39;
      id v41 = (void *)sub_23C990FC0();
      objc_msgSend(v40, sel_setText_, v41);

      id v42 = objc_msgSend(v16, sel_view);
      if (!v42)
      {
LABEL_34:
        __break(1u);
        goto LABEL_35;
      }
      uint64_t v43 = v42;
      objc_msgSend(v42, sel_setNeedsLayout);
    }
    sub_23C9688E4(0, 1);
    sub_23C965E30(v22 == 1, 0, 0);
    goto LABEL_28;
  }
  if (v22 == 1) {
    goto LABEL_24;
  }
  if (v22 != 2)
  {
    LODWORD(aBlock[0]) = v22;
    goto LABEL_39;
  }
  id v25 = *(void **)&v16[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_debugLabel];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = (void *)sub_23C990FC0();
    objc_msgSend(v26, sel_setText_, v27);

    id v28 = objc_msgSend(v16, sel_view);
    if (!v28)
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    uint64_t v29 = v28;
    objc_msgSend(v28, sel_setNeedsLayout);
  }
  id v30 = *(void **)&v16[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene];
  if (v30)
  {
    id v31 = v30;
    if (objc_msgSend(v31, sel_contentState) != (id)2) {
      sub_23C965E30(1, 0, 0);
    }
    BSDispatchQueueAssertMain();
    if (*(_DWORD *)&v16[v24] == 2)
    {
      uint64_t v32 = swift_allocObject();
      *(void *)(v32 + 16) = v16;
      uint64_t v33 = v16;
      sub_23C968B44((uint64_t)sub_23C977B84, v32);

      swift_release();
LABEL_28:
      id v44 = sub_23C962570();
      uint64_t v45 = swift_allocObject();
      *(void *)(v45 + 16) = v16;
      *(unsigned char *)(v45 + 24) = v22 == 1;
      aBlock[4] = (uint64_t)sub_23C977B8C;
      aBlock[5] = v45;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_23C96B674;
      aBlock[3] = (uint64_t)&block_descriptor_306;
      id v46 = _Block_copy(aBlock);
      id v47 = v16;
      id v48 = v62;
      sub_23C990F40();
      uint64_t v70 = MEMORY[0x263F8EE78];
      sub_23C97764C(&qword_26AF22758, MEMORY[0x263F8F030]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AF22770);
      sub_23C977AB0((unint64_t *)&unk_26AF22778, &qword_26AF22770);
      uint64_t v49 = v64;
      uint64_t v50 = v67;
      sub_23C991280();
      MEMORY[0x23ECE9FE0](0, v48, v49, v46);
      _Block_release(v46);

      (*(void (**)(char *, uint64_t))(v66 + 8))(v49, v50);
      (*(void (**)(char *, uint64_t))(v63 + 8))(v48, v65);
      swift_release();
      return;
    }
    __break(1u);
    goto LABEL_34;
  }
  uint64_t v51 = v16;
  uint64_t v52 = sub_23C990E20();
  os_log_type_t v53 = sub_23C991130();
  if (os_log_type_enabled(v52, v53))
  {
    char v54 = (uint8_t *)swift_slowAlloc();
    uint64_t v55 = swift_slowAlloc();
    aBlock[0] = v55;
    *(_DWORD *)char v54 = 136446210;
    uint64_t v56 = sub_23C96245C();
    uint64_t v70 = sub_23C9733B0(v56, v57, aBlock);
    sub_23C991240();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C948000, v52, v53, "[%{public}s] Snapshot failed because there is no scene found", v54, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEADB0](v55, -1, -1);
    MEMORY[0x23ECEADB0](v54, -1, -1);
  }
  else
  {
  }
}

void sub_23C965C38(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_23C990F60();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (id *)((char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  *uint64_t v7 = sub_23C962570();
  (*(void (**)(id *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F8F0E0], v4);
  char v8 = sub_23C990F70();
  (*(void (**)(id *, uint64_t))(v5 + 8))(v7, v4);
  if (v8)
  {
    uint64_t v9 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_presentationAssertion;
    uint64_t v10 = *(void **)(v2 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_presentationAssertion);
    if (v10)
    {
      id v11 = v10;
      sub_23C990DF0();
    }
    if (a1)
    {
      swift_beginAccess();
      swift_allocObject();
      swift_unknownObjectWeakInit();
      objc_allocWithZone((Class)sub_23C990E10());
      swift_bridgeObjectRetain();
      uint64_t v12 = sub_23C990E00();
      uint64_t v13 = *(void **)(v2 + v9);
      *(void *)(v2 + v9) = v12;
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_23C965E30(int a1, void *a2, char *a3)
{
  uint64_t v7 = sub_23C990E40();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  id v11 = (char *)&v102 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v102 - v12;
  BSDispatchQueueAssertMain();
  uint64_t v14 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene;
  uint64_t v15 = *(void **)(v3 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene);
  if (!v15)
  {
    uint64_t v114 = v8;
    id v29 = *(id *)(v3 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_processResource);
    id v28 = *(id *)(v3 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_processResource + 8);
    id v30 = sub_23C956B60((uint64_t)v29, (unint64_t)v28);
    if (!v30) {
      goto LABEL_34;
    }
    id v31 = v30;
    uint64_t v113 = v7;
    int v108 = a1;
    id v116 = a2;
    uint64_t v32 = self;
    id v111 = v31;
    id v33 = objc_msgSend(v32, sel_identityForProcessIdentity_, v31);
    if (qword_26AF226E8 != -1) {
      swift_once();
    }
    uint64_t v34 = (void *)qword_26AF226E0;
    uint64_t v35 = swift_allocObject();
    *(void *)(v35 + 16) = v3;
    *(void *)(v35 + 24) = v33;
    objc_super v36 = (char *)swift_allocObject();
    *((void *)v36 + 2) = sub_23C977920;
    *((void *)v36 + 3) = v35;
    uint64_t v110 = v35;
    v124 = sub_23C977938;
    os_log_type_t v125 = v36;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v121 = 1107296256;
    unint64_t v122 = sub_23C96F23C;
    id v123 = &block_descriptor_240;
    id v37 = _Block_copy(&aBlock);
    uint64_t v38 = (uint64_t)v125;
    uint64_t v39 = (char *)(id)v3;
    id v109 = v33;
    swift_retain();
    swift_release();
    id v40 = objc_msgSend(v34, sel_createScene_, v37);
    _Block_release(v37);
    uint64_t isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if (isEscapingClosureAtFileLocation)
    {
      __break(1u);
    }
    else
    {
      id v42 = *(void **)(v3 + v14);
      *(void *)(v3 + v14) = v40;
      id v43 = v40;

      objc_msgSend(v43, sel_setDelegate_, v39);
      id v44 = objc_msgSend(v43, sel_layerManager);
      objc_msgSend(v44, sel_addObserver_, v39);

      id v45 = objc_msgSend(v43, sel_uiPresentationManager);
      if (!v45)
      {
        __break(1u);
        goto LABEL_50;
      }
      id v46 = v45;
      id v47 = (void *)sub_23C990FC0();
      id v48 = objc_msgSend(v46, sel_createPresenterWithIdentifier_, v47);

      *(void *)&v39[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scenePresenter] = v48;
      swift_unknownObjectRetain();
      swift_unknownObjectRelease();
      v124 = sub_23C96F290;
      os_log_type_t v125 = 0;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v121 = 1107296256;
      unint64_t v122 = sub_23C97806C;
      id v123 = &block_descriptor_243;
      objc_super v36 = (char *)_Block_copy(&aBlock);
      swift_release();
      objc_msgSend(v48, sel_modifyPresentationContext_, v36);
      _Block_release(v36);
      char v49 = swift_isEscapingClosureAtFileLocation();
      uint64_t v38 = v113;
      if ((v49 & 1) == 0)
      {
        objc_msgSend(v48, sel_activate);
        id v50 = objc_msgSend(v48, sel_presentationView);
        v115 = (char *)sub_23C9621D8();
        uint64_t v51 = &v39[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_systemProvidedMetrics];
        swift_beginAccess();
        uint64_t v52 = *(void *)v51;
        os_log_type_t v53 = *(void **)(*(void *)v51 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics);
        char v54 = &v39[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activitySceneDescriptor];
        swift_beginAccess();
        if (*(void *)(*(void *)v54 + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activitySceneType) == 2
          && *(void *)(v52 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics))
        {
          os_log_type_t v53 = *(void **)(v52 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics);
        }
        unsigned __int8 v112 = a3;
        a3 = v53;
        uint64_t v55 = v115;
        uint64_t v56 = &v115[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size];
        swift_beginAccess();
        long long v118 = *(_OWORD *)v56;
        unint64_t v57 = (double *)&v55[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius];
        swift_beginAccess();
        if (*(double *)(*(void *)&a3[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest]
                       + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum) != 0.0
          || *(double *)(*(void *)&a3[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__heightRequest]
                       + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum) != 0.0
          || (double v58 = *v57,
              int v59 = (double *)&a3[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_cornerRadius],
              swift_beginAccess(),
              *v59 != 0.0))
        {
          *(void *)&long long v118 = sub_23C987D2C();
          *((void *)&v118 + 1) = v60;
          int v61 = (double *)&a3[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_cornerRadius];
          swift_beginAccess();
          double v58 = *v61;
        }
        uint64_t v62 = *(void **)&v39[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activatedSceneView];
        *(void *)&v39[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activatedSceneView] = v50;
        id v63 = v50;

        id v64 = objc_msgSend(v39, sel_view);
        if (v64)
        {
          uint64_t v65 = v64;
          objc_msgSend(v64, sel_addSubview_, v63);

          id v66 = objc_msgSend(v39, sel_view);
          if (v66)
          {
            uint64_t v67 = v66;
            objc_msgSend(v66, sel_setNeedsLayout);

            objc_msgSend(v63, sel_setClipsToBounds_, 1);
            id v68 = objc_msgSend(v63, sel_layer);
            uint64_t v69 = (void *)sub_23C990FC0();
            objc_msgSend(v68, sel_setName_, v69);

            id v107 = v63;
            objc_msgSend(v63, sel__setContinuousCornerRadius_, v58);
            objc_msgSend(v39, sel_setPreferredContentSize_, v118);
            uint64_t v70 = swift_allocObject();
            *(void *)(v70 + 16) = v39;
            uint64_t v71 = swift_allocObject();
            *(void *)(v71 + 16) = sub_23C977960;
            *(void *)(v71 + 24) = v70;
            uint64_t v106 = v70;
            v124 = sub_23C978070;
            os_log_type_t v125 = (void *)v71;
            uint64_t aBlock = MEMORY[0x263EF8330];
            uint64_t v121 = 1107296256;
            unint64_t v122 = sub_23C96F58C;
            id v123 = &block_descriptor_252;
            objc_super v72 = _Block_copy(&aBlock);
            objc_super v36 = v39;
            swift_retain();
            swift_release();
            objc_msgSend(v43, sel_configureParameters_, v72);
            _Block_release(v72);
            uint64_t isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
            swift_release();
            if ((isEscapingClosureAtFileLocation & 1) == 0)
            {
              id v104 = v48;
              id v105 = v43;
              uint64_t isEscapingClosureAtFileLocation = v114;
              if (qword_26AF22748 == -1) {
                goto LABEL_26;
              }
              goto LABEL_46;
            }
LABEL_45:
            __break(1u);
LABEL_46:
            swift_once();
LABEL_26:
            id v103 = a3;
            uint64_t v73 = __swift_project_value_buffer(v38, (uint64_t)qword_26AF22728);
            (*(void (**)(char *, uint64_t, uint64_t))(isEscapingClosureAtFileLocation + 16))(v11, v73, v38);
            char v74 = v36;
            unint64_t v75 = sub_23C990E20();
            os_log_type_t v76 = sub_23C991140();
            if (os_log_type_enabled(v75, v76))
            {
              uint64_t v77 = isEscapingClosureAtFileLocation;
              uint64_t v78 = swift_slowAlloc();
              uint64_t v79 = swift_slowAlloc();
              uint64_t aBlock = v79;
              *(_DWORD *)uint64_t v78 = 136446466;
              uint64_t v80 = sub_23C96245C();
              uint64_t v117 = sub_23C9733B0(v80, v81, &aBlock);
              sub_23C991240();

              swift_bridgeObjectRelease();
              *(_WORD *)(v78 + 12) = 2082;
              char v82 = v108;
              if (v108) {
                uint64_t v83 = 0x756F726765726F66;
              }
              else {
                uint64_t v83 = 0x756F72676B636162;
              }
              uint64_t v117 = sub_23C9733B0(v83, 0xEA0000000000646ELL, &aBlock);
              sub_23C991240();
              swift_bridgeObjectRelease();
              _os_log_impl(&dword_23C948000, v75, v76, "[%{public}s] Creating activity scene to %{public}s.", (uint8_t *)v78, 0x16u);
              swift_arrayDestroy();
              MEMORY[0x23ECEADB0](v79, -1, -1);
              MEMORY[0x23ECEADB0](v78, -1, -1);

              (*(void (**)(char *, uint64_t))(v77 + 8))(v11, v113);
            }
            else
            {

              (*(void (**)(char *, uint64_t))(isEscapingClosureAtFileLocation + 8))(v11, v38);
              char v82 = v108;
            }
            uint64_t v3 = swift_allocObject();
            *(void *)(v3 + 16) = &v118;
            *(unsigned char *)(v3 + 24) = v82 & 1;
            id v94 = v115;
            *(void *)(v3 + 32) = v74;
            *(void *)(v3 + 40) = v94;
            uint64_t v7 = swift_allocObject();
            *(void *)(v7 + 16) = sub_23C9779B8;
            *(void *)(v7 + 24) = v3;
            v124 = sub_23C977F48;
            os_log_type_t v125 = (void *)v7;
            uint64_t aBlock = MEMORY[0x263EF8330];
            uint64_t v121 = 1107296256;
            unint64_t v122 = sub_23C96EF18;
            id v123 = &block_descriptor_262;
            id v28 = _Block_copy(&aBlock);
            uint64_t v95 = v74;
            id v96 = v94;
            swift_retain();
            swift_release();
            uint64_t v97 = swift_allocObject();
            uint64_t v98 = (uint64_t)v116;
            char v99 = v112;
            *(void *)(v97 + 16) = v116;
            *(void *)(v97 + 24) = v99;
            v124 = sub_23C9779DC;
            os_log_type_t v125 = (void *)v97;
            uint64_t aBlock = MEMORY[0x263EF8330];
            uint64_t v121 = 1107296256;
            unint64_t v122 = sub_23C96EF84;
            id v123 = &block_descriptor_268;
            unint64_t v100 = _Block_copy(&aBlock);
            sub_23C9779E0(v98);
            swift_release();
            id v29 = v105;
            objc_msgSend(v105, sel_performUpdate_withCompletion_, v28, v100);

            _Block_release(v100);
            _Block_release(v28);

            swift_unknownObjectRelease();
            LOBYTE(v96) = swift_isEscapingClosureAtFileLocation();
            swift_release();
            swift_release();
            swift_release();
            swift_release();
            if (v96)
            {
              __break(1u);
LABEL_48:
              swift_once();
LABEL_35:
              __swift_project_value_buffer(v7, (uint64_t)qword_26AF22728);
              id v116 = (id)v3;
              unint64_t v88 = sub_23C990E20();
              os_log_type_t v89 = sub_23C991140();
              if (os_log_type_enabled(v88, v89))
              {
                uint64_t v90 = swift_slowAlloc();
                uint64_t v91 = swift_slowAlloc();
                uint64_t aBlock = v91;
                *(_DWORD *)uint64_t v90 = 136446467;
                uint64_t v92 = sub_23C96245C();
                uint64_t v119 = sub_23C9733B0(v92, v93, &aBlock);
                sub_23C991240();

                swift_bridgeObjectRelease();
                *(_WORD *)(v90 + 12) = 2081;
                swift_bridgeObjectRetain();
                uint64_t v119 = sub_23C9733B0((uint64_t)v29, (unint64_t)v28, &aBlock);
                sub_23C991240();

                swift_bridgeObjectRelease();
                _os_log_impl(&dword_23C948000, v88, v89, "[%{public}s] Couldn't create a scene with %{private}s", (uint8_t *)v90, 0x16u);
                swift_arrayDestroy();
                MEMORY[0x23ECEADB0](v91, -1, -1);
                MEMORY[0x23ECEADB0](v90, -1, -1);
              }
              else
              {

                id v101 = v116;
              }
              return;
            }
            return;
          }
LABEL_51:
          __break(1u);
          return;
        }
LABEL_50:
        __break(1u);
        goto LABEL_51;
      }
    }
    __break(1u);
    goto LABEL_45;
  }
  id v116 = a2;
  uint64_t v16 = qword_26AF22748;
  v115 = v15;
  if (v16 != -1) {
    swift_once();
  }
  uint64_t v17 = __swift_project_value_buffer(v7, (uint64_t)qword_26AF22728);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v13, v17, v7);
  id v18 = (id)v3;
  uint64_t v19 = sub_23C990E20();
  os_log_type_t v20 = sub_23C991140();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    unsigned __int8 v112 = a3;
    uint64_t v23 = v22;
    uint64_t aBlock = v22;
    *(_DWORD *)uint64_t v21 = 136446466;
    uint64_t v114 = v8;
    uint64_t v24 = sub_23C96245C();
    uint64_t v119 = sub_23C9733B0(v24, v25, &aBlock);
    uint64_t v113 = v7;
    sub_23C991240();

    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 12) = 2082;
    if (a1) {
      uint64_t v26 = 0x756F726765726F66;
    }
    else {
      uint64_t v26 = 0x756F72676B636162;
    }
    uint64_t v119 = sub_23C9733B0(v26, 0xEA0000000000646ELL, &aBlock);
    sub_23C991240();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C948000, v19, v20, "[%{public}s] Updating activity scene to %{public}s.", (uint8_t *)v21, 0x16u);
    swift_arrayDestroy();
    uint64_t v27 = v23;
    a3 = v112;
    MEMORY[0x23ECEADB0](v27, -1, -1);
    MEMORY[0x23ECEADB0](v21, -1, -1);

    (*(void (**)(char *, uint64_t))(v114 + 8))(v13, v113);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  }
  uint64_t v3 = swift_allocObject();
  *(unsigned char *)(v3 + 16) = a1 & 1;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_23C977A00;
  *(void *)(v7 + 24) = v3;
  v124 = sub_23C977F48;
  os_log_type_t v125 = (void *)v7;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v121 = 1107296256;
  unint64_t v122 = sub_23C96EF18;
  id v123 = &block_descriptor_278;
  id v84 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  uint64_t v85 = swift_allocObject();
  uint64_t v86 = (uint64_t)v116;
  *(void *)(v85 + 16) = v116;
  *(void *)(v85 + 24) = a3;
  v124 = sub_23C9779DC;
  os_log_type_t v125 = (void *)v85;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v121 = 1107296256;
  unint64_t v122 = sub_23C96EF84;
  id v123 = &block_descriptor_284;
  uint64_t v87 = _Block_copy(&aBlock);
  id v29 = v125;
  sub_23C9779E0(v86);
  swift_release();
  id v28 = v115;
  objc_msgSend(v115, sel_performUpdate_withCompletion_, v84, v87);

  _Block_release(v87);
  _Block_release(v84);
  LOBYTE(v84) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if (v84)
  {
    __break(1u);
LABEL_34:
    if (qword_26AF22748 == -1) {
      goto LABEL_35;
    }
    goto LABEL_48;
  }
}

void sub_23C967170()
{
  BSDispatchQueueAssertMain();
  uint64_t v1 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scenePresenter;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scenePresenter);
  if (v2) {
    objc_msgSend(v2, sel_invalidate);
  }
  *(void *)(v0 + v1) = 0;
  swift_unknownObjectRelease();
  *(unsigned char *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneForeground) = 0;
  uint64_t v3 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activatedSceneView;
  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activatedSceneView), sel_removeFromSuperview);
  uint64_t v4 = *(void **)(v0 + v3);
  *(void *)(v0 + v3) = 0;

  uint64_t v5 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene;
  uint64_t v6 = *(void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene);
  if (v6)
  {
    id v7 = objc_msgSend(v6, sel_layerManager);
    objc_msgSend(v7, sel_remove_, v0);

    uint64_t v6 = *(void **)(v0 + v5);
    if (v6)
    {
      objc_msgSend(v6, sel_setDelegate_, 0);
      uint64_t v6 = *(void **)(v0 + v5);
    }
  }
  objc_msgSend(v6, sel_invalidate);
  uint64_t v8 = *(void **)(v0 + v5);
  *(void *)(v0 + v5) = 0;

  *(unsigned char *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_invalidated) = 1;
}

void sub_23C96726C()
{
  BSDispatchQueueAssertMain();
  if (qword_26AF22748 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_23C990E40();
  __swift_project_value_buffer(v1, (uint64_t)qword_26AF22728);
  uint64_t v2 = v0;
  uint64_t v3 = sub_23C990E20();
  os_log_type_t v4 = sub_23C991140();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    v60[0] = v6;
    *(_DWORD *)uint64_t v5 = 136446210;
    uint64_t v7 = sub_23C96245C();
    uint64_t v59 = sub_23C9733B0(v7, v8, v60);
    sub_23C991240();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C948000, v3, v4, "[%{public}s] Reseting content size", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEADB0](v6, -1, -1);
    MEMORY[0x23ECEADB0](v5, -1, -1);
  }
  else
  {
  }
  if (*(void *)&v2[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene])
  {
    uint64_t v9 = (void **)&v2[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_resolvedMetrics];
    swift_beginAccess();
    uint64_t v10 = (char *)*v9;
    if (*v9)
    {
      id v11 = (double *)&v10[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size];
      swift_beginAccess();
      double v13 = *v11;
      double v12 = v11[1];
      CGFloat v57 = *v11;
      uint64_t v58 = *(void *)&v12;
      uint64_t v14 = &v2[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activitySceneDescriptor];
      swift_beginAccess();
      if (*(void *)(*(void *)v14 + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activitySceneType) >= 2uLL)
      {
        uint64_t v23 = v10;
      }
      else
      {
        uint64_t v15 = &v2[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_systemProvidedMetrics];
        uint64_t v16 = swift_beginAccess();
        uint64_t v17 = *(char **)(*(void *)v15 + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics);
        uint64_t v18 = *(void *)&v17[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest];
        double v19 = *(double *)(v18 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum);
        if (v19 != 0.0
          || *(double *)(*(void *)&v17[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__heightRequest]
                       + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum) != 0.0
          || (os_log_type_t v20 = (double *)&v17[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_cornerRadius],
              uint64_t v16 = swift_beginAccess(),
              *v20 != 0.0))
        {
          uint64_t v21 = *(void *)(v18 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type);
          if (v21 != 1)
          {
            if (v21)
            {
              double v19 = 0.0;
            }
            else
            {
              if (v19 >= v13) {
                double v22 = v13;
              }
              else {
                double v22 = v19;
              }
              double v19 = *(double *)(v18 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum);
              if (v22 > v19) {
                double v19 = v22;
              }
            }
          }
          CGFloat v24 = CGSizeMake(v16, v19, v12);
          double v12 = v25;
          CGFloat v57 = v24;
          uint64_t v58 = *(void *)&v25;
        }
        uint64_t v26 = v10;
        uint64_t v27 = v17;
        id v28 = v27;
        if (v12 >= 40.0)
        {
        }
        else
        {
          id v29 = v2;
          id v30 = sub_23C990E20();
          os_log_type_t v31 = sub_23C991140();
          if (os_log_type_enabled(v30, v31))
          {
            uint64_t v32 = swift_slowAlloc();
            uint64_t v54 = swift_slowAlloc();
            v56[0] = v54;
            *(_DWORD *)uint64_t v32 = 136446466;
            uint64_t v33 = sub_23C96245C();
            sub_23C9733B0(v33, v34, v56);
            sub_23C991240();

            swift_bridgeObjectRelease();
            *(_WORD *)(v32 + 12) = 2082;
            swift_beginAccess();
            uint64_t v35 = sub_23C9910C0();
            sub_23C9733B0(v35, v36, v56);
            sub_23C991240();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_23C948000, v30, v31, "[%{public}s] Requested frame size height (%{public}s) is smaller than minimum height, setting it to minimum height", (uint8_t *)v32, 0x16u);
            swift_arrayDestroy();
            MEMORY[0x23ECEADB0](v54, -1, -1);
            MEMORY[0x23ECEADB0](v32, -1, -1);
          }
          else
          {
          }
          swift_beginAccess();
          uint64_t v58 = 0x4044000000000000;
          double v12 = 40.0;
        }
      }
      objc_msgSend(v2, sel_preferredContentSize);
      CGFloat v38 = v37;
      CGFloat v40 = v39;
      swift_beginAccess();
      double v41 = v57;
      v61.width = v38;
      v61.height = v40;
      v62.width = v57;
      v62.height = v12;
      if (CGSizeEqualToSize(v61, v62))
      {
        id v42 = v2;
        id v43 = sub_23C990E20();
        os_log_type_t v44 = sub_23C991140();
        if (os_log_type_enabled(v43, v44))
        {
          uint64_t v45 = swift_slowAlloc();
          uint64_t v46 = swift_slowAlloc();
          v55[0] = v46;
          *(_DWORD *)uint64_t v45 = 136446722;
          uint64_t v47 = sub_23C96245C();
          sub_23C9733B0(v47, v48, v55);
          sub_23C991240();

          swift_bridgeObjectRelease();
          *(_WORD *)(v45 + 12) = 2082;
          objc_msgSend(v42, sel_preferredContentSize);
          type metadata accessor for CGSize(0);
          uint64_t v49 = sub_23C990FE0();
          sub_23C9733B0(v49, v50, v55);
          sub_23C991240();

          swift_bridgeObjectRelease();
          *(_WORD *)(v45 + 22) = 2082;
          uint64_t v51 = sub_23C990FE0();
          sub_23C9733B0(v51, v52, v55);
          sub_23C991240();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_23C948000, v43, v44, "[%{public}s] Not updating preferred content size (%{public}s) because requested size is the same (%{public}s)", (uint8_t *)v45, 0x20u);
          swift_arrayDestroy();
          MEMORY[0x23ECEADB0](v46, -1, -1);
          MEMORY[0x23ECEADB0](v45, -1, -1);
        }
        else
        {
        }
      }
      else
      {
        os_log_type_t v53 = (void *)MEMORY[0x23ECEA6A0]();
        sub_23C96FB78(v2, v41, v12);
      }
    }
  }
}

void sub_23C9679D8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_23C990B50();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  unint64_t v8 = (char *)&v62 - v7;
  BSDispatchQueueAssertMain();
  uint64_t v9 = *(void **)&v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene];
  if (!v9) {
    return;
  }
  id v67 = v9;
  id v10 = objc_msgSend(v1, sel_view);
  if (!v10) {
    goto LABEL_42;
  }
  id v11 = v10;
  id v12 = objc_msgSend(v10, sel_window);

  if (!v12)
  {
    id v61 = v67;

    return;
  }
  uint64_t v65 = v3;
  uint64_t v66 = v2;
  id v13 = objc_msgSend(v67, sel_layerManager);
  id v14 = objc_msgSend(v13, sel_layers);

  uint64_t v15 = &v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_touchDeliveryPolicyAssertions];
  swift_beginAccess();
  uint64_t v16 = swift_bridgeObjectRetain();
  uint64_t v17 = sub_23C97408C(v16);
  swift_bridgeObjectRelease();
  sub_23C970128(v17);
  swift_release();
  id v18 = objc_allocWithZone(MEMORY[0x263EFF9C0]);
  uint64_t v19 = MEMORY[0x263F8EE58] + 8;
  os_log_type_t v20 = (void *)sub_23C991060();
  swift_bridgeObjectRelease();
  id v73 = objc_msgSend(v18, sel_initWithArray_, v20);

  id v64 = v12;
  unsigned int v71 = objc_msgSend(v12, sel__contextId);
  id v63 = v14;
  sub_23C991110();
  sub_23C990B40();
  objc_super v72 = v6;
  if (!v82)
  {
LABEL_24:
    uint64_t v49 = *(void (**)(char *, uint64_t))(v65 + 8);
    v49(v8, v66);
    sub_23C991110();
    sub_23C990B40();
    while (v77)
    {
      sub_23C95CAC4(&aBlock, &v81);
      if (swift_dynamicCast())
      {
        uint64_t v51 = *(void **)v15;
        if (*(void *)(*(void *)v15 + 16))
        {
          unsigned int v52 = v80;
          unint64_t v53 = sub_23C973BE4(v80);
          if (v54)
          {
            id v55 = *(id *)(v51[7] + 8 * v53);
            objc_msgSend(v55, sel_invalidate);
            swift_beginAccess();
            unint64_t v56 = sub_23C973BE4(v52);
            if (v57)
            {
              unint64_t v58 = v56;
              int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
              uint64_t v60 = *(void **)v15;
              uint64_t v80 = *(void **)v15;
              *(void *)uint64_t v15 = 0x8000000000000000;
              if (!isUniquelyReferenced_nonNull_native)
              {
                sub_23C982A4C();
                uint64_t v60 = v80;
              }
              unint64_t v50 = *(void **)(v60[7] + 8 * v58);
              sub_23C973EF0(v58, (uint64_t)v60);
              *(void *)uint64_t v15 = v60;

              swift_bridgeObjectRelease();
              uint64_t v6 = v72;
            }
            swift_endAccess();
          }
        }
      }
      sub_23C990B40();
    }
    v49(v6, v66);

    return;
  }
  uint64_t v70 = &v76;
  uint64_t v69 = v8;
  uint64_t v68 = v19;
  while (1)
  {
    sub_23C95CAC4(&v81, &aBlock);
    sub_23C959038(0, &qword_26AF22798);
    if ((swift_dynamicCast() & 1) == 0) {
      goto LABEL_8;
    }
    id v74 = v80;
    id v21 = objc_msgSend(v80, sel_contextID);
    double v22 = (void *)sub_23C991640();
    objc_msgSend(v73, sel_removeObject_, v22);

    id v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F298B8]), sel_init);
    id v24 = objc_msgSend(self, sel_policyRequiringSharingOfTouchesDeliveredToChildContextId_withHostContextId_, v21, v71);
    double v25 = v24;
    if (v24)
    {
      id v26 = v24;
      objc_msgSend(v26, sel_setAssertionEndpoint_, objc_msgSend(v23, sel_endpoint));

      swift_unknownObjectRelease();
    }
    uint64_t v27 = swift_allocObject();
    *(void *)(v27 + 16) = v1;
    uint64_t v78 = sub_23C977B04;
    uint64_t v79 = v27;
    *(void *)&long long aBlock = MEMORY[0x263EF8330];
    *((void *)&aBlock + 1) = 1107296256;
    os_log_type_t v76 = sub_23C968FA8;
    uint64_t v77 = &block_descriptor_291;
    id v28 = _Block_copy(&aBlock);
    id v29 = v1;
    id v30 = v1;
    swift_release();
    id v31 = (id)BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler();
    _Block_release(v28);
    swift_beginAccess();
    id v32 = v23;
    char v33 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v80 = *(void **)v15;
    unint64_t v34 = v80;
    *(void *)uint64_t v15 = 0x8000000000000000;
    unint64_t v36 = sub_23C973BE4(v21);
    uint64_t v37 = v34[2];
    BOOL v38 = (v35 & 1) == 0;
    uint64_t v39 = v37 + v38;
    if (__OFADD__(v37, v38)) {
      break;
    }
    char v40 = v35;
    if (v34[3] >= v39)
    {
      if ((v33 & 1) == 0) {
        sub_23C982A4C();
      }
    }
    else
    {
      sub_23C982480(v39, v33);
      unint64_t v41 = sub_23C973BE4(v21);
      if ((v40 & 1) != (v42 & 1)) {
        goto LABEL_43;
      }
      unint64_t v36 = v41;
    }
    uint64_t v6 = v72;
    id v43 = v80;
    if (v40)
    {
      uint64_t v44 = v80[7];
      uint64_t v45 = 8 * v36;

      *(void *)(v44 + v45) = v32;
    }
    else
    {
      v80[(v36 >> 6) + 8] |= 1 << v36;
      *(_DWORD *)(v43[6] + 4 * v36) = v21;
      *(void *)(v43[7] + 8 * v36) = v32;
      uint64_t v46 = v43[2];
      BOOL v47 = __OFADD__(v46, 1);
      uint64_t v48 = v46 + 1;
      if (v47) {
        goto LABEL_41;
      }
      v43[2] = v48;
    }
    *(void *)uint64_t v15 = v43;
    swift_bridgeObjectRelease();
    swift_endAccess();
    uint64_t v1 = v29;
    if (v31)
    {
      objc_msgSend((id)swift_unknownObjectRetain(), sel_ipc_addPolicy_, v25);

      swift_unknownObjectRelease_n();
    }
    else
    {
    }
    unint64_t v8 = v69;
LABEL_8:
    sub_23C990B40();
    if (!v82) {
      goto LABEL_24;
    }
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  sub_23C991530();
  __break(1u);
}

id sub_23C9681C4()
{
  BSDispatchQueueAssertMain();
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_touchDeliveryPolicyAssertions);
  swift_beginAccess();
  uint64_t v2 = *v1;
  uint64_t v3 = *v1 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(*v1 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(*v1 + 64);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  id result = (id)swift_bridgeObjectRetain();
  int64_t v9 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v10 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v11 = v10 | (v9 << 6);
      goto LABEL_5;
    }
    int64_t v12 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_23;
    }
    if (v12 >= v7) {
      goto LABEL_21;
    }
    unint64_t v13 = *(void *)(v3 + 8 * v12);
    ++v9;
    if (!v13)
    {
      int64_t v9 = v12 + 1;
      if (v12 + 1 >= v7) {
        goto LABEL_21;
      }
      unint64_t v13 = *(void *)(v3 + 8 * v9);
      if (!v13)
      {
        int64_t v9 = v12 + 2;
        if (v12 + 2 >= v7) {
          goto LABEL_21;
        }
        unint64_t v13 = *(void *)(v3 + 8 * v9);
        if (!v13) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v6 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v9 << 6);
LABEL_5:
    id result = objc_msgSend(*(id *)(*(void *)(v2 + 56) + 8 * v11), sel_invalidate);
  }
  int64_t v14 = v12 + 3;
  if (v14 >= v7)
  {
LABEL_21:
    swift_release();
    *uint64_t v1 = MEMORY[0x263F8EE80];
    return (id)swift_bridgeObjectRelease();
  }
  unint64_t v13 = *(void *)(v3 + 8 * v14);
  if (v13)
  {
    int64_t v9 = v14;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v9 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v9 >= v7) {
      goto LABEL_21;
    }
    unint64_t v13 = *(void *)(v3 + 8 * v9);
    ++v14;
    if (v13) {
      goto LABEL_20;
    }
  }
LABEL_23:
  __break(1u);
  return result;
}

void sub_23C96834C()
{
  BSDispatchQueueAssertMain();
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
  id v2 = objc_msgSend(v1, sel_layer);
  uint64_t v3 = (void *)sub_23C990FC0();
  objc_msgSend(v2, sel_setName_, v3);

  id v4 = objc_msgSend(v0, sel_view);
  if (!v4)
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v5 = v4;
  objc_msgSend(v4, sel_bounds);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  objc_msgSend(v1, sel_setFrame_, v7, v9, v11, v13);
  objc_msgSend(v1, sel_setClipsToBounds_, 1);
  objc_msgSend(v1, sel_setAutoresizingMask_, 18);
  int64_t v14 = (char *)sub_23C9621D8();
  uint64_t v15 = (double *)&v14[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius];
  swift_beginAccess();
  double v16 = *v15;

  objc_msgSend(v1, sel__setContinuousCornerRadius_, v16);
  id v17 = objc_msgSend(v0, sel_view);
  if (!v17)
  {
LABEL_7:
    __break(1u);
    return;
  }
  id v18 = v17;
  objc_msgSend(v17, sel_addSubview_, v1);

  uint64_t v19 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_liveSceneSnapshotView;
  os_log_type_t v20 = *(void **)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_liveSceneSnapshotView];
  *(void *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_liveSceneSnapshotView] = v1;
  id v21 = v1;

  BSDispatchQueueAssertMain();
  double v22 = *(void **)&v0[v19];
  if (v22)
  {
    id v23 = v22;
    objc_msgSend(v23, sel_setAlpha_, 0.0);
    objc_msgSend(v23, sel_setHidden_, 1);

    id v21 = v23;
  }
}

void sub_23C96856C()
{
  id v1 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  id v2 = (void *)sub_23C990FC0();
  id v3 = objc_msgSend(v1, sel_initWithSuiteName_, v2);

  if (!v3) {
    return;
  }
  id v4 = (void *)sub_23C990FC0();
  unsigned int v5 = objc_msgSend(v3, sel_BOOLForKey_, v4);

  if (!v5) {
    return;
  }
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
  id v7 = objc_msgSend(v0, sel_view);
  if (!v7)
  {
    __break(1u);
    goto LABEL_10;
  }
  double v8 = v7;
  objc_msgSend(v7, sel_bounds);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  objc_msgSend(v6, sel_setFrame_, v10, v12, v14, v16);
  objc_msgSend(v6, sel_setClipsToBounds_, 1);
  id v17 = objc_msgSend(v6, sel_layer);
  id v18 = (void *)sub_23C990FC0();
  objc_msgSend(v17, sel_setName_, v18);

  id v19 = objc_msgSend(self, sel_systemFontOfSize_, 16.0);
  objc_msgSend(v6, sel_setFont_, v19);

  objc_msgSend(v6, sel_setTextAlignment_, 1);
  os_log_type_t v20 = self;
  id v21 = objc_msgSend(v20, sel_redColor);
  objc_msgSend(v6, sel_setTextColor_, v21);

  id v22 = v6;
  id v23 = objc_msgSend(v20, sel_whiteColor);
  id v24 = objc_msgSend(v23, sel_colorWithAlphaComponent_, 0.75);

  objc_msgSend(v22, sel_setBackgroundColor_, v24);
  objc_msgSend(v22, sel_setAutoresizingMask_, 18);
  objc_msgSend(v22, sel__setContinuousCornerRadius_, 5.0);
  objc_msgSend(v22, sel_setAlpha_, 1.0);
  objc_msgSend(v22, sel_setHidden_, 0);
  id v25 = objc_msgSend(v0, sel_view);
  if (!v25)
  {
LABEL_10:
    __break(1u);
    return;
  }
  id v26 = v25;
  objc_msgSend(v25, sel_addSubview_, v22);

  uint64_t v27 = *(void **)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_debugLabel];
  *(void *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_debugLabel] = v22;
}

void sub_23C9688E4(char a1, char a2)
{
  BSDispatchQueueAssertMain();
  unsigned int v5 = *(void **)(v2 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_liveSceneSnapshotView);
  if (!v5) {
    return;
  }
  id v16 = *(id *)(v2 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_liveSceneSnapshotView);
  if (a1 != 2)
  {
    int v6 = a1 & 1;
    id v8 = v5;
    if ((a2 & 1) == 0) {
      goto LABEL_4;
    }
LABEL_10:
    double v9 = self;
    uint64_t v10 = swift_allocObject();
    *(unsigned char *)(v10 + 16) = v6;
    *(void *)(v10 + 24) = v16;
    id v21 = sub_23C97783C;
    uint64_t v22 = v10;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v18 = 1107296256;
    id v19 = (uint64_t (*)(uint64_t, uint64_t))sub_23C96B674;
    os_log_type_t v20 = &block_descriptor_214;
    double v11 = _Block_copy(&aBlock);
    id v12 = v16;
    swift_release();
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v12;
    *(unsigned char *)(v13 + 24) = v6;
    id v21 = sub_23C977898;
    uint64_t v22 = v13;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v18 = 1107296256;
    id v19 = sub_23C96B678;
    os_log_type_t v20 = &block_descriptor_220;
    double v14 = _Block_copy(&aBlock);
    id v15 = v12;
    swift_release();
    objc_msgSend(v9, sel_animateWithDuration_animations_completion_, v11, v14, 0.4);

    _Block_release(v14);
    _Block_release(v11);
    return;
  }
  int v6 = objc_msgSend(v5, sel_isHidden);
  if (a2) {
    goto LABEL_10;
  }
LABEL_4:
  double v7 = 0.0;
  if (v6) {
    double v7 = 1.0;
  }
  objc_msgSend(v16, sel_setAlpha_, v7);
  objc_msgSend(v16, sel_setHidden_, v6 ^ 1u);
}

void sub_23C968B44(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_23C990F30();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_23C990F50();
  uint64_t v28 = *(void *)(v9 - 8);
  uint64_t v29 = v9;
  MEMORY[0x270FA5388](v9);
  double v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  BSDispatchQueueAssertMain();
  id v12 = (void *)swift_allocObject();
  v12[2] = v2;
  v12[3] = a1;
  v12[4] = a2;
  id v13 = v2;
  swift_retain_n();
  double v14 = (char *)v13;
  BSDispatchQueueAssertMain();
  id v15 = *(void **)&v14[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scenePresenter];
  if (v15 && (id v16 = *(void **)&v14[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene]) != 0)
  {
    swift_unknownObjectRetain();
    id v27 = v16;
    if (objc_msgSend(v27, sel_contentState) == (id)2)
    {
      id v17 = objc_msgSend(v15, sel_newSnapshot);
      id v26 = sub_23C962570();
      uint64_t v18 = (void *)swift_allocObject();
      v18[2] = sub_23C9775A0;
      v18[3] = v12;
      void v18[4] = v17;
      aBlock[4] = sub_23C9775F0;
      aBlock[5] = v18;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_23C96B674;
      aBlock[3] = &block_descriptor_196;
      id v24 = _Block_copy(aBlock);
      swift_retain();
      id v25 = v17;
      sub_23C990F40();
      uint64_t v30 = MEMORY[0x263F8EE78];
      uint64_t v23 = sub_23C97764C(&qword_26AF22758, MEMORY[0x263F8F030]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AF22770);
      uint64_t v19 = v6;
      sub_23C977AB0((unint64_t *)&unk_26AF22778, &qword_26AF22770);
      sub_23C991280();
      os_log_type_t v20 = v24;
      id v21 = v26;
      MEMORY[0x23ECE9FE0](0, v11, v8, v24);
      _Block_release(v20);

      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v8, v5);
      (*(void (**)(char *, uint64_t))(v28 + 8))(v11, v29);
      swift_release();

      swift_release();
      swift_release();
    }
    else
    {
      sub_23C970508((void *)1, 1, v14, a1, a2);
      swift_release();

      swift_release();
      swift_unknownObjectRelease();
      id v22 = v27;
    }
  }
  else
  {
    sub_23C970508(0, 1, v14, a1, a2);
    swift_release();

    swift_release();
  }
}

void sub_23C968FA8(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_23C969014(void *a1)
{
  sub_23C9690D4(a1, &qword_268BBAF40);
}

void sub_23C969074(void *a1)
{
  sub_23C9690D4(a1, &qword_268BBAF28);
}

void sub_23C9690D4(void *a1, void *a2)
{
  v14[3] = *(id *)MEMORY[0x263EF8340];
  if (a1)
  {
    v14[0] = 0;
    id v5 = objc_msgSend(self, sel_archivedDataWithRootObject_requiringSecureCoding_error_, a1, 1, v14);
    id v6 = v14[0];
    if (v5)
    {
      uint64_t v7 = sub_23C990BF0();
      unint64_t v9 = v8;

      id v10 = objc_msgSend(v2, sel_otherSettings);
      id v11 = (id)sub_23C990BE0();
      swift_beginAccess();
      objc_msgSend(v10, sel_setObject_forSetting_, v11, *a2);
      sub_23C95CAD4(v7, v9);
    }
    else
    {
      id v12 = v6;
      id v13 = (void *)sub_23C990B30();

      swift_willThrow();
      id v11 = a1;
    }
  }
  else
  {
    id v11 = objc_msgSend(v2, sel_otherSettings);
    swift_beginAccess();
    objc_msgSend(v11, sel_setObject_forSetting_, 0, *a2);
  }
}

void sub_23C969278()
{
  uint64_t v0 = self;
  id v1 = (void *)sub_23C990FC0();
  id v2 = objc_msgSend(v0, sel_createWorkloopNamed_, v1);

  qword_26AF22FC8 = (uint64_t)v2;
}

uint64_t ActivityHostViewController.PresentationMode.description.getter(unsigned int a1)
{
  if (a1 < 3) {
    return *(void *)&aNone[8 * a1];
  }
  uint64_t result = sub_23C991500();
  __break(1u);
  return result;
}

unint64_t ActivityHostViewController.PresentationMode.init(rawValue:)(unsigned int a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = 2;
  if (a1 != 2) {
    uint64_t v2 = 0;
  }
  BOOL v3 = a1 != 2;
  if (a1 == 1) {
    BOOL v3 = 0;
  }
  else {
    uint64_t v1 = v2;
  }
  if (!a1)
  {
    uint64_t v1 = 0;
    BOOL v3 = 0;
  }
  return v1 | ((unint64_t)v3 << 32);
}

BOOL sub_23C9693A0(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23C9693B4()
{
  return sub_23C991620();
}

uint64_t sub_23C9693FC()
{
  return sub_23C9915F0();
}

uint64_t sub_23C969428()
{
  return sub_23C991620();
}

int *sub_23C96946C@<X0>(int *result@<X0>, uint64_t a2@<X8>)
{
  int v2 = *result;
  BOOL v3 = *result > 2;
  if (*result > 2) {
    int v2 = 0;
  }
  *(_DWORD *)a2 = v2;
  *(unsigned char *)(a2 + 4) = v3;
  return result;
}

void sub_23C969488(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_23C969494()
{
  return ActivityHostViewController.PresentationMode.description.getter(*v0);
}

void sub_23C9697DC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a3 + 16;
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x23ECEAE20](v4);
  if (v5)
  {
    id v6 = (void *)v5;
    type metadata accessor for ActivityMutableSceneSettings();
    uint64_t v7 = swift_dynamicCastClass();
    if (v7)
    {
      unint64_t v8 = (void *)v7;
      swift_beginAccess();
      id v9 = a1;
      id v10 = objc_msgSend(v8, sel_otherSettings);
      uint64_t v11 = sub_23C991510();
      swift_beginAccess();
      objc_msgSend(v10, sel_setObject_forSetting_, v11, qword_268BBB4F8);

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

void sub_23C969A88(void **a1, void *a2)
{
  int v2 = *a1;
  BOOL v3 = (void **)(*a2 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_resolvedMetrics);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *BOOL v3 = v2;
  id v5 = v2;

  BSDispatchQueueAssertMain();
  sub_23C96726C();
}

void *sub_23C969D04(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t v4 = (void *)(*a2
                + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_audioCategoriesDisablingVolumeHUD);
  swift_beginAccess();
  *uint64_t v4 = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  BSDispatchQueueAssertMain();
  uint64_t v5 = v3 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_delegate;
  swift_beginAccess();
  uint64_t result = (void *)MEMORY[0x23ECEAE20](v5);
  if (result)
  {
    objc_msgSend(result, sel_activityHostViewControllerAudioCategoriesDisablingVolumeHUDDidChangeWithViewController_, v3);
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_23C969EB0(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a2 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activityTouchRestrictedRects);
  swift_beginAccess();
  *uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void sub_23C969FB8()
{
  id v0 = objc_allocWithZone(MEMORY[0x263F3F500]);
  uint64_t v1 = (void *)sub_23C990FC0();
  id v2 = objc_msgSend(v0, sel_initWithIdentifier_, v1);

  qword_26AF226E0 = (uint64_t)v2;
}

unint64_t sub_23C96A028(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBA5E0);
  id v2 = (void *)sub_23C991420();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v6 = *(v4 - 1);
    uint64_t v5 = *v4;
    swift_retain();
    swift_retain();
    unint64_t result = sub_23C973C2C(v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v2[6] + v9) = v6;
    *(void *)(v2[7] + v9) = v5;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v2[2] = v12;
    v4 += 2;
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

id ActivityHostViewController.__allocating_init(activitySceneDescriptor:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return ActivityHostViewController.init(activitySceneDescriptor:)(a1);
}

id ActivityHostViewController.__deallocating_deinit()
{
  if (qword_26AF22748 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_23C990E40();
  __swift_project_value_buffer(v1, (uint64_t)qword_26AF22728);
  id v2 = v0;
  id v3 = sub_23C990E20();
  os_log_type_t v4 = sub_23C991140();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v12 = v6;
    *(_DWORD *)uint64_t v5 = 136446210;
    uint64_t v7 = sub_23C96245C();
    uint64_t v11 = sub_23C9733B0(v7, v8, &v12);
    sub_23C991240();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C948000, v3, v4, "[%{public}s] Dealloc", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEADB0](v6, -1, -1);
    MEMORY[0x23ECEADB0](v5, -1, -1);
  }
  else
  {
  }
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_settingsDiffInspector], sel_removeAllObservers, v11, v12);
  sub_23C963BE8();
  uint64_t v9 = (objc_class *)type metadata accessor for ActivityHostViewController();
  v13.receiver = v2;
  v13.super_class = v9;
  return objc_msgSendSuper2(&v13, sel_dealloc);
}

void sub_23C96A57C()
{
  BSDispatchQueueAssertMain();
  v1.receiver = v0;
  v1.super_class = (Class)type metadata accessor for ActivityHostViewController();
  objc_msgSendSuper2(&v1, sel_viewDidLoad);
  sub_23C96834C();
  sub_23C96856C();
}

uint64_t sub_23C96A610(char a1)
{
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for ActivityHostViewController();
  objc_msgSendSuper2(&v11, sel_viewWillAppear_, a1 & 1);
  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  BSDispatchQueueAssertMain();
  os_log_type_t v4 = *(void **)&v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene];
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = sub_23C975C1C;
    *(void *)(v5 + 24) = v3;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = sub_23C977F48;
    *(void *)(v6 + 24) = v5;
    v10[4] = sub_23C977F48;
    v10[5] = v6;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 1107296256;
    id v10[2] = sub_23C96EF18;
    v10[3] = &block_descriptor_46;
    uint64_t v7 = _Block_copy(v10);
    id v8 = v4;
    swift_retain();
    swift_release();
    objc_msgSend(v8, sel_performUpdate_, v7);

    _Block_release(v7);
    LOBYTE(v7) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    uint64_t result = swift_release();
    if ((v7 & 1) == 0) {
      return result;
    }
    __break(1u);
  }
  return swift_release();
}

void sub_23C96A7E0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a3 + 16;
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x23ECEAE20](v4);
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    type metadata accessor for ActivityMutableSceneSettings();
    uint64_t v7 = swift_dynamicCastClass();
    if (v7)
    {
      id v8 = (void *)v7;
      id v9 = a1;
      id v10 = objc_msgSend(v6, sel_traitCollection);
      id v11 = objc_msgSend(v10, sel_userInterfaceStyle);

      objc_msgSend(v8, sel_setUserInterfaceStyle_, v11);
      uint64_t v6 = v9;
    }
  }
}

void sub_23C96A910(id a1)
{
  if (a1) {
    id v3 = objc_msgSend(a1, sel_userInterfaceStyle);
  }
  else {
    id v3 = 0;
  }
  id v4 = objc_msgSend(v1, sel_traitCollection);
  id v5 = objc_msgSend(v4, sel_userInterfaceStyle);

  if (!a1 || v3 != v5)
  {
    MEMORY[0x270FA5388](v6);
    v12[2] = v5;
    BSDispatchQueueAssertMain();
    uint64_t v7 = *(void **)&v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene];
    if (v7)
    {
      uint64_t v8 = swift_allocObject();
      *(void *)(v8 + 16) = sub_23C975C44;
      *(void *)(v8 + 24) = v12;
      uint64_t v9 = swift_allocObject();
      *(void *)(v9 + 16) = sub_23C977F48;
      *(void *)(v9 + 24) = v8;
      aBlock[4] = sub_23C977F48;
      aBlock[5] = v9;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_23C96EF18;
      aBlock[3] = &block_descriptor_57;
      id v10 = _Block_copy(aBlock);
      id v11 = v7;
      swift_retain();
      swift_release();
      objc_msgSend(v11, sel_performUpdate_, v10);

      _Block_release(v10);
      LOBYTE(v10) = swift_isEscapingClosureAtFileLocation();
      swift_release();
      swift_release();
      if (v10) {
        __break(1u);
      }
    }
  }
}

id sub_23C96AB14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for ActivityMutableSceneSettings();
  id result = (id)swift_dynamicCastClass();
  if (result)
  {
    return objc_msgSend(result, sel_setUserInterfaceStyle_, a3);
  }
  return result;
}

void sub_23C96ABE4(uint64_t a1, char a2)
{
  BSDispatchQueueAssertMain();
  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for ActivityHostViewController();
  objc_msgSendSuper2(&v6, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a1, a2 & 1);
  id v5 = &v2[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_shouldShareTouchesWithHost];
  swift_beginAccess();
  if (*v5 == 1)
  {
    if (a1) {
      sub_23C9679D8();
    }
    else {
      sub_23C9681C4();
    }
  }
}

void sub_23C96AD24()
{
  objc_super v1 = *(void **)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_debugLabel];
  if (!v1) {
    return;
  }
  id v2 = v1;
  objc_msgSend(v2, sel_sizeToFit);
  id v3 = v2;
  objc_msgSend(v3, sel_bounds);
  CGRect v11 = CGRectInset(v10, -4.0, -4.0);
  objc_msgSend(v3, sel_setBounds_, v11.origin.x, v11.origin.y, v11.size.width, v11.size.height);

  id v4 = v3;
  id v5 = objc_msgSend(v0, sel_view);
  if (!v5)
  {
    __break(1u);
    goto LABEL_9;
  }
  objc_super v6 = v5;
  objc_msgSend(v5, sel_bounds);

  UIRectGetCenter();
  objc_msgSend(v4, sel_setCenter_);

  id v7 = objc_msgSend(v0, sel_view);
  if (!v7)
  {
LABEL_9:
    __break(1u);
    return;
  }
  id v8 = v7;
  objc_msgSend(v7, sel_bringSubviewToFront_, v4);
}

void sub_23C96AEE8()
{
}

void sub_23C96AF44()
{
}

void sub_23C96AFA0()
{
  algn_268BBDBD8[7] = -18;
}

uint64_t sub_23C96AFD0(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v25 = a3;
  uint64_t v10 = sub_23C990F30();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  objc_super v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_23C990F50();
  uint64_t v14 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  id v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v17 = objc_msgSend(a2, sel_error);
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = v17;
  v18[3] = a4;
  void v18[4] = a5;
  v18[5] = a6;
  aBlock[4] = sub_23C977B78;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23C96B674;
  aBlock[3] = &block_descriptor_297;
  uint64_t v19 = _Block_copy(aBlock);
  id v20 = v17;
  id v21 = a4;
  swift_retain();
  sub_23C990F40();
  uint64_t v26 = MEMORY[0x263F8EE78];
  sub_23C97764C(&qword_26AF22758, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF22770);
  sub_23C977AB0((unint64_t *)&unk_26AF22778, &qword_26AF22770);
  sub_23C991280();
  MEMORY[0x23ECE9FE0](0, v16, v13, v19);
  _Block_release(v19);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v24);
  return swift_release();
}

uint64_t sub_23C96B2B4(void *a1, void *a2, uint64_t (*a3)(void *))
{
  if (a1)
  {
    if (qword_26AF22748 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_23C990E40();
    __swift_project_value_buffer(v6, (uint64_t)qword_26AF22728);
    id v7 = a2;
    id v8 = a1;
    id v9 = v7;
    id v10 = a1;
    uint64_t v11 = sub_23C990E20();
    os_log_type_t v12 = sub_23C991140();
    if (!os_log_type_enabled(v11, v12))
    {

      return a3(a1);
    }
    uint64_t v13 = swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    uint64_t v28 = v27;
    *(_DWORD *)uint64_t v13 = 136446466;
    uint64_t v14 = sub_23C96245C();
    sub_23C9733B0(v14, v15, &v28);
    sub_23C991240();

    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2082;
    swift_getErrorValue();
    uint64_t v16 = sub_23C991560();
    sub_23C9733B0(v16, v17, &v28);
    sub_23C991240();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23C948000, v11, v12, "[%{public}s] Ensure content failed: %{public}s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23ECEADB0](v27, -1, -1);
    uint64_t v18 = v13;
  }
  else
  {
    if (qword_26AF22748 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_23C990E40();
    __swift_project_value_buffer(v19, (uint64_t)qword_26AF22728);
    id v20 = a2;
    uint64_t v11 = sub_23C990E20();
    os_log_type_t v21 = sub_23C991140();
    if (!os_log_type_enabled(v11, v21))
    {

      return a3(a1);
    }
    id v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    uint64_t v28 = v23;
    *(_DWORD *)id v22 = 136446210;
    uint64_t v24 = sub_23C96245C();
    sub_23C9733B0(v24, v25, &v28);
    sub_23C991240();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C948000, v11, v21, "[%{public}s] Ensure content complete", v22, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEADB0](v23, -1, -1);
    uint64_t v18 = (uint64_t)v22;
  }
  MEMORY[0x23ECEADB0](v18, -1, -1);

  return a3(a1);
}

uint64_t sub_23C96B678(uint64_t a1, uint64_t a2)
{
  id v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

void sub_23C96B6CC(void *a1, void *a2, uint64_t a3, const char *a4)
{
  if (qword_26AF22748 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_23C990E40();
  __swift_project_value_buffer(v7, (uint64_t)qword_26AF22728);
  id v8 = a1;
  id v9 = sub_23C990E20();
  os_log_type_t v10 = sub_23C991140();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v16 = v12;
    *(_DWORD *)uint64_t v11 = 136446210;
    uint64_t v13 = sub_23C96245C();
    sub_23C9733B0(v13, v14, &v16);
    sub_23C991240();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C948000, v9, v10, a4, v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEADB0](v12, -1, -1);
    MEMORY[0x23ECEADB0](v11, -1, -1);
  }
  else
  {
  }
  unint64_t v15 = (void *)sub_23C990FC0();
  objc_msgSend(a2, sel_satisfyMilestone_, v15);
}

void sub_23C96B8C8(void *a1, void *a2)
{
  if (qword_26AF22748 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_23C990E40();
  __swift_project_value_buffer(v4, (uint64_t)qword_26AF22728);
  id v5 = a1;
  uint64_t v6 = sub_23C990E20();
  os_log_type_t v7 = sub_23C991140();
  if (os_log_type_enabled(v6, v7))
  {
    id v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v13 = v9;
    *(_DWORD *)id v8 = 136446210;
    uint64_t v10 = sub_23C96245C();
    sub_23C9733B0(v10, v11, &v13);
    sub_23C991240();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C948000, v6, v7, "[%{public}s] Ensure content: scene activated", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEADB0](v9, -1, -1);
    MEMORY[0x23ECEADB0](v8, -1, -1);
  }
  else
  {
  }
  if (qword_268BBA4B0 != -1) {
    swift_once();
  }
  uint64_t v12 = (void *)sub_23C990FC0();
  objc_msgSend(a2, sel_satisfyMilestone_, v12);
}

id sub_23C96BAD4(void *a1, id a2)
{
  if ((objc_msgSend(a2, sel_isComplete) & 1) == 0)
  {
    uint64_t v4 = (void *)sub_23C990FC0();
    objc_msgSend(a2, sel_failWithReason_, v4);
  }
  return objc_msgSend(a1, sel_invalidate);
}

void sub_23C96BC18(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_23C990B20();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t sub_23C96BD9C()
{
  uint64_t v1 = v0;
  sub_23C991330();
  sub_23C991000();
  if (*(_DWORD *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController__presentationMode) >= 3u)
  {
    uint64_t result = sub_23C991500();
    __break(1u);
  }
  else
  {
    sub_23C991000();
    swift_bridgeObjectRelease();
    sub_23C991000();
    sub_23C991000();
    swift_bridgeObjectRelease();
    sub_23C991000();
    id v2 = *(void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scenePresenter);
    if (v2)
    {
      id v3 = objc_msgSend(v2, sel_description);
      sub_23C990FD0();
    }
    sub_23C991000();
    swift_bridgeObjectRelease();
    sub_23C991000();
    id v4 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_liveSceneSnapshotView);
    if (v4)
    {
      id v5 = objc_msgSend(v4, sel_description);
      sub_23C990FD0();
    }
    sub_23C991000();
    swift_bridgeObjectRelease();
    sub_23C991000();
    uint64_t v6 = (id *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activitySceneDescriptor);
    swift_beginAccess();
    id v7 = *v6;
    id v8 = objc_msgSend(v7, sel_description);
    sub_23C990FD0();

    sub_23C991000();
    swift_bridgeObjectRelease();
    sub_23C991000();
    uint64_t v9 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene);
    if (v9)
    {
      id v10 = objc_msgSend(v9, sel_description);
      sub_23C990FD0();
    }
    sub_23C991000();
    swift_bridgeObjectRelease();
    sub_23C991000();
    return 0;
  }
  return result;
}

void sub_23C96C1E8(char *a1, void *a2)
{
  char v2 = *a1;
  id v3 = (unsigned char *)(*a2 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_shouldShareTouchesWithHost);
  swift_beginAccess();
  *id v3 = v2;
  BSDispatchQueueAssertMain();
  if (*v3 == 1) {
    sub_23C9679D8();
  }
  else {
    sub_23C9681C4();
  }
}

void sub_23C96C2E8(uint64_t a1, uint64_t (*a2)(void), const char *a3, void *a4, SEL *a5)
{
  v40[6] = *MEMORY[0x263EF8340];
  uint64_t v9 = a1 + 16;
  swift_beginAccess();
  uint64_t v10 = MEMORY[0x23ECEAE20](v9);
  if (v10)
  {
    id v11 = (id)v10;
    uint64_t v12 = *(void **)(v10 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene);
    if (v12)
    {
      id v13 = objc_msgSend(v12, sel_clientSettings);
      if (v13)
      {
        id v14 = v13;
        type metadata accessor for ActivitySceneClientSettings();
        uint64_t v15 = swift_dynamicCastClass();
        if (v15)
        {
          uint64_t v16 = (void *)v15;
          if (qword_26AF22748 != -1) {
            swift_once();
          }
          uint64_t v17 = sub_23C990E40();
          __swift_project_value_buffer(v17, (uint64_t)qword_26AF22728);
          id v18 = v11;
          id v19 = v14;
          id v20 = (char *)v18;
          id v14 = v19;
          os_log_type_t v21 = sub_23C990E20();
          os_log_type_t v22 = sub_23C991120();
          uint64_t v23 = &selRef_presentationMode;
          if (os_log_type_enabled(v21, v22))
          {
            os_log_type_t v36 = v22;
            log = v21;
            uint64_t v24 = swift_slowAlloc();
            char v35 = (void *)swift_slowAlloc();
            uint64_t v37 = swift_slowAlloc();
            v40[0] = v37;
            *(_DWORD *)uint64_t v24 = 136446466;
            uint64_t v25 = sub_23C96245C();
            sub_23C9733B0(v25, v26, v40);
            sub_23C991240();

            swift_bridgeObjectRelease();
            *(_WORD *)(v24 + 12) = 2114;
            uint64_t v39 = v16;
            id v27 = objc_msgSend(v16, sel_otherSettings);
            uint64_t v28 = a2();

            sub_23C991240();
            *char v35 = v28;

            _os_log_impl(&dword_23C948000, log, v36, a3, (uint8_t *)v24, 0x16u);
            __swift_instantiateConcreteTypeFromMangledName(&qword_26AF22818);
            swift_arrayDestroy();
            MEMORY[0x23ECEADB0](v35, -1, -1);
            swift_arrayDestroy();
            MEMORY[0x23ECEADB0](v37, -1, -1);
            MEMORY[0x23ECEADB0](v24, -1, -1);

            uint64_t v16 = v39;
            uint64_t v23 = &selRef_presentationMode;
          }
          else
          {
          }
          id v29 = objc_msgSend(v16, v23[197], v35);
          uint64_t v30 = (void *)a2();

          id v31 = (void **)&v20[*a4];
          swift_beginAccess();
          id v32 = *v31;
          void *v31 = v30;
          id v11 = v30;

          BSDispatchQueueAssertMain();
          char v33 = &v20[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_delegate];
          swift_beginAccess();
          unint64_t v34 = (void *)MEMORY[0x23ECEAE20](v33);
          if (v34)
          {
            objc_msgSend(v34, *a5, v20);

            swift_unknownObjectRelease();
            return;
          }
        }
      }
    }
  }
}

void sub_23C96C6E0(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x23ECEAE20](v1);
  if (!v2) {
    return;
  }
  id v3 = (void *)v2;
  id v4 = *(void **)(v2 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene);
  if (!v4 || (id v5 = objc_msgSend(v4, sel_clientSettings)) == 0)
  {
LABEL_8:

    return;
  }
  uint64_t v6 = v5;
  type metadata accessor for ActivitySceneClientSettings();
  id v7 = (void *)swift_dynamicCastClass();
  if (!v7)
  {

    goto LABEL_8;
  }
  id v8 = v7;
  id v9 = objc_msgSend(v7, sel_otherSettings);
  swift_beginAccess();
  if (objc_msgSend(v9, sel_objectForSetting_, qword_268BBAF58))
  {
    sub_23C991270();
    swift_unknownObjectRelease();
    sub_23C95CAC4(v46, &v48);
  }
  else
  {
    long long v48 = 0u;
    long long v49 = 0u;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF22BA0);
  if (swift_dynamicCast())
  {
    char v10 = v46[0];
  }
  else
  {
    char v10 = 2;
    LOBYTE(v46[0]) = 2;
  }

  if (qword_26AF22748 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_23C990E40();
  __swift_project_value_buffer(v11, (uint64_t)qword_26AF22728);
  uint64_t v12 = v3;
  id v13 = sub_23C990E20();
  os_log_type_t v14 = sub_23C991120();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    *(void *)&long long v48 = v16;
    *(_DWORD *)uint64_t v15 = 136446210;
    uint64_t v17 = sub_23C96245C();
    *(void *)&v46[0] = sub_23C9733B0(v17, v18, (uint64_t *)&v48);
    sub_23C991240();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C948000, v13, v14, "[%{public}s] ClientSetting[archiveContentReady] did change to YES.", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEADB0](v16, -1, -1);
    MEMORY[0x23ECEADB0](v15, -1, -1);
  }
  else
  {
  }
  id v19 = objc_msgSend(v8, sel_otherSettings);
  swift_beginAccess();
  if (objc_msgSend(v19, sel_objectForSetting_, qword_268BBAF88))
  {
    sub_23C991270();
    swift_unknownObjectRelease();
    sub_23C95CAC4(v46, &v48);
  }
  else
  {
    long long v48 = 0u;
    long long v49 = 0u;
  }
  type metadata accessor for ActivitySceneMetrics();
  if (swift_dynamicCast())
  {
    id v20 = *(void **)&v46[0];
  }
  else
  {
    id v20 = 0;
    *(void *)&v46[0] = 0;
  }

  os_log_type_t v21 = (void **)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_resolvedMetrics];
  swift_beginAccess();
  os_log_type_t v22 = *v21;
  *os_log_type_t v21 = v20;
  id v23 = v20;

  BSDispatchQueueAssertMain();
  sub_23C96726C();

  id v24 = objc_msgSend(v8, sel_otherSettings);
  uint64_t v25 = (void *)sub_23C97AC88(v24);

  unint64_t v26 = (void **)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_backgroundTintColor];
  swift_beginAccess();
  id v27 = *v26;
  *unint64_t v26 = v25;
  id v28 = v25;

  BSDispatchQueueAssertMain();
  id v29 = &v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_delegate];
  swift_beginAccess();
  uint64_t v30 = (void *)MEMORY[0x23ECEAE20](v29);
  if (v30)
  {
    objc_msgSend(v30, sel_activityHostViewControllerBackgroundTintColorDidChangeWithViewController_, v12);

    swift_unknownObjectRelease();
  }
  else
  {
  }
  id v31 = objc_msgSend(v8, sel_otherSettings);
  id v32 = (void *)sub_23C97AC94(v31);

  char v33 = (void **)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_textColor];
  swift_beginAccess();
  unint64_t v34 = *v33;
  *char v33 = v32;
  id v35 = v32;

  BSDispatchQueueAssertMain();
  os_log_type_t v36 = (void *)MEMORY[0x23ECEAE20](v29);
  if (v36)
  {
    objc_msgSend(v36, sel_activityHostViewControllerTextColorDidChangeWithViewController_, v12);

    swift_unknownObjectRelease();
  }
  else
  {
  }
  id v37 = objc_msgSend(v8, sel_otherSettings);
  swift_beginAccess();
  if (objc_msgSend(v37, sel_objectForSetting_, qword_268BBAFA0))
  {
    sub_23C991270();
    swift_unknownObjectRelease();
    sub_23C95CAC4(v46, &v48);
  }
  else
  {
    long long v48 = 0u;
    long long v49 = 0u;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF22B70);
  if (swift_dynamicCast())
  {
    uint64_t v38 = v47;

    if (v38)
    {
      uint64_t v39 = &v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activityTouchRestrictedRects];
      swift_beginAccess();
      *(void *)uint64_t v39 = v38;
      swift_bridgeObjectRelease();
    }
    if ((v10 & 1) == 0) {
      goto LABEL_38;
    }
  }
  else
  {
    uint64_t v47 = 0;

    if ((v10 & 1) == 0)
    {
LABEL_38:

      return;
    }
  }
  char v40 = &v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_waitingForArchiveContentReadyBlocks];
  swift_beginAccess();
  uint64_t v41 = *(void *)v40;
  uint64_t v42 = *(void *)(*(void *)v40 + 16);
  if (v42)
  {
    swift_bridgeObjectRetain();
    uint64_t v43 = v41 + 40;
    do
    {
      uint64_t v44 = *(void (**)(uint64_t))(v43 - 8);
      uint64_t v45 = swift_retain();
      v44(v45);
      swift_release();
      v43 += 16;
      --v42;
    }
    while (v42);
    swift_bridgeObjectRelease();
  }
  *(void *)char v40 = MEMORY[0x263F8EE78];

  swift_bridgeObjectRelease();
}

void sub_23C96CDC0(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x23ECEAE20](v1);
  if (v2)
  {
    id v3 = (void *)v2;
    id v4 = *(void **)(v2 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene);
    if (v4 && (id v5 = objc_msgSend(v4, sel_clientSettings)) != 0)
    {
      uint64_t v6 = v5;
      type metadata accessor for ActivitySceneClientSettings();
      uint64_t v7 = swift_dynamicCastClass();
      if (v7)
      {
        id v8 = (void *)v7;
        if (qword_26AF22748 != -1) {
          swift_once();
        }
        uint64_t v9 = sub_23C990E40();
        __swift_project_value_buffer(v9, (uint64_t)qword_26AF22728);
        id v10 = v3;
        id v11 = v6;
        uint64_t v12 = (char *)v10;
        id v13 = v11;
        os_log_type_t v14 = sub_23C990E20();
        os_log_type_t v15 = sub_23C991120();
        if (os_log_type_enabled(v14, v15))
        {
          uint64_t v38 = v13;
          uint64_t v16 = swift_slowAlloc();
          uint64_t v37 = swift_slowAlloc();
          v43[0] = v37;
          *(_DWORD *)uint64_t v16 = 136446466;
          uint64_t v17 = sub_23C96245C();
          *(void *)&long long v41 = sub_23C9733B0(v17, v18, v43);
          sub_23C991240();

          swift_bridgeObjectRelease();
          *(_WORD *)(v16 + 12) = 2082;
          id v19 = objc_msgSend(v8, sel_otherSettings);
          swift_beginAccess();
          if (objc_msgSend(v19, sel_objectForSetting_, qword_268BBAF88))
          {
            sub_23C991270();
            swift_unknownObjectRelease();
            sub_23C95CAC4(v40, &v41);
          }
          else
          {
            long long v41 = 0u;
            long long v42 = 0u;
          }
          __swift_instantiateConcreteTypeFromMangledName(&qword_26AF22BA0);
          type metadata accessor for ActivitySceneMetrics();
          if (swift_dynamicCast())
          {
            id v20 = v39;

            if (v39)
            {
              id v21 = objc_msgSend(v39, sel_description);

              uint64_t v22 = sub_23C990FD0();
              id v20 = v23;
            }
            else
            {
              uint64_t v22 = 0;
            }
          }
          else
          {

            uint64_t v22 = 0;
            id v20 = 0;
          }
          *(void *)&long long v41 = v22;
          *((void *)&v41 + 1) = v20;
          __swift_instantiateConcreteTypeFromMangledName(&qword_268BBAEC0);
          uint64_t v24 = sub_23C990FE0();
          *(void *)&long long v41 = sub_23C9733B0(v24, v25, v43);
          sub_23C991240();
          id v13 = v38;

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_23C948000, v14, v15, "[%{public}s] ClientSetting[resolvedMetrics] did change to %{public}s", (uint8_t *)v16, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x23ECEADB0](v37, -1, -1);
          MEMORY[0x23ECEADB0](v16, -1, -1);
        }
        else
        {
        }
        id v26 = objc_msgSend(v8, sel_otherSettings, v37);
        swift_beginAccess();
        if (objc_msgSend(v26, sel_objectForSetting_, qword_268BBAF88))
        {
          sub_23C991270();
          swift_unknownObjectRelease();
          sub_23C95CAC4(v40, &v41);
        }
        else
        {
          long long v41 = 0u;
          long long v42 = 0u;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_26AF22BA0);
        type metadata accessor for ActivitySceneMetrics();
        if (swift_dynamicCast())
        {
          id v27 = *(void **)&v40[0];
        }
        else
        {
          id v27 = 0;
          *(void *)&v40[0] = 0;
        }

        id v28 = (void **)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_resolvedMetrics];
        swift_beginAccess();
        id v29 = *v28;
        *id v28 = v27;
        id v30 = v27;

        BSDispatchQueueAssertMain();
        sub_23C96726C();

        if (*v28)
        {
          id v31 = &v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_waitingForInitialContentSizeReadyBlocks];
          swift_beginAccess();
          uint64_t v32 = *(void *)v31;
          uint64_t v33 = *(void *)(*(void *)v31 + 16);
          if (v33)
          {
            swift_bridgeObjectRetain();
            uint64_t v34 = v32 + 40;
            do
            {
              id v35 = *(void (**)(uint64_t))(v34 - 8);
              uint64_t v36 = swift_retain();
              v35(v36);
              swift_release();
              v34 += 16;
              --v33;
            }
            while (v33);
            swift_bridgeObjectRelease();
          }
          *(void *)id v31 = MEMORY[0x263F8EE78];

          swift_bridgeObjectRelease();
        }
        else
        {
        }
      }
      else
      {
      }
    }
    else
    {
    }
  }
}

void sub_23C96D328(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x23ECEAE20](v1);
  if (!v2) {
    return;
  }
  id v3 = (void *)v2;
  id v4 = *(void **)(v2 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene);
  if (!v4 || (id v5 = objc_msgSend(v4, sel_clientSettings)) == 0)
  {

    return;
  }
  uint64_t v6 = v5;
  type metadata accessor for ActivitySceneClientSettings();
  uint64_t v7 = (void *)swift_dynamicCastClass();
  if (!v7)
  {

    return;
  }
  id v8 = objc_msgSend(v7, sel_otherSettings);
  swift_beginAccess();
  if (objc_msgSend(v8, sel_objectForSetting_, qword_268BBAFA0))
  {
    sub_23C991270();
    swift_unknownObjectRelease();
    sub_23C95CAC4(&v26, v27);
  }
  else
  {
    memset(v27, 0, sizeof(v27));
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF22BA0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF22B70);
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v28 = 0;

    goto LABEL_17;
  }
  uint64_t v9 = v28;

  if (!v9)
  {
LABEL_17:

    return;
  }
  if (qword_26AF22748 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_23C990E40();
  __swift_project_value_buffer(v10, (uint64_t)qword_26AF22728);
  id v11 = v3;
  swift_bridgeObjectRetain_n();
  uint64_t v12 = (char *)v11;
  id v13 = sub_23C990E20();
  os_log_type_t v14 = sub_23C991120();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    *(void *)&v27[0] = v25;
    *(_DWORD *)uint64_t v15 = 136446466;
    uint64_t v16 = sub_23C96245C();
    *(void *)&long long v26 = sub_23C9733B0(v16, v17, (uint64_t *)v27);
    sub_23C991240();

    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2082;
    type metadata accessor for CGRect(0);
    uint64_t v19 = v18;
    uint64_t v20 = swift_bridgeObjectRetain();
    uint64_t v21 = MEMORY[0x23ECE9ED0](v20, v19);
    unint64_t v23 = v22;
    swift_bridgeObjectRelease();
    *(void *)&long long v26 = sub_23C9733B0(v21, v23, (uint64_t *)v27);
    sub_23C991240();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C948000, v13, v14, "[%{public}s] ClientSetting[touchRestrictedRects] did change to %{public}s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23ECEADB0](v25, -1, -1);
    MEMORY[0x23ECEADB0](v15, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v24 = &v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activityTouchRestrictedRects];
  swift_beginAccess();
  *(void *)uint64_t v24 = v9;

  swift_bridgeObjectRelease();
}

void sub_23C96D6F0(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x23ECEAE20](v1);
  if (v2)
  {
    id v3 = (void *)v2;
    id v4 = *(void **)(v2 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene);
    if (!v4 || (id v5 = objc_msgSend(v4, sel_clientSettings)) == 0)
    {

      return;
    }
    uint64_t v6 = v5;
    type metadata accessor for ActivitySceneClientSettings();
    uint64_t v7 = (void *)swift_dynamicCastClass();
    if (!v7)
    {

      return;
    }
    id v8 = objc_msgSend(v7, sel_otherSettings);
    swift_beginAccess();
    if (objc_msgSend(v8, sel_objectForSetting_, qword_268BBAFB8))
    {
      sub_23C991270();
      swift_unknownObjectRelease();
      sub_23C95CAC4(&v22, v23);
    }
    else
    {
      memset(v23, 0, sizeof(v23));
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF22BA0);
    if (swift_dynamicCast())
    {
      int v9 = v24;

      if (v9 != 2)
      {
        int v10 = v9 & 1;
        if (qword_26AF22748 != -1) {
          swift_once();
        }
        uint64_t v11 = sub_23C990E40();
        __swift_project_value_buffer(v11, (uint64_t)qword_26AF22728);
        uint64_t v12 = v3;
        id v13 = sub_23C990E20();
        os_log_type_t v14 = sub_23C991120();
        if (os_log_type_enabled(v13, v14))
        {
          uint64_t v15 = swift_slowAlloc();
          uint64_t v16 = swift_slowAlloc();
          *(void *)&v23[0] = v16;
          *(_DWORD *)uint64_t v15 = 136446466;
          uint64_t v17 = sub_23C96245C();
          *(void *)&long long v22 = sub_23C9733B0(v17, v18, (uint64_t *)v23);
          sub_23C991240();

          swift_bridgeObjectRelease();
          *(_WORD *)(v15 + 12) = 1026;
          LODWORD(v22) = v10;
          sub_23C991240();
          _os_log_impl(&dword_23C948000, v13, v14, "[%{public}s] ClientSetting[DisableIdleTimer] did change to %{BOOL,public}d", (uint8_t *)v15, 0x12u);
          swift_arrayDestroy();
          MEMORY[0x23ECEADB0](v16, -1, -1);
          MEMORY[0x23ECEADB0](v15, -1, -1);
        }
        else
        {
        }
        uint64_t v19 = (unsigned __int8 *)&v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_idleTimerDisabled];
        swift_beginAccess();
        *uint64_t v19 = v10;
        BSDispatchQueueAssertMain();
        uint64_t v20 = &v12[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_delegate];
        swift_beginAccess();
        uint64_t v21 = (void *)MEMORY[0x23ECEAE20](v20);
        if (v21)
        {
          objc_msgSend(v21, sel_activityHostViewControllerWithViewController_didSetIdleTimerDisabled_, v12, *v19);

          swift_unknownObjectRelease();
          return;
        }

        goto LABEL_18;
      }
    }
    else
    {
      unsigned __int8 v24 = 2;
    }
LABEL_18:
  }
}

void sub_23C96DA8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess();
  uint64_t v3 = MEMORY[0x23ECEAE20](v2);
  if (v3)
  {
    id v4 = (id)v3;
    id v5 = *(void **)(v3 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene);
    if (v5)
    {
      id v6 = objc_msgSend(v5, sel_clientSettings);
      if (v6)
      {
        uint64_t v7 = v6;
        type metadata accessor for ActivitySceneClientSettings();
        uint64_t v8 = swift_dynamicCastClass();
        if (v8)
        {
          int v9 = (void *)v8;
          if (qword_26AF22748 != -1) {
            swift_once();
          }
          uint64_t v10 = sub_23C990E40();
          __swift_project_value_buffer(v10, (uint64_t)qword_26AF22728);
          id v11 = v4;
          id v12 = v7;
          id v13 = (char *)v11;
          id v4 = v12;
          os_log_type_t v14 = sub_23C990E20();
          os_log_type_t v15 = sub_23C991120();
          if (os_log_type_enabled(v14, v15))
          {
            uint64_t v16 = swift_slowAlloc();
            uint64_t v17 = swift_slowAlloc();
            v30[0] = v17;
            *(_DWORD *)uint64_t v16 = 136446466;
            uint64_t v18 = sub_23C96245C();
            sub_23C9733B0(v18, v19, v30);
            sub_23C991240();

            swift_bridgeObjectRelease();
            *(_WORD *)(v16 + 12) = 2082;
            id v20 = objc_msgSend(v9, sel_audioCategoriesDisablingVolumeHUD);
            if (v20)
            {
              uint64_t v21 = v20;
              sub_23C991070();
            }
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268BBB298);
            uint64_t v22 = sub_23C990FE0();
            sub_23C9733B0(v22, v23, v30);
            sub_23C991240();

            swift_bridgeObjectRelease();
            _os_log_impl(&dword_23C948000, v14, v15, "[%{public}s] ClientSetting[audioCategoriesDisablingVolumeHUD] did change to: %{public}s", (uint8_t *)v16, 0x16u);
            swift_arrayDestroy();
            MEMORY[0x23ECEADB0](v17, -1, -1);
            MEMORY[0x23ECEADB0](v16, -1, -1);
          }
          else
          {
          }
          id v24 = objc_msgSend(v9, sel_audioCategoriesDisablingVolumeHUD);
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = sub_23C991070();
          }
          else
          {
            uint64_t v26 = 0;
          }
          id v27 = (uint64_t *)&v13[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_audioCategoriesDisablingVolumeHUD];
          swift_beginAccess();
          *id v27 = v26;
          swift_bridgeObjectRelease();
          BSDispatchQueueAssertMain();
          uint64_t v28 = &v13[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_delegate];
          swift_beginAccess();
          id v29 = (void *)MEMORY[0x23ECEAE20](v28);
          if (v29)
          {
            objc_msgSend(v29, sel_activityHostViewControllerAudioCategoriesDisablingVolumeHUDDidChangeWithViewController_, v13);

            swift_unknownObjectRelease();
            return;
          }
        }
        else
        {
        }
      }
    }
  }
}

void sub_23C96DE24(uint64_t a1)
{
  uint64_t v2 = sub_23C990E40();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  id v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x23ECEAE20](a1 + 16);
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    uint64_t v8 = *(void **)(v6 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene);
    if (v8)
    {
      id v9 = objc_msgSend(v8, sel_clientSettings);
      if (v9)
      {
        uint64_t v10 = v9;
        type metadata accessor for ActivitySceneClientSettings();
        id v11 = (void *)swift_dynamicCastClass();
        if (v11)
        {
          id v12 = objc_msgSend(v11, sel_otherSettings);
          swift_beginAccess();
          if (objc_msgSend(v12, sel_objectForSetting_, qword_268BBAFD0))
          {
            sub_23C991270();
            swift_unknownObjectRelease();
            sub_23C95CAC4(&v38, v39);
          }
          else
          {
            memset(v39, 0, sizeof(v39));
          }
          __swift_instantiateConcreteTypeFromMangledName(&qword_26AF22BA0);
          int v13 = swift_dynamicCast();
          if (v13)
          {
            uint64_t v14 = v40;
            char v41 = v13 ^ 1;

            if (v14 == 1) {
              int v15 = 1;
            }
            else {
              int v15 = 2;
            }
            if (v14) {
              goto LABEL_17;
            }
          }
          else
          {
            uint64_t v40 = 0;
            char v41 = v13 ^ 1;
          }
          int v15 = 0;
LABEL_17:
          if (v13) {
            LODWORD(v16) = v15;
          }
          else {
            LODWORD(v16) = 2;
          }
          if (qword_26AF22748 != -1) {
            swift_once();
          }
          uint64_t v17 = __swift_project_value_buffer(v2, (uint64_t)qword_26AF22728);
          (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v17, v2);
          uint64_t v18 = v7;
          unint64_t v19 = sub_23C990E20();
          os_log_type_t v20 = sub_23C991120();
          int v21 = v20;
          if (os_log_type_enabled(v19, v20))
          {
            uint64_t v22 = swift_slowAlloc();
            int v37 = v16;
            uint64_t v16 = v22;
            uint64_t v36 = swift_slowAlloc();
            *(void *)&v39[0] = v36;
            *(_DWORD *)uint64_t v16 = 136446466;
            os_log_t v35 = v19;
            uint64_t v23 = sub_23C96245C();
            *(void *)&long long v38 = sub_23C9733B0(v23, v24, (uint64_t *)v39);
            HIDWORD(v34) = v21;
            sub_23C991240();

            swift_bridgeObjectRelease();
            int v25 = v37;
            *(_WORD *)(v16 + 12) = 2082;
            unint64_t v26 = 0xE600000000000000;
            uint64_t v27 = 0x6D756964656DLL;
            if (!v25)
            {
              uint64_t v27 = 0x6C6C616D73;
              unint64_t v26 = 0xE500000000000000;
            }
            if (v25 == 2) {
              uint64_t v28 = 7104878;
            }
            else {
              uint64_t v28 = v27;
            }
            if (v25 == 2) {
              unint64_t v29 = 0xE300000000000000;
            }
            else {
              unint64_t v29 = v26;
            }
            *(void *)&long long v38 = sub_23C9733B0(v28, v29, (uint64_t *)v39);
            sub_23C991240();
            swift_bridgeObjectRelease();
            os_log_t v30 = v35;
            _os_log_impl(&dword_23C948000, v35, BYTE4(v34), "[%{public}s] ClientSetting[ArchivedActivityFamily] did change to %{public}s", (uint8_t *)v16, 0x16u);
            uint64_t v31 = v36;
            swift_arrayDestroy();
            MEMORY[0x23ECEADB0](v31, -1, -1);
            uint64_t v32 = v16;
            LOBYTE(v16) = v37;
            MEMORY[0x23ECEADB0](v32, -1, -1);
          }
          else
          {
          }
          (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
          uint64_t v33 = &v18[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_archivedActivityFamily];
          swift_beginAccess();
          *uint64_t v33 = v16;
          goto LABEL_34;
        }
      }
    }
LABEL_34:
  }
}

void sub_23C96E2A4(uint64_t a1)
{
  uint64_t v2 = sub_23C990E40();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  id v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x23ECEAE20](a1 + 16);
  if (!v6) {
    return;
  }
  id v7 = (id)v6;
  uint64_t v8 = *(void **)(v6 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene);
  if (!v8 || (id v9 = objc_msgSend(v8, sel_clientSettings)) == 0)
  {
LABEL_32:

    return;
  }
  uint64_t v10 = v9;
  type metadata accessor for ActivitySceneClientSettings();
  id v11 = (void *)swift_dynamicCastClass();
  if (!v11)
  {
LABEL_31:

    goto LABEL_32;
  }
  id v12 = objc_msgSend(v11, sel_otherSettings);
  swift_beginAccess();
  if (objc_msgSend(v12, sel_objectForSetting_, qword_268BBAFE8))
  {
    sub_23C991270();
    swift_unknownObjectRelease();
    sub_23C95CAC4(&v39, v41);
  }
  else
  {
    memset(v41, 0, sizeof(v41));
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF22BA0);
  if (swift_dynamicCast())
  {
    int v13 = v39;
  }
  else
  {
    int v13 = 2;
    LOBYTE(v39) = 2;
  }

  if (qword_26AF22748 != -1) {
    swift_once();
  }
  uint64_t v14 = __swift_project_value_buffer(v2, (uint64_t)qword_26AF22728);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v14, v2);
  int v15 = (char *)v7;
  uint64_t v16 = sub_23C990E20();
  os_log_type_t v17 = sub_23C991120();
  int v18 = v17;
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v19 = swift_slowAlloc();
    long long v38 = v10;
    uint64_t v20 = v19;
    uint64_t v37 = swift_slowAlloc();
    *(void *)&v41[0] = v37;
    *(_DWORD *)uint64_t v20 = 136446466;
    uint64_t v21 = sub_23C96245C();
    *(void *)&long long v39 = sub_23C9733B0(v21, v22, (uint64_t *)v41);
    int v36 = v18;
    sub_23C991240();

    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 12) = 2082;
    uint64_t v23 = 1702195828;
    if ((v13 & 1) == 0) {
      uint64_t v23 = 0x65736C6166;
    }
    unint64_t v24 = 0xE400000000000000;
    if ((v13 & 1) == 0) {
      unint64_t v24 = 0xE500000000000000;
    }
    if (v13 == 2) {
      uint64_t v25 = 7104878;
    }
    else {
      uint64_t v25 = v23;
    }
    if (v13 == 2) {
      unint64_t v26 = 0xE300000000000000;
    }
    else {
      unint64_t v26 = v24;
    }
    *(void *)&long long v39 = sub_23C9733B0(v25, v26, (uint64_t *)v41);
    sub_23C991240();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C948000, v16, (os_log_type_t)v36, "[%{public}s] ClientSetting[baseContentTouchedDown] did change to %{public}s", (uint8_t *)v20, 0x16u);
    uint64_t v27 = v37;
    swift_arrayDestroy();
    MEMORY[0x23ECEADB0](v27, -1, -1);
    uint64_t v28 = v20;
    uint64_t v10 = v38;
    MEMORY[0x23ECEADB0](v28, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  unint64_t v29 = &v15[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_baseContentTouchedDown];
  swift_beginAccess();
  *unint64_t v29 = v13 & 1;
  os_log_t v30 = (objc_class *)type metadata accessor for ActivityTouchEvent();
  uint64_t v31 = objc_allocWithZone(v30);
  v31[OBJC_IVAR____TtC18ActivityUIServices18ActivityTouchEvent_baseContentTouchedDown] = v13 & 1;
  v40.receiver = v31;
  v40.super_class = v30;
  id v7 = objc_msgSendSuper2(&v40, sel_init);
  uint64_t v32 = &v15[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_delegate];
  swift_beginAccess();
  uint64_t v33 = (void *)MEMORY[0x23ECEAE20](v32);
  if (!v33)
  {

    goto LABEL_31;
  }
  uint64_t v34 = v33;
  if (objc_msgSend(v33, sel_respondsToSelector_, sel_activityHostViewControllerWithViewController_receivedTouchEvent_))objc_msgSend(v34, sel_activityHostViewControllerWithViewController_receivedTouchEvent_, v15, v7); {

  }
  swift_unknownObjectRelease();
}

void sub_23C96E788(uint64_t a1)
{
  uint64_t v2 = sub_23C990E40();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  id v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x23ECEAE20](a1 + 16);
  if (v6)
  {
    id v7 = (void *)v6;
    uint64_t v8 = *(void **)(v6 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene);
    if (v8)
    {
      id v9 = objc_msgSend(v8, sel_clientSettings);
      if (v9)
      {
        uint64_t v10 = v9;
        type metadata accessor for ActivitySceneClientSettings();
        id v11 = (void *)swift_dynamicCastClass();
        if (v11)
        {
          id v12 = objc_msgSend(v11, sel_otherSettings);
          swift_beginAccess();
          if (objc_msgSend(v12, sel_objectForSetting_, qword_268BBB000))
          {
            sub_23C991270();
            swift_unknownObjectRelease();
            sub_23C95CAC4(&v35, v36);
          }
          else
          {
            memset(v36, 0, sizeof(v36));
          }
          __swift_instantiateConcreteTypeFromMangledName(&qword_26AF22BA0);
          if (swift_dynamicCast())
          {
            LODWORD(v13) = v35;
          }
          else
          {
            LODWORD(v13) = 2;
            LOBYTE(v35) = 2;
          }

          if (qword_26AF22748 != -1) {
            swift_once();
          }
          uint64_t v14 = __swift_project_value_buffer(v2, (uint64_t)qword_26AF22728);
          (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v14, v2);
          int v15 = v7;
          uint64_t v16 = sub_23C990E20();
          os_log_type_t v17 = sub_23C991120();
          int v18 = v17;
          if (os_log_type_enabled(v16, v17))
          {
            uint64_t v19 = swift_slowAlloc();
            int v34 = v13;
            uint64_t v13 = v19;
            uint64_t v33 = swift_slowAlloc();
            *(void *)&v36[0] = v33;
            *(_DWORD *)uint64_t v13 = 136446466;
            os_log_t v32 = v16;
            uint64_t v20 = sub_23C96245C();
            *(void *)&long long v35 = sub_23C9733B0(v20, v21, (uint64_t *)v36);
            HIDWORD(v31) = v18;
            sub_23C991240();

            swift_bridgeObjectRelease();
            BOOL v22 = (v34 & 1) == 0;
            *(_WORD *)(v13 + 12) = 2082;
            uint64_t v23 = 1702195828;
            if (v22) {
              uint64_t v23 = 0x65736C6166;
            }
            unint64_t v24 = 0xE400000000000000;
            if (v22) {
              unint64_t v24 = 0xE500000000000000;
            }
            if (v34 == 2) {
              uint64_t v25 = 7104878;
            }
            else {
              uint64_t v25 = v23;
            }
            if (v34 == 2) {
              unint64_t v26 = 0xE300000000000000;
            }
            else {
              unint64_t v26 = v24;
            }
            *(void *)&long long v35 = sub_23C9733B0(v25, v26, (uint64_t *)v36);
            sub_23C991240();
            swift_bridgeObjectRelease();
            os_log_t v27 = v32;
            _os_log_impl(&dword_23C948000, v32, BYTE4(v31), "[%{public}s] ClientSetting[actionButtonInitiated] did change to %{public}s", (uint8_t *)v13, 0x16u);
            uint64_t v28 = v33;
            swift_arrayDestroy();
            MEMORY[0x23ECEADB0](v28, -1, -1);
            uint64_t v29 = v13;
            LOBYTE(v13) = v34;
            MEMORY[0x23ECEADB0](v29, -1, -1);
          }
          else
          {
          }
          (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
          os_log_t v30 = &v15[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_actionButtonInitiated];
          swift_beginAccess();
          *os_log_t v30 = v13 & 1;
        }
        else
        {
        }
      }
    }
  }
}

void sub_23C96EBD8(unsigned __int8 a1, char *a2)
{
  int v4 = a1;
  BSDispatchQueueAssertMain();
  if (v4 == 3)
  {
    BSDispatchQueueAssertMain();
    id v5 = *(void **)&a2[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_liveSceneSnapshotView];
    if (v5)
    {
      id v6 = v5;
      objc_msgSend(v6, sel_setAlpha_, 1.0);
      objc_msgSend(v6, sel_setHidden_, 0);
LABEL_11:
    }
  }
  else
  {
    if (qword_26AF22748 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_23C990E40();
    __swift_project_value_buffer(v7, (uint64_t)qword_26AF22728);
    uint64_t v8 = a2;
    id v9 = sub_23C990E20();
    os_log_type_t v10 = sub_23C991130();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = swift_slowAlloc();
      id v12 = (void *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      uint64_t v19 = v17;
      *(_DWORD *)uint64_t v11 = 136446466;
      uint64_t v13 = sub_23C96245C();
      sub_23C9733B0(v13, v14, &v19);
      sub_23C991240();

      swift_bridgeObjectRelease();
      *(_WORD *)(v11 + 12) = 2114;
      sub_23C977744();
      swift_allocError();
      *int v15 = a1;
      uint64_t v18 = _swift_stdlib_bridgeErrorToNSError();
      sub_23C991240();
      *id v12 = v18;
      _os_log_impl(&dword_23C948000, v9, v10, "[%{public}s] Snapshot failed so backgrounding scene without updated snapshot: %{public}@", (uint8_t *)v11, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AF22818);
      swift_arrayDestroy();
      MEMORY[0x23ECEADB0](v12, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x23ECEADB0](v17, -1, -1);
      MEMORY[0x23ECEADB0](v11, -1, -1);
    }
    else
    {
    }
    BSDispatchQueueAssertMain();
    uint64_t v16 = *(void **)&v8[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_liveSceneSnapshotView];
    if (v16)
    {
      id v6 = v16;
      objc_msgSend(v6, sel_setAlpha_, 0.0);
      objc_msgSend(v6, sel_setHidden_, 1);
      goto LABEL_11;
    }
  }
  sub_23C965E30(0, 0, 0);
}

void sub_23C96EEB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3 + 16;
  swift_beginAccess();
  int v4 = (char *)MEMORY[0x23ECEAE20](v3);
  if (v4)
  {
    id v5 = *(void **)&v4[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_presentationAssertion];
    *(void *)&v4[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_presentationAssertion] = 0;
  }
}

void sub_23C96EF18(uint64_t a1, void *a2, void *a3)
{
  int v4 = *(void (**)(id, id))(a1 + 32);
  id v6 = a2;
  id v5 = a3;
  v4(v6, v5);
}

void sub_23C96EF84(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void sub_23C96EFFC(void *a1, void *a2, uint64_t a3)
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_23C991000();
  swift_bridgeObjectRelease();
  sub_23C991000();
  sub_23C991670();
  unint64_t v10 = sub_23C977A54();
  uint64_t v9 = MEMORY[0x263F8D310];
  sub_23C991260();
  swift_bridgeObjectRelease();
  sub_23C991000();
  swift_bridgeObjectRelease();
  id v6 = (void *)sub_23C990FC0();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setIdentifier_, v6, v9, v10, v10, v10);

  id v7 = objc_msgSend(a1, sel_setClientIdentity_, a3);
  uint64_t v8 = (void *)(*(uint64_t (**)(id))((*MEMORY[0x263F8EED0] & *a2) + 0x4F8))(v7);
  objc_msgSend(a1, sel_setSpecification_, v8);
}

uint64_t sub_23C96F214(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_23C96F23C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);
  return swift_unknownObjectRelease();
}

id sub_23C96F290(void *a1)
{
  objc_msgSend(a1, sel_setPresentedLayerTypes_, 26);
  objc_msgSend(a1, sel_setAppearanceStyle_, 2);
  objc_msgSend(a1, sel_setBackgroundColorWhileHosting_, 0);
  objc_msgSend(a1, sel_setBackgroundColorWhileNotHosting_, 0);
  objc_msgSend(a1, sel_setInheritsSecurity_, 1);
  return objc_msgSend(a1, sel_setResizesHostedContext_, 1);
}

void sub_23C96F330(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_23C990C80();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = &v17[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v8 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ActivityMutableSceneClientSettings()), sel_initWithSettings_, 0);
  uint64_t v9 = (void **)(a2 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_backgroundTintColor);
  swift_beginAccess();
  unint64_t v10 = *v9;
  id v11 = v10;
  sub_23C9690D4(v10, &qword_268BBAF28);

  id v12 = (void **)(a2 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_textColor);
  swift_beginAccess();
  uint64_t v13 = *v12;
  id v14 = v13;
  sub_23C9690D4(v13, &qword_268BBAF40);

  swift_beginAccess();
  sub_23C990C40();
  LOBYTE(v13) = sub_23C990C70();
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  id v15 = objc_msgSend(v8, sel_otherSettings);
  v17[0] = v13 & 1;
  uint64_t v16 = sub_23C991510();
  swift_beginAccess();
  objc_msgSend(v15, sel_setObject_forSetting_, v16, qword_268BBB000);

  swift_unknownObjectRelease();
  objc_msgSend(a1, sel_setClientSettings_, v8);
}

void sub_23C96F58C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

uint64_t sub_23C96F5D8(void *a1, uint64_t a2, uint64_t a3, char a4, void *a5, void *a6)
{
  type metadata accessor for ActivityMutableSceneSettings();
  uint64_t result = swift_dynamicCastClass();
  if (result)
  {
    id v11 = (void *)result;
    id v12 = a1;
    BSRectWithSize();
    objc_msgSend(v11, sel_setFrame_);
    objc_msgSend(v11, sel_setInterfaceOrientation_, 1);
    id v13 = objc_msgSend(self, sel_mainConfiguration);
    objc_msgSend(v11, sel_setDisplayConfiguration_, v13);

    objc_msgSend(v11, sel_setForeground_, a4 & 1);
    id v14 = v12;
    id v15 = objc_msgSend(a5, sel_traitCollection);
    id v16 = objc_msgSend(v15, sel_userInterfaceStyle);

    objc_msgSend(v11, sel_setUserInterfaceStyle_, v16);
    (*(void (**)(void))((*MEMORY[0x263F8EED0] & *a5) + 0x500))();
    swift_bridgeObjectRetain();
    id v17 = objc_msgSend(v11, sel_otherSettings);
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_23C991510();
    swift_beginAccess();
    objc_msgSend(v17, sel_setObject_forSetting_, v18, qword_268BBB4A8);
    swift_bridgeObjectRelease_n();

    swift_unknownObjectRelease();
    uint64_t v19 = (void *)((char *)a5
                   + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activitySceneDescriptor);
    swift_beginAccess();
    swift_bridgeObjectRetain_n();
    id v20 = objc_msgSend(v11, sel_otherSettings);
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_23C991510();
    swift_beginAccess();
    objc_msgSend(v20, sel_setObject_forSetting_, v21, qword_268BBB488);
    swift_bridgeObjectRelease_n();

    swift_unknownObjectRelease();
    id v22 = a6;
    id v23 = objc_msgSend(v11, sel_otherSettings);
    swift_beginAccess();
    objc_msgSend(v23, sel_setObject_forSetting_, v22, qword_268BBB4A0);

    unint64_t v24 = (id *)((char *)a5 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_systemProvidedMetrics);
    swift_beginAccess();
    id v25 = *v24;
    id v26 = objc_msgSend(v11, sel_otherSettings);
    swift_beginAccess();
    objc_msgSend(v26, sel_setObject_forSetting_, v25, qword_268BBB4D8);

    id v27 = objc_retain(objc_retain(*(id *)(*v19
                                        + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityDescriptorData)));
    id v28 = objc_msgSend(v11, sel_otherSettings);
    swift_beginAccess();
    objc_msgSend(v28, sel_setObject_forSetting_, v27, qword_268BBB4C0);

    uint64_t v29 = *(void *)(*v19 + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_payloadID + 8);
    swift_bridgeObjectRetain_n();
    id v30 = objc_msgSend(v11, sel_otherSettings);
    if (v29)
    {
      swift_bridgeObjectRetain();
      uint64_t v31 = sub_23C991510();
    }
    else
    {
      uint64_t v31 = 0;
    }
    swift_beginAccess();
    objc_msgSend(v30, sel_setObject_forSetting_, v31, qword_268BBB4E0);
    swift_bridgeObjectRelease_n();

    swift_unknownObjectRelease();
    swift_beginAccess();
    id v32 = objc_msgSend(v11, sel_otherSettings);
    uint64_t v33 = sub_23C991510();
    swift_beginAccess();
    objc_msgSend(v32, sel_setObject_forSetting_, v33, qword_268BBB4F8);

    return swift_unknownObjectRelease();
  }
  return result;
}

id sub_23C96FB78(char *a1, double a2, double a3)
{
  double v27 = a2;
  double v28 = a3;
  uint64_t v29 = a1;
  BSDispatchQueueAssertMain();
  uint64_t v6 = *(void **)&a1[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene];
  if (!v6) {
    goto LABEL_3;
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_23C9778B4;
  *(void *)(v7 + 24) = &v26;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_23C977F48;
  *(void *)(v8 + 24) = v7;
  int v34 = sub_23C977F48;
  uint64_t v35 = v8;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v31 = 1107296256;
  id v32 = sub_23C96EF18;
  uint64_t v33 = &block_descriptor_231;
  uint64_t v9 = _Block_copy(&aBlock);
  id v10 = v6;
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_performUpdate_, v9);

  _Block_release(v9);
  LOBYTE(v9) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  id result = (id)swift_release();
  if (v9)
  {
    __break(1u);
  }
  else
  {
LABEL_3:
    if (qword_26AF22748 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_23C990E40();
    __swift_project_value_buffer(v12, (uint64_t)qword_26AF22728);
    id v13 = a1;
    id v14 = sub_23C990E20();
    os_log_type_t v15 = sub_23C991140();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      uint64_t v36 = v25;
      *(_DWORD *)uint64_t v16 = 136446722;
      uint64_t v17 = sub_23C96245C();
      uint64_t aBlock = sub_23C9733B0(v17, v18, &v36);
      sub_23C991240();

      swift_bridgeObjectRelease();
      *(_WORD *)(v16 + 12) = 2082;
      uint64_t aBlock = *(void *)&a2;
      uint64_t v31 = *(void *)&a3;
      type metadata accessor for CGSize(0);
      uint64_t v19 = sub_23C990FE0();
      uint64_t aBlock = sub_23C9733B0(v19, v20, &v36);
      sub_23C991240();
      swift_bridgeObjectRelease();
      *(_WORD *)(v16 + 22) = 2082;
      objc_msgSend(v13, sel_preferredContentSize);
      uint64_t aBlock = v21;
      uint64_t v31 = v22;
      uint64_t v23 = sub_23C990FE0();
      uint64_t aBlock = sub_23C9733B0(v23, v24, &v36);
      sub_23C991240();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23C948000, v14, v15, "[%{public}s] Updating preferred content size with requested size: %{public}s, current size: %{public}s", (uint8_t *)v16, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x23ECEADB0](v25, -1, -1);
      MEMORY[0x23ECEADB0](v16, -1, -1);
    }
    else
    {
    }
    return objc_msgSend(v13, sel_setPreferredContentSize_, a2, a3, v25);
  }
  return result;
}

void sub_23C96FF74(void *a1, void *a2, void *a3)
{
  type metadata accessor for ActivityMutableSceneSettings();
  uint64_t v6 = swift_dynamicCastClass();
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    id v15 = a1;
    BSRectWithSize();
    objc_msgSend(v7, sel_setFrame_);
    id v8 = objc_msgSend(self, sel_settingsWithMass_stiffness_damping_, 1.0, 145.0, 22.0);
    objc_msgSend(a2, sel_setAnimationSettings_, v8);

    id v9 = objc_msgSend(a3, sel_view);
    if (v9)
    {
      id v10 = v9;
      id v11 = objc_msgSend(v9, sel_window);

      if (v11)
      {
        id v12 = objc_msgSend(v11, sel_windowScene);

        if (v12)
        {
          id v13 = objc_msgSend(v12, sel__synchronizedDrawingFence);

          if (v13)
          {
            id v14 = v13;
            objc_msgSend(a2, sel_setAnimationFence_, v14);
          }
        }
      }
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_23C970128(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    sub_23C974174(0, v1, 0);
    uint64_t v4 = a1 + 32;
    uint64_t v2 = v9;
    do
    {
      v4 += 4;
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_23C974174(0, *(void *)(v2 + 16) + 1, 1);
        uint64_t v2 = v9;
      }
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_23C974174(v5 > 1, v6 + 1, 1);
        uint64_t v2 = v9;
      }
      *(void *)(v2 + 16) = v6 + 1;
      sub_23C95CAC4(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      --v1;
    }
    while (v1);
  }
  return v2;
}

void sub_23C970248(void *a1, void *a2, const char *a3)
{
  if (a1)
  {
    id v6 = a1;
    if (qword_26AF22748 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_23C990E40();
    __swift_project_value_buffer(v7, (uint64_t)qword_26AF22728);
    id v8 = a1;
    id v9 = a2;
    id v10 = a1;
    id v11 = v9;
    oslog = sub_23C990E20();
    os_log_type_t v12 = sub_23C991140();
    if (os_log_type_enabled(oslog, v12))
    {
      uint64_t v13 = swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      uint64_t v20 = v14;
      *(_DWORD *)uint64_t v13 = 136446466;
      uint64_t v15 = sub_23C96245C();
      sub_23C9733B0(v15, v16, &v20);
      sub_23C991240();

      swift_bridgeObjectRelease();
      *(_WORD *)(v13 + 12) = 2082;
      swift_getErrorValue();
      uint64_t v17 = sub_23C991560();
      sub_23C9733B0(v17, v18, &v20);
      sub_23C991240();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_23C948000, oslog, v12, a3, (uint8_t *)v13, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x23ECEADB0](v14, -1, -1);
      MEMORY[0x23ECEADB0](v13, -1, -1);
    }
    else
    {
    }
  }
}

uint64_t sub_23C9704C4(uint64_t a1)
{
  int64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_23C970508(void *a1, char a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (a2)
  {
    if (qword_26AF22748 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_23C990E40();
    __swift_project_value_buffer(v12, (uint64_t)qword_26AF22728);
    id v13 = a3;
    uint64_t v14 = sub_23C990E20();
    os_log_type_t v15 = sub_23C991130();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      uint64_t aBlock = v17;
      *(_DWORD *)uint64_t v16 = 136446466;
      uint64_t v18 = sub_23C96245C();
      sub_23C9733B0(v18, v19, &aBlock);
      sub_23C991240();

      swift_bridgeObjectRelease();
      *(_WORD *)(v16 + 12) = 2080;
      sub_23C977744();
      uint64_t v20 = sub_23C9914D0();
      uint64_t v30 = v17;
      uint64_t v31 = a4;
      if (v20)
      {
        uint64_t v21 = (void *)v20;
      }
      else
      {
        uint64_t v21 = (void *)swift_allocError();
        *uint64_t v22 = (_BYTE)a1;
      }
      uint64_t v23 = (void *)sub_23C990B20();

      id v24 = objc_msgSend(v23, sel_localizedDescription);
      uint64_t v25 = sub_23C990FD0();
      unint64_t v27 = v26;

      sub_23C9733B0(v25, v27, &aBlock);
      sub_23C991240();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23C948000, v14, v15, "[%{public}s] Snapshot failed - %s", (uint8_t *)v16, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x23ECEADB0](v30, -1, -1);
      MEMORY[0x23ECEADB0](v16, -1, -1);

      a4 = v31;
    }
    else
    {
    }
    uint64_t v28 = swift_allocObject();
    *(void *)(v28 + 16) = a4;
    *(void *)(v28 + 24) = a5;
    *(unsigned char *)(v28 + 32) = (_BYTE)a1;
    uint64_t v36 = sub_23C977714;
    uint64_t v37 = (void *)v28;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v33 = 1107296256;
    int v34 = sub_23C96B674;
    uint64_t v35 = &block_descriptor_202;
    uint64_t v29 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    BSDispatchMain();
    _Block_release(v29);
  }
  else
  {
    id v9 = (void *)swift_allocObject();
    v9[2] = a3;
    v9[3] = a1;
    v9[4] = a4;
    v9[5] = a5;
    uint64_t v36 = sub_23C9777E0;
    uint64_t v37 = v9;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v33 = 1107296256;
    int v34 = sub_23C96B674;
    uint64_t v35 = &block_descriptor_208;
    id v10 = _Block_copy(&aBlock);
    sub_23C9777EC(a1, 0);
    sub_23C9777EC(a1, 0);
    id v11 = a3;
    swift_retain();
    swift_release();
    BSDispatchMain();
    _Block_release(v10);
    sub_23C9777F8(a1, 0);
  }
}

void sub_23C970910(char *a1, void *a2, void (*a3)(void))
{
  if (*(_DWORD *)&a1[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController__presentationMode] == 2)
  {
    if (qword_26AF22748 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_23C990E40();
    __swift_project_value_buffer(v6, (uint64_t)qword_26AF22728);
    uint64_t v7 = a1;
    id v8 = sub_23C990E20();
    os_log_type_t v9 = sub_23C991140();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v18 = a3;
      id v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v19 = v11;
      *(_DWORD *)id v10 = 136446210;
      uint64_t v12 = sub_23C96245C();
      sub_23C9733B0(v12, v13, &v19);
      sub_23C991240();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23C948000, v8, v9, "[%{public}s] Snapshot success - Updating layer.", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23ECEADB0](v11, -1, -1);
      uint64_t v14 = v10;
      a3 = v18;
      MEMORY[0x23ECEADB0](v14, -1, -1);
    }
    else
    {
    }
    id v15 = objc_msgSend(a2, sel_IOSurface);
    if (!v15) {
      id v15 = objc_msgSend(a2, sel_fallbackIOSurface);
    }
    uint64_t v16 = *(void **)&v7[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_liveSceneSnapshotView];
    if (v16)
    {
      id v17 = objc_msgSend(v16, sel_layer);
      objc_msgSend(v17, sel_setContents_, v15);
    }
    a3(3);
  }
}

unint64_t sub_23C970B70(char a1)
{
  unint64_t result = 0xD00000000000001DLL;
  if (a1)
  {
    if (a1 == 1) {
      return 0xD000000000000025;
    }
    else {
      return 0xD000000000000021;
    }
  }
  return result;
}

BOOL sub_23C970BD0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_23C970BE4()
{
  return sub_23C970B70(*v0);
}

id ActivityHostViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_23C990FC0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void ActivityHostViewController.init(nibName:bundle:)()
{
}

void ActivityHostViewController.sceneDidDeactivate(_:withError:)(void *a1, id a2)
{
  id v3 = v2;
  v2[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneActivated] = 0;
  uint64_t v6 = _TtC18ActivityUIServices28SystemApertureMetricsRequest;
  if (a2)
  {
    id v7 = a2;
    if (qword_26AF22748 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_23C990E40();
    __swift_project_value_buffer(v8, (uint64_t)qword_26AF22728);
    id v9 = a2;
    id v10 = v2;
    id v11 = a2;
    uint64_t v12 = v10;
    unint64_t v13 = sub_23C990E20();
    os_log_type_t v14 = sub_23C991120();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v101 = swift_slowAlloc();
      uint64_t aBlock = v101;
      *(_DWORD *)uint64_t v15 = 136446466;
      uint64_t v16 = sub_23C96245C();
      uint64_t v109 = sub_23C9733B0(v16, v17, &aBlock);
      sub_23C991240();

      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 12) = 2082;
      swift_getErrorValue();
      uint64_t v18 = sub_23C991560();
      uint64_t v109 = sub_23C9733B0(v18, v19, &aBlock);
      uint64_t v6 = _TtC18ActivityUIServices28SystemApertureMetricsRequest;
      sub_23C991240();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_23C948000, v13, v14, "[%{public}s] Scene did deactivate with error: %{public}s.", (uint8_t *)v15, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x23ECEADB0](v101, -1, -1);
      MEMORY[0x23ECEADB0](v15, -1, -1);
    }
    else
    {
    }
  }
  else
  {
    if (qword_26AF22748 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_23C990E40();
    __swift_project_value_buffer(v20, (uint64_t)qword_26AF22728);
    uint64_t v21 = v2;
    uint64_t v22 = sub_23C990E20();
    os_log_type_t v23 = sub_23C991120();
    if (os_log_type_enabled(v22, v23))
    {
      id v24 = (uint8_t *)swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      uint64_t aBlock = v25;
      *(_DWORD *)id v24 = 136446210;
      uint64_t v26 = sub_23C96245C();
      uint64_t v109 = sub_23C9733B0(v26, v27, &aBlock);
      uint64_t v6 = _TtC18ActivityUIServices28SystemApertureMetricsRequest;
      sub_23C991240();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23C948000, v22, v23, "[%{public}s] Scene did deactivate.", v24, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23ECEADB0](v25, -1, -1);
      MEMORY[0x23ECEADB0](v24, -1, -1);
    }
    else
    {
    }
  }
  uint64_t v28 = *(void **)&v2[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene];
  if (v28)
  {
    id v29 = v28;
    if (sub_23C975EA4(a2))
    {
      uint64_t v30 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneClientExitCountWithinTimeout;
      if (*(void *)&v2[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneClientExitCountWithinTimeout] == 10)
      {
        uint64_t v31 = &v2[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activitySceneDescriptor];
        swift_beginAccess();
        id v32 = (uint64_t *)(*(void *)v31
                        + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityIdentifier);
        uint64_t v33 = v6;
        uint64_t v35 = *v32;
        unint64_t v34 = v32[1];
        vtable = v33[46].vtable;
        swift_bridgeObjectRetain();
        if (vtable != (void *)-1) {
          swift_once();
        }
        uint64_t v37 = sub_23C990E40();
        __swift_project_value_buffer(v37, (uint64_t)qword_26AF22728);
        long long v38 = v3;
        swift_bridgeObjectRetain_n();
        long long v39 = v38;
        objc_super v40 = sub_23C990E20();
        os_log_type_t v41 = sub_23C991140();
        if (os_log_type_enabled(v40, v41))
        {
          uint64_t v42 = swift_slowAlloc();
          uint64_t v99 = swift_slowAlloc();
          uint64_t v109 = v99;
          *(_DWORD *)uint64_t v42 = 136447234;
          uint64_t v43 = sub_23C96245C();
          sub_23C9733B0(v43, v44, &v109);
          sub_23C991240();

          swift_bridgeObjectRelease();
          *(_WORD *)(v42 + 12) = 2082;
          uint64_t v46 = *(void *)&v39[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_processResource];
          unint64_t v45 = *(void *)&v39[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_processResource + 8];
          swift_bridgeObjectRetain();
          sub_23C9733B0(v46, v45, &v109);
          sub_23C991240();

          swift_bridgeObjectRelease();
          *(_WORD *)(v42 + 22) = 2050;
          sub_23C991240();
          *(_WORD *)(v42 + 32) = 2050;
          sub_23C991240();
          *(_WORD *)(v42 + 42) = 2082;
          swift_bridgeObjectRetain();
          sub_23C9733B0(v35, v34, &v109);
          sub_23C991240();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_23C948000, v40, v41, "[%{public}s] %{public}s exited %{public}ld times within %{public}f seconds, ending the session: %{public}s", (uint8_t *)v42, 0x34u);
          swift_arrayDestroy();
          MEMORY[0x23ECEADB0](v99, -1, -1);
          MEMORY[0x23ECEADB0](v42, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        sub_23C990CB0();
        sub_23C990CA0();
        sub_23C990C90();

        swift_bridgeObjectRelease();
        swift_release();
        return;
      }
      if (v6[46].vtable != (void *)-1) {
        swift_once();
      }
      uint64_t v57 = sub_23C990E40();
      __swift_project_value_buffer(v57, (uint64_t)qword_26AF22728);
      unint64_t v58 = v2;
      id v59 = a2;
      uint64_t v60 = v58;
      id v61 = a2;
      uint64_t v62 = v60;
      id v63 = sub_23C990E20();
      os_log_type_t v64 = sub_23C991140();
      if (os_log_type_enabled(v63, v64))
      {
        id v102 = v29;
        uint64_t v65 = swift_slowAlloc();
        uint64_t v98 = swift_slowAlloc();
        uint64_t aBlock = v98;
        *(_DWORD *)uint64_t v65 = 136447234;
        uint64_t v66 = sub_23C96245C();
        uint64_t v109 = sub_23C9733B0(v66, v67, &aBlock);
        sub_23C991240();

        swift_bridgeObjectRelease();
        *(_WORD *)(v65 + 12) = 2082;
        unint64_t v100 = a1;
        uint64_t v68 = *(void *)&v62[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_processResource];
        unint64_t v69 = *(void *)&v62[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_processResource + 8];
        swift_bridgeObjectRetain();
        uint64_t v109 = sub_23C9733B0(v68, v69, &aBlock);
        sub_23C991240();

        swift_bridgeObjectRelease();
        *(_WORD *)(v65 + 22) = 2050;
        uint64_t v109 = 0x4014000000000000;
        sub_23C991240();
        *(_WORD *)(v65 + 32) = 2080;
        uint64_t v109 = (uint64_t)a2;
        id v70 = a2;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF22870);
        uint64_t v71 = sub_23C990FE0();
        uint64_t v109 = sub_23C9733B0(v71, v72, &aBlock);
        a1 = v100;
        sub_23C991240();
        swift_bridgeObjectRelease();

        *(_WORD *)(v65 + 42) = 2080;
        uint64_t v109 = *(void *)&v3[v30];
        uint64_t v73 = sub_23C9914C0();
        uint64_t v109 = sub_23C9733B0(v73, v74, &aBlock);
        sub_23C991240();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23C948000, v63, v64, "[%{public}s] %{public}s exited within %{public}f seconds with error: %s, sceneClientExitCountWithinTimeout: %s", (uint8_t *)v65, 0x34u);
        swift_arrayDestroy();
        MEMORY[0x23ECEADB0](v98, -1, -1);
        uint64_t v75 = v65;
        id v29 = v102;
        MEMORY[0x23ECEADB0](v75, -1, -1);
      }
      else
      {
      }
      uint64_t v76 = *(void *)&v3[v30];
      BOOL v77 = __OFADD__(v76, 1);
      uint64_t v78 = v76 + 1;
      if (v77)
      {
        __break(1u);
        goto LABEL_42;
      }
      *(void *)&v3[v30] = v78;
      uint64_t v79 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneClientExitTimer;
      if (!*(void *)&v62[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneClientExitTimer])
      {
        id v80 = objc_allocWithZone(MEMORY[0x263F29BA8]);
        long long v81 = (void *)sub_23C990FC0();
        id v82 = objc_msgSend(v80, sel_initWithIdentifier_, v81);

        uint64_t v83 = *(void **)&v62[v79];
        *(void *)&v62[v79] = v82;

        id v84 = *(void **)&v62[v79];
        if (v84)
        {
          sub_23C959038(0, &qword_26AF227C0);
          id v85 = v84;
          uint64_t v86 = (void *)sub_23C991180();
          uint64_t v87 = swift_allocObject();
          swift_unknownObjectWeakInit();
          id v107 = sub_23C976434;
          uint64_t v108 = v87;
          uint64_t aBlock = MEMORY[0x263EF8330];
          unint64_t v104 = 1107296256;
          id v105 = sub_23C95E08C;
          uint64_t v106 = &block_descriptor_65;
          unint64_t v88 = _Block_copy(&aBlock);
          swift_release();
          objc_msgSend(v85, sel_scheduleWithFireInterval_leewayInterval_queue_handler_, v86, v88, 5.0, 0.0);
          _Block_release(v88);
        }
      }
    }
    sub_23C959038(0, (unint64_t *)&qword_26AF22810);
    if ((sub_23C991200() & 1) == 0)
    {
LABEL_40:

      return;
    }
    uint64_t v89 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_backOffTimer;
    if (*(void *)&v3[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_backOffTimer]) {
      goto LABEL_39;
    }
    uint64_t aBlock = 0;
    unint64_t v104 = 0xE000000000000000;
    sub_23C991330();
    swift_bridgeObjectRelease();
    uint64_t aBlock = 0xD00000000000001BLL;
    unint64_t v104 = 0x800000023C998040;
    sub_23C96245C();
    sub_23C991000();
    swift_bridgeObjectRelease();
    uint64_t v90 = aBlock;
    unint64_t v91 = v104;
    sub_23C959038(0, &qword_26AF227C0);
    uint64_t v92 = sub_23C991180();
    uint64_t v93 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v94 = swift_allocObject();
    *(void *)(v94 + 16) = v93;
    *(void *)(v94 + 24) = a1;
    type metadata accessor for BackOffTimer();
    uint64_t v95 = swift_allocObject();
    *(void *)(v95 + 64) = v94;
    *(void *)(v95 + 72) = 0;
    *(void *)(v95 + 16) = 0;
    *(void *)(v95 + 24) = 0;
    *(unsigned char *)(v95 + 80) = 1;
    *(void *)(v95 + 88) = 0;
    *(void *)(v95 + 32) = v90;
    *(void *)(v95 + 40) = v91;
    *(void *)(v95 + 48) = v92;
    *(void *)(v95 + 56) = sub_23C97642C;
    *(void *)&v3[v89] = v95;
    id v96 = a1;
    swift_release();
    uint64_t v97 = *(void *)&v3[v89];
    if (v97)
    {
      *(void *)(v97 + 72) = 0x4046800000000000;
      *(unsigned char *)(v97 + 80) = 0;
      if (*(void *)&v3[v89])
      {
LABEL_39:
        swift_retain();
        sub_23C95D894();
        swift_release();
        goto LABEL_40;
      }
    }
LABEL_42:
    __break(1u);
    return;
  }
  if (v6[46].vtable != (void *)-1) {
    swift_once();
  }
  uint64_t v47 = sub_23C990E40();
  __swift_project_value_buffer(v47, (uint64_t)qword_26AF22728);
  id v48 = a1;
  long long v49 = sub_23C990E20();
  os_log_type_t v50 = sub_23C991130();
  if (os_log_type_enabled(v49, v50))
  {
    uint64_t v51 = (uint8_t *)swift_slowAlloc();
    uint64_t v52 = swift_slowAlloc();
    uint64_t aBlock = v52;
    *(_DWORD *)uint64_t v51 = 136315138;
    id v53 = objc_msgSend(v48, sel_identifier);
    uint64_t v54 = sub_23C990FD0();
    unint64_t v56 = v55;

    uint64_t v109 = sub_23C9733B0(v54, v56, &aBlock);
    sub_23C991240();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C948000, v49, v50, "No activity scene found: %s", v51, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEADB0](v52, -1, -1);
    MEMORY[0x23ECEADB0](v51, -1, -1);
  }
  else
  {
  }
}

void sub_23C971C40(void *a1, uint64_t a2)
{
  uint64_t v3 = a2 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x23ECEAE20](v3);
  if (v4)
  {
    unint64_t v5 = (char *)v4;
    *(void *)(v4 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneClientExitCountWithinTimeout) = 0;
    objc_msgSend(a1, sel_invalidate);
    uint64_t v6 = *(void **)&v5[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneClientExitTimer];
    *(void *)&v5[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneClientExitTimer] = 0;
  }
}

void sub_23C971CC4(uint64_t a1, void *a2)
{
  uint64_t v3 = a1 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x23ECEAE20](v3);
  if (v4)
  {
    unint64_t v5 = (void *)v4;
    id v6 = objc_msgSend(a2, sel_settings);
    unsigned int v7 = objc_msgSend(v6, sel_isForeground);

    if ((*((unsigned char *)v5 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_invalidated) & 1) == 0 && v7)
    {
      if (qword_26AF22748 != -1) {
        swift_once();
      }
      uint64_t v8 = sub_23C990E40();
      __swift_project_value_buffer(v8, (uint64_t)qword_26AF22728);
      id v9 = v5;
      id v10 = sub_23C990E20();
      os_log_type_t v11 = sub_23C991140();
      if (os_log_type_enabled(v10, v11))
      {
        uint64_t v12 = (uint8_t *)swift_slowAlloc();
        uint64_t v13 = swift_slowAlloc();
        uint64_t v16 = v13;
        *(_DWORD *)uint64_t v12 = 136446210;
        uint64_t v14 = sub_23C96245C();
        sub_23C9733B0(v14, v15, &v16);
        sub_23C991240();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23C948000, v10, v11, "[%{public}s] Scene did deactivate but was foreground - reactivating.", v12, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23ECEADB0](v13, -1, -1);
        MEMORY[0x23ECEADB0](v12, -1, -1);
      }
      else
      {
      }
      objc_msgSend(a2, sel_activateWithTransitionContext_, 0);
    }
  }
}

void ActivityHostViewController.sceneContentStateDidChange(_:)(void *a1)
{
  if (qword_26AF22748 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_23C990E40();
  __swift_project_value_buffer(v3, (uint64_t)qword_26AF22728);
  id v4 = v1;
  id v5 = a1;
  id v15 = v4;
  id v6 = v5;
  unsigned int v7 = sub_23C990E20();
  os_log_type_t v8 = sub_23C991140();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v16 = v10;
    *(_DWORD *)uint64_t v9 = 136446466;
    uint64_t v11 = sub_23C96245C();
    sub_23C9733B0(v11, v12, &v16);
    sub_23C991240();

    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2082;
    objc_msgSend(v6, sel_contentState);
    type metadata accessor for FBSceneContentState(0);
    uint64_t v13 = sub_23C990FE0();
    sub_23C9733B0(v13, v14, &v16);
    sub_23C991240();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C948000, v7, v8, "[%{public}s] Content state changed: %{public}s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23ECEADB0](v10, -1, -1);
    MEMORY[0x23ECEADB0](v9, -1, -1);
  }
  else
  {
  }
}

void ActivityHostViewController.scene(_:didReceive:)(uint64_t a1, int64_t a2)
{
  if (qword_26AF22748 == -1) {
    goto LABEL_2;
  }
LABEL_90:
  swift_once();
LABEL_2:
  uint64_t v4 = sub_23C990E40();
  uint64_t v5 = __swift_project_value_buffer(v4, (uint64_t)qword_26AF22728);
  id v6 = v2;
  swift_bridgeObjectRetain_n();
  unsigned int v7 = v6;
  uint64_t v76 = (char *)v5;
  uint64_t v2 = (char *)v5;
  os_log_type_t v8 = sub_23C990E20();
  os_log_type_t v9 = sub_23C991140();
  uint64_t v83 = v7;
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    v88[0] = v11;
    *(_DWORD *)uint64_t v10 = 136446467;
    uint64_t v12 = sub_23C96245C();
    uint64_t v86 = sub_23C9733B0(v12, v13, v88);
    uint64_t v2 = (char *)v87;
    sub_23C991240();

    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2081;
    sub_23C959038(0, (unint64_t *)&unk_26AF227F0);
    sub_23C975BB4();
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_23C9910F0();
    unint64_t v16 = v15;
    swift_bridgeObjectRelease();
    uint64_t v17 = v14;
    unsigned int v7 = v83;
    uint64_t v86 = sub_23C9733B0(v17, v16, v88);
    sub_23C991240();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C948000, v8, v9, "[%{public}s] Scene did receive actions: %{private}s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23ECEADB0](v11, -1, -1);
    MEMORY[0x23ECEADB0](v10, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (v7[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_invalidated]) {
    return;
  }
  uint64_t v85 = MEMORY[0x263F8EE88];
  if ((a2 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_23C9912B0();
    uint64_t v2 = (char *)sub_23C959038(0, (unint64_t *)&unk_26AF227F0);
    sub_23C975BB4();
    sub_23C991100();
    a2 = v86;
    int64_t v80 = v87[0];
    uint64_t v18 = v87[1];
    uint64_t v19 = v87[2];
    unint64_t v20 = v87[3];
  }
  else
  {
    uint64_t v21 = -1 << *(unsigned char *)(a2 + 32);
    int64_t v80 = a2 + 56;
    uint64_t v22 = ~v21;
    uint64_t v23 = -v21;
    if (v23 < 64) {
      uint64_t v24 = ~(-1 << v23);
    }
    else {
      uint64_t v24 = -1;
    }
    unint64_t v20 = v24 & *(void *)(a2 + 56);
    swift_bridgeObjectRetain();
    uint64_t v18 = v22;
    uint64_t v19 = 0;
  }
  int64_t v79 = (unint64_t)(v18 + 64) >> 6;
  uint64_t v25 = &qword_268BBB000;
  int64_t v77 = a2;
  while (1)
  {
    if ((a2 & 0x8000000000000000) == 0)
    {
      if (v20)
      {
        uint64_t v82 = (v20 - 1) & v20;
        unint64_t v26 = __clz(__rbit64(v20)) | (v19 << 6);
        uint64_t v27 = v19;
      }
      else
      {
        int64_t v29 = v19 + 1;
        if (__OFADD__(v19, 1)) {
          goto LABEL_89;
        }
        if (v29 >= v79) {
          break;
        }
        unint64_t v30 = *(void *)(v80 + 8 * v29);
        uint64_t v27 = v19 + 1;
        if (!v30)
        {
          uint64_t v27 = v19 + 2;
          if (v19 + 2 >= v79) {
            break;
          }
          unint64_t v30 = *(void *)(v80 + 8 * v27);
          if (!v30)
          {
            uint64_t v27 = v19 + 3;
            if (v19 + 3 >= v79) {
              break;
            }
            unint64_t v30 = *(void *)(v80 + 8 * v27);
            if (!v30)
            {
              uint64_t v27 = v19 + 4;
              if (v19 + 4 >= v79) {
                break;
              }
              unint64_t v30 = *(void *)(v80 + 8 * v27);
              if (!v30)
              {
                uint64_t v31 = v19 + 5;
                do
                {
                  if (v79 == v31) {
                    goto LABEL_86;
                  }
                  unint64_t v30 = *(void *)(v80 + 8 * v31++);
                }
                while (!v30);
                uint64_t v27 = v31 - 1;
              }
            }
          }
        }
        uint64_t v82 = (v30 - 1) & v30;
        unint64_t v26 = __clz(__rbit64(v30)) + (v27 << 6);
      }
      id v28 = *(id *)(*(void *)(a2 + 48) + 8 * v26);
      if (!v28) {
        break;
      }
      goto LABEL_36;
    }
    if (!sub_23C9912E0()) {
      break;
    }
    sub_23C959038(0, (unint64_t *)&unk_26AF227F0);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v28 = v84;
    swift_unknownObjectRelease();
    uint64_t v27 = v19;
    uint64_t v82 = v20;
    if (!v28) {
      break;
    }
LABEL_36:
    uint64_t v81 = v27;
    self;
    uint64_t v32 = swift_dynamicCastObjCClass();
    if (v32 && (uint64_t v2 = (char *)v32, v33 = &v7[v25[19]], swift_beginAccess(), (v34 = MEMORY[0x23ECEAE20](v33)) != 0))
    {
      uint64_t v35 = (void *)v34;
      id v36 = v28;
      id v37 = objc_msgSend(v2, sel_launchActions);
      if (!v37)
      {
        objc_msgSend(v35, sel_activityHostViewControllerWithViewController_requestsLaunchWithAction_, v7, 0);
        goto LABEL_52;
      }
      long long v38 = v37;
      uint64_t v78 = v36;
      sub_23C959038(0, (unint64_t *)&unk_26AF227F0);
      sub_23C975BB4();
      uint64_t v39 = sub_23C9910E0();

      if ((v39 & 0xC000000000000001) != 0)
      {
        sub_23C9912B0();
        sub_23C991100();
        uint64_t v39 = v88[0];
        uint64_t v40 = v88[1];
        uint64_t v41 = v88[2];
        uint64_t v42 = v88[3];
        unint64_t v43 = v88[4];
      }
      else
      {
        uint64_t v42 = 0;
        uint64_t v63 = -1 << *(unsigned char *)(v39 + 32);
        uint64_t v40 = v39 + 56;
        uint64_t v41 = ~v63;
        uint64_t v64 = -v63;
        if (v64 < 64) {
          uint64_t v65 = ~(-1 << v64);
        }
        else {
          uint64_t v65 = -1;
        }
        unint64_t v43 = v65 & *(void *)(v39 + 56);
      }
      uint64_t v2 = (char *)(v39 & 0x7FFFFFFFFFFFFFFFLL);
      a2 = (unint64_t)(v41 + 64) >> 6;
      if (v39 < 0)
      {
        while (sub_23C9912E0())
        {
          swift_unknownObjectRetain();
          swift_dynamicCast();
          id v69 = v84;
          swift_unknownObjectRelease();
          uint64_t v68 = v42;
          uint64_t v66 = v43;
          if (!v69) {
            break;
          }
LABEL_81:
          objc_msgSend(v35, sel_activityHostViewControllerWithViewController_requestsLaunchWithAction_, v83, v69);

          uint64_t v42 = v68;
          unint64_t v43 = v66;
          if ((v39 & 0x8000000000000000) == 0) {
            goto LABEL_61;
          }
        }
      }
      else
      {
LABEL_61:
        if (v43)
        {
          uint64_t v66 = (v43 - 1) & v43;
          unint64_t v67 = __clz(__rbit64(v43)) | (v42 << 6);
          uint64_t v68 = v42;
          goto LABEL_80;
        }
        int64_t v70 = v42 + 1;
        if (__OFADD__(v42, 1))
        {
          __break(1u);
LABEL_89:
          __break(1u);
          goto LABEL_90;
        }
        if (v70 < a2)
        {
          unint64_t v71 = *(void *)(v40 + 8 * v70);
          uint64_t v68 = v42 + 1;
          if (v71) {
            goto LABEL_79;
          }
          uint64_t v68 = v42 + 2;
          if (v42 + 2 >= a2) {
            goto LABEL_83;
          }
          unint64_t v71 = *(void *)(v40 + 8 * v68);
          if (v71) {
            goto LABEL_79;
          }
          uint64_t v68 = v42 + 3;
          if (v42 + 3 >= a2) {
            goto LABEL_83;
          }
          unint64_t v71 = *(void *)(v40 + 8 * v68);
          if (v71) {
            goto LABEL_79;
          }
          uint64_t v68 = v42 + 4;
          if (v42 + 4 >= a2) {
            goto LABEL_83;
          }
          unint64_t v71 = *(void *)(v40 + 8 * v68);
          if (v71)
          {
LABEL_79:
            uint64_t v66 = (v71 - 1) & v71;
            unint64_t v67 = __clz(__rbit64(v71)) + (v68 << 6);
LABEL_80:
            id v69 = *(id *)(*(void *)(v39 + 48) + 8 * v67);
            if (!v69) {
              goto LABEL_83;
            }
            goto LABEL_81;
          }
          uint64_t v72 = v42 + 5;
          while (a2 != v72)
          {
            unint64_t v71 = *(void *)(v40 + 8 * v72++);
            if (v71)
            {
              uint64_t v68 = v72 - 1;
              goto LABEL_79;
            }
          }
        }
      }
LABEL_83:
      sub_23C977B28();
      swift_unknownObjectRelease();

      uint64_t v19 = v81;
      unint64_t v20 = v82;
      a2 = v77;
      unsigned int v7 = v83;
      uint64_t v25 = &qword_268BBB000;
    }
    else
    {
      self;
      uint64_t v44 = swift_dynamicCastObjCClass();
      if (!v44)
      {
        uint64_t v2 = (char *)&v85;
        sub_23C974304(&v84, v28);

        goto LABEL_14;
      }
      unint64_t v45 = (void *)v44;
      id v36 = v28;
      id v46 = objc_msgSend(v45, sel_command);
      if (v46 == (id)3)
      {
        uint64_t v2 = &v7[v25[19]];
        swift_beginAccess();
        id v48 = (char *)MEMORY[0x23ECEAE20](v2);
        if (v48)
        {
          uint64_t v2 = v48;
          objc_msgSend(v48, sel_activityHostViewControllerSignificantUserInteractionEndedWithViewController_, v7);
          goto LABEL_52;
        }
        goto LABEL_53;
      }
      if (v46 == (id)2)
      {
        uint64_t v2 = &v7[v25[19]];
        swift_beginAccess();
        long long v49 = (char *)MEMORY[0x23ECEAE20](v2);
        if (v49)
        {
          uint64_t v2 = v49;
          objc_msgSend(v49, sel_activityHostViewControllerSignificantUserInteractionBeganWithViewController_, v7);
          goto LABEL_52;
        }
        goto LABEL_53;
      }
      if (v46 == (id)1)
      {
        uint64_t v2 = &v7[v25[19]];
        swift_beginAccess();
        uint64_t v47 = (char *)MEMORY[0x23ECEAE20](v2);
        if (v47)
        {
          uint64_t v2 = v47;
          objc_msgSend(v47, sel_activityHostViewControllerHostShouldCancelTouchesWithViewController_, v7);
LABEL_52:
          swift_unknownObjectRelease();
        }
LABEL_53:

LABEL_14:
        uint64_t v19 = v81;
        unint64_t v20 = v82;
      }
      else
      {
        os_log_type_t v50 = v7;
        id v51 = v36;
        uint64_t v52 = v50;
        id v53 = v51;
        uint64_t v2 = v76;
        uint64_t v54 = sub_23C990E20();
        os_log_type_t v55 = sub_23C991130();
        if (os_log_type_enabled(v54, v55))
        {
          uint64_t v56 = swift_slowAlloc();
          uint64_t v57 = (void *)swift_slowAlloc();
          id v84 = v57;
          *(_DWORD *)uint64_t v56 = 136446466;
          uint64_t v58 = sub_23C96245C();
          *(void *)(v56 + 4) = sub_23C9733B0(v58, v59, (uint64_t *)&v84);

          swift_bridgeObjectRelease();
          *(_WORD *)(v56 + 12) = 2080;
          objc_msgSend(v45, sel_command);
          type metadata accessor for ACUISActivitySceneCommand(0);
          uint64_t v60 = sub_23C990FE0();
          uint64_t v2 = (char *)v61;
          *(void *)(v56 + 14) = sub_23C9733B0(v60, v61, (uint64_t *)&v84);

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_23C948000, v54, v55, "[%{public}s] Unknown ACUISActivitySceneAction command: %s", (uint8_t *)v56, 0x16u);
          swift_arrayDestroy();
          uint64_t v62 = v57;
          unsigned int v7 = v83;
          MEMORY[0x23ECEADB0](v62, -1, -1);
          MEMORY[0x23ECEADB0](v56, -1, -1);
        }
        else
        {
        }
        uint64_t v19 = v81;
        unint64_t v20 = v82;
        uint64_t v25 = &qword_268BBB000;
      }
    }
  }
LABEL_86:
  sub_23C977B28();
  id v73 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29B00]), sel_init);
  sub_23C959038(0, (unint64_t *)&unk_26AF227F0);
  sub_23C975BB4();
  unint64_t v74 = (void *)sub_23C9910D0();
  swift_bridgeObjectRelease();
}

id ActivityHostViewController.scene(_:didUpdateClientSettingsWith:oldClientSettings:transitionContext:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return sub_23C97643C(a2, a4);
}

void ActivityHostViewController.sceneLayerManagerDidUpdateLayers(_:)()
{
}

void ActivityHostViewController.sceneLayerManagerDidStopTrackingLayers(_:)()
{
}

void ActivityHostViewController.sceneLayerManagerDidStartTrackingLayers(_:)()
{
}

uint64_t sub_23C9730A4(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_23C9730B4(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

void *sub_23C9730F0(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_268BBADC0);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      id v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      unint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      unint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_23C975204(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_23C973200(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AF22868);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      id v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      unint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      unint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_23C97574C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_23C973310(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_23C973338(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_23C9733B0(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_23C991240();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_23C9733B0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_23C973484(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_23C977BB8((uint64_t)v12, *a3);
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
      sub_23C977BB8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_23C973484(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23C991250();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_23C973640(a5, a6);
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
  uint64_t v8 = sub_23C991360();
  if (!v8)
  {
    sub_23C9913C0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_23C991430();
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

uint64_t sub_23C973640(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_23C9736D8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_23C9738B8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_23C9738B8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23C9736D8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_23C973850(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_23C991340();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_23C9913C0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_23C991010();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_23C991430();
    __break(1u);
LABEL_14:
    uint64_t result = sub_23C9913C0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_23C973850(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF22840);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23C9738B8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF22840);
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
  unint64_t v13 = a4 + 32;
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
  uint64_t result = sub_23C991430();
  __break(1u);
  return result;
}

unsigned char **sub_23C973A08(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

void *sub_23C973A18(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)sub_23C991430();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

uint64_t sub_23C973ABC@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_23C973AEC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_23C973B14(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  a4();
  uint64_t v5 = *a1 + 8;
  uint64_t result = sub_23C991240();
  *a1 = v5;
  return result;
}

unint64_t sub_23C973B6C(uint64_t a1, uint64_t a2)
{
  sub_23C9915C0();
  sub_23C990FF0();
  uint64_t v4 = sub_23C991620();
  return sub_23C973CA0(a1, a2, v4);
}

unint64_t sub_23C973BE4(unsigned int a1)
{
  uint64_t v3 = MEMORY[0x23ECEA400](*(void *)(v1 + 40), a1, 4);
  return sub_23C973D84(a1, v3);
}

unint64_t sub_23C973C2C(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268BBA5D0);
  uint64_t v2 = sub_23C990F90();
  return sub_23C973E20(a1, v2);
}

unint64_t sub_23C973CA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_23C9914F0() & 1) == 0)
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
      while (!v14 && (sub_23C9914F0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_23C973D84(int a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(_DWORD *)(v7 + 4 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(_DWORD *)(v7 + 4 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_23C973E20(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268BBA5D0);
    do
    {
      if (sub_23C990FB0()) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_23C973EF0(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    unint64_t result = sub_23C991290();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v9 = *(void *)(a2 + 48);
        uint64_t v10 = (_DWORD *)(v9 + 4 * v6);
        unint64_t result = MEMORY[0x23ECEA400](*(void *)(a2 + 40), *v10, 4);
        unint64_t v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= (uint64_t)v11)
          {
LABEL_16:
            BOOL v14 = (_DWORD *)(v9 + 4 * v3);
            if (v3 != v6 || v14 >= v10 + 1) {
              *BOOL v14 = *v10;
            }
            uint64_t v15 = *(void *)(a2 + 56);
            unint64_t v16 = (void *)(v15 + 8 * v3);
            uint64_t v17 = (void *)(v15 + 8 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 1))
            {
              *unint64_t v16 = *v17;
              int64_t v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= (uint64_t)v11)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  *uint64_t v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_23C97408C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF22850);
  uint64_t v3 = swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size((const void *)v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 29;
  }
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = 2 * (v5 >> 2);
  unint64_t v6 = sub_23C975070(&v8, (_DWORD *)(v3 + 32), v1, a1);
  swift_bridgeObjectRetain();
  sub_23C977B28();
  if (v6 != (void *)v1)
  {
    __break(1u);
    return MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t sub_23C974174(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_23C974194(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_23C974194(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF22858);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  BOOL v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_23C991430();
  __break(1u);
  return result;
}

uint64_t sub_23C974304(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = sub_23C9912D0();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_23C959038(0, (unint64_t *)&unk_26AF227F0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_23C9912C0();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v21 = sub_23C9745A4(v7, result + 1);
    uint64_t v27 = v21;
    if (*(void *)(v21 + 24) <= *(void *)(v21 + 16))
    {
      id v25 = v8;
      sub_23C97479C();
      uint64_t v22 = v27;
    }
    else
    {
      uint64_t v22 = v21;
      id v23 = v8;
    }
    sub_23C974A3C((uint64_t)v8, v22);
    *uint64_t v3 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_23C9911F0();
    uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v13 = v11 & ~v12;
    if ((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
    {
      sub_23C959038(0, (unint64_t *)&unk_26AF227F0);
      id v14 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
      char v15 = sub_23C991200();

      if (v15)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        uint64_t v19 = *(void **)(*(void *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        id v20 = v19;
        return 0;
      }
      uint64_t v16 = ~v12;
      while (1)
      {
        unint64_t v13 = (v13 + 1) & v16;
        if (((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0) {
          break;
        }
        id v17 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
        char v18 = sub_23C991200();

        if (v18) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v28 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    id v8 = a2;
    sub_23C974AC0((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_23C9745A4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF22820);
    uint64_t v2 = sub_23C991310();
    uint64_t v14 = v2;
    sub_23C9912B0();
    if (sub_23C9912E0())
    {
      sub_23C959038(0, (unint64_t *)&unk_26AF227F0);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_23C97479C();
          uint64_t v2 = v14;
        }
        uint64_t result = sub_23C9911F0();
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
        ++*(void *)(v2 + 16);
      }
      while (sub_23C9912E0());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE88];
  }
  return v2;
}

uint64_t sub_23C97479C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF22820);
  uint64_t v3 = sub_23C991300();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v28;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v6 = -1 << v27;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
      uint64_t result = sub_23C9911F0();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v25 = v22 == v24;
          if (v22 == v24) {
            unint64_t v22 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

unint64_t sub_23C974A3C(uint64_t a1, uint64_t a2)
{
  sub_23C9911F0();
  unint64_t result = sub_23C9912A0();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

void sub_23C974AC0(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_23C97479C();
  }
  else
  {
    if (v7 > v6)
    {
      sub_23C974C48();
      goto LABEL_14;
    }
    sub_23C974DF4();
  }
  uint64_t v8 = *v3;
  uint64_t v9 = sub_23C9911F0();
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_23C959038(0, (unint64_t *)&unk_26AF227F0);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_23C991200();

    if (v12)
    {
LABEL_13:
      sub_23C991520();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v14 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
        char v15 = sub_23C991200();

        if (v15) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = a1;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
}

id sub_23C974C48()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF22820);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_23C9912F0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_23C974DF4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF22820);
  uint64_t v3 = sub_23C991300();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v27 = v0;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    id v19 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = sub_23C9911F0();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v10 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v27;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

void *sub_23C975070(void *result, _DWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4 + 64;
  uint64_t v5 = -1;
  uint64_t v6 = -1 << *(unsigned char *)(a4 + 32);
  if (-v6 < 64) {
    uint64_t v5 = ~(-1 << -(char)v6);
  }
  unint64_t v7 = v5 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v8 = 0;
    a3 = 0;
LABEL_35:
    *uint64_t result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (void *)a3;
  }
  if (!a3)
  {
    int64_t v8 = 0;
    goto LABEL_35;
  }
  if (a3 < 0)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  int64_t v8 = 0;
  uint64_t v9 = 0;
  int64_t v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    unint64_t v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v12 = v11 | (v8 << 6);
LABEL_8:
    ++v9;
    *a2++ = *(_DWORD *)(*(void *)(a4 + 48) + 4 * v12);
    if (v9 == a3) {
      goto LABEL_35;
    }
  }
  int64_t v13 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v13 >= v10) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v13);
  if (v14) {
    goto LABEL_19;
  }
  v8 += 2;
  if (v13 + 1 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13;
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_15:
    int64_t v13 = v8;
LABEL_19:
    unint64_t v16 = __clz(__rbit64(v14));
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v12 = v16 + (v13 << 6);
    int64_t v8 = v13;
    goto LABEL_8;
  }
  int64_t v15 = v13 + 2;
  if (v13 + 2 >= v10) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_18:
    int64_t v13 = v15;
    goto LABEL_19;
  }
  int64_t v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13 + 2;
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14) {
    goto LABEL_15;
  }
  int64_t v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_30:
    unint64_t v7 = 0;
LABEL_34:
    a3 = v9;
    goto LABEL_35;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14) {
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v13 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v13 >= v10)
    {
      unint64_t v7 = 0;
      int64_t v8 = v10 - 1;
      goto LABEL_34;
    }
    unint64_t v14 = *(void *)(v4 + 8 * v13);
    ++v15;
    if (v14) {
      goto LABEL_19;
    }
  }
LABEL_38:
  __break(1u);
  return result;
}

char *sub_23C975204(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    unint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_23C991430();
  __break(1u);
  return result;
}

unint64_t sub_23C9752F0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE80];
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF22830);
  uint64_t v3 = (void *)sub_23C991420();
  unsigned int v4 = *(_DWORD *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  unint64_t result = sub_23C973BE4(v4);
  if (v7)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    id v16 = v5;
    return (unint64_t)v3;
  }
  int64_t v8 = (void *)(a1 + 56);
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_DWORD *)(v3[6] + 4 * result) = v4;
    *(void *)(v3[7] + 8 * result) = v5;
    uint64_t v9 = v3[2];
    BOOL v10 = __OFADD__(v9, 1);
    uint64_t v11 = v9 + 1;
    if (v10) {
      break;
    }
    v3[2] = v11;
    if (!--v1) {
      goto LABEL_8;
    }
    unint64_t v12 = v8 + 2;
    unsigned int v4 = *((_DWORD *)v8 - 2);
    int64_t v13 = (void *)*v8;
    id v14 = v5;
    unint64_t result = sub_23C973BE4(v4);
    int64_t v8 = v12;
    uint64_t v5 = v13;
    if (v15) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_23C9753EC(uint64_t a1)
{
  uint64_t v2 = sub_23C990D00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for ActivityHostViewController()
{
  return self;
}

uint64_t sub_23C97546C()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_23C9754A4(void *a1, uint64_t a2)
{
  sub_23C9697DC(a1, a2, v2);
}

uint64_t sub_23C9754AC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23C9754BC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_23C9754E4()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
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

uint64_t sub_23C97550C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_23C97555C(uint64_t a1)
{
  return sub_23C96AFD0(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48));
}

uint64_t sub_23C97556C()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_23C9755AC()
{
  sub_23C96B8C8(*(void **)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_23C9755B8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_23C9755F0(void *a1)
{
  return sub_23C96BAD4(a1, *(id *)(v1 + 16));
}

void sub_23C9755F8()
{
  sub_23C96B6CC(*(void **)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32), "[%{public}s] Ensure content: initial content size ready");
}

void sub_23C975638()
{
  sub_23C96B6CC(*(void **)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32), "[%{public}s] Ensure content: archive content ready");
}

void sub_23C975678(void *a1)
{
  sub_23C970248(a1, *(void **)(v1 + 16), "[%{public}s] Sending cancellation touch delivery policy failed with error: %{public}s");
}

void *sub_23C97569C(void *a1, void *a2, SEL *a3)
{
  size_t v6 = (void **)(v3 + *a2);
  swift_beginAccess();
  char v7 = *v6;
  *size_t v6 = a1;
  id v8 = a1;

  BSDispatchQueueAssertMain();
  uint64_t v9 = v3 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_delegate;
  swift_beginAccess();
  unint64_t result = (void *)MEMORY[0x23ECEAE20](v9);
  if (result)
  {
    objc_msgSend(result, *a3, v3);
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_23C97574C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(qword_26AF22880);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_23C991430();
  __break(1u);
  return result;
}

void sub_23C975858(unint64_t a1)
{
  unint64_t v1 = a1;
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_23C9913E0();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF22820);
      uint64_t v3 = sub_23C991320();
      uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_23C9913E0();
      swift_bridgeObjectRelease();
      if (!v5) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  uint64_t v3 = MEMORY[0x263F8EE88];
  uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return;
  }
LABEL_9:
  uint64_t v7 = v3 + 56;
  uint64_t v43 = v5;
  if ((v1 & 0xC000000000000001) != 0)
  {
    uint64_t v8 = 0;
    unint64_t v41 = v1;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = MEMORY[0x23ECEA1A0](v8, v1);
        BOOL v10 = __OFADD__(v8++, 1);
        if (v10)
        {
          __break(1u);
          goto LABEL_36;
        }
        uint64_t v11 = v9;
        uint64_t v12 = sub_23C9911F0();
        uint64_t v13 = -1 << *(unsigned char *)(v3 + 32);
        unint64_t v14 = v12 & ~v13;
        unint64_t v15 = v14 >> 6;
        uint64_t v16 = *(void *)(v7 + 8 * (v14 >> 6));
        uint64_t v17 = 1 << v14;
        if (((1 << v14) & v16) != 0) {
          break;
        }
LABEL_20:
        *(void *)(v7 + 8 * v15) = v17 | v16;
        *(void *)(*(void *)(v3 + 48) + 8 * v14) = v11;
        uint64_t v23 = *(void *)(v3 + 16);
        BOOL v10 = __OFADD__(v23, 1);
        uint64_t v24 = v23 + 1;
        if (v10) {
          goto LABEL_37;
        }
        *(void *)(v3 + 16) = v24;
        if (v8 == v5) {
          return;
        }
      }
      sub_23C959038(0, (unint64_t *)&unk_26AF227F0);
      id v18 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
      char v19 = sub_23C991200();

      if ((v19 & 1) == 0)
      {
        uint64_t v20 = ~v13;
        while (1)
        {
          unint64_t v14 = (v14 + 1) & v20;
          unint64_t v15 = v14 >> 6;
          uint64_t v16 = *(void *)(v7 + 8 * (v14 >> 6));
          uint64_t v17 = 1 << v14;
          if ((v16 & (1 << v14)) == 0) {
            break;
          }
          id v21 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
          char v22 = sub_23C991200();

          if (v22) {
            goto LABEL_11;
          }
        }
        unint64_t v1 = v41;
        uint64_t v5 = v43;
        goto LABEL_20;
      }
LABEL_11:
      swift_unknownObjectRelease();
      unint64_t v1 = v41;
      uint64_t v5 = v43;
      if (v8 == v43) {
        return;
      }
    }
  }
  uint64_t v25 = 0;
  unint64_t v40 = v1 + 32;
  uint64_t v42 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v25 != v42)
  {
    id v26 = *(id *)(v40 + 8 * v25);
    uint64_t v27 = sub_23C9911F0();
    uint64_t v28 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v29 = v27 & ~v28;
    unint64_t v30 = v29 >> 6;
    uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
    uint64_t v32 = 1 << v29;
    if (((1 << v29) & v31) != 0)
    {
      sub_23C959038(0, (unint64_t *)&unk_26AF227F0);
      id v33 = *(id *)(*(void *)(v3 + 48) + 8 * v29);
      char v34 = sub_23C991200();

      if (v34)
      {
LABEL_24:

        goto LABEL_25;
      }
      uint64_t v35 = ~v28;
      while (1)
      {
        unint64_t v29 = (v29 + 1) & v35;
        unint64_t v30 = v29 >> 6;
        uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
        uint64_t v32 = 1 << v29;
        if ((v31 & (1 << v29)) == 0) {
          break;
        }
        id v36 = *(id *)(*(void *)(v3 + 48) + 8 * v29);
        char v37 = sub_23C991200();

        if (v37) {
          goto LABEL_24;
        }
      }
    }
    *(void *)(v7 + 8 * v30) = v32 | v31;
    *(void *)(*(void *)(v3 + 48) + 8 * v29) = v26;
    uint64_t v38 = *(void *)(v3 + 16);
    BOOL v10 = __OFADD__(v38, 1);
    uint64_t v39 = v38 + 1;
    if (v10) {
      goto LABEL_38;
    }
    *(void *)(v3 + 16) = v39;
LABEL_25:
    if (++v25 == v43) {
      return;
    }
  }
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
}

unint64_t sub_23C975BB4()
{
  unint64_t result = qword_26AF22800;
  if (!qword_26AF22800)
  {
    sub_23C959038(255, (unint64_t *)&unk_26AF227F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF22800);
  }
  return result;
}

void sub_23C975C1C(void *a1, uint64_t a2)
{
  sub_23C96A7E0(a1, a2, v2);
}

uint64_t sub_23C975C24()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23C975C34()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

id sub_23C975C44(uint64_t a1, uint64_t a2)
{
  return sub_23C96AB14(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_23C975C4C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23C975C5C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_23C975C6C()
{
  swift_unknownObjectWeakInit();
  *(_DWORD *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController__presentationMode] = 0;
  v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_wantsBaseContentTouchEvents] = 0;
  *(void *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_backgroundTintColor] = 0;
  *(void *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_textColor] = 0;
  *(void *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_resolvedMetrics] = 0;
  v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_idleTimerDisabled] = 0;
  *(void *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_audioCategoriesDisablingVolumeHUD] = 0;
  v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_archivedActivityFamily] = 2;
  v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_baseContentTouchedDown] = 0;
  v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_actionButtonInitiated] = 0;
  uint64_t v1 = MEMORY[0x263F8EE78];
  *(void *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activityTouchRestrictedRects] = MEMORY[0x263F8EE78];
  uint64_t v2 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_settingsDiffInspector;
  *(void *)&v0[v2] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ActivitySceneClientSettingsDiffInspector()), sel_init);
  *(void *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scene] = 0;
  v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneForeground] = 0;
  v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_invalidated] = 0;
  *(void *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_scenePresenter] = 0;
  *(void *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activatedSceneView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_liveSceneSnapshotView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_debugLabel] = 0;
  *(void *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_presentationAssertion] = 0;
  v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_waitingForArchiveContentReady] = 0;
  *(void *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_waitingForArchiveContentReadyBlocks] = v1;
  *(void *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_waitingForInitialContentSizeReadyBlocks] = v1;
  v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneActivated] = 0;
  *(void *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneActivatedBlocks] = v1;
  uint64_t v3 = OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_touchDeliveryPolicyAssertions;
  *(void *)&v0[v3] = sub_23C9752F0(v1);
  uint64_t v4 = &v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController____lazy_storage___logIdentifier];
  *uint64_t v4 = 0;
  v4[1] = 0;
  *(void *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController____lazy_storage___queue] = 0;
  *(void *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_backOffTimer] = 0;
  *(void *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_ensureContentTimer] = 0;
  *(void *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneClientExitCountWithinTimeout] = 0;
  *(void *)&v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneClientExitTimer] = 0;
  v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_shouldShareTouchesWithHost] = 0;

  sub_23C9913D0();
  __break(1u);
}

void *sub_23C975EA4(void *result)
{
  if (result)
  {
    id v1 = result;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF226B0);
    sub_23C959038(0, &qword_26AF227E0);
    if ((swift_dynamicCast() & 1) == 0) {
      return 0;
    }
    id v2 = objc_msgSend(v10, sel_domain);
    uint64_t v3 = sub_23C990FD0();
    uint64_t v5 = v4;

    if (v3 == sub_23C990FD0() && v5 == v6)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v8 = sub_23C9914F0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v8 & 1) == 0)
      {

        return 0;
      }
    }
    id v9 = objc_msgSend(v10, sel_code);

    return (void *)(v9 == (id)4);
  }
  return result;
}

uint64_t _s18ActivityUIServices0A18HostViewControllerC16sceneDidActivateyySo7FBSceneCF_0()
{
  if (qword_26AF22748 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_23C990E40();
  __swift_project_value_buffer(v1, (uint64_t)qword_26AF22728);
  id v2 = v0;
  uint64_t v3 = sub_23C990E20();
  os_log_type_t v4 = sub_23C991120();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    v16[0] = v6;
    *(_DWORD *)uint64_t v5 = 136446210;
    uint64_t v7 = sub_23C96245C();
    sub_23C9733B0(v7, v8, v16);
    sub_23C991240();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C948000, v3, v4, "[%{public}s] Scene did activate.", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEADB0](v6, -1, -1);
    MEMORY[0x23ECEADB0](v5, -1, -1);
  }
  else
  {
  }
  v2[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneActivated] = 1;
  id v9 = &v2[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneActivatedBlocks];
  swift_beginAccess();
  uint64_t v10 = *(void *)v9;
  uint64_t v11 = *(void *)(*(void *)v9 + 16);
  if (v11)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = v10 + 40;
    do
    {
      uint64_t v13 = *(void (**)(uint64_t))(v12 - 8);
      uint64_t v14 = swift_retain();
      v13(v14);
      swift_release();
      v12 += 16;
      --v11;
    }
    while (v11);
    swift_bridgeObjectRelease();
  }
  *(void *)id v9 = MEMORY[0x263F8EE78];
  return swift_bridgeObjectRelease();
}

void _s18ActivityUIServices0A18HostViewControllerC18sceneDidInvalidateyySo7FBSceneCF_0()
{
  v0[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_sceneActivated] = 0;
  if (qword_26AF22748 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_23C990E40();
  __swift_project_value_buffer(v1, (uint64_t)qword_26AF22728);
  unint64_t v8 = v0;
  id v2 = sub_23C990E20();
  os_log_type_t v3 = sub_23C991120();
  if (os_log_type_enabled(v2, v3))
  {
    os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v9 = v5;
    *(_DWORD *)os_log_type_t v4 = 136446210;
    uint64_t v6 = sub_23C96245C();
    sub_23C9733B0(v6, v7, &v9);
    sub_23C991240();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C948000, v2, v3, "[%{public}s] Scene did invalidate.", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEADB0](v5, -1, -1);
    MEMORY[0x23ECEADB0](v4, -1, -1);
  }
  else
  {
  }
}

uint64_t sub_23C9763EC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_23C97642C()
{
  sub_23C971CC4(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

void sub_23C976434(void *a1)
{
  sub_23C971C40(a1, v1);
}

id sub_23C97643C(uint64_t a1, void *a2)
{
  if (qword_26AF22748 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_23C990E40();
  __swift_project_value_buffer(v5, (uint64_t)qword_26AF22728);
  uint64_t v6 = v2;
  unint64_t v7 = sub_23C990E20();
  os_log_type_t v8 = sub_23C991120();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v17 = v10;
    *(_DWORD *)uint64_t v9 = 136446210;
    uint64_t v11 = sub_23C96245C();
    uint64_t v16 = sub_23C9733B0(v11, v12, &v17);
    sub_23C991240();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C948000, v7, v8, "[%{public}s] Scene did receive new client settings.", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEADB0](v10, -1, -1);
    MEMORY[0x23ECEADB0](v9, -1, -1);

    if (!a2) {
      return objc_msgSend(*(id *)&v6[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_settingsDiffInspector], sel_inspectDiff_withContext_, a1, 0, v16);
    }
  }
  else
  {

    if (!a2) {
      return objc_msgSend(*(id *)&v6[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_settingsDiffInspector], sel_inspectDiff_withContext_, a1, 0, v16);
    }
  }
  id v13 = objc_msgSend(a2, sel_animationFence, v16, v17);
  if (v13)
  {
    uint64_t v14 = v13;
    objc_msgSend(self, sel__synchronizeDrawingWithFence_, v13);
  }
  return objc_msgSend(*(id *)&v6[OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_settingsDiffInspector], sel_inspectDiff_withContext_, a1, 0, v16);
}

void sub_23C976654(void (*a1)(void), const char *a2)
{
  a1();
  if (qword_26AF22748 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_23C990E40();
  __swift_project_value_buffer(v4, (uint64_t)qword_26AF22728);
  id v11 = v2;
  uint64_t v5 = sub_23C990E20();
  os_log_type_t v6 = sub_23C991120();
  if (os_log_type_enabled(v5, v6))
  {
    unint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v12 = v8;
    *(_DWORD *)unint64_t v7 = 136446210;
    uint64_t v9 = sub_23C96245C();
    sub_23C9733B0(v9, v10, &v12);
    sub_23C991240();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C948000, v5, v6, a2, v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEADB0](v8, -1, -1);
    MEMORY[0x23ECEADB0](v7, -1, -1);
  }
  else
  {
  }
}

unint64_t sub_23C976834()
{
  unint64_t result = qword_268BBB1C8;
  if (!qword_268BBB1C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBB1C8);
  }
  return result;
}

uint64_t sub_23C976888@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_delegate;
  swift_beginAccess();
  uint64_t result = MEMORY[0x23ECEAE20](v3);
  *a2 = result;
  return result;
}

uint64_t sub_23C9768E0()
{
  return swift_unknownObjectWeakAssign();
}

id sub_23C976938@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activitySceneDescriptor, a2);
}

void sub_23C976944(void **a1, void *a2, uint64_t a3, uint64_t a4)
{
}

void *sub_23C976964@<X0>(void *result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = *(_DWORD *)(*result + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController__presentationMode);
  return result;
}

void sub_23C97697C(unsigned int *a1)
{
  uint64_t v1 = *a1;
  BSDispatchQueueAssertMain();
  sub_23C965288(v1, 0);
}

uint64_t sub_23C9769B0@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_70Tm(a1, &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_wantsBaseContentTouchEvents, a2);
}

uint64_t sub_23C9769BC(char *a1)
{
  return sub_23C961AD4(*a1);
}

id sub_23C9769E4@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_backgroundTintColor, a2);
}

void sub_23C9769F0(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  sub_23C97569C(v1, &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_backgroundTintColor, (SEL *)&selRef_activityHostViewControllerBackgroundTintColorDidChangeWithViewController_);
}

id sub_23C976A50@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_textColor, a2);
}

void sub_23C976A5C(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  sub_23C97569C(v1, &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_textColor, (SEL *)&selRef_activityHostViewControllerTextColorDidChangeWithViewController_);
}

id sub_23C976ABC@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_resolvedMetrics, a2);
}

uint64_t sub_23C976ACC@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_70Tm(a1, &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_idleTimerDisabled, a2);
}

void *sub_23C976AD8(unsigned __int8 *a1)
{
  return sub_23C961EB4(*a1);
}

uint64_t sub_23C976B00@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1
                + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_audioCategoriesDisablingVolumeHUD);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_23C976B5C@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = (unsigned char *)(*a1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_archivedActivityFamily);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_23C976BB0(char *a1, void *a2)
{
  char v2 = *a1;
  uint64_t v3 = (unsigned char *)(*a2 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_archivedActivityFamily);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = v2;
  return result;
}

uint64_t sub_23C976C00@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_70Tm(a1, &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_baseContentTouchedDown, a2);
}

uint64_t sub_23C976C0C(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_85Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_baseContentTouchedDown);
}

uint64_t sub_23C976C18@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_70Tm(a1, &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_actionButtonInitiated, a2);
}

uint64_t sub_23C976C24(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_85Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_actionButtonInitiated);
}

uint64_t keypath_set_85Tm(char *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  char v5 = *a1;
  os_log_type_t v6 = (unsigned char *)(*a2 + *a5);
  uint64_t result = swift_beginAccess();
  *os_log_type_t v6 = v5;
  return result;
}

uint64_t sub_23C976C7C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_activityTouchRestrictedRects);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

id sub_23C976CD8@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_systemProvidedMetrics, a2);
}

void sub_23C976CE4(void **a1, void *a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_23C976D04@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_70Tm(a1, &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_shouldShareTouchesWithHost, a2);
}

uint64_t keypath_get_70Tm@<X0>(void *a1@<X0>, void *a2@<X3>, unsigned char *a3@<X8>)
{
  uint64_t v4 = (unsigned char *)(*a1 + *a2);
  uint64_t result = swift_beginAccess();
  *a3 = *v4;
  return result;
}

uint64_t method lookup function for ActivityHostViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ActivityHostViewController);
}

uint64_t dispatch thunk of ActivityHostViewController.delegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of ActivityHostViewController.delegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of ActivityHostViewController.delegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of ActivityHostViewController.activitySceneDescriptor.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of ActivityHostViewController.acActivityDescriptor.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of ActivityHostViewController.presentationMode.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of ActivityHostViewController.presentationMode.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of ActivityHostViewController.presentationMode.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of ActivityHostViewController.wantsBaseContentTouchEvents.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of ActivityHostViewController.wantsBaseContentTouchEvents.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of ActivityHostViewController.wantsBaseContentTouchEvents.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1F0))();
}

uint64_t dispatch thunk of ActivityHostViewController.backgroundTintColor.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1F8))();
}

uint64_t dispatch thunk of ActivityHostViewController.textColor.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x210))();
}

uint64_t dispatch thunk of ActivityHostViewController.resolvedMetrics.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x228))();
}

uint64_t dispatch thunk of ActivityHostViewController.idleTimerDisabled.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x240))();
}

uint64_t dispatch thunk of ActivityHostViewController.audioCategoriesDisablingVolumeHUD.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x258))();
}

uint64_t dispatch thunk of ActivityHostViewController.archivedActivityFamily.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x270))();
}

uint64_t dispatch thunk of ActivityHostViewController.baseContentTouchedDown.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x288))();
}

uint64_t dispatch thunk of ActivityHostViewController.actionButtonInitiated.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2A0))();
}

uint64_t dispatch thunk of ActivityHostViewController.activityTouchRestrictedRects.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2B8))();
}

uint64_t dispatch thunk of ActivityHostViewController.systemProvidedMetrics.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2D0))();
}

uint64_t dispatch thunk of ActivityHostViewController.systemProvidedMetrics.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2D8))();
}

uint64_t dispatch thunk of ActivityHostViewController.systemProvidedMetrics.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2E0))();
}

uint64_t dispatch thunk of ActivityHostViewController.fallbackMetrics.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2E8))();
}

uint64_t dispatch thunk of ActivityHostViewController.__allocating_init(activitySceneDescriptor:)()
{
  return (*(uint64_t (**)(void))(v0 + 1264))();
}

uint64_t dispatch thunk of ActivityHostViewController.ensureContent(timeout:queue:completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x508))();
}

uint64_t dispatch thunk of ActivityHostViewController.backlightHostEnvironment.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x510))();
}

uint64_t dispatch thunk of ActivityHostViewController.invalidate()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x518))();
}

uint64_t dispatch thunk of ActivityHostViewController.shouldShareTouchesWithHost.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x520))();
}

uint64_t dispatch thunk of ActivityHostViewController.shouldShareTouchesWithHost.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x528))();
}

uint64_t dispatch thunk of ActivityHostViewController.shouldShareTouchesWithHost.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x530))();
}

uint64_t dispatch thunk of ActivityHostViewController.cancelTouchesForCurrentEventInHostedContent()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x538))();
}

uint64_t dispatch thunk of ActivityHostViewController.requestLaunch()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x540))();
}

ValueMetadata *type metadata accessor for ActivityHostViewController.PresentationMode()
{
  return &type metadata for ActivityHostViewController.PresentationMode;
}

uint64_t sub_23C977520()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_23C977558(uint64_t a1)
{
  sub_23C96BC18(a1, *(void *)(v1 + 16));
}

uint64_t sub_23C977560()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_23C9775A0(void *a1, char a2)
{
  sub_23C970508(a1, a2 & 1, *(void **)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32));
}

uint64_t sub_23C9775B0()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_23C9775F0()
{
  uint64_t v1 = *(uint64_t (**)(uint64_t, void))(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 32);
  unsigned int v3 = objc_msgSend(v2, sel_capture);
  uint64_t v4 = 2;
  if (v3) {
    uint64_t v4 = (uint64_t)v2;
  }
  return v1(v4, v3 ^ 1);
}

uint64_t sub_23C97764C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_23C9776DC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 33, 7);
}

uint64_t sub_23C977714()
{
  return (*(uint64_t (**)(void))(v0 + 16))(*(unsigned __int8 *)(v0 + 32));
}

unint64_t sub_23C977744()
{
  unint64_t result = qword_26AF226F0;
  if (!qword_26AF226F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF226F0);
  }
  return result;
}

uint64_t sub_23C977798()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_23C9777E0()
{
  sub_23C970910(*(char **)(v0 + 16), *(void **)(v0 + 24), *(void (**)(void))(v0 + 32));
}

id sub_23C9777EC(id result, char a2)
{
  if ((a2 & 1) == 0) {
    return result;
  }
  return result;
}

void sub_23C9777F8(id a1, char a2)
{
  if ((a2 & 1) == 0) {
}
  }

uint64_t sub_23C977804()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

id sub_23C97783C()
{
  double v1 = 0.0;
  if (*(unsigned char *)(v0 + 16)) {
    double v1 = 1.0;
  }
  return objc_msgSend(*(id *)(v0 + 24), sel_setAlpha_, v1);
}

uint64_t sub_23C977860()
{
  return MEMORY[0x270FA0238](v0, 25, 7);
}

id sub_23C977898()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_setHidden_, (*(unsigned char *)(v0 + 24) & 1) == 0);
}

void sub_23C9778B4(void *a1, void *a2)
{
  sub_23C96FF74(a1, a2, *(void **)(v2 + 32));
}

uint64_t sub_23C9778C0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23C9778D0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23C9778E0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_23C977920(void *a1)
{
  sub_23C96EFFC(a1, *(void **)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_23C977928()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23C977938()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_23C977960(void *a1)
{
  sub_23C96F330(a1, *(void *)(v1 + 16));
}

uint64_t sub_23C977968()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23C977978()
{
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_23C9779B8(void *a1, uint64_t a2)
{
  return sub_23C96F5D8(a1, a2, *(void *)(v2 + 16), *(unsigned char *)(v2 + 24), *(void **)(v2 + 32), *(void **)(v2 + 40));
}

uint64_t sub_23C9779C8()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23C9779E0(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_23C9779F0()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

id sub_23C977A00(void *a1)
{
  return objc_msgSend(a1, sel_setForeground_, *(unsigned __int8 *)(v1 + 16));
}

uint64_t sub_23C977A10()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23C977A24()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 16);
  if (v1) {
    return v1();
  }
  return result;
}

unint64_t sub_23C977A54()
{
  unint64_t result = qword_26AF22760;
  if (!qword_26AF22760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF22760);
  }
  return result;
}

void sub_23C977AA8(uint64_t a1, uint64_t a2)
{
  sub_23C96EEB8(a1, a2, v2);
}

uint64_t sub_23C977AB0(unint64_t *a1, uint64_t *a2)
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

void sub_23C977B04(void *a1)
{
  sub_23C970248(a1, *(void **)(v1 + 16), "[%{public}s] Sending touch delivery policy failed with error: %{public}s");
}

uint64_t sub_23C977B28()
{
  return swift_release();
}

uint64_t sub_23C977B30()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_23C977B78()
{
  return sub_23C96B2B4(*(void **)(v0 + 16), *(void **)(v0 + 24), *(uint64_t (**)(void *))(v0 + 32));
}

void sub_23C977B84(unsigned __int8 a1)
{
  sub_23C96EBD8(a1, *(char **)(v1 + 16));
}

void sub_23C977B8C()
{
  sub_23C965C38(*(unsigned char *)(v0 + 24));
}

uint64_t sub_23C977BB8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_23C977C14()
{
  sub_23C96C2E8(v0, (uint64_t (*)(void))sub_23C97AC88, "[%{public}s] ClientSetting[backgroundTintColor] did change to: %{public}@", &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_backgroundTintColor, (SEL *)&selRef_activityHostViewControllerBackgroundTintColorDidChangeWithViewController_);
}

uint64_t sub_23C977C60(uint64_t a1, uint64_t a2)
{
  return sub_23C98202C(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

void sub_23C977C68()
{
  sub_23C96C2E8(v0, (uint64_t (*)(void))sub_23C97AC94, "[%{public}s] ClientSetting[textColor] did change to: %{public}@", &OBJC_IVAR____TtC18ActivityUIServices26ActivityHostViewController_textColor, (SEL *)&selRef_activityHostViewControllerTextColorDidChangeWithViewController_);
}

void sub_23C977CB4()
{
  sub_23C96C6E0(v0);
}

void sub_23C977CC0()
{
  sub_23C96CDC0(v0);
}

void sub_23C977CCC()
{
  sub_23C96D328(v0);
}

void sub_23C977CD8()
{
  sub_23C96D6F0(v0);
}

void sub_23C977CE4(uint64_t a1)
{
  sub_23C96DA8C(a1, v1);
}

void sub_23C977CEC()
{
  sub_23C96DE24(v0);
}

void sub_23C977CF8()
{
  sub_23C96E2A4(v0);
}

void sub_23C977D04()
{
  sub_23C96E788(v0);
}

uint64_t objectdestroy_264Tm()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t getEnumTagSinglePayload for ActivityHostViewController.SceneCaptureError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ActivityHostViewController.SceneCaptureError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x23C977EACLL);
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

unsigned char *sub_23C977ED4(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ActivityHostViewController.SceneCaptureError()
{
  return &type metadata for ActivityHostViewController.SceneCaptureError;
}

unint64_t sub_23C977EF4()
{
  unint64_t result = qword_268BBB2A8;
  if (!qword_268BBB2A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBB2A8);
  }
  return result;
}

unint64_t static ActivityUIServicesError.errorDomain.getter()
{
  return 0xD00000000000001CLL;
}

uint64_t ActivityUIServicesError.errorCode.getter()
{
  return 1001;
}

uint64_t _s18ActivityUIServices0aB5ErrorO13failureReasonSSSgvg_0()
{
  sub_23C991330();
  swift_bridgeObjectRelease();
  strcpy((char *)v1, "Missing data: ");
  sub_23C991000();
  return v1[0];
}

uint64_t sub_23C978128()
{
  return 1001;
}

uint64_t sub_23C978134(uint64_t a1)
{
  unint64_t v2 = sub_23C9781BC();
  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t sub_23C978170(uint64_t a1)
{
  unint64_t v2 = sub_23C9781BC();
  return MEMORY[0x270EF2668](a1, v2);
}

ValueMetadata *type metadata accessor for ActivityUIServicesError()
{
  return &type metadata for ActivityUIServicesError;
}

unint64_t sub_23C9781BC()
{
  unint64_t result = qword_268BBB310;
  if (!qword_268BBB310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBB310);
  }
  return result;
}

id ActivityBannerHostViewController.__allocating_init(activityDescriptor:systemMetricsRequest:payloadID:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = sub_23C990C60();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_allocWithZone(v4);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
  id v13 = objc_allocWithZone((Class)type metadata accessor for ActivitySceneDescriptor());
  id v14 = sub_23C98368C(1, (uint64_t)v12, a2, a3, a4);
  id v15 = ActivityHostViewController.init(activitySceneDescriptor:)(v14);

  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
  return v15;
}

id ActivityBannerHostViewController.init(activityDescriptor:systemMetricsRequest:payloadID:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_23C990C60();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  id v12 = objc_allocWithZone((Class)type metadata accessor for ActivitySceneDescriptor());
  id v13 = sub_23C98368C(1, (uint64_t)v11, a2, a3, a4);
  id v14 = ActivityHostViewController.init(activitySceneDescriptor:)(v13);

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
  return v14;
}

id sub_23C978634()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for ActivityBannerSceneSpecification());
  return objc_msgSend(v0, sel_init);
}

unint64_t sub_23C97866C()
{
  return 0xD000000000000010;
}

void ActivityBannerHostViewController.__allocating_init(activitySceneDescriptor:)()
{
}

void ActivityBannerHostViewController.init(activitySceneDescriptor:)()
{
}

id ActivityBannerHostViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityBannerHostViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ActivityBannerHostViewController()
{
  return self;
}

uint64_t method lookup function for ActivityBannerHostViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ActivityBannerHostViewController);
}

uint64_t dispatch thunk of ActivityBannerHostViewController.__allocating_init(activityDescriptor:systemMetricsRequest:payloadID:)()
{
  return (*(uint64_t (**)(void))(v0 + 1496))();
}

unint64_t ActivityState.init(rawValue:)(unint64_t a1)
{
  return sub_23C978854(a1);
}

unint64_t sub_23C978820@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_23C978854(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

unint64_t sub_23C978854(unint64_t result)
{
  if (result > 3) {
    return 0;
  }
  return result;
}

unint64_t sub_23C978868()
{
  unint64_t result = qword_268BBB318;
  if (!qword_268BBB318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBB318);
  }
  return result;
}

ValueMetadata *type metadata accessor for ActivityState()
{
  return &type metadata for ActivityState;
}

double sub_23C978914()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_top;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_23C9789B0(double a1)
{
  int v3 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_top);
  uint64_t result = swift_beginAccess();
  *int v3 = a1;
  return result;
}

uint64_t (*sub_23C978A04())()
{
  return j__swift_endAccess;
}

double sub_23C978AA8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_leading;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_23C978B44(double a1)
{
  int v3 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_leading);
  uint64_t result = swift_beginAccess();
  *int v3 = a1;
  return result;
}

uint64_t (*sub_23C978B98())()
{
  return j_j__swift_endAccess;
}

double sub_23C978C3C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_bottom;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_23C978CD8(double a1)
{
  int v3 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_bottom);
  uint64_t result = swift_beginAccess();
  *int v3 = a1;
  return result;
}

uint64_t (*sub_23C978D2C())()
{
  return j_j__swift_endAccess;
}

double sub_23C978DD0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_trailing;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_23C978E6C(double a1)
{
  int v3 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_trailing);
  uint64_t result = swift_beginAccess();
  *int v3 = a1;
  return result;
}

uint64_t (*sub_23C978EC0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_23C978F1C(char a1)
{
  return qword_23C9954B0[a1];
}

id ActivityEdgeInsets.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id ActivityEdgeInsets.init()()
{
  *(void *)&v0[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_top] = 0;
  *(void *)&v0[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_leading] = 0;
  *(void *)&v0[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_bottom] = 0;
  *(void *)&v0[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_trailing] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityEdgeInsets();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for ActivityEdgeInsets()
{
  return self;
}

char *ActivityEdgeInsets.__allocating_init(top:leading:bottom:trailing:)(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = (char *)objc_msgSend(objc_allocWithZone(v4), sel_init);
  uint64_t v10 = (double *)&v9[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_top];
  swift_beginAccess();
  double *v10 = a1;
  uint64_t v11 = (double *)&v9[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_leading];
  swift_beginAccess();
  *uint64_t v11 = a2;
  id v12 = (double *)&v9[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_bottom];
  swift_beginAccess();
  *id v12 = a3;
  id v13 = (double *)&v9[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_trailing];
  swift_beginAccess();
  *id v13 = a4;
  return v9;
}

char *ActivityEdgeInsets.init(top:leading:bottom:trailing:)(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = (char *)objc_msgSend(v4, sel_init);
  uint64_t v10 = (double *)&v9[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_top];
  swift_beginAccess();
  double *v10 = a1;
  uint64_t v11 = (double *)&v9[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_leading];
  swift_beginAccess();
  *uint64_t v11 = a2;
  id v12 = (double *)&v9[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_bottom];
  swift_beginAccess();
  *id v12 = a3;
  id v13 = (double *)&v9[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_trailing];
  swift_beginAccess();
  *id v13 = a4;
  return v9;
}

uint64_t sub_23C979350()
{
  id v1 = (double *)(v0 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_top);
  swift_beginAccess();
  double v2 = *v1;
  double v3 = *v1 * 53.0;
  char v4 = (double *)(v0 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_leading);
  swift_beginAccess();
  if (*v4 <= 1.0) {
    double v5 = *v4;
  }
  else {
    double v5 = 1.0;
  }
  unsigned int v6 = (double *)(v0 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_bottom);
  swift_beginAccess();
  if (*v6 <= 1.0) {
    double v7 = *v6;
  }
  else {
    double v7 = 1.0;
  }
  uint64_t v8 = (double *)(v0 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_trailing);
  uint64_t result = swift_beginAccess();
  double v10 = *v8;
  if (*v8 > 1.0) {
    double v10 = 1.0;
  }
  if (v2 <= 1.0) {
    double v11 = v3;
  }
  else {
    double v11 = 53.0;
  }
  double v12 = v11 * v5 * v7 * v10;
  if ((~*(void *)&v12 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v12 <= -9.22337204e18)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (v12 < 9.22337204e18) {
    return (uint64_t)v12;
  }
LABEL_18:
  __break(1u);
  return result;
}

BOOL sub_23C9794A0(uint64_t a1)
{
  sub_23C9523D4(a1, (uint64_t)v17);
  if (v18)
  {
    type metadata accessor for ActivityEdgeInsets();
    if (swift_dynamicCast())
    {
      double v2 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_top);
      swift_beginAccess();
      double v3 = *v2;
      char v4 = (double *)&v16[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_top];
      swift_beginAccess();
      if (v3 == *v4)
      {
        double v5 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_leading);
        swift_beginAccess();
        double v6 = *v5;
        double v7 = (double *)&v16[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_leading];
        swift_beginAccess();
        if (v6 == *v7)
        {
          uint64_t v8 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_bottom);
          swift_beginAccess();
          double v9 = *v8;
          double v10 = (double *)&v16[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_bottom];
          swift_beginAccess();
          if (v9 == *v10)
          {
            double v11 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_trailing);
            swift_beginAccess();
            double v12 = *v11;
            id v13 = (double *)&v16[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_trailing];
            swift_beginAccess();
            double v14 = *v13;

            return v12 == v14;
          }
        }
      }
    }
  }
  else
  {
    sub_23C952480((uint64_t)v17);
  }
  return 0;
}

uint64_t sub_23C97973C()
{
  return 0;
}

uint64_t sub_23C9798FC@<X0>(void *a1@<X8>)
{
  double v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_top);
  swift_beginAccess();
  uint64_t v4 = *v3;
  double v5 = (uint64_t *)(v1 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_leading);
  swift_beginAccess();
  uint64_t v6 = *v5;
  double v7 = (uint64_t *)(v1 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_bottom);
  swift_beginAccess();
  uint64_t v8 = *v7;
  double v9 = (uint64_t *)(v1 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_trailing);
  swift_beginAccess();
  uint64_t v10 = *v9;
  double v11 = (objc_class *)type metadata accessor for ActivityEdgeInsets();
  double v12 = (char *)objc_msgSend(objc_allocWithZone(v11), sel_init);
  id v13 = &v12[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_top];
  swift_beginAccess();
  *(void *)id v13 = v4;
  double v14 = &v12[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_leading];
  swift_beginAccess();
  *(void *)double v14 = v6;
  id v15 = &v12[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_bottom];
  swift_beginAccess();
  *(void *)id v15 = v8;
  uint64_t v16 = &v12[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_trailing];
  uint64_t result = swift_beginAccess();
  *(void *)uint64_t v16 = v10;
  a1[3] = v11;
  *a1 = v12;
  return result;
}

uint64_t static ActivityEdgeInsets.supportsBSXPCSecureCoding.getter()
{
  return 1;
}

id ActivityEdgeInsets.__allocating_init(bsxpcCoder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = sub_23C979EF4(a1);
  swift_unknownObjectRelease();
  return v4;
}

id ActivityEdgeInsets.init(bsxpcCoder:)(void *a1)
{
  id v1 = sub_23C979EF4(a1);
  swift_unknownObjectRelease();
  return v1;
}

uint64_t static ActivityEdgeInsets.supportsSecureCoding.getter()
{
  return 1;
}

void sub_23C979C20(void *a1)
{
  id v3 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_top);
  swift_beginAccess();
  double v4 = *v3;
  double v5 = (void *)sub_23C990FC0();
  objc_msgSend(a1, sel_encodeDouble_forKey_, v5, v4);

  uint64_t v6 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_leading);
  swift_beginAccess();
  double v7 = *v6;
  uint64_t v8 = (void *)sub_23C990FC0();
  objc_msgSend(a1, sel_encodeDouble_forKey_, v8, v7);

  double v9 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_bottom);
  swift_beginAccess();
  double v10 = *v9;
  double v11 = (void *)sub_23C990FC0();
  objc_msgSend(a1, sel_encodeDouble_forKey_, v11, v10);

  double v12 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_trailing);
  swift_beginAccess();
  double v13 = *v12;
  double v14 = (void *)sub_23C990FC0();
  objc_msgSend(a1, sel_encodeDouble_forKey_, v14, v13);
}

id ActivityEdgeInsets.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = sub_23C979EF4(a1);

  return v4;
}

id ActivityEdgeInsets.init(coder:)(void *a1)
{
  id v2 = sub_23C979EF4(a1);

  return v2;
}

id ActivityEdgeInsets.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityEdgeInsets();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_23C979EF4(void *a1)
{
  id v3 = &v1[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_top];
  *(void *)&v1[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_top] = 0;
  id v4 = &v1[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_leading];
  *(void *)&v1[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_leading] = 0;
  double v5 = &v1[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_bottom];
  *(void *)&v1[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_bottom] = 0;
  uint64_t v6 = &v1[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_trailing];
  *(void *)&v1[OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_trailing] = 0;
  double v7 = v1;
  uint64_t v8 = (void *)sub_23C990FC0();
  objc_msgSend(a1, sel_decodeDoubleForKey_, v8);
  uint64_t v10 = v9;

  swift_beginAccess();
  *(void *)id v3 = v10;
  double v11 = (void *)sub_23C990FC0();
  objc_msgSend(a1, sel_decodeDoubleForKey_, v11);
  uint64_t v13 = v12;

  swift_beginAccess();
  *(void *)id v4 = v13;
  double v14 = (void *)sub_23C990FC0();
  objc_msgSend(a1, sel_decodeDoubleForKey_, v14);
  uint64_t v16 = v15;

  swift_beginAccess();
  *(void *)double v5 = v16;
  uint64_t v17 = (void *)sub_23C990FC0();
  objc_msgSend(a1, sel_decodeDoubleForKey_, v17);
  uint64_t v19 = v18;

  swift_beginAccess();
  *(void *)uint64_t v6 = v19;

  v21.receiver = v7;
  v21.super_class = (Class)type metadata accessor for ActivityEdgeInsets();
  return objc_msgSendSuper2(&v21, sel_init);
}

double sub_23C97A0C8@<D0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_getTm_0(a1, &OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_top, a2);
}

uint64_t sub_23C97A0D4(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_top);
}

double sub_23C97A0E0@<D0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_getTm_0(a1, &OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_leading, a2);
}

uint64_t sub_23C97A0EC(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_leading);
}

double sub_23C97A0F8@<D0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_getTm_0(a1, &OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_bottom, a2);
}

uint64_t sub_23C97A104(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_bottom);
}

double sub_23C97A110@<D0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_getTm_0(a1, &OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_trailing, a2);
}

double keypath_getTm_0@<D0>(void *a1@<X0>, void *a2@<X3>, void *a3@<X8>)
{
  id v4 = (double *)(*a1 + *a2);
  swift_beginAccess();
  double result = *v4;
  *a3 = *(void *)v4;
  return result;
}

uint64_t sub_23C97A16C(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_trailing);
}

uint64_t keypath_setTm(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = *a1;
  uint64_t v6 = (void *)(*a2 + *a5);
  uint64_t result = swift_beginAccess();
  *uint64_t v6 = v5;
  return result;
}

uint64_t method lookup function for ActivityEdgeInsets(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ActivityEdgeInsets);
}

uint64_t dispatch thunk of ActivityEdgeInsets.top.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of ActivityEdgeInsets.top.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of ActivityEdgeInsets.top.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of ActivityEdgeInsets.leading.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of ActivityEdgeInsets.leading.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of ActivityEdgeInsets.leading.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of ActivityEdgeInsets.bottom.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of ActivityEdgeInsets.bottom.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of ActivityEdgeInsets.bottom.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of ActivityEdgeInsets.trailing.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of ActivityEdgeInsets.trailing.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of ActivityEdgeInsets.trailing.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of ActivityEdgeInsets.copy(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of ActivityEdgeInsets.encode(withBSXPCCoder:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of ActivityEdgeInsets.__allocating_init(bsxpcCoder:)()
{
  return (*(uint64_t (**)(void))(v0 + 224))();
}

uint64_t dispatch thunk of ActivityEdgeInsets.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of ActivityEdgeInsets.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t sub_23C97A518(char a1, char a2)
{
  if (*(void *)&aScene_5[8 * a1] == *(void *)&aScene_5[8 * a2] && qword_23C995620[a1] == qword_23C995620[a2]) {
    char v3 = 1;
  }
  else {
    char v3 = sub_23C9914F0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_23C97A5A0()
{
  return sub_23C991620();
}

uint64_t sub_23C97A60C()
{
  sub_23C990FF0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C97A660()
{
  return sub_23C991620();
}

uint64_t sub_23C97A6C8(uint64_t a1)
{
  return sub_23C97A810(a1, qword_268BBA598);
}

uint64_t static Logger.scene.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23C97A8AC(&qword_268BBA5B8, (uint64_t)qword_268BBA598, a1);
}

uint64_t sub_23C97A708(uint64_t a1)
{
  return sub_23C97A810(a1, qword_268BBA580);
}

uint64_t static Logger.processResource.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23C97A8AC(&qword_268BBA4C0, (uint64_t)qword_268BBA580, a1);
}

uint64_t sub_23C97A758(uint64_t a1)
{
  return sub_23C97A810(a1, qword_26AF22728);
}

uint64_t static Logger.viewController.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23C97A8AC(&qword_26AF22748, (uint64_t)qword_26AF22728, a1);
}

uint64_t sub_23C97A7A8(uint64_t a1)
{
  return sub_23C97A810(a1, qword_26AF22708);
}

uint64_t static Logger.backOffTimer.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23C97A8AC(&qword_26AF22720, (uint64_t)qword_26AF22708, a1);
}

uint64_t sub_23C97A7F4(uint64_t a1)
{
  return sub_23C97A810(a1, qword_268BBB3A0);
}

uint64_t sub_23C97A810(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_23C990E40();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_23C990E30();
}

uint64_t static Logger.alert.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23C97A8AC(&qword_268BBAA58, (uint64_t)qword_268BBB3A0, a1);
}

uint64_t sub_23C97A8AC@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_23C990E40();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  double v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

unint64_t static ActivityUIServicesCategory.subsystem.getter()
{
  return 0xD00000000000001CLL;
}

ActivityUIServices::ActivityUIServicesCategory_optional __swiftcall ActivityUIServicesCategory.init(rawValue:)(Swift::String rawValue)
{
  objc_super v2 = v1;
  unint64_t v3 = sub_23C991450();
  result.value = swift_bridgeObjectRelease();
  char v5 = 5;
  if (v3 < 5) {
    char v5 = v3;
  }
  *objc_super v2 = v5;
  return result;
}

uint64_t ActivityUIServicesCategory.rawValue.getter()
{
  return *(void *)&aScene_5[8 * *v0];
}

uint64_t sub_23C97A9E0(char *a1, char *a2)
{
  return sub_23C97A518(*a1, *a2);
}

unint64_t sub_23C97A9F0()
{
  unint64_t result = qword_268BBB3B8;
  if (!qword_268BBB3B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBB3B8);
  }
  return result;
}

uint64_t sub_23C97AA44()
{
  return sub_23C97A5A0();
}

uint64_t sub_23C97AA4C()
{
  return sub_23C97A60C();
}

uint64_t sub_23C97AA54()
{
  return sub_23C97A660();
}

ActivityUIServices::ActivityUIServicesCategory_optional sub_23C97AA5C(Swift::String *a1)
{
  return ActivityUIServicesCategory.init(rawValue:)(*a1);
}

uint64_t sub_23C97AA68@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ActivityUIServicesCategory.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for ActivityUIServicesCategory(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ActivityUIServicesCategory(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x23C97ABECLL);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ActivityUIServicesCategory()
{
  return &type metadata for ActivityUIServicesCategory;
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

uint64_t sub_23C97AC88(void *a1)
{
  return sub_23C97ACA0(a1, &qword_268BBAF28);
}

uint64_t sub_23C97AC94(void *a1)
{
  return sub_23C97ACA0(a1, &qword_268BBAF40);
}

uint64_t sub_23C97ACA0(void *a1, void *a2)
{
  swift_beginAccess();
  if (objc_msgSend(a1, sel_objectForSetting_, *a2))
  {
    sub_23C991270();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
  }
  sub_23C952E40((uint64_t)v8, (uint64_t)v9);
  if (!v10)
  {
    sub_23C952480((uint64_t)v9);
    return 0;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  sub_23C959038(0, &qword_26AF227E8);
  sub_23C959038(0, (unint64_t *)&unk_26AF227A0);
  unsigned int v4 = (void *)sub_23C991150();
  sub_23C95CAD4(v6, v7);
  self;
  uint64_t result = swift_dynamicCastObjCClass();
  if (!result)
  {

    return 0;
  }
  return result;
}

uint64_t sub_23C97AE18(void *a1)
{
  swift_beginAccess();
  if (objc_msgSend(a1, sel_objectForSetting_, qword_268BBB000))
  {
    sub_23C991270();
    swift_unknownObjectRelease();
    sub_23C95CAC4(&v3, v4);
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF22BA0);
  if (swift_dynamicCast()) {
    return v3;
  }
  else {
    return 2;
  }
}

uint64_t sub_23C97AEE0()
{
  uint64_t result = sub_23C990FC0();
  qword_26AF22B10 = result;
  return result;
}

id static UISceneSessionRole.activityListItem.getter()
{
  return sub_23C97B0AC(qword_26AF22B20, (void **)&qword_26AF22B10);
}

uint64_t sub_23C97AF3C()
{
  uint64_t result = sub_23C990FC0();
  qword_268BBA618 = result;
  return result;
}

id static UISceneSessionRole.activityBanner.getter()
{
  return sub_23C97B0AC(qword_268BBA608, (void **)&qword_268BBA618);
}

uint64_t sub_23C97AF98()
{
  uint64_t result = sub_23C990FC0();
  qword_26AF22B40 = result;
  return result;
}

id static UISceneSessionRole.activitySystemAperture.getter()
{
  return sub_23C97B0AC(&qword_26AF22B50, (void **)&qword_26AF22B40);
}

uint64_t sub_23C97AFF4()
{
  uint64_t result = sub_23C990FC0();
  qword_26AF229D8 = result;
  return result;
}

id static UISceneSessionRole.activityAmbient.getter()
{
  return sub_23C97B0AC(&qword_26AF229E8, (void **)&qword_26AF229D8);
}

uint64_t sub_23C97B050()
{
  uint64_t result = sub_23C990FC0();
  qword_26AF229F0 = result;
  return result;
}

id static UISceneSessionRole.activityAmbientCompact.getter()
{
  return sub_23C97B0AC(&qword_26AF22A00, (void **)&qword_26AF229F0);
}

id sub_23C97B0AC(void *a1, void **a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  long long v3 = *a2;
  return v3;
}

uint64_t sub_23C97B0F8()
{
  id v1 = objc_msgSend(v0, sel__FBSScene);
  id v2 = objc_msgSend(v1, sel_settings);

  if (v2)
  {
    type metadata accessor for ActivitySceneSettings();
    uint64_t result = swift_dynamicCastClass();
    if (result) {
      return result;
    }
    id v4 = v2;
    sub_23C991330();
    swift_bridgeObjectRelease();
    v16[0] = 0xD000000000000020;
    v16[1] = 0x800000023C999180;
    swift_getObjectType();
    sub_23C9916A0();
    sub_23C991000();
    swift_bridgeObjectRelease();
    sub_23C991000();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268BBB420);
    sub_23C9916A0();
    uint64_t v0 = v16;
    sub_23C991000();
    swift_bridgeObjectRelease();
    sub_23C9913D0();
    __break(1u);
  }
  if (qword_268BBA5B8 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_23C990E40();
  __swift_project_value_buffer(v5, (uint64_t)qword_268BBA598);
  uint64_t v6 = v0;
  unint64_t v7 = sub_23C990E20();
  os_log_type_t v8 = sub_23C991130();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    v16[0] = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    id v11 = objc_msgSend(v6, sel__FBSScene);
    id v12 = objc_msgSend(v11, sel_identifier);

    uint64_t v13 = sub_23C990FD0();
    unint64_t v15 = v14;

    v16[2] = sub_23C9733B0(v13, v15, v16);
    sub_23C991240();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C948000, v7, v8, "[%s] Unexpectedly encountered nil while accessing scene settings.", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEADB0](v10, -1, -1);
    MEMORY[0x23ECEADB0](v9, -1, -1);
  }
  else
  {
  }
  return 0;
}

char *sub_23C97B424(void *a1, void *a2)
{
  v2[OBJC_IVAR____TtC18ActivityUIServices13ActivityScene__inClientSettingsUpdate] = 0;
  uint64_t v5 = OBJC_IVAR____TtC18ActivityUIServices13ActivityScene__settingsDiffer;
  id v6 = objc_allocWithZone((Class)type metadata accessor for SettingsDiffer());
  unint64_t v7 = v2;
  *(void *)&v2[v5] = objc_msgSend(v6, sel_init);
  v7[OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_isArchiveContentReady] = 0;
  *(void *)&v7[OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_contentPayloadID] = 0;
  *(void *)&v7[OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_backgroundTintColor] = 0;
  *(void *)&v7[OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_textColor] = 0;
  *(void *)&v7[OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_resolvedMetrics] = 0;
  *(void *)&v7[OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_activityHostTouchRestrictedRects] = MEMORY[0x263F8EE78];
  v7[OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_idleTimerDisabled] = 0;
  v7[OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_archivedActivityFamily] = 2;
  v7[OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_baseContentTouchedDown] = 2;

  v16.receiver = v7;
  v16.super_class = (Class)type metadata accessor for ActivityScene();
  os_log_type_t v8 = (char *)objc_msgSendSuper2(&v16, sel_initWithSession_connectionOptions_, a1, a2);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF22B60);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_23C994F50;
  uint64_t v10 = *(void **)&v8[OBJC_IVAR____TtC18ActivityUIServices13ActivityScene__settingsDiffer];
  *(void *)(v9 + 32) = v10;
  sub_23C991090();
  id v11 = v8;
  id v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF22B58);
  uint64_t v13 = (void *)sub_23C991060();
  swift_bridgeObjectRelease();
  sub_23C959038(0, (unint64_t *)&qword_26AF22B90);
  unint64_t v14 = (void *)sub_23C991220();
  objc_msgSend(v11, sel__registerSettingsDiffActionArray_forKey_, v13, v14);

  return v11;
}

void sub_23C97B668(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *a1;
  BSDispatchQueueAssertMain();
  uint64_t v6 = sub_23C97B0F8();
  if (v6)
  {
    id v9 = (id)v6;
    sub_23C984F8C(*(void *)(*MEMORY[0x263F8EA20] + v5 + 8), a2, a3);
  }
  else
  {
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    os_log_type_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56);
    v8(a3, 1, 1, AssociatedTypeWitness);
  }
}

uint64_t sub_23C97B798(uint64_t *a1, uint64_t a2)
{
  long long v3 = v2;
  uint64_t v6 = *a1;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_268BBA4D0);
  uint64_t v42 = *(void *)(*MEMORY[0x263F8EA20] + v6 + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = sub_23C991230();
  uint64_t v41 = v7;
  unint64_t v38 = sub_23C97EB44();
  uint64_t v10 = sub_23C990E70();
  uint64_t v40 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  id v12 = (char *)v36 - v11;
  uint64_t v13 = sub_23C990EC0();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v15 = swift_getWitnessTable();
  uint64_t v44 = v10;
  uint64_t v45 = v13;
  v36[4] = WitnessTable;
  uint64_t v46 = WitnessTable;
  uint64_t v47 = v15;
  _OWORD v36[2] = v15;
  uint64_t v16 = sub_23C990E80();
  uint64_t v17 = swift_getWitnessTable();
  v36[3] = v16;
  v36[1] = v17;
  uint64_t v18 = sub_23C990E60();
  v36[5] = swift_getWitnessTable();
  v36[6] = v18;
  uint64_t v43 = AssociatedTypeWitness;
  uint64_t v39 = sub_23C990E50();
  uint64_t v37 = *(void *)(v39 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v39);
  objc_super v21 = (char *)v36 - v20;
  v36[0] = v9;
  MEMORY[0x270FA5388](v19);
  BSDispatchQueueAssertMain();
  uint64_t result = sub_23C97B0F8();
  if (result)
  {
    uint64_t v23 = (void *)result;
    sub_23C984F88(a1, a2);

    sub_23C990ED0();
    id v24 = *(id *)&v3[OBJC_IVAR____TtC18ActivityUIServices13ActivityScene__settingsDiffer];
    uint64_t v25 = sub_23C981C40(a1, a2);

    uint64_t v44 = v25;
    id v26 = (void *)swift_allocObject();
    v26[2] = a2;
    v26[3] = v3;
    v26[4] = a1;
    uint64_t v27 = (void *)swift_allocObject();
    uint64_t v28 = v3;
    uint64_t v29 = v42;
    _OWORD v27[2] = v42;
    v27[3] = a2;
    v27[4] = sub_23C97EBE0;
    v27[5] = v26;
    id v30 = v28;
    swift_retain();
    sub_23C990F10();
    swift_release();
    swift_release();
    uint64_t v31 = sub_23C990F20();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v12, v10);
    uint64_t v44 = v31;
    uint64_t v32 = sub_23C990EE0();
    swift_release();
    uint64_t v44 = v32;
    uint64_t v33 = swift_allocObject();
    *(void *)(v33 + 16) = v29;
    *(void *)(v33 + 24) = a2;
    sub_23C990F00();
    swift_release();
    swift_release();
    uint64_t v34 = v39;
    swift_getWitnessTable();
    uint64_t v35 = sub_23C990EF0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v21, v34);
    return v35;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_23C97BCA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_23C97B0F8();
  if (v5)
  {
    id v6 = (id)v5;
    sub_23C984F88(a2, a3);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_23C97BD20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  swift_getAssociatedTypeWitness();
  uint64_t v4 = sub_23C991230();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a2, a1, v4);
}

uint64_t sub_23C97BDB4(void (*a1)(void *, _UNKNOWN **))
{
  id v2 = v1;
  uint64_t result = BSDispatchQueueAssertMain();
  if (*((unsigned char *)v1 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene__inClientSettingsUpdate))
  {
    __break(1u);
    goto LABEL_5;
  }
  a1(v1, &protocol witness table for ActivityScene);
  id v5 = objc_msgSend(v1, sel__FBSScene);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = 0;
  *(void *)(v6 + 24) = v2;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_23C97EC64;
  *(void *)(v7 + 24) = v6;
  v11[4] = sub_23C97ECA4;
  v11[5] = v7;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 1107296256;
  v11[2] = sub_23C97C11C;
  v11[3] = &block_descriptor_2;
  os_log_type_t v8 = _Block_copy(v11);
  id v9 = v2;
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_updateClientSettingsWithTransitionBlock_, v8);

  _Block_release(v8);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
LABEL_5:
  }
    __break(1u);
  return result;
}

uint64_t sub_23C97BF5C(uint64_t (*a1)(unsigned char *, _UNKNOWN **))
{
  uint64_t result = BSDispatchQueueAssertMain();
  if (v1[OBJC_IVAR____TtC18ActivityUIServices13ActivityScene__inClientSettingsUpdate])
  {
    __break(1u);
    goto LABEL_5;
  }
  uint64_t v4 = (void *)a1(v1, &protocol witness table for ActivityScene);
  id v5 = objc_msgSend(v1, sel__FBSScene);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v4;
  *(void *)(v6 + 24) = v1;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_23C980028;
  *(void *)(v7 + 24) = v6;
  void v12[4] = sub_23C980080;
  v12[5] = v7;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 1107296256;
  v12[2] = sub_23C97C11C;
  uint64_t v12[3] = &block_descriptor_23;
  os_log_type_t v8 = _Block_copy(v12);
  id v9 = v4;
  uint64_t v10 = v1;
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_updateClientSettingsWithTransitionBlock_, v8);

  _Block_release(v8);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
LABEL_5:
  }
    __break(1u);
  return result;
}

id sub_23C97C11C(uint64_t a1, void *a2)
{
  id v2 = *(uint64_t (**)(void))(a1 + 32);
  id v3 = a2;
  uint64_t v4 = (void *)v2();

  return v4;
}

uint64_t sub_23C97C170()
{
  BSDispatchQueueAssertMain();
  uint64_t v7 = v0;
  uint64_t result = BSDispatchQueueAssertMain();
  if ((*((unsigned char *)v0 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene__inClientSettingsUpdate) & 1) == 0)
  {
    id v2 = objc_msgSend(v0, sel__FBSScene);
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = sub_23C97FB80;
    *(void *)(v3 + 24) = &v6;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = sub_23C980084;
    *(void *)(v4 + 24) = v3;
    aBlock[4] = sub_23C978070;
    aBlock[5] = v4;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23C96F58C;
    aBlock[3] = &block_descriptor_146;
    id v5 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v2, sel_updateClientSettingsWithBlock_, v5);

    _Block_release(v5);
    LOBYTE(v2) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    uint64_t result = swift_release();
    if (v2) {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_23C97C30C(void *a1, uint64_t a2)
{
  uint64_t v3 = (unsigned char *)(a2 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_isArchiveContentReady);
  swift_beginAccess();
  LOBYTE(v3) = *v3;
  id v4 = objc_msgSend(a1, sel_otherSettings);
  LOBYTE(v7) = (_BYTE)v3;
  uint64_t v5 = sub_23C991510();
  swift_beginAccess();
  objc_msgSend(v4, sel_setObject_forSetting_, v5, qword_268BBAF58, v7);

  return swift_unknownObjectRelease();
}

uint64_t sub_23C97C3D4()
{
  id v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_isArchiveContentReady);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_23C97C41C(char a1)
{
  return sub_23C97D890(a1, &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_isArchiveContentReady, (uint64_t (*)(uint64_t))sub_23C97C170);
}

uint64_t (*sub_23C97C43C(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_23C97C49C;
}

uint64_t sub_23C97C49C(uint64_t a1, char a2)
{
  return sub_23C97E260(a1, a2, (uint64_t (*)(uint64_t))sub_23C97C170);
}

uint64_t sub_23C97C4B4()
{
  BSDispatchQueueAssertMain();
  uint64_t v7 = v0;
  uint64_t result = BSDispatchQueueAssertMain();
  if ((*((unsigned char *)v0 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene__inClientSettingsUpdate) & 1) == 0)
  {
    id v2 = objc_msgSend(v0, sel__FBSScene);
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = sub_23C97FB34;
    *(void *)(v3 + 24) = &v6;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = sub_23C980084;
    *(void *)(v4 + 24) = v3;
    aBlock[4] = sub_23C978070;
    aBlock[5] = v4;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23C96F58C;
    aBlock[3] = &block_descriptor_135;
    uint64_t v5 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v2, sel_updateClientSettingsWithBlock_, v5);

    _Block_release(v5);
    LOBYTE(v2) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    uint64_t result = swift_release();
    if (v2) {
      __break(1u);
    }
  }
  return result;
}

void *sub_23C97C650()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_contentPayloadID);
  swift_beginAccess();
  id v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_23C97C6A0(void *a1)
{
}

uint64_t (*sub_23C97C6C0(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_23C97C720;
}

uint64_t sub_23C97C720(uint64_t a1, char a2)
{
  return sub_23C97E260(a1, a2, (uint64_t (*)(uint64_t))sub_23C97C4B4);
}

uint64_t sub_23C97C738()
{
  BSDispatchQueueAssertMain();
  uint64_t v7 = v0;
  uint64_t result = BSDispatchQueueAssertMain();
  if ((*((unsigned char *)v0 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene__inClientSettingsUpdate) & 1) == 0)
  {
    id v2 = objc_msgSend(v0, sel__FBSScene);
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = sub_23C97FADC;
    *(void *)(v3 + 24) = &v6;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = sub_23C980084;
    *(void *)(v4 + 24) = v3;
    aBlock[4] = sub_23C978070;
    aBlock[5] = v4;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23C96F58C;
    aBlock[3] = &block_descriptor_124;
    uint64_t v5 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v2, sel_updateClientSettingsWithBlock_, v5);

    _Block_release(v5);
    LOBYTE(v2) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    uint64_t result = swift_release();
    if (v2) {
      __break(1u);
    }
  }
  return result;
}

void *sub_23C97C8D4()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_backgroundTintColor);
  swift_beginAccess();
  id v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_23C97C924(void *a1)
{
}

uint64_t (*sub_23C97C944(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_23C97C9A4;
}

uint64_t sub_23C97C9A4(uint64_t a1, char a2)
{
  return sub_23C97E260(a1, a2, (uint64_t (*)(uint64_t))sub_23C97C738);
}

uint64_t sub_23C97C9BC()
{
  BSDispatchQueueAssertMain();
  uint64_t v7 = v0;
  uint64_t result = BSDispatchQueueAssertMain();
  if ((*((unsigned char *)v0 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene__inClientSettingsUpdate) & 1) == 0)
  {
    id v2 = objc_msgSend(v0, sel__FBSScene);
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = sub_23C97FA84;
    *(void *)(v3 + 24) = &v6;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = sub_23C980084;
    *(void *)(v4 + 24) = v3;
    aBlock[4] = sub_23C978070;
    aBlock[5] = v4;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23C96F58C;
    aBlock[3] = &block_descriptor_113;
    uint64_t v5 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v2, sel_updateClientSettingsWithBlock_, v5);

    _Block_release(v5);
    LOBYTE(v2) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    uint64_t result = swift_release();
    if (v2) {
      __break(1u);
    }
  }
  return result;
}

void sub_23C97CB58(uint64_t a1, uint64_t a2, void *a3, void (*a4)(void *))
{
  uint64_t v5 = (void **)(a2 + *a3);
  swift_beginAccess();
  uint64_t v6 = *v5;
  id v7 = v6;
  a4(v6);
}

void *sub_23C97CBC8()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_textColor);
  swift_beginAccess();
  id v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_23C97CC18(void *a1)
{
}

uint64_t (*sub_23C97CC38(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_23C97CC98;
}

uint64_t sub_23C97CC98(uint64_t a1, char a2)
{
  return sub_23C97E260(a1, a2, (uint64_t (*)(uint64_t))sub_23C97C9BC);
}

void sub_23C97CCB0(void **a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void (*a6)(void))
{
  id v7 = *a1;
  os_log_type_t v8 = (void **)(*a2 + *a5);
  swift_beginAccess();
  id v9 = *v8;
  void *v8 = v7;
  id v10 = v7;

  a6();
}

uint64_t sub_23C97CD30()
{
  BSDispatchQueueAssertMain();
  id v7 = v0;
  uint64_t result = BSDispatchQueueAssertMain();
  if ((*((unsigned char *)v0 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene__inClientSettingsUpdate) & 1) == 0)
  {
    id v2 = objc_msgSend(v0, sel__FBSScene);
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = sub_23C97FA38;
    *(void *)(v3 + 24) = &v6;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = sub_23C980084;
    *(void *)(v4 + 24) = v3;
    aBlock[4] = sub_23C978070;
    aBlock[5] = v4;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23C96F58C;
    aBlock[3] = &block_descriptor_102;
    uint64_t v5 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v2, sel_updateClientSettingsWithBlock_, v5);

    _Block_release(v5);
    LOBYTE(v2) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    uint64_t result = swift_release();
    if (v2) {
      __break(1u);
    }
  }
  return result;
}

void sub_23C97CECC(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6 = (id *)(a2 + *a3);
  swift_beginAccess();
  id v7 = *v6;
  id v8 = objc_msgSend(a1, sel_otherSettings);
  swift_beginAccess();
  objc_msgSend(v8, sel_setObject_forSetting_, v7, *a4);
}

void *sub_23C97CF80()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_resolvedMetrics);
  swift_beginAccess();
  id v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_23C97CFD0(void *a1)
{
}

void sub_23C97CFF0(void *a1, void *a2, void (*a3)(void))
{
  uint64_t v6 = (void **)(v3 + *a2);
  swift_beginAccess();
  id v7 = *v6;
  *uint64_t v6 = a1;
  id v8 = a1;

  a3();
}

uint64_t (*sub_23C97D068(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_23C97D0C8;
}

uint64_t sub_23C97D0C8(uint64_t a1, char a2)
{
  return sub_23C97E260(a1, a2, (uint64_t (*)(uint64_t))sub_23C97CD30);
}

uint64_t sub_23C97D0E0(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a2 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_activityHostTouchRestrictedRects);
  swift_beginAccess();
  *uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return sub_23C97D150();
}

uint64_t sub_23C97D150()
{
  BSDispatchQueueAssertMain();
  id v7 = v0;
  uint64_t result = BSDispatchQueueAssertMain();
  if ((*((unsigned char *)v0 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene__inClientSettingsUpdate) & 1) == 0)
  {
    id v2 = objc_msgSend(v0, sel__FBSScene);
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = sub_23C97FA10;
    *(void *)(v3 + 24) = &v6;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = sub_23C980084;
    *(void *)(v4 + 24) = v3;
    aBlock[4] = sub_23C978070;
    aBlock[5] = v4;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23C96F58C;
    aBlock[3] = &block_descriptor_91;
    uint64_t v5 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v2, sel_updateClientSettingsWithBlock_, v5);

    _Block_release(v5);
    LOBYTE(v2) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    uint64_t result = swift_release();
    if (v2) {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_23C97D2EC(void *a1, uint64_t a2)
{
  uint64_t v3 = (uint64_t *)(a2 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_activityHostTouchRestrictedRects);
  swift_beginAccess();
  uint64_t v4 = *v3;
  swift_bridgeObjectRetain_n();
  id v5 = objc_msgSend(a1, sel_otherSettings);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF22B70);
  uint64_t v6 = sub_23C991510();
  swift_beginAccess();
  objc_msgSend(v5, sel_setObject_forSetting_, v6, qword_268BBAFA0, v4);
  swift_bridgeObjectRelease_n();

  return swift_unknownObjectRelease();
}

uint64_t sub_23C97D3DC()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23C97D428(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_activityHostTouchRestrictedRects);
  swift_beginAccess();
  *uint64_t v3 = a1;
  swift_bridgeObjectRelease();
  return sub_23C97D150();
}

uint64_t (*sub_23C97D488(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_23C97D4E8;
}

uint64_t sub_23C97D4E8(uint64_t a1, char a2)
{
  return sub_23C97E260(a1, a2, (uint64_t (*)(uint64_t))sub_23C97D150);
}

uint64_t sub_23C97D500()
{
  BSDispatchQueueAssertMain();
  id v7 = v0;
  uint64_t result = BSDispatchQueueAssertMain();
  if ((*((unsigned char *)v0 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene__inClientSettingsUpdate) & 1) == 0)
  {
    id v2 = objc_msgSend(v0, sel__FBSScene);
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = sub_23C97F9E8;
    *(void *)(v3 + 24) = &v6;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = sub_23C980084;
    *(void *)(v4 + 24) = v3;
    aBlock[4] = sub_23C978070;
    aBlock[5] = v4;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23C96F58C;
    aBlock[3] = &block_descriptor_80;
    id v5 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v2, sel_updateClientSettingsWithBlock_, v5);

    _Block_release(v5);
    LOBYTE(v2) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    uint64_t result = swift_release();
    if (v2) {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_23C97D69C(void *a1, uint64_t a2)
{
  id v4 = objc_msgSend(a1, sel_otherSettings);
  swift_beginAccess();
  if (objc_msgSend(v4, sel_objectForSetting_, qword_268BBAFB8))
  {
    sub_23C991270();
    swift_unknownObjectRelease();
    sub_23C95CAC4(&v10, v11);
  }
  else
  {
    memset(v11, 0, sizeof(v11));
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF22BA0);
  if (swift_dynamicCast())
  {
    int v5 = v10;
  }
  else
  {
    int v5 = 2;
    LOBYTE(v10) = 2;
  }

  uint64_t v6 = (unsigned __int8 *)(a2 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_idleTimerDisabled);
  uint64_t result = swift_beginAccess();
  int v8 = *v6;
  if (v5 == 2 || v8 != (v5 & 1))
  {
    id v9 = objc_msgSend(a1, sel_otherSettings, (void)v10);
    LOBYTE(v10) = v8;
    objc_msgSend(v9, sel_setObject_forSetting_, sub_23C991510(), qword_268BBAFB8);

    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_23C97D828()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_idleTimerDisabled);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_23C97D870(char a1)
{
  return sub_23C97D890(a1, &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_idleTimerDisabled, (uint64_t (*)(uint64_t))sub_23C97D500);
}

uint64_t sub_23C97D890(char a1, void *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v6 = (unsigned char *)(v3 + *a2);
  uint64_t v7 = swift_beginAccess();
  *uint64_t v6 = a1;
  return a3(v7);
}

uint64_t (*sub_23C97D8EC(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_23C97D94C;
}

uint64_t sub_23C97D94C(uint64_t a1, char a2)
{
  return sub_23C97E260(a1, a2, (uint64_t (*)(uint64_t))sub_23C97D500);
}

uint64_t sub_23C97D964()
{
  BSDispatchQueueAssertMain();
  uint64_t v7 = v0;
  uint64_t result = BSDispatchQueueAssertMain();
  if ((*((unsigned char *)v0 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene__inClientSettingsUpdate) & 1) == 0)
  {
    id v2 = objc_msgSend(v0, sel__FBSScene);
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = sub_23C97F9C0;
    *(void *)(v3 + 24) = &v6;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = sub_23C980084;
    *(void *)(v4 + 24) = v3;
    aBlock[4] = sub_23C978070;
    aBlock[5] = v4;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23C96F58C;
    aBlock[3] = &block_descriptor_69;
    int v5 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v2, sel_updateClientSettingsWithBlock_, v5);

    _Block_release(v5);
    LOBYTE(v2) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    uint64_t result = swift_release();
    if (v2) {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_23C97DB00(void *a1, uint64_t a2)
{
  id v4 = objc_msgSend(a1, sel_otherSettings);
  swift_beginAccess();
  if (objc_msgSend(v4, sel_objectForSetting_, qword_268BBAFD0))
  {
    sub_23C991270();
    swift_unknownObjectRelease();
    sub_23C95CAC4(&v14, v15);
  }
  else
  {
    memset(v15, 0, sizeof(v15));
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF22BA0);
  int v5 = swift_dynamicCast();
  int v6 = v5;
  if (v5)
  {
    unint64_t v7 = v14;
  }
  else
  {
    unint64_t v7 = 0;
    *(void *)&long long v14 = 0;
  }
  BYTE8(v14) = v5 ^ 1;

  int v8 = (unsigned __int8 *)(a2 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_archivedActivityFamily);
  uint64_t result = swift_beginAccess();
  int v10 = *v8;
  if (v7 < 2) {
    int v11 = v6;
  }
  else {
    int v11 = 0;
  }
  if (v11 == 1)
  {
    if (v10 != 2 && ((v10 & 1) == 0) != (v7 == 1)) {
      return result;
    }
  }
  else if (v10 == 2)
  {
    return result;
  }
  id v12 = objc_msgSend(a1, sel_otherSettings, (void)v14);
  if (v10 == 2)
  {
    uint64_t v13 = 0;
  }
  else
  {
    *(void *)&long long v14 = v10 & 1;
    uint64_t v13 = sub_23C991510();
  }
  objc_msgSend(v12, sel_setObject_forSetting_, v13, qword_268BBAFD0);

  return swift_unknownObjectRelease();
}

uint64_t sub_23C97DCD4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_archivedActivityFamily);
  uint64_t result = swift_beginAccess();
  *a1 = *v3;
  return result;
}

uint64_t sub_23C97DD24(char *a1)
{
  char v2 = *a1;
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_archivedActivityFamily);
  swift_beginAccess();
  *uint64_t v3 = v2;
  return sub_23C97D964();
}

uint64_t (*sub_23C97DD7C(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_23C97DDDC;
}

uint64_t sub_23C97DDDC(uint64_t a1, char a2)
{
  return sub_23C97E260(a1, a2, (uint64_t (*)(uint64_t))sub_23C97D964);
}

uint64_t sub_23C97DDF4()
{
  BSDispatchQueueAssertMain();
  unint64_t v7 = v0;
  uint64_t result = BSDispatchQueueAssertMain();
  if ((*((unsigned char *)v0 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene__inClientSettingsUpdate) & 1) == 0)
  {
    id v2 = objc_msgSend(v0, sel__FBSScene);
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = sub_23C97F990;
    *(void *)(v3 + 24) = &v6;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = sub_23C97F9A8;
    *(void *)(v4 + 24) = v3;
    aBlock[4] = sub_23C977938;
    aBlock[5] = v4;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23C96F58C;
    aBlock[3] = &block_descriptor_58;
    int v5 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v2, sel_updateClientSettingsWithBlock_, v5);

    _Block_release(v5);
    LOBYTE(v2) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    uint64_t result = swift_release();
    if (v2) {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_23C97DF90(void *a1, uint64_t a2)
{
  id v4 = objc_msgSend(a1, sel_otherSettings);
  swift_beginAccess();
  if (objc_msgSend(v4, sel_objectForSetting_, qword_268BBAFE8))
  {
    sub_23C991270();
    swift_unknownObjectRelease();
    sub_23C95CAC4(&v11, v12);
  }
  else
  {
    memset(v12, 0, sizeof(v12));
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF22BA0);
  if (swift_dynamicCast())
  {
    int v5 = v11;
  }
  else
  {
    int v5 = 2;
    LOBYTE(v11) = 2;
  }

  uint64_t v6 = (unsigned __int8 *)(a2 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_baseContentTouchedDown);
  uint64_t result = swift_beginAccess();
  int v8 = *v6;
  if (v5 == 2)
  {
    if (v8 == 2) {
      return result;
    }
  }
  else if (v8 != 2 && ((((v8 & 1) == 0) ^ v5) & 1) != 0)
  {
    return result;
  }
  id v9 = objc_msgSend(a1, sel_otherSettings, (void)v11);
  if (v8 == 2)
  {
    uint64_t v10 = 0;
  }
  else
  {
    LOBYTE(v11) = v8 & 1;
    uint64_t v10 = sub_23C991510();
  }
  objc_msgSend(v9, sel_setObject_forSetting_, v10, qword_268BBAFE8);

  return swift_unknownObjectRelease();
}

uint64_t sub_23C97E148()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_baseContentTouchedDown);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_23C97E190(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_baseContentTouchedDown);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return sub_23C97DDF4();
}

uint64_t (*sub_23C97E1E8(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_23C97E248;
}

uint64_t sub_23C97E248(uint64_t a1, char a2)
{
  return sub_23C97E260(a1, a2, (uint64_t (*)(uint64_t))sub_23C97DDF4);
}

uint64_t sub_23C97E260(uint64_t a1, char a2, uint64_t (*a3)(uint64_t))
{
  uint64_t result = swift_endAccess();
  if ((a2 & 1) == 0) {
    return a3(result);
  }
  return result;
}

uint64_t sub_23C97E2A4()
{
  id v1 = objc_msgSend(v0, sel__FBSScene);
  id v2 = objc_msgSend(v1, sel_clientSettings);

  type metadata accessor for ActivitySceneClientSettings();
  uint64_t v3 = (void *)swift_dynamicCastClass();
  if (v3)
  {
    id v4 = objc_msgSend(v3, sel_otherSettings);
    swift_beginAccess();
    if (objc_msgSend(v4, sel_objectForSetting_, qword_268BBB000))
    {
      sub_23C991270();
      swift_unknownObjectRelease();
      sub_23C95CAC4(&v7, v8);
    }
    else
    {
      memset(v8, 0, sizeof(v8));
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF22BA0);
    if (swift_dynamicCast())
    {
      uint64_t v5 = v7;
    }
    else
    {
      uint64_t v5 = 2;
      LOBYTE(v7) = 2;
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

void sub_23C97E3F4(void *a1, void (*a2)(uint64_t))
{
  type metadata accessor for ActivityMutableSceneClientSettings();
  uint64_t v4 = swift_dynamicCastClass();
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = a1;
    a2(v5);
  }
}

id ActivityScene.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityScene();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23C97E544(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_isArchiveContentReady);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return sub_23C97C170();
}

uint64_t (*sub_23C97E59C(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_23C97E5FC;
}

uint64_t sub_23C97E5FC(uint64_t a1, char a2)
{
  return sub_23C97EA54(a1, a2, (uint64_t (*)(uint64_t))sub_23C97C170);
}

void sub_23C97E614(void *a1, uint64_t a2, uint64_t a3)
{
}

uint64_t (*sub_23C97E634(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_23C97E694;
}

uint64_t sub_23C97E694(uint64_t a1, char a2)
{
  return sub_23C97EA54(a1, a2, (uint64_t (*)(uint64_t))sub_23C97C4B4);
}

void sub_23C97E6AC(void *a1, uint64_t a2, uint64_t a3)
{
}

uint64_t (*sub_23C97E6CC(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_23C97E72C;
}

uint64_t sub_23C97E72C(uint64_t a1, char a2)
{
  return sub_23C97EA54(a1, a2, (uint64_t (*)(uint64_t))sub_23C97C738);
}

void sub_23C97E744(void *a1, uint64_t a2, uint64_t a3)
{
}

uint64_t (*sub_23C97E764(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_23C97E7C4;
}

uint64_t sub_23C97E7C4(uint64_t a1, char a2)
{
  return sub_23C97EA54(a1, a2, (uint64_t (*)(uint64_t))sub_23C97C9BC);
}

void sub_23C97E7DC(void *a1, uint64_t a2, uint64_t a3)
{
}

void sub_23C97E7FC(void *a1, uint64_t a2, uint64_t a3, void *a4, void (*a5)(void))
{
  int v8 = (void **)(v5 + *a4);
  swift_beginAccess();
  id v9 = *v8;
  unsigned __int8 *v8 = a1;
  id v10 = a1;

  a5();
}

uint64_t (*sub_23C97E874(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_23C97E8D4;
}

uint64_t sub_23C97E8D4(uint64_t a1, char a2)
{
  return sub_23C97EA54(a1, a2, (uint64_t (*)(uint64_t))sub_23C97CD30);
}

uint64_t (*sub_23C97E8EC(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_23C97E94C;
}

uint64_t sub_23C97E94C(uint64_t a1, char a2)
{
  return sub_23C97EA54(a1, a2, (uint64_t (*)(uint64_t))sub_23C97D150);
}

uint64_t (*sub_23C97E964(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_23C97E9C4;
}

uint64_t sub_23C97E9C4(uint64_t a1, char a2)
{
  return sub_23C97EA54(a1, a2, (uint64_t (*)(uint64_t))sub_23C97D964);
}

uint64_t (*sub_23C97E9DC(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_23C97EA3C;
}

uint64_t sub_23C97EA3C(uint64_t a1, char a2)
{
  return sub_23C97EA54(a1, a2, (uint64_t (*)(uint64_t))sub_23C97DDF4);
}

uint64_t sub_23C97EA54(uint64_t a1, char a2, uint64_t (*a3)(uint64_t))
{
  uint64_t result = swift_endAccess();
  if ((a2 & 1) == 0) {
    return a3(result);
  }
  return result;
}

uint64_t sub_23C97EA98()
{
  id v1 = objc_msgSend(v0, sel__FBSScene);
  id v2 = objc_msgSend(v1, sel_clientSettings);

  type metadata accessor for ActivitySceneClientSettings();
  uint64_t v3 = (void *)swift_dynamicCastClass();
  if (v3)
  {
    id v4 = objc_msgSend(v3, sel_otherSettings);
    uint64_t v5 = sub_23C97AE18(v4);

    id v2 = v4;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

unint64_t sub_23C97EB44()
{
  unint64_t result = qword_268BBA5C0;
  if (!qword_268BBA5C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_268BBA4D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBA5C0);
  }
  return result;
}

uint64_t sub_23C97EBA0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_23C97EBE0()
{
  sub_23C97BCA8(v0[3], v0[4], v0[2]);
}

uint64_t sub_23C97EBEC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_23C97EC24()
{
  return (*(uint64_t (**)(void))(v0 + 32))();
}

uint64_t sub_23C97EC4C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23C97EC5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23C97BD20(a1, a2);
}

void *sub_23C97EC64(void *a1)
{
  id v2 = (void *)sub_23C97FBA8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
  id v3 = v2;
  return v2;
}

uint64_t sub_23C97EC94()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23C97ECA4()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
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

uint64_t sub_23C97ECE4()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23C97ED24()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t type metadata accessor for ActivityScene()
{
  return self;
}

uint64_t sub_23C97ED58@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_70Tm(a1, &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_isArchiveContentReady, a2);
}

uint64_t sub_23C97ED64(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm_0(a1, a2, a3, a4, &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_isArchiveContentReady, (uint64_t (*)(uint64_t))sub_23C97C170);
}

id sub_23C97ED84@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_contentPayloadID, a2);
}

void sub_23C97ED90(void **a1, void *a2, uint64_t a3, uint64_t a4)
{
}

id sub_23C97EDC4@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_backgroundTintColor, a2);
}

void sub_23C97EDD0(void **a1, void *a2, uint64_t a3, uint64_t a4)
{
}

id sub_23C97EE04@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_textColor, a2);
}

void sub_23C97EE10(void **a1, void *a2, uint64_t a3, uint64_t a4)
{
}

id sub_23C97EE44@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_resolvedMetrics, a2);
}

void sub_23C97EE50(void **a1, void *a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_23C97EE84@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v3 = (void *)(*a1 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_activityHostTouchRestrictedRects);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_23C97EEE0@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_70Tm(a1, &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_idleTimerDisabled, a2);
}

uint64_t sub_23C97EEEC(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm_0(a1, a2, a3, a4, &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_idleTimerDisabled, (uint64_t (*)(uint64_t))sub_23C97D500);
}

uint64_t keypath_setTm_0(char *a1, void *a2, uint64_t a3, uint64_t a4, void *a5, uint64_t (*a6)(uint64_t))
{
  char v7 = *a1;
  int v8 = (unsigned char *)(*a2 + *a5);
  uint64_t v9 = swift_beginAccess();
  unsigned char *v8 = v7;
  return a6(v9);
}

uint64_t sub_23C97EF6C@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_70Tm(a1, &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_archivedActivityFamily, a2);
}

uint64_t sub_23C97EF78(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_39Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_archivedActivityFamily, (uint64_t (*)(uint64_t))sub_23C97D964);
}

uint64_t sub_23C97EF98@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_70Tm(a1, &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_baseContentTouchedDown, a2);
}

uint64_t sub_23C97EFA4(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_39Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_baseContentTouchedDown, (uint64_t (*)(uint64_t))sub_23C97DDF4);
}

uint64_t keypath_set_39Tm(char *a1, void *a2, uint64_t a3, uint64_t a4, void *a5, uint64_t (*a6)(uint64_t))
{
  char v7 = *a1;
  int v8 = (unsigned char *)(*a2 + *a5);
  uint64_t v9 = swift_beginAccess();
  unsigned char *v8 = v7;
  return a6(v9);
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.isArchiveContentReady.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.isArchiveContentReady.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.isArchiveContentReady.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.contentPayloadID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.contentPayloadID.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.contentPayloadID.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.backgroundTintColor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.backgroundTintColor.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.backgroundTintColor.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.textColor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.textColor.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 88))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.textColor.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 96))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.resolvedMetrics.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 104))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.resolvedMetrics.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 112))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.resolvedMetrics.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 120))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.activityHostTouchRestrictedRects.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 128))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.activityHostTouchRestrictedRects.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 136))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.activityHostTouchRestrictedRects.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 144))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.archivedActivityFamily.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 152))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.archivedActivityFamily.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 160))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.archivedActivityFamily.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 168))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.baseContentTouchedDown.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 176))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.baseContentTouchedDown.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 184))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.baseContentTouchedDown.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 192))();
}

uint64_t dispatch thunk of ActivityClientSettingsUpdating.actionButtonInitiated.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 200))();
}

uint64_t method lookup function for ActivityScene(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ActivityScene);
}

uint64_t dispatch thunk of ActivityScene.subscript.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of ActivityScene.observe<A>(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of ActivityScene.updateClientSettings(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of ActivityScene.updateClientSettingsWithTransitionContext(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of ActivityScene.isArchiveContentReady.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of ActivityScene.isArchiveContentReady.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of ActivityScene.isArchiveContentReady.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of ActivityScene.contentPayloadID.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of ActivityScene.contentPayloadID.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of ActivityScene.contentPayloadID.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of ActivityScene.backgroundTintColor.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of ActivityScene.backgroundTintColor.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of ActivityScene.backgroundTintColor.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of ActivityScene.textColor.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of ActivityScene.textColor.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of ActivityScene.textColor.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of ActivityScene.resolvedMetrics.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of ActivityScene.resolvedMetrics.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of ActivityScene.resolvedMetrics.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of ActivityScene.activityHostTouchRestrictedRects.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of ActivityScene.activityHostTouchRestrictedRects.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of ActivityScene.activityHostTouchRestrictedRects.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of ActivityScene.idleTimerDisabled.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of ActivityScene.idleTimerDisabled.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x198))();
}

uint64_t dispatch thunk of ActivityScene.idleTimerDisabled.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of ActivityScene.archivedActivityFamily.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of ActivityScene.archivedActivityFamily.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of ActivityScene.archivedActivityFamily.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of ActivityScene.baseContentTouchedDown.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of ActivityScene.baseContentTouchedDown.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of ActivityScene.baseContentTouchedDown.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of ActivityScene.actionButtonInitiated.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1D8))();
}

uint64_t sub_23C97F990(void *a1)
{
  return sub_23C97DF90(a1, *(void *)(v1 + 16));
}

uint64_t sub_23C97F998()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_23C97F9A8(void *a1)
{
  sub_23C97E3F4(a1, *(void (**)(uint64_t))(v1 + 16));
}

uint64_t sub_23C97F9B0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23C97F9C0(void *a1)
{
  return sub_23C97DB00(a1, *(void *)(v1 + 16));
}

uint64_t sub_23C97F9C8()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23C97F9D8()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23C97F9E8(void *a1)
{
  return sub_23C97D69C(a1, *(void *)(v1 + 16));
}

uint64_t sub_23C97F9F0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23C97FA00()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23C97FA10(void *a1)
{
  return sub_23C97D2EC(a1, *(void *)(v1 + 16));
}

uint64_t sub_23C97FA18()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23C97FA28()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_23C97FA38(void *a1)
{
  sub_23C97CECC(a1, *(void *)(v1 + 16), &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_resolvedMetrics, &qword_268BBAF88);
}

uint64_t sub_23C97FA64()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23C97FA74()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_23C97FA84(uint64_t a1)
{
  sub_23C97CB58(a1, *(void *)(v1 + 16), &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_textColor, sub_23C969014);
}

uint64_t sub_23C97FABC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23C97FACC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_23C97FADC(uint64_t a1)
{
  sub_23C97CB58(a1, *(void *)(v1 + 16), &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_backgroundTintColor, sub_23C969074);
}

uint64_t sub_23C97FB14()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23C97FB24()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_23C97FB34(void *a1)
{
  sub_23C97CECC(a1, *(void *)(v1 + 16), &OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_contentPayloadID, &qword_268BBAF70);
}

uint64_t sub_23C97FB60()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23C97FB70()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23C97FB80(void *a1)
{
  return sub_23C97C30C(a1, *(void *)(v1 + 16));
}

uint64_t sub_23C97FB88()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23C97FB98()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23C97FBA8(void *a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for ActivityMutableSceneClientSettings();
  uint64_t v6 = swift_dynamicCastClass();
  if (v6)
  {
    char v7 = (void *)v6;
    swift_beginAccess();
    id v30 = a1;
    id v8 = objc_msgSend(v7, sel_otherSettings);
    uint64_t v9 = sub_23C991510();
    swift_beginAccess();
    objc_msgSend(v8, sel_setObject_forSetting_, v9, qword_268BBAF58);

    swift_unknownObjectRelease();
    id v10 = (id *)(a3 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_contentPayloadID);
    swift_beginAccess();
    id v11 = *v10;
    id v12 = objc_msgSend(v7, sel_otherSettings);
    swift_beginAccess();
    objc_msgSend(v12, sel_setObject_forSetting_, v11, qword_268BBAF70);

    uint64_t v13 = (void **)(a3 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_backgroundTintColor);
    swift_beginAccess();
    long long v14 = *v13;
    id v15 = v14;
    sub_23C969074(v14);

    uint64_t v16 = (void **)(a3 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_textColor);
    swift_beginAccess();
    uint64_t v17 = *v16;
    id v18 = v17;
    sub_23C969014(v17);

    uint64_t v19 = (id *)(a3 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_resolvedMetrics);
    swift_beginAccess();
    id v20 = *v19;
    id v21 = objc_msgSend(v7, sel_otherSettings);
    swift_beginAccess();
    objc_msgSend(v21, sel_setObject_forSetting_, v20, qword_268BBAF88);

    swift_beginAccess();
    swift_bridgeObjectRetain_n();
    id v22 = objc_msgSend(v7, sel_otherSettings);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF22B70);
    uint64_t v23 = sub_23C991510();
    swift_beginAccess();
    objc_msgSend(v22, sel_setObject_forSetting_, v23, qword_268BBAFA0);
    swift_bridgeObjectRelease_n();

    swift_unknownObjectRelease();
    swift_beginAccess();
    id v24 = objc_msgSend(v7, sel_otherSettings);
    uint64_t v25 = sub_23C991510();
    swift_beginAccess();
    objc_msgSend(v24, sel_setObject_forSetting_, v25, qword_268BBAFB8);

    swift_unknownObjectRelease();
    id v26 = (unsigned __int8 *)(a3 + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_archivedActivityFamily);
    swift_beginAccess();
    LODWORD(v25) = *v26;
    id v27 = objc_msgSend(v7, sel_otherSettings);
    uint64_t v28 = 0;
    if (v25 != 2) {
      uint64_t v28 = sub_23C991510();
    }
    swift_beginAccess();
    objc_msgSend(v27, sel_setObject_forSetting_, v28, qword_268BBAFD0);

    swift_unknownObjectRelease();
  }
  return a2;
}

id ActivitySceneMetrics.__allocating_init(size:cornerRadius:edgeInsets:)(void *a1, double a2, double a3, double a4)
{
  uint64_t v9 = (char *)objc_allocWithZone(v4);
  id v10 = (void **)&v9[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets];
  *(void *)&v9[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets] = 0;
  id v11 = (double *)&v9[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size];
  *id v11 = a2;
  v11[1] = a3;
  *(double *)&v9[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius] = a4;
  swift_beginAccess();
  id v12 = *v10;
  id *v10 = a1;
  id v13 = a1;

  v16.receiver = v9;
  v16.super_class = v4;
  id v14 = objc_msgSendSuper2(&v16, sel_init);

  return v14;
}

double sub_23C9801A4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_23C980244(double a1, double a2)
{
  uint64_t v5 = (double *)(v2 + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size);
  uint64_t result = swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*sub_23C98029C())()
{
  return j_j__swift_endAccess;
}

double sub_23C980340()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_23C9803DC(double a1)
{
  id v3 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*sub_23C980430())()
{
  return j_j__swift_endAccess;
}

void *sub_23C9804D8()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_23C980588(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets);
  swift_beginAccess();
  id v4 = *v3;
  *id v3 = a1;
}

void sub_23C9805DC(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  id v3 = (void **)(*a2 + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets);
  swift_beginAccess();
  id v4 = *v3;
  *id v3 = v2;
  id v5 = v2;
}

uint64_t (*sub_23C980640())()
{
  return j__swift_endAccess;
}

uint64_t sub_23C98069C(char a1)
{
  return *(void *)&aSize_4[8 * a1];
}

id ActivitySceneMetrics.__allocating_init(xpcDictionary:)()
{
  id v1 = objc_allocWithZone(v0);
  id v2 = sub_23C9813EC();
  swift_unknownObjectRelease();
  return v2;
}

id ActivitySceneMetrics.init(xpcDictionary:)()
{
  id v0 = sub_23C9813EC();
  swift_unknownObjectRelease();
  return v0;
}

void sub_23C980778(uint64_t a1)
{
  if (a1)
  {
    swift_beginAccess();
    BSSerializeCGSizeToXPCDictionaryWithKey();
    swift_beginAccess();
    BSSerializeDoubleToXPCDictionaryWithKey();
    id v2 = (id *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets);
    swift_beginAccess();
    if (*v2)
    {
      id v3 = *v2;
      id v4 = objc_msgSend(v3, sel_bs_secureEncoded);
      if (v4)
      {
        uint64_t v5 = sub_23C990BF0();
        unint64_t v7 = v6;

        id v4 = (id)sub_23C990BE0();
        sub_23C95CAD4(v5, v7);
      }
      BSSerializeDataToXPCDictionaryWithKey();
    }
  }
}

id ActivitySceneMetrics.init(size:cornerRadius:edgeInsets:)(void *a1, double a2, double a3, double a4)
{
  unint64_t v6 = (void **)&v4[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets];
  *(void *)&v4[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets] = 0;
  unint64_t v7 = (double *)&v4[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size];
  *unint64_t v7 = a2;
  v7[1] = a3;
  *(double *)&v4[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius] = a4;
  swift_beginAccess();
  id v8 = *v6;
  *unint64_t v6 = a1;
  id v9 = a1;

  v12.receiver = v4;
  v12.super_class = (Class)type metadata accessor for ActivitySceneMetrics();
  id v10 = objc_msgSendSuper2(&v12, sel_init);

  return v10;
}

id ActivitySceneMetrics.__allocating_init(size:cornerRadius:)(double a1, double a2, double a3)
{
  unint64_t v7 = (char *)objc_allocWithZone(v3);
  id v8 = (void **)&v7[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets];
  *(void *)&v7[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets] = 0;
  id v9 = (double *)&v7[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size];
  double *v9 = a1;
  v9[1] = a2;
  *(double *)&v7[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius] = a3;
  swift_beginAccess();
  id v10 = *v8;
  void *v8 = 0;

  v12.receiver = v7;
  v12.super_class = v3;
  return objc_msgSendSuper2(&v12, sel_init);
}

id ActivitySceneMetrics.init(size:cornerRadius:)(double a1, double a2, double a3)
{
  id v4 = (void **)&v3[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets];
  *(void *)&v3[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets] = 0;
  uint64_t v5 = (double *)&v3[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size];
  *uint64_t v5 = a1;
  v5[1] = a2;
  *(double *)&v3[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius] = a3;
  swift_beginAccess();
  unint64_t v6 = *v4;
  *id v4 = 0;

  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for ActivitySceneMetrics();
  return objc_msgSendSuper2(&v8, sel_init);
}

uint64_t sub_23C980C3C(uint64_t a1)
{
  sub_23C9523D4(a1, (uint64_t)v20);
  if (!v21)
  {
    sub_23C952480((uint64_t)v20);
    goto LABEL_11;
  }
  type metadata accessor for ActivitySceneMetrics();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_11:
    char v16 = 0;
    return v16 & 1;
  }
  id v2 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size);
  swift_beginAccess();
  double v4 = *v2;
  double v3 = v2[1];
  uint64_t v5 = (double *)&v19[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size];
  swift_beginAccess();
  if (v4 != *v5) {
    goto LABEL_10;
  }
  if (v3 != v5[1]) {
    goto LABEL_10;
  }
  unint64_t v6 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius);
  swift_beginAccess();
  double v7 = *v6;
  objc_super v8 = (double *)&v19[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius];
  swift_beginAccess();
  if (v7 != *v8) {
    goto LABEL_10;
  }
  id v9 = (void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets);
  swift_beginAccess();
  id v10 = *v9;
  id v11 = (void **)&v19[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets];
  swift_beginAccess();
  objc_super v12 = *v11;
  if (!v10)
  {
    id v18 = v12;

    if (!v12)
    {
      char v16 = 1;
      return v16 & 1;
    }

    goto LABEL_11;
  }
  if (!v12)
  {
LABEL_10:

    goto LABEL_11;
  }
  type metadata accessor for ActivityEdgeInsets();
  id v13 = v10;
  id v14 = v12;
  id v15 = v13;
  char v16 = sub_23C991200();

  return v16 & 1;
}

uint64_t static ActivitySceneMetrics.supportsSecureCoding.getter()
{
  return 1;
}

void sub_23C980EA8(void *a1)
{
  double v3 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size);
  swift_beginAccess();
  double v5 = *v3;
  double v4 = v3[1];
  unint64_t v6 = (void *)sub_23C990FC0();
  objc_msgSend(a1, sel_encodeCGSize_forKey_, v6, v5, v4);

  double v7 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius);
  swift_beginAccess();
  *(float *)&double v4 = *v7;
  objc_super v8 = (void *)sub_23C990FC0();
  LODWORD(v9) = LODWORD(v4);
  objc_msgSend(a1, sel_encodeFloat_forKey_, v8, v9);

  id v10 = (id *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets);
  swift_beginAccess();
  if (*v10)
  {
    id v11 = *v10;
    objc_super v12 = (void *)sub_23C990FC0();
    objc_msgSend(a1, sel_encodeObject_forKey_, v11, v12);
  }
}

id ActivitySceneMetrics.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = sub_23C981560(a1);

  return v4;
}

id ActivitySceneMetrics.init(coder:)(void *a1)
{
  id v2 = sub_23C981560(a1);

  return v2;
}

uint64_t sub_23C981190()
{
  sub_23C991330();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  type metadata accessor for CGSize(0);
  sub_23C990FE0();
  sub_23C991000();
  swift_bridgeObjectRelease();
  sub_23C991000();
  swift_beginAccess();
  sub_23C9910C0();
  sub_23C991000();
  swift_bridgeObjectRelease();
  sub_23C991000();
  uint64_t v1 = (id *)(v0 + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets);
  swift_beginAccess();
  id v2 = *v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF22A20);
  sub_23C990FE0();
  sub_23C991000();
  swift_bridgeObjectRelease();
  return 0x203A657A6953;
}

id ActivitySceneMetrics.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void ActivitySceneMetrics.init()()
{
}

id ActivitySceneMetrics.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivitySceneMetrics();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_23C9813EC()
{
  id v1 = (void **)&v0[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets];
  *(void *)&v0[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets] = 0;
  objc_super v2 = v0;
  BSDeserializeCGSizeFromXPCDictionaryWithKey();
  id v3 = &v2[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size];
  *(void *)id v3 = v4;
  *((void *)v3 + 1) = v5;
  BSDeserializeDoubleFromXPCDictionaryWithKey();
  *(void *)&v2[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius] = v6;
  id v7 = (id)BSDeserializeDataFromXPCDictionaryWithKey();
  if (v7)
  {
    objc_super v8 = v7;
    uint64_t v9 = sub_23C990BF0();
    unint64_t v11 = v10;

    type metadata accessor for ActivityEdgeInsets();
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    id v13 = (void *)sub_23C990BE0();
    id v14 = objc_msgSend(ObjCClassFromMetadata, sel_bs_secureDecodedFromData_, v13);
    sub_23C95CAD4(v9, v11);

    swift_beginAccess();
    id v15 = *v1;
    *id v1 = v14;
  }
  else
  {
  }
  v17.receiver = v2;
  v17.super_class = (Class)type metadata accessor for ActivitySceneMetrics();
  return objc_msgSendSuper2(&v17, sel_init);
}

uint64_t type metadata accessor for ActivitySceneMetrics()
{
  return self;
}

id sub_23C981560(void *a1)
{
  id v3 = (void **)&v1[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets];
  *(void *)&v1[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets] = 0;
  uint64_t v4 = v1;
  uint64_t v5 = (void *)sub_23C990FC0();
  objc_msgSend(a1, sel_decodeCGSizeForKey_, v5);
  uint64_t v7 = v6;
  uint64_t v9 = v8;

  unint64_t v10 = &v4[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size];
  *(void *)unint64_t v10 = v7;
  *((void *)v10 + 1) = v9;
  unint64_t v11 = (void *)sub_23C990FC0();
  objc_msgSend(a1, sel_decodeFloatForKey_, v11);
  LODWORD(v7) = v12;

  *(double *)&v4[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius] = *(float *)&v7;
  id v13 = (void *)sub_23C990FC0();
  unsigned int v14 = objc_msgSend(a1, sel_containsValueForKey_, v13);

  if (v14)
  {
    type metadata accessor for ActivityEdgeInsets();
    uint64_t v15 = sub_23C9911D0();
    swift_beginAccess();
    char v16 = *v3;
    *id v3 = (void *)v15;
  }
  else
  {
  }
  v18.receiver = v4;
  v18.super_class = (Class)type metadata accessor for ActivitySceneMetrics();
  return objc_msgSendSuper2(&v18, sel_init);
}

__n128 sub_23C981700@<Q0>(void *a1@<X0>, __n128 *a2@<X8>)
{
  id v3 = (__n128 *)(*a1 + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size);
  swift_beginAccess();
  __n128 result = *v3;
  *a2 = *v3;
  return result;
}

uint64_t sub_23C981754(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = (void *)(*a2 + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size);
  uint64_t result = swift_beginAccess();
  *uint64_t v4 = v2;
  v4[1] = v3;
  return result;
}

double sub_23C9817AC@<D0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (double *)(*a1 + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius);
  swift_beginAccess();
  double result = *v3;
  *a2 = *(void *)v3;
  return result;
}

uint64_t sub_23C981800(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a2 + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = v2;
  return result;
}

id sub_23C981858@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  uint64_t v3 = (void **)(*a1 + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t method lookup function for ActivitySceneMetrics(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ActivitySceneMetrics);
}

uint64_t dispatch thunk of ActivitySceneMetrics.size.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of ActivitySceneMetrics.size.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of ActivitySceneMetrics.size.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of ActivitySceneMetrics.cornerRadius.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of ActivitySceneMetrics.cornerRadius.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of ActivitySceneMetrics.cornerRadius.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of ActivitySceneMetrics.edgeInsets.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of ActivitySceneMetrics.edgeInsets.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of ActivitySceneMetrics.edgeInsets.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of ActivitySceneMetrics.__allocating_init(xpcDictionary:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of ActivitySceneMetrics.encode(withXPCDictionary:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of ActivitySceneMetrics.__allocating_init(size:cornerRadius:edgeInsets:)()
{
  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of ActivitySceneMetrics.__allocating_init(size:cornerRadius:)()
{
  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t dispatch thunk of ActivitySceneMetrics.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of ActivitySceneMetrics.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 216))();
}

uint64_t sub_23C981B64(uint64_t a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(void *)(a2 + 16))
    {
      unint64_t v5 = sub_23C973C2C(a1);
      if (v6)
      {
        uint64_t v4 = *(void *)(*(void *)(a2 + 56) + 8 * v5);
        swift_retain();
        return v4;
      }
    }
    return 0;
  }
  swift_retain();
  uint64_t v3 = sub_23C9913A0();
  swift_release();
  if (!v3) {
    return 0;
  }
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268BBA4D0);
  swift_dynamicCast();
  uint64_t v4 = v8;
  swift_unknownObjectRelease();
  return v4;
}

uint64_t sub_23C981C40(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *a1;
  uint64_t v7 = (uint64_t *)(v2 + OBJC_IVAR____TtC18ActivityUIServices14SettingsDiffer_subjects);
  swift_beginAccess();
  uint64_t v8 = *v7;
  swift_bridgeObjectRetain();
  uint64_t v9 = swift_retain();
  uint64_t v10 = sub_23C981B64(v9, v8);
  swift_release();
  swift_bridgeObjectRelease();
  if (!v10)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268BBA4D0);
    swift_allocObject();
    uint64_t v10 = sub_23C990EB0();
    uint64_t v11 = *(void *)(*MEMORY[0x263F8EA20] + v6 + 8);
    uint64_t v12 = swift_allocObject();
    swift_weakInit();
    uint64_t v13 = *(void *)(a2 + 8);
    unsigned int v14 = *(void (**)(uint64_t, uint64_t (*)(), uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 24);
    uint64_t v15 = type metadata accessor for SettingsDiffer();
    swift_retain();
    v14(v3, sub_23C982188, v12, v15, v11, v13);
    swift_release_n();
    swift_beginAccess();
    swift_retain();
    uint64_t v16 = swift_retain();
    sub_23C982190(v16, (uint64_t)a1);
    swift_endAccess();
    swift_release();
  }
  return v10;
}

uint64_t sub_23C981E08()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_23C990EA0();
    return swift_release();
  }
  return result;
}

id sub_23C981FE0()
{
  return sub_23C9820B4(type metadata accessor for SettingsDiffer);
}

uint64_t type metadata accessor for SettingsDiffer()
{
  return self;
}

uint64_t sub_23C98202C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  if (a3) {
    return a3();
  }
  return result;
}

id sub_23C98209C()
{
  return sub_23C9820B4(type metadata accessor for ActivitySceneClientSettingsDiffInspector);
}

id sub_23C9820B4(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for ActivitySceneClientSettingsDiffInspector()
{
  return self;
}

unint64_t sub_23C982110()
{
  unint64_t result = qword_26AF22B90;
  if (!qword_26AF22B90)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26AF22B90);
  }
  return result;
}

uint64_t sub_23C982150()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_23C982188()
{
  return sub_23C981E08();
}

uint64_t sub_23C982190(uint64_t a1, uint64_t a2)
{
  objc_super v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    uint64_t result = sub_23C9912C0();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    *objc_super v3 = sub_23C982244(v7, result + 1);
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *v3;
  *objc_super v3 = 0x8000000000000000;
  sub_23C982DA0(a1, a2, isUniquelyReferenced_nonNull_native);
  *objc_super v3 = v10;
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C982244(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BBA5E0);
    uint64_t v2 = sub_23C991410();
    uint64_t v18 = v2;
    sub_23C991380();
    for (uint64_t i = sub_23C9913B0(); i; uint64_t i = sub_23C9913B0())
    {
      uint64_t v16 = i;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268BBA5D0);
      swift_dynamicCast();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268BBA4D0);
      swift_dynamicCast();
      unint64_t v11 = *(void *)(v2 + 16);
      if (*(void *)(v2 + 24) <= v11)
      {
        sub_23C982730(v11 + 1, 1);
        uint64_t v2 = v18;
      }
      uint64_t result = sub_23C990F90();
      uint64_t v5 = v2 + 64;
      uint64_t v6 = -1 << *(unsigned char *)(v2 + 32);
      unint64_t v7 = result & ~v6;
      unint64_t v8 = v7 >> 6;
      if (((-1 << v7) & ~*(void *)(v2 + 64 + 8 * (v7 >> 6))) != 0)
      {
        unint64_t v9 = __clz(__rbit64((-1 << v7) & ~*(void *)(v2 + 64 + 8 * (v7 >> 6)))) | v7 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v12 = 0;
        unint64_t v13 = (unint64_t)(63 - v6) >> 6;
        do
        {
          if (++v8 == v13 && (v12 & 1) != 0)
          {
            __break(1u);
            return result;
          }
          BOOL v14 = v8 == v13;
          if (v8 == v13) {
            unint64_t v8 = 0;
          }
          v12 |= v14;
          uint64_t v15 = *(void *)(v5 + 8 * v8);
        }
        while (v15 == -1);
        unint64_t v9 = __clz(__rbit64(~v15)) + (v8 << 6);
      }
      *(void *)(v5 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
      uint64_t v10 = 8 * v9;
      *(void *)(*(void *)(v2 + 48) + v10) = v17;
      *(void *)(*(void *)(v2 + 56) + v10) = v16;
      ++*(void *)(v2 + 16);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE80];
  }
  return v2;
}

uint64_t sub_23C982480(uint64_t a1, char a2)
{
  objc_super v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF22830);
  uint64_t result = sub_23C991400();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    unint64_t v9 = (uint64_t *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v30 = -1 << v10;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    uint64_t v31 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v32 = v3;
    int64_t v33 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v18 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v19 = v18 | (v8 << 6);
      }
      else
      {
        int64_t v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v20 >= v33) {
          goto LABEL_33;
        }
        unint64_t v21 = v9[v20];
        ++v8;
        if (!v21)
        {
          int64_t v8 = v20 + 1;
          if (v20 + 1 >= v33) {
            goto LABEL_33;
          }
          unint64_t v21 = v9[v8];
          if (!v21)
          {
            int64_t v22 = v20 + 2;
            if (v22 >= v33)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                objc_super v3 = v32;
                goto LABEL_40;
              }
              if (v31 >= 64) {
                bzero((void *)(v5 + 64), 8 * v33);
              }
              else {
                uint64_t *v9 = v30;
              }
              objc_super v3 = v32;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v21 = v9[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v8 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v33) {
                  goto LABEL_33;
                }
                unint64_t v21 = v9[v8];
                ++v22;
                if (v21) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v22;
          }
        }
LABEL_30:
        unint64_t v12 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      uint64_t v27 = *(unsigned int *)(*(void *)(v5 + 48) + 4 * v19);
      uint64_t v28 = *(void **)(*(void *)(v5 + 56) + 8 * v19);
      if ((a2 & 1) == 0) {
        id v29 = v28;
      }
      uint64_t result = MEMORY[0x23ECEA400](*(void *)(v7 + 40), v27, 4);
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v25 = v16 == v24;
          if (v16 == v24) {
            unint64_t v16 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v13 + 8 * v16);
        }
        while (v26 == -1);
        unint64_t v17 = __clz(__rbit64(~v26)) + (v16 << 6);
      }
      *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      *(_DWORD *)(*(void *)(v7 + 48) + 4 * v17) = v27;
      *(void *)(*(void *)(v7 + 56) + 8 * v17) = v28;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *objc_super v3 = v7;
  return result;
}

uint64_t sub_23C982730(uint64_t a1, char a2)
{
  objc_super v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBA5E0);
  char v35 = a2;
  uint64_t v6 = sub_23C991400();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v34 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v33 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v33) {
      break;
    }
    int64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v34 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v33) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v34 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v33)
        {
LABEL_33:
          swift_release();
          if ((v35 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v34 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v33) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v34 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = 8 * v20;
    uint64_t v30 = *(void *)(*(void *)(v5 + 48) + v29);
    uint64_t v31 = *(void *)(*(void *)(v5 + 56) + v29);
    if ((v35 & 1) == 0)
    {
      swift_retain();
      swift_retain();
    }
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268BBA5D0);
    uint64_t result = sub_23C990F90();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = 8 * v17;
    *(void *)(*(void *)(v7 + 48) + v18) = v30;
    *(void *)(*(void *)(v7 + 56) + v18) = v31;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  int64_t v22 = (void *)(v5 + 64);
  if ((v35 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
  if (v32 >= 64) {
    bzero(v22, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v22 = -1 << v32;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *objc_super v3 = v7;
  return result;
}

id sub_23C982A4C()
{
  id v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF22830);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_23C9913F0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *id v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 4 * v15;
    int v17 = *(_DWORD *)(*(void *)(v2 + 48) + 4 * v15);
    uint64_t v18 = 8 * v15;
    unint64_t v19 = *(void **)(*(void *)(v2 + 56) + v18);
    *(_DWORD *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v18) = v19;
    id result = v19;
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_23C982BF4()
{
  id v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBA5E0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_23C9913F0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *id v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
    swift_retain();
    id result = (void *)swift_retain();
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_23C982DA0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_23C973C2C(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= v13 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_23C982BF4();
LABEL_7:
    uint64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];
      uint64_t result = swift_release();
      *(void *)(v17 + 8 * v10) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_23C982730(v13, a3 & 1);
  unint64_t v19 = sub_23C973C2C(a2);
  if ((v14 & 1) != (v20 & 1))
  {
LABEL_17:
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268BBA5D0);
    uint64_t result = sub_23C991530();
    __break(1u);
    return result;
  }
  unint64_t v10 = v19;
  uint64_t v16 = (void *)*v4;
  if (v14) {
    goto LABEL_8;
  }
LABEL_11:
  v16[(v10 >> 6) + 8] |= 1 << v10;
  uint64_t v21 = 8 * v10;
  *(void *)(v16[6] + v21) = a2;
  *(void *)(v16[7] + v21) = a1;
  uint64_t v22 = v16[2];
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v16[2] = v24;
  return swift_retain();
}

id ActivitySceneDescriptor.__allocating_init(activitySceneType:activityDescriptor:metricsRequest:payloadID:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v11 = objc_allocWithZone(v5);
  id v12 = sub_23C98368C(a1, a2, a3, a4, a5);

  return v12;
}

unint64_t ActivitySceneType.init(rawValue:)(unint64_t a1)
{
  return sub_23C978854(a1);
}

uint64_t ActivitySceneDescriptor.activityIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ActivitySceneDescriptor.activitySceneType.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activitySceneType);
}

uint64_t ActivitySceneDescriptor.activityDescriptor.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityDescriptor;
  uint64_t v4 = sub_23C990C60();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

id ActivitySceneDescriptor.metricsRequest.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_metricsRequest);
}

uint64_t ActivitySceneDescriptor.payloadID.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_payloadID);
  swift_bridgeObjectRetain();
  return v1;
}

id ActivitySceneDescriptor.activityDescriptorData.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityDescriptorData);
}

id sub_23C983308()
{
  uint64_t v0 = (objc_class *)type metadata accessor for ActivitySceneMetrics();
  uint64_t v1 = (char *)objc_allocWithZone(v0);
  uint64_t v2 = (void **)&v1[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets];
  *(void *)&v1[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets] = 0;
  *(_OWORD *)&v1[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size] = xmmword_23C994F40;
  *(void *)&v1[OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius] = 0x4028000000000000;
  swift_beginAccess();
  uint64_t v3 = *v2;
  *uint64_t v2 = 0;

  v5.receiver = v1;
  v5.super_class = v0;
  return objc_msgSendSuper2(&v5, sel_init);
}

id ActivitySceneDescriptor.init(activitySceneType:activityDescriptor:metricsRequest:payloadID:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v6 = sub_23C98368C(a1, a2, a3, a4, a5);

  return v6;
}

id ActivitySceneDescriptor.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void ActivitySceneDescriptor.init()()
{
}

id ActivitySceneDescriptor.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivitySceneDescriptor();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_23C98368C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v11 = v5;
  uint64_t v12 = sub_23C990C50();
  uint64_t v13 = (uint64_t *)&v11[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityIdentifier];
  *uint64_t v13 = v12;
  v13[1] = v14;
  *(void *)&v11[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activitySceneType] = a1;
  uint64_t v15 = sub_23C990C60();
  sub_23C9839DC(&qword_268BBA600);
  *(void *)&v11[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityDescriptorData] = sub_23C991440();
  uint64_t v16 = *(void *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(&v11[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_activityDescriptor], a2, v15);
  *(void *)&v11[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_metricsRequest] = a3;
  uint64_t v17 = &v11[OBJC_IVAR____TtC18ActivityUIServices23ActivitySceneDescriptor_payloadID];
  *(void *)uint64_t v17 = a4;
  *((void *)v17 + 1) = a5;
  id v18 = a3;

  v21.receiver = v11;
  v21.super_class = (Class)type metadata accessor for ActivitySceneDescriptor();
  id v19 = objc_msgSendSuper2(&v21, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(a2, v15);
  return v19;
}

uint64_t type metadata accessor for ActivitySceneDescriptor()
{
  uint64_t result = qword_26AF226C8;
  if (!qword_26AF226C8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_23C983850()
{
  unint64_t result = qword_268BBB468;
  if (!qword_268BBB468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBB468);
  }
  return result;
}

ValueMetadata *type metadata accessor for ActivitySceneType()
{
  return &type metadata for ActivitySceneType;
}

uint64_t sub_23C9838B4()
{
  return type metadata accessor for ActivitySceneDescriptor();
}

uint64_t sub_23C9838BC()
{
  uint64_t result = sub_23C990C60();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for ActivitySceneDescriptor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ActivitySceneDescriptor);
}

uint64_t dispatch thunk of ActivitySceneDescriptor.metrics.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of ActivitySceneDescriptor.__allocating_init(activitySceneType:activityDescriptor:metricsRequest:payloadID:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t sub_23C9839DC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_23C990C60();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_23C983A20(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
}

void static AnySceneSetting.observe<A>(differ:call:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t))(a6 + 16))(a4, a6);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a2;
  *(void *)(v10 + 24) = a3;
  void v12[4] = sub_23C983C98;
  v12[5] = v10;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 1107296256;
  _OWORD v12[2] = sub_23C983C00;
  uint64_t v12[3] = &block_descriptor_3;
  id v11 = _Block_copy(v12);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_observeOtherSetting_withBlock_, v9, v11);
  _Block_release(v11);
}

void SceneSettingDynamicLookup.subscript.getter()
{
}

{
  sub_23C9913D0();
  __break(1u);
}

{
  SceneSettingDynamicLookup.subscript.getter();
}

uint64_t sub_23C983BAC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_23C983C00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_super v5 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v5(a2, a3);
  return swift_release();
}

uint64_t sub_23C983C60()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23C983C98()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t static SceneSettingScopes.ApplicationSettings.FrameKey.keyIndex.getter()
{
  return qword_268BBB470;
}

uint64_t static SceneSettingScopes.ApplicationSettings.FrameKey.keyIndex.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_268BBB470 = a1;
  return result;
}

uint64_t (*static SceneSettingScopes.ApplicationSettings.FrameKey.keyIndex.modify())()
{
  return j_j__swift_endAccess;
}

void sub_23C983DC4()
{
  qword_268BBB478 = 0x656D617266;
  unk_268BBB480 = 0xE500000000000000;
}

uint64_t static SceneSettingScopes.ApplicationSettings.FrameKey.keyDescription.getter()
{
  return sub_23C95B814(&qword_268BBAA68, &qword_268BBB478);
}

uint64_t static SceneSettingScopes.ApplicationSettings.FrameKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return sub_23C95B8AC(a1, a2, &qword_268BBAA68, &qword_268BBB478, &qword_268BBB480);
}

uint64_t (*static SceneSettingScopes.ApplicationSettings.FrameKey.keyDescription.modify())()
{
  if (qword_268BBAA68 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void static SceneSettingScopes.ApplicationSettings.FrameKey.observe<A>(differ:call:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a2;
  *(void *)(v6 + 24) = a3;
  v8[4] = sub_23C983C98;
  v8[5] = v6;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  _OWORD v8[2] = sub_23C983BAC;
  v8[3] = &block_descriptor_6;
  unint64_t v7 = _Block_copy(v8);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_observeFrameWithBlock_, v7);
  _Block_release(v7);
}

uint64_t sub_23C983FA0(uint64_t a1, uint64_t a2)
{
  return sub_23C95B9D8(a1, a2, &qword_268BBAA68, &qword_268BBB478);
}

uint64_t sub_23C983FC8()
{
  return qword_268BBB470;
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityIdentifierKey.keyIndex.getter()
{
  return qword_268BBB488;
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityIdentifierKey.keyIndex.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_268BBB488 = a1;
  return result;
}

uint64_t (*static SceneSettingScopes.ActivitySettings.ActivityIdentifierKey.keyIndex.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityIdentifierKey.keyDescription.getter()
{
  return sub_23C95C244((uint64_t *)&unk_268BBB490);
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityIdentifierKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return sub_23C95C2A8(a1, a2, qword_268BBB490, &qword_268BBB490[1]);
}

uint64_t (*static SceneSettingScopes.ActivitySettings.ActivityIdentifierKey.keyDescription.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_23C984170(uint64_t a1, uint64_t a2)
{
  return sub_23C95C370(a1, a2, qword_268BBB490);
}

uint64_t sub_23C984180()
{
  return qword_268BBB488;
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityMetricsKey.keyIndex.getter()
{
  return qword_268BBB4A0;
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityMetricsKey.keyIndex.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_268BBB4A0 = a1;
  return result;
}

uint64_t (*static SceneSettingScopes.ActivitySettings.ActivityMetricsKey.keyIndex.modify())()
{
  return j_j__swift_endAccess;
}

void sub_23C9842A8()
{
  qword_268BBA550 = 0x7974697669746361;
  *(void *)algn_268BBA558 = 0xEF7363697274654DLL;
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityMetricsKey.keyDescription.getter()
{
  return sub_23C95B814(&qword_268BBA560, &qword_268BBA550);
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityMetricsKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return sub_23C95B8AC(a1, a2, &qword_268BBA560, &qword_268BBA550, algn_268BBA558);
}

uint64_t (*static SceneSettingScopes.ActivitySettings.ActivityMetricsKey.keyDescription.modify())()
{
  if (qword_268BBA560 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_23C9843B0(uint64_t a1, uint64_t a2)
{
  return sub_23C95B9D8(a1, a2, &qword_268BBA560, &qword_268BBA550);
}

uint64_t sub_23C9843D8()
{
  return qword_268BBB4A0;
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityHostIdentifierKey.keyIndex.getter()
{
  return qword_268BBB4A8;
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityHostIdentifierKey.keyIndex.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_268BBB4A8 = a1;
  return result;
}

uint64_t (*static SceneSettingScopes.ActivitySettings.ActivityHostIdentifierKey.keyIndex.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityHostIdentifierKey.keyDescription.getter()
{
  return sub_23C95C244((uint64_t *)&unk_268BBB4B0);
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityHostIdentifierKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return sub_23C95C2A8(a1, a2, qword_268BBB4B0, &qword_268BBB4B0[1]);
}

uint64_t (*static SceneSettingScopes.ActivitySettings.ActivityHostIdentifierKey.keyDescription.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_23C984578(uint64_t a1, uint64_t a2)
{
  return sub_23C95C370(a1, a2, qword_268BBB4B0);
}

uint64_t sub_23C984588()
{
  return qword_268BBB4A8;
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityDescriptorKey.keyIndex.getter()
{
  return qword_268BBB4C0;
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityDescriptorKey.keyIndex.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_268BBB4C0 = a1;
  return result;
}

uint64_t (*static SceneSettingScopes.ActivitySettings.ActivityDescriptorKey.keyIndex.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityDescriptorKey.keyDescription.getter()
{
  return sub_23C95C244((uint64_t *)&unk_268BBB4C8);
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityDescriptorKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return sub_23C95C2A8(a1, a2, qword_268BBB4C8, &qword_268BBB4C8[1]);
}

uint64_t (*static SceneSettingScopes.ActivitySettings.ActivityDescriptorKey.keyDescription.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_23C984728(uint64_t a1, uint64_t a2)
{
  return sub_23C95C370(a1, a2, qword_268BBB4C8);
}

uint64_t sub_23C984738()
{
  return qword_268BBB4C0;
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityMetricsRequestKey.keyIndex.getter()
{
  return qword_268BBB4D8;
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityMetricsRequestKey.keyIndex.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_268BBB4D8 = a1;
  return result;
}

uint64_t (*static SceneSettingScopes.ActivitySettings.ActivityMetricsRequestKey.keyIndex.modify())()
{
  return j_j__swift_endAccess;
}

void sub_23C984860()
{
  unk_268BBA577 = -18;
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityMetricsRequestKey.keyDescription.getter()
{
  return sub_23C95B814(&qword_268BBA578, &qword_268BBA568);
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityMetricsRequestKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return sub_23C95B8AC(a1, a2, &qword_268BBA578, &qword_268BBA568, &unk_268BBA570);
}

uint64_t (*static SceneSettingScopes.ActivitySettings.ActivityMetricsRequestKey.keyDescription.modify())()
{
  if (qword_268BBA578 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_23C984968(uint64_t a1, uint64_t a2)
{
  return sub_23C95B9D8(a1, a2, &qword_268BBA578, &qword_268BBA568);
}

uint64_t sub_23C984990()
{
  return qword_268BBB4D8;
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityPayloadIDKey.keyIndex.getter()
{
  return qword_268BBB4E0;
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityPayloadIDKey.keyIndex.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_268BBB4E0 = a1;
  return result;
}

uint64_t (*static SceneSettingScopes.ActivitySettings.ActivityPayloadIDKey.keyIndex.modify())()
{
  return j_j__swift_endAccess;
}

void sub_23C984AB8()
{
  qword_268BBB4E8 = 0x4964616F6C796170;
  unk_268BBB4F0 = 0xE900000000000044;
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityPayloadIDKey.keyDescription.getter()
{
  return sub_23C95B814(&qword_268BBAA70, &qword_268BBB4E8);
}

uint64_t static SceneSettingScopes.ActivitySettings.ActivityPayloadIDKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return sub_23C95B8AC(a1, a2, &qword_268BBAA70, &qword_268BBB4E8, &qword_268BBB4F0);
}

uint64_t (*static SceneSettingScopes.ActivitySettings.ActivityPayloadIDKey.keyDescription.modify())()
{
  if (qword_268BBAA70 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_23C984BB8(uint64_t a1, uint64_t a2)
{
  return sub_23C95B9D8(a1, a2, &qword_268BBAA70, &qword_268BBB4E8);
}

uint64_t sub_23C984BE0()
{
  return qword_268BBB4E0;
}

uint64_t static SceneSettingScopes.ActivitySettings.WantsBaseContentTouchEventsKey.keyIndex.getter()
{
  return qword_268BBB4F8;
}

uint64_t static SceneSettingScopes.ActivitySettings.WantsBaseContentTouchEventsKey.keyIndex.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_268BBB4F8 = a1;
  return result;
}

uint64_t (*static SceneSettingScopes.ActivitySettings.WantsBaseContentTouchEventsKey.keyIndex.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t static SceneSettingScopes.ActivitySettings.WantsBaseContentTouchEventsKey.keyDescription.getter()
{
  return sub_23C95C244((uint64_t *)&unk_268BBB500);
}

uint64_t static SceneSettingScopes.ActivitySettings.WantsBaseContentTouchEventsKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  return sub_23C95C2A8(a1, a2, qword_268BBB500, &qword_268BBB500[1]);
}

uint64_t (*static SceneSettingScopes.ActivitySettings.WantsBaseContentTouchEventsKey.keyDescription.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_23C984D80(uint64_t a1, uint64_t a2)
{
  return sub_23C95C370(a1, a2, qword_268BBB500);
}

uint64_t sub_23C984D90()
{
  return qword_268BBB4F8;
}

uint64_t dispatch thunk of static AnySceneSetting.keyDescription.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static AnySceneSetting.keyIndex.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static AnySceneSetting.observe<A>(differ:call:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 24))();
}

ValueMetadata *type metadata accessor for SceneSettingScopes()
{
  return &type metadata for SceneSettingScopes;
}

ValueMetadata *type metadata accessor for SceneSettingScopes.ApplicationSettings()
{
  return &type metadata for SceneSettingScopes.ApplicationSettings;
}

ValueMetadata *type metadata accessor for SceneSettingScopes.ApplicationSettings.FrameKey()
{
  return &type metadata for SceneSettingScopes.ApplicationSettings.FrameKey;
}

ValueMetadata *type metadata accessor for SceneSettingScopes.ActivitySettings()
{
  return &type metadata for SceneSettingScopes.ActivitySettings;
}

ValueMetadata *type metadata accessor for SceneSettingScopes.ActivitySettings.ActivityIdentifierKey()
{
  return &type metadata for SceneSettingScopes.ActivitySettings.ActivityIdentifierKey;
}

ValueMetadata *type metadata accessor for SceneSettingScopes.ActivitySettings.ActivityMetricsKey()
{
  return &type metadata for SceneSettingScopes.ActivitySettings.ActivityMetricsKey;
}

ValueMetadata *type metadata accessor for SceneSettingScopes.ActivitySettings.ActivityHostIdentifierKey()
{
  return &type metadata for SceneSettingScopes.ActivitySettings.ActivityHostIdentifierKey;
}

ValueMetadata *type metadata accessor for SceneSettingScopes.ActivitySettings.ActivityDescriptorKey()
{
  return &type metadata for SceneSettingScopes.ActivitySettings.ActivityDescriptorKey;
}

ValueMetadata *type metadata accessor for SceneSettingScopes.ActivitySettings.ActivityMetricsRequestKey()
{
  return &type metadata for SceneSettingScopes.ActivitySettings.ActivityMetricsRequestKey;
}

ValueMetadata *type metadata accessor for SceneSettingScopes.ActivitySettings.ActivityPayloadIDKey()
{
  return &type metadata for SceneSettingScopes.ActivitySettings.ActivityPayloadIDKey;
}

ValueMetadata *type metadata accessor for SceneSettingScopes.ActivitySettings.WantsBaseContentTouchEventsKey()
{
  return &type metadata for SceneSettingScopes.ActivitySettings.WantsBaseContentTouchEventsKey;
}

ValueMetadata *type metadata accessor for SceneSettingDynamicLookup()
{
  return &type metadata for SceneSettingDynamicLookup;
}

uint64_t dispatch thunk of TypedSettings.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

{
  return (*(uint64_t (**)(void))(a5 + 32))();
}

uint64_t sub_23C984F8C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  id v8 = objc_msgSend(v4, sel_otherSettings);
  id v9 = objc_msgSend(v8, sel_objectForSetting_, (*(uint64_t (**)(uint64_t))(*(void *)(a2 + 8) + 16))(a1));

  if (v9)
  {
    sub_23C991270();
    swift_unknownObjectRelease();
    sub_23C95CAC4(&v13, v14);
  }
  else
  {
    memset(v14, 0, sizeof(v14));
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF22BA0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  int v11 = swift_dynamicCast();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56))(a3, v11 ^ 1u, 1, AssociatedTypeWitness);
}

uint64_t sub_23C9850DC@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_23C984F8C(*(void *)(*MEMORY[0x263F8EA20] + *a1 + 8), a2, a3);
}

id sub_23C985164()
{
  return sub_23C98542C(type metadata accessor for ActivitySceneSettings);
}

uint64_t type metadata accessor for ActivitySceneSettings()
{
  return self;
}

uint64_t sub_23C9851A0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_23C984F8C(a1, a2, a3);
}

uint64_t sub_23C9851C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23C984F88(a1, a3);
}

id sub_23C985204(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  v6.receiver = a1;
  v6.super_class = (Class)a4();
  return objc_msgSendSuper2(&v6, sel_initWithSettings_, a3);
}

id sub_23C985268(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  v4.receiver = a1;
  v4.super_class = (Class)a3();
  return objc_msgSendSuper2(&v4, sel_init);
}

id sub_23C9852C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  id v5 = objc_allocWithZone((Class)a4());
  return objc_msgSend(v5, sel_initWithSettings_, a1);
}

id sub_23C985324(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  if (sub_23C985494(a3))
  {
    (*(void (**)(void))(v7 + 8))();
LABEL_5:
    int v11 = (void *)sub_23C990FC0();
    swift_bridgeObjectRelease();
    goto LABEL_6;
  }
  v13.receiver = a1;
  v13.super_class = (Class)a4();
  id v8 = a1;
  id v9 = objc_msgSendSuper2(&v13, sel_keyDescriptionForSetting_, a3);
  if (v9)
  {
    uint64_t v10 = v9;
    sub_23C990FD0();

    goto LABEL_5;
  }

  int v11 = 0;
LABEL_6:
  return v11;
}

id sub_23C985414()
{
  return sub_23C98542C(type metadata accessor for ActivityMutableSceneSettings);
}

id sub_23C98542C(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for ActivityMutableSceneSettings()
{
  return self;
}

_UNKNOWN **sub_23C985488()
{
  return &protocol witness table for SceneSettingScopes.ActivitySettings;
}

ValueMetadata *sub_23C985494(uint64_t a1)
{
  if (qword_268BBB4A0 == a1) {
    return &type metadata for SceneSettingScopes.ActivitySettings.ActivityMetricsKey;
  }
  swift_beginAccess();
  if (qword_268BBB488 == a1) {
    return &type metadata for SceneSettingScopes.ActivitySettings.ActivityIdentifierKey;
  }
  swift_beginAccess();
  if (qword_268BBB4A8 == a1) {
    return &type metadata for SceneSettingScopes.ActivitySettings.ActivityHostIdentifierKey;
  }
  swift_beginAccess();
  if (qword_268BBB4C0 == a1) {
    return &type metadata for SceneSettingScopes.ActivitySettings.ActivityDescriptorKey;
  }
  swift_beginAccess();
  if (qword_268BBB4D8 == a1) {
    return &type metadata for SceneSettingScopes.ActivitySettings.ActivityMetricsRequestKey;
  }
  swift_beginAccess();
  if (qword_268BBB4E0 == a1) {
    return &type metadata for SceneSettingScopes.ActivitySettings.ActivityPayloadIDKey;
  }
  swift_beginAccess();
  if (qword_268BBB4F8 == a1) {
    return &type metadata for SceneSettingScopes.ActivitySettings.WantsBaseContentTouchEventsKey;
  }
  else {
    return 0;
  }
}

uint64_t ActivityTouchEvent.baseContentTouchedDown.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC18ActivityUIServices18ActivityTouchEvent_baseContentTouchedDown);
}

id ActivityTouchEvent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void ActivityTouchEvent.init()()
{
}

id ActivityTouchEvent.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityTouchEvent();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ActivityTouchEvent()
{
  return self;
}

uint64_t method lookup function for ActivityTouchEvent(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ActivityTouchEvent);
}

uint64_t JindoDemoAttributes.ContentState.config.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t JindoDemoAttributes.ContentState.config.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *id v1 = a1;
  return result;
}

uint64_t (*JindoDemoAttributes.ContentState.config.modify())()
{
  return CGSizeMake;
}

ActivityUIServices::JindoDemoAttributes::ContentState __swiftcall JindoDemoAttributes.ContentState.init(config:)(ActivityUIServices::JindoDemoAttributes::ContentState config)
{
  v1->config._rawValue = config.config._rawValue;
  return config;
}

uint64_t JindoDemoAttributes.ContentState.hash(into:)(uint64_t a1)
{
  uint64_t v3 = *v1;
  swift_bridgeObjectRetain();
  sub_23C9864E0(a1, v3);
  return swift_bridgeObjectRelease();
}

uint64_t static JindoDemoAttributes.ContentState.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  return sub_23C985844(*a1, *a2);
}

uint64_t sub_23C985844(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  uint64_t v3 = result;
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v4 = 0;
  uint64_t v5 = result + 64;
  uint64_t v6 = 1 << *(unsigned char *)(result + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(result + 64);
  int64_t v27 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      unint64_t v9 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v10 = v9 | (v4 << 6);
      goto LABEL_25;
    }
    int64_t v11 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_36;
    }
    if (v11 >= v27) {
      return 1;
    }
    unint64_t v12 = *(void *)(v5 + 8 * v11);
    ++v4;
    if (!v12)
    {
      int64_t v4 = v11 + 1;
      if (v11 + 1 >= v27) {
        return 1;
      }
      unint64_t v12 = *(void *)(v5 + 8 * v4);
      if (!v12)
      {
        int64_t v4 = v11 + 2;
        if (v11 + 2 >= v27) {
          return 1;
        }
        unint64_t v12 = *(void *)(v5 + 8 * v4);
        if (!v12)
        {
          int64_t v4 = v11 + 3;
          if (v11 + 3 >= v27) {
            return 1;
          }
          unint64_t v12 = *(void *)(v5 + 8 * v4);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_24:
    unint64_t v8 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v4 << 6);
LABEL_25:
    uint64_t v14 = 16 * v10;
    uint64_t v15 = (uint64_t *)(*(void *)(v3 + 48) + v14);
    uint64_t v16 = *v15;
    uint64_t v17 = v15[1];
    id v18 = (uint64_t *)(*(void *)(v3 + 56) + v14);
    uint64_t v20 = *v18;
    uint64_t v19 = v18[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v21 = sub_23C973B6C(v16, v17);
    char v23 = v22;
    swift_bridgeObjectRelease();
    if ((v23 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
    uint64_t v24 = (void *)(*(void *)(a2 + 56) + 16 * v21);
    if (*v24 == v20 && v24[1] == v19)
    {
      uint64_t result = swift_bridgeObjectRelease();
    }
    else
    {
      char v26 = sub_23C9914F0();
      uint64_t result = swift_bridgeObjectRelease();
      if ((v26 & 1) == 0) {
        return 0;
      }
    }
  }
  int64_t v13 = v11 + 4;
  if (v13 >= v27) {
    return 1;
  }
  unint64_t v12 = *(void *)(v5 + 8 * v13);
  if (v12)
  {
    int64_t v4 = v13;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v4 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v4 >= v27) {
      return 1;
    }
    unint64_t v12 = *(void *)(v5 + 8 * v4);
    ++v13;
    if (v12) {
      goto LABEL_24;
    }
  }
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_23C985A70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_23C986CE0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23C985A9C(uint64_t a1)
{
  unint64_t v2 = sub_23C9866A8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_23C985AD8(uint64_t a1)
{
  unint64_t v2 = sub_23C9866A8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t JindoDemoAttributes.ContentState.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBB518);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v1;
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_23C9866A8();
  sub_23C991660();
  v9[1] = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BBB528);
  sub_23C9866FC(&qword_268BBB530);
  sub_23C9914B0();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t JindoDemoAttributes.ContentState.hashValue.getter()
{
  uint64_t v1 = *v0;
  sub_23C9915C0();
  swift_bridgeObjectRetain();
  sub_23C9864E0((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_23C991620();
}

uint64_t JindoDemoAttributes.ContentState.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBB538);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_23C9866A8();
  sub_23C991650();
  if (!v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BBB528);
    sub_23C9866FC(&qword_268BBB540);
    sub_23C991480();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10[1];
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_23C985E7C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return JindoDemoAttributes.ContentState.init(from:)(a1, a2);
}

uint64_t sub_23C985E94(void *a1)
{
  return JindoDemoAttributes.ContentState.encode(to:)(a1);
}

uint64_t sub_23C985EAC()
{
  uint64_t v1 = *v0;
  sub_23C9915C0();
  swift_bridgeObjectRetain();
  sub_23C9864E0((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_23C991620();
}

uint64_t sub_23C985F04(uint64_t a1)
{
  uint64_t v3 = *v1;
  swift_bridgeObjectRetain();
  sub_23C9864E0(a1, v3);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C985F50()
{
  uint64_t v1 = *v0;
  sub_23C9915C0();
  swift_bridgeObjectRetain();
  sub_23C9864E0((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_23C991620();
}

uint64_t sub_23C985FA4(uint64_t *a1, uint64_t *a2)
{
  return sub_23C985844(*a1, *a2);
}

uint64_t JindoDemoAttributes.selection.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t JindoDemoAttributes.selection.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*JindoDemoAttributes.selection.modify())()
{
  return CGSizeMake;
}

ActivityUIServices::JindoDemoAttributes __swiftcall JindoDemoAttributes.init(selection:)(ActivityUIServices::JindoDemoAttributes selection)
{
  *uint64_t v1 = selection;
  return selection;
}

uint64_t sub_23C986044@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_23C986D74(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23C986070(uint64_t a1)
{
  unint64_t v2 = sub_23C986760();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_23C9860AC(uint64_t a1)
{
  unint64_t v2 = sub_23C986760();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t JindoDemoAttributes.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBB548);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_23C986760();
  sub_23C991660();
  sub_23C991490();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t JindoDemoAttributes.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBB558);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_23C986760();
  sub_23C991650();
  if (!v2)
  {
    uint64_t v9 = sub_23C991460();
    uint64_t v11 = v10;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
    a2[1] = v11;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_23C986390@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return JindoDemoAttributes.init(from:)(a1, a2);
}

uint64_t sub_23C9863A8(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BBB548);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_23C986760();
  sub_23C991660();
  sub_23C991490();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_23C9864E0(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = a2 + 64;
  uint64_t v2 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v3 = -1;
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  uint64_t v4 = v3 & *(void *)(a2 + 64);
  int64_t v5 = (unint64_t)(v2 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v7 = 0;
  int64_t v8 = 0;
  while (1)
  {
    if (v4)
    {
      v4 &= v4 - 1;
      goto LABEL_5;
    }
    int64_t v9 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_21;
    }
    if (v9 >= v5) {
      goto LABEL_19;
    }
    uint64_t v10 = *(void *)(v12 + 8 * v9);
    ++v8;
    if (!v10)
    {
      int64_t v8 = v9 + 1;
      if (v9 + 1 >= v5) {
        goto LABEL_19;
      }
      uint64_t v10 = *(void *)(v12 + 8 * v8);
      if (!v10) {
        break;
      }
    }
LABEL_18:
    uint64_t v4 = (v10 - 1) & v10;
LABEL_5:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_23C990FF0();
    swift_bridgeObjectRelease();
    sub_23C990FF0();
    swift_bridgeObjectRelease();
    uint64_t result = sub_23C991620();
    v7 ^= result;
  }
  int64_t v11 = v9 + 2;
  if (v11 >= v5)
  {
LABEL_19:
    swift_release();
    return sub_23C9915D0();
  }
  uint64_t v10 = *(void *)(v12 + 8 * v11);
  if (v10)
  {
    int64_t v8 = v11;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v8 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      break;
    }
    if (v8 >= v5) {
      goto LABEL_19;
    }
    uint64_t v10 = *(void *)(v12 + 8 * v8);
    ++v11;
    if (v10) {
      goto LABEL_18;
    }
  }
LABEL_21:
  __break(1u);
  return result;
}

unint64_t sub_23C9866A8()
{
  unint64_t result = qword_268BBB520;
  if (!qword_268BBB520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBB520);
  }
  return result;
}

uint64_t sub_23C9866FC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BBB528);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23C986760()
{
  unint64_t result = qword_268BBB550;
  if (!qword_268BBB550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBB550);
  }
  return result;
}

unint64_t sub_23C9867B8()
{
  unint64_t result = qword_268BBB560;
  if (!qword_268BBB560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBB560);
  }
  return result;
}

unint64_t sub_23C986810()
{
  unint64_t result = qword_268BBB568;
  if (!qword_268BBB568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBB568);
  }
  return result;
}

unint64_t sub_23C986868()
{
  unint64_t result = qword_268BBB570;
  if (!qword_268BBB570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBB570);
  }
  return result;
}

unint64_t sub_23C9868C0()
{
  unint64_t result = qword_268BBB578;
  if (!qword_268BBB578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBB578);
  }
  return result;
}

unint64_t sub_23C986918()
{
  unint64_t result = qword_268BBB580;
  if (!qword_268BBB580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBB580);
  }
  return result;
}

unint64_t sub_23C986970()
{
  unint64_t result = qword_268BBB588;
  if (!qword_268BBB588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBB588);
  }
  return result;
}

ValueMetadata *type metadata accessor for JindoDemoAttributes()
{
  return &type metadata for JindoDemoAttributes;
}

ValueMetadata *type metadata accessor for JindoDemoAttributes.ContentState()
{
  return &type metadata for JindoDemoAttributes.ContentState;
}

ValueMetadata *type metadata accessor for JindoDemoAttributes.CodingKeys()
{
  return &type metadata for JindoDemoAttributes.CodingKeys;
}

unsigned char *_s18ActivityUIServices19JindoDemoAttributesV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x23C986A98);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for JindoDemoAttributes.ContentState.CodingKeys()
{
  return &type metadata for JindoDemoAttributes.ContentState.CodingKeys;
}

unint64_t sub_23C986AD4()
{
  unint64_t result = qword_268BBB590;
  if (!qword_268BBB590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBB590);
  }
  return result;
}

unint64_t sub_23C986B2C()
{
  unint64_t result = qword_268BBB598;
  if (!qword_268BBB598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBB598);
  }
  return result;
}

unint64_t sub_23C986B84()
{
  unint64_t result = qword_268BBB5A0;
  if (!qword_268BBB5A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBB5A0);
  }
  return result;
}

unint64_t sub_23C986BDC()
{
  unint64_t result = qword_268BBB5A8;
  if (!qword_268BBB5A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBB5A8);
  }
  return result;
}

unint64_t sub_23C986C34()
{
  unint64_t result = qword_268BBB5B0;
  if (!qword_268BBB5B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBB5B0);
  }
  return result;
}

unint64_t sub_23C986C8C()
{
  unint64_t result = qword_268BBB5B8;
  if (!qword_268BBB5B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBB5B8);
  }
  return result;
}

uint64_t sub_23C986CE0(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6769666E6F63 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_23C9914F0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23C986D60()
{
  return 0x6769666E6F63;
}

uint64_t sub_23C986D74(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6F697463656C6573 && a2 == 0xE90000000000006ELL)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_23C9914F0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23C986E04()
{
  return 0x6F697463656C6573;
}

BOOL ActivityAlertAction.init(rawValue:)(uint64_t a1)
{
  return a1 && a1 == 1;
}

void *sub_23C986E48@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2 = *result != 1 && *result != 0;
  *(void *)a2 = *result == 1;
  *(unsigned char *)(a2 + 8) = v2;
  return result;
}

uint64_t ActivityAlertAction.description.getter(uint64_t a1)
{
  if (!a1) {
    return 0x746E6573657270;
  }
  if (a1 == 1) {
    return 0x7373696D736964;
  }
  uint64_t result = sub_23C991500();
  __break(1u);
  return result;
}

unint64_t sub_23C986EEC()
{
  unint64_t result = qword_268BBB5C0;
  if (!qword_268BBB5C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBB5C0);
  }
  return result;
}

uint64_t sub_23C986F40()
{
  return ActivityAlertAction.description.getter(*v0);
}

ValueMetadata *type metadata accessor for ActivityAlertAction()
{
  return &type metadata for ActivityAlertAction;
}

id sub_23C986F68()
{
  return *(id *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest);
}

void sub_23C986F84(void *a1)
{
}

uint64_t (*sub_23C986F90(void *a1))()
{
  char v3 = malloc(0x40uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest;
  v3[6] = v1;
  v3[7] = v4;
  uint64_t v5 = *(void **)(v1 + v4);
  v3[4] = v5;
  id v6 = v5;
  return sub_23C987000;
}

id sub_23C987014()
{
  return *(id *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__heightRequest);
}

void sub_23C987030(void *a1, uint64_t a2, void *a3, uint64_t *a4)
{
  id v6 = a3;
  uint64_t v7 = a1;
  objc_msgSend(v6, sel_copy);
  sub_23C991270();
  swift_unknownObjectRelease();
  type metadata accessor for SizeDimensionRequest();
  swift_dynamicCast();
  uint64_t v8 = *a4;
  int64_t v9 = *(void **)&v7[*a4];
  *(void *)&v7[v8] = v10;
}

void sub_23C9870DC(void *a1)
{
}

void sub_23C9870E8(void *a1, uint64_t *a2)
{
  objc_msgSend(a1, sel_copy);
  sub_23C991270();
  swift_unknownObjectRelease();
  type metadata accessor for SizeDimensionRequest();
  swift_dynamicCast();
  uint64_t v5 = *a2;
  id v6 = *(void **)(v2 + *a2);
  *(void *)(v2 + v5) = v7;
}

void sub_23C98717C(id *a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v6 = *a2;
  id v7 = *a1;
  objc_msgSend(v7, sel_copy);
  sub_23C991270();
  swift_unknownObjectRelease();
  type metadata accessor for SizeDimensionRequest();
  swift_dynamicCast();
  uint64_t v8 = *a5;
  int64_t v9 = *(void **)(v6 + *a5);
  *(void *)(v6 + v8) = v10;
}

uint64_t (*sub_23C98721C(void *a1))()
{
  char v3 = malloc(0x40uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__heightRequest;
  v3[6] = v1;
  v3[7] = v4;
  uint64_t v5 = *(void **)(v1 + v4);
  v3[4] = v5;
  id v6 = v5;
  return sub_23C987000;
}

void sub_23C98728C(uint64_t *a1, char a2)
{
  uint64_t v2 = *a1;
  char v3 = *(void **)(*a1 + 32);
  uint64_t v5 = *(void *)(*a1 + 48);
  uint64_t v4 = *(void *)(*a1 + 56);
  if (a2)
  {
    id v6 = v3;
    objc_msgSend(v6, sel_copy);
    sub_23C991270();
    swift_unknownObjectRelease();
    type metadata accessor for SizeDimensionRequest();
    swift_dynamicCast();
    id v7 = *(void **)(v5 + v4);
    *(void *)(v5 + v4) = *(void *)(v2 + 40);
  }
  else
  {
    objc_msgSend(*(id *)(*a1 + 32), sel_copy);
    sub_23C991270();
    swift_unknownObjectRelease();
    type metadata accessor for SizeDimensionRequest();
    swift_dynamicCast();
    uint64_t v8 = *(void **)(v5 + v4);
    *(void *)(v5 + v4) = *(void *)(v2 + 40);
  }
  free((void *)v2);
}

double sub_23C9873FC()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_cornerRadius;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_23C987498(double a1)
{
  char v3 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_cornerRadius);
  uint64_t result = swift_beginAccess();
  *char v3 = a1;
  return result;
}

uint64_t (*sub_23C9874EC())()
{
  return j_j__swift_endAccess;
}

double sub_23C987590()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_clipMargin;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_23C98762C(double a1)
{
  char v3 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_clipMargin);
  uint64_t result = swift_beginAccess();
  *char v3 = a1;
  return result;
}

uint64_t (*sub_23C987680())()
{
  return j__swift_endAccess;
}

double sub_23C987724()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_scaleFactor;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_23C9877C0(double a1)
{
  char v3 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_scaleFactor);
  uint64_t result = swift_beginAccess();
  *char v3 = a1;
  return result;
}

uint64_t (*sub_23C987814())()
{
  return j_j__swift_endAccess;
}

void *sub_23C9878BC()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_watchDisplayVariant);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_23C98796C(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_watchDisplayVariant);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = a1;
}

void sub_23C9879C0(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  id v3 = (void **)(*a2 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_watchDisplayVariant);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = v2;
  id v5 = v2;
}

uint64_t (*sub_23C987A24())()
{
  return j_j__swift_endAccess;
}

void *sub_23C987A90()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__edgeInsets);
  id v2 = v1;
  return v1;
}

void sub_23C987B1C(void *a1)
{
  sub_23C989C10(a1);
}

void (*sub_23C987B54(void *a1))(uint64_t a1, char a2)
{
  id v3 = malloc(0x40uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__edgeInsets;
  v3[6] = v1;
  v3[7] = v4;
  id v5 = *(void **)(v1 + v4);
  v3[4] = v5;
  id v6 = v5;
  return sub_23C987BC4;
}

void sub_23C987BC4(uint64_t a1, char a2)
{
  id v2 = *(void **)a1;
  id v3 = *(void **)(*(void *)a1 + 32);
  if (a2)
  {
    if (v3)
    {
      objc_msgSend(v3, sel_copy);
      sub_23C991270();
      swift_unknownObjectRelease();
      type metadata accessor for ActivityEdgeInsets();
      int v4 = swift_dynamicCast();
      uint64_t v5 = v2[5];
      if (!v4) {
        uint64_t v5 = 0;
      }
    }
    else
    {
      uint64_t v5 = 0;
    }
    uint64_t v9 = v2[6];
    uint64_t v8 = v2[7];
    uint64_t v10 = *(void **)(v9 + v8);
    *(void *)(v9 + v8) = v5;

    int64_t v11 = (void *)v2[4];
  }
  else
  {
    if (v3)
    {
      objc_msgSend(*(id *)(*(void *)a1 + 32), sel_copy);
      sub_23C991270();
      swift_unknownObjectRelease();
      type metadata accessor for ActivityEdgeInsets();
      int v6 = swift_dynamicCast();
      uint64_t v7 = v2[5];
      if (!v6) {
        uint64_t v7 = 0;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
    uint64_t v13 = v2[6];
    uint64_t v12 = v2[7];
    int64_t v11 = *(void **)(v13 + v12);
    *(void *)(v13 + v12) = v7;
  }
  free(v2);
}

double sub_23C987D2C()
{
  double v1 = *(double *)(*(void *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest)
                 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum);
  id v2 = (double *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_scaleFactor);
  swift_beginAccess();
  return v1 * *v2;
}

double sub_23C987EA4()
{
  double v1 = *(double *)(*(void *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest)
                 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum);
  id v2 = (double *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_scaleFactor);
  swift_beginAccess();
  return v1 * *v2;
}

unint64_t sub_23C987F34(char a1)
{
  unint64_t result = 0xD000000000000013;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x746867696568;
      break;
    case 2:
      unint64_t result = 0x615272656E726F63;
      break;
    case 3:
      unint64_t result = 0x65736E4965676465;
      break;
    case 4:
      unint64_t result = 0x6772614D70696C63;
      break;
    case 5:
      unint64_t result = 0x636146656C616373;
      break;
    case 6:
      return result;
    default:
      unint64_t result = 0x6874646977;
      break;
  }
  return result;
}

id ActivityItemMetricsRequest.__allocating_init(width:height:cornerRadius:)(void *a1, void *a2, double a3)
{
  id v6 = objc_msgSend(objc_allocWithZone(v3), sel_initWithWidth_height_cornerRadius_edgeInsets_clipMargin_scaleFactor_, a1, a2, 0, a3, 0.0, 1.0);

  return v6;
}

id ActivityItemMetricsRequest.init(width:height:cornerRadius:)(void *a1, void *a2, double a3)
{
  id v6 = objc_msgSend(v3, sel_initWithWidth_height_cornerRadius_edgeInsets_clipMargin_scaleFactor_, a1, a2, 0, a3, 0.0, 1.0);

  return v6;
}

id ActivityItemMetricsRequest.__allocating_init(width:height:cornerRadius:watchDisplayVariant:)(void *a1, void *a2, void *a3, double a4)
{
  id v8 = objc_msgSend(objc_allocWithZone(v4), sel_initWithWidth_height_cornerRadius_edgeInsets_clipMargin_scaleFactor_watchDisplayVariant_, a1, a2, 0, a3, a4, 0.0, 1.0);

  return v8;
}

id ActivityItemMetricsRequest.init(width:height:cornerRadius:watchDisplayVariant:)(void *a1, void *a2, void *a3, double a4)
{
  id v8 = objc_msgSend(v4, sel_initWithWidth_height_cornerRadius_edgeInsets_clipMargin_scaleFactor_watchDisplayVariant_, a1, a2, 0, a3, a4, 0.0, 1.0);

  return v8;
}

id ActivityItemMetricsRequest.__allocating_init(width:height:cornerRadius:edgeInsets:)(void *a1, void *a2, void *a3, double a4)
{
  id v8 = objc_msgSend(objc_allocWithZone(v4), sel_initWithWidth_height_cornerRadius_edgeInsets_clipMargin_scaleFactor_, a1, a2, a3, a4, 0.0, 1.0);

  return v8;
}

id ActivityItemMetricsRequest.init(width:height:cornerRadius:edgeInsets:)(void *a1, void *a2, void *a3, double a4)
{
  id v8 = objc_msgSend(v4, sel_initWithWidth_height_cornerRadius_edgeInsets_clipMargin_scaleFactor_, a1, a2, a3, a4, 0.0, 1.0);

  return v8;
}

id ActivityItemMetricsRequest.__allocating_init(width:height:cornerRadius:edgeInsets:clipMargin:)(void *a1, void *a2, void *a3, double a4, double a5)
{
  id v9 = objc_msgSend(objc_allocWithZone(v5), sel_initWithWidth_height_cornerRadius_edgeInsets_clipMargin_scaleFactor_, a1, a2, a3, a4, a5, 1.0);

  return v9;
}

id ActivityItemMetricsRequest.init(width:height:cornerRadius:edgeInsets:clipMargin:)(void *a1, void *a2, void *a3, double a4, double a5)
{
  id v9 = objc_msgSend(v5, sel_initWithWidth_height_cornerRadius_edgeInsets_clipMargin_scaleFactor_, a1, a2, a3, a4, a5, 1.0);

  return v9;
}

id ActivityItemMetricsRequest.__allocating_init(width:height:cornerRadius:edgeInsets:clipMargin:scaleFactor:)(void *a1, void *a2, void *a3, double a4, double a5, double a6)
{
  id v10 = objc_msgSend(objc_allocWithZone(v6), sel_initWithWidth_height_cornerRadius_edgeInsets_clipMargin_scaleFactor_watchDisplayVariant_, a1, a2, a3, 0, a4, a5, a6);

  return v10;
}

id ActivityItemMetricsRequest.init(width:height:cornerRadius:edgeInsets:clipMargin:scaleFactor:)(void *a1, void *a2, void *a3)
{
  id v7 = objc_msgSend(v3, sel_initWithWidth_height_cornerRadius_edgeInsets_clipMargin_scaleFactor_watchDisplayVariant_, a1, a2, a3, 0);

  return v7;
}

id ActivityItemMetricsRequest.__allocating_init(width:height:cornerRadius:edgeInsets:clipMargin:scaleFactor:watchDisplayVariant:)(void *a1, void *a2, void *a3, void *a4, double a5, double a6, double a7)
{
  id v15 = objc_allocWithZone(v7);
  id v16 = sub_23C989CA8(a1, a2, a3, a4, a5, a6, a7);

  return v16;
}

id ActivityItemMetricsRequest.init(width:height:cornerRadius:edgeInsets:clipMargin:scaleFactor:watchDisplayVariant:)(void *a1, void *a2, void *a3, void *a4, double a5, double a6, double a7)
{
  id v11 = sub_23C989CA8(a1, a2, a3, a4, a5, a6, a7);

  return v11;
}

BOOL sub_23C9886C8()
{
  if (*(double *)(*(void *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest)
                 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum) != 0.0
    || *(double *)(*(void *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__heightRequest)
                 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum) != 0.0)
  {
    return 1;
  }
  double v1 = (double *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_cornerRadius);
  swift_beginAccess();
  return *v1 != 0.0;
}

uint64_t sub_23C9887BC()
{
  uint64_t v1 = v0;
  sub_23C991630();
  id v2 = *(id *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest);
  sub_23C991210();

  id v3 = *(id *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__heightRequest);
  sub_23C991210();

  swift_beginAccess();
  sub_23C991600();
  int v4 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__edgeInsets);
  sub_23C9915E0();
  if (v4)
  {
    id v5 = v4;
    sub_23C991210();
  }
  swift_beginAccess();
  sub_23C991600();
  swift_beginAccess();
  sub_23C991600();
  id v6 = (id *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_watchDisplayVariant);
  swift_beginAccess();
  if (*v6)
  {
    objc_msgSend(*v6, sel_integerValue);
    sub_23C9915E0();
    sub_23C9915D0();
  }
  else
  {
    sub_23C9915E0();
  }
  return sub_23C991610();
}

uint64_t sub_23C988998(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_23C9523D4(a1, (uint64_t)v36);
  if (!v37)
  {
    sub_23C952480((uint64_t)v36);
    goto LABEL_18;
  }
  type metadata accessor for ActivityItemMetricsRequest();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_18:
    char v32 = 0;
    return v32 & 1;
  }
  sub_23C959038(0, (unint64_t *)&qword_26AF22810);
  id v3 = *(void **)&v35[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest];
  id v4 = *(id *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest);
  id v5 = v3;
  char v6 = sub_23C991200();

  if ((v6 & 1) == 0) {
    goto LABEL_17;
  }
  id v7 = *(void **)&v35[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__heightRequest];
  id v8 = *(id *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__heightRequest);
  id v9 = v7;
  char v10 = sub_23C991200();

  if ((v10 & 1) == 0) {
    goto LABEL_17;
  }
  id v11 = (double *)(v2 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_cornerRadius);
  swift_beginAccess();
  double v12 = *v11;
  uint64_t v13 = (double *)&v35[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_cornerRadius];
  swift_beginAccess();
  if (v12 != *v13) {
    goto LABEL_17;
  }
  uint64_t v14 = *(void **)(v2 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__edgeInsets);
  id v15 = *(void **)&v35[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__edgeInsets];
  if (v14)
  {
    if (!v15) {
      goto LABEL_17;
    }
    type metadata accessor for ActivityEdgeInsets();
    id v16 = v15;
    id v17 = v14;
    char v18 = sub_23C991200();

    if ((v18 & 1) == 0) {
      goto LABEL_17;
    }
  }
  else if (v15)
  {
LABEL_17:

    goto LABEL_18;
  }
  uint64_t v19 = (double *)(v2 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_clipMargin);
  swift_beginAccess();
  double v20 = *v19;
  unint64_t v21 = (double *)&v35[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_clipMargin];
  swift_beginAccess();
  if (v20 != *v21) {
    goto LABEL_17;
  }
  char v22 = (double *)(v2 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_scaleFactor);
  swift_beginAccess();
  double v23 = *v22;
  uint64_t v24 = (double *)&v35[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_scaleFactor];
  swift_beginAccess();
  if (v23 != *v24) {
    goto LABEL_17;
  }
  char v25 = (void **)(v2 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_watchDisplayVariant);
  swift_beginAccess();
  char v26 = *v25;
  int64_t v27 = (void **)&v35[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_watchDisplayVariant];
  swift_beginAccess();
  uint64_t v28 = *v27;
  if (!v26)
  {
    id v34 = v28;

    if (!v28)
    {
      char v32 = 1;
      return v32 & 1;
    }

    goto LABEL_18;
  }
  if (!v28) {
    goto LABEL_17;
  }
  sub_23C959038(0, &qword_268BBA5F8);
  id v29 = v26;
  id v30 = v28;
  id v31 = v29;
  char v32 = sub_23C991200();

  return v32 & 1;
}

id sub_23C988DA0()
{
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29C40]), sel_initWithObject_, v0);
  if (result)
  {
    uint64_t v2 = result;
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest);
    id v4 = (void *)sub_23C990FC0();

    id v5 = *(id *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__heightRequest);
    char v6 = (void *)sub_23C990FC0();

    id v7 = (double *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_cornerRadius);
    swift_beginAccess();
    double v8 = *v7;
    id v9 = (void *)sub_23C990FC0();

    id v10 = *(id *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__edgeInsets);
    id v11 = (void *)sub_23C990FC0();

    double v12 = (double *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_clipMargin);
    swift_beginAccess();
    double v13 = *v12;
    uint64_t v14 = (void *)sub_23C990FC0();

    id v15 = (double *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_scaleFactor);
    swift_beginAccess();
    double v16 = *v15;
    id v17 = (void *)sub_23C990FC0();

    char v18 = (id *)(v0 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_watchDisplayVariant);
    swift_beginAccess();
    id v19 = *v18;
    double v20 = (void *)sub_23C990FC0();

    id result = objc_msgSend(v2, sel_build);
    if (result)
    {
      unint64_t v21 = result;
      uint64_t v22 = sub_23C990FD0();

      return (id)v22;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_23C989104(void *a1)
{
  if (a1)
  {
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
    id v3 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__edgeInsets);
    if (v3)
    {
      id v4 = v3;
      id v5 = objc_msgSend(v4, sel_bs_secureEncoded);
      if (v5)
      {
        uint64_t v6 = sub_23C990BF0();
        unint64_t v8 = v7;

        id v5 = (id)sub_23C990BE0();
        sub_23C95CAD4(v6, v8);
      }
      BSSerializeDataToXPCDictionaryWithKey();
    }
    swift_beginAccess();
    BSSerializeDoubleToXPCDictionaryWithKey();
    swift_beginAccess();
    BSSerializeDoubleToXPCDictionaryWithKey();
    swift_beginAccess();
    BSSerializeDoubleToXPCDictionaryWithKey();
    id v9 = (id *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_watchDisplayVariant);
    swift_beginAccess();
    if (*v9)
    {
      id v10 = *v9;
      xpc_dictionary_set_int64(a1, "watchDisplayVariant", (int64_t)objc_msgSend(v10, sel_longLongValue));
    }
  }
}

id ActivityItemMetricsRequest.__allocating_init(xpcDictionary:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = sub_23C989F0C(a1);
  swift_unknownObjectRelease();
  return v4;
}

id ActivityItemMetricsRequest.init(xpcDictionary:)(void *a1)
{
  id v1 = sub_23C989F0C(a1);
  swift_unknownObjectRelease();
  return v1;
}

void sub_23C98940C(void *a1@<X8>)
{
  id v3 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest);
  id v4 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__heightRequest);
  id v5 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_cornerRadius);
  swift_beginAccess();
  double v6 = *v5;
  unint64_t v7 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__edgeInsets);
  unint64_t v8 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_clipMargin);
  swift_beginAccess();
  double v9 = *v8;
  id v10 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_scaleFactor);
  swift_beginAccess();
  double v11 = *v10;
  double v12 = (void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_watchDisplayVariant);
  swift_beginAccess();
  double v13 = *v12;
  uint64_t v14 = (objc_class *)type metadata accessor for ActivityItemMetricsRequest();
  objc_allocWithZone(v14);
  id v15 = v13;
  id v16 = v3;
  id v17 = v4;
  id v18 = v7;
  id v19 = sub_23C989CA8(v16, v17, v7, v13, v6, v9, v11);

  a1[3] = v14;
  *a1 = v19;
}

uint64_t static ActivityItemMetricsRequest.supportsSecureCoding.getter()
{
  return 1;
}

void sub_23C9895F8(void *a1)
{
  id v3 = *(id *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest);
  id v4 = (void *)sub_23C990FC0();
  objc_msgSend(a1, sel_encodeObject_forKey_, v3, v4);

  id v5 = *(id *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__heightRequest);
  double v6 = (void *)sub_23C990FC0();
  objc_msgSend(a1, sel_encodeObject_forKey_, v5, v6);

  unint64_t v7 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_cornerRadius);
  swift_beginAccess();
  double v8 = *v7;
  double v9 = (void *)sub_23C990FC0();
  objc_msgSend(a1, sel_encodeDouble_forKey_, v9, v8);

  id v10 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_clipMargin);
  swift_beginAccess();
  double v11 = *v10;
  double v12 = (void *)sub_23C990FC0();
  objc_msgSend(a1, sel_encodeDouble_forKey_, v12, v11);

  double v13 = (double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_scaleFactor);
  swift_beginAccess();
  double v14 = *v13;
  id v15 = (void *)sub_23C990FC0();
  objc_msgSend(a1, sel_encodeDouble_forKey_, v15, v14);

  id v16 = (id *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_watchDisplayVariant);
  swift_beginAccess();
  if (*v16)
  {
    id v17 = *v16;
    id v18 = (void *)sub_23C990FC0();
    objc_msgSend(a1, sel_encodeObject_forKey_, v17, v18);
  }
  id v19 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__edgeInsets);
  if (v19)
  {
    id v20 = v19;
    unint64_t v21 = (void *)sub_23C990FC0();
    objc_msgSend(a1, sel_encodeObject_forKey_, v20, v21);
  }
}

id ActivityItemMetricsRequest.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = sub_23C98A31C(a1);

  return v4;
}

id ActivityItemMetricsRequest.init(coder:)(void *a1)
{
  id v2 = sub_23C98A31C(a1);

  return v2;
}

id ActivityItemMetricsRequest.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void ActivityItemMetricsRequest.init()()
{
}

id ActivityItemMetricsRequest.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityItemMetricsRequest();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_23C989B04()
{
  uint64_t v0 = (objc_class *)type metadata accessor for SizeDimensionRequest();
  id v1 = (char *)objc_allocWithZone(v0);
  *(void *)&v1[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum] = 0;
  *(void *)&v1[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum] = 0;
  *(void *)&v1[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type] = 1;
  v8.receiver = v1;
  v8.super_class = v0;
  id v2 = objc_msgSendSuper2(&v8, sel_init);
  id v3 = (char *)objc_allocWithZone(v0);
  *(void *)&v3[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum] = 0;
  *(void *)&v3[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum] = 0;
  *(void *)&v3[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type] = 1;
  v7.receiver = v3;
  v7.super_class = v0;
  id v4 = objc_msgSendSuper2(&v7, sel_init);
  id v5 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ActivityItemMetricsRequest()), sel_initWithWidth_height_cornerRadius_edgeInsets_clipMargin_scaleFactor_watchDisplayVariant_, v2, v4, 0, 0, 0.0, 0.0, 1.0);

  return v5;
}

void sub_23C989C10(void *a1)
{
  if (a1)
  {
    objc_msgSend(a1, sel_copy);
    sub_23C991270();
    swift_unknownObjectRelease();
    type metadata accessor for ActivityEdgeInsets();
    int v2 = swift_dynamicCast();
    uint64_t v3 = v5;
    if (!v2) {
      uint64_t v3 = 0;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__edgeInsets);
  *(void *)(v1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__edgeInsets) = v3;
}

id sub_23C989CA8(void *a1, void *a2, void *a3, void *a4, double a5, double a6, double a7)
{
  double v13 = (double *)&v7[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_clipMargin];
  *(void *)&v7[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_clipMargin] = 0;
  double v14 = (double *)&v7[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_scaleFactor];
  *(void *)&v7[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_scaleFactor] = 0x3FF0000000000000;
  id v15 = (void **)&v7[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_watchDisplayVariant];
  *(void *)&v7[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_watchDisplayVariant] = 0;
  uint64_t v16 = OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__edgeInsets;
  *(void *)&v7[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__edgeInsets] = 0;
  id v17 = v7;
  objc_msgSend(a1, sel_copy);
  sub_23C991270();
  swift_unknownObjectRelease();
  type metadata accessor for SizeDimensionRequest();
  swift_dynamicCast();
  *(void *)&v17[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest] = v26;
  objc_msgSend(a2, sel_copy);
  sub_23C991270();
  swift_unknownObjectRelease();
  swift_dynamicCast();
  *(void *)&v17[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__heightRequest] = v26;
  if (a3)
  {
    objc_msgSend(a3, sel_copy);
    sub_23C991270();
    swift_unknownObjectRelease();
    type metadata accessor for ActivityEdgeInsets();
    swift_dynamicCast();
    uint64_t v18 = v26;
  }
  else
  {
    uint64_t v18 = 0;
  }
  id v19 = *(void **)&v7[v16];
  *(void *)&v7[v16] = v18;

  *(double *)&v17[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_cornerRadius] = a5;
  swift_beginAccess();
  *double v13 = a6;
  swift_beginAccess();
  *double v14 = a7;
  swift_beginAccess();
  id v20 = *v15;
  *id v15 = a4;
  id v21 = a4;

  v25.receiver = v17;
  v25.super_class = (Class)type metadata accessor for ActivityItemMetricsRequest();
  return objc_msgSendSuper2(&v25, sel_init);
}

uint64_t type metadata accessor for ActivityItemMetricsRequest()
{
  return self;
}

id sub_23C989F0C(void *a1)
{
  uint64_t v3 = &v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_clipMargin];
  *(void *)&v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_clipMargin] = 0;
  id v4 = &v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_scaleFactor];
  *(void *)&v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_scaleFactor] = 0x3FF0000000000000;
  id v30 = (void **)&v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_watchDisplayVariant];
  *(void *)&v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_watchDisplayVariant] = 0;
  uint64_t v5 = OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__edgeInsets;
  *(void *)&v1[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__edgeInsets] = 0;
  double v6 = v1;
  if ((id)BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey())
  {
    sub_23C991270();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v35 = 0u;
    long long v36 = 0u;
  }
  sub_23C952E40((uint64_t)&v35, (uint64_t)v37);
  if (v38)
  {
    type metadata accessor for SizeDimensionRequest();
    if (swift_dynamicCast())
    {
      id v7 = v31;
      goto LABEL_9;
    }
  }
  else
  {
    sub_23C952480((uint64_t)v37);
  }
  objc_super v8 = (objc_class *)type metadata accessor for SizeDimensionRequest();
  double v9 = (char *)objc_allocWithZone(v8);
  *(void *)&v9[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum] = 0;
  *(void *)&v9[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum] = 0;
  *(void *)&v9[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type] = 1;
  v34.receiver = v9;
  v34.super_class = v8;
  id v7 = objc_msgSendSuper2(&v34, sel_init);
LABEL_9:
  *(void *)&v6[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest] = v7;
  if ((id)BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey())
  {
    sub_23C991270();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v35 = 0u;
    long long v36 = 0u;
  }
  sub_23C952E40((uint64_t)&v35, (uint64_t)v37);
  if (v38)
  {
    type metadata accessor for SizeDimensionRequest();
    if (swift_dynamicCast())
    {
      id v10 = v31;
      goto LABEL_17;
    }
  }
  else
  {
    sub_23C952480((uint64_t)v37);
  }
  double v11 = (objc_class *)type metadata accessor for SizeDimensionRequest();
  double v12 = (char *)objc_allocWithZone(v11);
  *(void *)&v12[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum] = 0;
  *(void *)&v12[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum] = 0;
  *(void *)&v12[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type] = 1;
  v33.receiver = v12;
  v33.super_class = v11;
  id v10 = objc_msgSendSuper2(&v33, sel_init);
LABEL_17:
  *(void *)&v6[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__heightRequest] = v10;
  id v13 = (id)BSDeserializeDataFromXPCDictionaryWithKey();
  if (v13)
  {
    double v14 = v13;
    uint64_t v15 = sub_23C990BF0();
    unint64_t v17 = v16;

    type metadata accessor for ActivityEdgeInsets();
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    id v19 = (void *)sub_23C990BE0();
    id v20 = objc_msgSend(ObjCClassFromMetadata, sel_bs_secureDecodedFromData_, v19);
    sub_23C95CAD4(v15, v17);

    id v21 = *(void **)&v1[v5];
    *(void *)&v1[v5] = v20;
  }
  BSDeserializeDoubleFromXPCDictionaryWithKey();
  *(void *)&v6[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_cornerRadius] = v22;
  BSDeserializeDoubleFromXPCDictionaryWithKey();
  uint64_t v24 = v23;
  swift_beginAccess();
  *(void *)uint64_t v3 = v24;
  BSDeserializeDoubleFromXPCDictionaryWithKey();
  uint64_t v26 = v25;
  id result = (id)swift_beginAccess();
  *(void *)id v4 = v26;
  if (a1)
  {
    uint64_t v28 = v6;
    if (xpc_dictionary_get_value(a1, "watchDisplayVariant"))
    {
      swift_unknownObjectRelease();
      xpc_dictionary_get_int64(a1, "watchDisplayVariant");
      sub_23C959038(0, &qword_268BBA5F8);
      uint64_t v29 = sub_23C9911E0();
      swift_beginAccess();
      uint64_t v28 = *v30;
      *id v30 = (void *)v29;
    }
    v32.receiver = v6;
    v32.super_class = (Class)type metadata accessor for ActivityItemMetricsRequest();
    return objc_msgSendSuper2(&v32, sel_init);
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_23C98A31C(void *a1)
{
  int v2 = v1;
  id v4 = &v2[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_clipMargin];
  *(void *)&v2[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_clipMargin] = 0;
  uint64_t v5 = &v2[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_scaleFactor];
  *(void *)&v2[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_scaleFactor] = 0x3FF0000000000000;
  double v6 = (void **)&v2[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_watchDisplayVariant];
  *(void *)&v2[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_watchDisplayVariant] = 0;
  uint64_t v7 = OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__edgeInsets;
  *(void *)&v2[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__edgeInsets] = 0;
  objc_super v8 = (objc_class *)type metadata accessor for SizeDimensionRequest();
  double v9 = v2;
  uint64_t v10 = sub_23C9911D0();
  if (!v10)
  {
    double v11 = (char *)objc_allocWithZone(v8);
    *(void *)&v11[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum] = 0;
    *(void *)&v11[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum] = 0;
    *(void *)&v11[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type] = 1;
    v33.receiver = v11;
    v33.super_class = v8;
    uint64_t v10 = (uint64_t)objc_msgSendSuper2(&v33, sel_init);
  }
  *(void *)&v9[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest] = v10;
  uint64_t v12 = sub_23C9911D0();
  if (!v12)
  {
    id v13 = (char *)objc_allocWithZone(v8);
    *(void *)&v13[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum] = 0;
    *(void *)&v13[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum] = 0;
    *(void *)&v13[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type] = 1;
    v32.receiver = v13;
    v32.super_class = v8;
    uint64_t v12 = (uint64_t)objc_msgSendSuper2(&v32, sel_init);
  }
  *(void *)&v9[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__heightRequest] = v12;
  double v14 = (void *)sub_23C990FC0();
  unsigned int v15 = objc_msgSend(a1, sel_containsValueForKey_, v14);

  if (v15)
  {
    type metadata accessor for ActivityEdgeInsets();
    uint64_t v16 = sub_23C9911D0();
    unint64_t v17 = *(void **)&v2[v7];
    *(void *)&v2[v7] = v16;
  }
  uint64_t v18 = (void *)sub_23C990FC0();
  objc_msgSend(a1, sel_decodeDoubleForKey_, v18);
  uint64_t v20 = v19;

  *(void *)&v9[OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_cornerRadius] = v20;
  id v21 = (void *)sub_23C990FC0();
  objc_msgSend(a1, sel_decodeDoubleForKey_, v21);
  uint64_t v23 = v22;

  swift_beginAccess();
  *(void *)id v4 = v23;
  uint64_t v24 = (void *)sub_23C990FC0();
  objc_msgSend(a1, sel_decodeDoubleForKey_, v24);
  uint64_t v26 = v25;

  swift_beginAccess();
  *(void *)uint64_t v5 = v26;
  int64_t v27 = (void *)sub_23C990FC0();
  LODWORD(v21) = objc_msgSend(a1, sel_containsValueForKey_, v27);

  uint64_t v28 = v9;
  if (v21)
  {
    sub_23C959038(0, &qword_268BBA5F8);
    uint64_t v29 = sub_23C9911D0();
    swift_beginAccess();
    uint64_t v28 = *v6;
    *double v6 = (void *)v29;
  }
  v31.receiver = v9;
  v31.super_class = (Class)type metadata accessor for ActivityItemMetricsRequest();
  return objc_msgSendSuper2(&v31, sel_init);
}

id sub_23C98A6D4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  int v2 = *(void **)(*a1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest);
  *a2 = v2;
  return v2;
}

void sub_23C98A6EC(id *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
}

id sub_23C98A70C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  int v2 = *(void **)(*a1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__heightRequest);
  *a2 = v2;
  return v2;
}

void sub_23C98A724(id *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
}

double sub_23C98A744@<D0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_getTm_0(a1, &OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_cornerRadius, a2);
}

uint64_t sub_23C98A750(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_cornerRadius);
}

double sub_23C98A75C@<D0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_getTm_0(a1, &OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_clipMargin, a2);
}

uint64_t sub_23C98A768(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_clipMargin);
}

double sub_23C98A774@<D0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_getTm_0(a1, &OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_scaleFactor, a2);
}

uint64_t sub_23C98A780(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_scaleFactor);
}

id sub_23C98A78C@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  uint64_t v3 = (void **)(*a1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_watchDisplayVariant);
  swift_beginAccess();
  id v4 = *v3;
  *a2 = *v3;
  return v4;
}

id sub_23C98A7F4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  int v2 = *(void **)(*a1 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__edgeInsets);
  *a2 = v2;
  return v2;
}

void sub_23C98A80C(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  sub_23C989C10(v1);
}

uint64_t method lookup function for ActivityItemMetricsRequest(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ActivityItemMetricsRequest);
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.widthRequest.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.widthRequest.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.widthRequest.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.heightRequest.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.heightRequest.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.heightRequest.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.cornerRadius.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.cornerRadius.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.cornerRadius.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.clipMargin.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.clipMargin.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.clipMargin.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.scaleFactor.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.scaleFactor.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.scaleFactor.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.watchDisplayVariant.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.watchDisplayVariant.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.watchDisplayVariant.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.edgeInsets.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.edgeInsets.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.edgeInsets.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.initialSize.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.maximumSize.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.__allocating_init(width:height:cornerRadius:edgeInsets:clipMargin:scaleFactor:watchDisplayVariant:)()
{
  return (*(uint64_t (**)(void))(v0 + 392))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.isValid()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of static ActivityItemMetricsRequest.empty()()
{
  return (*(uint64_t (**)(void))(v0 + 408))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.encode(withXPCDictionary:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.__allocating_init(xpcDictionary:)()
{
  return (*(uint64_t (**)(void))(v0 + 424))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.copy(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of ActivityItemMetricsRequest.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 448))();
}

void *sub_23C98AF1C()
{
  id v1 = (void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_scene);
  swift_beginAccess();
  id v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_23C98AFCC(void **a1, void *a2)
{
  id v2 = *a1;
  id v3 = (void **)(*a2 + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_scene);
  swift_beginAccess();
  id v4 = *v3;
  *id v3 = v2;
  id v5 = v2;
}

id sub_23C98B07C()
{
  id v1 = (void **)(v0 + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_descriptor);
  swift_beginAccess();
  id v2 = *v1;
  return v2;
}

void sub_23C98B134(void **a1, void *a2)
{
  id v2 = *a1;
  id v3 = (void **)(*a2 + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_descriptor);
  swift_beginAccess();
  id v4 = *v3;
  *id v3 = v2;
  id v5 = v2;
}

void sub_23C98B198()
{
  id v0 = objc_allocWithZone(MEMORY[0x263F3F500]);
  id v1 = (void *)sub_23C990FC0();
  id v2 = objc_msgSend(v0, sel_initWithIdentifier_, v1);

  qword_268BBA4F0 = (uint64_t)v2;
}

uint64_t sub_23C98B264()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_delegate;
  swift_beginAccess();
  return MEMORY[0x23ECEAE20](v1);
}

uint64_t sub_23C98B304()
{
  return swift_unknownObjectRelease();
}

void (*sub_23C98B360(void *a1))(void **a1, char a2)
{
  id v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_delegate;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x23ECEAE20](v5);
  return sub_23C9556BC;
}

char *ActivitySystemApertureSceneHandle.__allocating_init(acActivityDescritor:systemMetricsRequest:)(void *a1, void *a2)
{
  uint64_t v5 = sub_23C990C60();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  double v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  double v11 = (char *)&v17 - v10;
  id v12 = objc_allocWithZone(v2);
  id result = (char *)objc_msgSend(a1, sel_descriptorData);
  if (result)
  {
    double v14 = result;
    sub_23C9550C8();
    sub_23C990DD0();

    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
    id v15 = objc_allocWithZone((Class)type metadata accessor for ActivitySystemApertureSceneHandle());
    uint64_t v16 = sub_23C98B83C((uint64_t)v9, a2);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return v16;
  }
  else
  {
    __break(1u);
  }
  return result;
}

char *ActivitySystemApertureSceneHandle.init(acActivityDescritor:systemMetricsRequest:)(void *a1, void *a2)
{
  uint64_t v5 = sub_23C990C60();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  double v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  double v11 = (char *)&v17 - v10;
  id v12 = v2;
  id result = (char *)objc_msgSend(a1, sel_descriptorData);
  if (result)
  {
    double v14 = result;
    sub_23C9550C8();
    sub_23C990DD0();

    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
    id v15 = objc_allocWithZone((Class)type metadata accessor for ActivitySystemApertureSceneHandle());
    uint64_t v16 = sub_23C98B83C((uint64_t)v9, a2);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return v16;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for ActivitySystemApertureSceneHandle()
{
  uint64_t result = qword_268BBA540;
  if (!qword_268BBA540) {
    return swift_getSingletonMetadata();
  }
  return result;
}

char *sub_23C98B83C(uint64_t a1, void *a2)
{
  uint64_t v49 = sub_23C990D70();
  uint64_t v5 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  uint64_t v7 = (char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_23C990D00();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v2[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_scene] = 0;
  v2[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_invalidated] = 0;
  *(void *)&v2[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_currentContentPayloadID] = 0;
  *(void *)&v2[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_backOffTimer] = 0;
  uint64_t v11 = OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_settingsDiffInspector;
  id v12 = objc_allocWithZone((Class)type metadata accessor for ActivitySceneClientSettingsDiffInspector());
  id v13 = v2;
  *(void *)&v2[v11] = objc_msgSend(v12, sel_init);
  swift_unknownObjectWeakInit();
  double v14 = &v13[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_logIdentifier];
  *(void *)double v14 = 0;
  *((void *)v14 + 1) = 0xE000000000000000;
  id v15 = &v13[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_activityDescriptor];
  uint64_t v16 = sub_23C990C60();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(void (**)(char *, uint64_t))(v17 + 16);
  uint64_t v50 = v16;
  v18(v15, a1);
  *(void *)&v13[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_descriptor] = sub_23C990C20();
  *(void *)&v13[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_systemMetricsRequest] = a2;
  id v51 = a2;
  uint64_t v52 = a1;
  sub_23C990C30();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v19 = v49;
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v10, v49);
    unint64_t v20 = sub_23C990D60();
    unint64_t v22 = v21;
    uint64_t v10 = v7;
    uint64_t v23 = v19;
  }
  else
  {
    unint64_t v22 = 0x800000023C997380;
    unint64_t v20 = 0xD000000000000011;
    uint64_t v23 = v49;
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v23);
  uint64_t v24 = (unint64_t *)&v13[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_processResource];
  unint64_t *v24 = v20;
  v24[1] = v22;
  swift_bridgeObjectRetain();

  if (qword_268BBA5B8 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_23C990E40();
  __swift_project_value_buffer(v25, (uint64_t)qword_268BBA598);
  uint64_t v26 = sub_23C990E20();
  os_log_type_t v27 = sub_23C991140();
  if (os_log_type_enabled(v26, v27))
  {
    uint64_t v28 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v28 = 0;
    _os_log_impl(&dword_23C948000, v26, v27, "System Aperture scene created", v28, 2u);
    MEMORY[0x23ECEADB0](v28, -1, -1);
  }

  uint64_t v29 = (objc_class *)type metadata accessor for ActivitySystemApertureSceneHandle();
  v63.receiver = v13;
  v63.super_class = v29;
  id aBlock = objc_msgSendSuper2(&v63, sel_init);
  id v30 = (char *)aBlock;
  id aBlock = (id)sub_23C991670();
  uint64_t v54 = v31;
  uint64_t v61 = 0x3030303030307830;
  unint64_t v62 = 0xE900000000000030;
  uint64_t v59 = 30768;
  unint64_t v60 = 0xE200000000000000;
  sub_23C977A54();
  objc_super v32 = (void **)sub_23C991260();
  uint64_t v34 = v33;
  swift_bridgeObjectRelease();
  long long v35 = (void *)sub_23C98D998(v20, v22, v52, v51, v32, v34);
  swift_bridgeObjectRelease();
  long long v36 = (id *)&v30[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_scene];
  swift_beginAccess();
  id v37 = *v36;
  *long long v36 = v35;
  id v38 = v35;

  if (*v36) {
    objc_msgSend(*v36, sel_setDelegate_, v30);
  }
  id aBlock = v32;
  uint64_t v54 = v34;
  sub_23C991000();
  uint64_t v39 = v52;
  sub_23C990C50();
  sub_23C991000();
  swift_bridgeObjectRelease();
  uint64_t v40 = v54;
  uint64_t v41 = &v30[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_logIdentifier];
  *(void *)uint64_t v41 = aBlock;
  *((void *)v41 + 1) = v40;
  swift_bridgeObjectRelease();
  uint64_t v42 = *(void **)&v30[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_settingsDiffInspector];
  uint64_t v43 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  uint64_t v44 = qword_268BBAF70;
  uint64_t v45 = swift_allocObject();
  *(void *)(v45 + 16) = sub_23C98EF94;
  *(void *)(v45 + 24) = v43;
  uint64_t v57 = sub_23C977C60;
  uint64_t v58 = v45;
  id aBlock = (id)MEMORY[0x263EF8330];
  uint64_t v54 = 1107296256;
  os_log_type_t v55 = sub_23C983C00;
  uint64_t v56 = &block_descriptor_4;
  uint64_t v46 = _Block_copy(&aBlock);
  id v47 = v42;
  swift_retain_n();
  swift_release();
  objc_msgSend(v47, sel_observeOtherSetting_withBlock_, v44, v46);
  _Block_release(v46);

  swift_release_n();
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v39, v50);
  return v30;
}

id ActivitySystemApertureSceneHandle.__deallocating_deinit()
{
  sub_23C98C01C();
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivitySystemApertureSceneHandle();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23C98C01C()
{
  uint64_t v1 = v0;
  uint64_t result = BSDispatchQueueAssertMain();
  uint64_t v3 = OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_invalidated;
  if ((v0[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_invalidated] & 1) == 0)
  {
    v0[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_invalidated] = 1;
    objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_settingsDiffInspector], sel_removeAllObservers);
    if (qword_268BBA5B8 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_23C990E40();
    __swift_project_value_buffer(v4, (uint64_t)qword_268BBA598);
    uint64_t v5 = v0;
    uint64_t v6 = sub_23C990E20();
    os_log_type_t v7 = sub_23C991140();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = v3;
      unint64_t v21 = v5;
      uint64_t v9 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 138543362;
      uint64_t v10 = v5;
      sub_23C991240();
      void *v9 = v5;

      _os_log_impl(&dword_23C948000, v6, v7, "%{public}@ invalidated", v8, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AF22818);
      swift_arrayDestroy();
      uint64_t v11 = v9;
      uint64_t v3 = v20;
      MEMORY[0x23ECEADB0](v11, -1, -1);
      MEMORY[0x23ECEADB0](v8, -1, -1);
    }
    else
    {
    }
    id v12 = (void **)&v5[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_scene];
    swift_beginAccess();
    id v13 = *v12;
    if (*v12)
    {
      objc_msgSend(v13, sel_setDelegate_, 0);
      id v13 = *v12;
    }
    objc_msgSend(v13, sel_invalidate, v20, v21);
    double v14 = *v12;
    *id v12 = 0;

    v1[v3] = 1;
    uint64_t v15 = OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_backOffTimer;
    uint64_t v16 = *(void *)&v5[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_backOffTimer];
    if (v16)
    {
      uint64_t v17 = *(void **)(v16 + 16);
      swift_retain();
      objc_msgSend(v17, sel_invalidate);
      uint64_t v18 = *(void **)(v16 + 16);
      *(void *)(v16 + 16) = 0;

      objc_msgSend(*(id *)(v16 + 88), sel_invalidate);
      uint64_t v19 = *(void **)(v16 + 88);
      *(void *)(v16 + 88) = 0;
      swift_release();
    }
    *(void *)&v5[v15] = 0;
    return swift_release();
  }
  return result;
}

void sub_23C98C2FC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  sub_23C991000();
  sub_23C991000();
  sub_23C991000();
  uint64_t v8 = (void *)sub_23C990FC0();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setIdentifier_, v8);

  objc_msgSend(a1, sel_setClientIdentity_, a6);
  id v9 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ActivitySystemApertureSceneSpecification()), sel_init);
  objc_msgSend(a1, sel_setSpecification_, v9);
}

void sub_23C98C414(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  type metadata accessor for ActivityMutableSceneSettings();
  uint64_t v7 = swift_dynamicCastClass();
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    id v9 = a1;
    objc_msgSend(v8, sel_setInterfaceOrientation_, 1);
    id v10 = objc_msgSend(self, sel_mainConfiguration);
    objc_msgSend(v8, sel_setDisplayConfiguration_, v10);

    swift_bridgeObjectRetain_n();
    id v11 = objc_msgSend(v8, sel_otherSettings);
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_23C991510();
    swift_beginAccess();
    objc_msgSend(v11, sel_setObject_forSetting_, v12, qword_268BBB488);
    swift_bridgeObjectRelease_n();

    swift_unknownObjectRelease();
    sub_23C990C60();
    sub_23C9550C8();
    id v13 = (id)sub_23C990DE0();
    id v14 = objc_msgSend(v8, sel_otherSettings);
    swift_beginAccess();
    objc_msgSend(v14, sel_setObject_forSetting_, v13, qword_268BBB4C0);

    id v15 = a5;
    id v16 = objc_msgSend(v8, sel_otherSettings);
    swift_beginAccess();
    objc_msgSend(v16, sel_setObject_forSetting_, v15, qword_268BBB4D8);
  }
}

void sub_23C98C650(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x23ECEAE20](v1);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    uint64_t v4 = (id *)(v2 + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_scene);
    swift_beginAccess();
    if (*v4)
    {
      id v5 = objc_msgSend(*v4, sel_clientSettings);
      if (v5)
      {
        uint64_t v6 = v5;
        type metadata accessor for ActivitySceneClientSettings();
        uint64_t v7 = swift_dynamicCastClass();
        if (v7)
        {
          uint64_t v8 = (void *)v7;
          if (qword_26AF22748 != -1) {
            swift_once();
          }
          uint64_t v9 = sub_23C990E40();
          __swift_project_value_buffer(v9, (uint64_t)qword_26AF22728);
          id v10 = v6;
          id v11 = v3;
          uint64_t v12 = sub_23C990E20();
          os_log_type_t v13 = sub_23C991120();
          id v14 = &off_264E78000;
          if (!os_log_type_enabled(v12, v13))
          {

            goto LABEL_21;
          }
          objc_super v32 = v10;
          uint64_t v15 = swift_slowAlloc();
          id v30 = (void *)swift_slowAlloc();
          uint64_t v31 = swift_slowAlloc();
          v36[0] = v31;
          *(_DWORD *)uint64_t v15 = 136446466;
          uint64_t v17 = *(void *)&v11[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_logIdentifier];
          unint64_t v16 = *(void *)&v11[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_logIdentifier
                              + 8];
          swift_bridgeObjectRetain();
          *(void *)&long long v34 = sub_23C9733B0(v17, v16, v36);
          sub_23C991240();

          swift_bridgeObjectRelease();
          *(_WORD *)(v15 + 12) = 2114;
          id v18 = objc_msgSend(v8, sel_otherSettings);
          swift_beginAccess();
          if (objc_msgSend(v18, sel_objectForSetting_, qword_268BBAF70))
          {
            sub_23C991270();
            swift_unknownObjectRelease();
            sub_23C95CAC4(v33, &v34);
          }
          else
          {
            long long v34 = 0u;
            long long v35 = 0u;
          }
          __swift_instantiateConcreteTypeFromMangledName(&qword_26AF22BA0);
          sub_23C959038(0, (unint64_t *)&qword_26AF22B90);
          if (swift_dynamicCast())
          {
            uint64_t v19 = v37;

            if (v19)
            {
              *(void *)&long long v34 = v19;
              sub_23C991240();
LABEL_20:
              id v10 = v32;
              *id v30 = v19;

              _os_log_impl(&dword_23C948000, v12, v13, "[%{public}s] ClientSetting[contentPayloadID] did change to: %{public}@", (uint8_t *)v15, 0x16u);
              __swift_instantiateConcreteTypeFromMangledName(&qword_26AF22818);
              swift_arrayDestroy();
              MEMORY[0x23ECEADB0](v30, -1, -1);
              swift_arrayDestroy();
              MEMORY[0x23ECEADB0](v31, -1, -1);
              MEMORY[0x23ECEADB0](v15, -1, -1);

              id v14 = &off_264E78000;
LABEL_21:
              id v20 = objc_msgSend(v8, sel_otherSettings, v30);
              swift_beginAccess();
              if (objc_msgSend(v20, (SEL)v14[504], qword_268BBAF70))
              {
                sub_23C991270();
                swift_unknownObjectRelease();
                sub_23C95CAC4(v33, &v34);
              }
              else
              {
                long long v34 = 0u;
                long long v35 = 0u;
              }
              __swift_instantiateConcreteTypeFromMangledName(&qword_26AF22BA0);
              sub_23C959038(0, (unint64_t *)&qword_26AF22B90);
              if (swift_dynamicCast())
              {
                unint64_t v21 = v37;

                unint64_t v22 = &v11[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_currentContentPayloadID];
                uint64_t v23 = *(void **)&v11[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_currentContentPayloadID];
                if (v23)
                {
                  if (v21)
                  {
                    id v24 = v21;
                    id v25 = v23;
                    char v26 = sub_23C991200();

                    if (v26)
                    {

LABEL_37:
                      return;
                    }
                    uint64_t v23 = *(void **)v22;
                  }
                }
                else
                {
                  if (!v21) {
                    goto LABEL_37;
                  }
                  uint64_t v23 = 0;
                }
              }
              else
              {
                id v37 = 0;

                unint64_t v22 = &v11[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_currentContentPayloadID];
                uint64_t v23 = *(void **)&v11[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_currentContentPayloadID];
                if (!v23) {
                  goto LABEL_37;
                }
                unint64_t v21 = 0;
              }
              *(void *)unint64_t v22 = v21;
              id v27 = v21;

              uint64_t v28 = &v11[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_delegate];
              swift_beginAccess();
              uint64_t v29 = (void *)MEMORY[0x23ECEAE20](v28);
              if (v29)
              {
                objc_msgSend(v29, sel_activitySystemApertureWithSceneHandle_updatedContentPayloadID_, v11, *(void *)v22);

                swift_unknownObjectRelease();
                return;
              }

              goto LABEL_37;
            }
          }
          else
          {
            id v37 = 0;
          }
          *(void *)&long long v34 = 0;
          sub_23C991240();
          uint64_t v19 = 0;
          goto LABEL_20;
        }
      }
    }
  }
}

id ActivitySystemApertureSceneHandle.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void ActivitySystemApertureSceneHandle.init()()
{
}

void ActivitySystemApertureSceneHandle.sceneDidActivate(_:)()
{
}

void ActivitySystemApertureSceneHandle.sceneDidInvalidate(_:)()
{
}

void ActivitySystemApertureSceneHandle.sceneDidDeactivate(_:withError:)(void *a1, id a2)
{
  uint64_t v3 = v2;
  if (a2)
  {
    id v6 = a2;
    if (qword_268BBA5B8 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_23C990E40();
    __swift_project_value_buffer(v7, (uint64_t)qword_268BBA598);
    id v8 = a2;
    id v9 = a2;
    id v10 = v2;
    id v11 = sub_23C990E20();
    os_log_type_t v12 = sub_23C991120();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      v51[0] = v14;
      *(_DWORD *)uint64_t v13 = 136446466;
      uint64_t v15 = a1;
      uint64_t v17 = *(void *)&v10[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_logIdentifier];
      unint64_t v16 = *(void *)&v10[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_logIdentifier + 8];
      swift_bridgeObjectRetain();
      sub_23C9733B0(v17, v16, v51);
      sub_23C991240();

      swift_bridgeObjectRelease();
      *(_WORD *)(v13 + 12) = 2082;
      swift_getErrorValue();
      uint64_t v18 = sub_23C991560();
      v50[0] = sub_23C9733B0(v18, v19, v51);
      a1 = v15;
      uint64_t v3 = v2;
      sub_23C991240();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_23C948000, v11, v12, "[%{public}s] Scene did deactivate with error: %{public}s.", (uint8_t *)v13, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x23ECEADB0](v14, -1, -1);
      MEMORY[0x23ECEADB0](v13, -1, -1);
    }
    else
    {
    }
  }
  else
  {
    if (qword_268BBA5B8 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_23C990E40();
    __swift_project_value_buffer(v20, (uint64_t)qword_268BBA598);
    unint64_t v21 = v2;
    unint64_t v22 = sub_23C990E20();
    os_log_type_t v23 = sub_23C991120();
    if (os_log_type_enabled(v22, v23))
    {
      id v24 = (uint8_t *)swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      v51[0] = v25;
      *(_DWORD *)id v24 = 136446210;
      uint64_t v49 = v3;
      char v26 = a1;
      uint64_t v27 = *(void *)&v21[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_logIdentifier];
      unint64_t v28 = *(void *)&v21[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_logIdentifier + 8];
      swift_bridgeObjectRetain();
      v50[0] = sub_23C9733B0(v27, v28, v51);
      sub_23C991240();

      a1 = v26;
      uint64_t v3 = v49;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23C948000, v22, v23, "[%{public}s] Scene did deactivate.", v24, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23ECEADB0](v25, -1, -1);
      MEMORY[0x23ECEADB0](v24, -1, -1);
    }
    else
    {
    }
  }
  uint64_t v29 = (void **)&v3[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_scene];
  swift_beginAccess();
  id v30 = *v29;
  if (v30)
  {
    sub_23C959038(0, (unint64_t *)&qword_26AF22810);
    id v31 = v30;
    if ((sub_23C991200() & 1) == 0)
    {
LABEL_18:

      return;
    }
    uint64_t v32 = OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_backOffTimer;
    if (*(void *)&v3[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_backOffTimer]) {
      goto LABEL_17;
    }
    sub_23C991330();
    swift_bridgeObjectRelease();
    v50[0] = 0xD000000000000022;
    v50[1] = 0x800000023C999AC0;
    swift_bridgeObjectRetain();
    sub_23C991000();
    swift_bridgeObjectRelease();
    sub_23C959038(0, &qword_26AF227C0);
    uint64_t v33 = sub_23C991180();
    uint64_t v34 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v35 = swift_allocObject();
    *(void *)(v35 + 16) = v34;
    *(void *)(v35 + 24) = a1;
    type metadata accessor for BackOffTimer();
    uint64_t v36 = swift_allocObject();
    *(void *)(v36 + 64) = v35;
    *(void *)(v36 + 72) = 0;
    *(void *)(v36 + 16) = 0;
    *(void *)(v36 + 24) = 0;
    *(unsigned char *)(v36 + 80) = 1;
    *(void *)(v36 + 88) = 0;
    *(void *)(v36 + 32) = 0xD000000000000022;
    *(void *)(v36 + 40) = 0x800000023C999AC0;
    *(void *)(v36 + 48) = v33;
    *(void *)(v36 + 56) = sub_23C98E23C;
    *(void *)&v3[v32] = v36;
    id v37 = a1;
    swift_release();
    uint64_t v38 = *(void *)&v3[v32];
    if (v38)
    {
      *(void *)(v38 + 72) = 0x4046800000000000;
      *(unsigned char *)(v38 + 80) = 0;
      if (*(void *)&v3[v32])
      {
LABEL_17:
        swift_retain();
        sub_23C95D894();
        swift_release();
        goto LABEL_18;
      }
    }
    __break(1u);
  }
  else
  {
    if (qword_268BBA5B8 != -1) {
      swift_once();
    }
    uint64_t v39 = sub_23C990E40();
    __swift_project_value_buffer(v39, (uint64_t)qword_268BBA598);
    id v40 = a1;
    uint64_t v41 = sub_23C990E20();
    os_log_type_t v42 = sub_23C991130();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = (uint8_t *)swift_slowAlloc();
      uint64_t v44 = swift_slowAlloc();
      v50[0] = v44;
      *(_DWORD *)uint64_t v43 = 136315138;
      id v45 = objc_msgSend(v40, sel_identifier);
      uint64_t v46 = sub_23C990FD0();
      unint64_t v48 = v47;

      v50[2] = sub_23C9733B0(v46, v48, v50);
      sub_23C991240();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23C948000, v41, v42, "No system aperture activity scene found: %s", v43, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23ECEADB0](v44, -1, -1);
      MEMORY[0x23ECEADB0](v43, -1, -1);
    }
    else
    {
    }
  }
}

void sub_23C98D4EC(uint64_t a1, void *a2)
{
  uint64_t v3 = a1 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x23ECEAE20](v3);
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = objc_msgSend(a2, sel_settings);
    unsigned int v7 = objc_msgSend(v6, sel_isForeground);

    if ((*((unsigned char *)v5 + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_invalidated) & 1) == 0
      && v7)
    {
      if (qword_268BBA5B8 != -1) {
        swift_once();
      }
      uint64_t v8 = sub_23C990E40();
      __swift_project_value_buffer(v8, (uint64_t)qword_268BBA598);
      id v9 = v5;
      id v10 = sub_23C990E20();
      os_log_type_t v11 = sub_23C991140();
      if (os_log_type_enabled(v10, v11))
      {
        os_log_type_t v12 = (uint8_t *)swift_slowAlloc();
        uint64_t v13 = swift_slowAlloc();
        uint64_t v19 = v13;
        *(_DWORD *)os_log_type_t v12 = 136315138;
        uint64_t v15 = *(void *)&v9[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_logIdentifier];
        unint64_t v14 = *(void *)&v9[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_logIdentifier + 8];
        swift_bridgeObjectRetain();
        uint64_t v18 = sub_23C9733B0(v15, v14, &v19);
        sub_23C991240();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23C948000, v10, v11, "[%s] Scene did deactivate but was foreground - reactivating.", v12, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23ECEADB0](v13, -1, -1);
        MEMORY[0x23ECEADB0](v12, -1, -1);

        objc_msgSend(a2, sel_activateWithTransitionContext_, 0, v12 + 4, v18, v19);
      }
      else
      {

        objc_msgSend(a2, sel_activateWithTransitionContext_, 0, v16, v17, v19);
      }
    }
  }
}

void ActivitySystemApertureSceneHandle.scene(_:didReceive:)(uint64_t a1, uint64_t a2)
{
}

id ActivitySystemApertureSceneHandle.scene(_:didUpdateClientSettingsWith:oldClientSettings:transitionContext:)(uint64_t a1, uint64_t a2)
{
  return sub_23C98E9F0(a2);
}

void sub_23C98D8E0(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  id v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_23C991240();
  *a1 = v7;
  uint64_t v8 = *a2;
  if (*a2)
  {
    void *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

uint64_t sub_23C98D998(uint64_t a1, unint64_t a2, uint64_t a3, void *a4, void **a5, uint64_t a6)
{
  uint64_t v58 = a5;
  uint64_t v59 = a6;
  uint64_t v10 = sub_23C990C60();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388](v10);
  uint64_t v56 = (char *)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268BBA5B8 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_23C990E40();
  __swift_project_value_buffer(v13, (uint64_t)qword_268BBA598);
  unint64_t v14 = sub_23C990E20();
  os_log_type_t v15 = sub_23C991140();
  BOOL v16 = os_log_type_enabled(v14, v15);
  uint64_t v57 = v10;
  if (v16)
  {
    unint64_t v17 = a2;
    uint64_t v18 = v11;
    uint64_t v19 = v12;
    uint64_t v20 = a4;
    uint64_t v21 = a1;
    uint64_t v22 = a3;
    os_log_type_t v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v23 = 0;
    _os_log_impl(&dword_23C948000, v14, v15, "Creating activity system aperture scene", v23, 2u);
    id v24 = v23;
    a3 = v22;
    a1 = v21;
    a4 = v20;
    uint64_t v12 = v19;
    uint64_t v11 = v18;
    a2 = v17;
    MEMORY[0x23ECEADB0](v24, -1, -1);
  }

  id v25 = sub_23C956B60(a1, a2);
  if (!v25) {
    goto LABEL_11;
  }
  char v26 = v25;
  uint64_t v54 = a3;
  os_log_type_t v55 = a4;
  uint64_t v27 = sub_23C990C50();
  a1 = v28;
  uint64_t v29 = self;
  id v53 = v26;
  id v30 = objc_msgSend(v29, sel_identityForProcessIdentity_, v26);
  if (qword_268BBA4F8 != -1) {
    swift_once();
  }
  id v31 = (void *)qword_268BBA4F0;
  uint64_t v32 = (void *)swift_allocObject();
  v32[2] = v27;
  v32[3] = a1;
  uint64_t v33 = v59;
  v32[4] = v58;
  v32[5] = v33;
  v32[6] = v30;
  uint64_t v34 = swift_allocObject();
  *(void *)(v34 + 16) = sub_23C98F03C;
  *(void *)(v34 + 24) = v32;
  uint64_t v64 = sub_23C98F05C;
  uint64_t v65 = v34;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v61 = 1107296256;
  uint64_t v58 = &v62;
  unint64_t v62 = sub_23C96F23C;
  objc_super v63 = &block_descriptor_45;
  uint64_t v35 = _Block_copy(&aBlock);
  uint64_t v52 = v27;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v36 = v30;
  swift_retain();
  swift_release();
  id v37 = objc_msgSend(v31, sel_createScene_, v35);
  _Block_release(v35);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) == 0)
  {
    a2 = (unint64_t)v56;
    uint64_t v40 = v57;
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v56, v54, v57);
    unint64_t v41 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    uint64_t v42 = swift_allocObject();
    *(void *)(v42 + 16) = v52;
    *(void *)(v42 + 24) = a1;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v11 + 32))(v42 + v41, a2, v40);
    uint64_t v43 = v55;
    *(void *)(v42 + ((v12 + v41 + 7) & 0xFFFFFFFFFFFFFFF8)) = v55;
    uint64_t v44 = swift_allocObject();
    *(void *)(v44 + 16) = sub_23C98F14C;
    *(void *)(v44 + 24) = v42;
    uint64_t v64 = sub_23C977938;
    uint64_t v65 = v44;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v61 = 1107296256;
    unint64_t v62 = sub_23C96F58C;
    objc_super v63 = &block_descriptor_54;
    id v45 = _Block_copy(&aBlock);
    id v46 = v43;
    swift_retain();
    swift_release();
    objc_msgSend(v37, sel_updateSettingsWithBlock_, v45);

    _Block_release(v45);
    LOBYTE(v45) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    swift_release();
    if ((v45 & 1) == 0) {
      return (uint64_t)v37;
    }
    __break(1u);
LABEL_11:
    swift_bridgeObjectRetain_n();
    unint64_t v47 = sub_23C990E20();
    os_log_type_t v48 = sub_23C991130();
    if (os_log_type_enabled(v47, v48))
    {
      uint64_t v49 = (uint8_t *)swift_slowAlloc();
      uint64_t v50 = swift_slowAlloc();
      uint64_t aBlock = v50;
      *(_DWORD *)uint64_t v49 = 136380675;
      swift_bridgeObjectRetain();
      uint64_t v66 = sub_23C9733B0(a1, a2, &aBlock);
      sub_23C991240();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23C948000, v47, v48, "Couldn't create a system aperture scene with %{private}s", v49, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23ECEADB0](v50, -1, -1);
      MEMORY[0x23ECEADB0](v49, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  __break(1u);
  return result;
}

void sub_23C98DFE0(const char *a1)
{
  if (qword_268BBA5B8 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_23C990E40();
  __swift_project_value_buffer(v3, (uint64_t)qword_268BBA598);
  uint64_t v10 = v1;
  uint64_t v4 = sub_23C990E20();
  os_log_type_t v5 = sub_23C991120();
  if (os_log_type_enabled(v4, v5))
  {
    id v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v11 = v7;
    *(_DWORD *)id v6 = 136446210;
    uint64_t v8 = *(void *)&v10[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_logIdentifier];
    unint64_t v9 = *(void *)&v10[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_logIdentifier + 8];
    swift_bridgeObjectRetain();
    sub_23C9733B0(v8, v9, &v11);
    sub_23C991240();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C948000, v4, v5, a1, v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEADB0](v7, -1, -1);
    MEMORY[0x23ECEADB0](v6, -1, -1);
  }
  else
  {
  }
}

uint64_t sub_23C98E1C4()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_23C98E1FC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_23C98E23C()
{
  sub_23C98D4EC(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

void sub_23C98E244(uint64_t a1)
{
  if (qword_268BBA5B8 == -1) {
    goto LABEL_2;
  }
LABEL_74:
  swift_once();
LABEL_2:
  uint64_t v3 = sub_23C990E40();
  __swift_project_value_buffer(v3, (uint64_t)qword_268BBA598);
  uint64_t v4 = v1;
  swift_bridgeObjectRetain_n();
  os_log_type_t v5 = v4;
  id v1 = sub_23C990E20();
  os_log_type_t v6 = sub_23C991140();
  uint64_t v61 = v5;
  if (os_log_type_enabled(v1, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    v68[0] = v8;
    *(_DWORD *)uint64_t v7 = 136446467;
    unint64_t v9 = (char *)v5 + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_logIdentifier;
    uint64_t v10 = *(uint64_t *)((char *)&v5->isa
                     + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_logIdentifier);
    unint64_t v11 = *((void *)v9 + 1);
    swift_bridgeObjectRetain();
    sub_23C9733B0(v10, v11, v68);
    sub_23C991240();

    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2081;
    sub_23C959038(0, (unint64_t *)&unk_26AF227F0);
    sub_23C975BB4();
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_23C9910F0();
    unint64_t v14 = v13;
    swift_bridgeObjectRelease();
    uint64_t v15 = v12;
    os_log_type_t v5 = v61;
    uint64_t v63 = sub_23C9733B0(v15, v14, v68);
    sub_23C991240();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C948000, v1, v6, "[%{public}s] Scene did receive actions: %{private}s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23ECEADB0](v8, -1, -1);
    MEMORY[0x23ECEADB0](v7, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (*((unsigned char *)&v5->isa + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_invalidated)) {
    return;
  }
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_23C9912B0();
    id v1 = sub_23C959038(0, (unint64_t *)&unk_26AF227F0);
    sub_23C975BB4();
    sub_23C991100();
    a1 = v63;
    uint64_t v16 = v64;
    uint64_t v17 = v65;
    uint64_t v18 = v66;
    unint64_t v19 = v67;
  }
  else
  {
    uint64_t v20 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v16 = a1 + 56;
    uint64_t v21 = ~v20;
    uint64_t v22 = -v20;
    if (v22 < 64) {
      uint64_t v23 = ~(-1 << v22);
    }
    else {
      uint64_t v23 = -1;
    }
    unint64_t v19 = v23 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v17 = v21;
    uint64_t v18 = 0;
  }
  int64_t v24 = (unint64_t)(v17 + 64) >> 6;
  uint64_t v55 = v16;
  uint64_t v56 = a1;
  int64_t v54 = v24;
  while ((a1 & 0x8000000000000000) == 0)
  {
    if (v19)
    {
      id v1 = ((v19 - 1) & v19);
      unint64_t v26 = __clz(__rbit64(v19)) | (v18 << 6);
      uint64_t v27 = v18;
    }
    else
    {
      int64_t v29 = v18 + 1;
      if (__OFADD__(v18, 1)) {
        goto LABEL_73;
      }
      if (v29 >= v24) {
        goto LABEL_70;
      }
      unint64_t v30 = *(void *)(v16 + 8 * v29);
      uint64_t v27 = v18 + 1;
      if (!v30)
      {
        uint64_t v27 = v18 + 2;
        if (v18 + 2 >= v24) {
          goto LABEL_70;
        }
        unint64_t v30 = *(void *)(v16 + 8 * v27);
        if (!v30)
        {
          uint64_t v27 = v18 + 3;
          if (v18 + 3 >= v24) {
            goto LABEL_70;
          }
          unint64_t v30 = *(void *)(v16 + 8 * v27);
          if (!v30)
          {
            uint64_t v27 = v18 + 4;
            if (v18 + 4 >= v24) {
              goto LABEL_70;
            }
            unint64_t v30 = *(void *)(v16 + 8 * v27);
            if (!v30)
            {
              uint64_t v31 = v18 + 5;
              do
              {
                if (v24 == v31) {
                  goto LABEL_70;
                }
                unint64_t v30 = *(void *)(v16 + 8 * v31++);
              }
              while (!v30);
              uint64_t v27 = v31 - 1;
            }
          }
        }
      }
      id v1 = ((v30 - 1) & v30);
      unint64_t v26 = __clz(__rbit64(v30)) + (v27 << 6);
    }
    id v28 = *(id *)(*(void *)(a1 + 48) + 8 * v26);
    if (!v28) {
      goto LABEL_70;
    }
LABEL_37:
    uint64_t v59 = v27;
    self;
    uint64_t v32 = swift_dynamicCastObjCClass();
    if (v32)
    {
      uint64_t v33 = (void *)v32;
      uint64_t v58 = v1;
      uint64_t v34 = (char *)v5 + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_delegate;
      swift_beginAccess();
      uint64_t v35 = v34;
      id v1 = v58;
      uint64_t v36 = MEMORY[0x23ECEAE20](v35);
      if (v36)
      {
        id v37 = (void *)v36;
        id v25 = v28;
        id v38 = objc_msgSend(v33, sel_launchActions);
        if (v38)
        {
          uint64_t v39 = v38;
          id v57 = v25;
          sub_23C959038(0, (unint64_t *)&unk_26AF227F0);
          sub_23C975BB4();
          uint64_t v40 = sub_23C9910E0();

          if ((v40 & 0xC000000000000001) != 0)
          {
            sub_23C9912B0();
            sub_23C991100();
            uint64_t v40 = v68[0];
            uint64_t v60 = v68[1];
            uint64_t v41 = v68[2];
            uint64_t v42 = v68[3];
            unint64_t v43 = v68[4];
          }
          else
          {
            uint64_t v42 = 0;
            uint64_t v44 = -1 << *(unsigned char *)(v40 + 32);
            uint64_t v60 = v40 + 56;
            uint64_t v41 = ~v44;
            uint64_t v45 = -v44;
            if (v45 < 64) {
              uint64_t v46 = ~(-1 << v45);
            }
            else {
              uint64_t v46 = -1;
            }
            unint64_t v43 = v46 & *(void *)(v40 + 56);
          }
          id v1 = (v40 & 0x7FFFFFFFFFFFFFFFLL);
          int64_t v47 = (unint64_t)(v41 + 64) >> 6;
          if (v40 < 0) {
            goto LABEL_50;
          }
          while (1)
          {
            if (v43)
            {
              a1 = (v43 - 1) & v43;
              unint64_t v48 = __clz(__rbit64(v43)) | (v42 << 6);
              uint64_t v49 = v42;
            }
            else
            {
              int64_t v51 = v42 + 1;
              if (__OFADD__(v42, 1))
              {
                __break(1u);
LABEL_73:
                __break(1u);
                goto LABEL_74;
              }
              if (v51 >= v47) {
                goto LABEL_13;
              }
              unint64_t v52 = *(void *)(v60 + 8 * v51);
              uint64_t v49 = v42 + 1;
              if (!v52)
              {
                uint64_t v49 = v42 + 2;
                if (v42 + 2 >= v47) {
                  goto LABEL_13;
                }
                unint64_t v52 = *(void *)(v60 + 8 * v49);
                if (!v52)
                {
                  uint64_t v49 = v42 + 3;
                  if (v42 + 3 >= v47) {
                    goto LABEL_13;
                  }
                  unint64_t v52 = *(void *)(v60 + 8 * v49);
                  if (!v52)
                  {
                    uint64_t v49 = v42 + 4;
                    if (v42 + 4 >= v47) {
                      goto LABEL_13;
                    }
                    unint64_t v52 = *(void *)(v60 + 8 * v49);
                    if (!v52)
                    {
                      uint64_t v53 = v42 + 5;
                      while (v47 != v53)
                      {
                        unint64_t v52 = *(void *)(v60 + 8 * v53++);
                        if (v52)
                        {
                          uint64_t v49 = v53 - 1;
                          goto LABEL_66;
                        }
                      }
LABEL_13:
                      sub_23C977B28();
                      uint64_t v16 = v55;
                      a1 = v56;
                      os_log_type_t v5 = v61;
                      int64_t v24 = v54;
                      id v25 = v57;
LABEL_14:
                      swift_unknownObjectRelease();

                      id v1 = v58;
                      goto LABEL_15;
                    }
                  }
                }
              }
LABEL_66:
              a1 = (v52 - 1) & v52;
              unint64_t v48 = __clz(__rbit64(v52)) + (v49 << 6);
            }
            id v50 = *(id *)(*(void *)(v40 + 48) + 8 * v48);
            if (!v50) {
              goto LABEL_13;
            }
            while (1)
            {
              objc_msgSend(v37, sel_activitySystemApertureWithSceneHandle_requestsLaunchWithAction_, v61, v50);

              uint64_t v42 = v49;
              unint64_t v43 = a1;
              if ((v40 & 0x8000000000000000) == 0) {
                break;
              }
LABEL_50:
              if (sub_23C9912E0())
              {
                swift_unknownObjectRetain();
                swift_dynamicCast();
                id v50 = v62;
                swift_unknownObjectRelease();
                uint64_t v49 = v42;
                a1 = v43;
                if (v62) {
                  continue;
                }
              }
              goto LABEL_13;
            }
          }
        }
        objc_msgSend(v37, sel_activitySystemApertureWithSceneHandle_requestsLaunchWithAction_, v5, 0);
        goto LABEL_14;
      }
    }
LABEL_15:

    uint64_t v18 = v59;
    unint64_t v19 = (unint64_t)v1;
  }
  if (sub_23C9912E0())
  {
    sub_23C959038(0, (unint64_t *)&unk_26AF227F0);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v28 = v62;
    swift_unknownObjectRelease();
    uint64_t v27 = v18;
    id v1 = v19;
    if (v62) {
      goto LABEL_37;
    }
  }
LABEL_70:
  sub_23C977B28();
}

id sub_23C98E9F0(uint64_t a1)
{
  if (qword_268BBA5B8 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_23C990E40();
  __swift_project_value_buffer(v3, (uint64_t)qword_268BBA598);
  uint64_t v4 = v1;
  os_log_type_t v5 = sub_23C990E20();
  os_log_type_t v6 = sub_23C991140();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v13 = v8;
    *(_DWORD *)uint64_t v7 = 136446210;
    uint64_t v9 = *(void *)&v4[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_logIdentifier];
    unint64_t v10 = *(void *)&v4[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_logIdentifier + 8];
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_23C9733B0(v9, v10, &v13);
    sub_23C991240();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23C948000, v5, v6, "[%{public}s] Scene did receive new client settings.", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECEADB0](v8, -1, -1);
    MEMORY[0x23ECEADB0](v7, -1, -1);
  }
  else
  {
  }
  return objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_settingsDiffInspector], sel_inspectDiff_withContext_, a1, 0, v12, v13);
}

id sub_23C98EBC4@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  uint64_t v3 = (void **)(*a1 + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_scene);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *a2 = *v3;
  return v4;
}

id sub_23C98EC2C@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  uint64_t v3 = (void **)(*a1 + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_descriptor);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t sub_23C98EC94@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_delegate;
  swift_beginAccess();
  uint64_t result = MEMORY[0x23ECEAE20](v3);
  *a2 = result;
  return result;
}

uint64_t sub_23C98ECEC()
{
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_23C98ED44()
{
  return type metadata accessor for ActivitySystemApertureSceneHandle();
}

uint64_t sub_23C98ED4C()
{
  uint64_t result = sub_23C990C60();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for ActivitySystemApertureSceneHandle(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ActivitySystemApertureSceneHandle);
}

uint64_t dispatch thunk of ActivitySystemApertureSceneHandle.scene.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of ActivitySystemApertureSceneHandle.descriptor.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of ActivitySystemApertureSceneHandle.delegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of ActivitySystemApertureSceneHandle.delegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of ActivitySystemApertureSceneHandle.delegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of ActivitySystemApertureSceneHandle.invalidate()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x170))();
}

void sub_23C98EF94()
{
  sub_23C98C650(v0);
}

uint64_t sub_23C98EF9C()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t sub_23C98EFF4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

void sub_23C98F03C(void *a1)
{
  sub_23C98C2FC(a1, v1[2], v1[3], v1[4], v1[5], v1[6]);
}

uint64_t sub_23C98F04C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23C98F05C(uint64_t a1)
{
  return sub_23C96F214(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t sub_23C98F064()
{
  uint64_t v1 = sub_23C990C60();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v6 + 8, v5);
}

void sub_23C98F14C(void *a1)
{
  uint64_t v3 = *(void *)(sub_23C990C60() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = *(void **)(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8));
  sub_23C98C414(a1, v5, v6, v1 + v4, v7);
}

uint64_t sub_23C98F1EC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t SizeDimensionRequestType.description.getter(uint64_t a1)
{
  if (a1 == 1) {
    return 0x6465786966;
  }
  if (!a1) {
    return 0x63696D616E7964;
  }
  uint64_t result = sub_23C991500();
  __break(1u);
  return result;
}

BOOL SizeDimensionRequestType.init(rawValue:)(uint64_t a1)
{
  return a1 && a1 == 1;
}

double SizeDimensionRequest.minimum.getter()
{
  return *(double *)(v0 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum);
}

double SizeDimensionRequest.maximum.getter()
{
  return *(double *)(v0 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum);
}

uint64_t SizeDimensionRequest.type.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type);
}

uint64_t sub_23C98F2FC(char a1)
{
  return *(void *)&aMinimum_3[8 * a1];
}

id SizeDimensionRequest.__allocating_init(minimum:maximum:type:)(uint64_t a1, double a2, double a3)
{
  uint64_t v7 = (char *)objc_allocWithZone(v3);
  double v8 = 0.0;
  if (a2 > 0.0) {
    double v8 = a2;
  }
  *(double *)&v7[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum] = v8;
  *(double *)&v7[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum] = a3;
  *(void *)&v7[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type] = a1;
  v10.receiver = v7;
  v10.super_class = v3;
  return objc_msgSendSuper2(&v10, sel_init);
}

id SizeDimensionRequest.init(minimum:maximum:type:)(uint64_t a1, double a2, double a3)
{
  if (a2 <= 0.0) {
    a2 = 0.0;
  }
  *(double *)&v3[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum] = a2;
  *(double *)&v3[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum] = a3;
  *(void *)&v3[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type] = a1;
  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for SizeDimensionRequest();
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t type metadata accessor for SizeDimensionRequest()
{
  return self;
}

id SizeDimensionRequest.__allocating_init(minimum:maximum:)(double a1, double a2)
{
  id v5 = objc_allocWithZone(v2);
  return objc_msgSend(v5, sel_initWithMinimum_maximum_type_, 0, a1, a2);
}

id SizeDimensionRequest.init(minimum:maximum:)()
{
  return objc_msgSend(v0, sel_initWithMinimum_maximum_type_, 0);
}

id sub_23C98F50C(double a1)
{
  uint64_t v2 = (objc_class *)type metadata accessor for SizeDimensionRequest();
  uint64_t v3 = (char *)objc_allocWithZone(v2);
  double v4 = 0.0;
  if (a1 > 0.0) {
    double v4 = a1;
  }
  *(double *)&v3[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum] = v4;
  *(double *)&v3[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum] = a1;
  *(void *)&v3[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type] = 1;
  v6.receiver = v3;
  v6.super_class = v2;
  return objc_msgSendSuper2(&v6, sel_init);
}

double sub_23C98F590(double a1)
{
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type);
  if (v2 == 1) {
    return *(double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum);
  }
  double result = 0.0;
  if (!v2)
  {
    double result = *(double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum);
    if (result >= a1) {
      double result = a1;
    }
    if (result <= *(double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum)) {
      return *(double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum);
    }
  }
  return result;
}

uint64_t sub_23C98F614()
{
  double v1 = *(double *)(v0 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum);
  if ((~*(void *)&v1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (v1 <= -9.22337204e18)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (v1 >= 9.22337204e18)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v2 = 39 * (uint64_t)v1;
  if ((unsigned __int128)((uint64_t)v1 * (__int128)39) >> 64 != v2 >> 63)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  double v3 = *(double *)(v0 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum);
  if ((~*(void *)&v3 & 0x7FF0000000000000) == 0)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (v3 <= -9.22337204e18)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (v3 >= 9.22337204e18)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v4 = v2 * (uint64_t)v3;
  if ((unsigned __int128)(v2 * (__int128)(uint64_t)v3) >> 64 != v4 >> 63)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    return result;
  }
  uint64_t v5 = *(void *)(v0 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type);
  if (v5 >= 1) {
    uint64_t v5 = 1;
  }
  uint64_t result = v4 * v5;
  if ((unsigned __int128)(v4 * (__int128)v5) >> 64 != (v4 * v5) >> 63) {
    goto LABEL_21;
  }
  return result;
}

BOOL sub_23C98F70C(uint64_t a1)
{
  sub_23C9523D4(a1, (uint64_t)v6);
  if (v7)
  {
    type metadata accessor for SizeDimensionRequest();
    if (swift_dynamicCast())
    {
      if (*(double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum) == *(double *)&v5[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum]
        && *(double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum) == *(double *)&v5[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum])
      {
        uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type);
        uint64_t v3 = *(void *)&v5[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type];

        return v2 == v3;
      }
    }
  }
  else
  {
    sub_23C952480((uint64_t)v6);
  }
  return 0;
}

uint64_t sub_23C98F8B0()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29C40]), sel_initWithObject_, v0);
  if (!v1)
  {
    __break(1u);
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v2 = v1;
  if (*(void *)(v0 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type) <= 1uLL)
  {
    uint64_t v3 = (void *)sub_23C990FC0();
    swift_bridgeObjectRelease();
    uint64_t v4 = (void *)sub_23C990FC0();
    objc_msgSend(v2, sel_appendString_withName_, v3, v4);

    double v5 = *(double *)(v0 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum);
    objc_super v6 = (void *)sub_23C990FC0();

    double v7 = *(double *)(v0 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum);
    double v8 = (void *)sub_23C990FC0();

    id v9 = objc_msgSend(v2, sel_build);
    if (v9)
    {
      objc_super v10 = v9;
      uint64_t v11 = sub_23C990FD0();

      return v11;
    }
    goto LABEL_6;
  }
LABEL_7:
  uint64_t result = sub_23C991500();
  __break(1u);
  return result;
}

id sub_23C98FA94@<X0>(void *a1@<X8>)
{
  double v3 = *(double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum);
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum);
  uint64_t v5 = *(void *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type);
  objc_super v6 = (objc_class *)type metadata accessor for SizeDimensionRequest();
  double v7 = (char *)objc_allocWithZone(v6);
  double v8 = 0.0;
  if (v3 > 0.0) {
    double v8 = v3;
  }
  *(double *)&v7[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum] = v8;
  *(void *)&v7[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum] = v4;
  *(void *)&v7[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type] = v5;
  v10.receiver = v7;
  v10.super_class = v6;
  id result = objc_msgSendSuper2(&v10, sel_init);
  a1[3] = v6;
  *a1 = result;
  return result;
}

uint64_t static SizeDimensionRequest.supportsSecureCoding.getter()
{
  return 1;
}

void sub_23C98FBB4(void *a1)
{
  double v3 = *(double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum);
  uint64_t v4 = (void *)sub_23C990FC0();
  objc_msgSend(a1, sel_encodeDouble_forKey_, v4, v3);

  double v5 = *(double *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum);
  objc_super v6 = (void *)sub_23C990FC0();
  objc_msgSend(a1, sel_encodeDouble_forKey_, v6, v5);

  uint64_t v7 = *(void *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type);
  id v8 = (id)sub_23C990FC0();
  objc_msgSend(a1, sel_encodeInteger_forKey_, v7, v8);
}

id SizeDimensionRequest.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = sub_23C99009C(a1);

  return v4;
}

id SizeDimensionRequest.init(coder:)(void *a1)
{
  id v2 = sub_23C99009C(a1);

  return v2;
}

id SizeDimensionRequest.__allocating_init(xpcDictionary:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = sub_23C9901CC(a1);
  swift_unknownObjectRelease();
  return v4;
}

id SizeDimensionRequest.init(xpcDictionary:)(void *a1)
{
  id v1 = sub_23C9901CC(a1);
  swift_unknownObjectRelease();
  return v1;
}

void sub_23C98FE88(void *a1)
{
  if (a1)
  {
    BSSerializeDoubleToXPCDictionaryWithKey();
    BSSerializeDoubleToXPCDictionaryWithKey();
    int64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type);
    xpc_dictionary_set_int64(a1, "type", v3);
  }
}

id SizeDimensionRequest.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void SizeDimensionRequest.init()()
{
}

id SizeDimensionRequest.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SizeDimensionRequest();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_23C99009C(void *a1)
{
  int64_t v3 = v1;
  id v4 = (void *)sub_23C990FC0();
  objc_msgSend(a1, sel_decodeDoubleForKey_, v4);
  double v6 = v5;

  double v7 = 0.0;
  if (v6 > 0.0) {
    double v7 = v6;
  }
  *(double *)&v3[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum] = v7;
  id v8 = (void *)sub_23C990FC0();
  objc_msgSend(a1, sel_decodeDoubleForKey_, v8);
  uint64_t v10 = v9;

  *(void *)&v3[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum] = v10;
  uint64_t v11 = (void *)sub_23C990FC0();
  id v12 = objc_msgSend(a1, sel_decodeIntegerForKey_, v11);

  *(void *)&v3[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type] = v12 != 0;
  v14.receiver = v3;
  v14.super_class = (Class)type metadata accessor for SizeDimensionRequest();
  return objc_msgSendSuper2(&v14, sel_init);
}

id sub_23C9901CC(void *a1)
{
  int64_t v3 = v1;
  BSDeserializeDoubleFromXPCDictionaryWithKey();
  if (v4 <= 0.0) {
    double v4 = 0.0;
  }
  *(double *)&v3[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_minimum] = v4;
  id result = (id)BSDeserializeDoubleFromXPCDictionaryWithKey();
  *(void *)&v3[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum] = v6;
  if (a1)
  {
    *(void *)&v3[OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_type] = xpc_dictionary_get_int64(a1, "type") != 0;

    v7.receiver = v3;
    v7.super_class = (Class)type metadata accessor for SizeDimensionRequest();
    return objc_msgSendSuper2(&v7, sel_init);
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_23C990294()
{
  unint64_t result = qword_268BBB6B0;
  if (!qword_268BBB6B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BBB6B0);
  }
  return result;
}

ValueMetadata *type metadata accessor for SizeDimensionRequestType()
{
  return &type metadata for SizeDimensionRequestType;
}

uint64_t method lookup function for SizeDimensionRequest(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SizeDimensionRequest);
}

uint64_t dispatch thunk of SizeDimensionRequest.__allocating_init(minimum:maximum:type:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of static SizeDimensionRequest.fixed(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of SizeDimensionRequest.resolveIfNecessary(intrinsicLength:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of SizeDimensionRequest.copy(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of SizeDimensionRequest.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of SizeDimensionRequest.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of SizeDimensionRequest.__allocating_init(xpcDictionary:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of SizeDimensionRequest.encode(withXPCDictionary:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

id ActivityAmbientHostViewController.__allocating_init(activityDescriptor:systemMetricsRequest:payloadID:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = sub_23C990C60();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  id v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_allocWithZone(v4);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
  id v13 = objc_allocWithZone((Class)type metadata accessor for ActivitySceneDescriptor());
  id v14 = sub_23C98368C(2, (uint64_t)v12, a2, a3, a4);
  id v15 = ActivityHostViewController.init(activitySceneDescriptor:)(v14);

  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
  return v15;
}

id ActivityAmbientHostViewController.init(activityDescriptor:systemMetricsRequest:payloadID:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_23C990C60();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  id v12 = objc_allocWithZone((Class)type metadata accessor for ActivitySceneDescriptor());
  id v13 = sub_23C98368C(2, (uint64_t)v11, a2, a3, a4);
  id v14 = ActivityHostViewController.init(activitySceneDescriptor:)(v13);

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
  return v14;
}

id sub_23C990854()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for ActivityAmbientSceneSpecification());
  return objc_msgSend(v0, sel_init);
}

unint64_t sub_23C99088C()
{
  return 0xD000000000000011;
}

void ActivityAmbientHostViewController.__allocating_init(activitySceneDescriptor:)()
{
}

void ActivityAmbientHostViewController.init(activitySceneDescriptor:)()
{
}

id ActivityAmbientHostViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityAmbientHostViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ActivityAmbientHostViewController()
{
  return self;
}

uint64_t method lookup function for ActivityAmbientHostViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ActivityAmbientHostViewController);
}

uint64_t dispatch thunk of ActivityAmbientHostViewController.__allocating_init(activityDescriptor:systemMetricsRequest:payloadID:)()
{
  return (*(uint64_t (**)(void))(v0 + 1496))();
}

uint64_t sub_23C990AA0()
{
  return MEMORY[0x270EEE440]();
}

uint64_t sub_23C990AB0()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_23C990AC0()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_23C990AD0()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_23C990B20()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_23C990B30()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_23C990B40()
{
  return MEMORY[0x270EEFA08]();
}

uint64_t sub_23C990B50()
{
  return MEMORY[0x270EEFA18]();
}

uint64_t sub_23C990B60()
{
  return MEMORY[0x270EEFC00]();
}

uint64_t sub_23C990B70()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_23C990B80()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_23C990B90()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_23C990BA0()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_23C990BB0()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_23C990BC0()
{
  return MEMORY[0x270EEFF18]();
}

uint64_t sub_23C990BD0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_23C990BE0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_23C990BF0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_23C990C00()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_23C990C10()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_23C990C20()
{
  return MEMORY[0x270EE0710]();
}

uint64_t sub_23C990C30()
{
  return MEMORY[0x270EE0718]();
}

uint64_t sub_23C990C40()
{
  return MEMORY[0x270EE0728]();
}

uint64_t sub_23C990C50()
{
  return MEMORY[0x270EE0730]();
}

uint64_t sub_23C990C60()
{
  return MEMORY[0x270EE0738]();
}

uint64_t sub_23C990C70()
{
  return MEMORY[0x270EE07B8]();
}

uint64_t sub_23C990C80()
{
  return MEMORY[0x270EE07C8]();
}

uint64_t sub_23C990C90()
{
  return MEMORY[0x270EE07E0]();
}

uint64_t sub_23C990CA0()
{
  return MEMORY[0x270EE0810]();
}

uint64_t sub_23C990CB0()
{
  return MEMORY[0x270EE0818]();
}

uint64_t sub_23C990CC0()
{
  return MEMORY[0x270EE0858]();
}

uint64_t sub_23C990CD0()
{
  return MEMORY[0x270EE0860]();
}

uint64_t sub_23C990CE0()
{
  return MEMORY[0x270EE0868]();
}

uint64_t sub_23C990CF0()
{
  return MEMORY[0x270EE0870]();
}

uint64_t sub_23C990D00()
{
  return MEMORY[0x270EE0878]();
}

uint64_t sub_23C990D10()
{
  return MEMORY[0x270EE0880]();
}

uint64_t sub_23C990D20()
{
  return MEMORY[0x270EE0888]();
}

uint64_t sub_23C990D30()
{
  return MEMORY[0x270EE0890]();
}

uint64_t sub_23C990D40()
{
  return MEMORY[0x270EE0898]();
}

uint64_t sub_23C990D50()
{
  return MEMORY[0x270EE08A0]();
}

uint64_t sub_23C990D60()
{
  return MEMORY[0x270EE08B0]();
}

uint64_t sub_23C990D70()
{
  return MEMORY[0x270EE08B8]();
}

uint64_t sub_23C990D80()
{
  return MEMORY[0x270EE08C0]();
}

uint64_t sub_23C990D90()
{
  return MEMORY[0x270EE08C8]();
}

uint64_t sub_23C990DA0()
{
  return MEMORY[0x270EE08E0]();
}

uint64_t sub_23C990DB0()
{
  return MEMORY[0x270EE08F0]();
}

uint64_t sub_23C990DC0()
{
  return MEMORY[0x270EE08F8]();
}

uint64_t sub_23C990DD0()
{
  return MEMORY[0x270EE0900]();
}

uint64_t sub_23C990DE0()
{
  return MEMORY[0x270EE0908]();
}

uint64_t sub_23C990DF0()
{
  return MEMORY[0x270F5D000]();
}

uint64_t sub_23C990E00()
{
  return MEMORY[0x270F5D008]();
}

uint64_t sub_23C990E10()
{
  return MEMORY[0x270F5D010]();
}

uint64_t sub_23C990E20()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_23C990E30()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_23C990E40()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_23C990E50()
{
  return MEMORY[0x270EE3880]();
}

uint64_t sub_23C990E60()
{
  return MEMORY[0x270EE38A0]();
}

uint64_t sub_23C990E70()
{
  return MEMORY[0x270EE3950]();
}

uint64_t sub_23C990E80()
{
  return MEMORY[0x270EE3AD0]();
}

uint64_t sub_23C990E90()
{
  return MEMORY[0x270EE3BA8]();
}

uint64_t sub_23C990EA0()
{
  return MEMORY[0x270EE3C50]();
}

uint64_t sub_23C990EB0()
{
  return MEMORY[0x270EE3C70]();
}

uint64_t sub_23C990EC0()
{
  return MEMORY[0x270EE3CA8]();
}

uint64_t sub_23C990ED0()
{
  return MEMORY[0x270EE3CB0]();
}

uint64_t sub_23C990EE0()
{
  return MEMORY[0x270EE3CC0]();
}

uint64_t sub_23C990EF0()
{
  return MEMORY[0x270EE3E08]();
}

uint64_t sub_23C990F00()
{
  return MEMORY[0x270EE3E18]();
}

uint64_t sub_23C990F10()
{
  return MEMORY[0x270EE3E78]();
}

uint64_t sub_23C990F20()
{
  return MEMORY[0x270EE3FB8]();
}

uint64_t sub_23C990F30()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_23C990F40()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_23C990F50()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_23C990F60()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t sub_23C990F70()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t sub_23C990F80()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_23C990F90()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_23C990FA0()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_23C990FB0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_23C990FC0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_23C990FD0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_23C990FE0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_23C990FF0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_23C991000()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_23C991010()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_23C991020()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_23C991030()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_23C991040()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_23C991050()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_23C991060()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_23C991070()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_23C991080()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_23C991090()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_23C9910A0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_23C9910B0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_23C9910C0()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_23C9910D0()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_23C9910E0()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_23C9910F0()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_23C991100()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_23C991110()
{
  return MEMORY[0x270EF1E70]();
}

uint64_t sub_23C991120()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_23C991130()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_23C991140()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_23C991150()
{
  return MEMORY[0x270EF1F60]();
}

uint64_t sub_23C991160()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_23C991170()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_23C991180()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_23C991190()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_23C9911A0()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_23C9911B0()
{
  return MEMORY[0x270EE0910]();
}

uint64_t sub_23C9911C0()
{
  return MEMORY[0x270EF2060]();
}

uint64_t sub_23C9911D0()
{
  return MEMORY[0x270EF20F8]();
}

uint64_t sub_23C9911E0()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_23C9911F0()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_23C991200()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_23C991210()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_23C991220()
{
  return MEMORY[0x270EF21A8]();
}

uint64_t sub_23C991230()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_23C991240()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_23C991250()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_23C991260()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_23C991270()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_23C991280()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_23C991290()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_23C9912A0()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_23C9912B0()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_23C9912C0()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_23C9912D0()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_23C9912E0()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_23C9912F0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_23C991300()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_23C991310()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_23C991320()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_23C991330()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_23C991340()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_23C991350()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_23C991360()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_23C991370()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_23C991380()
{
  return MEMORY[0x270F9EF50]();
}

uint64_t sub_23C991390()
{
  return MEMORY[0x270F9EF88]();
}

uint64_t sub_23C9913A0()
{
  return MEMORY[0x270F9EFB0]();
}

uint64_t sub_23C9913B0()
{
  return MEMORY[0x270F9EFC0]();
}

uint64_t sub_23C9913C0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_23C9913D0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_23C9913E0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_23C9913F0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_23C991400()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_23C991410()
{
  return MEMORY[0x270F9F0A8]();
}

uint64_t sub_23C991420()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_23C991430()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_23C991440()
{
  return MEMORY[0x270F9F218]();
}

uint64_t sub_23C991450()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_23C991460()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_23C991470()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_23C991480()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_23C991490()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_23C9914A0()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_23C9914B0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_23C9914C0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_23C9914D0()
{
  return MEMORY[0x270F9F730]();
}

uint64_t sub_23C9914E0()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_23C9914F0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_23C991500()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_23C991510()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_23C991520()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_23C991530()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_23C991560()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_23C991570()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_23C991580()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_23C991590()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_23C9915A0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_23C9915B0()
{
  return MEMORY[0x270F9FC30]();
}

uint64_t sub_23C9915C0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_23C9915D0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_23C9915E0()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_23C9915F0()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_23C991600()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_23C991610()
{
  return MEMORY[0x270F9FC88]();
}

uint64_t sub_23C991620()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_23C991630()
{
  return MEMORY[0x270F9FC98]();
}

uint64_t sub_23C991640()
{
  return MEMORY[0x270EF2760]();
}

uint64_t sub_23C991650()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_23C991660()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_23C991670()
{
  return MEMORY[0x270FA0080]();
}

uint64_t sub_23C9916A0()
{
  return MEMORY[0x270FA0128]();
}

uint64_t BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler()
{
  return MEMORY[0x270F10580]();
}

uint64_t BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey()
{
  return MEMORY[0x270F10708]();
}

uint64_t BSDeserializeCGFloatFromXPCDictionaryWithKey()
{
  return MEMORY[0x270F10710]();
}

uint64_t BSDeserializeCGSizeFromXPCDictionaryWithKey()
{
  return MEMORY[0x270F10720]();
}

uint64_t BSDeserializeDataFromXPCDictionaryWithKey()
{
  return MEMORY[0x270F10728]();
}

uint64_t BSDeserializeDoubleFromXPCDictionaryWithKey()
{
  return MEMORY[0x270F10730]();
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x270F10748]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x270F10758]();
}

uint64_t BSEqualSets()
{
  return MEMORY[0x270F107C0]();
}

uint64_t BSIsSymbolicLinkAtPath()
{
  return MEMORY[0x270F10868]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x270F108D8]();
}

uint64_t BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey()
{
  return MEMORY[0x270F108F8]();
}

uint64_t BSSerializeCGFloatToXPCDictionaryWithKey()
{
  return MEMORY[0x270F10900]();
}

uint64_t BSSerializeCGSizeToXPCDictionaryWithKey()
{
  return MEMORY[0x270F10910]();
}

uint64_t BSSerializeDataToXPCDictionaryWithKey()
{
  return MEMORY[0x270F10918]();
}

uint64_t BSSerializeDoubleToXPCDictionaryWithKey()
{
  return MEMORY[0x270F10920]();
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

BOOL CGSizeEqualToSize(CGSize size1, CGSize size2)
{
  return MEMORY[0x270EE7348]((__n128)size1, *(__n128 *)&size1.height, (__n128)size2, *(__n128 *)&size2.height);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x270F82EB8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
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

{
  return MEMORY[0x270F9A3C0]();
}

{
  return MEMORY[0x270F9A3C8]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x270ED95D0](label);
}

void dispatch_workloop_set_autorelease_frequency(dispatch_workloop_t workloop, dispatch_autorelease_frequency_t frequency)
{
}

uint64_t dispatch_workloop_set_qos_class_floor()
{
  return MEMORY[0x270ED95F8]();
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

void objc_enumerationMutation(id obj)
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
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

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
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

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC088](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}