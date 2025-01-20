void sub_23EB3788C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void NotificationCallback(uint64_t a1, uint64_t a2)
{
  id v3 = (id)_currentDevice;
  v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 syncSettings];
    int v6 = v5;
    if (a2 == 1)
    {
      v10 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_23EB2E000, v10, OS_LOG_TYPE_DEFAULT, "User wants to disallow phonebook transfer", v13, 2u);
      }

      LOBYTE(v8) = 0;
    }
    else if (a2)
    {
      unint64_t v8 = v5 >> 8;
      v11 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_23EB2E000, v11, OS_LOG_TYPE_DEFAULT, "User did not act on phonebook transfer privacy alert", v12, 2u);
      }
    }
    else
    {
      v7 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23EB2E000, v7, OS_LOG_TYPE_DEFAULT, "User wants to allow phonebook transfer", buf, 2u);
      }

      dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_690);
      LOBYTE(v8) = 1;
    }
    [v4 setSyncSettings:v6 & 0xFFFF00FF | ((unint64_t)v8 << 8) | 0x100000000];
    v9 = _currentDevice;
    _currentDevice = 0;
  }
  else
  {
    v9 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      NotificationCallback_cold_1(v9);
    }
  }
}

void __NotificationCallback_block_invoke()
{
  [(id)_currentControllerInstance forcePushDetailViewForDevice:_currentBTSDevice];
  v0 = (void *)_currentControllerInstance;
  _currentControllerInstance = 0;

  v1 = (void *)_currentBTSDevice;
  _currentBTSDevice = 0;
}

void sub_23EB44830(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_23EB44CB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23EB44FC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_6(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_8(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

void sub_23EB47478(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_23EB48734(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 96));
  _Unwind_Resume(a1);
}

id sharedBluetoothSettingsLogComponent()
{
  if (sharedBluetoothSettingsLogComponent_onceToken[0] != -1) {
    dispatch_once(sharedBluetoothSettingsLogComponent_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)sharedBluetoothSettingsLogComponent_sharedBTSLog;

  return v0;
}

uint64_t __sharedBluetoothSettingsLogComponent_block_invoke()
{
  sharedBluetoothSettingsLogComponent_sharedBTSLog = (uint64_t)os_log_create("com.apple.bluetooth", "BluetoothSettings");

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23EB4A8C0()
{
  return sub_23EB4D810();
}

id sub_23EB4A8DC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C10000);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  v7 = &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = v2;
  uint64_t v11 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C10008);
  sub_23EB4C6E8(&qword_268C10010, &qword_268C10008);
  sub_23EB4D7A0();
  sub_23EB4D7B0();
  v12[3] = v4;
  v12[4] = sub_23EB4C6E8(&qword_268C10018, &qword_268C10000);
  __swift_allocate_boxed_opaque_existential_1(v12);
  sub_23EB4D790();
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  MEMORY[0x23ED0C260](v12);
  return objc_msgSend(v2, sel_setSelectionStyle_, 0);
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

uint64_t sub_23EB4AAD0(uint64_t a1, void *a2)
{
  swift_getObjectType();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v4 = self;
  id v5 = objc_msgSend(v4, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23EB4D770();

  id v6 = objc_msgSend(v4, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  sub_23EB4D770();

  sub_23EB4D870();
  id v7 = objc_msgSend(v4, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  sub_23EB4D770();

  id v8 = objc_msgSend(self, sel_currentDevice, 0xE000000000000000);
  objc_msgSend(v8, sel_userInterfaceIdiom);

  *(void *)(swift_allocObject() + 16) = a2;
  id v9 = a2;
  sub_23EB4D860();
  sub_23EB4D860();
  swift_bridgeObjectRelease();
  sub_23EB4D860();
  sub_23EB4D860();
  swift_bridgeObjectRelease();
  sub_23EB4D860();
  return sub_23EB4D7F0();
}

uint64_t sub_23EB4ADEC()
{
  return sub_23EB4AAD0(*(void *)(v0 + 16), *(void **)(v0 + 24));
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

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_23EB4AEA0()
{
  swift_getObjectType();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = sub_23EB4D770();

  return v2;
}

void sub_23EB4AF58(void *a1, double a2)
{
  uint64_t v4 = sub_23EB4D7C0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  id v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_23EB4D7E0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    id v42 = a1;
    if (objc_msgSend(v42, sel_target))
    {
      self;
      v12 = (void *)swift_dynamicCastObjCClass();
      if (v12)
      {
        id v38 = objc_msgSend(v12, sel_navigationItem);
        id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
        uint64_t v14 = self;
        uint64_t v41 = v9;
        v15 = (void *)v14;
        v16 = (void *)sub_23EB4D810();
        id v17 = objc_msgSend(v15, sel_preferredFontForTextStyle_, v16);

        objc_msgSend(v13, sel_setFont_, v17);
        id v18 = v13;
        __swift_instantiateConcreteTypeFromMangledName(&qword_268C10058);
        uint64_t v39 = v5;
        uint64_t inited = swift_initStackObject();
        v20 = (void **)MEMORY[0x263F81500];
        *(_OWORD *)(inited + 16) = xmmword_23EB4F230;
        uint64_t v40 = v8;
        v21 = *v20;
        *(void *)(inited + 32) = *v20;
        v22 = self;
        id v23 = v21;
        id v24 = objc_msgSend(v22, sel_labelColor);
        id v25 = objc_msgSend(v24, sel_colorWithAlphaComponent_, a2);

        *(void *)(inited + 64) = sub_23EB4C72C(0, &qword_268C10060);
        *(void *)(inited + 40) = v25;
        sub_23EB4B550(inited, &qword_268C10070, &qword_268C10078, (uint64_t (*)(uint64_t))sub_23EB4C41C);
        id v26 = objc_allocWithZone(MEMORY[0x263F086A0]);
        v27 = (void *)sub_23EB4D810();
        type metadata accessor for Key(0);
        sub_23EB4C6A0(&qword_268C10068, type metadata accessor for Key);
        v28 = (void *)sub_23EB4D800();
        swift_bridgeObjectRelease();
        id v29 = objc_msgSend(v26, sel_initWithString_attributes_, v27, v28);

        id v37 = v18;
        objc_msgSend(v18, sel_setAttributedText_, v29);

        sub_23EB4C72C(0, &qword_268C10038);
        v30 = (void *)sub_23EB4D890();
        uint64_t v31 = swift_allocObject();
        v32 = v38;
        *(void *)(v31 + 16) = v38;
        *(void *)(v31 + 24) = v18;
        aBlock[4] = sub_23EB4C678;
        aBlock[5] = v31;
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 1107296256;
        aBlock[2] = sub_23EB4B680;
        aBlock[3] = &block_descriptor;
        v33 = _Block_copy(aBlock);
        id v34 = v32;
        swift_release();
        sub_23EB4D7D0();
        aBlock[0] = MEMORY[0x263F8EE78];
        sub_23EB4C6A0(&qword_268C10040, MEMORY[0x263F8F030]);
        __swift_instantiateConcreteTypeFromMangledName(&qword_268C10048);
        sub_23EB4C6E8(&qword_268C10050, &qword_268C10048);
        sub_23EB4D8B0();
        MEMORY[0x23ED0C280](0, v11, v7, v33);

        _Block_release(v33);
        swift_unknownObjectRelease();

        (*(void (**)(char *, uint64_t))(v39 + 8))(v7, v4);
        (*(void (**)(char *, uint64_t))(v41 + 8))(v11, v40);
        return;
      }
      swift_unknownObjectRelease();
    }
    id v35 = v42;
  }
}

unint64_t sub_23EB4B550(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t))
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v8 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = sub_23EB4D8C0();
  uint64_t v8 = (void *)v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  uint64_t v10 = v7 + 64;
  uint64_t v11 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_23EB4C7C4(v11, (uint64_t)&v18, a3);
    uint64_t v12 = v18;
    unint64_t result = a4(v18);
    if (v14) {
      break;
    }
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v8[6] + 8 * result) = v12;
    unint64_t result = (unint64_t)sub_23EB4C4B0(&v19, (_OWORD *)(v8[7] + 32 * result));
    uint64_t v15 = v8[2];
    BOOL v16 = __OFADD__(v15, 1);
    uint64_t v17 = v15 + 1;
    if (v16) {
      goto LABEL_11;
    }
    v8[2] = v17;
    v11 += 40;
    if (!--v9)
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

uint64_t sub_23EB4B680(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_23EB4B6C4()
{
  uint64_t v0 = self;
  id v1 = objc_msgSend(v0, sel_sharedApplication);
  uint64_t v2 = (void *)sub_23EB4D780();
  unsigned int v3 = objc_msgSend(v1, sel_canOpenURL_, v2);

  if (v3)
  {
    id v4 = objc_msgSend(v0, sel_sharedApplication);
    uint64_t v5 = (void *)sub_23EB4D780();
    sub_23EB4B550(MEMORY[0x263F8EE78], &qword_268C10028, &qword_268C10030, (uint64_t (*)(uint64_t))sub_23EB4C41C);
    type metadata accessor for OpenExternalURLOptionsKey(0);
    sub_23EB4C6A0(&qword_268C10020, type metadata accessor for OpenExternalURLOptionsKey);
    id v6 = (id)sub_23EB4D800();
    swift_bridgeObjectRelease();
    objc_msgSend(v4, sel_openURL_options_completionHandler_, v5, v6, 0);
  }
}

id sub_23EB4BA24(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = v4;
  if (a3)
  {
    uint64_t v8 = (void *)sub_23EB4D810();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = objc_msgSend(objc_allocWithZone(v5), sel_initWithStyle_reuseIdentifier_specifier_, a1, v8, a4);

  return v9;
}

id sub_23EB4BAB4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    uint64_t v10 = (void *)sub_23EB4D810();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  v14.receiver = v5;
  v14.super_class = ObjectType;
  id v11 = objc_msgSendSuper2(&v14, sel_initWithStyle_reuseIdentifier_specifier_, a1, v10, a4);

  id v12 = v11;
  if (v12) {

  }
  return v12;
}

id sub_23EB4BBDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = v3;
  if (a3)
  {
    id v6 = (void *)sub_23EB4D810();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithStyle_reuseIdentifier_, a1, v6);

  return v7;
}

id sub_23EB4BC58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    id v7 = (void *)sub_23EB4D810();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v7 = 0;
  }
  v10.receiver = v3;
  v10.super_class = ObjectType;
  id v8 = objc_msgSendSuper2(&v10, sel_initWithStyle_reuseIdentifier_, a1, v7);

  return v8;
}

id sub_23EB4BD80(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id sub_23EB4BDC4(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)swift_getObjectType();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id sub_23EB4BE60()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for BTSettingsPlacardView()
{
  return self;
}

uint64_t sub_23EB4BEBC(uint64_t a1, uint64_t a2)
{
  return sub_23EB4C03C(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_23EB4BEE0(uint64_t a1, uint64_t a2)
{
  return sub_23EB4C03C(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_23EB4BF00(uint64_t a1, id *a2)
{
  uint64_t result = sub_23EB4D820();
  *a2 = 0;
  return result;
}

uint64_t sub_23EB4BF78(uint64_t a1, id *a2)
{
  char v3 = sub_23EB4D830();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_23EB4BFF8@<X0>(uint64_t *a1@<X8>)
{
  sub_23EB4D840();
  uint64_t v2 = sub_23EB4D810();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_23EB4C03C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_23EB4D840();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_23EB4C080()
{
  sub_23EB4D840();
  sub_23EB4D850();

  return swift_bridgeObjectRelease();
}

uint64_t sub_23EB4C0D4()
{
  sub_23EB4D840();
  sub_23EB4D8F0();
  sub_23EB4D850();
  uint64_t v0 = sub_23EB4D900();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_23EB4C148()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_23EB4C180(double a1)
{
  sub_23EB4AF58(*(void **)(v1 + 16), a1);
}

void type metadata accessor for OpenExternalURLOptionsKey(uint64_t a1)
{
}

uint64_t sub_23EB4C1A0()
{
  uint64_t v0 = sub_23EB4D840();
  uint64_t v2 = v1;
  if (v0 == sub_23EB4D840() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_23EB4D8E0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_23EB4C230@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23EB4D840();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_23EB4C25C(uint64_t a1)
{
  uint64_t v2 = sub_23EB4C6A0(&qword_268C10068, type metadata accessor for Key);
  uint64_t v3 = sub_23EB4C6A0(&qword_268C100C0, type metadata accessor for Key);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_23EB4C318@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_23EB4D810();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_23EB4C360(uint64_t a1)
{
  uint64_t v2 = sub_23EB4C6A0(&qword_268C10020, type metadata accessor for OpenExternalURLOptionsKey);
  uint64_t v3 = sub_23EB4C6A0(&qword_268C100C8, type metadata accessor for OpenExternalURLOptionsKey);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

unint64_t sub_23EB4C41C(uint64_t a1)
{
  sub_23EB4D840();
  sub_23EB4D8F0();
  sub_23EB4D850();
  uint64_t v2 = sub_23EB4D900();
  swift_bridgeObjectRelease();

  return sub_23EB4C4C0(a1, v2);
}

_OWORD *sub_23EB4C4B0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_23EB4C4C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_23EB4D840();
    uint64_t v8 = v7;
    if (v6 == sub_23EB4D840() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_23EB4D8E0();
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
          uint64_t v13 = sub_23EB4D840();
          uint64_t v15 = v14;
          if (v13 == sub_23EB4D840() && v15 == v16) {
            break;
          }
          char v18 = sub_23EB4D8E0();
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

uint64_t sub_23EB4C638()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

id sub_23EB4C678()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_setTitleView_, *(void *)(v0 + 24));
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

uint64_t sub_23EB4C6A0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_23EB4C6E8(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_23EB4C72C(uint64_t a1, unint64_t *a2)
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

void type metadata accessor for Key(uint64_t a1)
{
}

void sub_23EB4C77C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_23EB4C7C4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23EB4C828()
{
  return sub_23EB4C6A0(&qword_268C10090, type metadata accessor for OpenExternalURLOptionsKey);
}

uint64_t sub_23EB4C870()
{
  return sub_23EB4C6A0(&qword_268C10098, type metadata accessor for OpenExternalURLOptionsKey);
}

uint64_t sub_23EB4C8B8()
{
  return sub_23EB4C6A0(&qword_268C100A0, type metadata accessor for Key);
}

uint64_t sub_23EB4C900()
{
  return sub_23EB4C6A0(&qword_268C100A8, type metadata accessor for Key);
}

uint64_t sub_23EB4C948()
{
  return sub_23EB4C6A0(&qword_268C100B0, type metadata accessor for Key);
}

uint64_t sub_23EB4C990()
{
  return sub_23EB4C6A0(&qword_268C100B8, type metadata accessor for OpenExternalURLOptionsKey);
}

void NotificationCallback_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_23EB2E000, log, OS_LOG_TYPE_ERROR, "Unable to set contact sync for null device", v1, 2u);
}

uint64_t sub_23EB4D770()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_23EB4D780()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_23EB4D790()
{
  return MEMORY[0x270F01E18]();
}

uint64_t sub_23EB4D7A0()
{
  return MEMORY[0x270F01E28]();
}

uint64_t sub_23EB4D7B0()
{
  return MEMORY[0x270F02A90]();
}

uint64_t sub_23EB4D7C0()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_23EB4D7D0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_23EB4D7E0()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_23EB4D7F0()
{
  return MEMORY[0x270F5D0D8]();
}

uint64_t sub_23EB4D800()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_23EB4D810()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_23EB4D820()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_23EB4D830()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_23EB4D840()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_23EB4D850()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_23EB4D860()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_23EB4D870()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_23EB4D880()
{
  return MEMORY[0x270F824A0]();
}

uint64_t sub_23EB4D890()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_23EB4D8A0()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_23EB4D8B0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_23EB4D8C0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_23EB4D8E0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_23EB4D8F0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_23EB4D900()
{
  return MEMORY[0x270F9FC90]();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E68]();
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x270EE54C8](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE54D0](allocator, userNotification, callout, order);
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x270EE7230]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

uint64_t CRConfirmAndContinueBluetoothClassicPairing()
{
  return MEMORY[0x270F151D0]();
}

uint64_t CRConnectBluetoothLE()
{
  return MEMORY[0x270F151D8]();
}

uint64_t CRStartBluetoothClassicPairing()
{
  return MEMORY[0x270F15200]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x270F95FF8]();
}

uint64_t MGIsDeviceOneOfType()
{
  return MEMORY[0x270F96010]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

CFStringRef SCDynamicStoreCopyComputerName(SCDynamicStoreRef store, CFStringEncoding *nameEncoding)
{
  return (CFStringRef)MEMORY[0x270F054D8](store, nameEncoding);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x270F82CD0](category);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _NETRBClientCreate()
{
  return MEMORY[0x270F4DC70]();
}

uint64_t _NETRBClientDestroy()
{
  return MEMORY[0x270F4DC78]();
}

uint64_t _NETRBClientGetHostCount()
{
  return MEMORY[0x270F4DC88]();
}

uint64_t _NETRBClientSetGlobalServiceState()
{
  return MEMORY[0x270F4DC90]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x270EDA768](name, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x270EDA798](*(void *)&token, state64);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t random(void)
{
  return MEMORY[0x270EDB0E8]();
}

void srandom(unsigned int a1)
{
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
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

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}