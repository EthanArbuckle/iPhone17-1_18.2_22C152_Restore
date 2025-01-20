id nm_extractTeamID(void *a1)
{
  return nm_signingInfo(a1, 0);
}

id nm_signingInfo(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24D172000, &_os_log_internal, OS_LOG_TYPE_INFO, " Extract signing info", buf, 2u);
  }
  if (v3)
  {
    *(void *)buf = 0;
    CFURLRef v4 = [NSURL fileURLWithPath:v3];
    if (SecStaticCodeCreateWithPath(v4, 0, (SecStaticCodeRef *)buf))
    {
      SecStaticCodeRef v5 = *(SecStaticCodeRef *)buf;
      if (*(void *)buf) {
LABEL_6:
      }
        CFRelease(v5);
    }
    else
    {
      CFDictionaryRef information = 0;
      OSStatus v8 = SecCodeCopySigningInformation(*(SecStaticCodeRef *)buf, 2u, &information);
      CFRelease(*(CFTypeRef *)buf);
      if (!v8)
      {
        if (a2 == 1)
        {
          v9 = CFDictionaryGetValue(information, (const void *)*MEMORY[0x263F17260]);
          v10 = v9;
          if (v9)
          {
            v6 = hexStringForData(v9);
          }
          else
          {
            v6 = 0;
          }
        }
        else if (a2)
        {
          v6 = 0;
        }
        else
        {
          v6 = CFDictionaryGetValue(information, (const void *)*MEMORY[0x263F17250]);
        }
        CFRelease(information);
        goto LABEL_8;
      }
      SecStaticCodeRef v5 = information;
      if (information) {
        goto LABEL_6;
      }
    }
    v6 = 0;
LABEL_8:

    goto LABEL_10;
  }
  v6 = 0;
LABEL_10:

  return v6;
}

id nm_extractCDHash(void *a1)
{
  return nm_signingInfo(a1, 1);
}

id hexStringForData(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (v1
    && (uint64_t v3 = [v1 length],
        CFURLRef v4 = (unsigned __int8 *)[v2 bytes],
        (SecStaticCodeRef v5 = malloc_type_calloc((2 * v3) | 1, 1uLL, 0xAC4065AAuLL)) != 0))
  {
    v6 = v5;
    if (v3)
    {
      v7 = (char *)v5;
      do
      {
        int v8 = *v4++;
        sprintf(v7, "%2.2x", v8);
        v7 += 2;
        --v3;
      }
      while (v3);
    }
    v9 = [NSString stringWithUTF8String:v6];
    free(v6);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void nm_systemstats_get_microstackshots(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v2 = v3;
  systemstats_get_microstackshots();
}

uint64_t __nm_systemstats_get_microstackshots_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t nm_macho_for_each_slice(void *a1, void *a2)
{
  id v3 = a2;
  CFURLRef v4 = (const char *)[a1 cStringUsingEncoding:4];
  callback[0] = MEMORY[0x263EF8330];
  callback[1] = 3221225472;
  callback[2] = __nm_macho_for_each_slice_block_invoke;
  callback[3] = &unk_265300940;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = macho_for_each_slice(v4, callback);

  return v6;
}

uint64_t __nm_macho_for_each_slice_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t nm_macho_for_each_imported_symbol(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id v3 = v6;
  uint64_t v4 = macho_for_each_imported_symbol();

  return v4;
}

uint64_t __nm_macho_for_each_imported_symbol_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t nm_macho_for_each_dependent_dylib(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id v3 = v6;
  uint64_t v4 = macho_for_each_dependent_dylib();

  return v4;
}

uint64_t __nm_macho_for_each_dependent_dylib_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t nm_macho_for_each_exported_symbol(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id v3 = v6;
  uint64_t v4 = macho_for_each_exported_symbol();

  return v4;
}

uint64_t __nm_macho_for_each_exported_symbol_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t nm_macho_for_each_defined_rpath(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id v3 = v6;
  uint64_t v4 = macho_for_each_defined_rpath();

  return v4;
}

uint64_t __nm_macho_for_each_defined_rpath_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t nm_macho_dylib_install_name()
{
  return MEMORY[0x270EDA2F0]();
}

uint64_t nm_dyld_image_path_containing_address()
{
  return MEMORY[0x270ED96D8]();
}

id nm_dyld_get_uuid_for_header()
{
  v3[2] = *MEMORY[0x263EF8340];
  v3[0] = 0;
  v3[1] = 0;
  v0 = 0;
  if (_dyld_get_image_uuid())
  {
    id v1 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:v3];
    v0 = [v1 UUIDString];
  }

  return v0;
}

uint64_t nm_OSASanitizePath(uint64_t a1)
{
  return MEMORY[0x270F51230](a1, MEMORY[0x263EFFA78]);
}

uint64_t nm_CRSetCrashLogMessage(uint64_t result)
{
  qword_26985A300 = result;
  return result;
}

uint64_t MicrostackshotsCoordinator.__allocating_init(interruptCallback:)(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 24) = a2;
  *(void *)(result + 32) = 0;
  *(_WORD *)(result + 40) = 1;
  *(void *)(result + 16) = a1;
  return result;
}

uint64_t MicrostackshotsCoordinator.init(interruptCallback:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 24) = a2;
  *(void *)(v2 + 32) = 0;
  *(_WORD *)(v2 + 40) = 1;
  *(void *)(v2 + 16) = a1;
  return v2;
}

uint64_t MicrostackshotsCoordinator.__allocating_init(interruptCallback:sendEvents:printTostdout:)(uint64_t a1, uint64_t a2, char a3, char a4)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 24) = a2;
  *(void *)(result + 32) = 0;
  *(void *)(result + 16) = a1;
  *(unsigned char *)(result + 40) = a3;
  *(unsigned char *)(result + 41) = a4;
  return result;
}

uint64_t MicrostackshotsCoordinator.init(interruptCallback:sendEvents:printTostdout:)(uint64_t a1, uint64_t a2, char a3, char a4)
{
  *(void *)(v4 + 24) = a2;
  *(void *)(v4 + 32) = 0;
  *(void *)(v4 + 16) = a1;
  *(unsigned char *)(v4 + 40) = a3;
  *(unsigned char *)(v4 + 41) = a4;
  return v4;
}

uint64_t sub_24D174BA8()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A180);
  MEMORY[0x270FA5388](v0 - 8);
  v69 = (char *)&v68 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = sub_24D195C70();
  uint64_t v71 = *(void *)(v73 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v73);
  v70 = (char *)&v68 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  v79 = (char *)&v68 - v4;
  uint64_t v5 = sub_24D195E40();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v8 = (char *)&v68 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24D195FE0();
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_269859FE8);
  uint64_t v9 = swift_allocObject();
  long long v78 = xmmword_24D196C10;
  *(_OWORD *)(v9 + 16) = xmmword_24D196C10;
  uint64_t v10 = MEMORY[0x263F8D750];
  *(void *)(v9 + 56) = MEMORY[0x263F8D6C8];
  *(void *)(v9 + 64) = v10;
  *(void *)(v9 + 32) = 500;
  uint64_t v77 = sub_24D177C34(0, (unint64_t *)&qword_26985A0D0);
  v11 = (void *)sub_24D196090();
  sub_24D195CB0();
  swift_bridgeObjectRelease();

  unint64_t v84 = 0;
  unint64_t v85 = 0xE000000000000000;
  sub_24D196150();
  swift_bridgeObjectRelease();
  unint64_t v84 = 0xD000000000000020;
  unint64_t v85 = 0x800000024D197900;
  uint64_t v80 = 500;
  sub_24D196240();
  sub_24D195E80();
  swift_bridgeObjectRelease();
  sub_24D195E80();
  sub_24D195E30();
  sub_24D1757BC();
  uint64_t v12 = sub_24D1960F0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRelease();
  if (v12)
  {
    nm_CRSetCrashLogMessage(v12 + 32);
    swift_bridgeObjectRelease();
  }
  type metadata accessor for AnalyticsRandomizer();
  v13 = (void *)swift_allocObject();
  v13[2] = sub_24D17630C(MEMORY[0x263F8EE78]);
  v13[5] = -1;
  sub_24D195FE0();
  v14 = (void *)sub_24D196090();
  sub_24D195CB0();

  v13[3] = 0xD00000000000002DLL;
  v13[4] = 0x800000024D197950;
  v76 = v13;
  v13[5] = 500;
  uint64_t v15 = sub_24D176F50();
  uint64_t v16 = (uint64_t)v79;
  v72 = (void (**)(uint64_t, char *, uint64_t))(v13 + 2);
  if (!v15)
  {
    sub_24D195FE0();
    v32 = (void *)sub_24D196090();
    sub_24D195CB0();

    goto LABEL_12;
  }
  uint64_t v17 = v15;
  uint64_t v18 = *(void *)(v15 + 16);
  if (!v18)
  {
    swift_bridgeObjectRelease();
LABEL_12:
    v31 = v70;
    uint64_t v20 = v74;
LABEL_13:
    sub_24D195FE0();
    v33 = (void *)sub_24D196090();
    sub_24D195CB0();

    sub_24D195C60();
    swift_beginAccess();
    v72 = (void (**)(uint64_t, char *, uint64_t))(v71 + 40);
    uint64_t v34 = 6;
    long long v74 = xmmword_24D196C20;
    while (1)
    {
      v35 = *(uint64_t (**)(uint64_t))(v20 + 16);
      uint64_t v36 = swift_retain();
      char v37 = v35(v36);
      swift_release();
      uint64_t v38 = v20;
      if (v37)
      {
        sub_24D195FD0();
        v53 = (void *)sub_24D196090();
        sub_24D195CB0();

        unsigned __int8 v83 = 1;
        uint64_t v54 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985A000) + 48);
        uint64_t v55 = v71;
        uint64_t v56 = (uint64_t)v69;
        uint64_t v57 = v73;
        (*(void (**)(char *, uint64_t, uint64_t))(v71 + 16))(v69, v16, v73);
        *(void *)(v56 + v54) = 0x4082C00000000000;
        uint64_t v58 = type metadata accessor for TargetType(0);
        swift_storeEnumTagMultiPayload();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v58 - 8) + 56))(v56, 0, 1, v58);
        unsigned __int8 v82 = 4;
        long long v81 = 0u;
        sub_24D18C314(&v83, v56, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, &v82, 0xD00000000000002DLL, 0x800000024D197C40);
        swift_release();
        sub_24D1777B4(v56);
        uint64_t v59 = *(void *)(v38 + 32);
        (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v16, v57);
        return v59;
      }
      sub_24D195C30();
      sub_24D195FE0();
      uint64_t v39 = swift_allocObject();
      *(_OWORD *)(v39 + 16) = v74;
      uint64_t v40 = sub_24D195C50();
      uint64_t v42 = v41;
      uint64_t v43 = MEMORY[0x263F8D310];
      *(void *)(v39 + 56) = MEMORY[0x263F8D310];
      unint64_t v44 = sub_24D177760();
      *(void *)(v39 + 64) = v44;
      *(void *)(v39 + 32) = v40;
      *(void *)(v39 + 40) = v42;
      uint64_t v45 = sub_24D195C50();
      *(void *)(v39 + 96) = v43;
      *(void *)(v39 + 104) = v44;
      *(void *)(v39 + 72) = v45;
      *(void *)(v39 + 80) = v46;
      v47 = (void *)sub_24D196090();
      sub_24D195CB0();
      uint64_t v16 = (uint64_t)v79;
      swift_bridgeObjectRelease();

      v48 = (void *)MEMORY[0x2533202C0]();
      uint64_t v49 = (uint64_t)v76;
      sub_24D175D08(v16, (uint64_t)v76, 600.0);
      sub_24D195FE0();
      uint64_t v50 = swift_allocObject();
      *(_OWORD *)(v50 + 16) = v78;
      uint64_t v51 = *(void *)(v20 + 32);
      *(void *)(v50 + 56) = MEMORY[0x263F8D6C8];
      *(void *)(v50 + 64) = MEMORY[0x263F8D750];
      *(void *)(v50 + 32) = v51;
      v52 = (void *)sub_24D196090();
      sub_24D195CB0();
      swift_bridgeObjectRelease();

      if (*(void *)(*(void *)(v49 + 16) + 16) >= 0x1F4uLL) {
        break;
      }
      (*v72)(v16, v31, v73);
      if (!--v34) {
        goto LABEL_20;
      }
    }
    (*(void (**)(char *, uint64_t))(v71 + 8))(v31, v73);
LABEL_20:
    sub_24D1831F8();
    uint64_t v59 = v60;
    sub_24D195FE0();
    uint64_t v61 = swift_allocObject();
    *(_OWORD *)(v61 + 16) = v78;
    *(void *)(v61 + 56) = MEMORY[0x263F8D6C8];
    *(void *)(v61 + 64) = MEMORY[0x263F8D750];
    *(void *)(v61 + 32) = v59;
    v62 = (void *)sub_24D196090();
    sub_24D195CB0();
    swift_bridgeObjectRelease();

    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v71 + 8))(v16, v73);
    return v59;
  }
  swift_beginAccess();
  uint64_t v19 = 0;
  uint64_t v20 = v74;
  while (1)
  {
    int v21 = *(_DWORD *)(v17 + 4 * v19 + 32);
    v22 = *(uint64_t (**)(uint64_t))(v20 + 16);
    uint64_t v23 = swift_retain();
    LOBYTE(v22) = v22(v23);
    swift_release();
    if (v22)
    {
      swift_bridgeObjectRelease();
      sub_24D195FD0();
      v63 = (void *)sub_24D196090();
      sub_24D195CB0();

      swift_release();
      return *(void *)(v20 + 32);
    }
    sub_24D195FE0();
    uint64_t v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = v78;
    *(void *)(v24 + 56) = MEMORY[0x263F8E548];
    *(void *)(v24 + 64) = MEMORY[0x263F8E5B0];
    *(_DWORD *)(v24 + 32) = v21;
    v25 = (void *)sub_24D196090();
    sub_24D195CB0();
    swift_bridgeObjectRelease();

    v26 = (void *)MEMORY[0x2533202C0]();
    uint64_t v27 = (uint64_t)v76;
    sub_24D175810(v21, (uint64_t)v76);
    sub_24D195FB0();
    uint64_t v20 = v74;
    uint64_t v28 = swift_allocObject();
    *(_OWORD *)(v28 + 16) = v78;
    uint64_t v29 = *(void *)(v20 + 32);
    *(void *)(v28 + 56) = MEMORY[0x263F8D6C8];
    *(void *)(v28 + 64) = MEMORY[0x263F8D750];
    *(void *)(v28 + 32) = v29;
    v30 = (void *)sub_24D196090();
    sub_24D195CB0();
    swift_bridgeObjectRelease();

    if (*(void *)(*(void *)(v27 + 16) + 16) >= 0x1F5uLL) {
      break;
    }
    if (v18 == ++v19)
    {
      swift_bridgeObjectRelease();
      uint64_t v16 = (uint64_t)v79;
      v31 = v70;
      goto LABEL_13;
    }
  }
  swift_bridgeObjectRelease();
  sub_24D1831F8();
  uint64_t v59 = v64;
  sub_24D195FE0();
  uint64_t v65 = swift_allocObject();
  *(_OWORD *)(v65 + 16) = v78;
  *(void *)(v65 + 56) = MEMORY[0x263F8D6C8];
  *(void *)(v65 + 64) = MEMORY[0x263F8D750];
  *(void *)(v65 + 32) = v59;
  v66 = (void *)sub_24D196090();
  sub_24D195CB0();
  swift_bridgeObjectRelease();

  swift_release();
  return v59;
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

unint64_t sub_24D1757BC()
{
  unint64_t result = qword_269859FF0;
  if (!qword_269859FF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269859FF0);
  }
  return result;
}

uint64_t sub_24D175810(int a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for AnalyzableTarget(0);
  MEMORY[0x270FA5388](v6 - 8);
  int v8 = (_DWORD *)((char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = sub_24D195E40();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24D195FB0();
  sub_24D177C34(0, (unint64_t *)&qword_26985A0D0);
  v13 = (void *)sub_24D196090();
  sub_24D195CB0();

  v20[0] = 0xD00000000000002ALL;
  v20[1] = 0x800000024D197DA0;
  sub_24D195E30();
  sub_24D1757BC();
  uint64_t v14 = sub_24D1960F0();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  swift_bridgeObjectRelease();
  if (v14)
  {
    nm_CRSetCrashLogMessage(v14 + 32);
    swift_bridgeObjectRelease();
  }
  *int v8 = a1;
  type metadata accessor for TargetType(0);
  swift_storeEnumTagMultiPayload();
  uint64_t v15 = swift_allocObject();
  swift_weakInit();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v15;
  *(void *)(v16 + 24) = a2;
  uint64_t v17 = v3[2];
  uint64_t v18 = v3[3];
  swift_retain();
  swift_retain();
  sub_24D194614((uint64_t)v8, (uint64_t)sub_24D177850, v16, v17, v18);
  swift_release();
  swift_release();
  sub_24D177858((uint64_t)v8);
  return v3[4];
}

uint64_t sub_24D175AA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v6 = *(void *)(result + 32);
    BOOL v7 = __OFADD__(v6, 1);
    uint64_t v8 = v6 + 1;
    if (v7)
    {
      __break(1u);
      goto LABEL_16;
    }
    *(void *)(result + 32) = v8;
    swift_release();
  }
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    swift_release();
    swift_beginAccess();
    uint64_t result = swift_weakLoadStrong();
    if (result)
    {
      int v9 = *(unsigned __int8 *)(result + 40);
      swift_release();
      if (v9 != 1) {
        goto LABEL_10;
      }
      goto LABEL_7;
    }
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
LABEL_7:
  if (a3)
  {
    sub_24D182CC8(a1);
  }
  else
  {
    uint64_t v10 = (void *)sub_24D195DE0();
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = a1;
    v15[4] = sub_24D177BC8;
    v15[5] = v11;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 1107296256;
    v15[2] = sub_24D18D3B0;
    v15[3] = &block_descriptor;
    uint64_t v12 = _Block_copy(v15);
    swift_bridgeObjectRetain();
    swift_release();
    AnalyticsSendEventLazy();
    _Block_release(v12);
  }
LABEL_10:
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (!result) {
    return result;
  }
  swift_release();
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (!result)
  {
LABEL_17:
    __break(1u);
    return result;
  }
  int v13 = *(unsigned __int8 *)(result + 41);
  uint64_t result = swift_release();
  if (v13 == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26985A050);
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_24D196C10;
    *(void *)(v14 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A058);
    *(void *)(v14 + 32) = a1;
    swift_bridgeObjectRetain();
    sub_24D1962B0();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24D175D08(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = type metadata accessor for AnalyzableTarget(0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24D195E40();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24D195FB0();
  sub_24D177C34(0, (unint64_t *)&qword_26985A0D0);
  uint64_t v15 = (void *)sub_24D196090();
  sub_24D195CB0();

  v24[0] = 0xD00000000000002BLL;
  v24[1] = 0x800000024D197ED0;
  sub_24D195E30();
  sub_24D1757BC();
  uint64_t v16 = sub_24D1960F0();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  swift_bridgeObjectRelease();
  if (v16)
  {
    nm_CRSetCrashLogMessage(v16 + 32);
    swift_bridgeObjectRelease();
  }
  uint64_t v17 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985A000) + 48);
  uint64_t v18 = sub_24D195C70();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16))(v10, a1, v18);
  *(double *)&v10[v17] = a3;
  type metadata accessor for TargetType(0);
  swift_storeEnumTagMultiPayload();
  uint64_t v19 = swift_allocObject();
  swift_weakInit();
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v19;
  *(void *)(v20 + 24) = a2;
  uint64_t v21 = *(void *)(v4 + 16);
  uint64_t v22 = *(void *)(v4 + 24);
  swift_retain();
  swift_retain();
  sub_24D194614((uint64_t)v10, (uint64_t)sub_24D177C2C, v20, v21, v22);
  swift_release();
  swift_release();
  return sub_24D177858((uint64_t)v10);
}

uint64_t sub_24D175FF0(uint64_t a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v3 = *(void *)(result + 32);
    BOOL v4 = __OFADD__(v3, 1);
    uint64_t v5 = v3 + 1;
    if (v4)
    {
      __break(1u);
      goto LABEL_14;
    }
    *(void *)(result + 32) = v5;
    swift_release();
  }
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    swift_release();
    swift_beginAccess();
    uint64_t result = swift_weakLoadStrong();
    if (result)
    {
      int v6 = *(unsigned __int8 *)(result + 40);
      swift_release();
      if (v6 != 1) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
LABEL_7:
  sub_24D182CC8(a1);
LABEL_8:
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (!result) {
    return result;
  }
  swift_release();
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (!result)
  {
LABEL_15:
    __break(1u);
    return result;
  }
  int v7 = *(unsigned __int8 *)(result + 41);
  uint64_t result = swift_release();
  if (v7 == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26985A050);
    uint64_t v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_24D196C10;
    *(void *)(v8 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A058);
    *(void *)(v8 + 32) = a1;
    swift_bridgeObjectRetain();
    sub_24D1962B0();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24D17617C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_24D1962C0();
    sub_24D195E70();
    uint64_t v6 = sub_24D1962E0();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_24D196250() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          uint64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_24D196250() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

uint64_t MicrostackshotsCoordinator.deinit()
{
  swift_release();
  return v0;
}

uint64_t MicrostackshotsCoordinator.__deallocating_deinit()
{
  swift_release();

  return MEMORY[0x270FA0228](v0, 42, 7);
}

unint64_t sub_24D17630C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985A078);
  uint64_t v2 = (void *)sub_24D196200();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  BOOL v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_24D183934(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
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

unint64_t sub_24D176428(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985A048);
  uint64_t v2 = (void *)sub_24D196200();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  BOOL v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_24D183934(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
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

unint64_t sub_24D176544(uint64_t a1)
{
  uint64_t v1 = a1;
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_10;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985A038);
  uint64_t v2 = sub_24D196200();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(v1 + 16);
  if (!v4)
  {
LABEL_10:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v23 = v2 + 64;
  swift_retain();
  uint64_t v25 = v4 - 1;
  uint64_t v5 = 32;
  for (i = v1; ; uint64_t v1 = i)
  {
    uint64_t v24 = v5;
    uint64_t v6 = v1 + v5;
    long long v7 = *(_OWORD *)(v6 + 48);
    long long v35 = *(_OWORD *)(v6 + 32);
    long long v36 = v7;
    long long v8 = *(_OWORD *)(v6 + 80);
    long long v37 = *(_OWORD *)(v6 + 64);
    long long v38 = v8;
    long long v9 = *(_OWORD *)(v6 + 112);
    long long v39 = *(_OWORD *)(v6 + 96);
    long long v40 = v9;
    long long v10 = *(_OWORD *)(v6 + 16);
    v34[0] = *(_OWORD *)v6;
    v34[1] = v10;
    uint64_t v11 = *(void *)(v6 + 128);
    uint64_t v41 = v11;
    long long v12 = v10;
    long long v13 = v35;
    long long v14 = v36;
    uint64_t v32 = *((void *)&v37 + 1);
    uint64_t v33 = v37;
    uint64_t v30 = *((void *)&v38 + 1);
    uint64_t v31 = v38;
    uint64_t v28 = *((void *)&v39 + 1);
    uint64_t v29 = v39;
    uint64_t v26 = *((void *)&v9 + 1);
    uint64_t v27 = v9;
    long long v15 = v34[0];
    sub_24D177A54((uint64_t)v34);
    unint64_t result = sub_24D183934(v15, *((uint64_t *)&v15 + 1));
    if (v17) {
      break;
    }
    *(void *)(v23 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_OWORD *)(v3[6] + 16 * result) = v15;
    uint64_t v18 = v3[7] + 120 * result;
    *(_OWORD *)uint64_t v18 = v12;
    *(_OWORD *)(v18 + 16) = v13;
    *(_OWORD *)(v18 + 32) = v14;
    *(void *)(v18 + 48) = v33;
    *(void *)(v18 + 56) = v32;
    *(void *)(v18 + 64) = v31;
    *(void *)(v18 + 72) = v30;
    *(void *)(v18 + 80) = v29;
    *(void *)(v18 + 88) = v28;
    *(void *)(v18 + 96) = v27;
    *(void *)(v18 + 104) = v26;
    *(void *)(v18 + 112) = v11;
    uint64_t v19 = v3[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_12;
    }
    v3[2] = v21;
    if (!v25)
    {
      swift_release();
      goto LABEL_10;
    }
    --v25;
    uint64_t v5 = v24 + 136;
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

unint64_t sub_24D176738(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985A040);
  uint64_t v2 = sub_24D196200();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v21 = v2 + 64;
  swift_retain();
  uint64_t v5 = (void *)(a1 + 144);
  while (1)
  {
    uint64_t v22 = v4;
    uint64_t v6 = *(v5 - 14);
    uint64_t v7 = *(v5 - 13);
    uint64_t v8 = *(v5 - 11);
    uint64_t v29 = *(v5 - 12);
    char v28 = *((unsigned char *)v5 - 80);
    uint64_t v9 = *(v5 - 8);
    uint64_t v10 = *(v5 - 6);
    uint64_t v26 = *(v5 - 7);
    uint64_t v27 = *(v5 - 9);
    uint64_t v11 = *(v5 - 4);
    uint64_t v12 = *(v5 - 2);
    uint64_t v24 = *(v5 - 3);
    uint64_t v25 = *(v5 - 5);
    uint64_t v13 = *v5;
    uint64_t v23 = *(v5 - 1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_24D183934(v6, v7);
    if (v15) {
      break;
    }
    *(void *)(v21 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v16 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v16 = v6;
    v16[1] = v7;
    uint64_t v17 = v3[7] + 104 * result;
    *(void *)uint64_t v17 = v29;
    *(void *)(v17 + 8) = v8;
    *(unsigned char *)(v17 + 16) = v28;
    *(void *)(v17 + 24) = v27;
    *(void *)(v17 + 32) = v9;
    *(void *)(v17 + 40) = v26;
    *(void *)(v17 + 48) = v10;
    *(void *)(v17 + 56) = v25;
    *(void *)(v17 + 64) = v11;
    *(void *)(v17 + 72) = v24;
    *(void *)(v17 + 80) = v12;
    *(void *)(v17 + 88) = v23;
    *(void *)(v17 + 96) = v13;
    uint64_t v18 = v3[2];
    BOOL v19 = __OFADD__(v18, 1);
    uint64_t v20 = v18 + 1;
    if (v19) {
      goto LABEL_11;
    }
    v3[2] = v20;
    v5 += 15;
    uint64_t v4 = v22 - 1;
    if (v22 == 1)
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

void *sub_24D176904@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_24D176910(uint64_t a1, uint64_t a2)
{
  return sub_24D176A7C(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_24D176928(uint64_t a1, id *a2)
{
  uint64_t result = sub_24D195DF0();
  *a2 = 0;
  return result;
}

uint64_t sub_24D1769A0(uint64_t a1, id *a2)
{
  char v3 = sub_24D195E00();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_24D176A20@<X0>(uint64_t *a1@<X8>)
{
  sub_24D195E10();
  uint64_t v2 = sub_24D195DE0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_24D176A64(uint64_t a1, uint64_t a2)
{
  return sub_24D176A7C(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_24D176A7C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_24D195E10();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_24D176AC0()
{
  sub_24D195E10();
  sub_24D195E70();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24D176B14()
{
  sub_24D195E10();
  sub_24D1962C0();
  sub_24D195E70();
  uint64_t v0 = sub_24D1962E0();
  swift_bridgeObjectRelease();
  return v0;
}

void sub_24D176B88(void *a1@<X8>)
{
  *a1 = 0;
}

BOOL sub_24D176B90(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_24D176BC0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_24D176BD4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

void *sub_24D176BE8(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_24D176BFC(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_24D176C10(void *result)
{
  *v1 ^= *result;
  return result;
}

BOOL sub_24D176C24()
{
  return *v0 == 0;
}

void *sub_24D176C34(void *result)
{
  *v1 &= ~*result;
  return result;
}

uint64_t sub_24D176C48()
{
  uint64_t v0 = sub_24D195E10();
  uint64_t v2 = v1;
  if (v0 == sub_24D195E10() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_24D196250();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

BOOL sub_24D176CD4(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24D176CE8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_24D195DE0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_24D176D30@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24D195E10();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24D176D5C(uint64_t a1)
{
  uint64_t v2 = sub_24D1779DC(&qword_26985A028);
  uint64_t v3 = sub_24D1779DC(&qword_26985A030);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

void sub_24D176DF4()
{
  uint64_t v1 = *v0;
  unint64_t v2 = *(void *)(*v0 + 16);
  unint64_t v3 = v2 - 2;
  if (v2 >= 2)
  {
    unint64_t v4 = 0;
    while (1)
    {
      unint64_t v13 = 0;
      MEMORY[0x253320920](&v13, 8);
      uint64_t v6 = (v13 * (unsigned __int128)v2) >> 64;
      if (v2 > v13 * v2)
      {
        unint64_t v7 = -(uint64_t)v2 % v2;
        if (v7 > v13 * v2)
        {
          do
          {
            unint64_t v13 = 0;
            MEMORY[0x253320920](&v13, 8);
          }
          while (v7 > v13 * v2);
          uint64_t v6 = (v13 * (unsigned __int128)v2) >> 64;
        }
      }
      unint64_t v8 = v4 + v6;
      if (__OFADD__(v4, v6)) {
        break;
      }
      if (v4 != v8)
      {
        unint64_t v9 = *(void *)(v1 + 16);
        if (v4 >= v9) {
          goto LABEL_19;
        }
        if (v8 >= v9) {
          goto LABEL_20;
        }
        int v10 = *(_DWORD *)(v1 + 32 + 4 * v4);
        int v11 = *(_DWORD *)(v1 + 32 + 4 * v8);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v1 = sub_24D176F3C(v1);
        }
        unint64_t v12 = *(void *)(v1 + 16);
        if (v4 >= v12) {
          goto LABEL_21;
        }
        *(_DWORD *)(v1 + 32 + 4 * v4) = v11;
        if (v8 >= v12) {
          goto LABEL_22;
        }
        *(_DWORD *)(v1 + 32 + 4 * v8) = v10;
        uint64_t *v0 = v1;
      }
      --v2;
      if (v4++ == v3) {
        return;
      }
    }
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
  }
}

uint64_t sub_24D176F3C(uint64_t a1)
{
  return sub_24D18FC9C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_24D176F50()
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A180);
  MEMORY[0x270FA5388](v0 - 8);
  unint64_t v2 = (char *)&v56 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24D195FE0();
  uint64_t v3 = sub_24D177C34(0, (unint64_t *)&qword_26985A0D0);
  unint64_t v4 = (void *)sub_24D196090();
  sub_24D195CB0();

  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F645E8]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985A060);
  uint64_t v6 = swift_allocObject();
  long long v62 = xmmword_24D196C10;
  *(_OWORD *)(v6 + 16) = xmmword_24D196C10;
  *(void *)(v6 + 32) = sub_24D195E10();
  *(void *)(v6 + 40) = v7;
  unint64_t v8 = (void *)sub_24D195F50();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_setEndowmentNamespaces_, v8);

  objc_msgSend(v5, sel_setValues_, 1);
  id v9 = objc_msgSend(self, sel_predicateMatchingProcessTypeApplication);
  int v10 = self;
  *(void *)&long long v66 = 0;
  id v11 = objc_msgSend(v10, sel_statesForPredicate_withDescriptor_error_, v9, v5, &v66);
  unint64_t v12 = (void *)v66;
  if (v11)
  {
    unint64_t v13 = v11;
    uint64_t v59 = v3;
    sub_24D177C34(0, &qword_26985A070);
    unint64_t v14 = sub_24D195F60();
    id v15 = v12;

    id v58 = v9;
    if (v14 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v16 = sub_24D1961D0();
      id v60 = v5;
      if (v16) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v16 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      id v60 = v5;
      if (v16)
      {
LABEL_4:
        if (v16 < 1) {
          __break(1u);
        }
        uint64_t v17 = 0;
        uint64_t v61 = (char *)MEMORY[0x263F8EE78];
        while (1)
        {
          if ((v14 & 0xC000000000000001) != 0) {
            id v18 = (id)MEMORY[0x25331FFF0](v17, v14);
          }
          else {
            id v18 = *(id *)(v14 + 8 * v17 + 32);
          }
          BOOL v19 = v18;
          if (objc_msgSend(v18, sel_taskState) != 4) {
            goto LABEL_25;
          }
          id v20 = objc_msgSend(v19, sel_endowmentNamespaces);
          if (!v20) {
            goto LABEL_25;
          }
          uint64_t v21 = v20;
          uint64_t v22 = sub_24D195F80();

          uint64_t v23 = sub_24D195E10();
          char v25 = sub_24D17617C(v23, v24, v22);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v25 & 1) == 0) {
            goto LABEL_25;
          }
          id v26 = objc_msgSend(v19, sel_process);
          if (!v26) {
            goto LABEL_25;
          }
          uint64_t v27 = v26;
          id v28 = objc_msgSend(v26, sel_bundle);

          if (!v28) {
            goto LABEL_25;
          }
          id v29 = objc_msgSend(v28, sel_identifier);

          if (!v29) {
            goto LABEL_25;
          }
          sub_24D195E10();

          id v30 = objc_msgSend(v19, sel_process);
          if (v30) {
            break;
          }

          swift_bridgeObjectRelease();
LABEL_26:
          if (v16 == ++v17) {
            goto LABEL_32;
          }
        }
        uint64_t v31 = v30;
        unsigned int v57 = objc_msgSend(v30, sel_pid);

        id v32 = objc_allocWithZone(MEMORY[0x263F01878]);
        uint64_t v33 = (void *)sub_24D195DE0();
        swift_bridgeObjectRelease();
        *(void *)&long long v66 = 0;
        id v34 = objc_msgSend(v32, sel_initWithBundleIdentifier_allowPlaceholder_error_, v33, 0, &v66);

        if (v34)
        {
          id v35 = (id)v66;
          unsigned int v36 = objc_msgSend(v34, sel_developerType);

          if (v36 == 3)
          {
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v61 = sub_24D18A000(0, *((void *)v61 + 2) + 1, 1, v61);
            }
            unsigned int v37 = v57;
            unint64_t v39 = *((void *)v61 + 2);
            unint64_t v38 = *((void *)v61 + 3);
            if (v39 >= v38 >> 1) {
              uint64_t v61 = sub_24D18A000((char *)(v38 > 1), v39 + 1, 1, v61);
            }
            long long v40 = v61;
            *((void *)v61 + 2) = v39 + 1;
            *(_DWORD *)&v40[4 * v39 + 32] = v37;
          }
          goto LABEL_26;
        }
        id v41 = (id)v66;
        uint64_t v42 = (void *)sub_24D195B50();

        swift_willThrow();
LABEL_25:

        goto LABEL_26;
      }
    }
    uint64_t v61 = (char *)MEMORY[0x263F8EE78];
LABEL_32:

    swift_bridgeObjectRelease_n();
    id v5 = v60;
    uint64_t v46 = v61;
    uint64_t v49 = *((void *)v61 + 2);
    if (v49) {
      goto LABEL_33;
    }
LABEL_29:
    swift_bridgeObjectRelease();
    sub_24D195FD0();
    uint64_t v50 = (void *)sub_24D196090();
    sub_24D195CB0();

    return 0;
  }
  id v43 = (id)v66;
  unint64_t v44 = (void *)sub_24D195B50();

  swift_willThrow();
  sub_24D195FD0();
  uint64_t v45 = (void *)sub_24D196090();
  uint64_t v46 = (char *)MEMORY[0x263F8EE78];
  sub_24D195CB0();

  unsigned __int8 v65 = 1;
  uint64_t v47 = type metadata accessor for TargetType(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v47 - 8) + 56))(v2, 1, 1, v47);
  unsigned __int8 v64 = 9;
  *(void *)&long long v66 = 0;
  *((void *)&v66 + 1) = 0xE000000000000000;
  sub_24D196150();
  sub_24D195E80();
  v63 = v44;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985A068);
  sub_24D196190();
  long long v48 = v66;
  long long v66 = 0u;
  sub_24D18C314(&v65, (uint64_t)v2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, &v64, v48, *((uint64_t *)&v48 + 1));
  swift_bridgeObjectRelease();

  sub_24D1777B4((uint64_t)v2);
  uint64_t v49 = *((void *)v46 + 2);
  if (!v49) {
    goto LABEL_29;
  }
LABEL_33:
  sub_24D195FE0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269859FE8);
  uint64_t v52 = swift_allocObject();
  uint64_t v53 = MEMORY[0x263F8D6C8];
  *(_OWORD *)(v52 + 16) = v62;
  uint64_t v54 = MEMORY[0x263F8D750];
  *(void *)(v52 + 56) = v53;
  *(void *)(v52 + 64) = v54;
  *(void *)(v52 + 32) = v49;
  uint64_t v55 = (void *)sub_24D196090();
  sub_24D195CB0();
  swift_bridgeObjectRelease();

  *(void *)&long long v66 = v46;
  swift_bridgeObjectRetain();
  sub_24D176DF4();
  swift_bridgeObjectRelease();

  return v66;
}

unint64_t sub_24D177760()
{
  unint64_t result = qword_269859FF8;
  if (!qword_269859FF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269859FF8);
  }
  return result;
}

uint64_t sub_24D1777B4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A180);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24D177814()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24D177850(uint64_t a1)
{
  return sub_24D175AA4(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_24D177858(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AnalyzableTarget(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for MicrostackshotsCoordinator()
{
  return self;
}

uint64_t method lookup function for MicrostackshotsCoordinator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MicrostackshotsCoordinator);
}

uint64_t dispatch thunk of MicrostackshotsCoordinator.__allocating_init(interruptCallback:)()
{
  return (*(uint64_t (**)(void))(v0 + 208))();
}

uint64_t dispatch thunk of MicrostackshotsCoordinator.__allocating_init(interruptCallback:sendEvents:printTostdout:)()
{
  return (*(uint64_t (**)(void))(v0 + 216))();
}

uint64_t dispatch thunk of MicrostackshotsCoordinator.analyzeMicrostackshotsUntilEventsLimitSent()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of MicrostackshotsCoordinator.analyzeMicrostackshots(pid:randomizer:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

void type metadata accessor for URLResourceKey(uint64_t a1)
{
}

uint64_t sub_24D177974()
{
  return sub_24D1779DC(&qword_26985A010);
}

uint64_t sub_24D1779A8()
{
  return sub_24D1779DC(&qword_26985A018);
}

uint64_t sub_24D1779DC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for URLResourceKey(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24D177A20()
{
  return sub_24D1779DC(&qword_26985A020);
}

uint64_t sub_24D177A54(uint64_t a1)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24D177B0C(v4, v2);
  return a1;
}

uint64_t sub_24D177B0C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_24D177B90()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24D177BC8()
{
  return swift_bridgeObjectRetain();
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

uint64_t objectdestroy_4Tm()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24D177C2C(uint64_t a1)
{
  return sub_24D175FF0(a1);
}

uint64_t sub_24D177C34(uint64_t a1, unint64_t *a2)
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

uint64_t initializeBufferWithCopyOfBuffer for AppBundleParser(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy28_4(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 12) = *(_OWORD *)(a2 + 12);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_24D177CBC(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 28)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_24D177CDC(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(_DWORD *)(result + 24) = 0;
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
  *(unsigned char *)(result + 28) = v3;
  return result;
}

void type metadata accessor for mach_header(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_24D177D2C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_24D177D4C(uint64_t result, int a2, int a3)
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

void type metadata accessor for _CSTypeRef(uint64_t a1)
{
}

void sub_24D177D88(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t destroy for AppBundleParser()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for AppBundleParser(void *a1, void *a2)
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
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AppBundleParser(void *a1, void *a2)
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
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
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

void *assignWithTake for AppBundleParser(void *a1, void *a2)
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
  uint64_t v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppBundleParser(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 64)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AppBundleParser(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 64) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 64) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppBundleParser()
{
  return &type metadata for AppBundleParser;
}

uint64_t sub_24D178080(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24D195A70();
  uint64_t v46 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v45 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&long long v49 = a1;
  *((void *)&v49 + 1) = a2;
  uint64_t v51 = 47;
  unint64_t v52 = 0xE100000000000000;
  sub_24D1757BC();
  uint64_t v6 = sub_24D1960C0();
  unint64_t v7 = 0xE000000000000000;
  uint64_t v51 = 0;
  unint64_t v52 = 0xE000000000000000;
  uint64_t v8 = *(void *)(v6 + 16);
  uint64_t v47 = v4;
  if (v8)
  {
    id v9 = (unint64_t *)(v6 + 40);
    while (1)
    {
      uint64_t v10 = *(v9 - 1);
      unint64_t v7 = *v9;
      *(void *)&long long v49 = 47;
      *((void *)&v49 + 1) = 0xE100000000000000;
      swift_bridgeObjectRetain();
      sub_24D195E80();
      sub_24D195E80();
      swift_bridgeObjectRelease();
      if (sub_24D195F20()) {
        break;
      }
      v9 += 2;
      swift_bridgeObjectRelease();
      if (!--v8)
      {
        uint64_t v10 = 0;
        unint64_t v7 = 0xE000000000000000;
        break;
      }
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  swift_bridgeObjectRelease();
  if (!v10 && v7 == 0xE000000000000000 || (sub_24D196250() & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_37:
    uint64_t v35 = 0;
    unint64_t v36 = 0xE000000000000000;
    goto LABEL_38;
  }
  id v11 = objc_allocWithZone(MEMORY[0x263F086E0]);
  unint64_t v12 = (void *)sub_24D195DE0();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(v11, sel_initWithPath_, v12);

  if (!v13)
  {
    long long v49 = 0u;
    long long v50 = 0u;
    sub_24D1786A8((uint64_t)&v49);
LABEL_35:
    long long v49 = 0u;
    long long v50 = 0u;
LABEL_36:

    sub_24D1786A8((uint64_t)&v49);
    goto LABEL_37;
  }
  id v14 = objc_msgSend(v13, sel_infoDictionary);
  if (!v14) {
    goto LABEL_23;
  }
  id v15 = v14;
  uint64_t v16 = sub_24D195DA0();

  if (*(void *)(v16 + 16) && (unint64_t v17 = sub_24D183934(0xD000000000000013, 0x800000024D1980C0), (v18 & 1) != 0))
  {
    sub_24D178708(*(void *)(v16 + 56) + 32 * v17, (uint64_t)&v49);
  }
  else
  {
    long long v49 = 0u;
    long long v50 = 0u;
  }
  swift_bridgeObjectRelease();
  uint64_t v19 = *((void *)&v50 + 1);
  sub_24D1786A8((uint64_t)&v49);
  if (!v19) {
    goto LABEL_25;
  }
  id v20 = objc_msgSend(v13, sel_infoDictionary);
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = sub_24D195DA0();

    if (*(void *)(v22 + 16) && (unint64_t v23 = sub_24D183934(0xD000000000000013, 0x800000024D1980C0), (v24 & 1) != 0))
    {
      sub_24D178708(*(void *)(v22 + 56) + 32 * v23, (uint64_t)&v49);
    }
    else
    {
      long long v49 = 0u;
      long long v50 = 0u;
    }
    swift_bridgeObjectRelease();
    if (*((void *)&v50 + 1))
    {
      if (swift_dynamicCast()) {
        goto LABEL_47;
      }
      goto LABEL_25;
    }
  }
  else
  {
LABEL_23:
    long long v49 = 0u;
    long long v50 = 0u;
  }
  sub_24D1786A8((uint64_t)&v49);
LABEL_25:
  id v25 = objc_msgSend(v13, sel_infoDictionary);
  if (!v25) {
    goto LABEL_35;
  }
  id v26 = v25;
  uint64_t v27 = sub_24D195DA0();

  if (*(void *)(v27 + 16) && (unint64_t v28 = sub_24D183934(0x656C646E75424643, 0xEC000000656D614ELL), (v29 & 1) != 0))
  {
    sub_24D178708(*(void *)(v27 + 56) + 32 * v28, (uint64_t)&v49);
  }
  else
  {
    long long v49 = 0u;
    long long v50 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v50 + 1)) {
    goto LABEL_36;
  }
  sub_24D1786A8((uint64_t)&v49);
  id v30 = objc_msgSend(v13, sel_infoDictionary);
  if (!v30) {
    goto LABEL_35;
  }
  uint64_t v31 = v30;
  uint64_t v32 = sub_24D195DA0();

  if (*(void *)(v32 + 16) && (unint64_t v33 = sub_24D183934(0x656C646E75424643, 0xEC000000656D614ELL), (v34 & 1) != 0))
  {
    sub_24D178708(*(void *)(v32 + 56) + 32 * v33, (uint64_t)&v49);
  }
  else
  {
    long long v49 = 0u;
    long long v50 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v50 + 1)) {
    goto LABEL_36;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {

    goto LABEL_37;
  }
LABEL_47:
  long long v37 = v48;
  long long v49 = v48;
  unint64_t v38 = v45;
  sub_24D195A60();
  uint64_t v39 = sub_24D1960D0();
  unint64_t v41 = v40;
  (*(void (**)(char *, uint64_t))(v46 + 8))(v38, v47);
  swift_bridgeObjectRelease();
  uint64_t v42 = HIBYTE(v41) & 0xF;
  if ((v41 & 0x2000000000000000) == 0) {
    uint64_t v42 = v39 & 0xFFFFFFFFFFFFLL;
  }
  if (!v42)
  {
    swift_bridgeObjectRelease();

    goto LABEL_37;
  }
  long long v49 = v37;
  swift_bridgeObjectRetain();
  sub_24D195E80();
  swift_bridgeObjectRelease();

  unint64_t v36 = *((void *)&v49 + 1);
  uint64_t v35 = v49;
  if (!(void)v49)
  {
LABEL_38:
    if (v36 == 0xE000000000000000) {
      goto LABEL_39;
    }
  }
  if ((sub_24D196250() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return v35;
  }
LABEL_39:
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_24D1786A8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A090);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24D178708(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24D178764@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *(void *)&long long v43 = a1;
  *((void *)&v43 + 1) = a2;
  sub_24D1757BC();
  swift_bridgeObjectRetain_n();
  uint64_t v5 = sub_24D1960C0();
  uint64_t v45 = 0;
  unint64_t v46 = 0xE000000000000000;
  uint64_t v6 = *(void *)(v5 + 16);
  if (v6)
  {
    uint64_t v39 = a3;
    unint64_t v7 = (unint64_t *)(v5 + 40);
    while (1)
    {
      uint64_t v9 = *(v7 - 1);
      unint64_t v8 = *v7;
      *(void *)&long long v43 = 47;
      *((void *)&v43 + 1) = 0xE100000000000000;
      swift_bridgeObjectRetain();
      sub_24D195E80();
      sub_24D195E80();
      swift_bridgeObjectRelease();
      if (sub_24D195F20()) {
        break;
      }
      v7 += 2;
      swift_bridgeObjectRelease();
      if (!--v6)
      {
        swift_bridgeObjectRelease();
        uint64_t v9 = 0;
        unint64_t v8 = 0xE000000000000000;
        goto LABEL_8;
      }
    }
    swift_bridgeObjectRelease();
    sub_24D195FC0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269859FE8);
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_24D196C10;
    *(void *)(v11 + 56) = MEMORY[0x263F8D310];
    *(void *)(v11 + 64) = sub_24D177760();
    *(void *)(v11 + 32) = v9;
    *(void *)(v11 + 40) = v8;
    sub_24D178CF8();
    swift_bridgeObjectRetain();
    unint64_t v12 = (void *)sub_24D196090();
    sub_24D195CB0();
    swift_bridgeObjectRelease();

LABEL_8:
    a3 = v39;
    uint64_t v10 = a1;
    if (v9) {
      goto LABEL_11;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    unint64_t v8 = 0xE000000000000000;
    uint64_t v10 = a1;
  }
  if (v8 == 0xE000000000000000)
  {
    swift_bridgeObjectRelease();
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    goto LABEL_46;
  }
LABEL_11:
  char v17 = sub_24D196250();
  swift_bridgeObjectRelease();
  if (v17)
  {
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    goto LABEL_46;
  }
  id v18 = objc_allocWithZone(MEMORY[0x263F086E0]);
  uint64_t v19 = (void *)sub_24D195DE0();
  swift_bridgeObjectRelease();
  id v20 = objc_msgSend(v18, sel_initWithPath_, v19);

  if (!v20)
  {
    uint64_t v14 = 0;
    uint64_t v13 = 0;
LABEL_22:
    long long v43 = 0u;
    long long v44 = 0u;
    goto LABEL_23;
  }
  id v21 = objc_msgSend(v20, sel_bundleIdentifier);
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v13 = sub_24D195E10();
    uint64_t v14 = v23;
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v14 = 0;
  }
  id v24 = objc_msgSend(v20, sel_infoDictionary, v39);
  if (!v24) {
    goto LABEL_22;
  }
  id v25 = v24;
  uint64_t v26 = sub_24D195DA0();

  if (*(void *)(v26 + 16) && (unint64_t v27 = sub_24D183934(0xD00000000000001ALL, 0x800000024D1980E0), (v28 & 1) != 0))
  {
    sub_24D178708(*(void *)(v26 + 56) + 32 * v27, (uint64_t)&v43);
  }
  else
  {
    long long v43 = 0u;
    long long v44 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v44 + 1))
  {
    if (swift_dynamicCast())
    {
      uint64_t v15 = v41;
      uint64_t v16 = v42;

      goto LABEL_46;
    }
    swift_bridgeObjectRelease();
    goto LABEL_31;
  }
LABEL_23:
  sub_24D1786A8((uint64_t)&v43);
  swift_bridgeObjectRelease();
  if (!v20) {
    goto LABEL_44;
  }
LABEL_31:
  id v29 = objc_msgSend(v20, sel_infoDictionary, v39);
  if (!v29)
  {

LABEL_44:
    long long v43 = 0u;
    long long v44 = 0u;
LABEL_45:
    sub_24D1786A8((uint64_t)&v43);
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    goto LABEL_46;
  }
  id v30 = v29;
  uint64_t v31 = sub_24D195DA0();

  if (*(void *)(v31 + 16) && (unint64_t v32 = sub_24D183934(0x656C646E75424643, 0xEF6E6F6973726556), (v33 & 1) != 0))
  {
    sub_24D178708(*(void *)(v31 + 56) + 32 * v32, (uint64_t)&v43);
  }
  else
  {
    long long v43 = 0u;
    long long v44 = 0u;
  }

  swift_bridgeObjectRelease();
  if (!*((void *)&v44 + 1)) {
    goto LABEL_45;
  }
  int v34 = swift_dynamicCast();
  if (v34) {
    uint64_t v15 = v41;
  }
  else {
    uint64_t v15 = 0;
  }
  if (v34) {
    uint64_t v16 = v42;
  }
  else {
    uint64_t v16 = 0;
  }
LABEL_46:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v35 = sub_24D178080(v10, a2);
  uint64_t v37 = v36;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease_n();
  *a3 = v10;
  a3[1] = a2;
  a3[2] = v13;
  a3[3] = v14;
  a3[4] = v15;
  a3[5] = v16;
  a3[6] = v35;
  a3[7] = v37;
  return result;
}

unint64_t sub_24D178CF8()
{
  unint64_t result = qword_26985A0D0;
  if (!qword_26985A0D0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26985A0D0);
  }
  return result;
}

uint64_t sub_24D178D38(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_24D178D4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 16))();
}

uint64_t sub_24D178D60(uint64_t a1, char a2, uint64_t a3, uint64_t a4, double a5)
{
  *(_OWORD *)(v5 + 40) = xmmword_24D196EE0;
  *(_OWORD *)(v5 + 56) = 0u;
  *(_OWORD *)(v5 + 72) = 0u;
  *(_OWORD *)(v5 + 88) = 0u;
  *(void *)(v5 + 104) = 0;
  uint64_t v11 = v5 + OBJC_IVAR____TtC18EcosystemAnalytics21MicrostackshotsParser_startTime;
  sub_24D195C60();
  uint64_t v12 = OBJC_IVAR____TtC18EcosystemAnalytics21MicrostackshotsParser_interval;
  *(void *)(v5 + OBJC_IVAR____TtC18EcosystemAnalytics21MicrostackshotsParser_interval) = 0;
  uint64_t v13 = OBJC_IVAR____TtC18EcosystemAnalytics21MicrostackshotsParser_thirdPartyOnly;
  *(unsigned char *)(v5 + OBJC_IVAR____TtC18EcosystemAnalytics21MicrostackshotsParser_thirdPartyOnly) = 2;
  *(_DWORD *)(v5 + 16) = -1;
  *(void *)(v5 + 24) = a3;
  *(void *)(v5 + 32) = a4;
  swift_beginAccess();
  uint64_t v14 = sub_24D195C70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v11, a1, v14);
  swift_endAccess();
  *(double *)(v5 + v12) = a5;
  *(unsigned char *)(v5 + v13) = a2;
  return v5;
}

uint64_t sub_24D178E78(uint64_t a1, uint64_t a2)
{
  sub_24D17B1A8();
  uint64_t v5 = *(void *)(v4 + 16);
  if (v5)
  {
    uint64_t v6 = (int *)(v4 + 32);
    do
    {
      int v7 = *v6++;
      unint64_t v8 = (void *)MEMORY[0x2533202C0]();
      id v9 = sub_24D17B84C(v7);
      sub_24D17CD84(v9);
      sub_24D17D498(v10);
      swift_bridgeObjectRelease();
      objc_msgSend(v9, sel_symbolicate);
      objc_msgSend(v9, sel_postprocess);
      sub_24D178F60(a1, a2, v9);

      --v5;
    }
    while (v5);
  }

  return swift_bridgeObjectRelease();
}

void sub_24D178F60(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v225 = a2;
  uint64_t v207 = a1;
  uint64_t v178 = sub_24D195CA0();
  uint64_t v4 = *(void *)(v178 - 8);
  MEMORY[0x270FA5388](v178);
  v177 = (char *)&v163 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_24D176738(MEMORY[0x263F8EE78]);
  v184 = (void *)(v6 + 16);
  if ((uint64_t)objc_msgSend(a3, sel_numSamples) < 1)
  {
    swift_release();
    return;
  }
  uint64_t v208 = v6;
  sub_24D195FC0();
  uint64_t v171 = __swift_instantiateConcreteTypeFromMangledName(&qword_269859FE8);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_24D196C10;
  id v8 = objc_msgSend(a3, sel_tasksByUniquePid);
  uint64_t v9 = sub_24D177C34(0, &qword_26985A140);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985A148);
  unint64_t v10 = sub_24D17D728();
  uint64_t v11 = sub_24D195DA0();

  uint64_t v12 = *(void *)(v11 + 16);
  swift_bridgeObjectRelease();
  uint64_t v13 = MEMORY[0x263F8D750];
  *(void *)(v7 + 56) = MEMORY[0x263F8D6C8];
  *(void *)(v7 + 64) = v13;
  *(void *)(v7 + 32) = v12;
  uint64_t v170 = sub_24D177C34(0, (unint64_t *)&qword_26985A0D0);
  uint64_t v14 = (void *)sub_24D196090();
  sub_24D195CB0();
  swift_bridgeObjectRelease();

  id v15 = objc_msgSend(a3, sel_tasksByUniquePid);
  uint64_t v191 = v9;
  unint64_t v182 = v10;
  uint64_t v16 = sub_24D195DA0();

  int64_t v17 = 0;
  uint64_t v18 = *(void *)(v16 + 64);
  uint64_t v164 = v16 + 64;
  uint64_t v19 = 1 << *(unsigned char *)(v16 + 32);
  if (v19 < 64) {
    uint64_t v20 = ~(-1 << v19);
  }
  else {
    uint64_t v20 = -1;
  }
  unint64_t v21 = v20 & v18;
  int64_t v165 = (unint64_t)(v19 + 63) >> 6;
  v181 = v232;
  uint64_t v174 = v16;
  v175 = (void (**)(char *, uint64_t))(v4 + 8);
  v206 = v229;
  long long v180 = xmmword_24D196EF0;
  uint64_t v188 = MEMORY[0x263F8EE50] + 8;
  long long v169 = xmmword_24D196C20;
  unint64_t v168 = 0x800000024D1984E0;
  v163 = "unknown main binary";
  if (!v21) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v22 = __clz(__rbit64(v21));
  uint64_t v23 = (v21 - 1) & v21;
  for (unint64_t i = v22 | (v17 << 6); ; unint64_t i = __clz(__rbit64(v26)) + (v17 << 6))
  {
    unint64_t v172 = v23;
    int64_t v173 = v17;
    unint64_t v28 = *(void *)(*(void *)(v174 + 56) + 8 * i);
    unint64_t v179 = v28;
    if (v28 >> 62) {
      break;
    }
    uint64_t v29 = *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v29) {
      goto LABEL_25;
    }
LABEL_124:
    swift_bridgeObjectRelease();
    unint64_t v21 = v172;
    int64_t v17 = v173;
    if (v172) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v25 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      goto LABEL_137;
    }
    if (v25 >= v165)
    {
LABEL_133:
      swift_release();
      swift_release();
      return;
    }
    unint64_t v26 = *(void *)(v164 + 8 * v25);
    ++v17;
    if (!v26)
    {
      int64_t v17 = v25 + 1;
      if (v25 + 1 >= v165) {
        goto LABEL_133;
      }
      unint64_t v26 = *(void *)(v164 + 8 * v17);
      if (!v26)
      {
        int64_t v17 = v25 + 2;
        if (v25 + 2 >= v165) {
          goto LABEL_133;
        }
        unint64_t v26 = *(void *)(v164 + 8 * v17);
        if (!v26)
        {
          int64_t v17 = v25 + 3;
          if (v25 + 3 >= v165) {
            goto LABEL_133;
          }
          unint64_t v26 = *(void *)(v164 + 8 * v17);
          if (!v26)
          {
            int64_t v27 = v25 + 4;
            if (v27 >= v165) {
              goto LABEL_133;
            }
            unint64_t v26 = *(void *)(v164 + 8 * v27);
            if (!v26)
            {
              while (1)
              {
                int64_t v17 = v27 + 1;
                if (__OFADD__(v27, 1)) {
                  goto LABEL_138;
                }
                if (v17 >= v165) {
                  goto LABEL_133;
                }
                unint64_t v26 = *(void *)(v164 + 8 * v17);
                ++v27;
                if (v26) {
                  goto LABEL_22;
                }
              }
            }
            int64_t v17 = v27;
          }
        }
      }
    }
LABEL_22:
    uint64_t v23 = (v26 - 1) & v26;
  }
  swift_bridgeObjectRetain_n();
  unint64_t v28 = v179;
  uint64_t v29 = sub_24D1961D0();
  swift_bridgeObjectRelease();
  if (!v29) {
    goto LABEL_124;
  }
LABEL_25:
  unint64_t v30 = 0;
  unint64_t v183 = v28 & 0xC000000000000001;
  unint64_t v166 = v28 + 32;
  uint64_t v167 = v28 & 0xFFFFFFFFFFFFFF8;
  uint64_t v176 = v29;
  while (2)
  {
    if (v183)
    {
      id v32 = (id)MEMORY[0x25331FFF0](v30, v28);
    }
    else
    {
      if (v30 >= *(void *)(v167 + 16)) {
        goto LABEL_136;
      }
      id v32 = *(id *)(v166 + 8 * v30);
    }
    char v33 = v32;
    BOOL v34 = __OFADD__(v30, 1);
    unint64_t v35 = v30 + 1;
    if (v34) {
      goto LABEL_135;
    }
    id v36 = objc_msgSend(v32, sel_bundleIdentifier);
    if (v36)
    {

      id v37 = objc_msgSend(v33, sel_bundleIdentifier);
      if (!v37) {
        goto LABEL_139;
      }
      unint64_t v38 = v37;
      uint64_t v39 = sub_24D195E10();
      unint64_t v41 = v40;

      swift_bridgeObjectRelease();
      uint64_t v42 = HIBYTE(v41) & 0xF;
      if ((v41 & 0x2000000000000000) == 0) {
        uint64_t v42 = v39 & 0xFFFFFFFFFFFFLL;
      }
      if (v42)
      {
        unint64_t v43 = v35;
        sub_24D195FC0();
        uint64_t v44 = swift_allocObject();
        *(_OWORD *)(v44 + 16) = v169;
        id v45 = objc_msgSend(v33, sel_mainBinaryPath);
        if (v45)
        {
          unint64_t v46 = v45;
          uint64_t v47 = sub_24D195E10();
          unint64_t v49 = v48;
        }
        else
        {
          uint64_t v47 = 0;
          unint64_t v49 = 0;
        }
        uint64_t v50 = MEMORY[0x263F8D310];
        *(void *)(v44 + 56) = MEMORY[0x263F8D310];
        unint64_t v51 = sub_24D177760();
        *(void *)(v44 + 64) = v51;
        unint64_t v52 = 0xD000000000000013;
        if (v49) {
          unint64_t v52 = v47;
        }
        unint64_t v53 = v168;
        if (v49) {
          unint64_t v53 = v49;
        }
        *(void *)(v44 + 32) = v52;
        *(void *)(v44 + 40) = v53;
        id v54 = objc_msgSend(v33, sel_bundleIdentifier, v163);
        if (v54)
        {
          uint64_t v55 = v54;
          uint64_t v56 = sub_24D195E10();
          unint64_t v58 = v57;

          uint64_t v59 = (uint64_t *)(v44 + 72);
          *(void *)(v44 + 96) = v50;
          *(void *)(v44 + 104) = v51;
          if (v58)
          {
            *uint64_t v59 = v56;
            unint64_t v35 = v43;
            goto LABEL_49;
          }
        }
        else
        {
          uint64_t v59 = (uint64_t *)(v44 + 72);
          *(void *)(v44 + 96) = v50;
          *(void *)(v44 + 104) = v51;
        }
        unint64_t v35 = v43;
        *uint64_t v59 = 0xD000000000000019;
        unint64_t v58 = (unint64_t)v163 | 0x8000000000000000;
LABEL_49:
        *(void *)(v44 + 80) = v58;
        id v60 = (void *)sub_24D196090();
        sub_24D195CB0();
        swift_bridgeObjectRelease();
      }
    }
    unint64_t v61 = v33;
    id v62 = objc_msgSend((id)v61, sel_mainBinaryPath);
    if (!v62) {
      goto LABEL_132;
    }
    v63 = v62;
    uint64_t v216 = sub_24D195E10();
    uint64_t v217 = v64;

    id v65 = objc_msgSend((id)v61, sel_bundleIdentifier);
    if (v65)
    {
      long long v66 = v65;
      uint64_t v211 = sub_24D195E10();
      uint64_t v214 = v67;
    }
    else
    {
      uint64_t v211 = 0;
      uint64_t v214 = 0;
    }
    id v68 = objc_msgSend((id)v61, sel_bundleShortVersion, v163);
    id v215 = (id)v61;
    if (v68)
    {
      v69 = v68;
      uint64_t v210 = sub_24D195E10();
      uint64_t v71 = v70;
    }
    else
    {
      uint64_t v210 = 0;
      uint64_t v71 = 0;
    }
    swift_bridgeObjectRetain_n();
    uint64_t v72 = v217;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v73 = v216;
    uint64_t v209 = sub_24D178080(v216, v72);
    uint64_t v212 = v74;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v213 = v71;
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    type metadata accessor for MachOParser();
    uint64_t v75 = (void *)swift_allocObject();
    swift_bridgeObjectRetain();
    uint64_t v76 = MEMORY[0x263F8EE78];
    v75[6] = sub_24D176544(MEMORY[0x263F8EE78]);
    v75[7] = v76;
    v75[2] = v73;
    v75[3] = v72;
    v75[4] = sub_24D17A1B0;
    v75[5] = 0;
    swift_bridgeObjectRetain();
    uint64_t v77 = (void *)sub_24D195DE0();
    swift_bridgeObjectRelease();
    v232[2] = sub_24D17D7C8;
    v232[3] = v75;
    *(void *)&long long v231 = MEMORY[0x263EF8330];
    *((void *)&v231 + 1) = 1107296256;
    v232[0] = sub_24D17E354;
    v232[1] = &block_descriptor_48;
    long long v78 = _Block_copy(&v231);
    v187 = v75;
    swift_retain();
    swift_release();
    nm_macho_for_each_slice(v77, v78);
    _Block_release(v78);

    id v79 = objc_msgSend(v215, sel_mainBinary);
    unint64_t v186 = v35;
    if (v79)
    {
      uint64_t v80 = v79;
      id v81 = objc_msgSend(v79, sel_uuid);

      unsigned __int8 v82 = v177;
      sub_24D195C90();

      uint64_t v83 = sub_24D195C80();
      uint64_t v227 = v84;
      (*v175)(v82, v178);
    }
    else
    {
      uint64_t v83 = 0;
      uint64_t v227 = 0xE000000000000000;
    }
    uint64_t v85 = v216;
    char v86 = sub_24D18633C();
    uint64_t v87 = sub_24D1957E4(v85);
    uint64_t v89 = v88;
    swift_bridgeObjectRetain();
    v90 = (void *)sub_24D195DE0();
    swift_bridgeObjectRelease();
    id v91 = nm_extractTeamID(v90);

    if (v91)
    {
      uint64_t v92 = sub_24D195E10();
      unint64_t v94 = v93;
    }
    else
    {
      uint64_t v92 = 0;
      unint64_t v94 = 0xE000000000000000;
    }
    swift_bridgeObjectRetain();
    v95 = (void *)sub_24D195DE0();
    swift_bridgeObjectRelease();
    id v96 = nm_extractCDHash(v95);

    if (v96)
    {
      uint64_t v97 = sub_24D195E10();
      unint64_t v99 = v98;
    }
    else
    {
      uint64_t v97 = 0;
      unint64_t v99 = 0xE000000000000000;
    }
    uint64_t v100 = sub_24D17E648();
    v233[0] = v83;
    v233[1] = v227;
    if (v101) {
      uint64_t v102 = v100;
    }
    else {
      uint64_t v102 = 0;
    }
    unint64_t v103 = 0xE000000000000000;
    if (v101) {
      unint64_t v103 = v101;
    }
    char v234 = v86;
    uint64_t v235 = v87;
    uint64_t v236 = v89;
    uint64_t v237 = v92;
    unint64_t v238 = v94;
    uint64_t v239 = v97;
    unint64_t v240 = v99;
    uint64_t v241 = v102;
    unint64_t v242 = v103;
    long long v243 = v180;
    v104 = v184;
    swift_beginAccess();
    uint64_t v105 = v217;
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v228[0] = *v104;
    void *v104 = 0x8000000000000000;
    sub_24D184AC0((uint64_t)v233, v216, v105, isUniquelyReferenced_nonNull_native);
    void *v104 = v228[0];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    id v107 = objc_msgSend(v215, sel_threads);
    uint64_t v189 = sub_24D177C34(0, &qword_26985A160);
    unint64_t v108 = sub_24D195DA0();

    if ((v108 & 0xC000000000000001) != 0)
    {
      uint64_t v109 = sub_24D1961A0();
      unint64_t v193 = 0;
      uint64_t v110 = 0;
      unint64_t v111 = 0;
      unint64_t v108 = v109 | 0x8000000000000000;
    }
    else
    {
      uint64_t v112 = -1 << *(unsigned char *)(v108 + 32);
      uint64_t v113 = *(void *)(v108 + 64);
      unint64_t v193 = v108 + 64;
      uint64_t v114 = ~v112;
      uint64_t v115 = -v112;
      if (v115 < 64) {
        uint64_t v116 = ~(-1 << v115);
      }
      else {
        uint64_t v116 = -1;
      }
      unint64_t v111 = v116 & v113;
      uint64_t v110 = v114;
    }
    uint64_t v117 = 0;
    uint64_t v190 = v108 & 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v185 = v110;
    int64_t v192 = (unint64_t)(v110 + 64) >> 6;
    unint64_t v194 = v108;
LABEL_79:
    if ((v108 & 0x8000000000000000) != 0)
    {
      uint64_t v120 = sub_24D1961B0();
      if (!v120) {
        goto LABEL_26;
      }
      uint64_t v122 = v121;
      v228[0] = v120;
      swift_unknownObjectRetain();
      swift_dynamicCast();
      id v123 = (id)v231;
      swift_unknownObjectRelease();
      v228[0] = v122;
      swift_unknownObjectRetain();
      swift_dynamicCast();
      v124 = (void *)v231;
      swift_unknownObjectRelease();
      id v125 = v124;
      uint64_t v119 = v117;
      uint64_t v198 = v111;
      if (!v123)
      {
LABEL_26:
        sub_24D17D7D0();
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        id v31 = v215;

        unint64_t v30 = v186;
        unint64_t v28 = v179;
        if (v186 == v176) {
          goto LABEL_124;
        }
        continue;
      }
    }
    else
    {
      if (v111)
      {
        uint64_t v198 = (v111 - 1) & v111;
        unint64_t v118 = __clz(__rbit64(v111)) | (v117 << 6);
        uint64_t v119 = v117;
      }
      else
      {
        int64_t v126 = v117 + 1;
        if (__OFADD__(v117, 1))
        {
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
          return;
        }
        if (v126 >= v192) {
          goto LABEL_26;
        }
        unint64_t v127 = *(void *)(v193 + 8 * v126);
        uint64_t v128 = v117 + 1;
        if (!v127)
        {
          uint64_t v128 = v117 + 2;
          if (v117 + 2 >= v192) {
            goto LABEL_26;
          }
          unint64_t v127 = *(void *)(v193 + 8 * v128);
          if (!v127)
          {
            uint64_t v128 = v117 + 3;
            if (v117 + 3 >= v192) {
              goto LABEL_26;
            }
            unint64_t v127 = *(void *)(v193 + 8 * v128);
            if (!v127)
            {
              uint64_t v128 = v117 + 4;
              if (v117 + 4 >= v192) {
                goto LABEL_26;
              }
              unint64_t v127 = *(void *)(v193 + 8 * v128);
              if (!v127)
              {
                uint64_t v129 = v117 + 5;
                do
                {
                  if (v192 == v129) {
                    goto LABEL_26;
                  }
                  unint64_t v127 = *(void *)(v193 + 8 * v129++);
                }
                while (!v127);
                uint64_t v128 = v129 - 1;
                unint64_t v108 = v194;
              }
            }
          }
        }
        uint64_t v198 = (v127 - 1) & v127;
        uint64_t v119 = v128;
        unint64_t v118 = __clz(__rbit64(v127)) + (v128 << 6);
      }
      uint64_t v130 = 8 * v118;
      v131 = *(void **)(*(void *)(v108 + 56) + v130);
      id v123 = *(id *)(*(void *)(v108 + 48) + v130);
      id v125 = v131;
      if (!v123) {
        goto LABEL_26;
      }
    }
    break;
  }
  id v196 = v123;
  uint64_t v197 = v119;
  id v195 = v125;
  id v132 = objc_msgSend(v125, sel_threadStates);
  sub_24D177C34(0, &qword_26985A168);
  unint64_t v61 = sub_24D195F60();

  if (!(v61 >> 62))
  {
    uint64_t v133 = *(void *)((v61 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v133) {
      goto LABEL_102;
    }
    goto LABEL_78;
  }
  swift_bridgeObjectRetain();
  uint64_t v133 = sub_24D1961D0();
  swift_bridgeObjectRelease();
  if (!v133)
  {
LABEL_78:

    swift_bridgeObjectRelease();
    uint64_t v117 = v197;
    unint64_t v111 = v198;
    unint64_t v108 = v194;
    goto LABEL_79;
  }
LABEL_102:
  v134.n128_f64[0] = sub_24D17D7D8(&v231);
  unint64_t v135 = 0;
  unint64_t v202 = v61;
  unint64_t v203 = v61 & 0xC000000000000001;
  unint64_t v199 = v61 + 32;
  uint64_t v200 = v61 & 0xFFFFFFFFFFFFFF8;
  uint64_t v201 = v133;
  while (2)
  {
    if (v203)
    {
      id v136 = (id)MEMORY[0x25331FFF0](v135, v61, v134);
    }
    else
    {
      if (v135 >= *(void *)(v200 + 16)) {
        goto LABEL_131;
      }
      id v136 = *(id *)(v199 + 8 * v135);
    }
    unint64_t v61 = (unint64_t)v136;
    BOOL v34 = __OFADD__(v135, 1);
    unint64_t v137 = v135 + 1;
    if (!v34)
    {
      uint64_t v220 = swift_allocObject();
      sub_24D17D91C((uint64_t)&v231, v220 + 16);
      uint64_t v227 = swift_allocObject();
      *(void *)(v227 + 16) = 0;
      id v138 = objc_msgSend((id)v61, sel_stack);
      sub_24D177C34(0, &qword_26985A178);
      unint64_t v139 = sub_24D195F60();

      id v204 = (id)v61;
      unint64_t v205 = v137;
      if (v139 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v140 = sub_24D1961D0();
        swift_bridgeObjectRelease();
        if (v140)
        {
LABEL_111:
          if (v140 < 1) {
            goto LABEL_130;
          }
          uint64_t v141 = 0;
          unint64_t v221 = v139 & 0xC000000000000001;
          uint64_t v218 = v140;
          unint64_t v219 = v139;
          do
          {
            if (v221) {
              id v142 = (id)MEMORY[0x25331FFF0](v141, v139);
            }
            else {
              id v142 = *(id *)(v139 + 8 * v141 + 32);
            }
            v143 = v142;
            id v144 = objc_msgSend(v142, sel_instruction);
            if (v144)
            {
              id v224 = v144;
              v145 = (void *)swift_allocObject();
              uint64_t v146 = v216;
              uint64_t v147 = v217;
              v145[2] = v143;
              v145[3] = v146;
              v145[4] = v147;
              v145[5] = v146;
              uint64_t v148 = v211;
              uint64_t v149 = v212;
              v145[6] = v147;
              v145[7] = v148;
              uint64_t v150 = v213;
              uint64_t v151 = v210;
              v145[8] = v214;
              v145[9] = v151;
              uint64_t v153 = v208;
              uint64_t v152 = v209;
              v145[10] = v150;
              v145[11] = v152;
              v145[12] = v149;
              v145[13] = v153;
              id v154 = v215;
              uint64_t v155 = v220;
              v145[14] = v215;
              v145[15] = v155;
              uint64_t v156 = v225;
              v145[16] = v207;
              v145[17] = v156;
              uint64_t v157 = v226;
              v145[18] = v227;
              v145[19] = v157;
              v229[2] = sub_24D17DA14;
              v230 = v145;
              v228[0] = MEMORY[0x263EF8330];
              v228[1] = 1107296256;
              v229[0] = sub_24D17B114;
              v229[1] = &block_descriptor_58;
              v158 = _Block_copy(v228);
              v222 = v230;
              v223 = v158;
              id v159 = v154;
              swift_bridgeObjectRetain_n();
              uint64_t v140 = v218;
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              unint64_t v139 = v219;
              swift_bridgeObjectRetain();
              id v160 = v143;
              swift_retain();
              swift_retain();
              swift_retain();
              swift_retain();
              swift_retain();
              swift_release();
              v162 = v223;
              id v161 = v224;
              objc_msgSend(v224, sel_enumerateSymbols_, v223);

              _Block_release(v162);
              v143 = v161;
            }
            ++v141;
          }
          while (v140 != v141);
        }
      }
      else
      {
        uint64_t v140 = *(void *)((v139 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v140) {
          goto LABEL_111;
        }
      }

      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      unint64_t v61 = v202;
      unint64_t v135 = v205;
      if (v205 == v201) {
        goto LABEL_78;
      }
      continue;
    }
    break;
  }
  __break(1u);
LABEL_130:
  __break(1u);
LABEL_131:
  __break(1u);
LABEL_132:
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

uint64_t sub_24D17A1B0()
{
  return 0;
}

uint64_t sub_24D17A1B8(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, unint64_t a10, void (*a11)(id *, uint64_t), uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v180 = a5;
  uint64_t v181 = a6;
  id v179 = a1;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A180);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v19 = (char *)&v138 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_24D195CA0();
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v23 = (char *)&v138 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v24 = objc_msgSend(a4, sel_instruction);
  if (!v24) {
    goto LABEL_10;
  }
  int64_t v25 = v24;
  id v26 = objc_msgSend(v24, sel_binary);

  if (!v26) {
    goto LABEL_10;
  }
  id v27 = objc_msgSend(v26, sel_path);

  if (!v27) {
    goto LABEL_10;
  }
  uint64_t v177 = sub_24D195E10();
  uint64_t v178 = v28;

  id v29 = objc_msgSend(a4, sel_instruction);
  if (!v29
    || (unint64_t v30 = v29, v31 = objc_msgSend(v29, sel_binary), v30, !v31))
  {
    swift_bridgeObjectRelease();
LABEL_10:
    v230[0] = 1;
    uint64_t v38 = type metadata accessor for TargetType(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v19, 1, 1, v38);
    uint64_t v39 = sub_24D1957E4(v180);
    uint64_t v40 = *(void *)(a7 + 48);
    unint64_t v41 = *(void *)(a7 + 56);
    long long v42 = *(_OWORD *)(a7 + 16);
    unint64_t v43 = *(void *)(a7 + 32);
    unint64_t v44 = *(void *)(a7 + 40);
    LOBYTE(v229[0]) = 2;
    unint64_t v232 = 0;
    id v231 = 0;
    sub_24D18C314(v230, (uint64_t)v19, 0, 1, v39, v45, v40, v41, v42, *((unint64_t *)&v42 + 1), v43, v44, (unsigned __int8 *)v229, 0xD00000000000001FLL, 0x800000024D198620);
LABEL_11:
    swift_bridgeObjectRelease();
    return sub_24D1777B4((uint64_t)v19);
  }
  id v32 = (uint64_t *)(a8 + 16);
  id v33 = objc_msgSend(v31, sel_uuid);

  sub_24D195C90();
  uint64_t v175 = sub_24D195C80();
  uint64_t v176 = v34;
  (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
  swift_beginAccess();
  uint64_t v35 = v178;
  if (*(void *)(*v32 + 16)
    && (swift_bridgeObjectRetain(), sub_24D183934(v177, v35), char v37 = v36, swift_bridgeObjectRelease(), (v37 & 1) != 0))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v174 = v32;
    type metadata accessor for MachOParser();
    uint64_t v47 = (void *)swift_allocObject();
    swift_bridgeObjectRetain();
    uint64_t v48 = MEMORY[0x263F8EE78];
    v47[6] = sub_24D176544(MEMORY[0x263F8EE78]);
    v47[7] = v48;
    uint64_t v49 = v177;
    v47[2] = v177;
    v47[3] = v35;
    v47[4] = sub_24D17A1B0;
    v47[5] = 0;
    swift_bridgeObjectRetain();
    uint64_t v50 = (void *)sub_24D195DE0();
    swift_bridgeObjectRelease();
    uint64_t v235 = sub_24D17D7C8;
    uint64_t v236 = v47;
    id v231 = (id)MEMORY[0x263EF8330];
    unint64_t v232 = 1107296256;
    v233 = sub_24D17E354;
    char v234 = &block_descriptor_62;
    unint64_t v51 = _Block_copy(&v231);
    swift_retain();
    swift_release();
    nm_macho_for_each_slice(v50, v51);
    _Block_release(v51);

    int v173 = sub_24D18633C();
    uint64_t v52 = sub_24D1957E4(v49);
    uint64_t v54 = v53;
    swift_bridgeObjectRetain();
    uint64_t v55 = (void *)sub_24D195DE0();
    swift_bridgeObjectRelease();
    id v56 = nm_extractTeamID(v55);

    uint64_t v171 = v54;
    uint64_t v172 = v52;
    if (v56)
    {
      uint64_t v57 = sub_24D195E10();
      unint64_t v169 = v58;
      uint64_t v170 = v57;
    }
    else
    {
      unint64_t v169 = 0xE000000000000000;
      uint64_t v170 = 0;
    }
    swift_bridgeObjectRetain();
    uint64_t v59 = (void *)sub_24D195DE0();
    swift_bridgeObjectRelease();
    id v60 = nm_extractCDHash(v59);

    id v32 = v174;
    if (v60)
    {
      uint64_t v61 = sub_24D195E10();
      unint64_t v63 = v62;
    }
    else
    {
      uint64_t v61 = 0;
      unint64_t v63 = 0xE000000000000000;
    }
    uint64_t v64 = sub_24D17E648();
    if (v65) {
      uint64_t v66 = v64;
    }
    else {
      uint64_t v66 = 0;
    }
    if (v65) {
      unint64_t v67 = v65;
    }
    else {
      unint64_t v67 = 0xE000000000000000;
    }
    v278[0] = v175;
    v278[1] = v176;
    char v279 = v173;
    uint64_t v280 = v172;
    uint64_t v281 = v171;
    uint64_t v282 = v170;
    unint64_t v283 = v169;
    uint64_t v284 = v61;
    unint64_t v285 = v63;
    uint64_t v286 = v66;
    unint64_t v287 = v67;
    long long v288 = xmmword_24D196EF0;
    swift_beginAccess();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v229[0] = *v32;
    uint64_t *v32 = 0x8000000000000000;
    uint64_t v35 = v178;
    sub_24D182860((uint64_t)v278, v177, v178, isUniquelyReferenced_nonNull_native, (uint64_t)&v231);
    uint64_t *v32 = v229[0];
    swift_bridgeObjectRelease();
    swift_endAccess();
    swift_release();
    sub_24D17DA54((uint64_t)v231, v232);
  }
  uint64_t v69 = v181;
  swift_beginAccess();
  if (!*(void *)(*v32 + 16)) {
    goto LABEL_38;
  }
  swift_bridgeObjectRetain();
  sub_24D183934(v180, v69);
  char v71 = v70;
  swift_endAccess();
  if ((v71 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_beginAccess();
  if (!*(void *)(*v32 + 16)) {
    goto LABEL_38;
  }
  swift_bridgeObjectRetain();
  sub_24D183934(v177, v35);
  if ((v72 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_38:
    swift_endAccess();
    return swift_bridgeObjectRelease();
  }
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v73 = *v32;
  if (!*(void *)(*v32 + 16))
  {
LABEL_59:
    swift_endAccess();
    __break(1u);
    goto LABEL_60;
  }
  swift_bridgeObjectRetain();
  unint64_t v74 = sub_24D183934(v180, v69);
  if ((v75 & 1) == 0)
  {
LABEL_58:
    swift_bridgeObjectRelease();
    goto LABEL_59;
  }
  uint64_t v76 = *(void *)(v73 + 56) + 104 * v74;
  uint64_t v77 = *(uint64_t **)v76;
  uint64_t v78 = *(void *)(v76 + 8);
  int v173 = *(unsigned __int8 *)(v76 + 16);
  uint64_t v79 = *(void *)(v76 + 32);
  uint64_t v172 = *(void *)(v76 + 24);
  uint64_t v80 = *(void *)(v76 + 40);
  uint64_t v178 = *(void *)(v76 + 48);
  unint64_t v169 = *(void *)(v76 + 56);
  uint64_t v170 = v80;
  uint64_t v176 = *(void *)(v76 + 64);
  uint64_t v81 = *(void *)(v76 + 72);
  uint64_t v82 = *(void *)(v76 + 80);
  uint64_t v174 = v77;
  uint64_t v175 = v82;
  uint64_t v83 = *(void *)(v76 + 96);
  uint64_t v167 = *(void *)(v76 + 88);
  uint64_t v168 = v81;
  swift_endAccess();
  uint64_t v166 = v83;
  swift_bridgeObjectRetain();
  uint64_t v165 = v78;
  swift_bridgeObjectRetain();
  uint64_t v171 = v79;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v84 = *v32;
  if (!*(void *)(*v32 + 16))
  {
LABEL_61:
    swift_endAccess();
    uint64_t result = swift_bridgeObjectRelease();
    __break(1u);
    return result;
  }
  swift_bridgeObjectRetain();
  unint64_t v85 = sub_24D183934(v177, v35);
  if ((v86 & 1) == 0)
  {
LABEL_60:
    swift_bridgeObjectRelease();
    goto LABEL_61;
  }
  unint64_t v147 = a10;
  id v146 = a9;
  uint64_t v87 = *(void *)(v84 + 56) + 104 * v85;
  uint64_t v88 = *(void *)(v87 + 8);
  uint64_t v164 = *(void *)v87;
  int v163 = *(unsigned __int8 *)(v87 + 16);
  uint64_t v89 = *(void *)(v87 + 32);
  uint64_t v162 = *(void *)(v87 + 24);
  uint64_t v90 = *(void *)(v87 + 48);
  uint64_t v160 = *(void *)(v87 + 40);
  uint64_t v91 = *(void *)(v87 + 64);
  uint64_t v158 = *(void *)(v87 + 56);
  uint64_t v92 = *(void *)(v87 + 72);
  uint64_t v177 = *(void *)(v87 + 80);
  uint64_t v93 = *(void *)(v87 + 96);
  uint64_t v155 = *(void *)(v87 + 88);
  uint64_t v156 = v92;
  swift_endAccess();
  uint64_t v154 = v93;
  swift_bridgeObjectRetain();
  uint64_t v152 = v88;
  swift_bridgeObjectRetain();
  uint64_t v161 = v89;
  swift_bridgeObjectRetain();
  uint64_t v159 = v90;
  swift_bridgeObjectRetain();
  uint64_t v157 = v91;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease_n();
  id v94 = v179;
  id v95 = objc_msgSend(v179, sel_name);
  if (v95)
  {
    id v96 = v95;
    id v150 = (id)sub_24D195E10();
    unint64_t v153 = v97;
  }
  else
  {
    id v150 = 0;
    unint64_t v153 = 0xE000000000000000;
  }
  unint64_t v98 = (void *)v147;
  id v231 = objc_msgSend(v94, sel_offsetIntoSegment);
  id v179 = (id)sub_24D196240();
  uint64_t v151 = v99;
  id v100 = objc_msgSend(a4, sel_instruction);
  if (v100
    && (unint64_t v101 = v100, v102 = objc_msgSend(v100, sel_binary), v101, v102)
    && (id v103 = objc_msgSend(v102, sel_path), v102, v103))
  {
    uint64_t v104 = sub_24D195E10();

    uint64_t v105 = sub_24D1957E4(v104);
    unint64_t v149 = v106;
    id v107 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v105;
    swift_bridgeObjectRelease();
  }
  else
  {
    id v107 = 0;
    unint64_t v149 = 0xE000000000000000;
  }
  id v108 = objc_msgSend(v146, sel_architectureString);
  if (v108)
  {
    uint64_t v109 = v108;
    uint64_t v110 = (void *)sub_24D195E10();
    unint64_t v145 = v111;
    id v146 = v110;
  }
  else
  {
    unint64_t v145 = 0xE000000000000000;
    id v146 = 0;
  }
  swift_beginAccess();
  sub_24D17D91C((uint64_t)(v98 + 2), (uint64_t)v229);
  sub_24D17D91C((uint64_t)v229, (uint64_t)v230);
  int v112 = sub_24D17DAD8((uint64_t)v230);
  uint64_t v141 = a12;
  if (v112 == 1)
  {
    unint64_t v142 = 0xE000000000000000;
    uint64_t v143 = 0;
  }
  else
  {
    uint64_t v113 = v98[24];
    unint64_t v142 = v98[25];
    uint64_t v143 = v113;
    swift_bridgeObjectRetain();
  }
  swift_beginAccess();
  sub_24D17D91C((uint64_t)(v98 + 2), (uint64_t)v227);
  sub_24D17D91C((uint64_t)v227, (uint64_t)v228);
  int v114 = sub_24D17DAD8((uint64_t)v228);
  uint64_t v148 = v98 + 2;
  id v144 = (void *)(a13 + 16);
  uint64_t v115 = v152;
  uint64_t v116 = v165;
  if (v114 == 1)
  {
    uint64_t v140 = 0;
    unint64_t v147 = 0xE000000000000000;
  }
  else
  {
    unint64_t v117 = v98[3];
    uint64_t v140 = v98[2];
    unint64_t v147 = v117;
    swift_bridgeObjectRetain();
  }
  id v231 = v150;
  unint64_t v232 = v153;
  v233 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v179;
  char v234 = v151;
  uint64_t v235 = v107;
  uint64_t v236 = (void *)v149;
  uint64_t v237 = v174;
  uint64_t v238 = v116;
  char v239 = v173;
  uint64_t v240 = v172;
  uint64_t v241 = v171;
  unint64_t v139 = v107;
  uint64_t v242 = v170;
  uint64_t v243 = v178;
  unint64_t v244 = v169;
  uint64_t v245 = v176;
  uint64_t v246 = v168;
  uint64_t v247 = v175;
  uint64_t v248 = v167;
  uint64_t v249 = v166;
  uint64_t v250 = v164;
  uint64_t v251 = v115;
  char v252 = v163;
  uint64_t v253 = v162;
  uint64_t v254 = v161;
  uint64_t v255 = v160;
  uint64_t v256 = v159;
  uint64_t v257 = v158;
  uint64_t v258 = v157;
  uint64_t v259 = v156;
  uint64_t v260 = v177;
  uint64_t v261 = v155;
  uint64_t v262 = v154;
  long long v269 = 0u;
  long long v268 = 0u;
  long long v267 = 0u;
  long long v266 = 0u;
  long long v265 = 0u;
  long long v264 = 0u;
  long long v263 = 0u;
  uint64_t v270 = 0;
  unint64_t v118 = v145;
  id v119 = v146;
  id v271 = v146;
  unint64_t v272 = v145;
  uint64_t v273 = 1;
  unint64_t v121 = v142;
  uint64_t v120 = v143;
  uint64_t v274 = v143;
  unint64_t v275 = v142;
  uint64_t v122 = v140;
  uint64_t v276 = v140;
  unint64_t v123 = v147;
  unint64_t v277 = v147;
  a11(&v231, a7);
  v186[0] = v150;
  v186[1] = v153;
  v186[2] = v179;
  v186[3] = v151;
  v186[4] = v139;
  v186[5] = v149;
  v186[6] = v174;
  v186[7] = v165;
  char v187 = v173;
  uint64_t v188 = v172;
  uint64_t v189 = v171;
  uint64_t v190 = v170;
  uint64_t v191 = v178;
  unint64_t v192 = v169;
  uint64_t v193 = v176;
  uint64_t v194 = v168;
  uint64_t v195 = v175;
  uint64_t v196 = v167;
  uint64_t v197 = v166;
  uint64_t v198 = v164;
  uint64_t v199 = v152;
  char v200 = v163;
  uint64_t v201 = v162;
  uint64_t v202 = v161;
  uint64_t v203 = v160;
  uint64_t v204 = v159;
  uint64_t v205 = v158;
  uint64_t v206 = v157;
  uint64_t v207 = v156;
  uint64_t v208 = v177;
  uint64_t v209 = v155;
  uint64_t v210 = v154;
  long long v216 = 0u;
  long long v217 = 0u;
  long long v214 = 0u;
  long long v215 = 0u;
  long long v212 = 0u;
  long long v213 = 0u;
  long long v211 = 0u;
  uint64_t v218 = 0;
  id v219 = v119;
  unint64_t v220 = v118;
  uint64_t v221 = 1;
  uint64_t v222 = v120;
  unint64_t v223 = v121;
  uint64_t v224 = v122;
  unint64_t v225 = v123;
  nullsub_1(v186);
  uint64_t v124 = (uint64_t)v148;
  swift_beginAccess();
  sub_24D17D91C(v124, (uint64_t)v226);
  sub_24D17D91C((uint64_t)v186, v124);
  sub_24D17DAF4((uint64_t)v226);
  id v125 = v144;
  swift_beginAccess();
  if (__OFADD__(*v125, 1))
  {
    __break(1u);
    goto LABEL_58;
  }
  ++*v125;
  int64_t v126 = *(uint64_t (**)(uint64_t))(a14 + 24);
  uint64_t v127 = swift_retain();
  char v128 = v126(v127);
  uint64_t result = swift_release();
  if (v128)
  {
    sub_24D195FD0();
    sub_24D177C34(0, (unint64_t *)&qword_26985A0D0);
    uint64_t v129 = (void *)sub_24D196090();
    sub_24D195CB0();

    v185[0] = 1;
    uint64_t v130 = type metadata accessor for TargetType(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v130 - 8) + 56))(v19, 1, 1, v130);
    uint64_t v131 = sub_24D1957E4(v180);
    uint64_t v132 = *(void *)(a7 + 48);
    unint64_t v133 = *(void *)(a7 + 56);
    long long v134 = *(_OWORD *)(a7 + 16);
    unint64_t v135 = *(void *)(a7 + 32);
    unint64_t v136 = *(void *)(a7 + 40);
    unsigned __int8 v184 = 4;
    uint64_t v182 = 0;
    uint64_t v183 = 0;
    sub_24D18C314(v185, (uint64_t)v19, 0, 1, v131, v137, v132, v133, v134, *((unint64_t *)&v134 + 1), v135, v136, &v184, 0xD00000000000002DLL, 0x800000024D197C40);
    goto LABEL_11;
  }
  return result;
}

void sub_24D17B114(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v7 = *(void (**)(id, void *, uint64_t))(a1 + 32);
  swift_retain();
  id v9 = a2;
  id v8 = a3;
  v7(v9, a3, a4);
  swift_release();
}

void sub_24D17B1A8()
{
  id v0 = sub_24D17B84C(-1);
  objc_msgSend(v0, sel_postprocess);
  if ((uint64_t)objc_msgSend(v0, sel_numSamples) < 1)
  {

    return;
  }
  sub_24D195FC0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269859FE8);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_24D196C10;
  id v2 = objc_msgSend(v0, sel_tasksByUniquePid);
  sub_24D177C34(0, &qword_26985A140);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985A148);
  sub_24D17D728();
  uint64_t v3 = sub_24D195DA0();

  uint64_t v4 = *(void *)(v3 + 16);
  swift_bridgeObjectRelease();
  uint64_t v5 = MEMORY[0x263F8D750];
  *(void *)(v1 + 56) = MEMORY[0x263F8D6C8];
  *(void *)(v1 + 64) = v5;
  *(void *)(v1 + 32) = v4;
  sub_24D177C34(0, (unint64_t *)&qword_26985A0D0);
  uint64_t v6 = (void *)sub_24D196090();
  sub_24D195CB0();
  swift_bridgeObjectRelease();

  id v7 = objc_msgSend(v0, sel_tasksByUniquePid);
  uint64_t v8 = sub_24D195DA0();

  int64_t v9 = 0;
  uint64_t v10 = v8 + 64;
  uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v8 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  id v15 = (char *)MEMORY[0x263F8EE78];
  uint64_t v62 = v8;
  id v63 = v0;
  int64_t v60 = v14;
  uint64_t v61 = v8 + 64;
  if (!v13) {
    goto LABEL_8;
  }
  while (2)
  {
    while (1)
    {
      unint64_t v16 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v17 = v16 | (v9 << 6);
LABEL_24:
      unint64_t v21 = *(void *)(*(void *)(v8 + 56) + 8 * v17);
      if (v21 >> 62) {
        break;
      }
      uint64_t v22 = *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v22) {
        goto LABEL_26;
      }
LABEL_6:
      swift_bridgeObjectRelease();
      if (!v13) {
        goto LABEL_8;
      }
    }
    swift_bridgeObjectRetain_n();
    uint64_t v22 = sub_24D1961D0();
    swift_bridgeObjectRelease();
    if (!v22) {
      goto LABEL_6;
    }
LABEL_26:
    int64_t v64 = v9;
    uint64_t v66 = v22;
    uint64_t v23 = 4;
    unint64_t v24 = 0x265300000;
    do
    {
      if ((v21 & 0xC000000000000001) != 0) {
        id v26 = (id)MEMORY[0x25331FFF0](v23 - 4, v21);
      }
      else {
        id v26 = *(id *)(v21 + 8 * v23);
      }
      id v27 = v26;
      uint64_t v28 = v23 - 3;
      if (__OFADD__(v23 - 4, 1))
      {
        __break(1u);
        goto LABEL_63;
      }
      id v29 = [v26 *(SEL *)(v24 + 2992)];
      if (v29)
      {

        id v30 = [v27 *(SEL *)(v24 + 2992)];
        if (!v30) {
          goto LABEL_65;
        }
        id v31 = v30;
        uint64_t v32 = sub_24D195E10();
        unint64_t v34 = v33;

        swift_bridgeObjectRelease();
        uint64_t v35 = HIBYTE(v34) & 0xF;
        if ((v34 & 0x2000000000000000) == 0) {
          uint64_t v35 = v32 & 0xFFFFFFFFFFFFLL;
        }
        if (v35)
        {
          id v36 = [v27 *(SEL *)(v24 + 2992)];
          if (!v36) {
            goto LABEL_66;
          }
          char v37 = v36;
          sub_24D195E10();

          LOBYTE(v37) = sub_24D17DF20();
          swift_bridgeObjectRelease();
          if ((v37 & 1) == 0)
          {
            sub_24D195FC0();
            uint64_t v38 = swift_allocObject();
            *(_OWORD *)(v38 + 16) = xmmword_24D196C20;
            id v39 = objc_msgSend(v27, sel_mainBinaryPath);
            if (v39)
            {
              uint64_t v40 = v39;
              uint64_t v41 = sub_24D195E10();
              unint64_t v43 = v42;
            }
            else
            {
              uint64_t v41 = 0;
              unint64_t v43 = 0;
            }
            unint64_t v65 = v15;
            uint64_t v44 = MEMORY[0x263F8D310];
            *(void *)(v38 + 56) = MEMORY[0x263F8D310];
            unint64_t v45 = sub_24D177760();
            *(void *)(v38 + 64) = v45;
            unint64_t v46 = 0xD000000000000013;
            if (v43) {
              unint64_t v46 = v41;
            }
            unint64_t v47 = 0x800000024D1984E0;
            if (v43) {
              unint64_t v47 = v43;
            }
            *(void *)(v38 + 32) = v46;
            *(void *)(v38 + 40) = v47;
            id v48 = objc_msgSend(v27, sel_bundleIdentifier);
            if (v48)
            {
              uint64_t v49 = v48;
              uint64_t v50 = sub_24D195E10();
              unint64_t v52 = v51;

              uint64_t v53 = (uint64_t *)(v38 + 72);
              *(void *)(v38 + 96) = MEMORY[0x263F8D310];
              *(void *)(v38 + 104) = v45;
              if (v52)
              {
                uint64_t *v53 = v50;
LABEL_52:
                *(void *)(v38 + 80) = v52;
                uint64_t v54 = (void *)sub_24D196090();
                sub_24D195CB0();
                swift_bridgeObjectRelease();

                unsigned int v55 = objc_msgSend(v27, sel_pid);
                id v56 = v65;
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                  id v56 = sub_24D18A000(0, *((void *)v65 + 2) + 1, 1, v65);
                }
                unint64_t v58 = *((void *)v56 + 2);
                unint64_t v57 = *((void *)v56 + 3);
                uint64_t v59 = v56;
                if (v58 >= v57 >> 1) {
                  uint64_t v59 = sub_24D18A000((char *)(v57 > 1), v58 + 1, 1, v56);
                }
                *((void *)v59 + 2) = v58 + 1;
                int64_t v25 = &v59[4 * v58];
                id v15 = v59;
                *((_DWORD *)v25 + 8) = v55;
                unint64_t v24 = 0x265300000uLL;
                goto LABEL_28;
              }
            }
            else
            {
              uint64_t v53 = (uint64_t *)(v38 + 72);
              *(void *)(v38 + 96) = v44;
              *(void *)(v38 + 104) = v45;
            }
            uint64_t *v53 = 0xD000000000000019;
            unint64_t v52 = 0x800000024D198500;
            goto LABEL_52;
          }
        }
      }
LABEL_28:

      ++v23;
    }
    while (v28 != v66);
    swift_bridgeObjectRelease();
    uint64_t v8 = v62;
    id v0 = v63;
    int64_t v14 = v60;
    uint64_t v10 = v61;
    int64_t v9 = v64;
    if (v13) {
      continue;
    }
    break;
  }
LABEL_8:
  int64_t v18 = v9 + 1;
  if (__OFADD__(v9, 1))
  {
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  if (v18 >= v14) {
    goto LABEL_60;
  }
  unint64_t v19 = *(void *)(v10 + 8 * v18);
  ++v9;
  if (v19) {
    goto LABEL_23;
  }
  int64_t v9 = v18 + 1;
  if (v18 + 1 >= v14) {
    goto LABEL_60;
  }
  unint64_t v19 = *(void *)(v10 + 8 * v9);
  if (v19) {
    goto LABEL_23;
  }
  int64_t v9 = v18 + 2;
  if (v18 + 2 >= v14) {
    goto LABEL_60;
  }
  unint64_t v19 = *(void *)(v10 + 8 * v9);
  if (v19) {
    goto LABEL_23;
  }
  int64_t v9 = v18 + 3;
  if (v18 + 3 >= v14) {
    goto LABEL_60;
  }
  unint64_t v19 = *(void *)(v10 + 8 * v9);
  if (v19) {
    goto LABEL_23;
  }
  int64_t v20 = v18 + 4;
  if (v20 >= v14)
  {
LABEL_60:

    swift_release();
  }
  else
  {
    unint64_t v19 = *(void *)(v10 + 8 * v20);
    if (v19)
    {
      int64_t v9 = v20;
LABEL_23:
      unint64_t v13 = (v19 - 1) & v19;
      unint64_t v17 = __clz(__rbit64(v19)) + (v9 << 6);
      goto LABEL_24;
    }
    while (1)
    {
      int64_t v9 = v20 + 1;
      if (__OFADD__(v20, 1)) {
        break;
      }
      if (v9 >= v14) {
        goto LABEL_60;
      }
      unint64_t v19 = *(void *)(v10 + 8 * v9);
      ++v20;
      if (v19) {
        goto LABEL_23;
      }
    }
LABEL_64:
    __break(1u);
LABEL_65:
    __break(1u);
LABEL_66:
    __break(1u);
  }
}

id sub_24D17B84C(int a1)
{
  LODWORD(v66) = a1;
  uint64_t v73 = *MEMORY[0x263EF8340];
  uint64_t v1 = sub_24D195C70();
  uint64_t v61 = *(void *)(v1 - 8);
  id v62 = (id)v1;
  uint64_t v2 = MEMORY[0x270FA5388](v1);
  unint64_t v58 = (char *)&v54 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  int64_t v60 = (char *)&v54 - v4;
  uint64_t v5 = sub_24D196000();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24D195FF0();
  MEMORY[0x270FA5388](v9);
  uint64_t v10 = sub_24D195D10();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v65 = swift_allocObject();
  *(void *)(v65 + 16) = 0;
  uint64_t v64 = swift_allocObject();
  *(_DWORD *)(v64 + 16) = 0;
  dispatch_semaphore_t v63 = dispatch_semaphore_create(0);
  sub_24D177C34(0, &qword_26985A0B0);
  sub_24D195CF0();
  mach_timebase_info info = (mach_timebase_info)MEMORY[0x263F8EE78];
  sub_24D17CABC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985A0C0);
  sub_24D17DE54(&qword_26985A0C8, &qword_26985A0C0);
  sub_24D196120();
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F8F130], v5);
  uint64_t v11 = sub_24D196020();
  xpc_object_t empty = xpc_dictionary_create_empty();
  id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F66EF8]), sel_initForFileParsing);
  objc_msgSend(v13, sel_setDataGatheringOptions_, (unint64_t)objc_msgSend(v13, sel_dataGatheringOptions) | 0x40);
  objc_msgSend(v13, sel_setDataGatheringOptions_, (unint64_t)objc_msgSend(v13, sel_dataGatheringOptions) | 0x20);
  objc_msgSend(v13, sel_setDataGatheringOptions_, (unint64_t)objc_msgSend(v13, sel_dataGatheringOptions) | 1);
  objc_msgSend(v13, sel_setDataGatheringOptions_, (unint64_t)objc_msgSend(v13, sel_dataGatheringOptions) & 0xFFFFFFFFFFFFFFEFLL);
  objc_msgSend(v13, sel_setAdditionalCSSymbolicatorFlags_, objc_msgSend(v13, sel_additionalCSSymbolicatorFlags) | 0x4000440);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  objc_msgSend(v13, sel_setMachTimebase_, info);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = 0;
  uint64_t v15 = swift_allocObject();
  id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF910]), sel_init);
  objc_msgSend(v16, sel_timeIntervalSince1970);
  double v18 = v17;

  if ((~*(void *)&v18 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (v18 <= -1.0)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v18 >= 1.84467441e19)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if ((unint64_t)v18 >= 0xFFFFFFFFFFFFFC18)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  *(double *)(v15 + 16) = (double)((unint64_t)v18 + 1000);
  int v19 = v66;
  if ((int)v66 < 1)
  {
    uint64_t v55 = v11;
    xpc_object_t v54 = empty;
    sub_24D195FE0();
    uint64_t v56 = sub_24D177C34(0, (unint64_t *)&qword_26985A0D0);
    int64_t v20 = (void *)sub_24D196090();
    sub_24D195CB0();

    uint64_t v57 = v15;
    uint64_t v21 = v59 + OBJC_IVAR____TtC18EcosystemAnalytics21MicrostackshotsParser_startTime;
    swift_beginAccess();
    uint64_t v22 = v61;
    uint64_t v23 = *(void (**)(char *, uint64_t, id))(v61 + 16);
    unint64_t v24 = v58;
    uint64_t v25 = v14;
    id v26 = v62;
    v23(v58, v21, v62);
    id v27 = v60;
    sub_24D195C30();
    uint64_t v28 = *(void (**)(char *, id))(v22 + 8);
    v28(v24, v26);
    sub_24D195C40();
    double v30 = v29;
    v28(v27, v26);
    double v31 = *MEMORY[0x263EFFAF8];
    *(double *)(v25 + 16) = v30 - *MEMORY[0x263EFFAF8];
    v23(v27, v21, v26);
    sub_24D195C40();
    double v33 = v32;
    unint64_t v34 = v27;
    uint64_t v15 = v57;
    id v35 = v26;
    uint64_t v14 = v25;
    v28(v34, v35);
    double v36 = v33 - v31;
    *(double *)(v15 + 16) = v36;
    sub_24D195FB0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269859FE8);
    uint64_t v37 = swift_allocObject();
    *(_OWORD *)(v37 + 16) = xmmword_24D196C20;
    uint64_t v38 = *(void *)(v25 + 16);
    uint64_t v39 = MEMORY[0x263F8D538];
    uint64_t v40 = MEMORY[0x263F8D5B8];
    *(void *)(v37 + 56) = MEMORY[0x263F8D538];
    *(void *)(v37 + 64) = v40;
    *(void *)(v37 + 32) = v38;
    *(void *)(v37 + 96) = v39;
    *(void *)(v37 + 104) = v40;
    *(double *)(v37 + 72) = v36;
    uint64_t v41 = (void *)sub_24D196090();
    sub_24D195CB0();
    swift_bridgeObjectRelease();

    double v42 = v31 + *(double *)(v25 + 16);
    if ((~*(void *)&v42 & 0x7FF0000000000000) != 0)
    {
      if (v42 > -1.0)
      {
        if (v42 < 1.84467441e19)
        {
          xpc_object_t empty = v54;
          xpc_dictionary_set_uint64(v54, "time", (unint64_t)v42);
          int v19 = v66;
          uint64_t v11 = v55;
          goto LABEL_11;
        }
LABEL_18:
        __break(1u);
      }
LABEL_17:
      __break(1u);
      goto LABEL_18;
    }
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  xpc_dictionary_set_uint64(empty, "pid", v66);
LABEL_11:
  id v43 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F66ED8]), sel_init);
  uint64_t v44 = swift_allocObject();
  uint64_t v45 = v65;
  *(void *)(v44 + 16) = v64;
  *(void *)(v44 + 24) = v13;
  *(void *)(v44 + 32) = v14;
  *(void *)(v44 + 40) = v15;
  *(_DWORD *)(v44 + 48) = v19;
  *(void *)(v44 + 56) = v43;
  *(void *)(v44 + 64) = v45;
  dispatch_semaphore_t v46 = v63;
  *(void *)(v44 + 72) = v63;
  *(void *)(v44 + 80) = v11;
  char v71 = sub_24D17CBCC;
  uint64_t v72 = v44;
  mach_timebase_info info = (mach_timebase_info)MEMORY[0x263EF8330];
  uint64_t v68 = 1107296256;
  uint64_t v69 = sub_24D17C82C;
  char v70 = &block_descriptor_0;
  unint64_t v47 = (void *)v11;
  id v48 = _Block_copy(&info);
  uint64_t v66 = v72;
  swift_unknownObjectRetain();
  swift_retain();
  id v62 = v13;
  swift_retain();
  swift_retain();
  id v49 = v43;
  swift_retain();
  uint64_t v50 = v46;
  uint64_t v51 = (uint64_t)empty;
  id v52 = v47;
  swift_release();
  nm_systemstats_get_microstackshots(v51, v48);
  _Block_release(v48);
  swift_release();
  swift_release();

  swift_release();
  swift_release();

  swift_unknownObjectRelease_n();
  return v62;
}

uint64_t sub_24D17C138(int a1, uint64_t a2, int a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, int a8, void *a9, uint64_t a10, void *a11, uint64_t a12)
{
  int v50 = a1;
  int v51 = a8;
  uint64_t v54 = a6;
  uint64_t v55 = a7;
  uint64_t v52 = a2;
  uint64_t v53 = a5;
  uint64_t v14 = sub_24D195CD0();
  MEMORY[0x270FA5388](v14 - 8);
  id v16 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_24D195CE0();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  int64_t v20 = (char *)&v42 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_24D195D10();
  uint64_t v22 = MEMORY[0x270FA5388](v21);
  unint64_t v24 = (char *)&v42 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v22);
  uint64_t v28 = (char *)&v42 - v27;
  if (a3 != 54)
  {
    uint64_t v49 = a12;
    int v44 = a3;
    uint64_t v45 = a4;
    uint64_t v42 = a10;
    id v43 = a9;
    uint64_t v29 = *MEMORY[0x263F8F040];
    double v30 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 104);
    uint64_t v31 = result;
    uint64_t v47 = result;
    uint64_t v48 = v26;
    uint64_t v32 = v17;
    uint64_t v33 = v26;
    v30(v20, v29, v32);
    sub_24D195D00();
    (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v24, v28, v31);
    sub_24D195CC0();
    uint64_t v34 = swift_allocObject();
    dispatch_semaphore_t v46 = v16;
    uint64_t v36 = v52;
    id v35 = v53;
    *(void *)(v34 + 16) = a4;
    *(void *)(v34 + 24) = v36;
    uint64_t v38 = v54;
    uint64_t v37 = v55;
    *(void *)(v34 + 32) = v35;
    *(void *)(v34 + 40) = v38;
    *(void *)(v34 + 48) = v37;
    *(_DWORD *)(v34 + 56) = v51;
    *(void *)(v34 + 64) = a9;
    *(unsigned char *)(v34 + 72) = v50 & 1;
    *(void *)(v34 + 80) = v42;
    *(_DWORD *)(v34 + 88) = v44;
    *(void *)(v34 + 96) = a11;
    aBlock[4] = sub_24D17CC90;
    aBlock[5] = v34;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_24D17C7E8;
    aBlock[3] = &block_descriptor_42;
    _Block_copy(aBlock);
    sub_24D195D30();
    swift_allocObject();
    swift_unknownObjectRetain();
    id v39 = v35;
    swift_retain();
    swift_retain();
    id v40 = v43;
    swift_retain();
    id v41 = a11;
    swift_retain();
    sub_24D195D20();
    swift_release();
    sub_24D196010();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v48 + 8))(v28, v47);
  }
  return result;
}

void sub_24D17C4C4(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9, unsigned int a10)
{
  uint64_t v18 = (_DWORD *)(a1 + 16);
  swift_beginAccess();
  if (*(_DWORD *)(a1 + 16) == 2)
  {
    sub_24D195FD0();
    sub_24D177C34(0, (unint64_t *)&qword_26985A0D0);
    uint64_t v19 = (void *)sub_24D196090();
    sub_24D195CB0();

    return;
  }
  swift_beginAccess();
  *uint64_t v18 = 1;
  if (a2)
  {
    bytes_ptr = xpc_data_get_bytes_ptr(a2);
    size_t length = xpc_data_get_length(a2);
    if (!bytes_ptr)
    {
      __break(1u);
      goto LABEL_14;
    }
    uint64_t v22 = sub_24D17D61C(bytes_ptr, length);
    unint64_t v24 = v23;
    uint64_t v25 = (void *)sub_24D195C20();
    swift_beginAccess();
    double v26 = *(double *)(a4 + 16);
    swift_beginAccess();
    objc_msgSend(a3, sel_addMicrostackshotsFromData_ofTypes_inTimeRangeStart_end_onlyPid_onlyTid_statistics_, v25, 17, a6, 0, a7, v26, *(double *)(a5 + 16));
    sub_24D17D6D0(v22, v24);
  }
  if ((a8 & 1) == 0) {
    return;
  }
  if ((a10 & 0x80000000) != 0)
  {
LABEL_14:
    sub_24D1961C0();
    __break(1u);
    return;
  }
  swift_beginAccess();
  *(void *)(a9 + 16) = a10;
  os_log_type_t v27 = sub_24D195FD0();
  sub_24D177C34(0, (unint64_t *)&qword_26985A0D0);
  swift_retain();
  uint64_t v28 = sub_24D196090();
  if (os_log_type_enabled(v28, v27))
  {
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v29 = 134217984;
    swift_beginAccess();
    sub_24D1960A0();
    swift_release();
    _os_log_impl(&dword_24D172000, v28, v27, "EcosystemAnalytics.framework:MicrostackshotsParser: Done: %llu", v29, 0xCu);
    MEMORY[0x253320910](v29, -1, -1);
  }
  else
  {
    swift_release();
  }

  sub_24D196030();
}

uint64_t sub_24D17C7E8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_24D17C82C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  v7(a2, a3, a4);
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t sub_24D17C8AC()
{
  swift_release();
  sub_24D17DE98(v0[5], v0[6]);
  swift_bridgeObjectRelease();
  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC18EcosystemAnalytics21MicrostackshotsParser_startTime;
  uint64_t v2 = sub_24D195C70();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_24D17C970()
{
  return type metadata accessor for MicrostackshotsParser();
}

uint64_t type metadata accessor for MicrostackshotsParser()
{
  uint64_t result = qword_26985A098;
  if (!qword_26985A098) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24D17C9C4()
{
  uint64_t result = sub_24D195C70();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_24D17CA9C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24D17CAAC()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

unint64_t sub_24D17CABC()
{
  unint64_t result = qword_26985A0B8;
  if (!qword_26985A0B8)
  {
    sub_24D195FF0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985A0B8);
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

uint64_t sub_24D17CB5C()
{
  swift_release();

  swift_release();
  swift_release();

  swift_release();

  return MEMORY[0x270FA0238](v0, 88, 7);
}

uint64_t sub_24D17CBCC(int a1, uint64_t a2, int a3)
{
  return sub_24D17C138(a1, a2, a3, *(void *)(v3 + 16), *(void **)(v3 + 24), *(void *)(v3 + 32), *(void *)(v3 + 40), *(_DWORD *)(v3 + 48), *(void **)(v3 + 56), *(void *)(v3 + 64), *(void **)(v3 + 72), *(void *)(v3 + 80));
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

uint64_t sub_24D17CC20()
{
  swift_release();
  swift_unknownObjectRelease();

  swift_release();
  swift_release();

  swift_release();

  return MEMORY[0x270FA0238](v0, 104, 7);
}

void sub_24D17CC90()
{
  sub_24D17C4C4(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void **)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(unsigned int *)(v0 + 56), *(void *)(v0 + 64), *(unsigned char *)(v0 + 72), *(void *)(v0 + 80), *(_DWORD *)(v0 + 88));
}

void *sub_24D17CCE0(void *__src, uint64_t a2, void *__dst, uint64_t a4)
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
    __src = (void *)sub_24D196210();
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

void sub_24D17CD84(void *a1)
{
  sub_24D195FC0();
  sub_24D177C34(0, (unint64_t *)&qword_26985A0D0);
  uint64_t v2 = (void *)sub_24D196090();
  sub_24D195CB0();

  if ((uint64_t)objc_msgSend(a1, sel_numSamples) < 1) {
    return;
  }
  sub_24D195FC0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269859FE8);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_24D196C10;
  id v4 = objc_msgSend(a1, sel_tasksByUniquePid);
  sub_24D177C34(0, &qword_26985A140);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985A148);
  sub_24D17D728();
  uint64_t v5 = sub_24D195DA0();

  uint64_t v6 = *(void *)(v5 + 16);
  swift_bridgeObjectRelease();
  uint64_t v7 = MEMORY[0x263F8D750];
  *(void *)(v3 + 56) = MEMORY[0x263F8D6C8];
  *(void *)(v3 + 64) = v7;
  *(void *)(v3 + 32) = v6;
  uint64_t v8 = (void *)sub_24D196090();
  sub_24D195CB0();
  swift_bridgeObjectRelease();

  id v9 = objc_msgSend(a1, sel_tasksByUniquePid);
  uint64_t v10 = sub_24D195DA0();

  int64_t v11 = 0;
  uint64_t v12 = v10 + 64;
  uint64_t v13 = 1 << *(unsigned char *)(v10 + 32);
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & *(void *)(v10 + 64);
  int64_t v16 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v17 = (void *)MEMORY[0x263F8EE78];
  uint64_t v63 = v10 + 64;
  uint64_t v64 = v10;
  int64_t v62 = v16;
  if (!v15) {
    goto LABEL_8;
  }
  while (2)
  {
    while (1)
    {
      unint64_t v18 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v19 = v18 | (v11 << 6);
LABEL_24:
      unint64_t v23 = *(void *)(*(void *)(v10 + 56) + 8 * v19);
      if (v23 >> 62) {
        break;
      }
      uint64_t v24 = *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v24) {
        goto LABEL_26;
      }
LABEL_6:
      swift_bridgeObjectRelease();
      if (!v15) {
        goto LABEL_8;
      }
    }
    swift_bridgeObjectRetain_n();
    uint64_t v24 = sub_24D1961D0();
    swift_bridgeObjectRelease();
    if (!v24) {
      goto LABEL_6;
    }
LABEL_26:
    unint64_t v65 = v15;
    uint64_t v66 = v24;
    uint64_t v25 = 4;
    do
    {
      uint64_t v68 = v17;
      if ((v23 & 0xC000000000000001) != 0) {
        id v26 = (id)MEMORY[0x25331FFF0](v25 - 4, v23);
      }
      else {
        id v26 = *(id *)(v23 + 8 * v25);
      }
      os_log_type_t v27 = v26;
      if (__OFADD__(v25 - 4, 1))
      {
        __break(1u);
        goto LABEL_64;
      }
      uint64_t v67 = v25 - 3;
      id v28 = objc_msgSend(v26, sel_bundleIdentifier);
      if (v28)
      {

        id v29 = objc_msgSend(v27, sel_bundleIdentifier);
        if (!v29) {
          goto LABEL_66;
        }
        double v30 = v29;
        uint64_t v31 = sub_24D195E10();
        unint64_t v33 = v32;

        swift_bridgeObjectRelease();
        uint64_t v34 = HIBYTE(v33) & 0xF;
        if ((v33 & 0x2000000000000000) == 0) {
          uint64_t v34 = v31 & 0xFFFFFFFFFFFFLL;
        }
        if (v34)
        {
          sub_24D195FC0();
          uint64_t v35 = swift_allocObject();
          *(_OWORD *)(v35 + 16) = xmmword_24D196C20;
          id v36 = objc_msgSend(v27, sel_mainBinaryPath);
          if (v36)
          {
            uint64_t v37 = v36;
            uint64_t v38 = sub_24D195E10();
            unint64_t v40 = v39;
          }
          else
          {
            uint64_t v38 = 0;
            unint64_t v40 = 0;
          }
          uint64_t v41 = MEMORY[0x263F8D310];
          *(void *)(v35 + 56) = MEMORY[0x263F8D310];
          unint64_t v42 = sub_24D177760();
          *(void *)(v35 + 64) = v42;
          unint64_t v43 = 0xD000000000000013;
          if (v40) {
            unint64_t v43 = v38;
          }
          unint64_t v44 = 0x800000024D1984E0;
          if (v40) {
            unint64_t v44 = v40;
          }
          *(void *)(v35 + 32) = v43;
          *(void *)(v35 + 40) = v44;
          id v45 = objc_msgSend(v27, sel_bundleIdentifier, v62, v63, v64);
          if (v45)
          {
            dispatch_semaphore_t v46 = v45;
            uint64_t v47 = sub_24D195E10();
            unint64_t v49 = v48;

            int v50 = (uint64_t *)(v35 + 72);
            *(void *)(v35 + 96) = v41;
            *(void *)(v35 + 104) = v42;
            if (v49)
            {
              *int v50 = v47;
LABEL_50:
              *(void *)(v35 + 80) = v49;
              int v51 = (void *)sub_24D196090();
              sub_24D195CB0();
              swift_bridgeObjectRelease();

              goto LABEL_51;
            }
          }
          else
          {
            int v50 = (uint64_t *)(v35 + 72);
            *(void *)(v35 + 96) = v41;
            *(void *)(v35 + 104) = v42;
          }
          *int v50 = 0xD000000000000019;
          unint64_t v49 = 0x800000024D198500;
          goto LABEL_50;
        }
      }
LABEL_51:
      id v52 = objc_msgSend(v27, sel_name, v62, v63, v64);
      if (v52)
      {
        uint64_t v53 = v52;
        uint64_t v54 = sub_24D195E10();
        uint64_t v56 = v55;

        sub_24D195FC0();
        uint64_t v57 = swift_allocObject();
        *(_OWORD *)(v57 + 16) = xmmword_24D196C10;
        *(void *)(v57 + 56) = MEMORY[0x263F8D310];
        *(void *)(v57 + 64) = sub_24D177760();
        *(void *)(v57 + 32) = v54;
        *(void *)(v57 + 40) = v56;
        swift_bridgeObjectRetain();
        unint64_t v58 = (void *)sub_24D196090();
        sub_24D195CB0();
        swift_bridgeObjectRelease();

        uint64_t v17 = v68;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v17 = sub_24D18A110(0, v68[2] + 1, 1, v68);
        }
        unint64_t v60 = v17[2];
        unint64_t v59 = v17[3];
        if (v60 >= v59 >> 1) {
          uint64_t v17 = sub_24D18A110((void *)(v59 > 1), v60 + 1, 1, v17);
        }
        v17[2] = v60 + 1;
        uint64_t v61 = &v17[2 * v60];
        v61[4] = v54;
        v61[5] = v56;
      }
      else
      {
        uint64_t v17 = v68;
      }

      ++v25;
    }
    while (v67 != v66);
    swift_bridgeObjectRelease();
    uint64_t v12 = v63;
    uint64_t v10 = v64;
    int64_t v16 = v62;
    unint64_t v15 = v65;
    if (v65) {
      continue;
    }
    break;
  }
LABEL_8:
  int64_t v20 = v11 + 1;
  if (__OFADD__(v11, 1))
  {
LABEL_64:
    __break(1u);
    goto LABEL_65;
  }
  if (v20 >= v16) {
    goto LABEL_61;
  }
  unint64_t v21 = *(void *)(v12 + 8 * v20);
  ++v11;
  if (v21) {
    goto LABEL_23;
  }
  int64_t v11 = v20 + 1;
  if (v20 + 1 >= v16) {
    goto LABEL_61;
  }
  unint64_t v21 = *(void *)(v12 + 8 * v11);
  if (v21) {
    goto LABEL_23;
  }
  int64_t v11 = v20 + 2;
  if (v20 + 2 >= v16) {
    goto LABEL_61;
  }
  unint64_t v21 = *(void *)(v12 + 8 * v11);
  if (v21) {
    goto LABEL_23;
  }
  int64_t v11 = v20 + 3;
  if (v20 + 3 >= v16) {
    goto LABEL_61;
  }
  unint64_t v21 = *(void *)(v12 + 8 * v11);
  if (v21) {
    goto LABEL_23;
  }
  int64_t v22 = v20 + 4;
  if (v22 >= v16)
  {
LABEL_61:
    swift_release();
  }
  else
  {
    unint64_t v21 = *(void *)(v12 + 8 * v22);
    if (v21)
    {
      int64_t v11 = v22;
LABEL_23:
      unint64_t v15 = (v21 - 1) & v21;
      unint64_t v19 = __clz(__rbit64(v21)) + (v11 << 6);
      goto LABEL_24;
    }
    while (1)
    {
      int64_t v11 = v22 + 1;
      if (__OFADD__(v22, 1)) {
        break;
      }
      if (v11 >= v16) {
        goto LABEL_61;
      }
      unint64_t v21 = *(void *)(v12 + 8 * v11);
      ++v22;
      if (v21) {
        goto LABEL_23;
      }
    }
LABEL_65:
    __break(1u);
LABEL_66:
    __break(1u);
  }
}

uint64_t sub_24D17D498(uint64_t a1)
{
  uint64_t v2 = sub_24D195E40();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985A188);
  sub_24D17DE54((unint64_t *)&qword_26985A190, &qword_26985A188);
  uint64_t v10 = sub_24D195DC0();
  uint64_t v11 = v6;
  uint64_t v10 = sub_24D195F30();
  uint64_t v11 = v7;
  sub_24D195E30();
  sub_24D1757BC();
  uint64_t v8 = sub_24D1960F0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t result = swift_bridgeObjectRelease();
  if (v8)
  {
    nm_CRSetCrashLogMessage(v8 + 32);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24D17D61C(unsigned char *__src, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 <= 14) {
    return sub_24D18B590(__src, &__src[a2]);
  }
  sub_24D195AE0();
  swift_allocObject();
  sub_24D195A90();
  if ((unint64_t)a2 < 0x7FFFFFFF) {
    return a2 << 32;
  }
  sub_24D195BF0();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t sub_24D17D6D0(uint64_t a1, unint64_t a2)
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

unint64_t sub_24D17D728()
{
  unint64_t result = qword_26985A150;
  if (!qword_26985A150)
  {
    sub_24D177C34(255, &qword_26985A140);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985A150);
  }
  return result;
}

uint64_t sub_24D17D790()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24D17D7C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24D17E088(a1, a2, a3, a4, v4);
}

uint64_t sub_24D17D7D0()
{
  return swift_release();
}

double sub_24D17D7D8(_OWORD *a1)
{
  double result = 0.0;
  a1[25] = 0u;
  a1[26] = 0u;
  a1[23] = 0u;
  a1[24] = 0u;
  a1[21] = 0u;
  a1[22] = 0u;
  a1[19] = 0u;
  a1[20] = 0u;
  a1[17] = 0u;
  a1[18] = 0u;
  a1[15] = 0u;
  a1[16] = 0u;
  a1[13] = 0u;
  a1[14] = 0u;
  a1[11] = 0u;
  a1[12] = 0u;
  a1[9] = 0u;
  a1[10] = 0u;
  a1[7] = 0u;
  a1[8] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

uint64_t sub_24D17D818()
{
  if (v0[3])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v0[35])
    {
      swift_bridgeObjectRelease();
      if (v0[37])
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

  return MEMORY[0x270FA0238](v0, 448, 7);
}

uint64_t sub_24D17D91C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A170);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24D17D984()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 160, 7);
}

uint64_t sub_24D17DA14(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_24D17A1B8(a1, a2, a3, *(void **)(v3 + 16), *(void *)(v3 + 24), *(void *)(v3 + 32), v3 + 40, *(void *)(v3 + 104), *(void **)(v3 + 112), *(void *)(v3 + 120), *(void (**)(id *, uint64_t))(v3 + 128), *(void *)(v3 + 136), *(void *)(v3 + 144), *(void *)(v3 + 152));
}

uint64_t sub_24D17DA54(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24D17DAD8(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

uint64_t sub_24D17DAF4(uint64_t a1)
{
  long long v4 = *(_OWORD *)(a1 + 256);
  long long v5 = *(_OWORD *)(a1 + 272);
  long long v3 = *(_OWORD *)(a1 + 224);
  sub_24D17DB98(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    *(void *)(a1 + 200),
    *(void *)(a1 + 208),
    *(void *)(a1 + 216),
    v3,
    *((uint64_t *)&v3 + 1),
    *(void *)(a1 + 240),
    *(void *)(a1 + 248),
    v4,
    *((uint64_t *)&v4 + 1),
    v5,
    *((uint64_t *)&v5 + 1));
  return a1;
}

uint64_t sub_24D17DB98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24D17DD90(a33, a34, a35, a36);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_24D17DD90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    sub_24D17DA54(a3, a4);
  }
}

uint64_t sub_24D17DE54(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_24D17DE98(uint64_t a1, uint64_t a2)
{
  if (a2 != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24D17DF20()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v0 = sub_24D195EB0();
  if (v1)
  {
    uint64_t v2 = v0;
    uint64_t v3 = v1;
    do
    {
      uint64_t v6 = sub_24D195EB0();
      if (!v7)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v2 == v6 && v3 == v7)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        char v4 = sub_24D196250();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v4 & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return 0;
        }
      }
      uint64_t v2 = sub_24D195EB0();
      uint64_t v3 = v5;
    }
    while (v5);
  }
  swift_bridgeObjectRelease();
  sub_24D195EB0();
  uint64_t v9 = v8;
  swift_bridgeObjectRelease();
  BOOL v10 = v9 == 0;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_24D17E088(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v9[4] = sub_24D182AEC;
  v9[5] = a5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = sub_24D17E2F4;
  v9[3] = &block_descriptor_41;
  uint64_t v7 = _Block_copy(v9);
  swift_retain();
  swift_release();
  nm_macho_for_each_defined_rpath(a1, a3, v7);
  _Block_release(v7);
  return 0;
}

uint64_t sub_24D17E15C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24D195FC0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269859FE8);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_24D196C10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985A200);
  uint64_t v5 = sub_24D195E50();
  uint64_t v7 = v6;
  *(void *)(v4 + 56) = MEMORY[0x263F8D310];
  *(void *)(v4 + 64) = sub_24D177760();
  *(void *)(v4 + 32) = v5;
  *(void *)(v4 + 40) = v7;
  sub_24D178CF8();
  uint64_t v8 = (void *)sub_24D196090();
  sub_24D195CB0();
  swift_bridgeObjectRelease();

  uint64_t v9 = sub_24D195E90();
  uint64_t v11 = v10;
  uint64_t v12 = (void *)(a3 + 56);
  swift_beginAccess();
  uint64_t v13 = *(void **)(a3 + 56);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a3 + 56) = v13;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v13 = sub_24D18A110(0, v13[2] + 1, 1, v13);
    *uint64_t v12 = v13;
  }
  unint64_t v16 = v13[2];
  unint64_t v15 = v13[3];
  if (v16 >= v15 >> 1)
  {
    uint64_t v13 = sub_24D18A110((void *)(v15 > 1), v16 + 1, 1, v13);
    *uint64_t v12 = v13;
  }
  v13[2] = v16 + 1;
  uint64_t v17 = &v13[2 * v16];
  v17[4] = v9;
  v17[5] = v11;
  return swift_endAccess();
}

uint64_t sub_24D17E2F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v5(a2, a3);

  return swift_release();
}

uint64_t sub_24D17E354(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  LOBYTE(a5) = v9(a2, a3, a4, a5);
  swift_release();
  return a5 & 1;
}

uint64_t sub_24D17E3C8()
{
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 24) = 0;
  *(void *)(v0 + 16) = 0;
  swift_bridgeObjectRetain();
  uint64_t v1 = (void *)sub_24D195DE0();
  swift_bridgeObjectRelease();
  v11[4] = sub_24D182C64;
  v11[5] = v0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 1107296256;
  v11[2] = sub_24D17E354;
  v11[3] = &block_descriptor_74;
  uint64_t v2 = _Block_copy(v11);
  swift_retain();
  swift_release();
  nm_macho_for_each_slice(v1, v2);
  _Block_release(v2);

  sub_24D195FC0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269859FE8);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_24D196C10;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v0 + 16);
  unint64_t v5 = *(void *)(v0 + 24);
  *(void *)(v3 + 56) = MEMORY[0x263F8D310];
  *(void *)(v3 + 64) = sub_24D177760();
  uint64_t v6 = 7104878;
  if (v5) {
    uint64_t v6 = v4;
  }
  unint64_t v7 = 0xE300000000000000;
  if (v5) {
    unint64_t v7 = v5;
  }
  *(void *)(v3 + 32) = v6;
  *(void *)(v3 + 40) = v7;
  sub_24D178CF8();
  swift_bridgeObjectRetain();
  uint64_t v8 = (void *)sub_24D196090();
  sub_24D195CB0();
  swift_bridgeObjectRelease();

  uint64_t v9 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  return v9;
}

uint64_t sub_24D17E5C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6 = nm_dyld_get_uuid_for_header();
  if (v6)
  {
    unint64_t v7 = v6;
    uint64_t v8 = sub_24D195E10();
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v10 = 0;
  }
  swift_beginAccess();
  *(void *)(a5 + 16) = v8;
  *(void *)(a5 + 24) = v10;
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_24D17E648()
{
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)&long long v37 = *(void *)(v0 + 16);
  *((void *)&v37 + 1) = v1;
  uint64_t v39 = 47;
  unint64_t v40 = 0xE100000000000000;
  sub_24D1757BC();
  uint64_t result = sub_24D1960C0();
  uint64_t v3 = *(void *)(result + 16);
  if (!v3)
  {
    __break(1u);
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  uint64_t v4 = result;
  uint64_t v5 = result + 32;
  id v6 = (void *)(result + 32 + 16 * (v3 - 1));
  uint64_t v7 = v6[1];
  *(void *)&long long v37 = *v6;
  *((void *)&v37 + 1) = v7;
  uint64_t v39 = 0x6F77656D6172662ELL;
  unint64_t v40 = 0xEA00000000006B72;
  uint64_t v8 = MEMORY[0x263F8D310];
  uint64_t result = sub_24D196100();
  if (result) {
    goto LABEL_6;
  }
  uint64_t v9 = v6[1];
  *(void *)&long long v37 = *v6;
  *((void *)&v37 + 1) = v9;
  uint64_t v39 = 1886413102;
  unint64_t v40 = 0xE400000000000000;
  uint64_t result = sub_24D196100();
  if (result) {
    goto LABEL_6;
  }
  uint64_t v10 = v6[1];
  *(void *)&long long v37 = *v6;
  *((void *)&v37 + 1) = v10;
  uint64_t v39 = 0x69736E657478652ELL;
  unint64_t v40 = 0xEA00000000006E6FLL;
  uint64_t result = sub_24D196100();
  if ((result & 1) != 0
    || (uint64_t v11 = v6[1],
        *(void *)&long long v37 = *v6,
        *((void *)&v37 + 1) = v11,
        uint64_t v39 = 0x6E6967756C702ELL,
        unint64_t v40 = 0xE700000000000000,
        uint64_t result = sub_24D196100(),
        (result & 1) != 0))
  {
LABEL_6:
    if (*(void *)(v4 + 16) >= (unint64_t)v3)
    {
      *(void *)&long long v37 = v4;
      *((void *)&v37 + 1) = v5;
      *((void *)&v38 + 1) = (2 * v3) | 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26985A208);
      sub_24D182B64();
      sub_24D195DC0();
      swift_bridgeObjectRelease();
      id v12 = objc_allocWithZone(MEMORY[0x263F086E0]);
      uint64_t v13 = (void *)sub_24D195DE0();
      swift_bridgeObjectRelease();
      id v14 = objc_msgSend(v12, sel_initWithPath_, v13, v37, 0);

      if (!v14) {
        goto LABEL_28;
      }
      id v15 = objc_msgSend(v14, sel_infoDictionary);
      if (v15)
      {
        unint64_t v16 = v15;
        uint64_t v17 = sub_24D195DA0();

        if (*(void *)(v17 + 16) && (unint64_t v18 = sub_24D183934(0xD00000000000001ALL, 0x800000024D1980E0), (v19 & 1) != 0))
        {
          sub_24D178708(*(void *)(v17 + 56) + 32 * v18, (uint64_t)&v37);
        }
        else
        {
          long long v37 = 0u;
          long long v38 = 0u;
        }
        swift_bridgeObjectRelease();
        if (*((void *)&v38 + 1))
        {
          if (swift_dynamicCast())
          {
            uint64_t v20 = v39;
            unint64_t v21 = v40;

LABEL_29:
            sub_24D195FC0();
            __swift_instantiateConcreteTypeFromMangledName(&qword_269859FE8);
            uint64_t v27 = swift_allocObject();
            *(_OWORD *)(v27 + 16) = xmmword_24D196C10;
            *(void *)(v27 + 56) = v8;
            *(void *)(v27 + 64) = sub_24D177760();
            uint64_t v28 = 7104878;
            if (v21) {
              uint64_t v28 = v20;
            }
            unint64_t v29 = 0xE300000000000000;
            if (v21) {
              unint64_t v29 = v21;
            }
            *(void *)(v27 + 32) = v28;
            *(void *)(v27 + 40) = v29;
            sub_24D178CF8();
            swift_bridgeObjectRetain();
            double v30 = (void *)sub_24D196090();
            sub_24D195CB0();
            swift_bridgeObjectRelease();

            return v20;
          }
LABEL_18:
          id v22 = objc_msgSend(v14, sel_infoDictionary, v37, (void)v38);
          if (v22)
          {
            unint64_t v23 = v22;
            uint64_t v24 = sub_24D195DA0();

            if (*(void *)(v24 + 16)
              && (unint64_t v25 = sub_24D183934(0x656C646E75424643, 0xEF6E6F6973726556), (v26 & 1) != 0))
            {
              sub_24D178708(*(void *)(v24 + 56) + 32 * v25, (uint64_t)&v37);
            }
            else
            {
              long long v37 = 0u;
              long long v38 = 0u;
            }

            swift_bridgeObjectRelease();
            if (*((void *)&v38 + 1))
            {
              if (swift_dynamicCast())
              {
                uint64_t v20 = v39;
                unint64_t v21 = v40;
                goto LABEL_29;
              }
LABEL_28:
              uint64_t v20 = 0;
              unint64_t v21 = 0;
              goto LABEL_29;
            }
          }
          else
          {

            long long v37 = 0u;
            long long v38 = 0u;
          }
          sub_24D182BD0((uint64_t)&v37, &qword_26985A090);
          goto LABEL_28;
        }
      }
      else
      {
        long long v37 = 0u;
        long long v38 = 0u;
      }
      sub_24D182BD0((uint64_t)&v37, &qword_26985A090);
      goto LABEL_18;
    }
    goto LABEL_45;
  }
  if (v3 == 1)
  {
LABEL_43:
    swift_bridgeObjectRelease();
    goto LABEL_28;
  }
  uint64_t v31 = (uint64_t *)(v4 + 16 * v3-- + 8);
  while (1)
  {
    unint64_t v32 = v3 - 1;
    if (v3 < 1) {
      break;
    }
    if (v32 >= *(void *)(v4 + 16)) {
      goto LABEL_47;
    }
    uint64_t v33 = *v31;
    *(void *)&long long v37 = *(v31 - 1);
    *((void *)&v37 + 1) = v33;
    uint64_t v39 = 0x6F77656D6172662ELL;
    unint64_t v40 = 0xEA00000000006B72;
    uint64_t result = sub_24D196100();
    if (result) {
      goto LABEL_6;
    }
    uint64_t v34 = *v31;
    *(void *)&long long v37 = *(v31 - 1);
    *((void *)&v37 + 1) = v34;
    uint64_t v39 = 1886413102;
    unint64_t v40 = 0xE400000000000000;
    uint64_t result = sub_24D196100();
    if (result) {
      goto LABEL_6;
    }
    uint64_t v35 = *v31;
    *(void *)&long long v37 = *(v31 - 1);
    *((void *)&v37 + 1) = v35;
    uint64_t v39 = 0x69736E657478652ELL;
    unint64_t v40 = 0xEA00000000006E6FLL;
    uint64_t result = sub_24D196100();
    if (result) {
      goto LABEL_6;
    }
    uint64_t v36 = *v31;
    *(void *)&long long v37 = *(v31 - 1);
    *((void *)&v37 + 1) = v36;
    uint64_t v39 = 0x6E6967756C702ELL;
    unint64_t v40 = 0xE700000000000000;
    uint64_t result = sub_24D196100();
    if (result) {
      goto LABEL_6;
    }
    v31 -= 2;
    --v3;
    if (!v32) {
      goto LABEL_43;
    }
  }
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
  return result;
}

uint64_t sub_24D17EC58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = a5;
  v10[3] = a6;
  v10[4] = a1;
  v13[4] = sub_24D182B58;
  v13[5] = v10;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 1107296256;
  v13[2] = sub_24D17FA40;
  v13[3] = &block_descriptor_54;
  uint64_t v11 = _Block_copy(v13);
  swift_retain();
  swift_retain();
  swift_release();
  nm_macho_for_each_imported_symbol(a1, a3, v11);
  _Block_release(v11);
  return 1;
}

uint64_t sub_24D17ED54(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, void *a6, mach_header *a7)
{
  uint64_t v11 = sub_24D195E90();
  uint64_t v13 = v12;
  uint64_t v14 = sub_24D195E90();
  uint64_t v16 = v15;
  uint64_t v17 = CSDemangleSymbolName();
  if (v17)
  {
    uint64_t v18 = v17;
    swift_bridgeObjectRelease();
    uint64_t v14 = sub_24D195E90();
    uint64_t v16 = v19;
    MEMORY[0x253320910](v18, -1, -1);
  }
  if (sub_24D17DF20() & 1) != 0 || (sub_24D17DF20())
  {
    mh = a7;
    sub_24D195FC0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269859FE8);
    uint64_t v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_24D196FC0;
    uint64_t v21 = MEMORY[0x263F8D310];
    *(void *)(v20 + 56) = MEMORY[0x263F8D310];
    unint64_t v22 = sub_24D177760();
    uint64_t v109 = v14;
    *(void *)(v20 + 32) = v14;
    *(void *)(v20 + 40) = v16;
    *(void *)(v20 + 96) = v21;
    *(void *)(v20 + 104) = v22;
    *(void *)(v20 + 64) = v22;
    *(void *)(v20 + 72) = v11;
    uint64_t v148 = v11;
    *(void *)(v20 + 80) = v13;
    uint64_t v23 = MEMORY[0x263F8D530];
    *(void *)(v20 + 136) = MEMORY[0x263F8D4F8];
    *(void *)(v20 + 144) = v23;
    *(unsigned char *)(v20 + 112) = a3 & 1;
    sub_24D178CF8();
    uint64_t v110 = v16;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v24 = (void *)sub_24D196090();
    sub_24D195CB0();
    swift_bridgeObjectRelease();

    uint64_t v25 = a6[2];
    uint64_t v26 = a6[3];
    swift_beginAccess();
    uint64_t v27 = a6[6];
    uint64_t v150 = v13;
    uint64_t v106 = a5;
    id v146 = a6 + 6;
    if (*(void *)(v27 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v28 = sub_24D183934(v25, v26);
      if (v29)
      {
        double v30 = (uint64_t *)(*(void *)(v27 + 56) + 120 * v28);
        uint64_t v31 = v30[2];
        uint64_t v131 = v30[5];
        uint64_t v132 = *v30;
        unint64_t v130 = v30[6];
        uint64_t v141 = v30[3];
        uint64_t v136 = v30[1];
        swift_bridgeObjectRetain();
        sub_24D177B0C(v31, v141);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v136)
        {
          uint64_t v32 = v148;
          if (v141)
          {
            swift_bridgeObjectRetain();
            sub_24D17DD90(v132, v136, v31, v141);
          }
          else
          {
            sub_24D17DD90(v132, v136, v31, 0);
            unint64_t v130 = 0xE000000000000000;
            uint64_t v131 = 0;
          }
LABEL_15:
          uint64_t v111 = 0x6E776F6E6B6E75;
          uint64_t v112 = 0x6534366D7261;
          uint64_t v34 = a6[6];
          if (*(void *)(v34 + 16))
          {
            uint64_t v35 = a6[2];
            uint64_t v36 = a6[3];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            unint64_t v37 = sub_24D183934(v35, v36);
            if (v38)
            {
              uint64_t v143 = a6;
              uint64_t v39 = (uint64_t *)(*(void *)(v34 + 56) + 120 * v37);
              uint64_t v137 = *v39;
              uint64_t v152 = v39[1];
              uint64_t v41 = v39[2];
              uint64_t v40 = v39[3];
              uint64_t v42 = v39[4];
              unint64_t v121 = v39[6];
              uint64_t v122 = v39[5];
              unint64_t v119 = v39[8];
              uint64_t v120 = v39[7];
              unint64_t v43 = v39[10];
              uint64_t v133 = v39[9];
              uint64_t v44 = v39[11];
              unint64_t v45 = v39[12];
              uint64_t v47 = v39[13];
              unint64_t v46 = v39[14];
              swift_bridgeObjectRetain();
              unint64_t v142 = v46;
              uint64_t v124 = v47;
              unint64_t v125 = v45;
              uint64_t v140 = v44;
              unint64_t v114 = v43;
              uint64_t v115 = v41;
              unint64_t v113 = v40;
              sub_24D177B0C(v41, v40);
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if (v152)
              {
                sub_24D177B0C(v41, v40);
                sub_24D17DD90(v137, v152, v41, v40);
                unint64_t v48 = v146;
                if (v113)
                {
                  uint64_t v32 = v148;
                  a6 = v143;
                  goto LABEL_28;
                }
                uint64_t v49 = v41;
                uint64_t v32 = v148;
              }
              else
              {
                uint64_t v49 = 0;
                unint64_t v48 = v146;
                uint64_t v32 = v148;
              }
              a6 = v143;
LABEL_27:
              sub_24D17DA54(v49, 0);
              unint64_t v142 = 0xE600000000000000;
              LOBYTE(v42) = 5;
              unint64_t v113 = 0xE700000000000000;
              uint64_t v115 = 0x6E776F6E6B6E75;
              uint64_t v122 = 0x6E776F6E6B6E75;
              uint64_t v120 = 0x6E776F6E6B6E75;
              unint64_t v121 = 0xE700000000000000;
              unint64_t v119 = 0xE700000000000000;
              uint64_t v133 = 0x6E776F6E6B6E75;
              unint64_t v114 = 0xE700000000000000;
              uint64_t v140 = 0x6E776F6E6B6E75;
              uint64_t v124 = 0x6534366D7261;
              unint64_t v125 = 0xE700000000000000;
LABEL_28:
              uint64_t v50 = a6[6];
              char v105 = v42;
              if (*(void *)(v50 + 16))
              {
                uint64_t v51 = a6[2];
                uint64_t v52 = a6[3];
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                unint64_t v53 = sub_24D183934(v51, v52);
                if (v54)
                {
                  uint64_t v55 = (uint64_t *)(*(void *)(v50 + 56) + 120 * v53);
                  uint64_t v101 = *v55;
                  uint64_t v102 = v55[1];
                  uint64_t v104 = v55[2];
                  uint64_t v153 = v55[3];
                  uint64_t v128 = v55[4];
                  unint64_t v56 = v55[6];
                  uint64_t v144 = v55[5];
                  unint64_t v57 = v55[8];
                  uint64_t v126 = v55[7];
                  uint64_t v59 = v55[9];
                  unint64_t v58 = v55[10];
                  uint64_t v61 = v55[11];
                  unint64_t v60 = v55[12];
                  uint64_t v62 = v55[13];
                  uint64_t v63 = v55[14];
                  swift_bridgeObjectRetain();
                  unint64_t v138 = v63;
                  uint64_t v103 = v62;
                  unint64_t v116 = v58;
                  uint64_t v117 = v59;
                  unint64_t v118 = v57;
                  sub_24D177B0C(v104, v153);
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  uint64_t v64 = v150;
                  if (v102)
                  {
                    unint64_t v65 = v56;
                    uint64_t v66 = v126;
                    sub_24D177B0C(v104, v153);
                    char v67 = v128;
                    sub_24D17DD90(v101, v102, v104, v153);
                    unint64_t v48 = v146;
                    uint64_t v68 = v144;
                    if (v153)
                    {
                      unint64_t v69 = v153;
                      uint64_t v70 = v150;
                      uint64_t v111 = v104;
                      uint64_t v112 = v103;
                      uint64_t v32 = v148;
                      uint64_t v72 = v61;
                      unint64_t v71 = v138;
                      unint64_t v73 = v60;
                      goto LABEL_37;
                    }
                    uint64_t v32 = v148;
                    uint64_t v74 = v104;
                  }
                  else
                  {
                    uint64_t v74 = 0;
                    unint64_t v48 = v146;
                    uint64_t v32 = v148;
                  }
LABEL_36:
                  uint64_t v70 = v64;
                  sub_24D17DA54(v74, 0);
                  unint64_t v71 = 0xE600000000000000;
                  char v67 = 5;
                  unint64_t v69 = 0xE700000000000000;
                  uint64_t v68 = 0x6E776F6E6B6E75;
                  unint64_t v65 = 0xE700000000000000;
                  uint64_t v66 = 0x6E776F6E6B6E75;
                  unint64_t v118 = 0xE700000000000000;
                  uint64_t v117 = 0x6E776F6E6B6E75;
                  unint64_t v116 = 0xE700000000000000;
                  uint64_t v72 = 0x6E776F6E6B6E75;
                  unint64_t v73 = 0xE700000000000000;
LABEL_37:
                  uint64_t v75 = *v48;
                  if (*(void *)(*v48 + 16))
                  {
                    uint64_t v145 = v68;
                    unint64_t v154 = v69;
                    unint64_t v134 = v73;
                    uint64_t v135 = v72;
                    unint64_t v139 = v71;
                    char v129 = v67;
                    swift_bridgeObjectRetain();
                    unint64_t v76 = sub_24D183934(v32, v70);
                    if (v77)
                    {
                      uint64_t v127 = v66;
                      unint64_t v123 = v65;
                      uint64_t v78 = (void **)(v106 + 16);
                      uint64_t v79 = (uint64_t *)(*(void *)(v75 + 56) + 120 * v76);
                      uint64_t v80 = v79[2];
                      uint64_t v81 = v79[3];
                      uint64_t v97 = v79[4];
                      uint64_t v98 = *v79;
                      uint64_t v95 = v79[6];
                      uint64_t v96 = v79[5];
                      uint64_t v82 = v79[9];
                      uint64_t v147 = v79[7];
                      uint64_t v149 = v79[8];
                      uint64_t v83 = v79[10];
                      uint64_t v84 = v79[11];
                      uint64_t v86 = v79[12];
                      uint64_t v85 = v79[13];
                      uint64_t v87 = v79[14];
                      uint64_t v107 = v79[1];
                      swift_bridgeObjectRetain();
                      uint64_t v99 = v87;
                      uint64_t v100 = v84;
                      sub_24D177B0C(v80, v81);
                      swift_bridgeObjectRelease();
                      swift_bridgeObjectRelease();
                      nm_macho_arch_name_for_mach_header(mh);
                      uint64_t v88 = sub_24D195E90();
                      uint64_t v151 = v89;
                      swift_beginAccess();
                      uint64_t v90 = *v78;
                      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                      *uint64_t v78 = v90;
                      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
                      {
                        uint64_t v90 = sub_24D18A220(0, v90[2] + 1, 1, v90);
                        *uint64_t v78 = v90;
                      }
                      unint64_t v93 = v90[2];
                      unint64_t v92 = v90[3];
                      if (v93 >= v92 >> 1)
                      {
                        uint64_t v90 = sub_24D18A220((void *)(v92 > 1), v93 + 1, 1, v90);
                        *uint64_t v78 = v90;
                      }
                      v90[2] = v93 + 1;
                      id v94 = &v90[54 * v93];
                      v94[4] = v109;
                      v94[5] = v110;
                      v94[8] = v131;
                      v94[9] = v130;
                      v94[10] = v115;
                      v94[11] = v113;
                      *((unsigned char *)v94 + 96) = v105;
                      v94[13] = v122;
                      v94[14] = v121;
                      v94[15] = v120;
                      v94[16] = v119;
                      v94[17] = v133;
                      v94[18] = v114;
                      v94[19] = v140;
                      v94[20] = v125;
                      v94[21] = v124;
                      v94[22] = v142;
                      *(_DWORD *)((char *)v94 + 97) = *(_DWORD *)v156;
                      *((_DWORD *)v94 + 25) = *(_DWORD *)&v156[3];
                      v94[6] = 0;
                      v94[7] = 0xE000000000000000;
                      v94[23] = v111;
                      v94[24] = v154;
                      *((unsigned char *)v94 + 200) = v129;
                      *((_DWORD *)v94 + 51) = *(_DWORD *)&v155[3];
                      *(_DWORD *)((char *)v94 + 201) = *(_DWORD *)v155;
                      v94[26] = v145;
                      v94[27] = v123;
                      v94[28] = v127;
                      v94[29] = v118;
                      v94[30] = v117;
                      v94[31] = v116;
                      v94[32] = v135;
                      v94[33] = v134;
                      v94[34] = v112;
                      v94[35] = v139;
                      v94[36] = v98;
                      v94[37] = v107;
                      v94[38] = v80;
                      v94[39] = v81;
                      v94[40] = v97;
                      v94[41] = v96;
                      v94[42] = v95;
                      v94[43] = v147;
                      v94[44] = v149;
                      v94[45] = v82;
                      v94[46] = v83;
                      v94[47] = v100;
                      v94[48] = v86;
                      v94[49] = v85;
                      v94[50] = v99;
                      v94[51] = v88;
                      v94[52] = v151;
                      v94[53] = 1;
                      v94[54] = 0;
                      v94[55] = 0xE000000000000000;
                      v94[56] = 0;
                      v94[57] = 0xE000000000000000;
                      return swift_endAccess();
                    }
                  }
                  else
                  {
                    swift_bridgeObjectRelease();
                    __break(1u);
                  }
                  swift_bridgeObjectRelease();
                  uint64_t result = swift_bridgeObjectRelease();
                  __break(1u);
                  return result;
                }
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                uint64_t v74 = 0;
                unint64_t v48 = v146;
                uint64_t v32 = v148;
              }
              else
              {
                uint64_t v74 = 0;
              }
              uint64_t v64 = v150;
              goto LABEL_36;
            }
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v49 = 0;
          }
          else
          {
            uint64_t v49 = 0;
          }
          unint64_t v48 = a6 + 6;
          goto LABEL_27;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
    }
    unint64_t v130 = 0xE000000000000000;
    uint64_t v131 = 0;
    uint64_t v32 = v148;
    goto LABEL_15;
  }
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24D17FA40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v9(a2, a3, a4, a5);

  return swift_release();
}

void sub_24D17FAB8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v30 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  uint64_t v29 = sub_24D17E3C8();
  unint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unsigned __int8 v28 = sub_24D18633C();
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  uint64_t v27 = sub_24D1957E4(v5);
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v8 = (void *)sub_24D195DE0();
  swift_bridgeObjectRelease();
  id v9 = nm_extractTeamID(v8);

  if (v9)
  {
    uint64_t v10 = sub_24D195E10();
    unint64_t v12 = v11;
  }
  else
  {
    uint64_t v10 = 0;
    unint64_t v12 = 0xE000000000000000;
  }
  swift_bridgeObjectRetain();
  uint64_t v13 = (void *)sub_24D195DE0();
  swift_bridgeObjectRelease();
  id v14 = nm_extractCDHash(v13);

  if (v14)
  {
    uint64_t v15 = sub_24D195E10();
    unint64_t v17 = v16;
  }
  else
  {
    uint64_t v15 = 0;
    unint64_t v17 = 0xE000000000000000;
  }
  uint64_t v18 = sub_24D17E648();
  v33[0] = 0;
  v33[1] = 0xE000000000000000;
  uint64_t v20 = v29;
  if (v4)
  {
    unint64_t v21 = v4;
  }
  else
  {
    uint64_t v20 = 0;
    unint64_t v21 = 0xE000000000000000;
  }
  if (v19) {
    uint64_t v22 = v18;
  }
  else {
    uint64_t v22 = 0;
  }
  if (v19) {
    unint64_t v23 = v19;
  }
  else {
    unint64_t v23 = 0xE000000000000000;
  }
  v33[2] = v20;
  v33[3] = v21;
  v33[4] = v28;
  v33[5] = v27;
  v33[6] = v7;
  v33[7] = v10;
  v33[8] = v12;
  v33[9] = v15;
  v33[10] = v17;
  v33[11] = v22;
  v33[12] = v23;
  long long v34 = xmmword_24D196EF0;
  swift_beginAccess();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v32 = *(void *)(v1 + 48);
  *(void *)(v1 + 48) = 0x8000000000000000;
  sub_24D184F48((uint64_t)v33, v30, v2, isUniquelyReferenced_nonNull_native);
  *(void *)(v1 + 48) = v32;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_bridgeObjectRetain();
  uint64_t v25 = (void *)sub_24D195DE0();
  swift_bridgeObjectRelease();
  aBlock[4] = sub_24D182BC0;
  aBlock[5] = v1;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24D17E354;
  aBlock[3] = &block_descriptor_65;
  uint64_t v26 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  nm_macho_for_each_slice(v25, v26);
  _Block_release(v26);
}

uint64_t sub_24D17FDA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v9[4] = sub_24D182BC8;
  v9[5] = a5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = sub_24D180020;
  v9[3] = &block_descriptor_68;
  uint64_t v7 = _Block_copy(v9);
  swift_retain();
  swift_release();
  nm_macho_for_each_dependent_dylib(a1, a3, v7);
  _Block_release(v7);
  return 1;
}

uint64_t sub_24D17FE74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = sub_24D195E90();
  uint64_t v7 = v6;
  sub_24D195FC0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269859FE8);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_24D196C10;
  *(void *)(v8 + 56) = MEMORY[0x263F8D310];
  *(void *)(v8 + 64) = sub_24D177760();
  *(void *)(v8 + 32) = v5;
  *(void *)(v8 + 40) = v7;
  sub_24D178CF8();
  swift_bridgeObjectRetain();
  id v9 = (void *)sub_24D196090();
  sub_24D195CB0();
  swift_bridgeObjectRelease();

  swift_beginAccess();
  if (*(void *)(*(void *)(a4 + 48) + 16))
  {
    swift_bridgeObjectRetain();
    sub_24D183934(v5, v7);
    char v11 = v10;
    swift_bridgeObjectRelease();
    if (v11) {
      return swift_bridgeObjectRelease();
    }
  }
  sub_24D180090(v5, v7, v15);
  swift_beginAccess();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v14 = *(void *)(a4 + 48);
  *(void *)(a4 + 48) = 0x8000000000000000;
  sub_24D184F48((uint64_t)v15, v5, v7, isUniquelyReferenced_nonNull_native);
  *(void *)(a4 + 48) = v14;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t sub_24D180020(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v7(a2, a3, a4);

  return swift_release();
}

uint64_t sub_24D180090@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_24D195BD0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  char v11 = (char *)&v103 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t aBlock = a1;
  uint64_t v126 = a2;
  uint64_t v123 = 0x687461707240;
  unint64_t v124 = 0xE600000000000000;
  sub_24D1757BC();
  char v12 = sub_24D196100();
  uint64_t v113 = a2;
  uint64_t v114 = a1;
  uint64_t v104 = a3;
  if (v12)
  {
    swift_beginAccess();
    uint64_t v13 = *(void *)(v3 + 56);
    unint64_t v112 = *(void *)(v13 + 16);
    if (v112)
    {
      unint64_t v110 = (unint64_t)v11;
      uint64_t v111 = v8;
      id v116 = self;
      uint64_t v109 = v13 + 32;
      id v108 = (void (**)(unint64_t, uint64_t))(v9 + 8);
      uint64_t v103 = v13;
      swift_bridgeObjectRetain();
      uint64_t v14 = 0;
      unint64_t v105 = (unint64_t)"yPath: %@, weakImport: %d";
      unint64_t v107 = 0x800000024D198C00;
      uint64_t v106 = v4;
      while (1)
      {
        unint64_t v15 = *(void *)(v109 + 16 * v14 + 8);
        uint64_t v121 = *(void *)(v109 + 16 * v14);
        unint64_t v122 = v15;
        unint64_t v119 = 0xD000000000000010;
        unint64_t v120 = v107;
        unint64_t v115 = v15;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        unint64_t v16 = v110;
        sub_24D195B80();
        uint64_t v17 = sub_24D195B60();
        (*v108)(v16, v111);
        uint64_t v18 = *(void *)(v17 + 16);
        if (v18)
        {
          uint64_t v19 = 0;
          while (1)
          {
            uint64_t v20 = v17 + 8 * v19;
            uint64_t v22 = *(void *)(v20 + 32);
            uint64_t v21 = *(void *)(v20 + 40);
            uint64_t aBlock = v22;
            uint64_t v126 = v21;
            uint64_t v117 = 1886413102;
            unint64_t v118 = 0xE400000000000000;
            if (sub_24D196100()) {
              break;
            }
            v19 += 2;
            if (!--v18) {
              goto LABEL_8;
            }
          }
          uint64_t aBlock = v17;
          uint64_t v126 = v17 + 32;
          uint64_t v127 = 0;
          uint64_t v128 = (void *)(v19 + 3);
          __swift_instantiateConcreteTypeFromMangledName(&qword_26985A208);
          sub_24D182B64();
          sub_24D195DC0();
          swift_bridgeObjectRelease();
        }
        else
        {
LABEL_8:
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
        }
        id v23 = objc_msgSend(v116, sel_defaultManager);
        uint64_t v24 = (void *)sub_24D195DE0();
        unsigned __int8 v25 = objc_msgSend(v23, sel_fileExistsAtPath_, v24);

        if ((v25 & 1) == 0) {
          break;
        }
        id v26 = objc_allocWithZone(MEMORY[0x263F086E0]);
        uint64_t v27 = (void *)sub_24D195DE0();
        swift_bridgeObjectRelease();
        id v28 = objc_msgSend(v26, sel_initWithPath_, v27);

        if (!v28) {
          goto LABEL_15;
        }
        id v29 = objc_msgSend(v28, sel_executablePath);
        uint64_t v30 = v113;
        if (v29)
        {
          uint64_t v31 = v29;
          sub_24D195E10();
          swift_bridgeObjectRelease();

          uint64_t v32 = (void *)sub_24D195DE0();
          id v33 = objc_msgSend(v32, sel_stringByDeletingLastPathComponent);
          uint64_t v34 = sub_24D195E10();
          unint64_t v36 = v35;
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease();

          unint64_t v36 = v105 | 0x8000000000000000;
          uint64_t v34 = 0xD000000000000010;
        }
        uint64_t v37 = v114;
LABEL_18:
        uint64_t aBlock = v34;
        uint64_t v126 = v36;
        uint64_t v38 = sub_24D1960E0();
        unint64_t v40 = v39;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t aBlock = v37;
        uint64_t v126 = v30;
        uint64_t v121 = 0x687461707240;
        unint64_t v122 = 0xE600000000000000;
        unint64_t v119 = v38;
        unint64_t v120 = v40;
        uint64_t v41 = sub_24D1960E0();
        uint64_t v43 = v42;
        swift_bridgeObjectRelease();
        id v44 = objc_msgSend(v116, sel_defaultManager);
        unint64_t v45 = (void *)sub_24D195DE0();
        LODWORD(v40) = objc_msgSend(v44, sel_fileExistsAtPath_, v45);

        if (v40)
        {
          swift_bridgeObjectRelease();
          type metadata accessor for MachOParser();
          uint64_t v68 = (void *)swift_allocObject();
          swift_bridgeObjectRetain();
          uint64_t v69 = MEMORY[0x263F8EE78];
          v68[6] = sub_24D176544(MEMORY[0x263F8EE78]);
          v68[7] = v69;
          v68[2] = v41;
          v68[3] = v43;
          v68[4] = sub_24D17A1B0;
          v68[5] = 0;
          swift_bridgeObjectRetain();
          uint64_t v70 = (void *)sub_24D195DE0();
          swift_bridgeObjectRelease();
          char v129 = sub_24D17D7C8;
          unint64_t v130 = v68;
          uint64_t aBlock = MEMORY[0x263EF8330];
          uint64_t v126 = 1107296256;
          uint64_t v127 = sub_24D17E354;
          uint64_t v128 = &block_descriptor_62_0;
          unint64_t v71 = _Block_copy(&aBlock);
          swift_retain();
          swift_release();
          nm_macho_for_each_slice(v70, v71);
          _Block_release(v71);

          uint64_t v72 = sub_24D17E3C8();
          if (v73) {
            uint64_t v74 = v72;
          }
          else {
            uint64_t v74 = 0;
          }
          unint64_t v75 = 0xE000000000000000;
          if (v73) {
            unint64_t v76 = v73;
          }
          else {
            unint64_t v76 = (void *)0xE000000000000000;
          }
          unsigned __int8 v77 = sub_24D18633C();
          swift_bridgeObjectRetain();
          uint64_t v78 = (void *)sub_24D195DE0();
          swift_bridgeObjectRelease();
          id v79 = nm_extractTeamID(v78);

          id v116 = v76;
          if (v79)
          {
            uint64_t v109 = sub_24D195E10();
            unint64_t v75 = v80;
          }
          else
          {
            uint64_t v109 = 0;
          }
          swift_bridgeObjectRetain();
          uint64_t v81 = (void *)sub_24D195DE0();
          swift_bridgeObjectRelease();
          id v82 = nm_extractCDHash(v81);

          unint64_t v63 = v75;
          uint64_t v61 = v74;
          if (v82)
          {
            uint64_t v111 = sub_24D195E10();
            unint64_t v110 = v83;
          }
          else
          {
            uint64_t v111 = 0;
            unint64_t v110 = 0xE000000000000000;
          }
          unsigned __int8 v62 = v77;
          uint64_t v84 = sub_24D17E648();
          unint64_t v86 = v85;
          swift_release();
          if (v86) {
            uint64_t v87 = v84;
          }
          else {
            uint64_t v87 = 0;
          }
          unint64_t v115 = v87;
          if (v86) {
            unint64_t v88 = v86;
          }
          else {
            unint64_t v88 = 0xE000000000000000;
          }
          unint64_t v112 = v88;
          unint64_t v67 = 0xE600000000000000;
          uint64_t v66 = 0x6534366D7261;
          uint64_t v59 = v109;
          goto LABEL_64;
        }
        ++v14;
        swift_bridgeObjectRelease();
        if (v14 == v112)
        {
          swift_bridgeObjectRelease();
          goto LABEL_30;
        }
      }
      swift_bridgeObjectRelease();
LABEL_15:
      swift_bridgeObjectRelease();
      unint64_t v36 = v105 | 0x8000000000000000;
      uint64_t v34 = 0xD000000000000010;
      uint64_t v30 = v113;
      uint64_t v37 = v114;
      goto LABEL_18;
    }
    goto LABEL_30;
  }
  if (!a1 && a2 == 0xE000000000000000
    || (sub_24D196250() & 1) != 0
    || (id v46 = objc_msgSend(self, sel_defaultManager),
        uint64_t v47 = (void *)sub_24D195DE0(),
        unsigned int v48 = objc_msgSend(v46, sel_fileExistsAtPath_, v47),
        v46,
        v47,
        !v48))
  {
LABEL_30:
    uint64_t v61 = 0;
    unint64_t v115 = 0;
    id v116 = 0;
    unsigned __int8 v62 = 0;
    uint64_t v41 = 0;
    uint64_t v43 = 0;
    uint64_t v59 = 0;
    unint64_t v63 = 0;
    uint64_t v64 = 0;
    unint64_t v65 = 0;
    unint64_t v112 = 0;
    uint64_t v66 = 0;
    unint64_t v67 = 0;
    goto LABEL_65;
  }
  type metadata accessor for MachOParser();
  uint64_t v49 = (void *)swift_allocObject();
  swift_bridgeObjectRetain();
  uint64_t v50 = MEMORY[0x263F8EE78];
  v49[6] = sub_24D176544(MEMORY[0x263F8EE78]);
  v49[7] = v50;
  v49[2] = a1;
  v49[3] = a2;
  v49[4] = sub_24D17A1B0;
  v49[5] = 0;
  swift_bridgeObjectRetain();
  uint64_t v51 = (void *)sub_24D195DE0();
  swift_bridgeObjectRelease();
  char v129 = sub_24D17D7C8;
  unint64_t v130 = v49;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v126 = 1107296256;
  uint64_t v127 = sub_24D17E354;
  uint64_t v128 = &block_descriptor_58_0;
  uint64_t v52 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  nm_macho_for_each_slice(v51, v52);
  _Block_release(v52);

  uint64_t v53 = sub_24D17E3C8();
  uint64_t v55 = v54;
  if (v54) {
    uint64_t v56 = v53;
  }
  else {
    uint64_t v56 = 0;
  }
  uint64_t v109 = v56;
  id v108 = (void (**)(unint64_t, uint64_t))sub_24D18633C();
  swift_bridgeObjectRetain();
  unint64_t v57 = (void *)sub_24D195DE0();
  swift_bridgeObjectRelease();
  id v58 = nm_extractTeamID(v57);

  if (v58)
  {
    uint64_t v59 = sub_24D195E10();
    unint64_t v107 = v60;
  }
  else
  {
    uint64_t v59 = 0;
    unint64_t v107 = 0xE000000000000000;
  }
  swift_bridgeObjectRetain();
  uint64_t v89 = (void *)sub_24D195DE0();
  swift_bridgeObjectRelease();
  id v90 = nm_extractCDHash(v89);

  uint64_t v91 = v114;
  if (v90)
  {
    uint64_t v111 = sub_24D195E10();
    unint64_t v110 = v92;
  }
  else
  {
    uint64_t v111 = 0;
    unint64_t v110 = 0xE000000000000000;
  }
  uint64_t v93 = sub_24D17E648();
  unint64_t v95 = v94;
  swift_release();
  if (v95) {
    uint64_t v96 = v93;
  }
  else {
    uint64_t v96 = 0;
  }
  if (v95) {
    unint64_t v97 = v95;
  }
  else {
    unint64_t v97 = 0xE000000000000000;
  }
  unint64_t v112 = v97;
  if (v55) {
    uint64_t v98 = v55;
  }
  else {
    uint64_t v98 = (void *)0xE000000000000000;
  }
  unint64_t v115 = v96;
  id v116 = v98;
  swift_bridgeObjectRetain();
  unint64_t v67 = 0xE600000000000000;
  uint64_t v43 = a2;
  uint64_t v66 = 0x6534366D7261;
  uint64_t v41 = v91;
  uint64_t v61 = v109;
  unsigned __int8 v62 = v108;
  unint64_t v63 = v107;
LABEL_64:
  uint64_t v64 = v111;
  unint64_t v65 = v110;
LABEL_65:
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v100 = v104;
  uint64_t *v104 = v114;
  v100[1] = result;
  uint64_t v101 = (uint64_t)v116;
  v100[2] = v61;
  v100[3] = v101;
  v100[4] = v62;
  v100[5] = v41;
  v100[6] = v43;
  v100[7] = v59;
  v100[8] = v63;
  v100[9] = v64;
  unint64_t v102 = v115;
  v100[10] = v65;
  v100[11] = v102;
  v100[12] = v112;
  v100[13] = v66;
  v100[14] = v67;
  return result;
}

uint64_t sub_24D180C04()
{
  uint64_t v1 = MEMORY[0x263F8EE78];
  uint64_t v9 = MEMORY[0x263F8EE78];
  sub_24D17FAB8();
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v1;
  swift_bridgeObjectRetain();
  uint64_t v3 = (void *)sub_24D195DE0();
  swift_bridgeObjectRelease();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v2;
  *(void *)(v4 + 24) = v0;
  aBlock[4] = sub_24D182AFC;
  aBlock[5] = v4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24D17E354;
  aBlock[3] = &block_descriptor_48_0;
  uint64_t v5 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  nm_macho_for_each_slice(v3, v5);
  _Block_release(v5);

  swift_beginAccess();
  uint64_t v6 = *(void *)(v2 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  sub_24D180D74(v6);
  return v9;
}

uint64_t sub_24D180D74(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = sub_24D18A220(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = (unint64_t)&v3[54 * v8 + 4];
  if (a1 + 32 < v9 + 432 * v2 && v9 < a1 + 32 + 432 * v2) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = v3[2];
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_24D196210();
  __break(1u);
  return result;
}

uint64_t sub_24D180ED0()
{
  uint64_t v1 = v0;
  uint64_t v42 = sub_24D195E40();
  uint64_t v41 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  unint64_t v40 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = swift_allocObject();
  uint64_t v4 = MEMORY[0x263F8EE78];
  uint64_t v44 = v3;
  *(void *)(v3 + 16) = MEMORY[0x263F8EE78];
  uint64_t v43 = v3 + 16;
  uint64_t v5 = swift_allocObject();
  unint64_t v6 = sub_24D176738(v4);
  *(void *)(v5 + 16) = v6;
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v39 = *(void *)(v1 + 16);
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_24D17E3C8();
  unint64_t v10 = v9;
  swift_bridgeObjectRetain();
  int v38 = sub_24D18633C();
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(v1 + 16);
  swift_bridgeObjectRetain();
  uint64_t v37 = sub_24D1957E4(v11);
  uint64_t v36 = v12;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v13 = (void *)sub_24D195DE0();
  swift_bridgeObjectRelease();
  id v14 = nm_extractTeamID(v13);

  if (v14)
  {
    uint64_t v35 = sub_24D195E10();
    unint64_t v34 = v15;
  }
  else
  {
    uint64_t v35 = 0;
    unint64_t v34 = 0xE000000000000000;
  }
  swift_bridgeObjectRetain();
  unint64_t v16 = (void *)sub_24D195DE0();
  swift_bridgeObjectRelease();
  id v17 = nm_extractCDHash(v16);

  if (v17)
  {
    uint64_t v18 = sub_24D195E10();
    unint64_t v20 = v19;
  }
  else
  {
    uint64_t v18 = 0;
    unint64_t v20 = 0xE000000000000000;
  }
  if (!v10)
  {
    unint64_t v10 = 0xE000000000000000;
    uint64_t v8 = 0;
  }
  uint64_t v21 = sub_24D17E648();
  if (v22) {
    uint64_t v23 = v21;
  }
  else {
    uint64_t v23 = 0;
  }
  if (v22) {
    unint64_t v24 = v22;
  }
  else {
    unint64_t v24 = 0xE000000000000000;
  }
  v51[0] = v8;
  v51[1] = v10;
  char v52 = v38;
  uint64_t v53 = v37;
  uint64_t v54 = v36;
  uint64_t v55 = v35;
  unint64_t v56 = v34;
  uint64_t v57 = v18;
  unint64_t v58 = v20;
  uint64_t v59 = v23;
  unint64_t v60 = v24;
  long long v61 = xmmword_24D196EF0;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  unint64_t aBlock = v6;
  *(void *)(v5 + 16) = 0x8000000000000000;
  sub_24D184AC0((uint64_t)v51, v39, v7, isUniquelyReferenced_nonNull_native);
  *(void *)(v5 + 16) = aBlock;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v26 = *(void *)(v1 + 24);
  unint64_t aBlock = *(void *)(v1 + 16);
  uint64_t v46 = v26;
  swift_bridgeObjectRetain();
  uint64_t v27 = v40;
  sub_24D195E30();
  sub_24D1757BC();
  sub_24D1960F0();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v27, v42);
  swift_bridgeObjectRelease();
  id v28 = (void *)swift_allocObject();
  v28[2] = v1;
  v28[3] = v5;
  uint64_t v29 = v44;
  v28[4] = v44;
  uint64_t v49 = sub_24D182A18;
  uint64_t v50 = v28;
  unint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v46 = 1107296256;
  uint64_t v47 = sub_24D1826E8;
  unsigned int v48 = &block_descriptor_1;
  uint64_t v30 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  CSSymbolicatorForeachSymbolicatorWithPath();
  swift_bridgeObjectRelease();
  _Block_release(v30);
  swift_beginAccess();
  uint64_t v31 = *(void *)(v29 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  swift_release();
  return v31;
}

void sub_24D18135C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A180);
  MEMORY[0x270FA5388](v8 - 8);
  unint64_t v10 = (uint64_t *)((char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = *(uint64_t (**)(uint64_t))(a3 + 32);
  uint64_t v12 = swift_retain();
  LOBYTE(v11) = v11(v12);
  swift_release();
  if (v11)
  {
    sub_24D195FD0();
    sub_24D178CF8();
    uint64_t v13 = (void *)sub_24D196090();
    sub_24D195CB0();

    unsigned __int8 v27 = 0;
    uint64_t v14 = *(void *)(a3 + 16);
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_24D1957E4(v14);
    uint64_t v17 = v16;
    swift_bridgeObjectRelease();
    uint64_t *v10 = v15;
    v10[1] = v17;
    uint64_t v18 = type metadata accessor for TargetType(0);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v10, 0, 1, v18);
    uint64_t v19 = *(void *)(a3 + 16);
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_24D1957E4(v19);
    unint64_t v22 = v21;
    swift_bridgeObjectRelease();
    unsigned __int8 v26 = 4;
    long long aBlock = 0u;
    sub_24D18C314(&v27, (uint64_t)v10, 0, 1, v20, v22, 0, 0, 0, 0, 0, 0, &v26, 0xD000000000000042, 0x800000024D198940);
    swift_bridgeObjectRelease();
    sub_24D182BD0((uint64_t)v10, &qword_26985A180);
  }
  else
  {
    uint64_t v23 = (void *)swift_allocObject();
    v23[2] = a3;
    v23[3] = a4;
    v23[4] = a5;
    uint64_t v31 = sub_24D182A88;
    uint64_t v32 = v23;
    *(void *)&long long aBlock = MEMORY[0x263EF8330];
    *((void *)&aBlock + 1) = 1107296256;
    uint64_t v29 = sub_24D1826E8;
    uint64_t v30 = &block_descriptor_29;
    unint64_t v24 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_release();
    CSSymbolicatorForeachSymbolOwnerAtTime();
    _Block_release(v24);
  }
}

void sub_24D181654(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A180);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (uint64_t *)((char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = *(uint64_t (**)(uint64_t))(a3 + 32);
  uint64_t v14 = swift_retain();
  LOBYTE(v13) = v13(v14);
  swift_release();
  if (v13)
  {
    sub_24D195FD0();
    sub_24D178CF8();
    uint64_t v15 = (void *)sub_24D196090();
    sub_24D195CB0();

    unsigned __int8 v29 = 0;
    uint64_t v16 = *(void *)(a3 + 16);
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_24D1957E4(v16);
    uint64_t v19 = v18;
    swift_bridgeObjectRelease();
    *uint64_t v12 = v17;
    v12[1] = v19;
    uint64_t v20 = type metadata accessor for TargetType(0);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v12, 0, 1, v20);
    uint64_t v21 = *(void *)(a3 + 16);
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_24D1957E4(v21);
    unint64_t v24 = v23;
    swift_bridgeObjectRelease();
    unsigned __int8 v28 = 4;
    long long aBlock = 0u;
    sub_24D18C314(&v29, (uint64_t)v12, 0, 1, v22, v24, 0, 0, 0, 0, 0, 0, &v28, 0xD00000000000003FLL, 0x800000024D1989F0);
    swift_bridgeObjectRelease();
    sub_24D182BD0((uint64_t)v12, &qword_26985A180);
  }
  else
  {
    uint64_t v25 = (void *)swift_allocObject();
    v25[2] = a3;
    v25[3] = a1;
    v25[4] = a2;
    v25[5] = a4;
    v25[6] = a5;
    uint64_t v33 = sub_24D182ADC;
    unint64_t v34 = v25;
    *(void *)&long long aBlock = MEMORY[0x263EF8330];
    *((void *)&aBlock + 1) = 1107296256;
    uint64_t v31 = sub_24D1826E8;
    uint64_t v32 = &block_descriptor_35;
    unsigned __int8 v26 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_release();
    CSSymbolOwnerForeachSymbol();
    _Block_release(v26);
  }
}

uint64_t sub_24D18194C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v168 = a7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A180);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (uint64_t *)((char *)&v140 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = (uint64_t (*)(uint64_t))a3[4];
  uint64_t v13 = swift_retain();
  LOBYTE(v12) = v12(v13);
  swift_release();
  if (v12)
  {
    sub_24D195FD0();
    sub_24D178CF8();
    uint64_t v14 = (void *)sub_24D196090();
    sub_24D195CB0();

    LOBYTE(v172) = 0;
    uint64_t v15 = a3[2];
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_24D1957E4(v15);
    uint64_t v18 = v17;
    swift_bridgeObjectRelease();
    uint64_t *v11 = v16;
    v11[1] = v18;
    uint64_t v19 = type metadata accessor for TargetType(0);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v11, 0, 1, v19);
    uint64_t v20 = a3[2];
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_24D1957E4(v20);
    unint64_t v23 = v22;
    swift_bridgeObjectRelease();
    v171[0] = 4;
    long long aBlock = 0u;
    sub_24D18C314((unsigned __int8 *)&v172, (uint64_t)v11, 0, 1, v21, v23, 0, 0, 0, 0, 0, 0, v171, 0xD000000000000033, 0x800000024D198A90);
    swift_bridgeObjectRelease();
    return sub_24D182BD0((uint64_t)v11, &qword_26985A180);
  }
  uint64_t Name = CSSymbolGetName();
  uint64_t Path = CSSymbolOwnerGetPath();
  CSSymbolOwnerGetArchitecture();
  Familyuint64_t Name = CSArchitectureGetFamilyName();
  uint64_t CFUUIDBytes = CSSymbolOwnerGetCFUUIDBytes();
  uint64_t v29 = swift_slowAlloc();
  if (CFUUIDBytes && MEMORY[0x253320230](CFUUIDBytes, v29, 40))
  {
    uint64_t v30 = sub_24D195EA0();
    unint64_t v32 = v31;
    if (!Name) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v30 = 0;
    unint64_t v32 = 0xE000000000000000;
    if (!Name) {
      goto LABEL_13;
    }
  }
  if (!Path || !FamilyName)
  {
LABEL_13:
    return swift_bridgeObjectRelease();
  }
  uint64_t v166 = v30;
  uint64_t v158 = FamilyName;
  uint64_t v159 = Name;
  uint64_t v33 = (uint64_t *)(a6 + 16);
  uint64_t v34 = sub_24D195E90();
  uint64_t v36 = v35;
  uint64_t v37 = a3[3];
  uint64_t v167 = a3[2];
  swift_beginAccess();
  uint64_t v38 = *v33;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v39 = sub_24D195E90();
  if (!*(void *)(v38 + 16))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  sub_24D183934(v39, v40);
  char v42 = v41;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v42 & 1) == 0)
  {
LABEL_17:
    type metadata accessor for MachOParser();
    uint64_t v43 = (void *)swift_allocObject();
    swift_bridgeObjectRetain();
    uint64_t v44 = MEMORY[0x263F8EE78];
    v43[6] = sub_24D176544(MEMORY[0x263F8EE78]);
    v43[7] = v44;
    v43[2] = v34;
    v43[3] = v36;
    v43[4] = sub_24D17A1B0;
    v43[5] = 0;
    swift_bridgeObjectRetain();
    unint64_t v45 = (void *)sub_24D195DE0();
    swift_bridgeObjectRelease();
    char v187 = sub_24D17D7C8;
    uint64_t v188 = v43;
    *(void *)&long long aBlock = MEMORY[0x263EF8330];
    *((void *)&aBlock + 1) = 1107296256;
    uint64_t v185 = sub_24D17E354;
    unint64_t v186 = &block_descriptor_38;
    uint64_t v46 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    nm_macho_for_each_slice(v45, v46);
    _Block_release(v46);

    uint64_t v163 = v37;
    LODWORD(v162) = sub_24D18633C();
    uint64_t v47 = sub_24D1957E4(v34);
    uint64_t v160 = v48;
    uint64_t v161 = (void *)v47;
    swift_bridgeObjectRetain();
    uint64_t v49 = (void *)sub_24D195DE0();
    swift_bridgeObjectRelease();
    id v50 = nm_extractTeamID(v49);

    uint64_t v164 = v34;
    uint64_t v165 = v36;
    if (v50)
    {
      uint64_t v51 = sub_24D195E10();
      unint64_t v53 = v52;
    }
    else
    {
      uint64_t v51 = 0;
      unint64_t v53 = 0xE000000000000000;
    }
    swift_bridgeObjectRetain();
    uint64_t v54 = (void *)sub_24D195DE0();
    swift_bridgeObjectRelease();
    id v55 = nm_extractCDHash(v54);

    if (v55)
    {
      uint64_t v56 = sub_24D195E10();
      unint64_t v58 = v57;
    }
    else
    {
      uint64_t v56 = 0;
      unint64_t v58 = 0xE000000000000000;
    }
    uint64_t v59 = sub_24D17E648();
    if (v60) {
      uint64_t v61 = v59;
    }
    else {
      uint64_t v61 = 0;
    }
    if (v60) {
      unint64_t v62 = v60;
    }
    else {
      unint64_t v62 = 0xE000000000000000;
    }
    *(void *)&long long aBlock = v166;
    *((void *)&aBlock + 1) = v32;
    LOBYTE(v185) = v162;
    unint64_t v186 = v161;
    char v187 = v160;
    uint64_t v188 = (void *)v51;
    unint64_t v189 = v53;
    uint64_t v190 = v56;
    unint64_t v191 = v58;
    uint64_t v192 = v61;
    unint64_t v193 = v62;
    long long v194 = xmmword_24D196EF0;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v170 = *v33;
    uint64_t *v33 = 0x8000000000000000;
    uint64_t v34 = v164;
    uint64_t v36 = v165;
    sub_24D182860((uint64_t)&aBlock, v164, v165, isUniquelyReferenced_nonNull_native, (uint64_t)&v172);
    uint64_t *v33 = v170;
    swift_bridgeObjectRelease();
    swift_endAccess();
    swift_release();
    sub_24D17DA54(v172, v173);
    uint64_t v37 = v163;
  }
  swift_beginAccess();
  if (!*(void *)(*v33 + 16)) {
    goto LABEL_54;
  }
  swift_bridgeObjectRetain();
  uint64_t v64 = v167;
  sub_24D183934(v167, v37);
  char v66 = v65;
  swift_endAccess();
  if ((v66 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_55:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_beginAccess();
  if (!*(void *)(*v33 + 16))
  {
LABEL_54:
    swift_endAccess();
    goto LABEL_55;
  }
  swift_bridgeObjectRetain();
  sub_24D183934(v34, v36);
  if ((v67 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_54;
  }
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v68 = *v33;
  if (!*(void *)(*v33 + 16))
  {
LABEL_57:
    swift_endAccess();
    __break(1u);
    goto LABEL_58;
  }
  swift_bridgeObjectRetain();
  unint64_t v69 = sub_24D183934(v64, v37);
  if ((v70 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_57;
  }
  uint64_t v71 = *(void *)(v68 + 56) + 104 * v69;
  uint64_t v72 = *(void **)v71;
  uint64_t v163 = *(void *)(v71 + 8);
  LODWORD(v160) = *(unsigned __int8 *)(v71 + 16);
  uint64_t v73 = *(void *)(v71 + 32);
  uint64_t v151 = *(void *)(v71 + 24);
  uint64_t v74 = *(void *)(v71 + 40);
  uint64_t v75 = *(void *)(v71 + 48);
  uint64_t v161 = v72;
  uint64_t v162 = v75;
  uint64_t v76 = *(void *)(v71 + 64);
  uint64_t v156 = *(void *)(v71 + 56);
  uint64_t v157 = v74;
  uint64_t v77 = *(void *)(v71 + 80);
  uint64_t v153 = *(void *)(v71 + 72);
  uint64_t v78 = *(void *)(v71 + 96);
  uint64_t v149 = *(void *)(v71 + 88);
  swift_endAccess();
  uint64_t v150 = v78;
  swift_bridgeObjectRetain();
  uint64_t v79 = v163;
  swift_bridgeObjectRetain();
  uint64_t v154 = v73;
  uint64_t v80 = v162;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v155 = v76;
  swift_bridgeObjectRetain();
  uint64_t v152 = v77;
  uint64_t v81 = v161;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (!v81 && v79 == 0xE000000000000000 || (sub_24D196250())
    && (v167 == v34 && v37 == v36 || (sub_24D196250() & 1) != 0))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v82 = v155;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v83 = v80;
    uint64_t v163 = sub_24D1957E4(v151);
    uint64_t v85 = v84;
    swift_bridgeObjectRelease();
    uint64_t v172 = v166;
    unint64_t v173 = v32;
    char v174 = (char)v160;
    uint64_t v175 = v163;
    uint64_t v176 = v85;
    uint64_t v177 = v157;
    uint64_t v178 = v83;
    uint64_t v179 = v156;
    uint64_t v180 = v82;
    uint64_t v86 = v167;
    uint64_t v181 = v153;
    uint64_t v182 = v152;
    long long v183 = xmmword_24D196EF0;
    swift_beginAccess();
    char v87 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v170 = *v33;
    uint64_t *v33 = 0x8000000000000000;
    sub_24D184AC0((uint64_t)&v172, v86, v37, v87);
    uint64_t *v33 = v170;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    swift_beginAccess();
    uint64_t v88 = *v33;
    if (!*(void *)(*v33 + 16))
    {
LABEL_61:
      swift_endAccess();
      uint64_t result = swift_bridgeObjectRelease();
      __break(1u);
      return result;
    }
    swift_bridgeObjectRetain();
    unint64_t v89 = sub_24D183934(v86, v37);
    if ((v90 & 1) == 0)
    {
LABEL_60:
      swift_bridgeObjectRelease();
      goto LABEL_61;
    }
    uint64_t v91 = *(void *)(v88 + 56) + 104 * v89;
    uint64_t v161 = *(void **)v91;
    uint64_t v163 = *(void *)(v91 + 8);
    LODWORD(v160) = *(unsigned __int8 *)(v91 + 16);
    uint64_t v92 = *(void *)(v91 + 32);
    uint64_t v151 = *(void *)(v91 + 24);
    uint64_t v93 = *(void *)(v91 + 40);
    uint64_t v94 = *(void *)(v91 + 48);
    uint64_t v95 = *(void *)(v91 + 64);
    uint64_t v156 = *(void *)(v91 + 56);
    uint64_t v157 = v93;
    uint64_t v96 = *(void *)(v91 + 80);
    uint64_t v153 = *(void *)(v91 + 72);
    uint64_t v97 = *(void *)(v91 + 96);
    uint64_t v149 = *(void *)(v91 + 88);
    swift_endAccess();
    uint64_t v150 = v97;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v154 = v92;
    swift_bridgeObjectRetain();
    uint64_t v162 = v94;
    swift_bridgeObjectRetain();
    uint64_t v155 = v95;
    swift_bridgeObjectRetain();
    uint64_t v152 = v96;
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v98 = *v33;
  if (!*(void *)(*v33 + 16))
  {
LABEL_59:
    swift_endAccess();
    __break(1u);
    goto LABEL_60;
  }
  swift_bridgeObjectRetain();
  unint64_t v99 = sub_24D183934(v34, v36);
  if ((v100 & 1) == 0)
  {
LABEL_58:
    swift_bridgeObjectRelease();
    goto LABEL_59;
  }
  uint64_t v101 = (void **)(v168 + 16);
  uint64_t v102 = *(void *)(v98 + 56) + 104 * v99;
  uint64_t v103 = *(void *)v102;
  uint64_t v104 = *(void *)(v102 + 8);
  HIDWORD(v140) = *(unsigned __int8 *)(v102 + 16);
  uint64_t v105 = *(void *)(v102 + 24);
  uint64_t v106 = *(void *)(v102 + 32);
  uint64_t v107 = *(void *)(v102 + 48);
  uint64_t v145 = *(void *)(v102 + 40);
  uint64_t v146 = v105;
  uint64_t v108 = *(void *)(v102 + 56);
  uint64_t v109 = *(void *)(v102 + 64);
  uint64_t v110 = *(void *)(v102 + 80);
  uint64_t v143 = *(void *)(v102 + 72);
  uint64_t v144 = v108;
  uint64_t v111 = *(void *)(v102 + 88);
  uint64_t v112 = *(void *)(v102 + 96);
  uint64_t v141 = v103;
  uint64_t v142 = v111;
  swift_endAccess();
  uint64_t v147 = v112;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v168 = v106;
  swift_bridgeObjectRetain();
  uint64_t v167 = v107;
  swift_bridgeObjectRetain();
  uint64_t v166 = v109;
  swift_bridgeObjectRetain();
  uint64_t v148 = v110;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v113 = sub_24D195E90();
  uint64_t v115 = v114;
  uint64_t v116 = sub_24D1957E4(v34);
  uint64_t v118 = v117;
  swift_bridgeObjectRelease();
  uint64_t v119 = sub_24D195E90();
  uint64_t v121 = v120;
  swift_beginAccess();
  unint64_t v122 = *v101;
  char v123 = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v101 = v122;
  uint64_t v164 = v119;
  uint64_t v165 = v121;
  if ((v123 & 1) == 0)
  {
    unint64_t v122 = sub_24D18A220(0, v122[2] + 1, 1, v122);
    *uint64_t v101 = v122;
  }
  unint64_t v125 = v122[2];
  unint64_t v124 = v122[3];
  if (v125 >= v124 >> 1)
  {
    unint64_t v122 = sub_24D18A220((void *)(v124 > 1), v125 + 1, 1, v122);
    *uint64_t v101 = v122;
  }
  v122[2] = v125 + 1;
  uint64_t v126 = &v122[54 * v125];
  v126[4] = v113;
  v126[5] = v115;
  v126[6] = 0;
  v126[7] = 0xE000000000000000;
  v126[8] = v116;
  uint64_t v127 = v161;
  v126[9] = v118;
  v126[10] = v127;
  v126[11] = v163;
  *((unsigned char *)v126 + 96) = (_BYTE)v160;
  LODWORD(v127) = *(_DWORD *)((char *)&v170 + 3);
  *(_DWORD *)((char *)v126 + 97) = v170;
  *((_DWORD *)v126 + 25) = v127;
  uint64_t v128 = v154;
  v126[13] = v151;
  v126[14] = v128;
  uint64_t v129 = v162;
  v126[15] = v157;
  v126[16] = v129;
  uint64_t v130 = v155;
  v126[17] = v156;
  v126[18] = v130;
  uint64_t v131 = v152;
  v126[19] = v153;
  v126[20] = v131;
  uint64_t v132 = v150;
  v126[21] = v149;
  v126[22] = v132;
  v126[23] = v141;
  v126[24] = v104;
  *((unsigned char *)v126 + 200) = BYTE4(v140);
  LODWORD(v132) = *(_DWORD *)v169;
  *((_DWORD *)v126 + 51) = *(_DWORD *)&v169[3];
  *(_DWORD *)((char *)v126 + 201) = v132;
  uint64_t v133 = v168;
  v126[26] = v146;
  v126[27] = v133;
  uint64_t v134 = v167;
  v126[28] = v145;
  v126[29] = v134;
  uint64_t v135 = v166;
  v126[30] = v144;
  v126[31] = v135;
  uint64_t v136 = v148;
  v126[32] = v143;
  v126[33] = v136;
  uint64_t v137 = v147;
  v126[34] = v142;
  v126[35] = v137;
  *((_OWORD *)v126 + 23) = 0u;
  *((_OWORD *)v126 + 24) = 0u;
  *((_OWORD *)v126 + 21) = 0u;
  *((_OWORD *)v126 + 22) = 0u;
  *((_OWORD *)v126 + 19) = 0u;
  *((_OWORD *)v126 + 20) = 0u;
  *((_OWORD *)v126 + 18) = 0u;
  uint64_t v138 = v164;
  uint64_t v139 = v165;
  v126[50] = 0;
  v126[51] = v138;
  v126[52] = v139;
  v126[53] = 1;
  v126[54] = 0;
  v126[55] = 0xE000000000000000;
  v126[56] = 0;
  v126[57] = 0xE000000000000000;
  return swift_endAccess();
}

uint64_t sub_24D1826E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v5(a2, a3);

  return swift_release();
}

uint64_t sub_24D182748(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v6 = (void *)(a5 + 16);
  uint64_t result = swift_beginAccess();
  uint64_t v8 = *(void *)(a5 + 16);
  uint64_t v9 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
  }
  else
  {
    swift_beginAccess();
    void *v6 = v9;
    return 1;
  }
  return result;
}

uint64_t sub_24D1827B4()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 64, 7);
}

uint64_t type metadata accessor for MachOParser()
{
  return self;
}

uint64_t sub_24D182828()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24D182860@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  unint64_t v6 = (void **)v5;
  uint64_t v12 = (void *)*v5;
  unint64_t v14 = sub_24D183934(a2, a3);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t result = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 >= result && (a4 & 1) != 0)
  {
LABEL_7:
    uint64_t v20 = *v6;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7] + 104 * v14;
      uint64_t v22 = *(void *)(v21 + 8);
      char v23 = *(unsigned char *)(v21 + 16);
      long long v24 = *(_OWORD *)(v21 + 24);
      long long v25 = *(_OWORD *)(v21 + 40);
      long long v26 = *(_OWORD *)(v21 + 56);
      uint64_t v27 = *(void *)(v21 + 72);
      uint64_t v28 = *(void *)(v21 + 80);
      *(void *)a5 = *(void *)v21;
      *(void *)(a5 + 8) = v22;
      *(unsigned char *)(a5 + 16) = v23;
      *(_OWORD *)(a5 + 24) = v24;
      *(_OWORD *)(a5 + 40) = v25;
      *(_OWORD *)(a5 + 56) = v26;
      *(void *)(a5 + 72) = v27;
      *(void *)(a5 + 80) = v28;
      *(_OWORD *)(a5 + 88) = *(_OWORD *)(v21 + 88);
      long long v29 = *(_OWORD *)(a1 + 16);
      *(_OWORD *)uint64_t v21 = *(_OWORD *)a1;
      *(_OWORD *)(v21 + 16) = v29;
      long long v30 = *(_OWORD *)(a1 + 48);
      *(_OWORD *)(v21 + 32) = *(_OWORD *)(a1 + 32);
      *(_OWORD *)(v21 + 48) = v30;
      long long v31 = *(_OWORD *)(a1 + 80);
      *(_OWORD *)(v21 + 64) = *(_OWORD *)(a1 + 64);
      *(_OWORD *)(v21 + 80) = v31;
      *(void *)(v21 + 96) = *(void *)(a1 + 96);
      return result;
    }
    goto LABEL_11;
  }
  if (v19 >= result && (a4 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_24D185314();
    goto LABEL_7;
  }
  sub_24D183DA8(result, a4 & 1);
  uint64_t result = sub_24D183934(a2, a3);
  if ((v18 & 1) != (v32 & 1))
  {
LABEL_15:
    uint64_t result = sub_24D196260();
    __break(1u);
    return result;
  }
  unint64_t v14 = result;
  uint64_t v20 = *v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  sub_24D1850F0(v14, a2, a3, a1, v20);
  *(void *)(a5 + 96) = 0;
  *(_OWORD *)(a5 + 64) = 0u;
  *(_OWORD *)(a5 + 80) = 0u;
  *(_OWORD *)(a5 + 32) = 0u;
  *(_OWORD *)(a5 + 48) = 0u;
  *(_OWORD *)a5 = 0u;
  *(_OWORD *)(a5 + 16) = 0u;

  return swift_bridgeObjectRetain();
}

void sub_24D182A18(uint64_t a1, uint64_t a2)
{
  sub_24D18135C(a1, a2, v2[2], v2[3], v2[4]);
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

uint64_t objectdestroy_22Tm()
{
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_24D182A88(uint64_t a1, uint64_t a2)
{
  sub_24D181654(a1, a2, v2[2], v2[3], v2[4]);
}

uint64_t sub_24D182A94()
{
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_24D182ADC(uint64_t a1, uint64_t a2)
{
  return sub_24D18194C(a1, a2, *(void **)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48));
}

uint64_t sub_24D182AEC(uint64_t a1, uint64_t a2)
{
  return sub_24D17E15C(a1, a2, v2);
}

uint64_t sub_24D182AF4()
{
  return objectdestroy_44Tm(32);
}

uint64_t sub_24D182AFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24D17EC58(a1, a2, a3, a4, *(void *)(v4 + 16), *(void *)(v4 + 24));
}

uint64_t sub_24D182B04()
{
  return objectdestroy_44Tm(40);
}

uint64_t objectdestroy_44Tm(uint64_t a1)
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v1, a1, 7);
}

uint64_t sub_24D182B58(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_24D17ED54(a1, a2, a3, a4, *(void *)(v4 + 16), *(void **)(v4 + 24), *(mach_header **)(v4 + 32));
}

unint64_t sub_24D182B64()
{
  unint64_t result = qword_26985A210;
  if (!qword_26985A210)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26985A208);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985A210);
  }
  return result;
}

uint64_t sub_24D182BC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24D17FDA0(a1, a2, a3, a4, v4);
}

uint64_t sub_24D182BC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24D17FE74(a1, a2, a3, v3);
}

uint64_t sub_24D182BD0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24D182C2C()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24D182C64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24D17E5C4(a1, a2, a3, a4, v4);
}

void sub_24D182CC8(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    unint64_t v3 = sub_24D183934(0x614E6C6F626D7973, 0xEA0000000000656DLL);
    if (v4) {
      id v5 = *(id *)(*(void *)(a1 + 56) + 8 * v3);
    }
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985A218);
  sub_24D195E50();
  sub_24D195E80();
  swift_bridgeObjectRelease();
  sub_24D195E80();
  if (*(void *)(a1 + 16))
  {
    unint64_t v6 = sub_24D183934(0x61507972616E6962, 0xEA00000000006874);
    if (v7) {
      id v8 = *(id *)(*(void *)(a1 + 56) + 8 * v6);
    }
  }
  sub_24D195E50();
  sub_24D195E80();
  swift_bridgeObjectRelease();
  sub_24D195E80();
  if (*(void *)(a1 + 16))
  {
    unint64_t v9 = sub_24D183934(0x74615062696C7964, 0xE900000000000068);
    if (v10) {
      id v11 = *(id *)(*(void *)(a1 + 56) + 8 * v9);
    }
  }
  sub_24D195E50();
  sub_24D195E80();
  swift_bridgeObjectRelease();
  sub_24D195E80();
  if (*(void *)(a1 + 16))
  {
    unint64_t v12 = sub_24D183934(0xD000000000000010, 0x800000024D198D60);
    if (v13) {
      id v14 = *(id *)(*(void *)(a1 + 56) + 8 * v12);
    }
  }
  sub_24D195E50();
  sub_24D195E80();
  swift_bridgeObjectRelease();
  sub_24D195E80();
  if (*(void *)(a1 + 16))
  {
    unint64_t v15 = sub_24D183934(0x794472656C6C6163, 0xEF6874615062696CLL);
    if (v16) {
      id v17 = *(id *)(*(void *)(a1 + 56) + 8 * v15);
    }
  }
  sub_24D195E50();
  sub_24D195E80();
  swift_bridgeObjectRelease();
  char v18 = (uint64_t *)(v1 + 16);
  swift_beginAccess();
  if (!*(void *)(*(void *)(v1 + 16) + 16)
    || (swift_bridgeObjectRetain(),
        sub_24D183934(0, 0xE000000000000000),
        char v20 = v19,
        swift_bridgeObjectRelease(),
        (v20 & 1) == 0))
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v34 = *v18;
    *char v18 = 0x8000000000000000;
    sub_24D184C68(a1, 0, 0xE000000000000000, isUniquelyReferenced_nonNull_native);
    *char v18 = v34;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    return;
  }
  uint64_t v21 = *v18;
  if (!*(void *)(*v18 + 16))
  {
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v22 = sub_24D183934(0, 0xE000000000000000);
  if (v23)
  {
    uint64_t v24 = *(void *)(*(void *)(v21 + 56) + 8 * v22);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*(void *)(v24 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v25 = sub_24D183934(0x6F436C6F626D7973, 0xEB00000000746E75);
      if (v26)
      {
        id v27 = *(id *)(*(void *)(v24 + 56) + 8 * v25);
        swift_bridgeObjectRelease();
        self;
        uint64_t v28 = swift_dynamicCastObjCClassUnconditional();
        MEMORY[0x25331FF00](v28);
        sub_24D196050();
        sub_24D196070();
        uint64_t v29 = sub_24D196060();
        char v30 = swift_isUniquelyReferenced_nonNull_native();
        sub_24D184DD8(v29, 0x6F436C6F626D7973, 0xEB00000000746E75, v30);
        swift_bridgeObjectRelease();
        swift_beginAccess();
        char v31 = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v33 = *v18;
        *char v18 = 0x8000000000000000;
        sub_24D184C68(v24, 0, 0xE000000000000000, v31);
        *char v18 = v33;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_endAccess();

        return;
      }
      goto LABEL_27;
    }
    goto LABEL_25;
  }
LABEL_26:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __break(1u);
LABEL_27:
  swift_bridgeObjectRelease();
  __break(1u);
}

void sub_24D1831F8()
{
  uint64_t v1 = v0[5];
  if (v1 == -1)
  {
    swift_beginAccess();
    uint64_t v1 = *(void *)(v0[2] + 16);
  }
  uint64_t v2 = v0 + 2;
  swift_beginAccess();
  uint64_t v47 = v0;
  uint64_t v3 = *(void *)(v0[2] + 16);
  unint64_t v45 = v0 + 2;
  if (v1 >= v3)
  {
LABEL_4:
    os_log_type_t v4 = sub_24D195FE0();
    sub_24D178CF8();
    swift_retain_n();
    id v5 = sub_24D196090();
    if (os_log_type_enabled(v5, v4))
    {
      uint64_t v6 = swift_slowAlloc();
      uint64_t v7 = swift_slowAlloc();
      *(_DWORD *)uint64_t v6 = 134218242;
      aBlock[0] = v7;
      sub_24D1960A0();
      swift_release();
      *(_WORD *)(v6 + 12) = 2080;
      uint64_t v8 = v47[3];
      unint64_t v9 = v47[4];
      swift_bridgeObjectRetain();
      sub_24D18A654(v8, v9, aBlock);
      sub_24D1960A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24D172000, v5, v4, "EcosystemAnalytics.framework:AnalyticsRandomizer: Sending %ld %s events", (uint8_t *)v6, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x253320910](v7, -1, -1);
      MEMORY[0x253320910](v6, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    uint64_t v25 = v47[2];
    uint64_t v44 = v25 + 64;
    uint64_t v26 = 1 << *(unsigned char *)(v25 + 32);
    uint64_t v27 = -1;
    if (v26 < 64) {
      uint64_t v27 = ~(-1 << v26);
    }
    unint64_t v28 = v27 & *(void *)(v25 + 64);
    int64_t v29 = (unint64_t)(v26 + 63) >> 6;
    swift_bridgeObjectRetain();
    int64_t v30 = 0;
    while (1)
    {
      if (v28)
      {
        unint64_t v31 = __clz(__rbit64(v28));
        v28 &= v28 - 1;
        unint64_t v32 = v31 | (v30 << 6);
      }
      else
      {
        int64_t v41 = v30 + 1;
        if (__OFADD__(v30, 1))
        {
          __break(1u);
          goto LABEL_46;
        }
        if (v41 >= v29) {
          goto LABEL_44;
        }
        unint64_t v42 = *(void *)(v44 + 8 * v41);
        ++v30;
        if (!v42)
        {
          int64_t v30 = v41 + 1;
          if (v41 + 1 >= v29) {
            goto LABEL_44;
          }
          unint64_t v42 = *(void *)(v44 + 8 * v30);
          if (!v42)
          {
            int64_t v30 = v41 + 2;
            if (v41 + 2 >= v29) {
              goto LABEL_44;
            }
            unint64_t v42 = *(void *)(v44 + 8 * v30);
            if (!v42)
            {
              int64_t v43 = v41 + 3;
              if (v43 >= v29)
              {
LABEL_44:
                swift_release();
                return;
              }
              unint64_t v42 = *(void *)(v44 + 8 * v43);
              if (!v42)
              {
                while (1)
                {
                  int64_t v30 = v43 + 1;
                  if (__OFADD__(v43, 1)) {
                    goto LABEL_49;
                  }
                  if (v30 >= v29) {
                    goto LABEL_44;
                  }
                  unint64_t v42 = *(void *)(v44 + 8 * v30);
                  ++v43;
                  if (v42) {
                    goto LABEL_43;
                  }
                }
              }
              int64_t v30 = v43;
            }
          }
        }
LABEL_43:
        unint64_t v28 = (v42 - 1) & v42;
        unint64_t v32 = __clz(__rbit64(v42)) + (v30 << 6);
      }
      uint64_t v33 = (uint64_t *)(*(void *)(v25 + 48) + 16 * v32);
      uint64_t v34 = *v33;
      uint64_t v35 = v33[1];
      uint64_t v36 = *(void *)(*(void *)(v25 + 56) + 8 * v32);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26985A050);
      uint64_t v37 = swift_allocObject();
      *(_OWORD *)(v37 + 16) = xmmword_24D196C10;
      *(void *)(v37 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A058);
      *(void *)(v37 + 32) = v36;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      sub_24D1962B0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      uint64_t v38 = (void *)sub_24D195DE0();
      swift_bridgeObjectRelease();
      uint64_t v39 = (void *)swift_allocObject();
      v39[2] = v34;
      v39[3] = v35;
      v39[4] = v36;
      aBlock[4] = (uint64_t)sub_24D185A7C;
      aBlock[5] = (uint64_t)v39;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_24D18D3B0;
      aBlock[3] = (uint64_t)&block_descriptor_2;
      uint64_t v40 = _Block_copy(aBlock);
      swift_release();
      AnalyticsSendEventLazy();
      _Block_release(v40);
    }
  }
  while (v3)
  {
    aBlock[0] = 0;
    MEMORY[0x253320920](aBlock, 8);
    uint64_t v10 = ((unint64_t)aBlock[0] * (unsigned __int128)(unint64_t)v3) >> 64;
    if (v3 > (unint64_t)(aBlock[0] * v3))
    {
      unint64_t v11 = -v3 % (unint64_t)v3;
      if (v11 > aBlock[0] * v3)
      {
        do
        {
          aBlock[0] = 0;
          MEMORY[0x253320920](aBlock, 8);
        }
        while (v11 > aBlock[0] * v3);
        uint64_t v10 = ((unint64_t)aBlock[0] * (unsigned __int128)(unint64_t)v3) >> 64;
      }
    }
    uint64_t v12 = *v2;
    uint64_t v13 = *(void *)(*v2 + 16);
    if (v13)
    {
      uint64_t v46 = v10;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26985A060);
      id v14 = (void *)swift_allocObject();
      int64_t v15 = _swift_stdlib_malloc_size(v14);
      uint64_t v16 = v15 - 32;
      if (v15 < 32) {
        uint64_t v16 = v15 - 17;
      }
      v14[2] = v13;
      v14[3] = 2 * (v16 >> 4);
      uint64_t v17 = sub_24D185A9C((uint64_t)aBlock, v14 + 4, v13, v12);
      swift_bridgeObjectRetain_n();
      sub_24D17D7D0();
      if (v17 != v13) {
        goto LABEL_48;
      }
      swift_bridgeObjectRelease();
      uint64_t v2 = v45;
      uint64_t v10 = v46;
    }
    else
    {
      id v14 = (void *)MEMORY[0x263F8EE78];
    }
    if (v10 >= v14[2]) {
      goto LABEL_47;
    }
    char v18 = &v14[2 * v10];
    uint64_t v19 = v18[4];
    uint64_t v20 = v18[5];
    swift_bridgeObjectRetain();
    swift_release();
    swift_beginAccess();
    swift_bridgeObjectRetain();
    unint64_t v21 = sub_24D183934(v19, v20);
    LOBYTE(v19) = v22;
    swift_bridgeObjectRelease();
    if (v19)
    {
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v24 = *v2;
      uint64_t v48 = *v2;
      uint64_t *v2 = 0x8000000000000000;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_24D18515C();
        uint64_t v24 = v48;
      }
      swift_bridgeObjectRelease();
      sub_24D1848E8(v21, v24);
      *unint64_t v45 = v24;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v2 = v45;
    }
    swift_bridgeObjectRelease();
    swift_endAccess();
    uint64_t v3 = *(void *)(*v2 + 16);
    if (v1 >= v3) {
      goto LABEL_4;
    }
  }
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
}

uint64_t AnalyticsRandomizer.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t AnalyticsRandomizer.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t type metadata accessor for AnalyticsRandomizer()
{
  return self;
}

uint64_t method lookup function for AnalyticsRandomizer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AnalyticsRandomizer);
}

unint64_t sub_24D183934(uint64_t a1, uint64_t a2)
{
  sub_24D1962C0();
  sub_24D195E70();
  uint64_t v4 = sub_24D1962E0();

  return sub_24D1839AC(a1, a2, v4);
}

unint64_t sub_24D1839AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24D196250() & 1) == 0)
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
      while (!v14 && (sub_24D196250() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_24D183A90(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985A078);
  char v36 = a2;
  uint64_t v6 = sub_24D1961F0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v34) {
      break;
    }
    char v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
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
    int64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_24D1962C0();
    sub_24D195E70();
    uint64_t result = sub_24D1962E0();
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
    char v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *char v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  char v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *char v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_24D183DA8(uint64_t a1, char a2)
{
  uint64_t v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985A040);
  char v50 = a2;
  uint64_t v5 = sub_24D1961F0();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v47 = (void *)(v4 + 64);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(v4 + 64);
    int64_t v46 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v10 = v5 + 64;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    uint64_t v48 = v4;
    uint64_t v49 = v6;
    uint64_t v13 = v6;
    while (1)
    {
      if (v9)
      {
        uint64_t v51 = (v9 - 1) & v9;
        int64_t v52 = v12;
        unint64_t v22 = __clz(__rbit64(v9)) | (v12 << 6);
      }
      else
      {
        int64_t v23 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_42:
          __break(1u);
          goto LABEL_43;
        }
        if (v23 >= v46)
        {
          swift_release();
          int64_t v43 = v45;
          int64_t v24 = v47;
          if ((v50 & 1) == 0) {
            goto LABEL_38;
          }
LABEL_35:
          uint64_t v44 = 1 << *(unsigned char *)(v4 + 32);
          if (v44 >= 64) {
            bzero(v24, ((unint64_t)(v44 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
          }
          else {
            *int64_t v24 = -1 << v44;
          }
          uint64_t v6 = v49;
          *(void *)(v4 + 16) = 0;
          uint64_t result = swift_release();
          goto LABEL_41;
        }
        int64_t v24 = v47;
        unint64_t v25 = v47[v23];
        int64_t v26 = v12 + 1;
        if (!v25)
        {
          int64_t v26 = v12 + 2;
          if (v12 + 2 >= v46) {
            goto LABEL_34;
          }
          unint64_t v25 = v47[v26];
          if (!v25)
          {
            uint64_t v27 = v12 + 3;
            if (v12 + 3 >= v46)
            {
LABEL_34:
              swift_release();
              int64_t v43 = v45;
              if ((v50 & 1) == 0)
              {
LABEL_38:
                uint64_t result = swift_release();
                uint64_t v6 = v49;
                goto LABEL_41;
              }
              goto LABEL_35;
            }
            unint64_t v25 = v47[v27];
            if (!v25)
            {
              while (1)
              {
                int64_t v26 = v27 + 1;
                if (__OFADD__(v27, 1)) {
                  break;
                }
                if (v26 >= v46) {
                  goto LABEL_34;
                }
                unint64_t v25 = v47[v26];
                ++v27;
                if (v25) {
                  goto LABEL_30;
                }
              }
LABEL_43:
              __break(1u);
              return result;
            }
            int64_t v26 = v12 + 3;
          }
        }
LABEL_30:
        uint64_t v51 = (v25 - 1) & v25;
        int64_t v52 = v26;
        unint64_t v22 = __clz(__rbit64(v25)) + (v26 << 6);
      }
      uint64_t v32 = *(void *)(v4 + 56);
      uint64_t v33 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v22);
      uint64_t v35 = *v33;
      uint64_t v34 = v33[1];
      char v36 = (uint64_t *)(v32 + 104 * v22);
      uint64_t v37 = v36[1];
      char v59 = *((unsigned char *)v36 + 16);
      uint64_t v38 = v36[4];
      uint64_t v39 = v36[6];
      uint64_t v57 = v36[5];
      uint64_t v58 = v36[3];
      uint64_t v40 = v36[8];
      uint64_t v41 = v36[10];
      uint64_t v55 = v36[9];
      uint64_t v56 = v36[7];
      uint64_t v42 = v36[12];
      uint64_t v53 = *v36;
      uint64_t v54 = v36[11];
      if ((v50 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_24D1962C0();
      sub_24D195E70();
      uint64_t v14 = sub_24D1962E0();
      uint64_t v15 = -1 << *(unsigned char *)(v13 + 32);
      unint64_t v16 = v14 & ~v15;
      unint64_t v17 = v16 >> 6;
      if (((-1 << v16) & ~*(void *)(v10 + 8 * (v16 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v10 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
        uint64_t v19 = v39;
        uint64_t result = v42;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v15) >> 6;
        uint64_t v19 = v39;
        uint64_t result = v42;
        do
        {
          if (++v17 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_42;
          }
          BOOL v30 = v17 == v29;
          if (v17 == v29) {
            unint64_t v17 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v10 + 8 * v17);
        }
        while (v31 == -1);
        unint64_t v18 = __clz(__rbit64(~v31)) + (v17 << 6);
      }
      *(void *)(v10 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      unint64_t v20 = (void *)(*(void *)(v13 + 48) + 16 * v18);
      *unint64_t v20 = v35;
      v20[1] = v34;
      uint64_t v21 = *(void *)(v13 + 56) + 104 * v18;
      *(void *)uint64_t v21 = v53;
      *(void *)(v21 + 8) = v37;
      *(unsigned char *)(v21 + 16) = v59;
      *(void *)(v21 + 24) = v58;
      *(void *)(v21 + 32) = v38;
      *(void *)(v21 + 40) = v57;
      *(void *)(v21 + 48) = v19;
      *(void *)(v21 + 56) = v56;
      *(void *)(v21 + 64) = v40;
      *(void *)(v21 + 72) = v55;
      *(void *)(v21 + 80) = v41;
      *(void *)(v21 + 88) = v54;
      *(void *)(v21 + 96) = result;
      ++*(void *)(v13 + 16);
      uint64_t v4 = v48;
      unint64_t v9 = v51;
      int64_t v12 = v52;
    }
  }
  uint64_t result = swift_release();
  int64_t v43 = v45;
LABEL_41:
  *int64_t v43 = v6;
  return result;
}

uint64_t sub_24D1841A4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985A048);
  char v38 = a2;
  uint64_t v6 = sub_24D1961F0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v36) {
      break;
    }
    unint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
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
    unint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_24D1962C0();
    sub_24D195E70();
    uint64_t result = sub_24D1962E0();
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
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *unint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  unint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_24D1844B4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985A038);
  char v51 = a2;
  uint64_t v57 = sub_24D1961F0();
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v6 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v49 = (void *)(v5 + 64);
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v5 + 64);
  uint64_t v47 = v2;
  int64_t v48 = (unint64_t)(v6 + 63) >> 6;
  uint64_t v9 = v57 + 64;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  uint64_t v50 = v5;
  while (1)
  {
    if (v8)
    {
      uint64_t v52 = (v8 - 1) & v8;
      int64_t v53 = v11;
      unint64_t v24 = __clz(__rbit64(v8)) | (v11 << 6);
      goto LABEL_31;
    }
    int64_t v25 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v25 >= v48) {
      break;
    }
    unint64_t v26 = v49;
    unint64_t v27 = v49[v25];
    int64_t v28 = v11 + 1;
    if (!v27)
    {
      int64_t v28 = v11 + 2;
      if (v11 + 2 >= v48) {
        goto LABEL_33;
      }
      unint64_t v27 = v49[v28];
      if (!v27)
      {
        uint64_t v29 = v11 + 3;
        if (v11 + 3 >= v48)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v47;
          if ((v51 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v27 = v49[v29];
        if (!v27)
        {
          while (1)
          {
            int64_t v28 = v29 + 1;
            if (__OFADD__(v29, 1)) {
              goto LABEL_42;
            }
            if (v28 >= v48) {
              goto LABEL_33;
            }
            unint64_t v27 = v49[v28];
            ++v29;
            if (v27) {
              goto LABEL_30;
            }
          }
        }
        int64_t v28 = v11 + 3;
      }
    }
LABEL_30:
    uint64_t v52 = (v27 - 1) & v27;
    int64_t v53 = v28;
    unint64_t v24 = __clz(__rbit64(v27)) + (v28 << 6);
LABEL_31:
    uint64_t v34 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v24);
    uint64_t v36 = *v34;
    uint64_t v35 = v34[1];
    uint64_t v37 = (uint64_t *)(*(void *)(v5 + 56) + 120 * v24);
    uint64_t v38 = v37[1];
    uint64_t v54 = *v37;
    uint64_t v39 = v37[2];
    uint64_t v40 = v37[3];
    uint64_t v42 = v37[4];
    uint64_t v41 = v37[5];
    uint64_t v44 = v37[6];
    uint64_t v43 = v37[7];
    uint64_t v45 = v37[8];
    uint64_t v63 = v37[9];
    uint64_t v61 = v37[11];
    uint64_t v62 = v37[10];
    uint64_t v59 = v37[13];
    uint64_t v60 = v37[12];
    uint64_t v58 = v37[14];
    if ((v51 & 1) == 0)
    {
      uint64_t v56 = v37[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_24D177B0C(v39, v40);
      uint64_t v38 = v56;
    }
    uint64_t v55 = v40;
    uint64_t v12 = v39;
    uint64_t v13 = v38;
    sub_24D1962C0();
    sub_24D195E70();
    uint64_t v14 = sub_24D1962E0();
    uint64_t v15 = -1 << *(unsigned char *)(v57 + 32);
    unint64_t v16 = v14 & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v9 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v9 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      uint64_t v19 = v55;
      uint64_t v20 = v44;
      uint64_t result = v43;
      uint64_t v21 = v45;
    }
    else
    {
      char v30 = 0;
      unint64_t v31 = (unint64_t)(63 - v15) >> 6;
      uint64_t v19 = v55;
      uint64_t v20 = v44;
      uint64_t result = v43;
      uint64_t v21 = v45;
      do
      {
        if (++v17 == v31 && (v30 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v32 = v17 == v31;
        if (v17 == v31) {
          unint64_t v17 = 0;
        }
        v30 |= v32;
        uint64_t v33 = *(void *)(v9 + 8 * v17);
      }
      while (v33 == -1);
      unint64_t v18 = __clz(__rbit64(~v33)) + (v17 << 6);
    }
    *(void *)(v9 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    unint64_t v22 = (void *)(*(void *)(v57 + 48) + 16 * v18);
    *unint64_t v22 = v36;
    v22[1] = v35;
    unint64_t v23 = (void *)(*(void *)(v57 + 56) + 120 * v18);
    *unint64_t v23 = v54;
    v23[1] = v13;
    v23[2] = v12;
    v23[3] = v19;
    v23[4] = v42;
    v23[5] = v41;
    v23[6] = v20;
    v23[7] = result;
    v23[8] = v21;
    v23[9] = v63;
    v23[10] = v62;
    v23[11] = v61;
    v23[12] = v60;
    v23[13] = v59;
    v23[14] = v58;
    ++*(void *)(v57 + 16);
    uint64_t v5 = v50;
    unint64_t v8 = v52;
    int64_t v11 = v53;
  }
  swift_release();
  uint64_t v3 = v47;
  unint64_t v26 = v49;
  if ((v51 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v46 = 1 << *(unsigned char *)(v5 + 32);
  if (v46 >= 64) {
    bzero(v26, ((unint64_t)(v46 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v26 = -1 << v46;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v57;
  return result;
}

unint64_t sub_24D1848E8(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_24D196130();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_24D1962C0();
        swift_bridgeObjectRetain();
        sub_24D195E70();
        uint64_t v9 = sub_24D1962E0();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          uint64_t v15 = (void *)(v14 + 8 * v3);
          unint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *uint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *unint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_24D184AC0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_24D183934(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_18;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_24D185314();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7] + 104 * v12;
      return sub_24D185708(a1, v19);
    }
    goto LABEL_13;
  }
  sub_24D183DA8(v15, a4 & 1);
  unint64_t v21 = sub_24D183934(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_19:
    uint64_t result = sub_24D196260();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_13:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  *unint64_t v23 = a2;
  v23[1] = a3;
  uint64_t v24 = v18[7] + 104 * v12;
  long long v25 = *(_OWORD *)a1;
  long long v26 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v24 + 16) = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v24 + 32) = v26;
  *(_OWORD *)uint64_t v24 = v25;
  long long v27 = *(_OWORD *)(a1 + 48);
  long long v28 = *(_OWORD *)(a1 + 64);
  long long v29 = *(_OWORD *)(a1 + 80);
  *(void *)(v24 + 96) = *(void *)(a1 + 96);
  *(_OWORD *)(v24 + 64) = v28;
  *(_OWORD *)(v24 + 80) = v29;
  *(_OWORD *)(v24 + 48) = v27;
  uint64_t v30 = v18[2];
  BOOL v31 = __OFADD__(v30, 1);
  uint64_t v32 = v30 + 1;
  if (v31)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v18[2] = v32;

  return swift_bridgeObjectRetain();
}

uint64_t sub_24D184C68(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_24D183934(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_24D18515C();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_24D183A90(v15, a4 & 1);
  unint64_t v21 = sub_24D183934(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_24D196260();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  *unint64_t v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v26;

  return swift_bridgeObjectRetain();
}

void sub_24D184DD8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_24D183934(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_24D185554();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_24D1841A4(v15, a4 & 1);
  unint64_t v20 = sub_24D183934(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    sub_24D196260();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  char v22 = (uint64_t *)(v18[6] + 16 * v12);
  *char v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v25;

  swift_bridgeObjectRetain();
}

uint64_t sub_24D184F48(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_24D183934(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_18;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_24D185764();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7] + 120 * v12;
      return sub_24D1859E0(a1, v19);
    }
    goto LABEL_13;
  }
  sub_24D1844B4(v15, a4 & 1);
  unint64_t v21 = sub_24D183934(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_19:
    uint64_t result = sub_24D196260();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_13:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  *uint64_t v23 = a2;
  v23[1] = a3;
  uint64_t v24 = v18[7] + 120 * v12;
  long long v25 = *(_OWORD *)a1;
  long long v26 = *(_OWORD *)(a1 + 16);
  long long v27 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v24 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v24 + 48) = v27;
  *(_OWORD *)uint64_t v24 = v25;
  *(_OWORD *)(v24 + 16) = v26;
  long long v28 = *(_OWORD *)(a1 + 64);
  long long v29 = *(_OWORD *)(a1 + 80);
  long long v30 = *(_OWORD *)(a1 + 96);
  *(void *)(v24 + 112) = *(void *)(a1 + 112);
  *(_OWORD *)(v24 + 80) = v29;
  *(_OWORD *)(v24 + 96) = v30;
  *(_OWORD *)(v24 + 64) = v28;
  uint64_t v31 = v18[2];
  BOOL v32 = __OFADD__(v31, 1);
  uint64_t v33 = v31 + 1;
  if (v32)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v18[2] = v33;

  return swift_bridgeObjectRetain();
}

unint64_t sub_24D1850F0(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  uint64_t v5 = (void *)(a5[6] + 16 * result);
  *uint64_t v5 = a2;
  v5[1] = a3;
  uint64_t v6 = a5[7] + 104 * result;
  long long v7 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)uint64_t v6 = *(_OWORD *)a4;
  *(_OWORD *)(v6 + 16) = v7;
  *(void *)(v6 + 96) = *(void *)(a4 + 96);
  long long v8 = *(_OWORD *)(a4 + 80);
  *(_OWORD *)(v6 + 64) = *(_OWORD *)(a4 + 64);
  *(_OWORD *)(v6 + 80) = v8;
  long long v9 = *(_OWORD *)(a4 + 48);
  *(_OWORD *)(v6 + 32) = *(_OWORD *)(a4 + 32);
  *(_OWORD *)(v6 + 48) = v9;
  uint64_t v10 = a5[2];
  BOOL v11 = __OFADD__(v10, 1);
  uint64_t v12 = v10 + 1;
  if (v11) {
    __break(1u);
  }
  else {
    a5[2] = v12;
  }
  return result;
}

void *sub_24D18515C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985A078);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24D1961E0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_24D185314()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985A040);
  uint64_t v37 = v0;
  uint64_t v1 = *v0;
  uint64_t v2 = sub_24D1961E0();
  uint64_t v3 = v2;
  if (!*(void *)(v1 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v37 = v3;
    return result;
  }
  uint64_t result = (void *)(v2 + 64);
  unint64_t v5 = (unint64_t)((1 << *(unsigned char *)(v3 + 32)) + 63) >> 6;
  if (v3 != v1 || (unint64_t)result >= v1 + 64 + 8 * v5) {
    uint64_t result = memmove(result, (const void *)(v1 + 64), 8 * v5);
  }
  uint64_t v39 = v1 + 64;
  int64_t v7 = 0;
  *(void *)(v3 + 16) = *(void *)(v1 + 16);
  uint64_t v8 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & *(void *)(v1 + 64);
  int64_t v38 = (unint64_t)(v8 + 63) >> 6;
  while (1)
  {
    if (v10)
    {
      unint64_t v11 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v12 = v11 | (v7 << 6);
      goto LABEL_12;
    }
    int64_t v34 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v34 >= v38) {
      goto LABEL_26;
    }
    unint64_t v35 = *(void *)(v39 + 8 * v34);
    ++v7;
    if (!v35)
    {
      int64_t v7 = v34 + 1;
      if (v34 + 1 >= v38) {
        goto LABEL_26;
      }
      unint64_t v35 = *(void *)(v39 + 8 * v7);
      if (!v35) {
        break;
      }
    }
LABEL_25:
    unint64_t v10 = (v35 - 1) & v35;
    unint64_t v12 = __clz(__rbit64(v35)) + (v7 << 6);
LABEL_12:
    uint64_t v13 = 16 * v12;
    unint64_t v14 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v12);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    uint64_t v17 = 104 * v12;
    uint64_t v18 = *(void *)(v1 + 56) + v17;
    uint64_t v19 = *(void *)v18;
    uint64_t v20 = *(void *)(v18 + 8);
    char v21 = *(unsigned char *)(v18 + 16);
    uint64_t v22 = *(void *)(v18 + 24);
    uint64_t v23 = *(void *)(v18 + 32);
    uint64_t v24 = *(void *)(v18 + 40);
    uint64_t v25 = *(void *)(v18 + 48);
    uint64_t v26 = *(void *)(v18 + 56);
    uint64_t v27 = *(void *)(v18 + 64);
    uint64_t v28 = *(void *)(v18 + 72);
    uint64_t v29 = *(void *)(v18 + 80);
    uint64_t v31 = *(void *)(v18 + 88);
    uint64_t v30 = *(void *)(v18 + 96);
    BOOL v32 = (void *)(*(void *)(v3 + 48) + v13);
    void *v32 = v15;
    v32[1] = v16;
    uint64_t v33 = *(void *)(v3 + 56) + v17;
    *(void *)uint64_t v33 = v19;
    *(void *)(v33 + 8) = v20;
    *(unsigned char *)(v33 + 16) = v21;
    *(void *)(v33 + 24) = v22;
    *(void *)(v33 + 32) = v23;
    *(void *)(v33 + 40) = v24;
    *(void *)(v33 + 48) = v25;
    *(void *)(v33 + 56) = v26;
    *(void *)(v33 + 64) = v27;
    *(void *)(v33 + 72) = v28;
    *(void *)(v33 + 80) = v29;
    *(void *)(v33 + 88) = v31;
    *(void *)(v33 + 96) = v30;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v36 = v34 + 2;
  if (v36 >= v38) {
    goto LABEL_26;
  }
  unint64_t v35 = *(void *)(v39 + 8 * v36);
  if (v35)
  {
    int64_t v7 = v36;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v7 = v36 + 1;
    if (__OFADD__(v36, 1)) {
      break;
    }
    if (v7 >= v38) {
      goto LABEL_26;
    }
    unint64_t v35 = *(void *)(v39 + 8 * v7);
    ++v36;
    if (v35) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_24D185554()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985A048);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24D1961E0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    char v21 = (void *)(*(void *)(v4 + 48) + v16);
    *char v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_24D185708(uint64_t a1, uint64_t a2)
{
  return a2;
}

void *sub_24D185764()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985A038);
  uint64_t v39 = v0;
  uint64_t v1 = *v0;
  uint64_t v2 = sub_24D1961E0();
  uint64_t v3 = v2;
  if (!*(void *)(v1 + 16))
  {
LABEL_26:
    uint64_t v38 = v3;
    id result = (void *)swift_release();
    *uint64_t v39 = v38;
    return result;
  }
  id result = (void *)(v2 + 64);
  unint64_t v5 = (unint64_t)((1 << *(unsigned char *)(v3 + 32)) + 63) >> 6;
  __src = (void *)(v1 + 64);
  BOOL v6 = v3 != v1 || (unint64_t)result >= v1 + 64 + 8 * v5;
  uint64_t v43 = v3;
  if (v6)
  {
    id result = memmove(result, __src, 8 * v5);
    uint64_t v3 = v43;
  }
  int64_t v7 = 0;
  *(void *)(v3 + 16) = *(void *)(v1 + 16);
  uint64_t v8 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & *(void *)(v1 + 64);
  int64_t v41 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v42 = v1;
  while (1)
  {
    if (v10)
    {
      uint64_t v44 = (v10 - 1) & v10;
      int64_t v45 = v7;
      unint64_t v11 = __clz(__rbit64(v10)) | (v7 << 6);
      uint64_t v12 = v42;
      uint64_t v3 = v43;
      goto LABEL_12;
    }
    int64_t v34 = v7 + 1;
    uint64_t v12 = v42;
    uint64_t v3 = v43;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v34 >= v41) {
      goto LABEL_26;
    }
    unint64_t v35 = *((void *)__src + v34);
    int64_t v36 = v7 + 1;
    if (!v35)
    {
      int64_t v36 = v7 + 2;
      if (v7 + 2 >= v41) {
        goto LABEL_26;
      }
      unint64_t v35 = *((void *)__src + v36);
      if (!v35) {
        break;
      }
    }
LABEL_25:
    uint64_t v44 = (v35 - 1) & v35;
    int64_t v45 = v36;
    unint64_t v11 = __clz(__rbit64(v35)) + (v36 << 6);
LABEL_12:
    uint64_t v13 = 16 * v11;
    unint64_t v14 = (uint64_t *)(*(void *)(v12 + 48) + 16 * v11);
    uint64_t v16 = *v14;
    uint64_t v15 = v14[1];
    uint64_t v17 = 120 * v11;
    uint64_t v18 = (uint64_t *)(*(void *)(v12 + 56) + v17);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    uint64_t v21 = v18[3];
    uint64_t v22 = v18[4];
    uint64_t v23 = v18[5];
    uint64_t v25 = v18[6];
    uint64_t v24 = v18[7];
    uint64_t v47 = v18[2];
    uint64_t v26 = v18[9];
    uint64_t v46 = v18[8];
    uint64_t v28 = v18[10];
    uint64_t v27 = v18[11];
    uint64_t v29 = v18[12];
    uint64_t v30 = v18[13];
    uint64_t v31 = v18[14];
    BOOL v32 = (void *)(*(void *)(v3 + 48) + v13);
    void *v32 = v16;
    v32[1] = v15;
    uint64_t v33 = (void *)(*(void *)(v3 + 56) + v17);
    void *v33 = v19;
    v33[1] = v20;
    v33[2] = v47;
    v33[3] = v21;
    v33[4] = v22;
    v33[5] = v23;
    v33[6] = v25;
    v33[7] = v24;
    v33[8] = v46;
    v33[9] = v26;
    v33[10] = v28;
    v33[11] = v27;
    v33[12] = v29;
    void v33[13] = v30;
    v33[14] = v31;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id result = (void *)sub_24D177B0C(v47, v21);
    unint64_t v10 = v44;
    int64_t v7 = v45;
  }
  uint64_t v37 = v7 + 3;
  if (v7 + 3 >= v41) {
    goto LABEL_26;
  }
  unint64_t v35 = *((void *)__src + v37);
  if (v35)
  {
    int64_t v36 = v7 + 3;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v36 = v37 + 1;
    if (__OFADD__(v37, 1)) {
      break;
    }
    if (v36 >= v41) {
      goto LABEL_26;
    }
    unint64_t v35 = *((void *)__src + v36);
    ++v37;
    if (v35) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_24D1859E0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_24D185A3C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24D185A7C()
{
  return swift_bridgeObjectRetain();
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

uint64_t sub_24D185A9C(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  unint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *unint64_t v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  unint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    void *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    id result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

void sub_24D185CA0()
{
  qword_26985AAD8 = (uint64_t)&unk_26FF762A8;
}

void sub_24D185CB4()
{
  qword_26985AAE0 = (uint64_t)&unk_26FF762F8;
}

uint64_t destroy for LoadCommand(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t result = *(void *)(a1 + 24);
  if (result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for LoadCommand(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  if (v5)
  {
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    *(void *)(a1 + 24) = v5;
    *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
    uint64_t v6 = *(void *)(a2 + 48);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *(void *)(a1 + 48) = v6;
    uint64_t v7 = *(void *)(a2 + 64);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    *(void *)(a1 + 64) = v7;
    uint64_t v8 = *(void *)(a2 + 80);
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
    *(void *)(a1 + 80) = v8;
    uint64_t v9 = *(void *)(a2 + 96);
    *(void *)(a1 + 88) = *(void *)(a2 + 88);
    *(void *)(a1 + 96) = v9;
    uint64_t v10 = *(void *)(a2 + 104);
    uint64_t v11 = *(void *)(a2 + 112);
    *(void *)(a1 + 104) = v10;
    *(void *)(a1 + 112) = v11;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v12 = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 96) = v12;
    *(void *)(a1 + 112) = *(void *)(a2 + 112);
    long long v13 = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(a1 + 32) = v13;
    long long v14 = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 64) = v14;
  }
  return a1;
}

uint64_t assignWithCopy for LoadCommand(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (_OWORD *)(a1 + 16);
  uint64_t v5 = (_OWORD *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  if (*(void *)(a1 + 24))
  {
    if (v6)
    {
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      *(void *)(a1 + 24) = *(void *)(a2 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      *(void *)(a1 + 64) = *(void *)(a2 + 64);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 72) = *(void *)(a2 + 72);
      *(void *)(a1 + 80) = *(void *)(a2 + 80);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 88) = *(void *)(a2 + 88);
      *(void *)(a1 + 96) = *(void *)(a2 + 96);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 104) = *(void *)(a2 + 104);
      *(void *)(a1 + 112) = *(void *)(a2 + 112);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_24D186054(a1 + 16);
      long long v8 = *(_OWORD *)(a2 + 32);
      long long v7 = *(_OWORD *)(a2 + 48);
      *uint64_t v4 = *v5;
      *(_OWORD *)(a1 + 32) = v8;
      *(_OWORD *)(a1 + 48) = v7;
      long long v10 = *(_OWORD *)(a2 + 80);
      long long v9 = *(_OWORD *)(a2 + 96);
      long long v11 = *(_OWORD *)(a2 + 64);
      *(void *)(a1 + 112) = *(void *)(a2 + 112);
      *(_OWORD *)(a1 + 80) = v10;
      *(_OWORD *)(a1 + 96) = v9;
      *(_OWORD *)(a1 + 64) = v11;
    }
  }
  else if (v6)
  {
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    *(void *)(a1 + 24) = *(void *)(a2 + 24);
    *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
    *(void *)(a1 + 80) = *(void *)(a2 + 80);
    *(void *)(a1 + 88) = *(void *)(a2 + 88);
    *(void *)(a1 + 96) = *(void *)(a2 + 96);
    *(void *)(a1 + 104) = *(void *)(a2 + 104);
    *(void *)(a1 + 112) = *(void *)(a2 + 112);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v12 = *v5;
    long long v13 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v13;
    *uint64_t v4 = v12;
    long long v14 = *(_OWORD *)(a2 + 64);
    long long v15 = *(_OWORD *)(a2 + 80);
    long long v16 = *(_OWORD *)(a2 + 96);
    *(void *)(a1 + 112) = *(void *)(a2 + 112);
    *(_OWORD *)(a1 + 80) = v15;
    *(_OWORD *)(a1 + 96) = v16;
    *(_OWORD *)(a1 + 64) = v14;
  }
  return a1;
}

uint64_t sub_24D186054(uint64_t a1)
{
  return a1;
}

__n128 __swift_memcpy120_8(uint64_t a1, long long *a2)
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
  *(void *)(a1 + 112) = *((void *)a2 + 14);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t assignWithTake for LoadCommand(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  if (!*(void *)(a1 + 24)) {
    goto LABEL_5;
  }
  uint64_t v5 = *(void *)(a2 + 24);
  if (!v5)
  {
    sub_24D186054(a1 + 16);
LABEL_5:
    long long v11 = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 96) = v11;
    *(void *)(a1 + 112) = *(void *)(a2 + 112);
    long long v12 = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(a1 + 32) = v12;
    long long v13 = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 64) = v13;
    return a1;
  }
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LoadCommand(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 120)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LoadCommand(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 120) = 1;
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
    *(unsigned char *)(result + 120) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LoadCommand()
{
  return &type metadata for LoadCommand;
}

BOOL sub_24D186270(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24D186284()
{
  return sub_24D1962E0();
}

uint64_t sub_24D1862CC()
{
  return sub_24D1962D0();
}

uint64_t sub_24D1862F8()
{
  return sub_24D1962E0();
}

uint64_t sub_24D18633C()
{
  if (sub_24D195F10() & 1) != 0 || (sub_24D195F10()) {
    return 0;
  }
  if (sub_24D195F10()) {
    return 1;
  }
  if (sub_24D195F10()) {
    return 2;
  }
  if (sub_24D195F10()) {
    return 3;
  }
  if (sub_24D195F10()) {
    return 4;
  }
  return 5;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CoreAnalyticsLocation(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CoreAnalyticsLocation(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *__n128 result = a2 + 5;
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
        JUMPOUT(0x24D1865F0);
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
          *__n128 result = a2 + 5;
        break;
    }
  }
  return result;
}

uint64_t sub_24D186618(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24D186620(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CoreAnalyticsLocation()
{
  return &type metadata for CoreAnalyticsLocation;
}

unint64_t sub_24D18663C()
{
  unint64_t result = qword_26985A220;
  if (!qword_26985A220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985A220);
  }
  return result;
}

uint64_t sub_24D186690(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, int a4, uint64_t a5, uint64_t a6)
{
  uint64_t v90 = a6;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A180);
  MEMORY[0x270FA5388](v11 - 8);
  long long v13 = (char *)v73 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for TargetType(0);
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  int64_t v17 = (void *)((char *)v73 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_24D18802C(a1, (uint64_t)v17);
  if (swift_getEnumCaseMultiPayload())
  {
    sub_24D188090((uint64_t)v17);
    sub_24D195FD0();
    sub_24D177C34(0, (unint64_t *)&qword_26985A0D0);
    unint64_t v18 = (void *)sub_24D196090();
    sub_24D195CB0();

    LOBYTE(v113[0]) = 0;
    sub_24D18802C(a1, (uint64_t)v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v13, 0, 1, v14);
    LOBYTE(v112) = 11;
    v111[0] = 0u;
    unint64_t v19 = 0xD00000000000004BLL;
    uint64_t v20 = "MachOAnalysisPerformer: AnalyzableTarget type does not match expected value";
LABEL_5:
    sub_24D18C314((unsigned __int8 *)v113, (uint64_t)v13, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, (unsigned __int8 *)&v112, v19, (unint64_t)(v20 - 32) | 0x8000000000000000);
    return sub_24D1777B4((uint64_t)v13);
  }
  LODWORD(v109) = a4;
  uint64_t v89 = a5;
  uint64_t v22 = *v17;
  uint64_t v21 = v17[1];
  if (a2())
  {
    swift_bridgeObjectRelease();
    sub_24D195FD0();
    sub_24D177C34(0, (unint64_t *)&qword_26985A0D0);
    uint64_t v23 = (void *)sub_24D196090();
    sub_24D195CB0();

    LOBYTE(v113[0]) = 0;
    sub_24D18802C(a1, (uint64_t)v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v13, 0, 1, v14);
    LOBYTE(v112) = 4;
    v111[0] = 0u;
    unint64_t v19 = 0xD000000000000034;
    uint64_t v20 = "MachOAnalysisPerformer: Interrupted, returning early";
    goto LABEL_5;
  }
  type metadata accessor for MachOParser();
  uint64_t v25 = (void *)swift_allocObject();
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v26 = MEMORY[0x263F8EE78];
  v25[6] = sub_24D176544(MEMORY[0x263F8EE78]);
  v25[7] = v26;
  v25[2] = v22;
  v25[3] = v21;
  v25[4] = a2;
  v25[5] = a3;
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v27 = (void *)sub_24D195DE0();
  swift_bridgeObjectRelease();
  *(void *)&v111[2] = sub_24D17D7C8;
  *((void *)&v111[2] + 1) = v25;
  *(void *)&v111[0] = MEMORY[0x263EF8330];
  *((void *)&v111[0] + 1) = 1107296256;
  *(void *)&v111[1] = sub_24D17E354;
  *((void *)&v111[1] + 1) = &block_descriptor_4;
  uint64_t v28 = _Block_copy(v111);
  swift_retain();
  swift_release();
  nm_macho_for_each_slice(v27, v28);
  _Block_release(v28);
  swift_release();

  uint64_t v29 = sub_24D180C04();
  uint64_t v112 = v29;
  if (v109)
  {
    uint64_t v30 = v29;
    sub_24D195FE0();
    sub_24D177C34(0, (unint64_t *)&qword_26985A0D0);
    uint64_t v31 = (void *)sub_24D196090();
    sub_24D195CB0();

    uint64_t v32 = sub_24D180ED0();
    if (v32)
    {
      if (v30) {
        sub_24D180D74(v32);
      }
      else {
        swift_bridgeObjectRelease();
      }
    }
  }
  sub_24D178764(v22, v21, v113);
  if (v112) {
    uint64_t v33 = v112;
  }
  else {
    uint64_t v33 = v26;
  }
  uint64_t v34 = *(void *)(v33 + 16);
  if (v34)
  {
    v73[1] = v25;
    uint64_t v35 = v113[2];
    uint64_t v36 = v113[3];
    uint64_t v37 = v113[4];
    uint64_t v38 = v113[5];
    uint64_t v40 = v113[6];
    uint64_t v39 = v113[7];
    uint64_t v41 = sub_24D177C34(0, &qword_26985A228);
    if (v36) {
      uint64_t v42 = v35;
    }
    else {
      uint64_t v42 = 0x6E776F6E6B6E75;
    }
    uint64_t v84 = v42;
    uint64_t v85 = v41;
    unint64_t v43 = 0xE700000000000000;
    uint64_t v87 = v38;
    uint64_t v88 = v36;
    if (v36) {
      unint64_t v44 = v36;
    }
    else {
      unint64_t v44 = 0xE700000000000000;
    }
    if (v38) {
      uint64_t v45 = v37;
    }
    else {
      uint64_t v45 = 0x6E776F6E6B6E75;
    }
    uint64_t v82 = v45;
    unint64_t v83 = v44;
    if (v38) {
      unint64_t v46 = v38;
    }
    else {
      unint64_t v46 = 0xE700000000000000;
    }
    if (v39) {
      uint64_t v47 = v40;
    }
    else {
      uint64_t v47 = 0x6E776F6E6B6E75;
    }
    uint64_t v80 = v47;
    unint64_t v81 = v46;
    uint64_t v86 = v39;
    if (v39) {
      unint64_t v43 = v39;
    }
    unint64_t v79 = v43;
    swift_bridgeObjectRetain();
    uint64_t v48 = v34 - 1;
    uint64_t v49 = 32;
    long long v78 = xmmword_24D197150;
    unint64_t v76 = 0x800000024D198EF0;
    unint64_t v77 = 0x800000024D198ED0;
    uint64_t v74 = v33;
    unint64_t v75 = 0x800000024D198D60;
    while (1)
    {
      memcpy(v111, (const void *)(v33 + v49), sizeof(v111));
      uint64_t v109 = v48;
      uint64_t v91 = v49;
      if (*((void *)&v111[16] + 1))
      {
        unint64_t v50 = *((void *)&v111[17] + 1);
        if (*((void *)&v111[17] + 1))
        {
          uint64_t v100 = *(void *)&v111[17];
          uint64_t v51 = *(void *)&v111[19];
          long long v92 = *(_OWORD *)((char *)&v111[20] + 8);
          unint64_t v52 = *(void *)&v111[20];
          uint64_t v97 = *((void *)&v111[18] + 1);
          uint64_t v98 = *((void *)&v111[21] + 1);
          unint64_t v53 = *(void *)&v111[22];
          uint64_t v93 = LOBYTE(v111[18]);
          uint64_t v94 = *((void *)&v111[19] + 1);
          swift_bridgeObjectRetain();
          uint64_t v96 = v51;
          swift_bridgeObjectRetain();
          unint64_t v95 = v52;
          swift_bridgeObjectRetain();
          unint64_t v101 = v50;
          swift_bridgeObjectRetain();
          unint64_t v99 = v53;
          swift_bridgeObjectRetain();
        }
        else
        {
          uint64_t v96 = *((void *)&v111[16] + 1);
          uint64_t v97 = *(void *)&v111[16];
          swift_bridgeObjectRetain();
          uint64_t v98 = 0x6E776F6E6B6E75;
          unint64_t v99 = 0xE700000000000000;
          uint64_t v93 = 5;
          uint64_t v100 = 0x6E776F6E6B6E75;
          unint64_t v101 = 0xE700000000000000;
          uint64_t v94 = 0x6E776F6E6B6E75;
          unint64_t v95 = 0xE700000000000000;
          *(void *)&long long v92 = 0x6E776F6E6B6E75;
          *((void *)&v92 + 1) = 0xE700000000000000;
        }
      }
      else
      {
        unint64_t v54 = *(void *)&v111[10];
        uint64_t v100 = *((void *)&v111[9] + 1);
        uint64_t v93 = BYTE8(v111[10]);
        uint64_t v55 = *((void *)&v111[11] + 1);
        unint64_t v56 = *((void *)&v111[12] + 1);
        uint64_t v94 = *(void *)&v111[12];
        uint64_t v97 = *(void *)&v111[11];
        unint64_t v57 = *((void *)&v111[14] + 1);
        uint64_t v98 = *(void *)&v111[14];
        long long v92 = v111[13];
        swift_bridgeObjectRetain();
        uint64_t v96 = v55;
        swift_bridgeObjectRetain();
        unint64_t v95 = v56;
        swift_bridgeObjectRetain();
        unint64_t v101 = v54;
        swift_bridgeObjectRetain();
        unint64_t v99 = v57;
        swift_bridgeObjectRetain();
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_26985A230);
      uint64_t v58 = swift_allocObject();
      *(_OWORD *)(v58 + 16) = v78;
      *(void *)(v58 + 32) = 0x6C646E7542707061;
      *(void *)(v58 + 40) = 0xEB00000000444965;
      sub_24D188104(v111);
      swift_bridgeObjectRetain();
      uint64_t v59 = sub_24D195DE0();
      swift_bridgeObjectRelease();
      *(void *)(v58 + 48) = v59;
      *(void *)(v58 + 56) = 0xD000000000000010;
      *(void *)(v58 + 64) = v77;
      swift_bridgeObjectRetain();
      uint64_t v60 = sub_24D195DE0();
      swift_bridgeObjectRelease();
      *(void *)(v58 + 72) = v60;
      *(void *)(v58 + 80) = 0x656D614E707061;
      *(void *)(v58 + 88) = 0xE700000000000000;
      uint64_t v107 = *((void *)&v111[3] + 1);
      uint64_t v108 = *(void *)&v111[3];
      uint64_t v102 = *(void *)&v111[5];
      uint64_t v103 = *(void *)&v111[6];
      uint64_t v106 = *((void *)&v111[7] + 1);
      uint64_t v104 = *((void *)&v111[5] + 1);
      uint64_t v105 = *(void *)&v111[8];
      swift_bridgeObjectRetain();
      uint64_t v61 = sub_24D195DE0();
      swift_bridgeObjectRelease();
      *(void *)(v58 + 96) = v61;
      *(void *)(v58 + 104) = 1751347809;
      *(void *)(v58 + 112) = 0xE400000000000000;
      *(void *)(v58 + 120) = sub_24D195DE0();
      strcpy((char *)(v58 + 128), "binaryCDHash");
      *(unsigned char *)(v58 + 141) = 0;
      *(_WORD *)(v58 + 142) = -5120;
      *(void *)(v58 + 144) = sub_24D195DE0();
      strcpy((char *)(v58 + 152), "binaryLocation");
      *(unsigned char *)(v58 + 167) = -18;
      uint64_t v62 = sub_24D195DE0();
      swift_bridgeObjectRelease();
      *(void *)(v58 + 168) = v62;
      *(void *)(v58 + 176) = 0x61507972616E6962;
      *(void *)(v58 + 184) = 0xEA00000000006874;
      *(void *)(v58 + 192) = sub_24D195DE0();
      strcpy((char *)(v58 + 200), "binaryTeamID");
      *(unsigned char *)(v58 + 213) = 0;
      *(_WORD *)(v58 + 214) = -5120;
      *(void *)(v58 + 216) = sub_24D195DE0();
      *(void *)(v58 + 224) = 0x55557972616E6962;
      *(void *)(v58 + 232) = 0xEA00000000004449;
      *(void *)(v58 + 240) = sub_24D195DE0();
      strcpy((char *)(v58 + 248), "binaryVersion");
      *(_WORD *)(v58 + 262) = -4864;
      *(void *)(v58 + 264) = sub_24D195DE0();
      *(void *)(v58 + 272) = 0x48444362696C7964;
      *(void *)(v58 + 280) = 0xEB00000000687361;
      uint64_t v63 = sub_24D195DE0();
      swift_bridgeObjectRelease();
      *(void *)(v58 + 288) = v63;
      strcpy((char *)(v58 + 296), "dylibLocation");
      *(_WORD *)(v58 + 310) = -4864;
      uint64_t v64 = sub_24D195DE0();
      swift_bridgeObjectRelease();
      *(void *)(v58 + 312) = v64;
      *(void *)(v58 + 320) = 0x74615062696C7964;
      *(void *)(v58 + 328) = 0xE900000000000068;
      uint64_t v65 = sub_24D195DE0();
      swift_bridgeObjectRelease();
      *(void *)(v58 + 336) = v65;
      *(void *)(v58 + 344) = 0x61655462696C7964;
      *(void *)(v58 + 352) = 0xEB0000000044496DLL;
      uint64_t v66 = sub_24D195DE0();
      swift_bridgeObjectRelease();
      *(void *)(v58 + 360) = v66;
      *(void *)(v58 + 368) = 0x49555562696C7964;
      *(void *)(v58 + 376) = 0xE900000000000044;
      uint64_t v67 = sub_24D195DE0();
      swift_bridgeObjectRelease();
      *(void *)(v58 + 384) = v67;
      strcpy((char *)(v58 + 392), "dylibVersion");
      *(unsigned char *)(v58 + 405) = 0;
      *(_WORD *)(v58 + 406) = -5120;
      uint64_t v68 = sub_24D195DE0();
      swift_bridgeObjectRelease();
      *(void *)(v58 + 408) = v68;
      *(void *)(v58 + 416) = 0x656372756F73;
      *(void *)(v58 + 424) = 0xE600000000000000;
      *(void *)(v58 + 432) = sub_24D195DE0();
      *(void *)(v58 + 440) = 0x614E6C6F626D7973;
      *(void *)(v58 + 448) = 0xEA0000000000656DLL;
      *(void *)(v58 + 456) = sub_24D195DE0();
      strcpy((char *)(v58 + 464), "symbolOffset");
      *(unsigned char *)(v58 + 477) = 0;
      *(_WORD *)(v58 + 478) = -5120;
      *(void *)(v58 + 480) = sub_24D195DE0();
      *(void *)(v58 + 488) = 0x794472656C6C6163;
      *(void *)(v58 + 496) = 0xEF6874615062696CLL;
      *(void *)(v58 + 504) = sub_24D195DE0();
      *(void *)(v58 + 512) = 0xD000000000000010;
      *(void *)(v58 + 520) = v75;
      *(void *)(v58 + 528) = sub_24D195DE0();
      unint64_t v69 = sub_24D176428(v58);
      uint64_t v70 = sub_24D196040();
      sub_24D188380(v111);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v110 = v69;
      sub_24D184DD8(v70, 0x6F436C6F626D7973, 0xEB00000000746E75, isUniquelyReferenced_nonNull_native);
      uint64_t v72 = v110;
      swift_bridgeObjectRelease();
      sub_24D18DF38(v72);
      swift_bridgeObjectRelease();
      if (!v109) {
        break;
      }
      uint64_t v48 = v109 - 1;
      uint64_t v49 = v91 + 432;
      uint64_t v33 = v74;
    }
    swift_bridgeObjectRelease();
    sub_24D18853C((uint64_t)v113);
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_24D18853C((uint64_t)v113);
  }
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_24D187368(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A180);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)v72 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for TargetType(0);
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (void *)((char *)v72 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_24D18802C(a1, (uint64_t)v16);
  if (swift_getEnumCaseMultiPayload())
  {
    sub_24D188090((uint64_t)v16);
    sub_24D195FD0();
    sub_24D177C34(0, (unint64_t *)&qword_26985A0D0);
    int64_t v17 = (void *)sub_24D196090();
    sub_24D195CB0();

    LOBYTE(v111[0]) = 0;
    sub_24D18802C(a1, (uint64_t)v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v12, 0, 1, v13);
    LOBYTE(v110) = 11;
    v109[0] = 0u;
    unint64_t v18 = 0xD00000000000004BLL;
    unint64_t v19 = "MachOAnalysisPerformer: AnalyzableTarget type does not match expected value";
LABEL_5:
    sub_24D18C314((unsigned __int8 *)v111, (uint64_t)v12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, (unsigned __int8 *)&v110, v18, (unint64_t)(v19 - 32) | 0x8000000000000000);
    return sub_24D1777B4((uint64_t)v12);
  }
  uint64_t v88 = a5;
  uint64_t v21 = *v16;
  uint64_t v20 = v16[1];
  if (a2())
  {
    swift_bridgeObjectRelease();
    sub_24D195FD0();
    sub_24D177C34(0, (unint64_t *)&qword_26985A0D0);
    uint64_t v22 = (void *)sub_24D196090();
    sub_24D195CB0();

    LOBYTE(v111[0]) = 0;
    sub_24D18802C(a1, (uint64_t)v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v12, 0, 1, v13);
    LOBYTE(v110) = 4;
    v109[0] = 0u;
    unint64_t v18 = 0xD000000000000034;
    unint64_t v19 = "MachOAnalysisPerformer: Interrupted, returning early";
    goto LABEL_5;
  }
  type metadata accessor for MachOParser();
  uint64_t v24 = (void *)swift_allocObject();
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v25 = MEMORY[0x263F8EE78];
  v24[6] = sub_24D176544(MEMORY[0x263F8EE78]);
  v24[7] = v25;
  void v24[2] = v21;
  v24[3] = v20;
  v24[4] = a2;
  v24[5] = a3;
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v26 = (void *)sub_24D195DE0();
  swift_bridgeObjectRelease();
  *(void *)&v109[2] = sub_24D17D7C8;
  *((void *)&v109[2] + 1) = v24;
  *(void *)&v109[0] = MEMORY[0x263EF8330];
  *((void *)&v109[0] + 1) = 1107296256;
  *(void *)&v109[1] = sub_24D17E354;
  *((void *)&v109[1] + 1) = &block_descriptor_3;
  uint64_t v27 = _Block_copy(v109);
  swift_retain();
  swift_release();
  nm_macho_for_each_slice(v26, v27);
  _Block_release(v27);
  swift_release();

  uint64_t v28 = sub_24D180C04();
  uint64_t v110 = v28;
  if (a4)
  {
    uint64_t v29 = v28;
    sub_24D195FE0();
    sub_24D177C34(0, (unint64_t *)&qword_26985A0D0);
    uint64_t v30 = (void *)sub_24D196090();
    sub_24D195CB0();

    uint64_t v31 = sub_24D180ED0();
    if (v31)
    {
      if (v29) {
        sub_24D180D74(v31);
      }
      else {
        swift_bridgeObjectRelease();
      }
    }
  }
  sub_24D178764(v21, v20, v111);
  if (v110) {
    uint64_t v32 = v110;
  }
  else {
    uint64_t v32 = v25;
  }
  uint64_t v33 = *(void *)(v32 + 16);
  if (v33)
  {
    v72[1] = v24;
    uint64_t v34 = v111[2];
    uint64_t v35 = v111[3];
    uint64_t v36 = v111[4];
    uint64_t v37 = v111[5];
    uint64_t v39 = v111[6];
    uint64_t v38 = v111[7];
    uint64_t v40 = sub_24D177C34(0, &qword_26985A228);
    if (v35) {
      uint64_t v41 = v34;
    }
    else {
      uint64_t v41 = 0x6E776F6E6B6E75;
    }
    uint64_t v83 = v41;
    uint64_t v84 = v40;
    unint64_t v42 = 0xE700000000000000;
    uint64_t v86 = v37;
    uint64_t v87 = v35;
    if (v35) {
      unint64_t v43 = v35;
    }
    else {
      unint64_t v43 = 0xE700000000000000;
    }
    if (v37) {
      uint64_t v44 = v36;
    }
    else {
      uint64_t v44 = 0x6E776F6E6B6E75;
    }
    uint64_t v81 = v44;
    unint64_t v82 = v43;
    if (v37) {
      unint64_t v45 = v37;
    }
    else {
      unint64_t v45 = 0xE700000000000000;
    }
    if (v38) {
      uint64_t v46 = v39;
    }
    else {
      uint64_t v46 = 0x6E776F6E6B6E75;
    }
    uint64_t v79 = v46;
    unint64_t v80 = v45;
    uint64_t v85 = v38;
    if (v38) {
      unint64_t v42 = v38;
    }
    unint64_t v78 = v42;
    swift_bridgeObjectRetain();
    uint64_t v47 = v33 - 1;
    uint64_t v48 = 32;
    long long v77 = xmmword_24D197150;
    unint64_t v75 = 0x800000024D198EF0;
    unint64_t v76 = 0x800000024D198ED0;
    uint64_t v73 = v32;
    unint64_t v74 = 0x800000024D198D60;
    while (1)
    {
      memcpy(v109, (const void *)(v32 + v48), sizeof(v109));
      uint64_t v107 = v47;
      uint64_t v89 = v48;
      if (*((void *)&v109[16] + 1))
      {
        unint64_t v49 = *((void *)&v109[17] + 1);
        if (*((void *)&v109[17] + 1))
        {
          uint64_t v98 = *(void *)&v109[17];
          uint64_t v50 = *(void *)&v109[19];
          long long v90 = *(_OWORD *)((char *)&v109[20] + 8);
          unint64_t v51 = *(void *)&v109[20];
          uint64_t v95 = *((void *)&v109[18] + 1);
          uint64_t v96 = *((void *)&v109[21] + 1);
          unint64_t v52 = *(void *)&v109[22];
          uint64_t v91 = LOBYTE(v109[18]);
          uint64_t v92 = *((void *)&v109[19] + 1);
          swift_bridgeObjectRetain();
          uint64_t v94 = v50;
          swift_bridgeObjectRetain();
          unint64_t v93 = v51;
          swift_bridgeObjectRetain();
          unint64_t v99 = v49;
          swift_bridgeObjectRetain();
          unint64_t v97 = v52;
          swift_bridgeObjectRetain();
        }
        else
        {
          uint64_t v94 = *((void *)&v109[16] + 1);
          uint64_t v95 = *(void *)&v109[16];
          swift_bridgeObjectRetain();
          uint64_t v96 = 0x6E776F6E6B6E75;
          unint64_t v97 = 0xE700000000000000;
          uint64_t v91 = 5;
          uint64_t v98 = 0x6E776F6E6B6E75;
          unint64_t v99 = 0xE700000000000000;
          uint64_t v92 = 0x6E776F6E6B6E75;
          unint64_t v93 = 0xE700000000000000;
          *(void *)&long long v90 = 0x6E776F6E6B6E75;
          *((void *)&v90 + 1) = 0xE700000000000000;
        }
      }
      else
      {
        unint64_t v53 = *(void *)&v109[10];
        uint64_t v98 = *((void *)&v109[9] + 1);
        uint64_t v91 = BYTE8(v109[10]);
        uint64_t v54 = *((void *)&v109[11] + 1);
        unint64_t v55 = *((void *)&v109[12] + 1);
        uint64_t v92 = *(void *)&v109[12];
        uint64_t v95 = *(void *)&v109[11];
        unint64_t v56 = *((void *)&v109[14] + 1);
        uint64_t v96 = *(void *)&v109[14];
        long long v90 = v109[13];
        swift_bridgeObjectRetain();
        uint64_t v94 = v54;
        swift_bridgeObjectRetain();
        unint64_t v93 = v55;
        swift_bridgeObjectRetain();
        unint64_t v99 = v53;
        swift_bridgeObjectRetain();
        unint64_t v97 = v56;
        swift_bridgeObjectRetain();
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_26985A230);
      uint64_t v57 = swift_allocObject();
      *(_OWORD *)(v57 + 16) = v77;
      *(void *)(v57 + 32) = 0x6C646E7542707061;
      *(void *)(v57 + 40) = 0xEB00000000444965;
      sub_24D188104(v109);
      swift_bridgeObjectRetain();
      uint64_t v58 = sub_24D195DE0();
      swift_bridgeObjectRelease();
      *(void *)(v57 + 48) = v58;
      *(void *)(v57 + 56) = 0xD000000000000010;
      *(void *)(v57 + 64) = v76;
      swift_bridgeObjectRetain();
      uint64_t v59 = sub_24D195DE0();
      swift_bridgeObjectRelease();
      *(void *)(v57 + 72) = v59;
      *(void *)(v57 + 80) = 0x656D614E707061;
      *(void *)(v57 + 88) = 0xE700000000000000;
      uint64_t v105 = *((void *)&v109[3] + 1);
      uint64_t v106 = *(void *)&v109[3];
      uint64_t v100 = *(void *)&v109[5];
      uint64_t v101 = *(void *)&v109[6];
      uint64_t v104 = *((void *)&v109[7] + 1);
      uint64_t v102 = *((void *)&v109[5] + 1);
      uint64_t v103 = *(void *)&v109[8];
      swift_bridgeObjectRetain();
      uint64_t v60 = sub_24D195DE0();
      swift_bridgeObjectRelease();
      *(void *)(v57 + 96) = v60;
      *(void *)(v57 + 104) = 1751347809;
      *(void *)(v57 + 112) = 0xE400000000000000;
      *(void *)(v57 + 120) = sub_24D195DE0();
      strcpy((char *)(v57 + 128), "binaryCDHash");
      *(unsigned char *)(v57 + 141) = 0;
      *(_WORD *)(v57 + 142) = -5120;
      *(void *)(v57 + 144) = sub_24D195DE0();
      strcpy((char *)(v57 + 152), "binaryLocation");
      *(unsigned char *)(v57 + 167) = -18;
      uint64_t v61 = sub_24D195DE0();
      swift_bridgeObjectRelease();
      *(void *)(v57 + 168) = v61;
      *(void *)(v57 + 176) = 0x61507972616E6962;
      *(void *)(v57 + 184) = 0xEA00000000006874;
      *(void *)(v57 + 192) = sub_24D195DE0();
      strcpy((char *)(v57 + 200), "binaryTeamID");
      *(unsigned char *)(v57 + 213) = 0;
      *(_WORD *)(v57 + 214) = -5120;
      *(void *)(v57 + 216) = sub_24D195DE0();
      *(void *)(v57 + 224) = 0x55557972616E6962;
      *(void *)(v57 + 232) = 0xEA00000000004449;
      *(void *)(v57 + 240) = sub_24D195DE0();
      strcpy((char *)(v57 + 248), "binaryVersion");
      *(_WORD *)(v57 + 262) = -4864;
      *(void *)(v57 + 264) = sub_24D195DE0();
      *(void *)(v57 + 272) = 0x48444362696C7964;
      *(void *)(v57 + 280) = 0xEB00000000687361;
      uint64_t v62 = sub_24D195DE0();
      swift_bridgeObjectRelease();
      *(void *)(v57 + 288) = v62;
      strcpy((char *)(v57 + 296), "dylibLocation");
      *(_WORD *)(v57 + 310) = -4864;
      uint64_t v63 = sub_24D195DE0();
      swift_bridgeObjectRelease();
      *(void *)(v57 + 312) = v63;
      *(void *)(v57 + 320) = 0x74615062696C7964;
      *(void *)(v57 + 328) = 0xE900000000000068;
      uint64_t v64 = sub_24D195DE0();
      swift_bridgeObjectRelease();
      *(void *)(v57 + 336) = v64;
      *(void *)(v57 + 344) = 0x61655462696C7964;
      *(void *)(v57 + 352) = 0xEB0000000044496DLL;
      uint64_t v65 = sub_24D195DE0();
      swift_bridgeObjectRelease();
      *(void *)(v57 + 360) = v65;
      *(void *)(v57 + 368) = 0x49555562696C7964;
      *(void *)(v57 + 376) = 0xE900000000000044;
      uint64_t v66 = sub_24D195DE0();
      swift_bridgeObjectRelease();
      *(void *)(v57 + 384) = v66;
      strcpy((char *)(v57 + 392), "dylibVersion");
      *(unsigned char *)(v57 + 405) = 0;
      *(_WORD *)(v57 + 406) = -5120;
      uint64_t v67 = sub_24D195DE0();
      swift_bridgeObjectRelease();
      *(void *)(v57 + 408) = v67;
      *(void *)(v57 + 416) = 0x656372756F73;
      *(void *)(v57 + 424) = 0xE600000000000000;
      *(void *)(v57 + 432) = sub_24D195DE0();
      *(void *)(v57 + 440) = 0x614E6C6F626D7973;
      *(void *)(v57 + 448) = 0xEA0000000000656DLL;
      *(void *)(v57 + 456) = sub_24D195DE0();
      strcpy((char *)(v57 + 464), "symbolOffset");
      *(unsigned char *)(v57 + 477) = 0;
      *(_WORD *)(v57 + 478) = -5120;
      *(void *)(v57 + 480) = sub_24D195DE0();
      *(void *)(v57 + 488) = 0x794472656C6C6163;
      *(void *)(v57 + 496) = 0xEF6874615062696CLL;
      *(void *)(v57 + 504) = sub_24D195DE0();
      *(void *)(v57 + 512) = 0xD000000000000010;
      *(void *)(v57 + 520) = v74;
      *(void *)(v57 + 528) = sub_24D195DE0();
      unint64_t v68 = sub_24D176428(v57);
      uint64_t v69 = sub_24D196040();
      sub_24D188380(v109);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v108 = v68;
      sub_24D184DD8(v69, 0x6F436C6F626D7973, 0xEB00000000746E75, isUniquelyReferenced_nonNull_native);
      uint64_t v71 = v108;
      swift_bridgeObjectRelease();
      sub_24D18F9EC(v71);
      swift_bridgeObjectRelease();
      if (!v107) {
        break;
      }
      uint64_t v47 = v107 - 1;
      uint64_t v48 = v89 + 432;
      uint64_t v32 = v73;
    }
    swift_bridgeObjectRelease();
    sub_24D18853C((uint64_t)v111);
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_24D18853C((uint64_t)v111);
  }
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_24D18802C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TargetType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24D188090(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TargetType(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
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

void *sub_24D188104(void *a1)
{
  uint64_t v5 = a1[33];
  uint64_t v6 = a1[32];
  uint64_t v3 = a1[35];
  uint64_t v4 = a1[34];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24D1882BC(v6, v5, v4, v3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void sub_24D1882BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    sub_24D177B0C(a3, a4);
  }
}

void *sub_24D188380(void *a1)
{
  uint64_t v5 = a1[33];
  uint64_t v6 = a1[32];
  uint64_t v3 = a1[35];
  uint64_t v4 = a1[34];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24D17DD90(v6, v5, v4, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24D18853C(uint64_t a1)
{
  return a1;
}

void sub_24D1885AC()
{
  qword_26985AAE8 = -1;
}

uint64_t sub_24D1885BC()
{
  if (*(unsigned char *)(v0 + 104) != 1) {
    return *(void *)(v0 + 96);
  }
  uint64_t result = 0;
  *(void *)(v0 + 96) = 0;
  *(unsigned char *)(v0 + 104) = 0;
  return result;
}

uint64_t sub_24D1885E0()
{
  *(void *)(v0 + 16) = 0xD000000000000052;
  *(void *)(v0 + 24) = 0x800000024D199560;
  *(void *)(v0 + 32) = 0x6F6E67695F707061;
  *(void *)(v0 + 40) = 0xEF7473696C5F6572;
  *(void *)(v0 + 48) = 0xD000000000000012;
  *(void *)(v0 + 56) = 0x800000024D1995C0;
  *(void *)(v0 + 64) = 0xD00000000000001ELL;
  *(void *)(v0 + 72) = 0x800000024D1995E0;
  *(void *)(v0 + 80) = 0xD000000000000012;
  *(void *)(v0 + 88) = 0x800000024D199600;
  *(void *)(v0 + 96) = 0;
  *(unsigned char *)(v0 + 104) = 1;
  sub_24D1886AC();
  return v0;
}

uint64_t sub_24D1886AC()
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A180);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = (const char *)(sub_24D195E60() + 32);
  ppDb[0] = (sqlite3 *)sub_24D1885BC();
  LODWORD(v4) = sqlite3_open_v2(v4, ppDb, 4194305, 0);
  *(sqlite3 **)(v0 + 96) = ppDb[0];
  *(unsigned char *)(v0 + 104) = 0;
  uint64_t result = swift_release();
  if (v4)
  {
    int v6 = sqlite3_extended_errcode(*(sqlite3 **)(v0 + 96));
    BOOL v7 = sub_24D189D94(0xD000000000000029);
    uint64_t v9 = v8;
    sqlite3_close(*(sqlite3 **)(v0 + 96));
    unsigned __int8 v16 = 3;
    uint64_t v10 = type metadata accessor for TargetType(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v3, 1, 1, v10);
    unsigned __int8 v15 = 12;
    ppDb[0] = 0;
    ppDb[1] = (sqlite3 *)0xE000000000000000;
    sub_24D196150();
    swift_bridgeObjectRelease();
    ppDb[0] = (sqlite3 *)0xD000000000000029;
    ppDb[1] = (sqlite3 *)0x800000024D1994D0;
    int v14 = v6;
    sub_24D196240();
    sub_24D195E80();
    swift_bridgeObjectRelease();
    uint64_t v11 = ppDb[0];
    uint64_t v12 = ppDb[1];
    *(_OWORD *)ppDb = 0u;
    sub_24D18C314(&v16, (uint64_t)v3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, &v15, (unint64_t)v11, (uint64_t)v12);
    swift_bridgeObjectRelease();
    sub_24D182BD0((uint64_t)v3, &qword_26985A180);
    sub_24D18B448();
    swift_allocError();
    char *v13 = v7;
    v13[1] = v9;
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_24D18892C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A180);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = (sqlite3 *)sub_24D1885BC();
  uint64_t result = sqlite3_close(v3);
  if (result)
  {
    int v5 = result;
    unsigned __int8 v15 = 3;
    uint64_t v6 = type metadata accessor for TargetType(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v2, 1, 1, v6);
    unsigned __int8 v14 = 12;
    *(void *)&long long v13 = 0;
    *((void *)&v13 + 1) = 0xE000000000000000;
    sub_24D196150();
    swift_bridgeObjectRelease();
    *(void *)&long long v13 = 0xD00000000000002ALL;
    *((void *)&v13 + 1) = 0x800000024D199440;
    v12[1] = v5;
    sub_24D196240();
    sub_24D195E80();
    swift_bridgeObjectRelease();
    long long v7 = v13;
    long long v13 = 0u;
    sub_24D18C314(&v15, (uint64_t)v2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, &v14, v7, *((uint64_t *)&v7 + 1));
    swift_bridgeObjectRelease();
    sub_24D182BD0((uint64_t)v2, &qword_26985A180);
    int v8 = sub_24D189D94(0xD00000000000002ALL);
    uint64_t v10 = v9;
    sub_24D18B448();
    swift_allocError();
    sqlite3 *v11 = v8;
    v11[1] = v10;
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_24D188B38(int a1, unint64_t a2, unint64_t a3)
{
  int v68 = a1;
  uint64_t v79 = *MEMORY[0x263EF8340];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A180);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v66 = (char *)&v63 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24D195D80();
  uint64_t v73 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v63 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v11 = sub_24D195D70();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  *(void *)&long long v72 = (char *)&v63 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v71 = (char *)&v63 - v15;
  swift_bridgeObjectRetain();
  unint64_t v65 = a2;
  unint64_t v67 = a3;
  uint64_t v16 = sub_24D189864(a2, a3);
  unint64_t v18 = v17;
  uint64_t v19 = sub_24D18B22C(&qword_26985A238, MEMORY[0x263F04818]);
  sub_24D195D60();
  unint64_t v69 = v11;
  uint64_t v70 = v12;
  switch(v18 >> 62)
  {
    case 1uLL:
      if (v16 >> 32 < (int)v16) {
        __break(1u);
      }
      sub_24D18B1D4(v16, v18);
      uint64_t v12 = v70;
      sub_24D18B0F4((int)v16, v16 >> 32);
      uint64_t v64 = v3;
      sub_24D17D6D0(v16, v18);
      unint64_t v11 = v69;
      break;
    case 2uLL:
      uint64_t v20 = *(void *)(v16 + 16);
      uint64_t v21 = *(void *)(v16 + 24);
      sub_24D18B1D4(v16, v18);
      swift_retain();
      swift_retain();
      sub_24D18B0F4(v20, v21);
      if (v3) {
        goto LABEL_40;
      }
      uint64_t v64 = 0;
      swift_release();
      swift_release();
      sub_24D17D6D0(v16, v18);
      unint64_t v11 = v69;
      uint64_t v12 = v70;
      break;
    case 3uLL:
      uint64_t v64 = v3;
      *(void *)((char *)&v78 + 6) = 0;
      *(void *)&long long v78 = 0;
      goto LABEL_6;
    default:
      uint64_t v64 = v3;
      *(void *)&long long v78 = v16;
      WORD4(v78) = v18;
      BYTE10(v78) = BYTE2(v18);
      BYTE11(v78) = BYTE3(v18);
      BYTE12(v78) = BYTE4(v18);
      BYTE13(v78) = BYTE5(v18);
LABEL_6:
      sub_24D195D40();
      sub_24D17D6D0(v16, v18);
      break;
  }
  uint64_t v22 = v71;
  sub_24D195D50();
  (*(void (**)(char *, uint64_t))(v73 + 8))(v10, v8);
  sub_24D17D6D0(v16, v18);
  (*(void (**)(void, char *, unint64_t))(v12 + 16))(v72, v22, v11);
  sub_24D18B22C(&qword_26985A240, MEMORY[0x263F045F0]);
  sub_24D195F40();
  uint64_t v24 = *((void *)&v78 + 1);
  uint64_t v23 = (sqlite3_stmt *)v78;
  uint64_t v25 = *(void *)(v78 + 16);
  if (*((void *)&v78 + 1) != v25)
  {
    if (*((uint64_t *)&v78 + 1) < v25)
    {
      uint64_t v73 = v78 + 32;
      uint64_t v10 = (char *)MEMORY[0x263F8EE78];
      long long v72 = xmmword_24D196C10;
      unint64_t v11 = *((void *)&v78 + 1);
      while ((v24 & 0x8000000000000000) == 0)
      {
        if (v11 >= *((void *)v23 + 2)) {
          goto LABEL_35;
        }
        char v34 = *(unsigned char *)(v73 + v11);
        __swift_instantiateConcreteTypeFromMangledName(&qword_269859FE8);
        uint64_t v35 = swift_allocObject();
        *(_OWORD *)(v35 + 16) = v72;
        *(void *)(v35 + 56) = MEMORY[0x263F8E778];
        *(void *)(v35 + 64) = MEMORY[0x263F8E7C0];
        *(unsigned char *)(v35 + 32) = v34;
        uint64_t v36 = sub_24D195E20();
        uint64_t v19 = v37;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v10 = (char *)sub_24D18A110(0, *((void *)v10 + 2) + 1, 1, v10);
        }
        unint64_t v39 = *((void *)v10 + 2);
        unint64_t v38 = *((void *)v10 + 3);
        if (v39 >= v38 >> 1) {
          uint64_t v10 = (char *)sub_24D18A110((void *)(v38 > 1), v39 + 1, 1, v10);
        }
        ++v11;
        *((void *)v10 + 2) = v39 + 1;
        uint64_t v40 = &v10[16 * v39];
        *((void *)v40 + 4) = v36;
        *((void *)v40 + 5) = v19;
        if (v25 == v11) {
          goto LABEL_11;
        }
      }
      __break(1u);
LABEL_35:
      __break(1u);
    }
    __break(1u);
LABEL_37:
    swift_once();
    goto LABEL_28;
  }
  uint64_t v10 = (char *)MEMORY[0x263F8EE78];
LABEL_11:
  swift_bridgeObjectRelease();
  *(void *)&long long v78 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985A188);
  sub_24D18B274();
  uint64_t v26 = sub_24D195DC0();
  unint64_t v28 = v27;
  swift_bridgeObjectRelease();
  os_log_type_t v29 = sub_24D195FC0();
  sub_24D178CF8();
  unint64_t v30 = v67;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v31 = sub_24D196090();
  if (os_log_type_enabled(v31, v29))
  {
    uint64_t v32 = swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    *(void *)&long long v78 = v33;
    *(_DWORD *)uint64_t v32 = 136315394;
    swift_bridgeObjectRetain();
    ppStmt = (sqlite3_stmt *)sub_24D18A654(v65, v30, (uint64_t *)&v78);
    sub_24D1960A0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v32 + 12) = 2080;
    swift_bridgeObjectRetain();
    ppStmt = (sqlite3_stmt *)sub_24D18A654(v26, v28, (uint64_t *)&v78);
    sub_24D1960A0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24D172000, v31, v29, "Hash for %s = %s", (uint8_t *)v32, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x253320910](v33, -1, -1);
    MEMORY[0x253320910](v32, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }

  uint64_t v19 = v70;
  unint64_t v11 = 0xD000000000000015;
  *(void *)&long long v78 = 0;
  *((void *)&v78 + 1) = 0xE000000000000000;
  sub_24D196150();
  swift_bridgeObjectRelease();
  *(void *)&long long v78 = 0xD000000000000015;
  *((void *)&v78 + 1) = 0x800000024D199100;
  swift_bridgeObjectRetain();
  sub_24D195E80();
  swift_bridgeObjectRelease();
  sub_24D195E80();
  swift_bridgeObjectRetain();
  sub_24D195E80();
  swift_bridgeObjectRelease();
  sub_24D195E80();
  ppStmt = 0;
  uint64_t v41 = (sqlite3 *)sub_24D1885BC();
  uint64_t v42 = sub_24D195E60();
  swift_bridgeObjectRelease();
  int v43 = sqlite3_prepare_v2(v41, (const char *)(v42 + 32), -1, &ppStmt, 0);
  swift_release();
  uint64_t v23 = ppStmt;
  if (!ppStmt || v43)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v76 = 3;
    uint64_t v49 = type metadata accessor for TargetType(0);
    uint64_t v50 = (uint64_t)v66;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56))(v66, 1, 1, v49);
    unsigned __int8 v75 = 12;
    *(void *)&long long v78 = 0;
    *((void *)&v78 + 1) = 0xE000000000000000;
    sub_24D196150();
    sub_24D195E80();
    int v74 = v43;
    sub_24D196240();
    sub_24D195E80();
    swift_bridgeObjectRelease();
    long long v51 = v78;
    long long v78 = 0u;
    sub_24D18C314(&v76, v50, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, &v75, v51, *((uint64_t *)&v51 + 1));
    swift_bridgeObjectRelease();
    sub_24D182BD0(v50, &qword_26985A180);
    uint64_t v48 = sub_24D189D94(0xD00000000000003DLL);
    uint64_t v53 = v52;
    sub_24D18B448();
    swift_allocError();
    *uint64_t v54 = v48;
    v54[1] = v53;
    swift_willThrow();
LABEL_32:
    (*(void (**)(char *, unint64_t))(v19 + 8))(v71, v69);
    return v48 & 1;
  }
  id v44 = (id) sub_24D195DE0();
  unint64_t v45 = (char *)objc_msgSend(v44, sel_UTF8String);
  if (!v45)
  {
    __break(1u);
LABEL_40:
    swift_release();
    swift_release();
    __break(1u);
    JUMPOUT(0x24D189854);
  }
  uint64_t v10 = v45;
  swift_bridgeObjectRelease();

  if (qword_269859FE0 != -1) {
    goto LABEL_37;
  }
LABEL_28:
  sqlite3_bind_text(v23, 1, v10, -1, (void (__cdecl *)(void *))qword_26985AAE8);
  uint64_t v46 = ppStmt;
  int v47 = sqlite3_step(ppStmt);
  if (v47 != 100)
  {
    int v55 = v47;
    unsigned __int8 v76 = 3;
    uint64_t v56 = type metadata accessor for TargetType(0);
    uint64_t v57 = (uint64_t)v66;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v56 - 8) + 56))(v66, 1, 1, v56);
    unsigned __int8 v75 = 12;
    *(void *)&long long v78 = 0;
    *((void *)&v78 + 1) = 0xE000000000000000;
    sub_24D196150();
    sub_24D195E80();
    int v74 = v55;
    sub_24D196240();
    sub_24D195E80();
    swift_bridgeObjectRelease();
    long long v58 = v78;
    long long v78 = 0u;
    sub_24D18C314(&v76, v57, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, &v75, v58, *((uint64_t *)&v58 + 1));
    swift_bridgeObjectRelease();
    sub_24D182BD0(v57, &qword_26985A180);
    uint64_t v48 = sub_24D189D94(v11 + 29);
    uint64_t v60 = v59;
    sub_24D18B448();
    swift_allocError();
    *uint64_t v61 = v48;
    v61[1] = v60;
    swift_willThrow();
    sqlite3_finalize(ppStmt);
    goto LABEL_32;
  }
  LOBYTE(v48) = sqlite3_column_int(v46, 0) > 0;
  sqlite3_finalize(v46);
  (*(void (**)(char *, unint64_t))(v19 + 8))(v71, v69);
  return v48 & 1;
}

uint64_t sub_24D189864(unint64_t a1, unint64_t a2)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  *(void *)&long long v40 = a1;
  *((void *)&v40 + 1) = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985A258);
  if (swift_dynamicCast())
  {
    sub_24D18B9CC(v38, (uint64_t)&v41);
    __swift_project_boxed_opaque_existential_1(&v41, v43);
    sub_24D195AF0();
    swift_bridgeObjectRelease();
    v38[0] = v40;
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v41);
    return *(void *)&v38[0];
  }
  uint64_t v39 = 0;
  memset(v38, 0, sizeof(v38));
  sub_24D182BD0((uint64_t)v38, &qword_26985A260);
  unint64_t v2 = a1;
  unint64_t v3 = a2;
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) != 0)
    {
      uint64_t v41 = a1;
      uint64_t v42 = a2 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v6 = (char *)&v41 + (HIBYTE(a2) & 0xF);
      uint64_t v7 = &v41;
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v4 = sub_24D196180();
      }
      if (v4) {
        uint64_t v6 = (unsigned char *)(v4 + v5);
      }
      else {
        uint64_t v6 = 0;
      }
      uint64_t v7 = (uint64_t *)v4;
    }
    uint64_t v8 = sub_24D18B848(v7, v6);
    unint64_t v10 = v9;
    if (v9 >> 60 != 15)
    {
      swift_bridgeObjectRelease();
      *(void *)&v38[0] = v8;
      *((void *)&v38[0] + 1) = v10;
      return *(void *)&v38[0];
    }
    unint64_t v2 = a1;
    unint64_t v3 = a2;
    if ((a2 & 0x1000000000000000) == 0) {
      goto LABEL_14;
    }
LABEL_70:
    uint64_t v11 = sub_24D195EC0();
    goto LABEL_17;
  }
LABEL_69:
  uint64_t v8 = 0;
  unint64_t v10 = 0xF000000000000000;
  if ((v3 & 0x1000000000000000) != 0) {
    goto LABEL_70;
  }
LABEL_14:
  if ((v3 & 0x2000000000000000) != 0) {
    uint64_t v11 = HIBYTE(v3) & 0xF;
  }
  else {
    uint64_t v11 = v2 & 0xFFFFFFFFFFFFLL;
  }
LABEL_17:
  *(void *)&v38[0] = sub_24D18B8AC(v11);
  *((void *)&v38[0] + 1) = v12;
  MEMORY[0x270FA5388](*(void *)&v38[0]);
  unint64_t v13 = (unint64_t)sub_24D18AC54((void *(*)(uint64_t *__return_ptr, char *, char *))sub_24D18B94C);
  uint64_t v16 = *((void *)&v38[0] + 1) >> 62;
  uint64_t v17 = v13;
  uint64_t v18 = v3;
  unint64_t v19 = v14;
  switch(*((void *)&v38[0] + 1) >> 62)
  {
    case 1:
      LODWORD(v20) = DWORD1(v38[0]) - LODWORD(v38[0]);
      if (__OFSUB__(DWORD1(v38[0]), v38[0])) {
        goto LABEL_73;
      }
      uint64_t v20 = (int)v20;
LABEL_23:
      if (v15 != v20)
      {
        if (v16)
        {
          if (v16 == 1) {
            uint64_t v24 = *(uint64_t *)&v38[0] >> 32;
          }
          else {
            uint64_t v24 = *(void *)(*(void *)&v38[0] + 24);
          }
        }
        else
        {
          uint64_t v24 = BYTE14(v38[0]);
        }
LABEL_61:
        if (v24 < v15)
        {
          __break(1u);
LABEL_73:
          __break(1u);
LABEL_74:
          __break(1u);
        }
        sub_24D195C00();
LABEL_63:
        swift_bridgeObjectRelease();
        goto LABEL_64;
      }
LABEL_29:
      if ((v3 & 0x2000000000000000) != 0) {
        unint64_t v25 = HIBYTE(v3) & 0xF;
      }
      else {
        unint64_t v25 = v13 & 0xFFFFFFFFFFFFLL;
      }
      *(void *)((char *)&v40 + 7) = 0;
      *(void *)&long long v40 = 0;
      if (4 * v25 == v14 >> 14) {
        goto LABEL_58;
      }
      LOBYTE(v26) = 0;
      uint64_t v27 = (v13 >> 59) & 1;
      if ((v3 & 0x1000000000000000) == 0) {
        LOBYTE(v27) = 1;
      }
      uint64_t v28 = 4 << v27;
      uint64_t v35 = v3 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v33 = (uint64_t)v8;
      uint64_t v34 = (v3 & 0xFFFFFFFFFFFFFFFLL) + 32;
      break;
    case 2:
      uint64_t v22 = *(void *)(*(void *)&v38[0] + 16);
      uint64_t v21 = *(void *)(*(void *)&v38[0] + 24);
      BOOL v23 = __OFSUB__(v21, v22);
      uint64_t v20 = v21 - v22;
      if (!v23) {
        goto LABEL_23;
      }
      goto LABEL_74;
    case 3:
      if (!v15) {
        goto LABEL_29;
      }
      uint64_t v24 = 0;
      goto LABEL_61;
    default:
      uint64_t v20 = BYTE14(v38[0]);
      goto LABEL_23;
  }
  do
  {
    unint64_t v29 = v19 & 0xC;
    unint64_t v2 = v19;
    if (v29 == v28) {
      unint64_t v2 = sub_24D189F84(v19, v17, v18);
    }
    unint64_t v30 = v2 >> 16;
    if (v2 >> 16 >= v25)
    {
      __break(1u);
LABEL_67:
      __break(1u);
LABEL_68:
      __break(1u);
      goto LABEL_69;
    }
    if ((v18 & 0x1000000000000000) != 0)
    {
      unint64_t v2 = sub_24D195EF0();
      char v31 = v2;
      if (v29 != v28) {
        goto LABEL_47;
      }
    }
    else if ((v18 & 0x2000000000000000) != 0)
    {
      uint64_t v41 = v17;
      uint64_t v42 = v35;
      char v31 = *((unsigned char *)&v41 + v30);
      if (v29 != v28) {
        goto LABEL_47;
      }
    }
    else
    {
      unint64_t v2 = v34;
      if ((v17 & 0x1000000000000000) == 0) {
        unint64_t v2 = sub_24D196180();
      }
      char v31 = *(unsigned char *)(v2 + v30);
      if (v29 != v28)
      {
LABEL_47:
        if ((v18 & 0x1000000000000000) == 0) {
          goto LABEL_48;
        }
        goto LABEL_51;
      }
    }
    unint64_t v2 = sub_24D189F84(v19, v17, v18);
    unint64_t v19 = v2;
    if ((v18 & 0x1000000000000000) == 0)
    {
LABEL_48:
      unint64_t v19 = (v19 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_53;
    }
LABEL_51:
    if (v25 <= v19 >> 16) {
      goto LABEL_68;
    }
    unint64_t v2 = sub_24D195ED0();
    unint64_t v19 = v2;
LABEL_53:
    *((unsigned char *)&v40 + v26) = v31;
    unsigned int v26 = v26 + 1;
    if ((v26 >> 8)) {
      goto LABEL_67;
    }
    BYTE14(v40) = v26;
    if (v26 == 14)
    {
      uint64_t v41 = v40;
      LODWORD(v42) = DWORD2(v40);
      WORD2(v42) = WORD6(v40);
      sub_24D195C10();
      LOBYTE(v26) = 0;
      BYTE14(v40) = 0;
    }
  }
  while (4 * v25 != v19 >> 14);
  uint64_t v8 = (unsigned char *)v33;
  if ((_BYTE)v26)
  {
    uint64_t v41 = v40;
    LODWORD(v42) = DWORD2(v40);
    WORD2(v42) = WORD6(v40);
    sub_24D195C10();
    sub_24D18B9B8(v33, v10);
    goto LABEL_63;
  }
LABEL_58:
  swift_bridgeObjectRelease();
  sub_24D18B9B8((uint64_t)v8, v10);
LABEL_64:
  swift_bridgeObjectRelease();
  return *(void *)&v38[0];
}

const char *sub_24D189D94(uint64_t a1)
{
  swift_bridgeObjectRetain();
  sub_24D195E80();
  sub_24D196240();
  sub_24D195E80();
  swift_bridgeObjectRelease();
  sub_24D195E80();
  uint64_t v1 = (sqlite3 *)sub_24D1885BC();
  uint64_t result = sqlite3_errmsg(v1);
  if (result)
  {
    sub_24D195E90();
    sub_24D195E80();
    swift_bridgeObjectRelease();
    return (const char *)a1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24D189E54()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 105, 7);
}

uint64_t type metadata accessor for IgnoreListDataStore()
{
  return self;
}

uint64_t sub_24D189ED0(uint64_t result, unsigned char **a2)
{
  unint64_t v2 = *a2;
  unsigned char *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_24D189EE0(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

void *sub_24D189F1C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985A250);
  uint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24D189F84(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_24D195F00();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x25331FD60](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

char *sub_24D18A000(char *result, int64_t a2, char a3, char *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26985A270);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 29;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 2);
      unint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)MEMORY[0x263F8EE78];
      unint64_t v13 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 32]) {
          memmove(v13, a4 + 32, 4 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_24D18B35C(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_24D18A110(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26985A060);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
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
    sub_24D18B49C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_24D18A220(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26985A268);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 432);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[54 * v8 + 4]) {
          memmove(v12, a4 + 4, 432 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_24D18B654(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_24D18A34C(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    unint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985A278);
  uint64_t v10 = *(void *)(sub_24D195BD0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_24D1961C0();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_24D195BD0() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_24D18BA98(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_24D18A5B4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_24D18A5DC(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_24D18A654(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_24D1960A0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_24D18A654(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24D18A728(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24D178708((uint64_t)v12, *a3);
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
      sub_24D178708((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_24D18A728(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24D1960B0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24D18A8E4(a5, a6);
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
  uint64_t v8 = sub_24D196180();
  if (!v8)
  {
    sub_24D1961C0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24D196210();
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

uint64_t sub_24D18A8E4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24D18A97C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24D18AAF4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24D18AAF4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24D18A97C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24D189F1C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24D196160();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24D1961C0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24D195EC0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24D196210();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24D1961C0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t sub_24D18AAF4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26985A250);
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
  uint64_t result = sub_24D196210();
  __break(1u);
  return result;
}

unsigned char **sub_24D18AC44(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

char *sub_24D18AC54(void *(*a1)(uint64_t *__return_ptr, char *, char *))
{
  v16[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = *v1;
  unint64_t v3 = v1[1];
  uint64_t v5 = v1;
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)uint64_t v1 = xmmword_24D197160;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v11 = v4 >> 32;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_16;
      }
      if (v11 < (int)v4) {
        goto LABEL_23;
      }
      if (sub_24D195AA0() && __OFSUB__((int)v4, sub_24D195AD0())) {
        goto LABEL_24;
      }
      sub_24D195AE0();
      swift_allocObject();
      uint64_t v13 = sub_24D195A80();
      swift_release();
      uint64_t v9 = v13;
      uint64_t v11 = v4 >> 32;
LABEL_16:
      if (v11 < (int)v4)
      {
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
      }
      uint64_t result = sub_24D18B040((int)v4, v11, a1);
      unint64_t v12 = v9 | 0x4000000000000000;
      if (v2)
      {
        *uint64_t v5 = v4;
        goto LABEL_19;
      }
      *uint64_t v5 = v4;
      v5[1] = v12;
      break;
    case 2uLL:
      uint64_t v14 = *v1;
      uint64_t v15 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      sub_24D195BE0();
      uint64_t result = sub_24D18B040(*(void *)(v14 + 16), *(void *)(v14 + 24), a1);
      unint64_t v12 = v15 | 0x8000000000000000;
      if (v2)
      {
        *uint64_t v1 = v14;
LABEL_19:
        v5[1] = v12;
      }
      else
      {
        *uint64_t v1 = v14;
        v1[1] = v12;
      }
      break;
    case 3uLL:
      memset(v16, 0, 15);
      uint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16);
      if (!v2) {
        return (char *)v14;
      }
      return result;
    default:
      v16[0] = *v1;
      LOWORD(v16[1]) = v3;
      BYTE2(v16[1]) = BYTE2(v3);
      BYTE3(v16[1]) = BYTE3(v3);
      BYTE4(v16[1]) = BYTE4(v3);
      BYTE5(v16[1]) = BYTE5(v3);
      BYTE6(v16[1]) = BYTE6(v3);
      uint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16 + BYTE6(v3));
      if (!v2) {
        uint64_t result = (char *)v14;
      }
      unint64_t v8 = LODWORD(v16[1]) | ((unint64_t)BYTE4(v16[1]) << 32) | ((unint64_t)BYTE5(v16[1]) << 40) | ((unint64_t)BYTE6(v16[1]) << 48);
      *uint64_t v1 = v16[0];
      v1[1] = v8;
      return result;
  }
  return result;
}

unsigned char *sub_24D18AF58@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    uint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    uint64_t result = (unsigned char *)sub_24D18B590(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    uint64_t result = (unsigned char *)sub_24D18B748((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    uint64_t result = (unsigned char *)sub_24D18B7C4((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

void *sub_24D18AFD0(void *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    uint64_t result = a1(&v6, a3, a4 - a3);
    if (v4) {
      return result;
    }
    return (void *)v6;
  }
  uint64_t result = a1(&v6, 0, 0);
  if (!v4) {
    return (void *)v6;
  }
  return result;
}

char *sub_24D18B040(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t result = (char *)sub_24D195AA0();
  if (!result) {
    goto LABEL_12;
  }
  uint64_t v8 = result;
  uint64_t result = (char *)sub_24D195AD0();
  uint64_t v9 = a1 - (void)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  BOOL v10 = __OFSUB__(a2, a1);
  uint64_t v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v12 = sub_24D195AC0();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  uint64_t result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3) {
    return (char *)v14;
  }
  return result;
}

uint64_t sub_24D18B0F4(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_24D195AA0();
  if (!result || (uint64_t result = sub_24D195AD0(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_24D195AC0();
      sub_24D195D80();
      sub_24D18B22C(&qword_26985A238, MEMORY[0x263F04818]);
      return sub_24D195D40();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_24D18B1D4(uint64_t a1, unint64_t a2)
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

uint64_t sub_24D18B22C(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_24D18B274()
{
  unint64_t result = qword_26985A190;
  if (!qword_26985A190)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26985A188);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985A190);
  }
  return result;
}

uint64_t sub_24D18B2D0@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    unint64_t result = sub_24D196160();
    if ((v3 & 1) == 0)
    {
      uint64_t v4 = result;
      unint64_t result = swift_bridgeObjectRelease();
      *a2 = 0;
      a2[1] = 0xE000000000000000;
      a2[2] = 15;
      a2[3] = v4;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

char *sub_24D18B35C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 4 * a1 + 32);
    size_t v6 = 4 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  unint64_t result = (char *)sub_24D196210();
  __break(1u);
  return result;
}

unint64_t sub_24D18B448()
{
  unint64_t result = qword_26985A248;
  if (!qword_26985A248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985A248);
  }
  return result;
}

uint64_t sub_24D18B49C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_24D196210();
  __break(1u);
  return result;
}

uint64_t sub_24D18B590(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_24D18B654(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 432 * a1 + 32;
    unint64_t v6 = a3 + 432 * v4;
    if (v5 >= v6 || v5 + 432 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_24D196210();
  __break(1u);
  return result;
}

uint64_t sub_24D18B748(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_24D195AE0();
  swift_allocObject();
  uint64_t result = sub_24D195A90();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_24D195BF0();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_24D18B7C4(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_24D195AE0();
  swift_allocObject();
  uint64_t result = sub_24D195A90();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0) {
    return v2 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

unsigned char *sub_24D18B848(unsigned char *result, unsigned char *a2)
{
  if (result)
  {
    uint64_t v2 = a2 - result;
    if (a2 == result)
    {
      return 0;
    }
    else if (v2 <= 14)
    {
      return (unsigned char *)sub_24D18B590(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (unsigned char *)sub_24D18B748((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (unsigned char *)sub_24D18B7C4((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t sub_24D18B8AC(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result <= 14)
    {
      if (result < 0) {
        __break(1u);
      }
      else {
        return 0;
      }
    }
    else
    {
      sub_24D195AE0();
      swift_allocObject();
      sub_24D195AB0();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_24D195BF0();
        uint64_t result = swift_allocObject();
        *(void *)(result + 16) = 0;
        *(void *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

void *sub_24D18B94C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  unint64_t v5 = *(uint64_t **)(v3 + 16);
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  _DWORD v12[2] = v13;
  uint64_t result = sub_24D18AFD0((void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_24D18BA78, (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t sub_24D18B9B8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_24D17D6D0(a1, a2);
  }
  return a1;
}

uint64_t sub_24D18B9CC(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_24D18BA78@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_24D18B2D0(a1, a2);
}

uint64_t sub_24D18BA98(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_24D195BD0() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_24D196210();
  __break(1u);
  return result;
}

void *initializeBufferWithCopyOfBuffer for IgnoreListDataStoreError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for IgnoreListDataStoreError()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for IgnoreListDataStoreError(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for IgnoreListDataStoreError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for IgnoreListDataStoreError(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for IgnoreListDataStoreError(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for IgnoreListDataStoreError()
{
  return &type metadata for IgnoreListDataStoreError;
}

uint64_t static AnalysisFailure.send(analysisType:targetType:retries:targetPath:targetName:targetBundleID:targetBundleVersion:failureType:failureDescription:daemonState:)(unsigned __int8 *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8, unint64_t a9, unint64_t a10, unint64_t a11, unint64_t a12, unsigned __int8 *a13, unint64_t a14, uint64_t a15)
{
  return sub_24D18C314(a1, a2, a3, a4 & 1, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15);
}

uint64_t sub_24D18BD68()
{
  unint64_t v0 = AnalysisFailureType.rawValue.getter();
  uint64_t v2 = v1;
  if (v0 == AnalysisFailureType.rawValue.getter() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_24D196250();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

EcosystemAnalytics::AnalysisTypeForCA_optional __swiftcall AnalysisTypeForCA.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 3;
  if ((unint64_t)rawValue < 3) {
    char v2 = rawValue;
  }
  *uint64_t v1 = v2;
  return (EcosystemAnalytics::AnalysisTypeForCA_optional)rawValue;
}

uint64_t AnalysisTypeForCA.rawValue.getter()
{
  return *v0;
}

EcosystemAnalytics::AnalysisTypeForCA_optional sub_24D18BE1C(Swift::Int *a1)
{
  return AnalysisTypeForCA.init(rawValue:)(*a1);
}

void sub_24D18BE24(void *a1@<X8>)
{
  *a1 = *v1;
}

EcosystemAnalytics::AnalysisFailureType_optional __swiftcall AnalysisFailureType.init(rawValue:)(Swift::String rawValue)
{
  char v2 = v1;
  unint64_t v3 = sub_24D196230();
  result.value = swift_bridgeObjectRelease();
  char v5 = 14;
  if (v3 < 0xE) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

unint64_t AnalysisFailureType.rawValue.getter()
{
  unint64_t result = 0xD000000000000011;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x45786F62646E6173;
      break;
    case 2:
      unint64_t result = 0xD000000000000012;
      break;
    case 3:
    case 6:
      unint64_t result = 0xD000000000000013;
      break;
    case 4:
      unint64_t result = 0xD000000000000016;
      break;
    case 5:
      unint64_t result = 0x726F727245637078;
      break;
    case 7:
      unint64_t result = 0x7A696D6F646E6172;
      break;
    case 8:
      unint64_t result = 0x7473694C73707061;
      break;
    case 9:
      unint64_t result = 0xD000000000000014;
      break;
    case 0xA:
      unint64_t result = 0xD000000000000010;
      break;
    case 0xB:
      unint64_t result = 0xD000000000000014;
      break;
    case 0xC:
      unint64_t result = 0x72456574696C7173;
      break;
    case 0xD:
      unint64_t result = 0x6E776F6E6B6E75;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24D18C03C()
{
  return sub_24D18BD68();
}

uint64_t sub_24D18C048()
{
  return sub_24D1962E0();
}

uint64_t sub_24D18C0B0()
{
  AnalysisFailureType.rawValue.getter();
  sub_24D195E70();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24D18C114()
{
  return sub_24D1962E0();
}

EcosystemAnalytics::AnalysisFailureType_optional sub_24D18C178(Swift::String *a1)
{
  return AnalysisFailureType.init(rawValue:)(*a1);
}

unint64_t sub_24D18C184@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = AnalysisFailureType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t AnalysisFailureState.xpcState.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AnalysisFailureState.xpcState.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*AnalysisFailureState.xpcState.modify())()
{
  return nullsub_1;
}

EcosystemAnalytics::AnalysisFailureState __swiftcall AnalysisFailureState.init(xpcState:)(EcosystemAnalytics::AnalysisFailureState xpcState)
{
  *uint64_t v1 = xpcState;
  return xpcState;
}

uint64_t AnalysisFailureState.init(xpcActivity:)@<X0>(_xpc_activity_s *a1@<X0>, uint64_t *a2@<X8>)
{
  xpc_object_t v3 = xpc_activity_copy_criteria(a1);
  if (v3)
  {
    xpc_dictionary_get_uint64(v3, (const char *)*MEMORY[0x263EF81A0]);
    sub_24D196240();
    sub_24D195E80();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v6 = 0x3D79616C6564;
    unint64_t v5 = 0xE600000000000000;
  }
  else
  {
    uint64_t result = swift_unknownObjectRelease();
    unint64_t v5 = 0xE700000000000000;
    uint64_t v6 = 0x6E776F6E6B6E75;
  }
  *a2 = v6;
  a2[1] = v5;
  return result;
}

uint64_t sub_24D18C314(unsigned __int8 *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8, unint64_t a9, unint64_t a10, unint64_t a11, unint64_t a12, unsigned __int8 *a13, unint64_t a14, uint64_t a15)
{
  unint64_t v78 = a8;
  uint64_t v73 = a7;
  uint64_t v76 = a5;
  uint64_t v80 = a3;
  unint64_t v77 = a12;
  unint64_t v71 = a11;
  unint64_t v70 = a9;
  uint64_t v74 = a15;
  unint64_t v69 = a14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985A180);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v20 = (char *)v65 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = *(void *)(type metadata accessor for TargetType(0) - 8);
  uint64_t v22 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v81 = (uint64_t)v65 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v83 = (uint64_t)v65 - v25;
  LODWORD(v26) = *a1;
  int v27 = *a13;
  if (v26 == 3) {
    uint64_t v26 = 2;
  }
  else {
    uint64_t v26 = v26;
  }
  uint64_t v82 = v26;
  uint64_t v28 = a2;
  uint64_t v29 = v24;
  sub_24D18CF34(v28, (uint64_t)v20);
  int v30 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v21 + 48))(v20, 1, v29);
  uint64_t v79 = v29;
  if (v30 == 1)
  {
    swift_storeEnumTagMultiPayload();
    sub_24D1777B4((uint64_t)v20);
  }
  else
  {
    sub_24D18CFEC((uint64_t)v20, v83);
  }
  uint64_t v31 = v80;
  if (a4) {
    uint64_t v31 = 0;
  }
  uint64_t v80 = v31;
  if (a6) {
    uint64_t v32 = v76;
  }
  else {
    uint64_t v32 = 0x206E776F6E6B6E75;
  }
  unint64_t v33 = 0xEC00000068746170;
  if (a6) {
    unint64_t v33 = a6;
  }
  unint64_t v75 = v33;
  uint64_t v76 = v32;
  v65[1] = a6;
  if (v78) {
    uint64_t v34 = v73;
  }
  else {
    uint64_t v34 = 0x206E776F6E6B6E75;
  }
  unint64_t v35 = 0xEC000000656D616ELL;
  if (v78) {
    unint64_t v35 = v78;
  }
  unint64_t v72 = v35;
  uint64_t v73 = v34;
  unint64_t v36 = v70;
  if (!a10) {
    unint64_t v36 = 0xD000000000000011;
  }
  unint64_t v37 = 0x800000024D199620;
  if (a10) {
    unint64_t v37 = a10;
  }
  unint64_t v67 = v37;
  unint64_t v68 = v36;
  unint64_t v38 = 0xD000000000000016;
  if (v77) {
    unint64_t v38 = v71;
  }
  unint64_t v71 = v38;
  if (v77) {
    unint64_t v39 = v77;
  }
  else {
    unint64_t v39 = 0x800000024D199640;
  }
  if (v27 == 14) {
    int v40 = 13;
  }
  else {
    int v40 = v27;
  }
  int v66 = v40;
  unint64_t v41 = 0xD00000000000001BLL;
  if (v74) {
    unint64_t v41 = v69;
  }
  unint64_t v69 = v41;
  unint64_t v70 = v39;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985A230);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24D197250;
  *(void *)(inited + 32) = 0x74536E6F6D656164;
  *(void *)(inited + 40) = 0xEB00000000657461;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v43 = sub_24D195DE0();
  swift_bridgeObjectRelease();
  *(void *)(inited + 48) = v43;
  *(void *)(inited + 56) = 0xD000000000000012;
  *(void *)(inited + 64) = 0x800000024D199680;
  uint64_t v44 = sub_24D195DE0();
  swift_bridgeObjectRelease();
  *(void *)(inited + 72) = v44;
  *(void *)(inited + 80) = 0x546572756C696166;
  *(void *)(inited + 88) = 0xEB00000000657079;
  LOBYTE(v85[0]) = v66;
  AnalysisFailureType.rawValue.getter();
  uint64_t v45 = sub_24D195DE0();
  swift_bridgeObjectRelease();
  *(void *)(inited + 96) = v45;
  strcpy((char *)(inited + 104), "targetBundleID");
  *(unsigned char *)(inited + 119) = -18;
  uint64_t v46 = sub_24D195DE0();
  swift_bridgeObjectRelease();
  *(void *)(inited + 120) = v46;
  *(void *)(inited + 128) = 0xD000000000000013;
  *(void *)(inited + 136) = 0x800000024D1996A0;
  uint64_t v47 = sub_24D195DE0();
  swift_bridgeObjectRelease();
  *(void *)(inited + 144) = v47;
  *(void *)(inited + 152) = 0x614E746567726174;
  *(void *)(inited + 160) = 0xEA0000000000656DLL;
  uint64_t v48 = sub_24D195DE0();
  swift_bridgeObjectRelease();
  *(void *)(inited + 168) = v48;
  *(void *)(inited + 176) = 0x6150746567726174;
  *(void *)(inited + 184) = 0xEA00000000006874;
  sub_24D1957E4(v76);
  swift_bridgeObjectRelease();
  uint64_t v49 = sub_24D195DE0();
  swift_bridgeObjectRelease();
  *(void *)(inited + 192) = v49;
  *(void *)(inited + 200) = 0x7954746567726174;
  *(void *)(inited + 208) = 0xEA00000000006570;
  uint64_t v50 = v83;
  sub_24D18802C(v83, v81);
  sub_24D195E50();
  uint64_t v51 = sub_24D195DE0();
  swift_bridgeObjectRelease();
  *(void *)(inited + 216) = v51;
  *(void *)(inited + 224) = 1701869940;
  *(void *)(inited + 232) = 0xE400000000000000;
  *(void *)(inited + 240) = sub_24D195F90();
  strcpy((char *)(inited + 248), "failureRetries");
  *(unsigned char *)(inited + 263) = -18;
  *(void *)(inited + 264) = sub_24D195F90();
  unint64_t v52 = sub_24D176428(inited);
  LOBYTE(v51) = sub_24D195FD0();
  sub_24D177C34(0, (unint64_t *)&qword_26985A0D0);
  swift_bridgeObjectRetain_n();
  uint64_t v53 = sub_24D196090();
  os_log_type_t v54 = v51;
  if (os_log_type_enabled(v53, (os_log_type_t)v51))
  {
    int v55 = (uint8_t *)swift_slowAlloc();
    uint64_t v56 = swift_slowAlloc();
    v85[0] = v56;
    *(_DWORD *)int v55 = 136315138;
    sub_24D177C34(0, &qword_26985A290);
    swift_bridgeObjectRetain();
    uint64_t v57 = sub_24D195DB0();
    unint64_t v59 = v58;
    swift_bridgeObjectRelease();
    uint64_t v84 = sub_24D18A654(v57, v59, v85);
    sub_24D1960A0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24D172000, v53, v54, "Sending failure analysis event: %s)", v55, 0xCu);
    swift_arrayDestroy();
    uint64_t v60 = v56;
    uint64_t v50 = v83;
    MEMORY[0x253320910](v60, -1, -1);
    MEMORY[0x253320910](v55, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v61 = (void *)sub_24D195DE0();
  uint64_t v62 = swift_allocObject();
  *(void *)(v62 + 16) = v52;
  v85[4] = (uint64_t)sub_24D177BC8;
  v85[5] = v62;
  v85[0] = MEMORY[0x263EF8330];
  v85[1] = 1107296256;
  v85[2] = (uint64_t)sub_24D18D3B0;
  v85[3] = (uint64_t)&block_descriptor_4;
  uint64_t v63 = _Block_copy(v85);
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v63);

  return sub_24D188090(v50);
}

unint64_t sub_24D18CB40()
{
  unint64_t result = qword_26985A280;
  if (!qword_26985A280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985A280);
  }
  return result;
}

unint64_t sub_24D18CB98()
{
  unint64_t result = qword_26985A288;
  if (!qword_26985A288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985A288);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AnalysisTypeForCA(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AnalysisTypeForCA(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x24D18CD48);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AnalysisTypeForCA()
{
  return &type metadata for AnalysisTypeForCA;
}

uint64_t getEnumTagSinglePayload for AnalysisFailureType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF3) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 13;
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
      return (*a1 | (v4 << 8)) - 13;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 13;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xE;
  int v8 = v6 - 14;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AnalysisFailureType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 13;
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
        JUMPOUT(0x24D18CEDCLL);
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
          *unint64_t result = a2 + 13;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AnalysisFailureType()
{
  return &type metadata for AnalysisFailureType;
}

ValueMetadata *type metadata accessor for AnalysisFailureState()
{
  return &type metadata for AnalysisFailureState;
}

ValueMetadata *type metadata accessor for AnalysisFailure()
{
  return &type metadata for AnalysisFailure;
}

uint64_t sub_24D18CF34(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A180);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24D18CF9C()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
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

uint64_t sub_24D18CFEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TargetType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t destroy for BinaryImage()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for BinaryImage(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  uint64_t v7 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v7;
  uint64_t v8 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for BinaryImage(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy104_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[5];
  *(void *)(a1 + 96) = *((void *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for BinaryImage(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v9;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for BinaryImage(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 104)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BinaryImage(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 104) = 1;
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
    *(unsigned char *)(result + 104) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BinaryImage()
{
  return &type metadata for BinaryImage;
}

id sub_24D18D3B0(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_24D177C34(0, &qword_26985A290);
    uint64_t v4 = (void *)sub_24D195D90();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t MachOAnalysisCoordinator.__allocating_init(interruptCallback:)(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_allocObject();
  *(_WORD *)(result + 32) = 1;
  *(unsigned char *)(result + 34) = 0;
  *(void *)(result + 40) = 0;
  *(void *)(result + 16) = a1;
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t MachOAnalysisCoordinator.init(interruptCallback:)(uint64_t a1, uint64_t a2)
{
  *(_WORD *)(v2 + 32) = 1;
  *(unsigned char *)(v2 + 34) = 0;
  *(void *)(v2 + 40) = 0;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return v2;
}

uint64_t MachOAnalysisCoordinator.__allocating_init(interruptCallback:sendEvents:coreSymbolication:printTostdout:)(uint64_t a1, uint64_t a2, char a3, char a4, char a5)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 40) = 0;
  *(void *)(result + 16) = a1;
  *(void *)(result + 24) = a2;
  *(unsigned char *)(result + 32) = a3;
  *(unsigned char *)(result + 33) = a4;
  *(unsigned char *)(result + 34) = a5;
  return result;
}

uint64_t MachOAnalysisCoordinator.init(interruptCallback:sendEvents:coreSymbolication:printTostdout:)(uint64_t a1, uint64_t a2, char a3, char a4, char a5)
{
  *(void *)(v5 + 40) = 0;
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  *(unsigned char *)(v5 + 32) = a3;
  *(unsigned char *)(v5 + 33) = a4;
  *(unsigned char *)(v5 + 34) = a5;
  return v5;
}

uint64_t sub_24D18D53C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AnalyzableTarget(0);
  MEMORY[0x270FA5388](v4 - 8);
  unint64_t v70 = (uint64_t *)((char *)&v63 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A180);
  MEMORY[0x270FA5388](v6 - 8);
  int v66 = (uint64_t *)((char *)&v63 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A298);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v63 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24D195B40();
  uint64_t v74 = *(void *)(v11 - 8);
  uint64_t v75 = v11;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  unint64_t v67 = (char *)&v63 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  unint64_t v68 = (char *)&v63 - v14;
  uint64_t v73 = sub_24D195BD0();
  uint64_t v72 = *(void *)(v73 - 8);
  MEMORY[0x270FA5388](v73);
  uint64_t v76 = (char *)&v63 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_24D195E40();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v63 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24D195FE0();
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_269859FE8);
  uint64_t v20 = swift_allocObject();
  long long v65 = xmmword_24D196C10;
  *(_OWORD *)(v20 + 16) = xmmword_24D196C10;
  *(void *)(v20 + 56) = MEMORY[0x263F8D310];
  unint64_t v64 = sub_24D177760();
  *(void *)(v20 + 64) = v64;
  *(void *)(v20 + 32) = a1;
  *(void *)(v20 + 40) = a2;
  uint64_t v21 = sub_24D177C34(0, (unint64_t *)&qword_26985A0D0);
  swift_bridgeObjectRetain();
  uint64_t v71 = v21;
  uint64_t v22 = (void *)sub_24D196090();
  sub_24D195CB0();
  swift_bridgeObjectRelease();

  uint64_t v77 = a1;
  sub_24D1957E4(a1);
  *(void *)&long long v80 = 0xD000000000000020;
  *((void *)&v80 + 1) = 0x800000024D199750;
  sub_24D195E80();
  swift_bridgeObjectRelease();
  *(void *)&long long v80 = sub_24D195F30();
  *((void *)&v80 + 1) = v23;
  sub_24D195E30();
  sub_24D1757BC();
  uint64_t v24 = sub_24D1960F0();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  swift_bridgeObjectRelease();
  if (v24)
  {
    nm_CRSetCrashLogMessage(v24 + 32);
    swift_bridgeObjectRelease();
  }
  uint64_t v26 = v76;
  uint64_t v25 = v77;
  sub_24D195B80();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985A2A0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24D196C20;
  uint64_t v28 = (void *)*MEMORY[0x263EFF870];
  *(void *)(inited + 32) = *MEMORY[0x263EFF870];
  uint64_t v29 = (void *)*MEMORY[0x263EFF878];
  *(void *)(inited + 40) = *MEMORY[0x263EFF878];
  id v30 = v28;
  id v31 = v29;
  sub_24D190BD8(inited);
  swift_setDeallocating();
  type metadata accessor for URLResourceKey(0);
  swift_arrayDestroy();
  sub_24D195B70();
  swift_bridgeObjectRelease();
  uint64_t v33 = v74;
  uint64_t v32 = v75;
  (*(void (**)(char *, void, uint64_t, uint64_t))(v74 + 56))(v10, 0, 1, v75);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v10, 1, v32) != 1)
  {
    uint64_t v45 = v68;
    (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v68, v10, v32);
    char v46 = sub_24D195B10();
    if (v46 == 2)
    {
      uint64_t v47 = v67;
      (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v67, v45, v32);
    }
    else
    {
      char v48 = v46;
      uint64_t v47 = v67;
      (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v67, v45, v32);
      if ((v48 & 1) == 0)
      {
        uint64_t v49 = *(void (**)(char *, uint64_t))(v33 + 8);
        v49(v47, v32);
        goto LABEL_13;
      }
    }
    char v50 = sub_24D195B30();
    uint64_t v49 = *(void (**)(char *, uint64_t))(v33 + 8);
    v49(v47, v32);
    if (v50 == 2 || (v50 & 1) != 0)
    {
      v49(v45, v32);
      goto LABEL_5;
    }
LABEL_13:
    uint64_t v51 = v72;
    uint64_t v52 = MEMORY[0x263F8D310];
    sub_24D195FD0();
    uint64_t v53 = swift_allocObject();
    *(_OWORD *)(v53 + 16) = v65;
    unint64_t v54 = v64;
    *(void *)(v53 + 56) = v52;
    *(void *)(v53 + 64) = v54;
    uint64_t v55 = v77;
    *(void *)(v53 + 32) = v77;
    *(void *)(v53 + 40) = a2;
    swift_bridgeObjectRetain();
    uint64_t v56 = (void *)sub_24D196090();
    sub_24D195CB0();
    swift_bridgeObjectRelease();

    unsigned __int8 v79 = 0;
    uint64_t v57 = sub_24D1957E4(v55);
    uint64_t v58 = (uint64_t)v66;
    uint64_t *v66 = v57;
    *(void *)(v58 + 8) = v59;
    uint64_t v60 = type metadata accessor for TargetType(0);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v60 - 8) + 56))(v58, 0, 1, v60);
    uint64_t v61 = sub_24D1957E4(v55);
    unsigned __int8 v78 = 6;
    long long v80 = 0u;
    sub_24D18C314(&v79, v58, 0, 0, v61, v62, 0, 0, 0, 0, 0, 0, &v78, 0, 0);
    swift_bridgeObjectRelease();
    sub_24D182BD0(v58, &qword_26985A180);
    v49(v68, v32);
    (*(void (**)(char *, uint64_t))(v51 + 8))(v26, v73);
    return 0;
  }
  sub_24D182BD0((uint64_t)v10, &qword_26985A298);
LABEL_5:
  uint64_t v34 = (uint64_t)v70;
  uint64_t *v70 = v25;
  *(void *)(v34 + 8) = a2;
  type metadata accessor for TargetType(0);
  swift_storeEnumTagMultiPayload();
  uint64_t v35 = v69;
  int v36 = *(unsigned __int8 *)(v69 + 33);
  type metadata accessor for AnalyticsRandomizer();
  unint64_t v37 = (void *)swift_initStackObject();
  swift_bridgeObjectRetain();
  v37[2] = sub_24D17630C(MEMORY[0x263F8EE78]);
  v37[5] = -1;
  sub_24D195FE0();
  unint64_t v38 = (void *)sub_24D196090();
  sub_24D195CB0();

  v37[3] = 0xD00000000000002CLL;
  v37[4] = 0x800000024D199780;
  v37[5] = 500;
  uint64_t v39 = swift_allocObject();
  swift_weakInit();
  int v40 = *(uint64_t (**)(void))(v35 + 16);
  uint64_t v41 = *(void *)(v35 + 24);
  swift_retain();
  swift_retain();
  sub_24D186690(v34, v40, v41, v36, v39, (uint64_t)v37);
  swift_release();
  sub_24D1831F8();
  uint64_t v43 = v42;
  swift_release();
  sub_24D177858(v34);
  (*(void (**)(char *, uint64_t))(v72 + 8))(v26, v73);
  swift_release();
  swift_setDeallocating();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v43;
}

uint64_t sub_24D18DF38(uint64_t a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v3 = *(void *)(result + 40);
    BOOL v4 = __OFADD__(v3, 1);
    uint64_t v5 = v3 + 1;
    if (v4)
    {
      __break(1u);
      goto LABEL_14;
    }
    *(void *)(result + 40) = v5;
    swift_release();
  }
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    swift_release();
    swift_beginAccess();
    uint64_t result = swift_weakLoadStrong();
    if (result)
    {
      int v6 = *(unsigned __int8 *)(result + 32);
      swift_release();
      if (v6 != 1) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
LABEL_7:
  sub_24D182CC8(a1);
LABEL_8:
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (!result) {
    return result;
  }
  swift_release();
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (!result)
  {
LABEL_15:
    __break(1u);
    return result;
  }
  int v7 = *(unsigned __int8 *)(result + 34);
  uint64_t result = swift_release();
  if (v7 == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26985A050);
    uint64_t v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_24D196C10;
    *(void *)(v8 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A058);
    *(void *)(v8 + 32) = a1;
    swift_bridgeObjectRetain();
    sub_24D1962B0();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24D18E0C4()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A180);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (uint64_t *)((char *)&v61 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A2A8);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  int v7 = (char *)&v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v61 - v8;
  uint64_t v10 = sub_24D195BD0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v61 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v61 - v15;
  id v17 = sub_24D18FDFC();
  if (!v17)
  {
    sub_24D195FD0();
    sub_24D177C34(0, (unint64_t *)&qword_26985A0D0);
    uint64_t v21 = (void *)sub_24D196090();
    sub_24D195CB0();

    LOBYTE(v64) = 0;
    *uint64_t v3 = 0;
    v3[1] = 0xE000000000000000;
    uint64_t v22 = type metadata accessor for TargetType(0);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v3, 0, 1, v22);
    unsigned __int8 v67 = 8;
    long long v68 = 0u;
    sub_24D18C314((unsigned __int8 *)&v64, (uint64_t)v3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, &v67, 0xD000000000000025, 0x800000024D1998A0);
    goto LABEL_5;
  }
  sub_24D18EEC0((uint64_t)v17, (uint64_t)v9);
  swift_bridgeObjectRelease();
  uint64_t v18 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  if (v18(v9, 1, v10) == 1)
  {
    sub_24D182BD0((uint64_t)v9, &qword_26985A2A8);
    sub_24D195FD0();
    sub_24D177C34(0, (unint64_t *)&qword_26985A0D0);
    uint64_t v19 = (void *)sub_24D196090();
    sub_24D195CB0();

    LOBYTE(v64) = 0;
    *uint64_t v3 = 0;
    v3[1] = 0xE000000000000000;
    uint64_t v20 = type metadata accessor for TargetType(0);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v3, 0, 1, v20);
    unsigned __int8 v67 = 7;
    long long v68 = 0u;
    sub_24D18C314((unsigned __int8 *)&v64, (uint64_t)v3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, &v67, 0xD000000000000024, 0x800000024D199930);
LABEL_5:
    sub_24D182BD0((uint64_t)v3, &qword_26985A180);
    return 0;
  }
  uint64_t v61 = v0;
  uint64_t v62 = v11;
  uint64_t v23 = *(void (**)(char *, char *))(v11 + 32);
  uint64_t v63 = v10;
  v23(v16, v9);
  unint64_t v24 = sub_24D190E40();
  if (v24)
  {
    sub_24D18EEC0(v24, (uint64_t)v7);
    swift_bridgeObjectRelease();
    if (v18(v7, 1, v63) != 1)
    {
      uint64_t v56 = v7;
      uint64_t v57 = v63;
      ((void (*)(char *, char *, uint64_t))v23)(v14, v56, v63);
      uint64_t v58 = sub_24D195BC0();
      uint64_t v54 = sub_24D18D53C(v58, v59);
      swift_bridgeObjectRelease();
      uint64_t v60 = *(void (**)(char *, uint64_t))(v62 + 8);
      v60(v14, v57);
      v60(v16, v57);
      return v54;
    }
    sub_24D182BD0((uint64_t)v7, &qword_26985A2A8);
    sub_24D195FD0();
    sub_24D177C34(0, (unint64_t *)&qword_26985A0D0);
    uint64_t v25 = (void *)sub_24D196090();
    sub_24D195CB0();

    uint64_t v26 = sub_24D195BC0();
    sub_24D178764(v26, v27, (uint64_t *)&v68);
    unsigned __int8 v67 = 0;
    uint64_t v28 = sub_24D195BC0();
    uint64_t v29 = sub_24D1957E4(v28);
    uint64_t v31 = v30;
    swift_bridgeObjectRelease();
    *uint64_t v3 = v29;
    v3[1] = v31;
    uint64_t v32 = type metadata accessor for TargetType(0);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v3, 0, 1, v32);
    uint64_t v33 = sub_24D195BC0();
    uint64_t v34 = sub_24D1957E4(v33);
    unint64_t v36 = v35;
    swift_bridgeObjectRelease();
    uint64_t v37 = v72;
    unint64_t v38 = v73;
    long long v39 = v69;
    unint64_t v40 = v70;
    unint64_t v41 = v71;
    unsigned __int8 v66 = 7;
    unint64_t v42 = 0xD000000000000030;
    uint64_t v64 = 0;
    uint64_t v65 = 0;
    uint64_t v43 = "Failed to find a random mach-o binary to inspect";
  }
  else
  {
    sub_24D195FD0();
    sub_24D177C34(0, (unint64_t *)&qword_26985A0D0);
    uint64_t v44 = (void *)sub_24D196090();
    sub_24D195CB0();

    uint64_t v45 = sub_24D195BC0();
    sub_24D178764(v45, v46, (uint64_t *)&v68);
    unsigned __int8 v67 = 0;
    uint64_t v47 = sub_24D195BC0();
    uint64_t v48 = sub_24D1957E4(v47);
    uint64_t v50 = v49;
    swift_bridgeObjectRelease();
    *uint64_t v3 = v48;
    v3[1] = v50;
    uint64_t v51 = type metadata accessor for TargetType(0);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56))(v3, 0, 1, v51);
    uint64_t v52 = sub_24D195BC0();
    uint64_t v34 = sub_24D1957E4(v52);
    unint64_t v36 = v53;
    swift_bridgeObjectRelease();
    uint64_t v37 = v72;
    unint64_t v38 = v73;
    long long v39 = v69;
    unint64_t v40 = v70;
    unint64_t v41 = v71;
    unsigned __int8 v66 = 8;
    unint64_t v42 = 0xD00000000000002DLL;
    uint64_t v64 = 0;
    uint64_t v65 = 0;
    uint64_t v43 = "Failed to find any mach-o binaries in the app";
  }
  sub_24D18C314(&v67, (uint64_t)v3, 0, 1, v34, v36, v37, v38, v39, *((unint64_t *)&v39 + 1), v40, v41, &v66, v42, (unint64_t)(v43 - 32) | 0x8000000000000000);
  swift_bridgeObjectRelease();
  sub_24D18853C((uint64_t)&v68);
  sub_24D182BD0((uint64_t)v3, &qword_26985A180);
  (*(void (**)(char *, uint64_t))(v62 + 8))(v16, v63);
  return 0;
}

uint64_t sub_24D18E8B0()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A180);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (uint64_t *)((char *)&v38 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A2A8);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v38 - v7;
  uint64_t v9 = sub_24D195BD0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24D195FE0();
  uint64_t v43 = sub_24D177C34(0, (unint64_t *)&qword_26985A0D0);
  uint64_t v13 = (void *)sub_24D196090();
  sub_24D195CB0();

  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
  v10 += 56;
  v14(v8, 1, 1, v9);
  sub_24D182BD0((uint64_t)v8, &qword_26985A2A8);
  uint64_t v15 = 0;
  uint64_t v16 = (unsigned int (**)(char *, uint64_t, uint64_t))(v10 - 8);
  unint64_t v41 = (void (**)(char *, char *, uint64_t))(v10 - 24);
  unint64_t v42 = (void (**)(char *, uint64_t))(v10 - 48);
  long long v40 = xmmword_24D196C20;
  uint64_t v39 = 0x800000024D199C30;
  while (1)
  {
    sub_24D18EEC0(MEMORY[0x263F8EE78], (uint64_t)v6);
    if ((*v16)(v6, 1, v9) == 1)
    {
      swift_release();
      sub_24D182BD0((uint64_t)v6, &qword_26985A2A8);
      sub_24D195FD0();
      unint64_t v35 = (void *)sub_24D196090();
      sub_24D195CB0();

      unsigned __int8 v46 = 0;
      uint64_t *v2 = 0;
      v2[1] = 0xE000000000000000;
      uint64_t v36 = type metadata accessor for TargetType(0);
      swift_storeEnumTagMultiPayload();
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v2, 0, 1, v36);
      unsigned __int8 v45 = 7;
      long long v44 = 0u;
      sub_24D18C314(&v46, (uint64_t)v2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, &v45, 0xD00000000000002DLL, 0x800000024D199B70);
      sub_24D182BD0((uint64_t)v2, &qword_26985A180);
      return 0;
    }
    (*v41)(v12, v6, v9);
    uint64_t v17 = sub_24D195BC0();
    uint64_t v19 = sub_24D18D53C(v17, v18);
    swift_bridgeObjectRelease();
    if (v19) {
      break;
    }
    sub_24D195FD0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269859FE8);
    uint64_t v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = v40;
    uint64_t v21 = sub_24D195BC0();
    uint64_t v23 = v22;
    *(void *)(v20 + 56) = MEMORY[0x263F8D310];
    unint64_t v24 = sub_24D177760();
    *(void *)(v20 + 32) = v21;
    *(void *)(v20 + 40) = v23;
    *(void *)(v20 + 96) = MEMORY[0x263F8D6C8];
    *(void *)(v20 + 104) = MEMORY[0x263F8D750];
    *(void *)(v20 + 64) = v24;
    *(void *)(v20 + 72) = v15;
    uint64_t v25 = (void *)sub_24D196090();
    sub_24D195CB0();
    swift_bridgeObjectRelease();

    unsigned __int8 v46 = 0;
    uint64_t v26 = sub_24D195BC0();
    uint64_t v27 = sub_24D1957E4(v26);
    uint64_t v29 = v28;
    swift_bridgeObjectRelease();
    uint64_t *v2 = v27;
    v2[1] = v29;
    uint64_t v30 = type metadata accessor for TargetType(0);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v2, 0, 1, v30);
    uint64_t v31 = sub_24D195BC0();
    uint64_t v32 = sub_24D1957E4(v31);
    unint64_t v34 = v33;
    swift_bridgeObjectRelease();
    unsigned __int8 v45 = 0;
    long long v44 = 0u;
    sub_24D18C314(&v46, (uint64_t)v2, v15, 0, v32, v34, 0, 0, 0, 0, 0, 0, &v45, 0xD000000000000032, v39);
    swift_bridgeObjectRelease();
    sub_24D182BD0((uint64_t)v2, &qword_26985A180);
    (*v42)(v12, v9);
    if (++v15 == 5)
    {
      swift_release();
      return 0;
    }
  }
  (*v42)(v12, v9);
  swift_release();
  return v19;
}

uint64_t sub_24D18EEC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_24D195BD0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A2A8);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v27 - v12;
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
  v14((char *)&v27 - v12, 1, 1, v4);
  unint64_t v15 = *(void *)(a1 + 16);
  if (!v15)
  {
    sub_24D195FD0();
    sub_24D177C34(0, (unint64_t *)&qword_26985A0D0);
    uint64_t v21 = (void *)sub_24D196090();
    sub_24D195CB0();

    v14((char *)a2, 1, 1, v4);
    return sub_24D182BD0((uint64_t)v13, &qword_26985A2A8);
  }
  if (HIDWORD(v15)) {
    goto LABEL_16;
  }
  uint32_t v16 = arc4random_uniform(*(void *)(a1 + 16));
  if (v15 <= v16)
  {
    __break(1u);
LABEL_16:
    uint64_t result = sub_24D1961C0();
    __break(1u);
    return result;
  }
  uint64_t v28 = a2;
  uint64_t v17 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
  v17(v11, a1+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v16, v4);
  v14(v11, 0, 1, v4);
  sub_24D1922A0((uint64_t)v11, (uint64_t)v13);
  sub_24D195FB0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269859FE8);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_24D196C10;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v13, 1, v4))
  {
    uint64_t v19 = 0;
    unint64_t v20 = 0;
  }
  else
  {
    v17(v7, (unint64_t)v13, v4);
    uint64_t v19 = sub_24D195BC0();
    unint64_t v20 = v23;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  *(void *)(v18 + 56) = MEMORY[0x263F8D310];
  *(void *)(v18 + 64) = sub_24D177760();
  if (v20) {
    uint64_t v24 = v19;
  }
  else {
    uint64_t v24 = 0;
  }
  unint64_t v25 = 0xE000000000000000;
  if (v20) {
    unint64_t v25 = v20;
  }
  *(void *)(v18 + 32) = v24;
  *(void *)(v18 + 40) = v25;
  sub_24D177C34(0, (unint64_t *)&qword_26985A0D0);
  uint64_t v26 = (void *)sub_24D196090();
  sub_24D195CB0();
  swift_bridgeObjectRelease();

  return sub_24D192308((uint64_t)v13, v28, &qword_26985A2A8);
}

uint64_t sub_24D18F2A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A180);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v74 = (void *)((char *)v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = type metadata accessor for AnalyzableTarget(0);
  MEMORY[0x270FA5388](v6 - 8);
  unint64_t v71 = (void *)((char *)v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A2A8);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v72 = (char *)v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24D195BD0();
  uint64_t v11 = *(void **)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24D195FE0();
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269859FE8);
  uint64_t v15 = swift_allocObject();
  long long v67 = xmmword_24D196C10;
  *(_OWORD *)(v15 + 16) = xmmword_24D196C10;
  *(void *)(v15 + 56) = MEMORY[0x263F8D310];
  unsigned __int8 v66 = (void (**)(char *, uint64_t, uint64_t, uint64_t))sub_24D177760();
  *(void *)(v15 + 64) = v66;
  *(void *)(v15 + 32) = a1;
  *(void *)(v15 + 40) = a2;
  uint64_t v16 = sub_24D177C34(0, (unint64_t *)&qword_26985A0D0);
  swift_bridgeObjectRetain();
  uint64_t v17 = (void *)sub_24D196090();
  sub_24D195CB0();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRetain();
  sub_24D178764(a1, a2, v79);
  sub_24D195B80();
  unint64_t v18 = sub_24D190E40();
  uint64_t v19 = (void (*)(char *, uint64_t))v11[1];
  long long v69 = v11 + 1;
  unint64_t v70 = v13;
  long long v68 = v19;
  v19(v13, v10);
  if (v18)
  {
    uint64_t v60 = v14;
    uint64_t v61 = v16;
    sub_24D18853C((uint64_t)v79);
    uint64_t v20 = *(void *)(v18 + 16);
    unint64_t v59 = v18;
    if (v20)
    {
      uint64_t v22 = v11[2];
      uint64_t v21 = v11 + 2;
      *(void *)&long long v67 = v22;
      unint64_t v23 = v18 + ((*((unsigned __int8 *)v21 + 64) + 32) & ~(unint64_t)*((unsigned __int8 *)v21 + 64));
      uint64_t v64 = v21[7];
      uint64_t v65 = (unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 4);
      uint64_t v63 = (uint64_t (**)(char *, char *, uint64_t))(v21 + 2);
      swift_bridgeObjectRetain();
      unsigned __int8 v66 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 5);
      v58[1] = (unint64_t)(v21 + 5) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
      uint64_t v24 = v72;
      unint64_t v25 = v70;
      while (1)
      {
        ((void (*)(char *, unint64_t, uint64_t))v67)(v24, v23, v10);
        uint64_t v26 = *v66;
        (*v66)(v24, 0, 1, v10);
        if ((*v65)(v24, 1, v10) == 1) {
          break;
        }
        uint64_t v62 = v26;
        uint64_t v27 = (*v63)(v25, v24, v10);
        uint64_t v74 = (uint64_t *)MEMORY[0x2533202C0](v27);
        uint64_t v28 = sub_24D195BB0();
        uint64_t v29 = v10;
        uint64_t v30 = (uint64_t)v71;
        *unint64_t v71 = v28;
        *(void *)(v30 + 8) = v31;
        type metadata accessor for TargetType(0);
        swift_storeEnumTagMultiPayload();
        uint64_t v32 = v73;
        char v33 = *(unsigned char *)(v73 + 33);
        unint64_t v34 = v21;
        uint64_t v35 = swift_allocObject();
        swift_weakInit();
        uint64_t v37 = *(uint64_t (**)(void))(v32 + 16);
        uint64_t v36 = *(void *)(v32 + 24);
        swift_retain();
        sub_24D187368(v30, v37, v36, v33, v35);
        uint64_t v24 = v72;
        swift_release();
        uint64_t v38 = v30;
        uint64_t v10 = v29;
        sub_24D177858(v38);
        uint64_t v21 = v34;
        swift_release();
        v68(v25, v29);
        v23 += v64;
        if (!--v20)
        {
          v62(v24, 1, 1, v29);
          break;
        }
      }
    }
    else
    {
      uint64_t v49 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v11[7];
      swift_bridgeObjectRetain();
      v49(v72, 1, 1, v10);
    }
    unint64_t v50 = v59;
    swift_bridgeObjectRelease();
    sub_24D195FE0();
    uint64_t v51 = swift_allocObject();
    *(_OWORD *)(v51 + 16) = xmmword_24D196C20;
    uint64_t v52 = *(void *)(v50 + 16);
    swift_bridgeObjectRelease();
    uint64_t v53 = MEMORY[0x263F8D6C8];
    uint64_t v54 = MEMORY[0x263F8D750];
    *(void *)(v51 + 56) = MEMORY[0x263F8D6C8];
    *(void *)(v51 + 64) = v54;
    *(void *)(v51 + 32) = v52;
    uint64_t v55 = v73;
    uint64_t v56 = *(void *)(v73 + 40);
    *(void *)(v51 + 96) = v53;
    *(void *)(v51 + 104) = v54;
    *(void *)(v51 + 72) = v56;
    uint64_t v57 = (void *)sub_24D196090();
    sub_24D195CB0();
    swift_bridgeObjectRelease();

    return *(void *)(v55 + 40);
  }
  else
  {
    sub_24D195FD0();
    uint64_t v39 = swift_allocObject();
    *(_OWORD *)(v39 + 16) = v67;
    long long v40 = v66;
    *(void *)(v39 + 56) = MEMORY[0x263F8D310];
    *(void *)(v39 + 64) = v40;
    *(void *)(v39 + 32) = a1;
    *(void *)(v39 + 40) = a2;
    swift_bridgeObjectRetain();
    unint64_t v41 = (void *)sub_24D196090();
    sub_24D195CB0();
    swift_bridgeObjectRelease();

    unsigned __int8 v78 = 0;
    uint64_t v42 = sub_24D1957E4(a1);
    uint64_t v43 = v74;
    *uint64_t v74 = v42;
    v43[1] = v44;
    uint64_t v45 = type metadata accessor for TargetType(0);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(v43, 0, 1, v45);
    uint64_t v46 = sub_24D1957E4(a1);
    unsigned __int8 v77 = 0;
    uint64_t v75 = 0;
    uint64_t v76 = 0;
    sub_24D18C314(&v78, (uint64_t)v43, 0, 1, v46, v47, v79[6], v79[7], v79[2], v79[3], v79[4], v79[5], &v77, 0xD000000000000030, 0x800000024D199D30);
    swift_bridgeObjectRelease();
    sub_24D18853C((uint64_t)v79);
    sub_24D182BD0((uint64_t)v43, &qword_26985A180);
    return 0;
  }
}

uint64_t sub_24D18F9EC(uint64_t a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v3 = *(void *)(result + 40);
    BOOL v4 = __OFADD__(v3, 1);
    uint64_t v5 = v3 + 1;
    if (v4)
    {
      __break(1u);
      goto LABEL_14;
    }
    *(void *)(result + 40) = v5;
    swift_release();
  }
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    swift_release();
    swift_beginAccess();
    uint64_t result = swift_weakLoadStrong();
    if (result)
    {
      int v6 = *(unsigned __int8 *)(result + 32);
      swift_release();
      if (v6 != 1) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
LABEL_7:
  uint64_t v7 = (void *)sub_24D195DE0();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  void v12[4] = sub_24D177BC8;
  v12[5] = v8;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 1107296256;
  _DWORD v12[2] = sub_24D18D3B0;
  uint64_t v12[3] = &block_descriptor_5;
  uint64_t v9 = _Block_copy(v12);
  swift_bridgeObjectRetain();
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v9);

LABEL_8:
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (!result) {
    return result;
  }
  swift_release();
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (!result)
  {
LABEL_15:
    __break(1u);
    return result;
  }
  int v10 = *(unsigned __int8 *)(result + 34);
  uint64_t result = swift_release();
  if (v10 == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26985A050);
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_24D196C10;
    *(void *)(v11 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A058);
    *(void *)(v11 + 32) = a1;
    swift_bridgeObjectRetain();
    sub_24D1962B0();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24D18FC3C()
{
  return swift_release();
}

uint64_t MachOAnalysisCoordinator.deinit()
{
  swift_release();
  return v0;
}

uint64_t MachOAnalysisCoordinator.__deallocating_deinit()
{
  swift_release();

  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t sub_24D18FC9C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26985A270);
    int v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 29;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    int v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8]) {
      memmove(v13, v14, 4 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[4 * v8] || v13 >= &v14[4 * v8])
  {
    memcpy(v13, v14, 4 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_24D196210();
  __break(1u);
  return result;
}

id sub_24D18FDFC()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A2A8);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v84 = (char *)v70 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = sub_24D195BD0();
  uint64_t v2 = *(void *)(v73 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v73);
  uint64_t v72 = (char *)v70 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v86 = (char *)v70 - v6;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v91 = (char *)v70 - v8;
  MEMORY[0x270FA5388](v7);
  int v10 = (char *)v70 - v9;
  id v11 = objc_msgSend(self, sel_enumeratorWithOptions_, 128);
  id v12 = objc_msgSend(v11, sel_nextObject);
  uint64_t v92 = v2;
  if (v12)
  {
    id v13 = v12;
    unint64_t v71 = MEMORY[0x263F8EE78];
    uint64_t v88 = (void (**)(char *, char *, uint64_t))(v2 + 32);
    long long v90 = xmmword_24D196C10;
    uint64_t v89 = (void (*)(void, void, void))v10;
    while (1)
    {
      sub_24D195FC0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269859FE8);
      uint64_t v14 = swift_allocObject();
      *(_OWORD *)(v14 + 16) = v90;
      id v15 = objc_msgSend(v13, sel_bundleIdentifier);
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = sub_24D195E10();
        uint64_t v19 = v18;
      }
      else
      {
        uint64_t v17 = 0;
        uint64_t v19 = 0;
      }
      uint64_t v95 = v17;
      uint64_t v96 = v19;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26985A2C8);
      uint64_t v20 = sub_24D195E50();
      uint64_t v22 = v21;
      *(void *)(v14 + 56) = MEMORY[0x263F8D310];
      *(void *)(v14 + 64) = sub_24D177760();
      *(void *)(v14 + 32) = v20;
      *(void *)(v14 + 40) = v22;
      sub_24D177C34(0, (unint64_t *)&qword_26985A0D0);
      unint64_t v23 = (void *)sub_24D196090();
      sub_24D195CB0();
      swift_bridgeObjectRelease();

      id v24 = objc_msgSend(v13, sel_bundleIdentifier);
      if (!v24) {
        goto LABEL_9;
      }

      id result = objc_msgSend(v13, sel_bundleIdentifier);
      if (!result)
      {
        __break(1u);
        return result;
      }
      uint64_t v26 = result;
      uint64_t v27 = sub_24D195E10();
      uint64_t v29 = v28;

      uint64_t v95 = v27;
      uint64_t v96 = v29;
      unint64_t v93 = 0x6C7070612E6D6F63;
      unint64_t v94 = 0xE900000000000065;
      sub_24D1757BC();
      LOBYTE(v27) = sub_24D196100();
      swift_bridgeObjectRelease();
      if ((v27 & 1) == 0)
      {
        id v31 = objc_msgSend(v13, sel_URL);
        uint64_t v32 = v89;
        sub_24D195BA0();

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v71 = sub_24D18A34C(0, *(void *)(v71 + 16) + 1, 1, v71);
        }
        unint64_t v34 = *(void *)(v71 + 16);
        unint64_t v33 = *(void *)(v71 + 24);
        if (v34 >= v33 >> 1) {
          unint64_t v71 = sub_24D18A34C(v33 > 1, v34 + 1, 1, v71);
        }
        unint64_t v35 = v71;
        *(void *)(v71 + 16) = v34 + 1;
        (*(void (**)(unint64_t, void, uint64_t))(v92 + 32))(v35+ ((*(unsigned __int8 *)(v92 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v92 + 80))+ *(void *)(v92 + 72) * v34, v32, v73);

        id v30 = objc_msgSend(v11, sel_nextObject);
      }
      else
      {
LABEL_9:

        id v30 = objc_msgSend(v11, sel_nextObject);
      }
      id v13 = v30;
      if (!v13) {
        goto LABEL_18;
      }
    }
  }
  unint64_t v71 = MEMORY[0x263F8EE78];
LABEL_18:
  sub_24D195FC0();
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_269859FE8);
  uint64_t v37 = swift_allocObject();
  long long v81 = xmmword_24D196C10;
  *(_OWORD *)(v37 + 16) = xmmword_24D196C10;
  *(void *)(v37 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A2B8);
  *(void *)(v37 + 64) = sub_24D19236C();
  unint64_t v38 = v71;
  *(void *)(v37 + 32) = v71;
  uint64_t v39 = sub_24D177C34(0, (unint64_t *)&qword_26985A0D0);
  swift_bridgeObjectRetain();
  long long v40 = (void *)sub_24D196090();
  sub_24D195CB0();
  swift_bridgeObjectRelease();

  sub_24D195FE0();
  uint64_t v75 = v36;
  uint64_t v41 = swift_allocObject();
  *(_OWORD *)(v41 + 16) = v81;
  uint64_t v42 = MEMORY[0x263F8D6C8];
  uint64_t v43 = *(void *)(v38 + 16);
  uint64_t v44 = MEMORY[0x263F8D750];
  *(void *)(v41 + 56) = MEMORY[0x263F8D6C8];
  *(void *)(v41 + 64) = v44;
  *(void *)(v41 + 32) = v43;
  uint64_t v76 = v39;
  uint64_t v45 = (void *)sub_24D196090();
  sub_24D195CB0();
  swift_bridgeObjectRelease();

  type metadata accessor for IgnoreListDataStore();
  swift_initStackObject();
  uint64_t v85 = sub_24D1885E0();
  uint64_t v46 = *(void *)(v38 + 16);
  if (v46)
  {
    uint64_t v89 = *(void (**)(void, void, void))(v92 + 16);
    unint64_t v74 = (*(unsigned __int8 *)(v92 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v92 + 80);
    unint64_t v47 = v38 + v74;
    uint64_t v48 = *(void *)(v92 + 72);
    uint64_t v82 = (unsigned int (**)(char *, uint64_t, uint64_t))(v92 + 48);
    uint64_t v88 = (void (**)(char *, char *, uint64_t))(v92 + 32);
    unsigned __int8 v78 = (void (**)(char *, uint64_t))(v92 + 8);
    unint64_t v49 = MEMORY[0x263F8EE78];
    uint64_t v83 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v92 + 56);
    v70[1] = (v92 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    unint64_t v50 = v84;
    uint64_t v51 = v73;
    id v79 = v11;
    v92 += 16;
    uint64_t v77 = v48;
    v89(v84, v47, v73);
    while (1)
    {
      long long v80 = *v83;
      v80(v50, 0, 1, v51);
      if ((*v82)(v50, 1, v51) == 1)
      {
        uint64_t v42 = MEMORY[0x263F8D6C8];
        uint64_t v44 = MEMORY[0x263F8D750];
        goto LABEL_39;
      }
      *(void *)&long long v90 = v49;
      uint64_t v87 = *v88;
      v87(v91, v50, v51);
      uint64_t v58 = sub_24D195BC0();
      sub_24D178764(v58, v59, &v95);
      unint64_t v60 = v98 ? v97 : 0;
      unint64_t v61 = v98 ? v98 : 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_24D18853C((uint64_t)&v95);
      unint64_t v93 = v60;
      unint64_t v94 = v61;
      swift_bridgeObjectRetain();
      sub_24D195E80();
      sub_24D195E80();
      sub_24D195E80();
      sub_24D195E80();
      char v62 = sub_24D188B38(0, v93, v94);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v63 = v77;
      if (v62)
      {
        sub_24D195FB0();
        uint64_t v52 = swift_allocObject();
        *(_OWORD *)(v52 + 16) = v81;
        uint64_t v53 = v91;
        uint64_t v54 = sub_24D195B90();
        uint64_t v56 = v55;
        *(void *)(v52 + 56) = MEMORY[0x263F8D310];
        *(void *)(v52 + 64) = sub_24D177760();
        *(void *)(v52 + 32) = v54;
        *(void *)(v52 + 40) = v56;
        uint64_t v57 = (void *)sub_24D196090();
        sub_24D195CB0();
        swift_bridgeObjectRelease();

        unint64_t v50 = v84;
        uint64_t v51 = v73;
        unint64_t v49 = v90;
      }
      else
      {
        uint64_t v53 = v91;
        uint64_t v51 = v73;
        v89(v72, v91, v73);
        unint64_t v49 = v90;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v49 = sub_24D18A34C(0, *(void *)(v49 + 16) + 1, 1, v49);
        }
        unint64_t v50 = v84;
        unint64_t v65 = *(void *)(v49 + 16);
        unint64_t v64 = *(void *)(v49 + 24);
        if (v65 >= v64 >> 1) {
          unint64_t v49 = sub_24D18A34C(v64 > 1, v65 + 1, 1, v49);
        }
        *(void *)(v49 + 16) = v65 + 1;
        v87((char *)(v49 + v74 + v65 * v63), v72, v51);
      }
      (*v78)(v53, v51);
      v47 += v63;
      --v46;
      id v11 = v79;
      if (!v46) {
        break;
      }
      v89(v50, v47, v51);
    }
    uint64_t v42 = MEMORY[0x263F8D6C8];
    uint64_t v44 = MEMORY[0x263F8D750];
    v80(v50, 1, 1, v51);
  }
  else
  {
    unint64_t v49 = MEMORY[0x263F8EE78];
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v92 + 56))(v84, 1, 1, v73);
  }
LABEL_39:
  swift_bridgeObjectRelease();
  sub_24D18892C();
  if (*(void *)(v49 + 16))
  {
    sub_24D195FE0();
    uint64_t v66 = swift_allocObject();
    *(_OWORD *)(v66 + 16) = v81;
    uint64_t v67 = *(void *)(v49 + 16);
    *(void *)(v66 + 56) = v42;
    *(void *)(v66 + 64) = v44;
    *(void *)(v66 + 32) = v67;
    long long v68 = (void *)sub_24D196090();
    sub_24D195CB0();
    swift_bridgeObjectRelease();

    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_24D195FE0();
    long long v69 = (void *)sub_24D196090();
    sub_24D195CB0();

    swift_release();
    return 0;
  }
  return (id)v49;
}

uint64_t sub_24D190BD8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26985A2D0);
    uint64_t v3 = sub_24D196140();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v31 = v1;
    uint64_t v32 = a1 + 32;
    while (1)
    {
      uint64_t v6 = *(void **)(v32 + 8 * v4);
      sub_24D195E10();
      sub_24D1962C0();
      id v7 = v6;
      sub_24D195E70();
      uint64_t v8 = sub_24D1962E0();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = v8 & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = sub_24D195E10();
        uint64_t v17 = v16;
        if (v15 == sub_24D195E10() && v17 == v18)
        {
LABEL_3:
          swift_bridgeObjectRelease_n();
LABEL_4:

          goto LABEL_5;
        }
        char v20 = sub_24D196250();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        if (v20) {
          goto LABEL_4;
        }
        uint64_t v21 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v21;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          uint64_t v22 = sub_24D195E10();
          uint64_t v24 = v23;
          if (v22 == sub_24D195E10() && v24 == v25) {
            goto LABEL_3;
          }
          char v27 = sub_24D196250();
          swift_bridgeObjectRelease();
          uint64_t result = swift_bridgeObjectRelease();
          if (v27) {
            goto LABEL_4;
          }
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      *(void *)(*(void *)(v3 + 48) + 8 * v11) = v7;
      uint64_t v28 = *(void *)(v3 + 16);
      BOOL v29 = __OFADD__(v28, 1);
      uint64_t v30 = v28 + 1;
      if (v29)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v30;
LABEL_5:
      if (++v4 == v31) {
        return v3;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

uint64_t sub_24D190E08()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

unint64_t sub_24D190E40()
{
  uint64_t v117 = sub_24D195B40();
  uint64_t v135 = *(void (**)(char *, char *, uint64_t))(v117 - 8);
  uint64_t v0 = MEMORY[0x270FA5388](v117);
  uint64_t v120 = (char *)&v104 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v0);
  unint64_t v122 = (char *)&v104 - v2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A2A8);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  char v123 = (char *)&v104 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v113 = (char *)&v104 - v7;
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v104 - v8;
  uint64_t v10 = sub_24D195BD0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  unint64_t v125 = (char *)&v104 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v110 = (char *)&v104 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v104 - v17;
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v106 = (char *)&v104 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v111 = (char *)&v104 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v132 = (char *)&v104 - v24;
  MEMORY[0x270FA5388](v23);
  uint64_t v136 = (char *)&v104 - v25;
  id v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08850]), sel_init);
  uint64_t v133 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A2A0);
  uint64_t v27 = swift_allocObject();
  long long v134 = xmmword_24D196C10;
  *(_OWORD *)(v27 + 16) = xmmword_24D196C10;
  uint64_t v28 = (void *)*MEMORY[0x263EFF6A8];
  *(void *)(v27 + 32) = *MEMORY[0x263EFF6A8];
  uint64_t v121 = v28;
  id v107 = v26;
  BOOL v29 = (void *)sub_24D195FA0();
  swift_bridgeObjectRelease();
  id v124 = v29;
  uint64_t v108 = v11;
  uint64_t v114 = v18;
  if (v29)
  {
    uint64_t v127 = (unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
    uint64_t v128 = (unsigned int (***)(char *, uint64_t, uint64_t))(v11 + 32);
    uint64_t v116 = (void (**)(char *, uint64_t))((char *)v135 + 8);
    uint64_t v129 = (void (*)(char *, char *, uint64_t))(v11 + 16);
    uint64_t v130 = (void (**)(char *, char *, uint64_t))(v11 + 56);
    uint64_t v131 = (void (**)(char *, uint64_t))(v11 + 8);
    uint64_t v115 = (void *)*MEMORY[0x263EFF700];
    uint64_t v104 = &v139;
    unint64_t v112 = MEMORY[0x263F8EE78];
    unint64_t v119 = MEMORY[0x263F8EE58] + 8;
    uint64_t v118 = v9;
    uint64_t v30 = v136;
    while (1)
    {
      if (objc_msgSend(v124, sel_nextObject, v104))
      {
        sub_24D196110();
        swift_unknownObjectRelease();
      }
      else
      {
        memset(v137, 0, sizeof(v137));
      }
      sub_24D192308((uint64_t)v137, (uint64_t)&v138, &qword_26985A090);
      if (!*((void *)&v139 + 1))
      {
        uint64_t v18 = v114;
        goto LABEL_35;
      }
      int v32 = swift_dynamicCast();
      uint64_t v135 = *v130;
      ((void (*)(char *, void, uint64_t, uint64_t))v135)(v9, v32 ^ 1u, 1, v10);
      unint64_t v33 = *v127;
      if ((*v127)(v9, 1, v10) == 1) {
        break;
      }
      uint64_t v126 = *v128;
      ((void (*)(char *, char *, uint64_t))v126)(v30, v9, v10);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = v134;
      unint64_t v35 = v121;
      *(void *)(inited + 32) = v121;
      uint64_t v36 = v35;
      sub_24D190BD8(inited);
      swift_setDeallocating();
      type metadata accessor for URLResourceKey(0);
      swift_arrayDestroy();
      uint64_t v37 = v122;
      sub_24D195B70();
      swift_bridgeObjectRelease();
      char v38 = sub_24D195B00();
      (*v116)(v37, v117);
      uint64_t v39 = v120;
      BOOL v40 = v38 != 2 && (v38 & 1) == 0;
      uint64_t v41 = v132;
      uint64_t v42 = *(void (**)(char *, char *, uint64_t))v129;
      (*(void (**)(char *, char *, uint64_t))v129)(v132, v136, v10);
      if (v40)
      {
        uint64_t v43 = swift_initStackObject();
        *(_OWORD *)(v43 + 16) = v134;
        uint64_t v44 = v115;
        *(void *)(v43 + 32) = v115;
        id v45 = v44;
        sub_24D190BD8(v43);
        swift_setDeallocating();
        uint64_t v46 = v132;
        swift_arrayDestroy();
        sub_24D195B70();
        swift_bridgeObjectRelease();
        char v47 = sub_24D195B20();
        (*v116)(v39, v117);
        uint64_t v31 = *v131;
        (*v131)(v46, v10);
        if (v47 != 2 && (v47 & 1) == 0)
        {
          sub_24D195BC0();
          uint64_t v109 = v48;
          uint64_t v49 = swift_allocObject();
          *(void *)(v49 + 16) = 0;
          uint64_t v105 = (void *)sub_24D195DE0();
          uint64_t v140 = sub_24D192240;
          uint64_t v141 = (void *)v49;
          *(void *)&long long v138 = MEMORY[0x263EF8330];
          *((void *)&v138 + 1) = 1107296256;
          *(void *)&long long v139 = sub_24D17E354;
          *((void *)&v139 + 1) = &block_descriptor_32;
          unint64_t v50 = _Block_copy(&v138);
          swift_retain();
          swift_release();
          uint64_t v51 = v105;
          nm_macho_for_each_slice(v105, v50);
          _Block_release(v50);

          swift_beginAccess();
          uint64_t v52 = *(void *)(v49 + 16);
          swift_bridgeObjectRelease();
          swift_release();
          if (v52)
          {
            uint64_t v53 = *(void *)(v112 + 16);
            if (v53)
            {
              uint64_t v54 = v108;
              uint64_t v55 = (char *)(v112
                           + ((*(unsigned __int8 *)(v108 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v108 + 80)));
              swift_bridgeObjectRetain();
              uint64_t v109 = *(void *)(v54 + 72);
              while (1)
              {
                uint64_t v56 = v113;
                v42(v113, v55, v10);
                ((void (*)(char *, void, uint64_t, uint64_t))v135)(v56, 0, 1, v10);
                if (v33(v56, 1, v10) == 1) {
                  break;
                }
                uint64_t v57 = v111;
                ((void (*)(char *, char *, uint64_t))v126)(v111, v56, v10);
                sub_24D192248();
                char v58 = sub_24D195DD0();
                v31(v57, v10);
                if (v58)
                {
                  swift_bridgeObjectRelease();
                  goto LABEL_4;
                }
                v55 += v109;
                if (!--v53) {
                  goto LABEL_24;
                }
              }
            }
            else
            {
              swift_bridgeObjectRetain();
LABEL_24:
              ((void (*)(char *, uint64_t, uint64_t, uint64_t))v135)(v113, 1, 1, v10);
            }
            swift_bridgeObjectRelease();
            LODWORD(v135) = sub_24D195FC0();
            __swift_instantiateConcreteTypeFromMangledName(&qword_269859FE8);
            uint64_t v59 = swift_allocObject();
            *(_OWORD *)(v59 + 16) = v134;
            unint64_t v60 = v136;
            uint64_t v61 = sub_24D195BC0();
            uint64_t v63 = v62;
            *(void *)(v59 + 56) = MEMORY[0x263F8D310];
            *(void *)(v59 + 64) = sub_24D177760();
            *(void *)(v59 + 32) = v61;
            *(void *)(v59 + 40) = v63;
            sub_24D177C34(0, (unint64_t *)&qword_26985A0D0);
            unint64_t v64 = (void *)sub_24D196090();
            sub_24D195CB0();
            swift_bridgeObjectRelease();

            v42(v106, v60, v10);
            if (swift_isUniquelyReferenced_nonNull_native()) {
              unint64_t v65 = v112;
            }
            else {
              unint64_t v65 = sub_24D18A34C(0, *(void *)(v112 + 16) + 1, 1, v112);
            }
            unint64_t v67 = *(void *)(v65 + 16);
            unint64_t v66 = *(void *)(v65 + 24);
            uint64_t v68 = v108;
            if (v67 >= v66 >> 1)
            {
              uint64_t v70 = sub_24D18A34C(v66 > 1, v67 + 1, 1, v65);
              uint64_t v68 = v108;
              unint64_t v65 = v70;
            }
            *(void *)(v65 + 16) = v67 + 1;
            unint64_t v69 = (*(unsigned __int8 *)(v68 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v68 + 80);
            unint64_t v112 = v65;
            ((void (*)(unint64_t, char *, uint64_t))v126)(v65 + v69 + *(void *)(v68 + 72) * v67, v106, v10);
          }
        }
      }
      else
      {
        uint64_t v31 = *v131;
        (*v131)(v41, v10);
      }
LABEL_4:
      uint64_t v30 = v136;
      v31(v136, v10);
      uint64_t v9 = v118;
    }
    uint64_t v18 = v114;
  }
  else
  {
    long long v138 = 0u;
    long long v139 = 0u;
    unint64_t v112 = MEMORY[0x263F8EE78];
LABEL_35:
    sub_24D182BD0((uint64_t)&v138, &qword_26985A090);
    uint64_t v135 = *(void (**)(char *, char *, uint64_t))(v108 + 56);
    ((void (*)(char *, uint64_t, uint64_t, uint64_t))v135)(v9, 1, 1, v10);
  }
  sub_24D182BD0((uint64_t)v9, &qword_26985A2A8);
  type metadata accessor for IgnoreListDataStore();
  swift_initStackObject();
  uint64_t v128 = (unsigned int (***)(char *, uint64_t, uint64_t))sub_24D1885E0();
  uint64_t v71 = *(void *)(v112 + 16);
  uint64_t v72 = MEMORY[0x263F8EE78];
  if (v71)
  {
    uint64_t v131 = *(void (***)(char *, uint64_t))(v108 + 16);
    uint64_t v132 = (char *)(v108 + 16);
    unint64_t v119 = (*(unsigned __int8 *)(v108 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v108 + 80);
    uint64_t v73 = v112 + v119;
    unint64_t v74 = *(char **)(v108 + 72);
    uint64_t v126 = (unsigned int (**)(char *, uint64_t, uint64_t))(v108 + 48);
    uint64_t v127 = (unsigned int (**)(char *, uint64_t, uint64_t))(v108 + 56);
    uint64_t v130 = (void (**)(char *, char *, uint64_t))(v108 + 32);
    uint64_t v121 = (void (**)(char *, uint64_t))(v108 + 8);
    unint64_t v122 = (char *)&v139;
    unint64_t v75 = MEMORY[0x263F8EE78];
    uint64_t v76 = v123;
    uint64_t v120 = v74;
    ((void (*)(char *, unint64_t, uint64_t))v131)(v123, v112 + v119, v10);
    while (1)
    {
      ((void (*)(char *, void, uint64_t, uint64_t))v135)(v76, 0, 1, v10);
      if ((*v126)(v76, 1, v10) == 1) {
        break;
      }
      uint64_t v133 = v71;
      uint64_t v136 = (char *)v75;
      uint64_t v129 = *v130;
      v129(v18, v76, v10);
      uint64_t v85 = sub_24D195BC0();
      uint64_t v87 = v86;
      type metadata accessor for MachOParser();
      uint64_t v88 = (void *)swift_allocObject();
      v88[6] = sub_24D176544(v72);
      v88[7] = v72;
      v88[2] = v85;
      v88[3] = v87;
      v88[4] = sub_24D17A1B0;
      v88[5] = 0;
      swift_bridgeObjectRetain();
      uint64_t v89 = (void *)sub_24D195DE0();
      swift_bridgeObjectRelease();
      uint64_t v140 = sub_24D17D7C8;
      uint64_t v141 = v88;
      *(void *)&long long v138 = MEMORY[0x263EF8330];
      *((void *)&v138 + 1) = 1107296256;
      *(void *)&long long v139 = sub_24D17E354;
      *((void *)&v139 + 1) = &block_descriptor_26;
      long long v90 = _Block_copy(&v138);
      swift_retain();
      swift_release();
      nm_macho_for_each_slice(v89, v90);
      _Block_release(v90);

      uint64_t v91 = sub_24D17E3C8();
      if (v92) {
        uint64_t v93 = v91;
      }
      else {
        uint64_t v93 = 0;
      }
      if (v92) {
        unint64_t v94 = v92;
      }
      else {
        unint64_t v94 = 0xE000000000000000;
      }
      *(void *)&long long v138 = v93;
      *((void *)&v138 + 1) = v94;
      swift_bridgeObjectRetain();
      sub_24D195E80();
      sub_24D195E80();
      char v95 = sub_24D188B38(1, v138, *((unint64_t *)&v138 + 1));
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v95)
      {
        sub_24D195FC0();
        __swift_instantiateConcreteTypeFromMangledName(&qword_269859FE8);
        uint64_t v77 = swift_allocObject();
        *(_OWORD *)(v77 + 16) = v134;
        unsigned __int8 v78 = v114;
        uint64_t v79 = sub_24D195BC0();
        uint64_t v81 = v80;
        *(void *)(v77 + 56) = MEMORY[0x263F8D310];
        *(void *)(v77 + 64) = sub_24D177760();
        *(void *)(v77 + 32) = v79;
        *(void *)(v77 + 40) = v81;
        uint64_t v18 = v78;
        sub_24D177C34(0, (unint64_t *)&qword_26985A0D0);
        uint64_t v82 = (void *)sub_24D196090();
        sub_24D195CB0();
        swift_release();
        swift_bridgeObjectRelease();

        unint64_t v75 = (unint64_t)v136;
        uint64_t v72 = MEMORY[0x263F8EE78];
        uint64_t v83 = v133;
        uint64_t v84 = v120;
      }
      else
      {
        uint64_t v18 = v114;
        ((void (*)(char *, char *, uint64_t))v131)(v110, v114, v10);
        unint64_t v75 = (unint64_t)v136;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v75 = sub_24D18A34C(0, *(void *)(v75 + 16) + 1, 1, v75);
        }
        uint64_t v72 = MEMORY[0x263F8EE78];
        unint64_t v97 = *(void *)(v75 + 16);
        unint64_t v96 = *(void *)(v75 + 24);
        if (v97 >= v96 >> 1) {
          unint64_t v75 = sub_24D18A34C(v96 > 1, v97 + 1, 1, v75);
        }
        *(void *)(v75 + 16) = v97 + 1;
        unint64_t v98 = v75 + v119 + v97 * (void)v120;
        uint64_t v84 = v120;
        v129((char *)v98, v110, v10);
        swift_release();
        uint64_t v83 = v133;
      }
      (*v121)(v18, v10);
      v73 += (uint64_t)v84;
      uint64_t v71 = v83 - 1;
      uint64_t v76 = v123;
      if (!v71) {
        goto LABEL_56;
      }
      ((void (*)(char *, uint64_t, uint64_t))v131)(v123, v73, v10);
    }
  }
  else
  {
    unint64_t v75 = MEMORY[0x263F8EE78];
    uint64_t v76 = v123;
LABEL_56:
    ((void (*)(char *, uint64_t, uint64_t, uint64_t))v135)(v76, 1, 1, v10);
  }
  swift_bridgeObjectRelease();
  sub_24D18892C();
  if (*(void *)(v75 + 16))
  {
    sub_24D195FE0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269859FE8);
    uint64_t v99 = swift_allocObject();
    *(_OWORD *)(v99 + 16) = v134;
    uint64_t v100 = *(void *)(v75 + 16);
    uint64_t v101 = MEMORY[0x263F8D750];
    *(void *)(v99 + 56) = MEMORY[0x263F8D6C8];
    *(void *)(v99 + 64) = v101;
    *(void *)(v99 + 32) = v100;
    sub_24D177C34(0, (unint64_t *)&qword_26985A0D0);
    uint64_t v102 = (void *)sub_24D196090();
    sub_24D195CB0();
    swift_bridgeObjectRelease();

    swift_release();
  }
  else
  {
    swift_release();

    swift_bridgeObjectRelease();
    return 0;
  }
  return v75;
}

uint64_t type metadata accessor for MachOAnalysisCoordinator()
{
  return self;
}

uint64_t method lookup function for MachOAnalysisCoordinator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MachOAnalysisCoordinator);
}

uint64_t dispatch thunk of MachOAnalysisCoordinator.__allocating_init(interruptCallback:)()
{
  return (*(uint64_t (**)(void))(v0 + 248))();
}

uint64_t dispatch thunk of MachOAnalysisCoordinator.__allocating_init(interruptCallback:sendEvents:coreSymbolication:printTostdout:)()
{
  return (*(uint64_t (**)(void))(v0 + 256))();
}

uint64_t dispatch thunk of MachOAnalysisCoordinator.analyzeRandomMachO()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t dispatch thunk of MachOAnalysisCoordinator.analyzeMachO(path:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of MachOAnalysisCoordinator.analyzeAppMachO()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

uint64_t dispatch thunk of MachOAnalysisCoordinator.analyzeNonAppMachO()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

uint64_t dispatch thunk of MachOAnalysisCoordinator.analyzeApp(path:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 328))();
}

uint64_t sub_24D1921E0()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

uint64_t sub_24D192230()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24D192240(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24D182748(a1, a2, a3, a4, v4);
}

unint64_t sub_24D192248()
{
  unint64_t result = qword_26985A2B0;
  if (!qword_26985A2B0)
  {
    sub_24D195BD0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985A2B0);
  }
  return result;
}

uint64_t sub_24D1922A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A2A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_24D192308(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_24D19236C()
{
  unint64_t result = qword_26985A2C0;
  if (!qword_26985A2C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26985A2B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985A2C0);
  }
  return result;
}

uint64_t AnalysisCoordinator.deinit()
{
  return v0;
}

uint64_t static AnalysisCoordinator.staticallyAnalyzeAppPath(_:interruptCallback:sendEvents:coreSymbolication:printTostdout:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, char a6, char a7)
{
  return sub_24D192460(a1, a2, a3, a4, a5, a6, a7, (uint64_t)"EcosystemAnalytics.framework:AnalysisCoordinator: statically analyzing app at path %{private}@", 94, sub_24D18F2A4);
}

uint64_t static AnalysisCoordinator.staticallyAnalyzeMachOPath(_:interruptCallback:sendEvents:coreSymbolication:printTostdout:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, char a6, char a7)
{
  return sub_24D192460(a1, a2, a3, a4, a5, a6, a7, (uint64_t)"EcosystemAnalytics.framework:AnalysisCoordinator: statically analyzing mach-o at path %{private}@", 97, sub_24D18D53C);
}

uint64_t sub_24D192460(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, char a6, char a7, uint64_t a8, uint64_t a9, uint64_t (*a10)(uint64_t, uint64_t))
{
  sub_24D195FE0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269859FE8);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_24D196C10;
  *(void *)(v15 + 56) = MEMORY[0x263F8D310];
  *(void *)(v15 + 64) = sub_24D177760();
  *(void *)(v15 + 32) = a1;
  *(void *)(v15 + 40) = a2;
  sub_24D178CF8();
  swift_bridgeObjectRetain();
  uint64_t v16 = (void *)sub_24D196090();
  sub_24D195CB0();
  swift_bridgeObjectRelease();

  type metadata accessor for MachOAnalysisCoordinator();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 40) = 0;
  *(void *)(v17 + 16) = a3;
  *(void *)(v17 + 24) = a4;
  *(unsigned char *)(v17 + 32) = a5;
  *(unsigned char *)(v17 + 33) = a6;
  *(unsigned char *)(v17 + 34) = a7;
  swift_retain();
  uint64_t v18 = a10(a1, a2);
  swift_release();
  return v18;
}

uint64_t static AnalysisCoordinator.staticallyAnalyze(interruptCallback:sendEvents:coreSymbolication:printTostdout:)(uint64_t a1, uint64_t a2, char a3, char a4, char a5)
{
  sub_24D195FE0();
  sub_24D178CF8();
  uint64_t v10 = (void *)sub_24D196090();
  sub_24D195CB0();

  type metadata accessor for MachOAnalysisCoordinator();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 40) = 0;
  *(void *)(v11 + 16) = a1;
  *(void *)(v11 + 24) = a2;
  *(unsigned char *)(v11 + 32) = a3;
  *(unsigned char *)(v11 + 33) = a4;
  *(unsigned char *)(v11 + 34) = a5;
  swift_retain();
  uint64_t v12 = sub_24D18E0C4();
  swift_release();
  return v12;
}

uint64_t static AnalysisCoordinator.runtimeAnalyzePID(_:interruptCallback:sendEvents:printTostdout:)(int a1, uint64_t a2, uint64_t a3, char a4, char a5)
{
  sub_24D195FE0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269859FE8);
  uint64_t v10 = swift_allocObject();
  uint64_t v11 = MEMORY[0x263F8E548];
  *(_OWORD *)(v10 + 16) = xmmword_24D196C10;
  uint64_t v12 = MEMORY[0x263F8E5B0];
  *(void *)(v10 + 56) = v11;
  *(void *)(v10 + 64) = v12;
  *(_DWORD *)(v10 + 32) = a1;
  sub_24D178CF8();
  uint64_t v13 = (void *)sub_24D196090();
  sub_24D195CB0();
  swift_bridgeObjectRelease();

  type metadata accessor for MicrostackshotsCoordinator();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 24) = a3;
  *(void *)(v14 + 32) = 0;
  *(void *)(v14 + 16) = a2;
  *(unsigned char *)(v14 + 40) = a4;
  *(unsigned char *)(v14 + 41) = a5;
  swift_retain();
  uint64_t v15 = sub_24D175810(a1, 0);
  swift_release();
  return v15;
}

uint64_t static AnalysisCoordinator.runtimeAnalyze(interruptCallback:sendEvents:printTostdout:)(uint64_t a1, uint64_t a2, char a3, char a4)
{
  sub_24D195FE0();
  sub_24D178CF8();
  uint64_t v8 = (void *)sub_24D196090();
  sub_24D195CB0();

  type metadata accessor for MicrostackshotsCoordinator();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 24) = a2;
  *(void *)(v9 + 32) = 0;
  *(void *)(v9 + 16) = a1;
  *(unsigned char *)(v9 + 40) = a3;
  *(unsigned char *)(v9 + 41) = a4;
  swift_retain();
  uint64_t v10 = sub_24D174BA8();
  swift_release();
  return v10;
}

uint64_t AnalysisCoordinator.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for AnalysisCoordinator()
{
  return self;
}

uint64_t method lookup function for AnalysisCoordinator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AnalysisCoordinator);
}

uint64_t destroy for Symbol(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 264))
  {
    swift_bridgeObjectRelease();
    if (*(void *)(a1 + 280))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Symbol(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  uint64_t v8 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v8;
  uint64_t v9 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v9;
  uint64_t v10 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v10;
  uint64_t v11 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v11;
  uint64_t v12 = *(void *)(a2 + 144);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = v12;
  uint64_t v13 = *(void *)(a2 + 160);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = v13;
  *(unsigned char *)(a1 + 168) = *(unsigned char *)(a2 + 168);
  uint64_t v14 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v14;
  uint64_t v15 = *(void *)(a2 + 200);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v15;
  uint64_t v16 = *(void *)(a2 + 216);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = v16;
  uint64_t v17 = *(void *)(a2 + 232);
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(void *)(a1 + 232) = v17;
  uint64_t v18 = *(void *)(a2 + 248);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(void *)(a1 + 248) = v18;
  uint64_t v35 = *(void *)(a2 + 264);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v35)
  {
    *(void *)(a1 + 256) = *(void *)(a2 + 256);
    *(void *)(a1 + 264) = v35;
    uint64_t v19 = *(void *)(a2 + 280);
    swift_bridgeObjectRetain();
    if (v19)
    {
      *(void *)(a1 + 272) = *(void *)(a2 + 272);
      *(void *)(a1 + 280) = v19;
      *(unsigned char *)(a1 + 288) = *(unsigned char *)(a2 + 288);
      uint64_t v20 = *(void *)(a2 + 304);
      *(void *)(a1 + 296) = *(void *)(a2 + 296);
      *(void *)(a1 + 304) = v20;
      uint64_t v21 = *(void *)(a2 + 320);
      *(void *)(a1 + 312) = *(void *)(a2 + 312);
      *(void *)(a1 + 320) = v21;
      uint64_t v22 = *(void *)(a2 + 336);
      *(void *)(a1 + 328) = *(void *)(a2 + 328);
      *(void *)(a1 + 336) = v22;
      uint64_t v23 = *(void *)(a2 + 352);
      *(void *)(a1 + 344) = *(void *)(a2 + 344);
      *(void *)(a1 + 352) = v23;
      uint64_t v24 = *(void *)(a2 + 368);
      *(void *)(a1 + 360) = *(void *)(a2 + 360);
      *(void *)(a1 + 368) = v24;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v28 = *(_OWORD *)(a2 + 352);
      *(_OWORD *)(a1 + 336) = *(_OWORD *)(a2 + 336);
      *(_OWORD *)(a1 + 352) = v28;
      *(void *)(a1 + 368) = *(void *)(a2 + 368);
      long long v29 = *(_OWORD *)(a2 + 288);
      *(_OWORD *)(a1 + 272) = *(_OWORD *)(a2 + 272);
      *(_OWORD *)(a1 + 288) = v29;
      long long v30 = *(_OWORD *)(a2 + 320);
      *(_OWORD *)(a1 + 304) = *(_OWORD *)(a2 + 304);
      *(_OWORD *)(a1 + 320) = v30;
    }
  }
  else
  {
    long long v25 = *(_OWORD *)(a2 + 336);
    *(_OWORD *)(a1 + 320) = *(_OWORD *)(a2 + 320);
    *(_OWORD *)(a1 + 336) = v25;
    *(_OWORD *)(a1 + 352) = *(_OWORD *)(a2 + 352);
    *(void *)(a1 + 368) = *(void *)(a2 + 368);
    long long v26 = *(_OWORD *)(a2 + 272);
    *(_OWORD *)(a1 + 256) = *(_OWORD *)(a2 + 256);
    *(_OWORD *)(a1 + 272) = v26;
    long long v27 = *(_OWORD *)(a2 + 304);
    *(_OWORD *)(a1 + 288) = *(_OWORD *)(a2 + 288);
    *(_OWORD *)(a1 + 304) = v27;
  }
  uint64_t v31 = *(void *)(a2 + 384);
  *(void *)(a1 + 376) = *(void *)(a2 + 376);
  *(void *)(a1 + 384) = v31;
  uint64_t v32 = *(void *)(a2 + 400);
  *(void *)(a1 + 392) = *(void *)(a2 + 392);
  *(void *)(a1 + 400) = v32;
  uint64_t v33 = *(void *)(a2 + 416);
  *(void *)(a1 + 408) = *(void *)(a2 + 408);
  *(void *)(a1 + 416) = v33;
  *(void *)(a1 + 424) = *(void *)(a2 + 424);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Symbol(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 168) = *(unsigned char *)(a2 + 168);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (_OWORD *)(a1 + 256);
  uint64_t v5 = (long long *)(a2 + 256);
  uint64_t v6 = *(void *)(a2 + 264);
  if (!*(void *)(a1 + 264))
  {
    if (!v6)
    {
      long long v22 = *v5;
      long long v23 = *(_OWORD *)(a2 + 272);
      long long v24 = *(_OWORD *)(a2 + 304);
      *(_OWORD *)(a1 + 288) = *(_OWORD *)(a2 + 288);
      *(_OWORD *)(a1 + 304) = v24;
      *uint64_t v4 = v22;
      *(_OWORD *)(a1 + 272) = v23;
      long long v25 = *(_OWORD *)(a2 + 320);
      long long v26 = *(_OWORD *)(a2 + 336);
      long long v27 = *(_OWORD *)(a2 + 352);
      *(void *)(a1 + 368) = *(void *)(a2 + 368);
      *(_OWORD *)(a1 + 336) = v26;
      *(_OWORD *)(a1 + 352) = v27;
      *(_OWORD *)(a1 + 320) = v25;
      goto LABEL_15;
    }
    *(void *)(a1 + 256) = *(void *)(a2 + 256);
    *(void *)(a1 + 264) = *(void *)(a2 + 264);
    uint64_t v10 = *(void *)(a2 + 280);
    swift_bridgeObjectRetain();
    if (!v10)
    {
      long long v11 = *(_OWORD *)(a2 + 272);
      long long v12 = *(_OWORD *)(a2 + 304);
      *(_OWORD *)(a1 + 288) = *(_OWORD *)(a2 + 288);
      *(_OWORD *)(a1 + 304) = v12;
      *(_OWORD *)(a1 + 272) = v11;
      long long v13 = *(_OWORD *)(a2 + 320);
      long long v14 = *(_OWORD *)(a2 + 336);
      long long v15 = *(_OWORD *)(a2 + 352);
      *(void *)(a1 + 368) = *(void *)(a2 + 368);
      *(_OWORD *)(a1 + 336) = v14;
      *(_OWORD *)(a1 + 352) = v15;
      *(_OWORD *)(a1 + 320) = v13;
      goto LABEL_15;
    }
LABEL_11:
    *(void *)(a1 + 272) = *(void *)(a2 + 272);
    *(void *)(a1 + 280) = *(void *)(a2 + 280);
    *(unsigned char *)(a1 + 288) = *(unsigned char *)(a2 + 288);
    *(void *)(a1 + 296) = *(void *)(a2 + 296);
    *(void *)(a1 + 304) = *(void *)(a2 + 304);
    *(void *)(a1 + 312) = *(void *)(a2 + 312);
    *(void *)(a1 + 320) = *(void *)(a2 + 320);
    *(void *)(a1 + 328) = *(void *)(a2 + 328);
    *(void *)(a1 + 336) = *(void *)(a2 + 336);
    *(void *)(a1 + 344) = *(void *)(a2 + 344);
    *(void *)(a1 + 352) = *(void *)(a2 + 352);
    *(void *)(a1 + 360) = *(void *)(a2 + 360);
    *(void *)(a1 + 368) = *(void *)(a2 + 368);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_15;
  }
  if (!v6)
  {
    sub_24D1931B0(a1 + 256);
    long long v16 = *(_OWORD *)(a2 + 304);
    long long v18 = *v5;
    long long v17 = *(_OWORD *)(a2 + 272);
    *(_OWORD *)(a1 + 288) = *(_OWORD *)(a2 + 288);
    *(_OWORD *)(a1 + 304) = v16;
    *uint64_t v4 = v18;
    *(_OWORD *)(a1 + 272) = v17;
    long long v20 = *(_OWORD *)(a2 + 336);
    long long v19 = *(_OWORD *)(a2 + 352);
    long long v21 = *(_OWORD *)(a2 + 320);
    *(void *)(a1 + 368) = *(void *)(a2 + 368);
    *(_OWORD *)(a1 + 336) = v20;
    *(_OWORD *)(a1 + 352) = v19;
    *(_OWORD *)(a1 + 320) = v21;
    goto LABEL_15;
  }
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  *(void *)(a1 + 264) = *(void *)(a2 + 264);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v7 = (long long *)(a1 + 272);
  uint64_t v8 = (long long *)(a2 + 272);
  uint64_t v9 = *(void *)(a2 + 280);
  if (!*(void *)(a1 + 280))
  {
    if (!v9)
    {
      long long v33 = *v8;
      long long v34 = *(_OWORD *)(a2 + 304);
      *(_OWORD *)(a1 + 288) = *(_OWORD *)(a2 + 288);
      *(_OWORD *)(a1 + 304) = v34;
      long long *v7 = v33;
      long long v35 = *(_OWORD *)(a2 + 320);
      long long v36 = *(_OWORD *)(a2 + 336);
      long long v37 = *(_OWORD *)(a2 + 352);
      *(void *)(a1 + 368) = *(void *)(a2 + 368);
      *(_OWORD *)(a1 + 336) = v36;
      *(_OWORD *)(a1 + 352) = v37;
      *(_OWORD *)(a1 + 320) = v35;
      goto LABEL_15;
    }
    goto LABEL_11;
  }
  if (v9)
  {
    *(void *)(a1 + 272) = *(void *)(a2 + 272);
    *(void *)(a1 + 280) = *(void *)(a2 + 280);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(unsigned char *)(a1 + 288) = *(unsigned char *)(a2 + 288);
    *(void *)(a1 + 296) = *(void *)(a2 + 296);
    *(void *)(a1 + 304) = *(void *)(a2 + 304);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 312) = *(void *)(a2 + 312);
    *(void *)(a1 + 320) = *(void *)(a2 + 320);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 328) = *(void *)(a2 + 328);
    *(void *)(a1 + 336) = *(void *)(a2 + 336);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 344) = *(void *)(a2 + 344);
    *(void *)(a1 + 352) = *(void *)(a2 + 352);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 360) = *(void *)(a2 + 360);
    *(void *)(a1 + 368) = *(void *)(a2 + 368);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_24D186054(a1 + 272);
    long long v29 = *(_OWORD *)(a2 + 288);
    long long v28 = *(_OWORD *)(a2 + 304);
    long long *v7 = *v8;
    *(_OWORD *)(a1 + 288) = v29;
    *(_OWORD *)(a1 + 304) = v28;
    long long v31 = *(_OWORD *)(a2 + 336);
    long long v30 = *(_OWORD *)(a2 + 352);
    long long v32 = *(_OWORD *)(a2 + 320);
    *(void *)(a1 + 368) = *(void *)(a2 + 368);
    *(_OWORD *)(a1 + 336) = v31;
    *(_OWORD *)(a1 + 352) = v30;
    *(_OWORD *)(a1 + 320) = v32;
  }
LABEL_15:
  *(void *)(a1 + 376) = *(void *)(a2 + 376);
  *(void *)(a1 + 384) = *(void *)(a2 + 384);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 392) = *(void *)(a2 + 392);
  *(void *)(a1 + 400) = *(void *)(a2 + 400);
  *(void *)(a1 + 408) = *(void *)(a2 + 408);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 416) = *(void *)(a2 + 416);
  *(void *)(a1 + 424) = *(void *)(a2 + 424);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24D1931B0(uint64_t a1)
{
  return a1;
}

void *__swift_memcpy432_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x1B0uLL);
}

uint64_t assignWithTake for Symbol(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  uint64_t v8 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(a2 + 144);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void *)(a2 + 160);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = v13;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 168) = *(unsigned char *)(a2 + 168);
  uint64_t v14 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v14;
  swift_bridgeObjectRelease();
  uint64_t v15 = *(void *)(a2 + 200);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v15;
  swift_bridgeObjectRelease();
  uint64_t v16 = *(void *)(a2 + 216);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = v16;
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void *)(a2 + 232);
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(void *)(a1 + 232) = v17;
  swift_bridgeObjectRelease();
  uint64_t v18 = *(void *)(a2 + 248);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(void *)(a1 + 248) = v18;
  swift_bridgeObjectRelease();
  if (!*(void *)(a1 + 264)) {
    goto LABEL_7;
  }
  uint64_t v19 = *(void *)(a2 + 264);
  if (!v19)
  {
    sub_24D1931B0(a1 + 256);
LABEL_7:
    long long v26 = *(_OWORD *)(a2 + 336);
    *(_OWORD *)(a1 + 320) = *(_OWORD *)(a2 + 320);
    *(_OWORD *)(a1 + 336) = v26;
    *(_OWORD *)(a1 + 352) = *(_OWORD *)(a2 + 352);
    *(void *)(a1 + 368) = *(void *)(a2 + 368);
    long long v27 = *(_OWORD *)(a2 + 272);
    *(_OWORD *)(a1 + 256) = *(_OWORD *)(a2 + 256);
    *(_OWORD *)(a1 + 272) = v27;
    long long v28 = *(_OWORD *)(a2 + 304);
    *(_OWORD *)(a1 + 288) = *(_OWORD *)(a2 + 288);
    *(_OWORD *)(a1 + 304) = v28;
    goto LABEL_10;
  }
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  *(void *)(a1 + 264) = v19;
  swift_bridgeObjectRelease();
  if (!*(void *)(a1 + 280))
  {
LABEL_9:
    long long v29 = *(_OWORD *)(a2 + 352);
    *(_OWORD *)(a1 + 336) = *(_OWORD *)(a2 + 336);
    *(_OWORD *)(a1 + 352) = v29;
    *(void *)(a1 + 368) = *(void *)(a2 + 368);
    long long v30 = *(_OWORD *)(a2 + 288);
    *(_OWORD *)(a1 + 272) = *(_OWORD *)(a2 + 272);
    *(_OWORD *)(a1 + 288) = v30;
    long long v31 = *(_OWORD *)(a2 + 320);
    *(_OWORD *)(a1 + 304) = *(_OWORD *)(a2 + 304);
    *(_OWORD *)(a1 + 320) = v31;
    goto LABEL_10;
  }
  uint64_t v20 = *(void *)(a2 + 280);
  if (!v20)
  {
    sub_24D186054(a1 + 272);
    goto LABEL_9;
  }
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  *(void *)(a1 + 280) = v20;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 288) = *(unsigned char *)(a2 + 288);
  uint64_t v21 = *(void *)(a2 + 304);
  *(void *)(a1 + 296) = *(void *)(a2 + 296);
  *(void *)(a1 + 304) = v21;
  swift_bridgeObjectRelease();
  uint64_t v22 = *(void *)(a2 + 320);
  *(void *)(a1 + 312) = *(void *)(a2 + 312);
  *(void *)(a1 + 320) = v22;
  swift_bridgeObjectRelease();
  uint64_t v23 = *(void *)(a2 + 336);
  *(void *)(a1 + 328) = *(void *)(a2 + 328);
  *(void *)(a1 + 336) = v23;
  swift_bridgeObjectRelease();
  uint64_t v24 = *(void *)(a2 + 352);
  *(void *)(a1 + 344) = *(void *)(a2 + 344);
  *(void *)(a1 + 352) = v24;
  swift_bridgeObjectRelease();
  uint64_t v25 = *(void *)(a2 + 368);
  *(void *)(a1 + 360) = *(void *)(a2 + 360);
  *(void *)(a1 + 368) = v25;
  swift_bridgeObjectRelease();
LABEL_10:
  uint64_t v32 = *(void *)(a2 + 384);
  *(void *)(a1 + 376) = *(void *)(a2 + 376);
  *(void *)(a1 + 384) = v32;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 392) = *(_OWORD *)(a2 + 392);
  *(void *)(a1 + 408) = *(void *)(a2 + 408);
  swift_bridgeObjectRelease();
  uint64_t v33 = *(void *)(a2 + 424);
  *(void *)(a1 + 416) = *(void *)(a2 + 416);
  *(void *)(a1 + 424) = v33;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Symbol(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 432)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Symbol(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 424) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 408) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 432) = 1;
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
    *(unsigned char *)(result + 432) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Symbol()
{
  return &type metadata for Symbol;
}

uint64_t sub_24D193584(uint64_t a1, uint64_t a2, void (*a3)(unint64_t))
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985A230);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24D197150;
  *(void *)(inited + 32) = 0x6C646E7542707061;
  *(void *)(inited + 40) = 0xEB00000000444965;
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_24D195DE0();
  swift_bridgeObjectRelease();
  *(void *)(inited + 48) = v4;
  *(void *)(inited + 56) = 0xD000000000000010;
  *(void *)(inited + 64) = 0x800000024D198ED0;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_24D195DE0();
  swift_bridgeObjectRelease();
  *(void *)(inited + 72) = v5;
  *(void *)(inited + 80) = 0x656D614E707061;
  *(void *)(inited + 88) = 0xE700000000000000;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_24D195DE0();
  swift_bridgeObjectRelease();
  *(void *)(inited + 96) = v6;
  *(void *)(inited + 104) = 1751347809;
  *(void *)(inited + 112) = 0xE400000000000000;
  *(void *)(inited + 120) = sub_24D195DE0();
  strcpy((char *)(inited + 128), "binaryCDHash");
  *(unsigned char *)(inited + 141) = 0;
  *(_WORD *)(inited + 142) = -5120;
  *(void *)(inited + 144) = sub_24D195DE0();
  strcpy((char *)(inited + 152), "binaryLocation");
  *(unsigned char *)(inited + 167) = -18;
  uint64_t v7 = sub_24D195DE0();
  swift_bridgeObjectRelease();
  *(void *)(inited + 168) = v7;
  *(void *)(inited + 176) = 0x61507972616E6962;
  *(void *)(inited + 184) = 0xEA00000000006874;
  *(void *)(inited + 192) = sub_24D195DE0();
  strcpy((char *)(inited + 200), "binaryTeamID");
  *(unsigned char *)(inited + 213) = 0;
  *(_WORD *)(inited + 214) = -5120;
  *(void *)(inited + 216) = sub_24D195DE0();
  *(void *)(inited + 224) = 0x55557972616E6962;
  *(void *)(inited + 232) = 0xEA00000000004449;
  *(void *)(inited + 240) = sub_24D195DE0();
  strcpy((char *)(inited + 248), "binaryVersion");
  *(_WORD *)(inited + 262) = -4864;
  *(void *)(inited + 264) = sub_24D195DE0();
  *(void *)(inited + 272) = 0x48444362696C7964;
  *(void *)(inited + 280) = 0xEB00000000687361;
  *(void *)(inited + 288) = sub_24D195DE0();
  strcpy((char *)(inited + 296), "dylibLocation");
  *(_WORD *)(inited + 310) = -4864;
  uint64_t v8 = sub_24D195DE0();
  swift_bridgeObjectRelease();
  *(void *)(inited + 312) = v8;
  *(void *)(inited + 320) = 0x74615062696C7964;
  *(void *)(inited + 328) = 0xE900000000000068;
  *(void *)(inited + 336) = sub_24D195DE0();
  *(void *)(inited + 344) = 0x61655462696C7964;
  *(void *)(inited + 352) = 0xEB0000000044496DLL;
  *(void *)(inited + 360) = sub_24D195DE0();
  *(void *)(inited + 368) = 0x49555562696C7964;
  *(void *)(inited + 376) = 0xE900000000000044;
  *(void *)(inited + 384) = sub_24D195DE0();
  strcpy((char *)(inited + 392), "dylibVersion");
  *(unsigned char *)(inited + 405) = 0;
  *(_WORD *)(inited + 406) = -5120;
  *(void *)(inited + 408) = sub_24D195DE0();
  *(void *)(inited + 416) = 0x656372756F73;
  *(void *)(inited + 424) = 0xE600000000000000;
  *(void *)(inited + 432) = sub_24D195DE0();
  *(void *)(inited + 440) = 0x614E6C6F626D7973;
  *(void *)(inited + 448) = 0xEA0000000000656DLL;
  *(void *)(inited + 456) = sub_24D195DE0();
  strcpy((char *)(inited + 464), "symbolOffset");
  *(unsigned char *)(inited + 477) = 0;
  *(_WORD *)(inited + 478) = -5120;
  *(void *)(inited + 480) = sub_24D195DE0();
  *(void *)(inited + 488) = 0x794472656C6C6163;
  *(void *)(inited + 496) = 0xEF6874615062696CLL;
  *(void *)(inited + 504) = sub_24D195DE0();
  *(void *)(inited + 512) = 0xD000000000000010;
  *(void *)(inited + 520) = 0x800000024D198D60;
  *(void *)(inited + 528) = sub_24D195DE0();
  unint64_t v9 = sub_24D176428(inited);
  sub_24D177C34(0, &qword_26985A228);
  uint64_t v10 = sub_24D196040();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_24D184DD8(v10, 0x6F436C6F626D7973, 0xEB00000000746E75, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  a3(v9);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24D193B1C(uint64_t a1, uint64_t a2, void (*a3)(unint64_t))
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985A230);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24D197150;
  *(void *)(inited + 32) = 0x6C646E7542707061;
  *(void *)(inited + 40) = 0xEB00000000444965;
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_24D195DE0();
  swift_bridgeObjectRelease();
  *(void *)(inited + 48) = v4;
  *(void *)(inited + 56) = 0xD000000000000010;
  *(void *)(inited + 64) = 0x800000024D198ED0;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_24D195DE0();
  swift_bridgeObjectRelease();
  *(void *)(inited + 72) = v5;
  *(void *)(inited + 80) = 0x656D614E707061;
  *(void *)(inited + 88) = 0xE700000000000000;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_24D195DE0();
  swift_bridgeObjectRelease();
  *(void *)(inited + 96) = v6;
  *(void *)(inited + 104) = 1751347809;
  *(void *)(inited + 112) = 0xE400000000000000;
  *(void *)(inited + 120) = sub_24D195DE0();
  strcpy((char *)(inited + 128), "binaryCDHash");
  *(unsigned char *)(inited + 141) = 0;
  *(_WORD *)(inited + 142) = -5120;
  *(void *)(inited + 144) = sub_24D195DE0();
  strcpy((char *)(inited + 152), "binaryLocation");
  *(unsigned char *)(inited + 167) = -18;
  uint64_t v7 = sub_24D195DE0();
  swift_bridgeObjectRelease();
  *(void *)(inited + 168) = v7;
  *(void *)(inited + 176) = 0x61507972616E6962;
  *(void *)(inited + 184) = 0xEA00000000006874;
  *(void *)(inited + 192) = sub_24D195DE0();
  strcpy((char *)(inited + 200), "binaryTeamID");
  *(unsigned char *)(inited + 213) = 0;
  *(_WORD *)(inited + 214) = -5120;
  *(void *)(inited + 216) = sub_24D195DE0();
  *(void *)(inited + 224) = 0x55557972616E6962;
  *(void *)(inited + 232) = 0xEA00000000004449;
  *(void *)(inited + 240) = sub_24D195DE0();
  strcpy((char *)(inited + 248), "binaryVersion");
  *(_WORD *)(inited + 262) = -4864;
  *(void *)(inited + 264) = sub_24D195DE0();
  *(void *)(inited + 272) = 0x48444362696C7964;
  *(void *)(inited + 280) = 0xEB00000000687361;
  *(void *)(inited + 288) = sub_24D195DE0();
  strcpy((char *)(inited + 296), "dylibLocation");
  *(_WORD *)(inited + 310) = -4864;
  uint64_t v8 = sub_24D195DE0();
  swift_bridgeObjectRelease();
  *(void *)(inited + 312) = v8;
  *(void *)(inited + 320) = 0x74615062696C7964;
  *(void *)(inited + 328) = 0xE900000000000068;
  *(void *)(inited + 336) = sub_24D195DE0();
  *(void *)(inited + 344) = 0x61655462696C7964;
  *(void *)(inited + 352) = 0xEB0000000044496DLL;
  *(void *)(inited + 360) = sub_24D195DE0();
  *(void *)(inited + 368) = 0x49555562696C7964;
  *(void *)(inited + 376) = 0xE900000000000044;
  *(void *)(inited + 384) = sub_24D195DE0();
  strcpy((char *)(inited + 392), "dylibVersion");
  *(unsigned char *)(inited + 405) = 0;
  *(_WORD *)(inited + 406) = -5120;
  *(void *)(inited + 408) = sub_24D195DE0();
  *(void *)(inited + 416) = 0x656372756F73;
  *(void *)(inited + 424) = 0xE600000000000000;
  *(void *)(inited + 432) = sub_24D195DE0();
  *(void *)(inited + 440) = 0x614E6C6F626D7973;
  *(void *)(inited + 448) = 0xEA0000000000656DLL;
  *(void *)(inited + 456) = sub_24D195DE0();
  strcpy((char *)(inited + 464), "symbolOffset");
  *(unsigned char *)(inited + 477) = 0;
  *(_WORD *)(inited + 478) = -5120;
  *(void *)(inited + 480) = sub_24D195DE0();
  *(void *)(inited + 488) = 0x794472656C6C6163;
  *(void *)(inited + 496) = 0xEF6874615062696CLL;
  *(void *)(inited + 504) = sub_24D195DE0();
  *(void *)(inited + 512) = 0xD000000000000010;
  *(void *)(inited + 520) = 0x800000024D198D60;
  *(void *)(inited + 528) = sub_24D195DE0();
  unint64_t v9 = sub_24D176428(inited);
  sub_24D177C34(0, &qword_26985A228);
  uint64_t v10 = sub_24D196040();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_24D184DD8(v10, 0x6F436C6F626D7973, 0xEB00000000746E75, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  a3(v9);
  return swift_bridgeObjectRelease();
}

void sub_24D194098(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_24D195FE0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269859FE8);
  uint64_t v10 = swift_allocObject();
  uint64_t v11 = MEMORY[0x263F8E548];
  *(_OWORD *)(v10 + 16) = xmmword_24D196C10;
  uint64_t v12 = MEMORY[0x263F8E5B0];
  *(void *)(v10 + 56) = v11;
  *(void *)(v10 + 64) = v12;
  *(_DWORD *)(v10 + 32) = a1;
  sub_24D177C34(0, (unint64_t *)&qword_26985A0D0);
  uint64_t v13 = (void *)sub_24D196090();
  sub_24D195CB0();
  swift_bridgeObjectRelease();

  type metadata accessor for MicrostackshotsParser();
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 40) = xmmword_24D196EE0;
  *(_OWORD *)(v14 + 56) = 0u;
  *(_OWORD *)(v14 + 72) = 0u;
  *(_OWORD *)(v14 + 88) = 0u;
  *(void *)(v14 + 104) = 0;
  swift_retain();
  sub_24D195C60();
  uint64_t v15 = OBJC_IVAR____TtC18EcosystemAnalytics21MicrostackshotsParser_interval;
  *(void *)(v14 + OBJC_IVAR____TtC18EcosystemAnalytics21MicrostackshotsParser_interval) = 0;
  *(unsigned char *)(v14 + OBJC_IVAR____TtC18EcosystemAnalytics21MicrostackshotsParser_thirdPartyOnly) = 2;
  *(_DWORD *)(v14 + 16) = a1;
  *(void *)(v14 + 24) = a4;
  *(void *)(v14 + 32) = a5;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a2;
  *(void *)(v16 + 24) = a3;
  double v17 = *(double *)(v14 + v15);
  swift_retain();
  if (v17 == 0.0)
  {
    id v19 = sub_24D17B84C(a1);
    sub_24D17CD84(v19);
    sub_24D17D498(v18);
    swift_bridgeObjectRelease();
    objc_msgSend(v19, sel_symbolicate);
    objc_msgSend(v19, sel_postprocess);
    sub_24D178F60((uint64_t)sub_24D194850, v16, v19);
    swift_release();
    swift_release();
  }
  else
  {
    sub_24D178E78((uint64_t)sub_24D194850, v16);
    swift_release();
    swift_release();
  }
}

uint64_t sub_24D19432C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6)
{
  uint64_t v25 = a4;
  uint64_t v26 = a2;
  uint64_t v10 = sub_24D195C70();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24D195FE0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269859FE8);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_24D196C10;
  uint64_t v15 = sub_24D195F70();
  uint64_t v17 = v16;
  *(void *)(v14 + 56) = MEMORY[0x263F8D310];
  *(void *)(v14 + 64) = sub_24D177760();
  *(void *)(v14 + 32) = v15;
  *(void *)(v14 + 40) = v17;
  sub_24D177C34(0, (unint64_t *)&qword_26985A0D0);
  uint64_t v18 = (void *)sub_24D196090();
  sub_24D195CB0();
  swift_bridgeObjectRelease();

  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1, v10);
  type metadata accessor for MicrostackshotsParser();
  swift_allocObject();
  swift_retain();
  uint64_t v19 = sub_24D178D60((uint64_t)v13, 1, v25, a5, a6);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v26;
  *(void *)(v20 + 24) = a3;
  if (*(double *)(v19 + OBJC_IVAR____TtC18EcosystemAnalytics21MicrostackshotsParser_interval) == 0.0)
  {
    int v21 = *(_DWORD *)(v19 + 16);
    swift_retain();
    swift_retain();
    id v22 = sub_24D17B84C(v21);
    sub_24D17CD84(v22);
    sub_24D17D498(v23);
    swift_bridgeObjectRelease();
    objc_msgSend(v22, sel_symbolicate);
    objc_msgSend(v22, sel_postprocess);
    sub_24D178F60((uint64_t)sub_24D194858, v20, v22);
    swift_release();
    swift_release();
  }
  else
  {
    swift_retain();
    swift_retain();
    sub_24D178E78((uint64_t)sub_24D194858, v20);
    swift_release();
    swift_release();
  }
  return swift_release();
}

void sub_24D194614(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_24D195C70();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for TargetType(0);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (int *)((char *)&v18 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_24D18802C(a1, (uint64_t)v16);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 2u:
    case 3u:
      sub_24D194098(*v16, a2, a3, a4, a5);
      break;
    case 4u:
      double v17 = *(double *)((char *)v16 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26985A000) + 48));
      (*(void (**)(char *, int *, uint64_t))(v11 + 32))(v13, v16, v10);
      sub_24D19432C((uint64_t)v13, a2, a3, a4, a5, v17);
      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
      break;
    case 5u:
      return;
    default:
      sub_24D188090((uint64_t)v16);
      break;
  }
}

uint64_t sub_24D194818()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24D194850(uint64_t a1, uint64_t a2)
{
  return sub_24D193B1C(a1, a2, *(void (**)(unint64_t))(v2 + 16));
}

uint64_t sub_24D194858(uint64_t a1, uint64_t a2)
{
  return sub_24D193584(a1, a2, *(void (**)(unint64_t))(v2 + 16));
}

uint64_t *initializeBufferWithCopyOfBuffer for TargetType(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    unsigned int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 4)
    {
      uint64_t v10 = sub_24D195C70();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
      uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A000);
      *(uint64_t *)((char *)a1 + *(int *)(v11 + 48)) = *(uint64_t *)((char *)a2 + *(int *)(v11 + 48));
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload > 1)
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t destroy for TargetType(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 4)
  {
    uint64_t v3 = sub_24D195C70();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
  else if (result <= 1)
  {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *initializeWithCopy for TargetType(void *a1, void *a2, uint64_t a3)
{
  unsigned int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 4)
  {
    uint64_t v8 = sub_24D195C70();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A000);
    *(void *)((char *)a1 + *(int *)(v9 + 48)) = *(void *)((char *)a2 + *(int *)(v9 + 48));
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload > 1)
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *assignWithCopy for TargetType(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24D188090((uint64_t)a1);
    unsigned int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 4)
    {
      uint64_t v7 = sub_24D195C70();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A000);
      *(void *)((char *)a1 + *(int *)(v8 + 48)) = *(void *)((char *)a2 + *(int *)(v8 + 48));
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload > 1)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t type metadata accessor for TargetType(uint64_t a1)
{
  return sub_24D195720(a1, (uint64_t *)&unk_26985A2D8);
}

char *initializeWithTake for TargetType(char *a1, char *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 4)
  {
    uint64_t v6 = sub_24D195C70();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A000);
    *(void *)&a1[*(int *)(v7 + 48)] = *(void *)&a2[*(int *)(v7 + 48)];
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

char *assignWithTake for TargetType(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24D188090((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 4)
    {
      uint64_t v6 = sub_24D195C70();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A000);
      *(void *)&a1[*(int *)(v7 + 48)] = *(void *)&a2[*(int *)(v7 + 48)];
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for TargetType(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for TargetType(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_24D194EE8()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_24D194EF8()
{
  uint64_t v3 = &unk_24D1975B0;
  uint64_t v4 = &unk_24D1975B0;
  uint64_t v5 = MEMORY[0x263F8CF68] + 64;
  uint64_t v6 = MEMORY[0x263F8CF68] + 64;
  uint64_t result = sub_24D195C70();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    uint64_t v7 = &v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t *sub_24D194FB4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *(void *)(type metadata accessor for TargetType(0) - 8);
  int v5 = *(_DWORD *)(v4 + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = v4;
    unsigned int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 4)
    {
      uint64_t v10 = sub_24D195C70();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
      uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A000);
      *(uint64_t *)((char *)a1 + *(int *)(v11 + 48)) = *(uint64_t *)((char *)a2 + *(int *)(v11 + 48));
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload > 1)
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_24D19511C(uint64_t a1)
{
  type metadata accessor for TargetType(0);
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 4)
  {
    uint64_t v3 = sub_24D195C70();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
  else if (result <= 1)
  {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *sub_24D1951D4(void *a1, void *a2)
{
  uint64_t v4 = type metadata accessor for TargetType(0);
  unsigned int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 4)
  {
    uint64_t v7 = sub_24D195C70();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A000);
    *(void *)((char *)a1 + *(int *)(v8 + 48)) = *(void *)((char *)a2 + *(int *)(v8 + 48));
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload > 1)
  {
    memcpy(a1, a2, *(void *)(*(void *)(v4 - 8) + 64));
  }
  else
  {
    uint64_t v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_24D1952F8(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_24D188090((uint64_t)a1);
    uint64_t v4 = type metadata accessor for TargetType(0);
    unsigned int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 4)
    {
      uint64_t v6 = sub_24D195C70();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A000);
      *(void *)((char *)a1 + *(int *)(v7 + 48)) = *(void *)((char *)a2 + *(int *)(v7 + 48));
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload > 1)
    {
      memcpy(a1, a2, *(void *)(*(void *)(v4 - 8) + 64));
    }
    else
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

char *sub_24D19543C(char *a1, char *a2)
{
  uint64_t v4 = type metadata accessor for TargetType(0);
  if (swift_getEnumCaseMultiPayload() == 4)
  {
    uint64_t v5 = sub_24D195C70();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v5 - 8) + 32))(a1, a2, v5);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A000);
    *(void *)&a1[*(int *)(v6 + 48)] = *(void *)&a2[*(int *)(v6 + 48)];
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v4 - 8) + 64));
  }
  return a1;
}

char *sub_24D195514(char *a1, char *a2)
{
  if (a1 != a2)
  {
    sub_24D188090((uint64_t)a1);
    uint64_t v4 = type metadata accessor for TargetType(0);
    if (swift_getEnumCaseMultiPayload() == 4)
    {
      uint64_t v5 = sub_24D195C70();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v5 - 8) + 32))(a1, a2, v5);
      uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985A000);
      *(void *)&a1[*(int *)(v6 + 48)] = *(void *)&a2[*(int *)(v6 + 48)];
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v4 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_24D1955FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24D195610);
}

uint64_t sub_24D195610(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TargetType(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_24D19567C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24D195690);
}

uint64_t sub_24D195690(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TargetType(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for AnalyzableTarget(uint64_t a1)
{
  return sub_24D195720(a1, (uint64_t *)&unk_26985A2E8);
}

uint64_t sub_24D195720(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24D195758()
{
  uint64_t result = type metadata accessor for TargetType(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24D1957E4(uint64_t a1)
{
  uint64_t v2 = sub_24D195BD0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_24D195F10() & 1) != 0 || (sub_24D195F10())
  {
    swift_bridgeObjectRetain();
    return a1;
  }
  sub_24D195B80();
  uint64_t v7 = sub_24D195B60();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v16 = v7;
  unint64_t v8 = *(void *)(v7 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    uint64_t v13 = (void *)sub_24D195DE0();
    id v14 = (id)nm_OSASanitizePath((uint64_t)v13);

    if (!v14) {
      return 0;
    }
    a1 = sub_24D195E10();

    return a1;
  }
  uint64_t v9 = v16;
  uint64_t v15 = v16 + 32;
  sub_24D1757BC();
  uint64_t v10 = 0;
  uint64_t v11 = (uint64_t *)(v9 + 40);
  while (1)
  {
    uint64_t v12 = *v11;
    uint64_t v17 = *(v11 - 1);
    uint64_t v18 = v12;
    uint64_t v21 = 1886413102;
    unint64_t v22 = 0xE400000000000000;
    if (sub_24D196100()) {
      break;
    }
    v11 += 2;
    if (v8 == ++v10) {
      goto LABEL_9;
    }
  }
  if (*(void *)(v16 + 16) >= v8)
  {
    uint64_t v17 = v16;
    uint64_t v18 = v15;
    uint64_t v19 = v10;
    uint64_t v20 = (2 * v8) | 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26985A208);
    sub_24D182B64();
    a1 = sub_24D195DC0();
    swift_bridgeObjectRelease();
    return a1;
  }
  __break(1u);
  return sub_24D195A60();
}

uint64_t sub_24D195A60()
{
  return MEMORY[0x270EEE098]();
}

uint64_t sub_24D195A70()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_24D195A80()
{
  return MEMORY[0x270EEE618]();
}

uint64_t sub_24D195A90()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_24D195AA0()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_24D195AB0()
{
  return MEMORY[0x270EEE648]();
}

uint64_t sub_24D195AC0()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_24D195AD0()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_24D195AE0()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_24D195AF0()
{
  return MEMORY[0x270EEEA60]();
}

uint64_t sub_24D195B00()
{
  return MEMORY[0x270EEEEF0]();
}

uint64_t sub_24D195B10()
{
  return MEMORY[0x270EEEF30]();
}

uint64_t sub_24D195B20()
{
  return MEMORY[0x270EEEF40]();
}

uint64_t sub_24D195B30()
{
  return MEMORY[0x270EEEF50]();
}

uint64_t sub_24D195B40()
{
  return MEMORY[0x270EEEFF8]();
}

uint64_t sub_24D195B50()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_24D195B60()
{
  return MEMORY[0x270EEFC70]();
}

uint64_t sub_24D195B70()
{
  return MEMORY[0x270EEFC88]();
}

uint64_t sub_24D195B80()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_24D195B90()
{
  return MEMORY[0x270EEFCE0]();
}

uint64_t sub_24D195BA0()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_24D195BB0()
{
  return MEMORY[0x270EEFE68]();
}

uint64_t sub_24D195BC0()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_24D195BD0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24D195BE0()
{
  return MEMORY[0x270EEFFB0]();
}

uint64_t sub_24D195BF0()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_24D195C00()
{
  return MEMORY[0x270EF0090]();
}

uint64_t sub_24D195C10()
{
  return MEMORY[0x270EF00B0]();
}

uint64_t sub_24D195C20()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_24D195C30()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_24D195C40()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_24D195C50()
{
  return MEMORY[0x270EF0C10]();
}

uint64_t sub_24D195C60()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_24D195C70()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24D195C80()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_24D195C90()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_24D195CA0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24D195CB0()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_24D195CC0()
{
  return MEMORY[0x270FA0990]();
}

uint64_t sub_24D195CD0()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_24D195CE0()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_24D195CF0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_24D195D00()
{
  return MEMORY[0x270FA0A38]();
}

uint64_t sub_24D195D10()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_24D195D20()
{
  return MEMORY[0x270FA0B38]();
}

uint64_t sub_24D195D30()
{
  return MEMORY[0x270FA0B98]();
}

uint64_t sub_24D195D40()
{
  return MEMORY[0x270EEAA78]();
}

uint64_t sub_24D195D50()
{
  return MEMORY[0x270EEAA80]();
}

uint64_t sub_24D195D60()
{
  return MEMORY[0x270EEAA98]();
}

uint64_t sub_24D195D70()
{
  return MEMORY[0x270EEAAC8]();
}

uint64_t sub_24D195D80()
{
  return MEMORY[0x270EEB0B0]();
}

uint64_t sub_24D195D90()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_24D195DA0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_24D195DB0()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_24D195DC0()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_24D195DD0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_24D195DE0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24D195DF0()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_24D195E00()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_24D195E10()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24D195E20()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_24D195E30()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_24D195E40()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_24D195E50()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24D195E60()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_24D195E70()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24D195E80()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24D195E90()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_24D195EA0()
{
  return MEMORY[0x270F9D7C8]();
}

uint64_t sub_24D195EB0()
{
  return MEMORY[0x270F9D7D8]();
}

uint64_t sub_24D195EC0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24D195ED0()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_24D195EE0()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_24D195EF0()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_24D195F00()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_24D195F10()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_24D195F20()
{
  return MEMORY[0x270F9D880]();
}

uint64_t sub_24D195F30()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_24D195F40()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_24D195F50()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24D195F60()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_24D195F70()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_24D195F80()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_24D195F90()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_24D195FA0()
{
  return MEMORY[0x270EF1EE8]();
}

uint64_t sub_24D195FB0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_24D195FC0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_24D195FD0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24D195FE0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24D195FF0()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_24D196000()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_24D196010()
{
  return MEMORY[0x270FA0D90]();
}

uint64_t sub_24D196020()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_24D196030()
{
  return MEMORY[0x270FA0F28]();
}

uint64_t sub_24D196040()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_24D196050()
{
  return MEMORY[0x270EF2250]();
}

uint64_t sub_24D196060()
{
  return MEMORY[0x270EF2258]();
}

uint64_t sub_24D196070()
{
  return MEMORY[0x270EF2278]();
}

uint64_t sub_24D196080()
{
  return MEMORY[0x270EF2298]();
}

uint64_t sub_24D196090()
{
  return MEMORY[0x270FA2ED0]();
}

uint64_t sub_24D1960A0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24D1960B0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24D1960C0()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_24D1960D0()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_24D1960E0()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_24D1960F0()
{
  return MEMORY[0x270EF2578]();
}

uint64_t sub_24D196100()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_24D196110()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24D196120()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_24D196130()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_24D196140()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_24D196150()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24D196160()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24D196170()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24D196180()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24D196190()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_24D1961A0()
{
  return MEMORY[0x270F9EF50]();
}

uint64_t sub_24D1961B0()
{
  return MEMORY[0x270F9EFC0]();
}

uint64_t sub_24D1961C0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24D1961D0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24D1961E0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24D1961F0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24D196200()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24D196210()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24D196230()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_24D196240()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24D196250()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24D196260()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24D196270()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24D196280()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24D196290()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24D1962A0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24D1962B0()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_24D1962C0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24D1962D0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24D1962E0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CSArchitectureGetFamilyName()
{
  return MEMORY[0x270F236A0]();
}

uint64_t CSDemangleSymbolName()
{
  return MEMORY[0x270F236A8]();
}

uint64_t CSSymbolGetName()
{
  return MEMORY[0x270F23738]();
}

uint64_t CSSymbolOwnerForeachSymbol()
{
  return MEMORY[0x270F23778]();
}

uint64_t CSSymbolOwnerGetArchitecture()
{
  return MEMORY[0x270F23788]();
}

uint64_t CSSymbolOwnerGetCFUUIDBytes()
{
  return MEMORY[0x270F23798]();
}

uint64_t CSSymbolOwnerGetPath()
{
  return MEMORY[0x270F237B0]();
}

uint64_t CSSymbolicatorForeachSymbolOwnerAtTime()
{
  return MEMORY[0x270F23860]();
}

uint64_t CSSymbolicatorForeachSymbolicatorWithPath()
{
  return MEMORY[0x270F23880]();
}

uint64_t CSUUIDCFUUIDBytesToString()
{
  return MEMORY[0x270F23920]();
}

OSStatus SecCodeCopySigningInformation(SecStaticCodeRef code, SecCSFlags flags, CFDictionaryRef *information)
{
  return MEMORY[0x270EFD8D0](code, *(void *)&flags, information);
}

OSStatus SecStaticCodeCreateWithPath(CFURLRef path, SecCSFlags flags, SecStaticCodeRef *staticCode)
{
  return MEMORY[0x270EFDC88](path, *(void *)&flags, staticCode);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _dyld_get_image_uuid()
{
  return MEMORY[0x270ED7F70]();
}

{
  return MEMORY[0x270F9A3C0]();
}

{
  return MEMORY[0x270F9A3C8]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

void free(void *a1)
{
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

const char *__cdecl macho_arch_name_for_mach_header(const mach_header *mh)
{
  return (const char *)MEMORY[0x270EDA2E8](mh);
}

uint64_t macho_for_each_defined_rpath()
{
  return MEMORY[0x270EDA2F8]();
}

uint64_t macho_for_each_dependent_dylib()
{
  return MEMORY[0x270EDA300]();
}

uint64_t macho_for_each_exported_symbol()
{
  return MEMORY[0x270EDA308]();
}

uint64_t macho_for_each_imported_symbol()
{
  return MEMORY[0x270EDA310]();
}

int macho_for_each_slice(const char *path, void *callback)
{
  return MEMORY[0x270EDA318](path, callback);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB530](a1, a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B4E0](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x270F9B558](a1);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B598](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x270F9B658](a1);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x270F9B678](db);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B690](pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x270F9B710](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x270F9B720](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B800](a1);
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
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

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x270FA0290]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
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

uint64_t systemstats_get_microstackshots()
{
  return MEMORY[0x270F9B948]();
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x270EDBCA8](activity);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x270EDBFA8](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x270EDBFB8](xdata);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDC018]();
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC0B0](xdict, key);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}