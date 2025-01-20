__CFString *ASAccessoryStateToString(uint64_t a1)
{
  __CFString *v1;
  __CFString *v2;

  v1 = @"Authorized";
  v2 = @"?";
  if (a1 == 10) {
    v2 = @"AwaitingAuthorization";
  }
  if (a1 != 20) {
    v1 = v2;
  }
  if (a1) {
    return v1;
  }
  else {
    return @"Unauthorized";
  }
}

void sub_242F07BEC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_242F08060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
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

void sub_242F088E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_242F0AEC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *ASDiscoveryDescriptorRangeToString(uint64_t a1)
{
  v1 = @"?";
  if (a1 == 10) {
    v1 = @"Immediate";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"Default";
  }
}

Class initPSSpecifier()
{
  if (PreferencesLibrary_sOnce != -1) {
    dispatch_once(&PreferencesLibrary_sOnce, &__block_literal_global_263);
  }
  Class result = objc_getClass("PSSpecifier");
  classPSSpecifier = (uint64_t)result;
  getPSSpecifierClass = (uint64_t (*)())PSSpecifierFunction;
  return result;
}

id PSSpecifierFunction()
{
  return (id)classPSSpecifier;
}

void *__PreferencesLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/Preferences.framework/Preferences", 2);
  PreferencesLibrary_sLib = (uint64_t)result;
  return result;
}

id ASErrorF(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v18[2] = *MEMORY[0x263EF8340];
  v10 = [NSString stringWithUTF8String:a2];
  v11 = (void *)[[NSString alloc] initWithFormat:v10 arguments:&a9];
  id v12 = objc_alloc(MEMORY[0x263F087E8]);
  uint64_t v13 = *MEMORY[0x263F07F80];
  v17[0] = @"cuErrorMsg";
  v17[1] = v13;
  v18[0] = v11;
  v18[1] = v11;
  v14 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  v15 = (void *)[v12 initWithDomain:@"ASErrorDomain" code:a1 userInfo:v14];

  return v15;
}

__CFString *ASAccessoryEventTypeToString(uint64_t a1)
{
  if (a1 > 30)
  {
    if (a1 > 39)
    {
      if (a1 == 40) {
        return @"PickerDidPresent";
      }
      if (a1 == 50) {
        return @"PickerDidDismiss";
      }
    }
    else
    {
      if (a1 == 31) {
        return @"AccessoryRemoved";
      }
      if (a1 == 32) {
        return @"AccessoryChanged";
      }
    }
  }
  else if (a1 > 10)
  {
    if (a1 == 11) {
      return @"Invalidated";
    }
    if (a1 == 30) {
      return @"AccessoryAdded";
    }
  }
  else
  {
    if (!a1) {
      return @"Unknown";
    }
    if (a1 == 10) {
      return @"Activated";
    }
  }
  return @"?";
}

uint64_t sub_242F114C0()
{
  uint64_t v0 = sub_242F16958();
  __swift_allocate_value_buffer(v0, qword_268D5B618);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_268D5B618);
  if (qword_268D5B640 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_268D5BE20);
  v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

id sub_242F11588()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ASUIClientManager()), sel_init);
  qword_268D5B638 = (uint64_t)result;
  return result;
}

id ASUIClientManager.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id static ASUIClientManager.shared.getter()
{
  if (qword_268D5B630 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_268D5B638;

  return v0;
}

void sub_242F116A4(uint64_t a1, unint64_t a2, uint64_t a3, char **a4, uint64_t a5, unint64_t a6)
{
  uint64_t v7 = v6;
  if (qword_268D5B610 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_242F16958();
  __swift_project_value_buffer(v13, (uint64_t)qword_268D5B618);
  v14 = sub_242F16938();
  os_log_type_t v15 = sub_242F16A78();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_242F02000, v14, v15, "activateConnection", v16, 2u);
    MEMORY[0x2456704E0](v16, -1, -1);
  }

  v17 = (void *)(v7 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_completionHandler);
  uint64_t v18 = *(void *)(v7 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_completionHandler);
  void *v17 = a5;
  v17[1] = a6;
  swift_retain();
  sub_242F12500(v18);
  if (*(void *)(v7 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_connection))
  {
    v19 = sub_242F16938();
    os_log_type_t v20 = sub_242F16A68();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_242F02000, v19, v20, "Picker already activated", v21, 2u);
      MEMORY[0x2456704E0](v21, -1, -1);
    }

    type metadata accessor for ASError(0);
    uint64_t v22 = 500;
LABEL_36:
    unint64_t v106 = v22;
    sub_242F15300(MEMORY[0x263F8EE78]);
    sub_242F15CCC(&qword_268D5B668, type metadata accessor for ASError);
    sub_242F16908();
    sub_242F13A30(v103);

    return;
  }
  uint64_t v23 = mach_absolute_time();
  uint64_t v24 = OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_startTicksFull;
  uint64_t v25 = *(void *)(v7 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_startTicksFull);
  if (!v25)
  {
    *(void *)(v7 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_startTicksFull) = v23;
    uint64_t v25 = v23;
  }
  if (v23 < v25) {
    goto LABEL_114;
  }
  if ((unint64_t)UpTicksToSeconds() >= 0x10) {
    *(void *)(v7 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_debounceCounter) = 0;
  }
  uint64_t v26 = *(void *)(v7 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_debounceCounter);
  if (v26 > 2)
  {
    v42 = sub_242F16938();
    os_log_type_t v43 = sub_242F16A68();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v44 = 0;
      _os_log_impl(&dword_242F02000, v42, v43, "Picker rate limited for repeated calls", v44, 2u);
      MEMORY[0x2456704E0](v44, -1, -1);
    }

    type metadata accessor for ASError(0);
    uint64_t v22 = 550;
    goto LABEL_36;
  }
  *(void *)(v7 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_debounceCounter) = v26 + 1;
  *(void *)(v7 + v24) = mach_absolute_time();
  unint64_t v106 = MEMORY[0x263F8EE78];
  unint64_t v105 = MEMORY[0x263F8EE78];
  a6 = a2 >> 62;
  if (a2 >> 62) {
    goto LABEL_116;
  }
  uint64_t v27 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (1)
  {
    v101 = (id *)a2;
    uint64_t v102 = v27;
    if (v27)
    {
      uint64_t v98 = a3;
      if (v27 < 1)
      {
        __break(1u);
        goto LABEL_118;
      }
      uint64_t v28 = 0;
      unint64_t v29 = a2 & 0xC000000000000001;
      do
      {
        if (v29) {
          id v30 = (id)MEMORY[0x24566FCA0](v28, a2);
        }
        else {
          id v30 = *(id *)(a2 + 8 * v28 + 32);
        }
        v31 = v30;
        id v32 = objc_msgSend(v30, sel_productImage);
        id v33 = objc_msgSend(v32, sel_imageAsset);

        if (!v33) {
          goto LABEL_26;
        }
        id v34 = objc_msgSend(v31, sel_productImage);
        objc_msgSend(v34, sel_size);
        double v36 = v35;

        if (v36 == 0.0
          || (id v37 = objc_msgSend(v31, sel_productImage),
              objc_msgSend(v37, sel_size),
              double v39 = v38,
              v37,
              v39 == 0.0))
        {
LABEL_26:
          id v40 = v31;
          MEMORY[0x24566FB50]();
          if (*(void *)((v105 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v105 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_242F16A48();
          }
        }
        else
        {
          id v41 = v31;
          MEMORY[0x24566FB50]();
          if (*(void *)((v106 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v106 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_242F16A48();
          }
        }
        sub_242F16A58();
        ++v28;
        sub_242F16A38();

        a2 = (unint64_t)v101;
      }
      while (v102 != v28);
      swift_bridgeObjectRelease();
      unint64_t v45 = v105;
      a3 = v98;
      if (!(v105 >> 62))
      {
LABEL_38:
        if (!*(void *)((v45 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_43;
        }
        goto LABEL_39;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      unint64_t v45 = MEMORY[0x263F8EE78];
      if (!(MEMORY[0x263F8EE78] >> 62)) {
        goto LABEL_38;
      }
    }
    swift_bridgeObjectRetain();
    uint64_t v56 = sub_242F16B78();
    swift_bridgeObjectRelease();
    if (!v56) {
      goto LABEL_43;
    }
LABEL_39:
    v46 = sub_242F16938();
    os_log_type_t v47 = sub_242F16A68();
    if (os_log_type_enabled(v46, v47))
    {
      v48 = (uint8_t *)swift_slowAlloc();
      v99 = (void *)swift_slowAlloc();
      v104 = v99;
      *(_DWORD *)v48 = 136315138;
      swift_beginAccess();
      uint64_t v49 = sub_242F1655C(0, &qword_268D5B698);
      uint64_t v50 = swift_bridgeObjectRetain();
      uint64_t v51 = MEMORY[0x24566FB80](v50, v49);
      unint64_t v53 = v52;
      swift_bridgeObjectRelease();
      sub_242F15650(v51, v53, (uint64_t *)&v104);
      sub_242F16AF8();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_242F02000, v46, v47, "Ignoring invalid display items: %s", v48, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2456704E0](v99, -1, -1);
      MEMORY[0x2456704E0](v48, -1, -1);
    }

    a2 = (unint64_t)v101;
    if (!(v106 >> 62))
    {
      if (!*(void *)((v106 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_119;
      }
      goto LABEL_43;
    }
LABEL_118:
    swift_bridgeObjectRetain();
    uint64_t v94 = sub_242F16B78();
    swift_bridgeObjectRelease();
    if (!v94)
    {
LABEL_119:
      swift_bridgeObjectRelease();
      v57 = sub_242F16938();
      os_log_type_t v58 = sub_242F16A68();
      if (os_log_type_enabled(v57, v58))
      {
        v59 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v59 = 0;
        v60 = "Cannot launch picker due to no valid display item";
        goto LABEL_121;
      }
LABEL_122:

      type metadata accessor for ASError(0);
      sub_242F15300(MEMORY[0x263F8EE78]);
      sub_242F15CCC(&qword_268D5B668, type metadata accessor for ASError);
      sub_242F16908();
      v95 = v104;
      sub_242F13A30(v104);

      goto LABEL_123;
    }
LABEL_43:
    sub_242F12C08();
    v54 = *(void **)(v7 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_server);
    if (!v54)
    {
      swift_bridgeObjectRelease();
      v57 = sub_242F16938();
      os_log_type_t v58 = sub_242F16A68();
      if (os_log_type_enabled(v57, v58))
      {
        v59 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v59 = 0;
        v60 = "No server connection available";
LABEL_121:
        _os_log_impl(&dword_242F02000, v57, v58, v60, v59, 2u);
        MEMORY[0x2456704E0](v59, -1, -1);
        goto LABEL_122;
      }
      goto LABEL_122;
    }
    swift_unknownObjectWeakAssign();
    uint64_t v55 = OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_displayItems;
    *(void *)(v7 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_displayItems) = v106;
    swift_unknownObjectRetain();
    swift_bridgeObjectRelease();
    if (*(void *)(v7 + v55) >> 62)
    {
      swift_bridgeObjectRetain();
      sub_242F16B78();
      swift_bridgeObjectRelease();
    }
    sub_242F1655C(0, &qword_268D5B688);
    v96 = (void *)sub_242F16AC8();
    if (a6)
    {
      swift_bridgeObjectRetain();
      uint64_t v7 = sub_242F16B78();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v7 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    id v97 = v54;
    if (!v102) {
      break;
    }
    v61 = a4;
    sub_242F1655C(0, &qword_268D5B690);
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    unint64_t v100 = a2 & 0xC000000000000001;
    swift_bridgeObjectRetain();
    uint64_t v63 = 4;
    a4 = &selRef_setDaSession_;
    while (1)
    {
      id v64 = v100 ? (id)MEMORY[0x24566FCA0](v63 - 4, a2) : *(id *)(a2 + 8 * v63);
      v65 = v64;
      a6 = v63 - 3;
      if (__OFADD__(v63 - 4, 1)) {
        break;
      }
      unsigned __int8 v66 = objc_msgSend(v64, sel_isKindOfClass_, ObjCClassFromMetadata);

      if ((v66 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        a4 = v61;
        uint64_t v67 = v102;
LABEL_68:
        uint64_t v70 = a2 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain();
        unint64_t v71 = 0;
        a3 = 0;
        uint64_t v7 = 0;
        a6 = a2 & 0xFFFFFFFFFFFFFF8;
        if (v100)
        {
LABEL_69:
          v72 = (id *)MEMORY[0x24566FCA0](v71, a2);
          goto LABEL_72;
        }
        while (2)
        {
          if (v71 >= *(void *)(v70 + 16)) {
            goto LABEL_115;
          }
          v72 = (id *)*(id *)(a2 + 8 * v71 + 32);
LABEL_72:
          a2 = (unint64_t)v72;
          if (__OFADD__(v71, 1)) {
            goto LABEL_113;
          }
          if (v7)
          {
            if (a3)
            {

LABEL_107:
              swift_bridgeObjectRelease();
              v90 = v97;
              if (!a4) {
                goto LABEL_110;
              }
              goto LABEL_108;
            }
LABEL_81:
            uint64_t v7 = 1;
LABEL_82:
            id v80 = objc_msgSend((id)a2, sel_descriptor);
            id v81 = objc_msgSend(v80, sel_SSID);
            if (v81)
            {
              a3 = (uint64_t)v81;

              goto LABEL_85;
            }
            a3 = (uint64_t)objc_msgSend(v80, sel_SSIDPrefix);

            if (a3)
            {
LABEL_85:

              a3 = 1;
            }
LABEL_86:
            a2 = (unint64_t)v101;
            if (v71 + 1 == v67) {
              goto LABEL_107;
            }
            ++v71;
            if (v100) {
              goto LABEL_69;
            }
            continue;
          }
          break;
        }
        id v73 = objc_msgSend(v72, sel_descriptor);
        if (objc_msgSend(v73, sel_bluetoothCompanyIdentifier))
        {

          if ((a3 & 1) == 0) {
            goto LABEL_81;
          }
LABEL_78:

          a3 = 1;
          uint64_t v7 = 1;
          goto LABEL_86;
        }
        id v74 = objc_msgSend(v73, sel_bluetoothManufacturerDataBlob);
        if (v74)
        {
          v75 = v74;
          uint64_t v76 = sub_242F16928();
          unint64_t v78 = v77;

          unint64_t v79 = v78;
          uint64_t v70 = a6;
          sub_242F15438(v76, v79);
          uint64_t v67 = v102;

          if ((a3 & 1) == 0) {
            goto LABEL_81;
          }
          goto LABEL_78;
        }
        id v82 = objc_msgSend(v73, sel_bluetoothManufacturerDataMask);
        if (v82)
        {
LABEL_90:
          v83 = v82;
          uint64_t v84 = sub_242F16928();
          unint64_t v86 = v85;

          sub_242F15438(v84, v86);
        }
        else
        {
          id v87 = objc_msgSend(v73, sel_bluetoothNameSubstring);
          if (!v87)
          {
            id v82 = objc_msgSend(v73, sel_bluetoothServiceDataBlob);
            if (!v82)
            {
              id v82 = objc_msgSend(v73, sel_bluetoothServiceDataMask);
              if (!v82)
              {
                id v89 = objc_msgSend(v73, sel_bluetoothServiceUUID);

                uint64_t v70 = a6;
                if (v89)
                {

                  if (a3)
                  {

                    a3 = 1;
                    uint64_t v7 = 1;
                    uint64_t v67 = v102;
                    goto LABEL_86;
                  }
                  uint64_t v7 = 1;
                }
                else
                {
                  if (a3)
                  {

                    uint64_t v7 = 0;
                    a3 = 1;
                    uint64_t v67 = v102;
                    goto LABEL_86;
                  }
                  uint64_t v7 = 0;
                }
                uint64_t v67 = v102;
                goto LABEL_82;
              }
            }
            goto LABEL_90;
          }
          id v88 = v87;

          id v73 = v88;
        }
        uint64_t v67 = v102;
        uint64_t v70 = a6;

        if ((a3 & 1) == 0) {
          goto LABEL_81;
        }
        goto LABEL_78;
      }
      ++v63;
      uint64_t v67 = v102;
      if (a6 == v102)
      {
        swift_bridgeObjectRelease();
        a4 = v61;
        if (v7 <= 0) {
          goto LABEL_68;
        }
LABEL_65:
        v68 = (void *)sub_242F16AD8();
        objc_msgSend(v97, sel_updateMigrationDisplayCount_, v68);

        if (a4) {
          v69 = (void *)sub_242F169B8();
        }
        else {
          v69 = 0;
        }
        objc_msgSend(v97, sel_showMigrationPickerWithOverrideBundleID_, v69);
        swift_unknownObjectRelease();

        goto LABEL_123;
      }
    }
    __break(1u);
LABEL_113:
    __break(1u);
LABEL_114:
    __break(1u);
LABEL_115:
    __break(1u);
LABEL_116:
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_242F16B78();
  }
  if (v7 >= 1) {
    goto LABEL_65;
  }
  v90 = v54;
  if (a4) {
LABEL_108:
  }
    v91 = (void *)sub_242F169B8();
  else {
LABEL_110:
  }
    v91 = 0;
  v92 = (void *)sub_242F16AC8();
  v93 = (void *)sub_242F16AC8();
  objc_msgSend(v90, sel_showPickerWithOverrideBundleID_shouldRetrieveDisplayItems_needsBluetooth_needsWiFi_, v91, v96, v92, v93);
  swift_unknownObjectRelease();

LABEL_123:
  swift_bridgeObjectRelease();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_242F12500(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

void type metadata accessor for ASError(uint64_t a1)
{
}

void sub_242F1263C(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_242F16918();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

void sub_242F126A0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = (void *)(v3 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_completionHandler);
  uint64_t v7 = *(void *)(v3 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_completionHandler);
  *uint64_t v6 = a2;
  v6[1] = a3;
  swift_retain();
  sub_242F12500(v7);
  v8 = *(void **)(v4 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_server);
  if (v8)
  {
    swift_unknownObjectRetain();
    id v9 = objc_msgSend(a1, sel_identifier);
    if (!v9)
    {
      sub_242F169C8();
      id v10 = (id)sub_242F169B8();
      swift_bridgeObjectRelease();
      id v9 = v10;
    }
    id v11 = v9;
    objc_msgSend(v8, sel_failAccessory_);
    swift_unknownObjectRelease();
  }
  else
  {
    type metadata accessor for ASError(0);
    sub_242F15300(MEMORY[0x263F8EE78]);
    sub_242F15CCC(&qword_268D5B668, type metadata accessor for ASError);
    sub_242F16908();
    sub_242F13A30(v12);
  }
}

void sub_242F128B8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  id v10 = (void *)(v6 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_completionHandler);
  uint64_t v11 = *(void *)(v6 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_completionHandler);
  void *v10 = a5;
  v10[1] = a6;
  swift_retain();
  sub_242F12500(v11);
  sub_242F12C08();
  id v12 = *(void **)(v7 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_server);
  if (!v12)
  {
    type metadata accessor for ASError(0);
    sub_242F15300(MEMORY[0x263F8EE78]);
    sub_242F15CCC(&qword_268D5B668, type metadata accessor for ASError);
    sub_242F16908();
    sub_242F13A30(v19);

    return;
  }
  swift_unknownObjectRetain();
  id v13 = objc_msgSend(a1, sel_SSID);
  if (v13) {

  }
  sub_242F1655C(0, &qword_268D5B688);
  v14 = (void *)sub_242F16AC8();
  id v15 = objc_msgSend(a1, sel_identifier);
  if (!v15)
  {
    sub_242F169C8();
    id v15 = (id)sub_242F169B8();
    swift_bridgeObjectRelease();
  }
  id v16 = objc_msgSend(a1, sel_displayName);
  if (!v16)
  {
    sub_242F169C8();
    id v16 = (id)sub_242F169B8();
    swift_bridgeObjectRelease();
    if (a4) {
      goto LABEL_9;
    }
LABEL_11:
    uint64_t v17 = 0;
    goto LABEL_12;
  }
  if (!a4) {
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v17 = sub_242F169B8();
LABEL_12:
  id v18 = (id)v17;
  objc_msgSend(v12, sel_renameAccessory_currentName_updateSSID_overrideBundleID_, v15, v16, v14);
  swift_unknownObjectRelease();
}

void sub_242F12C08()
{
  uint64_t v1 = OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_server;
  if (*(void *)&v0[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_server]) {
    return;
  }
  uint64_t v2 = v0;
  uint64_t v3 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ASUIClientWrapper()), sel_init);
  uint64_t v4 = *(void **)&v3[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientWrapper_clientManager];
  *(void *)&v3[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientWrapper_clientManager] = v0;
  v5 = v0;

  uint64_t v6 = *(void **)&v5[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_clientWrapper];
  *(void *)&v5[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_clientWrapper] = v3;
  uint64_t v49 = v3;

  uint64_t v7 = (void *)sub_242F169B8();
  id v8 = objc_msgSend(self, sel_interfaceWithIdentifier_, v7);

  id v9 = self;
  id v10 = objc_msgSend(v9, sel_protocolForProtocol_, &unk_26F88D208);
  objc_msgSend(v8, sel_setServer_, v10);

  id v11 = objc_msgSend(v9, sel_protocolForProtocol_, &unk_26F88BD20);
  objc_msgSend(v8, sel_setClient_, v11);

  objc_msgSend(v8, sel_setClientMessagingExpectation_, 0);
  id v12 = (void *)sub_242F169B8();
  id v13 = (void *)sub_242F169B8();
  id v14 = objc_msgSend(self, sel_endpointForMachName_service_instance_, v12, v13, 0);

  if (v14)
  {
    id v15 = self;
    id v16 = v14;
    id v17 = objc_msgSend(v15, sel_connectionWithEndpoint_, v16);
    if (v17)
    {
      id v18 = v17;
      aBlock[6] = &unk_26F88D1A8;
      uint64_t v19 = swift_dynamicCastObjCProtocolConditional();
      if (v19)
      {
        os_log_type_t v20 = (void *)v19;
        os_log_t oslog = (os_log_t)v1;
        v21 = (void *)swift_allocObject();
        v21[2] = v8;
        v21[3] = v49;
        v21[4] = v5;
        uint64_t v22 = swift_allocObject();
        *(void *)(v22 + 16) = sub_242F16518;
        *(void *)(v22 + 24) = v21;
        aBlock[4] = sub_242F16534;
        aBlock[5] = v22;
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 1107296256;
        aBlock[2] = sub_242F139DC;
        aBlock[3] = &block_descriptor_57;
        uint64_t v23 = _Block_copy(aBlock);
        uint64_t v24 = v5;
        uint64_t v50 = v49;
        id v25 = v18;
        id v26 = v8;
        swift_retain();
        swift_release();
        objc_msgSend(v20, sel_configureConnection_, v23);

        _Block_release(v23);
        char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
        swift_release();
        if (isEscapingClosureAtFileLocation)
        {
          __break(1u);
        }
        else
        {
          uint64_t v28 = *(void **)&v24[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_connection];
          *(void *)&v24[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_connection] = v20;
          id v29 = v25;

          objc_msgSend(v20, sel_activate);
          id v30 = (void *)sub_242F169B8();
          v31 = (void *)sub_242F169B8();
          id v32 = objc_msgSend(self, sel_attributeWithDomain_name_, v30, v31);

          __swift_instantiateConcreteTypeFromMangledName(&qword_268D5B8E0);
          uint64_t v33 = swift_allocObject();
          *(_OWORD *)(v33 + 16) = xmmword_242F1A820;
          *(void *)(v33 + 32) = v32;
          aBlock[0] = v33;
          sub_242F16A38();
          sub_242F1655C(0, &qword_268D5B8E8);
          id v34 = v32;
          double v35 = (void *)sub_242F16A08();
          swift_bridgeObjectRelease();
          id v36 = objc_msgSend(v20, sel_remoteTargetWithLaunchingAssertionAttributes_, v35);

          if (v36)
          {
            sub_242F16B18();
            swift_unknownObjectRelease();
          }
          else
          {
            long long v52 = 0u;
            long long v53 = 0u;
          }
          sub_242F16598((uint64_t)&v52, (uint64_t)aBlock);
          sub_242F16724((uint64_t)aBlock, (uint64_t)&v52, &qword_268D5B8F0);
          if (*((void *)&v53 + 1))
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_268D5B8F8);
            int v45 = swift_dynamicCast();
            v46 = v51;
            if (!v45) {
              v46 = 0;
            }
          }
          else
          {
            sub_242F16600((uint64_t)&v52);
            v46 = 0;
          }
          *(Class *)((char *)&oslog->isa + (void)v2) = v46;

          swift_unknownObjectRelease();
          sub_242F16600((uint64_t)aBlock);
          swift_release();
        }
        return;
      }
    }
    if (qword_268D5B610 != -1) {
      swift_once();
    }
    uint64_t v41 = sub_242F16958();
    __swift_project_value_buffer(v41, (uint64_t)qword_268D5B618);
    v42 = sub_242F16938();
    os_log_type_t v43 = sub_242F16A68();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v44 = 0;
      _os_log_impl(&dword_242F02000, v42, v43, "No valid endpoint's connection available", v44, 2u);
      MEMORY[0x2456704E0](v44, -1, -1);
    }
    else
    {
    }
  }
  else
  {
    if (qword_268D5B610 != -1) {
      swift_once();
    }
    uint64_t v37 = sub_242F16958();
    __swift_project_value_buffer(v37, (uint64_t)qword_268D5B618);
    osloga = sub_242F16938();
    os_log_type_t v38 = sub_242F16A68();
    if (os_log_type_enabled(osloga, v38))
    {
      double v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)double v39 = 0;
      _os_log_impl(&dword_242F02000, osloga, v38, "No server endpoint available", v39, 2u);
      MEMORY[0x2456704E0](v39, -1, -1);

      id v40 = osloga;
    }
    else
    {

      id v40 = v49;
    }
  }
}

id sub_242F133B8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (qword_268D5B610 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_242F16958();
  __swift_project_value_buffer(v8, (uint64_t)qword_268D5B618);
  id v9 = sub_242F16938();
  os_log_type_t v10 = sub_242F16A78();
  if (os_log_type_enabled(v9, v10))
  {
    id v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_242F02000, v9, v10, "configuring connection", v11, 2u);
    MEMORY[0x2456704E0](v11, -1, -1);
  }

  id v12 = (void *)sub_242F169B8();
  objc_msgSend(a1, sel_setName_, v12);

  id v13 = objc_msgSend(self, sel_userInitiated);
  objc_msgSend(a1, sel_setServiceQuality_, v13);

  objc_msgSend(a1, sel_setInterface_, a2);
  objc_msgSend(a1, sel_setInterfaceTarget_, a3);
  uint64_t v24 = sub_242F13730;
  uint64_t v25 = 0;
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 1107296256;
  uint64_t v22 = sub_242F13818;
  uint64_t v23 = &block_descriptor_60;
  id v14 = _Block_copy(&v20);
  objc_msgSend(a1, sel_setActivationHandler_, v14);
  _Block_release(v14);
  uint64_t v15 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v24 = sub_242F16698;
  uint64_t v25 = v15;
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 1107296256;
  uint64_t v22 = sub_242F13818;
  uint64_t v23 = &block_descriptor_66;
  id v16 = _Block_copy(&v20);
  swift_release();
  objc_msgSend(a1, sel_setInvalidationHandler_, v16);
  _Block_release(v16);
  uint64_t v17 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v24 = sub_242F166BC;
  uint64_t v25 = v17;
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 1107296256;
  uint64_t v22 = sub_242F13818;
  uint64_t v23 = &block_descriptor_70;
  id v18 = _Block_copy(&v20);
  swift_release();
  objc_msgSend(a1, sel_setInterruptionHandler_, v18);
  _Block_release(v18);
  return objc_msgSend(a1, sel_setTargetQueue_, *(void *)(a4 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_queue));
}

void sub_242F13730()
{
  if (qword_268D5B610 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_242F16958();
  __swift_project_value_buffer(v0, (uint64_t)qword_268D5B618);
  os_log_t oslog = sub_242F16938();
  os_log_type_t v1 = sub_242F16A78();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_242F02000, oslog, v1, "angel connection activated", v2, 2u);
    MEMORY[0x2456704E0](v2, -1, -1);
  }
}

void sub_242F13818(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_242F13880(uint64_t a1, uint64_t a2, const char *a3)
{
  uint64_t v4 = a2 + 16;
  if (qword_268D5B610 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_242F16958();
  __swift_project_value_buffer(v5, (uint64_t)qword_268D5B618);
  uint64_t v6 = sub_242F16938();
  os_log_type_t v7 = sub_242F16A78();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_242F02000, v6, v7, a3, v8, 2u);
    MEMORY[0x2456704E0](v8, -1, -1);
  }

  swift_beginAccess();
  uint64_t result = MEMORY[0x245670540](v4);
  if (result)
  {
    os_log_type_t v10 = (char *)result;
    uint64_t v11 = OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_connection;
    id v12 = *(void **)(result + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_connection);
    if (v12)
    {
      objc_msgSend(v12, sel_invalidate);
      id v13 = *(void **)&v10[v11];
    }
    else
    {
      id v13 = 0;
    }
    *(void *)&v10[v11] = 0;

    *(void *)&v10[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_server] = 0;
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_242F139DC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);

  return swift_unknownObjectRelease();
}

void *sub_242F13A30(void *a1)
{
  uint64_t v3 = sub_242F16968();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_242F16998();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  os_log_type_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = (void *)MEMORY[0x245670540](&v1[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_accessorySession]);
  if (result)
  {
    id v12 = result;
    id v13 = objc_msgSend(result, sel_queue);
    v19[0] = v7;
    id v14 = v13;

    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v1;
    *(void *)(v15 + 24) = a1;
    aBlock[4] = sub_242F167EC;
    aBlock[5] = v15;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_242F13D98;
    aBlock[3] = &block_descriptor_77;
    id v16 = _Block_copy(aBlock);
    uint64_t v17 = v1;
    id v18 = a1;
    sub_242F16978();
    v19[1] = MEMORY[0x263F8EE78];
    sub_242F15CCC(&qword_268D5B858, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D5B860);
    sub_242F161F0(&qword_268D5B868, &qword_268D5B860);
    sub_242F16B28();
    MEMORY[0x24566FC00](0, v10, v6, v16);
    _Block_release(v16);

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    (*(void (**)(char *, void))(v8 + 8))(v10, v19[0]);
    return (void *)swift_release();
  }
  return result;
}

uint64_t sub_242F13D14(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (uint64_t *)(a1 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_completionHandler);
  uint64_t v3 = *(void (**)(uint64_t))(a1 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_completionHandler);
  if (v3)
  {
    swift_retain();
    v3(a2);
    sub_242F12500((uint64_t)v3);
    uint64_t v5 = *v2;
  }
  else
  {
    uint64_t v5 = 0;
  }
  *uint64_t v2 = 0;
  v2[1] = 0;

  return sub_242F12500(v5);
}

uint64_t sub_242F13D98(uint64_t a1)
{
  os_log_type_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

id ASUIClientManager.__deallocating_deinit()
{
  os_log_type_t v1 = *(void **)&v0[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_connection];
  if (v1) {
    objc_msgSend(v1, sel_invalidate);
  }
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for ASUIClientManager();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

id ASUIClientManager.init()()
{
  uint64_t v11 = sub_242F16A98();
  uint64_t v1 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388]();
  objc_super v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_242F16A88();
  MEMORY[0x270FA5388]();
  sub_242F16998();
  MEMORY[0x270FA5388]();
  swift_unknownObjectWeakInit();
  uint64_t v4 = MEMORY[0x263F8EE78];
  *(void *)&v0[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_displayItems] = MEMORY[0x263F8EE78];
  uint64_t v10 = OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_queue;
  uint64_t v9 = sub_242F1655C(0, &qword_268D5B6A8);
  uint64_t v5 = v0;
  sub_242F16988();
  uint64_t v13 = v4;
  sub_242F15CCC(&qword_268D5B6B0, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D5B6B8);
  sub_242F161F0(&qword_268D5B6C0, &qword_268D5B6B8);
  sub_242F16B28();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F8F130], v11);
  *(void *)&v0[v10] = sub_242F16AB8();
  uint64_t v6 = &v5[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_completionHandler];
  *(void *)uint64_t v6 = 0;
  *((void *)v6 + 1) = 0;
  *(void *)&v5[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_connection] = 0;
  *(void *)&v5[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_clientWrapper] = 0;
  *(void *)&v5[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_server] = 0;
  *(void *)&v5[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_startTicksFull] = 0;
  *(void *)&v5[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_debounceCounter] = 0;

  uint64_t v7 = (objc_class *)type metadata accessor for ASUIClientManager();
  v12.receiver = v5;
  v12.super_class = v7;
  return objc_msgSendSuper2(&v12, sel_init);
}

void sub_242F1424C()
{
}

void sub_242F1429C(uint64_t a1)
{
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientWrapper_clientManager);
  if (v2)
  {
    id v4 = objc_allocWithZone((Class)ASAccessoryEvent);
    uint64_t v5 = v2;
    id v8 = objc_msgSend(v4, sel_initWithEventType_, 70);
    if (a1) {
      uint64_t v6 = (void *)sub_242F16918();
    }
    else {
      uint64_t v6 = 0;
    }
    objc_msgSend(v8, sel_setError_, v6);

    uint64_t v7 = (void *)MEMORY[0x245670540](&v5[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_accessorySession]);
    objc_msgSend(v7, sel_relayPickerEvent_, v8);
  }
}

void sub_242F143E8()
{
}

void sub_242F14438()
{
}

void sub_242F14488()
{
}

void sub_242F14490(uint64_t a1)
{
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientWrapper_clientManager);
  if (v2)
  {
    id v4 = objc_allocWithZone((Class)ASAccessoryEvent);
    uint64_t v5 = v2;
    id v7 = objc_msgSend(v4, sel_initWithEventType_, a1);
    uint64_t v6 = (void *)MEMORY[0x245670540](&v5[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_accessorySession]);
    objc_msgSend(v6, sel_relayPickerEvent_, v7);
  }
}

void sub_242F1459C(void *a1)
{
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientWrapper_clientManager);
  if (v2)
  {
    id v4 = objc_allocWithZone((Class)ASAccessoryEvent);
    uint64_t v5 = v2;
    id v6 = objc_msgSend(v4, sel_initWithEventType_, 50);
    if (a1) {
      a1 = (void *)sub_242F16918();
    }
    objc_msgSend(v6, sel_setError_, a1);

    id v7 = (void *)MEMORY[0x245670540](&v5[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_accessorySession]);
    objc_msgSend(v7, sel_relayPickerEvent_, v6);

    uint64_t v8 = OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_connection;
    uint64_t v9 = *(void **)&v5[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_connection];
    if (v9)
    {
      objc_msgSend(v9, sel_invalidate);
      uint64_t v10 = *(void **)&v5[v8];
    }
    else
    {
      uint64_t v10 = 0;
    }
    *(void *)&v5[v8] = 0;

    *(void *)&v5[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_server] = 0;
    swift_unknownObjectRelease();
    id v11 = *(id *)&v5[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_clientWrapper];
    *(void *)&v5[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_clientWrapper] = 0;
  }
}

uint64_t sub_242F1475C(void *a1)
{
  uint64_t v3 = sub_242F16968();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  id v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_242F16998();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t result = MEMORY[0x270FA5388]();
  id v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_super v12 = *(char **)(v1 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientWrapper_clientManager);
  if (v12)
  {
    uint64_t result = MEMORY[0x245670540](&v12[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_accessorySession]);
    if (result)
    {
      uint64_t v13 = (void *)result;
      id v14 = v12;
      uint64_t v23 = v4;
      uint64_t v15 = v14;
      id v22 = objc_msgSend(v13, sel_queue);

      uint64_t v16 = swift_allocObject();
      *(void *)(v16 + 16) = v15;
      *(void *)(v16 + 24) = a1;
      aBlock[4] = sub_242F161D0;
      aBlock[5] = v16;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_242F13D98;
      aBlock[3] = &block_descriptor;
      uint64_t v17 = _Block_copy(aBlock);
      id v18 = v15;
      id v19 = a1;
      sub_242F16978();
      uint64_t v24 = MEMORY[0x263F8EE78];
      sub_242F15CCC(&qword_268D5B858, MEMORY[0x263F8F030]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268D5B860);
      sub_242F161F0(&qword_268D5B868, &qword_268D5B860);
      sub_242F16B28();
      uint64_t v20 = v22;
      MEMORY[0x24566FC00](0, v11, v6, v17);
      _Block_release(v17);

      (*(void (**)(char *, uint64_t))(v23 + 8))(v6, v3);
      (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);

      return swift_release();
    }
  }
  return result;
}

uint64_t sub_242F14AC4(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_242F16B78();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (!v2) {
    return v3;
  }
  uint64_t v13 = MEMORY[0x263F8EE78];
  uint64_t result = sub_242F16240(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        MEMORY[0x24566FCA0](i, a1);
        sub_242F1655C(0, &qword_268D5B698);
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_242F16240(0, *(void *)(v3 + 16) + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v7 = *(void *)(v3 + 16);
        unint64_t v6 = *(void *)(v3 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_242F16240(v6 > 1, v7 + 1, 1);
          uint64_t v3 = v13;
        }
        *(void *)(v3 + 16) = v7 + 1;
        sub_242F16260(v12, (_OWORD *)(v3 + 32 * v7 + 32));
      }
    }
    else
    {
      uint64_t v8 = (id *)(a1 + 32);
      sub_242F1655C(0, &qword_268D5B698);
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_242F16240(0, *(void *)(v3 + 16) + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v11 = *(void *)(v3 + 16);
        unint64_t v10 = *(void *)(v3 + 24);
        if (v11 >= v10 >> 1)
        {
          sub_242F16240(v10 > 1, v11 + 1, 1);
          uint64_t v3 = v13;
        }
        *(void *)(v3 + 16) = v11 + 1;
        sub_242F16260(v12, (_OWORD *)(v3 + 32 * v11 + 32));
        ++v8;
        --v2;
      }
      while (v2);
    }
    return v3;
  }
  __break(1u);
  return result;
}

id sub_242F14E24()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ASUIClientWrapper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_242F14E68(uint64_t a1)
{
  uint64_t v2 = sub_242F15CCC(&qword_268D5B820, type metadata accessor for ASError);

  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t sub_242F14ED4(uint64_t a1)
{
  uint64_t v2 = sub_242F15CCC(&qword_268D5B820, type metadata accessor for ASError);

  return MEMORY[0x270EF2668](a1, v2);
}

uint64_t sub_242F14F44(uint64_t a1)
{
  uint64_t v2 = sub_242F15CCC(&qword_268D5B668, type metadata accessor for ASError);

  return MEMORY[0x270EEF788](a1, v2);
}

id sub_242F14FB0()
{
  return *v0;
}

uint64_t sub_242F14FB8@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_242F14FC0()
{
  return sub_242F169C8();
}

uint64_t sub_242F14FD0(uint64_t a1)
{
  uint64_t v2 = sub_242F15CCC(&qword_268D5B668, type metadata accessor for ASError);

  return MEMORY[0x270EEF7E8](a1, v2);
}

uint64_t sub_242F1503C(uint64_t a1)
{
  uint64_t v2 = sub_242F15CCC(&qword_268D5B668, type metadata accessor for ASError);

  return MEMORY[0x270EEF7A0](a1, v2);
}

uint64_t sub_242F150A8(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_242F15CCC(&qword_268D5B668, type metadata accessor for ASError);
  id v5 = a1;

  return MEMORY[0x270EEF790](v5, a2, v4);
}

uint64_t sub_242F15138()
{
  id v1 = *v0;
  uint64_t v2 = sub_242F16AE8();

  return v2;
}

uint64_t sub_242F15170(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_242F15CCC(&qword_268D5B668, type metadata accessor for ASError);

  return MEMORY[0x270EEF7D0](a1, a2, v4);
}

uint64_t sub_242F151EC()
{
  return sub_242F16BF8();
}

void *sub_242F1524C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_242F1525C(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_242F15268(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_242F15CCC(&qword_268D5B668, type metadata accessor for ASError);

  return MEMORY[0x270EEF7B8](a1, a2, a3, v6);
}

BOOL sub_242F152EC(void *a1, void *a2)
{
  return *a1 == *a2;
}

unint64_t sub_242F15300(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D5B900);
  uint64_t v2 = sub_242F16B88();
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
    sub_242F16724(v6, (uint64_t)&v15, &qword_268D5B908);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_242F15490(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    unint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_242F16260(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_242F15438(uint64_t a1, unint64_t a2)
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

unint64_t sub_242F15490(uint64_t a1, uint64_t a2)
{
  sub_242F16BE8();
  sub_242F169D8();
  uint64_t v4 = sub_242F16BF8();

  return sub_242F15508(a1, a2, v4);
}

unint64_t sub_242F15508(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_242F16BA8() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        BOOL v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_242F16BA8() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (sub_242F16BA8()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_242F15650(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_242F15724(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_242F16474((uint64_t)v12, *a3);
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
      sub_242F16474((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_242F15724(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_242F16B08();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_242F158E0(a5, a6);
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
  uint64_t v8 = sub_242F16B58();
  if (!v8)
  {
    sub_242F16B68();
    __break(1u);
LABEL_17:
    uint64_t result = sub_242F16B98();
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

uint64_t sub_242F158E0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_242F15978(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_242F15B58(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_242F15B58(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_242F15978(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_242F15AF0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_242F16B38();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_242F16B68();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_242F169E8();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_242F16B98();
    __break(1u);
LABEL_14:
    uint64_t result = sub_242F16B68();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_242F15AF0(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D5B878);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_242F15B58(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D5B878);
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
  BOOL v13 = a4 + 32;
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
  uint64_t result = sub_242F16B98();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for ASUIClientManager()
{
  return self;
}

uint64_t sub_242F15CCC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t method lookup function for ASUIClientManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ASUIClientManager);
}

uint64_t dispatch thunk of ASUIClientManager.activateConnection(session:with:for:completionHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of ASUIClientManager.fail(accessory:completionHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of ASUIClientManager.update(accessory:options:for:completionHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x168))();
}

uint64_t type metadata accessor for ASUIClientWrapper()
{
  return self;
}

uint64_t sub_242F15E90()
{
  return sub_242F15CCC(&qword_268D5B810, type metadata accessor for ASError);
}

uint64_t sub_242F15ED8()
{
  return sub_242F15CCC(&qword_268D5B818, type metadata accessor for ASError);
}

uint64_t sub_242F15F20()
{
  return sub_242F15CCC(&qword_268D5B820, type metadata accessor for ASError);
}

uint64_t sub_242F15F68()
{
  return sub_242F15CCC(&qword_268D5B828, type metadata accessor for ASError);
}

uint64_t sub_242F15FB0()
{
  return sub_242F15CCC(&qword_268D5B830, type metadata accessor for ASError);
}

uint64_t sub_242F15FF8()
{
  return sub_242F15CCC(&qword_268D5B838, type metadata accessor for Code);
}

void type metadata accessor for Code(uint64_t a1)
{
}

void sub_242F16054(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_242F1609C()
{
  return sub_242F15CCC(&qword_268D5B840, type metadata accessor for Code);
}

unint64_t sub_242F160E8()
{
  unint64_t result = qword_268D5B848;
  if (!qword_268D5B848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5B848);
  }
  return result;
}

uint64_t sub_242F1613C()
{
  return sub_242F15CCC(&qword_268D5B850, type metadata accessor for Code);
}

uint64_t sub_242F16184()
{
  return sub_242F15CCC(&qword_268D5B668, type metadata accessor for ASError);
}

uint64_t sub_242F161D0()
{
  return sub_242F13D14(*(void *)(v0 + 16), *(void *)(v0 + 24));
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

uint64_t sub_242F161F0(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_242F16240(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_242F16270(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

_OWORD *sub_242F16260(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_242F16270(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D5B870);
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
  BOOL v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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
  uint64_t result = sub_242F16B98();
  __break(1u);
  return result;
}

uint64_t sub_242F163E4()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_242F1641C(uint64_t a1)
{
  sub_242F1263C(a1, *(void *)(v1 + 16));
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

uint64_t sub_242F16474(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_242F164D0()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

id sub_242F16518(void *a1)
{
  return sub_242F133B8(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_242F16524()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_242F16534()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_242F1655C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_242F16598(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5B8F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_242F16600(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5B8F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_242F16660()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_242F16698(uint64_t a1)
{
  return sub_242F13880(a1, v1, "angel connection invalidated");
}

uint64_t sub_242F166BC(uint64_t a1)
{
  return sub_242F13880(a1, v1, "angel connection interrupted");
}

uint64_t objectdestroyTm()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_242F16724(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
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

uint64_t sub_242F16824()
{
  uint64_t v0 = sub_242F16958();
  __swift_allocate_value_buffer(v0, qword_268D5BE20);
  __swift_project_value_buffer(v0, (uint64_t)qword_268D5BE20);
  return sub_242F16948();
}

uint64_t sub_242F16908()
{
  return MEMORY[0x270EEF800]();
}

uint64_t sub_242F16918()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_242F16928()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_242F16938()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_242F16948()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_242F16958()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_242F16968()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_242F16978()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_242F16988()
{
  return MEMORY[0x270FA0A00]();
}

uint64_t sub_242F16998()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_242F169A8()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_242F169B8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_242F169C8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_242F169D8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_242F169E8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_242F169F8()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_242F16A08()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_242F16A18()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_242F16A28()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_242F16A38()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_242F16A48()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_242F16A58()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_242F16A68()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_242F16A78()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_242F16A88()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_242F16A98()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_242F16AA8()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_242F16AB8()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_242F16AC8()
{
  return MEMORY[0x270EF2180]();
}

uint64_t sub_242F16AD8()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_242F16AE8()
{
  return MEMORY[0x270FA11A0]();
}

uint64_t sub_242F16AF8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_242F16B08()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_242F16B18()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_242F16B28()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_242F16B38()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_242F16B48()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_242F16B58()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_242F16B68()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_242F16B78()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_242F16B88()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_242F16B98()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_242F16BA8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_242F16BD8()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_242F16BE8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_242F16BF8()
{
  return MEMORY[0x270F9FC90]();
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

uint64_t CUAppendF()
{
  return MEMORY[0x270F23F08]();
}

uint64_t CUPrintFlags64()
{
  return MEMORY[0x270F23FB0]();
}

uint64_t CUPrintHex()
{
  return MEMORY[0x270F23FB8]();
}

uint64_t CUPrintNSError()
{
  return MEMORY[0x270F23FD0]();
}

uint64_t CUXPCDecodeNSData()
{
  return MEMORY[0x270F24030]();
}

uint64_t CUXPCDecodeNSString()
{
  return MEMORY[0x270F24050]();
}

uint64_t CUXPCDecodeNSUUID()
{
  return MEMORY[0x270F24058]();
}

uint64_t CUXPCDecodeObject()
{
  return MEMORY[0x270F24060]();
}

uint64_t CUXPCDecodeSInt64RangedEx()
{
  return MEMORY[0x270F24068]();
}

uint64_t CUXPCDecodeUInt64RangedEx()
{
  return MEMORY[0x270F24070]();
}

uint64_t CUXPCEncodeObject()
{
  return MEMORY[0x270F24098]();
}

uint64_t FatalErrorF()
{
  return MEMORY[0x270F24178]();
}

uint64_t LogPrintF()
{
  return MEMORY[0x270F243F8]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t NSDecodeObjectIfPresent()
{
  return MEMORY[0x270F24468]();
}

uint64_t NSDecodeSInt64RangedIfPresent()
{
  return MEMORY[0x270F24470]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F82DD8](image);
}

uint64_t UpTicksToSeconds()
{
  return MEMORY[0x270F24820]();
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

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x270F24858]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t container_system_group_path_for_identifier()
{
  return MEMORY[0x270ED90F0]();
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x270ED9718]();
}

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
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

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
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

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x270FA0298]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
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

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
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

uint64_t tcc_authorization_record_get_authorization_right()
{
  return MEMORY[0x270F79688]();
}

uint64_t tcc_credential_singleton_for_self()
{
  return MEMORY[0x270F796B8]();
}

uint64_t tcc_message_options_create()
{
  return MEMORY[0x270F796F8]();
}

uint64_t tcc_message_options_set_reply_handler_policy()
{
  return MEMORY[0x270F79700]();
}

uint64_t tcc_message_options_set_request_prompt_policy()
{
  return MEMORY[0x270F79708]();
}

uint64_t tcc_server_create()
{
  return MEMORY[0x270F79710]();
}

uint64_t tcc_server_message_request_authorization()
{
  return MEMORY[0x270F79730]();
}

uint64_t tcc_service_singleton_for_CF_name()
{
  return MEMORY[0x270F79758]();
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x270EDBF50]();
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}