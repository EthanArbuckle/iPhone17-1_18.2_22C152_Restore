id _CNCinematicError(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v9;
  void v10[2];
  uint64_t vars8;

  v10[1] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F087E8];
  if (a2)
  {
    v9 = *MEMORY[0x263F08608];
    v10[0] = a2;
    v4 = NSDictionary;
    v5 = a2;
    v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];
    v7 = [v3 errorWithDomain:@"CNCinematicErrorDomain" code:a1 userInfo:v6];
  }
  else
  {
    v6 = 0;
    v7 = [v3 errorWithDomain:@"CNCinematicErrorDomain" code:a1 userInfo:0];
  }

  return v7;
}

void sub_24326A168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
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

void _CNLoadFirstAssociatedTrack(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = ___CNLoadFirstAssociatedTrack_block_invoke;
  v11[3] = &unk_26517A3B0;
  id v12 = v6;
  id v13 = v5;
  id v14 = v7;
  id v8 = v7;
  id v9 = v5;
  id v10 = v6;
  [v9 loadAssociatedTracksOfType:v10 completionHandler:v11];
}

void sub_24326B688(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_2(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_24326E6FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_24326E944(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_24326EB70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24326EDBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24326F048(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_24326F2C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24326F5C8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_24326F828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24326FA90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24326FCF8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_24326FF58(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_2432701B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_243270420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_243270680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2432708DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_243270B2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_243270E58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2432710B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2432712DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2432715AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2432717AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_243271A78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_243271CC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id _CNLogSystem()
{
  if (_CNLogSystem_onceToken[0] != -1) {
    dispatch_once(_CNLogSystem_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)_CNLogSystem_log;

  return v0;
}

id sub_243273240()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_detectionType);
}

id sub_243273250()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_detectionID);
}

id sub_243273260()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_detectionGroupID);
}

id sub_243273270()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_isUserCreated);
}

id sub_243273294()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_isDiscrete);
}

id sub_2432732B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  return sub_2432732D0(a1, a2, a3, (const char **)&selRef_detectionAtOrBeforeTime_, a4);
}

id sub_2432732C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  return sub_2432732D0(a1, a2, a3, (const char **)&selRef_detectionNearestTime_, a4);
}

id sub_2432732D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, const char **a4@<X3>, void *a5@<X8>)
{
  id v7 = *(void **)(v5 + 16);
  id v8 = *a4;
  v10[0] = a1;
  v10[1] = a2;
  v10[2] = a3;
  id result = objc_msgSend(v7, v8, v10);
  *a5 = result;
  return result;
}

char *sub_243273328(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = *(void **)(v1 + 16);
  v14[0] = *(void *)a1;
  v14[1] = *(void *)(a1 + 8);
  long long v15 = *(_OWORD *)(a1 + 16);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = v2;
  id v4 = objc_msgSend(v3, sel_detectionsInTimeRange_, v14);
  sub_2432734D0();
  unint64_t v5 = sub_2432799D8();

  if (!(v5 >> 62))
  {
    uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v6) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_243279A68();
  swift_bridgeObjectRelease();
  if (!v6) {
    goto LABEL_13;
  }
LABEL_3:
  v14[0] = MEMORY[0x263F8EE78];
  id result = sub_243273DD0(0, v6 & ~(v6 >> 63), 0);
  if ((v6 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = 0;
    uint64_t v9 = v14[0];
    do
    {
      if ((v5 & 0xC000000000000001) != 0) {
        id v10 = (id)MEMORY[0x245677580](v8, v5);
      }
      else {
        id v10 = *(id *)(v5 + 8 * v8 + 32);
      }
      id v11 = v10;
      v14[0] = v9;
      unint64_t v13 = *(void *)(v9 + 16);
      unint64_t v12 = *(void *)(v9 + 24);
      if (v13 >= v12 >> 1)
      {
        sub_243273DD0((char *)(v12 > 1), v13 + 1, 1);
        uint64_t v9 = v14[0];
      }
      ++v8;
      *(void *)(v9 + 16) = v13 + 1;
      *(void *)(v9 + 8 * v13 + 32) = v11;
    }
    while (v6 != v8);
    swift_bridgeObjectRelease();
    return (char *)v9;
  }
  __break(1u);
  return result;
}

unint64_t sub_2432734D0()
{
  unint64_t result = qword_268D903B0;
  if (!qword_268D903B0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268D903B0);
  }
  return result;
}

uint64_t CNDetectionTrack.deinit()
{
  return v0;
}

uint64_t CNDetectionTrack.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t CNFixedDetectionTrack.__allocating_init(focusDisparity:)(float a1)
{
  uint64_t v2 = swift_allocObject();
  id v3 = objc_allocWithZone((Class)CNFixedDetectionTrack);
  *(float *)&double v4 = a1;
  *(void *)(v2 + 16) = objc_msgSend(v3, sel_initWithFocusDisparity_, v4);
  return v2;
}

uint64_t CNFixedDetectionTrack.init(focusDisparity:)(float a1)
{
  id v3 = objc_allocWithZone((Class)CNFixedDetectionTrack);
  *(float *)&double v4 = a1;
  *(void *)(v1 + 16) = objc_msgSend(v3, sel_initWithFocusDisparity_, v4);
  return v1;
}

uint64_t CNFixedDetectionTrack.__allocating_init(originalDetection:)(void **a1)
{
  uint64_t v2 = swift_allocObject();
  id v3 = *a1;
  id v4 = objc_msgSend(objc_allocWithZone((Class)CNFixedDetectionTrack), sel_initWithOriginalDetection_, v3);

  *(void *)(v2 + 16) = v4;
  return v2;
}

uint64_t CNFixedDetectionTrack.init(originalDetection:)(void *a1)
{
  uint64_t v2 = (void *)*a1;
  id v3 = objc_msgSend(objc_allocWithZone((Class)CNFixedDetectionTrack), sel_initWithOriginalDetection_, *a1);

  *(void *)(v1 + 16) = v3;
  return v1;
}

id sub_2432736CC()
{
  self;
  uint64_t v0 = (void *)swift_dynamicCastObjCClassUnconditional();

  return objc_msgSend(v0, sel_focusDisparity);
}

id sub_243273728@<X0>(void *a1@<X8>)
{
  self;
  id result = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_originalDetection);
  *a1 = result;
  return result;
}

uint64_t CNFixedDetectionTrack.deinit()
{
  return v0;
}

uint64_t CNFixedDetectionTrack.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t CNCustomDetectionTrack.__allocating_init(detections:smooth:)(uint64_t a1, char a2)
{
  uint64_t v4 = swift_allocObject();
  CNCustomDetectionTrack.init(detections:smooth:)(a1, a2);
  return v4;
}

uint64_t CNCustomDetectionTrack.init(detections:smooth:)(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6)
  {
    sub_243279A38();
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = v7 + 1;
      id v9 = *(id *)(a1 + 8 * v7 + 32);
      sub_243279A18();
      sub_243279A48();
      sub_243279A58();
      sub_243279A28();
      uint64_t v7 = v8;
    }
    while (v6 != v8);
  }
  swift_bridgeObjectRelease();
  id v10 = objc_allocWithZone((Class)CNCustomDetectionTrack);
  sub_2432734D0();
  id v11 = (void *)sub_2432799C8();
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(v10, sel_initWithDetections_smooth_, v11, a2 & 1);

  *(void *)(v3 + 16) = v12;
  return v3;
}

char *sub_243273968()
{
  self;
  id v0 = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_allDetections);
  sub_2432734D0();
  unint64_t v1 = sub_2432799D8();

  if (!(v1 >> 62))
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v2) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_243279A68();
  swift_bridgeObjectRelease();
  if (!v2) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t v10 = MEMORY[0x263F8EE78];
  id result = sub_243273DD0(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    uint64_t v4 = 0;
    uint64_t v5 = v10;
    do
    {
      if ((v1 & 0xC000000000000001) != 0) {
        id v6 = (id)MEMORY[0x245677580](v4, v1);
      }
      else {
        id v6 = *(id *)(v1 + 8 * v4 + 32);
      }
      id v7 = v6;
      unint64_t v9 = *(void *)(v10 + 16);
      unint64_t v8 = *(void *)(v10 + 24);
      if (v9 >= v8 >> 1) {
        sub_243273DD0((char *)(v8 > 1), v9 + 1, 1);
      }
      ++v4;
      *(void *)(v10 + 16) = v9 + 1;
      *(void *)(v10 + 8 * v9 + 32) = v7;
    }
    while (v2 != v4);
    swift_bridgeObjectRelease();
    return (char *)v5;
  }
  __break(1u);
  return result;
}

uint64_t sub_243273B08()
{
  return MEMORY[0x270EF26E0](*v0);
}

uint64_t sub_243273B18@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_243279AB8();
  *a1 = result;
  return result;
}

uint64_t sub_243273B40(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = 0;
  char v7 = 1;
  uint64_t result = MEMORY[0x245677610](a1, &v6);
  uint64_t v4 = v6;
  char v5 = v7;
  if (v7) {
    uint64_t v4 = 0;
  }
  *(void *)a2 = v4;
  *(unsigned char *)(a2 + 8) = v5;
  return result;
}

uint64_t sub_243273B94(uint64_t a1, uint64_t a2)
{
  char v3 = sub_243279AA8();
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  return v3 & 1;
}

void *sub_243273BEC@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_243273BFC(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_243273C08()
{
  return sub_243279A78();
}

uint64_t sub_243273CC4()
{
  return sub_243279A78();
}

uint64_t sub_243273D80()
{
  return MEMORY[0x270F9FB70](*v0);
}

uint64_t sub_243273D88()
{
  return sub_243279AE8();
}

uint64_t sub_243273DB4(uint64_t a1)
{
  return MEMORY[0x270F9FC40](a1, *v1);
}

BOOL sub_243273DBC(void *a1, void *a2)
{
  return *a1 == *a2;
}

char *sub_243273DD0(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_2432745C4(a1, a2, a3, *v3, &qword_268D90450);
  void *v3 = result;
  return result;
}

uint64_t type metadata accessor for CNDetectionTrack()
{
  return self;
}

uint64_t method lookup function for CNDetectionTrack(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CNDetectionTrack);
}

uint64_t dispatch thunk of CNDetectionTrack.detectionType.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of CNDetectionTrack.detectionID.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of CNDetectionTrack.detectionGroupID.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of CNDetectionTrack.isUserCreated.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of CNDetectionTrack.isDiscrete.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of CNDetectionTrack.detection(atOrBefore:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of CNDetectionTrack.detection(nearest:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of CNDetectionTrack.detections(in:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  char v3 = *(uint64_t (**)(void *))(*(void *)v1 + 152);
  v5[0] = *(void *)a1;
  v5[1] = *(void *)(a1 + 8);
  long long v6 = *(_OWORD *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = v2;
  return v3(v5);
}

uint64_t type metadata accessor for CNFixedDetectionTrack()
{
  return self;
}

uint64_t method lookup function for CNFixedDetectionTrack(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CNFixedDetectionTrack);
}

uint64_t dispatch thunk of CNFixedDetectionTrack.__allocating_init(focusDisparity:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of CNFixedDetectionTrack.__allocating_init(originalDetection:)()
{
  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of CNFixedDetectionTrack.focusDisparity.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of CNFixedDetectionTrack.originalDetection.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t type metadata accessor for CNCustomDetectionTrack()
{
  return self;
}

uint64_t method lookup function for CNCustomDetectionTrack(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CNCustomDetectionTrack);
}

uint64_t dispatch thunk of CNCustomDetectionTrack.__allocating_init(detections:smooth:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of CNCustomDetectionTrack.allDetections.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_2432740D4(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_2432740F4(uint64_t result, int a2, int a3)
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

void type metadata accessor for CNDetectionGroupID(uint64_t a1)
{
}

void type metadata accessor for CNDetectionID(uint64_t a1)
{
}

void type metadata accessor for CNRenderingQuality(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for CNBoundsPrediction(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_2432741B8(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_2432741D8(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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
  *(unsigned char *)(result + 48) = v3;
  return result;
}

void type metadata accessor for CGAffineTransform(uint64_t a1)
{
}

uint64_t sub_243274224()
{
  return sub_2432742B4(&qword_268D903E0, type metadata accessor for CNDetectionID);
}

uint64_t sub_24327426C()
{
  return sub_2432742B4(&qword_268D903E8, type metadata accessor for CNDetectionID);
}

uint64_t sub_2432742B4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2432742FC()
{
  return sub_2432742B4(&qword_268D903F0, type metadata accessor for CNDetectionID);
}

uint64_t sub_243274344()
{
  return sub_2432742B4(&qword_268D903F8, type metadata accessor for CNDetectionGroupID);
}

uint64_t sub_24327438C()
{
  return sub_2432742B4(&qword_268D90400, type metadata accessor for CNDetectionGroupID);
}

uint64_t sub_2432743D4()
{
  return sub_2432742B4(&qword_268D90408, type metadata accessor for CNDetectionGroupID);
}

char *sub_24327441C(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_2432744CC(a1, a2, a3, *v3, &qword_268D90448);
  void *v3 = result;
  return result;
}

char *sub_243274444(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_2432744CC(a1, a2, a3, *v3, &qword_268D90440);
  void *v3 = result;
  return result;
}

char *sub_24327446C(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_2432745C4(a1, a2, a3, *v3, &qword_268D90438);
  void *v3 = result;
  return result;
}

char *sub_24327449C(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_2432745C4(a1, a2, a3, *v3, &qword_268D90430);
  void *v3 = result;
  return result;
}

char *sub_2432744CC(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6 = (char)result;
  if (a3)
  {
    unint64_t v7 = *((void *)a4 + 3);
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
  uint64_t v9 = *((void *)a4 + 2);
  if (v8 <= v9) {
    uint64_t v10 = *((void *)a4 + 2);
  }
  else {
    uint64_t v10 = v8;
  }
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    id v11 = (char *)swift_allocObject();
    int64_t v12 = _swift_stdlib_malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 29;
    }
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * (v13 >> 2);
  }
  else
  {
    id v11 = (char *)MEMORY[0x263F8EE78];
  }
  id v14 = v11 + 32;
  long long v15 = a4 + 32;
  if (v6)
  {
    if (v11 != a4 || v14 >= &v15[4 * v9]) {
      memmove(v14, v15, 4 * v9);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 4 * v9);
  }
  swift_release();
  return v11;
}

char *sub_2432745C4(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6 = (char)result;
  if (a3)
  {
    unint64_t v7 = *((void *)a4 + 3);
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
  uint64_t v9 = *((void *)a4 + 2);
  if (v8 <= v9) {
    uint64_t v10 = *((void *)a4 + 2);
  }
  else {
    uint64_t v10 = v8;
  }
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    id v11 = (char *)swift_allocObject();
    int64_t v12 = _swift_stdlib_malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 25;
    }
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * (v13 >> 3);
  }
  else
  {
    id v11 = (char *)MEMORY[0x263F8EE78];
  }
  id v14 = v11 + 32;
  long long v15 = a4 + 32;
  if (v6)
  {
    if (v11 != a4 || v14 >= &v15[8 * v9]) {
      memmove(v14, v15, 8 * v9);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v11;
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

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_243274720(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_243274740(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_243274790(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t CNRenderingSession.Attributes.init(asset:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 128) = a1;
  *(void *)(v2 + 136) = a2;
  return MEMORY[0x270FA2498](sub_24327482C, 0, 0);
}

uint64_t sub_24327482C()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = self;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_243274944;
  uint64_t v3 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_243274B54;
  v0[13] = &block_descriptor;
  v0[14] = v3;
  objc_msgSend(v2, sel_loadFromAsset_completionHandler_, v1, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_243274944()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 144) = v1;
  if (v1) {
    uint64_t v2 = sub_243274AE4;
  }
  else {
    uint64_t v2 = sub_243274A54;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_243274A54()
{
  uint64_t v2 = *(void **)(v0 + 128);
  uint64_t v1 = *(void **)(v0 + 136);
  id v3 = *(id *)(v0 + 120);
  id v4 = objc_msgSend(v3, sel_renderingVersion);

  *uint64_t v2 = v3;
  v2[1] = v4;
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_243274AE4()
{
  uint64_t v1 = *(void **)(v0 + 136);
  swift_willThrow();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_243274B54(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_268D90550);
    uint64_t v5 = swift_allocError();
    *char v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    if (a2)
    {
      **(void **)(*(void *)(v3 + 64) + 40) = a2;
      id v8 = a2;
      a1 = v3;
    }
    else
    {
      __break(1u);
    }
    return MEMORY[0x270FA2408](a1);
  }
}

uint64_t CNRenderingSession.Attributes.renderingVersion.getter()
{
  return *(void *)(v0 + 8);
}

void CNRenderingSession.FrameAttributes.init(sampleBuffer:sessionAttributes:)(void *a1@<X0>, void **a2@<X1>, void *a3@<X8>)
{
}

void CNRenderingSession.FrameAttributes.init(timedMetadataGroup:sessionAttributes:)(void *a1@<X0>, void **a2@<X1>, void *a3@<X8>)
{
}

void sub_243274C34(void *a1@<X0>, void **a2@<X1>, SEL *a3@<X2>, void *a4@<X8>)
{
  id v7 = *a2;
  id v8 = objc_allocWithZone((Class)CNRenderingSessionFrameAttributes);
  id v9 = a1;
  id v10 = objc_msgSend(v8, *a3, v9, v7);

  if (v10)
  {
    id v11 = v10;
    objc_msgSend(v11, sel_focusDisparity);
    unsigned int v13 = v12;
    objc_msgSend(v11, sel_fNumber);
    unsigned int v15 = v14;

    unint64_t v16 = v13 | ((unint64_t)v15 << 32);
  }
  else
  {

    unint64_t v16 = 0;
  }
  *a4 = v10;
  a4[1] = v16;
}

float CNRenderingSession.FrameAttributes.focusDisparity.getter()
{
  return *(float *)(v0 + 8);
}

void CNRenderingSession.FrameAttributes.focusDisparity.setter(float a1)
{
  *(float *)(v1 + 8) = a1;
}

uint64_t (*CNRenderingSession.FrameAttributes.focusDisparity.modify())()
{
  return nullsub_1;
}

float CNRenderingSession.FrameAttributes.fNumber.getter()
{
  return *(float *)(v0 + 12);
}

void CNRenderingSession.FrameAttributes.fNumber.setter(float a1)
{
  *(float *)(v1 + 12) = a1;
}

uint64_t (*CNRenderingSession.FrameAttributes.fNumber.modify())()
{
  return nullsub_1;
}

uint64_t CNRenderingSession.__allocating_init(commandQueue:sessionAttributes:preferredTransform:quality:)(uint64_t a1, uint64_t *a2, long long *a3, uint64_t a4)
{
  long long v15 = a3[1];
  long long v16 = *a3;
  uint64_t v8 = *((void *)a3 + 4);
  uint64_t v9 = *((void *)a3 + 5);
  uint64_t v10 = swift_allocObject();
  uint64_t v12 = *a2;
  uint64_t v11 = a2[1];
  v17[0] = v16;
  v17[1] = v15;
  uint64_t v18 = v8;
  uint64_t v19 = v9;
  *(void *)(v10 + 16) = objc_msgSend(objc_allocWithZone((Class)CNRenderingSession), sel_initWithCommandQueue_sessionAttributes_preferredTransform_quality_, a1, v12, v17, a4);
  *(void *)(v10 + 24) = a1;
  *(void *)(v10 + 32) = v12;
  *(void *)(v10 + 40) = v11;
  long long v13 = a3[1];
  *(_OWORD *)(v10 + 48) = *a3;
  *(_OWORD *)(v10 + 64) = v13;
  *(_OWORD *)(v10 + 80) = a3[2];
  *(void *)(v10 + 96) = a4;
  return v10;
}

uint64_t CNRenderingSession.init(commandQueue:sessionAttributes:preferredTransform:quality:)(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  long long v14 = *(_OWORD *)(a3 + 16);
  uint64_t v8 = *(void *)(a3 + 32);
  uint64_t v9 = *(void *)(a3 + 40);
  uint64_t v10 = *a2;
  uint64_t v11 = a2[1];
  v15[0] = *(_OWORD *)a3;
  v15[1] = v14;
  uint64_t v16 = v8;
  uint64_t v17 = v9;
  *(void *)(v4 + 16) = objc_msgSend(objc_allocWithZone((Class)CNRenderingSession), sel_initWithCommandQueue_sessionAttributes_preferredTransform_quality_, a1, v10, v15, a4);
  *(void *)(v4 + 24) = a1;
  *(void *)(v4 + 32) = v10;
  *(void *)(v4 + 40) = v11;
  long long v12 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v4 + 48) = *(_OWORD *)a3;
  *(_OWORD *)(v4 + 64) = v12;
  *(_OWORD *)(v4 + 80) = *(_OWORD *)(a3 + 32);
  *(void *)(v4 + 96) = a4;
  return v4;
}

uint64_t CNRenderingSession.commandQueue.getter()
{
  return MEMORY[0x270FA05A0](*(void *)(v0 + 24));
}

id CNRenderingSession.sessionAttributes.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void **)(v1 + 32);
  uint64_t v3 = *(void *)(v1 + 40);
  *a1 = v2;
  a1[1] = v3;
  return v2;
}

__n128 CNRenderingSession.preferredTransform.getter@<Q0>(uint64_t a1@<X8>)
{
  long long v2 = *(_OWORD *)(v1 + 64);
  *(_OWORD *)a1 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(v1 + 80);
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t CNRenderingSession.quality.getter()
{
  return *(void *)(v0 + 96);
}

id sub_243274F20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_243274F38(a1, a2, a3, a4, a5, (SEL *)&selRef_encodeRenderToCommandBuffer_frameAttributes_sourceImage_sourceDisparity_destinationImage_);
}

id sub_243274F2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_243274F38(a1, a2, a3, a4, a5, (SEL *)&selRef_encodeRenderToCommandBuffer_frameAttributes_sourceImage_sourceDisparity_destinationRGBA_);
}

id sub_243274F38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, SEL *a6)
{
  int v12 = *(_DWORD *)(a2 + 8);
  int v13 = *(_DWORD *)(a2 + 12);
  long long v14 = *(void **)(v6 + 16);
  id v15 = *(id *)a2;
  objc_msgSend(v15, sel_mutableCopy);
  sub_2432799F8();
  swift_unknownObjectRelease();
  sub_24327518C(0, &qword_268D904D8);
  swift_dynamicCast();
  LODWORD(v16) = v12;
  objc_msgSend(v20, sel_setFocusDisparity_, v16);
  LODWORD(v17) = v13;
  objc_msgSend(v20, sel_setFNumber_, v17);

  id v18 = objc_msgSend(v14, *a6, a1, v20, a3, a4, a5);
  return v18;
}

id sub_243275058(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v12 = *(_DWORD *)(a2 + 8);
  int v13 = *(_DWORD *)(a2 + 12);
  long long v14 = *(void **)(v6 + 16);
  id v15 = *(id *)a2;
  objc_msgSend(v15, sel_mutableCopy);
  sub_2432799F8();
  swift_unknownObjectRelease();
  sub_24327518C(0, &qword_268D904D8);
  swift_dynamicCast();
  LODWORD(v16) = v12;
  objc_msgSend(v20, sel_setFocusDisparity_, v16);
  LODWORD(v17) = v13;
  objc_msgSend(v20, sel_setFNumber_, v17);

  id v18 = objc_msgSend(v14, sel_encodeRenderToCommandBuffer_frameAttributes_sourceImage_sourceDisparity_destinationLuma_destinationChroma_, a1, v20, a3, a4, a5, a6);
  return v18;
}

char *static CNRenderingSession.sourcePixelFormatTypes.getter()
{
  return sub_2432751D4((SEL *)&selRef_sourcePixelFormatTypes);
}

uint64_t sub_24327518C(uint64_t a1, unint64_t *a2)
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

char *static CNRenderingSession.destinationPixelFormatTypes.getter()
{
  return sub_2432751D4((SEL *)&selRef_destinationPixelFormatTypes);
}

char *sub_2432751D4(SEL *a1)
{
  id v1 = [self *a1];
  sub_24327518C(0, (unint64_t *)&unk_268D904E0);
  unint64_t v2 = sub_2432799D8();

  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v3) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_243279A68();
  swift_bridgeObjectRelease();
  if (!v3) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t v12 = MEMORY[0x263F8EE78];
  uint64_t result = sub_24327441C(0, v3 & ~(v3 >> 63), 0);
  if ((v3 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = 0;
    uint64_t v6 = v12;
    do
    {
      if ((v2 & 0xC000000000000001) != 0) {
        id v7 = (id)MEMORY[0x245677580](v5, v2);
      }
      else {
        id v7 = *(id *)(v2 + 8 * v5 + 32);
      }
      uint64_t v8 = v7;
      unsigned int v9 = objc_msgSend(v7, sel_unsignedIntValue);

      unint64_t v11 = *(void *)(v12 + 16);
      unint64_t v10 = *(void *)(v12 + 24);
      if (v11 >= v10 >> 1) {
        sub_24327441C((char *)(v10 > 1), v11 + 1, 1);
      }
      ++v5;
      *(void *)(v12 + 16) = v11 + 1;
      *(_DWORD *)(v12 + 4 * v11 + 32) = v9;
    }
    while (v3 != v5);
    swift_bridgeObjectRelease();
    return (char *)v6;
  }
  __break(1u);
  return result;
}

uint64_t CNRenderingSession.deinit()
{
  swift_unknownObjectRelease();
  return v0;
}

uint64_t CNRenderingSession.__deallocating_deinit()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0228](v0, 104, 7);
}

uint64_t type metadata accessor for CNRenderingSession()
{
  return self;
}

uint64_t method lookup function for CNRenderingSession(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CNRenderingSession);
}

uint64_t dispatch thunk of CNRenderingSession.__allocating_init(commandQueue:sessionAttributes:preferredTransform:quality:)(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, _OWORD *))(v3 + 120);
  long long v5 = a3[1];
  v7[0] = *a3;
  v7[1] = v5;
  v7[2] = a3[2];
  return v4(a1, a2, v7);
}

uint64_t dispatch thunk of CNRenderingSession.encodeRender(to:frameAttributes:sourceImage:sourceDisparity:destinationImage:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of CNRenderingSession.encodeRender(to:frameAttributes:sourceImage:sourceDisparity:destinationRGBA:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of CNRenderingSession.encodeRender(to:frameAttributes:sourceImage:sourceDisparity:destinationLuma:destinationChroma:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

void *initializeBufferWithCopyOfBuffer for CNRenderingSession.Attributes(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  return a1;
}

void destroy for CNRenderingSession.Attributes(id *a1)
{
}

uint64_t assignWithCopy for CNRenderingSession.Attributes(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  return a1;
}

uint64_t assignWithTake for CNRenderingSession.Attributes(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  return a1;
}

ValueMetadata *type metadata accessor for CNRenderingSession.Attributes()
{
  return &type metadata for CNRenderingSession.Attributes;
}

void *initializeBufferWithCopyOfBuffer for CNRenderingSession.FrameAttributes(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  *a1 = *(void *)a2;
  a1[1] = *(void *)(a2 + 8);
  id v4 = v3;
  return a1;
}

uint64_t assignWithCopy for CNRenderingSession.FrameAttributes(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 12) = *(_DWORD *)(a2 + 12);
  return a1;
}

uint64_t assignWithTake for CNRenderingSession.FrameAttributes(uint64_t a1, void *a2)
{
  id v4 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  return a1;
}

uint64_t _s9Cinematic18CNRenderingSessionC10AttributesVwet_0(uint64_t *a1, int a2)
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

uint64_t sub_2432756D8(uint64_t result, int a2, int a3)
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CNRenderingSession.FrameAttributes()
{
  return &type metadata for CNRenderingSession.FrameAttributes;
}

Cinematic::CNDetection __swiftcall CNDetection.init(time:detectionType:normalizedRect:focusDisparity:)(CMTime time, CNDetectionType detectionType, __C::CGRect normalizedRect, Swift::Float focusDisparity)
{
  double height = normalizedRect.size.height;
  double width = normalizedRect.size.width;
  double y = normalizedRect.origin.y;
  double x = normalizedRect.origin.x;
  CMTimeEpoch epoch = time.epoch;
  CMTimeScale timescale = time.timescale;
  CMTimeValue value = time.value;
  int v13 = v4;
  CMTimeFlags flags = time.flags;
  id v15 = objc_allocWithZone((Class)CNDetection);
  CMTimeValue v20 = value;
  CMTimeScale v21 = timescale;
  CMTimeFlags v22 = flags;
  CMTimeEpoch v23 = epoch;
  *(Swift::Float *)&double v16 = focusDisparity;
  double v17 = (objc_class *)objc_msgSend(v15, sel_initWithTime_detectionType_normalizedRect_focusDisparity_, &v20, 0, x, y, width, height, v16);
  *int v13 = v17;
  result.internalDetection._creationHash = v19;
  result.internalDetection._internalDetection = v18;
  result.internalDetection.super.isa = v17;
  return result;
}

uint64_t CNDetection.time.getter()
{
  objc_msgSend(*v0, sel_time);
  return v2;
}

id CNDetection.detectionType.getter()
{
  return objc_msgSend(*v0, sel_detectionType);
}

id CNDetection.normalizedRect.getter()
{
  return objc_msgSend(*v0, sel_normalizedRect);
}

id CNDetection.focusDisparity.getter()
{
  return objc_msgSend(*v0, sel_focusDisparity);
}

id CNDetection.detectionID.getter()
{
  return sub_243275878((SEL *)&selRef_detectionID, (SEL *)&selRef_isValidDetectionID_);
}

id CNDetection.detectionGroupID.getter()
{
  return sub_243275878((SEL *)&selRef_detectionGroupID, (SEL *)&selRef_isValidDetectionGroupID_);
}

id sub_243275878(SEL *a1, SEL *a2)
{
  id v4 = *v2;
  if (objc_msgSend(self, *a2, objc_msgSend(v4, *a1))) {
    return [v4 *a1];
  }
  else {
    return 0;
  }
}

uint64_t static CNDetection.accessibilityLabel(for:)(uint64_t a1)
{
  id v1 = objc_msgSend(self, sel_accessibilityLabelForDetectionType_, a1);
  uint64_t v2 = sub_2432799B8();

  return v2;
}

id static CNDetection.disparity(in:sourceDisparity:detectionType:priorDisparity:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
  if ((a3 & 0x100000000) != 0) {
    float v13 = NAN;
  }
  else {
    float v13 = *(float *)&a3;
  }
  long long v14 = self;
  *(float *)&double v15 = v13;

  return objc_msgSend(v14, sel_disparityInNormalizedRect_sourceDisparity_detectionType_priorDisparity_, a1, a2, a4, a5, a6, a7, v15);
}

ValueMetadata *type metadata accessor for CNDetection()
{
  return &type metadata for CNDetection;
}

uint64_t sub_243275A0C(uint64_t a1)
{
  *(void *)(v1 + 120) = a1;
  return MEMORY[0x270FA2498](sub_243275A2C, 0, 0);
}

uint64_t sub_243275A2C()
{
  uint64_t v1 = v0[15];
  uint64_t v2 = self;
  v0[2] = v0;
  v0[7] = v0 + 16;
  v0[3] = sub_243275B44;
  uint64_t v3 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_243275C3C;
  v0[13] = &block_descriptor_0;
  v0[14] = v3;
  objc_msgSend(v2, sel_checkIfCinematic_completionHandler_, v1, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_243275B44()
{
  return MEMORY[0x270FA2498](sub_243275C24, 0, 0);
}

uint64_t sub_243275C24()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(unsigned __int8 *)(v0 + 128));
}

uint64_t sub_243275C3C(uint64_t a1, char a2)
{
  **(unsigned char **)(*(void *)(*(void *)(a1 + 32) + 64) + 40) = a2;
  return MEMORY[0x270FA2400]();
}

uint64_t CNAssetInfo.__allocating_init(asset:)(uint64_t a1)
{
  uint64_t v3 = swift_allocObject();
  id v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *id v4 = v1;
  v4[1] = sub_243275D20;
  v4[16] = a1;
  v4[17] = v3;
  return MEMORY[0x270FA2498](sub_243275E40, 0, 0);
}

uint64_t sub_243275D20(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t CNAssetInfo.init(asset:)(uint64_t a1)
{
  *(void *)(v2 + 128) = a1;
  *(void *)(v2 + 136) = v1;
  return MEMORY[0x270FA2498](sub_243275E40, 0, 0);
}

uint64_t sub_243275E40()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = self;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_243275F58;
  uint64_t v3 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_243274B54;
  v0[13] = &block_descriptor_3;
  v0[14] = v3;
  objc_msgSend(v2, sel_loadFromAsset_completionHandler_, v1, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_243275F58()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 144) = v1;
  if (v1) {
    uint64_t v2 = sub_243276108;
  }
  else {
    uint64_t v2 = sub_243276068;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_243276068()
{
  uint64_t v2 = (void *)v0[16];
  uint64_t v1 = v0[17];
  uint64_t v3 = (void *)v0[15];
  *(void *)(v1 + 16) = v3;
  id v4 = v3;
  id v5 = objc_msgSend(v4, sel_asset);

  *(void *)(v1 + 24) = v5;
  uint64_t v6 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v7 = v0[17];
  return v6(v7);
}

uint64_t sub_243276108()
{
  uint64_t v1 = *(void **)(v0 + 128);
  swift_willThrow();

  type metadata accessor for CNAssetInfo();
  swift_deallocPartialClassInstance();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t type metadata accessor for CNAssetInfo()
{
  return self;
}

id CNAssetInfo.asset.getter()
{
  return *(id *)(v0 + 24);
}

uint64_t sub_2432761C0()
{
  return sub_2432763F0((SEL *)&selRef_allCinematicTracks);
}

id sub_2432761CC()
{
  id v1 = objc_msgSend(*(id *)(v0 + 16), sel_cinematicVideoTrack);

  return v1;
}

id sub_243276204()
{
  id v1 = objc_msgSend(*(id *)(v0 + 16), sel_cinematicDisparityTrack);

  return v1;
}

id sub_24327623C()
{
  id v1 = objc_msgSend(*(id *)(v0 + 16), sel_cinematicMetadataTrack);

  return v1;
}

double sub_243276274@<D0>(uint64_t a1@<X8>)
{
  objc_msgSend(*(id *)(v1 + 16), sel_timeRange);
  double result = v5;
  *(void *)a1 = v4;
  *(double *)(a1 + 8) = v5;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  return result;
}

id sub_2432762D8()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_naturalSize);
}

id sub_2432762E8()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_preferredSize);
}

double sub_2432762F8@<D0>(_OWORD *a1@<X8>)
{
  objc_msgSend(*(id *)(v1 + 16), sel_preferredTransform);
  double result = *(double *)&v4;
  *a1 = v4;
  a1[1] = v5;
  a1[2] = v6;
  return result;
}

uint64_t CNAssetInfo.deinit()
{
  return v0;
}

uint64_t CNAssetInfo.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 32, 7);
}

id CNAssetInfo.frameTimingTrack.getter()
{
  id v1 = objc_msgSend(*(id *)(v0 + 16), sel_frameTimingTrack);

  return v1;
}

uint64_t CNAssetInfo.videoCompositionTracks.getter()
{
  return sub_2432763F0((SEL *)&selRef_videoCompositionTracks);
}

uint64_t sub_2432763F0(SEL *a1)
{
  id v2 = [*(id *)(v1 + 16) *a1];
  sub_24327518C(0, &qword_268D90578);
  uint64_t v3 = sub_2432799D8();

  return v3;
}

char *CNAssetInfo.videoCompositionTrackIDs.getter()
{
  return sub_243276470((SEL *)&selRef_videoCompositionTrackIDs);
}

char *CNAssetInfo.sampleDataTrackIDs.getter()
{
  return sub_243276470((SEL *)&selRef_sampleDataTrackIDs);
}

char *sub_243276470(SEL *a1)
{
  id v2 = [*(id *)(v1 + 16) *a1];
  sub_24327518C(0, (unint64_t *)&unk_268D904E0);
  unint64_t v3 = sub_2432799D8();

  if (!(v3 >> 62))
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v4) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_243279A68();
  swift_bridgeObjectRelease();
  if (!v4) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t v13 = MEMORY[0x263F8EE78];
  double result = sub_243274444(0, v4 & ~(v4 >> 63), 0);
  if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v6 = 0;
    uint64_t v7 = v13;
    do
    {
      if ((v3 & 0xC000000000000001) != 0) {
        id v8 = (id)MEMORY[0x245677580](v6, v3);
      }
      else {
        id v8 = *(id *)(v3 + 8 * v6 + 32);
      }
      uint64_t v9 = v8;
      unsigned int v10 = objc_msgSend(v8, sel_intValue);

      unint64_t v12 = *(void *)(v13 + 16);
      unint64_t v11 = *(void *)(v13 + 24);
      if (v12 >= v11 >> 1) {
        sub_243274444((char *)(v11 > 1), v12 + 1, 1);
      }
      ++v6;
      *(void *)(v13 + 16) = v12 + 1;
      *(_DWORD *)(v13 + 4 * v12 + 32) = v10;
    }
    while (v4 != v6);
    swift_bridgeObjectRelease();
    return (char *)v7;
  }
  __break(1u);
  return result;
}

id sub_243276618(uint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  int v5 = a4;
  v24[1] = *(id *)MEMORY[0x263EF8340];
  unint64_t v8 = HIDWORD(a4);
  uint64_t v9 = *a1;
  uint64_t v10 = a1[2];
  uint64_t v11 = a1[3];
  uint64_t v12 = a1[5];
  self;
  uint64_t v13 = (void *)swift_dynamicCastObjCClassUnconditional();
  uint64_t v14 = *(void *)(a2 + 16);
  v23[5] = v12;
  v24[0] = 0;
  v23[1] = a1[1];
  v23[2] = v10;
  v23[3] = v11;
  v23[4] = a1[4];
  uint64_t v19 = a3;
  int v20 = v5;
  int v21 = v8;
  uint64_t v22 = a5;
  v23[0] = v9;
  if (objc_msgSend(v13, sel_insertTimeRange_ofCinematicAssetInfo_atTime_error_, v23, v14, &v19, v24)) {
    return v24[0];
  }
  id v16 = v24[0];
  sub_243279988();

  return (id)swift_willThrow();
}

uint64_t CNCompositionInfo.__allocating_init(asset:)()
{
  return MEMORY[0x270FA2498](sub_243276788, 0, 0);
}

void sub_243276788()
{
}

uint64_t CNCompositionInfo.init(asset:)()
{
  return MEMORY[0x270FA2498](sub_243276E80, 0, 0);
}

uint64_t CNCompositionInfo.deinit()
{
  return v0;
}

uint64_t CNCompositionInfo.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t AVMutableComposition.addTracks(for:preferredStartingTrackID:)(uint64_t a1, uint64_t a2)
{
  id v3 = objc_msgSend(v2, sel_addTracksForCinematicAssetInfo_preferredStartingTrackID_, *(void *)(a1 + 16), a2);
  type metadata accessor for CNCompositionInfo();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  *(void *)(v4 + 24) = objc_msgSend(v3, sel_asset);
  return v4;
}

uint64_t type metadata accessor for CNCompositionInfo()
{
  return self;
}

uint64_t method lookup function for CNAssetInfo(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CNAssetInfo);
}

uint64_t dispatch thunk of static CNAssetInfo.isCinematic(asset:)(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(v1 + 104) + **(int **)(v1 + 104));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_2432769F8;
  return v6(a1);
}

uint64_t sub_2432769F8(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  id v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t dispatch thunk of CNAssetInfo.__allocating_init(asset:)(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(v1 + 112) + **(int **)(v1 + 112));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_243276BE0;
  return v6(a1);
}

uint64_t sub_243276BE0(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  id v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t dispatch thunk of CNAssetInfo.allCinematicTracks.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of CNAssetInfo.cinematicVideoTrack.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of CNAssetInfo.cinematicDisparityTrack.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of CNAssetInfo.cinematicMetadataTrack.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of CNAssetInfo.timeRange.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of CNAssetInfo.naturalSize.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of CNAssetInfo.preferredSize.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of CNAssetInfo.preferredTransform.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t method lookup function for CNCompositionInfo(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CNCompositionInfo);
}

uint64_t dispatch thunk of CNCompositionInfo.insertTimeRange(_:of:at:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(uint64_t (**)(void *))(*(void *)v1 + 200);
  v5[0] = *(void *)a1;
  v5[1] = *(void *)(a1 + 8);
  long long v6 = *(_OWORD *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = v2;
  return v3(v5);
}

uint64_t static CNDecision.FocusDetectionID.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return (*(void *)a1 == *(void *)a2) & ~(*(unsigned __int8 *)(a1 + 8) ^ *(unsigned __int8 *)(a2 + 8));
}

uint64_t sub_243276EA8(uint64_t a1, uint64_t a2)
{
  return (*(void *)a1 == *(void *)a2) & ~(*(unsigned __int8 *)(a1 + 8) ^ *(unsigned __int8 *)(a2 + 8));
}

Cinematic::CNDecision __swiftcall CNDecision.init(time:detectionID:strong:)(CMTime time, CNDetectionID detectionID, Swift::Bool strong)
{
  uint64_t v4 = (objc_class *)sub_243276EE4(time.value, *(unint64_t *)&time.timescale, time.epoch, detectionID, strong, (const char **)&selRef_initWithTime_detectionID_strong_, v3);
  result.internalDecision._internalDecision = v5;
  result.internalDecision.super.isa = v4;
  return result;
}

Cinematic::CNDecision __swiftcall CNDecision.init(time:detectionGroupID:strong:)(CMTime time, CNDetectionGroupID detectionGroupID, Swift::Bool strong)
{
  uint64_t v4 = (objc_class *)sub_243276EE4(time.value, *(unint64_t *)&time.timescale, time.epoch, detectionGroupID, strong, (const char **)&selRef_initWithTime_detectionGroupID_strong_, v3);
  result.internalDecision._internalDecision = v5;
  result.internalDecision.super.isa = v4;
  return result;
}

id sub_243276EE4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, const char **a6@<X5>, void *a7@<X8>)
{
  int v11 = a2;
  unint64_t v14 = HIDWORD(a2);
  id v15 = objc_allocWithZone((Class)CNDecision);
  id v16 = *a6;
  uint64_t v18 = a1;
  int v19 = v11;
  int v20 = v14;
  uint64_t v21 = a3;
  id result = objc_msgSend(v15, v16, &v18, a4, a5 & 1);
  *a7 = result;
  return result;
}

uint64_t CNDecision.time.getter()
{
  objc_msgSend(*v0, sel_time);
  return v2;
}

id CNDecision.focusDetectionID.getter@<X0>(uint64_t a1@<X8>)
{
  id v3 = *v1;
  unsigned int v4 = objc_msgSend(v3, sel_isGroupDecision);
  char v5 = v4;
  long long v6 = &selRef_detectionGroupID;
  if (!v4) {
    long long v6 = &selRef_detectionID;
  }
  id result = [v3 *v6];
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v5;
  return result;
}

id CNDecision.isUserDecision.getter()
{
  return objc_msgSend(*v0, sel_isUserDecision);
}

id CNDecision.isStrongDecision.getter()
{
  return objc_msgSend(*v0, sel_isStrongDecision);
}

uint64_t static CNDecision.== infix(_:_:)()
{
  return sub_2432799E8() & 1;
}

uint64_t sub_2432770A0()
{
  return sub_2432799E8() & 1;
}

unint64_t sub_2432770E4()
{
  unint64_t result = qword_268D905A0;
  if (!qword_268D905A0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268D905A0);
  }
  return result;
}

ValueMetadata *type metadata accessor for CNDecision()
{
  return &type metadata for CNDecision;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for CNDecision.FocusDetectionID(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CNDecision.FocusDetectionID(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_2432771D4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_2432771DC(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CNDecision.FocusDetectionID()
{
  return &type metadata for CNDecision.FocusDetectionID;
}

double CNBoundsPrediction.normalizedBounds.getter()
{
  return *(double *)v0;
}

void CNBoundsPrediction.normalizedBounds.setter(double a1, double a2, double a3, double a4)
{
  *int v4 = a1;
  v4[1] = a2;
  v4[2] = a3;
  v4[3] = a4;
}

uint64_t (*CNBoundsPrediction.normalizedBounds.modify())()
{
  return nullsub_1;
}

float CNBoundsPrediction.confidence.getter()
{
  return *(float *)(v0 + 32);
}

void CNBoundsPrediction.confidence.setter(float a1)
{
  *(float *)(v1 + 32) = a1;
}

uint64_t (*CNBoundsPrediction.confidence.modify())()
{
  return nullsub_1;
}

id static CNObjectTracker.isSupported.getter()
{
  return objc_msgSend(self, sel_isSupported);
}

uint64_t CNObjectTracker.__allocating_init(commandQueue:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  id v3 = objc_msgSend(objc_allocWithZone((Class)CNObjectTracker), sel_initWithCommandQueue_, a1);
  swift_unknownObjectRelease();
  *(void *)(v2 + 16) = v3;
  return v2;
}

uint64_t CNObjectTracker.init(commandQueue:)(uint64_t a1)
{
  id v2 = objc_msgSend(objc_allocWithZone((Class)CNObjectTracker), sel_initWithCommandQueue_, a1);
  swift_unknownObjectRelease();
  *(void *)(v1 + 16) = v2;
  return v1;
}

void sub_243277350(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  id v4 = objc_msgSend(*(id *)(v2 + 16), sel_findObjectAtPoint_sourceImage_, a1);
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
    objc_msgSend(v6, sel_normalizedBounds);
    uint64_t v8 = v7;
    uint64_t v10 = v9;
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    objc_msgSend(v6, sel_confidence);
    int v16 = v15;
  }
  else
  {
    int v16 = 0;
    uint64_t v8 = 0;
    uint64_t v10 = 0;
    uint64_t v12 = 0;
    uint64_t v14 = 0;
  }
  *(void *)a2 = v8;
  *(void *)(a2 + 8) = v10;
  *(void *)(a2 + 16) = v12;
  *(void *)(a2 + 24) = v14;
  *(_DWORD *)(a2 + 32) = v16;
  *(unsigned char *)(a2 + 36) = v5 == 0;
}

id sub_243277424(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = *(void **)(v3 + 16);
  v6[0] = a1;
  v6[1] = a2;
  v6[2] = a3;
  return objc_msgSend(v4, sel_startTrackingAt_within_sourceImage_sourceDisparity_, v6);
}

void sub_24327746C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  id v6 = *(void **)(v4 + 16);
  v20[0] = a1;
  v20[1] = a2;
  v20[2] = a3;
  id v7 = objc_msgSend(v6, sel_continueTrackingAt_sourceImage_sourceDisparity_, v20);
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
    objc_msgSend(v9, sel_normalizedBounds);
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    uint64_t v15 = v14;
    uint64_t v17 = v16;
    objc_msgSend(v9, sel_confidence);
    int v19 = v18;
  }
  else
  {
    int v19 = 0;
    uint64_t v11 = 0;
    uint64_t v13 = 0;
    uint64_t v15 = 0;
    uint64_t v17 = 0;
  }
  *(void *)a4 = v11;
  *(void *)(a4 + 8) = v13;
  *(void *)(a4 + 16) = v15;
  *(void *)(a4 + 24) = v17;
  *(_DWORD *)(a4 + 32) = v19;
  *(unsigned char *)(a4 + 36) = v8 == 0;
}

uint64_t sub_24327755C()
{
  id v1 = objc_msgSend(*(id *)(v0 + 16), sel_finishDetectionTrack);
  self;
  uint64_t v2 = swift_dynamicCastObjCClass();
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    type metadata accessor for CNFixedDetectionTrack();
  }
  else
  {
    self;
    uint64_t v4 = swift_dynamicCastObjCClass();
    if (!v4)
    {
      type metadata accessor for CNDetectionTrack();
      goto LABEL_6;
    }
    uint64_t v3 = (void *)v4;
    type metadata accessor for CNCustomDetectionTrack();
  }
  id v1 = v3;
LABEL_6:
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v1;
  return result;
}

id sub_243277604()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_resetDetectionTrack);
}

uint64_t CNObjectTracker.deinit()
{
  return v0;
}

uint64_t CNObjectTracker.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

__n128 __swift_memcpy36_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for CNBoundsPrediction(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 36)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CNBoundsPrediction(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(_DWORD *)(result + 32) = 0;
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
  *(unsigned char *)(result + 36) = v3;
  return result;
}

ValueMetadata *type metadata accessor for CNBoundsPrediction()
{
  return &type metadata for CNBoundsPrediction;
}

uint64_t type metadata accessor for CNObjectTracker()
{
  return self;
}

uint64_t method lookup function for CNObjectTracker(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CNObjectTracker);
}

uint64_t dispatch thunk of CNObjectTracker.__allocating_init(commandQueue:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of CNObjectTracker.findObject(at:sourceImage:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of CNObjectTracker.startTracking(at:within:sourceImage:sourceDisparity:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of CNObjectTracker.continueTracking(at:sourceImage:sourceDisparity:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of CNObjectTracker.finishDetectionTrack()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of CNObjectTracker.resetDetectionTrack()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t CNScript.Frame.time.getter()
{
  objc_msgSend(*v0, sel_time);
  return v2;
}

id CNScript.Frame.focusDisparity.getter()
{
  return objc_msgSend(*v0, sel_focusDisparity);
}

id CNScript.Frame.focusDetection.getter@<X0>(void *a1@<X8>)
{
  id result = objc_msgSend(*v1, sel_focusDetection);
  *a1 = result;
  return result;
}

char *CNScript.Frame.allDetections.getter()
{
  id v1 = objc_msgSend(*v0, sel_allDetections);
  sub_24327518C(0, (unint64_t *)&qword_268D903B0);
  unint64_t v2 = sub_2432799D8();

  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v3) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_243279A68();
  swift_bridgeObjectRelease();
  if (!v3) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t v11 = MEMORY[0x263F8EE78];
  id result = sub_243273DD0(0, v3 & ~(v3 >> 63), 0);
  if ((v3 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = 0;
    uint64_t v6 = v11;
    do
    {
      if ((v2 & 0xC000000000000001) != 0) {
        id v7 = (id)MEMORY[0x245677580](v5, v2);
      }
      else {
        id v7 = *(id *)(v2 + 8 * v5 + 32);
      }
      id v8 = v7;
      unint64_t v10 = *(void *)(v11 + 16);
      unint64_t v9 = *(void *)(v11 + 24);
      if (v10 >= v9 >> 1) {
        sub_243273DD0((char *)(v9 > 1), v10 + 1, 1);
      }
      ++v5;
      *(void *)(v11 + 16) = v10 + 1;
      *(void *)(v11 + 8 * v10 + 32) = v8;
    }
    while (v3 != v5);
    swift_bridgeObjectRelease();
    return (char *)v6;
  }
  __break(1u);
  return result;
}

Cinematic::CNDetection_optional __swiftcall CNScript.Frame.detection(for:)(CNDetectionID a1)
{
  uint64_t v3 = v1;
  uint64_t v4 = (objc_class *)objc_msgSend(*v2, sel_detectionForID_, a1);
  void *v3 = v4;
  result.value.internalDetection._creationHash = v6;
  result.value.internalDetection._internalDetection = v5;
  result.value.internalDetection.super.isa = v4;
  result.is_nil = v7;
  return result;
}

Cinematic::CNDetection_optional __swiftcall CNScript.Frame.bestDetection(for:)(CNDetectionGroupID a1)
{
  uint64_t v3 = v1;
  uint64_t v4 = (objc_class *)objc_msgSend(*v2, sel_bestDetectionForGroupID_, a1);
  void *v3 = v4;
  result.value.internalDetection._creationHash = v6;
  result.value.internalDetection._internalDetection = v5;
  result.value.internalDetection.super.isa = v4;
  result.is_nil = v7;
  return result;
}

uint64_t CNScript.__allocating_init(asset:changes:progress:)(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  Swift::Bool v7 = (void *)swift_allocObject();
  id v8 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v8;
  *id v8 = v3;
  v8[1] = sub_243275D20;
  v8[17] = a3;
  v8[18] = v7;
  v8[16] = a1;
  uint64_t v9 = *a2;
  v8[19] = *v7;
  v8[20] = v9;
  return MEMORY[0x270FA2498](sub_243277BC4, 0, 0);
}

uint64_t CNScript.init(asset:changes:progress:)(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  v4[17] = a3;
  v4[18] = v3;
  v4[16] = a1;
  uint64_t v5 = *a2;
  v4[19] = *v3;
  v4[20] = v5;
  return MEMORY[0x270FA2498](sub_243277BC4, 0, 0);
}

uint64_t sub_243277BC4()
{
  uint64_t v1 = v0[20];
  uint64_t v3 = v0[16];
  uint64_t v2 = v0[17];
  uint64_t v4 = self;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_243277CF0;
  uint64_t v5 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_243274B54;
  v0[13] = &block_descriptor_1;
  v0[14] = v5;
  objc_msgSend(v4, sel_loadFromAsset_changes_progress_completionHandler_, v3, v1, v2, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_243277CF0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 168) = v1;
  if (v1) {
    uint64_t v2 = sub_243277E88;
  }
  else {
    uint64_t v2 = sub_243277E00;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_243277E00()
{
  uint64_t v1 = *(void **)(v0 + 160);
  uint64_t v3 = *(void **)(v0 + 136);
  uint64_t v2 = *(void *)(v0 + 144);

  *(void *)(v2 + 16) = *(void *)(v0 + 120);
  uint64_t v4 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v5 = *(void *)(v0 + 144);
  return v4(v5);
}

uint64_t sub_243277E88()
{
  uint64_t v1 = (void *)v0[20];
  uint64_t v3 = (void *)v0[16];
  uint64_t v2 = (void *)v0[17];
  swift_willThrow();

  swift_deallocPartialClassInstance();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

Swift::Void __swiftcall CNScript.reload(changes:)(Cinematic::CNScript::Changes_optional changes)
{
  objc_msgSend(*(id *)(v1 + 16), sel_reloadWithChanges_, *(void *)changes.value.internalChanges.super.isa);
}

Cinematic::CNScript::Changes __swiftcall CNScript.changes()()
{
  uint64_t v2 = v0;
  uint64_t v3 = (objc_class *)objc_msgSend(*(id *)(v1 + 16), sel_changes);
  *uint64_t v2 = v3;
  result.internalChanges._internalChanges = v4;
  result.internalChanges.super.isa = v3;
  return result;
}

Cinematic::CNScript::Changes __swiftcall CNScript.changes(trimmedBy:)(CMTimeRange *trimmedBy)
{
  uint64_t v3 = v1;
  CMTimeEpoch epoch = trimmedBy->duration.epoch;
  uint64_t v5 = *(void **)(v2 + 16);
  v9[0] = trimmedBy->start.value;
  v9[1] = *(void *)&trimmedBy->start.timescale;
  long long v10 = *(_OWORD *)&trimmedBy->start.epoch;
  uint64_t v11 = *(void *)&trimmedBy->duration.timescale;
  CMTimeEpoch v12 = epoch;
  uint64_t v6 = (objc_class *)objc_msgSend(v5, sel_changesTrimmedByTimeRange_, v9);
  objc_class *v3 = v6;
  result.internalChanges._internalChanges = v7;
  result.internalChanges.super.isa = v6;
  return result;
}

double CNScript.timeRange.getter@<D0>(uint64_t a1@<X8>)
{
  objc_msgSend(*(id *)(v1 + 16), sel_timeRange);
  double result = v5;
  *(void *)a1 = v4;
  *(double *)(a1 + 8) = v5;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  return result;
}

Cinematic::CNScript::Frame_optional __swiftcall CNScript.frame(at:tolerance:)(CMTime at, CMTime tolerance)
{
  uint64_t v3 = (objc_class *)sub_243278098(at.value, *(uint64_t *)&at.timescale, at.epoch, tolerance.value, *(uint64_t *)&tolerance.timescale, tolerance.epoch, (const char **)&selRef_frameAtTime_tolerance_, v2);
  result.value.internalFrame._internalFrame = v4;
  result.value.internalFrame.super.isa = v3;
  result.is_nil = v5;
  return result;
}

uint64_t CNScript.frames(in:)(uint64_t a1)
{
  return sub_243278130(a1, (const char **)&selRef_framesInTimeRange_, &qword_268D905B8, (uint64_t)&off_26517A170, (uint64_t (*)(BOOL, uint64_t, uint64_t))sub_24327446C);
}

Cinematic::CNDecision_optional __swiftcall CNScript.decision(at:tolerance:)(CMTime at, CMTime tolerance)
{
  uint64_t v3 = (objc_class *)sub_243278098(at.value, *(uint64_t *)&at.timescale, at.epoch, tolerance.value, *(uint64_t *)&tolerance.timescale, tolerance.epoch, (const char **)&selRef_decisionAtTime_tolerance_, v2);
  result.value.internalDecision._internalDecision = v4;
  result.value.internalDecision.super.isa = v3;
  result.is_nil = v5;
  return result;
}

id sub_243278098@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, const char **a7@<X6>, void *a8@<X8>)
{
  long long v10 = *(void **)(v8 + 16);
  uint64_t v11 = *a7;
  v13[2] = a6;
  v14[0] = a1;
  v14[1] = a2;
  void v14[2] = a3;
  v13[0] = a4;
  v13[1] = a5;
  id result = objc_msgSend(v10, v11, v14, v13);
  *a8 = result;
  return result;
}

uint64_t CNScript.decisions(in:)(uint64_t a1)
{
  return sub_243278130(a1, (const char **)&selRef_decisionsInTimeRange_, &qword_268D905C0, (uint64_t)off_26517A120, (uint64_t (*)(BOOL, uint64_t, uint64_t))sub_24327449C);
}

uint64_t sub_243278130(uint64_t a1, const char **a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(BOOL, uint64_t, uint64_t))
{
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void **)(v5 + 16);
  long long v10 = *a2;
  v21[0] = *(void *)a1;
  v21[1] = *(void *)(a1 + 8);
  long long v22 = *(_OWORD *)(a1 + 16);
  uint64_t v23 = *(void *)(a1 + 32);
  uint64_t v24 = v8;
  id v11 = objc_msgSend(v9, v10, v21);
  sub_24327518C(0, a3);
  unint64_t v12 = sub_2432799D8();

  if (!(v12 >> 62))
  {
    uint64_t v13 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v13) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_243279A68();
  swift_bridgeObjectRelease();
  if (!v13) {
    goto LABEL_13;
  }
LABEL_3:
  v21[0] = MEMORY[0x263F8EE78];
  uint64_t result = a5(0, v13 & ~(v13 >> 63), 0);
  if ((v13 & 0x8000000000000000) == 0)
  {
    uint64_t v15 = 0;
    uint64_t v16 = v21[0];
    do
    {
      if ((v12 & 0xC000000000000001) != 0) {
        id v17 = (id)MEMORY[0x245677580](v15, v12);
      }
      else {
        id v17 = *(id *)(v12 + 8 * v15 + 32);
      }
      id v18 = v17;
      v21[0] = v16;
      unint64_t v20 = *(void *)(v16 + 16);
      unint64_t v19 = *(void *)(v16 + 24);
      if (v20 >= v19 >> 1)
      {
        a5(v19 > 1, v20 + 1, 1);
        uint64_t v16 = v21[0];
      }
      ++v15;
      *(void *)(v16 + 16) = v20 + 1;
      *(void *)(v16 + 8 * v20 + 32) = v18;
    }
    while (v13 != v15);
    swift_bridgeObjectRelease();
    return v16;
  }
  __break(1u);
  return result;
}

Cinematic::CNDecision_optional __swiftcall CNScript.decision(after:)(CMTime after)
{
  uint64_t v2 = (objc_class *)sub_2432732D0(after.value, *(uint64_t *)&after.timescale, after.epoch, (const char **)&selRef_decisionAfterTime_, v1);
  result.value.internalDecision._internalDecision = v3;
  result.value.internalDecision.super.isa = v2;
  result.is_nil = v4;
  return result;
}

Cinematic::CNDecision_optional __swiftcall CNScript.decision(before:)(CMTime before)
{
  uint64_t v2 = (objc_class *)sub_2432732D0(before.value, *(uint64_t *)&before.timescale, before.epoch, (const char **)&selRef_decisionBeforeTime_, v1);
  result.value.internalDecision._internalDecision = v3;
  result.value.internalDecision.super.isa = v2;
  result.is_nil = v4;
  return result;
}

Cinematic::CNDecision_optional __swiftcall CNScript.primaryDecision(at:)(CMTime at)
{
  uint64_t v2 = (objc_class *)sub_2432732D0(at.value, *(uint64_t *)&at.timescale, at.epoch, (const char **)&selRef_primaryDecisionAtTime_, v1);
  result.value.internalDecision._internalDecision = v3;
  result.value.internalDecision.super.isa = v2;
  result.is_nil = v4;
  return result;
}

Cinematic::CNDecision_optional __swiftcall CNScript.secondaryDecision(at:)(CMTime at)
{
  uint64_t v2 = (objc_class *)sub_2432732D0(at.value, *(uint64_t *)&at.timescale, at.epoch, (const char **)&selRef_secondaryDecisionAtTime_, v1);
  result.value.internalDecision._internalDecision = v3;
  result.value.internalDecision.super.isa = v2;
  result.is_nil = v4;
  return result;
}

void __swiftcall CNScript.timeRangeOfTransition(after:)(CMTimeRange *__return_ptr retstr, Cinematic::CNDecision after)
{
}

void __swiftcall CNScript.timeRangeOfTransition(before:)(CMTimeRange *__return_ptr retstr, Cinematic::CNDecision before)
{
}

double sub_243278340@<D0>(void *a1@<X0>, SEL *a2@<X1>, uint64_t a3@<X8>)
{
  objc_msgSend(*(id *)(v3 + 16), *a2, *a1);
  double result = v7;
  *(void *)a3 = v6;
  *(double *)(a3 + 8) = v7;
  *(_OWORD *)(a3 + 16) = v8;
  *(void *)(a3 + 32) = v9;
  *(void *)(a3 + 40) = v10;
  return result;
}

uint64_t CNScript.userDecisions(in:)(uint64_t a1)
{
  return sub_243278130(a1, (const char **)&selRef_userDecisionsInTimeRange_, &qword_268D905C0, (uint64_t)off_26517A120, (uint64_t (*)(BOOL, uint64_t, uint64_t))sub_24327449C);
}

uint64_t CNScript.baseDecisions(in:)(uint64_t a1)
{
  return sub_243278130(a1, (const char **)&selRef_baseDecisionsInTimeRange_, &qword_268D905C0, (uint64_t)off_26517A120, (uint64_t (*)(BOOL, uint64_t, uint64_t))sub_24327449C);
}

void *CNScript.detectionTrack(for:)(uint64_t a1)
{
  double result = objc_msgSend(*(id *)(v1 + 16), sel_detectionTrackForID_, a1);
  if (result)
  {
    uint64_t v3 = result;
    self;
    uint64_t v4 = swift_dynamicCastObjCClass();
    if (v4)
    {
      uint64_t v5 = v4;
      type metadata accessor for CNFixedDetectionTrack();
    }
    else
    {
      self;
      uint64_t v6 = swift_dynamicCastObjCClass();
      if (!v6)
      {
        type metadata accessor for CNDetectionTrack();
        goto LABEL_7;
      }
      uint64_t v5 = v6;
      type metadata accessor for CNCustomDetectionTrack();
    }
    uint64_t v3 = (void *)v5;
LABEL_7:
    double result = (void *)swift_allocObject();
    result[2] = v3;
  }
  return result;
}

void *CNScript.detectionTrack(for:)(void *a1)
{
  double result = objc_msgSend(*(id *)(v1 + 16), sel_detectionTrackForDecision_, *a1);
  if (result)
  {
    uint64_t v3 = result;
    self;
    uint64_t v4 = swift_dynamicCastObjCClass();
    if (v4)
    {
      uint64_t v5 = v4;
      type metadata accessor for CNFixedDetectionTrack();
    }
    else
    {
      self;
      uint64_t v6 = swift_dynamicCastObjCClass();
      if (!v6)
      {
        type metadata accessor for CNDetectionTrack();
        goto LABEL_7;
      }
      uint64_t v5 = v6;
      type metadata accessor for CNCustomDetectionTrack();
    }
    uint64_t v3 = (void *)v5;
LABEL_7:
    double result = (void *)swift_allocObject();
    result[2] = v3;
  }
  return result;
}

id CNScript.fNumber.getter()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_fNumber);
}

id CNScript.fNumber.setter()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_setFNumber_);
}

id (*CNScript.fNumber.modify(uint64_t a1))(uint64_t a1, double a2)
{
  uint64_t v3 = *(void **)(v1 + 16);
  *(void *)a1 = v3;
  objc_msgSend(v3, sel_fNumber);
  *(_DWORD *)(a1 + 8) = v4;
  return sub_2432785D8;
}

id sub_2432785D8(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 8);
  return objc_msgSend(*(id *)a1, sel_setFNumber_, a2);
}

Swift::Bool __swiftcall CNScript.addUserDecision(_:)(Cinematic::CNDecision a1)
{
  return objc_msgSend(*(id *)(v1 + 16), sel_addUserDecision_, *(void *)a1.internalDecision.super.isa);
}

Swift::Bool __swiftcall CNScript.removeUserDecision(_:)(Cinematic::CNDecision a1)
{
  return objc_msgSend(*(id *)(v1 + 16), sel_removeUserDecision_, *(void *)a1.internalDecision.super.isa);
}

Swift::Void __swiftcall CNScript.removeAllUserDecisions()()
{
  objc_msgSend(*(id *)(v0 + 16), sel_removeAllUserDecisions);
}

id CNScript.addDetectionTrack(_:)(uint64_t a1)
{
  return objc_msgSend(*(id *)(v1 + 16), sel_addDetectionTrack_, *(void *)(a1 + 16));
}

id CNScript.removeDetectionTrack(_:)(uint64_t a1)
{
  return objc_msgSend(*(id *)(v1 + 16), sel_removeDetectionTrack_, *(void *)(a1 + 16));
}

uint64_t CNScript.addedDetectionTracks.getter()
{
  id v1 = objc_msgSend(*(id *)(v0 + 16), sel_addedDetectionTracks);
  sub_24327518C(0, &qword_268D905C8);
  unint64_t v2 = sub_2432799D8();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_243279A68();
    swift_bridgeObjectRelease();
    if (v3) {
      goto LABEL_3;
    }
LABEL_17:
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v3) {
    goto LABEL_17;
  }
LABEL_3:
  uint64_t v12 = MEMORY[0x263F8EE78];
  uint64_t result = sub_243279A38();
  if ((v3 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = 0;
    while (1)
    {
      if ((v2 & 0xC000000000000001) != 0) {
        id v8 = (id)MEMORY[0x245677580](v5, v2);
      }
      else {
        id v8 = *(id *)(v2 + 8 * v5 + 32);
      }
      uint64_t v7 = (uint64_t)v8;
      self;
      uint64_t v9 = swift_dynamicCastObjCClass();
      if (v9)
      {
        uint64_t v6 = v9;
        type metadata accessor for CNFixedDetectionTrack();
      }
      else
      {
        self;
        uint64_t v10 = swift_dynamicCastObjCClass();
        if (!v10)
        {
          type metadata accessor for CNDetectionTrack();
          goto LABEL_7;
        }
        uint64_t v6 = v10;
        type metadata accessor for CNCustomDetectionTrack();
      }
      uint64_t v7 = v6;
LABEL_7:
      *(void *)(swift_allocObject() + 16) = v7;
      ++v5;
      sub_243279A18();
      sub_243279A48();
      sub_243279A58();
      sub_243279A28();
      if (v3 == v5)
      {
        uint64_t v11 = v12;
        swift_bridgeObjectRelease();
        return v11;
      }
    }
  }
  __break(1u);
  return result;
}

void CNScript.Changes.init(dataRepresentation:)(uint64_t a1@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
  id v6 = objc_allocWithZone((Class)CNScriptChanges);
  uint64_t v7 = (void *)sub_243279998();
  id v8 = objc_msgSend(v6, sel_initWithDataRepresentation_, v7);
  sub_243278D4C(a1, a2);

  *a3 = v8;
}

uint64_t CNScript.Changes.dataRepresentation.getter()
{
  id v1 = objc_msgSend(*v0, sel_dataRepresentation);
  uint64_t v2 = sub_2432799A8();

  return v2;
}

id CNScript.Changes.fNumber.getter()
{
  return objc_msgSend(*v0, sel_fNumber);
}

char *CNScript.Changes.userDecisions.getter()
{
  id v1 = objc_msgSend(*v0, sel_userDecisions);
  sub_24327518C(0, &qword_268D905C0);
  unint64_t v2 = sub_2432799D8();

  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v3) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_243279A68();
  swift_bridgeObjectRelease();
  if (!v3) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t v11 = MEMORY[0x263F8EE78];
  uint64_t result = sub_24327449C(0, v3 & ~(v3 >> 63), 0);
  if ((v3 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = 0;
    uint64_t v6 = v11;
    do
    {
      if ((v2 & 0xC000000000000001) != 0) {
        id v7 = (id)MEMORY[0x245677580](v5, v2);
      }
      else {
        id v7 = *(id *)(v2 + 8 * v5 + 32);
      }
      id v8 = v7;
      unint64_t v10 = *(void *)(v11 + 16);
      unint64_t v9 = *(void *)(v11 + 24);
      if (v10 >= v9 >> 1) {
        sub_24327449C((char *)(v9 > 1), v10 + 1, 1);
      }
      ++v5;
      *(void *)(v11 + 16) = v10 + 1;
      *(void *)(v11 + 8 * v10 + 32) = v8;
    }
    while (v3 != v5);
    swift_bridgeObjectRelease();
    return (char *)v6;
  }
  __break(1u);
  return result;
}

uint64_t CNScript.Changes.addedDetectionTracks.getter()
{
  id v1 = objc_msgSend(*v0, sel_addedDetectionTracks);
  sub_24327518C(0, &qword_268D905C8);
  unint64_t v2 = sub_2432799D8();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_243279A68();
    swift_bridgeObjectRelease();
    if (v3) {
      goto LABEL_3;
    }
LABEL_17:
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v3) {
    goto LABEL_17;
  }
LABEL_3:
  uint64_t v12 = MEMORY[0x263F8EE78];
  uint64_t result = sub_243279A38();
  if ((v3 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = 0;
    while (1)
    {
      if ((v2 & 0xC000000000000001) != 0) {
        id v8 = (id)MEMORY[0x245677580](v5, v2);
      }
      else {
        id v8 = *(id *)(v2 + 8 * v5 + 32);
      }
      uint64_t v7 = (uint64_t)v8;
      self;
      uint64_t v9 = swift_dynamicCastObjCClass();
      if (v9)
      {
        uint64_t v6 = v9;
        type metadata accessor for CNFixedDetectionTrack();
      }
      else
      {
        self;
        uint64_t v10 = swift_dynamicCastObjCClass();
        if (!v10)
        {
          type metadata accessor for CNDetectionTrack();
          goto LABEL_7;
        }
        uint64_t v6 = v10;
        type metadata accessor for CNCustomDetectionTrack();
      }
      uint64_t v7 = v6;
LABEL_7:
      *(void *)(swift_allocObject() + 16) = v7;
      ++v5;
      sub_243279A18();
      sub_243279A48();
      sub_243279A58();
      sub_243279A28();
      if (v3 == v5)
      {
        uint64_t v11 = v12;
        swift_bridgeObjectRelease();
        return v11;
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t CNScript.deinit()
{
  return v0;
}

uint64_t CNScript.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_243278D4C(uint64_t a1, unint64_t a2)
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

id sub_243278DA4@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  id result = objc_msgSend(*(id *)(*(void *)a1 + 16), sel_fNumber);
  *a2 = v4;
  return result;
}

id sub_243278DDC(_DWORD *a1, uint64_t a2, double a3)
{
  LODWORD(a3) = *a1;
  return objc_msgSend(*(id *)(*(void *)a2 + 16), sel_setFNumber_, a3);
}

uint64_t type metadata accessor for CNScript()
{
  return self;
}

uint64_t method lookup function for CNScript(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CNScript);
}

uint64_t dispatch thunk of CNScript.__allocating_init(asset:changes:progress:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 + 96) + **(int **)(v3 + 96));
  id v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  *id v8 = v4;
  v8[1] = sub_243276BE0;
  return v10(a1, a2, a3);
}

ValueMetadata *type metadata accessor for CNScript.Frame()
{
  return &type metadata for CNScript.Frame;
}

ValueMetadata *type metadata accessor for CNScript.Changes()
{
  return &type metadata for CNScript.Changes;
}

uint64_t sub_243279988()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_243279998()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_2432799A8()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_2432799B8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2432799C8()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2432799D8()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2432799E8()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_2432799F8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_243279A08()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_243279A18()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_243279A28()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_243279A38()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_243279A48()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_243279A58()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_243279A68()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_243279A78()
{
  return MEMORY[0x270F9F1A8]();
}

uint64_t sub_243279A98()
{
  return MEMORY[0x270EF26F0]();
}

uint64_t sub_243279AA8()
{
  return MEMORY[0x270EF26F8]();
}

uint64_t sub_243279AB8()
{
  return MEMORY[0x270EF2700]();
}

uint64_t sub_243279AE8()
{
  return MEMORY[0x270F9FC80]();
}

void CFRelease(CFTypeRef cf)
{
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CFArrayRef CMMetadataFormatDescriptionGetIdentifiers(CMMetadataFormatDescriptionRef desc)
{
  return (CFArrayRef)MEMORY[0x270EE7B70](desc);
}

CMTime *__cdecl CMTimeAbsoluteValue(CMTime *__return_ptr retstr, CMTime *time)
{
  return (CMTime *)MEMORY[0x270EE7D90](retstr, time);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x270EE7DD0](time1, time2);
}

CMTimeRange *__cdecl CMTimeRangeGetIntersection(CMTimeRange *__return_ptr retstr, CMTimeRange *range, CMTimeRange *otherRange)
{
  return (CMTimeRange *)MEMORY[0x270EE7ED8](retstr, range, otherRange);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x270EE7F08](retstr, lhs, rhs);
}

CVReturn CVMetalTextureCacheCreate(CFAllocatorRef allocator, CFDictionaryRef cacheAttributes, id metalDevice, CFDictionaryRef textureAttributes, CVMetalTextureCacheRef *cacheOut)
{
  return MEMORY[0x270EEA0E0](allocator, cacheAttributes, metalDevice, textureAttributes, cacheOut);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E8](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA240](pixelBuffer);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t PTDisparityInNormalizedRectFromPixelBufferWithPrior()
{
  return MEMORY[0x270F550A8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
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

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x270FA0290]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}