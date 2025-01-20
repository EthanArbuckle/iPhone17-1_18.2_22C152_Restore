NSURLFileProtectionType sub_4A20()
{
  qword_32DD8 = 0xD000000000000017;
  qword_32DE0 = 0x8000000000025940;
  qword_32DE8 = (uint64_t)NSURLFileProtectionCompleteUnlessOpen;
  return NSURLFileProtectionCompleteUnlessOpen;
}

void *DataConfig.APP_GROUP.unsafeMutableAddressor()
{
  return &static DataConfig.APP_GROUP;
}

NSFileProtectionType sub_4A64()
{
  type metadata accessor for DataStackConfiguration();
  swift_allocObject();
  qword_32DF0 = (uint64_t)sub_5A90(0x73746E656D6F6DLL, 0xE700000000000000, 0x73746E656D6F6DLL, 0xE700000000000000, NSFileProtectionCompleteUnlessOpen, 0, 0xD000000000000011, 0x8000000000025920, 0xD000000000000017, 0x8000000000025940);
  return NSFileProtectionCompleteUnlessOpen;
}

const char *DataConfig.COREDATA_MODEL_NAME.unsafeMutableAddressor()
{
  return "moments";
}

const char *DataConfig.COREDATA_FILENAME.unsafeMutableAddressor()
{
  return "moments";
}

void *DataConfig.CONTAINER_ID.unsafeMutableAddressor()
{
  return &static DataConfig.CONTAINER_ID;
}

void *DataConfig.APP_BUNDLE_ID.unsafeMutableAddressor()
{
  return &static DataConfig.APP_BUNDLE_ID;
}

unint64_t static DataConfig.spotlightBundleIdentifier.getter()
{
  return 0xD000000000000011;
}

unint64_t static DataConfig.APP_GROUP.getter()
{
  return 0xD000000000000017;
}

uint64_t static DataConfig.COREDATA_MODEL_NAME.getter()
{
  return 0x73746E656D6F6DLL;
}

const char *DataConfig.ZONE_NAME.unsafeMutableAddressor()
{
  return "JurassicZone";
}

uint64_t static DataConfig.ZONE_NAME.getter()
{
  return 0x636973736172754ALL;
}

void *DataConfig.ZONE_SUBSCRIPTION_ID.unsafeMutableAddressor()
{
  return &static DataConfig.ZONE_SUBSCRIPTION_ID;
}

unint64_t static DataConfig.ZONE_SUBSCRIPTION_ID.getter()
{
  return 0xD000000000000025;
}

void *DataConfig.METADATA_KEY.unsafeMutableAddressor()
{
  return &static DataConfig.METADATA_KEY;
}

unint64_t static DataConfig.METADATA_KEY.getter()
{
  return 0xD000000000000015;
}

void *DataConfig.METADATA_USER_ID_KEY.unsafeMutableAddressor()
{
  return &static DataConfig.METADATA_USER_ID_KEY;
}

unint64_t static DataConfig.METADATA_USER_ID_KEY.getter()
{
  return 0xD00000000000001BLL;
}

const char *DataConfig.RECORD_TYPE_JOURNAL_ENTRY.unsafeMutableAddressor()
{
  return "JournalEntry";
}

uint64_t static DataConfig.RECORD_TYPE_JOURNAL_ENTRY.getter()
{
  return 0x456C616E72756F4ALL;
}

void *DataConfig.RECORD_TYPE_JOURNAL_ENTRY_ASSET.unsafeMutableAddressor()
{
  return &static DataConfig.RECORD_TYPE_JOURNAL_ENTRY_ASSET;
}

unint64_t static DataConfig.RECORD_TYPE_JOURNAL_ENTRY_ASSET.getter()
{
  return 0xD000000000000011;
}

void *DataConfig.RECORD_TYPE_JOURNAL_ENTRY_ASSET_FILE_ATTACHMENT.unsafeMutableAddressor()
{
  return &static DataConfig.RECORD_TYPE_JOURNAL_ENTRY_ASSET_FILE_ATTACHMENT;
}

unint64_t static DataConfig.RECORD_TYPE_JOURNAL_ENTRY_ASSET_FILE_ATTACHMENT.getter()
{
  return 0xD00000000000001FLL;
}

void *DataConfig.prioritizeDownloadNotification.unsafeMutableAddressor()
{
  return &static DataConfig.prioritizeDownloadNotification;
}

unint64_t static DataConfig.prioritizeDownloadNotification.getter()
{
  return 0xD00000000000001ELL;
}

void *DataConfig.downloadPriorityKey.unsafeMutableAddressor()
{
  return &static DataConfig.downloadPriorityKey;
}

unint64_t static DataConfig.downloadPriorityKey.getter()
{
  return 0xD000000000000013;
}

const char *DataConfig.downloadIDKey.unsafeMutableAddressor()
{
  return "downloadIDKey";
}

uint64_t static DataConfig.downloadIDKey.getter()
{
  return 0x64616F6C6E776F64;
}

void *DataConfig.downloadTypeKey.unsafeMutableAddressor()
{
  return &static DataConfig.downloadTypeKey;
}

uint64_t static DataConfig.downloadTypeKey.getter()
{
  return 0x64616F6C6E776F64;
}

const char *DataConfig.spotlightDomain.unsafeMutableAddressor()
{
  return "Journal";
}

uint64_t static DataConfig.spotlightDomain.getter()
{
  return 0x6C616E72756F4ALL;
}

void *DataConfig.spotlightBundleIdentifier.unsafeMutableAddressor()
{
  return &static DataConfig.spotlightBundleIdentifier;
}

void *DataConfig.MAX_ASSUMED_ASSETS_PER_ENTRY.unsafeMutableAddressor()
{
  return &static DataConfig.MAX_ASSUMED_ASSETS_PER_ENTRY;
}

uint64_t static DataConfig.MAX_ASSUMED_ASSETS_PER_ENTRY.getter()
{
  return 100;
}

uint64_t Journaling.deinit()
{
  return v0;
}

uint64_t Journaling.__deallocating_deinit()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for DataConfig()
{
  return self;
}

void type metadata accessor for FileProtectionType(uint64_t a1)
{
}

uint64_t sub_4E1C(uint64_t a1, uint64_t a2)
{
  return sub_549C(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_4E40(uint64_t a1, uint64_t a2)
{
  return sub_549C(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_4E60(uint64_t a1, id *a2)
{
  uint64_t result = sub_23EC0();
  *a2 = 0;
  return result;
}

uint64_t sub_4ED8(uint64_t a1, id *a2)
{
  char v3 = sub_23ED0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_4F58@<X0>(void *a1@<X8>)
{
  sub_23EE0();
  NSString v2 = sub_23EB0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_4FA4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23EE0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_4FD0(uint64_t a1)
{
  uint64_t v2 = sub_5294(&qword_32220, type metadata accessor for URLResourceKey);
  uint64_t v3 = sub_5294(&qword_32228, type metadata accessor for URLResourceKey);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_508C(uint64_t a1)
{
  uint64_t v2 = sub_5294(&qword_32230, type metadata accessor for URLFileProtection);
  uint64_t v3 = sub_5294(&qword_32238, type metadata accessor for URLFileProtection);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_5148(uint64_t a1)
{
  uint64_t v2 = sub_5294(&qword_32188, type metadata accessor for FileProtectionType);
  uint64_t v3 = sub_5294(&qword_32190, type metadata accessor for FileProtectionType);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_5204()
{
  return sub_5294(&qword_32170, type metadata accessor for FileProtectionType);
}

uint64_t sub_524C()
{
  return sub_5294(&qword_32178, type metadata accessor for FileProtectionType);
}

uint64_t sub_5294(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_52DC(uint64_t a1)
{
  uint64_t v2 = sub_5294((unint64_t *)&qword_32240, type metadata accessor for FileAttributeKey);
  uint64_t v3 = sub_5294(&qword_32248, type metadata accessor for FileAttributeKey);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_5398@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_23EB0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_53E0(uint64_t a1)
{
  uint64_t v2 = sub_5294(&qword_32250, type metadata accessor for Dataclass);
  uint64_t v3 = sub_5294(&qword_32258, type metadata accessor for Dataclass);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_549C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_23EE0();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_54E0()
{
  sub_23EE0();
  sub_23F20();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_5534()
{
  sub_23EE0();
  sub_242F0();
  sub_23F20();
  Swift::Int v0 = sub_24310();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_55A8()
{
  return sub_5294(&qword_32180, type metadata accessor for FileProtectionType);
}

void type metadata accessor for URLResourceKey(uint64_t a1)
{
}

void type metadata accessor for URLFileProtection(uint64_t a1)
{
}

void type metadata accessor for FileAttributeKey(uint64_t a1)
{
}

void type metadata accessor for NSMergePolicyType(uint64_t a1)
{
}

void type metadata accessor for Dataclass(uint64_t a1)
{
}

void sub_5654(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_569C()
{
  return sub_5294(&qword_321C0, type metadata accessor for Dataclass);
}

uint64_t sub_56E4()
{
  return sub_5294(&qword_321C8, type metadata accessor for Dataclass);
}

uint64_t sub_572C()
{
  uint64_t v0 = sub_23EE0();
  uint64_t v2 = v1;
  if (v0 == sub_23EE0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_24290();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_57B8()
{
  return sub_5294(&qword_321D0, type metadata accessor for Dataclass);
}

uint64_t sub_5800()
{
  return sub_5294(&qword_321D8, type metadata accessor for FileAttributeKey);
}

uint64_t sub_5848()
{
  return sub_5294(&qword_321E0, type metadata accessor for FileAttributeKey);
}

uint64_t sub_5890()
{
  return sub_5294(&qword_321E8, type metadata accessor for URLFileProtection);
}

uint64_t sub_58D8()
{
  return sub_5294(&qword_321F0, type metadata accessor for URLFileProtection);
}

uint64_t sub_5920()
{
  return sub_5294(&qword_321F8, type metadata accessor for URLFileProtection);
}

uint64_t sub_5968()
{
  return sub_5294(&qword_32200, type metadata accessor for URLResourceKey);
}

uint64_t sub_59B0()
{
  return sub_5294(&qword_32208, type metadata accessor for URLResourceKey);
}

uint64_t sub_59F8()
{
  return sub_5294(&qword_32210, type metadata accessor for URLResourceKey);
}

uint64_t sub_5A40()
{
  return sub_5294(&qword_32218, type metadata accessor for FileAttributeKey);
}

void *sub_5A90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  v10[4] = a9;
  v10[5] = a10;
  type metadata accessor for CoreDataStackConfiguration();
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = a1;
  *(void *)(v18 + 24) = a2;
  *(void *)(v18 + 32) = a3;
  *(void *)(v18 + 40) = a4;
  *(unsigned char *)(v18 + 48) = a6;
  *(void *)(v18 + 56) = a5;
  *(void *)(v18 + 64) = a9;
  *(void *)(v18 + 72) = a10;
  v10[2] = v18;
  type metadata accessor for CloudKitStackConfiguration();
  v19 = (void *)swift_allocObject();
  v19[2] = a7;
  v19[3] = a8;
  v19[4] = a5;
  v10[3] = v19;
  swift_bridgeObjectRetain();
  id v20 = a5;
  return v10;
}

uint64_t sub_5B5C()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return _swift_deallocClassInstance(v0, 48, 7);
}

uint64_t type metadata accessor for DataStackConfiguration()
{
  return self;
}

uint64_t sub_5BC8@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v75 = sub_23D50();
  uint64_t v10 = *(void *)(v75 - 8);
  uint64_t v11 = __chkstk_darwin(v75);
  v71 = &v65[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v11);
  v14 = &v65[-v13];
  swift_bridgeObjectRetain_n();
  uint64_t v74 = a4;
  v15 = sub_23E10();
  os_log_type_t v16 = sub_24030();
  BOOL v17 = os_log_type_enabled(v15, v16);
  v72 = v14;
  if (v17)
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v73 = a5;
    v19 = (uint8_t *)v18;
    uint64_t v77 = swift_slowAlloc();
    *(_DWORD *)v19 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v76 = sub_9EFC(a1, a2, &v77);
    sub_24170();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v15, v16, "(getContainerURL) identifier: %s", v19, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    a5 = v73;
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  if (!container_query_create())
  {
    v21 = sub_23E10();
    os_log_type_t v22 = sub_24010();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v23 = 0;
      v24 = "(getContainerURL) container_query_create() failure";
LABEL_9:
      _os_log_impl(&dword_0, v21, v22, v24, v23, 2u);
      swift_slowDealloc();
    }
LABEL_10:

    uint64_t v25 = 1;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(a5, v25, 1, v75);
  }
  if (a3)
  {
    uint64_t v20 = sub_23F00();
    xpc_string_create((const char *)(v20 + 32));
    swift_release();
    container_query_set_identifiers();
    swift_unknownObjectRelease();
    container_query_set_class();
  }
  else
  {
    container_query_set_class();
    uint64_t v26 = sub_23F00();
    xpc_string_create((const char *)(v26 + 32));
    swift_release();
    container_query_set_group_identifiers();
    swift_unknownObjectRelease();
  }
  container_query_set_persona_unique_string();
  container_query_operation_set_flags();
  if (!container_query_get_single_result())
  {
    v41 = sub_23E10();
    os_log_type_t v42 = sub_24010();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v43 = 0;
      _os_log_impl(&dword_0, v41, v42, "(getContainerURL) container_query_get_single_result() failure", v43, 2u);
      swift_slowDealloc();
    }

    container_query_get_last_error();
    if (container_error_copy_unlocalized_description())
    {
      v44 = sub_23E10();
      os_log_type_t v45 = sub_24010();
      if (os_log_type_enabled(v44, v45))
      {
        v46 = (uint8_t *)swift_slowAlloc();
        uint64_t v77 = swift_slowAlloc();
        *(_DWORD *)v46 = 136315138;
        uint64_t v47 = sub_23F50();
        uint64_t v76 = sub_9EFC(v47, v48, &v77);
        sub_24170();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_0, v44, v45, "(getContainerURL) container_error: %s", v46, 0xCu);
        uint64_t v25 = 1;
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(a5, v25, 1, v75);
      }
    }
    uint64_t v25 = 1;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(a5, v25, 1, v75);
  }
  uint64_t v27 = container_copy_object();
  container_query_free();
  if (v27)
  {
    uint64_t v73 = a1;
    if (container_get_path())
    {
      uint64_t v28 = sub_23F50();
      unint64_t v30 = v29;
      if (!container_get_identifier())
      {
        swift_bridgeObjectRelease();
        v21 = sub_23E10();
        os_log_type_t v22 = sub_24010();
        if (!os_log_type_enabled(v21, v22)) {
          goto LABEL_10;
        }
        v23 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v23 = 0;
        v24 = "(getContainerURL) Unable to get container identifier";
        goto LABEL_9;
      }
      uint64_t v32 = sub_23F50();
      unint64_t v33 = v31;
      if (v32 == v73 && v31 == a2 || (sub_24290() & 1) != 0)
      {
        uint64_t v70 = v28;
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        v34 = sub_23E10();
        os_log_type_t v35 = sub_24030();
        int v36 = v35;
        if (os_log_type_enabled(v34, v35))
        {
          uint64_t v37 = swift_slowAlloc();
          uint64_t v68 = swift_slowAlloc();
          uint64_t v77 = v68;
          *(_DWORD *)uint64_t v37 = 136315650;
          int v66 = v36;
          swift_bridgeObjectRetain();
          os_log_t v67 = v34;
          uint64_t v76 = sub_9EFC(v70, v30, &v77);
          sub_24170();
          swift_bridgeObjectRelease_n();
          unint64_t v69 = a2;
          *(_WORD *)(v37 + 12) = 2080;
          swift_bridgeObjectRetain();
          uint64_t v76 = sub_9EFC(v32, v33, &v77);
          sub_24170();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v37 + 22) = 2080;
          a2 = v69;
          swift_bridgeObjectRetain();
          uint64_t v76 = sub_9EFC(v73, a2, &v77);
          sub_24170();
          swift_bridgeObjectRelease_n();
          os_log_t v38 = v67;
          _os_log_impl(&dword_0, v67, (os_log_type_t)v66, "(getContainerURL) path: %s for id:%s  for identifier: %s", (uint8_t *)v37, 0x20u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
        }
        v40 = v71;
        v39 = v72;
        sub_23C70();
        swift_bridgeObjectRelease();
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 16))(v40, v39, v75);
        swift_bridgeObjectRetain_n();
        v56 = sub_23E10();
        os_log_type_t v57 = sub_24030();
        int v58 = v57;
        if (os_log_type_enabled(v56, v57))
        {
          uint64_t v59 = swift_slowAlloc();
          LODWORD(v71) = v58;
          uint64_t v60 = v59;
          uint64_t v74 = swift_slowAlloc();
          uint64_t v77 = v74;
          *(_DWORD *)uint64_t v60 = 136315394;
          sub_68E4();
          uint64_t v61 = v75;
          uint64_t v62 = sub_24280();
          uint64_t v76 = sub_9EFC(v62, v63, &v77);
          v39 = v72;
          sub_24170();
          swift_bridgeObjectRelease();
          (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v40, v61);
          *(_WORD *)(v60 + 12) = 2080;
          swift_bridgeObjectRetain();
          uint64_t v76 = sub_9EFC(v73, a2, &v77);
          sub_24170();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_0, v56, (os_log_type_t)v71, "(getContainerURL) final url: %s  for identifier: %s", (uint8_t *)v60, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {

          (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v40, v75);
          swift_bridgeObjectRelease_n();
        }
        (*(void (**)(uint64_t, unsigned char *, uint64_t))(v10 + 32))(a5, v39, v75);
        uint64_t v25 = 0;
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(a5, v25, 1, v75);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v21 = sub_23E10();
      os_log_type_t v22 = sub_24010();
      if (os_log_type_enabled(v21, v22))
      {
        v23 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v23 = 0;
        v24 = "(getContainerURL) path for wrong container";
        goto LABEL_9;
      }
      goto LABEL_10;
    }
    uint64_t v52 = a5;
    swift_bridgeObjectRetain_n();
    v53 = sub_23E10();
    os_log_type_t v54 = sub_24010();
    if (os_log_type_enabled(v53, v54))
    {
      v55 = (uint8_t *)swift_slowAlloc();
      uint64_t v77 = swift_slowAlloc();
      *(_DWORD *)v55 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v76 = sub_9EFC(v73, a2, &v77);
      sub_24170();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_0, v53, v54, "(getContainerURL) Unable to get path from %s", v55, 0xCu);
      uint64_t v25 = 1;
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();

      uint64_t v25 = 1;
    }
    a5 = v52;
  }
  else
  {
    uint64_t v73 = a5;
    swift_bridgeObjectRetain_n();
    v49 = sub_23E10();
    os_log_type_t v50 = sub_24010();
    if (os_log_type_enabled(v49, v50))
    {
      v51 = (uint8_t *)swift_slowAlloc();
      uint64_t v77 = swift_slowAlloc();
      *(_DWORD *)v51 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v76 = sub_9EFC(a1, a2, &v77);
      sub_24170();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_0, v49, v50, "(getContainerURL) Unable to get container for %s", v51, 0xCu);
      uint64_t v25 = 1;
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();

      uint64_t v25 = 1;
    }
    a5 = v73;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(a5, v25, 1, v75);
}

uint64_t type metadata accessor for QueryContainer()
{
  return self;
}

unint64_t sub_68E4()
{
  unint64_t result = qword_323B0;
  if (!qword_323B0)
  {
    sub_23D50();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_323B0);
  }
  return result;
}

uint64_t sub_693C()
{
  uint64_t v0 = sub_23E30();
  sub_82F8(v0, qword_323B8);
  uint64_t v1 = sub_827C(v0, (uint64_t)qword_323B8);
  if (qword_31FE8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_827C(v0, (uint64_t)qword_32E50);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

void sub_6A04()
{
  id v0 = objc_allocWithZone((Class)CKRecordZone);
  NSString v1 = sub_23EB0();
  id v2 = [v0 initWithZoneName:v1];

  qword_32DF8 = (uint64_t)v2;
}

void sub_6A78(unint64_t a1, BOOL a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  if (qword_31FA0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_23E30();
  sub_827C(v10, (uint64_t)qword_323B8);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v11 = sub_23E10();
  os_log_type_t v12 = sub_24030();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 134218240;
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v14 = sub_24240();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v14 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
    }
    swift_bridgeObjectRelease();
    uint64_t v30 = v14;
    sub_24170();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2048;
    if ((unint64_t)a2 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v15 = sub_24240();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v15 = *(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8));
    }
    swift_bridgeObjectRelease();
    uint64_t v30 = v15;
    sub_24170();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v11, v12, "(uploadRecords) saving total %ld records, deleting total %ld records", (uint8_t *)v13, 0x16u);
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  sub_8824(0, &qword_32448);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v31.value._rawValue = (void *)a1;
  v31.is_nil = a2;
  Class isa = sub_24100(v31, v32).super.super.super.super.isa;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a3;
  *(void *)(v17 + 24) = a4;
  swift_retain();
  sub_240F0();
  uint64_t v18 = isa;
  v19 = sub_23E10();
  os_log_type_t v20 = sub_24030();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v29 = v5;
    v21 = (uint8_t *)swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    *(_DWORD *)v21 = 136315138;
    uint64_t v28 = v21 + 4;
    os_log_type_t v22 = v18;
    id v23 = [(objc_class *)v22 description];
    uint64_t v24 = sub_23EE0();
    unint64_t v26 = v25;

    uint64_t v27 = v24;
    uint64_t v5 = v29;
    sub_9EFC(v27, v26, &v30);
    sub_24170();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v19, v20, "(uploadRecords) operation added to a database:%s", v21, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  objc_msgSend(*(id *)(v5 + OBJC_IVAR____TtC21JournalDataclassOwner19CloudKitStackShared_ckDatabase), "addOperation:", v18, v28);
}

uint64_t sub_6E94(uint64_t a1, char a2, uint64_t (*a3)(uint64_t))
{
  if (qword_31FA0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_23E30();
  sub_827C(v5, (uint64_t)qword_323B8);
  char v6 = a2 & 1;
  sub_88A4(a1, a2 & 1);
  sub_88A4(a1, a2 & 1);
  v7 = sub_23E10();
  os_log_type_t v8 = sub_24030();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)v9 = 136315138;
    sub_88A4(a1, a2 & 1);
    sub_82B4(&qword_32450);
    uint64_t v10 = sub_23EF0();
    sub_9EFC(v10, v11, &v14);
    sub_24170();
    swift_bridgeObjectRelease();
    sub_88B0(a1, v6);
    sub_88B0(a1, v6);
    _os_log_impl(&dword_0, v7, v8, "(uploadRecords) upload records result:%s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    if ((a2 & 1) == 0) {
      return a3(0);
    }
  }
  else
  {
    sub_88B0(a1, a2 & 1);
    sub_88B0(a1, a2 & 1);

    if ((a2 & 1) == 0) {
      return a3(0);
    }
  }
  swift_errorRetain();
  a3(a1);
  return sub_88B0(a1, 1);
}

id sub_7124()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CloudKitStackShared();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for CloudKitStackShared()
{
  return self;
}

void *sub_7200()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_720C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for CloudKitStackShared();
  uint64_t result = sub_23E40();
  *a1 = result;
  return result;
}

uint64_t sub_7248(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_23D50();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for CloudKitStackShared();
  sub_739C((uint64_t)v7);
  uint64_t v9 = 0;
  unint64_t v10 = 0xE000000000000000;
  sub_241C0(16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v9 = a1;
  unint64_t v10 = a2;
  v11._countAndFlagsBits = 0x654D74657373612DLL;
  v11._object = (void *)0xEE00617461646174;
  sub_23F40(v11);
  sub_23CD0();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void sub_739C(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_23C50();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = &v28[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_23D50();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = &v28[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_31F90 != -1) {
    swift_once();
  }
  sub_C858(qword_32DD8, (void *)qword_32DE0, a1);
  v29[0] = (id)0xD000000000000016;
  v29[1] = (id)0x8000000000025BD0;
  (*(void (**)(unsigned char *, void, uint64_t))(v3 + 104))(v5, enum case for URL.DirectoryHint.isDirectory(_:), v2);
  sub_8700();
  sub_23D40();
  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v7 + 32))(a1, v9, v6);
  id v10 = [self defaultManager];
  sub_23CC0(v11);
  uint64_t v13 = v12;
  sub_82B4(&qword_32430);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_27570;
  *(void *)(inited + 32) = NSFileProtectionKey;
  uint64_t v15 = (void *)qword_32DE8;
  type metadata accessor for URLFileProtection(0);
  *(void *)(inited + 64) = v16;
  *(void *)(inited + 40) = v15;
  uint64_t v17 = NSFileProtectionKey;
  id v18 = v15;
  sub_78C4(inited);
  type metadata accessor for FileAttributeKey(0);
  sub_8754();
  Class isa = sub_23E80().super.isa;
  swift_bridgeObjectRelease();
  v29[0] = 0;
  LODWORD(inited) = [v10 createDirectoryAtURL:v13 withIntermediateDirectories:1 attributes:isa error:v29];

  if (inited)
  {
    id v20 = v29[0];
    sub_19E78();
    sub_D894(a1);
  }
  else
  {
    id v21 = v29[0];
    sub_23C40();

    swift_willThrow();
    if (qword_31FA0 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_23E30();
    sub_827C(v22, (uint64_t)qword_323B8);
    swift_errorRetain();
    swift_errorRetain();
    id v23 = sub_23E10();
    os_log_type_t v24 = sub_24020();
    if (os_log_type_enabled(v23, v24))
    {
      unint64_t v25 = (uint8_t *)swift_slowAlloc();
      unint64_t v26 = (void *)swift_slowAlloc();
      *(_DWORD *)unint64_t v25 = 138412290;
      swift_errorRetain();
      uint64_t v27 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v29[0] = v27;
      sub_24170();
      *unint64_t v26 = v27;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl(&dword_0, v23, v24, "(getAssetsStagingFolder) Unable to create assets directory: %@", v25, 0xCu);
      sub_82B4(&qword_32530);
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

unint64_t sub_78C4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_82B4(&qword_32438);
  uint64_t v2 = sub_24250();
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
    sub_87AC(v6, (uint64_t)&v13);
    uint64_t v7 = v13;
    unint64_t result = sub_79E0(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_8814(&v14, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_79E0(uint64_t a1)
{
  sub_23EE0();
  sub_242F0();
  sub_23F20();
  Swift::Int v2 = sub_24310();
  swift_bridgeObjectRelease();
  return sub_7A74(a1, v2);
}

unint64_t sub_7A74(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_23EE0();
    uint64_t v8 = v7;
    if (v6 == sub_23EE0() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_24290();
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
          uint64_t v13 = sub_23EE0();
          uint64_t v15 = v14;
          if (v13 == sub_23EE0() && v15 == v16) {
            break;
          }
          char v18 = sub_24290();
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

id sub_7BEC(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = v3;
  id v46 = a1;
  id v47 = a2;
  uint64_t v6 = sub_24060();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24050();
  __chkstk_darwin(v10 - 8);
  uint64_t v11 = sub_23E70();
  __chkstk_darwin(v11 - 8);
  *(_OWORD *)&v4[OBJC_IVAR____TtC21JournalDataclassOwner19CloudKitStackShared_inMemoryMetadata] = xmmword_27580;
  uint64_t v12 = &v4[OBJC_IVAR____TtC21JournalDataclassOwner19CloudKitStackShared_subscriptionID];
  *(void *)uint64_t v12 = 0xD000000000000025;
  *((void *)v12 + 1) = 0x8000000000025960;
  uint64_t v13 = OBJC_IVAR____TtC21JournalDataclassOwner19CloudKitStackShared_sharedUploadRecordQueue;
  sub_8824(0, &qword_32420);
  unint64_t v48 = v4;
  sub_23E50();
  sub_24040();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v6);
  *(void *)&v4[v13] = sub_24080();
  uint64_t v14 = &off_31000;
  if (a3)
  {
    id v15 = objc_allocWithZone((Class)CKContainerOptions);
    id v16 = objc_msgSend(v15, "init", v46, v47);
    NSString v17 = sub_23EB0();
    swift_bridgeObjectRelease();
    [v16 setApplicationBundleIdentifierOverrideForContainerAccess:v17];

    id v18 = objc_allocWithZone((Class)CKContainerID);
    NSString v19 = sub_23EB0();
    id v20 = [v18 initWithContainerIdentifier:v19 environment:1];

    id v21 = [objc_allocWithZone((Class)CKContainer) initWithContainerID:v20 options:v16];
    uint64_t v22 = OBJC_IVAR____TtC21JournalDataclassOwner19CloudKitStackShared_ckContainer;
    id v23 = v48;
    *(void *)&v48[OBJC_IVAR____TtC21JournalDataclassOwner19CloudKitStackShared_ckContainer] = v21;
    if (qword_31FA0 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_23E30();
    sub_827C(v24, (uint64_t)qword_323B8);
    unint64_t v25 = v23;
    unint64_t v26 = sub_23E10();
    os_log_type_t v27 = sub_24030();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      id v47 = v16;
      uint64_t v30 = (void *)v29;
      id v46 = v20;
      *(_DWORD *)uint64_t v28 = 138412290;
      id v31 = [*(id *)&v23[v22] containerID];
      id v49 = v31;
      id v20 = v46;
      sub_24170();
      *uint64_t v30 = v31;

      _os_log_impl(&dword_0, v26, v27, "-> CloudKitStack init for container %@", v28, 0xCu);
      sub_82B4(&qword_32530);
      swift_arrayDestroy();
      id v16 = v47;
      swift_slowDealloc();
      uint64_t v14 = &off_31000;
      swift_slowDealloc();
    }
    else
    {

      unint64_t v26 = v25;
    }

    id v42 = *(id *)&v23[v22];
    id v43 = [v42 privateCloudDatabase];
  }
  else
  {
    swift_bridgeObjectRetain();
    NSString v32 = sub_23EB0();
    swift_bridgeObjectRelease();
    id v33 = objc_msgSend(self, "containerWithIdentifier:", v32, v46, v47);

    uint64_t v34 = OBJC_IVAR____TtC21JournalDataclassOwner19CloudKitStackShared_ckContainer;
    id v23 = v48;
    *(void *)&v48[OBJC_IVAR____TtC21JournalDataclassOwner19CloudKitStackShared_ckContainer] = v33;
    if (qword_31FA0 != -1) {
      swift_once();
    }
    uint64_t v35 = sub_23E30();
    sub_827C(v35, (uint64_t)qword_323B8);
    int v36 = v23;
    uint64_t v37 = sub_23E10();
    os_log_type_t v38 = sub_24030();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = (uint8_t *)swift_slowAlloc();
      v40 = (void *)swift_slowAlloc();
      *(_DWORD *)v39 = 138412290;
      id v41 = [*(id *)&v23[v34] containerID];
      id v49 = v41;
      sub_24170();
      void *v40 = v41;

      _os_log_impl(&dword_0, v37, v38, "-> CloudKitStack init for container %@", v39, 0xCu);
      sub_82B4(&qword_32530);
      swift_arrayDestroy();
      uint64_t v14 = &off_31000;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      uint64_t v37 = v36;
    }

    id v43 = [*(id *)&v23[v34] privateCloudDatabase];
  }
  *(void *)&v23[OBJC_IVAR____TtC21JournalDataclassOwner19CloudKitStackShared_ckDatabase] = v43;

  v44 = (objc_class *)type metadata accessor for CloudKitStackShared();
  v50.receiver = v23;
  v50.super_class = v44;
  return objc_msgSendSuper2(&v50, (SEL)v14[136]);
}

uint64_t sub_827C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_82B4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t *sub_82F8(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

id sub_835C()
{
  Class isa = sub_23D60().super.isa;
  id v6 = 0;
  id v2 = [v0 initForReadingFromData:isa error:&v6];

  if (v2)
  {
    id v3 = v6;
  }
  else
  {
    id v4 = v6;
    sub_23C40();

    swift_willThrow();
  }
  return v2;
}

id sub_841C(uint64_t a1, unint64_t a2)
{
  id v4 = objc_allocWithZone((Class)NSKeyedUnarchiver);
  sub_8650(a1, a2);
  id v5 = sub_835C();
  sub_86A8(a1, a2);
  id v6 = [objc_allocWithZone((Class)CKRecord) initWithCoder:v5];

  return v6;
}

uint64_t sub_8650(uint64_t a1, unint64_t a2)
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

uint64_t sub_86A8(uint64_t a1, unint64_t a2)
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

unint64_t sub_8700()
{
  unint64_t result = qword_32428;
  if (!qword_32428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_32428);
  }
  return result;
}

unint64_t sub_8754()
{
  unint64_t result = qword_32240;
  if (!qword_32240)
  {
    type metadata accessor for FileAttributeKey(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_32240);
  }
  return result;
}

uint64_t sub_87AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_82B4(&qword_32440);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_8814(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_8824(uint64_t a1, unint64_t *a2)
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

uint64_t sub_8860()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_8898(uint64_t a1, char a2)
{
  return sub_6E94(a1, a2 & 1, *(uint64_t (**)(uint64_t))(v2 + 16));
}

uint64_t sub_88A4(uint64_t a1, char a2)
{
  if (a2) {
    return swift_errorRetain();
  }
  return result;
}

uint64_t sub_88B0(uint64_t a1, char a2)
{
  if (a2) {
    return swift_errorRelease();
  }
  return result;
}

uint64_t sub_88BC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_86A8(a1, a2);
  }
  return a1;
}

uint64_t sub_88D0()
{
  uint64_t v0 = sub_23E30();
  sub_82F8(v0, qword_32458);
  uint64_t v1 = sub_827C(v0, (uint64_t)qword_32458);
  if (qword_31FE8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_827C(v0, (uint64_t)qword_32E50);
  id v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

void sub_8998(uint64_t a1@<X0>, char a2@<W1>, const char *a3@<X2>, const char *a4@<X3>, char *a5@<X8>)
{
  id v9 = [*(id *)(a1 + OBJC_IVAR____TtC21JournalDataclassOwner19CoreDataStackShared_container) newBackgroundContext];
  id v10 = [self mergeByPropertyStoreTrumpMergePolicy];
  [v9 setMergePolicy:v10];

  if (sub_18384(a2))
  {
    if (qword_31FB0 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_23E30();
    sub_827C(v11, (uint64_t)qword_32458);
    uint64_t v12 = sub_23E10();
    os_log_type_t v13 = sub_24030();
    if (!os_log_type_enabled(v12, v13))
    {
      char v15 = 1;
      goto LABEL_13;
    }
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_0, v12, v13, a3, v14, 2u);
    char v15 = 1;
  }
  else
  {
    if (qword_31FB0 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_23E30();
    sub_827C(v16, (uint64_t)qword_32458);
    uint64_t v12 = sub_23E10();
    os_log_type_t v17 = sub_24030();
    if (!os_log_type_enabled(v12, v17))
    {
      char v15 = 0;
      goto LABEL_13;
    }
    id v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v18 = 0;
    _os_log_impl(&dword_0, v12, v17, a4, v18, 2u);
    char v15 = 0;
  }
  swift_slowDealloc();
LABEL_13:

  *a5 = v15;
}

uint64_t sub_8BBC()
{
  return sub_8C0C("(haveData synced) start", (uint64_t)sub_8E80, "(haveData synced) failed to get coreDataStack");
}

uint64_t sub_8BE4()
{
  return sub_8C0C("(haveData unsynced) start", (uint64_t)sub_8E50, "(haveData unsynced) failed to get coreDataStack");
}

uint64_t sub_8C0C(const char *a1, uint64_t a2, const char *a3)
{
  type metadata accessor for CoreDataStackShared();
  uint64_t v5 = sub_1F7C4();
  if (v5)
  {
    id v6 = (void *)v5;
    if (qword_31FB0 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_23E30();
    sub_827C(v7, (uint64_t)qword_32458);
    uint64_t v8 = sub_23E10();
    os_log_type_t v9 = sub_24030();
    if (os_log_type_enabled(v8, v9))
    {
      id v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_0, v8, v9, a1, v10, 2u);
      swift_slowDealloc();
    }

    if (qword_31FC8 != -1) {
      uint64_t v11 = swift_once();
    }
    __chkstk_darwin(v11);
    sub_24070();

    return v17;
  }
  else
  {
    if (qword_31FB0 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_23E30();
    sub_827C(v13, (uint64_t)qword_32458);
    uint64_t v14 = sub_23E10();
    os_log_type_t v15 = sub_24010();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_0, v14, v15, a3, v16, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
}

void sub_8E50(char *a1@<X8>)
{
  sub_8998(*(void *)(v1 + 16), 0, "(haveData unsynced) true", "(haveData unsynced) false", a1);
}

void sub_8E80(char *a1@<X8>)
{
  sub_8998(*(void *)(v1 + 16), 1, "(haveData synced) true", "(haveData synced) false", a1);
}

uint64_t sub_8EB0()
{
  uint64_t v0 = sub_23E30();
  sub_82F8(v0, qword_32470);
  uint64_t v1 = sub_827C(v0, (uint64_t)qword_32470);
  if (qword_31FD0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_827C(v0, (uint64_t)qword_32E08);
  id v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

void sub_8F78(void *a1, uint64_t a2, uint64_t a3)
{
  id v7 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v8 = sub_23EB0();
  id v9 = [v7 initWithEntityName:v8];

  id v10 = (void *)swift_allocObject();
  v10[2] = a1;
  v10[3] = v9;
  v10[4] = a2;
  v10[5] = a3;
  v10[6] = v3;
  v15[4] = sub_94D8;
  v15[5] = v10;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 1107296256;
  v15[2] = sub_1A290;
  v15[3] = &unk_2CFA0;
  uint64_t v11 = _Block_copy(v15);
  id v12 = a1;
  id v13 = v9;
  swift_retain();
  id v14 = v3;
  swift_release();
  [v12 performBlock:v11];
  _Block_release(v11);
}

void sub_90D0(uint64_t a1, uint64_t a2, void (*a3)(void *))
{
  type metadata accessor for SyncDataMO();
  unint64_t v4 = sub_240D0();
  unint64_t v5 = v4;
  if (!(v4 >> 62))
  {
    if (*(void *)((char *)&dword_10 + (v4 & 0xFFFFFFFFFFFFFF8))) {
      goto LABEL_3;
    }
LABEL_10:
    swift_bridgeObjectRelease();
    a3(0);
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_24240();
  swift_bridgeObjectRelease();
  if (!v8) {
    goto LABEL_10;
  }
LABEL_3:
  if ((v5 & 0xC000000000000001) != 0)
  {
    id v6 = (id)sub_241F0();
  }
  else
  {
    if (!*(void *)((char *)&dword_10 + (v5 & 0xFFFFFFFFFFFFFF8)))
    {
      __break(1u);
      return;
    }
    id v6 = *(id *)(v5 + 32);
  }
  id v7 = v6;
  swift_bridgeObjectRelease();
  id v9 = v7;
  a3(v7);
}

uint64_t sub_9488()
{
  swift_release();
  return _swift_deallocObject(v0, 56, 7);
}

void sub_94D8()
{
  sub_90D0(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void (**)(void *))(v0 + 32));
}

uint64_t sub_94E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_94F8()
{
  return swift_release();
}

void sub_9500(void *a1, void *a2, void (*a3)(uint64_t))
{
  if (a1)
  {
    id v5 = a1;
    [v5 setMetadata:0];
    [v5 setUserId:0];
    if (qword_31FB8 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_23E30();
    sub_827C(v6, (uint64_t)qword_32470);
    id v7 = a2;
    uint64_t v8 = sub_23E10();
    os_log_type_t v9 = sub_24030();
    if (os_log_type_enabled(v8, v9))
    {
      id v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      *(_DWORD *)id v10 = 136446210;
      uint64_t v22 = v11;
      sub_23E00();
      sub_98CC();
      uint64_t v12 = sub_24280();
      sub_9EFC(v12, v13, &v22);
      sub_24170();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v8, v9, "%{public}s Remvoe sync data [REMOVED]", v10, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    a3(1);
  }
  else
  {
    if (qword_31FB8 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_23E30();
    sub_827C(v14, (uint64_t)qword_32470);
    id v15 = a2;
    uint64_t v16 = sub_23E10();
    os_log_type_t v17 = sub_24010();
    if (os_log_type_enabled(v16, v17))
    {
      id v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      *(_DWORD *)id v18 = 136446210;
      uint64_t v22 = v19;
      sub_23E00();
      sub_98CC();
      uint64_t v20 = sub_24280();
      sub_9EFC(v20, v21, &v22);
      sub_24170();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v16, v17, "%{public}s Unable to get sync data", v18, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    a3(1);
  }
}

unint64_t sub_98CC()
{
  unint64_t result = qword_32488;
  if (!qword_32488)
  {
    sub_23E00();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_32488);
  }
  return result;
}

uint64_t sub_9924()
{
  uint64_t v0 = sub_23E30();
  sub_82F8(v0, qword_32490);
  uint64_t v1 = sub_827C(v0, (uint64_t)qword_32490);
  if (qword_31FE8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_827C(v0, (uint64_t)qword_32E50);
  id v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t sub_99EC()
{
  uint64_t v0 = sub_24060();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  id v3 = (char *)v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24050();
  __chkstk_darwin();
  sub_23E70();
  __chkstk_darwin();
  sub_8824(0, &qword_32420);
  sub_23E60();
  v5[1] = &_swiftEmptyArrayStorage;
  sub_C4B4();
  sub_82B4(&qword_32558);
  sub_C50C();
  sub_241A0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v0);
  uint64_t result = sub_24080();
  qword_32E00 = result;
  return result;
}

Class sub_9CF4(void *a1, uint64_t a2, void *a3, void *a4, uint64_t (*a5)(void *, void *))
{
  id v8 = a1;
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = a5(a3, a4);

  if (v11)
  {
    v12.super.Class isa = sub_23F90().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v12.super.Class isa = 0;
  }
  return v12.super.isa;
}

id sub_9EA0()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for DataclassOwner()
{
  return self;
}

uint64_t sub_9EFC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_9FD0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_C454((uint64_t)v12, *a3);
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
      sub_C454((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_C404((uint64_t)v12);
  return v7;
}

uint64_t sub_9FD0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24180();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_A18C(a5, a6);
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
  uint64_t v8 = sub_24210();
  if (!v8)
  {
    sub_24220();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24260();
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

uint64_t sub_A18C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_A224(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_A404(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_A404(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_A224(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_A39C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_241D0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_24220();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_23F60();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_24260();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_24220();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_A39C(uint64_t a1, uint64_t a2)
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
  sub_82B4((uint64_t *)&unk_32540);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_A404(char a1, int64_t a2, char a3, char *a4)
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
    sub_82B4((uint64_t *)&unk_32540);
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
  uint64_t result = sub_24260();
  __break(1u);
  return result;
}

void sub_A554(void *a1, void *a2)
{
  uint64_t v4 = sub_23E30();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  int64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_31FC0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_827C(v4, (uint64_t)qword_32490);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = a2;
  id v10 = a1;
  id v11 = v9;
  id v12 = v10;
  unint64_t v13 = sub_23E10();
  int v14 = sub_24030();
  if (os_log_type_enabled(v13, (os_log_type_t)v14))
  {
    int v37 = v14;
    os_log_type_t v38 = a2;
    uint64_t v39 = v8;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    uint64_t v41 = v36;
    *(_DWORD *)uint64_t v15 = 136315394;
    if (!a1)
    {

      __break(1u);
      goto LABEL_18;
    }
    id v40 = objc_msgSend(v12, "identifier", v36);
    sub_82B4(&qword_32578);
    uint64_t v16 = sub_23EF0();
    id v40 = (id)sub_9EFC(v16, v17, &v41);
    sub_24170();

    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2080;
    id v40 = v38;
    id v18 = v11;
    sub_82B4(&qword_32538);
    uint64_t v19 = sub_23EF0();
    id v40 = (id)sub_9EFC(v19, v20, &v41);
    sub_24170();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v13, (os_log_type_t)v37, "->actionsForEnablingDataclass %s    %s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  char v21 = sub_8BBC();
  uint64_t v22 = sub_23E10();
  os_log_type_t v23 = sub_24030();
  BOOL v24 = os_log_type_enabled(v22, v23);
  if (v21)
  {
    if (v24)
    {
      unint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v25 = 0;
      _os_log_impl(&dword_0, v22, v23, "->actionsForEnablingDataclass haveSyncedData == true)", v25, 2u);
      swift_slowDealloc();
    }

    sub_82B4(&qword_32568);
    uint64_t v26 = swift_allocObject();
    *(_OWORD *)(v26 + 16) = xmmword_27620;
    os_log_type_t v27 = self;
    id v28 = [v27 actionWithType:5];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = sub_8824(0, &qword_32570);
      *(void *)(v26 + 56) = v30;
      *(void *)(v26 + 32) = v29;
      id v31 = [v27 actionWithType:0];
      if (v31)
      {
        *(void *)(v26 + 88) = v30;
        *(void *)(v26 + 64) = v31;
        return;
      }
      goto LABEL_19;
    }
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (v24)
  {
    NSString v32 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)NSString v32 = 0;
    _os_log_impl(&dword_0, v22, v23, "->actionsForEnablingDataclass haveSyncedData == false)", v32, 2u);
    swift_slowDealloc();
  }

  sub_82B4(&qword_32568);
  uint64_t v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_27570;
  id v34 = [self actionWithType:1];
  if (v34)
  {
    id v35 = v34;
    *(void *)(v33 + 56) = sub_8824(0, &qword_32570);
    *(void *)(v33 + 32) = v35;
    return;
  }
LABEL_20:
  __break(1u);
}

void sub_AA84(void *a1, void *a2)
{
  uint64_t v4 = sub_23E30();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  int64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_31FC0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_827C(v4, (uint64_t)qword_32490);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = a1;
  id v10 = a2;
  id v11 = sub_23E10();
  int v12 = sub_24030();
  if (!os_log_type_enabled(v11, (os_log_type_t)v12))
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
LABEL_10:
    sub_A554(a1, a2);
    return;
  }
  int v21 = v12;
  BOOL v24 = a2;
  uint64_t v13 = swift_slowAlloc();
  int v14 = (void *)swift_slowAlloc();
  uint64_t v22 = swift_slowAlloc();
  uint64_t v26 = v22;
  *(_DWORD *)uint64_t v13 = 138412546;
  os_log_type_t v23 = a1;
  if (a1)
  {
    id v15 = [v9 identifier];
    id v16 = v15;
    if (v15) {
      uint64_t v25 = (uint64_t)v15;
    }
    else {
      uint64_t v25 = 0;
    }
    sub_24170();
    void *v14 = v16;

    *(_WORD *)(v13 + 12) = 2080;
    unint64_t v17 = v24;
    uint64_t v25 = (uint64_t)v24;
    sub_82B4(&qword_32538);
    uint64_t v18 = sub_24150();
    uint64_t v25 = sub_9EFC(v18, v19, &v26);
    sub_24170();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v11, (os_log_type_t)v21, "->actions DataclassOwner getting action for adding dataclass for account %@ for dataclas %s", (uint8_t *)v13, 0x16u);
    sub_82B4(&qword_32530);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    a2 = v17;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    a1 = v23;
    goto LABEL_10;
  }

  __break(1u);
}

void sub_AE04(void *a1, void *a2)
{
  uint64_t v4 = sub_23E30();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  int64_t v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_31FC0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_827C(v4, (uint64_t)qword_32490);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = a1;
  uint64_t v44 = (uint64_t)a2;
  id v10 = a2;
  id v11 = sub_23E10();
  int v12 = sub_24030();
  if (os_log_type_enabled(v11, (os_log_type_t)v12))
  {
    int v41 = v12;
    uint64_t v43 = v8;
    uint64_t v13 = swift_slowAlloc();
    int v14 = (void *)swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    uint64_t v46 = v42;
    *(_DWORD *)uint64_t v13 = 138412546;
    if (!a1)
    {

      __break(1u);
      goto LABEL_24;
    }
    id v15 = [v9 identifier];
    id v16 = v15;
    if (v15) {
      uint64_t v45 = (uint64_t)v15;
    }
    else {
      uint64_t v45 = 0;
    }
    sub_24170();
    void *v14 = v16;

    *(_WORD *)(v13 + 12) = 2080;
    uint64_t v45 = v44;
    sub_82B4(&qword_32538);
    uint64_t v17 = sub_24150();
    uint64_t v45 = sub_9EFC(v17, v18, &v46);
    sub_24170();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v11, (os_log_type_t)v41, "->forDeletingDataClass DataclassOwner getting deleting for adding dataclass for account %@ for dataclas %s", (uint8_t *)v13, 0x16u);
    sub_82B4(&qword_32530);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  char v19 = sub_8BBC();
  char v20 = sub_8BE4();
  int v21 = sub_23E10();
  os_log_type_t v22 = sub_24030();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = swift_slowAlloc();
    *(_DWORD *)uint64_t v23 = 67109376;
    LODWORD(v46) = v19 & 1;
    sub_24170();
    *(_WORD *)(v23 + 8) = 1024;
    LODWORD(v46) = v20 & 1;
    sub_24170();
    _os_log_impl(&dword_0, v21, v22, "->forDeletingDataClass syncDataExists:%{BOOL}d  unsyncDataExists:%{BOOL}d", (uint8_t *)v23, 0xEu);
    swift_slowDealloc();
  }

  char v24 = v19 | v20;
  uint64_t v25 = sub_23E10();
  os_log_type_t v26 = sub_24030();
  BOOL v27 = os_log_type_enabled(v25, v26);
  if (v24)
  {
    if (v27)
    {
      id v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v28 = 0;
      _os_log_impl(&dword_0, v25, v26, "->forDeletingDataClass, returning [(type: .mergeSyncDataIntoLocalData), (with: .deleteSyncData), (type: .cancel)]", v28, 2u);
      swift_slowDealloc();
    }

    sub_82B4(&qword_32568);
    uint64_t v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_27630;
    uint64_t v30 = self;
    id v31 = [v30 actionWithType:2];
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = sub_8824(0, &qword_32570);
      *(void *)(v29 + 56) = v33;
      *(void *)(v29 + 32) = v32;
      id v34 = [v30 destructiveActionWithType:3];
      if (v34)
      {
        *(void *)(v29 + 88) = v33;
        *(void *)(v29 + 64) = v34;
        id v35 = [v30 actionWithType:0];
        if (v35)
        {
          *(void *)(v29 + 120) = v33;
          *(void *)(v29 + 96) = v35;
          return;
        }
        goto LABEL_26;
      }
LABEL_25:
      __break(1u);
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (v27)
  {
    uint64_t v36 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v36 = 0;
    _os_log_impl(&dword_0, v25, v26, "->forDeletingDataClass haveUnsyncedData == false, returning [(type: .deleteSyncData)]", v36, 2u);
    swift_slowDealloc();
  }

  sub_82B4(&qword_32568);
  uint64_t v37 = swift_allocObject();
  *(_OWORD *)(v37 + 16) = xmmword_27570;
  id v38 = [self actionWithType:3];
  if (v38)
  {
    id v39 = v38;
    *(void *)(v37 + 56) = sub_8824(0, &qword_32570);
    *(void *)(v37 + 32) = v39;
    return;
  }
LABEL_27:
  __break(1u);
}

void sub_B464(void *a1, void *a2)
{
  uint64_t v4 = sub_23E30();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  int64_t v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_31FC0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_827C(v4, (uint64_t)qword_32490);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = a2;
  id v10 = a1;
  id v11 = (id *)v9;
  id v12 = v10;
  uint64_t v13 = sub_23E10();
  int v14 = sub_24030();
  if (!os_log_type_enabled(v13, (os_log_type_t)v14)) {
    goto LABEL_13;
  }
  int v43 = v14;
  uint64_t v44 = a2;
  uint64_t v45 = v8;
  uint64_t v15 = swift_slowAlloc();
  uint64_t v42 = swift_slowAlloc();
  uint64_t v47 = v42;
  *(_DWORD *)uint64_t v15 = 136315394;
  if (!a1)
  {

    __break(1u);
    goto LABEL_25;
  }
  id v46 = objc_msgSend(v12, "identifier", v42);
  sub_82B4(&qword_32578);
  uint64_t v16 = sub_23EF0();
  id v46 = (id)sub_9EFC(v16, v17, &v47);
  sub_24170();

  swift_bridgeObjectRelease();
  *(_WORD *)(v15 + 12) = 2080;
  id v46 = v44;
  unint64_t v18 = v11;
  sub_82B4(&qword_32538);
  id v11 = &v46;
  uint64_t v19 = sub_23EF0();
  id v46 = (id)sub_9EFC(v19, v20, &v47);
  sub_24170();

  swift_bridgeObjectRelease();
  _os_log_impl(&dword_0, v13, (os_log_type_t)v43, "->actionsForDisablingDataclass %s    %s", (uint8_t *)v15, 0x16u);
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();

  int v21 = *(void (**)(char *, uint64_t))(v5 + 8);
  v5 += 8;
  v21(v7, v4);
  if (sub_8BBC())
  {
LABEL_14:
    id v31 = sub_23E10();
    os_log_type_t v32 = sub_24030();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v33 = 0;
      _os_log_impl(&dword_0, v31, v32, "->actionsForDisablingDataclass haveSyncedData == true, returning [(type: .mergeSyncDataIntoLocalData), (with: .deleteSyncData), (type: .cancel)]", v33, 2u);
      swift_slowDealloc();
    }

    sub_82B4(&qword_32568);
    uint64_t v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_27630;
    id v34 = self;
    id v35 = [v34 actionWithType:2];
    if (v35)
    {
      id v36 = v35;
      id v12 = (id)sub_8824(0, &qword_32570);
      *(void *)(v4 + 56) = v12;
      *(void *)(v4 + 32) = v36;
      id v37 = [v34 destructiveActionWithType:3];
      if (v37)
      {
        *(void *)(v4 + 88) = v12;
        *(void *)(v4 + 64) = v37;
        id v29 = [v34 actionWithType:0];
        if (v29)
        {
LABEL_19:
          *(void *)(v4 + 120) = v12;
          *(void *)(v4 + 96) = v29;
          return;
        }
        goto LABEL_27;
      }
LABEL_26:
      __break(1u);
LABEL_27:
      __break(1u);
LABEL_28:
      __break(1u);
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  while (1)
  {
    char v22 = sub_8BE4();
    uint64_t v23 = sub_23E10();
    os_log_type_t v24 = sub_24030();
    BOOL v25 = os_log_type_enabled(v23, v24);
    if ((v22 & 1) == 0) {
      break;
    }
    if (v25)
    {
      os_log_type_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v26 = 0;
      _os_log_impl(&dword_0, v23, v24, "->actionsForDisablingDataclass haveUnsyncedData == true", v26, 2u);
      swift_slowDealloc();
    }

    sub_82B4(&qword_32568);
    uint64_t v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_27630;
    int64_t v7 = (char *)self;
    BOOL v27 = [v7 actionWithType:2];
    if (!v27) {
      goto LABEL_28;
    }
    uint64_t v13 = v27;
    id v12 = (id)sub_8824(0, &qword_32570);
    *(void *)(v4 + 56) = v12;
    *(void *)(v4 + 32) = v13;
    id v28 = [v7 destructiveActionWithType:8];
    if (!v28) {
      goto LABEL_29;
    }
    *(void *)(v4 + 88) = v12;
    *(void *)(v4 + 64) = v28;
    id v29 = [v7 actionWithType:0];
    if (v29) {
      goto LABEL_19;
    }
    __break(1u);
LABEL_13:

    uint64_t v30 = *(void (**)(char *, uint64_t))(v5 + 8);
    v5 += 8;
    v30(v7, v4);
    if (sub_8BBC()) {
      goto LABEL_14;
    }
  }
  if (v25)
  {
    id v38 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v38 = 0;
    _os_log_impl(&dword_0, v23, v24, "->actionsForDisablingDataclass haveUnsyncedData == false, returning [(type: .deleteSyncData)]", v38, 2u);
    swift_slowDealloc();
  }

  sub_82B4(&qword_32568);
  uint64_t v39 = swift_allocObject();
  *(_OWORD *)(v39 + 16) = xmmword_27570;
  id v40 = [self actionWithType:3];
  if (v40)
  {
    id v41 = v40;
    *(void *)(v39 + 56) = sub_8824(0, &qword_32570);
    *(void *)(v39 + 32) = v41;
    return;
  }
LABEL_30:
  __break(1u);
}

uint64_t sub_BB08(void *a1, void *a2, void *a3)
{
  uint64_t v6 = sub_23E30();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_31FC0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_827C(v6, (uint64_t)qword_32490);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  uint64_t v51 = (uint64_t)a3;
  id v11 = a3;
  id v12 = a1;
  uint64_t v52 = a2;
  id v13 = a2;
  id v14 = v11;
  id v15 = v12;
  id v16 = v13;
  unint64_t v17 = sub_23E10();
  int v18 = sub_24030();
  BOOL v19 = os_log_type_enabled(v17, (os_log_type_t)v18);
  v53 = a1;
  if (v19)
  {
    int v46 = v18;
    uint64_t v48 = v10;
    id v49 = v14;
    uint64_t v20 = swift_slowAlloc();
    objc_super v50 = (void *)swift_slowAlloc();
    uint64_t v47 = swift_slowAlloc();
    uint64_t v55 = v47;
    *(_DWORD *)uint64_t v20 = 138412802;
    if (a1)
    {
      uint64_t v54 = (uint64_t)v15;
      id v21 = v15;
    }
    else
    {
      uint64_t v54 = 0;
    }
    sub_24170();
    *objc_super v50 = v53;

    *(_WORD *)(v20 + 12) = 2112;
    if (!v52)
    {
      id v44 = v49;

      __break(1u);
      JUMPOUT(0xC3E8);
    }
    id v22 = [v16 identifier];
    id v23 = v22;
    if (v22) {
      uint64_t v54 = (uint64_t)v22;
    }
    else {
      uint64_t v54 = 0;
    }
    sub_24170();
    v50[1] = v23;

    *(_WORD *)(v20 + 22) = 2080;
    uint64_t v54 = v51;
    sub_82B4(&qword_32538);
    uint64_t v24 = sub_24150();
    uint64_t v54 = sub_9EFC(v24, v25, &v55);
    sub_24170();
    id v26 = v49;

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v17, (os_log_type_t)v46, "->perform DataclassOwner perform action %@ for account %@ for dataclas %s", (uint8_t *)v20, 0x20u);
    sub_82B4(&qword_32530);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  if (!v53) {
    __break(1u);
  }
  id v27 = [v15 type];
  uint64_t result = 1;
  switch((unint64_t)v27)
  {
    case 2uLL:
    case 5uLL:
      if (qword_320C0 != -1) {
        swift_once();
      }
      sub_827C(v6, (uint64_t)qword_32968);
      id v29 = sub_23E10();
      os_log_type_t v30 = sub_24030();
      if (os_log_type_enabled(v29, v30))
      {
        id v31 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v31 = 0;
        _os_log_impl(&dword_0, v29, v30, "(killJournalProcess) triggered", v31, 2u);
        swift_slowDealloc();
      }

      NSString v32 = sub_23EB0();
      SFKillProcessNamed();

      sub_1A50C();
      goto LABEL_25;
    case 3uLL:
      if (qword_320C0 != -1) {
        swift_once();
      }
      sub_827C(v6, (uint64_t)qword_32968);
      id v37 = sub_23E10();
      os_log_type_t v38 = sub_24030();
      if (os_log_type_enabled(v37, v38))
      {
        uint64_t v39 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v39 = 0;
        _os_log_impl(&dword_0, v37, v38, "(killJournalProcess) triggered", v39, 2u);
        swift_slowDealloc();
      }

      NSString v40 = sub_23EB0();
      SFKillProcessNamed();

      sub_1E4FC();
      sub_1A2D4();
      id v41 = sub_23E10();
      os_log_type_t v42 = sub_24030();
      if (os_log_type_enabled(v41, v42))
      {
        int v43 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)int v43 = 0;
        _os_log_impl(&dword_0, v41, v42, "->perform DataclassOwner done", v43, 2u);
        swift_slowDealloc();
      }

      goto LABEL_25;
    case 7uLL:
    case 8uLL:
      if (qword_320C0 != -1) {
        swift_once();
      }
      sub_827C(v6, (uint64_t)qword_32968);
      uint64_t v33 = sub_23E10();
      os_log_type_t v34 = sub_24030();
      if (os_log_type_enabled(v33, v34))
      {
        id v35 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v35 = 0;
        _os_log_impl(&dword_0, v33, v34, "(killJournalProcess) triggered", v35, 2u);
        swift_slowDealloc();
      }

      NSString v36 = sub_23EB0();
      SFKillProcessNamed();

      sub_1A2D4();
LABEL_25:
      uint64_t result = 1;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_C404(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_C454(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_C4B4()
{
  unint64_t result = qword_32550;
  if (!qword_32550)
  {
    sub_24050();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_32550);
  }
  return result;
}

unint64_t sub_C50C()
{
  unint64_t result = qword_32560;
  if (!qword_32560)
  {
    sub_C568(&qword_32558);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_32560);
  }
  return result;
}

uint64_t sub_C568(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_C5B0(uint64_t a1)
{
  return sub_C618(a1, qword_32E08);
}

uint64_t sub_C5DC(uint64_t a1)
{
  return sub_C618(a1, qword_32E20);
}

uint64_t sub_C600(uint64_t a1)
{
  return sub_C618(a1, qword_32E38);
}

uint64_t sub_C618(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_23E30();
  sub_82F8(v3, a2);
  sub_827C(v3, (uint64_t)a2);
  return sub_23E20();
}

uint64_t static Logger.appLoggerWith(category:)()
{
  id v0 = [self mainBundle];
  id v1 = [v0 bundleIdentifier];

  if (v1)
  {
    sub_23EE0();
  }
  swift_bridgeObjectRetain();
  return sub_23E20();
}

uint64_t static Logger.byoLoggerWith(subsystem:category:)()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return sub_23E20();
}

uint64_t sub_C7D4()
{
  uint64_t v0 = sub_23E30();
  sub_82F8(v0, qword_32E50);
  sub_827C(v0, (uint64_t)qword_32E50);
  return sub_23E20();
}

uint64_t sub_C858@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_23C50();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_23D50();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  id v14 = (char *)v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v12);
  int v18 = (char *)v24 - v17;
  if (a2)
  {
    uint64_t v27 = v16;
    sub_CBC8(a1, a2, (uint64_t)v14);
    unsigned int v26 = enum case for URL.DirectoryHint.inferFromPath(_:);
    uint64_t v28 = a3;
    unint64_t v25 = *(void (**)(char *))(v7 + 104);
    v25(v9);
    v24[1] = sub_8700();
    sub_23D30();
    BOOL v19 = *(void (**)(char *, uint64_t))(v7 + 8);
    v19(v9, v6);
    uint64_t v20 = *(void (**)(char *, uint64_t))(v11 + 8);
    id v21 = v14;
    uint64_t v22 = v27;
    v20(v21, v27);
    ((void (*)(char *, void, uint64_t))v25)(v9, v26, v6);
    sub_23D30();
    v19(v9, v6);
    return ((uint64_t (*)(char *, uint64_t))v20)(v18, v22);
  }
  else
  {
    return static URL.applicationSupportDirectory.getter(v15);
  }
}

uint64_t sub_CB00()
{
  uint64_t v0 = sub_23E30();
  sub_82F8(v0, qword_325F0);
  uint64_t v1 = sub_827C(v0, (uint64_t)qword_325F0);
  if (qword_31FD8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_827C(v0, (uint64_t)qword_32E20);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t sub_CBC8@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_23D50();
  uint64_t v7 = *(void *)(v6 - 8);
  ((void (*)(void))__chkstk_darwin)();
  id v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_82B4(&qword_32608);
  uint64_t v10 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v12 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  id v14 = (char *)v21 - v13;
  if (a2)
  {
    id v15 = [self defaultManager];
    NSString v16 = sub_23EB0();
    id v17 = [v15 containerURLForSecurityApplicationGroupIdentifier:v16];

    if (v17)
    {
      sub_23CF0();

      int v18 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
      v18(v12, v9, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v12, 0, 1, v6);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v12, 1, v6) != 1) {
        return ((uint64_t (*)(uint64_t, char *, uint64_t))v18)(a3, v12, v6);
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v12, 1, 1, v6);
    }
    sub_CF68((uint64_t)v12);
    v21[0] = 0;
    v21[1] = 0xE000000000000000;
    sub_241C0(109);
    v22._countAndFlagsBits = 0xD00000000000006BLL;
    v22._object = (void *)0x8000000000025F90;
    sub_23F40(v22);
    v23._countAndFlagsBits = a1;
    v23._object = a2;
    sub_23F40(v23);
    goto LABEL_11;
  }
  uint64_t v20 = NSHomeDirectory();
  sub_23EE0();

  sub_23D20();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v14, 1, v6) == 1)
  {
    sub_CF68((uint64_t)v14);
LABEL_11:
    uint64_t result = sub_24230();
    __break(1u);
    return result;
  }
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v7 + 32))(a3, v14, v6);
}

uint64_t sub_CF68(uint64_t a1)
{
  uint64_t v2 = sub_82B4(&qword_32608);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_CFC8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v17 = a1;
  uint64_t v1 = sub_23C50();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_23D50();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  id v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v16 - v10;
  if (qword_31F90 != -1) {
    swift_once();
  }
  if (qword_32DE0)
  {
    sub_CBC8(qword_32DD8, (void *)qword_32DE0, (uint64_t)v9);
    uint64_t v12 = enum case for URL.DirectoryHint.inferFromPath(_:);
    uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 104);
    v13(v4, enum case for URL.DirectoryHint.inferFromPath(_:), v1);
    sub_8700();
    sub_23D30();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }
  else
  {
    sub_23CA0();
    uint64_t v12 = enum case for URL.DirectoryHint.inferFromPath(_:);
    uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 104);
  }
  v13(v4, v12, v1);
  sub_8700();
  uint64_t v14 = v17;
  sub_23D30();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v6 + 56))(v14, 0, 1, v5);
}

uint64_t sub_D2B0@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_23D50();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_82B4(&qword_32608);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = [self defaultManager];
  NSString v10 = sub_23EB0();
  id v11 = [v9 containerURLForSecurityApplicationGroupIdentifier:v10];

  if (v11)
  {
    sub_23CF0();

    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
    v12(v8, v5, v2);
    uint64_t v13 = *(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56);
    v13(v8, 0, 1, v2);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) != 1)
    {
      v12(a1, v8, v2);
      return ((uint64_t (*)(char *, void, uint64_t, uint64_t))v13)(a1, 0, 1, v2);
    }
  }
  else
  {
    uint64_t v13 = *(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56);
    v13(v8, 1, 1, v2);
  }
  sub_CF68((uint64_t)v8);
  if (qword_31FF0 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_23E30();
  sub_827C(v15, (uint64_t)qword_325F0);
  uint64_t v16 = sub_23E10();
  os_log_type_t v17 = sub_24010();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v20 = a1;
    int v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    *(_DWORD *)int v18 = 136315138;
    uint64_t v21 = sub_9EFC(0xD000000000000017, 0x8000000000025940, &v22);
    a1 = v20;
    sub_24170();
    _os_log_impl(&dword_0, v16, v17, "Shared file container:%s is nil, probably Journal app was deleted", v18, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v13)(a1, 1, 1, v2);
}

void *sub_D664(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_82B4(&qword_32618);
    uint64_t v3 = sub_241B0();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v31 = v1;
    uint64_t v32 = a1 + 32;
    while (1)
    {
      uint64_t v6 = *(void **)(v32 + 8 * v4);
      sub_23EE0();
      sub_242F0();
      id v7 = v6;
      sub_23F20();
      Swift::Int v8 = sub_24310();
      uint64_t result = (void *)swift_bridgeObjectRelease();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = v8 & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = sub_23EE0();
        uint64_t v17 = v16;
        if (v15 == sub_23EE0() && v17 == v18)
        {
LABEL_3:
          swift_bridgeObjectRelease_n();
LABEL_4:

          goto LABEL_5;
        }
        char v20 = sub_24290();
        swift_bridgeObjectRelease();
        uint64_t result = (void *)swift_bridgeObjectRelease();
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
          uint64_t v22 = sub_23EE0();
          uint64_t v24 = v23;
          if (v22 == sub_23EE0() && v24 == v25) {
            goto LABEL_3;
          }
          char v27 = sub_24290();
          swift_bridgeObjectRelease();
          uint64_t result = (void *)swift_bridgeObjectRelease();
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
        return (void *)v3;
      }
    }
  }
  return &_swiftEmptySetSingleton;
}

void sub_D894(uint64_t a1)
{
  uint64_t v3 = sub_23D50();
  uint64_t v39 = *(void *)(v3 - 8);
  uint64_t v40 = v3;
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  Swift::Int v8 = (char *)&v36 - v7;
  uint64_t v9 = sub_23C20();
  uint64_t v10 = *(void *)(v9 - 8);
  id v37 = (uint8_t *)v9;
  uint64_t v38 = v10;
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v36 - v14;
  char v42 = 1;
  id v16 = [self defaultManager];
  sub_23D10();
  NSString v17 = sub_23EB0();
  swift_bridgeObjectRelease();
  unsigned int v18 = [v16 fileExistsAtPath:v17 isDirectory:&v42];

  if (v18)
  {
    sub_82B4(&qword_32610);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_27570;
    *(void *)(inited + 32) = NSURLIsExcludedFromBackupKey;
    char v20 = NSURLIsExcludedFromBackupKey;
    sub_D664(inited);
    swift_setDeallocating();
    type metadata accessor for URLResourceKey(0);
    swift_arrayDestroy();
    sub_23C60();
    swift_bridgeObjectRelease();
    if (!v1)
    {
      char v21 = sub_23BF0();
      uint64_t v23 = v38 + 8;
      uint64_t v22 = *(void (**)(char *, uint8_t *))(v38 + 8);
      uint64_t v24 = v15;
      uint64_t v25 = v37;
      v22(v24, v37);
      if (v21 != 2 && (v21 & 1) == 0)
      {
        uint64_t v38 = v23;
        sub_23C10();
        sub_23C00();
        uint64_t v27 = v39;
        uint64_t v26 = v40;
        (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v8, a1, v40);
        sub_23CB0();
        (*(void (**)(char *, uint64_t))(v27 + 8))(v8, v26);
        v22(v13, v25);
      }
    }
  }
  else
  {
    uint64_t v38 = v1;
    if (qword_31FF0 != -1) {
      swift_once();
    }
    uint64_t v28 = sub_23E30();
    sub_827C(v28, (uint64_t)qword_325F0);
    uint64_t v30 = v39;
    uint64_t v29 = v40;
    (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v6, a1, v40);
    uint64_t v31 = sub_23E10();
    os_log_type_t v32 = sub_24030();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      uint64_t v43 = swift_slowAlloc();
      *(_DWORD *)uint64_t v33 = 136315138;
      id v37 = v33 + 4;
      sub_68E4();
      uint64_t v34 = sub_24280();
      uint64_t v41 = sub_9EFC(v34, v35, &v43);
      sub_24170();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v30 + 8))(v6, v29);
      _os_log_impl(&dword_0, v31, v32, "excludeFromBackupFully directory %s doesn't exists, ignoring.", v33, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v30 + 8))(v6, v29);
    }
  }
}

uint64_t sub_DDA0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_82B4(&qword_32608);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_CFC8((uint64_t)v4);
  uint64_t v5 = sub_23D50();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_CF68((uint64_t)v4);
    uint64_t v7 = 1;
  }
  else
  {
    sub_23CD0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    uint64_t v7 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(a1, v7, 1, v5);
}

BOOL static TranscriptionState.__derived_enum_equals(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void TranscriptionState.hash(into:)(uint64_t a1, char a2)
{
}

Swift::Int TranscriptionState.hashValue.getter(char a1)
{
  return sub_24310();
}

BOOL sub_DF74(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_DF8C()
{
  Swift::UInt v1 = *v0;
  sub_242F0();
  sub_24300(v1);
  return sub_24310();
}

void sub_DFD4()
{
  sub_24300(*v0);
}

Swift::Int sub_E000()
{
  Swift::UInt v1 = *v0;
  sub_242F0();
  sub_24300(v1);
  return sub_24310();
}

unint64_t sub_E048()
{
  unint64_t result = qword_32620[0];
  if (!qword_32620[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_32620);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for TranscriptionState(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TranscriptionState(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for TranscriptionState(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0xE208);
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

uint64_t sub_E230(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_E23C(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for TranscriptionState()
{
  return &type metadata for TranscriptionState;
}

uint64_t sub_E25C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_E2BC()
{
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_E2EC()
{
  sub_E2BC();
  return _swift_deallocClassInstance(v0, 48, 7);
}

uint64_t type metadata accessor for ImageCache()
{
  return sub_E338();
}

uint64_t sub_E338()
{
  return swift_getGenericMetadata();
}

uint64_t sub_E368()
{
  uint64_t v0 = sub_23E30();
  sub_82F8(v0, qword_326D8);
  uint64_t v1 = sub_827C(v0, (uint64_t)qword_326D8);
  if (qword_31FD0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_827C(v0, (uint64_t)qword_32E08);
  int v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t sub_E430(uint64_t a1)
{
  return sub_EBD0(a1, "%{public}s (getEntriesNotUploaded) started", &qword_32738);
}

void sub_E46C(void *a1@<X1>, unint64_t *a2@<X8>)
{
  id v5 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v6 = sub_23EB0();
  id v7 = [v5 initWithEntityName:v6];

  sub_82B4(&qword_32718);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_277A0;
  if (qword_32020 != -1) {
    swift_once();
  }
  uint64_t v9 = (void *)static NSPredicate.notUploadedToCloud;
  *(void *)(v8 + 32) = static NSPredicate.notUploadedToCloud;
  uint64_t v10 = qword_32040;
  id v11 = v9;
  if (v10 != -1) {
    swift_once();
  }
  uint64_t v12 = (void *)static NSPredicate.isNotTipEntry;
  *(void *)(v8 + 40) = static NSPredicate.isNotTipEntry;
  uint64_t v13 = qword_32010;
  id v14 = v12;
  if (v13 != -1) {
    swift_once();
  }
  uint64_t v15 = (void *)static NSPredicate.notRemovedFromCloud;
  *(void *)(v8 + 48) = static NSPredicate.notRemovedFromCloud;
  uint64_t v42 = v8;
  sub_23FB0();
  sub_8824(0, (unint64_t *)&qword_32720);
  id v16 = v15;
  Class isa = sub_23F90().super.isa;
  swift_bridgeObjectRelease();
  id v18 = [self andPredicateWithSubpredicates:isa];

  [v7 setPredicate:v18];
  type metadata accessor for JournalEntryMO();
  uint64_t v19 = sub_240D0();
  if (v2)
  {
    if (qword_31FF8 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_23E30();
    sub_827C(v20, (uint64_t)qword_326D8);
    id v21 = a1;
    swift_errorRetain();
    id v22 = v21;
    swift_errorRetain();
    uint64_t v23 = sub_23E10();
    os_log_type_t v24 = sub_24020();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = swift_slowAlloc();
      id v39 = v7;
      uint64_t v26 = (void *)swift_slowAlloc();
      uint64_t v42 = swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 136446466;
      sub_23E00();
      sub_14B20((unint64_t *)&qword_32488, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v27 = sub_24280();
      sub_9EFC(v27, v28, &v42);
      sub_24170();

      swift_bridgeObjectRelease();
      *(_WORD *)(v25 + 12) = 2112;
      swift_errorRetain();
      uint64_t v41 = _swift_stdlib_bridgeErrorToNSError();
      sub_24170();
      *uint64_t v26 = v41;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl(&dword_0, v23, v24, "%{public}s (getEntriesNotUploaded) Unable to get un-uploaded entries: %@", (uint8_t *)v25, 0x16u);
      sub_82B4(&qword_32530);
      swift_arrayDestroy();
      id v7 = v39;
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_errorRelease();
      swift_errorRelease();
    }

    swift_willThrow();
  }
  else
  {
    unint64_t v29 = v19;
    uint64_t v40 = v7;
    if (qword_31FF8 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_23E30();
    sub_827C(v30, (uint64_t)qword_326D8);
    id v31 = a1;
    swift_bridgeObjectRetain_n();
    id v32 = v31;
    uint64_t v33 = sub_23E10();
    os_log_type_t v34 = sub_24030();
    if (os_log_type_enabled(v33, v34))
    {
      unint64_t v35 = a2;
      uint64_t v36 = swift_slowAlloc();
      uint64_t v42 = swift_slowAlloc();
      *(_DWORD *)uint64_t v36 = 136446466;
      sub_23E00();
      sub_14B20((unint64_t *)&qword_32488, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v37 = sub_24280();
      sub_9EFC(v37, v38, &v42);
      sub_24170();

      swift_bridgeObjectRelease();
      *(_WORD *)(v36 + 12) = 2048;
      if (v29 >> 62)
      {
        swift_bridgeObjectRetain();
        sub_24240();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      sub_24170();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v33, v34, "%{public}s (getEntriesNotUploaded) fetched un-uploaded entries:%ld", (uint8_t *)v36, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      *unint64_t v35 = v29;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      *a2 = v29;
    }
  }
}

uint64_t sub_EB94(uint64_t a1)
{
  return sub_EBD0(a1, "%{public}s (getUnuploadedAssets) started", &qword_32730);
}

uint64_t sub_EBD0(uint64_t a1, const char *a2, uint64_t *a3)
{
  uint64_t v7 = v4;
  if (qword_31FF8 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_23E30();
  sub_827C(v8, (uint64_t)qword_326D8);
  id v9 = v3;
  uint64_t v10 = sub_23E10();
  os_log_type_t v11 = sub_24030();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136446210;
    uint64_t v18 = v17;
    sub_23E00();
    sub_14B20((unint64_t *)&qword_32488, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v7 = v4;
    uint64_t v13 = sub_24280();
    sub_9EFC(v13, v14, &v18);
    sub_24170();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v10, v11, a2, v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  __chkstk_darwin(v15);
  sub_82B4(a3);
  uint64_t result = sub_240B0();
  if (!v7) {
    return v18;
  }
  return result;
}

uint64_t sub_EE64(uint64_t a1)
{
  return sub_EBD0(a1, "%{public}s (getUnuploadedAttachments) started", &qword_32728);
}

void sub_EEA0(void *a1@<X1>, void (*a2)(void)@<X4>, const char *a3@<X5>, const char *a4@<X6>, char *a5@<X8>)
{
  id v9 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v10 = sub_23EB0();
  id v11 = [v9 initWithEntityName:v10];

  sub_82B4(&qword_32718);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_277B0;
  if (qword_32020 != -1) {
    swift_once();
  }
  uint64_t v13 = (void *)static NSPredicate.notUploadedToCloud;
  *(void *)(v12 + 32) = static NSPredicate.notUploadedToCloud;
  uint64_t v14 = qword_32010;
  id v15 = v13;
  if (v14 != -1) {
    swift_once();
  }
  id v16 = (void *)static NSPredicate.notRemovedFromCloud;
  *(void *)(v12 + 40) = static NSPredicate.notRemovedFromCloud;
  uint64_t v44 = v12;
  sub_23FB0();
  sub_8824(0, (unint64_t *)&qword_32720);
  id v17 = v16;
  Class isa = sub_23F90().super.isa;
  swift_bridgeObjectRelease();
  id v19 = [self andPredicateWithSubpredicates:isa];

  [v11 setPredicate:v19];
  a2(0);
  uint64_t v20 = sub_240D0();
  if (v5)
  {
    if (qword_31FF8 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_23E30();
    sub_827C(v21, (uint64_t)qword_326D8);
    id v22 = a1;
    swift_errorRetain();
    id v23 = v22;
    swift_errorRetain();
    os_log_type_t v24 = sub_23E10();
    os_log_type_t v25 = sub_24020();
    if (os_log_type_enabled(v24, v25))
    {
      id v40 = v11;
      uint64_t v26 = swift_slowAlloc();
      uint64_t v27 = (void *)swift_slowAlloc();
      uint64_t v44 = swift_slowAlloc();
      *(_DWORD *)uint64_t v26 = 136446466;
      sub_23E00();
      sub_14B20((unint64_t *)&qword_32488, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v28 = sub_24280();
      sub_9EFC(v28, v29, &v44);
      sub_24170();

      swift_bridgeObjectRelease();
      *(_WORD *)(v26 + 12) = 2112;
      swift_errorRetain();
      uint64_t v43 = _swift_stdlib_bridgeErrorToNSError();
      sub_24170();
      *uint64_t v27 = v43;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl(&dword_0, v24, v25, a4, (uint8_t *)v26, 0x16u);
      sub_82B4(&qword_32530);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      id v11 = v40;
      swift_slowDealloc();
    }
    else
    {

      swift_errorRelease();
      swift_errorRelease();
    }

    swift_willThrow();
  }
  else
  {
    unint64_t v30 = v20;
    formata = a5;
    if (qword_31FF8 != -1) {
      swift_once();
    }
    uint64_t v31 = sub_23E30();
    sub_827C(v31, (uint64_t)qword_326D8);
    id v32 = a1;
    swift_bridgeObjectRetain_n();
    id v33 = v32;
    os_log_type_t v34 = sub_23E10();
    os_log_type_t v35 = sub_24030();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = swift_slowAlloc();
      uint64_t v44 = swift_slowAlloc();
      *(_DWORD *)uint64_t v36 = 136446466;
      sub_23E00();
      sub_14B20((unint64_t *)&qword_32488, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v37 = sub_24280();
      sub_9EFC(v37, v38, &v44);
      sub_24170();

      swift_bridgeObjectRelease();
      *(_WORD *)(v36 + 12) = 2048;
      if (v30 >> 62)
      {
        swift_bridgeObjectRetain();
        sub_24240();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      sub_24170();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v34, v35, a3, (uint8_t *)v36, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    *(void *)formata = v30;
  }
}

unint64_t sub_F574(uint64_t a1)
{
  uint64_t v4 = sub_82B4(&qword_326F0);
  __chkstk_darwin(v4 - 8);
  NSString v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_23E00();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v37 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v34 - v11;
  unint64_t v45 = (unint64_t)&_swiftEmptyArrayStorage;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0) {
      uint64_t v2 = a1;
    }
    else {
      uint64_t v2 = (a1 & 0xFFFFFFFFFFFFFF8);
    }
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_24240();
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v13 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    if (v13)
    {
LABEL_3:
      if (v13 >= 1)
      {
        uint64_t v39 = v13;
        id v40 = v12;
        os_log_type_t v35 = v1;
        uint64_t v36 = a1;
        uint64_t v14 = 0;
        id v15 = (void (**)(char *, char *, uint64_t))(v8 + 32);
        id v16 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
        uint64_t v41 = (unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
        unint64_t v42 = a1 & 0xC000000000000001;
        unint64_t v38 = (void (**)(char *, uint64_t))(v8 + 8);
        id v17 = v37;
        while (1)
        {
          if (v42) {
            id v18 = (id)sub_241F0();
          }
          else {
            id v18 = *(id *)(a1 + 8 * v14 + 32);
          }
          id v19 = v18;
          id v20 = [v18 id];
          if (v20)
          {
            uint64_t v21 = v20;
            sub_23DE0();

            id v22 = *v15;
            (*v15)(v6, v17, v7);
            (*v16)(v6, 0, 1, v7);
            if ((*v41)(v6, 1, v7) != 1)
            {
              uint64_t v23 = (uint64_t)v40;
              v22(v40, v6, v7);
              id v24 = sub_10A48(v23, v19);
              if (v24)
              {
                id v25 = v24;
                sub_23F80();
                if (*(void *)((char *)&dword_10 + (v45 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                               + (v45 & 0xFFFFFFFFFFFFFF8)) >> 1)
                  sub_23FC0();
                sub_23FD0();
                sub_23FB0();

                (*v38)(v40, v7);
                a1 = v36;
                id v17 = v37;
                uint64_t v13 = v39;
              }
              else
              {
                (*v38)((char *)v23, v7);

                uint64_t v13 = v39;
              }
              goto LABEL_7;
            }
          }
          else
          {
            (*v16)(v6, 1, 1, v7);
          }

          sub_14B68((uint64_t)v6, &qword_326F0);
LABEL_7:
          if (v13 == ++v14)
          {
            swift_bridgeObjectRelease();
            uint64_t v1 = v35;
            goto LABEL_24;
          }
        }
      }
      __break(1u);
LABEL_33:
      swift_bridgeObjectRetain();
      uint64_t v32 = sub_24240();
      swift_bridgeObjectRelease();
      goto LABEL_29;
    }
  }
  swift_bridgeObjectRelease();
LABEL_24:
  if (qword_31FF8 != -1) {
    swift_once();
  }
  uint64_t v26 = sub_23E30();
  sub_827C(v26, (uint64_t)qword_326D8);
  unint64_t v27 = v45;
  id v28 = v1;
  swift_bridgeObjectRetain_n();
  id v29 = v28;
  uint64_t v2 = sub_23E10();
  LOBYTE(v13) = sub_24030();
  if (!os_log_type_enabled(v2, (os_log_type_t)v13))
  {

    swift_bridgeObjectRelease_n();
    goto LABEL_31;
  }
  NSString v6 = (char *)swift_slowAlloc();
  v44[0] = swift_slowAlloc();
  *(_DWORD *)NSString v6 = 136446466;
  sub_14B20((unint64_t *)&qword_32488, (void (*)(uint64_t))&type metadata accessor for UUID);
  uint64_t v30 = sub_24280();
  uint64_t v43 = sub_9EFC(v30, v31, v44);
  sub_24170();

  swift_bridgeObjectRelease();
  *((_WORD *)v6 + 6) = 2048;
  if (v27 >> 62) {
    goto LABEL_33;
  }
  uint64_t v32 = *(void *)((char *)&dword_10 + (v27 & 0xFFFFFFFFFFFFFF8));
LABEL_29:
  swift_bridgeObjectRelease();
  uint64_t v43 = v32;
  sub_24170();
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_0, v2, (os_log_type_t)v13, "%{public}s (getRecordsFromJournalEntries) will upload entry records:%ld", (uint8_t *)v6, 0x16u);
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();

LABEL_31:
  swift_beginAccess();
  return v45;
}

unint64_t sub_FB50(unint64_t a1)
{
  return sub_FBA0(a1, (SEL *)&selRef_entry, (uint64_t (*)(char *, char *, void *))sub_12438, "%{public}s (getRecordsFromJournalEntryAssets) will upload asset records:%ld");
}

unint64_t sub_FB78(unint64_t a1)
{
  return sub_FBA0(a1, (SEL *)&selRef_asset, (uint64_t (*)(char *, char *, void *))sub_13BE8, "%{public}s (getRecordsFromJournalEntryAssetFileAttachments) will upload attachments records:%ld");
}

unint64_t sub_FBA0(unint64_t a1, SEL *a2, uint64_t (*a3)(char *, char *, void *), const char *a4)
{
  uint64_t v55 = a3;
  uint64_t v61 = a2;
  uint64_t v8 = sub_82B4(&qword_326F0);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  int v58 = (char *)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v52 - v11;
  uint64_t v67 = sub_23E00();
  uint64_t v13 = *(void *)(v67 - 8);
  uint64_t v14 = __chkstk_darwin(v67);
  v56 = (char *)&v52 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v14);
  v64 = (char *)&v52 - v17;
  __chkstk_darwin(v16);
  unint64_t v70 = (unint64_t)&_swiftEmptyArrayStorage;
  uint64_t v62 = (char *)&v52 - v18;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_24240();
    if (v19) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v19 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    if (v19)
    {
LABEL_3:
      if (v19 >= 1)
      {
        v53 = a4;
        uint64_t v20 = 0;
        unint64_t v21 = a1 & 0xC000000000000001;
        v65 = (void (**)(char *, char *, uint64_t))(v13 + 32);
        int v66 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
        unint64_t v63 = (unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
        uint64_t v59 = (void (**)(char *, uint64_t))(v13 + 8);
        unint64_t v60 = a1;
        unint64_t v57 = a1 & 0xC000000000000001;
        while (1)
        {
          id v22 = v21 ? (id)sub_241F0() : *(id *)(a1 + 8 * v20 + 32);
          uint64_t v23 = v22;
          uint64_t v24 = v19;
          id v25 = [v22 id];
          if (!v25) {
            break;
          }
          uint64_t v26 = v25;
          unint64_t v27 = v64;
          sub_23DE0();

          id v28 = *v65;
          uint64_t v29 = v67;
          (*v65)(v12, v27, v67);
          uint64_t v30 = *v66;
          (*v66)(v12, 0, 1, v29);
          unint64_t v31 = *v63;
          if ((*v63)(v12, 1, v29) == 1) {
            goto LABEL_6;
          }
          v28(v62, v12, v29);
          id v32 = [v23 *v61];
          if (!v32)
          {
            (*v59)(v62, v29);

            a1 = v60;
            goto LABEL_7;
          }
          id v33 = v32;
          id v34 = [v32 id];
          if (v34)
          {
            os_log_type_t v35 = v34;
            uint64_t v36 = v64;
            sub_23DE0();

            uint64_t v37 = (uint64_t)v58;
            unint64_t v38 = v36;
            uint64_t v39 = v67;
            v28(v58, v38, v67);
            v30((char *)v37, 0, 1, v39);
            if (v31((char *)v37, 1, v39) != 1)
            {
              id v40 = v56;
              v28(v56, (char *)v37, v39);
              uint64_t v41 = (void *)v55(v62, v40, v23);
              uint64_t v19 = v24;
              if (v41)
              {
                id v42 = v41;
                sub_23F80();
                if (*(void *)((char *)&dword_10 + (v70 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                               + (v70 & 0xFFFFFFFFFFFFFF8)) >> 1)
                  sub_23FC0();
                sub_23FD0();
                sub_23FB0();

                uint64_t v39 = v67;
              }

              uint64_t v43 = *v59;
              (*v59)(v56, v39);
              v43(v62, v39);
              a1 = v60;
              unint64_t v21 = v57;
              goto LABEL_8;
            }
          }
          else
          {
            uint64_t v37 = (uint64_t)v58;
            uint64_t v39 = v67;
            v30(v58, 1, 1, v67);
          }

          (*v59)(v62, v39);
          sub_14B68(v37, &qword_326F0);
          a1 = v60;
          uint64_t v19 = v24;
          unint64_t v21 = v57;
LABEL_8:
          if (v19 == ++v20)
          {
            swift_bridgeObjectRelease();
            a4 = v53;
            goto LABEL_28;
          }
        }
        (*v66)(v12, 1, 1, v67);
LABEL_6:

        sub_14B68((uint64_t)v12, &qword_326F0);
LABEL_7:
        uint64_t v19 = v24;
        goto LABEL_8;
      }
      __break(1u);
LABEL_37:
      swift_bridgeObjectRetain();
      uint64_t v50 = sub_24240();
      swift_bridgeObjectRelease();
      goto LABEL_33;
    }
  }
  swift_bridgeObjectRelease();
LABEL_28:
  if (qword_31FF8 != -1) {
    swift_once();
  }
  uint64_t v44 = sub_23E30();
  sub_827C(v44, (uint64_t)qword_326D8);
  unint64_t v45 = v70;
  id v46 = v54;
  swift_bridgeObjectRetain_n();
  id v47 = v46;
  uint64_t v4 = sub_23E10();
  os_log_type_t v5 = sub_24030();
  if (!os_log_type_enabled(v4, v5))
  {

    swift_bridgeObjectRelease_n();
    goto LABEL_35;
  }
  uint64_t v19 = swift_slowAlloc();
  v69[0] = swift_slowAlloc();
  *(_DWORD *)uint64_t v19 = 136446466;
  sub_14B20((unint64_t *)&qword_32488, (void (*)(uint64_t))&type metadata accessor for UUID);
  uint64_t v48 = sub_24280();
  uint64_t v68 = sub_9EFC(v48, v49, v69);
  sub_24170();

  swift_bridgeObjectRelease();
  *(_WORD *)(v19 + 12) = 2048;
  if (v45 >> 62) {
    goto LABEL_37;
  }
  uint64_t v50 = *(void *)((char *)&dword_10 + (v45 & 0xFFFFFFFFFFFFFF8));
LABEL_33:
  swift_bridgeObjectRelease();
  uint64_t v68 = v50;
  sub_24170();
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_0, v4, v5, a4, (uint8_t *)v19, 0x16u);
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();

LABEL_35:
  swift_beginAccess();
  return v70;
}

uint64_t sub_1034C(uint64_t a1)
{
  return sub_103DC(a1, 0x456C616E72756F4ALL, 0xEE004F4D7972746ELL, (void (*)(void))type metadata accessor for JournalEntryMO);
}

uint64_t sub_10398(uint64_t a1)
{
  return sub_103DC(a1, 0xD000000000000013, 0x8000000000026180, (void (*)(void))type metadata accessor for JournalEntryAssetMO);
}

uint64_t sub_103DC(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  uint64_t v49 = sub_23E00();
  unint64_t v45 = *(void (***)(char *, uint64_t))(v49 - 8);
  __chkstk_darwin(v49);
  uint64_t v48 = (char *)v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_82B4(&qword_326F0);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v10 = (char *)v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)v43 - v11;
  id v13 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v14 = sub_23EB0();
  id v15 = [v13 initWithEntityName:v14];

  sub_82B4(&qword_32718);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_277C0;
  if (qword_32018 != -1) {
    swift_once();
  }
  uint64_t v17 = (void *)static NSPredicate.removedFromCloud;
  *(void *)(v16 + 32) = static NSPredicate.removedFromCloud;
  uint64_t v54 = v16;
  sub_23FB0();
  sub_8824(0, (unint64_t *)&qword_32720);
  id v18 = v17;
  Class isa = sub_23F90().super.isa;
  swift_bridgeObjectRelease();
  id v20 = [self andPredicateWithSubpredicates:isa];

  [v15 setPredicate:v20];
  a4(0);
  unint64_t v21 = sub_240D0();
  if (v4)
  {

    return (uint64_t)v17;
  }
  uint64_t v54 = (uint64_t)&_swiftEmptyArrayStorage;
  unint64_t v47 = v21;
  if (v21 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_24240();
    uint64_t v22 = result;
  }
  else
  {
    uint64_t v22 = *(void *)((char *)&dword_10 + (v21 & 0xFFFFFFFFFFFFFF8));
    uint64_t result = swift_bridgeObjectRetain();
  }
  uint64_t v24 = v49;
  id v44 = v15;
  if (!v22)
  {
    swift_bridgeObjectRelease();
    uint64_t v17 = &_swiftEmptyArrayStorage;
LABEL_26:
    swift_bridgeObjectRelease();

    return (uint64_t)v17;
  }
  if (v22 >= 1)
  {
    v43[1] = 0;
    uint64_t v25 = 0;
    unint64_t v26 = v47;
    unint64_t v52 = v47 & 0xC000000000000001;
    v53 = v10;
    uint64_t v50 = (unsigned int (**)(char *, uint64_t, uint64_t))(v45 + 6);
    uint64_t v51 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v45 + 7);
    unint64_t v27 = (void (**)(char *, char *, uint64_t))(v45 + 2);
    ++v45;
    id v46 = v27;
    do
    {
      uint64_t v28 = v22;
      if (v52) {
        id v29 = (id)sub_241F0();
      }
      else {
        id v29 = *(id *)(v26 + 8 * v25 + 32);
      }
      uint64_t v30 = v29;
      id v31 = [v29 id];
      if (v31)
      {
        id v32 = v31;
        uint64_t v33 = (uint64_t)v53;
        sub_23DE0();

        uint64_t v34 = 0;
      }
      else
      {
        uint64_t v34 = 1;
        uint64_t v33 = (uint64_t)v53;
      }
      (*v51)(v33, v34, 1, v24);
      sub_14BC4(v33, (uint64_t)v12, &qword_326F0);
      if ((*v50)(v12, 1, v24))
      {
        sub_14B68((uint64_t)v12, &qword_326F0);
      }
      else
      {
        os_log_type_t v35 = v48;
        (*v46)(v48, v12, v24);
        sub_14B68((uint64_t)v12, &qword_326F0);
        uint64_t v36 = sub_23DD0();
        uint64_t v37 = v24;
        uint64_t v38 = v36;
        id v40 = v39;
        (*v45)(v35, v37);
        sub_8824(0, &qword_326F8);
        uint64_t v41 = qword_31FA8;
        swift_bridgeObjectRetain();
        if (v41 != -1) {
          swift_once();
        }
        v42.super.Class isa = (Class)[(id)qword_32DF8 zoneID];
        v55._countAndFlagsBits = v38;
        v55._object = v40;
        sub_23FE0(v55, v42);

        swift_bridgeObjectRelease();
        sub_23F80();
        if (*(void *)((char *)&dword_10 + (v54 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                       + (v54 & 0xFFFFFFFFFFFFFF8)) >> 1)
          sub_23FC0();
        sub_23FD0();
        sub_23FB0();
        uint64_t v24 = v49;
        unint64_t v26 = v47;
      }
      ++v25;
      uint64_t v22 = v28;
    }
    while (v28 != v25);
    swift_bridgeObjectRelease();
    uint64_t v17 = (void *)v54;
    goto LABEL_26;
  }
  __break(1u);
  return result;
}

uint64_t sub_10968(uint64_t a1)
{
  return sub_103DC(a1, 0xD000000000000021, 0x8000000000026150, (void (*)(void))type metadata accessor for JournalEntryAssetFileAttachmentMO);
}

uint64_t sub_109AC(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v4 = a3;
    uint64_t v5 = a2;
    uint64_t v6 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0) {
      uint64_t v6 = a2;
    }
    uint64_t v7 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
      uint64_t v7 = 11;
    }
    uint64_t v8 = v7 | (v6 << 16);
    uint64_t v9 = sub_23F30();
    if (v10) {
      a2 = v8;
    }
    else {
      a2 = v9;
    }
    a1 = 15;
    a3 = v5;
    a4 = v4;
  }
  return String.subscript.getter(a1, a2, a3, a4);
}

id sub_10A48(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_82B4(&qword_326F0);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v206 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v219 = (uint64_t)&v206 - v8;
  uint64_t v9 = sub_82B4(&qword_32710);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  uint64_t v12 = (char *)&v206 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v10);
  v221 = (char *)&v206 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  v216 = (char *)&v206 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v217 = (uint64_t)&v206 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  v214 = (char *)&v206 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v215 = (uint64_t)&v206 - v22;
  uint64_t v23 = __chkstk_darwin(v21);
  v226 = (void (**)(uint64_t *, uint64_t, uint64_t))((char *)&v206 - v24);
  uint64_t v25 = __chkstk_darwin(v23);
  v228 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&v206 - v26);
  uint64_t v27 = __chkstk_darwin(v25);
  v213 = (char *)&v206 - v28;
  __chkstk_darwin(v27);
  v227 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&v206 - v29);
  uint64_t v30 = sub_23E00();
  uint64_t v31 = *(void *)(v30 - 8);
  uint64_t v32 = __chkstk_darwin(v30);
  v211 = (char *)&v206 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v32);
  os_log_type_t v35 = (char *)&v206 - v34;
  id v36 = [a2 recordSystemFields];
  v220 = v12;
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = sub_23D70();
    unint64_t v40 = v39;
  }
  else
  {
    uint64_t v38 = 0;
    unint64_t v40 = 0xF000000000000000;
  }
  uint64_t v41 = *(void (**)(char *, uint64_t, uint64_t))(v31 + 16);
  uint64_t v210 = v31 + 16;
  v209 = v41;
  v41(v35, a1, v30);
  v218 = v7;
  uint64_t v224 = v31;
  uint64_t v225 = v30;
  if (v40 >> 60 == 15)
  {
    uint64_t v42 = sub_23DD0();
    id v44 = v43;
    if (qword_31FA8 != -1) {
      swift_once();
    }
    id v45 = [(id)qword_32DF8 zoneID];
    sub_8824(0, &qword_326F8);
    swift_bridgeObjectRetain();
    id v46 = (objc_class *)v45;
    v234._countAndFlagsBits = v42;
    v234._object = v44;
    v47.super.Class isa = v46;
    Class isa = sub_23FE0(v234, v47).super.isa;
    sub_8824(0, &qword_32700);
    uint64_t v49 = isa;
    v235._countAndFlagsBits = 0x456C616E72756F4ALL;
    v235._object = (void *)0xEC0000007972746ELL;
    v50.super.Class isa = v49;
    Class v51 = sub_24110(v235, v50).super.isa;
    id v52 = [objc_allocWithZone((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
    [(objc_class *)v51 encodeSystemFieldsWithCoder:v52];
    id v53 = [v52 encodedData];
    uint64_t v38 = sub_23D70();
    unint64_t v40 = v54;
    swift_bridgeObjectRelease();

    uint64_t v31 = v224;
    uint64_t v30 = v225;
  }
  Swift::String v55 = *(void (**)(char *, uint64_t))(v31 + 8);
  v55(v35, v30);
  id v56 = sub_841C(v38, v40);
  id v229 = v56;
  if (v56)
  {
    unint64_t v57 = v56;
    v207 = v55;
    uint64_t v208 = v31 + 8;
    if (qword_31FF8 != -1) {
      swift_once();
    }
    uint64_t v58 = sub_23E30();
    uint64_t v59 = sub_827C(v58, (uint64_t)qword_326D8);
    unint64_t v60 = a2;
    uint64_t v212 = v59;
    uint64_t v61 = sub_23E10();
    os_log_type_t v62 = sub_24030();
    BOOL v63 = os_log_type_enabled(v61, v62);
    unint64_t v223 = v40;
    if (v63)
    {
      v64 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v64 = 33554688;
      LOWORD(v230) = (unsigned __int16)[v60 textLength];
      sub_24170();

      _os_log_impl(&dword_0, v61, v62, "(getRecordFromJournalEntry) (jEntry.textLength) == %hd", v64, 6u);
      swift_slowDealloc();
    }
    else
    {

      uint64_t v61 = v60;
    }

    id v75 = [v57 encryptedValues];
    id v76 = [v60 title];
    if (v76)
    {
      uint64_t v77 = v76;
      uint64_t v78 = sub_23D70();
      uint64_t v80 = v79;

      *((void *)&v231 + 1) = &type metadata for Data;
      v232 = &protocol witness table for Data;
      *(void *)&long long v230 = v78;
      *((void *)&v230 + 1) = v80;
    }
    else
    {
      v232 = 0;
      long long v230 = 0u;
      long long v231 = 0u;
    }
    swift_getObjectType();
    sub_240E0();
    swift_unknownObjectRelease();
    id v81 = [v57 encryptedValues];
    id v82 = [v60 text];
    if (v82)
    {
      v83 = v82;
      uint64_t v84 = sub_23D70();
      uint64_t v86 = v85;

      *((void *)&v231 + 1) = &type metadata for Data;
      v232 = &protocol witness table for Data;
      *(void *)&long long v230 = v84;
      *((void *)&v230 + 1) = v86;
    }
    else
    {
      v232 = 0;
      long long v230 = 0u;
      long long v231 = 0u;
    }
    swift_getObjectType();
    sub_240E0();
    swift_unknownObjectRelease();
    id v87 = [v57 encryptedValues];
    id v88 = [v60 assetOrdering];
    if (v88)
    {
      v89 = v88;
      uint64_t v90 = sub_23D70();
      uint64_t v92 = v91;

      *((void *)&v231 + 1) = &type metadata for Data;
      v232 = &protocol witness table for Data;
      *(void *)&long long v230 = v90;
      *((void *)&v230 + 1) = v92;
    }
    else
    {
      v232 = 0;
      long long v230 = 0u;
      long long v231 = 0u;
    }
    uint64_t v93 = (uint64_t)v227;
    uint64_t v94 = (uint64_t)v228;
    swift_getObjectType();
    sub_240E0();
    swift_unknownObjectRelease();
    id v95 = [v57 encryptedValues];
    id v96 = [v60 updatedDate];
    uint64_t v222 = v38;
    if (v96)
    {
      v97 = v96;
      uint64_t v98 = (uint64_t)v213;
      sub_23DA0();

      uint64_t v99 = sub_23DC0();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v99 - 8) + 56))(v98, 0, 1, v99);
    }
    else
    {
      uint64_t v99 = sub_23DC0();
      uint64_t v98 = (uint64_t)v213;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v99 - 8) + 56))(v213, 1, 1, v99);
    }
    sub_14BC4(v98, v93, &qword_32710);
    sub_23DC0();
    v100 = *(char **)(v99 - 8);
    v228 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))*((void *)v100 + 6);
    int v101 = v228(v93, 1, v99);
    uint64_t v102 = (uint64_t)v214;
    if (v101 == 1)
    {
      sub_14B68(v93, &qword_32710);
      long long v230 = 0u;
      long long v231 = 0u;
      v232 = 0;
    }
    else
    {
      *((void *)&v231 + 1) = v99;
      v232 = &protocol witness table for Date;
      v103 = sub_14C28((uint64_t *)&v230);
      (*((void (**)(uint64_t *, uint64_t, uint64_t))v100 + 4))(v103, v93, v99);
    }
    swift_getObjectType();
    sub_240E0();
    swift_unknownObjectRelease();
    id v104 = [v57 encryptedValues];
    id v105 = [v60 createdDate];
    if (v105)
    {
      v106 = v105;
      uint64_t v107 = (uint64_t)v226;
      sub_23DA0();

      v108 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))*((void *)v100 + 7);
      v109 = (void (**)(uint64_t *, uint64_t, uint64_t))v107;
      uint64_t v110 = 0;
    }
    else
    {
      v108 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))*((void *)v100 + 7);
      uint64_t v107 = (uint64_t)v226;
      v109 = v226;
      uint64_t v110 = 1;
    }
    v227 = v108;
    v108((uint64_t)v109, v110, 1, v99);
    sub_14BC4(v107, v94, &qword_32710);
    int v111 = v228(v94, 1, v99);
    v112 = v229;
    v226 = (void (**)(uint64_t *, uint64_t, uint64_t))v100;
    if (v111 == 1)
    {
      sub_14B68(v94, &qword_32710);
      long long v230 = 0u;
      long long v231 = 0u;
      v232 = 0;
    }
    else
    {
      *((void *)&v231 + 1) = v99;
      v232 = &protocol witness table for Date;
      v113 = sub_14C28((uint64_t *)&v230);
      (*((void (**)(uint64_t *, uint64_t, uint64_t))v100 + 4))(v113, v94, v99);
    }
    swift_getObjectType();
    sub_240E0();
    swift_unknownObjectRelease();
    id v114 = [v112 encryptedValues];
    id v115 = [v60 entryDate];
    if (v115)
    {
      v116 = v115;
      sub_23DA0();

      uint64_t v117 = 0;
    }
    else
    {
      uint64_t v117 = 1;
    }
    v118 = v226;
    uint64_t v119 = (uint64_t)(v226 + 7);
    v227(v102, v117, 1, v99);
    uint64_t v120 = v215;
    sub_14BC4(v102, v215, &qword_32710);
    if (v228(v120, 1, v99) == 1)
    {
      sub_14B68(v120, &qword_32710);
      long long v230 = 0u;
      long long v231 = 0u;
      v232 = 0;
    }
    else
    {
      *((void *)&v231 + 1) = v99;
      v232 = &protocol witness table for Date;
      v121 = sub_14C28((uint64_t *)&v230);
      v118[4](v121, v120, v99);
    }
    uint64_t v122 = (uint64_t)v216;
    swift_getObjectType();
    sub_240E0();
    swift_unknownObjectRelease();
    id v123 = [v112 encryptedValues];
    id v124 = [v60 bundleEndDate];
    if (v124)
    {
      v125 = v124;
      sub_23DA0();

      uint64_t v126 = 0;
    }
    else
    {
      uint64_t v126 = 1;
    }
    v227(v122, v126, 1, v99);
    uint64_t v127 = v217;
    sub_14BC4(v122, v217, &qword_32710);
    if (v228(v127, 1, v99) == 1)
    {
      sub_14B68(v127, &qword_32710);
      long long v230 = 0u;
      long long v231 = 0u;
      v232 = 0;
    }
    else
    {
      *((void *)&v231 + 1) = v99;
      v232 = &protocol witness table for Date;
      v128 = sub_14C28((uint64_t *)&v230);
      v226[4](v128, v127, v99);
    }
    uint64_t v217 = v119;
    swift_getObjectType();
    sub_240E0();
    swift_unknownObjectRelease();
    id v129 = [v112 encryptedValues];
    id v130 = [v60 dateSource];
    if (v130)
    {
      v131 = v130;
      uint64_t v132 = sub_23EE0();
      uint64_t v134 = v133;

      *((void *)&v231 + 1) = &type metadata for String;
      v232 = &protocol witness table for String;
      *(void *)&long long v230 = v132;
      *((void *)&v230 + 1) = v134;
      v112 = v229;
    }
    else
    {
      v232 = 0;
      long long v230 = 0u;
      long long v231 = 0u;
    }
    swift_getObjectType();
    sub_240E0();
    swift_unknownObjectRelease();
    id v135 = [v112 encryptedValues];
    swift_getObjectType();
    unsigned __int16 v136 = (unsigned __int16)[v60 minimumSupportedAppVersion];
    *((void *)&v231 + 1) = &type metadata for Int16;
    v232 = &protocol witness table for Int16;
    LOWORD(v230) = v136;
    sub_240E0();
    swift_unknownObjectRelease();
    id v137 = [v112 encryptedValues];
    id v138 = [v60 prompt];
    if (v138)
    {
      v139 = v138;
      uint64_t v140 = sub_23D70();
      uint64_t v142 = v141;

      *((void *)&v231 + 1) = &type metadata for Data;
      v232 = &protocol witness table for Data;
      *(void *)&long long v230 = v140;
      *((void *)&v230 + 1) = v142;
      v112 = v229;
    }
    else
    {
      v232 = 0;
      long long v230 = 0u;
      long long v231 = 0u;
    }
    uint64_t v143 = (uint64_t)v221;
    swift_getObjectType();
    sub_240E0();
    swift_unknownObjectRelease();
    id v144 = [v112 encryptedValues];
    swift_getObjectType();
    unsigned __int8 v145 = [v60 flagged];
    *((void *)&v231 + 1) = &type metadata for Bool;
    v232 = &protocol witness table for Bool;
    LOBYTE(v230) = v145;
    sub_240E0();
    swift_unknownObjectRelease();
    [v112 encryptedValues];
    id v146 = [v60 bundleId];
    if (v146)
    {
      v147 = v146;
      uint64_t v148 = (uint64_t)v218;
      sub_23DE0();

      uint64_t v149 = 0;
    }
    else
    {
      uint64_t v149 = 1;
      uint64_t v148 = (uint64_t)v218;
    }
    uint64_t v150 = v224;
    uint64_t v151 = v225;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v224 + 56))(v148, v149, 1, v225);
    uint64_t v152 = v219;
    sub_14BC4(v148, v219, &qword_326F0);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v150 + 48))(v152, 1, v151))
    {
      sub_14B68(v152, &qword_326F0);
      long long v230 = 0u;
      long long v231 = 0u;
      v232 = 0;
    }
    else
    {
      v153 = v211;
      v209(v211, v152, v151);
      sub_14B68(v152, &qword_326F0);
      uint64_t v154 = sub_23DD0();
      uint64_t v156 = v155;
      v207(v153, v151);
      *((void *)&v231 + 1) = &type metadata for String;
      v232 = &protocol witness table for String;
      *(void *)&long long v230 = v154;
      *((void *)&v230 + 1) = v156;
      v112 = v229;
    }
    swift_getObjectType();
    sub_240E0();
    swift_unknownObjectRelease();
    id v157 = [v112 encryptedValues];
    id v158 = [v60 bundleDate];
    if (v158)
    {
      v159 = v158;
      uint64_t v160 = (uint64_t)v220;
      sub_23DA0();

      uint64_t v161 = 0;
    }
    else
    {
      uint64_t v161 = 1;
      uint64_t v160 = (uint64_t)v220;
    }
    v162 = v226;
    v227(v160, v161, 1, v99);
    sub_14BC4(v160, v143, &qword_32710);
    if (v228(v143, 1, v99) == 1)
    {
      sub_14B68(v143, &qword_32710);
      long long v230 = 0u;
      long long v231 = 0u;
      v232 = 0;
    }
    else
    {
      *((void *)&v231 + 1) = v99;
      v232 = &protocol witness table for Date;
      v163 = sub_14C28((uint64_t *)&v230);
      v162[4](v163, v143, v99);
    }
    swift_getObjectType();
    sub_240E0();
    swift_unknownObjectRelease();
    id v164 = [v112 encryptedValues];
    id v165 = [v60 entryType];
    if (v165)
    {
      v166 = v165;
      uint64_t v167 = sub_23EE0();
      uint64_t v169 = v168;

      *((void *)&v231 + 1) = &type metadata for String;
      v232 = &protocol witness table for String;
      *(void *)&long long v230 = v167;
      *((void *)&v230 + 1) = v169;
      v112 = v229;
    }
    else
    {
      v232 = 0;
      long long v230 = 0u;
      long long v231 = 0u;
    }
    swift_getObjectType();
    sub_240E0();
    swift_unknownObjectRelease();
    id v170 = [v112 encryptedValues];
    swift_getObjectType();
    unsigned __int16 v171 = (unsigned __int16)[v60 textLength];
    *((void *)&v231 + 1) = &type metadata for Int16;
    v232 = &protocol witness table for Int16;
    LOWORD(v230) = v171;
    sub_240E0();
    swift_unknownObjectRelease();
    id v172 = [v112 encryptedValues];
    id v173 = [v60 reflectionIcon];
    if (v173)
    {
      v174 = v173;
      uint64_t v175 = sub_23D70();
      uint64_t v177 = v176;

      *((void *)&v231 + 1) = &type metadata for Data;
      v232 = &protocol witness table for Data;
      *(void *)&long long v230 = v175;
      *((void *)&v230 + 1) = v177;
      v112 = v229;
    }
    else
    {
      v232 = 0;
      long long v230 = 0u;
      long long v231 = 0u;
    }
    swift_getObjectType();
    sub_240E0();
    swift_unknownObjectRelease();
    id v178 = [v112 encryptedValues];
    id v179 = [v60 reflectionPrompt];
    if (v179)
    {
      v180 = v179;
      uint64_t v181 = sub_23D70();
      uint64_t v183 = v182;

      *((void *)&v231 + 1) = &type metadata for Data;
      v232 = &protocol witness table for Data;
      *(void *)&long long v230 = v181;
      *((void *)&v230 + 1) = v183;
      v112 = v229;
    }
    else
    {
      v232 = 0;
      long long v230 = 0u;
      long long v231 = 0u;
    }
    swift_getObjectType();
    sub_240E0();
    swift_unknownObjectRelease();
    id v184 = [v112 encryptedValues];
    id v185 = [v60 reflectionType];
    if (v185)
    {
      v186 = v185;
      uint64_t v187 = sub_23EE0();
      uint64_t v189 = v188;

      *((void *)&v231 + 1) = &type metadata for String;
      v232 = &protocol witness table for String;
      *(void *)&long long v230 = v187;
      *((void *)&v230 + 1) = v189;
      v112 = v229;
    }
    else
    {
      v232 = 0;
      long long v230 = 0u;
      long long v231 = 0u;
    }
    swift_getObjectType();
    sub_240E0();
    swift_unknownObjectRelease();
    id v190 = [v112 encryptedValues];
    swift_getObjectType();
    unsigned __int8 v191 = [v60 showPhotoMemoryBanner];
    *((void *)&v231 + 1) = &type metadata for Bool;
    v232 = &protocol witness table for Bool;
    LOBYTE(v230) = v191;
    sub_240E0();
    swift_unknownObjectRelease();
    id v192 = [v112 encryptedValues];
    swift_getObjectType();
    unsigned __int8 v193 = [v60 showTitle];
    *((void *)&v231 + 1) = &type metadata for Bool;
    v232 = &protocol witness table for Bool;
    LOBYTE(v230) = v193;
    sub_240E0();
    swift_unknownObjectRelease();
    id v194 = v112;
    uint64_t v67 = sub_23E10();
    os_log_type_t v195 = sub_24030();
    if (!os_log_type_enabled(v67, v195))
    {

      goto LABEL_85;
    }
    v196 = (uint8_t *)swift_slowAlloc();
    v228 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))swift_slowAlloc();
    *(void *)&long long v230 = v228;
    *(_DWORD *)v196 = 136315138;
    v227 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))(v196 + 4);
    id v197 = [v194 debugDescription];
    uint64_t v198 = sub_23EE0();
    unint64_t v200 = v199;

    sub_109AC(1000, v198, v200, v201);
    swift_bridgeObjectRelease();
    uint64_t v202 = sub_23F10();
    unint64_t v204 = v203;
    swift_bridgeObjectRelease();
    uint64_t v233 = sub_9EFC(v202, v204, (uint64_t *)&v230);
    sub_24170();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v67, v195, "(getRecordFromJournalEntry) CKRecord Recreated from entry:\n%s", v196, 0xCu);
    swift_arrayDestroy();
  }
  else
  {
    if (qword_31FF8 != -1) {
      swift_once();
    }
    uint64_t v65 = sub_23E30();
    sub_827C(v65, (uint64_t)qword_326D8);
    id v66 = a2;
    uint64_t v67 = sub_23E10();
    os_log_type_t v68 = sub_24010();
    if (!os_log_type_enabled(v67, v68))
    {
      sub_86A8(v38, v40);

      return v229;
    }
    uint64_t v222 = v38;
    unint64_t v69 = (uint8_t *)swift_slowAlloc();
    *(void *)&long long v230 = swift_slowAlloc();
    *(_DWORD *)unint64_t v69 = 136315138;
    id v70 = [v66 debugDescription];
    unint64_t v223 = v40;
    id v71 = v70;
    uint64_t v72 = sub_23EE0();
    unint64_t v74 = v73;

    uint64_t v233 = sub_9EFC(v72, v74, (uint64_t *)&v230);
    sub_24170();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v67, v68, "(getRecordFromJournalEntry) Failed to get record from systemfields for the entry: %s", v69, 0xCu);
    swift_arrayDestroy();
  }
  swift_slowDealloc();
  swift_slowDealloc();
LABEL_85:
  sub_86A8(v222, v223);

  return v229;
}

id sub_12438(uint64_t a1, void *a2, id a3)
{
  id v201 = a2;
  uint64_t v5 = sub_82B4(&qword_326F0);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v188 = (char *)v180 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v190 = (uint64_t)v180 - v8;
  uint64_t v9 = sub_82B4(&qword_32710);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  uint64_t v189 = (char *)v180 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)v180 - v13;
  uint64_t v15 = __chkstk_darwin(v12);
  v186 = (char *)v180 - v16;
  __chkstk_darwin(v15);
  uint64_t v187 = (char *)v180 - v17;
  uint64_t v18 = sub_23D50();
  uint64_t v196 = *(void *)(v18 - 8);
  uint64_t v197 = v18;
  uint64_t v19 = __chkstk_darwin(v18);
  uint64_t v198 = (char *)v180 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  os_log_type_t v195 = (char *)v180 - v21;
  uint64_t v22 = sub_23E00();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = __chkstk_darwin(v22);
  id v185 = (char *)v180 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24);
  uint64_t v27 = (char *)v180 - v26;
  id v28 = [a3 recordSystemFields];
  unsigned __int8 v191 = v14;
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = sub_23D70();
    unint64_t v32 = v31;
  }
  else
  {
    uint64_t v30 = 0;
    unint64_t v32 = 0xF000000000000000;
  }
  uint64_t v33 = *(void (**)(char *, uint64_t, uint8_t *))(v23 + 16);
  uint64_t v184 = v23 + 16;
  uint64_t v183 = v33;
  v33(v27, a1, (uint8_t *)v22);
  id v202 = a3;
  uint64_t v199 = v23;
  unint64_t v200 = (uint8_t *)v22;
  if (v32 >> 60 == 15)
  {
    uint64_t v34 = sub_23DD0();
    id v36 = v35;
    if (qword_31FA8 != -1) {
      swift_once();
    }
    id v37 = [(id)qword_32DF8 zoneID];
    sub_8824(0, &qword_326F8);
    swift_bridgeObjectRetain();
    uint64_t v38 = (objc_class *)v37;
    v207._countAndFlagsBits = v34;
    v207._object = v36;
    v39.super.Class isa = v38;
    Class isa = sub_23FE0(v207, v39).super.isa;
    sub_8824(0, &qword_32700);
    uint64_t v41 = isa;
    v208._countAndFlagsBits = 0xD000000000000011;
    v208._object = (void *)0x80000000000259D0;
    v42.super.Class isa = v41;
    Class v43 = sub_24110(v208, v42).super.isa;
    id v44 = [objc_allocWithZone((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
    [(objc_class *)v43 encodeSystemFieldsWithCoder:v44];
    id v45 = [v44 encodedData];
    uint64_t v30 = sub_23D70();
    unint64_t v47 = v46;
    swift_bridgeObjectRelease();

    unint64_t v32 = v47;
    a3 = v202;
    uint64_t v23 = v199;
    uint64_t v22 = (uint64_t)v200;
  }
  uint64_t v48 = *(void (**)(char *, uint64_t))(v23 + 8);
  v48(v27, v22);
  id v49 = sub_841C(v30, v32);
  if (!v49)
  {
    if (qword_31FF8 != -1) {
      swift_once();
    }
    uint64_t v78 = sub_23E30();
    sub_827C(v78, (uint64_t)qword_326D8);
    id v79 = a3;
    uint64_t v80 = sub_23E10();
    os_log_type_t v81 = sub_24010();
    if (os_log_type_enabled(v80, v81))
    {
      id v82 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v203 = swift_slowAlloc();
      *(_DWORD *)id v82 = 136315138;
      id v83 = [v79 debugDescription];
      uint64_t v84 = sub_23EE0();
      unint64_t v193 = v32;
      uint64_t v194 = v30;
      uint64_t v85 = v84;
      unint64_t v87 = v86;

      uint64_t v206 = sub_9EFC(v85, v87, (uint64_t *)&v203);
      sub_24170();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v80, v81, "(getRecordFromJournalEntryAsset) Failed to get record from systemfields for the asset: %s", v82, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      sub_86A8(v194, v193);

      return 0;
    }
LABEL_28:
    sub_86A8(v30, v32);

    return 0;
  }
  CKRecordID v50 = v49;
  v180[0] = v48;
  v180[1] = v23 + 8;
  uint64_t v51 = sub_23DD0();
  id v53 = v52;
  sub_8824(0, &qword_326F8);
  uint64_t v54 = qword_31FA8;
  swift_bridgeObjectRetain();
  if (v54 != -1) {
    swift_once();
  }
  v55.super.Class isa = (Class)[(id)qword_32DF8 zoneID];
  v209._countAndFlagsBits = v51;
  v209._object = v53;
  Class v56 = sub_23FE0(v209, v55).super.isa;
  swift_bridgeObjectRelease();
  [objc_allocWithZone((Class)CKReference) initWithRecordID:v56 action:1];

  sub_24120();
  id v57 = v202;
  id v58 = [v202 assetMetaData];
  id v201 = v50;
  if (!v58)
  {
    if (qword_31FF8 != -1) {
      swift_once();
    }
    uint64_t v88 = sub_23E30();
    sub_827C(v88, (uint64_t)qword_326D8);
    id v79 = v57;
    uint64_t v80 = sub_23E10();
    os_log_type_t v89 = sub_24020();
    if (os_log_type_enabled(v80, v89))
    {
      uint64_t v90 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v203 = swift_slowAlloc();
      *(_DWORD *)uint64_t v90 = 136315138;
      id v91 = [v79 debugDescription];
      unint64_t v193 = v32;
      id v92 = v91;
      uint64_t v93 = sub_23EE0();
      uint64_t v194 = v30;
      uint64_t v94 = v93;
      unint64_t v96 = v95;

      uint64_t v206 = sub_9EFC(v94, v96, (uint64_t *)&v203);
      sub_24170();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v80, v89, "(getRecordFromJournalEntryAsset) An asset doesn't have assetMetadata: %s", v90, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      sub_86A8(v194, v193);

      return 0;
    }

    goto LABEL_28;
  }
  uint64_t v59 = v58;
  type metadata accessor for CloudKitStackShared();
  uint64_t v192 = sub_23D70();
  unint64_t v61 = v60;

  uint64_t v62 = sub_23DD0();
  BOOL v63 = v195;
  sub_7248(v62, v64);
  swift_bridgeObjectRelease();
  if (qword_31FF8 != -1) {
    swift_once();
  }
  uint64_t v65 = sub_23E30();
  uint64_t v66 = sub_827C(v65, (uint64_t)qword_326D8);
  uint64_t v68 = v196;
  uint64_t v67 = v197;
  unint64_t v69 = v198;
  (*(void (**)(char *, char *, uint64_t))(v196 + 16))(v198, v63, v197);
  uint64_t v182 = v66;
  id v70 = sub_23E10();
  os_log_type_t v71 = sub_24030();
  BOOL v72 = os_log_type_enabled(v70, v71);
  uint64_t v194 = v30;
  if (v72)
  {
    unint64_t v73 = (uint8_t *)swift_slowAlloc();
    uint64_t v74 = swift_slowAlloc();
    unint64_t v193 = v32;
    *(void *)&long long v203 = v74;
    unint64_t v181 = v61;
    *(_DWORD *)unint64_t v73 = 136315138;
    uint64_t v75 = sub_23C90();
    uint64_t v206 = sub_9EFC(v75, v76, (uint64_t *)&v203);
    unint64_t v61 = v181;
    sub_24170();
    swift_bridgeObjectRelease();
    uint64_t v77 = *(void (**)(char *, uint64_t))(v68 + 8);
    v77(v198, v67);
    _os_log_impl(&dword_0, v70, v71, "(getRecordFromJournalEntryAsset) Saving assetMetadata to url: %s", v73, 0xCu);
    swift_arrayDestroy();
    unint64_t v32 = v193;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v77 = *(void (**)(char *, uint64_t))(v68 + 8);
    v77(v69, v67);
  }

  id v97 = v202;
  uint64_t v98 = v63;
  sub_23D80();
  id v99 = objc_allocWithZone((Class)CKAsset);
  sub_23CC0(v100);
  uint64_t v102 = v101;
  id v103 = [v99 initWithFileURL:v101];

  id v104 = v103;
  id v105 = v201;
  sub_24120();

  id v106 = v105;
  v77(v98, v67);
  id v107 = [v105 encryptedValues];
  id v108 = [v97 title];
  unint64_t v181 = v61;
  if (v108)
  {
    v109 = v108;
    uint64_t v110 = sub_23D70();
    uint64_t v112 = v111;

    *((void *)&v204 + 1) = &type metadata for Data;
    v205 = &protocol witness table for Data;
    *(void *)&long long v203 = v110;
    *((void *)&v203 + 1) = v112;
    id v106 = v201;
  }
  else
  {
    v205 = 0;
    long long v203 = 0u;
    long long v204 = 0u;
  }
  uint64_t v114 = (uint64_t)v187;
  swift_getObjectType();
  sub_240E0();
  swift_unknownObjectRelease();
  id v115 = &off_31000;
  id v116 = [v106 encryptedValues];
  id v117 = [v97 assetType];
  if (v117)
  {
    v118 = v117;
    uint64_t v119 = sub_23EE0();
    uint64_t v121 = v120;

    *((void *)&v204 + 1) = &type metadata for String;
    v205 = &protocol witness table for String;
    id v115 = &off_31000;
    *(void *)&long long v203 = v119;
    *((void *)&v203 + 1) = v121;
    id v106 = v201;
  }
  else
  {
    v205 = 0;
    long long v203 = 0u;
    long long v204 = 0u;
  }
  swift_getObjectType();
  sub_240E0();
  swift_unknownObjectRelease();
  id v122 = [v106 (SEL)v115[173]];
  id v123 = [v97 createdDate];
  unint64_t v193 = v32;
  if (v123)
  {
    id v124 = v123;
    uint64_t v125 = (uint64_t)v186;
    sub_23DA0();

    uint64_t v126 = sub_23DC0();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v126 - 8) + 56))(v125, 0, 1, v126);
  }
  else
  {
    uint64_t v126 = sub_23DC0();
    uint64_t v125 = (uint64_t)v186;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v126 - 8) + 56))(v186, 1, 1, v126);
  }
  sub_14BC4(v125, v114, &qword_32710);
  sub_23DC0();
  uint64_t v127 = *(void *)(v126 - 8);
  v128 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v127 + 48);
  if (v128(v114, 1, v126) == 1)
  {
    sub_14B68(v114, &qword_32710);
    long long v203 = 0u;
    long long v204 = 0u;
    v205 = 0;
  }
  else
  {
    *((void *)&v204 + 1) = v126;
    v205 = &protocol witness table for Date;
    id v129 = sub_14C28((uint64_t *)&v203);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v127 + 32))(v129, v114, v126);
  }
  swift_getObjectType();
  sub_240E0();
  swift_unknownObjectRelease();
  id v130 = [v106 (SEL)v115[173]];
  swift_getObjectType();
  unsigned __int16 v131 = (unsigned __int16)[v97 minimumSupportedAppVersion];
  *((void *)&v204 + 1) = &type metadata for Int16;
  v205 = &protocol witness table for Int16;
  LOWORD(v203) = v131;
  sub_240E0();
  swift_unknownObjectRelease();
  id v132 = [v106 (SEL)v115[173]];
  id v133 = [v97 source];
  if (v133)
  {
    uint64_t v134 = v133;
    uint64_t v135 = sub_23EE0();
    uint64_t v137 = v136;

    *((void *)&v204 + 1) = &type metadata for String;
    v205 = &protocol witness table for String;
    *(void *)&long long v203 = v135;
    *((void *)&v203 + 1) = v137;
    id v106 = v201;
    id v97 = v202;
  }
  else
  {
    v205 = 0;
    long long v203 = 0u;
    long long v204 = 0u;
  }
  swift_getObjectType();
  sub_240E0();
  swift_unknownObjectRelease();
  [v106 (SEL)v115[173]];
  id v138 = [v97 suggestionId];
  if (v138)
  {
    v139 = v138;
    uint64_t v140 = v188;
    sub_23DE0();

    uint64_t v141 = v140;
    uint64_t v142 = 0;
  }
  else
  {
    uint64_t v142 = 1;
    uint64_t v141 = v188;
  }
  uint64_t v143 = v199;
  id v144 = v200;
  (*(void (**)(char *, uint64_t, uint64_t, uint8_t *))(v199 + 56))(v141, v142, 1, v200);
  uint64_t v145 = (uint64_t)v141;
  uint64_t v146 = v190;
  sub_14BC4(v145, v190, &qword_326F0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint8_t *))(v143 + 48))(v146, 1, v144))
  {
    sub_14B68(v146, &qword_326F0);
    long long v203 = 0u;
    long long v204 = 0u;
    v205 = 0;
  }
  else
  {
    v147 = v185;
    v183(v185, v146, v144);
    sub_14B68(v146, &qword_326F0);
    uint64_t v148 = sub_23DD0();
    uint64_t v150 = v149;
    ((void (*)(char *, uint8_t *))v180[0])(v147, v144);
    *((void *)&v204 + 1) = &type metadata for String;
    v205 = &protocol witness table for String;
    *(void *)&long long v203 = v148;
    *((void *)&v203 + 1) = v150;
    id v106 = v201;
  }
  swift_getObjectType();
  sub_240E0();
  swift_unknownObjectRelease();
  id v151 = [v106 encryptedValues];
  id v152 = [v97 suggestionDate];
  if (v152)
  {
    v153 = v152;
    uint64_t v154 = v189;
    sub_23DA0();

    uint64_t v155 = v154;
    uint64_t v156 = 0;
  }
  else
  {
    uint64_t v156 = 1;
    uint64_t v155 = v189;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v127 + 56))(v155, v156, 1, v126);
  uint64_t v157 = (uint64_t)v155;
  uint64_t v158 = (uint64_t)v191;
  sub_14BC4(v157, (uint64_t)v191, &qword_32710);
  if (v128(v158, 1, v126) == 1)
  {
    sub_14B68(v158, &qword_32710);
    long long v203 = 0u;
    long long v204 = 0u;
    v205 = 0;
  }
  else
  {
    *((void *)&v204 + 1) = v126;
    v205 = &protocol witness table for Date;
    v159 = sub_14C28((uint64_t *)&v203);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v127 + 32))(v159, v158, v126);
  }
  swift_getObjectType();
  sub_240E0();
  swift_unknownObjectRelease();
  id v160 = [v106 encryptedValues];
  swift_getObjectType();
  unsigned __int8 v161 = [v97 isSlim];
  *((void *)&v204 + 1) = &type metadata for Bool;
  v205 = &protocol witness table for Bool;
  LOBYTE(v203) = v161;
  sub_240E0();
  swift_unknownObjectRelease();
  id v162 = [v106 encryptedValues];
  id v163 = [v97 osVersion];
  if (v163)
  {
    id v164 = v163;
    uint64_t v165 = sub_23EE0();
    uint64_t v167 = v166;

    *((void *)&v204 + 1) = &type metadata for String;
    v205 = &protocol witness table for String;
    *(void *)&long long v203 = v165;
    *((void *)&v203 + 1) = v167;
    id v106 = v201;
  }
  else
  {
    v205 = 0;
    long long v203 = 0u;
    long long v204 = 0u;
  }
  swift_getObjectType();
  sub_240E0();
  swift_unknownObjectRelease();
  id v168 = v106;
  uint64_t v169 = sub_23E10();
  os_log_type_t v170 = sub_24030();
  if (os_log_type_enabled(v169, v170))
  {
    unsigned __int16 v171 = (uint8_t *)swift_slowAlloc();
    id v202 = (id)swift_slowAlloc();
    *(void *)&long long v203 = v202;
    *(_DWORD *)unsigned __int16 v171 = 136315138;
    unint64_t v200 = v171 + 4;
    id v172 = [v168 debugDescription];
    uint64_t v173 = sub_23EE0();
    unint64_t v175 = v174;

    sub_109AC(1000, v173, v175, v176);
    swift_bridgeObjectRelease();
    uint64_t v177 = sub_23F10();
    unint64_t v179 = v178;
    swift_bridgeObjectRelease();
    uint64_t v206 = sub_9EFC(v177, v179, (uint64_t *)&v203);
    sub_24170();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v169, v170, "(getRecordFromJournalEntryAsset) CKRecord Recreated from asset:\n%s", v171, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  sub_86A8(v192, v181);
  sub_86A8(v194, v193);

  return v201;
}

void *sub_13BE8(uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v120 = a2;
  uint64_t v5 = sub_82B4(&qword_32608);
  __chkstk_darwin(v5 - 8);
  uint64_t v119 = (uint8_t *)&v114 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_23D50();
  uint64_t v121 = *(void *)(v7 - 8);
  uint64_t v8 = __chkstk_darwin(v7);
  id v116 = (char *)&v114 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v11 = (uint8_t *)&v114 - v10;
  uint64_t v12 = sub_23E00();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v114 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v16 = [a3 recordSystemFields];
  id v117 = v11;
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = sub_23D70();
    unint64_t v20 = v19;
  }
  else
  {
    uint64_t v18 = 0;
    unint64_t v20 = 0xF000000000000000;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, a1, v12);
  if (v20 >> 60 == 15)
  {
    id v115 = a3;
    uint64_t v118 = v7;
    uint64_t v21 = sub_23DD0();
    uint64_t v23 = v22;
    if (qword_31FA8 != -1) {
      swift_once();
    }
    id v24 = [(id)qword_32DF8 zoneID];
    sub_8824(0, &qword_326F8);
    swift_bridgeObjectRetain();
    uint64_t v25 = (objc_class *)v24;
    v126._countAndFlagsBits = v21;
    v126._object = v23;
    v26.super.Class isa = v25;
    Class isa = sub_23FE0(v126, v26).super.isa;
    sub_8824(0, &qword_32700);
    id v28 = isa;
    v127._countAndFlagsBits = 0xD00000000000001FLL;
    v127._object = (void *)0x80000000000259F0;
    v29.super.Class isa = v28;
    Class v30 = sub_24110(v127, v29).super.isa;
    id v31 = [objc_allocWithZone((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
    [(objc_class *)v30 encodeSystemFieldsWithCoder:v31];
    id v32 = [v31 encodedData];
    uint64_t v33 = sub_23D70();
    unint64_t v20 = v34;
    swift_bridgeObjectRelease();

    uint64_t v18 = v33;
    uint64_t v7 = v118;
    a3 = v115;
  }
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  id v35 = sub_841C(v18, v20);
  if (!v35)
  {
    if (qword_31FF8 != -1) {
      swift_once();
    }
    uint64_t v52 = sub_23E30();
    sub_827C(v52, (uint64_t)qword_326D8);
    id v53 = a3;
    uint64_t v54 = sub_23E10();
    os_log_type_t v55 = sub_24010();
    if (os_log_type_enabled(v54, v55))
    {
      unint64_t v120 = v20;
      Class v56 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v122 = swift_slowAlloc();
      uint64_t v118 = v18;
      *(_DWORD *)Class v56 = 136315138;
      id v57 = [v53 debugDescription];
      uint64_t v58 = sub_23EE0();
      unint64_t v60 = v59;

      uint64_t v125 = sub_9EFC(v58, v60, (uint64_t *)&v122);
      sub_24170();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v54, v55, "(getRecordFromJournalEntryAssetFileAttachment) Failed to get record from systemfields for the attachment: %s", v56, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      sub_86A8(v118, v120);

      return 0;
    }
    uint64_t v75 = v18;
LABEL_33:
    sub_86A8(v75, v20);

    return 0;
  }
  id v36 = v35;
  uint64_t v118 = v18;
  uint64_t v37 = sub_23DD0();
  CKRecordZoneID v39 = v38;
  sub_8824(0, &qword_326F8);
  uint64_t v40 = qword_31FA8;
  swift_bridgeObjectRetain();
  if (v40 != -1) {
    swift_once();
  }
  v41.super.Class isa = (Class)[(id)qword_32DF8 zoneID];
  v128._countAndFlagsBits = v37;
  v128._object = v39;
  Class v42 = sub_23FE0(v128, v41).super.isa;
  swift_bridgeObjectRelease();
  [objc_allocWithZone((Class)CKReference) initWithRecordID:v42 action:1];

  sub_24120();
  id v43 = [v36 encryptedValues];
  swift_getObjectType();
  unsigned __int16 v44 = (unsigned __int16)[a3 index];
  *((void *)&v123 + 1) = &type metadata for Int16;
  id v124 = &protocol witness table for Int16;
  LOWORD(v122) = v44;
  sub_240E0();
  swift_unknownObjectRelease();
  id v45 = [v36 encryptedValues];
  id v46 = [a3 name];
  uint64_t v47 = v121;
  if (v46)
  {
    uint64_t v48 = v46;
    uint64_t v49 = sub_23EE0();
    uint64_t v51 = v50;

    *((void *)&v123 + 1) = &type metadata for String;
    id v124 = &protocol witness table for String;
    *(void *)&long long v122 = v49;
    *((void *)&v122 + 1) = v51;
  }
  else
  {
    id v124 = 0;
    long long v122 = 0u;
    long long v123 = 0u;
  }
  unint64_t v61 = v119;
  swift_getObjectType();
  sub_240E0();
  swift_unknownObjectRelease();
  id v62 = [a3 filePath];
  if (!v62)
  {
LABEL_21:
    if (qword_31FF8 != -1) {
      swift_once();
    }
    uint64_t v67 = sub_23E30();
    sub_827C(v67, (uint64_t)qword_326D8);
    id v53 = a3;
    uint64_t v54 = sub_23E10();
    os_log_type_t v68 = sub_24010();
    if (os_log_type_enabled(v54, v68))
    {
      unint64_t v120 = v20;
      unint64_t v69 = (uint8_t *)swift_slowAlloc();
      uint64_t v125 = swift_slowAlloc();
      *(_DWORD *)unint64_t v69 = 136315138;
      id v70 = [v53 filePath];
      if (v70)
      {
        os_log_type_t v71 = v70;
        uint64_t v72 = sub_23EE0();
        uint64_t v74 = v73;
      }
      else
      {
        uint64_t v72 = 0;
        uint64_t v74 = 0;
      }
      *(void *)&long long v122 = v72;
      *((void *)&v122 + 1) = v74;
      sub_82B4(&qword_32708);
      uint64_t v110 = sub_23EF0();
      *(void *)&long long v122 = sub_9EFC(v110, v111, &v125);
      sub_24170();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v54, v68, "(getRecordFromJournalEntryAssetFileAttachment) Unable to get attachment url: %s", v69, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      sub_86A8(v118, v120);

      return 0;
    }

    uint64_t v75 = v118;
    goto LABEL_33;
  }
  BOOL v63 = v62;
  uint64_t v64 = sub_23EE0();
  uint64_t v66 = v65;

  type metadata accessor for Journaling();
  sub_DDA0((uint64_t)v61);
  if ((*(unsigned int (**)(uint8_t *, uint64_t, uint64_t))(v47 + 48))(v61, 1, v7) == 1)
  {
    swift_bridgeObjectRelease();
    sub_14B68((uint64_t)v61, &qword_32608);
    goto LABEL_21;
  }
  unint64_t v76 = v117;
  (*(void (**)(uint8_t *, uint8_t *, uint64_t))(v47 + 32))(v117, v61, v7);
  id v77 = [self defaultManager];
  sub_23D10();
  NSString v78 = sub_23EB0();
  swift_bridgeObjectRelease();
  unsigned __int8 v79 = [v77 fileExistsAtPath:v78];

  if ((v79 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    if (qword_31FF8 != -1) {
      swift_once();
    }
    uint64_t v100 = sub_23E30();
    sub_827C(v100, (uint64_t)qword_326D8);
    int v101 = v116;
    (*(void (**)(char *, uint8_t *, uint64_t))(v47 + 16))(v116, v76, v7);
    uint64_t v102 = sub_23E10();
    uint64_t v103 = v7;
    os_log_type_t v104 = sub_24010();
    if (os_log_type_enabled(v102, v104))
    {
      uint64_t v105 = swift_slowAlloc();
      unint64_t v120 = v20;
      id v106 = (uint8_t *)v105;
      *(void *)&long long v122 = swift_slowAlloc();
      *(_DWORD *)id v106 = 136315138;
      uint64_t v119 = v106 + 4;
      sub_14B20((unint64_t *)&qword_323B0, (void (*)(uint64_t))&type metadata accessor for URL);
      uint64_t v107 = sub_24280();
      uint64_t v125 = sub_9EFC(v107, v108, (uint64_t *)&v122);
      sub_24170();
      swift_bridgeObjectRelease();
      v109 = *(void (**)(char *, uint64_t))(v47 + 8);
      v109(v101, v103);
      _os_log_impl(&dword_0, v102, v104, "(getRecordFromJournalEntryAssetFileAttachment) File attachment file does not exist: %s", v106, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      sub_86A8(v118, v120);

      v109((char *)v117, v103);
    }
    else
    {
      sub_86A8(v118, v20);

      uint64_t v112 = *(void (**)(char *, uint64_t))(v47 + 8);
      v112(v101, v103);
      v112((char *)v76, v103);
    }
    return 0;
  }
  id v80 = objc_allocWithZone((Class)CKAsset);
  sub_23CC0(v81);
  id v83 = v82;
  id v84 = [v80 initWithFileURL:v82];

  id v85 = v84;
  sub_24120();
  id v86 = [v36 encryptedValues];
  swift_getObjectType();
  *((void *)&v123 + 1) = &type metadata for String;
  id v124 = &protocol witness table for String;
  *(void *)&long long v122 = v64;
  *((void *)&v122 + 1) = v66;
  sub_240E0();

  swift_unknownObjectRelease();
  (*(void (**)(uint8_t *, uint64_t))(v47 + 8))(v76, v7);
  if (qword_31FF8 != -1) {
    swift_once();
  }
  uint64_t v87 = sub_23E30();
  sub_827C(v87, (uint64_t)qword_326D8);
  id v88 = v36;
  os_log_type_t v89 = sub_23E10();
  os_log_type_t v90 = sub_24030();
  if (os_log_type_enabled(v89, v90))
  {
    id v91 = (uint8_t *)swift_slowAlloc();
    uint64_t v121 = swift_slowAlloc();
    *(void *)&long long v122 = v121;
    uint64_t v119 = v91;
    *(_DWORD *)id v91 = 136315138;
    id v117 = v91 + 4;
    id v92 = [v88 debugDescription];
    uint64_t v93 = sub_23EE0();
    unint64_t v95 = v94;

    sub_109AC(1000, v93, v95, v96);
    unint64_t v120 = v20;
    swift_bridgeObjectRelease();
    uint64_t v97 = sub_23F10();
    unint64_t v99 = v98;
    swift_bridgeObjectRelease();
    uint64_t v125 = sub_9EFC(v97, v99, (uint64_t *)&v122);
    sub_24170();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v89, v90, "(getRecordFromJournalEntryAssetFileAttachment) CKRecord Recreated from fileAttachment:\n%s", v119, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    sub_86A8(v118, v120);
  }
  else
  {
    sub_86A8(v118, v20);
  }
  return v36;
}

uint64_t sub_14B20(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_14B68(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_82B4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_14BC4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_82B4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t *sub_14C28(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

void sub_14C8C(char *a1@<X8>)
{
  sub_EEA0(*(void **)(v1 + 24), (void (*)(void))type metadata accessor for JournalEntryAssetFileAttachmentMO, "%{public}s (getUnuploadedAttachments) fetched un-uploaded attachments:%ld", "%{public}s (getUnuploadedAttachments) Unable to get un-uploaded attachments: %@", a1);
}

void sub_14CE4(char *a1@<X8>)
{
  sub_EEA0(*(void **)(v1 + 24), (void (*)(void))type metadata accessor for JournalEntryAssetMO, "%{public}s (getUnuploadedAssets) fetched un-uploaded assets:%ld", "%{public}s (getUnuploadedAssets) Unable to get un-uploaded assets: %@", a1);
}

void sub_14D3C(unint64_t *a1@<X8>)
{
  sub_E46C(*(void **)(v1 + 24), a1);
}

uint64_t sub_14D58()
{
  uint64_t v0 = sub_23E30();
  sub_82F8(v0, qword_32740);
  uint64_t v1 = sub_827C(v0, (uint64_t)qword_32740);
  if (qword_31FD0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_827C(v0, (uint64_t)qword_32E08);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

void sub_14E20(void *a1, uint64_t a2, uint64_t a3)
{
  id v7 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v8 = sub_23EB0();
  id v9 = [v7 initWithEntityName:v8];

  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = a1;
  v10[3] = v9;
  v10[4] = a2;
  v10[5] = a3;
  v10[6] = v3;
  v15[4] = sub_15390;
  v15[5] = v10;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 1107296256;
  v15[2] = sub_1A290;
  v15[3] = &unk_2D138;
  uint64_t v11 = _Block_copy(v15);
  id v12 = a1;
  id v13 = v9;
  swift_retain();
  id v14 = v3;
  swift_release();
  [v12 performBlock:v11];
  _Block_release(v11);
}

unint64_t sub_14F80(void *a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  type metadata accessor for JournalEntryMO();
  unint64_t result = sub_240D0();
  unint64_t v6 = result;
  if (!(result >> 62))
  {
    uint64_t v7 = *(void *)((char *)&dword_10 + (result & 0xFFFFFFFFFFFFFF8));
    if (v7) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return a3(1);
  }
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_24240();
  unint64_t result = swift_bridgeObjectRelease();
  if (!v7) {
    goto LABEL_13;
  }
LABEL_3:
  if (v7 >= 1)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if ((v6 & 0xC000000000000001) != 0) {
        id v9 = (id)sub_241F0();
      }
      else {
        id v9 = *(id *)(v6 + 8 * i + 32);
      }
      uint64_t v10 = v9;
      if ([v9 isRemovedFromCloud])
      {
        [a1 deleteObject:v10];
      }
      else
      {
        [v10 setIsUploadedToCloud:0];
        [v10 setRecordSystemFields:0];
      }
    }
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

uint64_t sub_15340()
{
  swift_release();
  return _swift_deallocObject(v0, 56, 7);
}

unint64_t sub_15390()
{
  return sub_14F80(*(void **)(v0 + 16), *(void *)(v0 + 24), *(uint64_t (**)(uint64_t))(v0 + 32));
}

uint64_t sub_153A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_153B0()
{
  return swift_release();
}

uint64_t sub_153B8()
{
  uint64_t v0 = sub_23E30();
  sub_82F8(v0, qword_32758);
  uint64_t v1 = sub_827C(v0, (uint64_t)qword_32758);
  if (qword_31FD0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_827C(v0, (uint64_t)qword_32E08);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

void sub_15480(void *a1, uint64_t a2, uint64_t a3)
{
  id v7 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v8 = sub_23EB0();
  id v9 = [v7 initWithEntityName:v8];

  id v10 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v11 = sub_23EB0();
  id v12 = [v10 initWithEntityName:v11];

  id v13 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v14 = sub_23EB0();
  id v15 = [v13 initWithEntityName:v14];

  id v16 = (void *)swift_allocObject();
  v16[2] = a1;
  v16[3] = v9;
  v16[4] = v3;
  v16[5] = v12;
  v16[6] = v15;
  v16[7] = a2;
  v16[8] = a3;
  v23[4] = sub_164FC;
  v23[5] = v16;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 1107296256;
  v23[2] = sub_1A290;
  v23[3] = &unk_2D188;
  uint64_t v17 = _Block_copy(v23);
  id v18 = a1;
  id v19 = v9;
  id v20 = v3;
  id v21 = v12;
  id v22 = v15;
  swift_retain();
  swift_release();
  [v18 performBlock:v17];
  _Block_release(v17);
}

uint64_t sub_15698(void *a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t (*a6)(uint64_t), uint64_t a7)
{
  id v119 = a4;
  uint64_t v120 = a7;
  id v121 = a3;
  long long v122 = a6;
  id v118 = a5;
  uint64_t v8 = sub_82B4(&qword_32608);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  NSString v11 = (char *)v108 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  id v13 = (char *)v108 - v12;
  uint64_t v14 = sub_23D50();
  id v15 = *(void (***)(char *, void))(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  id v18 = (char *)v108 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  id v20 = (char *)v108 - v19;
  type metadata accessor for JournalEntryMO();
  unint64_t v21 = sub_240D0();
  id v22 = &qword_32000;
  long long v123 = 0;
  unint64_t v23 = v21;
  unint64_t v111 = (void (*)(void, void, void))v13;
  uint64_t v112 = v15;
  uint64_t v114 = v18;
  id v115 = v11;
  uint64_t v116 = v14;
  v113 = v20;
  if (v21 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_24240();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v24 = *(void *)((char *)&dword_10 + (v21 & 0xFFFFFFFFFFFFFF8));
  }
  uint64_t v25 = v122;
  if (v24)
  {
    if (v24 < 1)
    {
      __break(1u);
      goto LABEL_26;
    }
    for (uint64_t i = 0; i != v24; ++i)
    {
      if ((v23 & 0xC000000000000001) != 0) {
        id v27 = (id)sub_241F0();
      }
      else {
        id v27 = *(id *)(v23 + 8 * i + 32);
      }
      id v28 = v27;
      [a1 deleteObject:v27];
    }
  }
  swift_bridgeObjectRelease();
  if (qword_32008 != -1) {
    swift_once();
  }
  uint64_t v29 = sub_23E30();
  uint64_t v30 = sub_827C(v29, (uint64_t)qword_32758);
  id v31 = v121;
  id v32 = v121;
  uint64_t v117 = v30;
  uint64_t v33 = sub_23E10();
  os_log_type_t v34 = sub_24030();
  id v15 = (void (**)(char *, void))v34;
  if (os_log_type_enabled(v33, v34))
  {
    id v35 = (uint8_t *)swift_slowAlloc();
    id v36 = (void *)swift_slowAlloc();
    *(_DWORD *)id v35 = 136446210;
    id v125 = v36;
    sub_23E00();
    sub_98CC();
    uint64_t v37 = sub_24280();
    uint64_t v124 = sub_9EFC(v37, v38, (uint64_t *)&v125);
    id v22 = &qword_32000;
    sub_24170();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v33, (os_log_type_t)v15, "%{public}s (Delete All) journal entries", v35, 0xCu);
    swift_arrayDestroy();
    id v31 = v121;
    swift_slowDealloc();
    uint64_t v25 = v122;
    swift_slowDealloc();
  }
  else
  {
  }
  type metadata accessor for JournalEntryAssetMO();
  CKRecordZoneID v39 = v123;
  unint64_t v40 = sub_240D0();
  long long v123 = v39;
  if (v39) {
    goto LABEL_31;
  }
  unint64_t v23 = v40;
  id v119 = v32;
  if (v40 >> 62)
  {
LABEL_26:
    swift_bridgeObjectRetain();
    uint64_t v41 = sub_24240();
    swift_bridgeObjectRelease();
    if (!v41) {
      goto LABEL_27;
    }
    goto LABEL_18;
  }
  uint64_t v41 = *(void *)((char *)&dword_10 + (v40 & 0xFFFFFFFFFFFFFF8));
  if (!v41) {
    goto LABEL_27;
  }
LABEL_18:
  if (v41 < 1)
  {
    __break(1u);
    goto LABEL_46;
  }
  for (uint64_t j = 0; j != v41; ++j)
  {
    if ((v23 & 0xC000000000000001) != 0) {
      id v43 = (id)sub_241F0();
    }
    else {
      id v43 = *(id *)(v23 + 8 * j + 32);
    }
    unsigned __int16 v44 = v43;
    [a1 deleteObject:v43];
  }
LABEL_27:
  swift_bridgeObjectRelease();
  id v45 = v119;
  id v46 = sub_23E10();
  os_log_type_t v47 = sub_24030();
  if (os_log_type_enabled(v46, v47))
  {
    uint64_t v48 = (uint8_t *)swift_slowAlloc();
    uint64_t v49 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v48 = 136446210;
    id v125 = v49;
    sub_23E00();
    sub_98CC();
    uint64_t v50 = sub_24280();
    uint64_t v124 = sub_9EFC(v50, v51, (uint64_t *)&v125);
    uint64_t v25 = v122;
    id v22 = &qword_32000;
    sub_24170();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v46, v47, "%{public}s (Delete All) journal entries assets", v48, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  type metadata accessor for JournalEntryAssetFileAttachmentMO();
  uint64_t v52 = v123;
  unint64_t v53 = sub_240D0();
  id v31 = v121;
  long long v123 = v52;
  if (!v52)
  {
    unint64_t v23 = v53;
    id v15 = (void (**)(char *, void))v45;
    if (!(v53 >> 62))
    {
      uint64_t v65 = *(void *)((char *)&dword_10 + (v53 & 0xFFFFFFFFFFFFFF8));
      if (!v65) {
        goto LABEL_47;
      }
LABEL_39:
      if (v65 < 1) {
        __break(1u);
      }
      for (uint64_t k = 0; k != v65; ++k)
      {
        if ((v23 & 0xC000000000000001) != 0) {
          id v67 = (id)sub_241F0();
        }
        else {
          id v67 = *(id *)(v23 + 8 * k + 32);
        }
        os_log_type_t v68 = v67;
        [a1 deleteObject:v67];
      }
LABEL_47:
      swift_bridgeObjectRelease();
      unint64_t v69 = v15;
      id v70 = sub_23E10();
      os_log_type_t v71 = sub_24030();
      if (os_log_type_enabled(v70, v71))
      {
        uint64_t v72 = (uint8_t *)swift_slowAlloc();
        uint64_t v73 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v72 = 136446210;
        id v125 = v73;
        long long v123 = v72 + 4;
        sub_23E00();
        sub_98CC();
        uint64_t v74 = sub_24280();
        uint64_t v124 = sub_9EFC(v74, v75, (uint64_t *)&v125);
        sub_24170();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_0, v70, v71, "%{public}s (Delete All) journal entries asset attachments", v72, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      uint64_t v76 = v116;
      NSString v78 = v112;
      id v77 = v113;
      type metadata accessor for Journaling();
      unsigned __int8 v79 = v111;
      sub_CFC8((uint64_t)v111);
      id v80 = v78[6];
      long long v123 = (uint8_t *)(v78 + 6);
      id v119 = v80;
      if (((unsigned int (*)(void, uint64_t, uint64_t))v80)(v79, 1, v76) == 1)
      {
        sub_CF68((uint64_t)v79);
      }
      else
      {
        os_log_type_t v81 = v78[4];
        uint64_t v117 = (uint64_t)(v78 + 4);
        unint64_t v111 = (void (*)(void, void, void))v81;
        ((void (*)(char *, void, uint64_t))v81)(v77, v79, v76);
        id v82 = [self defaultManager];
        sub_23CC0(v83);
        id v85 = v84;
        id v125 = 0;
        id v86 = [v82 contentsOfDirectoryAtURL:v84 includingPropertiesForKeys:0 options:4 error:&v125];

        id v87 = v125;
        if (!v86)
        {
          id v104 = v125;
          uint64_t v105 = sub_23C40();

          long long v123 = (uint8_t *)v105;
          swift_willThrow();

          v78[1](v77, v76);
LABEL_65:
          id v31 = v121;
          id v22 = &qword_32000;
          goto LABEL_31;
        }
        id v118 = v82;
        uint64_t v88 = sub_23FA0();
        id v89 = v87;

        uint64_t v90 = *(void *)(v88 + 16);
        v108[1] = v88;
        if (v90)
        {
          id v91 = (void (*)(char *, unint64_t, uint64_t))v78[2];
          unint64_t v92 = v88 + ((*((unsigned __int8 *)v78 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v78 + 80));
          uint64_t v109 = (uint64_t)v78[9];
          uint64_t v110 = v91;
          uint64_t v93 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v78 + 7);
          unint64_t v94 = v78 + 1;
          v108[0] = (unint64_t)(v78 + 7) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
          unint64_t v95 = v115;
          while (1)
          {
            v110(v95, v92, v76);
            unint64_t v96 = *v93;
            (*v93)(v95, 0, 1, v76);
            if (((unsigned int (*)(char *, uint64_t, uint64_t))v119)(v95, 1, v76) == 1) {
              break;
            }
            uint64_t v97 = v114;
            v111(v114, v95, v76);
            sub_23CC0(v98);
            uint64_t v100 = v99;
            int v101 = *v94;
            (*v94)(v97, v76);
            id v125 = 0;
            unsigned int v102 = [v118 removeItemAtURL:v100 error:&v125];

            id v103 = v125;
            if (!v102)
            {
              id v106 = v103;
              swift_bridgeObjectRelease();
              uint64_t v107 = sub_23C40();

              long long v123 = (uint8_t *)v107;
              swift_willThrow();

              v101(v113, v116);
              uint64_t v25 = v122;
              goto LABEL_65;
            }
            v92 += v109;
            --v90;
            unint64_t v95 = v115;
            uint64_t v76 = v116;
            if (!v90) {
              goto LABEL_61;
            }
          }
        }
        else
        {
          unint64_t v96 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v78[7];
          unint64_t v95 = v115;
LABEL_61:
          v96(v95, 1, 1, v76);
        }
        swift_bridgeObjectRelease();

        v112[1](v113, v76);
        uint64_t v25 = v122;
      }
      return v25(1);
    }
LABEL_46:
    swift_bridgeObjectRetain();
    uint64_t v65 = sub_24240();
    swift_bridgeObjectRelease();
    if (!v65) {
      goto LABEL_47;
    }
    goto LABEL_39;
  }
LABEL_31:
  if (v22[1] != -1) {
    swift_once();
  }
  uint64_t v54 = sub_23E30();
  sub_827C(v54, (uint64_t)qword_32758);
  id v55 = v31;
  swift_errorRetain();
  id v56 = v55;
  swift_errorRetain();
  id v57 = sub_23E10();
  os_log_type_t v58 = sub_24020();
  if (os_log_type_enabled(v57, v58))
  {
    uint64_t v59 = swift_slowAlloc();
    unint64_t v60 = (void *)swift_slowAlloc();
    id v125 = (id)swift_slowAlloc();
    *(_DWORD *)uint64_t v59 = 136446466;
    sub_23E00();
    sub_98CC();
    uint64_t v61 = sub_24280();
    uint64_t v124 = sub_9EFC(v61, v62, (uint64_t *)&v125);
    sub_24170();

    swift_bridgeObjectRelease();
    *(_WORD *)(v59 + 12) = 2112;
    swift_errorRetain();
    uint64_t v63 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v124 = v63;
    uint64_t v25 = v122;
    sub_24170();
    *unint64_t v60 = v63;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v57, v58, "%{public}s (Delete All) Unabled to delete all journal entries: %@", (uint8_t *)v59, 0x16u);
    sub_82B4(&qword_32530);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();
  }

  v25(0);
  return swift_errorRelease();
}

uint64_t sub_1649C()
{
  swift_release();
  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_164FC()
{
  return sub_15698(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32), *(void **)(v0 + 40), *(void **)(v0 + 48), *(uint64_t (**)(uint64_t))(v0 + 56), *(void *)(v0 + 64));
}

uint64_t sub_16510(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_16520()
{
  return swift_release();
}

uint64_t *NSPredicate.notUploadedToCloud.unsafeMutableAddressor()
{
  if (qword_32020 != -1) {
    swift_once();
  }
  return &static NSPredicate.notUploadedToCloud;
}

uint64_t *NSPredicate.isNotTipEntry.unsafeMutableAddressor()
{
  if (qword_32040 != -1) {
    swift_once();
  }
  return &static NSPredicate.isNotTipEntry;
}

uint64_t *NSPredicate.notRemovedFromCloud.unsafeMutableAddressor()
{
  if (qword_32010 != -1) {
    swift_once();
  }
  return &static NSPredicate.notRemovedFromCloud;
}

uint64_t *NSPredicate.removedFromCloud.unsafeMutableAddressor()
{
  if (qword_32018 != -1) {
    swift_once();
  }
  return &static NSPredicate.removedFromCloud;
}

uint64_t sub_16658()
{
  sub_1791C();
  uint64_t result = sub_23FF0();
  static NSPredicate.notRemovedFromCloud = result;
  return result;
}

id static NSPredicate.notRemovedFromCloud.getter()
{
  return sub_178D0(&qword_32010, (void **)&static NSPredicate.notRemovedFromCloud);
}

uint64_t sub_166D0()
{
  sub_1791C();
  uint64_t result = sub_23FF0();
  static NSPredicate.removedFromCloud = result;
  return result;
}

id static NSPredicate.removedFromCloud.getter()
{
  return sub_178D0(&qword_32018, (void **)&static NSPredicate.removedFromCloud);
}

uint64_t sub_16748()
{
  sub_1791C();
  uint64_t result = sub_23FF0();
  static NSPredicate.notUploadedToCloud = result;
  return result;
}

id static NSPredicate.notUploadedToCloud.getter()
{
  return sub_178D0(&qword_32020, (void **)&static NSPredicate.notUploadedToCloud);
}

uint64_t sub_167C0()
{
  sub_1791C();
  uint64_t result = sub_23FF0();
  static NSPredicate.entryDateNotNil = result;
  return result;
}

uint64_t *NSPredicate.entryDateNotNil.unsafeMutableAddressor()
{
  if (qword_32028 != -1) {
    swift_once();
  }
  return &static NSPredicate.entryDateNotNil;
}

id static NSPredicate.entryDateNotNil.getter()
{
  return sub_178D0(&qword_32028, (void **)&static NSPredicate.entryDateNotNil);
}

uint64_t sub_16884()
{
  sub_1791C();
  uint64_t result = sub_23FF0();
  static NSPredicate.isDraftEntry = result;
  return result;
}

uint64_t *NSPredicate.isDraftEntry.unsafeMutableAddressor()
{
  if (qword_32030 != -1) {
    swift_once();
  }
  return &static NSPredicate.isDraftEntry;
}

id static NSPredicate.isDraftEntry.getter()
{
  return sub_178D0(&qword_32030, (void **)&static NSPredicate.isDraftEntry);
}

uint64_t sub_16950()
{
  sub_1791C();
  uint64_t result = sub_23FF0();
  static NSPredicate.isNotDraftEntry = result;
  return result;
}

uint64_t *NSPredicate.isNotDraftEntry.unsafeMutableAddressor()
{
  if (qword_32038 != -1) {
    swift_once();
  }
  return &static NSPredicate.isNotDraftEntry;
}

id static NSPredicate.isNotDraftEntry.getter()
{
  return sub_178D0(&qword_32038, (void **)&static NSPredicate.isNotDraftEntry);
}

uint64_t sub_16A14()
{
  sub_1791C();
  uint64_t result = sub_23FF0();
  static NSPredicate.isNotTipEntry = result;
  return result;
}

id static NSPredicate.isNotTipEntry.getter()
{
  return sub_178D0(&qword_32040, (void **)&static NSPredicate.isNotTipEntry);
}

uint64_t sub_16A8C()
{
  sub_1791C();
  sub_82B4(&qword_32770);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_27620;
  *(void *)(v0 + 56) = &type metadata for String;
  unint64_t v1 = sub_1795C();
  *(void *)(v0 + 32) = 0x737465737361;
  *(void *)(v0 + 40) = 0xE600000000000000;
  *(void *)(v0 + 96) = &type metadata for String;
  *(void *)(v0 + 104) = v1;
  *(void *)(v0 + 64) = v1;
  *(void *)(v0 + 72) = 0x6E65646469487369;
  *(void *)(v0 + 80) = 0xE800000000000000;
  uint64_t result = sub_23FF0();
  static NSPredicate.unhiddenAssets = result;
  return result;
}

uint64_t *NSPredicate.unhiddenAssets.unsafeMutableAddressor()
{
  if (qword_32048 != -1) {
    swift_once();
  }
  return &static NSPredicate.unhiddenAssets;
}

id static NSPredicate.unhiddenAssets.getter()
{
  return sub_178D0(&qword_32048, (void **)&static NSPredicate.unhiddenAssets);
}

uint64_t sub_16BC0()
{
  sub_1791C();
  sub_82B4(&qword_32770);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_27620;
  *(void *)(v0 + 56) = &type metadata for String;
  unint64_t v1 = sub_1795C();
  *(void *)(v0 + 32) = 0x676E654C74786574;
  *(void *)(v0 + 40) = 0xEA00000000006874;
  *(void *)(v0 + 96) = &type metadata for String;
  *(void *)(v0 + 104) = v1;
  *(void *)(v0 + 64) = v1;
  *(void *)(v0 + 72) = 0x676E654C74786574;
  *(void *)(v0 + 80) = 0xEA00000000006874;
  uint64_t result = sub_23FF0();
  static NSPredicate.hasNonEmptyText = result;
  return result;
}

uint64_t *NSPredicate.hasNonEmptyText.unsafeMutableAddressor()
{
  if (qword_32050 != -1) {
    swift_once();
  }
  return &static NSPredicate.hasNonEmptyText;
}

id static NSPredicate.hasNonEmptyText.getter()
{
  return sub_178D0(&qword_32050, (void **)&static NSPredicate.hasNonEmptyText);
}

uint64_t sub_16CE8()
{
  sub_1791C();
  sub_82B4(&qword_32770);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_27570;
  *(void *)(v0 + 56) = &type metadata for String;
  *(void *)(v0 + 64) = sub_1795C();
  *(void *)(v0 + 32) = 0x656C746974;
  *(void *)(v0 + 40) = 0xE500000000000000;
  uint64_t result = sub_23FF0();
  static NSPredicate.hasNonEmptyTitle = result;
  return result;
}

uint64_t *NSPredicate.hasNonEmptyTitle.unsafeMutableAddressor()
{
  if (qword_32058 != -1) {
    swift_once();
  }
  return &static NSPredicate.hasNonEmptyTitle;
}

id static NSPredicate.hasNonEmptyTitle.getter()
{
  return sub_178D0(&qword_32058, (void **)&static NSPredicate.hasNonEmptyTitle);
}

void sub_16DF8()
{
  sub_82B4(&qword_32718);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_277A0;
  if (qword_32010 != -1) {
    swift_once();
  }
  unint64_t v1 = (void *)static NSPredicate.notRemovedFromCloud;
  *(void *)(v0 + 32) = static NSPredicate.notRemovedFromCloud;
  uint64_t v2 = qword_32038;
  id v3 = v1;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = (void *)static NSPredicate.isNotDraftEntry;
  *(void *)(v0 + 40) = static NSPredicate.isNotDraftEntry;
  uint64_t v5 = qword_32040;
  id v6 = v4;
  if (v5 != -1) {
    swift_once();
  }
  id v7 = (void *)static NSPredicate.isNotTipEntry;
  *(void *)(v0 + 48) = static NSPredicate.isNotTipEntry;
  sub_23FB0();
  sub_1791C();
  id v8 = v7;
  Class isa = sub_23F90().super.isa;
  swift_bridgeObjectRelease();
  id v10 = [self andPredicateWithSubpredicates:isa];

  static NSPredicate.allJournalEntries = (uint64_t)v10;
}

uint64_t *NSPredicate.allJournalEntries.unsafeMutableAddressor()
{
  if (qword_32060 != -1) {
    swift_once();
  }
  return &static NSPredicate.allJournalEntries;
}

id static NSPredicate.allJournalEntries.getter()
{
  return sub_178D0(&qword_32060, (void **)&static NSPredicate.allJournalEntries);
}

void sub_16FE4()
{
  sub_82B4(&qword_32718);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_277A0;
  if (qword_32048 != -1) {
    swift_once();
  }
  unint64_t v1 = (void *)static NSPredicate.unhiddenAssets;
  *(void *)(v0 + 32) = static NSPredicate.unhiddenAssets;
  uint64_t v2 = qword_32050;
  id v3 = v1;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = (void *)static NSPredicate.hasNonEmptyText;
  *(void *)(v0 + 40) = static NSPredicate.hasNonEmptyText;
  uint64_t v5 = qword_32058;
  id v6 = v4;
  if (v5 != -1) {
    swift_once();
  }
  id v7 = (void *)static NSPredicate.hasNonEmptyTitle;
  *(void *)(v0 + 48) = static NSPredicate.hasNonEmptyTitle;
  sub_23FB0();
  sub_1791C();
  id v8 = v7;
  Class isa = sub_23F90().super.isa;
  swift_bridgeObjectRelease();
  id v10 = [self orPredicateWithSubpredicates:isa];

  static NSPredicate.entryNotBlanuint64_t k = (uint64_t)v10;
}

uint64_t *NSPredicate.entryNotBlank.unsafeMutableAddressor()
{
  if (qword_32068 != -1) {
    swift_once();
  }
  return &static NSPredicate.entryNotBlank;
}

id static NSPredicate.entryNotBlank.getter()
{
  return sub_178D0(&qword_32068, (void **)&static NSPredicate.entryNotBlank);
}

void sub_171D0()
{
  sub_82B4(&qword_32718);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_277E0;
  if (qword_32068 != -1) {
    swift_once();
  }
  unint64_t v1 = (void *)static NSPredicate.entryNotBlank;
  *(void *)(v0 + 32) = static NSPredicate.entryNotBlank;
  uint64_t v2 = qword_32010;
  id v3 = v1;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = (void *)static NSPredicate.notRemovedFromCloud;
  *(void *)(v0 + 40) = static NSPredicate.notRemovedFromCloud;
  uint64_t v5 = qword_32028;
  id v6 = v4;
  if (v5 != -1) {
    swift_once();
  }
  id v7 = (void *)static NSPredicate.entryDateNotNil;
  *(void *)(v0 + 48) = static NSPredicate.entryDateNotNil;
  uint64_t v8 = qword_32040;
  id v9 = v7;
  if (v8 != -1) {
    swift_once();
  }
  id v10 = (void *)static NSPredicate.isNotTipEntry;
  *(void *)(v0 + 56) = static NSPredicate.isNotTipEntry;
  sub_23FB0();
  sub_1791C();
  id v11 = v10;
  Class isa = sub_23F90().super.isa;
  swift_bridgeObjectRelease();
  id v13 = [self andPredicateWithSubpredicates:isa];

  static NSPredicate.validEntries = (uint64_t)v13;
}

uint64_t *NSPredicate.validEntries.unsafeMutableAddressor()
{
  if (qword_32070 != -1) {
    swift_once();
  }
  return &static NSPredicate.validEntries;
}

id static NSPredicate.validEntries.getter()
{
  return sub_178D0(&qword_32070, (void **)&static NSPredicate.validEntries);
}

uint64_t sub_173FC(uint64_t a1)
{
  return sub_175F4(a1, 0x6F7250736465656ELL, 0xEF676E6973736563, &static NSPredicate.attachmentNeedsProcessing);
}

uint64_t *NSPredicate.attachmentNeedsProcessing.unsafeMutableAddressor()
{
  if (qword_32078 != -1) {
    swift_once();
  }
  return &static NSPredicate.attachmentNeedsProcessing;
}

id static NSPredicate.attachmentNeedsProcessing.getter()
{
  return sub_178D0(&qword_32078, (void **)&static NSPredicate.attachmentNeedsProcessing);
}

uint64_t sub_17498()
{
  sub_1791C();
  sub_82B4(&qword_32770);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_27620;
  *(void *)(v0 + 56) = &type metadata for String;
  unint64_t v1 = sub_1795C();
  *(void *)(v0 + 32) = 0x6F7250736465656ELL;
  *(void *)(v0 + 40) = 0xEF676E6973736563;
  *(void *)(v0 + 96) = &type metadata for String;
  *(void *)(v0 + 104) = v1;
  *(void *)(v0 + 64) = v1;
  *(void *)(v0 + 72) = 0x6F7250736465656ELL;
  *(void *)(v0 + 80) = 0xEF676E6973736563;
  uint64_t result = sub_23FF0();
  static NSPredicate.attachmentDoesNotNeedsProcessing = result;
  return result;
}

uint64_t *NSPredicate.attachmentDoesNotNeedsProcessing.unsafeMutableAddressor()
{
  if (qword_32080 != -1) {
    swift_once();
  }
  return &static NSPredicate.attachmentDoesNotNeedsProcessing;
}

id static NSPredicate.attachmentDoesNotNeedsProcessing.getter()
{
  return sub_178D0(&qword_32080, (void **)&static NSPredicate.attachmentDoesNotNeedsProcessing);
}

uint64_t sub_175C8(uint64_t a1)
{
  return sub_175F4(a1, 0x45676E6965427369, 0xED00006465746964, &static NSPredicate.assetIsBeingEdited);
}

uint64_t sub_175F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  sub_1791C();
  sub_82B4(&qword_32770);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_27570;
  *(void *)(v7 + 56) = &type metadata for String;
  *(void *)(v7 + 64) = sub_1795C();
  *(void *)(v7 + 32) = a2;
  *(void *)(v7 + 40) = a3;
  uint64_t result = sub_23FF0();
  *a4 = result;
  return result;
}

uint64_t *NSPredicate.assetIsBeingEdited.unsafeMutableAddressor()
{
  if (qword_32088 != -1) {
    swift_once();
  }
  return &static NSPredicate.assetIsBeingEdited;
}

id static NSPredicate.assetIsBeingEdited.getter()
{
  return sub_178D0(&qword_32088, (void **)&static NSPredicate.assetIsBeingEdited);
}

uint64_t sub_17710()
{
  sub_1791C();
  sub_82B4(&qword_32770);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_27620;
  *(void *)(v0 + 56) = &type metadata for String;
  unint64_t v1 = sub_1795C();
  strcpy((char *)(v0 + 32), "isBeingEdited");
  *(_WORD *)(v0 + 46) = -4864;
  *(void *)(v0 + 96) = &type metadata for String;
  *(void *)(v0 + 104) = v1;
  *(void *)(v0 + 64) = v1;
  strcpy((char *)(v0 + 72), "isBeingEdited");
  *(_WORD *)(v0 + 86) = -4864;
  uint64_t result = sub_23FF0();
  static NSPredicate.attachmentAssetIsNotBeingEdited = result;
  return result;
}

uint64_t *NSPredicate.attachmentAssetIsNotBeingEdited.unsafeMutableAddressor()
{
  if (qword_32090 != -1) {
    swift_once();
  }
  return &static NSPredicate.attachmentAssetIsNotBeingEdited;
}

id static NSPredicate.attachmentAssetIsNotBeingEdited.getter()
{
  return sub_178D0(&qword_32090, (void **)&static NSPredicate.attachmentAssetIsNotBeingEdited);
}

uint64_t sub_17840(uint64_t a1)
{
  return sub_175F4(a1, 0x6E65646469487369, 0xE800000000000000, &static NSPredicate.assetIsHidden);
}

uint64_t *NSPredicate.assetIsHidden.unsafeMutableAddressor()
{
  if (qword_32098 != -1) {
    swift_once();
  }
  return &static NSPredicate.assetIsHidden;
}

id static NSPredicate.assetIsHidden.getter()
{
  return sub_178D0(&qword_32098, (void **)&static NSPredicate.assetIsHidden);
}

id sub_178D0(void *a1, void **a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  id v3 = *a2;
  return v3;
}

unint64_t sub_1791C()
{
  unint64_t result = qword_32720;
  if (!qword_32720)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_32720);
  }
  return result;
}

unint64_t sub_1795C()
{
  unint64_t result = qword_32778;
  if (!qword_32778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_32778);
  }
  return result;
}

uint64_t sub_179B0()
{
  uint64_t v0 = sub_23E30();
  sub_82F8(v0, qword_32780);
  uint64_t v1 = sub_827C(v0, (uint64_t)qword_32780);
  if (qword_31FD0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_827C(v0, (uint64_t)qword_32E08);
  id v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

void sub_17A78(void *a1, uint64_t a2, uint64_t a3)
{
  id v7 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v8 = sub_23EB0();
  id v9 = [v7 initWithEntityName:v8];

  id v10 = (void *)swift_allocObject();
  v10[2] = a1;
  v10[3] = v9;
  v10[4] = a2;
  v10[5] = a3;
  v10[6] = v3;
  v15[4] = sub_17FE0;
  v15[5] = v10;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 1107296256;
  v15[2] = sub_1A290;
  v15[3] = &unk_2D1D8;
  id v11 = _Block_copy(v15);
  id v12 = a1;
  id v13 = v9;
  swift_retain();
  id v14 = v3;
  swift_release();
  [v12 performBlock:v11];
  _Block_release(v11);
}

unint64_t sub_17BD0(void *a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  type metadata accessor for JournalEntryAssetMO();
  unint64_t result = sub_240D0();
  unint64_t v6 = result;
  if (!(result >> 62))
  {
    uint64_t v7 = *(void *)((char *)&dword_10 + (result & 0xFFFFFFFFFFFFFF8));
    if (v7) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return a3(1);
  }
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_24240();
  unint64_t result = swift_bridgeObjectRelease();
  if (!v7) {
    goto LABEL_13;
  }
LABEL_3:
  if (v7 >= 1)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if ((v6 & 0xC000000000000001) != 0) {
        id v9 = (id)sub_241F0();
      }
      else {
        id v9 = *(id *)(v6 + 8 * i + 32);
      }
      id v10 = v9;
      if ([v9 isRemovedFromCloud])
      {
        [a1 deleteObject:v10];
      }
      else
      {
        [v10 setIsUploadedToCloud:0];
        [v10 setRecordSystemFields:0];
      }
    }
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

uint64_t sub_17F90()
{
  swift_release();
  return _swift_deallocObject(v0, 56, 7);
}

unint64_t sub_17FE0()
{
  return sub_17BD0(*(void **)(v0 + 16), *(void *)(v0 + 24), *(uint64_t (**)(uint64_t))(v0 + 32));
}

uint64_t sub_17FF0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_18000()
{
  return swift_release();
}

Swift::Void __swiftcall UIView.removeAllConstraints()()
{
  uint64_t v1 = v0;
  id v2 = [v0 superview];
  if (v2)
  {
    id v3 = v2;
    do
    {
      id v4 = v3;
      id v5 = [v4 constraints];
      sub_8824(0, &qword_32798);
      unint64_t v6 = sub_23FA0();

      if (v6 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v7 = sub_24240();
        swift_bridgeObjectRelease();
        if (!v7) {
          goto LABEL_3;
        }
      }
      else
      {
        uint64_t v7 = *(void *)((char *)&dword_10 + (v6 & 0xFFFFFFFFFFFFFF8));
        if (!v7) {
          goto LABEL_3;
        }
      }
      if (v7 < 1)
      {
        __break(1u);
        return;
      }
      for (uint64_t i = 0; i != v7; ++i)
      {
        if ((v6 & 0xC000000000000001) != 0) {
          id v9 = (id)sub_241F0();
        }
        else {
          id v9 = *(id *)(v6 + 8 * i + 32);
        }
        id v10 = v9;
        if ([v9 firstItem])
        {
          self;
          if (swift_dynamicCastObjCClass())
          {
            sub_8824(0, &qword_327A0);
            if (sub_24140()) {
              [v4 removeConstraint:v10];
            }
          }
          swift_unknownObjectRelease();
        }
        if ([v10 secondItem])
        {
          self;
          if (swift_dynamicCastObjCClass())
          {
            sub_8824(0, &qword_327A0);
            if (sub_24140()) {
              [v4 removeConstraint:v10];
            }
          }
          swift_unknownObjectRelease();
        }
      }
LABEL_3:
      swift_bridgeObjectRelease();
      id v3 = [v4 superview];
    }
    while (v3);
  }
  Class isa = (Class)[v1 constraints];
  if (!isa)
  {
    sub_8824(0, &qword_32798);
    sub_23FA0();
    Class isa = sub_23F90().super.isa;
    swift_bridgeObjectRelease();
  }
  [v1 removeConstraints:isa];

  [v1 setTranslatesAutoresizingMaskIntoConstraints:1];
}

uint64_t sub_18320()
{
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 40, 7);
}

uint64_t type metadata accessor for CloudKitStackConfiguration()
{
  return self;
}

uint64_t sub_18384(char a1)
{
  if (qword_320A8 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_23E30();
  sub_827C(v3, (uint64_t)qword_32868);
  id v4 = v1;
  id v5 = sub_23E10();
  os_log_type_t v6 = sub_24030();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136446466;
    sub_23E00();
    sub_98CC();
    uint64_t v8 = sub_24280();
    sub_9EFC(v8, v9, &v26);
    sub_24170();

    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 1024;
    unsigned __int8 v25 = a1 & 1;
    sub_24170();
    _os_log_impl(&dword_0, v5, v6, "%{public}s (haveData) synced:%{BOOL}d started", (uint8_t *)v7, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v26 = (uint64_t)&_swiftEmptyArrayStorage;
  sub_1791C();
  sub_23FF0();
  sub_23F80();
  if (*(void *)((char *)&dword_10 + (v26 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                 + (v26 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_23FC0();
  sub_23FD0();
  sub_23FB0();
  sub_23FF0();
  sub_23F80();
  if (*(void *)((char *)&dword_10 + (v26 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                 + (v26 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_23FC0();
  sub_23FD0();
  sub_23FB0();
  id v10 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v11 = sub_23EB0();
  id v12 = [v10 initWithEntityName:v11];

  swift_bridgeObjectRetain();
  Class isa = sub_23F90().super.isa;
  swift_bridgeObjectRelease();
  id v14 = [self andPredicateWithSubpredicates:isa];

  [v12 setPredicate:v14];
  id v15 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v16 = sub_23EB0();
  id v17 = [v15 initWithEntityName:v16];

  id v18 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v19 = sub_23EB0();
  id v20 = [v18 initWithEntityName:v19];

  unint64_t v21 = (void *)sub_23FF0();
  [v17 setPredicate:v21];

  id v22 = (void *)sub_23FF0();
  swift_bridgeObjectRelease();
  [v20 setPredicate:v22];

  __chkstk_darwin(v23);
  sub_240B0();

  swift_bridgeObjectRelease();
  return v25;
}

uint64_t sub_188D0()
{
  uint64_t v0 = sub_23E30();
  sub_82F8(v0, qword_32868);
  uint64_t v1 = sub_827C(v0, (uint64_t)qword_32868);
  if (qword_31FD0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_827C(v0, (uint64_t)qword_32E08);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

void sub_18998(void *a1@<X2>, char *a2@<X8>)
{
  type metadata accessor for JournalEntryMO();
  uint64_t v4 = sub_240C0();
  if (!v2)
  {
    uint64_t v13 = v4;
    if (qword_320A8 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_23E30();
    sub_827C(v14, (uint64_t)qword_32868);
    id v15 = a1;
    NSString v16 = sub_23E10();
    os_log_type_t v17 = sub_24030();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = swift_slowAlloc();
      uint64_t v44 = swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 136446722;
      sub_23E00();
      sub_98CC();
      uint64_t v19 = sub_24280();
      sub_9EFC(v19, v20, &v44);
      sub_24170();

      swift_bridgeObjectRelease();
      *(_WORD *)(v18 + 12) = 1024;
      sub_24170();
      *(_WORD *)(v18 + 18) = 2048;
      sub_24170();
      _os_log_impl(&dword_0, v16, v17, "%{public}s (haveData) synced:%{BOOL}d Synced entries:%ld", (uint8_t *)v18, 0x1Cu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      if (v13) {
        goto LABEL_19;
      }
    }
    else
    {

      if (v13) {
        goto LABEL_19;
      }
    }
    type metadata accessor for JournalEntryAssetMO();
    uint64_t v22 = sub_240C0();
    id v23 = v15;
    uint64_t v24 = sub_23E10();
    os_log_type_t v25 = sub_24030();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = swift_slowAlloc();
      uint64_t v44 = swift_slowAlloc();
      *(_DWORD *)uint64_t v26 = 136446722;
      sub_23E00();
      sub_98CC();
      uint64_t v27 = sub_24280();
      sub_9EFC(v27, v28, &v44);
      sub_24170();

      swift_bridgeObjectRelease();
      *(_WORD *)(v26 + 12) = 1024;
      sub_24170();
      *(_WORD *)(v26 + 18) = 2048;
      sub_24170();
      _os_log_impl(&dword_0, v24, v25, "%{public}s (haveData) synced:%{BOOL}d Synced assets:%ld", (uint8_t *)v26, 0x1Cu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    if (!v22)
    {
      type metadata accessor for JournalEntryAssetFileAttachmentMO();
      uint64_t v29 = sub_240C0();
      id v30 = v23;
      id v31 = sub_23E10();
      os_log_type_t v32 = sub_24030();
      if (os_log_type_enabled(v31, v32))
      {
        uint64_t v33 = swift_slowAlloc();
        uint64_t v44 = swift_slowAlloc();
        *(_DWORD *)uint64_t v33 = 136446722;
        sub_23E00();
        sub_98CC();
        uint64_t v34 = sub_24280();
        sub_9EFC(v34, v35, &v44);
        sub_24170();

        swift_bridgeObjectRelease();
        *(_WORD *)(v33 + 12) = 1024;
        sub_24170();
        *(_WORD *)(v33 + 18) = 2048;
        sub_24170();
        _os_log_impl(&dword_0, v31, v32, "%{public}s (haveData) synced:%{BOOL}d Synced attachments:%ld", (uint8_t *)v33, 0x1Cu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      if (!v29)
      {
        id v36 = v30;
        uint64_t v8 = sub_23E10();
        uint64_t v37 = sub_24030();
        if (!os_log_type_enabled(v8, (os_log_type_t)v37))
        {

          goto LABEL_13;
        }
        uint64_t v38 = swift_slowAlloc();
        uint64_t v44 = swift_slowAlloc();
        *(_DWORD *)uint64_t v38 = 136446466;
        sub_23E00();
        sub_98CC();
        uint64_t v39 = sub_24280();
        sub_9EFC(v39, v40, &v44);
        sub_24170();

        swift_bridgeObjectRelease();
        *(_WORD *)(v38 + 12) = 1024;
        sub_24170();
        _os_log_impl(&dword_0, v8, (os_log_type_t)v37, "%{public}s (haveData) synced:%{BOOL}d No sync data found", (uint8_t *)v38, 0x12u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
        goto LABEL_12;
      }
    }
LABEL_19:
    char v21 = 1;
    goto LABEL_20;
  }
  if (qword_320A8 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_23E30();
  sub_827C(v5, (uint64_t)qword_32868);
  id v6 = a1;
  swift_errorRetain();
  id v7 = v6;
  swift_errorRetain();
  uint64_t v8 = sub_23E10();
  os_log_type_t v9 = sub_24020();
  if (!os_log_type_enabled(v8, v9))
  {
    swift_errorRelease();

    swift_errorRelease();
    swift_errorRelease();
LABEL_12:

    goto LABEL_13;
  }
  uint64_t v10 = swift_slowAlloc();
  type = (void *)swift_slowAlloc();
  uint64_t v44 = swift_slowAlloc();
  *(_DWORD *)uint64_t v10 = 136446722;
  sub_23E00();
  sub_98CC();
  uint64_t v11 = sub_24280();
  sub_9EFC(v11, v12, &v44);
  sub_24170();

  swift_bridgeObjectRelease();
  *(_WORD *)(v10 + 12) = 1024;
  sub_24170();
  *(_WORD *)(v10 + 18) = 2112;
  swift_errorRetain();
  uint64_t v43 = _swift_stdlib_bridgeErrorToNSError();
  sub_24170();
  void *type = v43;
  swift_errorRelease();
  swift_errorRelease();
  _os_log_impl(&dword_0, v8, v9, "%{public}s (haveData) synced:%{BOOL}d Unable to get count: %@", (uint8_t *)v10, 0x1Cu);
  sub_82B4(&qword_32530);
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();

  swift_errorRelease();
LABEL_13:
  char v21 = 0;
LABEL_20:
  *a2 = v21;
}

void sub_193C8(char *a1@<X8>)
{
  sub_18998(*(void **)(v1 + 32), a1);
}

uint64_t sub_193F0()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for PersistentCache()
{
  return sub_E338();
}

id static NSUserDefaults.getAppGroupContainerUserDefaults(containerURL:)()
{
  uint64_t v0 = self;
  NSString v1 = sub_23EB0();
  sub_23CC0(v2);
  uint64_t v4 = v3;
  id v5 = [v0 getSharedUserDefaults:v1 containerURL:v3];

  return v5;
}

uint64_t sub_194D0()
{
  uint64_t v0 = sub_23E30();
  sub_82F8(v0, qword_32930);
  uint64_t v1 = sub_827C(v0, (uint64_t)qword_32930);
  if (qword_31FD0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_827C(v0, (uint64_t)qword_32E08);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

void sub_19598(void *a1, uint64_t a2, uint64_t a3)
{
  id v7 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v8 = sub_23EB0();
  id v9 = [v7 initWithEntityName:v8];

  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = a1;
  v10[3] = v9;
  v10[4] = a2;
  v10[5] = a3;
  v10[6] = v3;
  v15[4] = sub_19B00;
  v15[5] = v10;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 1107296256;
  v15[2] = sub_1A290;
  v15[3] = &unk_2D2E0;
  uint64_t v11 = _Block_copy(v15);
  id v12 = a1;
  id v13 = v9;
  swift_retain();
  id v14 = v3;
  swift_release();
  [v12 performBlock:v11];
  _Block_release(v11);
}

unint64_t sub_196F0(void *a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  type metadata accessor for JournalEntryAssetFileAttachmentMO();
  unint64_t result = sub_240D0();
  unint64_t v6 = result;
  if (!(result >> 62))
  {
    uint64_t v7 = *(void *)((char *)&dword_10 + (result & 0xFFFFFFFFFFFFFF8));
    if (v7) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return a3(1);
  }
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_24240();
  unint64_t result = swift_bridgeObjectRelease();
  if (!v7) {
    goto LABEL_13;
  }
LABEL_3:
  if (v7 >= 1)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if ((v6 & 0xC000000000000001) != 0) {
        id v9 = (id)sub_241F0();
      }
      else {
        id v9 = *(id *)(v6 + 8 * i + 32);
      }
      uint64_t v10 = v9;
      if ([v9 isRemovedFromCloud])
      {
        [a1 deleteObject:v10];
      }
      else
      {
        [v10 setIsUploadedToCloud:0];
        [v10 setRecordSystemFields:0];
      }
    }
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

uint64_t sub_19AB0()
{
  swift_release();
  return _swift_deallocObject(v0, 56, 7);
}

unint64_t sub_19B00()
{
  return sub_196F0(*(void **)(v0 + 16), *(void *)(v0 + 24), *(uint64_t (**)(uint64_t))(v0 + 32));
}

uint64_t sub_19B10(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_19B20()
{
  return swift_release();
}

BOOL static DataConfig.UnitsCounterType.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

void DataConfig.UnitsCounterType.hash(into:)(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int DataConfig.UnitsCounterType.hashValue.getter(unsigned __int8 a1)
{
  return sub_24310();
}

BOOL sub_19BA8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_19BC0()
{
  unint64_t result = qword_32948;
  if (!qword_32948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_32948);
  }
  return result;
}

uint64_t _s16UnitsCounterTypeOwet(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s16UnitsCounterTypeOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x19D70);
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

unsigned char *sub_19D98(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for DataConfig.UnitsCounterType()
{
  return &type metadata for DataConfig.UnitsCounterType;
}

uint64_t sub_19DB0()
{
  uint64_t v0 = sub_23E30();
  sub_82F8(v0, qword_32950);
  uint64_t v1 = sub_827C(v0, (uint64_t)qword_32950);
  if (qword_31FE0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_827C(v0, (uint64_t)qword_32E38);
  int v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

void sub_19E78()
{
  uint64_t v1 = sub_23D50();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  unsigned int v4 = (NSURL *)((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = (char *)((char *)&v20 - (char *)v4);
  sub_23CC0(v4);
  BOOL v7 = v6;
  sub_23EE0();
  NSString v8 = sub_23EB0();
  swift_bridgeObjectRelease();
  id v23 = 0;
  unsigned int v9 = [v7 setResourceValue:v8 forKey:NSURLFileProtectionKey error:&v23];

  id v10 = v23;
  if (v9)
  {
    id v11 = v10;
  }
  else
  {
    id v21 = v23;
    id v12 = v23;
    sub_23C40();

    swift_willThrow();
    if (qword_320B8 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_23E30();
    sub_827C(v13, (uint64_t)qword_32950);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v0, v1);
    swift_errorRetain();
    swift_errorRetain();
    id v14 = sub_23E10();
    os_log_type_t v15 = sub_24000();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = swift_slowAlloc();
      unint64_t v20 = (void *)swift_slowAlloc();
      id v21 = (id)swift_slowAlloc();
      id v23 = v21;
      *(_DWORD *)uint64_t v16 = 136315394;
      sub_68E4();
      uint64_t v17 = sub_24280();
      uint64_t v22 = sub_9EFC(v17, v18, (uint64_t *)&v23);
      sub_24170();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
      *(_WORD *)(v16 + 12) = 2112;
      swift_errorRetain();
      uint64_t v19 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v22 = v19;
      sub_24170();
      *unint64_t v20 = v19;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl(&dword_0, v14, v15, "Error setting file protection for %s %@", (uint8_t *)v16, 0x16u);
      sub_82B4(&qword_32530);
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
      (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
      swift_errorRelease();
      swift_errorRelease();
    }
  }
}

uint64_t sub_1A290(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_1A2D4()
{
  uint64_t v1 = v0;
  if (qword_320C0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_23E30();
  sub_827C(v2, (uint64_t)qword_32968);
  uint64_t v3 = sub_23E10();
  os_log_type_t v4 = sub_24030();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_0, v3, v4, "(actionDeleteAllLocalData) started", v5, 2u);
    swift_slowDealloc();
  }

  if (qword_31FC8 != -1) {
    swift_once();
  }
  unsigned int v6 = qword_32E00;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v1;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_1F200;
  *(void *)(v8 + 24) = v7;
  v13[4] = sub_1F660;
  v13[5] = v8;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_1B570;
  v13[3] = &unk_2D618;
  unsigned int v9 = _Block_copy(v13);
  id v10 = v1;
  swift_retain();
  swift_release();
  dispatch_sync(v6, v9);
  _Block_release(v9);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

uint64_t sub_1A50C()
{
  uint64_t v1 = v0;
  if (qword_320C0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_23E30();
  sub_827C(v2, (uint64_t)qword_32968);
  uint64_t v3 = sub_23E10();
  os_log_type_t v4 = sub_24030();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_0, v3, v4, "(actionMakeAllDataNotUploaded) started", v5, 2u);
    swift_slowDealloc();
  }

  if (qword_31FC8 != -1) {
    swift_once();
  }
  unsigned int v6 = qword_32E00;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v1;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_1B7F4;
  *(void *)(v8 + 24) = v7;
  v13[4] = sub_1B80C;
  v13[5] = v8;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_1B570;
  v13[3] = &unk_2D3E8;
  unsigned int v9 = _Block_copy(v13);
  id v10 = v1;
  swift_retain();
  swift_release();
  dispatch_sync(v6, v9);
  _Block_release(v9);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

uint64_t sub_1A744()
{
  uint64_t v0 = sub_23E30();
  sub_82F8(v0, qword_32968);
  uint64_t v1 = sub_827C(v0, (uint64_t)qword_32968);
  if (qword_31FE8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_827C(v0, (uint64_t)qword_32E50);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

void sub_1A81C(void *a1)
{
  sub_1EBCC(1, 0xD000000000000015, 0x8000000000026490);
  type metadata accessor for CoreDataStackShared();
  uint64_t v2 = sub_1F7C4();
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    os_log_type_t v4 = *(void **)(v2 + OBJC_IVAR____TtC21JournalDataclassOwner19CoreDataStackShared_context);
    uint64_t v5 = (void *)swift_allocObject();
    void v5[2] = v3;
    v5[3] = v4;
    v5[4] = a1;
    aBlock[4] = sub_1F21C;
    aBlock[5] = v5;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1A290;
    aBlock[3] = &unk_2D668;
    unsigned int v6 = _Block_copy(aBlock);
    id v7 = v4;
    id v8 = v3;
    id v9 = a1;
    swift_release();
    [v7 performBlock:v6];
    _Block_release(v6);
  }
  else
  {
    if (qword_320C0 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_23E30();
    sub_827C(v10, (uint64_t)qword_32968);
    oslog = sub_23E10();
    os_log_type_t v11 = sub_24020();
    if (os_log_type_enabled(oslog, v11))
    {
      id v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_0, oslog, v11, "(actionDeleteAllLocalData) Unable create coreDataStack", v12, 2u);
      swift_slowDealloc();
    }
  }
}

uint64_t sub_1AA40(void *a1, void *a2, void *a3)
{
  unsigned int v6 = (void *)swift_allocObject();
  v6[2] = a1;
  v6[3] = a2;
  v6[4] = a3;
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  sub_15480(v8, (uint64_t)sub_1F22C, (uint64_t)v6);
  return swift_release();
}

void sub_1AADC(char a1, void *a2, void *a3, void *a4)
{
  if (a1)
  {
    id v7 = (void *)swift_allocObject();
    v7[2] = a2;
    v7[3] = a3;
    v7[4] = a4;
    id v8 = (void *)swift_allocObject();
    v8[2] = a2;
    v8[3] = sub_1F284;
    v8[4] = v7;
    id v9 = a2;
    id v10 = a3;
    id v11 = a4;
    swift_retain();
    sub_8F78(v10, (uint64_t)sub_1F664, (uint64_t)v8);
    swift_release();
    swift_release();
  }
  else
  {
    if (qword_320C0 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_23E30();
    sub_827C(v12, (uint64_t)qword_32968);
    oslog = sub_23E10();
    os_log_type_t v13 = sub_24020();
    if (os_log_type_enabled(oslog, v13))
    {
      id v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v14 = 0;
      _os_log_impl(&dword_0, oslog, v13, "(actionDeleteAllLocalData) Unable to remove all journal entries", v14, 2u);
      swift_slowDealloc();
    }
  }
}

void sub_1ACAC(char a1, uint64_t a2, void *a3, void *a4)
{
  if ((a1 & 1) == 0)
  {
    if (qword_320C0 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_23E30();
    sub_827C(v11, (uint64_t)qword_32968);
    oslog = sub_23E10();
    os_log_type_t v8 = sub_24020();
    if (!os_log_type_enabled(oslog, v8)) {
      goto LABEL_32;
    }
    id v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v9 = 0;
    id v10 = "(actionDeleteAllLocalData) Unable to remove sync metadata";
    goto LABEL_31;
  }
  if (MKBGetDeviceLockState() == 1)
  {
    if (qword_320C0 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_23E30();
    sub_827C(v7, (uint64_t)qword_32968);
    oslog = sub_23E10();
    os_log_type_t v8 = sub_24010();
    if (!os_log_type_enabled(oslog, v8)) {
      goto LABEL_32;
    }
    id v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v9 = 0;
    id v10 = "(actionDeleteAllLocalData) unable to complete actionDeleteAllLocalData, device is locked";
LABEL_31:
    _os_log_impl(&dword_0, oslog, v8, v10, v9, 2u);
    swift_slowDealloc();
LABEL_32:

    return;
  }
  id v12 = [*(id *)(a2 + OBJC_IVAR____TtC21JournalDataclassOwner19CoreDataStackShared_container) viewContext];
  id v13 = [v12 persistentStoreCoordinator];

  if (!v13) {
    goto LABEL_27;
  }
  id v14 = [v13 persistentStores];
  sub_8824(0, &qword_32980);
  unint64_t v15 = sub_23FA0();

  if (!(v15 >> 62))
  {
    uint64_t v16 = *(void *)((char *)&dword_10 + (v15 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRelease();

    if (v16) {
      goto LABEL_14;
    }
LABEL_27:
    if (qword_320C0 != -1) {
      swift_once();
    }
    uint64_t v39 = sub_23E30();
    sub_827C(v39, (uint64_t)qword_32968);
    oslog = sub_23E10();
    os_log_type_t v8 = sub_24010();
    if (!os_log_type_enabled(oslog, v8)) {
      goto LABEL_32;
    }
    id v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v9 = 0;
    id v10 = "(actionDeleteAllLocalData) Database is not open, unable to complete actionDeleteAllLocalData";
    goto LABEL_31;
  }
  swift_bridgeObjectRetain();
  uint64_t v38 = sub_24240();

  swift_bridgeObjectRelease_n();
  if (!v38) {
    goto LABEL_27;
  }
LABEL_14:
  if (*(unsigned char *)(a2 + OBJC_IVAR____TtC21JournalDataclassOwner19CoreDataStackShared_persistentStoresLoadSuccess) != 1) {
    goto LABEL_27;
  }
  aBlock[0] = 0;
  unsigned int v17 = [a3 save:aBlock];
  unint64_t v18 = aBlock[0];
  if (!v17)
  {
LABEL_20:
    uint64_t v26 = v18;
    sub_23C40();

    swift_willThrow();
    uint64_t v27 = (void *)sub_23C30();
    if (qword_320C0 != -1) {
      swift_once();
    }
    uint64_t v28 = sub_23E30();
    sub_827C(v28, (uint64_t)qword_32968);
    id v29 = v27;
    id v30 = sub_23E10();
    os_log_type_t v31 = sub_24020();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = swift_slowAlloc();
      unint64_t v40 = (void *)swift_slowAlloc();
      aBlock[0] = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v32 = 138412546;
      id v33 = v29;
      sub_24170();
      void *v40 = v29;

      *(_WORD *)(v32 + 12) = 2080;
      id v34 = [v33 userInfo];
      sub_23E90();

      uint64_t v35 = sub_23EA0();
      unint64_t v37 = v36;
      swift_bridgeObjectRelease();
      sub_9EFC(v35, v37, (uint64_t *)aBlock);
      sub_24170();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v30, v31, "(actionDeleteAllLocalData) Unresolved error %@, %s", (uint8_t *)v32, 0x16u);
      sub_82B4(&qword_32530);
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
    }
    return;
  }
  uint64_t v19 = qword_31FC8;
  id v20 = aBlock[0];
  if (v19 != -1) {
    swift_once();
  }
  id v21 = qword_32E00;
  unint64_t v18 = (void *)swift_allocObject();
  v18[2] = a4;
  uint64_t v22 = (void *)swift_allocObject();
  v22[2] = sub_1F2F8;
  v22[3] = v18;
  aBlock[4] = sub_1F660;
  aBlock[5] = v22;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_1B570;
  aBlock[3] = &unk_2D758;
  id v23 = _Block_copy(aBlock);
  id v24 = a4;
  swift_retain();
  swift_release();
  dispatch_sync(v21, v23);
  _Block_release(v23);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
    goto LABEL_20;
  }
}

void sub_1B468()
{
  sub_1EBCC(0, 0xD000000000000015, 0x8000000000026490);
  if (qword_320C0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_23E30();
  sub_827C(v0, (uint64_t)qword_32968);
  oslog = sub_23E10();
  os_log_type_t v1 = sub_24030();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_0, oslog, v1, "(actionDeleteAllLocalData) complete success", v2, 2u);
    swift_slowDealloc();
  }
}

uint64_t sub_1B570(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

void sub_1B598(void *a1)
{
  sub_1EBCC(1, 0xD00000000000001ELL, 0x80000000000263D0);
  type metadata accessor for CoreDataStackShared();
  uint64_t v2 = sub_1F7C4();
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    os_log_type_t v4 = *(void **)(v2 + OBJC_IVAR____TtC21JournalDataclassOwner19CoreDataStackShared_context);
    uint64_t v5 = (void *)swift_allocObject();
    void v5[2] = v3;
    v5[3] = v4;
    v5[4] = a1;
    aBlock[4] = sub_1F078;
    aBlock[5] = v5;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1A290;
    aBlock[3] = &unk_2D438;
    unsigned int v6 = _Block_copy(aBlock);
    id v7 = v4;
    id v8 = v3;
    id v9 = a1;
    swift_release();
    [v7 performBlock:v6];
    _Block_release(v6);
  }
  else
  {
    if (qword_320C0 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_23E30();
    sub_827C(v10, (uint64_t)qword_32968);
    oslog = sub_23E10();
    os_log_type_t v11 = sub_24020();
    if (os_log_type_enabled(oslog, v11))
    {
      id v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_0, oslog, v11, "(actionMakeAllDataNotUploaded) Unable create coreDataStack", v12, 2u);
      swift_slowDealloc();
    }
  }
}

uint64_t sub_1B7BC()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_1B7F4()
{
  sub_1B598(*(void **)(v0 + 16));
}

uint64_t sub_1B7FC()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1B80C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1B834(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1B844()
{
  return swift_release();
}

uint64_t sub_1B84C(void *a1, void *a2, void *a3)
{
  unsigned int v6 = (void *)swift_allocObject();
  v6[2] = a1;
  v6[3] = a2;
  v6[4] = a3;
  id v7 = (void *)swift_allocObject();
  v7[2] = a1;
  v7[3] = sub_1F088;
  v7[4] = v6;
  id v8 = a1;
  id v9 = a2;
  id v10 = a3;
  swift_retain();
  sub_8F78(v9, (uint64_t)sub_1F0AC, (uint64_t)v7);
  swift_release();
  return swift_release();
}

void sub_1B934(char a1, void *a2, void *a3, void *a4)
{
  if (a1)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = 0;
    id v8 = (void *)swift_allocObject();
    v8[2] = v7;
    v8[3] = 3;
    v8[4] = a4;
    v8[5] = a3;
    v8[6] = a2;
    swift_retain();
    id v9 = a4;
    id v10 = a3;
    id v11 = a2;
    sub_19598(v10, (uint64_t)sub_1F0CC, (uint64_t)v8);
    swift_release();
    id v12 = (void *)swift_allocObject();
    v12[2] = v7;
    uint64_t v12[3] = 3;
    v12[4] = v9;
    v12[5] = v10;
    v12[6] = v11;
    swift_retain();
    id v13 = v9;
    id v14 = v10;
    id v15 = v11;
    sub_17A78(v14, (uint64_t)sub_1F0F4, (uint64_t)v12);
    swift_release();
    uint64_t v16 = (void *)swift_allocObject();
    v16[2] = v7;
    v16[3] = 3;
    v16[4] = v13;
    v16[5] = v14;
    v16[6] = v15;
    swift_retain();
    id v17 = v13;
    id v18 = v14;
    id v19 = v15;
    sub_14E20(v18, (uint64_t)sub_1F1A8, (uint64_t)v16);
    swift_release();
    swift_release();
  }
  else
  {
    if (qword_320C0 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_23E30();
    sub_827C(v20, (uint64_t)qword_32968);
    oslog = sub_23E10();
    os_log_type_t v21 = sub_24020();
    if (os_log_type_enabled(oslog, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl(&dword_0, oslog, v21, "(actionMakeAllDataNotUploaded) Unable to remove sync metadata", v22, 2u);
      swift_slowDealloc();
    }
  }
}

void sub_1BBC8(void *a1, void *a2, unint64_t isEscapingClosureAtFileLocation, uint64_t a4)
{
  if (MKBGetDeviceLockState() == 1)
  {
    if (qword_320C0 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_23E30();
    sub_827C(v9, (uint64_t)qword_32968);
    swift_bridgeObjectRetain_n();
    id v10 = sub_23E10();
    os_log_type_t v11 = sub_24010();
    if (os_log_type_enabled(v10, v11))
    {
      id v12 = (uint8_t *)swift_slowAlloc();
      aBlock[0] = (id)swift_slowAlloc();
      *(_DWORD *)id v12 = 136315138;
      swift_bridgeObjectRetain();
      sub_9EFC((uint64_t)a2, isEscapingClosureAtFileLocation, (uint64_t *)aBlock);
      sub_24170();
      swift_bridgeObjectRelease_n();
      id v13 = "(actionMakeAllDataNotUploaded) %s, device is locked";
LABEL_26:
      _os_log_impl(&dword_0, v10, v11, v13, v12, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return;
    }
LABEL_27:

    swift_bridgeObjectRelease_n();
    return;
  }
  id v14 = [*(id *)(a4 + OBJC_IVAR____TtC21JournalDataclassOwner19CoreDataStackShared_container) viewContext];
  id v15 = [v14 persistentStoreCoordinator];

  if (!v15) {
    goto LABEL_22;
  }
  id v16 = [v15 persistentStores];
  sub_8824(0, &qword_32980);
  unint64_t v17 = sub_23FA0();

  if (v17 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v39 = sub_24240();

    swift_bridgeObjectRelease_n();
    if (v39) {
      goto LABEL_9;
    }
LABEL_22:
    if (qword_320C0 != -1) {
      swift_once();
    }
    uint64_t v40 = sub_23E30();
    sub_827C(v40, (uint64_t)qword_32968);
    swift_bridgeObjectRetain_n();
    id v10 = sub_23E10();
    os_log_type_t v11 = sub_24010();
    if (os_log_type_enabled(v10, v11))
    {
      id v12 = (uint8_t *)swift_slowAlloc();
      aBlock[0] = (id)swift_slowAlloc();
      *(_DWORD *)id v12 = 136315138;
      swift_bridgeObjectRetain();
      sub_9EFC((uint64_t)a2, isEscapingClosureAtFileLocation, (uint64_t *)aBlock);
      sub_24170();
      swift_bridgeObjectRelease_n();
      id v13 = "(actionMakeAllDataNotUploaded) %s Database is not open";
      goto LABEL_26;
    }
    goto LABEL_27;
  }
  uint64_t v18 = *(void *)((char *)&dword_10 + (v17 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRelease();

  if (!v18) {
    goto LABEL_22;
  }
LABEL_9:
  if (*(unsigned char *)(a4 + OBJC_IVAR____TtC21JournalDataclassOwner19CoreDataStackShared_persistentStoresLoadSuccess) != 1) {
    goto LABEL_22;
  }
  aBlock[0] = 0;
  unsigned int v19 = [a1 save:aBlock];
  uint64_t v20 = aBlock[0];
  if (!v19)
  {
LABEL_15:
    uint64_t v26 = v20;
    sub_23C40();

    swift_willThrow();
    uint64_t v27 = (void *)sub_23C30();
    if (qword_320C0 != -1) {
      swift_once();
    }
    uint64_t v28 = sub_23E30();
    sub_827C(v28, (uint64_t)qword_32968);
    id v29 = v27;
    swift_bridgeObjectRetain_n();
    id v30 = v29;
    os_log_type_t v31 = sub_23E10();
    os_log_type_t v32 = sub_24020();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = swift_slowAlloc();
      uint64_t v41 = (void *)swift_slowAlloc();
      aBlock[0] = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v33 = 136315650;
      swift_bridgeObjectRetain();
      sub_9EFC((uint64_t)a2, isEscapingClosureAtFileLocation, (uint64_t *)aBlock);
      sub_24170();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v33 + 12) = 2112;
      id v34 = v30;
      sub_24170();
      void *v41 = v30;

      *(_WORD *)(v33 + 22) = 2080;
      id v35 = [v34 userInfo];
      sub_23E90();

      uint64_t v36 = sub_23EA0();
      unint64_t v38 = v37;
      swift_bridgeObjectRelease();
      sub_9EFC(v36, v38, (uint64_t *)aBlock);
      sub_24170();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v31, v32, "(actionMakeAllDataNotUploaded) Unresolved error with %s %@, %s", (uint8_t *)v33, 0x20u);
      sub_82B4(&qword_32530);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      swift_errorRelease();
    }
    else
    {
      swift_bridgeObjectRelease_n();

      swift_errorRelease();
    }

    return;
  }
  uint64_t v21 = qword_31FC8;
  id v22 = aBlock[0];
  if (v21 != -1) {
    swift_once();
  }
  id v23 = qword_32E00;
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = v4;
  v20[3] = a2;
  v20[4] = isEscapingClosureAtFileLocation;
  a2 = (void *)swift_allocObject();
  a2[2] = sub_1F1E4;
  a2[3] = v20;
  aBlock[4] = sub_1F660;
  aBlock[5] = a2;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_1B570;
  aBlock[3] = &unk_2D5A0;
  id v24 = _Block_copy(aBlock);
  id v25 = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v23, v24);
  _Block_release(v24);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
    goto LABEL_15;
  }
}

void sub_1C448(char a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, void *a7, const char *a8, const char *a9)
{
  if (a1)
  {
    id v14 = (uint64_t *)(a2 + 16);
    swift_beginAccess();
    uint64_t v15 = *v14 + 1;
    if (!__OFADD__(*v14, 1))
    {
      uint64_t *v14 = v15;
      if (v15 == a3) {
        sub_1BBC8(a5, a7, (unint64_t)a8, a6);
      }
      return;
    }
    __break(1u);
    goto LABEL_13;
  }
  a8 = a9;
  if (qword_320C0 != -1) {
LABEL_13:
  }
    swift_once();
  uint64_t v16 = sub_23E30();
  sub_827C(v16, (uint64_t)qword_32968);
  oslog = sub_23E10();
  os_log_type_t v17 = sub_24020();
  if (os_log_type_enabled(oslog, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl(&dword_0, oslog, v17, a8, v18, 2u);
    swift_slowDealloc();
  }
}

void sub_1C5CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_E430(a2);
  if (!v4)
  {
    unint64_t v9 = v8;
    unint64_t v10 = sub_EB94(a2);
    unint64_t v54 = sub_EE64(a2);
    uint64_t v53 = a3;
    if (qword_320C0 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_23E30();
    sub_827C(v11, (uint64_t)qword_32968);
    swift_bridgeObjectRetain_n();
    id v12 = sub_23E10();
    os_log_type_t v13 = sub_24030();
    if (os_log_type_enabled(v12, v13))
    {
      id v14 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)id v14 = 134217984;
      if (v9 >> 62)
      {
        swift_bridgeObjectRetain();
        sub_24240();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      sub_24170();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v12, v13, "(actionUploadChanges) un-uploaded entries count:%ld", v14, 0xCu);
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    swift_bridgeObjectRetain_n();
    uint64_t v15 = sub_23E10();
    os_log_type_t v16 = sub_24030();
    if (os_log_type_enabled(v15, v16))
    {
      os_log_type_t v17 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v17 = 134217984;
      if (v10 >> 62)
      {
        swift_bridgeObjectRetain();
        sub_24240();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      sub_24170();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v15, v16, "(actionUploadChanges) un-uploaded assets count:%ld", v17, 0xCu);
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    swift_bridgeObjectRetain_n();
    uint64_t v18 = sub_23E10();
    os_log_type_t v19 = sub_24030();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v20 = 134217984;
      if (v54 >> 62)
      {
        swift_bridgeObjectRetain();
        sub_24240();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      sub_24170();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v18, v19, "(actionUploadChanges) un-uploaded attachments count:%ld", v20, 0xCu);
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v21 = sub_1034C(a2);
    sub_10398(a2);
    uint64_t v22 = sub_10968(a2);
    swift_bridgeObjectRetain();
    unint64_t v51 = swift_bridgeObjectRetain();
    sub_1D81C(v51, (uint64_t (*)(uint64_t, void, unint64_t))sub_1DC10);
    unint64_t v23 = swift_bridgeObjectRetain();
    unint64_t v50 = v22;
    unint64_t v24 = v21;
    sub_1D81C(v23, (uint64_t (*)(uint64_t, void, unint64_t))sub_1DC10);
    swift_beginAccess();
    *(void *)(v53 + 16) = v21;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    id v25 = sub_23E10();
    os_log_type_t v26 = sub_24030();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v27 = 134217984;
      if (v24 >> 62)
      {
        swift_bridgeObjectRetain();
        sub_24240();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      sub_24170();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v25, v26, "(actionUploadChanges) will delete %ld entry records", v27, 0xCu);
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    swift_bridgeObjectRetain();
    uint64_t v28 = sub_23E10();
    os_log_type_t v29 = sub_24030();
    if (os_log_type_enabled(v28, v29))
    {
      id v30 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)id v30 = 134217984;
      if (v51 >> 62)
      {
        swift_bridgeObjectRetain();
        sub_24240();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      sub_24170();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v28, v29, "(actionUploadChanges) will delete %ld asset records", v30, 0xCu);
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v52 = (unint64_t *)(a4 + 16);
    swift_bridgeObjectRetain();
    os_log_type_t v31 = sub_23E10();
    os_log_type_t v32 = sub_24030();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v33 = 134217984;
      if (v50 >> 62)
      {
        swift_bridgeObjectRetain();
        sub_24240();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      sub_24170();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v31, v32, "(actionUploadChanges) will delete %ld attachment records", v33, 0xCu);
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    unint64_t v34 = sub_F574(v9);
    swift_bridgeObjectRelease();
    unint64_t v35 = sub_FB50(v10);
    swift_bridgeObjectRelease();
    unint64_t v36 = sub_FB78(v54);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1D81C(v35, (uint64_t (*)(uint64_t, void, unint64_t))sub_1D9F0);
    unint64_t v37 = swift_bridgeObjectRetain();
    sub_1D81C(v37, (uint64_t (*)(uint64_t, void, unint64_t))sub_1D9F0);
    swift_beginAccess();
    *uint64_t v52 = v34;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    unint64_t v38 = sub_23E10();
    os_log_type_t v39 = sub_24030();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v40 = 134217984;
      if (v34 >> 62)
      {
        swift_bridgeObjectRetain();
        sub_24240();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      sub_24170();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v38, v39, "(actionUploadChanges) will upload entry records:%ld", v40, 0xCu);
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    swift_bridgeObjectRetain();
    uint64_t v41 = sub_23E10();
    os_log_type_t v42 = sub_24030();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v43 = 134217984;
      if (v35 >> 62)
      {
        swift_bridgeObjectRetain();
        sub_24240();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      sub_24170();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v41, v42, "(actionUploadChanges) will upload asset records:%ld", v43, 0xCu);
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    swift_bridgeObjectRetain();
    uint64_t v44 = sub_23E10();
    os_log_type_t v45 = sub_24030();
    if (os_log_type_enabled(v44, v45))
    {
      id v46 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)id v46 = 134217984;
      if (v36 >> 62)
      {
        swift_bridgeObjectRetain();
        sub_24240();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      sub_24170();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v44, v45, "(actionUploadChanges) will upload attachments records:%ld", v46, 0xCu);
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    swift_retain();
    swift_retain();
    os_log_type_t v47 = sub_23E10();
    os_log_type_t v48 = sub_24030();
    if (os_log_type_enabled(v47, v48))
    {
      uint64_t v49 = swift_slowAlloc();
      *(_DWORD *)uint64_t v49 = 134218240;
      swift_beginAccess();
      if (*v52 >> 62)
      {
        swift_bridgeObjectRetain();
        sub_24240();
        swift_bridgeObjectRelease();
      }
      sub_24170();
      swift_release();
      *(_WORD *)(v49 + 12) = 2048;
      swift_beginAccess();
      if (*(void *)(v53 + 16) >> 62)
      {
        swift_bridgeObjectRetain();
        sub_24240();
        swift_bridgeObjectRelease();
      }
      sub_24170();
      swift_release();
      _os_log_impl(&dword_0, v47, v48, "(actionUploadChanges) will upload total records:%ld records and will delete total %ld records", (uint8_t *)v49, 0x16u);
      swift_slowDealloc();
    }
    else
    {

      swift_release();
      swift_release();
    }
  }
}

Swift::Int sub_1D3AC(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    swift_errorRetain();
    if (qword_320C0 != -1) {
      swift_once();
    }
    uint64_t v4 = (void *)(a2 + 16);
    uint64_t v5 = sub_23E30();
    sub_827C(v5, (uint64_t)qword_32968);
    swift_errorRetain();
    swift_errorRetain();
    unsigned int v6 = sub_23E10();
    os_log_type_t v7 = sub_24010();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      unint64_t v9 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 138412290;
      swift_errorRetain();
      uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
      sub_24170();
      void *v9 = v15;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl(&dword_0, v6, v7, "(actionUploadChanges) error uploading un-uploaded:%@", v8, 0xCu);
      sub_82B4(&qword_32530);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    swift_beginAccess();
    *uint64_t v4 = a1;
    swift_errorRelease();
  }
  else
  {
    if (qword_320C0 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_23E30();
    sub_827C(v10, (uint64_t)qword_32968);
    uint64_t v11 = sub_23E10();
    os_log_type_t v12 = sub_24030();
    if (os_log_type_enabled(v11, v12))
    {
      os_log_type_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v13 = 0;
      _os_log_impl(&dword_0, v11, v12, "(actionUploadChanges) successfully uploaded un-uploaded", v13, 2u);
      swift_slowDealloc();
    }
  }
  return sub_240A0();
}

void sub_1D654(uint64_t a1, uint64_t a2, unint64_t a3)
{
  sub_1EBCC(0, 0xD00000000000001ELL, 0x80000000000263D0);
  if (qword_320C0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_23E30();
  sub_827C(v5, (uint64_t)qword_32968);
  swift_bridgeObjectRetain_n();
  unsigned int v6 = sub_23E10();
  os_log_type_t v7 = sub_24030();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315138;
    swift_bridgeObjectRetain();
    sub_9EFC(a2, a3, &v9);
    sub_24170();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v6, v7, "(actionMakeAllDataNotUploaded) %s complete success", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_1D81C(unint64_t a1, uint64_t (*a2)(uint64_t, void, unint64_t))
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_24240();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  }
  if (!((unint64_t)*v2 >> 62))
  {
    uint64_t v6 = *(void *)((char *)&dword_10 + (*v2 & 0xFFFFFFFFFFFFFF8));
    uint64_t v7 = v6 + v5;
    if (!__OFADD__(v6, v5)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_24240();
  swift_bridgeObjectRelease();
  uint64_t v7 = v17 + v5;
  if (__OFADD__(v17, v5)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v8 = *v2;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v2 = v8;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v8 & 0x8000000000000000) == 0 && (v8 & 0x4000000000000000) == 0)
    {
      uint64_t v10 = v8 & 0xFFFFFFFFFFFFFF8;
      if (v7 <= *(void *)((char *)&dword_18 + (v8 & 0xFFFFFFFFFFFFFF8)) >> 1) {
        goto LABEL_11;
      }
    }
  }
  if (v8 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_24200();
    swift_bridgeObjectRelease();
    *uint64_t v2 = v11;
    uint64_t v10 = v11 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = a2(v10 + 8 * *(void *)(v10 + 16) + 32, (*(void *)(v10 + 24) >> 1) - *(void *)(v10 + 16), a1);
    if (v13 >= v5) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    sub_24240();
    swift_bridgeObjectRelease();
  }
  if (v13 >= 1)
  {
    uint64_t v14 = *(void *)((char *)&dword_10 + (*v2 & 0xFFFFFFFFFFFFFF8));
    BOOL v15 = __OFADD__(v14, v13);
    uint64_t v16 = v14 + v13;
    if (v15)
    {
      __break(1u);
      return result;
    }
    *(void *)((char *)&dword_10 + (*v2 & 0xFFFFFFFFFFFFFF8)) = v16;
  }
  swift_bridgeObjectRelease();
  return sub_23FB0();
}

uint64_t sub_1D9F0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_24240();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8));
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_24240();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1F43C(&qword_32998, &qword_32990);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_82B4(&qword_32990);
          os_log_type_t v12 = sub_1DE30(v16, i, a3);
          id v14 = *v13;
          ((void (*)(uint64_t (**)(), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8));
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_8824(0, &qword_32700);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_24260();
  __break(1u);
  return result;
}

uint64_t sub_1DC10(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_24240();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8));
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_24240();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1F43C(&qword_329A8, &qword_329A0);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_82B4(&qword_329A0);
          os_log_type_t v12 = sub_1DE9C(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8));
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_8824(0, &qword_326F8);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_24260();
  __break(1u);
  return result;
}

uint64_t (*sub_1DE30(uint64_t (**a1)(), unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_1DF4C(v6, a2, a3);
  return sub_1DE98;
}

uint64_t (*sub_1DE9C(void (**a1)(id *a1), unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_1DFCC(v6, a2, a3);
  return sub_1DE98;
}

void sub_1DF04(void *a1)
{
  os_log_type_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t (*sub_1DF4C(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)sub_241F0();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8)) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_1F69C;
  }
  __break(1u);
  return result;
}

void (*sub_1DFCC(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)sub_241F0();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8)) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_1E04C;
  }
  __break(1u);
  return result;
}

void sub_1E04C(id *a1)
{
}

id sub_1E054(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_82B4(&qword_32608);
  __chkstk_darwin(v4 - 8);
  unint64_t v6 = (char *)v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_23D50();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)v37 - v12;
  sub_D2B0(v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_CF68((uint64_t)v6);
    if (qword_320C0 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_23E30();
    sub_827C(v14, (uint64_t)qword_32968);
    BOOL v15 = sub_23E10();
    os_log_type_t v16 = sub_24010();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_0, v15, v16, "Unable to get homeDir probably Journal app was deleted", v17, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v6, v7);
    if (qword_320C0 != -1) {
      swift_once();
    }
    v37[3] = a1;
    uint64_t v19 = sub_23E30();
    sub_827C(v19, (uint64_t)qword_32968);
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
    uint64_t v20 = sub_23E10();
    os_log_type_t v21 = sub_24030();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      v37[2] = a2;
      uint64_t v38 = v23;
      *(_DWORD *)uint64_t v22 = 136315138;
      v37[1] = v22 + 4;
      sub_68E4();
      uint64_t v24 = sub_24280();
      v37[4] = sub_9EFC(v24, v25, &v38);
      sub_24170();
      swift_bridgeObjectRelease();
      os_log_type_t v26 = *(void (**)(char *, uint64_t))(v8 + 8);
      v26(v11, v7);
      os_log_type_t v27 = v21;
      uint64_t v28 = v26;
      _os_log_impl(&dword_0, v20, v27, "(getSharedKey) fileStorageConfig homeDirectoryURL: %s", v22, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      uint64_t v28 = *(void (**)(char *, uint64_t))(v8 + 8);
      v28(v11, v7);
    }

    os_log_type_t v29 = self;
    NSString v30 = sub_23EB0();
    sub_23CC0(v31);
    uint64_t v33 = v32;
    id v34 = [v29 getSharedUserDefaults:v30 containerURL:v32];

    NSString v35 = sub_23EB0();
    id v18 = [v34 BOOLForKey:v35];

    v28(v13, v7);
  }
  return v18;
}

void sub_1E4FC()
{
  if (sub_1E054(0xD000000000000015, 0x8000000000026490))
  {
    if (qword_320C0 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_23E30();
    sub_827C(v1, (uint64_t)qword_32968);
    uint64_t v2 = sub_23E10();
    os_log_type_t v3 = sub_24030();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_0, v2, v3, "(actionUploadChanges) deleteAllOnNextLaunch is already set", v4, 2u);
      swift_slowDealloc();
    }

    return;
  }
  type metadata accessor for CoreDataStackShared();
  uint64_t v5 = sub_1F7C4();
  if (v5)
  {
    unint64_t v6 = (void *)v5;
    id v7 = *(id *)(v5 + OBJC_IVAR____TtC21JournalDataclassOwner19CoreDataStackShared_context);
    dispatch_semaphore_t v33 = dispatch_semaphore_create(0);
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = &_swiftEmptyArrayStorage;
    uint64_t v9 = (unint64_t *)(v8 + 16);
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = &_swiftEmptyArrayStorage;
    uint64_t v11 = (uint64_t *)(v10 + 16);
    __chkstk_darwin(v10);
    sub_240B0();
    if (v0)
    {
      swift_release();
      swift_release();

      return;
    }
    os_log_type_t v32 = v6;
    swift_beginAccess();
    unint64_t v17 = *v9;
    if (*v9 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v25 = sub_24240();
      swift_bridgeObjectRelease();
      if (v25) {
        goto LABEL_19;
      }
    }
    else if (*(void *)((char *)&dword_10 + (v17 & 0xFFFFFFFFFFFFFF8)))
    {
LABEL_19:
      os_log_type_t v31 = v7;
      if (qword_31F98 != -1) {
        swift_once();
      }
      id v18 = objc_allocWithZone((Class)type metadata accessor for CloudKitStackShared());
      uint64_t v19 = (void *)swift_retain();
      id v20 = sub_7BEC(v19, (void *)0xD000000000000011, 0x8000000000025920);
      swift_release();
      uint64_t v21 = swift_allocObject();
      *(void *)(v21 + 16) = 0;
      swift_beginAccess();
      uint64_t v22 = *v11;
      uint64_t v23 = swift_allocObject();
      *(void *)(v23 + 16) = v21;
      *(void *)(v23 + 24) = v33;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      uint64_t v24 = v33;
      sub_6A78(v17, v22, (uint64_t)sub_1F434, v23);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      sub_24090();
      swift_beginAccess();
      if (*(void *)(v21 + 16))
      {
        swift_errorRetain();
        swift_willThrow();
      }

      swift_release();
      swift_release();

      swift_release();
      return;
    }
    swift_beginAccess();
    if ((unint64_t)*v11 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v26 = sub_24240();
      swift_bridgeObjectRelease();
      if (v26) {
        goto LABEL_19;
      }
    }
    else if (*(void *)((char *)&dword_10 + (*v11 & 0xFFFFFFFFFFFFFF8)))
    {
      goto LABEL_19;
    }
    if (qword_320C0 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_23E30();
    sub_827C(v27, (uint64_t)qword_32968);
    uint64_t v28 = sub_23E10();
    os_log_type_t v29 = sub_24030();
    if (os_log_type_enabled(v28, v29))
    {
      NSString v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)NSString v30 = 0;
      _os_log_impl(&dword_0, v28, v29, "(actionUploadChanges) nothing to upload", v30, 2u);
      swift_slowDealloc();
      swift_release();
      swift_release();
    }
    else
    {
      swift_release();
      swift_release();
    }
  }
  else
  {
    if (qword_320C0 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_23E30();
    sub_827C(v12, (uint64_t)qword_32968);
    uint64_t v13 = sub_23E10();
    os_log_type_t v14 = sub_24020();
    if (os_log_type_enabled(v13, v14))
    {
      BOOL v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)BOOL v15 = 0;
      _os_log_impl(&dword_0, v13, v14, "(actionUploadChanges) Unable create coreDataStack", v15, 2u);
      swift_slowDealloc();
    }

    sub_1F310();
    swift_allocError();
    *(void *)uint64_t v16 = 0xD000000000000024;
    *(void *)(v16 + 8) = 0x80000000000264B0;
    *(unsigned char *)(v16 + 16) = 1;
    swift_willThrow();
  }
}

void sub_1EBCC(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_82B4(&qword_32608);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_23D50();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  BOOL v15 = (char *)v36 - v14;
  sub_D2B0(v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_CF68((uint64_t)v8);
    if (qword_320C0 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_23E30();
    sub_827C(v16, (uint64_t)qword_32968);
    unint64_t v17 = sub_23E10();
    os_log_type_t v18 = sub_24010();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_0, v17, v18, "Unable to get homeDir probably Journal app was deleted", v19, 2u);
      swift_slowDealloc();
    }
  }
  else
  {
    v36[1] = a2;
    int v37 = a1;
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v15, v8, v9);
    if (qword_320C0 != -1) {
      swift_once();
    }
    v36[2] = a3;
    uint64_t v20 = sub_23E30();
    sub_827C(v20, (uint64_t)qword_32968);
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
    uint64_t v21 = sub_23E10();
    os_log_type_t v22 = sub_24030();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v39 = swift_slowAlloc();
      *(_DWORD *)uint64_t v23 = 136315138;
      v36[0] = v23 + 4;
      sub_68E4();
      uint64_t v24 = sub_24280();
      uint64_t v38 = sub_9EFC(v24, v25, &v39);
      sub_24170();
      swift_bridgeObjectRelease();
      uint64_t v26 = *(void (**)(char *, uint64_t))(v10 + 8);
      v26(v13, v9);
      uint64_t v27 = v26;
      _os_log_impl(&dword_0, v21, v22, "(setSharedKey) fileStorageConfig homeDirectoryURL: %s", v23, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      uint64_t v28 = *(void (**)(char *, uint64_t))(v10 + 8);
      v28(v13, v9);
      uint64_t v27 = v28;
    }

    os_log_type_t v29 = self;
    NSString v30 = sub_23EB0();
    sub_23CC0(v31);
    dispatch_semaphore_t v33 = v32;
    id v34 = [v29 getSharedUserDefaults:v30 containerURL:v32];

    NSString v35 = sub_23EB0();
    [v34 setBool:v37 & 1 forKey:v35];

    v27(v15, v9);
  }
}

uint64_t sub_1F078()
{
  return sub_1B84C(v0[2], v0[3], v0[4]);
}

void sub_1F088(char a1)
{
  sub_1B934(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_1F094()
{
  return sub_1F2A8((void (*)(void))&_swift_release);
}

void sub_1F0AC(void *a1)
{
  sub_9500(a1, *(void **)(v1 + 16), *(void (**)(uint64_t))(v1 + 24));
}

uint64_t sub_1F0B8()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_1F0CC(char a1)
{
}

void sub_1F0F4(char a1)
{
}

void sub_1F118(char a1, void *a2, const char *a3, const char *a4)
{
  sub_1C448(a1, *(void *)(v4 + 16), *(void *)(v4 + 24), *(void *)(v4 + 32), *(void **)(v4 + 40), *(void *)(v4 + 48), a2, a3, a4);
}

uint64_t sub_1F158()
{
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

void sub_1F1A8(char a1)
{
}

uint64_t sub_1F1CC()
{
  return sub_1F2A8((void (*)(void))&_swift_bridgeObjectRelease);
}

void sub_1F1E4()
{
  sub_1D654(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_1F1F0()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_1F200()
{
  sub_1A81C(*(void **)(v0 + 16));
}

uint64_t sub_1F208()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1F21C()
{
  return sub_1AA40(v0[2], v0[3], v0[4]);
}

void sub_1F22C(char a1)
{
  sub_1AADC(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_1F23C()
{
  return _swift_deallocObject(v0, 40, 7);
}

void sub_1F284(char a1)
{
  sub_1ACAC(a1, *(void *)(v1 + 16), *(void **)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t sub_1F290()
{
  return sub_1F2A8((void (*)(void))&_swift_release);
}

uint64_t sub_1F2A8(void (*a1)(void))
{
  a1(*(void *)(v1 + 32));
  return _swift_deallocObject(v1, 40, 7);
}

void sub_1F2F8()
{
}

uint64_t sub_1F300()
{
  return _swift_deallocObject(v0, 32, 7);
}

unint64_t sub_1F310()
{
  unint64_t result = qword_32988;
  if (!qword_32988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_32988);
  }
  return result;
}

uint64_t sub_1F364()
{
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 24, 7);
}

void sub_1F39C()
{
  sub_1C5CC(v0[2], v0[3], v0[4], v0[5]);
}

uint64_t sub_1F3BC()
{
  swift_errorRelease();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1F3F4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

Swift::Int sub_1F434(uint64_t a1)
{
  return sub_1D3AC(a1, *(void *)(v1 + 16));
}

uint64_t sub_1F43C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_C568(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1F490()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for DataClassActionsError()
{
  return sub_1F4A8();
}

uint64_t sub_1F4A8()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s21JournalDataclassOwner21DataClassActionsErrorOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_1F490();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for DataClassActionsError(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_1F490();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_1F4A8();
  return a1;
}

__n128 initializeWithTake for DataClassActionsError(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for DataClassActionsError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_1F4A8();
  return a1;
}

uint64_t getEnumTagSinglePayload for DataClassActionsError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DataClassActionsError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1F63C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_1F644(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for DataClassActionsError()
{
  return &type metadata for DataClassActionsError;
}

BOOL static SharedDeviceInfoProvider.isDeviceLocked()()
{
  return MKBGetDeviceLockState() == 1;
}

id SharedDeviceInfoProvider.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return [v1 init];
}

id SharedDeviceInfoProvider.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SharedDeviceInfoProvider();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for SharedDeviceInfoProvider()
{
  return self;
}

id SharedDeviceInfoProvider.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SharedDeviceInfoProvider();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1F7C4()
{
  uint64_t v0 = sub_82B4(&qword_32608);
  uint64_t v1 = __chkstk_darwin(v0 - 8);
  unsigned int v3 = (char *)&v57 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v1);
  char v5 = (char *)&v57 - v4;
  uint64_t v6 = sub_23D50();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v65 = (char *)&v57 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  BOOL v15 = (char *)&v57 - v14;
  uint64_t v16 = __chkstk_darwin(v13);
  os_log_type_t v18 = (char *)&v57 - v17;
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v57 - v19;
  if (qword_31F98 != -1) {
    swift_once();
  }
  uint64_t v21 = *(void *)(qword_32DF0 + 16);
  swift_retain();
  sub_222B4((uint64_t)v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_CF68((uint64_t)v5);
    if (qword_320C8 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_23E30();
    sub_827C(v22, (uint64_t)qword_329D8);
    uint64_t v23 = sub_23E10();
    os_log_type_t v24 = sub_24010();
    if (os_log_type_enabled(v23, v24))
    {
      unint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v25 = 0;
      _os_log_impl(&dword_0, v23, v24, "(getAppCoreDataInstance) unable to get getJournalAppURL", v25, 2u);
      swift_slowDealloc();
      swift_release();
    }
    else
    {

      swift_release();
    }
    return 0;
  }
  id v57 = v10;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v20, v5, v6);
  uint64_t v26 = *(void *)(v21 + 24);
  v67[0] = *(void *)(v21 + 16);
  v67[1] = v26;
  swift_bridgeObjectRetain();
  v68._countAndFlagsBits = 0x646D6F6D2ELL;
  v68._object = (void *)0xE500000000000000;
  sub_23F40(v68);
  sub_23CD0();
  swift_bridgeObjectRelease();
  if (qword_320C8 != -1) {
    swift_once();
  }
  os_log_type_t v58 = v3;
  uint64_t v27 = sub_23E30();
  uint64_t v28 = sub_827C(v27, (uint64_t)qword_329D8);
  uint64_t v63 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  uint64_t v64 = v7 + 16;
  v63(v15, v18, v6);
  uint64_t v59 = (uint8_t *)v28;
  os_log_type_t v29 = sub_23E10();
  os_log_type_t v30 = sub_24030();
  BOOL v31 = os_log_type_enabled(v29, v30);
  unint64_t v60 = v20;
  uint64_t v61 = v21;
  unint64_t v62 = v18;
  if (v31)
  {
    os_log_type_t v32 = (uint8_t *)swift_slowAlloc();
    v67[0] = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v32 = 136315138;
    sub_22988((unint64_t *)&qword_323B0, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v33 = sub_24280();
    uint64_t v66 = sub_9EFC(v33, v34, v67);
    sub_24170();
    swift_bridgeObjectRelease();
    NSString v35 = *(void (**)(char *, uint64_t))(v7 + 8);
    v35(v15, v6);
    _os_log_impl(&dword_0, v29, v30, "(getAppCoreDataInstance) modelPathURL:%s", v32, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    os_log_type_t v18 = v62;
    swift_slowDealloc();
  }
  else
  {
    NSString v35 = *(void (**)(char *, uint64_t))(v7 + 8);
    v35(v15, v6);
  }

  id v36 = [self defaultManager];
  sub_23D00(1);
  NSString v37 = sub_23EB0();
  swift_bridgeObjectRelease();
  unsigned int v38 = [v36 fileExistsAtPath:v37];

  if (!v38)
  {
    os_log_type_t v45 = v57;
    v63(v57, v18, v6);
    id v46 = sub_23E10();
    os_log_type_t v47 = sub_24010();
    if (os_log_type_enabled(v46, v47))
    {
      os_log_type_t v48 = (uint8_t *)swift_slowAlloc();
      v67[0] = swift_slowAlloc();
      *(_DWORD *)os_log_type_t v48 = 136315138;
      uint64_t v65 = (char *)(v48 + 4);
      sub_22988((unint64_t *)&qword_323B0, (void (*)(uint64_t))&type metadata accessor for URL);
      uint64_t v49 = sub_24280();
      uint64_t v66 = sub_9EFC(v49, v50, v67);
      sub_24170();
      swift_bridgeObjectRelease();
      v35(v45, v6);
      _os_log_impl(&dword_0, v46, v47, "(getAppCoreDataInstance) File doesn't exist at path modelPathURL:%s", v48, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      swift_release();

      unint64_t v51 = v62;
    }
    else
    {
      swift_release();

      v35(v45, v6);
      unint64_t v51 = v18;
    }
    v35(v51, v6);
    v35(v60, v6);
    return 0;
  }
  uint64_t v39 = v65;
  v63(v65, v18, v6);
  uint64_t v40 = sub_23E10();
  os_log_type_t v41 = sub_24030();
  if (os_log_type_enabled(v40, v41))
  {
    os_log_type_t v42 = (uint8_t *)swift_slowAlloc();
    v67[0] = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v42 = 136315138;
    uint64_t v59 = v42 + 4;
    sub_22988((unint64_t *)&qword_323B0, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v43 = sub_24280();
    uint64_t v66 = sub_9EFC(v43, v44, v67);
    sub_24170();
    swift_bridgeObjectRelease();
    v35(v39, v6);
    _os_log_impl(&dword_0, v40, v41, "(getAppCoreDataInstance) File exists at path modelPathURL:%s", v42, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    v35(v39, v6);
  }

  uint64_t v52 = (uint64_t)v58;
  uint64_t v53 = v62;
  v63(v58, v62, v6);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(v52, 0, 1, v6);
  objc_allocWithZone((Class)type metadata accessor for CoreDataStackShared());
  uint64_t v54 = swift_retain();
  uint64_t v55 = sub_20244(v54, v52);
  swift_release();
  v35(v53, v6);
  v35(v60, v6);
  return v55;
}

uint64_t sub_2017C()
{
  uint64_t v0 = sub_23E30();
  sub_82F8(v0, qword_329D8);
  uint64_t v1 = sub_827C(v0, (uint64_t)qword_329D8);
  if (qword_31FD0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_827C(v0, (uint64_t)qword_32E08);
  unsigned int v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t sub_20244(uint64_t a1, uint64_t a2)
{
  uint64_t v128 = sub_23DC0();
  uint64_t v127 = *(void *)(v128 - 8);
  uint64_t v5 = __chkstk_darwin(v128);
  id v119 = &v112[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v118 = v6;
  __chkstk_darwin(v5);
  uint64_t v135 = &v112[-v7];
  uint64_t v8 = sub_23E00();
  id v132 = *(void **)(v8 - 8);
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v117 = &v112[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = __chkstk_darwin(v9);
  id v125 = &v112[-v12];
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v124 = &v112[-v14];
  uint64_t v116 = v15;
  __chkstk_darwin(v13);
  uint64_t v137 = &v112[-v16];
  uint64_t v17 = sub_82B4(&qword_32608);
  __chkstk_darwin(v17 - 8);
  uint64_t v19 = &v112[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v20 = sub_23D50();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = __chkstk_darwin(v20);
  id v130 = &v112[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v24 = __chkstk_darwin(v22);
  uint64_t v26 = &v112[-v25];
  __chkstk_darwin(v24);
  uint64_t v28 = &v112[-v27];
  os_log_type_t v29 = &v2[OBJC_IVAR____TtC21JournalDataclassOwner19CoreDataStackShared_sessionID];
  os_log_type_t v30 = v2;
  id v121 = v29;
  sub_23DF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56))(&v30[OBJC_IVAR____TtC21JournalDataclassOwner19CoreDataStackShared_customBundleURL], 1, 1, v20);
  unsigned __int16 v131 = v30;
  v30[OBJC_IVAR____TtC21JournalDataclassOwner19CoreDataStackShared_persistentStoresLoadSuccess] = 0;
  uint64_t v136 = a1;
  sub_22BD4();
  uint64_t v126 = a2;
  sub_226B0(a2, (uint64_t)v19);
  int v31 = (*(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20);
  uint64_t v133 = v20;
  id v138 = v28;
  uint64_t v129 = v21;
  uint64_t v134 = v8;
  if (v31 == 1)
  {
    sub_CF68((uint64_t)v19);
    uint64_t v32 = v8;
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v21 + 32))(v26, v19, v20);
    if (qword_320C8 != -1) {
      swift_once();
    }
    uint64_t v33 = sub_23E30();
    sub_827C(v33, (uint64_t)qword_329D8);
    unint64_t v34 = v130;
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v21 + 16))(v130, v26, v20);
    NSString v35 = sub_23E10();
    os_log_type_t v36 = sub_24030();
    if (os_log_type_enabled(v35, v36))
    {
      NSString v37 = (uint8_t *)swift_slowAlloc();
      aBlocuint64_t k = swift_slowAlloc();
      *(_DWORD *)NSString v37 = 136315138;
      sub_22988((unint64_t *)&qword_323B0, (void (*)(uint64_t))&type metadata accessor for URL);
      uint64_t v38 = sub_24280();
      uint64_t v147 = sub_9EFC(v38, v39, &aBlock);
      uint64_t v20 = v133;
      uint64_t v21 = v129;
      sub_24170();
      swift_bridgeObjectRelease();
      (*(void (**)(unsigned char *, uint64_t))(v21 + 8))(v34, v20);
      _os_log_impl(&dword_0, v35, v36, "(sharedCoredataInit) customModelURL assigned :%s", v37, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v28 = v138;
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(unsigned char *, uint64_t))(v21 + 8))(v34, v20);
    }

    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v21 + 40))(v28, v26, v20);
    uint64_t v32 = v134;
  }
  if (qword_320C8 != -1) {
    swift_once();
  }
  uint64_t v40 = sub_23E30();
  id v130 = (unsigned char *)sub_827C(v40, (uint64_t)qword_329D8);
  os_log_type_t v41 = sub_23E10();
  os_log_type_t v42 = sub_24030();
  if (os_log_type_enabled(v41, v42))
  {
    uint64_t v43 = (uint8_t *)swift_slowAlloc();
    aBlocuint64_t k = swift_slowAlloc();
    *(_DWORD *)uint64_t v43 = 136315138;
    swift_beginAccess();
    sub_22988((unint64_t *)&qword_323B0, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v44 = sub_24280();
    uint64_t v147 = sub_9EFC(v44, v45, &aBlock);
    sub_24170();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v41, v42, "(sharedCoredataInit) Using modelURL :%s", v43, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  id v46 = v132;
  swift_beginAccess();
  id v47 = objc_allocWithZone((Class)NSManagedObjectModel);
  sub_23CC0(v48);
  unint64_t v50 = v49;
  id v51 = [v47 initWithContentsOfURL:v49];

  if (v51)
  {
    uint64_t v52 = v136;
    id v53 = objc_allocWithZone((Class)NSPersistentContainer);
    swift_bridgeObjectRetain();
    id v54 = v51;
    NSString v55 = sub_23EB0();
    swift_bridgeObjectRelease();
    id v56 = [v53 initWithName:v55 managedObjectModel:v54];

    id v123 = v54;
    id v57 = &qword_32000;
    os_log_type_t v58 = v131;
    uint64_t v120 = OBJC_IVAR____TtC21JournalDataclassOwner19CoreDataStackShared_container;
    *(void *)&v131[OBJC_IVAR____TtC21JournalDataclassOwner19CoreDataStackShared_container] = v56;
    id v59 = sub_21484(v52);
    sub_82B4(&qword_32718);
    uint64_t v60 = swift_allocObject();
    *(_OWORD *)(v60 + 16) = xmmword_277C0;
    *(void *)(v60 + 32) = v59;
    aBlocuint64_t k = v60;
    sub_23FB0();
    sub_8824(0, &qword_32A38);
    id v61 = v56;
    id v122 = v59;
    Class isa = sub_23F90().super.isa;
    swift_bridgeObjectRelease();
    [v61 setPersistentStoreDescriptions:isa];

    uint64_t v63 = (char *)v46[2];
    uint64_t v64 = v137;
    ((void (*)(unsigned char *, char *, uint64_t))v63)(v137, v121, v32);
    uint64_t v65 = v124;
    id v121 = v63;
    ((void (*)(unsigned char *, unsigned char *, uint64_t))v63)(v124, v64, v32);
    uint64_t v66 = v32;
    id v67 = v58;
    Swift::String v68 = sub_23E10();
    os_log_type_t v69 = sub_24030();
    int v70 = v69;
    if (os_log_type_enabled(v68, v69))
    {
      uint64_t v71 = swift_slowAlloc();
      id v115 = (char *)(v46 + 2);
      uint64_t v72 = v71;
      uint64_t v114 = swift_slowAlloc();
      aBlocuint64_t k = v114;
      *(_DWORD *)uint64_t v72 = 136446466;
      int v113 = v70;
      sub_22988((unint64_t *)&qword_32488, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v73 = sub_24280();
      uint64_t v139 = sub_9EFC(v73, v74, &aBlock);
      sub_24170();
      swift_bridgeObjectRelease();
      uint64_t v124 = (unsigned char *)v46[1];
      ((void (*)(unsigned char *, uint64_t))v124)(v65, v66);
      *(_WORD *)(v72 + 12) = 2080;
      uint64_t v75 = v120;
      id v76 = [*(id *)&v58[v120] name];
      uint64_t v77 = sub_23EE0();
      unint64_t v79 = v78;

      uint64_t v64 = v137;
      uint64_t v80 = v77;
      os_log_type_t v58 = v131;
      uint64_t v139 = sub_9EFC(v80, v79, &aBlock);
      id v57 = &qword_32000;
      sub_24170();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v68, (os_log_type_t)v113, "%{public}s (sharedCoredataInit) -> CoreDataStack init for container %s", (uint8_t *)v72, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      os_log_type_t v81 = v135;
      uint64_t v82 = v75;
    }
    else
    {
      uint64_t v124 = (unsigned char *)v46[1];
      ((void (*)(unsigned char *, uint64_t))v124)(v65, v66);

      os_log_type_t v81 = v135;
      uint64_t v82 = v120;
    }
    sub_23DB0();
    id v83 = [*(id *)&v58[v82] viewContext];
    *(void *)&v67[OBJC_IVAR____TtC21JournalDataclassOwner19CoreDataStackShared_context] = v83;
    aBlocuint64_t k = 1;
    type metadata accessor for NSMergePolicyType(0);
    id v84 = v83;
    [v84 setMergePolicy:sub_242A0()];

    swift_unknownObjectRelease();
    id v85 = (objc_class *)type metadata accessor for CoreDataStackShared();
    v146.receiver = v67;
    v146.super_class = v85;
    id v86 = (char *)objc_msgSendSuper2(&v146, "init");
    int v87 = MKBGetDeviceLockState();
    uint64_t v88 = v125;
    if (v87 == 1)
    {
      uint64_t v89 = v134;
      ((void (*)(unsigned char *, unsigned char *, uint64_t))v121)(v125, v64, v134);
      uint64_t v90 = sub_23E10();
      os_log_type_t v91 = sub_24010();
      if (os_log_type_enabled(v90, v91))
      {
        unint64_t v92 = (uint8_t *)swift_slowAlloc();
        aBlocuint64_t k = swift_slowAlloc();
        *(_DWORD *)unint64_t v92 = 136446210;
        sub_22988((unint64_t *)&qword_32488, (void (*)(uint64_t))&type metadata accessor for UUID);
        uint64_t v93 = sub_24280();
        uint64_t v139 = sub_9EFC(v93, v94, &aBlock);
        sub_24170();
        swift_bridgeObjectRelease();
        unint64_t v95 = (void (*)(unsigned char *, uint64_t))v124;
        ((void (*)(unsigned char *, uint64_t))v124)(v88, v89);
        _os_log_impl(&dword_0, v90, v91, "%{public}s (sharedCoredataInit) SharedDeviceInfoProvider.isDeviceLocked == TRUE, unable to complete CoreDataStackShared initialization.", v92, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        swift_release();
        sub_CF68(v126);
        (*(void (**)(unsigned char *, uint64_t))(v127 + 8))(v135, v128);
        v95(v137, v89);
      }
      else
      {

        swift_release();
        uint64_t v110 = (void (*)(unsigned char *, uint64_t))v124;
        ((void (*)(unsigned char *, uint64_t))v124)(v88, v89);

        sub_CF68(v126);
        (*(void (**)(unsigned char *, uint64_t))(v127 + 8))(v81, v128);
        v110(v64, v89);
      }
    }
    else
    {
      unsigned __int16 v131 = *(char **)&v86[v57[482]];
      unint64_t v96 = v117;
      uint64_t v97 = v134;
      ((void (*)(unsigned char *, unsigned char *, uint64_t))v121)(v117, v64, v134);
      uint64_t v98 = v127;
      unint64_t v99 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v127 + 16);
      uint64_t v100 = v119;
      id v132 = v86;
      uint64_t v101 = v128;
      v99(v119, v81, v128);
      unint64_t v102 = (*((unsigned __int8 *)v46 + 80) + 16) & ~(unint64_t)*((unsigned __int8 *)v46 + 80);
      unint64_t v103 = (v116 + v102 + 7) & 0xFFFFFFFFFFFFFFF8;
      id v104 = v46;
      unint64_t v105 = (*(unsigned __int8 *)(v98 + 80) + v103 + 8) & ~(unint64_t)*(unsigned __int8 *)(v98 + 80);
      uint64_t v106 = swift_allocObject();
      ((void (*)(unint64_t, unsigned char *, uint64_t))v104[4])(v106 + v102, v96, v97);
      *(void *)(v106 + v103) = v132;
      (*(void (**)(unint64_t, unsigned char *, uint64_t))(v98 + 32))(v106 + v105, v100, v101);
      id v144 = sub_2287C;
      uint64_t v145 = v106;
      aBlocuint64_t k = (uint64_t)_NSConcreteStackBlock;
      unint64_t v141 = 1107296256;
      uint64_t v142 = sub_21F90;
      uint64_t v143 = &unk_2D8D8;
      uint64_t v107 = _Block_copy(&aBlock);
      unint64_t v108 = v132;
      swift_release();
      [v131 loadPersistentStoresWithCompletionHandler:v107];

      _Block_release(v107);
      swift_release();
      sub_CF68(v126);
      uint64_t v109 = v101;
      id v86 = (char *)v132;
      (*(void (**)(unsigned char *, uint64_t))(v98 + 8))(v135, v109);
      ((void (*)(unsigned char *, uint64_t))v124)(v137, v97);
    }
    (*(void (**)(unsigned char *, uint64_t))(v129 + 8))(v138, v133);
    return (uint64_t)v86;
  }
  else
  {
    aBlocuint64_t k = 0;
    unint64_t v141 = 0xE000000000000000;
    sub_241C0(35);
    swift_bridgeObjectRelease();
    aBlocuint64_t k = 0xD000000000000021;
    unint64_t v141 = 0x8000000000026610;
    sub_22988((unint64_t *)&qword_323B0, (void (*)(uint64_t))&type metadata accessor for URL);
    v148._countAndFlagsBits = sub_24280();
    sub_23F40(v148);
    swift_bridgeObjectRelease();
    uint64_t result = sub_24230();
    __break(1u);
  }
  return result;
}

id sub_21484(uint64_t a1)
{
  uint64_t v2 = sub_23D50();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(unsigned char *)(a1 + 48) == 1) {
    sub_23C80();
  }
  else {
    sub_22D34();
  }
  id v6 = objc_allocWithZone((Class)NSPersistentStoreDescription);
  sub_23CC0(v7);
  uint64_t v9 = v8;
  id v10 = [v6 initWithURL:v8];

  [v10 setShouldInferMappingModelAutomatically:1];
  [v10 setShouldMigrateStoreAutomatically:1];
  sub_23EE0();
  NSString v11 = sub_23EB0();
  swift_bridgeObjectRelease();
  [v10 setOption:v11 forKey:NSPersistentStoreFileProtectionKey];

  sub_8824(0, (unint64_t *)&unk_32A40);
  Class isa = sub_24130(1).super.super.isa;
  [v10 setOption:isa forKey:NSPersistentHistoryTrackingKey];

  Class v13 = sub_24130(1).super.super.isa;
  [v10 setOption:v13 forKey:NSPersistentStoreRemoteChangeNotificationPostOptionKey];

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v10;
}

void sub_216A4(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, uint64_t a5)
{
  uint64_t v9 = sub_23DC0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_23E00();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v52 - v17;
  if (a2)
  {
    uint64_t v19 = (void *)sub_23C30();
    if (qword_320C8 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_23E30();
    sub_827C(v20, (uint64_t)qword_329D8);
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v18, a3, v13);
    id v21 = v19;
    uint64_t v22 = sub_23E10();
    os_log_type_t v23 = sub_24020();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = v13;
      uint64_t v25 = swift_slowAlloc();
      uint64_t v58 = swift_slowAlloc();
      uint64_t v59 = swift_slowAlloc();
      uint64_t v61 = v59;
      *(_DWORD *)uint64_t v25 = 136446466;
      sub_22988((unint64_t *)&qword_32488, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v26 = sub_24280();
      double v60 = COERCE_DOUBLE(sub_9EFC(v26, v27, &v61));
      sub_24170();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v14 + 8))(v18, v24);
      *(_WORD *)(v25 + 12) = 2112;
      double v60 = *(double *)&v21;
      id v28 = v21;
      sub_24170();
      *(void *)uint64_t v58 = v21;

      _os_log_impl(&dword_0, v22, v23, "%{public}s (sharedCoredataInit) LoadPersistentStores Unresolved error: %@", (uint8_t *)v25, 0x16u);
      sub_82B4(&qword_32530);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v14 + 8))(v18, v13);
    }
  }
  else
  {
    uint64_t v54 = a5;
    uint64_t v55 = v16;
    uint64_t v56 = a3;
    a4[OBJC_IVAR____TtC21JournalDataclassOwner19CoreDataStackShared_persistentStoresLoadSuccess] = 1;
    id v29 = [*(id *)&a4[OBJC_IVAR____TtC21JournalDataclassOwner19CoreDataStackShared_container] viewContext];
    id v30 = [v29 persistentStoreCoordinator];

    if (v30)
    {
      id v31 = [v30 persistentStores];

      sub_8824(0, &qword_32980);
      unint64_t v32 = sub_23FA0();

      if (v32 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v33 = sub_24240();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v33 = *(void *)((char *)&dword_10 + (v32 & 0xFFFFFFFFFFFFFF8));
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v33 = 0;
    }
    id v57 = v12;
    uint64_t v58 = v10;
    if (qword_320C8 != -1) {
      swift_once();
    }
    uint64_t v34 = sub_23E30();
    sub_827C(v34, (uint64_t)qword_329D8);
    NSString v35 = a4;
    os_log_type_t v36 = sub_23E10();
    os_log_type_t v37 = sub_24030();
    BOOL v38 = os_log_type_enabled(v36, v37);
    uint64_t v59 = v9;
    if (v38)
    {
      uint64_t v39 = swift_slowAlloc();
      uint64_t v53 = swift_slowAlloc();
      uint64_t v61 = v53;
      *(_DWORD *)uint64_t v39 = 136446466;
      uint64_t v52 = v39 + 4;
      sub_22988((unint64_t *)&qword_32488, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v40 = sub_24280();
      double v60 = COERCE_DOUBLE(sub_9EFC(v40, v41, &v61));
      sub_24170();

      swift_bridgeObjectRelease();
      *(_WORD *)(v39 + 12) = 2048;
      double v60 = *(double *)&v33;
      sub_24170();
      _os_log_impl(&dword_0, v36, v37, "%{public}s(sharedCoredataInit) persistentStoresCount:%ld", (uint8_t *)v39, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v9 = v59;
      swift_slowDealloc();
    }
    else
    {
    }
    uint64_t v42 = v54;
    uint64_t v43 = v55;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v55, v56, v13);
    unint64_t v45 = v57;
    uint64_t v44 = v58;
    (*(void (**)(char *, uint64_t, uint64_t))(v58 + 16))(v57, v42, v9);
    id v46 = sub_23E10();
    os_log_type_t v47 = sub_24030();
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v48 = swift_slowAlloc();
      uint64_t v56 = swift_slowAlloc();
      uint64_t v61 = v56;
      *(_DWORD *)uint64_t v48 = 136446466;
      uint64_t v54 = v48 + 4;
      sub_22988((unint64_t *)&qword_32488, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v49 = sub_24280();
      double v60 = COERCE_DOUBLE(sub_9EFC(v49, v50, &v61));
      sub_24170();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v43, v13);
      *(_WORD *)(v48 + 12) = 2048;
      sub_23D90();
      double v60 = -v51;
      sub_24170();
      (*(void (**)(char *, uint64_t))(v44 + 8))(v45, v59);
      _os_log_impl(&dword_0, v46, v47, "%{public}s (sharedCoredataInit) container.loadPersistentStores completed in %f seconds.", (uint8_t *)v48, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v43, v13);
      (*(void (**)(char *, uint64_t))(v44 + 8))(v45, v9);
    }
  }
}

void sub_21F90(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(id, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(v7, a3);
  swift_release();
}

id sub_2204C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CoreDataStackShared();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_22124()
{
  return type metadata accessor for CoreDataStackShared();
}

uint64_t type metadata accessor for CoreDataStackShared()
{
  uint64_t result = qword_32A20;
  if (!qword_32A20) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_22178()
{
  sub_23E00();
  if (v0 <= 0x3F)
  {
    sub_2225C();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_2225C()
{
  if (!qword_32A30)
  {
    sub_23D50();
    unint64_t v0 = sub_24160();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_32A30);
    }
  }
}

uint64_t sub_222B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_82B4(&qword_32608);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_23D50();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v22 - v10;
  type metadata accessor for QueryContainer();
  if (qword_320C8 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_23E30();
  uint64_t v13 = sub_827C(v12, (uint64_t)qword_329D8);
  sub_5BC8(0xD000000000000011, 0x8000000000025920, 1, v13, (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_CF68((uint64_t)v4);
    uint64_t v14 = 1;
  }
  else
  {
    uint64_t v23 = a1;
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v11, v4, v5);
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
    uint64_t v15 = sub_23E10();
    os_log_type_t v16 = sub_24030();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      uint64_t v25 = v22;
      *(_DWORD *)uint64_t v17 = 136315138;
      sub_22988((unint64_t *)&qword_323B0, (void (*)(uint64_t))&type metadata accessor for URL);
      uint64_t v18 = sub_24280();
      uint64_t v24 = sub_9EFC(v18, v19, &v25);
      sub_24170();
      swift_bridgeObjectRelease();
      uint64_t v20 = *(void (**)(char *, uint64_t))(v6 + 8);
      v20(v9, v5);
      _os_log_impl(&dword_0, v15, v16, "(getJournalAppURL) appURL: %s", v17, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      uint64_t v20 = *(void (**)(char *, uint64_t))(v6 + 8);
      v20(v9, v5);
    }

    a1 = v23;
    sub_23CD0();
    v20(v11, v5);
    uint64_t v14 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(a1, v14, 1, v5);
}

uint64_t sub_226B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_82B4(&qword_32608);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22718()
{
  uint64_t v1 = sub_23E00();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  unint64_t v5 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = sub_23DC0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v5 + v8 + 8) & ~v8;
  uint64_t v10 = v9 + *(void *)(v7 + 64);
  uint64_t v11 = v3 | v8 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);
  return _swift_deallocObject(v0, v10, v11);
}

void sub_2287C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(sub_23E00() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = *(void *)(sub_23DC0() - 8);
  uint64_t v9 = *(unsigned char **)(v2 + v7);
  uint64_t v10 = v2 + ((v7 + *(unsigned __int8 *)(v8 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  sub_216A4(a1, a2, v2 + v6, v9, v10);
}

uint64_t sub_22970(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_22980()
{
  return swift_release();
}

uint64_t sub_22988(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_229D0()
{
  return swift_initClassMetadata2();
}

char *sub_22A18()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = qword_32A50;
  sub_82B4(&qword_32B68);
  sub_22B94();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  uint64_t v4 = v0;
  *(void *)&v0[v2] = [objc_allocWithZone(ObjCClassFromMetadata) init];

  v7.receiver = v4;
  v7.super_class = ObjectType;
  uint64_t v5 = (char *)objc_msgSendSuper2(&v7, "init");
  [*(id *)&v5[qword_32A50] setCountLimit:500];
  return v5;
}

char *sub_22AD8()
{
  return sub_22A18();
}

uint64_t sub_22AFC(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  swift_unknownObjectRetain();
  id v5 = a1;
  sub_24190();

  swift_unknownObjectRelease();
  return sub_C404((uint64_t)&v7);
}

void sub_22B6C(uint64_t a1)
{
}

uint64_t type metadata accessor for MemoryCache()
{
  return sub_E338();
}

unint64_t sub_22B94()
{
  unint64_t result = qword_32B70;
  if (!qword_32B70)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_32B70);
  }
  return result;
}

uint64_t sub_22BD4()
{
  uint64_t v1 = sub_23D50();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  id v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = [self mainBundle];
  id v6 = [v5 bundleURL];

  sub_23CF0();
  uint64_t v7 = *(void *)(v0 + 24);
  v9[0] = *(void *)(v0 + 16);
  v9[1] = v7;
  swift_bridgeObjectRetain();
  v10._countAndFlagsBits = 0x646D6F6D2ELL;
  v10._object = (void *)0xE500000000000000;
  sub_23F40(v10);
  sub_23CD0();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_22D34()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_23C50();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_23D50();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  Swift::String v10 = (char *)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)v15 - v11;
  if (qword_31F90 != -1) {
    swift_once();
  }
  if (qword_32DE0)
  {
    sub_CBC8(qword_32DD8, (void *)qword_32DE0, (uint64_t)v10);
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for URL.DirectoryHint.inferFromPath(_:), v2);
    sub_8700();
    sub_23D30();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  else
  {
    sub_23CA0();
  }
  uint64_t v13 = *(void *)(v1 + 40);
  v15[0] = *(void *)(v1 + 32);
  v15[1] = v13;
  swift_bridgeObjectRetain();
  v16._countAndFlagsBits = 0x6574696C71732ELL;
  v16._object = (void *)0xE700000000000000;
  sub_23F40(v16);
  sub_23CD0();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v12, v6);
}

uint64_t sub_22FCC()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return _swift_deallocClassInstance(v0, 80, 7);
}

uint64_t type metadata accessor for CoreDataStackConfiguration()
{
  return self;
}

uint64_t type metadata accessor for Journaling()
{
  return self;
}

id SyncDataMO.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  id v5 = [objc_allocWithZone(v2) initWithEntity:a1 insertIntoManagedObjectContext:a2];

  return v5;
}

id JournalEntryAssetAttachmentMO.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for JournalEntryAssetAttachmentMO();
  id v5 = objc_msgSendSuper2(&v7, "initWithEntity:insertIntoManagedObjectContext:", a1, a2);

  return v5;
}

uint64_t type metadata accessor for JournalEntryAssetAttachmentMO()
{
  return self;
}

id JournalEntryAssetAttachmentMO.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JournalEntryAssetAttachmentMO();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id static JournalEntryAssetAttachmentMO.fetchRequest()()
{
  id v0 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v1 = sub_23EB0();
  id v2 = [v0 initWithEntityName:v1];

  return v2;
}

void *sub_2323C()
{
  return &protocol witness table for ObjectIdentifier;
}

uint64_t sub_23248@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for JournalEntryAssetAttachmentMO();
  uint64_t result = sub_241E0();
  *a1 = result;
  return result;
}

id JournalEntryAssetFileAttachmentMO.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for JournalEntryAssetFileAttachmentMO();
  id v5 = objc_msgSendSuper2(&v7, "initWithEntity:insertIntoManagedObjectContext:", a1, a2);

  return v5;
}

uint64_t type metadata accessor for JournalEntryAssetFileAttachmentMO()
{
  return self;
}

id JournalEntryAssetFileAttachmentMO.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JournalEntryAssetFileAttachmentMO();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id static JournalEntryAssetFileAttachmentMO.fetchRequest()()
{
  id v0 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v1 = sub_23EB0();
  id v2 = [v0 initWithEntityName:v1];

  return v2;
}

unint64_t sub_23410()
{
  unint64_t result = qword_32D28;
  if (!qword_32D28)
  {
    sub_C568(&qword_326F0);
    sub_23484();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_32D28);
  }
  return result;
}

unint64_t sub_23484()
{
  unint64_t result = qword_32D30;
  if (!qword_32D30)
  {
    sub_23E00();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_32D30);
  }
  return result;
}

uint64_t sub_234DC@<X0>(uint64_t a1@<X8>)
{
  id v3 = [*v1 id];
  if (v3)
  {
    uint64_t v4 = v3;
    sub_23DE0();

    uint64_t v5 = sub_23E00();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
    uint64_t v7 = v5;
    uint64_t v8 = a1;
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = sub_23E00();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56);
    uint64_t v7 = v10;
    uint64_t v8 = a1;
    uint64_t v9 = 1;
  }
  return v6(v8, v9, 1, v7);
}

id JournalEntryAssetMO.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for JournalEntryAssetMO();
  id v5 = objc_msgSendSuper2(&v7, "initWithEntity:insertIntoManagedObjectContext:", a1, a2);

  return v5;
}

uint64_t type metadata accessor for JournalEntryAssetMO()
{
  return self;
}

id JournalEntryAssetMO.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JournalEntryAssetMO();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id static JournalEntryAssetMO.fetchRequest()()
{
  id v0 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v1 = sub_23EB0();
  id v2 = [v0 initWithEntityName:v1];

  return v2;
}

id JournalEntryMO.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for JournalEntryMO();
  id v5 = objc_msgSendSuper2(&v7, "initWithEntity:insertIntoManagedObjectContext:", a1, a2);

  return v5;
}

uint64_t type metadata accessor for JournalEntryMO()
{
  return self;
}

id JournalEntryMO.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JournalEntryMO();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id static JournalEntryMO.fetchRequest()()
{
  id v0 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v1 = sub_23EB0();
  id v2 = [v0 initWithEntityName:v1];

  return v2;
}

id JournalMO.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for JournalMO();
  id v5 = objc_msgSendSuper2(&v7, "initWithEntity:insertIntoManagedObjectContext:", a1, a2);

  return v5;
}

uint64_t type metadata accessor for JournalMO()
{
  return self;
}

id JournalMO.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JournalMO();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id static JournalMO.fetchRequest()()
{
  id v0 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v1 = sub_23EB0();
  id v2 = [v0 initWithEntityName:v1];

  return v2;
}

id SyncDataMO.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for SyncDataMO();
  id v5 = objc_msgSendSuper2(&v7, "initWithEntity:insertIntoManagedObjectContext:", a1, a2);

  return v5;
}

uint64_t type metadata accessor for SyncDataMO()
{
  return self;
}

id SyncDataMO.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SyncDataMO();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id static SyncDataMO.fetchRequest()()
{
  id v0 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v1 = sub_23EB0();
  id v2 = [v0 initWithEntityName:v1];

  return v2;
}

uint64_t sub_23BAC@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for SyncDataMO();
  uint64_t result = sub_241E0();
  *a1 = result;
  return result;
}

uint64_t sub_23BF0()
{
  return URLResourceValues.isExcludedFromBackup.getter();
}

uint64_t sub_23C00()
{
  return URLResourceValues.isExcludedFromBackup.setter();
}

uint64_t sub_23C10()
{
  return URLResourceValues.init()();
}

uint64_t sub_23C20()
{
  return type metadata accessor for URLResourceValues();
}

uint64_t sub_23C30()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_23C40()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_23C50()
{
  return type metadata accessor for URL.DirectoryHint();
}

uint64_t sub_23C60()
{
  return URL.resourceValues(forKeys:)();
}

uint64_t sub_23C70()
{
  return URL.init(fileURLWithPath:isDirectory:)();
}

uint64_t sub_23C80()
{
  return URL.init(fileURLWithPath:)();
}

uint64_t sub_23C90()
{
  return URL.debugDescription.getter();
}

uint64_t sub_23CA0()
{
  return static URL.libraryDirectory.getter();
}

uint64_t sub_23CB0()
{
  return URL.setResourceValues(_:)();
}

void sub_23CC0(NSURL *retstr@<X8>)
{
}

uint64_t sub_23CD0()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t sub_23CF0()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_23D00(Swift::Bool percentEncoded)
{
  return URL.path(percentEncoded:)(percentEncoded)._countAndFlagsBits;
}

uint64_t sub_23D10()
{
  return URL.path.getter();
}

uint64_t sub_23D20()
{
  return URL.init(string:)();
}

uint64_t sub_23D30()
{
  return URL.appending<A>(components:directoryHint:)();
}

uint64_t sub_23D40()
{
  return URL.appending<A>(path:directoryHint:)();
}

uint64_t sub_23D50()
{
  return type metadata accessor for URL();
}

NSData sub_23D60()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_23D70()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_23D80()
{
  return Data.write(to:options:)();
}

uint64_t sub_23D90()
{
  return Date.timeIntervalSinceNow.getter();
}

uint64_t sub_23DA0()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_23DB0()
{
  return Date.init()();
}

uint64_t sub_23DC0()
{
  return type metadata accessor for Date();
}

uint64_t sub_23DD0()
{
  return UUID.uuidString.getter();
}

uint64_t sub_23DE0()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_23DF0()
{
  return UUID.init()();
}

uint64_t sub_23E00()
{
  return type metadata accessor for UUID();
}

uint64_t sub_23E10()
{
  return Logger.logObject.getter();
}

uint64_t sub_23E20()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_23E30()
{
  return type metadata accessor for Logger();
}

uint64_t sub_23E40()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t sub_23E50()
{
  return static DispatchQoS.background.getter();
}

uint64_t sub_23E60()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_23E70()
{
  return type metadata accessor for DispatchQoS();
}

NSDictionary sub_23E80()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_23E90()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_23EA0()
{
  return Dictionary.description.getter();
}

NSString sub_23EB0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_23EC0()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_23ED0()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_23EE0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_23EF0()
{
  return String.init<A>(describing:)();
}

uint64_t sub_23F00()
{
  return String.utf8CString.getter();
}

uint64_t sub_23F10()
{
  return static String._fromSubstring(_:)();
}

uint64_t sub_23F20()
{
  return String.hash(into:)();
}

uint64_t sub_23F30()
{
  return String.index(_:offsetBy:limitedBy:)();
}

void sub_23F40(Swift::String a1)
{
}

uint64_t sub_23F50()
{
  return String.init(cString:)();
}

Swift::Int sub_23F60()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_23F80()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_23F90()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_23FA0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_23FB0()
{
  return specialized Array._endMutation()();
}

uint64_t sub_23FC0()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_23FD0()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

CKRecordID sub_23FE0(Swift::String recordName, CKRecordZoneID zoneID)
{
  return CKRecordID.init(recordName:zoneID:)(recordName, zoneID);
}

uint64_t sub_23FF0()
{
  return NSPredicate.init(format:_:)();
}

uint64_t sub_24000()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_24010()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_24020()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_24030()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_24040()
{
  return static OS_dispatch_queue.Attributes.concurrent.getter();
}

uint64_t sub_24050()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_24060()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_24070()
{
  return OS_dispatch_queue.sync<A>(execute:)();
}

uint64_t sub_24080()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

void sub_24090()
{
}

Swift::Int sub_240A0()
{
  return OS_dispatch_semaphore.signal()();
}

uint64_t sub_240B0()
{
  return NSManagedObjectContext.performAndWait<A>(_:)();
}

uint64_t sub_240C0()
{
  return NSManagedObjectContext.count<A>(for:)();
}

uint64_t sub_240D0()
{
  return NSManagedObjectContext.fetch<A>(_:)();
}

uint64_t sub_240E0()
{
  return CKRecordKeyValueSetting.subscript.setter();
}

uint64_t sub_240F0()
{
  return CKModifyRecordsOperation.modifyRecordsResultBlock.setter();
}

CKModifyRecordsOperation sub_24100(Swift::OpaquePointer_optional recordsToSave, Swift::OpaquePointer_optional recordIDsToDelete)
{
  return CKModifyRecordsOperation.init(recordsToSave:recordIDsToDelete:)(recordsToSave, recordIDsToDelete);
}

CKRecord sub_24110(Swift::String recordType, CKRecordID recordID)
{
  return CKRecord.init(recordType:recordID:)(recordType, recordID);
}

uint64_t sub_24120()
{
  return CKRecord.subscript.setter();
}

NSNumber sub_24130(Swift::Bool BOOLeanLiteral)
{
  return NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

uint64_t sub_24140()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_24150()
{
  return Optional.debugDescription.getter();
}

uint64_t sub_24160()
{
  return type metadata accessor for Optional();
}

uint64_t sub_24170()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_24180()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_24190()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_241A0()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_241B0()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_241C0(Swift::Int a1)
{
}

uint64_t sub_241D0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_241E0()
{
  return Identifiable<>.id.getter();
}

uint64_t sub_241F0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_24200()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_24210()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_24220()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_24230()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_24240()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_24250()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_24260()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_24280()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_24290()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_242A0()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

uint64_t sub_242B0()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_242C0()
{
  return Error._code.getter();
}

uint64_t sub_242D0()
{
  return Error._domain.getter();
}

uint64_t sub_242E0()
{
  return Error._userInfo.getter();
}

uint64_t sub_242F0()
{
  return Hasher.init(_seed:)();
}

void sub_24300(Swift::UInt a1)
{
}

Swift::Int sub_24310()
{
  return Hasher._finalize()();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

NSString *NSHomeDirectory(void)
{
  return _NSHomeDirectory();
}

uint64_t SFKillProcessNamed()
{
  return _SFKillProcessNamed();
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

uint64_t container_copy_object()
{
  return _container_copy_object();
}

uint64_t container_error_copy_unlocalized_description()
{
  return _container_error_copy_unlocalized_description();
}

uint64_t container_get_identifier()
{
  return _container_get_identifier();
}

uint64_t container_get_path()
{
  return _container_get_path();
}

uint64_t container_query_create()
{
  return _container_query_create();
}

uint64_t container_query_free()
{
  return _container_query_free();
}

uint64_t container_query_get_last_error()
{
  return _container_query_get_last_error();
}

uint64_t container_query_get_single_result()
{
  return _container_query_get_single_result();
}

uint64_t container_query_operation_set_flags()
{
  return _container_query_operation_set_flags();
}

uint64_t container_query_set_class()
{
  return _container_query_set_class();
}

uint64_t container_query_set_group_identifiers()
{
  return _container_query_set_group_identifiers();
}

uint64_t container_query_set_identifiers()
{
  return _container_query_set_identifiers();
}

uint64_t container_query_set_persona_unique_string()
{
  return _container_query_set_persona_unique_string();
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
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

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
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

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

id objc_msgSend__initWithSuiteName_container_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithSuiteName:container:");
}