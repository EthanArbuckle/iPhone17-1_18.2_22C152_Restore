void sub_247E711D4(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1) {
    (*(void (**)(uint64_t))(v1 + 16))(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_247E71C38(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  if (a15) {
    (*(void (**)(void))(a15 + 16))();
  }
  _Unwind_Resume(exception_object);
}

void sub_247E71C70(uint64_t a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  JUMPOUT(0x247E71C48);
}

void sub_247E729C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_247E73C80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
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

void sub_247E74808(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_247E76780(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 112));
  _Unwind_Resume(a1);
}

void sub_247E76AA4(_Unwind_Exception *exception_object)
{
  if (v1) {
    (*(void (**)(uint64_t))(v1 + 16))(v1);
  }
  _Unwind_Resume(exception_object);
}

void AUGetAuthorizationStatesForService(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v8 = tcc_server_singleton_default();
  v9 = tcc_service_singleton_for_CF_name();
  v10 = [MEMORY[0x263EFF980] array];
  uint64_t v11 = [MEMORY[0x263EFF980] array];
  v12 = [MEMORY[0x263EFF980] array];
  v13 = _AULoggingFacility();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = a1;
    _os_log_impl(&dword_247E6E000, v13, OS_LOG_TYPE_DEFAULT, "Requesting TCC auth records for service: %@", buf, 0xCu);
  }

  id v14 = v10;
  id v15 = v11;
  id v16 = v12;
  tcc_server_message_get_authorization_records_by_service();
  if (a2) {
    *a2 = v14;
  }
  if (a3) {
    *a3 = v15;
  }
  if (a4) {
    *a4 = v16;
  }
}

void AUSetTCCLevelForService(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  v6 = _AULoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [NSNumber numberWithUnsignedLongLong:a3];
    int v12 = 138412802;
    uint64_t v13 = a1;
    __int16 v14 = 2112;
    id v15 = v5;
    __int16 v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_247E6E000, v6, OS_LOG_TYPE_DEFAULT, "Setting TCC auth for service: %@ appIdentifier:%@, accessLevel:%@", (uint8_t *)&v12, 0x20u);
  }
  v8 = tcc_server_singleton_default();
  id v9 = v5;
  [v9 cStringUsingEncoding:4];
  v10 = (void *)tcc_identity_create();
  uint64_t v11 = tcc_service_singleton_for_CF_name();
  tcc_server_message_set_authorization_value();
}

void sub_247E77B74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_247E78F10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_247E793DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __AUGetAuthorizationStatesForService_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (v5)
  {
    v6 = tcc_authorization_record_get_subject_identity();
    uint64_t authorization_right = tcc_authorization_record_get_authorization_right();
    v8 = (void *)[[NSString alloc] initWithCString:tcc_identity_get_identifier() encoding:4];
    if (v8)
    {
      switch(authorization_right)
      {
        case 0:
          id v9 = (id *)(a1 + 48);
          goto LABEL_14;
        case 3:
          id v9 = (id *)(a1 + 40);
          goto LABEL_14;
        case 2:
          id v9 = (id *)(a1 + 32);
LABEL_14:
          [*v9 addObject:v8];
          break;
      }
    }

    goto LABEL_16;
  }
  v10 = _AULoggingFacility();
  v6 = v10;
  if (a3)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __AUGetAuthorizationStatesForService_block_invoke_cold_1(a1, a3, v6);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 56);
    int v12 = 138412290;
    uint64_t v13 = v11;
    _os_log_impl(&dword_247E6E000, v6, OS_LOG_TYPE_DEFAULT, "Finished getting authorization for service: %@", (uint8_t *)&v12, 0xCu);
  }
LABEL_16:
}

void sub_247E7A8F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_247E7B0D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_247E7C10C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void PSCalendarAuthorizationStates(void *a1, void *a2, void *a3)
{
  v6 = (void *)tcc_server_create();
  v7 = tcc_service_singleton_for_CF_name();
  id v8 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v9 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v10 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  uint64_t v11 = _AULoggingFacility();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_247E6E000, v11, OS_LOG_TYPE_DEFAULT, "Requesting TCC auth records for service kTCCServiceCalendar", buf, 2u);
  }

  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  tcc_server_message_get_authorization_records_by_service();
  if (a1) {
    *a1 = (id)[v12 copy];
  }
  if (a2) {
    *a2 = (id)[v13 copy];
  }
  if (a3) {
    *a3 = (id)[v14 copy];
  }
}

void __PSCalendarAuthorizationStates_block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5)
  {
    v6 = tcc_authorization_record_get_subject_identity();
    uint64_t authorization_right = tcc_authorization_record_get_authorization_right();
    id v8 = (void *)[[NSString alloc] initWithCString:tcc_identity_get_identifier() encoding:4];
    if (v8)
    {
      switch(authorization_right)
      {
        case 0:
          id v9 = a1 + 6;
          goto LABEL_14;
        case 4:
          id v9 = a1 + 5;
          goto LABEL_14;
        case 2:
          id v9 = a1 + 4;
LABEL_14:
          [*v9 addObject:v8];
          break;
      }
    }

    goto LABEL_16;
  }
  id v10 = _AULoggingFacility();
  v6 = v10;
  if (a3)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __PSCalendarAuthorizationStates_block_invoke_cold_1(a3, v6);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_247E6E000, v6, OS_LOG_TYPE_DEFAULT, "Finished getting authorization for kTCCServiceCalendar", v11, 2u);
  }
LABEL_16:
}

id _AULoggingFacility()
{
  if (_AULoggingFacility_onceToken != -1) {
    dispatch_once(&_AULoggingFacility_onceToken, &__block_literal_global_2);
  }
  v0 = (void *)_AULoggingFacility_oslog;
  return v0;
}

uint64_t sub_247E7D9E8()
{
  uint64_t v1 = v0;
  sub_247E823E0();
  sub_247E823D0();
  sub_247E823C0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v2 = objc_msgSend(v0, sel_applicationBundleIdentifier);
  uint64_t v3 = sub_247E82390();
  uint64_t v5 = v4;

  id v6 = objc_allocWithZone(MEMORY[0x263F01878]);
  id v7 = sub_247E7DDB4(v3, v5, 0);
  id v10 = v7;
  if (!v7)
  {
    swift_release();
    return MEMORY[0x263F8EE78];
  }
  sub_247E822F0();
  id v11 = objc_msgSend(v1, sel_applicationBundleIdentifier);
  sub_247E82390();

  uint64_t v12 = sub_247E822E0();
  swift_bridgeObjectRelease();
  id v13 = v1;
  unint64_t v8 = sub_247E7E40C(v12, v13);
  swift_bridgeObjectRelease();

  if (v8 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_247E82470();
    swift_bridgeObjectRelease();
    if (!v20) {
      goto LABEL_15;
    }
  }
  else if (!*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_15:
    swift_release();

    return v8;
  }
  id v14 = self;
  id v15 = (void *)sub_247E82380();
  id v16 = objc_msgSend(v14, sel_groupSpecifierWithID_, v15);

  if (!v16) {
    goto LABEL_15;
  }
  if (!(v8 >> 62))
  {
    id v17 = v16;
LABEL_13:
    sub_247E7E174(0, 0, (uint64_t)v16);
    swift_release();

    return v8;
  }
  swift_bridgeObjectRetain();
  id v18 = v16;
  uint64_t v19 = sub_247E82470();
  uint64_t result = swift_bridgeObjectRelease();
  if ((v19 & 0x8000000000000000) == 0) {
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

void type metadata accessor for CFString()
{
  if (!qword_2692D0A78)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2692D0A78);
    }
  }
}

id sub_247E7DDB4(uint64_t a1, uint64_t a2, char a3)
{
  v10[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v5 = (void *)sub_247E82380();
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
    sub_247E82260();

    swift_willThrow();
  }
  return v6;
}

void sub_247E7DE90(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_247E7DE98@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

BOOL sub_247E7DEAC(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_247E7DEDC(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_247E7DEF0(void *result)
{
  *v1 &= *result;
  return result;
}

uint64_t sub_247E7DF04()
{
  swift_getWitnessTable();
  return sub_247E82270();
}

uint64_t sub_247E7DF70()
{
  return sub_247E7E0F0(&qword_2692D0A80);
}

void *sub_247E7DFA4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_247E7DFB0()
{
  return sub_247E82290();
}

uint64_t sub_247E7DFFC()
{
  return sub_247E82280();
}

uint64_t sub_247E7E054()
{
  return sub_247E824A0();
}

uint64_t sub_247E7E0BC()
{
  return sub_247E7E0F0(&qword_2692D0A88);
}

uint64_t sub_247E7E0F0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for CFString();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_247E7E134()
{
  unint64_t result = qword_2692D0A90;
  if (!qword_2692D0A90)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2692D0A90);
  }
  return result;
}

uint64_t sub_247E7E174(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = a3;
    uint64_t v5 = a2;
    uint64_t v6 = a1;
    unint64_t v7 = *v4;
    if (!(*v4 >> 62))
    {
      if (*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= a2) {
        goto LABEL_4;
      }
LABEL_32:
      __break(1u);
      goto LABEL_33;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v22 = sub_247E82470();
  swift_bridgeObjectRelease();
  if (v22 < v5) {
    goto LABEL_32;
  }
LABEL_4:
  uint64_t v9 = v5 - v6;
  if (__OFSUB__(v5, v6))
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  uint64_t v8 = 1 - v9;
  if (__OFSUB__(1, v9))
  {
LABEL_34:
    __break(1u);
LABEL_35:
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_247E82470();
    swift_bridgeObjectRelease();
    uint64_t v11 = v10 + v8;
    if (!__OFADD__(v10, v8)) {
      goto LABEL_8;
    }
LABEL_37:
    __break(1u);
LABEL_38:
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_247E82470();
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  unint64_t v7 = *v4;
  if (*v4 >> 62) {
    goto LABEL_35;
  }
  uint64_t v10 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v11 = v10 + v8;
  if (__OFADD__(v10, v8)) {
    goto LABEL_37;
  }
LABEL_8:
  unint64_t v7 = *v4;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v4 = v7;
  uint64_t v10 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v7 & 0x8000000000000000) == 0 && (v7 & 0x4000000000000000) == 0)
  {
    uint64_t v13 = v7 & 0xFFFFFFFFFFFFFF8;
    if (v11 <= *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_18;
    }
    uint64_t v10 = 1;
  }
  if (v7 >> 62) {
    goto LABEL_38;
  }
  uint64_t v14 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v14 <= v11) {
    uint64_t v14 = v11;
  }
  swift_bridgeObjectRetain();
  unint64_t v7 = MEMORY[0x24C56E010](v10, v14, 1, v7);
  swift_bridgeObjectRelease();
  *uint64_t v4 = v7;
  uint64_t v13 = v7 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  id v15 = (void *)(v13 + 32 + 8 * v6);
  sub_247E7E134();
  id v16 = (char *)swift_arrayDestroy();
  if (!v8) {
    goto LABEL_27;
  }
  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_247E82470();
    swift_bridgeObjectRelease();
    uint64_t v18 = v23 - v5;
    if (!__OFSUB__(v23, v5)) {
      goto LABEL_21;
    }
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  uint64_t v17 = *(void *)(v13 + 16);
  uint64_t v18 = v17 - v5;
  if (__OFSUB__(v17, v5)) {
    goto LABEL_41;
  }
LABEL_21:
  id v16 = (char *)(v15 + 1);
  uint64_t v19 = (char *)(v13 + 32 + 8 * v5);
  if (v15 + 1 != (void *)v19 || v16 >= &v19[8 * v18]) {
    id v16 = (char *)memmove(v16, v19, 8 * v18);
  }
  if (v7 >> 62)
  {
LABEL_42:
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_247E82470();
    id v16 = (char *)swift_bridgeObjectRelease();
    uint64_t v21 = v24 + v8;
    if (!__OFADD__(v24, v8)) {
      goto LABEL_26;
    }
LABEL_44:
    __break(1u);
    return MEMORY[0x270F9DBB8](v16);
  }
  uint64_t v20 = *(void *)(v13 + 16);
  uint64_t v21 = v20 + v8;
  if (__OFADD__(v20, v8)) {
    goto LABEL_44;
  }
LABEL_26:
  *(void *)(v13 + 16) = v21;
LABEL_27:
  void *v15 = v3;
  return MEMORY[0x270F9DBB8](v16);
}

uint64_t sub_247E7E40C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v3)
  {
    uint64_t v10 = MEMORY[0x263F8EE78];
    sub_247E82430();
    uint64_t v6 = a1 + 32;
    sub_247E823E0();
    while (1)
    {
      sub_247E823D0();
      sub_247E823C0();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      sub_247E7E608(v6, (uint64_t)v9);
      id v7 = objc_allocWithZone((Class)type metadata accessor for DefaultAppsSpecifier());
      id v8 = a2;
      if (!sub_247E7E66C(v9, a2)) {
        break;
      }
      swift_release();
      sub_247E82410();
      sub_247E82440();
      sub_247E82450();
      sub_247E82420();
      v6 += 40;
      if (!--v3) {
        return v10;
      }
    }
    sub_247E823D0();
    sub_247E823C0();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    uint64_t result = sub_247E82460();
    __break(1u);
  }
  return result;
}

uint64_t sub_247E7E608(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

id sub_247E7E66C(void *a1, void *a2)
{
  uint64_t v3 = v2;
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  sub_247E7E608((uint64_t)a1, (uint64_t)v2 + OBJC_IVAR____TtC19AppSystemSettingsUI20DefaultAppsSpecifier_provider);
  swift_unknownObjectWeakAssign();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247E822B0();
  if (v7)
  {
    id v8 = (void *)sub_247E82380();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = 0;
  }
  type metadata accessor for DefaultAppsViewController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v16.receiver = v3;
  v16.super_class = ObjectType;
  id v10 = objc_msgSendSuper2(&v16, sel_initWithName_target_set_get_detail_cell_edit_, v8, 0, 0, sel_getLocalizedDetailText, ObjCClassFromMetadata, 2, 0);

  if (v10)
  {

    id v11 = v10;
    objc_msgSend(v11, sel_setTarget_, v11);
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    id v12 = v11;
    sub_247E822C0();
    uint64_t v13 = (void *)sub_247E82380();
    swift_bridgeObjectRelease();
    objc_msgSend(v12, sel_setIdentifier_, v13);

    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    id v14 = v12;
    objc_msgSend(v14, sel_setUserInfo_, sub_247E82480());
    swift_unknownObjectRelease();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v10;
}

uint64_t sub_247E7E864()
{
  sub_247E823E0();
  sub_247E823D0();
  sub_247E823C0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  __swift_project_boxed_opaque_existential_1((void *)(v0 + OBJC_IVAR____TtC19AppSystemSettingsUI20DefaultAppsSpecifier_provider), *(void *)(v0 + OBJC_IVAR____TtC19AppSystemSettingsUI20DefaultAppsSpecifier_provider + 24));
  uint64_t v1 = sub_247E822A0();
  if (v2)
  {
    uint64_t v3 = v1;
    swift_release();
  }
  else
  {
    sub_247E823D0();
    sub_247E823C0();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    swift_release();
    return 0;
  }
  return v3;
}

id sub_247E7EAF4()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for DefaultAppsSpecifier()
{
  return self;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
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

id sub_247E7EC30()
{
  uint64_t v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  sub_247E823E0();
  sub_247E823D0();
  sub_247E823C0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v29.receiver = v0;
  v29.super_class = ObjectType;
  objc_msgSendSuper2(&v29, sel_viewDidLoad);
  id result = objc_msgSend(v0, sel_specifier);
  if (!result)
  {
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v4 = result;
  id v5 = objc_msgSend(result, sel_userInfo);

  if (v5)
  {
    sub_247E823F0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v21, 0, 32);
  }
  sub_247E7F794((uint64_t)v21, (uint64_t)v27);
  if (!v28)
  {
    sub_247E7F840((uint64_t)v27, &qword_2692D0AA8);
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v24 = 0;
    goto LABEL_15;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D0AB8);
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v24 = 0;
    long long v22 = 0u;
    long long v23 = 0u;
    goto LABEL_15;
  }
  if (!*((void *)&v23 + 1))
  {
LABEL_15:
    sub_247E7F840((uint64_t)&v22, &qword_2692D0AB0);
    return (id)swift_release();
  }
  sub_247E7F89C(&v22, (uint64_t)v27);
  id result = objc_msgSend(v1, sel_specifier);
  if (!result)
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v6 = result;
  __swift_project_boxed_opaque_existential_1(v27, v28);
  sub_247E822A0();
  if (v7)
  {
    uint64_t v8 = sub_247E82380();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = 0;
  }
  objc_msgSend(v6, sel_setProperty_forKey_, v8, *MEMORY[0x263F60308]);

  swift_unknownObjectRelease();
  sub_247E7E608((uint64_t)v27, (uint64_t)v21);
  uint64_t v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_247E7E608((uint64_t)v21, (uint64_t)v20);
  swift_retain();
  sub_247E82350();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  swift_release();
  v25 = sub_247E7F8EC;
  uint64_t v26 = v9;
  id v10 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_2692D0AC0));
  id v11 = (void *)sub_247E82300();
  id v12 = objc_msgSend(v11, sel_view);
  if (!v12)
  {

    goto LABEL_23;
  }
  uint64_t v13 = v12;
  id result = objc_msgSend(v1, sel_view);
  if (!result) {
    goto LABEL_26;
  }
  id v14 = result;
  objc_msgSend(result, sel_addSubview_, v13);

  id result = objc_msgSend(v1, sel_view);
  if (result)
  {
    id v15 = result;
    objc_msgSend(result, sel_bounds);
    double v17 = v16;
    double v19 = v18;

    objc_msgSend(v13, sel_setFrame_, 0.0, 0.0, v17, v19);
    objc_msgSend(v13, sel_setAutoresizingMask_, 18);
    objc_msgSend(v1, sel_addChildViewController_, v11);
    objc_msgSend(v11, sel_didMoveToParentViewController_, v1);

LABEL_23:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
    return (id)swift_release();
  }
LABEL_27:
  __break(1u);
  return result;
}

void sub_247E7F01C(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  sub_247E823E0();
  sub_247E823D0();
  sub_247E823C0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  objc_super v2 = (void *)MEMORY[0x24C56E960](v1);
  if (!v2) {
    goto LABEL_11;
  }
  uint64_t v3 = v2;
  id v4 = objc_msgSend(v2, sel_specifier);

  if (!v4) {
    goto LABEL_11;
  }
  type metadata accessor for DefaultAppsSpecifier();
  uint64_t v5 = swift_dynamicCastClass();
  if (!v5)
  {
    swift_release();

    return;
  }
  uint64_t v6 = v5;
  sub_247E823D0();
  sub_247E823C0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v7 = (void *)MEMORY[0x24C56E960](v6 + OBJC_IVAR____TtC19AppSystemSettingsUI20DefaultAppsSpecifier_specifiersProvider);
  if (!v7)
  {
    swift_release();

LABEL_11:
    swift_release();
    return;
  }
  uint64_t v8 = v7;
  id v9 = objc_msgSend(v7, sel_delegate);
  if (v9)
  {
    objc_msgSend(v9, sel_systemSettingsSpecifiersProviderDidReloadSpecifiers_, v8);
    swift_release();

    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_release();

    swift_release();
  }
}

uint64_t sub_247E7F2C8(void *a1)
{
  objc_super v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  sub_247E823E0();
  sub_247E823D0();
  sub_247E823C0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v15.receiver = v1;
  v15.super_class = ObjectType;
  objc_msgSendSuper2(&v15, sel_setSpecifier_, a1);
  if (objc_msgSend(a1, sel_userInfo))
  {
    sub_247E823F0();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
  }
  sub_247E7F794((uint64_t)&v8, (uint64_t)v13);
  if (!v14)
  {
    sub_247E7F840((uint64_t)v13, &qword_2692D0AA8);
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v12 = 0;
    goto LABEL_13;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D0AB8);
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v12 = 0;
    long long v10 = 0u;
    long long v11 = 0u;
    goto LABEL_13;
  }
  if (!*((void *)&v11 + 1))
  {
LABEL_13:
    sub_247E7F840((uint64_t)&v10, &qword_2692D0AB0);
    return swift_release();
  }
  sub_247E7F89C(&v10, (uint64_t)v13);
  __swift_project_boxed_opaque_existential_1(v13, v14);
  sub_247E822B0();
  if (v5)
  {
    uint64_t v6 = (void *)sub_247E82380();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  objc_msgSend(v2, sel_setTitle_, v6, v8, v9);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  return swift_release();
}

uint64_t type metadata accessor for DefaultAppsViewController()
{
  return self;
}

uint64_t sub_247E7F794(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D0AA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
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

uint64_t sub_247E7F840(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_247E7F89C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_247E7F8B4()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_247E7F8EC()
{
  sub_247E7F01C(v0);
}

uint64_t sub_247E7F8F4@<X0>(char *a1@<X8>)
{
  uint64_t v2 = v1;
  v34 = a1;
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D0AC8);
  uint64_t v32 = *(void *)(v33 - 8);
  uint64_t v3 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v31 = (char *)v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  v30 = (char *)v29 - v5;
  sub_247E823E0();
  v29[1] = sub_247E823D0();
  sub_247E823C0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_247E823D0();
  sub_247E823C0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D0AD0);
  sub_247E82360();
  swift_release();
  uint64_t v6 = v42;
  uint64_t v7 = __swift_project_boxed_opaque_existential_1(v41, v42);
  v29[0] = v29;
  uint64_t v8 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v7);
  long long v10 = (char *)v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v8 + 16))(v10);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v46 = AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v12 = __swift_allocate_boxed_opaque_existential_1(&v43);
  sub_247E822D0();
  uint64_t v13 = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v6);
  MEMORY[0x270FA5388](v13);
  (*(void (**)(char *, uint64_t *, uint64_t))(v15 + 16))((char *)v29 - v14, v12, AssociatedTypeWitness);
  uint64_t v16 = sub_247E82370();
  sub_247E80554(v2, (uint64_t)&v37);
  double v17 = (_OWORD *)swift_allocObject();
  long long v18 = v38;
  v17[1] = v37;
  v17[2] = v18;
  long long v19 = v40;
  v17[3] = v39;
  v17[4] = v19;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v43);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
  uint64_t v43 = v16;
  v44 = sub_247E80590;
  v45 = v17;
  uint64_t v46 = 0;
  uint64_t AssociatedConformanceWitness = 0;
  sub_247E823D0();
  sub_247E823C0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_247E82360();
  swift_release();
  __swift_project_boxed_opaque_existential_1(v41, v42);
  uint64_t v35 = sub_247E822A0();
  uint64_t v36 = v20;
  sub_247E80554(v2, (uint64_t)&v37);
  uint64_t v21 = (_OWORD *)swift_allocObject();
  long long v22 = v38;
  v21[1] = v37;
  v21[2] = v22;
  long long v23 = v40;
  _OWORD v21[3] = v39;
  v21[4] = v23;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D0AD8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692D0AE0);
  sub_247E805EC();
  sub_247E806A8();
  uint64_t v24 = v31;
  sub_247E82340();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  sub_247E80714((uint64_t)v44);
  sub_247E80714(v46);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
  v25 = *(void (**)(char *, char *, uint64_t))(v32 + 32);
  uint64_t v26 = v30;
  uint64_t v27 = v33;
  v25(v30, v24, v33);
  v25(v34, v26, v27);
  return swift_release();
}

uint64_t sub_247E7FEC8(uint64_t a1)
{
  sub_247E823E0();
  sub_247E823D0();
  sub_247E823C0();
  uint64_t isCurrentExecutor = swift_task_isCurrentExecutor();
  if ((isCurrentExecutor & 1) == 0) {
    uint64_t isCurrentExecutor = swift_task_reportUnexpectedExecutor();
  }
  (*(void (**)(uint64_t))(a1 + 48))(isCurrentExecutor);
  return swift_release();
}

uint64_t sub_247E7FF6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_247E823E0();
  sub_247E823D0();
  sub_247E823C0();
  uint64_t isCurrentExecutor = swift_task_isCurrentExecutor();
  if ((isCurrentExecutor & 1) == 0) {
    uint64_t isCurrentExecutor = swift_task_reportUnexpectedExecutor();
  }
  (*(void (**)(uint64_t))(a3 + 48))(isCurrentExecutor);
  return swift_release();
}

uint64_t sub_247E80018()
{
  return sub_247E82330();
}

uint64_t initializeBufferWithCopyOfBuffer for DefaultAppsProviderContent(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for DefaultAppsProviderContent(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for DefaultAppsProviderContent(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  uint64_t v5 = *(void *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = v5;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t *assignWithCopy for DefaultAppsProviderContent(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  a1[5] = a2[5];
  swift_retain();
  swift_release();
  uint64_t v4 = a2[7];
  a1[6] = a2[6];
  a1[7] = v4;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        long long v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for DefaultAppsProviderContent(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_release();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for DefaultAppsProviderContent(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DefaultAppsProviderContent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DefaultAppsProviderContent()
{
  return &type metadata for DefaultAppsProviderContent;
}

uint64_t sub_247E804D4()
{
  return swift_getOpaqueTypeConformance2();
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

uint64_t sub_247E80554(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_247E80590()
{
  return sub_247E7FEC8(v0 + 16);
}

uint64_t objectdestroy_2Tm()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t sub_247E805E4(uint64_t a1, uint64_t a2)
{
  return sub_247E7FF6C(a1, a2, v2 + 16);
}

unint64_t sub_247E805EC()
{
  unint64_t result = qword_2692D0AE8;
  if (!qword_2692D0AE8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2692D0AD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692D0AE8);
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

unint64_t sub_247E806A8()
{
  unint64_t result = qword_2692D0AF0;
  if (!qword_2692D0AF0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2692D0AE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692D0AF0);
  }
  return result;
}

uint64_t sub_247E80714(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_247E80724()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_247E80828(uint64_t a1, uint64_t a2, void *a3, void (*a4)(void))
{
  id v5 = a3;
  a4();
  uint64_t v7 = v6;

  if (v7)
  {
    uint64_t v8 = (void *)sub_247E82380();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

void sub_247E808A4()
{
  uint64_t v0 = (void *)*MEMORY[0x263F7C4F8];
  if (!*MEMORY[0x263F7C4F8])
  {
    __break(1u);
    goto LABEL_49;
  }
  type metadata accessor for CFString();
  sub_247E81DD8();
  char v1 = sub_247E82270();

  if (v1) {
    goto LABEL_8;
  }
  uint64_t v2 = (void *)*MEMORY[0x263F7C508];
  if (!*MEMORY[0x263F7C508])
  {
    __break(1u);
    goto LABEL_53;
  }
  char v3 = sub_247E82270();

  if (v3)
  {
LABEL_8:
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v7 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    sub_247E82250();

    return;
  }
  long long v4 = (void *)*MEMORY[0x263F7C5C8];
  if (!*MEMORY[0x263F7C5C8])
  {
    __break(1u);
    goto LABEL_57;
  }
  char v5 = sub_247E82270();

  if (v5) {
    goto LABEL_8;
  }
  uint64_t v8 = (void *)*MEMORY[0x263F7C658];
  if (!*MEMORY[0x263F7C658])
  {
    __break(1u);
    goto LABEL_61;
  }
  char v9 = sub_247E82270();

  if (v9) {
    goto LABEL_8;
  }
  uint64_t v10 = (void *)*MEMORY[0x263F7C5B8];
  if (!*MEMORY[0x263F7C5B8])
  {
    __break(1u);
    return;
  }
  char v11 = sub_247E82270();

  if (v11) {
    goto LABEL_8;
  }
  uint64_t v12 = (void *)*MEMORY[0x263F7C500];
  if (!*MEMORY[0x263F7C500])
  {
    __break(1u);
LABEL_67:
    __break(1u);
LABEL_68:
    __break(1u);
LABEL_69:
    __break(1u);
LABEL_70:
    __break(1u);
LABEL_71:
    __break(1u);
LABEL_72:
    __break(1u);
LABEL_73:
    __break(1u);
LABEL_74:
    __break(1u);
LABEL_75:
    __break(1u);
LABEL_76:
    __break(1u);
LABEL_77:
    __break(1u);
LABEL_78:
    __break(1u);
LABEL_79:
    __break(1u);
LABEL_80:
    __break(1u);
    goto LABEL_81;
  }
  char v13 = sub_247E82270();

  if (v13) {
    goto LABEL_8;
  }
  uint64_t v14 = (void *)*MEMORY[0x263F7C598];
  if (!*MEMORY[0x263F7C598]) {
    goto LABEL_67;
  }
  char v15 = sub_247E82270();

  if (v15) {
    goto LABEL_8;
  }
  uint64_t v16 = (void *)*MEMORY[0x263F7C640];
  if (!*MEMORY[0x263F7C640]) {
    goto LABEL_68;
  }
  char v17 = sub_247E82270();

  if (v17) {
    goto LABEL_8;
  }
  long long v18 = (void *)*MEMORY[0x263F7C548];
  if (!*MEMORY[0x263F7C548]) {
    goto LABEL_69;
  }
  char v19 = sub_247E82270();

  if (v19) {
    goto LABEL_8;
  }
  uint64_t v20 = (void *)*MEMORY[0x263F7C5A0];
  if (!*MEMORY[0x263F7C5A0]) {
    goto LABEL_70;
  }
  char v21 = sub_247E82270();

  if (v21) {
    goto LABEL_8;
  }
  long long v22 = (void *)*MEMORY[0x263F7C688];
  if (!*MEMORY[0x263F7C688]) {
    goto LABEL_71;
  }
  char v23 = sub_247E82270();

  if (v23) {
    goto LABEL_8;
  }
  uint64_t v24 = (void *)*MEMORY[0x263F7C678];
  if (!*MEMORY[0x263F7C678]) {
    goto LABEL_72;
  }
  char v25 = sub_247E82270();

  if (v25) {
    goto LABEL_8;
  }
  uint64_t v26 = (void *)*MEMORY[0x263F7C570];
  if (!*MEMORY[0x263F7C570]) {
    goto LABEL_73;
  }
  char v27 = sub_247E82270();

  if (v27) {
    goto LABEL_8;
  }
  uint64_t v28 = (void *)*MEMORY[0x263F7C590];
  if (!*MEMORY[0x263F7C590]) {
    goto LABEL_74;
  }
  char v29 = sub_247E82270();

  if (v29) {
    goto LABEL_8;
  }
  v30 = (void *)*MEMORY[0x263F7C588];
  if (!*MEMORY[0x263F7C588]) {
    goto LABEL_75;
  }
  char v31 = sub_247E82270();

  if (v31) {
    goto LABEL_8;
  }
  uint64_t v32 = (void *)*MEMORY[0x263F7C680];
  if (!*MEMORY[0x263F7C680]) {
    goto LABEL_76;
  }
  char v33 = sub_247E82270();

  if (v33) {
    goto LABEL_8;
  }
  v34 = (void *)*MEMORY[0x263F7C660];
  if (!*MEMORY[0x263F7C660]) {
    goto LABEL_77;
  }
  char v35 = sub_247E82270();

  if (v35) {
    goto LABEL_8;
  }
  uint64_t v36 = (void *)*MEMORY[0x263F7C5B0];
  if (!*MEMORY[0x263F7C5B0]) {
    goto LABEL_78;
  }
  char v37 = sub_247E82270();

  if (v37) {
    goto LABEL_8;
  }
  long long v38 = (void *)*MEMORY[0x263F7C568];
  if (!*MEMORY[0x263F7C568]) {
    goto LABEL_79;
  }
  char v39 = sub_247E82270();

  if (v39) {
    goto LABEL_8;
  }
  long long v40 = (void *)*MEMORY[0x263F7C5A8];
  if (!*MEMORY[0x263F7C5A8]) {
    goto LABEL_80;
  }
  char v41 = sub_247E82270();

  if (v41) {
    goto LABEL_8;
  }
LABEL_49:
  uint64_t v42 = (void *)*MEMORY[0x263F7C538];
  if (!*MEMORY[0x263F7C538])
  {
LABEL_81:
    __break(1u);
    goto LABEL_82;
  }
  char v43 = sub_247E82270();

  if (v43) {
    goto LABEL_8;
  }
LABEL_53:
  v44 = (void *)*MEMORY[0x263F7C5D0];
  if (!*MEMORY[0x263F7C5D0])
  {
LABEL_82:
    __break(1u);
    goto LABEL_83;
  }
  char v45 = sub_247E82270();

  if (v45) {
    goto LABEL_8;
  }
LABEL_57:
  uint64_t v46 = (void *)*MEMORY[0x263F7C518];
  if (!*MEMORY[0x263F7C518])
  {
LABEL_83:
    __break(1u);
    goto LABEL_84;
  }
  char v47 = sub_247E82270();

  if (v47) {
    goto LABEL_8;
  }
LABEL_61:
  v48 = (void *)*MEMORY[0x263F7C510];
  if (!*MEMORY[0x263F7C510])
  {
LABEL_84:
    __break(1u);
    return;
  }
  char v49 = sub_247E82270();

  if (v49) {
    goto LABEL_8;
  }
}

uint64_t sub_247E817BC()
{
  return 0;
}

id AUHelperFunctions.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AUHelperFunctions();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_247E81804()
{
  uint64_t v0 = (void *)*MEMORY[0x263F7C4F8];
  if (!*MEMORY[0x263F7C4F8])
  {
    __break(1u);
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    return;
  }
  type metadata accessor for CFString();
  sub_247E81DD8();
  char v1 = sub_247E82270();

  if (v1) {
    return;
  }
  objc_super v2 = (void *)*MEMORY[0x263F7C508];
  if (!*MEMORY[0x263F7C508]) {
    goto LABEL_15;
  }
  char v3 = sub_247E82270();

  if (v3) {
    return;
  }
  long long v4 = (void *)*MEMORY[0x263F7C5C8];
  if (!*MEMORY[0x263F7C5C8]) {
    goto LABEL_16;
  }
  char v5 = sub_247E82270();

  if (v5) {
    return;
  }
  uint64_t v6 = (void *)*MEMORY[0x263F7C5B8];
  if (!*MEMORY[0x263F7C5B8]) {
    goto LABEL_17;
  }
  char v7 = sub_247E82270();

  if (v7) {
    return;
  }
  uint64_t v8 = (void *)*MEMORY[0x263F7C688];
  if (!*MEMORY[0x263F7C688]) {
    goto LABEL_18;
  }
  char v9 = sub_247E82270();

  if ((v9 & 1) == 0)
  {
    uint64_t v10 = (void *)*MEMORY[0x263F7C590];
    if (*MEMORY[0x263F7C590])
    {
      sub_247E82270();

      return;
    }
    goto LABEL_19;
  }
}

void sub_247E81A08()
{
  uint64_t v0 = (void *)*MEMORY[0x263F7C678];
  if (!*MEMORY[0x263F7C678])
  {
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
    return;
  }
  type metadata accessor for CFString();
  sub_247E81DD8();
  char v1 = sub_247E82270();

  if (v1) {
    return;
  }
  objc_super v2 = (void *)*MEMORY[0x263F7C518];
  if (!*MEMORY[0x263F7C518]) {
    goto LABEL_29;
  }
  char v3 = sub_247E82270();

  if (v3) {
    return;
  }
  long long v4 = (void *)*MEMORY[0x263F7C5D0];
  if (!*MEMORY[0x263F7C5D0]) {
    goto LABEL_30;
  }
  char v5 = sub_247E82270();

  if (v5) {
    return;
  }
  uint64_t v6 = (void *)*MEMORY[0x263F7C570];
  if (!*MEMORY[0x263F7C570]) {
    goto LABEL_31;
  }
  char v7 = sub_247E82270();

  if (v7) {
    return;
  }
  uint64_t v8 = (void *)*MEMORY[0x263F7C500];
  if (!*MEMORY[0x263F7C500]) {
    goto LABEL_32;
  }
  char v9 = sub_247E82270();

  if (v9) {
    return;
  }
  uint64_t v10 = (void *)*MEMORY[0x263F7C598];
  if (!*MEMORY[0x263F7C598]) {
    goto LABEL_33;
  }
  char v11 = sub_247E82270();

  if (v11) {
    return;
  }
  uint64_t v12 = (void *)*MEMORY[0x263F7C640];
  if (!*MEMORY[0x263F7C640]) {
    goto LABEL_34;
  }
  char v13 = sub_247E82270();

  if (v13) {
    return;
  }
  uint64_t v14 = (void *)*MEMORY[0x263F7C548];
  if (!*MEMORY[0x263F7C548]) {
    goto LABEL_35;
  }
  char v15 = sub_247E82270();

  if (v15) {
    return;
  }
  uint64_t v16 = (void *)*MEMORY[0x263F7C5A0];
  if (!*MEMORY[0x263F7C5A0]) {
    goto LABEL_36;
  }
  char v17 = sub_247E82270();

  if (v17) {
    return;
  }
  long long v18 = (void *)*MEMORY[0x263F7C588];
  if (!*MEMORY[0x263F7C588]) {
    goto LABEL_37;
  }
  char v19 = sub_247E82270();

  if (v19) {
    return;
  }
  uint64_t v20 = (void *)*MEMORY[0x263F7C568];
  if (!*MEMORY[0x263F7C568]) {
    goto LABEL_38;
  }
  char v21 = sub_247E82270();

  if (v21) {
    return;
  }
  long long v22 = (void *)*MEMORY[0x263F7C5A8];
  if (!*MEMORY[0x263F7C5A8]) {
    goto LABEL_39;
  }
  char v23 = sub_247E82270();

  if ((v23 & 1) == 0)
  {
    uint64_t v24 = (void *)*MEMORY[0x263F7C510];
    if (*MEMORY[0x263F7C510])
    {
      sub_247E82270();

      return;
    }
    goto LABEL_40;
  }
}

unint64_t sub_247E81DD8()
{
  unint64_t result = qword_2692D0AF8;
  if (!qword_2692D0AF8)
  {
    type metadata accessor for CFString();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692D0AF8);
  }
  return result;
}

uint64_t type metadata accessor for AUHelperFunctions()
{
  return self;
}

uint64_t method lookup function for AUHelperFunctions(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AUHelperFunctions);
}

uint64_t dispatch thunk of static AUHelperFunctions.associatedApplicationBundleIdentifierForTCCService(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static AUHelperFunctions.associatedTypedIconIdentifierForTCCService(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of static AUHelperFunctions.localizedDisplayNameForTCCService(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of static AUHelperFunctions.classicIconCacheKeyForTCCService(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

void __AUGetAuthorizationStatesForService_block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 56);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_247E6E000, log, OS_LOG_TYPE_ERROR, "Error when requesting TCC for service: %@ error: %@", (uint8_t *)&v4, 0x16u);
}

void __PSCalendarAuthorizationStates_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_247E6E000, a2, OS_LOG_TYPE_ERROR, "Error when requesting TCC for kTCCServiceCalendar error: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t sub_247E82250()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_247E82260()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_247E82270()
{
  return MEMORY[0x270FA06B8]();
}

uint64_t sub_247E82280()
{
  return MEMORY[0x270FA06C8]();
}

uint64_t sub_247E82290()
{
  return MEMORY[0x270FA06D8]();
}

uint64_t sub_247E822A0()
{
  return MEMORY[0x270F25958]();
}

uint64_t sub_247E822B0()
{
  return MEMORY[0x270F25960]();
}

uint64_t sub_247E822C0()
{
  return MEMORY[0x270F25968]();
}

uint64_t sub_247E822D0()
{
  return MEMORY[0x270F25970]();
}

uint64_t sub_247E822E0()
{
  return MEMORY[0x270F25990]();
}

uint64_t sub_247E822F0()
{
  return MEMORY[0x270F25998]();
}

uint64_t sub_247E82300()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_247E82310()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_247E82320()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_247E82330()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_247E82340()
{
  return MEMORY[0x270F04188]();
}

uint64_t sub_247E82350()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_247E82360()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_247E82370()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_247E82380()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_247E82390()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_247E823A0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_247E823C0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_247E823D0()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_247E823E0()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_247E823F0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_247E82400()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_247E82410()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_247E82420()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_247E82430()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_247E82440()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_247E82450()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_247E82460()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_247E82470()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_247E82480()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_247E82490()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_247E824A0()
{
  return MEMORY[0x270F9FC90]();
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x270EE45B8](allocator, bundleURL);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
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

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

uint64_t CLCopyAppsUsingLocation()
{
  return MEMORY[0x270EE7448]();
}

uint64_t CTCellularDataPlanGetIsEnabled()
{
  return MEMORY[0x270EE8670]();
}

uint64_t DOCLocalizedDisplayName()
{
  return MEMORY[0x270F26B50]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

uint64_t PSApplicationSpecifierForAssistantSection()
{
  return MEMORY[0x270F551C8]();
}

uint64_t PSApplicationSpecifierForBBSection()
{
  return MEMORY[0x270F551D0]();
}

uint64_t PSBundlePathForPreferenceBundle()
{
  return MEMORY[0x270F551E8]();
}

uint64_t PSIsPearlAvailable()
{
  return MEMORY[0x270F55248]();
}

uint64_t SFRuntimeAbsoluteFilePathForPath()
{
  return MEMORY[0x270F5D1B8]();
}

uint64_t TCCAccessCopyBundleIdentifiersDisabledForService()
{
  return MEMORY[0x270F795B0]();
}

uint64_t TCCAccessCopyBundleIdentifiersForService()
{
  return MEMORY[0x270F795B8]();
}

uint64_t TCCAccessCopyInformationForBundle()
{
  return MEMORY[0x270F795D0]();
}

uint64_t TCCAccessGetOverrides()
{
  return MEMORY[0x270F795F0]();
}

uint64_t TCCAccessSetForBundle()
{
  return MEMORY[0x270F79658]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CTServerConnectionCopyCellularUsageWorkspaceInfo()
{
  return MEMORY[0x270EE8760]();
}

uint64_t _CTServerConnectionCreate()
{
  return MEMORY[0x270EE87B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

void objc_terminate(void)
{
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

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x270EDAA68](log, ptr);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
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

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x270FA2478]();
}

uint64_t swift_task_reportUnexpectedExecutor()
{
  return MEMORY[0x270FA2490]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t tcc_authorization_record_get_authorization_right()
{
  return MEMORY[0x270F79688]();
}

uint64_t tcc_authorization_record_get_subject_identity()
{
  return MEMORY[0x270F796A8]();
}

uint64_t tcc_identity_create()
{
  return MEMORY[0x270F796D8]();
}

uint64_t tcc_identity_get_identifier()
{
  return MEMORY[0x270F796E8]();
}

uint64_t tcc_server_create()
{
  return MEMORY[0x270F79710]();
}

uint64_t tcc_server_message_get_authorization_records_by_service()
{
  return MEMORY[0x270F79720]();
}

uint64_t tcc_server_message_prompt_authorization_value()
{
  return MEMORY[0x270F79728]();
}

uint64_t tcc_server_message_set_authorization_value()
{
  return MEMORY[0x270F79738]();
}

uint64_t tcc_server_singleton_default()
{
  return MEMORY[0x270F79740]();
}

uint64_t tcc_service_singleton_for_CF_name()
{
  return MEMORY[0x270F79758]();
}